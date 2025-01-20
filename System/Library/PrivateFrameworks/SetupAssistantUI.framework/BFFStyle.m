@interface BFFStyle
+ (id)sharedStyle;
- (CGSize)_effectiveSizeForIconSize:(CGSize)a3 inView:(id)a4;
- (CGSize)sizeForContinueButtonInAncestor:(id)a3;
- (UIEdgeInsets)edgeInsetsForHeaderView:(id)a3;
- (UIEdgeInsets)edgeInsetsForTable:(id)a3;
- (UIEdgeInsets)horizontalInsetsForContainingInView:(id)a3 width:(double)a4;
- (double)baselineInsetForHeaderTitle;
- (double)headerIconBaselineOffset;
- (double)headerIconBaselineOffsetForView:(id)a3;
- (double)headerSubheaderBaselineSpacingForView:(id)a3;
- (double)headerTitleBaselineOffsetForView:(id)a3 hasIcon:(BOOL)a4;
- (double)headerTitleBaselineOffsetForView:(id)a3 iconSize:(CGSize)a4;
- (double)headerTitleBaselineOffsetHasIcon:(BOOL)a3;
- (double)headerYOffsetForIcon:(id)a3 inView:(id)a4;
- (double)headerYOffsetForIconSize:(CGSize)a3 inView:(id)a4;
- (double)horizontalMarginForView:(id)a3;
- (double)nonTableHorizontalMargin;
- (double)screenHeaderFooterSideInsetForView:(id)a3;
- (double)screenHeaderHeightForView:(id)a3;
- (double)singleLineCellHeightForTable:(id)a3;
- (double)tallRowHeight;
- (id)backgroundColor;
- (id)continueButtonWithTitle:(id)a3 inView:(id)a4;
- (id)headerTitleFont;
- (id)tableCellFont;
- (void)applyAutomaticScrollToEdgeBehaviorOnNavigationItem:(id)a3;
- (void)applyThemeToAllTableViews;
- (void)applyThemeToLabel:(id)a3;
- (void)applyThemeToNavigationController:(id)a3;
- (void)applyThemeToNavigationController:(id)a3 allowUnderlap:(BOOL)a4;
- (void)applyThemeToRemoteUIWebViewController:(id)a3;
- (void)applyThemeToSectionHeaderLabel:(id)a3;
- (void)applyThemeToTableCell:(id)a3;
- (void)applyThemeToTextView:(id)a3;
- (void)applyThemeToTitleLabel:(id)a3;
@end

@implementation BFFStyle

+ (id)sharedStyle
{
  if (sharedStyle_onceToken != -1) {
    dispatch_once(&sharedStyle_onceToken, &__block_literal_global_0);
  }
  v2 = (void *)sharedStyle__instance;
  return v2;
}

uint64_t __23__BFFStyle_sharedStyle__block_invoke()
{
  sharedStyle__instance = objc_opt_new();
  return MEMORY[0x270F9A758]();
}

- (id)headerTitleFont
{
  v2 = (void *)MEMORY[0x263F82768];
  v3 = _BFFHeaderTextStyle();
  v4 = [v2 preferredFontDescriptorWithTextStyle:v3];

  v5 = (void *)MEMORY[0x263F82760];
  v6 = [v4 fontDescriptorWithSymbolicTraits:2];
  v7 = [v5 fontWithDescriptor:v6 size:0.0];

  return v7;
}

- (CGSize)_effectiveSizeForIconSize:(CGSize)a3 inView:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  id v6 = a4;
  v7 = v6;
  double v8 = *MEMORY[0x263F001B0];
  double v9 = *(double *)(MEMORY[0x263F001B0] + 8);
  if (width != *MEMORY[0x263F001B0] || height != v9)
  {
    [v6 bounds];
    if (width >= v11) {
      double v8 = v11;
    }
    else {
      double v8 = width;
    }
    [v7 bounds];
    if (width >= v12)
    {
      [v7 bounds];
      double v9 = height * (v13 / width);
    }
    else
    {
      double v9 = height;
    }
  }

  double v14 = v8;
  double v15 = v9;
  result.double height = v15;
  result.double width = v14;
  return result;
}

- (double)headerYOffsetForIconSize:(CGSize)a3 inView:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  id v7 = a4;
  -[BFFStyle _effectiveSizeForIconSize:inView:](self, "_effectiveSizeForIconSize:inView:", v7, width, height);
  double v10 = v9;
  if (v9 >= 100.001)
  {
    if (v8 < v9) {
      double v8 = v9;
    }
    double v12 = 0.0;
    if (v8 < 160.001)
    {
      double v13 = [v7 window];
      [v13 frame];
      double v15 = -(_BFFIconTitleBaselineOffset(v7) - v14 * 0.34) - v10;

      double v12 = fmax(v15, 0.0);
    }
  }
  else
  {
    double v11 = _BFFCGFloatByDeviceHeight(v7, 37.0, 44.0, 44.0, 50.0, 119.0, 250.0, 119.0, 55.0);
    double v12 = fmax(v11 - _CGFloatByIdiom(v7, 0.0, 24.0, 0.0) - v10, 0.0);
  }

  return v12;
}

- (double)headerTitleBaselineOffsetForView:(id)a3 iconSize:(CGSize)a4
{
  double height = a4.height;
  double width = a4.width;
  double v7 = *MEMORY[0x263F001B0];
  double v8 = *(double *)(MEMORY[0x263F001B0] + 8);
  id v9 = a3;
  double v10 = v9;
  if (width == v7 && height == v8)
  {
    double v18 = _BFFCGFloatByDeviceHeight(v9, 37.0, 44.0, 44.0, 50.0, 119.0, 250.0, 119.0, 55.0);

    return v18;
  }
  else
  {
    -[BFFStyle _effectiveSizeForIconSize:inView:](self, "_effectiveSizeForIconSize:inView:", v9, width, height);
    double v13 = v12;
    -[BFFStyle headerYOffsetForIconSize:inView:](self, "headerYOffsetForIconSize:inView:", v10, width, height);
    double v15 = v14 + v13;
    double v16 = _BFFIconTitleBaselineOffset(v10);

    return v15 + v16;
  }
}

- (double)headerYOffsetForIcon:(id)a3 inView:(id)a4
{
  id v6 = a4;
  [a3 size];
  -[BFFStyle headerYOffsetForIconSize:inView:](self, "headerYOffsetForIconSize:inView:", v6);
  double v8 = v7;

  return v8;
}

- (double)headerIconBaselineOffsetForView:(id)a3
{
  id v3 = a3;
  double v4 = _BFFCGFloatByDeviceHeight(v3, 37.0, 44.0, 44.0, 50.0, 119.0, 250.0, 119.0, 55.0);
  double v5 = _CGFloatByIdiom(v3, 0.0, 24.0, 0.0);

  return v4 - v5;
}

- (double)headerIconBaselineOffset
{
  [(BFFStyle *)self headerIconBaselineOffsetForView:0];
  return result;
}

- (double)headerTitleBaselineOffsetForView:(id)a3 hasIcon:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  [(BFFStyle *)self headerIconBaselineOffsetForView:v6];
  double v8 = v7;
  if (v4)
  {
    double v9 = _BFFIconTitleBaselineOffset(v6);

    return v8 + v9;
  }
  else
  {
  }
  return v8;
}

- (double)headerTitleBaselineOffsetHasIcon:(BOOL)a3
{
  [(BFFStyle *)self headerTitleBaselineOffsetForView:0 hasIcon:a3];
  return result;
}

- (double)headerSubheaderBaselineSpacingForView:(id)a3
{
  return _CGFloatByIdiom(a3, 32.0, 44.0, 44.0);
}

- (double)screenHeaderHeightForView:(id)a3
{
  return _BFFCGFloatByDeviceHeight(a3, 0.0, 0.0, 0.0, 240.5, 240.5, 371.5, 371.5, 0.0);
}

- (double)screenHeaderFooterSideInsetForView:(id)a3
{
  return _BFFCGFloatByDeviceHeight(a3, 0.0, 0.0, 0.0, 100.0, 100.0, 228.0, 399.0, 0.0);
}

- (double)baselineInsetForHeaderTitle
{
  return _BFFCGFloatByDeviceHeight(0, 37.0, 44.0, 44.0, 50.0, 119.0, 250.0, 119.0, 55.0);
}

- (UIEdgeInsets)edgeInsetsForHeaderView:(id)a3
{
  id v4 = a3;
  int v5 = [v4 _shouldReverseLayoutDirection];
  double v6 = _CGFloatByIdiom(v4, 15.0, 15.0, 15.0);
  double v7 = _CGFloatByIdiom(v4, 15.0, 0.0, 0.0);
  if (v5) {
    double v8 = v6;
  }
  else {
    double v8 = v7;
  }
  if (v5) {
    double v6 = v7;
  }
  [(BFFStyle *)self baselineInsetForHeaderTitle];
  double v10 = v9;
  double v11 = [(BFFStyle *)self headerTitleFont];
  [v11 ascender];
  double v13 = v10 + v12;

  double v14 = _BFFCGFloatByDeviceHeight(v4, 27.5, 35.5, 39.3333333, 52.5, 52.5, 32.0, 32.0, 32.0);
  double v15 = v13;
  double v16 = v6;
  double v17 = v14;
  double v18 = v8;
  result.right = v18;
  result.bottom = v17;
  result.left = v16;
  result.top = v15;
  return result;
}

- (id)tableCellFont
{
  v2 = [MEMORY[0x263F82770] metricsForTextStyle:*MEMORY[0x263F83570]];
  id v3 = [MEMORY[0x263EFF960] currentLocale];
  id v4 = [v3 localeIdentifier];
  int v5 = [v4 isEqualToString:@"ja"];

  double v6 = (double *)MEMORY[0x263F83638];
  if (v5) {
    double v6 = (double *)MEMORY[0x263F83648];
  }
  double v7 = [MEMORY[0x263F82760] systemFontOfSize:17.0 weight:*v6];
  double v8 = [v2 scaledFontForFont:v7];

  return v8;
}

- (double)singleLineCellHeightForTable:(id)a3
{
  return 60.0;
}

- (double)nonTableHorizontalMargin
{
  _BFFTableInset(0);
  return result;
}

- (double)horizontalMarginForView:(id)a3
{
  _BFFTableInset(a3);
  return result;
}

- (UIEdgeInsets)horizontalInsetsForContainingInView:(id)a3 width:(double)a4
{
  id v5 = a3;
  double v6 = *MEMORY[0x263F834E8];
  double v7 = *(double *)(MEMORY[0x263F834E8] + 16);
  if (_useCompactMetrics(v5))
  {
    _BFFTableInset(v5);
    double v9 = v8;
    double v10 = v8;
  }
  else
  {
    [v5 bounds];
    double v12 = v11;
    double v14 = v13;
    double v16 = v15;
    double v17 = [v5 window];
    if (v17) {
      [v5 window];
    }
    else {
    double v18 = [MEMORY[0x263F82B60] mainScreen];
    }
    [v18 bounds];
    double v20 = v19;

    v21 = [v5 window];
    objc_msgSend(v5, "convertRect:toView:", v21, v12, v14, a4, v16);
    CGFloat v23 = v22;
    CGFloat v25 = v24;
    CGFloat v27 = v26;
    CGFloat v29 = v28;

    v39.origin.x = v23;
    v39.origin.y = v25;
    v39.size.double width = v27;
    v39.size.double height = v29;
    double MinX = CGRectGetMinX(v39);
    v40.origin.x = v23;
    v40.origin.y = v25;
    v40.size.double width = v27;
    v40.size.double height = v29;
    CGFloat MaxX = CGRectGetMaxX(v40);
    double v32 = (v20 + -536.0) * 0.5;
    double v33 = v32 - (v20 - MaxX);
    BOOL v34 = v32 - MinX < 0.0;
    if (v33 < 0.0) {
      BOOL v34 = 1;
    }
    if (v34) {
      double v9 = 24.0;
    }
    else {
      double v9 = v33;
    }
    if (v34) {
      double v10 = 24.0;
    }
    else {
      double v10 = v32 - MinX;
    }
  }

  double v35 = v6;
  double v36 = v10;
  double v37 = v7;
  double v38 = v9;
  result.right = v38;
  result.bottom = v37;
  result.left = v36;
  result.top = v35;
  return result;
}

- (UIEdgeInsets)edgeInsetsForTable:(id)a3
{
  id v3 = a3;
  _BFFTableInset(v3);
  double v5 = v4;
  [v3 contentInset];
  double v7 = v6;
  [v3 separatorInset];
  double v9 = v5 - v8;
  uint64_t v10 = _BFFHeightByDeviceSize(v3);

  if (v10 == 7) {
    double v11 = 212.0;
  }
  else {
    double v11 = 0.0;
  }
  double v12 = v7;
  double v13 = v9;
  double v14 = v5;
  result.right = v14;
  result.bottom = v11;
  result.left = v13;
  result.top = v12;
  return result;
}

- (id)backgroundColor
{
  return (id)[MEMORY[0x263F825C8] _systemBackgroundColor];
}

- (void)applyThemeToNavigationController:(id)a3 allowUnderlap:(BOOL)a4
{
  id v4 = [a3 navigationBar];
  [v4 _setHidesShadow:1];
}

- (void)applyAutomaticScrollToEdgeBehaviorOnNavigationItem:(id)a3
{
  id v3 = a3;
  if (([v3 _isManualScrollEdgeAppearanceEnabled] & 1) == 0)
  {
    [v3 _setAutoScrollEdgeTransitionDistance:16.0];
    [v3 _setManualScrollEdgeAppearanceEnabled:1];
  }
}

- (void)applyThemeToNavigationController:(id)a3
{
}

- (id)continueButtonWithTitle:(id)a3 inView:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  double v7 = +[BFFContinueButton buttonWithType:0];
  [v7 setTitle:v6 forState:0];

  double v8 = [MEMORY[0x263F82770] metricsForTextStyle:*MEMORY[0x263F835D0]];
  [v7 frame];
  double v10 = v9;
  double v12 = v11;
  [v8 scaledValueForValue:50.0];
  if (v13 <= 100.0) {
    double v14 = v13;
  }
  else {
    double v14 = 100.0;
  }
  objc_msgSend(v7, "setFrame:", v10, v12, 288.0, v14);
  [v5 addSubview:v7];

  return v7;
}

- (CGSize)sizeForContinueButtonInAncestor:(id)a3
{
  id v4 = a3;
  [v4 bounds];
  [(BFFStyle *)self horizontalInsetsForContainingInView:v4 width:v5];
  double v7 = v6;
  double v9 = v8;
  double v10 = [MEMORY[0x263F82770] metricsForTextStyle:*MEMORY[0x263F83570]];
  [v10 scaledValueForValue:50.0];
  if (v11 <= 100.0) {
    double v12 = v11;
  }
  else {
    double v12 = 100.0;
  }
  [v4 bounds];
  double v14 = v13;

  if (v14 - v7 - v9 <= 327.0) {
    double v15 = v14 - v7 - v9;
  }
  else {
    double v15 = 327.0;
  }

  double v16 = v15;
  double v17 = v12;
  result.double height = v17;
  result.double width = v16;
  return result;
}

- (double)tallRowHeight
{
  return 60.0;
}

- (void)applyThemeToLabel:(id)a3
{
  id v3 = (void *)MEMORY[0x263F825C8];
  id v4 = a3;
  double v5 = [v3 _labelColor];
  [v4 setTextColor:v5];

  id v6 = [MEMORY[0x263F825C8] clearColor];
  [v4 setBackgroundColor:v6];
}

- (void)applyThemeToTextView:(id)a3
{
  id v3 = (void *)MEMORY[0x263F825C8];
  id v4 = a3;
  double v5 = [v3 clearColor];
  [v4 setBackgroundColor:v5];

  id v6 = [MEMORY[0x263F825C8] _labelColor];
  [v4 setTextColor:v6];
}

- (void)applyThemeToRemoteUIWebViewController:(id)a3
{
  id v5 = [a3 webView];
  id v4 = [(BFFStyle *)self backgroundColor];
  [v5 setBackgroundColor:v4];
}

- (void)applyThemeToAllTableViews
{
  v18[1] = *MEMORY[0x263EF8340];
  id v3 = [MEMORY[0x263F82C78] appearance];
  id v4 = [MEMORY[0x263F825C8] colorWithWhite:1.0 alpha:0.300000012];
  [v3 setSeparatorBottomShadowColor:v4];

  id v5 = (void *)MEMORY[0x263F828E0];
  v18[0] = objc_opt_class();
  id v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v18 count:1];
  double v7 = [v5 appearanceWhenContainedInInstancesOfClasses:v6];
  double v8 = [MEMORY[0x263F825C8] clearColor];
  [v7 setBackgroundColor:v8];

  double v9 = (void *)MEMORY[0x263F828E0];
  uint64_t v17 = objc_opt_class();
  double v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v17 count:1];
  double v11 = [v9 appearanceWhenContainedInInstancesOfClasses:v10];
  double v12 = [MEMORY[0x263F825C8] _labelColor];
  [v11 setTextColor:v12];

  double v13 = [MEMORY[0x263F82C78] appearance];
  double v14 = [MEMORY[0x263F825C8] _systemBackgroundColor];
  [v13 setBackgroundColor:v14];

  double v15 = [MEMORY[0x263F82C80] appearance];
  double v16 = [(BFFStyle *)self backgroundColor];
  [v15 setBackgroundColor:v16];
}

- (void)applyThemeToTitleLabel:(id)a3
{
  id v4 = (void *)MEMORY[0x263F825C8];
  id v9 = a3;
  id v5 = [v4 _labelColor];
  [v9 setTextColor:v5];

  id v6 = [(BFFStyle *)self backgroundColor];
  [v9 setBackgroundColor:v6];

  double v7 = +[BFFStyle sharedStyle];
  double v8 = [v7 headerTitleFont];
  [v9 setFont:v8];

  [v9 setTextAlignment:1];
  [v9 setNumberOfLines:0];
}

- (void)applyThemeToTableCell:(id)a3
{
  id v3 = a3;
  id v8 = [v3 textLabel];
  id v4 = +[BFFStyle sharedStyle];
  id v5 = [v4 tableCellFont];
  [v8 setFont:v5];

  [v8 setAdjustsFontSizeToFitWidth:1];
  id v6 = [v8 font];
  [v6 pointSize];
  [v8 setMinimumScaleFactor:12.0 / v7];

  [v3 setAccessoryType:1];
}

- (void)applyThemeToSectionHeaderLabel:(id)a3
{
  id v3 = (void *)MEMORY[0x263F825C8];
  id v4 = a3;
  id v5 = [v3 _secondaryLabelColor];
  [v4 setTextColor:v5];

  id v6 = [MEMORY[0x263F82760] preferredFontForTextStyle:*MEMORY[0x263F835F0]];
  [v4 setFont:v6];

  [v4 setTextAlignment:4];
  id v7 = [MEMORY[0x263F825C8] clearColor];
  [v4 setBackgroundColor:v7];
}

@end