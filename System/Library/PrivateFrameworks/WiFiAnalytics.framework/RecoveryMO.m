@interface RecoveryMO
+ (id)entityName;
+ (id)fetchRequest;
+ (id)generateInstance:(id)a3;
+ (id)mostRecentRecovery:(id)a3 reason:(id)a4 moc:(id)a5;
@end

@implementation RecoveryMO

+ (id)entityName
{
  return @"Recovery";
}

+ (id)generateInstance:(id)a3
{
  id v3 = a3;
  v4 = +[RecoveryMO entityName];
  v5 = +[AnalyticsStoreProxy createEntity:v4 moc:v3];

  return v5;
}

+ (id)mostRecentRecovery:(id)a3 reason:(id)a4 moc:(id)a5
{
  v24[1] = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  v10 = +[RecoveryMO fetchRequest];
  v11 = (void *)[objc_alloc(MEMORY[0x263F08B30]) initWithKey:@"date" ascending:0];
  v24[0] = v11;
  v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:v24 count:1];
  [v10 setSortDescriptors:v12];

  v13 = (void *)MEMORY[0x263F08730];
  if (v7 && v8)
  {
    v14 = [MEMORY[0x263F08A98] predicateWithFormat:@"recoveryType == %@", v7];
    v23[0] = v14;
    v15 = [MEMORY[0x263F08A98] predicateWithFormat:@"recoveryReason == %@", v8];
    v23[1] = v15;
    v16 = [MEMORY[0x263F08A98] predicateWithFormat:@"apple80211Return == 0"];
    v23[2] = v16;
    v17 = [MEMORY[0x263EFF8C0] arrayWithObjects:v23 count:3];
    v18 = [v13 andPredicateWithSubpredicates:v17];

LABEL_6:
    goto LABEL_7;
  }
  if (v7)
  {
    v14 = [MEMORY[0x263F08A98] predicateWithFormat:@"recoveryType == %@", v7];
    v22[0] = v14;
    v15 = [MEMORY[0x263F08A98] predicateWithFormat:@"apple80211Return == 1"];
    v22[1] = v15;
    v16 = [MEMORY[0x263EFF8C0] arrayWithObjects:v22 count:2];
    v18 = [v13 andPredicateWithSubpredicates:v16];
    goto LABEL_6;
  }
  v14 = [MEMORY[0x263F08A98] predicateWithFormat:@"apple80211Return == 1"];
  v21 = v14;
  v15 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v21 count:1];
  v18 = [v13 andPredicateWithSubpredicates:v15];
LABEL_7:

  v19 = +[AnalyticsStoreProxy fetchFirst:v10 withPredicate:v18 moc:v9];

  return v19;
}

+ (id)fetchRequest
{
  return (id)[MEMORY[0x263EFF260] fetchRequestWithEntityName:@"Recovery"];
}

@end