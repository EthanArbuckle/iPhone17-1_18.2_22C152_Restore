@interface TSKBiggerButton
+ (id)tsdPlatformButtonWithFrame:(CGRect)a3;
- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4;
- (void)setHitBufferTop:(double)a3 left:(double)a4 bottom:(double)a5 right:(double)a6;
@end

@implementation TSKBiggerButton

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  v14.receiver = self;
  v14.super_class = (Class)TSKBiggerButton;
  BOOL result = -[TSKBiggerButton pointInside:withEvent:](&v14, sel_pointInside_withEvent_, a4);
  if (self->mHitTestWithOutsets && !result)
  {
    [(TSKBiggerButton *)self bounds];
    double top = self->mOutsets.top;
    double left = self->mOutsets.left;
    v16.origin.CGFloat x = v10 + left;
    v16.origin.CGFloat y = v11 + top;
    v16.size.width = v12 - (left + self->mOutsets.right);
    v16.size.height = v13 - (top + self->mOutsets.bottom);
    v15.CGFloat x = x;
    v15.CGFloat y = y;
    return CGRectContainsPoint(v16, v15);
  }
  return result;
}

- (void)setHitBufferTop:(double)a3 left:(double)a4 bottom:(double)a5 right:(double)a6
{
  self->mOutsets.double top = -a3;
  self->mOutsets.double left = -a4;
  self->mOutsets.bottom = -a5;
  self->mOutsets.right = -a6;
  self->mHitTestWithOutsets = 1;
}

+ (id)tsdPlatformButtonWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v7 = +[TSKBiggerButton buttonWithType:0];
  -[TSKBiggerButton setFrame:](v7, "setFrame:", x, y, width, height);
  return v7;
}

@end