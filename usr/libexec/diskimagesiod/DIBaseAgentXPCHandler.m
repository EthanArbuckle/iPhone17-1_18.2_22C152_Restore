@interface DIBaseAgentXPCHandler
- (void)createConnection;
@end

@implementation DIBaseAgentXPCHandler

- (void)createConnection
{
  unsigned int v3 = [(DIBaseXPCHandler *)self isPrivileged];
  v4 = [(DIBaseXPCHandler *)self serviceName];
  v5 = [v4 stringByAppendingString:@".xpc"];

  int v6 = *__error();
  if (sub_1000D29A0())
  {
    v7 = sub_1000D2920();
    os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
    *(_DWORD *)buf = 68158210;
    int v15 = 41;
    __int16 v16 = 2080;
    v17 = "-[DIBaseAgentXPCHandler createConnection]";
    __int16 v18 = 2114;
    v19 = v5;
    v8 = (char *)_os_log_send_and_compose_impl();

    if (v8)
    {
      fprintf(__stderrp, "%s\n", v8);
      free(v8);
    }
  }
  else
  {
    v9 = sub_1000D2920();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 68158210;
      int v15 = 41;
      __int16 v16 = 2080;
      v17 = "-[DIBaseAgentXPCHandler createConnection]";
      __int16 v18 = 2114;
      v19 = v5;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%.*s: Creating connection to %{public}@", buf, 0x1Cu);
    }
  }
  if (v3) {
    uint64_t v10 = 4096;
  }
  else {
    uint64_t v10 = 0;
  }
  *__error() = v6;
  id v11 = [objc_alloc((Class)NSXPCConnection) initWithMachServiceName:v5 options:v10];
  [(DIBaseXPCHandler *)self setConnection:v11];

  [(DIBaseAgentXPCHandler *)self setConnectionMode];
  v12 = [(DIBaseXPCHandler *)self remoteObjectInterface];
  v13 = [(DIBaseXPCHandler *)self connection];
  [v13 setRemoteObjectInterface:v12];
}

@end