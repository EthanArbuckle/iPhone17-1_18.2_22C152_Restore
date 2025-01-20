@interface SYFeatureEligibility
+ (BOOL)supportsQuickNote;
@end

@implementation SYFeatureEligibility

+ (BOOL)supportsQuickNote
{
  if (supportsQuickNote_onceToken != -1) {
    dispatch_once(&supportsQuickNote_onceToken, &__block_literal_global);
  }
  return supportsQuickNote_supportsQuickNote;
}

uint64_t __41__SYFeatureEligibility_supportsQuickNote__block_invoke()
{
  uint64_t result = MGIsDeviceOneOfType();
  supportsQuickNote_supportsQuickNote = result ^ 1;
  return result;
}

@end