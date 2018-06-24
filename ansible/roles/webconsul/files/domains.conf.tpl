{{ $domains := tree "letsencrypt" | byKey }}{{ range $domain, $pairs := $domains }}
{{ with $cert := printf "letsencrypt/%s/cert" $domain }}
template {
  {{ printf "contents = \"{{ key \\\"%s\\\" }}\"" $cert }}
  destination = "/usr/local/etc/nginx/certs/{{ printf $domain }}.cert.pem"
  command = "service nginx restart"
}
{{ end }}
{{ with $chain := printf "letsencrypt/%s/chain" $domain }}
template {
  {{ printf "contents = \"{{ key \\\"%s\\\" }}\"" $chain }}
  destination = "/usr/local/etc/nginx/certs/{{ printf $domain }}.chain.pem"
  command = "service nginx restart"
}
{{ end }}
{{ with $fullchain := printf "letsencrypt/%s/fullchain" $domain }}
template {
  {{ printf "contents = \"{{ key \\\"%s\\\" }}\"" $fullchain }}
  destination = "/usr/local/etc/nginx/certs/{{ printf $domain }}.fullchain.pem"
  command = "service nginx restart"
}
{{ end }}
{{ with $privkey := printf "letsencrypt/%s/privkey" $domain }}
template {
  {{ printf "contents = \"{{ key \\\"%s\\\" }}\"" $privkey }}
  destination = "/usr/local/etc/nginx/certs/{{ printf $domain }}.privkey.pem"
  command = "service nginx restart"
}
{{ end }}
{{ with $upstream_type := printf "letsencrypt/%s/upstream_type" $domain }}
template {
  {{ printf "contents = \"{{ key \\\"%s\\\" }}\"" $upstream_type }}
  destination = "/tmp/nginx-{{ printf $upstream_type }}.tmp"
  command = "sh -c 'mkdir /usr/local/www/{{ printf $domain }} || true'"
}
{{ end }}{{ end }}
