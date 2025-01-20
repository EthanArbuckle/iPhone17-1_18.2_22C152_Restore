@interface TPSCustomizedKeyboardValidation
- (void)validateWithCompletion:(id)a3;
@end

@implementation TPSCustomizedKeyboardValidation

- (void)validateWithCompletion:(id)a3
{
  v4 = (void (**)(id, uint64_t, void))a3;
  BOOL v5 = +[TPSKeyboardUtilities hasCustomizedKeyboard];
  uint64_t v6 = v5 ^ [(TPSTargetingValidation *)self BOOLValue] ^ 1;
  v7 = [MEMORY[0x1E4FAF480] targeting];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    [(TPSDictationLanguageValidation *)self validateWithCompletion:v7];
  }

  v4[2](v4, v6, 0);
}

@end