@interface PREditingColorSlider
- (CAGradientLayer)trackLayer;
- (CALayer)thumbContentLayer;
- (CALayer)thumbSoftShadowLayer;
- (CAShapeLayer)thumbBorderLayer;
- (CAShapeLayer)thumbClippingLayer;
- (CGColor)trackBorderColor;
- (NSString)contextIdentifier;
- (PREditingColorSlider)initWithVariationStore:(id)a3 contextIdentifier:(id)a4 pickerContext:(unint64_t)a5;
- (PREditingColorVariationStore)variationStore;
- (PREditorColorPickerColor)pickerColor;
- (PRPosterColor)currentColor;
- (PRPosterColor)displayCurrentColor;
- (UIColor)color1;
- (UIColor)color2;
- (UIColor)color3;
- (UIPanGestureRecognizer)panGesture;
- (UITapGestureRecognizer)tapGesture;
- (UIView)thumbView;
- (double)startPanOffset;
- (double)value;
- (double)variation;
- (id)createThumbView;
- (unint64_t)pickerContext;
- (void)_setSliderValue:(double)a3;
- (void)commonInit;
- (void)createTrackLayer;
- (void)didTapTrackView:(id)a3;
- (void)layoutSubviews;
- (void)layoutThumbView;
- (void)setColor1:(id)a3;
- (void)setColor2:(id)a3;
- (void)setColor3:(id)a3;
- (void)setContextIdentifier:(id)a3;
- (void)setCurrentColor:(id)a3;
- (void)setDisplayCurrentColor:(id)a3;
- (void)setPanGesture:(id)a3;
- (void)setPickerColor:(id)a3;
- (void)setPickerContext:(unint64_t)a3;
- (void)setStartPanOffset:(double)a3;
- (void)setTapGesture:(id)a3;
- (void)setThumbBorderLayer:(id)a3;
- (void)setThumbClippingLayer:(id)a3;
- (void)setThumbContentLayer:(id)a3;
- (void)setThumbSoftShadowLayer:(id)a3;
- (void)setThumbView:(id)a3;
- (void)setTrackLayer:(id)a3;
- (void)setValue:(double)a3;
- (void)setVariationStore:(id)a3;
- (void)thumbViewDidPan:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
- (void)updateCurrentColorForCurrentValue;
- (void)updateThumbForCurrentColor;
- (void)updateTrackLayerColors;
- (void)updateVariationInStore;
@end

@implementation PREditingColorSlider

- (PREditingColorSlider)initWithVariationStore:(id)a3 contextIdentifier:(id)a4 pickerContext:(unint64_t)a5
{
  id v9 = a3;
  id v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)PREditingColorSlider;
  v11 = -[PREditingColorSlider initWithFrame:](&v14, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_variationStore, a3);
    objc_storeStrong((id *)&v12->_contextIdentifier, a4);
    v12->_pickerContext = a5;
    [(PREditingColorSlider *)v12 commonInit];
  }

  return v12;
}

- (void)commonInit
{
  id v3 = [(PREditingColorSlider *)self createThumbView];
  [(PREditingColorSlider *)self createTrackLayer];
  v4 = (UIPanGestureRecognizer *)[objc_alloc(MEMORY[0x1E4FB1A58]) initWithTarget:self action:sel_thumbViewDidPan_];
  panGesture = self->_panGesture;
  self->_panGesture = v4;

  [(UIView *)self->_thumbView addGestureRecognizer:self->_panGesture];
  [(PREditingColorSlider *)self addSubview:self->_thumbView];
  v6 = [(PREditingColorSlider *)self layer];
  [v6 insertSublayer:self->_trackLayer atIndex:0];

  v7 = (UITapGestureRecognizer *)[objc_alloc(MEMORY[0x1E4FB1D38]) initWithTarget:self action:sel_didTapTrackView_];
  tapGesture = self->_tapGesture;
  self->_tapGesture = v7;

  [(PREditingColorSlider *)self addGestureRecognizer:self->_tapGesture];
  [(PREditingColorSlider *)self setClipsToBounds:0];
}

- (id)createThumbView
{
  thumbView = self->_thumbView;
  if (!thumbView)
  {
    v4 = (UIView *)objc_alloc_init(MEMORY[0x1E4FB1EB0]);
    v5 = self->_thumbView;
    self->_thumbView = v4;

    v6 = self->_thumbView;
    v7 = [MEMORY[0x1E4FB1618] clearColor];
    [(UIView *)v6 setBackgroundColor:v7];

    [(UIView *)self->_thumbView setContentMode:2];
    [(UIView *)self->_thumbView setClipsToBounds:0];
    v8 = [(UIView *)self->_thumbView layer];
    LODWORD(v9) = 1042536202;
    [v8 setShadowOpacity:v9];
    objc_msgSend(v8, "setShadowOffset:", 1.0, 5.5);
    [v8 setShadowRadius:3.5];
    id v10 = [MEMORY[0x1E4F39BE8] layer];
    thumbSoftShadowLayer = self->_thumbSoftShadowLayer;
    self->_thumbSoftShadowLayer = v10;

    LODWORD(v12) = 1042536202;
    [(CALayer *)self->_thumbSoftShadowLayer setShadowOpacity:v12];
    -[CALayer setShadowOffset:](self->_thumbSoftShadowLayer, "setShadowOffset:", 0.0, 0.0);
    [(CALayer *)self->_thumbSoftShadowLayer setShadowRadius:6.5];
    v13 = [(UIView *)self->_thumbView layer];
    [v13 addSublayer:self->_thumbSoftShadowLayer];

    objc_super v14 = [MEMORY[0x1E4F39BE8] layer];
    thumbContentLayer = self->_thumbContentLayer;
    self->_thumbContentLayer = v14;

    v16 = [(UIView *)self->_thumbView layer];
    [v16 addSublayer:self->_thumbContentLayer];

    v17 = (CAShapeLayer *)objc_alloc_init(MEMORY[0x1E4F39C88]);
    thumbBorderLayer = self->_thumbBorderLayer;
    self->_thumbBorderLayer = v17;

    v19 = self->_thumbBorderLayer;
    id v20 = [MEMORY[0x1E4FB1618] clearColor];
    -[CAShapeLayer setFillColor:](v19, "setFillColor:", [v20 CGColor]);

    v21 = self->_thumbBorderLayer;
    id v22 = [MEMORY[0x1E4FB1618] whiteColor];
    -[CAShapeLayer setStrokeColor:](v21, "setStrokeColor:", [v22 CGColor]);

    [(CAShapeLayer *)self->_thumbBorderLayer setLineWidth:2.0];
    v23 = [(UIView *)self->_thumbView layer];
    [v23 addSublayer:self->_thumbBorderLayer];

    v24 = (CAShapeLayer *)objc_alloc_init(MEMORY[0x1E4F39C88]);
    thumbClippingLayer = self->_thumbClippingLayer;
    self->_thumbClippingLayer = v24;

    [(CAShapeLayer *)self->_thumbClippingLayer setFillRule:*MEMORY[0x1E4F39FB8]];
    [(CALayer *)self->_thumbContentLayer setMask:self->_thumbClippingLayer];

    thumbView = self->_thumbView;
  }
  return thumbView;
}

- (void)createTrackLayer
{
  if (!self->_trackLayer)
  {
    id v3 = [MEMORY[0x1E4F39BD0] layer];
    -[CAGradientLayer setStartPoint:](v3, "setStartPoint:", 0.0, 0.5);
    -[CAGradientLayer setEndPoint:](v3, "setEndPoint:", 1.0, 0.5);
    [(CAGradientLayer *)v3 setCornerCurve:*MEMORY[0x1E4F39EA8]];
    trackLayer = self->_trackLayer;
    self->_trackLayer = v3;

    [(PREditingColorSlider *)self updateTrackLayerColors];
  }
}

- (void)updateTrackLayerColors
{
  v6[3] = *MEMORY[0x1E4F143B8];
  color1 = self->_color1;
  if (color1 && self->_color2)
  {
    if (self->_color3)
    {
      trackLayer = self->_trackLayer;
      v6[1] = [(UIColor *)self->_color2 CGColor];
      v6[2] = [(UIColor *)self->_color3 CGColor];
      v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:3];
      [(CAGradientLayer *)trackLayer setColors:v5];
    }
  }
}

- (void)layoutThumbView
{
  [(PREditingColorSlider *)self bounds];
  double v4 = v3;
  [(PREditingColorSlider *)self bounds];
  thumbView = self->_thumbView;
  double v7 = (v5 - v4) * 0.5 + self->_value * ((v5 - v4) * 0.5);
  -[UIView setFrame:](thumbView, "setFrame:", v7, 0.0, v4, v4);
}

- (void)layoutSubviews
{
  v47.receiver = self;
  v47.super_class = (Class)PREditingColorSlider;
  [(PREditingColorSlider *)&v47 layoutSubviews];
  thumbContentLayer = self->_thumbContentLayer;
  double v4 = [(UIView *)self->_thumbView layer];
  [v4 bounds];
  -[CALayer setFrame:](thumbContentLayer, "setFrame:");

  [(PREditingColorSlider *)self layoutThumbView];
  [(CAShapeLayer *)self->_thumbClippingLayer frame];
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  CGFloat v12 = v11;
  [(UIView *)self->_thumbView bounds];
  v53.origin.double x = v13;
  v53.origin.double y = v14;
  v53.size.double width = v15;
  v53.size.double height = v16;
  v48.origin.double x = v6;
  v48.origin.double y = v8;
  v48.size.double width = v10;
  v48.size.double height = v12;
  if (!CGRectEqualToRect(v48, v53))
  {
    thumbClippingLayer = self->_thumbClippingLayer;
    v18 = [(UIView *)self->_thumbView layer];
    [v18 bounds];
    -[CAShapeLayer setFrame:](thumbClippingLayer, "setFrame:");

    v19 = self->_thumbClippingLayer;
    id v20 = (void *)MEMORY[0x1E4FB14C0];
    v21 = [(UIView *)self->_thumbView layer];
    [v21 bounds];
    CGRect v50 = CGRectInset(v49, 1.0, 1.0);
    objc_msgSend(v20, "bezierPathWithOvalInRect:", v50.origin.x, v50.origin.y, v50.size.width, v50.size.height);
    id v22 = objc_claimAutoreleasedReturnValue();
    -[CAShapeLayer setPath:](v19, "setPath:", [v22 CGPath]);

    v23 = [(UIView *)self->_thumbView layer];
    [v23 bounds];
    CGFloat v25 = v24;
    CGFloat v27 = v26;
    CGFloat v29 = v28;
    CGFloat v31 = v30;
    [(CAShapeLayer *)self->_thumbBorderLayer lineWidth];
    CGFloat v33 = v32 * 0.5;
    [(CAShapeLayer *)self->_thumbBorderLayer lineWidth];
    CGFloat v35 = v34 * 0.5;
    v51.origin.double x = v25;
    v51.origin.double y = v27;
    v51.size.double width = v29;
    v51.size.double height = v31;
    CGRect v52 = CGRectInset(v51, v33, v35);
    double x = v52.origin.x;
    double y = v52.origin.y;
    double width = v52.size.width;
    double height = v52.size.height;

    thumbBorderLayer = self->_thumbBorderLayer;
    objc_msgSend(MEMORY[0x1E4FB14C0], "bezierPathWithOvalInRect:", x, y, width, height);
    id v41 = objc_claimAutoreleasedReturnValue();
    -[CAShapeLayer setPath:](thumbBorderLayer, "setPath:", [v41 CGPath]);

    v42 = self->_thumbBorderLayer;
    v43 = [(UIView *)self->_thumbView layer];
    [v43 bounds];
    -[CAShapeLayer setFrame:](v42, "setFrame:");

    v44 = [(UIView *)self->_thumbView layer];
    objc_msgSend(v44, "setShadowPath:", -[CAShapeLayer path](self->_thumbBorderLayer, "path"));

    [(CALayer *)self->_thumbSoftShadowLayer setShadowPath:[(CAShapeLayer *)self->_thumbBorderLayer path]];
  }
  if (self->_trackLayer)
  {
    [(PREditingColorSlider *)self bounds];
    double v46 = v45 * 0.444444444;
    -[CAGradientLayer setFrame:](self->_trackLayer, "setFrame:", 0.0, (v45 - v45 * 0.444444444) * 0.5);
    [(CAGradientLayer *)self->_trackLayer setCornerCurve:*MEMORY[0x1E4F39EA8]];
    [(CAGradientLayer *)self->_trackLayer setCornerRadius:v46 * 0.5];
    [(CAGradientLayer *)self->_trackLayer setBorderWidth:2.0];
    [(CAGradientLayer *)self->_trackLayer setBorderColor:[(PREditingColorSlider *)self trackBorderColor]];
  }
}

- (CGColor)trackBorderColor
{
  id v2 = [MEMORY[0x1E4FB1618] colorWithWhite:0.0 alpha:0.1];
  double v3 = (CGColor *)[v2 CGColor];

  return v3;
}

- (void)setPickerColor:(id)a3
{
  double v5 = (PREditorColorPickerColor *)a3;
  if (v5 && self->_pickerColor != v5)
  {
    v17 = v5;
    objc_storeStrong((id *)&self->_pickerColor, a3);
    CGFloat v6 = [(PREditorColorPickerColor *)v17 displayColorWithVariation:-1.0];
    double v7 = [v6 color];

    CGFloat v8 = [(PREditorColorPickerColor *)v17 displayColorWithVariation:0.0];
    double v9 = [v8 color];

    CGFloat v10 = [(PREditorColorPickerColor *)v17 displayColorWithVariation:1.0];
    double v11 = [v10 color];

    if (self->_color1 != v7) {
      objc_storeStrong((id *)&self->_color1, v7);
    }
    if (self->_color2 != v9) {
      objc_storeStrong((id *)&self->_color2, v9);
    }
    if (self->_color3 != v11) {
      objc_storeStrong((id *)&self->_color3, v11);
    }
    [(PREditorColorPickerColor *)v17 initialVariation];
    double v13 = v12;
    CGFloat v14 = [(PREditingColorVariationStore *)self->_variationStore variationForPickerColor:v17 forContextIdentifier:self->_contextIdentifier];
    CGFloat v15 = v14;
    if (v14)
    {
      [v14 doubleValue];
      double v13 = v16;
    }
    [(PREditingColorSlider *)self updateTrackLayerColors];
    [(PREditingColorSlider *)self _setSliderValue:v13];
  }
  MEMORY[0x1F4181820]();
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4 = a3;
  double v5 = [(PREditingColorSlider *)self traitCollection];
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
    double v12 = [(PREditingColorSlider *)self traitCollection];
    uint64_t v13 = [v12 layoutDirection];

    if (v13 == 1) {
      CATransform3DMakeRotation(&v16, 3.14159265, 0.0, 1.0, 0.0);
    }
    trackLayer = self->_trackLayer;
    CATransform3D v15 = v16;
    [(CAGradientLayer *)trackLayer setTransform:&v15];
  }
}

- (void)thumbViewDidPan:(id)a3
{
  id v17 = a3;
  if ([v17 state] == 1)
  {
    [(UIView *)self->_thumbView center];
    self->_startPanOffset = v4;
    [(PREditingColorSlider *)self bringSubviewToFront:self->_thumbView];
  }
  else if ([v17 state] == 2 || objc_msgSend(v17, "state") == 3)
  {
    [(PREditingColorSlider *)self bounds];
    double v6 = v5;
    [(UIView *)self->_thumbView bounds];
    double v8 = v7;
    [v17 translationInView:self];
    double v10 = v9 + self->_startPanOffset;
    [(UIView *)self->_thumbView bounds];
    double MidX = CGRectGetMidX(v19);
    if (v10 >= MidX) {
      double v12 = v10;
    }
    else {
      double v12 = MidX;
    }
    double v13 = v6 - MidX;
    if (v12 >= v13) {
      double v14 = v13;
    }
    else {
      double v14 = v12;
    }
    thumbView = self->_thumbView;
    [(UIView *)thumbView center];
    [(UIView *)thumbView setCenter:v14];
    [(UIView *)self->_thumbView frame];
    self->_value = v16 / (v6 - v8) - (1.0 - v16 / (v6 - v8));
    [(PREditingColorSlider *)self updateCurrentColorForCurrentValue];
    [(PREditingColorSlider *)self updateThumbForCurrentColor];
    if ([v17 state] == 3) {
      [(PREditingColorSlider *)self updateVariationInStore];
    }
    [(PREditingColorSlider *)self sendActionsForControlEvents:4096];
  }
}

- (void)didTapTrackView:(id)a3
{
  id v4 = a3;
  [(PREditingColorSlider *)self bounds];
  double v6 = v5;
  [(UIView *)self->_thumbView bounds];
  double v8 = v7;
  [v4 locationInView:self];
  double v10 = v9;

  [(UIView *)self->_thumbView bounds];
  double MidX = CGRectGetMidX(v26);
  if (v10 >= MidX) {
    double v12 = v10;
  }
  else {
    double v12 = MidX;
  }
  if (v12 >= v6 - MidX) {
    double v13 = v6 - MidX;
  }
  else {
    double v13 = v12;
  }
  double v14 = vabdd_f64(MidX, v10) / v6 * 0.25;
  if (v14 >= 0.1) {
    double v15 = v14;
  }
  else {
    double v15 = 0.1;
  }
  double v16 = self->_thumbView;
  id v17 = (void *)MEMORY[0x1E4FB1EB0];
  uint64_t v20 = MEMORY[0x1E4F143A8];
  uint64_t v21 = 3221225472;
  id v22 = __40__PREditingColorSlider_didTapTrackView___block_invoke;
  v23 = &unk_1E54DB6C8;
  double v24 = v16;
  double v25 = v13;
  v18 = v16;
  [v17 animateWithDuration:&v20 animations:v15];
  [(UIView *)self->_thumbView frame];
  self->_value = v19 / (v6 - v8) - (1.0 - v19 / (v6 - v8));
  [(PREditingColorSlider *)self updateCurrentColorForCurrentValue];
  [(PREditingColorSlider *)self updateThumbForCurrentColor];
  [(PREditingColorSlider *)self updateVariationInStore];
  [(PREditingColorSlider *)self sendActionsForControlEvents:4096];
}

uint64_t __40__PREditingColorSlider_didTapTrackView___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  double v2 = *(double *)(a1 + 40);
  [v1 center];
  return [v1 setCenter:v2];
}

- (void)_setSliderValue:(double)a3
{
  self->_value = a3;
  [(PREditingColorSlider *)self layoutThumbView];
  [(PREditingColorSlider *)self updateCurrentColorForCurrentValue];
  [(PREditingColorSlider *)self updateThumbForCurrentColor];
}

- (double)variation
{
  return self->_value;
}

- (void)updateVariationInStore
{
}

- (void)updateCurrentColorForCurrentValue
{
  id v8 = [(PREditingColorSlider *)self pickerColor];
  double v3 = [v8 colorWithVariation:self->_value];
  id v4 = [v8 displayColorWithVariation:self->_value];
  displayCurrentColor = self->_displayCurrentColor;
  self->_displayCurrentColor = v4;
  double v6 = v4;

  currentColor = self->_currentColor;
  self->_currentColor = v3;
}

- (void)updateThumbForCurrentColor
{
  [MEMORY[0x1E4F39CF8] begin];
  [MEMORY[0x1E4F39CF8] setDisableActions:1];
  thumbContentLayer = self->_thumbContentLayer;
  id v4 = [(PRPosterColor *)self->_displayCurrentColor color];
  -[CALayer setBackgroundColor:](thumbContentLayer, "setBackgroundColor:", [v4 CGColor]);

  double v5 = (void *)MEMORY[0x1E4F39CF8];
  [v5 commit];
}

- (PREditorColorPickerColor)pickerColor
{
  return self->_pickerColor;
}

- (PRPosterColor)currentColor
{
  return self->_currentColor;
}

- (void)setCurrentColor:(id)a3
{
}

- (double)value
{
  return self->_value;
}

- (void)setValue:(double)a3
{
  self->_value = a3;
}

- (UIColor)color1
{
  return self->_color1;
}

- (void)setColor1:(id)a3
{
}

- (UIColor)color2
{
  return self->_color2;
}

- (void)setColor2:(id)a3
{
}

- (UIColor)color3
{
  return self->_color3;
}

- (void)setColor3:(id)a3
{
}

- (PRPosterColor)displayCurrentColor
{
  return self->_displayCurrentColor;
}

- (void)setDisplayCurrentColor:(id)a3
{
}

- (PREditingColorVariationStore)variationStore
{
  return self->_variationStore;
}

- (void)setVariationStore:(id)a3
{
}

- (NSString)contextIdentifier
{
  return self->_contextIdentifier;
}

- (void)setContextIdentifier:(id)a3
{
}

- (unint64_t)pickerContext
{
  return self->_pickerContext;
}

- (void)setPickerContext:(unint64_t)a3
{
  self->_pickerContext = a3;
}

- (UIPanGestureRecognizer)panGesture
{
  return self->_panGesture;
}

- (void)setPanGesture:(id)a3
{
}

- (UITapGestureRecognizer)tapGesture
{
  return self->_tapGesture;
}

- (void)setTapGesture:(id)a3
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

- (CAGradientLayer)trackLayer
{
  return self->_trackLayer;
}

- (void)setTrackLayer:(id)a3
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

- (UIView)thumbView
{
  return self->_thumbView;
}

- (void)setThumbView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_thumbView, 0);
  objc_storeStrong((id *)&self->_thumbBorderLayer, 0);
  objc_storeStrong((id *)&self->_thumbSoftShadowLayer, 0);
  objc_storeStrong((id *)&self->_thumbContentLayer, 0);
  objc_storeStrong((id *)&self->_thumbClippingLayer, 0);
  objc_storeStrong((id *)&self->_trackLayer, 0);
  objc_storeStrong((id *)&self->_tapGesture, 0);
  objc_storeStrong((id *)&self->_panGesture, 0);
  objc_storeStrong((id *)&self->_contextIdentifier, 0);
  objc_storeStrong((id *)&self->_variationStore, 0);
  objc_storeStrong((id *)&self->_displayCurrentColor, 0);
  objc_storeStrong((id *)&self->_color3, 0);
  objc_storeStrong((id *)&self->_color2, 0);
  objc_storeStrong((id *)&self->_color1, 0);
  objc_storeStrong((id *)&self->_currentColor, 0);
  objc_storeStrong((id *)&self->_pickerColor, 0);
}

@end