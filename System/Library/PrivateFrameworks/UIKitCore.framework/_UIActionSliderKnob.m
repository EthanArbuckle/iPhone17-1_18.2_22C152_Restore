@interface _UIActionSliderKnob
- (BOOL)isOpaque;
- (UIColor)knobColor;
- (_UIActionSliderKnob)initWithFrame:(CGRect)a3;
- (void)drawRect:(CGRect)a3;
- (void)setKnobColor:(id)a3;
@end

@implementation _UIActionSliderKnob

- (_UIActionSliderKnob)initWithFrame:(CGRect)a3
{
  v7.receiver = self;
  v7.super_class = (Class)_UIActionSliderKnob;
  v3 = -[UIView initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    uint64_t v4 = +[UIColor whiteColor];
    knobColor = v3->_knobColor;
    v3->_knobColor = (UIColor *)v4;
  }
  return v3;
}

- (BOOL)isOpaque
{
  return 0;
}

- (void)drawRect:(CGRect)a3
{
  ContextStack = GetContextStack(0);
  if (*(int *)ContextStack < 1) {
    v5 = 0;
  }
  else {
    v5 = (CGContext *)ContextStack[3 * (*(_DWORD *)ContextStack - 1) + 1];
  }
  UIGraphicsPushContext(v5);
  v6 = [(_UIActionSliderKnob *)self knobColor];
  id v8 = v6;
  if (v6) {
    CGContextSetFillColorWithColor(v5, (CGColorRef)[v6 CGColor]);
  }
  else {
    CGContextSetRGBFillColor(v5, 1.0, 1.0, 1.0, 1.0);
  }
  [(UIView *)self bounds];
  CGContextFillEllipseInRect(v5, v10);
  objc_super v7 = (int *)GetContextStack(0);
  PopContextFromStack(v7);
}

- (UIColor)knobColor
{
  return self->_knobColor;
}

- (void)setKnobColor:(id)a3
{
}

- (void).cxx_destruct
{
}

@end