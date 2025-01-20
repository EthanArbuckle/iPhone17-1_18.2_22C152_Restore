@interface UISApplicationSupportDisplayEdgeInfo(SBHScreenTypes)
+ (id)sb_thisDeviceDisplayEdgeInfo;
+ (id)sbh_displayEdgeInfoForScreenType:()SBHScreenTypes;
- (void)sb_applyDisplayEdgeInfoToSceneSettings:()SBHScreenTypes;
@end

@implementation UISApplicationSupportDisplayEdgeInfo(SBHScreenTypes)

- (void)sb_applyDisplayEdgeInfoToSceneSettings:()SBHScreenTypes
{
  id v4 = a3;
  v5 = [a1 safeAreaInsetsPortrait];
  UIEdgeInsetsFromApplicationSupportDisplayEdgeInsetsWrapper();
  objc_msgSend(v4, "setSafeAreaInsetsPortrait:");

  v6 = [a1 peripheryInsets];
  UIEdgeInsetsFromApplicationSupportDisplayEdgeInsetsWrapper();
  objc_msgSend(v4, "setPeripheryInsets:");

  id v7 = [a1 homeAffordanceOverlayAllowance];
  [v7 doubleValue];
  objc_msgSend(v4, "setHomeAffordanceOverlayAllowance:");
}

+ (id)sb_thisDeviceDisplayEdgeInfo
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __84__UISApplicationSupportDisplayEdgeInfo_SBHScreenTypes__sb_thisDeviceDisplayEdgeInfo__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sb_thisDeviceDisplayEdgeInfo_onceToken != -1) {
    dispatch_once(&sb_thisDeviceDisplayEdgeInfo_onceToken, block);
  }
  v1 = (void *)sb_thisDeviceDisplayEdgeInfo_sNewThisDeviceDisplayEdgeInfo;
  return v1;
}

+ (id)sbh_displayEdgeInfoForScreenType:()SBHScreenTypes
{
  double v5 = 27.0;
  double v6 = 51.0;
  *(double *)&uint64_t v7 = 48.0;
  double v8 = 38.0;
  double v9 = 40.0;
  double v10 = 49.0;
  switch(a3)
  {
    case 3uLL:
    case 5uLL:
    case 8uLL:
      uint64_t v11 = 0x4046000000000000;
      goto LABEL_5;
    case 4uLL:
LABEL_30:
      double v5 = 29.0;
      double v10 = v8;
      break;
    case 6uLL:
LABEL_31:
      double v5 = 30.67;
      double v10 = v9;
      break;
    case 7uLL:
      goto LABEL_15;
    case 9uLL:
    case 0xFuLL:
      uint64_t v11 = 0x4049000000000000;
LABEL_5:
      uint64_t v7 = v11;
      goto LABEL_10;
    case 0xAuLL:
    case 0x10uLL:
      *(double *)&uint64_t v7 = 43.0;
      goto LABEL_10;
    case 0xBuLL:
    case 0xDuLL:
    case 0x11uLL:
    case 0x13uLL:
      *(double *)&uint64_t v7 = 47.0;
      goto LABEL_10;
    case 0xCuLL:
    case 0x12uLL:
      *(double *)&uint64_t v7 = 39.0;
      goto LABEL_10;
    case 0xEuLL:
    case 0x14uLL:
      *(double *)&uint64_t v7 = 41.0;
      goto LABEL_10;
    case 0x15uLL:
    case 0x17uLL:
      *(double *)&uint64_t v7 = 59.0;
      goto LABEL_10;
    case 0x16uLL:
LABEL_32:
      double v5 = 27.67;
      goto LABEL_16;
    case 0x18uLL:
LABEL_33:
      double v5 = 31.0;
      double v10 = v6;
      break;
    case 0x19uLL:
    case 0x1BuLL:
      *(double *)&uint64_t v7 = 62.0;
LABEL_15:
      double v5 = 34.0;
LABEL_16:
      double v10 = *(double *)&v7;
      break;
    case 0x1AuLL:
      break;
    case 0x1CuLL:
      double v5 = 29.0;
      double v10 = 53.0;
      break;
    default:
LABEL_10:
      double v8 = *(double *)&v7;
      double v9 = *(double *)&v7;
      double v6 = *(double *)&v7;
      double v10 = *(double *)&v7;
      double v5 = 0.0;
      switch(a3)
      {
        case 3uLL:
        case 5uLL:
        case 7uLL:
        case 9uLL:
        case 0xBuLL:
        case 0xDuLL:
        case 0xFuLL:
        case 0x11uLL:
        case 0x13uLL:
        case 0x15uLL:
        case 0x17uLL:
          goto LABEL_15;
        case 4uLL:
          goto LABEL_30;
        case 6uLL:
          goto LABEL_31;
        case 8uLL:
          double v5 = 31.0;
          goto LABEL_16;
        case 0xAuLL:
        case 0x10uLL:
          double v5 = 29.0;
          goto LABEL_16;
        case 0xCuLL:
        case 0x12uLL:
          double v5 = 28.0;
          goto LABEL_16;
        case 0xEuLL:
        case 0x14uLL:
          double v5 = 29.67;
          goto LABEL_16;
        case 0x16uLL:
          goto LABEL_32;
        case 0x18uLL:
          goto LABEL_33;
        case 0x19uLL:
        case 0x1AuLL:
        case 0x1BuLL:
        case 0x1CuLL:
        case 0x1DuLL:
        case 0x1EuLL:
        case 0x1FuLL:
        case 0x20uLL:
        case 0x21uLL:
          goto LABEL_17;
        case 0x22uLL:
        case 0x23uLL:
        case 0x24uLL:
        case 0x25uLL:
        case 0x26uLL:
        case 0x27uLL:
        case 0x28uLL:
        case 0x29uLL:
        case 0x2AuLL:
        case 0x2BuLL:
        case 0x2CuLL:
        case 0x2DuLL:
        case 0x2EuLL:
        case 0x2FuLL:
          int v12 = _os_feature_enabled_impl();
          double v6 = 20.0;
          double v8 = 25.0;
          if (v12) {
            double v5 = 25.0;
          }
          else {
            double v5 = 20.0;
          }
          goto LABEL_16;
        default:
          double v10 = *(double *)&v7;
          double v5 = 0.0;
          break;
      }
      break;
  }
LABEL_17:
  v13 = +[SBHDisplayDomain rootSettings];
  [v13 additionalTopSafeAreaInset];
  double v15 = v14;

  id v16 = objc_alloc_init(a1);
  if ((SBHScreenTypeHasHomeButton(a3) & 1) == 0 && (SBHScreenTypeIsPhone(a3) || SBHScreenTypeIsPad(a3)))
  {
    double v17 = v10 + v15;
    if (SBHScreenTypeIsPhone(a3))
    {
      double v18 = 0.0;
      if (a3 <= 0x2F) {
        double v18 = dbl_1D81E55C0[a3];
      }
      v19 = (void *)[objc_alloc(MEMORY[0x1E4FB33B8]) initWithTop:v18 left:0.0 bottom:0.0 right:0.0];
      [v16 setPeripheryInsets:v19];

      double v20 = 21.0;
    }
    else
    {
      int v21 = _os_feature_enabled_impl();
      double v20 = 15.0;
      if (v21) {
        double v20 = 20.0;
      }
    }
    v22 = [NSNumber numberWithDouble:v20];
    [v16 setHomeAffordanceOverlayAllowance:v22];

    v23 = (void *)[objc_alloc(MEMORY[0x1E4FB33B8]) initWithTop:v17 left:0.0 bottom:v5 right:0.0];
    [v16 setSafeAreaInsetsPortrait:v23];
  }
  return v16;
}

@end