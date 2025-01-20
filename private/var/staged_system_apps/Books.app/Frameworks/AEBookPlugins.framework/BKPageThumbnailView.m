@interface BKPageThumbnailView
- (BKPageThumbnailView)initWithFrame:(CGRect)a3;
- (BOOL)showsPageNumber;
- (CGSize)sizeThatFits:(CGSize)a3;
- (NSString)pageTitle;
- (UIImage)image;
- (UIImageView)imageView;
- (UILabel)pageLabel;
- (int64_t)pageNumber;
- (void)layoutSubviews;
- (void)setImage:(id)a3;
- (void)setImageView:(id)a3;
- (void)setPageLabel:(id)a3;
- (void)setPageNumber:(int64_t)a3;
- (void)setPageTitle:(id)a3;
- (void)setShowsPageNumber:(BOOL)a3;
@end

@implementation BKPageThumbnailView

- (BKPageThumbnailView)initWithFrame:(CGRect)a3
{
  v17.receiver = self;
  v17.super_class = (Class)BKPageThumbnailView;
  v3 = -[BKPageThumbnailView initWithFrame:](&v17, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v3->_pageNumber = 0x7FFFFFFFFFFFFFFFLL;
    id v5 = objc_alloc((Class)UIImageView);
    double y = CGRectZero.origin.y;
    double width = CGRectZero.size.width;
    double height = CGRectZero.size.height;
    v9 = [v5 initWithFrame:CGRectMake(0, 0, width, height)];
    imageView = v4->_imageView;
    v4->_imageView = v9;

    [(UIImageView *)v4->_imageView setOpaque:1];
    [(UIImageView *)v4->_imageView setContentMode:0];
    [(UIImageView *)v4->_imageView setClearsContextBeforeDrawing:0];
    [(BKPageThumbnailView *)v4 addSubview:v4->_imageView];
    v11 = [objc_alloc((Class)UILabel) initWithFrame:CGRectZero.origin.x, y, width, height];
    pageLabel = v4->_pageLabel;
    v4->_pageLabel = v11;

    v13 = +[UIFont boldSystemFontOfSize:24.0];
    [(UILabel *)v4->_pageLabel setFont:v13];

    [(UILabel *)v4->_pageLabel setTextAlignment:1];
    v14 = +[UIColor darkGrayColor];
    [(UILabel *)v4->_pageLabel setTextColor:v14];

    v15 = +[UIColor clearColor];
    [(UILabel *)v4->_pageLabel setBackgroundColor:v15];

    [(BKPageThumbnailView *)v4 addSubview:v4->_pageLabel];
  }
  return v4;
}

- (void)layoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)BKPageThumbnailView;
  [(BKPageThumbnailView *)&v4 layoutSubviews];
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_BC7BC;
  v3[3] = &unk_1DAB88;
  v3[4] = self;
  +[UIView performWithoutAnimation:v3];
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  CGFloat height = a3.height;
  CGFloat width = a3.width;
  v6 = [(BKPageThumbnailView *)self image];

  if (v6)
  {
    v7 = [(BKPageThumbnailView *)self image];
    [v7 size];
    CGSizeScaledToFitInSize();
    CGFloat width = v8;
    CGFloat height = v9;
  }
  double v10 = width;
  double v11 = height;
  result.CGFloat height = v11;
  result.CGFloat width = v10;
  return result;
}

- (void)setShowsPageNumber:(BOOL)a3
{
  if (self->_showsPageNumber != a3)
  {
    self->_showsPageNumber = a3;
    [(BKPageThumbnailView *)self setNeedsLayout];
  }
}

- (void)setPageNumber:(int64_t)a3
{
  if (self->_pageNumber != a3)
  {
    pageTitle = self->_pageTitle;
    self->_pageTitle = 0;

    self->_pageNumber = a3;
    [(BKPageThumbnailView *)self setNeedsLayout];
  }
}

- (void)setPageTitle:(id)a3
{
  id v5 = (NSString *)a3;
  p_pageTitle = &self->_pageTitle;
  if (self->_pageTitle != v5)
  {
    v7 = v5;
    objc_storeStrong((id *)p_pageTitle, a3);
    p_pageTitle = (NSString **)[(BKPageThumbnailView *)self setNeedsLayout];
    id v5 = v7;
  }

  _objc_release_x1(p_pageTitle, v5);
}

- (UIImage)image
{
  return [(UIImageView *)self->_imageView image];
}

- (void)setImage:(id)a3
{
  id v4 = a3;
  id v5 = [(BKPageThumbnailView *)self imageView];
  [v5 setImage:v4];

  [(BKPageThumbnailView *)self setNeedsLayout];
}

- (int64_t)pageNumber
{
  return self->_pageNumber;
}

- (NSString)pageTitle
{
  return self->_pageTitle;
}

- (BOOL)showsPageNumber
{
  return self->_showsPageNumber;
}

- (UIImageView)imageView
{
  return self->_imageView;
}

- (void)setImageView:(id)a3
{
}

- (UILabel)pageLabel
{
  return self->_pageLabel;
}

- (void)setPageLabel:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pageLabel, 0);
  objc_storeStrong((id *)&self->_imageView, 0);

  objc_storeStrong((id *)&self->_pageTitle, 0);
}

@end