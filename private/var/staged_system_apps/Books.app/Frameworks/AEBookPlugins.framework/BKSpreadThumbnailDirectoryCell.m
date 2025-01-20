@interface BKSpreadThumbnailDirectoryCell
- (BKSpreadThumbnailView)spreadView;
- (CGRect)contentRectForBounds:(CGRect)a3;
- (void)layoutSubviews;
- (void)prepareForReuse;
@end

@implementation BKSpreadThumbnailDirectoryCell

- (void)layoutSubviews
{
  v12.receiver = self;
  v12.super_class = (Class)BKSpreadThumbnailDirectoryCell;
  [(BKThumbnailDirectoryCell *)&v12 layoutSubviews];
  v3 = [(BKSpreadThumbnailDirectoryCell *)self contentView];
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  -[BKSpreadThumbnailDirectoryCell contentRectForBounds:](self, "contentRectForBounds:", v5, v7, v9, v11);
  -[BKSpreadThumbnailView setFrame:](self->_spreadView, "setFrame:");
}

- (void)prepareForReuse
{
  v7.receiver = self;
  v7.super_class = (Class)BKSpreadThumbnailDirectoryCell;
  [(BKThumbnailDirectoryCell *)&v7 prepareForReuse];
  v3 = [(BKSpreadThumbnailView *)self->_spreadView leftPageView];
  [v3 setImage:0];

  double v4 = [(BKSpreadThumbnailView *)self->_spreadView leftPageView];
  [v4 setPageNumber:0x7FFFFFFFFFFFFFFFLL];

  double v5 = [(BKSpreadThumbnailView *)self->_spreadView rightPageView];
  [v5 setImage:0];

  double v6 = [(BKSpreadThumbnailView *)self->_spreadView rightPageView];
  [v6 setPageNumber:0x7FFFFFFFFFFFFFFFLL];
}

- (CGRect)contentRectForBounds:(CGRect)a3
{
  [(BKSpreadThumbnailDirectoryCell *)self bounds];
  double x = v4;
  CGFloat y = v6;
  double width = v8;
  CGFloat height = v10;
  objc_super v12 = [(BKSpreadThumbnailView *)self->_spreadView leftPageView];
  id v13 = [v12 pageNumber];

  v14 = [(BKSpreadThumbnailView *)self->_spreadView rightPageView];
  id v15 = [v14 pageNumber];

  if (v13 == (id)0x7FFFFFFFFFFFFFFFLL && v15 == (id)0x7FFFFFFFFFFFFFFFLL)
  {
    double x = CGRectZero.origin.x;
    CGFloat y = CGRectZero.origin.y;
    double width = CGRectZero.size.width;
    CGFloat height = CGRectZero.size.height;
  }
  else if (v13 == (id)0x7FFFFFFFFFFFFFFFLL)
  {
    v21.origin.double x = x;
    v21.origin.CGFloat y = y;
    v21.size.double width = width;
    v21.size.CGFloat height = height;
    double width = CGRectGetWidth(v21) * 0.5;
    double x = x + width;
  }
  else if (v15 == (id)0x7FFFFFFFFFFFFFFFLL)
  {
    v22.origin.double x = x;
    v22.origin.CGFloat y = y;
    v22.size.double width = width;
    v22.size.CGFloat height = height;
    double width = CGRectGetWidth(v22) * 0.5;
  }
  double v17 = x;
  double v18 = y;
  double v19 = width;
  double v20 = height;
  result.size.CGFloat height = v20;
  result.size.double width = v19;
  result.origin.CGFloat y = v18;
  result.origin.double x = v17;
  return result;
}

- (BKSpreadThumbnailView)spreadView
{
  spreadView = self->_spreadView;
  if (!spreadView)
  {
    double v4 = -[BKSpreadThumbnailView initWithFrame:]([BKSpreadThumbnailView alloc], "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    double v5 = self->_spreadView;
    self->_spreadView = v4;

    [(BKSpreadThumbnailDirectoryCell *)self addSubview:self->_spreadView];
    spreadView = self->_spreadView;
  }

  return spreadView;
}

- (void).cxx_destruct
{
}

@end