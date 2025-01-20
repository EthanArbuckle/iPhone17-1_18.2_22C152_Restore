@interface PUPointDisplayLocationProvider
- (CGPoint)locationInView:(id)a3;
- (CGPoint)point;
- (PUPointDisplayLocationProvider)init;
- (PUPointDisplayLocationProvider)initWithPoint:(CGPoint)a3 inCoordinateSpace:(id)a4;
- (UICoordinateSpace)coordinateSpace;
@end

@implementation PUPointDisplayLocationProvider

- (void).cxx_destruct
{
}

- (UICoordinateSpace)coordinateSpace
{
  return self->_coordinateSpace;
}

- (CGPoint)point
{
  double x = self->_point.x;
  double y = self->_point.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (CGPoint)locationInView:(id)a3
{
  id v4 = a3;
  [(PUPointDisplayLocationProvider *)self point];
  double v6 = v5;
  double v8 = v7;
  v9 = [(PUPointDisplayLocationProvider *)self coordinateSpace];
  objc_msgSend(v9, "convertPoint:toCoordinateSpace:", v4, v6, v8);
  double v11 = v10;
  double v13 = v12;

  double v14 = v11;
  double v15 = v13;
  result.double y = v15;
  result.double x = v14;
  return result;
}

- (PUPointDisplayLocationProvider)initWithPoint:(CGPoint)a3 inCoordinateSpace:(id)a4
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PUPointDisplayLocationProvider;
  v9 = [(PUPointDisplayLocationProvider *)&v12 init];
  double v10 = v9;
  if (v9)
  {
    v9->_point.CGFloat x = x;
    v9->_point.CGFloat y = y;
    objc_storeStrong((id *)&v9->_coordinateSpace, a4);
  }

  return v10;
}

- (PUPointDisplayLocationProvider)init
{
  return -[PUPointDisplayLocationProvider initWithPoint:inCoordinateSpace:](self, "initWithPoint:inCoordinateSpace:", 0, *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8));
}

@end