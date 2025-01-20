@interface PUDefaultAccessoryViewVisibilityChangeTileTransitionCoordinator
- (BOOL)shouldAnimateAccessory;
- (BOOL)shouldAnimateContent;
- (BOOL)shouldSlideAccessory;
- (PUBrowsingViewModel)viewModel;
- (id)_layoutInfoWithDefaultDisappearance:(id)a3;
- (id)optionsForAnimatingTileController:(id)a3 toLayoutInfo:(id)a4 withAnimationType:(int64_t)a5;
- (void)setShouldAnimateAccessory:(BOOL)a3;
- (void)setShouldAnimateContent:(BOOL)a3;
- (void)setShouldSlideAccessory:(BOOL)a3;
- (void)setViewModel:(id)a3;
@end

@implementation PUDefaultAccessoryViewVisibilityChangeTileTransitionCoordinator

- (void).cxx_destruct
{
}

- (void)setShouldSlideAccessory:(BOOL)a3
{
  self->_shouldSlideAccessory = a3;
}

- (BOOL)shouldSlideAccessory
{
  return self->_shouldSlideAccessory;
}

- (void)setShouldAnimateAccessory:(BOOL)a3
{
  self->_shouldAnimateAccessory = a3;
}

- (BOOL)shouldAnimateAccessory
{
  return self->_shouldAnimateAccessory;
}

- (void)setShouldAnimateContent:(BOOL)a3
{
  self->_shouldAnimateContent = a3;
}

- (BOOL)shouldAnimateContent
{
  return self->_shouldAnimateContent;
}

- (void)setViewModel:(id)a3
{
}

- (PUBrowsingViewModel)viewModel
{
  return self->_viewModel;
}

- (id)_layoutInfoWithDefaultDisappearance:(id)a3
{
  id v4 = a3;
  if ([(PUDefaultAccessoryViewVisibilityChangeTileTransitionCoordinator *)self shouldSlideAccessory])
  {
    v5 = [v4 tileKind];
    int v6 = [v5 isEqualToString:PUTileKindAccessory];

    if (v6)
    {
      id v7 = v4;
      v8 = [(PUDefaultAccessoryViewVisibilityChangeTileTransitionCoordinator *)self viewModel];
      v9 = [v8 assetsDataSource];
      v10 = [v7 dataSourceIdentifier];
      v11 = [v9 identifier];
      int v12 = [v10 isEqualToString:v11];

      if (!v12)
      {
        v61 = 0;
        goto LABEL_20;
      }
      v13 = [v7 indexPath];
      v14 = [v9 assetReferenceAtIndexPath:v13];

      v15 = [v8 assetViewModelForAssetReference:v14];
      [v15 contentOffset];
      double v17 = v16;

      [v7 untransformedContentFrame];
      CGFloat v19 = v18;
      CGFloat v21 = v20;
      CGFloat v23 = v22;
      CGFloat v25 = v24;
      [v7 size];
      double v27 = v26;
      v73.origin.x = v19;
      v73.origin.y = v21;
      v73.size.width = v23;
      v73.size.height = v25;
      double v28 = v27 - (v17 + CGRectGetMaxY(v73));
      [v7 minimumVisibleHeight];
      if (v28 >= v29) {
        double v30 = v28;
      }
      else {
        double v30 = v29;
      }
      [v7 center];
      double v32 = v31;
      double v34 = v33 + v30;
      [v7 size];
      double v36 = v35;
      double v38 = v37;
      if (v7) {
        [v7 transform];
      }
      else {
        memset(v71, 0, sizeof(v71));
      }
      uint64_t v60 = objc_msgSend(v7, "layoutInfoWithCenter:size:transform:", v71, v32, v34, v36, v38);
LABEL_19:
      v61 = (void *)v60;

LABEL_20:
      if (v61) {
        goto LABEL_22;
      }
      goto LABEL_21;
    }
  }
  if ([(PUDefaultAccessoryViewVisibilityChangeTileTransitionCoordinator *)self shouldSlideAccessory])
  {
    v39 = [v4 tileKind];
    int v40 = [v39 isEqualToString:PUTileKindPeople];

    if (v40)
    {
      id v7 = [(PUDefaultAccessoryViewVisibilityChangeTileTransitionCoordinator *)self viewModel];
      v8 = [v7 assetsDataSource];
      v41 = [v4 dataSourceIdentifier];
      v42 = [v8 identifier];
      char v43 = [v41 isEqualToString:v42];

      if (v43)
      {
        v44 = [v4 indexPath];
        v9 = [v8 assetReferenceAtIndexPath:v44];

        v45 = [v7 assetViewModelForAssetReference:v9];
        [v45 contentOffset];
        double v47 = v46;

        [v4 size];
        double v49 = v48 - v47;
        [v4 center];
        double v51 = v50;
        long long v69 = 0u;
        long long v70 = 0u;
        double v53 = v52 + v49;
        long long v68 = 0u;
        if (v4) {
          [v4 transform];
        }
        v64[0] = v68;
        v64[1] = v69;
        v64[2] = v70;
        [(PUDefaultTileTransitionCoordinator *)self _adjustDefaultDisappearanceTransform:v64];
        long long v68 = v65;
        long long v69 = v66;
        long long v70 = v67;
        [v4 size];
        double v55 = v54;
        double v57 = v56;
        [v4 zPosition];
        double v59 = v58;
        v14 = [v4 coordinateSystem];
        long long v65 = v68;
        long long v66 = v69;
        long long v67 = v70;
        uint64_t v60 = objc_msgSend(v4, "layoutInfoWithCenter:size:alpha:transform:zPosition:coordinateSystem:", &v65, v14, v51, v53, v55, v57, 0.0, v59);
        goto LABEL_19;
      }
    }
  }
LABEL_21:
  v63.receiver = self;
  v63.super_class = (Class)PUDefaultAccessoryViewVisibilityChangeTileTransitionCoordinator;
  v61 = [(PUDefaultTileTransitionCoordinator *)&v63 _layoutInfoWithDefaultDisappearance:v4];
LABEL_22:

  return v61;
}

- (id)optionsForAnimatingTileController:(id)a3 toLayoutInfo:(id)a4 withAnimationType:(int64_t)a5
{
  id v6 = a4;
  if ([(PUDefaultAccessoryViewVisibilityChangeTileTransitionCoordinator *)self shouldAnimateContent])
  {
    goto LABEL_6;
  }
  if ([(PUDefaultAccessoryViewVisibilityChangeTileTransitionCoordinator *)self shouldAnimateAccessory])
  {
    id v7 = [v6 tileKind];
    if ([v7 isEqualToString:PUTileKindAccessory])
    {

LABEL_6:
      id v10 = [(PUTileTransitionCoordinator *)self newTileAnimationOptions];
      [v10 setKind:1001];
      [v10 setHighFrameRateReason:2228225];
      goto LABEL_8;
    }
    v8 = [v6 tileKind];
    int v9 = [v8 isEqualToString:PUTileKindPeople];

    if (v9) {
      goto LABEL_6;
    }
  }
  id v10 = 0;
LABEL_8:

  return v10;
}

@end