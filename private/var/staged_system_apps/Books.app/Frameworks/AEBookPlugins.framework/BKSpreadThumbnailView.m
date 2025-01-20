@interface BKSpreadThumbnailView
- (BKPageThumbnailView)leftPageView;
- (BKPageThumbnailView)rightPageView;
- (BOOL)hidesSpine;
- (CGSize)pageSize;
- (CGSize)sizeThatFits:(CGSize)a3;
- (id)gutter;
- (void)layoutSubviews;
- (void)setHidesSpine:(BOOL)a3;
- (void)setPageSize:(CGSize)a3;
@end

@implementation BKSpreadThumbnailView

- (void)layoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)BKSpreadThumbnailView;
  [(BKSpreadThumbnailView *)&v4 layoutSubviews];
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_BD1B0;
  v3[3] = &unk_1DAB88;
  v3[4] = self;
  +[UIView performWithoutAnimation:v3];
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  if ([(BKPageThumbnailView *)self->_leftPageView pageNumber] != 0x7FFFFFFFFFFFFFFFLL
    && [(BKPageThumbnailView *)self->_rightPageView pageNumber] != 0x7FFFFFFFFFFFFFFFLL)
  {
    [(BKSpreadThumbnailView *)self pageSize];
    double width = v7 + v7;
    goto LABEL_8;
  }
  if ([(BKPageThumbnailView *)self->_leftPageView pageNumber] != 0x7FFFFFFFFFFFFFFFLL
    || [(BKPageThumbnailView *)self->_rightPageView pageNumber] != 0x7FFFFFFFFFFFFFFFLL)
  {
    [(BKSpreadThumbnailView *)self pageSize];
    double width = v6;
LABEL_8:
    [(BKSpreadThumbnailView *)self pageSize];
    goto LABEL_9;
  }
  double width = CGSizeZero.width;
  double height = CGSizeZero.height;
LABEL_9:
  double v8 = width;
  result.double height = height;
  result.double width = v8;
  return result;
}

- (BKPageThumbnailView)leftPageView
{
  leftPageView = self->_leftPageView;
  if (!leftPageView)
  {
    objc_super v4 = -[BKPageThumbnailView initWithFrame:]([BKPageThumbnailView alloc], "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    v5 = self->_leftPageView;
    self->_leftPageView = v4;

    [(BKPageThumbnailView *)self->_leftPageView setShowsPageNumber:0];
    [(BKSpreadThumbnailView *)self insertSubview:self->_leftPageView atIndex:0];
    leftPageView = self->_leftPageView;
  }

  return leftPageView;
}

- (BKPageThumbnailView)rightPageView
{
  rightPageView = self->_rightPageView;
  if (!rightPageView)
  {
    objc_super v4 = -[BKPageThumbnailView initWithFrame:]([BKPageThumbnailView alloc], "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    v5 = self->_rightPageView;
    self->_rightPageView = v4;

    [(BKPageThumbnailView *)self->_rightPageView setShowsPageNumber:0];
    [(BKSpreadThumbnailView *)self insertSubview:self->_rightPageView atIndex:0];
    rightPageView = self->_rightPageView;
  }

  return rightPageView;
}

- (id)gutter
{
  gutter = self->_gutter;
  if (!gutter)
  {
    objc_super v4 = +[UIImage imageNamed:@"pb-toc-spread-gradient"];
    v5 = (UIImageView *)[objc_alloc((Class)UIImageView) initWithImage:v4];
    double v6 = self->_gutter;
    self->_gutter = v5;

    [(UIImageView *)self->_gutter setContentMode:0];
    [(BKSpreadThumbnailView *)self addSubview:self->_gutter];

    gutter = self->_gutter;
  }

  return gutter;
}

- (BOOL)hidesSpine
{
  return self->_hidesSpine;
}

- (void)setHidesSpine:(BOOL)a3
{
  self->_hidesSpine = a3;
}

- (CGSize)pageSize
{
  double width = self->_pageSize.width;
  double height = self->_pageSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setPageSize:(CGSize)a3
{
  self->_pageSize = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_gutter, 0);
  objc_storeStrong((id *)&self->_rightPageView, 0);

  objc_storeStrong((id *)&self->_leftPageView, 0);
}

@end