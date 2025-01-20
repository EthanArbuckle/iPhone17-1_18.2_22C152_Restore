@interface CRLiOSInsertPageViewControllerFadeView
- (CRLiOSInsertPageViewControllerFadeView)initWithStartPoint:(CGPoint)a3 endPoint:(CGPoint)a4 shouldAddDividerView:(BOOL)a5;
- (void)layoutSubviews;
@end

@implementation CRLiOSInsertPageViewControllerFadeView

- (CRLiOSInsertPageViewControllerFadeView)initWithStartPoint:(CGPoint)a3 endPoint:(CGPoint)a4 shouldAddDividerView:(BOOL)a5
{
  BOOL v5 = a5;
  double y = a4.y;
  double x = a4.x;
  double v8 = a3.y;
  double v9 = a3.x;
  v24.receiver = self;
  v24.super_class = (Class)CRLiOSInsertPageViewControllerFadeView;
  double v10 = CGRectZero.origin.y;
  double width = CGRectZero.size.width;
  double height = CGRectZero.size.height;
  v13 = -[CRLiOSInsertPageViewControllerFadeView initWithFrame:](&v24, "initWithFrame:", CGRectZero.origin.x, v10, width, height);
  if (v13)
  {
    v14 = +[CAGradientLayer layer];
    v15 = +[UIColor whiteColor];
    id v16 = [v15 colorWithAlphaComponent:0.0];
    v25[0] = [v16 CGColor];
    v17 = +[UIColor whiteColor];
    id v18 = [v17 colorWithAlphaComponent:1.0];
    v25[1] = [v18 CGColor];
    v19 = +[NSArray arrayWithObjects:v25 count:2];
    [v14 setColors:v19];

    [v14 setStartPoint:v9, v8];
    [v14 setEndPoint:x, y];
    v20 = [(CRLiOSInsertPageViewControllerFadeView *)v13 layer];
    [v20 setMask:v14];

    if (v5)
    {
      v21 = -[CRLiOSInspectorDividerView initWithFrame:]([CRLiOSInspectorDividerView alloc], "initWithFrame:", CGRectZero.origin.x, v10, width, height);
      line = v13->_line;
      v13->_line = v21;

      [(CRLiOSInsertPageViewControllerFadeView *)v13 addSubview:v13->_line];
    }
  }
  return v13;
}

- (void)layoutSubviews
{
  v14.receiver = self;
  v14.super_class = (Class)CRLiOSInsertPageViewControllerFadeView;
  [(CRLiOSInsertPageViewControllerFadeView *)&v14 layoutSubviews];
  [(CRLiOSInsertPageViewControllerFadeView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  v11 = [(CRLiOSInsertPageViewControllerFadeView *)self layer];
  v12 = [v11 mask];
  [v12 setFrame:v4, v6, v8, v10];

  if (self->_line)
  {
    v15.origin.double x = v4;
    v15.origin.double y = v6;
    v15.size.double width = v8;
    v15.size.double height = v10;
    CGFloat v13 = CGRectGetHeight(v15) + -1.0;
    v16.origin.double x = v4;
    v16.origin.double y = v6;
    v16.size.double width = v8;
    v16.size.double height = v10;
    -[CRLiOSInspectorDividerView setFrame:](self->_line, "setFrame:", 0.0, v13, CGRectGetWidth(v16), 1.0);
  }
}

- (void).cxx_destruct
{
}

@end