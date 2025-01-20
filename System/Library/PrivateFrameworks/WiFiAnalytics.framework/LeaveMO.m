@interface LeaveMO
+ (id)entityName;
+ (id)fetchRequest;
+ (id)firstLeaveAfter:(id)a3 ssid:(id)a4 moc:(id)a5;
+ (id)generateInstance:(id)a3;
@end

@implementation LeaveMO

+ (id)entityName
{
  return @"Leave";
}

+ (id)generateInstance:(id)a3
{
  id v3 = a3;
  v4 = +[LeaveMO entityName];
  v5 = +[AnalyticsStoreProxy createEntity:v4 moc:v3];

  return v5;
}

+ (id)firstLeaveAfter:(id)a3 ssid:(id)a4 moc:(id)a5
{
  v22[1] = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  context = (void *)MEMORY[0x223C0F2E0]();
  v10 = +[LeaveMO fetchRequest];
  v11 = (void *)[objc_alloc(MEMORY[0x263F08B30]) initWithKey:@"date" ascending:1];
  v22[0] = v11;
  v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:v22 count:1];
  [v10 setSortDescriptors:v12];

  v13 = (void *)MEMORY[0x263F08730];
  v14 = [MEMORY[0x263F08A98] predicateWithFormat:@"bss.network.ssid == %@", v8];
  v21[0] = v14;
  v15 = [MEMORY[0x263F08A98] predicateWithFormat:@"%K > %@", @"date", v7];
  v21[1] = v15;
  v16 = [MEMORY[0x263EFF8C0] arrayWithObjects:v21 count:2];
  v17 = [v13 andPredicateWithSubpredicates:v16];

  v18 = +[AnalyticsStoreProxy fetchFirst:v10 withPredicate:v17 moc:v9];

  return v18;
}

+ (id)fetchRequest
{
  return (id)[MEMORY[0x263EFF260] fetchRequestWithEntityName:@"Leave"];
}

@end