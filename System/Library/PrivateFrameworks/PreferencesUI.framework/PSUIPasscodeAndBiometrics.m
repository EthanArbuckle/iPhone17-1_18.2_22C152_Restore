@interface PSUIPasscodeAndBiometrics
+ (id)sharedInstance;
- (BOOL)isUnlockEnabled;
@end

@implementation PSUIPasscodeAndBiometrics

+ (id)sharedInstance
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __43__PSUIPasscodeAndBiometrics_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_onceToken_1 != -1) {
    dispatch_once(&sharedInstance_onceToken_1, block);
  }
  v2 = (void *)sharedInstance_sharedInstance_1;
  return v2;
}

uint64_t __43__PSUIPasscodeAndBiometrics_sharedInstance__block_invoke()
{
  sharedInstance_sharedInstance_1 = (uint64_t)objc_alloc_init((Class)objc_opt_class());
  return MEMORY[0x270F9A758]();
}

- (BOOL)isUnlockEnabled
{
  v2 = +[PSUIBiometrics sharedInstance];
  if ([v2 isFingerprintUnlockAllowed])
  {
    v3 = +[PSUIPasscode sharedInstance];
    if ([v3 isPasscodeSet])
    {
      v4 = +[PSUIBiometrics identities];
      if ([v4 count])
      {
        v5 = +[PSUIBiometrics sharedInstance];
        int v6 = [v5 isTouchIDUnlockRestricted] ^ 1;
      }
      else
      {
        LOBYTE(v6) = 0;
      }
    }
    else
    {
      LOBYTE(v6) = 0;
    }
  }
  else
  {
    LOBYTE(v6) = 0;
  }

  return v6;
}

@end