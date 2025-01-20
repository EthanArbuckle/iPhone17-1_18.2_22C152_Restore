@interface TPSContactsMeCardValidation
- (void)validateWithCompletion:(id)a3;
@end

@implementation TPSContactsMeCardValidation

- (void)validateWithCompletion:(id)a3
{
  v13[1] = *MEMORY[0x1E4F143B8];
  v4 = (void *)MEMORY[0x1E4FAF3F8];
  v5 = (void (**)(id, void, id))a3;
  if ([v4 isGreenTeaDevice])
  {
    v6 = [MEMORY[0x1E4FAF480] targeting];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      -[TPSContactsMeCardValidation validateWithCompletion:](self, v6);
    }
    id v7 = 0;
    uint64_t v8 = 0;
  }
  else
  {
    v6 = objc_alloc_init(MEMORY[0x1E4F1B980]);
    v13[0] = *MEMORY[0x1E4F1AE08];
    v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:1];
    id v12 = 0;
    v10 = [v6 _crossPlatformUnifiedMeContactWithKeysToFetch:v9 error:&v12];
    id v7 = v12;

    uint64_t v8 = (v10 == 0) ^ [(TPSTargetingValidation *)self BOOLValue];
  }

  v11 = [MEMORY[0x1E4FAF480] targeting];
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
    [(TPSDictationLanguageValidation *)self validateWithCompletion:v11];
  }

  v5[2](v5, v8, v7);
}

- (void)validateWithCompletion:(void *)a1 .cold.2(void *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v3 = [a1 name];
  int v4 = 138412290;
  v5 = v3;
  _os_log_debug_impl(&dword_1E4492000, a2, OS_LOG_TYPE_DEBUG, "Skipping %@ validation", (uint8_t *)&v4, 0xCu);
}

@end