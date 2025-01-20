@interface PUIStyleFontWeightSlider
- (CALayer)thumbContentLayer;
- (CALayer)thumbSoftShadowLayer;
- (CAShapeLayer)thumbBorderLayer;
- (CAShapeLayer)thumbClippingLayer;
- (CGRect)thumbRectForBounds:(CGRect)a3 trackRect:(CGRect)a4 value:(float)a5;
- (CGRect)trackRectForBounds:(CGRect)a3;
- (PUIStyleFontWeightSlider)init;
- (UIColor)contentBackgroundColor;
- (UIImageView)thumbView;
- (UITraitChangeRegistration)userInterfaceStyleTraitChangeRegistration;
- (id)_createCustomThumbView;
- (id)createThumbView;
- (void)dealloc;
- (void)layoutSubviews;
- (void)setContentBackgroundColor:(id)a3;
- (void)setThumbBorderLayer:(id)a3;
- (void)setThumbClippingLayer:(id)a3;
- (void)setThumbContentLayer:(id)a3;
- (void)setThumbSoftShadowLayer:(id)a3;
- (void)setThumbView:(id)a3;
- (void)setUserInterfaceStyleTraitChangeRegistration:(id)a3;
@end

@implementation PUIStyleFontWeightSlider

- (PUIStyleFontWeightSlider)init
{
  v18[1] = *MEMORY[0x263EF8340];
  v17.receiver = self;
  v17.super_class = (Class)PUIStyleFontWeightSlider;
  v2 = [(PUIStyleFontWeightSlider *)&v17 init];
  if (v2)
  {
    v3 = [MEMORY[0x263F1C550] clearColor];
    [(PUIStyleFontWeightSlider *)v2 setMinimumTrackTintColor:v3];

    v4 = [MEMORY[0x263F1C550] clearColor];
    [(PUIStyleFontWeightSlider *)v2 setMaximumTrackTintColor:v4];

    uint64_t v5 = [objc_alloc(MEMORY[0x263F1C550]) initWithDynamicProvider:&__block_literal_global_5];
    contentBackgroundColor = v2->_contentBackgroundColor;
    v2->_contentBackgroundColor = (UIColor *)v5;

    v7 = [[_PUIFontWeightSliderTrackView alloc] initWithTrackBackgroundColor:v2->_contentBackgroundColor];
    trackView = v2->_trackView;
    v2->_trackView = v7;

    [(PUIStyleFontWeightSlider *)v2 addSubview:v2->_trackView];
    [(PUIStyleFontWeightSlider *)v2 sendSubviewToBack:v2->_trackView];
    objc_initWeak(&location, v2);
    v9 = self;
    v18[0] = v9;
    v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v18 count:1];
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __32__PUIStyleFontWeightSlider_init__block_invoke_2;
    v14[3] = &unk_265470FD8;
    objc_copyWeak(&v15, &location);
    uint64_t v11 = [(PUIStyleFontWeightSlider *)v2 registerForTraitChanges:v10 withHandler:v14];
    userInterfaceStyleTraitChangeRegistration = v2->_userInterfaceStyleTraitChangeRegistration;
    v2->_userInterfaceStyleTraitChangeRegistration = (UITraitChangeRegistration *)v11;

    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);
  }
  return v2;
}

id __32__PUIStyleFontWeightSlider_init__block_invoke(uint64_t a1, void *a2)
{
  if ([a2 userInterfaceStyle] == 1) {
    uint64_t v2 = 2;
  }
  else {
    uint64_t v2 = 1;
  }
  v3 = [MEMORY[0x263F1C550] systemGray4Color];
  v4 = [MEMORY[0x263F1CB00] traitCollectionWithUserInterfaceStyle:v2];
  uint64_t v5 = [v3 resolvedColorWithTraitCollection:v4];

  return v5;
}

void __32__PUIStyleFontWeightSlider_init__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v4 = WeakRetained;
    uint64_t v2 = [WeakRetained thumbContentLayer];
    id v3 = [v4 contentBackgroundColor];
    objc_msgSend(v2, "setBackgroundColor:", objc_msgSend(v3, "CGColor"));

    id WeakRetained = v4;
  }
}

- (void)dealloc
{
  [(PUIStyleFontWeightSlider *)self unregisterForTraitChanges:self->_userInterfaceStyleTraitChangeRegistration];
  v3.receiver = self;
  v3.super_class = (Class)PUIStyleFontWeightSlider;
  [(PUIStyleFontWeightSlider *)&v3 dealloc];
}

- (void)layoutSubviews
{
  v49.receiver = self;
  v49.super_class = (Class)PUIStyleFontWeightSlider;
  [(PUIStyleFontWeightSlider *)&v49 layoutSubviews];
  thumbContentLayer = self->_thumbContentLayer;
  id v4 = [(UIImageView *)self->_thumbView layer];
  [v4 bounds];
  -[CALayer setFrame:](thumbContentLayer, "setFrame:");

  [(CAShapeLayer *)self->_thumbClippingLayer frame];
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  CGFloat v12 = v11;
  [(UIImageView *)self->_thumbView bounds];
  v55.origin.double x = v13;
  v55.origin.double y = v14;
  v55.size.double width = v15;
  v55.size.double height = v16;
  v50.origin.double x = v6;
  v50.origin.double y = v8;
  v50.size.double width = v10;
  v50.size.double height = v12;
  if (!CGRectEqualToRect(v50, v55))
  {
    thumbClippingLayer = self->_thumbClippingLayer;
    v18 = [(UIImageView *)self->_thumbView layer];
    [v18 bounds];
    -[CAShapeLayer setFrame:](thumbClippingLayer, "setFrame:");

    v19 = self->_thumbClippingLayer;
    v20 = (void *)MEMORY[0x263F1C478];
    v21 = [(UIImageView *)self->_thumbView layer];
    [v21 bounds];
    CGRect v52 = CGRectInset(v51, 1.0, 1.0);
    objc_msgSend(v20, "bezierPathWithOvalInRect:", v52.origin.x, v52.origin.y, v52.size.width, v52.size.height);
    id v22 = objc_claimAutoreleasedReturnValue();
    -[CAShapeLayer setPath:](v19, "setPath:", [v22 CGPath]);

    v23 = [(UIImageView *)self->_thumbView layer];
    [v23 bounds];
    CGFloat v25 = v24;
    CGFloat v27 = v26;
    CGFloat v29 = v28;
    CGFloat v31 = v30;
    [(CAShapeLayer *)self->_thumbBorderLayer lineWidth];
    CGFloat v33 = v32 * 0.5;
    [(CAShapeLayer *)self->_thumbBorderLayer lineWidth];
    CGFloat v35 = v34 * 0.5;
    v53.origin.double x = v25;
    v53.origin.double y = v27;
    v53.size.double width = v29;
    v53.size.double height = v31;
    CGRect v54 = CGRectInset(v53, v33, v35);
    double x = v54.origin.x;
    double y = v54.origin.y;
    double width = v54.size.width;
    double height = v54.size.height;

    thumbBorderLayer = self->_thumbBorderLayer;
    objc_msgSend(MEMORY[0x263F1C478], "bezierPathWithOvalInRect:", x, y, width, height);
    id v41 = objc_claimAutoreleasedReturnValue();
    -[CAShapeLayer setPath:](thumbBorderLayer, "setPath:", [v41 CGPath]);

    v42 = self->_thumbBorderLayer;
    v43 = [(UIImageView *)self->_thumbView layer];
    [v43 bounds];
    -[CAShapeLayer setFrame:](v42, "setFrame:");

    v44 = [(UIImageView *)self->_thumbView layer];
    objc_msgSend(v44, "setShadowPath:", -[CAShapeLayer path](self->_thumbBorderLayer, "path"));

    [(CALayer *)self->_thumbSoftShadowLayer setShadowPath:[(CAShapeLayer *)self->_thumbBorderLayer path]];
  }
  [(PUIStyleFontWeightSlider *)self bounds];
  -[PUIStyleFontWeightSlider trackRectForBounds:](self, "trackRectForBounds:");
  double v46 = v45;
  double v48 = v47;
  [(PUIStyleFontWeightSlider *)self bounds];
  -[_PUIFontWeightSliderTrackView setFrame:](self->_trackView, "setFrame:", v46, 0.0, v48);
}

- (id)_createCustomThumbView
{
  thumbView = self->_thumbView;
  if (!thumbView)
  {
    id v4 = (UIImageView *)objc_alloc_init(MEMORY[0x263F1C6D0]);
    double v5 = self->_thumbView;
    self->_thumbView = v4;

    CGFloat v6 = self->_thumbView;
    double v7 = [MEMORY[0x263F1C550] clearColor];
    [(UIImageView *)v6 setBackgroundColor:v7];

    [(UIImageView *)self->_thumbView setContentMode:2];
    [(UIImageView *)self->_thumbView setClipsToBounds:0];
    CGFloat v8 = [(UIImageView *)self->_thumbView layer];
    [v8 setHitTestsAsOpaque:1];

    double v9 = [(UIImageView *)self->_thumbView layer];
    LODWORD(v10) = 1042536202;
    [v9 setShadowOpacity:v10];
    objc_msgSend(v9, "setShadowOffset:", 1.0, 5.5);
    [v9 setShadowRadius:3.5];
    double v11 = [MEMORY[0x263F157E8] layer];
    thumbSoftShadowLayer = self->_thumbSoftShadowLayer;
    self->_thumbSoftShadowLayer = v11;

    LODWORD(v13) = 1042536202;
    [(CALayer *)self->_thumbSoftShadowLayer setShadowOpacity:v13];
    -[CALayer setShadowOffset:](self->_thumbSoftShadowLayer, "setShadowOffset:", 0.0, 0.0);
    [(CALayer *)self->_thumbSoftShadowLayer setShadowRadius:6.5];
    CGFloat v14 = [(UIImageView *)self->_thumbView layer];
    [v14 addSublayer:self->_thumbSoftShadowLayer];

    CGFloat v15 = [MEMORY[0x263F157E8] layer];
    thumbContentLayer = self->_thumbContentLayer;
    self->_thumbContentLayer = v15;

    [(CALayer *)self->_thumbContentLayer setBackgroundColor:[(UIColor *)self->_contentBackgroundColor CGColor]];
    objc_super v17 = [(UIImageView *)self->_thumbView layer];
    [v17 addSublayer:self->_thumbContentLayer];

    v18 = (CAShapeLayer *)objc_alloc_init(MEMORY[0x263F15880]);
    thumbBorderLayer = self->_thumbBorderLayer;
    self->_thumbBorderLayer = v18;

    v20 = self->_thumbBorderLayer;
    id v21 = [MEMORY[0x263F1C550] clearColor];
    -[CAShapeLayer setFillColor:](v20, "setFillColor:", [v21 CGColor]);

    id v22 = self->_thumbBorderLayer;
    id v23 = [MEMORY[0x263F1C550] whiteColor];
    -[CAShapeLayer setStrokeColor:](v22, "setStrokeColor:", [v23 CGColor]);

    [(CAShapeLayer *)self->_thumbBorderLayer setLineWidth:2.0];
    double v24 = [(UIImageView *)self->_thumbView layer];
    [v24 addSublayer:self->_thumbBorderLayer];

    CGFloat v25 = (CAShapeLayer *)objc_alloc_init(MEMORY[0x263F15880]);
    thumbClippingLayer = self->_thumbClippingLayer;
    self->_thumbClippingLayer = v25;

    [(CAShapeLayer *)self->_thumbClippingLayer setFillRule:*MEMORY[0x263F15AC0]];
    [(CALayer *)self->_thumbContentLayer setMask:self->_thumbClippingLayer];

    thumbView = self->_thumbView;
  }
  return thumbView;
}

- (id)createThumbView
{
  return (id)objc_claimAutoreleasedReturnValue();
}

- (CGRect)thumbRectForBounds:(CGRect)a3 trackRect:(CGRect)a4 value:(float)a5
{
  v6.receiver = self;
  v6.super_class = (Class)PUIStyleFontWeightSlider;
  -[PUIStyleFontWeightSlider thumbRectForBounds:trackRect:value:](&v6, sel_thumbRectForBounds_trackRect_value_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height, LODWORD(a5));
  return CGRectInset(v7, (v7.size.width + -34.0) * 0.5, (v7.size.width + -34.0) * 0.5);
}

- (CGRect)trackRectForBounds:(CGRect)a3
{
  v9.receiver = self;
  v9.super_class = (Class)PUIStyleFontWeightSlider;
  -[PUIStyleFontWeightSlider trackRectForBounds:](&v9, sel_trackRectForBounds_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  double v6 = v5 + -3.0;
  double v8 = v7 + 6.0;
  result.size.double height = v4;
  result.size.double width = v8;
  result.origin.double y = v3;
  result.origin.double x = v6;
  return result;
}

- (UIImageView)thumbView
{
  return self->_thumbView;
}

- (void)setThumbView:(id)a3
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

- (UIColor)contentBackgroundColor
{
  return self->_contentBackgroundColor;
}

- (void)setContentBackgroundColor:(id)a3
{
}

- (UITraitChangeRegistration)userInterfaceStyleTraitChangeRegistration
{
  return self->_userInterfaceStyleTraitChangeRegistration;
}

- (void)setUserInterfaceStyleTraitChangeRegistration:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userInterfaceStyleTraitChangeRegistration, 0);
  objc_storeStrong((id *)&self->_contentBackgroundColor, 0);
  objc_storeStrong((id *)&self->_thumbBorderLayer, 0);
  objc_storeStrong((id *)&self->_thumbSoftShadowLayer, 0);
  objc_storeStrong((id *)&self->_thumbContentLayer, 0);
  objc_storeStrong((id *)&self->_thumbClippingLayer, 0);
  objc_storeStrong((id *)&self->_thumbView, 0);
  objc_storeStrong((id *)&self->_trackView, 0);
}

@end