@interface THDottedHairlineView
- (THDottedHairlineView)initWithFrame:(CGRect)a3;
- (UIColor)color;
- (void)awakeFromNib;
- (void)dealloc;
- (void)drawRect:(CGRect)a3;
- (void)p_initCommon;
- (void)setColor:(id)a3;
@end

@implementation THDottedHairlineView

- (void)p_initCommon
{
  self->mColor = +[UIColor blackColor];
}

- (THDottedHairlineView)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)THDottedHairlineView;
  v3 = -[THDottedHairlineView initWithFrame:](&v6, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3) {
    [(THDottedHairlineView *)v3 p_initCommon];
  }
  return v4;
}

- (void)dealloc
{
  [(THDottedHairlineView *)self setColor:0];
  v3.receiver = self;
  v3.super_class = (Class)THDottedHairlineView;
  [(THDottedHairlineView *)&v3 dealloc];
}

- (void)awakeFromNib
{
  v3.receiver = self;
  v3.super_class = (Class)THDottedHairlineView;
  [(THDottedHairlineView *)&v3 awakeFromNib];
  [(THDottedHairlineView *)self p_initCommon];
}

- (void)drawRect:(CGRect)a3
{
  CurrentContext = UIGraphicsGetCurrentContext();
  CGContextSaveGState(CurrentContext);
  CGContextSetStrokeColorWithColor(CurrentContext, [(UIColor *)self->mColor CGColor]);
  CGContextSetLineDash(CurrentContext, 0.0, dbl_3447A0, 2uLL);
  [(THDottedHairlineView *)self frame];
  if (v5 >= 2.0)
  {
    [(THDottedHairlineView *)self frame];
    if (v7 >= 2.0)
    {
      [(THDottedHairlineView *)self frame];
      CGContextStrokeRect(CurrentContext, v12);
      goto LABEL_7;
    }
    points.x = 0.0;
    points.y = 0.0;
    [(THDottedHairlineView *)self frame];
    uint64_t v10 = v8;
    uint64_t v11 = 0;
  }
  else
  {
    points.x = 0.0;
    points.y = 0.0;
    [(THDottedHairlineView *)self frame];
    uint64_t v10 = 0;
    uint64_t v11 = v6;
  }
  CGContextStrokeLineSegments(CurrentContext, &points, 2uLL);
LABEL_7:
  CGContextRestoreGState(CurrentContext);
}

- (UIColor)color
{
  return self->mColor;
}

- (void)setColor:(id)a3
{
}

@end