@interface AccountEntityOrdering
+ (id)_EntityOrderingsWithPredicate:(id)a3 inDatabase:(id)a4;
+ (id)_anyInDatabase:(id)a3 withContext:(unint64_t)a4 accountPID:(int64_t)a5;
+ (id)_insertAccountEntityOrdering:(id)a3 forAccountPID:(int64_t)a4 inDatabase:(id)a5;
+ (id)_predicateForAccountPID:(int64_t)a3;
+ (id)_predicateForAccountPID:(int64_t)a3 entityType:(unint64_t)a4;
+ (id)_predicateForContext:(unint64_t)a3;
+ (id)_predicateForContext:(unint64_t)a3 accountPID:(int64_t)a4;
+ (id)_propertySettersForAccountEntityOrdering;
+ (id)_propertyValuesForEntityOrdering:(id)a3 accountPID:(int64_t)a4;
+ (id)_queryForPredicate:(id)a3 database:(id)a4;
+ (id)accountEntityOrderingsForAccountPID:(int64_t)a3 entityType:(unint64_t)a4 inDatabase:(id)a5;
+ (id)databaseTable;
+ (void)deleteAccountEntityOrdering:(id)a3 accountPID:(int64_t)a4 inDatabase:(id)a5;
+ (void)deleteAccountEntityOrderingsForAccountPID:(int64_t)a3 entityType:(unint64_t)a4 inDatabase:(id)a5;
+ (void)deleteAccountEntityOrderingsForAccountPID:(int64_t)a3 inDatabase:(id)a4;
+ (void)insertOrUpdateAccountEntityOrdering:(id)a3 accountPID:(int64_t)a4 inDatabase:(id)a5;
+ (void)insertOrUpdateAccountEntityOrderings:(id)a3 accountPID:(int64_t)a4 entityType:(unint64_t)a5 inDatabase:(id)a6;
- (AccountEntityOrdering)initWithAccountEntityOrdering:(id)a3 forAccountPID:(int64_t)a4 inDatabase:(id)a5;
- (id)accountEntityOrdering;
- (void)_updateWithAccountEntityOrdering:(id)a3 accountPID:(int64_t)a4;
@end

@implementation AccountEntityOrdering

+ (id)databaseTable
{
  return @"daikon";
}

- (AccountEntityOrdering)initWithAccountEntityOrdering:(id)a3 forAccountPID:(int64_t)a4 inDatabase:(id)a5
{
  id v8 = a5;
  v9 = +[AccountEntityOrdering _propertyValuesForEntityOrdering:a3 accountPID:a4];
  v10 = [(SQLiteEntity *)self initWithPropertyValues:v9 inDatabase:v8];

  return v10;
}

+ (id)accountEntityOrderingsForAccountPID:(int64_t)a3 entityType:(unint64_t)a4 inDatabase:(id)a5
{
  id v8 = a5;
  v9 = [a1 _predicateForAccountPID:a3 entityType:a4];
  if (v9)
  {
    v10 = [a1 _EntityOrderingsWithPredicate:v9 inDatabase:v8];
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

+ (id)_anyInDatabase:(id)a3 withContext:(unint64_t)a4 accountPID:(int64_t)a5
{
  id v8 = a3;
  v9 = [a1 _predicateForContext:a4 accountPID:a5];
  if (v9)
  {
    v10 = [a1 anyInDatabase:v8 predicate:v9];
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

+ (id)_EntityOrderingsWithPredicate:(id)a3 inDatabase:(id)a4
{
  v5 = [a1 _queryForPredicate:a3 database:a4];
  v6 = [a1 _propertySettersForAccountEntityOrdering];
  v7 = +[NSMutableArray array];
  id v8 = [v6 allKeys];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10048C2E0;
  v13[3] = &unk_10072EAD8;
  id v15 = v7;
  id v16 = a1;
  id v14 = v6;
  id v9 = v7;
  id v10 = v6;
  [v5 enumeratePersistentIDsAndProperties:v8 usingBlock:v13];

  id v11 = [v9 copy];
  return v11;
}

+ (void)insertOrUpdateAccountEntityOrderings:(id)a3 accountPID:(int64_t)a4 entityType:(unint64_t)a5 inDatabase:(id)a6
{
  id v10 = a3;
  id v11 = a6;
  [a1 deleteAccountEntityOrderingsForAccountPID:a4 entityType:a5 inDatabase:v11];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v12 = v10;
  id v13 = [v12 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v13)
  {
    id v14 = v13;
    uint64_t v15 = *(void *)v18;
    do
    {
      id v16 = 0;
      do
      {
        if (*(void *)v18 != v15) {
          objc_enumerationMutation(v12);
        }
        objc_msgSend(a1, "insertOrUpdateAccountEntityOrdering:accountPID:inDatabase:", *(void *)(*((void *)&v17 + 1) + 8 * (void)v16), a4, v11, (void)v17);
        id v16 = (char *)v16 + 1;
      }
      while (v14 != v16);
      id v14 = [v12 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v14);
  }
}

+ (void)insertOrUpdateAccountEntityOrdering:(id)a3 accountPID:(int64_t)a4 inDatabase:(id)a5
{
  id v12 = a3;
  id v8 = a5;
  id v9 = objc_msgSend(a1, "_anyInDatabase:withContext:accountPID:", v8, objc_msgSend(v12, "context"), a4);
  id v10 = v9;
  if (v9) {
    [v9 _updateWithAccountEntityOrdering:v12 accountPID:a4];
  }
  else {
    id v11 = [a1 _insertAccountEntityOrdering:v12 forAccountPID:a4 inDatabase:v8];
  }
}

+ (id)_insertAccountEntityOrdering:(id)a3 forAccountPID:(int64_t)a4 inDatabase:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  id v10 = [objc_alloc((Class)a1) initWithAccountEntityOrdering:v9 forAccountPID:a4 inDatabase:v8];

  return v10;
}

+ (void)deleteAccountEntityOrderingsForAccountPID:(int64_t)a3 entityType:(unint64_t)a4 inDatabase:(id)a5
{
  id v8 = a5;
  id v10 = [a1 _predicateForAccountPID:a3 entityType:a4];
  id v9 = [a1 queryWithDatabase:v8 predicate:v10];

  [v9 deleteAllEntities];
}

+ (void)deleteAccountEntityOrdering:(id)a3 accountPID:(int64_t)a4 inDatabase:(id)a5
{
  id v8 = a5;
  objc_msgSend(a1, "_anyInDatabase:withContext:accountPID:", v8, objc_msgSend(a3, "context"), a4);
  id v9 = (id)objc_claimAutoreleasedReturnValue();

  [v9 deleteFromDatabase];
}

+ (void)deleteAccountEntityOrderingsForAccountPID:(int64_t)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v8 = [a1 _predicateForAccountPID:a3];
  v7 = [a1 queryWithDatabase:v6 predicate:v8];

  [v7 deleteAllEntities];
}

- (void)_updateWithAccountEntityOrdering:(id)a3 accountPID:(int64_t)a4
{
  id v5 = +[AccountEntityOrdering _propertyValuesForEntityOrdering:a3 accountPID:a4];
  [(SQLiteEntity *)self setValuesWithDictionary:v5];
}

+ (id)_predicateForContext:(unint64_t)a3
{
  v3 = +[NSNumber numberWithUnsignedInteger:a3];
  v4 = +[SQLiteComparisonPredicate predicateWithProperty:@"b" equalToValue:v3];

  return v4;
}

+ (id)_predicateForAccountPID:(int64_t)a3
{
  v3 = +[NSNumber numberWithLongLong:a3];
  v4 = +[SQLiteComparisonPredicate predicateWithProperty:@"a" equalToValue:v3];

  return v4;
}

+ (id)_predicateForAccountPID:(int64_t)a3 entityType:(unint64_t)a4
{
  id v5 = [a1 _predicateForAccountPID:a3];
  id v6 = +[NSNumber numberWithUnsignedInteger:a4];
  v7 = +[SQLiteComparisonPredicate predicateWithProperty:@"d" equalToValue:v6];

  id v8 = 0;
  if (v5 && v7)
  {
    v11[0] = v5;
    v11[1] = v7;
    id v9 = +[NSArray arrayWithObjects:v11 count:2];
    id v8 = +[SQLiteCompoundPredicate predicateMatchingAllPredicates:v9];
  }
  return v8;
}

+ (id)_predicateForContext:(unint64_t)a3 accountPID:(int64_t)a4
{
  id v6 = [a1 _predicateForContext:a3];
  uint64_t v7 = [a1 _predicateForAccountPID:a4];
  id v8 = (void *)v7;
  id v9 = 0;
  if (v6 && v7)
  {
    v12[0] = v6;
    v12[1] = v7;
    id v10 = +[NSArray arrayWithObjects:v12 count:2];
    id v9 = +[SQLiteCompoundPredicate predicateMatchingAllPredicates:v10];
  }
  return v9;
}

+ (id)_queryForPredicate:(id)a3 database:(id)a4
{
  return [a1 queryWithDatabase:a4 predicate:a3];
}

+ (id)_propertySettersForAccountEntityOrdering
{
  v4[0] = @"d";
  v4[1] = @"b";
  v5[0] = &stru_100754480;
  v5[1] = &stru_1007544A0;
  v4[2] = @"c";
  v5[2] = &stru_1007544C0;
  v2 = +[NSDictionary dictionaryWithObjects:v5 forKeys:v4 count:3];
  return v2;
}

- (id)accountEntityOrdering
{
  id v3 = objc_alloc_init((Class)PKAccountEntityOrdering);
  v4 = [(id)objc_opt_class() _propertySettersForAccountEntityOrdering];
  id v5 = [v4 allKeys];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  void v11[2] = sub_10048CD1C;
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

+ (id)_propertyValuesForEntityOrdering:(id)a3 accountPID:(int64_t)a4
{
  id v5 = a3;
  id v6 = +[NSMutableDictionary dictionary];
  id v7 = +[NSNumber numberWithLongLong:a4];
  [v6 setObjectOrNull:v7 forKey:@"a"];

  objc_msgSend(v6, "setInteger:forKey:", objc_msgSend(v5, "context"), @"b");
  id v8 = [v5 orderingAsJSONString];
  [v6 setObjectOrNull:v8 forKey:@"c"];

  id v9 = [v5 type];
  [v6 setInteger:v9 forKey:@"d"];
  id v10 = [v6 copy];

  return v10;
}

@end