@interface VSCircularProgressView
- (BOOL)isIndeterminate;
- (CAShapeLayer)centerLayer;
- (CAShapeLayer)indeterminateLayer;
- (CAShapeLayer)progressBackgroundLayer;
- (CAShapeLayer)progressLayer;
- (CGRect)_progressFrame;
- (CGSize)sizeThatFits:(CGSize)a3;
- (UIColor)progressBgColor;
- (UIColor)progressFillColor;
- (VSCircularProgressView)initWithFrame:(CGRect)a3;
- (double)centerSquareWidth;
- (double)indeterminateWidth;
- (double)progress;
- (double)progressWidth;
- (id)_indeterminatePath;
- (id)_progressPath;
- (void)_addIndeterminateLayer;
- (void)_addProgressLayer;
- (void)_applicationWillEnterForeground:(id)a3;
- (void)_configureProgress:(BOOL)a3;
- (void)_removeIndeterminateLayer;
- (void)_removeProgressLayer;
- (void)_startIndeterminateAnimation;
- (void)dealloc;
- (void)didMoveToWindow;
- (void)layoutSubviews;
- (void)setCenterLayer:(id)a3;
- (void)setCenterSquareWidth:(double)a3;
- (void)setIndeterminate:(BOOL)a3;
- (void)setIndeterminateLayer:(id)a3;
- (void)setIndeterminateWidth:(double)a3;
- (void)setProgress:(double)a3;
- (void)setProgressBackgroundLayer:(id)a3;
- (void)setProgressBgColor:(id)a3;
- (void)setProgressFillColor:(id)a3;
- (void)setProgressLayer:(id)a3;
- (void)setProgressWidth:(double)a3;
- (void)tintColorDidChange;
@end

@implementation VSCircularProgressView

- (VSCircularProgressView)initWithFrame:(CGRect)a3
{
  v14[1] = *MEMORY[0x263EF8340];
  v13.receiver = self;
  v13.super_class = (Class)VSCircularProgressView;
  v3 = -[VSCircularProgressView initWithFrame:](&v13, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v3->_progressWidth = 2.0;
    v3->_indeterminateWidth = 2.0;
    v3->_centerSquareWidth = 8.0;
    uint64_t v5 = [MEMORY[0x263F1C550] systemBlueColor];
    progressFillColor = v4->_progressFillColor;
    v4->_progressFillColor = (UIColor *)v5;

    uint64_t v7 = [MEMORY[0x263F1C550] systemLightGrayColor];
    progressBgColor = v4->_progressBgColor;
    v4->_progressBgColor = (UIColor *)v7;

    [(VSCircularProgressView *)v4 setClipsToBounds:1];
    v9 = [MEMORY[0x263F08A00] defaultCenter];
    [v9 addObserver:v4 selector:sel__applicationWillEnterForeground_ name:*MEMORY[0x263F1D0D0] object:0];

    v14[0] = objc_opt_class();
    v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v14 count:1];
    id v11 = (id)[(VSCircularProgressView *)v4 registerForTraitChanges:v10 withHandler:&__block_literal_global_21];
  }
  return v4;
}

void __40__VSCircularProgressView_initWithFrame___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  id v6 = v4;
  objc_initWeak(&location, v6);
  uint64_t v7 = [v6 traitCollection];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __40__VSCircularProgressView_initWithFrame___block_invoke_2;
  v8[3] = &unk_2650774D0;
  objc_copyWeak(&v9, &location);
  [v7 performAsCurrentTraitCollection:v8];

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __40__VSCircularProgressView_initWithFrame___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = [WeakRetained indeterminateLayer];
  id v2 = [WeakRetained tintColor];
  objc_msgSend(v1, "setStrokeColor:", objc_msgSend(v2, "CGColor"));

  v3 = [WeakRetained centerLayer];
  id v4 = [WeakRetained progressFillColor];
  objc_msgSend(v3, "setBackgroundColor:", objc_msgSend(v4, "CGColor"));

  id v5 = [WeakRetained progressLayer];
  id v6 = [WeakRetained progressFillColor];
  objc_msgSend(v5, "setStrokeColor:", objc_msgSend(v6, "CGColor"));

  uint64_t v7 = [WeakRetained progressBackgroundLayer];
  id v8 = [WeakRetained progressBgColor];
  objc_msgSend(v7, "setStrokeColor:", objc_msgSend(v8, "CGColor"));
}

- (void)dealloc
{
  v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)VSCircularProgressView;
  [(VSCircularProgressView *)&v4 dealloc];
}

- (void)layoutSubviews
{
  v51.receiver = self;
  v51.super_class = (Class)VSCircularProgressView;
  [(VSCircularProgressView *)&v51 layoutSubviews];
  v3 = [(VSCircularProgressView *)self progressLayer];

  if (v3)
  {
    [(VSCircularProgressView *)self _progressFrame];
    double v5 = v4;
    double v7 = v6;
    double v9 = v8;
    double v11 = v10;
    v12 = [(VSCircularProgressView *)self progressLayer];
    objc_msgSend(v12, "setFrame:", v5, v7, v9, v11);

    objc_super v13 = [(VSCircularProgressView *)self progressBackgroundLayer];
    objc_msgSend(v13, "setFrame:", v5, v7, v9, v11);

    v14 = [(VSCircularProgressView *)self progressLayer];
    id v15 = [(VSCircularProgressView *)self _progressPath];
    objc_msgSend(v14, "setPath:", objc_msgSend(v15, "CGPath"));

    v16 = [(VSCircularProgressView *)self progressBackgroundLayer];
    id v17 = [(VSCircularProgressView *)self _progressPath];
    objc_msgSend(v16, "setPath:", objc_msgSend(v17, "CGPath"));

    [(VSCircularProgressView *)self centerSquareWidth];
    double v19 = v18;
    [(VSCircularProgressView *)self centerSquareWidth];
    double v21 = v20;
    [(VSCircularProgressView *)self bounds];
    double v23 = v22;
    [(VSCircularProgressView *)self centerSquareWidth];
    double v25 = (v23 - v24) * 0.5;
    [(VSCircularProgressView *)self bounds];
    double v27 = v26;
    [(VSCircularProgressView *)self centerSquareWidth];
    double v29 = (v27 - v28) * 0.5;
    v30 = [(VSCircularProgressView *)self centerLayer];
    objc_msgSend(v30, "setFrame:", v25, v29, v19, v21);
  }
  v31 = [(VSCircularProgressView *)self indeterminateLayer];

  if (v31)
  {
    [(VSCircularProgressView *)self indeterminateWidth];
    UIEdgeInsetsMakeWithEdges();
    double v33 = v32;
    double v35 = v34;
    double v37 = v36;
    double v39 = v38;
    [(VSCircularProgressView *)self bounds];
    double v41 = v35 + v40;
    double v43 = v33 + v42;
    double v45 = v44 - (v35 + v39);
    double v47 = v46 - (v33 + v37);
    v48 = [(VSCircularProgressView *)self indeterminateLayer];
    objc_msgSend(v48, "setFrame:", v41, v43, v45, v47);

    v49 = [(VSCircularProgressView *)self indeterminateLayer];
    id v50 = [(VSCircularProgressView *)self _indeterminatePath];
    objc_msgSend(v49, "setPath:", objc_msgSend(v50, "CGPath"));
  }
}

- (void)didMoveToWindow
{
  v3.receiver = self;
  v3.super_class = (Class)VSCircularProgressView;
  [(VSCircularProgressView *)&v3 didMoveToWindow];
  [(VSCircularProgressView *)self _configureProgress:[(VSCircularProgressView *)self isIndeterminate]];
}

- (void)tintColorDidChange
{
  if ([(VSCircularProgressView *)self isIndeterminate])
  {
    objc_super v3 = [(VSCircularProgressView *)self tintColor];
    double v4 = [(VSCircularProgressView *)self traitCollection];
    id v5 = [v3 resolvedColorWithTraitCollection:v4];
    uint64_t v6 = [v5 CGColor];

    id v7 = [(VSCircularProgressView *)self indeterminateLayer];
    [v7 setStrokeColor:v6];
  }
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double width = a3.width;
  double v4 = 28.0;
  if (width == 0.0)
  {
    double v7 = 28.0;
  }
  else
  {
    if (width > 28.0) {
      double width = 28.0;
    }
    if (a3.height <= 28.0) {
      double height = a3.height;
    }
    else {
      double height = 28.0;
    }
    BOOL v6 = a3.height == 0.0;
    if (a3.height == 0.0) {
      double v7 = 28.0;
    }
    else {
      double v7 = height;
    }
    if (!v6) {
      double v4 = width;
    }
  }
  result.double height = v7;
  result.double width = v4;
  return result;
}

- (void)setIndeterminate:(BOOL)a3
{
  if (self->_indeterminate != a3)
  {
    BOOL v3 = a3;
    self->_indeterminate = a3;
    if ([(VSCircularProgressView *)self _isInAWindow]) {
      [(VSCircularProgressView *)self _configureProgress:v3];
    }
    [(VSCircularProgressView *)self setNeedsLayout];
  }
}

- (void)setProgress:(double)a3
{
  if (self->_progress != a3)
  {
    self->_progress = a3;
    id v5 = [(VSCircularProgressView *)self progressLayer];

    if (!v5) {
      [(VSCircularProgressView *)self _addProgressLayer];
    }
    double v6 = 1.0;
    if (a3 <= 0.99)
    {
      if (a3 <= 0.0) {
        double v6 = 0.0;
      }
      else {
        double v6 = a3;
      }
    }
    double v7 = [(VSCircularProgressView *)self progressLayer];
    [v7 setStrokeEnd:v6];

    [(VSCircularProgressView *)self setNeedsDisplay];
  }
}

- (void)setProgressFillColor:(id)a3
{
  id v5 = (UIColor *)a3;
  if (self->_progressFillColor != v5)
  {
    objc_storeStrong((id *)&self->_progressFillColor, a3);
    objc_initWeak(&location, self);
    double v6 = [(VSCircularProgressView *)self traitCollection];
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __47__VSCircularProgressView_setProgressFillColor___block_invoke;
    v7[3] = &unk_265076DA0;
    objc_copyWeak(&v9, &location);
    double v8 = v5;
    [v6 performAsCurrentTraitCollection:v7];

    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
  }
}

void __47__VSCircularProgressView_setProgressFillColor___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v2 = [WeakRetained centerLayer];
  objc_msgSend(v2, "setBackgroundColor:", objc_msgSend(*(id *)(a1 + 32), "CGColor"));

  BOOL v3 = [WeakRetained progressLayer];
  objc_msgSend(v3, "setStrokeColor:", objc_msgSend(*(id *)(a1 + 32), "CGColor"));
}

- (void)setProgressBgColor:(id)a3
{
  double v8 = (UIColor *)a3;
  if (self->_progressBgColor != v8)
  {
    objc_storeStrong((id *)&self->_progressBgColor, a3);
    id v5 = [(VSCircularProgressView *)self progressBackgroundLayer];
    double v6 = [(VSCircularProgressView *)self traitCollection];
    id v7 = [(UIColor *)v8 resolvedColorWithTraitCollection:v6];
    objc_msgSend(v5, "setStrokeColor:", objc_msgSend(v7, "CGColor"));
  }
}

- (void)_configureProgress:(BOOL)a3
{
  if (a3)
  {
    [(VSCircularProgressView *)self _addIndeterminateLayer];
    [(VSCircularProgressView *)self _removeProgressLayer];
    [(VSCircularProgressView *)self _startIndeterminateAnimation];
  }
  else
  {
    [(VSCircularProgressView *)self _removeIndeterminateLayer];
    [(VSCircularProgressView *)self _addProgressLayer];
  }
  [(VSCircularProgressView *)self setNeedsLayout];
}

- (CGRect)_progressFrame
{
  [(VSCircularProgressView *)self progressWidth];
  UIEdgeInsetsMakeWithEdges();
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  [(VSCircularProgressView *)self bounds];
  double v12 = v6 + v11;
  double v14 = v4 + v13;
  double v16 = v15 - (v6 + v10);
  double v18 = v17 - (v4 + v8);
  result.size.double height = v18;
  result.size.double width = v16;
  result.origin.y = v14;
  result.origin.x = v12;
  return result;
}

- (id)_progressPath
{
  [(VSCircularProgressView *)self _progressFrame];
  double v3 = (void *)MEMORY[0x263F1C478];
  return (id)objc_msgSend(v3, "bezierPathWithArcCenter:radius:startAngle:endAngle:clockwise:", 1, v2 * 0.5);
}

- (void)_addProgressLayer
{
  double v3 = [(VSCircularProgressView *)self progressLayer];

  if (!v3)
  {
    id v4 = objc_alloc_init(MEMORY[0x263F15880]);
    [v4 setCornerRadius:1.5];
    double v5 = [(VSCircularProgressView *)self layer];
    [v5 addSublayer:v4];

    [(VSCircularProgressView *)self setCenterLayer:v4];
    id v6 = objc_alloc_init(MEMORY[0x263F15880]);
    [(VSCircularProgressView *)self progressWidth];
    objc_msgSend(v6, "setLineWidth:");
    id v7 = [MEMORY[0x263F1C550] clearColor];
    objc_msgSend(v6, "setFillColor:", objc_msgSend(v7, "CGColor"));

    id v8 = [(VSCircularProgressView *)self _progressPath];
    objc_msgSend(v6, "setPath:", objc_msgSend(v8, "CGPath"));

    double v9 = [(VSCircularProgressView *)self layer];
    [v9 addSublayer:v6];

    [(VSCircularProgressView *)self setProgressBackgroundLayer:v6];
    id v10 = objc_alloc_init(MEMORY[0x263F15880]);
    id v11 = [MEMORY[0x263F1C550] clearColor];
    objc_msgSend(v10, "setFillColor:", objc_msgSend(v11, "CGColor"));

    [(VSCircularProgressView *)self progressWidth];
    objc_msgSend(v10, "setLineWidth:");
    [v10 setLineCap:*MEMORY[0x263F15E70]];
    id v12 = [(VSCircularProgressView *)self _progressPath];
    objc_msgSend(v10, "setPath:", objc_msgSend(v12, "CGPath"));

    [v10 setStrokeEnd:0.0];
    double v13 = [(VSCircularProgressView *)self layer];
    [v13 addSublayer:v10];

    [(VSCircularProgressView *)self setProgressLayer:v10];
    objc_initWeak(&location, self);
    double v14 = [(VSCircularProgressView *)self traitCollection];
    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    v18[2] = __43__VSCircularProgressView__addProgressLayer__block_invoke;
    v18[3] = &unk_265077E70;
    objc_copyWeak(&v22, &location);
    id v15 = v4;
    id v19 = v15;
    id v16 = v6;
    id v20 = v16;
    id v17 = v10;
    id v21 = v17;
    [v14 performAsCurrentTraitCollection:v18];

    objc_destroyWeak(&v22);
    objc_destroyWeak(&location);
  }
}

void __43__VSCircularProgressView__addProgressLayer__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  double v2 = *(void **)(a1 + 32);
  id v3 = [WeakRetained progressFillColor];
  objc_msgSend(v2, "setBackgroundColor:", objc_msgSend(v3, "CGColor"));

  id v4 = *(void **)(a1 + 40);
  id v5 = [WeakRetained progressBgColor];
  objc_msgSend(v4, "setStrokeColor:", objc_msgSend(v5, "CGColor"));

  id v6 = *(void **)(a1 + 48);
  id v7 = [WeakRetained progressFillColor];
  objc_msgSend(v6, "setStrokeColor:", objc_msgSend(v7, "CGColor"));
}

- (void)_removeProgressLayer
{
  id v3 = [(VSCircularProgressView *)self progressLayer];
  [v3 removeFromSuperlayer];

  [(VSCircularProgressView *)self setProgressLayer:0];
  id v4 = [(VSCircularProgressView *)self progressBackgroundLayer];
  [v4 removeFromSuperlayer];

  [(VSCircularProgressView *)self setProgressBackgroundLayer:0];
  id v5 = [(VSCircularProgressView *)self centerLayer];
  [v5 removeFromSuperlayer];

  [(VSCircularProgressView *)self setCenterLayer:0];
}

- (id)_indeterminatePath
{
  [(VSCircularProgressView *)self indeterminateWidth];
  UIEdgeInsetsMakeWithEdges();
  double v4 = v3;
  double v6 = v5;
  [(VSCircularProgressView *)self bounds];
  id v8 = (void *)MEMORY[0x263F1C478];
  return (id)objc_msgSend(v8, "bezierPathWithArcCenter:radius:startAngle:endAngle:clockwise:", 1, (v7 - (v4 + v6)) * 0.5);
}

- (void)_addIndeterminateLayer
{
  double v3 = [(VSCircularProgressView *)self indeterminateLayer];

  if (!v3)
  {
    id v11 = objc_alloc_init(MEMORY[0x263F15880]);
    double v4 = [(VSCircularProgressView *)self tintColor];
    double v5 = [(VSCircularProgressView *)self traitCollection];
    id v6 = [v4 resolvedColorWithTraitCollection:v5];
    uint64_t v7 = [v6 CGColor];

    [v11 setStrokeColor:v7];
    id v8 = [MEMORY[0x263F1C550] clearColor];
    objc_msgSend(v11, "setFillColor:", objc_msgSend(v8, "CGColor"));

    [(VSCircularProgressView *)self indeterminateWidth];
    objc_msgSend(v11, "setLineWidth:");
    [v11 setLineCap:*MEMORY[0x263F15E70]];
    id v9 = [(VSCircularProgressView *)self _indeterminatePath];
    objc_msgSend(v11, "setPath:", objc_msgSend(v9, "CGPath"));

    id v10 = [(VSCircularProgressView *)self layer];
    [v10 addSublayer:v11];

    [(VSCircularProgressView *)self setIndeterminateLayer:v11];
  }
}

- (void)_startIndeterminateAnimation
{
  id v5 = [MEMORY[0x263F15760] animationWithKeyPath:@"transform.rotation.z"];
  [v5 setToValue:&unk_26F37E6B0];
  [v5 setDuration:1.0];
  LODWORD(v3) = 2139095040;
  [v5 setRepeatCount:v3];
  double v4 = [(VSCircularProgressView *)self indeterminateLayer];
  [v4 addAnimation:v5 forKey:@"indeterminateAnimation"];
}

- (void)_removeIndeterminateLayer
{
  double v3 = [(VSCircularProgressView *)self indeterminateLayer];
  [v3 removeFromSuperlayer];

  [(VSCircularProgressView *)self setIndeterminateLayer:0];
}

- (void)_applicationWillEnterForeground:(id)a3
{
  double v4 = [(VSCircularProgressView *)self indeterminateLayer];
  id v5 = [v4 animationForKey:@"indeterminateAnimation"];

  if (!v5 && [(VSCircularProgressView *)self isIndeterminate]) {
    [(VSCircularProgressView *)self _startIndeterminateAnimation];
  }
}

- (double)indeterminateWidth
{
  return self->_indeterminateWidth;
}

- (void)setIndeterminateWidth:(double)a3
{
  self->_indeterminateWidth = a3;
}

- (BOOL)isIndeterminate
{
  return self->_indeterminate;
}

- (UIColor)progressFillColor
{
  return self->_progressFillColor;
}

- (UIColor)progressBgColor
{
  return self->_progressBgColor;
}

- (double)progress
{
  return self->_progress;
}

- (double)centerSquareWidth
{
  return self->_centerSquareWidth;
}

- (void)setCenterSquareWidth:(double)a3
{
  self->_centerSquareWidth = a3;
}

- (CAShapeLayer)indeterminateLayer
{
  return self->_indeterminateLayer;
}

- (void)setIndeterminateLayer:(id)a3
{
}

- (CAShapeLayer)centerLayer
{
  return self->_centerLayer;
}

- (void)setCenterLayer:(id)a3
{
}

- (CAShapeLayer)progressLayer
{
  return self->_progressLayer;
}

- (void)setProgressLayer:(id)a3
{
}

- (CAShapeLayer)progressBackgroundLayer
{
  return self->_progressBackgroundLayer;
}

- (void)setProgressBackgroundLayer:(id)a3
{
}

- (double)progressWidth
{
  return self->_progressWidth;
}

- (void)setProgressWidth:(double)a3
{
  self->_progressWidth = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_progressBackgroundLayer, 0);
  objc_storeStrong((id *)&self->_progressLayer, 0);
  objc_storeStrong((id *)&self->_centerLayer, 0);
  objc_storeStrong((id *)&self->_indeterminateLayer, 0);
  objc_storeStrong((id *)&self->_progressBgColor, 0);
  objc_storeStrong((id *)&self->_progressFillColor, 0);
}

@end