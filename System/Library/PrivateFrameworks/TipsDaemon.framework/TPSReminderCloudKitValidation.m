@interface TPSReminderCloudKitValidation
- (void)validateWithCompletion:(id)a3;
@end

@implementation TPSReminderCloudKitValidation

- (void)validateWithCompletion:(id)a3
{
  v4 = (objc_class *)MEMORY[0x1E4F94CB8];
  v5 = (void (**)(id, void, id))a3;
  id v6 = objc_alloc_init(v4);
  id v11 = 0;
  int v7 = [v6 hasActiveCloudKitAccountForTipKitWithError:&v11];
  id v8 = v11;
  uint64_t v9 = v7 ^ [(TPSTargetingValidation *)self BOOLValue] ^ 1;
  v10 = [MEMORY[0x1E4FAF480] targeting];
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
    [(TPSDictationLanguageValidation *)self validateWithCompletion:v10];
  }

  v5[2](v5, v9, v8);
}

@end