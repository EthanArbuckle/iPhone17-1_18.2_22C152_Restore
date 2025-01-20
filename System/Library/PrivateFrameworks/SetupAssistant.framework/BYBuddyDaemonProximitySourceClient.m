@interface BYBuddyDaemonProximitySourceClient
+ (id)proximitySourceClientInterface;
- (BYBuddyDaemonProximitySourceClient)init;
- (BYBuddyDaemonProximitySourceProtocol)delegate;
- (NSXPCConnection)connection;
- (void)activateWithSharingChannel:(id)a3;
- (void)backupCompletedWithError:(id)a3;
- (void)backupProgress:(double)a3 estimatedTimeRemaining:(int64_t)a4;
- (void)connectToDaemon;
- (void)finishedWithError:(id)a3;
- (void)invalidate;
- (void)receivedData:(id)a3;
- (void)setConnection:(id)a3;
- (void)setDelegate:(id)a3;
- (void)syncCompletedWithErrors:(id)a3;
- (void)syncProgress:(double)a3;
@end

@implementation BYBuddyDaemonProximitySourceClient

- (BYBuddyDaemonProximitySourceClient)init
{
  v5.receiver = self;
  v5.super_class = (Class)BYBuddyDaemonProximitySourceClient;
  v2 = [(BYBuddyDaemonProximitySourceClient *)&v5 init];
  v3 = v2;
  if (v2) {
    [(BYBuddyDaemonProximitySourceClient *)v2 connectToDaemon];
  }
  return v3;
}

+ (id)proximitySourceClientInterface
{
  v2 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EFE55BD8];
  v3 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v4 = objc_opt_class();
  objc_super v5 = objc_msgSend(v3, "setWithObjects:", v4, objc_opt_class(), 0);
  [v2 setClasses:v5 forSelector:sel_syncCompletedWithErrors_ argumentIndex:0 ofReply:0];

  return v2;
}

- (void)connectToDaemon
{
  v3 = (void *)[objc_alloc(MEMORY[0x1E4F29268]) initWithMachServiceName:@"com.apple.purplebuddy.budd.proximity.source.xpc" options:0];
  [(BYBuddyDaemonProximitySourceClient *)self setConnection:v3];

  uint64_t v4 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EFE56328];
  objc_super v5 = [(BYBuddyDaemonProximitySourceClient *)self connection];
  [v5 setRemoteObjectInterface:v4];

  v6 = [(id)objc_opt_class() proximitySourceClientInterface];
  v7 = [(BYBuddyDaemonProximitySourceClient *)self connection];
  [v7 setExportedInterface:v6];

  v8 = [(BYBuddyDaemonProximitySourceClient *)self connection];
  [v8 setExportedObject:self];

  objc_initWeak(&location, self);
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __53__BYBuddyDaemonProximitySourceClient_connectToDaemon__block_invoke;
  v14[3] = &unk_1E5D2BA88;
  objc_copyWeak(&v15, &location);
  v9 = [(BYBuddyDaemonProximitySourceClient *)self connection];
  [v9 setInvalidationHandler:v14];

  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __53__BYBuddyDaemonProximitySourceClient_connectToDaemon__block_invoke_66;
  v12[3] = &unk_1E5D2BA88;
  objc_copyWeak(&v13, &location);
  v10 = [(BYBuddyDaemonProximitySourceClient *)self connection];
  [v10 setInterruptionHandler:v12];

  v11 = [(BYBuddyDaemonProximitySourceClient *)self connection];
  [v11 resume];

  objc_destroyWeak(&v13);
  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);
}

void __53__BYBuddyDaemonProximitySourceClient_connectToDaemon__block_invoke(uint64_t a1)
{
  v2 = _BYLoggingFacility();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_1A7DED000, v2, OS_LOG_TYPE_DEFAULT, "Proximity source client connection invalidated!", v6, 2u);
  }

  v3 = [MEMORY[0x1E4F28C58] errorWithDomain:@"BYBuddyDaemonProximitySourceClientErrorDomain" code:-1 userInfo:0];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_super v5 = [WeakRetained delegate];
  [v5 finishedWithError:v3];
}

void __53__BYBuddyDaemonProximitySourceClient_connectToDaemon__block_invoke_66(uint64_t a1)
{
  v2 = _BYLoggingFacility();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_1A7DED000, v2, OS_LOG_TYPE_DEFAULT, "Proximity source client connection interruption!", v6, 2u);
  }

  v3 = [MEMORY[0x1E4F28C58] errorWithDomain:@"BYBuddyDaemonProximitySourceClientErrorDomain" code:-2 userInfo:0];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_super v5 = [WeakRetained delegate];
  [v5 finishedWithError:v3];
}

- (void)activateWithSharingChannel:(id)a3
{
  id v4 = a3;
  id v6 = [(BYBuddyDaemonProximitySourceClient *)self connection];
  objc_super v5 = [v6 remoteObjectProxy];
  [v5 activateWithSharingChannel:v4];
}

- (void)invalidate
{
  id v3 = [(BYBuddyDaemonProximitySourceClient *)self connection];
  v2 = [v3 remoteObjectProxy];
  [v2 invalidate];
}

- (void)receivedData:(id)a3
{
  id v4 = a3;
  id v6 = [(BYBuddyDaemonProximitySourceClient *)self connection];
  objc_super v5 = [v6 remoteObjectProxy];
  [v5 receivedData:v4];
}

- (void)finishedWithError:(id)a3
{
  id v4 = a3;
  id v5 = [(BYBuddyDaemonProximitySourceClient *)self delegate];
  [v5 finishedWithError:v4];
}

- (void)backupProgress:(double)a3 estimatedTimeRemaining:(int64_t)a4
{
  id v6 = [(BYBuddyDaemonProximitySourceClient *)self delegate];
  [v6 backupProgress:a4 estimatedTimeRemaining:a3];
}

- (void)backupCompletedWithError:(id)a3
{
  id v4 = a3;
  id v5 = [(BYBuddyDaemonProximitySourceClient *)self delegate];
  [v5 backupCompletedWithError:v4];
}

- (void)syncProgress:(double)a3
{
  id v4 = [(BYBuddyDaemonProximitySourceClient *)self delegate];
  [v4 syncProgress:a3];
}

- (void)syncCompletedWithErrors:(id)a3
{
  id v4 = a3;
  id v5 = [(BYBuddyDaemonProximitySourceClient *)self delegate];
  [v5 syncCompletedWithErrors:v4];
}

- (BYBuddyDaemonProximitySourceProtocol)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (BYBuddyDaemonProximitySourceProtocol *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSXPCConnection)connection
{
  return (NSXPCConnection *)objc_getProperty(self, a2, 16, 1);
}

- (void)setConnection:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connection, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end