@interface WPAWDL
+ (id)generateDataFromEmails:(id)a3;
+ (id)hashEmail:(id)a3;
- (BOOL)useSmallerAirDrop;
- (WPAWDL)initWithDelegate:(id)a3;
- (WPAWDL)initWithDelegate:(id)a3 queue:(id)a4;
- (WPAWDL)initWithDelegate:(id)a3 queue:(id)a4 machName:(id)a5;
- (WPAWDLDelegate)delegate;
- (id)clientAsString;
- (void)advertisingFailedToStart:(id)a3 ofType:(unsigned __int8)a4;
- (void)advertisingPendingOfType:(unsigned __int8)a3;
- (void)advertisingStartedOfType:(unsigned __int8)a3;
- (void)advertisingStoppedOfType:(unsigned __int8)a3 withError:(id)a4;
- (void)deviceDiscovered:(id)a3;
- (void)invalidate;
- (void)scanningFailedToStart:(id)a3 ofType:(unsigned __int8)a4;
- (void)scanningStartedOfType:(unsigned __int8)a3;
- (void)scanningStoppedOfType:(unsigned __int8)a3;
- (void)setDelegate:(id)a3;
- (void)setUseSmallerAirDrop:(BOOL)a3;
- (void)startConnectionlessAWDLServiceAdvertisingWithData:(id)a3;
- (void)startConnectionlessAWDLServiceScanning;
- (void)stateDidChange:(int64_t)a3;
- (void)stopConnectionlessAWDLServiceAdvertising;
- (void)stopConnectionlessAWDLServiceScanning;
- (void)updateAdvertisingRequest:(id)a3 withUpdate:(id)a4;
@end

@implementation WPAWDL

- (WPAWDL)initWithDelegate:(id)a3 queue:(id)a4 machName:(id)a5
{
  id v8 = a3;
  v22.receiver = self;
  v22.super_class = (Class)WPAWDL;
  v9 = [(WPClient *)&v22 initWithQueue:a4 machName:a5];
  v10 = v9;
  if (v9)
  {
    objc_storeWeak((id *)&v9->_delegate, v8);
    v10->_useSmallerAirDrop = 0;
    v11 = [MEMORY[0x263EFFA40] standardUserDefaults];
    v12 = [v11 persistentDomainForName:@"com.apple.MobileBluetooth.debug"];
    v13 = [v12 objectForKeyedSubscript:@"WIPROX"];

    v14 = [v13 objectForKeyedSubscript:@"UseSmallerAirDrop"];
    v15 = v14;
    if (v14)
    {
      v10->_useSmallerAirDrop = [v14 BOOLValue];
      if (WPLogInitOnce != -1) {
        dispatch_once(&WPLogInitOnce, &__block_literal_global_0);
      }
      v16 = WiProxLog;
      if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEBUG)) {
        -[WPAWDL initWithDelegate:queue:machName:]((unsigned __int8 *)&v10->_useSmallerAirDrop, v16);
      }
    }
    v17 = [v13 objectForKeyedSubscript:@"AirDropADVTimer"];
    v18 = v17;
    if (v17)
    {
      [v17 floatValue];
      *(double *)&AdvertiseTimer = v19;
      if (WPLogInitOnce != -1) {
        dispatch_once(&WPLogInitOnce, &__block_literal_global_118);
      }
      v20 = WiProxLog;
      if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEBUG)) {
        -[WPAWDL initWithDelegate:queue:machName:](v20);
      }
    }
  }
  return v10;
}

- (WPAWDL)initWithDelegate:(id)a3 queue:(id)a4
{
  return [(WPAWDL *)self initWithDelegate:a3 queue:a4 machName:0];
}

- (WPAWDL)initWithDelegate:(id)a3
{
  return [(WPAWDL *)self initWithDelegate:a3 queue:0];
}

- (id)clientAsString
{
  return @"WPAWDL";
}

- (void)invalidate
{
  [(WPAWDL *)self setDelegate:0];
  v3.receiver = self;
  v3.super_class = (Class)WPAWDL;
  [(WPClient *)&v3 invalidate];
}

+ (id)hashEmail:(id)a3
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v5 = a3;
  if (!v5)
  {
    v9 = [MEMORY[0x263F08690] currentHandler];
    [v9 handleFailureInMethod:a2 object:a1 file:@"WPAWDL.m" lineNumber:91 description:@"Invalid email"];
  }
  objc_msgSend(v5, "dataUsingEncoding:", 4, 0, 0, 0, 0);
  id v6 = objc_claimAutoreleasedReturnValue();
  CC_SHA256((const void *)[v6 bytes], objc_msgSend(v6, "length"), (unsigned __int8 *)&v10);
  v7 = [MEMORY[0x263EFF8F8] dataWithBytes:&v10 length:3];

  return v7;
}

+ (id)generateDataFromEmails:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v5 = a3;
  if (!v5)
  {
    v17 = [MEMORY[0x263F08690] currentHandler];
    [v17 handleFailureInMethod:a2 object:a1 file:@"WPAWDL.m" lineNumber:104 description:@"emails not valid"];
  }
  char v20 = 0;
  uint64_t v19 = 0;
  char v18 = 1;
  if ((unint64_t)[v5 count] > 2)
  {
    int v6 = 3;
  }
  else
  {
    int v6 = [v5 count];
    if (v6 < 1) {
      goto LABEL_12;
    }
  }
  uint64_t v7 = 0;
  uint64_t v8 = v6;
  unsigned int v9 = 3;
  do
  {
    long long v10 = [v5 objectAtIndexedSubscript:v7];
    if (v10)
    {
      uint64_t v11 = [MEMORY[0x263EFF9D0] null];
      char v12 = [v10 isEqual:v11];

      if ((v12 & 1) == 0)
      {
        id v13 = +[WPAWDL hashEmail:v10];
        v14 = (char *)[v13 bytes];
        *(&v18 + v9 - 2) = *v14;
        *(&v18 + v9 - 1) = v14[1];
        *(&v18 + v9) = v14[2];
      }
    }

    ++v7;
    v9 += 3;
  }
  while (v8 != v7);
LABEL_12:
  v15 = [MEMORY[0x263EFF8F8] dataWithBytes:&v18 length:10];

  return v15;
}

- (void)startConnectionlessAWDLServiceAdvertisingWithData:(id)a3
{
  v21[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  if ((unint64_t)[v4 length] < 0x17)
  {
    v18[0] = 0;
    v18[1] = 0;
    __int16 v19 = 0;
    unsigned int v9 = 0;
    if (![(WPAWDL *)self useSmallerAirDrop])
    {
      v18[0] = 0;
      unsigned int v9 = 8;
    }
    long long v10 = (unsigned char *)[v4 bytes];
    if (![(WPAWDL *)self useSmallerAirDrop])
    {
      *((unsigned char *)v18 + v9) = *v10;
      v9 |= 1u;
    }
    uint64_t v11 = (char *)v18 + v9;
    char *v11 = v10[1];
    v11[1] = v10[2];
    v11[2] = v10[3];
    v11[3] = v10[4];
    v11[4] = v10[5];
    v11[5] = v10[6];
    v11[6] = v10[7];
    uint64_t v12 = v9 + 8;
    v11[7] = v10[8];
    if (![(WPAWDL *)self useSmallerAirDrop])
    {
      *((unsigned char *)v18 + v12) = v10[9];
      LODWORD(v12) = v9 + 9;
    }
    uint64_t v8 = +[WPAdvertisingRequest requestForClientType:5];
    [v8 setAdvertisingRate:48];
    id v13 = [MEMORY[0x263EFF8F8] dataWithBytes:v18 length:v12];
    [v8 setAdvertisingData:v13];

    [v8 setUpdateTime:*(double *)&AdvertiseTimer];
    if (WPLogInitOnce != -1) {
      dispatch_once(&WPLogInitOnce, &__block_literal_global_147);
    }
    v14 = WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v17 = v8;
      _os_log_impl(&dword_2144AA000, v14, OS_LOG_TYPE_DEFAULT, "AWDL start advertising with data: %{public}@", buf, 0xCu);
    }
    v15.receiver = self;
    v15.super_class = (Class)WPAWDL;
    [(WPClient *)&v15 startAdvertising:v8];
  }
  else
  {
    if (WPLogInitOnce != -1) {
      dispatch_once(&WPLogInitOnce, &__block_literal_global_138);
    }
    id v5 = (void *)WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR)) {
      -[WPAWDL startConnectionlessAWDLServiceAdvertisingWithData:](v5, v4);
    }
    int v6 = (void *)MEMORY[0x263F087E8];
    uint64_t v20 = *MEMORY[0x263F08320];
    v21[0] = @"WirelessProximity can't start advertising at this time.";
    uint64_t v7 = [NSDictionary dictionaryWithObjects:v21 forKeys:&v20 count:1];
    uint64_t v8 = [v6 errorWithDomain:@"WPErrorDomain" code:5 userInfo:v7];

    [(WPAWDL *)self advertisingFailedToStart:v8 ofType:5];
  }
}

- (void)updateAdvertisingRequest:(id)a3 withUpdate:(id)a4
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v5 = a3;
  int v6 = (void (**)(id, id))a4;
  [v5 setUpdateTime:0.0];
  [v5 setAdvertisingRate:290];
  if (WPLogInitOnce != -1) {
    dispatch_once(&WPLogInitOnce, &__block_literal_global_151);
  }
  uint64_t v7 = WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138543362;
    id v9 = v5;
    _os_log_impl(&dword_2144AA000, v7, OS_LOG_TYPE_DEFAULT, "AWDL update advertising with data: %{public}@", (uint8_t *)&v8, 0xCu);
  }
  v6[2](v6, v5);
}

- (void)stopConnectionlessAWDLServiceAdvertising
{
  objc_super v3 = +[WPAdvertisingRequest requestForClientType:5];
  v4.receiver = self;
  v4.super_class = (Class)WPAWDL;
  [(WPClient *)&v4 stopAdvertising:v3];
}

- (void)startConnectionlessAWDLServiceScanning
{
  objc_super v3 = objc_opt_new();
  [v3 setClientType:5];
  long long v5 = xmmword_2144DEB00;
  uint64_t v6 = 30;
  [v3 setScanningRates:&v5];
  [v3 setRssiThreshold:&unk_26C53DF68];
  v4.receiver = self;
  v4.super_class = (Class)WPAWDL;
  [(WPClient *)&v4 startScanning:v3];
}

- (void)stopConnectionlessAWDLServiceScanning
{
  objc_super v3 = objc_opt_new();
  [v3 setClientType:5];
  v4.receiver = self;
  v4.super_class = (Class)WPAWDL;
  [(WPClient *)&v4 stopScanning:v3];
}

- (void)stateDidChange:(int64_t)a3
{
  v7.receiver = self;
  v7.super_class = (Class)WPAWDL;
  [(WPClient *)&v7 stateDidChange:a3];
  objc_super v4 = [(WPAWDL *)self delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    uint64_t v6 = [(WPAWDL *)self delegate];
    [v6 awdlDidUpdateState:self];
  }
}

- (void)advertisingStartedOfType:(unsigned __int8)a3
{
  objc_super v4 = [(WPAWDL *)self delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = [(WPAWDL *)self delegate];
    [v6 awdlStartedAdvertising:self];
  }
}

- (void)advertisingStoppedOfType:(unsigned __int8)a3 withError:(id)a4
{
  char v5 = [(WPAWDL *)self delegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = [(WPAWDL *)self delegate];
    [v7 awdlStoppedAdvertising:self];
  }
}

- (void)advertisingPendingOfType:(unsigned __int8)a3
{
  objc_super v4 = [(WPAWDL *)self delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = [(WPAWDL *)self delegate];
    [v6 awdlAdvertisingPending:self];
  }
}

- (void)advertisingFailedToStart:(id)a3 ofType:(unsigned __int8)a4
{
  id v8 = a3;
  char v5 = [(WPAWDL *)self delegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = [(WPAWDL *)self delegate];
    [v7 awdl:self failedToStartAdvertisingWithError:v8];
  }
}

- (void)scanningStartedOfType:(unsigned __int8)a3
{
  objc_super v4 = [(WPAWDL *)self delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = [(WPAWDL *)self delegate];
    [v6 awdlStartedScanning:self];
  }
}

- (void)scanningStoppedOfType:(unsigned __int8)a3
{
  objc_super v4 = [(WPAWDL *)self delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = [(WPAWDL *)self delegate];
    [v6 awdlStoppedScanning:self];
  }
}

- (void)scanningFailedToStart:(id)a3 ofType:(unsigned __int8)a4
{
  id v8 = a3;
  char v5 = [(WPAWDL *)self delegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = [(WPAWDL *)self delegate];
    [v7 awdl:self failedToStartScanningWithError:v8];
  }
}

- (void)deviceDiscovered:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v4 = a3;
  char v5 = [v4 objectForKeyedSubscript:@"kDeviceAdvertisingData"];
  uint64_t v6 = [v5 length];
  if (v6 >= 22)
  {
    uint64_t v7 = objc_msgSend(v5, "subdataWithRange:", 12, 10);

    char v5 = (void *)v7;
LABEL_5:
    uint64_t v10 = [(WPAWDL *)self delegate];
    char v11 = objc_opt_respondsToSelector();

    if (v11)
    {
      uint64_t v12 = [(WPAWDL *)self delegate];
      [v12 awdl:self foundDevice:v5];
    }
    id v13 = [(WPAWDL *)self delegate];
    char v14 = objc_opt_respondsToSelector();

    if (v14)
    {
      objc_super v15 = [v4 objectForKeyedSubscript:@"kDeviceRSSI"];
      v16 = [(WPAWDL *)self delegate];
      [v16 awdl:self foundDevice:v5 rssi:v15];
    }
    goto LABEL_13;
  }
  uint64_t v8 = v6;
  if (v6 >= 8)
  {
    char v18 = 1;
    id v9 = v5;
    uint64_t v19 = *(void *)[v9 bytes];
    char v20 = 0;
    char v5 = [MEMORY[0x263EFF8F8] dataWithBytes:&v18 length:10];

    goto LABEL_5;
  }
  if (WPLogInitOnce != -1) {
    dispatch_once(&WPLogInitOnce, &__block_literal_global_179);
  }
  v17 = WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR)) {
    -[WPAWDL deviceDiscovered:](v8, v17);
  }
LABEL_13:
}

- (WPAWDLDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (WPAWDLDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)useSmallerAirDrop
{
  return self->_useSmallerAirDrop;
}

- (void)setUseSmallerAirDrop:(BOOL)a3
{
  self->_useSmallerAirDrop = a3;
}

- (void).cxx_destruct
{
}

- (void)initWithDelegate:(os_log_t)log queue:machName:.cold.1(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  int v1 = 134217984;
  uint64_t v2 = AdvertiseTimer;
  _os_log_debug_impl(&dword_2144AA000, log, OS_LOG_TYPE_DEBUG, "Using custom AirDrop aggressive advertising timer of %f seconds", (uint8_t *)&v1, 0xCu);
}

- (void)initWithDelegate:(unsigned __int8 *)a1 queue:(NSObject *)a2 machName:.cold.2(unsigned __int8 *a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = *a1;
  v3[0] = 67109120;
  v3[1] = v2;
  _os_log_debug_impl(&dword_2144AA000, a2, OS_LOG_TYPE_DEBUG, "Using custom (smaller) AirDrop: %d", (uint8_t *)v3, 8u);
}

- (void)startConnectionlessAWDLServiceAdvertisingWithData:(void *)a1 .cold.1(void *a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  uint64_t v3 = a1;
  int v4 = 134217984;
  uint64_t v5 = [a2 length];
  _os_log_error_impl(&dword_2144AA000, v3, OS_LOG_TYPE_ERROR, "Adv payload length is too big: %lu", (uint8_t *)&v4, 0xCu);
}

- (void)deviceDiscovered:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 134217984;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_2144AA000, a2, OS_LOG_TYPE_ERROR, "AWDL: Minimum advertisement data length expected: 8, received: %lu", (uint8_t *)&v2, 0xCu);
}

@end