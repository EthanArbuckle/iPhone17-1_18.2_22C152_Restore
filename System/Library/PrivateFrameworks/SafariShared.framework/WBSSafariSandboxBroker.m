@interface WBSSafariSandboxBroker
- ($115C4C562B26FF47E01F9F4EA65B5887)auditToken;
- (OS_os_log)log;
- (WBSSafariSandboxBroker)initWithPID:(int)a3 auditToken:(id *)a4;
- (int)pid;
@end

@implementation WBSSafariSandboxBroker

- (WBSSafariSandboxBroker)initWithPID:(int)a3 auditToken:(id *)a4
{
  v15.receiver = self;
  v15.super_class = (Class)WBSSafariSandboxBroker;
  v6 = [(WBSSafariSandboxBroker *)&v15 init];
  v7 = (WBSSafariSandboxBroker *)v6;
  if (v6)
  {
    *((_DWORD *)v6 + 2) = a3;
    long long v8 = *(_OWORD *)a4->var0;
    *(_OWORD *)(v6 + 40) = *(_OWORD *)&a4->var0[4];
    *(_OWORD *)(v6 + 24) = v8;
    v9 = [MEMORY[0x1E4F28F80] processInfo];
    id v10 = [v9 processName];
    os_log_t v11 = os_log_create((const char *)[v10 UTF8String], "Sandbox");
    log = v7->_log;
    v7->_log = (OS_os_log *)v11;

    v13 = v7;
  }

  return v7;
}

- (int)pid
{
  return self->_pid;
}

- ($115C4C562B26FF47E01F9F4EA65B5887)auditToken
{
  long long v3 = *(_OWORD *)&self[1].var0[2];
  *(_OWORD *)retstr->var0 = *(_OWORD *)&self->var0[6];
  *(_OWORD *)&retstr->var0[4] = v3;
  return self;
}

- (OS_os_log)log
{
  return self->_log;
}

- (void).cxx_destruct
{
}

@end