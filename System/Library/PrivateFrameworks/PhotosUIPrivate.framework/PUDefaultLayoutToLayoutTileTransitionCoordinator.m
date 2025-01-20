@interface PUDefaultLayoutToLayoutTileTransitionCoordinator
- (BOOL)_canInspectLayout:(id)a3;
- (BOOL)_isCenterTileLayoutInfo:(id)a3;
- (BOOL)_isZoomingIn;
- (BOOL)_needsUpdateZoomingIn;
- (BOOL)useDoubleSidedTransitionForUpdatedTileController:(id)a3 toLayoutInfo:(id)a4;
- (PUAssetReference)anchorAssetReference;
- (PUTilingCoordinateSystem)fixedCoordinateSystem;
- (PUTilingLayout)fromLayout;
- (PUTilingLayout)toLayout;
- (PUTilingLayoutTransitionContext)context;
- (id)_centerTileLayoutInfoWithDefaultDisappearance:(id)a3 layoutWhereCenterTileExists:(id)a4 layoutWhereCenterTileDisappeared:(id)a5;
- (id)description;
- (id)finalLayoutInfoForDisappearingTileController:(id)a3 fromLayoutInfo:(id)a4;
- (id)initialLayoutInfoForAppearingTileController:(id)a3 toLayoutInfo:(id)a4;
- (id)optionsForAnimatingTileController:(id)a3 toLayoutInfo:(id)a4 withAnimationType:(int64_t)a5;
- (int64_t)_zoomLevelForLayout:(id)a3;
- (void)_invalidateIsZoomingIn;
- (void)_setNeedsUpdateZoomingIn:(BOOL)a3;
- (void)_setZoomingIn:(BOOL)a3;
- (void)_updateIsZoomingInIfNeeded;
- (void)setAnchorAssetReference:(id)a3;
- (void)setContext:(id)a3;
- (void)setFixedCoordinateSystem:(id)a3;
- (void)setFromLayout:(id)a3;
- (void)setToLayout:(id)a3;
@end

@implementation PUDefaultLayoutToLayoutTileTransitionCoordinator

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fixedCoordinateSystem, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_anchorAssetReference, 0);
  objc_storeStrong((id *)&self->_toLayout, 0);
  objc_storeStrong((id *)&self->_fromLayout, 0);
}

- (void)_setNeedsUpdateZoomingIn:(BOOL)a3
{
  self->__needsUpdateZoomingIn = a3;
}

- (BOOL)_needsUpdateZoomingIn
{
  return self->__needsUpdateZoomingIn;
}

- (void)_setZoomingIn:(BOOL)a3
{
  self->__isZoomingIn = a3;
}

- (void)setFixedCoordinateSystem:(id)a3
{
}

- (PUTilingCoordinateSystem)fixedCoordinateSystem
{
  return self->_fixedCoordinateSystem;
}

- (PUTilingLayoutTransitionContext)context
{
  return self->_context;
}

- (void)setAnchorAssetReference:(id)a3
{
}

- (PUAssetReference)anchorAssetReference
{
  return self->_anchorAssetReference;
}

- (PUTilingLayout)toLayout
{
  return self->_toLayout;
}

- (PUTilingLayout)fromLayout
{
  return self->_fromLayout;
}

- (int64_t)_zoomLevelForLayout:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (void)_updateIsZoomingInIfNeeded
{
  if ([(PUDefaultLayoutToLayoutTileTransitionCoordinator *)self _needsUpdateZoomingIn])
  {
    [(PUDefaultLayoutToLayoutTileTransitionCoordinator *)self _setNeedsUpdateZoomingIn:0];
    id v3 = [(PUDefaultLayoutToLayoutTileTransitionCoordinator *)self fromLayout];
    int64_t v4 = [(PUDefaultLayoutToLayoutTileTransitionCoordinator *)self _zoomLevelForLayout:v3];

    v5 = [(PUDefaultLayoutToLayoutTileTransitionCoordinator *)self toLayout];
    int64_t v6 = [(PUDefaultLayoutToLayoutTileTransitionCoordinator *)self _zoomLevelForLayout:v5];

    uint64_t v7 = 0;
    if (v6 > v4)
    {
      v8 = [(PUDefaultLayoutToLayoutTileTransitionCoordinator *)self context];
      uint64_t v7 = [v8 isCancelingTransition] ^ 1;
    }
    [(PUDefaultLayoutToLayoutTileTransitionCoordinator *)self _setZoomingIn:v7];
  }
}

- (void)_invalidateIsZoomingIn
{
}

- (BOOL)_isZoomingIn
{
  return self->__isZoomingIn;
}

- (void)setToLayout:(id)a3
{
  v5 = (PUTilingLayout *)a3;
  if (self->_toLayout != v5)
  {
    int64_t v6 = v5;
    objc_storeStrong((id *)&self->_toLayout, a3);
    [(PUDefaultLayoutToLayoutTileTransitionCoordinator *)self _invalidateIsZoomingIn];
    v5 = v6;
  }
}

- (void)setFromLayout:(id)a3
{
  v5 = (PUTilingLayout *)a3;
  if (self->_fromLayout != v5)
  {
    int64_t v6 = v5;
    objc_storeStrong((id *)&self->_fromLayout, a3);
    [(PUDefaultLayoutToLayoutTileTransitionCoordinator *)self _invalidateIsZoomingIn];
    v5 = v6;
  }
}

- (void)setContext:(id)a3
{
  v5 = (PUTilingLayoutTransitionContext *)a3;
  if (self->_context != v5)
  {
    int64_t v6 = v5;
    objc_storeStrong((id *)&self->_context, a3);
    [(PUDefaultLayoutToLayoutTileTransitionCoordinator *)self _invalidateIsZoomingIn];
    v5 = v6;
  }
}

- (id)description
{
  v8.receiver = self;
  v8.super_class = (Class)PUDefaultLayoutToLayoutTileTransitionCoordinator;
  id v3 = [(PUDefaultLayoutToLayoutTileTransitionCoordinator *)&v8 description];
  int64_t v4 = [(PUDefaultLayoutToLayoutTileTransitionCoordinator *)self fromLayout];
  v5 = [(PUDefaultLayoutToLayoutTileTransitionCoordinator *)self toLayout];
  int64_t v6 = [v3 stringByAppendingFormat:@" fromLayout:%@ toLayout:%@", v4, v5];

  return v6;
}

- (id)_centerTileLayoutInfoWithDefaultDisappearance:(id)a3 layoutWhereCenterTileExists:(id)a4 layoutWhereCenterTileDisappeared:(id)a5
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  v10 = [v8 dataSource];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v11 = [v8 dataSource];
  }
  else
  {
    v11 = 0;
  }

  v12 = [v9 dataSource];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

    v13 = 0;
LABEL_13:
    v14 = 0;
    goto LABEL_24;
  }
  v13 = [v9 dataSource];

  v14 = 0;
  if (v11 && v13)
  {
    id v15 = [v7 dataSourceIdentifier];
    id v16 = [v11 identifier];
    if (v15 == v16)
    {
    }
    else
    {
      v17 = v16;
      char v18 = [v15 isEqual:v16];

      if ((v18 & 1) == 0)
      {
        v19 = PLOneUpGetLog();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          id v43 = v7;
          __int16 v44 = 2112;
          v45 = v11;
          _os_log_impl(&dword_1AE9F8000, v19, OS_LOG_TYPE_DEFAULT, "Version mismatch between %@ and %@, this might cause incorrect animations.", buf, 0x16u);
        }

        goto LABEL_13;
      }
    }
    v20 = [v7 indexPath];
    v21 = +[PUAssetsDataSourceConverter defaultConverter];
    v40 = @"PUTileKindItemContent";
    id v41 = v20;
    int v22 = [v21 convertIndexPath:&v41 tileKind:&v40 fromDataSource:v11 toDataSource:v13];
    id v23 = v41;

    v24 = v40;
    if (v22)
    {
      v25 = [v9 layoutInfoForTileWithIndexPath:v23 kind:v24];
      v26 = v25;
      if (v25)
      {
        [v25 center];
        double v28 = v27;
        double v30 = v29;
        [v7 size];
        double v33 = v31;
        double v34 = v32;
        if (v31 < v32) {
          double v31 = v32;
        }
        CGAffineTransformMakeScale(&v39, 1.0 / v31, 1.0 / v31);
        [v7 zPosition];
        double v36 = v35;
        v37 = [v26 coordinateSystem];
        v14 = objc_msgSend(v7, "layoutInfoWithCenter:size:alpha:transform:zPosition:coordinateSystem:", &v39, v37, v28, v30, v33, v34, 0.0, v36);
      }
      else
      {
        v14 = 0;
      }
    }
    else
    {
      v14 = 0;
    }
  }
LABEL_24:

  return v14;
}

- (BOOL)_isCenterTileLayoutInfo:(id)a3
{
  id v3 = a3;
  int64_t v4 = +[PUOneUpTilingLayout centerTileKinds];
  v5 = [v3 tileKind];

  LOBYTE(v3) = [v4 containsObject:v5];
  return (char)v3;
}

- (BOOL)_canInspectLayout:(id)a3
{
  id v3 = a3;
  if (!objc_opt_class() || (objc_opt_isKindOfClass() & 1) == 0)
  {

    id v4 = 0;
    goto LABEL_6;
  }
  id v4 = v3;

  if (!v4)
  {
LABEL_6:
    char v5 = 1;
    goto LABEL_7;
  }
  char v5 = [v4 isPrepared];
LABEL_7:

  return v5;
}

- (id)finalLayoutInfoForDisappearingTileController:(id)a3 fromLayoutInfo:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(PUDefaultLayoutToLayoutTileTransitionCoordinator *)self anchorAssetReference];
  id v9 = [v8 dataSourceIdentifier];
  v10 = [v7 dataSourceIdentifier];
  if ([v9 isEqual:v10])
  {
    v11 = [v8 indexPath];
    v12 = [v7 indexPath];
    int v13 = [v11 isEqual:v12];
  }
  else
  {
    int v13 = 0;
  }

  if (!v8 || v13)
  {
    id v31 = v6;
    v14 = [v7 dataSourceIdentifier];
    id v15 = [v7 indexPath];
    id v16 = [v7 tileKind];
    v17 = [(PUDefaultLayoutToLayoutTileTransitionCoordinator *)self toLayout];
    char v18 = [v17 dataSource];
    v19 = [v18 identifier];
    char v20 = [v14 isEqualToString:v19];

    if (v20)
    {
      v21 = 0;
      if (!v15)
      {
        id v6 = v31;
LABEL_14:

        if (v21) {
          goto LABEL_18;
        }
        goto LABEL_15;
      }
      id v6 = v31;
      if (!v16) {
        goto LABEL_14;
      }
      int v22 = [(PUDefaultLayoutToLayoutTileTransitionCoordinator *)self toLayout];
      id v23 = [v22 layoutInfoForTileWithIndexPath:v15 kind:v16];

      if (!v23)
      {
        v21 = 0;
        goto LABEL_13;
      }
      v24 = [v7 coordinateSystem];
      v21 = [v7 layoutInfoByInterpolatingWithLayoutInfo:v23 mixFactor:v24 coordinateSystem:1.0];
    }
    else
    {
      id v23 = [(PUDefaultLayoutToLayoutTileTransitionCoordinator *)self fromLayout];
      v24 = [v23 dataSource];
      v25 = [v24 identifier];
      [v14 isEqualToString:v25];

      v21 = 0;
    }

    id v6 = v31;
LABEL_13:

    goto LABEL_14;
  }
LABEL_15:
  if (![(PUDefaultLayoutToLayoutTileTransitionCoordinator *)self _isCenterTileLayoutInfo:v7])goto LABEL_17; {
  v26 = [(PUDefaultLayoutToLayoutTileTransitionCoordinator *)self fromLayout];
  }
  double v27 = [(PUDefaultLayoutToLayoutTileTransitionCoordinator *)self toLayout];
  v21 = [(PUDefaultLayoutToLayoutTileTransitionCoordinator *)self _centerTileLayoutInfoWithDefaultDisappearance:v7 layoutWhereCenterTileExists:v26 layoutWhereCenterTileDisappeared:v27];

  if (!v21)
  {
LABEL_17:
    v32.receiver = self;
    v32.super_class = (Class)PUDefaultLayoutToLayoutTileTransitionCoordinator;
    double v28 = [(PUDefaultTileTransitionCoordinator *)&v32 finalLayoutInfoForDisappearingTileController:v6 fromLayoutInfo:v7];
    double v29 = [(PUDefaultLayoutToLayoutTileTransitionCoordinator *)self fixedCoordinateSystem];
    v21 = [v28 layoutInfoWithCoordinateSystem:v29];
  }
LABEL_18:

  return v21;
}

- (id)initialLayoutInfoForAppearingTileController:(id)a3 toLayoutInfo:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(PUDefaultLayoutToLayoutTileTransitionCoordinator *)self anchorAssetReference];
  id v9 = [v8 dataSourceIdentifier];
  v10 = [v7 dataSourceIdentifier];
  if ([v9 isEqual:v10])
  {
    v11 = [v8 indexPath];
    v12 = [v7 indexPath];
    int v13 = [v11 isEqual:v12];
  }
  else
  {
    int v13 = 0;
  }

  if (v8 && !v13) {
    goto LABEL_30;
  }
  v14 = [(PUDefaultLayoutToLayoutTileTransitionCoordinator *)self fromLayout];
  BOOL v15 = [(PUDefaultLayoutToLayoutTileTransitionCoordinator *)self _canInspectLayout:v14];

  if (!v15) {
    goto LABEL_30;
  }
  id v16 = [(PUDefaultLayoutToLayoutTileTransitionCoordinator *)self fromLayout];
  v17 = [v16 dataSource];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    char v18 = [(PUDefaultLayoutToLayoutTileTransitionCoordinator *)self fromLayout];
    v38 = [v18 dataSource];
  }
  else
  {
    v38 = 0;
  }

  v19 = [(PUDefaultLayoutToLayoutTileTransitionCoordinator *)self toLayout];
  char v20 = [v19 dataSource];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v21 = [(PUDefaultLayoutToLayoutTileTransitionCoordinator *)self toLayout];
    int v22 = [v21 dataSource];
  }
  else
  {
    int v22 = 0;
  }

  id v23 = [v7 indexPath];
  v24 = [v7 tileKind];
  v25 = +[PUAssetsDataSourceConverter defaultConverter];
  id v40 = v24;
  id v41 = v23;
  int v26 = [v25 convertIndexPath:&v41 tileKind:&v40 fromDataSource:v22 toDataSource:v38];
  id v27 = v41;

  id v28 = v40;
  double v29 = 0;
  if (v26 && v27 && v28)
  {
    double v30 = [(PUDefaultLayoutToLayoutTileTransitionCoordinator *)self fromLayout];
    id v31 = [v30 layoutInfoForTileWithIndexPath:v27 kind:v28];

    if (v31)
    {
      objc_super v32 = [v7 coordinateSystem];
      double v29 = [v7 layoutInfoByInterpolatingWithLayoutInfo:v31 mixFactor:v32 coordinateSystem:1.0];
    }
    else
    {
      double v29 = 0;
    }
  }
  if (!v29)
  {
LABEL_30:
    if (![(PUDefaultLayoutToLayoutTileTransitionCoordinator *)self _isCenterTileLayoutInfo:v7])goto LABEL_24; {
    double v33 = [(PUDefaultLayoutToLayoutTileTransitionCoordinator *)self toLayout];
    }
    BOOL v34 = [(PUDefaultLayoutToLayoutTileTransitionCoordinator *)self _canInspectLayout:v33];

    if (!v34) {
      goto LABEL_24;
    }
    double v35 = [(PUDefaultLayoutToLayoutTileTransitionCoordinator *)self toLayout];
    double v36 = [(PUDefaultLayoutToLayoutTileTransitionCoordinator *)self fromLayout];
    double v29 = [(PUDefaultLayoutToLayoutTileTransitionCoordinator *)self _centerTileLayoutInfoWithDefaultDisappearance:v7 layoutWhereCenterTileExists:v35 layoutWhereCenterTileDisappeared:v36];

    if (!v29)
    {
LABEL_24:
      v39.receiver = self;
      v39.super_class = (Class)PUDefaultLayoutToLayoutTileTransitionCoordinator;
      double v29 = [(PUDefaultTileTransitionCoordinator *)&v39 initialLayoutInfoForAppearingTileController:v6 toLayoutInfo:v7];
    }
  }

  return v29;
}

- (BOOL)useDoubleSidedTransitionForUpdatedTileController:(id)a3 toLayoutInfo:(id)a4
{
  id v5 = a4;
  id v6 = [(PUDefaultLayoutToLayoutTileTransitionCoordinator *)self toLayout];
  id v7 = [v6 dataSource];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v8 = [(PUDefaultLayoutToLayoutTileTransitionCoordinator *)self toLayout];
    id v9 = [v8 dataSource];
  }
  else
  {
    id v9 = 0;
  }

  v10 = [v5 dataSourceIdentifier];
  v11 = [v9 identifier];
  int v12 = [v10 isEqualToString:v11];

  if (v12)
  {
    int v13 = [v5 indexPath];
    v14 = [v9 assetReferenceAtIndexPath:v13];
    BOOL v15 = [(PUDefaultLayoutToLayoutTileTransitionCoordinator *)self anchorAssetReference];
    char v16 = [v14 isEqual:v15];

    char v17 = v16 ^ 1;
  }
  else
  {
    char v17 = 1;
  }

  return v17;
}

- (id)optionsForAnimatingTileController:(id)a3 toLayoutInfo:(id)a4 withAnimationType:(int64_t)a5
{
  id v8 = a4;
  v15.receiver = self;
  v15.super_class = (Class)PUDefaultLayoutToLayoutTileTransitionCoordinator;
  id v9 = [(PUDefaultTileTransitionCoordinator *)&v15 optionsForAnimatingTileController:a3 toLayoutInfo:v8 withAnimationType:a5];
  v10 = [(PUDefaultLayoutToLayoutTileTransitionCoordinator *)self context];
  int v11 = [v10 isViewControllerTransition];

  if (v11) {
    [v9 setHighFrameRateReason:2228228];
  }
  int v12 = [v8 tileKind];
  char v13 = [v12 isEqualToString:PUTileKindBackground];

  if ((v13 & 1) == 0) {
    [(PUDefaultTileTransitionCoordinator *)self configureOptions:v9 forSpringAnimationsZoomingIn:[(PUDefaultLayoutToLayoutTileTransitionCoordinator *)self _isZoomingIn]];
  }

  return v9;
}

@end