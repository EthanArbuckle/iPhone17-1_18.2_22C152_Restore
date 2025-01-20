@interface _PTPredicateValidator
+ (void)validatorWithPredicate:(uint64_t)a1;
- (uint64_t)evaluate;
- (void)evaluate;
- (void)visitPredicateExpression:(id)a3;
- (void)visitPredicateOperator:(id)a3;
@end

@implementation _PTPredicateValidator

+ (void)validatorWithPredicate:(uint64_t)a1
{
  id v2 = a2;
  self;
  v3 = objc_opt_new();
  v4 = (void *)v3[1];
  v3[1] = v2;

  return v3;
}

- (uint64_t)evaluate
{
  if (result)
  {
    uint64_t v1 = result;
    *(unsigned char *)(result + 16) = 1;
    id v2 = (id *)(result + 8);
    [*(id *)(result + 8) acceptVisitor:result flags:3];
    if (*(unsigned char *)(v1 + 16))
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG)) {
        -[_PTPredicateValidator evaluate](v2);
      }
    }
    else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      -[_PTPredicateValidator evaluate](v2);
    }
    return *(unsigned char *)(v1 + 16) != 0;
  }
  return result;
}

- (void)visitPredicateExpression:(id)a3
{
  id v5 = a3;
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG)) {
    -[_PTPredicateValidator visitPredicateExpression:](a2, v5);
  }
  unint64_t v6 = [v5 expressionType];
  if (v6 <= 0x14 && ((1 << v6) & 0x181010) != 0) {
    self->_valid = 0;
  }
}

- (void)visitPredicateOperator:(id)a3
{
  id v5 = a3;
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG)) {
    -[_PTPredicateValidator visitPredicateOperator:](a2, v5);
  }
  if ([v5 operatorType] == 11) {
    self->_valid = 0;
  }
}

- (void).cxx_destruct
{
}

- (void)evaluate
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  uint64_t v1 = [*a1 predicateFormat];
  int v2 = 138543362;
  v3 = v1;
  _os_log_debug_impl(&dword_1BEC4F000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "Predicate passed validation: %{public}@", (uint8_t *)&v2, 0xCu);
}

- (void)visitPredicateExpression:(const char *)a1 .cold.1(const char *a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v3 = NSStringFromSelector(a1);
  uint64_t v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  [a2 expressionType];
  OUTLINED_FUNCTION_0_0();
  _os_log_debug_impl(&dword_1BEC4F000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "[PTPredicate] %@ %@ (%lu) %@", v6, 0x2Au);
}

- (void)visitPredicateOperator:(const char *)a1 .cold.1(const char *a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v3 = NSStringFromSelector(a1);
  uint64_t v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  [a2 operatorType];
  OUTLINED_FUNCTION_0_0();
  _os_log_debug_impl(&dword_1BEC4F000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "[PTPredicate] %@ %@ (%lu) %@", v6, 0x2Au);
}

@end