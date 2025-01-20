@interface RMSLocalPairingSession
- (NSString)advertisedAppName;
- (NSString)advertisedDeviceModel;
- (NSString)advertisedDeviceName;
- (NSString)passcode;
- (RMSLocalPairingSession)init;
- (RMSPairingSessionDelegate)delegate;
- (id)_expectedPasscodeHashForPasscode:(id)a3 publicKey:(id)a4;
- (id)_generatePublicKey;
- (id)_pairingNetServiceName;
- (void)_startBonjourAdvertisingWithPublicKey:(id)a3 httpServerPort:(unsigned __int16)a4;
- (void)beginPairing;
- (void)dealloc;
- (void)endPairing;
- (void)netService:(id)a3 didNotPublish:(id)a4;
- (void)netServiceDidPublish:(id)a3;
- (void)netServiceDidStop:(id)a3;
- (void)pairingServer:(id)a3 didPairWithService:(id)a4 pairingGUID:(id)a5;
- (void)pairingServerDidFail:(id)a3;
- (void)setAdvertisedAppName:(id)a3;
- (void)setAdvertisedDeviceModel:(id)a3;
- (void)setAdvertisedDeviceName:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setPasscode:(id)a3;
- (void)unpairService:(id)a3 completionHandler:(id)a4;
@end

@implementation RMSLocalPairingSession

- (RMSLocalPairingSession)init
{
  v11.receiver = self;
  v11.super_class = (Class)RMSLocalPairingSession;
  v2 = [(RMSLocalPairingSession *)&v11 init];
  if (v2)
  {
    v3 = [MEMORY[0x263F086E0] mainBundle];
    uint64_t v4 = [v3 objectForInfoDictionaryKey:@"CFBundleName"];
    advertisedAppName = v2->_advertisedAppName;
    v2->_advertisedAppName = (NSString *)v4;

    uint64_t v6 = MGCopyAnswer();
    advertisedDeviceName = v2->_advertisedDeviceName;
    v2->_advertisedDeviceName = (NSString *)v6;

    uint64_t v8 = MGCopyAnswer();
    advertisedDeviceModel = v2->_advertisedDeviceModel;
    v2->_advertisedDeviceModel = (NSString *)v8;
  }
  return v2;
}

- (void)dealloc
{
  v3 = [(id)__netService delegate];

  if (v3 == self)
  {
    [(id)__netService stop];
    uint64_t v4 = (void *)__netService;
    __netService = 0;
  }
  v5.receiver = self;
  v5.super_class = (Class)RMSLocalPairingSession;
  [(RMSLocalPairingSession *)&v5 dealloc];
}

- (void)beginPairing
{
  if (!self->_passcode)
  {
    generateRandomPasscode();
    v3 = (NSString *)objc_claimAutoreleasedReturnValue();
    passcode = self->_passcode;
    self->_passcode = v3;
  }
  id v9 = [(RMSLocalPairingSession *)self _generatePublicKey];
  objc_super v5 = -[RMSLocalPairingSession _expectedPasscodeHashForPasscode:publicKey:](self, "_expectedPasscodeHashForPasscode:publicKey:", self->_passcode);
  uint64_t v6 = (RMSPairingServer *)objc_opt_new();
  pairingServer = self->_pairingServer;
  self->_pairingServer = v6;

  [(RMSPairingServer *)self->_pairingServer setDelegate:self];
  if ([(RMSPairingServer *)self->_pairingServer startServerWithExpectedPasscodeHash:v5 advertisedDeviceName:self->_advertisedDeviceName advertisedDeviceModel:self->_advertisedDeviceModel])
  {
    [(RMSLocalPairingSession *)self _startBonjourAdvertisingWithPublicKey:v9 httpServerPort:[(RMSPairingServer *)self->_pairingServer port]];
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained pairingSessionDidFail:self];
  }
}

- (void)endPairing
{
  [(RMSPairingServer *)self->_pairingServer stopServer];
  v2 = (void *)__netService;
  [v2 stop];
}

- (void)unpairService:(id)a3 completionHandler:(id)a4
{
  if (a4) {
    (*((void (**)(id, void))a4 + 2))(a4, 0);
  }
}

- (void)netServiceDidPublish:(id)a3
{
  uint64_t v4 = RMSLogger();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v8 = 0;
    _os_log_impl(&dword_23C83A000, v4, OS_LOG_TYPE_DEFAULT, "Pairing bonjour service published", v8, 2u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = objc_loadWeakRetained((id *)&self->_delegate);
    [v7 pairingSession:self didBeginPairingWithPasscode:self->_passcode];
  }
}

- (void)netService:(id)a3 didNotPublish:(id)a4
{
  [(RMSPairingServer *)self->_pairingServer stopServer];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained pairingSessionDidFail:self];
}

- (void)netServiceDidStop:(id)a3
{
  v3 = RMSLogger();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)objc_super v5 = 0;
    _os_log_impl(&dword_23C83A000, v3, OS_LOG_TYPE_DEFAULT, "Pairing bonjour service stopped", v5, 2u);
  }

  uint64_t v4 = (void *)__netService;
  __netService = 0;
}

- (void)pairingServer:(id)a3 didPairWithService:(id)a4 pairingGUID:(id)a5
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v7 = a4;
  id v8 = a5;
  id v9 = RMSLogger();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 138412546;
    id v12 = v7;
    __int16 v13 = 2112;
    id v14 = v8;
    _os_log_impl(&dword_23C83A000, v9, OS_LOG_TYPE_DEFAULT, "Pairing server successfully paired, serviceName=[%@] pairingGUID=[%@]", (uint8_t *)&v11, 0x16u);
  }

  [(RMSLocalPairingSession *)self endPairing];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained pairingSession:self didPairWithServiceNetworkName:v7 pairingGUID:v8];
}

- (void)pairingServerDidFail:(id)a3
{
  [(RMSLocalPairingSession *)self endPairing];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained pairingSessionDidFail:self];
}

- (void)_startBonjourAdvertisingWithPublicKey:(id)a3 httpServerPort:(unsigned __int16)a4
{
  id v6 = a3;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __79__RMSLocalPairingSession__startBonjourAdvertisingWithPublicKey_httpServerPort___block_invoke;
  block[3] = &unk_264E743E8;
  block[4] = self;
  id v9 = v6;
  unsigned __int16 v10 = a4;
  id v7 = v6;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __79__RMSLocalPairingSession__startBonjourAdvertisingWithPublicKey_httpServerPort___block_invoke(uint64_t a1)
{
  v14[6] = *MEMORY[0x263EF8340];
  v13[0] = @"txtvers";
  v13[1] = @"RemN";
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = v2[4];
  uint64_t v5 = v2[5];
  v14[0] = @"1";
  v14[1] = v4;
  v13[2] = @"DvTy";
  v13[3] = @"DvNm";
  v14[2] = v2[6];
  v14[3] = v5;
  v13[4] = @"RemV";
  v13[5] = @"Pair";
  v14[4] = @"10000";
  v14[5] = v3;
  id v6 = [NSDictionary dictionaryWithObjects:v14 forKeys:v13 count:6];
  if (__netService) {
    [(id)__netService stop];
  }
  id v7 = objc_alloc(MEMORY[0x263F089E8]);
  id v8 = [*(id *)(a1 + 32) _pairingNetServiceName];
  uint64_t v9 = [v7 initWithDomain:@"local." type:@"_touch-remote._tcp." name:v8 port:*(unsigned __int16 *)(a1 + 48)];
  unsigned __int16 v10 = (void *)__netService;
  __netService = v9;

  int v11 = (void *)__netService;
  id v12 = [MEMORY[0x263F089E8] dataFromTXTRecordDictionary:v6];
  [v11 setTXTRecordData:v12];

  [(id)__netService setDelegate:*(void *)(a1 + 32)];
  [(id)__netService publish];
}

- (id)_generatePublicKey
{
  unsigned int v2 = random();
  return (id)objc_msgSend(NSString, "stringWithFormat:", @"%.16llX", bswap64(random() | ((unint64_t)v2 << 32)));
}

- (id)_expectedPasscodeHashForPasscode:(id)a3 publicKey:(id)a4
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  memset(c, 0, 92);
  id v5 = a4;
  CC_MD5_Init((CC_MD5_CTX *)c);
  id v6 = v5;
  id v7 = (const void *)[v6 UTF8String];
  CC_LONG v8 = [v6 lengthOfBytesUsingEncoding:4];

  CC_MD5_Update((CC_MD5_CTX *)c, v7, v8);
  id v9 = [(RMSLocalPairingSession *)self passcode];
  unsigned __int16 v10 = (const void *)[v9 cStringUsingEncoding:10];
  int v11 = [(RMSLocalPairingSession *)self passcode];
  CC_MD5_Update((CC_MD5_CTX *)c, v10, [v11 lengthOfBytesUsingEncoding:10]);

  CC_MD5_Final(md, (CC_MD5_CTX *)c);
  objc_msgSend(NSString, "stringWithFormat:", @"%.2X%.2X%.2X%.2X%.2X%.2X%.2X%.2X%.2X%.2X%.2X%.2X%.2X%.2X%.2X%.2X", md[0], md[1], md[2], md[3], md[4], md[5], md[6], md[7], md[8], md[9], md[10], md[11], md[12], md[13], md[14], md[15],
    *(_OWORD *)c,
    *(void *)&c[16],
    *(_OWORD *)&c[24],
    *(void *)&c[40],
    *(_OWORD *)&c[48],
    *(void *)&c[64],
    *(_OWORD *)&c[72],
  id v12 = *(void *)&c[88]);
  return v12;
}

- (id)_pairingNetServiceName
{
  unsigned int v2 = [MEMORY[0x263EFFA40] standardUserDefaults];
  uint64_t v3 = [v2 stringForKey:@"PairingNetServiceName"];
  if (!v3)
  {
    uint64_t v4 = [MEMORY[0x263F08C38] UUID];
    uint64_t v3 = [v4 UUIDString];

    [v2 setValue:v3 forKey:@"PairingNetServiceName"];
    [v2 synchronize];
  }

  return v3;
}

- (RMSPairingSessionDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (RMSPairingSessionDelegate *)WeakRetained;
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
  objc_storeStrong((id *)&self->_pairingServer, 0);
}

@end