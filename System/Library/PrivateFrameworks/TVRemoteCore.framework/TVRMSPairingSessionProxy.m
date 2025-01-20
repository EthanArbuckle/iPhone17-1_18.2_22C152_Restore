@interface TVRMSPairingSessionProxy
- (NSString)advertisedAppName;
- (NSString)advertisedDeviceModel;
- (NSString)advertisedDeviceName;
- (NSString)passcode;
- (TVRMSPairingSessionDelegate)delegate;
- (TVRMSPairingSessionProxy)init;
- (void)_handleDidPairWithServiceNotification:(id)a3;
- (void)_handlePairingDidFailNotification:(id)a3;
- (void)_handleSessionDidEndNotification:(id)a3;
- (void)_notifyDelegatePairingFailed;
- (void)beginPairing;
- (void)dealloc;
- (void)endPairing;
- (void)setAdvertisedAppName:(id)a3;
- (void)setAdvertisedDeviceModel:(id)a3;
- (void)setAdvertisedDeviceName:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setPasscode:(id)a3;
@end

@implementation TVRMSPairingSessionProxy

- (TVRMSPairingSessionProxy)init
{
  v16.receiver = self;
  v16.super_class = (Class)TVRMSPairingSessionProxy;
  v2 = [(TVRMSSessionProxy *)&v16 initWithTimeout:*(double *)&TVRMSPairingSessionTimeout];
  if (v2)
  {
    v3 = [MEMORY[0x263F08A00] defaultCenter];
    [v3 addObserver:v2 selector:sel__handleDidPairWithServiceNotification_ name:@"RMSIDSClientDidPairWithServiceNotification" object:0];
    [v3 addObserver:v2 selector:sel__handlePairingDidFailNotification_ name:@"RMSIDSClientPairingDidFailNotification" object:0];
    [v3 addObserver:v2 selector:sel__handleSessionDidEndNotification_ name:@"RMSIDSClientSessionDidEndNotification" object:0];
    uint64_t v4 = generateRandomPasscode();
    passcode = v2->_passcode;
    v2->_passcode = (NSString *)v4;

    v6 = [MEMORY[0x263F086E0] mainBundle];
    uint64_t v7 = [v6 objectForInfoDictionaryKey:@"CFBundleName"];
    advertisedAppName = v2->_advertisedAppName;
    v2->_advertisedAppName = (NSString *)v7;

    uint64_t v9 = MGCopyAnswer();
    advertisedDeviceName = v2->_advertisedDeviceName;
    v2->_advertisedDeviceName = (NSString *)v9;

    uint64_t v11 = MGCopyAnswer();
    advertisedDeviceModel = v2->_advertisedDeviceModel;
    v2->_advertisedDeviceModel = (NSString *)v11;

    uint64_t v13 = +[TVRMSIDSClient sharedClient];
    idsClient = v2->_idsClient;
    v2->_idsClient = (TVRMSIDSClient *)v13;
  }
  return v2;
}

- (void)dealloc
{
  v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)TVRMSPairingSessionProxy;
  [(TVRMSSessionProxy *)&v4 dealloc];
}

- (void)beginPairing
{
  if (!self->_pairing)
  {
    self->_pairing = 1;
    objc_initWeak(&location, self);
    idsClient = self->_idsClient;
    passcode = self->_passcode;
    advertisedAppName = self->_advertisedAppName;
    advertisedDeviceName = self->_advertisedDeviceName;
    advertisedDeviceModel = self->_advertisedDeviceModel;
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __40__TVRMSPairingSessionProxy_beginPairing__block_invoke;
    v8[3] = &unk_2647AF290;
    objc_copyWeak(&v9, &location);
    [(TVRMSIDSClient *)idsClient beginPairingSessionWithPasscode:passcode appName:advertisedAppName deviceName:advertisedDeviceName deviceModel:advertisedDeviceModel completionHandler:v8];
    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
  }
}

void __40__TVRMSPairingSessionProxy_beginPairing__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v6 = WeakRetained;
    if (a2 == 1)
    {
      [WeakRetained setSessionIdentifier:a3];
      [v6 beginHeartbeat];
    }
    else
    {
      [WeakRetained _notifyDelegatePairingFailed];
    }
    id WeakRetained = v6;
  }
}

- (void)endPairing
{
  [(TVRMSSessionProxy *)self endHeartbeat];
  uint64_t v3 = [(TVRMSSessionProxy *)self sessionIdentifier];
  if (v3) {
    [(TVRMSIDSClient *)self->_idsClient endPairingSession:v3];
  }
  self->_pairing = 0;

  [(TVRMSSessionProxy *)self setSessionIdentifier:0];
}

- (void)_notifyDelegatePairingFailed
{
  if (self->_pairing && [(TVRMSSessionProxy *)self sessionIdentifier])
  {
    self->_pairing = 0;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained pairingSessionDidFail:self];
  }
}

- (void)_handleDidPairWithServiceNotification:(id)a3
{
  id v10 = a3;
  if (-[TVRMSSessionProxy sessionMatchesNotification:](self, "sessionMatchesNotification:"))
  {
    objc_super v4 = [v10 userInfo];
    v5 = [v4 objectForKeyedSubscript:@"RMSIDSClientServiceNetworkNameNotificationKey"];

    id v6 = [v10 userInfo];
    uint64_t v7 = [v6 objectForKeyedSubscript:@"RMSIDSClientPairingGUIDNotificationKey"];

    v8 = +[TVRMSPairingRecordStore sharedRecordStore];
    [v8 savePairingRecord:v7 forServiceWithNetworkName:v5];

    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained pairingSession:self didPairWithServiceNetworkName:v5 pairingGUID:v7];
  }
}

- (void)_handlePairingDidFailNotification:(id)a3
{
  if ([(TVRMSSessionProxy *)self sessionMatchesNotification:a3])
  {
    [(TVRMSPairingSessionProxy *)self _notifyDelegatePairingFailed];
  }
}

- (void)_handleSessionDidEndNotification:(id)a3
{
  if ([(TVRMSSessionProxy *)self sessionMatchesNotification:a3])
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __61__TVRMSPairingSessionProxy__handleSessionDidEndNotification___block_invoke;
    block[3] = &unk_2647AEA98;
    block[4] = self;
    dispatch_async(MEMORY[0x263EF83A0], block);
  }
}

uint64_t __61__TVRMSPairingSessionProxy__handleSessionDidEndNotification___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) endHeartbeat];
  v2 = *(void **)(a1 + 32);

  return [v2 _notifyDelegatePairingFailed];
}

- (TVRMSPairingSessionDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (TVRMSPairingSessionDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSString)passcode
{
  return self->_passcode;
}

- (void)setPasscode:(id)a3
{
}

- (NSString)advertisedAppName
{
  return self->_advertisedAppName;
}

- (void)setAdvertisedAppName:(id)a3
{
}

- (NSString)advertisedDeviceName
{
  return self->_advertisedDeviceName;
}

- (void)setAdvertisedDeviceName:(id)a3
{
}

- (NSString)advertisedDeviceModel
{
  return self->_advertisedDeviceModel;
}

- (void)setAdvertisedDeviceModel:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_advertisedDeviceModel, 0);
  objc_storeStrong((id *)&self->_advertisedDeviceName, 0);
  objc_storeStrong((id *)&self->_advertisedAppName, 0);
  objc_storeStrong((id *)&self->_passcode, 0);
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_idsClient, 0);
}

@end