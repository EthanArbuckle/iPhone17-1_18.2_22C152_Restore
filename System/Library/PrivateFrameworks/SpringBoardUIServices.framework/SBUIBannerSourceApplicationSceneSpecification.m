@interface SBUIBannerSourceApplicationSceneSpecification
+ (id)specificationAffectingAppLifecycleIfInternal:(BOOL)a3;
- (Class)clientSettingsClass;
- (id)defaultExtensions;
@end

@implementation SBUIBannerSourceApplicationSceneSpecification

+ (id)specificationAffectingAppLifecycleIfInternal:(BOOL)a3
{
  if (!a3) {
    a1 = SBUIBannerSourceApplicationNonAffectingAppLifecycleSceneSpecification;
  }
  v3 = [a1 specification];
  return v3;
}

- (id)defaultExtensions
{
  v11[1] = *MEMORY[0x1E4F143B8];
  uint64_t v7 = 0;
  v8 = &v7;
  uint64_t v9 = 0x2050000000;
  v2 = (void *)getAMUIAmbientPresentationSceneExtensionClass_softClass;
  uint64_t v10 = getAMUIAmbientPresentationSceneExtensionClass_softClass;
  if (!getAMUIAmbientPresentationSceneExtensionClass_softClass)
  {
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __getAMUIAmbientPresentationSceneExtensionClass_block_invoke;
    v6[3] = &unk_1E5CCC5D0;
    v6[4] = &v7;
    __getAMUIAmbientPresentationSceneExtensionClass_block_invoke((uint64_t)v6);
    v2 = (void *)v8[3];
  }
  id v3 = v2;
  _Block_object_dispose(&v7, 8);
  v11[0] = objc_opt_class();
  v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:1];
  return v4;
}

- (Class)clientSettingsClass
{
  return (Class)objc_opt_class();
}

@end