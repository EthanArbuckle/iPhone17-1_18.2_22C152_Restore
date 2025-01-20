@interface BKThumbnailScrubberCell
+ (id)emptyBackgroundColor;
- (BKThumbnailScrubberCell)initWithFrame:(CGRect)a3;
- (UIColor)strokeColor;
- (UIImage)image;
- (id)imageView;
- (void)layoutSubviews;
- (void)setImage:(id)a3;
- (void)setStrokeColor:(id)a3;
@end

@implementation BKThumbnailScrubberCell

- (BKThumbnailScrubberCell)initWithFrame:(CGRect)a3
{
  v24.receiver = self;
  v24.super_class = (Class)BKThumbnailScrubberCell;
  v3 = -[BKThumbnailScrubberCell initWithFrame:](&v24, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    [(BKThumbnailScrubberCell *)v3 setOpaque:0];
    id v5 = objc_alloc((Class)UIImageView);
    double y = CGRectZero.origin.y;
    double width = CGRectZero.size.width;
    double height = CGRectZero.size.height;
    v9 = [v5 initWithFrame:CGRectZero.origin.x, y, width, height];
    imageView = v4->_imageView;
    v4->_imageView = v9;

    v11 = v4->_imageView;
    v12 = [(id)objc_opt_class() emptyBackgroundColor];
    [(UIImageView *)v11 setBackgroundColor:v12];

    [(BKThumbnailScrubberCell *)v4 insertSubview:v4->_imageView atIndex:0];
    uint64_t v13 = objc_opt_new();
    borderLayer = v4->_borderLayer;
    v4->_borderLayer = (CALayer *)v13;

    v15 = v4->_borderLayer;
    v16 = +[UIScreen mainScreen];
    [v16 scale];
    [(CALayer *)v15 setBorderWidth:1.0 / v17];

    [(CALayer *)v4->_borderLayer setBorderColor:[(UIColor *)v4->_strokeColor CGColor]];
    -[CALayer setFrame:](v4->_borderLayer, "setFrame:", CGRectZero.origin.x, y, width, height);
    v18 = v4->_borderLayer;
    v19 = +[NSNull null];
    v20 = +[NSNull null];
    v21 = +[NSDictionary dictionaryWithObjectsAndKeys:v19, @"bounds", v20, @"position", 0];
    [(CALayer *)v18 setActions:v21];

    v22 = [(BKThumbnailScrubberCell *)v4 layer];
    [v22 addSublayer:v4->_borderLayer];
  }
  return v4;
}

- (void)layoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)BKThumbnailScrubberCell;
  [(BKThumbnailScrubberCell *)&v4 layoutSubviews];
  borderLayer = self->_borderLayer;
  [(BKThumbnailScrubberCell *)self bounds];
  -[CALayer setFrame:](borderLayer, "setFrame:");
  [(BKThumbnailScrubberCell *)self bounds];
  -[UIImageView setFrame:](self->_imageView, "setFrame:");
}

- (void)setStrokeColor:(id)a3
{
  id v5 = (UIColor *)a3;
  if (self->_strokeColor != v5)
  {
    objc_storeStrong((id *)&self->_strokeColor, a3);
    [(CALayer *)self->_borderLayer setBorderColor:[(UIColor *)v5 CGColor]];
  }
}

+ (id)emptyBackgroundColor
{
  v2 = (void *)qword_22B628;
  if (!qword_22B628)
  {
    id v3 = [objc_alloc((Class)UIColor) initWithWhite:1.0 alpha:0.5];
    objc_super v4 = (void *)qword_22B628;
    qword_22B628 = (uint64_t)v3;

    v2 = (void *)qword_22B628;
  }

  return v2;
}

- (id)imageView
{
  imageView = self->_imageView;
  if (!imageView)
  {
    objc_super v4 = (UIImageView *)[objc_alloc((Class)UIImageView) initWithFrame:CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height];
    id v5 = self->_imageView;
    self->_imageView = v4;

    v6 = self->_imageView;
    v7 = [(id)objc_opt_class() emptyBackgroundColor];
    [(UIImageView *)v6 setBackgroundColor:v7];

    [(BKThumbnailScrubberCell *)self insertSubview:self->_imageView atIndex:0];
    imageView = self->_imageView;
  }

  return imageView;
}

- (void)setImage:(id)a3
{
  id v4 = a3;
  id v5 = [(BKThumbnailScrubberCell *)self imageView];
  [v5 setImage:v4];

  [(BKThumbnailScrubberCell *)self setNeedsLayout];
}

- (UIImage)image
{
  return [(UIImageView *)self->_imageView image];
}

- (UIColor)strokeColor
{
  return self->_strokeColor;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_borderLayer, 0);
  objc_storeStrong((id *)&self->_strokeColor, 0);

  objc_storeStrong((id *)&self->_imageView, 0);
}

@end