@interface DockedPlaceholderView
+ (double)defaultCornerRadius;
- (BOOL)shadowVisible;
- (BOOL)wantsFalseEdgeShadow;
- (CALayer)dimmingLayer;
- (DockedHeaderView)headerView;
- (DockedPlaceholderView)initWithFrame:(CGRect)a3;
- (MUIGradientView)falseEdgeShadowView;
- (UIView)overlayView;
- (UIView)roundedBackgroundView;
- (double)cornerRadius;
- (double)shadowOpacity;
- (double)shadowRadius;
- (id)backgroundColor;
- (id)preferredSpringLoadingEffect;
- (unint64_t)falseShadowEdge;
- (void)_updateShadow;
- (void)_updateShadowPathIfNeededForChangeFromRect:(CGRect)a3 toRect:(CGRect)a4;
- (void)installMaskCutoutView:(id)a3;
- (void)layoutSubviews;
- (void)setBackgroundColor:(id)a3;
- (void)setBounds:(CGRect)a3;
- (void)setCornerRadius:(double)a3;
- (void)setDimmingAmount:(double)a3;
- (void)setDimmingLayer:(id)a3;
- (void)setFalseEdgeShadowView:(id)a3;
- (void)setFalseShadowEdge:(unint64_t)a3;
- (void)setFrame:(CGRect)a3;
- (void)setHeaderView:(id)a3;
- (void)setOverlayView:(id)a3;
- (void)setRoundedBackgroundView:(id)a3;
- (void)setShadowOpacity:(double)a3;
- (void)setShadowRadius:(double)a3;
- (void)setShadowVisible:(BOOL)a3;
- (void)setWantsFalseEdgeShadow:(BOOL)a3;
- (void)traitCollectionDidChange:(id)a3;
- (void)updateCornerRadii;
@end

@implementation DockedPlaceholderView

- (DockedPlaceholderView)initWithFrame:(CGRect)a3
{
  v25.receiver = self;
  v25.super_class = (Class)DockedPlaceholderView;
  v3 = -[DockedPlaceholderView initWithFrame:](&v25, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = +[UITraitCollection traitCollectionWithUserInterfaceLevel:1];
    [(DockedPlaceholderView *)v3 _setLocalOverrideTraitCollection:v4];

    v5 = [(DockedPlaceholderView *)v3 layer];
    [v5 setShadowOffset:CGSizeZero.width, CGSizeZero.height];

    v6 = [(DockedPlaceholderView *)v3 layer];
    [v6 setAllowsGroupOpacity:1];

    v3->_falseShadowEdge = 0;
    [(DockedPlaceholderView *)v3 bounds];
    v7 = -[DockedHeaderView initWithFrame:]([DockedHeaderView alloc], "initWithFrame:", 0.0, 0.0, CGRectGetWidth(v26), 50.0);
    headerView = v3->_headerView;
    v3->_headerView = v7;

    [(DockedHeaderView *)v3->_headerView setAutoresizingMask:2];
    v9 = [(DockedPlaceholderView *)v3 headerView];
    [(DockedPlaceholderView *)v3 addSubview:v9];

    id v10 = objc_alloc((Class)UIView);
    [(DockedPlaceholderView *)v3 bounds];
    v11 = [v10 initWithFrame:];
    roundedBackgroundView = v3->_roundedBackgroundView;
    v3->_roundedBackgroundView = v11;

    v13 = +[UIColor clearColor];
    [(UIView *)v3->_roundedBackgroundView setBackgroundColor:v13];

    [(UIView *)v3->_roundedBackgroundView setAutoresizingMask:18];
    [(UIView *)v3->_roundedBackgroundView setClipsToBounds:1];
    v14 = [(UIView *)v3->_roundedBackgroundView layer];
    [v14 setMaskedCorners:10];

    v15 = [(UIView *)v3->_roundedBackgroundView layer];
    [v15 setAllowsGroupOpacity:1];

    [(DockedPlaceholderView *)v3 insertSubview:v3->_roundedBackgroundView below:v3->_headerView];
    id v16 = objc_alloc((Class)UIView);
    [(DockedPlaceholderView *)v3 bounds];
    v17 = [v16 initWithFrame:];
    overlayView = v3->_overlayView;
    v3->_overlayView = v17;

    [(UIView *)v3->_overlayView setAutoresizingMask:18];
    [(UIView *)v3->_overlayView setClipsToBounds:1];
    v19 = [(UIView *)v3->_overlayView layer];
    [v19 setAllowsGroupOpacity:1];

    v20 = (CALayer *)objc_alloc_init((Class)CALayer);
    dimmingLayer = v3->_dimmingLayer;
    v3->_dimmingLayer = v20;

    [(CALayer *)v3->_dimmingLayer setOpacity:0.0];
    [(CALayer *)v3->_dimmingLayer setAllowsGroupOpacity:1];
    id v22 = +[UIColor _dimmingViewColor];
    -[CALayer setBackgroundColor:](v3->_dimmingLayer, "setBackgroundColor:", [v22 CGColor]);

    v23 = [(UIView *)v3->_overlayView layer];
    [v23 addSublayer:v3->_dimmingLayer];

    [(DockedPlaceholderView *)v3 insertSubview:v3->_overlayView above:v3->_headerView];
    [(id)objc_opt_class() defaultCornerRadius];
    -[DockedPlaceholderView setCornerRadius:](v3, "setCornerRadius:");
    v3->_shadowVisible = 1;
    v3->_shadowOpacity = 0.2;
    v3->_shadowRadius = 3.0;
    [(DockedPlaceholderView *)v3 _updateShadow];
  }
  return v3;
}

- (void)setFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  [(DockedPlaceholderView *)self frame];
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  v20.receiver = self;
  v20.super_class = (Class)DockedPlaceholderView;
  -[DockedPlaceholderView setFrame:](&v20, "setFrame:", x, y, width, height);
  [(DockedPlaceholderView *)self frame];
  -[DockedPlaceholderView _updateShadowPathIfNeededForChangeFromRect:toRect:](self, "_updateShadowPathIfNeededForChangeFromRect:toRect:", v9, v11, v13, v15, v16, v17, v18, v19);
}

- (void)setBounds:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  [(DockedPlaceholderView *)self bounds];
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  v20.receiver = self;
  v20.super_class = (Class)DockedPlaceholderView;
  -[DockedPlaceholderView setBounds:](&v20, "setBounds:", x, y, width, height);
  [(DockedPlaceholderView *)self bounds];
  -[DockedPlaceholderView _updateShadowPathIfNeededForChangeFromRect:toRect:](self, "_updateShadowPathIfNeededForChangeFromRect:toRect:", v9, v11, v13, v15, v16, v17, v18, v19);
}

- (void)layoutSubviews
{
  v15.receiver = self;
  v15.super_class = (Class)DockedPlaceholderView;
  [(DockedPlaceholderView *)&v15 layoutSubviews];
  uint64_t v3 = [(DockedPlaceholderView *)self falseEdgeShadowView];
  if (v3)
  {
    v4 = (void *)v3;
    v5 = [(DockedPlaceholderView *)self falseEdgeShadowView];
    v6 = [v5 superview];

    if (v6 == self)
    {
      v7 = [(DockedPlaceholderView *)self falseEdgeShadowView];
      [(DockedPlaceholderView *)self bringSubviewToFront:v7];
    }
  }
  [(DockedPlaceholderView *)self cornerRadius];
  double v9 = v8;
  [(DockedPlaceholderView *)self bounds];
  CGFloat v10 = CGRectGetHeight(v16) - v9;
  [(DockedPlaceholderView *)self bounds];
  double Width = CGRectGetWidth(v17);
  double v12 = [(DockedPlaceholderView *)self roundedBackgroundView];
  [v12 setFrame:CGRectMake(0.0, v9, Width, v10)];

  double v13 = [(DockedPlaceholderView *)self headerView];
  [(DockedPlaceholderView *)self bringSubviewToFront:v13];

  double v14 = [(DockedPlaceholderView *)self overlayView];
  [(DockedPlaceholderView *)self bringSubviewToFront:v14];
}

- (id)backgroundColor
{
  v2 = [(DockedPlaceholderView *)self roundedBackgroundView];
  uint64_t v3 = [v2 backgroundColor];

  return v3;
}

- (void)setBackgroundColor:(id)a3
{
  id v6 = a3;
  v4 = [(DockedPlaceholderView *)self roundedBackgroundView];
  [v4 setBackgroundColor:v6];

  v5 = [(DockedPlaceholderView *)self headerView];
  [v5 setBackgroundColor:v6];
}

- (void)traitCollectionDidChange:(id)a3
{
  id v10 = a3;
  v4 = [(DockedPlaceholderView *)self traitCollection];
  id v5 = [v4 userInterfaceStyle];
  id v6 = [v10 userInterfaceStyle];

  if (v5 != v6)
  {
    id v7 = +[UIColor _dimmingViewColor];
    id v8 = [v7 CGColor];
    double v9 = [(DockedPlaceholderView *)self dimmingLayer];
    [v9 setBackgroundColor:v8];
  }
}

- (void)setDimmingAmount:(double)a3
{
  float v3 = a3;
  id v5 = [(DockedPlaceholderView *)self dimmingLayer];
  *(float *)&double v4 = v3;
  [v5 setOpacity:v4];
}

- (id)preferredSpringLoadingEffect
{
  float v3 = [TargetedSpringLoadedBlinkEffect alloc];
  double v4 = [(DockedPlaceholderView *)self overlayView];
  id v5 = [(TargetedSpringLoadedBlinkEffect *)v3 initWithTargetView:v4];

  return v5;
}

- (void)setShadowRadius:(double)a3
{
  if (self->_shadowRadius != a3)
  {
    self->_shadowRadius = a3;
    [(DockedPlaceholderView *)self _updateShadow];
  }
}

- (void)setShadowOpacity:(double)a3
{
  if (self->_shadowOpacity != a3)
  {
    self->_shadowOpacitdouble y = a3;
    [(DockedPlaceholderView *)self _updateShadow];
  }
}

- (void)setFalseShadowEdge:(unint64_t)a3
{
  if (self->_falseShadowEdge != a3)
  {
    self->_falseShadowEdge = a3;
    [(DockedPlaceholderView *)self _updateShadow];
  }
}

- (void)_updateShadowPathIfNeededForChangeFromRect:(CGRect)a3 toRect:(CGRect)a4
{
  if (!CGRectEqualToRect(a3, a4))
  {
    [(DockedPlaceholderView *)self shadowOpacity];
    if (v5 > 0.00000011920929)
    {
      [(DockedPlaceholderView *)self _updateShadow];
    }
  }
}

- (void)setShadowVisible:(BOOL)a3
{
  if (self->_shadowVisible != a3)
  {
    self->_shadowVisible = a3;
    [(DockedPlaceholderView *)self _updateShadow];
  }
}

- (void)_updateShadow
{
  if ([(DockedPlaceholderView *)self falseShadowEdge])
  {
    float v3 = [(DockedPlaceholderView *)self layer];
    [v3 setShadowOpacity:0.0];

    double v4 = [(DockedPlaceholderView *)self layer];
    [v4 setShadowRadius:0.0];

    double v5 = [(DockedPlaceholderView *)self layer];
    [v5 setShadowPath:0];

    id v6 = [(DockedPlaceholderView *)self falseEdgeShadowView];

    if (v6)
    {
      double y = CGRectZero.origin.y;
      double x = CGRectZero.origin.x;
      double height = CGRectZero.size.height;
      double width = CGRectZero.size.width;
    }
    else
    {
      id v26 = objc_alloc((Class)MUIGradientView);
      double y = CGRectZero.origin.y;
      double x = CGRectZero.origin.x;
      double height = CGRectZero.size.height;
      double width = CGRectZero.size.width;
      id v27 = [v26 initWithFrame:];
      [(DockedPlaceholderView *)self setFalseEdgeShadowView:v27];

      v28 = +[UIColor blackColor];
      v66[0] = v28;
      v29 = +[UIColor colorWithWhite:0.0 alpha:0.5];
      v66[1] = v29;
      v30 = +[UIColor colorWithWhite:0.0 alpha:0.0];
      v66[2] = v30;
      v31 = +[NSArray arrayWithObjects:v66 count:3];
      v32 = [(DockedPlaceholderView *)self falseEdgeShadowView];
      [v32 setGradientColors:v31];

      v33 = [(DockedPlaceholderView *)self falseEdgeShadowView];
      [v33 setLocations:&off_10062B390];
    }
    [(DockedPlaceholderView *)self bounds];
    CGFloat v35 = v34;
    CGFloat v37 = v36;
    CGFloat v39 = v38;
    CGFloat v41 = v40;
    [(DockedPlaceholderView *)self shadowRadius];
    double v43 = v42;
    unint64_t v44 = [(DockedPlaceholderView *)self falseShadowEdge];
    uint64_t v45 = 0;
    double v46 = CGPointZero.x;
    double v47 = CGPointZero.y;
    double v60 = v43 + v43;
    double v48 = CGPointZero.x;
    double v49 = v47;
    switch(v44)
    {
      case 1uLL:
        v68.origin.double x = v35;
        v68.origin.double y = v37;
        v68.size.double width = v39;
        v68.size.double height = v41;
        double MinY = CGRectGetMinY(v68);
        v69.origin.double x = v35;
        v69.origin.double y = v37;
        v69.size.double width = v39;
        v69.size.double height = v41;
        double width = CGRectGetWidth(v69);
        double v51 = v60 + MinY;
        double v49 = 1.0;
        double v46 = 0.5;
        double y = v51;
        double x = 0.0;
        uint64_t v45 = 34;
        double height = v60;
        double v47 = 0.0;
        double v48 = 0.5;
        break;
      case 2uLL:
        v70.origin.double x = v35;
        v70.origin.double y = v37;
        v70.size.double width = v39;
        v70.size.double height = v41;
        double height = CGRectGetHeight(v70);
        double v48 = 1.0;
        double v47 = 0.5;
        double y = 0.0;
        double x = -v60;
        uint64_t v45 = 20;
        double width = v60;
        double v46 = 0.0;
        goto LABEL_15;
      case 3uLL:
      case 5uLL:
      case 6uLL:
      case 7uLL:
        break;
      case 4uLL:
        v71.origin.double x = v35;
        v71.origin.double y = v37;
        v71.size.double width = v39;
        v71.size.double height = v41;
        double y = CGRectGetMaxY(v71);
        v72.origin.double x = v35;
        v72.origin.double y = v37;
        v72.size.double width = v39;
        v72.size.double height = v41;
        double width = CGRectGetWidth(v72);
        double v47 = 1.0;
        double v46 = 0.5;
        double x = 0.0;
        uint64_t v45 = 10;
        double height = v60;
        double v48 = 0.5;
        double v49 = 0.0;
        break;
      case 8uLL:
        v73.origin.double x = v35;
        v73.origin.double y = v37;
        v73.size.double width = v39;
        v73.size.double height = v41;
        double x = CGRectGetMaxX(v73);
        v74.origin.double x = v35;
        v74.origin.double y = v37;
        v74.size.double width = v39;
        v74.size.double height = v41;
        double height = CGRectGetHeight(v74);
        double v47 = 0.5;
        double v46 = 1.0;
        double y = 0.0;
        uint64_t v45 = 17;
        double width = v60;
        double v48 = 0.0;
LABEL_15:
        double v49 = 0.5;
        break;
      default:
        double v48 = CGPointZero.x;
        double v49 = CGPointZero.y;
        break;
    }
    [(DockedPlaceholderView *)self shadowOpacity];
    double v53 = v52;
    v54 = [(DockedPlaceholderView *)self falseEdgeShadowView];
    [v54 setAlpha:v53];

    v55 = [(DockedPlaceholderView *)self falseEdgeShadowView];
    [v55 setStartPoint:v48, v49];

    v56 = [(DockedPlaceholderView *)self falseEdgeShadowView];
    [v56 setEndPoint:v46, v47];

    v57 = [(DockedPlaceholderView *)self falseEdgeShadowView];
    [v57 setFrame:x, y, width, height];

    v58 = [(DockedPlaceholderView *)self falseEdgeShadowView];
    [v58 setAutoresizingMask:v45];

    v59 = [(DockedPlaceholderView *)self falseEdgeShadowView];
    [(DockedPlaceholderView *)self addSubview:v59];
  }
  else
  {
    [(DockedPlaceholderView *)self bounds];
    double v8 = v7;
    double v10 = v9;
    double v12 = v11;
    double v14 = v13;
    [(DockedPlaceholderView *)self cornerRadius];
    +[UIBezierPath bezierPathWithRoundedRect:cornerRadius:](UIBezierPath, "bezierPathWithRoundedRect:cornerRadius:", v8, v10, v12, v14, v15);
    id v65 = objc_claimAutoreleasedReturnValue();
    id v16 = [v65 CGPath];
    CGRect v17 = [(DockedPlaceholderView *)self layer];
    [v17 setShadowPath:v16];

    double v18 = 0.0;
    if ([(DockedPlaceholderView *)self shadowVisible])
    {
      [(DockedPlaceholderView *)self shadowOpacity];
      double v18 = v19;
    }
    objc_super v20 = [(DockedPlaceholderView *)self layer];
    *(float *)&double v21 = v18;
    [v20 setShadowOpacity:v21];

    [(DockedPlaceholderView *)self shadowRadius];
    double v23 = v22;
    v24 = [(DockedPlaceholderView *)self layer];
    [v24 setShadowRadius:v23];

    objc_super v25 = [(DockedPlaceholderView *)self falseEdgeShadowView];
    [v25 removeFromSuperview];
  }
}

+ (double)defaultCornerRadius
{
  +[SheetMetrics cornerRadius];
  return result;
}

- (void)setCornerRadius:(double)a3
{
  if (self->_cornerRadius != a3)
  {
    self->_cornerRadius = a3;
    [(DockedPlaceholderView *)self updateCornerRadii];
  }
}

- (void)updateCornerRadii
{
  [(DockedPlaceholderView *)self cornerRadius];
  double v4 = v3;
  id v9 = [(DockedPlaceholderView *)self headerView];
  [v9 setCornerRadius:v4];

  [(DockedPlaceholderView *)self cornerRadius];
  double v6 = v5;
  id v10 = [(DockedPlaceholderView *)self roundedBackgroundView];
  [v10 _setContinuousCornerRadius:v6];

  [(DockedPlaceholderView *)self cornerRadius];
  double v8 = v7;
  id v11 = [(DockedPlaceholderView *)self overlayView];
  [v11 _setContinuousCornerRadius:v8];
}

- (void)installMaskCutoutView:(id)a3
{
  id v4 = a3;
  [(DockedPlaceholderView *)self setClipsToBounds:0];
  [(DockedPlaceholderView *)self bounds];
  [v4 setFrame:];
  [(DockedPlaceholderView *)self addSubview:v4];
}

- (DockedHeaderView)headerView
{
  return self->_headerView;
}

- (void)setHeaderView:(id)a3
{
}

- (double)shadowRadius
{
  return self->_shadowRadius;
}

- (double)shadowOpacity
{
  return self->_shadowOpacity;
}

- (unint64_t)falseShadowEdge
{
  return self->_falseShadowEdge;
}

- (double)cornerRadius
{
  return self->_cornerRadius;
}

- (MUIGradientView)falseEdgeShadowView
{
  return self->_falseEdgeShadowView;
}

- (void)setFalseEdgeShadowView:(id)a3
{
}

- (BOOL)wantsFalseEdgeShadow
{
  return self->_wantsFalseEdgeShadow;
}

- (void)setWantsFalseEdgeShadow:(BOOL)a3
{
  self->_wantsFalseEdgeShadow = a3;
}

- (UIView)roundedBackgroundView
{
  return self->_roundedBackgroundView;
}

- (void)setRoundedBackgroundView:(id)a3
{
}

- (UIView)overlayView
{
  return self->_overlayView;
}

- (void)setOverlayView:(id)a3
{
}

- (CALayer)dimmingLayer
{
  return self->_dimmingLayer;
}

- (void)setDimmingLayer:(id)a3
{
}

- (BOOL)shadowVisible
{
  return self->_shadowVisible;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dimmingLayer, 0);
  objc_storeStrong((id *)&self->_overlayView, 0);
  objc_storeStrong((id *)&self->_roundedBackgroundView, 0);
  objc_storeStrong((id *)&self->_falseEdgeShadowView, 0);

  objc_storeStrong((id *)&self->_headerView, 0);
}

@end