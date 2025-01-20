@interface TPSPairedLargeHomePodValidation
- (void)validateWithCompletion:(id)a3;
@end

@implementation TPSPairedLargeHomePodValidation

- (void)validateWithCompletion:(id)a3
{
  v4 = (void (**)(id, uint64_t, void))a3;
  uint64_t v10 = 0;
  v11 = &v10;
  uint64_t v12 = 0x2050000000;
  v5 = (void *)getHMClientConnectionClass_softClass_0;
  uint64_t v13 = getHMClientConnectionClass_softClass_0;
  if (!getHMClientConnectionClass_softClass_0)
  {
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __getHMClientConnectionClass_block_invoke_0;
    v9[3] = &unk_1E6E6AE20;
    v9[4] = &v10;
    __getHMClientConnectionClass_block_invoke_0((uint64_t)v9);
    v5 = (void *)v11[3];
  }
  id v6 = v5;
  _Block_object_dispose(&v10, 8);
  uint64_t v7 = [v6 areAnyLargeHomePodConfigured];
  v8 = [MEMORY[0x1E4FAF480] targeting];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    [(TPSPairedLargeHomePodValidation *)self validateWithCompletion:v8];
  }

  v4[2](v4, v7, 0);
}

- (void)validateWithCompletion:(NSObject *)a3 .cold.1(void *a1, char a2, NSObject *a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v6 = [a1 name];
  uint64_t v7 = [a1 targetContext];
  int v8 = 138412802;
  v9 = v6;
  __int16 v10 = 2112;
  v11 = v7;
  __int16 v12 = 1024;
  int v13 = a2 & 1;
  _os_log_debug_impl(&dword_1E4492000, a3, OS_LOG_TYPE_DEBUG, "%@ - targetContext: %@. Valid: %d", (uint8_t *)&v8, 0x1Cu);
}

@end