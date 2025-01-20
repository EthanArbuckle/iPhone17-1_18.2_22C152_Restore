@interface PBFSQLiteUpdateQueryBuilder
- (NSString)tableName;
- (PBFSQLiteUpdateQueryBuilder)initWithTableName:(id)a3;
- (id)appendUpdateColumnName:(id)a3 toValue:(id)a4;
- (id)build;
- (id)copyWithZone:(_NSZone *)a3;
- (id)setWhereClause:(id)a3;
@end

@implementation PBFSQLiteUpdateQueryBuilder

- (PBFSQLiteUpdateQueryBuilder)initWithTableName:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    v5 = v4;
    v13.receiver = self;
    v13.super_class = (Class)PBFSQLiteUpdateQueryBuilder;
    v6 = [(PBFSQLiteUpdateQueryBuilder *)&v13 init];
    if (v6)
    {
      uint64_t v7 = [v5 copy];
      tableName = v6->_tableName;
      v6->_tableName = (NSString *)v7;

      uint64_t v9 = objc_opt_new();
      updateColumns = v6->_updateColumns;
      v6->_updateColumns = (NSMutableArray *)v9;
    }
    return v6;
  }
  else
  {
    v12 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"tableName"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PBFSQLiteUpdateQueryBuilder initWithTableName:]();
    }
    [v12 UTF8String];
    result = (PBFSQLiteUpdateQueryBuilder *)_bs_set_crash_log_message();
    __break(0);
  }
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "initWithTableName:", self->_tableName);
  uint64_t v5 = [objc_alloc(MEMORY[0x1E4F1CA48]) initWithArray:self->_updateColumns copyItems:1];
  v6 = (void *)v4[1];
  v4[1] = v5;

  uint64_t v7 = [(PBFSQLiteWhereClauseBuilder *)self->_whereClauseBuilder copy];
  v8 = (void *)v4[2];
  v4[2] = v7;

  return v4;
}

- (id)setWhereClause:(id)a3
{
  id v4 = (PBFSQLiteWhereClauseBuilder *)[a3 copy];
  whereClauseBuilder = self->_whereClauseBuilder;
  self->_whereClauseBuilder = v4;

  return self;
}

- (id)appendUpdateColumnName:(id)a3 toValue:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (!v7)
  {
    v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2, self, @"PBFSQLiteQueryBuilder.m", 425, @"Invalid parameter not satisfying: %@", @"columnName" object file lineNumber description];
  }
  updateColumns = self->_updateColumns;
  v10 = NSString;
  v11 = _NSStringFromPBFSQLiteObjectParameter(v8);
  v12 = [v10 stringWithFormat:@"%@ = %@", v7, v11];
  [(NSMutableArray *)updateColumns addObject:v12];

  return self;
}

- (id)build
{
  v3 = (void *)MEMORY[0x1E4F28E78];
  tableName = self->_tableName;
  uint64_t v5 = [(NSMutableArray *)self->_updateColumns componentsJoinedByString:@","];
  v6 = [v3 stringWithFormat:@"UPDATE %@ SET(%@)", tableName, v5];

  id v7 = [(PBFSQLiteWhereClauseBuilder *)self->_whereClauseBuilder build];
  uint64_t v8 = [v7 length];

  if (v8)
  {
    uint64_t v9 = [(PBFSQLiteWhereClauseBuilder *)self->_whereClauseBuilder build];
    [v6 appendFormat:@" WHERE %@", v9];
  }
  v10 = (void *)[v6 copy];
  v11 = [v10 stringByAppendingString:@";"];

  return v11;
}

- (NSString)tableName
{
  return self->_tableName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tableName, 0);
  objc_storeStrong((id *)&self->_whereClauseBuilder, 0);
  objc_storeStrong((id *)&self->_updateColumns, 0);
}

- (void)initWithTableName:.cold.1()
{
  v0 = [NSString stringWithUTF8String:"-[PBFSQLiteUpdateQueryBuilder initWithTableName:]"];
  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_15_0();
  OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_6_0(&dword_1D31CE000, MEMORY[0x1E4F14500], v1, "failure in %{public}@ (%{public}@:%i) : %{public}@", v2, v3, v4, v5, v6);
}

@end