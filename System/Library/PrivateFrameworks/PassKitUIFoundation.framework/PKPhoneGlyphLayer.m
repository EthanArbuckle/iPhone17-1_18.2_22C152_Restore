@interface PKPhoneGlyphLayer
- (BOOL)showQRCode;
- (PKPhoneGlyphLayer)init;
- (PKPhoneGlyphLayer)initWithFrame:(CGRect)a3 package:(id)a4;
- (void)_applyEffectivePrimaryColorToQRCodeAnimated:(BOOL)a3;
- (void)_endPhoneWiggle;
- (void)_restartPhoneWiggleIfNecessary;
- (void)_startPhoneWiggle;
- (void)dealloc;
- (void)layerDidBecomeVisible:(BOOL)a3;
- (void)layoutSublayers;
- (void)setHighlighted:(BOOL)a3 animated:(BOOL)a4;
- (void)setPrimaryColor:(CGColor *)a3 animated:(BOOL)a4;
- (void)setShowQRCode:(BOOL)a3;
@end

@implementation PKPhoneGlyphLayer

- (PKPhoneGlyphLayer)init
{
  if (PKUserIntentIsAvailable())
  {
    if (PKFrontFaceCameraIsWithinScreen()) {
      v3 = @"Payment_glyph_phone-D73";
    }
    else {
      v3 = @"Payment_glyph_phone-D22";
    }
  }
  else
  {
    v3 = @"Payment_glyph_phone";
  }
  v4 = (void *)MEMORY[0x263F15838];
  v5 = PKPassKitUIFoundationBundle();
  v6 = [v5 URLForResource:v3 withExtension:@"caar"];
  v7 = [v4 packageWithContentsOfURL:v6 type:*MEMORY[0x263F15EE0] options:0 error:0];

  v8 = -[PKPhoneGlyphLayer initWithFrame:package:](self, "initWithFrame:package:", v7, *MEMORY[0x263F001A0], *(double *)(MEMORY[0x263F001A0] + 8), *(double *)(MEMORY[0x263F001A0] + 16), *(double *)(MEMORY[0x263F001A0] + 24));
  return v8;
}

- (PKPhoneGlyphLayer)initWithFrame:(CGRect)a3 package:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v9 = a4;
  v29.receiver = self;
  v29.super_class = (Class)PKPhoneGlyphLayer;
  v10 = -[PKMicaLayer initWithFrame:package:](&v29, sel_initWithFrame_package_, v9, x, y, width, height);
  if (v10)
  {
    uint64_t v11 = [v9 publishedObjectWithName:@"(shape:secondary_highlight)"];
    highlightLayer = v10->_highlightLayer;
    v10->_highlightLayer = (CALayer *)v11;

    v13 = v10->_highlightLayer;
    v14 = PKLayerNullActions();
    [(CALayer *)v13 setActions:v14];

    [(CALayer *)v10->_highlightLayer position];
    v10->_highlightOffscreenPosition.double x = v15;
    v10->_highlightOffscreenPosition.double y = v16;
    v17 = [(CALayer *)v10->_highlightLayer superlayer];
    [v17 bounds];
    CGFloat v19 = v18;
    CGFloat v21 = v20;
    CGFloat v23 = v22;
    CGFloat v25 = v24;

    v30.origin.double x = v19;
    v30.origin.double y = v21;
    v30.size.double width = v23;
    v30.size.double height = v25;
    CGFloat MidX = CGRectGetMidX(v30);
    v31.origin.double x = v19;
    v31.origin.double y = v21;
    v31.size.double width = v23;
    v31.size.double height = v25;
    CGFloat MidY = CGRectGetMidY(v31);
    v10->_highlightOnscreenPosition.double x = MidX;
    v10->_highlightOnscreenPosition.double y = MidY;
  }

  return v10;
}

- (void)layoutSublayers
{
  v20.receiver = self;
  v20.super_class = (Class)PKPhoneGlyphLayer;
  [(PKMicaLayer *)&v20 layoutSublayers];
  QRCodeLayer = self->_QRCodeLayer;
  if (QRCodeLayer)
  {
    v4 = [(CALayer *)QRCodeLayer contents];
    if (v4)
    {
      v5 = v4;
      CGImageRetain(v4);
      CGImageGetWidth(v5);
      CGImageGetHeight(v5);
      CGImageRelease(v5);
      [(PKPhoneGlyphLayer *)self contentsScale];
      [(PKPhoneGlyphLayer *)self bounds];
      CGFloat v7 = v6;
      CGFloat v9 = v8;
      CGFloat v11 = v10;
      CGFloat v13 = v12;
      slice.origin.double x = v6;
      slice.origin.double y = v8;
      slice.size.double width = v10;
      slice.size.double height = v12;
      PKFloatRoundToPixelWithScale();
      PKSizeAspectFit();
      PKSizeRoundToPixelWithScale();
      memset(&v18, 0, sizeof(v18));
      PKFloatRoundToPixelWithScale();
      CGFloat v15 = v14;
      v21.origin.double x = v7;
      v21.origin.double y = v9;
      v21.size.double width = v11;
      v21.size.double height = v13;
      CGRectDivide(v21, &slice, &v18, v15, CGRectMinYEdge);
      PKSizeAlignedInRectWithScale();
      CGFloat v16 = self->_QRCodeLayer;
    }
    else
    {
      v17 = self->_QRCodeLayer;
      [(PKPhoneGlyphLayer *)self bounds];
      CGFloat v16 = v17;
    }
    -[CALayer setFrame:](v16, "setFrame:", *(_OWORD *)&v18.origin, *(_OWORD *)&v18.size, *(void *)&slice.origin.x, *(void *)&slice.origin.y, *(void *)&slice.size.width, *(void *)&slice.size.height);
  }
}

- (void)dealloc
{
  CGColorRelease(self->_primaryColor);
  v3.receiver = self;
  v3.super_class = (Class)PKPhoneGlyphLayer;
  [(PKMicaLayer *)&v3 dealloc];
}

- (void)layerDidBecomeVisible:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PKPhoneGlyphLayer;
  [(PKPhoneGlyphLayer *)&v5 layerDidBecomeVisible:a3];
  v4 = [(PKPhoneGlyphLayer *)self context];

  if (v4) {
    [(PKPhoneGlyphLayer *)self _restartPhoneWiggleIfNecessary];
  }
}

- (void)setHighlighted:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  CGFloat v7 = &OBJC_IVAR___PKPhoneGlyphLayer__highlightOffscreenPosition;
  if (a3) {
    CGFloat v7 = &OBJC_IVAR___PKPhoneGlyphLayer__highlightOnscreenPosition;
  }
  CGFloat v8 = (double *)((char *)self + *v7);
  double v9 = *v8;
  double v10 = v8[1];
  [(CALayer *)self->_highlightLayer position];
  if (v9 != v11 || v10 != v12)
  {
    if (v4)
    {
      double v14 = v11;
      double v15 = v12;
      CGFloat v16 = [MEMORY[0x263F15760] animationWithKeyPath:@"position"];
      LODWORD(v19) = 1058642330;
      if (!v5) {
        *(float *)&double v19 = 0.75;
      }
      LODWORD(v17) = *(_DWORD *)"ff&?";
      LODWORD(v18) = 1.0;
      objc_super v20 = [MEMORY[0x263F15808] functionWithControlPoints:v19 :0.0 :v17 :v18];
      [v16 setTimingFunction:v20];

      [v16 setAdditive:1];
      objc_msgSend(v16, "pkui_updateForAdditiveAnimationFromPoint:toPoint:", v14, v15, v9, v10);
      [v16 setDuration:1.3];
      id v21 = (id)[(CALayer *)self->_highlightLayer pkui_addAdditiveAnimation:v16];
    }
    highlightLayer = self->_highlightLayer;
    -[CALayer setPosition:](highlightLayer, "setPosition:", v9, v10);
  }
}

- (void)setPrimaryColor:(CGColor *)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  primaryColor = self->_primaryColor;
  if (a3 && primaryColor && (BOOL v8 = CGColorEqualToColor(primaryColor, a3), primaryColor = self->_primaryColor, !v8)
    || primaryColor != a3)
  {
    CGColorRelease(primaryColor);
    self->_primaryColor = CGColorRetain(a3);
    [(PKPhoneGlyphLayer *)self _applyEffectivePrimaryColorToQRCodeAnimated:v4];
  }
}

- (void)setShowQRCode:(BOOL)a3
{
  if (((!self->_showQRCode ^ a3) & 1) == 0)
  {
    self->_showQRCode = a3;
    double v4 = 0.0;
    if (a3)
    {
      double v4 = 1.0;
      if (!self->_QRCodeLayer)
      {
        [(PKPhoneGlyphLayer *)self contentsScale];
        double v6 = v5;
        CGFloat v7 = (CALayer *)objc_alloc_init(MEMORY[0x263F157E8]);
        QRCodeLayer = self->_QRCodeLayer;
        self->_QRCodeLayer = v7;

        [(CALayer *)self->_QRCodeLayer setOpacity:0.0];
        double v9 = self->_QRCodeLayer;
        double v10 = PKLayerNullActions();
        [(CALayer *)v9 setActions:v10];

        [(CALayer *)self->_QRCodeLayer setContentsScale:v6];
        double v11 = [MEMORY[0x263F1C6B0] systemImageNamed:@"qrcode"];
        [v11 size];
        PKSizeScaleAspectFit();
        PKSizeRoundToPixelWithScale();
        double v14 = objc_msgSend(objc_alloc(MEMORY[0x263F1C680]), "initWithSize:", v12, v13);
        v20[0] = MEMORY[0x263EF8330];
        v20[1] = 3221225472;
        v20[2] = __35__PKPhoneGlyphLayer_setShowQRCode___block_invoke;
        v20[3] = &unk_2644F9718;
        id v21 = v11;
        id v15 = v11;
        CGFloat v16 = [v14 imageWithActions:v20];
        double v17 = self->_QRCodeLayer;
        id v18 = v16;
        -[CALayer setContents:](v17, "setContents:", [v18 CGImage]);
        [(PKPhoneGlyphLayer *)self insertSublayer:self->_QRCodeLayer below:self->_highlightLayer];
        [(PKPhoneGlyphLayer *)self _applyEffectivePrimaryColorToQRCodeAnimated:0];
        [(PKPhoneGlyphLayer *)self setNeedsLayout];

        LOBYTE(v19) = self->_showQRCode;
        double v4 = (double)v19;
      }
    }
    [(CALayer *)self->_QRCodeLayer pkui_animateToOpacity:0 withCompletion:v4];
  }
}

void __35__PKPhoneGlyphLayer_setShowQRCode___block_invoke(uint64_t a1, void *a2)
{
  id v13 = a2;
  objc_super v3 = [v13 format];
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  objc_msgSend(*(id *)(a1 + 32), "drawInRect:", v5, v7, v9, v11);
  double v12 = [MEMORY[0x263F1C550] colorWithRed:1.0 green:1.0 blue:1.0 alpha:1.0];
  [v12 setFill];

  objc_msgSend(v13, "fillRect:blendMode:", 20, v5, v7, v9, v11);
}

- (void)_applyEffectivePrimaryColorToQRCodeAnimated:(BOOL)a3
{
  v15[1] = *MEMORY[0x263EF8340];
  if (self->_QRCodeLayer)
  {
    BOOL v3 = a3;
    if (!self->_QRCodeColorFilter)
    {
      id v5 = objc_alloc(MEMORY[0x263F157C8]);
      double v6 = (CAFilter *)[v5 initWithType:*MEMORY[0x263F15D20]];
      QRCodeColorFilter = self->_QRCodeColorFilter;
      self->_QRCodeColorFilter = v6;

      [(CAFilter *)self->_QRCodeColorFilter setName:@"QRCodeColorFilter"];
      [(CAFilter *)self->_QRCodeColorFilter setValue:self->_primaryColor forKey:@"inputColor"];
      QRCodeLayer = self->_QRCodeLayer;
      v15[0] = self->_QRCodeColorFilter;
      double v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v15 count:1];
      [(CALayer *)QRCodeLayer setFilters:v9];
    }
    double v10 = (void *)MEMORY[0x263F1C550];
    double v11 = [(CALayer *)self->_QRCodeLayer presentationLayer];
    uint64_t v12 = [v11 valueForKeyPath:@"filters.QRCodeColorFilter.inputColor"];
    if (!v12) {
      uint64_t v12 = [(CALayer *)self->_QRCodeLayer valueForKeyPath:@"filters.QRCodeColorFilter.inputColor"];
    }
    id v13 = [v10 colorWithCGColor:v12];

    [(CALayer *)self->_QRCodeLayer setValue:self->_primaryColor forKeyPath:@"filters.QRCodeColorFilter.inputColor"];
    if (v3)
    {
      double v14 = [MEMORY[0x263F15760] animationWithKeyPath:@"filters.QRCodeColorFilter.inputColor"];
      [v14 setDuration:0.15];
      [v14 setFillMode:*MEMORY[0x263F15AB0]];
      objc_msgSend(v14, "setFromValue:", objc_msgSend(v13, "CGColor"));
      [v14 setToValue:self->_primaryColor];
      [(CALayer *)self->_QRCodeLayer removeAnimationForKey:@"QRCodeColorAnimationKey"];
      [(CALayer *)self->_QRCodeLayer addAnimation:v14 forKey:@"QRCodeColorAnimationKey"];
    }
  }
}

- (void)_restartPhoneWiggleIfNecessary
{
  if (self->_phoneWiggleAnimationKey)
  {
    BOOL v3 = -[CALayer animationForKey:](self->_highlightLayer, "animationForKey:");

    if (!v3)
    {
      phoneWiggleAnimationKedouble y = self->_phoneWiggleAnimationKey;
      self->_phoneWiggleAnimationKedouble y = 0;

      [(PKPhoneGlyphLayer *)self _startPhoneWiggle];
    }
  }
}

- (void)_startPhoneWiggle
{
  if (!self->_phoneWiggleAnimationKey
    || ([(PKPhoneGlyphLayer *)self _endPhoneWiggle], !self->_phoneWiggleAnimationKey))
  {
    v3.f64[0] = self->_highlightOnscreenPosition.x;
    v3.f64[1] = self->_highlightOffscreenPosition.y;
    *(float64x2_t *)double v10 = vsubq_f64(vmlaq_f64(vmulq_f64((float64x2_t)self->_highlightOffscreenPosition, (float64x2_t)vdupq_n_s64(0x3FE4CCCCCCCCCCCDuLL)), (float64x2_t)vdupq_n_s64(0x3FD6666666666666uLL), v3), (float64x2_t)self->_highlightOnscreenPosition);
    double v4 = objc_msgSend(MEMORY[0x263F08D40], "valueWithPoint:", *MEMORY[0x263F00148], *(double *)(MEMORY[0x263F00148] + 8), v10[0]);
    id v5 = [MEMORY[0x263F08D40] valueWithPoint:*(_OWORD *)v10];
    double v11 = __38__PKPhoneGlyphLayer__startPhoneWiggle__block_invoke((uint64_t)v5, @"position", v4, v5);

    [v11 setDuration:2.6];
    LODWORD(v6) = 2139095040;
    [v11 setRepeatCount:v6];
    double v7 = [(CALayer *)self->_highlightLayer pkui_addAdditiveAnimation:v11];
    double v8 = (NSString *)[v7 copy];
    phoneWiggleAnimationKedouble y = self->_phoneWiggleAnimationKey;
    self->_phoneWiggleAnimationKedouble y = v8;
  }
}

id __38__PKPhoneGlyphLayer__startPhoneWiggle__block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  v22[3] = *MEMORY[0x263EF8340];
  double v6 = (void *)MEMORY[0x263F157D8];
  id v7 = a4;
  id v8 = a3;
  double v9 = [v6 animationWithKeyPath:a2];
  [v9 setAdditive:1];
  [v9 setKeyTimes:&unk_26D086C80];
  v22[0] = v8;
  v22[1] = v7;
  v22[2] = v8;
  double v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v22 count:3];
  [v9 setValues:v10];

  LODWORD(v11) = 0.75;
  LODWORD(v12) = 1.0;
  LODWORD(v13) = *(_DWORD *)"ff&?";
  double v14 = [MEMORY[0x263F15808] functionWithControlPoints:v11 :0.0 :v13 :v12];
  LODWORD(v15) = 1058642330;
  LODWORD(v16) = 1.0;
  LODWORD(v17) = *(_DWORD *)"ff&?";
  id v18 = objc_msgSend(MEMORY[0x263F15808], "functionWithControlPoints::::", v15, 0.0, v17, v16, v14);
  v21[1] = v18;
  unint64_t v19 = [MEMORY[0x263EFF8C0] arrayWithObjects:v21 count:2];

  [v9 setTimingFunctions:v19];
  [v9 setDuration:2.6];

  return v9;
}

- (void)_endPhoneWiggle
{
  phoneWiggleAnimationKedouble y = self->_phoneWiggleAnimationKey;
  if (phoneWiggleAnimationKey)
  {
    double v4 = phoneWiggleAnimationKey;
    id v5 = [(CALayer *)self->_highlightLayer animationForKey:v4];
    double v6 = self->_phoneWiggleAnimationKey;
    self->_phoneWiggleAnimationKedouble y = 0;

    [(CALayer *)self->_highlightLayer pkui_elapsedDurationForAnimationWithKey:v4];
    if (v7 <= 0.0)
    {
      [(CALayer *)self->_highlightLayer removeAnimationForKey:v4];
    }
    else
    {
      long double v8 = v7;
      [v5 duration];
      int64_t v10 = (uint64_t)((v9 - fmod(v8, v9)) * 1000000000.0);
      objc_initWeak(&location, self);
      dispatch_time_t v11 = dispatch_time(0, v10);
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __36__PKPhoneGlyphLayer__endPhoneWiggle__block_invoke;
      block[3] = &unk_2644F9040;
      objc_copyWeak(&v14, &location);
      double v13 = v4;
      double v4 = v4;
      dispatch_after(v11, MEMORY[0x263EF83A0], block);

      objc_destroyWeak(&v14);
      objc_destroyWeak(&location);
    }
  }
}

void __36__PKPhoneGlyphLayer__endPhoneWiggle__block_invoke(uint64_t a1)
{
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    float64x2_t v3 = WeakRetained;
    [WeakRetained[9] removeAnimationForKey:*(void *)(a1 + 32)];
    WeakRetained = v3;
  }
}

- (BOOL)showQRCode
{
  return self->_showQRCode;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_phoneWiggleAnimationKey, 0);
  objc_storeStrong((id *)&self->_highlightLayer, 0);
  objc_storeStrong((id *)&self->_QRCodeColorFilter, 0);

  objc_storeStrong((id *)&self->_QRCodeLayer, 0);
}

@end