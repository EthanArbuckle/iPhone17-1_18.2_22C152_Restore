@interface NFGeneralStatisticsCALogger
+ (void)_resetGeneralDeviceStatisticToDefaults;
+ (void)_setupInitValuesForGeneralTransactionStatistics;
+ (void)postAnalyticsGeneralTransactionStatistics;
+ (void)postAnalyticsSetupEndpoints:(unsigned int)a3 totalUnknowntoSE:(unsigned int)a4;
+ (void)postGeneralDeviceStatistics;
+ (void)postPlasticCardEnableStatus:(BOOL)a3 aid:(id)a4;
+ (void)updateAnalyticsGeneralTransactionStatistics:(id)a3;
+ (void)updateGeneralDeviceStatistic:(id)a3;
@end

@implementation NFGeneralStatisticsCALogger

+ (void)postAnalyticsGeneralTransactionStatistics
{
  v3 = +[NFCALogger sharedCALogger];
  id v7 = [v3 getCALoggerUserDefaults];

  v4 = [v7 objectForKey:@"com.apple.nfcd.generalTransactionStatistic"];
  v5 = +[NFCALogger sharedCALogger];
  [v5 postCAEventFor:@"com.apple.nfcd.generalTransactionStatistic" eventInput:v4];

  v6 = +[NFCALogger sharedCALogger];
  [v6 postCAEventFor:@"com.apple.nfcd.generalTransactionStatisticDim" eventInput:v4];

  [a1 _setupInitValuesForGeneralTransactionStatistics];
}

+ (void)updateAnalyticsGeneralTransactionStatistics:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    v5 = +[NFCALogger sharedCALogger];
    v6 = [v5 getCALoggerUserDefaults];

    id v7 = [v6 objectForKey:@"com.apple.nfcd.generalTransactionStatistic"];
    v8 = v7;
    if (v7)
    {
      v9 = (void *)[v7 mutableCopy];
    }
    else
    {
      [a1 _setupInitValuesForGeneralTransactionStatistics];
      v10 = [v6 objectForKey:@"com.apple.nfcd.generalTransactionStatistic"];
      v9 = (void *)[v10 mutableCopy];
    }
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __75__NFGeneralStatisticsCALogger_updateAnalyticsGeneralTransactionStatistics___block_invoke;
    v12[3] = &unk_1E65ABF88;
    id v13 = v9;
    id v11 = v9;
    [v4 enumerateKeysAndObjectsUsingBlock:v12];

    [v6 setObject:v11 forKey:@"com.apple.nfcd.generalTransactionStatistic"];
  }
}

void __75__NFGeneralStatisticsCALogger_updateAnalyticsGeneralTransactionStatistics___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v13 = a2;
  id v5 = a3;
  if ([v13 isEqualToString:@"currentNFCDefault"]
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    [*(id *)(a1 + 32) setValue:v5 forKey:v13];
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v6 = [*(id *)(a1 + 32) objectForKey:v13];
      id v7 = (void *)v6;
      v8 = &unk_1F24D1FB8;
      if (v6) {
        v8 = (void *)v6;
      }
      id v9 = v8;

      v10 = NSNumber;
      uint64_t v11 = [v9 integerValue];

      v12 = [v10 numberWithInteger:[v5 integerValue] + v11];
      [*(id *)(a1 + 32) setValue:v12 forKey:v13];
    }
  }
}

+ (void)_setupInitValuesForGeneralTransactionStatistics
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  v2 = objc_opt_new();
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v3 = [&unk_1F24D2108 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v14;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v14 != v5) {
          objc_enumerationMutation(&unk_1F24D2108);
        }
        [v2 setObject:&unk_1F24D1FB8 forKeyedSubscript:*(void *)(*((void *)&v13 + 1) + 8 * v6++)];
      }
      while (v4 != v6);
      uint64_t v4 = [&unk_1F24D2108 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v4);
  }
  id v7 = +[NFCALogger sharedCALogger];
  v8 = [v7 getCALoggerUserDefaults];

  id v9 = [v8 objectForKey:@"com.apple.nfcd.generalTransactionStatistic"];
  v10 = v9;
  if (v9)
  {
    uint64_t v11 = [v9 objectForKey:@"currentNFCDefault"];

    if (v11)
    {
      v12 = [v10 objectForKey:@"currentNFCDefault"];
      [v2 setObject:v12 forKeyedSubscript:@"currentNFCDefault"];
    }
  }
  [v8 setObject:v2 forKey:@"com.apple.nfcd.generalTransactionStatistic"];
}

+ (void)updateGeneralDeviceStatistic:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    uint64_t v5 = +[NFCALogger sharedCALogger];
    uint64_t v6 = [v5 getCALoggerUserDefaults];

    if (v6)
    {
      id v7 = [v6 objectForKey:@"com.apple.nfcd.generalDeviceStatistic"];
      v8 = v7;
      if (v7)
      {
        id v9 = (void *)[v7 mutableCopy];
      }
      else
      {
        [a1 _resetGeneralDeviceStatisticToDefaults];
        v10 = [v6 objectForKey:@"com.apple.nfcd.generalDeviceStatistic"];
        id v9 = (void *)[v10 mutableCopy];
      }
      uint64_t v18 = 0;
      v19 = &v18;
      uint64_t v20 = 0x2020000000;
      char v21 = 0;
      uint64_t v12 = MEMORY[0x1E4F143A8];
      uint64_t v13 = 3221225472;
      long long v14 = __60__NFGeneralStatisticsCALogger_updateGeneralDeviceStatistic___block_invoke;
      long long v15 = &unk_1E65ABFB0;
      id v11 = v9;
      id v16 = v11;
      v17 = &v18;
      [v4 enumerateKeysAndObjectsUsingBlock:&v12];
      if (*((unsigned char *)v19 + 24))
      {
        [v6 setObject:v11 forKey:@"com.apple.nfcd.generalDeviceStatistic" v12 v13 v14 v15];
        [v6 synchronize];
      }

      _Block_object_dispose(&v18, 8);
    }
  }
}

void __60__NFGeneralStatisticsCALogger_updateGeneralDeviceStatistic___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v17 = a2;
  id v5 = a3;
  if ([v17 isEqualToString:@"totalDynamicPackages"])
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v6 = [*(id *)(a1 + 32) objectForKey:v17];
      id v7 = (void *)v6;
      v8 = &unk_1F24D1FB8;
      if (v6) {
        v8 = (void *)v6;
      }
      id v9 = v8;

      v10 = NSNumber;
      uint64_t v11 = [v9 integerValue];

      uint64_t v12 = [v10 numberWithInteger:[v5 integerValue] + v11];
      [*(id *)(a1 + 32) setValue:v12 forKey:v17];
      *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
      goto LABEL_14;
    }
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    goto LABEL_7;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_15;
  }
  long long v14 = [*(id *)(a1 + 32) objectForKey:v17];

  uint64_t v13 = *(void **)(a1 + 32);
  if (!v14)
  {
LABEL_8:
    [v13 setValue:v5 forKey:v17];
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
    goto LABEL_15;
  }
  uint64_t v12 = [v13 objectForKey:v17];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
LABEL_14:

    goto LABEL_15;
  }
  long long v15 = [*(id *)(a1 + 32) objectForKey:v17];
  char v16 = [v15 isEqualToNumber:v5];

  if ((v16 & 1) == 0)
  {
LABEL_7:
    uint64_t v13 = *(void **)(a1 + 32);
    goto LABEL_8;
  }
LABEL_15:
}

+ (void)postGeneralDeviceStatistics
{
  uint64_t v3 = +[NFCALogger sharedCALogger];
  id v7 = [v3 getCALoggerUserDefaults];

  id v4 = v7;
  if (v7)
  {
    id v5 = [v7 objectForKey:@"com.apple.nfcd.generalDeviceStatistic"];
    if (v5)
    {
      uint64_t v6 = +[NFCALogger sharedCALogger];
      [v6 postCAEventFor:@"com.apple.nfcd.generalDeviceStatistic" eventInput:v5];
    }
    [a1 _resetGeneralDeviceStatisticToDefaults];

    id v4 = v7;
  }
}

+ (void)_resetGeneralDeviceStatisticToDefaults
{
  v2 = +[NFCALogger sharedCALogger];
  id v5 = [v2 getCALoggerUserDefaults];

  if (v5)
  {
    uint64_t v3 = objc_opt_new();
    uint64_t v4 = MEMORY[0x1E4F1CC28];
    [v3 setValue:MEMORY[0x1E4F1CC28] forKey:@"hasFelicaExpressTransactionEnable"];
    [v3 setValue:v4 forKey:@"hasAccessExpressTransactionEnable"];
    [v3 setValue:v4 forKey:@"hasGenericAExpressEnable"];
    [v3 setValue:v4 forKey:@"radioIsEnabled"];
    [v3 setValue:v4 forKey:@"hasAttackLogs"];
    [v3 setValue:v4 forKey:@"hasOverCurrentErrors"];
    [v3 setValue:&unk_1F24D1FB8 forKey:@"totalDynamicPackages"];
    [v3 setValue:&unk_1F24D1FB8 forKey:@"seCounterMeasureLevel"];
    [v3 setValue:&unk_1F24D1FB8 forKey:@"totalCardProvisioned"];
    [v3 setValue:&stru_1F24CADC0 forKey:@"currentProvisionedCards"];
    [v3 setValue:&unk_1F24D1FB8 forKey:@"totalPurpleTrustKeys"];
    [v3 setValue:&unk_1F24D1FD0 forKey:@"failForwardState"];
    [v5 setObject:v3 forKey:@"com.apple.nfcd.generalDeviceStatistic"];
    [v5 synchronize];
  }
}

+ (void)postAnalyticsSetupEndpoints:(unsigned int)a3 totalUnknowntoSE:(unsigned int)a4
{
  if (a3)
  {
    uint64_t v4 = *(void *)&a4;
    uint64_t v5 = *(void *)&a3;
    id v9 = (id)objc_opt_new();
    uint64_t v6 = [NSNumber numberWithUnsignedInt:v4];
    [v9 setObject:v6 forKeyedSubscript:@"totalIdentifiersUnknowntoSE"];

    id v7 = [NSNumber numberWithUnsignedInt:v5];
    [v9 setObject:v7 forKeyedSubscript:@"totalIdentifiersReceived"];

    v8 = +[NFCALogger sharedCALogger];
    [v8 postCAEventFor:@"com.apple.nfcd.setupEndpointFailureEvent" eventInput:v9];
  }
}

+ (void)postPlasticCardEnableStatus:(BOOL)a3 aid:(id)a4
{
  BOOL v4 = a3;
  v12[2] = *MEMORY[0x1E4F143B8];
  v11[0] = @"status";
  uint64_t v5 = NSNumber;
  uint64_t v6 = (__CFString *)a4;
  id v7 = [v5 numberWithBool:v4];
  v11[1] = @"aid";
  v12[0] = v7;
  v8 = &stru_1F24CADC0;
  if (v6) {
    v8 = v6;
  }
  v12[1] = v8;
  id v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:2];

  v10 = +[NFCALogger sharedCALogger];

  [v10 postCAEventFor:@"com.apple.nfcd.plasticCardEnableEvent" eventInput:v9];
}

@end