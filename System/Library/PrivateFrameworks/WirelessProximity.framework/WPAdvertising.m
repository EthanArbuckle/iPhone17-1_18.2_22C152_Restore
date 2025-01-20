@interface WPAdvertising
+ (id)puckTypeToString:(unsigned __int8)a3;
+ (unsigned)puckStringToType:(id)a3;
- (WPAdvertising)initWithDelegate:(id)a3 queue:(id)a4;
- (WPAdvertisingDelegate)delegate;
- (id)clientAsString;
- (id)parseCompanyData:(id)a3;
- (void)advertisingFailedToStart:(id)a3 ofType:(unsigned __int8)a4;
- (void)advertisingPendingOfType:(unsigned __int8)a3;
- (void)advertisingStartedOfType:(unsigned __int8)a3;
- (void)advertisingStoppedOfType:(unsigned __int8)a3 withError:(id)a4;
- (void)deregisterService:(id)a3;
- (void)invalidate;
- (void)registerService:(id)a3;
- (void)setDelegate:(id)a3;
- (void)stateDidChange:(int64_t)a3;
@end

@implementation WPAdvertising

- (WPAdvertising)initWithDelegate:(id)a3 queue:(id)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)WPAdvertising;
  v8 = [(WPClient *)&v11 initWithQueue:a4 machName:0];
  v9 = v8;
  if (v8) {
    objc_storeStrong((id *)&v8->_delegate, a3);
  }

  return v9;
}

- (id)clientAsString
{
  return @"WPAdvertising";
}

- (void)invalidate
{
  [(WPAdvertising *)self setDelegate:0];
  v3.receiver = self;
  v3.super_class = (Class)WPAdvertising;
  [(WPClient *)&v3 invalidate];
}

+ (unsigned)puckStringToType:(id)a3
{
  if ([a3 isEqualToString:@"WPBeaconTypeCompany"]) {
    return 2;
  }
  else {
    return 27;
  }
}

+ (id)puckTypeToString:(unsigned __int8)a3
{
  if (a3 == 2) {
    return @"WPBeaconTypeCompany";
  }
  unsigned int v4 = a3;
  id v7 = [MEMORY[0x263F08690] currentHandler];
  objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, @"WPAdvertising.m", 79, @"Unknown puck type %ld", v4);

  return 0;
}

- (void)registerService:(id)a3
{
  id v4 = a3;
  if (WPLogInitOnce != -1) {
    dispatch_once(&WPLogInitOnce, &__block_literal_global_3);
  }
  v5 = WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEBUG)) {
    -[WPAdvertising registerService:]((uint64_t)v4, v5, v6, v7, v8, v9, v10, v11);
  }
  v12 = [v4 objectForKeyedSubscript:@"WPBeaconType"];
  uint64_t v13 = +[WPAdvertising puckStringToType:v12];

  v14 = +[WPAdvertisingRequest requestForClientType:v13];
  if (v13 == 2)
  {
    v15 = [(WPAdvertising *)self parseCompanyData:v4];
    [v14 setAdvertisingData:v15];

    if (+[WPClient isHomePodOrIOS])
    {
      v16 = [v4 objectForKeyedSubscript:@"WPBeaconAdvInterval"];

      if (v16)
      {
        v17 = [v4 objectForKeyedSubscript:@"WPBeaconAdvInterval"];
        objc_msgSend(v14, "setAdvertisingRate:", objc_msgSend(v17, "integerValue"));
      }
    }
  }
  v18.receiver = self;
  v18.super_class = (Class)WPAdvertising;
  [(WPClient *)&v18 startAdvertising:v14];
}

- (void)deregisterService:(id)a3
{
  id v4 = a3;
  if (WPLogInitOnce != -1) {
    dispatch_once(&WPLogInitOnce, &__block_literal_global_163);
  }
  v5 = WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEBUG)) {
    -[WPAdvertising deregisterService:]((uint64_t)v4, v5, v6, v7, v8, v9, v10, v11);
  }
  v12 = [v4 objectForKeyedSubscript:@"WPBeaconType"];
  uint64_t v13 = +[WPAdvertising puckStringToType:v12];

  v14 = +[WPAdvertisingRequest requestForClientType:v13];
  v15.receiver = self;
  v15.super_class = (Class)WPAdvertising;
  [(WPClient *)&v15 stopAdvertising:v14];
}

- (void)stateDidChange:(int64_t)a3
{
  v7.receiver = self;
  v7.super_class = (Class)WPAdvertising;
  [(WPClient *)&v7 stateDidChange:a3];
  id v4 = [(WPAdvertising *)self delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    uint64_t v6 = [(WPAdvertising *)self delegate];
    [v6 advertiserDidUpdateState:self];
  }
}

- (void)advertisingStartedOfType:(unsigned __int8)a3
{
  id v4 = [(WPAdvertising *)self delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = [(WPAdvertising *)self delegate];
    [v6 advertiserDidRegisterService];
  }
}

- (void)advertisingStoppedOfType:(unsigned __int8)a3 withError:(id)a4
{
  id v4 = a4;
  if (WPLogInitOnce != -1) {
    dispatch_once(&WPLogInitOnce, &__block_literal_global_173);
  }
  char v5 = WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEBUG)) {
    -[WPAdvertising advertisingStoppedOfType:withError:](v5);
  }
}

- (void)advertisingFailedToStart:(id)a3 ofType:(unsigned __int8)a4
{
  char v5 = [(WPAdvertising *)self delegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = [(WPAdvertising *)self delegate];
    [v7 advertiserFailedToRegisterService];
  }
}

- (void)advertisingPendingOfType:(unsigned __int8)a3
{
  id v4 = [(WPAdvertising *)self delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = [(WPAdvertising *)self delegate];
    [v6 advertiserPendingServiceOfType:0];
  }
}

- (id)parseCompanyData:(id)a3
{
  v21[3] = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = [v3 objectForKeyedSubscript:@"WPBeaconTypeCompanyMajor"];
  char v5 = [v3 objectForKeyedSubscript:@"WPBeaconTypeCompanyMinor"];
  id v6 = [v3 objectForKeyedSubscript:@"WPBeaconTX"];
  id v7 = [v3 objectForKeyedSubscript:@"WPBeaconTypeCompanyUUID"];
  uint64_t v8 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:v7];
  memset(v21, 0, 22);
  [v8 getUUIDBytes:v21];
  if (v4)
  {
    LOBYTE(v21[2]) = (unsigned __int16)[v4 integerValue] >> 8;
    BYTE1(v21[2]) = [v4 integerValue];
    if (v5)
    {
      BYTE2(v21[2]) = (unsigned __int16)[v5 integerValue] >> 8;
      BYTE3(v21[2]) = [v5 integerValue];
    }
  }
  else
  {
    if (WPLogInitOnce != -1) {
      dispatch_once(&WPLogInitOnce, &__block_literal_global_180);
    }
    uint64_t v9 = WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEBUG)) {
      -[WPAdvertising parseCompanyData:]((uint64_t)v3, v9, v10, v11, v12, v13, v14, v15);
    }
  }
  BYTE4(v21[2]) = [v6 integerValue];
  if (+[WPClient isHomePodOrIOS])
  {
    v16 = [v3 objectForKeyedSubscript:@"WPBeaconTypeCompanyConfig"];
    v17 = v16;
    if (v16)
    {
      BYTE5(v21[2]) = [v16 integerValue];
      uint64_t v18 = 22;
    }
    else
    {
      uint64_t v18 = 21;
    }
  }
  else
  {
    uint64_t v18 = 21;
  }
  v19 = [MEMORY[0x263EFF8F8] dataWithBytes:v21 length:v18];

  return v19;
}

- (WPAdvertisingDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

- (void)registerService:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)deregisterService:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)advertisingStoppedOfType:(os_log_t)log withError:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_2144AA000, log, OS_LOG_TYPE_DEBUG, "Advertising stopped in WPAdvertising class", v1, 2u);
}

- (void)parseCompanyData:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end