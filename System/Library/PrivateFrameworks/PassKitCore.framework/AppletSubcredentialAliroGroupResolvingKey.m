@interface AppletSubcredentialAliroGroupResolvingKey
+ (id)_aliroGroupResolvingKeysInDatabase:(id)a3 withPredicate:(id)a4;
+ (id)_predicateForAppletSubcredentialPID:(int64_t)a3;
+ (id)aliroGroupResolvingKeysInDatabase:(id)a3 forAppletSubcredentialPID:(int64_t)a4;
+ (id)databaseTable;
+ (id)insertAliroGroupResolvingKeys:(id)a3 withAppletSubcredential:(id)a4 inDatabase:(id)a5;
+ (void)deleteEntitiesInDatabase:(id)a3 forAppletSubcredentialPID:(int64_t)a4;
- (AppletSubcredentialAliroGroupResolvingKey)initWithData:(id)a3 forAppletSubcredentialPID:(int64_t)a4 database:(id)a5;
@end

@implementation AppletSubcredentialAliroGroupResolvingKey

+ (id)databaseTable
{
  return @"whitney_agrk";
}

+ (id)aliroGroupResolvingKeysInDatabase:(id)a3 forAppletSubcredentialPID:(int64_t)a4
{
  id v6 = a3;
  v7 = [a1 _predicateForAppletSubcredentialPID:a4];
  v8 = [a1 _aliroGroupResolvingKeysInDatabase:v6 withPredicate:v7];

  return v8;
}

+ (id)_aliroGroupResolvingKeysInDatabase:(id)a3 withPredicate:(id)a4
{
  if (a4)
  {
    v4 = objc_msgSend(a1, "queryWithDatabase:predicate:", a3);
    id v5 = objc_alloc_init((Class)NSMutableSet);
    CFStringRef v11 = @"data";
    id v6 = +[NSArray arrayWithObjects:&v11 count:1];
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_1003A30B0;
    v10[3] = &unk_100731258;
    v10[4] = v5;
    [v4 enumeratePersistentIDsAndProperties:v6 usingBlock:v10];

    if ([v5 count]) {
      v7 = v5;
    }
    else {
      v7 = 0;
    }
    id v8 = v7;
  }
  else
  {
    id v8 = 0;
  }
  return v8;
}

+ (void)deleteEntitiesInDatabase:(id)a3 forAppletSubcredentialPID:(int64_t)a4
{
  id v6 = a3;
  id v8 = [a1 _predicateForAppletSubcredentialPID:a4];
  v7 = [a1 queryWithDatabase:v6 predicate:v8];

  [v7 deleteAllEntities];
}

+ (id)insertAliroGroupResolvingKeys:(id)a3 withAppletSubcredential:(id)a4 inDatabase:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = [a4 persistentID];
  id v11 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", objc_msgSend(v8, "count"));
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v12 = v8;
  id v13 = [v12 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v13)
  {
    id v14 = v13;
    uint64_t v15 = *(void *)v24;
    do
    {
      v16 = 0;
      do
      {
        if (*(void *)v24 != v15) {
          objc_enumerationMutation(v12);
        }
        uint64_t v17 = *(void *)(*((void *)&v23 + 1) + 8 * (void)v16);
        id v18 = objc_alloc((Class)a1);
        id v19 = objc_msgSend(v18, "initWithData:forAppletSubcredentialPID:database:", v17, v10, v9, (void)v23);
        [v11 safelyAddObject:v19];

        v16 = (char *)v16 + 1;
      }
      while (v14 != v16);
      id v14 = [v12 countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v14);
  }

  if ([v11 count]) {
    v20 = v11;
  }
  else {
    v20 = 0;
  }
  id v21 = v20;

  return v21;
}

- (AppletSubcredentialAliroGroupResolvingKey)initWithData:(id)a3 forAppletSubcredentialPID:(int64_t)a4 database:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  id v10 = objc_alloc_init((Class)NSMutableDictionary);
  id v11 = +[NSNull null];
  id v12 = +[NSNumber numberWithLongLong:a4];
  [v10 setObject:v12 forKeyedSubscript:@"applet_subcredential_pid"];

  if (v9) {
    id v13 = v9;
  }
  else {
    id v13 = v11;
  }
  [v10 setObject:v13 forKeyedSubscript:@"data"];

  id v14 = [(SQLiteEntity *)self initWithPropertyValues:v10 inDatabase:v8];
  return v14;
}

+ (id)_predicateForAppletSubcredentialPID:(int64_t)a3
{
  v3 = +[NSNumber numberWithLongLong:a3];
  v4 = +[SQLiteComparisonPredicate predicateWithProperty:@"applet_subcredential_pid" equalToValue:v3];

  return v4;
}

@end