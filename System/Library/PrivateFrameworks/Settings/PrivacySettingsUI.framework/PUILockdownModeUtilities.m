@interface PUILockdownModeUtilities
+ (BOOL)getCanSetLockdownMode;
+ (BOOL)getCanShowLockdownMode;
+ (BOOL)isCaptivePortalModeIgnoredForContainerPath:(id)a3;
+ (BOOL)isLockdownModeEnabled;
+ (BOOL)isLockdownModeEnabledInAccount;
+ (void)setCaptivePortalModeIgnoredForContainerPath:(id)a3 ignored:(BOOL)a4;
+ (void)setLockdownModeEnabled:(BOOL)a3 forAllDevices:(BOOL)a4 completion:(id)a5;
@end

@implementation PUILockdownModeUtilities

+ (BOOL)getCanShowLockdownMode
{
  uint64_t v8 = 0;
  v9 = &v8;
  uint64_t v10 = 0x2050000000;
  v2 = (void *)getUMUserManagerClass_softClass;
  uint64_t v11 = getUMUserManagerClass_softClass;
  if (!getUMUserManagerClass_softClass)
  {
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __getUMUserManagerClass_block_invoke;
    v7[3] = &unk_1E6E9C7F8;
    v7[4] = &v8;
    __getUMUserManagerClass_block_invoke((uint64_t)v7);
    v2 = (void *)v9[3];
  }
  id v3 = v2;
  _Block_object_dispose(&v8, 8);
  v4 = [v3 sharedManager];
  int v5 = [v4 isSharedIPad] ^ 1;

  return v5;
}

+ (BOOL)getCanSetLockdownMode
{
  return [MEMORY[0x1E4FB1438] isRunningInStoreDemoMode] ^ 1;
}

+ (BOOL)isLockdownModeEnabled
{
  v2 = [getLockdownModeManagerClass() shared];
  char v3 = [v2 enabled];

  return v3;
}

+ (BOOL)isLockdownModeEnabledInAccount
{
  v2 = [getLockdownModeManagerClass() shared];
  char v3 = [v2 enabledInAccount];

  return v3;
}

+ (void)setLockdownModeEnabled:(BOOL)a3 forAllDevices:(BOOL)a4 completion:(id)a5
{
  BOOL v5 = a4;
  BOOL v6 = a3;
  v15[1] = *MEMORY[0x1E4F143B8];
  id v7 = a5;
  uint64_t v8 = [getLockdownModeManagerClass() shared];
  v14 = @"allDevices";
  v9 = [MEMORY[0x1E4F28ED0] numberWithBool:v5];
  v15[0] = v9;
  uint64_t v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:&v14 count:1];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __76__PUILockdownModeUtilities_setLockdownModeEnabled_forAllDevices_completion___block_invoke;
  v12[3] = &unk_1E6E9C870;
  id v13 = v7;
  id v11 = v7;
  [v8 setEnabled:v6 options:v10 completion:v12];
}

uint64_t __76__PUILockdownModeUtilities_setLockdownModeEnabled_forAllDevices_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

+ (BOOL)isCaptivePortalModeIgnoredForContainerPath:(id)a3
{
  id v3 = a3;
  char v4 = [get_WKSystemPreferencesClass() isCaptivePortalModeIgnored:v3];

  return v4;
}

+ (void)setCaptivePortalModeIgnoredForContainerPath:(id)a3 ignored:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = a3;
  [get_WKSystemPreferencesClass() setCaptivePortalModeIgnored:v5 ignore:v4];
}

@end