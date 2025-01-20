@interface ODIHorizontalProcess11
- (void)mapPoint:(id)a3 bounds:(CGRect)a4;
@end

@implementation ODIHorizontalProcess11

- (void)mapPoint:(id)a3 bounds:(CGRect)a4
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  id v9 = a3;
  char v10 = [(ODIState *)self->super.mState pointIndex];
  uint64_t v11 = 65;
  if (v10) {
    uint64_t v11 = 66;
  }
  v12 = objc_msgSend(NSString, "stringWithFormat:", @"circle%c", v11);
  [(ODIState *)self->super.mState setPresentationName:v12 forPointType:2];
  v13.receiver = self;
  v13.super_class = (Class)ODIHorizontalProcess11;
  -[ODILinear mapPoint:bounds:](&v13, sel_mapPoint_bounds_, v9, x, y, width, height);
}

@end