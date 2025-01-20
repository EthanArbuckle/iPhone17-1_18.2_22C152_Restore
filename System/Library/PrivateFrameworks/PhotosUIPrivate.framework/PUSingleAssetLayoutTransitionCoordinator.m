@interface PUSingleAssetLayoutTransitionCoordinator
- (PUTilingCoordinateSystem)fixedCoordinateSystem;
- (id)_layoutInfoWithDefaultDisappearance:(id)a3;
- (id)finalLayoutInfoForDisappearingTileController:(id)a3 fromLayoutInfo:(id)a4;
- (id)initialLayoutInfoForAppearingTileController:(id)a3 toLayoutInfo:(id)a4;
- (void)setFixedCoordinateSystem:(id)a3;
@end

@implementation PUSingleAssetLayoutTransitionCoordinator

- (void).cxx_destruct
{
}

- (void)setFixedCoordinateSystem:(id)a3
{
}

- (PUTilingCoordinateSystem)fixedCoordinateSystem
{
  return self->_fixedCoordinateSystem;
}

- (id)_layoutInfoWithDefaultDisappearance:(id)a3
{
  id v4 = a3;
  v5 = [(PUSingleAssetLayoutTransitionCoordinator *)self fixedCoordinateSystem];
  v6 = [v4 layoutInfoWithCoordinateSystem:v5];

  v7 = [v6 layoutInfoWithZPosition:*(double *)&PUTilingLayoutBackgroundZPosition + *(double *)&PUTilingLayoutBackgroundZPosition];

  return v7;
}

- (id)finalLayoutInfoForDisappearingTileController:(id)a3 fromLayoutInfo:(id)a4
{
  return [(PUSingleAssetLayoutTransitionCoordinator *)self _layoutInfoWithDefaultDisappearance:a4];
}

- (id)initialLayoutInfoForAppearingTileController:(id)a3 toLayoutInfo:(id)a4
{
  return [(PUSingleAssetLayoutTransitionCoordinator *)self _layoutInfoWithDefaultDisappearance:a4];
}

@end