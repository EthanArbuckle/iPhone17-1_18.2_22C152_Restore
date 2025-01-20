@interface ODIArrow2
- (void)mapPoint:(id)a3 bounds:(CGRect)a4;
@end

@implementation ODIArrow2

- (void)mapPoint:(id)a3 bounds:(CGRect)a4
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  id v9 = a3;
  v10 = objc_msgSend(NSString, "stringWithFormat:", @"bullet%d%c", -[ODIState pointCount](self->super.mState, "pointCount"), -[ODIState pointIndex](self->super.mState, "pointIndex") + 97);
  [(ODIState *)self->super.mState setPresentationName:v10 forPointType:2];
  v11.receiver = self;
  v11.super_class = (Class)ODIArrow2;
  -[ODILinear mapPoint:bounds:](&v11, sel_mapPoint_bounds_, v9, x, y, width, height);
}

@end