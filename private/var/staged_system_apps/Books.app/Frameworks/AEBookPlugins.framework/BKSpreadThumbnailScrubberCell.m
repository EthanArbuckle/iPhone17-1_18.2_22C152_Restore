@interface BKSpreadThumbnailScrubberCell
- (BKSpreadThumbnailScrubberCell)initWithFrame:(CGRect)a3;
- (BOOL)shouldHaveLeftImage;
- (BOOL)shouldHaveRightImage;
- (UIImage)leftImage;
- (UIImage)rightImage;
- (void)layoutSubviews;
- (void)setLeftImage:(id)a3;
- (void)setRightImage:(id)a3;
- (void)setShouldHaveLeftImage:(BOOL)a3;
- (void)setShouldHaveRightImage:(BOOL)a3;
@end

@implementation BKSpreadThumbnailScrubberCell

- (BKSpreadThumbnailScrubberCell)initWithFrame:(CGRect)a3
{
  v18.receiver = self;
  v18.super_class = (Class)BKSpreadThumbnailScrubberCell;
  v3 = -[BKThumbnailScrubberCell initWithFrame:](&v18, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    id v4 = objc_alloc((Class)UIImageView);
    double y = CGRectZero.origin.y;
    double width = CGRectZero.size.width;
    double height = CGRectZero.size.height;
    v8 = [v4 initWithFrame:CGRectMake(0, 0, width, height)];
    rightImageView = v3->_rightImageView;
    v3->_rightImageView = v8;

    v10 = v3->_rightImageView;
    v11 = [(id)objc_opt_class() emptyBackgroundColor];
    [(UIImageView *)v10 setBackgroundColor:v11];

    [(BKSpreadThumbnailScrubberCell *)v3 addSubview:v3->_rightImageView];
    v12 = [objc_alloc((Class)UIImageView) initWithFrame:CGRectZero.origin.x, y, width, height];
    leftImageView = v3->_leftImageView;
    v3->_leftImageView = v12;

    v14 = v3->_leftImageView;
    v15 = [(id)objc_opt_class() emptyBackgroundColor];
    [(UIImageView *)v14 setBackgroundColor:v15];

    [(BKSpreadThumbnailScrubberCell *)v3 addSubview:v3->_leftImageView];
    [(UIImageView *)v3->super._imageView removeFromSuperview];
    imageView = v3->super._imageView;
    v3->super._imageView = 0;
  }
  return v3;
}

- (void)layoutSubviews
{
  v16.receiver = self;
  v16.super_class = (Class)BKSpreadThumbnailScrubberCell;
  [(BKThumbnailScrubberCell *)&v16 layoutSubviews];
  [(BKSpreadThumbnailScrubberCell *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v11 = v7 * 0.5;
  if (![(BKSpreadThumbnailScrubberCell *)self shouldHaveLeftImage]
    || ![(BKSpreadThumbnailScrubberCell *)self shouldHaveRightImage])
  {
    if ([(BKSpreadThumbnailScrubberCell *)self shouldHaveLeftImage])
    {
      -[UIImageView setFrame:](self->_leftImageView, "setFrame:", v4, v6, v11, v10);
      [(UIImageView *)self->_rightImageView setBackgroundColor:0];
    }
    else
    {
      if (![(BKSpreadThumbnailScrubberCell *)self shouldHaveRightImage]) {
        goto LABEL_9;
      }
      -[UIImageView setFrame:](self->_rightImageView, "setFrame:", v11, v6, v11, v10);
      [(UIImageView *)self->_leftImageView setBackgroundColor:0];
      double v4 = v11;
    }
    double v8 = v11;
    goto LABEL_9;
  }
  -[UIImageView setFrame:](self->_leftImageView, "setFrame:", v4, v6, v11, v10);
  -[UIImageView setFrame:](self->_rightImageView, "setFrame:", v11, v6, v11, v10);
  leftImageView = self->_leftImageView;
  v13 = [(id)objc_opt_class() emptyBackgroundColor];
  [(UIImageView *)leftImageView setBackgroundColor:v13];

  rightImageView = self->_rightImageView;
  v15 = [(id)objc_opt_class() emptyBackgroundColor];
  [(UIImageView *)rightImageView setBackgroundColor:v15];

LABEL_9:
  -[CALayer setFrame:](self->super._borderLayer, "setFrame:", v4, v6, v8, v10);
}

- (UIImage)leftImage
{
  return [(UIImageView *)self->_leftImageView image];
}

- (UIImage)rightImage
{
  return [(UIImageView *)self->_rightImageView image];
}

- (void)setLeftImage:(id)a3
{
}

- (void)setRightImage:(id)a3
{
}

- (void)setShouldHaveLeftImage:(BOOL)a3
{
  if (self->_shouldHaveLeftImage != a3)
  {
    self->_shouldHaveLeftImage = a3;
    [(BKSpreadThumbnailScrubberCell *)self setNeedsLayout];
  }
}

- (void)setShouldHaveRightImage:(BOOL)a3
{
  if (self->_shouldHaveRightImage != a3)
  {
    self->_shouldHaveRightImage = a3;
    [(BKSpreadThumbnailScrubberCell *)self setNeedsLayout];
  }
}

- (BOOL)shouldHaveLeftImage
{
  return self->_shouldHaveLeftImage;
}

- (BOOL)shouldHaveRightImage
{
  return self->_shouldHaveRightImage;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rightImageView, 0);
  objc_storeStrong((id *)&self->_leftImageView, 0);
  objc_storeStrong((id *)&self->_rightImage, 0);

  objc_storeStrong((id *)&self->_leftImage, 0);
}

@end