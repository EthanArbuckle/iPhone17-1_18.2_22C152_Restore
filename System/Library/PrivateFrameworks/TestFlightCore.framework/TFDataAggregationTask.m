@interface TFDataAggregationTask
+ (CGSize)screenDimensions;
+ (double)batteryLevel;
+ (id)anytimeTasksForSession:(id)a3;
+ (id)cellularServiceInfo;
+ (id)deviceInfoTask;
+ (id)deviceType;
+ (id)networkInfoTask;
+ (id)networkType;
+ (id)regionInfoTask;
+ (id)sessionInfoTaskForIdentifier:(id)a3;
+ (id)snapshotTasksForSession:(id)a3;
+ (id)watchInfoTask;
- (NSArray)providedEntryIdentifiers;
- (NSString)logKey;
- (NSString)name;
- (TFDataAggregationTask)initWithName:(id)a3 providedEntryIdentifiers:(id)a4;
- (id)extractValuesBlock;
- (id)loadDataBlock;
- (void)extractDataPropertiesFromData:(id)a3 intoDataContainer:(id)a4;
- (void)loadDataOnQueue:(id)a3 withCompletionHandler:(id)a4;
- (void)setExtractValuesBlock:(id)a3;
- (void)setLoadDataBlock:(id)a3;
@end

@implementation TFDataAggregationTask

+ (id)deviceType
{
  return (id)[MEMORY[0x263F27BF8] productType];
}

+ (CGSize)screenDimensions
{
  v2 = [MEMORY[0x263F1C920] mainScreen];
  [v2 bounds];
  double v4 = v3;
  double v6 = v5;

  double v7 = v4;
  double v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

+ (double)batteryLevel
{
  v2 = [MEMORY[0x263F1C5C0] currentDevice];
  [v2 setBatteryMonitoringEnabled:1];
  [v2 batteryLevel];
  float v4 = v3;
  [v2 setBatteryMonitoringEnabled:0];

  return v4;
}

+ (id)deviceInfoTask
{
  v6[8] = *MEMORY[0x263EF8340];
  v2 = [TFDataAggregationTask alloc];
  v6[0] = @"l";
  v6[1] = @"m";
  v6[2] = @"n";
  v6[3] = @"o";
  v6[4] = @"p";
  v6[5] = @"q";
  v6[6] = @"r";
  v6[7] = @"s";
  float v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:8];
  float v4 = [(TFDataAggregationTask *)v2 initWithName:@"DeviceInfo" providedEntryIdentifiers:v3];

  [(TFDataAggregationTask *)v4 setLoadDataBlock:&__block_literal_global];
  [(TFDataAggregationTask *)v4 setExtractValuesBlock:&__block_literal_global_10];

  return v4;
}

void __51__TFDataAggregationTask_DeviceInfo__deviceInfoTask__block_invoke(uint64_t a1, void *a2)
{
  v2 = (objc_class *)MEMORY[0x263EFF9A0];
  float v3 = a2;
  id v4 = objc_alloc_init(v2);
  double v5 = NXGetLocalArchInfo();
  if (v5)
  {
    double v6 = [NSString stringWithUTF8String:v5->name];
    double v7 = (void *)[v6 copy];

    [v4 setObject:v7 forKeyedSubscript:@"l"];
  }
  double v8 = +[TFDataAggregationTask deviceType];
  [v4 setObject:v8 forKeyedSubscript:@"m"];

  v9 = [MEMORY[0x263F27BF8] productVersion];
  [v4 setObject:v9 forKeyedSubscript:@"n"];
  +[TFDataAggregationTask screenDimensions];
  double v11 = v10;
  v12 = objc_msgSend(NSNumber, "numberWithDouble:");
  [v4 setObject:v12 forKeyedSubscript:@"o"];

  v13 = [NSNumber numberWithDouble:v11];
  [v4 setObject:v13 forKeyedSubscript:@"p"];

  +[TFDataAggregationTask batteryLevel];
  if (v15 >= 0.0)
  {
    LODWORD(v14) = llround(v15 * 100.0);
    v16 = [NSNumber numberWithInt:v14];
    [v4 setObject:v16 forKeyedSubscript:@"q"];
  }
  v17 = [MEMORY[0x263F08850] defaultManager];
  v18 = NSHomeDirectory();
  uint64_t v22 = 0;
  v19 = [v17 attributesOfFileSystemForPath:v18 error:&v22];

  v20 = [v19 objectForKeyedSubscript:*MEMORY[0x263F080D0]];
  v21 = [v19 objectForKeyedSubscript:*MEMORY[0x263F080C8]];
  [v4 setObject:v20 forKeyedSubscript:@"r"];
  [v4 setObject:v21 forKeyedSubscript:@"s"];
  v3[2](v3, v4, 0);
}

void __51__TFDataAggregationTask_DeviceInfo__deviceInfoTask__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __51__TFDataAggregationTask_DeviceInfo__deviceInfoTask__block_invoke_3;
  v6[3] = &unk_26468E7D8;
  id v7 = v4;
  id v5 = v4;
  [a3 performBatchUpdates:v6];
}

void __51__TFDataAggregationTask_DeviceInfo__deviceInfoTask__block_invoke_3(uint64_t a1, void *a2)
{
  float v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v5 = [v3 objectForKeyedSubscript:@"l"];
  [v4 setStringForIdentifier:@"l" toValue:v5];

  double v6 = [*(id *)(a1 + 32) objectForKeyedSubscript:@"m"];
  [v4 setStringForIdentifier:@"m" toValue:v6];

  id v7 = [*(id *)(a1 + 32) objectForKeyedSubscript:@"n"];
  [v4 setStringForIdentifier:@"n" toValue:v7];

  double v8 = [*(id *)(a1 + 32) objectForKeyedSubscript:@"o"];
  [v4 setNumberForIdentifier:@"o" toValue:v8];

  v9 = [*(id *)(a1 + 32) objectForKeyedSubscript:@"p"];
  [v4 setNumberForIdentifier:@"p" toValue:v9];

  double v10 = [*(id *)(a1 + 32) objectForKeyedSubscript:@"q"];
  [v4 setNumberForIdentifier:@"q" toValue:v10];

  double v11 = [*(id *)(a1 + 32) objectForKeyedSubscript:@"r"];
  [v4 setNumberForIdentifier:@"r" toValue:v11];

  id v12 = [*(id *)(a1 + 32) objectForKeyedSubscript:@"s"];
  [v4 setNumberForIdentifier:@"s" toValue:v12];
}

+ (id)networkInfoTask
{
  v8[3] = *MEMORY[0x263EF8340];
  float v3 = [TFDataAggregationTask alloc];
  v8[0] = @"t";
  v8[1] = @"u";
  v8[2] = @"v";
  id v4 = [MEMORY[0x263EFF8C0] arrayWithObjects:v8 count:3];
  id v5 = [(TFDataAggregationTask *)v3 initWithName:@"NetworkInfo" providedEntryIdentifiers:v4];

  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __53__TFDataAggregationTask_NetworkInfo__networkInfoTask__block_invoke;
  v7[3] = &__block_descriptor_40_e25_v16__0___v_____NSError__8l;
  v7[4] = a1;
  [(TFDataAggregationTask *)v5 setLoadDataBlock:v7];
  [(TFDataAggregationTask *)v5 setExtractValuesBlock:&__block_literal_global_1];

  return v5;
}

void __53__TFDataAggregationTask_NetworkInfo__networkInfoTask__block_invoke(uint64_t a1, void *a2)
{
  float v3 = (objc_class *)MEMORY[0x263EFF9A0];
  id v4 = a2;
  id v7 = objc_alloc_init(v3);
  id v5 = [*(id *)(a1 + 32) cellularServiceInfo];
  if (v5) {
    [v7 addEntriesFromDictionary:v5];
  }
  double v6 = [*(id *)(a1 + 32) networkType];
  [v7 setObject:v6 forKeyedSubscript:@"v"];

  v4[2](v4, v7, 0);
}

void __53__TFDataAggregationTask_NetworkInfo__networkInfoTask__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __53__TFDataAggregationTask_NetworkInfo__networkInfoTask__block_invoke_3;
  v6[3] = &unk_26468E7D8;
  id v7 = v4;
  id v5 = v4;
  [a3 performBatchUpdates:v6];
}

void __53__TFDataAggregationTask_NetworkInfo__networkInfoTask__block_invoke_3(uint64_t a1, void *a2)
{
  float v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v5 = [v3 objectForKeyedSubscript:@"t"];
  [v4 setStringForIdentifier:@"t" toValue:v5];

  double v6 = [*(id *)(a1 + 32) objectForKeyedSubscript:@"u"];
  [v4 setStringForIdentifier:@"u" toValue:v6];

  id v7 = [*(id *)(a1 + 32) objectForKeyedSubscript:@"v"];
  [v4 setStringForIdentifier:@"v" toValue:v7];
}

+ (id)cellularServiceInfo
{
  v21[11] = *MEMORY[0x263EF8340];
  uint64_t v2 = *MEMORY[0x263F02BD8];
  v20[0] = *MEMORY[0x263F02BE0];
  v20[1] = v2;
  v21[0] = @"GPRS";
  v21[1] = @"Edge";
  uint64_t v3 = *MEMORY[0x263F02BE8];
  v20[2] = *MEMORY[0x263F02C10];
  v20[3] = v3;
  v21[2] = @"WCDMA";
  v21[3] = @"HSDPA";
  uint64_t v4 = *MEMORY[0x263F02BB8];
  v20[4] = *MEMORY[0x263F02BF0];
  v20[5] = v4;
  v21[4] = @"HSUPA";
  v21[5] = @"CDMA 1x";
  uint64_t v5 = *MEMORY[0x263F02BC8];
  v20[6] = *MEMORY[0x263F02BC0];
  v20[7] = v5;
  v21[6] = @"CDMA EV-DO Rev 0";
  v21[7] = @"CDMA EV-DO Rev A";
  uint64_t v6 = *MEMORY[0x263F02C18];
  v20[8] = *MEMORY[0x263F02BD0];
  v20[9] = v6;
  v21[8] = @"CDMA EV-DO Rev B";
  v21[9] = @"HRPD";
  v20[10] = *MEMORY[0x263F02BF8];
  v21[10] = @"LTE";
  id v7 = [NSDictionary dictionaryWithObjects:v21 forKeys:v20 count:11];
  id v8 = objc_alloc_init(MEMORY[0x263F02D18]);
  v9 = [v8 serviceSubscriberCellularProviders];
  double v10 = [v9 allKeys];
  double v11 = [v10 firstObject];

  if (v11)
  {
    id v12 = objc_opt_new();
    v13 = [v9 objectForKeyedSubscript:v11];
    uint64_t v14 = [v13 carrierName];

    [v12 setObject:v14 forKeyedSubscript:@"t"];
    double v15 = [v8 serviceCurrentRadioAccessTechnology];
    v16 = [v15 objectForKeyedSubscript:v11];

    v17 = [v7 objectForKeyedSubscript:v16];
    [v12 setObject:v17 forKeyedSubscript:@"u"];

    v18 = (void *)[v12 copy];
  }
  else
  {
    v18 = 0;
  }

  return v18;
}

+ (id)networkType
{
  uint64_t v2 = [MEMORY[0x263F14420] sharedDefaultEvaluator];
  uint64_t v3 = [v2 path];
  if ([v3 usesInterfaceType:1])
  {
    uint64_t v4 = @"WI_FI";
  }
  else if ([v3 usesInterfaceType:2])
  {
    uint64_t v4 = @"MOBILE_DATA";
  }
  else if ([v3 usesInterfaceType:3])
  {
    uint64_t v4 = @"WIRE";
  }
  else
  {
    uint64_t v4 = @"NONE";
  }

  return v4;
}

+ (id)sessionInfoTaskForIdentifier:(id)a3
{
  v11[1] = *MEMORY[0x263EF8340];
  id v3 = a3;
  uint64_t v4 = [TFDataAggregationTask alloc];
  v11[0] = @"i";
  uint64_t v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:v11 count:1];
  uint64_t v6 = [(TFDataAggregationTask *)v4 initWithName:@"SessionInfo" providedEntryIdentifiers:v5];

  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __67__TFDataAggregationTask_SessionInfo__sessionInfoTaskForIdentifier___block_invoke;
  v9[3] = &unk_26468E9A8;
  id v10 = v3;
  id v7 = v3;
  [(TFDataAggregationTask *)v6 setLoadDataBlock:v9];
  [(TFDataAggregationTask *)v6 setExtractValuesBlock:&__block_literal_global_2];

  return v6;
}

void __67__TFDataAggregationTask_SessionInfo__sessionInfoTaskForIdentifier___block_invoke(uint64_t a1, void *a2)
{
  v26[1] = *MEMORY[0x263EF8340];
  id v3 = (objc_class *)MEMORY[0x263F28178];
  uint64_t v4 = a2;
  id v5 = [v3 alloc];
  v26[0] = *(void *)(a1 + 32);
  uint64_t v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v26 count:1];
  id v7 = (void *)[v5 initWithBundleIDs:v6 states:*MEMORY[0x263F28150]];

  id v8 = [v7 applicationInfoForApplication:*(void *)(a1 + 32)];
  v9 = [v8 objectForKeyedSubscript:*MEMORY[0x263F28170]];
  id v10 = v9;
  if (v9)
  {
    *(void *)v21 = 0xE00000001;
    int v22 = 1;
    int v23 = [v9 intValue];
    memset(v20, 0, 512);
    size_t v19 = 648;
    sysctl(v21, 4u, v20, &v19, 0, 0);
    double v11 = [MEMORY[0x263EFF910] dateWithTimeIntervalSince1970:(double)*(uint64_t *)&v20[0]];
    id v12 = [MEMORY[0x263EFF910] date];
    [v12 timeIntervalSinceDate:v11];
    double v14 = v13;

    double v15 = [NSNumber numberWithDouble:v14];
    v4[2](v4, v15, 0);
  }
  else
  {
    double v11 = [NSString stringWithFormat:@"Failed to find pid for %@. This process may be missing an entitlement or specified process may not be running", *(void *)(a1 + 32)];
    v16 = (void *)MEMORY[0x263F087E8];
    uint64_t v24 = *MEMORY[0x263F07F80];
    v25 = v11;
    v17 = [NSDictionary dictionaryWithObjects:&v25 forKeys:&v24 count:1];
    v18 = [v16 errorWithDomain:@"TFErrorDomain" code:201 userInfo:v17];
    ((void (**)(id, void *, void *))v4)[2](v4, 0, v18);
  }
}

void __67__TFDataAggregationTask_SessionInfo__sessionInfoTaskForIdentifier___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __67__TFDataAggregationTask_SessionInfo__sessionInfoTaskForIdentifier___block_invoke_3;
  v6[3] = &unk_26468E7D8;
  id v7 = v4;
  id v5 = v4;
  [a3 performBatchUpdates:v6];
}

uint64_t __67__TFDataAggregationTask_SessionInfo__sessionInfoTaskForIdentifier___block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 setNumberForIdentifier:@"i" toValue:*(void *)(a1 + 32)];
}

- (TFDataAggregationTask)initWithName:(id)a3 providedEntryIdentifiers:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v18.receiver = self;
  v18.super_class = (Class)TFDataAggregationTask;
  id v8 = [(TFDataAggregationTask *)&v18 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    name = v8->_name;
    v8->_name = (NSString *)v9;

    uint64_t v11 = [v7 copy];
    providedEntryIdentifiers = v8->_providedEntryIdentifiers;
    v8->_providedEntryIdentifiers = (NSArray *)v11;

    uint64_t v13 = AMSGenerateLogCorrelationKey();
    logKey = v8->_logKey;
    v8->_logKey = (NSString *)v13;

    id loadDataBlock = v8->_loadDataBlock;
    v8->_id loadDataBlock = 0;

    id extractValuesBlock = v8->_extractValuesBlock;
    v8->_id extractValuesBlock = 0;
  }
  return v8;
}

- (void)loadDataOnQueue:(id)a3 withCompletionHandler:(id)a4
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = +[TFLogConfiguration defaultConfiguration];
  uint64_t v9 = [v8 generatedLogger];
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v10 = objc_opt_class();
    uint64_t v11 = [(TFDataAggregationTask *)self name];
    id v12 = [(TFDataAggregationTask *)self logKey];
    *(_DWORD *)buf = 138543874;
    uint64_t v19 = v10;
    __int16 v20 = 2114;
    v21 = v11;
    __int16 v22 = 2112;
    int v23 = v12;
    _os_log_impl(&dword_223064000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@:%@] loadDataOnQueue:withCompletionHandler:", buf, 0x20u);
  }
  uint64_t v13 = [(TFDataAggregationTask *)self loadDataBlock];

  if (!v13)
  {
    id v15 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v15);
  }
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __63__TFDataAggregationTask_loadDataOnQueue_withCompletionHandler___block_invoke;
  v16[3] = &unk_26468EAA0;
  v16[4] = self;
  id v17 = v7;
  id v14 = v7;
  dispatch_async(v6, v16);
}

void __63__TFDataAggregationTask_loadDataOnQueue_withCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) loadDataBlock];
  v2[2](v2, *(void *)(a1 + 40));
}

- (void)extractDataPropertiesFromData:(id)a3 intoDataContainer:(id)a4
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = +[TFLogConfiguration defaultConfiguration];
  uint64_t v9 = [v8 generatedLogger];
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v10 = objc_opt_class();
    uint64_t v11 = [(TFDataAggregationTask *)self name];
    id v12 = [(TFDataAggregationTask *)self logKey];
    int v16 = 138543874;
    uint64_t v17 = v10;
    __int16 v18 = 2114;
    uint64_t v19 = v11;
    __int16 v20 = 2112;
    v21 = v12;
    _os_log_impl(&dword_223064000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@:%@] extractDataPropertiesFromData:intoDataContainer:", (uint8_t *)&v16, 0x20u);
  }
  uint64_t v13 = [(TFDataAggregationTask *)self extractValuesBlock];

  if (!v13)
  {
    id v15 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v15);
  }
  id v14 = [(TFDataAggregationTask *)self extractValuesBlock];
  ((void (**)(void, id, id))v14)[2](v14, v6, v7);
}

- (id)loadDataBlock
{
  return self->_loadDataBlock;
}

- (void)setLoadDataBlock:(id)a3
{
}

- (id)extractValuesBlock
{
  return self->_extractValuesBlock;
}

- (void)setExtractValuesBlock:(id)a3
{
}

- (NSString)name
{
  return self->_name;
}

- (NSString)logKey
{
  return self->_logKey;
}

- (NSArray)providedEntryIdentifiers
{
  return self->_providedEntryIdentifiers;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_providedEntryIdentifiers, 0);
  objc_storeStrong((id *)&self->_logKey, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong(&self->_extractValuesBlock, 0);

  objc_storeStrong(&self->_loadDataBlock, 0);
}

+ (id)snapshotTasksForSession:(id)a3
{
  v8[2] = *MEMORY[0x263EF8340];
  id v3 = [a3 bundleIdentifier];
  id v4 = +[TFDataAggregationTask sessionInfoTaskForIdentifier:v3];
  v8[0] = v4;
  id v5 = +[TFDataAggregationTask networkInfoTask];
  v8[1] = v5;
  id v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v8 count:2];

  return v6;
}

+ (id)anytimeTasksForSession:(id)a3
{
  void v8[3] = *MEMORY[0x263EF8340];
  id v3 = +[TFDataAggregationTask watchInfoTask];
  id v4 = +[TFDataAggregationTask deviceInfoTask];
  v8[1] = v4;
  id v5 = +[TFDataAggregationTask regionInfoTask];
  v8[2] = v5;
  id v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v8 count:3];

  return v6;
}

+ (id)regionInfoTask
{
  v6[2] = *MEMORY[0x263EF8340];
  uint64_t v2 = [TFDataAggregationTask alloc];
  v6[0] = @"w";
  v6[1] = @"x";
  id v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:2];
  id v4 = [(TFDataAggregationTask *)v2 initWithName:@"RegionInfo" providedEntryIdentifiers:v3];

  [(TFDataAggregationTask *)v4 setLoadDataBlock:&__block_literal_global_7];
  [(TFDataAggregationTask *)v4 setExtractValuesBlock:&__block_literal_global_8_0];

  return v4;
}

void __51__TFDataAggregationTask_RegionInfo__regionInfoTask__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = (objc_class *)MEMORY[0x263EFF9A0];
  id v3 = a2;
  id v8 = objc_alloc_init(v2);
  id v4 = [MEMORY[0x263EFF960] preferredLanguages];
  id v5 = [v4 firstObject];

  [v8 setObject:v5 forKeyedSubscript:@"w"];
  id v6 = [MEMORY[0x263EFFA18] localTimeZone];
  id v7 = [v6 name];

  [v8 setObject:v7 forKeyedSubscript:@"x"];
  v3[2](v3, v8, 0);
}

void __51__TFDataAggregationTask_RegionInfo__regionInfoTask__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __51__TFDataAggregationTask_RegionInfo__regionInfoTask__block_invoke_3;
  void v6[3] = &unk_26468E7D8;
  id v7 = v4;
  id v5 = v4;
  [a3 performBatchUpdates:v6];
}

void __51__TFDataAggregationTask_RegionInfo__regionInfoTask__block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v5 = [v3 objectForKeyedSubscript:@"w"];
  [v4 setStringForIdentifier:@"w" toValue:v5];

  id v6 = [*(id *)(a1 + 32) objectForKeyedSubscript:@"x"];
  [v4 setStringForIdentifier:@"x" toValue:v6];
}

+ (id)watchInfoTask
{
  v6[2] = *MEMORY[0x263EF8340];
  uint64_t v2 = [TFDataAggregationTask alloc];
  v6[0] = @"j";
  v6[1] = @"k";
  id v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:2];
  id v4 = [(TFDataAggregationTask *)v2 initWithName:@"WatchInfo" providedEntryIdentifiers:v3];

  [(TFDataAggregationTask *)v4 setLoadDataBlock:&__block_literal_global_8];
  [(TFDataAggregationTask *)v4 setExtractValuesBlock:&__block_literal_global_6_0];

  return v4;
}

void __49__TFDataAggregationTask_WatchInfo__watchInfoTask__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  uint64_t v2 = a2;
  id v3 = [MEMORY[0x263F57730] sharedInstance];
  id v4 = [v3 getAllDevices];

  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v5 = v4;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v19 = v2;
    uint64_t v8 = *(void *)v21;
    uint64_t v9 = *MEMORY[0x263F575C8];
    uint64_t v10 = *MEMORY[0x263F575A8];
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v21 != v8) {
          objc_enumerationMutation(v5);
        }
        id v12 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        if (v12)
        {
          uint64_t v13 = [*(id *)(*((void *)&v20 + 1) + 8 * i) valueForProperty:v9];
          int v14 = [v13 BOOLValue];

          id v15 = [v12 valueForProperty:v10];
          int v16 = [v15 BOOLValue];

          if (v14 && v16 != 0)
          {
            id v18 = v12;
            goto LABEL_15;
          }
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v7);
    id v18 = 0;
LABEL_15:
    uint64_t v2 = v19;
  }
  else
  {
    id v18 = 0;
  }

  v2[2](v2, v18, 0);
}

void __49__TFDataAggregationTask_WatchInfo__watchInfoTask__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = v4;
  if (v4)
  {
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __49__TFDataAggregationTask_WatchInfo__watchInfoTask__block_invoke_3;
    void v6[3] = &unk_26468E7D8;
    id v7 = v4;
    [a3 performBatchUpdates:v6];
  }
}

void __49__TFDataAggregationTask_WatchInfo__watchInfoTask__block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  uint64_t v4 = *MEMORY[0x263F57590];
  id v5 = a2;
  uint64_t v6 = [v3 valueForProperty:v4];
  [v5 setStringForIdentifier:@"j" toValue:v6];

  id v7 = [*(id *)(a1 + 32) valueForProperty:*MEMORY[0x263F57668]];
  [v5 setStringForIdentifier:@"k" toValue:v7];
}

@end