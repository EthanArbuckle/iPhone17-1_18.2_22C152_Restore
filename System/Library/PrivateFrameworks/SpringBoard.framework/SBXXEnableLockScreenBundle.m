@interface SBXXEnableLockScreenBundle
@end

@implementation SBXXEnableLockScreenBundle

void ___SBXXEnableLockScreenBundle_block_invoke(uint64_t a1)
{
  v2 = +[SBLockScreenManager sharedInstance];
  int v3 = *(unsigned __int8 *)(a1 + 40);
  id v8 = v2;
  v4 = [v2 lockScreenEnvironment];
  v5 = [v4 pluginPresenter];
  v6 = v5;
  uint64_t v7 = *(void *)(a1 + 32);
  if (v3) {
    [v5 enableLockScreenPluginWithContext:v7];
  }
  else {
    [v5 disableLockScreenPluginWithContext:v7];
  }
}

@end