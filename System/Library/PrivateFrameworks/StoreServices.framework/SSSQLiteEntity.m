@interface SSSQLiteEntity
+ (BOOL)_insertValues:(id)a3 intoTable:(id)a4 withPersistentID:(int64_t)a5 database:(id)a6;
+ (Class)memoryEntityClass;
+ (id)_aggregateValueForProperty:(id)a3 function:(id)a4 predicate:(id)a5 database:(id)a6;
+ (id)anyInDatabase:(id)a3 predicate:(id)a4;
+ (id)copyDatabaseDictionaryToSetClientDictionary:(id)a3;
+ (id)countForProperty:(id)a3 predicate:(id)a4 database:(id)a5;
+ (id)databasePropertyToGetClientProperty:(id)a3;
+ (id)databasePropertyToSetClientProperty:(id)a3;
+ (id)databaseTable;
+ (id)databaseValueForProperty:(id)a3 clientValue:(id)a4;
+ (id)disambiguatedSQLForProperty:(id)a3;
+ (id)foreignDatabaseColumnForProperty:(id)a3;
+ (id)foreignDatabaseTableForProperty:(id)a3;
+ (id)foreignDatabaseTablesToDelete;
+ (id)foreignKeyColumnForTable:(id)a3;
+ (id)joinClauseForProperty:(id)a3;
+ (id)maxValueForProperty:(id)a3 predicate:(id)a4 database:(id)a5;
+ (id)minValueForProperty:(id)a3 predicate:(id)a4 database:(id)a5;
+ (id)queryWithDatabase:(id)a3 predicate:(id)a4;
+ (id)queryWithDatabase:(id)a3 predicate:(id)a4 orderingProperties:(id)a5;
- (BOOL)_deleteRowFromTable:(id)a3 usingColumn:(id)a4;
- (BOOL)deleteFromDatabase;
- (BOOL)existsInDatabase;
- (BOOL)setValue:(id)a3 forProperty:(id)a4;
- (BOOL)setValuesWithDictionary:(id)a3;
- (SSSQLiteDatabase)database;
- (SSSQLiteEntity)initWithPersistentID:(int64_t)a3 inDatabase:(id)a4;
- (SSSQLiteEntity)initWithPropertyValues:(id)a3 inDatabase:(id)a4;
- (id)_copyTableClusteredValuesWithValues:(id)a3;
- (id)copyValuesForClientProperties:(id)a3;
- (id)copyXPCEncodedValuesForClientProperties:(id)a3;
- (id)valueForProperty:(id)a3;
- (int64_t)persistentID;
- (void)getValues:(id *)a3 forProperties:(const void *)a4 count:(unint64_t)a5;
@end

@implementation SSSQLiteEntity

+ (BOOL)_insertValues:(id)a3 intoTable:(id)a4 withPersistentID:(int64_t)a5 database:(id)a6
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  uint64_t v31 = 0;
  v32 = &v31;
  uint64_t v33 = 0x2020000000;
  char v34 = 1;
  v11 = (void *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithString:@"INSERT OR REPLACE INTO "];
  [v11 appendString:a4];
  objc_msgSend(v11, "appendString:", @" (");
  uint64_t v12 = [a1 foreignKeyColumnForTable:a4];
  if (v12) {
    v13 = (__CFString *)v12;
  }
  else {
    v13 = @"ROWID";
  }
  [v11 appendString:v13];
  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  uint64_t v14 = [a3 countByEnumeratingWithState:&v27 objects:v36 count:16];
  if (v14)
  {
    uint64_t v15 = *(void *)v28;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v28 != v15) {
          objc_enumerationMutation(a3);
        }
        uint64_t v17 = *(void *)(*((void *)&v27 + 1) + 8 * i);
        [v11 appendString:@", "];
        [v11 appendString:v17];
      }
      uint64_t v14 = [a3 countByEnumeratingWithState:&v27 objects:v36 count:16];
    }
    while (v14);
  }
  [v11 appendString:@") VALUES (?"];
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  uint64_t v18 = [a3 countByEnumeratingWithState:&v23 objects:v35 count:16];
  if (v18)
  {
    uint64_t v19 = *(void *)v24;
    while (1)
    {
      if (*(void *)v24 != v19) {
        objc_enumerationMutation(a3);
      }
      [v11 appendString:@", ?"];
      if (!--v18)
      {
        uint64_t v18 = [a3 countByEnumeratingWithState:&v23 objects:v35 count:16];
        if (!v18) {
          break;
        }
      }
    }
  }
  [v11 appendString:@";"]);
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __68__SSSQLiteEntity__insertValues_intoTable_withPersistentID_database___block_invoke;
  v22[3] = &unk_1E5BACFC8;
  v22[6] = &v31;
  v22[7] = a5;
  v22[4] = a3;
  v22[5] = a6;
  [a6 prepareStatementForSQL:v11 cache:0 usingBlock:v22];

  char v20 = *((unsigned char *)v32 + 24);
  _Block_object_dispose(&v31, 8);
  return v20;
}

uint64_t __68__SSSQLiteEntity__insertValues_intoTable_withPersistentID_database___block_invoke(uint64_t a1, sqlite3_stmt *a2)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  sqlite3_bind_int64(a2, 1, *(void *)(a1 + 56));
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  v4 = *(void **)(a1 + 32);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
    int v8 = 2;
    do
    {
      uint64_t v9 = 0;
      int v10 = v8;
      do
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        SSSQLiteBindFoundationValueToStatement(a2, v10 + v9, (void *)[*(id *)(a1 + 32) objectForKey:*(void *)(*((void *)&v12 + 1) + 8 * v9)]);
        ++v9;
      }
      while (v6 != v9);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
      int v8 = v10 + v9;
    }
    while (v6);
  }
  uint64_t result = [*(id *)(a1 + 40) statementDidFinishAfterStepping:a2];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = result;
  return result;
}

uint64_t __54__SSSQLiteEntity__copyTableClusteredValuesWithValues___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v4 = (uint64_t)a2;
  uint64_t result = [a2 isEqualToString:@"ROWID"];
  if ((result & 1) == 0)
  {
    uint64_t v7 = [*(id *)(a1 + 32) foreignDatabaseTableForProperty:v4];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v4 = [*(id *)(a1 + 32) foreignDatabaseColumnForProperty:v4];
    }
    else
    {
      uint64_t v8 = *(void *)(a1 + 40);
    }
    id v9 = (id)[*(id *)(a1 + 48) objectForKey:v8];
    if (!v9)
    {
      id v9 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      [*(id *)(a1 + 48) setObject:v9 forKey:v8];
      id v10 = v9;
    }
    return [v9 setObject:a3 forKey:v4];
  }
  return result;
}

+ (id)foreignDatabaseTableForProperty:(id)a3
{
  return 0;
}

uint64_t __52__SSSQLiteEntity_initWithPropertyValues_inDatabase___block_invoke(uint64_t a1)
{
  uint64_t v2 = objc_opt_class();
  v3 = *(void **)(a1 + 40);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __52__SSSQLiteEntity_initWithPropertyValues_inDatabase___block_invoke_2;
  v5[3] = &unk_1E5BACE88;
  v5[4] = v2;
  uint64_t v7 = *(void *)(a1 + 64);
  long long v6 = *(_OWORD *)(a1 + 48);
  [v3 enumerateKeysAndObjectsUsingBlock:v5];
  return *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
}

+ (id)foreignKeyColumnForTable:(id)a3
{
  return 0;
}

uint64_t __50__SSSQLiteEntity__deleteRowFromTable_usingColumn___block_invoke(uint64_t a1, sqlite3_stmt *a2)
{
  sqlite3_bind_int64(a2, 1, *(void *)(*(void *)(a1 + 32) + 16));
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 8) statementDidFinishAfterStepping:a2];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

BOOL __36__SSSQLiteEntity_deleteFromDatabase__block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = objc_msgSend(*(id *)(a1 + 32), "_deleteRowFromTable:usingColumn:", objc_msgSend((id)objc_opt_class(), "databaseTable"), @"ROWID");
  uint64_t v2 = (void *)[(id)objc_opt_class() foreignDatabaseTablesToDelete];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v3 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v11;
LABEL_3:
    uint64_t v6 = 0;
    while (1)
    {
      if (*(void *)v11 != v5) {
        objc_enumerationMutation(v2);
      }
      uint64_t v7 = *(void *)(*((void *)&v10 + 1) + 8 * v6);
      uint64_t v8 = [(id)objc_opt_class() foreignKeyColumnForTable:v7];
      if (v8)
      {
        *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [*(id *)(a1 + 32) _deleteRowFromTable:v7 usingColumn:v8];
        if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)) {
          break;
        }
      }
      if (v4 == ++v6)
      {
        uint64_t v4 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
        if (v4) {
          goto LABEL_3;
        }
        break;
      }
    }
  }
  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)) {
    return 0;
  }
  *(void *)(*(void *)(a1 + 32) + 8) = 0;
  return *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) != 0;
}

- (SSSQLiteEntity)initWithPropertyValues:(id)a3 inDatabase:(id)a4
{
  uint64_t v7 = (void *)[a3 objectForKey:@"ROWID"];
  if (v7)
  {
    uint64_t v8 = [v7 longLongValue];
  }
  else
  {
    CFUUIDRef v9 = CFUUIDCreate(0);
    uint64_t v8 = *(_OWORD *)&CFUUIDGetUUIDBytes(v9);
    CFRelease(v9);
  }
  uint64_t v14 = 0;
  uint64_t v15 = &v14;
  uint64_t v16 = 0x2020000000;
  char v17 = 1;
  id v10 = [(SSSQLiteEntity *)self _copyTableClusteredValuesWithValues:a3];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __52__SSSQLiteEntity_initWithPropertyValues_inDatabase___block_invoke;
  v13[3] = &unk_1E5BACEB0;
  v13[4] = self;
  v13[5] = v10;
  v13[7] = &v14;
  v13[8] = v8;
  v13[6] = a4;
  [a4 performTransactionWithBlock:v13];

  if (!*((unsigned char *)v15 + 24))
  {

    self = 0;
  }
  long long v11 = [(SSSQLiteEntity *)self initWithPersistentID:v8 inDatabase:a4];
  _Block_object_dispose(&v14, 8);
  return v11;
}

- (SSSQLiteEntity)initWithPersistentID:(int64_t)a3 inDatabase:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)SSSQLiteEntity;
  uint64_t result = [(SSSQLiteEntity *)&v7 init];
  if (result)
  {
    result->_database = (SSSQLiteDatabase *)a4;
    result->_persistentID = a3;
  }
  return result;
}

- (id)_copyTableClusteredValuesWithValues:(id)a3
{
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = [v5 databaseTable];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __54__SSSQLiteEntity__copyTableClusteredValuesWithValues___block_invoke;
  v8[3] = &unk_1E5BACFF0;
  v8[4] = v5;
  v8[5] = v6;
  v8[6] = v4;
  [a3 enumerateKeysAndObjectsUsingBlock:v8];
  return v4;
}

- (BOOL)deleteFromDatabase
{
  uint64_t v6 = 0;
  objc_super v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  database = self->_database;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __36__SSSQLiteEntity_deleteFromDatabase__block_invoke;
  v5[3] = &unk_1E5BACF00;
  v5[4] = self;
  void v5[5] = &v6;
  [(SSSQLiteDatabase *)database performTransactionWithBlock:v5];
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)_deleteRowFromTable:(id)a3 usingColumn:(id)a4
{
  uint64_t v9 = 0;
  id v10 = &v9;
  uint64_t v11 = 0x2020000000;
  char v12 = 0;
  uint64_t v5 = objc_msgSend([NSString alloc], "initWithFormat:", @"DELETE FROM %@ WHERE %@ = ?;",
                 a3,
                 a4);
  database = self->_database;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __50__SSSQLiteEntity__deleteRowFromTable_usingColumn___block_invoke;
  v8[3] = &unk_1E5BACE58;
  v8[4] = self;
  v8[5] = &v9;
  [(SSSQLiteDatabase *)database prepareStatementForSQL:v5 cache:1 usingBlock:v8];

  LOBYTE(self) = *((unsigned char *)v10 + 24);
  _Block_object_dispose(&v9, 8);
  return (char)self;
}

+ (id)foreignDatabaseTablesToDelete
{
  return 0;
}

uint64_t __42__SSSQLiteEntity_setValuesWithDictionary___block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)[*(id *)(a1 + 32) _copyTableClusteredValuesWithValues:*(void *)(a1 + 40)];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __42__SSSQLiteEntity_setValuesWithDictionary___block_invoke_2;
  v5[3] = &unk_1E5BACF78;
  long long v6 = *(_OWORD *)(a1 + 48);
  uint64_t v3 = *(void *)(a1 + 64);
  uint64_t v7 = *(void *)(a1 + 32);
  uint64_t v8 = v3;
  [v2 enumerateKeysAndObjectsUsingBlock:v5];

  return *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 64) + 8) + 24);
}

- (int64_t)persistentID
{
  return self->_persistentID;
}

uint64_t __52__SSSQLiteEntity_initWithPropertyValues_inDatabase___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  uint64_t result = [*(id *)(a1 + 32) _insertValues:a3 intoTable:a2 withPersistentID:*(void *)(a1 + 56) database:*(void *)(a1 + 40)];
  if ((result & 1) == 0)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 0;
    *a4 = 1;
  }
  return result;
}

- (BOOL)setValue:(id)a3 forProperty:(id)a4
{
  id v7 = objc_alloc(MEMORY[0x1E4F1C9E8]);
  if (!a3) {
    a3 = (id)[MEMORY[0x1E4F1CA98] null];
  }
  uint64_t v8 = objc_msgSend(v7, "initWithObjectsAndKeys:", a3, a4, 0);
  BOOL v9 = [(SSSQLiteEntity *)self setValuesWithDictionary:v8];

  return v9;
}

- (BOOL)setValuesWithDictionary:(id)a3
{
  uint64_t v10 = 0;
  uint64_t v11 = &v10;
  uint64_t v12 = 0x2020000000;
  char v13 = 1;
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = [v5 databaseTable];
  database = self->_database;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __42__SSSQLiteEntity_setValuesWithDictionary___block_invoke;
  v9[3] = &unk_1E5BACFA0;
  v9[4] = self;
  v9[5] = a3;
  v9[6] = v5;
  v9[7] = v6;
  v9[8] = &v10;
  [(SSSQLiteDatabase *)database performTransactionWithBlock:v9];
  LOBYTE(a3) = *((unsigned char *)v11 + 24);
  _Block_object_dispose(&v10, 8);
  return (char)a3;
}

void __42__SSSQLiteEntity_setValuesWithDictionary___block_invoke_2(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  uint64_t v8 = [*(id *)(a1 + 32) foreignKeyColumnForTable:a2];
  if (v8) {
    BOOL v9 = (__CFString *)v8;
  }
  else {
    BOOL v9 = @"ROWID";
  }
  uint64_t v23 = 0;
  long long v24 = &v23;
  uint64_t v25 = 0x2020000000;
  char v26 = 1;
  if (([a2 isEqualToString:*(void *)(a1 + 40)] & 1) == 0)
  {
    uint64_t v10 = (void *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithString:@"SELECT 1 FROM "];
    [v10 appendString:a2];
    [v10 appendString:@" WHERE "];
    [v10 appendString:v9];
    [v10 appendString:@" =  ? LIMIT 1;"];
    uint64_t v11 = *(void *)(a1 + 48);
    uint64_t v12 = *(void **)(v11 + 8);
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __42__SSSQLiteEntity_setValuesWithDictionary___block_invoke_3;
    v22[3] = &unk_1E5BACE58;
    v22[4] = v11;
    v22[5] = &v23;
    [v12 prepareStatementForSQL:v10 cache:1 usingBlock:v22];
  }
  if (*((unsigned char *)v24 + 24))
  {
    id v13 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v14 = (void *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithString:@"UPDATE "];
    [v14 appendString:a2];
    [v14 appendString:@" SET "];
    v20[0] = 0;
    v20[1] = v20;
    v20[2] = 0x2020000000;
    char v21 = 0;
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __42__SSSQLiteEntity_setValuesWithDictionary___block_invoke_4;
    v19[3] = &unk_1E5BACF50;
    v19[5] = v13;
    v19[6] = v20;
    v19[4] = v14;
    [a3 enumerateKeysAndObjectsUsingBlock:v19];
    [v14 appendString:@" WHERE "];
    [v14 appendString:a2];
    [v14 appendString:@"."];
    [v14 appendString:v9];
    [v14 appendString:@" = ?;"];
    v17[0] = MEMORY[0x1E4F143A8];
    long long v15 = *(_OWORD *)(a1 + 48);
    uint64_t v16 = *(void **)(*(void *)(a1 + 48) + 8);
    v17[1] = 3221225472;
    v17[2] = __42__SSSQLiteEntity_setValuesWithDictionary___block_invoke_5;
    v17[3] = &unk_1E5BACE08;
    v17[4] = v13;
    long long v18 = v15;
    [v16 prepareStatementForSQL:v14 cache:1 usingBlock:v17];

    _Block_object_dispose(v20, 8);
  }
  else
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = [(id)objc_opt_class() _insertValues:a3 intoTable:a2 withPersistentID:*(void *)(*(void *)(a1 + 48) + 16) database:*(void *)(*(void *)(a1 + 48) + 8)];
  }
  *a4 = *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) ^ 1;
  _Block_object_dispose(&v23, 8);
}

+ (id)anyInDatabase:(id)a3 predicate:(id)a4
{
  uint64_t v10 = 0;
  uint64_t v11 = &v10;
  uint64_t v12 = 0x3052000000;
  id v13 = __Block_byref_object_copy__60;
  uint64_t v14 = __Block_byref_object_dispose__60;
  uint64_t v15 = 0;
  uint64_t v6 = (void *)[a1 queryWithDatabase:a3 predicate:a4];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __66__SSSQLiteEntity_SSSQLiteQueryAdditions__anyInDatabase_predicate___block_invoke;
  v9[3] = &unk_1E5BAD1C8;
  v9[5] = a3;
  v9[6] = &v10;
  v9[4] = a1;
  [v6 enumeratePersistentIDsUsingBlock:v9];
  id v7 = (id)v11[5];
  _Block_object_dispose(&v10, 8);
  return v7;
}

+ (id)queryWithDatabase:(id)a3 predicate:(id)a4 orderingProperties:(id)a5
{
  BOOL v9 = objc_alloc_init(SSSQLiteQueryDescriptor);
  [(SSSQLiteQueryDescriptor *)v9 setEntityClass:a1];
  -[SSSQLiteQueryDescriptor setMemoryEntityClass:](v9, "setMemoryEntityClass:", [a1 memoryEntityClass]);
  [(SSSQLiteQueryDescriptor *)v9 setOrderingProperties:a5];
  [(SSSQLiteQueryDescriptor *)v9 setPredicate:a4];
  uint64_t v10 = [[SSSQLiteQuery alloc] initWithDatabase:a3 descriptor:v9];

  return v10;
}

+ (Class)memoryEntityClass
{
  return (Class)objc_opt_class();
}

+ (id)queryWithDatabase:(id)a3 predicate:(id)a4
{
  return (id)[a1 queryWithDatabase:a3 predicate:a4 orderingProperties:0];
}

+ (id)disambiguatedSQLForProperty:(id)a3
{
  if (objc_msgSend(a1, "joinClauseForProperty:")) {
    return a3;
  }
  else {
    return (id)[NSString stringWithFormat:@"%@.%@", objc_msgSend(a1, "databaseTable"), a3];
  }
}

+ (id)joinClauseForProperty:(id)a3
{
  return 0;
}

uint64_t __42__SSSQLiteEntity_setValuesWithDictionary___block_invoke_5(void *a1, sqlite3_stmt *a2)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v4 = (void *)a1[4];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v14;
    uint64_t v8 = 1;
    do
    {
      uint64_t v9 = 0;
      uint64_t v10 = v8;
      do
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v4);
        }
        SSSQLiteBindFoundationValueToStatement(a2, v10 + v9, *(void **)(*((void *)&v13 + 1) + 8 * v9));
        ++v9;
      }
      while (v6 != v9);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
      uint64_t v8 = v10 + v9;
    }
    while (v6);
    int v11 = v10 + v9;
  }
  else
  {
    int v11 = 1;
  }
  sqlite3_bind_int64(a2, v11, *(void *)(a1[5] + 16));
  uint64_t result = [*(id *)(a1[5] + 8) statementDidFinishAfterStepping:a2];
  *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = result;
  return result;
}

uint64_t __66__SSSQLiteEntity_SSSQLiteQueryAdditions__anyInDatabase_predicate___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  uint64_t result = [objc_alloc(*(Class *)(a1 + 32)) initWithPersistentID:a2 inDatabase:*(void *)(a1 + 40)];
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = result;
  *a4 = 1;
  return result;
}

uint64_t __42__SSSQLiteEntity_setValuesWithDictionary___block_invoke_4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)) {
    [*(id *)(a1 + 32) appendString:@", "];
  }
  [*(id *)(a1 + 32) appendString:a2];
  [*(id *)(a1 + 32) appendString:@" = ?"];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
  uint64_t v6 = *(void **)(a1 + 40);
  return [v6 addObject:a3];
}

+ (id)copyDatabaseDictionaryToSetClientDictionary:(id)a3
{
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __62__SSSQLiteEntity_copyDatabaseDictionaryToSetClientDictionary___block_invoke;
  v7[3] = &unk_1E5BACED8;
  v7[4] = a1;
  v7[5] = v5;
  [a3 enumerateKeysAndObjectsUsingBlock:v7];
  return v5;
}

void __62__SSSQLiteEntity_copyDatabaseDictionaryToSetClientDictionary___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = [*(id *)(a1 + 32) databasePropertyToSetClientProperty:a2];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void **)(a1 + 40);
    uint64_t v9 = [*(id *)(a1 + 32) databaseValueForProperty:v6 clientValue:a3];
    [v8 setObject:v9 forKey:v7];
  }
  else
  {
    id v10 = +[SSLogConfig sharedStoreServicesConfig];
    if (!v10) {
      id v10 = +[SSLogConfig sharedConfig];
    }
    int v11 = [v10 shouldLog];
    if ([v10 shouldLogToDisk]) {
      int v12 = v11 | 2;
    }
    else {
      int v12 = v11;
    }
    if (!os_log_type_enabled((os_log_t)[v10 OSLogObject], OS_LOG_TYPE_INFO)) {
      v12 &= 2u;
    }
    if (v12)
    {
      int v23 = 138412546;
      uint64_t v24 = objc_opt_class();
      __int16 v25 = 2112;
      uint64_t v26 = a2;
      LODWORD(v22) = 22;
      uint64_t v13 = _os_log_send_and_compose_impl();
      if (v13)
      {
        long long v14 = (void *)v13;
        uint64_t v15 = objc_msgSend(NSString, "stringWithCString:encoding:", v13, 4, &v23, v22);
        free(v14);
        SSFileLog(v10, @"%@", v16, v17, v18, v19, v20, v21, v15);
      }
    }
  }
}

+ (id)databasePropertyToGetClientProperty:(id)a3
{
  return a3;
}

+ (id)databasePropertyToSetClientProperty:(id)a3
{
  return a3;
}

+ (id)databaseValueForProperty:(id)a3 clientValue:(id)a4
{
  return a4;
}

+ (id)databaseTable
{
  return 0;
}

+ (id)foreignDatabaseColumnForProperty:(id)a3
{
  return 0;
}

- (id)copyValuesForClientProperties:(id)a3
{
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  uint64_t v6 = [a3 count];
  uint64_t v7 = malloc_type_malloc(8 * v6, 0x80040B8603338uLL);
  uint64_t v8 = malloc_type_malloc(8 * v6, 0x80040B8603338uLL);
  if (v6 < 1)
  {
    [(SSSQLiteEntity *)self getValues:v7 forProperties:v8 count:v6];
    if (v8) {
LABEL_10:
    }
      free(v8);
  }
  else
  {
    for (uint64_t i = 0; i != v6; ++i)
      *((void *)v8 + i) = objc_msgSend((id)objc_opt_class(), "databasePropertyToGetClientProperty:", objc_msgSend(a3, "objectAtIndex:", i));
    [(SSSQLiteEntity *)self getValues:v7 forProperties:v8 count:v6];
    for (uint64_t j = 0; j != v6; ++j)
    {
      uint64_t v11 = v7[j];
      if (v11 && *((void *)v8 + j)) {
        objc_msgSend(v5, "setObject:forKey:", v11, objc_msgSend(a3, "objectAtIndex:", j));
      }
    }
    if (v8) {
      goto LABEL_10;
    }
  }
  if (v7) {
    free(v7);
  }
  return v5;
}

- (id)copyXPCEncodedValuesForClientProperties:(id)a3
{
  xpc_object_t v5 = xpc_array_create(0, 0);
  uint64_t v6 = [a3 count];
  uint64_t v7 = malloc_type_malloc(8 * v6, 0x80040B8603338uLL);
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = (__CFString **)malloc_type_malloc(8 * v6, 0x80040B8603338uLL);
    if (v9)
    {
      id v10 = v9;
      if (v6)
      {
        uint64_t v11 = 0;
        while (1)
        {
          uint64_t v12 = objc_msgSend((id)objc_opt_class(), "databasePropertyToGetClientProperty:", objc_msgSend(a3, "objectAtIndex:", v11));
          v8[v11] = v12;
          if (!v12) {
            break;
          }
          if (v6 == ++v11)
          {
            [(SSSQLiteEntity *)self getValues:v10 forProperties:v8 count:v6];
            uint64_t v13 = v10;
            do
            {
              long long v14 = *v13;
              if (!*v13) {
                long long v14 = (__CFString *)[MEMORY[0x1E4F1CA98] null];
              }
              SSXPCArraySetCFObject(v5, 0xFFFFFFFFFFFFFFFFLL, v14);
              ++v13;
              --v6;
            }
            while (v6);
            break;
          }
        }
      }
      else
      {
        [(SSSQLiteEntity *)self getValues:v9 forProperties:v8 count:0];
      }
      free(v10);
    }
    free(v8);
  }
  return v5;
}

- (BOOL)existsInDatabase
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x2020000000;
  char v10 = 0;
  uint64_t v3 = objc_msgSend([NSString alloc], "initWithFormat:", @"SELECT 1 FROM %@ WHERE %@ = ? LIMIT 1;",
                 [(id)objc_opt_class() databaseTable],
                 @"ROWID");
  database = self->_database;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __34__SSSQLiteEntity_existsInDatabase__block_invoke;
  v6[3] = &unk_1E5BACE58;
  v6[4] = self;
  v6[5] = &v7;
  [(SSSQLiteDatabase *)database prepareStatementForSQL:v3 cache:1 usingBlock:v6];

  LOBYTE(self) = *((unsigned char *)v8 + 24);
  _Block_object_dispose(&v7, 8);
  return (char)self;
}

uint64_t __34__SSSQLiteEntity_existsInDatabase__block_invoke(uint64_t a1, sqlite3_stmt *a2)
{
  sqlite3_bind_int64(a2, 1, *(void *)(*(void *)(a1 + 32) + 16));
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 8) statementHasRowAfterStepping:a2];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (void)getValues:(id *)a3 forProperties:(const void *)a4 count:(unint64_t)a5
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  if (a5 == 1 && [(id)*a4 isEqualToString:@"ROWID"])
  {
    *a3 = (id)[NSNumber numberWithLongLong:self->_persistentID];
  }
  else
  {
    uint64_t v9 = objc_opt_class();
    uint64_t v21 = [v9 databaseTable];
    char v10 = (void *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithString:@"SELECT "];
    id v11 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    if (a5)
    {
      uint64_t v12 = 0;
      do
      {
        a3[v12] = 0;
        uint64_t v13 = objc_msgSend(v9, "disambiguatedSQLForProperty:", a4[v12], v21);
        if (v12) {
          [v10 appendString:@", "];
        }
        [v10 appendString:v13];
        uint64_t v14 = [v9 joinClauseForProperty:a4[v12]];
        if (v14) {
          [v11 addObject:v14];
        }
        ++v12;
      }
      while (a5 != v12);
    }
    objc_msgSend(v10, "appendString:", @" FROM ", v21);
    [v10 appendString:v22];
    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    uint64_t v15 = [v11 countByEnumeratingWithState:&v24 objects:v28 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v25;
      do
      {
        for (uint64_t i = 0; i != v16; ++i)
        {
          if (*(void *)v25 != v17) {
            objc_enumerationMutation(v11);
          }
          uint64_t v19 = *(void *)(*((void *)&v24 + 1) + 8 * i);
          [v10 appendString:@" "];
          [v10 appendString:v19];
        }
        uint64_t v16 = [v11 countByEnumeratingWithState:&v24 objects:v28 count:16];
      }
      while (v16);
    }
    [v10 appendString:@" WHERE "];
    [v10 appendString:v22];
    [v10 appendString:@".ROWID = ?;"];
    database = self->_database;
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __48__SSSQLiteEntity_getValues_forProperties_count___block_invoke;
    v23[3] = &unk_1E5BACF28;
    v23[4] = self;
    v23[5] = a5;
    v23[6] = a3;
    [(SSSQLiteDatabase *)database prepareStatementForSQL:v10 cache:1 usingBlock:v23];
  }
}

id __48__SSSQLiteEntity_getValues_forProperties_count___block_invoke(void *a1, sqlite3_stmt *a2)
{
  sqlite3_bind_int64(a2, 1, *(void *)(a1[4] + 16));
  id result = (id)[*(id *)(a1[4] + 8) statementHasRowAfterStepping:a2];
  if (result && a1[5])
  {
    unint64_t v5 = 0;
    do
    {
      id result = (id)SSSQLiteCopyFoundationValueForStatementColumn(a2, v5);
      *(void *)(a1[6] + 8 * v5++) = result;
    }
    while (v5 < a1[5]);
  }
  return result;
}

uint64_t __42__SSSQLiteEntity_setValuesWithDictionary___block_invoke_3(uint64_t a1, sqlite3_stmt *a2)
{
  sqlite3_bind_int64(a2, 1, *(void *)(*(void *)(a1 + 32) + 16));
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 8) statementHasRowAfterStepping:a2];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (id)valueForProperty:(id)a3
{
  id v4 = 0;
  id v5 = a3;
  [(SSSQLiteEntity *)self getValues:&v4 forProperties:&v5 count:1];
  return v4;
}

- (SSSQLiteDatabase)database
{
  return self->_database;
}

+ (id)_aggregateValueForProperty:(id)a3 function:(id)a4 predicate:(id)a5 database:(id)a6
{
  v23[1] = *MEMORY[0x1E4F143B8];
  uint64_t v17 = 0;
  uint64_t v18 = &v17;
  uint64_t v19 = 0x3052000000;
  uint64_t v20 = __Block_byref_object_copy__60;
  uint64_t v21 = __Block_byref_object_dispose__60;
  uint64_t v22 = 0;
  id v11 = objc_alloc_init(SSSQLiteQueryDescriptor);
  [(SSSQLiteQueryDescriptor *)v11 setEntityClass:a1];
  [(SSSQLiteQueryDescriptor *)v11 setPredicate:a5];
  uint64_t v12 = (void *)[[NSString alloc] initWithFormat:@"%@(%@)", a4, objc_msgSend(a1, "disambiguatedSQLForProperty:", a3)];
  v23[0] = a3;
  id v13 = -[SSSQLiteQueryDescriptor _newSelectSQLWithProperties:count:columns:](v11, "_newSelectSQLWithProperties:count:columns:", v23, 1, [MEMORY[0x1E4F1C978] arrayWithObject:v12]);
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __97__SSSQLiteEntity_SSSQLiteQueryAdditions___aggregateValueForProperty_function_predicate_database___block_invoke;
  v16[3] = &unk_1E5BACE08;
  v16[4] = v11;
  v16[5] = a6;
  v16[6] = &v17;
  [a6 prepareStatementForSQL:v13 cache:1 usingBlock:v16];

  id v14 = (id)v18[5];
  _Block_object_dispose(&v17, 8);
  return v14;
}

uint64_t __97__SSSQLiteEntity_SSSQLiteQueryAdditions___aggregateValueForProperty_function_predicate_database___block_invoke(uint64_t a1, sqlite3_stmt *a2)
{
  int v5 = 1;
  objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "predicate"), "bindToStatement:bindingIndex:", a2, &v5);
  uint64_t result = [*(id *)(a1 + 40) statementHasRowAfterStepping:a2];
  if (result)
  {
    uint64_t result = SSSQLiteCopyFoundationValueForStatementColumn(a2, 0);
    *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = result;
  }
  return result;
}

+ (id)countForProperty:(id)a3 predicate:(id)a4 database:(id)a5
{
  return (id)[a1 _aggregateValueForProperty:a3 function:@"COUNT" predicate:a4 database:a5];
}

+ (id)maxValueForProperty:(id)a3 predicate:(id)a4 database:(id)a5
{
  return (id)[a1 _aggregateValueForProperty:a3 function:@"MAX" predicate:a4 database:a5];
}

+ (id)minValueForProperty:(id)a3 predicate:(id)a4 database:(id)a5
{
  return (id)[a1 _aggregateValueForProperty:a3 function:@"MIN" predicate:a4 database:a5];
}

@end