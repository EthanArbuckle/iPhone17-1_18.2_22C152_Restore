@interface _UIDragDestinationIndicatorView
- (BOOL)isSourceList;
- (NSIndexPath)currentIndexPath;
- (_UIDragDestinationIndicatorView)initWithSourceListStyle:(BOOL)a3;
- (double)scaleFactor;
- (void)drawRect:(CGRect)a3;
- (void)positionHorizontallyCenteredInFrame:(CGRect)a3;
- (void)positionOnCellFrame:(CGRect)a3 above:(BOOL)a4;
- (void)positionVerticallyCenteredInFrame:(CGRect)a3;
- (void)setCurrentIndexPath:(id)a3;
- (void)setIsSourceList:(BOOL)a3;
@end

@implementation _UIDragDestinationIndicatorView

- (_UIDragDestinationIndicatorView)initWithSourceListStyle:(BOOL)a3
{
  v8.receiver = self;
  v8.super_class = (Class)_UIDragDestinationIndicatorView;
  v4 = -[UIView initWithFrame:](&v8, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  v5 = v4;
  if (v4)
  {
    v4->_isSourceList = a3;
    v4->_scaleFactor = 1.0;
    v6 = +[UIColor clearColor];
    [(UIView *)v5 setBackgroundColor:v6];

    [(UIView *)v5 setContentMode:3];
  }
  return v5;
}

- (void)positionVerticallyCenteredInFrame:(CGRect)a3
{
  CGFloat height = a3.size.height;
  double width = a3.size.width;
  CGFloat y = a3.origin.y;
  double x = a3.origin.x;
  [(_UIDragDestinationIndicatorView *)self scaleFactor];
  double v9 = 10.0;
  if (!self->_isSourceList) {
    double v9 = 2.0;
  }
  double v10 = v8 * v9;
  v13.origin.double x = x;
  v13.origin.CGFloat y = y;
  v13.size.double width = width;
  v13.size.CGFloat height = height;
  double v11 = CGRectGetMidY(v13) + v10 * -0.5;
  -[UIView setFrame:](self, "setFrame:", x, v11, width, v10);
}

- (void)positionOnCellFrame:(CGRect)a3 above:(BOOL)a4
{
  double width = a3.size.width;
  double x = a3.origin.x;
  if (a4) {
    double MinY = CGRectGetMinY(a3);
  }
  else {
    double MinY = CGRectGetMaxY(a3);
  }
  -[_UIDragDestinationIndicatorView positionVerticallyCenteredInFrame:](self, "positionVerticallyCenteredInFrame:", x, MinY, width, 0.0);
}

- (void)positionHorizontallyCenteredInFrame:(CGRect)a3
{
  double height = a3.size.height;
  CGFloat width = a3.size.width;
  double y = a3.origin.y;
  CGFloat x = a3.origin.x;
  [(_UIDragDestinationIndicatorView *)self scaleFactor];
  double v9 = v8 + v8;
  v12.origin.CGFloat x = x;
  v12.origin.double y = y;
  v12.size.CGFloat width = width;
  v12.size.double height = height;
  double v10 = CGRectGetMidX(v12) + v9 * -0.5;
  -[UIView setFrame:](self, "setFrame:", v10, y, v9, height);
}

- (void)drawRect:(CGRect)a3
{
  [(_UIDragDestinationIndicatorView *)self scaleFactor];
  double v5 = v4;
  [(UIView *)self bounds];
  CGFloat x = v26.origin.x;
  CGFloat y = v26.origin.y;
  CGFloat width = v26.size.width;
  CGFloat height = v26.size.height;
  double v10 = CGRectGetHeight(v26);
  v27.origin.CGFloat x = x;
  v27.origin.CGFloat y = y;
  v27.size.CGFloat width = width;
  v27.size.CGFloat height = height;
  if (v10 <= CGRectGetWidth(v27))
  {
    v32.origin.CGFloat x = x;
    v32.origin.CGFloat y = y;
    v32.size.CGFloat width = width;
    v32.size.CGFloat height = height;
    double MinX = CGRectGetMinX(v32);
    v33.origin.CGFloat x = x;
    v33.origin.CGFloat y = y;
    v33.size.CGFloat width = width;
    v33.size.CGFloat height = height;
    double MidY = CGRectGetMidY(v33);
    v34.origin.CGFloat x = x;
    v34.origin.CGFloat y = y;
    v34.size.CGFloat width = width;
    v34.size.CGFloat height = height;
    double MaxX = CGRectGetMaxX(v34);
    v35.origin.CGFloat x = x;
    v35.origin.CGFloat y = y;
    v35.size.CGFloat width = width;
    v35.size.CGFloat height = height;
    double MaxY = CGRectGetMidY(v35);
  }
  else
  {
    v28.origin.CGFloat x = x;
    v28.origin.CGFloat y = y;
    v28.size.CGFloat width = width;
    v28.size.CGFloat height = height;
    double MinX = CGRectGetMidX(v28);
    v29.origin.CGFloat x = x;
    v29.origin.CGFloat y = y;
    v29.size.CGFloat width = width;
    v29.size.CGFloat height = height;
    double MidY = CGRectGetMinY(v29);
    v30.origin.CGFloat x = x;
    v30.origin.CGFloat y = y;
    v30.size.CGFloat width = width;
    v30.size.CGFloat height = height;
    double MaxX = CGRectGetMidX(v30);
    v31.origin.CGFloat x = x;
    v31.origin.CGFloat y = y;
    v31.size.CGFloat width = width;
    v31.size.CGFloat height = height;
    double MaxY = CGRectGetMaxY(v31);
  }
  double v15 = MaxY;
  if (self->_isSourceList)
  {
    double v16 = MaxX + v5 * -8.0;
    double v17 = v5 + v5;
    if ((*((_DWORD *)&self->super._viewFlags + 4) & 0x80000) == 0) {
      double v16 = v5 + v5 + MinX;
    }
    double v18 = MidY + v5 * -3.0;
    double v19 = v5 * 6.0;
    v20 = +[UIBezierPath bezierPathWithOvalInRect:](UIBezierPath, "bezierPathWithOvalInRect:", v16, v18, v19, v19);
    double v21 = v19 + v17;
    double v22 = -0.0;
    if ((*((_DWORD *)&self->super._viewFlags + 4) & 0x80000) == 0) {
      double v22 = v19 + v17;
    }
    double MinX = MinX + v22;
    if ((*((_DWORD *)&self->super._viewFlags + 4) & 0x80000) == 0) {
      double v21 = 0.0;
    }
    double MaxX = MaxX - v21;
  }
  else
  {
    v20 = +[UIBezierPath bezierPath];
    double v17 = v5 + v5;
  }
  id v24 = v20;
  objc_msgSend(v20, "moveToPoint:", MinX, MidY);
  objc_msgSend(v24, "addLineToPoint:", MaxX, v15);
  v23 = [(UIView *)self tintColor];
  [v23 set];

  [v24 setLineWidth:v17];
  [v24 stroke];
}

- (NSIndexPath)currentIndexPath
{
  return self->_currentIndexPath;
}

- (void)setCurrentIndexPath:(id)a3
{
}

- (BOOL)isSourceList
{
  return self->_isSourceList;
}

- (void)setIsSourceList:(BOOL)a3
{
  self->_isSourceList = a3;
}

- (double)scaleFactor
{
  return self->_scaleFactor;
}

- (void).cxx_destruct
{
}

@end