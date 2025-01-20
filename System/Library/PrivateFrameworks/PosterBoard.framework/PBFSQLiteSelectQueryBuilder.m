@interface PBFSQLiteSelectQueryBuilder
- (NSString)tableName;
- (PBFSQLiteSelectQueryBuilder)initWithTableName:(id)a3;
- (id)appendOrderBy:(id)a3 comparison:(int64_t)a4;
- (id)build;
- (id)copyWithZone:(_NSZone *)a3;
- (id)selectAllColumns;
- (id)selectColumnNamed:(id)a3;
- (id)selectColumnNamed:(id)a3 as:(id)a4;
- (id)setWhereClause:(id)a3;
@end

@implementation PBFSQLiteSelectQueryBuilder

- (PBFSQLiteSelectQueryBuilder)initWithTableName:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    v5 = v4;
    v15.receiver = self;
    v15.super_class = (Class)PBFSQLiteSelectQueryBuilder;
    v6 = [(PBFSQLiteSelectQueryBuilder *)&v15 init];
    if (v6)
    {
      uint64_t v7 = [v5 copy];
      tableName = v6->_tableName;
      v6->_tableName = (NSString *)v7;

      uint64_t v9 = objc_opt_new();
      columnsToSelect = v6->_columnsToSelect;
      v6->_columnsToSelect = (NSMutableArray *)v9;

      uint64_t v11 = objc_opt_new();
      orderByColumns = v6->_orderByColumns;
      v6->_orderByColumns = (NSMutableArray *)v11;

      v6->_selectAllColumns = 1;
    }

    return v6;
  }
  else
  {
    v14 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"tableName"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PBFSQLiteSelectQueryBuilder initWithTableName:]();
    }
    [v14 UTF8String];
    result = (PBFSQLiteSelectQueryBuilder *)_bs_set_crash_log_message();
    __break(0);
  }
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "initWithTableName:", self->_tableName);
  uint64_t v5 = [objc_alloc(MEMORY[0x1E4F1CA48]) initWithArray:self->_columnsToSelect copyItems:1];
  v6 = (void *)v4[2];
  v4[2] = v5;

  uint64_t v7 = [objc_alloc(MEMORY[0x1E4F1CA48]) initWithArray:self->_orderByColumns copyItems:1];
  v8 = (void *)v4[3];
  v4[3] = v7;

  uint64_t v9 = [(PBFSQLiteWhereClauseBuilder *)self->_whereClauseBuilder copy];
  v10 = (void *)v4[4];
  v4[4] = v9;

  return v4;
}

- (id)selectColumnNamed:(id)a3
{
  self->_selectAllColumns = 0;
  [(NSMutableArray *)self->_columnsToSelect addObject:a3];
  return self;
}

- (id)selectColumnNamed:(id)a3 as:(id)a4
{
  self->_selectAllColumns = 0;
  columnsToSelect = self->_columnsToSelect;
  v6 = [NSString stringWithFormat:@"%@ as '%@'", a3, a4];
  [(NSMutableArray *)columnsToSelect addObject:v6];

  return self;
}

- (id)selectAllColumns
{
  self->_selectAllColumns = 1;
  [(NSMutableArray *)self->_columnsToSelect removeAllObjects];
  return self;
}

- (id)setWhereClause:(id)a3
{
  id v4 = (PBFSQLiteWhereClauseBuilder *)[a3 copy];
  whereClauseBuilder = self->_whereClauseBuilder;
  self->_whereClauseBuilder = v4;

  return self;
}

- (id)appendOrderBy:(id)a3 comparison:(int64_t)a4
{
  if (a4)
  {
    orderByColumns = self->_orderByColumns;
    v6 = @"DESC";
    if (a4 == -1) {
      v6 = @"ASC";
    }
    uint64_t v7 = [NSString stringWithFormat:@"%@ %@", a3, v6];
    [(NSMutableArray *)orderByColumns addObject:v7];
  }
  return self;
}

- (id)build
{
  v3 = NSString;
  BOOL selectAllColumns = self->_selectAllColumns;
  if (self->_selectAllColumns)
  {
    uint64_t v5 = @"*";
  }
  else
  {
    uint64_t v5 = [(NSMutableArray *)self->_columnsToSelect componentsJoinedByString:@", "];
  }
  v6 = [v3 stringWithFormat:@"SELECT %@ FROM %@", v5, self->_tableName];
  if (!selectAllColumns) {

  }
  whereClauseBuilder = self->_whereClauseBuilder;
  if (whereClauseBuilder)
  {
    v8 = [(PBFSQLiteWhereClauseBuilder *)whereClauseBuilder build];
    uint64_t v9 = [v6 stringByAppendingFormat:@" WHERE %@", v8];

    v6 = (void *)v9;
  }
  if ([(NSMutableArray *)self->_orderByColumns count])
  {
    v10 = [(NSMutableArray *)self->_orderByColumns componentsJoinedByString:@", "];
    uint64_t v11 = [v6 stringByAppendingFormat:@" ORDER BY %@", v10];

    v6 = (void *)v11;
  }
  v12 = [v6 stringByAppendingString:@";"];

  return v12;
}

- (NSString)tableName
{
  return self->_tableName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_whereClauseBuilder, 0);
  objc_storeStrong((id *)&self->_orderByColumns, 0);
  objc_storeStrong((id *)&self->_columnsToSelect, 0);
  objc_storeStrong((id *)&self->_tableName, 0);
}

- (void)initWithTableName:.cold.1()
{
  v0 = [NSString stringWithUTF8String:"-[PBFSQLiteSelectQueryBuilder initWithTableName:]"];
  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_15_0();
  OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_6_0(&dword_1D31CE000, MEMORY[0x1E4F14500], v1, "failure in %{public}@ (%{public}@:%i) : %{public}@", v2, v3, v4, v5, v6);
}

@end