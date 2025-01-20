@interface TPIncomingCallMetricsProvider
+ (BOOL)deviceHasHomeButton;
+ (CGRect)fullDeviceBounds;
+ (CGRect)horizontalNameLabelBoundingRectForName:(id)a3 caption:(id)a4 window:(id)a5 preferredTitleFont:(id)a6;
+ (CGRect)horizontalNameLabelBoundingRectForName:(id)a3 window:(id)a4;
+ (CGRect)verticalNameLabelBoundingRectForName:(id)a3 caption:(id)a4 window:(id)a5 preferredTitleFont:(id)a6;
+ (CGRect)verticalNameLabelBoundingRectForName:(id)a3 window:(id)a4;
+ (double)callDetailsButtonPaddingPercentTop_ForSnapshot;
+ (double)callDetailsButtonPaddingTopPercent_DynamicIsland;
+ (double)callDetailsButtonPaddingTopPercent_HomeButton;
+ (double)callDetailsButtonPaddingTopPercent_Notch;
+ (double)callDetailsButtonPaddingTop_ForSnapshot;
+ (double)callDetailsButtonPaddingTrailPercent_ForSnapshot;
+ (double)callDetailsButtonPaddingTrail_ForSnapshot;
+ (double)callDetailsButtonPaddingTrailingPercent_DynamicIsland;
+ (double)callDetailsButtonPaddingTrailingPercent_HomeButton;
+ (double)callDetailsButtonPaddingTrailingPercent_Notch;
+ (double)fullDeviceHeight;
+ (double)fullDeviceWidth;
+ (double)homeButtonOffsetForSafeAreaFrame:(CGRect)a3;
+ (double)incomingCallAndInCallControlsBottomPadding;
+ (double)sideMarginForDoubleButton;
+ (double)sixPercentOfDeviceHeight;
+ (double)twelvePercentOfDeviceHeight;
+ (double)twentyTwoPointFivePercentOfDeviceHeight;
+ (double)verticalTextTopMargin;
+ (id)appropriateCallerNameViewForContact:(id)a3 callStatus:(id)a4 callIsActive:(BOOL)a5 optionalBackupName:(id)a6;
+ (id)callDetailsButtonMaxSize;
+ (id)mobileLabelFont;
+ (id)nameLabelFont;
+ (id)nameLabelFontWithAvatar;
+ (id)posterBadgeMaxSize;
+ (id)posterDisplayNameForContact:(id)a3;
+ (void)addCallerNameView:(id)a3 toContainerView:(id)a4;
+ (void)addCallerNameView:(id)a3 toViewController:(id)a4;
+ (void)constraintIncomingCallTextViewAdapterWrapper:(id)a3 toView:(id)a4;
+ (void)constraintIncomingCallTextViewForHorizontalLayout:(id)a3 toView:(id)a4;
+ (void)constraintIncomingCallTextViewForVerticalLayout:(id)a3 toView:(id)a4;
@end

@implementation TPIncomingCallMetricsProvider

+ (CGRect)horizontalNameLabelBoundingRectForName:(id)a3 window:(id)a4
{
  +[TPIncomingCallMetricsProvider horizontalNameLabelBoundingRectForName:a3 caption:0 window:a4 preferredTitleFont:0];
  result.size.height = v7;
  result.size.width = v6;
  result.origin.y = v5;
  result.origin.x = v4;
  return result;
}

+ (CGRect)horizontalNameLabelBoundingRectForName:(id)a3 caption:(id)a4 window:(id)a5 preferredTitleFont:(id)a6
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v10 = a5;
  id v11 = a6;
  id v12 = a4;
  id v13 = a3;
  v14 = (void *)[objc_alloc((Class)getPRIncomingCallTextViewAdapterWrapperClass()) initWithName:v13 status:v12];

  [v14 setPreferredLayout:0];
  if (v11) {
    [v14 setEmphasizedNameFont:v11];
  }
  id v15 = objc_alloc(MEMORY[0x1E4FB1EB0]);
  v16 = [MEMORY[0x1E4FB1BA8] mainScreen];
  [v16 bounds];
  v17 = objc_msgSend(v15, "initWithFrame:");

  v18 = [v14 viewController];
  v19 = [v18 view];

  [v17 addSubview:v19];
  [a1 constraintIncomingCallTextViewAdapterWrapper:v14 toView:v17];
  [v17 setNeedsLayout];
  [v17 layoutIfNeeded];
  [v19 frame];
  CGFloat v21 = v20;
  CGFloat v23 = v22;
  CGFloat v25 = v24;
  CGFloat v27 = v26;
  v28 = TPDefaultLog();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
  {
    v39.origin.x = v21;
    v39.origin.y = v23;
    v39.size.width = v25;
    v39.size.height = v27;
    v29 = NSStringFromCGRect(v39);
    int v34 = 138412546;
    v35 = v29;
    __int16 v36 = 2112;
    id v37 = v10;
    _os_log_impl(&dword_1C2F24000, v28, OS_LOG_TYPE_DEFAULT, "Returning horizontalNameLabelBoundingRect: %@ using window: %@", (uint8_t *)&v34, 0x16u);
  }
  double v30 = v21;
  double v31 = v23;
  double v32 = v25;
  double v33 = v27;
  result.size.height = v33;
  result.size.width = v32;
  result.origin.y = v31;
  result.origin.x = v30;
  return result;
}

+ (CGRect)verticalNameLabelBoundingRectForName:(id)a3 window:(id)a4
{
  +[TPIncomingCallMetricsProvider verticalNameLabelBoundingRectForName:a3 caption:0 window:a4 preferredTitleFont:0];
  result.size.height = v7;
  result.size.width = v6;
  result.origin.y = v5;
  result.origin.x = v4;
  return result;
}

+ (CGRect)verticalNameLabelBoundingRectForName:(id)a3 caption:(id)a4 window:(id)a5 preferredTitleFont:(id)a6
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v9 = a6;
  id v10 = a4;
  id v11 = a3;
  id v12 = (void *)[objc_alloc((Class)getPRIncomingCallTextViewAdapterWrapperClass()) initWithName:v11 status:v10];

  [v12 setPreferredLayout:1];
  if (v9) {
    [v12 setEmphasizedNameFont:v9];
  }
  id v13 = objc_alloc(MEMORY[0x1E4FB1EB0]);
  v14 = [MEMORY[0x1E4FB1BA8] mainScreen];
  [v14 bounds];
  id v15 = objc_msgSend(v13, "initWithFrame:");

  v16 = [v12 viewController];
  v17 = [v16 view];

  [v15 addSubview:v17];
  [a1 constraintIncomingCallTextViewAdapterWrapper:v12 toView:v15];
  [v15 setNeedsLayout];
  [v15 layoutIfNeeded];
  [v17 frame];
  CGFloat v19 = v18;
  CGFloat v21 = v20;
  CGFloat v23 = v22;
  double v25 = v24;
  [getPRIncomingCallMetricsProviderClass() maxVerticalTextHeight];
  if (v25 > v26)
  {
    [getPRIncomingCallMetricsProviderClass() maxVerticalTextHeight];
    double v25 = v27;
  }
  v28 = TPDefaultLog();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
  {
    v37.origin.x = v19;
    v37.origin.y = v21;
    v37.size.width = v23;
    v37.size.height = v25;
    v29 = NSStringFromCGRect(v37);
    int v34 = 138412290;
    v35 = v29;
    _os_log_impl(&dword_1C2F24000, v28, OS_LOG_TYPE_DEFAULT, "Returning verticalNameLabelBoundingRect: %@", (uint8_t *)&v34, 0xCu);
  }
  double v30 = v19;
  double v31 = v21;
  double v32 = v23;
  double v33 = v25;
  result.size.height = v33;
  result.size.width = v32;
  result.origin.y = v31;
  result.origin.x = v30;
  return result;
}

+ (id)appropriateCallerNameViewForContact:(id)a3 callStatus:(id)a4 callIsActive:(BOOL)a5 optionalBackupName:(id)a6
{
  BOOL v7 = a5;
  id v9 = a3;
  id v10 = a6;
  id v11 = (void *)MEMORY[0x1E4FB16C8];
  id v12 = a4;
  id v13 = [v11 currentDevice];
  uint64_t v14 = [v13 userInterfaceIdiom];

  if (!v9 || v14 == 1)
  {
    uint64_t v16 = +[TPIncomingCallMetricsProvider posterDisplayNameForContact:v9];
    id v15 = (void *)[objc_alloc((Class)getPRIncomingCallTextViewAdapterWrapperClass()) initWithName:v16 status:v12 callIsActive:v7];

    id v12 = (id)v16;
  }
  else
  {
    id v15 = (void *)[objc_alloc((Class)getPRIncomingCallTextViewAdapterWrapperClass()) initWithContact:v9 status:v12 callIsActive:v7];
  }

  if (_AXSPrefersHorizontalTextLayout()) {
    [v15 overrideTitleLayoutWith:0];
  }
  v17 = [v15 displayNameText];
  if ([v17 length])
  {
  }
  else
  {
    uint64_t v18 = [v10 length];

    if (v18) {
      [v15 setDisplayNameText:v10];
    }
  }

  return v15;
}

+ (void)addCallerNameView:(id)a3 toViewController:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  BOOL v7 = [v6 contentViewCoordinator];
  v8 = [v7 vibrantObscurableContentView];
  id v31 = v5;
  id v9 = [v31 viewController];
  [v9 willMoveToParentViewController:v6];
  [v6 addChildViewController:v9];
  id v10 = [v9 view];
  [v8 addSubview:v10];

  [v9 didMoveToParentViewController:v6];
  [v6 registerPosterAppearanceObserver:v31];
  id v11 = [v6 obscurableContentView];
  +[TPIncomingCallMetricsProvider constraintIncomingCallTextViewAdapterWrapper:v31 toView:v11];

  id v12 = [v31 emojiViewController];

  if (v12)
  {
    id v13 = [v7 obscurableOverlayView];
    uint64_t v14 = [v31 emojiViewController];
    [v14 willMoveToParentViewController:v6];
    [v6 addChildViewController:v14];
    id v15 = [v14 view];
    [v13 addSubview:v15];

    [v14 didMoveToParentViewController:v6];
  }
  uint64_t v16 = [v7 vibrantObscurableContentView];
  [v16 setNeedsLayout];

  v17 = [v7 vibrantObscurableContentView];
  [v17 layoutIfNeeded];

  uint64_t v18 = [v31 emojiViewController];

  if (v18)
  {
    CGFloat v19 = [v31 viewController];
    double v20 = [v19 view];
    [v20 frame];
    double v22 = v21;
    double v24 = v23;
    double v26 = v25;
    double v28 = v27;

    v29 = [v31 emojiViewController];
    double v30 = [v29 view];
    objc_msgSend(v30, "setFrame:", v22, v24, v26, v28);
  }
  [v31 tightFrame];
  objc_msgSend(v7, "setPrimaryContentTightFrame:");
}

+ (void)addCallerNameView:(id)a3 toContainerView:(id)a4
{
  id v8 = a3;
  id v5 = a4;
  id v6 = [v8 viewController];
  BOOL v7 = [v6 view];
  [v5 addSubview:v7];

  +[TPIncomingCallMetricsProvider constraintIncomingCallTextViewAdapterWrapper:v8 toView:v5];
}

+ (void)constraintIncomingCallTextViewAdapterWrapper:(id)a3 toView:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [v7 viewController];
  id v10 = [v8 view];

  uint64_t v9 = [v7 layout];
  if (v9 == 1) {
    [a1 constraintIncomingCallTextViewForVerticalLayout:v10 toView:v6];
  }
  else {
    [a1 constraintIncomingCallTextViewForHorizontalLayout:v10 toView:v6];
  }
}

+ (void)constraintIncomingCallTextViewForHorizontalLayout:(id)a3 toView:(id)a4
{
  v25[4] = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  id v6 = a3;
  [v6 setTranslatesAutoresizingMaskIntoConstraints:0];
  +[TPIncomingCallMetricsProvider twentyTwoPointFivePercentOfDeviceHeight];
  double v8 = v7;
  [getPRIncomingCallMetricsProviderClass() horizontalTextEdgePadding];
  double v10 = v9;
  double v21 = (void *)MEMORY[0x1E4F28DC8];
  double v24 = [v6 lastBaselineAnchor];
  double v23 = [v5 topAnchor];
  double v22 = [v24 constraintEqualToAnchor:v23 constant:v8];
  v25[0] = v22;
  id v11 = [v6 centerXAnchor];
  id v12 = [v5 centerXAnchor];
  id v13 = [v11 constraintEqualToAnchor:v12];
  v25[1] = v13;
  uint64_t v14 = [v6 leadingAnchor];
  id v15 = [v5 leadingAnchor];
  uint64_t v16 = [v14 constraintEqualToAnchor:v15 constant:v10];
  v25[2] = v16;
  v17 = [v6 trailingAnchor];

  uint64_t v18 = [v5 trailingAnchor];

  CGFloat v19 = [v17 constraintEqualToAnchor:v18 constant:-v10];
  v25[3] = v19;
  double v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:v25 count:4];
  [v21 activateConstraints:v20];
}

+ (void)constraintIncomingCallTextViewForVerticalLayout:(id)a3 toView:(id)a4
{
  v22[3] = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  id v6 = a3;
  [v6 setTranslatesAutoresizingMaskIntoConstraints:0];
  +[TPIncomingCallMetricsProvider verticalTextTopMargin];
  double v8 = v7;
  double v9 = [MEMORY[0x1E4FB1BA8] mainScreen];
  if ([v9 screenSizeCategory] == 1) {
    double v10 = 16.0;
  }
  else {
    double v10 = 20.0;
  }

  double v21 = (void *)MEMORY[0x1E4F28DC8];
  id v11 = [v6 topAnchor];
  id v12 = [v5 topAnchor];
  id v13 = [v11 constraintEqualToAnchor:v12 constant:v8];
  v22[0] = v13;
  uint64_t v14 = [v6 leftAnchor];
  id v15 = [v5 leftAnchor];
  uint64_t v16 = [v14 constraintGreaterThanOrEqualToAnchor:v15 constant:v10];
  v22[1] = v16;
  v17 = [v6 rightAnchor];

  uint64_t v18 = [v5 rightAnchor];

  CGFloat v19 = [v17 constraintEqualToAnchor:v18 constant:-v10];
  v22[2] = v19;
  double v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:v22 count:3];
  [v21 activateConstraints:v20];
}

+ (id)nameLabelFont
{
  return (id)[MEMORY[0x1E4FB08E0] _preferredFontForTextStyle:*MEMORY[0x1E4FB2928] variant:1024 maximumContentSizeCategory:*MEMORY[0x1E4FB27B0]];
}

+ (id)nameLabelFontWithAvatar
{
  return (id)[MEMORY[0x1E4FB08E0] _preferredFontForTextStyle:*MEMORY[0x1E4FB2988] variant:1024 maximumContentSizeCategory:*MEMORY[0x1E4FB27B0]];
}

+ (id)mobileLabelFont
{
  return (id)[MEMORY[0x1E4FB08E0] _preferredFontForTextStyle:*MEMORY[0x1E4FB2990] variant:0 maximumContentSizeCategory:*MEMORY[0x1E4FB27B0]];
}

+ (double)homeButtonOffsetForSafeAreaFrame:(CGRect)a3
{
  double height = a3.size.height;
  CGFloat width = a3.size.width;
  double y = a3.origin.y;
  CGFloat x = a3.origin.x;
  double v7 = 0.0;
  if (+[TPUIConfiguration pipStatusBarPadding] == 5)
  {
    v11.origin.CGFloat x = x;
    v11.origin.double y = y;
    v11.size.CGFloat width = width;
    v11.size.double height = height;
    if (!CGRectIsEmpty(v11))
    {
      double v8 = [MEMORY[0x1E4FB1BA8] mainScreen];
      [v8 bounds];
      double v7 = v9 - (y + height);
    }
  }
  return v7;
}

+ (double)sixPercentOfDeviceHeight
{
  v2 = [MEMORY[0x1E4FB1BA8] mainScreen];
  [v2 bounds];
  double v4 = v3;

  id v5 = [MEMORY[0x1E4FB1BA8] mainScreen];
  [v5 bounds];
  double v7 = v6;

  if (v4 >= v7) {
    double v8 = v4;
  }
  else {
    double v8 = v7;
  }
  return v8 * 0.0599999987;
}

+ (double)twelvePercentOfDeviceHeight
{
  v2 = [MEMORY[0x1E4FB1BA8] mainScreen];
  [v2 bounds];
  double v4 = v3;

  id v5 = [MEMORY[0x1E4FB1BA8] mainScreen];
  [v5 bounds];
  double v7 = v6;

  if (v4 >= v7) {
    double v8 = v4;
  }
  else {
    double v8 = v7;
  }
  return v8 * 0.119999997;
}

+ (double)twentyTwoPointFivePercentOfDeviceHeight
{
  v2 = [MEMORY[0x1E4FB1BA8] mainScreen];
  [v2 bounds];
  double v4 = v3;

  id v5 = [MEMORY[0x1E4FB1BA8] mainScreen];
  [v5 bounds];
  double v7 = v6;

  if (v4 >= v7) {
    double v8 = v4;
  }
  else {
    double v8 = v7;
  }
  return v8 * 0.224999994;
}

+ (CGRect)fullDeviceBounds
{
  v2 = [MEMORY[0x1E4FB1BA8] mainScreen];
  [v2 bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;

  double v11 = v4;
  double v12 = v6;
  double v13 = v8;
  double v14 = v10;
  result.size.double height = v14;
  result.size.CGFloat width = v13;
  result.origin.double y = v12;
  result.origin.CGFloat x = v11;
  return result;
}

+ (double)fullDeviceHeight
{
  [a1 fullDeviceBounds];
  double v4 = v3;
  [a1 fullDeviceBounds];
  if (v4 >= v5) {
    return v4;
  }
  else {
    return v5;
  }
}

+ (double)fullDeviceWidth
{
  [a1 fullDeviceBounds];
  double v4 = v3;
  [a1 fullDeviceBounds];
  if (v4 >= v5) {
    return v5;
  }
  else {
    return v4;
  }
}

+ (BOOL)deviceHasHomeButton
{
  if (deviceHasHomeButton_onceToken != -1) {
    dispatch_once(&deviceHasHomeButton_onceToken, &__block_literal_global_11);
  }
  return deviceHasHomeButton_homeButtonType != 2;
}

uint64_t __52__TPIncomingCallMetricsProvider_deviceHasHomeButton__block_invoke()
{
  uint64_t result = MGGetSInt32Answer();
  deviceHasHomeButton_homeButtonType = result;
  return result;
}

+ (double)callDetailsButtonPaddingTopPercent_DynamicIsland
{
  return 7.39429998;
}

+ (double)callDetailsButtonPaddingTrailingPercent_DynamicIsland
{
  return 4.07119989;
}

+ (double)callDetailsButtonPaddingTopPercent_Notch
{
  return 6.63500023;
}

+ (double)callDetailsButtonPaddingTrailingPercent_Notch
{
  return 4.10249996;
}

+ (double)callDetailsButtonPaddingTopPercent_HomeButton
{
  return 4.34779978;
}

+ (double)callDetailsButtonPaddingTrailingPercent_HomeButton
{
  return 4.26660013;
}

+ (double)callDetailsButtonPaddingPercentTop_ForSnapshot
{
  if ([a1 deviceHasHomeButton])
  {
    objc_msgSend(a1, "callDetailsButtonPaddingTopPercent_HomeButton");
  }
  else
  {
    objc_msgSend(a1, "callDetailsButtonPaddingTopPercent_DynamicIsland");
  }
  return result;
}

+ (double)callDetailsButtonPaddingTrailPercent_ForSnapshot
{
  if ([a1 deviceHasHomeButton])
  {
    objc_msgSend(a1, "callDetailsButtonPaddingTrailingPercent_HomeButton");
  }
  else
  {
    objc_msgSend(a1, "callDetailsButtonPaddingTrailingPercent_DynamicIsland");
  }
  return result;
}

+ (double)callDetailsButtonPaddingTop_ForSnapshot
{
  [a1 fullDeviceHeight];
  double v4 = v3;
  objc_msgSend(a1, "callDetailsButtonPaddingPercentTop_ForSnapshot");
  return v4 * v5 / 100.0;
}

+ (double)callDetailsButtonPaddingTrail_ForSnapshot
{
  [a1 fullDeviceWidth];
  double v4 = v3;
  objc_msgSend(a1, "callDetailsButtonPaddingTrailPercent_ForSnapshot");
  return v4 * v5 / 100.0;
}

+ (id)callDetailsButtonMaxSize
{
  return (id)*MEMORY[0x1E4FB27B0];
}

+ (id)posterBadgeMaxSize
{
  return (id)*MEMORY[0x1E4FB27E8];
}

+ (double)verticalTextTopMargin
{
  v2 = [MEMORY[0x1E4FB1BA8] mainScreen];
  [v2 bounds];
  double v4 = v3;

  double v5 = [MEMORY[0x1E4FB1BA8] mainScreen];
  [v5 bounds];
  double v7 = v6;

  if (v4 >= v7) {
    double v8 = v4;
  }
  else {
    double v8 = v7;
  }
  return v8 * 0.129999995;
}

+ (double)sideMarginForDoubleButton
{
  [a1 fullDeviceWidth];
  return v2 * 0.102;
}

+ (double)incomingCallAndInCallControlsBottomPadding
{
  BOOL v3 = +[TPUIConfiguration screenSize] == 1;
  [a1 fullDeviceHeight];
  return v4 * dbl_1C2F73170[v3];
}

+ (id)posterDisplayNameForContact:(id)a3
{
  id v3 = a3;
  double v4 = (void *)posterDisplayNameForContact__sFormatter;
  if (!posterDisplayNameForContact__sFormatter)
  {
    id v5 = objc_alloc_init(MEMORY[0x1E4F1B910]);
    double v6 = (void *)posterDisplayNameForContact__sFormatter;
    posterDisplayNameForContact__sFormatter = (uint64_t)v5;

    [(id)posterDisplayNameForContact__sFormatter setStyle:0];
    double v4 = (void *)posterDisplayNameForContact__sFormatter;
  }
  double v7 = [v4 stringFromContact:v3];
  double v8 = v7;
  if (!v7) {
    double v7 = &stru_1F1E807C8;
  }
  double v9 = v7;

  return v9;
}

@end