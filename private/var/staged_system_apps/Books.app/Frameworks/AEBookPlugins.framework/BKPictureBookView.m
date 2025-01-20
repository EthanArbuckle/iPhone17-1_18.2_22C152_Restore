@interface BKPictureBookView
+ (CGSize)actualSizeForContentSize:(CGSize)result drawsSpine:(BOOL)a4;
- (BKPictureBookView)initWithFrame:(CGRect)a3;
- (BOOL)drawsShadow;
- (BOOL)drawsSpine;
- (CGSize)actualSize;
- (CGSize)contentSize;
- (CGSize)idealSinglePageSize;
- (UIView)contentView;
- (UIView)leftContentView;
- (UIView)rightContentView;
- (double)scale;
- (id)gutter;
- (void)_updateShadowPath;
- (void)calculateFramesAtScale:(double)a3 contentFrame:(CGRect *)a4 leftContentFrame:(CGRect *)a5 rightContentFrame:(CGRect *)a6;
- (void)layoutSubviews;
- (void)setContentSize:(CGSize)a3;
- (void)setDrawsShadow:(BOOL)a3;
- (void)setDrawsSpine:(BOOL)a3;
- (void)setIdealSinglePageSize:(CGSize)a3;
- (void)setLeftContentView:(id)a3;
- (void)setRightContentView:(id)a3;
- (void)setScale:(double)a3;
@end

@implementation BKPictureBookView

- (BKPictureBookView)initWithFrame:(CGRect)a3
{
  v9.receiver = self;
  v9.super_class = (Class)BKPictureBookView;
  v3 = -[BKPictureBookView initWithFrame:](&v9, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    [(BKPictureBookView *)v3 setScale:1.0];
    v5 = [objc_alloc((Class)UIView) initWithFrame:CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height];
    contentView = v4->_contentView;
    v4->_contentView = v5;

    v7 = +[UIColor whiteColor];
    [(UIView *)v4->_contentView setBackgroundColor:v7];

    [(UIView *)v4->_contentView setOpaque:1];
    [(UIView *)v4->_contentView setClipsToBounds:1];
    [(BKPictureBookView *)v4 addSubview:v4->_contentView];
  }
  return v4;
}

- (void)calculateFramesAtScale:(double)a3 contentFrame:(CGRect *)a4 leftContentFrame:(CGRect *)a5 rightContentFrame:(CGRect *)a6
{
  [(BKPictureBookView *)self actualSize];
  CGFloat v12 = v11 * a3;
  [(BKPictureBookView *)self actualSize];
  v41.size.double height = v13 * a3;
  v41.origin.double x = 0.0;
  v41.origin.double y = 0.0;
  v41.size.double width = v12;
  CGRect v42 = CGRectIntegral(v41);
  double x = v42.origin.x;
  double y = v42.origin.y;
  double width = v42.size.width;
  double height = v42.size.height;
  [(BKPictureBookView *)self idealSinglePageSize];
  BOOL v20 = CGSizeZero.width == v19 && CGSizeZero.height == v18;
  double v21 = height;
  double v22 = width;
  double v23 = y;
  double v24 = x;
  if (!v20)
  {
    [(BKPictureBookView *)self idealSinglePageSize];
    double v22 = v25 + v25;
    [(BKPictureBookView *)self idealSinglePageSize];
    double v21 = v26;
    double v23 = 0.0;
    double v24 = 0.0;
  }
  v43.origin.double x = x;
  v43.origin.double y = y;
  v43.size.double width = width;
  v43.size.double height = height;
  double v27 = v22;
  BOOL v28 = CGRectContainsRect(v43, *(CGRect *)&v24);
  double v29 = height;
  double v30 = width;
  double v31 = y;
  double v32 = x;
  if (v28)
  {
    [(BKPictureBookView *)self bounds];
    CGRectCenterRectInRect();
  }
  CGFloat v37 = v31;
  CGFloat v38 = v30;
  CGFloat v39 = v29;
  CGFloat v40 = v32;
  v44.origin.double x = x;
  v44.origin.double y = y;
  v44.size.double width = width * 0.5;
  v44.size.double height = height;
  CGRect v45 = CGRectIntegral(v44);
  CGFloat v33 = v45.origin.x;
  CGFloat v34 = v45.origin.y;
  CGFloat v35 = v45.size.width;
  CGFloat v36 = v45.size.height;
  v45.origin.double x = x;
  v45.origin.double y = y;
  v45.size.double width = width;
  v45.size.double height = height;
  v46.origin.double x = CGRectGetMidX(v45);
  v46.origin.double y = y;
  v46.size.double width = width * 0.5;
  v46.size.double height = height;
  CGRect v47 = CGRectIntegral(v46);
  a4->origin.double x = v40;
  a4->origin.double y = v37;
  a4->size.double width = v38;
  a4->size.double height = v39;
  a5->origin.double x = v33;
  a5->origin.double y = v34;
  a5->size.double width = v35;
  a5->size.double height = v36;
  *a6 = v47;
}

- (void)layoutSubviews
{
  v18.receiver = self;
  v18.super_class = (Class)BKPictureBookView;
  [(BKPictureBookView *)&v18 layoutSubviews];
  [(BKPictureBookView *)self scale];
  double v4 = v3;
  CGSize size = CGRectZero.size;
  v17.CGPoint origin = CGRectZero.origin;
  v17.CGSize size = size;
  CGPoint origin = v17.origin;
  CGSize v16 = size;
  CGPoint v13 = v17.origin;
  CGSize v14 = size;
  [(BKPictureBookView *)self calculateFramesAtScale:&v17 contentFrame:&origin leftContentFrame:&v13 rightContentFrame:v3];
  -[UIView setFrame:](self->_contentView, "setFrame:", *(_OWORD *)&v17.origin, *(_OWORD *)&v17.size);
  -[UIView setFrame:](self->_leftContentView, "setFrame:", origin, v16);
  -[UIView setFrame:](self->_rightContentView, "setFrame:", v13, v14);
  if ([(BKPictureBookView *)self drawsSpine])
  {
    v6 = [(BKPictureBookView *)self gutter];
    v7 = [v6 image];
    [v7 size];
    double v9 = v8;

    double v10 = v4 * v9;
    CGFloat v11 = CGRectGetMidX(v17) + v10 * -0.5;
    double MinY = CGRectGetMinY(v17);
    [v6 setFrame:v11, MinY, v10, CGRectGetHeight(v17)];
  }
  [(BKPictureBookView *)self _updateShadowPath];
}

- (void)setContentSize:(CGSize)a3
{
  if (self->_contentSize.width != a3.width || self->_contentSize.height != a3.height)
  {
    self->_contentSize = a3;
    [(BKPictureBookView *)self setNeedsLayout];
  }
}

- (CGSize)actualSize
{
  double v3 = objc_opt_class();
  [(BKPictureBookView *)self contentSize];
  double v5 = v4;
  double v7 = v6;
  BOOL v8 = [(BKPictureBookView *)self drawsSpine];

  [v3 actualSizeForContentSize:v8 drawsSpine:v5];
  result.double height = v10;
  result.double width = v9;
  return result;
}

+ (CGSize)actualSizeForContentSize:(CGSize)result drawsSpine:(BOOL)a4
{
  double v4 = result.width + result.width;
  result.double width = v4;
  return result;
}

- (void)setLeftContentView:(id)a3
{
  double v5 = (UIView *)a3;
  p_leftContentView = &self->_leftContentView;
  leftContentView = self->_leftContentView;
  if (leftContentView != v5)
  {
    double v9 = v5;
    BOOL v8 = [(UIView *)leftContentView superview];

    if (!v9 || v8 == self)
    {
      [(UIView *)*p_leftContentView removeFromSuperview];
      objc_storeStrong((id *)&self->_leftContentView, a3);
      if (!v9)
      {
LABEL_7:
        leftContentView = (UIView *)[(BKPictureBookView *)self setNeedsLayout];
        double v5 = v9;
        goto LABEL_8;
      }
    }
    else
    {
      objc_storeStrong((id *)&self->_leftContentView, a3);
    }
    [(UIView *)self->_contentView addSubview:*p_leftContentView];
    goto LABEL_7;
  }
LABEL_8:

  _objc_release_x1(leftContentView, v5);
}

- (void)setRightContentView:(id)a3
{
  double v5 = (UIView *)a3;
  p_rightContentView = &self->_rightContentView;
  rightContentView = self->_rightContentView;
  if (rightContentView != v5)
  {
    double v9 = v5;
    BOOL v8 = [(UIView *)rightContentView superview];

    if (!v9 || v8 == self)
    {
      [(UIView *)*p_rightContentView removeFromSuperview];
      objc_storeStrong((id *)&self->_rightContentView, a3);
      if (!v9)
      {
LABEL_7:
        rightContentView = (UIView *)[(BKPictureBookView *)self setNeedsLayout];
        double v5 = v9;
        goto LABEL_8;
      }
    }
    else
    {
      objc_storeStrong((id *)&self->_rightContentView, a3);
    }
    [(UIView *)self->_contentView addSubview:*p_rightContentView];
    goto LABEL_7;
  }
LABEL_8:

  _objc_release_x1(rightContentView, v5);
}

- (void)_updateShadowPath
{
  if ([(BKPictureBookView *)self drawsShadow])
  {
    [(UIView *)self->_contentView frame];
    +[UIBezierPath bezierPathWithRect:](UIBezierPath, "bezierPathWithRect:");
    id v3 = objc_claimAutoreleasedReturnValue();
    id v4 = [v3 CGPath];
    double v5 = [(BKPictureBookView *)self layer];
    [v5 setShadowPath:v4];

    [(BKPictureBookView *)self scale];
    double v7 = v6 * 2.8;
    BOOL v8 = [(BKPictureBookView *)self layer];
    [v8 setShadowOffset:0.0, v7];

    double v9 = [(BKPictureBookView *)self layer];
    LODWORD(v10) = 1051931443;
    [v9 setShadowOpacity:v10];

    [(BKPictureBookView *)self scale];
    double v12 = v11 * 8.5;
    CGPoint v13 = [(BKPictureBookView *)self layer];
    id v22 = v13;
    double v14 = v12;
  }
  else
  {
    v15 = [(BKPictureBookView *)self layer];
    [v15 shadowOpacity];
    float v17 = v16;

    if (v17 <= 0.0) {
      return;
    }
    objc_super v18 = [(BKPictureBookView *)self layer];
    [v18 setShadowPath:0];

    double height = CGSizeZero.height;
    BOOL v20 = [(BKPictureBookView *)self layer];
    [v20 setShadowOffset:CGSizeZero.width, height];

    double v21 = [(BKPictureBookView *)self layer];
    [v21 setShadowOpacity:0.0];

    CGPoint v13 = [(BKPictureBookView *)self layer];
    double v14 = 0.0;
    id v22 = v13;
  }
  [v13 setShadowRadius:v14];
}

- (void)setDrawsSpine:(BOOL)a3
{
  if (self->_drawsSpine != a3)
  {
    self->_drawsSpine = a3;
    if (a3)
    {
      uint64_t v5 = [(BKPictureBookView *)self gutter];
      [(BKPictureBookView *)self addSubview:v5];
      gutter = (UIImageView *)v5;
    }
    else
    {
      [(UIImageView *)self->_gutter removeFromSuperview];
      gutter = self->_gutter;
      self->_gutter = 0;
    }
  }
}

- (id)gutter
{
  gutter = self->_gutter;
  if (!gutter)
  {
    id v4 = objc_alloc((Class)UIImageView);
    uint64_t v5 = +[UIImage imageNamed:@"PictureBookSpine"];
    double v6 = (UIImageView *)[v4 initWithImage:v5];
    double v7 = self->_gutter;
    self->_gutter = v6;

    gutter = self->_gutter;
  }

  return gutter;
}

- (CGSize)contentSize
{
  double width = self->_contentSize.width;
  double height = self->_contentSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (double)scale
{
  return self->_scale;
}

- (void)setScale:(double)a3
{
  self->_scale = a3;
}

- (CGSize)idealSinglePageSize
{
  double width = self->_idealSinglePageSize.width;
  double height = self->_idealSinglePageSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setIdealSinglePageSize:(CGSize)a3
{
  self->_idealSinglePageSize = a3;
}

- (UIView)contentView
{
  return self->_contentView;
}

- (UIView)leftContentView
{
  return self->_leftContentView;
}

- (UIView)rightContentView
{
  return self->_rightContentView;
}

- (BOOL)drawsShadow
{
  return self->_drawsShadow;
}

- (void)setDrawsShadow:(BOOL)a3
{
  self->_drawsShadow = a3;
}

- (BOOL)drawsSpine
{
  return self->_drawsSpine;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_gutter, 0);
  objc_storeStrong((id *)&self->_rightContentView, 0);
  objc_storeStrong((id *)&self->_leftContentView, 0);

  objc_storeStrong((id *)&self->_contentView, 0);
}

@end