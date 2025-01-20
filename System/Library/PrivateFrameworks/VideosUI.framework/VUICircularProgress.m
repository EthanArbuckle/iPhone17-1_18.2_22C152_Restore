@interface VUICircularProgress
- (BOOL)isIndeterminate;
- (BOOL)progressBgHidden;
- (CAShapeLayer)centerLayer;
- (CAShapeLayer)indeterminateLayer;
- (CAShapeLayer)progressBackgroundLayer;
- (CAShapeLayer)progressLayer;
- (CGSize)vui_layoutSubviews:(CGSize)a3 computationOnly:(BOOL)a4;
- (CGSize)vui_sizeThatFits:(CGSize)a3;
- (UIColor)progressBgColor;
- (UIColor)progressFillColor;
- (UIImage)centerImage;
- (VUICircularProgress)initWithFrame:(CGRect)a3;
- (VUIImageView)centerImageView;
- (double)centerSquareCornerRadius;
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
- (void)_updateColors;
- (void)dealloc;
- (void)setCenterImage:(id)a3;
- (void)setCenterImageView:(id)a3;
- (void)setCenterLayer:(id)a3;
- (void)setCenterSquareCornerRadius:(double)a3;
- (void)setCenterSquareWidth:(double)a3;
- (void)setIndeterminate:(BOOL)a3;
- (void)setIndeterminateLayer:(id)a3;
- (void)setIndeterminateWidth:(double)a3;
- (void)setProgress:(double)a3;
- (void)setProgressBackgroundLayer:(id)a3;
- (void)setProgressBgColor:(id)a3;
- (void)setProgressBgHidden:(BOOL)a3;
- (void)setProgressFillColor:(id)a3;
- (void)setProgressLayer:(id)a3;
- (void)setProgressWidth:(double)a3;
- (void)tintColorDidChange;
- (void)vui_didMoveToWindow;
@end

@implementation VUICircularProgress

- (VUICircularProgress)initWithFrame:(CGRect)a3
{
  v17[1] = *MEMORY[0x1E4F143B8];
  v16.receiver = self;
  v16.super_class = (Class)VUICircularProgress;
  v3 = -[VUICircularProgress initWithFrame:](&v16, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v3->_progressWidth = 2.0;
    v3->_indeterminateWidth = 2.0;
    v3->_centerSquareWidth = 8.0;
    v3->_centerSquareCornerRadius = 1.5;
    uint64_t v5 = objc_msgSend(MEMORY[0x1E4FB1618], "vui_keyColor");
    progressFillColor = v4->_progressFillColor;
    v4->_progressFillColor = (UIColor *)v5;

    uint64_t v7 = objc_msgSend(MEMORY[0x1E4FB1618], "vui_systemLightGrayColor");
    progressBgColor = v4->_progressBgColor;
    v4->_progressBgColor = (UIColor *)v7;

    v4->_progressBgHidden = 0;
    [(VUICircularProgress *)v4 setVuiClipsToBounds:1];
    v9 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v9 addObserver:v4 selector:sel__applicationWillEnterForeground_ name:*MEMORY[0x1E4FB3D80] object:0];

    id v10 = objc_initWeak(&location, v4);
    v17[0] = objc_opt_class();
    v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:1];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __37__VUICircularProgress_initWithFrame___block_invoke;
    v13[3] = &unk_1E6DF4CB0;
    objc_copyWeak(&v14, &location);
    [(VUICircularProgress *)v4 vui_registerForTraitChanges:v11 withHandler:v13];

    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);
  }
  return v4;
}

void __37__VUICircularProgress_initWithFrame___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __37__VUICircularProgress_initWithFrame___block_invoke_2;
  v9[3] = &unk_1E6DF4A30;
  objc_copyWeak(&v10, v7);
  objc_msgSend(WeakRetained, "vui_performAsCurrentTraitCollection:", v9);

  objc_destroyWeak(&v10);
}

void __37__VUICircularProgress_initWithFrame___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _updateColors];
}

- (void)dealloc
{
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)VUICircularProgress;
  [(VUICircularProgress *)&v4 dealloc];
}

- (CGSize)vui_layoutSubviews:(CGSize)a3 computationOnly:(BOOL)a4
{
  CGFloat height = a3.height;
  CGFloat width = a3.width;
  if (a4)
  {
    -[VUICircularProgress vui_sizeThatFits:](self, "vui_sizeThatFits:", a3.width, a3.height);
    CGFloat width = v7;
    CGFloat height = v8;
  }
  else
  {
    v9 = [(VUICircularProgress *)self progressLayer];

    if (v9)
    {
      [(VUICircularProgress *)self bounds];
      double v11 = v10;
      double v13 = v12;
      double v15 = v14;
      double v17 = v16;
      v18 = [(VUICircularProgress *)self progressLayer];
      objc_msgSend(v18, "setFrame:", v11, v13, v15, v17);

      v19 = [(VUICircularProgress *)self progressBackgroundLayer];
      CGFloat v61 = v17;
      CGFloat v62 = v15;
      objc_msgSend(v19, "setFrame:", v11, v13, v15, v17);

      v20 = [(VUICircularProgress *)self progressLayer];
      v21 = [(VUICircularProgress *)self _progressPath];
      objc_msgSend(v20, "setPath:", objc_msgSend(v21, "vuiCGPath"));

      v22 = [(VUICircularProgress *)self progressBackgroundLayer];
      v23 = [(VUICircularProgress *)self _progressPath];
      objc_msgSend(v22, "setPath:", objc_msgSend(v23, "vuiCGPath"));

      v24 = [(VUICircularProgress *)self progressBackgroundLayer];
      objc_msgSend(v24, "setHidden:", -[VUICircularProgress progressBgHidden](self, "progressBgHidden"));

      v25 = [(VUICircularProgress *)self centerLayer];

      if (v25)
      {
        [(VUICircularProgress *)self centerSquareWidth];
        double v59 = v26;
        [(VUICircularProgress *)self centerSquareWidth];
        double v27 = v13;
        double v28 = v11;
        double v30 = v29;
        [(VUICircularProgress *)self bounds];
        double v32 = v31;
        [(VUICircularProgress *)self centerSquareWidth];
        double v34 = (v32 - v33) * 0.5;
        [(VUICircularProgress *)self bounds];
        double v36 = v35;
        [(VUICircularProgress *)self centerSquareWidth];
        double v38 = (v36 - v37) * 0.5;
        v39 = [(VUICircularProgress *)self centerLayer];
        double v40 = v30;
        double v11 = v28;
        double v13 = v27;
        objc_msgSend(v39, "setFrame:", v34, v38, v59, v40);
      }
      v41 = [(VUICircularProgress *)self centerImageView];

      if (v41)
      {
        v42 = [(VUICircularProgress *)self centerImage];
        [v42 size];
        double v44 = v43;
        double v46 = v45;

        v64.origin.x = v11;
        v64.origin.y = v13;
        double v60 = height;
        v64.size.CGFloat width = v62;
        v64.size.CGFloat height = v61;
        CGRectGetMidX(v64);
        VUIRoundValue();
        double v48 = v47;
        v65.origin.x = v11;
        v65.origin.y = v13;
        v65.size.CGFloat width = v62;
        v65.size.CGFloat height = v61;
        CGRectGetMidY(v65);
        VUIRoundValue();
        double v50 = v49;
        v51 = [(VUICircularProgress *)self centerImageView];
        double v52 = v50;
        CGFloat height = v60;
        objc_msgSend(v51, "setFrame:", v48, v52, v44, v46);
      }
    }
    v53 = [(VUICircularProgress *)self indeterminateLayer];

    if (v53)
    {
      v54 = [(VUICircularProgress *)self indeterminateLayer];
      [(VUICircularProgress *)self bounds];
      objc_msgSend(v54, "setFrame:");

      v55 = [(VUICircularProgress *)self indeterminateLayer];
      v56 = [(VUICircularProgress *)self _indeterminatePath];
      objc_msgSend(v55, "setPath:", objc_msgSend(v56, "vuiCGPath"));
    }
  }
  double v57 = width;
  double v58 = height;
  result.CGFloat height = v58;
  result.CGFloat width = v57;
  return result;
}

- (void)vui_didMoveToWindow
{
  v3.receiver = self;
  v3.super_class = (Class)VUICircularProgress;
  [(VUICircularProgress *)&v3 vui_didMoveToWindow];
  [(VUICircularProgress *)self _configureProgress:[(VUICircularProgress *)self isIndeterminate]];
}

- (void)tintColorDidChange
{
  if ([(VUICircularProgress *)self isIndeterminate])
  {
    objc_super v3 = [(VUICircularProgress *)self vuiTintColor];
    objc_super v4 = [(VUICircularProgress *)self vuiTraitCollection];
    id v5 = [v3 resolvedColorWithTraitCollection:v4];
    uint64_t v6 = [v5 CGColor];

    id v7 = [(VUICircularProgress *)self indeterminateLayer];
    [v7 setStrokeColor:v6];
  }
}

- (CGSize)vui_sizeThatFits:(CGSize)a3
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
    if ([(VUICircularProgress *)self vui_isInAWindow]) {
      [(VUICircularProgress *)self _configureProgress:v3];
    }
    [(VUICircularProgress *)self vui_setNeedsLayout];
  }
}

- (void)setProgress:(double)a3
{
  if (self->_progress != a3)
  {
    self->_progress = a3;
    id v5 = [(VUICircularProgress *)self progressLayer];

    if (!v5) {
      [(VUICircularProgress *)self _addProgressLayer];
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
    double v7 = [(VUICircularProgress *)self progressLayer];
    [v7 setStrokeEnd:v6];

    [(VUICircularProgress *)self vui_setNeedsDisplay];
  }
}

- (void)setProgressFillColor:(id)a3
{
  id v5 = (UIColor *)a3;
  if (self->_progressFillColor != v5)
  {
    objc_storeStrong((id *)&self->_progressFillColor, a3);
    objc_initWeak(&location, self);
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __44__VUICircularProgress_setProgressFillColor___block_invoke;
    v6[3] = &unk_1E6DF5490;
    objc_copyWeak(&v8, &location);
    double v7 = v5;
    [(VUICircularProgress *)self vui_performAsCurrentTraitCollection:v6];

    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);
  }
}

void __44__VUICircularProgress_setProgressFillColor___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [MEMORY[0x1E4F39CF8] begin];
  [MEMORY[0x1E4F39CF8] setValue:*MEMORY[0x1E4F1CFD0] forKey:*MEMORY[0x1E4F3A5A8]];
  v2 = [WeakRetained centerLayer];
  objc_msgSend(v2, "setBackgroundColor:", objc_msgSend(*(id *)(a1 + 32), "CGColor"));

  BOOL v3 = [WeakRetained progressLayer];
  objc_msgSend(v3, "setStrokeColor:", objc_msgSend(*(id *)(a1 + 32), "CGColor"));

  double v4 = [WeakRetained centerImageView];
  [v4 _setTintColor:*(void *)(a1 + 32)];

  [MEMORY[0x1E4F39CF8] commit];
}

- (void)setProgressBgColor:(id)a3
{
  id v5 = (UIColor *)a3;
  if (self->_progressBgColor != v5)
  {
    objc_storeStrong((id *)&self->_progressBgColor, a3);
    objc_initWeak(&location, self);
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __42__VUICircularProgress_setProgressBgColor___block_invoke;
    v6[3] = &unk_1E6DF5490;
    objc_copyWeak(&v8, &location);
    double v7 = v5;
    [(VUICircularProgress *)self vui_performAsCurrentTraitCollection:v6];

    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);
  }
}

void __42__VUICircularProgress_setProgressBgColor___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v2 = [WeakRetained progressBackgroundLayer];
  objc_msgSend(v2, "setStrokeColor:", objc_msgSend(*(id *)(a1 + 32), "CGColor"));
}

- (void)_updateColors
{
  BOOL v3 = [(VUICircularProgress *)self indeterminateLayer];
  id v4 = [(VUICircularProgress *)self vuiTintColor];
  objc_msgSend(v3, "setStrokeColor:", objc_msgSend(v4, "CGColor"));

  id v5 = [(VUICircularProgress *)self centerLayer];
  id v6 = [(VUICircularProgress *)self progressFillColor];
  objc_msgSend(v5, "setBackgroundColor:", objc_msgSend(v6, "CGColor"));

  double v7 = [(VUICircularProgress *)self centerImageView];
  id v8 = [(VUICircularProgress *)self progressFillColor];
  [v7 _setTintColor:v8];

  v9 = [(VUICircularProgress *)self progressLayer];
  id v10 = [(VUICircularProgress *)self progressFillColor];
  objc_msgSend(v9, "setStrokeColor:", objc_msgSend(v10, "CGColor"));

  id v12 = [(VUICircularProgress *)self progressBackgroundLayer];
  id v11 = [(VUICircularProgress *)self progressBgColor];
  objc_msgSend(v12, "setStrokeColor:", objc_msgSend(v11, "CGColor"));
}

- (void)_configureProgress:(BOOL)a3
{
  if (a3)
  {
    [(VUICircularProgress *)self _addIndeterminateLayer];
    [(VUICircularProgress *)self _removeProgressLayer];
    [(VUICircularProgress *)self _startIndeterminateAnimation];
  }
  else
  {
    [(VUICircularProgress *)self _removeIndeterminateLayer];
    [(VUICircularProgress *)self _addProgressLayer];
  }
  [(VUICircularProgress *)self vui_setNeedsLayout];
}

- (id)_progressPath
{
  [(VUICircularProgress *)self bounds];
  VUIFloorValue();
  double v4 = v3;
  VUIFloorValue();
  double v6 = v5;
  [(VUICircularProgress *)self progressWidth];
  VUIFloorValue();
  return +[VUIBezierPath vui_bezierPathWithArcCenter:radius:startAngle:endAngle:clockwise:](VUIBezierPath, "vui_bezierPathWithArcCenter:radius:startAngle:endAngle:clockwise:", 1, v4, v6, v7, -1.57079633, 4.71238898);
}

- (void)_addProgressLayer
{
  double v3 = [(VUICircularProgress *)self progressLayer];

  if (!v3)
  {
    double v4 = [(VUICircularProgress *)self centerImage];

    if (v4)
    {
      double v5 = objc_opt_new();
      double v6 = [(VUICircularProgress *)self centerImage];
      [v5 setImage:v6];

      [(VUICircularProgress *)self setCenterImageView:v5];
      [(VUICircularProgress *)self addSubview:v5];
    }
    else
    {
      double v5 = objc_opt_new();
      [(VUICircularProgress *)self centerSquareCornerRadius];
      objc_msgSend(v5, "setCornerRadius:");
      double v7 = [(VUICircularProgress *)self vuiLayer];
      [v7 addSublayer:v5];

      [(VUICircularProgress *)self setCenterLayer:v5];
    }

    id v8 = objc_opt_new();
    [(VUICircularProgress *)self progressWidth];
    objc_msgSend(v8, "setLineWidth:");
    id v9 = [MEMORY[0x1E4FB1618] clearColor];
    objc_msgSend(v8, "setFillColor:", objc_msgSend(v9, "CGColor"));

    id v10 = [(VUICircularProgress *)self _progressPath];
    objc_msgSend(v8, "setPath:", objc_msgSend(v10, "vuiCGPath"));

    id v11 = [(VUICircularProgress *)self vuiLayer];
    [v11 addSublayer:v8];

    [(VUICircularProgress *)self setProgressBackgroundLayer:v8];
    id v12 = objc_opt_new();
    id v13 = [MEMORY[0x1E4FB1618] clearColor];
    objc_msgSend(v12, "setFillColor:", objc_msgSend(v13, "CGColor"));

    [(VUICircularProgress *)self progressWidth];
    objc_msgSend(v12, "setLineWidth:");
    [v12 setLineCap:*MEMORY[0x1E4F3A458]];
    double v14 = [(VUICircularProgress *)self _progressPath];
    objc_msgSend(v12, "setPath:", objc_msgSend(v14, "vuiCGPath"));

    [v12 setStrokeEnd:0.0];
    double v15 = [(VUICircularProgress *)self vuiLayer];
    [v15 addSublayer:v12];

    [(VUICircularProgress *)self setProgressLayer:v12];
    objc_initWeak(&location, self);
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __40__VUICircularProgress__addProgressLayer__block_invoke;
    v18[3] = &unk_1E6DF3F90;
    objc_copyWeak(&v21, &location);
    id v16 = v8;
    id v19 = v16;
    id v17 = v12;
    id v20 = v17;
    [(VUICircularProgress *)self vui_performAsCurrentTraitCollection:v18];

    objc_destroyWeak(&v21);
    objc_destroyWeak(&location);
  }
}

void __40__VUICircularProgress__addProgressLayer__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v2 = [WeakRetained centerLayer];
  id v3 = [WeakRetained progressFillColor];
  objc_msgSend(v2, "setBackgroundColor:", objc_msgSend(v3, "CGColor"));

  double v4 = [WeakRetained centerImageView];
  double v5 = [WeakRetained progressFillColor];
  [v4 _setTintColor:v5];

  double v6 = *(void **)(a1 + 32);
  id v7 = [WeakRetained progressBgColor];
  objc_msgSend(v6, "setStrokeColor:", objc_msgSend(v7, "CGColor"));

  id v8 = *(void **)(a1 + 40);
  id v9 = [WeakRetained progressFillColor];
  objc_msgSend(v8, "setStrokeColor:", objc_msgSend(v9, "CGColor"));
}

- (void)_removeProgressLayer
{
  id v3 = [(VUICircularProgress *)self progressLayer];
  [v3 removeFromSuperlayer];

  [(VUICircularProgress *)self setProgressLayer:0];
  double v4 = [(VUICircularProgress *)self progressBackgroundLayer];
  [v4 removeFromSuperlayer];

  [(VUICircularProgress *)self setProgressBackgroundLayer:0];
  double v5 = [(VUICircularProgress *)self centerLayer];
  [v5 removeFromSuperlayer];

  [(VUICircularProgress *)self setCenterLayer:0];
  double v6 = [(VUICircularProgress *)self centerImageView];
  [v6 removeFromSuperview];

  [(VUICircularProgress *)self setCenterImageView:0];
}

- (id)_indeterminatePath
{
  [(VUICircularProgress *)self bounds];
  VUIFloorValue();
  double v4 = v3;
  VUIFloorValue();
  double v6 = v5;
  [(VUICircularProgress *)self indeterminateWidth];
  VUIFloorValue();
  return +[VUIBezierPath vui_bezierPathWithArcCenter:radius:startAngle:endAngle:clockwise:](VUIBezierPath, "vui_bezierPathWithArcCenter:radius:startAngle:endAngle:clockwise:", 1, v4, v6, v7, -1.57079633, 3.53429174);
}

- (void)_addIndeterminateLayer
{
  double v3 = [(VUICircularProgress *)self indeterminateLayer];

  if (!v3)
  {
    double v4 = objc_opt_new();
    objc_initWeak(&location, self);
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __45__VUICircularProgress__addIndeterminateLayer__block_invoke;
    v8[3] = &unk_1E6DF5490;
    objc_copyWeak(&v10, &location);
    id v5 = v4;
    id v9 = v5;
    [(VUICircularProgress *)self vui_performAsCurrentTraitCollection:v8];
    id v6 = [MEMORY[0x1E4FB1618] clearColor];
    objc_msgSend(v5, "setFillColor:", objc_msgSend(v6, "CGColor"));

    [(VUICircularProgress *)self indeterminateWidth];
    objc_msgSend(v5, "setLineWidth:");
    [v5 setLineCap:*MEMORY[0x1E4F3A458]];
    double v7 = [(VUICircularProgress *)self vuiLayer];
    [v7 addSublayer:v5];

    [(VUICircularProgress *)self setIndeterminateLayer:v5];
    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
  }
}

void __45__VUICircularProgress__addIndeterminateLayer__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v2 = [WeakRetained vuiTintColor];
  uint64_t v3 = [v2 CGColor];

  [*(id *)(a1 + 32) setStrokeColor:v3];
}

- (void)_startIndeterminateAnimation
{
  id v5 = [MEMORY[0x1E4F39B48] animationWithKeyPath:@"transform.rotation.z"];
  [v5 setToValue:&unk_1F3F3E718];
  [v5 setDuration:1.0];
  LODWORD(v3) = 2139095040;
  [v5 setRepeatCount:v3];
  double v4 = [(VUICircularProgress *)self indeterminateLayer];
  [v4 addAnimation:v5 forKey:@"indeterminateAnimation"];
}

- (void)_removeIndeterminateLayer
{
  double v3 = [(VUICircularProgress *)self indeterminateLayer];
  [v3 removeFromSuperlayer];

  [(VUICircularProgress *)self setIndeterminateLayer:0];
}

- (void)_applicationWillEnterForeground:(id)a3
{
  double v4 = [(VUICircularProgress *)self indeterminateLayer];
  id v5 = [v4 animationForKey:@"indeterminateAnimation"];

  if (!v5 && [(VUICircularProgress *)self isIndeterminate]) {
    [(VUICircularProgress *)self _startIndeterminateAnimation];
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

- (BOOL)progressBgHidden
{
  return self->_progressBgHidden;
}

- (void)setProgressBgHidden:(BOOL)a3
{
  self->_progressBgHidden = a3;
}

- (double)progressWidth
{
  return self->_progressWidth;
}

- (void)setProgressWidth:(double)a3
{
  self->_progressWidth = a3;
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

- (double)centerSquareCornerRadius
{
  return self->_centerSquareCornerRadius;
}

- (void)setCenterSquareCornerRadius:(double)a3
{
  self->_centerSquareCornerRadius = a3;
}

- (UIImage)centerImage
{
  return self->_centerImage;
}

- (void)setCenterImage:(id)a3
{
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

- (VUIImageView)centerImageView
{
  return self->_centerImageView;
}

- (void)setCenterImageView:(id)a3
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_progressBackgroundLayer, 0);
  objc_storeStrong((id *)&self->_progressLayer, 0);
  objc_storeStrong((id *)&self->_centerImageView, 0);
  objc_storeStrong((id *)&self->_centerLayer, 0);
  objc_storeStrong((id *)&self->_indeterminateLayer, 0);
  objc_storeStrong((id *)&self->_centerImage, 0);
  objc_storeStrong((id *)&self->_progressBgColor, 0);
  objc_storeStrong((id *)&self->_progressFillColor, 0);
}

@end