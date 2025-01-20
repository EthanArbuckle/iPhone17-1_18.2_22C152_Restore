@interface UISegmentAccessibilityButton
+ (id)buttonWithSegment:(id)a3;
- (UISegment)segment;
- (id)hitTest:(CGPoint)a3 forEvent:(__GSEvent *)a4;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (void)layoutSubviews;
- (void)setSegment:(id)a3;
@end

@implementation UISegmentAccessibilityButton

+ (id)buttonWithSegment:(id)a3
{
  v8.receiver = a1;
  v8.super_class = (Class)&OBJC_METACLASS___UISegmentAccessibilityButton;
  id v3 = a3;
  v4 = objc_msgSendSuper2(&v8, sel_buttonWithType_, 0);
  v5 = +[UIColor clearColor];
  [v4 setBackgroundColor:v5];

  objc_msgSend(v3, "setFrameOrigin:", *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8));
  [v4 addSubview:v3];
  [v4 setSegment:v3];
  objc_msgSend(v4, "setUserInteractionEnabled:", objc_msgSend(v3, "isEnabled"));
  v6 = [v3 accessibilityLabel];

  [v4 setAccessibilityLabel:v6];
  return v4;
}

- (void)layoutSubviews
{
  v8.receiver = self;
  v8.super_class = (Class)UISegmentAccessibilityButton;
  [(UIButton *)&v8 layoutSubviews];
  [(UIView *)self size];
  double v4 = v3;
  double v6 = v5;
  v7 = [(UISegmentAccessibilityButton *)self segment];
  objc_msgSend(v7, "setSize:", v4, v6);
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)UISegmentAccessibilityButton;
  double v5 = -[UIControl hitTest:withEvent:](&v8, sel_hitTest_withEvent_, a4, a3.x, a3.y);

  if (v5) {
    double v6 = self;
  }
  else {
    double v6 = 0;
  }
  return v6;
}

- (id)hitTest:(CGPoint)a3 forEvent:(__GSEvent *)a4
{
  v8.receiver = self;
  v8.super_class = (Class)UISegmentAccessibilityButton;
  double v5 = -[UIControl hitTest:forEvent:](&v8, sel_hitTest_forEvent_, a4, a3.x, a3.y);

  if (v5) {
    double v6 = self;
  }
  else {
    double v6 = 0;
  }
  return v6;
}

- (UISegment)segment
{
  return self->_segment;
}

- (void)setSegment:(id)a3
{
}

- (void).cxx_destruct
{
}

@end