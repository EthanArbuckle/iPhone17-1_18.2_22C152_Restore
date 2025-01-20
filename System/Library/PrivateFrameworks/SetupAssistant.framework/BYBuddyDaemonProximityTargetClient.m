@interface BYBuddyDaemonProximityTargetClient
+ (id)proximityTargetClientInterface;
- (BYBuddyDaemonProximityTargetClient)init;
- (BYBuddyDaemonProximityTargetProtocol)delegate;
- (NSXPCConnection)connection;
- (id)fileTransferSessionTemplate;
- (void)beginAdvertisingProximitySetup;
- (void)beginSIMSetupExternalAuthentication;
- (void)connectToDaemon;
- (void)dismissProximityPinCode;
- (void)displayProximityPinCode:(id)a3 visual:(BOOL)a4;
- (void)endAdvertisingProximitySetup;
- (void)endDeviceToDeviceMigration;
- (void)endPairing;
- (void)endSIMSetupExternalAuthentication;
- (void)hasConnection:(id)a3;
- (void)proximityConnectionInitiated;
- (void)proximityConnectionPreparing:(id)a3;
- (void)proximityConnectionReconnected;
- (void)proximityConnectionTerminated;
- (void)proximitySetupCompleted:(id)a3;
- (void)receivedLanguages:(id)a3 locale:(id)a4 model:(id)a5 deviceClass:(id)a6 accessibilitySettings:(id)a7;
- (void)resumeProximitySetup:(id)a3;
- (void)sendData:(id)a3;
- (void)setConnection:(id)a3;
- (void)setDelegate:(id)a3;
- (void)showMigrationInterfaceOnSource;
- (void)storeHandshake:(id)a3;
- (void)storeInformation:(id)a3;
- (void)suspendConnectionForSoftwareUpdate:(id)a3;
@end

@implementation BYBuddyDaemonProximityTargetClient

- (BYBuddyDaemonProximityTargetClient)init
{
  v5.receiver = self;
  v5.super_class = (Class)BYBuddyDaemonProximityTargetClient;
  v2 = [(BYBuddyDaemonProximityTargetClient *)&v5 init];
  v3 = v2;
  if (v2) {
    [(BYBuddyDaemonProximityTargetClient *)v2 connectToDaemon];
  }
  return v3;
}

+ (id)proximityTargetClientInterface
{
  return (id)[MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EFE50718];
}

- (void)connectToDaemon
{
  v3 = (void *)[objc_alloc(MEMORY[0x1E4F29268]) initWithMachServiceName:@"com.apple.purplebuddy.budd.proximity.target.xpc" options:0];
  [(BYBuddyDaemonProximityTargetClient *)self setConnection:v3];

  v4 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EFE5A900];
  objc_super v5 = [(BYBuddyDaemonProximityTargetClient *)self connection];
  [v5 setRemoteObjectInterface:v4];

  v6 = [(id)objc_opt_class() proximityTargetClientInterface];
  v7 = [(BYBuddyDaemonProximityTargetClient *)self connection];
  [v7 setExportedInterface:v6];

  v8 = [(BYBuddyDaemonProximityTargetClient *)self connection];
  [v8 setExportedObject:self];

  v9 = [(BYBuddyDaemonProximityTargetClient *)self connection];
  [v9 setInvalidationHandler:&__block_literal_global_4];

  v10 = [(BYBuddyDaemonProximityTargetClient *)self connection];
  [v10 setInterruptionHandler:&__block_literal_global_83];

  id v11 = [(BYBuddyDaemonProximityTargetClient *)self connection];
  [v11 resume];
}

void __53__BYBuddyDaemonProximityTargetClient_connectToDaemon__block_invoke()
{
  v0 = _BYLoggingFacility();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_1A7DED000, v0, OS_LOG_TYPE_DEFAULT, "Proximity target client connection invalidated!", v1, 2u);
  }
}

void __53__BYBuddyDaemonProximityTargetClient_connectToDaemon__block_invoke_81()
{
  v0 = _BYLoggingFacility();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_1A7DED000, v0, OS_LOG_TYPE_DEFAULT, "Proximity target client connection interruption!", v1, 2u);
  }
}

- (void)beginAdvertisingProximitySetup
{
  id v3 = [(BYBuddyDaemonProximityTargetClient *)self connection];
  v2 = [v3 remoteObjectProxy];
  [v2 beginAdvertisingProximitySetup];
}

- (void)endAdvertisingProximitySetup
{
  id v3 = [(BYBuddyDaemonProximityTargetClient *)self connection];
  v2 = [v3 remoteObjectProxy];
  [v2 endAdvertisingProximitySetup];
}

- (void)endPairing
{
  id v3 = [(BYBuddyDaemonProximityTargetClient *)self connection];
  v2 = [v3 remoteObjectProxy];
  [v2 endPairing];
}

- (void)sendData:(id)a3
{
  id v4 = a3;
  id v6 = [(BYBuddyDaemonProximityTargetClient *)self connection];
  objc_super v5 = [v6 remoteObjectProxy];
  [v5 sendData:v4];
}

- (void)hasConnection:(id)a3
{
  id v4 = a3;
  objc_super v5 = [(BYBuddyDaemonProximityTargetClient *)self connection];
  id v6 = [v5 remoteObjectProxy];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __52__BYBuddyDaemonProximityTargetClient_hasConnection___block_invoke;
  v8[3] = &unk_1E5D2BC98;
  id v9 = v4;
  id v7 = v4;
  [v6 hasConnection:v8];
}

uint64_t __52__BYBuddyDaemonProximityTargetClient_hasConnection___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)resumeProximitySetup:(id)a3
{
  id v4 = a3;
  objc_super v5 = [(BYBuddyDaemonProximityTargetClient *)self connection];
  id v6 = [v5 remoteObjectProxy];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __59__BYBuddyDaemonProximityTargetClient_resumeProximitySetup___block_invoke;
  v8[3] = &unk_1E5D2BCC0;
  id v9 = v4;
  id v7 = v4;
  [v6 resumeProximitySetup:v8];
}

uint64_t __59__BYBuddyDaemonProximityTargetClient_resumeProximitySetup___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)storeInformation:(id)a3
{
  id v4 = a3;
  id v6 = [(BYBuddyDaemonProximityTargetClient *)self connection];
  objc_super v5 = [v6 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_88];
  [v5 storeInformation:v4];
}

void __55__BYBuddyDaemonProximityTargetClient_storeInformation___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = _BYLoggingFacility();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    if (_BYIsInternalInstall())
    {
      int v5 = 0;
      id v6 = v3;
    }
    else if (v3)
    {
      id v7 = NSString;
      v2 = [v3 domain];
      id v6 = [v7 stringWithFormat:@"<Error domain: %@, code %ld>", v2, objc_msgSend(v3, "code")];
      int v5 = 1;
    }
    else
    {
      int v5 = 0;
      id v6 = 0;
    }
    *(_DWORD *)buf = 138543362;
    id v9 = v6;
    _os_log_impl(&dword_1A7DED000, v4, OS_LOG_TYPE_DEFAULT, "Unable to store proximity information: %{public}@", buf, 0xCu);
    if (v5)
    {
    }
  }
}

- (void)storeHandshake:(id)a3
{
  id v4 = a3;
  id v6 = [(BYBuddyDaemonProximityTargetClient *)self connection];
  int v5 = [v6 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_94];
  [v5 storeHandshake:v4];
}

void __53__BYBuddyDaemonProximityTargetClient_storeHandshake___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = _BYLoggingFacility();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    if (_BYIsInternalInstall())
    {
      int v5 = 0;
      id v6 = v3;
    }
    else if (v3)
    {
      id v7 = NSString;
      v2 = [v3 domain];
      id v6 = [v7 stringWithFormat:@"<Error domain: %@, code %ld>", v2, objc_msgSend(v3, "code")];
      int v5 = 1;
    }
    else
    {
      int v5 = 0;
      id v6 = 0;
    }
    *(_DWORD *)buf = 138543362;
    id v9 = v6;
    _os_log_impl(&dword_1A7DED000, v4, OS_LOG_TYPE_DEFAULT, "Unable to store proximity handshake: %{public}@", buf, 0xCu);
    if (v5)
    {
    }
  }
}

- (id)fileTransferSessionTemplate
{
  uint64_t v7 = 0;
  v8 = &v7;
  uint64_t v9 = 0x3032000000;
  uint64_t v10 = __Block_byref_object_copy__0;
  id v11 = __Block_byref_object_dispose__0;
  id v12 = 0;
  v2 = [(BYBuddyDaemonProximityTargetClient *)self connection];
  id v3 = [v2 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_96];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __65__BYBuddyDaemonProximityTargetClient_fileTransferSessionTemplate__block_invoke_97;
  v6[3] = &unk_1E5D2BCE8;
  v6[4] = &v7;
  [v3 fileTransferSessionTemplate:v6];

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __65__BYBuddyDaemonProximityTargetClient_fileTransferSessionTemplate__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = _BYLoggingFacility();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    if (_BYIsInternalInstall())
    {
      int v5 = 0;
      id v6 = v3;
    }
    else if (v3)
    {
      uint64_t v7 = NSString;
      v2 = [v3 domain];
      id v6 = [v7 stringWithFormat:@"<Error domain: %@, code %ld>", v2, objc_msgSend(v3, "code")];
      int v5 = 1;
    }
    else
    {
      int v5 = 0;
      id v6 = 0;
    }
    *(_DWORD *)buf = 138543362;
    uint64_t v9 = v6;
    _os_log_error_impl(&dword_1A7DED000, v4, OS_LOG_TYPE_ERROR, "Unable to begin device to device migration: %{public}@", buf, 0xCu);
    if (v5)
    {
    }
  }
}

void __65__BYBuddyDaemonProximityTargetClient_fileTransferSessionTemplate__block_invoke_97(uint64_t a1, void *a2)
{
}

- (void)endDeviceToDeviceMigration
{
  id v3 = [(BYBuddyDaemonProximityTargetClient *)self connection];
  v2 = [v3 remoteObjectProxy];
  [v2 endDeviceToDeviceMigration];
}

- (void)showMigrationInterfaceOnSource
{
  id v3 = [(BYBuddyDaemonProximityTargetClient *)self connection];
  v2 = [v3 remoteObjectProxy];
  [v2 showMigrationInterfaceOnSource];
}

- (void)suspendConnectionForSoftwareUpdate:(id)a3
{
  id v4 = a3;
  id v6 = [(BYBuddyDaemonProximityTargetClient *)self connection];
  int v5 = [v6 remoteObjectProxy];
  [v5 suspendConnectionForSoftwareUpdate:v4];
}

- (void)beginSIMSetupExternalAuthentication
{
  id v3 = [(BYBuddyDaemonProximityTargetClient *)self connection];
  v2 = [v3 remoteObjectProxy];
  [v2 beginSIMSetupExternalAuthentication];
}

- (void)endSIMSetupExternalAuthentication
{
  id v3 = [(BYBuddyDaemonProximityTargetClient *)self connection];
  v2 = [v3 remoteObjectProxy];
  [v2 endSIMSetupExternalAuthentication];
}

- (void)proximitySetupCompleted:(id)a3
{
  id v4 = a3;
  id v5 = [(BYBuddyDaemonProximityTargetClient *)self delegate];
  [v5 proximitySetupCompleted:v4];
}

- (void)displayProximityPinCode:(id)a3 visual:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = [(BYBuddyDaemonProximityTargetClient *)self delegate];
  [v7 displayProximityPinCode:v6 visual:v4];
}

- (void)dismissProximityPinCode
{
  id v2 = [(BYBuddyDaemonProximityTargetClient *)self delegate];
  [v2 dismissProximityPinCode];
}

- (void)proximityConnectionPreparing:(id)a3
{
  id v4 = a3;
  id v5 = [(BYBuddyDaemonProximityTargetClient *)self delegate];
  [v5 proximityConnectionPreparing:v4];
}

- (void)proximityConnectionInitiated
{
  id v2 = [(BYBuddyDaemonProximityTargetClient *)self delegate];
  [v2 proximityConnectionInitiated];
}

- (void)proximityConnectionTerminated
{
  id v2 = [(BYBuddyDaemonProximityTargetClient *)self delegate];
  [v2 proximityConnectionTerminated];
}

- (void)proximityConnectionReconnected
{
  id v2 = [(BYBuddyDaemonProximityTargetClient *)self delegate];
  [v2 proximityConnectionReconnected];
}

- (void)receivedLanguages:(id)a3 locale:(id)a4 model:(id)a5 deviceClass:(id)a6 accessibilitySettings:(id)a7
{
  id v12 = a7;
  id v13 = a6;
  id v14 = a5;
  id v15 = a4;
  id v16 = a3;
  id v17 = [(BYBuddyDaemonProximityTargetClient *)self delegate];
  [v17 receivedLanguages:v16 locale:v15 model:v14 deviceClass:v13 accessibilitySettings:v12];
}

- (BYBuddyDaemonProximityTargetProtocol)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (BYBuddyDaemonProximityTargetProtocol *)WeakRetained;
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