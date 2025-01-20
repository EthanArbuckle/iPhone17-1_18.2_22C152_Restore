@interface UISApplicationSupportDisplayEdgeInfo
@end

@implementation UISApplicationSupportDisplayEdgeInfo

void __81__UISApplicationSupportDisplayEdgeInfo_SpringBoard__sb_thisDeviceDisplayEdgeInfo__block_invoke(uint64_t a1)
{
  uint64_t v1 = objc_msgSend(*(id *)(a1 + 32), "sbh_displayEdgeInfoForScreenType:", SBHScreenTypeForCurrentDevice());
  v2 = (void *)sb_thisDeviceDisplayEdgeInfo_sNewThisDeviceDisplayEdgeInfo;
  sb_thisDeviceDisplayEdgeInfo_sNewThisDeviceDisplayEdgeInfo = v1;
}

void __90__UISApplicationSupportDisplayEdgeInfo_SpringBoard__sb_floatingApplicationDisplayEdgeInfo__block_invoke(uint64_t a1)
{
  uint64_t v2 = objc_msgSend(*(id *)(a1 + 32), "sb_thisDeviceDisplayEdgeInfo");
  v3 = (void *)sb_floatingApplicationDisplayEdgeInfo_sFloatingApplicationDisplayEdgeInfo;
  sb_floatingApplicationDisplayEdgeInfo_sFloatingApplicationDisplayEdgeInfo = v2;

  v4 = objc_msgSend(*(id *)(a1 + 32), "sb_legacy_roundCornerPadDisplayEdgeInfo");
  if (v4 != (void *)sb_floatingApplicationDisplayEdgeInfo_sFloatingApplicationDisplayEdgeInfo)
  {
    id v22 = v4;
    v5 = [v4 safeAreaInsetsPortrait];
    [v5 bottomInset];
    double v7 = v6;

    v8 = [(id)sb_floatingApplicationDisplayEdgeInfo_sFloatingApplicationDisplayEdgeInfo safeAreaInsetsPortrait];
    [v8 bottomInset];
    double v10 = v9;

    v4 = v22;
    if (v7 > v10)
    {
      uint64_t v11 = [(id)sb_floatingApplicationDisplayEdgeInfo_sFloatingApplicationDisplayEdgeInfo copy];
      v12 = (void *)sb_floatingApplicationDisplayEdgeInfo_sFloatingApplicationDisplayEdgeInfo;
      sb_floatingApplicationDisplayEdgeInfo_sFloatingApplicationDisplayEdgeInfo = v11;

      v13 = [(id)sb_floatingApplicationDisplayEdgeInfo_sFloatingApplicationDisplayEdgeInfo safeAreaInsetsPortrait];
      v14 = (void *)sb_floatingApplicationDisplayEdgeInfo_sFloatingApplicationDisplayEdgeInfo;
      id v15 = objc_alloc(MEMORY[0x1E4FB33B8]);
      [v13 topInset];
      double v17 = v16;
      [v13 leftInset];
      double v19 = v18;
      [v13 rightInset];
      v21 = (void *)[v15 initWithTop:v17 left:v19 bottom:v7 right:v20];
      [v14 setSafeAreaInsetsPortrait:v21];

      v4 = v22;
    }
  }
}

void __99__UISApplicationSupportDisplayEdgeInfo_SpringBoardPreAzul__sb_legacy_roundCornerPadDisplayEdgeInfo__block_invoke(uint64_t a1)
{
  int v2 = SBFIsSAEIncreasedInsetAvailable();
  if (v2) {
    double v3 = 25.0;
  }
  else {
    double v3 = 20.0;
  }
  if (v2) {
    double v4 = 20.0;
  }
  else {
    double v4 = 15.0;
  }
  id v5 = objc_alloc_init(*(Class *)(a1 + 32));
  double v6 = (void *)sb_legacy_roundCornerPadDisplayEdgeInfo_sRoundCornerPadDisplayEdgeInfo;
  sb_legacy_roundCornerPadDisplayEdgeInfo_sRoundCornerPadDisplayEdgeInfo = (uint64_t)v5;

  double v7 = (void *)sb_legacy_roundCornerPadDisplayEdgeInfo_sRoundCornerPadDisplayEdgeInfo;
  v8 = [NSNumber numberWithDouble:v4];
  [v7 setHomeAffordanceOverlayAllowance:v8];

  double v9 = (void *)sb_legacy_roundCornerPadDisplayEdgeInfo_sRoundCornerPadDisplayEdgeInfo;
  id v10 = (id)[objc_alloc(MEMORY[0x1E4FB33B8]) initWithTop:0.0 left:0.0 bottom:v3 right:0.0];
  [v9 setSafeAreaInsetsPortrait:v10];
}

void __101__UISApplicationSupportDisplayEdgeInfo_SpringBoardPreAzul__sb_legacy_homeButtonDeviceDisplayEdgeInfo__block_invoke(uint64_t a1)
{
  id v1 = objc_alloc_init(*(Class *)(a1 + 32));
  int v2 = (void *)sb_legacy_homeButtonDeviceDisplayEdgeInfo_sHomeButtonDeviceDisplayEdgeInfo;
  sb_legacy_homeButtonDeviceDisplayEdgeInfo_sHomeButtonDeviceDisplayEdgeInfo = (uint64_t)v1;
}

@end