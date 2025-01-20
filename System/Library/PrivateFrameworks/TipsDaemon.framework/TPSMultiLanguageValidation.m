@interface TPSMultiLanguageValidation
- (void)validateWithCompletion:(id)a3;
@end

@implementation TPSMultiLanguageValidation

- (void)validateWithCompletion:(id)a3
{
  v4 = (void *)MEMORY[0x1E4F1CA20];
  v5 = (void (**)(id, uint64_t, void))a3;
  v6 = [v4 preferredLanguages];
  BOOL v7 = (unint64_t)[v6 count] < 2;

  uint64_t v8 = v7 ^ [(TPSTargetingValidation *)self BOOLValue];
  v9 = [MEMORY[0x1E4FAF480] targeting];
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
    [(TPSDictationLanguageValidation *)self validateWithCompletion:v9];
  }

  v5[2](v5, v8, 0);
}

@end