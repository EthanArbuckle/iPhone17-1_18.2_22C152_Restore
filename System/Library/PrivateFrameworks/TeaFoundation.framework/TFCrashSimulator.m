@interface TFCrashSimulator
- (void)triggerSIGBUS;
- (void)triggerSIGILL;
- (void)triggerSIGSEGV;
@end

@implementation TFCrashSimulator

- (void)triggerSIGBUS
{
  if (isInternalBuild_onceToken[0] != -1) {
    dispatch_once(isInternalBuild_onceToken, &__block_literal_global);
  }
  if (isInternalBuild_internalBuild) {
    *(unsigned char *)dummyfunc = 0;
  }
}

- (void)triggerSIGILL
{
  if (isInternalBuild_onceToken[0] != -1) {
    dispatch_once(isInternalBuild_onceToken, &__block_literal_global);
  }
  if (isInternalBuild_internalBuild) {
    __asm { TLBI            ALLE1 }
  }
}

- (void)triggerSIGSEGV
{
  if (isInternalBuild_onceToken[0] != -1) {
    dispatch_once(isInternalBuild_onceToken, &__block_literal_global);
  }
}

@end