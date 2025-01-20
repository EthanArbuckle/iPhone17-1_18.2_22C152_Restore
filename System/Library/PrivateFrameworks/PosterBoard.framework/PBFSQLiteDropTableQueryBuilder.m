@interface PBFSQLiteDropTableQueryBuilder
- (BOOL)dropIfNotExists;
- (NSString)tableName;
- (PBFSQLiteDropTableQueryBuilder)initWithTableName:(id)a3;
- (id)build;
- (id)copyWithZone:(_NSZone *)a3;
- (void)setDropIfNotExists:(BOOL)a3;
@end

@implementation PBFSQLiteDropTableQueryBuilder

- (PBFSQLiteDropTableQueryBuilder)initWithTableName:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    v5 = v4;
    v11.receiver = self;
    v11.super_class = (Class)PBFSQLiteDropTableQueryBuilder;
    v6 = [(PBFSQLiteDropTableQueryBuilder *)&v11 init];
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
      -[PBFSQLiteDropTableQueryBuilder initWithTableName:]();
    }
    [v10 UTF8String];
    result = (PBFSQLiteDropTableQueryBuilder *)_bs_set_crash_log_message();
    __break(0);
  }
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "initWithTableName:", self->_tableName);
  *((unsigned char *)result + 8) = self->_dropIfNotExists;
  return result;
}

- (id)build
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"DROP"];
  if ([(PBFSQLiteDropTableQueryBuilder *)self dropIfNotExists]) {
    [v3 appendFormat:@" IF EXISTS"];
  }
  [v3 appendFormat:@" %@", self->_tableName];
  id v4 = (void *)[v3 copy];
  v5 = [v4 stringByAppendingString:@";"];

  return v5;
}

- (NSString)tableName
{
  return self->_tableName;
}

- (BOOL)dropIfNotExists
{
  return self->_dropIfNotExists;
}

- (void)setDropIfNotExists:(BOOL)a3
{
  self->_dropIfNotExists = a3;
}

- (void).cxx_destruct
{
}

- (void)initWithTableName:.cold.1()
{
  v0 = [NSString stringWithUTF8String:"-[PBFSQLiteDropTableQueryBuilder initWithTableName:]"];
  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_15_0();
  OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_6_0(&dword_1D31CE000, MEMORY[0x1E4F14500], v1, "failure in %{public}@ (%{public}@:%i) : %{public}@", v2, v3, v4, v5, v6);
}

@end