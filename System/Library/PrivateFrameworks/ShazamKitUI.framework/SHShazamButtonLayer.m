@interface SHShazamButtonLayer
- (BOOL)initialAnimationPerformed;
- (CALayer)backgroundLayer;
- (CALayer)shapeLayer;
- (CAShapeLayer)bottomSolidLayer;
- (CAShapeLayer)bottomTransparentLayer;
- (CAShapeLayer)topBorder;
- (CAShapeLayer)topSolidLayer;
- (CAShapeLayer)topTransparentLayer;
- (CGPath)bottomStrokeLongPath;
- (CGPath)bottomStrokePath;
- (CGPath)topStrokeLongPath;
- (CGPath)topStrokePath;
- (SHShazamButtonViewDelegate)buttonDelegate;
- (id)strokeLayerWithPath:(CGPath *)a3 color:(CGColor *)a4;
- (void)drawSolidShape;
- (void)drawSolidShapeWithDuration:(double)a3 delay:(double)a4 completion:(id)a5;
- (void)drawTransparentShape;
- (void)layoutSublayers;
- (void)performFadeInIntroAnimation:(double)a3 delay:(double)a4;
- (void)performSDrawingAnimationWithDuration:(double)a3 delay:(double)a4;
- (void)performSDrawingIntroAnimation;
- (void)removeTransparentShape;
- (void)removeTransparentShapeWithDuration:(double)a3 delay:(double)a4 completion:(id)a5;
- (void)setBackgroundLayer:(id)a3;
- (void)setBottomSolidLayer:(id)a3;
- (void)setBottomTransparentLayer:(id)a3;
- (void)setButtonDelegate:(id)a3;
- (void)setInitialAnimationPerformed:(BOOL)a3;
- (void)setShapeLayer:(id)a3;
- (void)setTopBorder:(id)a3;
- (void)setTopSolidLayer:(id)a3;
- (void)setTopTransparentLayer:(id)a3;
- (void)setup;
- (void)skipIntroAnimation;
@end

@implementation SHShazamButtonLayer

- (void)setup
{
  id v3 = objc_alloc_init(MEMORY[0x263F157E8]);
  [(SHShazamButtonLayer *)self setBackgroundLayer:v3];

  [(SHShazamButtonLayer *)self bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  v12 = [(SHShazamButtonLayer *)self backgroundLayer];
  objc_msgSend(v12, "setFrame:", v5, v7, v9, v11);

  v13 = [(SHShazamButtonLayer *)self backgroundLayer];
  [v13 setMasksToBounds:1];

  v14 = [(SHPaletteLayer *)self palette];
  uint64_t v15 = [v14 listeningButtonBackgroundColor];
  v16 = [(SHShazamButtonLayer *)self backgroundLayer];
  [v16 setBackgroundColor:v15];

  v17 = [(SHShazamButtonLayer *)self backgroundLayer];
  [(SHShazamButtonLayer *)self addSublayer:v17];

  id v18 = objc_alloc_init(MEMORY[0x263F15880]);
  [(SHShazamButtonLayer *)self setTopBorder:v18];

  v19 = [(SHPaletteLayer *)self palette];
  uint64_t v20 = [v19 listeningButtonTopBorderColor];
  v21 = [(SHShazamButtonLayer *)self topBorder];
  [v21 setStrokeColor:v20];

  v22 = [(SHShazamButtonLayer *)self topBorder];
  [v22 setLineWidth:1.0];

  v23 = [(SHPaletteLayer *)self palette];
  uint64_t v24 = [v23 clearColor];
  v25 = [(SHShazamButtonLayer *)self topBorder];
  [v25 setFillColor:v24];

  v26 = [(SHShazamButtonLayer *)self backgroundLayer];
  v27 = [(SHShazamButtonLayer *)self topBorder];
  [v26 addSublayer:v27];

  id v28 = objc_alloc_init(MEMORY[0x263F157E8]);
  [(SHShazamButtonLayer *)self setShapeLayer:v28];

  v29 = [(SHShazamButtonLayer *)self shapeLayer];
  objc_msgSend(v29, "setFrame:", 0.0, 0.0, 210.0, 210.0);

  v30 = [(SHShazamButtonLayer *)self backgroundLayer];
  v31 = [(SHShazamButtonLayer *)self shapeLayer];
  [v30 addSublayer:v31];

  [(SHShazamButtonLayer *)self drawTransparentShape];
}

- (void)layoutSublayers
{
  v37.receiver = self;
  v37.super_class = (Class)SHShazamButtonLayer;
  [(SHShazamButtonLayer *)&v37 layoutSublayers];
  Mutable = CGPathCreateMutable();
  [(SHShazamButtonLayer *)self bounds];
  CGFloat v5 = v4 * 0.5;
  [(SHShazamButtonLayer *)self bounds];
  CGFloat v7 = v6 * 0.5 + 2.0;
  [(SHShazamButtonLayer *)self bounds];
  CGPathAddArc(Mutable, 0, v5, v7, v8 * 0.5 + 1.0, 0.0, 3.14159265, 1);
  double v9 = [(SHShazamButtonLayer *)self topBorder];
  [v9 setPath:Mutable];

  CGPathRelease(Mutable);
  [(SHShazamButtonLayer *)self bounds];
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;
  id v18 = [(SHShazamButtonLayer *)self backgroundLayer];
  objc_msgSend(v18, "setFrame:", v11, v13, v15, v17);

  [(SHShazamButtonLayer *)self bounds];
  double v20 = v19 * 0.5;
  v21 = [(SHShazamButtonLayer *)self backgroundLayer];
  [v21 setCornerRadius:v20];

  v22 = [(SHShazamButtonLayer *)self backgroundLayer];
  [v22 position];
  double v24 = v23;
  double v26 = v25;
  v27 = [(SHShazamButtonLayer *)self shapeLayer];
  objc_msgSend(v27, "setPosition:", v24, v26);

  [(SHShazamButtonLayer *)self frame];
  CGFloat v29 = v28 / 367.5;
  [(SHShazamButtonLayer *)self frame];
  CATransform3DMakeScale(&v36, v29, v30 / 367.5, 1.0);
  v31 = [(SHShazamButtonLayer *)self shapeLayer];
  CATransform3D v35 = v36;
  [v31 setTransform:&v35];

  v32 = [(SHPaletteLayer *)self palette];
  uint64_t v33 = [v32 listeningButtonBackgroundColor];
  v34 = [(SHShazamButtonLayer *)self backgroundLayer];
  [v34 setBackgroundColor:v33];
}

- (void)skipIntroAnimation
{
  [(SHShazamButtonLayer *)self setInitialAnimationPerformed:1];
  [(SHShazamButtonLayer *)self drawSolidShape];
}

- (void)performSDrawingIntroAnimation
{
  if (![(SHShazamButtonLayer *)self initialAnimationPerformed])
  {
    [(SHShazamButtonLayer *)self setInitialAnimationPerformed:1];
    [(SHShazamButtonLayer *)self performSDrawingAnimationWithDuration:0.839999974 delay:0.0];
  }
}

- (void)performSDrawingAnimationWithDuration:(double)a3 delay:(double)a4
{
  double v5 = a4 + a3 * 0.357142895;
  double v6 = a3 * 0.642857194;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __66__SHShazamButtonLayer_performSDrawingAnimationWithDuration_delay___block_invoke;
  v8[3] = &unk_264CC00C8;
  v8[4] = self;
  -[SHShazamButtonLayer removeTransparentShapeWithDuration:delay:completion:](self, "removeTransparentShapeWithDuration:delay:completion:", v8, a3 * 0.357142895);
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __66__SHShazamButtonLayer_performSDrawingAnimationWithDuration_delay___block_invoke_2;
  v7[3] = &unk_264CC00C8;
  v7[4] = self;
  [(SHShazamButtonLayer *)self drawSolidShapeWithDuration:v7 delay:v6 completion:v5];
}

void __66__SHShazamButtonLayer_performSDrawingAnimationWithDuration_delay___block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) buttonDelegate];
  [v1 buttonWillFinishDrawingShazamShape];
}

void __66__SHShazamButtonLayer_performSDrawingAnimationWithDuration_delay___block_invoke_2(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) buttonDelegate];
  [v1 buttonDidFinishDrawingShazamShape];
}

- (void)performFadeInIntroAnimation:(double)a3 delay:(double)a4
{
  [(SHShazamButtonLayer *)self drawSolidShape];
  CGFloat v7 = [MEMORY[0x263F15760] animationWithKeyPath:@"opacity"];
  [v7 setDuration:a3];
  [v7 setBeginTime:CACurrentMediaTime() + a4];
  [v7 setFromValue:&unk_26E9F94B0];
  [v7 setToValue:&unk_26E9F94C0];
  uint64_t v8 = *MEMORY[0x263F15EB8];
  double v9 = [MEMORY[0x263F15808] functionWithName:*MEMORY[0x263F15EB8]];
  [v7 setTimingFunction:v9];

  [v7 setRemovedOnCompletion:1];
  uint64_t v10 = *MEMORY[0x263F15AA8];
  [v7 setFillMode:*MEMORY[0x263F15AA8]];
  double v11 = [MEMORY[0x263F15760] animationWithKeyPath:@"opacity"];
  [v11 setDuration:a3];
  [v11 setBeginTime:CACurrentMediaTime() + a4];
  [v11 setFromValue:&unk_26E9F94C0];
  [v11 setToValue:&unk_26E9F94B0];
  double v12 = [MEMORY[0x263F15808] functionWithName:v8];
  [v11 setTimingFunction:v12];

  [v11 setRemovedOnCompletion:1];
  [v11 setFillMode:v10];
  [MEMORY[0x263F158F8] begin];
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __57__SHShazamButtonLayer_performFadeInIntroAnimation_delay___block_invoke;
  v17[3] = &unk_264CC00C8;
  v17[4] = self;
  [MEMORY[0x263F158F8] setCompletionBlock:v17];
  double v13 = [(SHShazamButtonLayer *)self topSolidLayer];
  [v13 addAnimation:v7 forKey:0];

  double v14 = [(SHShazamButtonLayer *)self bottomSolidLayer];
  [v14 addAnimation:v7 forKey:0];

  double v15 = [(SHShazamButtonLayer *)self topTransparentLayer];
  [v15 addAnimation:v11 forKey:0];

  double v16 = [(SHShazamButtonLayer *)self bottomTransparentLayer];
  [v16 addAnimation:v11 forKey:0];

  [MEMORY[0x263F158F8] commit];
}

uint64_t __57__SHShazamButtonLayer_performFadeInIntroAnimation_delay___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) removeTransparentShape];
}

- (void)removeTransparentShape
{
  id v3 = [(SHShazamButtonLayer *)self topTransparentLayer];
  [v3 removeFromSuperlayer];

  double v4 = [(SHShazamButtonLayer *)self bottomTransparentLayer];
  [v4 removeFromSuperlayer];

  [(SHShazamButtonLayer *)self setTopTransparentLayer:0];
  [(SHShazamButtonLayer *)self setBottomTransparentLayer:0];
}

- (void)drawTransparentShape
{
  id v3 = [(SHShazamButtonLayer *)self topStrokePath];
  double v4 = [(SHPaletteLayer *)self palette];
  double v5 = -[SHShazamButtonLayer strokeLayerWithPath:color:](self, "strokeLayerWithPath:color:", v3, [v4 listeningButtonBackgroundTransparentColor]);
  [(SHShazamButtonLayer *)self setTopTransparentLayer:v5];

  double v6 = [(SHShazamButtonLayer *)self bottomStrokePath];
  CGFloat v7 = [(SHPaletteLayer *)self palette];
  uint64_t v8 = -[SHShazamButtonLayer strokeLayerWithPath:color:](self, "strokeLayerWithPath:color:", v6, [v7 listeningButtonBackgroundTransparentColor]);
  [(SHShazamButtonLayer *)self setBottomTransparentLayer:v8];

  double v9 = [(SHPaletteLayer *)self palette];
  uint64_t v10 = [v9 listeningButtonTopBorderColor];
  double v11 = [(SHShazamButtonLayer *)self topTransparentLayer];
  [v11 setShadowColor:v10];

  double v12 = [(SHShazamButtonLayer *)self topTransparentLayer];
  LODWORD(v13) = 1.0;
  [v12 setShadowOpacity:v13];

  double v14 = [(SHShazamButtonLayer *)self topTransparentLayer];
  [v14 setShadowRadius:1.0];

  double v15 = [(SHShazamButtonLayer *)self topTransparentLayer];
  objc_msgSend(v15, "setShadowOffset:", 0.5, 1.0);

  double v16 = [(SHPaletteLayer *)self palette];
  uint64_t v17 = [v16 listeningButtonTopBorderColor];
  id v18 = [(SHShazamButtonLayer *)self bottomTransparentLayer];
  [v18 setShadowColor:v17];

  double v19 = [(SHShazamButtonLayer *)self bottomTransparentLayer];
  LODWORD(v20) = 1.0;
  [v19 setShadowOpacity:v20];

  v21 = [(SHShazamButtonLayer *)self bottomTransparentLayer];
  [v21 setShadowRadius:1.0];

  v22 = [(SHShazamButtonLayer *)self bottomTransparentLayer];
  objc_msgSend(v22, "setShadowOffset:", 0.5, 1.0);

  double v23 = [(SHShazamButtonLayer *)self shapeLayer];
  double v24 = [(SHShazamButtonLayer *)self topTransparentLayer];
  [v23 addSublayer:v24];

  id v26 = [(SHShazamButtonLayer *)self shapeLayer];
  double v25 = [(SHShazamButtonLayer *)self bottomTransparentLayer];
  [v26 addSublayer:v25];
}

- (void)removeTransparentShapeWithDuration:(double)a3 delay:(double)a4 completion:(id)a5
{
  id v8 = a5;
  [MEMORY[0x263F158F8] begin];
  double v9 = [MEMORY[0x263F15760] animationWithKeyPath:@"strokeStart"];
  [v9 setDuration:a3];
  [v9 setBeginTime:CACurrentMediaTime() + a4];
  [v9 setFromValue:&unk_26E9F94B0];
  [v9 setToValue:&unk_26E9F94C0];
  LODWORD(v10) = 1.0;
  LODWORD(v11) = 1.0;
  LODWORD(v12) = 1.0;
  double v13 = [MEMORY[0x263F15808] functionWithControlPoints:v10 :0.0 :v11 :v12];
  [v9 setTimingFunction:v13];

  [v9 setRemovedOnCompletion:1];
  [v9 setFillMode:*MEMORY[0x263F15AA8]];
  [MEMORY[0x263F158F8] setValue:*MEMORY[0x263EFFB40] forKey:*MEMORY[0x263F15FC8]];
  double v14 = [(SHShazamButtonLayer *)self topTransparentLayer];
  [v14 setStrokeStart:1.0];

  double v15 = [(SHShazamButtonLayer *)self bottomTransparentLayer];
  [v15 setStrokeStart:1.0];

  double v16 = (void *)MEMORY[0x263F158F8];
  uint64_t v20 = MEMORY[0x263EF8330];
  uint64_t v21 = 3221225472;
  v22 = __75__SHShazamButtonLayer_removeTransparentShapeWithDuration_delay_completion___block_invoke;
  double v23 = &unk_264CC00F0;
  double v24 = self;
  id v25 = v8;
  id v17 = v8;
  [v16 setCompletionBlock:&v20];
  id v18 = [(SHShazamButtonLayer *)self topTransparentLayer];
  [v18 addAnimation:v9 forKey:@"strokeEnd"];

  double v19 = [(SHShazamButtonLayer *)self bottomTransparentLayer];
  [v19 addAnimation:v9 forKey:@"strokeEnd"];

  [MEMORY[0x263F158F8] commit];
}

uint64_t __75__SHShazamButtonLayer_removeTransparentShapeWithDuration_delay_completion___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) topTransparentLayer];
  [v2 removeFromSuperlayer];

  id v3 = [*(id *)(a1 + 32) bottomTransparentLayer];
  [v3 removeFromSuperlayer];

  [*(id *)(a1 + 32) setTopTransparentLayer:0];
  [*(id *)(a1 + 32) setBottomTransparentLayer:0];
  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    double v5 = *(uint64_t (**)(void))(result + 16);
    return v5();
  }
  return result;
}

- (void)drawSolidShape
{
  id v3 = [(SHShazamButtonLayer *)self topStrokePath];
  double v4 = [(SHPaletteLayer *)self palette];
  double v5 = -[SHShazamButtonLayer strokeLayerWithPath:color:](self, "strokeLayerWithPath:color:", v3, [v4 listeningButtonShazamShapeColor]);
  [(SHShazamButtonLayer *)self setTopSolidLayer:v5];

  double v6 = [(SHShazamButtonLayer *)self bottomStrokePath];
  CGFloat v7 = [(SHPaletteLayer *)self palette];
  id v8 = -[SHShazamButtonLayer strokeLayerWithPath:color:](self, "strokeLayerWithPath:color:", v6, [v7 listeningButtonShazamShapeColor]);
  [(SHShazamButtonLayer *)self setBottomSolidLayer:v8];

  double v9 = [(SHShazamButtonLayer *)self shapeLayer];
  double v10 = [(SHShazamButtonLayer *)self topSolidLayer];
  [v9 addSublayer:v10];

  id v12 = [(SHShazamButtonLayer *)self shapeLayer];
  double v11 = [(SHShazamButtonLayer *)self bottomSolidLayer];
  [v12 addSublayer:v11];
}

- (void)drawSolidShapeWithDuration:(double)a3 delay:(double)a4 completion:(id)a5
{
  v35[2] = *MEMORY[0x263EF8340];
  id v8 = a5;
  [MEMORY[0x263F158F8] begin];
  double v9 = [(SHShazamButtonLayer *)self topStrokeLongPath];
  double v10 = [(SHPaletteLayer *)self palette];
  double v11 = -[SHShazamButtonLayer strokeLayerWithPath:color:](self, "strokeLayerWithPath:color:", v9, [v10 listeningButtonShazamShapeColor]);
  [(SHShazamButtonLayer *)self setTopSolidLayer:v11];

  id v12 = [(SHShazamButtonLayer *)self bottomStrokeLongPath];
  double v13 = [(SHPaletteLayer *)self palette];
  double v14 = -[SHShazamButtonLayer strokeLayerWithPath:color:](self, "strokeLayerWithPath:color:", v12, [v13 listeningButtonShazamShapeColor]);
  [(SHShazamButtonLayer *)self setBottomSolidLayer:v14];

  double v15 = [(SHShazamButtonLayer *)self shapeLayer];
  double v16 = [(SHShazamButtonLayer *)self topSolidLayer];
  [v15 addSublayer:v16];

  id v17 = [(SHShazamButtonLayer *)self shapeLayer];
  id v18 = [(SHShazamButtonLayer *)self bottomSolidLayer];
  [v17 addSublayer:v18];

  LODWORD(v19) = 1053609165;
  LODWORD(v20) = 1053944709;
  LODWORD(v21) = 1.0;
  LODWORD(v22) = 1.0;
  double v23 = [MEMORY[0x263F15808] functionWithControlPoints:v19 :v21 :v20 :v22];
  double v24 = [MEMORY[0x263F15760] animationWithKeyPath:@"strokeEnd"];
  [v24 setDuration:a3];
  [v24 setFromValue:&unk_26E9F9640];
  [v24 setToValue:&unk_26E9F9658];
  [v24 setTimingFunction:v23];
  [v24 setRemovedOnCompletion:0];
  uint64_t v25 = *MEMORY[0x263F15AA8];
  [v24 setFillMode:*MEMORY[0x263F15AA8]];
  [v24 setBeginTime:a4];
  id v26 = [MEMORY[0x263F15760] animationWithKeyPath:@"strokeStart"];
  [v26 setDuration:a3];
  [v26 setFromValue:&unk_26E9F9640];
  [v26 setToValue:&unk_26E9F94D0];
  [v26 setTimingFunction:v23];
  [v26 setRemovedOnCompletion:0];
  [v26 setFillMode:v25];
  [v26 setBeginTime:a4];
  v27 = (void *)MEMORY[0x263F158F8];
  v33[0] = MEMORY[0x263EF8330];
  v33[1] = 3221225472;
  v33[2] = __67__SHShazamButtonLayer_drawSolidShapeWithDuration_delay_completion___block_invoke;
  v33[3] = &unk_264CC00F0;
  v33[4] = self;
  id v34 = v8;
  id v28 = v8;
  [v27 setCompletionBlock:v33];
  CGFloat v29 = [MEMORY[0x263F15750] animation];
  v35[0] = v26;
  v35[1] = v24;
  double v30 = [MEMORY[0x263EFF8C0] arrayWithObjects:v35 count:2];
  [v29 setAnimations:v30];

  [v29 setDuration:a3 + a4];
  [v29 setRemovedOnCompletion:0];
  [v29 setFillMode:v25];
  v31 = [(SHShazamButtonLayer *)self topSolidLayer];
  [v31 addAnimation:v29 forKey:0];

  v32 = [(SHShazamButtonLayer *)self bottomSolidLayer];
  [v32 addAnimation:v29 forKey:0];

  [MEMORY[0x263F158F8] commit];
}

uint64_t __67__SHShazamButtonLayer_drawSolidShapeWithDuration_delay_completion___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) topSolidLayer];
  [v2 removeFromSuperlayer];

  id v3 = [*(id *)(a1 + 32) bottomSolidLayer];
  [v3 removeFromSuperlayer];

  double v4 = *(void **)(a1 + 32);
  uint64_t v5 = [v4 topStrokePath];
  double v6 = [*(id *)(a1 + 32) palette];
  CGFloat v7 = objc_msgSend(v4, "strokeLayerWithPath:color:", v5, objc_msgSend(v6, "listeningButtonShazamShapeColor"));
  [*(id *)(a1 + 32) setTopSolidLayer:v7];

  id v8 = *(void **)(a1 + 32);
  uint64_t v9 = [v8 bottomStrokePath];
  double v10 = [*(id *)(a1 + 32) palette];
  double v11 = objc_msgSend(v8, "strokeLayerWithPath:color:", v9, objc_msgSend(v10, "listeningButtonShazamShapeColor"));
  [*(id *)(a1 + 32) setBottomSolidLayer:v11];

  id v12 = [*(id *)(a1 + 32) shapeLayer];
  double v13 = [*(id *)(a1 + 32) topSolidLayer];
  [v12 addSublayer:v13];

  double v14 = [*(id *)(a1 + 32) shapeLayer];
  double v15 = [*(id *)(a1 + 32) bottomSolidLayer];
  [v14 addSublayer:v15];

  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    id v17 = *(uint64_t (**)(void))(result + 16);
    return v17();
  }
  return result;
}

- (id)strokeLayerWithPath:(CGPath *)a3 color:(CGColor *)a4
{
  id v7 = objc_alloc_init(MEMORY[0x263F15880]);
  [v7 setPath:a3];
  [v7 setStrokeColor:a4];
  [v7 setLineWidth:38.0];
  [v7 setLineCap:*MEMORY[0x263F15E70]];
  id v8 = [(SHPaletteLayer *)self palette];
  objc_msgSend(v7, "setFillColor:", objc_msgSend(v8, "clearColor"));

  return v7;
}

- (CGPath)topStrokeLongPath
{
  Mutable = CGPathCreateMutable();
  CGPathMoveToPoint(Mutable, 0, 133.6, 117.9);
  CGPathAddCurveToPoint(Mutable, 0, 144.05, 107.41, 155.21, 96.08, 161.2, 89.7);
  CGPathAddCurveToPoint(Mutable, 0, 181.72, 67.84, 180.89, 30.51, 159.4, 9.7);
  CGPathAddCurveToPoint(Mutable, 0, 136.89, -13.49, 100.97, -11.49, 80.7, 6.17);
  CGPathAddCurveToPoint(Mutable, 0, 80.7, 6.17, 77.6, 9.12, 76.3, 10.4);
  CGPathAddCurveToPoint(Mutable, 0, 62.4, 24.48, 41.85, 44.71, 32.49, 54.68);
  CGPathAddCurveToPoint(Mutable, 0, 11.96, 76.54, 12.8, 113.87, 34.29, 134.68);
  CGPathAddCurveToPoint(Mutable, 0, 56.8, 157.87, 93.03, 156.21, 113.29, 138.21);
  CGPathAddCurveToPoint(Mutable, 0, 119.79, 132.0, 133.69, 117.88, 133.69, 117.88);
  CFAutorelease(Mutable);
  return Mutable;
}

- (CGPath)bottomStrokeLongPath
{
  Mutable = CGPathCreateMutable();
  CGPathMoveToPoint(Mutable, 0, 76.4, 93.5);
  CGPathAddCurveToPoint(Mutable, 0, 65.95, 103.99, 55.21, 114.99, 49.22, 121.37);
  CGPathAddCurveToPoint(Mutable, 0, 28.69, 143.24, 29.53, 180.57, 51.02, 201.37);
  CGPathAddCurveToPoint(Mutable, 0, 73.53, 224.57, 109.45, 222.57, 129.72, 204.9);
  CGPathAddCurveToPoint(Mutable, 0, 129.72, 204.9, 132.31, 202.48, 133.62, 201.2);
  CGPathAddCurveToPoint(Mutable, 0, 147.6, 186.93, 168.16, 166.7, 177.52, 156.72);
  CGPathAddCurveToPoint(Mutable, 0, 198.04, 134.86, 197.21, 97.53, 175.72, 76.72);
  CGPathAddCurveToPoint(Mutable, 0, 153.21, 53.53, 116.98, 55.2, 96.72, 73.2);
  CGPathAddCurveToPoint(Mutable, 0, 90.22, 79.4, 76.32, 93.52, 76.32, 93.52);
  CFAutorelease(Mutable);
  return Mutable;
}

- (CGPath)topStrokePath
{
  Mutable = CGPathCreateMutable();
  CGPathMoveToPoint(Mutable, 0, 76.19, 10.38);
  CGPathAddCurveToPoint(Mutable, 0, 62.4, 24.48, 41.85, 44.71, 32.49, 54.68);
  CGPathAddCurveToPoint(Mutable, 0, 11.96, 76.54, 12.8, 113.87, 34.29, 134.68);
  CGPathAddCurveToPoint(Mutable, 0, 56.8, 157.87, 93.03, 156.21, 113.29, 138.21);
  CGPathAddCurveToPoint(Mutable, 0, 119.79, 132.0, 133.69, 117.88, 133.69, 117.88);
  CFAutorelease(Mutable);
  return Mutable;
}

- (CGPath)bottomStrokePath
{
  Mutable = CGPathCreateMutable();
  CGPathMoveToPoint(Mutable, 0, 133.82, 201.02);
  CGPathAddCurveToPoint(Mutable, 0, 147.6, 186.93, 168.16, 166.7, 177.52, 156.72);
  CGPathAddCurveToPoint(Mutable, 0, 198.04, 134.86, 197.21, 97.53, 175.72, 76.72);
  CGPathAddCurveToPoint(Mutable, 0, 153.21, 53.53, 116.98, 55.2, 96.72, 73.2);
  CGPathAddCurveToPoint(Mutable, 0, 90.22, 79.4, 76.32, 93.52, 76.32, 93.52);
  CFAutorelease(Mutable);
  return Mutable;
}

- (SHShazamButtonViewDelegate)buttonDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_buttonDelegate);
  return (SHShazamButtonViewDelegate *)WeakRetained;
}

- (void)setButtonDelegate:(id)a3
{
}

- (CALayer)backgroundLayer
{
  return self->_backgroundLayer;
}

- (void)setBackgroundLayer:(id)a3
{
}

- (CALayer)shapeLayer
{
  return self->_shapeLayer;
}

- (void)setShapeLayer:(id)a3
{
}

- (CAShapeLayer)topTransparentLayer
{
  return self->_topTransparentLayer;
}

- (void)setTopTransparentLayer:(id)a3
{
}

- (CAShapeLayer)bottomTransparentLayer
{
  return self->_bottomTransparentLayer;
}

- (void)setBottomTransparentLayer:(id)a3
{
}

- (CAShapeLayer)topSolidLayer
{
  return self->_topSolidLayer;
}

- (void)setTopSolidLayer:(id)a3
{
}

- (CAShapeLayer)bottomSolidLayer
{
  return self->_bottomSolidLayer;
}

- (void)setBottomSolidLayer:(id)a3
{
}

- (CAShapeLayer)topBorder
{
  return self->_topBorder;
}

- (void)setTopBorder:(id)a3
{
}

- (BOOL)initialAnimationPerformed
{
  return self->_initialAnimationPerformed;
}

- (void)setInitialAnimationPerformed:(BOOL)a3
{
  self->_initialAnimationPerformed = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_topBorder, 0);
  objc_storeStrong((id *)&self->_bottomSolidLayer, 0);
  objc_storeStrong((id *)&self->_topSolidLayer, 0);
  objc_storeStrong((id *)&self->_bottomTransparentLayer, 0);
  objc_storeStrong((id *)&self->_topTransparentLayer, 0);
  objc_storeStrong((id *)&self->_shapeLayer, 0);
  objc_storeStrong((id *)&self->_backgroundLayer, 0);
  objc_destroyWeak((id *)&self->_buttonDelegate);
}

@end