@interface FBSSceneSettings(PosterUIFoundation)
- (double)pui_userTapLocation;
- (id)pui_posterContents;
- (id)pui_previewIdentifier;
- (id)pui_provider;
- (id)pui_role;
- (id)pui_sceneAttachments;
- (uint64_t)pui_content;
- (uint64_t)pui_deviceOrientation;
- (uint64_t)pui_isComplicationRowConfigured;
- (uint64_t)pui_isComplicationSidebarConfigured;
- (uint64_t)pui_isExtensionUserInteractionEnabled;
- (uint64_t)pui_isFloatingLayerSnapshot;
- (uint64_t)pui_isInlineComplicationConfigured;
- (uint64_t)pui_isInvalidated;
- (uint64_t)pui_isSnapshot;
- (uint64_t)pui_isWallpaperObscured;
- (uint64_t)pui_mode;
- (uint64_t)pui_posterBoundingShape;
- (uint64_t)pui_previewContent;
- (uint64_t)pui_showsComplications;
- (uint64_t)pui_showsHeaderElements;
- (uint64_t)pui_significantEventsCounter;
- (uint64_t)pui_userInterfaceStyle;
- (uint64_t)pui_userTapEventsCounter;
@end

@implementation FBSSceneSettings(PosterUIFoundation)

- (id)pui_provider
{
  v1 = [a1 otherSettings];
  v2 = [v1 objectForSetting:20463];
  uint64_t v3 = objc_opt_class();
  id v4 = v2;
  if (v3)
  {
    if (objc_opt_isKindOfClass()) {
      v5 = v4;
    }
    else {
      v5 = 0;
    }
  }
  else
  {
    v5 = 0;
  }
  id v6 = v5;

  return v6;
}

- (uint64_t)pui_deviceOrientation
{
  v2 = [a1 otherSettings];
  uint64_t v3 = [v2 objectForSetting:20466];
  uint64_t v4 = objc_opt_class();
  id v5 = v3;
  if (v4)
  {
    if (objc_opt_isKindOfClass()) {
      id v6 = v5;
    }
    else {
      id v6 = 0;
    }
  }
  else
  {
    id v6 = 0;
  }
  id v7 = v6;

  if (v7)
  {
    uint64_t v8 = [v7 integerValue];
  }
  else
  {
    id v9 = a1;
    if (sel_deviceOrientation)
    {
      if (objc_opt_respondsToSelector()) {
        v10 = v9;
      }
      else {
        v10 = 0;
      }
    }
    else
    {
      v10 = 0;
    }
    id v11 = v10;

    if (v11)
    {
      unint64_t v12 = [v11 deviceOrientation];
      if (v12 > 6) {
        uint64_t v8 = 1;
      }
      else {
        uint64_t v8 = qword_25A113580[v12];
      }
    }
    else
    {
      uint64_t v8 = 0;
    }
  }
  return v8;
}

- (uint64_t)pui_content
{
  v1 = [a1 otherSettings];
  v2 = [v1 objectForSetting:20493];
  uint64_t v3 = objc_opt_class();
  id v4 = v2;
  if (v3)
  {
    if (objc_opt_isKindOfClass()) {
      id v5 = v4;
    }
    else {
      id v5 = 0;
    }
  }
  else
  {
    id v5 = 0;
  }
  id v6 = v5;

  if (v6) {
    uint64_t v7 = [v6 integerValue];
  }
  else {
    uint64_t v7 = 0;
  }

  return v7;
}

- (uint64_t)pui_userInterfaceStyle
{
  id v1 = a1;
  if (sel_userInterfaceStyle)
  {
    if (objc_opt_respondsToSelector()) {
      v2 = v1;
    }
    else {
      v2 = 0;
    }
  }
  else
  {
    v2 = 0;
  }
  id v3 = v2;

  if (v3)
  {
    uint64_t v4 = [v3 userInterfaceStyle];
  }
  else
  {
    id v5 = [v1 otherSettings];

    id v6 = [v5 objectForSetting:20476];
    uint64_t v4 = [v6 unsignedIntegerValue];

    id v3 = v5;
  }

  return v4;
}

- (id)pui_role
{
  v2 = [a1 otherSettings];
  id v3 = [v2 objectForSetting:20462];
  uint64_t v4 = objc_opt_class();
  id v5 = v3;
  if (v4)
  {
    if (objc_opt_isKindOfClass()) {
      id v6 = v5;
    }
    else {
      id v6 = 0;
    }
  }
  else
  {
    id v6 = 0;
  }
  id v7 = v6;

  if (!v7)
  {
    uint64_t v8 = [a1 otherSettings];
    id v9 = [v8 objectForSetting:20211529];
    uint64_t v10 = objc_opt_class();
    id v11 = v9;
    if (v10)
    {
      if (objc_opt_isKindOfClass()) {
        unint64_t v12 = v11;
      }
      else {
        unint64_t v12 = 0;
      }
    }
    else
    {
      unint64_t v12 = 0;
    }
    id v7 = v12;
  }
  if (v7) {
    v13 = v7;
  }
  else {
    v13 = (void *)*MEMORY[0x263F04E28];
  }
  id v14 = v13;

  return v14;
}

- (uint64_t)pui_isInvalidated
{
  id v1 = [a1 otherSettings];
  [v1 flagForSetting:20464];
  uint64_t IsYes = BSSettingFlagIsYes();

  return IsYes;
}

- (id)pui_previewIdentifier
{
  id v1 = [a1 otherSettings];
  v2 = [v1 objectForSetting:20465];
  uint64_t v3 = objc_opt_class();
  id v4 = v2;
  if (v3)
  {
    if (objc_opt_isKindOfClass()) {
      id v5 = v4;
    }
    else {
      id v5 = 0;
    }
  }
  else
  {
    id v5 = 0;
  }
  id v6 = v5;

  return v6;
}

- (id)pui_posterContents
{
  id v1 = [a1 otherSettings];
  v2 = [v1 objectForSetting:20467];
  uint64_t v3 = objc_opt_class();
  id v4 = v2;
  if (v3)
  {
    if (objc_opt_isKindOfClass()) {
      id v5 = v4;
    }
    else {
      id v5 = 0;
    }
  }
  else
  {
    id v5 = 0;
  }
  id v6 = v5;

  return v6;
}

- (uint64_t)pui_isWallpaperObscured
{
  id v1 = [a1 otherSettings];
  uint64_t v2 = [v1 BOOLForSetting:20468];

  return v2;
}

- (uint64_t)pui_isExtensionUserInteractionEnabled
{
  id v1 = [a1 otherSettings];
  uint64_t v2 = [v1 BOOLForSetting:20470];

  return v2;
}

- (uint64_t)pui_isInlineComplicationConfigured
{
  id v1 = [a1 otherSettings];
  uint64_t v2 = [v1 BOOLForSetting:20471];

  return v2;
}

- (uint64_t)pui_isComplicationRowConfigured
{
  id v1 = [a1 otherSettings];
  uint64_t v2 = [v1 BOOLForSetting:20472];

  return v2;
}

- (uint64_t)pui_isComplicationSidebarConfigured
{
  id v1 = [a1 otherSettings];
  uint64_t v2 = [v1 BOOLForSetting:20473];

  return v2;
}

- (uint64_t)pui_showsComplications
{
  id v1 = [a1 otherSettings];
  uint64_t v2 = [v1 BOOLForSetting:20474];

  return v2;
}

- (uint64_t)pui_showsHeaderElements
{
  id v1 = [a1 otherSettings];
  uint64_t v2 = [v1 BOOLForSetting:20475];

  return v2;
}

- (uint64_t)pui_posterBoundingShape
{
  id v1 = [a1 otherSettings];
  uint64_t v2 = [v1 objectForSetting:20477];
  uint64_t v3 = [v2 integerValue];

  return PUIPosterBoundingShapeFromInt(v3);
}

- (uint64_t)pui_isSnapshot
{
  id v1 = [a1 otherSettings];
  uint64_t v2 = [v1 BOOLForSetting:20487];

  return v2;
}

- (uint64_t)pui_isFloatingLayerSnapshot
{
  id v1 = [a1 otherSettings];
  uint64_t v2 = [v1 BOOLForSetting:20488];

  return v2;
}

- (uint64_t)pui_significantEventsCounter
{
  id v1 = [a1 otherSettings];
  uint64_t v2 = [v1 objectForSetting:20489];
  uint64_t v3 = objc_opt_class();
  id v4 = v2;
  if (v3)
  {
    if (objc_opt_isKindOfClass()) {
      id v5 = v4;
    }
    else {
      id v5 = 0;
    }
  }
  else
  {
    id v5 = 0;
  }
  id v6 = v5;

  if (v6) {
    uint64_t v7 = [v6 unsignedIntegerValue];
  }
  else {
    uint64_t v7 = 0;
  }

  return v7;
}

- (double)pui_userTapLocation
{
  id v1 = [a1 otherSettings];
  uint64_t v2 = [v1 objectForSetting:20490];
  uint64_t v3 = objc_opt_class();
  id v4 = v2;
  if (v3)
  {
    if (objc_opt_isKindOfClass()) {
      id v5 = v4;
    }
    else {
      id v5 = 0;
    }
  }
  else
  {
    id v5 = 0;
  }
  id v6 = v5;

  if (v6)
  {
    objc_msgSend(v6, "bs_CGPointValue");
    double v8 = v7;
  }
  else
  {
    double v8 = *MEMORY[0x263F00148];
  }

  return v8;
}

- (uint64_t)pui_userTapEventsCounter
{
  id v1 = [a1 otherSettings];
  uint64_t v2 = [v1 objectForSetting:20491];
  uint64_t v3 = objc_opt_class();
  id v4 = v2;
  if (v3)
  {
    if (objc_opt_isKindOfClass()) {
      id v5 = v4;
    }
    else {
      id v5 = 0;
    }
  }
  else
  {
    id v5 = 0;
  }
  id v6 = v5;

  if (v6) {
    uint64_t v7 = [v6 unsignedIntegerValue];
  }
  else {
    uint64_t v7 = 0;
  }

  return v7;
}

- (uint64_t)pui_mode
{
  id v1 = [a1 otherSettings];
  uint64_t v2 = [v1 objectForSetting:20492];
  uint64_t v3 = objc_opt_class();
  id v4 = v2;
  if (v3)
  {
    if (objc_opt_isKindOfClass()) {
      id v5 = v4;
    }
    else {
      id v5 = 0;
    }
  }
  else
  {
    id v5 = 0;
  }
  id v6 = v5;

  if (v6) {
    uint64_t v7 = [v6 integerValue];
  }
  else {
    uint64_t v7 = 0;
  }

  return v7;
}

- (uint64_t)pui_previewContent
{
  id v1 = [a1 otherSettings];
  uint64_t v2 = [v1 objectForSetting:20494];
  uint64_t v3 = objc_opt_class();
  id v4 = v2;
  if (v3)
  {
    if (objc_opt_isKindOfClass()) {
      id v5 = v4;
    }
    else {
      id v5 = 0;
    }
  }
  else
  {
    id v5 = 0;
  }
  id v6 = v5;

  if (v6) {
    uint64_t v7 = [v6 integerValue];
  }
  else {
    uint64_t v7 = 1;
  }

  return v7;
}

- (id)pui_sceneAttachments
{
  id v1 = [a1 otherSettings];
  uint64_t v2 = [v1 objectForSetting:20495];

  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    applier[0] = MEMORY[0x263EF8330];
    applier[1] = 3221225472;
    applier[2] = __60__FBSSceneSettings_PosterUIFoundation__pui_sceneAttachments__block_invoke;
    applier[3] = &unk_2654718E8;
    id v4 = v3;
    id v7 = v4;
    xpc_array_apply(v2, applier);
  }
  else
  {
    id v4 = (id)MEMORY[0x263EFFA68];
  }

  return v4;
}

@end