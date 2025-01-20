@interface TPSDualSimValidation
- (void)validateWithCompletion:(id)a3;
@end

@implementation TPSDualSimValidation

- (void)validateWithCompletion:(id)a3
{
  v4 = (void (**)(id, uint64_t, void))a3;
  uint64_t v15 = 0;
  v16 = &v15;
  uint64_t v17 = 0x2050000000;
  v5 = (void *)getCoreTelephonyClientClass_softClass_1;
  uint64_t v18 = getCoreTelephonyClientClass_softClass_1;
  if (!getCoreTelephonyClientClass_softClass_1)
  {
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __getCoreTelephonyClientClass_block_invoke_1;
    v14[3] = &unk_1E6E6AE20;
    v14[4] = &v15;
    __getCoreTelephonyClientClass_block_invoke_1((uint64_t)v14);
    v5 = (void *)v16[3];
  }
  v6 = v5;
  _Block_object_dispose(&v15, 8);
  id v7 = [v6 alloc];
  v8 = (void *)[v7 initWithQueue:MEMORY[0x1E4F14428]];
  id v13 = 0;
  uint64_t v9 = [v8 getDualSimCapability:&v13];
  id v10 = v13;
  uint64_t v11 = (v9 == 3) ^ [(TPSTargetingValidation *)self BOOLValue];
  v12 = [MEMORY[0x1E4FAF480] targeting];
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
    [(TPSDualSimValidation *)self validateWithCompletion:v12];
  }

  v4[2](v4, v11, 0);
}

- (void)validateWithCompletion:(NSObject *)a3 .cold.1(void *a1, char a2, NSObject *a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  v6 = [a1 name];
  id v7 = [a1 targetContext];
  int v8 = 138412802;
  uint64_t v9 = v6;
  __int16 v10 = 2112;
  uint64_t v11 = v7;
  __int16 v12 = 1024;
  int v13 = a2 & 1;
  _os_log_debug_impl(&dword_1E4492000, a3, OS_LOG_TYPE_DEBUG, "%@ - targetContext: %@. Valid: %d", (uint8_t *)&v8, 0x1Cu);
}

@end