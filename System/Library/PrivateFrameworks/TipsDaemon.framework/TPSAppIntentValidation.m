@interface TPSAppIntentValidation
- (TPSAppIntent)appIntent;
- (TPSAppIntentValidation)initWithAppIntent:(id)a3;
- (void)validateWithCompletion:(id)a3;
@end

@implementation TPSAppIntentValidation

- (TPSAppIntentValidation)initWithAppIntent:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TPSAppIntentValidation;
  v6 = [(TPSAppIntentValidation *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_appIntent, a3);
  }

  return v7;
}

- (void)validateWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [(TPSAppIntent *)self->_appIntent value];
  v6 = objc_alloc_init(TPSAppIntentsHelper);
  v7 = [(TPSAppIntent *)self->_appIntent name];
  v8 = [(TPSAppIntent *)self->_appIntent bundleId];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __49__TPSAppIntentValidation_validateWithCompletion___block_invoke;
  v11[3] = &unk_1E6E6BF60;
  v13 = self;
  id v14 = v4;
  id v12 = v5;
  id v9 = v5;
  id v10 = v4;
  [(TPSAppIntentsHelper *)v6 fetchReturnValueFromIntentNamed:v7 inBundleId:v8 withParameters:0 completionHandler:v11];
}

uint64_t __49__TPSAppIntentValidation_validateWithCompletion___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  if (a3)
  {
    id v4 = *(uint64_t (**)(void))(*(void *)(a1 + 48) + 16);
    return v4();
  }
  else
  {
    char v6 = [a2 isEqual:*(void *)(a1 + 32)];
    v7 = [MEMORY[0x1E4FAF480] targeting];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      __49__TPSAppIntentValidation_validateWithCompletion___block_invoke_cold_1(a1, v6, v7);
    }

    return (*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

- (TPSAppIntent)appIntent
{
  return self->_appIntent;
}

- (void).cxx_destruct
{
}

void __49__TPSAppIntentValidation_validateWithCompletion___block_invoke_cold_1(uint64_t a1, char a2, NSObject *a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  char v6 = [*(id *)(a1 + 40) name];
  v7 = [*(id *)(a1 + 40) targetContext];
  int v8 = 138412802;
  id v9 = v6;
  __int16 v10 = 2112;
  v11 = v7;
  __int16 v12 = 1024;
  int v13 = a2 & 1;
  _os_log_debug_impl(&dword_1E4492000, a3, OS_LOG_TYPE_DEBUG, "%@ - targetContext: %@. Valid: %d", (uint8_t *)&v8, 0x1Cu);
}

@end