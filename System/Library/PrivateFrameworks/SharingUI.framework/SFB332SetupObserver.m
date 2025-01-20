@interface SFB332SetupObserver
- (BOOL)shouldEscapeXpcTryCatch;
- (SFB332UIProtocol)delegate;
- (id)exportedInterface;
- (id)machServiceName;
- (id)remoteObjectInterface;
- (void)acquireHUDTransaction;
- (void)activate;
- (void)dismissBTPrompt;
- (void)dismissChargingStatus;
- (void)dismissUIAnimated:(BOOL)a3;
- (void)dismissUnlockPrompt;
- (void)enableBluetoothTapped;
- (void)invalidate;
- (void)pairTapped;
- (void)releaseHUDTransaction;
- (void)setDelegate:(id)a3;
- (void)setDeviceType:(unint64_t)a3;
- (void)setShouldShowWhatsNew:(BOOL)a3;
- (void)showChargingStatus;
- (void)showEnableBluetoothPill;
- (void)showPairConsentPrompt;
- (void)showPairingFailure;
- (void)showPairingStarted;
- (void)showPairingSuccess;
- (void)showSubsequentPairSuccess;
- (void)showUnlockPrompt;
- (void)updateDeviceInfoWithDeviceType:(unint64_t)a3 batteryLevel:(double)a4 batteryLevelKnown:(BOOL)a5 edge:(unint64_t)a6 orientation:(unint64_t)a7 isCharging:(BOOL)a8 identifier:(id)a9;
@end

@implementation SFB332SetupObserver

- (id)machServiceName
{
  return @"com.apple.sharingd.b332setup";
}

- (void)activate
{
  v2.receiver = self;
  v2.super_class = (Class)SFB332SetupObserver;
  [(SFXPCClient *)&v2 _activate];
}

- (void)invalidate
{
  v2.receiver = self;
  v2.super_class = (Class)SFB332SetupObserver;
  [(SFXPCClient *)&v2 _invalidate];
}

- (id)exportedInterface
{
  v11[1] = *MEMORY[0x263EF8340];
  objc_super v2 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26CEB39C8];
  v3 = (void *)MEMORY[0x263EFFA08];
  v11[0] = objc_opt_class();
  v4 = [MEMORY[0x263EFF8C0] arrayWithObjects:v11 count:1];
  v5 = [v3 setWithArray:v4];
  [v2 setClasses:v5 forSelector:sel_updateDeviceInfoWithDeviceType_batteryLevel_batteryLevelKnown_edge_orientation_isCharging_identifier_ argumentIndex:0 ofReply:0];

  v6 = (void *)MEMORY[0x263EFFA08];
  uint64_t v10 = objc_opt_class();
  v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v10 count:1];
  v8 = [v6 setWithArray:v7];
  [v2 setClasses:v8 forSelector:sel_updateDeviceInfoWithDeviceType_batteryLevel_batteryLevelKnown_edge_orientation_isCharging_identifier_ argumentIndex:6 ofReply:0];

  return v2;
}

- (id)remoteObjectInterface
{
  return (id)[MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26CEB3A28];
}

- (BOOL)shouldEscapeXpcTryCatch
{
  return 1;
}

- (void)updateDeviceInfoWithDeviceType:(unint64_t)a3 batteryLevel:(double)a4 batteryLevelKnown:(BOOL)a5 edge:(unint64_t)a6 orientation:(unint64_t)a7 isCharging:(BOOL)a8 identifier:(id)a9
{
  BOOL v9 = a8;
  BOOL v12 = a5;
  id v16 = a9;
  id v17 = [(SFB332SetupObserver *)self delegate];
  [v17 updateDeviceInfoWithDeviceType:a3 batteryLevel:v12 batteryLevelKnown:a6 edge:a7 orientation:v9 isCharging:v16 identifier:a4];
}

- (void)showPairingStarted
{
  id v2 = [(SFB332SetupObserver *)self delegate];
  [v2 showPairingStarted];
}

- (void)showEnableBluetoothPill
{
  id v2 = [(SFB332SetupObserver *)self delegate];
  [v2 showEnableBluetoothPill];
}

- (void)showPairingSuccess
{
  id v2 = [(SFB332SetupObserver *)self delegate];
  [v2 showPairingSuccess];
}

- (void)showPairingFailure
{
  id v2 = [(SFB332SetupObserver *)self delegate];
  [v2 showPairingFailure];
}

- (void)showSubsequentPairSuccess
{
  id v2 = [(SFB332SetupObserver *)self delegate];
  [v2 showSubsequentPairSuccess];
}

- (void)showChargingStatus
{
  id v2 = [(SFB332SetupObserver *)self delegate];
  [v2 showChargingStatus];
}

- (void)dismissChargingStatus
{
  id v2 = [(SFB332SetupObserver *)self delegate];
  [v2 dismissChargingStatus];
}

- (void)showUnlockPrompt
{
  id v2 = [(SFB332SetupObserver *)self delegate];
  [v2 showUnlockPrompt];
}

- (void)showPairConsentPrompt
{
  id v2 = [(SFB332SetupObserver *)self delegate];
  [v2 showPairConsentPrompt];
}

- (void)dismissUnlockPrompt
{
  id v2 = [(SFB332SetupObserver *)self delegate];
  [v2 dismissUnlockPrompt];
}

- (void)dismissBTPrompt
{
  id v2 = [(SFB332SetupObserver *)self delegate];
  [v2 dismissBTPrompt];
}

- (void)releaseHUDTransaction
{
  id v2 = [(SFB332SetupObserver *)self delegate];
  [v2 releaseHUDTransaction];
}

- (void)acquireHUDTransaction
{
  id v2 = [(SFB332SetupObserver *)self delegate];
  [v2 acquireHUDTransaction];
}

- (void)setShouldShowWhatsNew:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(SFB332SetupObserver *)self delegate];
  [v4 setShouldShowWhatsNew:v3];
}

- (void)setDeviceType:(unint64_t)a3
{
  id v4 = [(SFB332SetupObserver *)self delegate];
  [v4 setDeviceType:a3];
}

- (void)dismissUIAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(SFB332SetupObserver *)self delegate];
  [v4 dismissUIAnimated:v3];
}

- (void)enableBluetoothTapped
{
  BOOL v3 = _os_activity_create(&dword_21DB23000, "Sharing/SFB332SetupXPCConnection/enableBluetoothTapped", MEMORY[0x263EF8420], OS_ACTIVITY_FLAG_DEFAULT);
  v4.opaque[0] = 0;
  v4.opaque[1] = 0;
  os_activity_scope_enter(v3, &v4);
  [(SFXPCClient *)self getRemoteObjectProxyOnQueue:&__block_literal_global];
  os_activity_scope_leave(&v4);
}

uint64_t __44__SFB332SetupObserver_enableBluetoothTapped__block_invoke(uint64_t a1, void *a2)
{
  return [a2 enableBluetoothTapped];
}

- (void)pairTapped
{
  BOOL v3 = _os_activity_create(&dword_21DB23000, "Sharing/SFB332SetupXPCConnection/pairTapped", MEMORY[0x263EF8420], OS_ACTIVITY_FLAG_DEFAULT);
  v4.opaque[0] = 0;
  v4.opaque[1] = 0;
  os_activity_scope_enter(v3, &v4);
  [(SFXPCClient *)self getRemoteObjectProxyOnQueue:&__block_literal_global_200];
  os_activity_scope_leave(&v4);
}

uint64_t __33__SFB332SetupObserver_pairTapped__block_invoke(uint64_t a1, void *a2)
{
  return [a2 pairTapped];
}

- (SFB332UIProtocol)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SFB332UIProtocol *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end