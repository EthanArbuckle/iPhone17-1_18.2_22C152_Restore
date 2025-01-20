@interface PRXScannerIndicatorView
+ (double)innerHoleRatio;
+ (double)strokeWidth;
- (BOOL)needsReset;
- (CAGradientLayer)viewFinderBorderLayer;
- (CAShapeLayer)borderLayerMask;
- (CAShapeLayer)initialWhiteTintLayer;
- (CAShapeLayer)viewFinderTintLayer;
- (PRXScannerIndicatorView)init;
- (id)innerHolePathForRatio:(double)a3 stroke:(double)a4;
- (void)animateBorderFrom:(id)a3 to:(id)a4 duration:(double)a5;
- (void)animateInitialIfNeeded;
- (void)animateToColors:(id)a3 duration:(double)a4;
- (void)animationDidStop:(id)a3 finished:(BOOL)a4;
- (void)completed;
- (void)configure;
- (void)initial;
- (void)layoutSubviews;
- (void)setNeedsReset:(BOOL)a3;
@end

@implementation PRXScannerIndicatorView

- (PRXScannerIndicatorView)init
{
  v12.receiver = self;
  v12.super_class = (Class)PRXScannerIndicatorView;
  v2 = -[PRXScannerIndicatorView initWithFrame:](&v12, sel_initWithFrame_, *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  if (v2)
  {
    v3 = (CAShapeLayer *)objc_alloc_init(MEMORY[0x263F15880]);
    viewFinderTintLayer = v2->_viewFinderTintLayer;
    v2->_viewFinderTintLayer = v3;

    v5 = (CAGradientLayer *)objc_alloc_init(MEMORY[0x263F157D0]);
    viewFinderBorderLayer = v2->_viewFinderBorderLayer;
    v2->_viewFinderBorderLayer = v5;

    v7 = (CAShapeLayer *)objc_alloc_init(MEMORY[0x263F15880]);
    borderLayerMask = v2->_borderLayerMask;
    v2->_borderLayerMask = v7;

    v9 = (CAShapeLayer *)objc_alloc_init(MEMORY[0x263F15880]);
    initialWhiteTintLayer = v2->_initialWhiteTintLayer;
    v2->_initialWhiteTintLayer = v9;

    [(PRXScannerIndicatorView *)v2 configure];
  }
  return v2;
}

- (void)layoutSubviews
{
  v39.receiver = self;
  v39.super_class = (Class)PRXScannerIndicatorView;
  [(PRXScannerIndicatorView *)&v39 layoutSubviews];
  [(PRXScannerIndicatorView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  v11 = [(PRXScannerIndicatorView *)self viewFinderTintLayer];
  objc_msgSend(v11, "setFrame:", v4, v6, v8, v10);

  [(PRXScannerIndicatorView *)self bounds];
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;
  double v19 = v18;
  v20 = [(PRXScannerIndicatorView *)self viewFinderBorderLayer];
  objc_msgSend(v20, "setFrame:", v13, v15, v17, v19);

  [(PRXScannerIndicatorView *)self bounds];
  double v22 = v21;
  double v24 = v23;
  double v26 = v25;
  double v28 = v27;
  v29 = [(PRXScannerIndicatorView *)self initialWhiteTintLayer];
  objc_msgSend(v29, "setFrame:", v22, v24, v26, v28);

  [(PRXScannerIndicatorView *)self bounds];
  double v31 = v30;
  double v33 = v32;
  double v35 = v34;
  double v37 = v36;
  v38 = [(PRXScannerIndicatorView *)self borderLayerMask];
  objc_msgSend(v38, "setFrame:", v31, v33, v35, v37);

  [(PRXScannerIndicatorView *)self animateInitialIfNeeded];
}

+ (double)innerHoleRatio
{
  return 0.6;
}

+ (double)strokeWidth
{
  return 13.0;
}

- (void)configure
{
  id v3 = [MEMORY[0x263F1C550] whiteColor];
  uint64_t v4 = [v3 CGColor];
  double v5 = [(PRXScannerIndicatorView *)self viewFinderTintLayer];
  [v5 setFillColor:v4];

  id v6 = [MEMORY[0x263F1C550] whiteColor];
  uint64_t v7 = [v6 CGColor];
  double v8 = [(PRXScannerIndicatorView *)self initialWhiteTintLayer];
  [v8 setFillColor:v7];

  uint64_t v9 = *MEMORY[0x263F15DD8];
  double v10 = [(PRXScannerIndicatorView *)self viewFinderBorderLayer];
  [v10 setType:v9];

  v11 = [(PRXScannerIndicatorView *)self viewFinderBorderLayer];
  objc_msgSend(v11, "setStartPoint:", 0.5, 0.5);

  double v12 = [(PRXScannerIndicatorView *)self viewFinderBorderLayer];
  CGAffineTransformMakeRotation(&v25, 3.14159265);
  [v12 setAffineTransform:&v25];

  double v13 = [(PRXScannerIndicatorView *)self borderLayerMask];
  LODWORD(v14) = 1060320051;
  [v13 setOpacity:v14];

  double v15 = [(PRXScannerIndicatorView *)self viewFinderTintLayer];
  LODWORD(v16) = 1062501089;
  [v15 setOpacity:v16];

  double v17 = [(PRXScannerIndicatorView *)self initialWhiteTintLayer];
  LODWORD(v18) = 1.0;
  [v17 setOpacity:v18];

  double v19 = [(PRXScannerIndicatorView *)self layer];
  v20 = [(PRXScannerIndicatorView *)self viewFinderBorderLayer];
  [v19 insertSublayer:v20 atIndex:0];

  double v21 = [(PRXScannerIndicatorView *)self layer];
  double v22 = [(PRXScannerIndicatorView *)self initialWhiteTintLayer];
  [v21 insertSublayer:v22 atIndex:0];

  double v23 = [(PRXScannerIndicatorView *)self layer];
  double v24 = [(PRXScannerIndicatorView *)self viewFinderTintLayer];
  [v23 insertSublayer:v24 atIndex:0];

  [(PRXScannerIndicatorView *)self initial];
}

- (void)initial
{
  v15[2] = *MEMORY[0x263EF8340];
  id v3 = [(PRXScannerIndicatorView *)self viewFinderBorderLayer];
  [v3 removeAllAnimations];

  uint64_t v4 = [(PRXScannerIndicatorView *)self innerHolePathForRatio:0.6 stroke:0.0];
  [(id)objc_opt_class() strokeWidth];
  id v6 = [(PRXScannerIndicatorView *)self innerHolePathForRatio:0.6 stroke:v5];
  [v4 appendPath:v6];

  id v7 = v4;
  uint64_t v8 = [v7 CGPath];
  uint64_t v9 = [(PRXScannerIndicatorView *)self borderLayerMask];
  [v9 setPath:v8];

  double v10 = [MEMORY[0x263F1C550] systemBlueColor];
  v11 = [v10 colorWithAlphaComponent:1.0];
  v15[0] = v11;
  double v12 = [MEMORY[0x263F1C550] systemBlueColor];
  double v13 = [v12 colorWithAlphaComponent:1.0];
  v15[1] = v13;
  double v14 = [MEMORY[0x263EFF8C0] arrayWithObjects:v15 count:2];

  [(PRXScannerIndicatorView *)self animateToColors:v14 duration:0.0];
  [(PRXScannerIndicatorView *)self animateBorderFrom:0 to:v7 duration:0.0];
}

- (void)completed
{
  v13[2] = *MEMORY[0x263EF8340];
  id v3 = [MEMORY[0x263F1C550] systemGreenColor];
  uint64_t v4 = [v3 colorWithAlphaComponent:1.0];
  v13[0] = v4;
  double v5 = [MEMORY[0x263F1C550] systemGreenColor];
  id v6 = [v5 colorWithAlphaComponent:1.0];
  v13[1] = v6;
  id v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v13 count:2];

  [(PRXScannerIndicatorView *)self animateToColors:v7 duration:0.2];
  uint64_t v8 = [(PRXScannerIndicatorView *)self innerHolePathForRatio:0.6 stroke:0.0];
  [(id)objc_opt_class() strokeWidth];
  double v10 = [(PRXScannerIndicatorView *)self innerHolePathForRatio:0.6 stroke:v9];
  [v8 appendPath:v10];

  v11 = [(PRXScannerIndicatorView *)self innerHolePathForRatio:0.6 stroke:0.0];
  double v12 = [(PRXScannerIndicatorView *)self innerHolePathForRatio:0.6 stroke:19.0];
  [v11 appendPath:v12];

  [(PRXScannerIndicatorView *)self animateBorderFrom:v8 to:v11 duration:0.5];
  [(PRXScannerIndicatorView *)self setNeedsReset:1];
}

- (id)innerHolePathForRatio:(double)a3 stroke:(double)a4
{
  [(PRXScannerIndicatorView *)self bounds];
  double v8 = a4 + v7 * a3;
  [(PRXScannerIndicatorView *)self bounds];
  double v9 = CGRectGetMidX(v14) - v8 * 0.5;
  [(PRXScannerIndicatorView *)self bounds];
  double v10 = CGRectGetMidY(v15) - v8 * 0.5;
  v11 = (void *)MEMORY[0x263F1C478];
  return (id)objc_msgSend(v11, "bezierPathWithRoundedRect:cornerRadius:", v9, v10, v8, v8, v8 * 0.5);
}

- (void)animateToColors:(id)a3 duration:(double)a4
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v6 = a3;
  double v7 = [MEMORY[0x263EFF980] array];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v8 = v6;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v20;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v20 != v11) {
          objc_enumerationMutation(v8);
        }
        id v13 = *(id *)(*((void *)&v19 + 1) + 8 * v12);
        objc_msgSend(v7, "addObject:", objc_msgSend(v13, "CGColor", (void)v19));
        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v10);
  }

  if (a4 <= 0.0)
  {
    CGRect v14 = [(PRXScannerIndicatorView *)self viewFinderBorderLayer];
    [v14 setColors:v7];
  }
  else
  {
    CGRect v14 = [MEMORY[0x263F15760] animationWithKeyPath:@"colors"];
    CGRect v15 = [(PRXScannerIndicatorView *)self viewFinderBorderLayer];
    double v16 = [v15 colors];
    [v14 setFromValue:v16];

    [v14 setToValue:v7];
    [v14 setDuration:a4];
    [v14 setRemovedOnCompletion:0];
    [v14 setDelegate:self];
    double v17 = [(PRXScannerIndicatorView *)self viewFinderBorderLayer];
    [v17 setColors:v7];

    double v18 = [(PRXScannerIndicatorView *)self viewFinderBorderLayer];
    [v18 addAnimation:v14 forKey:@"colors"];
  }
}

- (void)animateBorderFrom:(id)a3 to:(id)a4 duration:(double)a5
{
  id v8 = (void *)MEMORY[0x263F15760];
  id v9 = a4;
  id v10 = a3;
  id v17 = [v8 animationWithKeyPath:@"path"];
  id v11 = v10;
  uint64_t v12 = [v11 CGPath];

  [v17 setFromValue:v12];
  id v13 = v9;
  uint64_t v14 = [v13 CGPath];

  [v17 setToValue:v14];
  [v17 setDuration:a5];
  CGRect v15 = [MEMORY[0x263F15808] functionWithName:*MEMORY[0x263F15EB8]];
  [v17 setTimingFunction:v15];

  [v17 setFillMode:*MEMORY[0x263F15AA8]];
  [v17 setRemovedOnCompletion:0];
  double v16 = [(PRXScannerIndicatorView *)self borderLayerMask];
  [v16 addAnimation:v17 forKey:@"path"];
}

- (void)animationDidStop:(id)a3 finished:(BOOL)a4
{
  id v13 = a3;
  objc_opt_class();
  uint64_t isKindOfClass = objc_opt_isKindOfClass();
  id v6 = v13;
  if (isKindOfClass)
  {
    id v7 = v13;
    id v8 = [v7 keyPath];
    int v9 = [v8 isEqualToString:@"colors"];

    if (v9)
    {
      id v10 = [v7 toValue];
      id v11 = [(PRXScannerIndicatorView *)self viewFinderBorderLayer];
      [v11 setColors:v10];

      if ([(PRXScannerIndicatorView *)self needsReset])
      {
        uint64_t v12 = [(PRXScannerIndicatorView *)self viewFinderBorderLayer];
        [v12 removeAllAnimations];
      }
      [(PRXScannerIndicatorView *)self setNeedsReset:0];
    }

    id v6 = v13;
  }
  MEMORY[0x270F9A758](isKindOfClass, v6);
}

- (void)animateInitialIfNeeded
{
  id v3 = (void *)MEMORY[0x263F1C478];
  [(PRXScannerIndicatorView *)self bounds];
  uint64_t v4 = objc_msgSend(v3, "bezierPathWithRoundedRect:cornerRadius:");
  double v5 = [(PRXScannerIndicatorView *)self innerHolePathForRatio:0.6 stroke:0.0];
  [v4 appendPath:v5];

  id v6 = [(PRXScannerIndicatorView *)self innerHolePathForRatio:0.45 stroke:0.0];
  [(id)objc_opt_class() strokeWidth];
  id v8 = [(PRXScannerIndicatorView *)self innerHolePathForRatio:0.45 stroke:v7];
  [v6 appendPath:v8];

  int v9 = [(PRXScannerIndicatorView *)self innerHolePathForRatio:0.6 stroke:0.0];
  [(id)objc_opt_class() strokeWidth];
  id v11 = [(PRXScannerIndicatorView *)self innerHolePathForRatio:0.6 stroke:v10];
  [v9 appendPath:v11];

  id v12 = v4;
  uint64_t v13 = [v12 CGPath];
  uint64_t v14 = [(PRXScannerIndicatorView *)self viewFinderTintLayer];
  [v14 setPath:v13];

  id v15 = v6;
  uint64_t v16 = [v15 CGPath];
  id v17 = [(PRXScannerIndicatorView *)self borderLayerMask];
  [v17 setPath:v16];

  double v18 = [(PRXScannerIndicatorView *)self borderLayerMask];
  long long v19 = [(PRXScannerIndicatorView *)self viewFinderBorderLayer];
  [v19 setMask:v18];

  long long v20 = (void *)MEMORY[0x263F1C478];
  [(PRXScannerIndicatorView *)self bounds];
  objc_msgSend(v20, "bezierPathWithRoundedRect:cornerRadius:");
  id v21 = objc_claimAutoreleasedReturnValue();
  uint64_t v22 = [v21 CGPath];
  double v23 = [(PRXScannerIndicatorView *)self initialWhiteTintLayer];
  [v23 setPath:v22];

  uint64_t v24 = *MEMORY[0x263F15AC0];
  CGAffineTransform v25 = [(PRXScannerIndicatorView *)self viewFinderTintLayer];
  [v25 setFillRule:v24];

  double v26 = [(PRXScannerIndicatorView *)self borderLayerMask];
  [v26 setFillRule:v24];

  double v27 = [MEMORY[0x263F15760] animationWithKeyPath:@"opacity"];
  [v27 setFromValue:&unk_26CCFC0A0];
  [v27 setToValue:&unk_26CCFC0B8];
  [v27 setDuration:0.6];
  double v28 = [MEMORY[0x263F15808] functionWithName:*MEMORY[0x263F15EB8]];
  [v27 setTimingFunction:v28];

  [v27 setFillMode:*MEMORY[0x263F15AA8]];
  [v27 setRemovedOnCompletion:0];
  dispatch_time_t v29 = dispatch_time(0, 200000000);
  uint64_t v31 = MEMORY[0x263EF8330];
  uint64_t v32 = 3221225472;
  double v33 = __49__PRXScannerIndicatorView_animateInitialIfNeeded__block_invoke;
  double v34 = &unk_264418258;
  double v35 = self;
  id v36 = v27;
  id v30 = v27;
  dispatch_after(v29, MEMORY[0x263EF83A0], &v31);
  -[PRXScannerIndicatorView animateBorderFrom:to:duration:](self, "animateBorderFrom:to:duration:", v15, v9, 0.5, v31, v32, v33, v34, v35);
}

void __49__PRXScannerIndicatorView_animateInitialIfNeeded__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) initialWhiteTintLayer];
  [v2 addAnimation:*(void *)(a1 + 40) forKey:@"opacity"];
}

- (CAShapeLayer)viewFinderTintLayer
{
  return self->_viewFinderTintLayer;
}

- (CAGradientLayer)viewFinderBorderLayer
{
  return self->_viewFinderBorderLayer;
}

- (CAShapeLayer)borderLayerMask
{
  return self->_borderLayerMask;
}

- (CAShapeLayer)initialWhiteTintLayer
{
  return self->_initialWhiteTintLayer;
}

- (BOOL)needsReset
{
  return self->_needsReset;
}

- (void)setNeedsReset:(BOOL)a3
{
  self->_needsReset = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_initialWhiteTintLayer, 0);
  objc_storeStrong((id *)&self->_borderLayerMask, 0);
  objc_storeStrong((id *)&self->_viewFinderBorderLayer, 0);
  objc_storeStrong((id *)&self->_viewFinderTintLayer, 0);
}

@end