@interface TPSPreferredLanguageValidation
- (void)validateWithCompletion:(id)a3;
@end

@implementation TPSPreferredLanguageValidation

- (void)validateWithCompletion:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v4 = (void (**)(id, uint64_t, void))a3;
  v5 = [(TPSTargetingValidation *)self stringValue];
  [MEMORY[0x1E4F1CA20] preferredLanguages];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v12;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v6);
        }
        if (objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * i), "hasPrefix:", v5, (void)v11))
        {
          uint64_t v7 = 1;
          goto LABEL_11;
        }
      }
      uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  v10 = [MEMORY[0x1E4FAF480] targeting];
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
    [(TPSDictationLanguageValidation *)self validateWithCompletion:v10];
  }

  v4[2](v4, v7, 0);
}

@end