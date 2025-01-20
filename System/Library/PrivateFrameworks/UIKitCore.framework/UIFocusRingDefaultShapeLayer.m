@interface UIFocusRingDefaultShapeLayer
+ (id)focusLayerForUserInterfaceStyle:(int64_t)a3;
+ (id)parentLayerForUserInterfaceStyle:(int64_t)a3;
- (UIFocusRingDefaultShapeLayer)init;
@end

@implementation UIFocusRingDefaultShapeLayer

- (UIFocusRingDefaultShapeLayer)init
{
  v8.receiver = self;
  v8.super_class = (Class)UIFocusRingDefaultShapeLayer;
  v2 = [(UIFocusRingDefaultShapeLayer *)&v8 init];
  if (v2)
  {
    v3 = +[UIColor keyboardFocusIndicatorColor]();
    if ([(id)UIApp _effectiveUserInterfaceStyle] == 2)
    {
      uint64_t v4 = +[UIColor whiteColor];

      v3 = (void *)v4;
    }
    id v5 = v3;
    -[UIFocusRingDefaultShapeLayer setBorderColor:](v2, "setBorderColor:", [v5 CGColor]);
    id v6 = v5;
    -[UIFocusRingDefaultShapeLayer setStrokeColor:](v2, "setStrokeColor:", [v6 CGColor]);
    -[UIFocusRingDefaultShapeLayer setShadowOffset:](v2, "setShadowOffset:", *MEMORY[0x1E4F1DB30], *(double *)(MEMORY[0x1E4F1DB30] + 8));
    [(UIFocusRingDefaultShapeLayer *)v2 setFillColor:0];
    +[UIFocusRingStyle cornerRadius];
    -[UIFocusRingDefaultShapeLayer setCornerRadius:](v2, "setCornerRadius:");
    [(UIFocusRingDefaultShapeLayer *)v2 setLineJoin:*MEMORY[0x1E4F3A478]];
    [(UIFocusRingDefaultShapeLayer *)v2 setLineCap:*MEMORY[0x1E4F3A458]];
  }
  return v2;
}

+ (id)focusLayerForUserInterfaceStyle:(int64_t)a3
{
  v3 = objc_msgSend(a1, "layer", a3);
  +[UIFocusRingStyle borderThickness];
  objc_msgSend(v3, "setBorderWidth:");
  +[UIFocusRingStyle borderThickness];
  objc_msgSend(v3, "setLineWidth:");
  return v3;
}

+ (id)parentLayerForUserInterfaceStyle:(int64_t)a3
{
  v3 = objc_msgSend(a1, "layer", a3);
  +[UIFocusRingStyle childrenFocusedBorderThickness];
  objc_msgSend(v3, "setBorderWidth:");
  +[UIFocusRingStyle childrenFocusedBorderThickness];
  objc_msgSend(v3, "setLineWidth:");
  return v3;
}

@end