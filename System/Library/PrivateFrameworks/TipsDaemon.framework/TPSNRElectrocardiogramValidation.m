@interface TPSNRElectrocardiogramValidation
- (void)validateWithCompletion:(id)a3;
@end

@implementation TPSNRElectrocardiogramValidation

- (void)validateWithCompletion:(id)a3
{
  v4 = (void (**)(id, uint64_t, void))a3;
  v5 = +[TPSHealthKitDefines sharedHealthStore];
  uint64_t v15 = 0;
  v16 = &v15;
  uint64_t v17 = 0x2050000000;
  v6 = (void *)getHKHeartRhythmAvailabilityClass_softClass;
  uint64_t v18 = getHKHeartRhythmAvailabilityClass_softClass;
  if (!getHKHeartRhythmAvailabilityClass_softClass)
  {
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __getHKHeartRhythmAvailabilityClass_block_invoke;
    v14[3] = &unk_1E6E6AE20;
    v14[4] = &v15;
    __getHKHeartRhythmAvailabilityClass_block_invoke((uint64_t)v14);
    v6 = (void *)v16[3];
  }
  v7 = v6;
  _Block_object_dispose(&v15, 8);
  id v8 = [v7 alloc];
  v9 = [MEMORY[0x1E4F1CA20] currentLocale];
  v10 = [v9 countryCode];
  v11 = (void *)[v8 initWithHealthStore:v5 currentCountryCode:v10];

  LODWORD(v9) = [v11 shouldAdvertiseElectrocardiogramForActiveWatch];
  uint64_t v12 = v9 ^ [(TPSTargetingValidation *)self BOOLValue] ^ 1;
  v13 = [MEMORY[0x1E4FAF480] targeting];
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
    [(TPSNRElectrocardiogramValidation *)self validateWithCompletion:v13];
  }

  v4[2](v4, v12, 0);
}

- (void)validateWithCompletion:(NSObject *)a3 .cold.1(void *a1, char a2, NSObject *a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  v6 = [a1 name];
  v7 = [a1 targetContext];
  int v8 = 138412802;
  v9 = v6;
  __int16 v10 = 2112;
  v11 = v7;
  __int16 v12 = 1024;
  int v13 = a2 & 1;
  _os_log_debug_impl(&dword_1E4492000, a3, OS_LOG_TYPE_DEBUG, "%@ - targetContext: %@. Valid: %d", (uint8_t *)&v8, 0x1Cu);
}

@end