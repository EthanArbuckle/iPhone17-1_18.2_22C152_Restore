@interface PUTilingViewContentCoordinateSystem
- (CGPoint)coordinateSystemOrigin;
- (id)parentCoordinateSystem;
@end

@implementation PUTilingViewContentCoordinateSystem

- (CGPoint)coordinateSystemOrigin
{
  double v2 = *MEMORY[0x1E4F1DAD8];
  double v3 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  result.y = v3;
  result.x = v2;
  return result;
}

- (id)parentCoordinateSystem
{
  return 0;
}

@end