REMOTE_HOST ?= user@example.com
REMOTE_PATH ?= /var/www/cinema
REMOTE ?= origin
BRANCH ?= main
INFOHASH ?= c9c47e7b12586a59d83e3e519570835625d44b3e

.PHONY: push ssh-remote-git-pull deploy infohash pushall

push:
	git push $(REMOTE) $(BRANCH)

ssh-remote-git-pull:
	ssh $(REMOTE_HOST) 'set -e; cd $(REMOTE_PATH) && git pull $(REMOTE) $(BRANCH)'

deploy: push ssh-remote-git-pull

pushall: 
	git add index.html debug.html browser-seed.html
	git commit -m ok
	make push

infohash: infohash.txt

infohash.txt:
	echo $(INFOHASH) > $@
