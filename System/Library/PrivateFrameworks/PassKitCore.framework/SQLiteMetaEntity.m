@interface SQLiteMetaEntity
+ (id)_namePredicate:(id)a3;
+ (id)_tableNamePredicate:(id)a3;
+ (id)_typePredicate:(id)a3;
+ (id)anyInDatabase:(id)a3 withType:(id)a4 name:(id)a5;
+ (id)anyInDatabase:(id)a3 withType:(id)a4 tableName:(id)a5;
+ (id)databaseTable;
+ (id)entitesMatchingQuery:(id)a3;
+ (id)queryWithDatabase:(id)a3 type:(id)a4;
+ (id)queryWithDatabase:(id)a3 type:(id)a4 tableName:(id)a5;
+ (id)queryWithDatabase:(id)a3 types:(id)a4 tableName:(id)a5;
- (id)SQL;
- (id)name;
- (id)tableName;
- (id)type;
@end

@implementation SQLiteMetaEntity

+ (id)databaseTable
{
  return @"sqlite_master";
}

+ (id)anyInDatabase:(id)a3 withType:(id)a4 name:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  v10 = [a1 _typePredicate:a4];
  v16[0] = v10;
  v11 = [a1 _namePredicate:v8];

  v16[1] = v11;
  v12 = +[NSArray arrayWithObjects:v16 count:2];

  v13 = +[SQLiteCompoundPredicate predicateMatchingAllPredicates:v12];
  v14 = [a1 anyInDatabase:v9 predicate:v13];

  return v14;
}

+ (id)anyInDatabase:(id)a3 withType:(id)a4 tableName:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  v10 = [a1 _typePredicate:a4];
  v16[0] = v10;
  v11 = [a1 _tableNamePredicate:v8];

  v16[1] = v11;
  v12 = +[NSArray arrayWithObjects:v16 count:2];

  v13 = +[SQLiteCompoundPredicate predicateMatchingAllPredicates:v12];
  v14 = [a1 anyInDatabase:v9 predicate:v13];

  return v14;
}

+ (id)queryWithDatabase:(id)a3 type:(id)a4
{
  id v6 = a3;
  v7 = [a1 _typePredicate:a4];
  id v8 = [a1 queryWithDatabase:v6 predicate:v7];

  return v8;
}

+ (id)queryWithDatabase:(id)a3 type:(id)a4 tableName:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  v10 = [a1 _typePredicate:a4];
  v16[0] = v10;
  v11 = [a1 _tableNamePredicate:v8];

  v16[1] = v11;
  v12 = +[NSArray arrayWithObjects:v16 count:2];

  v13 = +[SQLiteCompoundPredicate predicateMatchingAllPredicates:v12];
  v14 = [a1 queryWithDatabase:v9 predicate:v13];

  return v14;
}

+ (id)queryWithDatabase:(id)a3 types:(id)a4 tableName:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = +[NSMutableArray array];
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v12 = v9;
  id v13 = [v12 countByEnumeratingWithState:&v24 objects:v29 count:16];
  if (v13)
  {
    id v14 = v13;
    uint64_t v15 = *(void *)v25;
    do
    {
      for (i = 0; i != v14; i = (char *)i + 1)
      {
        if (*(void *)v25 != v15) {
          objc_enumerationMutation(v12);
        }
        v17 = objc_msgSend(a1, "_typePredicate:", *(void *)(*((void *)&v24 + 1) + 8 * i), (void)v24);
        [v11 addObject:v17];
      }
      id v14 = [v12 countByEnumeratingWithState:&v24 objects:v29 count:16];
    }
    while (v14);
  }

  v18 = +[SQLiteCompoundPredicate predicateMatchingAnyPredicates:v11];
  v19 = [a1 _tableNamePredicate:v10];
  v28[0] = v18;
  v28[1] = v19;
  v20 = +[NSArray arrayWithObjects:v28 count:2];
  v21 = +[SQLiteCompoundPredicate predicateMatchingAllPredicates:v20];
  v22 = [a1 queryWithDatabase:v8 predicate:v21];

  return v22;
}

+ (id)entitesMatchingQuery:(id)a3
{
  v7 = _NSConcreteStackBlock;
  uint64_t v8 = 3221225472;
  id v9 = sub_100348FAC;
  id v10 = &unk_100730E38;
  id v11 = a3;
  id v12 = objc_alloc_init((Class)NSMutableArray);
  id v3 = v12;
  id v4 = v11;
  [v4 enumeratePersistentIDsUsingBlock:&v7];
  id v5 = objc_msgSend(v3, "copy", v7, v8, v9, v10);

  return v5;
}

- (id)type
{
  return [(SQLiteEntity *)self valueForProperty:@"type"];
}

- (id)name
{
  return [(SQLiteEntity *)self valueForProperty:@"name"];
}

- (id)tableName
{
  return [(SQLiteEntity *)self valueForProperty:@"tbl_name"];
}

- (id)SQL
{
  return [(SQLiteEntity *)self valueForProperty:@"sql"];
}

+ (id)_typePredicate:(id)a3
{
  return +[SQLiteComparisonPredicate predicateWithProperty:@"type" equalToValue:a3];
}

+ (id)_namePredicate:(id)a3
{
  return +[SQLiteComparisonPredicate predicateWithProperty:@"name" equalToValue:a3];
}

+ (id)_tableNamePredicate:(id)a3
{
  return +[SQLiteComparisonPredicate predicateWithProperty:@"tbl_name" equalToValue:a3];
}

@end