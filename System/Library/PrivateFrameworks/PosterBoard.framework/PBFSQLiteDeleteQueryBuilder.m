@interface PBFSQLiteDeleteQueryBuilder
- (NSString)tableName;
- (PBFSQLiteDeleteQueryBuilder)initWithTableName:(id)a3;
- (id)build;
- (id)copyWithZone:(_NSZone *)a3;
- (id)setWhereClause:(id)a3;
@end

@implementation PBFSQLiteDeleteQueryBuilder

- (PBFSQLiteDeleteQueryBuilder)initWithTableName:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    v5 = v4;
    v11.receiver = self;
    v11.super_class = (Class)PBFSQLiteDeleteQueryBuilder;
    v6 = [(PBFSQLiteDeleteQueryBuilder *)&v11 init];
    if (v6)
    {
      uint64_t v7 = [v5 copy];
      tableName = v6->_tableName;
      v6->_tableName = (NSString *)v7;
    }
    return v6;
  }
  else
  {
    v10 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"tableName"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PBFSQLiteDeleteQueryBuilder initWithTableName:]();
    }
    [v10 UTF8String];
    result = (PBFSQLiteDeleteQueryBuilder *)_bs_set_crash_log_message();
    __break(0);
  }
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "initWithTableName:", self->_tableName);
  uint64_t v5 = [(PBFSQLiteWhereClauseBuilder *)self->_whereClauseBuilder copy];
  v6 = (void *)v4[1];
  v4[1] = v5;

  return v4;
}

- (id)setWhereClause:(id)a3
{
  id v4 = (PBFSQLiteWhereClauseBuilder *)[a3 copy];
  whereClauseBuilder = self->_whereClauseBuilder;
  self->_whereClauseBuilder = v4;

  return self;
}

- (id)build
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"DELETE FROM %@", self->_tableName];
  id v4 = [(PBFSQLiteWhereClauseBuilder *)self->_whereClauseBuilder build];
  uint64_t v5 = [v4 length];

  if (v5)
  {
    v6 = [(PBFSQLiteWhereClauseBuilder *)self->_whereClauseBuilder build];
    [v3 appendFormat:@" WHERE %@", v6];
  }
  uint64_t v7 = (void *)[v3 copy];
  v8 = [v7 stringByAppendingString:@";"];

  return v8;
}

- (NSString)tableName
{
  return self->_tableName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tableName, 0);
  objc_storeStrong((id *)&self->_whereClauseBuilder, 0);
}

- (void)initWithTableName:.cold.1()
{
  v0 = [NSString stringWithUTF8String:"-[PBFSQLiteDeleteQueryBuilder initWithTableName:]"];
  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_15_0();
  OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_6_0(&dword_1D31CE000, MEMORY[0x1E4F14500], v1, "failure in %{public}@ (%{public}@:%i) : %{public}@", v2, v3, v4, v5, v6);
}

@end