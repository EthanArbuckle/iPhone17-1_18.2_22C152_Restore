@interface TPSCloudBackupValidation
- (void)validateWithCompletion:(id)a3;
@end

@implementation TPSCloudBackupValidation

- (void)validateWithCompletion:(id)a3
{
  v4 = (objc_class *)MEMORY[0x1E4F78010];
  v5 = (void (**)(id, uint64_t, void))a3;
  v6 = (void *)[[v4 alloc] initWithDelegate:0];
  int v7 = [v6 isBackupEnabled];
  uint64_t v8 = v7 ^ [(TPSTargetingValidation *)self BOOLValue] ^ 1;
  v9 = [MEMORY[0x1E4FAF480] targeting];
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
    [(TPSDictationLanguageValidation *)self validateWithCompletion:v9];
  }

  v5[2](v5, v8, 0);
}

@end