@interface BKThumbnailDirectoryCell
- (BKPageThumbnailView)pageView;
- (BKThumbnailDirectoryCell)initWithFrame:(CGRect)a3;
- (BOOL)hasRibbon;
- (CGRect)contentRectForBounds:(CGRect)a3;
- (void)_traitCollectionDidChange:(id)a3 previousTraitCollection:(id)a4;
- (void)layoutSubviews;
- (void)prepareForReuse;
- (void)setHasRibbon:(BOOL)a3;
@end

@implementation BKThumbnailDirectoryCell

- (BKThumbnailDirectoryCell)initWithFrame:(CGRect)a3
{
  v16.receiver = self;
  v16.super_class = (Class)BKThumbnailDirectoryCell;
  v3 = -[BKThumbnailDirectoryCell initWithFrame:](&v16, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = +[UIScreen mainScreen];
    [v4 scale];
    double v6 = 1.0 / v5;

    v7 = [(BKThumbnailDirectoryCell *)v3 layer];
    [v7 setBorderWidth:v6];

    id v8 = +[UIColor bc_booksQuaternaryLabelColor];
    id v9 = [v8 CGColor];
    v10 = [(BKThumbnailDirectoryCell *)v3 layer];
    [v10 setBorderColor:v9];

    v11 = [(BKThumbnailDirectoryCell *)v3 layer];
    [v11 setMasksToBounds:1];

    v12 = [(BKThumbnailDirectoryCell *)v3 layer];
    [v12 setCornerRadius:6.0];

    [(BKThumbnailDirectoryCell *)v3 setClipsToBounds:1];
    v13 = +[UITraitCollection bc_allAPITraits];
    id v14 = [(BKThumbnailDirectoryCell *)v3 registerForTraitChanges:v13 withAction:"_traitCollectionDidChange:previousTraitCollection:"];
  }
  return v3;
}

- (void)prepareForReuse
{
  v6.receiver = self;
  v6.super_class = (Class)BKThumbnailDirectoryCell;
  [(BKThumbnailDirectoryCell *)&v6 prepareForReuse];
  [(BKThumbnailDirectoryCell *)self setShowSelectionView:1];
  [(BKThumbnailDirectoryCell *)self setHasRibbon:0];
  [(BKPageThumbnailView *)self->_pageView setImage:0];
  [(BKPageThumbnailView *)self->_pageView setPageNumber:0x7FFFFFFFFFFFFFFFLL];
  id v3 = +[UIColor bc_booksQuaternaryLabelColor];
  id v4 = [v3 CGColor];
  double v5 = [(BKThumbnailDirectoryCell *)self layer];
  [v5 setBorderColor:v4];
}

- (CGRect)contentRectForBounds:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  pageView = self->_pageView;
  if (pageView)
  {
    -[BKPageThumbnailView sizeThatFits:](pageView, "sizeThatFits:", a3.size.width, a3.size.height);
    CGRectFitRectInRect();
    CGFloat x = v8;
    CGFloat y = v9;
    CGFloat width = v10;
    CGFloat height = v11;
  }
  double v12 = x;
  double v13 = y;
  double v14 = width;
  double v15 = height;
  result.size.CGFloat height = v15;
  result.size.CGFloat width = v14;
  result.origin.CGFloat y = v13;
  result.origin.CGFloat x = v12;
  return result;
}

- (void)setHasRibbon:(BOOL)a3
{
  if (self->_hasRibbon != a3)
  {
    self->_hasRibbon = a3;
    [(UIImageView *)self->_ribbonView setHidden:!a3];
    [(BKThumbnailDirectoryCell *)self setNeedsLayout];
  }
}

- (BKPageThumbnailView)pageView
{
  pageView = self->_pageView;
  if (!pageView)
  {
    id v4 = -[BKPageThumbnailView initWithFrame:]([BKPageThumbnailView alloc], "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    double v5 = self->_pageView;
    self->_pageView = v4;

    [(BKThumbnailDirectoryCell *)self addSubview:self->_pageView];
    pageView = self->_pageView;
  }

  return pageView;
}

- (void)layoutSubviews
{
  v36.receiver = self;
  v36.super_class = (Class)BKThumbnailDirectoryCell;
  [(BKThumbnailDirectoryCell *)&v36 layoutSubviews];
  id v3 = [(BKThumbnailDirectoryCell *)self contentView];
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  -[BKThumbnailDirectoryCell contentRectForBounds:](self, "contentRectForBounds:", v5, v7, v9, v11);
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;
  double v19 = v18;
  if ([(BKThumbnailDirectoryCell *)self hasRibbon])
  {
    ribbonView = self->_ribbonView;
    if (!ribbonView)
    {
      v21 = +[UIImage imageNamed:@"ib_tb_icon_bookmark"];
      v22 = (UIImageView *)[objc_alloc((Class)UIImageView) initWithImage:v21];
      v23 = self->_ribbonView;
      self->_ribbonView = v22;

      v24 = [(BKThumbnailDirectoryCell *)self contentView];
      [v24 addSubview:self->_ribbonView];

      ribbonView = self->_ribbonView;
    }
    v25 = [(UIImageView *)ribbonView image];

    if (v25)
    {
      v26 = [(UIImageView *)self->_ribbonView image];
      [v26 size];
      double v28 = v27;
      double v30 = v29;

      if (isRetina()) {
        double v31 = -1.5;
      }
      else {
        double v31 = -2.0;
      }
      v37.origin.CGFloat x = v13;
      v37.origin.CGFloat y = v15;
      v37.size.CGFloat width = v17;
      v37.size.CGFloat height = v19;
      CGFloat v32 = CGRectGetMaxX(v37) - v28 + -8.0;
      v38.origin.CGFloat x = v13;
      v38.origin.CGFloat y = v15;
      v38.size.CGFloat width = v17;
      v38.size.CGFloat height = v19;
      -[UIImageView setFrame:](self->_ribbonView, "setFrame:", v32, v31 + CGRectGetMinY(v38), v28, v30);
    }
  }
  -[BKPageThumbnailView setFrame:](self->_pageView, "setFrame:", v13, v15, v17, v19);
  +[UIBezierPath bezierPathWithRect:](UIBezierPath, "bezierPathWithRect:", v13, v15, v17, v19);
  id v33 = objc_claimAutoreleasedReturnValue();
  id v34 = [v33 CGPath];
  v35 = [(BKThumbnailDirectoryCell *)self layer];
  [v35 setShadowPath:v34];
}

- (void)_traitCollectionDidChange:(id)a3 previousTraitCollection:(id)a4
{
  id v7 = +[UIColor bc_booksQuaternaryLabelColor];
  id v5 = [v7 CGColor];
  double v6 = [(BKThumbnailDirectoryCell *)self layer];
  [v6 setBorderColor:v5];
}

- (BOOL)hasRibbon
{
  return self->_hasRibbon;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pageView, 0);

  objc_storeStrong((id *)&self->_ribbonView, 0);
}

@end