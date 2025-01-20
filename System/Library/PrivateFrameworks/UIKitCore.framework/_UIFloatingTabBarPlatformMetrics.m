@interface _UIFloatingTabBarPlatformMetrics
- (BOOL)isSidebarBorderInsideBounds;
- (BOOL)sidebarPrefersMacAppearance;
- (BOOL)supportsGroupClusters;
- (CGAffineTransform)editModeTransform;
- (CGSize)defaultImageSize;
- (CGSize)scaledImageSizeForTraitCollection:(id)a3;
- (UIButtonConfiguration)sidebarButtonConfiguration;
- (UIColor)selectionBackgroundColor;
- (UIEdgeInsets)backgroundInsets;
- (UIEdgeInsets)badgeInsets;
- (UIEdgeInsets)editModeItemMargins;
- (UIEdgeInsets)imageMargins;
- (UIEdgeInsets)titleMargins;
- (UIFont)badgeFont;
- (UIFont)contentFont;
- (UIFont)selectedContentFont;
- (UIImageSymbolConfiguration)selectedSymbolConfiguration;
- (UIImageSymbolConfiguration)symbolConfiguration;
- (UIOffset)badgeOffset;
- (UIVisualEffect)backgroundEffect;
- (UIVisualEffect)sidebarBackgroundEffect;
- (_UIFloatingTabBarPlatformMetrics)init;
- (_UIShadowProperties)selectionShadow;
- (double)contentAlphaDistanceThreshold;
- (double)expandedDropTargetInset;
- (double)groupItemPunchOutWidth;
- (double)groupItemSpacing;
- (double)imageAndTitleSpacing;
- (double)maximumBadgeWidth;
- (double)maximumContentWidth;
- (double)maximumExpandedWidth;
- (double)maximumWidth;
- (double)minimumBadgeWidth;
- (double)safeAreaOffset;
- (double)selectionDistanceThresholdForUnselectedItems;
- (double)selectionHighlightScale;
- (double)sidebarBorderWidth;
- (id)contentPaletteProvider;
- (id)editModeBackgroundShadowProvider;
- (void)setBackgroundEffect:(id)a3;
- (void)setBackgroundInsets:(UIEdgeInsets)a3;
- (void)setBadgeFont:(id)a3;
- (void)setBadgeInsets:(UIEdgeInsets)a3;
- (void)setBadgeOffset:(UIOffset)a3;
- (void)setContentAlphaDistanceThreshold:(double)a3;
- (void)setContentFont:(id)a3;
- (void)setContentPaletteProvider:(id)a3;
- (void)setDefaultImageSize:(CGSize)a3;
- (void)setEditModeBackgroundShadowProvider:(id)a3;
- (void)setEditModeItemMargins:(UIEdgeInsets)a3;
- (void)setEditModeTransform:(CGAffineTransform *)a3;
- (void)setExpandedDropTargetInset:(double)a3;
- (void)setGroupItemPunchOutWidth:(double)a3;
- (void)setGroupItemSpacing:(double)a3;
- (void)setImageAndTitleSpacing:(double)a3;
- (void)setImageMargins:(UIEdgeInsets)a3;
- (void)setMaximumBadgeWidth:(double)a3;
- (void)setMaximumContentWidth:(double)a3;
- (void)setMaximumExpandedWidth:(double)a3;
- (void)setMaximumWidth:(double)a3;
- (void)setMinimumBadgeWidth:(double)a3;
- (void)setSafeAreaOffset:(double)a3;
- (void)setSelectedContentFont:(id)a3;
- (void)setSelectedSymbolConfiguration:(id)a3;
- (void)setSelectionBackgroundColor:(id)a3;
- (void)setSelectionDistanceThresholdForUnselectedItems:(double)a3;
- (void)setSelectionHighlightScale:(double)a3;
- (void)setSelectionShadow:(id)a3;
- (void)setSidebarBackgroundEffect:(id)a3;
- (void)setSidebarBorderInsideBounds:(BOOL)a3;
- (void)setSidebarBorderWidth:(double)a3;
- (void)setSidebarPrefersMacAppearance:(BOOL)a3;
- (void)setSupportsGroupClusters:(BOOL)a3;
- (void)setSymbolConfiguration:(id)a3;
- (void)setTitleMargins:(UIEdgeInsets)a3;
@end

@implementation _UIFloatingTabBarPlatformMetrics

- (_UIFloatingTabBarPlatformMetrics)init
{
  v57[2] = *MEMORY[0x1E4F143B8];
  v50.receiver = self;
  v50.super_class = (Class)_UIFloatingTabBarPlatformMetrics;
  v2 = [(_UIFloatingTabBarPlatformMetrics *)&v50 init];
  if (v2)
  {
    v3 = +[UIColor colorWithRed:0.0 green:0.0 blue:0.25 alpha:0.06];
    v4 = +[UIColor colorWithRed:0.75 green:0.75 blue:1.0 alpha:0.06];
    v5 = +[UIBlurEffect effectWithStyle:8];
    id v56 = v3;
    v57[0] = v5;
    uint64_t v51 = MEMORY[0x1E4F143A8];
    uint64_t v52 = 3221225472;
    v53 = ___UIDynamicColor_block_invoke;
    v54 = &unk_1E52FF048;
    id v55 = v4;
    id v41 = v4;
    id v6 = v3;
    v7 = +[UIColor colorWithDynamicProvider:&v51];

    v8 = +[UIVisualEffect effectCompositingColor:v7];
    v57[1] = v8;
    v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v57 count:2];
    v10 = +[UIVisualEffect effectCombiningEffects:v9];
    [(_UIFloatingTabBarPlatformMetrics *)v2 setBackgroundEffect:v10];

    -[_UIFloatingTabBarPlatformMetrics setBackgroundInsets:](v2, "setBackgroundInsets:", 4.0, 4.0, 4.0, 4.0);
    [(_UIFloatingTabBarPlatformMetrics *)v2 setMaximumWidth:600.0];
    [(_UIFloatingTabBarPlatformMetrics *)v2 setMaximumExpandedWidth:800.0];
    v11 = +[UIColor systemBackgroundColor];
    v12 = +[UIColor systemFillColor];
    uint64_t v51 = MEMORY[0x1E4F143A8];
    uint64_t v52 = 3221225472;
    v53 = ___UIDynamicColor_block_invoke;
    v54 = &unk_1E52FF048;
    id v55 = v12;
    id v56 = v11;
    id v13 = v12;
    id v14 = v11;
    v15 = +[UIColor colorWithDynamicProvider:&v51];

    [(_UIFloatingTabBarPlatformMetrics *)v2 setSelectionBackgroundColor:v15];
    v16 = objc_opt_new();
    [v16 setOpacity:0.08];
    [v16 setRadius:16.0];
    objc_msgSend(v16, "setOffset:", 0.0, 2.0);
    v17 = +[UIColor blackColor];
    [v16 setColor:v17];

    [(_UIFloatingTabBarPlatformMetrics *)v2 setSelectionShadow:v16];
    [(_UIFloatingTabBarPlatformMetrics *)v2 setSelectionHighlightScale:0.95];
    [(_UIFloatingTabBarPlatformMetrics *)v2 setSelectionDistanceThresholdForUnselectedItems:44.0];
    double v18 = *(double *)off_1E52D6BF0;
    v19 = [off_1E52D39B8 _preferredFontForTextStyle:@"UICTFontTextStyleBody" weight:*(double *)off_1E52D6BF0];
    [(_UIFloatingTabBarPlatformMetrics *)v2 setContentFont:v19];

    v20 = [off_1E52D39B8 preferredFontForTextStyle:@"UICTFontTextStyleHeadline"];
    [(_UIFloatingTabBarPlatformMetrics *)v2 setSelectedContentFont:v20];

    v21 = [(_UIFloatingTabBarPlatformMetrics *)v2 contentFont];
    v22 = +[UIImageSymbolConfiguration configurationWithFont:v21 scale:2];
    [(_UIFloatingTabBarPlatformMetrics *)v2 setSymbolConfiguration:v22];

    v23 = +[UIImageSymbolConfiguration configurationWithTextStyle:@"UICTFontTextStyleHeadline" scale:2];
    [(_UIFloatingTabBarPlatformMetrics *)v2 setSelectedSymbolConfiguration:v23];

    -[_UIFloatingTabBarPlatformMetrics setTitleMargins:](v2, "setTitleMargins:", 6.0, 16.0, 6.0, 16.0);
    -[_UIFloatingTabBarPlatformMetrics setImageMargins:](v2, "setImageMargins:", 6.0, 14.0, 6.0, 14.0);
    [(_UIFloatingTabBarPlatformMetrics *)v2 setImageAndTitleSpacing:8.0];
    [(_UIFloatingTabBarPlatformMetrics *)v2 setSafeAreaOffset:31.0];
    [(_UIFloatingTabBarPlatformMetrics *)v2 setExpandedDropTargetInset:32.0];
    -[_UIFloatingTabBarPlatformMetrics setDefaultImageSize:](v2, "setDefaultImageSize:", 20.0, 20.0);
    [(_UIFloatingTabBarPlatformMetrics *)v2 setMaximumContentWidth:224.0];
    [(_UIFloatingTabBarPlatformMetrics *)v2 setContentAlphaDistanceThreshold:64.0];
    v24 = objc_alloc_init(_UIFloatingTabBarContentPalette);
    v25 = +[UIColor tintColor];
    [(_UIFloatingTabBarContentPalette *)v24 setSelectedColor:v25];

    v26 = +[UIColor labelColor];
    [(_UIFloatingTabBarContentPalette *)v24 setInactiveColor:v26];

    v27 = +[UIColor tertiaryLabelColor];
    [(_UIFloatingTabBarContentPalette *)v24 setHighlightedColor:v27];

    v28 = objc_alloc_init(_UIFloatingTabBarContentPalette);
    v29 = +[UIColor whiteColor];
    [(_UIFloatingTabBarContentPalette *)v28 setSelectedColor:v29];

    v30 = +[UIColor secondaryLabelColor];
    [(_UIFloatingTabBarContentPalette *)v28 setInactiveColor:v30];

    v31 = +[UIColor tertiaryLabelColor];
    [(_UIFloatingTabBarContentPalette *)v28 setHighlightedColor:v31];

    v47[0] = MEMORY[0x1E4F143A8];
    v47[1] = 3221225472;
    v47[2] = __40___UIFloatingTabBarPlatformMetrics_init__block_invoke;
    v47[3] = &unk_1E52FEFF8;
    v48 = v24;
    v49 = v28;
    v32 = v24;
    v33 = v28;
    [(_UIFloatingTabBarPlatformMetrics *)v2 setContentPaletteProvider:v47];
    -[_UIFloatingTabBarPlatformMetrics setBadgeInsets:](v2, "setBadgeInsets:", 2.0, 4.0, 2.0, 4.0);
    v34 = [off_1E52D39B8 _preferredFontForTextStyle:@"UICTFontTextStyleCaption1" weight:v18];
    [(_UIFloatingTabBarPlatformMetrics *)v2 setBadgeFont:v34];

    [(_UIFloatingTabBarPlatformMetrics *)v2 setMaximumBadgeWidth:64.0];
    -[_UIFloatingTabBarPlatformMetrics setBadgeOffset:](v2, "setBadgeOffset:", 3.0, -2.0);
    [(_UIFloatingTabBarPlatformMetrics *)v2 setSupportsGroupClusters:0];
    [(_UIFloatingTabBarPlatformMetrics *)v2 setGroupItemSpacing:4.0];
    [(_UIFloatingTabBarPlatformMetrics *)v2 setGroupItemPunchOutWidth:0.0];
    CGAffineTransformMakeScale(&v46, 1.05, 1.05);
    CGAffineTransform v45 = v46;
    [(_UIFloatingTabBarPlatformMetrics *)v2 setEditModeTransform:&v45];
    -[_UIFloatingTabBarPlatformMetrics setEditModeItemMargins:](v2, "setEditModeItemMargins:", 0.0, 3.0, 0.0, 3.0);
    v35 = objc_opt_new();
    [v35 setOpacity:0.4];
    [v35 setRadius:40.0];
    objc_msgSend(v35, "setOffset:", 0.0, 8.0);
    v36 = objc_opt_new();
    [v36 setOpacity:0.5];
    [v36 setRadius:40.0];
    objc_msgSend(v36, "setOffset:", 0.0, 8.0);
    v42[0] = MEMORY[0x1E4F143A8];
    v42[1] = 3221225472;
    v42[2] = __40___UIFloatingTabBarPlatformMetrics_init__block_invoke_2;
    v42[3] = &unk_1E52FF020;
    id v43 = v35;
    id v44 = v36;
    id v37 = v35;
    id v38 = v36;
    [(_UIFloatingTabBarPlatformMetrics *)v2 setEditModeBackgroundShadowProvider:v42];
    v39 = +[UIBlurEffect effectWithStyle:8];
    [(_UIFloatingTabBarPlatformMetrics *)v2 setSidebarBackgroundEffect:v39];

    [(_UIFloatingTabBarPlatformMetrics *)v2 setSidebarBorderWidth:1.0];
    [(_UIFloatingTabBarPlatformMetrics *)v2 setSidebarBorderInsideBounds:1];
  }
  return v2;
}

- (UIButtonConfiguration)sidebarButtonConfiguration
{
  v3 = +[UIButtonConfiguration plainButtonConfiguration];
  objc_msgSend(v3, "setContentInsets:", 12.0, 16.0, 12.0, 16.0);
  v4 = [(_UIFloatingTabBarPlatformMetrics *)self symbolConfiguration];
  [v3 setPreferredSymbolConfigurationForImage:v4];

  v5 = +[UIImage systemImageNamed:@"sidebar.leading"];
  [v3 setImage:v5];

  return (UIButtonConfiguration *)v3;
}

- (CGSize)scaledImageSizeForTraitCollection:(id)a3
{
  id v4 = a3;
  v5 = [(_UIFloatingTabBarPlatformMetrics *)self contentFont];
  id v6 = [v5 _fontAdjustedForContentSizeCategoryCompatibleWithTraitCollection:v4];

  if (v6)
  {
    id v7 = v6;
  }
  else
  {
    id v7 = [(_UIFloatingTabBarPlatformMetrics *)self contentFont];
  }
  v8 = v7;

  [(_UIFloatingTabBarPlatformMetrics *)self defaultImageSize];
  double v10 = v9;
  objc_msgSend(v8, "_scaledValueForValue:useLanguageAwareScaling:", 0);
  double v12 = v11;
  [v8 _scaledValueForValue:0 useLanguageAwareScaling:v10];
  double v14 = v13;

  double v15 = v12;
  double v16 = v14;
  result.height = v16;
  result.width = v15;
  return result;
}

- (UIVisualEffect)backgroundEffect
{
  return self->_backgroundEffect;
}

- (void)setBackgroundEffect:(id)a3
{
}

- (UIEdgeInsets)backgroundInsets
{
  double top = self->_backgroundInsets.top;
  double left = self->_backgroundInsets.left;
  double bottom = self->_backgroundInsets.bottom;
  double right = self->_backgroundInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)setBackgroundInsets:(UIEdgeInsets)a3
{
  self->_backgroundInsets = a3;
}

- (double)maximumWidth
{
  return self->_maximumWidth;
}

- (void)setMaximumWidth:(double)a3
{
  self->_maximumWidth = a3;
}

- (double)maximumExpandedWidth
{
  return self->_maximumExpandedWidth;
}

- (void)setMaximumExpandedWidth:(double)a3
{
  self->_maximumExpandedWidth = a3;
}

- (UIColor)selectionBackgroundColor
{
  return self->_selectionBackgroundColor;
}

- (void)setSelectionBackgroundColor:(id)a3
{
}

- (_UIShadowProperties)selectionShadow
{
  return self->_selectionShadow;
}

- (void)setSelectionShadow:(id)a3
{
}

- (double)selectionHighlightScale
{
  return self->_selectionHighlightScale;
}

- (void)setSelectionHighlightScale:(double)a3
{
  self->_selectionHighlightScale = a3;
}

- (double)selectionDistanceThresholdForUnselectedItems
{
  return self->_selectionDistanceThresholdForUnselectedItems;
}

- (void)setSelectionDistanceThresholdForUnselectedItems:(double)a3
{
  self->_selectionDistanceThresholdForUnselectedItems = a3;
}

- (UIFont)contentFont
{
  return self->_contentFont;
}

- (void)setContentFont:(id)a3
{
}

- (UIFont)selectedContentFont
{
  return self->_selectedContentFont;
}

- (void)setSelectedContentFont:(id)a3
{
}

- (UIImageSymbolConfiguration)symbolConfiguration
{
  return self->_symbolConfiguration;
}

- (void)setSymbolConfiguration:(id)a3
{
}

- (UIImageSymbolConfiguration)selectedSymbolConfiguration
{
  return self->_selectedSymbolConfiguration;
}

- (void)setSelectedSymbolConfiguration:(id)a3
{
}

- (CGSize)defaultImageSize
{
  double width = self->_defaultImageSize.width;
  double height = self->_defaultImageSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setDefaultImageSize:(CGSize)a3
{
  self->_defaultImageSize = a3;
}

- (double)maximumContentWidth
{
  return self->_maximumContentWidth;
}

- (void)setMaximumContentWidth:(double)a3
{
  self->_maximumContentWidth = a3;
}

- (UIEdgeInsets)titleMargins
{
  double top = self->_titleMargins.top;
  double left = self->_titleMargins.left;
  double bottom = self->_titleMargins.bottom;
  double right = self->_titleMargins.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)setTitleMargins:(UIEdgeInsets)a3
{
  self->_titleMargins = a3;
}

- (UIEdgeInsets)imageMargins
{
  double top = self->_imageMargins.top;
  double left = self->_imageMargins.left;
  double bottom = self->_imageMargins.bottom;
  double right = self->_imageMargins.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)setImageMargins:(UIEdgeInsets)a3
{
  self->_imageMargins = a3;
}

- (double)imageAndTitleSpacing
{
  return self->_imageAndTitleSpacing;
}

- (void)setImageAndTitleSpacing:(double)a3
{
  self->_imageAndTitleSpacing = a3;
}

- (double)safeAreaOffset
{
  return self->_safeAreaOffset;
}

- (void)setSafeAreaOffset:(double)a3
{
  self->_safeAreaOffset = a3;
}

- (double)contentAlphaDistanceThreshold
{
  return self->_contentAlphaDistanceThreshold;
}

- (void)setContentAlphaDistanceThreshold:(double)a3
{
  self->_contentAlphaDistanceThreshold = a3;
}

- (id)contentPaletteProvider
{
  return self->_contentPaletteProvider;
}

- (void)setContentPaletteProvider:(id)a3
{
}

- (UIEdgeInsets)badgeInsets
{
  double top = self->_badgeInsets.top;
  double left = self->_badgeInsets.left;
  double bottom = self->_badgeInsets.bottom;
  double right = self->_badgeInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)setBadgeInsets:(UIEdgeInsets)a3
{
  self->_badgeInsets = a3;
}

- (UIFont)badgeFont
{
  return self->_badgeFont;
}

- (void)setBadgeFont:(id)a3
{
}

- (double)minimumBadgeWidth
{
  return self->_minimumBadgeWidth;
}

- (void)setMinimumBadgeWidth:(double)a3
{
  self->_minimumBadgeWidth = a3;
}

- (double)maximumBadgeWidth
{
  return self->_maximumBadgeWidth;
}

- (void)setMaximumBadgeWidth:(double)a3
{
  self->_maximumBadgeWidth = a3;
}

- (UIOffset)badgeOffset
{
  double horizontal = self->_badgeOffset.horizontal;
  double vertical = self->_badgeOffset.vertical;
  result.double vertical = vertical;
  result.double horizontal = horizontal;
  return result;
}

- (void)setBadgeOffset:(UIOffset)a3
{
  self->_badgeOffset = a3;
}

- (BOOL)supportsGroupClusters
{
  return self->_supportsGroupClusters;
}

- (void)setSupportsGroupClusters:(BOOL)a3
{
  self->_supportsGroupClusters = a3;
}

- (double)groupItemSpacing
{
  return self->_groupItemSpacing;
}

- (void)setGroupItemSpacing:(double)a3
{
  self->_groupItemSpacing = a3;
}

- (double)groupItemPunchOutWidth
{
  return self->_groupItemPunchOutWidth;
}

- (void)setGroupItemPunchOutWidth:(double)a3
{
  self->_groupItemPunchOutWidth = a3;
}

- (UIVisualEffect)sidebarBackgroundEffect
{
  return self->_sidebarBackgroundEffect;
}

- (void)setSidebarBackgroundEffect:(id)a3
{
}

- (double)sidebarBorderWidth
{
  return self->_sidebarBorderWidth;
}

- (void)setSidebarBorderWidth:(double)a3
{
  self->_sidebarBorderWidth = a3;
}

- (BOOL)isSidebarBorderInsideBounds
{
  return self->_sidebarBorderInsideBounds;
}

- (void)setSidebarBorderInsideBounds:(BOOL)a3
{
  self->_sidebarBorderInsideBounds = a3;
}

- (BOOL)sidebarPrefersMacAppearance
{
  return self->_sidebarPrefersMacAppearance;
}

- (void)setSidebarPrefersMacAppearance:(BOOL)a3
{
  self->_sidebarPrefersMacAppearance = a3;
}

- (UIEdgeInsets)editModeItemMargins
{
  double top = self->_editModeItemMargins.top;
  double left = self->_editModeItemMargins.left;
  double bottom = self->_editModeItemMargins.bottom;
  double right = self->_editModeItemMargins.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)setEditModeItemMargins:(UIEdgeInsets)a3
{
  self->_editModeItemMargins = a3;
}

- (CGAffineTransform)editModeTransform
{
  long long v3 = *(_OWORD *)&self[8].ty;
  *(_OWORD *)&retstr->a = *(_OWORD *)&self[8].d;
  *(_OWORD *)&retstr->c = v3;
  *(_OWORD *)&retstr->tx = *(_OWORD *)&self[9].b;
  return self;
}

- (void)setEditModeTransform:(CGAffineTransform *)a3
{
  long long v3 = *(_OWORD *)&a3->a;
  long long v4 = *(_OWORD *)&a3->tx;
  *(_OWORD *)&self->_editModeTransform.c = *(_OWORD *)&a3->c;
  *(_OWORD *)&self->_editModeTransform.tx = v4;
  *(_OWORD *)&self->_editModeTransform.a = v3;
}

- (double)expandedDropTargetInset
{
  return self->_expandedDropTargetInset;
}

- (void)setExpandedDropTargetInset:(double)a3
{
  self->_expandedDropTargetInset = a3;
}

- (id)editModeBackgroundShadowProvider
{
  return self->_editModeBackgroundShadowProvider;
}

- (void)setEditModeBackgroundShadowProvider:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_editModeBackgroundShadowProvider, 0);
  objc_storeStrong((id *)&self->_sidebarBackgroundEffect, 0);
  objc_storeStrong((id *)&self->_badgeFont, 0);
  objc_storeStrong(&self->_contentPaletteProvider, 0);
  objc_storeStrong((id *)&self->_selectedSymbolConfiguration, 0);
  objc_storeStrong((id *)&self->_symbolConfiguration, 0);
  objc_storeStrong((id *)&self->_selectedContentFont, 0);
  objc_storeStrong((id *)&self->_contentFont, 0);
  objc_storeStrong((id *)&self->_selectionShadow, 0);
  objc_storeStrong((id *)&self->_selectionBackgroundColor, 0);
  objc_storeStrong((id *)&self->_backgroundEffect, 0);
}

@end