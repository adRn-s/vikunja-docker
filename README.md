This is mostly a sample configuration, attaching to port 8080 on host. Copy `settings.env.sample` and adjust it accordingly (see compose yaml); together with: firewall settings, DNS, TLS certificates, cronjob for `instant_backup.sh`, off-site Backups, etcetera ...You may also want to run `useradd -u 1000 --system vikunja` once, and add these env-vars to the `settings.env` file: `PUID=1000`, `PGID=1000`. That fixed attachments for us. Good luck!
