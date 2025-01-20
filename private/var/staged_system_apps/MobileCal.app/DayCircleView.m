@interface DayCircleView
- (BOOL)usesRoundedRectInsteadOfCircle;
- (DayCircleView)initWithFrame:(CGRect)a3;
- (UIColor)color;
- (void)drawRect:(CGRect)a3;
- (void)setColor:(id)a3;
- (void)setUsesRoundedRectInsteadOfCircle:(BOOL)a3;
@end

@implementation DayCircleView

- (void)drawRect:(CGRect)a3
{
  CurrentContext = UIGraphicsGetCurrentContext();
  v5 = [(DayCircleView *)self color];
  [v5 set];

  if ([(DayCircleView *)self usesRoundedRectInsteadOfCircle])
  {
    [(DayCircleView *)self bounds];
    +[UIBezierPath bezierPathWithRoundedRect:cornerRadius:](UIBezierPath, "bezierPathWithRoundedRect:cornerRadius:");
    id v10 = (id)objc_claimAutoreleasedReturnValue();
    [v10 fill];
  }
  else
  {
    [(DayCircleView *)self bounds];
    CGContextFillEllipseInRect(CurrentContext, *(CGRect *)&v6);
  }
}

- (void)setColor:(id)a3
{
  objc_storeStrong((id *)&self->_color, a3);

  [(DayCircleView *)self setNeedsDisplay];
}

- (DayCircleView)initWithFrame:(CGRect)a3
{
  v8.receiver = self;
  v8.super_class = (Class)DayCircleView;
  v3 = -[DayCircleView initWithFrame:](&v8, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = +[UIColor systemBackgroundColor];
    [(DayCircleView *)v3 setBackgroundColor:v4];

    uint64_t v5 = CalendarAppCircleNonTodayBGColor();
    color = v3->_color;
    v3->_color = (UIColor *)v5;
  }
  return v3;
}

- (BOOL)usesRoundedRectInsteadOfCircle
{
  return self->_usesRoundedRectInsteadOfCircle;
}

- (void)setUsesRoundedRectInsteadOfCircle:(BOOL)a3
{
  if (self->_usesRoundedRectInsteadOfCircle != a3)
  {
    self->_usesRoundedRectInsteadOfCircle = a3;
    [(DayCircleView *)self setNeedsDisplay];
  }
}

- (UIColor)color
{
  return self->_color;
}

- (void).cxx_destruct
{
}

@end