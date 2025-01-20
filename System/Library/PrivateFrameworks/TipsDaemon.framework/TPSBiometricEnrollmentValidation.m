@interface TPSBiometricEnrollmentValidation
- (void)validateWithCompletion:(id)a3;
@end

@implementation TPSBiometricEnrollmentValidation

- (void)validateWithCompletion:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  int out_token = 0;
  uint64_t v11 = 0;
  v4 = (void (**)(id, uint64_t, void))a3;
  uint32_t v5 = notify_register_check("com.apple.BiometricKit.enrollmentChanged", &out_token);
  if (v5)
  {
    uint32_t v6 = v5;
    v7 = [MEMORY[0x1E4FAF480] targeting];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109120;
      uint32_t v14 = v6;
      _os_log_impl(&dword_1E4492000, v7, OS_LOG_TYPE_INFO, "notify_register_check failed: %u", buf, 8u);
    }

    uint64_t v8 = 0;
  }
  else
  {
    notify_get_state(out_token, &v11);
    notify_cancel(out_token);
    BOOL v9 = v11 == 0;
    uint64_t v8 = v9 ^ [(TPSTargetingValidation *)self BOOLValue];
  }
  v10 = objc_msgSend(MEMORY[0x1E4FAF480], "targeting", v11);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
    [(TPSDictationLanguageValidation *)self validateWithCompletion:v10];
  }

  v4[2](v4, v8, 0);
}

@end