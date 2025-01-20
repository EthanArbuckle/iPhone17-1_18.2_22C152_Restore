@interface UITableConstants_IOS
+ (id)sharedConstants;
- ($4B60890CD43C21BDA0D821D733CDDD8F)contentPropertiesForSidebarElementWithTraitCollection:(SEL)a3 state:(id)a4 isHeader:(id)a5 cellStyle:(BOOL)a6 sidebarStyle:(int64_t)a7;
- (BOOL)defaultLabelAllowsTighteningForTruncationForSidebar:(BOOL)a3 traitCollection:(id)a4;
- (BOOL)defaultRowHeightDependsOnCellStyle;
- (BOOL)imageViewOffsetByLayoutMarginsForCell:(id)a3 inTableView:(id)a4;
- (BOOL)reorderingCellWantsShadows;
- (BOOL)shouldAnimatePropertyInContentViewWithKey:(id)a3;
- (BOOL)shouldUppercaseHeaderFooterTextForTableStyle:(int64_t)a3 isHeader:(BOOL)a4;
- (BOOL)shouldUseDefaultTableLayoutMarginsAsContentInsets;
- (BOOL)supportsUserInterfaceStyles;
- (BOOL)useChromelessSectionHeadersAndFootersForTableStyle:(int64_t)a3;
- (CGRect)defaultDeleteMinusRectForCell:(id)a3 inTableView:(id)a4;
- (CGSize)defaultEditControlSizeForCell:(id)a3 inTableView:(id)a4;
- (CGSize)defaultReorderControlSizeForCell:(id)a3 withAccessoryBaseColor:(id)a4;
- (NSDirectionalEdgeInsets)defaultInsetGroupedHeaderLayoutMarginsForExtraProminentStyle:(BOOL)a3;
- (UIEdgeInsets)defaultCellLayoutMarginsForTableStyle:(int64_t)a3 cellStyle:(int64_t)a4 textLabelFont:(id)a5 rawLayoutMargins:(UIEdgeInsets)a6;
- (UIEdgeInsets)defaultHeaderFooterLayoutMarginsForTableViewStyle:(int64_t)a3 isHeader:(BOOL)a4 isFirstSection:(BOOL)a5;
- (UIEdgeInsets)defaultLayoutMarginsForCell:(id)a3 inTableView:(id)a4;
- (UIEdgeInsets)defaultLayoutMarginsForTableView:(id)a3;
- (UIEdgeInsets)defaultLayoutMarginsInsideSectionForSize:(CGSize)a3 tableStyle:(int64_t)a4;
- (UIEdgeInsets)defaultSectionContentInsetsForTableStyle:(int64_t)a3;
- (UIEdgeInsets)defaultSidebarLayoutMarginsForElementsInsideSection;
- (UIEdgeInsets)defaultTableLayoutMarginsForScreen:(id)a3 size:(CGSize)a4 tableStyle:(int64_t)a5;
- (UIEdgeInsets)reorderControlHoverEffectInsets;
- (_UITableConstantsBackgroundProperties)defaultCellBackgroundPropertiesForTableViewStyle:(SEL)a3 state:(int64_t)a4 traitCollection:(id)a5;
- (_UITableConstantsBackgroundProperties)defaultHeaderFooterBackgroundPropertiesForTableViewStyle:(SEL)a3 cellConfigurationState:(int64_t)a4 traitCollection:(id)a5 floating:(id)a6;
- (_UITableConstantsBackgroundProperties)defaultSidebarCellBackgroundPropertiesForStyle:(SEL)a3 state:(int64_t)a4 traitCollection:(id)a5;
- (_UITableConstantsBackgroundProperties)defaultSidebarHeaderBackgroundPropertiesWithState:(SEL)a3 traitCollection:(id)a4;
- (double)_defaultMarginWidthForTableView:(id)a3 canUseLayoutMargins:(BOOL)a4;
- (double)defaultAlphaForDraggingCell:(id)a3 inTableView:(id)a4;
- (double)defaultAlphaForReorderingCell;
- (double)defaultCellContentLeadingPaddingForSidebar:(BOOL)a3;
- (double)defaultCellContentTrailingPadding;
- (double)defaultCellCornerRadiusForTableViewStyle:(int64_t)a3 isSidebarStyle:(BOOL)a4 isHeaderFooter:(BOOL)a5 traitCollection:(id)a6;
- (double)defaultContentAccessoryPadding;
- (double)defaultContentEditPaddingForCell:(id)a3 inTableView:(id)a4;
- (double)defaultContentReorderPaddingForCell:(id)a3 inTableView:(id)a4;
- (double)defaultDetailTextLabelFontSizeForCellStyle:(int64_t)a3;
- (double)defaultDisclosureLayoutWidthForView:(id)a3;
- (double)defaultEditAndUpdateAnimationDuration;
- (double)defaultEditControlPaddingForCell:(id)a3 inTableView:(id)a4;
- (double)defaultFocusedHorizontalOutsetForTableView:(id)a3;
- (double)defaultFocusedShadowRadiusForTableView:(id)a3;
- (double)defaultImageToTextPaddingForSidebar:(BOOL)a3;
- (double)defaultImageViewSymbolImageAndAccessoryLayoutWidthForSidebar:(BOOL)a3 traitCollection:(id)a4;
- (double)defaultImageViewSymbolImageLayoutHeightForTraitCollection:(id)a3;
- (double)defaultIndentationWidthForSidebarStyle:(BOOL)a3;
- (double)defaultInterAccessoryPaddingForCell:(id)a3 trailingAccessoryGroup:(BOOL)a4;
- (double)defaultLabelMinimumScaleFactorForSidebar:(BOOL)a3 traitCollection:(id)a4;
- (double)defaultLeadingCellMarginWidthForTableView:(id)a3;
- (double)defaultMarginWidthForTableView:(id)a3;
- (double)defaultMaskGradientHeightForTableView:(id)a3;
- (double)defaultPaddingAboveFirstSectionWithoutHeaderTableStyle:(int64_t)a3;
- (double)defaultPaddingAboveSectionHeadersForTableStyle:(int64_t)a3;
- (double)defaultPaddingBetweenHeaderAndRows;
- (double)defaultPaddingBetweenRows;
- (double)defaultPlainHeaderLabelYPositionForTableView:(id)a3 headerBounds:(CGRect)a4 textRect:(CGRect)a5 isHeader:(BOOL)a6;
- (double)defaultRowHeightForTableView:(id)a3;
- (double)defaultRowHeightForTableView:(id)a3 cellStyle:(int64_t)a4;
- (double)defaultSectionFooterHeightForTableView:(id)a3;
- (double)defaultSectionFooterHeightForTableViewStyle:(int64_t)a3 screen:(id)a4;
- (double)defaultSectionHeaderHeightForTableView:(id)a3;
- (double)defaultSectionHeaderHeightForTableViewStyle:(int64_t)a3 screen:(id)a4;
- (double)defaultSpaceBetweenEditAndReorderControlsForCell:(id)a3 inTableView:(id)a4;
- (double)defaultTextLabelFontSizeForCellStyle:(int64_t)a3;
- (double)defaultTextToSubtitlePaddingForCellStyle:(int64_t)a3;
- (double)defaultTrailingCellMarginWidthForTableView:(id)a3;
- (double)defaultVerticalAccessorySeparatorReplacementPaddingWidth;
- (double)interspaceBetweenInnerAccessoryIdentifier:(id)a3 outerAccessoryIdentifier:(id)a4 forCell:(id)a5 trailingAccessoryGroup:(BOOL)a6;
- (double)minimumContentViewHeightForFont:(id)a3 traitCollection:(id)a4;
- (double)reorderControlHoverEffectCornerRadius;
- (id)_accessoryTintColorForAccessoryBaseColor:(id)a3;
- (id)_defaultAccessoryTintColor;
- (id)_defaultCircleDisclosureImageForTraitCollection:(id)a3;
- (id)_defaultDisclosureImageForTraitCollection:(id)a3;
- (id)_symbolImageNamed:(id)a3 withTextStyle:(id)a4 scale:(int64_t)a5;
- (id)defaultAccessoryBackgroundColorForAccessorySystemType:(int64_t)a3 header:(BOOL)a4 sidebarStyle:(int64_t)a5 cellConfigurationState:(id)a6 traitCollection:(id)a7;
- (id)defaultAccessoryTintColorForAccessorySystemType:(int64_t)a3 header:(BOOL)a4 sidebarStyle:(int64_t)a5 cellConfigurationState:(id)a6 traitCollection:(id)a7 inheritedTintColor:(id)a8;
- (id)defaultBackgroundColorForTableViewStyle:(int64_t)a3;
- (id)defaultBackgroundEffectsForTableViewStyle:(int64_t)a3;
- (id)defaultCheckmarkImageForCell:(id)a3;
- (id)defaultDeleteImageForCell:(id)a3;
- (id)defaultDeleteImageWithTintColor:(id)a3 backgroundColor:(id)a4;
- (id)defaultDetailAccessoryImage;
- (id)defaultDetailTextColorForCellStyle:(int64_t)a3 traitCollection:(id)a4 state:(id)a5;
- (id)defaultDetailTextFontForCellStyle:(int64_t)a3;
- (id)defaultDisclosureImageForCell:(id)a3 withAccessoryBaseColor:(id)a4;
- (id)defaultFooterFontForTableViewStyle:(int64_t)a3;
- (id)defaultFooterTextColorForTableViewStyle:(int64_t)a3 focused:(BOOL)a4;
- (id)defaultHeaderFontForTableViewStyle:(int64_t)a3;
- (id)defaultHeaderTextColorForTableViewStyle:(int64_t)a3 focused:(BOOL)a4;
- (id)defaultImageSymbolConfigurationForTraitCollection:(id)a3;
- (id)defaultImageTintColorForState:(id)a3 traitCollection:(id)a4;
- (id)defaultInsertImageForCell:(id)a3;
- (id)defaultInsertImageWithTintColor:(id)a3 backgroundColor:(id)a4;
- (id)defaultInsetGroupedHeaderFontForExtraProminentStyle:(BOOL)a3 secondaryText:(BOOL)a4;
- (id)defaultMultiSelectBackgroundColorForCell:(id)a3 inTableView:(id)a4;
- (id)defaultMultiSelectNotSelectedImageForCellStyle:(int64_t)a3 traitCollection:(id)a4 accessoryBaseColor:(id)a5;
- (id)defaultMultiSelectSelectedImageForCellStyle:(int64_t)a3 traitCollection:(id)a4 checkmarkColor:(id)a5 backgroundColor:(id)a6;
- (id)defaultOutlineDisclosureImageForView:(id)a3;
- (id)defaultPlainHeaderFooterFont;
- (id)defaultPopUpMenuIndicatorImageForTraitCollection:(id)a3;
- (id)defaultReorderControlImageForTraitCollection:(id)a3 withAccessoryBaseColor:(id)a4 isTracking:(BOOL)a5;
- (id)defaultSeparatorColorForTableViewStyle:(int64_t)a3;
- (id)defaultSeparatorVisualEffectForTableViewStyle:(int64_t)a3;
- (id)defaultSidebarDetailTextLabelFontForCellStyle:(int64_t)a3;
- (id)defaultSidebarHeaderFont;
- (id)defaultSidebarImageTintColorForTraitCollection:(id)a3 state:(id)a4 isHeader:(BOOL)a5 style:(int64_t)a6;
- (id)defaultSidebarPlainMultiSelectSeparatorColor;
- (id)defaultSidebarTextColorForTraitCollection:(id)a3 state:(id)a4 isHeader:(BOOL)a5 isSecondaryText:(BOOL)a6 style:(int64_t)a7;
- (id)defaultTextColorForCellStyle:(int64_t)a3 traitCollection:(id)a4 tintColor:(id)a5 state:(id)a6;
- (id)defaultTextLabelFontForCellStyle:(int64_t)a3;
- (int64_t)defaultHeaderFooterPinningBehaviorForTableStyle:(int64_t)a3;
- (int64_t)defaultLabelNumberOfLinesForSidebar:(BOOL)a3 traitCollection:(id)a4;
- (int64_t)defaultSeparatorStyleForTableViewStyle:(int64_t)a3;
- (void)_applySelectedOrDropTargetAppearanceToSidebarCellBackgroundProperties:(int)a3 selected:(uint64_t)a4 sidebarStyle:(int)a5 selectionIsKey:(void *)a6 state:(void *)a7 traitCollection:;
@end

@implementation UITableConstants_IOS

- (UIEdgeInsets)defaultSectionContentInsetsForTableStyle:(int64_t)a3
{
  double v3 = 0.0;
  double v4 = 0.0;
  double v5 = 0.0;
  double v6 = 0.0;
  result.right = v6;
  result.bottom = v5;
  result.left = v4;
  result.top = v3;
  return result;
}

- (double)defaultCellContentTrailingPadding
{
  return 8.0;
}

- (UIEdgeInsets)defaultTableLayoutMarginsForScreen:(id)a3 size:(CGSize)a4 tableStyle:(int64_t)a5
{
  double width = a4.width;
  id v6 = a3;
  int v7 = dyld_program_sdk_at_least();
  v8 = v6;
  if (!v6)
  {
    v8 = +[UIScreen mainScreen];
  }
  if (v7) {
    double v9 = 16.0;
  }
  else {
    double v9 = 15.0;
  }
  int v10 = [v8 _wantsWideContentMargins];
  double v11 = 20.0;
  if (width <= 320.0) {
    double v11 = 16.0;
  }
  if (v10) {
    double v12 = v11;
  }
  else {
    double v12 = v9;
  }

  double v13 = 0.0;
  double v14 = 0.0;
  double v15 = v12;
  double v16 = v12;
  result.right = v16;
  result.bottom = v14;
  result.left = v15;
  result.top = v13;
  return result;
}

- (BOOL)shouldUseDefaultTableLayoutMarginsAsContentInsets
{
  return 1;
}

- (UIEdgeInsets)defaultLayoutMarginsInsideSectionForSize:(CGSize)a3 tableStyle:(int64_t)a4
{
  -[UITableConstants_IOS defaultTableLayoutMarginsForScreen:size:tableStyle:](self, "defaultTableLayoutMarginsForScreen:size:tableStyle:", 0, a4, a3.width, a3.height);
  result.right = v7;
  result.bottom = v6;
  result.left = v5;
  result.top = v4;
  return result;
}

- (UIEdgeInsets)defaultSidebarLayoutMarginsForElementsInsideSection
{
  double v2 = 0.0;
  double v3 = 8.0;
  double v4 = 0.0;
  double v5 = 8.0;
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (double)defaultPaddingAboveSectionHeadersForTableStyle:(int64_t)a3
{
  BOOL v3 = [(UITableConstants_IOS *)self useChromelessSectionHeadersAndFootersForTableStyle:a3];
  double result = 0.0;
  if (v3) {
    return 22.0;
  }
  return result;
}

- (int64_t)defaultHeaderFooterPinningBehaviorForTableStyle:(int64_t)a3
{
  return [(UITableConstants_IOS *)self useChromelessSectionHeadersAndFootersForTableStyle:a3];
}

- (BOOL)useChromelessSectionHeadersAndFootersForTableStyle:(int64_t)a3
{
  if (a3) {
    return 0;
  }
  else {
    return dyld_program_sdk_at_least();
  }
}

- (double)defaultDisclosureLayoutWidthForView:(id)a3
{
  BOOL v3 = [(UITableConstants_IOS *)self defaultOutlineDisclosureImageForView:a3];
  [v3 size];
  double v5 = v4;
  [v3 size];
  if (v5 < v6) {
    double v5 = v6;
  }

  return v5;
}

- (id)defaultOutlineDisclosureImageForView:(id)a3
{
  id v4 = a3;
  if (_AXSButtonShapesEnabled() || _AXSDifferentiateWithoutColorEnabled())
  {
    double v5 = [v4 traitCollection];
    uint64_t v6 = [(UITableConstants_IOS *)self _defaultCircleDisclosureImageForTraitCollection:v5];
  }
  else
  {
    double v5 = [v4 traitCollection];
    uint64_t v6 = [(UITableConstants_IOS *)self _defaultDisclosureImageForTraitCollection:v5];
  }
  double v7 = (void *)v6;

  return v7;
}

- (double)interspaceBetweenInnerAccessoryIdentifier:(id)a3 outerAccessoryIdentifier:(id)a4 forCell:(id)a5 trailingAccessoryGroup:(BOOL)a6
{
  BOOL v6 = a6;
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (dyld_program_sdk_at_least())
  {
    if (v10)
    {
      if (v11)
      {
        [(UITableConstants_IOS *)self defaultInterAccessoryPaddingForCell:v12 trailingAccessoryGroup:v6];
LABEL_22:
        double v14 = v13;
        goto LABEL_23;
      }
      [v12 _minimumCellAccessoryMargin];
      double v16 = v15;
      [v12 directionalLayoutMargins];
      if (v6) {
        double v19 = v18;
      }
      else {
        double v19 = v17;
      }
      double v14 = fmax(v16, v19);
    }
    else
    {
      double v14 = 0.0;
      if ((_UITableViewCellUsesLayoutMarginBasedContentPadding() & 1) == 0 && v6)
      {
        [(UITableConstants_IOS *)self defaultCellContentTrailingPadding];
        goto LABEL_22;
      }
    }
  }
  else
  {
    double v14 = 0.0;
    if (([v10 isEqualToString:0x1ED107580] & 1) == 0
      && ([v11 isEqualToString:0x1ED107580] & 1) == 0)
    {
      if (v10)
      {
        if (v11)
        {
          if ([v11 isEqualToString:0x1ED16CBC0]) {
            double v14 = 16.0;
          }
          else {
            double v14 = 12.0;
          }
        }
        else
        {
          [v12 _minimumCellAccessoryMargin];
          double v22 = v21;
          [v12 directionalLayoutMargins];
          double v14 = fmax(v22, v23);
        }
      }
      else if ((_UITableViewCellUsesLayoutMarginBasedContentPadding() & 1) == 0 && v6)
      {
        [(UITableConstants_IOS *)self defaultContentAccessoryPadding];
        goto LABEL_22;
      }
    }
  }
LABEL_23:

  return v14;
}

- (id)defaultAccessoryBackgroundColorForAccessorySystemType:(int64_t)a3 header:(BOOL)a4 sidebarStyle:(int64_t)a5 cellConfigurationState:(id)a6 traitCollection:(id)a7
{
  int v10 = _UITableUsesTintColorAsBackgroundColor(a6, a7, a4, a5);
  if ((unint64_t)a3 > 0xA)
  {
    double v13 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"UITableConstants_IOS.m", 1611, @"Invalid _UICellAccessorySystemType value: %ld", a3);

LABEL_3:
    id v11 = 0;
    goto LABEL_4;
  }
  if (a3 != 5 || !v10) {
    goto LABEL_3;
  }
  id v11 = +[UIColor whiteColor];
LABEL_4:
  return v11;
}

- (double)defaultImageViewSymbolImageAndAccessoryLayoutWidthForSidebar:(BOOL)a3 traitCollection:(id)a4
{
  if (a3) {
    double v4 = 28.0;
  }
  else {
    double v4 = 24.0;
  }
  id v5 = a4;
  BOOL v6 = +[UIFontMetrics defaultMetrics];
  [v6 scaledValueForValue:v5 compatibleWithTraitCollection:v4];
  double v8 = v7;

  return v8;
}

- (double)defaultPaddingBetweenHeaderAndRows
{
  return 0.0;
}

- (double)defaultPaddingBetweenRows
{
  return 0.0;
}

- (int64_t)defaultSeparatorStyleForTableViewStyle:(int64_t)a3
{
  return 1;
}

- (id)defaultSeparatorColorForTableViewStyle:(int64_t)a3
{
  if (dyld_program_sdk_at_least()) {
    +[UIColor separatorColor];
  }
  else {
  BOOL v3 = +[UIColor colorWithRed:0.783921569 green:0.780392157 blue:0.8 alpha:1.0];
  }
  return v3;
}

- (id)defaultSeparatorVisualEffectForTableViewStyle:(int64_t)a3
{
  return 0;
}

- (double)defaultRowHeightForTableView:(id)a3 cellStyle:(int64_t)a4
{
  return 44.0;
}

- (id)defaultDisclosureImageForCell:(id)a3 withAccessoryBaseColor:(id)a4
{
  id v6 = a4;
  double v7 = [a3 traitCollection];
  double v8 = [(UITableConstants_IOS *)self _defaultDisclosureImageForTraitCollection:v7];

  double v9 = [(UITableConstants_IOS *)self _accessoryTintColorForAccessoryBaseColor:v6];

  int v10 = [v8 imageWithTintColor:v9 renderingMode:1];

  return v10;
}

- (id)_defaultDisclosureImageForTraitCollection:(id)a3
{
  id v5 = a3;
  id v6 = (void *)_MergedGlobals_1244;
  if (!_MergedGlobals_1244
    || v5
    && (!qword_1EB263520 || v5[13] != *(void *)(qword_1EB263520 + 104) || v5[15] != *(void *)(qword_1EB263520 + 120)))
  {
    uint64_t v7 = [(UITableConstants_IOS *)self _symbolImageNamed:@"chevron.forward" withTextStyle:@"UICTFontTextStyleEmphasizedBody" scale:1];
    double v8 = (void *)_MergedGlobals_1244;
    _MergedGlobals_1244 = v7;

    objc_storeStrong((id *)&qword_1EB263520, a3);
    id v6 = (void *)_MergedGlobals_1244;
  }
  id v9 = v6;

  return v9;
}

- (id)_accessoryTintColorForAccessoryBaseColor:(id)a3
{
  if (a3)
  {
    id v3 = a3;
  }
  else
  {
    id v3 = [(UITableConstants_IOS *)self _defaultAccessoryTintColor];
  }
  return v3;
}

- (id)_defaultAccessoryTintColor
{
  if (dyld_program_sdk_at_least()) {
    +[UIColor tertiaryLabelColor];
  }
  else {
  double v2 = +[UIColor colorWithRed:0.780392157 green:0.780392157 blue:0.8 alpha:1.0];
  }
  return v2;
}

- (id)defaultImageSymbolConfigurationForTraitCollection:(id)a3
{
  id v3 = [a3 preferredContentSizeCategory];
  if (UIContentSizeCategoryIsAccessibilityCategory(v3))
  {
    if (UIContentSizeCategoryCompareToCategory(v3, &cfstr_Uictcontentsiz_11.isa) == NSOrderedAscending)
    {
      if (UIContentSizeCategoryCompareToCategory(v3, &cfstr_Uictcontentsiz_9.isa) == NSOrderedAscending) {
        uint64_t v4 = 3;
      }
      else {
        uint64_t v4 = 2;
      }
    }
    else
    {
      uint64_t v4 = 1;
    }
  }
  else
  {
    uint64_t v4 = 3;
  }

  return +[UIImageSymbolConfiguration configurationWithTextStyle:@"UICTFontTextStyleBody" scale:v4];
}

- (id)_symbolImageNamed:(id)a3 withTextStyle:(id)a4 scale:(int64_t)a5
{
  id v7 = a3;
  double v8 = +[UIImageSymbolConfiguration configurationWithTextStyle:a4 scale:a5];
  id v9 = +[UIImage systemImageNamed:v7 withConfiguration:v8];

  return v9;
}

- (_UITableConstantsBackgroundProperties)defaultHeaderFooterBackgroundPropertiesForTableViewStyle:(SEL)a3 cellConfigurationState:(int64_t)a4 traitCollection:(id)a5 floating:(id)a6
{
  BOOL v7 = a7;
  id v22 = a5;
  id v12 = a6;
  *(_OWORD *)&retstr->var0 = 0u;
  *(_OWORD *)&retstr->id var2 = 0u;
  *(_OWORD *)&retstr->var4 = 0u;
  *(_OWORD *)&retstr->var6 = 0u;
  *(_OWORD *)&retstr->var8 = 0u;
  *(_OWORD *)&retstr->var10 = 0u;
  *(_OWORD *)&retstr->var12 = 0u;
  *(_OWORD *)&retstr->var13.leading = 0u;
  retstr->var13.trailing = 0.0;
  -[UITableConstants_IOS defaultCellCornerRadiusForTableViewStyle:isSidebarStyle:isHeaderFooter:traitCollection:](self, "defaultCellCornerRadiusForTableViewStyle:isSidebarStyle:isHeaderFooter:traitCollection:", a4, 0, 1, v12, __copy_constructor_8_8_t0w8_s8_s16_s24_t32w41_s80_t88w48((uint64_t)retstr, (uint64_t)&_UITableConstantsBackgroundPropertiesDefault).n128_f64[0]);
  retstr->var12 = v13;
  if (a4) {
    goto LABEL_2;
  }
  if ([(UITableConstants_IOS *)self useChromelessSectionHeadersAndFootersForTableStyle:0])
  {
    if (v7)
    {
      double v17 = +[UIBlurEffect effectWithStyle:10];
      id var2 = retstr->var2;
      retstr->id var2 = v17;

      var1 = self;
      double v19 = [v12 objectForTrait:var1];
      id var3 = retstr->var3;
      retstr->id var3 = v19;

      goto LABEL_3;
    }
LABEL_2:
    var1 = retstr->var1;
    retstr->var1 = 0;
    goto LABEL_3;
  }
  if (!dyld_program_sdk_at_least()) {
    goto LABEL_2;
  }
  if (v7) {
    +[UIColor tablePlainHeaderFooterFloatingBackgroundColor];
  }
  else {
  double v21 = +[UIColor tablePlainHeaderFooterBackgroundColor];
  }
  var1 = retstr->var1;
  retstr->var1 = v21;
LABEL_3:

  int v15 = [v22 isFocused] ^ 1;
  if (!a4) {
    LOBYTE(v15) = 1;
  }
  if ((v15 & 1) == 0)
  {
    retstr->var0 = 1;
    retstr->var6 = 28;
  }

  return result;
}

- (_UITableConstantsBackgroundProperties)defaultSidebarCellBackgroundPropertiesForStyle:(SEL)a3 state:(int64_t)a4 traitCollection:(id)a5
{
  id v42 = a5;
  id v10 = a6;
  *(_OWORD *)&retstr->var0 = 0u;
  *(_OWORD *)&retstr->id var2 = 0u;
  *(_OWORD *)&retstr->var4 = 0u;
  *(_OWORD *)&retstr->var6 = 0u;
  *(_OWORD *)&retstr->var8 = 0u;
  *(_OWORD *)&retstr->var10 = 0u;
  *(_OWORD *)&retstr->var12 = 0u;
  *(_OWORD *)&retstr->var13.leading = 0u;
  retstr->var13.trailing = 0.0;
  -[UITableConstants_IOS defaultCellCornerRadiusForTableViewStyle:isSidebarStyle:isHeaderFooter:traitCollection:](self, "defaultCellCornerRadiusForTableViewStyle:isSidebarStyle:isHeaderFooter:traitCollection:", 1, 1, 0, v10, __copy_constructor_8_8_t0w8_s8_s16_s24_t32w41_s80_t88w48((uint64_t)retstr, (uint64_t)&_UITableConstantsBackgroundPropertiesDefault).n128_f64[0]);
  retstr->var12 = v11;
  uint64_t v12 = [v42 cellDropState];
  uint64_t v13 = [v42 cellDropState];
  int v14 = _UITableConstantsUseUIPSidebarMetrics();
  int v15 = v10;
  double v16 = v15;
  if (v15)
  {
    _UIRecordTraitUsage((unint64_t)v15, 0x19uLL);
    uint64_t v17 = v16[25];
  }
  else
  {
    uint64_t v17 = 0;
  }
  if ((unint64_t)([v16 _focusSystemState] - 1) > 1
    || _AXSFullKeyboardAccessEnabled())
  {
    if (v17 == -1) {
      BOOL v18 = [v16 _splitViewControllerContext] != 2;
    }
    else {
      BOOL v18 = v17 == 1;
    }
    if (!dyld_program_sdk_at_least()) {
      BOOL v18 = a4 != 2;
    }
  }
  else
  {
    BOOL v18 = v17 == 1;
  }

  if (![v42 isSelected])
  {
LABEL_14:
    int v19 = 0;
    goto LABEL_16;
  }
  if ([v42 isEditing])
  {
    if (dyld_program_sdk_at_least())
    {
      int v19 = [v42 _usesAnyPlainListStyle];
      goto LABEL_16;
    }
    goto LABEL_14;
  }
  int v19 = 1;
LABEL_16:
  if (v12 == 2)
  {
    -[UITableConstants_IOS _applySelectedOrDropTargetAppearanceToSidebarCellBackgroundProperties:selected:sidebarStyle:selectionIsKey:state:traitCollection:]((uint64_t)self, &retstr->var0, v19, a4, v18, v42, v16);
    if ([v42 isHighlighted]) {
      retstr->var6 = 7;
    }
    char v20 = [v42 isSelected];
    double v21 = v42;
    if ((v20 & 1) == 0)
    {
      *(_OWORD *)&retstr->var13.top = xmmword_186B8C800;
      *(_OWORD *)&retstr->var13.bottom = xmmword_186B8C800;
    }
    goto LABEL_40;
  }
  if ([v42 isFocused]
    && ([v42 isSelected] & (v18 | v14) & 1) == 0)
  {
    retstr->var0 = 1;
    retstr->var6 = 28;
    double v21 = v42;
    goto LABEL_40;
  }
  double v21 = v42;
  if (!v19) {
    goto LABEL_40;
  }
  id v22 = v42;
  if (([v22 isDisabled] & 1) == 0)
  {

LABEL_30:
    if (v13 == 1) {
      char v26 = v14;
    }
    else {
      char v26 = 1;
    }
    if (v26)
    {
      -[UITableConstants_IOS _applySelectedOrDropTargetAppearanceToSidebarCellBackgroundProperties:selected:sidebarStyle:selectionIsKey:state:traitCollection:]((uint64_t)self, &retstr->var0, 1, a4, v18, v22, v16);
    }
    else
    {
      v27 = +[UIColor systemGrayColor];
      id var1 = retstr->var1;
      retstr->id var1 = v27;

      int64_t v29 = 8;
      if (a4 != 2) {
        int64_t v29 = 3;
      }
      retstr->var6 = v29;
    }
    goto LABEL_38;
  }
  char v23 = [v22 isSwiped];

  if (v23) {
    goto LABEL_30;
  }
  v24 = +[UIColor quaternarySystemFillColor];
  id v25 = retstr->var1;
  retstr->id var1 = v24;

LABEL_38:
  int v30 = [v22 isHighlighted];
  double v21 = v42;
  if (v30) {
    retstr->var6 = 7;
  }
LABEL_40:
  int v31 = [v21 isSwiped];
  if (retstr->var1) {
    int v32 = 0;
  }
  else {
    int v32 = v31;
  }
  if (v32 == 1 && !retstr->var0 && !retstr->var2)
  {
    v33 = +[UIColor _swipedSidebarCellBackgroundColor];
    id v34 = retstr->var1;
    retstr->id var1 = v33;
  }
  if ([v42 isReordering])
  {
    if (!retstr->var1 && !retstr->var0)
    {
      v35 = +[UIColor _sidebarBackgroundColor];
      id v36 = retstr->var1;
      retstr->id var1 = v35;
    }
    if (!retstr->var6) {
      retstr->var6 = 12;
    }
    retstr->var4 = 1;
    v37 = +[UIBlurEffect effectWithBlurRadius:4.0];
    id var2 = retstr->var2;
    retstr->id var2 = v37;

    retstr->var5 = 2;
  }
  if (v14)
  {
    id v39 = v42;
    if ([v39 isDisabled])
    {
      char v40 = [v39 isSwiped];

      if ((v40 & 1) == 0) {
        retstr->var6 = 3;
      }
    }
    else
    {
    }
  }

  return result;
}

- (id)defaultAccessoryTintColorForAccessorySystemType:(int64_t)a3 header:(BOOL)a4 sidebarStyle:(int64_t)a5 cellConfigurationState:(id)a6 traitCollection:(id)a7 inheritedTintColor:(id)a8
{
  BOOL v11 = a4;
  id v14 = a6;
  id v15 = a7;
  id v16 = a8;
  uint64_t v26 = 0;
  memset(v25, 0, sizeof(v25));
  _UITableConstantsGetBackgroundProperties(self, v14, v15, v11, a5, (uint64_t)v25);
  __copy_constructor_8_8_t0w8_s8_s16_s24_t32w41_s80_t88w48((uint64_t)v23, (uint64_t)v25);
  BOOL v17 = 0;
  if (v24 <= 0xC && ((1 << v24) & 0x1081) != 0) {
    BOOL v17 = (v23[0] & 0xFFFFFFFFFFFFFFFDLL) == 1;
  }
  __destructor_8_s8_s16_s24_s80((uint64_t)v23);
  BOOL v18 = 0;
  switch(a3)
  {
    case 0:
    case 4:
      if (!v17) {
        goto LABEL_10;
      }
      goto LABEL_21;
    case 1:
    case 6:
    case 9:
      if (!v17) {
        goto LABEL_10;
      }
      id v19 = +[UIColor whiteColor];
      goto LABEL_24;
    case 2:
    case 3:
      break;
    case 5:
      if (v17) {
        double v21 = v16;
      }
      else {
        double v21 = 0;
      }
      id v19 = v21;
      goto LABEL_24;
    case 7:
      if (v17) {
        goto LABEL_21;
      }
      id v19 = +[UIColor secondaryLabelColor];
      goto LABEL_24;
    case 8:
      if (v17) {
        [(UITableConstants_IOS *)self defaultSidebarPlainMultiSelectSeparatorColor];
      }
      else {
      id v19 = +[UIColor separatorColor];
      }
      goto LABEL_24;
    case 10:
      if (v17)
      {
LABEL_21:
        id v19 = +[UIColor colorWithWhite:1.0 alpha:0.8];
      }
      else
      {
        id v19 = +[UIColor tertiaryLabelColor];
      }
LABEL_24:
      BOOL v18 = v19;
      break;
    default:
      char v20 = [MEMORY[0x1E4F28B00] currentHandler];
      objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", 0, self, @"UITableConstants_IOS.m", 1581, @"Invalid _UICellAccessorySystemType value: %ld", a3);

LABEL_10:
      BOOL v18 = 0;
      break;
  }
  __destructor_8_s8_s16_s24_s80((uint64_t)v25);

  return v18;
}

- (_UITableConstantsBackgroundProperties)defaultCellBackgroundPropertiesForTableViewStyle:(SEL)a3 state:(int64_t)a4 traitCollection:(id)a5
{
  id v29 = a5;
  id v10 = a6;
  *(_OWORD *)&retstr->var0 = 0u;
  *(_OWORD *)&retstr->id var2 = 0u;
  *(_OWORD *)&retstr->var4 = 0u;
  *(_OWORD *)&retstr->var6 = 0u;
  *(_OWORD *)&retstr->var8 = 0u;
  *(_OWORD *)&retstr->var10 = 0u;
  *(_OWORD *)&retstr->var12 = 0u;
  *(_OWORD *)&retstr->var13.leading = 0u;
  retstr->var13.trailing = 0.0;
  -[UITableConstants_IOS defaultCellCornerRadiusForTableViewStyle:isSidebarStyle:isHeaderFooter:traitCollection:](self, "defaultCellCornerRadiusForTableViewStyle:isSidebarStyle:isHeaderFooter:traitCollection:", a4, 0, 0, v10, __copy_constructor_8_8_t0w8_s8_s16_s24_t32w41_s80_t88w48((uint64_t)retstr, (uint64_t)&_UITableConstantsBackgroundPropertiesDefault).n128_f64[0]);
  retstr->var12 = v11;
  uint64_t v12 = [v29 cellDropState];
  uint64_t v13 = v10;
  id v14 = v13;
  if (v13)
  {
    _UIRecordTraitUsage((unint64_t)v13, 0x19uLL);
    uint64_t v15 = v14[25];
  }
  else
  {
    uint64_t v15 = 0;
  }
  if ((unint64_t)([v14 _focusSystemState] - 1) > 1
    || _AXSFullKeyboardAccessEnabled())
  {
    if (v15 == -1) {
      [v14 _splitViewControllerContext];
    }
    dyld_program_sdk_at_least();
    BOOL v16 = 0;
  }
  else
  {
    BOOL v16 = v15 == 1;
  }

  int v17 = [v29 isHighlighted];
  if (v12 == 2) {
    int v18 = v17;
  }
  else {
    int v18 = 0;
  }
  if (v18 == 1)
  {
    id v19 = +[UIColor systemGray2Color];
LABEL_33:
    id var1 = retstr->var1;
    retstr->id var1 = v19;

    goto LABEL_34;
  }
  if ([v29 isFocused] && (objc_msgSend(v29, "isSelected") & v16 & 1) == 0)
  {
    retstr->var0 = 1;
    retstr->var6 = 28;
    goto LABEL_34;
  }
  if (([v29 isHighlighted] & 1) == 0)
  {
    int v20 = [v29 isSelected];
    int v21 = v12 == 2 ? 1 : v20;
    if (v21 != 1)
    {
      if (a4) {
        +[UIColor tableCellGroupedBackgroundColor];
      }
      else {
        +[UIColor tableCellPlainBackgroundColor];
      }
      goto LABEL_28;
    }
  }
  if ((dyld_program_sdk_at_least() & 1) == 0)
  {
    id v19 = +[UIColor colorWithRed:0.847058824 green:0.847058824 blue:0.847058824 alpha:1.0];
    goto LABEL_33;
  }
  if (!v16)
  {
    if (a4) {
      +[UIColor tableCellGroupedSelectedBackgroundColor];
    }
    else {
      +[UIColor tableCellPlainSelectedBackgroundColor];
    }
    id v19 = LABEL_28:;
    goto LABEL_33;
  }
  retstr->var0 = 1;
LABEL_34:
  if ([v29 isReordering])
  {
    char v23 = +[UIBlurEffect effectWithBlurRadius:4.0];
    id var2 = retstr->var2;
    retstr->id var2 = v23;

    retstr->var4 = 1;
    id v25 = retstr->var1;
    [(UITableConstants_IOS *)self defaultAlphaForReorderingCell];
    uint64_t v26 = objc_msgSend(v25, "colorWithAlphaComponent:");
    id v27 = retstr->var1;
    retstr->id var1 = v26;

    if ([(UITableConstants_IOS *)self reorderingCellWantsShadows]) {
      retstr->var5 = 2;
    }
  }

  return result;
}

- (double)defaultCellCornerRadiusForTableViewStyle:(int64_t)a3 isSidebarStyle:(BOOL)a4 isHeaderFooter:(BOOL)a5 traitCollection:(id)a6
{
  BOOL v7 = a4;
  id v9 = a6;
  id v10 = v9;
  if (a3) {
    BOOL v11 = a5;
  }
  else {
    BOOL v11 = 0;
  }
  if (v11 || (double v12 = 0.0, v7))
  {
    [v9 userInterfaceIdiom];
    double v12 = 10.0;
  }

  return v12;
}

- (id)defaultBackgroundColorForTableViewStyle:(int64_t)a3
{
  if (a3) {
    +[UIColor systemGroupedBackgroundColor];
  }
  else {
  id v3 = +[UIColor tableBackgroundColor];
  }
  return v3;
}

- (int64_t)defaultLabelNumberOfLinesForSidebar:(BOOL)a3 traitCollection:(id)a4
{
  if (!a3) {
    return 0;
  }
  uint64_t v4 = [a4 preferredContentSizeCategory];
  int64_t v5 = !UIContentSizeCategoryIsAccessibilityCategory(v4);

  return v5;
}

- (double)defaultLabelMinimumScaleFactorForSidebar:(BOOL)a3 traitCollection:(id)a4
{
  double result = 0.0;
  if (a3)
  {
    objc_msgSend(a4, "preferredContentSizeCategory", 0.0);
    int64_t v5 = (NSString *)objc_claimAutoreleasedReturnValue();
    BOOL IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v5);

    double result = 0.9;
    if (IsAccessibilityCategory) {
      return 0.0;
    }
  }
  return result;
}

- (BOOL)defaultLabelAllowsTighteningForTruncationForSidebar:(BOOL)a3 traitCollection:(id)a4
{
  if (a3)
  {
    uint64_t v4 = [a4 preferredContentSizeCategory];
    BOOL v5 = !UIContentSizeCategoryIsAccessibilityCategory(v4);
  }
  else
  {
    LOBYTE(v5) = 0;
  }
  return v5;
}

- (id)defaultTextLabelFontForCellStyle:(int64_t)a3
{
  if (dyld_program_sdk_at_least())
  {
    BOOL v5 = &UIFontTextStyleFootnote;
    if (a3 != 2) {
      BOOL v5 = &UIFontTextStyleBody;
    }
    id v6 = [off_1E52D39B8 preferredFontForTextStyle:*v5];
  }
  else
  {
    [(UITableConstants_IOS *)self defaultTextLabelFontSizeForCellStyle:a3];
    id v6 = objc_msgSend(off_1E52D39B8, "systemFontOfSize:");
  }
  return v6;
}

- (id)defaultDetailTextFontForCellStyle:(int64_t)a3
{
  if (!dyld_program_sdk_at_least())
  {
    if ((unint64_t)(a3 - 1) <= 2)
    {
      [(UITableConstants_IOS *)self defaultDetailTextLabelFontSizeForCellStyle:a3];
      BOOL v7 = objc_msgSend(off_1E52D39B8, "systemFontOfSize:");
      goto LABEL_12;
    }
    goto LABEL_8;
  }
  if (a3 == 3)
  {
    BOOL v5 = off_1E52D39B8;
    id v6 = &UIFontTextStyleCaption1;
    goto LABEL_11;
  }
  if (a3 == 2)
  {
    BOOL v5 = off_1E52D39B8;
    id v6 = &UIFontTextStyleFootnote;
    goto LABEL_11;
  }
  if (a3 != 1)
  {
LABEL_8:
    BOOL v7 = 0;
    goto LABEL_12;
  }
  BOOL v5 = off_1E52D39B8;
  id v6 = &UIFontTextStyleBody;
LABEL_11:
  BOOL v7 = [v5 preferredFontForTextStyle:*v6];
LABEL_12:
  return v7;
}

- (id)defaultImageTintColorForState:(id)a3 traitCollection:(id)a4
{
  id v5 = a3;
  int v6 = _UITableUsesTintColorAsBackgroundColor(v5, a4, 0, 0);
  id v7 = v5;
  if ([v7 isDisabled])
  {
    char v8 = [v7 isSwiped];

    if ((v8 & 1) == 0)
    {
      id v9 = +[UIColor tertiaryLabelColor];
      goto LABEL_8;
    }
  }
  else
  {
  }
  if (v6)
  {
    id v9 = +[UIColor whiteColor];
  }
  else
  {
    id v9 = 0;
  }
LABEL_8:
  return v9;
}

- (double)defaultCellContentLeadingPaddingForSidebar:(BOOL)a3
{
  double result = 16.0;
  if (a3) {
    return 8.0;
  }
  return result;
}

- (UIEdgeInsets)defaultCellLayoutMarginsForTableStyle:(int64_t)a3 cellStyle:(int64_t)a4 textLabelFont:(id)a5 rawLayoutMargins:(UIEdgeInsets)a6
{
  CGFloat right = a6.right;
  CGFloat left = a6.left;
  id v9 = a5;
  if (a4 != 3 || (double v10 = 4.0, (dyld_program_sdk_at_least() & 1) == 0))
  {
    [v9 lineHeight];
    double v10 = ceil(v11 * 0.5);
  }

  double v12 = v10;
  double v13 = left;
  double v14 = v10;
  double v15 = right;
  result.CGFloat right = v15;
  result.bottom = v14;
  result.CGFloat left = v13;
  result.top = v12;
  return result;
}

- (double)defaultTextToSubtitlePaddingForCellStyle:(int64_t)a3
{
  double result = 3.0;
  if (a3 == 3) {
    return 0.0;
  }
  return result;
}

- (double)defaultImageToTextPaddingForSidebar:(BOOL)a3
{
  if (a3) {
    return 10.0;
  }
  [(UITableConstants_IOS *)self defaultCellContentLeadingPaddingForSidebar:0];
  return result;
}

- (id)defaultInsetGroupedHeaderFontForExtraProminentStyle:(BOOL)a3 secondaryText:(BOOL)a4
{
  uint64_t v4 = UIFontTextStyleEmphasizedTitle2;
  if (!a3) {
    uint64_t v4 = UIFontTextStyleEmphasizedTitle3;
  }
  if (a4) {
    uint64_t v4 = (__CFString **)&UIFontTextStyleSubheadline;
  }
  id v5 = [off_1E52D39B8 preferredFontForTextStyle:*v4];
  return v5;
}

- (id)defaultDetailTextColorForCellStyle:(int64_t)a3 traitCollection:(id)a4 state:(id)a5
{
  id v7 = a5;
  if (_UITableUsesTintColorAsBackgroundColor(v7, a4, 0, 0))
  {
    uint64_t v8 = +[UIColor whiteColor];
    goto LABEL_12;
  }
  id v9 = v7;
  if (![v9 isDisabled])
  {

    if (a3 == 1)
    {
LABEL_8:
      uint64_t v8 = +[UIColor secondaryLabelColor];
      goto LABEL_12;
    }
    goto LABEL_10;
  }
  char v10 = [v9 isSwiped];

  if (a3 == 1)
  {
    if ((v10 & 1) == 0)
    {
      uint64_t v8 = +[UIColor quaternaryLabelColor];
      goto LABEL_12;
    }
    goto LABEL_8;
  }
  if (v10)
  {
LABEL_10:
    uint64_t v8 = +[UIColor labelColor];
    goto LABEL_12;
  }
  uint64_t v8 = +[UIColor tertiaryLabelColor];
LABEL_12:
  double v11 = (void *)v8;

  return v11;
}

- (id)defaultTextColorForCellStyle:(int64_t)a3 traitCollection:(id)a4 tintColor:(id)a5 state:(id)a6
{
  id v9 = a4;
  id v10 = a5;
  id v11 = a6;
  if (([v11 isDisabled] & 1) == 0)
  {

LABEL_5:
    if (_UITableUsesTintColorAsBackgroundColor(v11, v9, 0, 0))
    {
      id v13 = +[UIColor whiteColor];
    }
    else if (a3 == 2 && v10)
    {
      id v13 = v10;
    }
    else
    {
      id v13 = +[UIColor labelColor];
    }
    goto LABEL_11;
  }
  char v12 = [v11 isSwiped];

  if (v12) {
    goto LABEL_5;
  }
  id v13 = +[UIColor tertiaryLabelColor];
LABEL_11:
  double v14 = v13;

  return v14;
}

- (NSDirectionalEdgeInsets)defaultInsetGroupedHeaderLayoutMarginsForExtraProminentStyle:(BOOL)a3
{
  double v3 = 8.0;
  if (a3) {
    double v3 = 9.0;
  }
  double v4 = 10.0;
  if (!a3) {
    double v4 = 11.0;
  }
  double v5 = 3.0;
  double v6 = 3.0;
  result.trailing = v6;
  result.bottom = v4;
  result.leading = v5;
  result.top = v3;
  return result;
}

- (double)defaultRowHeightForTableView:(id)a3
{
  [(UITableConstants_IOS *)self defaultRowHeightForTableView:a3 cellStyle:0];
  return result;
}

- (BOOL)defaultRowHeightDependsOnCellStyle
{
  return 0;
}

- (double)defaultSectionHeaderHeightForTableView:(id)a3
{
  uint64_t v5 = [a3 _tableStyle];
  double v6 = [a3 _scrollView];
  id v7 = [v6 window];
  uint64_t v8 = [v7 screen];
  [(UITableConstants_IOS *)self defaultSectionHeaderHeightForTableViewStyle:v5 screen:v8];
  double v10 = v9;

  return v10;
}

- (double)defaultSectionHeaderHeightForTableViewStyle:(int64_t)a3 screen:(id)a4
{
  if (a3) {
    return 17.5;
  }
  int v6 = dyld_program_sdk_at_least();
  double result = 23.0;
  if (v6)
  {
    id v7 = -[UITableConstants_IOS defaultHeaderFontForTableViewStyle:](self, "defaultHeaderFontForTableViewStyle:", 0, 23.0);
    [v7 _scaledValueForValue:28.0];
    double v9 = v8;

    return v9;
  }
  return result;
}

- (double)defaultSectionFooterHeightForTableView:(id)a3
{
  uint64_t v5 = [a3 _tableStyle];
  int v6 = [a3 _scrollView];
  id v7 = [v6 window];
  double v8 = [v7 screen];
  [(UITableConstants_IOS *)self defaultSectionFooterHeightForTableViewStyle:v5 screen:v8];
  double v10 = v9;

  return v10;
}

- (double)defaultSectionFooterHeightForTableViewStyle:(int64_t)a3 screen:(id)a4
{
  if (a3) {
    return 17.5;
  }
  [(UITableConstants_IOS *)self defaultSectionHeaderHeightForTableViewStyle:0 screen:a4];
  return result;
}

- (double)_defaultMarginWidthForTableView:(id)a3 canUseLayoutMargins:(BOOL)a4
{
  BOOL v4 = a4;
  int v6 = [a3 _scrollView];
  id v7 = [v6 window];
  double v8 = [v7 screen];
  double v9 = [a3 _scrollView];
  [v9 bounds];
  double v11 = v10;
  id v12 = v8;
  int v13 = dyld_program_sdk_at_least();
  double v14 = v12;
  if (!v12)
  {
    double v14 = +[UIScreen mainScreen];
  }
  if (v13) {
    double v15 = 16.0;
  }
  else {
    double v15 = 15.0;
  }
  int v16 = [v14 _wantsWideContentMargins];
  double v17 = 20.0;
  if (v11 <= 320.0) {
    double v17 = 16.0;
  }
  if (v16) {
    double v18 = v17;
  }
  else {
    double v18 = v15;
  }

  if (!v4) {
    return v18;
  }
  id v19 = [a3 _scrollView];
  [v19 directionalLayoutMargins];
  double v21 = v20;

  return fmax(v18, v21);
}

- (double)defaultTrailingCellMarginWidthForTableView:(id)a3
{
  [(UITableConstants_IOS *)self _defaultMarginWidthForTableView:a3 canUseLayoutMargins:0];
  return result;
}

- (UIEdgeInsets)defaultLayoutMarginsForCell:(id)a3 inTableView:(id)a4
{
  if (dyld_program_sdk_at_least())
  {
    id v7 = +[UITraitCollection traitCollectionWithPreferredContentSizeCategory:@"UICTContentSizeCategoryL"];
    double v8 = [off_1E52D39B8 preferredFontForTextStyle:@"UICTFontTextStyleBody" compatibleWithTraitCollection:v7];
  }
  else
  {
    double v8 = -[UITableConstants_IOS defaultTextLabelFontForCellStyle:](self, "defaultTextLabelFontForCellStyle:", [a3 _cellStyle]);
  }
  uint64_t v9 = [a4 _tableStyle];
  uint64_t v10 = [a3 _cellStyle];
  [a3 _rawLayoutMargins];
  -[UITableConstants_IOS defaultCellLayoutMarginsForTableStyle:cellStyle:textLabelFont:rawLayoutMargins:](self, "defaultCellLayoutMarginsForTableStyle:cellStyle:textLabelFont:rawLayoutMargins:", v9, v10, v8);
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;

  double v19 = v12;
  double v20 = v14;
  double v21 = v16;
  double v22 = v18;
  result.CGFloat right = v22;
  result.bottom = v21;
  result.CGFloat left = v20;
  result.top = v19;
  return result;
}

- (id)defaultSidebarPlainMultiSelectSeparatorColor
{
  return +[UIColor colorWithWhite:1.0 alpha:0.2];
}

- (double)defaultEditAndUpdateAnimationDuration
{
  return 0.3;
}

- (double)defaultPaddingAboveFirstSectionWithoutHeaderTableStyle:(int64_t)a3
{
  return 35.0;
}

- (double)defaultIndentationWidthForSidebarStyle:(BOOL)a3
{
  double result = 10.0;
  if (a3) {
    return 20.0;
  }
  return result;
}

- (id)defaultBackgroundEffectsForTableViewStyle:(int64_t)a3
{
  return 0;
}

- (double)defaultLeadingCellMarginWidthForTableView:(id)a3
{
  uint64_t v5 = [a3 _sectionContentInsetFollowsLayoutMargins] ^ 1;
  [(UITableConstants_IOS *)self _defaultMarginWidthForTableView:a3 canUseLayoutMargins:v5];
  return result;
}

- (double)defaultMarginWidthForTableView:(id)a3
{
  [(UITableConstants_IOS *)self _defaultMarginWidthForTableView:a3 canUseLayoutMargins:1];
  return result;
}

- (double)minimumContentViewHeightForFont:(id)a3 traitCollection:(id)a4
{
  id v5 = a3;
  int v6 = [a4 preferredContentSizeCategory];
  id v7 = _UIContentSizeCategoryMin(v6, @"UICTContentSizeCategoryXXXL");

  double v8 = +[UITraitCollection traitCollectionWithPreferredContentSizeCategory:v7];
  uint64_t v9 = [v5 _fontAdjustedForContentSizeCategoryCompatibleWithTraitCollection:v8];

  [v9 _bodyLeading];
  double v11 = v10 + v10;

  return v11;
}

- (id)defaultHeaderFontForTableViewStyle:(int64_t)a3
{
  if (a3)
  {
    if (dyld_program_sdk_at_least()) {
      [off_1E52D39B8 preferredFontForTextStyle:@"UICTFontTextStyleFootnote"];
    }
    else {
    double v3 = [off_1E52D39B8 boldSystemFontOfSize:14.0];
    }
  }
  else
  {
    double v3 = [(UITableConstants_IOS *)self defaultPlainHeaderFooterFont];
  }
  return v3;
}

- (id)defaultPlainHeaderFooterFont
{
  if (dyld_program_sdk_at_least())
  {
    double v2 = off_1E52D39B8;
    double v3 = (const UIFontTextStyle *)UIFontTextStyleEmphasizedSubheadline;
LABEL_5:
    id v5 = [v2 preferredFontForTextStyle:*v3];
    goto LABEL_7;
  }
  int v4 = dyld_program_sdk_at_least();
  double v2 = off_1E52D39B8;
  if (v4)
  {
    double v3 = &UIFontTextStyleHeadline;
    goto LABEL_5;
  }
  id v5 = [off_1E52D39B8 boldSystemFontOfSize:14.0];
LABEL_7:
  return v5;
}

- (id)defaultHeaderTextColorForTableViewStyle:(int64_t)a3 focused:(BOOL)a4
{
  if (dyld_program_sdk_at_least())
  {
    id v5 = +[UIColor secondaryLabelColor];
  }
  else
  {
    if (a3) {
      +[UIColor _groupTableHeaderFooterTextColor];
    }
    else {
    id v5 = +[UIColor _plainTableHeaderFooterTextColor];
    }
  }
  return v5;
}

- (BOOL)shouldUppercaseHeaderFooterTextForTableStyle:(int64_t)a3 isHeader:(BOOL)a4
{
  BOOL v5 = a3 == 16 || (unint64_t)(a3 - 1) < 2;
  return a4 && v5;
}

- (UIEdgeInsets)defaultHeaderFooterLayoutMarginsForTableViewStyle:(int64_t)a3 isHeader:(BOOL)a4 isFirstSection:(BOOL)a5
{
  if (a3)
  {
    BOOL v5 = a5;
    BOOL v6 = a4;
    int v7 = dyld_program_sdk_at_least();
    double v8 = 8.0;
    double v9 = 32.0;
    if (!v5) {
      double v9 = 17.0;
    }
    double v10 = 12.0;
    if (v6) {
      double v10 = 6.0;
    }
    else {
      double v9 = 6.0;
    }
    if (v7) {
      double v8 = v9;
    }
    else {
      double v10 = 8.0;
    }
  }
  else
  {
    double v10 = 4.0;
    double v8 = 4.0;
  }
  double v11 = 8.0;
  double v12 = 8.0;
  result.CGFloat right = v12;
  result.bottom = v10;
  result.CGFloat left = v11;
  result.top = v8;
  return result;
}

+ (id)sharedConstants
{
  int v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:a1 file:@"UITableConstants_IOS.m" lineNumber:72 description:@"attempt to instantiate an instance of UITableConstants_IOS - use UITableConstants_Phone or _Pad instead"];

  return 0;
}

- (BOOL)supportsUserInterfaceStyles
{
  return 0;
}

- (void)_applySelectedOrDropTargetAppearanceToSidebarCellBackgroundProperties:(int)a3 selected:(uint64_t)a4 sidebarStyle:(int)a5 selectionIsKey:(void *)a6 state:(void *)a7 traitCollection:
{
  if (a1)
  {
    if (_UITableConstantsUseUIPSidebarMetrics() && a4 != 3)
    {
      if ([a7 userInterfaceStyle] == 2)
      {
        uint64_t v15 = +[UIColor secondarySystemFillColor];
        uint64_t v16 = 3;
      }
      else
      {
        uint64_t v15 = +[UIColor systemBackgroundColor];
        uint64_t v16 = 2;
      }
      double v17 = (void *)a2[1];
      a2[1] = v15;

      *a2 = v16;
      if (a3
        && ([a6 isSwiped] & 1) == 0
        && ([a6 _inMultiSelectGroup] & 1) == 0
        && ([a6 isEditing] & 1) == 0)
      {
        a2[5] = 4;
      }
    }
    else if (a5)
    {
      *a2 = 1;
    }
    else
    {
      uint64_t v13 = +[UIColor secondarySystemFillColor];
      double v14 = (void *)a2[1];
      a2[1] = v13;
    }
  }
}

- (_UITableConstantsBackgroundProperties)defaultSidebarHeaderBackgroundPropertiesWithState:(SEL)a3 traitCollection:(id)a4
{
  id v11 = a4;
  id v8 = a5;
  *(_OWORD *)&retstr->var0 = 0u;
  *(_OWORD *)&retstr->id var2 = 0u;
  *(_OWORD *)&retstr->var4 = 0u;
  *(_OWORD *)&retstr->var6 = 0u;
  *(_OWORD *)&retstr->var8 = 0u;
  *(_OWORD *)&retstr->var10 = 0u;
  *(_OWORD *)&retstr->var12 = 0u;
  *(_OWORD *)&retstr->var13.leading = 0u;
  retstr->var13.trailing = 0.0;
  -[UITableConstants_IOS defaultCellCornerRadiusForTableViewStyle:isSidebarStyle:isHeaderFooter:traitCollection:](self, "defaultCellCornerRadiusForTableViewStyle:isSidebarStyle:isHeaderFooter:traitCollection:", 1, 1, 1, v8, __copy_constructor_8_8_t0w8_s8_s16_s24_t32w41_s80_t88w48((uint64_t)retstr, (uint64_t)&_UITableConstantsBackgroundPropertiesDefault).n128_f64[0]);
  retstr->var12 = v9;
  if ([v11 isFocused])
  {
    retstr->var0 = 1;
    retstr->var6 = 28;
  }

  return result;
}

- (id)defaultMultiSelectBackgroundColorForCell:(id)a3 inTableView:(id)a4
{
  if (dyld_program_sdk_at_least()) {
    +[UIColor systemGray6Color];
  }
  else {
  int v4 = +[UIColor colorWithRed:0.91372549 green:0.941176471 blue:0.980392157 alpha:1.0];
  }
  return v4;
}

- (BOOL)imageViewOffsetByLayoutMarginsForCell:(id)a3 inTableView:(id)a4
{
  return 1;
}

- (double)defaultContentEditPaddingForCell:(id)a3 inTableView:(id)a4
{
  int v4 = dyld_program_sdk_at_least();
  double result = 9.0;
  if (v4) {
    return 16.0;
  }
  return result;
}

- (double)defaultContentReorderPaddingForCell:(id)a3 inTableView:(id)a4
{
  int v4 = dyld_program_sdk_at_least();
  double result = 12.0;
  if (v4) {
    return 16.0;
  }
  return result;
}

- (double)defaultContentAccessoryPadding
{
  int v2 = dyld_program_sdk_at_least();
  double result = 10.0;
  if (v2) {
    return 16.0;
  }
  return result;
}

- (double)defaultInterAccessoryPaddingForCell:(id)a3 trailingAccessoryGroup:(BOOL)a4
{
  if (a4) {
    [(UITableConstants_IOS *)self defaultCellContentTrailingPadding];
  }
  else {
    [(UITableConstants_IOS *)self defaultCellContentLeadingPaddingForSidebar:0];
  }
  return result;
}

- (double)defaultImageViewSymbolImageLayoutHeightForTraitCollection:(id)a3
{
  double v3 = [off_1E52D39B8 preferredFontForTextStyle:@"UICTFontTextStyleBody" compatibleWithTraitCollection:a3];
  [v3 _bodyLeading];
  double v5 = v4;

  return v5;
}

- (UIEdgeInsets)defaultLayoutMarginsForTableView:(id)a3
{
  [(UITableConstants_IOS *)self _defaultMarginWidthForTableView:a3 canUseLayoutMargins:0];
  double v4 = v3;
  double v5 = 0.0;
  double v6 = 0.0;
  double v7 = v4;
  result.CGFloat right = v7;
  result.bottom = v6;
  result.CGFloat left = v4;
  result.top = v5;
  return result;
}

- (double)defaultPlainHeaderLabelYPositionForTableView:(id)a3 headerBounds:(CGRect)a4 textRect:(CGRect)a5 isHeader:(BOOL)a6
{
  return round((a4.size.height - a5.size.height) * 0.5);
}

- ($4B60890CD43C21BDA0D821D733CDDD8F)contentPropertiesForSidebarElementWithTraitCollection:(SEL)a3 state:(id)a4 isHeader:(id)a5 cellStyle:(BOOL)a6 sidebarStyle:(int64_t)a7
{
  BOOL v10 = a6;
  id v14 = a4;
  id v15 = a5;
  char v16 = _UITableConstantsUseUIPSidebarMetrics();
  *(_OWORD *)&retstr->id var0 = 0u;
  *(_OWORD *)&retstr->id var2 = 0u;
  *(_OWORD *)&retstr->id var4 = 0u;
  *(_OWORD *)&retstr->var6 = 0u;
  *(_OWORD *)&retstr->var8 = 0u;
  *(void *)&double v17 = __copy_constructor_8_8_s0_s8_s16_s24_s32_s40_t48w32((uint64_t)retstr, (uint64_t)&_UITableConstantsContentPropertiesDefault).n128_u64[0];
  if (v16)
  {
    if (v10) {
      [off_1E52D39B8 _preferredFontForTextStyle:@"UICTFontTextStyleBody" weight:*(double *)off_1E52D6BF0];
    }
    else {
    double v18 = objc_msgSend(off_1E52D39B8, "preferredFontForTextStyle:", @"UICTFontTextStyleBody", v17);
    }
    id var0 = retstr->var0;
    retstr->id var0 = v18;

    double v20 = [(UITableConstants_IOS *)self defaultSidebarDetailTextLabelFontForCellStyle:a7];
    id var1 = retstr->var1;
    retstr->id var1 = v20;

    uint64_t v83 = 0;
    long long v81 = 0u;
    long long v82 = 0u;
    long long v79 = 0u;
    long long v80 = 0u;
    long long v78 = 0u;
    memset(v77, 0, sizeof(v77));
    _UITableConstantsGetBackgroundProperties(self, v15, v14, v10, a8, (uint64_t)v77);
    uint64_t v25 = *(void *)&v77[0];
    uint64_t v26 = [(UITableConstants_IOS *)self defaultImageSymbolConfigurationForTraitCollection:v14];
    id var5 = retstr->var5;
    retstr->id var5 = v26;

    if (v25 == 1)
    {
      if ((unint64_t)v78 <= 0xC && ((1 << v78) & 0x1081) != 0)
      {
        v38 = +[UIColor whiteColor];
        id var2 = retstr->var2;
        retstr->id var2 = v38;

        char v40 = +[UIColor colorWithWhite:1.0 alpha:0.8];
        id var3 = retstr->var3;
        retstr->id var3 = v40;

        id v42 = +[UIColor whiteColor];
        id var4 = retstr->var4;
        retstr->id var4 = v42;

        goto LABEL_40;
      }
      goto LABEL_18;
    }
    if (v25 != 3)
    {
      if (v25 == 2)
      {
        BOOL v28 = (unint64_t)([v14 _focusSystemState] - 1) <= 1
           && _AXSFullKeyboardAccessEnabled() == 0;
        int v50 = [v15 isEditing];
        if ((v50 | v28) == 1 && ![v15 isFocused])
        {
          v65 = +[UIColor labelColor];
          id v66 = retstr->var2;
          retstr->id var2 = v65;

          retstr->var7 = 12;
          v67 = +[UIColor secondaryLabelColor];
          id v68 = retstr->var3;
          retstr->id var3 = v67;

          if (!v50)
          {
            v69 = +[UIColor labelColor];
            id v70 = retstr->var4;
            retstr->id var4 = v69;

            retstr->var9 = 12;
LABEL_31:
            if (([v15 isEditing] & 1) == 0) {
              goto LABEL_39;
            }
            goto LABEL_40;
          }
        }
        else
        {
          v51 = +[UIColor tintColor];
          id v52 = retstr->var2;
          retstr->id var2 = v51;

          v53 = +[UIColor tintColor];
          id v54 = retstr->var3;
          retstr->id var3 = v53;
        }
        id v55 = retstr->var4;
        retstr->id var4 = 0;

        goto LABEL_31;
      }
LABEL_18:
      if (v10) {
        +[UIColor secondaryLabelColor];
      }
      else {
      v44 = +[UIColor labelColor];
      }
      id v46 = retstr->var2;
      retstr->id var2 = v44;

      v47 = +[UIColor secondaryLabelColor];
      id v48 = retstr->var3;
      retstr->id var3 = v47;

      id v49 = retstr->var4;
      retstr->id var4 = 0;

      if (v25 != 4 || ([v15 isEditing] & 1) != 0) {
        goto LABEL_40;
      }
      goto LABEL_39;
    }
    BOOL v45 = (unint64_t)([v14 _focusSystemState] - 1) <= 1 && _AXSFullKeyboardAccessEnabled() == 0;
    int v56 = [v15 isEditing];
    if ((v56 | v45) == 1 && ![v15 isFocused])
    {
      v71 = +[UIColor labelColor];
      id v72 = retstr->var2;
      retstr->id var2 = v71;

      retstr->var7 = 12;
      v73 = +[UIColor secondaryLabelColor];
      id v74 = retstr->var3;
      retstr->id var3 = v73;

      if (!v56)
      {
        v75 = +[UIColor labelColor];
        id v76 = retstr->var4;
        retstr->id var4 = v75;

        retstr->var9 = 12;
LABEL_38:
        if (([v15 isEditing] & 1) == 0) {
LABEL_39:
        }
          _UITableConstantsApplyBoldSidebarStylingToContentProperties((uint64_t)retstr, v14);
LABEL_40:
        id v62 = v15;
        if ([v62 isDisabled])
        {
          char v63 = [v62 isSwiped];

          if ((v63 & 1) == 0) {
            retstr->var6 = 0.5;
          }
        }
        else
        {
        }
        if ([v62 isHighlighted])
        {
          *(int64x2_t *)&retstr->var7 = vdupq_n_s64(7uLL);
          retstr->var9 = 7;
        }
        __destructor_8_s8_s16_s24_s80((uint64_t)v77);
        goto LABEL_47;
      }
    }
    else
    {
      v57 = +[UIColor labelColor];
      id v58 = retstr->var2;
      retstr->id var2 = v57;

      v59 = +[UIColor secondaryLabelColor];
      id v60 = retstr->var3;
      retstr->id var3 = v59;
    }
    id v61 = retstr->var4;
    retstr->id var4 = 0;

    goto LABEL_38;
  }
  if (v10) {
    [(UITableConstants_IOS *)self defaultSidebarHeaderFont];
  }
  else {
  double v21 = -[UITableConstants_IOS defaultTextLabelFontForCellStyle:](self, "defaultTextLabelFontForCellStyle:", 0, v17);
  }
  id v22 = retstr->var0;
  retstr->id var0 = v21;

  char v23 = [(UITableConstants_IOS *)self defaultSidebarDetailTextLabelFontForCellStyle:a7];
  id v29 = retstr->var1;
  retstr->id var1 = v23;

  int v30 = [(UITableConstants_IOS *)self defaultSidebarTextColorForTraitCollection:v14 state:v15 isHeader:0 isSecondaryText:0 style:a8];
  id v31 = retstr->var2;
  retstr->id var2 = v30;

  int v32 = [(UITableConstants_IOS *)self defaultSidebarTextColorForTraitCollection:v14 state:v15 isHeader:v10 isSecondaryText:1 style:a8];
  id v33 = retstr->var3;
  retstr->id var3 = v32;

  id v34 = [(UITableConstants_IOS *)self defaultSidebarImageTintColorForTraitCollection:v14 state:v15 isHeader:v10 style:a8];
  id v35 = retstr->var4;
  retstr->id var4 = v34;

  id v36 = [(UITableConstants_IOS *)self defaultImageSymbolConfigurationForTraitCollection:v14];
  id v37 = retstr->var5;
  retstr->id var5 = v36;

  if ([v15 isHighlighted])
  {
    *(int64x2_t *)&retstr->var7 = vdupq_n_s64(7uLL);
    retstr->var9 = 7;
  }
LABEL_47:

  return result;
}

- (id)defaultSidebarTextColorForTraitCollection:(id)a3 state:(id)a4 isHeader:(BOOL)a5 isSecondaryText:(BOOL)a6 style:(int64_t)a7
{
  BOOL v8 = a6;
  BOOL v9 = a5;
  id v12 = a3;
  id v13 = a4;
  if ([v13 isDisabled])
  {
    char v14 = [v13 isSwiped];

    if ((v14 & 1) == 0)
    {
      id v15 = +[UIColor quaternaryLabelColor];
      goto LABEL_22;
    }
  }
  else
  {
  }
  uint64_t v22 = 0;
  memset(v21, 0, sizeof(v21));
  _UITableConstantsGetBackgroundProperties(self, v13, v12, v9, a7, (uint64_t)v21);
  __copy_constructor_8_8_t0w8_s8_s16_s24_t32w41_s80_t88w48((uint64_t)v19, (uint64_t)v21);
  if (v20 > 0xC || ((1 << v20) & 0x1081) == 0)
  {
    __destructor_8_s8_s16_s24_s80((uint64_t)v19);
    goto LABEL_11;
  }
  uint64_t v16 = v19[0];
  __destructor_8_s8_s16_s24_s80((uint64_t)v19);
  if (v16 == 1) {
    goto LABEL_14;
  }
  if (v16 != 2)
  {
LABEL_11:
    if (a7 == 2 || ([v13 isEditing] & 1) != 0 || objc_msgSend(v13, "cellDropState") != 2)
    {
      if (v8) {
        +[UIColor secondaryLabelColor];
      }
      else {
        +[UIColor labelColor];
      }
      goto LABEL_16;
    }
LABEL_14:
    if (v8) {
      +[UIColor colorWithWhite:1.0 alpha:0.8];
    }
    else {
      +[UIColor whiteColor];
    }
    uint64_t v17 = LABEL_16:;
    goto LABEL_21;
  }
  uint64_t v17 = +[UIColor tintColor];
LABEL_21:
  id v15 = (void *)v17;
  __destructor_8_s8_s16_s24_s80((uint64_t)v21);
LABEL_22:

  return v15;
}

- (id)defaultSidebarImageTintColorForTraitCollection:(id)a3 state:(id)a4 isHeader:(BOOL)a5 style:(int64_t)a6
{
  BOOL v7 = a5;
  id v10 = a3;
  id v11 = a4;
  if ([v11 isDisabled])
  {
    char v12 = [v11 isSwiped];

    if ((v12 & 1) == 0)
    {
      id v13 = +[UIColor quaternaryLabelColor];
      goto LABEL_15;
    }
  }
  else
  {
  }
  uint64_t v19 = 0;
  memset(v18, 0, sizeof(v18));
  _UITableConstantsGetBackgroundProperties(self, v11, v10, v7, a6, (uint64_t)v18);
  __copy_constructor_8_8_t0w8_s8_s16_s24_t32w41_s80_t88w48((uint64_t)v16, (uint64_t)v18);
  if (v17 <= 0xC && ((1 << v17) & 0x1081) != 0)
  {
    uint64_t v14 = v16[0];
    __destructor_8_s8_s16_s24_s80((uint64_t)v16);
    if (v14 == 1) {
      goto LABEL_8;
    }
  }
  else
  {
    __destructor_8_s8_s16_s24_s80((uint64_t)v16);
  }
  if (a6 == 2 || ([v11 isEditing] & 1) != 0 || objc_msgSend(v11, "cellDropState") != 2)
  {
    id v13 = 0;
    goto LABEL_14;
  }
LABEL_8:
  id v13 = +[UIColor whiteColor];
LABEL_14:
  __destructor_8_s8_s16_s24_s80((uint64_t)v18);
LABEL_15:

  return v13;
}

- (id)defaultSidebarHeaderFont
{
  int v2 = _UITableConstantsUseUIPSidebarMetrics();
  double v3 = &UIFontTextStyleBody;
  if (!v2) {
    double v3 = (const UIFontTextStyle *)UIFontTextStyleEmphasizedTitle3;
  }
  double v4 = [off_1E52D39B8 preferredFontForTextStyle:*v3];
  return v4;
}

- (id)defaultSidebarDetailTextLabelFontForCellStyle:(int64_t)a3
{
  if (a3 == 1) {
    -[UITableConstants_IOS defaultDetailTextFontForCellStyle:](self, "defaultDetailTextFontForCellStyle:");
  }
  else {
  double v3 = [off_1E52D39B8 preferredFontForTextStyle:@"UICTFontTextStyleFootnote"];
  }
  return v3;
}

- (double)defaultTextLabelFontSizeForCellStyle:(int64_t)a3
{
  double result = 18.0;
  if (a3 == 2) {
    double result = 14.0;
  }
  if (a3 == 1) {
    return 17.0;
  }
  return result;
}

- (double)defaultDetailTextLabelFontSizeForCellStyle:(int64_t)a3
{
  if (a3 == 1) {
    return 17.0;
  }
  if (a3 == 3) {
    return 12.0;
  }
  -[UITableConstants_IOS defaultTextLabelFontSizeForCellStyle:](self, "defaultTextLabelFontSizeForCellStyle:");
  return result;
}

- (id)defaultFooterFontForTableViewStyle:(int64_t)a3
{
  if (a3)
  {
    if (dyld_program_sdk_at_least()) {
      [off_1E52D39B8 preferredFontForTextStyle:@"UICTFontTextStyleShortFootnote"];
    }
    else {
    double v3 = [off_1E52D39B8 systemFontOfSize:14.0];
    }
  }
  else
  {
    double v3 = [(UITableConstants_IOS *)self defaultPlainHeaderFooterFont];
  }
  return v3;
}

- (id)defaultFooterTextColorForTableViewStyle:(int64_t)a3 focused:(BOOL)a4
{
  if (dyld_program_sdk_at_least())
  {
    double v5 = +[UIColor secondaryLabelColor];
  }
  else
  {
    if (a3) {
      +[UIColor _groupTableHeaderFooterTextColor];
    }
    else {
    double v5 = +[UIColor _plainTableHeaderFooterTextColor];
    }
  }
  return v5;
}

- (id)_defaultCircleDisclosureImageForTraitCollection:(id)a3
{
  double v5 = a3;
  double v6 = (void *)qword_1EB263528;
  if (!qword_1EB263528
    || v5
    && (!qword_1EB263530 || v5[13] != *(void *)(qword_1EB263530 + 104) || v5[15] != *(void *)(qword_1EB263530 + 120)))
  {
    BOOL v7 = [v5 preferredContentSizeCategory];
    if (UIContentSizeCategoryIsAccessibilityCategory(v7))
    {
      if (UIContentSizeCategoryCompareToCategory(v7, &cfstr_Uictcontentsiz_11.isa) == NSOrderedAscending)
      {
        NSComparisonResult v10 = UIContentSizeCategoryCompareToCategory(v7, &cfstr_Uictcontentsiz_9.isa);
        uint64_t v8 = 2;
        if (v10 == NSOrderedAscending) {
          uint64_t v8 = 3;
        }
      }
      else
      {
        uint64_t v8 = 1;
      }
      if (v8 >= 2) {
        uint64_t v9 = 2;
      }
      else {
        uint64_t v9 = v8;
      }
    }
    else
    {
      uint64_t v9 = 2;
    }

    uint64_t v11 = [(UITableConstants_IOS *)self _symbolImageNamed:@"chevron.forward.circle.fill" withTextStyle:@"UICTFontTextStyleEmphasizedBody" scale:v9];
    char v12 = (void *)qword_1EB263528;
    qword_1EB263528 = v11;

    objc_storeStrong((id *)&qword_1EB263530, a3);
    double v6 = (void *)qword_1EB263528;
  }
  id v13 = v6;

  return v13;
}

- (id)defaultPopUpMenuIndicatorImageForTraitCollection:(id)a3
{
  double v5 = a3;
  double v6 = (void *)qword_1EB263538;
  if (!qword_1EB263538
    || v5
    && (!qword_1EB263540 || v5[13] != *(void *)(qword_1EB263540 + 104) || v5[15] != *(void *)(qword_1EB263540 + 120)))
  {
    uint64_t v7 = [(UITableConstants_IOS *)self _symbolImageNamed:@"chevron.up.chevron.down" withTextStyle:@"UICTFontTextStyleEmphasizedBody" scale:1];
    uint64_t v8 = (void *)qword_1EB263538;
    qword_1EB263538 = v7;

    objc_storeStrong((id *)&qword_1EB263540, a3);
    double v6 = (void *)qword_1EB263538;
  }
  id v9 = v6;

  return v9;
}

- (id)defaultCheckmarkImageForCell:(id)a3
{
  double v4 = [a3 traitCollection];
  double v5 = [v4 preferredContentSizeCategory];
  if (UIContentSizeCategoryIsAccessibilityCategory(v5))
  {
    if (UIContentSizeCategoryCompareToCategory(v5, &cfstr_Uictcontentsiz_11.isa) == NSOrderedAscending)
    {
      NSComparisonResult v8 = UIContentSizeCategoryCompareToCategory(v5, &cfstr_Uictcontentsiz_9.isa);
      uint64_t v6 = 2;
      if (v8 == NSOrderedAscending) {
        uint64_t v6 = 3;
      }
    }
    else
    {
      uint64_t v6 = 1;
    }
    if (v6 >= 2) {
      uint64_t v7 = 2;
    }
    else {
      uint64_t v7 = v6;
    }
  }
  else
  {
    uint64_t v7 = 2;
  }

  id v9 = [(UITableConstants_IOS *)self _symbolImageNamed:@"checkmark" withTextStyle:@"UICTFontTextStyleEmphasizedBody" scale:v7];

  return v9;
}

- (CGSize)defaultEditControlSizeForCell:(id)a3 inTableView:(id)a4
{
  double v4 = -[UITableConstants_IOS defaultDeleteImageForCell:](self, "defaultDeleteImageForCell:", a3, a4);
  [v4 size];
  double v6 = v5;
  double v8 = v7;

  double v9 = v6;
  double v10 = v8;
  result.height = v10;
  result.double width = v9;
  return result;
}

- (double)defaultEditControlPaddingForCell:(id)a3 inTableView:(id)a4
{
  return 25.0;
}

- (double)defaultSpaceBetweenEditAndReorderControlsForCell:(id)a3 inTableView:(id)a4
{
  return 0.0;
}

- (CGRect)defaultDeleteMinusRectForCell:(id)a3 inTableView:(id)a4
{
  double v4 = 8.0;
  double v5 = 12.0;
  double v6 = 13.0;
  double v7 = 3.0;
  result.size.height = v7;
  result.size.double width = v6;
  result.origin.y = v5;
  result.origin.x = v4;
  return result;
}

- (id)defaultDeleteImageForCell:(id)a3
{
  double v4 = [a3 _editingControlTintColorForStyle:1];
  double v5 = [(UITableConstants_IOS *)self defaultDeleteImageWithTintColor:v4 backgroundColor:0];

  return v5;
}

- (id)defaultDeleteImageWithTintColor:(id)a3 backgroundColor:(id)a4
{
  v15[2] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  if (v5)
  {
    id v7 = v5;
    id v8 = v6;
    if (v8)
    {
      id v9 = v8;
    }
    else
    {
      uint64_t v11 = +[UIColor whiteColor];

      id v9 = v7;
      id v7 = (id)v11;
    }
    v15[0] = v7;
    v15[1] = v9;
    char v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:2];
    double v10 = +[UIImageSymbolConfiguration configurationWithPaletteColors:v12];
  }
  else
  {
    double v10 = +[UIImageSymbolConfiguration configurationPreferringMulticolor];
  }
  id v13 = +[UIImage systemImageNamed:@"minus.circle.fill" withConfiguration:v10];

  return v13;
}

- (id)defaultInsertImageForCell:(id)a3
{
  double v4 = [a3 _editingControlTintColorForStyle:2];
  id v5 = [(UITableConstants_IOS *)self defaultInsertImageWithTintColor:v4 backgroundColor:0];

  return v5;
}

- (id)defaultInsertImageWithTintColor:(id)a3 backgroundColor:(id)a4
{
  v15[2] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  if (v5)
  {
    id v7 = v5;
    id v8 = v6;
    if (v8)
    {
      id v9 = v8;
    }
    else
    {
      uint64_t v11 = +[UIColor whiteColor];

      id v9 = v7;
      id v7 = (id)v11;
    }
    v15[0] = v7;
    v15[1] = v9;
    char v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:2];
    double v10 = +[UIImageSymbolConfiguration configurationWithPaletteColors:v12];
  }
  else
  {
    double v10 = +[UIImageSymbolConfiguration configurationPreferringMulticolor];
  }
  id v13 = +[UIImage systemImageNamed:@"plus.circle.fill" withConfiguration:v10];

  return v13;
}

- (id)defaultMultiSelectNotSelectedImageForCellStyle:(int64_t)a3 traitCollection:(id)a4 accessoryBaseColor:(id)a5
{
  id v6 = a5;
  id v7 = +[UIImage systemImageNamed:@"circle"];
  id v8 = [(UITableConstants_IOS *)self _accessoryTintColorForAccessoryBaseColor:v6];

  id v9 = [v7 imageWithTintColor:v8 renderingMode:1];

  return v9;
}

- (id)defaultMultiSelectSelectedImageForCellStyle:(int64_t)a3 traitCollection:(id)a4 checkmarkColor:(id)a5 backgroundColor:(id)a6
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v9 = a5;
  id v10 = a6;
  uint64_t v11 = v10;
  if (v9)
  {
    if (v10)
    {
      id v20 = v9;
      id v21 = v10;
      char v12 = (void *)MEMORY[0x1E4F1C978];
      id v13 = &v20;
      uint64_t v14 = 2;
    }
    else
    {
      id v19 = v9;
      char v12 = (void *)MEMORY[0x1E4F1C978];
      id v13 = &v19;
      uint64_t v14 = 1;
    }
    uint64_t v16 = objc_msgSend(v12, "arrayWithObjects:count:", v13, v14, v19, v20, v21, v22);
    unint64_t v17 = +[UIImageSymbolConfiguration configurationWithPaletteColors:v16];
    id v15 = +[UIImage systemImageNamed:@"checkmark.circle.fill" withConfiguration:v17];
  }
  else
  {
    id v15 = +[UIImage checkmarkImage];
  }

  return v15;
}

- (id)defaultDetailAccessoryImage
{
  return +[UIImage systemImageNamed:@"info.circle"];
}

- (CGSize)defaultReorderControlSizeForCell:(id)a3 withAccessoryBaseColor:(id)a4
{
  id v6 = a4;
  id v7 = [a3 traitCollection];
  id v8 = [(UITableConstants_IOS *)self defaultReorderControlImageForTraitCollection:v7 withAccessoryBaseColor:v6 isTracking:0];

  [v8 size];
  double v10 = v9;
  double v12 = v11;

  int v13 = dyld_program_sdk_at_least();
  double v14 = 30.0;
  if (v13) {
    double v14 = 0.0;
  }
  double v15 = v10 + v14;
  double v16 = v12;
  result.height = v16;
  result.double width = v15;
  return result;
}

- (id)defaultReorderControlImageForTraitCollection:(id)a3 withAccessoryBaseColor:(id)a4 isTracking:(BOOL)a5
{
  id v8 = a3;
  id v9 = a4;
  double v10 = (void *)qword_1EB263548;
  if (!qword_1EB263548
    || v8
    && (!qword_1EB263550 || v8[13] != *(void *)(qword_1EB263550 + 104) || v8[15] != *(void *)(qword_1EB263550 + 120)))
  {
    double v11 = [v8 preferredContentSizeCategory];
    if (UIContentSizeCategoryIsAccessibilityCategory(v11))
    {
      if (UIContentSizeCategoryCompareToCategory(v11, &cfstr_Uictcontentsiz_11.isa) == NSOrderedAscending)
      {
        if (UIContentSizeCategoryCompareToCategory(v11, &cfstr_Uictcontentsiz_9.isa) == NSOrderedAscending) {
          uint64_t v12 = 3;
        }
        else {
          uint64_t v12 = 2;
        }
      }
      else
      {
        uint64_t v12 = 1;
      }
    }
    else
    {
      uint64_t v12 = 3;
    }

    uint64_t v13 = [(UITableConstants_IOS *)self _symbolImageNamed:@"line.horizontal.3" withTextStyle:@"UICTFontTextStyleBody" scale:v12];
    double v14 = (void *)qword_1EB263548;
    qword_1EB263548 = v13;

    objc_storeStrong((id *)&qword_1EB263550, a3);
    double v10 = (void *)qword_1EB263548;
  }
  id v15 = v10;
  double v16 = [(UITableConstants_IOS *)self _accessoryTintColorForAccessoryBaseColor:v9];
  unint64_t v17 = [v15 imageWithTintColor:v16 renderingMode:1];

  return v17;
}

- (double)defaultAlphaForReorderingCell
{
  return 0.8;
}

- (BOOL)reorderingCellWantsShadows
{
  return 1;
}

- (double)defaultVerticalAccessorySeparatorReplacementPaddingWidth
{
  return 6.0;
}

- (double)reorderControlHoverEffectCornerRadius
{
  return 0.0;
}

- (UIEdgeInsets)reorderControlHoverEffectInsets
{
  double v2 = 0.0;
  double v3 = 0.0;
  double v4 = 0.0;
  double v5 = 0.0;
  result.CGFloat right = v5;
  result.bottom = v4;
  result.CGFloat left = v3;
  result.top = v2;
  return result;
}

- (double)defaultAlphaForDraggingCell:(id)a3 inTableView:(id)a4
{
  return 0.5;
}

- (double)defaultFocusedHorizontalOutsetForTableView:(id)a3
{
  return 0.0;
}

- (double)defaultFocusedShadowRadiusForTableView:(id)a3
{
  return 0.0;
}

- (double)defaultMaskGradientHeightForTableView:(id)a3
{
  return 0.0;
}

- (BOOL)shouldAnimatePropertyInContentViewWithKey:(id)a3
{
  return 0;
}

@end