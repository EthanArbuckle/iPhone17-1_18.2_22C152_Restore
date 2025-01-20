@interface FBSSceneSettings(PREditingScene)
- (double)pr_leadingTopButtonFrame;
- (double)pr_trailingTopButtonFrame;
- (id)pr_overrideDate;
- (id)pr_titleString;
- (uint64_t)pr_areComplicationsDisallowed;
- (uint64_t)pr_areControlsHidden;
- (uint64_t)pr_editingAcceptButtonType;
- (uint64_t)pr_editingContext;
- (uint64_t)pr_editingVariant;
- (uint64_t)pr_focusedComplicationElement;
- (uint64_t)pr_focusedQuickActionElementPosition;
- (uint64_t)pr_isCoveredByModalPresentation;
- (uint64_t)pr_usesEditingLayout;
@end

@implementation FBSSceneSettings(PREditingScene)

- (uint64_t)pr_isCoveredByModalPresentation
{
  v1 = [a1 otherSettings];
  uint64_t v2 = [v1 BOOLForSetting:20762];

  return v2;
}

- (uint64_t)pr_editingAcceptButtonType
{
  v1 = [a1 otherSettings];
  uint64_t v2 = [v1 objectForSetting:20770];
  uint64_t v3 = [v2 integerValue];

  return v3;
}

- (uint64_t)pr_editingVariant
{
  v1 = [a1 otherSettings];
  uint64_t v2 = [v1 objectForSetting:20764];
  uint64_t v3 = [v2 integerValue];

  return v3;
}

- (uint64_t)pr_editingContext
{
  v1 = [a1 otherSettings];
  uint64_t v2 = [v1 objectForSetting:20765];
  uint64_t v3 = [v2 integerValue];

  return v3;
}

- (double)pr_leadingTopButtonFrame
{
  v1 = [a1 otherSettings];
  uint64_t v2 = [v1 objectForSetting:20766];

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

  [v6 CGRectValue];
  double v8 = v7;

  return v8;
}

- (double)pr_trailingTopButtonFrame
{
  v1 = [a1 otherSettings];
  uint64_t v2 = [v1 objectForSetting:20767];

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

  [v6 CGRectValue];
  double v8 = v7;

  return v8;
}

- (uint64_t)pr_usesEditingLayout
{
  v1 = [a1 otherSettings];
  uint64_t v2 = [v1 BOOLForSetting:20769];

  return v2;
}

- (uint64_t)pr_focusedComplicationElement
{
  v1 = [a1 otherSettings];
  uint64_t v2 = [v1 objectForSetting:20772];
  uint64_t v3 = [v2 integerValue];

  return v3;
}

- (uint64_t)pr_areControlsHidden
{
  v1 = [a1 otherSettings];
  uint64_t v2 = [v1 BOOLForSetting:20768];

  return v2;
}

- (uint64_t)pr_areComplicationsDisallowed
{
  v1 = [a1 otherSettings];
  uint64_t v2 = [v1 BOOLForSetting:20771];

  return v2;
}

- (id)pr_titleString
{
  v1 = [a1 otherSettings];
  uint64_t v2 = [v1 objectForSetting:20773];

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

- (id)pr_overrideDate
{
  v1 = [a1 otherSettings];
  uint64_t v2 = [v1 objectForSetting:20774];

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

- (uint64_t)pr_focusedQuickActionElementPosition
{
  v1 = [a1 otherSettings];
  uint64_t v2 = [v1 objectForSetting:20776];
  uint64_t v3 = [v2 integerValue];

  return v3;
}

@end