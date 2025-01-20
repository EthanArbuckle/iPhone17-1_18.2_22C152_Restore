@interface SQLiteEntity
+ (BOOL)existsInDatabase:(id)a3 predicate:(id)a4;
+ (id)_aggregateValueForProperty:(id)a3 function:(id)a4 predicate:(id)a5 database:(id)a6;
+ (id)anyInDatabase:(id)a3 predicate:(id)a4;
+ (id)associationPropertyForEntityClass:(Class)a3;
+ (id)copyDatabaseDictionaryToSetClientDictionary:(id)a3;
+ (id)databasePropertyToGetClientProperty:(id)a3;
+ (id)databasePropertyToSetClientProperty:(id)a3;
+ (id)databaseTable;
+ (id)databaseValueForProperty:(id)a3 clientValue:(id)a4;
+ (id)disambiguatedSQLForProperty:(id)a3;
+ (id)foreignDatabaseColumnForProperty:(id)a3;
+ (id)foreignDatabaseTableForProperty:(id)a3;
+ (id)foreignDatabaseTablesToDelete;
+ (id)foreignKeyColumnForTable:(id)a3;
+ (id)maxValueForProperty:(id)a3 predicate:(id)a4 database:(id)a5;
+ (id)minValueForProperty:(id)a3 predicate:(id)a4 database:(id)a5;
+ (id)queryWithDatabase:(id)a3 predicate:(id)a4;
+ (id)queryWithDatabase:(id)a3 predicate:(id)a4 orderingProperties:(id)a5;
+ (id)queryWithDatabase:(id)a3 predicate:(id)a4 orderingProperties:(id)a5 orderingDirections:(id)a6;
+ (id)queryWithDatabase:(id)a3 predicate:(id)a4 orderingProperties:(id)a5 orderingDirections:(id)a6 limit:(int64_t)a7;
+ (id)queryWithDatabase:(id)a3 predicate:(id)a4 orderingProperties:(id)a5 orderingDirections:(id)a6 limit:(int64_t)a7 groupingProperties:(id)a8;
+ (id)queryWithDatabase:(id)a3 predicate:(id)a4 orderingProperties:(id)a5 orderingDirections:(id)a6 limit:(int64_t)a7 groupingProperties:(id)a8 returnsDistinctEntities:(BOOL)a9;
+ (id)sumForProperty:(id)a3 predicate:(id)a4 database:(id)a5;
+ (int64_t)countDistinctInDatabase:(id)a3 predicate:(id)a4;
+ (int64_t)countInDatabase:(id)a3 predicate:(id)a4;
+ (void)applyPropertySetters:(id)a3 toObject:(id)a4 withProperties:(id)a5 values:(const void *)a6;
- (BOOL)deleteFromDatabase;
- (BOOL)existsInDatabase;
- (BOOL)setValue:(id)a3 forProperty:(id)a4;
- (BOOL)setValuesWithDictionary:(id)a3;
- (SQLiteDatabase)database;
- (SQLiteEntity)init;
- (SQLiteEntity)initWithPersistentID:(int64_t)a3 inDatabase:(id)a4;
- (SQLiteEntity)initWithPropertyValues:(id)a3 inDatabase:(id)a4;
- (id)valueForExternalProperty:(id)a3;
- (id)valueForProperty:(id)a3;
- (int64_t)persistentID;
- (void)getValuesForProperties:(id)a3 withApplier:(id)a4;
@end

@implementation SQLiteEntity

+ (BOOL)existsInDatabase:(id)a3 predicate:(id)a4
{
  v4 = [a1 queryWithDatabase:a3 predicate:a4];
  unsigned __int8 v5 = [v4 exists];

  return v5;
}

+ (id)anyInDatabase:(id)a3 predicate:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v16 = 0;
  v17 = &v16;
  uint64_t v18 = 0x3032000000;
  v19 = sub_10002081C;
  v20 = sub_100020F00;
  id v21 = 0;
  v8 = [a1 queryWithDatabase:v6 predicate:v7];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1000170EC;
  v12[3] = &unk_1007339A8;
  v14 = &v16;
  id v15 = a1;
  id v9 = v6;
  id v13 = v9;
  [v8 enumeratePersistentIDsUsingBlock:v12];
  id v10 = (id)v17[5];

  _Block_object_dispose(&v16, 8);
  return v10;
}

+ (id)queryWithDatabase:(id)a3 predicate:(id)a4 orderingProperties:(id)a5 orderingDirections:(id)a6 limit:(int64_t)a7 groupingProperties:(id)a8
{
  LOBYTE(v9) = 0;
  return [a1 queryWithDatabase:a3 predicate:a4 orderingProperties:a5 orderingDirections:a6 limit:a7 groupingProperties:a8 returnsDistinctEntities:v9];
}

+ (id)queryWithDatabase:(id)a3 predicate:(id)a4 orderingProperties:(id)a5 orderingDirections:(id)a6 limit:(int64_t)a7 groupingProperties:(id)a8 returnsDistinctEntities:(BOOL)a9
{
  id v15 = a8;
  id v16 = a6;
  id v17 = a5;
  id v18 = a4;
  id v19 = a3;
  v20 = objc_alloc_init(SQLiteQueryDescriptor);
  [(SQLiteQueryDescriptor *)v20 setEntityClass:a1];
  [(SQLiteQueryDescriptor *)v20 setOrderingProperties:v17];

  [(SQLiteQueryDescriptor *)v20 setOrderingDirections:v16];
  [(SQLiteQueryDescriptor *)v20 setPredicate:v18];

  [(SQLiteQueryDescriptor *)v20 setLimitCount:a7];
  [(SQLiteQueryDescriptor *)v20 setGroupingProperties:v15];

  [(SQLiteQueryDescriptor *)v20 setReturnsDistinctEntities:a9];
  id v21 = [[SQLiteQuery alloc] initWithDatabase:v19 descriptor:v20];

  return v21;
}

+ (id)queryWithDatabase:(id)a3 predicate:(id)a4 orderingProperties:(id)a5 orderingDirections:(id)a6 limit:(int64_t)a7
{
  return [a1 queryWithDatabase:a3 predicate:a4 orderingProperties:a5 orderingDirections:a6 limit:a7 groupingProperties:0];
}

+ (id)queryWithDatabase:(id)a3 predicate:(id)a4 orderingProperties:(id)a5 orderingDirections:(id)a6
{
  return [a1 queryWithDatabase:a3 predicate:a4 orderingProperties:a5 orderingDirections:a6 limit:0];
}

+ (id)queryWithDatabase:(id)a3 predicate:(id)a4 orderingProperties:(id)a5
{
  return [a1 queryWithDatabase:a3 predicate:a4 orderingProperties:a5 orderingDirections:0];
}

+ (id)queryWithDatabase:(id)a3 predicate:(id)a4
{
  return [a1 queryWithDatabase:a3 predicate:a4 orderingProperties:0];
}

+ (id)disambiguatedSQLForProperty:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init((Class)NSMutableSet);
  [a1 addJoinClausesForProperty:v4 toJoins:v5];
  if ([v5 count])
  {
    id v6 = v4;
  }
  else
  {
    id v7 = objc_alloc((Class)NSString);
    v8 = [a1 databaseTable];
    id v6 = [v7 initWithFormat:@"%@.%@", v8, v4];
  }
  return v6;
}

+ (void)applyPropertySetters:(id)a3 toObject:(id)a4 withProperties:(id)a5 values:(const void *)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v12 = [v11 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v12)
  {
    id v13 = v12;
    uint64_t v14 = 0;
    uint64_t v15 = *(void *)v19;
    do
    {
      id v16 = 0;
      do
      {
        if (*(void *)v19 != v15) {
          objc_enumerationMutation(v11);
        }
        id v17 = (void (**)(id, id, void))[v9 objectForKey:*(void *)(*((void *)&v18 + 1) + 8 * (void)v16)];
        if (v17) {
          v17[2](v17, v10, *(&a6[v14] + (void)v16));
        }
        id v16 = (char *)v16 + 1;
      }
      while (v13 != v16);
      id v13 = [v11 countByEnumeratingWithState:&v18 objects:v22 count:16];
      v14 += (uint64_t)v16;
    }
    while (v13);
  }
}

- (id)valueForProperty:(id)a3
{
  id v9 = a3;
  id v4 = a3;
  id v5 = +[NSArray arrayWithObjects:&v9 count:1];
  id v6 = sub_100012E88((uint64_t)self, v5);

  id v7 = objc_msgSend(v6, "objectForKeyedSubscript:", v4, v9);

  return v7;
}

- (void)getValuesForProperties:(id)a3 withApplier:(id)a4
{
  id v12 = a3;
  id v6 = (void (**)(id, id, void *))a4;
  id v7 = [v12 count];
  if (v7)
  {
    size_t v8 = (size_t)v7;
    id v9 = sub_100012E88((uint64_t)self, v12);
    id v10 = malloc_type_calloc(v8, 8uLL, 0x80040B8603338uLL);
    for (uint64_t i = 0; i != v8; ++i)
      v10[i] = objc_msgSend(v9, "objectForKeyedSubscript:", objc_msgSend(v12, "objectAtIndexedSubscript:", i));
    v6[2](v6, v12, v10);
    free(v10);
  }
}

- (SQLiteEntity)initWithPersistentID:(int64_t)a3 inDatabase:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)SQLiteEntity;
  result = [(SQLiteEntity *)&v7 init];
  if (result)
  {
    result->_database = (SQLiteDatabase *)a4;
    result->_persistentID = a3;
  }
  return result;
}

- (int64_t)persistentID
{
  return self->_persistentID;
}

- (SQLiteDatabase)database
{
  return self->_database;
}

- (SQLiteEntity)init
{
  return 0;
}

- (SQLiteEntity)initWithPropertyValues:(id)a3 inDatabase:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  size_t v8 = [v6 objectForKey:@"ROWID"];
  id v9 = v8;
  if (v8)
  {
    id v10 = [v8 longLongValue];
  }
  else
  {
    CFUUIDRef v11 = CFUUIDCreate(0);
    id v10 = (id)*(_OWORD *)&CFUUIDGetUUIDBytes(v11);
    CFRelease(v11);
  }
  uint64_t v24 = 0;
  v25 = &v24;
  uint64_t v26 = 0x2020000000;
  char v27 = 1;
  id v16 = _NSConcreteStackBlock;
  uint64_t v17 = 3221225472;
  long long v18 = sub_100085658;
  long long v19 = &unk_1007325B8;
  id v12 = sub_10008555C(self, v6);
  id v20 = v12;
  id v23 = v10;
  id v13 = v7;
  id v21 = v13;
  v22 = &v24;
  sub_10000817C((uint64_t)v13, &v16);
  if (*((unsigned char *)v25 + 24))
  {
    self = -[SQLiteEntity initWithPersistentID:inDatabase:](self, "initWithPersistentID:inDatabase:", v10, v13, v16, v17, v18, v19, v20);
    uint64_t v14 = self;
  }
  else
  {
    uint64_t v14 = 0;
  }

  _Block_object_dispose(&v24, 8);
  return v14;
}

+ (id)copyDatabaseDictionaryToSetClientDictionary:(id)a3
{
  id v4 = a3;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100085CB8;
  v7[3] = &unk_1007325E0;
  id v9 = a1;
  id v5 = objc_alloc_init((Class)NSMutableDictionary);
  id v8 = v5;
  [v4 enumerateKeysAndObjectsUsingBlock:v7];

  return v5;
}

+ (id)databasePropertyToGetClientProperty:(id)a3
{
  id v3 = a3;
  return v3;
}

+ (id)databasePropertyToSetClientProperty:(id)a3
{
  id v3 = a3;
  return v3;
}

+ (id)associationPropertyForEntityClass:(Class)a3
{
  return 0;
}

+ (id)databaseValueForProperty:(id)a3 clientValue:(id)a4
{
  id v4 = a4;
  return v4;
}

+ (id)databaseTable
{
  return 0;
}

+ (id)foreignDatabaseColumnForProperty:(id)a3
{
  return 0;
}

+ (id)foreignDatabaseTableForProperty:(id)a3
{
  return 0;
}

+ (id)foreignDatabaseTablesToDelete
{
  return 0;
}

+ (id)foreignKeyColumnForTable:(id)a3
{
  return 0;
}

- (BOOL)deleteFromDatabase
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  database = self->_database;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100085FA0;
  v5[3] = &unk_100732608;
  v5[4] = self;
  v5[5] = &v6;
  sub_10000817C((uint64_t)database, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)existsInDatabase
{
  uint64_t v9 = 0;
  id v10 = &v9;
  uint64_t v11 = 0x2020000000;
  char v12 = 0;
  id v3 = objc_alloc((Class)NSString);
  id v4 = [(id)objc_opt_class() databaseTable];
  id v5 = [v3 initWithFormat:@"SELECT 1 FROM %@ WHERE %@ = ? LIMIT 1;", v4, @"ROWID"];

  database = self->_database;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000863B8;
  v8[3] = &unk_100732630;
  v8[4] = self;
  v8[5] = &v9;
  sub_1000128B8((uint64_t)database, v5, 1, v8);
  LOBYTE(self) = *((unsigned char *)v10 + 24);

  _Block_object_dispose(&v9, 8);
  return (char)self;
}

- (BOOL)setValue:(id)a3 forProperty:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_alloc((Class)NSDictionary);
  uint64_t v9 = v8;
  if (v6)
  {
    id v10 = objc_msgSend(v8, "initWithObjectsAndKeys:", v6, v7, 0);
  }
  else
  {
    uint64_t v11 = +[NSNull null];
    id v10 = objc_msgSend(v9, "initWithObjectsAndKeys:", v11, v7, 0);
  }
  BOOL v12 = [(SQLiteEntity *)self setValuesWithDictionary:v10];

  return v12;
}

- (BOOL)setValuesWithDictionary:(id)a3
{
  id v4 = a3;
  uint64_t v16 = 0;
  uint64_t v17 = &v16;
  uint64_t v18 = 0x2020000000;
  char v19 = 1;
  id v5 = objc_opt_class();
  id v6 = [v5 databaseTable];
  database = self->_database;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100086614;
  v11[3] = &unk_100732730;
  v11[4] = self;
  id v8 = v4;
  id v12 = v8;
  uint64_t v15 = v5;
  id v9 = v6;
  id v13 = v9;
  uint64_t v14 = &v16;
  sub_10000817C((uint64_t)database, v11);
  LOBYTE(v5) = *((unsigned char *)v17 + 24);

  _Block_object_dispose(&v16, 8);
  return (char)v5;
}

- (id)valueForExternalProperty:(id)a3
{
  return 0;
}

+ (int64_t)countInDatabase:(id)a3 predicate:(id)a4
{
  id v4 = [a1 queryWithDatabase:a3 predicate:a4];
  id v5 = [v4 countOfEntities];

  return (int64_t)v5;
}

+ (int64_t)countDistinctInDatabase:(id)a3 predicate:(id)a4
{
  LOBYTE(v7) = 1;
  id v4 = [a1 queryWithDatabase:a3 predicate:a4 orderingProperties:0 orderingDirections:0 limit:0 groupingProperties:0 returnsDistinctEntities:v7];
  id v5 = [v4 countOfEntities];

  return (int64_t)v5;
}

+ (id)_aggregateValueForProperty:(id)a3 function:(id)a4 predicate:(id)a5 database:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  uint64_t v27 = 0;
  v28 = &v27;
  uint64_t v29 = 0x3032000000;
  v30 = sub_10002081C;
  v31 = sub_100020F00;
  id v32 = 0;
  uint64_t v14 = objc_alloc_init(SQLiteQueryDescriptor);
  [(SQLiteQueryDescriptor *)v14 setEntityClass:a1];
  [(SQLiteQueryDescriptor *)v14 setPredicate:v12];
  id v15 = objc_alloc((Class)NSString);
  uint64_t v16 = [a1 disambiguatedSQLForProperty:v10];
  id v17 = [v15 initWithFormat:@"%@(%@)", v11, v16];

  uint64_t v18 = +[NSArray arrayWithObject:v10];
  char v19 = +[NSArray arrayWithObject:v17];
  id v20 = [(SQLiteQueryDescriptor *)v14 _newSelectSQLWithProperties:v18 columns:v19];

  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_1000AF10C;
  v24[3] = &unk_100732630;
  id v21 = v14;
  v25 = v21;
  uint64_t v26 = &v27;
  sub_100012DC8((uint64_t)v13, v20, v24);
  id v22 = (id)v28[5];

  _Block_object_dispose(&v27, 8);
  return v22;
}

+ (id)maxValueForProperty:(id)a3 predicate:(id)a4 database:(id)a5
{
  return _[a1 _aggregateValueForProperty:a3 function:@"MAX" predicate:a4 database:a5];
}

+ (id)minValueForProperty:(id)a3 predicate:(id)a4 database:(id)a5
{
  return _[a1 _aggregateValueForProperty:a3 function:@"MIN" predicate:a4 database:a5];
}

+ (id)sumForProperty:(id)a3 predicate:(id)a4 database:(id)a5
{
  return _[a1 _aggregateValueForProperty:a3 function:@"SUM" predicate:a4 database:a5];
}

@end