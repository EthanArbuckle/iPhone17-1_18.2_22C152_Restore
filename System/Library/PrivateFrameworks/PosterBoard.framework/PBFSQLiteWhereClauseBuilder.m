@interface PBFSQLiteWhereClauseBuilder
- (PBFSQLiteWhereClauseBuilder)init;
- (id)appendColumn:(id)a3 comparison:(unint64_t)a4 toValue:(id)a5 combinator:(unint64_t)a6;
- (id)appendEqualsDictionary:(id)a3;
- (id)appendExpression:(id)a3 combinator:(unint64_t)a4;
- (id)build;
- (id)copyWithZone:(_NSZone *)a3;
- (id)currentComponent;
@end

@implementation PBFSQLiteWhereClauseBuilder

- (PBFSQLiteWhereClauseBuilder)init
{
  v6.receiver = self;
  v6.super_class = (Class)PBFSQLiteWhereClauseBuilder;
  v2 = [(PBFSQLiteWhereClauseBuilder *)&v6 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    components = v2->_components;
    v2->_components = (NSMutableString *)v3;
  }
  return v2;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init(PBFSQLiteWhereClauseBuilder);
  uint64_t v5 = [(NSMutableString *)self->_components mutableCopy];
  components = v4->_components;
  v4->_components = (NSMutableString *)v5;

  uint64_t v7 = [objc_alloc(MEMORY[0x1E4F1CA48]) initWithArray:self->_componentStack copyItems:1];
  componentStack = v4->_componentStack;
  v4->_componentStack = (NSMutableArray *)v7;

  return v4;
}

- (id)currentComponent
{
  components = [(NSMutableArray *)self->_componentStack lastObject];
  v4 = components;
  if (!components) {
    components = self->_components;
  }
  id v5 = components;

  return v5;
}

- (id)appendEqualsDictionary:(id)a3
{
  id v4 = a3;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __54__PBFSQLiteWhereClauseBuilder_appendEqualsDictionary___block_invoke;
  v8[3] = &unk_1E6984160;
  id v9 = v4;
  v10 = self;
  id v5 = v4;
  objc_super v6 = [(PBFSQLiteWhereClauseBuilder *)self appendExpression:v8 combinator:0];

  return v6;
}

void __54__PBFSQLiteWhereClauseBuilder_appendEqualsDictionary___block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v2 = objc_msgSend(*(id *)(a1 + 32), "keyEnumerator", 0);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v11 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void *)(*((void *)&v10 + 1) + 8 * i);
        v8 = [*(id *)(a1 + 32) objectForKeyedSubscript:v7];
        id v9 = (id)[*(id *)(a1 + 40) appendColumn:v7 comparison:0 toValue:v8 combinator:0];
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v4);
  }
}

- (id)appendColumn:(id)a3 comparison:(unint64_t)a4 toValue:(id)a5 combinator:(unint64_t)a6
{
  id v10 = a3;
  id v11 = a5;
  if (!v10)
  {
    v20 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"columnName"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PBFSQLiteWhereClauseBuilder appendColumn:comparison:toValue:combinator:](a2);
    }
LABEL_16:
    [v20 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1D3297490);
  }
  long long v12 = v11;
  if (!v11)
  {
    v20 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"value"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PBFSQLiteWhereClauseBuilder appendColumn:comparison:toValue:combinator:](a2);
    }
    goto LABEL_16;
  }
  long long v13 = [(PBFSQLiteWhereClauseBuilder *)self currentComponent];
  uint64_t v14 = [v13 length];
  uint64_t v15 = _NSStringFromPBFSQLiteWhereClauseComparison(a4);
  [v13 appendFormat:@"%@ %@", v10, v15];

  if (_WhereClauseComparisonRequiresValue(a4))
  {
    v16 = _NSStringFromPBFSQLiteObjectParameter(v12);
    [v13 appendFormat:@" %@", v16];
  }
  if (v14)
  {
    v17 = _NSStringFromPBFSQLiteWhereClauseComparison(a4);
    if (_WhereClauseComparisonRequiresValue(a4))
    {
      v18 = _NSStringFromPBFSQLiteObjectParameter(v12);
      [v13 appendFormat:@" %@ %@", v17, v18];
    }
    else
    {
      [v13 appendFormat:@" %@ %@", v17, &stru_1F2A71F00];
    }
  }
  return self;
}

- (id)appendExpression:(id)a3 combinator:(unint64_t)a4
{
  id v7 = a3;
  if (v7)
  {
    v8 = (void (**)(void, void))v7;
    componentStack = self->_componentStack;
    if (!componentStack)
    {
      id v10 = (NSMutableArray *)objc_opt_new();
      id v11 = self->_componentStack;
      self->_componentStack = v10;

      componentStack = self->_componentStack;
    }
    long long v12 = objc_opt_new();
    [(NSMutableArray *)componentStack addObject:v12];

    uint64_t v13 = [(NSMutableString *)self->_components length];
    ((void (**)(void, PBFSQLiteWhereClauseBuilder *))v8)[2](v8, self);
    uint64_t v14 = [(NSMutableArray *)self->_componentStack lastObject];
    [(NSMutableArray *)self->_componentStack removeLastObject];
    if (![(NSMutableArray *)self->_componentStack count])
    {
      uint64_t v15 = self->_componentStack;
      self->_componentStack = 0;
    }
    components = self->_components;
    if (v13)
    {
      v17 = _NSStringFromPBFSQLiteWhereClauseCombinator(a4);
      [(NSMutableString *)components appendFormat:@"%@ (%@)", v17, v14];
    }
    else
    {
      [(NSMutableString *)components appendFormat:@"(%@)", v14];
    }

    return self;
  }
  else
  {
    v19 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"expressionBlock"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PBFSQLiteWhereClauseBuilder appendExpression:combinator:](a2);
    }
    [v19 UTF8String];
    id result = (id)_bs_set_crash_log_message();
    __break(0);
  }
  return result;
}

- (id)build
{
  v2 = (void *)[(NSMutableString *)self->_components copy];
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_componentStack, 0);
  objc_storeStrong((id *)&self->_components, 0);
}

- (void)appendColumn:(const char *)a1 comparison:toValue:combinator:.cold.1(const char *a1)
{
  v1 = NSStringFromSelector(a1);
  v2 = (objc_class *)objc_opt_class();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_1D31CE000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)appendColumn:(const char *)a1 comparison:toValue:combinator:.cold.2(const char *a1)
{
  v1 = NSStringFromSelector(a1);
  v2 = (objc_class *)objc_opt_class();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_1D31CE000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)appendExpression:(const char *)a1 combinator:.cold.1(const char *a1)
{
  v1 = NSStringFromSelector(a1);
  v2 = (objc_class *)objc_opt_class();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_1D31CE000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

@end