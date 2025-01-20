@interface UIButton
+ (BOOL)_allowsUnsupportedMacIdiomBehavior;
+ (BOOL)_buttonTypeIsModernUI:(int64_t)a3;
+ (BOOL)_buttonTypeIsSystemProvided:(int64_t)a3;
+ (BOOL)_buttonTypeIsiOSSystemProvided:(int64_t)a3;
+ (Class)_visualProviderClass;
+ (Class)_visualProviderClassForIdiom:(int64_t)a3;
+ (UIButton)buttonWithConfiguration:(UIButtonConfiguration *)configuration primaryAction:(UIAction *)primaryAction;
+ (UIButton)buttonWithType:(UIButtonType)buttonType;
+ (UIButton)buttonWithType:(UIButtonType)buttonType primaryAction:(UIAction *)primaryAction;
+ (UIButton)systemButtonWithImage:(UIImage *)image target:(id)target action:(SEL)action;
+ (UIButton)systemButtonWithPrimaryAction:(UIAction *)primaryAction;
+ (double)_defaultNeighborSpacingForAxis:(int64_t)a3;
+ (id)_defaultBackgroundImageColorForType:(int64_t)a3 andState:(unint64_t)a4;
+ (id)_defaultBackgroundImageForType:(int64_t)a3 andState:(unint64_t)a4;
+ (id)_defaultBackgroundImageNameForType:(int64_t)a3 andState:(unint64_t)a4 compact:(BOOL)a5;
+ (id)_defaultImageColorForState:(unint64_t)a3 button:(id)a4;
+ (id)_defaultImageColorForType:(int64_t)a3 andState:(unint64_t)a4 idiom:(int64_t)a5;
+ (id)_defaultImageForType:(int64_t)a3 andState:(unint64_t)a4 withConfiguration:(id)a5;
+ (id)_defaultImageNameForType:(int64_t)a3 andState:(unint64_t)a4;
+ (id)_defaultNormalTitleColor;
+ (id)_defaultNormalTitleShadowColor;
+ (id)_defaultSymbolConfigurationForType:(int64_t)a3 andState:(unint64_t)a4 compact:(BOOL)a5 idiom:(int64_t)a6;
+ (id)_defaultTitleColorForState:(unint64_t)a3 button:(id)a4 isTintColor:(BOOL *)a5;
+ (void)_registerVisualProviderClass:(Class)a3 forIdiom:(int64_t)a4;
+ (void)_setAllowsUnsupportedMacIdiomBehavior:(BOOL)a3;
+ (void)_setVisuallyHighlighted:(BOOL)a3 forViews:(id)a4 initialPress:(BOOL)a5;
+ (void)_setVisuallyHighlighted:(BOOL)a3 forViews:(id)a4 initialPress:(BOOL)a5 baseAlpha:(double)a6;
+ (void)_setVisuallyHighlighted:(BOOL)a3 forViews:(id)a4 initialPress:(BOOL)a5 highlightBlock:(id)a6;
- ($F24F406B2B787EFB06265DBA3D28CBD5)_baselineOffsetsAtSize:(CGSize)a3;
- (BOOL)_alwaysHandleScrollerMouseEvent;
- (BOOL)_blurEnabled;
- (BOOL)_calloutBar_shouldHideTitleLabel;
- (BOOL)_canHaveTitle;
- (BOOL)_contentHuggingDefault_isUsuallyFixedHeight;
- (BOOL)_contentHuggingDefault_isUsuallyFixedWidth;
- (BOOL)_disableAutomaticTitleAnimations;
- (BOOL)_fontIsDefaultForIdiom;
- (BOOL)_hasBaseline;
- (BOOL)_hasCustomAutolayoutNeighborSpacingForAttribute:(int64_t *)a3;
- (BOOL)_hasDrawingStyle;
- (BOOL)_hasHighlightColor;
- (BOOL)_hasImageForProperty:(id)a3;
- (BOOL)_hasVisibleDefaultSelectionIndicator;
- (BOOL)_isCarPlaySystemTypeButton;
- (BOOL)_isContentBackgroundHidden;
- (BOOL)_isEffectivelyDisabledExternalButton;
- (BOOL)_isInCarPlay;
- (BOOL)_isModernButton;
- (BOOL)_isOn;
- (BOOL)_isPopUpMenuButtonWithMenu:(id)a3;
- (BOOL)_isSystemProvidedButton;
- (BOOL)_isTitleFrozen;
- (BOOL)_isToggleButton;
- (BOOL)_isiOSSystemProvidedButton;
- (BOOL)_likelyToHaveTitle;
- (BOOL)_menuEnabled;
- (BOOL)_needsDoubleUpdateConstraintsPass;
- (BOOL)_requiresLayoutForPropertyChange;
- (BOOL)_selectorOverridden:(SEL)a3;
- (BOOL)_shouldAdjustToTraitCollection;
- (BOOL)_shouldHaveFloatingAppearance;
- (BOOL)_shouldInvalidateBaselineConstraintsForSize:(CGSize)a3 oldSize:(CGSize)a4;
- (BOOL)_supportsMacIdiom;
- (BOOL)_unconditionallyWantsSetBoundsFromISEngineLayout;
- (BOOL)_visualEffectViewEnabled;
- (BOOL)_wantsAccessibilityUnderline;
- (BOOL)_wantsBaselineUpdatingFollowingConstraintsPass;
- (BOOL)adjustsImageSizeForAccessibilityContentSizeCategory;
- (BOOL)adjustsImageWhenDisabled;
- (BOOL)adjustsImageWhenHighlighted;
- (BOOL)automaticallyUpdatesConfiguration;
- (BOOL)autosizesToFit;
- (BOOL)beginTrackingWithTouch:(id)a3 withEvent:(id)a4;
- (BOOL)canBecomeFocused;
- (BOOL)changesSelectionAsPrimaryAction;
- (BOOL)gestureRecognizerShouldBegin:(id)a3;
- (BOOL)isAccessibilityElementByDefault;
- (BOOL)isElementAccessibilityExposedToInterfaceBuilder;
- (BOOL)isHovered;
- (BOOL)prefersHorizontalMenuAttachment;
- (BOOL)reversesTitleShadowWhenHighlighted;
- (BOOL)scalesLargeContentImage;
- (BOOL)showsTouchWhenHighlighted;
- (CGPoint)menuAttachmentPointForConfiguration:(id)a3;
- (CGPoint)pressFeedbackPosition;
- (CGRect)_clippedHighlightBounds;
- (CGRect)_highlightBounds;
- (CGRect)_selectedIndicatorBounds;
- (CGRect)_visualBounds;
- (CGRect)backgroundRectForBounds:(CGRect)bounds;
- (CGRect)contentRectForBounds:(CGRect)bounds;
- (CGRect)imageRectForContentRect:(CGRect)contentRect;
- (CGRect)titleRectForContentRect:(CGRect)contentRect;
- (CGSize)_effectiveSizeForImage:(id)a3;
- (CGSize)_intrinsicSizeWithinSize:(CGSize)a3;
- (CGSize)_roundSize:(CGSize)a3;
- (CGSize)_titleShadowOffset;
- (CGSize)intrinsicContentSize;
- (CGSize)systemLayoutSizeFittingSize:(CGSize)a3 withHorizontalFittingPriority:(float)a4 verticalFittingPriority:(float)a5;
- (NSAttributedString)attributedTitleForState:(UIControlState)state;
- (NSAttributedString)currentAttributedTitle;
- (NSISEngine)_activeSizeToFitLayoutEngine;
- (NSString)currentTitle;
- (NSString)description;
- (UIBehavioralStyle)behavioralStyle;
- (UIBehavioralStyle)preferredBehavioralStyle;
- (UIButton)initWithCoder:(NSCoder *)coder;
- (UIButton)initWithFrame:(CGRect)frame;
- (UIButton)initWithFrame:(CGRect)frame primaryAction:(UIAction *)primaryAction;
- (UIButtonConfiguration)configuration;
- (UIButtonConfigurationUpdateHandler)configurationUpdateHandler;
- (UIButtonPointerStyleProvider)pointerStyleProvider;
- (UIButtonRole)role;
- (UIButtonType)buttonType;
- (UIButtonVisualProvider)_visualProvider;
- (UIColor)_currentImageColor;
- (UIColor)_plainButtonBackgroundColor;
- (UIColor)currentTitleColor;
- (UIColor)currentTitleShadowColor;
- (UIColor)titleColorForState:(UIControlState)state;
- (UIContextMenuConfigurationElementOrder)preferredMenuElementOrder;
- (UIEdgeInsets)_combinedContentPaddingInsets;
- (UIEdgeInsets)_internalTitlePaddingInsets;
- (UIEdgeInsets)_pathImageEdgeInsets;
- (UIEdgeInsets)_pathTitleEdgeInsets;
- (UIEdgeInsets)alignmentRectInsets;
- (UIEdgeInsets)contentEdgeInsets;
- (UIEdgeInsets)imageEdgeInsets;
- (UIEdgeInsets)titleEdgeInsets;
- (UIImage)backgroundImageForState:(UIControlState)state;
- (UIImage)currentBackgroundImage;
- (UIImage)currentImage;
- (UIImage)imageForState:(UIControlState)state;
- (UIImageSymbolConfiguration)currentPreferredSymbolConfiguration;
- (UIImageView)imageView;
- (UILabel)subtitleLabel;
- (UILabel)titleLabel;
- (UIMenu)menu;
- (UIView)_imageEffectContainerView;
- (_UIButtonConfiguration)_configuration;
- (_UIButtonConfigurationShim)_currentConfiguration;
- (_UIButtonConfigurationState)_configurationState;
- (_UISelectionInteraction)selectionInteraction;
- (double)_additionalBaselineSpacingForEdge:(int)a3;
- (double)_autolayoutSpacingAtEdge:(int)a3 forAttribute:(id)a4 nextToNeighbor:(id)a5 edge:(int)a6 attribute:(int64_t)a7 multiplier:(double)a8;
- (double)_autolayoutSpacingAtEdge:(int)a3 forAttribute:(int64_t)a4 inContainer:(id)a5 isGuide:(BOOL)a6;
- (double)_baselineOffsetFromBottom;
- (double)_baselineOffsetFromNearestEdgeForLayoutAttribute:(int64_t)a3;
- (double)_drawingStrokeForState:(unint64_t)a3;
- (double)_drawingStrokeForStyle:(int64_t)a3;
- (double)_firstBaselineOffsetFromTop;
- (double)_focusSizeIncrease;
- (double)_highlightCornerRadius;
- (double)_preferredMaxLayoutWidth;
- (double)_scaleFactorForImage;
- (double)_selectedIndicatorAlpha;
- (id)_allButtonContent;
- (id)_archivableContent:(id *)a3;
- (id)_attributedSubtitleForState:(unint64_t)a3;
- (id)_attributedTitleForState:(unint64_t)a3;
- (id)_attributedTitleForState:(unint64_t)a3 adjustedToTraitCollection:(id)a4;
- (id)_backgroundForState:(unint64_t)a3 usesBackgroundForNormalState:(BOOL *)a4;
- (id)_backgroundView;
- (id)_borderColorForState:(unint64_t)a3;
- (id)_configurationUpdateHandler;
- (id)_contentBackdropView;
- (id)_contentForState:(unint64_t)a3;
- (id)_contextMenuInteraction:(id)a3 styleForMenuWithConfiguration:(id)a4;
- (id)_currentImageWithResolvedConfiguration;
- (id)_defaultFocusEffect;
- (id)_defaultFontForIdiom:(int64_t)a3;
- (id)_defaultImageForState:(unint64_t)a3 withConfiguration:(id)a4;
- (id)_effectiveContentView;
- (id)_encodableSubviews;
- (id)_externalBorderColorForState:(unint64_t)a3;
- (id)_externalFocusedTitleColor;
- (id)_externalImageColorForState:(unint64_t)a3;
- (id)_externalTitleColorForState:(unint64_t)a3 isTintColor:(BOOL *)a4;
- (id)_externalUnfocusedBorderColor;
- (id)_font;
- (id)_imageColorForState:(unint64_t)a3;
- (id)_imageForState:(unint64_t)a3 applyingConfiguration:(BOOL)a4 usesImageForNormalState:(BOOL *)a5;
- (id)_imageView;
- (id)_imageViewIfNeeded;
- (id)_layoutDebuggingTitle;
- (id)_lazyTitleViewFontIsDefaultForIdiom:(BOOL *)a3;
- (id)_menuProvider;
- (id)_pointerEffect;
- (id)_pointerEffectPreviewParameters;
- (id)_pointerEffectWithPreview:(id)a3;
- (id)_preferredConfigurationForFocusAnimation:(int64_t)a3 inContext:(id)a4;
- (id)_preferredConfigurationForState:(unint64_t)a3;
- (id)_preferredConfigurationForState:(unint64_t)a3 includeDefault:(BOOL)a4;
- (id)_preferredHoverEffect;
- (id)_preferredHoverShape;
- (id)_selectedIndicatorViewWithImage:(id)a3;
- (id)_selectionIndicatorView;
- (id)_shadowColorForState:(unint64_t)a3;
- (id)_shapeInContainer:(id)a3;
- (id)_shapeInContainer:(id)a3 proposal:(id)a4;
- (id)_subtitleForState:(unint64_t)a3;
- (id)_titleColorForState:(unint64_t)a3;
- (id)_titleColorForState:(unint64_t)a3 suppressTintColorFollowing:(BOOL *)a4;
- (id)_titleForState:(unint64_t)a3;
- (id)_titleOrImageViewForBaselineLayout;
- (id)_titleView;
- (id)_viewForLoweringBaselineLayoutAttribute:(int)a3;
- (id)contextMenuInteraction:(id)a3 configurationForMenuAtLocation:(CGPoint)a4;
- (id)contextMenuInteraction:(id)a3 previewForDismissingMenuWithConfiguration:(id)a4;
- (id)contextMenuInteraction:(id)a3 previewForHighlightingMenuWithConfiguration:(id)a4;
- (id)image;
- (id)largeContentImage;
- (id)largeContentTitle;
- (id)pointerInteraction:(id)a3 regionForRequest:(id)a4 defaultRegion:(id)a5;
- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4;
- (id)title;
- (id)viewForFirstBaselineLayout;
- (id)viewForLastBaselineLayout;
- (id)visualProviderClassForTraitCollection:(id)a3;
- (int64_t)_buttonType;
- (int64_t)_drawingStyleForState:(unint64_t)a3;
- (int64_t)_drawingStyleForStroke:(double)a3;
- (int64_t)_externalDrawingStyleForState:(unint64_t)a3;
- (int64_t)_imageContentMode;
- (int64_t)_lineBreakMode;
- (uint64_t)_setContentValue:(void *)a3 forField:(uint64_t)a4 state:;
- (unint64_t)_controlEventsForActionTriggered;
- (unint64_t)_externalFlatEdge;
- (unint64_t)defaultAccessibilityTraits;
- (void)_alignmentRectInsetsHaveChangedForChildImageView:(id)a3;
- (void)_applyCarPlaySystemButtonCustomizations;
- (void)_commonInitForPrimaryAction:(id)a3;
- (void)_didChangeFromIdiom:(int64_t)a3 onScreen:(id)a4 traverseHierarchy:(BOOL)a5;
- (void)_didMoveFromWindow:(id)a3 toWindow:(id)a4;
- (void)_didUpdateFocusInContext:(id)a3;
- (void)_intrinsicContentSizeInvalidatedForChildView:(id)a3;
- (void)_invalidateForPropertyChange;
- (void)_markAndLayoutAsNeededForField:(uint64_t)a3 state:;
- (void)_populateArchivedSubviews:(id)a3;
- (void)_prepareForFirstIntrinsicContentSizeCalculation;
- (void)_prepareForSecondIntrinsicContentSizeCalculationWithLayoutEngineBounds:(CGRect)a3;
- (void)_refreshVisualProvider;
- (void)_refreshVisualProviderForTraitCollection:(id)a3;
- (void)_refreshVisualProviderForTraitCollection:(id)a3 populatingAPIProperties:(BOOL)a4;
- (void)_resetLazyTitleViewFont;
- (void)_selectionInteractionDidBeginHinting:(id)a3;
- (void)_selectionInteractionDidCancelHinting:(id)a3;
- (void)_selectionInteractionDidSelect:(id)a3;
- (void)_sendActionsForEvents:(unint64_t)a3 withEvent:(id)a4;
- (void)_setActiveSizeToFitLayoutEngine:(id)a3;
- (void)_setAttributedSubtitle:(id)a3 forState:(unint64_t)a4;
- (void)_setAttributedTitle:(id)a3 forStates:(unint64_t)a4;
- (void)_setBackground:(id)a3 forStates:(unint64_t)a4;
- (void)_setBlurEnabled:(BOOL)a3;
- (void)_setButtonType:(int64_t)a3;
- (void)_setConfigurationUpdateHandler:(id)a3;
- (void)_setContent:(id)a3 forState:(unint64_t)a4;
- (void)_setContentBackgroundHidden:(BOOL)a3;
- (void)_setContentHuggingPriorities:(CGSize)a3;
- (void)_setCurrentConfiguration:(id)a3;
- (void)_setDefaultFontForIdiom;
- (void)_setDisableAutomaticTitleAnimations:(BOOL)a3;
- (void)_setDrawingStroke:(double)a3 forState:(unint64_t)a4;
- (void)_setDrawingStyle:(int64_t)a3 forState:(unint64_t)a4;
- (void)_setExternalFlatEdge:(unint64_t)a3;
- (void)_setFocusSizeIncrease:(double)a3;
- (void)_setFont:(id)a3;
- (void)_setFont:(id)a3 isDefaultForIdiom:(BOOL)a4;
- (void)_setFrame:(CGRect)a3 deferLayout:(BOOL)a4;
- (void)_setHasActiveMenuPresentation:(BOOL)a3;
- (void)_setHighlighted:(BOOL)a3 animated:(BOOL)a4;
- (void)_setHighlightedWithoutUpdatingState:(BOOL)a3;
- (void)_setHovered:(BOOL)a3;
- (void)_setImage:(id)a3 forStates:(unint64_t)a4;
- (void)_setImageColor:(id)a3 forState:(unint64_t)a4;
- (void)_setImageColor:(id)a3 forStates:(unint64_t)a4;
- (void)_setImageContentMode:(int64_t)a3;
- (void)_setInternalTitlePaddingInsets:(UIEdgeInsets)a3;
- (void)_setLazyTitleViewFont:(id)a3 isDefaultForIdiom:(BOOL)a4;
- (void)_setLineBreakMode:(int64_t)a3;
- (void)_setMenuProvider:(id)a3;
- (void)_setOn:(BOOL)a3;
- (void)_setPlainButtonBackgroundColor:(id)a3;
- (void)_setShadowColor:(id)a3 forStates:(unint64_t)a4;
- (void)_setShouldHandleScrollerMouseEvent:(BOOL)a3;
- (void)_setSubtitle:(id)a3 forState:(unint64_t)a4;
- (void)_setTitle:(id)a3 forStates:(unint64_t)a4;
- (void)_setTitleColor:(id)a3 forStates:(unint64_t)a4;
- (void)_setTitleFrozen:(BOOL)a3;
- (void)_setTitleShadowOffset:(CGSize)a3;
- (void)_setVisualEffectViewEnabled:(BOOL)a3 backgroundColor:(id)a4;
- (void)_setVisualProvider:(id)a3;
- (void)_setWantsAccessibilityUnderline:(BOOL)a3;
- (void)_shim_setConfiguration:(id)a3;
- (void)_takeContentFromArchivableContent:(id)a3;
- (void)_titleViewLabelMetricsChanged;
- (void)_uikit_applyValueFromTraitStorage:(id)a3 forKeyPath:(id)a4;
- (void)_updateBaselineInformationDependentOnBounds;
- (void)_updateConfigurationWithObservationTracking:(id)a3;
- (void)_updateContextMenuEnabled;
- (void)_updateForAutomaticSelection;
- (void)_willMoveToWindow:(id)a3;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)endTrackingWithTouch:(id)a3 withEvent:(id)a4;
- (void)forcedSelectionOfMenu:(id)a3 willChangeTo:(id)a4;
- (void)layoutSubviews;
- (void)pointerInteraction:(id)a3 willEnterRegion:(id)a4 animator:(id)a5;
- (void)pointerInteraction:(id)a3 willExitRegion:(id)a4 animator:(id)a5;
- (void)setAdjustsImageSizeForAccessibilityContentSizeCategory:(BOOL)a3;
- (void)setAdjustsImageWhenDisabled:(BOOL)adjustsImageWhenDisabled;
- (void)setAdjustsImageWhenHighlighted:(BOOL)adjustsImageWhenHighlighted;
- (void)setAttributedTitle:(NSAttributedString *)title forState:(UIControlState)state;
- (void)setAutomaticallyUpdatesConfiguration:(BOOL)automaticallyUpdatesConfiguration;
- (void)setAutosizesToFit:(BOOL)a3;
- (void)setBackgroundImage:(UIImage *)image forState:(UIControlState)state;
- (void)setBackgroundImage:(id)a3 forStates:(unint64_t)a4;
- (void)setBounds:(CGRect)a3;
- (void)setChangesSelectionAsPrimaryAction:(BOOL)changesSelectionAsPrimaryAction;
- (void)setConfigurationUpdateHandler:(UIButtonConfigurationUpdateHandler)configurationUpdateHandler;
- (void)setContentEdgeInsets:(UIEdgeInsets)contentEdgeInsets;
- (void)setContentHorizontalAlignment:(int64_t)a3;
- (void)setContentVerticalAlignment:(int64_t)a3;
- (void)setDisabledDimsImage:(BOOL)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setFrame:(CGRect)a3;
- (void)setHighlighted:(BOOL)a3;
- (void)setImage:(UIImage *)image forState:(UIControlState)state;
- (void)setImage:(id)a3 forStates:(unint64_t)a4;
- (void)setImageEdgeInsets:(UIEdgeInsets)imageEdgeInsets;
- (void)setMenu:(UIMenu *)menu;
- (void)setNeedsLayout;
- (void)setNeedsUpdateConfiguration;
- (void)setPointerStyleProvider:(UIButtonPointerStyleProvider)pointerStyleProvider;
- (void)setPreferredBehavioralStyle:(UIBehavioralStyle)preferredBehavioralStyle;
- (void)setPreferredMenuElementOrder:(UIContextMenuConfigurationElementOrder)preferredMenuElementOrder;
- (void)setPreferredSymbolConfiguration:(UIImageSymbolConfiguration *)configuration forImageInState:(UIControlState)state;
- (void)setPrefersHorizontalMenuAttachment:(BOOL)a3;
- (void)setReversesTitleShadowWhenHighlighted:(BOOL)reversesTitleShadowWhenHighlighted;
- (void)setRole:(UIButtonRole)role;
- (void)setSelected:(BOOL)a3;
- (void)setSelectionInteraction:(id)a3;
- (void)setSemanticContentAttribute:(int64_t)a3;
- (void)setShowsMenuAsPrimaryAction:(BOOL)a3;
- (void)setShowsTouchWhenHighlighted:(BOOL)showsTouchWhenHighlighted;
- (void)setSpringLoaded:(BOOL)a3;
- (void)setTintColor:(UIColor *)tintColor;
- (void)setTitle:(NSString *)title forState:(UIControlState)state;
- (void)setTitle:(id)a3 forStates:(unint64_t)a4;
- (void)setTitleColor:(UIColor *)color forState:(UIControlState)state;
- (void)setTitleColor:(id)a3 forStates:(unint64_t)a4;
- (void)setTitleEdgeInsets:(UIEdgeInsets)titleEdgeInsets;
- (void)setTitleShadowColor:(UIColor *)color forState:(UIControlState)state;
- (void)setTitleShadowColor:(id)a3 forStates:(unint64_t)a4;
- (void)tintColorDidChange;
- (void)traitCollectionDidChange:(id)a3;
- (void)updateConstraints;
@end

@implementation UIButton

uint64_t __117__UIButton_UIAccessibilityContentSizeCategoryImageAdjusting__setAdjustsImageSizeForAccessibilityContentSizeCategory___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) sizeToFit];
}

- (void)setHighlighted:(BOOL)a3
{
}

- (void)_setHighlighted:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  *(void *)&self->_buttonFlags &= ~0x4000000uLL;
  if ([(UIControl *)self isHighlighted] != a3)
  {
    v8.receiver = self;
    v8.super_class = (Class)UIButton;
    [(UIControl *)&v8 setHighlighted:v5];
    v7 = [(UIButton *)self _visualProvider];
    [v7 setHighlighted:v5 animated:v4];
  }
}

- (void)layoutSubviews
{
  v3 = [(UIButton *)self _visualProvider];
  [v3 layoutSubviews];

  if ((*(void *)&self->super.super._viewFlags & 0x800000000000000) != 0)
  {
    v4.receiver = self;
    v4.super_class = (Class)UIButton;
    [(UIView *)&v4 layoutSubviews];
  }
}

- (void)traitCollectionDidChange:(id)a3
{
  BOOL v5 = a3;
  v6 = [(UIButton *)self _visualProvider];
  [v6 traitCollectionDidChange:v5];

  __int16 buttonVisualProviderFlags = (__int16)self->_buttonVisualProviderFlags;
  if (buttonVisualProviderFlags)
  {
    if ((buttonVisualProviderFlags & 0x20) == 0)
    {
LABEL_12:
      objc_super v8 = 0;
      goto LABEL_18;
    }
LABEL_6:
    v9 = [(UIButton *)self _visualProvider];
    if (![v9 adjustsFontForContentSizeCategory]
      || ([(UIView *)self traitCollection],
          (v10 = objc_claimAutoreleasedReturnValue()) == 0))
    {

      objc_super v8 = 0;
      if (buttonVisualProviderFlags) {
        goto LABEL_18;
      }
      goto LABEL_17;
    }
    if (v5)
    {
      uint64_t v11 = v10[13];
      uint64_t v12 = v5[13];

      if ((buttonVisualProviderFlags & 1) == 0) {
      if (v11 == v12)
      }
        goto LABEL_12;
    }
    else
    {

      if ((buttonVisualProviderFlags & 1) == 0) {
    }
      }
    v3 = [(UIButton *)self _visualProvider];
    objc_super v8 = [v3 font];
    goto LABEL_17;
  }
  v3 = [(UIButton *)self _visualProvider];
  if (v3 && (*(_WORD *)&self->_buttonVisualProviderFlags & 0x20) != 0) {
    goto LABEL_6;
  }
  objc_super v8 = 0;
LABEL_17:

LABEL_18:
  __int16 v13 = (__int16)self->_buttonVisualProviderFlags;
  LOBYTE(v14) = v13;
  if ((v13 & 1) == 0)
  {
    v3 = [(UIButton *)self _visualProvider];
    if (!v3)
    {
LABEL_28:

      goto LABEL_29;
    }
    __int16 v14 = (__int16)self->_buttonVisualProviderFlags;
  }
  if ((v14 & 0x20) == 0 || ![(UIButton *)self _fontIsDefaultForIdiom])
  {
    if (v13) {
      goto LABEL_29;
    }
    goto LABEL_28;
  }
  v15 = [(UIView *)self traitCollection];
  uint64_t v16 = [v15 userInterfaceIdiom];
  uint64_t v17 = [v5 userInterfaceIdiom];

  if ((v13 & 1) == 0) {
  if (v16 != v17)
  }
  {
    v3 = [(UIButton *)self _visualProvider];
    uint64_t v18 = [v3 font];

    [(UIButton *)self _setDefaultFontForIdiom];
    objc_super v8 = (void *)v18;
  }
LABEL_29:
  if ([(UIButton *)self _isCarPlaySystemTypeButton]) {
    [(UIButton *)self _applyCarPlaySystemButtonCustomizations];
  }
  v27.receiver = self;
  v27.super_class = (Class)UIButton;
  [(UIView *)&v27 traitCollectionDidChange:v5];
  if (v8)
  {
    __int16 v19 = (__int16)self->_buttonVisualProviderFlags;
    if (v19)
    {
      if ((v19 & 0x20) == 0) {
        goto LABEL_41;
      }
    }
    else
    {
      v20 = [(UIButton *)self _visualProvider];
      v3 = v20;
      if (!v20 || (*(_WORD *)&self->_buttonVisualProviderFlags & 0x20) == 0)
      {

        goto LABEL_41;
      }
    }
    v21 = [(UIButton *)self _visualProvider];
    v22 = [v21 font];
    int v23 = [v8 isEqual:v22];

    if (v19)
    {
      if (v23) {
        goto LABEL_41;
      }
    }
    else
    {

      if (v23) {
        goto LABEL_41;
      }
    }
LABEL_47:
    [(UIView *)self _invalidateIntrinsicContentSizeNeedingLayout:1];
    goto LABEL_48;
  }
LABEL_41:
  if ([(UIButton *)self adjustsImageSizeForAccessibilityContentSizeCategory])
  {
    v24 = [(UIView *)self traitCollection];
    if (v24)
    {
      if (v5)
      {
        uint64_t v25 = v24[13];
        uint64_t v26 = v5[13];

        if (v25 == v26) {
          goto LABEL_48;
        }
      }
      else
      {
      }
      goto LABEL_47;
    }
  }
LABEL_48:
}

- (void)_setActiveSizeToFitLayoutEngine:(id)a3
{
}

- (void)setBounds:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  [(UIView *)self bounds];
  double v9 = v8;
  double v11 = v10;
  v20.receiver = self;
  v20.super_class = (Class)UIButton;
  -[UIView setBounds:](&v20, sel_setBounds_, x, y, width, height);
  if (v9 != width || v11 != height) {
    goto LABEL_5;
  }
  if ((~*(void *)&self->super.super._viewFlags & 0x220000000000000) != 0) {
    return;
  }
  __int16 buttonVisualProviderFlags = (__int16)self->_buttonVisualProviderFlags;
  if (buttonVisualProviderFlags)
  {
    if ((buttonVisualProviderFlags & 4) == 0) {
      return;
    }
LABEL_5:
    [(UIButton *)self setNeedsLayout];
    __int16 v13 = (__int16)self->_buttonVisualProviderFlags;
    if (v13)
    {
      if ((v13 & 4) == 0) {
        return;
      }
    }
    else
    {
      __int16 v14 = [(UIButton *)self _visualProvider];
      if (!v14) {
        return;
      }
      __int16 v15 = (__int16)self->_buttonVisualProviderFlags;

      if ((v15 & 4) == 0) {
        return;
      }
    }
    __int16 v19 = [(UIButton *)self _visualProvider];
    [v19 invalidateLayoutData];

    return;
  }
  uint64_t v17 = [(UIButton *)self _visualProvider];
  if (v17)
  {
    __int16 v18 = (__int16)self->_buttonVisualProviderFlags;

    if ((v18 & 4) != 0) {
      goto LABEL_5;
    }
  }
}

- (BOOL)_unconditionallyWantsSetBoundsFromISEngineLayout
{
  __int16 buttonVisualProviderFlags = (__int16)self->_buttonVisualProviderFlags;
  if (buttonVisualProviderFlags)
  {
    if ((buttonVisualProviderFlags & 4) != 0) {
      return 1;
    }
  }
  else
  {
    v2 = [(UIButton *)self _visualProvider];
    if (v2 && (*(_WORD *)&self->_buttonVisualProviderFlags & 4) != 0)
    {
      BOOL v5 = 1;
LABEL_7:

      return v5;
    }
  }
  v7.receiver = self;
  v7.super_class = (Class)UIButton;
  BOOL v5 = [(UIView *)&v7 _unconditionallyWantsSetBoundsFromISEngineLayout];
  if ((buttonVisualProviderFlags & 1) == 0) {
    goto LABEL_7;
  }
  return v5;
}

- (id)_imageForState:(unint64_t)a3 applyingConfiguration:(BOOL)a4 usesImageForNormalState:(BOOL *)a5
{
  BOOL v6 = a4;
  double v9 = -[UIButton _contentForState:](self, "_contentForState:");
  double v10 = [v9 image];

  if (v10)
  {
LABEL_2:
    BOOL v11 = 0;
    if (!v6) {
      goto LABEL_9;
    }
    goto LABEL_6;
  }
  uint64_t v12 = [(UIButton *)self _contentForState:0];
  double v10 = [v12 image];

  if (!v10)
  {
    __int16 v19 = [(UIButton *)self _preferredConfigurationForState:a3];
    double v10 = [(UIButton *)self _defaultImageForState:a3 withConfiguration:v19];

    if (v10) {
      goto LABEL_2;
    }
    objc_super v20 = [(UIButton *)self _preferredConfigurationForState:a3];
    double v10 = [(UIButton *)self _defaultImageForState:0 withConfiguration:v20];
  }
  BOOL v11 = 1;
  if (!v6) {
    goto LABEL_9;
  }
LABEL_6:
  if ([v10 _isSymbolImage])
  {
    uint64_t v13 = [(UIButton *)self _preferredConfigurationForState:a3];
    if (v13)
    {
      __int16 v14 = (void *)v13;
      __int16 v15 = [v10 symbolConfiguration];
      uint64_t v16 = [v14 configurationByApplyingConfiguration:v15];

      uint64_t v17 = [v10 imageWithConfiguration:v16];

      double v10 = (void *)v17;
    }
  }
LABEL_9:
  if (a5) {
    *a5 = v11;
  }
  return v10;
}

- (id)_preferredConfigurationForState:(unint64_t)a3 includeDefault:(BOOL)a4
{
  BOOL v4 = a4;
  objc_super v7 = -[UIButton _contentForState:](self, "_contentForState:");
  double v8 = [v7 preferredSymbolConfiguration];

  if (!v8)
  {
    BOOL v11 = [(UIButton *)self _contentForState:0];
    double v8 = [v11 preferredSymbolConfiguration];

    if (v4 && !v8)
    {
      uint64_t v12 = (*(void *)&self->_buttonFlags >> 6);
      uint64_t v13 = [(UIView *)self traitCollection];
      double v8 = +[UIButton _defaultSymbolConfigurationForType:andState:compact:idiom:](UIButton, "_defaultSymbolConfigurationForType:andState:compact:idiom:", v12, a3, 0, [v13 userInterfaceIdiom]);

      if (!v8)
      {
        uint64_t v14 = (*(void *)&self->_buttonFlags >> 6);
        __int16 v15 = [(UIView *)self traitCollection];
        double v8 = +[UIButton _defaultSymbolConfigurationForType:andState:compact:idiom:](UIButton, "_defaultSymbolConfigurationForType:andState:compact:idiom:", v14, 0, 0, [v15 userInterfaceIdiom]);
      }
    }
  }
  id v9 = v8;

  return v9;
}

- (id)_contentForState:(unint64_t)a3
{
  contentLookup = self->_contentLookup;
  if (contentLookup)
  {
    if ((~(_BYTE)a3 & 3) == 0) {
      a3 &= ~2uLL;
    }
    BOOL v4 = [NSNumber numberWithUnsignedInteger:a3];
    contentLookup = [contentLookup objectForKeyedSubscript:v4];
  }
  return contentLookup;
}

- (id)_preferredConfigurationForState:(unint64_t)a3
{
  return [(UIButton *)self _preferredConfigurationForState:a3 includeDefault:1];
}

+ (id)_defaultImageForType:(int64_t)a3 andState:(unint64_t)a4 withConfiguration:(id)a5
{
  id v8 = a5;
  id v9 = [a1 _defaultImageNameForType:a3 andState:a4];
  double v10 = v9;
  switch(a3)
  {
    case 'v':
      BOOL v11 = @"exclamationmark.circle";
      uint64_t v12 = @"UIAccessoryButtonExclamationMark";
      goto LABEL_13;
    case 'w':
      BOOL v11 = @"questionmark.circle";
      uint64_t v12 = @"UIAccessoryButtonQuestionMark";
      goto LABEL_13;
    case 'x':
      BOOL v11 = @"checkmark.circle";
      uint64_t v12 = @"UIAccessoryButtonCheckmark";
      goto LABEL_13;
    case 'y':
      BOOL v11 = @"minus.circle";
      uint64_t v12 = @"UIAccessoryButtonMinus";
      goto LABEL_13;
    case 'z':
      BOOL v11 = @"xmark.circle";
      uint64_t v12 = @"UIAccessoryButtonX";
      goto LABEL_13;
    case '{':
      uint64_t v12 = 0;
      BOOL v11 = @"chevron.forward.circle";
LABEL_13:

      double v10 = v11;
      goto LABEL_14;
    default:
      int64_t v13 = a3 - 2;
      BOOL v11 = @"info.circle";
      uint64_t v12 = @"UIAccessoryButtonInfo";
      switch(v13)
      {
        case 0:
          goto LABEL_13;
        case 1:
        case 2:
          if (!a4) {
            goto LABEL_13;
          }
          break;
        case 3:
          BOOL v11 = @"plus.circle";
          uint64_t v12 = @"UIAccessoryButtonPlus";
          goto LABEL_13;
        default:
          break;
      }
      uint64_t v12 = 0;
      uint64_t v14 = 0;
      __int16 v15 = 0;
      if (!v9) {
        goto LABEL_15;
      }
LABEL_14:
      __int16 v15 = +[UIImage _systemImageNamed:v10 fallback:v12 withConfiguration:v8];
      uint64_t v14 = v10;
LABEL_15:

      return v15;
  }
}

+ (id)_defaultImageNameForType:(int64_t)a3 andState:(unint64_t)a4
{
  if (a3 == 7) {
    return @"xmark";
  }
  else {
    return 0;
  }
}

- (id)_defaultImageForState:(unint64_t)a3 withConfiguration:(id)a4
{
  return +[UIButton _defaultImageForType:(*(void *)&self->_buttonFlags >> 6) andState:a3 withConfiguration:a4];
}

+ (id)_defaultSymbolConfigurationForType:(int64_t)a3 andState:(unint64_t)a4 compact:(BOOL)a5 idiom:(int64_t)a6
{
  if (a3 != 7)
  {
    if (!a3)
    {
      BOOL v6 = +[UIImageSymbolConfiguration configurationWithScale:](UIImageSymbolConfiguration, "configurationWithScale:", 2, a4, a5, a6);
      goto LABEL_14;
    }
    objc_super v7 = @"UICTFontTextStyleBody";
    uint64_t v8 = 3;
    goto LABEL_7;
  }
  if (a6 == 6)
  {
    objc_super v7 = @"UICTFontTextStyleTitle3";
    uint64_t v8 = 2;
LABEL_7:
    BOOL v6 = +[UIImageSymbolConfiguration configurationWithTextStyle:scale:](UIImageSymbolConfiguration, "configurationWithTextStyle:scale:", v7, v8, a5);
    goto LABEL_14;
  }
  double v9 = 15.0;
  if (a6 == 5) {
    double v9 = 12.0;
  }
  if (a5) {
    uint64_t v10 = 1;
  }
  else {
    uint64_t v10 = 2;
  }
  BOOL v6 = +[UIImageSymbolConfiguration configurationWithPointSize:7 weight:v10 scale:v9];
LABEL_14:
  return v6;
}

- (BOOL)_needsDoubleUpdateConstraintsPass
{
  __int16 buttonVisualProviderFlags = (__int16)self->_buttonVisualProviderFlags;
  if (buttonVisualProviderFlags)
  {
    if ((buttonVisualProviderFlags & 4) != 0)
    {
LABEL_4:
      BOOL v6 = [(UIButton *)self _visualProvider];
      char v7 = [v6 hasMultilineText];

      return v7;
    }
  }
  else
  {
    BOOL v4 = [(UIButton *)self _visualProvider];
    if (v4)
    {
      __int16 v5 = (__int16)self->_buttonVisualProviderFlags;

      if ((v5 & 4) != 0) {
        goto LABEL_4;
      }
    }
  }
  return 0;
}

- (void)updateConstraints
{
  v3 = [(UIButton *)self _visualProvider];
  [v3 updateConstraints];

  v4.receiver = self;
  v4.super_class = (Class)UIButton;
  [(UIView *)&v4 updateConstraints];
}

- (BOOL)adjustsImageSizeForAccessibilityContentSizeCategory
{
  return *((unsigned char *)&self->_buttonFlags + 4) & 1;
}

- (BOOL)_shouldInvalidateBaselineConstraintsForSize:(CGSize)a3 oldSize:(CGSize)a4
{
  double height = a4.height;
  double width = a4.width;
  double v6 = a3.height;
  double v7 = a3.width;
  __int16 buttonVisualProviderFlags = (__int16)self->_buttonVisualProviderFlags;
  if (buttonVisualProviderFlags)
  {
    if ((buttonVisualProviderFlags & 4) != 0) {
      goto LABEL_4;
    }
LABEL_9:
    v15.receiver = self;
    v15.super_class = (Class)UIButton;
    return -[UIView _shouldInvalidateBaselineConstraintsForSize:oldSize:](&v15, sel__shouldInvalidateBaselineConstraintsForSize_oldSize_, v7, v6, width, height);
  }
  uint64_t v10 = [(UIButton *)self _visualProvider];
  if (!v10) {
    goto LABEL_9;
  }
  __int16 v11 = (__int16)self->_buttonVisualProviderFlags;

  if ((v11 & 4) == 0) {
    goto LABEL_9;
  }
LABEL_4:
  if ((*(void *)&self->super.super._viewFlags & 0x200000000000000) != 0 || v7 == width && v6 == height) {
    return 0;
  }
  int64_t v13 = [(UIButton *)self _visualProvider];
  char v14 = [v13 vendsBaselineInformationToAutoLayout];

  return v14;
}

- (BOOL)_wantsBaselineUpdatingFollowingConstraintsPass
{
  __int16 buttonVisualProviderFlags = (__int16)self->_buttonVisualProviderFlags;
  if (buttonVisualProviderFlags)
  {
    if ((buttonVisualProviderFlags & 4) != 0)
    {
LABEL_4:
      double v6 = [(UIButton *)self _visualProvider];
      char v7 = [v6 vendsBaselineInformationToAutoLayout];

      return v7;
    }
  }
  else
  {
    objc_super v4 = [(UIButton *)self _visualProvider];
    if (v4)
    {
      __int16 v5 = (__int16)self->_buttonVisualProviderFlags;

      if ((v5 & 4) != 0) {
        goto LABEL_4;
      }
    }
  }
  v9.receiver = self;
  v9.super_class = (Class)UIButton;
  return [(UIView *)&v9 _wantsBaselineUpdatingFollowingConstraintsPass];
}

- (CGSize)systemLayoutSizeFittingSize:(CGSize)a3 withHorizontalFittingPriority:(float)a4 verticalFittingPriority:(float)a5
{
  double height = a3.height;
  double width = a3.width;
  __int16 buttonVisualProviderFlags = (__int16)self->_buttonVisualProviderFlags;
  if ((buttonVisualProviderFlags & 1) == 0)
  {
    __int16 v11 = [(UIButton *)self _visualProvider];
    if (v11)
    {
      __int16 v12 = (__int16)self->_buttonVisualProviderFlags;

      if ((v12 & 4) != 0) {
        goto LABEL_4;
      }
    }
LABEL_6:
    v24.receiver = self;
    v24.super_class = (Class)UIButton;
    *(float *)&double v22 = a4;
    *(float *)&double v23 = a5;
    -[UIView systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:](&v24, sel_systemLayoutSizeFittingSize_withHorizontalFittingPriority_verticalFittingPriority_, width, height, v22, v23);
    goto LABEL_7;
  }
  if ((buttonVisualProviderFlags & 4) == 0) {
    goto LABEL_6;
  }
LABEL_4:
  int64_t v13 = [(UIButton *)self _visualProvider];
  *(float *)&double v14 = a4;
  *(float *)&double v15 = a5;
  objc_msgSend(v13, "systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:", width, height, v14, v15);
  double v17 = v16;
  double v19 = v18;

  double v20 = v17;
  double v21 = v19;
LABEL_7:
  result.double height = v21;
  result.double width = v20;
  return result;
}

- (CGSize)_intrinsicSizeWithinSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  __int16 v5 = [(UIButton *)self _visualProvider];
  objc_msgSend(v5, "intrinsicSizeWithinSize:", width, height);
  double v7 = v6;
  double v9 = v8;

  double v10 = v7;
  double v11 = v9;
  result.double height = v11;
  result.double width = v10;
  return result;
}

- (void)_setVisualProvider:(id)a3
{
  p_visualProvider = &self->_visualProvider;
  id v20 = a3;
  -[UIButtonVisualProvider cleanupForVisualProvider:](*p_visualProvider, "cleanupForVisualProvider:");
  __int16 buttonVisualProviderFlags = (__int16)self->_buttonVisualProviderFlags;
  if ((buttonVisualProviderFlags & 2) != 0)
  {
    [(UIButtonVisualProvider *)*p_visualProvider setButton:0];
    __int16 buttonVisualProviderFlags = (__int16)self->_buttonVisualProviderFlags;
  }
  *(_WORD *)&self->___int16 buttonVisualProviderFlags = buttonVisualProviderFlags | 1;
  if (objc_opt_respondsToSelector()) {
    __int16 v7 = 2;
  }
  else {
    __int16 v7 = 0;
  }
  *(_WORD *)&self->___int16 buttonVisualProviderFlags = *(_WORD *)&self->_buttonVisualProviderFlags & 0xFFFD | v7;
  if (objc_opt_respondsToSelector()) {
    __int16 v8 = 4;
  }
  else {
    __int16 v8 = 0;
  }
  *(_WORD *)&self->___int16 buttonVisualProviderFlags = *(_WORD *)&self->_buttonVisualProviderFlags & 0xFFFB | v8;
  if (objc_opt_respondsToSelector()) {
    __int16 v9 = 8;
  }
  else {
    __int16 v9 = 0;
  }
  *(_WORD *)&self->___int16 buttonVisualProviderFlags = *(_WORD *)&self->_buttonVisualProviderFlags & 0xFFF7 | v9;
  if (objc_opt_respondsToSelector()) {
    __int16 v10 = 16;
  }
  else {
    __int16 v10 = 0;
  }
  *(_WORD *)&self->___int16 buttonVisualProviderFlags = *(_WORD *)&self->_buttonVisualProviderFlags & 0xFFEF | v10;
  if (objc_opt_respondsToSelector()) {
    __int16 v11 = 32;
  }
  else {
    __int16 v11 = 0;
  }
  *(_WORD *)&self->___int16 buttonVisualProviderFlags = *(_WORD *)&self->_buttonVisualProviderFlags & 0xFFDF | v11;
  char v12 = objc_opt_respondsToSelector();
  __int16 v13 = (__int16)self->_buttonVisualProviderFlags;
  if (v12) {
    __int16 v14 = 64;
  }
  else {
    __int16 v14 = 0;
  }
  *(_WORD *)&self->___int16 buttonVisualProviderFlags = v13 & 0xFFBF | v14;
  if ((v13 & 2) != 0) {
    [v20 setButton:self];
  }
  objc_storeStrong((id *)&self->_visualProvider, a3);
  double v15 = [(UIButton *)self titleForState:0];
  [v20 setTitle:v15 forState:0];

  double v16 = [(UIButton *)self attributedTitleForState:0];
  [v20 setAttributedTitle:v16 forState:0];

  double v17 = [(UIButton *)self imageForState:0];
  [v20 setImage:v17 forState:0];

  objc_msgSend(v20, "setEnabled:", -[UIControl isEnabled](self, "isEnabled"));
  objc_msgSend(v20, "setSelected:", -[UIControl isSelected](self, "isSelected"));
  if ((*(_WORD *)&self->_buttonVisualProviderFlags & 4) != 0)
  {
    if (self->_configuration)
    {
      double v18 = [(UIButton *)self _visualProvider];
      [v18 automaticallyUpdateConfigurationIfNecessary:self->_configuration];
      [v18 applyConfiguration];
    }
    else
    {
      [(UIButton *)self setNeedsUpdateConfiguration];
    }
  }
  objc_msgSend(v20, "setContextMenuIsPrimary:", -[UIControl showsMenuAsPrimaryAction](self, "showsMenuAsPrimaryAction"));
  [(UIView *)self invalidateIntrinsicContentSize];
  double v19 = [(UIButton *)self menu];
  [v20 setMenu:v19];
}

- (void)_setInternalTitlePaddingInsets:(UIEdgeInsets)a3
{
  self->_internalTitlePaddingInsets = a3;
}

- (id)_titleForState:(unint64_t)a3
{
  objc_super v4 = [(UIButton *)self _contentForState:a3];
  __int16 v5 = [v4 title];

  if (!v5)
  {
    double v6 = [(UIButton *)self _contentForState:0];
    __int16 v5 = [v6 title];
  }
  return v5;
}

- (id)_attributedTitleForState:(unint64_t)a3
{
  __int16 v5 = [(UIView *)self traitCollection];
  double v6 = [(UIButton *)self _attributedTitleForState:a3 adjustedToTraitCollection:v5];

  return v6;
}

- (id)_attributedTitleForState:(unint64_t)a3 adjustedToTraitCollection:(id)a4
{
  id v6 = a4;
  __int16 v7 = [(UIButton *)self _contentForState:a3];
  uint64_t v8 = [v7 attributedTitle];
  if (v8)
  {
    __int16 v9 = (void *)v8;
  }
  else
  {
    __int16 v10 = [(UIButton *)self _contentForState:0];
    __int16 v9 = [v10 attributedTitle];

    if (!v9) {
      goto LABEL_11;
    }
  }
  __int16 v11 = [(UIButton *)self _visualProvider];
  if ([v11 adjustsFontForContentSizeCategory])
  {
    BOOL v12 = [(UIButton *)self _shouldAdjustToTraitCollection];

    if (!v12) {
      goto LABEL_11;
    }
    uint64_t v13 = objc_msgSend(v9, "_ui_attributedStringAdjustedToTraitCollection:", v6);
    __int16 v11 = (void *)v13;
    if (v13) {
      __int16 v14 = (void *)v13;
    }
    else {
      __int16 v14 = v9;
    }
    id v15 = v14;

    __int16 v9 = v15;
  }

LABEL_11:
  return v9;
}

- (BOOL)_canHaveTitle
{
  return ((*(void *)&self->_buttonFlags >> 6) & 0xFEuLL) - 6 < 0xFFFFFFFFFFFFFFFCLL;
}

- (BOOL)_likelyToHaveTitle
{
  if (![(UIButton *)self _canHaveTitle]) {
    return 0;
  }
  if ((*(_WORD *)&self->_buttonFlags & 0x3FC0) != 0) {
    return 1;
  }
  objc_super v4 = [(UIButton *)self backgroundImageForState:0];
  __int16 v5 = v4;
  if (v4) {
    char v3 = [v4 _isResizable];
  }
  else {
    char v3 = 1;
  }

  return v3;
}

- (CGRect)contentRectForBounds:(CGRect)bounds
{
  double height = bounds.size.height;
  double width = bounds.size.width;
  double y = bounds.origin.y;
  double x = bounds.origin.x;
  __int16 v7 = [(UIButton *)self _visualProvider];
  objc_msgSend(v7, "contentRectForBounds:", x, y, width, height);
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;

  double v16 = v9;
  double v17 = v11;
  double v18 = v13;
  double v19 = v15;
  result.size.double height = v19;
  result.size.double width = v18;
  result.origin.double y = v17;
  result.origin.double x = v16;
  return result;
}

- (UIEdgeInsets)alignmentRectInsets
{
  v2 = [(UIButton *)self _visualProvider];
  [v2 alignmentRectInsets];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;

  double v11 = v4;
  double v12 = v6;
  double v13 = v8;
  double v14 = v10;
  result.right = v14;
  result.bottom = v13;
  result.left = v12;
  result.top = v11;
  return result;
}

- (id)_imageView
{
  v2 = [(UIButton *)self _visualProvider];
  double v3 = [v2 imageViewCreateIfNeeded:0];

  return v3;
}

- (UIButtonVisualProvider)_visualProvider
{
  visualProvider = self->_visualProvider;
  if (!visualProvider)
  {
    [(UIButton *)self _refreshVisualProvider];
    visualProvider = self->_visualProvider;
  }
  return visualProvider;
}

- (id)_backgroundForState:(unint64_t)a3 usesBackgroundForNormalState:(BOOL *)a4
{
  double v7 = -[UIButton _contentForState:](self, "_contentForState:");
  double v8 = [v7 background];

  if (v8)
  {
LABEL_2:
    BOOL v9 = 0;
    if (!a4) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  double v11 = [(UIButton *)self _contentForState:0];
  double v8 = [v11 background];

  if (!v8)
  {
    uint64_t v12 = +[UIButton _defaultBackgroundImageForType:(*(void *)&self->_buttonFlags >> 6) andState:a3];
    if (v12)
    {
      double v8 = (void *)v12;
      goto LABEL_2;
    }
    double v8 = +[UIButton _defaultBackgroundImageForType:(*(void *)&self->_buttonFlags >> 6) andState:0];
  }
  BOOL v9 = 1;
  if (a4) {
LABEL_3:
  }
    *a4 = v9;
LABEL_4:
  return v8;
}

+ (id)_defaultBackgroundImageForType:(int64_t)a3 andState:(unint64_t)a4
{
  double v7 = [a1 _defaultBackgroundImageNameForType:a3 andState:a4 compact:0];
  if (v7)
  {
    double v8 = +[UIImage kitImageNamed:v7];
    BOOL v9 = [a1 _defaultBackgroundImageColorForType:a3 andState:a4];
    if (v9)
    {
      uint64_t v10 = [v8 imageWithTintColor:v9];

      double v8 = (void *)v10;
    }
  }
  else
  {
    double v8 = 0;
  }

  return v8;
}

+ (id)_defaultBackgroundImageNameForType:(int64_t)a3 andState:(unint64_t)a4 compact:(BOOL)a5
{
  if (a3 == 7)
  {
    double v6 = @"UICloseButtonBackground";
    if (a5) {
      double v6 = @"UICloseButtonBackgroundCompact";
    }
    double v7 = v6;
  }
  else
  {
    double v7 = 0;
  }
  return v7;
}

- (UIImage)backgroundImageForState:(UIControlState)state
{
  return (UIImage *)[(UIButton *)self _backgroundForState:state usesBackgroundForNormalState:0];
}

- (void)_refreshVisualProvider
{
  id v3 = [(UIView *)self traitCollection];
  [(UIButton *)self _refreshVisualProviderForTraitCollection:v3];
}

- (void)_refreshVisualProviderForTraitCollection:(id)a3
{
}

- (void)_refreshVisualProviderForTraitCollection:(id)a3 populatingAPIProperties:(BOOL)a4
{
  uint64_t v5 = -[UIButton visualProviderClassForTraitCollection:](self, "visualProviderClassForTraitCollection:", a3, a4);
  if (v5)
  {
    double v6 = v5;
    [(UIButton *)self _setVisualProvider:v5];
    uint64_t v5 = v6;
  }
}

- (id)visualProviderClassForTraitCollection:(id)a3
{
  uint64_t v4 = [a3 userInterfaceIdiom];
  uint64_t v5 = (void *)[(id)objc_opt_class() _visualProviderClass];
  if (v5) {
    goto LABEL_3;
  }
  uint64_t v5 = (void *)[(id)objc_opt_class() _visualProviderClassForIdiom:v4];
  if (v5) {
    goto LABEL_3;
  }
  double v11 = (void *)__UIButtonIdiomsToVisualProviderClasses;
  uint64_t v12 = [NSNumber numberWithInteger:v4];
  double v13 = [v11 objectForKey:v12];

  if (v13)
  {
    uint64_t v5 = (void *)[v13 objectForKeyedSubscript:&unk_1ED3F3AF8];
    uint64_t v14 = [v13 objectForKeyedSubscript:&unk_1ED3F3B10];
    if (self->_configuration || self->_configurationUpdateHandler)
    {
      if (!v5) {
        uint64_t v5 = (void *)v14;
      }
      if (v5)
      {
LABEL_19:

        goto LABEL_3;
      }
    }
    else
    {
      if (v14) {
        uint64_t v5 = (void *)v14;
      }
      if (v5) {
        goto LABEL_19;
      }
    }
    double v15 = [v13 objectEnumerator];
    uint64_t v5 = (void *)[v15 nextObject];

    if (v5) {
      goto LABEL_3;
    }
  }
  if (v4 != 2 && v4 != 8 || (uint64_t v5 = objc_opt_class()) == 0) {
    uint64_t v5 = objc_opt_class();
  }
LABEL_3:
  if (self->_visualProvider
    && v5 == objc_opt_class()
    && ![v5 requiresNewVisualProviderForChanges])
  {
    BOOL v9 = 0;
  }
  else
  {
    double v6 = [v5 visualProviderForButton:self];
    double v7 = v6;
    if (v6)
    {
      id v8 = v6;
    }
    else
    {
      id v8 = +[UIButtonLegacyVisualProvider visualProviderForButton:self];
    }
    BOOL v9 = v8;
  }
  return v9;
}

+ (Class)_visualProviderClass
{
  return 0;
}

+ (Class)_visualProviderClassForIdiom:(int64_t)a3
{
  return 0;
}

- (NSAttributedString)attributedTitleForState:(UIControlState)state
{
  return (NSAttributedString *)[(UIButton *)self _attributedTitleForState:state adjustedToTraitCollection:0];
}

- (UIMenu)menu
{
  return self->_menu;
}

- (BOOL)_contentHuggingDefault_isUsuallyFixedWidth
{
  return (unint64_t)([(UIButton *)self _buttonType] - 2) < 4;
}

- (BOOL)_contentHuggingDefault_isUsuallyFixedHeight
{
  return (unint64_t)([(UIButton *)self _buttonType] - 2) < 4;
}

- (CGSize)intrinsicContentSize
{
  __int16 buttonVisualProviderFlags = (__int16)self->_buttonVisualProviderFlags;
  if ((buttonVisualProviderFlags & 1) == 0)
  {
    uint64_t v4 = [(UIButton *)self _visualProvider];
    if (v4)
    {
      __int16 v5 = (__int16)self->_buttonVisualProviderFlags;

      if ((v5 & 4) != 0) {
        goto LABEL_4;
      }
    }
LABEL_6:
    v13.receiver = self;
    v13.super_class = (Class)UIButton;
    [(UIView *)&v13 intrinsicContentSize];
    goto LABEL_7;
  }
  if ((buttonVisualProviderFlags & 4) == 0) {
    goto LABEL_6;
  }
LABEL_4:
  double v6 = [(UIButton *)self _visualProvider];
  [v6 intrinsicContentSize];
  double v8 = v7;
  double v10 = v9;

  double v11 = v8;
  double v12 = v10;
LABEL_7:
  result.double height = v12;
  result.double width = v11;
  return result;
}

- (int64_t)_imageContentMode
{
  return self->__imageContentMode;
}

- (BOOL)_isSystemProvidedButton
{
  id v3 = objc_opt_class();
  int64_t v4 = [(UIButton *)self _buttonType];
  return [v3 _buttonTypeIsSystemProvided:v4];
}

+ (id)_defaultImageColorForState:(unint64_t)a3 button:(id)a4
{
  id v6 = a4;
  if ([v6 _isInCarPlay])
  {
    double v7 = [v6 _externalImageColorForState:a3];
  }
  else
  {
    double v7 = 0;
  }
  if ([v6 _isModernButton] && (objc_msgSend(v6, "isEnabled") & 1) == 0)
  {
    uint64_t v8 = [v6 _disabledColor];

    double v7 = (void *)v8;
  }
  if (!v7)
  {
    uint64_t v9 = [v6 buttonType];
    double v10 = [v6 traitCollection];
    double v7 = objc_msgSend(a1, "_defaultImageColorForType:andState:idiom:", v9, a3, objc_msgSend(v10, "userInterfaceIdiom"));
  }
  return v7;
}

- (BOOL)_hasDrawingStyle
{
  uint64_t v9 = 0;
  double v10 = &v9;
  uint64_t v11 = 0x2020000000;
  char v12 = 0;
  contentLookup = self->_contentLookup;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __28__UIButton__hasDrawingStyle__block_invoke;
  v8[3] = &unk_1E52EAB68;
  v8[4] = &v9;
  [(NSMutableDictionary *)contentLookup enumerateKeysAndObjectsUsingBlock:v8];
  if (!*((unsigned char *)v10 + 24) && [(UIButton *)self _isCarPlaySystemTypeButton])
  {
    int64_t v4 = [(UIButton *)self _contentForState:[(UIControl *)self state]];
    __int16 v5 = [v4 background];

    if (!v5) {
      *((unsigned char *)v10 + 24) = 1;
    }
  }
  char v6 = *((unsigned char *)v10 + 24);
  _Block_object_dispose(&v9, 8);
  return v6;
}

+ (BOOL)_buttonTypeIsSystemProvided:(int64_t)a3
{
  BOOL result = objc_msgSend(a1, "_buttonTypeIsiOSSystemProvided:");
  if (a3 == 9999) {
    return 1;
  }
  return result;
}

- (BOOL)_isCarPlaySystemTypeButton
{
  BOOL v3 = [(UIButton *)self _isiOSSystemProvidedButton]
    || [(UIButton *)self buttonType] == 123;
  return [(UIButton *)self _isInCarPlay] && v3;
}

+ (BOOL)_buttonTypeIsiOSSystemProvided:(int64_t)a3
{
  return (unint64_t)(a3 - 124) < 3 || a3 == 1;
}

- (BOOL)_isInCarPlay
{
  v2 = [(UIView *)self traitCollection];
  BOOL v3 = [v2 userInterfaceIdiom] == 3;

  return v3;
}

- (UIButtonType)buttonType
{
  return (unint64_t)(*(void *)&self->_buttonFlags >> 6);
}

- (BOOL)_isModernButton
{
  if (objc_msgSend((id)objc_opt_class(), "_buttonTypeIsModernUI:", -[UIButton _buttonType](self, "_buttonType"))) {
    return 1;
  }
  return [(UIButton *)self _hasDrawingStyle];
}

- (BOOL)_isiOSSystemProvidedButton
{
  BOOL v3 = objc_opt_class();
  int64_t v4 = [(UIButton *)self _buttonType];
  return [v3 _buttonTypeIsiOSSystemProvided:v4];
}

- (int64_t)_buttonType
{
  return (*(void *)&self->_buttonFlags >> 6);
}

+ (BOOL)_buttonTypeIsModernUI:(int64_t)a3
{
  if ((objc_msgSend(a1, "_buttonTypeIsSystemProvided:") & 1) != 0 || a3 == 7 || a3 == 113) {
    return 1;
  }
  return UIButtonTypeIsModernCircleButton(a3);
}

- (BOOL)_shouldHaveFloatingAppearance
{
  return 0;
}

- (CGPoint)pressFeedbackPosition
{
  BOOL v3 = [(UIButton *)self imageForState:1];

  [(UIView *)self bounds];
  -[UIButton contentRectForBounds:](self, "contentRectForBounds:");
  if (v3) {
    -[UIButton imageRectForContentRect:](self, "imageRectForContentRect:");
  }
  double v8 = v4 + v6 * 0.5;
  double v9 = v5 + v7 * 0.5;
  result.double y = v9;
  result.double x = v8;
  return result;
}

- (UIImage)imageForState:(UIControlState)state
{
  return (UIImage *)[(UIButton *)self _imageForState:state applyingConfiguration:0 usesImageForNormalState:0];
}

+ (id)_defaultImageColorForType:(int64_t)a3 andState:(unint64_t)a4 idiom:(int64_t)a5
{
  if (a3 == 7)
  {
    double v7 = +[UIColor secondaryLabelColor];
  }
  else
  {
    double v7 = 0;
  }
  return v7;
}

- (CGRect)imageRectForContentRect:(CGRect)contentRect
{
  double height = contentRect.size.height;
  double width = contentRect.size.width;
  double y = contentRect.origin.y;
  double x = contentRect.origin.x;
  double v7 = [(UIButton *)self _visualProvider];
  objc_msgSend(v7, "imageRectForContentRect:", x, y, width, height);
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;

  double v16 = v9;
  double v17 = v11;
  double v18 = v13;
  double v19 = v15;
  result.size.double height = v19;
  result.size.double width = v18;
  result.origin.double y = v17;
  result.origin.double x = v16;
  return result;
}

+ (void)_setVisuallyHighlighted:(BOOL)a3 forViews:(id)a4 initialPress:(BOOL)a5 baseAlpha:(double)a6
{
  BOOL v7 = a5;
  BOOL v8 = a3;
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v10 = a4;
  double v11 = [v10 firstObject];
  double v12 = [v11 traitCollection];
  BOOL v13 = [v12 userInterfaceStyle] == 2;

  double v14 = dbl_186B935B0[v13];
  long long v26 = 0u;
  long long v27 = 0u;
  if (v8) {
    double v15 = v14;
  }
  else {
    double v15 = 1.0;
  }
  long long v24 = 0uLL;
  long long v25 = 0uLL;
  id v16 = v10;
  uint64_t v17 = [v16 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    double v19 = v15 * a6;
    uint64_t v20 = *(void *)v25;
    while (2)
    {
      for (uint64_t i = 0; i != v18; ++i)
      {
        if (*(void *)v25 != v20) {
          objc_enumerationMutation(v16);
        }
        [*(id *)(*((void *)&v24 + 1) + 8 * i) alpha];
        if (v19 != v22)
        {

          v23[0] = MEMORY[0x1E4F143A8];
          v23[1] = 3221225472;
          v23[2] = __68__UIButton__setVisuallyHighlighted_forViews_initialPress_baseAlpha___block_invoke;
          v23[3] = &__block_descriptor_40_e16_v16__0__UIView_8l;
          *(double *)&v23[4] = v19;
          [a1 _setVisuallyHighlighted:v8 forViews:v16 initialPress:v7 highlightBlock:v23];
          goto LABEL_14;
        }
      }
      uint64_t v18 = [v16 countByEnumeratingWithState:&v24 objects:v28 count:16];
      if (v18) {
        continue;
      }
      break;
    }
  }

LABEL_14:
}

+ (void)_setVisuallyHighlighted:(BOOL)a3 forViews:(id)a4 initialPress:(BOOL)a5
{
}

- (BOOL)showsTouchWhenHighlighted
{
  return (*(unsigned char *)&self->_buttonFlags >> 5) & 1;
}

- (BOOL)adjustsImageWhenHighlighted
{
  return (*(unsigned char *)&self->_buttonFlags >> 1) & 1;
}

- (BOOL)adjustsImageWhenDisabled
{
  return (*(unsigned char *)&self->_buttonFlags >> 2) & 1;
}

- (void)_intrinsicContentSizeInvalidatedForChildView:(id)a3
{
  id v4 = a3;
  id v5 = [(UIButton *)self _visualProvider];
  [v5 intrinsicContentSizeInvalidatedForChildView:v4];
}

- (void)_alignmentRectInsetsHaveChangedForChildImageView:(id)a3
{
  id v8 = a3;
  __int16 buttonVisualProviderFlags = (__int16)self->_buttonVisualProviderFlags;
  if (buttonVisualProviderFlags)
  {
    if ((buttonVisualProviderFlags & 4) == 0) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  id v5 = [(UIButton *)self _visualProvider];
  if (v5)
  {
    __int16 v6 = (__int16)self->_buttonVisualProviderFlags;

    if ((v6 & 4) != 0)
    {
LABEL_6:
      BOOL v7 = [(UIButton *)self _visualProvider];
      [v7 alignmentRectInsetsHaveChangedForChildImageView:v8];
    }
  }
LABEL_7:
}

- (void)_setContentHuggingPriorities:(CGSize)a3
{
  double width = a3.width;
  if (a3.width < 1.0 || a3.height < 1.0)
  {
    objc_msgSend(MEMORY[0x1E4F1CA00], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E4F1C3C8], @"UIButton content-hugging priorities must be >= 1.", 0, 1.0, a3.height);
    id v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v8);
  }
  double height = a3.height;
  v9.receiver = self;
  v9.super_class = (Class)UIButton;
  [(UIView *)&v9 _setContentHuggingPriorities:a3.width];
  BOOL v7 = [(UIButton *)self _visualProvider];
  objc_msgSend(v7, "setContentHuggingPriorities:", width, height);
}

- (BOOL)_hasBaseline
{
  __int16 buttonVisualProviderFlags = (__int16)self->_buttonVisualProviderFlags;
  if (buttonVisualProviderFlags)
  {
    if ((buttonVisualProviderFlags & 4) != 0)
    {
LABEL_4:
      __int16 v6 = [(UIButton *)self _visualProvider];
      char v7 = [v6 hasBaseline];

      return v7;
    }
  }
  else
  {
    id v4 = [(UIButton *)self _visualProvider];
    if (v4)
    {
      __int16 v5 = (__int16)self->_buttonVisualProviderFlags;

      if ((v5 & 4) != 0) {
        goto LABEL_4;
      }
    }
  }
  v9.receiver = self;
  v9.super_class = (Class)UIButton;
  return [(UIView *)&v9 _hasBaseline];
}

- (id)viewForLastBaselineLayout
{
  BOOL v3 = [(UIButton *)self _visualProvider];
  id v4 = [v3 viewForLastBaselineLayout];
  __int16 v5 = v4;
  if (v4)
  {
    id v6 = v4;
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)UIButton;
    id v6 = [(UIView *)&v9 viewForLastBaselineLayout];
  }
  char v7 = v6;

  return v7;
}

- ($F24F406B2B787EFB06265DBA3D28CBD5)_baselineOffsetsAtSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  __int16 v5 = [(UIButton *)self _visualProvider];
  objc_msgSend(v5, "baselineOffsetsAtSize:", width, height);
  double v7 = v6;
  double v9 = v8;

  double v10 = v7;
  double v11 = v9;
  result.var1 = v11;
  result.var0 = v10;
  return result;
}

- (double)_baselineOffsetFromBottom
{
  __int16 buttonVisualProviderFlags = (__int16)self->_buttonVisualProviderFlags;
  if (buttonVisualProviderFlags)
  {
    if ((buttonVisualProviderFlags & 4) != 0)
    {
LABEL_4:
      [(UIView *)self bounds];
      -[UIButton _baselineOffsetsAtSize:](self, "_baselineOffsetsAtSize:", v6, v7);
      return v8;
    }
  }
  else
  {
    id v4 = [(UIButton *)self _visualProvider];
    if (v4)
    {
      __int16 v5 = (__int16)self->_buttonVisualProviderFlags;

      if ((v5 & 4) != 0) {
        goto LABEL_4;
      }
    }
  }
  v10.receiver = self;
  v10.super_class = (Class)UIButton;
  [(UIView *)&v10 _baselineOffsetFromBottom];
  return result;
}

- (void)_prepareForSecondIntrinsicContentSizeCalculationWithLayoutEngineBounds:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  __int16 buttonVisualProviderFlags = (__int16)self->_buttonVisualProviderFlags;
  if (buttonVisualProviderFlags)
  {
    if ((buttonVisualProviderFlags & 4) != 0) {
      goto LABEL_7;
    }
LABEL_6:
    double v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2 object:self file:@"UIButton.m" lineNumber:2743 description:@"Unexpected use of multiline text content sizing in UIButton"];

    goto LABEL_7;
  }
  objc_super v10 = [(UIButton *)self _visualProvider];
  if (!v10) {
    goto LABEL_6;
  }
  __int16 v11 = (__int16)self->_buttonVisualProviderFlags;

  if ((v11 & 4) == 0) {
    goto LABEL_6;
  }
LABEL_7:
  BOOL v13 = [(UIButton *)self _visualProvider];
  -[UIView alignmentRectForFrame:](self, "alignmentRectForFrame:", x, y, width, height);
  [v13 setWidthForMultilineTextLayout:CGRectGetWidth(v15)];

  v14.receiver = self;
  v14.super_class = (Class)UIButton;
  -[UIView _prepareForSecondIntrinsicContentSizeCalculationWithLayoutEngineBounds:](&v14, sel__prepareForSecondIntrinsicContentSizeCalculationWithLayoutEngineBounds_, x, y, width, height);
}

- (void)_prepareForFirstIntrinsicContentSizeCalculation
{
  __int16 buttonVisualProviderFlags = (__int16)self->_buttonVisualProviderFlags;
  if (buttonVisualProviderFlags)
  {
    if ((buttonVisualProviderFlags & 4) != 0) {
      goto LABEL_7;
    }
LABEL_6:
    double v7 = [MEMORY[0x1E4F28B00] currentHandler];
    [v7 handleFailureInMethod:a2 object:self file:@"UIButton.m" lineNumber:2736 description:@"Unexpected use of multiline text content sizing in UIButton"];

    goto LABEL_7;
  }
  __int16 v5 = [(UIButton *)self _visualProvider];
  if (!v5) {
    goto LABEL_6;
  }
  __int16 v6 = (__int16)self->_buttonVisualProviderFlags;

  if ((v6 & 4) == 0) {
    goto LABEL_6;
  }
LABEL_7:
  double v8 = [(UIButton *)self _visualProvider];
  [v8 setWidthForMultilineTextLayout:0.0];

  v9.receiver = self;
  v9.super_class = (Class)UIButton;
  [(UIView *)&v9 _prepareForFirstIntrinsicContentSizeCalculation];
}

- (id)viewForFirstBaselineLayout
{
  BOOL v3 = [(UIButton *)self _visualProvider];
  id v4 = [v3 viewForFirstBaselineLayout];
  __int16 v5 = v4;
  if (v4)
  {
    id v6 = v4;
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)UIButton;
    id v6 = [(UIView *)&v9 viewForFirstBaselineLayout];
  }
  double v7 = v6;

  return v7;
}

- (UIImage)currentBackgroundImage
{
  UIControlState v3 = [(UIControl *)self state];
  return [(UIButton *)self backgroundImageForState:v3];
}

- (CGRect)backgroundRectForBounds:(CGRect)bounds
{
  double height = bounds.size.height;
  double width = bounds.size.width;
  double y = bounds.origin.y;
  double x = bounds.origin.x;
  if (UIButtonTypeIsModernCircleButton((*(void *)&self->_buttonFlags >> 6)))
  {
    -[UIButton imageRectForContentRect:](self, "imageRectForContentRect:", x, y, width, height);
    double x = v8;
    double y = v9;
    double width = v10;
    double height = v11;
  }
  double v12 = x;
  double v13 = y;
  double v14 = width;
  double v15 = height;
  result.size.double height = v15;
  result.size.double width = v14;
  result.origin.double y = v13;
  result.origin.double x = v12;
  return result;
}

- (void)_didChangeFromIdiom:(int64_t)a3 onScreen:(id)a4 traverseHierarchy:(BOOL)a5
{
  BOOL v5 = a5;
  v10.receiver = self;
  v10.super_class = (Class)UIButton;
  id v8 = a4;
  [(UIView *)&v10 _didChangeFromIdiom:a3 onScreen:v8 traverseHierarchy:v5];
  double v9 = [(UIButton *)self _visualProvider];
  [v9 didChangeFromIdiom:a3 onScreen:v8 traverseHierarchy:v5];
}

- (UIEdgeInsets)_combinedContentPaddingInsets
{
  double top = self->_internalTitlePaddingInsets.top;
  double left = self->_internalTitlePaddingInsets.left;
  double bottom = self->_internalTitlePaddingInsets.bottom;
  double right = self->_internalTitlePaddingInsets.right;
  if (left == 0.0 && top == 0.0 && right == 0.0 && bottom == 0.0) {
    [(UIButton *)self contentEdgeInsets];
  }
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (UIEdgeInsets)contentEdgeInsets
{
  double top = self->_contentEdgeInsets.top;
  double left = self->_contentEdgeInsets.left;
  double bottom = self->_contentEdgeInsets.bottom;
  double right = self->_contentEdgeInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (CGSize)_effectiveSizeForImage:(id)a3
{
  double v3 = _UIAccessibilityContentSizeCategorySizeForImage(a3, self);
  result.double height = v4;
  result.double width = v3;
  return result;
}

- (id)_imageColorForState:(unint64_t)a3
{
  BOOL v5 = -[UIButton _contentForState:](self, "_contentForState:");
  id v6 = [v5 imageColor];

  if (!v6)
  {
    double v7 = [(UIButton *)self _contentForState:0];
    id v6 = [v7 imageColor];

    if (!v6)
    {
      id v6 = +[UIButton _defaultImageColorForState:a3 button:self];
      if (!v6)
      {
        id v6 = +[UIButton _defaultImageColorForState:0 button:self];
      }
    }
  }
  return v6;
}

- (void)tintColorDidChange
{
  v4.receiver = self;
  v4.super_class = (Class)UIButton;
  [(UIView *)&v4 tintColorDidChange];
  double v3 = [(UIButton *)self _visualProvider];
  [v3 tintColorDidChange];
}

- (void)setNeedsUpdateConfiguration
{
  __int16 buttonVisualProviderFlags = (__int16)self->_buttonVisualProviderFlags;
  if (buttonVisualProviderFlags)
  {
    if ((buttonVisualProviderFlags & 4) == 0) {
      return;
    }
  }
  else
  {
    objc_super v4 = [(UIButton *)self _visualProvider];
    if (!v4) {
      return;
    }
    __int16 v5 = (__int16)self->_buttonVisualProviderFlags;

    if ((v5 & 4) == 0) {
      return;
    }
  }
  id v6 = [(UIButton *)self _visualProvider];
  [v6 setNeedsUpdateConfiguration];

  if (+[UIView _isInAnimationBlockWithAnimationsEnabled])
  {
    id v7 = [(UIButton *)self _visualProvider];
    [v7 updateConfigurationIfNecessary];
  }
}

void __28__UIButton__hasDrawingStyle__block_invoke(uint64_t a1, uint64_t a2, void *a3, unsigned char *a4)
{
  id v6 = [a3 drawingStroke];
  [v6 doubleValue];
  double v8 = v7;

  if (fabs(v8) >= 2.22044605e-16)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
    *a4 = 1;
  }
}

- (id)_viewForLoweringBaselineLayoutAttribute:(int)a3
{
  v5.receiver = self;
  v5.super_class = (Class)UIButton;
  id v3 = [(UIView *)&v5 _viewForLoweringBaselineLayoutAttribute:*(void *)&a3];
  [v3 setTranslatesAutoresizingMaskIntoConstraints:0];
  return v3;
}

- (void)setEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(UIControl *)self isEnabled] != a3)
  {
    v7.receiver = self;
    v7.super_class = (Class)UIButton;
    [(UIControl *)&v7 setEnabled:v3];
    objc_super v5 = [(UIButton *)self _visualProvider];
    [v5 setEnabled:v3];

    [(UIButton *)self setNeedsLayout];
    id v6 = [(UIButton *)self selectionInteraction];
    [v6 setEnabled:v3];
  }
}

- (void)setSelected:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(UIControl *)self isSelected] != a3)
  {
    v6.receiver = self;
    v6.super_class = (Class)UIButton;
    [(UIControl *)&v6 setSelected:v3];
    objc_super v5 = [(UIButton *)self _visualProvider];
    [v5 setSelected:v3];

    [(UIButton *)self setNeedsLayout];
  }
}

- (void)setTintColor:(UIColor *)tintColor
{
  v3.receiver = self;
  v3.super_class = (Class)UIButton;
  [(UIView *)&v3 setTintColor:tintColor];
}

- (_UISelectionInteraction)selectionInteraction
{
  return self->_selectionInteraction;
}

void __33__UIButton__hasImageForProperty___block_invoke(uint64_t a1, uint64_t a2, void *a3, unsigned char *a4)
{
  objc_super v6 = [a3 valueForKey:*(void *)(a1 + 32)];

  if (v6)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
    *a4 = 1;
  }
}

- (void)setBackgroundImage:(id)a3 forStates:(unint64_t)a4
{
  [(UIButton *)self _setBackground:a3 forStates:a4];
  if ([(UIButton *)self autosizesToFit]) {
    [(UIView *)self sizeToFit];
  }
  [(UIButton *)self setNeedsLayout];
}

- (void)_setBackground:(id)a3 forStates:(unint64_t)a4
{
  if (self)
  {
    do
    {
      -[UIButton _setContentValue:forField:state:](self, a3, @"background", a4 & -(uint64_t)a4);
      a4 &= a4 - 1;
    }
    while (a4);
  }
}

- (void)setAttributedTitle:(NSAttributedString *)title forState:(UIControlState)state
{
  objc_super v6 = title;
  int v7 = -[UIButton _setContentValue:forField:state:](self, v6, @"attributedTitle", state);
  double v8 = [(UIButton *)self _visualProvider];
  [v8 setAttributedTitle:v6 forState:state];

  if ([(UIButton *)self autosizesToFit]) {
    [(UIView *)self sizeToFit];
  }
  if (v7)
  {
    -[UIButton _markAndLayoutAsNeededForField:state:](self, @"attributedTitle", state);
  }
}

- (void)setPreferredSymbolConfiguration:(UIImageSymbolConfiguration *)configuration forImageInState:(UIControlState)state
{
  objc_super v6 = configuration;
  int v7 = -[UIButton _setContentValue:forField:state:](self, v6, @"preferredSymbolConfiguration", state);
  double v8 = [(UIButton *)self _visualProvider];
  [v8 setPreferredSymbolConfiguration:v6 forImageInState:state];

  if ([(UIButton *)self autosizesToFit]) {
    [(UIView *)self sizeToFit];
  }
  if (v7)
  {
    -[UIButton _markAndLayoutAsNeededForField:state:](self, @"preferredSymbolConfiguration", state);
  }
}

- (void)setImage:(UIImage *)image forState:(UIControlState)state
{
  objc_super v6 = image;
  int v7 = -[UIButton _setContentValue:forField:state:](self, v6, @"image", state);
  double v8 = [(UIButton *)self _visualProvider];
  [v8 setImage:v6 forState:state];

  if ([(UIButton *)self autosizesToFit]) {
    [(UIView *)self sizeToFit];
  }
  if (v7)
  {
    -[UIButton _markAndLayoutAsNeededForField:state:](self, @"image", state);
  }
}

- (BOOL)autosizesToFit
{
  return (*(unsigned char *)&self->_buttonFlags >> 3) & 1;
}

- (uint64_t)_setContentValue:(void *)a3 forField:(uint64_t)a4 state:
{
  id v7 = a2;
  id v8 = a3;
  if (a1)
  {
    double v9 = [a1 _contentForState:a4];
    if (!v9)
    {
      double v9 = objc_alloc_init(UIButtonContent);
      [a1 _setContent:v9 forState:a4];
    }
    if ([v8 isEqualToString:@"attributedTitle"])
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v10 = +[_NSAttributedStringIntentResolver attributedStringByResolvingString:v7];

        id v7 = (id)v10;
      }
    }
    id v11 = [(UIButtonContent *)v9 valueForKey:v8];
    double v12 = v11;
    if (v11 == v7)
    {
      uint64_t v14 = 0;
    }
    else
    {
      int v13 = [v11 isEqual:v7];
      uint64_t v14 = v13 ^ 1u;
      if ((~a1[12] & 0x420000000000000) == 0 && (v13 & 1) == 0) {
        [a1 invalidateIntrinsicContentSize];
      }
    }
    [(UIButtonContent *)v9 setValue:v7 forKey:v8];
    if ([v8 isEqualToString:@"title"]) {
      [(UIButtonContent *)v9 updateVariableLengthStringForView:a1];
    }
    if ([v8 isEqualToString:@"titleColor"]) {
      a1[77] |= 0x80000000uLL;
    }
    if (!v7 && [(UIButtonContent *)v9 isEmpty]) {
      [a1 _setContent:0 forState:a4];
    }
    if (v14)
    {
      if (v7) {
        BOOL v15 = v12 == 0;
      }
      else {
        BOOL v15 = 1;
      }
      int v16 = v15;
      if (!a4
        && v16
        && [v8 isEqualToString:@"background"]
        && [a1 _wantsAccessibilityUnderline])
      {
        uint64_t v17 = [a1 _titleView];
        [v17 _setWantsUnderlineForAccessibilityButtonShapesEnabled:v7 == 0];
      }
    }
  }
  else
  {
    uint64_t v14 = 0;
  }

  return v14;
}

- (void)_setContent:(id)a3 forState:(unint64_t)a4
{
  id v10 = a3;
  contentLookup = self->_contentLookup;
  if (!contentLookup)
  {
    id v7 = [MEMORY[0x1E4F1CA60] dictionary];
    id v8 = self->_contentLookup;
    self->_contentLookup = v7;

    contentLookup = self->_contentLookup;
  }
  double v9 = [NSNumber numberWithUnsignedInteger:a4];
  [(NSMutableDictionary *)contentLookup setObject:v10 forKeyedSubscript:v9];
}

- (id)_titleView
{
  v2 = [(UIButton *)self _visualProvider];
  objc_super v3 = [v2 titleViewCreateIfNeeded:0];

  return v3;
}

- (void)_markAndLayoutAsNeededForField:(uint64_t)a3 state:
{
  id v8 = a2;
  if (a1)
  {
    if (dyld_program_sdk_at_least())
    {
      if ([a1 state] == a3
        || !a3
        && (objc_msgSend(a1, "_contentForState:", objc_msgSend(a1, "state")),
            objc_super v6 = objc_claimAutoreleasedReturnValue(),
            [v6 valueForKey:v8],
            id v7 = objc_claimAutoreleasedReturnValue(),
            v7,
            v6,
            !v7))
      {
        [a1 _invalidateForPropertyChange];
      }
    }
    else
    {
      [a1 setNeedsLayout];
      if ([a1 state] == a3)
      {
        objc_super v5 = [a1 window];

        if (v5) {
          [a1 layoutBelowIfNeeded];
        }
      }
    }
  }
}

- (void)_invalidateForPropertyChange
{
  *(void *)&self->_buttonFlags |= 0x40000000uLL;
}

- (void)setNeedsLayout
{
  v4.receiver = self;
  v4.super_class = (Class)UIButton;
  [(UIView *)&v4 setNeedsLayout];
  if (dyld_program_sdk_at_least())
  {
    [(UIView *)self _is_setNeedsLayout];
    objc_super v3 = [(UIView *)self layer];
    [v3 setNeedsLayout];
  }
}

- (void)setSemanticContentAttribute:(int64_t)a3
{
  v6.receiver = self;
  v6.super_class = (Class)UIButton;
  -[UIView setSemanticContentAttribute:](&v6, sel_setSemanticContentAttribute_);
  objc_super v5 = [(UIButton *)self _visualProvider];
  [v5 setSemanticContentAttribute:a3];
}

- (id)_backgroundView
{
  v2 = [(UIButton *)self _visualProvider];
  objc_super v3 = [v2 backgroundViewCreateIfNeeded:0];

  return v3;
}

- (BOOL)_wantsAccessibilityUnderline
{
  return (*((unsigned char *)&self->_buttonFlags + 3) & 0x20) == 0;
}

- (UIButtonRole)role
{
  return (unint64_t)(*(void *)&self->_buttonFlags >> 14);
}

- (BOOL)_menuEnabled
{
  objc_super v3 = [(UIButton *)self _visualProvider];
  int v4 = [(id)objc_opt_class() shouldUpdateContextMenuEnabledOnMenuChanges];

  if (v4)
  {
    return [(UIControl *)self isContextMenuInteractionEnabled];
  }
  else
  {
    return self->_menu || self->_menuProvider != 0;
  }
}

- (void)setContentEdgeInsets:(UIEdgeInsets)contentEdgeInsets
{
  if (self->_contentEdgeInsets.left != contentEdgeInsets.left
    || self->_contentEdgeInsets.top != contentEdgeInsets.top
    || self->_contentEdgeInsets.right != contentEdgeInsets.right
    || self->_contentEdgeInsets.bottom != contentEdgeInsets.bottom)
  {
    self->_contentEdgeInsets = contentEdgeInsets;
    if (contentEdgeInsets.left != 0.0
      || contentEdgeInsets.top != 0.0
      || contentEdgeInsets.right != 0.0
      || contentEdgeInsets.bottom != 0.0)
    {
      *(_OWORD *)&self->_internalTitlePaddingInsets.double top = 0u;
      *(_OWORD *)&self->_internalTitlePaddingInsets.double bottom = 0u;
    }
    if ([(UIButton *)self autosizesToFit]) {
      [(UIView *)self sizeToFit];
    }
    [(UIView *)self invalidateIntrinsicContentSize];
    [(UIButton *)self setNeedsLayout];
  }
}

- (id)_lazyTitleViewFontIsDefaultForIdiom:(BOOL *)a3
{
  if (a3) {
    *a3 = self->_lazyTitleViewFontIsDefaultForIdiom;
  }
  return self->_lazyTitleViewFont;
}

- (BOOL)changesSelectionAsPrimaryAction
{
  return (*((unsigned __int8 *)&self->_buttonFlags + 4) >> 5) & 1;
}

+ (UIButton)buttonWithType:(UIButtonType)buttonType
{
  objc_super v6 = +[UITraitCollection _fallbackTraitCollection]();
  id v7 = objc_msgSend(a1, "_defaultSymbolConfigurationForType:andState:compact:idiom:", buttonType, 0, 0, objc_msgSend(v6, "userInterfaceIdiom"));
  id v8 = [a1 _defaultImageForType:buttonType andState:0 withConfiguration:v7];

  double v9 = (double *)MEMORY[0x1E4F1DB28];
  if (v8)
  {
    [v8 size];
    id v10 = +[UIScreen mainScreen];
    UIRoundToScreenScale(v10);
    double v12 = v11;
    int v13 = +[UIScreen mainScreen];
    UIRoundToScreenScale(v13);
    double v15 = v14;
  }
  else
  {
    double v12 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    double v15 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  }
  double v17 = *v9;
  double v16 = v9[1];
  uint64_t v18 = [a1 _buttonTypeIsModernUI:buttonType];
  if (v18) {
    UIButtonType v19 = UIButtonTypeCustom;
  }
  else {
    UIButtonType v19 = buttonType;
  }
  switch(v19)
  {
    case 'd':
      double v23 = [UINavigationButton alloc];
      uint64_t v24 = 0;
      goto LABEL_17;
    case 'e':
      double v23 = [UINavigationButton alloc];
      uint64_t v24 = 1;
      goto LABEL_17;
    case 'f':
      double v23 = [UINavigationButton alloc];
      uint64_t v24 = 2;
LABEL_17:
      p_super = [(UINavigationButton *)v23 initWithTitle:0 style:v24];
      [(UIButton *)p_super setAutosizesToFit:1];
      goto LABEL_23;
    case 'g':
    case 'h':
    case 'i':
    case 'j':
    case 'k':
    case 'l':
    case 'm':
    case 'o':
    case 'p':
    case 't':
    case 'u':
LABEL_13:
      double v22 = (__objc2_class *)a1;
      goto LABEL_21;
    case 'n':
      long long v25 = [MEMORY[0x1E4F28B00] currentHandler];
      [v25 handleFailureInMethod:a2, a1, @"UIButton.m", 875, @"UIButtonTypeTextured has never worked properly under ModernUI, replace your usage" object file lineNumber description];

      p_super = 0;
      goto LABEL_23;
    case 'q':
      long long v26 = [UIRoundedRectButton alloc];
      long long v27 = +[UIColor tableCellGroupedBackgroundColor];
      p_super = -[UIRoundedRectButton initWithFrame:fillColor:](v26, "initWithFrame:fillColor:", v27, v17, v16, v12, v15);

      goto LABEL_23;
    case 'r':
    case 's':
      uint64_t v20 = -[UIPopoverButton initWithFrame:buttonType:]([UIPopoverButton alloc], "initWithFrame:buttonType:", buttonType, v17, v16, v12, v15);
      goto LABEL_22;
    default:
      switch(v19)
      {
        case UIButtonTypeSystem:
          goto LABEL_12;
        case UIButtonTypeDetailDisclosure:
        case UIButtonTypeInfoLight:
        case UIButtonTypeInfoDark:
          p_super = -[UIButton initWithFrame:]([UIButton alloc], "initWithFrame:", v17, v16, v12, v15);
          [(UIButton *)p_super setShowsTouchWhenHighlighted:v18];
          goto LABEL_23;
        case UIButtonTypeContactAdd:
          double v22 = UIButton;
          break;
        default:
          if (v19 != 9999) {
            goto LABEL_13;
          }
LABEL_12:
          double v22 = UIRoundedRectButton;
          break;
      }
LABEL_21:
      uint64_t v20 = (UIPopoverButton *)objc_msgSend([v22 alloc], "initWithFrame:", v17, v16, v12, v15);
LABEL_22:
      p_super = &v20->super;
LABEL_23:
      if (buttonType == 124)
      {
        buttonType = UIButtonTypeSystem;
        [(UIButton *)p_super setChangesSelectionAsPrimaryAction:1];
        [(UIButton *)p_super setShowsMenuAsPrimaryAction:1];
      }
      [(UIButton *)p_super _setButtonType:buttonType];
      if (v18)
      {
        [(UIButton *)p_super setAdjustsImageWhenHighlighted:0];
        [(UIButton *)p_super setAdjustsImageWhenDisabled:0];
        [(UIButton *)p_super setShowsTouchWhenHighlighted:0];
        [(UIButton *)p_super _setDefaultFontForIdiom];
      }

      return p_super;
  }
}

- (UIButton)initWithFrame:(CGRect)frame
{
  double height = frame.size.height;
  double width = frame.size.width;
  double y = frame.origin.y;
  double x = frame.origin.x;
  if (self->_initialized)
  {
    double v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:a2, self, @"UIButton.m", 1055, @"unsafe to initWithFrame: already initialized UIButton. Use setFrame: instead %@", self object file lineNumber description];
  }
  v16.receiver = self;
  v16.super_class = (Class)UIButton;
  id v8 = -[UIControl initWithFrame:](&v16, sel_initWithFrame_, x, y, width, height);
  double v9 = (UIButton *)v8;
  if (v8)
  {
    *(_OWORD *)(v8 + 488) = 0u;
    *(_OWORD *)(v8 + 504) = 0u;
    *(_OWORD *)(v8 + 520) = 0u;
    *(_OWORD *)(v8 + 536) = 0u;
    *(_OWORD *)(v8 + 552) = 0u;
    *(_OWORD *)(v8 + 568) = 0u;
    [v8 setOpaque:0];
    *(void *)&v9->_buttonFlags |= 6uLL;
    [off_1E52D39B8 defaultFontSize];
    uint64_t v11 = [off_1E52D39B8 systemFontOfSize:v10 + 1.0];
    lazyTitleViewFont = v9->_lazyTitleViewFont;
    v9->_lazyTitleViewFont = (UIFont *)v11;

    v9->_initialized = 1;
    _UIButtonCommonInit(v9);
  }
  return v9;
}

- (void)setSelectionInteraction:(id)a3
{
}

- (void)_setButtonType:(int64_t)a3
{
  self->_buttonFlags = ($1CF1FC38577B636919C637EEED589224)(*(void *)&self->_buttonFlags & 0xFFFFFFFFFFFFC03FLL | ((unint64_t)a3 << 6));
  if (a3 == 7) {
    [(UIControl *)self setPointerInteractionEnabled:1];
  }
  [(UIButton *)self _refreshVisualProvider];
}

- (void)setAdjustsImageWhenHighlighted:(BOOL)adjustsImageWhenHighlighted
{
  if (((((*(void *)&self->_buttonFlags & 2) == 0) ^ adjustsImageWhenHighlighted) & 1) == 0)
  {
    uint64_t v4 = 2;
    if (!adjustsImageWhenHighlighted) {
      uint64_t v4 = 0;
    }
    self->_buttonFlags = ($1CF1FC38577B636919C637EEED589224)(*(void *)&self->_buttonFlags & 0xFFFFFFFFFFFFFFFDLL | v4);
    if ([(UIControl *)self isHighlighted])
    {
      [(UIButton *)self setNeedsLayout];
    }
  }
}

- (void)setAdjustsImageWhenDisabled:(BOOL)adjustsImageWhenDisabled
{
  if (((((*(void *)&self->_buttonFlags & 4) == 0) ^ adjustsImageWhenDisabled) & 1) == 0)
  {
    uint64_t v4 = 4;
    if (!adjustsImageWhenDisabled) {
      uint64_t v4 = 0;
    }
    self->_buttonFlags = ($1CF1FC38577B636919C637EEED589224)(*(void *)&self->_buttonFlags & 0xFFFFFFFFFFFFFFFBLL | v4);
    if (![(UIControl *)self isEnabled])
    {
      [(UIButton *)self setNeedsLayout];
    }
  }
}

- (void)setShowsTouchWhenHighlighted:(BOOL)showsTouchWhenHighlighted
{
  if (((((*(void *)&self->_buttonFlags & 0x20) == 0) ^ showsTouchWhenHighlighted) & 1) == 0)
  {
    BOOL v3 = showsTouchWhenHighlighted;
    uint64_t v4 = 32;
    if (!showsTouchWhenHighlighted) {
      uint64_t v4 = 0;
    }
    self->_buttonFlags = ($1CF1FC38577B636919C637EEED589224)(*(void *)&self->_buttonFlags & 0xFFFFFFFFFFFFFFDFLL | v4);
    id v5 = [(UIButton *)self _visualProvider];
    [v5 setShowsTouchWhenHighlighted:v3];
  }
}

- (void)_setDefaultFontForIdiom
{
  if ([(UIButton *)self _isiOSSystemProvidedButton]
    && [(UIButton *)self _shouldAdjustToTraitCollection])
  {
    id v4 = [off_1E52D39B8 preferredFontForTextStyle:@"UICTFontTextStyleBody"];
    -[UIButton _setFont:isDefaultForIdiom:](self, "_setFont:isDefaultForIdiom:");
  }
  else
  {
    id v4 = [(UIView *)self traitCollection];
    BOOL v3 = -[UIButton _defaultFontForIdiom:](self, "_defaultFontForIdiom:", [v4 userInterfaceIdiom]);
    [(UIButton *)self _setFont:v3 isDefaultForIdiom:1];
  }
}

- (void)_setFont:(id)a3 isDefaultForIdiom:(BOOL)a4
{
  BOOL v4 = a4;
  id v10 = a3;
  __int16 buttonVisualProviderFlags = (__int16)self->_buttonVisualProviderFlags;
  if (buttonVisualProviderFlags)
  {
    if ((buttonVisualProviderFlags & 0x20) == 0) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  id v7 = [(UIButton *)self _visualProvider];
  if (v7)
  {
    __int16 v8 = (__int16)self->_buttonVisualProviderFlags;

    if ((v8 & 0x20) != 0)
    {
LABEL_6:
      double v9 = [(UIButton *)self _visualProvider];
      [v9 setFont:v10 isDefaultForIdiom:v4];
    }
  }
LABEL_7:
}

- (void)_setLazyTitleViewFont:(id)a3 isDefaultForIdiom:(BOOL)a4
{
  self->_lazyTitleViewFontIsDefaultForIdiom = a4;
}

- (id)_defaultFontForIdiom:(int64_t)a3
{
  double v3 = 15.0;
  if (a3 == 5) {
    double v3 = 13.0;
  }
  return (id)[off_1E52D39B8 systemFontOfSize:v3];
}

- (BOOL)_shouldAdjustToTraitCollection
{
  return 0;
}

- (void)setChangesSelectionAsPrimaryAction:(BOOL)changesSelectionAsPrimaryAction
{
  uint64_t v3 = 0x2000000000;
  if (!changesSelectionAsPrimaryAction) {
    uint64_t v3 = 0;
  }
  self->_buttonFlags = ($1CF1FC38577B636919C637EEED589224)(*(void *)&self->_buttonFlags & 0xFFFFFFDFFFFFFFFFLL | v3);
  [(UIButton *)self _updateForAutomaticSelection];
}

- (UIButtonConfiguration)configuration
{
  v2 = [(_UIButtonConfigurationShim *)self->_configuration _apiValue];
  uint64_t v3 = (void *)[v2 copy];

  return (UIButtonConfiguration *)v3;
}

- (void)_shim_setConfiguration:(id)a3
{
  BOOL v4 = (_UIButtonConfigurationShim *)a3;
  id v5 = v4;
  configuration = self->_configuration;
  if (configuration != v4)
  {
    BOOL v7 = configuration == 0;
    BOOL v8 = v4 != 0;
    double v15 = v4;
    double v9 = (_UIButtonConfigurationShim *)[(_UIButtonConfigurationShim *)v4 copy];
    id v10 = self->_configuration;
    self->_configuration = v9;

    if (((v8 ^ v7) & 1) == 0) {
      [(UIButton *)self _refreshVisualProvider];
    }
    __int16 buttonVisualProviderFlags = (__int16)self->_buttonVisualProviderFlags;
    if (buttonVisualProviderFlags)
    {
      id v5 = v15;
      if ((buttonVisualProviderFlags & 4) == 0) {
        goto LABEL_10;
      }
    }
    else
    {
      double v12 = [(UIButton *)self _visualProvider];
      id v5 = v15;
      if (!v12) {
        goto LABEL_10;
      }
      __int16 v13 = (__int16)self->_buttonVisualProviderFlags;

      id v5 = v15;
      if ((v13 & 4) == 0) {
        goto LABEL_10;
      }
    }
    double v14 = [(UIButton *)self _visualProvider];
    [v14 automaticallyUpdateConfigurationIfNecessary:self->_configuration];
    [v14 applyConfiguration];

    id v5 = v15;
  }
LABEL_10:
}

- (UIButtonConfigurationUpdateHandler)configurationUpdateHandler
{
  return self->_configurationUpdateHandler;
}

- (_UIButtonConfigurationState)_configurationState
{
  uint64_t v3 = [_UIButtonConfigurationState alloc];
  BOOL v4 = [(UIView *)self traitCollection];
  id v5 = [(UIViewConfigurationState *)v3 initWithTraitCollection:v4];

  UIControlState v6 = [(UIControl *)self state];
  [(UIViewConfigurationState *)v5 setDisabled:(v6 >> 1) & 1];
  [(UIViewConfigurationState *)v5 setHighlighted:v6 & 1];
  [(UIViewConfigurationState *)v5 setSelected:(v6 >> 2) & 1];
  [(UIViewConfigurationState *)v5 setFocused:(v6 >> 3) & 1];
  return v5;
}

- (id)_titleColorForState:(unint64_t)a3
{
  BOOL v4 = [(UIButton *)self _contentForState:a3];
  id v5 = [v4 titleColor];

  if (!v5)
  {
    UIControlState v6 = [(UIView *)self traitCollection];
    uint64_t v7 = [v6 userInterfaceIdiom];

    if (v7 == 6)
    {
      BOOL v8 = [(UIButton *)self _contentForState:0];
      id v5 = [v8 titleColor];
    }
    else
    {
      id v5 = 0;
    }
  }
  return v5;
}

- (id)_titleColorForState:(unint64_t)a3 suppressTintColorFollowing:(BOOL *)a4
{
  uint64_t v7 = -[UIButton _contentForState:](self, "_contentForState:");
  BOOL v8 = [v7 titleColor];

  if (v8
    || ([(UIButton *)self _contentForState:0],
        double v9 = objc_claimAutoreleasedReturnValue(),
        [v9 titleColor],
        BOOL v8 = objc_claimAutoreleasedReturnValue(),
        v9,
        v8))
  {
    BOOL v10 = 1;
    if (!a4) {
      goto LABEL_5;
    }
    goto LABEL_4;
  }
  char v12 = 0;
  BOOL v8 = +[UIButton _defaultTitleColorForState:a3 button:self isTintColor:&v12];
  if (!v8)
  {
    BOOL v8 = +[UIButton _defaultTitleColorForState:0 button:self isTintColor:&v12];
  }
  BOOL v10 = v12 == 0;
  if (a4) {
LABEL_4:
  }
    *a4 = v10;
LABEL_5:
  return v8;
}

+ (id)_defaultTitleColorForState:(unint64_t)a3 button:(id)a4 isTintColor:(BOOL *)a5
{
  id v7 = a4;
  char v13 = 0;
  if ([v7 _isInCarPlay])
  {
    BOOL v8 = [v7 _externalTitleColorForState:a3 isTintColor:&v13];
    if (!v8) {
      goto LABEL_8;
    }
    goto LABEL_6;
  }
  if ([v7 _isModernButton])
  {
    BOOL v8 = [v7 tintColor];
    char v13 = 1;
    if (!v8) {
      goto LABEL_8;
    }
LABEL_6:
    if ((a3 & 2) != 0)
    {
      uint64_t v9 = +[UIColor _disabledColorForColor:]((uint64_t)UIColor, v8);

      char v13 = 0;
      BOOL v8 = (void *)v9;
    }
LABEL_8:
    if (!a5) {
      goto LABEL_11;
    }
    goto LABEL_9;
  }
  if ([v7 _isModernButton])
  {
    BOOL v8 = 0;
    if (a5)
    {
LABEL_9:
      BOOL v10 = v13;
LABEL_10:
      *a5 = v10;
    }
  }
  else
  {
    BOOL v8 = +[UIColor whiteColor];
    if (a5)
    {
      BOOL v10 = 0;
      goto LABEL_10;
    }
  }
LABEL_11:
  id v11 = v8;

  return v11;
}

- (BOOL)automaticallyUpdatesConfiguration
{
  return (*((unsigned __int8 *)&self->_buttonFlags + 4) >> 4) & 1;
}

- (void)_setCurrentConfiguration:(id)a3
{
}

- (CGSize)_roundSize:(CGSize)a3
{
  double v3 = ceil(a3.width);
  double v4 = ceil(a3.height);
  result.double height = v4;
  result.double width = v3;
  return result;
}

- (UIEdgeInsets)titleEdgeInsets
{
  double top = self->_titleEdgeInsets.top;
  double left = self->_titleEdgeInsets.left;
  double bottom = self->_titleEdgeInsets.bottom;
  double right = self->_titleEdgeInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (UIEdgeInsets)imageEdgeInsets
{
  double top = self->_imageEdgeInsets.top;
  double left = self->_imageEdgeInsets.left;
  double bottom = self->_imageEdgeInsets.bottom;
  double right = self->_imageEdgeInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (BOOL)_fontIsDefaultForIdiom
{
  __int16 buttonVisualProviderFlags = (__int16)self->_buttonVisualProviderFlags;
  if ((buttonVisualProviderFlags & 1) == 0)
  {
    double v4 = [(UIButton *)self _visualProvider];
    if (v4)
    {
      __int16 v5 = (__int16)self->_buttonVisualProviderFlags;

      if ((v5 & 0x20) != 0) {
        goto LABEL_4;
      }
    }
    return 1;
  }
  if ((buttonVisualProviderFlags & 0x20) == 0) {
    return 1;
  }
LABEL_4:
  UIControlState v6 = [(UIButton *)self _visualProvider];
  int v7 = [v6 deferToLazyTitleFont];

  if (v7) {
    return self->_lazyTitleViewFontIsDefaultForIdiom;
  }
  uint64_t v9 = [(UIButton *)self _visualProvider];
  char v10 = [v9 fontIsDefaultForIdiom];

  return v10;
}

- (id)_font
{
  __int16 buttonVisualProviderFlags = (__int16)self->_buttonVisualProviderFlags;
  if (buttonVisualProviderFlags)
  {
    if ((buttonVisualProviderFlags & 0x20) != 0) {
      goto LABEL_4;
    }
  }
  else
  {
    double v4 = [(UIButton *)self _visualProvider];
    if (v4)
    {
      __int16 v5 = (__int16)self->_buttonVisualProviderFlags;

      if ((v5 & 0x20) != 0)
      {
LABEL_4:
        UIControlState v6 = [(UIButton *)self _visualProvider];
        if ([v6 deferToLazyTitleFont])
        {
          int v7 = self->_lazyTitleViewFont;
        }
        else
        {
          BOOL v8 = [(UIButton *)self _visualProvider];
          int v7 = [v8 font];
        }
        goto LABEL_10;
      }
    }
  }
  int v7 = 0;
LABEL_10:
  return v7;
}

- (void)setShowsMenuAsPrimaryAction:(BOOL)a3
{
  BOOL v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)UIButton;
  -[UIControl setShowsMenuAsPrimaryAction:](&v6, sel_setShowsMenuAsPrimaryAction_);
  __int16 v5 = [(UIButton *)self _visualProvider];
  [v5 setContextMenuIsPrimary:v3];

  [(UIButton *)self _refreshVisualProvider];
  [(UIButton *)self _updateForAutomaticSelection];
}

- (void)_updateForAutomaticSelection
{
  BOOL v3 = [(UIButton *)self _isPopUpMenuButtonWithMenu:self->_menu];
  menu = self->_menu;
  if (v3)
  {
    [(UIMenu *)menu setForceAutomaticSelection:1];
    [(UIMenu *)self->_menu setForcedAutomaticSelectionDelegate:self];
    id v8 = [(UIMenu *)self->_menu selectedElements];
    __int16 v5 = [v8 firstObject];
    objc_super v6 = [v5 title];
    [(UIButton *)self setTitle:v6 forState:0];
  }
  else
  {
    [(UIMenu *)menu setForcedAutomaticSelectionDelegate:0];
    int v7 = self->_menu;
    [(UIMenu *)v7 setForceAutomaticSelection:0];
  }
}

- (BOOL)_isPopUpMenuButtonWithMenu:(id)a3
{
  return a3
      && (*((unsigned char *)&self->_buttonFlags + 4) & 0x20) != 0
      && [(UIControl *)self showsMenuAsPrimaryAction];
}

- (double)_baselineOffsetFromNearestEdgeForLayoutAttribute:(int64_t)a3
{
  v12.receiver = self;
  v12.super_class = (Class)UIButton;
  [(UIView *)&v12 _baselineOffsetFromNearestEdgeForLayoutAttribute:sel__baselineOffsetFromNearestEdgeForLayoutAttribute_];
  double v6 = v5;
  __int16 buttonVisualProviderFlags = (__int16)self->_buttonVisualProviderFlags;
  if (buttonVisualProviderFlags)
  {
    if ((a3 - 11) > 1 || (buttonVisualProviderFlags & 4) == 0) {
      return v6;
    }
  }
  else
  {
    id v8 = [(UIButton *)self _visualProvider];
    uint64_t v9 = v8;
    if (!v8 || (*(_WORD *)&self->_buttonVisualProviderFlags & 4) == 0) {
      goto LABEL_12;
    }

    if ((a3 - 11) > 1) {
      return v6;
    }
  }
  char v10 = [(UIButton *)self _visualProvider];
  [v10 setVendsBaselineInformationToAutoLayout:1];

  if (a3 == 11)
  {
    uint64_t v9 = [(UIButton *)self _visualProvider];
    [v9 setPreviousLastBaselineOffsetForAttributeLowering:v6];
    goto LABEL_12;
  }
  if (a3 == 12)
  {
    uint64_t v9 = [(UIButton *)self _visualProvider];
    [v9 setPreviousFirstBaselineOffsetForAttributeLowering:v6];
LABEL_12:
  }
  return v6;
}

void __40__UIButton__didMoveFromWindow_toWindow___block_invoke(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  id v7 = a3;
  int v8 = [a2 unsignedIntValue];
  uint64_t v9 = [*(id *)(a1 + 32) state];
  int v10 = [v7 updateVariableLengthStringForView:*(void *)(a1 + 32)];

  if (v10)
  {
    if (v9 == v8
      || !v8
      && ([*(id *)(a1 + 32) _contentForState:v9],
          id v11 = objc_claimAutoreleasedReturnValue(),
          [v11 title],
          objc_super v12 = objc_claimAutoreleasedReturnValue(),
          v12,
          v11,
          !v12))
    {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
      *a4 = 1;
    }
  }
}

- (int64_t)_lineBreakMode
{
  __int16 buttonVisualProviderFlags = (__int16)self->_buttonVisualProviderFlags;
  if (buttonVisualProviderFlags)
  {
    if ((buttonVisualProviderFlags & 0x20) != 0)
    {
LABEL_4:
      double v6 = [(UIButton *)self _visualProvider];
      int64_t v7 = [v6 lineBreakMode];

      return v7;
    }
  }
  else
  {
    double v4 = [(UIButton *)self _visualProvider];
    if (v4)
    {
      __int16 v5 = (__int16)self->_buttonVisualProviderFlags;

      if ((v5 & 0x20) != 0) {
        goto LABEL_4;
      }
    }
  }
  return 5;
}

- (UILabel)titleLabel
{
  v2 = [(UIButton *)self _visualProvider];
  BOOL v3 = [v2 titleViewCreateIfNeeded:1];

  return (UILabel *)v3;
}

- (_UIButtonConfigurationShim)_currentConfiguration
{
  return self->_configuration;
}

- (void)_titleViewLabelMetricsChanged
{
  if ([(UIButton *)self autosizesToFit]) {
    [(UIView *)self sizeToFit];
  }
  [(UIView *)self invalidateIntrinsicContentSize];
  [(UIButton *)self setNeedsLayout];
}

- (BOOL)_hasImageForProperty:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  objc_super v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  contentLookup = self->_contentLookup;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __33__UIButton__hasImageForProperty___block_invoke;
  v8[3] = &unk_1E52EAB40;
  id v6 = v4;
  id v9 = v6;
  int v10 = &v11;
  [(NSMutableDictionary *)contentLookup enumerateKeysAndObjectsUsingBlock:v8];
  LOBYTE(contentLookup) = *((unsigned char *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return (char)contentLookup;
}

- (UIImageView)imageView
{
  v2 = [(UIButton *)self _visualProvider];
  BOOL v3 = [v2 imageViewCreateIfNeeded:1];

  return (UIImageView *)v3;
}

- (UIImage)currentImage
{
  UIControlState v3 = [(UIControl *)self state];
  return [(UIButton *)self imageForState:v3];
}

- (id)_imageViewIfNeeded
{
  [(UIView *)self layoutIfNeeded];
  return [(UIButton *)self _imageView];
}

- (void)setFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  if (dyld_program_sdk_at_least())
  {
    if (+[UIView _isInAnimationBlockWithAnimationsEnabled])
    {
      int v8 = [(UIView *)self window];
      BOOL v9 = v8 == 0;
    }
    else
    {
      BOOL v9 = 1;
    }
  }
  else
  {
    BOOL v9 = 0;
  }
  -[UIButton _setFrame:deferLayout:](self, "_setFrame:deferLayout:", v9, x, y, width, height);
}

- (void)_setFrame:(CGRect)a3 deferLayout:(BOOL)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  [(UIView *)self frame];
  double v11 = v10;
  double v13 = v12;
  v19.receiver = self;
  v19.super_class = (Class)UIButton;
  -[UIView setFrame:](&v19, sel_setFrame_, x, y, width, height);
  if (v11 != width || v13 != height)
  {
    [(UIButton *)self setNeedsLayout];
    if (!a4) {
      [(UIView *)self layoutBelowIfNeeded];
    }
    __int16 buttonVisualProviderFlags = (__int16)self->_buttonVisualProviderFlags;
    if (buttonVisualProviderFlags)
    {
      if ((buttonVisualProviderFlags & 4) == 0) {
        return;
      }
    }
    else
    {
      objc_super v16 = [(UIButton *)self _visualProvider];
      if (!v16) {
        return;
      }
      __int16 v17 = (__int16)self->_buttonVisualProviderFlags;

      if ((v17 & 4) == 0) {
        return;
      }
    }
    uint64_t v18 = [(UIButton *)self _visualProvider];
    [v18 invalidateLayoutData];
  }
}

- (id)_shadowColorForState:(unint64_t)a3
{
  id v4 = [(UIButton *)self _contentForState:a3];
  __int16 v5 = [v4 shadowColor];

  if (!v5)
  {
    id v6 = [(UIButton *)self _contentForState:0];
    __int16 v5 = [v6 shadowColor];
  }
  return v5;
}

+ (UIButton)buttonWithType:(UIButtonType)buttonType primaryAction:(UIAction *)primaryAction
{
  id v6 = primaryAction;
  int64_t v7 = [a1 buttonWithType:buttonType];
  int v8 = v7;
  if (v6) {
    [v7 _commonInitForPrimaryAction:v6];
  }

  return (UIButton *)v8;
}

- (void)setPointerStyleProvider:(UIButtonPointerStyleProvider)pointerStyleProvider
{
  if (self->_pointerStyleProvider != pointerStyleProvider)
  {
    id v4 = (void *)[pointerStyleProvider copy];
    id v5 = self->_pointerStyleProvider;
    self->_pointerStyleProvider = v4;

    if (self->_pointerStyleProvider) {
      [(UIControl *)self setPointerInteractionEnabled:1];
    }
    [(UIControl *)self _invalidatePointerInteraction];
  }
}

+ (UIButton)buttonWithConfiguration:(UIButtonConfiguration *)configuration primaryAction:(UIAction *)primaryAction
{
  id v6 = primaryAction;
  int64_t v7 = configuration;
  int v8 = [a1 buttonWithType:1];
  [v8 setConfiguration:v7];

  if (v6) {
    [v8 _commonInitForPrimaryAction:v6];
  }

  return (UIButton *)v8;
}

- (void)_setImageContentMode:(int64_t)a3
{
  self->__imageContentMode = a3;
  __int16 buttonVisualProviderFlags = (__int16)self->_buttonVisualProviderFlags;
  if (buttonVisualProviderFlags)
  {
    if ((buttonVisualProviderFlags & 0x40) == 0) {
      return;
    }
  }
  else
  {
    id v6 = [(UIButton *)self _visualProvider];
    if (!v6) {
      return;
    }
    __int16 v7 = (__int16)self->_buttonVisualProviderFlags;

    if ((v7 & 0x40) == 0) {
      return;
    }
  }
  id v8 = [(UIButton *)self _visualProvider];
  [v8 setImageContentMode:a3];
}

- (void)_setDisableAutomaticTitleAnimations:(BOOL)a3
{
  uint64_t v3 = 0x200000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_buttonFlags = ($1CF1FC38577B636919C637EEED589224)(*(void *)&self->_buttonFlags & 0xFFFFFFFDFFFFFFFFLL | v3);
}

- (void)_commonInitForPrimaryAction:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)UIButton;
  [(UIControl *)&v8 _commonInitForPrimaryAction:v4];
  UIButtonType v5 = [(UIButton *)self buttonType];
  if ((unint64_t)(v5 - 124) < 3 || (unint64_t)v5 <= UIButtonTypeSystem)
  {
    id v6 = [v4 title];
    if ([v6 length]) {
      [(UIButton *)self setTitle:v6 forState:0];
    }
    __int16 v7 = [v4 image];
    if (v7) {
      [(UIButton *)self setImage:v7 forState:0];
    }
  }
}

- (CGRect)titleRectForContentRect:(CGRect)contentRect
{
  double height = contentRect.size.height;
  double width = contentRect.size.width;
  double y = contentRect.origin.y;
  double x = contentRect.origin.x;
  __int16 v7 = [(UIButton *)self _visualProvider];
  objc_msgSend(v7, "titleRectForContentRect:", x, y, width, height);
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;

  double v16 = v9;
  double v17 = v11;
  double v18 = v13;
  double v19 = v15;
  result.size.double height = v19;
  result.size.double width = v18;
  result.origin.double y = v17;
  result.origin.double x = v16;
  return result;
}

- (void)_didMoveFromWindow:(id)a3 toWindow:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)UIButton;
  [(UIControl *)&v14 _didMoveFromWindow:v6 toWindow:v7];
  uint64_t v10 = 0;
  double v11 = &v10;
  uint64_t v12 = 0x2020000000;
  char v13 = 0;
  contentLookup = self->_contentLookup;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __40__UIButton__didMoveFromWindow_toWindow___block_invoke;
  v9[3] = &unk_1E52EAB40;
  v9[4] = self;
  v9[5] = &v10;
  [(NSMutableDictionary *)contentLookup enumerateKeysAndObjectsUsingBlock:v9];
  if (*((unsigned char *)v11 + 24))
  {
    if ((~*(void *)&self->super.super._viewFlags & 0x420000000000000) == 0) {
      [(UIView *)self invalidateIntrinsicContentSize];
    }
    if ([(UIButton *)self autosizesToFit]) {
      [(UIView *)self sizeToFit];
    }
    [(UIButton *)self _invalidateForPropertyChange];
  }
  _Block_object_dispose(&v10, 8);
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)UIButton;
  [(UIView *)&v2 dealloc];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__plainButtonBackgroundColor, 0);
  objc_storeStrong((id *)&self->_selectionInteraction, 0);
  objc_storeStrong((id *)&self->_menu, 0);
  objc_storeStrong(&self->_pointerStyleProvider, 0);
  objc_storeStrong(&self->_configurationUpdateHandler, 0);
  objc_storeStrong(&self->_menuProvider, 0);
  objc_destroyWeak((id *)&self->_activeSizeToFitLayoutEngine);
  objc_storeStrong((id *)&self->_lazyTitleViewFont, 0);
  objc_storeStrong((id *)&self->_visualProvider, 0);
  objc_storeStrong((id *)&self->_selectGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_contentLookup, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
}

- (void)setTitleColor:(UIColor *)color forState:(UIControlState)state
{
  if (-[UIButton _setContentValue:forField:state:](self, color, @"titleColor", state))
  {
    -[UIButton _markAndLayoutAsNeededForField:state:](self, @"titleColor", state);
  }
}

- (void)_willMoveToWindow:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)UIButton;
  id v4 = a3;
  [(UIControl *)&v6 _willMoveToWindow:v4];
  UIButtonType v5 = [(UIButton *)self _visualProvider];
  [v5 willMoveToWindow:v4];
}

- (void)setRole:(UIButtonRole)role
{
  self->_buttonFlags = ($1CF1FC38577B636919C637EEED589224)(*(void *)&self->_buttonFlags & 0xFFFFFFFFFFC03FFFLL | ((unint64_t)role << 14));
  id v4 = [(UIButton *)self _visualProvider];
  [v4 setRole:role];
}

+ (id)_defaultBackgroundImageColorForType:(int64_t)a3 andState:(unint64_t)a4
{
  if (a3 == 7)
  {
    objc_super v6 = +[UIColor tertiarySystemFillColor];
  }
  else
  {
    objc_super v6 = 0;
  }
  return v6;
}

- (void)setTitle:(NSString *)title forState:(UIControlState)state
{
  objc_super v6 = title;
  int v7 = -[UIButton _setContentValue:forField:state:](self, v6, @"title", state);
  double v8 = [(UIButton *)self _visualProvider];
  [v8 setTitle:v6 forState:state];

  if ([(UIButton *)self autosizesToFit]) {
    [(UIView *)self sizeToFit];
  }
  if (v7)
  {
    -[UIButton _markAndLayoutAsNeededForField:state:](self, @"title", state);
  }
}

- (void)setMenu:(UIMenu *)menu
{
  if (self->_menu != menu)
  {
    uint64_t v4 = menu;
    uint64_t v5 = [(UIControl *)self contextMenuInteraction];
    _UIControlMenuUpdateVisibleMenu(v5, self->_menu, v4);

    objc_super v6 = (UIMenu *)[(UIMenu *)v4 copy];
    int v7 = self->_menu;
    self->_menu = v6;

    [(UIButton *)self _updateForAutomaticSelection];
    double v8 = [(UIButton *)self _visualProvider];
    [v8 setMenu:self->_menu];

    [(UIButton *)self _refreshVisualProvider];
    [(UIButton *)self _updateContextMenuEnabled];
  }
}

- (void)setContentVerticalAlignment:(int64_t)a3
{
  if ([(UIControl *)self contentVerticalAlignment] != a3)
  {
    v6.receiver = self;
    v6.super_class = (Class)UIButton;
    [(UIControl *)&v6 setContentVerticalAlignment:a3];
    uint64_t v5 = [(UIButton *)self _visualProvider];
    [v5 setContentVerticalAlignment:a3];
  }
}

- (void)setContentHorizontalAlignment:(int64_t)a3
{
  if ([(UIControl *)self contentHorizontalAlignment] != a3)
  {
    v6.receiver = self;
    v6.super_class = (Class)UIButton;
    [(UIControl *)&v6 setContentHorizontalAlignment:a3];
    uint64_t v5 = [(UIButton *)self _visualProvider];
    [v5 setContentHorizontalAlignment:a3];
  }
}

- (double)_preferredMaxLayoutWidth
{
  __int16 buttonVisualProviderFlags = (__int16)self->_buttonVisualProviderFlags;
  if (buttonVisualProviderFlags)
  {
    if ((buttonVisualProviderFlags & 4) != 0)
    {
LABEL_4:
      objc_super v6 = [(UIButton *)self _visualProvider];
      [v6 widthForMultilineTextLayout];
      double v8 = v7;

      return v8;
    }
  }
  else
  {
    uint64_t v4 = [(UIButton *)self _visualProvider];
    if (v4)
    {
      __int16 v5 = (__int16)self->_buttonVisualProviderFlags;

      if ((v5 & 4) != 0) {
        goto LABEL_4;
      }
    }
  }
  v10.receiver = self;
  v10.super_class = (Class)UIButton;
  [(UIView *)&v10 _preferredMaxLayoutWidth];
  return result;
}

- (void)setPreferredMenuElementOrder:(UIContextMenuConfigurationElementOrder)preferredMenuElementOrder
{
  self->_preferredMenuElementOrder = preferredMenuElementOrder;
}

- (void)_updateContextMenuEnabled
{
  uint64_t v3 = [(UIButton *)self _visualProvider];
  int v4 = [(id)objc_opt_class() shouldUpdateContextMenuEnabledOnMenuChanges];

  if (v4)
  {
    if (self->_menu) {
      BOOL v5 = 1;
    }
    else {
      BOOL v5 = self->_menuProvider != 0;
    }
    [(UIControl *)self setContextMenuInteractionEnabled:v5];
  }
}

- (void)_setWantsAccessibilityUnderline:(BOOL)a3
{
  uint64_t v3 = 0x20000000;
  if (a3) {
    uint64_t v3 = 0;
  }
  self->_buttonFlags = ($1CF1FC38577B636919C637EEED589224)(*(void *)&self->_buttonFlags & 0xFFFFFFFFDFFFFFFFLL | v3);
}

- (void)setPreferredBehavioralStyle:(UIBehavioralStyle)preferredBehavioralStyle
{
  char v3 = preferredBehavioralStyle;
  UIBehavioralStyle v5 = [(UIButton *)self behavioralStyle];
  *(_WORD *)&self->___int16 buttonVisualProviderFlags = *(_WORD *)&self->_buttonVisualProviderFlags & 0xF87F | ((v3 & 0xF) << 7);
  if (v5 != [(UIButton *)self behavioralStyle])
  {
    [(UIButton *)self _refreshVisualProvider];
  }
}

- (UIBehavioralStyle)behavioralStyle
{
  return 1;
}

- (void)setDisabledDimsImage:(BOOL)a3
{
  if (((((*(void *)&self->_buttonFlags & 0x10) == 0) ^ a3) & 1) == 0)
  {
    uint64_t v3 = 16;
    if (!a3) {
      uint64_t v3 = 0;
    }
    self->_buttonFlags = ($1CF1FC38577B636919C637EEED589224)(*(void *)&self->_buttonFlags & 0xFFFFFFFFFFFFFFEFLL | v3);
    [(UIButton *)self setNeedsLayout];
  }
}

- (void)setImageEdgeInsets:(UIEdgeInsets)imageEdgeInsets
{
  if (self->_imageEdgeInsets.left != imageEdgeInsets.left
    || self->_imageEdgeInsets.top != imageEdgeInsets.top
    || self->_imageEdgeInsets.right != imageEdgeInsets.right
    || self->_imageEdgeInsets.bottom != imageEdgeInsets.bottom)
  {
    self->_imageEdgeInsets = imageEdgeInsets;
    if ([(UIButton *)self autosizesToFit]) {
      [(UIView *)self sizeToFit];
    }
    [(UIView *)self invalidateIntrinsicContentSize];
    [(UIButton *)self setNeedsLayout];
  }
}

- (UILabel)subtitleLabel
{
  if ((*(_WORD *)&self->_buttonVisualProviderFlags & 4) != 0)
  {
    uint64_t v3 = [(UIButton *)self _visualProvider];
    objc_super v2 = [v3 subtitleViewCreateIfNeeded:1];
  }
  else
  {
    objc_super v2 = 0;
  }
  return (UILabel *)v2;
}

- (void)_setFont:(id)a3
{
}

- (void)_setMenuProvider:(id)a3
{
  if (self->_menuProvider != a3)
  {
    id v4 = a3;
    UIBehavioralStyle v5 = (void *)[v4 copy];
    id menuProvider = self->_menuProvider;
    self->_id menuProvider = v5;

    double v7 = [(UIButton *)self _visualProvider];
    [v7 setMenuProvider:v4];

    [(UIButton *)self _updateContextMenuEnabled];
  }
}

- (void)setConfigurationUpdateHandler:(UIButtonConfigurationUpdateHandler)configurationUpdateHandler
{
  if (self->_configurationUpdateHandler == configurationUpdateHandler) {
    return;
  }
  id v4 = (void *)[configurationUpdateHandler copy];
  id v5 = self->_configurationUpdateHandler;
  self->_configurationUpdateHandler = v4;

  __int16 buttonVisualProviderFlags = (__int16)self->_buttonVisualProviderFlags;
  if (buttonVisualProviderFlags)
  {
    if ((buttonVisualProviderFlags & 4) != 0) {
      goto LABEL_9;
    }
LABEL_8:
    [(UIButton *)self _refreshVisualProvider];
    goto LABEL_9;
  }
  double v7 = [(UIButton *)self _visualProvider];
  if (v7)
  {
    __int16 v8 = (__int16)self->_buttonVisualProviderFlags;

    if ((v8 & 4) == 0) {
      goto LABEL_8;
    }
  }
LABEL_9:
  [(UIButton *)self setNeedsUpdateConfiguration];
}

- (void)setAdjustsImageSizeForAccessibilityContentSizeCategory:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(UIButton *)self adjustsImageSizeForAccessibilityContentSizeCategory] != a3)
  {
    uint64_t v5 = 0x100000000;
    if (!v3) {
      uint64_t v5 = 0;
    }
    self->_buttonFlags = ($1CF1FC38577B636919C637EEED589224)(*(void *)&self->_buttonFlags & 0xFFFFFFFEFFFFFFFFLL | v5);
    [(UIView *)self invalidateIntrinsicContentSize];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __117__UIButton_UIAccessibilityContentSizeCategoryImageAdjusting__setAdjustsImageSizeForAccessibilityContentSizeCategory___block_invoke;
    v6[3] = &unk_1E52D9F70;
    v6[4] = self;
    +[UIView performWithoutAnimation:v6];
  }
}

- (void)_setTitleFrozen:(BOOL)a3
{
  uint64_t v3 = 0x800000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_buttonFlags = ($1CF1FC38577B636919C637EEED589224)(*(void *)&self->_buttonFlags & 0xFFFFFFFFFF7FFFFFLL | v3);
}

- (void)_setHasActiveMenuPresentation:(BOOL)a3
{
  BOOL v3 = a3;
  BOOL v5 = [(UIControl *)self _hasActiveMenuPresentation];
  v6.receiver = self;
  v6.super_class = (Class)UIButton;
  [(UIControl *)&v6 _setHasActiveMenuPresentation:v3];
  if (v5 != v3) {
    [(UIButton *)self setNeedsUpdateConfiguration];
  }
}

- (void)_updateConfigurationWithObservationTracking:(id)a3
{
  swift_unknownObjectRetain();
  BOOL v5 = self;
  sub_185A8C220(a3);
  swift_unknownObjectRelease();
}

- (BOOL)isAccessibilityElementByDefault
{
  return 1;
}

- (unint64_t)defaultAccessibilityTraits
{
  v3.receiver = self;
  v3.super_class = (Class)UIButton;
  return [&v3 defaultAccessibilityTraits] | 1;
}

- (BOOL)isElementAccessibilityExposedToInterfaceBuilder
{
  return 1;
}

- (UIBehavioralStyle)preferredBehavioralStyle
{
  return ((unint64_t)*(_WORD *)&self->_buttonVisualProviderFlags >> 7) & 0xF;
}

- (NSString)description
{
  v6.receiver = self;
  v6.super_class = (Class)UIButton;
  objc_super v3 = [(UIView *)&v6 description];
  id v4 = (void *)[v3 mutableCopy];

  if (self->_configuration) {
    [v4 appendFormat:@" configuration=%@", self->_configuration];
  }
  return (NSString *)v4;
}

- (id)_layoutDebuggingTitle
{
  objc_super v3 = [(UIButton *)self titleForState:0];
  id v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    objc_super v6 = [(UIButton *)self attributedTitleForState:0];
    id v5 = [v6 string];
  }
  return v5;
}

+ (UIButton)systemButtonWithImage:(UIImage *)image target:(id)target action:(SEL)action
{
  __int16 v8 = image;
  id v9 = target;
  objc_super v10 = [a1 buttonWithType:1];
  double v11 = v10;
  if (v8) {
    [v10 setImage:v8 forState:0];
  }
  if (action) {
    [v11 addTarget:v9 action:action forControlEvents:64];
  }
  [v11 sizeToFit];

  return (UIButton *)v11;
}

+ (UIButton)systemButtonWithPrimaryAction:(UIAction *)primaryAction
{
  return (UIButton *)[a1 buttonWithType:1 primaryAction:primaryAction];
}

+ (id)_defaultNormalTitleColor
{
  return +[UIColor whiteColor];
}

+ (id)_defaultNormalTitleShadowColor
{
  return 0;
}

- (UIButton)initWithCoder:(NSCoder *)coder
{
  uint64_t v60 = *MEMORY[0x1E4F143B8];
  id v4 = coder;
  v58.receiver = self;
  v58.super_class = (Class)UIButton;
  id v5 = [(UIControl *)&v58 initWithCoder:v4];
  objc_super v6 = v5;
  if (!v5) {
    goto LABEL_43;
  }
  *(void *)&v5->_buttonFlags &= 0xFFFFFFFFFFFFC03FLL;
  if ([(NSCoder *)v4 containsValueForKey:@"UIButtonType"]) {
    unint64_t buttonFlags = *(void *)&v6->_buttonFlags & 0xFFFFFFFFFFFFC03FLL | ((unint64_t)[(NSCoder *)v4 decodeIntegerForKey:@"UIButtonType"] << 6);
  }
  else {
    unint64_t buttonFlags = (unint64_t)v6->_buttonFlags;
  }
  v6->_unint64_t buttonFlags = ($1CF1FC38577B636919C637EEED589224)(buttonFlags & 0xFFFFFFFFFFC03FFFLL);
  if ([(NSCoder *)v4 containsValueForKey:@"UIButtonRole"]) {
    v6->_unint64_t buttonFlags = ($1CF1FC38577B636919C637EEED589224)(*(void *)&v6->_buttonFlags & 0xFFFFFFFFFFC03FFFLL | ((unint64_t)[(NSCoder *)v4 decodeIntegerForKey:@"UIButtonRole"] << 14));
  }
  __int16 v8 = [(NSCoder *)v4 decodeObjectForKey:@"UIReversesTitleShadowOnHighlight"];

  if (v8) {
    id v9 = @"UIReversesTitleShadowOnHighlight";
  }
  else {
    id v9 = @"UIReversesTitleShadowWhenHighlighted";
  }
  v6->_unint64_t buttonFlags = ($1CF1FC38577B636919C637EEED589224)(*(void *)&v6->_buttonFlags & 0xFFFFFFFFFFFFFFFELL | [(NSCoder *)v4 decodeBoolForKey:v9]);
  [(UIButton *)v6 setShowsTouchWhenHighlighted:[(NSCoder *)v4 decodeBoolForKey:@"UIShowsTouchWhenHighlighted"]];
  BOOL v10 = [(NSCoder *)v4 decodeBoolForKey:@"UIAdjustsImageWhenHighlighted"];
  uint64_t v11 = 2;
  if (!v10) {
    uint64_t v11 = 0;
  }
  v6->_unint64_t buttonFlags = ($1CF1FC38577B636919C637EEED589224)(*(void *)&v6->_buttonFlags & 0xFFFFFFFFFFFFFFFDLL | v11);
  BOOL v12 = [(NSCoder *)v4 decodeBoolForKey:@"UIAdjustsImageWhenDisabled"];
  uint64_t v13 = 4;
  if (!v12) {
    uint64_t v13 = 0;
  }
  v6->_unint64_t buttonFlags = ($1CF1FC38577B636919C637EEED589224)(*(void *)&v6->_buttonFlags & 0xFFFFFFFFFFFFFFFBLL | v13);
  BOOL v14 = [(NSCoder *)v4 decodeBoolForKey:@"UIAdjustsImageSizeForAccessibilityContentSizeCategory"];
  uint64_t v15 = 0x100000000;
  if (!v14) {
    uint64_t v15 = 0;
  }
  v6->_unint64_t buttonFlags = ($1CF1FC38577B636919C637EEED589224)(*(void *)&v6->_buttonFlags & 0xFFFFFFFEFFFFFFFFLL | v15);
  [(NSCoder *)v4 decodeUIEdgeInsetsForKey:@"UIContentEdgeInsets"];
  v6->_contentEdgeInsets.double top = v16;
  v6->_contentEdgeInsets.double left = v17;
  v6->_contentEdgeInsets.double bottom = v18;
  v6->_contentEdgeInsets.double right = v19;
  [(NSCoder *)v4 decodeUIEdgeInsetsForKey:@"UITitleEdgeInsets"];
  v6->_titleEdgeInsets.double top = v20;
  v6->_titleEdgeInsets.double left = v21;
  v6->_titleEdgeInsets.double bottom = v22;
  v6->_titleEdgeInsets.double right = v23;
  [(NSCoder *)v4 decodeUIEdgeInsetsForKey:@"UIImageEdgeInsets"];
  v6->_imageEdgeInsets.double top = v24;
  v6->_imageEdgeInsets.double left = v25;
  v6->_imageEdgeInsets.double bottom = v26;
  v6->_imageEdgeInsets.double right = v27;
  v28 = [(NSCoder *)v4 decodeObjectForKey:@"UIButtonStatefulContent"];
  [(UIButton *)v6 _takeContentFromArchivableContent:v28];
  *(void *)&v6->_buttonFlags |= 0x80000000uLL;
  if ([(UIButton *)v6 _shouldHaveFloatingAppearance])
  {
    uint64_t v29 = [(UIView *)v6 subviews];
    v30 = (void *)[v29 copy];

    v31 = [(UIButton *)v6 _effectiveContentView];
    long long v54 = 0u;
    long long v55 = 0u;
    long long v56 = 0u;
    long long v57 = 0u;
    id v32 = v30;
    uint64_t v33 = [v32 countByEnumeratingWithState:&v54 objects:v59 count:16];
    if (v33)
    {
      uint64_t v34 = v33;
      uint64_t v35 = *(void *)v55;
      do
      {
        for (uint64_t i = 0; i != v34; ++i)
        {
          if (*(void *)v55 != v35) {
            objc_enumerationMutation(v32);
          }
          objc_msgSend(v31, "addSubview:", *(void *)(*((void *)&v54 + 1) + 8 * i), (void)v54);
        }
        uint64_t v34 = [v32 countByEnumeratingWithState:&v54 objects:v59 count:16];
      }
      while (v34);
    }
  }
  objc_msgSend(off_1E52D39B8, "defaultFontSize", (void)v54);
  uint64_t v38 = [off_1E52D39B8 systemFontOfSize:v37 + 1.0];
  lazyTitleViewFont = v6->_lazyTitleViewFont;
  v6->_lazyTitleViewFont = (UIFont *)v38;

  v40 = [(NSCoder *)v4 decodeObjectForKey:@"UIFont"];
  v41 = [(UIView *)v6 traitCollection];
  uint64_t v42 = [v41 userInterfaceIdiom];

  if (v42 == 5)
  {
    v43 = [off_1E52D39B8 systemFontOfSize:14.0];
    int v44 = [v40 isEqual:v43];

    if (!v44) {
      goto LABEL_30;
    }
    goto LABEL_29;
  }
  v45 = [off_1E52D39B8 systemFontOfSize:18.0];
  char v46 = [v40 isEqual:v45];

  if (v46)
  {
LABEL_29:

    v40 = 0;
  }
LABEL_30:
  [(UIButton *)v6 _setFont:v40];
  if ([(NSCoder *)v4 containsValueForKey:@"UILineBreakMode"]) {
    [(UIButton *)v6 _setLineBreakMode:[(NSCoder *)v4 decodeIntegerForKey:@"UILineBreakMode"]];
  }
  [(NSCoder *)v4 decodeCGSizeForKey:@"UITitleShadowOffset"];
  -[UIButton _setTitleShadowOffset:](v6, "_setTitleShadowOffset:");
  *(_WORD *)&v6->___int16 buttonVisualProviderFlags = *(_WORD *)&v6->_buttonVisualProviderFlags & 0xF87F | (([(NSCoder *)v4 decodeIntegerForKey:@"UIBehavioralStyle"] & 0xF) << 7);
  if ([(NSCoder *)v4 containsValueForKey:@"UISpringLoaded"]) {
    [(UIButton *)v6 setSpringLoaded:[(NSCoder *)v4 decodeBoolForKey:@"UISpringLoaded"]];
  }
  if ([(NSCoder *)v4 containsValueForKey:@"UIButtonMenu"])
  {
    uint64_t v47 = [(NSCoder *)v4 decodeObjectOfClass:objc_opt_class() forKey:@"UIButtonMenu"];
    menu = v6->_menu;
    v6->_menu = (UIMenu *)v47;
  }
  if ([(NSCoder *)v4 containsValueForKey:@"UIButtonChangesSelectionAsPrimaryAction"])
  {
    BOOL v49 = [(NSCoder *)v4 decodeBoolForKey:@"UIButtonChangesSelectionAsPrimaryAction"];
    uint64_t v50 = 0x2000000000;
    if (!v49) {
      uint64_t v50 = 0;
    }
    v6->_unint64_t buttonFlags = ($1CF1FC38577B636919C637EEED589224)(*(void *)&v6->_buttonFlags & 0xFFFFFFDFFFFFFFFFLL | v50);
  }
  [(UIButton *)v6 _updateForAutomaticSelection];
  if ([(NSCoder *)v4 containsValueForKey:@"UIButtonConfiguration"])
  {
    uint64_t v51 = [(NSCoder *)v4 decodeObjectForKey:@"UIButtonConfiguration"];
    configuration = v6->_configuration;
    v6->_configuration = (_UIButtonConfigurationShim *)v51;
  }
  _UIButtonCommonInit(v6);
  [(UIButton *)v6 _refreshVisualProvider];

LABEL_43:
  return v6;
}

- (UIButton)initWithFrame:(CGRect)frame primaryAction:(UIAction *)primaryAction
{
  v5.receiver = self;
  v5.super_class = (Class)UIButton;
  return -[UIControl initWithFrame:primaryAction:](&v5, sel_initWithFrame_primaryAction_, primaryAction, frame.origin.x, frame.origin.y, frame.size.width, frame.size.height);
}

- (id)_encodableSubviews
{
  __int16 buttonVisualProviderFlags = (__int16)self->_buttonVisualProviderFlags;
  if (buttonVisualProviderFlags)
  {
    if ((buttonVisualProviderFlags & 8) != 0)
    {
LABEL_4:
      objc_super v6 = [(UIButton *)self _visualProvider];
      double v7 = [v6 encodableSubviews];

      goto LABEL_7;
    }
  }
  else
  {
    id v4 = [(UIButton *)self _visualProvider];
    if (v4)
    {
      __int16 v5 = (__int16)self->_buttonVisualProviderFlags;

      if ((v5 & 8) != 0) {
        goto LABEL_4;
      }
    }
  }
  double v7 = 0;
LABEL_7:
  return v7;
}

- (void)_populateArchivedSubviews:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)UIButton;
  [(UIView *)&v9 _populateArchivedSubviews:v4];
  __int16 buttonVisualProviderFlags = (__int16)self->_buttonVisualProviderFlags;
  if (buttonVisualProviderFlags)
  {
    if ((buttonVisualProviderFlags & 8) == 0) {
      goto LABEL_7;
    }
LABEL_6:
    __int16 v8 = [(UIButton *)self _visualProvider];
    [v8 populateArchivedSubviews:v4];

    goto LABEL_7;
  }
  objc_super v6 = [(UIButton *)self _visualProvider];
  if (v6)
  {
    __int16 v7 = (__int16)self->_buttonVisualProviderFlags;

    if ((v7 & 8) != 0) {
      goto LABEL_6;
    }
  }
LABEL_7:
}

- (void)encodeWithCoder:(id)a3
{
  id v5 = a3;
  v24.receiver = self;
  v24.super_class = (Class)UIButton;
  [(UIControl *)&v24 encodeWithCoder:v5];
  id v23 = 0;
  objc_super v6 = [(UIButton *)self _archivableContent:&v23];
  id v7 = v23;
  if ([v6 count]) {
    [v5 encodeObject:v6 forKey:@"UIButtonStatefulContent"];
  }
  if ([v7 count]) {
    [v5 encodeObject:v7 forKey:@"UIButtonStatefulContentOverrides"];
  }
  __int16 buttonVisualProviderFlags = (__int16)self->_buttonVisualProviderFlags;
  if (buttonVisualProviderFlags)
  {
    if ((buttonVisualProviderFlags & 0x20) == 0) {
      goto LABEL_15;
    }
  }
  else
  {
    objc_super v3 = [(UIButton *)self _visualProvider];
    if (!v3 || (*(_WORD *)&self->_buttonVisualProviderFlags & 0x20) == 0) {
      goto LABEL_14;
    }
  }
  objc_super v9 = [(UIButton *)self _visualProvider];
  uint64_t v10 = [v9 lineBreakMode];

  if ((buttonVisualProviderFlags & 1) == 0) {
  if (v10 != 5)
  }
  {
    objc_super v3 = [(UIButton *)self _visualProvider];
    objc_msgSend(v5, "encodeInteger:forKey:", objc_msgSend(v3, "lineBreakMode"), @"UILineBreakMode");
LABEL_14:
  }
LABEL_15:
  $1CF1FC38577B636919C637EEED589224 buttonFlags = self->_buttonFlags;
  if (*(unsigned char *)&buttonFlags)
  {
    [v5 encodeBool:1 forKey:@"UIReversesTitleShadowWhenHighlighted"];
    $1CF1FC38577B636919C637EEED589224 buttonFlags = self->_buttonFlags;
    if ((*(unsigned char *)&buttonFlags & 0x20) == 0)
    {
LABEL_17:
      if ((*(unsigned char *)&buttonFlags & 2) == 0) {
        goto LABEL_18;
      }
      goto LABEL_30;
    }
  }
  else if ((*(unsigned char *)&buttonFlags & 0x20) == 0)
  {
    goto LABEL_17;
  }
  [v5 encodeBool:1 forKey:@"UIShowsTouchWhenHighlighted"];
  $1CF1FC38577B636919C637EEED589224 buttonFlags = self->_buttonFlags;
  if ((*(unsigned char *)&buttonFlags & 2) == 0)
  {
LABEL_18:
    if ((*(unsigned char *)&buttonFlags & 4) == 0) {
      goto LABEL_20;
    }
    goto LABEL_19;
  }
LABEL_30:
  [v5 encodeBool:1 forKey:@"UIAdjustsImageWhenHighlighted"];
  $1CF1FC38577B636919C637EEED589224 buttonFlags = self->_buttonFlags;
  if ((*(unsigned char *)&buttonFlags & 4) != 0)
  {
LABEL_19:
    [v5 encodeBool:1 forKey:@"UIAdjustsImageWhenDisabled"];
    $1CF1FC38577B636919C637EEED589224 buttonFlags = self->_buttonFlags;
  }
LABEL_20:
  if ((*(unint64_t *)&buttonFlags >> 6))
  {
    objc_msgSend(v5, "encodeInteger:forKey:");
    $1CF1FC38577B636919C637EEED589224 buttonFlags = self->_buttonFlags;
  }
  if ((*(void *)&buttonFlags & 0x100000000) != 0) {
    [v5 encodeBool:1 forKey:@"UIAdjustsImageSizeForAccessibilityContentSizeCategory"];
  }
  __int16 v12 = (__int16)self->_buttonVisualProviderFlags;
  if (v12)
  {
    if ((v12 & 0x20) == 0) {
      goto LABEL_38;
    }
  }
  else
  {
    objc_super v3 = [(UIButton *)self _visualProvider];
    if (!v3 || (*(_WORD *)&self->_buttonVisualProviderFlags & 0x20) == 0) {
      goto LABEL_37;
    }
  }
  uint64_t v13 = [(UIButton *)self _visualProvider];
  BOOL v14 = [v13 font];

  if ((v12 & 1) == 0) {
  if (v14)
  }
  {
    objc_super v3 = [(UIButton *)self _visualProvider];
    uint64_t v15 = [v3 font];
    [v5 encodeObject:v15 forKey:@"UIFont"];

LABEL_37:
  }
LABEL_38:
  if ((*(_DWORD *)&self->_buttonFlags >> 14)) {
    objc_msgSend(v5, "encodeInteger:forKey:");
  }
  if (self->_contentEdgeInsets.top != 0.0
    || self->_contentEdgeInsets.bottom != 0.0
    || self->_contentEdgeInsets.left != 0.0
    || self->_contentEdgeInsets.right != 0.0)
  {
    objc_msgSend(v5, "encodeUIEdgeInsets:forKey:", @"UIContentEdgeInsets");
  }
  if (self->_titleEdgeInsets.top != 0.0
    || self->_titleEdgeInsets.bottom != 0.0
    || self->_titleEdgeInsets.left != 0.0
    || self->_titleEdgeInsets.right != 0.0)
  {
    objc_msgSend(v5, "encodeUIEdgeInsets:forKey:", @"UITitleEdgeInsets");
  }
  __int16 v16 = (__int16)self->_buttonVisualProviderFlags;
  if (v16)
  {
    if ((v16 & 0x20) == 0) {
      goto LABEL_64;
    }
  }
  else
  {
    objc_super v3 = [(UIButton *)self _visualProvider];
    if (!v3 || (*(_WORD *)&self->_buttonVisualProviderFlags & 0x20) == 0) {
      goto LABEL_63;
    }
  }
  CGFloat v17 = [(UIButton *)self _visualProvider];
  [v17 titleShadowOffset];
  BOOL v20 = v19 != *(double *)(MEMORY[0x1E4F1DB30] + 8) || v18 != *MEMORY[0x1E4F1DB30];

  if ((v16 & 1) == 0)
  {

    if (!v20) {
      goto LABEL_64;
    }
    goto LABEL_62;
  }
  if (v20)
  {
LABEL_62:
    objc_super v3 = [(UIButton *)self _visualProvider];
    [v3 titleShadowOffset];
    objc_msgSend(v5, "encodeCGSize:forKey:", @"UITitleShadowOffset");
LABEL_63:
  }
LABEL_64:
  if (self->_imageEdgeInsets.top != 0.0
    || self->_imageEdgeInsets.bottom != 0.0
    || self->_imageEdgeInsets.left != 0.0
    || self->_imageEdgeInsets.right != 0.0)
  {
    objc_msgSend(v5, "encodeUIEdgeInsets:forKey:", @"UIImageEdgeInsets");
  }
  unint64_t v21 = ((unint64_t)*(_WORD *)&self->_buttonVisualProviderFlags >> 7) & 0xF;
  if (v21) {
    [v5 encodeInteger:v21 forKey:@"UIBehavioralStyle"];
  }
  if ([(UIButton *)self isSpringLoaded]) {
    [v5 encodeBool:1 forKey:@"UISpringLoaded"];
  }
  menu = self->_menu;
  if (menu) {
    [v5 encodeObject:menu forKey:@"UIButtonMenu"];
  }
  if ((*((unsigned char *)&self->_buttonFlags + 4) & 0x20) != 0) {
    [v5 encodeBool:1 forKey:@"UIButtonChangesSelectionAsPrimaryAction"];
  }
  [v5 encodeObject:self->_configuration forKey:@"UIButtonConfiguration"];
}

- (void)_setHighlightedWithoutUpdatingState:(BOOL)a3
{
  v3.receiver = self;
  v3.super_class = (Class)UIButton;
  [(UIControl *)&v3 setHighlighted:a3];
}

- (void)_setHovered:(BOOL)a3
{
  $1CF1FC38577B636919C637EEED589224 buttonFlags = self->_buttonFlags;
  if (((((*(void *)&buttonFlags & 0x800000000) == 0) ^ a3) & 1) == 0)
  {
    uint64_t v4 = 0x800000000;
    if (!a3) {
      uint64_t v4 = 0;
    }
    self->_$1CF1FC38577B636919C637EEED589224 buttonFlags = ($1CF1FC38577B636919C637EEED589224)(*(void *)&buttonFlags & 0xFFFFFFF7FFFFFFFFLL | v4);
    [(UIButton *)self setNeedsUpdateConfiguration];
  }
}

- (BOOL)isHovered
{
  return (*((unsigned __int8 *)&self->_buttonFlags + 4) >> 3) & 1;
}

- (void)setTitleEdgeInsets:(UIEdgeInsets)titleEdgeInsets
{
  if (self->_titleEdgeInsets.left != titleEdgeInsets.left
    || self->_titleEdgeInsets.top != titleEdgeInsets.top
    || self->_titleEdgeInsets.right != titleEdgeInsets.right
    || self->_titleEdgeInsets.bottom != titleEdgeInsets.bottom)
  {
    self->_titleEdgeInsets = titleEdgeInsets;
    if ([(UIButton *)self autosizesToFit]) {
      [(UIView *)self sizeToFit];
    }
    [(UIView *)self invalidateIntrinsicContentSize];
    [(UIButton *)self setNeedsLayout];
  }
}

- (BOOL)reversesTitleShadowWhenHighlighted
{
  return *(_DWORD *)&self->_buttonFlags & 1;
}

- (void)setReversesTitleShadowWhenHighlighted:(BOOL)reversesTitleShadowWhenHighlighted
{
  if (((((*(void *)&self->_buttonFlags & 1) == 0) ^ reversesTitleShadowWhenHighlighted) & 1) == 0)
  {
    BOOL v3 = reversesTitleShadowWhenHighlighted;
    self->_$1CF1FC38577B636919C637EEED589224 buttonFlags = ($1CF1FC38577B636919C637EEED589224)(*(void *)&self->_buttonFlags & 0xFFFFFFFFFFFFFFFELL | reversesTitleShadowWhenHighlighted);
    id v4 = [(UIButton *)self _visualProvider];
    [v4 setReversesTitleShadowWhenHighlighted:v3];
  }
}

+ (void)_registerVisualProviderClass:(Class)a3 forIdiom:(int64_t)a4
{
  objc_super v6 = (void *)__UIButtonIdiomsToVisualProviderClasses;
  if (!__UIButtonIdiomsToVisualProviderClasses)
  {
    uint64_t v7 = [MEMORY[0x1E4F1CA60] dictionary];
    __int16 v8 = (void *)__UIButtonIdiomsToVisualProviderClasses;
    __UIButtonIdiomsToVisualProviderClasses = v7;

    objc_super v6 = (void *)__UIButtonIdiomsToVisualProviderClasses;
  }
  objc_super v9 = [NSNumber numberWithInteger:a4];
  id v14 = [v6 objectForKeyedSubscript:v9];

  if (!v14)
  {
    id v14 = [MEMORY[0x1E4F1CA60] dictionary];
    uint64_t v10 = (void *)__UIButtonIdiomsToVisualProviderClasses;
    uint64_t v11 = [NSNumber numberWithInteger:a4];
    [v10 setObject:v14 forKeyedSubscript:v11];
  }
  if ([(objc_class *)a3 instancesRespondToSelector:sel_automaticallyUpdateConfigurationIfNecessary_])uint64_t v12 = 2; {
  else
  }
    uint64_t v12 = objc_opt_respondsToSelector() & 1;
  uint64_t v13 = [NSNumber numberWithUnsignedInteger:v12];
  [v14 setObject:a3 forKeyedSubscript:v13];
}

- (BOOL)_supportsMacIdiom
{
  return [(UIButton *)self isMemberOfClass:NSClassFromString(&cfstr_Cnpropertylabe.isa)] ^ 1;
}

- (BOOL)_disableAutomaticTitleAnimations
{
  return (*((unsigned __int8 *)&self->_buttonFlags + 4) >> 1) & 1;
}

- (BOOL)_hasVisibleDefaultSelectionIndicator
{
  if (![(UIControl *)self isSelected]) {
    return 0;
  }
  BOOL v3 = [(UIButton *)self _selectionIndicatorView];
  id v4 = [v3 superview];
  BOOL v5 = v4 != 0;

  return v5;
}

- (BOOL)_isEffectivelyDisabledExternalButton
{
  BOOL v3 = [(UIView *)self traitCollection];
  BOOL v4 = [(UIButton *)self _isInCarPlay]
    && ![(UIButton *)self canBecomeFocused]
    && ([v3 interactionModel] & 1) == 0;

  return v4;
}

- (void)_didUpdateFocusInContext:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)UIButton;
  [(UIView *)&v9 _didUpdateFocusInContext:v5];
  objc_super v6 = +[_UIFocusAnimationCoordinatorManager animationCoordinatorForContext:v5];
  if (!v6)
  {
    __int16 v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2 object:self file:@"UIButton.m" lineNumber:1842 description:@"Received call to _didUpdateFocusInContext: outside of a focus update."];
  }
  uint64_t v7 = [(UIButton *)self _visualProvider];
  [v7 didUpdateFocusInContext:v5 withAnimationCoordinator:v6];
}

- (BOOL)canBecomeFocused
{
  v6.receiver = self;
  v6.super_class = (Class)UIButton;
  if (![(UIControl *)&v6 canBecomeFocused]) {
    return 0;
  }
  BOOL v3 = [(UIButton *)self _visualProvider];
  char v4 = [v3 canBecomeFocused];

  return v4;
}

- (id)_defaultFocusEffect
{
  BOOL v3 = [(UIButton *)self _visualProvider];
  char v4 = [v3 defaultFocusEffect];
  id v5 = v4;
  if (v4)
  {
    id v6 = v4;
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)UIButton;
    id v6 = [(UIView *)&v9 _defaultFocusEffect];
  }
  uint64_t v7 = v6;

  return v7;
}

- (double)_focusSizeIncrease
{
  objc_super v2 = [(UIButton *)self _visualProvider];
  [v2 focusSizeIncrease];
  double v4 = v3;

  return v4;
}

- (void)_setFocusSizeIncrease:(double)a3
{
  id v4 = [(UIButton *)self _visualProvider];
  [v4 setFocusSizeIncrease:a3];
}

- (id)_preferredConfigurationForFocusAnimation:(int64_t)a3 inContext:(id)a4
{
  id v6 = a4;
  uint64_t v7 = [(UIButton *)self _visualProvider];
  __int16 v8 = [v7 preferredConfigurationForFocusAnimation:a3 inContext:v6];
  objc_super v9 = v8;
  if (v8)
  {
    id v10 = v8;
  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)UIButton;
    id v10 = [(UIView *)&v13 _preferredConfigurationForFocusAnimation:a3 inContext:v6];
  }
  uint64_t v11 = v10;

  return v11;
}

- (unint64_t)_controlEventsForActionTriggered
{
  return 64;
}

- (BOOL)beginTrackingWithTouch:(id)a3 withEvent:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  __int16 v8 = [(UIButton *)self _visualProvider];
  [v8 touchesBegan];

  if (_UIDeviceHasExternalTouchInput())
  {
    BOOL v9 = 0;
  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)UIButton;
    BOOL v9 = [(UIControl *)&v11 beginTrackingWithTouch:v6 withEvent:v7];
  }

  return v9;
}

- (void)endTrackingWithTouch:(id)a3 withEvent:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  __int16 v8 = [(UIButton *)self _visualProvider];
  [v8 touchesEnded];

  v9.receiver = self;
  v9.super_class = (Class)UIButton;
  [(UIControl *)&v9 endTrackingWithTouch:v7 withEvent:v6];
}

- (void)_selectionInteractionDidBeginHinting:(id)a3
{
  id v5 = self;
  double v3 = [(UIView *)v5 _focusBehavior];
  char v4 = [v3 buttonSelectionMode];

  if ((v4 & 2) != 0 && [(UIControl *)v5 isEnabled])
  {
    *(void *)&v5->_buttonFlags |= 0x4000000uLL;
    [(UIButton *)v5 setHighlighted:1];
  }
}

- (void)_selectionInteractionDidCancelHinting:(id)a3
{
  id v5 = self;
  double v3 = [(UIView *)v5 _focusBehavior];
  char v4 = [v3 buttonSelectionMode];

  if ((v4 & 2) != 0 && [(UIControl *)v5 isHighlighted])
  {
    *(void *)&v5->_buttonFlags |= 0x4000000uLL;
    [(UIButton *)v5 setHighlighted:0];
    [(UIControl *)v5 _setTouchHasHighlighted:0];
  }
}

- (void)_selectionInteractionDidSelect:(id)a3
{
  double v3 = self;
  char v4 = [(UIView *)v3 _focusBehavior];
  char v5 = [v4 buttonSelectionMode];

  if ((v5 & 2) != 0 && [(UIControl *)v3 isHighlighted])
  {
    *(void *)&v3->_buttonFlags |= 0x4000000uLL;
    [(UIButton *)v3 setHighlighted:0];
    [(UIControl *)v3 _setTouchHasHighlighted:0];
  }

  id v6 = [(UIView *)v3 _focusBehavior];
  char v7 = [v6 buttonSelectionMode];

  if (v7)
  {
    [(UIControl *)v3 sendActionsForControlEvents:1];
    uint64_t v8 = 64;
  }
  else
  {
    if ([(UIButton *)v3 _isToggleButton]) {
      [(UIButton *)v3 setSelected:[(UIControl *)v3 isSelected] ^ 1];
    }
    uint64_t v8 = 0x2000;
  }
  [(UIControl *)v3 sendActionsForControlEvents:v8];
}

- (UIEdgeInsets)_pathTitleEdgeInsets
{
  double v3 = [(UIView *)self traitCollection];
  uint64_t v4 = [v3 userInterfaceIdiom];

  if (v4 == 5) {
    double v5 = 8.0;
  }
  else {
    double v5 = 10.0;
  }
  UIRoundToViewScale(self);
  double v7 = v6 + 1.0;
  double v8 = v5;
  double v9 = v5;
  result.double right = v9;
  result.double bottom = v7;
  result.double left = v8;
  result.double top = v6;
  return result;
}

- (UIEdgeInsets)_pathImageEdgeInsets
{
  double v3 = [(UIView *)self traitCollection];
  uint64_t v4 = [v3 userInterfaceIdiom];

  if (v4 == 5) {
    double v5 = 8.0;
  }
  else {
    double v5 = 11.0;
  }
  UIRoundToViewScale(self);
  double v7 = v6 + 1.0;
  double v8 = v5;
  double v9 = v5;
  result.double right = v9;
  result.double bottom = v7;
  result.double left = v8;
  result.double top = v6;
  return result;
}

- (double)_highlightCornerRadius
{
  if ([(UIButton *)self _isCarPlaySystemTypeButton])
  {
    UIRoundToViewScale(self);
  }
  else
  {
    [(UIButton *)self _clippedHighlightBounds];
    if (v4 >= v5) {
      double v6 = v5;
    }
    else {
      double v6 = v4;
    }
    return v6 * 0.5;
  }
  return result;
}

- (BOOL)_hasHighlightColor
{
  objc_super v2 = [(UIButton *)self _contentForState:1];
  double v3 = [v2 attributedTitle];
  double v4 = [v3 attribute:*(void *)off_1E52D2048 atIndex:0 effectiveRange:0];
  if (!v4)
  {
    double v4 = [v2 titleColor];
  }
  BOOL v5 = v4 != 0;

  return v5;
}

+ (void)_setVisuallyHighlighted:(BOOL)a3 forViews:(id)a4 initialPress:(BOOL)a5 highlightBlock:(id)a6
{
  BOOL v7 = a5;
  BOOL v8 = a3;
  id v9 = a4;
  id v10 = a6;
  uint64_t v15 = MEMORY[0x1E4F143A8];
  uint64_t v16 = 3221225472;
  CGFloat v17 = __73__UIButton__setVisuallyHighlighted_forViews_initialPress_highlightBlock___block_invoke;
  double v18 = &unk_1E52DA160;
  id v11 = v9;
  id v19 = v11;
  id v12 = v10;
  id v20 = v12;
  objc_super v13 = _Block_copy(&v15);
  id v14 = v13;
  if (v8 && v7) {
    (*((void (**)(void *))v13 + 2))(v13);
  }
  else {
    +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", 327684, v13, 0, 0.47, 0.0, v15, v16, v17, v18, v19);
  }
}

void __73__UIButton__setVisuallyHighlighted_forViews_initialPress_highlightBlock___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        (*(void (**)(void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40));
        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

uint64_t __68__UIButton__setVisuallyHighlighted_forViews_initialPress_baseAlpha___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setAlpha:*(double *)(a1 + 32)];
}

- (double)_selectedIndicatorAlpha
{
  return 1.0;
}

- (id)_selectedIndicatorViewWithImage:(id)a3
{
  id v3 = a3;
  uint64_t v4 = objc_alloc_init(UIImageView);
  [(UIImageView *)v4 setImage:v3];

  return v4;
}

- (CGRect)_selectedIndicatorBounds
{
  id v3 = [(UIView *)self traitCollection];
  uint64_t v4 = [v3 userInterfaceIdiom];

  [(UIView *)self bounds];
  -[UIButton contentRectForBounds:](self, "contentRectForBounds:");
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  objc_super v13 = [(UIButton *)self _visualProvider];
  int v14 = [v13 useTitleForSelectedIndicatorBounds];

  if (v14)
  {
    -[UIButton titleRectForContentRect:](self, "titleRectForContentRect:", v6, v8, v10, v12);
    uint64_t v16 = v15;
    uint64_t v18 = v17;
    uint64_t v20 = v19;
    uint64_t v22 = v21;
    __int16 buttonVisualProviderFlags = (__int16)self->_buttonVisualProviderFlags;
    if (buttonVisualProviderFlags)
    {
      if ((buttonVisualProviderFlags & 0x20) == 0)
      {
LABEL_10:
        UIRoundToViewScale(self);
        double v35 = v34;
        UIRoundToViewScale(self);
        double v30 = -v36;
        double v31 = -v35;
        uint64_t v26 = v16;
        uint64_t v27 = v18;
        uint64_t v28 = v20;
        uint64_t v29 = v22;
        goto LABEL_12;
      }
    }
    else
    {
      objc_super v24 = [(UIButton *)self _visualProvider];
      if (!v24) {
        goto LABEL_10;
      }
      __int16 v25 = (__int16)self->_buttonVisualProviderFlags;

      if ((v25 & 0x20) == 0) {
        goto LABEL_10;
      }
    }
    id v32 = [(UIButton *)self _visualProvider];
    uint64_t v33 = [v32 font];
    [v33 pointSize];

    goto LABEL_10;
  }
  -[UIButton imageRectForContentRect:](self, "imageRectForContentRect:", v6, v8, v10, v12);
  if (v4 == 5)
  {
    double v30 = -4.0;
    double v31 = -6.0;
  }
  else
  {
    double v30 = -5.0;
    double v31 = -8.0;
  }
LABEL_12:
  CGRect result = CGRectInset(*(CGRect *)&v26, v30, v31);
  double v37 = result.size.height + 1.0;
  result.size.double height = v37;
  return result;
}

- (id)_selectionIndicatorView
{
  id v2 = [(UIButton *)self _visualProvider];
  id v3 = [v2 selectionIndicatorView];

  return v3;
}

- (int64_t)_externalDrawingStyleForState:(unint64_t)a3
{
  if ([(UIButton *)self _isCarPlaySystemTypeButton]) {
    return 2;
  }
  else {
    return 0;
  }
}

- (id)_externalFocusedTitleColor
{
  return +[UIColor _carSystemFocusLabelColor];
}

- (id)_externalTitleColorForState:(unint64_t)a3 isTintColor:(BOOL *)a4
{
  if (![(UIButton *)self _isCarPlaySystemTypeButton])
  {
    BOOL v7 = 0;
    double v6 = 0;
    if (!a4) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
  if (![(UIButton *)self canBecomeFocused] || [(UIView *)self isFocused])
  {
    double v6 = [(UIButton *)self _externalFocusedTitleColor];
    BOOL v7 = 0;
    if (!a4) {
      goto LABEL_8;
    }
LABEL_7:
    *a4 = v7;
    goto LABEL_8;
  }
  double v6 = [(UIView *)self tintColor];
  BOOL v7 = 1;
  if (a4) {
    goto LABEL_7;
  }
LABEL_8:
  return v6;
}

- (id)_externalUnfocusedBorderColor
{
  return +[UIColor tableBackgroundColor];
}

- (id)_externalBorderColorForState:(unint64_t)a3
{
  char v3 = a3;
  if (![(UIButton *)self _isCarPlaySystemTypeButton])
  {
    double v6 = 0;
    goto LABEL_13;
  }
  if ([(UIButton *)self canBecomeFocused] && ![(UIView *)self isFocused])
  {
    uint64_t v5 = [(UIButton *)self _externalUnfocusedBorderColor];
  }
  else
  {
    uint64_t v5 = [(UIView *)self tintColor];
  }
  double v6 = (void *)v5;
  if ((v3 & 2) != 0)
  {
    BOOL v7 = 1;
    if (!v6) {
      goto LABEL_13;
    }
  }
  else
  {
    BOOL v7 = [(UIButton *)self _isEffectivelyDisabledExternalButton];
    if (!v6) {
      goto LABEL_13;
    }
  }
  if (v7)
  {
    uint64_t v8 = +[UIColor _disabledColorForColor:]((uint64_t)UIColor, v6);

    double v6 = (void *)v8;
  }
LABEL_13:
  return v6;
}

- (id)_externalImageColorForState:(unint64_t)a3
{
  if ([(UIButton *)self _isCarPlaySystemTypeButton])
  {
    uint64_t v5 = [(UIButton *)self _externalTitleColorForState:a3 isTintColor:0];
  }
  else
  {
    uint64_t v5 = 0;
  }
  return v5;
}

- (unint64_t)_externalFlatEdge
{
  return self->_externalFlatEdge;
}

- (void)_setExternalFlatEdge:(unint64_t)a3
{
  self->_externalFlatEdge = a3;
  __int16 buttonVisualProviderFlags = (__int16)self->_buttonVisualProviderFlags;
  if (buttonVisualProviderFlags)
  {
    if ((buttonVisualProviderFlags & 0x40) == 0) {
      return;
    }
  }
  else
  {
    double v6 = [(UIButton *)self _visualProvider];
    if (!v6) {
      return;
    }
    __int16 v7 = (__int16)self->_buttonVisualProviderFlags;

    if ((v7 & 0x40) == 0) {
      return;
    }
  }
  id v8 = [(UIButton *)self _visualProvider];
  [v8 setExternalFlatEdge:a3];
}

- (id)_borderColorForState:(unint64_t)a3
{
  if ([(UIButton *)self _isCarPlaySystemTypeButton])
  {
    uint64_t v5 = [(UIButton *)self _externalBorderColorForState:a3];

    if (v5)
    {
      double v6 = [(UIButton *)self _externalBorderColorForState:a3];
      goto LABEL_11;
    }
  }
  if ((a3 & 1) == 0)
  {
    if ([(UIButton *)self _buttonType] == 3)
    {
      double v7 = 0.2;
      double v8 = 1.0;
LABEL_9:
      double v6 = +[UIColor colorWithWhite:v8 alpha:v7];
      goto LABEL_11;
    }
    if ([(UIButton *)self _buttonType] == 4)
    {
      double v8 = 0.8;
      double v7 = 1.0;
      goto LABEL_9;
    }
  }
  double v6 = [(UIView *)self _inheritedInteractionTintColor];
LABEL_11:
  return v6;
}

- (BOOL)_isTitleFrozen
{
  return *((unsigned __int8 *)&self->_buttonFlags + 2) >> 7;
}

- (CGRect)_clippedHighlightBounds
{
  [(UIButton *)self _highlightBounds];
  uint64_t v4 = v3;
  uint64_t v6 = v5;
  uint64_t v8 = v7;
  uint64_t v10 = v9;
  [(UIView *)self bounds];
  uint64_t v12 = v11;
  uint64_t v14 = v13;
  uint64_t v16 = v15;
  uint64_t v18 = v17;
  uint64_t v19 = v4;
  uint64_t v20 = v6;
  uint64_t v21 = v8;
  uint64_t v22 = v10;
  return CGRectIntersection(*(CGRect *)&v19, *(CGRect *)&v12);
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 view];
  BOOL v6 = v5 == self
    || ![v4 _isGestureType:0]
    || [v4 numberOfTouchesRequired] != 1
    || [v4 numberOfTapsRequired] != 1;

  return v6;
}

- (void)setSpringLoaded:(BOOL)a3
{
}

UISpringLoadedInteraction *__28__UIButton_setSpringLoaded___block_invoke()
{
  v0 = [[UISpringLoadedInteraction alloc] initWithActivationHandler:&__block_literal_global_387_0];
  return v0;
}

void __28__UIButton_setSpringLoaded___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = [a2 view];
  [v2 sendActionsForControlEvents:64];
}

- (void)_setImageColor:(id)a3 forState:(unint64_t)a4
{
  if (-[UIButton _setContentValue:forField:state:](self, a3, @"imageColor", a4))
  {
    -[UIButton _markAndLayoutAsNeededForField:state:](self, @"imageColor", a4);
  }
}

- (void)setTitleShadowColor:(UIColor *)color forState:(UIControlState)state
{
  if (-[UIButton _setContentValue:forField:state:](self, color, @"shadowColor", state))
  {
    -[UIButton _markAndLayoutAsNeededForField:state:](self, @"shadowColor", state);
  }
}

- (void)setBackgroundImage:(UIImage *)image forState:(UIControlState)state
{
  int v6 = -[UIButton _setContentValue:forField:state:](self, image, @"background", state);
  if ([(UIButton *)self autosizesToFit]) {
    [(UIView *)self sizeToFit];
  }
  if (v6)
  {
    -[UIButton _markAndLayoutAsNeededForField:state:](self, @"background", state);
  }
}

- (void)_setSubtitle:(id)a3 forState:(unint64_t)a4
{
  objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3, a4);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  [v6 handleFailureInMethod:a2 object:self file:@"UIButton.m" lineNumber:2500 description:@"Set a subtitle on the configuration itself"];
}

- (void)_setAttributedSubtitle:(id)a3 forState:(unint64_t)a4
{
  objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3, a4);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  [v6 handleFailureInMethod:a2 object:self file:@"UIButton.m" lineNumber:2504 description:@"Set a subtitle on the configuration itself"];
}

- (UIColor)titleColorForState:(UIControlState)state
{
  return (UIColor *)[(UIButton *)self _titleColorForState:state suppressTintColorFollowing:0];
}

- (id)_subtitleForState:(unint64_t)a3
{
  uint64_t v5 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3);
  [v5 handleFailureInMethod:a2 object:self file:@"UIButton.m" lineNumber:2537 description:@"This method currently does nothing. Come back later please."];

  return 0;
}

- (id)_attributedSubtitleForState:(unint64_t)a3
{
  uint64_t v5 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3);
  [v5 handleFailureInMethod:a2 object:self file:@"UIButton.m" lineNumber:2542 description:@"This method currently does nothing. Come back later please."];

  return 0;
}

- (NSString)currentTitle
{
  UIControlState v3 = [(UIControl *)self state];
  return [(UIButton *)self titleForState:v3];
}

- (UIColor)currentTitleColor
{
  UIControlState v3 = [(UIControl *)self state];
  return [(UIButton *)self titleColorForState:v3];
}

- (UIColor)_currentImageColor
{
  UIControlState v3 = [(UIControl *)self state];
  return (UIColor *)[(UIButton *)self _imageColorForState:v3];
}

- (UIColor)currentTitleShadowColor
{
  UIControlState v3 = [(UIControl *)self state];
  return [(UIButton *)self titleShadowColorForState:v3];
}

- (NSAttributedString)currentAttributedTitle
{
  UIControlState v3 = [(UIControl *)self state];
  return [(UIButton *)self attributedTitleForState:v3];
}

- (UIImageSymbolConfiguration)currentPreferredSymbolConfiguration
{
  UIControlState v3 = [(UIControl *)self state];
  return [(UIButton *)self preferredSymbolConfigurationForImageInState:v3];
}

- (id)_currentImageWithResolvedConfiguration
{
  __int16 buttonVisualProviderFlags = (__int16)self->_buttonVisualProviderFlags;
  if (buttonVisualProviderFlags)
  {
    if ((buttonVisualProviderFlags & 0x40) != 0)
    {
LABEL_4:
      id v6 = [(UIButton *)self _visualProvider];
      uint64_t v7 = [v6 currentImageWithResolvedConfiguration];

      goto LABEL_7;
    }
  }
  else
  {
    id v4 = [(UIButton *)self _visualProvider];
    if (v4)
    {
      __int16 v5 = (__int16)self->_buttonVisualProviderFlags;

      if ((v5 & 0x40) != 0) {
        goto LABEL_4;
      }
    }
  }
  uint64_t v7 = 0;
LABEL_7:
  return v7;
}

- (void)_updateBaselineInformationDependentOnBounds
{
  __int16 buttonVisualProviderFlags = (__int16)self->_buttonVisualProviderFlags;
  if (buttonVisualProviderFlags)
  {
    if ((buttonVisualProviderFlags & 4) != 0) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  __int16 v5 = [(UIButton *)self _visualProvider];
  if (!v5 || (__int16 v6 = (__int16)self->_buttonVisualProviderFlags, v5, (v6 & 4) == 0))
  {
LABEL_6:
    uint64_t v7 = [MEMORY[0x1E4F28B00] currentHandler];
    [v7 handleFailureInMethod:a2 object:self file:@"UIButton.m" lineNumber:2672 description:@"Unexpected use of baseline-updating UIButton"];
  }
LABEL_7:
  id v8 = [(UIButton *)self _visualProvider];
  [v8 updateBaselineInformationDependentOnBounds];
}

- (double)_firstBaselineOffsetFromTop
{
  __int16 buttonVisualProviderFlags = (__int16)self->_buttonVisualProviderFlags;
  if (buttonVisualProviderFlags)
  {
    if ((buttonVisualProviderFlags & 4) != 0)
    {
LABEL_4:
      [(UIView *)self bounds];
      -[UIButton _baselineOffsetsAtSize:](self, "_baselineOffsetsAtSize:", v6, v7);
      return result;
    }
  }
  else
  {
    id v4 = [(UIButton *)self _visualProvider];
    if (v4)
    {
      __int16 v5 = (__int16)self->_buttonVisualProviderFlags;

      if ((v5 & 4) != 0) {
        goto LABEL_4;
      }
    }
  }
  v9.receiver = self;
  v9.super_class = (Class)UIButton;
  [(UIView *)&v9 _firstBaselineOffsetFromTop];
  return result;
}

- (id)_contentBackdropView
{
  id v2 = [(UIButton *)self _visualProvider];
  UIControlState v3 = [v2 contentBackdropView];

  return v3;
}

- (BOOL)_visualEffectViewEnabled
{
  return (*((unsigned __int8 *)&self->_buttonFlags + 3) >> 4) & 1;
}

- (void)_setVisualEffectViewEnabled:(BOOL)a3 backgroundColor:(id)a4
{
  BOOL v4 = a3;
  id v11 = a4;
  uint64_t v6 = 0x10000000;
  if (!v4) {
    uint64_t v6 = 0;
  }
  self->_$1CF1FC38577B636919C637EEED589224 buttonFlags = ($1CF1FC38577B636919C637EEED589224)(*(void *)&self->_buttonFlags & 0xFFFFFFFFEFFFFFFFLL | v6);
  __int16 buttonVisualProviderFlags = (__int16)self->_buttonVisualProviderFlags;
  if (buttonVisualProviderFlags)
  {
    if ((buttonVisualProviderFlags & 0x10) == 0) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
  id v8 = [(UIButton *)self _visualProvider];
  if (v8)
  {
    __int16 v9 = (__int16)self->_buttonVisualProviderFlags;

    if ((v9 & 0x10) != 0)
    {
LABEL_8:
      uint64_t v10 = [(UIButton *)self _visualProvider];
      [v10 setVisualEffectViewEnabled:v4 backgroundColor:v11];
    }
  }
LABEL_9:
}

- (BOOL)_blurEnabled
{
  return (*((unsigned __int8 *)&self->_buttonFlags + 3) >> 3) & 1;
}

- (void)_setBlurEnabled:(BOOL)a3
{
  if (((((*(void *)&self->_buttonFlags & 0x8000000) == 0) ^ a3) & 1) == 0)
  {
    BOOL v3 = a3;
    uint64_t v5 = 0x8000000;
    if (!a3) {
      uint64_t v5 = 0;
    }
    self->_$1CF1FC38577B636919C637EEED589224 buttonFlags = ($1CF1FC38577B636919C637EEED589224)(*(void *)&self->_buttonFlags & 0xFFFFFFFFF7FFFFFFLL | v5);
    __int16 buttonVisualProviderFlags = (__int16)self->_buttonVisualProviderFlags;
    if (buttonVisualProviderFlags)
    {
      if ((buttonVisualProviderFlags & 0x10) == 0) {
        return;
      }
    }
    else
    {
      double v7 = [(UIButton *)self _visualProvider];
      if (!v7) {
        return;
      }
      __int16 v8 = (__int16)self->_buttonVisualProviderFlags;

      if ((v8 & 0x10) == 0) {
        return;
      }
    }
    id v9 = [(UIButton *)self _visualProvider];
    [v9 setBlurEnabled:v3];
  }
}

- (BOOL)_requiresLayoutForPropertyChange
{
  return (*((unsigned __int8 *)&self->_buttonFlags + 3) >> 6) & 1;
}

- (id)_effectiveContentView
{
  id v2 = [(UIButton *)self _visualProvider];
  BOOL v3 = [v2 effectiveContentView];

  return v3;
}

- (UIView)_imageEffectContainerView
{
  id v2 = [(UIButton *)self _visualProvider];
  BOOL v3 = [v2 imageEffectContainerView];

  return (UIView *)v3;
}

- (BOOL)_alwaysHandleScrollerMouseEvent
{
  return (*((unsigned char *)&self->_buttonFlags + 2) & 0x40) != 0 && [(UIControl *)self isEnabled];
}

- (void)_setShouldHandleScrollerMouseEvent:(BOOL)a3
{
  uint64_t v3 = 0x400000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_$1CF1FC38577B636919C637EEED589224 buttonFlags = ($1CF1FC38577B636919C637EEED589224)(*(void *)&self->_buttonFlags & 0xFFFFFFFFFFBFFFFFLL | v3);
}

- (void)setAutosizesToFit:(BOOL)a3
{
  if (((((*(void *)&self->_buttonFlags & 8) == 0) ^ a3) & 1) == 0)
  {
    uint64_t v3 = 8;
    if (!a3) {
      uint64_t v3 = 0;
    }
    self->_$1CF1FC38577B636919C637EEED589224 buttonFlags = ($1CF1FC38577B636919C637EEED589224)(*(void *)&self->_buttonFlags & 0xFFFFFFFFFFFFFFF7 | v3);
    if (a3) {
      [(UIView *)self sizeToFit];
    }
  }
}

- (void)setTitle:(id)a3 forStates:(unint64_t)a4
{
  [(UIButton *)self _setTitle:a3 forStates:a4];
  if ([(UIButton *)self autosizesToFit]) {
    [(UIView *)self sizeToFit];
  }
  [(UIButton *)self setNeedsLayout];
}

- (void)setTitleColor:(id)a3 forStates:(unint64_t)a4
{
  [(UIButton *)self _setTitleColor:a3 forStates:a4];
  [(UIButton *)self setNeedsLayout];
}

- (void)setTitleShadowColor:(id)a3 forStates:(unint64_t)a4
{
  [(UIButton *)self _setShadowColor:a3 forStates:a4];
  [(UIButton *)self setNeedsLayout];
}

- (void)setImage:(id)a3 forStates:(unint64_t)a4
{
  [(UIButton *)self _setImage:a3 forStates:a4];
  if ([(UIButton *)self autosizesToFit]) {
    [(UIView *)self sizeToFit];
  }
  [(UIButton *)self setNeedsLayout];
}

- (void)_resetLazyTitleViewFont
{
  lazyTitleViewFont = self->_lazyTitleViewFont;
  self->_lazyTitleViewFont = 0;

  self->_lazyTitleViewFontIsDefaultForIdiom = 0;
}

- (void)_setLineBreakMode:(int64_t)a3
{
  __int16 buttonVisualProviderFlags = (__int16)self->_buttonVisualProviderFlags;
  if (buttonVisualProviderFlags)
  {
    if ((buttonVisualProviderFlags & 0x20) == 0) {
      return;
    }
  }
  else
  {
    uint64_t v6 = [(UIButton *)self _visualProvider];
    if (!v6) {
      return;
    }
    __int16 v7 = (__int16)self->_buttonVisualProviderFlags;

    if ((v7 & 0x20) == 0) {
      return;
    }
  }
  id v8 = [(UIButton *)self _visualProvider];
  [v8 setLineBreakMode:a3];
}

- (CGSize)_titleShadowOffset
{
  __int16 buttonVisualProviderFlags = (__int16)self->_buttonVisualProviderFlags;
  if ((buttonVisualProviderFlags & 1) == 0)
  {
    BOOL v4 = [(UIButton *)self _visualProvider];
    if (v4)
    {
      __int16 v5 = (__int16)self->_buttonVisualProviderFlags;

      if ((v5 & 0x20) != 0) {
        goto LABEL_4;
      }
    }
LABEL_6:
    double v8 = *MEMORY[0x1E4F1DB30];
    double v10 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
    goto LABEL_7;
  }
  if ((buttonVisualProviderFlags & 0x20) == 0) {
    goto LABEL_6;
  }
LABEL_4:
  uint64_t v6 = [(UIButton *)self _visualProvider];
  [v6 titleShadowOffset];
  double v8 = v7;
  double v10 = v9;

LABEL_7:
  double v11 = v8;
  double v12 = v10;
  result.double height = v12;
  result.double width = v11;
  return result;
}

- (void)_setTitleShadowOffset:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  __int16 buttonVisualProviderFlags = (__int16)self->_buttonVisualProviderFlags;
  if (buttonVisualProviderFlags)
  {
    if ((buttonVisualProviderFlags & 0x20) == 0) {
      return;
    }
  }
  else
  {
    double v7 = [(UIButton *)self _visualProvider];
    if (!v7) {
      return;
    }
    __int16 v8 = (__int16)self->_buttonVisualProviderFlags;

    if ((v8 & 0x20) == 0) {
      return;
    }
  }
  id v9 = [(UIButton *)self _visualProvider];
  objc_msgSend(v9, "setTitleShadowOffset:", width, height);
}

- (id)title
{
  return 0;
}

- (id)image
{
  return 0;
}

- (CGRect)_highlightBounds
{
  __int16 buttonVisualProviderFlags = (__int16)self->_buttonVisualProviderFlags;
  if ((buttonVisualProviderFlags & 1) == 0)
  {
    BOOL v4 = [(UIButton *)self _visualProvider];
    if (v4)
    {
      __int16 v5 = (__int16)self->_buttonVisualProviderFlags;

      if ((v5 & 0x40) != 0) {
        goto LABEL_4;
      }
    }
LABEL_6:
    double v8 = *MEMORY[0x1E4F1DB28];
    double v10 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double v12 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    double v14 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
    goto LABEL_7;
  }
  if ((buttonVisualProviderFlags & 0x40) == 0) {
    goto LABEL_6;
  }
LABEL_4:
  uint64_t v6 = [(UIButton *)self _visualProvider];
  [v6 highlightBounds];
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;

LABEL_7:
  double v15 = v8;
  double v16 = v10;
  double v17 = v12;
  double v18 = v14;
  result.size.double height = v18;
  result.size.double width = v17;
  result.origin.double y = v16;
  result.origin.double x = v15;
  return result;
}

- (double)_drawingStrokeForStyle:(int64_t)a3
{
  double result = 0.0;
  if (a3 == 1) {
    double result = 1.0;
  }
  if (a3 == 2) {
    return -1.0;
  }
  return result;
}

- (int64_t)_drawingStyleForStroke:(double)a3
{
  double v3 = fabs(a3);
  int64_t v4 = 2;
  if (a3 >= 0.0) {
    int64_t v4 = 1;
  }
  if (v3 >= 2.22044605e-16) {
    return v4;
  }
  else {
    return 0;
  }
}

- (void)_setDrawingStyle:(int64_t)a3 forState:(unint64_t)a4
{
  [(UIButton *)self _drawingStrokeForStyle:a3];
  -[UIButton _setDrawingStroke:forState:](self, "_setDrawingStroke:forState:", a4);
}

- (int64_t)_drawingStyleForState:(unint64_t)a3
{
  [(UIButton *)self _drawingStrokeForState:a3];
  return -[UIButton _drawingStyleForStroke:](self, "_drawingStyleForStroke:");
}

- (void)_setDrawingStroke:(double)a3 forState:(unint64_t)a4
{
  if (fabs(a3) < 2.22044605e-16)
  {
    double v7 = 0;
  }
  else
  {
    double v7 = [NSNumber numberWithDouble:a3];
  }
  id v13 = v7;
  -[UIButton _setContentValue:forField:state:](self, v7, @"drawingStroke", a4);
  __int16 buttonVisualProviderFlags = (__int16)self->_buttonVisualProviderFlags;
  if (buttonVisualProviderFlags)
  {
    if ((buttonVisualProviderFlags & 0x40) == 0) {
      goto LABEL_10;
    }
LABEL_9:
    double v11 = [(UIButton *)self _visualProvider];
    [v11 setDrawingStroke:a4 forState:a3];

    goto LABEL_10;
  }
  double v9 = [(UIButton *)self _visualProvider];
  if (v9)
  {
    __int16 v10 = (__int16)self->_buttonVisualProviderFlags;

    if ((v10 & 0x40) != 0) {
      goto LABEL_9;
    }
  }
LABEL_10:
  [(UIButton *)self setNeedsLayout];
  if ([(UIControl *)self state] == a4)
  {
    double v12 = [(UIView *)self window];

    if (v12) {
      [(UIView *)self layoutBelowIfNeeded];
    }
  }
}

- (double)_drawingStrokeForState:(unint64_t)a3
{
  __int16 v5 = -[UIButton _contentForState:](self, "_contentForState:");
  uint64_t v6 = [v5 drawingStroke];

  if (!v6)
  {
    if ([(UIButton *)self _isCarPlaySystemTypeButton]
      && [(UIButton *)self _externalDrawingStyleForState:a3])
    {
      double v7 = NSNumber;
      [(UIButton *)self _drawingStrokeForStyle:[(UIButton *)self _externalDrawingStyleForState:a3]];
      uint64_t v6 = objc_msgSend(v7, "numberWithDouble:");
    }
    else
    {
      double v8 = [(UIButton *)self _contentForState:0];
      uint64_t v6 = [v8 drawingStroke];
    }
  }
  [v6 doubleValue];
  double v10 = v9;

  return v10;
}

- (BOOL)_isContentBackgroundHidden
{
  return (*((unsigned char *)&self->_buttonFlags + 3) & 0x10) == 0;
}

- (void)_setContentBackgroundHidden:(BOOL)a3
{
  BOOL v4 = !a3;
  __int16 v5 = +[UIColor clearColor];
  [(UIButton *)self _setVisualEffectViewEnabled:v4 backgroundColor:v5];

  [(UIButton *)self setNeedsLayout];
}

- (BOOL)_isOn
{
  id v2 = [(UIButton *)self _visualProvider];
  char v3 = [v2 isOn];

  return v3;
}

- (void)_setOn:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(UIButton *)self _visualProvider];
  [v4 setOn:v3];
}

- (void)_setImage:(id)a3 forStates:(unint64_t)a4
{
  if (self)
  {
    do
    {
      -[UIButton _setContentValue:forField:state:](self, a3, @"image", a4 & -(uint64_t)a4);
      a4 &= a4 - 1;
    }
    while (a4);
  }
}

- (void)_setTitle:(id)a3 forStates:(unint64_t)a4
{
  if (self)
  {
    do
    {
      -[UIButton _setContentValue:forField:state:](self, a3, @"title", a4 & -(uint64_t)a4);
      a4 &= a4 - 1;
    }
    while (a4);
  }
}

- (void)_setTitleColor:(id)a3 forStates:(unint64_t)a4
{
  if (self)
  {
    do
    {
      -[UIButton _setContentValue:forField:state:](self, a3, @"titleColor", a4 & -(uint64_t)a4);
      a4 &= a4 - 1;
    }
    while (a4);
  }
}

- (void)_setImageColor:(id)a3 forStates:(unint64_t)a4
{
  if (self)
  {
    do
    {
      -[UIButton _setContentValue:forField:state:](self, a3, @"imageColor", a4 & -(uint64_t)a4);
      a4 &= a4 - 1;
    }
    while (a4);
  }
}

- (void)_setShadowColor:(id)a3 forStates:(unint64_t)a4
{
  if (self)
  {
    do
    {
      -[UIButton _setContentValue:forField:state:](self, a3, @"shadowColor", a4 & -(uint64_t)a4);
      a4 &= a4 - 1;
    }
    while (a4);
  }
}

- (void)_setAttributedTitle:(id)a3 forStates:(unint64_t)a4
{
  if (self)
  {
    do
    {
      -[UIButton _setContentValue:forField:state:](self, a3, @"attributedTitle", a4 & -(uint64_t)a4);
      a4 &= a4 - 1;
    }
    while (a4);
  }
}

- (id)_allButtonContent
{
  id v2 = (void *)[(NSMutableDictionary *)self->_contentLookup copy];
  return v2;
}

- (id)_archivableContent:(id *)a3
{
  v43[2] = *MEMORY[0x1E4F143B8];
  id v4 = [(UIView *)self traitCollection];
  uint64_t v5 = [v4 userInterfaceIdiom];

  uint64_t v6 = objc_opt_class();
  uint64_t v7 = (*(void *)&self->_buttonFlags >> 6);
  double v8 = [(id)objc_opt_class() _defaultSymbolConfigurationForType:v7 andState:0 compact:0 idiom:v5];
  v43[0] = [v6 _defaultImageForType:v7 andState:0 withConfiguration:v8];
  double v9 = objc_opt_class();
  uint64_t v10 = (*(void *)&self->_buttonFlags >> 6);
  double v11 = [(id)objc_opt_class() _defaultSymbolConfigurationForType:v10 andState:1 compact:0 idiom:v5];
  v43[1] = [v9 _defaultImageForType:v10 andState:1 withConfiguration:v11];

  id v33 = [MEMORY[0x1E4F1CA60] dictionary];
  double v12 = [MEMORY[0x1E4F1CA60] dictionary];
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  obj = self->_contentLookup;
  uint64_t v34 = [(NSMutableDictionary *)obj countByEnumeratingWithState:&v38 objects:v42 count:16];
  if (v34)
  {
    uint64_t v32 = *(void *)v39;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v39 != v32) {
          objc_enumerationMutation(obj);
        }
        uint64_t v37 = v13;
        double v14 = *(void **)(*((void *)&v38 + 1) + 8 * v13);
        uint64_t v15 = [v14 unsignedIntegerValue];
        double v36 = v14;
        double v35 = [(NSMutableDictionary *)self->_contentLookup objectForKeyedSubscript:v14];
        double v16 = [v35 image];
        uint64_t v17 = 0;
        char v18 = 1;
        do
        {
          char v19 = v18;
          uint64_t v20 = (void *)v43[v17];
          if (v20) {
            BOOL v21 = v15 == *((void *)&xmmword_186B8FCC0 + v17);
          }
          else {
            BOOL v21 = 0;
          }
          if (v21)
          {
            id v22 = v12;
            id v23 = v22;
            if (v16 && v20 != v16)
            {
              objc_super v24 = [v22 objectForKey:@"image"];
              __int16 v25 = [v23 objectForKey:@"image"];

              if (!v25)
              {
                uint64_t v26 = [MEMORY[0x1E4F1CA80] set];

                [v23 setObject:v26 forKey:@"image"];
                objc_super v24 = (void *)v26;
              }
              uint64_t v27 = [NSNumber numberWithUnsignedInteger:v15];
              [v24 addObject:v27];
            }
          }
          char v18 = 0;
          uint64_t v17 = 1;
        }
        while ((v19 & 1) != 0);
        [v33 setObject:v35 forKey:v36];

        uint64_t v13 = v37 + 1;
      }
      while (v37 + 1 != v34);
      uint64_t v34 = [(NSMutableDictionary *)obj countByEnumeratingWithState:&v38 objects:v42 count:16];
    }
    while (v34);
  }

  if (a3) {
    *a3 = v12;
  }

  for (uint64_t i = 1; i != -1; --i)
  return v33;
}

- (void)_takeContentFromArchivableContent:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        double v9 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        uint64_t v10 = [v4 objectForKey:v9];
        -[UIButton _setContent:forState:](self, "_setContent:forState:", v10, [v9 integerValue]);
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }
}

- (void)_applyCarPlaySystemButtonCustomizations
{
  BOOL v3 = [off_1E52D39B8 systemFontOfSize:16.0];
  [(UIButton *)self _setFont:v3];

  [(UIView *)self setClipsToBounds:1];
}

- (CGRect)_visualBounds
{
  id v2 = [(UIButton *)self _visualProvider];
  [v2 visualBoundsWithCornerRadius:0];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;

  double v11 = v4;
  double v12 = v6;
  double v13 = v8;
  double v14 = v10;
  result.size.double height = v14;
  result.size.double width = v13;
  result.origin.double y = v12;
  result.origin.double x = v11;
  return result;
}

- (id)_pointerEffectPreviewParameters
{
  id v2 = [(UIButton *)self _visualProvider];
  double v3 = [v2 pointerEffectPreviewParameters];

  return v3;
}

- (id)_pointerEffectWithPreview:(id)a3
{
  id v4 = a3;
  double v5 = [(UIButton *)self _visualProvider];
  double v6 = [v5 pointerEffectWithPreview:v4];

  return v6;
}

- (id)_pointerEffect
{
  double v3 = [(UIButton *)self _pointerEffectPreviewParameters];
  id v4 = [[UITargetedPreview alloc] initWithView:self parameters:v3];
  double v5 = [(UIButton *)self _pointerEffectWithPreview:v4];

  return v5;
}

- (id)_shapeInContainer:(id)a3
{
  return [(UIButton *)self _shapeInContainer:a3 proposal:0];
}

- (id)_shapeInContainer:(id)a3 proposal:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  double v8 = [(UIButton *)self _visualProvider];
  double v9 = [v8 pointerShapeInContainer:v7 proposal:v6];

  return v9;
}

- (BOOL)_selectorOverridden:(SEL)a3
{
  uint64_t v4 = -[UIButton methodForSelector:](self, "methodForSelector:");
  return v4 != +[UIButton instanceMethodForSelector:a3];
}

- (id)pointerInteraction:(id)a3 regionForRequest:(id)a4 defaultRegion:(id)a5
{
  id v7 = a5;
  id v8 = a3;
  id v9 = [(UIControl *)self _pointerInteraction];

  if (v9 == v8)
  {
    if ([(UIControl *)self isSelected])
    {
      id v11 = v7;
    }
    else
    {
      [v7 rect];
      +[UIPointerRegion regionWithRect:identifier:](UIPointerRegion, "regionWithRect:identifier:", @"com.apple.UIKit.UIButton.selectedRegion");
      id v11 = (id)objc_claimAutoreleasedReturnValue();
    }
    double v10 = v11;
  }
  else
  {
    double v10 = 0;
  }

  return v10;
}

- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(UIControl *)self _pointerInteraction];

  if (v8 == v6)
  {
    double v10 = -[UIControl _safeHoverStyle](self);
    v25.receiver = self;
    v25.super_class = (Class)UIButton;
    id v11 = [(UIControl *)&v25 pointerInteraction:v6 styleForRegion:v7];
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      || ([v11 pointerEffect], (uint64_t v12 = objc_claimAutoreleasedReturnValue()) != 0)
      && (double v13 = (void *)v12,
          [v10 shape],
          double v14 = objc_claimAutoreleasedReturnValue(),
          v14,
          v13,
          v14))
    {
      id v9 = v11;
    }
    else
    {
      uint64_t v15 = [v11 pointerEffect];
      uint64_t v16 = [v10 shape];
      if (v16)
      {
        uint64_t v17 = [v11 pointerShape];
      }
      else
      {
        uint64_t v17 = 0;
      }

      if (v15)
      {
        id v18 = v15;
      }
      else
      {
        id v18 = [(UIButton *)self _pointerEffect];
      }
      char v19 = v18;
      if (v17)
      {
        id v20 = v17;
      }
      else
      {
        BOOL v21 = [(UIView *)self superview];
        id v20 = [(UIButton *)self _shapeInContainer:v21];
      }
      pointerStyleProvider = (void (**)(id, UIButton *, void *, id))self->_pointerStyleProvider;
      if (pointerStyleProvider) {
        pointerStyleProvider[2](pointerStyleProvider, self, v19, v20);
      }
      else {
      id v23 = +[UIPointerStyle styleWithEffect:v19 shape:v20];
      }

      id v9 = v23;
    }
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

- (void)pointerInteraction:(id)a3 willEnterRegion:(id)a4 animator:(id)a5
{
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __56__UIButton_pointerInteraction_willEnterRegion_animator___block_invoke;
  v8[3] = &unk_1E52D9F70;
  void v8[4] = self;
  id v6 = a5;
  [v6 addAnimations:v8];
  id v7 = [(UIButton *)self _visualProvider];
  [v7 pointerWillEnter:v6];
}

uint64_t __56__UIButton_pointerInteraction_willEnterRegion_animator___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _setHovered:1];
}

- (void)pointerInteraction:(id)a3 willExitRegion:(id)a4 animator:(id)a5
{
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __55__UIButton_pointerInteraction_willExitRegion_animator___block_invoke;
  v8[3] = &unk_1E52D9F70;
  void v8[4] = self;
  id v6 = a5;
  [v6 addAnimations:v8];
  id v7 = [(UIButton *)self _visualProvider];
  [v7 pointerWillExit:v6];
}

uint64_t __55__UIButton_pointerInteraction_willExitRegion_animator___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _setHovered:0];
}

- (id)_preferredHoverEffect
{
  id v2 = [(UIButton *)self _visualProvider];
  double v3 = [v2 preferredHoverEffect];

  return v3;
}

- (id)_preferredHoverShape
{
  id v2 = [(UIButton *)self _visualProvider];
  double v3 = [v2 preferredHoverShape];

  return v3;
}

- (BOOL)_isToggleButton
{
  if ((*((unsigned char *)&self->_buttonFlags + 4) & 0x20) == 0) {
    return 0;
  }
  if (self->_menu) {
    return ![(UIControl *)self showsMenuAsPrimaryAction];
  }
  return 1;
}

- (void)forcedSelectionOfMenu:(id)a3 willChangeTo:(id)a4
{
  id v6 = a3;
  id v7 = [a4 title];
  [(UIButton *)self setTitle:v7 forState:0];

  id v8 = [(UIButton *)self _visualProvider];
  [v8 setMenu:v6];
}

- (void)_sendActionsForEvents:(unint64_t)a3 withEvent:(id)a4
{
  id v6 = a4;
  if ([(UIButton *)self _isToggleButton]
    && ([(UIButton *)self _controlEventsForActionTriggered] & a3) != 0)
  {
    [(UIButton *)self setSelected:[(UIControl *)self isSelected] ^ 1];
  }
  v7.receiver = self;
  v7.super_class = (Class)UIButton;
  [(UIControl *)&v7 _sendActionsForEvents:a3 withEvent:v6];
}

- (CGPoint)menuAttachmentPointForConfiguration:(id)a3
{
  id v4 = a3;
  double v5 = [(UIButton *)self _visualProvider];
  [v5 menuAttachmentPointForConfiguration:v4];
  double v7 = v6;
  double v9 = v8;

  double v10 = v7;
  double v11 = v9;
  result.double y = v11;
  result.double x = v10;
  return result;
}

- (id)contextMenuInteraction:(id)a3 configurationForMenuAtLocation:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  id v7 = a3;
  double v8 = [(UIButton *)self _visualProvider];
  double v9 = objc_msgSend(v8, "contextMenuInteraction:configurationForMenuAtLocation:", v7, x, y);

  objc_msgSend(v9, "setPreferredMenuElementOrder:", -[UIButton preferredMenuElementOrder](self, "preferredMenuElementOrder"));
  objc_msgSend(v9, "setPrefersHorizontalAttachment:", -[UIButton prefersHorizontalMenuAttachment](self, "prefersHorizontalMenuAttachment"));
  return v9;
}

- (id)_contextMenuInteraction:(id)a3 styleForMenuWithConfiguration:(id)a4
{
  v11.receiver = self;
  v11.super_class = (Class)UIButton;
  id v6 = a4;
  id v7 = a3;
  double v8 = [(UIControl *)&v11 _contextMenuInteraction:v7 styleForMenuWithConfiguration:v6];
  double v9 = [(UIButton *)self _visualProvider];
  [v9 contextMenuInteraction:v7 updateStyleForMenuWithConfiguration:v6 style:v8];

  return v8;
}

- (id)contextMenuInteraction:(id)a3 previewForHighlightingMenuWithConfiguration:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(UIControl *)self _contextMenuInteraction];

  if (v8 == v6)
  {
    double v10 = [(UIButton *)self _visualProvider];
    double v9 = [v10 contextMenuInteraction:v6 previewForHighlightingMenuWithConfiguration:v7];
  }
  else
  {
    v12.receiver = self;
    v12.super_class = (Class)UIButton;
    double v9 = [(UIControl *)&v12 contextMenuInteraction:v6 previewForHighlightingMenuWithConfiguration:v7];
  }

  return v9;
}

- (id)contextMenuInteraction:(id)a3 previewForDismissingMenuWithConfiguration:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(UIControl *)self _contextMenuInteraction];

  if (v8 == v6)
  {
    double v10 = [(UIButton *)self _visualProvider];
    double v9 = [v10 contextMenuInteraction:v6 previewForDismissingMenuWithConfiguration:v7];
  }
  else
  {
    v12.receiver = self;
    v12.super_class = (Class)UIButton;
    double v9 = [(UIControl *)&v12 contextMenuInteraction:v6 previewForDismissingMenuWithConfiguration:v7];
  }

  return v9;
}

- (id)_configurationUpdateHandler
{
  if (self->_configurationUpdateHandler)
  {
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __39__UIButton__configurationUpdateHandler__block_invoke;
    aBlock[3] = &unk_1E52EAB90;
    aBlock[4] = self;
    id v2 = _Block_copy(aBlock);
  }
  else
  {
    id v2 = 0;
  }
  return v2;
}

uint64_t __39__UIButton__configurationUpdateHandler__block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(*(void *)(a1 + 32) + 656) + 16))();
}

- (void)_setConfigurationUpdateHandler:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __43__UIButton__setConfigurationUpdateHandler___block_invoke;
  v6[3] = &unk_1E52EABB8;
  id v7 = v4;
  id v5 = v4;
  [(UIButton *)self setConfigurationUpdateHandler:v6];
}

void __43__UIButton__setConfigurationUpdateHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = a2;
  id v4 = [v3 _configurationState];
  (*(void (**)(uint64_t, id, id))(v2 + 16))(v2, v3, v4);
}

- (void)setAutomaticallyUpdatesConfiguration:(BOOL)automaticallyUpdatesConfiguration
{
  $1CF1FC38577B636919C637EEED589224 buttonFlags = self->_buttonFlags;
  if (((((*(void *)&buttonFlags & 0x1000000000) == 0) ^ automaticallyUpdatesConfiguration) & 1) == 0)
  {
    uint64_t v4 = 0x1000000000;
    if (!automaticallyUpdatesConfiguration) {
      uint64_t v4 = 0;
    }
    self->_$1CF1FC38577B636919C637EEED589224 buttonFlags = ($1CF1FC38577B636919C637EEED589224)(*(void *)&buttonFlags & 0xFFFFFFEFFFFFFFFFLL | v4);
    if (automaticallyUpdatesConfiguration) {
      [(UIButton *)self setNeedsUpdateConfiguration];
    }
  }
}

- (_UIButtonConfiguration)_configuration
{
  return (_UIButtonConfiguration *)[(_UIButtonConfigurationShim *)self->_configuration _spiValue];
}

- (id)_titleOrImageViewForBaselineLayout
{
  if (os_variant_has_internal_diagnostics())
  {
    id v7 = __UIFaultDebugAssertLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_1853B0000, v7, OS_LOG_TYPE_FAULT, "Use -[UIButton viewForBaselineLayout], -[UIButton viewForFirstBaselineLayout], or -[UIButton viewForLastBaselineLayout] instead of calling IPI", buf, 2u);
    }
  }
  else
  {
    id v3 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &_titleOrImageViewForBaselineLayout___s_category) + 8);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)id v8 = 0;
      _os_log_impl(&dword_1853B0000, v3, OS_LOG_TYPE_ERROR, "Use -[UIButton viewForBaselineLayout], -[UIButton viewForFirstBaselineLayout], or -[UIButton viewForLastBaselineLayout] instead of calling IPI", v8, 2u);
    }
  }
  uint64_t v4 = [(UIButton *)self _visualProvider];
  id v5 = [v4 viewForFirstBaselineLayout];

  return v5;
}

- (UIEdgeInsets)_internalTitlePaddingInsets
{
  double top = self->_internalTitlePaddingInsets.top;
  double left = self->_internalTitlePaddingInsets.left;
  double bottom = self->_internalTitlePaddingInsets.bottom;
  double right = self->_internalTitlePaddingInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (NSISEngine)_activeSizeToFitLayoutEngine
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_activeSizeToFitLayoutEngine);
  return (NSISEngine *)WeakRetained;
}

- (id)_menuProvider
{
  return self->_menuProvider;
}

- (UIButtonPointerStyleProvider)pointerStyleProvider
{
  return self->_pointerStyleProvider;
}

- (UIContextMenuConfigurationElementOrder)preferredMenuElementOrder
{
  return self->_preferredMenuElementOrder;
}

- (UIColor)_plainButtonBackgroundColor
{
  return self->__plainButtonBackgroundColor;
}

- (void)_setPlainButtonBackgroundColor:(id)a3
{
}

- (BOOL)prefersHorizontalMenuAttachment
{
  return self->_prefersHorizontalMenuAttachment;
}

- (void)setPrefersHorizontalMenuAttachment:(BOOL)a3
{
  self->_prefersHorizontalMenuAttachment = a3;
}

- (double)_scaleFactorForImage
{
  uint64_t v2 = [(UIView *)self traitCollection];
  double v3 = _UIAccessibilityContentSizeCategoryImageAdjustingScaleFactorForTraitCollection(v2);

  return v3;
}

- (double)_additionalBaselineSpacingForEdge:(int)a3
{
  double result = 0.0;
  if ((*(_WORD *)&self->_buttonVisualProviderFlags & 4) != 0)
  {
    if (a3 == 6)
    {
      -[UIButton _baselineOffsetsAtSize:](self, "_baselineOffsetsAtSize:", *MEMORY[0x1E4F1DB30], *(double *)(MEMORY[0x1E4F1DB30] + 8));
      return v4;
    }
    else if (a3 == 5)
    {
      -[UIButton _baselineOffsetsAtSize:](self, "_baselineOffsetsAtSize:", *MEMORY[0x1E4F1DB30], *(double *)(MEMORY[0x1E4F1DB30] + 8));
    }
  }
  return result;
}

- (BOOL)_calloutBar_shouldHideTitleLabel
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  return [(UIButton *)self isSecurePasteButton];
}

- (void)_uikit_applyValueFromTraitStorage:(id)a3 forKeyPath:(id)a4
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (qword_1EB261548 != -1) {
    dispatch_once(&qword_1EB261548, &__block_literal_global_303);
  }
  long long v38 = 0u;
  long long v39 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  id v8 = &qword_1EB261000;
  id v9 = (id)qword_1EB261540;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v36 objects:v40 count:16];
  if (!v10)
  {

    id v33 = 0;
    uint64_t v29 = 0;
LABEL_18:
    v35.receiver = self;
    v35.super_class = (Class)UIButton;
    [&v35 _uikit_applyValueFromTraitStorage:v6 forKeyPath:v7];
    uint64_t v28 = 0;
    goto LABEL_19;
  }
  uint64_t v11 = v10;
  double v30 = self;
  id v31 = v6;
  uint64_t v32 = 0;
  id v33 = 0;
  id v12 = 0;
  uint64_t v13 = *(void *)v37;
  do
  {
    uint64_t v14 = 0;
    uint64_t v34 = v11;
    do
    {
      if (*(void *)v37 != v13) {
        objc_enumerationMutation(v9);
      }
      uint64_t v15 = *(void **)(*((void *)&v36 + 1) + 8 * v14);
      uint64_t v16 = [(id)v8[168] objectForKey:v15];
      if ([v7 hasPrefix:v16])
      {
        id v17 = v9;
        id v18 = v8;
        id v19 = v7;
        id v20 = objc_msgSend(v7, "substringFromIndex:", objc_msgSend(v16, "length"));
        if ([(id)qword_1EB261538 containsObject:v20])
        {
          id v21 = v20;

          id v22 = v16;
          id v23 = v12;
          id v12 = v22;

          id v24 = v15;
          uint64_t v32 = v24;
          id v33 = v21;
        }

        id v8 = v18;
        id v9 = v17;
        id v7 = v19;
        uint64_t v11 = v34;
      }

      ++v14;
    }
    while (v11 != v14);
    uint64_t v11 = [v9 countByEnumeratingWithState:&v36 objects:v40 count:16];
  }
  while (v11);

  if (!v12)
  {
    self = v30;
    id v6 = v31;
    uint64_t v29 = v32;
    goto LABEL_18;
  }
  [NSString stringWithFormat:@"set%@:forState:", v33];
  id v25 = v12;
  uint64_t v26 = (NSString *)objc_claimAutoreleasedReturnValue();
  uint64_t v27 = NSSelectorFromString(v26);

  uint64_t v28 = v25;
  uint64_t v29 = v32;
  id v6 = v31;
  objc_msgSend(v30, v27, v31, objc_msgSend(v32, "unsignedIntegerValue"));
LABEL_19:
}

void __70__UIButton_UIIBPrivate___uikit_applyValueFromTraitStorage_forKeyPath___block_invoke()
{
  v5[5] = *MEMORY[0x1E4F143B8];
  uint64_t v0 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", @"Title", @"AttributedTitle", @"TitleColor", @"TitleShadowColor", @"Image", @"BackgroundImage", 0);
  v1 = (void *)qword_1EB261538;
  qword_1EB261538 = v0;

  v4[0] = &unk_1ED3F44E8;
  v4[1] = &unk_1ED3F4500;
  v5[0] = @"normal";
  v5[1] = @"highlighted";
  v4[2] = &unk_1ED3F4518;
  v4[3] = &unk_1ED3F4530;
  v5[2] = @"disabled";
  v5[3] = @"selected";
  v4[4] = &unk_1ED3F4548;
  v5[4] = @"focused";
  uint64_t v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:v4 count:5];
  double v3 = (void *)qword_1EB261540;
  qword_1EB261540 = v2;
}

- (id)largeContentTitle
{
  double v3 = [(UIView *)self _largeContentStoredProperties];
  int v4 = [v3 didSetLargeContentTitle];

  if (v4)
  {
    v9.receiver = self;
    v9.super_class = (Class)UIButton;
    id v5 = [(UIView *)&v9 largeContentTitle];
  }
  else
  {
    id v6 = [(UIButton *)self titleLabel];
    id v7 = [v6 attributedText];
    id v5 = [v7 string];
  }
  return v5;
}

- (id)largeContentImage
{
  double v3 = [(UIView *)self _largeContentStoredProperties];
  int v4 = [v3 didSetLargeContentImage];

  if (v4)
  {
    v8.receiver = self;
    v8.super_class = (Class)UIButton;
    id v5 = [(UIView *)&v8 largeContentImage];
  }
  else
  {
    id v6 = [(UIButton *)self imageView];
    id v5 = [v6 image];
  }
  return v5;
}

- (BOOL)scalesLargeContentImage
{
  double v3 = [(UIView *)self _largeContentStoredProperties];
  int v4 = [v3 didSetScalesLargeContentImage];

  if (!v4) {
    return 1;
  }
  v6.receiver = self;
  v6.super_class = (Class)UIButton;
  return [(UIView *)&v6 scalesLargeContentImage];
}

+ (void)_setAllowsUnsupportedMacIdiomBehavior:(BOOL)a3
{
  if (a3) {
    char v3 = 32;
  }
  else {
    char v3 = 0;
  }
  _UnsupportedFlags_0 = _UnsupportedFlags_0 & 0xDF | v3;
}

+ (BOOL)_allowsUnsupportedMacIdiomBehavior
{
  return (_UnsupportedFlags_0 >> 5) & 1;
}

+ (double)_defaultNeighborSpacingForAxis:(int64_t)a3
{
  return 8.0;
}

- (BOOL)_hasCustomAutolayoutNeighborSpacingForAttribute:(int64_t *)a3
{
  return 0;
}

- (double)_autolayoutSpacingAtEdge:(int)a3 forAttribute:(int64_t)a4 inContainer:(id)a5 isGuide:(BOOL)a6
{
  uint64_t v6 = *(void *)&a3;
  v12.receiver = self;
  v12.super_class = (Class)UIButton;
  [(UIView *)&v12 _autolayoutSpacingAtEdge:*(void *)&a3 forAttribute:a4 inContainer:a5 isGuide:a6];
  double v9 = v8;
  [(UIButton *)self _additionalBaselineSpacingForEdge:v6];
  return v9 + v10;
}

- (double)_autolayoutSpacingAtEdge:(int)a3 forAttribute:(id)a4 nextToNeighbor:(id)a5 edge:(int)a6 attribute:(int64_t)a7 multiplier:(double)a8
{
  uint64_t v8 = *(void *)&a6;
  uint64_t v10 = *(void *)&a3;
  v18.receiver = self;
  v18.super_class = (Class)UIButton;
  [(UIView *)&v18 _autolayoutSpacingAtEdge:*(void *)&a3 forAttribute:a4 nextToNeighbor:a5 edge:*(void *)&a6 attribute:a7 multiplier:a8];
  double v13 = v12;
  [(UIButton *)self _additionalBaselineSpacingForEdge:v10];
  double v15 = v13 + v14;
  if (objc_opt_respondsToSelector())
  {
    [a5 _additionalBaselineSpacingForEdge:v8];
    return v15 + v16;
  }
  return v15;
}

@end