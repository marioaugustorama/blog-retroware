SHELL=/bin/bash
DOMAIN="retroware.com.br"

ifeq ($(DEBUG), true)
	PREPEND=
	APPEND=
else
	PREPEND=@
	APPEND=1>/dev/null
endif

dev:
	hugo server -w

server:
	hugo server

deploy:
	hugo && \
	rsync -avz --delete public/* fileserver:~/ipfs/
