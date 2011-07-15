--[[

Luci configuration model for statistics - collectd network plugin configuration
(c) 2008 Freifunk Leipzig / Jo-Philipp Wich <xm@leipzig.freifunk.net>

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

        http://www.apache.org/licenses/LICENSE-2.0

$Id: network.lua 2226 2008-06-01 23:52:07Z jow $

]]--


m = Map("luci_statistics")

-- collectd_network config section
s = m:section( NamedSection, "collectd_network", "luci_statistics" )

-- collectd_network.enable
enable = s:option( Flag, "enable" )
enable.default = 0


-- collectd_network_listen config section (Listen)
listen = m:section( TypedSection, "collectd_network_listen" )
listen.addremove = true
listen.anonymous = true

-- collectd_network_listen.host
listen_host = listen:option( Value, "host" )
listen_host.default = "0.0.0.0"

-- collectd_network_listen.port
listen_port = listen:option( Value, "port" )
listen_port.default   = 25826
listen_port.isinteger = true
listen_port.optional  = true


-- collectd_network_server config section (Server)
server = m:section( TypedSection, "collectd_network_server" )
server.addremove = true
server.anonymous = true

-- collectd_network_server.host
server_host = server:option( Value, "host" )
server_host.default = "0.0.0.0"

-- collectd_network_server.port
server_port = server:option( Value, "port" )
server_port.default   = 25826
server_port.isinteger = true
server_port.optional  = true

-- collectd_network.timetolive (TimeToLive)
ttl = s:option( Value, "TimeToLive" )
ttl.default   = 128
ttl.isinteger = true
ttl.optional  = true
ttl:depends( "enable", 1 )

-- collectd_network.forward (Forward)
forward = s:option( Flag, "Forward" )
forward.default  = 0
forward.optional = true
forward:depends( "enable", 1 )

-- collectd_network.cacheflush (CacheFlush)
cacheflush = s:option( Value, "CacheFlush" )
cacheflush.default   = 86400
cacheflush.isinteger = true
cacheflush.optional  = true
cacheflush:depends( "enable", 1 )


return m