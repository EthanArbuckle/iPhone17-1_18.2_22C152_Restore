@interface JoinMO
+ (id)earliestJoinDate:(id)a3 moc:(id)a4;
+ (id)entityName;
+ (id)fetchRequest;
+ (id)generateInstance:(id)a3;
+ (id)mostRecentJoin:(id)a3 ssid:(id)a4 moc:(id)a5;
+ (id)mostRecentJoinsWithBatchSize:(unint64_t)a3 bssid:(id)a4 ssid:(id)a5 moc:(id)a6;
+ (id)ssidsWithRouterMAC:(id)a3 moc:(id)a4;
+ (unint64_t)joinCount:(id)a3 bssid:(id)a4 maxAgeInDays:(unint64_t)a5 success:(BOOL)a6 moc:(id)a7;
@end

@implementation JoinMO

+ (id)entityName
{
  return @"Join";
}

+ (id)generateInstance:(id)a3
{
  id v3 = a3;
  v4 = +[JoinMO entityName];
  v5 = +[AnalyticsStoreProxy createEntity:v4 moc:v3];

  return v5;
}

+ (id)mostRecentJoin:(id)a3 ssid:(id)a4 moc:(id)a5
{
  v24[1] = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  v10 = +[JoinMO fetchRequest];
  v11 = (void *)[objc_alloc(MEMORY[0x263F08B30]) initWithKey:@"date" ascending:0];
  v24[0] = v11;
  v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:v24 count:1];
  [v10 setSortDescriptors:v12];

  v13 = (void *)MEMORY[0x263F08730];
  if (v7 && v8)
  {
    v14 = [MEMORY[0x263F08A98] predicateWithFormat:@"bss.network.ssid == %@", v8];
    v23[0] = v14;
    v15 = [MEMORY[0x263F08A98] predicateWithFormat:@"bss.bssid == %@", v7];
    v23[1] = v15;
    v16 = [MEMORY[0x263F08A98] predicateWithFormat:@"success == 1"];
    v23[2] = v16;
    v17 = [MEMORY[0x263EFF8C0] arrayWithObjects:v23 count:3];
    v18 = [v13 andPredicateWithSubpredicates:v17];

LABEL_6:
    goto LABEL_7;
  }
  if (v8)
  {
    v14 = [MEMORY[0x263F08A98] predicateWithFormat:@"bss.network.ssid == %@", v8];
    v22[0] = v14;
    v15 = [MEMORY[0x263F08A98] predicateWithFormat:@"success == 1"];
    v22[1] = v15;
    v16 = [MEMORY[0x263EFF8C0] arrayWithObjects:v22 count:2];
    v18 = [v13 andPredicateWithSubpredicates:v16];
    goto LABEL_6;
  }
  v14 = [MEMORY[0x263F08A98] predicateWithFormat:@"success == 1"];
  v21 = v14;
  v15 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v21 count:1];
  v18 = [v13 andPredicateWithSubpredicates:v15];
LABEL_7:

  v19 = +[AnalyticsStoreProxy fetchFirst:v10 withPredicate:v18 moc:v9];

  return v19;
}

+ (id)earliestJoinDate:(id)a3 moc:(id)a4
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  if (v5)
  {
    id v7 = (void *)MEMORY[0x223C0F2E0]();
    id v8 = +[JoinMO fetchRequest];
    id v9 = (void *)[objc_alloc(MEMORY[0x263F08B30]) initWithKey:@"date" ascending:1];
    v17 = v9;
    v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v17 count:1];
    [v8 setSortDescriptors:v10];

    v11 = [MEMORY[0x263F08A98] predicateWithFormat:@"bss.network.ssid == %@", v5];
    v12 = +[AnalyticsStoreProxy fetchFirst:v8 withPredicate:v11 moc:v6];

    if (v12)
    {
      v13 = [v12 date];
      v14 = (void *)[v13 copy];
    }
    else
    {
      v14 = 0;
    }
  }
  else
  {
    v16 = WALogCategoryDeviceStoreHandle();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      v19 = "+[JoinMO earliestJoinDate:moc:]";
      __int16 v20 = 1024;
      int v21 = 57;
      _os_log_impl(&dword_21D96D000, v16, OS_LOG_TYPE_ERROR, "%{public}s::%d:ssid nil", buf, 0x12u);
    }

    v14 = 0;
  }

  return v14;
}

+ (id)ssidsWithRouterMAC:(id)a3 moc:(id)a4
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v5 = a4;
  id v6 = [MEMORY[0x263F08A98] predicateWithFormat:@"routerMAC == %@", a3];
  id v7 = [MEMORY[0x263EFF980] array];
  id v8 = +[JoinMO entityName];
  id v9 = +[AnalyticsStoreProxy fetchRequestForEntityWithBatchSize:v8 batchSize:100 prefetch:&unk_26CE65E60];
  v10 = +[AnalyticsStoreProxy fetch:v9 withPredicate:v6 moc:v5];

  if (v10)
  {
    id v20 = v5;
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    id v11 = v10;
    uint64_t v12 = [v11 countByEnumeratingWithState:&v21 objects:v25 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v22;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v22 != v14) {
            objc_enumerationMutation(v11);
          }
          v16 = [*(id *)(*((void *)&v21 + 1) + 8 * i) bss];
          v17 = [v16 network];
          v18 = [v17 ssid];

          if (v18) {
            [v7 addObject:v18];
          }
        }
        uint64_t v13 = [v11 countByEnumeratingWithState:&v21 objects:v25 count:16];
      }
      while (v13);
    }

    id v5 = v20;
  }

  return v7;
}

+ (id)mostRecentJoinsWithBatchSize:(unint64_t)a3 bssid:(id)a4 ssid:(id)a5 moc:(id)a6
{
  v32[3] = *MEMORY[0x263EF8340];
  id v9 = (objc_class *)MEMORY[0x263F08B30];
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  uint64_t v13 = (void *)[[v9 alloc] initWithKey:@"date" ascending:0];
  uint64_t v14 = (void *)MEMORY[0x263F08730];
  v15 = [MEMORY[0x263F08A98] predicateWithFormat:@"bss.network.ssid == %@", v11];

  v32[0] = v15;
  v16 = [MEMORY[0x263F08A98] predicateWithFormat:@"bss.bssid == %@", v12];

  v32[1] = v16;
  v17 = [MEMORY[0x263F08A98] predicateWithFormat:@"success == 0"];
  v32[2] = v17;
  v18 = [MEMORY[0x263EFF8C0] arrayWithObjects:v32 count:3];
  v19 = [v14 andPredicateWithSubpredicates:v18];

  id v20 = +[JoinMO fetchRequest];
  [v20 setFetchBatchSize:a3];
  [v20 setRelationshipKeyPathsForPrefetching:&unk_26CE65E78];
  v31 = v13;
  long long v21 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v31 count:1];
  [v20 setSortDescriptors:v21];

  long long v22 = +[AnalyticsStoreProxy fetch:v20 withPredicate:v19 moc:v10];

  if (v22)
  {
    long long v23 = WALogCategoryDeviceStoreHandle();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136446722;
      uint64_t v26 = "+[JoinMO mostRecentJoinsWithBatchSize:bssid:ssid:moc:]";
      __int16 v27 = 1024;
      int v28 = 118;
      __int16 v29 = 2048;
      uint64_t v30 = [v22 count];
      _os_log_impl(&dword_21D96D000, v23, OS_LOG_TYPE_DEBUG, "%{public}s::%d:ResultCount:%lu", buf, 0x1Cu);
    }
  }
  return v22;
}

+ (unint64_t)joinCount:(id)a3 bssid:(id)a4 maxAgeInDays:(unint64_t)a5 success:(BOOL)a6 moc:(id)a7
{
  BOOL v8 = a6;
  v33[3] = *MEMORY[0x263EF8340];
  id v11 = a4;
  id v29 = a7;
  id v12 = a3;
  uint64_t v13 = +[JoinMO entityName];
  uint64_t v14 = (void *)MEMORY[0x263F08730];
  v15 = [MEMORY[0x263F08A98] predicateWithFormat:@"bss.network.ssid == %@", v12];

  if (v11)
  {
    v33[0] = v15;
    v16 = [MEMORY[0x263F08A98] predicateWithFormat:@"bss.bssid == %@", v11];
    v33[1] = v16;
    v17 = +[AnalyticsStoreProxy predicateForEntityWithAge:v13 maxAge:a5];
    v18 = (void *)[v17 copy];
    v33[2] = v18;
    [MEMORY[0x263EFF8C0] arrayWithObjects:v33 count:3];
    id v20 = v19 = v8;
    long long v21 = [v14 andPredicateWithSubpredicates:v20];

    BOOL v8 = v19;
  }
  else
  {
    v32[0] = v15;
    v16 = +[AnalyticsStoreProxy predicateForEntityWithAge:v13 maxAge:a5];
    v17 = (void *)[v16 copy];
    v32[1] = v17;
    v18 = [MEMORY[0x263EFF8C0] arrayWithObjects:v32 count:2];
    long long v21 = [v14 andPredicateWithSubpredicates:v18];
  }

  long long v22 = (void *)MEMORY[0x263F08730];
  if (v8)
  {
    v31[0] = v21;
    long long v23 = [MEMORY[0x263F08A98] predicateWithFormat:@"success == 1"];
    v31[1] = v23;
    long long v24 = v31;
  }
  else
  {
    v30[0] = v21;
    long long v23 = [MEMORY[0x263F08A98] predicateWithFormat:@"success != 1"];
    v30[1] = v23;
    long long v24 = v30;
  }
  v25 = [MEMORY[0x263EFF8C0] arrayWithObjects:v24 count:2];
  uint64_t v26 = [v22 andPredicateWithSubpredicates:v25];

  unint64_t v27 = +[AnalyticsStoreProxy entityCount:v13 withPredicate:v26 moc:v29];
  return v27;
}

+ (id)fetchRequest
{
  return (id)[MEMORY[0x263EFF260] fetchRequestWithEntityName:@"Join"];
}

@end