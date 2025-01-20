@interface PLLibraryScopeCondition
+ (BOOL)supportsQueryKey:(int)a3;
+ (id)conditionWithSingleQueries:(id)a3 criteria:(unsigned __int8)a4;
+ (void)_abortIfCalledOnBaseClass;
- (PLLibraryScopeCondition)initWithCriteria:(unsigned __int8)a3;
- (id)conditionQuery;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)query;
- (unsigned)criteria;
- (unsigned)type;
- (void)setCriteria:(unsigned __int8)a3;
@end

@implementation PLLibraryScopeCondition

- (void)setCriteria:(unsigned __int8)a3
{
  self->_criteria = a3;
}

- (unsigned)criteria
{
  return self->_criteria;
}

- (id)description
{
  v3 = NSString;
  v12.receiver = self;
  v12.super_class = (Class)PLLibraryScopeCondition;
  v4 = [(PLLibraryScopeCondition *)&v12 description];
  int v5 = [(PLLibraryScopeCondition *)self type];
  v6 = @"Date Range";
  if (v5 != 1) {
    v6 = @"Unknown";
  }
  if (v5 == 2) {
    v6 = @"Person";
  }
  v7 = v6;
  int v8 = [(PLLibraryScopeCondition *)self criteria];
  v9 = @"Exclusive";
  if (v8 != 2) {
    v9 = @"Unknown";
  }
  if (v8 == 1) {
    v9 = @"Inclusive";
  }
  v10 = [v3 stringWithFormat:@"%@ - %@, %@", v4, v7, v9];

  return v10;
}

- (id)conditionQuery
{
  v2 = self;
  PLAbstractMethodException();
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v3);
}

- (id)query
{
  id v3 = [(PLLibraryScopeCondition *)self conditionQuery];
  if ([(PLLibraryScopeCondition *)self criteria] == 1)
  {
    id v4 = v3;
  }
  else
  {
    id v4 = [MEMORY[0x1E4F8B9A8] notQuery:v3];
  }
  int v5 = v4;

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_opt_class();
  int v5 = [(PLLibraryScopeCondition *)self conditionQuery];
  v6 = [v5 singleQueries];
  v7 = objc_msgSend(v4, "conditionWithSingleQueries:criteria:", v6, -[PLLibraryScopeCondition criteria](self, "criteria"));

  return v7;
}

- (PLLibraryScopeCondition)initWithCriteria:(unsigned __int8)a3
{
  [(id)objc_opt_class() _abortIfCalledOnBaseClass];
  v6.receiver = self;
  v6.super_class = (Class)PLLibraryScopeCondition;
  result = [(PLLibraryScopeCondition *)&v6 init];
  if (result) {
    result->_criteria = a3;
  }
  return result;
}

- (unsigned)type
{
  v2 = self;
  PLAbstractMethodException();
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v3);
}

+ (BOOL)supportsQueryKey:(int)a3
{
  return 0;
}

+ (id)conditionWithSingleQueries:(id)a3 criteria:(unsigned __int8)a4
{
  id v5 = a3;
  id v6 = a1;
  PLAbstractMethodException();
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v7);
}

+ (void)_abortIfCalledOnBaseClass
{
  uint64_t v3 = objc_opt_class();
  if (v3 == objc_opt_class())
  {
    id v4 = a1;
    PLAbstractMethodException();
    id v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v5);
  }
}

@end