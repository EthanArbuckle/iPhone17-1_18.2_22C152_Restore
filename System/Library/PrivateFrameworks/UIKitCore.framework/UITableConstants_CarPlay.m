@interface UITableConstants_CarPlay
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
- (UIEdgeInsets)_defaultLayoutMargins;
- (UIEdgeInsets)defaultCellLayoutMarginsForTableStyle:(int64_t)a3 cellStyle:(int64_t)a4 textLabelFont:(id)a5 rawLayoutMargins:(UIEdgeInsets)a6;
- (UIEdgeInsets)defaultHeaderFooterLayoutMarginsForTableViewStyle:(int64_t)a3 isHeader:(BOOL)a4 isFirstSection:(BOOL)a5;
- (UIEdgeInsets)defaultLayoutMarginsForCell:(id)a3 inTableView:(id)a4;
- (UIEdgeInsets)defaultLayoutMarginsInsideSectionForSize:(CGSize)a3 tableStyle:(int64_t)a4;
- (UIEdgeInsets)defaultSectionContentInsetsForTableStyle:(int64_t)a3;
- (UIEdgeInsets)headerFooterOffsetFromContentInsetForTableView:(id)a3;
- (UIEdgeInsets)reorderControlHoverEffectInsets;
- (_UITableConstantsBackgroundProperties)defaultCellBackgroundPropertiesForTableViewStyle:(SEL)a3 state:(int64_t)a4 traitCollection:(id)a5;
- (_UITableConstantsBackgroundProperties)defaultHeaderFooterBackgroundPropertiesForTableViewStyle:(SEL)a3 cellConfigurationState:(int64_t)a4 traitCollection:(id)a5 floating:(id)a6;
- (_UITableConstantsBackgroundProperties)defaultSidebarCellBackgroundPropertiesForStyle:(SEL)a3 state:(int64_t)a4 traitCollection:(id)a5;
- (_UITableConstantsBackgroundProperties)defaultSidebarHeaderBackgroundPropertiesWithState:(SEL)a3 traitCollection:(id)a4;
- (double)_defaultPlainHeaderFooterHeightForTableViewStyle:(int64_t)a3;
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
- (double)defaultGroupedFooterHeightForTableView:(id)a3;
- (double)defaultGroupedHeaderHeightForTableView:(id)a3;
- (double)defaultImageToTextPaddingForSidebar:(BOOL)a3;
- (double)defaultImageViewSymbolImageAndAccessoryLayoutWidthForSidebar:(BOOL)a3 traitCollection:(id)a4;
- (double)defaultImageViewSymbolImageLayoutHeightForTraitCollection:(id)a3;
- (double)defaultIndentationWidthForSidebarStyle:(BOOL)a3;
- (double)defaultLabelMinimumScaleFactorForSidebar:(BOOL)a3 traitCollection:(id)a4;
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
- (id)_defaultAccessoryColorFocused:(BOOL)a3;
- (id)_imageWithName:(id)a3 accessoryBaseColor:(id)a4;
- (id)defaultAccessoryBackgroundColorForAccessorySystemType:(int64_t)a3 header:(BOOL)a4 sidebarStyle:(int64_t)a5 cellConfigurationState:(id)a6 traitCollection:(id)a7;
- (id)defaultAccessoryColorForCell:(id)a3 inTableView:(id)a4;
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
- (id)defaultFocusedAccessoryColorForCell:(id)a3 inTableView:(id)a4;
- (id)defaultFocusedCheckmarkImageForCell:(id)a3 inTableView:(id)a4;
- (id)defaultFocusedDetailTextColorForCell:(id)a3 inTableView:(id)a4;
- (id)defaultFocusedDisclosureImageForCell:(id)a3 inTableView:(id)a4;
- (id)defaultFocusedTextColorForCell:(id)a3 inTableView:(id)a4;
- (id)defaultFooterFontForTableViewStyle:(int64_t)a3;
- (id)defaultFooterTextColorForTableViewStyle:(int64_t)a3 focused:(BOOL)a4;
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
- (id)defaultSidebarImageTintColorForTraitCollection:(id)a3 state:(id)a4 isHeader:(BOOL)a5 style:(int64_t)a6;
- (id)defaultSidebarPlainMultiSelectSeparatorColor;
- (id)defaultSidebarTextColorForTraitCollection:(id)a3 state:(id)a4 isHeader:(BOOL)a5 isSecondaryText:(BOOL)a6 style:(int64_t)a7;
- (id)defaultTextColorForCellStyle:(int64_t)a3 traitCollection:(id)a4 tintColor:(id)a5 state:(id)a6;
- (id)defaultTextLabelFontForCellStyle:(int64_t)a3;
- (int64_t)defaultHeaderFooterPinningBehaviorForTableStyle:(int64_t)a3;
- (int64_t)defaultLabelNumberOfLinesForSidebar:(BOOL)a3 traitCollection:(id)a4;
- (int64_t)defaultSeparatorStyleForTableViewStyle:(int64_t)a3;
- (unint64_t)contentClipCornersForCell:(id)a3 inTableView:(id)a4;
@end

@implementation UITableConstants_CarPlay

+ (id)sharedConstants
{
  v3 = (void *)sharedConstants___sharedConstants_0;
  if (!sharedConstants___sharedConstants_0)
  {
    id v4 = objc_alloc_init((Class)a1);
    v5 = (void *)sharedConstants___sharedConstants_0;
    sharedConstants___sharedConstants_0 = (uint64_t)v4;

    v3 = (void *)sharedConstants___sharedConstants_0;
  }
  return v3;
}

- (BOOL)supportsUserInterfaceStyles
{
  return 0;
}

- (id)defaultBackgroundColorForTableViewStyle:(int64_t)a3
{
  if (a3) {
    +[UIColor systemGroupedBackgroundColor];
  }
  else {
  v3 = +[UIColor tableBackgroundColor];
  }
  return v3;
}

- (id)defaultBackgroundEffectsForTableViewStyle:(int64_t)a3
{
  return 0;
}

- (id)defaultSeparatorColorForTableViewStyle:(int64_t)a3
{
  return +[UIColor separatorColor];
}

- (id)defaultSidebarPlainMultiSelectSeparatorColor
{
  return +[UIColor colorWithWhite:1.0 alpha:0.2];
}

- (id)defaultSeparatorVisualEffectForTableViewStyle:(int64_t)a3
{
  return 0;
}

- (_UITableConstantsBackgroundProperties)defaultCellBackgroundPropertiesForTableViewStyle:(SEL)a3 state:(int64_t)a4 traitCollection:(id)a5
{
  id v15 = a5;
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
  -[UITableConstants_CarPlay defaultCellCornerRadiusForTableViewStyle:isSidebarStyle:isHeaderFooter:traitCollection:](self, "defaultCellCornerRadiusForTableViewStyle:isSidebarStyle:isHeaderFooter:traitCollection:", a4, 0, 0, v10, __copy_constructor_8_8_t0w8_s8_s16_s24_t32w41_s80_t88w48((uint64_t)retstr, (uint64_t)&_UITableConstantsBackgroundPropertiesDefault).n128_f64[0]);
  retstr->var12 = v11;
  if (([v15 isFocused] & 1) != 0
    || ([v15 isSelected] & 1) != 0
    || [v15 isHighlighted])
  {
    retstr->var0 = 1;
  }
  else
  {
    if (a4) {
      +[UIColor tableCellGroupedBackgroundColor];
    }
    else {
    v13 = +[UIColor tableCellPlainBackgroundColor];
    }
    id var1 = retstr->var1;
    retstr->id var1 = v13;
  }

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
      _os_log_fault_impl(&dword_1853B0000, v9, OS_LOG_TYPE_FAULT, "Calling a method on CarPlay that is not implemented for this platform. This is a UIKit bug.", buf, 2u);
    }
  }
  else
  {
    v7 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &defaultSidebarCellBackgroundPropertiesForStyle_state_traitCollection____s_category)+ 8);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)id v10 = 0;
      _os_log_impl(&dword_1853B0000, v7, OS_LOG_TYPE_ERROR, "Calling a method on CarPlay that is not implemented for this platform. This is a UIKit bug.", v10, 2u);
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
      _os_log_fault_impl(&dword_1853B0000, v8, OS_LOG_TYPE_FAULT, "Calling a method on CarPlay that is not implemented for this platform. This is a UIKit bug.", buf, 2u);
    }
  }
  else
  {
    v6 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &defaultSidebarHeaderBackgroundPropertiesWithState_traitCollection____s_category)+ 8);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl(&dword_1853B0000, v6, OS_LOG_TYPE_ERROR, "Calling a method on CarPlay that is not implemented for this platform. This is a UIKit bug.", v9, 2u);
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
  return 44.0;
}

- (double)defaultRowHeightForTableView:(id)a3
{
  [(UITableConstants_CarPlay *)self defaultRowHeightForTableView:a3 cellStyle:0];
  return result;
}

- (BOOL)defaultRowHeightDependsOnCellStyle
{
  return 0;
}

- (double)defaultSectionHeaderHeightForTableViewStyle:(int64_t)a3 screen:(id)a4
{
  return 28.0;
}

- (double)defaultSectionHeaderHeightForTableView:(id)a3
{
  return 28.0;
}

- (double)defaultPaddingAboveFirstSectionWithoutHeaderTableStyle:(int64_t)a3
{
  return 35.0;
}

- (double)defaultSectionFooterHeightForTableViewStyle:(int64_t)a3 screen:(id)a4
{
  id v6 = a4;
  if (!v6)
  {
    id v6 = +[UIScreen mainScreen];
    if (a3) {
      goto LABEL_3;
    }
LABEL_5:
    [(UITableConstants_CarPlay *)self _defaultPlainHeaderFooterHeightForTableViewStyle:0];
    double v7 = v8;
    goto LABEL_6;
  }
  if (!a3) {
    goto LABEL_5;
  }
LABEL_3:
  double v7 = 17.5;
LABEL_6:
  [v6 scale];
  double v10 = UIPixelBoundaryOffset(0, v7, v9);

  return v10;
}

- (double)defaultSectionFooterHeightForTableView:(id)a3
{
  uint64_t v5 = [a3 _tableStyle];
  id v6 = [a3 _scrollView];
  double v7 = [v6 window];
  double v8 = [v7 screen];
  [(UITableConstants_CarPlay *)self defaultSectionHeaderHeightForTableViewStyle:v5 screen:v8];
  double v10 = v9;

  return v10;
}

- (double)defaultImageToTextPaddingForSidebar:(BOOL)a3
{
  return 8.0;
}

- (double)defaultTextToSubtitlePaddingForCellStyle:(int64_t)a3
{
  return 3.0;
}

- (double)minimumContentViewHeightForFont:(id)a3 traitCollection:(id)a4
{
  id v5 = a3;
  id v6 = [a4 preferredContentSizeCategory];
  double v7 = _UIContentSizeCategoryMin(v6, @"UICTContentSizeCategoryXXXL");

  double v8 = +[UITraitCollection traitCollectionWithPreferredContentSizeCategory:v7];
  double v9 = [v5 _fontAdjustedForContentSizeCategoryCompatibleWithTraitCollection:v8];

  [v5 _bodyLeading];
  double v11 = v10;

  return v11 + v11;
}

- (UIEdgeInsets)defaultLayoutMarginsForCell:(id)a3 inTableView:(id)a4
{
  if (dyld_program_sdk_at_least())
  {
    double v7 = +[UITraitCollection traitCollectionWithPreferredContentSizeCategory:@"UICTContentSizeCategoryL"];
    double v8 = [off_1E52D39B8 preferredFontForTextStyle:@"UICTFontTextStyleBody" compatibleWithTraitCollection:v7];
  }
  else
  {
    double v8 = -[UITableConstants_CarPlay defaultTextLabelFontForCellStyle:](self, "defaultTextLabelFontForCellStyle:", [a3 _cellStyle]);
  }
  uint64_t v9 = [a4 _tableStyle];
  uint64_t v10 = [a3 _cellStyle];
  [a3 _rawLayoutMargins];
  -[UITableConstants_CarPlay defaultCellLayoutMarginsForTableStyle:cellStyle:textLabelFont:rawLayoutMargins:](self, "defaultCellLayoutMarginsForTableStyle:cellStyle:textLabelFont:rawLayoutMargins:", v9, v10, v8);
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;

  double v19 = v12;
  double v20 = v14;
  double v21 = v16;
  double v22 = v18;
  result.right = v22;
  result.bottom = v21;
  result.left = v20;
  result.top = v19;
  return result;
}

- (UIEdgeInsets)defaultCellLayoutMarginsForTableStyle:(int64_t)a3 cellStyle:(int64_t)a4 textLabelFont:(id)a5 rawLayoutMargins:(UIEdgeInsets)a6
{
  CGFloat right = a6.right;
  CGFloat left = a6.left;
  objc_msgSend(a5, "lineHeight", a3, a4, a6.top, a6.left, a6.bottom);
  double v9 = ceil(v8 * 0.5);
  double v10 = left;
  double v11 = v9;
  double v12 = right;
  result.CGFloat right = v12;
  result.bottom = v11;
  result.CGFloat left = v10;
  result.top = v9;
  return result;
}

- (UIEdgeInsets)defaultHeaderFooterLayoutMarginsForTableViewStyle:(int64_t)a3 isHeader:(BOOL)a4 isFirstSection:(BOOL)a5
{
  double v5 = 8.0;
  if (!a3) {
    double v5 = 4.0;
  }
  double v6 = 8.0;
  double v7 = 8.0;
  double v8 = v5;
  result.CGFloat right = v7;
  result.bottom = v8;
  result.CGFloat left = v6;
  result.top = v5;
  return result;
}

- (UIEdgeInsets)headerFooterOffsetFromContentInsetForTableView:(id)a3
{
  double v3 = 0.0;
  double v4 = -1.0;
  double v5 = 0.0;
  double v6 = -1.0;
  result.CGFloat right = v6;
  result.bottom = v5;
  result.CGFloat left = v4;
  result.top = v3;
  return result;
}

- (BOOL)imageViewOffsetByLayoutMarginsForCell:(id)a3 inTableView:(id)a4
{
  return 1;
}

- (double)defaultContentEditPaddingForCell:(id)a3 inTableView:(id)a4
{
  return 9.0;
}

- (double)defaultContentReorderPaddingForCell:(id)a3 inTableView:(id)a4
{
  return 12.0;
}

- (double)defaultContentAccessoryPadding
{
  return 8.0;
}

- (double)defaultImageViewSymbolImageAndAccessoryLayoutWidthForSidebar:(BOOL)a3 traitCollection:(id)a4
{
  return 0.0;
}

- (double)defaultImageViewSymbolImageLayoutHeightForTraitCollection:(id)a3
{
  return 0.0;
}

- (double)defaultDisclosureLayoutWidthForView:(id)a3
{
  return 0.0;
}

- (double)defaultCellCornerRadiusForTableViewStyle:(int64_t)a3 isSidebarStyle:(BOOL)a4 isHeaderFooter:(BOOL)a5 traitCollection:(id)a6
{
  return 0.0;
}

- (double)interspaceBetweenInnerAccessoryIdentifier:(id)a3 outerAccessoryIdentifier:(id)a4 forCell:(id)a5 trailingAccessoryGroup:(BOOL)a6
{
  BOOL v6 = a6;
  id v10 = a4;
  id v11 = a5;
  double v12 = 0.0;
  if (([a3 isEqualToString:0x1ED107580] & 1) == 0
    && ([v10 isEqualToString:0x1ED107580] & 1) == 0)
  {
    if (a3)
    {
      double v12 = 12.0;
      if (!v10)
      {
        [v11 _minimumCellAccessoryMargin];
        double v14 = v13;
        [v11 directionalLayoutMargins];
        double v12 = fmax(v14, v15);
      }
    }
    else if ((_UITableViewCellUsesLayoutMarginBasedContentPadding() & 1) == 0 && v6)
    {
      [(UITableConstants_CarPlay *)self defaultContentAccessoryPadding];
      double v12 = v16;
    }
  }

  return v12;
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
  return 2.0;
}

- (double)defaultPaddingBetweenHeaderAndRows
{
  return 0.0;
}

- (UIEdgeInsets)defaultLayoutMarginsInsideSectionForSize:(CGSize)a3 tableStyle:(int64_t)a4
{
  -[UITableConstants_CarPlay defaultTableLayoutMarginsForScreen:size:tableStyle:](self, "defaultTableLayoutMarginsForScreen:size:tableStyle:", 0, a4, a3.width, a3.height);
  result.CGFloat right = v7;
  result.bottom = v6;
  result.CGFloat left = v5;
  result.top = v4;
  return result;
}

- (UIEdgeInsets)defaultSectionContentInsetsForTableStyle:(int64_t)a3
{
  double v3 = 0.0;
  double v4 = 0.0;
  double v5 = 0.0;
  double v6 = 0.0;
  result.CGFloat right = v6;
  result.bottom = v5;
  result.CGFloat left = v4;
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
  double v3 = 12.0;
  double v4 = 0.0;
  double v5 = 12.0;
  result.CGFloat right = v5;
  result.bottom = v4;
  result.CGFloat left = v3;
  result.top = v2;
  return result;
}

- (double)defaultMarginWidthForTableView:(id)a3
{
  double v3 = [a3 _scrollView];
  [v3 directionalLayoutMargins];
  double v5 = fmax(v4, 12.0);

  return v5;
}

- (double)defaultTrailingCellMarginWidthForTableView:(id)a3
{
  return 12.0;
}

- (double)_defaultPlainHeaderFooterHeightForTableViewStyle:(int64_t)a3
{
  double v3 = [(UITableConstants_CarPlay *)self defaultHeaderFontForTableViewStyle:a3];
  [v3 _scaledValueForValue:28.0];
  double v5 = v4;

  return v5;
}

- (BOOL)shouldUppercaseHeaderFooterTextForTableStyle:(int64_t)a3 isHeader:(BOOL)a4
{
  BOOL v5 = a3 == 16 || (unint64_t)(a3 - 1) < 2;
  return a4 && v5;
}

- (double)defaultPlainFirstSectionHeaderHeightForTableView:(id)a3
{
  uint64_t v4 = [a3 _tableStyle];
  [(UITableConstants_CarPlay *)self _defaultPlainHeaderFooterHeightForTableViewStyle:v4];
  return result;
}

- (double)defaultGroupedHeaderHeightForTableView:(id)a3
{
  return 17.5;
}

- (double)defaultGroupedFooterHeightForTableView:(id)a3
{
  return 17.5;
}

- (double)defaultPlainHeaderLabelYPositionForTableView:(id)a3 headerBounds:(CGRect)a4 textRect:(CGRect)a5 isHeader:(BOOL)a6
{
  return round((a4.size.height - a5.size.height) * 0.5);
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

- (id)defaultTextColorForCellStyle:(int64_t)a3 traitCollection:(id)a4 tintColor:(id)a5 state:(id)a6
{
  return +[UIColor labelColor];
}

- ($4B60890CD43C21BDA0D821D733CDDD8F)contentPropertiesForSidebarElementWithTraitCollection:(SEL)a3 state:(id)a4 isHeader:(id)a5 cellStyle:(BOOL)a6 sidebarStyle:(int64_t)a7
{
  id v22 = a4;
  id v12 = a5;
  *(_OWORD *)&retstr->id var0 = 0u;
  *(_OWORD *)&retstr->id var2 = 0u;
  *(_OWORD *)&retstr->var4 = 0u;
  *(_OWORD *)&retstr->var6 = 0u;
  *(_OWORD *)&retstr->var8 = 0u;
  double v13 = -[UITableConstants_CarPlay defaultTextLabelFontForCellStyle:](self, "defaultTextLabelFontForCellStyle:", a7, __copy_constructor_8_8_s0_s8_s16_s24_s32_s40_t48w32((uint64_t)retstr, (uint64_t)&_UITableConstantsContentPropertiesDefault).n128_f64[0]);
  id var0 = retstr->var0;
  retstr->id var0 = v13;

  double v15 = [(UITableConstants_CarPlay *)self defaultDetailTextFontForCellStyle:a7];
  id var1 = retstr->var1;
  retstr->id var1 = v15;

  double v17 = +[UIColor labelColor];
  id var2 = retstr->var2;
  retstr->id var2 = v17;

  double v19 = +[UIColor secondaryLabelColor];
  id var3 = retstr->var3;
  retstr->id var3 = v19;

  if ([v12 isHighlighted])
  {
    *(int64x2_t *)&retstr->var7 = vdupq_n_s64(7uLL);
    retstr->var9 = 7;
  }

  return result;
}

- (id)defaultSidebarTextColorForTraitCollection:(id)a3 state:(id)a4 isHeader:(BOOL)a5 isSecondaryText:(BOOL)a6 style:(int64_t)a7
{
  return +[UIColor labelColor];
}

- (id)defaultSidebarImageTintColorForTraitCollection:(id)a3 state:(id)a4 isHeader:(BOOL)a5 style:(int64_t)a6
{
  return 0;
}

- (id)defaultFocusedTextColorForCell:(id)a3 inTableView:(id)a4
{
  return +[UIColor _carSystemFocusLabelColor];
}

- (id)defaultTextLabelFontForCellStyle:(int64_t)a3
{
  return (id)[off_1E52D39B8 preferredFontForTextStyle:@"UICTFontTextStyleCallout"];
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

- (id)defaultDetailTextColorForCellStyle:(int64_t)a3 traitCollection:(id)a4 state:(id)a5
{
  return +[UIColor _carSystemPrimaryColor];
}

- (id)defaultFocusedDetailTextColorForCell:(id)a3 inTableView:(id)a4
{
  return +[UIColor _carSystemFocusPrimaryColor];
}

- (id)defaultDetailTextFontForCellStyle:(int64_t)a3
{
  return (id)[off_1E52D39B8 preferredFontForTextStyle:@"UICTFontTextStyleCallout"];
}

- (double)defaultDetailTextLabelFontSizeForCellStyle:(int64_t)a3
{
  if (a3 == 1) {
    return 17.0;
  }
  if (a3 == 3) {
    return 12.0;
  }
  -[UITableConstants_CarPlay defaultTextLabelFontSizeForCellStyle:](self, "defaultTextLabelFontSizeForCellStyle:");
  return result;
}

- (id)defaultHeaderFontForTableViewStyle:(int64_t)a3
{
  double v3 = +[UIScreen _carScreen];
  uint64_t v4 = [v3 traitCollection];
  BOOL v5 = [off_1E52D39B8 preferredFontForTextStyle:@"UICTFontTextStyleEmphasizedTitle3" compatibleWithTraitCollection:v4];

  return v5;
}

- (id)defaultFooterFontForTableViewStyle:(int64_t)a3
{
  if (a3) {
    double v3 = UIFontTextStyleShortFootnote;
  }
  else {
    double v3 = UIFontTextStyleSubtitle2;
  }
  return (id)[off_1E52D39B8 preferredFontForTextStyle:*v3];
}

- (id)defaultHeaderTextColorForTableViewStyle:(int64_t)a3 focused:(BOOL)a4
{
  if (a3) {
    +[UIColor _groupTableHeaderFooterTextColor];
  }
  else {
  uint64_t v4 = +[UIColor _plainTableHeaderFooterTextColor];
  }
  return v4;
}

- (id)defaultFooterTextColorForTableViewStyle:(int64_t)a3 focused:(BOOL)a4
{
  if (a3) {
    +[UIColor _groupTableHeaderFooterTextColor];
  }
  else {
  uint64_t v4 = +[UIColor _plainTableHeaderFooterTextColor];
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
  if (a7) {
    +[UIColor tablePlainHeaderFooterFloatingBackgroundColor];
  }
  else {
  double result = +[UIColor tablePlainHeaderFooterBackgroundColor];
  }
  retstr->var13.trailing = 0.0;
  *(_OWORD *)&retstr->var12 = 0u;
  *(_OWORD *)&retstr->var13.leading = 0u;
  *(_OWORD *)&retstr->var8 = 0u;
  *(_OWORD *)&retstr->var10 = 0u;
  *(_OWORD *)&retstr->var4 = 0u;
  *(_OWORD *)&retstr->var6 = 0u;
  *(_OWORD *)&retstr->id var0 = 0u;
  *(_OWORD *)&retstr->id var2 = 0u;
  retstr->id var1 = result;
  return result;
}

- (id)defaultAccessoryColorForCell:(id)a3 inTableView:(id)a4
{
  return +[UIColor _carSystemSecondaryColor];
}

- (id)defaultFocusedAccessoryColorForCell:(id)a3 inTableView:(id)a4
{
  return +[UIColor _carSystemFocusSecondaryColor];
}

- (id)_defaultAccessoryColorFocused:(BOOL)a3
{
  if (a3) {
    +[UIColor _carSystemFocusSecondaryColor];
  }
  else {
  double v3 = +[UIColor _carSystemSecondaryColor];
  }
  return v3;
}

- (id)_imageWithName:(id)a3 accessoryBaseColor:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  double v7 = +[UIImageSymbolConfiguration configurationWithTextStyle:@"UICTFontTextStyleEmphasizedCallout" scale:1];
  double v8 = +[UIImage systemImageNamed:v6 withConfiguration:v7];

  if (v5)
  {
    uint64_t v9 = [v8 imageWithTintColor:v5 renderingMode:1];

    double v8 = (void *)v9;
  }

  return v8;
}

- (id)defaultDisclosureImageForCell:(id)a3 withAccessoryBaseColor:(id)a4
{
  return [(UITableConstants_CarPlay *)self _imageWithName:@"chevron.forward" accessoryBaseColor:a4];
}

- (id)defaultFocusedDisclosureImageForCell:(id)a3 inTableView:(id)a4
{
  id v5 = objc_msgSend(a4, "_accessoryBaseColor", a3);
  id v6 = [(UITableConstants_CarPlay *)self _imageWithName:@"chevron.forward" accessoryBaseColor:v5];

  return v6;
}

- (id)defaultCheckmarkImageForCell:(id)a3
{
  return [(UITableConstants_CarPlay *)self _imageWithName:@"checkmark" accessoryBaseColor:0];
}

- (id)defaultFocusedCheckmarkImageForCell:(id)a3 inTableView:(id)a4
{
  return [(UITableConstants_CarPlay *)self _imageWithName:@"checkmark" accessoryBaseColor:0];
}

- (id)defaultDetailAccessoryImage
{
  return +[UIImage systemImageNamed:@"info.circle"];
}

- (CGSize)defaultEditControlSizeForCell:(id)a3 inTableView:(id)a4
{
  uint64_t v4 = -[UITableConstants_CarPlay defaultDeleteImageForCell:](self, "defaultDeleteImageForCell:", a3, a4);
  [v4 size];
  double v6 = v5;
  double v8 = v7;

  double v9 = v6;
  double v10 = v8;
  result.height = v10;
  result.width = v9;
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
  result.size.width = v6;
  result.origin.y = v5;
  result.origin.x = v4;
  return result;
}

- (id)defaultDeleteImageForCell:(id)a3
{
  return [(UITableConstants_CarPlay *)self defaultDeleteImageWithTintColor:0 backgroundColor:0];
}

- (id)defaultDeleteImageWithTintColor:(id)a3 backgroundColor:(id)a4
{
  double v4 = +[UIImageSymbolConfiguration configurationPreferringMulticolor];
  double v5 = +[UIImage systemImageNamed:@"minus.circle.fill" withConfiguration:v4];

  return v5;
}

- (id)defaultInsertImageForCell:(id)a3
{
  return [(UITableConstants_CarPlay *)self defaultInsertImageWithTintColor:0 backgroundColor:0];
}

- (id)defaultInsertImageWithTintColor:(id)a3 backgroundColor:(id)a4
{
  double v4 = +[UIImageSymbolConfiguration configurationPreferringMulticolor];
  double v5 = +[UIImage systemImageNamed:@"plus.circle.fill" withConfiguration:v4];

  return v5;
}

- (id)defaultMultiSelectNotSelectedImageForCellStyle:(int64_t)a3 traitCollection:(id)a4 accessoryBaseColor:(id)a5
{
  id v7 = a5;
  double v8 = [(UITableConstants_CarPlay *)self defaultTextLabelFontForCellStyle:a3];
  double v9 = +[UIImageSymbolConfiguration configurationWithFont:v8 scale:3];
  double v10 = +[UIImage systemImageNamed:@"circle" withConfiguration:v9];
  if (v7)
  {
    id v11 = v7;
  }
  else
  {
    id v11 = +[UIColor colorWithRed:0.780392157 green:0.780392157 blue:0.8 alpha:1.0];
  }
  id v12 = v11;
  double v13 = [v10 imageWithTintColor:v11 renderingMode:1];

  return v13;
}

- (id)defaultMultiSelectSelectedImageForCellStyle:(int64_t)a3 traitCollection:(id)a4 checkmarkColor:(id)a5 backgroundColor:(id)a6
{
  id v8 = a5;
  double v9 = [(UITableConstants_CarPlay *)self defaultTextLabelFontForCellStyle:a3];
  double v10 = +[UIImageSymbolConfiguration configurationWithFont:v9 scale:3];
  id v11 = +[UIImage checkmarkImage];
  id v12 = [v11 imageWithConfiguration:v10];

  if (v8)
  {
    uint64_t v13 = [v12 imageWithTintColor:v8 renderingMode:1];

    id v12 = (void *)v13;
  }

  return v12;
}

- (double)defaultEditAndUpdateAnimationDuration
{
  return 0.3;
}

- (CGSize)defaultReorderControlSizeForCell:(id)a3 withAccessoryBaseColor:(id)a4
{
  double v5 = [a3 traitCollection];
  double v6 = [(UITableConstants_CarPlay *)self defaultReorderControlImageForTraitCollection:v5 withAccessoryBaseColor:0 isTracking:0];
  [v6 size];
  double v8 = v7;
  double v10 = v9;

  double v11 = v8 + 30.0;
  double v12 = v10;
  result.height = v12;
  result.width = v11;
  return result;
}

- (id)defaultReorderControlImageForTraitCollection:(id)a3 withAccessoryBaseColor:(id)a4 isTracking:(BOOL)a5
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    double v8 = _UIImageWithName(@"UITableGrabber.png");
    [v8 size];
    +[UIImage _tintedImageForSize:withTint:effectsImage:maskImage:style:](UIImage, "_tintedImageForSize:withTint:effectsImage:maskImage:style:", v7, 0, v8, 0);
    id v9 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    double v10 = (void *)defaultReorderControlImageForTraitCollection_withAccessoryBaseColor_isTracking____grabberImage;
    if (!defaultReorderControlImageForTraitCollection_withAccessoryBaseColor_isTracking____grabberImage)
    {
      double v11 = _UIImageWithName(@"UITableGrabber.png");
      [v11 size];
      double v13 = v12;
      double v15 = v14;
      double v16 = +[UIColor colorWithRed:0.780392157 green:0.780392157 blue:0.8 alpha:1.0];
      uint64_t v17 = +[UIImage _tintedImageForSize:withTint:effectsImage:maskImage:style:](UIImage, "_tintedImageForSize:withTint:effectsImage:maskImage:style:", v16, 0, v11, 0, v13, v15);
      double v18 = (void *)defaultReorderControlImageForTraitCollection_withAccessoryBaseColor_isTracking____grabberImage;
      defaultReorderControlImageForTraitCollection_withAccessoryBaseColor_isTracking____grabberImage = v17;

      double v10 = (void *)defaultReorderControlImageForTraitCollection_withAccessoryBaseColor_isTracking____grabberImage;
    }
    id v9 = v10;
  }

  return v9;
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

- (double)defaultAlphaForDraggingCell:(id)a3 inTableView:(id)a4
{
  return 1.0;
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

- (id)defaultImageSymbolConfigurationForTraitCollection:(id)a3
{
  return 0;
}

- (id)defaultImageTintColorForState:(id)a3 traitCollection:(id)a4
{
  return 0;
}

- (id)defaultAccessoryTintColorForAccessorySystemType:(int64_t)a3 header:(BOOL)a4 sidebarStyle:(int64_t)a5 cellConfigurationState:(id)a6 traitCollection:(id)a7 inheritedTintColor:(id)a8
{
  id v12 = a6;
  id v13 = a7;
  id v14 = a8;
  double v15 = 0;
  switch(a3)
  {
    case 0:
    case 1:
    case 2:
    case 3:
    case 4:
    case 5:
    case 6:
    case 9:
      break;
    case 7:
      uint64_t v18 = +[UIColor secondaryLabelColor];
      goto LABEL_8;
    case 8:
      uint64_t v18 = +[UIColor separatorColor];
LABEL_8:
      double v15 = (void *)v18;
      break;
    default:
      uint64_t v17 = [MEMORY[0x1E4F28B00] currentHandler];
      objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, 0, @"UITableConstants_CarPlay.m", 805, @"Invalid _UICellAccessorySystemType value: %ld", a3);

      double v15 = 0;
      break;
  }

  return v15;
}

- (id)defaultAccessoryBackgroundColorForAccessorySystemType:(int64_t)a3 header:(BOOL)a4 sidebarStyle:(int64_t)a5 cellConfigurationState:(id)a6 traitCollection:(id)a7
{
  return 0;
}

- (unint64_t)contentClipCornersForCell:(id)a3 inTableView:(id)a4
{
  return 15;
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
  result.CGFloat right = v5;
  result.bottom = v4;
  result.CGFloat left = v3;
  result.top = v2;
  return result;
}

@end