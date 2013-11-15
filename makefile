.DEFAULT_GOAL:=up
SHELL= /bin/sh
.done/extract:
	scripts/extract.sh
	-touch $@

reset_%:
	rm .done/$*

reset_done:
	rm -f .done/*

_reset_all:
	${EDITOR} .git/modules/fa/info/exclude
	cd fa; git clean -fd; git reset --hard
	cd private; git clean -fd; git reset --hard

reset_all: _reset_all reset_extract .done/extract



up: .done/extract
	vagrant up


down:
	vagrant halt

%: %.gz
	gunzip $< > $@

.done/bootstrap_db:  dumps/bootstrap.sql
	$(call, exec_in_box, mysql -uroot fa < dumps/bootstrap.sql)
	-touch $@

bootstrap_db: .done/bootstrap_db

# Depending of if we are outside a Vagrant Box
# or in a normal environment, certians sh needs to be
# executed normally or send to the box.
# To know if we need to use Vagrant or not
# we just check the existence of the .vagrant file.
ifeq (,$(wilcard .vagrant))
exec_in_box = vagrant ssh -c 'cd /vagrant; $(1)'
else
exec_in_box = $(1)
endif

backup_db:
	$(call exec_in_box, mysqldump -uroot --add-drop-table --dump-date --opt --skip-extended fa > dumps/db.sql)


restore_db:
	i$(call exec_in_box, mysql -uroot  fa <  dumps/db.sql)

