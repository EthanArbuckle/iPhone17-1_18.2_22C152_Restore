@interface PassShareTimeConfiguration
+ (id)_passShareTimeConfigurationsWithQuery:(id)a3 inDatabase:(id)a4;
+ (id)_predicateForPassEntitlementPID:(int64_t)a3;
+ (id)_predicateForPassSharedEntitlementPID:(int64_t)a3;
+ (id)_propertySetters;
+ (id)_propertyValuesForObject:(id)a3;
+ (id)databaseTable;
+ (id)passShareTimeConfigurationsForPassEntitlementPID:(int64_t)a3 inDatabase:(id)a4;
+ (id)passShareTimeConfigurationsForPassSharedEntitlementPID:(int64_t)a3 inDatabase:(id)a4;
+ (void)_deletePassShareTimeConfigurationsForQuery:(id)a3 inDatabase:(id)a4;
+ (void)_insertOrUpdatePassShareTimeConfigurations:(id)a3 forPassSharedEntitlementPID:(int64_t)a4 forPassEntitlementPID:(int64_t)a5 inDatabase:(id)a6;
+ (void)deletePassShareTimeConfigurationsForPassEntitlementPID:(int64_t)a3 inDatabase:(id)a4;
+ (void)deletePassShareTimeConfigurationsForPassSharedEntitlementPID:(int64_t)a3 inDatabase:(id)a4;
+ (void)insertOrUpdatePassShareTimeConfiguration:(id)a3 forPassEntitlementPID:(int64_t)a4 inDatabase:(id)a5;
+ (void)insertOrUpdatePassShareTimeConfiguration:(id)a3 forPassSharedEntitlementPID:(int64_t)a4 inDatabase:(id)a5;
- (PassShareTimeConfiguration)initWithPassShareTimeConfiguration:(id)a3 forPassSharedEntitlementPID:(int64_t)a4 forPassEntitlementPID:(int64_t)a5 inDatabase:(id)a6;
- (id)passShareTimeConfiguration;
- (void)updateWithPassShareTimeConfiguration:(id)a3;
@end

@implementation PassShareTimeConfiguration

+ (id)databaseTable
{
  return @"avocado_toast";
}

- (PassShareTimeConfiguration)initWithPassShareTimeConfiguration:(id)a3 forPassSharedEntitlementPID:(int64_t)a4 forPassEntitlementPID:(int64_t)a5 inDatabase:(id)a6
{
  id v10 = a6;
  id v11 = a3;
  v12 = [(id)objc_opt_class() _propertyValuesForObject:v11];

  if (a4)
  {
    v13 = +[NSNumber numberWithLongLong:a4];
    [v12 setObjectOrNull:v13 forKey:@"a"];
  }
  if (a5)
  {
    v14 = +[NSNumber numberWithLongLong:a5];
    [v12 setObjectOrNull:v14 forKey:@"b"];
  }
  v15 = [(SQLiteEntity *)self initWithPropertyValues:v12 inDatabase:v10];

  return v15;
}

- (void)updateWithPassShareTimeConfiguration:(id)a3
{
  id v4 = a3;
  id v5 = [(id)objc_opt_class() _propertyValuesForObject:v4];

  [(SQLiteEntity *)self setValuesWithDictionary:v5];
}

+ (void)insertOrUpdatePassShareTimeConfiguration:(id)a3 forPassSharedEntitlementPID:(int64_t)a4 inDatabase:(id)a5
{
  if (a3)
  {
    id v11 = a3;
    id v8 = a5;
    id v9 = a3;
    id v10 = +[NSArray arrayWithObjects:&v11 count:1];

    objc_msgSend(a1, "_insertOrUpdatePassShareTimeConfigurations:forPassSharedEntitlementPID:forPassEntitlementPID:inDatabase:", v10, a4, 0, v8, v11);
  }
}

+ (void)insertOrUpdatePassShareTimeConfiguration:(id)a3 forPassEntitlementPID:(int64_t)a4 inDatabase:(id)a5
{
  if (a3)
  {
    id v11 = a3;
    id v8 = a5;
    id v9 = a3;
    id v10 = +[NSArray arrayWithObjects:&v11 count:1];

    objc_msgSend(a1, "_insertOrUpdatePassShareTimeConfigurations:forPassSharedEntitlementPID:forPassEntitlementPID:inDatabase:", v10, 0, a4, v8, v11);
  }
}

+ (void)_insertOrUpdatePassShareTimeConfigurations:(id)a3 forPassSharedEntitlementPID:(int64_t)a4 forPassEntitlementPID:(int64_t)a5 inDatabase:(id)a6
{
  id v10 = a3;
  id v11 = a6;
  if (a4) {
    [a1 deletePassShareTimeConfigurationsForPassSharedEntitlementPID:a4 inDatabase:v11];
  }
  if (a5) {
    [a1 deletePassShareTimeConfigurationsForPassEntitlementPID:a5 inDatabase:v11];
  }
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id obj = v10;
  id v12 = [obj countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v12)
  {
    id v13 = v12;
    uint64_t v14 = *(void *)v21;
    do
    {
      v15 = 0;
      do
      {
        if (*(void *)v21 != v14) {
          objc_enumerationMutation(obj);
        }
        v16 = *(void **)(*((void *)&v20 + 1) + 8 * (void)v15);
        v17 = [[PassShareTimeConfiguration alloc] initWithPassShareTimeConfiguration:v16 forPassSharedEntitlementPID:a4 forPassEntitlementPID:a5 inDatabase:v11];
        v18 = [v16 schedules];
        +[PassShareTimeSchedule insertOrUpdatePassShareTimeSchedules:v18 forTimeConfigurationPID:[(SQLiteEntity *)v17 persistentID] inDatabase:v11];

        v15 = (char *)v15 + 1;
      }
      while (v13 != v15);
      id v13 = [obj countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v13);
  }
}

+ (id)passShareTimeConfigurationsForPassSharedEntitlementPID:(int64_t)a3 inDatabase:(id)a4
{
  id v6 = a4;
  v7 = [a1 _predicateForPassSharedEntitlementPID:a3];
  id v8 = [a1 queryWithDatabase:v6 predicate:v7];
  id v9 = [a1 _passShareTimeConfigurationsWithQuery:v8 inDatabase:v6];

  return v9;
}

+ (id)passShareTimeConfigurationsForPassEntitlementPID:(int64_t)a3 inDatabase:(id)a4
{
  id v6 = a4;
  v7 = [a1 _predicateForPassEntitlementPID:a3];
  id v8 = [a1 queryWithDatabase:v6 predicate:v7];
  id v9 = [a1 _passShareTimeConfigurationsWithQuery:v8 inDatabase:v6];

  return v9;
}

+ (void)deletePassShareTimeConfigurationsForPassSharedEntitlementPID:(int64_t)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v8 = [a1 _predicateForPassSharedEntitlementPID:a3];
  v7 = [a1 queryWithDatabase:v6 predicate:v8];
  [a1 _deletePassShareTimeConfigurationsForQuery:v7 inDatabase:v6];
}

+ (void)deletePassShareTimeConfigurationsForPassEntitlementPID:(int64_t)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v8 = [a1 _predicateForPassEntitlementPID:a3];
  v7 = [a1 queryWithDatabase:v6 predicate:v8];
  [a1 _deletePassShareTimeConfigurationsForQuery:v7 inDatabase:v6];
}

+ (void)_deletePassShareTimeConfigurationsForQuery:(id)a3 inDatabase:(id)a4
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10011B504;
  v7[3] = &unk_100731020;
  id v8 = a4;
  id v5 = v8;
  id v6 = a3;
  [v6 enumeratePersistentIDsUsingBlock:v7];
  [v6 deleteAllEntities];
}

+ (id)_passShareTimeConfigurationsWithQuery:(id)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [a1 _propertySetters];
  id v9 = objc_alloc_init((Class)NSMutableArray);
  id v10 = [v8 allKeys];
  v16 = _NSConcreteStackBlock;
  uint64_t v17 = 3221225472;
  v18 = sub_10011B670;
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

- (id)passShareTimeConfiguration
{
  id v3 = objc_alloc_init((Class)PKPassShareTimeConfiguration);
  id v4 = [(id)objc_opt_class() _propertySetters];
  id v5 = [v4 allKeys];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10011B878;
  v12[3] = &unk_10072DDD8;
  v12[4] = self;
  id v13 = v4;
  id v6 = v3;
  id v14 = v6;
  id v7 = v4;
  [(SQLiteEntity *)self getValuesForProperties:v5 withApplier:v12];

  id v8 = +[PassShareTimeSchedule passShareTimeSchedulesForTimeConfigurationPID:[(SQLiteEntity *)self persistentID] inDatabase:self->super._database];
  [v6 setSchedules:v8];

  id v9 = v14;
  id v10 = v6;

  return v10;
}

+ (id)_predicateForPassSharedEntitlementPID:(int64_t)a3
{
  id v3 = +[NSNumber numberWithLongLong:a3];
  id v4 = +[SQLiteComparisonPredicate predicateWithProperty:@"a" equalToValue:v3];

  return v4;
}

+ (id)_predicateForPassEntitlementPID:(int64_t)a3
{
  id v3 = +[NSNumber numberWithLongLong:a3];
  id v4 = +[SQLiteComparisonPredicate predicateWithProperty:@"b" equalToValue:v3];

  return v4;
}

+ (id)_propertyValuesForObject:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init((Class)NSMutableDictionary);
  id v5 = [v3 startDate];
  id v6 = (void *)_SQLValueForDate();
  [v4 setObjectOrNull:v6 forKey:@"c"];

  id v7 = [v3 expirationDate];
  id v8 = (void *)_SQLValueForDate();
  [v4 setObjectOrNull:v8 forKey:@"d"];

  [v3 support];
  id v9 = PKPassShareTimeConfigurationSupportToString();
  [v4 setObjectOrNull:v9 forKey:@"e"];

  return v4;
}

+ (id)_propertySetters
{
  v4[0] = @"c";
  v4[1] = @"d";
  v5[0] = &stru_100738840;
  v5[1] = &stru_100738860;
  v4[2] = @"e";
  v5[2] = &stru_100738880;
  v2 = +[NSDictionary dictionaryWithObjects:v5 forKeys:v4 count:3];
  return v2;
}

@end