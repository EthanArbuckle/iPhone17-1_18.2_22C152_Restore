@interface UITableConstants_TV
+ (id)sharedConstants;
- ($4B60890CD43C21BDA0D821D733CDDD8F)contentPropertiesForSidebarElementWithTraitCollection:(SEL)a3 state:(id)a4 isHeader:(id)a5 cellStyle:(BOOL)a6 sidebarStyle:(int64_t)a7;
- (BOOL)defaultLabelAllowsTighteningForTruncationForSidebar:(BOOL)a3 traitCollection:(id)a4;
- (BOOL)defaultRowHeightDependsOnCellStyle;
- (BOOL)imageViewOffsetByLayoutMarginsForCell:(id)a3 inTableView:(id)a4;
- (BOOL)reorderingCellWantsShadows;
- (BOOL)shouldAnimatePropertyInContentViewWithKey:(id)a3;
- (BOOL)shouldUppercaseHeaderFooterTextForTableStyle:(int64_t)a3 isHeader:(BOOL)a4;
- (BOOL)shouldUseDefaultTableLayoutMarginsAsContentInsets;
- (BOOL)shouldUseRoundedGroupsForTableViewStyle:(int64_t)a3 backgroundInsets:(UIEdgeInsets)a4;
- (BOOL)supportsUserInterfaceStyles;
- (BOOL)useChromelessSectionHeadersAndFootersForTableStyle:(int64_t)a3;
- (CGRect)defaultDeleteMinusRectForCell:(id)a3 inTableView:(id)a4;
- (CGSize)defaultEditControlSizeForCell:(id)a3 inTableView:(id)a4;
- (CGSize)defaultReorderControlSizeForCell:(id)a3 withAccessoryBaseColor:(id)a4;
- (UIEdgeInsets)_defaultLayoutMargins;
- (UIEdgeInsets)defaultCellLayoutMarginsForTableStyle:(int64_t)a3 cellStyle:(int64_t)a4 textLabelFont:(id)a5 rawLayoutMargins:(UIEdgeInsets)a6;
- (UIEdgeInsets)defaultHeaderFooterLayoutMarginsForTableViewStyle:(int64_t)a3 isHeader:(BOOL)a4 isFirstSection:(BOOL)a5;
- (UIEdgeInsets)defaultLayoutMarginsForCell:(id)a3 inTableView:(id)a4;
- (UIEdgeInsets)defaultLayoutMarginsInsideSectionForSize:(CGSize)a3 tableStyle:(int64_t)a4;
- (UIEdgeInsets)defaultSectionContentInsetsForTableStyle:(int64_t)a3;
- (UIEdgeInsets)defaultTableLayoutMarginsForScreen:(id)a3 size:(CGSize)a4 tableStyle:(int64_t)a5;
- (UIEdgeInsets)reorderControlHoverEffectInsets;
- (_UITableConstantsBackgroundProperties)defaultCellBackgroundPropertiesForTableViewStyle:(SEL)a3 state:(int64_t)a4 traitCollection:(id)a5;
- (_UITableConstantsBackgroundProperties)defaultHeaderFooterBackgroundPropertiesForTableViewStyle:(SEL)a3 cellConfigurationState:(int64_t)a4 traitCollection:(id)a5 floating:(id)a6;
- (_UITableConstantsBackgroundProperties)defaultSidebarCellBackgroundPropertiesForStyle:(SEL)a3 state:(int64_t)a4 traitCollection:(id)a5;
- (_UITableConstantsBackgroundProperties)defaultSidebarHeaderBackgroundPropertiesWithState:(SEL)a3 traitCollection:(id)a4;
- (double)_defaultNeighborPadding;
- (double)_symbolImageLayoutSizeForTraitCollection:(id)a3;
- (double)defaultAlphaForDraggingCell:(id)a3 inTableView:(id)a4;
- (double)defaultAlphaForReorderingCell;
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
- (double)defaultImageViewSymbolImageAndAccessoryLayoutWidthForSidebar:(BOOL)a3 traitCollection:(id)a4;
- (double)defaultIndentationWidthForSidebarStyle:(BOOL)a3;
- (double)defaultLabelMinimumScaleFactorForSidebar:(BOOL)a3 traitCollection:(id)a4;
- (double)defaultLeadingCellMarginWidthForTableView:(id)a3;
- (double)defaultMarginWidthForTableView:(id)a3;
- (double)defaultMaskGradientHeightForTableView:(id)a3;
- (double)defaultPaddingAboveFirstSectionWithoutHeaderTableStyle:(int64_t)a3;
- (double)defaultPaddingAboveSectionHeadersForTableStyle:(int64_t)a3;
- (double)defaultPaddingBetweenHeaderAndRows;
- (double)defaultPaddingBetweenRows;
- (double)defaultPlainFirstSectionHeaderHeightForTableView:(id)a3;
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
- (id)_defaultCheckmarkImageForCell:(id)a3 forUserInterfaceStyle:(int64_t)a4;
- (id)_defaultDisclosureImageForCell:(id)a3;
- (id)_defaultInsertImageForUserInterfaceStyle:(int64_t)a3;
- (id)_defaultMultiSelectNotSelectedImageForUserInterfaceStyle:(int64_t)a3;
- (id)_defaultMultiSelectSelectedImageForUserInterfaceStyle:(int64_t)a3;
- (id)_defaultReorderControlImageForUserInterfaceStyle:(int64_t)a3;
- (id)_kitImageNamed:(id)a3 withTint:(id)a4 flippedForRightToLeftLayoutDirection:(BOOL)a5;
- (id)_symbolImageNamed:(id)a3 font:(id)a4 cell:(id)a5;
- (id)defaultAccessoryBackgroundColorForAccessorySystemType:(int64_t)a3 header:(BOOL)a4 sidebarStyle:(int64_t)a5 cellConfigurationState:(id)a6 traitCollection:(id)a7;
- (id)defaultAccessoryTintColorForAccessorySystemType:(int64_t)a3 header:(BOOL)a4 sidebarStyle:(int64_t)a5 cellConfigurationState:(id)a6 traitCollection:(id)a7 inheritedTintColor:(id)a8;
- (id)defaultBackgroundColorForTableViewStyle:(int64_t)a3;
- (id)defaultBackgroundEffectsForTableViewStyle:(int64_t)a3;
- (id)defaultCheckmarkImageForCell:(id)a3;
- (id)defaultDeleteImageForCell:(id)a3;
- (id)defaultDeleteImageForUserInterfaceStyle:(int64_t)a3;
- (id)defaultDeleteImageWithTintColor:(id)a3 backgroundColor:(id)a4;
- (id)defaultDetailAccessoryImage;
- (id)defaultDetailTextColorForCellStyle:(int64_t)a3 traitCollection:(id)a4 state:(id)a5;
- (id)defaultDetailTextColorForUserInterfaceStyle:(int64_t)a3;
- (id)defaultDetailTextFontForCellStyle:(int64_t)a3;
- (id)defaultDisclosureImageForCell:(id)a3 withAccessoryBaseColor:(id)a4;
- (id)defaultFocusedCheckmarkImageForCell:(id)a3 inTableView:(id)a4;
- (id)defaultFocusedDeleteImageForCell:(id)a3 inTableView:(id)a4;
- (id)defaultFocusedDetailTextColorForCell:(id)a3 inTableView:(id)a4;
- (id)defaultFocusedDisclosureImageForCell:(id)a3 inTableView:(id)a4;
- (id)defaultFocusedInsertImageForCell:(id)a3 inTableView:(id)a4;
- (id)defaultFocusedMultiSelectNotSelectedImageForCell:(id)a3 inTableView:(id)a4;
- (id)defaultFocusedMultiSelectSelectedImageForCell:(id)a3 inTableView:(id)a4;
- (id)defaultFocusedReorderControlImageForCell:(id)a3 inTableView:(id)a4;
- (id)defaultFocusedTextColorForCell:(id)a3 inTableView:(id)a4;
- (id)defaultFooterFontForTableViewStyle:(int64_t)a3;
- (id)defaultHeaderFontForTableViewStyle:(int64_t)a3;
- (id)defaultHeaderTextColorForTableViewStyle:(int64_t)a3 focused:(BOOL)a4;
- (id)defaultImageSymbolConfigurationForTraitCollection:(id)a3;
- (id)defaultImageTintColorForState:(id)a3 traitCollection:(id)a4;
- (id)defaultInsertImageForCell:(id)a3;
- (id)defaultInsertImageWithTintColor:(id)a3 backgroundColor:(id)a4;
- (id)defaultMultiSelectBackgroundColorForCell:(id)a3 inTableView:(id)a4;
- (id)defaultMultiSelectNotSelectedImageForCellStyle:(int64_t)a3 traitCollection:(id)a4 accessoryBaseColor:(id)a5;
- (id)defaultMultiSelectSelectedImageForCellStyle:(int64_t)a3 traitCollection:(id)a4 checkmarkColor:(id)a5 backgroundColor:(id)a6;
- (id)defaultReorderControlImageForTraitCollection:(id)a3 withAccessoryBaseColor:(id)a4 isTracking:(BOOL)a5;
- (id)defaultSeparatorColorForTableViewStyle:(int64_t)a3;
- (id)defaultSeparatorVisualEffectForTableViewStyle:(int64_t)a3;
- (id)defaultSidebarDetailTextLabelFontForCellStyle:(int64_t)a3;
- (id)defaultSidebarHeaderFont;
- (id)defaultSidebarImageTintColorForTraitCollection:(id)a3 state:(id)a4 isHeader:(BOOL)a5 style:(int64_t)a6;
- (id)defaultSidebarTextColorForTraitCollection:(id)a3 state:(id)a4 isHeader:(BOOL)a5 isSecondaryText:(BOOL)a6 style:(int64_t)a7;
- (id)defaultTextColorForCellStyle:(int64_t)a3 traitCollection:(id)a4 tintColor:(id)a5 state:(id)a6;
- (id)defaultTextColorForUserInterfaceStyle:(int64_t)a3;
- (id)defaultTextLabelFontForCellStyle:(int64_t)a3;
- (id)fallbackHeaderTextColorForTableViewStyle:(int64_t)a3 userInterfaceStyle:(int64_t)a4;
- (id)sidebarVariant;
- (int64_t)defaultHeaderFooterPinningBehaviorForTableStyle:(int64_t)a3;
- (int64_t)defaultLabelNumberOfLinesForSidebar:(BOOL)a3 traitCollection:(id)a4;
- (int64_t)defaultSeparatorStyleForTableViewStyle:(int64_t)a3;
@end

@implementation UITableConstants_TV

+ (id)sharedConstants
{
  v3 = (void *)sharedConstants___sharedConstants_3;
  if (!sharedConstants___sharedConstants_3)
  {
    id v4 = objc_alloc_init((Class)a1);
    v5 = (void *)sharedConstants___sharedConstants_3;
    sharedConstants___sharedConstants_3 = (uint64_t)v4;

    v3 = (void *)sharedConstants___sharedConstants_3;
  }
  return v3;
}

- (id)sidebarVariant
{
  return +[UITableConstants_TVSidebar sharedConstants];
}

- (BOOL)supportsUserInterfaceStyles
{
  return 1;
}

- (id)defaultBackgroundColorForTableViewStyle:(int64_t)a3
{
  return +[UIColor clearColor];
}

- (id)defaultBackgroundEffectsForTableViewStyle:(int64_t)a3
{
  return 0;
}

- (id)defaultSeparatorColorForTableViewStyle:(int64_t)a3
{
  if (a3) {
    +[UIColor tableSeparatorDarkColor];
  }
  else {
  v3 = +[UIColor tableSeparatorLightColor];
  }
  return v3;
}

- (id)defaultSeparatorVisualEffectForTableViewStyle:(int64_t)a3
{
  return 0;
}

- (_UITableConstantsBackgroundProperties)defaultCellBackgroundPropertiesForTableViewStyle:(SEL)a3 state:(int64_t)a4 traitCollection:(id)a5
{
  id v18 = a5;
  id v10 = a6;
  *(_OWORD *)&retstr->var0 = 0u;
  *(_OWORD *)&retstr->var2 = 0u;
  *(_OWORD *)&retstr->var4 = 0u;
  *(_OWORD *)&retstr->var6 = 0u;
  *(_OWORD *)&retstr->var8 = 0u;
  *(_OWORD *)&retstr->var10 = 0u;
  *(_OWORD *)&retstr->var12 = 0u;
  *(_OWORD *)&retstr->var13.leading = 0u;
  retstr->var13.trailing = 0.0;
  -[UITableConstants_TV defaultCellCornerRadiusForTableViewStyle:isSidebarStyle:isHeaderFooter:traitCollection:](self, "defaultCellCornerRadiusForTableViewStyle:isSidebarStyle:isHeaderFooter:traitCollection:", a4, 0, 0, v10, __copy_constructor_8_8_t0w8_s8_s16_s24_t32w41_s80_t88w48((uint64_t)retstr, (uint64_t)&_UITableConstantsBackgroundPropertiesDefault).n128_f64[0]);
  retstr->var12 = v11;
  if (a4)
  {
    if ([v18 isHighlighted])
    {
      v12 = +[UIColor tableCellHighlightedBackgroundColor];
    }
    else if ([v18 isFocused])
    {
      v12 = +[UIColor tableCellFocusedBackgroundColor];
    }
    else if ([v18 isSelected])
    {
      v12 = +[UIColor tableCellGroupedSelectedBackgroundColor];
    }
    else
    {
      if ([v18 isDisabled]) {
        +[UIColor tableCellDisabledBackgroundColor];
      }
      else {
      v12 = +[UIColor tableCellGroupedBackgroundColor];
      }
    }
    id var1 = retstr->var1;
    retstr->id var1 = v12;

    char v15 = [v18 isFocused];
    goto LABEL_23;
  }
  if ([v18 isHighlighted])
  {
    v13 = +[UIColor tableCellHighlightedBackgroundColor];
  }
  else if ([v18 isFocused])
  {
    v13 = +[UIColor tableCellFocusedBackgroundColor];
  }
  else
  {
    if (![v18 isSelected])
    {
      id v14 = retstr->var1;
      retstr->id var1 = 0;
      goto LABEL_15;
    }
    v13 = +[UIColor tableCellPlainSelectedBackgroundColor];
  }
  id v14 = retstr->var1;
  retstr->id var1 = v13;
LABEL_15:

  if (![v18 isSelected]) {
    goto LABEL_25;
  }
  char v15 = [v18 isFocused];
LABEL_23:
  if ((v15 & 1) == 0) {
    retstr->var5 = 3;
  }
LABEL_25:

  return result;
}

- (_UITableConstantsBackgroundProperties)defaultSidebarCellBackgroundPropertiesForStyle:(SEL)a3 state:(int64_t)a4 traitCollection:(id)a5
{
  if (os_variant_has_internal_diagnostics())
  {
    v9 = __UIFaultDebugAssertLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_1853B0000, v9, OS_LOG_TYPE_FAULT, "Calling a method on tvOS that is not implemented for this platform. This is a UIKit bug.", buf, 2u);
    }
  }
  else
  {
    v7 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &defaultSidebarCellBackgroundPropertiesForStyle_state_traitCollection____s_category_0)+ 8);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)id v10 = 0;
      _os_log_impl(&dword_1853B0000, v7, OS_LOG_TYPE_ERROR, "Calling a method on tvOS that is not implemented for this platform. This is a UIKit bug.", v10, 2u);
    }
  }
  __copy_constructor_8_8_t0w8_s8_s16_s24_t32w41_s80_t88w48((uint64_t)retstr, (uint64_t)&_UITableConstantsBackgroundPropertiesDefault);
  return result;
}

- (_UITableConstantsBackgroundProperties)defaultSidebarHeaderBackgroundPropertiesWithState:(SEL)a3 traitCollection:(id)a4
{
  if (os_variant_has_internal_diagnostics())
  {
    v8 = __UIFaultDebugAssertLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_1853B0000, v8, OS_LOG_TYPE_FAULT, "Calling a method on tvOS that is not implemented for this platform. This is a UIKit bug.", buf, 2u);
    }
  }
  else
  {
    v6 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &defaultSidebarHeaderBackgroundPropertiesWithState_traitCollection____s_category_0)+ 8);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl(&dword_1853B0000, v6, OS_LOG_TYPE_ERROR, "Calling a method on tvOS that is not implemented for this platform. This is a UIKit bug.", v9, 2u);
    }
  }
  __copy_constructor_8_8_t0w8_s8_s16_s24_t32w41_s80_t88w48((uint64_t)retstr, (uint64_t)&_UITableConstantsBackgroundPropertiesDefault);
  return result;
}

- (id)defaultMultiSelectBackgroundColorForCell:(id)a3 inTableView:(id)a4
{
  return 0;
}

- (int64_t)defaultSeparatorStyleForTableViewStyle:(int64_t)a3
{
  return 0;
}

- (double)defaultRowHeightForTableView:(id)a3 cellStyle:(int64_t)a4
{
  double result = 66.0;
  if (a4 == 3) {
    return 120.0;
  }
  return result;
}

- (double)defaultRowHeightForTableView:(id)a3
{
  [(UITableConstants_TV *)self defaultRowHeightForTableView:a3 cellStyle:0];
  return result;
}

- (BOOL)defaultRowHeightDependsOnCellStyle
{
  return 1;
}

- (double)defaultSectionHeaderHeightForTableViewStyle:(int64_t)a3 screen:(id)a4
{
  id v5 = a4;
  if (!v5)
  {
    id v5 = +[UIScreen mainScreen];
  }
  double v6 = dbl_186B9A2F0[a3 == 0];
  [v5 scale];
  double v8 = UIPixelBoundaryOffset(1, v6, v7);

  return v8;
}

- (double)defaultSectionFooterHeightForTableViewStyle:(int64_t)a3 screen:(id)a4
{
  id v6 = a4;
  if (!v6)
  {
    id v6 = +[UIScreen mainScreen];
  }
  double v7 = dbl_186B9A2F0[a3 == 0];
  int v8 = dyld_program_sdk_at_least();
  if (!a3 && v8)
  {
    v9 = [(UITableConstants_TV *)self defaultFooterFontForTableViewStyle:0];
    [v9 pointSize];
    double v7 = v10;
  }
  [v6 scale];
  double v12 = UIPixelBoundaryOffset(0, v7, v11);

  return v12;
}

- (double)defaultPaddingAboveFirstSectionWithoutHeaderTableStyle:(int64_t)a3
{
  return 35.0;
}

- (double)defaultSectionHeaderHeightForTableView:(id)a3
{
  uint64_t v5 = [a3 _tableStyle];
  id v6 = [a3 _scrollView];
  double v7 = [v6 window];
  int v8 = [v7 screen];
  [(UITableConstants_TV *)self defaultSectionHeaderHeightForTableViewStyle:v5 screen:v8];
  double v10 = v9;

  return v10;
}

- (double)defaultSectionFooterHeightForTableView:(id)a3
{
  uint64_t v5 = [a3 _tableStyle];
  id v6 = [a3 _scrollView];
  double v7 = [v6 window];
  int v8 = [v7 screen];
  [(UITableConstants_TV *)self defaultSectionHeaderHeightForTableViewStyle:v5 screen:v8];
  double v10 = v9;

  return v10;
}

- (double)defaultTextToSubtitlePaddingForCellStyle:(int64_t)a3
{
  return 15.0;
}

- (double)_defaultNeighborPadding
{
  return 20.0;
}

- (double)minimumContentViewHeightForFont:(id)a3 traitCollection:(id)a4
{
  [a3 _bodyLeading];
  return result;
}

- (UIEdgeInsets)defaultLayoutMarginsForCell:(id)a3 inTableView:(id)a4
{
  uint64_t v7 = [a4 _tableStyle];
  uint64_t v8 = [a3 _cellStyle];
  double v9 = -[UITableConstants_TV defaultTextLabelFontForCellStyle:](self, "defaultTextLabelFontForCellStyle:", [a3 _cellStyle]);
  [a3 _rawLayoutMargins];
  -[UITableConstants_TV defaultCellLayoutMarginsForTableStyle:cellStyle:textLabelFont:rawLayoutMargins:](self, "defaultCellLayoutMarginsForTableStyle:cellStyle:textLabelFont:rawLayoutMargins:", v7, v8, v9);
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v18 = a4;
    v19 = [v18 window];
    v20 = [v19 screen];
    [v18 bounds];
    double v22 = v21;
    double v24 = v23;
    uint64_t v25 = [v18 style];

    -[UITableConstants_TV defaultTableLayoutMarginsForScreen:size:tableStyle:](self, "defaultTableLayoutMarginsForScreen:size:tableStyle:", v20, v25, v22, v24);
    double v27 = v26;

    double v11 = UIEdgeInsetsMax(15, v11, v13, v15, v17, v27);
    double v13 = v28;
    double v15 = v29;
    double v17 = v30;
  }
  double v31 = v11;
  double v32 = v13;
  double v33 = v15;
  double v34 = v17;
  result.right = v34;
  result.bottom = v33;
  result.left = v32;
  result.top = v31;
  return result;
}

- (UIEdgeInsets)defaultCellLayoutMarginsForTableStyle:(int64_t)a3 cellStyle:(int64_t)a4 textLabelFont:(id)a5 rawLayoutMargins:(UIEdgeInsets)a6
{
  [(UITableConstants_TV *)self _defaultNeighborPadding];
  double v7 = v6;
  double v8 = 10.0;
  double v9 = 10.0;
  double v10 = v7;
  result.right = v10;
  result.bottom = v9;
  result.left = v7;
  result.top = v8;
  return result;
}

- (UIEdgeInsets)defaultHeaderFooterLayoutMarginsForTableViewStyle:(int64_t)a3 isHeader:(BOOL)a4 isFirstSection:(BOOL)a5
{
  [(UITableConstants_TV *)self _defaultNeighborPadding];
  double v7 = v6;
  [(UITableConstants_TV *)self _defaultNeighborPadding];
  double v9 = v8;
  double v10 = 15.0;
  double v11 = 15.0;
  double v12 = v7;
  result.right = v9;
  result.bottom = v11;
  result.left = v12;
  result.top = v10;
  return result;
}

- (BOOL)imageViewOffsetByLayoutMarginsForCell:(id)a3 inTableView:(id)a4
{
  return 0;
}

- (double)defaultContentEditPaddingForCell:(id)a3 inTableView:(id)a4
{
  return 0.0;
}

- (double)defaultContentReorderPaddingForCell:(id)a3 inTableView:(id)a4
{
  return 0.0;
}

- (double)defaultContentAccessoryPadding
{
  return 20.0;
}

- (double)_symbolImageLayoutSizeForTraitCollection:(id)a3
{
  id v3 = a3;
  id v4 = +[UIFontMetrics defaultMetrics];
  [v4 scaledValueForValue:v3 compatibleWithTraitCollection:35.0];
  double v6 = v5;

  return v6;
}

- (double)defaultImageViewSymbolImageAndAccessoryLayoutWidthForSidebar:(BOOL)a3 traitCollection:(id)a4
{
  [(UITableConstants_TV *)self _symbolImageLayoutSizeForTraitCollection:a4];
  return result;
}

- (double)defaultDisclosureLayoutWidthForView:(id)a3
{
  return 0.0;
}

- (double)defaultCellCornerRadiusForTableViewStyle:(int64_t)a3 isSidebarStyle:(BOOL)a4 isHeaderFooter:(BOOL)a5 traitCollection:(id)a6
{
  return 12.0;
}

- (double)interspaceBetweenInnerAccessoryIdentifier:(id)a3 outerAccessoryIdentifier:(id)a4 forCell:(id)a5 trailingAccessoryGroup:(BOOL)a6
{
  BOOL v6 = a6;
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (v10)
  {
    double v13 = 12.0;
    if (!v11)
    {
      if (qword_1EB263590 != -1) {
        dispatch_once(&qword_1EB263590, &__block_literal_global_530);
      }
      double v13 = 0.0;
      if (([(id)_MergedGlobals_1247 containsObject:v10] & 1) == 0)
      {
        [v12 _minimumCellAccessoryMargin];
        double v15 = v14;
        [v12 directionalLayoutMargins];
        double v13 = fmax(v15, v16);
      }
    }
  }
  else
  {
    double v13 = 0.0;
    if ((_UITableViewCellUsesLayoutMarginBasedContentPadding() & 1) == 0 && v6)
    {
      [(UITableConstants_TV *)self defaultContentAccessoryPadding];
      double v13 = v17;
    }
  }

  return v13;
}

- (double)defaultIndentationWidthForSidebarStyle:(BOOL)a3
{
  return 10.0;
}

- (double)defaultPaddingAboveSectionHeadersForTableStyle:(int64_t)a3
{
  return 0.0;
}

- (double)defaultPaddingBetweenRows
{
  return 14.0;
}

- (double)defaultPaddingBetweenHeaderAndRows
{
  return 0.0;
}

- (UIEdgeInsets)defaultTableLayoutMarginsForScreen:(id)a3 size:(CGSize)a4 tableStyle:(int64_t)a5
{
  if (dyld_program_sdk_at_least())
  {
    double v7 = 30.0;
    if (a5 != 1) {
      double v7 = 20.0;
    }
    double v8 = 0.0;
    double v9 = 0.0;
    double v10 = v7;
  }
  else
  {
    [(UITableConstants_TV *)self _defaultLayoutMargins];
  }
  result.right = v10;
  result.bottom = v9;
  result.left = v7;
  result.top = v8;
  return result;
}

- (UIEdgeInsets)defaultLayoutMarginsInsideSectionForSize:(CGSize)a3 tableStyle:(int64_t)a4
{
  -[UITableConstants_TV defaultTableLayoutMarginsForScreen:size:tableStyle:](self, "defaultTableLayoutMarginsForScreen:size:tableStyle:", 0, a4, a3.width, a3.height);
  result.right = v7;
  result.bottom = v6;
  result.left = v5;
  result.top = v4;
  return result;
}

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

- (BOOL)shouldUseDefaultTableLayoutMarginsAsContentInsets
{
  return 1;
}

- (UIEdgeInsets)_defaultLayoutMargins
{
  double v2 = 0.0;
  double v3 = 20.0;
  double v4 = 0.0;
  double v5 = 20.0;
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (double)defaultMarginWidthForTableView:(id)a3
{
  double v4 = [a3 _scrollView];
  [v4 directionalLayoutMargins];
  double v6 = v5;

  int v7 = [a3 _sectionContentInsetFollowsLayoutMargins];
  double result = fmax(v6, 20.0);
  if (v7) {
    return v6 + 20.0;
  }
  return result;
}

- (double)defaultLeadingCellMarginWidthForTableView:(id)a3
{
  if ([a3 _sectionContentInsetFollowsLayoutMargins]) {
    return 20.0;
  }
  double v5 = [a3 _scrollView];
  [v5 directionalLayoutMargins];
  double v7 = v6;

  return fmax(v7, 20.0);
}

- (double)defaultTrailingCellMarginWidthForTableView:(id)a3
{
  return 20.0;
}

- (BOOL)shouldUppercaseHeaderFooterTextForTableStyle:(int64_t)a3 isHeader:(BOOL)a4
{
  return a4;
}

- (double)defaultPlainFirstSectionHeaderHeightForTableView:(id)a3
{
  return 58.0;
}

- (double)defaultPlainHeaderLabelYPositionForTableView:(id)a3 headerBounds:(CGRect)a4 textRect:(CGRect)a5 isHeader:(BOOL)a6
{
  double v6 = a4.size.height - a5.size.height;
  if (a6)
  {
    if (v6 >= a4.origin.y) {
      double y = a4.origin.y;
    }
    else {
      double y = a4.size.height - a5.size.height;
    }
    double v8 = -[UITableConstants_TV defaultHeaderFontForTableViewStyle:](self, "defaultHeaderFontForTableViewStyle:", objc_msgSend(a3, "_tableStyle", a4.origin.x));
    [v8 descender];
    double v10 = floor(v9);

    if (v6 - (v10 + 22.0) >= y) {
      return v6 - (v10 + 22.0);
    }
    else {
      return y;
    }
  }
  return v6;
}

- (int64_t)defaultLabelNumberOfLinesForSidebar:(BOOL)a3 traitCollection:(id)a4
{
  return 0;
}

- (BOOL)defaultLabelAllowsTighteningForTruncationForSidebar:(BOOL)a3 traitCollection:(id)a4
{
  return 0;
}

- (double)defaultLabelMinimumScaleFactorForSidebar:(BOOL)a3 traitCollection:(id)a4
{
  return 0.0;
}

- (id)defaultTextColorForUserInterfaceStyle:(int64_t)a3
{
  if (a3 == 1000 || a3 == 2)
  {
    double v3 = +[UIColor whiteColor];
  }
  else
  {
    double v3 = +[UIColor blackColor];
  }
  return v3;
}

- (id)defaultTextColorForCellStyle:(int64_t)a3 traitCollection:(id)a4 tintColor:(id)a5 state:(id)a6
{
  id v8 = a4;
  if ([a6 isFocused]) {
    uint64_t v9 = 1;
  }
  else {
    uint64_t v9 = [v8 userInterfaceStyle];
  }
  double v10 = [(UITableConstants_TV *)self defaultTextColorForUserInterfaceStyle:v9];

  return v10;
}

- ($4B60890CD43C21BDA0D821D733CDDD8F)contentPropertiesForSidebarElementWithTraitCollection:(SEL)a3 state:(id)a4 isHeader:(id)a5 cellStyle:(BOOL)a6 sidebarStyle:(int64_t)a7
{
  BOOL v10 = a6;
  id v29 = a4;
  id v14 = a5;
  *(_OWORD *)&retstr->id var0 = 0u;
  *(_OWORD *)&retstr->id var2 = 0u;
  *(_OWORD *)&retstr->id var4 = 0u;
  *(_OWORD *)&retstr->var6 = 0u;
  *(_OWORD *)&retstr->var8 = 0u;
  *(void *)&double v15 = __copy_constructor_8_8_s0_s8_s16_s24_s32_s40_t48w32((uint64_t)retstr, (uint64_t)&_UITableConstantsContentPropertiesDefault).n128_u64[0];
  if (v10) {
    [(UITableConstants_TV *)self defaultSidebarHeaderFont];
  }
  else {
  double v16 = -[UITableConstants_TV defaultTextLabelFontForCellStyle:](self, "defaultTextLabelFontForCellStyle:", 0, v15);
  }
  id var0 = retstr->var0;
  retstr->id var0 = v16;

  id v18 = [(UITableConstants_TV *)self defaultSidebarDetailTextLabelFontForCellStyle:a7];
  id var1 = retstr->var1;
  retstr->id var1 = v18;

  v20 = [(UITableConstants_TV *)self defaultSidebarTextColorForTraitCollection:v29 state:v14 isHeader:0 isSecondaryText:0 style:a8];
  id var2 = retstr->var2;
  retstr->id var2 = v20;

  double v22 = [(UITableConstants_TV *)self defaultSidebarTextColorForTraitCollection:v29 state:v14 isHeader:v10 isSecondaryText:1 style:a8];
  id var3 = retstr->var3;
  retstr->id var3 = v22;

  double v24 = [(UITableConstants_TV *)self defaultSidebarImageTintColorForTraitCollection:v29 state:v14 isHeader:v10 style:a8];
  id var4 = retstr->var4;
  retstr->id var4 = v24;

  double v26 = [(UITableConstants_TV *)self defaultImageSymbolConfigurationForTraitCollection:v29];
  id var5 = retstr->var5;
  retstr->id var5 = v26;

  if ([v14 isHighlighted])
  {
    *(int64x2_t *)&retstr->var7 = vdupq_n_s64(7uLL);
    retstr->var9 = 7;
  }

  return result;
}

- (id)defaultSidebarTextColorForTraitCollection:(id)a3 state:(id)a4 isHeader:(BOOL)a5 isSecondaryText:(BOOL)a6 style:(int64_t)a7
{
  return -[UITableConstants_TV defaultTextColorForCellStyle:traitCollection:tintColor:state:](self, "defaultTextColorForCellStyle:traitCollection:tintColor:state:", 0, a3, 0, a4, a7);
}

- (id)defaultSidebarImageTintColorForTraitCollection:(id)a3 state:(id)a4 isHeader:(BOOL)a5 style:(int64_t)a6
{
  return -[UITableConstants_TV defaultImageTintColorForState:traitCollection:](self, "defaultImageTintColorForState:traitCollection:", a4, a3, a5, a6);
}

- (id)defaultSidebarHeaderFont
{
  return (id)[off_1E52D39B8 preferredFontForTextStyle:@"UICTFontTextStyleEmphasizedTitle3"];
}

- (id)defaultSidebarDetailTextLabelFontForCellStyle:(int64_t)a3
{
  if (a3 == 1) {
    -[UITableConstants_TV defaultDetailTextFontForCellStyle:](self, "defaultDetailTextFontForCellStyle:");
  }
  else {
  double v3 = [off_1E52D39B8 preferredFontForTextStyle:@"UICTFontTextStyleFootnote"];
  }
  return v3;
}

- (id)defaultFocusedTextColorForCell:(id)a3 inTableView:(id)a4
{
  id v5 = a3;
  uint64_t v6 = [v5 _cellStyle];
  double v7 = [v5 traitCollection];
  id v8 = [v5 tintColor];

  uint64_t v9 = +[UICellConfigurationState _readonlyCellStateFromViewConfigurationState:]((uint64_t)UICellConfigurationState, 8);
  BOOL v10 = [(UITableConstants_TV *)self defaultTextColorForCellStyle:v6 traitCollection:v7 tintColor:v8 state:v9];

  return v10;
}

- (id)defaultTextLabelFontForCellStyle:(int64_t)a3
{
  double v3 = &UIFontTextStyleHeadline;
  if (a3 == 1000) {
    double v3 = &UIFontTextStyleBody;
  }
  double v4 = [off_1E52D39B8 preferredFontForTextStyle:*v3];
  return v4;
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

- (id)defaultDetailTextColorForUserInterfaceStyle:(int64_t)a3
{
  if (a3 == 1000 || a3 == 2)
  {
    double v3 = +[UIColor _tvInterfaceStyleDarkContentColor];
  }
  else
  {
    double v3 = +[UIColor _tvInterfaceStyleLightContentColor];
  }
  return v3;
}

- (id)defaultDetailTextColorForCellStyle:(int64_t)a3 traitCollection:(id)a4 state:(id)a5
{
  id v7 = a4;
  if ([a5 isFocused]) {
    uint64_t v8 = 1;
  }
  else {
    uint64_t v8 = [v7 userInterfaceStyle];
  }
  uint64_t v9 = [(UITableConstants_TV *)self defaultDetailTextColorForUserInterfaceStyle:v8];

  return v9;
}

- (id)defaultFocusedDetailTextColorForCell:(id)a3 inTableView:(id)a4
{
  id v5 = a3;
  uint64_t v6 = [v5 _cellStyle];
  id v7 = [v5 traitCollection];

  uint64_t v8 = +[UICellConfigurationState _readonlyCellStateFromViewConfigurationState:]((uint64_t)UICellConfigurationState, 8);
  uint64_t v9 = [(UITableConstants_TV *)self defaultDetailTextColorForCellStyle:v6 traitCollection:v7 state:v8];

  return v9;
}

- (id)defaultDetailTextFontForCellStyle:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 2)
  {
    id v5 = 0;
  }
  else
  {
    id v5 = objc_msgSend(off_1E52D39B8, "preferredFontForTextStyle:", *off_1E5308A98[a3 - 1], v3);
  }
  return v5;
}

- (double)defaultDetailTextLabelFontSizeForCellStyle:(int64_t)a3
{
  if (a3 == 1) {
    return 17.0;
  }
  if (a3 == 3) {
    return 12.0;
  }
  -[UITableConstants_TV defaultTextLabelFontSizeForCellStyle:](self, "defaultTextLabelFontSizeForCellStyle:");
  return result;
}

- (id)defaultHeaderFontForTableViewStyle:(int64_t)a3
{
  return (id)[off_1E52D39B8 preferredFontForTextStyle:@"UICTFontTextStyleEmphasizedBody"];
}

- (id)defaultFooterFontForTableViewStyle:(int64_t)a3
{
  return (id)[off_1E52D39B8 preferredFontForTextStyle:@"UICTFontTextStyleBody"];
}

- (id)fallbackHeaderTextColorForTableViewStyle:(int64_t)a3 userInterfaceStyle:(int64_t)a4
{
  return +[UIColor tertiaryLabelColor];
}

- (id)defaultHeaderTextColorForTableViewStyle:(int64_t)a3 focused:(BOOL)a4
{
  if (a4) {
    +[UIColor _tvInterfaceStyleLightContentColor];
  }
  else {
  uint64_t v4 = +[UIColor tertiaryLabelColor];
  }
  return v4;
}

- (BOOL)useChromelessSectionHeadersAndFootersForTableStyle:(int64_t)a3
{
  return 0;
}

- (int64_t)defaultHeaderFooterPinningBehaviorForTableStyle:(int64_t)a3
{
  return 0;
}

- (_UITableConstantsBackgroundProperties)defaultHeaderFooterBackgroundPropertiesForTableViewStyle:(SEL)a3 cellConfigurationState:(int64_t)a4 traitCollection:(id)a5 floating:(id)a6
{
  retstr->var13.trailing = 0.0;
  *(_OWORD *)&retstr->var12 = 0u;
  *(_OWORD *)&retstr->var13.leading = 0u;
  *(_OWORD *)&retstr->var8 = 0u;
  *(_OWORD *)&retstr->var10 = 0u;
  *(_OWORD *)&retstr->id var4 = 0u;
  *(_OWORD *)&retstr->var6 = 0u;
  *(_OWORD *)&retstr->id var0 = 0u;
  *(_OWORD *)&retstr->id var2 = 0u;
  return self;
}

- (id)_kitImageNamed:(id)a3 withTint:(id)a4 flippedForRightToLeftLayoutDirection:(BOOL)a5
{
  BOOL v5 = a5;
  id v7 = a4;
  id v8 = a3;
  uint64_t v9 = +[UIScreen mainScreen];
  BOOL v10 = [v9 traitCollection];
  id v11 = +[UIImage _kitImageNamed:v8 withTrait:v10];

  [v11 size];
  id v12 = +[UIImage _tintedImageForSize:withTint:effectsImage:maskImage:style:](UIImage, "_tintedImageForSize:withTint:effectsImage:maskImage:style:", v7, 0, v11, 0);

  if (v5)
  {
    uint64_t v13 = [v12 imageFlippedForRightToLeftLayoutDirection];

    id v12 = (void *)v13;
  }

  return v12;
}

- (id)_symbolImageNamed:(id)a3 font:(id)a4 cell:(id)a5
{
  id v6 = a3;
  id v7 = +[UIImageSymbolConfiguration configurationWithFont:a4];
  id v8 = +[UIImage systemImageNamed:v6 withConfiguration:v7];

  return v8;
}

- (id)_defaultDisclosureImageForCell:(id)a3
{
  BOOL v5 = -[UITableConstants_TV defaultTextLabelFontForCellStyle:](self, "defaultTextLabelFontForCellStyle:", [a3 _cellStyle]);
  int v6 = [v5 isEqual:qword_1EB2635A0];
  id v7 = (void *)qword_1EB263598;
  if (v6) {
    BOOL v8 = qword_1EB263598 == 0;
  }
  else {
    BOOL v8 = 1;
  }
  if (v8)
  {
    uint64_t v9 = [(UITableConstants_TV *)self _symbolImageNamed:@"chevron.forward" font:v5 cell:a3];
    BOOL v10 = (void *)qword_1EB263598;
    qword_1EB263598 = v9;

    objc_storeStrong((id *)&qword_1EB2635A0, v5);
    id v7 = (void *)qword_1EB263598;
  }
  id v11 = v7;

  return v11;
}

- (id)defaultDisclosureImageForCell:(id)a3 withAccessoryBaseColor:(id)a4
{
  id v6 = a4;
  id v7 = [a3 traitCollection];
  uint64_t v8 = [v7 userInterfaceStyle];

  uint64_t v9 = [(UITableConstants_TV *)self _defaultDisclosureImageForCell:a3];
  id v10 = v6;
  id v11 = v10;
  if (!v10)
  {
    if (v8 == 1000 || v8 == 2)
    {
      uint64_t v12 = +[UIColor _tvInterfaceStyleDarkContentColor];
    }
    else
    {
      uint64_t v12 = +[UIColor _tvInterfaceStyleLightContentColor];
    }
    id v11 = (void *)v12;
  }
  uint64_t v13 = [v9 imageWithTintColor:v11 renderingMode:1];

  return v13;
}

- (id)defaultFocusedDisclosureImageForCell:(id)a3 inTableView:(id)a4
{
  uint64_t v4 = -[UITableConstants_TV _defaultDisclosureImageForCell:](self, "_defaultDisclosureImageForCell:", a3, a4);
  BOOL v5 = +[UIColor _tvInterfaceStyleLightContentColor];
  id v6 = [v4 imageWithTintColor:v5 renderingMode:1];

  return v6;
}

- (id)_defaultCheckmarkImageForCell:(id)a3 forUserInterfaceStyle:(int64_t)a4
{
  id v7 = -[UITableConstants_TV defaultTextLabelFontForCellStyle:](self, "defaultTextLabelFontForCellStyle:", [a3 _cellStyle]);
  uint64_t v8 = v7;
  if (a4 == 1000 || a4 == 2)
  {
    uint64_t v9 = &qword_1EB2635B8;
    int v10 = [v7 isEqual:qword_1EB2635C0];
    id v11 = (void *)qword_1EB2635B8;
    if (v10) {
      BOOL v12 = qword_1EB2635B8 == 0;
    }
    else {
      BOOL v12 = 1;
    }
    if (!v12) {
      goto LABEL_16;
    }
    uint64_t v13 = +[UIColor _tvInterfaceStyleDarkContentColor];
LABEL_15:
    double v16 = (void *)v13;
    double v17 = [(UITableConstants_TV *)self _symbolImageNamed:@"checkmark" font:v8 cell:a3];
    uint64_t v18 = [v17 imageWithTintColor:v16 renderingMode:1];
    v19 = (void *)*v9;
    uint64_t *v9 = v18;

    objc_storeStrong((id *)v9 + 1, v8);
    id v11 = (void *)*v9;
    goto LABEL_16;
  }
  uint64_t v9 = &qword_1EB2635A8;
  int v14 = [v7 isEqual:qword_1EB2635B0];
  id v11 = (void *)qword_1EB2635A8;
  if (v14) {
    BOOL v15 = qword_1EB2635A8 == 0;
  }
  else {
    BOOL v15 = 1;
  }
  if (v15)
  {
    uint64_t v13 = +[UIColor _tvInterfaceStyleLightContentColor];
    goto LABEL_15;
  }
LABEL_16:
  id v20 = v11;

  return v20;
}

- (id)defaultCheckmarkImageForCell:(id)a3
{
  BOOL v5 = [a3 traitCollection];
  id v6 = -[UITableConstants_TV _defaultCheckmarkImageForCell:forUserInterfaceStyle:](self, "_defaultCheckmarkImageForCell:forUserInterfaceStyle:", a3, [v5 userInterfaceStyle]);

  return v6;
}

- (id)defaultFocusedCheckmarkImageForCell:(id)a3 inTableView:(id)a4
{
  return [(UITableConstants_TV *)self _defaultCheckmarkImageForCell:a3 forUserInterfaceStyle:1];
}

- (id)defaultDetailAccessoryImage
{
  return +[UIImage systemImageNamed:@"info.circle"];
}

- (CGSize)defaultEditControlSizeForCell:(id)a3 inTableView:(id)a4
{
  double v4 = 105.0;
  double v5 = 70.0;
  result.height = v5;
  result.width = v4;
  return result;
}

- (double)defaultEditControlPaddingForCell:(id)a3 inTableView:(id)a4
{
  return 0.0;
}

- (double)defaultSpaceBetweenEditAndReorderControlsForCell:(id)a3 inTableView:(id)a4
{
  return 12.0;
}

- (CGRect)defaultDeleteMinusRectForCell:(id)a3 inTableView:(id)a4
{
  double v4 = 8.0;
  double v5 = 12.0;
  double v6 = 13.0;
  double v7 = 3.0;
  result.size.height = v7;
  result.size.width = v6;
  result.origin.double y = v5;
  result.origin.x = v4;
  return result;
}

- (id)defaultDeleteImageForUserInterfaceStyle:(int64_t)a3
{
  double v4 = +[UIImageSymbolConfiguration configurationWithTextStyle:@"UICTFontTextStyleBody" scale:3];
  double v5 = +[UIImage systemImageNamed:@"trash" withConfiguration:v4];
  double v6 = v5;
  if (a3 == 1000 || a3 == 2)
  {
    double v7 = +[UIColor whiteColor];
    id v8 = [v6 imageWithTintColor:v7 renderingMode:1];
  }
  else
  {
    uint64_t v9 = (void *)defaultDeleteImageForUserInterfaceStyle____deleteImage_0;
    if (!defaultDeleteImageForUserInterfaceStyle____deleteImage_0)
    {
      uint64_t v10 = ImageWithOpacity(v5);
      id v11 = (void *)defaultDeleteImageForUserInterfaceStyle____deleteImage_0;
      defaultDeleteImageForUserInterfaceStyle____deleteImage_0 = v10;

      uint64_t v9 = (void *)defaultDeleteImageForUserInterfaceStyle____deleteImage_0;
    }
    id v8 = v9;
  }

  return v8;
}

- (id)defaultDeleteImageForCell:(id)a3
{
  double v4 = [a3 traitCollection];
  double v5 = -[UITableConstants_TV defaultDeleteImageForUserInterfaceStyle:](self, "defaultDeleteImageForUserInterfaceStyle:", [v4 userInterfaceStyle]);

  return v5;
}

- (id)defaultDeleteImageWithTintColor:(id)a3 backgroundColor:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  double v7 = (void *)defaultDeleteImageWithTintColor_backgroundColor____untintedDeleteImage_0;
  if (defaultDeleteImageWithTintColor_backgroundColor____untintedDeleteImage_0)
  {
    if (v5)
    {
LABEL_3:
      id v8 = [v7 imageWithTintColor:v5 renderingMode:1];
      goto LABEL_6;
    }
  }
  else
  {
    uint64_t v9 = +[UIImageSymbolConfiguration configurationWithTextStyle:@"UICTFontTextStyleBody" scale:3];
    uint64_t v10 = +[UIImage systemImageNamed:@"trash" withConfiguration:v9];
    id v11 = (void *)defaultDeleteImageWithTintColor_backgroundColor____untintedDeleteImage_0;
    defaultDeleteImageWithTintColor_backgroundColor____untintedDeleteImage_0 = v10;

    double v7 = (void *)defaultDeleteImageWithTintColor_backgroundColor____untintedDeleteImage_0;
    if (v5) {
      goto LABEL_3;
    }
  }
  BOOL v12 = +[UIColor whiteColor];
  id v8 = [v7 imageWithTintColor:v12 renderingMode:1];

LABEL_6:
  return v8;
}

- (id)defaultFocusedDeleteImageForCell:(id)a3 inTableView:(id)a4
{
  return -[UITableConstants_TV defaultDeleteImageForUserInterfaceStyle:](self, "defaultDeleteImageForUserInterfaceStyle:", 1, a4);
}

- (id)_defaultInsertImageForUserInterfaceStyle:(int64_t)a3
{
  double v4 = +[UIImageSymbolConfiguration configurationWithTextStyle:@"UICTFontTextStyleBody" scale:3];
  id v5 = +[UIImage systemImageNamed:@"plus.circle.fill" withConfiguration:v4];
  id v6 = v5;
  if (a3 == 1000 || a3 == 2)
  {
    double v7 = +[UIColor whiteColor];
    id v8 = [v6 imageWithTintColor:v7 renderingMode:1];
  }
  else
  {
    uint64_t v9 = (void *)_defaultInsertImageForUserInterfaceStyle____insertImage_0;
    if (!_defaultInsertImageForUserInterfaceStyle____insertImage_0)
    {
      uint64_t v10 = ImageWithOpacity(v5);
      id v11 = (void *)_defaultInsertImageForUserInterfaceStyle____insertImage_0;
      _defaultInsertImageForUserInterfaceStyle____insertImage_0 = v10;

      uint64_t v9 = (void *)_defaultInsertImageForUserInterfaceStyle____insertImage_0;
    }
    id v8 = v9;
  }

  return v8;
}

- (id)defaultInsertImageForCell:(id)a3
{
  double v4 = [a3 traitCollection];
  id v5 = -[UITableConstants_TV _defaultInsertImageForUserInterfaceStyle:](self, "_defaultInsertImageForUserInterfaceStyle:", [v4 userInterfaceStyle]);

  return v5;
}

- (id)defaultInsertImageWithTintColor:(id)a3 backgroundColor:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  double v7 = (void *)defaultInsertImageWithTintColor_backgroundColor____untintedInsertImage_0;
  if (defaultInsertImageWithTintColor_backgroundColor____untintedInsertImage_0)
  {
    if (v5)
    {
LABEL_3:
      id v8 = [v7 imageWithTintColor:v5 renderingMode:1];
      goto LABEL_6;
    }
  }
  else
  {
    uint64_t v9 = +[UIImageSymbolConfiguration configurationWithTextStyle:@"UICTFontTextStyleBody" scale:3];
    uint64_t v10 = +[UIImage systemImageNamed:@"plus.circle.fill" withConfiguration:v9];
    id v11 = (void *)defaultInsertImageWithTintColor_backgroundColor____untintedInsertImage_0;
    defaultInsertImageWithTintColor_backgroundColor____untintedInsertImage_0 = v10;

    double v7 = (void *)defaultInsertImageWithTintColor_backgroundColor____untintedInsertImage_0;
    if (v5) {
      goto LABEL_3;
    }
  }
  BOOL v12 = +[UIColor whiteColor];
  id v8 = [v7 imageWithTintColor:v12 renderingMode:1];

LABEL_6:
  return v8;
}

- (id)defaultFocusedInsertImageForCell:(id)a3 inTableView:(id)a4
{
  return -[UITableConstants_TV _defaultInsertImageForUserInterfaceStyle:](self, "_defaultInsertImageForUserInterfaceStyle:", 1, a4);
}

- (id)_defaultMultiSelectNotSelectedImageForUserInterfaceStyle:(int64_t)a3
{
  double v4 = +[UIImageSymbolConfiguration configurationWithTextStyle:@"UICTFontTextStyleBody" scale:3];
  id v5 = +[UIImage systemImageNamed:@"circle" withConfiguration:v4];
  id v6 = v5;
  if (a3 == 1000 || a3 == 2)
  {
    double v7 = +[UIColor whiteColor];
    id v8 = [v6 imageWithTintColor:v7 renderingMode:1];
  }
  else
  {
    uint64_t v9 = (void *)_defaultMultiSelectNotSelectedImageForUserInterfaceStyle____multiSelectNotSelectedImage_0;
    if (!_defaultMultiSelectNotSelectedImageForUserInterfaceStyle____multiSelectNotSelectedImage_0)
    {
      uint64_t v10 = ImageWithOpacity(v5);
      id v11 = (void *)_defaultMultiSelectNotSelectedImageForUserInterfaceStyle____multiSelectNotSelectedImage_0;
      _defaultMultiSelectNotSelectedImageForUserInterfaceStyle____multiSelectNotSelectedImage_0 = v10;

      uint64_t v9 = (void *)_defaultMultiSelectNotSelectedImageForUserInterfaceStyle____multiSelectNotSelectedImage_0;
    }
    id v8 = v9;
  }

  return v8;
}

- (id)defaultMultiSelectNotSelectedImageForCellStyle:(int64_t)a3 traitCollection:(id)a4 accessoryBaseColor:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  if (v8)
  {
    uint64_t v9 = (void *)defaultMultiSelectNotSelectedImageForCellStyle_traitCollection_accessoryBaseColor____untintedMultiSelectNotSelectedImage_0;
    if (!defaultMultiSelectNotSelectedImageForCellStyle_traitCollection_accessoryBaseColor____untintedMultiSelectNotSelectedImage_0)
    {
      uint64_t v10 = +[UIImageSymbolConfiguration configurationWithTextStyle:@"UICTFontTextStyleBody" scale:3];
      uint64_t v11 = +[UIImage systemImageNamed:@"circle" withConfiguration:v10];
      BOOL v12 = (void *)defaultMultiSelectNotSelectedImageForCellStyle_traitCollection_accessoryBaseColor____untintedMultiSelectNotSelectedImage_0;
      defaultMultiSelectNotSelectedImageForCellStyle_traitCollection_accessoryBaseColor____untintedMultiSelectNotSelectedImage_0 = v11;

      uint64_t v9 = (void *)defaultMultiSelectNotSelectedImageForCellStyle_traitCollection_accessoryBaseColor____untintedMultiSelectNotSelectedImage_0;
    }
    uint64_t v13 = [v9 imageWithTintColor:v8 renderingMode:1];
  }
  else
  {
    uint64_t v13 = -[UITableConstants_TV _defaultMultiSelectNotSelectedImageForUserInterfaceStyle:](self, "_defaultMultiSelectNotSelectedImageForUserInterfaceStyle:", [v7 userInterfaceStyle]);
  }
  int v14 = (void *)v13;

  return v14;
}

- (id)defaultFocusedMultiSelectNotSelectedImageForCell:(id)a3 inTableView:(id)a4
{
  return -[UITableConstants_TV _defaultMultiSelectNotSelectedImageForUserInterfaceStyle:](self, "_defaultMultiSelectNotSelectedImageForUserInterfaceStyle:", 1, a4);
}

- (id)_defaultMultiSelectSelectedImageForUserInterfaceStyle:(int64_t)a3
{
  double v4 = +[UIImageSymbolConfiguration configurationWithTextStyle:@"UICTFontTextStyleBody" scale:3];
  id v5 = +[UIImage checkmarkImage];
  id v6 = [v5 imageWithConfiguration:v4];

  if (a3 == 1000 || a3 == 2)
  {
    id v7 = +[UIColor whiteColor];
    id v8 = [v6 imageWithTintColor:v7 renderingMode:1];
  }
  else
  {
    uint64_t v9 = (void *)_defaultMultiSelectSelectedImageForUserInterfaceStyle____multiSelectSelectedImage_0;
    if (!_defaultMultiSelectSelectedImageForUserInterfaceStyle____multiSelectSelectedImage_0)
    {
      uint64_t v10 = ImageWithOpacity(v6);
      uint64_t v11 = (void *)_defaultMultiSelectSelectedImageForUserInterfaceStyle____multiSelectSelectedImage_0;
      _defaultMultiSelectSelectedImageForUserInterfaceStyle____multiSelectSelectedImage_0 = v10;

      uint64_t v9 = (void *)_defaultMultiSelectSelectedImageForUserInterfaceStyle____multiSelectSelectedImage_0;
    }
    id v8 = v9;
  }

  return v8;
}

- (id)defaultMultiSelectSelectedImageForCellStyle:(int64_t)a3 traitCollection:(id)a4 checkmarkColor:(id)a5 backgroundColor:(id)a6
{
  uint64_t v7 = objc_msgSend(a4, "userInterfaceStyle", a3);
  return [(UITableConstants_TV *)self _defaultMultiSelectSelectedImageForUserInterfaceStyle:v7];
}

- (id)defaultFocusedMultiSelectSelectedImageForCell:(id)a3 inTableView:(id)a4
{
  return -[UITableConstants_TV _defaultMultiSelectSelectedImageForUserInterfaceStyle:](self, "_defaultMultiSelectSelectedImageForUserInterfaceStyle:", 1, a4);
}

- (double)defaultEditAndUpdateAnimationDuration
{
  return 0.3;
}

- (CGSize)defaultReorderControlSizeForCell:(id)a3 withAccessoryBaseColor:(id)a4
{
  double v4 = 105.0;
  double v5 = 70.0;
  result.height = v5;
  result.width = v4;
  return result;
}

- (id)_defaultReorderControlImageForUserInterfaceStyle:(int64_t)a3
{
  if (a3 == 1000 || a3 == 2)
  {
    double v4 = (void *)qword_1EB2635D0;
    if (qword_1EB2635D0) {
      goto LABEL_8;
    }
    double v5 = +[UIColor whiteColor];
    uint64_t v6 = [(UITableConstants_TV *)self _kitImageNamed:@"UITableGrabber" withTint:v5 flippedForRightToLeftLayoutDirection:0];
    uint64_t v7 = &qword_1EB2635D0;
    id v8 = (void *)qword_1EB2635D0;
    qword_1EB2635D0 = v6;
  }
  else
  {
    double v4 = (void *)qword_1EB2635C8;
    if (qword_1EB2635C8) {
      goto LABEL_8;
    }
    uint64_t v9 = _UIImageWithName(@"UITableGrabber");
    uint64_t v7 = &qword_1EB2635C8;
    uint64_t v10 = (void *)qword_1EB2635C8;
    qword_1EB2635C8 = v9;

    uint64_t v11 = ImageWithOpacity((void *)qword_1EB2635C8);
    double v5 = (void *)qword_1EB2635C8;
    qword_1EB2635C8 = v11;
  }

  double v4 = (void *)*v7;
LABEL_8:
  return v4;
}

- (id)defaultReorderControlImageForTraitCollection:(id)a3 withAccessoryBaseColor:(id)a4 isTracking:(BOOL)a5
{
  id v7 = a3;
  id v8 = a4;
  if (v8)
  {
    uint64_t v9 = (void *)defaultReorderControlImageForTraitCollection_withAccessoryBaseColor_isTracking____untintedGrabberImage_0;
    if (!defaultReorderControlImageForTraitCollection_withAccessoryBaseColor_isTracking____untintedGrabberImage_0)
    {
      uint64_t v10 = _UIImageWithName(@"UITableGrabber");
      uint64_t v11 = (void *)defaultReorderControlImageForTraitCollection_withAccessoryBaseColor_isTracking____untintedGrabberImage_0;
      defaultReorderControlImageForTraitCollection_withAccessoryBaseColor_isTracking____untintedGrabberImage_0 = v10;

      uint64_t v9 = (void *)defaultReorderControlImageForTraitCollection_withAccessoryBaseColor_isTracking____untintedGrabberImage_0;
    }
    uint64_t v12 = [v9 imageWithTintColor:v8 renderingMode:1];
  }
  else
  {
    uint64_t v12 = -[UITableConstants_TV _defaultReorderControlImageForUserInterfaceStyle:](self, "_defaultReorderControlImageForUserInterfaceStyle:", [v7 userInterfaceStyle]);
  }
  uint64_t v13 = (void *)v12;

  return v13;
}

- (id)defaultFocusedReorderControlImageForCell:(id)a3 inTableView:(id)a4
{
  return -[UITableConstants_TV _defaultReorderControlImageForUserInterfaceStyle:](self, "_defaultReorderControlImageForUserInterfaceStyle:", 1, a4);
}

- (double)defaultAlphaForReorderingCell
{
  return 1.0;
}

- (BOOL)reorderingCellWantsShadows
{
  return 0;
}

- (double)defaultVerticalAccessorySeparatorReplacementPaddingWidth
{
  return 6.0;
}

- (double)defaultAlphaForDraggingCell:(id)a3 inTableView:(id)a4
{
  return 1.0;
}

- (double)defaultFocusedHorizontalOutsetForTableView:(id)a3
{
  return 30.0;
}

- (double)defaultFocusedShadowRadiusForTableView:(id)a3
{
  return 20.0;
}

- (double)defaultMaskGradientHeightForTableView:(id)a3
{
  return 90.0;
}

- (id)defaultImageSymbolConfigurationForTraitCollection:(id)a3
{
  uint64_t v3 = [a3 preferredContentSizeCategory];
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

- (id)defaultImageTintColorForState:(id)a3 traitCollection:(id)a4
{
  if ([a3 isFocused])
  {
    uint64_t v4 = +[UIColor blackColor];
  }
  else
  {
    uint64_t v4 = 0;
  }
  return v4;
}

- (id)defaultAccessoryTintColorForAccessorySystemType:(int64_t)a3 header:(BOOL)a4 sidebarStyle:(int64_t)a5 cellConfigurationState:(id)a6 traitCollection:(id)a7 inheritedTintColor:(id)a8
{
  id v12 = a6;
  uint64_t v13 = [a7 userInterfaceStyle];
  char v14 = [v12 isFocused];

  BOOL v15 = v13 == 2 || v13 == 1000;
  char v16 = v14 ^ 1;
  if (!v15) {
    char v16 = 0;
  }
  if ((unint64_t)a3 > 0xA)
  {
    uint64_t v18 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"UITableConstants_TV.m", 1147, @"Invalid _UICellAccessorySystemType value: %ld", a3);
  }
  else
  {
    if (((1 << a3) & 0x683) != 0)
    {
      if (v16)
      {
        double v17 = +[UIColor _tvInterfaceStyleDarkContentColor];
        goto LABEL_16;
      }
      goto LABEL_13;
    }
    if (((1 << a3) & 0x3C) != 0)
    {
      if (v16)
      {
        double v17 = +[UIColor whiteColor];
        goto LABEL_16;
      }
LABEL_13:
      double v17 = +[UIColor _tvInterfaceStyleLightContentColor];
      goto LABEL_16;
    }
  }
  double v17 = 0;
LABEL_16:
  return v17;
}

- (id)defaultAccessoryBackgroundColorForAccessorySystemType:(int64_t)a3 header:(BOOL)a4 sidebarStyle:(int64_t)a5 cellConfigurationState:(id)a6 traitCollection:(id)a7
{
  return 0;
}

- (BOOL)shouldUseRoundedGroupsForTableViewStyle:(int64_t)a3 backgroundInsets:(UIEdgeInsets)a4
{
  return 0;
}

- (BOOL)shouldAnimatePropertyInContentViewWithKey:(id)a3
{
  return 0;
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
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

@end