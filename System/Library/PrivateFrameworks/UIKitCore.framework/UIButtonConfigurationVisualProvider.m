@interface UIButtonConfigurationVisualProvider
+ (BOOL)requiresNewVisualProviderForChanges;
+ (BOOL)shouldUpdateContextMenuEnabledOnMenuChanges;
+ (BOOL)wantsConfigurationUpdateForButtonShapes;
+ (id)visualProviderForButton:(id)a3;
- ($715CDB9500DB0530738687119A983978)_debugLayoutData;
- ($715CDB9500DB0530738687119A983978)_layoutDataInBounds:(SEL)a3;
- ($715CDB9500DB0530738687119A983978)_layoutDataInBounds:(SEL)a3 forConfiguration:(CGRect)a4;
- ($715CDB9500DB0530738687119A983978)_layoutDataUpdatingIfNecessary;
- ($F24F406B2B787EFB06265DBA3D28CBD5)baselineOffsetsAtSize:(CGSize)a3;
- (BOOL)adjustsFontForContentSizeCategory;
- (BOOL)avoidDefaultTitleAndImageLayout;
- (BOOL)canBecomeFocused;
- (BOOL)hasBaseline;
- (BOOL)hasMultilineText;
- (BOOL)isOn;
- (BOOL)useTitleForSelectedIndicatorBounds;
- (BOOL)vendsBaselineInformationToAutoLayout;
- (CGPoint)menuAttachmentPointForConfiguration:(id)a3;
- (CGRect)_layoutBounds;
- (CGRect)contentRectForBounds:(CGRect)a3;
- (CGRect)imageRectForContentRect:(CGRect)a3;
- (CGRect)titleRectForContentRect:(CGRect)a3;
- (CGRect)visualBoundsWithCornerRadius:(double *)a3;
- (CGSize)intrinsicContentSize;
- (CGSize)intrinsicSizeWithinSize:(CGSize)a3;
- (UIButton)button;
- (UIButtonConfigurationVisualProvider)init;
- (UIEdgeInsets)alignmentRectInsets;
- (double)focusSizeIncrease;
- (double)previousFirstBaselineOffsetForAttributeLowering;
- (double)previousLastBaselineOffsetForAttributeLowering;
- (double)widthForMultilineTextLayout;
- (id)backgroundViewCreateIfNeeded:(BOOL)a3;
- (id)contentBackdropView;
- (id)contextMenuInteraction:(id)a3 configurationForMenuAtLocation:(CGPoint)a4;
- (id)contextMenuInteraction:(id)a3 previewForDismissingMenuWithConfiguration:(id)a4;
- (id)contextMenuInteraction:(id)a3 previewForHighlightingMenuWithConfiguration:(id)a4;
- (id)defaultFocusEffect;
- (id)effectiveContentView;
- (id)imageEffectContainerView;
- (id)imageViewCreateIfNeeded:(BOOL)a3;
- (id)pointerEffectPreviewParameters;
- (id)pointerEffectWithPreview:(id)a3;
- (id)pointerShapeInContainer:(id)a3 proposal:(id)a4;
- (id)preferredConfigurationForFocusAnimation:(int64_t)a3 inContext:(id)a4;
- (id)preferredHoverEffect;
- (id)preferredHoverShape;
- (id)selectionIndicatorView;
- (id)subtitleViewCreateIfNeeded:(BOOL)a3;
- (id)titleViewCreateIfNeeded:(BOOL)a3;
- (id)viewForFirstBaselineLayout;
- (id)viewForLastBaselineLayout;
- (void)_accessibilityButtonShapesChangedNotification:(id)a3;
- (void)_applyButtonValuesToConfiguration:(id)a3;
- (void)_executeConfigurationUpdate;
- (void)_layoutContent;
- (void)_updateBackgroundViewWithConfiguration:(id)a3;
- (void)_updateImageViewWithConfiguration:(id)a3;
- (void)_updateIndicatorWithConfiguration:(id)a3;
- (void)_updateProgressIndicatorWithConfiguration:(id)a3;
- (void)_updateSubtitleLabelWithConfiguration:(id)a3;
- (void)_updateTitleLabelWithConfiguration:(id)a3;
- (void)alignmentRectInsetsHaveChangedForChildImageView:(id)a3;
- (void)applyConfiguration;
- (void)automaticallyUpdateConfigurationIfNecessary:(id)a3;
- (void)cleanupForVisualProvider:(id)a3;
- (void)contextMenuInteraction:(id)a3 updateStyleForMenuWithConfiguration:(id)a4 style:(id)a5;
- (void)dealloc;
- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4;
- (void)intrinsicContentSizeInvalidatedForChildView:(id)a3;
- (void)invalidateLayoutData;
- (void)layoutSubviews;
- (void)setAttributedTitle:(id)a3 forState:(unint64_t)a4;
- (void)setAvoidDefaultTitleAndImageLayout:(BOOL)a3;
- (void)setButton:(id)a3;
- (void)setContentHorizontalAlignment:(int64_t)a3;
- (void)setContentVerticalAlignment:(int64_t)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setHighlighted:(BOOL)a3 animated:(BOOL)a4;
- (void)setImage:(id)a3 forState:(unint64_t)a4;
- (void)setNeedsUpdateConfiguration;
- (void)setPreferredSymbolConfiguration:(id)a3 forImageInState:(unint64_t)a4;
- (void)setPreviousFirstBaselineOffsetForAttributeLowering:(double)a3;
- (void)setPreviousLastBaselineOffsetForAttributeLowering:(double)a3;
- (void)setRole:(int64_t)a3;
- (void)setSelected:(BOOL)a3;
- (void)setTitle:(id)a3 forState:(unint64_t)a4;
- (void)setVendsBaselineInformationToAutoLayout:(BOOL)a3;
- (void)setWidthForMultilineTextLayout:(double)a3;
- (void)tintColorDidChange;
- (void)traitCollectionDidChange:(id)a3;
- (void)updateBaselineInformationDependentOnBounds;
- (void)updateConfigurationIfNecessary;
@end

@implementation UIButtonConfigurationVisualProvider

uint64_t __78__UIButtonConfigurationVisualProvider__updateBackgroundViewWithConfiguration___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 264) setConfiguration:*(void *)(a1 + 40)];
}

- (void)traitCollectionDidChange:(id)a3
{
  if (!_UITraitUsageTrackingEnabled() || (dyld_program_sdk_at_least() & 1) == 0)
  {
    button = self->_button;
    [(UIButton *)button setNeedsUpdateConfiguration];
  }
}

- (BOOL)vendsBaselineInformationToAutoLayout
{
  return self->_vendsBaselineInformationToAutoLayout;
}

- (UIEdgeInsets)alignmentRectInsets
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

- (CGSize)intrinsicContentSize
{
  -[UIButtonConfigurationVisualProvider intrinsicSizeWithinSize:](self, "intrinsicSizeWithinSize:", self->_widthForMultilineTextLayout, 0.0);
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)setSelected:(BOOL)a3
{
}

- (void)setButton:(id)a3
{
  self->_button = (UIButton *)a3;
}

+ (BOOL)requiresNewVisualProviderForChanges
{
  return 0;
}

- (CGRect)contentRectForBounds:(CGRect)a3
{
  double v3 = *MEMORY[0x1E4F1DB28];
  double v4 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  double v5 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  double v6 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (BOOL)adjustsFontForContentSizeCategory
{
  return 0;
}

- (void)intrinsicContentSizeInvalidatedForChildView:(id)a3
{
  if (self->_imageView == a3 && [a3 _hasBaseline])
  {
    [(UIButtonConfigurationVisualProvider *)self updateBaselineInformationDependentOnBounds];
  }
}

- (void)updateBaselineInformationDependentOnBounds
{
  if (self->_vendsBaselineInformationToAutoLayout)
  {
    double v3 = [(UIView *)self->_button _layoutEngine];
    if (v3)
    {
      -[UIButtonConfigurationVisualProvider _layoutDataInBounds:](self, "_layoutDataInBounds:", -[UIView _nsis_compatibleBoundsInEngine:](self->_button, v3));
      double v4 = v5;
      if (v5 != self->_previousFirstBaselineOffsetForAttributeLowering
        || (double v4 = v6, v6 != self->_previousLastBaselineOffsetForAttributeLowering))
      {
        [(UIView *)self->_button _invalidateBaselineConstraints];
      }
    }
  }
}

- (void)alignmentRectInsetsHaveChangedForChildImageView:(id)a3
{
  if (self->_imageView == a3 && [a3 _hasBaseline])
  {
    [(UIButtonConfigurationVisualProvider *)self updateBaselineInformationDependentOnBounds];
  }
}

- (void)setWidthForMultilineTextLayout:(double)a3
{
  self->_widthForMultilineTextLayout = a3;
}

- (id)viewForLastBaselineLayout
{
  return self->_button;
}

- (BOOL)hasBaseline
{
  [(UIButtonConfigurationVisualProvider *)self updateConfigurationIfNecessary];
  double v3 = [(UIButton *)self->_button _currentConfiguration];
  double v4 = [v3 image];
  if (v4 || ([v3 showsActivityIndicator] & 1) != 0)
  {
    BOOL v5 = 1;
  }
  else
  {
    v7 = [v3 attributedTitle];
    if ([v7 length])
    {
      BOOL v5 = 1;
    }
    else
    {
      v8 = [v3 attributedSubtitle];
      BOOL v5 = [v8 length] != 0;
    }
  }

  return v5;
}

- (void)setNeedsUpdateConfiguration
{
  *(unsigned char *)&self->_flags |= 1u;
  [(UIButton *)self->_button setNeedsLayout];
}

- (void)tintColorDidChange
{
}

- (void)_updateBackgroundViewWithConfiguration:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 cornerStyle];
  double v6 = [v4 background];
  if (v6)
  {
    v7 = v6;
    if (v5 != -1)
    {
      uint64_t v8 = [v6 copy];

      v7 = (void *)v8;
    }
    [v7 cornerRadius];
    double v10 = v9;
    switch([v4 cornerStyle])
    {
      case 0:
        v11 = +[UIFontMetrics defaultMetrics];
        v12 = [(UIView *)self->_button traitCollection];
        [v11 scaledValueForValue:v12 compatibleWithTraitCollection:v10];
        objc_msgSend(v7, "setCornerRadius:");

        break;
      case 1:
        [(UIView *)self->_button bounds];
        double v14 = 0.25;
        goto LABEL_8;
      case 2:
        [(UIView *)self->_button bounds];
        double v14 = 0.35;
LABEL_8:
        double v15 = v13 * v14 * 0.5;
        goto LABEL_11;
      case 3:
        [(UIView *)self->_button bounds];
        double v15 = v16 * 0.5 * 0.5;
        goto LABEL_11;
      case 4:
        double v15 = 1.79769313e308;
LABEL_11:
        [v7 setCornerRadius:v15];
        break;
      default:
        break;
    }
    if (self->_backgroundView)
    {
      v20[0] = MEMORY[0x1E4F143A8];
      v20[1] = 3221225472;
      v20[2] = __78__UIButtonConfigurationVisualProvider__updateBackgroundViewWithConfiguration___block_invoke;
      v20[3] = &unk_1E52D9F98;
      v20[4] = self;
      id v21 = v7;
      id v17 = v7;
      +[UIView performWithoutAnimation:v20];
    }
    else
    {
      v18 = [[_UISystemBackgroundView alloc] initWithConfiguration:v7];
      backgroundView = self->_backgroundView;
      self->_backgroundView = v18;

      [(UIView *)self->_backgroundView setUserInteractionEnabled:0];
      [(UIView *)self->_button insertSubview:self->_backgroundView atIndex:0];
    }
  }
}

- (void)setEnabled:(BOOL)a3
{
}

- (void)setImage:(id)a3 forState:(unint64_t)a4
{
}

- (void)setAttributedTitle:(id)a3 forState:(unint64_t)a4
{
}

+ (BOOL)shouldUpdateContextMenuEnabledOnMenuChanges
{
  return 1;
}

- (void)_executeConfigurationUpdate
{
  double v3 = (void *)_UISetCurrentFallbackEnvironment(self->_button);
  memset(__src, 0, sizeof(__src));
  _UIBeginTrackingTraitUsage(self->_button, 0, __src);
  id v4 = [(UIButton *)self->_button _currentConfiguration];
  if (v4)
  {
    [(UIButtonConfigurationVisualProvider *)self _applyButtonValuesToConfiguration:v4];
    [(UIButtonConfigurationVisualProvider *)self automaticallyUpdateConfigurationIfNecessary:v4];
  }
  button = self->_button;
  double v6 = [(UIButton *)button _configurationState];
  [(UIButton *)button _updateConfigurationUsingState:v6];

  [(UIButton *)self->_button updateConfiguration];
  uint64_t v7 = [(UIButton *)self->_button configurationUpdateHandler];
  uint64_t v8 = (void *)v7;
  if (v7) {
    (*(void (**)(uint64_t, UIButton *))(v7 + 16))(v7, self->_button);
  }
  [(UIButtonConfigurationVisualProvider *)self applyConfiguration];
  memcpy(v10, __src, sizeof(v10));
  double v9 = (char *)GetTraitCollectionTSD() + 16;
  memcpy(__dst, v9, sizeof(__dst));
  memcpy(v9, v10, 0x160uLL);
  -[UIView _recordTraitUsage:insideMethod:withInvalidationAction:](&self->_button->super.super.super.super.isa, (uint64_t)&__dst[136], [(UIButton *)self->_button methodForSelector:sel_updateConfiguration], sel_setNeedsUpdateConfiguration);
  _UITraitUsageTrackingResultDestroy((uint64_t)__dst);
  _UIRestorePreviousFallbackEnvironment(v3);
}

- (void)_applyButtonValuesToConfiguration:(id)a3
{
  v16[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  UIControlState v5 = [(UIControl *)self->_button state];
  double v6 = [(UIButton *)self->_button _attributedTitleForState:v5];
  if (v6)
  {
    [v4 setAttributedTitle:v6];
  }
  else
  {
    uint64_t v7 = [(UIButton *)self->_button _titleForState:v5];
    uint64_t v8 = [(UIButton *)self->_button _titleColorForState:v5];
    double v9 = (void *)v8;
    if (v7)
    {
      if (v8)
      {
        id v10 = objc_alloc(MEMORY[0x1E4F28B18]);
        uint64_t v15 = *(void *)off_1E52D2048;
        v16[0] = v9;
        v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:&v15 count:1];
        v12 = (void *)[v10 initWithString:v7 attributes:v11];
        [v4 setAttributedTitle:v12];
      }
      else
      {
        [v4 setTitle:v7];
      }
    }
  }
  double v13 = [(UIButton *)self->_button _imageForState:v5 applyingConfiguration:0 usesImageForNormalState:0];
  if (v13)
  {
    [v4 setImage:v13];
    if ([v13 isSymbolImage])
    {
      double v14 = [(UIButton *)self->_button _preferredConfigurationForState:v5 includeDefault:0];
      if (v14) {
        [v4 setPreferredSymbolConfigurationForImage:v14];
      }
    }
  }
}

- (void)automaticallyUpdateConfigurationIfNecessary:(id)a3
{
  id v9 = a3;
  BOOL v5 = [(UIButton *)self->_button automaticallyUpdatesConfiguration];
  double v6 = v9;
  if (v5)
  {
    uint64_t v7 = [v9 _updateFromButton:self->_button];
    if (!v7)
    {
      uint64_t v8 = [MEMORY[0x1E4F28B00] currentHandler];
      [v8 handleFailureInMethod:a2, self, @"UIButtonConfigurationVisualProvider.m", 746, @"Updated configuration was nil for configuration: %@", v9 object file lineNumber description];
    }
    [(UIButton *)self->_button _setCurrentConfiguration:v7];

    double v6 = v9;
  }
}

- (void)layoutSubviews
{
  [(UIButtonConfigurationVisualProvider *)self updateConfigurationIfNecessary];
  if (!self->_avoidDefaultTitleAndImageLayout) {
    [(UIButtonConfigurationVisualProvider *)self _layoutContent];
  }
  backgroundView = self->_backgroundView;
  if (backgroundView) {
    double currentlyAppliedCornerRadius = backgroundView->_currentlyAppliedCornerRadius;
  }
  else {
    double currentlyAppliedCornerRadius = 0.0;
  }
  [(UIButtonConfigurationVisualProvider *)self updatedAppliedCornerRadius:currentlyAppliedCornerRadius];
  BOOL v5 = self->_backgroundView;
  if (v5) {
    uint64_t v6 = *(unsigned char *)&v5->_systemBackgroundViewFlags & 1;
  }
  else {
    uint64_t v6 = 0;
  }
  [(UIButtonConfigurationVisualProvider *)self updatedAppliedCornersAreContinuous:v6];
  id v7 = [(UIView *)self->_button hoverStyle];
  [v7 _invalidateAutomaticHoverShape];
}

- (void)_layoutContent
{
  [(UIButtonConfigurationVisualProvider *)self _layoutDataUpdatingIfNecessary];
  double v4 = 0.0;
  double v3 = 0.0;
  double v6 = 0.0;
  double v5 = 0.0;
  id v7 = [(UIButton *)self->_button _currentConfiguration];
  [(UIButtonConfigurationVisualProvider *)self _updateBackgroundViewWithConfiguration:v7];

  int v8 = dyld_program_sdk_at_least();
  backgroundView = self->_backgroundView;
  if (v8)
  {
    [(_UISystemBackgroundView *)backgroundView frameInContainerView:self->_button];
    double v3 = v10;
    double v4 = v11;
    double v5 = v12;
    double v6 = v13;
    backgroundView = self->_backgroundView;
  }
  -[_UISystemBackgroundView setFrame:](backgroundView, "setFrame:", v3, v4, v5, v6);
  if ((*(unsigned char *)&self->_layoutData.flags & 0x20) != 0) {
    -[UILabel setFrame:](self->_subtitleLabel, "setFrame:", (unsigned __int128)0, (unsigned __int128)0);
  }
}

- (void)applyConfiguration
{
  double v3 = [(UIButton *)self->_button _currentConfiguration];
  if (v3)
  {
    double v5 = v3;
    [(UIButtonConfigurationVisualProvider *)self _updateImageViewWithConfiguration:v3];
    [(UIButtonConfigurationVisualProvider *)self _updateIndicatorWithConfiguration:v5];
    [(UIButtonConfigurationVisualProvider *)self _updateProgressIndicatorWithConfiguration:v5];
    [(UIButtonConfigurationVisualProvider *)self _updateTitleLabelWithConfiguration:v5];
    [(UIButtonConfigurationVisualProvider *)self _updateSubtitleLabelWithConfiguration:v5];
    [(UIButtonConfigurationVisualProvider *)self _updateBackgroundViewWithConfiguration:v5];
    [(UIButtonConfigurationVisualProvider *)self invalidateLayoutData];
    [(UIView *)self->_button invalidateIntrinsicContentSize];
    [(UIButton *)self->_button setNeedsLayout];
    double v4 = [(UIView *)self->_button hoverStyle];
    [v4 _invalidateAutomaticHoverEffect];

    double v3 = v5;
  }
}

- (void)invalidateLayoutData
{
  *(unsigned char *)&self->_layoutData.flags &= ~1u;
}

- ($715CDB9500DB0530738687119A983978)_layoutDataInBounds:(SEL)a3 forConfiguration:(CGRect)a4
{
  CGFloat height = a4.size.height;
  CGFloat width = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  id v364 = a5;
  UIUserInterfaceLayoutDirection v11 = [(UIView *)self->_button effectiveUserInterfaceLayoutDirection];
  v372.origin.CGFloat x = x;
  v372.origin.CGFloat y = y;
  v372.size.CGFloat width = width;
  v372.size.CGFloat height = height;
  if (CGRectGetWidth(v372) <= 0.0)
  {
    BOOL v12 = 0;
  }
  else
  {
    v373.origin.CGFloat x = x;
    v373.origin.CGFloat y = y;
    v373.size.CGFloat width = width;
    v373.size.CGFloat height = height;
    BOOL v12 = CGRectGetWidth(v373) < 3.40282347e38;
  }
  v374.origin.CGFloat x = x;
  v374.origin.CGFloat y = y;
  v374.size.CGFloat width = width;
  v374.size.CGFloat height = height;
  if (CGRectGetHeight(v374) <= 0.0)
  {
    BOOL v13 = 0;
  }
  else
  {
    v375.origin.CGFloat x = x;
    v375.origin.CGFloat y = y;
    v375.size.CGFloat width = width;
    v375.size.CGFloat height = height;
    BOOL v13 = CGRectGetHeight(v375) < 3.40282347e38;
  }
  double v14 = 0.0;
  if (v12)
  {
    v376.origin.CGFloat x = x;
    v376.origin.CGFloat y = y;
    v376.size.CGFloat width = width;
    v376.size.CGFloat height = height;
    double v14 = CGRectGetWidth(v376);
  }
  double v351 = v14;
  if (v13)
  {
    v377.origin.CGFloat x = x;
    v377.origin.CGFloat y = y;
    v377.size.CGFloat width = width;
    v377.size.CGFloat height = height;
    CGRectGetHeight(v377);
  }
  BOOL v291 = v12;
  int v345 = [v364 _hasMultilineTitle];
  int v349 = [v364 _hasMultilineSubtitle];
  uint64_t v15 = [v364 _resolvedImage];

  int v16 = [v364 showsActivityIndicator];
  v311 = v15;
  BOOL v24 = v15 == 0;
  int v17 = v16;
  if (v24) {
    int v18 = v16;
  }
  else {
    int v18 = 1;
  }
  v19 = [v364 _resolvedIndicator];

  v20 = [v364 _resolvedTitle];
  [v364 _resolvedSubtitle];
  v289 = v290 = v20;
  uint64_t v329 = [v20 length];
  uint64_t v321 = [v289 length];
  uint64_t v315 = [v364 imagePlacement];
  int v288 = v18;
  int v292 = v18 ^ 1;
  if (v329 | v321) {
    char v21 = v18 ^ 1;
  }
  else {
    char v21 = 1;
  }
  double v323 = 0.0;
  double v22 = 0.0;
  if ((v21 & 1) == 0)
  {
    [v364 imagePadding];
    double v22 = v23;
  }
  if (v329) {
    BOOL v24 = v321 == 0;
  }
  else {
    BOOL v24 = 1;
  }
  int v25 = !v24;
  if (!v24)
  {
    [v364 titlePadding];
    double v323 = v26;
  }
  v27 = v364;
  if (v19)
  {
    [v364 _resolvedIndicatorPadding];
    v27 = v364;
  }
  else
  {
    double v28 = 0.0;
  }
  double v358 = v28;
  [v27 _resolvedImageReservation];
  double rect = v29;
  [v364 contentInsets];
  double v31 = v30;
  double v33 = v32;
  double r2_8 = v34;
  double v36 = v35;
  int v37 = [v364 _hasOversizedTitle];
  int v38 = [v364 _hasOversizedSubtitle];
  int v39 = v38;
  if ((v37 & 1) != 0 || v38)
  {
    double v365 = 0.0;
    double v366 = 0.0;
    if (v25)
    {
      double v305 = v22;
      double r2_16 = v36;
      double v325 = v33;
      double v298 = v31;
      double v41 = 0.0;
      double v42 = 0.0;
      double v43 = 0.0;
      double v44 = 0.0;
      double v45 = 0.0;
      if (v37)
      {
        double v45 = +[UILabel _insetsForAttributedString:withDefaultFont:inView:]((uint64_t)UILabel, v290, 0, self->_button);
        double v44 = v46;
        double v43 = v47;
        double v42 = v48;
      }
      double v49 = 0.0;
      double v50 = 0.0;
      double v51 = 0.0;
      BOOL v40 = v291;
      if (v39)
      {
        double v51 = +[UILabel _insetsForAttributedString:withDefaultFont:inView:]((uint64_t)UILabel, v289, 0, self->_button);
        double v41 = v52;
      }
      double v370 = -v45;
      double v368 = -v49;
      if (v11 == UIUserInterfaceLayoutDirectionRightToLeft)
      {
        if (v42 <= v41) {
          double v53 = v42;
        }
        else {
          double v53 = v41;
        }
        double v54 = -v53;
        if (v44 <= v50) {
          double v50 = v44;
        }
      }
      else
      {
        if (v44 <= v50) {
          double v50 = v44;
        }
        double v54 = -v50;
        if (v42 <= v41) {
          double v50 = v42;
        }
        else {
          double v50 = v41;
        }
      }
      double v31 = v298;
      double v369 = v54;
      double v367 = -v50;
      double v60 = -(v43 + v51);
      double v33 = v325;
      double v36 = r2_16;
      double v22 = v305;
    }
    else
    {
      if (v37) {
        v55 = v290;
      }
      else {
        v55 = v289;
      }
      double v370 = -+[UILabel _insetsForAttributedString:withDefaultFont:inView:]((uint64_t)UILabel, v55, 0, self->_button);
      double v368 = -v57;
      double v59 = -v58;
      if (v11 == UIUserInterfaceLayoutDirectionRightToLeft)
      {
        double v369 = -v56;
        double v367 = v59;
      }
      else
      {
        double v369 = v59;
        double v367 = -v56;
      }
      double v60 = 0.0;
      BOOL v40 = v291;
    }
    uint64_t v61 = v315;
    if (!v288) {
      uint64_t v61 = 0;
    }
    v62 = &v366;
    uint64_t v63 = v61 - 1;
    v64 = &v370;
    switch(v63)
    {
      case 0:
        goto LABEL_64;
      case 1:
        v64 = &v369;
        goto LABEL_64;
      case 3:
        v64 = &v368;
        goto LABEL_64;
      case 7:
        v64 = &v367;
LABEL_64:
        double v366 = *v64;
        v62 = v64;
        break;
      default:
        break;
    }
    double *v62 = 0.0;
    if (v19)
    {
      double v365 = v367;
      v65 = &v367;
    }
    else
    {
      v65 = &v365;
    }
    double *v65 = 0.0;
    if (v33 < v369) {
      double v33 = v369;
    }
    if (v36 < v367) {
      double v36 = v367;
    }
    if (v31 < v370) {
      double v31 = v370;
    }
    double v66 = r2_8;
    if (r2_8 < v368) {
      double v66 = v368;
    }
    double r2_8 = v66;
    double v67 = v323;
    if (v323 < v60) {
      double v67 = v60;
    }
    double v323 = v67;
    if (v22 < v366) {
      double v22 = v366;
    }
    double v68 = v358;
    if (v358 < v365) {
      double v68 = v365;
    }
    double v358 = v68;
  }
  else
  {
    BOOL v40 = v291;
  }
  v69 = (double *)MEMORY[0x1E4F1DAD8];
  double r2_16a = v36;
  if (v17)
  {
    double v70 = *MEMORY[0x1E4F1DB30];
    double r2 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
    -[UIActivityIndicatorView sizeThatFits:](self->_progressIndicatorView, "sizeThatFits:");
    double v361 = v71;
    CGFloat v355 = v72;
  }
  else
  {
    double r2 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
    if (v311)
    {
      imageView = self->_imageView;
      double v74 = *MEMORY[0x1E4F1DAD8];
      double v75 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
      double v70 = *MEMORY[0x1E4F1DB30];
      -[UIImageView sizeThatFits:](imageView, "sizeThatFits:");
      double v77 = v76;
      double v78 = v74;
      double v36 = r2_16a;
      -[UIView alignmentRectForFrame:](imageView, "alignmentRectForFrame:", v78, v75, v77, v79);
      double v361 = v80;
      CGFloat v355 = v81;
    }
    else
    {
      CGFloat v355 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
      double v70 = *MEMORY[0x1E4F1DB30];
      double v361 = *MEMORY[0x1E4F1DB30];
    }
  }
  CGFloat v284 = width;
  CGFloat v286 = height;
  if (v19)
  {
    -[UIImageView sizeThatFits:](self->_indicatorView, "sizeThatFits:", v70, r2);
    double v70 = v82;
    double r2 = v83;
  }
  int v84 = v292;
  if (v351 <= 0.0) {
    int v84 = 1;
  }
  if ((v315 & 0xA) == 0) {
    int v84 = 1;
  }
  double v306 = v22;
  double v85 = 0.0;
  double v86 = fmax(v351 - (v22 + v361), 0.0);
  if (v84) {
    double v86 = v351;
  }
  if (v19) {
    BOOL v87 = v86 <= 0.0;
  }
  else {
    BOOL v87 = 1;
  }
  double v299 = v31;
  double v301 = v358 + v70;
  double v88 = fmax(v86 - (v358 + v70), 0.0);
  if (!v87) {
    double v86 = v88;
  }
  double v326 = v33;
  double v89 = fmax(v86 - (v36 + v33), 0.0);
  if (v86 <= 0.0) {
    double v90 = v86;
  }
  else {
    double v90 = v89;
  }
  CGFloat v309 = v70;
  if (v90 <= 0.0)
  {
    double v92 = 3.40282347e38;
  }
  else
  {
    UICeilToViewScale(self->_button);
    double v92 = v91;
  }
  double v93 = *MEMORY[0x1E4F1DB28];
  CGFloat v352 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  double v94 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  CGFloat v95 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  CGFloat v318 = v94;
  CGFloat v319 = v95;
  double v96 = 0.0;
  double v97 = *MEMORY[0x1E4F1DB28];
  CGFloat r2_24 = v95;
  CGFloat v320 = v94;
  double v98 = *MEMORY[0x1E4F1DB28];
  if (v329 | v321)
  {
    CGFloat r2_24 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
    double v99 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    if (v329)
    {
      -[UILabel sizeThatFits:](self->_titleLabel, "sizeThatFits:", v92, 3.40282347e38, v98);
      double v99 = v100;
      CGFloat r2_24 = v101;
      if (((!v40 | v345) & 1) == 0 && v100 >= v90) {
        double v99 = v90;
      }
    }
    double v102 = v95;
    double v103 = v94;
    if (v321)
    {
      -[UILabel sizeThatFits:](self->_subtitleLabel, "sizeThatFits:", v92, 3.40282347e38, v98);
      if (((!v40 | v349) & 1) == 0 && v103 >= v90) {
        double v103 = v90;
      }
    }
    CGFloat v104 = v102;
    CGFloat v105 = v103;
    v378.origin.CGFloat x = v93;
    v378.origin.CGFloat y = v352;
    CGFloat v320 = v99;
    v378.size.CGFloat width = v99;
    v378.size.CGFloat height = r2_24;
    double v96 = CGRectGetWidth(v378);
    v379.origin.CGFloat x = v93;
    v379.origin.CGFloat y = v352;
    CGFloat v318 = v105;
    CGFloat v319 = v104;
    v379.size.CGFloat width = v105;
    v379.size.CGFloat height = v104;
    double v85 = CGRectGetWidth(v379);
    if (v329 && v321)
    {
      uint64_t v106 = [v364 _resolvedTitleAlignment];
      if (v106 == 2 || (double v107 = 0.0, (v11 == UIUserInterfaceLayoutDirectionRightToLeft) != (v106 == 3))) {
        UIFloorToViewScale(self->_button);
      }
      double v108 = v93 + v107;
      if (v96 >= v85) {
        double v97 = v108;
      }
      else {
        double v97 = v93;
      }
      if (v96 >= v85) {
        double v98 = v93;
      }
      else {
        double v98 = v108;
      }
    }
    else
    {
      double v97 = v93;
      double v98 = v93;
    }
  }
  double v346 = v98;
  double v313 = v93;
  double v322 = *v69;
  double v350 = v69[1];
  if ((v315 & 0xA) != 0)
  {
    double v109 = 0.0;
    double v110 = v361;
    BOOL v111 = v13;
    if (rect > v361)
    {
      double v110 = rect;
      UIRoundToViewScale(self->_button);
      double v109 = v112;
    }
    uint64_t v113 = 2;
    if (v11 == UIUserInterfaceLayoutDirectionRightToLeft) {
      uint64_t v113 = 8;
    }
    int v114 = v17;
    if ((v315 & v113) != 0)
    {
      double v115 = v94 + v306 + v110;
      v380.origin.CGFloat x = v93;
      CGFloat v116 = v352;
      v380.origin.CGFloat y = v352;
      v380.size.CGFloat width = v115;
      v380.size.CGFloat height = v95;
      CGFloat MaxX = CGRectGetMaxX(v380);
      double v118 = v346 + MaxX;
      double v97 = v97 + MaxX;
      if (v96 >= v85) {
        double v119 = v96;
      }
      else {
        double v119 = v85;
      }
      double v303 = v119 + v115;
      double v120 = v322;
      v121 = v311;
      double v122 = r2_16a;
      double v123 = v361;
    }
    else
    {
      if (v96 >= v85) {
        double v129 = v96;
      }
      else {
        double v129 = v85;
      }
      CGFloat v130 = v94 + v306 + v129;
      v381.origin.CGFloat x = v93;
      CGFloat v116 = v352;
      v381.origin.CGFloat y = v352;
      v381.size.CGFloat width = v130;
      v381.size.CGFloat height = v95;
      double v120 = CGRectGetMaxX(v381);
      double v303 = v130 + v110;
      v121 = v311;
      double v122 = r2_16a;
      double v123 = v361;
      double v118 = v346;
    }
    double v131 = v109 + v120;
    double v132 = v131;
    double v133 = v350;
    CGFloat v134 = v355;
    double v135 = CGRectGetHeight(*(CGRect *)(&v123 - 2));
    double v347 = v118;
    v382.origin.CGFloat x = v118;
    v382.origin.CGFloat y = v116;
    v382.size.CGFloat width = v320;
    v382.size.CGFloat height = r2_24;
    double v136 = CGRectGetHeight(v382);
    double v316 = v97;
    v383.origin.CGFloat x = v97;
    v383.origin.CGFloat y = v116;
    v383.size.CGFloat width = v318;
    v383.size.CGFloat height = v319;
    double v137 = v136 + CGRectGetHeight(v383);
    if (v135 >= v137) {
      double v137 = v135;
    }
    double v127 = v326;
    CGFloat v138 = v116;
  }
  else
  {
    if (v96 >= v85) {
      double v124 = v96;
    }
    else {
      double v124 = v85;
    }
    if (v361 == v124) {
      char v125 = 1;
    }
    else {
      char v125 = v21;
    }
    BOOL v111 = v13;
    if (v125)
    {
      double v126 = v322;
      int v114 = v17;
      double v127 = v326;
      double v128 = v346;
    }
    else
    {
      UIFloorToViewScale(self->_button);
      if (v361 >= v124) {
        double v140 = -0.0;
      }
      else {
        double v140 = v139;
      }
      double v126 = v322 + v140;
      if (v361 < v124) {
        double v139 = -0.0;
      }
      double v97 = v97 + v139;
      double v128 = v346 + v139;
      int v114 = v17;
      double v127 = v326;
    }
    if (v361 >= v124) {
      double v141 = v361;
    }
    else {
      double v141 = v124;
    }
    double v303 = v141;
    double v132 = v126;
    v384.origin.CGFloat x = v126;
    v384.origin.CGFloat y = v350;
    v384.size.CGFloat width = v361;
    v384.size.CGFloat height = v355;
    double v142 = CGRectGetHeight(v384);
    if (v142 >= rect) {
      double v143 = v142;
    }
    else {
      double v143 = rect;
    }
    double v347 = v128;
    v385.origin.CGFloat x = v128;
    CGFloat v138 = v352;
    v385.origin.CGFloat y = v352;
    v385.size.CGFloat width = v320;
    v385.size.CGFloat height = r2_24;
    CGFloat v144 = CGRectGetHeight(v385) + v143;
    double v316 = v97;
    v386.origin.CGFloat x = v97;
    v386.origin.CGFloat y = v352;
    v386.size.CGFloat width = v318;
    v386.size.CGFloat height = v319;
    double v137 = v306 + CGRectGetHeight(v386) + v144;
    v121 = v311;
    double v122 = r2_16a;
  }
  CGFloat v145 = v313;
  double v146 = v323 + v137;
  v147 = v364;
  double v148 = v132;
  if (v19)
  {
    double v149 = r2_8;
    if (v11 == UIUserInterfaceLayoutDirectionRightToLeft)
    {
      double v150 = v301;
      double v148 = v301 + v132;
      double v347 = v301 + v347;
      double v316 = v301 + v316;
      double v151 = r2;
    }
    else
    {
      v387.origin.CGFloat x = v313;
      v387.origin.CGFloat y = v138;
      v387.size.CGFloat width = v303;
      v387.size.CGFloat height = v146;
      CGFloat v153 = CGRectGetMaxX(v387);
      v147 = v364;
      double v313 = v358 + v153;
      double v151 = r2;
      double v150 = v301;
    }
    double v152 = v150 + v303;
    if (v146 < v151) {
      double v146 = v151;
    }
  }
  else
  {
    double v313 = v322;
    double v149 = r2_8;
    double v152 = v303;
  }
  if ([v147 _isRoundButton])
  {
    v388.origin.CGFloat x = v145;
    v388.origin.CGFloat y = v138;
    v388.size.CGFloat width = v152;
    v388.size.CGFloat height = v146;
    CGRectGetWidth(v388);
    UIRoundToViewScale(self->_button);
    v389.origin.CGFloat y = v138;
    double v155 = v154;
    v389.origin.CGFloat x = v145;
    v389.size.CGFloat width = v152;
    v389.size.CGFloat height = v146;
    CGRectGetHeight(v389);
    UIRoundToViewScale(self->_button);
    double v157 = v155 - v156;
    double v158 = v122;
    double v159 = v157 * 0.5;
    if ([v364 _hasSymbolImage])
    {
      double r2_8a = v149;
      double v127 = v127 - v159;
      double v122 = v158 - v159;
    }
    else if (v159 <= 0.0)
    {
      double r2_8a = v149;
      double v127 = v127 - v159;
      double v122 = r2_16a - v159;
    }
    else
    {
      double v299 = v299 + v159;
      double r2_8a = v149 + v159;
      double v122 = r2_16a;
    }
    CGFloat v138 = v352;
  }
  else
  {
    double r2_8a = v149;
  }
  double v327 = v127;
  double r2_16b = v122;
  if (v11 == UIUserInterfaceLayoutDirectionRightToLeft) {
    double v127 = v122;
  }
  v390.origin.CGFloat x = v145;
  v390.origin.CGFloat y = v138;
  v390.size.CGFloat width = v152;
  v390.size.CGFloat height = v146;
  double v160 = v299;
  CGRect v391 = CGRectOffset(v390, v127, v299);
  CGFloat v302 = v391.origin.x;
  CGFloat v304 = v391.size.width;
  CGFloat v296 = v391.size.height;
  CGFloat v297 = v391.origin.y;
  v391.origin.CGFloat x = v148;
  v391.origin.CGFloat y = v350;
  v391.size.CGFloat width = v361;
  v391.size.CGFloat height = v355;
  CGRect v392 = CGRectOffset(v391, v127, v299);
  CGFloat v359 = v392.origin.x;
  double v362 = v392.origin.y;
  CGFloat v353 = v392.size.height;
  CGFloat v356 = v392.size.width;
  v392.origin.CGFloat x = v313;
  v392.origin.CGFloat y = v350;
  v392.size.CGFloat width = v309;
  v392.size.CGFloat height = r2;
  CGRect v393 = CGRectOffset(v392, v127, v299);
  CGFloat v310 = v393.origin.x;
  CGFloat v312 = v393.size.width;
  double v161 = v393.origin.y;
  CGFloat v314 = v393.size.height;
  v393.origin.CGFloat x = v347;
  v393.origin.CGFloat y = v138;
  v393.size.CGFloat width = v320;
  v393.size.CGFloat height = r2_24;
  CGRect v394 = CGRectOffset(v393, v127, v299);
  CGFloat v162 = v394.origin.x;
  CGFloat v163 = v394.origin.y;
  CGFloat v164 = v394.size.width;
  CGFloat v165 = v394.size.height;
  v394.origin.CGFloat x = v316;
  v394.size.CGFloat width = v318;
  v394.origin.CGFloat y = v138;
  v394.size.CGFloat height = v319;
  double v282 = v127;
  CGRect v395 = CGRectOffset(v394, v127, v299);
  CGFloat r2a = v395.origin.x;
  double r2_24a = v395.size.width;
  double v348 = v395.size.height;
  v317.origin.CGFloat x = v162;
  v317.origin.CGFloat y = v163;
  v395.origin.CGFloat x = v162;
  v395.origin.CGFloat y = v163;
  v317.size.CGFloat width = v164;
  v317.size.CGFloat height = v165;
  v395.size.CGFloat width = v164;
  v395.size.CGFloat height = v165;
  double v324 = v323 + CGRectGetMaxY(v395);
  if ((v21 & 1) == 0)
  {
    if ((v315 & 0xA) == 0)
    {
      v401.origin.CGFloat x = v359;
      double v172 = v362;
      v401.origin.CGFloat y = v362;
      v401.size.CGFloat height = v353;
      v401.size.CGFloat width = v356;
      double v173 = CGRectGetHeight(v401);
      double v174 = rect;
      CGFloat v175 = v302;
      if (rect <= v173)
      {
        double v177 = 0.0;
        double v174 = v173;
      }
      else
      {
        UIRoundToViewScale(self->_button);
        double v177 = v176;
      }
      CGFloat v178 = v296;
      if (v315)
      {
        v317.origin.CGFloat y = v317.origin.y + v306 + v174;
        double v324 = v324 + v306 + v174;
      }
      else
      {
        v404.origin.CGFloat x = r2a;
        v404.origin.CGFloat y = v324;
        v404.size.CGFloat width = r2_24a;
        v404.size.CGFloat height = v348;
        double v172 = v306 + CGRectGetMaxY(v404);
      }
      double v362 = v177 + v172;
      CGFloat v179 = v304;
      if (v19) {
        goto LABEL_194;
      }
      goto LABEL_200;
    }
    double v307 = v161;
    v396.origin.CGFloat x = v162;
    v396.origin.CGFloat y = v163;
    v396.size.CGFloat width = v164;
    v396.size.CGFloat height = v165;
    v445.origin.CGFloat x = r2a;
    v445.origin.CGFloat y = v324;
    v445.size.CGFloat width = r2_24a;
    v445.size.CGFloat height = v348;
    CGRect v397 = CGRectUnion(v396, v445);
    CGFloat v166 = v397.origin.x;
    CGFloat v167 = v397.origin.y;
    CGFloat v168 = v397.size.width;
    CGFloat recta = v397.size.height;
    CGRectGetMidY(v397);
    v398.origin.CGFloat x = v359;
    v398.origin.CGFloat y = v362;
    v398.size.CGFloat width = v356;
    v398.size.CGFloat height = v353;
    CGRectGetMidY(v398);
    UIRoundToViewScale(self->_button);
    if (v169 != 0.0)
    {
      double v170 = v169;
      v399.origin.CGFloat x = v359;
      v399.origin.CGFloat y = v362;
      v399.size.CGFloat width = v356;
      v399.size.CGFloat height = v353;
      double v171 = CGRectGetHeight(v399);
      v400.origin.CGFloat x = v166;
      v400.origin.CGFloat y = v167;
      v400.size.CGFloat width = v168;
      v400.size.CGFloat height = recta;
      if (v171 <= CGRectGetHeight(v400))
      {
        double v362 = v362 + v170;
      }
      else
      {
        v317.origin.CGFloat y = v317.origin.y - v170;
        double v324 = v324 - v170;
      }
    }
    double v161 = v307;
    double v160 = v299;
  }
  CGFloat v178 = v296;
  CGFloat v175 = v302;
  CGFloat v179 = v304;
  if (v19)
  {
LABEL_194:
    v402.origin.CGFloat x = v175;
    CGFloat v180 = v297;
    v402.origin.CGFloat y = v297;
    v402.size.CGFloat width = v179;
    v402.size.CGFloat height = v178;
    CGRectGetMidY(v402);
    v403.origin.CGFloat x = v310;
    v403.size.CGFloat width = v312;
    v403.origin.CGFloat y = v161;
    v403.size.CGFloat height = v314;
    CGRectGetMidY(v403);
    UIFloorToViewScale(self->_button);
    double v161 = v161 + v181;
    goto LABEL_201;
  }
LABEL_200:
  CGFloat v180 = v297;
LABEL_201:
  v405.origin.CGFloat x = v175;
  v405.origin.CGFloat y = v180;
  v405.size.CGFloat width = v179;
  v405.size.CGFloat height = v178;
  CGRectGetWidth(v405);
  UIRoundToViewScale(self->_button);
  v406.size.CGFloat height = v178;
  double v183 = v182;
  v406.origin.CGFloat x = v175;
  v406.origin.CGFloat y = v180;
  v406.size.CGFloat width = v179;
  CGRectGetHeight(v406);
  UIRoundToViewScale(self->_button);
  if (v40 && v111) {
    double v185 = v284;
  }
  else {
    double v185 = v183;
  }
  if (v40 && v111) {
    double v186 = v286;
  }
  else {
    double v186 = v184;
  }
  double v285 = v184;
  double v287 = v183;
  BOOL v187 = v185 == v183 && v186 == v184;
  CGFloat v308 = v161;
  CGFloat v300 = v185;
  CGFloat rectb = v186;
  if (v187)
  {
    BOOL v195 = (v329 | v321) != 0;
    double v197 = v353;
    double v196 = v356;
    double v198 = v359;
    double v199 = v362;
    goto LABEL_260;
  }
  if (v11 == UIUserInterfaceLayoutDirectionRightToLeft) {
    double v188 = v327;
  }
  else {
    double v188 = r2_16b;
  }
  double v189 = v322 + v282;
  double v190 = v350 + v160;
  double v191 = v185 - (v282 + v188);
  double v192 = v186 - (r2_8a + v160);
  UIControlContentHorizontalAlignment v193 = [(UIControl *)self->_button contentHorizontalAlignment];
  double v283 = v191;
  if (v193 == UIControlContentHorizontalAlignmentTrailing)
  {
    CGFloat v194 = v296;
    if (v11 != UIUserInterfaceLayoutDirectionRightToLeft) {
      goto LABEL_229;
    }
  }
  else
  {
    CGFloat v194 = v296;
    if (v193 == UIControlContentHorizontalAlignmentLeading)
    {
      if (v11 == UIUserInterfaceLayoutDirectionRightToLeft)
      {
LABEL_229:
        v409.origin.CGFloat x = v189;
        v409.origin.CGFloat y = v350 + v160;
        v409.size.CGFloat width = v191;
        v409.size.CGFloat height = v192;
        CGRectGetMaxX(v409);
        v410.origin.CGFloat x = v302;
        v410.size.CGFloat width = v304;
        v410.origin.CGFloat y = v297;
        v410.size.CGFloat height = v194;
        CGRectGetMaxX(v410);
        goto LABEL_230;
      }
    }
    else
    {
      char v200 = v292;
      if (v193 != UIControlContentHorizontalAlignmentFill) {
        char v200 = 1;
      }
      if ((v315 & 0xA) == 0) {
        char v200 = 1;
      }
      if (!(v200 & 1 | ((v329 | v321) == 0)))
      {
        v416.origin.CGFloat x = v189;
        v416.origin.CGFloat y = v350 + v160;
        v416.size.CGFloat width = v191;
        v416.size.CGFloat height = v192;
        CGRectGetMinX(v416);
        v417.origin.CGFloat x = v302;
        v417.origin.CGFloat y = v297;
        v417.size.CGFloat width = v304;
        v417.size.CGFloat height = v296;
        CGRectGetMinX(v417);
        v418.origin.CGFloat x = v189;
        v418.origin.CGFloat y = v350 + v160;
        v418.size.CGFloat width = v191;
        v418.size.CGFloat height = v192;
        CGRectGetMaxX(v418);
        v419.origin.CGFloat x = v302;
        v419.origin.CGFloat y = v297;
        v419.size.CGFloat width = v304;
        v419.size.CGFloat height = v296;
        CGRectGetMaxX(v419);
        button = self->_button;
        if (v11 == UIUserInterfaceLayoutDirectionRightToLeft)
        {
          UICeilToViewScale(button);
          CGFloat r2_16c = v215;
          UICeilToViewScale(self->_button);
        }
        else
        {
          UIFloorToViewScale(button);
          CGFloat r2_16c = v281;
          UIFloorToViewScale(self->_button);
        }
        CGFloat r2_8b = v216;
        CGFloat v203 = v297;
        double v190 = v350 + v160;
        goto LABEL_234;
      }
      if (v193 == UIControlContentHorizontalAlignmentRight) {
        goto LABEL_229;
      }
      if (v193 != UIControlContentHorizontalAlignmentLeft)
      {
        v443.origin.CGFloat x = v189;
        v443.origin.CGFloat y = v350 + v160;
        v443.size.CGFloat width = v191;
        v443.size.CGFloat height = v192;
        CGRectGetMidX(v443);
        v444.origin.CGFloat x = v302;
        v444.size.CGFloat width = v304;
        v444.origin.CGFloat y = v297;
        v444.size.CGFloat height = v296;
        CGRectGetMidX(v444);
        goto LABEL_230;
      }
    }
  }
  v407.origin.CGFloat x = v189;
  v407.origin.CGFloat y = v350 + v160;
  v407.size.CGFloat width = v191;
  v407.size.CGFloat height = v192;
  CGRectGetMinX(v407);
  v408.origin.CGFloat x = v302;
  v408.size.CGFloat width = v304;
  v408.origin.CGFloat y = v297;
  v408.size.CGFloat height = v194;
  CGRectGetMinX(v408);
LABEL_230:
  v201 = self->_button;
  if (v11 == UIUserInterfaceLayoutDirectionRightToLeft) {
    UICeilToViewScale(v201);
  }
  else {
    UIFloorToViewScale(v201);
  }
  CGFloat r2_8b = v202;
  CGFloat r2_16c = v202;
  CGFloat v203 = v297;
LABEL_234:
  UIControlContentVerticalAlignment v204 = [(UIControl *)self->_button contentVerticalAlignment];
  UIControlContentVerticalAlignment v205 = v204;
  char v206 = v288 ^ 1;
  if ((v315 & 0xA) != 0) {
    char v206 = 1;
  }
  if (v204 != UIControlContentVerticalAlignmentFill) {
    char v206 = 1;
  }
  if (v206 & 1 | ((v329 | v321) == 0))
  {
    double v207 = v189;
    double v208 = v190;
    double v209 = v191;
    double v210 = v192;
    if (v204 == UIControlContentVerticalAlignmentBottom)
    {
      CGRectGetMaxY(*(CGRect *)&v207);
      v420.origin.CGFloat x = v302;
      v420.size.CGFloat width = v304;
      v420.origin.CGFloat y = v203;
      v420.size.CGFloat height = v194;
      CGRectGetMaxY(v420);
    }
    else if (v204 == UIControlContentVerticalAlignmentTop)
    {
      CGRectGetMinY(*(CGRect *)&v207);
      v411.origin.CGFloat x = v302;
      v411.size.CGFloat width = v304;
      v411.origin.CGFloat y = v203;
      v411.size.CGFloat height = v194;
      CGRectGetMinY(v411);
    }
    else
    {
      CGRectGetMidY(*(CGRect *)&v207);
      v421.origin.CGFloat x = v302;
      v421.size.CGFloat width = v304;
      v421.origin.CGFloat y = v203;
      v421.size.CGFloat height = v194;
      CGRectGetMidY(v421);
    }
    UIFloorToViewScale(self->_button);
    CGFloat v212 = v213;
  }
  else
  {
    v412.origin.CGFloat x = v189;
    v412.origin.CGFloat y = v190;
    v412.size.CGFloat width = v191;
    v412.size.CGFloat height = v192;
    CGRectGetMinY(v412);
    v413.origin.CGFloat x = v302;
    v413.origin.CGFloat y = v203;
    v413.size.CGFloat width = v304;
    v413.size.CGFloat height = v194;
    CGRectGetMinY(v413);
    v414.origin.CGFloat x = v189;
    v414.origin.CGFloat y = v190;
    v414.size.CGFloat width = v191;
    v414.size.CGFloat height = v192;
    CGRectGetMaxY(v414);
    v415.origin.CGFloat x = v302;
    v415.size.CGFloat height = v296;
    v415.origin.CGFloat y = v297;
    v415.size.CGFloat width = v304;
    CGRectGetMaxY(v415);
    UIFloorToViewScale(self->_button);
    CGFloat v212 = v211;
    UIFloorToViewScale(self->_button);
  }
  CGFloat v217 = v213;
  if (v19)
  {
    double v218 = v350 + v160;
    double v219 = v189;
    double v220 = v350 + v160;
    double v221 = v283;
    double v222 = v192;
    if (v11 == UIUserInterfaceLayoutDirectionRightToLeft)
    {
      double MinX = CGRectGetMinX(*(CGRect *)&v219);
      v422.origin.CGFloat x = v302;
      v422.size.CGFloat width = v304;
      v422.size.CGFloat height = v296;
      CGFloat v224 = v297;
      v422.origin.CGFloat y = v297;
      double v225 = CGRectGetMinX(v422);
    }
    else
    {
      double MinX = CGRectGetMaxX(*(CGRect *)&v219);
      v423.origin.CGFloat x = v302;
      v423.size.CGFloat width = v304;
      v423.size.CGFloat height = v296;
      CGFloat v224 = v297;
      v423.origin.CGFloat y = v297;
      double v225 = CGRectGetMaxX(v423);
    }
    double v226 = MinX - v225;
    BOOL v195 = (v329 | v321) != 0;
    double v228 = v189;
    double v229 = v218;
    double v230 = v283;
    double v231 = v192;
    if (v205 == UIControlContentVerticalAlignmentBottom)
    {
      double MaxY = CGRectGetMaxY(*(CGRect *)&v228);
      v425.origin.CGFloat x = v302;
      v425.size.CGFloat width = v304;
      v425.origin.CGFloat y = v224;
      v425.size.CGFloat height = v296;
      double MinY = CGRectGetMaxY(v425);
    }
    else if (v205 == UIControlContentVerticalAlignmentTop)
    {
      double MaxY = CGRectGetMinY(*(CGRect *)&v228);
      v424.origin.CGFloat x = v302;
      v424.size.CGFloat width = v304;
      v424.origin.CGFloat y = v224;
      v424.size.CGFloat height = v296;
      double MinY = CGRectGetMinY(v424);
    }
    else
    {
      double MaxY = CGRectGetMidY(*(CGRect *)&v228);
      v426.origin.CGFloat x = v302;
      v426.size.CGFloat width = v304;
      v426.origin.CGFloat y = v224;
      v426.size.CGFloat height = v296;
      double MinY = CGRectGetMidY(v426);
    }
    double v227 = MaxY - MinY;
  }
  else
  {
    double v226 = 0.0;
    double v227 = 0.0;
    BOOL v195 = (v329 | v321) != 0;
  }
  v427.origin.CGFloat x = v359;
  v427.origin.CGFloat y = v362;
  v427.size.CGFloat height = v353;
  v427.size.CGFloat width = v356;
  CGRect v428 = CGRectOffset(v427, r2_8b, v217);
  double v198 = v428.origin.x;
  double v199 = v428.origin.y;
  double v196 = v428.size.width;
  double v197 = v428.size.height;
  v428.origin.CGFloat y = v308;
  v428.origin.CGFloat x = v310;
  v428.size.CGFloat width = v312;
  v428.size.CGFloat height = v314;
  CGRect v429 = CGRectOffset(v428, v226, v227);
  CGFloat v308 = v429.origin.y;
  CGFloat v310 = v429.origin.x;
  CGFloat v312 = v429.size.width;
  CGFloat v314 = v429.size.height;
  CGRect v317 = CGRectOffset(v317, r2_16c, v212);
  v430.origin.CGFloat x = r2a;
  v430.origin.CGFloat y = v324;
  v430.size.CGFloat width = r2_24a;
  v430.size.CGFloat height = v348;
  CGRect v431 = CGRectOffset(v430, r2_16c, v212);
  CGFloat r2a = v431.origin.x;
  double v324 = v431.origin.y;
  double r2_24a = v431.size.width;
  double v348 = v431.size.height;
LABEL_260:
  double v360 = v198;
  double v363 = v199;
  double v357 = v196;
  -[UIView frameForAlignmentRect:](self->_imageView, "frameForAlignmentRect:", v198, v199, v196, v197);
  CGFloat r2_8c = v235;
  CGFloat r2_16d = v234;
  double v237 = v236;
  double v239 = v238;
  if (v121) {
    char v240 = v114;
  }
  else {
    char v240 = 1;
  }
  double v241 = 0.0;
  if (v240)
  {
    double v242 = 0.0;
  }
  else
  {
    double v242 = 0.0;
    if ([(UIImageView *)self->_imageView _hasBaseline])
    {
      -[UIImageView _baselineOffsetsAtSize:](self->_imageView, "_baselineOffsetsAtSize:", v237, v239);
      double v244 = v243;
      double v246 = v245;
      [(UIImageView *)self->_imageView alignmentRectInsets];
      double v241 = v244 + v247;
      double v242 = v246 + v248;
    }
  }
  CGFloat v354 = v197;
  if (v195)
  {
    if (v329) {
      uint64_t v249 = 24;
    }
    else {
      uint64_t v249 = 32;
    }
    v250 = *(Class *)((char *)&self->super.isa + v249);
    double v328 = v242;
    if (v329) {
      double v251 = v317.size.height;
    }
    else {
      double v251 = v348;
    }
    if (v329) {
      double v252 = v317.size.width;
    }
    else {
      double v252 = r2_24a;
    }
    id v253 = v250;
    objc_msgSend(v253, "_baselineOffsetsAtSize:", v252, v251);
    double v255 = v254;
    if (v321) {
      uint64_t v256 = 32;
    }
    else {
      uint64_t v256 = 24;
    }
    BOOL v40 = v291;
    v257 = *(Class *)((char *)&self->super.isa + v256);
    if (v321) {
      double v258 = v348;
    }
    else {
      double v258 = v317.size.height;
    }
    if (v321) {
      double v259 = r2_24a;
    }
    else {
      double v259 = v317.size.width;
    }
    id v260 = v257;
    double v261 = v259;
    double v262 = v255;
    double v263 = v258;
    double v242 = v328;
    objc_msgSend(v260, "_baselineOffsetsAtSize:", v261, v263);
    double v265 = v264;

    if (!v121) {
      goto LABEL_294;
    }
  }
  else
  {
    double v265 = 0.0;
    double v262 = 0.0;
    if (!v121)
    {
      if (!v114)
      {
        double r2_8d = 0.0;
        double r2_16e = 0.0;
        goto LABEL_301;
      }
      goto LABEL_296;
    }
  }
  if ((v114 & 1) != 0 || [(UIImageView *)self->_imageView _hasBaseline] || (v329 | v321) == 0)
  {
    if ((v292 | v195))
    {
      BOOL v266 = [(UIImageView *)self->_imageView _hasBaseline];
      double v267 = 0.0;
      double v268 = 0.0;
      if (v266 && v195)
      {
        v432.origin.CGFloat x = r2_16d;
        v432.origin.CGFloat y = r2_8c;
        v432.size.CGFloat width = v237;
        v432.size.CGFloat height = v239;
        CGRectGetMinY(v432);
        v433.origin.CGFloat x = v322;
        v433.origin.CGFloat y = v350;
        v433.size.CGFloat width = v300;
        v433.size.CGFloat height = rectb;
        CGRectGetMaxY(v433);
        v434.origin.CGFloat x = r2_16d;
        v434.origin.CGFloat y = r2_8c;
        v434.size.CGFloat width = v237;
        v434.size.CGFloat height = v239;
        CGRectGetMaxY(v434);
        CGRectGetMinY(v317);
        v435.origin.CGFloat x = v322;
        v435.origin.CGFloat y = v350;
        v435.size.CGFloat width = v300;
        v435.size.CGFloat height = rectb;
        CGRectGetMaxY(v435);
        v436.origin.CGFloat x = r2a;
        v436.origin.CGFloat y = v324;
        v436.size.CGFloat width = r2_24a;
        v436.size.CGFloat height = v348;
        CGRectGetMaxY(v436);
        UIRoundToViewScale(self->_button);
        double v268 = v269;
        UIRoundToViewScale(self->_button);
      }
      goto LABEL_298;
    }
LABEL_296:
    v438.origin.CGFloat y = r2_8c;
    v438.origin.CGFloat x = r2_16d;
    v438.size.CGFloat width = v237;
    v438.size.CGFloat height = v239;
    double v268 = v241 + CGRectGetMinY(v438);
    v439.origin.CGFloat x = v322;
    v439.origin.CGFloat y = v350;
    v439.size.CGFloat width = v300;
    v439.size.CGFloat height = rectb;
    double v270 = CGRectGetMaxY(v439);
    goto LABEL_297;
  }
LABEL_294:
  double v268 = v262 + CGRectGetMinY(v317);
  v437.origin.CGFloat x = v322;
  v437.origin.CGFloat y = v350;
  v437.size.CGFloat width = v300;
  v437.size.CGFloat height = rectb;
  double v270 = CGRectGetMaxY(v437);
  CGFloat r2_8c = v324;
  CGFloat r2_16d = r2a;
  double v237 = r2_24a;
  double v239 = v348;
  double v242 = v265;
LABEL_297:
  v440.origin.CGFloat y = r2_8c;
  v440.origin.CGFloat x = r2_16d;
  v440.size.CGFloat width = v237;
  v440.size.CGFloat height = v239;
  double v267 = v242 + v270 - CGRectGetMaxY(v440);
  if (v121)
  {
LABEL_298:
    double r2_8d = v267;
    double r2_16e = v268;
    -[UIView frameForAlignmentRect:](self->_imageView, "frameForAlignmentRect:", v360, v363, v357, v197);
    double v357 = v272;
    double v360 = v271;
    CGFloat v274 = v273;
    CGFloat v354 = v275;
    goto LABEL_302;
  }
  double r2_8d = v267;
  double r2_16e = v268;
LABEL_301:
  CGFloat v274 = v363;
LABEL_302:
  v446.origin.CGFloat x = r2a;
  v446.origin.CGFloat y = v324;
  v446.size.CGFloat width = r2_24a;
  v446.size.CGFloat height = v348;
  CGRect v447 = CGRectUnion(v317, v446);
  v441.origin.CGFloat x = v360;
  v441.origin.CGFloat y = v274;
  v441.size.CGFloat width = v357;
  v441.size.CGFloat height = v354;
  CGRect v442 = CGRectUnion(v441, v447);
  if (v287 >= v442.size.width) {
    double v276 = v287;
  }
  else {
    double v276 = v442.size.width;
  }
  if (v40) {
    double v276 = v287;
  }
  *(void *)&retstr->var7 = 0;
  if (v285 >= v442.size.height) {
    double v277 = v285;
  }
  else {
    double v277 = v442.size.height;
  }
  retstr->var0.origin.CGFloat x = v322;
  retstr->var0.origin.CGFloat y = v350;
  if (v111) {
    double v277 = v285;
  }
  retstr->var0.size.CGFloat width = v300;
  retstr->var0.size.CGFloat height = rectb;
  retstr->var1.CGFloat width = v276;
  retstr->var1.CGFloat height = v277;
  retstr->var2.origin.CGFloat x = v360;
  retstr->var2.origin.CGFloat y = v274;
  retstr->var2.size.CGFloat width = v357;
  retstr->var2.size.CGFloat height = v354;
  retstr->var3.origin.CGFloat x = v310;
  retstr->var3.origin.CGFloat y = v308;
  retstr->var3.size.CGFloat width = v312;
  retstr->var3.size.CGFloat height = v314;
  retstr->var4.origin.CGFloat x = v317.origin.x;
  retstr->var4.origin.CGFloat y = v317.origin.y;
  retstr->var4.size.CGFloat width = v317.size.width;
  retstr->var4.size.CGFloat height = v317.size.height;
  retstr->var5.origin.CGFloat x = r2a;
  retstr->var5.origin.CGFloat y = v324;
  retstr->var5.size.CGFloat width = r2_24a;
  retstr->var5.size.CGFloat height = v348;
  retstr->var6.var0 = r2_16e;
  retstr->var6.var1 = r2_8d;
  if (v114) {
    char v278 = 8;
  }
  else {
    char v278 = 0;
  }
  if (v121) {
    char v279 = 3;
  }
  else {
    char v279 = 1;
  }
  *(unsigned char *)&retstr->var7 = v278 | v279 | (4 * (v19 != 0)) | (16 * (v329 != 0)) | (32 * (v321 != 0));

  return result;
}

- (void)_updateTitleLabelWithConfiguration:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  double v5 = [v4 _resolvedTitle];
  if (v5)
  {
    id v6 = [(UIButtonConfigurationVisualProvider *)self titleViewCreateIfNeeded:1];
    if (!self->_titleLabel)
    {
      if (os_variant_has_internal_diagnostics())
      {
        double v10 = __UIFaultDebugAssertLog();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
        {
          button = self->_button;
          int v12 = 138412290;
          BOOL v13 = button;
          _os_log_fault_impl(&dword_1853B0000, v10, OS_LOG_TYPE_FAULT, "UIKIT INTERNAL ERROR: Failed to create a title label for configuration based button %@", (uint8_t *)&v12, 0xCu);
        }
      }
      else
      {
        int v8 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &_updateTitleLabelWithConfiguration____s_category) + 8);
        if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        {
          id v9 = self->_button;
          int v12 = 138412290;
          BOOL v13 = v9;
          _os_log_impl(&dword_1853B0000, v8, OS_LOG_TYPE_ERROR, "UIKIT INTERNAL ERROR: Failed to create a title label for configuration based button %@", (uint8_t *)&v12, 0xCu);
        }
      }
    }
    id v7 = [(UIButtonConfigurationVisualProvider *)self effectiveContentView];
    [v7 addSubview:self->_titleLabel];

    [(UILabel *)self->_titleLabel setAttributedText:v5];
    -[UILabel setNumberOfLines:](self->_titleLabel, "setNumberOfLines:", [v4 _hasMultilineTitle] ^ 1);
    -[UILabel setLineBreakMode:](self->_titleLabel, "setLineBreakMode:", [v4 titleLineBreakMode]);
  }
  else
  {
    [(UIView *)self->_titleLabel removeFromSuperview];
  }
}

- (void)_updateSubtitleLabelWithConfiguration:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  double v5 = [v4 _resolvedSubtitle];
  if (v5)
  {
    id v6 = [(UIButtonConfigurationVisualProvider *)self subtitleViewCreateIfNeeded:1];
    if (!self->_subtitleLabel)
    {
      if (os_variant_has_internal_diagnostics())
      {
        int v12 = __UIFaultDebugAssertLog();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
        {
          button = self->_button;
          int v14 = 138412290;
          uint64_t v15 = button;
          _os_log_fault_impl(&dword_1853B0000, v12, OS_LOG_TYPE_FAULT, "UIKIT INTERNAL ERROR: Failed to create a subtitle label for configuration based button %@", (uint8_t *)&v14, 0xCu);
        }
      }
      else
      {
        int v8 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &_updateSubtitleLabelWithConfiguration____s_category)
                          + 8);
        if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        {
          id v9 = self->_button;
          int v14 = 138412290;
          uint64_t v15 = v9;
          _os_log_impl(&dword_1853B0000, v8, OS_LOG_TYPE_ERROR, "UIKIT INTERNAL ERROR: Failed to create a subtitle label for configuration based button %@", (uint8_t *)&v14, 0xCu);
        }
      }
      if (!self->_subtitleLabel)
      {
        double v10 = (UILabel *)objc_opt_new();
        subtitleLabel = self->_subtitleLabel;
        self->_subtitleLabel = v10;
      }
    }
    id v7 = [(UIButtonConfigurationVisualProvider *)self effectiveContentView];
    [v7 addSubview:self->_subtitleLabel];

    [(UILabel *)self->_subtitleLabel setAttributedText:v5];
    -[UILabel setNumberOfLines:](self->_subtitleLabel, "setNumberOfLines:", [v4 _hasMultilineSubtitle] ^ 1);
    -[UILabel setLineBreakMode:](self->_subtitleLabel, "setLineBreakMode:", [v4 subtitleLineBreakMode]);
  }
  else
  {
    [(UIView *)self->_subtitleLabel removeFromSuperview];
  }
}

- (void)_updateProgressIndicatorWithConfiguration:(id)a3
{
  id v8 = a3;
  if ([v8 showsActivityIndicator])
  {
    [(UIView *)self->_imageView removeFromSuperview];
    if (!self->_progressIndicatorView)
    {
      id v4 = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:16];
      progressIndicatorView = self->_progressIndicatorView;
      self->_progressIndicatorView = v4;
    }
    [v8 _resolvedActivityIndicatorSize];
    UIRoundToViewScale(self->_button);
    -[UIActivityIndicatorView _setCustomWidth:](self->_progressIndicatorView, "_setCustomWidth:");
    [(UIActivityIndicatorView *)self->_progressIndicatorView startAnimating];
    id v6 = [(UIButtonConfigurationVisualProvider *)self effectiveContentView];
    [v6 addSubview:self->_progressIndicatorView];

    id v7 = [v8 _resolvedActivityIndicatorColor];
    [(UIActivityIndicatorView *)self->_progressIndicatorView setColor:v7];
  }
  else
  {
    [(UIView *)self->_progressIndicatorView removeFromSuperview];
  }
}

- (void)_updateIndicatorWithConfiguration:(id)a3
{
  id v11 = a3;
  id v4 = [v11 _resolvedIndicator];
  indicatorView = self->_indicatorView;
  if (v4)
  {
    if (!indicatorView)
    {
      id v6 = (UIImageView *)objc_opt_new();
      id v7 = self->_indicatorView;
      self->_indicatorView = v6;
    }
    id v8 = [(UIButtonConfigurationVisualProvider *)self effectiveContentView];
    [v8 addSubview:self->_indicatorView];

    [(UIImageView *)self->_indicatorView setImage:v4];
    id v9 = [v11 _resolvedIndicatorSymbolConfiguration];
    [(UIImageView *)self->_indicatorView setPreferredSymbolConfiguration:v9];

    double v10 = [v11 _resolvedIndicatorColor];
    [(UIView *)self->_indicatorView setTintColor:v10];
  }
  else
  {
    [(UIView *)indicatorView removeFromSuperview];
  }
}

- (void)_updateImageViewWithConfiguration:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  double v5 = [v4 _resolvedImage];
  if (v5)
  {
    id v6 = [(UIButtonConfigurationVisualProvider *)self imageViewCreateIfNeeded:1];
    if (!self->_imageView)
    {
      if (os_variant_has_internal_diagnostics())
      {
        uint64_t v15 = __UIFaultDebugAssertLog();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
        {
          button = self->_button;
          int v17 = 138412290;
          int v18 = button;
          _os_log_fault_impl(&dword_1853B0000, v15, OS_LOG_TYPE_FAULT, "UIKIT INTERNAL ERROR: Failed to create an image view for configuration based button %@", (uint8_t *)&v17, 0xCu);
        }
      }
      else
      {
        BOOL v13 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &_updateImageViewWithConfiguration____s_category) + 8);
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        {
          int v14 = self->_button;
          int v17 = 138412290;
          int v18 = v14;
          _os_log_impl(&dword_1853B0000, v13, OS_LOG_TYPE_ERROR, "UIKIT INTERNAL ERROR: Failed to create an image view for configuration based button %@", (uint8_t *)&v17, 0xCu);
        }
      }
    }
    id v7 = [(UIButtonConfigurationVisualProvider *)self effectiveContentView];
    [v7 addSubview:self->_imageView];

    [(UIImageView *)self->_imageView setImage:v5];
    id v8 = [v4 _resolvedSymbolConfiguration];
    [(UIImageView *)self->_imageView setPreferredSymbolConfiguration:v8];

    id v9 = [v4 _resolvedImageColor];
    [(UIView *)self->_imageView setTintColor:v9];

    if ([(UIControl *)self->_button _allowsSymbolAnimations])
    {
      char v10 = [(UIControl *)self->_button state];
      imageView = self->_imageView;
      int v12 = [MEMORY[0x1E4F41A68] scaleDownEffect];
      if (v10) {
        [(UIImageView *)imageView addSymbolEffect:v12];
      }
      else {
        [(UIImageView *)imageView removeSymbolEffectOfType:v12];
      }
    }
  }
  else
  {
    [(UIView *)self->_imageView removeFromSuperview];
  }
}

- (id)effectiveContentView
{
  return self->_button;
}

- ($715CDB9500DB0530738687119A983978)_layoutDataInBounds:(SEL)a3
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  [(UIButtonConfigurationVisualProvider *)self updateConfigurationIfNecessary];
  id v10 = [(UIButton *)self->_button _currentConfiguration];
  -[UIButtonConfigurationVisualProvider _layoutDataInBounds:forConfiguration:](self, "_layoutDataInBounds:forConfiguration:", v10, x, y, width, height);

  return result;
}

- (BOOL)hasMultilineText
{
  [(UIButtonConfigurationVisualProvider *)self updateConfigurationIfNecessary];
  double v3 = [(UIButton *)self->_button _currentConfiguration];
  if ([v3 _hasMultilineTitle]) {
    char v4 = 1;
  }
  else {
    char v4 = [v3 _hasMultilineSubtitle];
  }

  return v4;
}

- (void)updateConfigurationIfNecessary
{
  if (*(unsigned char *)&self->_flags)
  {
    *(unsigned char *)&self->_flags &= ~1u;
    if (_UIObservationTrackingEnabled())
    {
      button = self->_button;
      [(UIButton *)button _updateConfigurationWithObservationTracking:self];
    }
    else
    {
      [(UIButtonConfigurationVisualProvider *)self _executeConfigurationUpdate];
    }
  }
}

- (id)imageViewCreateIfNeeded:(BOOL)a3
{
  if (a3 && !self->_imageView)
  {
    char v4 = (UIImageView *)objc_opt_new();
    imageView = self->_imageView;
    self->_imageView = v4;
  }
  id v6 = self->_imageView;
  return v6;
}

- ($715CDB9500DB0530738687119A983978)_layoutDataUpdatingIfNecessary
{
  p_double height = &self->var1.height;
  if ((LOBYTE(self[1].var1.width) & 1) == 0)
  {
    double v5 = self;
    [($715CDB9500DB0530738687119A983978 *)self _layoutBounds];
    self = ($715CDB9500DB0530738687119A983978 *)[($715CDB9500DB0530738687119A983978 *)v5 _layoutDataInBounds:"_layoutDataInBounds:"];
    long long v6 = v29;
    *((_OWORD *)p_height + 10) = v28;
    *((_OWORD *)p_height + 11) = v6;
    *((void *)p_height + 24) = v30;
    long long v7 = v25;
    *((_OWORD *)p_height + 6) = v24;
    *((_OWORD *)p_height + 7) = v7;
    long long v8 = v27;
    *((_OWORD *)p_height + 8) = v26;
    *((_OWORD *)p_height + 9) = v8;
    long long v9 = v21;
    *((_OWORD *)p_height + 2) = v20;
    *((_OWORD *)p_height + 3) = v9;
    long long v10 = v23;
    *((_OWORD *)p_height + 4) = v22;
    *((_OWORD *)p_height + 5) = v10;
    long long v11 = v19;
    *(_OWORD *)p_double height = v18;
    *((_OWORD *)p_height + 1) = v11;
  }
  $F24F406B2B787EFB06265DBA3D28CBD5 v12 = ($F24F406B2B787EFB06265DBA3D28CBD5)*((_OWORD *)p_height + 11);
  retstr->var5.size = (CGSize)*((_OWORD *)p_height + 10);
  retstr->var6 = v12;
  *(CGFloat *)&retstr->var7 = p_height[24];
  CGPoint v13 = (CGPoint)*((_OWORD *)p_height + 7);
  retstr->var3.size = (CGSize)*((_OWORD *)p_height + 6);
  retstr->var4.origin = v13;
  CGPoint v14 = (CGPoint)*((_OWORD *)p_height + 9);
  retstr->var4.size = (CGSize)*((_OWORD *)p_height + 8);
  retstr->var5.origin = v14;
  CGPoint v15 = (CGPoint)*((_OWORD *)p_height + 3);
  retstr->var1 = (CGSize)*((_OWORD *)p_height + 2);
  retstr->var2.origin = v15;
  CGPoint v16 = (CGPoint)*((_OWORD *)p_height + 5);
  retstr->var2.size = (CGSize)*((_OWORD *)p_height + 4);
  retstr->var3.origin = v16;
  CGSize v17 = (CGSize)*((_OWORD *)p_height + 1);
  retstr->var0.origin = *(CGPoint *)p_height;
  retstr->var0.size = v17;
  return self;
}

- (CGSize)intrinsicSizeWithinSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  [(UIButtonConfigurationVisualProvider *)self updateConfigurationIfNecessary];
  -[UIButtonConfigurationVisualProvider _layoutDataInBounds:](self, "_layoutDataInBounds:", *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8), width, height, 0, 0, 0, 0);
  double v7 = 0.0;
  double v6 = 0.0;
  result.double height = v7;
  result.double width = v6;
  return result;
}

- (id)titleViewCreateIfNeeded:(BOOL)a3
{
  if (a3 && !self->_titleLabel)
  {
    char v4 = (UILabel *)objc_opt_new();
    titleLabel = self->_titleLabel;
    self->_titleLabel = v4;
  }
  double v6 = self->_titleLabel;
  return v6;
}

- (CGRect)_layoutBounds
{
  if (![(UIView *)self->_button _wantsAutolayout]) {
    goto LABEL_5;
  }
  uint64_t v3 = [(UIView *)self->_button superview];
  if (!v3
    || (char v4 = (void *)v3,
        [(UIView *)self->_button superview],
        double v5 = objc_claimAutoreleasedReturnValue(),
        int v6 = objc_msgSend(v5, "_is_needsLayout"),
        v5,
        v4,
        v6))
  {
    double v7 = *MEMORY[0x1E4F1DAD8];
    double v8 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
    double widthForMultilineTextLayout = self->_widthForMultilineTextLayout;
    double v10 = 0.0;
  }
  else
  {
LABEL_5:
    [(UIView *)self->_button bounds];
  }
  result.size.double height = v10;
  result.size.double width = widthForMultilineTextLayout;
  result.origin.double y = v8;
  result.origin.double x = v7;
  return result;
}

+ (id)visualProviderForButton:(id)a3
{
  uint64_t v3 = (unsigned char *)objc_opt_new();
  v3[248] |= 1u;
  return v3;
}

- (UIButtonConfigurationVisualProvider)init
{
  v5.receiver = self;
  v5.super_class = (Class)UIButtonConfigurationVisualProvider;
  double v2 = [(UIButtonConfigurationVisualProvider *)&v5 init];
  if (v2 && [(id)objc_opt_class() wantsConfigurationUpdateForButtonShapes])
  {
    uint64_t v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
    v2->_accessibilityButtonShapesChangedToken = [v3 _addObserver:v2 selector:sel__accessibilityButtonShapesChangedNotification_ name:@"UIAccessibilityButtonShapesEnabledStatusDidChangeNotification" object:0 options:0];
  }
  return v2;
}

+ (BOOL)wantsConfigurationUpdateForButtonShapes
{
  return 1;
}

- (CGRect)titleRectForContentRect:(CGRect)a3
{
  double v3 = *MEMORY[0x1E4F1DB28];
  double v4 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  double v5 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  double v6 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  result.size.double height = v6;
  result.size.double width = v5;
  result.origin.double y = v4;
  result.origin.double x = v3;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backgroundView, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_storeStrong((id *)&self->_subtitleLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_progressIndicatorView, 0);
  objc_storeStrong((id *)&self->_indicatorView, 0);
}

- (void)dealloc
{
  _unregisterAccessibilityNotifications((uint64_t)self);
  v3.receiver = self;
  v3.super_class = (Class)UIButtonConfigurationVisualProvider;
  [(UIButtonConfigurationVisualProvider *)&v3 dealloc];
}

- (void)setTitle:(id)a3 forState:(unint64_t)a4
{
}

- (void)setContentHorizontalAlignment:(int64_t)a3
{
}

- (double)widthForMultilineTextLayout
{
  return self->_widthForMultilineTextLayout;
}

- (id)subtitleViewCreateIfNeeded:(BOOL)a3
{
  if (a3 && !self->_subtitleLabel)
  {
    double v4 = (UILabel *)objc_opt_new();
    subtitleLabel = self->_subtitleLabel;
    self->_subtitleLabel = v4;
  }
  double v6 = self->_subtitleLabel;
  return v6;
}

- (void)cleanupForVisualProvider:(id)a3
{
  [(UIView *)self->_backgroundView removeFromSuperview];
  [(UIView *)self->_imageView removeFromSuperview];
  [(UIView *)self->_titleLabel removeFromSuperview];
  [(UIView *)self->_subtitleLabel removeFromSuperview];
  _unregisterAccessibilityNotifications((uint64_t)self);
}

- (void)setPreferredSymbolConfiguration:(id)a3 forImageInState:(unint64_t)a4
{
}

- (void)setHighlighted:(BOOL)a3 animated:(BOOL)a4
{
}

- (BOOL)isOn
{
  return 1;
}

- (void)_accessibilityButtonShapesChangedNotification:(id)a3
{
}

- (id)contextMenuInteraction:(id)a3 configurationForMenuAtLocation:(CGPoint)a4
{
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __93__UIButtonConfigurationVisualProvider_contextMenuInteraction_configurationForMenuAtLocation___block_invoke;
  v6[3] = &unk_1E52DD380;
  v6[4] = self;
  double v4 = +[UIContextMenuConfiguration configurationWithIdentifier:0 previewProvider:0 actionProvider:v6];
  return v4;
}

id __93__UIButtonConfigurationVisualProvider_contextMenuInteraction_configurationForMenuAtLocation___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  double v4 = [*(id *)(*(void *)(a1 + 32) + 280) menu];
  double v5 = [*(id *)(*(void *)(a1 + 32) + 280) _menuProvider];

  if (v5)
  {
    double v6 = [*(id *)(*(void *)(a1 + 32) + 280) _menuProvider];
    uint64_t v7 = ((void (**)(void, void, id))v6)[2](v6, *(void *)(a1 + 32), v3);

    double v4 = (void *)v7;
    if (!v7)
    {
      if ([*(id *)(*(void *)(a1 + 32) + 280) showsMenuAsPrimaryAction])
      {
        if (os_variant_has_internal_diagnostics())
        {
          CGPoint v15 = __UIFaultDebugAssertLog();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
          {
            uint64_t v16 = *(void *)(*(void *)(a1 + 32) + 280);
            *(_DWORD *)buf = 138412290;
            uint64_t v20 = v16;
            _os_log_fault_impl(&dword_1853B0000, v15, OS_LOG_TYPE_FAULT, "Client configured a button (%@) with a menuProvider and contextMenuIsPrimary=YES, but failed to return a menu, Substituting a dummy menu.", buf, 0xCu);
          }
        }
        else
        {
          long long v9 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &_UIInternalPreference_LabelDisableDefaultClipping_block_invoke___s_category_0)+ 8);
          if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
          {
            uint64_t v10 = *(void *)(*(void *)(a1 + 32) + 280);
            *(_DWORD *)buf = 138412290;
            uint64_t v20 = v10;
            _os_log_impl(&dword_1853B0000, v9, OS_LOG_TYPE_ERROR, "Client configured a button (%@) with a menuProvider and contextMenuIsPrimary=YES, but failed to return a menu, Substituting a dummy menu.", buf, 0xCu);
          }
        }
        long long v11 = [*(id *)(*(void *)(a1 + 32) + 280) titleForState:0];
        $F24F406B2B787EFB06265DBA3D28CBD5 v12 = [*(id *)(*(void *)(a1 + 32) + 280) imageForState:0];
        v17[0] = MEMORY[0x1E4F143A8];
        v17[1] = 3221225472;
        v17[2] = __93__UIButtonConfigurationVisualProvider_contextMenuInteraction_configurationForMenuAtLocation___block_invoke_12;
        v17[3] = &unk_1E52DB038;
        v17[4] = *(void *)(a1 + 32);
        CGPoint v13 = +[UIAction actionWithTitle:v11 image:v12 identifier:0 handler:v17];

        long long v18 = v13;
        CGPoint v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v18 count:1];
        double v4 = +[UIMenu menuWithChildren:v14];
      }
      else
      {
        double v4 = 0;
      }
    }
  }

  return v4;
}

uint64_t __93__UIButtonConfigurationVisualProvider_contextMenuInteraction_configurationForMenuAtLocation___block_invoke_12(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 280) sendActionsForControlEvents:64];
}

- (CGPoint)menuAttachmentPointForConfiguration:(id)a3
{
  id v3 = _UIControlMenuSupportTargetedPreviewOverViews(self->_button, self->_titleLabel, self->_imageView);
  double v4 = [v3 target];
  double v5 = [v4 container];

  double v6 = [v3 view];
  [v6 bounds];
  double v8 = v7;
  double v10 = v9;
  long long v11 = [v3 target];
  [v11 center];
  double v13 = round(v12 - v10 * 0.5);
  double v15 = round(v14 - v8 * 0.5);
  uint64_t v16 = [v5 _window];
  objc_msgSend(v5, "convertRect:toView:", v16, v15, v13, v8, v10);
  double v18 = v17;
  double v20 = v19;
  double v22 = v21;
  double v24 = v23;

  long long v25 = [v5 _window];
  double v26 = _UIControlMenuAttachmentPointForRectInContainer(v25, v18, v20, v22, v24);
  double v28 = v27;

  double v29 = v26;
  double v30 = v28;
  result.double y = v30;
  result.double x = v29;
  return result;
}

- (void)contextMenuInteraction:(id)a3 updateStyleForMenuWithConfiguration:(id)a4 style:(id)a5
{
  if (a5)
  {
    button = self->_button;
    titleLabel = self->_titleLabel;
    imageView = self->_imageView;
    id v10 = a5;
    id v11 = a4;
    _UIControlMenuSupportTargetedPreviewOverViews(button, titleLabel, imageView);
    id v16 = (id)objc_claimAutoreleasedReturnValue();
    [(UIButton *)self->_button menuAttachmentPointForConfiguration:v11];
    double v13 = v12;
    CGFloat v15 = v14;

    _UIControlMenuSupportUpdateStyle(v10, self->_button, v16, v13, v15);
  }
}

- (id)contextMenuInteraction:(id)a3 previewForHighlightingMenuWithConfiguration:(id)a4
{
  return _UIControlMenuSupportTargetedPreviewOverViews(self->_button, self->_titleLabel, self->_imageView);
}

- (id)contextMenuInteraction:(id)a3 previewForDismissingMenuWithConfiguration:(id)a4
{
  return _UIControlMenuSupportTargetedPreviewOverViews(self->_button, self->_titleLabel, self->_imageView);
}

- (CGRect)visualBoundsWithCornerRadius:(double *)a3
{
  double v5 = +[_UIPointerSettingsDomain rootSettings];
  double v6 = [v5 buttonSettings];

  double v7 = [(UIButton *)self->_button _currentConfiguration];
  if (![v7 _isRoundButton])
  {
    if ([v7 _hasObscuringBackground])
    {
      [(UIView *)self->_backgroundView frame];
      double v17 = v25;
      double v19 = v26;
      double v21 = v27;
      double v23 = v28;
      backgroundView = self->_backgroundView;
      if (backgroundView)
      {
        double currentlyAppliedCornerRadius = backgroundView->_currentlyAppliedCornerRadius;
        if (!a3) {
          goto LABEL_30;
        }
      }
      else
      {
        double currentlyAppliedCornerRadius = 0.0;
        if (!a3) {
          goto LABEL_30;
        }
      }
      goto LABEL_29;
    }
    double x = *MEMORY[0x1E4F1DB20];
    double y = *(double *)(MEMORY[0x1E4F1DB20] + 8);
    double width = *(double *)(MEMORY[0x1E4F1DB20] + 16);
    double height = *(double *)(MEMORY[0x1E4F1DB20] + 24);
    if ([v7 showsActivityIndicator])
    {
      progressIndicatorView = self->_progressIndicatorView;
    }
    else
    {
      double v35 = [v7 _resolvedImage];

      if (!v35)
      {
        int v40 = 0;
LABEL_15:
        double v41 = [v7 _resolvedTitle];
        uint64_t v42 = [v41 length];
        BOOL v43 = v42 != 0;

        if (v42)
        {
          [(UIView *)self->_titleLabel frame];
          v99.origin.double x = v44;
          v99.origin.double y = v45;
          v99.size.double width = v46;
          v99.size.double height = v47;
          v91.origin.double x = x;
          v91.origin.double y = y;
          v91.size.double width = width;
          v91.size.double height = height;
          CGRect v92 = CGRectUnion(v91, v99);
          double x = v92.origin.x;
          double y = v92.origin.y;
          double width = v92.size.width;
          double height = v92.size.height;
        }
        double v48 = [v7 _resolvedSubtitle];
        uint64_t v49 = [v48 length];

        if (v49)
        {
          [(UIView *)self->_subtitleLabel frame];
          v100.origin.double x = v50;
          v100.origin.double y = v51;
          v100.size.double width = v52;
          v100.size.double height = v53;
          v93.origin.double x = x;
          v93.origin.double y = y;
          v93.size.double width = width;
          v93.size.double height = height;
          CGRect v94 = CGRectUnion(v93, v100);
          double x = v94.origin.x;
          double y = v94.origin.y;
          double width = v94.size.width;
          double height = v94.size.height;
          BOOL v43 = 1;
        }
        double v54 = [v7 _resolvedIndicator];

        if (v54)
        {
          [(UIView *)self->_indicatorView frame];
          v101.origin.double x = v55;
          v101.origin.double y = v56;
          v101.size.double width = v57;
          v101.size.double height = v58;
          v95.origin.double x = x;
          v95.origin.double y = y;
          v95.size.double width = width;
          v95.size.double height = height;
          CGRect v96 = CGRectUnion(v95, v101);
          double x = v96.origin.x;
          double y = v96.origin.y;
          double width = v96.size.width;
          double height = v96.size.height;
          int v40 = 1;
        }
        UIUserInterfaceLayoutDirection v59 = [(UIView *)self->_button effectiveUserInterfaceLayoutDirection];
        if ((v40 & v43) == 1)
        {
          BOOL v60 = v59 == UIUserInterfaceLayoutDirectionRightToLeft;
          [v6 mixedButtonOutsetLeading];
          double v88 = v61;
          [v6 mixedButtonOutsetTrailing];
          double v63 = v62;
          [v6 mixedButtonOutsetTop];
          double v65 = v64;
          [v6 mixedButtonOutsetBottom];
          double v67 = v66;
          [v6 mixedButtonMinWidth];
          double v69 = v68;
          [v6 mixedButtonMinHeight];
        }
        else if (v40)
        {
          BOOL v60 = v59 == UIUserInterfaceLayoutDirectionRightToLeft;
          [v6 imageButtonOutsetLeading];
          double v88 = v70;
          [v6 imageButtonOutsetTrailing];
          double v63 = v71;
          [v6 imageButtonOutsetTop];
          double v65 = v72;
          [v6 imageButtonOutsetBottom];
          double v67 = v73;
          [v6 imageButtonMinWidth];
          double v69 = v74;
          [v6 imageButtonMinHeight];
        }
        else
        {
          if (!v43)
          {
            [(UIView *)self->_button bounds];
LABEL_28:
            double v17 = v80;
            double v19 = v81;
            double v21 = v82;
            double v23 = v83;
            double currentlyAppliedCornerRadius = -1.0;
            if (!a3) {
              goto LABEL_30;
            }
LABEL_29:
            *a3 = currentlyAppliedCornerRadius;
            goto LABEL_30;
          }
          BOOL v60 = v59 == UIUserInterfaceLayoutDirectionRightToLeft;
          [v6 textButtonOutsetLeading];
          double v88 = v75;
          [v6 textButtonOutsetTrailing];
          double v63 = v76;
          [v6 textButtonOutsetTop];
          double v65 = v77;
          [v6 textButtonOutsetBottom];
          double v67 = v78;
          [v6 textButtonMinWidth];
          double v69 = v79;
          [v6 textButtonMinHeight];
        }
        double v80 = __outsetRectWithMinimumSize(v60, 0, x, y, width, height, v88, v63, v65, v67, v69);
        goto LABEL_28;
      }
      progressIndicatorView = self->_imageView;
    }
    [progressIndicatorView frame];
    v98.origin.double x = v36;
    v98.origin.double y = v37;
    v98.size.double width = v38;
    v98.size.double height = v39;
    v89.origin.double x = x;
    v89.origin.double y = y;
    v89.size.double width = width;
    v89.size.double height = height;
    CGRect v90 = CGRectUnion(v89, v98);
    double x = v90.origin.x;
    double y = v90.origin.y;
    double width = v90.size.width;
    double height = v90.size.height;
    int v40 = 1;
    goto LABEL_15;
  }
  UIUserInterfaceLayoutDirection v8 = [(UIView *)self->_button effectiveUserInterfaceLayoutDirection];
  double v9 = 0.0;
  if (([v7 _hasObscuringBackground] & 1) == 0)
  {
    [v6 roundButtonOutset];
    double v9 = v10;
  }
  [v6 roundButtonMinSize];
  double v12 = v11;
  [(UIView *)self->_button bounds];
  double v17 = __outsetRectWithMinimumSize(v8 == UIUserInterfaceLayoutDirectionRightToLeft, 1, v13, v14, v15, v16, v9, v9, v9, v9, v12);
  double v19 = v18;
  double v21 = v20;
  double v23 = v22;
  double currentlyAppliedCornerRadius = v20 * 0.5;
  if (a3) {
    goto LABEL_29;
  }
LABEL_30:

  double v84 = v17;
  double v85 = v19;
  double v86 = v21;
  double v87 = v23;
  result.size.double height = v87;
  result.size.double width = v86;
  result.origin.double y = v85;
  result.origin.double x = v84;
  return result;
}

- (id)pointerEffectPreviewParameters
{
  id v3 = objc_opt_new();
  double v4 = [(UIButton *)self->_button _currentConfiguration];
  int v5 = [v4 _hasObscuringBackground];

  if (v5)
  {
    double v6 = [(_UISystemBackgroundView *)self->_backgroundView currentVisiblePathInContainerView:self->_button];
    [v3 setShadowPath:v6];
  }
  return v3;
}

- (id)pointerEffectWithPreview:(id)a3
{
  id v4 = a3;
  int v5 = objc_opt_class();
  double v6 = [(UIButton *)self->_button _currentConfiguration];
  int v7 = [v6 _hasObscuringBackground];

  if (v7) {
    int v5 = objc_opt_class();
  }
  UIUserInterfaceLayoutDirection v8 = [v5 effectWithPreview:v4];

  return v8;
}

- (id)pointerShapeInContainer:(id)a3 proposal:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  UIUserInterfaceLayoutDirection v8 = v7;
  if (!v7 || ((*((void (**)(id))v7 + 2))(v7), (double v9 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    double v13 = 0.0;
    [(UIButtonConfigurationVisualProvider *)self visualBoundsWithCornerRadius:&v13];
    double v10 = v13;
    -[UIView convertRect:toView:](self->_button, "convertRect:toView:", v6);
    if (v10 >= 0.0) {
      +[UIPointerShape shapeWithRoundedRect:cornerRadius:](UIPointerShape, "shapeWithRoundedRect:cornerRadius:");
    }
    else {
    double v9 = +[UIPointerShape shapeWithRoundedRect:](UIPointerShape, "shapeWithRoundedRect:");
    }
  }
  id v11 = v9;

  return v11;
}

- (id)preferredHoverEffect
{
  double v2 = [(UIButton *)self->_button _currentConfiguration];
  int v3 = [v2 _hasObscuringBackground];

  if (v3)
  {
    id v4 = +[UIHoverLiftEffect effect];
  }
  else
  {
    id v4 = 0;
  }
  return v4;
}

- (id)preferredHoverShape
{
  return [(_UISystemBackgroundView *)self->_backgroundView shapeInContainerView:self->_button];
}

- (id)defaultFocusEffect
{
  if ([(UIView *)self->_backgroundView isDescendantOfView:self->_button]
    && ([(UIButton *)self->_button _currentConfiguration],
        int v3 = objc_claimAutoreleasedReturnValue(),
        int v4 = [v3 _hasObscuringBackground],
        v3,
        v4))
  {
    int v5 = [(_UISystemBackgroundView *)self->_backgroundView currentVisiblePathInContainerView:self->_button];
    if (v5)
    {
      +[UIFocusHaloEffect effectWithPath:v5];
    }
    else
    {
      backgroundView = self->_backgroundView;
      [(UIView *)backgroundView bounds];
      -[UIView convertRect:toView:](backgroundView, "convertRect:toView:", self->_button);
      +[UIFocusHaloEffect effectWithRect:](UIFocusHaloEffect, "effectWithRect:");
    id v6 = };
    [v6 setReferenceView:self->_backgroundView];
  }
  else
  {
    [(UIView *)self->_button bounds];
    id v6 = +[UIFocusHaloEffect effectWithRect:](UIFocusHaloEffect, "effectWithRect:");
  }
  [v6 setContainerView:self->_button];
  return v6;
}

- (double)focusSizeIncrease
{
  return 2.22507386e-308;
}

- (void)setRole:(int64_t)a3
{
}

- (id)backgroundViewCreateIfNeeded:(BOOL)a3
{
  return self->_backgroundView;
}

- (id)imageEffectContainerView
{
  return [(UIButton *)self->_button imageView];
}

- (id)contentBackdropView
{
  return 0;
}

- (id)selectionIndicatorView
{
  return 0;
}

- (CGRect)imageRectForContentRect:(CGRect)a3
{
  double v3 = *MEMORY[0x1E4F1DB28];
  double v4 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  double v5 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  double v6 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  result.size.double height = v6;
  result.size.double width = v5;
  result.origin.double y = v4;
  result.origin.double x = v3;
  return result;
}

- (BOOL)useTitleForSelectedIndicatorBounds
{
  return 0;
}

- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4
{
  id v5 = a3;
  button = self->_button;
  id v11 = v5;
  uint64_t v7 = [v5 previouslyFocusedView];
  if (button == (UIButton *)v7)
  {
  }
  else
  {
    UIUserInterfaceLayoutDirection v8 = (void *)v7;
    double v9 = self->_button;
    double v10 = [v11 nextFocusedView];

    if (v9 != v10) {
      goto LABEL_6;
    }
  }
  [(UIButton *)self->_button setNeedsUpdateConfiguration];
LABEL_6:
}

- (BOOL)canBecomeFocused
{
  return 1;
}

- (id)preferredConfigurationForFocusAnimation:(int64_t)a3 inContext:(id)a4
{
  return 0;
}

- (id)viewForFirstBaselineLayout
{
  return self->_button;
}

- ($F24F406B2B787EFB06265DBA3D28CBD5)baselineOffsetsAtSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  [(UIButtonConfigurationVisualProvider *)self updateConfigurationIfNecessary];
  [(UIView *)self->_button bounds];
  BOOL v9 = width != 0.0 && width == v6 && height == v7;
  if (!v9 || height == 0.0)
  {
    if ((*(unsigned char *)&self->_layoutData.flags & 1) != 0
      && (width == *MEMORY[0x1E4F1DB30] ? (BOOL v11 = height == *(double *)(MEMORY[0x1E4F1DB30] + 8)) : (BOOL v11 = 0),
          v11
       && (self->_layoutData.idealSize.width == self->_layoutData.buttonBounds.size.width
         ? (BOOL v12 = self->_layoutData.idealSize.height == self->_layoutData.buttonBounds.size.height)
         : (BOOL v12 = 0),
           v12)))
    {
      $AED0C895A02F00D9693E1209E5F42816 baselineOffsets = self->_layoutData.baselineOffsets;
    }
    else if ([(UIView *)self->_button _wantsAutolayout] {
           && (([(UIButton *)self->_button _activeSizeToFitLayoutEngine],
    }
                (double v13 = objc_claimAutoreleasedReturnValue()) != 0)
            || ([(UIView *)self->_button _layoutEngine],
                (double v13 = objc_claimAutoreleasedReturnValue()) != 0)))
    {
      -[UIButtonConfigurationVisualProvider _layoutDataInBounds:](self, "_layoutDataInBounds:", -[UIView _nsis_compatibleBoundsInEngine:](self->_button, v13));

      $AED0C895A02F00D9693E1209E5F42816 baselineOffsets = v16;
    }
    else
    {
      -[UIButtonConfigurationVisualProvider _layoutDataInBounds:](self, "_layoutDataInBounds:", *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8), width, height);
      $AED0C895A02F00D9693E1209E5F42816 baselineOffsets = v15;
    }
  }
  else
  {
    [(UIButtonConfigurationVisualProvider *)self _layoutDataUpdatingIfNecessary];
    $AED0C895A02F00D9693E1209E5F42816 baselineOffsets = v17;
  }
  double lastFromBottom = baselineOffsets.lastFromBottom;
  result.var0 = baselineOffsets.firstFromTop;
  result.var1 = lastFromBottom;
  return result;
}

- (void)setContentVerticalAlignment:(int64_t)a3
{
}

- ($715CDB9500DB0530738687119A983978)_debugLayoutData
{
  CGPoint v3 = *(CGPoint *)&self->var6.var1;
  CGSize size = self[1].var0.size;
  retstr->var5.CGSize size = (CGSize)self[1].var0.origin;
  retstr->var6 = ($F24F406B2B787EFB06265DBA3D28CBD5)size;
  *(CGFloat *)&retstr->var7 = self[1].var1.width;
  CGPoint v5 = *(CGPoint *)&self->var4.origin.y;
  CGPoint v6 = *(CGPoint *)&self->var5.origin.y;
  retstr->var3.CGSize size = *(CGSize *)&self->var4.size.height;
  retstr->var4.origin = v6;
  retstr->var4.CGSize size = *(CGSize *)&self->var5.size.height;
  retstr->var5.origin = v3;
  CGSize v7 = *(CGSize *)&self->var2.origin.y;
  CGPoint v8 = *(CGPoint *)&self->var3.origin.y;
  retstr->var1 = *(CGSize *)&self->var2.size.height;
  retstr->var2.origin = v8;
  retstr->var2.CGSize size = *(CGSize *)&self->var3.size.height;
  retstr->var3.origin = v5;
  retstr->var0.origin = *(CGPoint *)&self->var1.height;
  retstr->var0.CGSize size = v7;
  return self;
}

- (UIButton)button
{
  return self->_button;
}

- (void)setVendsBaselineInformationToAutoLayout:(BOOL)a3
{
  self->_vendsBaselineInformationToAutoLayout = a3;
}

- (double)previousFirstBaselineOffsetForAttributeLowering
{
  return self->_previousFirstBaselineOffsetForAttributeLowering;
}

- (void)setPreviousFirstBaselineOffsetForAttributeLowering:(double)a3
{
  self->_previousFirstBaselineOffsetForAttributeLowering = a3;
}

- (double)previousLastBaselineOffsetForAttributeLowering
{
  return self->_previousLastBaselineOffsetForAttributeLowering;
}

- (void)setPreviousLastBaselineOffsetForAttributeLowering:(double)a3
{
  self->_previousLastBaselineOffsetForAttributeLowering = a3;
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