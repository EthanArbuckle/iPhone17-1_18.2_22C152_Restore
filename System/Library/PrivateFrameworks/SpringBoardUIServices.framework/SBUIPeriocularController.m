@interface SBUIPeriocularController
+ (id)sharedInstance;
- (BOOL)periocularEnabled;
@end

@implementation SBUIPeriocularController

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_3 != -1) {
    dispatch_once(&sharedInstance_onceToken_3, &__block_literal_global_43);
  }
  v2 = (void *)sharedInstance___sharedInstance_3;
  return v2;
}

uint64_t __42__SBUIPeriocularController_sharedInstance__block_invoke()
{
  v0 = objc_alloc_init(SBUIPeriocularController);
  uint64_t v1 = sharedInstance___sharedInstance_3;
  sharedInstance___sharedInstance_3 = (uint64_t)v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

- (BOOL)periocularEnabled
{
  v2 = +[SBUIBiometricResource sharedInstance];
  char v3 = [v2 isPeriocularMatchingEnabled];

  return v3;
}

@end