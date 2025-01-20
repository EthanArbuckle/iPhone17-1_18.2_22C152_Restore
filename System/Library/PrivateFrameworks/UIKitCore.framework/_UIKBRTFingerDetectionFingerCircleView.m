@interface _UIKBRTFingerDetectionFingerCircleView
- (BOOL)isOpaque;
- (CGColor)borderColor;
- (_UIKBRTFingerDetectionFingerCircleView)initWithFrame:(CGRect)a3;
- (void)_updateCornersFromFrame:(CGRect)a3;
- (void)setBorderColor:(CGColor *)a3;
- (void)setFrame:(CGRect)a3;
@end

@implementation _UIKBRTFingerDetectionFingerCircleView

- (_UIKBRTFingerDetectionFingerCircleView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v11.receiver = self;
  v11.super_class = (Class)_UIKBRTFingerDetectionFingerCircleView;
  v7 = -[UIView initWithFrame:](&v11, sel_initWithFrame_);
  if (v7)
  {
    v8 = +[UIColor clearColor];
    [(UIView *)v7 setBackgroundColor:v8];

    v9 = [(UIView *)v7 layer];
    [v9 setMasksToBounds:1];

    -[_UIKBRTFingerDetectionFingerCircleView _updateCornersFromFrame:](v7, "_updateCornersFromFrame:", x, y, width, height);
  }
  return v7;
}

- (BOOL)isOpaque
{
  return 0;
}

- (void)setFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v8.receiver = self;
  v8.super_class = (Class)_UIKBRTFingerDetectionFingerCircleView;
  -[UIView setFrame:](&v8, sel_setFrame_);
  -[_UIKBRTFingerDetectionFingerCircleView _updateCornersFromFrame:](self, "_updateCornersFromFrame:", x, y, width, height);
}

- (void)setBorderColor:(CGColor *)a3
{
  v5 = [(UIView *)self layer];
  v6 = v5;
  if (a3)
  {
    [v5 setBorderColor:a3];

    id v7 = [(UIView *)self layer];
    [v7 setBorderWidth:3.0];
  }
  else
  {
    [v5 setBorderWidth:0.0];

    id v7 = [(UIView *)self layer];
    [v7 setBorderColor:0];
  }
}

- (CGColor)borderColor
{
  v2 = [(UIView *)self layer];
  v3 = (CGColor *)[v2 borderColor];

  return v3;
}

- (void)_updateCornersFromFrame:(CGRect)a3
{
  float v3 = a3.size.width * 0.5;
  double v4 = floorf(v3);
  id v5 = [(UIView *)self layer];
  [v5 setCornerRadius:v4];
}

@end