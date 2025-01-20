@interface PassShareTimeSchedule
+ (id)_passShareTimeSchedulesWithQuery:(id)a3;
+ (id)_predicateForTimeConfigurationPID:(int64_t)a3;
+ (id)_propertySetters;
+ (id)_propertyValuesForObject:(id)a3;
+ (id)databaseTable;
+ (id)passShareTimeSchedulesForTimeConfigurationPID:(int64_t)a3 inDatabase:(id)a4;
+ (void)deletePassShareTimeSchedulesForTimeConfigurationPID:(int64_t)a3 inDatabase:(id)a4;
+ (void)insertOrUpdatePassShareTimeSchedules:(id)a3 forTimeConfigurationPID:(int64_t)a4 inDatabase:(id)a5;
- (PassShareTimeSchedule)initWithPassShareTimeSchedule:(id)a3 forTimeConfigurationPID:(int64_t)a4 inDatabase:(id)a5;
- (id)passShareTimeSchedule;
@end

@implementation PassShareTimeSchedule

+ (id)databaseTable
{
  return @"eggs_benedict";
}

- (PassShareTimeSchedule)initWithPassShareTimeSchedule:(id)a3 forTimeConfigurationPID:(int64_t)a4 inDatabase:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  v10 = [(id)objc_opt_class() _propertyValuesForObject:v9];

  v11 = +[NSNumber numberWithLongLong:a4];
  [v10 setObjectOrNull:v11 forKey:@"a"];

  v12 = [(SQLiteEntity *)self initWithPropertyValues:v10 inDatabase:v8];
  return v12;
}

+ (void)insertOrUpdatePassShareTimeSchedules:(id)a3 forTimeConfigurationPID:(int64_t)a4 inDatabase:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  [a1 deletePassShareTimeSchedulesForTimeConfigurationPID:a4 inDatabase:v9];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v10 = v8;
  id v11 = [v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v18;
    do
    {
      v14 = 0;
      do
      {
        if (*(void *)v18 != v13) {
          objc_enumerationMutation(v10);
        }
        uint64_t v15 = *(void *)(*((void *)&v17 + 1) + 8 * (void)v14);
        v16 = [PassShareTimeSchedule alloc];

        v14 = (char *)v14 + 1;
      }
      while (v12 != v14);
      id v12 = [v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v12);
  }
}

+ (id)passShareTimeSchedulesForTimeConfigurationPID:(int64_t)a3 inDatabase:(id)a4
{
  id v6 = a4;
  v7 = [a1 _predicateForTimeConfigurationPID:a3];
  id v8 = [a1 queryWithDatabase:v6 predicate:v7];

  id v9 = [a1 _passShareTimeSchedulesWithQuery:v8];

  return v9;
}

+ (void)deletePassShareTimeSchedulesForTimeConfigurationPID:(int64_t)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v8 = [a1 _predicateForTimeConfigurationPID:a3];
  v7 = [a1 queryWithDatabase:v6 predicate:v8];

  [v7 deleteAllEntities];
}

+ (id)_passShareTimeSchedulesWithQuery:(id)a3
{
  id v4 = a3;
  v5 = [a1 _propertySetters];
  id v6 = objc_alloc_init((Class)NSMutableArray);
  v7 = [v5 allKeys];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100118FAC;
  v12[3] = &unk_10072EAD8;
  id v15 = a1;
  id v13 = v5;
  id v8 = v6;
  id v14 = v8;
  id v9 = v5;
  [v4 enumeratePersistentIDsAndProperties:v7 usingBlock:v12];

  if ([v8 count]) {
    id v10 = [v8 copy];
  }
  else {
    id v10 = 0;
  }

  return v10;
}

- (id)passShareTimeSchedule
{
  id v3 = objc_alloc_init((Class)PKPassShareTimeSchedule);
  id v4 = [(id)objc_opt_class() _propertySetters];
  v5 = [v4 allKeys];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100119130;
  v11[3] = &unk_10072DDD8;
  v11[4] = self;
  id v12 = v4;
  id v6 = v3;
  id v13 = v6;
  id v7 = v4;
  [(SQLiteEntity *)self getValuesForProperties:v5 withApplier:v11];

  id v8 = v13;
  id v9 = v6;

  return v9;
}

+ (id)_predicateForTimeConfigurationPID:(int64_t)a3
{
  id v3 = +[NSNumber numberWithLongLong:a3];
  id v4 = +[SQLiteComparisonPredicate predicateWithProperty:@"a" equalToValue:v3];

  return v4;
}

+ (id)_propertyValuesForObject:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init((Class)NSMutableDictionary);
  v5 = [v3 hoursOfDay];
  id v6 = _SQLValueForIntegerArray(v5);
  [v4 setObjectOrNull:v6 forKey:@"b"];

  id v7 = [v3 daysOfWeek];
  id v8 = _SQLValueForIntegerArray(v7);
  [v4 setObjectOrNull:v8 forKey:@"c"];

  id v9 = [v3 daysOfMonth];
  id v10 = _SQLValueForIntegerArray(v9);
  [v4 setObjectOrNull:v10 forKey:@"d"];

  id v11 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v3 interval]);
  [v4 setObjectOrNull:v11 forKey:@"e"];

  [v3 frequency];
  id v12 = PKPassShareTimeScheduleFrequencyToString();
  [v4 setObjectOrNull:v12 forKey:@"f"];

  return v4;
}

+ (id)_propertySetters
{
  v4[0] = @"b";
  v4[1] = @"c";
  v5[0] = &stru_1007384A0;
  v5[1] = &stru_1007384C0;
  v4[2] = @"d";
  v4[3] = @"e";
  v5[2] = &stru_1007384E0;
  v5[3] = &stru_100738500;
  v4[4] = @"f";
  v5[4] = &stru_100738520;
  v2 = +[NSDictionary dictionaryWithObjects:v5 forKeys:v4 count:5];
  return v2;
}

@end