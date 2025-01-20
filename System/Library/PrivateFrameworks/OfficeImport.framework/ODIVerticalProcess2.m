@interface ODIVerticalProcess2
- (void)mapPoint:(id)a3 bounds:(CGRect)a4;
- (void)mapStyleFromTransition:(id)a3 shape:(id)a4;
@end

@implementation ODIVerticalProcess2

- (void)mapPoint:(id)a3 bounds:(CGRect)a4
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  id v9 = a3;
  signed int v10 = [(ODIState *)self->super.mState pointIndex];
  if (v10 >= [(ODIState *)self->super.mState pointCount] - 1) {
    v11 = @"parentTextBox";
  }
  else {
    v11 = @"parentTextArrow";
  }
  v12 = v11;
  [(ODIState *)self->super.mState setPresentationName:v12 forPointType:2];
  v13.receiver = self;
  v13.super_class = (Class)ODIVerticalProcess2;
  -[ODILinear mapPoint:bounds:](&v13, sel_mapPoint_bounds_, v9, x, y, width, height);
}

- (void)mapStyleFromTransition:(id)a3 shape:(id)a4
{
  id v9 = a4;
  v5 = [(ODIState *)self->super.mState diagram];
  v6 = [v5 documentPoint];
  v7 = [v6 children];
  v8 = objc_msgSend(v7, "objectAtIndex:", -[ODIState pointIndex](self->super.mState, "pointIndex"));

  +[ODIDrawable mapStyleFromPoint:v8 shape:v9 state:self->super.mState];
}

@end