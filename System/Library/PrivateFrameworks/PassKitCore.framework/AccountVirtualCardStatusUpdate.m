@interface AccountVirtualCardStatusUpdate
+ (id)_predicateForEventPID:(int64_t)a3;
+ (id)_propertySettersForAccountVirtualCardStatusUpdate;
+ (id)databaseTable;
+ (id)insertVirtualCardStatusUpdate:(id)a3 forEventPID:(int64_t)a4 inDatabase:(id)a5;
+ (id)virtualCardStatusUpdatesWithEventPID:(int64_t)a3 inDatabase:(id)a4;
+ (void)deleteVirtualCardStatusUpdatesWithEventPID:(int64_t)a3 inDatabase:(id)a4;
- (BOOL)deleteFromDatabase;
- (id)virtualCardStatusUpdate;
@end

@implementation AccountVirtualCardStatusUpdate

+ (id)virtualCardStatusUpdatesWithEventPID:(int64_t)a3 inDatabase:(id)a4
{
  id v6 = a4;
  v7 = [a1 _predicateForEventPID:a3];
  v8 = [a1 queryWithDatabase:v6 predicate:v7];

  v9 = +[NSMutableSet set];
  CFStringRef v21 = @"pid";
  v10 = +[NSArray arrayWithObjects:&v21 count:1];
  v15 = _NSConcreteStackBlock;
  uint64_t v16 = 3221225472;
  v17 = sub_10012BF70;
  v18 = &unk_10072ED00;
  id v19 = v6;
  id v20 = v9;
  id v11 = v9;
  id v12 = v6;
  [v8 enumeratePersistentIDsAndProperties:v10 usingBlock:&v15];

  id v13 = objc_msgSend(v11, "copy", v15, v16, v17, v18);
  return v13;
}

+ (id)insertVirtualCardStatusUpdate:(id)a3 forEventPID:(int64_t)a4 inDatabase:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v10 = +[NSMutableDictionary dictionary];
  objc_msgSend(v10, "setInteger:forKey:", objc_msgSend(v8, "reason"), @"b");
  id v11 = +[NSNumber numberWithLongLong:a4];
  [v10 setObject:v11 forKey:@"a"];

  id v12 = [objc_alloc((Class)a1) initWithPropertyValues:v10 inDatabase:v9];
  if (v12)
  {
    id v13 = [v8 updatedVirtualCards];
    v14 = +[NSSet setWithArray:v13];
    id v15 = +[VirtualCard insertVirtualCards:forVirtualCardStatusUpdatePID:inDatabase:](VirtualCard, "insertVirtualCards:forVirtualCardStatusUpdatePID:inDatabase:", v14, [v12 persistentID], v9);
  }
  return v12;
}

- (id)virtualCardStatusUpdate
{
  id v3 = objc_alloc_init((Class)PKAccountVirtualCardStatusUpdate);
  v4 = +[AccountVirtualCardStatusUpdate _propertySettersForAccountVirtualCardStatusUpdate];
  v5 = [v4 allKeys];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10012C230;
  v10[3] = &unk_10072DDD8;
  id v11 = v4;
  id v6 = v3;
  id v12 = v6;
  id v13 = self;
  id v7 = v4;
  [(SQLiteEntity *)self getValuesForProperties:v5 withApplier:v10];

  id v8 = v6;
  return v8;
}

+ (void)deleteVirtualCardStatusUpdatesWithEventPID:(int64_t)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v7 = [a1 _predicateForEventPID:a3];
  id v8 = [a1 queryWithDatabase:v6 predicate:v7];

  [v8 deleteAllEntities];
}

- (BOOL)deleteFromDatabase
{
  int64_t v3 = [(SQLiteEntity *)self persistentID];
  v4 = [(SQLiteEntity *)self database];
  +[VirtualCard deleteVirtualCardsForVirtualCardStatusUpdatePID:v3 inDatabase:v4];

  v6.receiver = self;
  v6.super_class = (Class)AccountVirtualCardStatusUpdate;
  return [(SQLiteEntity *)&v6 deleteFromDatabase];
}

+ (id)databaseTable
{
  return @"blueberries";
}

+ (id)_predicateForEventPID:(int64_t)a3
{
  int64_t v3 = +[NSNumber numberWithLongLong:a3];
  v4 = +[SQLiteComparisonPredicate predicateWithProperty:@"a" equalToValue:v3];

  return v4;
}

+ (id)_propertySettersForAccountVirtualCardStatusUpdate
{
  CFStringRef v4 = @"b";
  v5 = &stru_100739280;
  v2 = +[NSDictionary dictionaryWithObjects:&v5 forKeys:&v4 count:1];
  return v2;
}

@end