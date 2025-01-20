@interface TPSExtendedKeyboardValidation
- (void)validateWithCompletion:(id)a3;
@end

@implementation TPSExtendedKeyboardValidation

- (void)validateWithCompletion:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  v4 = (void (**)(id, uint64_t, void))a3;
  v5 = +[TPSKeyboardUtilities installedInputModes];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    id v6 = v5;
    v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v14;
      while (2)
      {
        for (i = 0; i != v7; i = ((char *)i + 1))
        {
          if (*(void *)v14 != v8) {
            objc_enumerationMutation(v6);
          }
          uint64_t v10 = *(void *)(*((void *)&v13 + 1) + 8 * i);
          if (+[TPSKeyboardUtilities isExtendedSuggestionSupportedForInputMode:](TPSKeyboardUtilities, "isExtendedSuggestionSupportedForInputMode:", v10, (void)v13))
          {
            v7 = [MEMORY[0x1E4FAF480] targeting];
            if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
              -[TPSExtendedKeyboardValidation validateWithCompletion:](v10, v7);
            }

            LODWORD(v7) = 1;
            goto LABEL_15;
          }
        }
        v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
        if (v7) {
          continue;
        }
        break;
      }
    }
LABEL_15:
  }
  else
  {
    LODWORD(v7) = 0;
  }
  uint64_t v11 = v7 ^ [(TPSTargetingValidation *)self BOOLValue] ^ 1;
  v12 = [MEMORY[0x1E4FAF480] targeting];
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
    [(TPSDictationLanguageValidation *)self validateWithCompletion:v12];
  }

  v4[2](v4, v11, 0);
}

- (void)validateWithCompletion:(uint64_t)a1 .cold.2(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_1E4492000, a2, OS_LOG_TYPE_DEBUG, "Found keyboard with extended suggestion support: %@", (uint8_t *)&v2, 0xCu);
}

@end