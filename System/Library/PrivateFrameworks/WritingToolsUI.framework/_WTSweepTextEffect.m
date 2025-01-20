@interface _WTSweepTextEffect
- (BOOL)updatesOnGeometryChange;
- (CADisplayLink)displayLink;
- (CALayer)fadeOutLayer;
- (CALayer)rootMaskLayer;
- (CGSize)lineSize;
- (RBLayer)rbLayer;
- (UIColor)animateFromColor;
- (UIColor)baseFillColor;
- (_WTSweepTextEffect)initWithChunk:(id)a3 effectView:(id)a4;
- (double)startTime;
- (double)sweepRadius;
- (void)RBLayer:(id)a3 draw:(id)a4;
- (void)invalidate:(BOOL)a3;
- (void)setAnimateFromColor:(id)a3;
- (void)setBaseFillColor:(id)a3;
- (void)setDisplayLink:(id)a3;
- (void)setFadeOutLayer:(id)a3;
- (void)setLineSize:(CGSize)a3;
- (void)setRbLayer:(id)a3;
- (void)setRootMaskLayer:(id)a3;
- (void)setStartTime:(double)a3;
- (void)update:(id)a3;
- (void)updateEffectWith:(id)a3;
@end

@implementation _WTSweepTextEffect

- (_WTSweepTextEffect)initWithChunk:(id)a3 effectView:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)_WTSweepTextEffect;
  v4 = [(_WTTextEffect *)&v9 initWithChunk:a3 effectView:a4];
  if (v4)
  {
    uint64_t v5 = +[_WTColor grayColor];
    v6 = (void *)*((void *)v4 + 19);
    *((void *)v4 + 19) = v5;

    *(_OWORD *)(v4 + 200) = *MEMORY[0x263F001B0];
    v7 = v4;
  }

  return (_WTSweepTextEffect *)v4;
}

- (double)sweepRadius
{
  if (self->_lineSize.width <= 0.0 || self->_lineSize.height <= 0.0) {
    [(_WTTextEffect *)self defaultSweepRadius];
  }
  else {
    -[_WTTextEffect sweepRadiusForLineSize:](self, "sweepRadiusForLineSize:");
  }
  return result;
}

- (BOOL)updatesOnGeometryChange
{
  return 1;
}

- (void)invalidate:(BOOL)a3
{
  if (a3)
  {
    dispatch_time_t v4 = dispatch_time(0, 16000000);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __33___WTSweepTextEffect_invalidate___block_invoke;
    block[3] = &unk_26558E508;
    char v10 = 1;
    block[4] = self;
    dispatch_after(v4, MEMORY[0x263EF83A0], block);
  }
  else
  {
    uint64_t v5 = [(_WTSweepTextEffect *)self displayLink];
    [v5 invalidate];

    [(_WTSweepTextEffect *)self setDisplayLink:0];
    v6 = [(_WTTextEffect *)self rootLayer];
    [v6 removeFromSuperlayer];

    v7 = [(_WTTextEffect *)self completion];

    if (v7)
    {
      v8 = [(_WTTextEffect *)self completion];
      v8[2]();
    }
  }
}

- (void)updateEffectWith:(id)a3
{
  uint64_t v75 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v73.receiver = self;
  v73.super_class = (Class)_WTSweepTextEffect;
  [(_WTTextEffect *)&v73 updateEffectWith:v4];
  if ([(_WTTextEffect *)self needsSetup])
  {
    [MEMORY[0x263F158F8] begin];
    [(_WTSweepTextEffect *)self setStartTime:CACurrentMediaTime() + 0.25];
    uint64_t v5 = [MEMORY[0x263F63898] layer];
    [(_WTSweepTextEffect *)self setRbLayer:v5];

    v6 = [(_WTSweepTextEffect *)self rbLayer];
    [v6 setOpaque:0];

    v7 = [(_WTSweepTextEffect *)self rbLayer];
    [v7 setColorMode:11];

    v8 = [(_WTSweepTextEffect *)self rbLayer];
    [v8 setWantsExtendedDynamicRangeContent:1];

    objc_super v9 = [(_WTSweepTextEffect *)self rbLayer];
    char v10 = NSNumber;
    [(_WTTextEffect *)self _maxRequestedEDR];
    v11 = objc_msgSend(v10, "numberWithDouble:");
    [v9 setValue:v11 forKey:@"displayMaximumDesiredEDR"];

    v12 = [(_WTTextEffect *)self effectView];
    v13 = [v12 window];
    [v13 platformBackingScale];
    double v15 = v14;
    v16 = [(_WTSweepTextEffect *)self rbLayer];
    [v16 setContentsScale:v15];

    v17 = [(_WTSweepTextEffect *)self rbLayer];
    [v17 setDelegate:self];

    v18 = [(_WTTextEffect *)self effectView];
    v19 = [v18 platformInstalledDisplayLinkWithTarget:self selector:sel_update_];
    [(_WTSweepTextEffect *)self setDisplayLink:v19];

    v20 = [MEMORY[0x263F157E8] layer];
    [(_WTTextEffect *)self setRootLayer:v20];

    id v21 = [(_WTSweepTextEffect *)self baseFillColor];
    uint64_t v22 = [v21 CGColor];
    v23 = [(_WTTextEffect *)self rootLayer];
    [v23 setBackgroundColor:v22];

    v24 = [(_WTSweepTextEffect *)self animateFromColor];

    if (v24)
    {
      v25 = [MEMORY[0x263F15760] animationWithKeyPath:@"backgroundColor"];
      id v26 = [(_WTSweepTextEffect *)self animateFromColor];
      objc_msgSend(v25, "setFromValue:", objc_msgSend(v26, "CGColor"));

      id v27 = [(_WTSweepTextEffect *)self baseFillColor];
      objc_msgSend(v25, "setToValue:", objc_msgSend(v27, "CGColor"));

      [v25 setDuration:0.35];
      [v25 setFillMode:*MEMORY[0x263F15AA8]];
      [v25 setRemovedOnCompletion:1];
      v28 = [MEMORY[0x263F15808] functionWithName:*MEMORY[0x263F15EB8]];
      [v25 setTimingFunction:v28];

      v29 = [(_WTTextEffect *)self rootLayer];
      [v29 addAnimation:v25 forKey:@"backgroundColor"];
    }
    v30 = [MEMORY[0x263F157E8] layer];
    [(_WTSweepTextEffect *)self setRootMaskLayer:v30];

    v31 = [(_WTSweepTextEffect *)self rootMaskLayer];
    v32 = [(_WTTextEffect *)self rootLayer];
    [v32 setMask:v31];

    v33 = [(_WTTextEffect *)self rootLayer];
    v34 = [(_WTSweepTextEffect *)self rbLayer];
    [v33 addSublayer:v34];

    v35 = [MEMORY[0x263F157E8] layer];
    [(_WTSweepTextEffect *)self setFadeOutLayer:v35];

    v36 = [(_WTTextEffect *)self effectView];
    [v36 bounds];
    double v38 = v37;
    double v40 = v39;
    double v42 = v41;
    double v44 = v43;
    v45 = [(_WTSweepTextEffect *)self fadeOutLayer];
    objc_msgSend(v45, "setFrame:", v38, v40, v42, v44);

    long long v71 = 0u;
    long long v72 = 0u;
    long long v69 = 0u;
    long long v70 = 0u;
    id v46 = v4;
    uint64_t v47 = [v46 countByEnumeratingWithState:&v69 objects:v74 count:16];
    if (v47)
    {
      uint64_t v48 = *(void *)v70;
      do
      {
        uint64_t v49 = 0;
        do
        {
          if (*(void *)v70 != v48) {
            objc_enumerationMutation(v46);
          }
          v50 = *(void **)(*((void *)&v69 + 1) + 8 * v49);
          v51 = [(_WTSweepTextEffect *)self fadeOutLayer];
          v52 = [v50 layerWithContents];
          [v51 addSublayer:v52];

          ++v49;
        }
        while (v47 != v49);
        uint64_t v47 = [v46 countByEnumeratingWithState:&v69 objects:v74 count:16];
      }
      while (v47);
    }

    v53 = [(_WTSweepTextEffect *)self fadeOutLayer];
    [v53 setOpacity:0.0];

    v54 = [(_WTTextEffect *)self effectView];
    v55 = [v54 layer];
    v56 = [(_WTTextEffect *)self rootLayer];
    [v55 addSublayer:v56];

    v57 = [(_WTTextEffect *)self effectView];
    v58 = [v57 layer];
    v59 = [(_WTSweepTextEffect *)self fadeOutLayer];
    v60 = [(_WTTextEffect *)self rootLayer];
    [v58 insertSublayer:v59 above:v60];

    v68[0] = MEMORY[0x263EF8330];
    v68[1] = 3221225472;
    v68[2] = __39___WTSweepTextEffect_updateEffectWith___block_invoke;
    v68[3] = &unk_26558E530;
    v68[4] = self;
    [MEMORY[0x263F158F8] setCompletionBlock:v68];
    v61 = [MEMORY[0x263F15760] animationWithKeyPath:@"opacity"];
    [v61 setFromValue:&unk_270DBA140];
    [v61 setToValue:&unk_270DBA158];
    [v61 setDuration:0.75];
    [v61 setFillMode:*MEMORY[0x263F15AA8]];
    [v61 setRemovedOnCompletion:1];
    v62 = [MEMORY[0x263F15808] functionWithName:*MEMORY[0x263F15EB8]];
    [v61 setTimingFunction:v62];

    v63 = [(_WTSweepTextEffect *)self fadeOutLayer];
    [v63 addAnimation:v61 forKey:@"opacity"];

    [MEMORY[0x263F158F8] commit];
  }
  v64 = [(_WTTextEffect *)self effectView];
  v66[0] = MEMORY[0x263EF8330];
  v66[1] = 3221225472;
  v66[2] = __39___WTSweepTextEffect_updateEffectWith___block_invoke_21;
  v66[3] = &unk_26558E5A8;
  v66[4] = self;
  id v67 = v4;
  id v65 = v4;
  [v64 platformPerformWithoutAnimation:v66];
}

- (void)update:(id)a3
{
  id v4 = [(_WTSweepTextEffect *)self displayLink];
  [v4 timestamp];
  double v6 = v5;
  [(_WTSweepTextEffect *)self startTime];
  double v8 = v7;

  [(_WTSweepTextEffect *)self startTime];
  if (v9 == 0.0 || ([(_WTTextEffect *)self sweepDuration], v6 - v8 > v10))
  {
    v11 = [(_WTSweepTextEffect *)self displayLink];
    [v11 timestamp];
    -[_WTSweepTextEffect setStartTime:](self, "setStartTime:");
  }
  id v12 = [(_WTSweepTextEffect *)self rbLayer];
  [v12 setNeedsDisplay];
}

- (void)RBLayer:(id)a3 draw:(id)a4
{
  id v5 = a4;
  [(_WTTextEffect *)self effectVisibilityFrame];
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  double v13 = v12;
  double v14 = [(_WTTextEffect *)self effectView];
  [v14 platformGetVisibleRect];
  id v44 = v15;

  v16 = [(_WTSweepTextEffect *)self displayLink];
  [v16 timestamp];
  double v18 = v17;
  [(_WTSweepTextEffect *)self startTime];
  double v20 = v18 - v19;
  [(_WTTextEffect *)self sweepDuration];
  double v22 = v20 / v21;

  v23 = [MEMORY[0x263F15808] functionWithName:*MEMORY[0x263F15EA0]];
  *(float *)&double v24 = v22;
  [v23 _solveForInput:v24];
  double v26 = v25;

  if (v13 >= 320.0) {
    double v27 = v13;
  }
  else {
    double v27 = 320.0;
  }
  [(_WTSweepTextEffect *)self sweepRadius];
  double v29 = v28;
  double v30 = v28 + v27 * v26 * 2.0;
  v47.origin.x = v7;
  v47.origin.y = v9;
  v47.size.width = v11;
  v47.size.height = v13;
  double MidX = CGRectGetMidX(v47);
  v48.origin.x = v7;
  v48.origin.y = v9;
  v48.size.width = v11;
  v48.size.height = v13;
  double v32 = v29 + CGRectGetMaxY(v48) + 50.0 - *(double *)&v44;
  id v45 = (id)objc_opt_new();
  v33 = +[_WTLightEffectPalette ponderingSweep];
  -[_WTTextEffect _applyToFill:colors:center:startRadius:endRadius:](self, "_applyToFill:colors:center:startRadius:endRadius:", v45, v33, MidX, v32, v29, v30);

  v34 = objc_opt_new();
  [v34 setInfinite];
  [v5 beginLayer];
  [v5 addBlurFilterWithRadius:50.0];
  LODWORD(v35) = 1045220557;
  [v5 addBrightnessFilterWithAmount:v35];
  LODWORD(v36) = 1067030938;
  [v5 addContrastFilterWithAmount:v36];
  [(_WTTextEffect *)self clamp:v26 min:0.5 max:1.0];
  double v38 = 1.0 - v37;
  *(float *)&double v38 = v38;
  [v5 drawShape:v34 fill:v45 alpha:0 blendMode:v38];
  LODWORD(v39) = 1.0;
  [v5 drawLayerWithAlpha:0 blendMode:v39];
  [v5 beginLayer];
  double v40 = objc_opt_new();
  double v41 = +[_WTLightEffectPalette ponderingLightEdge];
  -[_WTTextEffect _applyToFill:colors:center:startRadius:endRadius:](self, "_applyToFill:colors:center:startRadius:endRadius:", v40, v41, MidX, v32, v30 + -130.0, v30);

  [v5 addBlurFilterWithRadius:20.0];
  LODWORD(v42) = *(_DWORD *)"333?";
  [v5 drawShape:v34 fill:v40 alpha:27 blendMode:v42];
  LODWORD(v43) = 1.0;
  [v5 drawLayerWithAlpha:1003 blendMode:v43];
}

- (UIColor)animateFromColor
{
  return self->_animateFromColor;
}

- (void)setAnimateFromColor:(id)a3
{
}

- (UIColor)baseFillColor
{
  return self->_baseFillColor;
}

- (void)setBaseFillColor:(id)a3
{
}

- (CGSize)lineSize
{
  double width = self->_lineSize.width;
  double height = self->_lineSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setLineSize:(CGSize)a3
{
  self->_lineSize = a3;
}

- (RBLayer)rbLayer
{
  return (RBLayer *)objc_getProperty(self, a2, 160, 1);
}

- (void)setRbLayer:(id)a3
{
}

- (CADisplayLink)displayLink
{
  return (CADisplayLink *)objc_getProperty(self, a2, 168, 1);
}

- (void)setDisplayLink:(id)a3
{
}

- (double)startTime
{
  return self->_startTime;
}

- (void)setStartTime:(double)a3
{
  self->_startTime = a3;
}

- (CALayer)rootMaskLayer
{
  return (CALayer *)objc_getProperty(self, a2, 184, 1);
}

- (void)setRootMaskLayer:(id)a3
{
}

- (CALayer)fadeOutLayer
{
  return (CALayer *)objc_getProperty(self, a2, 192, 1);
}

- (void)setFadeOutLayer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fadeOutLayer, 0);
  objc_storeStrong((id *)&self->_rootMaskLayer, 0);
  objc_storeStrong((id *)&self->_displayLink, 0);
  objc_storeStrong((id *)&self->_rbLayer, 0);
  objc_storeStrong((id *)&self->_baseFillColor, 0);

  objc_storeStrong((id *)&self->_animateFromColor, 0);
}

@end