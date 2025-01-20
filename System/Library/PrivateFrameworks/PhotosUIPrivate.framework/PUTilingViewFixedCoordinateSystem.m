@interface PUTilingViewFixedCoordinateSystem
- (CGPoint)coordinateSystemOrigin;
- (id)parentCoordinateSystem;
@end

@implementation PUTilingViewFixedCoordinateSystem

- (CGPoint)coordinateSystemOrigin
{
  v2 = [(PUTilingViewCoordinateSystem *)self tilingView];
  [v2 contentOffset];
  double v4 = v3;
  double v6 = v5;

  double v7 = v4;
  double v8 = v6;
  result.y = v8;
  result.x = v7;
  return result;
}

- (id)parentCoordinateSystem
{
  v2 = [(PUTilingViewCoordinateSystem *)self tilingView];
  double v3 = [v2 contentCoordinateSystem];

  return v3;
}

@end