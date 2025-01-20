@interface TPSTargetingValidateOperation
- (NSString)context;
- (TPSTargetingValidateOperation)initWithTargetingCondition:(id)a3;
- (TPSTargetingValidation)validator;
- (id)description;
- (int64_t)result;
- (void)cancel;
- (void)main;
- (void)setContext:(id)a3;
- (void)setResult:(int64_t)a3;
@end

@implementation TPSTargetingValidateOperation

- (void)setContext:(id)a3
{
}

- (TPSTargetingValidateOperation)initWithTargetingCondition:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TPSTargetingValidateOperation;
  v6 = [(TPSAsyncOperation *)&v9 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_validator, a3);
    v7->_result = -1;
  }

  return v7;
}

void __37__TPSTargetingValidateOperation_main__block_invoke(uint64_t a1, unsigned int a2, void *a3)
{
  id v5 = a3;
  if (!v5) {
    [*(id *)(a1 + 32) setResult:a2];
  }
  v7 = *(void **)(a1 + 32);
  v6 = (id *)(a1 + 32);
  [v7 finishWithError:v5];
  v8 = [MEMORY[0x1E4FAF480] targeting];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    __37__TPSTargetingValidateOperation_main__block_invoke_cold_1(v6);
  }
}

- (void)setResult:(int64_t)a3
{
  self->_result = a3;
}

- (int64_t)result
{
  if ([(TPSAsyncOperation *)self isCancelled]) {
    return -1;
  }
  v3 = [(TPSAsyncOperation *)self error];

  if (v3) {
    return -1;
  }
  else {
    return self->_result;
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_context, 0);

  objc_storeStrong((id *)&self->_validator, 0);
}

- (void)cancel
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_1E4492000, a2, OS_LOG_TYPE_DEBUG, "cancelling...%@", (uint8_t *)&v2, 0xCu);
}

- (void)main
{
  int v2 = [a1 context];
  uint64_t v3 = [a1 validator];
  [a1 result];
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_3();
  _os_log_debug_impl(v4, v5, v6, v7, v8, 0x20u);
}

- (TPSTargetingValidation)validator
{
  return self->_validator;
}

- (id)description
{
  uint64_t v3 = NSString;
  uint64_t v4 = (objc_class *)objc_opt_class();
  os_log_t v5 = NSStringFromClass(v4);
  os_log_type_t v6 = [(TPSTargetingValidateOperation *)self validator];
  v7 = [(TPSTargetingValidateOperation *)self context];
  v8 = [v3 stringWithFormat:@"<%@: %p validator = %@; context = %@;>", v5, self, v6, v7];;

  return v8;
}

- (NSString)context
{
  return self->_context;
}

void __37__TPSTargetingValidateOperation_main__block_invoke_cold_1(id *a1)
{
  int v2 = [*a1 context];
  v8 = [*a1 validator];
  [*a1 result];
  OUTLINED_FUNCTION_0_3();
  _os_log_debug_impl(v3, v4, v5, v6, v7, 0x2Au);
}

@end