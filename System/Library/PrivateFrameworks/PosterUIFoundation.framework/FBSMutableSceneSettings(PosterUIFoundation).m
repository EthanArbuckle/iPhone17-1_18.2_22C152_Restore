@interface FBSMutableSceneSettings(PosterUIFoundation)
- (void)pui_applyOtherSettings:()PosterUIFoundation;
- (void)pui_applyToMutableSceneSettings:()PosterUIFoundation;
- (void)pui_setComplicationRowConfigured:()PosterUIFoundation;
- (void)pui_setComplicationSidebarConfigured:()PosterUIFoundation;
- (void)pui_setContent:()PosterUIFoundation;
- (void)pui_setDeviceOrientation:()PosterUIFoundation;
- (void)pui_setExtensionUserInteractionEnabled:()PosterUIFoundation;
- (void)pui_setFloatingLayerSnapshot:()PosterUIFoundation;
- (void)pui_setInlineComplicationConfigured:()PosterUIFoundation;
- (void)pui_setInvalidated;
- (void)pui_setInvalidated:()PosterUIFoundation;
- (void)pui_setMode:()PosterUIFoundation;
- (void)pui_setPosterBoundingShape:()PosterUIFoundation;
- (void)pui_setPosterContents:()PosterUIFoundation;
- (void)pui_setPreviewContent:()PosterUIFoundation;
- (void)pui_setPreviewIdentifier:()PosterUIFoundation;
- (void)pui_setProvider:()PosterUIFoundation;
- (void)pui_setRole:()PosterUIFoundation;
- (void)pui_setSceneAttachments:()PosterUIFoundation;
- (void)pui_setShowsComplications:()PosterUIFoundation;
- (void)pui_setShowsHeaderElements:()PosterUIFoundation;
- (void)pui_setSignificantEventsCounter:()PosterUIFoundation;
- (void)pui_setSnapshot:()PosterUIFoundation;
- (void)pui_setUserInterfaceStyle:()PosterUIFoundation;
- (void)pui_setUserTapEventWithLocation:()PosterUIFoundation;
- (void)pui_setUserTapEventsCounter:()PosterUIFoundation;
- (void)pui_setWallpaperObscured:()PosterUIFoundation;
@end

@implementation FBSMutableSceneSettings(PosterUIFoundation)

- (void)pui_applyToMutableSceneSettings:()PosterUIFoundation
{
  v4 = (void *)MEMORY[0x263F3F7F8];
  id v5 = a3;
  id v11 = [v4 diffFromSettings:a1 toSettings:v5];
  [v11 applyToMutableSettings:a1];
  v6 = objc_msgSend(v5, "pui_role");
  objc_msgSend(a1, "pui_setRole:", v6);

  objc_msgSend(a1, "pui_setPreviewContent:", objc_msgSend(v5, "pui_previewContent"));
  objc_msgSend(a1, "pui_setContent:", objc_msgSend(v5, "pui_content"));
  v7 = objc_msgSend(v5, "pui_provider");
  objc_msgSend(a1, "pui_setProvider:", v7);

  v8 = objc_msgSend(v5, "pui_posterContents");
  objc_msgSend(a1, "pui_setPosterContents:", v8);

  v9 = objc_msgSend(v5, "pui_previewIdentifier");
  objc_msgSend(a1, "pui_setPreviewIdentifier:", v9);

  objc_msgSend(a1, "pui_setUserInterfaceStyle:", objc_msgSend(v5, "pui_userInterfaceStyle"));
  objc_msgSend(a1, "pui_setDeviceOrientation:", objc_msgSend(v5, "pui_deviceOrientation"));
  objc_msgSend(a1, "pui_setWallpaperObscured:", objc_msgSend(v5, "pui_isWallpaperObscured"));
  objc_msgSend(a1, "pui_setExtensionUserInteractionEnabled:", objc_msgSend(v5, "pui_isExtensionUserInteractionEnabled"));
  objc_msgSend(a1, "pui_setSnapshot:", objc_msgSend(v5, "pui_isSnapshot"));
  objc_msgSend(a1, "pui_setFloatingLayerSnapshot:", objc_msgSend(v5, "pui_isFloatingLayerSnapshot"));
  objc_msgSend(a1, "pui_setSignificantEventsCounter:", objc_msgSend(v5, "pui_significantEventsCounter"));
  objc_msgSend(a1, "pui_setUserTapEventsCounter:", objc_msgSend(v5, "pui_userTapEventsCounter"));
  objc_msgSend(v5, "pui_userTapLocation");
  objc_msgSend(a1, "pui_setUserTapEventWithLocation:");
  objc_msgSend(a1, "pui_setShowsHeaderElements:", objc_msgSend(v5, "pui_showsHeaderElements"));
  objc_msgSend(a1, "pui_setShowsComplications:", objc_msgSend(v5, "pui_showsComplications"));
  v10 = objc_msgSend(v5, "pui_sceneAttachments");

  objc_msgSend(a1, "pui_setSceneAttachments:", v10);
}

- (void)pui_applyOtherSettings:()PosterUIFoundation
{
  v4 = (void *)MEMORY[0x263F29CD0];
  id v5 = a3;
  v6 = [a1 otherSettings];
  id v8 = [v4 diffFromSettings:v6 toSettings:v5];

  v7 = [a1 otherSettings];
  [v8 applyToSettings:v7];
}

- (void)pui_setRole:()PosterUIFoundation
{
  id v9 = a3;
  if (v9 && (NSClassFromString(&cfstr_Nsstring.isa), (objc_opt_isKindOfClass() & 1) == 0))
  {
    id v8 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:NSStringClass]"];
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[FBSMutableSceneSettings(PosterUIFoundation) pui_setRole:]();
    }
    [v8 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
  }
  else
  {

    v4 = [a1 otherSettings];
    id v5 = (void *)[v9 copy];
    [v4 setObject:v5 forSetting:20462];

    v6 = [a1 otherSettings];
    v7 = (void *)[v9 copy];
    [v6 setObject:v7 forSetting:20211529];
  }
}

- (void)pui_setProvider:()PosterUIFoundation
{
  id v6 = a3;
  NSClassFromString(&cfstr_Nsstring.isa);
  if (!v6)
  {
    id v5 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_bs_assert_object != nil"];
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[FBSMutableSceneSettings(PosterUIFoundation) pui_setProvider:]();
    }
LABEL_11:
    [v5 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x25A0E9274);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v5 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:NSStringClass]"];
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[FBSMutableSceneSettings(PosterUIFoundation) pui_setProvider:]();
    }
    goto LABEL_11;
  }

  v4 = [a1 otherSettings];
  [v4 setObject:v6 forSetting:20463];
}

- (void)pui_setInvalidated
{
  id v1 = [a1 otherSettings];
  [v1 setFlag:1 forSetting:20464];
}

- (void)pui_setPreviewIdentifier:()PosterUIFoundation
{
  id v6 = a3;
  if (v6 && (NSClassFromString(&cfstr_Nsstring.isa), (objc_opt_isKindOfClass() & 1) == 0))
  {
    id v5 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:NSStringClass]"];
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[FBSMutableSceneSettings(PosterUIFoundation) pui_setPreviewIdentifier:]();
    }
    [v5 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
  }
  else
  {

    v4 = [a1 otherSettings];
    [v4 setObject:v6 forSetting:20465];
  }
}

- (void)pui_setDeviceOrientation:()PosterUIFoundation
{
  id v5 = [a1 otherSettings];
  id v6 = [NSNumber numberWithInteger:a3];
  [v5 setObject:v6 forSetting:20466];

  uint64_t v7 = objc_opt_class();
  id v8 = a1;
  if (v7)
  {
    if (objc_opt_isKindOfClass()) {
      id v9 = v8;
    }
    else {
      id v9 = 0;
    }
  }
  else
  {
    id v9 = 0;
  }
  id v11 = v9;

  v10 = v11;
  if (v11)
  {
    [v11 setDeviceOrientation:a3];
    v10 = v11;
  }
}

- (void)pui_setPosterContents:()PosterUIFoundation
{
  id v6 = a3;
  if (v6 && (NSClassFromString(&cfstr_Pfserverposter.isa), (objc_opt_isKindOfClass() & 1) == 0))
  {
    id v5 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:PFServerPosterPathClass]"];
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[FBSMutableSceneSettings(PosterUIFoundation) pui_setPosterContents:]();
    }
    [v5 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
  }
  else
  {

    v4 = [a1 otherSettings];
    [v4 setObject:v6 forSetting:20467];
  }
}

- (void)pui_setWallpaperObscured:()PosterUIFoundation
{
  id v1 = [a1 otherSettings];
  [v1 setFlag:BSSettingFlagForBool() forSetting:20468];
}

- (void)pui_setInvalidated:()PosterUIFoundation
{
  id v5 = a3;
  objc_msgSend(a1, "pui_setInvalidated");
  if (v5)
  {
    v4 = [a1 otherSettings];
    [v4 setObject:v5 forSetting:20469];
  }
}

- (void)pui_setExtensionUserInteractionEnabled:()PosterUIFoundation
{
  id v1 = [a1 otherSettings];
  [v1 setFlag:BSSettingFlagForBool() forSetting:20470];
}

- (void)pui_setInlineComplicationConfigured:()PosterUIFoundation
{
  id v1 = [a1 otherSettings];
  [v1 setFlag:BSSettingFlagForBool() forSetting:20471];
}

- (void)pui_setComplicationRowConfigured:()PosterUIFoundation
{
  id v1 = [a1 otherSettings];
  [v1 setFlag:BSSettingFlagForBool() forSetting:20472];
}

- (void)pui_setComplicationSidebarConfigured:()PosterUIFoundation
{
  id v1 = [a1 otherSettings];
  [v1 setFlag:BSSettingFlagForBool() forSetting:20473];
}

- (void)pui_setShowsComplications:()PosterUIFoundation
{
  id v1 = [a1 otherSettings];
  [v1 setFlag:BSSettingFlagForBool() forSetting:20474];
}

- (void)pui_setShowsHeaderElements:()PosterUIFoundation
{
  id v1 = [a1 otherSettings];
  [v1 setFlag:BSSettingFlagForBool() forSetting:20475];
}

- (void)pui_setUserInterfaceStyle:()PosterUIFoundation
{
  id v5 = [a1 otherSettings];
  id v6 = [NSNumber numberWithInteger:a3];
  [v5 setObject:v6 forSetting:20476];

  uint64_t v7 = objc_opt_class();
  id v8 = a1;
  if (v7)
  {
    if (objc_opt_isKindOfClass()) {
      id v9 = v8;
    }
    else {
      id v9 = 0;
    }
  }
  else
  {
    id v9 = 0;
  }
  id v11 = v9;

  v10 = v11;
  if (v11)
  {
    [v11 setUserInterfaceStyle:a3];
    v10 = v11;
  }
}

- (void)pui_setPosterBoundingShape:()PosterUIFoundation
{
  id v5 = [a1 otherSettings];
  v4 = [NSNumber numberWithInteger:a3];
  [v5 setObject:v4 forSetting:20477];
}

- (void)pui_setSnapshot:()PosterUIFoundation
{
  id v1 = [a1 otherSettings];
  [v1 setFlag:BSSettingFlagForBool() forSetting:20487];
}

- (void)pui_setFloatingLayerSnapshot:()PosterUIFoundation
{
  id v1 = [a1 otherSettings];
  [v1 setFlag:BSSettingFlagForBool() forSetting:20488];
}

- (void)pui_setSignificantEventsCounter:()PosterUIFoundation
{
  id v5 = [a1 otherSettings];
  v4 = [NSNumber numberWithUnsignedInteger:a3];
  [v5 setObject:v4 forSetting:20489];
}

- (void)pui_setUserTapEventWithLocation:()PosterUIFoundation
{
  id v5 = [a1 otherSettings];
  *(double *)uint64_t v7 = a2;
  *(double *)&v7[1] = a3;
  id v6 = [MEMORY[0x263F08D40] valueWithBytes:v7 objCType:"{CGPoint=dd}"];
  [v5 setObject:v6 forSetting:20490];
}

- (void)pui_setUserTapEventsCounter:()PosterUIFoundation
{
  id v5 = [a1 otherSettings];
  v4 = [NSNumber numberWithUnsignedInteger:a3];
  [v5 setObject:v4 forSetting:20491];
}

- (void)pui_setMode:()PosterUIFoundation
{
  id v5 = [a1 otherSettings];
  v4 = [NSNumber numberWithInteger:a3];
  [v5 setObject:v4 forSetting:20492];
}

- (void)pui_setContent:()PosterUIFoundation
{
  id v5 = [a1 otherSettings];
  v4 = [NSNumber numberWithInteger:a3];
  [v5 setObject:v4 forSetting:20493];
}

- (void)pui_setPreviewContent:()PosterUIFoundation
{
  id v5 = [a1 otherSettings];
  v4 = [NSNumber numberWithUnsignedInteger:a3];
  [v5 setObject:v4 forSetting:20494];
}

- (void)pui_setSceneAttachments:()PosterUIFoundation
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v3 = a3;
  xpc_object_t empty = xpc_array_create_empty();
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v15;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = *(void **)(*((void *)&v14 + 1) + 8 * v9);
        xpc_object_t v11 = xpc_dictionary_create_empty();
        xpc_dictionary_set_uint64(v11, "contextId", [v10 contextId]);
        xpc_dictionary_set_uint64(v11, "renderId", [v10 renderId]);
        xpc_dictionary_set_int64(v11, "level", [v10 level]);
        xpc_array_append_value(empty, v11);

        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v7);
  }

  v12 = [a1 otherSettings];
  [v12 setObject:empty forSetting:20495];
}

- (void)pui_setRole:()PosterUIFoundation .cold.1()
{
  OUTLINED_FUNCTION_3();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_4();
  id v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_0(&dword_25A0AF000, &_os_log_internal, v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)pui_setProvider:()PosterUIFoundation .cold.1()
{
  OUTLINED_FUNCTION_3();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_4();
  id v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_0(&dword_25A0AF000, &_os_log_internal, v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)pui_setPreviewIdentifier:()PosterUIFoundation .cold.1()
{
  OUTLINED_FUNCTION_3();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_4();
  id v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_0(&dword_25A0AF000, &_os_log_internal, v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)pui_setPosterContents:()PosterUIFoundation .cold.1()
{
  OUTLINED_FUNCTION_3();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_4();
  id v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_0(&dword_25A0AF000, &_os_log_internal, v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

@end