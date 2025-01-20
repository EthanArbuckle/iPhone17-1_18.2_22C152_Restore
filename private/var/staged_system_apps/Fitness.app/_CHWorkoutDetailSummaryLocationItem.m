@interface _CHWorkoutDetailSummaryLocationItem
- (CLLocation)firstCoordinate;
- (NSDictionary)swimDistanceByStrokeStyle;
- (id)firstCoordinateUpdatedBlock;
- (id)swimDistanceByStrokeStyleUpdateBlock;
- (void)setFirstCoordinate:(id)a3;
- (void)setFirstCoordinateUpdatedBlock:(id)a3;
- (void)setSwimDistanceByStrokeStyle:(id)a3;
- (void)setSwimDistanceByStrokeStyleUpdateBlock:(id)a3;
@end

@implementation _CHWorkoutDetailSummaryLocationItem

- (NSDictionary)swimDistanceByStrokeStyle
{
  return self->_swimDistanceByStrokeStyle;
}

- (void)setSwimDistanceByStrokeStyle:(id)a3
{
}

- (id)swimDistanceByStrokeStyleUpdateBlock
{
  return self->_swimDistanceByStrokeStyleUpdateBlock;
}

- (void)setSwimDistanceByStrokeStyleUpdateBlock:(id)a3
{
}

- (CLLocation)firstCoordinate
{
  return self->_firstCoordinate;
}

- (void)setFirstCoordinate:(id)a3
{
}

- (id)firstCoordinateUpdatedBlock
{
  return self->_firstCoordinateUpdatedBlock;
}

- (void)setFirstCoordinateUpdatedBlock:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_firstCoordinateUpdatedBlock, 0);
  objc_storeStrong((id *)&self->_firstCoordinate, 0);
  objc_storeStrong(&self->_swimDistanceByStrokeStyleUpdateBlock, 0);

  objc_storeStrong((id *)&self->_swimDistanceByStrokeStyle, 0);
}

@end