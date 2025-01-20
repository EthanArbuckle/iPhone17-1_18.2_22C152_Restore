@interface _UISceneInterfaceProtectionHostComponent
- (void)configureInitialSettings:(id)a3;
- (void)setUnderAppProtection:(BOOL)a3;
@end

@implementation _UISceneInterfaceProtectionHostComponent

- (void)configureInitialSettings:(id)a3
{
  id v5 = a3;
  v3 = [v5 transientLocalSettings];
  uint64_t v4 = [v3 flagForSetting:20230216];

  if (v4 == 1) {
    [v5 setUnderAppProtection:1];
  }
}

- (void)setUnderAppProtection:(BOOL)a3
{
  uint64_t v4 = [(FBSSceneComponent *)self hostScene];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __66___UISceneInterfaceProtectionHostComponent_setUnderAppProtection___block_invoke;
  v5[3] = &__block_descriptor_33_e75_v16__0__FBSMutableSceneSettings__UISceneInterfaceProtectionSceneSettings__8l;
  BOOL v6 = a3;
  [v4 updateSettingsWithBlock:v5];
}

@end