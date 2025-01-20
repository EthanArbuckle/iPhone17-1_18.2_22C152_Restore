@interface PUPhotoEditCircularIndicatorView
- (CAShapeLayer)backgroundLayer;
- (CAShapeLayer)progressLayer;
- (PUPhotoEditCircularIndicatorView)initWithFrame:(CGRect)a3;
- (UIColor)ringColor;
- (double)currentValue;
- (double)maxValue;
- (double)minValue;
- (double)thickness;
- (void)_layoutSubLayers;
- (void)_setupLayers;
- (void)_updateProgressLayer;
- (void)layoutSubviews;
- (void)resetToDefaults;
- (void)setBackgroundLayer:(id)a3;
- (void)setCurrentValue:(double)a3;
- (void)setMaxValue:(double)a3;
- (void)setMinValue:(double)a3;
- (void)setProgressLayer:(id)a3;
- (void)setRingColor:(id)a3;
- (void)setThickness:(double)a3;
@end

@implementation PUPhotoEditCircularIndicatorView

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_progressLayer, 0);
  objc_storeStrong((id *)&self->_backgroundLayer, 0);
}

- (void)setProgressLayer:(id)a3
{
}

- (CAShapeLayer)progressLayer
{
  return self->_progressLayer;
}

- (void)setBackgroundLayer:(id)a3
{
}

- (CAShapeLayer)backgroundLayer
{
  return self->_backgroundLayer;
}

- (void)setMaxValue:(double)a3
{
  self->_maxValue = a3;
}

- (double)maxValue
{
  return self->_maxValue;
}

- (void)setMinValue:(double)a3
{
  self->_minValue = a3;
}

- (double)minValue
{
  return self->_minValue;
}

- (double)currentValue
{
  return self->_currentValue;
}

- (double)thickness
{
  return self->_thickness;
}

- (void)resetToDefaults
{
  self->_minValue = -1.0;
  self->_maxValue = 1.0;
  self->_currentValue = 0.0;
  [(PUPhotoEditCircularIndicatorView *)self _updateProgressLayer];
}

- (void)setCurrentValue:(double)a3
{
  [(PUPhotoEditCircularIndicatorView *)self minValue];
  [(PUPhotoEditCircularIndicatorView *)self maxValue];
  PXClamp();
  if (self->_currentValue != a3)
  {
    self->_currentValue = a3;
    [(PUPhotoEditCircularIndicatorView *)self _updateProgressLayer];
  }
}

- (void)_updateProgressLayer
{
  uint64_t v3 = [MEMORY[0x1E4F39CF8] disableActions];
  [MEMORY[0x1E4F39CF8] setDisableActions:1];
  [(PUPhotoEditCircularIndicatorView *)self currentValue];
  if (v4 == 0.0)
  {
    v5 = [(PUPhotoEditCircularIndicatorView *)self progressLayer];
    [v5 setStrokeEnd:0.0];

    v6 = [(PUPhotoEditCircularIndicatorView *)self progressLayer];
    v7 = v6;
    double v8 = 0.0;
LABEL_5:
    [v6 setStrokeStart:v8];
    goto LABEL_9;
  }
  [(PUPhotoEditCircularIndicatorView *)self currentValue];
  double v10 = v9;
  v11 = [(PUPhotoEditCircularIndicatorView *)self progressLayer];
  v12 = v11;
  if (v10 < 0.0)
  {
    [v11 setStrokeEnd:1.0];

    [(PUPhotoEditCircularIndicatorView *)self currentValue];
    double v14 = v13 + 1.0;
    v6 = [(PUPhotoEditCircularIndicatorView *)self progressLayer];
    v7 = v6;
    double v8 = v14;
    goto LABEL_5;
  }
  [v11 setStrokeStart:0.0];

  [(PUPhotoEditCircularIndicatorView *)self currentValue];
  double v16 = v15;
  v17 = [(PUPhotoEditCircularIndicatorView *)self progressLayer];
  [v17 setStrokeEnd:v16];

  v7 = [(PUPhotoEditCircularIndicatorView *)self progressLayer];
  [v7 strokeEnd];
  v18 = (uint64_t *)MEMORY[0x1E4F3A450];
  if (v19 != 1.0) {
    v18 = (uint64_t *)MEMORY[0x1E4F3A458];
  }
  uint64_t v20 = *v18;
  v21 = [(PUPhotoEditCircularIndicatorView *)self progressLayer];
  [v21 setLineCap:v20];

LABEL_9:
  v22 = (void *)MEMORY[0x1E4F39CF8];
  [v22 setDisableActions:v3];
}

- (UIColor)ringColor
{
  v2 = (void *)MEMORY[0x1E4FB1618];
  uint64_t v3 = [(PUPhotoEditCircularIndicatorView *)self progressLayer];
  double v4 = objc_msgSend(v2, "colorWithCGColor:", objc_msgSend(v3, "strokeColor"));

  return (UIColor *)v4;
}

- (void)setRingColor:(id)a3
{
  id v4 = a3;
  id v5 = [v4 colorWithAlphaComponent:0.3];
  uint64_t v6 = [v5 CGColor];
  v7 = [(PUPhotoEditCircularIndicatorView *)self backgroundLayer];
  [v7 setStrokeColor:v6];

  id v8 = v4;
  uint64_t v9 = [v8 CGColor];

  id v10 = [(PUPhotoEditCircularIndicatorView *)self progressLayer];
  [v10 setStrokeColor:v9];
}

- (void)setThickness:(double)a3
{
  if (self->_thickness != a3)
  {
    id v5 = [(PUPhotoEditCircularIndicatorView *)self backgroundLayer];
    [v5 setLineWidth:a3];

    uint64_t v6 = [(PUPhotoEditCircularIndicatorView *)self progressLayer];
    [v6 setLineWidth:a3 + -0.5];

    [(PUPhotoEditCircularIndicatorView *)self setNeedsLayout];
  }
}

- (void)_layoutSubLayers
{
  [(PUPhotoEditCircularIndicatorView *)self bounds];
  double v4 = v3 + -2.5;
  [(PUPhotoEditCircularIndicatorView *)self bounds];
  double v6 = v5 + -2.5;
  objc_msgSend(MEMORY[0x1E4FB14C0], "_bezierPathWithPillRect:cornerRadius:", 0.0, 0.0, v4, v5 + -2.5, v4 * 0.5);
  id v7 = objc_claimAutoreleasedReturnValue();
  uint64_t v8 = [v7 CGPath];

  uint64_t v9 = [(PUPhotoEditCircularIndicatorView *)self backgroundLayer];
  objc_msgSend(v9, "setFrame:", 0.0, 0.0, v4, v6);

  id v10 = [(PUPhotoEditCircularIndicatorView *)self backgroundLayer];
  [v10 setPath:v8];

  [(PUPhotoEditCircularIndicatorView *)self bounds];
  PXRectGetCenter();
  double v12 = v11;
  double v14 = v13;
  double v15 = [(PUPhotoEditCircularIndicatorView *)self backgroundLayer];
  objc_msgSend(v15, "setPosition:", v12, v14);

  double v16 = [(PUPhotoEditCircularIndicatorView *)self progressLayer];
  objc_msgSend(v16, "setFrame:", 0.0, 0.0, v4, v6);

  v17 = [(PUPhotoEditCircularIndicatorView *)self progressLayer];
  [v17 setPath:v8];

  id v23 = [(PUPhotoEditCircularIndicatorView *)self backgroundLayer];
  [v23 position];
  double v19 = v18;
  double v21 = v20;
  v22 = [(PUPhotoEditCircularIndicatorView *)self progressLayer];
  objc_msgSend(v22, "setPosition:", v19, v21);
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)PUPhotoEditCircularIndicatorView;
  [(PUPhotoEditCircularIndicatorView *)&v3 layoutSubviews];
  [(PUPhotoEditCircularIndicatorView *)self _layoutSubLayers];
}

- (void)_setupLayers
{
  objc_super v3 = [MEMORY[0x1E4F39C88] layer];
  [(PUPhotoEditCircularIndicatorView *)self setBackgroundLayer:v3];

  double v4 = [(PUPhotoEditCircularIndicatorView *)self backgroundLayer];
  [v4 setFillColor:0];

  double v5 = [(PUPhotoEditCircularIndicatorView *)self backgroundLayer];
  [v5 setStrokeEnd:1.0];

  double v6 = [(PUPhotoEditCircularIndicatorView *)self backgroundLayer];
  [v6 setLineWidth:2.5];

  id v7 = [(PUPhotoEditCircularIndicatorView *)self layer];
  uint64_t v8 = [(PUPhotoEditCircularIndicatorView *)self backgroundLayer];
  [v7 addSublayer:v8];

  uint64_t v9 = [MEMORY[0x1E4F39C88] layer];
  [(PUPhotoEditCircularIndicatorView *)self setProgressLayer:v9];

  id v10 = [(PUPhotoEditCircularIndicatorView *)self progressLayer];
  [v10 setFillColor:0];

  double v11 = [(PUPhotoEditCircularIndicatorView *)self progressLayer];
  [v11 setLineWidth:2.0];

  uint64_t v12 = *MEMORY[0x1E4F3A458];
  double v13 = [(PUPhotoEditCircularIndicatorView *)self progressLayer];
  [v13 setLineCap:v12];

  double v14 = [(PUPhotoEditCircularIndicatorView *)self progressLayer];
  [v14 setStrokeEnd:0.0];

  id v16 = [(PUPhotoEditCircularIndicatorView *)self layer];
  double v15 = [(PUPhotoEditCircularIndicatorView *)self progressLayer];
  [v16 addSublayer:v15];
}

- (PUPhotoEditCircularIndicatorView)initWithFrame:(CGRect)a3
{
  v9.receiver = self;
  v9.super_class = (Class)PUPhotoEditCircularIndicatorView;
  objc_super v3 = -[PUPhotoEditCircularIndicatorView initWithFrame:](&v9, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    double v4 = +[PUInterfaceManager currentTheme];
    [(PUPhotoEditCircularIndicatorView *)v3 _setupLayers];
    double v5 = +[PUPhotoEditProtoSettings sharedInstance];
    [v5 strokeWidth];
    -[PUPhotoEditCircularIndicatorView setThickness:](v3, "setThickness:");

    v3->_minValue = -1.0;
    v3->_maxValue = 1.0;
    v3->_currentValue = 0.0;
    id v6 = [v4 photoEditingCircularIndicatorBackgroundStrokeColor];
    -[CAShapeLayer setStrokeColor:](v3->_backgroundLayer, "setStrokeColor:", [v6 CGColor]);

    id v7 = [v4 photoEditingCircularIndicatorProgressStrokeColor];
    -[CAShapeLayer setStrokeColor:](v3->_progressLayer, "setStrokeColor:", [v7 CGColor]);
  }
  return v3;
}

@end