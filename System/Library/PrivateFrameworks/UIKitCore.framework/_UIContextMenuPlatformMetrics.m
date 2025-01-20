@interface _UIContextMenuPlatformMetrics
- (BOOL)alignMenuHeaderAndItemContents;
- (BOOL)allowsItemHighlighting;
- (BOOL)applySubmenuScaling;
- (BOOL)containerViewsHitTestAsOpaque;
- (BOOL)contentInsetsApplyToHeaders;
- (BOOL)enableFloatingFocusStyle;
- (BOOL)enableShadowsForStandardSizeMenus;
- (BOOL)forceUnpinnedHeader;
- (BOOL)leadingIndentationContributesToWidth;
- (BOOL)menuTitleAlwaysShowsSeparator;
- (BOOL)previewIsConstrainedToSourceWindowBounds;
- (BOOL)shouldDismissMenuOnSceneDeactivation;
- (BOOL)supportsLargePaletteMenus;
- (BOOL)supportsPassthroughInteraction;
- (BOOL)wantsControlAlignmentWithHorizontalEdgeAdjustment;
- (CAPoint3D)baseMenuOffset;
- (CAPoint3D)leadingCascadedSubmenuOffset;
- (CAPoint3D)stackedSubmenuOffset;
- (CAPoint3D)trailingCascadedSubmenuOffset;
- (CGSize)paletteMinimumItemSize;
- (CGSize)previewPlatterMaximumSize;
- (NSDictionary)accessorySeparatedOptions;
- (NSDictionary)submenuSeparatedOptions;
- (NSDirectionalEdgeInsets)headerPadding;
- (NSDirectionalEdgeInsets)menuItemInternalPadding;
- (NSDirectionalEdgeInsets)menuTitlePadding;
- (NSDirectionalEdgeInsets)sectionInsets;
- (NSDirectionalEdgeInsets)sectionSeparatorInsets;
- (UIColor)headerPrimaryColor;
- (UIColor)itemSeparatorColor;
- (UIColor)itemSubtitleColor;
- (UIColor)menuBackgroundColor;
- (UIColor)sectionSeparatorColor;
- (UIColor)trailingAccessoryColor;
- (UIEdgeInsets)minimumContainerInsets;
- (UIFont)headerFont;
- (UIFont)iconEmphasizedSymbolFont;
- (UIFont)iconSymbolFont;
- (UIFont)menuTitleFont;
- (UIFont)subtitleFont;
- (UIFont)titleEmphasizedFont;
- (UIFont)titleFont;
- (UIImageSymbolConfiguration)decorationViewSymbolConfiguration;
- (UIShape)mediumItemContentShape;
- (UIShape)smallItemContentShape;
- (UIVisualEffect)itemSeparatorBackgroundEffect;
- (UIVisualEffect)menuBackgroundEffect;
- (_UIClickPresentationFeedbackGeneratorConfiguration)presentationFeedbackConfiguration;
- (_UIContextMenuGradientMaskingConfiguration)gradientMaskingConfiguration;
- (_UIContextMenuPlatformMetrics)init;
- (_UIShadowProperties)previewShadowSettings;
- (double)defaultMenuWidth;
- (double)dynamicImageBoxWidth;
- (double)itemBaselineToBaseline;
- (double)itemLastBaselineToBottom;
- (double)itemLastBaselineToBottomWithSubtitle;
- (double)itemPrimaryAlpha;
- (double)itemSeparatorHeight;
- (double)itemTopToFirstBaseline;
- (double)itemTopToFirstBaselineWithSubtitle;
- (double)largePaletteWidthExtension;
- (double)leadingDecorationViewOffset;
- (double)leadingIndentationWidth;
- (double)maxLiftScale;
- (double)maxLiftScaleUpPoints;
- (double)menuCornerRadius;
- (double)menuGutterWidth;
- (double)menuMaximumHeight;
- (double)menuMinimumScale;
- (double)minIntraItemSpacing;
- (double)previewActionsStyleDragTearOffThreshold;
- (double)previewActionsStyleDragZTearOffThreshold;
- (double)previewPlatterCornerRadius;
- (double)previewRotationMaxDegrees;
- (double)previewRubberbandingCoefficient;
- (double)previewRubberbandingZCoefficient;
- (double)sectionSeparatorHeight;
- (double)smallItemLastBaselineToBottom;
- (double)smallItemTopToFirstBaseline;
- (double)trailingDecorationViewOffset;
- (id)animateAlongsideTransition;
- (id)containerViewProvider;
- (id)contentSpacingForContainer;
- (id)controlAttachmentYOffsetProvider;
- (id)convertPointBetweenViews;
- (id)headerPrimaryCompositingFilterProvider;
- (id)itemBackgroundColorProvider;
- (id)itemColoredSymbolImageUserInterfaceStyleOverrideProvider;
- (id)itemPrimaryColorProvider;
- (id)itemPrimaryCompositingFilterProvider;
- (id)itemPrimaryDestructiveColorProvider;
- (id)itemSubtitleCompositingFilterProvider;
- (id)menuHeaderBackgroundProvider;
- (id)menuHighlightBackgroundDescriptorProvider;
- (id)menuTitleBackgroundProvider;
- (id)overrideElementSize;
- (id)postDismissalHandler;
- (id)preDismissalHandler;
- (id)prefersWrapToSidesHandler;
- (id)shouldApplyClippingHandler;
- (id)shouldApplyShadowHandler;
- (int64_t)headerRenderingMode;
- (int64_t)headerTextAlignment;
- (int64_t)itemSubtitleRenderingMode;
- (int64_t)menuTitleTextAlignment;
- (void)setAccessorySeparatedOptions:(id)a3;
- (void)setAlignMenuHeaderAndItemContents:(BOOL)a3;
- (void)setAllowsItemHighlighting:(BOOL)a3;
- (void)setAnimateAlongsideTransition:(id)a3;
- (void)setApplySubmenuScaling:(BOOL)a3;
- (void)setBaseMenuOffset:(CAPoint3D)a3;
- (void)setContainerViewProvider:(id)a3;
- (void)setContainerViewsHitTestAsOpaque:(BOOL)a3;
- (void)setContentInsetsApplyToHeaders:(BOOL)a3;
- (void)setContentSpacingForContainer:(id)a3;
- (void)setControlAttachmentYOffsetProvider:(id)a3;
- (void)setConvertPointBetweenViews:(id)a3;
- (void)setDecorationViewSymbolConfiguration:(id)a3;
- (void)setDefaultMenuWidth:(double)a3;
- (void)setDynamicImageBoxWidth:(double)a3;
- (void)setEnableFloatingFocusStyle:(BOOL)a3;
- (void)setEnableShadowsForStandardSizeMenus:(BOOL)a3;
- (void)setForceUnpinnedHeader:(BOOL)a3;
- (void)setGradientMaskingConfiguration:(id)a3;
- (void)setHeaderFont:(id)a3;
- (void)setHeaderPadding:(NSDirectionalEdgeInsets)a3;
- (void)setHeaderPrimaryColor:(id)a3;
- (void)setHeaderPrimaryCompositingFilterProvider:(id)a3;
- (void)setHeaderRenderingMode:(int64_t)a3;
- (void)setHeaderTextAlignment:(int64_t)a3;
- (void)setIconEmphasizedSymbolFont:(id)a3;
- (void)setIconSymbolFont:(id)a3;
- (void)setItemBackgroundColorProvider:(id)a3;
- (void)setItemBaselineToBaseline:(double)a3;
- (void)setItemColoredSymbolImageUserInterfaceStyleOverrideProvider:(id)a3;
- (void)setItemLastBaselineToBottom:(double)a3;
- (void)setItemLastBaselineToBottomWithSubtitle:(double)a3;
- (void)setItemPrimaryAlpha:(double)a3;
- (void)setItemPrimaryColorProvider:(id)a3;
- (void)setItemPrimaryCompositingFilterProvider:(id)a3;
- (void)setItemPrimaryDestructiveColorProvider:(id)a3;
- (void)setItemSeparatorBackgroundEffect:(id)a3;
- (void)setItemSeparatorColor:(id)a3;
- (void)setItemSeparatorHeight:(double)a3;
- (void)setItemSubtitleColor:(id)a3;
- (void)setItemSubtitleCompositingFilterProvider:(id)a3;
- (void)setItemSubtitleRenderingMode:(int64_t)a3;
- (void)setItemTopToFirstBaseline:(double)a3;
- (void)setItemTopToFirstBaselineWithSubtitle:(double)a3;
- (void)setLargePaletteWidthExtension:(double)a3;
- (void)setLeadingCascadedSubmenuOffset:(CAPoint3D)a3;
- (void)setLeadingDecorationViewOffset:(double)a3;
- (void)setLeadingIndentationContributesToWidth:(BOOL)a3;
- (void)setLeadingIndentationWidth:(double)a3;
- (void)setMaxLiftScale:(double)a3;
- (void)setMaxLiftScaleUpPoints:(double)a3;
- (void)setMediumItemContentShape:(id)a3;
- (void)setMenuBackgroundColor:(id)a3;
- (void)setMenuBackgroundEffect:(id)a3;
- (void)setMenuCornerRadius:(double)a3;
- (void)setMenuGutterWidth:(double)a3;
- (void)setMenuHeaderBackgroundProvider:(id)a3;
- (void)setMenuHighlightBackgroundDescriptorProvider:(id)a3;
- (void)setMenuItemInternalPadding:(NSDirectionalEdgeInsets)a3;
- (void)setMenuMaximumHeight:(double)a3;
- (void)setMenuMinimumScale:(double)a3;
- (void)setMenuTitleAlwaysShowsSeparator:(BOOL)a3;
- (void)setMenuTitleBackgroundProvider:(id)a3;
- (void)setMenuTitleFont:(id)a3;
- (void)setMenuTitlePadding:(NSDirectionalEdgeInsets)a3;
- (void)setMenuTitleTextAlignment:(int64_t)a3;
- (void)setMinIntraItemSpacing:(double)a3;
- (void)setMinimumContainerInsets:(UIEdgeInsets)a3;
- (void)setOverrideElementSize:(id)a3;
- (void)setPaletteMinimumItemSize:(CGSize)a3;
- (void)setPostDismissalHandler:(id)a3;
- (void)setPreDismissalHandler:(id)a3;
- (void)setPrefersWrapToSidesHandler:(id)a3;
- (void)setPresentationFeedbackConfiguration:(id)a3;
- (void)setPreviewActionsStyleDragTearOffThreshold:(double)a3;
- (void)setPreviewActionsStyleDragZTearOffThreshold:(double)a3;
- (void)setPreviewIsConstrainedToSourceWindowBounds:(BOOL)a3;
- (void)setPreviewPlatterCornerRadius:(double)a3;
- (void)setPreviewPlatterMaximumSize:(CGSize)a3;
- (void)setPreviewRotationMaxDegrees:(double)a3;
- (void)setPreviewRubberbandingCoefficient:(double)a3;
- (void)setPreviewRubberbandingZCoefficient:(double)a3;
- (void)setPreviewShadowSettings:(id)a3;
- (void)setSectionInsets:(NSDirectionalEdgeInsets)a3;
- (void)setSectionSeparatorColor:(id)a3;
- (void)setSectionSeparatorHeight:(double)a3;
- (void)setSectionSeparatorInsets:(NSDirectionalEdgeInsets)a3;
- (void)setShouldApplyClippingHandler:(id)a3;
- (void)setShouldApplyShadowHandler:(id)a3;
- (void)setShouldDismissMenuOnSceneDeactivation:(BOOL)a3;
- (void)setSmallItemContentShape:(id)a3;
- (void)setSmallItemLastBaselineToBottom:(double)a3;
- (void)setSmallItemTopToFirstBaseline:(double)a3;
- (void)setStackedSubmenuOffset:(CAPoint3D)a3;
- (void)setSubmenuSeparatedOptions:(id)a3;
- (void)setSubtitleFont:(id)a3;
- (void)setSupportsLargePaletteMenus:(BOOL)a3;
- (void)setSupportsPassthroughInteraction:(BOOL)a3;
- (void)setTitleEmphasizedFont:(id)a3;
- (void)setTitleFont:(id)a3;
- (void)setTrailingAccessoryColor:(id)a3;
- (void)setTrailingCascadedSubmenuOffset:(CAPoint3D)a3;
- (void)setTrailingDecorationViewOffset:(double)a3;
- (void)setWantsControlAlignmentWithHorizontalEdgeAdjustment:(BOOL)a3;
@end

@implementation _UIContextMenuPlatformMetrics

- (_UIClickPresentationFeedbackGeneratorConfiguration)presentationFeedbackConfiguration
{
  return self->_presentationFeedbackConfiguration;
}

- (_UIContextMenuPlatformMetrics)init
{
  v28.receiver = self;
  v28.super_class = (Class)_UIContextMenuPlatformMetrics;
  v2 = [(_UIContextMenuPlatformMetrics *)&v28 init];
  v3 = v2;
  if (v2)
  {
    [(_UIContextMenuPlatformMetrics *)v2 setMenuHighlightBackgroundDescriptorProvider:&__block_literal_global_684];
    v4 = +[UIBlurEffect effectWithStyle:8];
    [(_UIContextMenuPlatformMetrics *)v3 setMenuBackgroundEffect:v4];

    [(_UIContextMenuPlatformMetrics *)v3 setMenuCornerRadius:13.0];
    [(_UIContextMenuPlatformMetrics *)v3 setApplySubmenuScaling:1];
    -[_UIContextMenuPlatformMetrics setTrailingCascadedSubmenuOffset:](v3, "setTrailingCascadedSubmenuOffset:", -11.0, 1.0, 0.0);
    -[_UIContextMenuPlatformMetrics setLeadingCascadedSubmenuOffset:](v3, "setLeadingCascadedSubmenuOffset:", -5.0, 1.0, 0.0);
    [(_UIContextMenuPlatformMetrics *)v3 setDefaultMenuWidth:250.0];
    [(_UIContextMenuPlatformMetrics *)v3 setLeadingIndentationWidth:16.0];
    v5 = +[UIBlurEffect effectWithStyle:8];
    v6 = +[UIVibrancyEffect effectForBlurEffect:v5 style:7];
    [(_UIContextMenuPlatformMetrics *)v3 setItemSeparatorBackgroundEffect:v6];

    v7 = +[UIColor whiteColor];
    [(_UIContextMenuPlatformMetrics *)v3 setItemSeparatorColor:v7];

    [(_UIContextMenuPlatformMetrics *)v3 setItemSubtitleRenderingMode:1];
    [(_UIContextMenuPlatformMetrics *)v3 setItemPrimaryCompositingFilterProvider:0];
    [(_UIContextMenuPlatformMetrics *)v3 setItemSubtitleCompositingFilterProvider:&__block_literal_global_37_7];
    v8 = +[UIColor colorWithDynamicProvider:&__block_literal_global_40_4];
    [(_UIContextMenuPlatformMetrics *)v3 setItemSubtitleColor:v8];

    v9 = +[UIScreen mainScreen];
    [v9 scale];
    [(_UIContextMenuPlatformMetrics *)v3 setItemSeparatorHeight:1.0 / v10];

    [(_UIContextMenuPlatformMetrics *)v3 setSectionSeparatorHeight:8.0];
    v11 = +[UIColor colorWithDynamicProvider:&__block_literal_global_43_6];
    [(_UIContextMenuPlatformMetrics *)v3 setSectionSeparatorColor:v11];

    [(_UIContextMenuPlatformMetrics *)v3 setConvertPointBetweenViews:&__block_literal_global_46_6];
    [(_UIContextMenuPlatformMetrics *)v3 setItemTopToFirstBaseline:28.0];
    [(_UIContextMenuPlatformMetrics *)v3 setSmallItemTopToFirstBaseline:32.0];
    [(_UIContextMenuPlatformMetrics *)v3 setItemLastBaselineToBottom:15.6666667];
    [(_UIContextMenuPlatformMetrics *)v3 setSmallItemLastBaselineToBottom:19.6666667];
    [(_UIContextMenuPlatformMetrics *)v3 setItemBaselineToBaseline:20.0];
    [(_UIContextMenuPlatformMetrics *)v3 setItemTopToFirstBaselineWithSubtitle:28.0];
    [(_UIContextMenuPlatformMetrics *)v3 setItemLastBaselineToBottomWithSubtitle:15.6666667];
    [(_UIContextMenuPlatformMetrics *)v3 setDynamicImageBoxWidth:24.0];
    [(_UIContextMenuPlatformMetrics *)v3 setMinIntraItemSpacing:4.0];
    -[_UIContextMenuPlatformMetrics setMenuItemInternalPadding:](v3, "setMenuItemInternalPadding:", 0.0, 16.0, 0.0, 16.0);
    v12 = [off_1E52D39B8 preferredFontForTextStyle:@"UICTFontTextStyleBody"];
    [(_UIContextMenuPlatformMetrics *)v3 setTitleFont:v12];

    v13 = [off_1E52D39B8 preferredFontForTextStyle:@"UICTFontTextStyleEmphasizedBody"];
    [(_UIContextMenuPlatformMetrics *)v3 setTitleEmphasizedFont:v13];

    v14 = [off_1E52D39B8 preferredFontForTextStyle:@"UICTFontTextStyleSubhead"];
    [(_UIContextMenuPlatformMetrics *)v3 setSubtitleFont:v14];

    v15 = [off_1E52D39B8 preferredFontForTextStyle:@"UICTFontTextStyleBody"];
    [(_UIContextMenuPlatformMetrics *)v3 setIconSymbolFont:v15];

    v16 = [off_1E52D39B8 preferredFontForTextStyle:@"UICTFontTextStyleEmphasizedBody"];
    [(_UIContextMenuPlatformMetrics *)v3 setIconEmphasizedSymbolFont:v16];

    [(_UIContextMenuPlatformMetrics *)v3 setItemBackgroundColorProvider:0];
    [(_UIContextMenuPlatformMetrics *)v3 setItemPrimaryColorProvider:&__block_literal_global_50_3];
    [(_UIContextMenuPlatformMetrics *)v3 setItemPrimaryDestructiveColorProvider:&__block_literal_global_52_3];
    [(_UIContextMenuPlatformMetrics *)v3 setItemPrimaryAlpha:0.96];
    v17 = +[UIImageSymbolConfiguration configurationWithTextStyle:@"UICTFontTextStyleEmphasizedBody" scale:1];
    [(_UIContextMenuPlatformMetrics *)v3 setDecorationViewSymbolConfiguration:v17];

    [(_UIContextMenuPlatformMetrics *)v3 setTrailingDecorationViewOffset:2.66666667];
    [(_UIContextMenuPlatformMetrics *)v3 setLeadingDecorationViewOffset:2.66666667];
    v18 = +[UIColor tertiaryLabelColor];
    [(_UIContextMenuPlatformMetrics *)v3 setTrailingAccessoryColor:v18];

    -[_UIContextMenuPlatformMetrics setHeaderPadding:](v3, "setHeaderPadding:", 10.0, 16.0, 11.0, 16.0);
    v19 = [off_1E52D39B8 preferredFontForTextStyle:@"UICTFontTextStyleCaption1"];
    [(_UIContextMenuPlatformMetrics *)v3 setHeaderFont:v19];

    [(_UIContextMenuPlatformMetrics *)v3 setHeaderTextAlignment:4];
    v20 = +[UIColor secondaryLabelColor];
    [(_UIContextMenuPlatformMetrics *)v3 setHeaderPrimaryColor:v20];

    [(_UIContextMenuPlatformMetrics *)v3 setHeaderRenderingMode:1];
    [(_UIContextMenuPlatformMetrics *)v3 setHeaderPrimaryCompositingFilterProvider:0];
    v21 = [off_1E52D39B8 preferredFontForTextStyle:@"UICTFontTextStyleCaption1"];
    [(_UIContextMenuPlatformMetrics *)v3 setMenuTitleFont:v21];

    [(_UIContextMenuPlatformMetrics *)v3 headerPadding];
    -[_UIContextMenuPlatformMetrics setMenuTitlePadding:](v3, "setMenuTitlePadding:");
    [(_UIContextMenuPlatformMetrics *)v3 setMenuTitleTextAlignment:4];
    [(_UIContextMenuPlatformMetrics *)v3 setHeaderRenderingMode:1];
    [(_UIContextMenuPlatformMetrics *)v3 setHeaderPrimaryCompositingFilterProvider:0];
    [(_UIContextMenuPlatformMetrics *)v3 setForceUnpinnedHeader:0];
    [(_UIContextMenuPlatformMetrics *)v3 setAlignMenuHeaderAndItemContents:1];
    [(_UIContextMenuPlatformMetrics *)v3 setMenuGutterWidth:12.0];
    [(_UIContextMenuPlatformMetrics *)v3 setMenuMaximumHeight:1.79769313e308];
    -[_UIContextMenuPlatformMetrics setMinimumContainerInsets:](v3, "setMinimumContainerInsets:", 8.0, 8.0, 8.0, 8.0);
    [(_UIContextMenuPlatformMetrics *)v3 setGradientMaskingConfiguration:0];
    [(_UIContextMenuPlatformMetrics *)v3 setShouldApplyClippingHandler:0];
    [(_UIContextMenuPlatformMetrics *)v3 setShouldApplyShadowHandler:0];
    [(_UIContextMenuPlatformMetrics *)v3 setEnableFloatingFocusStyle:0];
    [(_UIContextMenuPlatformMetrics *)v3 setAllowsItemHighlighting:1];
    -[_UIContextMenuPlatformMetrics setPaletteMinimumItemSize:](v3, "setPaletteMinimumItemSize:", 38.0, 54.0);
    [(_UIContextMenuPlatformMetrics *)v3 setLeadingIndentationContributesToWidth:0];
    [(_UIContextMenuPlatformMetrics *)v3 setContentInsetsApplyToHeaders:1];
    v22 = +[UIShape rectShapeWithCornerRadius:16.0];
    v23 = [v22 shapeByApplyingInset:8.0];
    [(_UIContextMenuPlatformMetrics *)v3 setSmallItemContentShape:v23];

    v24 = +[UIShape rectShapeWithCornerRadius:16.0];
    v25 = [v24 shapeByApplyingInset:8.0];
    [(_UIContextMenuPlatformMetrics *)v3 setMediumItemContentShape:v25];

    v26 = +[_UIClickPresentationFeedbackGeneratorConfiguration defaultConfiguration];
    [(_UIContextMenuPlatformMetrics *)v3 setPresentationFeedbackConfiguration:v26];

    [(_UIContextMenuPlatformMetrics *)v3 setMenuMinimumScale:0.8];
    [(_UIContextMenuPlatformMetrics *)v3 setContentSpacingForContainer:0];
    [(_UIContextMenuPlatformMetrics *)v3 setWantsControlAlignmentWithHorizontalEdgeAdjustment:1];
    [(_UIContextMenuPlatformMetrics *)v3 setControlAttachmentYOffsetProvider:&__block_literal_global_58_2];
    [(_UIContextMenuPlatformMetrics *)v3 setPrefersWrapToSidesHandler:&__block_literal_global_61_3];
    [(_UIContextMenuPlatformMetrics *)v3 setMaxLiftScale:1.15];
    [(_UIContextMenuPlatformMetrics *)v3 setMaxLiftScaleUpPoints:26.0];
    [(_UIContextMenuPlatformMetrics *)v3 setContainerViewsHitTestAsOpaque:1];
    [(_UIContextMenuPlatformMetrics *)v3 setSupportsPassthroughInteraction:1];
    [(_UIContextMenuPlatformMetrics *)v3 setPreviewIsConstrainedToSourceWindowBounds:0];
    -[_UIContextMenuPlatformMetrics setPreviewPlatterMaximumSize:](v3, "setPreviewPlatterMaximumSize:", 343.0, 490.0);
    [(_UIContextMenuPlatformMetrics *)v3 setPreviewPlatterCornerRadius:13.0];
  }
  return v3;
}

- (void)setHeaderRenderingMode:(int64_t)a3
{
  self->_headerRenderingMode = a3;
}

- (void)setHeaderPrimaryCompositingFilterProvider:(id)a3
{
}

- (void)setWantsControlAlignmentWithHorizontalEdgeAdjustment:(BOOL)a3
{
  self->_wantsControlAlignmentWithHorizontalEdgeAdjustment = a3;
}

- (void)setTrailingDecorationViewOffset:(double)a3
{
  self->_trailingDecorationViewOffset = a3;
}

- (void)setTrailingCascadedSubmenuOffset:(CAPoint3D)a3
{
  self->_trailingCascadedSubmenuOffset = a3;
}

- (void)setTrailingAccessoryColor:(id)a3
{
}

- (void)setTitleFont:(id)a3
{
}

- (void)setTitleEmphasizedFont:(id)a3
{
}

- (void)setSupportsPassthroughInteraction:(BOOL)a3
{
  self->_supportsPassthroughInteraction = a3;
}

- (void)setSubtitleFont:(id)a3
{
}

- (void)setSmallItemTopToFirstBaseline:(double)a3
{
  self->_smallItemTopToFirstBaseline = a3;
}

- (void)setSmallItemLastBaselineToBottom:(double)a3
{
  self->_smallItemLastBaselineToBottom = a3;
}

- (void)setSmallItemContentShape:(id)a3
{
}

- (void)setShouldApplyShadowHandler:(id)a3
{
}

- (void)setShouldApplyClippingHandler:(id)a3
{
}

- (void)setSectionSeparatorHeight:(double)a3
{
  self->_sectionSeparatorHeight = a3;
}

- (void)setSectionSeparatorColor:(id)a3
{
}

- (void)setPreviewPlatterMaximumSize:(CGSize)a3
{
  self->_previewPlatterMaximumSize = a3;
}

- (void)setPreviewPlatterCornerRadius:(double)a3
{
  self->_previewPlatterCornerRadius = a3;
}

- (void)setPreviewIsConstrainedToSourceWindowBounds:(BOOL)a3
{
  self->_previewIsConstrainedToSourceWindowBounds = a3;
}

- (void)setPresentationFeedbackConfiguration:(id)a3
{
}

- (void)setPrefersWrapToSidesHandler:(id)a3
{
}

- (void)setPaletteMinimumItemSize:(CGSize)a3
{
  self->_paletteMinimumItemSize = a3;
}

- (void)setMinimumContainerInsets:(UIEdgeInsets)a3
{
  self->_minimumContainerInsets = a3;
}

- (void)setMinIntraItemSpacing:(double)a3
{
  self->_minIntraItemSpacing = a3;
}

- (void)setMenuTitleTextAlignment:(int64_t)a3
{
  self->_menuTitleTextAlignment = a3;
}

- (void)setMenuTitlePadding:(NSDirectionalEdgeInsets)a3
{
  self->_menuTitlePadding = a3;
}

- (void)setMenuTitleFont:(id)a3
{
}

- (void)setMenuMinimumScale:(double)a3
{
  self->_menuMinimumScale = a3;
}

- (void)setMenuMaximumHeight:(double)a3
{
  self->_menuMaximumHeight = a3;
}

- (void)setMenuItemInternalPadding:(NSDirectionalEdgeInsets)a3
{
  self->_menuItemInternalPadding = a3;
}

- (void)setMenuHighlightBackgroundDescriptorProvider:(id)a3
{
}

- (void)setMenuGutterWidth:(double)a3
{
  self->_menuGutterWidth = a3;
}

- (void)setMenuCornerRadius:(double)a3
{
  self->_menuCornerRadius = a3;
}

- (void)setMenuBackgroundEffect:(id)a3
{
}

- (void)setMediumItemContentShape:(id)a3
{
}

- (void)setMaxLiftScaleUpPoints:(double)a3
{
  self->_maxLiftScaleUpPoints = a3;
}

- (void)setMaxLiftScale:(double)a3
{
  self->_maxLiftScale = a3;
}

- (void)setLeadingIndentationWidth:(double)a3
{
  self->_leadingIndentationWidth = a3;
}

- (void)setLeadingIndentationContributesToWidth:(BOOL)a3
{
  self->_leadingIndentationContributesToWidth = a3;
}

- (void)setLeadingDecorationViewOffset:(double)a3
{
  self->_leadingDecorationViewOffset = a3;
}

- (void)setLeadingCascadedSubmenuOffset:(CAPoint3D)a3
{
  self->_leadingCascadedSubmenuOffset = a3;
}

- (void)setItemTopToFirstBaselineWithSubtitle:(double)a3
{
  self->_itemTopToFirstBaselineWithSubtitle = a3;
}

- (void)setItemTopToFirstBaseline:(double)a3
{
  self->_itemTopToFirstBaseline = a3;
}

- (void)setItemSubtitleRenderingMode:(int64_t)a3
{
  self->_itemSubtitleRenderingMode = a3;
}

- (void)setItemSubtitleCompositingFilterProvider:(id)a3
{
}

- (void)setItemSubtitleColor:(id)a3
{
}

- (void)setItemSeparatorHeight:(double)a3
{
  self->_itemSeparatorHeight = a3;
}

- (void)setItemSeparatorColor:(id)a3
{
}

- (void)setItemSeparatorBackgroundEffect:(id)a3
{
}

- (void)setItemPrimaryDestructiveColorProvider:(id)a3
{
}

- (void)setItemPrimaryCompositingFilterProvider:(id)a3
{
}

- (void)setItemPrimaryColorProvider:(id)a3
{
}

- (void)setItemPrimaryAlpha:(double)a3
{
  self->_itemPrimaryAlpha = a3;
}

- (void)setItemLastBaselineToBottomWithSubtitle:(double)a3
{
  self->_itemLastBaselineToBottomWithSubtitle = a3;
}

- (void)setItemLastBaselineToBottom:(double)a3
{
  self->_itemLastBaselineToBottom = a3;
}

- (void)setItemBaselineToBaseline:(double)a3
{
  self->_itemBaselineToBaseline = a3;
}

- (void)setItemBackgroundColorProvider:(id)a3
{
}

- (void)setIconSymbolFont:(id)a3
{
}

- (void)setIconEmphasizedSymbolFont:(id)a3
{
}

- (void)setHeaderTextAlignment:(int64_t)a3
{
  self->_headerTextAlignment = a3;
}

- (void)setHeaderPrimaryColor:(id)a3
{
}

- (void)setHeaderPadding:(NSDirectionalEdgeInsets)a3
{
  self->_headerPadding = a3;
}

- (void)setHeaderFont:(id)a3
{
}

- (void)setGradientMaskingConfiguration:(id)a3
{
}

- (void)setForceUnpinnedHeader:(BOOL)a3
{
  self->_forceUnpinnedHeader = a3;
}

- (void)setEnableFloatingFocusStyle:(BOOL)a3
{
  self->_enableFloatingFocusStyle = a3;
}

- (void)setDynamicImageBoxWidth:(double)a3
{
  self->_dynamicImageBoxWidth = a3;
}

- (void)setDefaultMenuWidth:(double)a3
{
  self->_defaultMenuWidth = a3;
}

- (void)setDecorationViewSymbolConfiguration:(id)a3
{
}

- (void)setConvertPointBetweenViews:(id)a3
{
}

- (void)setControlAttachmentYOffsetProvider:(id)a3
{
}

- (void)setContentSpacingForContainer:(id)a3
{
}

- (void)setContentInsetsApplyToHeaders:(BOOL)a3
{
  self->_contentInsetsApplyToHeaders = a3;
}

- (void)setContainerViewsHitTestAsOpaque:(BOOL)a3
{
  self->_containerViewsHitTestAsOpaque = a3;
}

- (void)setApplySubmenuScaling:(BOOL)a3
{
  self->_applySubmenuScaling = a3;
}

- (void)setAllowsItemHighlighting:(BOOL)a3
{
  self->_allowsItemHighlighting = a3;
}

- (void)setAlignMenuHeaderAndItemContents:(BOOL)a3
{
  self->_alignMenuHeaderAndItemContents = a3;
}

- (NSDirectionalEdgeInsets)headerPadding
{
  double top = self->_headerPadding.top;
  double leading = self->_headerPadding.leading;
  double bottom = self->_headerPadding.bottom;
  double trailing = self->_headerPadding.trailing;
  result.double trailing = trailing;
  result.double bottom = bottom;
  result.double leading = leading;
  result.double top = top;
  return result;
}

- (double)previewRubberbandingCoefficient
{
  int v2 = _UIInternalPreferenceUsesDefault_1(&_UIInternalPreference_PlatterRubberbandingCoefficient, @"PlatterRubberbandingCoefficient");
  double result = *(double *)&qword_1E8FD5660;
  if (v2) {
    return 0.2;
  }
  return result;
}

- (void)setPreviewRubberbandingCoefficient:(double)a3
{
  if (_UIInternalPreferencesRevisionOnce != -1) {
    dispatch_once(&_UIInternalPreferencesRevisionOnce, &__block_literal_global_5_8);
  }
  if (_UIInternalPreferencesRevisionVar >= 1)
  {
    qword_1E8FD5660 = *(void *)&a3;
    _UIInternalPreference_PlatterRubberbandingCoefficient = 0x7FFFFFFF;
    if (&_UIInternalPreferencesListener___COUNTER__ != &__PhotoLibraryFrameworkHandle)
    {
      v4 = &_UIInternalPreferencesListener___COUNTER__;
      do
      {
        uint64_t v5 = *v4++;
        (*(void (**)(void))(v5 + 16))();
      }
      while (v4 != &__PhotoLibraryFrameworkHandle);
    }
  }
}

- (double)previewActionsStyleDragTearOffThreshold
{
  int v2 = _UIInternalPreferenceUsesDefault_1(&_UIInternalPreference_PlatterActionsStyleDragTearOffThreshold, @"PlatterActionsStyleDragTearOffThreshold");
  double result = *(double *)&qword_1E8FD5670;
  if (v2) {
    return 15.0;
  }
  return result;
}

- (void)setPreviewActionsStyleDragTearOffThreshold:(double)a3
{
  if (_UIInternalPreferencesRevisionOnce != -1) {
    dispatch_once(&_UIInternalPreferencesRevisionOnce, &__block_literal_global_5_8);
  }
  if (_UIInternalPreferencesRevisionVar >= 1)
  {
    qword_1E8FD5670 = *(void *)&a3;
    _UIInternalPreference_PlatterActionsStyleDragTearOffThreshold = 0x7FFFFFFF;
    if (&_UIInternalPreferencesListener___COUNTER__ != &__PhotoLibraryFrameworkHandle)
    {
      v4 = &_UIInternalPreferencesListener___COUNTER__;
      do
      {
        uint64_t v5 = *v4++;
        (*(void (**)(void))(v5 + 16))();
      }
      while (v4 != &__PhotoLibraryFrameworkHandle);
    }
  }
}

- (id)menuHeaderBackgroundProvider
{
  int v2 = _Block_copy(self->_menuTitleBackgroundProvider);
  return v2;
}

- (void)setMenuHeaderBackgroundProvider:(id)a3
{
  v4 = _Block_copy(a3);
  id menuTitleBackgroundProvider = self->_menuTitleBackgroundProvider;
  self->_id menuTitleBackgroundProvider = v4;
}

- (id)menuHighlightBackgroundDescriptorProvider
{
  return self->_menuHighlightBackgroundDescriptorProvider;
}

- (id)preDismissalHandler
{
  return self->_preDismissalHandler;
}

- (void)setPreDismissalHandler:(id)a3
{
}

- (id)postDismissalHandler
{
  return self->_postDismissalHandler;
}

- (void)setPostDismissalHandler:(id)a3
{
}

- (id)animateAlongsideTransition
{
  return self->_animateAlongsideTransition;
}

- (void)setAnimateAlongsideTransition:(id)a3
{
}

- (id)containerViewProvider
{
  return self->_containerViewProvider;
}

- (void)setContainerViewProvider:(id)a3
{
}

- (id)convertPointBetweenViews
{
  return self->_convertPointBetweenViews;
}

- (double)menuMaximumHeight
{
  return self->_menuMaximumHeight;
}

- (double)menuMinimumScale
{
  return self->_menuMinimumScale;
}

- (NSDirectionalEdgeInsets)menuItemInternalPadding
{
  double top = self->_menuItemInternalPadding.top;
  double leading = self->_menuItemInternalPadding.leading;
  double bottom = self->_menuItemInternalPadding.bottom;
  double trailing = self->_menuItemInternalPadding.trailing;
  result.double trailing = trailing;
  result.double bottom = bottom;
  result.double leading = leading;
  result.double top = top;
  return result;
}

- (double)menuGutterWidth
{
  return self->_menuGutterWidth;
}

- (UIVisualEffect)menuBackgroundEffect
{
  return self->_menuBackgroundEffect;
}

- (UIColor)menuBackgroundColor
{
  return self->_menuBackgroundColor;
}

- (void)setMenuBackgroundColor:(id)a3
{
}

- (id)menuTitleBackgroundProvider
{
  return self->_menuTitleBackgroundProvider;
}

- (void)setMenuTitleBackgroundProvider:(id)a3
{
}

- (double)menuCornerRadius
{
  return self->_menuCornerRadius;
}

- (double)leadingIndentationWidth
{
  return self->_leadingIndentationWidth;
}

- (BOOL)applySubmenuScaling
{
  return self->_applySubmenuScaling;
}

- (BOOL)shouldDismissMenuOnSceneDeactivation
{
  return self->_shouldDismissMenuOnSceneDeactivation;
}

- (void)setShouldDismissMenuOnSceneDeactivation:(BOOL)a3
{
  self->_shouldDismissMenuOnSceneDeactivation = a3;
}

- (NSDictionary)submenuSeparatedOptions
{
  return self->_submenuSeparatedOptions;
}

- (void)setSubmenuSeparatedOptions:(id)a3
{
}

- (CAPoint3D)stackedSubmenuOffset
{
  double x = self->_stackedSubmenuOffset.x;
  double y = self->_stackedSubmenuOffset.y;
  double z = self->_stackedSubmenuOffset.z;
  result.double z = z;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setStackedSubmenuOffset:(CAPoint3D)a3
{
  self->_stackedSubmenuOffset = a3;
}

- (CAPoint3D)leadingCascadedSubmenuOffset
{
  double x = self->_leadingCascadedSubmenuOffset.x;
  double y = self->_leadingCascadedSubmenuOffset.y;
  double z = self->_leadingCascadedSubmenuOffset.z;
  result.double z = z;
  result.double y = y;
  result.double x = x;
  return result;
}

- (CAPoint3D)trailingCascadedSubmenuOffset
{
  double x = self->_trailingCascadedSubmenuOffset.x;
  double y = self->_trailingCascadedSubmenuOffset.y;
  double z = self->_trailingCascadedSubmenuOffset.z;
  result.double z = z;
  result.double y = y;
  result.double x = x;
  return result;
}

- (NSDictionary)accessorySeparatedOptions
{
  return self->_accessorySeparatedOptions;
}

- (void)setAccessorySeparatedOptions:(id)a3
{
}

- (CAPoint3D)baseMenuOffset
{
  double x = self->_baseMenuOffset.x;
  double y = self->_baseMenuOffset.y;
  double z = self->_baseMenuOffset.z;
  result.double z = z;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setBaseMenuOffset:(CAPoint3D)a3
{
  self->_baseMenuOffset = a3;
}

- (UIEdgeInsets)minimumContainerInsets
{
  double top = self->_minimumContainerInsets.top;
  double left = self->_minimumContainerInsets.left;
  double bottom = self->_minimumContainerInsets.bottom;
  double right = self->_minimumContainerInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (double)defaultMenuWidth
{
  return self->_defaultMenuWidth;
}

- (double)largePaletteWidthExtension
{
  return self->_largePaletteWidthExtension;
}

- (void)setLargePaletteWidthExtension:(double)a3
{
  self->_largePaletteWidthExtension = a3;
}

- (double)itemSeparatorHeight
{
  return self->_itemSeparatorHeight;
}

- (UIColor)itemSeparatorColor
{
  return self->_itemSeparatorColor;
}

- (UIVisualEffect)itemSeparatorBackgroundEffect
{
  return self->_itemSeparatorBackgroundEffect;
}

- (UIColor)itemSubtitleColor
{
  return self->_itemSubtitleColor;
}

- (int64_t)itemSubtitleRenderingMode
{
  return self->_itemSubtitleRenderingMode;
}

- (id)itemPrimaryCompositingFilterProvider
{
  return self->_itemPrimaryCompositingFilterProvider;
}

- (id)itemSubtitleCompositingFilterProvider
{
  return self->_itemSubtitleCompositingFilterProvider;
}

- (double)itemTopToFirstBaseline
{
  return self->_itemTopToFirstBaseline;
}

- (double)smallItemTopToFirstBaseline
{
  return self->_smallItemTopToFirstBaseline;
}

- (double)itemLastBaselineToBottom
{
  return self->_itemLastBaselineToBottom;
}

- (double)smallItemLastBaselineToBottom
{
  return self->_smallItemLastBaselineToBottom;
}

- (double)itemBaselineToBaseline
{
  return self->_itemBaselineToBaseline;
}

- (double)itemTopToFirstBaselineWithSubtitle
{
  return self->_itemTopToFirstBaselineWithSubtitle;
}

- (double)itemLastBaselineToBottomWithSubtitle
{
  return self->_itemLastBaselineToBottomWithSubtitle;
}

- (double)dynamicImageBoxWidth
{
  return self->_dynamicImageBoxWidth;
}

- (double)minIntraItemSpacing
{
  return self->_minIntraItemSpacing;
}

- (UIFont)titleFont
{
  return self->_titleFont;
}

- (UIFont)titleEmphasizedFont
{
  return self->_titleEmphasizedFont;
}

- (UIFont)subtitleFont
{
  return self->_subtitleFont;
}

- (UIFont)iconSymbolFont
{
  return self->_iconSymbolFont;
}

- (UIFont)iconEmphasizedSymbolFont
{
  return self->_iconEmphasizedSymbolFont;
}

- (id)itemBackgroundColorProvider
{
  return self->_itemBackgroundColorProvider;
}

- (id)itemPrimaryColorProvider
{
  return self->_itemPrimaryColorProvider;
}

- (id)itemPrimaryDestructiveColorProvider
{
  return self->_itemPrimaryDestructiveColorProvider;
}

- (double)itemPrimaryAlpha
{
  return self->_itemPrimaryAlpha;
}

- (BOOL)leadingIndentationContributesToWidth
{
  return self->_leadingIndentationContributesToWidth;
}

- (BOOL)contentInsetsApplyToHeaders
{
  return self->_contentInsetsApplyToHeaders;
}

- (UIFont)headerFont
{
  return self->_headerFont;
}

- (UIColor)headerPrimaryColor
{
  return self->_headerPrimaryColor;
}

- (int64_t)headerRenderingMode
{
  return self->_headerRenderingMode;
}

- (id)headerPrimaryCompositingFilterProvider
{
  return self->_headerPrimaryCompositingFilterProvider;
}

- (int64_t)headerTextAlignment
{
  return self->_headerTextAlignment;
}

- (BOOL)menuTitleAlwaysShowsSeparator
{
  return self->_menuTitleAlwaysShowsSeparator;
}

- (void)setMenuTitleAlwaysShowsSeparator:(BOOL)a3
{
  self->_menuTitleAlwaysShowsSeparator = a3;
}

- (UIFont)menuTitleFont
{
  return self->_menuTitleFont;
}

- (NSDirectionalEdgeInsets)menuTitlePadding
{
  double top = self->_menuTitlePadding.top;
  double leading = self->_menuTitlePadding.leading;
  double bottom = self->_menuTitlePadding.bottom;
  double trailing = self->_menuTitlePadding.trailing;
  result.double trailing = trailing;
  result.double bottom = bottom;
  result.double leading = leading;
  result.double top = top;
  return result;
}

- (int64_t)menuTitleTextAlignment
{
  return self->_menuTitleTextAlignment;
}

- (BOOL)forceUnpinnedHeader
{
  return self->_forceUnpinnedHeader;
}

- (BOOL)alignMenuHeaderAndItemContents
{
  return self->_alignMenuHeaderAndItemContents;
}

- (NSDirectionalEdgeInsets)sectionInsets
{
  double top = self->_sectionInsets.top;
  double leading = self->_sectionInsets.leading;
  double bottom = self->_sectionInsets.bottom;
  double trailing = self->_sectionInsets.trailing;
  result.double trailing = trailing;
  result.double bottom = bottom;
  result.double leading = leading;
  result.double top = top;
  return result;
}

- (void)setSectionInsets:(NSDirectionalEdgeInsets)a3
{
  self->_sectionInsets = a3;
}

- (UIColor)sectionSeparatorColor
{
  return self->_sectionSeparatorColor;
}

- (double)sectionSeparatorHeight
{
  return self->_sectionSeparatorHeight;
}

- (NSDirectionalEdgeInsets)sectionSeparatorInsets
{
  double top = self->_sectionSeparatorInsets.top;
  double leading = self->_sectionSeparatorInsets.leading;
  double bottom = self->_sectionSeparatorInsets.bottom;
  double trailing = self->_sectionSeparatorInsets.trailing;
  result.double trailing = trailing;
  result.double bottom = bottom;
  result.double leading = leading;
  result.double top = top;
  return result;
}

- (void)setSectionSeparatorInsets:(NSDirectionalEdgeInsets)a3
{
  self->_sectionSeparatorInsets = a3;
}

- (UIImageSymbolConfiguration)decorationViewSymbolConfiguration
{
  return self->_decorationViewSymbolConfiguration;
}

- (double)leadingDecorationViewOffset
{
  return self->_leadingDecorationViewOffset;
}

- (double)trailingDecorationViewOffset
{
  return self->_trailingDecorationViewOffset;
}

- (UIColor)trailingAccessoryColor
{
  return self->_trailingAccessoryColor;
}

- (double)previewRubberbandingZCoefficient
{
  return self->_previewRubberbandingZCoefficient;
}

- (void)setPreviewRubberbandingZCoefficient:(double)a3
{
  self->_previewRubberbandingZCoefficient = a3;
}

- (double)previewActionsStyleDragZTearOffThreshold
{
  return self->_previewActionsStyleDragZTearOffThreshold;
}

- (void)setPreviewActionsStyleDragZTearOffThreshold:(double)a3
{
  self->_previewActionsStyleDragZTearOffThreshold = a3;
}

- (double)previewRotationMaxDegrees
{
  return self->_previewRotationMaxDegrees;
}

- (void)setPreviewRotationMaxDegrees:(double)a3
{
  self->_previewRotationMaxDegrees = a3;
}

- (CGSize)previewPlatterMaximumSize
{
  double width = self->_previewPlatterMaximumSize.width;
  double height = self->_previewPlatterMaximumSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (_UIShadowProperties)previewShadowSettings
{
  return self->_previewShadowSettings;
}

- (void)setPreviewShadowSettings:(id)a3
{
}

- (BOOL)previewIsConstrainedToSourceWindowBounds
{
  return self->_previewIsConstrainedToSourceWindowBounds;
}

- (double)previewPlatterCornerRadius
{
  return self->_previewPlatterCornerRadius;
}

- (BOOL)enableShadowsForStandardSizeMenus
{
  return self->_enableShadowsForStandardSizeMenus;
}

- (void)setEnableShadowsForStandardSizeMenus:(BOOL)a3
{
  self->_enableShadowsForStandardSizeMenus = a3;
}

- (_UIContextMenuGradientMaskingConfiguration)gradientMaskingConfiguration
{
  return self->_gradientMaskingConfiguration;
}

- (id)shouldApplyClippingHandler
{
  return self->_shouldApplyClippingHandler;
}

- (id)shouldApplyShadowHandler
{
  return self->_shouldApplyShadowHandler;
}

- (id)overrideElementSize
{
  return self->_overrideElementSize;
}

- (void)setOverrideElementSize:(id)a3
{
}

- (BOOL)enableFloatingFocusStyle
{
  return self->_enableFloatingFocusStyle;
}

- (BOOL)allowsItemHighlighting
{
  return self->_allowsItemHighlighting;
}

- (BOOL)containerViewsHitTestAsOpaque
{
  return self->_containerViewsHitTestAsOpaque;
}

- (BOOL)supportsLargePaletteMenus
{
  return self->_supportsLargePaletteMenus;
}

- (void)setSupportsLargePaletteMenus:(BOOL)a3
{
  self->_supportsLargePaletteMenus = a3;
}

- (CGSize)paletteMinimumItemSize
{
  double width = self->_paletteMinimumItemSize.width;
  double height = self->_paletteMinimumItemSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (UIShape)smallItemContentShape
{
  return self->_smallItemContentShape;
}

- (UIShape)mediumItemContentShape
{
  return self->_mediumItemContentShape;
}

- (id)contentSpacingForContainer
{
  return self->_contentSpacingForContainer;
}

- (id)itemColoredSymbolImageUserInterfaceStyleOverrideProvider
{
  return self->_itemColoredSymbolImageUserInterfaceStyleOverrideProvider;
}

- (void)setItemColoredSymbolImageUserInterfaceStyleOverrideProvider:(id)a3
{
}

- (BOOL)wantsControlAlignmentWithHorizontalEdgeAdjustment
{
  return self->_wantsControlAlignmentWithHorizontalEdgeAdjustment;
}

- (id)controlAttachmentYOffsetProvider
{
  return self->_controlAttachmentYOffsetProvider;
}

- (id)prefersWrapToSidesHandler
{
  return self->_prefersWrapToSidesHandler;
}

- (double)maxLiftScale
{
  return self->_maxLiftScale;
}

- (double)maxLiftScaleUpPoints
{
  return self->_maxLiftScaleUpPoints;
}

- (BOOL)supportsPassthroughInteraction
{
  return self->_supportsPassthroughInteraction;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_prefersWrapToSidesHandler, 0);
  objc_storeStrong(&self->_controlAttachmentYOffsetProvider, 0);
  objc_storeStrong(&self->_itemColoredSymbolImageUserInterfaceStyleOverrideProvider, 0);
  objc_storeStrong(&self->_contentSpacingForContainer, 0);
  objc_storeStrong((id *)&self->_presentationFeedbackConfiguration, 0);
  objc_storeStrong((id *)&self->_mediumItemContentShape, 0);
  objc_storeStrong((id *)&self->_smallItemContentShape, 0);
  objc_storeStrong(&self->_overrideElementSize, 0);
  objc_storeStrong(&self->_shouldApplyShadowHandler, 0);
  objc_storeStrong(&self->_shouldApplyClippingHandler, 0);
  objc_storeStrong((id *)&self->_gradientMaskingConfiguration, 0);
  objc_storeStrong((id *)&self->_previewShadowSettings, 0);
  objc_storeStrong((id *)&self->_trailingAccessoryColor, 0);
  objc_storeStrong((id *)&self->_decorationViewSymbolConfiguration, 0);
  objc_storeStrong((id *)&self->_sectionSeparatorColor, 0);
  objc_storeStrong((id *)&self->_menuTitleFont, 0);
  objc_storeStrong(&self->_headerPrimaryCompositingFilterProvider, 0);
  objc_storeStrong((id *)&self->_headerPrimaryColor, 0);
  objc_storeStrong((id *)&self->_headerFont, 0);
  objc_storeStrong(&self->_itemPrimaryDestructiveColorProvider, 0);
  objc_storeStrong(&self->_itemPrimaryColorProvider, 0);
  objc_storeStrong(&self->_itemBackgroundColorProvider, 0);
  objc_storeStrong((id *)&self->_iconEmphasizedSymbolFont, 0);
  objc_storeStrong((id *)&self->_iconSymbolFont, 0);
  objc_storeStrong((id *)&self->_subtitleFont, 0);
  objc_storeStrong((id *)&self->_titleEmphasizedFont, 0);
  objc_storeStrong((id *)&self->_titleFont, 0);
  objc_storeStrong(&self->_itemSubtitleCompositingFilterProvider, 0);
  objc_storeStrong(&self->_itemPrimaryCompositingFilterProvider, 0);
  objc_storeStrong((id *)&self->_itemSubtitleColor, 0);
  objc_storeStrong((id *)&self->_itemSeparatorBackgroundEffect, 0);
  objc_storeStrong((id *)&self->_itemSeparatorColor, 0);
  objc_storeStrong((id *)&self->_accessorySeparatedOptions, 0);
  objc_storeStrong((id *)&self->_submenuSeparatedOptions, 0);
  objc_storeStrong(&self->_menuTitleBackgroundProvider, 0);
  objc_storeStrong((id *)&self->_menuBackgroundColor, 0);
  objc_storeStrong((id *)&self->_menuBackgroundEffect, 0);
  objc_storeStrong(&self->_convertPointBetweenViews, 0);
  objc_storeStrong(&self->_containerViewProvider, 0);
  objc_storeStrong(&self->_animateAlongsideTransition, 0);
  objc_storeStrong(&self->_postDismissalHandler, 0);
  objc_storeStrong(&self->_preDismissalHandler, 0);
  objc_storeStrong(&self->_menuHighlightBackgroundDescriptorProvider, 0);
}

@end