@interface BYDaemonProximityTargetClientConnection
+ (id)daemonProtocolInterface;
- (BYDaemonProximityTargetClientConnection)initWithConnection:(id)a3;
- (void)beginAdvertisingProximitySetup;
- (void)beginSIMSetupExternalAuthentication;
- (void)dismissProximityPinCode;
- (void)displayProximityPinCode:(id)a3 visual:(BOOL)a4;
- (void)endAdvertisingProximitySetup;
- (void)endDeviceToDeviceMigration;
- (void)endPairing;
- (void)endSIMSetupExternalAuthentication;
- (void)fileTransferSessionTemplate:(id)a3;
- (void)hasConnection:(id)a3;
- (void)proximityConnectionInitiated;
- (void)proximityConnectionPreparing:(id)a3;
- (void)proximityConnectionReconnected;
- (void)proximityConnectionTerminated;
- (void)proximitySetupCompleted:(id)a3;
- (void)receivedLanguages:(id)a3 locale:(id)a4 model:(id)a5 deviceClass:(id)a6 accessibilitySettings:(id)a7;
- (void)resumeProximitySetup:(id)a3;
- (void)showMigrationInterfaceOnSource;
- (void)storeHandshake:(id)a3;
- (void)storeInformation:(id)a3;
- (void)suspendConnectionForSoftwareUpdate:(id)a3;
@end

@implementation BYDaemonProximityTargetClientConnection

- (BYDaemonProximityTargetClientConnection)initWithConnection:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)BYDaemonProximityTargetClientConnection;
  v3 = [(BYDaemonClientConnection *)&v6 initWithConnection:a3];
  if (v3)
  {
    v4 = +[BYDaemonProximityController sharedController];
    [v4 setDelegate:v3];
  }
  return v3;
}

+ (id)daemonProtocolInterface
{
  return +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___BYDaemonProximityTargetProtocol];
}

- (void)beginAdvertisingProximitySetup
{
  id v2 = +[BYDaemonProximityController sharedController];
  [v2 beginAdvertising];
}

- (void)endAdvertisingProximitySetup
{
  id v2 = +[BYDaemonProximityController sharedController];
  [v2 endAdvertising];
}

- (void)endPairing
{
  id v2 = +[BYDaemonProximityController sharedController];
  [v2 endPairing];
}

- (void)hasConnection:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    id v5 = +[BYDaemonProximityController sharedController];
    (*((void (**)(id, id))a3 + 2))(v4, [v5 hasConnection]);
  }
}

- (void)resumeProximitySetup:(id)a3
{
  v9 = (void (**)(id, void *, void *, void *, void *, void *, id))a3;
  v3 = +[BYDaemonProximityController sharedController];
  if (v9)
  {
    id v4 = [v3 handshake];
    id v5 = [v3 information];
    objc_super v6 = [v3 messageSession];
    v7 = [v3 model];
    v8 = [v3 deviceClass];
    v9[2](v9, v4, v5, v6, v7, v8, [v3 hasConnection]);
  }
}

- (void)storeInformation:(id)a3
{
  id v3 = a3;
  id v4 = _BYLoggingFacility();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)objc_super v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Storing information...", v6, 2u);
  }

  id v5 = +[BYDaemonProximityController sharedController];
  [v5 setInformation:v3];
}

- (void)storeHandshake:(id)a3
{
  id v3 = a3;
  id v4 = _BYLoggingFacility();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)objc_super v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Storing handshake...", v6, 2u);
  }

  id v5 = +[BYDaemonProximityController sharedController];
  [v5 setHandshake:v3];
}

- (void)fileTransferSessionTemplate:(id)a3
{
  id v5 = (void (**)(id, void *))a3;
  id v3 = +[BYDaemonProximityController sharedController];
  id v4 = [v3 fileTransferSessionTemplate];

  if (v5) {
    v5[2](v5, v4);
  }
}

- (void)endDeviceToDeviceMigration
{
  id v2 = +[BYDaemonProximityController sharedController];
  [v2 endDeviceToDeviceMigration];
}

- (void)showMigrationInterfaceOnSource
{
  id v2 = +[BYDaemonProximityController sharedController];
  [v2 showMigrationInterfaceOnSource];
}

- (void)suspendConnectionForSoftwareUpdate:(id)a3
{
  id v3 = a3;
  id v4 = +[BYDaemonProximityController sharedController];
  [v4 suspendConnectionForSoftwareUpdate:v3];
}

- (void)beginSIMSetupExternalAuthentication
{
  id v2 = +[BYDaemonProximityController sharedController];
  [v2 beginSIMSetupExternalAuthentication];
}

- (void)endSIMSetupExternalAuthentication
{
  id v2 = +[BYDaemonProximityController sharedController];
  [v2 endSIMSetupExternalAuthentication];
}

- (void)displayProximityPinCode:(id)a3 visual:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v8 = [(BYDaemonClientConnection *)self connection];
  v7 = [v8 remoteObjectProxy];
  [v7 displayProximityPinCode:v6 visual:v4];
}

- (void)dismissProximityPinCode
{
  id v3 = [(BYDaemonClientConnection *)self connection];
  id v2 = [v3 remoteObjectProxy];
  [v2 dismissProximityPinCode];
}

- (void)proximityConnectionPreparing:(id)a3
{
  id v4 = a3;
  id v6 = [(BYDaemonClientConnection *)self connection];
  id v5 = [v6 remoteObjectProxy];
  [v5 proximityConnectionPreparing:v4];
}

- (void)proximityConnectionInitiated
{
  id v3 = [(BYDaemonClientConnection *)self connection];
  id v2 = [v3 remoteObjectProxy];
  [v2 proximityConnectionInitiated];
}

- (void)proximityConnectionTerminated
{
  id v3 = [(BYDaemonClientConnection *)self connection];
  id v2 = [v3 remoteObjectProxy];
  [v2 proximityConnectionTerminated];
}

- (void)proximityConnectionReconnected
{
  id v3 = [(BYDaemonClientConnection *)self connection];
  id v2 = [v3 remoteObjectProxy];
  [v2 proximityConnectionReconnected];
}

- (void)receivedLanguages:(id)a3 locale:(id)a4 model:(id)a5 deviceClass:(id)a6 accessibilitySettings:(id)a7
{
  id v12 = a7;
  id v13 = a6;
  id v14 = a5;
  id v15 = a4;
  id v16 = a3;
  id v18 = [(BYDaemonClientConnection *)self connection];
  v17 = [v18 remoteObjectProxy];
  [v17 receivedLanguages:v16 locale:v15 model:v14 deviceClass:v13 accessibilitySettings:v12];
}

- (void)proximitySetupCompleted:(id)a3
{
  id v4 = a3;
  id v6 = [(BYDaemonClientConnection *)self connection];
  id v5 = [v6 remoteObjectProxy];
  [v5 proximitySetupCompleted:v4];
}

@end