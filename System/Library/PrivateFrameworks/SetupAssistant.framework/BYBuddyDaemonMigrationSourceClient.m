@interface BYBuddyDaemonMigrationSourceClient
+ (id)clientInterface;
- (BYBuddyDaemonMigrationSourceClient)init;
- (BYDeviceMigrationDelegate)delegate;
- (NSXPCConnection)connection;
- (void)_connectToDaemon;
- (void)cancel;
- (void)didChangeConnectionInformation:(id)a3;
- (void)didFinishWithError:(id)a3;
- (void)didUpdateProgress:(id)a3;
- (void)launchSetupForMigration;
- (void)registerAsUserInterfaceHost:(id)a3;
- (void)setConnection:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setFileTransferTemplate:(id)a3;
@end

@implementation BYBuddyDaemonMigrationSourceClient

- (BYBuddyDaemonMigrationSourceClient)init
{
  v5.receiver = self;
  v5.super_class = (Class)BYBuddyDaemonMigrationSourceClient;
  v2 = [(BYBuddyDaemonMigrationSourceClient *)&v5 init];
  v3 = v2;
  if (v2) {
    [(BYBuddyDaemonMigrationSourceClient *)v2 _connectToDaemon];
  }
  return v3;
}

+ (id)clientInterface
{
  return (id)[MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EFE571E8];
}

- (void)cancel
{
  id v3 = [(BYBuddyDaemonMigrationSourceClient *)self connection];
  v2 = [v3 remoteObjectProxy];
  [v2 cancel];
}

- (void)registerAsUserInterfaceHost:(id)a3
{
  id v4 = a3;
  id v6 = [(BYBuddyDaemonMigrationSourceClient *)self connection];
  objc_super v5 = [v6 remoteObjectProxy];
  [v5 registerAsUserInterfaceHost:v4];
}

- (void)launchSetupForMigration
{
  id v3 = [(BYBuddyDaemonMigrationSourceClient *)self connection];
  v2 = [v3 remoteObjectProxy];
  [v2 launchSetupForMigration];
}

- (void)setFileTransferTemplate:(id)a3
{
  id v4 = a3;
  id v6 = [(BYBuddyDaemonMigrationSourceClient *)self connection];
  objc_super v5 = [v6 remoteObjectProxy];
  [v5 setFileTransferTemplate:v4];
}

- (void)_connectToDaemon
{
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F29268]) initWithMachServiceName:@"com.apple.purplebuddy.budd.migration.source.xpc" options:0];
  [(BYBuddyDaemonMigrationSourceClient *)self setConnection:v3];

  id v4 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EFE5AA20];
  objc_super v5 = [(BYBuddyDaemonMigrationSourceClient *)self connection];
  [v5 setRemoteObjectInterface:v4];

  id v6 = [(id)objc_opt_class() clientInterface];
  v7 = [(BYBuddyDaemonMigrationSourceClient *)self connection];
  [v7 setExportedInterface:v6];

  v8 = [(BYBuddyDaemonMigrationSourceClient *)self connection];
  [v8 setExportedObject:self];

  v9 = [(BYBuddyDaemonMigrationSourceClient *)self connection];
  [v9 setInvalidationHandler:&__block_literal_global_25];

  v10 = [(BYBuddyDaemonMigrationSourceClient *)self connection];
  [v10 setInterruptionHandler:&__block_literal_global_62_0];

  id v11 = [(BYBuddyDaemonMigrationSourceClient *)self connection];
  [v11 resume];
}

void __54__BYBuddyDaemonMigrationSourceClient__connectToDaemon__block_invoke()
{
  v0 = _BYLoggingFacility();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR)) {
    __54__BYBuddyDaemonMigrationSourceClient__connectToDaemon__block_invoke_cold_1(v0);
  }
}

void __54__BYBuddyDaemonMigrationSourceClient__connectToDaemon__block_invoke_60()
{
  v0 = _BYLoggingFacility();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR)) {
    __54__BYBuddyDaemonMigrationSourceClient__connectToDaemon__block_invoke_60_cold_1(v0);
  }
}

- (void)didUpdateProgress:(id)a3
{
  id v4 = a3;
  id v5 = [(BYBuddyDaemonMigrationSourceClient *)self delegate];
  [v5 deviceMigrationManager:0 didUpdateProgress:v4];
}

- (void)didFinishWithError:(id)a3
{
  id v4 = a3;
  id v5 = [(BYBuddyDaemonMigrationSourceClient *)self delegate];
  [v5 deviceMigrationManager:0 didCompleteWithError:v4];
}

- (void)didChangeConnectionInformation:(id)a3
{
  id v4 = a3;
  id v5 = [(BYBuddyDaemonMigrationSourceClient *)self delegate];
  [v5 deviceMigrationManager:0 didChangeConnectionInformation:v4];
}

- (BYDeviceMigrationDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (BYDeviceMigrationDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
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
  objc_storeStrong((id *)&self->_connection, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

void __54__BYBuddyDaemonMigrationSourceClient__connectToDaemon__block_invoke_cold_1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1A7DED000, log, OS_LOG_TYPE_ERROR, "Migration source client connection invalidated!", v1, 2u);
}

void __54__BYBuddyDaemonMigrationSourceClient__connectToDaemon__block_invoke_60_cold_1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1A7DED000, log, OS_LOG_TYPE_ERROR, "Migration source client connection interruption!", v1, 2u);
}

@end