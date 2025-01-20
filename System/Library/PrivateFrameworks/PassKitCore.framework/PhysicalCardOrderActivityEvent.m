@interface PhysicalCardOrderActivityEvent
+ (id)_activityEventsWithQuery:(id)a3;
+ (id)_predicateForPhysicalCardPID:(int64_t)a3;
+ (id)_propertySettersForActivityEvent;
+ (id)associationPropertyForEntityClass:(Class)a3;
+ (id)databaseTable;
+ (id)insertPhysicalCardOrderActivityEvents:(id)a3 forPhysicalCardPID:(int64_t)a4 inDatabase:(id)a5;
+ (id)physicalCardOrderActivityEventsForPhysicalCardPID:(int64_t)a3 inDatabase:(id)a4;
+ (void)deleteActivityEventsForPhysicalCardPID:(int64_t)a3 inDatabase:(id)a4;
+ (void)updateActivityEvents:(id)a3 forPhysicalCardPID:(int64_t)a4 inDatabase:(id)a5;
- (PhysicalCardOrderActivityEvent)initWithActivityEvent:(id)a3 forPhysicalCardPID:(int64_t)a4 inDatabase:(id)a5;
- (id)activityEvent;
- (void)updateWithActivityEvent:(id)a3;
@end

@implementation PhysicalCardOrderActivityEvent

+ (id)databaseTable
{
  return @"pitayas";
}

+ (id)associationPropertyForEntityClass:(Class)a3
{
  if ((Class)objc_opt_class() == a3) {
    return @"a";
  }
  else {
    return 0;
  }
}

- (PhysicalCardOrderActivityEvent)initWithActivityEvent:(id)a3 forPhysicalCardPID:(int64_t)a4 inDatabase:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  v10 = +[NSMutableDictionary dictionary];
  v11 = +[NSNumber numberWithLongLong:a4];
  [v10 setObjectOrNull:v11 forKey:@"a"];

  v12 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v9 activity]);
  [v10 setObjectOrNull:v12 forKey:@"b"];

  v13 = [v9 date];

  v14 = (void *)_SQLValueForDate();
  [v10 setObjectOrNull:v14 forKey:@"c"];

  v15 = [(SQLiteEntity *)self initWithPropertyValues:v10 inDatabase:v8];
  return v15;
}

+ (void)updateActivityEvents:(id)a3 forPhysicalCardPID:(int64_t)a4 inDatabase:(id)a5
{
  id v10 = a3;
  id v8 = a5;
  [a1 deleteActivityEventsForPhysicalCardPID:a4 inDatabase:v8];
  id v9 = [a1 insertPhysicalCardOrderActivityEvents:v10 forPhysicalCardPID:a4 inDatabase:v8];
}

- (void)updateWithActivityEvent:(id)a3
{
  id v4 = a3;
  id v8 = +[NSMutableDictionary dictionary];
  v5 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v4 activity]);
  [v8 setObjectOrNull:v5 forKey:@"b"];

  v6 = [v4 date];

  v7 = (void *)_SQLValueForDate();
  [v8 setObjectOrNull:v7 forKey:@"c"];

  [(SQLiteEntity *)self setValuesWithDictionary:v8];
}

+ (id)insertPhysicalCardOrderActivityEvents:(id)a3 forPhysicalCardPID:(int64_t)a4 inDatabase:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  id v9 = objc_alloc_init((Class)NSMutableSet);
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v10 = v7;
  id v11 = [v10 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v21;
    do
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(void *)v21 != v13) {
          objc_enumerationMutation(v10);
        }
        uint64_t v15 = *(void *)(*((void *)&v20 + 1) + 8 * i);
        v16 = [PhysicalCardOrderActivityEvent alloc];
        v17 = -[PhysicalCardOrderActivityEvent initWithActivityEvent:forPhysicalCardPID:inDatabase:](v16, "initWithActivityEvent:forPhysicalCardPID:inDatabase:", v15, a4, v8, (void)v20);
        if (v17) {
          [v9 addObject:v17];
        }
      }
      id v12 = [v10 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v12);
  }

  if ([v9 count]) {
    id v18 = [v9 copy];
  }
  else {
    id v18 = 0;
  }

  return v18;
}

+ (void)deleteActivityEventsForPhysicalCardPID:(int64_t)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v8 = [a1 _predicateForPhysicalCardPID:a3];
  id v7 = [a1 queryWithDatabase:v6 predicate:v8];

  [v7 deleteAllEntities];
}

+ (id)physicalCardOrderActivityEventsForPhysicalCardPID:(int64_t)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v7 = [a1 _predicateForPhysicalCardPID:a3];
  id v8 = [a1 queryWithDatabase:v6 predicate:v7];

  id v9 = [a1 _activityEventsWithQuery:v8];

  return v9;
}

+ (id)_predicateForPhysicalCardPID:(int64_t)a3
{
  v3 = +[NSNumber numberWithLongLong:a3];
  id v4 = +[SQLiteComparisonPredicate predicateWithProperty:@"a" equalToValue:v3];

  return v4;
}

- (id)activityEvent
{
  id v3 = objc_alloc_init((Class)PKPhysicalCardOrderActivityEvent);
  id v4 = [(id)objc_opt_class() _propertySettersForPhysicalCard];
  v5 = [v4 allKeys];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1003B86D4;
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

+ (id)_activityEventsWithQuery:(id)a3
{
  id v4 = a3;
  v5 = [a1 _propertySettersForActivityEvent];
  id v6 = objc_alloc_init((Class)NSMutableSet);
  id v7 = [v5 allKeys];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1003B8874;
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

+ (id)_propertySettersForActivityEvent
{
  v4[0] = @"b";
  v4[1] = @"c";
  v5[0] = &stru_10074E3E8;
  v5[1] = &stru_10074E408;
  v2 = +[NSDictionary dictionaryWithObjects:v5 forKeys:v4 count:2];
  return v2;
}

@end