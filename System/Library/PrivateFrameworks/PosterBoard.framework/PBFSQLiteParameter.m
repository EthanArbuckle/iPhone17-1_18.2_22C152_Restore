@interface PBFSQLiteParameter
+ (id)unnamedParameter;
- (BOOL)isEqual:(id)a3;
- (NSString)parameterName;
- (PBFSQLiteParameter)initWithParameterName:(id)a3;
- (id)pbf_valueForSQLiteQuery;
- (unint64_t)hash;
@end

@implementation PBFSQLiteParameter

+ (id)unnamedParameter
{
  if (unnamedParameter_onceToken != -1) {
    dispatch_once(&unnamedParameter_onceToken, &__block_literal_global_35);
  }
  v2 = (void *)unnamedParameter_unnamedParameter;
  return v2;
}

void __38__PBFSQLiteParameter_unnamedParameter__block_invoke()
{
  uint64_t v0 = objc_opt_new();
  v1 = (void *)unnamedParameter_unnamedParameter;
  unnamedParameter_unnamedParameter = v0;
}

- (PBFSQLiteParameter)initWithParameterName:(id)a3
{
  id v4 = a3;
  if ([v4 length])
  {
    v11.receiver = self;
    v11.super_class = (Class)PBFSQLiteParameter;
    v5 = [(PBFSQLiteParameter *)&v11 init];
    if (v5)
    {
      uint64_t v6 = [v4 copy];
      parameterName = v5->_parameterName;
      v5->_parameterName = (NSString *)v6;
    }
    v8 = v5;
    self = v8;
  }
  else
  {
    v8 = [(id)objc_opt_class() unnamedParameter];
  }
  v9 = v8;

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v5 = self;
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    v7 = [v4 parameterName];
    v8 = [(PBFSQLiteParameter *)self parameterName];
    char v9 = BSEqualObjects();
  }
  else
  {
    char v9 = 0;
  }

  return v9;
}

- (unint64_t)hash
{
  v2 = [(PBFSQLiteParameter *)self parameterName];
  v3 = v2;
  if (!v2) {
    v2 = @"UNNAMED_PARAMETER_VALUE_WHICH_I_WILL_HASH";
  }
  unint64_t v4 = [(__CFString *)v2 hash];

  return v4;
}

- (id)pbf_valueForSQLiteQuery
{
  v3 = [(PBFSQLiteParameter *)self parameterName];
  uint64_t v4 = [v3 length];

  if (v4)
  {
    v5 = NSString;
    uint64_t v6 = [(PBFSQLiteParameter *)self parameterName];
    v7 = [v5 stringWithFormat:@"?%@", v6];
  }
  else
  {
    v7 = @"?";
  }
  return v7;
}

- (NSString)parameterName
{
  return self->_parameterName;
}

- (void).cxx_destruct
{
}

@end