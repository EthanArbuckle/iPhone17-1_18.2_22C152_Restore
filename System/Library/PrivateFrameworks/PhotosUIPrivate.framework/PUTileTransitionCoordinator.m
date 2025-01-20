@interface PUTileTransitionCoordinator
+ (id)browsingTileTransitionCoordinatorForTransitionFromLayout:(id)a3 toLayout:(id)a4 withTilingView:(id)a5 anchorAssetReference:(id)a6 context:(id)a7;
+ (id)defaultTileTransitionCoordinatorForFrameChangeWithTileCrossFade:(BOOL)a3 tilingView:(id)a4;
+ (id)defaultTileTransitionCoordinatorForLayoutInvalidationContext:(id)a3 layout:(id)a4 tilingView:(id)a5 viewModel:(id)a6;
+ (id)defaultTileTransitionCoordinatorForReattachedTileControllers:(id)a3 context:(id)a4;
+ (id)defaultTileTransitionCoordinatorForTransitionFromLayout:(id)a3 toLayout:(id)a4 withTilingView:(id)a5 anchorAssetReference:(id)a6 context:(id)a7;
+ (id)defaultTileTransitionCoordinatorForUpdates;
- (BOOL)useDoubleSidedTransitionForUpdatedTileController:(id)a3 toLayoutInfo:(id)a4;
- (id)finalLayoutInfoForDisappearingTileController:(id)a3 fromLayoutInfo:(id)a4;
- (id)initialLayoutInfoForAppearingTileController:(id)a3 toLayoutInfo:(id)a4;
- (id)newTileAnimationOptions;
- (id)optionsForAnimatingTileController:(id)a3 toLayoutInfo:(id)a4 withAnimationType:(int64_t)a5;
@end

@implementation PUTileTransitionCoordinator

+ (id)browsingTileTransitionCoordinatorForTransitionFromLayout:(id)a3 toLayout:(id)a4 withTilingView:(id)a5 anchorAssetReference:(id)a6 context:(id)a7
{
  id v11 = a7;
  id v12 = a6;
  id v13 = a4;
  id v14 = a3;
  v15 = [a5 fixedCoordinateSystem];
  v16 = objc_alloc_init(PUBrowsingLayoutToLayoutTileTransitionCoordinator);
  [(PUDefaultLayoutToLayoutTileTransitionCoordinator *)v16 setFromLayout:v14];

  [(PUDefaultLayoutToLayoutTileTransitionCoordinator *)v16 setToLayout:v13];
  [(PUDefaultLayoutToLayoutTileTransitionCoordinator *)v16 setAnchorAssetReference:v12];

  [(PUDefaultLayoutToLayoutTileTransitionCoordinator *)v16 setContext:v11];
  [(PUDefaultLayoutToLayoutTileTransitionCoordinator *)v16 setFixedCoordinateSystem:v15];

  return v16;
}

+ (id)defaultTileTransitionCoordinatorForLayoutInvalidationContext:(id)a3 layout:(id)a4 tilingView:(id)a5 viewModel:(id)a6
{
  id v8 = a3;
  id v9 = a5;
  id v10 = a6;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v11 = v8;
    unint64_t v12 = [v11 options];
    if ([v11 invalidatedContentInsets])
    {
      id v13 = objc_alloc_init(PUDefaultContentGuideInsetChangeTileTransitionCoordinator);
      [(PUDefaultFrameChangeTileTransitionCoordinator *)v13 setShouldCrossFadeTiles:0];
      [(PUDefaultFrameChangeTileTransitionCoordinator *)v13 setTilingView:v9];
      [(PUDefaultContentGuideInsetChangeTileTransitionCoordinator *)v13 setViewModel:v10];
      [(PUDefaultFrameChangeTileTransitionCoordinator *)v13 prepare];
    }
    else if ([v11 invalidatedVideoPlaceholderTile])
    {
      id v13 = objc_alloc_init(PUDefaultTileTransitionCoordinator);
    }
    else if ((v12 & 3) != 0)
    {
      id v13 = objc_alloc_init(PUDefaultAccessoryViewVisibilityChangeTileTransitionCoordinator);
      [(PUDefaultContentGuideInsetChangeTileTransitionCoordinator *)v13 setViewModel:v10];
      [(PUDefaultContentGuideInsetChangeTileTransitionCoordinator *)v13 setShouldAnimateContent:(v12 >> 1) & 1];
      [(PUDefaultContentGuideInsetChangeTileTransitionCoordinator *)v13 setShouldAnimateAccessory:v12 & 1];
      [(PUDefaultContentGuideInsetChangeTileTransitionCoordinator *)v13 setShouldSlideAccessory:(v12 >> 2) & 1];
    }
    else
    {
      id v13 = 0;
    }
  }
  else
  {
    id v13 = 0;
  }

  return v13;
}

+ (id)defaultTileTransitionCoordinatorForReattachedTileControllers:(id)a3 context:(id)a4
{
  id v4 = a4;
  v5 = objc_alloc_init(PUDefaultReattachedTileTransitionCoordinator);
  [(PUDefaultReattachedTileTransitionCoordinator *)v5 setContext:v4];

  return v5;
}

+ (id)defaultTileTransitionCoordinatorForFrameChangeWithTileCrossFade:(BOOL)a3 tilingView:(id)a4
{
  BOOL v4 = a3;
  id v5 = a4;
  v6 = objc_alloc_init(PUDefaultFrameChangeTileTransitionCoordinator);
  [(PUDefaultFrameChangeTileTransitionCoordinator *)v6 setShouldCrossFadeTiles:v4];
  [(PUDefaultFrameChangeTileTransitionCoordinator *)v6 setTilingView:v5];

  [(PUDefaultFrameChangeTileTransitionCoordinator *)v6 prepare];
  return v6;
}

+ (id)defaultTileTransitionCoordinatorForUpdates
{
  v2 = objc_alloc_init(PUDefaultUpdateTileTransitionCoordinator);
  return v2;
}

+ (id)defaultTileTransitionCoordinatorForTransitionFromLayout:(id)a3 toLayout:(id)a4 withTilingView:(id)a5 anchorAssetReference:(id)a6 context:(id)a7
{
  id v11 = a7;
  id v12 = a6;
  id v13 = a4;
  id v14 = a3;
  v15 = [a5 fixedCoordinateSystem];
  v16 = objc_alloc_init(PUDefaultLayoutToLayoutTileTransitionCoordinator);
  [(PUDefaultLayoutToLayoutTileTransitionCoordinator *)v16 setFromLayout:v14];

  [(PUDefaultLayoutToLayoutTileTransitionCoordinator *)v16 setToLayout:v13];
  [(PUDefaultLayoutToLayoutTileTransitionCoordinator *)v16 setAnchorAssetReference:v12];

  [(PUDefaultLayoutToLayoutTileTransitionCoordinator *)v16 setContext:v11];
  [(PUDefaultLayoutToLayoutTileTransitionCoordinator *)v16 setFixedCoordinateSystem:v15];

  return v16;
}

- (id)newTileAnimationOptions
{
  return objc_alloc_init(PUTileAnimationOptions);
}

- (id)optionsForAnimatingTileController:(id)a3 toLayoutInfo:(id)a4 withAnimationType:(int64_t)a5
{
  return 0;
}

- (BOOL)useDoubleSidedTransitionForUpdatedTileController:(id)a3 toLayoutInfo:(id)a4
{
  return 0;
}

- (id)finalLayoutInfoForDisappearingTileController:(id)a3 fromLayoutInfo:(id)a4
{
  return 0;
}

- (id)initialLayoutInfoForAppearingTileController:(id)a3 toLayoutInfo:(id)a4
{
  return 0;
}

@end