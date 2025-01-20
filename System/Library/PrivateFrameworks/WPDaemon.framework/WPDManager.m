@interface WPDManager
+ (BOOL)isInternalBuild;
+ (id)advAllowlist;
+ (id)cbStateAsString:(int64_t)a3;
+ (id)scanAllowlist;
+ (id)wpStateAsString:(int64_t)a3;
+ (void)initialize;
+ (void)initializeAdvDenylist:(id)a3 AdvAllowlist:(id)a4 ScanDenylist:(id)a5 ScanAllowlist:(id)a6;
- (BOOL)isAdvertisingAllowlistedForType:(unsigned __int8)a3;
- (BOOL)isHomePod;
- (BOOL)isInternalBuild;
- (BOOL)isScanAllowlistedForType:(unsigned __int8)a3;
- (BOOL)restricted;
- (BOOL)testMode;
- (NSIndexSet)advAllowlist;
- (NSIndexSet)scanAllowlist;
- (NSSet)cbManagers;
- (NSString)description;
- (NSString)name;
- (WPDManager)initWithServer:(id)a3 Name:(id)a4;
- (WPDaemonServer)server;
- (id)generateStateDumpStrings;
- (int64_t)state;
- (void)cbManagerDidUpdateState:(id)a3;
- (void)cleanup;
- (void)dealloc;
- (void)generateStateDump;
- (void)setCbManagers:(id)a3;
- (void)setName:(id)a3;
- (void)setRestricted:(BOOL)a3;
- (void)setServer:(id)a3;
- (void)setState:(int64_t)a3;
- (void)setTestMode:(BOOL)a3;
- (void)update;
- (void)updateState:(int64_t)a3 Restricted:(BOOL)a4;
@end

@implementation WPDManager

- (WPDaemonServer)server
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_server);
  return (WPDaemonServer *)WeakRetained;
}

- (BOOL)isScanAllowlistedForType:(unsigned __int8)a3
{
  unsigned int v3 = a3;
  v4 = +[WPDManager scanAllowlist];
  v5 = v4;
  if (v4) {
    char v6 = [v4 containsIndex:v3];
  }
  else {
    char v6 = 1;
  }

  return v6;
}

+ (id)scanAllowlist
{
  return (id)_scanAllowlist;
}

- (int64_t)state
{
  return self->_state;
}

- (BOOL)isAdvertisingAllowlistedForType:(unsigned __int8)a3
{
  unsigned int v3 = a3;
  v4 = +[WPDManager advAllowlist];
  v5 = v4;
  if (v4) {
    char v6 = [v4 containsIndex:v3];
  }
  else {
    char v6 = 1;
  }

  return v6;
}

- (BOOL)testMode
{
  return self->_testMode;
}

- (BOOL)isHomePod
{
  return self->_isHomePod;
}

+ (id)advAllowlist
{
  return (id)_advAllowlist;
}

+ (BOOL)isInternalBuild
{
  return _isInternalBuild;
}

+ (void)initialize
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  if ((id)objc_opt_class() == a1)
  {
    _isInternalBuild = os_variant_has_internal_diagnostics();
    if (WPLogInitOnce != -1) {
      dispatch_once(&WPLogInitOnce, &__block_literal_global_1);
    }
    v2 = WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 67109120;
      LODWORD(v12) = _isInternalBuild;
      _os_log_impl(&dword_22316D000, v2, OS_LOG_TYPE_DEFAULT, "WPDManager _isInternalBuild: %d", (uint8_t *)&v11, 8u);
    }
    if (_isInternalBuild)
    {
      uint64_t v3 = _getCombinedAllowlist(@"ScanDenylist", @"ScanAllowlist");
      v4 = (void *)_scanAllowlist;
      _scanAllowlist = v3;

      if (WPLogInitOnce != -1) {
        dispatch_once(&WPLogInitOnce, &__block_literal_global_116);
      }
      v5 = WiProxLog;
      if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
      {
        int v11 = 138412290;
        uint64_t v12 = _scanAllowlist;
        _os_log_impl(&dword_22316D000, v5, OS_LOG_TYPE_DEFAULT, "WPDManager scanAllowlist: %@", (uint8_t *)&v11, 0xCu);
      }
      uint64_t v6 = _getCombinedAllowlist(@"AdvDenylist", @"AdvAllowlist");
      v7 = (void *)_advAllowlist;
      _advAllowlist = v6;

      if (WPLogInitOnce != -1) {
        dispatch_once(&WPLogInitOnce, &__block_literal_global_119);
      }
      v8 = WiProxLog;
      if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
      {
        int v11 = 138412290;
        uint64_t v12 = _advAllowlist;
        _os_log_impl(&dword_22316D000, v8, OS_LOG_TYPE_DEFAULT, "WPDManager advAllowlist %@", (uint8_t *)&v11, 0xCu);
      }
    }
    else
    {
      v9 = (void *)_scanAllowlist;
      _scanAllowlist = 0;

      v10 = (void *)_advAllowlist;
      _advAllowlist = 0;
    }
  }
}

- (BOOL)isInternalBuild
{
  return +[WPDManager isInternalBuild];
}

- (NSIndexSet)scanAllowlist
{
  return (NSIndexSet *)+[WPDManager scanAllowlist];
}

- (NSIndexSet)advAllowlist
{
  return (NSIndexSet *)+[WPDManager advAllowlist];
}

- (WPDManager)initWithServer:(id)a3 Name:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)WPDManager;
  v8 = [(WPDManager *)&v12 init];
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_server, v6);
    objc_storeStrong((id *)&v9->_name, a4);
    v9->_state = 0;
    *(_WORD *)&v9->_restricted = 0;
    cbManagers = v9->_cbManagers;
    v9->_cbManagers = 0;

    v9->_isHomePod = +[WPDaemonServer isHomePod];
  }

  return v9;
}

- (void)cleanup
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  if (WPLogInitOnce != -1) {
    dispatch_once(&WPLogInitOnce, &__block_literal_global_122);
  }
  uint64_t v3 = WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
  {
    name = self->_name;
    int v5 = 138412290;
    id v6 = name;
    _os_log_impl(&dword_22316D000, v3, OS_LOG_TYPE_DEFAULT, "%@ dealloc", (uint8_t *)&v5, 0xCu);
  }
  [(WPDManager *)self setState:0];
}

- (void)dealloc
{
  [(WPDManager *)self cleanup];
  v3.receiver = self;
  v3.super_class = (Class)WPDManager;
  [(WPDManager *)&v3 dealloc];
}

- (NSString)description
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  objc_super v3 = (void *)MEMORY[0x223CB05A0](self, a2);
  v4 = [(WPDManager *)self generateStateDumpStrings];
  uint64_t v5 = [v4 count] - 1;
  id v6 = [MEMORY[0x263F089D8] stringWithFormat:@"%@\n", self->_name];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v7 = objc_msgSend(v4, "subarrayWithRange:", 1, v5);
  uint64_t v8 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v15 != v10) {
          objc_enumerationMutation(v7);
        }
        [v6 appendString:*(void *)(*((void *)&v14 + 1) + 8 * i)];
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v9);
  }

  objc_super v12 = [NSString stringWithString:v6];

  return (NSString *)v12;
}

- (id)generateStateDumpStrings
{
  objc_super v3 = [MEMORY[0x263EFF980] array];
  v4 = [NSString stringWithFormat:@"========= %@ =========\n", self->_name];
  [v3 addObject:v4];

  uint64_t v5 = NSString;
  id v6 = +[WPDManager wpStateAsString:[(WPDManager *)self state]];
  uint64_t v7 = [v5 stringWithFormat:@"state: %@ (%d)\n", v6, -[WPDManager state](self, "state")];
  [v3 addObject:v7];

  uint64_t v8 = NSString;
  BOOL v9 = [(WPDManager *)self testMode];
  uint64_t v10 = "no";
  if (v9) {
    uint64_t v10 = "yes";
  }
  int v11 = objc_msgSend(v8, "stringWithFormat:", @"testMode: %s\n", v10);
  [v3 addObject:v11];

  objc_super v12 = [MEMORY[0x263EFF8C0] arrayWithArray:v3];

  return v12;
}

- (void)generateStateDump
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v2 = [(WPDManager *)self generateStateDumpStrings];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v9 objects:v15 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v10;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v10 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void *)(*((void *)&v9 + 1) + 8 * v6);
        if (WPLogInitOnce != -1) {
          dispatch_once(&WPLogInitOnce, &__block_literal_global_144);
        }
        uint64_t v8 = WiProxLog;
        if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v14 = v7;
          _os_log_impl(&dword_22316D000, v8, OS_LOG_TYPE_DEFAULT, "WPDaemon statedump: %@", buf, 0xCu);
        }
        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v9 objects:v15 count:16];
    }
    while (v4);
  }
}

- (void)cbManagerDidUpdateState:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(WPDManager *)self cbManagers];
  int v6 = [v5 containsObject:v4];

  if (v6)
  {
    uint64_t v7 = [(WPDManager *)self server];
    [v7 cbManagerDidUpdateState:v4];
  }
  else
  {
    if (WPLogInitOnce != -1) {
      dispatch_once(&WPLogInitOnce, &__block_literal_global_146);
    }
    uint64_t v8 = (void *)WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR)) {
      [(WPDManager *)v8 cbManagerDidUpdateState:(uint64_t)v4];
    }
  }
}

- (void)updateState:(int64_t)a3 Restricted:(BOOL)a4
{
  BOOL v4 = a4;
  int v5 = a3;
  uint64_t v16 = *MEMORY[0x263EF8340];
  -[WPDManager setState:](self, "setState:");
  [(WPDManager *)self setRestricted:v4];
  if (WPLogInitOnce != -1) {
    dispatch_once(&WPLogInitOnce, &__block_literal_global_148);
  }
  uint64_t v7 = (void *)WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v8 = v7;
    long long v9 = [(WPDManager *)self name];
    int v10 = 138412802;
    long long v11 = v9;
    __int16 v12 = 1024;
    int v13 = v5;
    __int16 v14 = 1024;
    BOOL v15 = v4;
    _os_log_debug_impl(&dword_22316D000, v8, OS_LOG_TYPE_DEBUG, "Manager %@ updated state:%d restricted:%d", (uint8_t *)&v10, 0x18u);
  }
  [(WPDManager *)self update];
}

- (void)update
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  int v1 = 136315138;
  v2 = "-[WPDManager update]";
  _os_log_error_impl(&dword_22316D000, log, OS_LOG_TYPE_ERROR, "%s must override", (uint8_t *)&v1, 0xCu);
}

+ (id)wpStateAsString:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 2) {
    return @"unknown";
  }
  else {
    return off_26469AB30[a3 - 1];
  }
}

+ (id)cbStateAsString:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 9) {
    return @"unknown";
  }
  else {
    return off_26469AB48[a3 - 1];
  }
}

+ (void)initializeAdvDenylist:(id)a3 AdvAllowlist:(id)a4 ScanDenylist:(id)a5 ScanAllowlist:(id)a6
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  if (_isInternalBuild)
  {
    uint64_t v13 = _combineDenylistAndAllowlist(v11, v12);
  }
  else
  {
    uint64_t v13 = 0;
  }
  __int16 v14 = (void *)_scanAllowlist;
  _scanAllowlist = v13;

  if (_scanAllowlist)
  {
    if (WPLogInitOnce != -1) {
      dispatch_once(&WPLogInitOnce, &__block_literal_global_173);
    }
    BOOL v15 = WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
    {
      int v19 = 138412802;
      v20 = @"ScanDenylist";
      __int16 v21 = 2112;
      v22 = @"ScanAllowlist";
      __int16 v23 = 2112;
      uint64_t v24 = _scanAllowlist;
      _os_log_impl(&dword_22316D000, v15, OS_LOG_TYPE_DEFAULT, "Combined %@ and %@ into allowlist: %@", (uint8_t *)&v19, 0x20u);
    }
  }
  if (_isInternalBuild)
  {
    uint64_t v16 = _combineDenylistAndAllowlist(v9, v10);
  }
  else
  {
    uint64_t v16 = 0;
  }
  long long v17 = (void *)_advAllowlist;
  _advAllowlist = v16;

  if (_advAllowlist)
  {
    if (WPLogInitOnce != -1) {
      dispatch_once(&WPLogInitOnce, &__block_literal_global_176);
    }
    v18 = WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
    {
      int v19 = 138412802;
      v20 = @"AdvDenylist";
      __int16 v21 = 2112;
      v22 = @"AdvAllowlist";
      __int16 v23 = 2112;
      uint64_t v24 = _advAllowlist;
      _os_log_impl(&dword_22316D000, v18, OS_LOG_TYPE_DEFAULT, "Combined %@ and %@ into allowlist: %@", (uint8_t *)&v19, 0x20u);
    }
  }
}

- (void)setState:(int64_t)a3
{
  self->_state = a3;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (BOOL)restricted
{
  return self->_restricted;
}

- (void)setRestricted:(BOOL)a3
{
  self->_restricted = a3;
}

- (void)setTestMode:(BOOL)a3
{
  self->_testMode = a3;
}

- (void)setServer:(id)a3
{
}

- (NSSet)cbManagers
{
  return self->_cbManagers;
}

- (void)setCbManagers:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cbManagers, 0);
  objc_destroyWeak((id *)&self->_server);
  objc_storeStrong((id *)&self->_name, 0);
}

- (void)cbManagerDidUpdateState:(uint64_t)a3 .cold.1(void *a1, void *a2, uint64_t a3)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  int v5 = a1;
  int v6 = [a2 name];
  int v7 = 138412546;
  uint64_t v8 = v6;
  __int16 v9 = 2112;
  uint64_t v10 = a3;
  _os_log_error_impl(&dword_22316D000, v5, OS_LOG_TYPE_ERROR, "%@ manager - unexpected CB manager %@", (uint8_t *)&v7, 0x16u);
}

@end