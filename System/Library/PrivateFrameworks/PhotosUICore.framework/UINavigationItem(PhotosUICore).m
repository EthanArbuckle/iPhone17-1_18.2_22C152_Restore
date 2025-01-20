@interface UINavigationItem(PhotosUICore)
- (uint64_t)_updateFinalLargeTitleDisplayMode;
- (uint64_t)px_backButtonDisplayMode;
- (uint64_t)px_disableLargeTitle;
- (uint64_t)px_hidesBackButtonInRegularWidth;
- (uint64_t)px_preferredLargeTitleDisplayMode;
- (uint64_t)px_setBackButtonDisplayMode:()PhotosUICore;
- (uint64_t)px_setDisableLargeTitle:()PhotosUICore;
- (uint64_t)px_setPreferredLargeTitleDisplayMode:()PhotosUICore;
- (void)px_setHidesBackButtonInRegularWidth:()PhotosUICore;
- (void)px_updateBackButtonVisibilityForTraitCollection:()PhotosUICore;
@end

@implementation UINavigationItem(PhotosUICore)

- (uint64_t)px_setPreferredLargeTitleDisplayMode:()PhotosUICore
{
  uint64_t result = objc_msgSend(a1, "px_preferredLargeTitleDisplayMode");
  if (result != a3)
  {
    v6 = [NSNumber numberWithInteger:a3];
    objc_setAssociatedObject(a1, sel_px_preferredLargeTitleDisplayMode, v6, (void *)3);

    return [a1 _updateFinalLargeTitleDisplayMode];
  }
  return result;
}

- (uint64_t)px_setBackButtonDisplayMode:()PhotosUICore
{
  uint64_t result = objc_opt_respondsToSelector();
  if (result)
  {
    return [a1 setBackButtonDisplayMode:a3];
  }
  return result;
}

- (uint64_t)_updateFinalLargeTitleDisplayMode
{
  uint64_t v2 = objc_msgSend(a1, "px_preferredLargeTitleDisplayMode");
  if (objc_msgSend(a1, "px_disableLargeTitle")) {
    uint64_t v3 = 2;
  }
  else {
    uint64_t v3 = v2;
  }
  return [a1 setLargeTitleDisplayMode:v3];
}

- (uint64_t)px_preferredLargeTitleDisplayMode
{
  v1 = objc_getAssociatedObject(a1, sel_px_preferredLargeTitleDisplayMode);
  uint64_t v2 = [v1 integerValue];

  return v2;
}

- (uint64_t)px_disableLargeTitle
{
  v1 = objc_getAssociatedObject(a1, sel_px_disableLargeTitle);
  uint64_t v2 = [v1 BOOLValue];

  return v2;
}

- (uint64_t)px_backButtonDisplayMode
{
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    return 0;
  }
  return [a1 backButtonDisplayMode];
}

- (void)px_updateBackButtonVisibilityForTraitCollection:()PhotosUICore
{
  id v6 = a3;
  v4 = objc_getAssociatedObject(a1, sel_px_hidesBackButtonInRegularWidth);
  if (v4)
  {
    if ([v6 horizontalSizeClass] == 2) {
      uint64_t v5 = [v4 BOOLValue];
    }
    else {
      uint64_t v5 = 0;
    }
    [a1 setHidesBackButton:v5];
  }
}

- (void)px_setHidesBackButtonInRegularWidth:()PhotosUICore
{
  if (objc_msgSend(a1, "px_hidesBackButtonInRegularWidth") != a3)
  {
    id v5 = [NSNumber numberWithBool:a3];
    objc_setAssociatedObject(a1, sel_px_hidesBackButtonInRegularWidth, v5, (void *)3);
  }
}

- (uint64_t)px_hidesBackButtonInRegularWidth
{
  v1 = objc_getAssociatedObject(a1, sel_px_hidesBackButtonInRegularWidth);
  uint64_t v2 = [v1 BOOLValue];

  return v2;
}

- (uint64_t)px_setDisableLargeTitle:()PhotosUICore
{
  uint64_t result = objc_msgSend(a1, "px_disableLargeTitle");
  if (result != a3)
  {
    id v6 = [NSNumber numberWithBool:a3];
    objc_setAssociatedObject(a1, sel_px_disableLargeTitle, v6, (void *)3);

    return [a1 _updateFinalLargeTitleDisplayMode];
  }
  return result;
}

@end