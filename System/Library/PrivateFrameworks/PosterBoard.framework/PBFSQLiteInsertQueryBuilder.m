@interface PBFSQLiteInsertQueryBuilder
- (NSString)tableName;
- (PBFSQLiteInsertQueryBuilder)initWithTableName:(id)a3;
- (id)appendInsertIntoColumnNamed:(id)a3 value:(id)a4;
- (id)build;
- (id)copyWithZone:(_NSZone *)a3;
@end

@implementation PBFSQLiteInsertQueryBuilder

- (PBFSQLiteInsertQueryBuilder)initWithTableName:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    v5 = v4;
    v13.receiver = self;
    v13.super_class = (Class)PBFSQLiteInsertQueryBuilder;
    v6 = [(PBFSQLiteInsertQueryBuilder *)&v13 init];
    if (v6)
    {
      uint64_t v7 = [v5 copy];
      tableName = v6->_tableName;
      v6->_tableName = (NSString *)v7;

      uint64_t v9 = objc_opt_new();
      insertDictionary = v6->_insertDictionary;
      v6->_insertDictionary = (NSMutableDictionary *)v9;
    }
    return v6;
  }
  else
  {
    v12 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"tableName"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PBFSQLiteInsertQueryBuilder initWithTableName:]();
    }
    [v12 UTF8String];
    result = (PBFSQLiteInsertQueryBuilder *)_bs_set_crash_log_message();
    __break(0);
  }
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "initWithTableName:", self->_tableName);
  uint64_t v5 = [objc_alloc(MEMORY[0x1E4F1CA60]) initWithDictionary:self->_insertDictionary copyItems:1];
  v6 = (void *)v4[1];
  v4[1] = v5;

  return v4;
}

- (id)appendInsertIntoColumnNamed:(id)a3 value:(id)a4
{
  id v6 = a3;
  uint64_t v7 = _NSStringFromPBFSQLiteObjectParameter(a4);
  [(NSMutableDictionary *)self->_insertDictionary setObject:v7 forKeyedSubscript:v6];

  return self;
}

- (id)build
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  v3 = objc_opt_new();
  id v4 = objc_opt_new();
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  uint64_t v5 = [(NSMutableDictionary *)self->_insertDictionary keyEnumerator];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v19 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v18 + 1) + 8 * i);
        [v3 addObject:v10];
        v11 = [(NSMutableDictionary *)self->_insertDictionary objectForKey:v10];
        [v4 addObject:v11];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v7);
  }

  v12 = (void *)MEMORY[0x1E4F28E78];
  tableName = self->_tableName;
  v14 = [v3 componentsJoinedByString:@", "];
  v15 = [v4 componentsJoinedByString:@", "];
  v16 = [v12 stringWithFormat:@"INSERT INTO %@ (%@) VALUES (%@)", tableName, v14, v15];

  return v16;
}

- (NSString)tableName
{
  return self->_tableName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tableName, 0);
  objc_storeStrong((id *)&self->_insertDictionary, 0);
}

- (void)initWithTableName:.cold.1()
{
  v0 = [NSString stringWithUTF8String:"-[PBFSQLiteInsertQueryBuilder initWithTableName:]"];
  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_15_0();
  OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_6_0(&dword_1D31CE000, MEMORY[0x1E4F14500], v1, "failure in %{public}@ (%{public}@:%i) : %{public}@", v2, v3, v4, v5, v6);
}

@end