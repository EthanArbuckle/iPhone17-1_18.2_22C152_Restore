@interface PBFSQLiteCreateTableQueryBuilder
- (BOOL)createIfNotExists;
- (BOOL)isTemporary;
- (BOOL)isTypeCheckingStrict;
- (NSString)tableName;
- (PBFSQLiteCreateTableQueryBuilder)initWithTableName:(id)a3;
- (id)appendColumnNamed:(id)a3 type:(unint64_t)a4;
- (id)appendColumnNamed:(id)a3 type:(unint64_t)a4 constraints:(unint64_t)a5;
- (id)build;
- (id)copyWithZone:(_NSZone *)a3;
- (void)setCreateIfNotExists:(BOOL)a3;
- (void)setIsTemporary:(BOOL)a3;
- (void)setIsTypeCheckingStrict:(BOOL)a3;
@end

@implementation PBFSQLiteCreateTableQueryBuilder

- (PBFSQLiteCreateTableQueryBuilder)initWithTableName:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    v5 = v4;
    v13.receiver = self;
    v13.super_class = (Class)PBFSQLiteCreateTableQueryBuilder;
    v6 = [(PBFSQLiteCreateTableQueryBuilder *)&v13 init];
    if (v6)
    {
      uint64_t v7 = [v5 copy];
      tableName = v6->_tableName;
      v6->_tableName = (NSString *)v7;

      uint64_t v9 = objc_opt_new();
      columns = v6->_columns;
      v6->_columns = (NSMutableArray *)v9;
    }
    return v6;
  }
  else
  {
    v12 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"tableName"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PBFSQLiteCreateTableQueryBuilder initWithTableName:]();
    }
    [v12 UTF8String];
    result = (PBFSQLiteCreateTableQueryBuilder *)_bs_set_crash_log_message();
    __break(0);
  }
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "initWithTableName:", self->_tableName);
  uint64_t v5 = [objc_alloc(MEMORY[0x1E4F1CA48]) initWithArray:self->_columns copyItems:1];
  v6 = *(void **)(v4 + 8);
  *(void *)(v4 + 8) = v5;

  *(unsigned char *)(v4 + 18) = self->_isTemporary;
  *(unsigned char *)(v4 + 17) = self->_createIfNotExists;
  *(unsigned char *)(v4 + 16) = self->_isTypeCheckingStrict;
  return (id)v4;
}

- (id)appendColumnNamed:(id)a3 type:(unint64_t)a4
{
  return [(PBFSQLiteCreateTableQueryBuilder *)self appendColumnNamed:a3 type:a4 constraints:0];
}

- (id)appendColumnNamed:(id)a3 type:(unint64_t)a4 constraints:(unint64_t)a5
{
  v8 = (void *)[a3 mutableCopy];
  uint64_t v9 = v8;
  if (a4 <= 4) {
    [v8 appendFormat:off_1E69841C0[a4]];
  }
  if (!a5) {
    goto LABEL_8;
  }
  if ((a5 & 4) == 0)
  {
    if ((a5 & 2) == 0) {
      goto LABEL_6;
    }
LABEL_10:
    [v9 appendFormat:@" NOT NULL"];
    if ((a5 & 1) == 0) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
  [v9 appendFormat:@" PRIMARY KEY"];
  if ((a5 & 2) != 0) {
    goto LABEL_10;
  }
LABEL_6:
  if (a5) {
LABEL_7:
  }
    [v9 appendFormat:@" UNIQUE"];
LABEL_8:
  [(NSMutableArray *)self->_columns addObject:v9];

  return self;
}

- (id)build
{
  if ([(PBFSQLiteCreateTableQueryBuilder *)self isTemporary])
  {
    v3 = [@"CREATE" stringByAppendingString:@" TEMPORARY"];
  }
  else
  {
    v3 = @"CREATE";
  }
  if ([(PBFSQLiteCreateTableQueryBuilder *)self createIfNotExists])
  {
    uint64_t v4 = [(__CFString *)v3 stringByAppendingString:@" IF NOT EXISTS"];

    v3 = (__CFString *)v4;
  }
  uint64_t v5 = (void *)MEMORY[0x1E4F28E78];
  tableName = self->_tableName;
  uint64_t v7 = [(NSMutableArray *)self->_columns componentsJoinedByString:@", "];
  v8 = [v5 stringWithFormat:@"%@ TABLE %@(%@)", v3, tableName, v7];

  if ([(PBFSQLiteCreateTableQueryBuilder *)self isTypeCheckingStrict]) {
    [v8 appendString:@" STRICT"];
  }
  uint64_t v9 = (void *)[v8 copy];
  v10 = [v9 stringByAppendingString:@";"];

  return v10;
}

- (NSString)tableName
{
  return self->_tableName;
}

- (BOOL)isTypeCheckingStrict
{
  return self->_isTypeCheckingStrict;
}

- (void)setIsTypeCheckingStrict:(BOOL)a3
{
  self->_isTypeCheckingStrict = a3;
}

- (BOOL)createIfNotExists
{
  return self->_createIfNotExists;
}

- (void)setCreateIfNotExists:(BOOL)a3
{
  self->_createIfNotExists = a3;
}

- (BOOL)isTemporary
{
  return self->_isTemporary;
}

- (void)setIsTemporary:(BOOL)a3
{
  self->_isTemporary = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tableName, 0);
  objc_storeStrong((id *)&self->_columns, 0);
}

- (void)initWithTableName:.cold.1()
{
  v0 = [NSString stringWithUTF8String:"-[PBFSQLiteCreateTableQueryBuilder initWithTableName:]"];
  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_15_0();
  OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_6_0(&dword_1D31CE000, MEMORY[0x1E4F14500], v1, "failure in %{public}@ (%{public}@:%i) : %{public}@", v2, v3, v4, v5, v6);
}

@end