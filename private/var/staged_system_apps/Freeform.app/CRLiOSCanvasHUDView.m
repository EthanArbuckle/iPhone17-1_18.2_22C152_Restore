@interface CRLiOSCanvasHUDView
+ (double)fontSizeForHUDViewSize:(unint64_t)a3;
+ (double)viewHeightForHUDViewSize:(unint64_t)a3;
- (BOOL)p_shouldAllowTouches;
- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4;
- (CRLiOSCanvasHUDView)initWithCoder:(id)a3;
- (CRLiOSCanvasHUDView)initWithFrame:(CGRect)a3;
- (UILabel)label;
- (id)initForHUDViewSize:(unint64_t)a3;
- (unint64_t)hudSize;
- (void)p_setupView;
- (void)updateViewToHUDViewSize:(unint64_t)a3;
@end

@implementation CRLiOSCanvasHUDView

+ (double)viewHeightForHUDViewSize:(unint64_t)a3
{
  double result = 35.0;
  if (a3 != 1) {
    double result = 0.0;
  }
  if (!a3) {
    return 29.0;
  }
  return result;
}

+ (double)fontSizeForHUDViewSize:(unint64_t)a3
{
  double result = 0.0;
  if (a3 == 1) {
    double result = 18.0;
  }
  if (!a3) {
    return 14.0;
  }
  return result;
}

- (CRLiOSCanvasHUDView)initWithFrame:(CGRect)a3
{
  return (CRLiOSCanvasHUDView *)-[CRLiOSCanvasHUDView initForHUDViewSize:](self, "initForHUDViewSize:", 0, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (CRLiOSCanvasHUDView)initWithCoder:(id)a3
{
  return (CRLiOSCanvasHUDView *)[(CRLiOSCanvasHUDView *)self initForHUDViewSize:0];
}

- (id)initForHUDViewSize:(unint64_t)a3
{
  +[CRLiOSCanvasHUDView viewHeightForHUDViewSize:](CRLiOSCanvasHUDView, "viewHeightForHUDViewSize:");
  v9.receiver = self;
  v9.super_class = (Class)CRLiOSCanvasHUDView;
  v6 = -[CRLiOSCanvasHUDView initWithFrame:](&v9, "initWithFrame:", 0.0, 0.0, 150.0, v5);
  v7 = v6;
  if (v6)
  {
    v6->_size = a3;
    [(CRLiOSCanvasHUDView *)v6 p_setupView];
  }
  return v7;
}

- (BOOL)p_shouldAllowTouches
{
  return 0;
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  if ([(CRLiOSCanvasHUDView *)self p_shouldAllowTouches])
  {
    v10.receiver = self;
    v10.super_class = (Class)CRLiOSCanvasHUDView;
    BOOL v8 = -[CRLiOSCanvasHUDView pointInside:withEvent:](&v10, "pointInside:withEvent:", v7, x, y);
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (void)updateViewToHUDViewSize:(unint64_t)a3
{
  if (self->_size != a3)
  {
    self->_size = a3;
    +[CRLiOSCanvasHUDView fontSizeForHUDViewSize:](CRLiOSCanvasHUDView, "fontSizeForHUDViewSize:");
    v4 = +[UIFont boldSystemFontOfSize:](UIFont, "boldSystemFontOfSize:");
    [(UILabel *)self->_label setFont:v4];

    label = self->_label;
    [(UILabel *)label bounds];
    -[UILabel sizeThatFits:](label, "sizeThatFits:", v6, v7);
    double v9 = v8 + 18.0;
    +[CRLiOSCanvasHUDView viewHeightForHUDViewSize:self->_size];
    [(CRLiOSCanvasHUDView *)self center];
    double v12 = sub_10006402C(v10, v11, v9);
    [(CRLiOSCanvasHUDView *)self setFrame:v12];
  }
}

- (void)p_setupView
{
  v3 = +[UIScreen mainScreen];
  [v3 scale];
  double v5 = v4;

  double v6 = +[UIImage imageNamed:@"CanvasHUD"];
  [v6 size];
  double v8 = 5.0 / v7;
  [v6 size];
  double v10 = 5.0 / v9;
  id v11 = v6;
  id v12 = [v11 CGImage];
  v13 = [(CRLiOSCanvasHUDView *)self layer];
  [v13 setContents:v12];

  v14 = [(CRLiOSCanvasHUDView *)self layer];
  [v14 setContentsCenter:v8, v10, 1.0 - v8 * 2.0, 1.0 - v10 * 2.0];

  v15 = [(CRLiOSCanvasHUDView *)self layer];
  [v15 setContentsScale:v5];

  v16 = [(CRLiOSCanvasHUDView *)self layer];
  [v16 setZPosition:1.0];

  v17 = [objc_alloc((Class)UILabel) initWithFrame:0.0, 0.0, 150.0, 20.0];
  label = self->_label;
  self->_label = v17;

  [(UILabel *)self->_label setText:&stru_101538650];
  +[CRLiOSCanvasHUDView fontSizeForHUDViewSize:self->_size];
  v19 = +[UIFont boldSystemFontOfSize:](UIFont, "boldSystemFontOfSize:");
  [(UILabel *)self->_label setFont:v19];

  [(UILabel *)self->_label setTextAlignment:1];
  v20 = +[UIColor whiteColor];
  [(UILabel *)self->_label setTextColor:v20];

  v21 = +[UIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:0.0];
  [(UILabel *)self->_label setBackgroundColor:v21];

  CGAffineTransformMakeTranslation(&v24, 0.0, -1.0);
  v22 = self->_label;
  CGAffineTransform v23 = v24;
  [(UILabel *)v22 setTransform:&v23];
  [(CRLiOSCanvasHUDView *)self bounds];
  -[UILabel setFrame:](self->_label, "setFrame:");
  [(UILabel *)self->_label setAutoresizingMask:18];
  [(CRLiOSCanvasHUDView *)self addSubview:self->_label];
}

- (unint64_t)hudSize
{
  return self->_size;
}

- (UILabel)label
{
  return self->_label;
}

- (void).cxx_destruct
{
}

@end