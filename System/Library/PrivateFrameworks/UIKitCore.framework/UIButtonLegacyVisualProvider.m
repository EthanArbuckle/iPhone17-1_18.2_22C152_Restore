@interface UIButtonLegacyVisualProvider
+ (BOOL)requiresNewVisualProviderForChanges;
+ (BOOL)shouldUpdateContextMenuEnabledOnMenuChanges;
+ (id)_selectedIndicatorImage;
+ (id)visualProviderForButton:(id)a3;
+ (int64_t)_NSTextAlignmentForUIControlContentHorizontalAlignment:(int64_t)a3;
- ($F24F406B2B787EFB06265DBA3D28CBD5)baselineOffsetsAtSize:(CGSize)a3;
- (BOOL)_contentHuggingDefault_isUsuallyFixedHeight;
- (BOOL)_contentHuggingDefault_isUsuallyFixedWidth;
- (BOOL)_highlightsBackgroundImage;
- (BOOL)_imageNeedsCompositingModeWhenSelected;
- (BOOL)_isExternalRoundedRectButtonWithPressednessState;
- (BOOL)_shouldDefaultToTemplatesForImageViewBackground:(BOOL)a3;
- (BOOL)_shouldUpdatePressedness;
- (BOOL)_textNeedsCompositingModeWhenSelected;
- (BOOL)_wantsContentBackdropView;
- (BOOL)adjustsFontForContentSizeCategory;
- (BOOL)avoidDefaultTitleAndImageLayout;
- (BOOL)canBecomeFocused;
- (BOOL)deferToLazyTitleFont;
- (BOOL)fontIsDefaultForIdiom;
- (BOOL)isOn;
- (BOOL)useTitleForSelectedIndicatorBounds;
- (CGPoint)menuAttachmentPointForConfiguration:(id)a3;
- (CGRect)_highlightBoundsForDrawingStyle;
- (CGRect)_highlightRectForImageRect:(CGRect)a3;
- (CGRect)_highlightRectForTextRect:(CGRect)a3;
- (CGRect)_selectedIndicatorBounds;
- (CGRect)_titleRectForContentRect:(CGRect)a3 calculatePositionForEmptyTitle:(BOOL)a4;
- (CGRect)_visualBoundsWithCornerRadius:(double *)a3 hasProposal:(BOOL)a4 shouldUseProposal:(BOOL *)a5;
- (CGRect)backgroundRectForBounds:(CGRect)a3;
- (CGRect)contentRectForBounds:(CGRect)a3;
- (CGRect)highlightBounds;
- (CGRect)imageRectForContentRect:(CGRect)a3;
- (CGRect)titleRectForContentRect:(CGRect)a3;
- (CGRect)visualBoundsWithCornerRadius:(double *)a3;
- (CGSize)_intrinsicSizeForTitle:(id)a3 attributedTitle:(id)a4 image:(id)a5 backgroundImage:(id)a6 titlePaddingInsets:(UIEdgeInsets *)a7;
- (CGSize)intrinsicSizeWithinSize:(CGSize)a3;
- (CGSize)sizeThatFits:(CGSize)a3;
- (CGSize)titleShadowOffset;
- (NSArray)_contentConstraints;
- (UIButton)button;
- (UIEdgeInsets)alignmentRectInsets;
- (double)_borderWidthForState:(unint64_t)a3 bounds:(CGRect)a4;
- (double)_intrinsicWidthForAttributedTitle:(id)a3;
- (double)focusSizeIncrease;
- (id)_createPreparedImageViewWithFrame:(CGRect)a3;
- (id)_fadeOutAnimationWithKeyPath:(id)a3;
- (id)_floatingContentView;
- (id)_newImageViewWithFrame:(CGRect)a3;
- (id)_newLabelWithFrame:(CGRect)a3;
- (id)_setupBackgroundView;
- (id)_titleOrImageViewForBaselineLayout;
- (id)_transitionAnimationWithKeyPath:(id)a3;
- (id)_viewForBaselineLayout;
- (id)backgroundViewCreateIfNeeded:(BOOL)a3;
- (id)contentBackdropView;
- (id)contextMenuInteraction:(id)a3 configurationForMenuAtLocation:(CGPoint)a4;
- (id)contextMenuInteraction:(id)a3 previewForDismissingMenuWithConfiguration:(id)a4;
- (id)contextMenuInteraction:(id)a3 previewForHighlightingMenuWithConfiguration:(id)a4;
- (id)currentImageWithResolvedConfiguration;
- (id)defaultFocusEffect;
- (id)effectiveContentView;
- (id)encodableSubviews;
- (id)font;
- (id)imageEffectContainerView;
- (id)imageViewCreateIfNeeded:(BOOL)a3;
- (id)pointerEffectPreviewParameters;
- (id)pointerEffectWithPreview:(id)a3;
- (id)pointerShapeInContainer:(id)a3 proposal:(id)a4;
- (id)preferredConfigurationForFocusAnimation:(int64_t)a3 inContext:(id)a4;
- (id)preferredHoverEffect;
- (id)preferredHoverShape;
- (id)selectionIndicatorView;
- (id)titleViewCreateIfNeeded:(BOOL)a3;
- (int64_t)lineBreakMode;
- (void)_applyAppropriateTouchInsetsForButton;
- (void)_beginTitleAnimation;
- (void)_deriveTitleRect:(CGRect *)a3 imageRect:(CGRect *)a4 fromContentRect:(CGRect)a5 calculatePositionForEmptyTitle:(BOOL)a6;
- (void)_invalidateContentConstraints;
- (void)_layoutBackgroundImageView;
- (void)_layoutContentBackdropView;
- (void)_layoutHighlightLayer;
- (void)_layoutImageAndTitleViews;
- (void)_prepareMaskAnimationViewIfNecessary;
- (void)_setContentConstraints:(id)a3;
- (void)_setupDrawingStyleForState:(unint64_t)a3;
- (void)_setupImageView;
- (void)_setupPressednessForState:(unint64_t)a3;
- (void)_setupTitleView;
- (void)_setupTitleViewRequestingLayout:(BOOL)a3;
- (void)_updateBackgroundImageView;
- (void)_updateEffectsForImageView:(id)a3 background:(BOOL)a4;
- (void)_updateImageView;
- (void)_updateMaskState;
- (void)_updateSelectionViewForState:(unint64_t)a3;
- (void)_updateTitleView;
- (void)cleanupForVisualProvider:(id)a3;
- (void)contextMenuInteraction:(id)a3 updateStyleForMenuWithConfiguration:(id)a4 style:(id)a5;
- (void)dealloc;
- (void)didChangeFromIdiom:(int64_t)a3 onScreen:(id)a4 traverseHierarchy:(BOOL)a5;
- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4;
- (void)intrinsicContentSizeInvalidatedForChildView:(id)a3;
- (void)layoutSubviews;
- (void)populateArchivedSubviews:(id)a3;
- (void)setAvoidDefaultTitleAndImageLayout:(BOOL)a3;
- (void)setButton:(id)a3;
- (void)setContentHorizontalAlignment:(int64_t)a3;
- (void)setContentHuggingPriorities:(CGSize)a3;
- (void)setDrawingStroke:(double)a3 forState:(unint64_t)a4;
- (void)setExternalFlatEdge:(unint64_t)a3;
- (void)setFocusSizeIncrease:(double)a3;
- (void)setFont:(id)a3 isDefaultForIdiom:(BOOL)a4;
- (void)setHighlighted:(BOOL)a3 animated:(BOOL)a4;
- (void)setImageContentMode:(int64_t)a3;
- (void)setLineBreakMode:(int64_t)a3;
- (void)setReversesTitleShadowWhenHighlighted:(BOOL)a3;
- (void)setSelected:(BOOL)a3;
- (void)setSemanticContentAttribute:(int64_t)a3;
- (void)setShowsTouchWhenHighlighted:(BOOL)a3;
- (void)setTitleShadowOffset:(CGSize)a3;
- (void)setVisualEffectViewEnabled:(BOOL)a3 backgroundColor:(id)a4;
- (void)tintColorDidChange;
- (void)traitCollectionDidChange:(id)a3;
- (void)updateConstraints;
- (void)willMoveToWindow:(id)a3;
@end

@implementation UIButtonLegacyVisualProvider

uint64_t __52__UIButtonLegacyVisualProvider__beginTitleAnimation__block_invoke_3(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 48) setAlpha:1.0];
}

uint64_t __52__UIButtonLegacyVisualProvider__beginTitleAnimation__block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 48) setAlpha:0.0];
}

- (CGSize)intrinsicSizeWithinSize:(CGSize)a3
{
  -[UIButton _setInternalTitlePaddingInsets:](self->_button, "_setInternalTitlePaddingInsets:", 0.0, 0.0, 0.0, 0.0);
  UIControlState v4 = [(UIControl *)self->_button state];
  uint64_t v5 = [(UIButton *)self->_button _imageForState:v4 applyingConfiguration:1 usesImageForNormalState:0];
  if (v5)
  {
    v6 = (void *)v5;
    imageView = self->_imageView;
    if (!imageView)
    {
      [(UIButtonLegacyVisualProvider *)self _setupImageView];
      imageView = self->_imageView;
    }
    v8 = [(UIImageView *)imageView _resolvedImageFromImage:v6];
  }
  else
  {
    v8 = 0;
  }
  v9 = [(UIButton *)self->_button _titleForState:v4];
  v10 = [(UIButton *)self->_button _attributedTitleForState:v4];
  uint64_t v11 = [(UIButton *)self->_button _backgroundForState:v4 usesBackgroundForNormalState:0];
  if (v11)
  {
    v12 = (void *)v11;
    backgroundView = self->_backgroundView;
    if (!backgroundView)
    {
      id v14 = [(UIButtonLegacyVisualProvider *)self _setupBackgroundView];
      backgroundView = self->_backgroundView;
    }
    v15 = [(UIImageView *)backgroundView _resolvedImageFromImage:v12];
  }
  else
  {
    v15 = 0;
  }
  long long v22 = 0u;
  long long v23 = 0u;
  [(UIButtonLegacyVisualProvider *)self _intrinsicSizeForTitle:v9 attributedTitle:v10 image:v8 backgroundImage:v15 titlePaddingInsets:&v22];
  double v17 = v16;
  double v19 = v18;
  -[UIButton _setInternalTitlePaddingInsets:](self->_button, "_setInternalTitlePaddingInsets:", v22, v23);

  double v20 = v17;
  double v21 = v19;
  result.height = v21;
  result.width = v20;
  return result;
}

- (id)_titleOrImageViewForBaselineLayout
{
  UIControlState v4 = [(UIControl *)self->_button state];
  uint64_t v5 = [(UIButton *)self->_button _imageForState:v4 applyingConfiguration:0 usesImageForNormalState:0];
  if (!-[UIButton _canHaveTitle](self->_button, "_canHaveTitle") && ![v5 hasBaseline])
  {
    v7 = 0;
    goto LABEL_13;
  }
  if (v5) {
    [(UIButtonLegacyVisualProvider *)self _setupImageView];
  }
  v6 = [(UIButton *)self->_button titleForState:v4];
  if (!v6)
  {
    v2 = [(UIButton *)self->_button _attributedTitleForState:v4];
    if (!v2)
    {
      v7 = [(UIButton *)self->_button _imageView];
LABEL_11:

      goto LABEL_12;
    }
  }
  v7 = [(UIButton *)self->_button _titleView];
  if (!v6) {
    goto LABEL_11;
  }
LABEL_12:

  [(UIView *)self->_button contentCompressionResistancePriorityForAxis:0];
  double v9 = fmax(v8 + -0.5, 0.5);
  [(UIView *)self->_button contentCompressionResistancePriorityForAxis:1];
  double v11 = v10 + -0.5;
  double v12 = fmax(v11, 0.5);
  *(float *)&double v11 = v9;
  [v7 setContentCompressionResistancePriority:0 forAxis:v11];
  *(float *)&double v13 = v12;
  [v7 setContentCompressionResistancePriority:1 forAxis:v13];
LABEL_13:

  return v7;
}

- (void)_setupImageView
{
  if (self->_imageView) {
    return;
  }
  button = self->_button;
  [(UIView *)button bounds];
  -[UIButton contentRectForBounds:](button, "contentRectForBounds:");
  -[UIButton imageRectForContentRect:](button, "imageRectForContentRect:");
  -[UIButtonLegacyVisualProvider _createPreparedImageViewWithFrame:](self, "_createPreparedImageViewWithFrame:");
  UIControlState v4 = (UIImageView *)objc_claimAutoreleasedReturnValue();
  imageView = self->_imageView;
  self->_imageView = v4;

  [(UIImageView *)self->_imageView setSemanticContentAttribute:[(UIView *)self->_button semanticContentAttribute]];
  [(UIImageView *)self->_imageView setContentMode:[(UIButton *)self->_button _imageContentMode]];
  double v16 = [(UIButton *)self->_button _backgroundView];
  if (v16)
  {
    v6 = [(UIButtonLegacyVisualProvider *)self effectiveContentView];
    v7 = v6;
    float v8 = self->_imageView;
    selectionView = v16;
  }
  else
  {
    if (!self->_selectionView)
    {
      double v12 = [(UIButtonLegacyVisualProvider *)self contentBackdropView];

      double v13 = [(UIButtonLegacyVisualProvider *)self effectiveContentView];
      v7 = v13;
      id v14 = self->_imageView;
      if (v12)
      {
        v15 = [(UIButtonLegacyVisualProvider *)self contentBackdropView];
        [v7 insertSubview:v14 above:v15];
      }
      else
      {
        [v13 insertSubview:self->_imageView atIndex:0];
      }
      goto LABEL_7;
    }
    v6 = [(UIButtonLegacyVisualProvider *)self effectiveContentView];
    v7 = v6;
    float v8 = self->_imageView;
    selectionView = self->_selectionView;
  }
  [v6 insertSubview:v8 aboveSubview:selectionView];
LABEL_7:

  float v10 = [(UIView *)self->_button viewWithTag:1886548836];
  if (v10)
  {
    double v11 = [(UIButtonLegacyVisualProvider *)self effectiveContentView];
    [v11 insertSubview:v10 belowSubview:self->_imageView];
  }
}

- (BOOL)adjustsFontForContentSizeCategory
{
  return [(UILabel *)self->_titleView adjustsFontForContentSizeCategory];
}

- (id)imageViewCreateIfNeeded:(BOOL)a3
{
  if (!a3)
  {
    p_imageView = &self->_imageView;
LABEL_9:
    v7 = *p_imageView;
    goto LABEL_10;
  }
  button = self->_button;
  if ((*(_WORD *)&button->_buttonFlags & 0x3FC0) == 0
    || [(UIButton *)button _isSystemProvidedButton])
  {
    p_imageView = &self->_imageView;
    if (!self->_imageView) {
      [(UIButton *)self->_button setNeedsLayout];
    }
    [(UIButtonLegacyVisualProvider *)self _setupImageView];
    v6 = self->_button;
    if ((*(void *)&v6->super.super._viewFlags & 0x200000000000000) == 0) {
      [(UIView *)v6 layoutIfNeeded];
    }
    goto LABEL_9;
  }
  v7 = 0;
LABEL_10:
  return v7;
}

- (UIEdgeInsets)alignmentRectInsets
{
  button = self->_button;
  double v4 = 0.0;
  if (UIButtonTypeIsModernCircleButton((*(void *)&button->_buttonFlags >> 6)))
  {
    double v5 = 0.0;
    double v6 = 0.0;
    double v7 = 0.0;
    goto LABEL_18;
  }
  float v8 = [(UIView *)button traitCollection];
  uint64_t v9 = [v8 userInterfaceIdiom];

  float v10 = self->_button;
  int v11 = (*(_DWORD *)&v10->_buttonFlags >> 6);
  double v5 = 1.0;
  double v6 = 0.0;
  double v7 = 0.0;
  if ((v11 - 3) < 2) {
    goto LABEL_18;
  }
  if (v11 == 5)
  {
    double v6 = 3.0;
    double v5 = 2.0;
    if (v9 == 5)
    {
      double v4 = 2.0;
      goto LABEL_10;
    }
    double v6 = 4.0;
    double v4 = 3.0;
LABEL_15:
    double v7 = 3.0;
    goto LABEL_18;
  }
  if (v11 == 2)
  {
    if (v9 == 5)
    {
      double v4 = 2.0;
      double v5 = 3.0;
      double v6 = 3.0;
LABEL_10:
      double v7 = 2.0;
      goto LABEL_18;
    }
    double v4 = 3.0;
    double v5 = 4.0;
    double v6 = 4.0;
    goto LABEL_15;
  }
  double v12 = [(UIButton *)v10 backgroundImageForState:0];
  double v13 = v12;
  if (v12)
  {
    [v12 alignmentRectInsets];
    double v5 = v14;
    double v4 = v15;
    double v6 = v16;
    double v7 = v17;
  }
  else
  {
    double v5 = 0.0;
  }

LABEL_18:
  double v18 = v5;
  double v19 = v4;
  double v20 = v6;
  double v21 = v7;
  result.right = v21;
  result.bottom = v20;
  result.left = v19;
  result.top = v18;
  return result;
}

- (CGRect)contentRectForBounds:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  float v8 = [(UIButton *)self->_button backgroundImageForState:0];
  if (v8)
  {
    -[UIView alignmentRectForFrame:](self->_button, "alignmentRectForFrame:", x, y, width, height);
    double x = v9;
    double y = v10;
    double width = v11;
    double height = v12;
  }

  [(UIButton *)self->_button _combinedContentPaddingInsets];
  double v17 = width - v14 - v16;
  double v18 = v17 * 0.5;
  if (v17 >= 0.0) {
    double v18 = 0.0;
  }
  double v19 = fmax(v17, 0.0);
  double v20 = height - v13 - v15;
  double v21 = v20 * 0.5;
  if (v20 >= 0.0) {
    double v21 = 0.0;
  }
  double v22 = fmax(v20, 0.0);
  double v23 = x + v14 + v18;
  double v24 = y + v13 + v21;
  [(UIView *)self->_button _currentScreenScale];
  double v26 = UIRectIntegralWithScale(v23, v24, v19, v22, v25);
  result.size.double height = v29;
  result.size.double width = v28;
  result.origin.double y = v27;
  result.origin.double x = v26;
  return result;
}

- (void)setButton:(id)a3
{
  self->_button = (UIButton *)a3;
}

+ (id)visualProviderForButton:(id)a3
{
  v3 = objc_opt_new();
  return v3;
}

+ (BOOL)requiresNewVisualProviderForChanges
{
  return 0;
}

- (void)tintColorDidChange
{
  if (![(UIButton *)self->_button _isModernButton]
    && ![(UIButton *)self->_button _isCarPlaySystemTypeButton])
  {
    return;
  }
  titleView = self->_titleView;
  if (!titleView || [(UIView *)titleView isHidden])
  {
    double v4 = [(UIButton *)self->_button _imageForState:[(UIControl *)self->_button state] applyingConfiguration:0 usesImageForNormalState:0];
    if (!v4
      || (imageView = self->_imageView) == 0
      || (v10 = v4, v6 = [(UIView *)imageView isHidden], double v4 = v10, v6)
      || (v7 = [v10 renderingMode], double v4 = v10, v7 == 1))
    {

      return;
    }
    int64_t v8 = [(UIImageView *)self->_imageView _defaultRenderingMode];

    if (v8 != 2) {
      return;
    }
  }
  [(UIButton *)self->_button setNeedsLayout];
  double v9 = [(UIView *)self->_button window];

  if (v9)
  {
    [(UIButtonLegacyVisualProvider *)self _updateTitleView];
    [(UIButtonLegacyVisualProvider *)self _updateImageView];
  }
}

- (void)setSelected:(BOOL)a3
{
  id v4 = [(UIButtonLegacyVisualProvider *)self _floatingContentView];
  objc_msgSend(v4, "setControlState:animated:", -[UIControl state](self->_button, "state"), +[UIView _isInAnimationBlock](UIView, "_isInAnimationBlock"));
}

- (void)layoutSubviews
{
  unint64_t v3 = [(UIControl *)self->_button state];
  id v4 = [(UIButtonLegacyVisualProvider *)self _floatingContentView];
  [(UIView *)self->_button bounds];
  objc_msgSend(v4, "setFrame:");

  [(UIButtonLegacyVisualProvider *)self _updateContentBackdropView];
  [(UIButtonLegacyVisualProvider *)self _layoutContentBackdropView];
  [(UIButtonLegacyVisualProvider *)self _updateBackgroundImageView];
  [(UIButtonLegacyVisualProvider *)self _layoutBackgroundImageView];
  [(UIButtonLegacyVisualProvider *)self _updateImageView];
  [(UIButtonLegacyVisualProvider *)self _updateTitleView];
  if (!self->_avoidDefaultTitleAndImageLayout) {
    [(UIButtonLegacyVisualProvider *)self _layoutImageAndTitleViews];
  }
  [(UIButtonLegacyVisualProvider *)self _applyAppropriateTouchInsetsForButton];
  double v5 = [(UIView *)self->_button viewWithTag:1886548836];
  [(UIButton *)self->_button pressFeedbackPosition];
  objc_msgSend(v5, "setCenter:");
  [v5 setHidden:(*(void *)&self->_button->_buttonFlags & 0x20) == 0];
  BOOL v6 = [(UIButton *)self->_button _hasDrawingStyle];
  maskAnimationView = self->_maskAnimationView;
  if (v6)
  {
    [(UIView *)maskAnimationView setHidden:0];
    [(UIButtonLegacyVisualProvider *)self _setupDrawingStyleForState:v3];
  }
  else if (maskAnimationView)
  {
    [(UIView *)maskAnimationView setHidden:1];
  }
  if ([(UIButtonLegacyVisualProvider *)self _shouldUpdatePressedness])
  {
    [(UIButtonLegacyVisualProvider *)self _updateSelectionViewForState:v3];
    [(UIButtonLegacyVisualProvider *)self _setupPressednessForState:v3];
  }

  self->_button->_lastDrawingControlState = v3;
  *(void *)&self->_button->_buttonFlags &= ~0x40000000uLL;
  int64_t v8 = -[UIControl _safeHoverStyle](self->_button);
  [v8 _invalidateAutomaticHoverShape];

  double v9 = +[_UIButtonSettingsDomain rootSettings];
  int v10 = [v9 highlightMode];

  if (!v10) {
    goto LABEL_18;
  }
  NSClassFromString(&cfstr_Uimodernbarbut.isa);
  char isKindOfClass = objc_opt_isKindOfClass();
  double v12 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  double v13 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];

  if (isKindOfClass)
  {
    double v14 = +[_UIButtonSettingsDomain rootSettings];
    char v15 = [v14 highlightIgnoresBars];

    if (v15) {
      goto LABEL_18;
    }
  }
  else if (v12 != v13)
  {
    double v16 = +[_UIButtonSettingsDomain rootSettings];
    int v17 = [v16 highlightSubclasses];

    if (!v17)
    {
LABEL_18:
      highlightLayer = self->_highlightLayer;
      if (highlightLayer)
      {
        [(CALayer *)highlightLayer removeFromSuperlayer];
        double v19 = self->_highlightLayer;
        self->_highlightLayer = 0;
      }
      return;
    }
  }
  [(UIButtonLegacyVisualProvider *)self _layoutHighlightLayer];
}

- (void)_updateTitleView
{
  UIControlState v3 = [(UIControl *)self->_button state];
  id v14 = [(UIButton *)self->_button _attributedTitleForState:v3];
  id v4 = [(UIButton *)self->_button _titleForState:v3];
  if (v14 && [v14 length])
  {
    double v5 = [(UILabel *)self->_titleView _content];
    if ([v5 length] >= 1)
    {
      BOOL v6 = [v5 contentWithAttributedString:v14];
      uint64_t v7 = [v5 differenceVersusContent:v6];

      if (v7) {
        [(UIButtonLegacyVisualProvider *)self _beginTitleAnimation];
      }
    }
    if ((*((unsigned char *)&self->_button->_buttonFlags + 2) & 0x80) == 0)
    {
      [(UIButtonLegacyVisualProvider *)self _setupTitleViewRequestingLayout:0];
      [(UILabel *)self->_titleView setAttributedText:v14];
      [(UIView *)self->_titleView setHidden:0];
    }
  }
  else if (v4 && [v4 length])
  {
    int64_t v8 = [(UILabel *)self->_titleView text];
    double v9 = v8;
    if (v8 && [v8 length] && (objc_msgSend(v4, "isEqualToString:", v9) & 1) == 0) {
      [(UIButtonLegacyVisualProvider *)self _beginTitleAnimation];
    }
    if ((*((unsigned char *)&self->_button->_buttonFlags + 2) & 0x80) == 0)
    {
      [(UIButtonLegacyVisualProvider *)self _setupTitleViewRequestingLayout:0];
      if (([v4 isEqual:v9] & 1) == 0) {
        [(UILabel *)self->_titleView setText:v4];
      }
      titleView = self->_titleView;
      double v11 = [(UIButton *)self->_button _titleColorForState:v3 suppressTintColorFollowing:0];
      [(UILabel *)titleView setTextColor:v11];

      double v12 = self->_titleView;
      double v13 = [(UIButton *)self->_button _shadowColorForState:v3];
      [(UILabel *)v12 setShadowColor:v13];

      [(UIView *)self->_titleView setHidden:0];
    }
  }
  else if ((*((unsigned char *)&self->_button->_buttonFlags + 2) & 0x80) == 0)
  {
    [(UIView *)self->_titleView setHidden:1];
  }
}

- (id)contentBackdropView
{
  if (self->_contentBackdropView) {
    goto LABEL_2;
  }
  if ([(UIButtonLegacyVisualProvider *)self _wantsContentBackdropView])
  {
    if ((*(void *)&self->_button->_buttonFlags & 0x8000000) != 0) {
      BOOL v6 = off_1E52D3550;
    }
    else {
      BOOL v6 = off_1E52D5B98;
    }
    double v5 = [(__objc2_class *)*v6 _effectWithStyle:5001 invertAutomaticStyle:1];
    uint64_t v7 = [[UIVisualEffectView alloc] initWithEffect:v5];
    contentBackdropView = self->_contentBackdropView;
    self->_contentBackdropView = v7;

    [(UIVisualEffectView *)self->_contentBackdropView setAllowsDithering:0];
    double v9 = self->_contentBackdropView;
    int v10 = [(UIButtonLegacyVisualProvider *)self _floatingContentView];
    [v10 cornerRadius];
    -[UIVisualEffectView _setCornerRadius:](v9, "_setCornerRadius:");

    double v11 = [(UIButtonLegacyVisualProvider *)self _floatingContentView];
    double v12 = [v11 visualEffectContainerView];
    [v12 addSubview:self->_contentBackdropView];

LABEL_9:
    id v4 = self->_contentBackdropView;
    goto LABEL_10;
  }
  if (self->_contentBackdropView)
  {
LABEL_2:
    BOOL v3 = [(UIButtonLegacyVisualProvider *)self _wantsContentBackdropView];
    id v4 = self->_contentBackdropView;
    if (v3) {
      goto LABEL_10;
    }
    [(UIView *)v4 removeFromSuperview];
    double v5 = self->_contentBackdropView;
    self->_contentBackdropView = 0;
    goto LABEL_9;
  }
  id v4 = 0;
LABEL_10:
  return v4;
}

- (BOOL)_wantsContentBackdropView
{
  BOOL v3 = [(UIButton *)self->_button _shouldHaveFloatingAppearance];
  if (v3) {
    return (*((unsigned __int8 *)&self->_button->_buttonFlags + 3) >> 4) & 1;
  }
  return v3;
}

- (id)_floatingContentView
{
  if ([(UIButton *)self->_button _shouldHaveFloatingAppearance]
    && !self->_floatingContentView)
  {
    BOOL v3 = [_UIFloatingContentView alloc];
    id v4 = -[_UIFloatingContentView initWithFrame:](v3, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    floatingContentView = self->_floatingContentView;
    self->_floatingContentView = v4;

    [(_UIFloatingContentView *)self->_floatingContentView setFloatingContentDelegate:self];
    if (!_UIDeviceHasExternalTouchInput()) {
      [(UIView *)self->_floatingContentView setUserInteractionEnabled:0];
    }
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __52__UIButtonLegacyVisualProvider__floatingContentView__block_invoke;
    v8[3] = &unk_1E52D9F70;
    v8[4] = self;
    +[UIView _performSystemAppearanceModifications:v8];
    [(UIView *)self->_button addSubview:self->_floatingContentView];
  }
  BOOL v6 = self->_floatingContentView;
  return v6;
}

- (void)_updateBackgroundImageView
{
  UIControlState v3 = [(UIControl *)self->_button state];
  char v14 = 0;
  id v4 = [(UIButton *)self->_button _backgroundForState:v3 usesBackgroundForNormalState:&v14];
  id v5 = [(UIImageView *)self->_backgroundView _checkImageForAdaptation:v4 hasAdapted:0];
  if (!v4)
  {
    [(UIImageView *)self->_backgroundView setHidden:1];
    goto LABEL_18;
  }
  id v6 = [(UIButtonLegacyVisualProvider *)self _setupBackgroundView];
  [(UIImageView *)self->_backgroundView setImage:v4];
  if (!v14 && UIButtonTypeIsModernCircleButton([(UIButton *)self->_button buttonType]))
  {
    uint64_t v7 = [(UIView *)self->_button traitCollection];
    int64_t v8 = [v4 traitCollection];
    char v9 = [v7 isEqual:v8];

    if ((v9 & 1) == 0) {
      [(UIImageView *)self->_backgroundView traitCollectionDidChange:0];
    }
  }
  [(UIImageView *)self->_backgroundView setHidden:0];
  if (!v14) {
    goto LABEL_15;
  }
  if ([(UIButton *)self->_button adjustsImageWhenHighlighted]
    && ![(UIButton *)self->_button showsTouchWhenHighlighted]
    && [(UIControl *)self->_button isHighlighted])
  {
    uint64_t v10 = 2;
    goto LABEL_16;
  }
  if (v14
    && [(UIButton *)self->_button adjustsImageWhenDisabled]
    && ![(UIControl *)self->_button isEnabled])
  {
    uint64_t v10 = 1;
  }
  else
  {
LABEL_15:
    uint64_t v10 = 0;
  }
LABEL_16:
  [(UIImageView *)self->_backgroundView setDrawMode:v10];
  button = self->_button;
  if ((*((unsigned char *)&button->_buttonFlags + 3) & 2) != 0)
  {
    backgroundView = self->_backgroundView;
    double v13 = [(UIView *)button traitCollection];
    [(UIImageView *)backgroundView traitCollectionDidChange:v13];

    *(void *)&self->_button->_buttonFlags &= ~0x2000000uLL;
  }
LABEL_18:
}

- (void)_updateImageView
{
  UIControlState v3 = [(UIControl *)self->_button state];
  __int16 v30 = 0;
  id v4 = [(UIButton *)self->_button _imageForState:v3 applyingConfiguration:0 usesImageForNormalState:(char *)&v30 + 1];
  id v5 = [(UIImageView *)self->_imageView _checkImageForAdaptation:v4 hasAdapted:&v30];
  id v6 = [(UIImageView *)self->_imageView image];
  id v7 = v4;
  int64_t v8 = v7;
  if (v6 == v7)
  {
    char v10 = 1;
  }
  else
  {
    if (v7) {
      BOOL v9 = v6 == 0;
    }
    else {
      BOOL v9 = 1;
    }
    if (v9) {
      char v10 = 0;
    }
    else {
      char v10 = [v6 isEqual:v7];
    }
  }

  if (v8)
  {
    [(UIButtonLegacyVisualProvider *)self _setupImageView];
    double v11 = [(UIButton *)self->_button _preferredConfigurationForState:v3];
    [(UIImageView *)self->_imageView setPreferredSymbolConfiguration:v11];

    if (!(_BYTE)v30)
    {
      [(UIImageView *)self->_imageView setImage:v8];
      if (!HIBYTE(v30) && UIButtonTypeIsModernCircleButton([(UIButton *)self->_button buttonType]))
      {
        double v12 = [(UIView *)self->_button traitCollection];
        double v13 = [v8 traitCollection];
        char v14 = [v12 isEqual:v13];

        if ((v14 & 1) == 0) {
          [(UIImageView *)self->_imageView traitCollectionDidChange:0];
        }
      }
    }
    [(UIImageView *)self->_imageView setHidden:0];
    if (!HIBYTE(v30)) {
      goto LABEL_25;
    }
    if ([(UIButton *)self->_button adjustsImageWhenHighlighted]
      && ![(UIButton *)self->_button showsTouchWhenHighlighted]
      && [(UIControl *)self->_button isHighlighted])
    {
      uint64_t v15 = 2;
      goto LABEL_26;
    }
    if (HIBYTE(v30)
      && [(UIButton *)self->_button adjustsImageWhenDisabled]
      && ![(UIControl *)self->_button isEnabled])
    {
      uint64_t v15 = 1;
    }
    else
    {
LABEL_25:
      uint64_t v15 = 0;
    }
LABEL_26:
    [(UIImageView *)self->_imageView setDrawMode:v15];
    if ([(UIButton *)self->_button _isModernButton]
      || [(UIButton *)self->_button _isCarPlaySystemTypeButton])
    {
      int v17 = [(UIButton *)self->_button _imageColorForState:v3];
      double v18 = [(UIView *)self->_imageView tintColor];
      double v19 = v18;
      if (v18 != v17 && ([v18 isEqual:v17] & 1) == 0) {
        [(UIView *)self->_imageView setTintColor:v17];
      }
    }
    else
    {
      button = self->_button;
      imageView = self->_imageView;
      if ((*(unsigned char *)&button->_buttonFlags & 0x10) != 0)
      {
        BOOL v23 = [(UIControl *)button isEnabled];
        double v22 = 0.25;
        if (v23) {
          double v22 = 1.0;
        }
      }
      else
      {
        double v22 = 1.0;
      }
      [(UIView *)imageView setAlpha:v22];
    }
    double v24 = self->_button;
    if (*((unsigned char *)&v24->_buttonFlags + 3))
    {
      backgroundView = self->_backgroundView;
      double v26 = [(UIView *)v24 traitCollection];
      [(UIImageView *)backgroundView traitCollectionDidChange:v26];

      *(void *)&self->_button->_buttonFlags &= ~0x1000000uLL;
    }
    goto LABEL_39;
  }
  if (self->_imageView)
  {
    double v16 = [(UIButton *)self->_button _preferredConfigurationForState:v3];
    [(UIImageView *)self->_imageView setPreferredSymbolConfiguration:v16];

    [(UIImageView *)self->_imageView setHidden:1];
  }
LABEL_39:
  double v27 = self->_button;
  if ((v10 & 1) == 0)
  {
    [(UIView *)v27 invalidateIntrinsicContentSize];
    double v27 = self->_button;
  }
  if ([(UIControl *)v27 _allowsSymbolAnimations])
  {
    double v28 = self->_imageView;
    double v29 = [MEMORY[0x1E4F41A68] scaleDownEffect];
    if (v3) {
      [(UIImageView *)v28 addSymbolEffect:v29];
    }
    else {
      [(UIImageView *)v28 removeSymbolEffectOfType:v29];
    }
  }
}

- (void)_layoutImageAndTitleViews
{
  if (![(NSArray *)self->_contentConstraints count])
  {
    button = self->_button;
    [(UIView *)button bounds];
    -[UIButton contentRectForBounds:](button, "contentRectForBounds:");
    double v5 = v4;
    double v7 = v6;
    double v9 = v8;
    double v11 = v10;
    imageView = self->_imageView;
    if (imageView) {
      int v13 = ![(UIView *)imageView isHidden];
    }
    else {
      int v13 = 0;
    }
    titleView = self->_titleView;
    if (titleView) {
      int v15 = ![(UIView *)titleView isHidden];
    }
    else {
      int v15 = 0;
    }
    double v16 = self->_button;
    if ((*((unsigned char *)&v16->_buttonFlags + 4) & 4) != 0)
    {
      if (v13)
      {
        double v18 = self->_imageView;
        -[UIButton imageRectForContentRect:](v16, "imageRectForContentRect:", v5, v7, v9, v11);
        -[UIImageView setFrame:](v18, "setFrame:");
      }
      if (v15)
      {
        double v19 = self->_titleView;
        -[UIButton titleRectForContentRect:](self->_button, "titleRectForContentRect:", v5, v7, v9, v11);
        -[UILabel setFrame:](v19, "setFrame:");
      }
    }
    else if ((v13 | v15) == 1)
    {
      long long v17 = *(_OWORD *)(MEMORY[0x1E4F1DB28] + 16);
      long long v22 = *MEMORY[0x1E4F1DB28];
      long long v23 = v17;
      long long v20 = v22;
      long long v21 = v17;
      -[UIButtonLegacyVisualProvider _deriveTitleRect:imageRect:fromContentRect:calculatePositionForEmptyTitle:](self, "_deriveTitleRect:imageRect:fromContentRect:calculatePositionForEmptyTitle:", &v20, &v22, 0, v5, v7, v9, v11);
      if (v13) {
        -[UIImageView setFrame:](self->_imageView, "setFrame:", v22, v23);
      }
      if (v15) {
        -[UILabel setFrame:](self->_titleView, "setFrame:", v20, v21);
      }
    }
  }
}

- (void)_layoutContentBackdropView
{
  UIControlState v3 = [(UIButtonLegacyVisualProvider *)self contentBackdropView];
  double v4 = v3;
  if (v3)
  {
    double v7 = v3;
    char v5 = [v3 isHidden];
    double v4 = v7;
    if ((v5 & 1) == 0)
    {
      button = self->_button;
      [(UIView *)button bounds];
      -[UIButton backgroundRectForBounds:](button, "backgroundRectForBounds:");
      objc_msgSend(v7, "setFrame:");
      double v4 = v7;
    }
  }
}

- (void)_layoutBackgroundImageView
{
  backgroundView = self->_backgroundView;
  if (backgroundView && ![(UIView *)backgroundView isHidden])
  {
    button = self->_button;
    [(UIView *)button bounds];
    -[UIButton backgroundRectForBounds:](button, "backgroundRectForBounds:");
    char v5 = self->_backgroundView;
    -[UIImageView setFrame:](v5, "setFrame:");
  }
}

- (void)_applyAppropriateTouchInsetsForButton
{
  button = self->_button;
  $1CF1FC38577B636919C637EEED589224 buttonFlags = button->_buttonFlags;
  if (UIButtonTypeIsModernCircleButton((*(unint64_t *)&buttonFlags >> 6))
    || (*(_WORD *)&buttonFlags & 0x3FC0) == 0x1C0)
  {
    [(UIView *)button bounds];
    if (v5 + -44.0 <= 0.0) {
      double v7 = (v5 + -44.0) * 0.5;
    }
    else {
      double v7 = 0.0;
    }
    if (v6 + -44.0 <= 0.0) {
      double v8 = (v6 + -44.0) * 0.5;
    }
    else {
      double v8 = 0.0;
    }
    double v9 = self->_button;
    -[UIView _setTouchInsets:](v9, "_setTouchInsets:", v8, v7, v8, v7);
  }
}

- (CGRect)imageRectForContentRect:(CGRect)a3
{
  long long v3 = *(_OWORD *)(MEMORY[0x1E4F1DB28] + 16);
  long long v8 = *MEMORY[0x1E4F1DB28];
  long long v9 = v3;
  -[UIButtonLegacyVisualProvider _deriveTitleRect:imageRect:fromContentRect:calculatePositionForEmptyTitle:](self, "_deriveTitleRect:imageRect:fromContentRect:calculatePositionForEmptyTitle:", 0, &v8, 0, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  double v5 = *((double *)&v8 + 1);
  double v4 = *(double *)&v8;
  double v7 = *((double *)&v9 + 1);
  double v6 = *(double *)&v9;
  result.size.double height = v7;
  result.size.double width = v6;
  result.origin.double y = v5;
  result.origin.double x = v4;
  return result;
}

- (void)_setupPressednessForState:(unint64_t)a3
{
  v12[1] = *MEMORY[0x1E4F143B8];
  button = self->_button;
  if (button->_lastDrawingControlState == a3) {
    return;
  }
  unsigned int v5 = a3;
  uint64_t v6 = [(UIControl *)button _touchHasHighlighted] ^ 1;
  double v7 = [MEMORY[0x1E4F1CA48] array];
  if ([(UIButtonLegacyVisualProvider *)self _isExternalRoundedRectButtonWithPressednessState])
  {
    maskAnimationView = self->_maskAnimationView;
    if (!maskAnimationView) {
      goto LABEL_13;
    }
  }
  else
  {
    if (self->_titleView
      && (((v5 & 4) != 0) & v5) == 0
      && (*(void *)&self->_button->_buttonFlags & 0x800000) == 0)
    {
      objc_msgSend(v7, "addObject:");
    }
    if (!self->_backgroundView
      || ![(UIButtonLegacyVisualProvider *)self _highlightsBackgroundImage])
    {
      goto LABEL_13;
    }
    maskAnimationView = self->_backgroundView;
  }
  [v7 addObject:maskAnimationView];
LABEL_13:
  if ([v7 count]) {
    [(id)objc_opt_class() _setVisuallyHighlighted:v5 & 1 forViews:v7 initialPress:v6];
  }
  if ((((v5 & 4) != 0) & v5) == 0 && self->_imageView)
  {
    if (((*(void *)&self->_button->_buttonFlags >> 4) & 1 & (v5 >> 1)) != 0) {
      double v9 = 0.25;
    }
    else {
      double v9 = 1.0;
    }
    double v10 = objc_opt_class();
    v12[0] = self->_imageView;
    double v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:1];
    [v10 _setVisuallyHighlighted:v5 & 1 forViews:v11 initialPress:v6 baseAlpha:v9];
  }
  if (v5) {
    [(UIControl *)self->_button _setTouchHasHighlighted:1];
  }
}

- (void)_beginTitleAnimation
{
  button = self->_button;
  if ((*((unsigned char *)&button->_buttonFlags + 4) & 2) == 0)
  {
    if ([(UIButton *)button _isModernButton])
    {
      [(UIView *)self->_titleView alpha];
      if (v4 != 0.0)
      {
        if (+[UIView areAnimationsEnabled])
        {
          [(UIButton *)self->_button _setTitleFrozen:1];
          unsigned int v5 = self->_button;
          v10[0] = MEMORY[0x1E4F143A8];
          v10[1] = 3221225472;
          v10[2] = __52__UIButtonLegacyVisualProvider__beginTitleAnimation__block_invoke;
          v10[3] = &unk_1E52D9F70;
          v10[4] = self;
          v7[0] = MEMORY[0x1E4F143A8];
          v7[1] = 3221225472;
          v7[2] = __52__UIButtonLegacyVisualProvider__beginTitleAnimation__block_invoke_2;
          v7[3] = &unk_1E52DA660;
          long long v8 = v5;
          double v9 = self;
          uint64_t v6 = v5;
          +[UIView animateWithDuration:327684 delay:v10 options:v7 animations:0.17 completion:0.0];
        }
      }
    }
  }
}

- (void)setContentHuggingPriorities:(CGSize)a3
{
  id v3 = [(UIButtonLegacyVisualProvider *)self _titleOrImageViewForBaselineLayout];
}

- (id)_viewForBaselineLayout
{
  id v3 = [(UIButtonLegacyVisualProvider *)self _titleOrImageViewForBaselineLayout];
  if (!v3)
  {
    if ([(UIButton *)self->_button _likelyToHaveTitle])
    {
      [(UIButtonLegacyVisualProvider *)self _setupTitleViewRequestingLayout:0];
      id v3 = [(UIButton *)self->_button _titleView];
    }
    else
    {
      id v3 = 0;
    }
  }
  return v3;
}

- ($F24F406B2B787EFB06265DBA3D28CBD5)baselineOffsetsAtSize:(CGSize)a3
{
  CGFloat height = a3.height;
  CGFloat width = a3.width;
  uint64_t v6 = [(UIButtonLegacyVisualProvider *)self _viewForBaselineLayout];
  double v7 = v6;
  if (v6)
  {
    CGFloat rect_24 = width;
    if (v6 == (UIImageView *)self->_titleView)
    {
      [(UIButtonLegacyVisualProvider *)self _updateTitleView];
      button = self->_button;
      -[UIButton contentRectForBounds:](button, "contentRectForBounds:");
      -[UIButton titleRectForContentRect:](button, "titleRectForContentRect:");
    }
    else
    {
      if (v6 != self->_imageView)
      {
        CGFloat v8 = 0.0;
        CGFloat v9 = 0.0;
        CGFloat v10 = 0.0;
        -[UIImageView _baselineOffsetsAtSize:](v6, "_baselineOffsetsAtSize:", 0.0, 0.0, 0);
LABEL_9:
        double v21 = v11;
        double rect_16 = v12;
        [(UIImageView *)v7 alignmentRectInsets];
        double v23 = v22;
        double rect_8 = v24;
        [(UIButton *)self->_button alignmentRectInsets];
        double v26 = v25;
        double v28 = v27;
        v37.origin.double x = v10;
        v37.origin.double y = v32;
        v37.size.CGFloat width = v9;
        v37.size.CGFloat height = v8;
        double v13 = v21 + v23 + CGRectGetMinY(v37) - v26;
        v38.origin.double x = 0.0;
        v38.origin.double y = 0.0;
        v38.size.CGFloat width = rect_24;
        v38.size.CGFloat height = height;
        double v29 = CGRectGetHeight(v38);
        v39.origin.double x = v10;
        v39.origin.double y = v32;
        v39.size.CGFloat width = v9;
        v39.size.CGFloat height = v8;
        double v14 = rect_16 + rect_8 + v29 - CGRectGetMaxY(v39) - v28;
        goto LABEL_10;
      }
      [(UIButtonLegacyVisualProvider *)self _updateImageView];
      long long v20 = self->_button;
      -[UIButton contentRectForBounds:](v20, "contentRectForBounds:");
      -[UIButton imageRectForContentRect:](v20, "imageRectForContentRect:");
    }
    CGFloat v10 = v16;
    CGFloat v9 = v18;
    CGFloat v8 = v19;
    -[UIImageView _baselineOffsetsAtSize:](v7, "_baselineOffsetsAtSize:", v18, v19, v17);
    goto LABEL_9;
  }
  double v13 = 2.22507386e-308;
  double v14 = 2.22507386e-308;
LABEL_10:

  double v30 = v13;
  double v31 = v14;
  result.var1 = v31;
  result.var0 = v30;
  return result;
}

- (id)_setupBackgroundView
{
  if (self->_backgroundView)
  {
    v2 = 0;
  }
  else
  {
    button = self->_button;
    [(UIView *)button bounds];
    -[UIButton backgroundRectForBounds:](button, "backgroundRectForBounds:");
    unsigned int v5 = -[UIButtonLegacyVisualProvider _newImageViewWithFrame:](self, "_newImageViewWithFrame:");
    backgroundView = self->_backgroundView;
    self->_backgroundView = v5;

    [(UIButtonLegacyVisualProvider *)self _updateEffectsForImageView:self->_backgroundView background:1];
    selectionView = self->_selectionView;
    CGFloat v8 = [(UIButtonLegacyVisualProvider *)self effectiveContentView];
    CGFloat v9 = v8;
    CGFloat v10 = self->_backgroundView;
    if (selectionView) {
      [v8 insertSubview:v10 aboveSubview:self->_selectionView];
    }
    else {
      [v8 insertSubview:v10 atIndex:0];
    }

    v2 = self->_backgroundView;
  }
  return v2;
}

- (id)_createPreparedImageViewWithFrame:(CGRect)a3
{
  id v4 = -[UIButtonLegacyVisualProvider _newImageViewWithFrame:](self, "_newImageViewWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  [(UIButtonLegacyVisualProvider *)self _updateEffectsForImageView:v4 background:0];
  return v4;
}

- (void)didChangeFromIdiom:(int64_t)a3 onScreen:(id)a4 traverseHierarchy:(BOOL)a5
{
  -[UIButtonLegacyVisualProvider _updateEffectsForImageView:background:](self, "_updateEffectsForImageView:background:", self->_imageView, 0, a5);
  backgroundView = self->_backgroundView;
  [(UIButtonLegacyVisualProvider *)self _updateEffectsForImageView:backgroundView background:1];
}

- (void)_updateEffectsForImageView:(id)a3 background:(BOOL)a4
{
  BOOL v4 = a4;
  id v7 = a3;
  if ([(UIButtonLegacyVisualProvider *)self _shouldDefaultToTemplatesForImageViewBackground:v4])
  {
    uint64_t v6 = 2;
  }
  else
  {
    uint64_t v6 = 0;
  }
  [v7 _setDefaultRenderingMode:v6];
}

- (id)_newImageViewWithFrame:(CGRect)a3
{
  BOOL v4 = -[UIImageView initWithFrame:]([UIImageView alloc], "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  [(UIView *)v4 setUserInteractionEnabled:0];
  [(UIView *)v4 setOpaque:0];
  [(UIView *)v4 setClipsToBounds:1];
  [(UIImageView *)v4 setSemanticContentAttribute:[(UIView *)self->_button semanticContentAttribute]];
  return v4;
}

- (BOOL)_shouldDefaultToTemplatesForImageViewBackground:(BOOL)a3
{
  BOOL v5 = [(UIButton *)self->_button _isModernButton]
    || [(UIButton *)self->_button _isCarPlaySystemTypeButton];
  return v5 && !a3;
}

- (BOOL)_shouldUpdatePressedness
{
  if ([(UIButtonLegacyVisualProvider *)self _isExternalRoundedRectButtonWithPressednessState])
  {
    return 1;
  }
  if ([(UIButton *)self->_button _hasDrawingStyle]) {
    return 0;
  }
  button = self->_button;
  return [(UIButton *)button _isModernButton];
}

- (CGSize)_intrinsicSizeForTitle:(id)a3 attributedTitle:(id)a4 image:(id)a5 backgroundImage:(id)a6 titlePaddingInsets:(UIEdgeInsets *)a7
{
  v92[1] = *MEMORY[0x1E4F143B8];
  unint64_t v12 = (unint64_t)a3;
  unint64_t v13 = (unint64_t)a4;
  id v14 = a5;
  id v15 = a6;
  if (a7)
  {
    *(_OWORD *)&a7->top = 0u;
    *(_OWORD *)&a7->bottom = 0u;
  }
  double v17 = *MEMORY[0x1E4F1DB30];
  double v16 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  double v18 = (double *)MEMORY[0x1E4F1DAD8];
  if (v14)
  {
    [(UIButton *)self->_button _effectiveSizeForImage:v14];
    double v20 = v19;
    double height = v21;
    if ([(UIButton *)self->_button _hasDrawingStyle])
    {
      -[UIButtonLegacyVisualProvider _highlightRectForImageRect:](self, "_highlightRectForImageRect:", *v18, v18[1], v20, height);
      if (v20 < v23) {
        double v20 = v23;
      }
      if (height < v24) {
        double height = v24;
      }
    }
    if ([v14 hasBaseline])
    {
      [v14 size];
      [v14 baselineOffsetFromBottom];
      double v25 = objc_opt_new();
      int v26 = 1;
      [v25 setWantsBaselineOffset:1];
      if (!v13) {
        goto LABEL_23;
      }
    }
    else
    {
      int v26 = 0;
      double v25 = 0;
      if (!v13) {
        goto LABEL_23;
      }
    }
  }
  else
  {
    int v26 = 0;
    double v25 = 0;
    double v20 = *MEMORY[0x1E4F1DB30];
    double height = *(double *)(MEMORY[0x1E4F1DB30] + 8);
    if (!v13) {
      goto LABEL_23;
    }
  }
  if ([(id)v13 length])
  {
    unint64_t v88 = v12;
    int v87 = v26;
    if ([(UILabel *)self->_titleView adjustsFontForContentSizeCategory]
      && [(UIButton *)self->_button _shouldAdjustToTraitCollection])
    {
      double v27 = [(UIView *)self->_button traitCollection];
      uint64_t v28 = objc_msgSend((id)v13, "_ui_attributedStringAdjustedToTraitCollection:", v27);
      double v29 = (void *)v28;
      if (v28) {
        double v30 = (void *)v28;
      }
      else {
        double v30 = (void *)v13;
      }
      id v31 = v30;

      unint64_t v13 = (unint64_t)v31;
      double v18 = (double *)MEMORY[0x1E4F1DAD8];
    }
    CGFloat v32 = +[UILabel _defaultAttributes];
    v33 = (void *)[v32 mutableCopy];

    v34 = [(UIButton *)self->_button _font];
    [v33 setObject:v34 forKey:*(void *)off_1E52D2040];

    v35 = -[NSAttributedString _ui_synthesizeAttributedSubstringFromRange:usingDefaultAttributes:]((void *)v13, 0, [(id)v13 length], v33);
    objc_msgSend(v35, "boundingRectWithSize:options:context:", 65, v25, 3.40282347e38, 3.40282347e38);
    double v37 = v36;
    double v16 = v38;
    [v25 firstBaselineOffset];
    -[UIButton _roundSize:](self->_button, "_roundSize:", v37, v16);
    double v17 = v39;

    goto LABEL_29;
  }
LABEL_23:
  if (v12 && [(id)v12 length])
  {
    int v87 = v26;
    uint64_t v91 = *(void *)off_1E52D2040;
    [(UIButton *)self->_button _font];
    id v40 = v14;
    unint64_t v41 = v13;
    id v42 = v15;
    v44 = v43 = a7;
    v92[0] = v44;
    v45 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v92 forKeys:&v91 count:1];
    unint64_t v88 = v12;
    objc_msgSend((id)v12, "boundingRectWithSize:options:attributes:context:", 1, v45, v25, v17, v16);
    double v47 = v46;
    double v49 = v48;

    a7 = v43;
    id v15 = v42;
    unint64_t v13 = v41;
    id v14 = v40;
  }
  else
  {
    if (![(UIButton *)self->_button _likelyToHaveTitle])
    {
      CGFloat x = *v18;
      CGFloat y = v18[1];
      char v64 = 1;
      goto LABEL_41;
    }
    unint64_t v88 = v12;
    int v87 = v26;
    uint64_t v89 = *(void *)off_1E52D2040;
    v50 = [(UIButton *)self->_button _font];
    v90 = v50;
    v51 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v90 forKeys:&v89 count:1];
    objc_msgSend(&stru_1ED0E84C0, "boundingRectWithSize:options:attributes:context:", 1, v51, v25, v17, v16);
    double v47 = v52;
    double v49 = v53;
  }
  [v25 firstBaselineOffset];
  -[UIButton _roundSize:](self->_button, "_roundSize:", v47, v49);
  double v17 = v54;
  double v16 = v55;
LABEL_29:
  BOOL v56 = [(UIButton *)self->_button _hasDrawingStyle];
  CGFloat x = *v18;
  CGFloat y = v18[1];
  if (v56)
  {
    -[UIButtonLegacyVisualProvider _highlightRectForTextRect:](self, "_highlightRectForTextRect:", *v18, v18[1], v17, v16);
    if (v17 < v59) {
      double v17 = v59;
    }
    if (v16 < v60) {
      double v16 = v60;
    }
  }
  unint64_t v12 = v88;
  if (v16 > 0.0) {
    int v61 = v87;
  }
  else {
    int v61 = 0;
  }
  if (v61 != 1)
  {
    char v64 = 0;
LABEL_41:
    v95.size.CGFloat width = v20;
    goto LABEL_42;
  }
  UIRoundToViewScale(self->_button);
  CGFloat v63 = v62;
  v94.origin.CGFloat x = x;
  v94.origin.CGFloat y = y;
  v94.size.CGFloat width = v20;
  v94.size.double height = height;
  CGRect v95 = CGRectOffset(v94, 0.0, v63);
  CGFloat x = v95.origin.x;
  CGFloat y = v95.origin.y;
  double height = v95.size.height;
  char v64 = 0;
LABEL_42:
  v97.origin.CGFloat y = 0.0;
  CGFloat v65 = x;
  CGFloat v66 = y;
  double v67 = height;
  v97.origin.CGFloat x = v20;
  v97.size.CGFloat width = v17;
  v97.size.double height = v16;
  CGRect v96 = CGRectUnion(v95, v97);
  [(UIButton *)self->_button contentEdgeInsets];
  double v69 = v68;
  double v71 = v70;
  double v73 = v72;
  double v75 = v74;
  if (v14 && (*(void *)&self->_button->super.super._viewFlags & 0x800000000000000) != 0 && v12 | v13)
  {
    [(id)UIApp userInterfaceLayoutDirection];
    [(UIButton *)self->_button imageEdgeInsets];
    [(UIButton *)self->_button titleEdgeInsets];
  }
  if (v15)
  {
    if ([v15 _isResizable])
    {
      [v15 capInsets];
      [v15 alignmentRectInsets];
    }
    [v15 size];
  }
  else
  {
    if (v14) {
      char v76 = 1;
    }
    else {
      char v76 = v64;
    }
    if ((v76 & 1) == 0 && v71 == 0.0 && v69 == 0.0 && v75 == 0.0 && v73 == 0.0)
    {
      unint64_t v77 = v12;
      v78 = [(UIView *)self->_button traitCollection];
      uint64_t v79 = [v78 userInterfaceIdiom];

      if (v79 == 5) {
        double v80 = 5.0;
      }
      else {
        double v80 = 6.0;
      }
      if (a7)
      {
        a7->top = v80;
        a7->left = 0.0;
        a7->bottom = v80;
        a7->right = 0.0;
      }
      unint64_t v12 = v77;
    }
  }
  UIRoundToViewScale(self->_button);
  double v82 = v81;
  UIRoundToViewScale(self->_button);
  double v84 = v83;

  double v85 = v82;
  double v86 = v84;
  result.double height = v86;
  result.CGFloat width = v85;
  return result;
}

- (BOOL)_isExternalRoundedRectButtonWithPressednessState
{
  if (![(UIButton *)self->_button _isCarPlaySystemTypeButton]
    || [(UIButton *)self->_button _isEffectivelyDisabledExternalButton])
  {
    return 0;
  }
  button = self->_button;
  return [(UIControl *)button isEnabled];
}

- (void)cleanupForVisualProvider:(id)a3
{
  double v16 = (id *)a3;
  [(UIView *)self->_backgroundView removeFromSuperview];
  [(UIView *)self->_floatingContentView removeFromSuperview];
  [(UIView *)self->_contentBackdropView removeFromSuperview];
  [(UIView *)self->_titleView removeFromSuperview];
  [(UIView *)self->_imageView removeFromSuperview];
  [(UIView *)self->_selectionView removeFromSuperview];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_storeStrong(v16 + 2, self->_backgroundView);
    BOOL v4 = v16;
    objc_storeStrong(v4 + 3, self->_floatingContentView);
    objc_storeStrong(v4 + 4, self->_contentBackdropView);
    objc_storeStrong(v4 + 6, self->_titleView);
    objc_storeStrong(v4 + 5, self->_imageView);
    objc_storeStrong(v4 + 7, self->_selectionView);
    objc_storeStrong(v4 + 8, self->_highlightLayer);
    objc_storeStrong(v4 + 9, self->_maskAnimationView);
    id WeakRetained = objc_loadWeakRetained((id *)&self->_effectiveContentView);
    objc_storeWeak(v4 + 10, WeakRetained);

    uint64_t v6 = [v4 effectiveContentView];
    [v6 addSubview:self->_backgroundView];

    id v7 = [v4 effectiveContentView];
    [v7 addSubview:self->_floatingContentView];

    CGFloat v8 = [v4 effectiveContentView];
    [v8 addSubview:self->_contentBackdropView];

    CGFloat v9 = [v4 effectiveContentView];
    [v9 addSubview:self->_titleView];

    CGFloat v10 = [v4 effectiveContentView];
    [v10 addSubview:self->_imageView];

    double v11 = [v4 effectiveContentView];

    [v11 addSubview:self->_selectionView];
  }
  [(CALayer *)self->_highlightLayer removeFromSuperlayer];
  [(UIView *)self->_maskAnimationView removeFromSuperview];
  unint64_t v12 = (UIButton *)objc_loadWeakRetained((id *)&self->_effectiveContentView);
  button = self->_button;

  if (v12 != button)
  {
    id v14 = objc_loadWeakRetained((id *)&self->_effectiveContentView);
    [v14 removeFromSuperview];
  }
  id v15 = [(UIView *)self->_button viewWithTag:1886548836];
  [v15 removeFromSuperview];
}

- (void)_updateSelectionViewForState:(unint64_t)a3
{
  char v3 = a3;
  if ((a3 & 4) != 0 && !self->_selectionView)
  {
    BOOL v5 = [(id)objc_opt_class() _selectedIndicatorImage];
    uint64_t v6 = [(UIButton *)self->_button _selectedIndicatorViewWithImage:v5];
    selectionView = self->_selectionView;
    self->_selectionView = v6;

    [(UIView *)self->_selectionView setAlpha:0.0];
    [(UIView *)self->_selectionView setUserInteractionEnabled:0];
    CGFloat v8 = [(UIButtonLegacyVisualProvider *)self contentBackdropView];

    CGFloat v9 = [(UIButtonLegacyVisualProvider *)self effectiveContentView];
    CGFloat v10 = v9;
    double v11 = self->_selectionView;
    if (v8)
    {
      unint64_t v12 = [(UIButtonLegacyVisualProvider *)self contentBackdropView];
      [v10 insertSubview:v11 above:v12];
    }
    else
    {
      [v9 insertSubview:self->_selectionView atIndex:0];
    }
  }
  if (self->_selectionView)
  {
    unint64_t v13 = self->_button;
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __61__UIButtonLegacyVisualProvider__updateSelectionViewForState___block_invoke;
    v26[3] = &unk_1E52D9F98;
    v26[4] = self;
    id v14 = v13;
    double v27 = v14;
    +[UIView performWithoutAnimation:v26];
    double v15 = 0.0;
    if ((v3 & 4) != 0) {
      [(UIButton *)self->_button _selectedIndicatorAlpha];
    }
    if (v3) {
      double v16 = v15 * 0.8;
    }
    else {
      double v16 = v15;
    }
    [(UIView *)self->_selectionView alpha];
    if (v17 != v16)
    {
      double v18 = dbl_186B96D20[(v3 & 4) == 0];
      v25[0] = MEMORY[0x1E4F143A8];
      v25[1] = 3221225472;
      v25[2] = __61__UIButtonLegacyVisualProvider__updateSelectionViewForState___block_invoke_2;
      v25[3] = &unk_1E52D9CD0;
      v25[4] = self;
      *(double *)&v25[5] = v16;
      +[UIView animateWithDuration:327684 delay:v25 options:0 animations:v18 completion:0.0];
    }
  }
  if ((v3 & 4) != 0
    && [(UIButtonLegacyVisualProvider *)self _textNeedsCompositingModeWhenSelected])
  {
    double v19 = [MEMORY[0x1E4F39BC0] filterWithType:*MEMORY[0x1E4F3A098]];
    int v20 = 1;
  }
  else
  {
    int v20 = 0;
    double v19 = 0;
  }
  double v21 = [(UIView *)self->_titleView layer];
  [v21 setCompositingFilter:v19];

  if (v20) {
  if ((v3 & 4) != 0
  }
    && [(UIButtonLegacyVisualProvider *)self _imageNeedsCompositingModeWhenSelected])
  {
    double v22 = [MEMORY[0x1E4F39BC0] filterWithType:*MEMORY[0x1E4F3A098]];
    int v23 = 1;
  }
  else
  {
    int v23 = 0;
    double v22 = 0;
  }
  double v24 = [(UIView *)self->_imageView layer];
  [v24 setCompositingFilter:v22];

  if (v23) {
}
  }

- (id)titleViewCreateIfNeeded:(BOOL)a3
{
  if (a3)
  {
    if (![(UIButton *)self->_button _canHaveTitle])
    {
      BOOL v4 = 0;
      goto LABEL_8;
    }
    [(UIButtonLegacyVisualProvider *)self _setupTitleView];
    if (dyld_program_sdk_at_least()) {
      [(UIButtonLegacyVisualProvider *)self _updateTitleView];
    }
    else {
      [(UIView *)self->_button layoutBelowIfNeeded];
    }
  }
  BOOL v4 = self->_titleView;
LABEL_8:
  return v4;
}

- (void)_setupTitleViewRequestingLayout:(BOOL)a3
{
  if (!self->_titleView)
  {
    BOOL v4 = a3;
    button = self->_button;
    [(UIView *)button bounds];
    -[UIButton contentRectForBounds:](button, "contentRectForBounds:");
    -[UIButton titleRectForContentRect:](button, "titleRectForContentRect:");
    uint64_t v6 = -[UIButtonLegacyVisualProvider _newLabelWithFrame:](self, "_newLabelWithFrame:");
    titleView = self->_titleView;
    self->_titleView = v6;

    if ([(UIButton *)self->_button _shouldAdjustToTraitCollection]) {
      [(UILabel *)self->_titleView setAdjustsFontForContentSizeCategory:[(UIButton *)self->_button _isiOSSystemProvidedButton]];
    }
    unsigned __int8 v16 = 0;
    CGFloat v8 = [(UIButton *)self->_button _lazyTitleViewFontIsDefaultForIdiom:&v16];
    [(UILabel *)self->_titleView _setFont:v8 isDefaultForIdiom:v16];
    [(UILabel *)self->_titleView setLineBreakMode:5];
    uint64_t v9 = 0;
    CGFloat v10 = self->_titleView;
    double v11 = self->_button;
    if (*(unsigned char *)&v11->_buttonFlags) {
      uint64_t v9 = [(UIControl *)v11 isHighlighted];
    }
    [(UILabel *)v10 setReverseShadow:v9];
    [(UILabel *)self->_titleView setTextAlignment:2* ([(UIControl *)self->_button effectiveContentHorizontalAlignment] == UIControlContentHorizontalAlignmentRight)];
    unint64_t v12 = [(UIButtonLegacyVisualProvider *)self effectiveContentView];
    [v12 addSubview:self->_titleView];

    if (v4) {
      [(UIButton *)self->_button setNeedsLayout];
    }
  }
  if ((*((unsigned char *)&self->_button->_buttonFlags + 3) & 0x80) != 0)
  {
    unint64_t v13 = [(UILabel *)self->_titleView _defaultAttributes];
    id v14 = (void *)[v13 mutableCopy];

    double v15 = [(UIButton *)self->_button _titleColorForState:[(UIControl *)self->_button state] suppressTintColorFollowing:0];
    [v14 setObject:v15 forKeyedSubscript:*(void *)off_1E52D2048];

    [(UILabel *)self->_titleView _setDefaultAttributes:v14];
    *(void *)&self->_button->_buttonFlags &= ~0x80000000uLL;
  }
}

- (void)setSemanticContentAttribute:(int64_t)a3
{
  BOOL v5 = [(UIButton *)self->_button _backgroundView];
  [v5 setSemanticContentAttribute:a3];

  id v6 = [(UIButton *)self->_button _imageView];
  [v6 setSemanticContentAttribute:a3];
}

- (id)backgroundViewCreateIfNeeded:(BOOL)a3
{
  return self->_backgroundView;
}

- (id)effectiveContentView
{
  p_effectiveContentView = &self->_effectiveContentView;
  id WeakRetained = (UIButton *)objc_loadWeakRetained((id *)&self->_effectiveContentView);
  if (!WeakRetained)
  {
    if ([(UIButton *)self->_button _shouldHaveFloatingAppearance])
    {
      BOOL v5 = [(UIButtonLegacyVisualProvider *)self _floatingContentView];
      id WeakRetained = [v5 contentView];
    }
    else
    {
      id WeakRetained = self->_button;
    }
    objc_storeWeak((id *)p_effectiveContentView, WeakRetained);
  }
  return WeakRetained;
}

- (void)_setupTitleView
{
}

- (void)setFont:(id)a3 isDefaultForIdiom:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  titleView = self->_titleView;
  if (titleView)
  {
    uint64_t v16 = (uint64_t)v6;
    uint64_t v8 = [(UILabel *)titleView font];
    uint64_t v9 = self->_titleView;
    if (v9) {
      BOOL v10 = (v16 | v8) == 0;
    }
    else {
      BOOL v10 = 1;
    }
    if (v10)
    {
      -[UILabel _setFont:isDefaultForIdiom:](v9, "_setFont:isDefaultForIdiom:");
    }
    else
    {
      char v13 = objc_msgSend((id)v8, "isEqual:");
      [(UILabel *)self->_titleView _setFont:v16 isDefaultForIdiom:v4];
      if ((v13 & 1) == 0) {
        [(UIView *)self->_button invalidateIntrinsicContentSize];
      }
    }
  }
  else
  {
    if (v6) {
      goto LABEL_16;
    }
    double v11 = [(UIView *)self->_button traitCollection];
    uint64_t v12 = [v11 userInterfaceIdiom];

    if (v12 == 6) {
      [off_1E52D39B8 preferredFontForTextStyle:@"UICTFontTextStyleHeadline"];
    }
    else {
    id v6 = +[UILabel defaultFont];
    }
    if (v6)
    {
LABEL_16:
      uint64_t v16 = (uint64_t)v6;
      [(UIButton *)self->_button _setLazyTitleViewFont:v6 isDefaultForIdiom:v4];
    }
    else
    {
      uint64_t v16 = [(UIButton *)self->_button _lazyTitleViewFontIsDefaultForIdiom:0];
      id v14 = [(id)v16 fontName];
      [(id)v16 pointSize];
      NSLog(&cfstr_NilPassedToUib.isa, v14, v15);
    }
  }
}

- (void)updateConstraints
{
  char v3 = [(UIButtonLegacyVisualProvider *)self _titleOrImageViewForBaselineLayout];
  id v4 = v3;
  if (v3 && ([v3 translatesAutoresizingMaskIntoConstraints] & 1) == 0 && !self->_contentConstraints)
  {
    v104 = [(UIButton *)self->_button _imageForState:[(UIControl *)self->_button state] applyingConfiguration:0 usesImageForNormalState:0];
    if (v104)
    {
      id v5 = [(UIButton *)self->_button _imageView];
    }
    else
    {
      id v5 = 0;
    }
    [v5 setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIView *)self->_button contentHuggingPriorityForAxis:0];
    *(float *)&double v7 = v6 + -1.0;
    [v5 setContentCompressionResistancePriority:0 forAxis:v7];
    [(UIView *)self->_button contentHuggingPriorityForAxis:1];
    *(float *)&double v9 = v8 + -1.0;
    [v5 setContentCompressionResistancePriority:1 forAxis:v9];
    [(UIView *)self->_button contentCompressionResistancePriorityForAxis:0];
    *(float *)&double v11 = v10 + -1.0;
    [v5 setContentHuggingPriority:0 forAxis:v11];
    [(UIView *)self->_button contentCompressionResistancePriorityForAxis:1];
    *(float *)&double v13 = v12 + -1.0;
    [v5 setContentHuggingPriority:1 forAxis:v13];
    id v14 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v15 = 0;
    uint64_t v16 = 0;
    if (v5) {
      BOOL v17 = v4 == v5;
    }
    else {
      BOOL v17 = 1;
    }
    char v18 = v17;
    char v91 = v18;
    if (!v17)
    {
      double v19 = v5;
      uint64_t v16 = [(UIView *)self->_button viewWithTag:12000274];
      if (v16)
      {
        uint64_t v15 = [(UIView *)self->_button viewWithTag:-12000274];
      }
      else
      {
        uint64_t v15 = 0;
      }
      UIControlContentHorizontalAlignment v20 = [(UIControl *)self->_button contentHorizontalAlignment];
      if (v16 || v20)
      {
        if ([(UIControl *)self->_button contentHorizontalAlignment])
        {
          [v16 removeFromSuperview];

          [v15 removeFromSuperview];
          uint64_t v15 = 0;
          uint64_t v16 = 0;
        }
      }
      else
      {
        aBlock[0] = MEMORY[0x1E4F143A8];
        aBlock[1] = 3221225472;
        aBlock[2] = __49__UIButtonLegacyVisualProvider_updateConstraints__block_invoke;
        aBlock[3] = &unk_1E52F11E0;
        aBlock[4] = self;
        double v21 = (void (**)(void *, uint64_t))_Block_copy(aBlock);
        uint64_t v16 = v21[2](v21, 12000274);
        uint64_t v22 = v21[2](v21, -12000274);

        uint64_t v15 = (void *)v22;
      }
      id v5 = v19;
    }
    id firstValue = v5;
    v101 = v16;
    v102 = v15;
    v103 = v14;
    uint64_t v98 = [(id)UIApp userInterfaceLayoutDirection];
    [(UIButton *)self->_button _combinedContentPaddingInsets];
    double v24 = v23;
    double v26 = v25;
    double v28 = v27;
    double v95 = v29;
    [(UIButton *)self->_button imageEdgeInsets];
    double v31 = v30;
    double v33 = v32;
    double v35 = v34;
    double v37 = v36;
    [(UIButton *)self->_button titleEdgeInsets];
    double v93 = v38;
    double v96 = v39;
    double v97 = v40;
    double v42 = v41;
    v105 = (void *)MEMORY[0x1E4F1CA60];
    double v43 = v24 + v31;
    *(float *)&double v43 = v24 + v31;
    v99 = [NSNumber numberWithFloat:v43];
    double v44 = v26 + v33;
    double v90 = v26 + v33;
    *(float *)&double v44 = v26 + v33;
    v45 = [NSNumber numberWithFloat:v44];
    double v46 = v28 + v35;
    double v92 = v28 + v35;
    *(float *)&double v46 = v28 + v35;
    double v47 = [NSNumber numberWithFloat:v46];
    double v48 = v95 + v37;
    *(float *)&double v48 = v95 + v37;
    double v49 = [NSNumber numberWithFloat:v48];
    double v50 = v24 + v93;
    double v94 = v50;
    *(float *)&double v50 = v50;
    v51 = [NSNumber numberWithFloat:v50];
    double v52 = v26 + v96;
    *(float *)&double v53 = v52;
    double v54 = [NSNumber numberWithFloat:v53];
    HIDWORD(v55) = HIDWORD(v97);
    double v56 = v28 + v97;
    *(float *)&double v55 = v56;
    v57 = [NSNumber numberWithFloat:v55];
    *(float *)&double v58 = v95 + v42;
    double v59 = [NSNumber numberWithFloat:v58];
    double v60 = v33 + v42;
    if (v98 != 1) {
      double v60 = v37 + v96;
    }
    *(float *)&double v60 = v60;
    int v61 = [NSNumber numberWithFloat:v60];
    objc_msgSend(v105, "dictionaryWithObjectsAndKeys:", v99, @"topImageInset", v45, @"leftImageInset", v47, @"bottomImageInset", v49, @"rightImageInset", v51, @"topTitleInset", v54, @"leftTitleInset", v57, @"bottomTitleInset", v59, @"rightTitleInset", v61,
      @"interImageTitleSpace",
    uint64_t v106 = 0);

    double v62 = _NSDictionaryOfVariableBindings(&cfstr_Layoutview.isa, v4, 0);
    CGFloat v63 = (void *)[v62 mutableCopy];

    if (firstValue)
    {
      char v64 = _NSDictionaryOfVariableBindings(&cfstr_Imageview.isa, firstValue, 0);
      [v63 addEntriesFromDictionary:v64];
    }
    if (v101)
    {
      CGFloat v65 = _NSDictionaryOfVariableBindings(&cfstr_LeftspacerRigh.isa, v101, v102, 0);
      [v63 addEntriesFromDictionary:v65];
    }
    CGFloat v66 = (void *)v106;
    switch([(UIControl *)self->_button effectiveContentHorizontalAlignment])
    {
      case UIControlContentHorizontalAlignmentCenter:
        if (firstValue)
        {
          if (v4 != firstValue)
          {
            double v67 = @"|-(leftImageInset)-[leftSpacer][imageView]-(interImageTitleSpace)-[layoutView][rightSpacer(>=leftSpacer,==leftSpacer@200)]-(rightTitleInset)-|";
            goto LABEL_42;
          }
          unint64_t v77 = (void *)MEMORY[0x1E4F5B268];
          button = self->_button;
          double v79 = v90 + (v95 + v37) * -0.5;
        }
        else
        {
          unint64_t v77 = (void *)MEMORY[0x1E4F5B268];
          button = self->_button;
          double v79 = (v52 - (v95 + v42)) * 0.5;
        }
        double v80 = [v77 constraintWithItem:v4 attribute:9 relatedBy:0 toItem:button attribute:9 multiplier:1.0 constant:v79];
        [v103 addObject:v80];

        goto LABEL_55;
      case UIControlContentHorizontalAlignmentLeft:
        double v68 = @"|-(leftImageInset)-[imageView]-(interImageTitleSpace)-[layoutView]-(>=rightTitleInset)-|";
        if (v4 == firstValue) {
          double v68 = @"|-(leftImageInset)-[layoutView]-(>=rightImageInset)-|";
        }
        double v69 = @"|-(leftTitleInset)-[layoutView]-(>=rightTitleInset)-|";
        goto LABEL_39;
      case UIControlContentHorizontalAlignmentRight:
        double v68 = @"|-(>=leftImageInset)-[imageView]-(interImageTitleSpace)-[layoutView]-(rightTitleInset)-|";
        if (v4 == firstValue) {
          double v68 = @"|-(>=leftImageInset)-[layoutView]-(rightImageInset)-|";
        }
        double v69 = @"|-(>=leftTitleInset)-[layoutView]-(rightTitleInset)-|";
LABEL_39:
        if (firstValue) {
          double v67 = v68;
        }
        else {
          double v67 = v69;
        }
        goto LABEL_42;
      case UIControlContentHorizontalAlignmentFill:
        if (firstValue) {
          double v67 = @"|-(leftImageInset)-[layoutView]-(rightImageInset)-|";
        }
        else {
          double v67 = @"|-(leftTitleInset)-[layoutView]-(rightTitleInset)-|";
        }
        if ((v91 & 1) == 0)
        {
          [firstValue intrinsicContentSize];
          if (v72 == 0.0)
          {
            double v76 = 1.0;
          }
          else
          {
            [v4 intrinsicContentSize];
            double v74 = v73;
            [firstValue intrinsicContentSize];
            double v76 = v74 / v75;
          }
          uint64_t v89 = [MEMORY[0x1E4F5B268] constraintWithItem:v4 attribute:7 relatedBy:0 toItem:firstValue attribute:7 multiplier:v76 constant:0.0];
          [v103 addObject:v89];

          double v67 = @"|-(leftImageInset)-[imageView]-(interImageTitleSpace)-[layoutView]-(rightTitleInset)-|";
        }
LABEL_42:
        if (dyld_program_sdk_at_least()) {
          uint64_t v70 = 0x10000;
        }
        else {
          uint64_t v70 = 0;
        }
        double v71 = [MEMORY[0x1E4F5B268] constraintsWithVisualFormat:v67 options:v70 metrics:v106 views:v63];
        [v103 addObjectsFromArray:v71];

        break;
      default:
LABEL_55:
        dyld_program_sdk_at_least();
        break;
    }
    int64_t v81 = [(UIControl *)self->_button effectiveContentVerticalAlignment];
    double v82 = @"V:|-(topTitleInset)-[layoutView]-(bottomTitleInset)-|";
    double v83 = @"V:|-(topImageInset)-[imageView]-(bottomImageInset)-|";
    switch(v81)
    {
      case 0:
      case 4:
      case 5:
        if (firstValue)
        {
          double v84 = [MEMORY[0x1E4F5B268] constraintWithItem:firstValue attribute:10 relatedBy:0 toItem:self->_button attribute:10 multiplier:1.0 constant:(v24 + v31 - v92) * 0.5];
          [v103 addObject:v84];
        }
        if (v4 != firstValue)
        {
          double v85 = [MEMORY[0x1E4F5B268] constraintWithItem:v4 attribute:10 relatedBy:0 toItem:self->_button attribute:10 multiplier:1.0 constant:(v94 - v56) * 0.5];
          [v103 addObject:v85];
          goto LABEL_67;
        }
        break;
      case 1:
        double v82 = @"V:|-(topTitleInset)-[layoutView]-(>=bottomTitleInset)-|";
        double v83 = @"V:|-(topImageInset)-[imageView]-(>=bottomImageInset)-|";
        goto LABEL_63;
      case 2:
        double v82 = @"V:|-(>=topTitleInset)-[layoutView]-(bottomTitleInset)-|";
        double v83 = @"V:|-(>=topImageInset)-[imageView]-(bottomImageInset)-|";
        goto LABEL_63;
      case 3:
LABEL_63:
        if (firstValue)
        {
          double v86 = [MEMORY[0x1E4F5B268] constraintsWithVisualFormat:v83 options:0 metrics:v106 views:v63];
          [v103 addObjectsFromArray:v86];

          CGFloat v66 = (void *)v106;
        }
        if (v4 != firstValue)
        {
          double v85 = [MEMORY[0x1E4F5B268] constraintsWithVisualFormat:v82 options:0 metrics:v66 views:v63];
          [v103 addObjectsFromArray:v85];
LABEL_67:
        }
        break;
      default:
        break;
    }
    int v87 = [MEMORY[0x1E4F5B268] constraintWithItem:v4 attribute:7 relatedBy:-1 toItem:self->_button attribute:7 multiplier:1.0 constant:0.0];
    [v103 addObject:v87];

    unint64_t v88 = [MEMORY[0x1E4F5B268] constraintWithItem:v4 attribute:8 relatedBy:-1 toItem:self->_button attribute:8 multiplier:1.0 constant:0.0];
    [v103 addObject:v88];

    [(UIView *)self->_button addConstraints:v103];
    [(UIButtonLegacyVisualProvider *)self _setContentConstraints:v103];
  }
}

- (void)intrinsicContentSizeInvalidatedForChildView:(id)a3
{
  id v4 = a3;
  imageView = self->_imageView;
  titleView = self->_titleView;
  backgroundView = self->_backgroundView;
  if (titleView != v4 && imageView != v4 && backgroundView != v4) {
    goto LABEL_28;
  }
  id v13 = v4;
  if (backgroundView == v4 || imageView == v4)
  {
    if ([(UIButton *)self->_button autosizesToFit]) {
      goto LABEL_17;
    }
    double v11 = [(UIView *)self->_button traitCollection];
    if ([v11 userInterfaceIdiom] != 3)
    {

      goto LABEL_19;
    }
    BOOL IsModernCircleButton = UIButtonTypeIsModernCircleButton([(UIButton *)self->_button buttonType]);

    if (IsModernCircleButton) {
LABEL_17:
    }
      [(UIView *)self->_button sizeToFit];
LABEL_19:
    [(UIButton *)self->_button setNeedsLayout];
  }
  if ([(UIControl *)self->_button effectiveContentHorizontalAlignment] == UIControlContentHorizontalAlignmentFill
    && (imageView == v13 && self->_titleView || titleView == v13 && self->_imageView))
  {
    [(UIButtonLegacyVisualProvider *)self _invalidateContentConstraints];
  }
  [(UIView *)self->_button invalidateIntrinsicContentSize];
  id v4 = v13;
LABEL_28:
}

- (void)_deriveTitleRect:(CGRect *)a3 imageRect:(CGRect *)a4 fromContentRect:(CGRect)a5 calculatePositionForEmptyTitle:(BOOL)a6
{
  BOOL v6 = a6;
  double height = a5.size.height;
  double width = a5.size.width;
  double y = a5.origin.y;
  double x = a5.origin.x;
  v177[2] = *MEMORY[0x1E4F143B8];
  UIControlState v14 = [(UIControl *)self->_button state];
  int64_t v15 = [(UIControl *)self->_button effectiveContentVerticalAlignment];
  [(UIButton *)self->_button imageEdgeInsets];
  double v17 = x + v16;
  double v19 = y + v18;
  double v21 = width - (v16 + v20);
  double v23 = height - (v18 + v22);
  [(UIView *)self->_button _currentScreenScale];
  double v25 = UIPointRoundToScale(v17, v19, v24);
  double v172 = v26;
  double v173 = v25;
  [(UIView *)self->_button _currentScreenScale];
  double v28 = UISizeRoundToScale(v21, v23, v27);
  double v174 = v29;
  double v31 = *MEMORY[0x1E4F1DB30];
  double v30 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  double v32 = [(UIButton *)self->_button _imageForState:v14 applyingConfiguration:1 usesImageForNormalState:0];
  double v33 = 0.0;
  double v34 = v30;
  double v35 = v31;
  double v164 = v28;
  if (v32)
  {
    -[UIButton _effectiveSizeForImage:](self->_button, "_effectiveSizeForImage:", v32, v31, 0.0);
    double v34 = v36;
    if (self->_imageView)
    {
      double v169 = v35;
      if ([v32 renderingMode] == 1)
      {
        double v33 = 0.0;
      }
      else
      {
        double v37 = a4;
        double v38 = [(UIImageView *)self->_imageView _currentImage];
        double v39 = [(UIImageView *)self->_imageView image];
        double v40 = [v32 _primitiveImageAsset];
        if (([v32 isEqual:v39] & 1) != 0
          || ([v32 isEqual:v38] & 1) != 0
          || v40
          && ([v39 _primitiveImageAsset],
              v168 = objc_claimAutoreleasedReturnValue(),
              v168,
              v40 == v168))
        {
          [(UIImageView *)self->_imageView _edgeInsetsForEffects];
          double v169 = v169 + v41 + v42;
          double v34 = v34 + v43 + v44;
        }
        [v32 baselineOffsetFromBottom];
        double v46 = v34 - v45;

        double v33 = v46;
        a4 = v37;
        double v28 = v164;
      }
      double v35 = v169;
    }
    else
    {
      double v33 = 0.0;
    }
  }
  double rect_8 = v33;
  unint64_t v47 = v15 & 0xFFFFFFFFFFFFFFFELL;
  double v170 = v35;
  if (v35 < v28) {
    double v28 = v35;
  }
  double v48 = v174;
  if (v34 < v174) {
    double v48 = v34;
  }
  double rect_24 = v48;
  [(UIButton *)self->_button titleEdgeInsets];
  double v50 = x + v49;
  double v52 = y + v51;
  double v54 = width - (v49 + v53);
  double v56 = height - (v51 + v55);
  [(UIView *)self->_button _currentScreenScale];
  double v165 = UIPointRoundToScale(v50, v52, v57);
  double v166 = v58;
  [(UIView *)self->_button _currentScreenScale];
  double v60 = UISizeRoundToScale(v54, v56, v59);
  double v167 = v61;
  double v175 = 0.0;
  double v62 = v28;
  double rect_16 = v60;
  if (v60 - v28 >= 0.0) {
    double v63 = v60 - v28;
  }
  else {
    double v63 = 0.0;
  }
  char v64 = [(UIButton *)self->_button _attributedTitleForState:v14];
  if (![v64 length])
  {
    double v74 = [(UIButton *)self->_button _titleForState:v14];
    double v75 = v74;
    if (v6 && ![v74 length])
    {
      uint64_t v98 = @"X";

      int v76 = 1;
      double v75 = v98;
    }
    else
    {
      int v76 = 0;
    }
    if (![v75 length]) {
      goto LABEL_87;
    }
    int v158 = v76;
    titleView = self->_titleView;
    v157 = a4;
    if (titleView)
    {
      $1CF1FC38577B636919C637EEED589224 buttonFlags = self->_button->_buttonFlags;
      v156 = a3;
      if ((*(_DWORD *)&buttonFlags & 0x800000) != 0)
      {
        double v79 = 0;
        double v80 = self->_titleView;
      }
      else
      {
        rect = [(UILabel *)titleView text];
        if ([rect isEqualToString:v75]) {
          double v79 = 0;
        }
        else {
          double v79 = v75;
        }
        double v80 = self->_titleView;
      }
      BOOL v91 = v47 != 4;
      BOOL v92 = v47 != 4 || v15 == 4;
      int v93 = v15 != 4 || v91;
      unint64_t v94 = [(UILabel *)v80 numberOfLines];
      if (v92) {
        double v95 = 0;
      }
      else {
        double v95 = &v175;
      }
      if (v93) {
        double v96 = 0;
      }
      else {
        double v96 = &v175;
      }
      double v31 = _UIComputedSizeForLabel(titleView, v79, 0, v94, 0, v95, v96, v63, 1.79769313e308);
      double v30 = v97;
      a3 = v156;
      a4 = v157;
      int v76 = v158;
      if ((*(_DWORD *)&buttonFlags & 0x800000) != 0) {
        goto LABEL_87;
      }
    }
    else
    {
      uint64_t v89 = objc_opt_new();
      [v89 setMaximumNumberOfLines:0];
      rect = v89;
      [v89 setWrapsForTruncationMode:1];
      if (v47 == 4) {
        uint64_t v90 = [v32 hasBaseline];
      }
      else {
        uint64_t v90 = 0;
      }
      int v76 = v158;
      [rect setWantsBaselineOffset:v90];
      if ((*((unsigned char *)&self->_button->_buttonFlags + 2) & 0x80) != 0)
      {
        v103 = 0;
      }
      else
      {
        v153 = +[UILabel _defaultAttributes];
        uint64_t v155 = *(void *)off_1E52D21B8;
        v99 = objc_msgSend(v153, "objectForKeyedSubscript:");
        v100 = (void *)[v99 mutableCopy];
        v101 = v100;
        if (v100) {
          id v102 = v100;
        }
        else {
          id v102 = (id)objc_opt_new();
        }
        v104 = v102;

        objc_msgSend(v104, "setLineBreakMode:", -[UIButton lineBreakMode](self->_button, "lineBreakMode"));
        id v105 = objc_alloc(MEMORY[0x1E4F28E48]);
        v176[0] = *(void *)off_1E52D2040;
        v154 = [(UIButton *)self->_button _font];
        v176[1] = v155;
        v177[0] = v154;
        v177[1] = v104;
        uint64_t v106 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v177 forKeys:v176 count:2];
        v103 = (void *)[v105 initWithString:v75 attributes:v106];

        int v76 = v158;
      }
      objc_msgSend(v103, "boundingRectWithSize:options:context:", 1, rect, v63, 1.79769313e308);
      double v31 = v107;
      double v30 = v108;
      if (v47 == 4)
      {
        if (v15 == 4) {
          [rect firstBaselineOffset];
        }
        else {
          [rect baselineOffset];
        }
        double v175 = v109;
      }

      a4 = v157;
    }

LABEL_87:
    if (v31 >= v63) {
      double v110 = v63;
    }
    else {
      double v110 = v31;
    }
    if (v76) {
      double v72 = 0.0;
    }
    else {
      double v72 = v110;
    }
LABEL_93:

    goto LABEL_94;
  }
  CGFloat v65 = self->_titleView;
  if (!v65)
  {
    double v75 = objc_opt_new();
    [v75 setMaximumNumberOfLines:0];
    [v75 setWrapsForTruncationMode:1];
    if (v47 == 4) {
      uint64_t v81 = [v32 hasBaseline];
    }
    else {
      uint64_t v81 = 0;
    }
    [v75 setWantsBaselineOffset:v81];
    double v82 = +[UILabel _defaultAttributes];
    double v83 = (void *)[v82 mutableCopy];

    double v84 = [(UIButton *)self->_button _font];
    [v83 setObject:v84 forKey:*(void *)off_1E52D2040];

    double v85 = -[NSAttributedString _ui_synthesizeAttributedSubstringFromRange:usingDefaultAttributes:](v64, 0, [v64 length], v83);
    objc_msgSend(v85, "boundingRectWithSize:options:context:", 65, v75, v63, 1.79769313e308);
    double v72 = v86;
    double v30 = v87;
    if (v47 == 4)
    {
      if (v15 == 4) {
        [v75 firstBaselineOffset];
      }
      else {
        [v75 baselineOffset];
      }
      double v175 = v88;
    }

    goto LABEL_93;
  }
  BOOL v66 = v47 != 4;
  BOOL v67 = v47 != 4 || v15 == 4;
  int v68 = v15 != 4 || v66;
  unint64_t v69 = [(UILabel *)self->_titleView numberOfLines];
  if (v67) {
    uint64_t v70 = 0;
  }
  else {
    uint64_t v70 = &v175;
  }
  if (v68) {
    double v71 = 0;
  }
  else {
    double v71 = &v175;
  }
  double v72 = _UIComputedSizeForLabel(v65, 0, v64, v69, 0, v70, v71, v63, 1.79769313e308);
  double v30 = v73;
LABEL_94:
  v111 = (double *)MEMORY[0x1E4F1DB28];
  double v112 = v170;
  double v171 = v34;
  -[UIButton _roundSize:](self->_button, "_roundSize:", v112, v34);
  -[UIButton _roundSize:](self->_button, "_roundSize:", v72, v30);
  double v114 = v113;
  double v116 = v115;
  uint64_t v117 = MEMORY[0x1E4F1DAD8];
  double v118 = *MEMORY[0x1E4F1DAD8];
  UIControlContentHorizontalAlignment v119 = [(UIControl *)self->_button effectiveContentHorizontalAlignment];
  CGFloat recta = v118;
  if (v119 != UIControlContentHorizontalAlignmentLeft)
  {
    CGFloat v120 = v62;
    if (v119 == UIControlContentHorizontalAlignmentRight)
    {
      double v127 = v173;
      double v128 = v173 + v164;
      double v123 = v166;
      if ((*((_DWORD *)&self->_button->super.super._viewFlags + 4) & 0x80000) != 0)
      {
        double v124 = v165 + rect_16 - v114 - v62;
      }
      else
      {
        double v128 = v128 - v114;
        double v124 = v165 + rect_16 - v114;
      }
      double v133 = v128 - v62;
      if (v133 >= v173) {
        double v127 = v133;
      }
      double v173 = v127;
    }
    else
    {
      if (v119 == UIControlContentHorizontalAlignmentFill)
      {
        double v121 = v62 + v114;
        if (v62 + v114 == 0.0) {
          double v121 = 1.0;
        }
        double v122 = v62 * (v164 / v121);
        double v114 = v114 * (rect_16 / v121);
        double v123 = v166;
        double v124 = *v111 + v165 + rect_16 - v114;
        goto LABEL_117;
      }
      button = self->_button;
      if ((*((_DWORD *)&button->super.super._viewFlags + 4) & 0x80000) != 0)
      {
        UIFloorToViewScale(button);
        double v131 = fmax(v134, v118);
        UIRoundToViewScale(self->_button);
        double v124 = v165 + v135 - v62;
      }
      else
      {
        UIFloorToViewScale(button);
        double v131 = fmax(v130, v118);
        UIRoundToViewScale(self->_button);
        double v124 = v62 + v165 + v132;
      }
      double v123 = v166;
      double v173 = v173 + v131;
    }
    double v122 = v62;
    goto LABEL_117;
  }
  double v123 = v166;
  double v125 = -0.0;
  CGFloat v120 = v62;
  if ((*((_DWORD *)&self->_button->super.super._viewFlags + 4) & 0x80000) != 0) {
    double v126 = -0.0;
  }
  else {
    double v126 = v62;
  }
  double v124 = v165 + v126;
  if ((*((_DWORD *)&self->_button->super.super._viewFlags + 4) & 0x80000) != 0) {
    double v125 = v114;
  }
  double v173 = v173 + v125;
  double v122 = v62;
LABEL_117:
  double v136 = v111[1];
  double v137 = *(double *)(v117 + 8);
  switch(v15)
  {
    case 1:
      double v167 = v116;
      double v174 = rect_24;
      break;
    case 2:
      double v143 = v172;
      if (v172 + v174 - rect_24 >= v172) {
        double v143 = v172 + v174 - rect_24;
      }
      double v172 = v143;
      double v123 = v123 + v167 - v116;
      double v167 = v116;
      double v174 = rect_24;
      break;
    case 3:
      break;
    case 4:
    case 5:
      if ([v32 hasBaseline] && v116 > 0.0)
      {
        v178.size.double width = v120;
        double v138 = rect_24;
        v178.origin.double x = recta;
        v178.origin.double y = v137;
        v178.size.double height = rect_24;
        CGRect v179 = CGRectOffset(v178, 0.0, v175 - rect_8 * rect_24 / v171);
        if (v179.origin.y >= v137) {
          double v139 = v137;
        }
        else {
          double v139 = v179.origin.y;
        }
        double v140 = fmin(v139, 0.0);
        double v172 = v172 + v179.origin.y - v140;
        double v123 = v136 + v123 - v140;
        goto LABEL_125;
      }
      UIFloorToViewScale(self->_button);
      double v172 = v172 + fmax(v144, v137);
      UIRoundToViewScale(self->_button);
      double v123 = v123 + v145;
      double v167 = v116;
      double v174 = rect_24;
      break;
    default:
      double v138 = rect_24;
      UIFloorToViewScale(self->_button);
      double v172 = v136 + v172 + fmax(v141, v137);
      UIRoundToViewScale(self->_button);
      double v123 = v136 + v123 + v142;
LABEL_125:
      double v167 = v116;
      double v174 = v138;
      break;
  }
  [(UIView *)self->_button _currentScreenScale];
  double v147 = UIPointRoundToScale(v173, v172, v146);
  CGFloat v149 = v148;
  [(UIView *)self->_button _currentScreenScale];
  double v151 = UIPointRoundToScale(v124, v123, v150);
  if (a4)
  {
    a4->origin.double x = v147;
    a4->origin.double y = v149;
    a4->size.double width = v122;
    a4->size.double height = v174;
  }
  if (a3)
  {
    a3->origin.double x = v151;
    a3->origin.double y = v152;
    a3->size.double width = v114;
    a3->size.double height = v167;
  }
}

- (BOOL)deferToLazyTitleFont
{
  return self->_titleView == 0;
}

- (void)_setContentConstraints:(id)a3
{
}

- (id)font
{
  return [(UILabel *)self->_titleView font];
}

- (BOOL)fontIsDefaultForIdiom
{
  return [(UILabel *)self->_titleView _fontIsDefaultForIdiom];
}

- (int64_t)lineBreakMode
{
  titleView = self->_titleView;
  if (titleView) {
    return [(UILabel *)titleView lineBreakMode];
  }
  else {
    return 5;
  }
}

- (void)traitCollectionDidChange:(id)a3
{
  id v7 = a3;
  if (!self->_imageView && [(UIButton *)self->_button _hasImageForProperty:@"image"]) {
    *(void *)&self->_button->_buttonFlags |= 0x1000000uLL;
  }
  if (!self->_backgroundView
    && [(UIButton *)self->_button _hasImageForProperty:@"background"])
  {
    *(void *)&self->_button->_buttonFlags |= 0x2000000uLL;
  }
  id v4 = [(UIView *)self->_button _focusSystem];

  if (v4)
  {
    id v5 = [(UIView *)self->_button traitCollection];
    uint64_t v6 = [v5 userInterfaceIdiom];

    if (v6 == 2 || v6 == 8)
    {
      [(UIButtonLegacyVisualProvider *)self _updateTitleView];
    }
    else if (v6 == 3)
    {
      [(UIButton *)self->_button setNeedsLayout];
    }
  }
}

- (void)setImageContentMode:(int64_t)a3
{
}

- (CGRect)titleRectForContentRect:(CGRect)a3
{
  -[UIButtonLegacyVisualProvider _titleRectForContentRect:calculatePositionForEmptyTitle:](self, "_titleRectForContentRect:calculatePositionForEmptyTitle:", 0, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  result.size.double height = v6;
  result.size.double width = v5;
  result.origin.double y = v4;
  result.origin.double x = v3;
  return result;
}

- (CGRect)_titleRectForContentRect:(CGRect)a3 calculatePositionForEmptyTitle:(BOOL)a4
{
  BOOL v4 = a4;
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  UIControlState v10 = [(UIControl *)self->_button state];
  if (!v4)
  {
    UIControlState v11 = v10;
    float v12 = [(UIButton *)self->_button _titleForState:v10];
    id v13 = v12;
    if (!v12 || ![v12 length])
    {
      UIControlState v14 = [(UIButton *)self->_button _attributedTitleForState:v11];
      int64_t v15 = v14;
      if (!v14 || ![v14 length])
      {
        long long v21 = *(_OWORD *)(MEMORY[0x1E4F1DB28] + 16);
        long long v22 = *MEMORY[0x1E4F1DB28];
        long long v23 = v21;

        goto LABEL_9;
      }
    }
  }
  long long v16 = *(_OWORD *)(MEMORY[0x1E4F1DB28] + 16);
  long long v22 = *MEMORY[0x1E4F1DB28];
  long long v23 = v16;
  -[UIButtonLegacyVisualProvider _deriveTitleRect:imageRect:fromContentRect:calculatePositionForEmptyTitle:](self, "_deriveTitleRect:imageRect:fromContentRect:calculatePositionForEmptyTitle:", &v22, 0, v4, x, y, width, height);
LABEL_9:
  double v18 = *((double *)&v22 + 1);
  double v17 = *(double *)&v22;
  double v20 = *((double *)&v23 + 1);
  double v19 = *(double *)&v23;
  result.size.double height = v20;
  result.size.double width = v19;
  result.origin.double y = v18;
  result.origin.double x = v17;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentConstraints, 0);
  objc_destroyWeak((id *)&self->_effectiveContentView);
  objc_storeStrong((id *)&self->_maskAnimationView, 0);
  objc_storeStrong((id *)&self->_highlightLayer, 0);
  objc_storeStrong((id *)&self->_selectionView, 0);
  objc_storeStrong((id *)&self->_titleView, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_storeStrong((id *)&self->_contentBackdropView, 0);
  objc_storeStrong((id *)&self->_floatingContentView, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);
}

- (void)dealloc
{
  [(_UIButtonMaskAnimationView *)self->_maskAnimationView setDelegate:0];
  v3.receiver = self;
  v3.super_class = (Class)UIButtonLegacyVisualProvider;
  [(UIButtonLegacyVisualProvider *)&v3 dealloc];
}

- (id)_newLabelWithFrame:(CGRect)a3
{
  id v4 = -[UIButtonLabel _initWithFrame:button:]([UIButtonLabel alloc], "_initWithFrame:button:", self->_button, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  [v4 setBackgroundColor:0];
  [v4 setBaselineAdjustment:1];
  [v4 setEnabled:1];
  [v4 setOpaque:0];
  objc_msgSend(v4, "setShadowOffset:", *MEMORY[0x1E4F1DB30], *(double *)(MEMORY[0x1E4F1DB30] + 8));
  -[UILabel _setSupportMultiLineShrinkToFit:]((uint64_t)v4, 1);
  [v4 setContentMode:0];
  BOOL v5 = 0;
  if ([(UIButton *)self->_button _wantsAccessibilityUnderline])
  {
    double v6 = [(UIButton *)self->_button backgroundImageForState:0];
    BOOL v5 = v6 == 0;
  }
  [v4 _setWantsUnderlineForAccessibilityButtonShapesEnabled:v5];
  return v4;
}

- (double)_intrinsicWidthForAttributedTitle:(id)a3
{
  [(UIButtonLegacyVisualProvider *)self _intrinsicSizeForTitle:0 attributedTitle:a3 image:0 backgroundImage:0 titlePaddingInsets:0];
  return result;
}

- (void)willMoveToWindow:(id)a3
{
  if (!a3)
  {
    -[_UIButtonMaskAnimationView setDelegate:](self->_maskAnimationView, "setDelegate:");
    [(UIView *)self->_maskAnimationView removeFromSuperview];
    maskAnimationView = self->_maskAnimationView;
    self->_maskAnimationView = 0;
  }
}

- (void)setContentHorizontalAlignment:(int64_t)a3
{
  [(UILabel *)self->_titleView setTextAlignment:+[UIButtonLegacyVisualProvider _NSTextAlignmentForUIControlContentHorizontalAlignment:[(UIControl *)self->_button effectiveContentHorizontalAlignment]]];
  [(UIButtonLegacyVisualProvider *)self _invalidateContentConstraints];
  button = self->_button;
  [(UIButton *)button setNeedsLayout];
}

- (void)_invalidateContentConstraints
{
  if (self->_contentConstraints) {
    -[UIView removeConstraints:](self->_button, "removeConstraints:");
  }
  [(UIButtonLegacyVisualProvider *)self _setContentConstraints:0];
}

+ (int64_t)_NSTextAlignmentForUIControlContentHorizontalAlignment:(int64_t)a3
{
  return 2 * (a3 == 2);
}

+ (BOOL)shouldUpdateContextMenuEnabledOnMenuChanges
{
  return 1;
}

uint64_t __52__UIButtonLegacyVisualProvider__beginTitleAnimation__block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) _setTitleFrozen:0];
  [*(id *)(*(void *)(a1 + 40) + 48) frame];
  CGFloat v3 = v2;
  CGFloat v5 = v4;
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  [*(id *)(a1 + 32) setNeedsLayout];
  [*(id *)(a1 + 32) layoutIfNeeded];
  [*(id *)(*(void *)(a1 + 40) + 48) frame];
  v17.origin.double x = v10;
  v17.origin.double y = v11;
  v17.size.double width = v12;
  v17.size.double height = v13;
  v16.origin.double x = v3;
  v16.origin.double y = v5;
  v16.size.double width = v7;
  v16.size.double height = v9;
  if (!CGRectEqualToRect(v16, v17)) {
    [*(id *)(a1 + 32) _sendSetNeedsLayoutToSuperviewOnTitleAnimationCompletionIfNecessary];
  }
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __52__UIButtonLegacyVisualProvider__beginTitleAnimation__block_invoke_3;
  v15[3] = &unk_1E52D9F70;
  v15[4] = *(void *)(a1 + 40);
  return +[UIView animateWithDuration:327684 delay:v15 options:0 animations:0.3 completion:0.0];
}

- (void)setReversesTitleShadowWhenHighlighted:(BOOL)a3
{
  titleView = self->_titleView;
  if (a3) {
    *(void *)&a3 = [(UIControl *)self->_button isHighlighted];
  }
  [(UILabel *)titleView setReverseShadow:a3];
}

- (void)populateArchivedSubviews:(id)a3
{
  v8[7] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  void v8[5] = -[UIView viewWithTag:](self->_button, "viewWithTag:", 1886548836, self->_titleView, self->_imageView, self->_backgroundView, self->_maskAnimationView, self->_selectionView);
  CGFloat v5 = self->_contentBackdropView;
  uint64_t v6 = 0;
  v8[6] = v5;
  do
  {
    if (v8[v6]) {
      objc_msgSend(v4, "removeObject:");
    }
    ++v6;
  }
  while (v6 != 7);
  for (uint64_t i = 6; i != -1; --i)
}

- (id)encodableSubviews
{
  double v2 = [(UIButtonLegacyVisualProvider *)self effectiveContentView];
  CGFloat v3 = [v2 subviews];

  return v3;
}

- (void)setLineBreakMode:(int64_t)a3
{
  titleView = self->_titleView;
  if (a3 != 5 && !titleView)
  {
    [(UIButtonLegacyVisualProvider *)self _setupTitleView];
    titleView = self->_titleView;
  }
  uint64_t v6 = [(UILabel *)titleView lineBreakMode];
  CGFloat v7 = self->_titleView;
  [(UILabel *)v7 setLineBreakMode:a3];
  if (v7) {
    BOOL v8 = v6 == a3;
  }
  else {
    BOOL v8 = 1;
  }
  if (!v8)
  {
    button = self->_button;
    [(UIView *)button invalidateIntrinsicContentSize];
  }
}

- (CGSize)titleShadowOffset
{
  titleView = self->_titleView;
  if (titleView)
  {
    [(UILabel *)titleView shadowOffset];
  }
  else
  {
    double v3 = *MEMORY[0x1E4F1DB30];
    double v4 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  }
  result.double height = v4;
  result.double width = v3;
  return result;
}

- (void)setTitleShadowOffset:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  titleView = self->_titleView;
  if (!titleView)
  {
    if (a3.width == *MEMORY[0x1E4F1DB30] && a3.height == *(double *)(MEMORY[0x1E4F1DB30] + 8))
    {
      titleView = 0;
    }
    else
    {
      [(UIButtonLegacyVisualProvider *)self _setupTitleView];
      titleView = self->_titleView;
    }
  }
  [(UILabel *)titleView shadowOffset];
  CGFloat v10 = self->_titleView;
  if (v10)
  {
    double v11 = v8;
    double v12 = v9;
    -[UILabel setShadowOffset:](v10, "setShadowOffset:", width, height);
    if (width != v11 || height != v12)
    {
      button = self->_button;
      [(UIView *)button invalidateIntrinsicContentSize];
    }
  }
  else
  {
    objc_msgSend(0, "setShadowOffset:", width, height);
  }
}

- (CGRect)highlightBounds
{
  [(UIView *)self->_button bounds];
  double x = v3;
  double y = v5;
  double width = v7;
  double height = v9;
  if (![(UIButton *)self->_button _isCarPlaySystemTypeButton])
  {
    -[UIButton titleRectForContentRect:](self->_button, "titleRectForContentRect:", x, y, width, height);
    double v12 = v11;
    double v14 = v13;
    double v16 = v15;
    double v18 = v17;
    -[UIButton imageRectForContentRect:](self->_button, "imageRectForContentRect:", x, y, width, height);
    double v37 = v20;
    double v38 = v19;
    double v35 = v22;
    double v36 = v21;
    double x = *MEMORY[0x1E4F1DB20];
    double y = *(double *)(MEMORY[0x1E4F1DB20] + 8);
    double width = *(double *)(MEMORY[0x1E4F1DB20] + 16);
    double height = *(double *)(MEMORY[0x1E4F1DB20] + 24);
    v39.origin.double x = v12;
    v39.origin.double y = v14;
    v39.size.double width = v16;
    v39.size.double height = v18;
    if (!CGRectIsEmpty(v39))
    {
      -[UIButtonLegacyVisualProvider _highlightRectForTextRect:](self, "_highlightRectForTextRect:", v12, v14, v16, v18);
      v47.origin.double x = v23;
      v47.origin.double y = v24;
      v47.size.double width = v25;
      v47.size.double height = v26;
      v40.origin.double x = x;
      v40.origin.double y = y;
      v40.size.double width = width;
      v40.size.double height = height;
      CGRect v41 = CGRectUnion(v40, v47);
      double x = v41.origin.x;
      double y = v41.origin.y;
      double width = v41.size.width;
      double height = v41.size.height;
    }
    v42.origin.double x = v38;
    v42.origin.double y = v37;
    v42.size.double width = v36;
    v42.size.double height = v35;
    if (!CGRectIsEmpty(v42))
    {
      -[UIButtonLegacyVisualProvider _highlightRectForImageRect:](self, "_highlightRectForImageRect:", v38, v37, v36, v35);
      v48.origin.double x = v27;
      v48.origin.double y = v28;
      v48.size.double width = v29;
      v48.size.double height = v30;
      v43.origin.double x = x;
      v43.origin.double y = y;
      v43.size.double width = width;
      v43.size.double height = height;
      CGRect v44 = CGRectUnion(v43, v48);
      double x = v44.origin.x;
      double y = v44.origin.y;
      double width = v44.size.width;
      double height = v44.size.height;
    }
    v45.origin.double x = x;
    v45.origin.double y = y;
    v45.size.double width = width;
    v45.size.double height = height;
    if (CGRectIsEmpty(v45))
    {
      double x = *MEMORY[0x1E4F1DB28];
      double y = *(double *)(MEMORY[0x1E4F1DB28] + 8);
      double width = *(double *)(MEMORY[0x1E4F1DB28] + 16);
      double height = *(double *)(MEMORY[0x1E4F1DB28] + 24);
    }
  }
  double v31 = x;
  double v32 = y;
  double v33 = width;
  double v34 = height;
  result.size.double height = v34;
  result.size.double width = v33;
  result.origin.double y = v32;
  result.origin.double x = v31;
  return result;
}

- (void)setHighlighted:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a3;
  button = self->_button;
  $1CF1FC38577B636919C637EEED589224 buttonFlags = button->_buttonFlags;
  if ((*(unsigned char *)&buttonFlags & 0x20) != 0)
  {
    double v8 = -[UIView viewWithTag:](button, "viewWithTag:", 1886548836, a4);
    double v9 = v8;
    if (v4)
    {
      [v8 setAlpha:1.0];
    }
    else
    {
      v10[0] = MEMORY[0x1E4F143A8];
      v10[1] = 3221225472;
      v10[2] = __56__UIButtonLegacyVisualProvider_setHighlighted_animated___block_invoke;
      v10[3] = &unk_1E52D9F70;
      id v11 = v8;
      +[UIView animateWithDuration:v10 animations:0 completion:0.25];
    }
    $1CF1FC38577B636919C637EEED589224 buttonFlags = self->_button->_buttonFlags;
  }
  -[UILabel setReverseShadow:](self->_titleView, "setReverseShadow:", *(_DWORD *)&buttonFlags & v4, a4);
  [(UIButton *)self->_button setNeedsLayout];
}

uint64_t __56__UIButtonLegacyVisualProvider_setHighlighted_animated___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:0.0];
}

- (BOOL)isOn
{
  return 0;
}

- (void)setShowsTouchWhenHighlighted:(BOOL)a3
{
  BOOL v4 = [(UIView *)self->_button viewWithTag:1886548836];
  $1CF1FC38577B636919C637EEED589224 buttonFlags = self->_button->_buttonFlags;
  if (v4)
  {
    if ((*(unsigned char *)&buttonFlags & 0x20) != 0) {
      goto LABEL_13;
    }
    double v13 = v4;
    [(UIView *)v4 removeFromSuperview];
  }
  else
  {
    if ((*(unsigned char *)&buttonFlags & 0x20) == 0)
    {
      BOOL v4 = 0;
      goto LABEL_13;
    }
    uint64_t v6 = [UIImageView alloc];
    double v7 = _UIImageWithName(@"UIButtonBarPressedIndicator.png");
    double v13 = [(UIImageView *)v6 initWithImage:v7];

    [(UIView *)v13 setUserInteractionEnabled:0];
    [(UIView *)v13 setOpaque:0];
    [(UIView *)v13 setTag:1886548836];
    BOOL v8 = [(UIControl *)self->_button isHighlighted];
    double v9 = 0.0;
    if (v8) {
      double v9 = 1.0;
    }
    [(UIView *)v13 setAlpha:v9];
    [(UIButton *)self->_button pressFeedbackPosition];
    -[UIImageView setCenter:](v13, "setCenter:");
    imageView = self->_imageView;
    id v11 = [(UIButtonLegacyVisualProvider *)self effectiveContentView];
    double v12 = v11;
    if (imageView) {
      [v11 insertSubview:v13 belowSubview:self->_imageView];
    }
    else {
      [v11 addSubview:v13];
    }

    [(UIButton *)self->_button setNeedsLayout];
  }
  BOOL v4 = v13;
LABEL_13:
}

- (id)contextMenuInteraction:(id)a3 configurationForMenuAtLocation:(CGPoint)a4
{
  double v5 = self->_button;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __86__UIButtonLegacyVisualProvider_contextMenuInteraction_configurationForMenuAtLocation___block_invoke;
  v9[3] = &unk_1E52DAFE8;
  CGFloat v10 = v5;
  id v11 = self;
  uint64_t v6 = v5;
  double v7 = +[UIContextMenuConfiguration configurationWithIdentifier:0 previewProvider:0 actionProvider:v9];

  return v7;
}

id __86__UIButtonLegacyVisualProvider_contextMenuInteraction_configurationForMenuAtLocation___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  BOOL v4 = [*(id *)(a1 + 32) menu];
  double v5 = [*(id *)(a1 + 32) _menuProvider];

  if (v5)
  {
    uint64_t v6 = [*(id *)(a1 + 32) _menuProvider];
    uint64_t v7 = ((void (**)(void, void, id))v6)[2](v6, *(void *)(a1 + 40), v3);

    BOOL v4 = (void *)v7;
    if (!v7)
    {
      if ([*(id *)(a1 + 32) showsMenuAsPrimaryAction])
      {
        if (os_variant_has_internal_diagnostics())
        {
          double v15 = __UIFaultDebugAssertLog();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
          {
            uint64_t v16 = *(void *)(a1 + 32);
            *(_DWORD *)buf = 138412290;
            uint64_t v24 = v16;
            _os_log_fault_impl(&dword_1853B0000, v15, OS_LOG_TYPE_FAULT, "Client configured a button (%@) with a menuProvider and contextMenuIsPrimary=YES, but failed to return a menu, Substituting a dummy menu.", buf, 0xCu);
          }
        }
        else
        {
          double v9 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &_UIInternalPreference_LabelDisableDefaultClipping_block_invoke___s_category)+ 8);
          if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
          {
            uint64_t v10 = *(void *)(a1 + 32);
            *(_DWORD *)buf = 138412290;
            uint64_t v24 = v10;
            _os_log_impl(&dword_1853B0000, v9, OS_LOG_TYPE_ERROR, "Client configured a button (%@) with a menuProvider and contextMenuIsPrimary=YES, but failed to return a menu, Substituting a dummy menu.", buf, 0xCu);
          }
        }
        id v11 = [*(id *)(a1 + 32) titleForState:0];
        double v12 = [*(id *)(a1 + 32) imageForState:0];
        uint64_t v17 = MEMORY[0x1E4F143A8];
        uint64_t v18 = 3221225472;
        double v19 = __86__UIButtonLegacyVisualProvider_contextMenuInteraction_configurationForMenuAtLocation___block_invoke_19;
        double v20 = &unk_1E52DB038;
        id v21 = *(id *)(a1 + 32);
        double v13 = +[UIAction actionWithTitle:v11 image:v12 identifier:0 handler:&v17];

        double v22 = v13;
        double v14 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", &v22, 1, v17, v18, v19, v20);
        BOOL v4 = +[UIMenu menuWithChildren:v14];
      }
      else
      {
        BOOL v4 = 0;
      }
    }
  }

  return v4;
}

uint64_t __86__UIButtonLegacyVisualProvider_contextMenuInteraction_configurationForMenuAtLocation___block_invoke_19(uint64_t a1)
{
  return [*(id *)(a1 + 32) sendActionsForControlEvents:64];
}

- (CGPoint)menuAttachmentPointForConfiguration:(id)a3
{
  button = self->_button;
  imageView = self->_imageView;
  titleView = self->_titleView;
  id v6 = a3;
  uint64_t v7 = _UIControlMenuSupportTargetedPreviewOverViews(button, titleView, imageView);
  BOOL v8 = [v7 target];
  double v9 = [v8 container];

  uint64_t v10 = [v7 view];
  [v10 bounds];
  double v12 = v11;
  double v14 = v13;
  double v15 = [v7 target];
  [v15 center];
  double v17 = round(v16 - v14 * 0.5);
  double v19 = round(v18 - v12 * 0.5);
  double v20 = [v9 _window];
  objc_msgSend(v9, "convertRect:toView:", v20, v19, v17, v12, v14);
  double v22 = v21;
  double v24 = v23;
  CGFloat v26 = v25;
  CGFloat v28 = v27;

  LODWORD(v10) = [v6 prefersHorizontalAttachment];
  CGFloat v29 = [v9 _window];
  CGFloat v30 = v29;
  if (v10) {
    double v31 = _UIControlMenuAttachmentPointForRectInContainerForHorizontalAttachment(v29, v22, v24, v26, v28);
  }
  else {
    double v31 = _UIControlMenuAttachmentPointForRectInContainer(v29, v22, v24, v26, v28);
  }
  double v33 = v31;
  double v34 = v32;

  double v35 = v33;
  double v36 = v34;
  result.double y = v36;
  result.double x = v35;
  return result;
}

- (void)contextMenuInteraction:(id)a3 updateStyleForMenuWithConfiguration:(id)a4 style:(id)a5
{
  id v7 = a5;
  if (v7)
  {
    id v18 = v7;
    button = self->_button;
    imageView = self->_imageView;
    titleView = self->_titleView;
    id v11 = a4;
    double v12 = _UIControlMenuSupportTargetedPreviewOverViews(button, titleView, imageView);
    [(UIButton *)self->_button menuAttachmentPointForConfiguration:v11];
    double v14 = v13;
    double v16 = v15;
    LODWORD(button) = [v11 prefersHorizontalAttachment];

    double v17 = [(UIButtonLegacyVisualProvider *)self button];
    if (button) {
      _UIControlMenuSupportUpdateStyleWithHorizontalPreference(v18, v17, v12, v14, v16);
    }
    else {
      _UIControlMenuSupportUpdateStyle(v18, v17, v12, v14, v16);
    }

    id v7 = v18;
  }
}

- (id)contextMenuInteraction:(id)a3 previewForHighlightingMenuWithConfiguration:(id)a4
{
  return _UIControlMenuSupportTargetedPreviewOverViews(self->_button, self->_titleView, self->_imageView);
}

- (id)contextMenuInteraction:(id)a3 previewForDismissingMenuWithConfiguration:(id)a4
{
  return _UIControlMenuSupportTargetedPreviewOverViews(self->_button, self->_titleView, self->_imageView);
}

- (id)pointerEffectPreviewParameters
{
  id v3 = objc_opt_new();
  if ([(UIButton *)self->_button buttonType] == UIButtonTypeClose)
  {
    [(UIView *)self->_button bounds];
    uint64_t v4 = +[UIBezierPath bezierPathWithOvalInRect:](UIBezierPath, "bezierPathWithOvalInRect:");
  }
  else
  {
    if (![(UIControl *)self->_button isSelected]) {
      goto LABEL_6;
    }
    double v5 = [(UIView *)self->_button layer];
    [v5 cornerRadius];

    [(UIButton *)self->_button _selectedIndicatorBounds];
    uint64_t v4 = +[UIBezierPath bezierPathWithRoundedRect:cornerRadius:](UIBezierPath, "bezierPathWithRoundedRect:cornerRadius:");
  }
  id v6 = (void *)v4;
  [v3 setShadowPath:v4];

LABEL_6:
  return v3;
}

- (id)pointerEffectWithPreview:(id)a3
{
  id v4 = a3;
  UIButtonType v5 = [(UIButton *)self->_button buttonType];
  uint64_t v6 = objc_opt_class();
  if (v5 == UIButtonTypeClose
    || ((id v7 = (void *)v6, [(UIButton *)self->_button _isiOSSystemProvidedButton])
     || v5 == UIButtonTypeCustom)
    && ([(UIButton *)self->_button _hasVisibleDefaultSelectionIndicator]
     || _buttonBackgroundColorIndicatesLiftEffect(self->_button)))
  {
    id v7 = objc_opt_class();
  }
  BOOL v8 = [v7 effectWithPreview:v4];

  return v8;
}

- (CGRect)_visualBoundsWithCornerRadius:(double *)a3 hasProposal:(BOOL)a4 shouldUseProposal:(BOOL *)a5
{
  BOOL v6 = a4;
  double v111 = -1.0;
  if (a5) {
    *a5 = 0;
  }
  uint64_t v10 = +[_UIPointerSettingsDomain rootSettings];
  id v11 = [v10 buttonSettings];

  UIButtonType v12 = [(UIButton *)self->_button buttonType];
  if (v12 <= 117)
  {
    if ((unint64_t)(v12 - 2) >= 4)
    {
      if ((unint64_t)v12 < UIButtonTypeDetailDisclosure) {
        goto LABEL_15;
      }
      if (v12 != UIButtonTypeClose)
      {
LABEL_25:
        [(UIView *)self->_button bounds];
        goto LABEL_10;
      }
      button = self->_button;
      [v11 closeButtonOutset];
      double v15 = v38;
      [v11 closeButtonMinSize];
LABEL_9:
      __roundCursorForBounds(button, &v111, v15, v16);
LABEL_10:
      double v21 = v17;
      double v22 = v18;
      double v23 = v19;
      double v24 = v20;
      goto LABEL_11;
    }
LABEL_8:
    button = self->_button;
    [v11 roundButtonOutset];
    double v15 = v14;
    [v11 roundButtonMinSize];
    goto LABEL_9;
  }
  if ((unint64_t)(v12 - 118) < 6) {
    goto LABEL_8;
  }
  if ((unint64_t)(v12 - 124) >= 2) {
    goto LABEL_25;
  }
LABEL_15:
  if ([(UIButton *)self->_button _hasVisibleDefaultSelectionIndicator])
  {
    CGFloat v29 = self->_button;
    [(UIButton *)v29 _selectedIndicatorBounds];
    double v21 = v30;
    double v22 = v31;
    double v23 = v32;
    double v24 = v33;
    double v34 = [(UIView *)v29 layer];

    [v34 cornerRadius];
    double v36 = v35;

    double v111 = fmax(v36, 4.0);
    goto LABEL_11;
  }
  if (v6)
  {
    if (!a5)
    {
      uint64_t v106 = [MEMORY[0x1E4F28B00] currentHandler];
      [v106 handleFailureInMethod:a2, self, @"UIButtonLegacyVisualProvider.m", 791, @"When hasProposal is YES, shouldUseProposal has to be defined." object file lineNumber description];
    }
    *a5 = 1;
    double v37 = self->_button;
    goto LABEL_24;
  }
  CGRect v39 = [(UIView *)self->_button backgroundColor];
  [v39 alphaComponent];
  double v41 = v40;

  double v37 = self->_button;
  if (v41 > 0.0)
  {
LABEL_24:
    double v17 = __boundingPointerShapeInContainer(v37, &v111);
    goto LABEL_10;
  }
  CGRect v42 = v37;
  id v43 = v11;
  [(UIView *)v42 bounds];
  -[UIButton contentRectForBounds:](v42, "contentRectForBounds:");
  double v45 = v44;
  double v47 = v46;
  double v49 = v48;
  double v51 = v50;
  -[UIButton titleRectForContentRect:](v42, "titleRectForContentRect:");
  CGFloat x = v112.origin.x;
  CGFloat y = v112.origin.y;
  CGFloat width = v112.size.width;
  CGFloat height = v112.size.height;
  IsEmptCGFloat y = CGRectIsEmpty(v112);
  -[UIButton imageRectForContentRect:](v42, "imageRectForContentRect:", v45, v47, v49, v51);
  CGFloat v57 = v113.origin.x;
  CGFloat v58 = v113.origin.y;
  CGFloat v59 = v113.size.width;
  CGFloat v60 = v113.size.height;
  BOOL v61 = CGRectIsEmpty(v113);
  uint64_t v62 = [(UIView *)v42 effectiveUserInterfaceLayoutDirection];
  if (!v61 && !IsEmpty)
  {
    BOOL v63 = v62 == 1;
    v114.origin.CGFloat x = x;
    v114.origin.CGFloat y = y;
    v114.size.CGFloat width = width;
    v114.size.CGFloat height = height;
    v117.origin.CGFloat x = v57;
    v117.origin.CGFloat y = v58;
    v117.size.CGFloat width = v59;
    v117.size.CGFloat height = v60;
    CGRect v115 = CGRectUnion(v114, v117);
    CGFloat v108 = v115.origin.x;
    CGFloat v64 = v115.origin.y;
    CGFloat v65 = v115.size.width;
    CGFloat v66 = v115.size.height;
    [v43 mixedButtonOutsetLeading];
    double v68 = v67;
    [v43 mixedButtonOutsetTrailing];
    double v70 = v69;
    [v43 mixedButtonOutsetTop];
    double v72 = v71;
    [v43 mixedButtonOutsetBottom];
    double v74 = v73;
    [v43 mixedButtonMinWidth];
    double v76 = v75;
    [v43 mixedButtonMinHeight];
    double v107 = v76;
    double v77 = v108;
    double v78 = v64;
    double v79 = v65;
    double v80 = v66;
    double v81 = v68;
LABEL_29:
    double v82 = v70;
    int v83 = v63;
    double v84 = v72;
    double v85 = v74;
LABEL_34:
    double v86 = __outsetRectWithMinimumSize(v83, 0, v77, v78, v79, v80, v81, v82, v84, v85, v107);
    goto LABEL_35;
  }
  if (!v61)
  {
    BOOL v90 = v62 == 1;
    [v43 imageButtonOutsetLeading];
    double v109 = v91;
    [v43 imageButtonOutsetTrailing];
    double v93 = v92;
    [v43 imageButtonOutsetTop];
    double v95 = v94;
    [v43 imageButtonOutsetBottom];
    double v97 = v96;
    [v43 imageButtonMinWidth];
    double v99 = v98;
    [v43 imageButtonMinHeight];
    double v107 = v99;
    double v77 = v57;
    double v78 = v58;
    double v79 = v59;
    double v80 = v60;
    double v81 = v109;
    double v82 = v93;
    int v83 = v90;
    double v84 = v95;
    double v85 = v97;
    goto LABEL_34;
  }
  if (!IsEmpty)
  {
    BOOL v63 = v62 == 1;
    [v43 textButtonOutsetLeading];
    double v110 = v100;
    [v43 textButtonOutsetTrailing];
    double v70 = v101;
    [v43 textButtonOutsetTop];
    double v72 = v102;
    [v43 textButtonOutsetBottom];
    double v74 = v103;
    [v43 textButtonMinWidth];
    double v105 = v104;
    [v43 textButtonMinHeight];
    double v107 = v105;
    double v77 = x;
    double v78 = y;
    double v79 = width;
    double v80 = height;
    double v81 = v110;
    goto LABEL_29;
  }
  double v86 = __boundingPointerShapeInContainer(v42, &v111);
LABEL_35:
  double v21 = v86;
  double v22 = v87;
  double v23 = v88;
  double v24 = v89;

LABEL_11:
  if (a3) {
    *a3 = v111;
  }

  double v25 = v21;
  double v26 = v22;
  double v27 = v23;
  double v28 = v24;
  result.size.CGFloat height = v28;
  result.size.CGFloat width = v27;
  result.origin.CGFloat y = v26;
  result.origin.CGFloat x = v25;
  return result;
}

- (CGRect)visualBoundsWithCornerRadius:(double *)a3
{
  [(UIButtonLegacyVisualProvider *)self _visualBoundsWithCornerRadius:a3 hasProposal:0 shouldUseProposal:0];
  result.size.CGFloat height = v6;
  result.size.CGFloat width = v5;
  result.origin.CGFloat y = v4;
  result.origin.CGFloat x = v3;
  return result;
}

- (id)pointerShapeInContainer:(id)a3 proposal:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(void))a4;
  char v21 = 0;
  double v20 = 0.0;
  [(UIButtonLegacyVisualProvider *)self _visualBoundsWithCornerRadius:&v20 hasProposal:v7 != 0 shouldUseProposal:&v21];
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  if (!v21 || (v7[2](v7), (double v16 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    double v17 = v20;
    -[UIView convertRect:toView:](self->_button, "convertRect:toView:", v6, v9, v11, v13, v15, *(void *)&v20);
    if (v17 >= 0.0) {
      +[UIPointerShape shapeWithRoundedRect:cornerRadius:](UIPointerShape, "shapeWithRoundedRect:cornerRadius:");
    }
    else {
    double v16 = +[UIPointerShape shapeWithRoundedRect:](UIPointerShape, "shapeWithRoundedRect:");
    }
  }
  id v18 = v16;

  return v18;
}

- (id)preferredHoverEffect
{
  UIButtonType v3 = [(UIButton *)self->_button buttonType];
  if (v3 == UIButtonTypeClose) {
    goto LABEL_10;
  }
  UIButtonType v4 = v3;
  double v5 = [(UIView *)self->_button traitCollection];
  uint64_t v6 = [v5 userInterfaceIdiom];

  BOOL v7 = [(UIButton *)self->_button _isiOSSystemProvidedButton];
  if (v6 != 6)
  {
    BOOL v8 = !v7;
    if (v4 == UIButtonTypeCustom) {
      BOOL v8 = 0;
    }
    if (v8
      || ![(UIButton *)self->_button _hasVisibleDefaultSelectionIndicator]
      && !_buttonBackgroundColorIndicatesLiftEffect(self->_button))
    {
      goto LABEL_11;
    }
LABEL_10:
    double v9 = +[UIHoverLiftEffect effect];
    goto LABEL_12;
  }
  if (v7) {
    goto LABEL_10;
  }
LABEL_11:
  double v9 = 0;
LABEL_12:
  return v9;
}

- (id)preferredHoverShape
{
  return [(UIView *)self->_button _outlineShape];
}

- (id)defaultFocusEffect
{
  return 0;
}

- (double)focusSizeIncrease
{
  [(_UIFloatingContentView *)self->_floatingContentView focusedSizeIncrease];
  return result;
}

- (void)setFocusSizeIncrease:(double)a3
{
}

- (CGRect)backgroundRectForBounds:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  button = self->_button;
  if (UIButtonTypeIsModernCircleButton((*(void *)&button->_buttonFlags >> 6)))
  {
    -[UIButton imageRectForContentRect:](button, "imageRectForContentRect:", x, y, width, height);
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

- (BOOL)useTitleForSelectedIndicatorBounds
{
  titleView = self->_titleView;
  if (titleView) {
    LOBYTE(titleView) = ![(UIView *)titleView isHidden];
  }
  return (char)titleView;
}

- (BOOL)_contentHuggingDefault_isUsuallyFixedWidth
{
  return (unint64_t)([(UIButton *)self->_button _buttonType] - 2) < 4;
}

- (BOOL)_contentHuggingDefault_isUsuallyFixedHeight
{
  return (unint64_t)([(UIButton *)self->_button _buttonType] - 2) < 4;
}

_UIButtonContentCenteringSpacer *__49__UIButtonLegacyVisualProvider_updateConstraints__block_invoke(uint64_t a1, uint64_t a2)
{
  UIButtonType v4 = objc_alloc_init(_UIButtonContentCenteringSpacer);
  [(UIView *)v4 setTag:a2];
  [(UIView *)v4 setHidden:1];
  [(UIView *)v4 setTranslatesAutoresizingMaskIntoConstraints:0];
  double v5 = [*(id *)(a1 + 32) effectiveContentView];
  [v5 addSubview:v4];

  uint64_t v6 = *(void **)(*(void *)(a1 + 32) + 8);
  BOOL v7 = (void *)MEMORY[0x1E4F5B268];
  double v8 = _NSDictionaryOfVariableBindings(&cfstr_Spacer.isa, v4, 0);
  double v9 = [v7 constraintsWithVisualFormat:@"V:|[spacer(0)]" options:0 metrics:0 views:v8];
  [v6 addConstraints:v9];

  return v4;
}

- (CGRect)_highlightRectForTextRect:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  if (CGRectIsEmpty(a3))
  {
    double v8 = *MEMORY[0x1E4F1DB20];
    double v9 = *(double *)(MEMORY[0x1E4F1DB20] + 8);
    double v10 = *(double *)(MEMORY[0x1E4F1DB20] + 16);
    double v11 = *(double *)(MEMORY[0x1E4F1DB20] + 24);
  }
  else
  {
    [(UIButton *)self->_button _pathTitleEdgeInsets];
    double v13 = v12;
    double v15 = v14;
    double v17 = -v16;
    double v8 = x - v14;
    double v9 = y - v13;
    double v10 = width - (-v18 - v15);
    double v11 = height - (v17 - v13);
  }
  result.size.double height = v11;
  result.size.double width = v10;
  result.origin.double y = v9;
  result.origin.double x = v8;
  return result;
}

- (CGRect)_highlightRectForImageRect:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  if (CGRectIsEmpty(a3))
  {
    double v8 = *MEMORY[0x1E4F1DB20];
    double v9 = *(double *)(MEMORY[0x1E4F1DB20] + 8);
    double v10 = *(double *)(MEMORY[0x1E4F1DB20] + 16);
    double v11 = *(double *)(MEMORY[0x1E4F1DB20] + 24);
  }
  else
  {
    [(UIButton *)self->_button _pathImageEdgeInsets];
    double v8 = x - v14;
    double v9 = y - v15;
    double v10 = width - (-v13 - v14);
    double v11 = height - (-v12 - v15);
  }
  if (UIButtonTypeIsModernCircleButton([(UIButton *)self->_button _buttonType]))
  {
    -[UIButton imageRectForContentRect:](self->_button, "imageRectForContentRect:", x, y, width, height);
    double v8 = v16;
    double v9 = v17;
    double v10 = v18;
    double v11 = v19;
  }
  double v20 = v8;
  double v21 = v9;
  double v22 = v10;
  double v23 = v11;
  result.size.double height = v23;
  result.size.double width = v22;
  result.origin.double y = v21;
  result.origin.double x = v20;
  return result;
}

- (id)currentImageWithResolvedConfiguration
{
  return [(UIImageView *)self->_imageView _currentImage];
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  -[UIButton _intrinsicSizeWithinSize:](self->_button, "_intrinsicSizeWithinSize:", a3.width, a3.height);
  result.double height = v4;
  result.double width = v3;
  return result;
}

- (void)setVisualEffectViewEnabled:(BOOL)a3 backgroundColor:(id)a4
{
  id v6 = a4;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __75__UIButtonLegacyVisualProvider_setVisualEffectViewEnabled_backgroundColor___block_invoke;
  v8[3] = &unk_1E52DC3D0;
  BOOL v11 = a3;
  id v9 = v6;
  double v10 = self;
  id v7 = v6;
  +[UIView _performSystemAppearanceModifications:v8];
  [(UIButtonLegacyVisualProvider *)self _updateContentBackdropView];
}

uint64_t __75__UIButtonLegacyVisualProvider_setVisualEffectViewEnabled_backgroundColor___block_invoke(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 48)) {
    uint64_t v1 = 0;
  }
  else {
    uint64_t v1 = *(void *)(a1 + 32);
  }
  return [*(id *)(*(void *)(a1 + 40) + 24) setBackgroundColor:v1 forState:0];
}

- (void)_layoutHighlightLayer
{
  if (!self->_highlightLayer)
  {
    double v3 = [MEMORY[0x1E4F39BE8] layer];
    highlightLayer = self->_highlightLayer;
    self->_highlightLayer = v3;
  }
  double v5 = [(UIView *)self->_button layer];
  [v5 bounds];
  -[CALayer setFrame:](self->_highlightLayer, "setFrame:");

  id v6 = +[_UIButtonSettingsDomain rootSettings];
  if ([v6 highlightAlternateColor])
  {
    double v7 = 0.0;
    double v8 = 1.0;
  }
  else
  {
    double v7 = 1.0;
    double v8 = 0.0;
  }
  id v24 = +[UIColor colorWithRed:v7 green:v8 blue:1.0 alpha:1.0];

  id v9 = +[_UIButtonSettingsDomain rootSettings];
  int v10 = [v9 highlightBelow];

  if (v10)
  {
    -[CALayer setBackgroundColor:](self->_highlightLayer, "setBackgroundColor:", [v24 CGColor]);
    [(CALayer *)self->_highlightLayer setBorderColor:0];
    [(CALayer *)self->_highlightLayer setBorderWidth:0.0];
    BOOL v11 = [(UIView *)self->_button subviews];
    double v12 = [v11 firstObject];

    objc_opt_class();
    if (objc_opt_isKindOfClass() & 1) == 0 && (-[UIView _hasTransparentBackground](v12)) {
      goto LABEL_11;
    }
    [(UIView *)self->_button bounds];
    double v15 = v14;
    [v12 bounds];
    double v13 = v15 - v16;
    if (v15 - v16 > 0.0) {
      goto LABEL_11;
    }
    [(UIView *)self->_button bounds];
    double v18 = v17;
    [v12 bounds];
    double v13 = v18 - v19;
    if (v18 - v19 <= 0.0)
    {
      double v20 = [(UIView *)self->_button layer];
      double v21 = v20;
      double v22 = self->_highlightLayer;
      uint64_t v23 = 1;
    }
    else
    {
LABEL_11:
      double v20 = [(UIView *)self->_button layer];
      double v21 = v20;
      double v22 = self->_highlightLayer;
      uint64_t v23 = 0;
    }
    [v20 insertSublayer:v22 atIndex:v23];
  }
  else
  {
    [(CALayer *)self->_highlightLayer setBackgroundColor:0];
    -[CALayer setBorderColor:](self->_highlightLayer, "setBorderColor:", [v24 CGColor]);
    [(CALayer *)self->_highlightLayer setBorderWidth:2.0];
    double v12 = [(UIView *)self->_button layer];
    [v12 addSublayer:self->_highlightLayer];
  }
}

+ (id)_selectedIndicatorImage
{
  if (qword_1EB260D40 != -1) {
    dispatch_once(&qword_1EB260D40, &__block_literal_global_273);
  }
  double v2 = (void *)_MergedGlobals_1086;
  return v2;
}

void __55__UIButtonLegacyVisualProvider__selectedIndicatorImage__block_invoke()
{
  v0 = +[UITraitCollection _fallbackTraitCollection]();
  uint64_t v1 = [v0 userInterfaceIdiom];

  if (v1 == 5) {
    double v2 = 3.0;
  }
  else {
    double v2 = 4.0;
  }
  double v3 = v2 + v2;
  _UIGraphicsBeginImageContextWithOptions(0, 0, v3 + v3 + 1.0, v3 + v3 + 1.0, 0.0);
  +[UIBezierPath bezierPathWithRoundedRect:cornerRadius:](UIBezierPath, "bezierPathWithRoundedRect:cornerRadius:", 0.0, 0.0, v3 + v3 + 1.0, v3 + v3 + 1.0, v2);
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  [v8 fill];
  double v4 = _UIGraphicsGetImageFromCurrentImageContext(0);
  double v5 = objc_msgSend(v4, "resizableImageWithCapInsets:", v2 + v2, v2 + v2, v2 + v2, v2 + v2);

  uint64_t v6 = [v5 imageWithRenderingMode:2];

  UIGraphicsEndImageContext();
  double v7 = (void *)_MergedGlobals_1086;
  _MergedGlobals_1086 = v6;
}

- (BOOL)_imageNeedsCompositingModeWhenSelected
{
  double v2 = [(UIButton *)self->_button imageForState:4];
  uint64_t v3 = [v2 renderingMode];

  return (v3 & 0xFFFFFFFFFFFFFFFDLL) == 0;
}

- (BOOL)_textNeedsCompositingModeWhenSelected
{
  uint64_t v3 = [(UIButton *)self->_button attributedTitleForState:0];
  if (v3)
  {
    BOOL v4 = 1;
  }
  else
  {
    double v5 = [(UIButton *)self->_button _titleColorForState:4];

    BOOL v4 = v5 == 0;
  }

  return v4;
}

- (BOOL)_highlightsBackgroundImage
{
  return (*(void *)&self->_button->_buttonFlags & 0x3FC0) != 448;
}

- (CGRect)_selectedIndicatorBounds
{
  uint64_t v3 = [(UIView *)self->_button traitCollection];
  uint64_t v4 = [v3 userInterfaceIdiom];

  button = self->_button;
  [(UIView *)button bounds];
  -[UIButton contentRectForBounds:](button, "contentRectForBounds:");
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  titleView = self->_titleView;
  if (titleView && ![(UIView *)titleView isHidden])
  {
    -[UIButton titleRectForContentRect:](self->_button, "titleRectForContentRect:", v7, v9, v11, v13);
    uint64_t v22 = v21;
    uint64_t v24 = v23;
    uint64_t v26 = v25;
    uint64_t v28 = v27;
    CGFloat v29 = [(UILabel *)self->_titleView font];
    [v29 pointSize];

    UIRoundToViewScale(self->_button);
    double v31 = v30;
    UIRoundToViewScale(self->_button);
    double v19 = -v32;
    double v20 = -v31;
    uint64_t v15 = v22;
    uint64_t v16 = v24;
    uint64_t v17 = v26;
    uint64_t v18 = v28;
  }
  else
  {
    -[UIButton imageRectForContentRect:](self->_button, "imageRectForContentRect:", v7, v9, v11, v13);
    if (v4 == 5)
    {
      double v19 = -4.0;
      double v20 = -6.0;
    }
    else
    {
      double v19 = -5.0;
      double v20 = -8.0;
    }
  }
  CGRect result = CGRectInset(*(CGRect *)&v15, v19, v20);
  double v33 = result.size.height + 1.0;
  result.size.double height = v33;
  return result;
}

uint64_t __61__UIButtonLegacyVisualProvider__updateSelectionViewForState___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 40) _selectedIndicatorBounds];
  double v2 = *(void **)(*(void *)(a1 + 32) + 56);
  return objc_msgSend(v2, "setFrame:");
}

uint64_t __61__UIButtonLegacyVisualProvider__updateSelectionViewForState___block_invoke_2(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 56) setAlpha:*(double *)(a1 + 40)];
}

- (void)_updateMaskState
{
  if (![(UIButton *)self->_button _hasDrawingStyle]) {
    goto LABEL_8;
  }
  uint64_t v3 = [(UIView *)self->_maskAnimationView layer];
  uint64_t v4 = [v3 animationForKey:@"borderWidth"];
  if (!v4)
  {
    [(_UIButtonMaskAnimationView *)self->_maskAnimationView borderWidth];
    if (v5 <= 1.0)
    {

LABEL_8:
      [(UIImageView *)self->_imageView _setMasksTemplateImages:0];
      [(UIImageView *)self->_backgroundView _setMasksTemplateImages:0];
LABEL_9:
      int v9 = 0;
      goto LABEL_10;
    }
  }
  BOOL v6 = [(UIButton *)self->_button _isCarPlaySystemTypeButton];
  BOOL v7 = v6;
  BOOL v8 = !v6;

  [(UIImageView *)self->_imageView _setMasksTemplateImages:v8];
  [(UIImageView *)self->_backgroundView _setMasksTemplateImages:v8];
  if (v7 || [(UIButton *)self->_button _hasHighlightColor]) {
    goto LABEL_9;
  }
  int v9 = ![(UIButton *)self->_button _isCarPlaySystemTypeButton];
LABEL_10:
  double v10 = [(UIView *)self->_titleView layer];
  double v11 = [v10 compositingFilter];

  if (v9 && !v11)
  {
    id v14 = [MEMORY[0x1E4F39BC0] filterWithType:*MEMORY[0x1E4F3A370]];
    double v12 = [(UIView *)self->_titleView layer];
    [v12 setCompositingFilter:v14];

LABEL_18:

    return;
  }
  if (v11) {
    char v13 = v9;
  }
  else {
    char v13 = 1;
  }
  if ((v13 & 1) == 0)
  {
    id v14 = [(UIView *)self->_titleView layer];
    [v14 setCompositingFilter:0];
    goto LABEL_18;
  }
}

- (void)_prepareMaskAnimationViewIfNecessary
{
  if (!self->_maskAnimationView)
  {
    uint64_t v3 = objc_alloc_init(_UIButtonMaskAnimationView);
    maskAnimationView = self->_maskAnimationView;
    self->_maskAnimationView = v3;

    [(_UIButtonMaskAnimationView *)self->_maskAnimationView setDelegate:self];
    [(UIView *)self->_maskAnimationView setUserInteractionEnabled:0];
    [(_UIButtonMaskAnimationView *)self->_maskAnimationView setHardEdge:[(UIButton *)self->_button _externalFlatEdge]];
    id v5 = [(UIButtonLegacyVisualProvider *)self effectiveContentView];
    [v5 insertSubview:self->_maskAnimationView atIndex:0];
  }
}

- (CGRect)_highlightBoundsForDrawingStyle
{
  [(UIButton *)self->_button _clippedHighlightBounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  unint64_t v11 = [(UIButton *)self->_button _externalFlatEdge];
  [(UIButton *)self->_button _highlightCornerRadius];
  switch(v11)
  {
    case 1uLL:
      double v6 = v6 - v12;
      goto LABEL_3;
    case 2uLL:
      double v4 = v4 - v12;
      goto LABEL_5;
    case 4uLL:
LABEL_3:
      double v10 = v10 + v12;
      break;
    case 8uLL:
LABEL_5:
      double v8 = v8 + v12;
      break;
    default:
      break;
  }
  double v13 = v4;
  double v14 = v6;
  double v15 = v8;
  double v16 = v10;
  result.size.double height = v16;
  result.size.double width = v15;
  result.origin.double y = v14;
  result.origin.double x = v13;
  return result;
}

- (id)_transitionAnimationWithKeyPath:(id)a3
{
  double v3 = [MEMORY[0x1E4F39B48] animationWithKeyPath:a3];
  LODWORD(v4) = 1041812769;
  LODWORD(v5) = 1043018044;
  LODWORD(v6) = 1044413908;
  LODWORD(v7) = 1.0;
  double v8 = [MEMORY[0x1E4F39C10] functionWithControlPoints:v4 :v5 :v6 :v7];
  [v3 setTimingFunction:v8];

  [v3 setDuration:0.2625];
  float v9 = UIAnimationDragCoefficient();
  [v3 speed];
  *(float *)&double v11 = v10 / v9;
  [v3 setSpeed:v11];
  return v3;
}

- (id)_fadeOutAnimationWithKeyPath:(id)a3
{
  double v3 = [MEMORY[0x1E4F39B48] animationWithKeyPath:a3];
  LODWORD(v4) = 1050136617;
  LODWORD(v5) = 988616002;
  LODWORD(v6) = 0.25;
  LODWORD(v7) = 1.0;
  double v8 = [MEMORY[0x1E4F39C10] functionWithControlPoints:v4 :v5 :v6 :v7];
  [v3 setTimingFunction:v8];

  [v3 setBeginTime:UIAnimationDragCoefficient() * 0.785];
  [v3 setBeginTimeMode:*MEMORY[0x1E4F39D98]];
  [v3 setDuration:0.71];
  [v3 setRemovedOnCompletion:0];
  [v3 setFillMode:*MEMORY[0x1E4F39FA0]];
  float v9 = UIAnimationDragCoefficient();
  [v3 speed];
  *(float *)&double v11 = v10 / v9;
  [v3 setSpeed:v11];
  return v3;
}

- (double)_borderWidthForState:(unint64_t)a3 bounds:(CGRect)a4
{
  -[UIButton _drawingStrokeForState:](self->_button, "_drawingStrokeForState:", a3, a4.origin.x, a4.origin.y);
  button = self->_button;
  UIRoundToViewScale(button);
  return result;
}

- (void)_setupDrawingStyleForState:(unint64_t)a3
{
  [(UIButtonLegacyVisualProvider *)self _highlightBoundsForDrawingStyle];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  double v13 = [(UIButton *)self->_button _borderColorForState:a3];
  maskAnimationView = self->_maskAnimationView;
  if (maskAnimationView
    && ([(UIView *)maskAnimationView frame], !CGRectIsEmpty(v86))
    && +[UIView areAnimationsEnabled])
  {
    int v15 = ![(UIButton *)self->_button _isCarPlaySystemTypeButton];
  }
  else
  {
    int v15 = 0;
  }
  [(UIButtonLegacyVisualProvider *)self _prepareMaskAnimationViewIfNecessary];
  [(_UIButtonMaskAnimationView *)self->_maskAnimationView setBorderColor:v13];
  double v16 = [(UIView *)self->_maskAnimationView layer];
  uint64_t v17 = [v16 presentationLayer];

  [(UIView *)self->_maskAnimationView frame];
  v90.origin.double x = v18;
  v90.origin.double y = v19;
  v90.size.double width = v20;
  v90.size.double height = v21;
  v87.origin.double x = v6;
  v87.origin.double y = v8;
  v87.size.double width = v10;
  v87.size.double height = v12;
  if (!CGRectEqualToRect(v87, v90))
  {
    if (v15)
    {
      [v17 bounds];
      double v23 = v22;
      double v25 = v24;
      double v27 = v26;
      double v29 = v28;
      double v82 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
      double v83 = *MEMORY[0x1E4F1DAD8];
      double v30 = [(UIButtonLegacyVisualProvider *)self _transitionAnimationWithKeyPath:@"bounds"];
      double v31 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGRect:", v23, v25, v27, v29);
      [v30 setFromValue:v31];

      double v32 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGRect:", v83, v82, v10, v12);
      [v30 setToValue:v32];

      double v33 = [(UIView *)self->_maskAnimationView layer];
      [v33 addAnimation:v30 forKey:@"bounds"];

      [v17 position];
      double v35 = v34;
      double v37 = v36;
      v88.origin.double x = v6;
      v88.origin.double y = v8;
      v88.size.double width = v10;
      v88.size.double height = v12;
      double MidX = CGRectGetMidX(v88);
      v89.origin.double x = v6;
      v89.origin.double y = v8;
      v89.size.double width = v10;
      v89.size.double height = v12;
      double MidY = CGRectGetMidY(v89);
      double v40 = [(UIButtonLegacyVisualProvider *)self _transitionAnimationWithKeyPath:@"position"];

      double v41 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGPoint:", v35, v37);
      [v40 setFromValue:v41];

      CGRect v42 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGPoint:", MidX, MidY);
      [v40 setToValue:v42];

      id v43 = [(UIView *)self->_maskAnimationView layer];
      [v43 addAnimation:v40 forKey:@"position"];
    }
    -[UIView setFrame:](self->_maskAnimationView, "setFrame:", v6, v8, v10, v12);
  }
  [(UIButton *)self->_button _highlightCornerRadius];
  double v45 = v44;
  double v46 = [(UIView *)self->_maskAnimationView layer];
  [v46 setCornerRadius:v45];

  [(_UIButtonMaskAnimationView *)self->_maskAnimationView borderWidth];
  double v48 = v47;
  -[UIButtonLegacyVisualProvider _borderWidthForState:bounds:](self, "_borderWidthForState:bounds:", a3, v6, v8, v10, v12);
  double v50 = v49;
  [v17 borderWidth];
  double v52 = v51;
  [(_UIButtonMaskAnimationView *)self->_maskAnimationView setBorderWidth:v50];
  if (v15)
  {
    if (v50 <= v48)
    {
      if (v50 < v48)
      {
        double v53 = [(UIButtonLegacyVisualProvider *)self _transitionAnimationWithKeyPath:@"borderWidth"];
        BOOL v62 = [(UIControl *)self->_button _wasLastHighlightSuccessful];
        BOOL v63 = fabs(v50) < 2.22044605e-16 && v62;
        if (v63)
        {
          [v53 setRemovedOnCompletion:0];
          double v50 = 0.75;
          double v64 = 0.49;
        }
        else
        {
          double v64 = 0.245;
        }
        [v53 setDuration:v64];
        int v65 = 1;
LABEL_25:
        CGFloat v66 = [(_UIButtonMaskAnimationView *)self->_maskAnimationView borderColor];
        char v67 = [v66 isEqual:v13];

        if ((v67 & 1) == 0)
        {
          if (!v65)
          {
            double v72 = [(UIView *)self->_maskAnimationView layer];
            [v72 removeAnimationForKey:@"borderColor"];

            v84[0] = MEMORY[0x1E4F143A8];
            v84[1] = 3221225472;
            v84[2] = __59__UIButtonLegacyVisualProvider__setupDrawingStyleForState___block_invoke;
            v84[3] = &unk_1E52D9F98;
            v84[4] = self;
            id v85 = v13;
            +[UIView animateWithDuration:4 delay:v84 options:0 animations:0.1 completion:0.0];

            if (!v53)
            {
LABEL_35:

              goto LABEL_36;
            }
LABEL_31:
            double v73 = [NSNumber numberWithDouble:v52];
            [v53 setFromValue:v73];

            double v74 = [NSNumber numberWithDouble:v50];
            [v53 setToValue:v74];

            [v53 setFillMode:*MEMORY[0x1E4F39FA8]];
            [v53 setDelegate:self->_maskAnimationView];
            double v75 = [(UIView *)self->_maskAnimationView layer];
            [v75 addAnimation:v53 forKey:@"borderWidth"];

            if (v63)
            {
              double v76 = [(UIButtonLegacyVisualProvider *)self _fadeOutAnimationWithKeyPath:@"opacity"];
              double v77 = [(UIView *)self->_maskAnimationView layer];
              double v78 = [v77 presentationLayer];

              double v79 = NSNumber;
              [v78 opacity];
              double v80 = objc_msgSend(v79, "numberWithFloat:");
              [v76 setFromValue:v80];

              [v76 setToValue:&unk_1ED3F1E08];
              [v76 setDelegate:self->_maskAnimationView];
              double v81 = [(UIView *)self->_maskAnimationView layer];
              [v81 addAnimation:v76 forKey:@"opacity"];
            }
            else
            {
              double v76 = [(UIView *)self->_maskAnimationView layer];
              [v76 removeAnimationForKey:@"opacity"];
            }

            goto LABEL_35;
          }
          double v68 = [(UIButtonLegacyVisualProvider *)self _fadeOutAnimationWithKeyPath:@"borderColor"];
          double v69 = [(UIView *)self->_maskAnimationView layer];
          double v70 = [v69 presentationLayer];
          objc_msgSend(v68, "setFromValue:", objc_msgSend(v70, "borderColor"));

          [v68 setToValue:v13];
          double v71 = [(UIView *)self->_maskAnimationView layer];
          [v71 addAnimation:v68 forKey:@"borderColor"];

          [(_UIButtonMaskAnimationView *)self->_maskAnimationView setBorderColor:v13];
        }
        if (!v53) {
          goto LABEL_35;
        }
        goto LABEL_31;
      }
      double v53 = 0;
    }
    else
    {
      double v53 = [MEMORY[0x1E4F39C90] animationWithKeyPath:@"borderWidth"];
      [v53 setMass:1.2];
      [v53 setStiffness:300.0];
      [v53 setDamping:30.0];
      [v53 setVelocity:0.0];
      [v53 setDuration:0.3];
      float v54 = UIAnimationDragCoefficient();
      [v53 speed];
      *(float *)&double v56 = v55 / v54;
      [v53 setSpeed:v56];
    }
    int v65 = 0;
    BOOL v63 = 0;
    goto LABEL_25;
  }
  CGFloat v57 = [(UIView *)self->_maskAnimationView layer];
  [v57 removeAnimationForKey:@"borderWidth"];

  CGFloat v58 = [(UIView *)self->_maskAnimationView layer];
  [v58 removeAnimationForKey:@"borderColor"];

  CGFloat v59 = [(UIView *)self->_maskAnimationView layer];
  [v59 removeAnimationForKey:@"opacity"];

  CGFloat v60 = [(_UIButtonMaskAnimationView *)self->_maskAnimationView borderColor];
  char v61 = [v13 isEqual:v60];

  if ((v61 & 1) == 0) {
    [(_UIButtonMaskAnimationView *)self->_maskAnimationView setBorderColor:v13];
  }
LABEL_36:
  [(UIButtonLegacyVisualProvider *)self _updateMaskState];
}

uint64_t __59__UIButtonLegacyVisualProvider__setupDrawingStyleForState___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 72) setBorderColor:*(void *)(a1 + 40)];
}

- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4
{
}

- (BOOL)canBecomeFocused
{
  return 1;
}

- (id)preferredConfigurationForFocusAnimation:(int64_t)a3 inContext:(id)a4
{
  id v6 = a4;
  double v7 = [(UIButtonLegacyVisualProvider *)self _floatingContentView];

  if (v7)
  {
    double v8 = [(UIButtonLegacyVisualProvider *)self _floatingContentView];
    double v9 = [v8 _preferredConfigurationForFocusAnimation:a3 inContext:v6];
  }
  else
  {
    double v9 = 0;
  }

  return v9;
}

uint64_t __52__UIButtonLegacyVisualProvider__floatingContentView__block_invoke(uint64_t a1)
{
  double v2 = *(void **)(*(void *)(a1 + 32) + 24);
  double v3 = +[_UIFocusAnimationConfiguration configurationWithStyle:1];
  [v2 setFocusAnimationConfiguration:v3];

  [*(id *)(*(void *)(a1 + 32) + 24) setShadowOpacity:0.2];
  [*(id *)(*(void *)(a1 + 32) + 24) setShadowRadius:16.0];
  double v4 = *(void **)(*(void *)(a1 + 32) + 24);
  return [v4 setShadowVerticalOffset:25.0];
}

- (id)imageEffectContainerView
{
  return self->_imageView;
}

- (id)selectionIndicatorView
{
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    selectionView = self->_selectionView;
  }
  else {
    selectionView = 0;
  }
  return selectionView;
}

- (void)setExternalFlatEdge:(unint64_t)a3
{
  [(UIButtonLegacyVisualProvider *)self _prepareMaskAnimationViewIfNecessary];
  maskAnimationView = self->_maskAnimationView;
  [(_UIButtonMaskAnimationView *)maskAnimationView setHardEdge:a3];
}

- (void)setDrawingStroke:(double)a3 forState:(unint64_t)a4
{
  -[UIButtonLegacyVisualProvider _updateEffectsForImageView:background:](self, "_updateEffectsForImageView:background:", self->_imageView, 0, a3);
  [(UIButtonLegacyVisualProvider *)self _updateEffectsForImageView:self->_backgroundView background:1];
  [(UIButtonLegacyVisualProvider *)self _updateMaskState];
}

- (UIButton)button
{
  return self->_button;
}

- (NSArray)_contentConstraints
{
  return self->_contentConstraints;
}

- (BOOL)avoidDefaultTitleAndImageLayout
{
  return self->_avoidDefaultTitleAndImageLayout;
}

- (void)setAvoidDefaultTitleAndImageLayout:(BOOL)a3
{
  self->_avoidDefaultTitleAndImageLayout = a3;
}

@end