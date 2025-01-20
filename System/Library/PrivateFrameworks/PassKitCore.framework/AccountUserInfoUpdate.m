@interface AccountUserInfoUpdate
+ (id)_predicateForEventPID:(int64_t)a3;
+ (id)_propertySettersForUserInfoUpdate;
+ (id)databaseTable;
+ (id)insertUserInfoUpdate:(id)a3 forEventPID:(int64_t)a4 inDatabase:(id)a5;
+ (id)userInfoUpdatesWithEventPID:(int64_t)a3 inDatabase:(id)a4;
+ (void)deleteUserInfoUpdatePID:(int64_t)a3 inDatabase:(id)a4;
- (id)userInfoUpdate;
@end

@implementation AccountUserInfoUpdate

+ (id)userInfoUpdatesWithEventPID:(int64_t)a3 inDatabase:(id)a4
{
  id v6 = a4;
  v7 = [a1 _predicateForEventPID:a3];
  v8 = [a1 queryWithDatabase:v6 predicate:v7];

  v9 = +[NSMutableSet set];
  CFStringRef v19 = @"pid";
  v10 = +[NSArray arrayWithObjects:&v19 count:1];
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_10045D510;
  v16[3] = &unk_10072ED00;
  id v17 = v6;
  id v11 = v9;
  id v18 = v11;
  id v12 = v6;
  [v8 enumeratePersistentIDsAndProperties:v10 usingBlock:v16];

  v13 = v18;
  id v14 = v11;

  return v14;
}

+ (id)insertUserInfoUpdate:(id)a3 forEventPID:(int64_t)a4 inDatabase:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  v10 = +[NSMutableDictionary dictionary];
  id v11 = +[NSNumber numberWithLongLong:a4];
  [v10 setObject:v11 forKey:@"a"];

  id v12 = [v9 updatedDate];

  v13 = (void *)_SQLValueForDate();
  [v10 setObjectOrNull:v13 forKey:@"b"];

  id v14 = [objc_alloc((Class)a1) initWithPropertyValues:v10 inDatabase:v8];
  return v14;
}

- (id)userInfoUpdate
{
  id v3 = objc_alloc_init((Class)PKAccountUserInfoUpdate);
  v4 = +[AccountUserInfoUpdate _propertySettersForUserInfoUpdate];
  v5 = [v4 allKeys];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10045D784;
  v11[3] = &unk_10072EDD0;
  id v12 = v4;
  id v6 = v3;
  id v13 = v6;
  id v7 = v4;
  [(SQLiteEntity *)self getValuesForProperties:v5 withApplier:v11];

  id v8 = v13;
  id v9 = v6;

  return v9;
}

+ (id)_predicateForEventPID:(int64_t)a3
{
  id v3 = +[NSNumber numberWithLongLong:a3];
  v4 = +[SQLiteComparisonPredicate predicateWithProperty:@"a" equalToValue:v3];

  return v4;
}

+ (void)deleteUserInfoUpdatePID:(int64_t)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v7 = [a1 _predicateForEventPID:a3];
  id v8 = [a1 queryWithDatabase:v6 predicate:v7];

  [v8 deleteAllEntities];
}

+ (id)databaseTable
{
  return @"peaches";
}

+ (id)_propertySettersForUserInfoUpdate
{
  CFStringRef v4 = @"b";
  v5 = &stru_100752D20;
  v2 = +[NSDictionary dictionaryWithObjects:&v5 forKeys:&v4 count:1];
  return v2;
}

@end