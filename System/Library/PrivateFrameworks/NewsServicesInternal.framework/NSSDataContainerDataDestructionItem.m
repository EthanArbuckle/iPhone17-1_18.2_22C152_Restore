@interface NSSDataContainerDataDestructionItem
- (NSSDataContainerDataDestructionItem)init;
- (NSSDataContainerDataDestructionItem)initWithContainerClass:(unint64_t)a3 identifier:(const char *)a4;
- (const)identifier;
- (unint64_t)containerClass;
- (void)setContainerClass:(unint64_t)a3;
- (void)setIdentifier:(const char *)a3;
@end

@implementation NSSDataContainerDataDestructionItem

- (NSSDataContainerDataDestructionItem)init
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v2 = (void *)[[NSString alloc] initWithFormat:@"Do not call method"];
    *(_DWORD *)buf = 136315906;
    v8 = "-[NSSDataContainerDataDestructionItem init]";
    __int16 v9 = 2080;
    v10 = "NSSNewsDataDestruction.m";
    __int16 v11 = 1024;
    int v12 = 101;
    __int16 v13 = 2114;
    v14 = v2;
    _os_log_error_impl(&dword_1E0102000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3B8];
  v5 = [NSString stringWithFormat:@"%@: %s", @"Do not call method", "-[NSSDataContainerDataDestructionItem init]"];
  id v6 = [v3 exceptionWithName:v4 reason:v5 userInfo:0];

  objc_exception_throw(v6);
}

- (NSSDataContainerDataDestructionItem)initWithContainerClass:(unint64_t)a3 identifier:(const char *)a4
{
  if (!a4 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
    -[NSSDataContainerDataDestructionItem initWithContainerClass:identifier:]();
  }
  v8.receiver = self;
  v8.super_class = (Class)NSSDataContainerDataDestructionItem;
  result = [(NSSDataContainerDataDestructionItem *)&v8 init];
  if (result)
  {
    result->_containerClass = a3;
    result->_identifier = a4;
  }
  return result;
}

- (unint64_t)containerClass
{
  return self->_containerClass;
}

- (void)setContainerClass:(unint64_t)a3
{
  self->_containerClass = a3;
}

- (const)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(const char *)a3
{
  self->_identifier = a3;
}

- (void)initWithContainerClass:identifier:.cold.1()
{
  v0 = (void *)[[NSString alloc] initWithFormat:@"Invalid parameter not satisfying %s"];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E0102000, MEMORY[0x1E4F14500], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"identifier", v6, 2u);
}

@end