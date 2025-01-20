@interface PREditingVariationSlider
+ (double)defaultHeight;
+ (double)defaultTrackHeight;
- (CALayer)thumbContentLayer;
- (CALayer)thumbSoftShadowLayer;
- (CAShapeLayer)thumbBorderLayer;
- (CAShapeLayer)thumbClippingLayer;
- (CGColor)trackBorderColor;
- (NSString)contextIdentifier;
- (PREditingPosterContentStyleCoordinator)styleCoordinator;
- (PREditingVariationSlider)initWithStyleCoordinator:(id)a3 contextIdentifier:(id)a4;
- (UIPanGestureRecognizer)panGesture;
- (UIView)thumbContainerView;
- (UIView)thumbContentView;
- (UIView)trackView;
- (double)startPanOffset;
- (double)value;
- (double)variation;
- (void)_setSliderValue:(double)a3;
- (void)_setupThumbView;
- (void)layoutSubviews;
- (void)layoutThumbView;
- (void)setContextIdentifier:(id)a3;
- (void)setPanGesture:(id)a3;
- (void)setStartPanOffset:(double)a3;
- (void)setStyleCoordinator:(id)a3;
- (void)setThumbBorderLayer:(id)a3;
- (void)setThumbClippingLayer:(id)a3;
- (void)setThumbContainerView:(id)a3;
- (void)setThumbContentLayer:(id)a3;
- (void)setThumbContentView:(id)a3;
- (void)setThumbSoftShadowLayer:(id)a3;
- (void)setTrackView:(id)a3;
- (void)setValue:(double)a3;
- (void)setVariation:(double)a3;
- (void)thumbViewDidPan:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
- (void)updateThumbContentView;
- (void)updateTrack;
@end

@implementation PREditingVariationSlider

+ (double)defaultHeight
{
  return 34.0;
}

+ (double)defaultTrackHeight
{
  [a1 defaultHeight];
  return v2 * 0.444444444;
}

- (PREditingVariationSlider)initWithStyleCoordinator:(id)a3 contextIdentifier:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v17.receiver = self;
  v17.super_class = (Class)PREditingVariationSlider;
  v9 = -[PREditingVariationSlider initWithFrame:](&v17, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_styleCoordinator, a3);
    objc_storeStrong((id *)&v10->_contextIdentifier, a4);
    [(PREditingVariationSlider *)v10 _setupThumbView];
    uint64_t v11 = [objc_alloc(MEMORY[0x1E4FB1A58]) initWithTarget:v10 action:sel_thumbViewDidPan_];
    panGesture = v10->_panGesture;
    v10->_panGesture = (UIPanGestureRecognizer *)v11;

    [(UIView *)v10->_thumbContainerView addGestureRecognizer:v10->_panGesture];
    [(PREditingVariationSlider *)v10 addSubview:v10->_thumbContainerView];
    [(PREditingVariationSlider *)v10 setClipsToBounds:0];
    [(PREditingVariationSlider *)v10 updateTrack];
    v13 = [v7 style];
    int v14 = [v13 allowsVariation];

    if (v14)
    {
      v15 = [v7 style];
      [v15 variation];
      -[PREditingVariationSlider _setSliderValue:](v10, "_setSliderValue:");
    }
  }

  return v10;
}

- (void)_setupThumbView
{
  if (!self->_thumbContainerView)
  {
    v3 = (UIView *)objc_alloc_init(MEMORY[0x1E4FB1EB0]);
    thumbContainerView = self->_thumbContainerView;
    self->_thumbContainerView = v3;

    v5 = self->_thumbContainerView;
    v6 = [MEMORY[0x1E4FB1618] clearColor];
    [(UIView *)v5 setBackgroundColor:v6];

    [(UIView *)self->_thumbContainerView setContentMode:2];
    [(UIView *)self->_thumbContainerView setClipsToBounds:0];
    id v22 = [(UIView *)self->_thumbContainerView layer];
    LODWORD(v7) = 1042536202;
    [v22 setShadowOpacity:v7];
    objc_msgSend(v22, "setShadowOffset:", 1.0, 5.5);
    [v22 setShadowRadius:3.5];
    id v8 = [MEMORY[0x1E4F39BE8] layer];
    thumbSoftShadowLayer = self->_thumbSoftShadowLayer;
    self->_thumbSoftShadowLayer = v8;

    LODWORD(v10) = 1042536202;
    [(CALayer *)self->_thumbSoftShadowLayer setShadowOpacity:v10];
    -[CALayer setShadowOffset:](self->_thumbSoftShadowLayer, "setShadowOffset:", 0.0, 0.0);
    [(CALayer *)self->_thumbSoftShadowLayer setShadowRadius:6.5];
    uint64_t v11 = [(UIView *)self->_thumbContainerView layer];
    [v11 addSublayer:self->_thumbSoftShadowLayer];

    v12 = [MEMORY[0x1E4F39BE8] layer];
    thumbContentLayer = self->_thumbContentLayer;
    self->_thumbContentLayer = v12;

    int v14 = [(UIView *)self->_thumbContainerView layer];
    [v14 addSublayer:self->_thumbContentLayer];

    v15 = (CAShapeLayer *)objc_alloc_init(MEMORY[0x1E4F39C88]);
    thumbBorderLayer = self->_thumbBorderLayer;
    self->_thumbBorderLayer = v15;

    objc_super v17 = self->_thumbBorderLayer;
    id v18 = [MEMORY[0x1E4FB1618] clearColor];
    -[CAShapeLayer setFillColor:](v17, "setFillColor:", [v18 CGColor]);

    v19 = self->_thumbBorderLayer;
    id v20 = [MEMORY[0x1E4FB1618] whiteColor];
    -[CAShapeLayer setStrokeColor:](v19, "setStrokeColor:", [v20 CGColor]);

    [(CAShapeLayer *)self->_thumbBorderLayer setLineWidth:2.0];
    v21 = [(UIView *)self->_thumbContainerView layer];
    [v21 addSublayer:self->_thumbBorderLayer];

    [(PREditingVariationSlider *)self updateThumbContentView];
  }
}

- (void)updateTrack
{
  uint64_t v3 = [(PREditingPosterContentStyleCoordinator *)self->_styleCoordinator variationSliderTrackView];
  p_trackView = &self->_trackView;
  trackView = self->_trackView;
  id obj = (id)v3;
  if ((UIView *)v3 != trackView)
  {
    [(UIView *)trackView removeFromSuperview];
    objc_storeStrong((id *)&self->_trackView, obj);
    [(PREditingVariationSlider *)self insertSubview:*p_trackView atIndex:0];
    [(UIView *)*p_trackView setAutoresizingMask:18];
    v6 = *p_trackView;
    [(PREditingVariationSlider *)self bounds];
    -[UIView setFrame:](v6, "setFrame:");
  }
}

- (void)updateThumbContentView
{
  uint64_t v3 = [(PREditingPosterContentStyleCoordinator *)self->_styleCoordinator variationSliderThumbView];
  p_thumbContentView = &self->_thumbContentView;
  thumbContentView = self->_thumbContentView;
  id obj = (id)v3;
  if ((UIView *)v3 != thumbContentView)
  {
    [(UIView *)thumbContentView removeFromSuperview];
    objc_storeStrong((id *)&self->_thumbContentView, obj);
    [(UIView *)*p_thumbContentView setUserInteractionEnabled:0];
    [(UIView *)*p_thumbContentView setContentMode:2];
    [(UIView *)*p_thumbContentView setClipsToBounds:0];
    [(UIView *)self->_thumbContainerView addSubview:*p_thumbContentView];
  }
  if (!self->_thumbClippingLayer)
  {
    v6 = (CAShapeLayer *)objc_alloc_init(MEMORY[0x1E4F39C88]);
    thumbClippingLayer = self->_thumbClippingLayer;
    self->_thumbClippingLayer = v6;

    [(CAShapeLayer *)self->_thumbClippingLayer setFillRule:*MEMORY[0x1E4F39FB8]];
  }
  id v8 = [(UIView *)*p_thumbContentView layer];
  [v8 setMask:self->_thumbClippingLayer];
}

- (void)layoutThumbView
{
  [(PREditingVariationSlider *)self bounds];
  double v4 = v3;
  [(PREditingVariationSlider *)self bounds];
  thumbContainerView = self->_thumbContainerView;
  double v7 = (v5 - v4) * 0.5 + self->_value * ((v5 - v4) * 0.5);
  -[UIView setFrame:](thumbContainerView, "setFrame:", v7, 0.0, v4, v4);
}

- (void)layoutSubviews
{
  v46.receiver = self;
  v46.super_class = (Class)PREditingVariationSlider;
  [(PREditingVariationSlider *)&v46 layoutSubviews];
  thumbContentView = self->_thumbContentView;
  [(UIView *)self->_thumbContainerView bounds];
  -[UIView setFrame:](thumbContentView, "setFrame:");
  [(PREditingVariationSlider *)self layoutThumbView];
  [(CAShapeLayer *)self->_thumbClippingLayer frame];
  CGFloat v5 = v4;
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  [(UIView *)self->_thumbContentView bounds];
  v52.origin.double x = v12;
  v52.origin.double y = v13;
  v52.size.double width = v14;
  v52.size.double height = v15;
  v47.origin.double x = v5;
  v47.origin.double y = v7;
  v47.size.double width = v9;
  v47.size.double height = v11;
  if (!CGRectEqualToRect(v47, v52))
  {
    thumbClippingLayer = self->_thumbClippingLayer;
    [(UIView *)self->_thumbContentView bounds];
    -[CAShapeLayer setFrame:](thumbClippingLayer, "setFrame:");
    objc_super v17 = self->_thumbClippingLayer;
    id v18 = (void *)MEMORY[0x1E4FB14C0];
    [(UIView *)self->_thumbContainerView bounds];
    CGRect v49 = CGRectInset(v48, 1.0, 1.0);
    objc_msgSend(v18, "bezierPathWithOvalInRect:", v49.origin.x, v49.origin.y, v49.size.width, v49.size.height);
    id v19 = objc_claimAutoreleasedReturnValue();
    -[CAShapeLayer setPath:](v17, "setPath:", [v19 CGPath]);

    id v20 = [(UIView *)self->_thumbContainerView layer];
    [v20 bounds];
    CGFloat v22 = v21;
    CGFloat v24 = v23;
    CGFloat v26 = v25;
    CGFloat v28 = v27;
    [(CAShapeLayer *)self->_thumbBorderLayer lineWidth];
    CGFloat v30 = v29 * 0.5;
    [(CAShapeLayer *)self->_thumbBorderLayer lineWidth];
    CGFloat v32 = v31 * 0.5;
    v50.origin.double x = v22;
    v50.origin.double y = v24;
    v50.size.double width = v26;
    v50.size.double height = v28;
    CGRect v51 = CGRectInset(v50, v30, v32);
    double x = v51.origin.x;
    double y = v51.origin.y;
    double width = v51.size.width;
    double height = v51.size.height;

    thumbBorderLayer = self->_thumbBorderLayer;
    objc_msgSend(MEMORY[0x1E4FB14C0], "bezierPathWithOvalInRect:", x, y, width, height);
    id v38 = objc_claimAutoreleasedReturnValue();
    -[CAShapeLayer setPath:](thumbBorderLayer, "setPath:", [v38 CGPath]);

    v39 = self->_thumbBorderLayer;
    v40 = [(UIView *)self->_thumbContainerView layer];
    [v40 bounds];
    -[CAShapeLayer setFrame:](v39, "setFrame:");

    v41 = [(UIView *)self->_thumbContainerView layer];
    objc_msgSend(v41, "setShadowPath:", -[CAShapeLayer path](self->_thumbBorderLayer, "path"));

    [(CALayer *)self->_thumbSoftShadowLayer setShadowPath:[(CAShapeLayer *)self->_thumbBorderLayer path]];
  }
  if (self->_trackView)
  {
    [(PREditingVariationSlider *)self bounds];
    double v43 = v42 * 0.444444444;
    -[UIView setFrame:](self->_trackView, "setFrame:", 0.0, (v42 - v42 * 0.444444444) * 0.5);
    [(UIView *)self->_trackView _setContinuousCornerRadius:v43 * 0.5];
    v44 = [(UIView *)self->_trackView layer];
    [v44 setBorderWidth:2.0];

    v45 = [(UIView *)self->_trackView layer];
    objc_msgSend(v45, "setBorderColor:", -[PREditingVariationSlider trackBorderColor](self, "trackBorderColor"));
  }
}

- (CGColor)trackBorderColor
{
  id v2 = [MEMORY[0x1E4FB1618] colorWithWhite:0.0 alpha:0.1];
  double v3 = (CGColor *)[v2 CGColor];

  return v3;
}

- (void)setStyleCoordinator:(id)a3
{
  CGFloat v5 = (PREditingPosterContentStyleCoordinator *)a3;
  if (v5)
  {
    CGFloat v9 = v5;
    double v6 = [(PREditingPosterContentStyleCoordinator *)v5 style];
    int v7 = [v6 allowsVariation];

    CGFloat v5 = v9;
    if (v7)
    {
      double v8 = [(PREditingPosterContentStyleCoordinator *)v9 style];
      if (self->_styleCoordinator != v9) {
        objc_storeStrong((id *)&self->_styleCoordinator, a3);
      }
      [(PREditingVariationSlider *)self updateTrack];
      [(PREditingVariationSlider *)self updateThumbContentView];
      [v8 variation];
      -[PREditingVariationSlider _setSliderValue:](self, "_setSliderValue:");
      [(PREditingVariationSlider *)self setNeedsLayout];

      CGFloat v5 = v9;
    }
  }
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4 = a3;
  CGFloat v5 = [(PREditingVariationSlider *)self traitCollection];
  uint64_t v6 = [v5 layoutDirection];
  uint64_t v7 = [v4 layoutDirection];

  if (v6 != v7)
  {
    long long v8 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 80);
    *(_OWORD *)&v16.m31 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 64);
    *(_OWORD *)&v16.m33 = v8;
    long long v9 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 112);
    *(_OWORD *)&v16.m41 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 96);
    *(_OWORD *)&v16.m43 = v9;
    long long v10 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 16);
    *(_OWORD *)&v16.m11 = *MEMORY[0x1E4F39B10];
    *(_OWORD *)&v16.m13 = v10;
    long long v11 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 48);
    *(_OWORD *)&v16.m21 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 32);
    *(_OWORD *)&v16.m23 = v11;
    CGFloat v12 = [(PREditingVariationSlider *)self traitCollection];
    uint64_t v13 = [v12 layoutDirection];

    if (v13 == 1) {
      CATransform3DMakeRotation(&v16, 3.14159265, 0.0, 1.0, 0.0);
    }
    CGFloat v14 = [(UIView *)self->_trackView layer];
    CATransform3D v15 = v16;
    [v14 setTransform:&v15];
  }
}

- (void)thumbViewDidPan:(id)a3
{
  id v19 = a3;
  if ([v19 state] == 1)
  {
    [(UIView *)self->_thumbContainerView center];
    self->_startPanOffset = v4;
    [(PREditingVariationSlider *)self bringSubviewToFront:self->_thumbContainerView];
    CGFloat v5 = self;
    uint64_t v6 = 0x10000;
  }
  else
  {
    if ([v19 state] != 2 && objc_msgSend(v19, "state") != 3) {
      goto LABEL_14;
    }
    [(PREditingVariationSlider *)self bounds];
    double v8 = v7;
    [(UIView *)self->_thumbContainerView bounds];
    double v10 = v9;
    [v19 translationInView:self];
    double v12 = v11 + self->_startPanOffset;
    [(UIView *)self->_thumbContainerView bounds];
    double MidX = CGRectGetMidX(v21);
    double v14 = v12 >= MidX ? v12 : MidX;
    double v15 = v8 - MidX;
    double v16 = v14 >= v15 ? v15 : v14;
    thumbContainerView = self->_thumbContainerView;
    [(UIView *)thumbContainerView center];
    [(UIView *)thumbContainerView setCenter:v16];
    [(UIView *)self->_thumbContainerView frame];
    self->_value = v18 / (v8 - v10) - (1.0 - v18 / (v8 - v10));
    -[PREditingPosterContentStyleCoordinator setVariation:](self->_styleCoordinator, "setVariation:");
    [(PREditingVariationSlider *)self sendActionsForControlEvents:4096];
    if ([v19 state] != 3) {
      goto LABEL_14;
    }
    CGFloat v5 = self;
    uint64_t v6 = 0x40000;
  }
  [(PREditingVariationSlider *)v5 sendActionsForControlEvents:v6];
LABEL_14:
}

- (void)_setSliderValue:(double)a3
{
  self->_value = a3;
  [(PREditingPosterContentStyleCoordinator *)self->_styleCoordinator variation];
  if ((BSFloatEqualToFloat() & 1) == 0) {
    [(PREditingPosterContentStyleCoordinator *)self->_styleCoordinator setVariation:a3];
  }
  [(PREditingVariationSlider *)self layoutThumbView];
}

- (double)variation
{
  return self->_value;
}

- (void)setVariation:(double)a3
{
  self->_variation = a3;
}

- (PREditingPosterContentStyleCoordinator)styleCoordinator
{
  return self->_styleCoordinator;
}

- (double)value
{
  return self->_value;
}

- (void)setValue:(double)a3
{
  self->_value = a3;
}

- (NSString)contextIdentifier
{
  return self->_contextIdentifier;
}

- (void)setContextIdentifier:(id)a3
{
}

- (UIPanGestureRecognizer)panGesture
{
  return self->_panGesture;
}

- (void)setPanGesture:(id)a3
{
}

- (double)startPanOffset
{
  return self->_startPanOffset;
}

- (void)setStartPanOffset:(double)a3
{
  self->_startPanOffset = a3;
}

- (UIView)trackView
{
  return self->_trackView;
}

- (void)setTrackView:(id)a3
{
}

- (CAShapeLayer)thumbClippingLayer
{
  return self->_thumbClippingLayer;
}

- (void)setThumbClippingLayer:(id)a3
{
}

- (CALayer)thumbContentLayer
{
  return self->_thumbContentLayer;
}

- (void)setThumbContentLayer:(id)a3
{
}

- (CALayer)thumbSoftShadowLayer
{
  return self->_thumbSoftShadowLayer;
}

- (void)setThumbSoftShadowLayer:(id)a3
{
}

- (CAShapeLayer)thumbBorderLayer
{
  return self->_thumbBorderLayer;
}

- (void)setThumbBorderLayer:(id)a3
{
}

- (UIView)thumbContainerView
{
  return self->_thumbContainerView;
}

- (void)setThumbContainerView:(id)a3
{
}

- (UIView)thumbContentView
{
  return self->_thumbContentView;
}

- (void)setThumbContentView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_thumbContentView, 0);
  objc_storeStrong((id *)&self->_thumbContainerView, 0);
  objc_storeStrong((id *)&self->_thumbBorderLayer, 0);
  objc_storeStrong((id *)&self->_thumbSoftShadowLayer, 0);
  objc_storeStrong((id *)&self->_thumbContentLayer, 0);
  objc_storeStrong((id *)&self->_thumbClippingLayer, 0);
  objc_storeStrong((id *)&self->_trackView, 0);
  objc_storeStrong((id *)&self->_panGesture, 0);
  objc_storeStrong((id *)&self->_contextIdentifier, 0);
  objc_storeStrong((id *)&self->_styleCoordinator, 0);
}

@end