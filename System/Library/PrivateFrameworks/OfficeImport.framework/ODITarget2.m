@interface ODITarget2
- (void)mapPoint:(id)a3 bounds:(CGRect)a4;
@end

@implementation ODITarget2

- (void)mapPoint:(id)a3 bounds:(CGRect)a4
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  id v9 = a3;
  unsigned int v10 = [(ODIState *)self->super.mState pointIndex];
  if (v10 >= 3) {
    v11 = 0;
  }
  else {
    v11 = off_264D62B00[v10];
  }
  [(ODIState *)self->super.mState setPresentationName:v11 forPointType:2];
  v12.receiver = self;
  v12.super_class = (Class)ODITarget2;
  -[ODILinear mapPoint:bounds:](&v12, sel_mapPoint_bounds_, v9, x, y, width, height);
}

@end