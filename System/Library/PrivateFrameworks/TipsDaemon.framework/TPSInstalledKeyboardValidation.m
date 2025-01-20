@interface TPSInstalledKeyboardValidation
- (void)validateWithCompletion:(id)a3;
@end

@implementation TPSInstalledKeyboardValidation

- (void)validateWithCompletion:(id)a3
{
  v4 = (void (**)(id, uint64_t, void))a3;
  v5 = [(TPSTargetingValidation *)self arrayValue];
  v6 = [(TPSTargetingValidation *)self value];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v7 = [v6 TPSSafeArrayForKey:@"values"];

    v8 = [v6 TPSSafeStringForKey:@"joinType"];
    if ([v8 isEqualToString:@"AND"])
    {
      uint64_t v9 = 0;
    }
    else
    {
      if (![v8 isEqualToString:@"OR"])
      {
LABEL_7:

        v5 = (void *)v7;
        goto LABEL_8;
      }
      uint64_t v9 = 1;
    }
    [(TPSTargetingValidation *)self setJoinType:v9];
    goto LABEL_7;
  }
LABEL_8:
  int64_t v10 = [(TPSTargetingValidation *)self joinType];
  if (v10 == 1)
  {
    uint64_t v11 = objc_msgSend(v5, "na_any:", &__block_literal_global_13_0);
    goto LABEL_12;
  }
  if (!v10)
  {
    uint64_t v11 = objc_msgSend(v5, "na_all:", &__block_literal_global_10);
LABEL_12:
    uint64_t v12 = v11;
    goto LABEL_14;
  }
  uint64_t v12 = 0;
LABEL_14:
  v13 = [MEMORY[0x1E4FAF480] targeting];
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
    [(TPSDictationLanguageValidation *)self validateWithCompletion:v13];
  }

  v4[2](v4, v12, 0);
}

BOOL __57__TPSInstalledKeyboardValidation_validateWithCompletion___block_invoke(uint64_t a1, uint64_t a2)
{
  return +[TPSKeyboardUtilities isInputModeInstalledForLanguage:a2];
}

BOOL __57__TPSInstalledKeyboardValidation_validateWithCompletion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return +[TPSKeyboardUtilities isInputModeInstalledForLanguage:a2];
}

@end