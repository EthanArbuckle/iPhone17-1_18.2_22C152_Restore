@interface SBSUIScreenSharingOverlaySceneClientSettingsExtension
+ (id)protocol;
+ (id)valueForUndefinedSetting:(id)a3;
@end

@implementation SBSUIScreenSharingOverlaySceneClientSettingsExtension

+ (id)protocol
{
  return &unk_1EFD5ACC0;
}

+ (id)valueForUndefinedSetting:(id)a3
{
  id v4 = a3;
  if ([v4 matchesProperty:sel_preferredSystemRootTransform])
  {
    long long v5 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
    v10[0] = *MEMORY[0x1E4F1DAB8];
    v10[1] = v5;
    v10[2] = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
    uint64_t v6 = [MEMORY[0x1E4F29238] valueWithCGAffineTransform:v10];
  }
  else
  {
    v9.receiver = a1;
    v9.super_class = (Class)&OBJC_METACLASS___SBSUIScreenSharingOverlaySceneClientSettingsExtension;
    uint64_t v6 = objc_msgSendSuper2(&v9, sel_valueForUndefinedSetting_, v4);
  }
  v7 = (void *)v6;

  return v7;
}

@end