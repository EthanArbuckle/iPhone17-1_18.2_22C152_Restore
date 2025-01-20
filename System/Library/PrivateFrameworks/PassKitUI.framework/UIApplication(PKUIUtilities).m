@interface UIApplication(PKUIUtilities)
- (void)pkui_resetSharedRootAuthenticationContext;
@end

@implementation UIApplication(PKUIUtilities)

- (void)pkui_resetSharedRootAuthenticationContext
{
  uint64_t v5 = 0;
  v6 = &v5;
  uint64_t v7 = 0x2020000000;
  uint64_t v8 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __73__UIApplication_PKUIUtilities__pkui_resetSharedRootAuthenticationContext__block_invoke;
  v4[3] = &unk_1E59CB4B0;
  v4[4] = &v5;
  uint64_t v2 = [a1 beginBackgroundTaskWithExpirationHandler:v4];
  v6[3] = v2;
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __73__UIApplication_PKUIUtilities__pkui_resetSharedRootAuthenticationContext__block_invoke_2;
  v3[3] = &unk_1E59CEDA0;
  v3[4] = a1;
  v3[5] = &v5;
  [MEMORY[0x1E4F88108] resetSharedRootContextWithCompletion:v3];
  _Block_object_dispose(&v5, 8);
}

@end