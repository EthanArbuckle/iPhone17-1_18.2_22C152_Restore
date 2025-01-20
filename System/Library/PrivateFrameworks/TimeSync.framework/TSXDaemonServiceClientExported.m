@interface TSXDaemonServiceClientExported
- (TSXDaemonServiceClient)object;
- (void)daemonClientNotification:(unsigned int)a3 ioResult:(unsigned int)a4 arguments:(ScalarArgsArray *)a5;
- (void)daemonClientRefresh;
- (void)setObject:(id)a3;
@end

@implementation TSXDaemonServiceClientExported

- (void)daemonClientRefresh
{
}

- (void)daemonClientNotification:(unsigned int)a3 ioResult:(unsigned int)a4 arguments:(ScalarArgsArray *)a5
{
  uint64_t v6 = *(void *)&a4;
  uint64_t v7 = *(void *)&a3;
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  v8 = (void *)MEMORY[0x1BA9F1DF0](self, a2);
  if (a5 && a5->var1)
  {
    +[_TSF_IODConnection dispatchNotificationForClientID:ioResult:args:numArgs:](_TSF_IODConnection, "dispatchNotificationForClientID:ioResult:args:numArgs:", v7, v6, a5);
  }
  else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    v9[0] = 67109376;
    v9[1] = v7;
    __int16 v10 = 1024;
    int v11 = v6;
    _os_log_impl(&dword_1BA88B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "TSXDaemonServiceClientExported:daemonClientNotification called with no arguments, client ID %u, result %08x result\n", (uint8_t *)v9, 0xEu);
  }
}

- (TSXDaemonServiceClient)object
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_object);
  return (TSXDaemonServiceClient *)WeakRetained;
}

- (void)setObject:(id)a3
{
}

- (void).cxx_destruct
{
}

@end