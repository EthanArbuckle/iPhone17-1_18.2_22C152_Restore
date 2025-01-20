@interface SQLiteQuery
- (BOOL)createTemporaryTableWithName:(id)a3 properties:(id)a4;
- (BOOL)deleteAllEntities;
- (BOOL)exists;
- (SQLiteDatabase)database;
- (SQLiteQuery)initWithDatabase:(id)a3 descriptor:(id)a4;
- (SQLiteQueryDescriptor)queryDescriptor;
- (id)_newSelectSQLOnProperties:(id)a3;
- (id)_newSelectSQLWithProperties:(id)a3;
- (id)copyEntityIdentifiers;
- (id)copySelectSQLWithProperties:(id)a3;
- (int64_t)countOfEntities;
- (void)bindToSelectStatement:(sqlite3_stmt *)a3 bindingIndex:(int *)a4;
- (void)enumeratePersistentIDsAndProperties:(id)a3 usingBlock:(id)a4;
- (void)enumeratePersistentIDsUsingBlock:(id)a3;
- (void)enumerateProperties:(id)a3 usingBlock:(id)a4;
@end

@implementation SQLiteQuery

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_descriptor, 0);
  objc_storeStrong((id *)&self->_database, 0);
}

- (BOOL)exists
{
  v2 = self;
  id v3 = [(SQLiteQuery *)self _newSelectSQLWithProperties:0];
  id v4 = [objc_alloc((Class)NSString) initWithFormat:@"SELECT EXISTS (%@)", v3];
  uint64_t v8 = 0;
  v9 = &v8;
  uint64_t v10 = 0x2020000000;
  char v11 = 0;
  uint64_t database = (uint64_t)v2->_database;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100017B24;
  v7[3] = &unk_100732630;
  v7[4] = v2;
  v7[5] = &v8;
  sub_100012DC8(database, v4, v7);
  LOBYTE(v2) = *((unsigned char *)v9 + 24);
  _Block_object_dispose(&v8, 8);

  return (char)v2;
}

- (SQLiteQuery)initWithDatabase:(id)a3 descriptor:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)SQLiteQuery;
  v9 = [(SQLiteQuery *)&v14 init];
  uint64_t v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_database, a3);
    char v11 = (SQLiteQueryDescriptor *)[v8 copy];
    descriptor = v10->_descriptor;
    v10->_descriptor = v11;
  }
  return v10;
}

- (void)enumeratePersistentIDsAndProperties:(id)a3 usingBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(SQLiteQuery *)self _newSelectSQLWithProperties:v6];
  uint64_t database = self->_database;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100013C84;
  v12[3] = &unk_100733980;
  v12[4] = self;
  id v13 = v6;
  id v14 = v7;
  id v10 = v7;
  id v11 = v6;
  sub_100012DC8((uint64_t)database, v8, v12);
}

- (void)enumeratePersistentIDsUsingBlock:(id)a3
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100017204;
  v5[3] = &unk_100733958;
  id v6 = a3;
  id v4 = v6;
  [(SQLiteQuery *)self enumeratePersistentIDsAndProperties:0 usingBlock:v5];
}

- (id)_newSelectSQLWithProperties:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init((Class)NSMutableArray);
  id v6 = [(SQLiteQueryDescriptor *)self->_descriptor entityClass];
  id v7 = [(objc_class *)v6 disambiguatedSQLForProperty:@"ROWID"];
  [v5 addObject:v7];

  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v8 = v4;
  id v9 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v17;
    do
    {
      v12 = 0;
      do
      {
        if (*(void *)v17 != v11) {
          objc_enumerationMutation(v8);
        }
        id v13 = -[objc_class disambiguatedSQLForProperty:](v6, "disambiguatedSQLForProperty:", *(void *)(*((void *)&v16 + 1) + 8 * (void)v12), (void)v16);
        [v5 addObject:v13];

        v12 = (char *)v12 + 1;
      }
      while (v10 != v12);
      id v10 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v10);
  }

  id v14 = [(SQLiteQueryDescriptor *)self->_descriptor _newSelectSQLWithProperties:v8 columns:v5];
  return v14;
}

- (void)bindToSelectStatement:(sqlite3_stmt *)a3 bindingIndex:(int *)a4
{
  id v7 = [(SQLiteQueryDescriptor *)self->_descriptor predicate];
  [v7 bindToStatement:a3 bindingIndex:a4];

  int64_t v8 = [(SQLiteQueryDescriptor *)self->_descriptor limitCount];
  if (v8)
  {
    sqlite3_bind_int(a3, *a4, v8);
    ++*a4;
  }
}

- (SQLiteDatabase)database
{
  return self->_database;
}

- (void)enumerateProperties:(id)a3 usingBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(SQLiteQuery *)self _newSelectSQLOnProperties:v6];
  uint64_t database = self->_database;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100018F8C;
  v12[3] = &unk_100733980;
  v12[4] = self;
  id v13 = v6;
  id v14 = v7;
  id v10 = v7;
  id v11 = v6;
  sub_100012DC8((uint64_t)database, v8, v12);
}

- (id)_newSelectSQLOnProperties:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init((Class)NSMutableArray);
  id v6 = [(SQLiteQueryDescriptor *)self->_descriptor entityClass];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v7 = v4;
  id v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v16;
    do
    {
      id v11 = 0;
      do
      {
        if (*(void *)v16 != v10) {
          objc_enumerationMutation(v7);
        }
        v12 = -[objc_class disambiguatedSQLForProperty:](v6, "disambiguatedSQLForProperty:", *(void *)(*((void *)&v15 + 1) + 8 * (void)v11), (void)v15);
        [v5 addObject:v12];

        id v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      id v9 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v9);
  }

  id v13 = [(SQLiteQueryDescriptor *)self->_descriptor _newSelectSQLWithProperties:v7 columns:v5];
  return v13;
}

- (id)copyEntityIdentifiers
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1000AE59C;
  v5[3] = &unk_100731020;
  id v3 = objc_alloc_init((Class)NSMutableOrderedSet);
  id v6 = v3;
  [(SQLiteQuery *)self enumeratePersistentIDsUsingBlock:v5];

  return v3;
}

- (id)copySelectSQLWithProperties:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init((Class)NSMutableArray);
  id v6 = [(SQLiteQueryDescriptor *)self->_descriptor entityClass];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v7 = v4;
  id v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v16;
    do
    {
      id v11 = 0;
      do
      {
        if (*(void *)v16 != v10) {
          objc_enumerationMutation(v7);
        }
        v12 = -[objc_class disambiguatedSQLForProperty:](v6, "disambiguatedSQLForProperty:", *(void *)(*((void *)&v15 + 1) + 8 * (void)v11), (void)v15);
        [v5 addObject:v12];

        id v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      id v9 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v9);
  }

  id v13 = [(SQLiteQueryDescriptor *)self->_descriptor _newSelectSQLWithProperties:v7 columns:v5];
  return v13;
}

- (int64_t)countOfEntities
{
  id v3 = [(SQLiteQuery *)self _newSelectSQLWithProperties:0];
  id v4 = [objc_alloc((Class)NSString) initWithFormat:@"SELECT COUNT(*) FROM (%@)", v3];
  uint64_t v9 = 0;
  uint64_t v10 = &v9;
  uint64_t v11 = 0x2020000000;
  uint64_t v12 = 0;
  uint64_t database = self->_database;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000AE860;
  v8[3] = &unk_100732630;
  v8[4] = self;
  v8[5] = &v9;
  sub_100012DC8((uint64_t)database, v4, v8);
  int64_t v6 = v10[3];
  _Block_object_dispose(&v9, 8);

  return v6;
}

- (BOOL)createTemporaryTableWithName:(id)a3 properties:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [objc_alloc((Class)NSMutableString) initWithString:@"CREATE TEMPORARY TABLE "];
  v21 = v6;
  [v8 appendString:v6];
  [v8 appendString:@" AS "];
  id v9 = [(SQLiteQueryDescriptor *)self->_descriptor copy];
  [v9 setOrderingDirections:0];
  [v9 setOrderingProperties:0];
  id v10 = objc_alloc_init((Class)NSMutableArray);
  uint64_t v11 = [(SQLiteQueryDescriptor *)self->_descriptor entityClass];
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id v12 = v7;
  id v13 = [v12 countByEnumeratingWithState:&v29 objects:v33 count:16];
  if (v13)
  {
    uint64_t v14 = *(void *)v30;
    do
    {
      for (i = 0; i != v13; i = (char *)i + 1)
      {
        if (*(void *)v30 != v14) {
          objc_enumerationMutation(v12);
        }
        long long v16 = [(objc_class *)v11 disambiguatedSQLForProperty:*(void *)(*((void *)&v29 + 1) + 8 * i)];
        [v10 addObject:v16];
      }
      id v13 = [v12 countByEnumeratingWithState:&v29 objects:v33 count:16];
    }
    while (v13);
  }

  id v17 = [v9 _newSelectSQLWithProperties:v12 columns:v10];
  [v8 appendString:v17];
  [v8 appendString:@";"];
  uint64_t v25 = 0;
  v26 = &v25;
  uint64_t v27 = 0x2020000000;
  char v28 = 0;
  uint64_t database = self->_database;
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_1000AEB8C;
  v22[3] = &unk_100732630;
  id v19 = v9;
  id v23 = v19;
  v24 = &v25;
  sub_100012DC8((uint64_t)database, v8, v22);
  LOBYTE(database) = *((unsigned char *)v26 + 24) != 0;

  _Block_object_dispose(&v25, 8);
  return (char)database;
}

- (BOOL)deleteAllEntities
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 1;
  uint64_t database = self->_database;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1000AECCC;
  v5[3] = &unk_100732608;
  void v5[4] = self;
  v5[5] = &v6;
  sub_10000817C((uint64_t)database, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (SQLiteQueryDescriptor)queryDescriptor
{
  id v2 = [(SQLiteQueryDescriptor *)self->_descriptor copy];
  return (SQLiteQueryDescriptor *)v2;
}

@end