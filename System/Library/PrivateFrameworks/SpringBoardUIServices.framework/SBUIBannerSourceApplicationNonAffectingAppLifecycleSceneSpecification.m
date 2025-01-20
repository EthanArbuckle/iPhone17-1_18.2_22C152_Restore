@interface SBUIBannerSourceApplicationNonAffectingAppLifecycleSceneSpecification
- (BOOL)affectsAppLifecycleIfInternal;
@end

@implementation SBUIBannerSourceApplicationNonAffectingAppLifecycleSceneSpecification

- (BOOL)affectsAppLifecycleIfInternal
{
  return 0;
}

@end