@interface BKLibraryBookshelfSeparatorLine
- (BKLibraryBookshelfSeparatorLine)initWithFrame:(CGRect)a3;
- (CAShapeLayer)separatorline;
- (void)applyLayoutAttributes:(id)a3;
- (void)layoutSubviews;
- (void)setSeparatorline:(id)a3;
@end

@implementation BKLibraryBookshelfSeparatorLine

- (BKLibraryBookshelfSeparatorLine)initWithFrame:(CGRect)a3
{
  v15.receiver = self;
  v15.super_class = (Class)BKLibraryBookshelfSeparatorLine;
  v3 = -[BKLibraryBookshelfSeparatorLine initWithFrame:](&v15, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = +[CAShapeLayer layer];
    [(BKLibraryBookshelfSeparatorLine *)v3 setSeparatorline:v4];

    id v5 = +[UIColor grayColor];
    id v6 = [v5 CGColor];
    v7 = [(BKLibraryBookshelfSeparatorLine *)v3 separatorline];
    [v7 setStrokeColor:v6];

    v8 = +[UIScreen mainScreen];
    [v8 scale];
    double v10 = 1.0 / v9;
    v11 = [(BKLibraryBookshelfSeparatorLine *)v3 separatorline];
    [v11 setLineWidth:v10];

    v12 = [(BKLibraryBookshelfSeparatorLine *)v3 layer];
    v13 = [(BKLibraryBookshelfSeparatorLine *)v3 separatorline];
    [v12 addSublayer:v13];
  }
  return v3;
}

- (void)layoutSubviews
{
  v19.receiver = self;
  v19.super_class = (Class)BKLibraryBookshelfSeparatorLine;
  [(BKLibraryBookshelfSeparatorLine *)&v19 layoutSubviews];
  [(BKLibraryBookshelfSeparatorLine *)self bounds];
  double v4 = v3;
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  v11 = +[UIBezierPath bezierPath];
  v12 = [(BKLibraryBookshelfSeparatorLine *)self separatorline];
  [v12 lineWidth];
  double v14 = v13 * -0.5 + 1.0;

  v20.origin.x = v4;
  v20.origin.y = v6;
  v20.size.width = v8;
  v20.size.height = v10;
  [v11 moveToPoint:v4, CGRectGetMaxY(v20) - v14];
  v21.origin.x = v4;
  v21.origin.y = v6;
  v21.size.width = v8;
  v21.size.height = v10;
  double MaxX = CGRectGetMaxX(v21);
  v22.origin.x = v4;
  v22.origin.y = v6;
  v22.size.width = v8;
  v22.size.height = v10;
  [v11 addLineToPoint:MaxX, CGRectGetMaxY(v22) - v14];
  id v16 = v11;
  id v17 = [v16 CGPath];
  v18 = [(BKLibraryBookshelfSeparatorLine *)self separatorline];
  [v18 setPath:v17];
}

- (void)applyLayoutAttributes:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)BKLibraryBookshelfSeparatorLine;
  [(BKLibraryBookshelfSeparatorLine *)&v8 applyLayoutAttributes:v4];
  id v5 = [v4 foregroundColor];
  id v6 = [v5 CGColor];
  double v7 = [(BKLibraryBookshelfSeparatorLine *)self separatorline];
  [v7 setStrokeColor:v6];
}

- (CAShapeLayer)separatorline
{
  return self->_separatorline;
}

- (void)setSeparatorline:(id)a3
{
}

- (void).cxx_destruct
{
}

@end