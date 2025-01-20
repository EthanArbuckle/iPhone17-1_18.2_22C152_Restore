@interface SBSUserNotificationImageAssetDefinition(SBUserNotificationImageResolving)
- (id)sb_resolvedImage;
- (uint64_t)sb_resolvedTintColor;
- (void)sb_resolvedImage;
@end

@implementation SBSUserNotificationImageAssetDefinition(SBUserNotificationImageResolving)

- (id)sb_resolvedImage
{
  v2 = [a1 imagePath];
  v3 = [a1 catalogPath];
  uint64_t v4 = [a1 catalogImageKey];
  v5 = (void *)v4;
  if (v2)
  {
    v6 = (void *)[objc_alloc(MEMORY[0x1E4F42A80]) initWithContentsOfFile:v2];
    goto LABEL_15;
  }
  v6 = 0;
  if (v3 && v4)
  {
    id v7 = objc_alloc(MEMORY[0x1E4F430A0]);
    v8 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v3];
    v9 = [MEMORY[0x1E4F42948] currentDevice];
    id v14 = 0;
    v10 = objc_msgSend(v7, "initWithURL:idiom:error:", v8, objc_msgSend(v9, "userInterfaceIdiom"), &v14);
    id v11 = v14;

    if (v10)
    {
      v6 = [v10 imageNamed:v5 withTrait:0];
      [v6 _sbSetAssociatedAssetManager:v10];
      if (v6)
      {
LABEL_14:

        goto LABEL_15;
      }
      v12 = SBLogAlertItems();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        -[SBSUserNotificationImageAssetDefinition(SBUserNotificationImageResolving) sb_resolvedImage]();
      }
    }
    else
    {
      if (!v11)
      {
LABEL_13:
        v6 = 0;
        goto LABEL_14;
      }
      v12 = SBLogAlertItems();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        -[SBSUserNotificationImageAssetDefinition(SBUserNotificationImageResolving) sb_resolvedImage]();
      }
    }

    goto LABEL_13;
  }
LABEL_15:

  return v6;
}

- (uint64_t)sb_resolvedTintColor
{
  return 0;
}

- (void)sb_resolvedImage
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_2_0(&dword_1D85BA000, v0, (uint64_t)v0, "Unable to load asset from asset bundle for path: %{public}@ because asset was not found: %{public}@.", v1);
}

@end