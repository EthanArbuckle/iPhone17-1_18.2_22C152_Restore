@interface ODITarget1
- (void)mapPoint:(id)a3 bounds:(CGRect)a4;
@end

@implementation ODITarget1

- (void)mapPoint:(id)a3 bounds:(CGRect)a4
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  id v9 = a3;
  v10 = objc_msgSend(NSString, "stringWithFormat:", @"circle%d", -[ODIState pointIndex](self->super.mState, "pointIndex") + 1);
  [(ODIState *)self->super.mState setPresentationName:v10 forPointType:2];
  v11.receiver = self;
  v11.super_class = (Class)ODITarget1;
  -[ODILinear mapPoint:bounds:](&v11, sel_mapPoint_bounds_, v9, x, y, width, height);
}

@end