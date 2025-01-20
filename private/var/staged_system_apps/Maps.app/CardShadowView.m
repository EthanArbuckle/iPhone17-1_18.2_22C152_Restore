@interface CardShadowView
- (BOOL)buttonCard;
- (BOOL)shouldCropBottomEdge;
- (CardShadowView)initWithFrame:(CGRect)a3;
- (void)invalidateCachedShadow;
- (void)layoutSubviews;
- (void)setButtonCard:(BOOL)a3;
- (void)setShouldCropBottomEdge:(BOOL)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation CardShadowView

- (void)layoutSubviews
{
  v3 = &OBJC_IVAR___RouteUpdatingNavigationServiceTask__handler;
  if (self->_invalidatedShadow)
  {
    self->_invalidatedShadow = 0;
    v4 = [(CardShadowView *)self traitCollection];
    v5 = +[CardShadowSettings settingsForTraitCollection:v4 button:[(CardShadowView *)self buttonCard]];

    objc_storeStrong((id *)&self->_settings, v5);
    v6 = [(CardShadowView *)self traitCollection];
    [v6 displayScale];
    CGFloat v8 = v7;

    [v5 cornerRadius];
    double v10 = v9;
    [v5 rimOpacity];
    double v12 = v11;
    [v5 opacity];
    CGFloat v14 = v13;
    [v5 radius];
    double v16 = v15;
    if ([(CardShadowView *)self shouldCropBottomEdge])
    {
      v17 = [(CardShadowView *)self layer];
      [v17 setCornerRadius:0.0];

      v18 = [(CardShadowView *)self layer];
      [v18 setBorderColor:0];

      v19 = [(CardShadowView *)self layer];
      [v19 setBorderWidth:0.0];

      v20 = [(CardShadowView *)self layer];
      [v20 setShadowRadius:0.0];

      v21 = [(CardShadowView *)self layer];
      [v21 setShadowOpacity:0.0];

      v22 = [(CardShadowView *)self layer];
      [v22 setShadowColor:0];

      v23 = [(CardShadowView *)self layer];
      [v23 setShadowPathIsBounds:0];

      if (!self->_shadowImageView)
      {
        v24 = [objc_alloc((Class)UIImageView) initWithFrame:CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height];
        shadowImageView = self->_shadowImageView;
        self->_shadowImageView = v24;

        [(CardShadowView *)self addSubview:self->_shadowImageView];
      }
      if (qword_10160F328 != -1) {
        dispatch_once(&qword_10160F328, &stru_1012F2A18);
      }
      v56[5] = 1;
      *(double *)v56 = v10;
      *(double *)&v56[1] = v12;
      *(double *)&v56[2] = v16;
      *(CGFloat *)&v56[3] = v14;
      *(CGFloat *)&v56[4] = v8;
      v26 = +[NSValue valueWithBytes:v56 objCType:"{?=dddddB}"];
      v27 = [(id)qword_10160F320 objectForKeyedSubscript:v26];
      if (!v27)
      {
        double v55 = ceil(v10 * 1.528665);
        double v28 = ceil(v16);
        CGFloat v29 = v28 * 3.0 + v55 * 2.0 + 1.0;
        v30 = +[UIBezierPath bezierPathWithRoundedRect:cornerRadius:](UIBezierPath, "bezierPathWithRoundedRect:cornerRadius:", v28, v28, v29 - v28 * 2.0, v29 - v28 * 2.0 + v29 - v28 * 2.0, v10);
        v57.width = v29;
        v57.height = v29;
        UIGraphicsBeginImageContextWithOptions(v57, 0, v8);
        CurrentContext = UIGraphicsGetCurrentContext();
        CGContextSaveGState(CurrentContext);
        SRGB = CGColorCreateSRGB(0.0, 0.0, 0.0, v14);
        v58.width = 0.0;
        v58.height = v29 + v29;
        CGContextSetShadowWithColor(CurrentContext, v58, v16, SRGB);
        CGColorRelease(SRGB);
        CGContextTranslateCTM(CurrentContext, 0.0, -(v29 + v29));
        [v30 fill];
        CGContextRestoreGState(CurrentContext);
        v33 = +[UIColor colorWithWhite:0.0 alpha:v12];
        [v33 set];

        [v30 setLineWidth:2.0 / v8];
        [v30 stroke];
        CGContextSetBlendMode(CurrentContext, kCGBlendModeDestinationOut);
        v34 = +[UIColor blackColor];
        [v34 set];

        [v30 fill];
        v35 = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        v27 = [v35 resizableImageWithCapInsets:v55 + v28, v55 + v28, v55 + v28, v55 + v28];

        if (v27) {
          [(id)qword_10160F320 setObject:v27 forKeyedSubscript:v26];
        }
        v3 = &OBJC_IVAR___RouteUpdatingNavigationServiceTask__handler;
      }

      [(UIImageView *)self->_shadowImageView setImage:v27];
    }
    else
    {
      v36 = self->_shadowImageView;
      if (v36)
      {
        [(UIImageView *)v36 removeFromSuperview];
        v37 = self->_shadowImageView;
        self->_shadowImageView = 0;
      }
      v38 = +[UIColor colorWithWhite:0.0 alpha:v12];
      v39 = +[UIColor colorWithWhite:0.0 alpha:v14];
      v40 = [(CardShadowView *)self layer];
      [v40 setCornerRadius:v10];

      id v41 = v38;
      id v42 = [v41 CGColor];
      v43 = [(CardShadowView *)self layer];
      [v43 setBorderColor:v42];

      v44 = [(CardShadowView *)self layer];
      [v44 setBorderWidth:2.0 / v8];

      id v45 = v39;
      id v46 = [v45 CGColor];
      v47 = [(CardShadowView *)self layer];
      [v47 setShadowColor:v46];

      v48 = [(CardShadowView *)self layer];
      [v48 setShadowRadius:v16];

      v49 = [(CardShadowView *)self layer];
      LODWORD(v50) = 1.0;
      [v49 setShadowOpacity:v50];

      v51 = [(CardShadowView *)self layer];
      [v51 setShadowOffset:0.0, 1.0];

      v52 = [(CardShadowView *)self layer];
      [v52 setShadowPathIsBounds:1];
    }
  }
  if (self->_shadowImageView)
  {
    [*(id *)((char *)&self->super.super.super.isa + v3[608]) expansion];
    double v54 = v53;
    [(CardShadowView *)self bounds];
    CGRect v60 = CGRectInset(v59, -v54, -v54);
    -[UIImageView setFrame:](self->_shadowImageView, "setFrame:", v60.origin.x, v60.origin.y, v60.size.width, v60.size.height - v54);
  }
}

- (BOOL)shouldCropBottomEdge
{
  return self->_shouldCropBottomEdge;
}

- (BOOL)buttonCard
{
  return self->_buttonCard;
}

- (void)setButtonCard:(BOOL)a3
{
  if (self->_buttonCard != a3)
  {
    self->_buttonCard = a3;
    [(CardShadowView *)self invalidateCachedShadow];
  }
}

- (void)traitCollectionDidChange:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)CardShadowView;
  [(CardShadowView *)&v4 traitCollectionDidChange:a3];
  [(CardShadowView *)self invalidateCachedShadow];
}

- (void)invalidateCachedShadow
{
  self->_invalidatedShadow = 1;
  [(CardShadowView *)self setNeedsLayout];
}

- (void)setShouldCropBottomEdge:(BOOL)a3
{
  self->_shouldCropBottomEdge = a3;
  [(CardShadowView *)self invalidateCachedShadow];
}

- (CardShadowView)initWithFrame:(CGRect)a3
{
  v7.receiver = self;
  v7.super_class = (Class)CardShadowView;
  v3 = -[CardShadowView initWithFrame:](&v7, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  objc_super v4 = v3;
  if (v3)
  {
    v3->_invalidatedShadow = 1;
    v5 = v3;
  }

  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_settings, 0);

  objc_storeStrong((id *)&self->_shadowImageView, 0);
}

@end