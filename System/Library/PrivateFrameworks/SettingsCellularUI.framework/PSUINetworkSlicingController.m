@interface PSUINetworkSlicingController
- (NSArray)fCategories;
- (PSUICoreTelephonyCapabilitiesCache)capabilityCache;
- (PSUINetworkSlicingController)init;
- (PSUINetworkSlicingController)initWithCapabilityCache:(id)a3;
- (id)getLogger;
- (id)getNetworkSlicingAppCategory:(id)a3;
- (id)specifiers;
- (void)_enableNetworkSlicing:(BOOL)a3 categoryID:(id)a4;
- (void)setCapabilityCache:(id)a3;
- (void)setFCategories:(id)a3;
- (void)setNetworkSlicingAppCategory:(id)a3 specifier:(id)a4;
@end

@implementation PSUINetworkSlicingController

- (PSUINetworkSlicingController)init
{
  v3 = +[PSUICoreTelephonyCapabilitiesCache sharedInstance];
  v4 = [(PSUINetworkSlicingController *)self initWithCapabilityCache:v3];

  return v4;
}

- (PSUINetworkSlicingController)initWithCapabilityCache:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PSUINetworkSlicingController;
  v6 = [(PSUINetworkSlicingController *)&v10 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_capabilityCache, a3);
    fCategories = v7->_fCategories;
    v7->_fCategories = 0;
  }
  return v7;
}

- (id)specifiers
{
  uint64_t v45 = *MEMORY[0x263EF8340];
  v3 = *(Class *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x263F5FDB8]);
  if (!v3)
  {
    uint64_t v31 = (int)*MEMORY[0x263F5FDB8];
    uint64_t v4 = [*(id *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x263F5FE98]) propertyForKey:*MEMORY[0x263F60290]];
    id v5 = [(PSUINetworkSlicingController *)self getLogger];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v42 = v4;
      _os_log_debug_impl(&dword_221B17000, v5, OS_LOG_TYPE_DEBUG, "Slicing: reload, context=%@", buf, 0xCu);
    }

    id v6 = objc_alloc_init(MEMORY[0x263EFF980]);
    [MEMORY[0x263F5FC40] groupSpecifierWithID:@"NetworkSlicingGroupSpecifierKey"];
    v34 = v33 = v6;
    [v6 addObject:v34];
    v7 = [(PSUICoreTelephonyCapabilitiesCache *)self->_capabilityCache networkSlicingCategories:v4];
    [(PSUINetworkSlicingController *)self setFCategories:v7];

    v8 = [(PSUINetworkSlicingController *)self getLogger];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      v29 = [(PSUINetworkSlicingController *)self fCategories];
      *(_DWORD *)buf = 138412546;
      uint64_t v42 = v4;
      __int16 v43 = 2112;
      v44 = v29;
      _os_log_debug_impl(&dword_221B17000, v8, OS_LOG_TYPE_DEBUG, "Slicing: reload, context=%@, categories:%@", buf, 0x16u);
    }
    v30 = (void *)v4;

    long long v38 = 0u;
    long long v39 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    v35 = self;
    id obj = [(PSUINetworkSlicingController *)self fCategories];
    uint64_t v9 = [obj countByEnumeratingWithState:&v36 objects:v40 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v37;
      uint64_t v12 = *MEMORY[0x263F02E70];
      uint64_t v13 = *MEMORY[0x263F02E68];
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v37 != v11) {
            objc_enumerationMutation(obj);
          }
          v15 = *(void **)(*((void *)&v36 + 1) + 8 * i);
          v16 = (void *)MEMORY[0x263F5FC40];
          v17 = [v15 objectForKey:v12];
          v18 = [v16 preferenceSpecifierNamed:v17 target:v35 set:sel_setNetworkSlicingAppCategory_specifier_ get:sel_getNetworkSlicingAppCategory_ detail:0 cell:6 edit:0];

          v19 = [v15 objectForKey:v13];
          v20 = [NSString stringWithFormat:@"%@", v19];
          [v18 setIdentifier:v20];

          [v18 setUserInfo:v19];
          objc_msgSend(v33, "ps_addSpecifier:toGroup:", v18, v34);
        }
        uint64_t v10 = [obj countByEnumeratingWithState:&v36 objects:v40 count:16];
      }
      while (v10);
    }

    v21 = NSString;
    v22 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v23 = [v22 localizedStringForKey:@"CONSUMER_SLICING_FOOTER_%@" value:&stru_26D410CA0 table:@"Cellular"];
    v24 = +[PSUICoreTelephonyCarrierBundleCache sharedInstance];
    v25 = [v24 carrierName:v30];
    v26 = objc_msgSend(v21, "stringWithFormat:", v23, v25);

    [v34 setProperty:v26 forKey:*MEMORY[0x263F600F8]];
    [MEMORY[0x263F67F00] logSpecifiers:v33 origin:@"[PSUINetworkSlicingController specifiers] end"];
    v27 = *(Class *)((char *)&v35->super.super.super.super.super.isa + v31);
    *(Class *)((char *)&v35->super.super.super.super.super.isa + v31) = (Class)v33;

    v3 = *(Class *)((char *)&v35->super.super.super.super.super.isa + v31);
  }
  return v3;
}

- (id)getNetworkSlicingAppCategory:(id)a3
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  uint64_t v4 = [a3 userInfo];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v5 = [(PSUINetworkSlicingController *)self fCategories];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v18 objects:v28 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v19;
    uint64_t v9 = *MEMORY[0x263F02E68];
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v19 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v11 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        uint64_t v12 = [v11 objectForKey:v9];
        if ([v12 isEqual:v4])
        {
          v14 = [v11 objectForKey:*MEMORY[0x263F02E78]];
          uint64_t v13 = [v14 BOOLValue];

          goto LABEL_11;
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v18 objects:v28 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
  uint64_t v13 = 0;
LABEL_11:

  v15 = [(PSUINetworkSlicingController *)self getLogger];
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315650;
    v23 = "-[PSUINetworkSlicingController getNetworkSlicingAppCategory:]";
    __int16 v24 = 2112;
    v25 = v4;
    __int16 v26 = 1024;
    int v27 = v13;
    _os_log_debug_impl(&dword_221B17000, v15, OS_LOG_TYPE_DEBUG, "Slicing: %s category=%@ STATE=%d", buf, 0x1Cu);
  }

  v16 = [NSNumber numberWithBool:v13];

  return v16;
}

- (void)setNetworkSlicingAppCategory:(id)a3 specifier:(id)a4
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v6 = a4;
  uint64_t v7 = [a3 BOOLValue];
  uint64_t v8 = [(PSUINetworkSlicingController *)self getLogger];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v12 = [v6 userInfo];
    uint64_t v13 = (void *)v12;
    v14 = @"disabled";
    v16 = "-[PSUINetworkSlicingController setNetworkSlicingAppCategory:specifier:]";
    int v15 = 136315650;
    if (v7) {
      v14 = @"enabled";
    }
    __int16 v17 = 2112;
    uint64_t v18 = v12;
    __int16 v19 = 2112;
    long long v20 = v14;
    _os_log_debug_impl(&dword_221B17000, v8, OS_LOG_TYPE_DEBUG, "Slicing: %s category=%@ ->%@", (uint8_t *)&v15, 0x20u);
  }
  uint64_t v9 = [(PSUINetworkSlicingController *)self getNetworkSlicingAppCategory:v6];
  int v10 = [v9 BOOLValue];

  if (v7 == v10)
  {
    [(PSUINetworkSlicingController *)self reloadSpecifiers];
    uint64_t v11 = [(PSUINetworkSlicingController *)self getLogger];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(v15) = 0;
      _os_log_debug_impl(&dword_221B17000, v11, OS_LOG_TYPE_DEBUG, "Slicing: skipped", (uint8_t *)&v15, 2u);
    }
  }
  else
  {
    uint64_t v11 = [v6 userInfo];
    [(PSUINetworkSlicingController *)self _enableNetworkSlicing:v7 categoryID:v11];
  }
}

- (void)_enableNetworkSlicing:(BOOL)a3 categoryID:(id)a4
{
  BOOL v4 = a3;
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v6 = a4;
  uint64_t v7 = [*(id *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x263F5FE98]) propertyForKey:*MEMORY[0x263F60290]];
  uint64_t v8 = [(PSUINetworkSlicingController *)self fCategories];
  uint64_t v9 = (void *)[v8 mutableCopy];

  if ([v9 count])
  {
    uint64_t v10 = 0;
    uint64_t v11 = *MEMORY[0x263F02E68];
    while (1)
    {
      uint64_t v12 = [v9 objectAtIndex:v10];
      uint64_t v13 = [v12 objectForKey:v11];
      if ([v13 isEqual:v6]) {
        break;
      }

      if (++v10 >= (unint64_t)[v9 count]) {
        goto LABEL_7;
      }
    }
    v14 = (void *)[v12 mutableCopy];
    int v15 = [NSNumber numberWithBool:v4];
    [v14 setObject:v15 forKeyedSubscript:*MEMORY[0x263F02E78]];

    [v9 replaceObjectAtIndex:v10 withObject:v14];
  }
LABEL_7:
  [(PSUINetworkSlicingController *)self setFCategories:v9];
  v16 = [(PSUINetworkSlicingController *)self getLogger];
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
  {
    __int16 v19 = [(PSUINetworkSlicingController *)self fCategories];
    int v20 = 136315650;
    uint64_t v21 = "-[PSUINetworkSlicingController _enableNetworkSlicing:categoryID:]";
    __int16 v22 = 2112;
    v23 = v7;
    __int16 v24 = 2112;
    v25 = v19;
    _os_log_debug_impl(&dword_221B17000, v16, OS_LOG_TYPE_DEBUG, "Slicing: %s context=%@, UDPATE=%@", (uint8_t *)&v20, 0x20u);
  }
  capabilityCache = self->_capabilityCache;
  uint64_t v18 = [(PSUINetworkSlicingController *)self fCategories];
  [(PSUICoreTelephonyCapabilitiesCache *)capabilityCache setNetworkSlicingCategories:v18 forContext:v7];

  [(PSUICoreTelephonyCapabilitiesCache *)self->_capabilityCache setNetworkSlicing:v7 enabled:v4 category:v6];
  [(PSUINetworkSlicingController *)self reloadSpecifiers];
}

- (id)getLogger
{
  return (id)[MEMORY[0x263F67EB0] loggerWithCategory:@"NetworkSlicingController"];
}

- (PSUICoreTelephonyCapabilitiesCache)capabilityCache
{
  return self->_capabilityCache;
}

- (void)setCapabilityCache:(id)a3
{
}

- (NSArray)fCategories
{
  return self->_fCategories;
}

- (void)setFCategories:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fCategories, 0);
  objc_storeStrong((id *)&self->_capabilityCache, 0);
}

@end