@interface PPSSQLiteQuery
+ (id)queryWithDatabase:(id)a3 entity:(id)a4 predicate:(id)a5;
+ (id)queryWithDatabase:(id)a3 entity:(id)a4 predicate:(id)a5 groupByProperties:(id)a6 orderByProperties:(id)a7 orderByDirections:(id)a8 limitCount:(unint64_t)a9 offsetCount:(unint64_t)a10;
- (BOOL)enumerateProperties:(id)a3 error:(id *)a4 enumerationHandler:(id)a5;
- (PPSSQLiteDatabase)database;
- (PPSSQLiteQuery)initWithDatabase:(id)a3 descriptor:(id)a4;
- (PPSSQLiteQueryDescriptor)descriptor;
- (id)columnNamesForProperties:(id)a3;
- (id)selectSQLWithProperties:(id)a3;
- (void)bindToSelectStatement:(sqlite3_stmt *)a3 bindingIndex:(int *)a4;
@end

@implementation PPSSQLiteQuery

- (PPSSQLiteQuery)initWithDatabase:(id)a3 descriptor:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)PPSSQLiteQuery;
  v9 = [(PPSSQLiteQuery *)&v14 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_database, a3);
    uint64_t v11 = [v8 copy];
    descriptor = v10->_descriptor;
    v10->_descriptor = (PPSSQLiteQueryDescriptor *)v11;
  }
  return v10;
}

- (void)bindToSelectStatement:(sqlite3_stmt *)a3 bindingIndex:(int *)a4
{
  id v7 = [(PPSSQLiteQuery *)self descriptor];
  id v8 = [v7 predicate];
  [v8 bindToStatement:a3 bindingIndex:a4];

  v9 = [(PPSSQLiteQuery *)self descriptor];
  unint64_t v10 = [v9 limitCount];

  if (v10 >> 31) {
    [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF498], @"bindToSelectStatement called with limit count %ld, greater than maximum allowed limit count (%d)", v10, 0x7FFFFFFFLL format];
  }
  uint64_t v11 = [(PPSSQLiteQuery *)self descriptor];
  unint64_t v12 = [v11 offsetCount];

  if (v12 >> 31) {
    [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF498], @"bindToSelectStatement called with offset count %ld, greater than maximum allowed offset count (%d)", v12, 0x7FFFFFFFLL format];
  }
  if (v10)
  {
    sqlite3_bind_int(a3, *a4, v10);
    ++*a4;
  }
  if (v12)
  {
    sqlite3_bind_int(a3, *a4, v12);
    ++*a4;
  }
}

- (id)columnNamesForProperties:(id)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v16 = a3;
  v4 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v16, "count"));
  v5 = [(PPSSQLiteQuery *)self descriptor];
  v6 = [v5 entity];

  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v7 = v16;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v18 != v9) {
          objc_enumerationMutation(v7);
        }
        uint64_t v11 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        uint64_t v12 = [v11 rangeOfString:@"."];
        if (v12 == 0x7FFFFFFFFFFFFFFFLL)
        {
          v13 = [v6 disambiguatedSQLForProperty:v11 shouldEscape:0];
          [v4 addObject:v13];
        }
        else
        {
          v13 = [v11 substringFromIndex:v12 + 1];
          objc_super v14 = [v6 disambiguatedSQLForProperty:v13 shouldEscape:0];
          [v4 addObject:v14];
        }
      }
      uint64_t v8 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v8);
  }

  return v4;
}

- (id)selectSQLWithProperties:(id)a3
{
  id v4 = a3;
  v5 = [(PPSSQLiteQuery *)self descriptor];
  v6 = [v5 _sqlForSelectWithProperties:v4];

  return v6;
}

- (BOOL)enumerateProperties:(id)a3 error:(id *)a4 enumerationHandler:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  if ([v8 count] >= 0x80000000)
  {
    unint64_t v10 = (void *)MEMORY[0x263EFF940];
    uint64_t v11 = [v8 count];
    objc_msgSend(v10, "raise:format:", *MEMORY[0x263EFF4A0], @"Insane number of properties for enumeration (%lu)", v11);
  }
  uint64_t v12 = [(PPSSQLiteQuery *)self descriptor];
  v13 = [v12 _sqlForSelectWithProperties:v8];

  v24[0] = 0;
  v24[1] = v24;
  v24[2] = 0x2020000000;
  char v25 = 0;
  database = self->_database;
  v23[0] = MEMORY[0x263EF8330];
  v23[1] = 3221225472;
  v23[2] = __63__PPSSQLiteQuery_enumerateProperties_error_enumerationHandler___block_invoke;
  v23[3] = &unk_265443638;
  v23[4] = self;
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __63__PPSSQLiteQuery_enumerateProperties_error_enumerationHandler___block_invoke_2;
  v19[3] = &unk_265443660;
  uint64_t v22 = v24;
  id v15 = v8;
  id v20 = v15;
  id v16 = v9;
  id v21 = v16;
  BOOL v17 = [(PPSSQLiteDatabase *)database executeSQL:v13 shouldCache:1 error:a4 bindingHandler:v23 enumerationHandler:v19];

  _Block_object_dispose(v24, 8);
  return v17;
}

uint64_t __63__PPSSQLiteQuery_enumerateProperties_error_enumerationHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  int v3 = 1;
  return [*(id *)(a1 + 32) bindToSelectStatement:a2 bindingIndex:&v3];
}

uint64_t __63__PPSSQLiteQuery_enumerateProperties_error_enumerationHandler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24))
  {
    PPSSQLiteRow::setColumnNames(a2, *(void **)(a1 + 32));
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
  }
  int v3 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
  return v3();
}

+ (id)queryWithDatabase:(id)a3 entity:(id)a4 predicate:(id)a5
{
  v5 = +[PPSSQLiteQuery queryWithDatabase:a3 entity:a4 predicate:a5 groupByProperties:0 orderByProperties:0 orderByDirections:0 limitCount:0 offsetCount:0];
  return v5;
}

+ (id)queryWithDatabase:(id)a3 entity:(id)a4 predicate:(id)a5 groupByProperties:(id)a6 orderByProperties:(id)a7 orderByDirections:(id)a8 limitCount:(unint64_t)a9 offsetCount:(unint64_t)a10
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  id v20 = a8;
  id v21 = [[PPSSQLiteQueryDescriptor alloc] initWithEntity:v16 predicate:v17];
  [(PPSSQLiteQueryDescriptor *)v21 setOrderByDirections:v20];
  [(PPSSQLiteQueryDescriptor *)v21 setOrderByProperties:v19];
  [(PPSSQLiteQueryDescriptor *)v21 setGroupByProperties:v18];
  [(PPSSQLiteQueryDescriptor *)v21 setLimitCount:a9];
  [(PPSSQLiteQueryDescriptor *)v21 setOffsetCount:a10];
  uint64_t v22 = [[PPSSQLiteQuery alloc] initWithDatabase:v15 descriptor:v21];

  return v22;
}

- (PPSSQLiteDatabase)database
{
  return (PPSSQLiteDatabase *)objc_getProperty(self, a2, 8, 1);
}

- (PPSSQLiteQueryDescriptor)descriptor
{
  return (PPSSQLiteQueryDescriptor *)objc_getProperty(self, a2, 16, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_descriptor, 0);
  objc_storeStrong((id *)&self->_database, 0);
}

@end