@interface TPSSleepSetupValidation
- (void)validateWithCompletion:(id)a3;
@end

@implementation TPSSleepSetupValidation

- (void)validateWithCompletion:(id)a3
{
  v4 = (void (**)(id, uint64_t, void))a3;
  uint64_t v17 = 0;
  v18 = &v17;
  uint64_t v19 = 0x2050000000;
  v5 = (void *)getHKSPSleepStoreClass_softClass;
  uint64_t v20 = getHKSPSleepStoreClass_softClass;
  if (!getHKSPSleepStoreClass_softClass)
  {
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __getHKSPSleepStoreClass_block_invoke;
    v16[3] = &unk_1E6E6AE20;
    v16[4] = &v17;
    __getHKSPSleepStoreClass_block_invoke((uint64_t)v16);
    v5 = (void *)v18[3];
  }
  v6 = v5;
  _Block_object_dispose(&v17, 8);
  id v7 = objc_alloc_init(v6);
  id v15 = 0;
  v8 = [v7 currentSleepScheduleWithError:&v15];
  id v9 = v15;
  v10 = v9;
  if (v8)
  {
    int v11 = [v8 isEnabled];
    uint64_t v12 = v11 ^ [(TPSTargetingValidation *)self BOOLValue] ^ 1;
  }
  else
  {
    if (v9)
    {
      v13 = [MEMORY[0x1E4FAF480] targeting];
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
        -[TPSSleepSetupValidation validateWithCompletion:]((uint64_t)v10, v13);
      }
    }
    uint64_t v12 = 0;
  }
  v14 = [MEMORY[0x1E4FAF480] targeting];
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
    [(TPSSleepSetupValidation *)self validateWithCompletion:v14];
  }

  v4[2](v4, v12, 0);
}

- (void)validateWithCompletion:(NSObject *)a3 .cold.1(void *a1, char a2, NSObject *a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  v6 = [a1 name];
  id v7 = [a1 targetContext];
  int v8 = 138412802;
  id v9 = v6;
  __int16 v10 = 2112;
  int v11 = v7;
  __int16 v12 = 1024;
  int v13 = a2 & 1;
  _os_log_debug_impl(&dword_1E4492000, a3, OS_LOG_TYPE_DEBUG, "%@ - targetContext: %@. Valid: %d", (uint8_t *)&v8, 0x1Cu);
}

- (void)validateWithCompletion:(uint64_t)a1 .cold.2(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_1E4492000, a2, OS_LOG_TYPE_DEBUG, "Failed to query sleep schedule: %@", (uint8_t *)&v2, 0xCu);
}

@end