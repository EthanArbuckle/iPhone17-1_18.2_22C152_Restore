@interface PSUICoreTelephonyRadioCache
+ (id)sharedInstance;
- (BOOL)statusFetched;
- (CoreTelephonyClient)coreTelephonyClient;
- (PSUICoreTelephonyRadioCache)init;
- (PSUICoreTelephonyRadioCache)initWithCoreTelephonyClient:(id)a3;
- (id)getLogger;
- (id)initPrivate;
- (int)checkCellularHealthStatus;
- (int)healthStatus;
- (int64_t)healthDiagCode;
- (void)dealloc;
- (void)setCoreTelephonyClient:(id)a3;
- (void)setHealthDiagCode:(int64_t)a3;
- (void)setHealthStatus:(int)a3;
- (void)setStatusFetched:(BOOL)a3;
- (void)willEnterForeground;
@end

@implementation PSUICoreTelephonyRadioCache

+ (id)sharedInstance
{
  if (qword_26AC32228 != -1) {
    dispatch_once(&qword_26AC32228, &__block_literal_global_2);
  }
  v2 = (void *)_MergedGlobals_56;
  return v2;
}

uint64_t __45__PSUICoreTelephonyRadioCache_sharedInstance__block_invoke()
{
  _MergedGlobals_56 = [[PSUICoreTelephonyRadioCache alloc] initPrivate];
  return MEMORY[0x270F9A758]();
}

- (id)initPrivate
{
  v8.receiver = self;
  v8.super_class = (Class)PSUICoreTelephonyRadioCache;
  v2 = [(PSUICoreTelephonyRadioCache *)&v8 init];
  if (v2)
  {
    id v3 = objc_alloc(MEMORY[0x263F02D30]);
    v4 = [MEMORY[0x263F67F00] createCTClientSerialQueue:@"radio_queue"];
    v5 = (void *)[v3 initWithQueue:v4];

    v2 = [(PSUICoreTelephonyRadioCache *)v2 initWithCoreTelephonyClient:v5];
    v6 = [MEMORY[0x263F08A00] defaultCenter];
    [v6 addObserver:v2 selector:sel_willEnterForeground name:*MEMORY[0x263F833B8] object:0];
  }
  return v2;
}

- (PSUICoreTelephonyRadioCache)init
{
  v2 = [(PSUICoreTelephonyRadioCache *)self getLogger];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)id v3 = 0;
    _os_log_error_impl(&dword_221B17000, v2, OS_LOG_TYPE_ERROR, "Unsupported initializer called", v3, 2u);
  }

  objc_exception_throw((id)[objc_alloc(MEMORY[0x263EFF940]) initWithName:@"Unsupported initializer" reason:@"Unsupported initializer called" userInfo:0]);
}

- (PSUICoreTelephonyRadioCache)initWithCoreTelephonyClient:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PSUICoreTelephonyRadioCache;
  v6 = [(PSUICoreTelephonyRadioCache *)&v9 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_coreTelephonyClient, a3);
    [(CoreTelephonyClient *)v7->_coreTelephonyClient setDelegate:v7];
    [(PSUICoreTelephonyRadioCache *)v7 setStatusFetched:0];
    [(PSUICoreTelephonyRadioCache *)v7 setHealthStatus:0];
    [(PSUICoreTelephonyRadioCache *)v7 setHealthDiagCode:-255];
  }

  return v7;
}

- (void)willEnterForeground
{
}

- (void)dealloc
{
  id v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)PSUICoreTelephonyRadioCache;
  [(PSUICoreTelephonyRadioCache *)&v4 dealloc];
}

- (int)checkCellularHealthStatus
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  v2 = self;
  objc_sync_enter(v2);
  if ([(PSUICoreTelephonyRadioCache *)v2 statusFetched])
  {
    id v3 = [(PSUICoreTelephonyRadioCache *)v2 getLogger];
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v17) = [(PSUICoreTelephonyRadioCache *)v2 healthStatus];
      _os_log_impl(&dword_221B17000, v3, OS_LOG_TYPE_DEFAULT, "skip query and return healthStatus %d", buf, 8u);
    }

    int v4 = [(PSUICoreTelephonyRadioCache *)v2 healthStatus];
    objc_sync_exit(v2);
  }
  else
  {
    objc_sync_exit(v2);

    coreTelephonyClient = v2->_coreTelephonyClient;
    id v15 = 0;
    uint64_t v6 = [(CoreTelephonyClient *)coreTelephonyClient checkCellularDiagnosticsStatusDetails:&v15];
    uint64_t v8 = v7;
    objc_super v9 = (char *)v15;
    if (v9)
    {
      v10 = [(PSUICoreTelephonyRadioCache *)v2 getLogger];
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v17 = v9;
        _os_log_error_impl(&dword_221B17000, v10, OS_LOG_TYPE_ERROR, "checking cellular health status error: %@", buf, 0xCu);
      }
    }
    v11 = v2;
    objc_sync_enter(v11);
    [(PSUICoreTelephonyRadioCache *)v11 setStatusFetched:1];
    [(PSUICoreTelephonyRadioCache *)v11 setHealthDiagCode:v8];
    [(PSUICoreTelephonyRadioCache *)v11 setHealthStatus:(v6 & 0xFFFFFFFFFFFFFFFELL) == 2];
    objc_sync_exit(v11);

    v12 = [(PSUICoreTelephonyRadioCache *)v11 getLogger];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = [(PSUICoreTelephonyRadioCache *)v11 healthStatus];
      *(_DWORD *)buf = 136315906;
      v17 = "-[PSUICoreTelephonyRadioCache checkCellularHealthStatus]";
      __int16 v18 = 1024;
      int v19 = v13;
      __int16 v20 = 2048;
      uint64_t v21 = v6;
      __int16 v22 = 2048;
      uint64_t v23 = v8;
      _os_log_impl(&dword_221B17000, v12, OS_LOG_TYPE_DEFAULT, "%s Cellular health status updated to %d [CTHealthStatus=%ld, diagCode=%ld]", buf, 0x26u);
    }

    int v4 = [(PSUICoreTelephonyRadioCache *)v11 healthStatus];
    v2 = (PSUICoreTelephonyRadioCache *)v9;
  }

  return v4;
}

- (id)getLogger
{
  return (id)[MEMORY[0x263F67EB0] loggerWithCategory:@"RadioCache"];
}

- (CoreTelephonyClient)coreTelephonyClient
{
  return self->_coreTelephonyClient;
}

- (void)setCoreTelephonyClient:(id)a3
{
}

- (BOOL)statusFetched
{
  return self->_statusFetched;
}

- (void)setStatusFetched:(BOOL)a3
{
  self->_statusFetched = a3;
}

- (int)healthStatus
{
  return self->_healthStatus;
}

- (void)setHealthStatus:(int)a3
{
  self->_healthStatus = a3;
}

- (int64_t)healthDiagCode
{
  return self->_healthDiagCode;
}

- (void)setHealthDiagCode:(int64_t)a3
{
  self->_healthDiagCode = a3;
}

- (void).cxx_destruct
{
}

@end