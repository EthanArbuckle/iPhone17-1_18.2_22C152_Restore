@interface PXStoryTVInfoPanelView
+ (CGSize)sizeThatFits:(CGSize)a3;
- (CGPoint)convertHostedChildCenter:(CGPoint)a3 fromGlobalLayer:(id)a4;
- (CGRect)clippingRect;
- (PXStoryModel)mainModel;
- (PXStoryRecipeManager)recipeManager;
- (PXStoryTVInfoPanelView)initWithFrame:(CGRect)a3;
- (PXStoryTVInfoPanelViewConfiguration)userData;
- (PXStoryViewModel)viewModel;
- (PXUpdater)updater;
- (void)_dismiss;
- (void)_invalidateAutolayoutConstraints;
- (void)_invalidateColorGradeLabel;
- (void)_invalidateCompositingFilters;
- (void)_invalidateContentAlpha;
- (void)_invalidateFooterLabel;
- (void)_invalidateKeyAsset;
- (void)_invalidateMainModel;
- (void)_invalidateMusicLabel;
- (void)_invalidateRecipeManager;
- (void)_invalidateTitleLabel;
- (void)_reuseAssetView;
- (void)_updateAutolayoutConstraints;
- (void)_updateColorGradeLabel;
- (void)_updateCompositingFilters;
- (void)_updateContentAlpha;
- (void)_updateFooterLabel;
- (void)_updateKeyAsset;
- (void)_updateMainModel;
- (void)_updateMusicLabel;
- (void)_updateRecipeManager;
- (void)_updateTitleLabel;
- (void)addHostedLayer:(id)a3;
- (void)dealloc;
- (void)layoutSubviews;
- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5;
- (void)prepareForReuse;
- (void)setClippingRect:(CGRect)a3;
- (void)setMainModel:(id)a3;
- (void)setRecipeManager:(id)a3;
- (void)setUserData:(id)a3;
- (void)setViewModel:(id)a3;
@end

@implementation PXStoryTVInfoPanelView

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recipeManager, 0);
  objc_storeStrong((id *)&self->_mainModel, 0);
  objc_storeStrong((id *)&self->_viewModel, 0);
  objc_storeStrong((id *)&self->_updater, 0);
  objc_storeStrong((id *)&self->_userData, 0);
  objc_storeStrong((id *)&self->_footerLabelTrailingConstraint, 0);
  objc_storeStrong((id *)&self->_titleLabelTrailingConstraint, 0);
  objc_storeStrong((id *)&self->_footerLabelLeadingConstraint, 0);
  objc_storeStrong((id *)&self->_titleLabelLeadingConstraint, 0);
  objc_storeStrong((id *)&self->_footerLabelBaselineConstraint, 0);
  objc_storeStrong((id *)&self->_colorGradeLabelTrailingConstraint, 0);
  objc_storeStrong((id *)&self->_colorGradeLabelLeadingConstraint, 0);
  objc_storeStrong((id *)&self->_musicToColorGradeBaselineConstraint, 0);
  objc_storeStrong((id *)&self->_titleToMetadataBaselineConstraint, 0);
  objc_storeStrong((id *)&self->_musicLabelTrailingConstraint, 0);
  objc_storeStrong((id *)&self->_musicLabelLeadingConstraint, 0);
  objc_storeStrong((id *)&self->_colorGradeSymbolCenterConstraint, 0);
  objc_storeStrong((id *)&self->_musicSymbolCenterConstraint, 0);
  objc_storeStrong((id *)&self->_titleLabelBaselineConstraint, 0);
  objc_storeStrong((id *)&self->_assetContainerConstraintAspectRatio, 0);
  objc_storeStrong((id *)&self->_assetContainerConstraintLeading, 0);
  objc_storeStrong((id *)&self->_assetContainerConstraintBottom, 0);
  objc_storeStrong((id *)&self->_assetContainerConstraintTop, 0);
  objc_storeStrong((id *)&self->_infoButtonHeightConstraint, 0);
  objc_storeStrong((id *)&self->_infoButtonBottomConstraint, 0);
  objc_storeStrong((id *)&self->_infoButtonLeadingConstraint, 0);
  objc_storeStrong((id *)&self->_panelHeightConstraint, 0);
  objc_storeStrong((id *)&self->_panelMarginConstraintBottom, 0);
  objc_storeStrong((id *)&self->_panelMarginConstraintTrailing, 0);
  objc_storeStrong((id *)&self->_panelMarginConstraintLeading, 0);
  objc_storeStrong((id *)&self->_footerLabel, 0);
  objc_storeStrong((id *)&self->_colorGradeLabel, 0);
  objc_storeStrong((id *)&self->_colorGradeSymbolView, 0);
  objc_storeStrong((id *)&self->_musicLabel, 0);
  objc_storeStrong((id *)&self->_musicSymbolView, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_assetContainerView, 0);
  objc_storeStrong((id *)&self->_infoButton, 0);
  objc_storeStrong((id *)&self->_assetView, 0);
  objc_storeStrong((id *)&self->_visualEffectView, 0);
  objc_storeStrong((id *)&self->_focusGuide, 0);
}

- (PXStoryRecipeManager)recipeManager
{
  return self->_recipeManager;
}

- (PXStoryModel)mainModel
{
  return self->_mainModel;
}

- (PXStoryViewModel)viewModel
{
  return self->_viewModel;
}

- (PXUpdater)updater
{
  return self->_updater;
}

- (PXStoryTVInfoPanelViewConfiguration)userData
{
  return self->_userData;
}

- (void)setClippingRect:(CGRect)a3
{
  self->_clippingRect = a3;
}

- (CGRect)clippingRect
{
  double x = self->_clippingRect.origin.x;
  double y = self->_clippingRect.origin.y;
  double width = self->_clippingRect.size.width;
  double height = self->_clippingRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (CGPoint)convertHostedChildCenter:(CGPoint)a3 fromGlobalLayer:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  v8 = [(PXStoryTVInfoPanelView *)self layer];
  objc_msgSend(v8, "convertPoint:fromLayer:", v7, x, y);
  double v10 = v9;
  double v12 = v11;

  double v13 = v10;
  double v14 = v12;
  result.double y = v14;
  result.double x = v13;
  return result;
}

- (void)addHostedLayer:(id)a3
{
  id v4 = a3;
  id v5 = [(PXStoryTVInfoPanelView *)self layer];
  [v5 addSublayer:v4];
}

- (void)prepareForReuse
{
  [(PXStoryTVInfoPanelView *)self setUserData:0];
  [(PXStoryTVInfoPanelView *)self _reuseAssetView];
}

- (void)setUserData:(id)a3
{
  double v10 = (PXStoryTVInfoPanelViewConfiguration *)a3;
  id v4 = self->_userData;
  id v5 = v10;
  if (v4 != v10)
  {
    BOOL v6 = [(PXStoryTVInfoPanelViewConfiguration *)v10 isEqual:v4];

    if (v6) {
      goto LABEL_5;
    }
    id v7 = (PXStoryTVInfoPanelViewConfiguration *)[(PXStoryTVInfoPanelViewConfiguration *)v10 copy];
    userData = self->_userData;
    self->_userData = v7;

    id v5 = [(PXStoryTVInfoPanelView *)self userData];
    double v9 = [v5 viewModel];
    [(PXStoryTVInfoPanelView *)self setViewModel:v9];
  }
LABEL_5:
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  id v10 = a3;
  if ((void *)ViewModelObservationContext_197857 == a5)
  {
    if ((a4 & 0x40) != 0)
    {
      [(PXStoryTVInfoPanelView *)self _invalidateMainModel];
      if ((a4 & 0x20) == 0)
      {
LABEL_8:
        if ((a4 & 0x10) == 0) {
          goto LABEL_20;
        }
LABEL_16:
        [(PXStoryTVInfoPanelView *)self _invalidateTitleLabel];
        goto LABEL_20;
      }
    }
    else if ((a4 & 0x20) == 0)
    {
      goto LABEL_8;
    }
    [(PXStoryTVInfoPanelView *)self _invalidateAutolayoutConstraints];
    if ((a4 & 0x10) == 0) {
      goto LABEL_20;
    }
    goto LABEL_16;
  }
  if ((void *)ModelObservationContext_197858 == a5)
  {
    if ((a4 & 0x800000000000000) != 0)
    {
      [(PXStoryTVInfoPanelView *)self _invalidateContentAlpha];
      if ((a4 & 0x200) == 0)
      {
LABEL_12:
        if ((a4 & 0x100000000000) == 0) {
          goto LABEL_20;
        }
LABEL_19:
        [(PXStoryTVInfoPanelView *)self _invalidateColorGradeLabel];
        goto LABEL_20;
      }
    }
    else if ((a4 & 0x200) == 0)
    {
      goto LABEL_12;
    }
    [(PXStoryTVInfoPanelView *)self _invalidateMusicLabel];
    if ((a4 & 0x100000000000) == 0) {
      goto LABEL_20;
    }
    goto LABEL_19;
  }
  if ((void *)RecipeManagerObservationContext_197859 != a5)
  {
    double v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2 object:self file:@"PXStoryTVInfoPanelView.m" lineNumber:663 description:@"Code which should be unreachable has been reached"];

    abort();
  }
  if (a4)
  {
    [(PXStoryTVInfoPanelView *)self _invalidateKeyAsset];
    [(PXStoryTVInfoPanelView *)self _invalidateFooterLabel];
  }
LABEL_20:
}

- (void)setRecipeManager:(id)a3
{
  id v5 = (PXStoryRecipeManager *)a3;
  recipeManager = self->_recipeManager;
  if (recipeManager != v5)
  {
    id v7 = v5;
    [(PXStoryRecipeManager *)recipeManager unregisterChangeObserver:self context:RecipeManagerObservationContext_197859];
    objc_storeStrong((id *)&self->_recipeManager, a3);
    [(PXStoryRecipeManager *)self->_recipeManager registerChangeObserver:self context:RecipeManagerObservationContext_197859];
    [(PXStoryTVInfoPanelView *)self _invalidateKeyAsset];
    id v5 = v7;
  }
}

- (void)setMainModel:(id)a3
{
  id v5 = (PXStoryModel *)a3;
  mainModel = self->_mainModel;
  if (mainModel != v5)
  {
    id v7 = v5;
    [(PXStoryModel *)mainModel unregisterChangeObserver:self context:ModelObservationContext_197858];
    objc_storeStrong((id *)&self->_mainModel, a3);
    [(PXStoryModel *)self->_mainModel registerChangeObserver:self context:ModelObservationContext_197858];
    [(PXStoryTVInfoPanelView *)self _invalidateRecipeManager];
    [(PXStoryTVInfoPanelView *)self _invalidateMusicLabel];
    [(PXStoryTVInfoPanelView *)self _invalidateColorGradeLabel];
    [(PXStoryTVInfoPanelView *)self _invalidateContentAlpha];
    id v5 = v7;
  }
}

- (void)setViewModel:(id)a3
{
  id v5 = (PXStoryViewModel *)a3;
  viewModel = self->_viewModel;
  if (viewModel != v5)
  {
    id v7 = v5;
    [(PXStoryViewModel *)viewModel unregisterChangeObserver:self context:ViewModelObservationContext_197857];
    objc_storeStrong((id *)&self->_viewModel, a3);
    [(PXStoryViewModel *)self->_viewModel registerChangeObserver:self context:ViewModelObservationContext_197857];
    [(PXStoryTVInfoPanelView *)self _invalidateMainModel];
    [(PXStoryTVInfoPanelView *)self _invalidateTitleLabel];
    [(PXStoryTVInfoPanelView *)self _invalidateFooterLabel];
    [(PXStoryTVInfoPanelView *)self _invalidateAutolayoutConstraints];
    id v5 = v7;
  }
}

- (void)_updateAutolayoutConstraints
{
  v3 = [(PXStoryTVInfoPanelView *)self viewModel];
  id v18 = [v3 viewLayoutSpec];

  [v18 infoPanelMargins];
  [(NSLayoutConstraint *)self->_panelMarginConstraintLeading setConstant:v4];
  [v18 infoPanelMargins];
  [(NSLayoutConstraint *)self->_panelMarginConstraintTrailing setConstant:v5];
  [v18 infoPanelMargins];
  [(NSLayoutConstraint *)self->_panelMarginConstraintBottom setConstant:v6];
  [v18 infoPanelHeight];
  -[NSLayoutConstraint setConstant:](self->_panelHeightConstraint, "setConstant:");
  [v18 infoPanelButtonOffset];
  -[NSLayoutConstraint setConstant:](self->_infoButtonLeadingConstraint, "setConstant:");
  [v18 infoPanelButtonOffset];
  [(NSLayoutConstraint *)self->_infoButtonBottomConstraint setConstant:v7];
  [v18 infoPanelButtonHeight];
  -[NSLayoutConstraint setConstant:](self->_infoButtonHeightConstraint, "setConstant:");
  [v18 infoPanelPadding];
  -[NSLayoutConstraint setConstant:](self->_assetContainerConstraintTop, "setConstant:");
  [v18 infoPanelPadding];
  [(NSLayoutConstraint *)self->_assetContainerConstraintBottom setConstant:v8];
  [v18 infoPanelPadding];
  [(NSLayoutConstraint *)self->_assetContainerConstraintLeading setConstant:v9];
  [v18 infoPanelAssetToSymbolCenter];
  -[NSLayoutConstraint setConstant:](self->_musicSymbolCenterConstraint, "setConstant:");
  [v18 infoPanelAssetToSymbolCenter];
  -[NSLayoutConstraint setConstant:](self->_colorGradeSymbolCenterConstraint, "setConstant:");
  [v18 infoPanelAssetToMetadataLabel];
  -[NSLayoutConstraint setConstant:](self->_musicLabelLeadingConstraint, "setConstant:");
  [v18 infoPanelAssetToMetadataLabel];
  -[NSLayoutConstraint setConstant:](self->_colorGradeLabelLeadingConstraint, "setConstant:");
  [v18 infoPanelPadding];
  [(NSLayoutConstraint *)self->_colorGradeLabelTrailingConstraint setConstant:-v10];
  [v18 infoPanelPadding];
  [(NSLayoutConstraint *)self->_musicLabelTrailingConstraint setConstant:-v11];
  [v18 infoPanelFooterLabelBaselineFromBottom];
  -[NSLayoutConstraint setConstant:](self->_footerLabelBaselineConstraint, "setConstant:");
  [v18 infoPanelTitleLabelBaselineFromTop];
  -[NSLayoutConstraint setConstant:](self->_titleLabelBaselineConstraint, "setConstant:");
  [v18 infoPanelTitleToMetadataBaselines];
  -[NSLayoutConstraint setConstant:](self->_titleToMetadataBaselineConstraint, "setConstant:");
  [v18 infoPanelMetadataToMetadataBaselines];
  -[NSLayoutConstraint setConstant:](self->_musicToColorGradeBaselineConstraint, "setConstant:");
  [v18 infoPanelDistanceBetweenAssetAndTitleLabel];
  -[NSLayoutConstraint setConstant:](self->_titleLabelLeadingConstraint, "setConstant:");
  [v18 infoPanelDistanceBetweenAssetAndTitleLabel];
  -[NSLayoutConstraint setConstant:](self->_footerLabelLeadingConstraint, "setConstant:");
  [v18 infoPanelPadding];
  [(NSLayoutConstraint *)self->_titleLabelTrailingConstraint setConstant:-v12];
  [v18 infoPanelPadding];
  [(NSLayoutConstraint *)self->_footerLabelTrailingConstraint setConstant:-v13];
  [(NSLayoutConstraint *)self->_assetContainerConstraintAspectRatio setActive:0];
  double v14 = [(UIView *)self->_assetContainerView widthAnchor];
  v15 = [(UIView *)self->_assetContainerView heightAnchor];
  [v18 infoPanelAssetAspectRatio];
  objc_msgSend(v14, "constraintEqualToAnchor:multiplier:", v15);
  v16 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  assetContainerConstraintAspectRatio = self->_assetContainerConstraintAspectRatio;
  self->_assetContainerConstraintAspectRatio = v16;

  [(NSLayoutConstraint *)self->_assetContainerConstraintAspectRatio setActive:1];
}

- (void)_invalidateAutolayoutConstraints
{
  id v2 = [(PXStoryTVInfoPanelView *)self updater];
  [v2 setNeedsUpdateOf:sel__updateAutolayoutConstraints];
}

- (void)_updateCompositingFilters
{
  id v10 = (id)*MEMORY[0x1E4F3A2E0];
  v3 = [(PXStoryTVInfoPanelView *)self traitCollection];
  uint64_t v4 = [v3 userInterfaceStyle];

  if (v4 == 2)
  {
    id v5 = (id)*MEMORY[0x1E4F3A2E8];

    id v10 = v5;
  }
  double v6 = [(UIImageView *)self->_musicSymbolView layer];
  [v6 setCompositingFilter:v10];

  double v7 = [(UILabel *)self->_musicLabel layer];
  [v7 setCompositingFilter:v10];

  double v8 = [(UIImageView *)self->_colorGradeSymbolView layer];
  [v8 setCompositingFilter:v10];

  double v9 = [(UILabel *)self->_colorGradeLabel layer];
  [v9 setCompositingFilter:v10];
}

- (void)_invalidateCompositingFilters
{
  id v2 = [(PXStoryTVInfoPanelView *)self updater];
  [v2 setNeedsUpdateOf:sel__updateCompositingFilters];
}

- (void)_updateContentAlpha
{
  v3 = [(PXStoryTVInfoPanelView *)self mainModel];
  [v3 infoPanelVisibilityFraction];
  double v5 = v4;

  [(UIVisualEffectView *)self->_visualEffectView setAlpha:v5];
  [(UIView *)self->_assetContainerView setAlpha:v5];
  [(UILabel *)self->_titleLabel setAlpha:v5];
  [(UIImageView *)self->_musicSymbolView setAlpha:v5];
  [(UILabel *)self->_musicLabel setAlpha:v5];
  [(UIImageView *)self->_colorGradeSymbolView setAlpha:v5];
  [(UILabel *)self->_colorGradeLabel setAlpha:v5];
  footerLabel = self->_footerLabel;
  [(UILabel *)footerLabel setAlpha:v5];
}

- (void)_invalidateContentAlpha
{
  id v2 = [(PXStoryTVInfoPanelView *)self updater];
  [v2 setNeedsUpdateOf:sel__updateContentAlpha];
}

- (void)_updateFooterLabel
{
  v3 = [(PXStoryTVInfoPanelView *)self recipeManager];
  double v4 = [v3 recipe];
  id v9 = [v4 curatedAssets];

  if (v9)
  {
    [v9 countOfAssetsWithMediaType:1];
    [v9 countOfAssetsWithMediaType:2];
    double v5 = PLLocalizedCountDescription();
    double v6 = +[PXStorySettings sharedInstance];
    int v7 = [v6 simulateLongChromeStrings];

    if (v7)
    {
      uint64_t v8 = objc_msgSend(v5, "px_stringByRepeating:", 10);

      double v5 = (void *)v8;
    }
    [(UILabel *)self->_footerLabel setHidden:0];
    [(UILabel *)self->_footerLabel setText:v5];
  }
  else
  {
    [(UILabel *)self->_footerLabel setHidden:1];
    [(UILabel *)self->_footerLabel setText:&stru_1F00B0030];
  }
}

- (void)_invalidateFooterLabel
{
  id v2 = [(PXStoryTVInfoPanelView *)self updater];
  [v2 setNeedsUpdateOf:sel__updateFooterLabel];
}

- (void)_updateColorGradeLabel
{
  v3 = [(PXStoryTVInfoPanelView *)self mainModel];
  double v4 = [v3 currentStyle];
  uint64_t v5 = [v4 customColorGradeKind];

  if (!v5)
  {
    double v6 = [(PXStoryTVInfoPanelView *)self mainModel];
    int v7 = [v6 currentStyle];
    uint64_t v8 = [v7 originalColorGradeCategory];

    id v9 = [(PXStoryTVInfoPanelView *)self mainModel];
    id v10 = [v9 colorGradingRepository];
    uint64_t v5 = [v10 colorGradeKindForColorGradeCategory:v8];
  }
  double v11 = [(PXStoryTVInfoPanelView *)self mainModel];
  double v12 = [v11 colorGradingRepository];
  id v16 = [v12 localizedTitleForColorGradeKind:v5];

  double v13 = +[PXStorySettings sharedInstance];
  LODWORD(v11) = [v13 simulateLongChromeStrings];

  if (v11)
  {
    uint64_t v14 = objc_msgSend(v16, "px_stringByRepeating:", 10);

    id v15 = (id)v14;
  }
  else
  {
    id v15 = v16;
  }
  id v17 = v15;
  [(UILabel *)self->_colorGradeLabel setText:v15];
}

- (void)_invalidateColorGradeLabel
{
  id v2 = [(PXStoryTVInfoPanelView *)self updater];
  [v2 setNeedsUpdateOf:sel__updateColorGradeLabel];
}

- (void)_updateMusicLabel
{
  v3 = [(PXStoryTVInfoPanelView *)self mainModel];
  id v14 = [v3 currentSongResource];

  double v4 = objc_msgSend(v14, "px_storyResourceSongAsset");
  uint64_t v5 = v4;
  if (v4)
  {
    double v6 = [v4 title];
    int v7 = [v5 artistName];
    uint64_t v8 = +[PXStorySettings sharedInstance];
    int v9 = [v8 simulateLongChromeStrings];

    if (v9)
    {
      uint64_t v10 = objc_msgSend(v6, "px_stringByRepeating:", 10);

      uint64_t v11 = objc_msgSend(v7, "px_stringByRepeating:", 10);

      double v6 = (void *)v10;
      int v7 = (void *)v11;
    }
    double v12 = PXLocalizedStringFromTable(@"InteractiveMemoryChromeLandscapeSongTitleFormat", @"PhotosUICore");
    double v13 = PXStringWithValidatedFormat();
    -[UILabel setText:](self->_musicLabel, "setText:", v13, v6, v7);

    [(UILabel *)self->_musicLabel setHidden:0];
    [(UIImageView *)self->_musicSymbolView setHidden:0];
  }
  else
  {
    [(UILabel *)self->_musicLabel setHidden:1];
    [(UIImageView *)self->_musicSymbolView setHidden:1];
  }
}

- (void)_invalidateMusicLabel
{
  id v2 = [(PXStoryTVInfoPanelView *)self updater];
  [v2 setNeedsUpdateOf:sel__updateMusicLabel];
}

- (void)_updateTitleLabel
{
  v3 = [(PXStoryTVInfoPanelView *)self mainModel];
  id v15 = [v3 currentAssetCollection];

  double v4 = [off_1E5DA7230 defaultHelper];
  uint64_t v5 = [v15 localizedTitle];
  double v6 = [v4 displayableTextForTitle:v5 intent:1];

  int v7 = [off_1E5DA7230 defaultHelper];
  uint64_t v8 = [v15 localizedSubtitle];
  int v9 = [v7 displayableTextForTitle:v8 intent:1];

  uint64_t v10 = +[PXStorySettings sharedInstance];
  LODWORD(v8) = [v10 simulateLongChromeStrings];

  if (v8)
  {
    uint64_t v11 = objc_msgSend(v6, "px_stringByRepeating:", 10);

    uint64_t v12 = objc_msgSend(v9, "px_stringByRepeating:", 10);

    double v6 = (void *)v11;
    int v9 = (void *)v12;
  }
  double v13 = PXLocalizedStringFromTable(@"InteractiveMemoryInfoPanelTitleFormat", @"PhotosUICore");
  id v14 = PXStringWithValidatedFormat();
  -[UILabel setText:](self->_titleLabel, "setText:", v14, v6, v9);
}

- (void)_invalidateTitleLabel
{
  id v2 = [(PXStoryTVInfoPanelView *)self updater];
  [v2 setNeedsUpdateOf:sel__updateTitleLabel];
}

- (void)_updateKeyAsset
{
  [(PXStoryTVInfoPanelView *)self _reuseAssetView];
  v3 = [(PXStoryTVInfoPanelView *)self recipeManager];
  double v4 = [v3 recipe];
  id v9 = [v4 keyAsset];

  if (v9)
  {
    uint64_t v5 = [off_1E5DA7108 defaultManager];
    double v6 = [v5 imageProviderForAsset:v9];

    int v7 = +[PXDisplayAssetContentView checkOutViewForAsset:v9 withPlaybackStyle:1];
    assetView = self->_assetView;
    self->_assetView = v7;

    [(PXDisplayAssetContentView *)self->_assetView setMediaProvider:v6];
    [(UIView *)self->_assetContainerView bounds];
    -[PXDisplayAssetContentView setFrame:](self->_assetView, "setFrame:");
    [(PXDisplayAssetContentView *)self->_assetView setCanDisplayLoadingIndicator:1];
    [(PXDisplayAssetContentView *)self->_assetView setAutoresizingMask:18];
    [(UIView *)self->_assetContainerView addSubview:self->_assetView];
  }
}

- (void)_invalidateKeyAsset
{
  id v2 = [(PXStoryTVInfoPanelView *)self updater];
  [v2 setNeedsUpdateOf:sel__updateKeyAsset];
}

- (void)_updateRecipeManager
{
  id v4 = [(PXStoryTVInfoPanelView *)self mainModel];
  v3 = [v4 recipeManager];
  [(PXStoryTVInfoPanelView *)self setRecipeManager:v3];
}

- (void)_invalidateRecipeManager
{
  id v2 = [(PXStoryTVInfoPanelView *)self updater];
  [v2 setNeedsUpdateOf:sel__updateRecipeManager];
}

- (void)_updateMainModel
{
  id v5 = [(PXStoryTVInfoPanelView *)self userData];
  v3 = [v5 viewModel];
  id v4 = [v3 mainModel];
  [(PXStoryTVInfoPanelView *)self setMainModel:v4];
}

- (void)_invalidateMainModel
{
  id v2 = [(PXStoryTVInfoPanelView *)self updater];
  [v2 setNeedsUpdateOf:sel__updateMainModel];
}

- (void)_dismiss
{
  id v2 = [(PXStoryTVInfoPanelView *)self mainModel];
  [v2 performChanges:&__block_literal_global_197893];
}

uint64_t __34__PXStoryTVInfoPanelView__dismiss__block_invoke(uint64_t a1, void *a2)
{
  return [a2 setDesiredInfoPanelVisibilityFraction:0.0];
}

- (void)_reuseAssetView
{
  assetView = self->_assetView;
  if (assetView)
  {
    [(PXDisplayAssetContentView *)assetView removeFromSuperview];
    +[PXDisplayAssetContentView checkInView:self->_assetView];
    id v4 = self->_assetView;
    self->_assetView = 0;
  }
}

- (void)layoutSubviews
{
  v3 = [(PXStoryTVInfoPanelView *)self updater];
  [v3 updateIfNeeded];

  v4.receiver = self;
  v4.super_class = (Class)PXStoryTVInfoPanelView;
  [(PXStoryTVInfoPanelView *)&v4 layoutSubviews];
}

- (void)dealloc
{
  [(PXStoryTVInfoPanelView *)self _reuseAssetView];
  v3.receiver = self;
  v3.super_class = (Class)PXStoryTVInfoPanelView;
  [(PXStoryTVInfoPanelView *)&v3 dealloc];
}

- (PXStoryTVInfoPanelView)initWithFrame:(CGRect)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  v20.receiver = self;
  v20.super_class = (Class)PXStoryTVInfoPanelView;
  objc_super v3 = -[PXStoryTVInfoPanelView initWithFrame:](&v20, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    uint64_t v4 = [objc_alloc((Class)off_1E5DA9778) initWithTarget:v3 needsUpdateSelector:sel__setNeedsUpdate];
    updater = v3->_updater;
    v3->_updater = (PXUpdater *)v4;

    [(PXUpdater *)v3->_updater addUpdateSelector:sel__updateMainModel];
    [(PXUpdater *)v3->_updater addUpdateSelector:sel__updateRecipeManager];
    [(PXUpdater *)v3->_updater addUpdateSelector:sel__updateKeyAsset];
    [(PXUpdater *)v3->_updater addUpdateSelector:sel__updateTitleLabel];
    [(PXUpdater *)v3->_updater addUpdateSelector:sel__updateMusicLabel];
    [(PXUpdater *)v3->_updater addUpdateSelector:sel__updateColorGradeLabel];
    [(PXUpdater *)v3->_updater addUpdateSelector:sel__updateFooterLabel];
    [(PXUpdater *)v3->_updater addUpdateSelector:sel__updateContentAlpha needsUpdate:1];
    [(PXUpdater *)v3->_updater addUpdateSelector:sel__updateCompositingFilters needsUpdate:1];
    [(PXUpdater *)v3->_updater addUpdateSelector:sel__updateAutolayoutConstraints];
    uint64_t v6 = [MEMORY[0x1E4FB14C8] effectWithStyle:4];
    visualEffectView = v3->_visualEffectView;
    v3->_visualEffectView = (UIVisualEffectView *)v6;

    [(UIVisualEffectView *)v3->_visualEffectView setClipsToBounds:1];
    [(UIVisualEffectView *)v3->_visualEffectView setTranslatesAutoresizingMaskIntoConstraints:0];
    uint64_t v8 = [(UIVisualEffectView *)v3->_visualEffectView layer];
    [v8 setCornerRadius:24.0];

    uint64_t v9 = *MEMORY[0x1E4F39EA8];
    uint64_t v10 = [(UIVisualEffectView *)v3->_visualEffectView layer];
    [v10 setCornerCurve:v9];

    [(PXStoryTVInfoPanelView *)v3 addSubview:v3->_visualEffectView];
    uint64_t v11 = (UIView *)objc_alloc_init(MEMORY[0x1E4FB1EB0]);
    assetContainerView = v3->_assetContainerView;
    v3->_assetContainerView = v11;

    [(UIView *)v3->_assetContainerView setTranslatesAutoresizingMaskIntoConstraints:0];
    double v13 = [MEMORY[0x1E4FB1618] systemGrayColor];
    [(UIView *)v3->_assetContainerView setBackgroundColor:v13];

    id v14 = [(UIView *)v3->_assetContainerView layer];
    [v14 setCornerRadius:12.0];

    id v15 = [(UIView *)v3->_assetContainerView layer];
    [v15 setCornerCurve:v9];

    [(UIView *)v3->_assetContainerView setClipsToBounds:1];
    [(PXStoryTVInfoPanelView *)v3 addSubview:v3->_assetContainerView];
    id v16 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
    titleLabel = v3->_titleLabel;
    v3->_titleLabel = v16;

    [(UILabel *)v3->_titleLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    id v18 = [MEMORY[0x1E4FB1618] labelColor];
    [(UILabel *)v3->_titleLabel setTextColor:v18];

    PXFontWithTextStyleAndWeight();
  }
  return 0;
}

void __40__PXStoryTVInfoPanelView_initWithFrame___block_invoke(uint64_t a1, void *a2)
{
  id v2 = (objc_class *)MEMORY[0x1E4FB1838];
  id v3 = a2;
  [objc_alloc_init(v2) setTranslatesAutoresizingMaskIntoConstraints:0];
  PXFontWithTextStyle();
}

void __40__PXStoryTVInfoPanelView_initWithFrame___block_invoke_2()
{
}

+ (CGSize)sizeThatFits:(CGSize)a3
{
  double v3 = 1920.0;
  double v4 = 400.0;
  result.double height = v4;
  result.double width = v3;
  return result;
}

@end