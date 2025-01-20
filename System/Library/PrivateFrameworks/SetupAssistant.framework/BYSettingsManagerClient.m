@interface BYSettingsManagerClient
- (BOOL)hasStashedValuesOnDisk;
- (BYSettingsManagerClient)init;
- (NSXPCConnection)connection;
- (void)_connectToDaemon;
- (void)setConnection:(id)a3;
@end

@implementation BYSettingsManagerClient

- (BYSettingsManagerClient)init
{
  v5.receiver = self;
  v5.super_class = (Class)BYSettingsManagerClient;
  v2 = [(BYSettingsManagerClient *)&v5 init];
  v3 = v2;
  if (v2) {
    [(BYSettingsManagerClient *)v2 _connectToDaemon];
  }
  return v3;
}

- (BOOL)hasStashedValuesOnDisk
{
  v2 = [(BYSettingsManagerClient *)self connection];
  v3 = [v2 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_18];

  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __49__BYSettingsManagerClient_hasStashedValuesOnDisk__block_invoke_2;
  v5[3] = &unk_1E5D2C4B0;
  v5[4] = &v6;
  [v3 hasStashedValuesOnDisk:v5];
  LOBYTE(v2) = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);

  return (char)v2;
}

void __49__BYSettingsManagerClient_hasStashedValuesOnDisk__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = _BYLoggingFacility();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    if (_BYIsInternalInstall())
    {
      int v5 = 0;
      uint64_t v6 = v3;
    }
    else if (v3)
    {
      v7 = NSString;
      v2 = [v3 domain];
      uint64_t v6 = [v7 stringWithFormat:@"<Error domain: %@, code %ld>", v2, objc_msgSend(v3, "code")];
      int v5 = 1;
    }
    else
    {
      int v5 = 0;
      uint64_t v6 = 0;
    }
    *(_DWORD *)buf = 138543362;
    char v9 = v6;
    _os_log_error_impl(&dword_1A7DED000, v4, OS_LOG_TYPE_ERROR, "Unable to retrieve whether or not stashed values exist on disk: %{public}@", buf, 0xCu);
    if (v5)
    {
    }
  }
}

uint64_t __49__BYSettingsManagerClient_hasStashedValuesOnDisk__block_invoke_2(uint64_t result, char a2)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = a2;
  return result;
}

- (void)_connectToDaemon
{
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F29268]) initWithMachServiceName:@"com.apple.purplebuddy.budd.settings.xpc" options:0];
  [(BYSettingsManagerClient *)self setConnection:v3];

  v4 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EFE5A9C0];
  int v5 = [(BYSettingsManagerClient *)self connection];
  [v5 setRemoteObjectInterface:v4];

  uint64_t v6 = [(BYSettingsManagerClient *)self connection];
  [v6 setInvalidationHandler:&__block_literal_global_55];

  v7 = [(BYSettingsManagerClient *)self connection];
  [v7 setInterruptionHandler:&__block_literal_global_58_0];

  id v8 = [(BYSettingsManagerClient *)self connection];
  [v8 resume];
}

void __43__BYSettingsManagerClient__connectToDaemon__block_invoke()
{
  v0 = _BYLoggingFacility();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR)) {
    __43__BYSettingsManagerClient__connectToDaemon__block_invoke_cold_1(v0);
  }
}

void __43__BYSettingsManagerClient__connectToDaemon__block_invoke_56()
{
  v0 = _BYLoggingFacility();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR)) {
    __43__BYSettingsManagerClient__connectToDaemon__block_invoke_56_cold_1(v0);
  }
}

- (NSXPCConnection)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
}

- (void).cxx_destruct
{
}

void __43__BYSettingsManagerClient__connectToDaemon__block_invoke_cold_1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1A7DED000, log, OS_LOG_TYPE_ERROR, "Settings manager client connection invalidated!", v1, 2u);
}

void __43__BYSettingsManagerClient__connectToDaemon__block_invoke_56_cold_1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1A7DED000, log, OS_LOG_TYPE_ERROR, "Settings manager client connection interrupted!", v1, 2u);
}

@end