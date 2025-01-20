@interface TPSAppEntityValidation
- (TPSAppEntity)appEntity;
- (TPSAppEntityValidation)initWithAppEntity:(id)a3;
- (void)validateWithCompletion:(id)a3;
@end

@implementation TPSAppEntityValidation

- (TPSAppEntityValidation)initWithAppEntity:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TPSAppEntityValidation;
  v6 = [(TPSAppEntityValidation *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_appEntity, a3);
  }

  return v7;
}

- (void)validateWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [(TPSAppEntity *)self->_appEntity value];
  v6 = objc_alloc_init(TPSAppIntentsHelper);
  v7 = [(TPSAppEntity *)self->_appEntity name];
  v8 = [(TPSAppEntity *)self->_appEntity bundleId];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __49__TPSAppEntityValidation_validateWithCompletion___block_invoke;
  v11[3] = &unk_1E6E6BF60;
  v13 = self;
  id v14 = v4;
  id v12 = v5;
  id v9 = v5;
  id v10 = v4;
  [(TPSAppIntentsHelper *)v6 fetchReturnValueFromEntityNamed:v7 inBundleId:v8 withParameters:0 completionHandler:v11];
}

uint64_t __49__TPSAppEntityValidation_validateWithCompletion___block_invoke(uint64_t a1, void *a2, uint64_t a3)
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

- (TPSAppEntity)appEntity
{
  return self->_appEntity;
}

- (void).cxx_destruct
{
}

@end