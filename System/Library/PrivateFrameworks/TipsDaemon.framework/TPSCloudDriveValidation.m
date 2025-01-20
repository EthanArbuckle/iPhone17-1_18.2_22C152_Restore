@interface TPSCloudDriveValidation
- (void)validateWithCompletion:(id)a3;
@end

@implementation TPSCloudDriveValidation

- (void)validateWithCompletion:(id)a3
{
  uint64_t v4 = *MEMORY[0x1E4F17B38];
  v5 = (void (**)(id, uint64_t, void))a3;
  BOOL v6 = +[TPSCloudAccountChecker isiCloudDataClassEnabled:v4];
  uint64_t v7 = v6 ^ [(TPSTargetingValidation *)self BOOLValue] ^ 1;
  v8 = [MEMORY[0x1E4FAF480] targeting];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    [(TPSDictationLanguageValidation *)self validateWithCompletion:v8];
  }

  v5[2](v5, v7, 0);
}

@end