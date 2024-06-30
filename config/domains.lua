return {
    ssh_domains = {
        {
            -- The connection is an ssh connection, don't use any multiplexing.
            multiplexing = "None",

            -- The name of this specific domain. Must be unique amongst
            name = "lumiani",

            -- identifies the host:port pair of the remote server
            -- Can be a DNS name or an IP address with an optional
            -- ":port" on the end.
            remote_address = "10.19.126.149:10008",

            -- Whether agent auth should be disabled.
            -- Set to true to disable it.
            -- no_agent_auth = false,

            -- The username to use for authenticating with the remote host
            username = "lumiani",

            -- Specify a SSH connection authentication file
            -- Default authentication file is "~/.ssh/id_rsa"
            ssh_option = {
                identityfile = "~/.ssh/id_rsa",
            },
        },
        {
            -- The connection is an ssh connection, don't use any multiplexing.
            multiplexing = "None",

            -- The name of this specific domain. Must be unique amongst
            name = "yklab",

            -- identifies the host:port pair of the remote server
            -- Can be a DNS name or an IP address with an optional
            -- ":port" on the end.
            remote_address = "10.15.88.71:22307",

            -- Whether agent auth should be disabled.
            -- Set to true to disable it.
            -- no_agent_auth = false,

            -- The username to use for authenticating with the remote host
            username = "root",

            -- Specify a SSH connection authentication file
            -- Default authentication file is "~/.ssh/id_rsa"
            ssh_option = {
                identityfile = "~/.ssh/id_rsa",
            },
        },
    },
    unix_domains = {},
    wsl_domains = {},
}
