@interface ML3DatabaseResult
- (BOOL)hasAtLeastOneRow;
- (ML3DatabaseResult)init;
- (ML3DatabaseResult)initWithStatement:(id)a3 connection:(id)a4;
- (NSString)limitProperty;
- (id)_statement;
- (id)columnNameIndexMap;
- (id)objectForFirstRowAndColumn;
- (id)objectsInColumn:(unint64_t)a3;
- (id)rows;
- (id)stringValueForFirstRowAndColumn;
- (int64_t)int64ValueForFirstRowAndColumn;
- (int64_t)limitValue;
- (unint64_t)indexForColumnName:(id)a3;
- (void)enumerateRowsWithBlock:(id)a3;
- (void)setLimitProperty:(id)a3;
- (void)setLimitProperty:(id)a3 limitValue:(int64_t)a4;
- (void)setLimitValue:(int64_t)a3;
@end

@implementation ML3DatabaseResult

- (id)objectForFirstRowAndColumn
{
  uint64_t v5 = 0;
  v6 = &v5;
  uint64_t v7 = 0x3032000000;
  v8 = __Block_byref_object_copy__22393;
  v9 = __Block_byref_object_dispose__22394;
  id v10 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __47__ML3DatabaseResult_objectForFirstRowAndColumn__block_invoke;
  v4[3] = &unk_1E5FB77B8;
  v4[4] = &v5;
  [(ML3DatabaseResult *)self enumerateRowsWithBlock:v4];
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return v2;
}

- (void)enumerateRowsWithBlock:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  statement = self->_statement;
  if (!statement) {
    goto LABEL_30;
  }
  v6 = [(ML3DatabaseStatement *)statement sqliteStatement];
  v25 = [[ML3DatabaseRow alloc] initWithParentResult:self];
  uint64_t v7 = self->_connection;
  unsigned __int8 v26 = 0;
  [(ML3DatabaseConnection *)v7 _ensureConnectionIsOpen];
  uint64_t v8 = [(ML3DatabaseStatement *)self->_statement setIsExecuting:1];
  unsigned int v9 = 0;
  int64_t v23 = 0;
  id v24 = v4;
  while (2)
  {
    while (1)
    {
      id v10 = (void *)MEMORY[0x1B3E93C70](v8);
      int v11 = sqlite3_step(v6);
      unsigned __int8 v26 = 0;
      if (v11 <= 0x19u) {
        break;
      }
      switch(v11)
      {
        case 0x1Au:
LABEL_6:
          if ([(ML3DatabaseConnection *)v7 _alreadyAttemptedCorruptionRecovery])
          {
            goto LABEL_19;
          }
          v12 = os_log_create("com.apple.amp.medialibrary", "Default");
          if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1B022D000, v12, OS_LOG_TYPE_DEFAULT, "Attempting corruption recovery using disk IO recovery routine", buf, 2u);
          }

          BOOL v13 = [(ML3DatabaseConnection *)v7 _handleDiskIOError];
          [(ML3DatabaseConnection *)v7 _setAlreadyAttemptedCorruptionRecovery:1];
          if (!v13)
          {
LABEL_19:
            v22 = ML3DatabaseCreateCorruptionError();
            [(ML3DatabaseConnection *)v7 _handleDatabaseCorruption];
            if (!v22)
            {
LABEL_20:
              v22 = [(ML3DatabaseConnection *)v7 sqliteError];
            }
            v16 = os_log_create("com.apple.amp.medialibrary", "Default");
            if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
            {
              v17 = (char *)objc_opt_class();
              v18 = self->_statement;
              *(_DWORD *)buf = 138543874;
              v28 = v17;
              __int16 v29 = 2114;
              *(void *)v30 = v18;
              *(_WORD *)&v30[8] = 2114;
              *(void *)&v30[10] = v22;
              v19 = v17;
              _os_log_impl(&dword_1B022D000, v16, OS_LOG_TYPE_DEFAULT, "[%{public}@] Error while enumerating rows for statement %{public}@. %{public}@", buf, 0x20u);
            }
LABEL_24:
            id v4 = v24;
            (*((void (**)(id, void, void *, unsigned __int8 *))v24 + 2))(v24, 0, v22, &v26);
            goto LABEL_25;
          }
          [(ML3DatabaseStatement *)self->_statement reset];
          break;
        case 0x65u:
          if ([(ML3DatabaseStatement *)self->_statement clearBindingsAfterRunning]) {
            [(ML3DatabaseStatement *)self->_statement clearBindings];
          }
LABEL_34:
          v22 = 0;
          goto LABEL_35;
        case 0x64u:
LABEL_13:
          if (self->_limitProperty)
          {
            v23 += sqlite3_column_int64(v6, self->_limitIndex);
            if (v23 > self->_limitValue) {
              goto LABEL_34;
            }
          }
          (*((void (**)(id, ML3DatabaseRow *, void, unsigned __int8 *))v4 + 2))(v4, v25, 0, &v26);
          int v14 = v26;
          if (v14)
          {
            v22 = 0;
            goto LABEL_26;
          }
          break;
        default:
          goto LABEL_20;
      }
    }
    switch((char)v11)
    {
      case 0:
        goto LABEL_13;
      case 5:
      case 6:
        int v15 = v11;
        if (![(ML3DatabaseConnection *)v7 _handleBusyLockWithNumberOfRetries:v9])
        {
          ++v9;
          continue;
        }
        v22 = [(ML3DatabaseConnection *)v7 sqliteError];
        v20 = _ML3LogCategoryDefault();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        {
          v21 = "locked";
          *(_DWORD *)buf = 136315650;
          if (v15 == 5) {
            v21 = "busy";
          }
          v28 = v21;
          __int16 v29 = 1024;
          *(_DWORD *)v30 = v9;
          *(_WORD *)&v30[4] = 2114;
          *(void *)&v30[6] = v22;
          _os_log_impl(&dword_1B022D000, v20, OS_LOG_TYPE_DEFAULT, "(enumerateRowsWithBlock:) SQLite was %s after %u retries. %{public}@", buf, 0x1Cu);
        }

LABEL_35:
        id v4 = v24;
LABEL_25:
LABEL_26:
        -[ML3DatabaseStatement setIsExecuting:](self->_statement, "setIsExecuting:", 0, v23);
        if ([v22 code] == 500) {
          [(ML3DatabaseConnection *)v7 _handleDiskIOError];
        }
        else {
          [(ML3DatabaseStatement *)self->_statement reset];
        }

LABEL_30:
        return;
      case 10:
        v22 = ML3DatabaseCreateDiskIOError();
        goto LABEL_24;
      case 11:
        goto LABEL_6;
      default:
        goto LABEL_20;
    }
  }
}

- (id)_statement
{
  return self->_statement;
}

- (ML3DatabaseResult)initWithStatement:(id)a3 connection:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)ML3DatabaseResult;
  unsigned int v9 = [(ML3DatabaseResult *)&v13 init];
  id v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_statement, a3);
    objc_storeStrong((id *)&v10->_connection, a4);
    columnNameIndexMap = v10->_columnNameIndexMap;
    v10->_columnNameIndexMap = 0;
  }
  return v10;
}

void __47__ML3DatabaseResult_objectForFirstRowAndColumn__block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  if (!a3)
  {
    uint64_t v6 = objc_msgSend(a2, "objectAtIndexedSubscript:");
    uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
    id v8 = *(void **)(v7 + 40);
    *(void *)(v7 + 40) = v6;
  }
  *a4 = 1;
}

uint64_t __37__ML3DatabaseResult_hasAtLeastOneRow__block_invoke(uint64_t result, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  if (a2 && !a3) {
    *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = 1;
  }
  *a4 = 1;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_limitProperty, 0);
  objc_storeStrong((id *)&self->_columnNameIndexMap, 0);
  objc_storeStrong((id *)&self->_connection, 0);

  objc_storeStrong((id *)&self->_statement, 0);
}

uint64_t __51__ML3DatabaseResult_int64ValueForFirstRowAndColumn__block_invoke(uint64_t result, void *a2, uint64_t a3, unsigned char *a4)
{
  if (!a3)
  {
    uint64_t v5 = result;
    result = objc_msgSend(a2, "int64ForColumnIndex:");
    *(void *)(*(void *)(*(void *)(v5 + 32) + 8) + 24) = result;
  }
  *a4 = 1;
  return result;
}

- (int64_t)int64ValueForFirstRowAndColumn
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x2020000000;
  uint64_t v8 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __51__ML3DatabaseResult_int64ValueForFirstRowAndColumn__block_invoke;
  v4[3] = &unk_1E5FB77B8;
  v4[4] = &v5;
  [(ML3DatabaseResult *)self enumerateRowsWithBlock:v4];
  int64_t v2 = v6[3];
  _Block_object_dispose(&v5, 8);
  return v2;
}

- (BOOL)hasAtLeastOneRow
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x2020000000;
  char v8 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __37__ML3DatabaseResult_hasAtLeastOneRow__block_invoke;
  v4[3] = &unk_1E5FB77B8;
  v4[4] = &v5;
  [(ML3DatabaseResult *)self enumerateRowsWithBlock:v4];
  char v2 = *((unsigned char *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

- (void)setLimitValue:(int64_t)a3
{
  self->_limitValue = a3;
}

- (int64_t)limitValue
{
  return self->_limitValue;
}

- (NSString)limitProperty
{
  return self->_limitProperty;
}

- (id)objectsInColumn:(unint64_t)a3
{
  uint64_t v8 = 0;
  unsigned int v9 = &v8;
  uint64_t v10 = 0x3032000000;
  int v11 = __Block_byref_object_copy__22393;
  v12 = __Block_byref_object_dispose__22394;
  id v13 = [MEMORY[0x1E4F1CA48] array];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __37__ML3DatabaseResult_objectsInColumn___block_invoke;
  v7[3] = &unk_1E5FB77E0;
  v7[4] = &v8;
  v7[5] = a3;
  [(ML3DatabaseResult *)self enumerateRowsWithBlock:v7];
  id v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return v5;
}

void __37__ML3DatabaseResult_objectsInColumn___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  if (a3)
  {
    *a4 = 1;
  }
  else
  {
    id v4 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
    uint64_t v5 = [a2 objectAtIndexedSubscript:*(void *)(a1 + 40)];
    id v7 = (id)v5;
    if (v5)
    {
      [v4 addObject:v5];
    }
    else
    {
      uint64_t v6 = [MEMORY[0x1E4F1CA98] null];
      [v4 addObject:v6];
    }
  }
}

- (id)stringValueForFirstRowAndColumn
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x3032000000;
  uint64_t v8 = __Block_byref_object_copy__22393;
  unsigned int v9 = __Block_byref_object_dispose__22394;
  id v10 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __52__ML3DatabaseResult_stringValueForFirstRowAndColumn__block_invoke;
  v4[3] = &unk_1E5FB77B8;
  v4[4] = &v5;
  [(ML3DatabaseResult *)self enumerateRowsWithBlock:v4];
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return v2;
}

void __52__ML3DatabaseResult_stringValueForFirstRowAndColumn__block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  if (!a3)
  {
    uint64_t v6 = objc_msgSend(a2, "stringForColumnIndex:");
    uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
    uint64_t v8 = *(void **)(v7 + 40);
    *(void *)(v7 + 40) = v6;
  }
  *a4 = 1;
}

- (id)rows
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __25__ML3DatabaseResult_rows__block_invoke;
  v6[3] = &unk_1E5FB83F8;
  id v4 = v3;
  id v7 = v4;
  [(ML3DatabaseResult *)self enumerateRowsWithBlock:v6];

  return v4;
}

void __25__ML3DatabaseResult_rows__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [ML3DatabaseCachedRow alloc];
  uint64_t v5 = [v3 arrayRepresentation];

  uint64_t v6 = [(ML3DatabaseCachedRow *)v4 initWithArray:v5];
  [*(id *)(a1 + 32) addObject:v6];
}

- (id)columnNameIndexMap
{
  columnNameIndexMap = self->_columnNameIndexMap;
  if (!columnNameIndexMap)
  {
    int v4 = sqlite3_column_count([(ML3DatabaseStatement *)self->_statement sqliteStatement]);
    uint64_t v5 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:v4];
    if (v4 >= 1)
    {
      uint64_t v6 = 0;
      do
      {
        id v7 = sqlite3_column_name([(ML3DatabaseStatement *)self->_statement sqliteStatement], v6);
        uint64_t v8 = [NSNumber numberWithInt:v6];
        unsigned int v9 = [NSString stringWithUTF8String:v7];
        [(NSDictionary *)v5 setObject:v8 forKeyedSubscript:v9];

        uint64_t v6 = (v6 + 1);
      }
      while (v4 != v6);
    }
    id v10 = self->_columnNameIndexMap;
    self->_columnNameIndexMap = v5;

    columnNameIndexMap = self->_columnNameIndexMap;
  }

  return columnNameIndexMap;
}

- (unint64_t)indexForColumnName:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(ML3DatabaseResult *)self columnNameIndexMap];
  uint64_t v6 = [v5 objectForKeyedSubscript:v4];

  unint64_t v7 = [v6 unsignedIntegerValue];
  return v7;
}

- (void)setLimitProperty:(id)a3 limitValue:(int64_t)a4
{
  [(ML3DatabaseResult *)self setLimitProperty:a3];

  [(ML3DatabaseResult *)self setLimitValue:a4];
}

- (void)setLimitProperty:(id)a3
{
  id v4 = (NSString *)[a3 copy];
  limitProperty = self->_limitProperty;
  self->_limitProperty = v4;

  id v6 = [(NSString *)self->_limitProperty pathExtension];
  self->_limitIndex = [(ML3DatabaseResult *)self indexForColumnName:v6];
}

- (ML3DatabaseResult)init
{
  id v3 = (objc_class *)objc_opt_class();
  id v4 = NSStringFromClass(v3);
  [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8], @"-[%@ init] is unsupported. Use -[%@ initWithStatement:] instead.", v4, v4 format];

  return 0;
}

@end