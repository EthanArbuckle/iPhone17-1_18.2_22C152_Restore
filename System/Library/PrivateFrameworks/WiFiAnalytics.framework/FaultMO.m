@interface FaultMO
+ (id)entityName;
+ (id)fetchRequest;
+ (id)generateInstance:(id)a3;
+ (id)mostRecentFault:(id)a3 moc:(id)a4;
+ (id)mostRecentFaultsWithBatchSize:(unint64_t)a3 moc:(id)a4;
+ (unint64_t)faultCount:(id)a3 maxAgeInDays:(unint64_t)a4 moc:(id)a5;
@end

@implementation FaultMO

+ (id)entityName
{
  return @"Fault";
}

+ (id)generateInstance:(id)a3
{
  id v3 = a3;
  v4 = +[FaultMO entityName];
  v5 = +[AnalyticsStoreProxy createEntity:v4 moc:v3];

  return v5;
}

+ (id)mostRecentFault:(id)a3 moc:(id)a4
{
  v17[1] = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  v7 = +[FaultMO fetchRequest];
  v8 = (void *)[objc_alloc(MEMORY[0x263F08B30]) initWithKey:@"date" ascending:0];
  v17[0] = v8;
  v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v17 count:1];
  [v7 setSortDescriptors:v9];

  if (v5)
  {
    v10 = (void *)MEMORY[0x263F08730];
    v11 = [MEMORY[0x263F08A98] predicateWithFormat:@"bss.fault.type == %@", v5];
    v16 = v11;
    v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v16 count:1];
    v13 = [v10 andPredicateWithSubpredicates:v12];
  }
  else
  {
    v13 = 0;
  }
  v14 = +[AnalyticsStoreProxy fetchFirst:v7 withPredicate:v13 moc:v6];

  return v14;
}

+ (id)mostRecentFaultsWithBatchSize:(unint64_t)a3 moc:(id)a4
{
  v19[1] = *MEMORY[0x263EF8340];
  id v5 = (objc_class *)MEMORY[0x263F08B30];
  id v6 = a4;
  v7 = (void *)[[v5 alloc] initWithKey:@"date" ascending:0];
  v8 = +[FaultMO fetchRequest];
  [v8 setFetchBatchSize:a3];
  v19[0] = v7;
  v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v19 count:1];
  [v8 setSortDescriptors:v9];

  v10 = +[AnalyticsStoreProxy fetch:v8 withPredicate:0 moc:v6];

  if (v10)
  {
    v11 = WALogCategoryDeviceStoreHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      int v13 = 136446722;
      v14 = "+[FaultMO mostRecentFaultsWithBatchSize:moc:]";
      __int16 v15 = 1024;
      int v16 = 55;
      __int16 v17 = 2048;
      uint64_t v18 = [v10 count];
      _os_log_impl(&dword_21D96D000, v11, OS_LOG_TYPE_DEBUG, "%{public}s::%d:ResultCount:%lu", (uint8_t *)&v13, 0x1Cu);
    }
  }
  return v10;
}

+ (unint64_t)faultCount:(id)a3 maxAgeInDays:(unint64_t)a4 moc:(id)a5
{
  v18[2] = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a5;
  v9 = +[FaultMO entityName];
  if (v7)
  {
    v10 = (void *)MEMORY[0x263F08730];
    v11 = [MEMORY[0x263F08A98] predicateWithFormat:@"bss.fault.type == %@", v7];
    v18[0] = v11;
    v12 = +[AnalyticsStoreProxy predicateForEntityWithAge:v9 maxAge:a4];
    int v13 = (void *)[v12 copy];
    v18[1] = v13;
    v14 = [MEMORY[0x263EFF8C0] arrayWithObjects:v18 count:2];
    __int16 v15 = [v10 andPredicateWithSubpredicates:v14];
  }
  else
  {
    __int16 v15 = +[AnalyticsStoreProxy predicateForEntityWithAge:v9 maxAge:a4];
  }
  unint64_t v16 = +[AnalyticsStoreProxy entityCount:v9 withPredicate:v15 moc:v8];

  return v16;
}

+ (id)fetchRequest
{
  return (id)[MEMORY[0x263EFF260] fetchRequestWithEntityName:@"Fault"];
}

@end