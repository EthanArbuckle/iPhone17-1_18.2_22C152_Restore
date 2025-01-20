@interface TPSHealthChecklistAvailableValidation
- (void)validateWithCompletion:(id)a3;
@end

@implementation TPSHealthChecklistAvailableValidation

- (void)validateWithCompletion:(id)a3
{
  v4 = (void (**)(id, uint64_t, void))a3;
  uint64_t v12 = 0;
  v13 = &v12;
  uint64_t v14 = 0x2050000000;
  v5 = (void *)getHKHealthChecklistUtilitiesClass_softClass;
  uint64_t v15 = getHKHealthChecklistUtilitiesClass_softClass;
  if (!getHKHealthChecklistUtilitiesClass_softClass)
  {
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __getHKHealthChecklistUtilitiesClass_block_invoke;
    v11[3] = &unk_1E6E6AE20;
    v11[4] = &v12;
    __getHKHealthChecklistUtilitiesClass_block_invoke((uint64_t)v11);
    v5 = (void *)v13[3];
  }
  id v6 = v5;
  _Block_object_dispose(&v12, 8);
  v7 = [v6 shared];
  int v8 = [v7 isHealthChecklistAvailable];

  uint64_t v9 = v8 ^ [(TPSTargetingValidation *)self BOOLValue] ^ 1;
  v10 = [MEMORY[0x1E4FAF480] targeting];
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
    [(TPSHealthChecklistAvailableValidation *)self validateWithCompletion:v10];
  }

  v4[2](v4, v9, 0);
}

- (void)validateWithCompletion:(NSObject *)a3 .cold.1(void *a1, char a2, NSObject *a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v6 = [a1 name];
  v7 = [a1 targetContext];
  int v8 = 138412802;
  uint64_t v9 = v6;
  __int16 v10 = 2112;
  v11 = v7;
  __int16 v12 = 1024;
  int v13 = a2 & 1;
  _os_log_debug_impl(&dword_1E4492000, a3, OS_LOG_TYPE_DEBUG, "%@ - targetContext: %@. Valid: %d", (uint8_t *)&v8, 0x1Cu);
}

@end