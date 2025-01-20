@interface SYNMediaWallCollectionViewCell2
- (BOOL)hasImage;
- (BOOL)isFiltered;
- (CGRect)_contentsRectForRegionOfInterestContainerBounds:(CGRect)a3;
- (CGRect)imageContentsRect;
- (MCAssetVideo)mediaItem;
- (MZMediaManagement)assetManagementDelegate;
- (SYNMediaWallCollectionViewCell2)initWithFrame:(CGRect)a3;
- (UIColor)borderColor;
- (UIColor)selectedBorderColor;
- (id)image;
- (id)snapshot;
- (void)animatePop;
- (void)blinkSelection;
- (void)dealloc;
- (void)prepareForReuse;
- (void)setAntialiasing:(BOOL)a3;
- (void)setAssetManagementDelegate:(id)a3;
- (void)setBadge:(id)a3;
- (void)setBorderColor:(id)a3;
- (void)setBounds:(CGRect)a3;
- (void)setFrame:(CGRect)a3;
- (void)setHighlighted:(BOOL)a3;
- (void)setImage:(id)a3 animated:(BOOL)a4;
- (void)setIsFiltered:(BOOL)a3;
- (void)setMediaItem:(id)a3;
- (void)setSelected:(BOOL)a3;
- (void)setSelectedBorderColor:(id)a3;
- (void)setUseShadow:(BOOL)a3;
- (void)updateImageContentsRect;
- (void)updateShadowPath;
- (void)updateVideoFooter;
@end

@implementation SYNMediaWallCollectionViewCell2

- (SYNMediaWallCollectionViewCell2)initWithFrame:(CGRect)a3
{
  double width = a3.size.width;
  v22.receiver = self;
  v22.super_class = (Class)SYNMediaWallCollectionViewCell2;
  v4 = -[SYNMediaWallCollectionViewCell2 initWithFrame:](&v22, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v5 = v4;
  if (v4)
  {
    v4->_mediaItem = 0;
    v4->_mediaWallViewController = 0;
    v4->_videoLabelView = 0;
    v4->_isFiltered = 0;
    v6 = [SYNMediaWallCollectionViewCellMainView2 alloc];
    objc_msgSend(-[SYNMediaWallCollectionViewCell2 contentView](v5, "contentView"), "bounds");
    v7 = -[SYNMediaWallCollectionViewCellMainView2 initWithFrame:](v6, "initWithFrame:");
    v5->_mainView = v7;
    [(SYNMediaWallCollectionViewCellMainView2 *)v7 setAutoresizingMask:18];
    [(SYNMediaWallCollectionViewCellMainView2 *)v5->_mainView setBackgroundColor:+[UIColor colorWithWhite:0.200000003 alpha:1.0]];
    [(SYNMediaWallCollectionViewCellMainView2 *)v5->_mainView setOpaque:1];
    objc_msgSend(-[SYNMediaWallCollectionViewCellMainView2 layer](v5->_mainView, "layer"), "setEdgeAntialiasingMask:", 0);
    objc_msgSend(-[SYNMediaWallCollectionViewCellMainView2 layer](v5->_mainView, "layer"), "setShadowColor:", -[UIColor CGColor](+[UIColor colorWithRed:green:blue:alpha:](UIColor, "colorWithRed:green:blue:alpha:", 0.0, 0.0, 0.0, 1.0), "CGColor"));
    objc_msgSend(-[SYNMediaWallCollectionViewCellMainView2 layer](v5->_mainView, "layer"), "setShadowOffset:", 0.0, 0.0);
    UIUserInterfaceIdiom v8 = [+[UIDevice currentDevice] userInterfaceIdiom];
    id v9 = [(SYNMediaWallCollectionViewCellMainView2 *)v5->_mainView layer];
    double v10 = 2.0;
    if (v8 == UIUserInterfaceIdiomPhone) {
      double v10 = 1.0;
    }
    [v9 setShadowRadius:v10];
    id v11 = [(SYNMediaWallCollectionViewCellMainView2 *)v5->_mainView layer];
    LODWORD(v12) = 1.0;
    [v11 setShadowOpacity:v12];
    [(SYNMediaWallCollectionViewCell2 *)v5 bounds];
    objc_msgSend(-[SYNMediaWallCollectionViewCellMainView2 layer](v5->_mainView, "layer"), "setShadowPath:", -[UIBezierPath CGPath](+[UIBezierPath bezierPathWithRect:](UIBezierPath, "bezierPathWithRect:"), "CGPath"));
    objc_msgSend(-[SYNMediaWallCollectionViewCellMainView2 layer](v5->_mainView, "layer"), "setBorderColor:", 0);
    objc_msgSend(-[SYNMediaWallCollectionViewCellMainView2 layer](v5->_mainView, "layer"), "setBorderWidth:", 0.0);
    id v13 = objc_alloc((Class)UIImageView);
    [(SYNMediaWallCollectionViewCellMainView2 *)v5->_mainView bounds];
    v14 = (UIImageView *)objc_msgSend(v13, "initWithFrame:");
    v5->_imageView = v14;
    [(UIImageView *)v14 setAutoresizingMask:18];
    [(UIImageView *)v5->_imageView setClipsToBounds:1];
    [(UIImageView *)v5->_imageView setContentMode:2];
    [(UIImageView *)v5->_imageView setOpaque:1];
    objc_msgSend(-[UIImageView layer](v5->_imageView, "layer"), "setEdgeAntialiasingMask:", 0);
    if ([+[UIDevice currentDevice] userInterfaceIdiom])
    {
      double v15 = 18.0;
    }
    else
    {
      double v15 = 12.0;
    }
    v16 = (UIImageView *)objc_msgSend(objc_alloc((Class)UIImageView), "initWithFrame:", 4.0, 4.0, v15, v15);
    v5->_badgeView = v16;
    [(UIImageView *)v16 setAutoresizingMask:36];
    [(UIImageView *)v5->_badgeView setClipsToBounds:1];
    [(UIImageView *)v5->_badgeView setContentMode:0];
    [(UIImageView *)v5->_badgeView setOpaque:0];
    [(UIImageView *)v5->_badgeView setAlpha:0.5];
    objc_msgSend(-[UIImageView layer](v5->_badgeView, "layer"), "setEdgeAntialiasingMask:", 0);
    [(UIImageView *)v5->_badgeView setHidden:1];
    objc_msgSend(-[SYNMediaWallCollectionViewCell2 contentView](v5, "contentView"), "addSubview:", v5->_mainView);
    [(SYNMediaWallCollectionViewCellMainView2 *)v5->_mainView addSubview:v5->_imageView];
    [(SYNMediaWallCollectionViewCellMainView2 *)v5->_mainView addSubview:v5->_badgeView];
    UIUserInterfaceIdiom v17 = [+[UIDevice currentDevice] userInterfaceIdiom];
    if (v17) {
      double v18 = 22.0;
    }
    else {
      double v18 = 15.0;
    }
    if (v17) {
      double v19 = 23.0;
    }
    else {
      double v19 = 16.0;
    }
    v20 = (UIImageView *)objc_msgSend(objc_alloc((Class)UIImageView), "initWithFrame:", round(width - v19 + -2.0), 2.0, v19, v18);
    v5->_commentsView = v20;
    [(UIImageView *)v20 setAutoresizingMask:33];
    [(UIImageView *)v5->_commentsView setClipsToBounds:1];
    [(UIImageView *)v5->_commentsView setContentMode:0];
    [(UIImageView *)v5->_commentsView setOpaque:0];
    objc_msgSend(-[UIImageView layer](v5->_commentsView, "layer"), "setEdgeAntialiasingMask:", 0);
    [(UIImageView *)v5->_commentsView setHidden:1];
    objc_msgSend(-[SYNMediaWallCollectionViewCell2 contentView](v5, "contentView"), "addSubview:", v5->_commentsView);
    v5->_borderColor = 0;
  }
  return v5;
}

- (void)dealloc
{
  objc_storeWeak((id *)&self->_mediaWallViewController, 0);

  v3.receiver = self;
  v3.super_class = (Class)SYNMediaWallCollectionViewCell2;
  [(SYNMediaWallCollectionViewCell2 *)&v3 dealloc];
}

- (void)setBounds:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  [(SYNMediaWallCollectionViewCell2 *)self frame];
  double v9 = v8;
  double v11 = v10;
  v13.receiver = self;
  v13.super_class = (Class)SYNMediaWallCollectionViewCell2;
  -[SYNMediaWallCollectionViewCell2 setBounds:](&v13, "setBounds:", x, y, width, height);
  if (v9 != width || v11 != height) {
    [(SYNMediaWallCollectionViewCell2 *)self updateShadowPath];
  }
}

- (void)setFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  [(SYNMediaWallCollectionViewCell2 *)self frame];
  double v9 = v8;
  double v11 = v10;
  v13.receiver = self;
  v13.super_class = (Class)SYNMediaWallCollectionViewCell2;
  -[SYNMediaWallCollectionViewCell2 setFrame:](&v13, "setFrame:", x, y, width, height);
  if (v9 != width || v11 != height) {
    [(SYNMediaWallCollectionViewCell2 *)self updateShadowPath];
  }
}

- (void)updateShadowPath
{
  [(SYNMediaWallCollectionViewCell2 *)self bounds];
  objc_super v3 = [+[UIBezierPath bezierPathWithRect:](UIBezierPath, "bezierPathWithRect:") CGPath];
  id v4 = [(SYNMediaWallCollectionViewCellMainView2 *)self->_mainView layer];
  [v4 setShadowPath:v3];
}

- (void)setBorderColor:(id)a3
{
  if (([(SYNMediaWallCollectionViewCell2 *)self isSelected] & 1) == 0)
  {
    id v5 = [(SYNMediaWallCollectionViewCellMainView2 *)self->_mainView layer];
    if (a3)
    {
      [v5 setBorderWidth:1.0];
      id v6 = [a3 CGColor];
    }
    else
    {
      [v5 setBorderWidth:0.0];
      id v6 = 0;
    }
    objc_msgSend(-[SYNMediaWallCollectionViewCellMainView2 layer](self->_mainView, "layer"), "setBorderColor:", v6);
  }
  self->_borderColor = (UIColor *)a3;
}

- (void)setSelectedBorderColor:(id)a3
{
  if ([(SYNMediaWallCollectionViewCell2 *)self isSelected])
  {
    id v5 = [(SYNMediaWallCollectionViewCellMainView2 *)self->_mainView layer];
    if (a3)
    {
      [v5 setBorderWidth:1.0];
      objc_msgSend(-[SYNMediaWallCollectionViewCellMainView2 layer](self->_mainView, "layer"), "setBorderColor:", objc_msgSend(a3, "CGColor"));
      id v6 = (UIColor *)a3;
    }
    else
    {
      [v5 setBorderWidth:0.0];
      objc_msgSend(-[SYNMediaWallCollectionViewCellMainView2 layer](self->_mainView, "layer"), "setBorderColor:", 0);
      id v6 = +[UIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:1.0];
    }
    objc_msgSend(-[SYNMediaWallCollectionViewCellMainView2 layer](self->_mainView, "layer"), "setShadowColor:", -[UIColor CGColor](v6, "CGColor"));
  }
  self->_selectedBorderColor = (UIColor *)a3;
}

- (void)setAssetManagementDelegate:(id)a3
{
}

- (MZMediaManagement)assetManagementDelegate
{
  return (MZMediaManagement *)objc_loadWeak((id *)&self->_assetManagementDelegate);
}

- (void)prepareForReuse
{
  v4.receiver = self;
  v4.super_class = (Class)SYNMediaWallCollectionViewCell2;
  [(SYNMediaWallCollectionViewCell2 *)&v4 prepareForReuse];
  [(SYNMediaWallCollectionViewCell2 *)self setMediaItem:0];
  [(SYNMediaWallCollectionViewCell2 *)self setIsFiltered:0];
  [(SYNMediaWallCollectionViewCell2 *)self setImage:0 animated:0];
  [(SYNMediaWallCollectionViewCell2 *)self setBadge:0];
  [(UIImageView *)self->_commentsView setHidden:1];
  videoLabelView = self->_videoLabelView;
  if (videoLabelView)
  {
    [(UIView *)videoLabelView removeFromSuperview];

    self->_videoLabelView = 0;
  }
}

- (void)setAntialiasing:(BOOL)a3
{
  if (a3) {
    uint64_t v4 = 15;
  }
  else {
    uint64_t v4 = 0;
  }
  objc_msgSend(-[SYNMediaWallCollectionViewCellMainView2 layer](self->_mainView, "layer"), "setEdgeAntialiasingMask:", v4);
  id v5 = [(UIImageView *)self->_imageView layer];
  [v5 setEdgeAntialiasingMask:v4];
}

- (void)setUseShadow:(BOOL)a3
{
  if (a3) {
    float v3 = 1.0;
  }
  else {
    float v3 = 0.0;
  }
  id v4 = [(SYNMediaWallCollectionViewCellMainView2 *)self->_mainView layer];
  *(float *)&double v5 = v3;
  [v4 setShadowOpacity:v5];
}

- (void)setImage:(id)a3 animated:(BOOL)a4
{
  if (a3)
  {
    if (a4)
    {
      id v6 = +[CABasicAnimation animationWithKeyPath:@"opacity"];
      [(CABasicAnimation *)v6 setDuration:0.150000006];
      [(CABasicAnimation *)v6 setFromValue:+[NSNumber numberWithFloat:0.0]];
      LODWORD(v7) = 1.0;
      [(CABasicAnimation *)v6 setToValue:+[NSNumber numberWithFloat:v7]];
      [(CABasicAnimation *)v6 setRemovedOnCompletion:1];
      objc_msgSend(-[UIImageView layer](self->_imageView, "layer"), "addAnimation:forKey:", v6, @"opacity");
      id v8 = [(UIImageView *)self->_imageView layer];
      LODWORD(v9) = 1.0;
      [v8 setOpacity:v9];
    }
    [(UIImageView *)self->_imageView setImage:a3];
    [(SYNMediaWallCollectionViewCellMainView2 *)self->_mainView setBackgroundColor:+[UIColor clearColor]];
  }
  else
  {
    [(SYNMediaWallCollectionViewCellMainView2 *)self->_mainView setBackgroundColor:+[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", 0, a4, 0.200000003, 1.0)];
    objc_msgSend(-[UIImageView layer](self->_imageView, "layer"), "removeAllAnimations");
    [(UIImageView *)self->_imageView setImage:0];
  }
  [(SYNMediaWallCollectionViewCell2 *)self updateImageContentsRect];
}

- (void)setBadge:(id)a3
{
  -[UIImageView setImage:](self->_badgeView, "setImage:");
  badgeView = self->_badgeView;
  [(UIImageView *)badgeView setHidden:a3 == 0];
}

- (BOOL)hasImage
{
  return [(UIImageView *)self->_imageView image] != 0;
}

- (id)image
{
  return [(UIImageView *)self->_imageView image];
}

- (void)setIsFiltered:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(SYNMediaWallCollectionViewCell2 *)self contentView];
  double v6 = 0.200000003;
  if (!v3) {
    double v6 = 1.0;
  }
  [v5 setAlpha:v6];
  self->_isFiltered = v3;
}

- (BOOL)isFiltered
{
  return self->_isFiltered;
}

- (void)blinkSelection
{
  if ([(SYNMediaWallCollectionViewCell2 *)self isSelected])
  {
    if ([(SYNMediaWallCollectionViewCell2 *)self borderColor])
    {
      objc_msgSend(-[SYNMediaWallCollectionViewCellMainView2 layer](self->_mainView, "layer"), "setBorderColor:", -[UIColor CGColor](-[SYNMediaWallCollectionViewCell2 borderColor](self, "borderColor"), "CGColor"));
      objc_msgSend(-[SYNMediaWallCollectionViewCellMainView2 layer](self->_mainView, "layer"), "setBorderWidth:", 1.0);
    }
    else
    {
      objc_msgSend(-[SYNMediaWallCollectionViewCellMainView2 layer](self->_mainView, "layer"), "setBorderWidth:", 0.0);
      objc_msgSend(-[SYNMediaWallCollectionViewCellMainView2 layer](self->_mainView, "layer"), "setShadowColor:", -[UIColor CGColor](+[UIColor colorWithRed:green:blue:alpha:](UIColor, "colorWithRed:green:blue:alpha:", 0.0, 0.0, 0.0, 1.0), "CGColor"));
    }
    [+[NSRunLoop mainRunLoop](NSRunLoop, "mainRunLoop") runUntilDate:+[NSDate dateWithTimeIntervalSinceNow:0.100000001]];
    selectedBorderColor = self->_selectedBorderColor;
    p_mainView = &self->_mainView;
    id v8 = [(SYNMediaWallCollectionViewCellMainView2 *)self->_mainView layer];
    if (selectedBorderColor)
    {
      [v8 setBorderWidth:2.0];
      objc_msgSend(-[SYNMediaWallCollectionViewCellMainView2 layer](*p_mainView, "layer"), "setBorderColor:", -[UIColor CGColor](self->_selectedBorderColor, "CGColor"));
      double v9 = self->_selectedBorderColor;
    }
    else
    {
      [v8 setBorderWidth:0.0];
      objc_msgSend(-[SYNMediaWallCollectionViewCellMainView2 layer](*p_mainView, "layer"), "setBorderColor:", 0);
      double v9 = +[UIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:1.0];
    }
    double v10 = [(UIColor *)v9 CGColor];
  }
  else
  {
    BOOL v3 = self->_selectedBorderColor;
    id v4 = [(SYNMediaWallCollectionViewCellMainView2 *)self->_mainView layer];
    if (v3)
    {
      [v4 setBorderWidth:2.0];
      objc_msgSend(-[SYNMediaWallCollectionViewCellMainView2 layer](self->_mainView, "layer"), "setBorderColor:", -[UIColor CGColor](self->_selectedBorderColor, "CGColor"));
      id v5 = self->_selectedBorderColor;
    }
    else
    {
      [v4 setBorderWidth:0.0];
      objc_msgSend(-[SYNMediaWallCollectionViewCellMainView2 layer](self->_mainView, "layer"), "setBorderColor:", 0);
      id v5 = +[UIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:1.0];
    }
    objc_msgSend(-[SYNMediaWallCollectionViewCellMainView2 layer](self->_mainView, "layer"), "setShadowColor:", -[UIColor CGColor](v5, "CGColor"));
    [+[NSRunLoop mainRunLoop](NSRunLoop, "mainRunLoop") runUntilDate:+[NSDate dateWithTimeIntervalSinceNow:0.100000001]];
    if ([(SYNMediaWallCollectionViewCell2 *)self borderColor])
    {
      objc_msgSend(-[SYNMediaWallCollectionViewCellMainView2 layer](self->_mainView, "layer"), "setBorderColor:", -[UIColor CGColor](-[SYNMediaWallCollectionViewCell2 borderColor](self, "borderColor"), "CGColor"));
      objc_msgSend(-[SYNMediaWallCollectionViewCellMainView2 layer](self->_mainView, "layer"), "setBorderWidth:", 1.0);
    }
    else
    {
      objc_msgSend(-[SYNMediaWallCollectionViewCellMainView2 layer](self->_mainView, "layer"), "setBorderWidth:", 0.0);
      objc_msgSend(-[SYNMediaWallCollectionViewCellMainView2 layer](self->_mainView, "layer"), "setBorderColor:", 0);
    }
    double v10 = [+[UIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:1.0] CGColor];
    p_mainView = &self->_mainView;
  }
  objc_msgSend(-[SYNMediaWallCollectionViewCellMainView2 layer](*p_mainView, "layer"), "setShadowColor:", v10);
  double v11 = +[NSRunLoop mainRunLoop];
  double v12 = +[NSDate dateWithTimeIntervalSinceNow:0.100000001];
  [(NSRunLoop *)v11 runUntilDate:v12];
}

- (void)animatePop
{
  BOOL v3 = +[CABasicAnimation animationWithKeyPath:@"transform"];
  memset(&v9, 0, sizeof(v9));
  id v4 = objc_msgSend(-[SYNMediaWallCollectionViewCell2 contentView](self, "contentView"), "layer");
  if (v4) {
    [v4 transform];
  }
  else {
    memset(&v8, 0, sizeof(v8));
  }
  CATransform3DGetAffineTransform(&v9, &v8);
  CGAffineTransform m = v9;
  memset(&v7, 0, sizeof(v7));
  CGAffineTransformScale(&v7, &m, 0.970000029, 0.970000029);
  [(CABasicAnimation *)v3 setDuration:0.100000001];
  CGAffineTransform m = v7;
  CATransform3DMakeAffineTransform(&v5, &m);
  [(CABasicAnimation *)v3 setToValue:+[NSValue valueWithCATransform3D:&v5]];
  [(CABasicAnimation *)v3 setRemovedOnCompletion:1];
  [(CABasicAnimation *)v3 setAutoreverses:1];
  objc_msgSend(objc_msgSend(-[SYNMediaWallCollectionViewCell2 contentView](self, "contentView"), "layer"), "addAnimation:forKey:", v3, @"transform");
}

- (void)setSelected:(BOOL)a3
{
  BOOL v3 = a3;
  CATransform3D v5 = [(SYNMediaWallCollectionViewCell2 *)self borderColor];
  double v6 = v5;
  if (!v3)
  {
    if (v5)
    {
      objc_msgSend(-[SYNMediaWallCollectionViewCellMainView2 layer](self->_mainView, "layer"), "setBorderColor:", -[UIColor CGColor](-[SYNMediaWallCollectionViewCell2 borderColor](self, "borderColor"), "CGColor"));
      double v10 = 1.0;
    }
    else
    {
      double v10 = 0.0;
    }
    p_mainView = &self->_mainView;
    objc_msgSend(-[SYNMediaWallCollectionViewCellMainView2 layer](self->_mainView, "layer"), "setBorderWidth:", v10);
    goto LABEL_9;
  }
  p_mainView = &self->_mainView;
  id v8 = [(SYNMediaWallCollectionViewCellMainView2 *)self->_mainView layer];
  if (!v6)
  {
    [v8 setBorderWidth:0.0];
    objc_msgSend(-[SYNMediaWallCollectionViewCellMainView2 layer](*p_mainView, "layer"), "setBorderColor:", 0);
LABEL_9:
    selectedBorderColor = +[UIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:1.0];
    goto LABEL_10;
  }
  [v8 setBorderWidth:2.0];
  objc_msgSend(-[SYNMediaWallCollectionViewCellMainView2 layer](*p_mainView, "layer"), "setBorderColor:", -[UIColor CGColor](self->_selectedBorderColor, "CGColor"));
  selectedBorderColor = self->_selectedBorderColor;
LABEL_10:
  objc_msgSend(-[SYNMediaWallCollectionViewCellMainView2 layer](*p_mainView, "layer"), "setShadowColor:", -[UIColor CGColor](selectedBorderColor, "CGColor"));
  v11.receiver = self;
  v11.super_class = (Class)SYNMediaWallCollectionViewCell2;
  [(SYNMediaWallCollectionViewCell2 *)&v11 setSelected:v3];
}

- (void)setHighlighted:(BOOL)a3
{
  BOOL v3 = a3;
  if (!a3) {
    objc_msgSend(-[SYNMediaWallCollectionViewCellMainView2 layer](self->_mainView, "layer"), "setFilters:", 0);
  }
  v5.receiver = self;
  v5.super_class = (Class)SYNMediaWallCollectionViewCell2;
  [(SYNMediaWallCollectionViewCell2 *)&v5 setHighlighted:v3];
}

- (CGRect)_contentsRectForRegionOfInterestContainerBounds:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v8 = [(UIImageView *)self->_imageView image];
  double v9 = 0.0;
  double v10 = 1.0;
  if (!v8) {
    goto LABEL_3;
  }
  objc_super v11 = v8;
  v76.origin.double x = CGRectZero.origin.x;
  v76.origin.double y = CGRectZero.origin.y;
  v76.size.double width = CGRectZero.size.width;
  v76.size.double height = CGRectZero.size.height;
  v65.origin.double x = x;
  v65.origin.double y = y;
  v65.size.double width = width;
  v65.size.double height = height;
  if (CGRectEqualToRect(v65, v76))
  {
LABEL_3:
    double v12 = 1.0;
LABEL_4:
    double v13 = 0.0;
    goto LABEL_27;
  }
  [(UIImage *)v11 size];
  double v15 = v14;
  [(UIImage *)v11 size];
  double v17 = v15 / v16;
  [(SYNMediaWallCollectionViewCell2 *)self bounds];
  double v19 = v18;
  [(SYNMediaWallCollectionViewCell2 *)self bounds];
  double v21 = v19 / v20;
  [(SYNMediaWallCollectionViewCell2 *)self bounds];
  if (v17 >= v21)
  {
    double v24 = v17 * v23;
    [(SYNMediaWallCollectionViewCell2 *)self bounds];
    double v26 = v32;
    [(SYNMediaWallCollectionViewCell2 *)self bounds];
    double v34 = v33;
    [(SYNMediaWallCollectionViewCell2 *)self bounds];
    double v31 = -(v35 - v17 * v34) * 0.5;
    double v30 = 0.0;
  }
  else
  {
    double v24 = v22;
    [(SYNMediaWallCollectionViewCell2 *)self bounds];
    double v26 = v25 / v17;
    [(SYNMediaWallCollectionViewCell2 *)self bounds];
    double v28 = v27 / v17;
    [(SYNMediaWallCollectionViewCell2 *)self bounds];
    double v30 = (v28 - v29) * 0.5;
    double v31 = 0.0;
  }
  double rect_24 = v31;
  double v36 = -(v31 - x * v24);
  double v10 = 1.0;
  double v37 = -(v30 - (1.0 - y - height) * v26);
  double v38 = width * v24;
  double v39 = height * v26;
  double v40 = v30;
  [(SYNMediaWallCollectionViewCell2 *)self bounds];
  v77.origin.double x = v36;
  v77.origin.double y = v37;
  v77.size.double width = v38;
  v77.size.double height = v39;
  if (CGRectContainsRect(v66, v77)) {
    goto LABEL_25;
  }
  CGFloat v61 = v37;
  CGFloat rect_8 = v39;
  CGFloat rect_16 = v38;
  [(SYNMediaWallCollectionViewCell2 *)self bounds];
  double v42 = v41;
  [(SYNMediaWallCollectionViewCell2 *)self bounds];
  double v44 = v43;
  [(SYNMediaWallCollectionViewCell2 *)self bounds];
  if (rect_24 <= 0.0)
  {
    if (v40 > 0.0)
    {
      double v50 = v44 * 0.5;
      double v10 = v46 / v26;
      [(SYNMediaWallCollectionViewCell2 *)self bounds];
      double v13 = 0.0;
      v70.origin.double x = 0.0;
      v70.origin.double y = -v40;
      v70.size.double height = v40;
      v79.origin.double x = v36;
      v79.origin.double y = v61;
      v79.size.double width = rect_16;
      v79.size.double height = rect_8;
      BOOL v51 = CGRectIntersectsRect(v70, v79);
      v71.origin.double x = v36;
      v71.origin.double y = v61;
      v71.size.double width = rect_16;
      v71.size.double height = rect_8;
      double v52 = v50 - CGRectGetMidY(v71);
      if (v52 < 0.0) {
        double v52 = -v52;
      }
      if (!v51)
      {
        double v12 = 1.0;
        if (v52 >= v40)
        {
          double v9 = 1.0 - v10;
        }
        else
        {
          v74.origin.double x = v36;
          v74.origin.double y = v61;
          v74.size.double height = rect_8;
          v74.size.double width = rect_16;
          double v59 = v50 - CGRectGetMidY(v74);
          if (v59 < 0.0) {
            double v59 = -v59;
          }
          double v9 = 1.0 - v10 - (v40 - v59) / v26;
        }
        goto LABEL_27;
      }
      if (v52 < v40)
      {
        v72.origin.double x = v36;
        v72.origin.double y = v61;
        v72.size.double height = rect_8;
        v72.size.double width = rect_16;
        double v53 = v50 - CGRectGetMidY(v72);
        if (v53 < 0.0) {
          double v53 = -v53;
        }
        double v9 = (v40 - v53) / v26;
        double v12 = 1.0;
        goto LABEL_27;
      }
      double v12 = 1.0;
LABEL_26:
      double v9 = 0.0;
      goto LABEL_27;
    }
LABEL_25:
    double v12 = 1.0;
    double v13 = 0.0;
    goto LABEL_26;
  }
  double v60 = v42 * 0.5;
  double v12 = v45 / v24;
  [(SYNMediaWallCollectionViewCell2 *)self bounds];
  double v9 = 0.0;
  v67.origin.double y = 0.0;
  v67.origin.double x = -rect_24;
  v67.size.double width = rect_24;
  v78.origin.double x = v36;
  v78.origin.double y = v37;
  v78.size.double width = rect_16;
  v78.size.double height = rect_8;
  BOOL v47 = CGRectIntersectsRect(v67, v78);
  v68.origin.double x = v36;
  v68.origin.double y = v37;
  v68.size.double width = rect_16;
  v68.size.double height = rect_8;
  double v48 = v60 - CGRectGetMidX(v68);
  if (v48 < 0.0) {
    double v48 = -v48;
  }
  if (v47)
  {
    if (v48 >= rect_24) {
      goto LABEL_4;
    }
    v69.origin.double x = v36;
    v69.origin.double y = v37;
    v69.size.double width = rect_16;
    v69.size.double height = rect_8;
    double v49 = v60 - CGRectGetMidX(v69);
    if (v49 < 0.0) {
      double v49 = -v49;
    }
    double v13 = (rect_24 - v49) / v24;
  }
  else
  {
    double v13 = 1.0 - v12;
    if (v48 < rect_24)
    {
      v73.origin.double x = v36;
      v73.size.double height = rect_8;
      v73.origin.double y = v37;
      v73.size.double width = rect_16;
      double v58 = v60 - CGRectGetMidX(v73);
      if (v58 < 0.0) {
        double v58 = -v58;
      }
      double v13 = v13 - (rect_24 - v58) / v24;
    }
  }
LABEL_27:
  double v54 = v13;
  double v55 = v9;
  double v56 = v12;
  double v57 = v10;
  result.size.double height = v57;
  result.size.double width = v56;
  result.origin.double y = v55;
  result.origin.double x = v54;
  return result;
}

- (CGRect)imageContentsRect
{
  id v2 = [(UIImageView *)self->_imageView layer];
  [v2 contentsRect];
  result.size.double height = v6;
  result.size.double width = v5;
  result.origin.double y = v4;
  result.origin.double x = v3;
  return result;
}

- (void)updateImageContentsRect
{
  id v2 = [(UIImageView *)self->_imageView layer];
  objc_msgSend(v2, "setContentsRect:", 0.0, 0.0, 1.0, 1.0);
}

- (void)updateVideoFooter
{
  if ([(MZMediaManagement *)self->_assetManagementDelegate isSupportedMovieForAssetAtPath:[(MCAsset *)self->_mediaItem path]])
  {
    [(MZMediaManagement *)self->_assetManagementDelegate stopTimeForAssetAtPath:[(MCAsset *)self->_mediaItem path]];
    double v4 = v3;
    [(MZMediaManagement *)self->_assetManagementDelegate startTimeForAssetAtPath:[(MCAsset *)self->_mediaItem path]];
    double v6 = v4 - v5;
    videoLabelView = self->_videoLabelView;
    if (videoLabelView)
    {
      id v8 = [(UIView *)videoLabelView viewWithTag:1];
      if (v6 <= 0.0)
      {
        CFStringRef v10 = &stru_1AC850;
      }
      else
      {
        unint64_t quot = div((int)v6, 60).quot;
        CFStringRef v10 = +[NSString stringWithFormat:@"%02d:%02d", quot, HIDWORD(quot)];
      }
      [(UIView *)v8 setText:v10];
    }
    else
    {
      id v12 = objc_alloc((Class)UIView);
      [(SYNMediaWallCollectionViewCell2 *)self bounds];
      double v14 = v13 + -20.0;
      [(SYNMediaWallCollectionViewCell2 *)self bounds];
      self->_videoLabelView = (UIView *)objc_msgSend(v12, "initWithFrame:", 0.0, v14);
      if ([+[UIDevice currentDevice] userInterfaceIdiom])
      {
        [(UIView *)self->_videoLabelView setBackgroundColor:+[UIColor colorWithWhite:0.0 alpha:0.400000006]];
        if (v6 > 0.0)
        {
          id v15 = objc_alloc((Class)UILabel);
          [(UIView *)self->_videoLabelView bounds];
          id v16 = objc_msgSend(v15, "initWithFrame:");
          [v16 setAutoresizingMask:9];
          [v16 setTag:1];
          [v16 setTextAlignment:2];
          objc_msgSend(v16, "setTextColor:", +[UIColor whiteColor](UIColor, "whiteColor"));
          unint64_t v17 = div((int)v6, 60).quot;
          [v16 setText:+[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%02d:%02d", v17, HIDWORD(v17))];
          objc_msgSend(v16, "setBackgroundColor:", +[UIColor clearColor](UIColor, "clearColor"));
          objc_msgSend(v16, "setFont:", +[UIFont boldSystemFontOfSize:](UIFont, "boldSystemFontOfSize:", 11.0));
          [(UIView *)self->_videoLabelView addSubview:v16];

          [v16 sizeToFit];
          [(UIView *)self->_videoLabelView frame];
          double v19 = v18;
          [v16 frame];
          double v21 = v19 - v20 + -6.0;
          [(UIView *)self->_videoLabelView frame];
          double v23 = v22;
          [v16 frame];
          double v25 = (v23 - v24) * 0.5;
          [v16 frame];
          double v27 = v26;
          [v16 frame];
          objc_msgSend(v16, "setFrame:", v21, v25, v27);
        }
      }
      else
      {
        [(UIView *)self->_videoLabelView setBackgroundColor:+[UIColor clearColor]];
      }
      [(UIView *)self->_videoLabelView setAutoresizingMask:10];
      mainView = self->_mainView;
      double v29 = self->_videoLabelView;
      [(SYNMediaWallCollectionViewCellMainView2 *)mainView addSubview:v29];
    }
  }
  else
  {
    objc_super v11 = self->_videoLabelView;
    if (v11)
    {
      [(UIView *)v11 removeFromSuperview];

      self->_videoLabelView = 0;
    }
  }
}

- (id)snapshot
{
  return 0;
}

- (MCAssetVideo)mediaItem
{
  return (MCAssetVideo *)objc_getProperty(self, a2, 8, 1);
}

- (void)setMediaItem:(id)a3
{
}

- (UIColor)borderColor
{
  return self->_borderColor;
}

- (UIColor)selectedBorderColor
{
  return self->_selectedBorderColor;
}

@end