@interface SSSQLiteQuery
- (BOOL)createTemporaryTableWithName:(id)a3 properties:(const void *)a4 count:(unint64_t)a5;
- (BOOL)deleteAllEntities;
- (SSSQLiteDatabase)database;
- (SSSQLiteQuery)initWithDatabase:(id)a3 descriptor:(id)a4;
- (SSSQLiteQueryDescriptor)queryDescriptor;
- (id)_newSelectSQLWithProperties:(const void *)a3 count:(unint64_t)a4;
- (id)copyEntityIdentifiers;
- (id)copySelectSQLWithProperties:(const void *)a3 count:(unint64_t)a4;
- (int64_t)countOfEntities;
- (void)bindToSelectStatement:(sqlite3_stmt *)a3 bindingIndex:(int *)a4;
- (void)dealloc;
- (void)enumerateMemoryEntitiesUsingBlock:(id)a3;
- (void)enumerateMemoryEntitiesWithProperties:(id)a3 usingBlock:(id)a4;
- (void)enumeratePersistentIDsAndProperties:(const void *)a3 count:(unint64_t)a4 usingBlock:(id)a5;
- (void)enumeratePersistentIDsUsingBlock:(id)a3;
@end

@implementation SSSQLiteQuery

void __34__SSSQLiteQuery_deleteAllEntities__block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  id v6 = (id)[objc_alloc(*(Class *)(a1 + 32)) initWithPersistentID:a2 inDatabase:*(void *)(*(void *)(a1 + 40) + 8)];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [v6 deleteFromDatabase];
  *a4 = *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) ^ 1;
}

uint64_t __34__SSSQLiteQuery_deleteAllEntities__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 16) entityClass];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __34__SSSQLiteQuery_deleteAllEntities__block_invoke_2;
  v4[3] = &unk_1E5BAD0D8;
  v4[4] = v2;
  long long v5 = *(_OWORD *)(a1 + 32);
  [(id)v5 enumeratePersistentIDsUsingBlock:v4];
  return *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)SSSQLiteQuery;
  [(SSSQLiteQuery *)&v3 dealloc];
}

- (SSSQLiteQuery)initWithDatabase:(id)a3 descriptor:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)SSSQLiteQuery;
  id v6 = [(SSSQLiteQuery *)&v8 init];
  if (v6)
  {
    v6->_database = (SSSQLiteDatabase *)a3;
    v6->_descriptor = (SSSQLiteQueryDescriptor *)[a4 copy];
  }
  return v6;
}

- (void)enumeratePersistentIDsUsingBlock:(id)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __50__SSSQLiteQuery_enumeratePersistentIDsUsingBlock___block_invoke;
  v3[3] = &unk_1E5BAD178;
  v3[4] = a3;
  [(SSSQLiteQuery *)self enumeratePersistentIDsAndProperties:0 count:0 usingBlock:v3];
}

- (void)enumeratePersistentIDsAndProperties:(const void *)a3 count:(unint64_t)a4 usingBlock:(id)a5
{
  id v8 = -[SSSQLiteQuery _newSelectSQLWithProperties:count:](self, "_newSelectSQLWithProperties:count:", a3);
  database = self->_database;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __70__SSSQLiteQuery_enumeratePersistentIDsAndProperties_count_usingBlock___block_invoke;
  v10[3] = &unk_1E5BAD1A0;
  v10[5] = a5;
  v10[6] = a4;
  v10[4] = self;
  [(SSSQLiteDatabase *)database prepareStatementForSQL:v8 cache:0 usingBlock:v10];
}

- (id)_newSelectSQLWithProperties:(const void *)a3 count:(unint64_t)a4
{
  id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v8 = [(SSSQLiteQueryDescriptor *)self->_descriptor entityClass];
  objc_msgSend(v7, "addObject:", -[objc_class disambiguatedSQLForProperty:](v8, "disambiguatedSQLForProperty:", @"ROWID"));
  if (a4)
  {
    v9 = a3;
    unint64_t v10 = a4;
    do
    {
      uint64_t v11 = (uint64_t)*v9++;
      objc_msgSend(v7, "addObject:", -[objc_class disambiguatedSQLForProperty:](v8, "disambiguatedSQLForProperty:", v11));
      --v10;
    }
    while (v10);
  }
  id v12 = [(SSSQLiteQueryDescriptor *)self->_descriptor _newSelectSQLWithProperties:a3 count:a4 columns:v7];

  return v12;
}

- (id)copySelectSQLWithProperties:(const void *)a3 count:(unint64_t)a4
{
  id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v8 = [(SSSQLiteQueryDescriptor *)self->_descriptor entityClass];
  if (a4)
  {
    v9 = v8;
    unint64_t v10 = a3;
    unint64_t v11 = a4;
    do
    {
      uint64_t v12 = (uint64_t)*v10++;
      objc_msgSend(v7, "addObject:", -[objc_class disambiguatedSQLForProperty:](v9, "disambiguatedSQLForProperty:", v12));
      --v11;
    }
    while (v11);
  }
  id v13 = [(SSSQLiteQueryDescriptor *)self->_descriptor _newSelectSQLWithProperties:a3 count:a4 columns:v7];

  return v13;
}

void __70__SSSQLiteQuery_enumeratePersistentIDsAndProperties_count_usingBlock___block_invoke(uint64_t a1, sqlite3_stmt *a2)
{
  int v13 = 1;
  [*(id *)(a1 + 32) bindToSelectStatement:a2 bindingIndex:&v13];
  size_t v4 = *(void *)(a1 + 48);
  if (v4) {
    long long v5 = (id *)malloc_type_calloc(v4, 8uLL, 0x80040B8603338uLL);
  }
  else {
    long long v5 = 0;
  }
  uint64_t v6 = 0;
  do
  {
    if (![*(id *)(*(void *)(a1 + 32) + 8) statementHasRowAfterStepping:a2]) {
      break;
    }
    id v7 = (void *)MEMORY[0x1A6267F60]();
    if (v5 && *(void *)(a1 + 48))
    {
      unint64_t v8 = 0;
      do
      {

        v5[v8] = (id)SSSQLiteCopyFoundationValueForStatementColumn(a2, (int)v8 + 1);
        ++v8;
      }
      while (v8 < *(void *)(a1 + 48));
    }
    unsigned __int8 v12 = 0;
    uint64_t v9 = *(void *)(a1 + 40);
    sqlite3_int64 v10 = sqlite3_column_int64(a2, 0);
    (*(void (**)(uint64_t, sqlite3_int64, id *, uint64_t, unsigned __int8 *))(v9 + 16))(v9, v10, v5, v6++, &v12);
    LODWORD(v9) = v12;
  }
  while (!v9);
  if (v5)
  {
    if (*(void *)(a1 + 48))
    {
      unint64_t v11 = 0;
      do

      while (v11 < *(void *)(a1 + 48));
    }
    free(v5);
  }
}

uint64_t __50__SSSQLiteQuery_enumeratePersistentIDsUsingBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)bindToSelectStatement:(sqlite3_stmt *)a3 bindingIndex:(int *)a4
{
  [(SSSQLitePredicate *)[(SSSQLiteQueryDescriptor *)self->_descriptor predicate] bindToStatement:a3 bindingIndex:a4];
  int64_t v7 = [(SSSQLiteQueryDescriptor *)self->_descriptor limitCount];
  if (v7)
  {
    sqlite3_bind_int(a3, *a4, v7);
    ++*a4;
  }
}

- (BOOL)deleteAllEntities
{
  uint64_t v6 = 0;
  int64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 1;
  database = self->_database;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __34__SSSQLiteQuery_deleteAllEntities__block_invoke;
  v5[3] = &unk_1E5BAD100;
  v5[4] = self;
  v5[5] = &v6;
  [(SSSQLiteDatabase *)database performTransactionWithBlock:v5];
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (id)copyEntityIdentifiers
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA70]);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __38__SSSQLiteQuery_copyEntityIdentifiers__block_invoke;
  v5[3] = &unk_1E5BAD060;
  v5[4] = v3;
  [(SSSQLiteQuery *)self enumeratePersistentIDsUsingBlock:v5];
  return v3;
}

void __38__SSSQLiteQuery_copyEntityIdentifiers__block_invoke(uint64_t a1, uint64_t a2)
{
  id v3 = (id)[objc_alloc(NSNumber) initWithLongLong:a2];
  [*(id *)(a1 + 32) addObject:v3];
}

- (int64_t)countOfEntities
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x2020000000;
  uint64_t v8 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __32__SSSQLiteQuery_countOfEntities__block_invoke;
  v4[3] = &unk_1E5BAD088;
  v4[4] = &v5;
  [(SSSQLiteQuery *)self enumeratePersistentIDsUsingBlock:v4];
  int64_t v2 = v6[3];
  _Block_object_dispose(&v5, 8);
  return v2;
}

uint64_t __32__SSSQLiteQuery_countOfEntities__block_invoke(uint64_t result)
{
  return result;
}

- (BOOL)createTemporaryTableWithName:(id)a3 properties:(const void *)a4 count:(unint64_t)a5
{
  char v9 = (void *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithString:@"CREATE TEMPORARY TABLE "];
  [v9 appendString:a3];
  [v9 appendString:@" AS "];
  sqlite3_int64 v10 = (void *)[(SSSQLiteQueryDescriptor *)self->_descriptor copy];
  [v10 setOrderingDirections:0];
  [v10 setOrderingProperties:0];
  id v11 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  unsigned __int8 v12 = [(SSSQLiteQueryDescriptor *)self->_descriptor entityClass];
  if (a5)
  {
    int v13 = v12;
    v14 = a4;
    unint64_t v15 = a5;
    do
    {
      uint64_t v16 = (uint64_t)*v14++;
      objc_msgSend(v11, "addObject:", -[objc_class disambiguatedSQLForProperty:](v13, "disambiguatedSQLForProperty:", v16));
      --v15;
    }
    while (v15);
  }
  v17 = (void *)[v10 _newSelectSQLWithProperties:a4 count:a5 columns:v11];
  [v9 appendString:v17];

  [v9 appendString:@";"];
  uint64_t v22 = 0;
  v23 = &v22;
  uint64_t v24 = 0x2020000000;
  char v25 = 0;
  database = self->_database;
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __63__SSSQLiteQuery_createTemporaryTableWithName_properties_count___block_invoke;
  v21[3] = &unk_1E5BAD0B0;
  v21[5] = self;
  v21[6] = &v22;
  v21[4] = v10;
  [(SSSQLiteDatabase *)database prepareStatementForSQL:v9 cache:0 usingBlock:v21];

  char v19 = *((unsigned char *)v23 + 24);
  _Block_object_dispose(&v22, 8);
  return v19;
}

uint64_t __63__SSSQLiteQuery_createTemporaryTableWithName_properties_count___block_invoke(uint64_t a1, uint64_t a2)
{
  int v5 = 1;
  objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "predicate"), "bindToStatement:bindingIndex:", a2, &v5);
  uint64_t result = [*(id *)(*(void *)(a1 + 40) + 8) statementDidFinishAfterStepping:a2];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + ++*(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) = result;
  return result;
}

- (SSSQLiteDatabase)database
{
  int64_t v2 = self->_database;
  return v2;
}

- (void)enumerateMemoryEntitiesUsingBlock:(id)a3
{
  int v5 = [(SSSQLiteQueryDescriptor *)self->_descriptor memoryEntityClass];
  if (!v5) {
    int v5 = (objc_class *)objc_opt_class();
  }
  uint64_t v6 = [(objc_class *)v5 defaultProperties];
  [(SSSQLiteQuery *)self enumerateMemoryEntitiesWithProperties:v6 usingBlock:a3];
}

- (void)enumerateMemoryEntitiesWithProperties:(id)a3 usingBlock:(id)a4
{
  uint64_t v7 = [(SSSQLiteQueryDescriptor *)self->_descriptor memoryEntityClass];
  if (!v7) {
    uint64_t v7 = (objc_class *)objc_opt_class();
  }
  uint64_t v8 = [a3 count];
  if (v8)
  {
    uint64_t v9 = v8;
    sqlite3_int64 v10 = malloc_type_malloc(8 * v8, 0x80040B8603338uLL);
    if (v10)
    {
      id v11 = v10;
      objc_msgSend(a3, "getObjects:range:", v10, 0, v9);
      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3221225472;
      v12[2] = __66__SSSQLiteQuery_enumerateMemoryEntitiesWithProperties_usingBlock___block_invoke_2;
      v12[3] = &unk_1E5BAD150;
      v12[4] = v7;
      v12[5] = a3;
      v12[6] = a4;
      v12[7] = v9;
      [(SSSQLiteQuery *)self enumeratePersistentIDsAndProperties:v11 count:v9 usingBlock:v12];
      free(v11);
    }
  }
  else
  {
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __66__SSSQLiteQuery_enumerateMemoryEntitiesWithProperties_usingBlock___block_invoke;
    v13[3] = &unk_1E5BAD128;
    v13[4] = v7;
    v13[5] = a4;
    [(SSSQLiteQuery *)self enumeratePersistentIDsUsingBlock:v13];
  }
}

void __66__SSSQLiteQuery_enumerateMemoryEntitiesWithProperties_usingBlock___block_invoke(uint64_t a1, uint64_t a2)
{
  id v4 = objc_alloc_init(*(Class *)(a1 + 32));
  [v4 setDatabaseID:a2];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __66__SSSQLiteQuery_enumerateMemoryEntitiesWithProperties_usingBlock___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v9 = objc_alloc_init(*(Class *)(a1 + 32));
  [v9 setDatabaseID:a2];
  uint64_t v6 = *(void *)(a1 + 56);
  if (v6 >= 1)
  {
    for (uint64_t i = 0; i < v6; ++i)
    {
      uint64_t v8 = *(void *)(a3 + 8 * i);
      if (v8)
      {
        objc_msgSend(v9, "setValue:forProperty:", v8, objc_msgSend(*(id *)(a1 + 40), "objectAtIndex:", i));
        uint64_t v6 = *(void *)(a1 + 56);
      }
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (SSSQLiteQueryDescriptor)queryDescriptor
{
  int64_t v2 = (void *)[(SSSQLiteQueryDescriptor *)self->_descriptor copy];
  return (SSSQLiteQueryDescriptor *)v2;
}

@end