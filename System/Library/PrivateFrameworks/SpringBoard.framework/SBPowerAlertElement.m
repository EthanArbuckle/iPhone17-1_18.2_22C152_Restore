@interface SBPowerAlertElement
- (BOOL)isLowPowerModeEnabled;
- (BOOL)isProvidedViewConcentric:(id)a3 inLayoutMode:(int64_t)a4;
- (BOOL)shouldSuppressElementWhileProximityReaderPresent;
- (BSUICAPackageView)minimalBatteryIconPackageView;
- (BSUICAPackageView)trailingBatteryIconPackageView;
- (NSDirectionalEdgeInsets)preferredEdgeOutsetsForLayoutMode:(int64_t)a3 suggestedOutsets:(NSDirectionalEdgeInsets)a4 maximumOutsets:(NSDirectionalEdgeInsets)a5;
- (SBPowerAlertElement)initWithIdentifier:(id)a3 style:(unint64_t)a4 batteryPercentage:(double)a5 lowPowerModeEnabled:(BOOL)a6 action:(id)a7;
- (UIColor)keyColor;
- (UILabel)leadingLabel;
- (UILabel)trailingBatteryLabel;
- (double)_batteryFillWidthForBatteryPercentage:(double)a3;
- (double)_trailingViewWidth;
- (double)batteryPercentage;
- (double)preferredAlertingDuration:(double)result;
- (id)_leadingTextForStyle:(unint64_t)a3;
- (unint64_t)style;
- (void)_trailingViewWidth;
- (void)_updateBatteryContent;
- (void)_updateBatteryIconFillAreaForPackageView:(id)a3 withBatteryPercentage:(double)a4;
- (void)_updateMinimalViewToState:(id)a3 withDelay:(BOOL)a4;
- (void)setBatteryPercentage:(double)a3;
- (void)setLeadingLabel:(id)a3;
- (void)setLowPowerModeEnabled:(BOOL)a3;
- (void)setMinimalBatteryIconPackageView:(id)a3;
- (void)setStyle:(unint64_t)a3;
- (void)setTrailingBatteryIconPackageView:(id)a3;
- (void)setTrailingBatteryLabel:(id)a3;
@end

@implementation SBPowerAlertElement

- (SBPowerAlertElement)initWithIdentifier:(id)a3 style:(unint64_t)a4 batteryPercentage:(double)a5 lowPowerModeEnabled:(BOOL)a6 action:(id)a7
{
  v79[8] = *MEMORY[0x1E4F143B8];
  id v75 = a3;
  id v74 = a7;
  id v11 = objc_alloc_init(MEMORY[0x1E4FA7D70]);
  id v12 = objc_alloc_init(MEMORY[0x1E4F42B38]);
  unint64_t v53 = a4;
  v13 = [(SBPowerAlertElement *)self _leadingTextForStyle:a4];
  [v12 setText:v13];

  v14 = [v12 text];
  [v12 setAccessibilityLabel:v14];

  v15 = objc_msgSend(MEMORY[0x1E4F42A30], "sbui_systemAperturePreferredFontForTextStyle:", 4);
  [v12 setFont:v15];

  id obj = v12;
  v76 = v11;
  v72 = (void *)[objc_alloc(MEMORY[0x1E4FA7D78]) initWithView:v12];
  objc_msgSend(v11, "setLeadingContentViewProvider:");
  id v16 = objc_alloc(MEMORY[0x1E4F42FF0]);
  [(SBPowerAlertElement *)self _trailingViewWidth];
  v18 = objc_msgSend(v16, "initWithFrame:", 0.0, 0.0, v17, 37.333);
  id v19 = objc_alloc_init(MEMORY[0x1E4F42B38]);
  [v19 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v18 addSubview:v19];
  id v20 = objc_alloc(MEMORY[0x1E4F4F8A0]);
  v21 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  v22 = (void *)[v20 initWithPackageName:@"Battery-D73" inBundle:v21];

  [v22 setTranslatesAutoresizingMaskIntoConstraints:0];
  if ([(id)*MEMORY[0x1E4F43630] userInterfaceLayoutDirection] == 1)
  {
    CGAffineTransformMakeScale(&v78, -1.0, 1.0);
    [v22 setTransform:&v78];
  }
  [v18 addSubview:v22];
  v59 = (void *)MEMORY[0x1E4F28DC8];
  v68 = [v19 centerYAnchor];
  v67 = [v18 centerYAnchor];
  v66 = [v68 constraintEqualToAnchor:v67];
  v79[0] = v66;
  v71 = v19;
  v65 = [v19 trailingAnchor];
  v64 = [v22 leadingAnchor];
  v63 = [v65 constraintEqualToAnchor:v64 constant:-2.0];
  v79[1] = v63;
  v62 = [v22 centerYAnchor];
  v61 = [v18 centerYAnchor];
  v60 = [v62 constraintEqualToAnchor:v61];
  v79[2] = v60;
  v58 = [v22 trailingAnchor];
  v57 = [v18 trailingAnchor];
  v56 = [v58 constraintEqualToAnchor:v57];
  v79[3] = v56;
  v55 = [v22 widthAnchor];
  v23 = [v55 constraintEqualToConstant:42.0];
  v79[4] = v23;
  v70 = v22;
  v24 = [v22 heightAnchor];
  v25 = [v24 constraintEqualToConstant:21.0];
  v79[5] = v25;
  v26 = [v18 widthAnchor];
  [(SBPowerAlertElement *)self _trailingViewWidth];
  v27 = objc_msgSend(v26, "constraintEqualToConstant:");
  v79[6] = v27;
  v28 = [v18 heightAnchor];
  v29 = [v28 constraintEqualToConstant:37.333];
  v79[7] = v29;
  [MEMORY[0x1E4F1C978] arrayWithObjects:v79 count:8];
  v31 = v30 = self;
  [v59 activateConstraints:v31];

  v32 = v30;
  v33 = v18;

  v34 = v76;
  v69 = (void *)[objc_alloc(MEMORY[0x1E4FA7D78]) initWithView:v18];
  objc_msgSend(v76, "setTrailingContentViewProvider:");
  id v35 = objc_alloc(MEMORY[0x1E4F4F8A0]);
  v36 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  v37 = (void *)[v35 initWithPackageName:@"Battery-Minimal-D73" inBundle:v36];

  v38 = (void *)[objc_alloc(MEMORY[0x1E4FA7D78]) initWithView:v37];
  [v76 setMinimalContentViewProvider:v38];
  v39 = v74;
  if (v74)
  {
    v40 = (void *)[objc_alloc(MEMORY[0x1E4FA7D58]) initWithDefaultTextActionConfigurationWithAction:v74];
    [v76 setActionContentViewProvider:v40];
  }
  v77.receiver = v32;
  v77.super_class = (Class)SBPowerAlertElement;
  v41 = v75;
  v42 = [(SBSystemApertureProvidedContentElement *)&v77 initWithIdentifier:v75 contentProvider:v76];
  v43 = v42;
  v44 = obj;
  v45 = v70;
  v46 = v71;
  if (v42)
  {
    v42->_style = v53;
    v42->_batteryPercentage = a5;
    v42->_lowPowerModeEnabled = a6;
    objc_storeStrong((id *)&v42->_leadingLabel, obj);
    objc_storeStrong((id *)&v43->_trailingBatteryLabel, v71);
    objc_storeStrong((id *)&v43->_trailingBatteryIconPackageView, v70);
    objc_storeStrong((id *)&v43->_minimalBatteryIconPackageView, v37);
    [(SBSystemApertureProvidedContentElement *)v43 setMinimumSupportedLayoutMode:-1];
    v47 = [v76 actionContentViewProvider];
    v48 = v38;
    v49 = v33;
    if (v47) {
      uint64_t v50 = 3;
    }
    else {
      uint64_t v50 = 2;
    }

    uint64_t v51 = v50;
    v33 = v49;
    v38 = v48;
    v39 = v74;
    v44 = obj;
    v41 = v75;
    v46 = v71;
    v45 = v70;
    v34 = v76;
    [(SBSystemApertureProvidedContentElement *)v43 setMaximumSupportedLayoutMode:v51];
    [(SBSystemApertureProvidedContentElement *)v43 setPreferredLayoutMode:2];
    [(SBPowerAlertElement *)v43 _updateBatteryContent];
  }

  return v43;
}

- (BOOL)isProvidedViewConcentric:(id)a3 inLayoutMode:(int64_t)a4
{
  id v5 = a3;
  id v6 = [(SBPowerAlertElement *)self leadingLabel];

  return v6 != v5;
}

- (NSDirectionalEdgeInsets)preferredEdgeOutsetsForLayoutMode:(int64_t)a3 suggestedOutsets:(NSDirectionalEdgeInsets)a4 maximumOutsets:(NSDirectionalEdgeInsets)a5
{
  v11.receiver = self;
  v11.super_class = (Class)SBPowerAlertElement;
  -[SBSystemApertureProvidedContentElement preferredEdgeOutsetsForLayoutMode:suggestedOutsets:maximumOutsets:](&v11, sel_preferredEdgeOutsetsForLayoutMode_suggestedOutsets_maximumOutsets_, a4.top, a4.leading, a4.bottom, a4.trailing, a5.top, a5.leading, a5.bottom, a5.trailing);
  if (v7 >= v9) {
    double v10 = v9;
  }
  else {
    double v10 = v7;
  }
  if (a3 == 2)
  {
    double v7 = v10;
    double v9 = v10;
  }
  result.trailing = v9;
  result.bottom = v8;
  result.leading = v7;
  result.top = v6;
  return result;
}

- (UIColor)keyColor
{
  return self->_keyColor;
}

- (double)preferredAlertingDuration:(double)result
{
  if (self->_style == 1 && result < 5.0) {
    return 5.0;
  }
  return result;
}

- (BOOL)shouldSuppressElementWhileProximityReaderPresent
{
  return 0;
}

- (void)setBatteryPercentage:(double)a3
{
  if (self->_batteryPercentage != a3)
  {
    self->_batteryPercentage = a3;
    [(SBPowerAlertElement *)self _updateBatteryContent];
  }
}

- (void)_updateBatteryContent
{
  v53[1] = *MEMORY[0x1E4F143B8];
  [(SBPowerAlertElement *)self batteryPercentage];
  double v4 = v3;
  id v5 = [(SBPowerAlertElement *)self trailingBatteryIconPackageView];
  [(SBPowerAlertElement *)self _updateBatteryIconFillAreaForPackageView:v5 withBatteryPercentage:v4];
  v45 = [(SBPowerAlertElement *)self minimalBatteryIconPackageView];
  -[SBPowerAlertElement _updateBatteryIconFillAreaForPackageView:withBatteryPercentage:](self, "_updateBatteryIconFillAreaForPackageView:withBatteryPercentage:", v4);
  unint64_t v6 = [(SBPowerAlertElement *)self style];
  BOOL v7 = [(SBPowerAlertElement *)self isLowPowerModeEnabled];
  [MEMORY[0x1E4F42E28] lowBatteryLevel];
  int v8 = BSFloatLessThanOrEqualToFloat();
  if (v7)
  {
    double v9 = [MEMORY[0x1E4F428B8] colorWithRed:0.992156863 green:0.811764706 blue:0.345098039 alpha:1.0];
    double v10 = @"yellow";
  }
  else
  {
    if (v6) {
      int v11 = 0;
    }
    else {
      int v11 = v8;
    }
    if (v11 == 1)
    {
      double v9 = [MEMORY[0x1E4F428B8] colorWithRed:0.988235294 green:0.145098039 blue:0.231372549 alpha:1.0];
      double v10 = @"red";
    }
    else
    {
      if (v6 == 1) {
        int v12 = v8;
      }
      else {
        int v12 = 0;
      }
      if (v12 == 1)
      {
        double v9 = [MEMORY[0x1E4F428B8] colorWithRed:0.988235294 green:0.145098039 blue:0.231372549 alpha:1.0];
        double v10 = @"red-low";
      }
      else
      {
        double v9 = [MEMORY[0x1E4F428B8] colorWithRed:0.333333333 green:1.0 blue:0.670588235 alpha:1.0];
        double v10 = @"green";
      }
    }
  }
  v44 = v5;
  [v5 setState:v10 animated:1];
  [(SBPowerAlertElement *)self _updateMinimalViewToState:v10 withDelay:v6 == 0];
  if ((BSEqualObjects() & 1) == 0)
  {
    objc_storeStrong((id *)&self->_keyColor, v9);
    v13 = [MEMORY[0x1E4F28EB8] defaultCenter];
    v52 = @"SBSystemApertureNotificationUserInfoElementKey";
    v53[0] = self;
    v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v53 forKeys:&v52 count:1];
    [v13 postNotificationName:@"SBSystemApertureElementKeyColorDidInvalidateNotification" object:0 userInfo:v14];
  }
  v15 = [(SBPowerAlertElement *)self trailingBatteryLabel];
  [v15 setTextColor:v9];
  id v16 = (void *)SBApp;
  double v17 = [NSNumber numberWithDouble:v4];
  v18 = [v16 formattedPercentStringForNumber:v17];

  id v19 = objc_alloc(MEMORY[0x1E4F28E48]);
  uint64_t v50 = *MEMORY[0x1E4F42508];
  uint64_t v20 = v50;
  v21 = objc_msgSend(MEMORY[0x1E4F42A30], "sbui_systemAperturePreferredFontForTextStyle:", 5);
  uint64_t v51 = v21;
  v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v51 forKeys:&v50 count:1];
  v23 = (void *)[v19 initWithString:v18 attributes:v22];

  id v24 = objc_alloc(MEMORY[0x1E4F28B18]);
  uint64_t v48 = v20;
  v25 = objc_msgSend(MEMORY[0x1E4F42A30], "sbui_systemAperturePreferredFontForTextStyle:", 6);
  v49 = v25;
  v26 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v49 forKeys:&v48 count:1];
  v27 = (void *)[v24 initWithString:@"%" attributes:v26];

  uint64_t v28 = [v18 rangeOfString:@"%"];
  if (v28 != 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v30 = v28;
    objc_msgSend(v23, "replaceCharactersInRange:withAttributedString:", v28, v29, v27);
    id v31 = objc_alloc(MEMORY[0x1E4F28B18]);
    uint64_t v46 = v20;
    v32 = [MEMORY[0x1E4F42A30] systemFontOfSize:2.0];
    v47 = v32;
    v33 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v47 forKeys:&v46 count:1];
    v34 = (void *)[v31 initWithString:@" " attributes:v33];

    [v23 insertAttributedString:v34 atIndex:v30];
  }
  [v15 setAttributedText:v23];
  id v35 = [v23 accessibilityLabel];
  [v15 setAccessibilityLabel:v35];

  v36 = [v45 publishedObjectWithName:@"battery percentage"];
  uint64_t v37 = objc_opt_class();
  id v38 = v36;
  if (v37)
  {
    if (objc_opt_isKindOfClass()) {
      v39 = v38;
    }
    else {
      v39 = 0;
    }
  }
  else
  {
    v39 = 0;
  }
  id v40 = v39;

  v41 = [NSNumber numberWithDouble:round(v4 * 100.0)];
  v42 = [(id)SBApp formattedDecimalStringForNumber:v41];
  [v40 setString:v42];
  v43 = objc_msgSend(MEMORY[0x1E4F42A30], "sbui_systemAperturePreferredFontForTextStyle:", 5);
  [v40 setFont:v43];
}

- (void)_updateBatteryIconFillAreaForPackageView:(id)a3 withBatteryPercentage:(double)a4
{
  unint64_t v6 = [a3 publishedObjectWithName:@"Fill"];
  uint64_t v7 = objc_opt_class();
  id v17 = v6;
  if (v7)
  {
    if (objc_opt_isKindOfClass()) {
      int v8 = v17;
    }
    else {
      int v8 = 0;
    }
  }
  else
  {
    int v8 = 0;
  }
  id v9 = v8;

  [v9 bounds];
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  [(SBPowerAlertElement *)self _batteryFillWidthForBatteryPercentage:a4];
  objc_msgSend(v9, "setBounds:", v11, v13, v16, v15);
}

- (id)_leadingTextForStyle:(unint64_t)a3
{
  if (a3 == 1)
  {
    double v4 = [MEMORY[0x1E4F28B50] mainBundle];
    id v5 = v4;
    unint64_t v6 = @"LOW_BATT_TITLE_COMPACT";
  }
  else
  {
    if (a3) {
      goto LABEL_6;
    }
    double v4 = [MEMORY[0x1E4F28B50] mainBundle];
    id v5 = v4;
    unint64_t v6 = @"CHARGING_COMPACT";
  }
  double v3 = [v4 localizedStringForKey:v6 value:&stru_1F3084718 table:@"SpringBoard"];

LABEL_6:
  return v3;
}

- (double)_batteryFillWidthForBatteryPercentage:(double)a3
{
  int IsOne = BSFloatIsOne();
  double result = a3 * 81.0 + 9.0;
  if (IsOne) {
    return 105.0;
  }
  return result;
}

- (double)_trailingViewWidth
{
  unint64_t v2 = SBHScreenTypeForCurrentDevice() - 21;
  if (v2 < 8) {
    return dbl_1D8FD10A0[v2];
  }
  double v4 = SBLogStatusBarish();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT)) {
    -[SBPowerAlertElement _trailingViewWidth](v4);
  }

  return 0.0;
}

- (void)_updateMinimalViewToState:(id)a3 withDelay:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __59__SBPowerAlertElement__updateMinimalViewToState_withDelay___block_invoke;
  v11[3] = &unk_1E6AF5290;
  v11[4] = self;
  id v12 = v6;
  id v7 = v6;
  uint64_t v8 = MEMORY[0x1D948C7A0](v11);
  id v9 = (void *)v8;
  if (v4)
  {
    dispatch_time_t v10 = dispatch_time(0, 500000000);
    dispatch_after(v10, MEMORY[0x1E4F14428], v9);
  }
  else
  {
    (*(void (**)(uint64_t))(v8 + 16))(v8);
  }
}

void __59__SBPowerAlertElement__updateMinimalViewToState_withDelay___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) minimalBatteryIconPackageView];
  [v2 setState:*(void *)(a1 + 40) animated:1];
}

- (double)batteryPercentage
{
  return self->_batteryPercentage;
}

- (unint64_t)style
{
  return self->_style;
}

- (void)setStyle:(unint64_t)a3
{
  self->_style = a3;
}

- (BOOL)isLowPowerModeEnabled
{
  return self->_lowPowerModeEnabled;
}

- (void)setLowPowerModeEnabled:(BOOL)a3
{
  self->_lowPowerModeEnabled = a3;
}

- (UILabel)leadingLabel
{
  return self->_leadingLabel;
}

- (void)setLeadingLabel:(id)a3
{
}

- (UILabel)trailingBatteryLabel
{
  return self->_trailingBatteryLabel;
}

- (void)setTrailingBatteryLabel:(id)a3
{
}

- (BSUICAPackageView)trailingBatteryIconPackageView
{
  return self->_trailingBatteryIconPackageView;
}

- (void)setTrailingBatteryIconPackageView:(id)a3
{
}

- (BSUICAPackageView)minimalBatteryIconPackageView
{
  return self->_minimalBatteryIconPackageView;
}

- (void)setMinimalBatteryIconPackageView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_minimalBatteryIconPackageView, 0);
  objc_storeStrong((id *)&self->_trailingBatteryIconPackageView, 0);
  objc_storeStrong((id *)&self->_trailingBatteryLabel, 0);
  objc_storeStrong((id *)&self->_leadingLabel, 0);
  objc_storeStrong((id *)&self->_keyColor, 0);
}

- (void)_trailingViewWidth
{
  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_1D85BA000, log, OS_LOG_TYPE_FAULT, "Unexpected screen type displaying power alert element", v1, 2u);
}

@end