@interface ODIAccentedImageLinear
- (void)mapPoint:(id)a3 bounds:(CGRect)a4;
@end

@implementation ODIAccentedImageLinear

- (void)mapPoint:(id)a3 bounds:(CGRect)a4
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  id v9 = a3;
  v16.receiver = self;
  v16.super_class = (Class)ODIAccentedImageLinear;
  -[ODIImageLinear mapPoint:bounds:](&v16, sel_mapPoint_bounds_, v9, x, y, width, height);
  if (![(ODIState *)self->super.super.mState pointIndex])
  {
    v10 = [(ODIState *)self->super.super.mState group];
    unint64_t v11 = [v10 childCount];

    if (v11 >= 2)
    {
      v12 = [(ODIState *)self->super.super.mState group];
      v13 = [(ODIState *)self->super.super.mState group];
      v14 = objc_msgSend(v12, "childAtIndex:", objc_msgSend(v13, "childCount") - 2);

      v15 = [v9 siblingTransition];
      +[ODIDrawable mapStyleFromPoint:v15 shape:v14 state:self->super.super.mState];
    }
  }
}

@end