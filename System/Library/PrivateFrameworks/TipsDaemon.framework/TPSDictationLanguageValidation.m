@interface TPSDictationLanguageValidation
- (void)validateWithCompletion:(id)a3;
@end

@implementation TPSDictationLanguageValidation

- (void)validateWithCompletion:(id)a3
{
  v4 = (void (**)(id, uint64_t, void))a3;
  if (!+[TPSKeyboardUtilities isDictationEnabled])
  {
    uint64_t v9 = 0;
    goto LABEL_13;
  }
  v5 = [(TPSTargetingValidation *)self value];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v6 = [v5 TPSSafeArrayForKey:@"values"];
    v7 = [v5 TPSSafeStringForKey:@"joinType"];
    if ([v7 isEqualToString:@"AND"])
    {
      uint64_t v8 = objc_msgSend(v6, "na_all:", &__block_literal_global);
    }
    else
    {
      if (![v7 isEqualToString:@"OR"])
      {
        uint64_t v9 = 0;
        goto LABEL_11;
      }
      uint64_t v8 = objc_msgSend(v6, "na_any:", &__block_literal_global_13);
    }
    uint64_t v9 = v8;
LABEL_11:

    goto LABEL_12;
  }
  uint64_t v9 = 0;
LABEL_12:

LABEL_13:
  v10 = [MEMORY[0x1E4FAF480] targeting];
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
    [(TPSDictationLanguageValidation *)self validateWithCompletion:v10];
  }

  v4[2](v4, v9, 0);
}

BOOL __57__TPSDictationLanguageValidation_validateWithCompletion___block_invoke(uint64_t a1, uint64_t a2)
{
  return +[TPSKeyboardUtilities isDictationSelectedForLanguage:a2];
}

BOOL __57__TPSDictationLanguageValidation_validateWithCompletion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return +[TPSKeyboardUtilities isDictationSelectedForLanguage:a2];
}

- (void)validateWithCompletion:(NSObject *)a3 .cold.1(void *a1, char a2, NSObject *a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  v6 = [a1 name];
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