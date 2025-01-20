@interface PassSharedEntitlement
+ (id)_passSharedEntitlementsWithQuery:(id)a3 inDatabase:(id)a4;
+ (id)_predicateForEntitlementIdentifier:(id)a3;
+ (id)_predicateForPassSharePID:(int64_t)a3;
+ (id)_propertySettersForPassSharedEntitlement;
+ (id)_propertyValuesForPassSharedEntitlement:(id)a3;
+ (id)databaseTable;
+ (id)passSharedEntitlementsForPassSharePID:(int64_t)a3 inDatabase:(id)a4;
+ (void)deletePassSharedEntitlementForPassSharePID:(int64_t)a3 inDatabase:(id)a4;
+ (void)insertOrUpdatePassSharedEntitlements:(id)a3 forPassSharePID:(int64_t)a4 inDatabase:(id)a5;
- (PassSharedEntitlement)initWithPassSharedEntitlement:(id)a3 forPassSharePID:(int64_t)a4 inDatabase:(id)a5;
- (id)passSharedEntitlement;
- (void)updateWithPassSharedEntitlement:(id)a3;
@end

@implementation PassSharedEntitlement

+ (id)databaseTable
{
  return @"kiwano";
}

- (PassSharedEntitlement)initWithPassSharedEntitlement:(id)a3 forPassSharePID:(int64_t)a4 inDatabase:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  v10 = [(id)objc_opt_class() _propertyValuesForPassSharedEntitlement:v9];

  v11 = +[NSNumber numberWithLongLong:a4];
  [v10 setObjectOrNull:v11 forKey:@"a"];

  v12 = [(SQLiteEntity *)self initWithPropertyValues:v10 inDatabase:v8];
  return v12;
}

- (void)updateWithPassSharedEntitlement:(id)a3
{
  id v4 = a3;
  id v5 = [(id)objc_opt_class() _propertyValuesForPassSharedEntitlement:v4];

  [(SQLiteEntity *)self setValuesWithDictionary:v5];
}

+ (void)insertOrUpdatePassSharedEntitlements:(id)a3 forPassSharePID:(int64_t)a4 inDatabase:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  id v27 = objc_alloc_init((Class)NSMutableSet);
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id obj = v7;
  id v28 = [obj countByEnumeratingWithState:&v30 objects:v36 count:16];
  if (v28)
  {
    uint64_t v25 = *(void *)v31;
    do
    {
      for (i = 0; i != v28; i = (char *)i + 1)
      {
        if (*(void *)v31 != v25) {
          objc_enumerationMutation(obj);
        }
        v10 = *(void **)(*((void *)&v30 + 1) + 8 * i);
        uint64_t v11 = [v10 entitlementIdentifier];
        v12 = [a1 _predicateForPassSharePID:a4];
        v35[0] = v12;
        v29 = (void *)v11;
        v13 = [a1 _predicateForEntitlementIdentifier:v11];
        v35[1] = v13;
        v14 = +[NSArray arrayWithObjects:v35 count:2];
        +[SQLiteCompoundPredicate predicateMatchingAllPredicates:v14];
        v16 = int64_t v15 = a4;
        v17 = [a1 anyInDatabase:v8 predicate:v16];

        if (v17) {
          [(PassSharedEntitlement *)v17 updateWithPassSharedEntitlement:v10];
        }
        else {
          v17 = [[PassSharedEntitlement alloc] initWithPassSharedEntitlement:v10 forPassSharePID:v15 inDatabase:v8];
        }
        a4 = v15;
        v18 = [v10 timeConfiguration];
        +[PassShareTimeConfiguration insertOrUpdatePassShareTimeConfiguration:v18 forPassSharedEntitlementPID:[(SQLiteEntity *)v17 persistentID] inDatabase:v8];

        [v27 addObject:v29];
      }
      id v28 = [obj countByEnumeratingWithState:&v30 objects:v36 count:16];
    }
    while (v28);
  }

  v19 = +[SQLiteContainsPredicate doesNotContainPredicateWithProperty:@"b" values:v27];
  v34[0] = v19;
  v20 = [a1 _predicateForPassSharePID:a4];
  v34[1] = v20;
  v21 = +[NSArray arrayWithObjects:v34 count:2];
  v22 = +[SQLiteCompoundPredicate predicateMatchingAllPredicates:v21];

  v23 = [a1 queryWithDatabase:v8 predicate:v22];
  [v23 deleteAllEntities];
}

+ (id)passSharedEntitlementsForPassSharePID:(int64_t)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v7 = [a1 _predicateForPassSharePID:a3];
  id v8 = [a1 queryWithDatabase:v6 predicate:v7];
  id v9 = [a1 _passSharedEntitlementsWithQuery:v8 inDatabase:v6];

  return v9;
}

+ (void)deletePassSharedEntitlementForPassSharePID:(int64_t)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v7 = [a1 _predicateForPassSharePID:a3];
  id v8 = [a1 queryWithDatabase:v6 predicate:v7];
  [v8 deleteAllEntities];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1002AB5F4;
  v10[3] = &unk_100731020;
  id v11 = v6;
  id v9 = v6;
  [v8 enumeratePersistentIDsUsingBlock:v10];
}

+ (id)_passSharedEntitlementsWithQuery:(id)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [a1 _propertySettersForPassSharedEntitlement];
  id v9 = objc_alloc_init((Class)NSMutableArray);
  v10 = [v8 allKeys];
  v16 = _NSConcreteStackBlock;
  uint64_t v17 = 3221225472;
  v18 = sub_1002AB760;
  v19 = &unk_10072DE00;
  id v23 = a1;
  id v20 = v8;
  id v21 = v6;
  id v11 = v9;
  id v22 = v11;
  id v12 = v6;
  id v13 = v8;
  [v7 enumeratePersistentIDsAndProperties:v10 usingBlock:&v16];

  if (objc_msgSend(v11, "count", v16, v17, v18, v19)) {
    id v14 = [v11 copy];
  }
  else {
    id v14 = 0;
  }

  return v14;
}

- (id)passSharedEntitlement
{
  id v3 = objc_alloc_init((Class)PKPassSharedEntitlement);
  id v4 = [(id)objc_opt_class() _propertySettersForPassSharedEntitlement];
  id v5 = [v4 allKeys];
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_1002AB994;
  v14[3] = &unk_10072DDD8;
  v14[4] = self;
  id v15 = v4;
  id v6 = v3;
  id v16 = v6;
  id v7 = v4;
  [(SQLiteEntity *)self getValuesForProperties:v5 withApplier:v14];

  int64_t v8 = [(SQLiteEntity *)self persistentID];
  id v9 = [(SQLiteEntity *)self database];
  v10 = +[PassShareTimeConfiguration passShareTimeConfigurationsForPassSharedEntitlementPID:v8 inDatabase:v9];
  id v11 = [v10 firstObject];

  [v6 setTimeConfiguration:v11];
  id v12 = v6;

  return v12;
}

+ (id)_predicateForPassSharePID:(int64_t)a3
{
  id v3 = +[NSNumber numberWithLongLong:a3];
  id v4 = +[SQLiteComparisonPredicate predicateWithProperty:@"a" equalToValue:v3];

  return v4;
}

+ (id)_predicateForEntitlementIdentifier:(id)a3
{
  return +[SQLiteComparisonPredicate predicateWithProperty:@"b" equalToValue:a3];
}

+ (id)_propertyValuesForPassSharedEntitlement:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init((Class)NSMutableDictionary);
  id v5 = [v3 entitlementIdentifier];
  [v4 setObjectOrNull:v5 forKey:@"b"];

  [v3 recipientShareability];
  id v6 = PKSharingCapabilityShareabilityToString();
  [v4 setObjectOrNull:v6 forKey:@"e"];

  [v3 recipientVisibility];
  id v7 = PKSharingCapabilityVisibilityToString();
  [v4 setObjectOrNull:v7 forKey:@"f"];

  [v3 recipientManageability];
  int64_t v8 = PKSharingCapabilityManageabilityToString();
  [v4 setObjectOrNull:v8 forKey:@"g"];

  id v9 = [v3 recipientCapabilityRole];
  [v4 setObjectOrNull:v9 forKey:@"i"];

  id v10 = [v3 creationVersion];
  id v11 = +[NSNumber numberWithInteger:v10];
  [v4 setObjectOrNull:v11 forKey:@"h"];

  return v4;
}

+ (id)_propertySettersForPassSharedEntitlement
{
  v4[0] = @"b";
  v4[1] = @"e";
  v5[0] = &stru_1007453F8;
  v5[1] = &stru_100745418;
  v4[2] = @"f";
  v4[3] = @"g";
  v5[2] = &stru_100745438;
  v5[3] = &stru_100745458;
  v4[4] = @"i";
  v4[5] = @"h";
  v5[4] = &stru_100745478;
  v5[5] = &stru_100745498;
  v2 = +[NSDictionary dictionaryWithObjects:v5 forKeys:v4 count:6];
  return v2;
}

@end