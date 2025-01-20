@interface SBSUserNotificationSystemImageDefinition(SBUserNotificationImageResolving)
- (id)sb_resolvedImage;
- (id)sb_resolvedTintColor;
- (void)sb_resolvedImage;
@end

@implementation SBSUserNotificationSystemImageDefinition(SBUserNotificationImageResolving)

- (id)sb_resolvedImage
{
  v1 = [a1 systemImageName];
  v2 = [MEMORY[0x1E4F42A80] _systemImageNamed:v1];
  if (!v2)
  {
    v3 = SBLogAlertItems();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      [(SBSUserNotificationSystemImageDefinition(SBUserNotificationImageResolving) *)(uint64_t)v1 sb_resolvedImage];
    }
  }
  return v2;
}

- (id)sb_resolvedTintColor
{
  v1 = [a1 tintColor];
  v2 = objc_msgSend(v1, "sb_resolvedColor");

  return v2;
}

- (void)sb_resolvedImage
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1D85BA000, a2, OS_LOG_TYPE_ERROR, "Unable to find system image with name: %{public}@.", (uint8_t *)&v2, 0xCu);
}

@end