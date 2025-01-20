@interface PXActionableSectionHeaderView
- (BOOL)_disableRasterizeInAnimations;
- (BOOL)_isMovingFast;
- (BOOL)_wantsActionButton;
- (BOOL)_wantsOverBackgroundBehavior;
- (BOOL)_wantsSecondaryButton;
- (BOOL)actionButtonEnabled;
- (BOOL)avoidsTintedButtonsAtHighSpeed;
- (BOOL)inLayoutTransition;
- (BOOL)showsActionButton;
- (BOOL)showsSecondaryButton;
- (BOOL)showsTopSeparator;
- (BOOL)supportsMultipleLinesInCompactLayout;
- (BOOL)wantsBackground;
- (CGRect)clippingRect;
- (NSCopying)userData;
- (NSString)actionText;
- (NSString)backdropViewGroupName;
- (NSString)primaryText;
- (NSString)secondaryText;
- (PXActionableSectionHeaderView)initWithFrame:(CGRect)a3;
- (PXActionableSectionHeaderViewDelegate)delegate;
- (PXCuratedLibraryOverlayButton)backdropActionButton;
- (PXCuratedLibrarySectionHeaderLayoutSpec)backdropButtonSpec;
- (PXPhotosFilterToggleButtonController)filterButtonController;
- (PXSimpleIndexPath)sectionIndexPath;
- (UIButton)currentSecondaryButton;
- (UIButton)systemActionButton;
- (UIControl)currentActionButton;
- (UIEdgeInsets)contentInsets;
- (UIImage)backgroundImage;
- (UIImageView)backgroundImageView;
- (UILabel)primaryLabel;
- (UILabel)secondaryLabel;
- (UILabel)spacerLabel;
- (UITraitCollection)selfSizingTraits;
- (UIVisualEffectView)visualEffectView;
- (double)backgroundImageAlpha;
- (double)backgroundImageOverhang;
- (double)baselineToBottomSpacing;
- (double)heightForSizeClass:(int64_t)a3 width:(double)a4 safeAreaInsets:(UIEdgeInsets)a5;
- (id)_backdropButtonBackgroundColor;
- (id)_backdropButtonForegroundColor;
- (id)filterButtonControllerFactory;
- (id)traitCollection;
- (int64_t)layoutMode;
- (int64_t)layoutModeForHorizontalSizeClass:(int64_t)a3;
- (int64_t)preferredUserInterfaceStyle;
- (int64_t)speedRegime;
- (unint64_t)backgroundStyle;
- (unint64_t)buttonStyle;
- (void)_actionButtonPressed:(id)a3;
- (void)_contentSizeCategoryDidChangeNotification:(id)a3;
- (void)_updateActionButtonAnimated:(BOOL)a3;
- (void)_updateActionButtonConfiguration;
- (void)_updateActionButtonEnabledAnimated:(BOOL)a3;
- (void)_updateBackdropActionButton;
- (void)_updateBackdropViewGroupName;
- (void)_updateBackgroundAnimated:(BOOL)a3;
- (void)_updateClipping;
- (void)_updateFilterButton;
- (void)_updateLabelColors;
- (void)_updateLabelFonts;
- (void)_updateLabelLineNumbers;
- (void)_updateSecondaryButtonAnimated:(BOOL)a3;
- (void)_updateSpacerLabelHiddenState;
- (void)_updateSystemActionButton;
- (void)_updateWithCurrentTraits;
- (void)applyLayoutAttributes:(id)a3;
- (void)dealloc;
- (void)didTransitionFromLayout:(id)a3 toLayout:(id)a4;
- (void)layoutSubviews;
- (void)performChangesToGroupedBackgroundPropertiesAnimated:(BOOL)a3 withBlock:(id)a4;
- (void)setAccessibilityIdentifierWithValue:(id)a3;
- (void)setActionButtonEnabled:(BOOL)a3;
- (void)setActionButtonEnabled:(BOOL)a3 animated:(BOOL)a4;
- (void)setActionText:(id)a3;
- (void)setAvoidsTintedButtonsAtHighSpeed:(BOOL)a3;
- (void)setBackdropActionButton:(id)a3;
- (void)setBackdropButtonSpec:(id)a3;
- (void)setBackdropViewGroupName:(id)a3;
- (void)setBackgroundImage:(id)a3;
- (void)setBackgroundImageAlpha:(double)a3;
- (void)setBackgroundImageOverhang:(double)a3;
- (void)setBackgroundStyle:(unint64_t)a3;
- (void)setBounds:(CGRect)a3;
- (void)setButtonStyle:(unint64_t)a3;
- (void)setClippingRect:(CGRect)a3;
- (void)setContentInsets:(UIEdgeInsets)a3;
- (void)setDelegate:(id)a3;
- (void)setFilterButtonController:(id)a3;
- (void)setFilterButtonControllerFactory:(id)a3;
- (void)setFrame:(CGRect)a3;
- (void)setInLayoutTransition:(BOOL)a3;
- (void)setPreferredUserInterfaceStyle:(int64_t)a3;
- (void)setPrimaryLabel:(id)a3;
- (void)setPrimaryText:(id)a3;
- (void)setSecondaryLabel:(id)a3;
- (void)setSecondaryText:(id)a3;
- (void)setSectionIndexPath:(PXSimpleIndexPath *)a3;
- (void)setSelfSizingTraits:(id)a3;
- (void)setShowsActionButton:(BOOL)a3;
- (void)setShowsActionButton:(BOOL)a3 animated:(BOOL)a4;
- (void)setShowsSecondaryButton:(BOOL)a3;
- (void)setShowsSecondaryButton:(BOOL)a3 animated:(BOOL)a4;
- (void)setShowsTopSeparator:(BOOL)a3;
- (void)setSpacerLabel:(id)a3;
- (void)setSpeedRegime:(int64_t)a3;
- (void)setSupportsMultipleLinesInCompactLayout:(BOOL)a3;
- (void)setSystemActionButton:(id)a3;
- (void)setUserData:(id)a3;
- (void)setWantsBackground:(BOOL)a3;
- (void)setWantsBackground:(BOOL)a3 animated:(BOOL)a4;
- (void)traitCollectionDidChange:(id)a3;
- (void)willTransitionFromLayout:(id)a3 toLayout:(id)a4;
@end

@implementation PXActionableSectionHeaderView

- (NSCopying)userData
{
  return (NSCopying *)objc_getAssociatedObject(self, (const void *)UserDataAssociationKey);
}

- (void)setUserData:(id)a3
{
  id v5 = a3;
  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v18 = [MEMORY[0x1E4F28B00] currentHandler];
      v19 = (objc_class *)objc_opt_class();
      v20 = NSStringFromClass(v19);
      v21 = objc_msgSend(v5, "px_descriptionForAssertionMessage");
      [v18 handleFailureInMethod:a2, self, @"PXActionableSectionHeaderLayoutProvider+iOS.m", 583, @"%@ should be nil or an instance inheriting from %@, but it is %@", @"userData", v20, v21 object file lineNumber description];
    }
  }
  objc_getAssociatedObject(self, (const void *)UserDataAssociationKey);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  if (v6 != v5)
  {
    objc_setAssociatedObject(self, (const void *)UserDataAssociationKey, v5, (void *)3);
    -[PXActionableSectionHeaderView setBackgroundStyle:](self, "setBackgroundStyle:", [v5 backgroundStyle]);
    -[PXActionableSectionHeaderView setButtonStyle:](self, "setButtonStyle:", [v5 buttonStyle]);
    v7 = [v5 primaryText];
    [(PXActionableSectionHeaderView *)self setPrimaryText:v7];

    v8 = [v5 secondaryText];
    [(PXActionableSectionHeaderView *)self setSecondaryText:v8];

    [v5 edgeInsets];
    -[PXActionableSectionHeaderView setContentInsets:](self, "setContentInsets:");
    v9 = [v5 weakLayout];
    [(PXActionableSectionHeaderView *)self setDelegate:v9];
    v10 = [v5 actionText];
    [(PXActionableSectionHeaderView *)self setActionText:v10];

    v11 = [v5 backdropViewGroupName];
    [(PXActionableSectionHeaderView *)self setBackdropViewGroupName:v11];

    v12 = [v5 gradientImage];
    [(PXActionableSectionHeaderView *)self setBackgroundImage:v12];

    [v5 gradientAlpha];
    -[PXActionableSectionHeaderView setBackgroundImageAlpha:](self, "setBackgroundImageAlpha:");
    [v5 gradientOverhang];
    -[PXActionableSectionHeaderView setBackgroundImageOverhang:](self, "setBackgroundImageOverhang:");
    v13 = [v5 buttonSpec];
    [(PXActionableSectionHeaderView *)self setBackdropButtonSpec:v13];

    v14 = [v5 filterButtonControllerFactory];
    [(PXActionableSectionHeaderView *)self setFilterButtonControllerFactory:v14];

    if (v5)
    {
      [v5 sectionIndexPath];
    }
    else
    {
      long long v25 = 0u;
      long long v26 = 0u;
    }
    v24[0] = v25;
    v24[1] = v26;
    [(PXActionableSectionHeaderView *)self setSectionIndexPath:v24];
    -[PXActionableSectionHeaderView setAvoidsTintedButtonsAtHighSpeed:](self, "setAvoidsTintedButtonsAtHighSpeed:", [v5 avoidsTintedButtonsAtHighSpeeds]);
    -[PXActionableSectionHeaderView setSupportsMultipleLinesInCompactLayout:](self, "setSupportsMultipleLinesInCompactLayout:", [v5 supportsMultipleLinesInCompactLayout]);
    -[PXActionableSectionHeaderView setPreferredUserInterfaceStyle:](self, "setPreferredUserInterfaceStyle:", [v5 preferredUserInterfaceStyle]);
    uint64_t v15 = [v9 scrollSpeedRegime];
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __62__PXActionableSectionHeaderView_PXGReusableView__setUserData___block_invoke;
    v22[3] = &unk_1E5DD32A8;
    BOOL v16 = v15 < 2;
    v22[4] = self;
    id v23 = v9;
    id v17 = v9;
    [(PXActionableSectionHeaderView *)self performChangesToGroupedBackgroundPropertiesAnimated:v16 withBlock:v22];
    -[PXActionableSectionHeaderView setShowsActionButton:animated:](self, "setShowsActionButton:animated:", [v5 showsActionButton], v16);
    -[PXActionableSectionHeaderView setShowsSecondaryButton:animated:](self, "setShowsSecondaryButton:animated:", [v5 showsSecondaryButton], v16);
  }
}

uint64_t __62__PXActionableSectionHeaderView_PXGReusableView__setUserData___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setSpeedRegime:", objc_msgSend(*(id *)(a1 + 40), "scrollSpeedRegime"));
  uint64_t v2 = [*(id *)(a1 + 40) wantsBackground];
  v3 = *(void **)(a1 + 32);
  return [v3 setWantsBackground:v2];
}

- (CGRect)clippingRect
{
  double v2 = *MEMORY[0x1E4F1DB10];
  double v3 = *(double *)(MEMORY[0x1E4F1DB10] + 8);
  double v4 = *(double *)(MEMORY[0x1E4F1DB10] + 16);
  double v5 = *(double *)(MEMORY[0x1E4F1DB10] + 24);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (void)setClippingRect:(CGRect)a3
{
  if (!CGRectEqualToRect(a3, *MEMORY[0x1E4F1DB10]))
  {
    id v5 = [MEMORY[0x1E4F28B00] currentHandler];
    [v5 handleFailureInMethod:a2 object:self file:@"PXActionableSectionHeaderLayoutProvider+iOS.m" lineNumber:575 description:@"Clipping isn't supported"];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_selfSizingTraits, 0);
  objc_storeStrong((id *)&self->_backgroundImageView, 0);
  objc_storeStrong((id *)&self->_visualEffectView, 0);
  objc_storeStrong((id *)&self->_currentSecondaryButton, 0);
  objc_storeStrong((id *)&self->_filterButtonController, 0);
  objc_storeStrong((id *)&self->_backdropActionButton, 0);
  objc_storeStrong((id *)&self->_systemActionButton, 0);
  objc_storeStrong((id *)&self->_secondaryLabel, 0);
  objc_storeStrong((id *)&self->_spacerLabel, 0);
  objc_storeStrong((id *)&self->_primaryLabel, 0);
  objc_storeStrong((id *)&self->_backdropViewGroupName, 0);
  objc_storeStrong((id *)&self->_backgroundImage, 0);
  objc_storeStrong((id *)&self->_backdropButtonSpec, 0);
  objc_storeStrong(&self->_filterButtonControllerFactory, 0);
  objc_storeStrong((id *)&self->_actionText, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (UITraitCollection)selfSizingTraits
{
  return self->_selfSizingTraits;
}

- (void)setInLayoutTransition:(BOOL)a3
{
  self->_inLayoutTransition = a3;
}

- (BOOL)inLayoutTransition
{
  return self->_inLayoutTransition;
}

- (UIImageView)backgroundImageView
{
  return self->_backgroundImageView;
}

- (UIVisualEffectView)visualEffectView
{
  return self->_visualEffectView;
}

- (UIButton)currentSecondaryButton
{
  return self->_currentSecondaryButton;
}

- (void)setFilterButtonController:(id)a3
{
}

- (PXPhotosFilterToggleButtonController)filterButtonController
{
  return self->_filterButtonController;
}

- (void)setBackdropActionButton:(id)a3
{
}

- (PXCuratedLibraryOverlayButton)backdropActionButton
{
  return self->_backdropActionButton;
}

- (void)setSystemActionButton:(id)a3
{
}

- (UIButton)systemActionButton
{
  return self->_systemActionButton;
}

- (void)setSecondaryLabel:(id)a3
{
}

- (UILabel)secondaryLabel
{
  return self->_secondaryLabel;
}

- (void)setSpacerLabel:(id)a3
{
}

- (UILabel)spacerLabel
{
  return self->_spacerLabel;
}

- (void)setPrimaryLabel:(id)a3
{
}

- (UILabel)primaryLabel
{
  return self->_primaryLabel;
}

- (int64_t)preferredUserInterfaceStyle
{
  return self->_preferredUserInterfaceStyle;
}

- (BOOL)supportsMultipleLinesInCompactLayout
{
  return self->_supportsMultipleLinesInCompactLayout;
}

- (UIEdgeInsets)contentInsets
{
  double top = self->_contentInsets.top;
  double left = self->_contentInsets.left;
  double bottom = self->_contentInsets.bottom;
  double right = self->_contentInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (NSString)backdropViewGroupName
{
  return self->_backdropViewGroupName;
}

- (double)backgroundImageOverhang
{
  return self->_backgroundImageOverhang;
}

- (double)backgroundImageAlpha
{
  return self->_backgroundImageAlpha;
}

- (UIImage)backgroundImage
{
  return self->_backgroundImage;
}

- (BOOL)avoidsTintedButtonsAtHighSpeed
{
  return self->_avoidsTintedButtonsAtHighSpeed;
}

- (int64_t)speedRegime
{
  return self->_speedRegime;
}

- (BOOL)wantsBackground
{
  return self->_wantsBackground;
}

- (unint64_t)backgroundStyle
{
  return self->_backgroundStyle;
}

- (PXCuratedLibrarySectionHeaderLayoutSpec)backdropButtonSpec
{
  return self->_backdropButtonSpec;
}

- (BOOL)showsTopSeparator
{
  return self->_showsTopSeparator;
}

- (id)filterButtonControllerFactory
{
  return self->_filterButtonControllerFactory;
}

- (NSString)actionText
{
  return self->_actionText;
}

- (BOOL)actionButtonEnabled
{
  return self->_actionButtonEnabled;
}

- (BOOL)showsSecondaryButton
{
  return self->_showsSecondaryButton;
}

- (BOOL)showsActionButton
{
  return self->_showsActionButton;
}

- (unint64_t)buttonStyle
{
  return self->_buttonStyle;
}

- (void)setSectionIndexPath:(PXSimpleIndexPath *)a3
{
  long long v3 = *(_OWORD *)&a3->item;
  *(_OWORD *)&self->_sectionIndexPath.dataSourceIdentifier = *(_OWORD *)&a3->dataSourceIdentifier;
  *(_OWORD *)&self->_sectionIndexPath.item = v3;
}

- (PXSimpleIndexPath)sectionIndexPath
{
  long long v3 = *(_OWORD *)&self[21].subitem;
  *(_OWORD *)&retstr->dataSourceIdentifier = *(_OWORD *)&self[21].section;
  *(_OWORD *)&retstr->item = v3;
  return self;
}

- (PXActionableSectionHeaderViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (PXActionableSectionHeaderViewDelegate *)WeakRetained;
}

- (int64_t)layoutModeForHorizontalSizeClass:(int64_t)a3
{
  double v4 = [(id)*MEMORY[0x1E4FB2608] preferredContentSizeCategory];
  BOOL IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v4);

  return a3 == 1 || IsAccessibilityCategory;
}

- (int64_t)layoutMode
{
  long long v3 = [(PXActionableSectionHeaderView *)self traitCollection];
  int64_t v4 = -[PXActionableSectionHeaderView layoutModeForHorizontalSizeClass:](self, "layoutModeForHorizontalSizeClass:", [v3 horizontalSizeClass]);

  return v4;
}

- (void)_updateClipping
{
}

- (void)_updateBackdropViewGroupName
{
  if (self->_inLayoutTransition || ![(PXActionableSectionHeaderView *)self wantsBackground])
  {
    uint64_t v3 = 0;
  }
  else
  {
    uint64_t v3 = [(PXActionableSectionHeaderView *)self backdropViewGroupName];
  }
  id v4 = (id)v3;
  [(UIVisualEffectView *)self->_visualEffectView _setGroupName:v3];
}

- (void)_updateBackgroundAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(PXActionableSectionHeaderView *)self backgroundStyle]
    || ![(PXActionableSectionHeaderView *)self wantsBackground])
  {
    int v8 = 656;
    if (v3)
    {
      visualEffectView = self->_visualEffectView;
      v35[0] = MEMORY[0x1E4F143A8];
      v35[1] = 3221225472;
      v35[2] = __59__PXActionableSectionHeaderView__updateBackgroundAnimated___block_invoke_3;
      v35[3] = &unk_1E5DD36F8;
      v35[4] = self;
      [MEMORY[0x1E4FB1EB0] transitionWithView:visualEffectView duration:5439488 options:v35 animations:0 completion:0.3];
    }
    else
    {
      [(UIVisualEffectView *)self->_visualEffectView setHidden:1];
    }
  }
  else
  {
    id v5 = (void *)MEMORY[0x1E4FB14C8];
    if ([(PXActionableSectionHeaderView *)self preferredUserInterfaceStyle] == 2) {
      uint64_t v6 = 20;
    }
    else {
      uint64_t v6 = 10;
    }
    v7 = [v5 effectWithStyle:v6];
    int v8 = 656;
    v9 = self->_visualEffectView;
    if (v9)
    {
      [(UIVisualEffectView *)v9 setEffect:v7];
    }
    else
    {
      v27 = (UIVisualEffectView *)[objc_alloc(MEMORY[0x1E4FB1F00]) initWithEffect:v7];
      v28 = self->_visualEffectView;
      self->_visualEffectView = v27;
    }
    v29 = [(UIVisualEffectView *)self->_visualEffectView superview];

    if (v29 != self)
    {
      v37[0] = MEMORY[0x1E4F143A8];
      v37[1] = 3221225472;
      v37[2] = __59__PXActionableSectionHeaderView__updateBackgroundAnimated___block_invoke;
      v37[3] = &unk_1E5DD36F8;
      v37[4] = self;
      [MEMORY[0x1E4FB1EB0] performWithoutAnimation:v37];
    }
    if (v3)
    {
      v30 = self->_visualEffectView;
      v36[0] = MEMORY[0x1E4F143A8];
      v36[1] = 3221225472;
      v36[2] = __59__PXActionableSectionHeaderView__updateBackgroundAnimated___block_invoke_2;
      v36[3] = &unk_1E5DD36F8;
      v36[4] = self;
      [MEMORY[0x1E4FB1EB0] transitionWithView:v30 duration:5439488 options:v36 animations:0 completion:0.3];
    }
    else
    {
      [(UIVisualEffectView *)self->_visualEffectView setHidden:0];
    }
    [(PXActionableSectionHeaderView *)self _updateBackdropViewGroupName];
  }
  if ([(PXActionableSectionHeaderView *)self backgroundStyle] != 1
    || ([(PXActionableSectionHeaderView *)self backgroundImage],
        (uint64_t v11 = objc_claimAutoreleasedReturnValue()) == 0)
    || (v12 = (void *)v11,
        BOOL v13 = [(PXActionableSectionHeaderView *)self wantsBackground],
        v12,
        !v13))
  {
LABEL_16:
    if (!self->_hasBackgroundView) {
      goto LABEL_21;
    }
    self->_hasBackgroundView = 0;
    if (v3)
    {
      v14 = (void *)MEMORY[0x1E4FB1EB0];
      v32[0] = MEMORY[0x1E4F143A8];
      v32[1] = 3221225472;
      v32[2] = __59__PXActionableSectionHeaderView__updateBackgroundAnimated___block_invoke_6;
      v32[3] = &unk_1E5DD36F8;
      v32[4] = self;
      v31[0] = MEMORY[0x1E4F143A8];
      v31[1] = 3221225472;
      v31[2] = __59__PXActionableSectionHeaderView__updateBackgroundAnimated___block_invoke_7;
      v31[3] = &unk_1E5DD2188;
      v31[4] = self;
      uint64_t v15 = v32;
      BOOL v16 = v31;
LABEL_19:
      [v14 animateWithDuration:196608 delay:v15 options:v16 animations:0.3 completion:0.0];
      goto LABEL_21;
    }
    [(UIImageView *)self->_backgroundImageView setHidden:1];
    goto LABEL_21;
  }
  if ([(PXActionableSectionHeaderView *)self _isMovingFast])
  {
    if (self->_hasBackgroundView) {
      goto LABEL_21;
    }
    goto LABEL_16;
  }
  if (!self->_hasBackgroundView)
  {
    self->_hasBackgroundView = 1;
    backgroundImageView = self->_backgroundImageView;
    if (!backgroundImageView)
    {
      id v21 = objc_alloc(MEMORY[0x1E4FB1838]);
      v22 = (UIImageView *)objc_msgSend(v21, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
      id v23 = self->_backgroundImageView;
      self->_backgroundImageView = v22;

      [(UIImageView *)self->_backgroundImageView setAlpha:0.0];
      backgroundImageView = self->_backgroundImageView;
    }
    v24 = [(UIImageView *)backgroundImageView superview];

    if (v24 != self)
    {
      v34[0] = MEMORY[0x1E4F143A8];
      v34[1] = 3221225472;
      v34[2] = __59__PXActionableSectionHeaderView__updateBackgroundAnimated___block_invoke_4;
      v34[3] = &unk_1E5DD36F8;
      v34[4] = self;
      [MEMORY[0x1E4FB1EB0] performWithoutAnimation:v34];
    }
    int v25 = [(UIImageView *)self->_backgroundImageView isHidden];
    [(UIImageView *)self->_backgroundImageView setHidden:0];
    long long v26 = [(PXActionableSectionHeaderView *)self backgroundImage];
    [(UIImageView *)self->_backgroundImageView setImage:v26];

    if (v3)
    {
      if (v25) {
        [(UIImageView *)self->_backgroundImageView setAlpha:0.0];
      }
      v14 = (void *)MEMORY[0x1E4FB1EB0];
      v33[0] = MEMORY[0x1E4F143A8];
      v33[1] = 3221225472;
      v33[2] = __59__PXActionableSectionHeaderView__updateBackgroundAnimated___block_invoke_5;
      v33[3] = &unk_1E5DD36F8;
      v33[4] = self;
      uint64_t v15 = v33;
      BOOL v16 = 0;
      goto LABEL_19;
    }
    [(PXActionableSectionHeaderView *)self backgroundImageAlpha];
    -[UIImageView setAlpha:](self->_backgroundImageView, "setAlpha:");
  }
LABEL_21:
  unint64_t v17 = [(PXActionableSectionHeaderView *)self backgroundStyle];
  if (v17 - 2 < 2)
  {
    [(UIImageView *)self->_backgroundImageView removeFromSuperview];
    v18 = self->_backgroundImageView;
    self->_backgroundImageView = 0;
  }
  else if (v17 != 1)
  {
    if (v17) {
      return;
    }
    int v8 = 664;
  }
  [*(id *)((char *)&self->super.super.super.super.isa + v8) removeFromSuperview];
  v19 = *(Class *)((char *)&self->super.super.super.super.isa + v8);
  *(Class *)((char *)&self->super.super.super.super.isa + v8) = 0;
}

uint64_t __59__PXActionableSectionHeaderView__updateBackgroundAnimated___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) addSubview:*(void *)(*(void *)(a1 + 32) + 656)];
  double v2 = *(void **)(a1 + 32);
  uint64_t v3 = v2[82];
  return [v2 sendSubviewToBack:v3];
}

uint64_t __59__PXActionableSectionHeaderView__updateBackgroundAnimated___block_invoke_2(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 656) setHidden:0];
}

uint64_t __59__PXActionableSectionHeaderView__updateBackgroundAnimated___block_invoke_3(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 656) setHidden:1];
}

uint64_t __59__PXActionableSectionHeaderView__updateBackgroundAnimated___block_invoke_4(uint64_t a1)
{
  [*(id *)(a1 + 32) addSubview:*(void *)(*(void *)(a1 + 32) + 664)];
  double v2 = *(void **)(a1 + 32);
  uint64_t v3 = v2[83];
  return [v2 sendSubviewToBack:v3];
}

uint64_t __59__PXActionableSectionHeaderView__updateBackgroundAnimated___block_invoke_5(uint64_t a1)
{
  [*(id *)(a1 + 32) backgroundImageAlpha];
  double v2 = *(void **)(*(void *)(a1 + 32) + 664);
  return objc_msgSend(v2, "setAlpha:");
}

uint64_t __59__PXActionableSectionHeaderView__updateBackgroundAnimated___block_invoke_6(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 664) setAlpha:0.0];
}

uint64_t __59__PXActionableSectionHeaderView__updateBackgroundAnimated___block_invoke_7(uint64_t result, int a2)
{
  if (a2) {
    return [*(id *)(*(void *)(result + 32) + 664) setHidden:1];
  }
  return result;
}

- (void)_updateSpacerLabelHiddenState
{
  uint64_t v3 = [(PXActionableSectionHeaderView *)self primaryText];
  if (v3
    && (id v4 = (void *)v3,
        [(PXActionableSectionHeaderView *)self secondaryText],
        id v5 = objc_claimAutoreleasedReturnValue(),
        v5,
        v4,
        v5))
  {
    BOOL v6 = [(PXActionableSectionHeaderView *)self layoutMode] == 1;
    v7 = [(PXActionableSectionHeaderView *)self spacerLabel];
    int v8 = v7;
    uint64_t v9 = v6;
  }
  else
  {
    v7 = [(PXActionableSectionHeaderView *)self spacerLabel];
    int v8 = v7;
    uint64_t v9 = 1;
  }
  [v7 setHidden:v9];

  [(PXActionableSectionHeaderView *)self setNeedsLayout];
}

- (void)_updateLabelColors
{
  uint64_t v3 = [(PXActionableSectionHeaderView *)self traitCollection];
  uint64_t v4 = [v3 userInterfaceStyle];

  unint64_t v5 = [(PXActionableSectionHeaderView *)self backgroundStyle];
  if ([(PXActionableSectionHeaderView *)self wantsBackground]) {
    BOOL v6 = [(PXActionableSectionHeaderView *)self backgroundStyle] != 0;
  }
  else {
    BOOL v6 = 0;
  }
  BOOL v7 = [(PXActionableSectionHeaderView *)self wantsBackground];
  BOOL v8 = 0;
  if (v7 && v4 == 2) {
    BOOL v8 = [(PXActionableSectionHeaderView *)self backgroundStyle] == 0;
  }
  char v9 = v5 == 2 || v6;
  if ((v9 & 1) != 0
    || v8
    || [(PXActionableSectionHeaderView *)self preferredUserInterfaceStyle] == 2)
  {
    v10 = [MEMORY[0x1E4FB1618] systemWhiteColor];
    [(UILabel *)self->_primaryLabel setTextColor:v10];

    uint64_t v11 = [MEMORY[0x1E4FB1618] systemWhiteColor];
    [(UILabel *)self->_spacerLabel setTextColor:v11];

    uint64_t v12 = [MEMORY[0x1E4FB1618] systemWhiteColor];
  }
  else
  {
    BOOL v13 = [MEMORY[0x1E4FB1618] labelColor];
    [(UILabel *)self->_primaryLabel setTextColor:v13];

    v14 = [MEMORY[0x1E4FB1618] systemGrayColor];
    [(UILabel *)self->_spacerLabel setTextColor:v14];

    uint64_t v12 = [MEMORY[0x1E4FB1618] systemGrayColor];
  }
  id v15 = (id)v12;
  [(UILabel *)self->_secondaryLabel setTextColor:v12];
}

- (void)_updateLabelLineNumbers
{
  if ([(PXActionableSectionHeaderView *)self layoutMode] == 1)
  {
    if ([(PXActionableSectionHeaderView *)self supportsMultipleLinesInCompactLayout])
    {
      uint64_t v3 = 2;
    }
    else
    {
      uint64_t v3 = 1;
    }
  }
  else
  {
    uint64_t v3 = 1;
  }
  uint64_t v4 = [(PXActionableSectionHeaderView *)self primaryLabel];
  uint64_t v5 = [v4 numberOfLines];

  if (v3 != v5)
  {
    BOOL v6 = [(PXActionableSectionHeaderView *)self primaryLabel];
    [v6 setNumberOfLines:v3];

    [(PXActionableSectionHeaderView *)self setNeedsLayout];
  }
  BOOL v7 = [(PXActionableSectionHeaderView *)self secondaryLabel];
  uint64_t v8 = [v7 numberOfLines];

  if (v3 != v8)
  {
    char v9 = [(PXActionableSectionHeaderView *)self secondaryLabel];
    [v9 setNumberOfLines:v3];

    [(PXActionableSectionHeaderView *)self setNeedsLayout];
  }
}

- (void)_updateLabelFonts
{
  uint64_t v3 = [(PXActionableSectionHeaderView *)self primaryLabel];
  uint64_t v4 = MEMORY[0x1AD10AAF0](5, 0x8000, 7);
  [v3 setFont:v4];

  uint64_t v5 = [(PXActionableSectionHeaderView *)self secondaryLabel];
  _PXConfigureHeaderSubtitleLabel(v5);

  BOOL v6 = [(PXActionableSectionHeaderView *)self spacerLabel];
  _PXConfigureHeaderSubtitleLabel(v6);

  [(PXActionableSectionHeaderView *)self _updateSystemActionButton];
  [(PXActionableSectionHeaderView *)self setNeedsLayout];
}

- (void)_updateWithCurrentTraits
{
  [(PXActionableSectionHeaderView *)self _updateLabelLineNumbers];
  [(PXActionableSectionHeaderView *)self _updateSpacerLabelHiddenState];
}

- (void)_actionButtonPressed:(id)a3
{
  id v5 = a3;
  if ([(PXActionableSectionHeaderView *)self actionButtonEnabled]
    && (*(unsigned char *)&self->_delegateFlags & 1) != 0)
  {
    uint64_t v4 = [(PXActionableSectionHeaderView *)self delegate];
    [v4 headerViewDidPressActionButton:v5 inHeaderView:self];
  }
}

- (void)_contentSizeCategoryDidChangeNotification:(id)a3
{
  [(PXActionableSectionHeaderView *)self _updateLabelFonts];
  [(PXActionableSectionHeaderView *)self _updateLabelLineNumbers];
  [(PXActionableSectionHeaderView *)self _updateSpacerLabelHiddenState];
}

- (BOOL)_disableRasterizeInAnimations
{
  return 1;
}

- (void)didTransitionFromLayout:(id)a3 toLayout:(id)a4
{
  self->_inLayoutTransition = 0;
  [(PXActionableSectionHeaderView *)self _updateBackdropViewGroupName];
}

- (void)willTransitionFromLayout:(id)a3 toLayout:(id)a4
{
  self->_inLayoutTransition = 1;
  [(PXActionableSectionHeaderView *)self _updateBackdropViewGroupName];
}

- (void)layoutSubviews
{
  v262.receiver = self;
  v262.super_class = (Class)PXActionableSectionHeaderView;
  [(PXActionableSectionHeaderView *)&v262 layoutSubviews];
  [(PXActionableSectionHeaderView *)self contentInsets];
  [(PXActionableSectionHeaderView *)self safeAreaInsets];
  UIEdgeInsetsMax();
  [(PXActionableSectionHeaderView *)self layoutMargins];
  UIEdgeInsetsMax();
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  [(PXActionableSectionHeaderView *)self bounds];
  double v261 = v6 + v11;
  double v260 = v4 + v12;
  double v14 = v13 - (v6 + v10);
  double v16 = v15 - (v4 + v8);
  double v18 = *MEMORY[0x1E4F1DB28];
  CGFloat v17 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  CGFloat v20 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  double v19 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  [(PXActionableSectionHeaderView *)self bounds];
  double v220 = v22;
  double v221 = v21;
  double v218 = v24;
  double v219 = v23;
  [(PXActionableSectionHeaderView *)self bounds];
  double v26 = v25;
  double v223 = v27;
  double v29 = v28;
  double v217 = v30;
  [(PXActionableSectionHeaderView *)self backgroundImageOverhang];
  double v216 = v31;
  BOOL v32 = [(PXActionableSectionHeaderView *)self _wantsActionButton];
  BOOL v33 = [(PXActionableSectionHeaderView *)self _wantsSecondaryButton];
  int64_t v34 = [(PXActionableSectionHeaderView *)self layoutMode];
  int v35 = v32 || v33;
  double v215 = v14;
  double rect = v16;
  double v224 = v26;
  double v222 = v29;
  if (v34 == 1)
  {
    double v235 = v18;
    if (!v35)
    {
      v80 = [(PXActionableSectionHeaderView *)self primaryLabel];
      objc_msgSend(v80, "sizeThatFits:", v14, v16);
      CGFloat v82 = v81;
      double v251 = v81;

      v273.origin.double x = v261;
      double v83 = v16;
      CGFloat v84 = v19;
      v273.origin.double y = v260;
      v273.size.width = v14;
      v273.size.CGFloat height = v82;
      CGFloat MaxY = CGRectGetMaxY(v273);
      v86 = [(PXActionableSectionHeaderView *)self secondaryLabel];
      objc_msgSend(v86, "sizeThatFits:", v14, v83);
      CGFloat v257 = v87;

      double v88 = v261;
      double v89 = v260;
      v225.size.width = v20;
      v225.size.CGFloat height = v19;
      double v90 = v235;
      v225.origin.double x = v235;
      v225.origin.double y = v17;
      CGFloat v226 = v17;
      CGFloat v227 = v20;
      double x = v235;
      CGFloat v91 = MaxY;
      CGFloat v92 = v14;
      double v255 = v261;
      CGFloat height = v225.size.height;
      CGFloat v94 = v251;
      goto LABEL_46;
    }
    v36 = [(id)*MEMORY[0x1E4FB2608] preferredContentSizeCategory];
    BOOL IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v36);

    double v247 = v17;
    double v239 = v20;
    double v244 = v19;
    if (IsAccessibilityCategory)
    {
      v38 = [(PXActionableSectionHeaderView *)self primaryLabel];
      objc_msgSend(v38, "sizeThatFits:", v14, v16);
      CGFloat v40 = v39;

      v263.origin.double y = v260;
      v263.origin.double x = v261;
      v263.size.width = v14;
      v263.size.CGFloat height = v16;
      double Width = CGRectGetWidth(v263);
      CGFloat v42 = v14;
      double v14 = Width;
      CGFloat v250 = v40;
      if (v32)
      {
        v43 = [(PXActionableSectionHeaderView *)self currentActionButton];
        [v43 sizeToFit];

        v44 = [(PXActionableSectionHeaderView *)self currentActionButton];
        [v44 frame];
        double v46 = v45;
        double v48 = v47;

        v264.origin.double x = v261;
        v264.origin.double y = v260;
        v264.size.width = v42;
        v264.size.CGFloat height = v16;
        CGFloat MinX = CGRectGetMinX(v264);
        v265.origin.double x = v261;
        v265.size.width = v14;
        v265.origin.double y = v260;
        v265.size.CGFloat height = v40;
        double v50 = CGRectGetMaxY(v265);
        double v51 = MinX;
        CGFloat v40 = v48;
        double v52 = v50 + 8.0;
        if (v33)
        {
          CGFloat v227 = v46;
          double v241 = v48;
LABEL_33:
          CGFloat v259 = v40;
          double v151 = v51;
          v152 = [(PXActionableSectionHeaderView *)self currentSecondaryButton];
          [v152 sizeToFit];

          v153 = [(PXActionableSectionHeaderView *)self currentSecondaryButton];
          [v153 frame];
          CGFloat v155 = v154;
          CGFloat v40 = v156;

          v285.origin.double x = v261;
          v285.origin.double y = v260;
          v285.size.width = v215;
          v285.size.CGFloat height = rect;
          CGFloat v149 = CGRectGetMinX(v285);
          double v158 = v260;
          double v157 = v261;
          if (v32)
          {
            double v157 = v151;
            double v158 = v52;
          }
          double v159 = v46;
          CGFloat v160 = v259;
          CGFloat v161 = CGRectGetMaxY(*(CGRect *)&v157);
          double v51 = v151;
          double v150 = v161 + 8.0;
          v225.size.width = v155;
          v225.size.CGFloat height = v40;
          double v46 = v155;
          v225.origin.double x = v149;
          v225.origin.double y = v161 + 8.0;
          goto LABEL_42;
        }
        CGFloat v149 = v51;
        double v150 = v50 + 8.0;
        CGFloat v227 = v46;
        double v241 = v48;
        v225.size.width = v239;
        v225.size.CGFloat height = v244;
        v225.origin.double x = v235;
        v225.origin.double y = v17;
      }
      else
      {
        double v46 = Width;
        double v51 = v18;
        double v52 = v17;
        CGFloat v227 = v239;
        double v241 = v244;
        CGFloat v149 = v261;
        double v150 = v260;
        v225.size.width = v239;
        v225.size.CGFloat height = v244;
        v225.origin.double x = v18;
        v225.origin.double y = v17;
        if (v33) {
          goto LABEL_33;
        }
      }
LABEL_42:
      double x = v51;
      CGFloat v226 = v52;
      CGFloat v171 = v149;
      double v172 = v46;
      CGFloat v173 = v40;
      CGFloat v174 = CGRectGetMaxY(*(CGRect *)(&v150 - 1));
      v290.origin.double x = v261;
      v290.origin.double y = v260;
      v290.size.width = v215;
      v290.size.CGFloat height = rect;
      double v255 = CGRectGetMinX(v290);
      v175 = [(PXActionableSectionHeaderView *)self secondaryLabel];
      objc_msgSend(v175, "sizeThatFits:", v215, rect);
      CGFloat v257 = v176;

      v291.origin.double x = v261;
      v291.origin.double y = v260;
      v291.size.width = v215;
      CGFloat v91 = v174;
      v291.size.CGFloat height = rect;
      CGFloat v92 = CGRectGetWidth(v291);
      CGFloat v84 = v244;
      CGFloat v20 = v239;
      CGFloat height = v241;
      double v89 = v260;
      double v90 = v235;
      CGFloat v94 = v250;
      double v88 = v261;
      goto LABEL_46;
    }
    double v95 = v18;
    double v96 = v14;
    double v243 = v19;
    CGFloat v226 = v17;
    CGFloat v227 = v20;
    double x = v18;
    if (v32)
    {
      v97 = [(PXActionableSectionHeaderView *)self currentActionButton];
      [v97 sizeToFit];

      v98 = [(PXActionableSectionHeaderView *)self currentActionButton];
      [v98 frame];

      UIRectCenteredYInRect();
      CGFloat v100 = v99;
      CGFloat v102 = v101;
      CGFloat v227 = v103;
      CGFloat v105 = v104;
      v274.origin.double x = v261;
      v274.origin.double y = v260;
      v274.size.width = v14;
      v274.size.CGFloat height = rect;
      double MaxX = CGRectGetMaxX(v274);
      v275.origin.double x = v100;
      double v19 = v244;
      v275.origin.double y = v102;
      v275.size.width = v227;
      v275.size.CGFloat height = v105;
      v276.origin.double x = MaxX - CGRectGetWidth(v275);
      CGFloat v17 = v247;
      double x = v276.origin.x;
      CGFloat v226 = v102;
      v276.origin.double y = v102;
      v276.size.width = v227;
      double v243 = v105;
      v276.size.CGFloat height = v105;
      double v95 = CGRectGetWidth(v276);
      double v96 = v14 - v95;
    }
    if (v33)
    {
      double v258 = v96;
      v107 = [(PXActionableSectionHeaderView *)self currentSecondaryButton];
      [v107 sizeToFit];

      v108 = [(PXActionableSectionHeaderView *)self currentSecondaryButton];
      [v108 frame];
      CGFloat v109 = v14;

      CGFloat v110 = v260;
      UIRectCenteredYInRect();
      CGFloat v112 = v111;
      CGFloat v114 = v113;
      double v116 = v115;
      CGFloat v118 = v117;
      v277.origin.double x = v261;
      v277.origin.double y = v260;
      v277.size.width = v109;
      CGFloat v119 = v116;
      v277.size.CGFloat height = rect;
      double v120 = CGRectGetMaxX(v277);
      v278.origin.double x = v112;
      v278.origin.double y = v114;
      v278.size.width = v119;
      v278.size.CGFloat height = v118;
      double v121 = CGRectGetWidth(v278);
      double v122 = v120 - v121;
      if (v32)
      {
        v279.origin.double x = v120 - v121;
        v279.origin.double y = v114;
        v279.size.width = v119;
        v279.size.CGFloat height = v118;
        double x = x - (CGRectGetWidth(v279) + 8.0);
      }
      v225.origin.double x = v122;
      v225.origin.double y = v114;
      v280.origin.double x = v122;
      v280.origin.double y = v114;
      v225.size.width = v119;
      v225.size.CGFloat height = v118;
      v280.size.width = v119;
      v280.size.CGFloat height = v118;
      double v96 = v258 - (CGRectGetWidth(v280) + 8.0);
    }
    else
    {
      v225.size.width = v20;
      v225.size.CGFloat height = v19;
      v225.origin.double x = v235;
      v225.origin.double y = v17;
      CGFloat v110 = v260;
    }
    CGFloat v162 = v96 + -8.0;
    v163 = [(PXActionableSectionHeaderView *)self primaryLabel];
    objc_msgSend(v163, "sizeThatFits:", v162, rect);
    CGFloat v165 = v164;

    v286.origin.double x = v261;
    v286.origin.double y = v110;
    v286.size.width = v162;
    v286.size.CGFloat height = rect;
    CGFloat v166 = v110;
    double v14 = CGRectGetWidth(v286);
    v287.origin.double x = v261;
    v287.origin.double y = v166;
    v287.size.width = v162;
    v287.size.CGFloat height = rect;
    CGFloat v167 = CGRectGetMinX(v287);
    v288.origin.double x = v261;
    v288.origin.double y = v166;
    v288.size.width = v14;
    CGFloat v253 = v165;
    v288.size.CGFloat height = v165;
    CGFloat v232 = CGRectGetMaxY(v288);
    v168 = [(PXActionableSectionHeaderView *)self secondaryLabel];
    objc_msgSend(v168, "sizeThatFits:", v162, rect);
    double v170 = v169;

    v289.origin.double x = v261;
    v289.origin.double y = v166;
    v289.size.width = v162;
    v289.size.CGFloat height = rect;
    CGFloat v234 = CGRectGetWidth(v289);
    double v255 = v167;
    CGFloat v257 = v170;
    if (v170 == 0.0)
    {
      UIRectCenteredYInRect();
      double v88 = v261;
    }
    else
    {
      double v88 = v261;
      double v89 = v166;
    }
    CGFloat v84 = v244;
    CGFloat v17 = v247;
    CGFloat v20 = v239;
    CGFloat height = v243;
    double v90 = v235;
    CGFloat v94 = v253;
    CGFloat v92 = v234;
  }
  else
  {
    if (v35)
    {
      double v53 = v14;
      double v242 = v19;
      CGFloat v226 = v17;
      CGFloat v227 = v20;
      double x = v18;
      if (v32)
      {
        v54 = [(PXActionableSectionHeaderView *)self currentActionButton];
        [v54 sizeToFit];

        v55 = [(PXActionableSectionHeaderView *)self currentActionButton];
        [v55 frame];
        double v245 = v19;

        UIRectCenteredYInRect();
        CGFloat v57 = v56;
        CGFloat v59 = v58;
        double v236 = v18;
        CGFloat v61 = v60;
        CGFloat v63 = v62;
        v266.origin.double x = v261;
        v266.origin.double y = v260;
        v266.size.width = v14;
        v266.size.CGFloat height = rect;
        double v64 = CGRectGetMaxX(v266);
        v267.origin.double x = v57;
        double v19 = v245;
        v267.origin.double y = v59;
        v267.size.width = v61;
        v267.size.CGFloat height = v63;
        v268.origin.double x = v64 - CGRectGetWidth(v267);
        CGFloat v227 = v61;
        double x = v268.origin.x;
        CGFloat v226 = v59;
        v268.origin.double y = v59;
        v268.size.width = v61;
        double v18 = v236;
        double v242 = v63;
        v268.size.CGFloat height = v63;
        double v16 = rect;
        double v53 = v14 - CGRectGetWidth(v268);
      }
      if (v33)
      {
        v65 = [(PXActionableSectionHeaderView *)self currentSecondaryButton];
        [v65 sizeToFit];

        v66 = [(PXActionableSectionHeaderView *)self currentSecondaryButton];
        [v66 frame];
        CGFloat v67 = v14;

        CGFloat v68 = v260;
        UIRectCenteredYInRect();
        CGFloat v70 = v69;
        CGFloat v72 = v71;
        CGFloat v74 = v73;
        CGFloat v76 = v75;
        v269.origin.double x = v261;
        v269.origin.double y = v260;
        v269.size.width = v67;
        v269.size.CGFloat height = rect;
        double v77 = CGRectGetMaxX(v269);
        v270.origin.double x = v70;
        v270.origin.double y = v72;
        v270.size.width = v74;
        v270.size.CGFloat height = v76;
        double v78 = v77 - CGRectGetWidth(v270);
        if (v32)
        {
          v271.origin.double x = v78;
          v271.origin.double y = v72;
          v271.size.width = v74;
          v271.size.CGFloat height = v76;
          double x = x - (CGRectGetWidth(v271) + 8.0);
        }
        v225.origin.double x = v78;
        v225.origin.double y = v72;
        v272.origin.double x = v78;
        v272.origin.double y = v72;
        v225.size.width = v74;
        v225.size.CGFloat height = v76;
        v272.size.width = v74;
        v272.size.CGFloat height = v76;
        double v79 = v53 - (CGRectGetWidth(v272) + 8.0);
        double v16 = rect;
      }
      else
      {
        v225.size.width = v20;
        v225.size.CGFloat height = v19;
        v225.origin.double x = v18;
        v225.origin.double y = v17;
        CGFloat v68 = v260;
        double v79 = v53;
      }
    }
    else
    {
      v225.size.width = v20;
      v225.size.CGFloat height = v19;
      v225.origin.double x = v18;
      v225.origin.double y = v17;
      double v242 = v19;
      CGFloat v226 = v17;
      CGFloat v227 = v20;
      double v79 = v14;
      double x = v18;
      CGFloat v68 = v260;
    }
    v123 = [(PXActionableSectionHeaderView *)self primaryLabel];
    [v123 sizeToFit];

    v124 = [(PXActionableSectionHeaderView *)self spacerLabel];
    [v124 sizeToFit];

    v125 = [(PXActionableSectionHeaderView *)self secondaryLabel];
    [v125 sizeToFit];

    v126 = [(PXActionableSectionHeaderView *)self primaryLabel];
    [v126 frame];
    UIRectCenteredYInRect();
    CGFloat v233 = v127;
    double v252 = v129;
    double v256 = v128;

    v130 = [(PXActionableSectionHeaderView *)self spacerLabel];
    [v130 frame];
    UIRectCenteredYInRect();
    CGFloat v248 = v131;
    CGFloat v240 = v132;
    CGFloat v246 = v133;

    v134 = [(PXActionableSectionHeaderView *)self secondaryLabel];
    [v134 frame];
    UIRectCenteredYInRect();
    CGFloat v232 = v135;
    double v237 = v136;
    CGFloat v257 = v137;

    v138 = [(PXActionableSectionHeaderView *)self primaryLabel];
    [v138 frame];
    double v139 = CGRectGetWidth(v281);

    v140 = [(PXActionableSectionHeaderView *)self spacerLabel];
    [v140 frame];
    double v141 = CGRectGetWidth(v282) + 16.0;

    v142 = [(PXActionableSectionHeaderView *)self secondaryLabel];
    [v142 frame];
    double v143 = CGRectGetWidth(v283);

    v284.origin.double x = v261;
    v284.origin.double y = v68;
    v284.size.width = v79;
    v284.size.CGFloat height = v16;
    double v144 = CGRectGetWidth(v284) - v141;
    double v145 = v144 * 0.75;
    double v146 = v144 - v144 * 0.75;
    if (v139 >= v144 * 0.75 || v143 >= v146)
    {
      CGFloat v148 = v252;
      if (v139 >= v145 || v143 < v146)
      {
        if (v139 < v145)
        {
          double v147 = v144 * 0.75;
        }
        else
        {
          double v147 = v144 * 0.75;
          if (v143 < v146)
          {
            double v147 = v144 - v143 - v141;
            double v146 = v237;
          }
        }
      }
      else
      {
        double v146 = v144 - v139 - v141;
        double v147 = v256;
      }
    }
    else
    {
      double v146 = v237;
      CGFloat v148 = v252;
      double v147 = v256;
    }
    double v254 = v147;
    v292.origin.double y = v260;
    v292.origin.double x = v261;
    v292.size.width = v79;
    v292.size.CGFloat height = rect;
    v293.origin.double x = CGRectGetMinX(v292);
    CGFloat v177 = v293.origin.x;
    v293.origin.double y = v233;
    v293.size.width = v147;
    CGFloat v178 = v148;
    v293.size.CGFloat height = v148;
    double v90 = CGRectGetMaxX(v293) + 8.0;
    v294.origin.double x = v90;
    CGFloat v84 = v246;
    CGFloat v17 = v248;
    v294.origin.double y = v248;
    CGFloat v20 = v240;
    v294.size.width = v240;
    v294.size.CGFloat height = v246;
    CGFloat v179 = CGRectGetMaxX(v294);
    CGFloat v94 = v178;
    double v88 = v177;
    CGFloat v92 = v146;
    double v89 = v233;
    double v255 = v179 + 8.0;
    CGFloat height = v242;
    double v14 = v254;
  }
  CGFloat v91 = v232;
LABEL_46:
  double v180 = v88;
  double v181 = v14;
  CGRect v231 = CGRectIntegral(*(CGRect *)(&v89 - 1));
  v295.origin.double x = v90;
  v295.origin.double y = v17;
  v295.size.width = v20;
  v295.size.CGFloat height = v84;
  CGRect v238 = CGRectIntegral(v295);
  v296.origin.double x = v255;
  v296.size.CGFloat height = v257;
  v296.origin.double y = v91;
  v296.size.width = v92;
  CGRect v249 = CGRectIntegral(v296);
  v297.size.width = v227;
  v297.origin.double x = x;
  v297.origin.double y = v226;
  v297.size.CGFloat height = height;
  CGRect v298 = CGRectIntegral(v297);
  double v182 = v298.origin.x;
  double y = v298.origin.y;
  double v184 = v298.size.width;
  double v185 = v298.size.height;
  CGRect v299 = CGRectIntegral(v225);
  double v186 = v299.origin.x;
  double v187 = v299.origin.y;
  double v188 = v299.size.width;
  double v189 = v299.size.height;
  if ([(PXActionableSectionHeaderView *)self _shouldReverseLayoutDirection])
  {
    v231.origin.double x = MEMORY[0x1AD10B740](v231.origin.x, v231.origin.y, v231.size.width, v231.size.height, v261, v260, v215, rect);
    v231.origin.double y = v190;
    v231.size.width = v191;
    v231.size.CGFloat height = v192;
    v238.origin.double x = MEMORY[0x1AD10B740](v238.origin.x, v238.origin.y, v238.size.width, v238.size.height, v261, v260, v215, rect);
    v238.origin.double y = v193;
    v238.size.width = v194;
    v238.size.CGFloat height = v195;
    v249.origin.double x = MEMORY[0x1AD10B740](v249.origin.x, v249.origin.y, v249.size.width, v249.size.height, v261, v260, v215, rect);
    v249.origin.double y = v196;
    v249.size.width = v197;
    v249.size.CGFloat height = v198;
    double v229 = MEMORY[0x1AD10B740](v182, y, v184, v185, v261, v260, v215, rect);
    double y = v199;
    double v184 = v200;
    double v185 = v201;
    double v186 = MEMORY[0x1AD10B740](v186, v187, v188, v189, v261, v260, v215, rect);
    double v187 = v202;
    double v188 = v203;
    double v189 = v204;
    double v206 = v216;
    double v205 = v217;
  }
  else
  {
    double v206 = v216;
    double v205 = v217;
    double v229 = v182;
  }
  double v207 = v206 + v205;
  v208 = [(PXActionableSectionHeaderView *)self visualEffectView];
  objc_msgSend(v208, "setFrame:", v221, v220, v219, v218);

  v209 = [(PXActionableSectionHeaderView *)self backgroundImageView];
  objc_msgSend(v209, "setFrame:", v224, v223, v222, v207);

  v210 = [(PXActionableSectionHeaderView *)self primaryLabel];
  objc_msgSend(v210, "setFrame:", v231.origin.x, v231.origin.y, v231.size.width, v231.size.height);

  v211 = [(PXActionableSectionHeaderView *)self spacerLabel];
  objc_msgSend(v211, "setFrame:", v238.origin.x, v238.origin.y, v238.size.width, v238.size.height);

  v212 = [(PXActionableSectionHeaderView *)self secondaryLabel];
  objc_msgSend(v212, "setFrame:", v249.origin.x, v249.origin.y, v249.size.width, v249.size.height);

  v213 = [(PXActionableSectionHeaderView *)self currentActionButton];
  objc_msgSend(v213, "setFrame:", v229, y, v184, v185);

  v214 = [(PXActionableSectionHeaderView *)self currentSecondaryButton];
  objc_msgSend(v214, "setFrame:", v186, v187, v188, v189);
}

- (double)heightForSizeClass:(int64_t)a3 width:(double)a4 safeAreaInsets:(UIEdgeInsets)a5
{
  double v8 = objc_msgSend(MEMORY[0x1E4FB1E20], "traitCollectionWithHorizontalSizeClass:");
  [(PXActionableSectionHeaderView *)self setSelfSizingTraits:v8];

  [(PXActionableSectionHeaderView *)self contentInsets];
  UIEdgeInsetsMax();
  double v9 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  double v12 = a4 - v10 - v11;
  if ([(PXActionableSectionHeaderView *)self layoutModeForHorizontalSizeClass:a3] == 1)
  {
    if ([(PXActionableSectionHeaderView *)self _wantsActionButton]
      || [(PXActionableSectionHeaderView *)self _wantsSecondaryButton])
    {
      double v13 = [(id)*MEMORY[0x1E4FB2608] preferredContentSizeCategory];
      BOOL IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v13);

      if (IsAccessibilityCategory)
      {
        double v15 = [(PXActionableSectionHeaderView *)self primaryLabel];
        objc_msgSend(v15, "sizeThatFits:", v12, v9);
        double v17 = v16;

        double v18 = [(PXActionableSectionHeaderView *)self currentActionButton];
        objc_msgSend(v18, "sizeThatFits:", v12, v9);
        double v20 = v19;

        double v21 = [(PXActionableSectionHeaderView *)self currentSecondaryButton];
        objc_msgSend(v21, "sizeThatFits:", v12, v9);
        double v23 = v22;

        double v24 = [(PXActionableSectionHeaderView *)self secondaryLabel];
        objc_msgSend(v24, "sizeThatFits:", v12, v9);
        double v26 = v25;

        if ([(PXActionableSectionHeaderView *)self _wantsActionButton]) {
          double v27 = 8.0;
        }
        else {
          double v27 = 0.0;
        }
        BOOL v28 = [(PXActionableSectionHeaderView *)self _wantsSecondaryButton];
        double v29 = v27 + 8.0;
        if (!v28) {
          double v29 = v27;
        }
        double v30 = v17 + v20 + v23 + v26 + v29;
      }
      else
      {
        double v45 = [(PXActionableSectionHeaderView *)self currentActionButton];
        objc_msgSend(v45, "sizeThatFits:", v12, v9);
        double v47 = v46;
        double v49 = v48;

        double v50 = [(PXActionableSectionHeaderView *)self currentSecondaryButton];
        objc_msgSend(v50, "sizeThatFits:", v12, v9);
        double v52 = v51;
        double v54 = v53;

        double v55 = v12 - (v47 + v52 + 8.0);
        double v56 = [(PXActionableSectionHeaderView *)self primaryLabel];
        objc_msgSend(v56, "sizeThatFits:", v55, v9);
        double v58 = v57;

        CGFloat v59 = [(PXActionableSectionHeaderView *)self secondaryLabel];
        objc_msgSend(v59, "sizeThatFits:", v55, v9);
        double v61 = v60;

        if (v61 <= 0.0) {
          double v30 = fmax(fmax(v58, v49), v54);
        }
        else {
          double v30 = v58 + v61;
        }
      }
    }
    else
    {
      double v62 = [(PXActionableSectionHeaderView *)self primaryLabel];
      objc_msgSend(v62, "sizeThatFits:", v12, v9);
      double v64 = v63;

      v65 = [(PXActionableSectionHeaderView *)self secondaryLabel];
      objc_msgSend(v65, "sizeThatFits:", v12, v9);
      double v67 = v66;

      double v30 = v64 + v67;
    }
  }
  else
  {
    double v31 = [(PXActionableSectionHeaderView *)self primaryLabel];
    objc_msgSend(v31, "sizeThatFits:", v12, v9);
    double v33 = v32;

    int64_t v34 = [(PXActionableSectionHeaderView *)self secondaryLabel];
    objc_msgSend(v34, "sizeThatFits:", v12, v9);
    double v36 = v35;

    v37 = [(PXActionableSectionHeaderView *)self currentActionButton];
    objc_msgSend(v37, "sizeThatFits:", v12, v9);
    double v39 = v38;

    CGFloat v40 = [(PXActionableSectionHeaderView *)self currentSecondaryButton];
    objc_msgSend(v40, "sizeThatFits:", v12, v9);
    double v42 = v41;

    double v30 = fmax(v33, fmax(v36, fmax(v39, v42)));
  }
  double v43 = v30 + 16.0;
  [(PXActionableSectionHeaderView *)self setSelfSizingTraits:0];
  return round(v43);
}

- (double)baselineToBottomSpacing
{
  if ([(PXActionableSectionHeaderView *)self layoutMode] == 1
    && ([(PXActionableSectionHeaderView *)self secondaryText],
        (uint64_t v3 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    double v4 = (void *)v3;
    double v5 = [(UILabel *)self->_secondaryLabel font];
    [v5 descender];
    double v7 = v6;
  }
  else
  {
    double v4 = [(UILabel *)self->_primaryLabel font];
    [v4 descender];
    double v7 = v8;
  }

  return 8.0 - v7;
}

- (void)setPreferredUserInterfaceStyle:(int64_t)a3
{
  if (self->_preferredUserInterfaceStyle != a3)
  {
    self->_preferredUserInterfaceStyle = a3;
    [(PXActionableSectionHeaderView *)self _updateBackgroundAnimated:0];
    [(PXActionableSectionHeaderView *)self _updateLabelColors];
    [(PXActionableSectionHeaderView *)self _updateBackdropActionButton];
    [(PXActionableSectionHeaderView *)self _updateFilterButton];
  }
}

- (void)setSupportsMultipleLinesInCompactLayout:(BOOL)a3
{
  if (self->_supportsMultipleLinesInCompactLayout != a3)
  {
    self->_supportsMultipleLinesInCompactLayout = a3;
    [(PXActionableSectionHeaderView *)self _updateLabelLineNumbers];
  }
}

- (void)setContentInsets:(UIEdgeInsets)a3
{
  if (self->_contentInsets.left != a3.left
    || self->_contentInsets.top != a3.top
    || self->_contentInsets.right != a3.right
    || self->_contentInsets.bottom != a3.bottom)
  {
    self->_contentInsets = a3;
    [(PXActionableSectionHeaderView *)self setNeedsLayout];
  }
}

- (void)setBackdropViewGroupName:(id)a3
{
  double v8 = (NSString *)a3;
  double v4 = self->_backdropViewGroupName;
  if (v4 == v8)
  {
  }
  else
  {
    BOOL v5 = [(NSString *)v4 isEqualToString:v8];

    if (!v5)
    {
      double v6 = (NSString *)[(NSString *)v8 copy];
      backdropViewGroupName = self->_backdropViewGroupName;
      self->_backdropViewGroupName = v6;

      [(PXActionableSectionHeaderView *)self _updateBackdropViewGroupName];
    }
  }
}

- (void)setBackgroundImageOverhang:(double)a3
{
  if (self->_backgroundImageOverhang != a3)
  {
    self->_backgroundImageOverhang = a3;
    [(PXActionableSectionHeaderView *)self setNeedsLayout];
  }
}

- (void)setBackgroundImageAlpha:(double)a3
{
  if (self->_backgroundImageAlpha != a3)
  {
    if (a3 < 0.0 || a3 > 1.0)
    {
      double v7 = [MEMORY[0x1E4F28B00] currentHandler];
      objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXActionableSectionHeaderView.m", 608, @"Invalid alpha %lf", *(void *)&a3);
    }
    self->_backgroundImageAlpha = a3;
    [(PXActionableSectionHeaderView *)self _updateBackgroundAnimated:0];
  }
}

- (void)setBackgroundImage:(id)a3
{
  BOOL v5 = (UIImage *)a3;
  if (self->_backgroundImage != v5)
  {
    double v6 = v5;
    objc_storeStrong((id *)&self->_backgroundImage, a3);
    [(PXActionableSectionHeaderView *)self _updateBackgroundAnimated:0];
    BOOL v5 = v6;
  }
}

- (void)performChangesToGroupedBackgroundPropertiesAnimated:(BOOL)a3 withBlock:(id)a4
{
  BOOL v4 = a3;
  id v7 = a4;
  id v9 = v7;
  if (self->_isModifyingGroupedBackgroundProperties)
  {
    double v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2 object:self file:@"PXActionableSectionHeaderView.m" lineNumber:583 description:@"Modifying grouped background properties recursively not allowed"];

    id v7 = v9;
  }
  self->_isModifyingGroupedBackgroundProperties = 1;
  self->_wantsGroupedBackgroundPropertiesUpdate = 0;
  (*((void (**)(void))v7 + 2))();
  self->_isModifyingGroupedBackgroundProperties = 0;
  if (self->_wantsGroupedBackgroundPropertiesUpdate)
  {
    [(PXActionableSectionHeaderView *)self _updateBackgroundAnimated:v4];
    [(PXActionableSectionHeaderView *)self _updateLabelColors];
    [(PXActionableSectionHeaderView *)self _updateBackdropActionButton];
    [(PXActionableSectionHeaderView *)self _updateFilterButton];
  }
}

- (id)_backdropButtonBackgroundColor
{
  if ([(PXActionableSectionHeaderView *)self backgroundStyle] == 3)
  {
    if ([(PXActionableSectionHeaderView *)self wantsBackground])
    {
      uint64_t v3 = [(PXActionableSectionHeaderView *)self traitCollection];
      if ([v3 userInterfaceStyle] == 2)
      {
        BOOL v4 = [MEMORY[0x1E4FB1618] systemGray5Color];
        BOOL v5 = v4;
        double v6 = 0.95;
      }
      else
      {
        BOOL v4 = [MEMORY[0x1E4FB1618] systemGray2Color];
        BOOL v5 = v4;
        double v6 = 0.98;
      }
      double v8 = [v4 colorWithAlphaComponent:v6];

      goto LABEL_12;
    }
    goto LABEL_8;
  }
  if (![(PXActionableSectionHeaderView *)self actionButtonEnabled]
    || [(PXActionableSectionHeaderView *)self buttonStyle] != 2)
  {
LABEL_8:
    uint64_t v7 = [MEMORY[0x1E4FB1618] tertiarySystemFillColor];
    goto LABEL_9;
  }
  uint64_t v7 = [(PXActionableSectionHeaderView *)self tintColor];
LABEL_9:
  double v8 = (void *)v7;
LABEL_12:
  return v8;
}

- (id)_backdropButtonForegroundColor
{
  if ([(PXActionableSectionHeaderView *)self backgroundStyle] == 3)
  {
    if ([(PXActionableSectionHeaderView *)self wantsBackground]) {
      goto LABEL_16;
    }
LABEL_15:
    double v10 = [(PXActionableSectionHeaderView *)self tintColor];
    goto LABEL_17;
  }
  unint64_t v3 = [(PXActionableSectionHeaderView *)self buttonStyle];
  BOOL v4 = [(PXActionableSectionHeaderView *)self _wantsOverBackgroundBehavior];
  BOOL v5 = [(PXActionableSectionHeaderView *)self traitCollection];
  if ([v5 userInterfaceStyle] == 2)
  {
  }
  else
  {
    int64_t v6 = [(PXActionableSectionHeaderView *)self preferredUserInterfaceStyle];

    int v7 = v6 == 2 || v4;
    if (v7 != 1) {
      goto LABEL_14;
    }
  }
  unint64_t v8 = [(PXActionableSectionHeaderView *)self backgroundStyle];
  if (v3 != 2 && v8 == 1) {
    goto LABEL_16;
  }
LABEL_14:
  if (v3 != 2) {
    goto LABEL_15;
  }
LABEL_16:
  double v10 = [MEMORY[0x1E4FB1618] whiteColor];
LABEL_17:
  return v10;
}

- (BOOL)_wantsOverBackgroundBehavior
{
  if ([(PXActionableSectionHeaderView *)self _isMovingFast])
  {
    return [(PXActionableSectionHeaderView *)self avoidsTintedButtonsAtHighSpeed];
  }
  else
  {
    return [(PXActionableSectionHeaderView *)self wantsBackground];
  }
}

- (BOOL)_isMovingFast
{
  return [(PXActionableSectionHeaderView *)self speedRegime] > 1;
}

- (void)setAvoidsTintedButtonsAtHighSpeed:(BOOL)a3
{
  if (self->_avoidsTintedButtonsAtHighSpeed != a3)
  {
    self->_avoidsTintedButtonsAtHighSpeed = a3;
    [(PXActionableSectionHeaderView *)self _updateBackdropActionButton];
    [(PXActionableSectionHeaderView *)self _updateFilterButton];
  }
}

- (void)setSpeedRegime:(int64_t)a3
{
  if (self->_speedRegime != a3)
  {
    self->_speedRegime = a3;
    if (self->_isModifyingGroupedBackgroundProperties)
    {
      self->_wantsGroupedBackgroundPropertiesUpdate = 1;
    }
    else
    {
      [(PXActionableSectionHeaderView *)self _updateBackgroundAnimated:0];
      [(PXActionableSectionHeaderView *)self _updateBackdropActionButton];
      [(PXActionableSectionHeaderView *)self _updateFilterButton];
    }
  }
}

- (void)setWantsBackground:(BOOL)a3 animated:(BOOL)a4
{
  if (self->_wantsBackground != a3)
  {
    self->_wantsBackground = a3;
    if (self->_isModifyingGroupedBackgroundProperties)
    {
      self->_wantsGroupedBackgroundPropertiesUpdate = 1;
    }
    else
    {
      [(PXActionableSectionHeaderView *)self _updateBackgroundAnimated:a4];
      [(PXActionableSectionHeaderView *)self _updateLabelColors];
      [(PXActionableSectionHeaderView *)self _updateBackdropActionButton];
      [(PXActionableSectionHeaderView *)self _updateFilterButton];
    }
  }
}

- (void)setWantsBackground:(BOOL)a3
{
}

- (void)setBackgroundStyle:(unint64_t)a3
{
  if (self->_backgroundStyle != a3)
  {
    self->_backgroundStyle = a3;
    [(PXActionableSectionHeaderView *)self _updateBackgroundAnimated:0];
    [(PXActionableSectionHeaderView *)self _updateLabelColors];
    [(PXActionableSectionHeaderView *)self _updateBackdropActionButton];
    [(PXActionableSectionHeaderView *)self _updateFilterButton];
  }
}

- (void)_updateFilterButton
{
  unint64_t v3 = [(PXActionableSectionHeaderView *)self _backdropButtonForegroundColor];
  BOOL v4 = [(PXActionableSectionHeaderView *)self filterButtonController];
  [v4 setForegroundColor:v3];

  id v6 = [(PXActionableSectionHeaderView *)self _backdropButtonBackgroundColor];
  BOOL v5 = [(PXActionableSectionHeaderView *)self filterButtonController];
  [v5 setBackgroundColor:v6];
}

- (void)_updateSystemActionButton
{
  v20[1] = *MEMORY[0x1E4F143B8];
  unint64_t v3 = MEMORY[0x1AD10AAF0](8, 0x8000, 7);
  uint64_t v19 = *MEMORY[0x1E4FB06F8];
  v20[0] = v3;
  BOOL v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:&v19 count:1];
  if ([(PXActionableSectionHeaderView *)self buttonStyle] == 3)
  {
    BOOL v5 = (void *)MEMORY[0x1E4FB1830];
    id v6 = [MEMORY[0x1E4FB08E0] systemFontOfSize:20.0];
    int v7 = [v5 configurationWithFont:v6];

    unint64_t v8 = [MEMORY[0x1E4FB1818] systemImageNamed:@"checkmark.circle" withConfiguration:v7];
    id v9 = 0;
    double v10 = 0;
    double v11 = 0;
  }
  else
  {
    uint64_t v12 = [(PXActionableSectionHeaderView *)self actionText];
    double v13 = (void *)v12;
    double v14 = &stru_1F00B0030;
    if (v12) {
      double v14 = (__CFString *)v12;
    }
    double v11 = v14;

    double v10 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:v11 attributes:v4];
    int v7 = [MEMORY[0x1E4F1CA60] dictionaryWithDictionary:v4];
    double v15 = [MEMORY[0x1E4FB1618] lightGrayColor];
    [v7 setObject:v15 forKeyedSubscript:*MEMORY[0x1E4FB0700]];

    id v9 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:v11 attributes:v7];
    unint64_t v8 = 0;
  }

  double v16 = [(PXActionableSectionHeaderView *)self systemActionButton];
  [v16 setImage:v8 forState:0];
  [v16 setImage:v8 forState:2];
  [v16 setAttributedTitle:v10 forState:0];
  [v16 setAttributedTitle:v9 forState:2];
  double v17 = [v16 titleLabel];
  double v18 = [v17 layer];
  [v18 removeAllAnimations];

  [v16 sizeToFit];
  [v16 layoutIfNeeded];
  [(PXActionableSectionHeaderView *)self setNeedsLayout];
}

- (void)_updateBackdropActionButton
{
  uint64_t v3 = [(PXActionableSectionHeaderView *)self actionText];
  if (!v3) {
    return;
  }
  BOOL v4 = (void *)v3;
  BOOL v5 = [(PXActionableSectionHeaderView *)self backdropButtonSpec];

  if (!v5) {
    return;
  }
  id v6 = [(PXActionableSectionHeaderView *)self actionText];
  int v7 = [(PXActionableSectionHeaderView *)self backdropButtonSpec];
  id v20 = +[PXCuratedLibraryOverlayButtonConfiguration configurationWithTitle:v6 spec:v7];

  if ([(PXActionableSectionHeaderView *)self actionButtonEnabled]) {
    unint64_t v8 = &__block_literal_global_216036;
  }
  else {
    unint64_t v8 = 0;
  }
  [v20 setActionHandler:v8];
  if ([(PXActionableSectionHeaderView *)self actionButtonEnabled])
  {
    unint64_t v9 = [(PXActionableSectionHeaderView *)self buttonStyle];
    BOOL v10 = [(PXActionableSectionHeaderView *)self _wantsOverBackgroundBehavior];
    double v11 = [(PXActionableSectionHeaderView *)self traitCollection];
    if ([v11 userInterfaceStyle] == 2)
    {

LABEL_15:
      unint64_t v15 = [(PXActionableSectionHeaderView *)self backgroundStyle];
      if (v9 == 2) {
        uint64_t v16 = 14;
      }
      else {
        uint64_t v16 = 0;
      }
      if (v15 == 1) {
        uint64_t v12 = v16;
      }
      else {
        uint64_t v12 = 14;
      }
      goto LABEL_22;
    }
    int64_t v13 = [(PXActionableSectionHeaderView *)self preferredUserInterfaceStyle];

    int v14 = v13 == 2 || v10;
    if (v14 == 1) {
      goto LABEL_15;
    }
    uint64_t v12 = 14;
  }
  else
  {
    uint64_t v12 = 8;
  }
LABEL_22:
  [v20 setStyle:v12];
  double v17 = [(PXActionableSectionHeaderView *)self _backdropButtonForegroundColor];
  [v20 setTintColor:v17];

  double v18 = [(PXActionableSectionHeaderView *)self _backdropButtonBackgroundColor];
  [v20 setBackgroundColor:v18];

  uint64_t v19 = [(PXActionableSectionHeaderView *)self backdropActionButton];
  [v19 setUserData:v20];
}

- (void)_updateActionButtonConfiguration
{
  unint64_t v3 = [(PXActionableSectionHeaderView *)self buttonStyle];
  if (v3 - 1 < 2)
  {
    [(PXActionableSectionHeaderView *)self _updateBackdropActionButton];
    [(PXActionableSectionHeaderView *)self _updateFilterButton];
  }
  else if (v3 == 3 || !v3)
  {
    [(PXActionableSectionHeaderView *)self _updateSystemActionButton];
  }
}

- (void)_updateSecondaryButtonAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  BOOL v5 = [(PXActionableSectionHeaderView *)self filterButtonControllerFactory];

  currentSecondaryButton = self->_currentSecondaryButton;
  if (v5)
  {
    if (!currentSecondaryButton)
    {
      (*((void (**)(void))self->_filterButtonControllerFactory + 2))();
      int v7 = (PXPhotosFilterToggleButtonController *)objc_claimAutoreleasedReturnValue();
      filterButtonController = self->_filterButtonController;
      self->_filterButtonController = v7;

      unint64_t v9 = [(PXContentFilterToggleButtonController *)self->_filterButtonController button];
      BOOL v10 = self->_currentSecondaryButton;
      self->_currentSecondaryButton = v9;

      [(PXActionableSectionHeaderView *)self addSubview:self->_currentSecondaryButton];
    }
    if (v3) {
      goto LABEL_5;
    }
  }
  else
  {
    [(UIButton *)currentSecondaryButton removeFromSuperview];
    double v11 = self->_currentSecondaryButton;
    self->_currentSecondaryButton = 0;

    uint64_t v12 = self->_filterButtonController;
    self->_filterButtonController = 0;

    if (v3)
    {
LABEL_5:
      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3221225472;
      v15[2] = __64__PXActionableSectionHeaderView__updateSecondaryButtonAnimated___block_invoke;
      v15[3] = &unk_1E5DD36F8;
      v15[4] = self;
      [MEMORY[0x1E4FB1EB0] animateWithDuration:196608 delay:v15 options:0 animations:0.3 completion:0.0];
      goto LABEL_11;
    }
  }
  if ([(PXActionableSectionHeaderView *)self showsSecondaryButton]) {
    double v13 = 1.0;
  }
  else {
    double v13 = 0.0;
  }
  int v14 = [(PXActionableSectionHeaderView *)self currentSecondaryButton];
  [v14 setAlpha:v13];

LABEL_11:
  [(PXActionableSectionHeaderView *)self setNeedsLayout];
}

void __64__PXActionableSectionHeaderView__updateSecondaryButtonAnimated___block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) showsSecondaryButton]) {
    double v2 = 1.0;
  }
  else {
    double v2 = 0.0;
  }
  id v3 = [*(id *)(a1 + 32) currentSecondaryButton];
  [v3 setAlpha:v2];
}

- (void)_updateActionButtonAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  unint64_t v5 = [(PXActionableSectionHeaderView *)self buttonStyle];
  if (v5 - 1 < 2)
  {
    p_backdropActionButton = (id *)&self->_backdropActionButton;
    if (self->_backdropActionButton)
    {
      int v7 = &OBJC_IVAR___PXActionableSectionHeaderView__systemActionButton;
      goto LABEL_11;
    }
    BOOL v10 = objc_alloc_init(PXCuratedLibraryOverlayButton);
    id v11 = *p_backdropActionButton;
    id *p_backdropActionButton = v10;

    int v7 = &OBJC_IVAR___PXActionableSectionHeaderView__systemActionButton;
LABEL_10:
    [*p_backdropActionButton addTarget:self action:sel__actionButtonPressed_ forControlEvents:64];
    [(PXActionableSectionHeaderView *)self addSubview:*p_backdropActionButton];
    goto LABEL_11;
  }
  if (v5 == 3 || !v5)
  {
    p_backdropActionButton = (id *)&self->_systemActionButton;
    if (self->_systemActionButton)
    {
      int v7 = &OBJC_IVAR___PXActionableSectionHeaderView__backdropActionButton;
LABEL_11:
      uint64_t v12 = *v7;
      [*(id *)((char *)&self->super.super.super.super.isa + v12) removeFromSuperview];
      double v13 = *(Class *)((char *)&self->super.super.super.super.isa + v12);
      *(Class *)((char *)&self->super.super.super.super.isa + v12) = 0;

      goto LABEL_12;
    }
    uint64_t v8 = [MEMORY[0x1E4FB14D0] buttonWithType:1];
    id v9 = *p_backdropActionButton;
    id *p_backdropActionButton = (id)v8;

    [*p_backdropActionButton setContentVerticalAlignment:0];
    int v7 = &OBJC_IVAR___PXActionableSectionHeaderView__backdropActionButton;
    goto LABEL_10;
  }
LABEL_12:
  BOOL v14 = [(PXActionableSectionHeaderView *)self showsActionButton];
  if (v3)
  {
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __61__PXActionableSectionHeaderView__updateActionButtonAnimated___block_invoke;
    v18[3] = &unk_1E5DCFE98;
    v18[4] = self;
    BOOL v19 = v14;
    [MEMORY[0x1E4FB1EB0] animateWithDuration:196608 delay:v18 options:0 animations:0.3 completion:0.0];
  }
  else
  {
    if (v14) {
      double v15 = 1.0;
    }
    else {
      double v15 = 0.0;
    }
    uint64_t v16 = [(PXActionableSectionHeaderView *)self systemActionButton];
    [v16 setAlpha:v15];

    double v17 = [(PXActionableSectionHeaderView *)self backdropActionButton];
    [v17 setAlpha:v15];
  }
  [(PXActionableSectionHeaderView *)self setNeedsLayout];
}

void __61__PXActionableSectionHeaderView__updateActionButtonAnimated___block_invoke(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 40)) {
    double v2 = 1.0;
  }
  else {
    double v2 = 0.0;
  }
  BOOL v3 = [*(id *)(a1 + 32) systemActionButton];
  [v3 setAlpha:v2];

  if (*(unsigned char *)(a1 + 40)) {
    double v4 = 1.0;
  }
  else {
    double v4 = 0.0;
  }
  id v5 = [*(id *)(a1 + 32) backdropActionButton];
  [v5 setAlpha:v4];
}

- (void)setShowsTopSeparator:(BOOL)a3
{
  if (self->_showsTopSeparator != a3)
  {
    self->_showsTopSeparator = a3;
    [(PXActionableSectionHeaderView *)self setNeedsLayout];
  }
}

- (void)setActionText:(id)a3
{
  uint64_t v8 = (NSString *)a3;
  double v4 = self->_actionText;
  if (v4 == v8)
  {
  }
  else
  {
    BOOL v5 = [(NSString *)v4 isEqualToString:v8];

    if (!v5)
    {
      id v6 = (NSString *)[(NSString *)v8 copy];
      actionText = self->_actionText;
      self->_actionText = v6;

      [(PXActionableSectionHeaderView *)self _updateActionButtonAnimated:0];
      [(PXActionableSectionHeaderView *)self _updateActionButtonConfiguration];
    }
  }
}

- (void)_updateActionButtonEnabledAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  unint64_t v5 = [(PXActionableSectionHeaderView *)self buttonStyle];
  if (v5 - 1 < 2)
  {
    [(PXActionableSectionHeaderView *)self _updateBackdropActionButton];
    [(PXActionableSectionHeaderView *)self _updateFilterButton];
  }
  else if (v5 == 3 || !v5)
  {
    BOOL v6 = [(PXActionableSectionHeaderView *)self actionButtonEnabled];
    int v7 = [(PXActionableSectionHeaderView *)self systemActionButton];
    [v7 setEnabled:v6];

    if (v3)
    {
      v10[0] = MEMORY[0x1E4F143A8];
      v10[1] = 3221225472;
      v10[2] = __68__PXActionableSectionHeaderView__updateActionButtonEnabledAnimated___block_invoke;
      v10[3] = &unk_1E5DD36F8;
      v10[4] = self;
      [MEMORY[0x1E4FB1EB0] animateWithDuration:v10 animations:0.2];
    }
    else
    {
      if ([(PXActionableSectionHeaderView *)self actionButtonEnabled]) {
        double v8 = 1.0;
      }
      else {
        double v8 = 0.6;
      }
      id v9 = [(PXActionableSectionHeaderView *)self systemActionButton];
      [v9 setAlpha:v8];
    }
  }
}

void __68__PXActionableSectionHeaderView__updateActionButtonEnabledAnimated___block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) actionButtonEnabled]) {
    double v2 = 1.0;
  }
  else {
    double v2 = 0.6;
  }
  id v3 = [*(id *)(a1 + 32) systemActionButton];
  [v3 setAlpha:v2];
}

- (void)setActionButtonEnabled:(BOOL)a3 animated:(BOOL)a4
{
  if (self->_actionButtonEnabled != a3)
  {
    self->_actionButtonEnabled = a3;
    [(PXActionableSectionHeaderView *)self _updateActionButtonEnabledAnimated:a4];
  }
}

- (void)setActionButtonEnabled:(BOOL)a3
{
}

- (BOOL)_wantsSecondaryButton
{
  double v2 = [(PXActionableSectionHeaderView *)self currentSecondaryButton];
  BOOL v3 = v2 != 0;

  return v3;
}

- (BOOL)_wantsActionButton
{
  double v2 = [(PXActionableSectionHeaderView *)self actionText];
  BOOL v3 = [v2 length] != 0;

  return v3;
}

- (void)setShowsSecondaryButton:(BOOL)a3
{
}

- (void)setShowsActionButton:(BOOL)a3
{
}

- (void)setShowsSecondaryButton:(BOOL)a3 animated:(BOOL)a4
{
  if (self->_showsSecondaryButton != a3)
  {
    self->_showsSecondaryButton = a3;
    [(PXActionableSectionHeaderView *)self _updateSecondaryButtonAnimated:a4];
  }
}

- (void)setShowsActionButton:(BOOL)a3 animated:(BOOL)a4
{
  if (self->_showsActionButton != a3)
  {
    self->_showsActionButton = a3;
    [(PXActionableSectionHeaderView *)self _updateActionButtonAnimated:a4];
  }
}

- (void)setBackdropButtonSpec:(id)a3
{
  unint64_t v5 = (PXCuratedLibrarySectionHeaderLayoutSpec *)a3;
  if (self->_backdropButtonSpec != v5)
  {
    BOOL v6 = v5;
    objc_storeStrong((id *)&self->_backdropButtonSpec, a3);
    [(PXActionableSectionHeaderView *)self _updateBackdropActionButton];
    [(PXActionableSectionHeaderView *)self _updateFilterButton];
    unint64_t v5 = v6;
  }
}

- (void)setFilterButtonControllerFactory:(id)a3
{
  if (self->_filterButtonControllerFactory != a3)
  {
    double v4 = (void *)[a3 copy];
    filterButtonControllerFactordouble y = self->_filterButtonControllerFactory;
    self->_filterButtonControllerFactordouble y = v4;

    [(PXActionableSectionHeaderView *)self _updateSecondaryButtonAnimated:0];
    [(PXActionableSectionHeaderView *)self _updateFilterButton];
  }
}

- (void)setButtonStyle:(unint64_t)a3
{
  if (self->_buttonStyle != a3)
  {
    self->_buttonStyle = a3;
    [(PXActionableSectionHeaderView *)self _updateActionButtonAnimated:0];
    [(PXActionableSectionHeaderView *)self _updateActionButtonConfiguration];
  }
}

- (UIControl)currentActionButton
{
  unint64_t v3 = [(PXActionableSectionHeaderView *)self buttonStyle];
  if (v3 - 1 < 2)
  {
    uint64_t v5 = [(PXActionableSectionHeaderView *)self backdropActionButton];
    goto LABEL_6;
  }
  if (v3 == 3 || !v3)
  {
    uint64_t v5 = [(PXActionableSectionHeaderView *)self systemActionButton];
LABEL_6:
    double v4 = (void *)v5;
  }
  return (UIControl *)v4;
}

- (void)setAccessibilityIdentifierWithValue:(id)a3
{
  if (a3)
  {
    double v4 = [a3 stringByReplacingOccurrencesOfString:@" " withString:@"_"];
    uint64_t v5 = [@"section_header" stringByAppendingString:@"_"];
    BOOL v6 = [v5 stringByAppendingString:v4];
  }
  else
  {
    BOOL v6 = @"section_header";
  }
  [(PXActionableSectionHeaderView *)self setAccessibilityIdentifier:v6];
}

- (NSString)secondaryText
{
  double v2 = [(PXActionableSectionHeaderView *)self secondaryLabel];
  unint64_t v3 = [v2 text];

  return (NSString *)v3;
}

- (void)setSecondaryText:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(PXActionableSectionHeaderView *)self secondaryLabel];
  [v5 setText:v4];

  [(PXActionableSectionHeaderView *)self _updateSpacerLabelHiddenState];
  [(PXActionableSectionHeaderView *)self setNeedsLayout];
}

- (NSString)primaryText
{
  double v2 = [(PXActionableSectionHeaderView *)self primaryLabel];
  unint64_t v3 = [v2 text];

  return (NSString *)v3;
}

- (void)setPrimaryText:(id)a3
{
  id v5 = a3;
  id v4 = [(PXActionableSectionHeaderView *)self primaryLabel];
  [v4 setText:v5];

  [(PXActionableSectionHeaderView *)self _updateSpacerLabelHiddenState];
  [(PXActionableSectionHeaderView *)self setNeedsLayout];
  [(PXActionableSectionHeaderView *)self setAccessibilityIdentifierWithValue:v5];
}

- (void)setDelegate:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_delegate, obj);
    *(unsigned char *)&self->_delegateFlags = *(unsigned char *)&self->_delegateFlags & 0xFE | objc_opt_respondsToSelector() & 1;
  }
}

- (void)applyLayoutAttributes:(id)a3
{
  id v4 = a3;
  v5.receiver = self;
  v5.super_class = (Class)PXActionableSectionHeaderView;
  [(PXActionableSectionHeaderView *)&v5 applyLayoutAttributes:v4];
  if (objc_opt_respondsToSelector()) {
    -[PXActionableSectionHeaderView setWantsBackground:](self, "setWantsBackground:", [v4 floating]);
  }
}

- (void)setSelfSizingTraits:(id)a3
{
  objc_super v5 = (UITraitCollection *)a3;
  if (self->_selfSizingTraits != v5)
  {
    BOOL v6 = v5;
    objc_storeStrong((id *)&self->_selfSizingTraits, a3);
    [(PXActionableSectionHeaderView *)self _updateWithCurrentTraits];
    objc_super v5 = v6;
  }
}

- (void)traitCollectionDidChange:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)PXActionableSectionHeaderView;
  id v4 = a3;
  [(PXActionableSectionHeaderView *)&v8 traitCollectionDidChange:v4];
  [(PXActionableSectionHeaderView *)self _updateWithCurrentTraits];
  uint64_t v5 = [v4 userInterfaceStyle];

  BOOL v6 = [(PXActionableSectionHeaderView *)self traitCollection];
  uint64_t v7 = [v6 userInterfaceStyle];

  if (v5 != v7)
  {
    [(PXActionableSectionHeaderView *)self _updateLabelColors];
    [(PXActionableSectionHeaderView *)self _updateBackdropActionButton];
    [(PXActionableSectionHeaderView *)self _updateFilterButton];
  }
}

- (id)traitCollection
{
  unint64_t v3 = [(PXActionableSectionHeaderView *)self selfSizingTraits];
  id v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)PXActionableSectionHeaderView;
    id v5 = [(PXActionableSectionHeaderView *)&v8 traitCollection];
  }
  BOOL v6 = v5;

  return v6;
}

- (void)setBounds:(CGRect)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PXActionableSectionHeaderView;
  -[PXActionableSectionHeaderView setBounds:](&v4, sel_setBounds_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  [(PXActionableSectionHeaderView *)self _updateClipping];
}

- (void)setFrame:(CGRect)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PXActionableSectionHeaderView;
  -[PXActionableSectionHeaderView setFrame:](&v4, sel_setFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  [(PXActionableSectionHeaderView *)self _updateClipping];
}

- (void)dealloc
{
  unint64_t v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self name:*MEMORY[0x1E4FB27A8] object:0];

  v4.receiver = self;
  v4.super_class = (Class)PXActionableSectionHeaderView;
  [(PXActionableSectionHeaderView *)&v4 dealloc];
}

- (PXActionableSectionHeaderView)initWithFrame:(CGRect)a3
{
  v13.receiver = self;
  v13.super_class = (Class)PXActionableSectionHeaderView;
  unint64_t v3 = -[PXActionableSectionHeaderView initWithFrame:](&v13, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    objc_super v4 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
    primaryLabel = v3->_primaryLabel;
    v3->_primaryLabel = v4;

    [(UILabel *)v3->_primaryLabel setUserInteractionEnabled:0];
    BOOL v6 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
    spacerLabel = v3->_spacerLabel;
    v3->_spacerLabel = v6;

    [(UILabel *)v3->_spacerLabel setUserInteractionEnabled:0];
    [(UILabel *)v3->_spacerLabel setText:@"·"];
    [(UILabel *)v3->_spacerLabel setAccessibilityElementsHidden:1];
    objc_super v8 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
    secondaryLabel = v3->_secondaryLabel;
    v3->_secondaryLabel = v8;

    [(UILabel *)v3->_secondaryLabel setUserInteractionEnabled:0];
    v3->_buttonStyle = 0;
    v3->_actionButtonEnabled = 1;
    [(PXActionableSectionHeaderView *)v3 addSubview:v3->_primaryLabel];
    [(PXActionableSectionHeaderView *)v3 addSubview:v3->_spacerLabel];
    [(PXActionableSectionHeaderView *)v3 addSubview:v3->_secondaryLabel];
    v3->_backgroundStyle = 0;
    [(PXActionableSectionHeaderView *)v3 _updateBackgroundAnimated:0];
    BOOL v10 = [MEMORY[0x1E4FB1618] clearColor];
    [(PXActionableSectionHeaderView *)v3 setBackgroundColor:v10];

    [(PXActionableSectionHeaderView *)v3 setOpaque:0];
    [(PXActionableSectionHeaderView *)v3 _updateLabelFonts];
    [(PXActionableSectionHeaderView *)v3 _updateSpacerLabelHiddenState];
    [(PXActionableSectionHeaderView *)v3 _updateLabelLineNumbers];
    [(PXActionableSectionHeaderView *)v3 _updateLabelColors];
    [(PXActionableSectionHeaderView *)v3 _updateActionButtonAnimated:0];
    [(PXActionableSectionHeaderView *)v3 _updateActionButtonConfiguration];
    [(PXActionableSectionHeaderView *)v3 _updateActionButtonEnabledAnimated:0];
    [(PXActionableSectionHeaderView *)v3 _updateSecondaryButtonAnimated:0];
    [(PXActionableSectionHeaderView *)v3 _updateFilterButton];
    [(PXActionableSectionHeaderView *)v3 setAccessibilityIdentifierWithValue:0];
    id v11 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v11 addObserver:v3 selector:sel__contentSizeCategoryDidChangeNotification_ name:*MEMORY[0x1E4FB27A8] object:0];
  }
  return v3;
}

@end