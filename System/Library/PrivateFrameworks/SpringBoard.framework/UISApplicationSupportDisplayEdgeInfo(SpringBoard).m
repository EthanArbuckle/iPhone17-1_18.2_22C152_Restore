@interface UISApplicationSupportDisplayEdgeInfo(SpringBoard)
+ (id)sb_displayEdgeInfoForApplication:()SpringBoard;
+ (id)sb_displayEdgeInfoForScreenTypeConsideringCurrentDevice:()SpringBoard;
+ (id)sb_floatingApplicationDisplayEdgeInfo;
+ (id)sb_thisDeviceDisplayEdgeInfo;
- (double)sb_orientedEdgeInsetsForInterfaceOrientation:()SpringBoard traitCollection:;
- (id)sb_displayEdgeInfoWithSafeAreaInsetsForStatusBarHeight:()SpringBoard;
@end

@implementation UISApplicationSupportDisplayEdgeInfo(SpringBoard)

+ (id)sb_thisDeviceDisplayEdgeInfo
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __81__UISApplicationSupportDisplayEdgeInfo_SpringBoard__sb_thisDeviceDisplayEdgeInfo__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sb_thisDeviceDisplayEdgeInfo_onceToken != -1) {
    dispatch_once(&sb_thisDeviceDisplayEdgeInfo_onceToken, block);
  }
  v1 = (void *)sb_thisDeviceDisplayEdgeInfo_sNewThisDeviceDisplayEdgeInfo;
  return v1;
}

+ (id)sb_floatingApplicationDisplayEdgeInfo
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __90__UISApplicationSupportDisplayEdgeInfo_SpringBoard__sb_floatingApplicationDisplayEdgeInfo__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sb_floatingApplicationDisplayEdgeInfo_onceToken != -1) {
    dispatch_once(&sb_floatingApplicationDisplayEdgeInfo_onceToken, block);
  }
  v1 = (void *)sb_floatingApplicationDisplayEdgeInfo_sFloatingApplicationDisplayEdgeInfo;
  return v1;
}

+ (id)sb_displayEdgeInfoForApplication:()SpringBoard
{
  id v4 = a3;
  uint64_t v5 = [v4 _classicMode];
  if (SBApplicationClassicModeWantsSafeAreaInsets(v5)) {
    objc_msgSend(a1, "sb_displayEdgeInfoForScreenTypeConsideringCurrentDevice:", -[SBApplication _screenTypeForClassicMode:]((uint64_t)v4, v5));
  }
  else {
  v6 = objc_msgSend(a1, "sb_legacy_homeButtonDeviceDisplayEdgeInfo");
  }

  return v6;
}

+ (id)sb_displayEdgeInfoForScreenTypeConsideringCurrentDevice:()SpringBoard
{
  uint64_t v5 = objc_msgSend(a1, "sbh_displayEdgeInfoForScreenType:");
  uint64_t v6 = SBHScreenTypeForCurrentDevice();
  if (v6 != a3)
  {
    unint64_t v7 = v6;
    if (SBHScreenTypeIsPhone())
    {
      char HasHomeButton = SBHScreenTypeHasHomeButton();
      if (v7 - 29 >= 0xFFFFFFFFFFFFFFF8 && (HasHomeButton & 1) == 0)
      {
        unint64_t v9 = +[SBApplication _unobscuredScreenTypeForScreenType:]((uint64_t)SBApplication, v7);
        SBHGetScreenSpecification();
        SBHGetScreenSpecification();
        v10 = objc_msgSend(a1, "sbh_displayEdgeInfoForScreenType:", v9);
        v11 = [v10 safeAreaInsetsPortrait];
        [v11 topInset];
        double v13 = round(0.0 / 0.0 * v12);

        v14 = [v5 safeAreaInsetsPortrait];
        id v15 = objc_alloc(MEMORY[0x1E4FB33B8]);
        [v14 leftInset];
        double v17 = v16;
        [v14 bottomInset];
        double v19 = v18;
        [v14 rightInset];
        v21 = (void *)[v15 initWithTop:v13 left:v17 bottom:v19 right:v20];
        [v5 setSafeAreaInsetsPortrait:v21];
      }
    }
  }
  return v5;
}

- (id)sb_displayEdgeInfoWithSafeAreaInsetsForStatusBarHeight:()SpringBoard
{
  id v4 = [a1 safeAreaInsetsPortrait];
  [v4 topInset];
  double v6 = v5;

  if (v6 >= a2)
  {
    id v7 = a1;
  }
  else
  {
    id v7 = (id)[a1 copy];
    v8 = [v7 safeAreaInsetsPortrait];
    id v9 = objc_alloc(MEMORY[0x1E4FB33B8]);
    [v8 leftInset];
    double v11 = v10;
    [v8 bottomInset];
    double v13 = v12;
    [v8 rightInset];
    id v15 = (void *)[v9 initWithTop:a2 left:v11 bottom:v13 right:v14];
    [v7 setSafeAreaInsetsPortrait:v15];
  }
  return v7;
}

- (double)sb_orientedEdgeInsetsForInterfaceOrientation:()SpringBoard traitCollection:
{
  id v5 = a4;
  double v6 = [a1 safeAreaInsetsPortrait];
  UIEdgeInsetsFromApplicationSupportDisplayEdgeInsetsWrapper();
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;

  if (v10 != *(double *)(MEMORY[0x1E4F437F8] + 8)
    || v8 != *MEMORY[0x1E4F437F8]
    || v14 != *(double *)(MEMORY[0x1E4F437F8] + 24)
    || v12 != *(double *)(MEMORY[0x1E4F437F8] + 16))
  {
    if (![v5 userInterfaceIdiom])
    {
      SBFEdgeInsetsRotateToInterfaceOrientation();
      double v8 = v18;
      [v5 userInterfaceIdiom];
    }
    double v19 = [a1 homeAffordanceOverlayAllowance];
    [v19 doubleValue];
  }
  return v8;
}

@end