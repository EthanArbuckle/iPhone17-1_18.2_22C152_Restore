@interface ACFLocalAuthenticationContext
- (BOOL)canEvaluatePolicy:(int64_t)a3 error:(id *)a4;
- (LAContext)context;
- (NSString)localizedFallbackTitle;
- (NSString)localizedReason;
- (void)dealloc;
- (void)evaluatePolicy:(int64_t)a3 completion:(id)a4;
- (void)reset;
- (void)setContext:(id)a3;
- (void)setLocalizedFallbackTitle:(id)a3;
- (void)setLocalizedReason:(id)a3;
@end

@implementation ACFLocalAuthenticationContext

- (void)dealloc
{
  [(ACFLocalAuthenticationContext *)self setContext:0];
  [(ACFLocalAuthenticationContext *)self setLocalizedReason:0];
  [(ACFLocalAuthenticationContext *)self setLocalizedFallbackTitle:0];
  v3.receiver = self;
  v3.super_class = (Class)ACFLocalAuthenticationContext;
  [(ACFLocalAuthenticationContext *)&v3 dealloc];
}

- (LAContext)context
{
  result = self->_context;
  if (!result)
  {
    result = (LAContext *)objc_opt_new();
    self->_context = result;
  }
  return result;
}

- (BOOL)canEvaluatePolicy:(int64_t)a3 error:(id *)a4
{
  return [(LAContext *)[(ACFLocalAuthenticationContext *)self context] canEvaluatePolicy:a3 error:a4];
}

- (void)evaluatePolicy:(int64_t)a3 completion:(id)a4
{
  if (!a4) {
    [((id)objc_msgSend(MEMORY[0x263F08690], "currentHandler")) handleFailureInMethod:a2 object:self file:@"ACFLocalAuthenticationContext.m" lineNumber:62 description:@"Completion block should not equal to nil"];
  }
  id v7 = (id)[a4 copy];
  if ([(ACFLocalAuthenticationContext *)self localizedFallbackTitle]) {
    [(LAContext *)[(ACFLocalAuthenticationContext *)self context] setLocalizedFallbackTitle:[(ACFLocalAuthenticationContext *)self localizedFallbackTitle]];
  }
  v8 = [(ACFLocalAuthenticationContext *)self context];
  v9 = [(ACFLocalAuthenticationContext *)self localizedReason];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __59__ACFLocalAuthenticationContext_evaluatePolicy_completion___block_invoke;
  v10[3] = &unk_265043E98;
  v10[4] = v7;
  [(LAContext *)v8 evaluatePolicy:a3 localizedReason:v9 reply:v10];
}

void __59__ACFLocalAuthenticationContext_evaluatePolicy_completion___block_invoke(uint64_t a1, char a2, uint64_t a3)
{
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __59__ACFLocalAuthenticationContext_evaluatePolicy_completion___block_invoke_2;
  v4[3] = &unk_265043E70;
  uint64_t v3 = *(void *)(a1 + 32);
  char v5 = a2;
  v4[4] = a3;
  v4[5] = v3;
  dispatch_async_on_main_thread((uint64_t)v4);
}

uint64_t __59__ACFLocalAuthenticationContext_evaluatePolicy_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(void *)(a1 + 32));
}

- (void)reset
{
}

- (void)setContext:(id)a3
{
}

- (NSString)localizedReason
{
  return self->_localizedReason;
}

- (void)setLocalizedReason:(id)a3
{
}

- (NSString)localizedFallbackTitle
{
  return self->_localizedFallbackTitle;
}

- (void)setLocalizedFallbackTitle:(id)a3
{
}

@end