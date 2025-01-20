@interface FBSDisplayLayoutElement(SMUSystemDisplayLayoutElement)
- (BOOL)smu_isBrightnessControlHUD;
- (BOOL)smu_isPictureInPicture;
- (BOOL)smu_isSystemOverlay;
- (BOOL)smu_isVolumeHUD;
- (id)extendedDescription;
- (uint64_t)smu_isControlCenter;
- (uint64_t)smu_isSystemIndicator;
- (uint64_t)smu_isSystemNotification;
@end

@implementation FBSDisplayLayoutElement(SMUSystemDisplayLayoutElement)

- (BOOL)smu_isPictureInPicture
{
  return [a1 layoutRole] == 5;
}

- (id)extendedDescription
{
  v2 = (void *)MEMORY[0x263F089D8];
  v3 = (objc_class *)objc_opt_class();
  v4 = NSStringFromClass(v3);
  v5 = [a1 identifier];
  v6 = [a1 bundleIdentifier];
  uint64_t v7 = [a1 level];
  [a1 frame];
  v8 = NSStringFromCGRect(v13);
  v9 = [v2 stringWithFormat:@"<%@: %p> identifier=%@, bundle=%@, level=%lu, frame=%@", v4, a1, v5, v6, v7, v8];

  [a1 layoutRole];
  v10 = SBSDisplayLayoutRoleDescription();
  [v9 appendFormat:@", role=%@", v10];

  if (objc_msgSend(a1, "smu_isPictureInPicture")) {
    [v9 appendFormat:@", %s", "isPictureInPicture"];
  }
  if (objc_msgSend(a1, "smu_isPictureInPictureStashed")) {
    [v9 appendFormat:@", %s", "isPictureInPictureStashed"];
  }
  if (objc_msgSend(a1, "smu_isSystemOverlay")) {
    [v9 appendFormat:@", %s", "isSystemOverlay"];
  }
  if (objc_msgSend(a1, "smu_isSystemIndicator")) {
    [v9 appendFormat:@", %s", "isSystemIndicator"];
  }
  if (objc_msgSend(a1, "smu_isControlCenter")) {
    [v9 appendFormat:@", %s", "isControlCenter"];
  }
  if (objc_msgSend(a1, "smu_isVolumeHUD")) {
    [v9 appendFormat:@", %s", "isVolumeHUD"];
  }
  if (objc_msgSend(a1, "smu_isSystemNotification")) {
    [v9 appendFormat:@", %s", "isSystemNotification"];
  }
  if (objc_msgSend(a1, "smu_isBrightnessControlHUD")) {
    [v9 appendFormat:@", %s", "isBrightnessControlHUD"];
  }

  return v9;
}

- (BOOL)smu_isVolumeHUD
{
  v1 = [a1 identifier];
  BOOL v2 = v1 == (void *)*MEMORY[0x263F79528];

  return v2;
}

- (BOOL)smu_isSystemOverlay
{
  return [a1 layoutRole] == 4;
}

- (uint64_t)smu_isSystemNotification
{
  return 0;
}

- (uint64_t)smu_isSystemIndicator
{
  return 0;
}

- (uint64_t)smu_isControlCenter
{
  return 0;
}

- (BOOL)smu_isBrightnessControlHUD
{
  v1 = [a1 identifier];
  BOOL v2 = v1 == (void *)*MEMORY[0x263F79520];

  return v2;
}

@end