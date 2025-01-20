@interface _WTReplaceTextEffect
- (BOOL)animateRemovalWhenDone;
- (BOOL)highlightsCandidateRects;
- (BOOL)isDestination;
- (CADisplayLink)displayLink;
- (CALayer)nonCandidateTextContent;
- (CALayer)nonCandidateTextContentMask;
- (CALayer)textContentMask;
- (NSArray)coolPalette;
- (NSArray)warmPalette;
- (RBDisplayListInterpolator)colorFillInterpolator;
- (RBDisplayListInterpolator)interpolator;
- (RBLayer)rootMask;
- (RBLayer)textContent;
- (_WTColor)destinationColor;
- (_WTReplaceTextEffect)initWithChunk:(id)a3 effectView:(id)a4;
- (double)startTime;
- (double)sweepDuration;
- (id)completion;
- (id)preCompletion;
- (void)RBLayer:(id)a3 draw:(id)a4;
- (void)_alignFrames;
- (void)invalidate:(BOOL)a3;
- (void)prepareWithCoolPalette:(id)a3 warmPalette:(id)a4;
- (void)setAnimateRemovalWhenDone:(BOOL)a3;
- (void)setColorFillInterpolator:(id)a3;
- (void)setCompletion:(id)a3;
- (void)setDestinationColor:(id)a3;
- (void)setDisplayLink:(id)a3;
- (void)setHighlightsCandidateRects:(BOOL)a3;
- (void)setInterpolator:(id)a3;
- (void)setIsDestination:(BOOL)a3;
- (void)setNonCandidateTextContent:(id)a3;
- (void)setNonCandidateTextContentMask:(id)a3;
- (void)setPreCompletion:(id)a3;
- (void)setRootMask:(id)a3;
- (void)setStartTime:(double)a3;
- (void)setTextContent:(id)a3;
- (void)setTextContentMask:(id)a3;
- (void)update:(id)a3;
- (void)updateEffectWith:(id)a3;
@end

@implementation _WTReplaceTextEffect

- (_WTReplaceTextEffect)initWithChunk:(id)a3 effectView:(id)a4
{
  v11.receiver = self;
  v11.super_class = (Class)_WTReplaceTextEffect;
  v4 = [(_WTTextEffect *)&v11 initWithChunk:a3 effectView:a4];
  if (v4)
  {
    uint64_t v5 = +[_WTLightEffectPalette coolColors];
    coolPalette = v4->_coolPalette;
    v4->_coolPalette = (NSArray *)v5;

    uint64_t v7 = +[_WTLightEffectPalette warmColors];
    warmPalette = v4->_warmPalette;
    v4->_warmPalette = (NSArray *)v7;

    [(_WTReplaceTextEffect *)v4 setAnimateRemovalWhenDone:1];
    v9 = v4;
  }

  return v4;
}

- (double)sweepDuration
{
  [(_WTTextEffect *)self effectVisibilityFrame];
  double v3 = v2 / 800.0 * 2.2;
  double v4 = 2.5;
  if (v3 <= 2.5) {
    double v4 = v2 / 800.0 * 2.2;
  }
  if (v3 >= 1.5) {
    return v4;
  }
  else {
    return 1.5;
  }
}

- (void)prepareWithCoolPalette:(id)a3 warmPalette:(id)a4
{
  v6 = (NSArray *)a3;
  uint64_t v7 = (NSArray *)a4;
  coolPalette = self->_coolPalette;
  self->_coolPalette = v6;
  v10 = v6;

  warmPalette = self->_warmPalette;
  self->_warmPalette = v7;
}

- (void)invalidate:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = [(_WTReplaceTextEffect *)self displayLink];
  [v5 invalidate];

  [(_WTReplaceTextEffect *)self setDisplayLink:0];
  BOOL v6 = [(_WTReplaceTextEffect *)self isDestination];
  BOOL v7 = v6;
  if (v6)
  {
    v8 = [(_WTReplaceTextEffect *)self completion];

    if (v8)
    {
      v9 = [(_WTReplaceTextEffect *)self completion];
      v9[2]();
    }
  }
  [MEMORY[0x263F158F8] begin];
  double v10 = 0.0;
  if (v3) {
    double v10 = 0.25;
  }
  [MEMORY[0x263F158F8] setAnimationDuration:v10];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __35___WTReplaceTextEffect_invalidate___block_invoke;
  v12[3] = &unk_26558E508;
  v12[4] = self;
  BOOL v13 = v7;
  [MEMORY[0x263F158F8] setCompletionBlock:v12];
  objc_super v11 = [(_WTTextEffect *)self rootLayer];
  [v11 setOpacity:0.0];

  [MEMORY[0x263F158F8] commit];
}

- (void)updateEffectWith:(id)a3
{
  uint64_t v123 = *MEMORY[0x263EF8340];
  v120.receiver = self;
  v120.super_class = (Class)_WTReplaceTextEffect;
  id v97 = a3;
  -[_WTTextEffect updateEffectWith:](&v120, sel_updateEffectWith_);
  BOOL v3 = [(_WTTextEffect *)self effectView];
  [v3 platformGetVisibleRect];
  double v5 = v4;
  double v7 = v6;

  if ([(_WTTextEffect *)self needsSetup])
  {
    v119[0] = MEMORY[0x263EF8330];
    v119[1] = 3221225472;
    v119[2] = __41___WTReplaceTextEffect_updateEffectWith___block_invoke;
    v119[3] = &unk_26558E758;
    v119[4] = self;
    [v97 enumerateObjectsUsingBlock:v119];
    [(_WTTextEffect *)self effectVisibilityFrame];
    double v9 = v8;
    [(_WTReplaceTextEffect *)self sweepDuration];
    double v11 = v10;
    v12 = (void *)MEMORY[0x263F157E8];
    if ([(_WTReplaceTextEffect *)self isDestination]) {
      BOOL v13 = @"destination rootLayer";
    }
    else {
      BOOL v13 = @"source rootLayer";
    }
    v14 = [v12 layerWithName:v13];
    [(_WTTextEffect *)self setRootLayer:v14];

    if ([(_WTReplaceTextEffect *)self highlightsCandidateRects])
    {
      v15 = [MEMORY[0x263F157E8] layerWithName:@"nonCandidateTextContent"];
      [(_WTReplaceTextEffect *)self setNonCandidateTextContent:v15];

      id v16 = +[_WTColor grayColor];
      uint64_t v17 = [v16 CGColor];
      v18 = [(_WTReplaceTextEffect *)self nonCandidateTextContent];
      [v18 setBackgroundColor:v17];

      v19 = [MEMORY[0x263F157E8] layerWithName:@"nonCandidateTextContentMask"];
      [(_WTReplaceTextEffect *)self setNonCandidateTextContentMask:v19];

      v20 = [(_WTReplaceTextEffect *)self nonCandidateTextContentMask];
      v21 = [(_WTReplaceTextEffect *)self nonCandidateTextContent];
      [v21 setMask:v20];
    }
    v22 = [MEMORY[0x263F157E8] layerWithName:@"textContentMask"];
    [(_WTReplaceTextEffect *)self setTextContentMask:v22];

    double v103 = CACurrentMediaTime();
    long long v117 = 0u;
    long long v118 = 0u;
    long long v115 = 0u;
    long long v116 = 0u;
    id obj = v97;
    uint64_t v105 = [obj countByEnumeratingWithState:&v115 objects:v122 count:16];
    if (v105)
    {
      double v100 = v11 * (v9 / (v9 * 3.0)) / v9;
      uint64_t v104 = *(void *)v116;
      uint64_t v101 = *MEMORY[0x263F15EB0];
      uint64_t v102 = *MEMORY[0x263F15EC0];
      uint64_t v99 = *MEMORY[0x263F15AA8];
      do
      {
        uint64_t v23 = 0;
        do
        {
          if (*(void *)v116 != v104)
          {
            uint64_t v24 = v23;
            objc_enumerationMutation(obj);
            uint64_t v23 = v24;
          }
          uint64_t v106 = v23;
          v107 = *(void **)(*((void *)&v115 + 1) + 8 * v23);
          v25 = [v107 layerWithContents];
          [v25 setName:@"textContentLayer"];
          if ([(_WTReplaceTextEffect *)self highlightsCandidateRects])
          {
            v108 = [v107 layerWithContents];
            [v108 setName:@"nonCandidateTextContentLayer"];
            v26 = [MEMORY[0x263F157E8] layerWithName:@"candidatesMask"];
            [v25 bounds];
            objc_msgSend(v26, "setFrame:");
            v27 = [MEMORY[0x263F157E8] layerWithName:@"nonCandidatesMask"];
            [v25 bounds];
            objc_msgSend(v27, "setFrame:");
            long long v113 = 0u;
            long long v114 = 0u;
            long long v111 = 0u;
            long long v112 = 0u;
            v28 = [v107 candidateRects];
            uint64_t v29 = [v28 countByEnumeratingWithState:&v111 objects:v121 count:16];
            if (v29)
            {
              uint64_t v30 = *(void *)v112;
              do
              {
                for (uint64_t i = 0; i != v29; ++i)
                {
                  if (*(void *)v112 != v30) {
                    objc_enumerationMutation(v28);
                  }
                  v32 = *(void **)(*((void *)&v111 + 1) + 8 * i);
                  v33 = [MEMORY[0x263F157E8] layerWithName:@"canididateRectMask"];
                  [v26 addSublayer:v33];
                  [v32 platformCGRectValue];
                  objc_msgSend(v25, "convertRect:fromLayer:", v26);
                  objc_msgSend(v33, "setFrame:");
                  id v34 = +[_WTColor blackColor];
                  objc_msgSend(v33, "setBackgroundColor:", objc_msgSend(v34, "CGColor"));

                  v35 = [MEMORY[0x263F157E8] layerWithName:@"nonCanididateRectMask"];
                  [v27 addSublayer:v35];
                  [v32 platformCGRectValue];
                  objc_msgSend(v25, "convertRect:fromLayer:", v27);
                  objc_msgSend(v35, "setFrame:");
                  id v36 = +[_WTColor whiteColor];
                  objc_msgSend(v35, "setBackgroundColor:", objc_msgSend(v36, "CGColor"));
                }
                uint64_t v29 = [v28 countByEnumeratingWithState:&v111 objects:v121 count:16];
              }
              while (v29);
            }

            [v25 setMask:v26];
            v37 = [MEMORY[0x263F157E8] layerWithName:@"inverter"];
            [v108 bounds];
            objc_msgSend(v37, "setFrame:");
            id v38 = +[_WTColor whiteColor];
            objc_msgSend(v37, "setBackgroundColor:", objc_msgSend(v38, "CGColor"));

            [v27 setCompositingFilter:@"xor"];
            [v37 addSublayer:v27];
            [v108 setMask:v37];
            v39 = [(_WTReplaceTextEffect *)self nonCandidateTextContentMask];
            [v39 addSublayer:v108];
          }
          else
          {
            v108 = 0;
          }
          v40 = [(_WTReplaceTextEffect *)self textContentMask];
          [v40 addSublayer:v25];

          [v25 position];
          double v42 = v41;
          [v25 position];
          double v44 = v43;
          [v25 position];
          double v46 = v45;
          [v25 position];
          double v47 = v42 - v5;
          double v48 = v44 - v7;
          double v49 = v46 - v5;
          double v51 = v50 + 12.0 - v7;
          if ([(_WTReplaceTextEffect *)self isDestination])
          {
            objc_msgSend(v25, "setPosition:", v46 - v5, v51);
            objc_msgSend(v108, "setPosition:", v46 - v5, v51);
            double v52 = v46 - v5;
            double v53 = v51;
            double v51 = v48;
            double v49 = v47;
          }
          else
          {
            double v52 = v47;
            double v53 = v48;
          }
          v54 = [MEMORY[0x263F15760] animationWithKeyPath:@"position"];
          v55 = (void *)MEMORY[0x263F15808];
          if ([(_WTReplaceTextEffect *)self isDestination]) {
            uint64_t v56 = v102;
          }
          else {
            uint64_t v56 = v101;
          }
          v57 = [v55 functionWithName:v56];
          [v54 setTimingFunction:v57];

          v58 = objc_msgSend(MEMORY[0x263F08D40], "valueWithPlatformCGPoint:", v52, v53);
          [v54 setFromValue:v58];

          v59 = objc_msgSend(MEMORY[0x263F08D40], "valueWithPlatformCGPoint:", v49, v51);
          [v54 setToValue:v59];

          [v54 setDuration:0.25];
          if ([(_WTReplaceTextEffect *)self isDestination]) {
            double v60 = 0.2;
          }
          else {
            double v60 = 0.0;
          }
          [v107 presentationFrame];
          double MinY = CGRectGetMinY(v124);
          [(_WTTextEffect *)self effectVisibilityFrame];
          [v54 setBeginTime:v60 + v103 + v100 * (MinY - CGRectGetMinY(v125))];
          [v54 setFillMode:v99];
          [v54 setRemovedOnCompletion:0];
          [v25 addAnimation:v54 forKey:0];
          [v108 addAnimation:v54 forKey:0];

          uint64_t v23 = v106 + 1;
        }
        while (v106 + 1 != v105);
        uint64_t v105 = [obj countByEnumeratingWithState:&v115 objects:v122 count:16];
      }
      while (v105);
    }

    v62 = [(_WTTextEffect *)self effectView];
    v63 = [v62 window];
    [v63 platformBackingScale];
    double v65 = v64;

    v66 = [MEMORY[0x263F63898] layer];
    [(_WTReplaceTextEffect *)self setTextContent:v66];

    v67 = [(_WTReplaceTextEffect *)self textContent];
    [v67 setName:@"textContent"];

    v68 = [(_WTReplaceTextEffect *)self textContent];
    [v68 setOpaque:0];

    v69 = [(_WTReplaceTextEffect *)self textContent];
    [v69 setColorMode:11];

    v70 = [(_WTReplaceTextEffect *)self textContent];
    [v70 setWantsExtendedDynamicRangeContent:1];

    v71 = [(_WTReplaceTextEffect *)self textContent];
    v72 = NSNumber;
    [(_WTTextEffect *)self _maxRequestedEDR];
    v73 = objc_msgSend(v72, "numberWithDouble:");
    [v71 setValue:v73 forKey:@"displayMaximumDesiredEDR"];

    v74 = [(_WTReplaceTextEffect *)self textContent];
    [v74 setContentsScale:v65];

    v75 = [(_WTReplaceTextEffect *)self textContent];
    [v75 setDelegate:self];

    v76 = [MEMORY[0x263F63898] layer];
    [(_WTReplaceTextEffect *)self setRootMask:v76];

    v77 = [(_WTReplaceTextEffect *)self rootMask];
    [v77 setName:@"rootMask"];

    v78 = [(_WTReplaceTextEffect *)self rootMask];
    [v78 setOpaque:0];

    v79 = [(_WTReplaceTextEffect *)self rootMask];
    [v79 setContentsScale:v65];

    v80 = [(_WTReplaceTextEffect *)self rootMask];
    [v80 setDelegate:self];

    v81 = [(_WTReplaceTextEffect *)self rootMask];
    v82 = [(_WTTextEffect *)self rootLayer];
    [v82 setMask:v81];

    v83 = [(_WTReplaceTextEffect *)self textContentMask];
    v84 = [(_WTReplaceTextEffect *)self textContent];
    [v84 setMask:v83];

    v85 = [(_WTTextEffect *)self rootLayer];
    v86 = [(_WTReplaceTextEffect *)self textContent];
    [v85 addSublayer:v86];

    v87 = [(_WTTextEffect *)self rootLayer];
    v88 = [(_WTReplaceTextEffect *)self nonCandidateTextContent];
    [v87 addSublayer:v88];

    v89 = [(_WTTextEffect *)self effectView];
    v90 = [v89 layer];
    v91 = [(_WTTextEffect *)self rootLayer];
    [v90 addSublayer:v91];

    v92 = [(_WTTextEffect *)self effectView];
    v93 = [v92 platformInstalledDisplayLinkWithTarget:self selector:sel_update_];
    [(_WTReplaceTextEffect *)self setDisplayLink:v93];

    [(_WTTextEffect *)self invalidationDelay];
    if (v94 <= 0.0) {
      [(_WTReplaceTextEffect *)self sweepDuration];
    }
    else {
      [(_WTTextEffect *)self invalidationDelay];
    }
    dispatch_time_t v96 = dispatch_time(0, (uint64_t)(v95 * 1000000000.0));
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __41___WTReplaceTextEffect_updateEffectWith___block_invoke_2;
    block[3] = &unk_26558E530;
    block[4] = self;
    dispatch_after(v96, MEMORY[0x263EF83A0], block);
  }
  [(_WTReplaceTextEffect *)self _alignFrames];
}

- (void)_alignFrames
{
  BOOL v3 = [(_WTTextEffect *)self effectView];
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  v12 = [(_WTTextEffect *)self rootLayer];
  objc_msgSend(v12, "setFrame:", v5, v7, v9, v11);

  BOOL v13 = [(_WTTextEffect *)self effectView];
  [v13 bounds];
  double v15 = v14;
  double v17 = v16;
  double v19 = v18;
  double v21 = v20;
  v22 = [(_WTReplaceTextEffect *)self textContentMask];
  objc_msgSend(v22, "setFrame:", v15, v17, v19, v21);

  uint64_t v23 = [(_WTTextEffect *)self effectView];
  [v23 platformGetVisibleRect];
  double v25 = v24;
  double v27 = v26;
  double v29 = v28;
  double v31 = v30;
  v32 = [(_WTReplaceTextEffect *)self nonCandidateTextContent];
  objc_msgSend(v32, "setFrame:", v25, v27, v29, v31);

  v33 = [(_WTTextEffect *)self effectView];
  [v33 platformGetVisibleRect];
  double v35 = v34;
  double v37 = v36;
  double v39 = v38;
  double v41 = v40;
  double v42 = [(_WTReplaceTextEffect *)self rootMask];
  objc_msgSend(v42, "setFrame:", v35, v37, v39, v41);

  id v52 = [(_WTTextEffect *)self effectView];
  [v52 platformGetVisibleRect];
  double v44 = v43;
  double v46 = v45;
  double v48 = v47;
  double v50 = v49;
  double v51 = [(_WTReplaceTextEffect *)self textContent];
  objc_msgSend(v51, "setFrame:", v44, v46, v48, v50);
}

- (void)update:(id)a3
{
  double v4 = [(_WTTextEffect *)self effectView];
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __31___WTReplaceTextEffect_update___block_invoke;
  v17[3] = &unk_26558E530;
  v17[4] = self;
  [v4 platformPerformWithoutAnimation:v17];

  [(_WTReplaceTextEffect *)self startTime];
  if (v5 == 0.0)
  {
    double v6 = [(_WTReplaceTextEffect *)self displayLink];
    [v6 timestamp];
    -[_WTReplaceTextEffect setStartTime:](self, "setStartTime:");
  }
  double v7 = [(_WTReplaceTextEffect *)self displayLink];
  [v7 timestamp];
  double v9 = v8;
  [(_WTReplaceTextEffect *)self startTime];
  double v11 = v9 - v10;

  [(_WTTextEffect *)self invalidationDelay];
  if (v12 <= 0.0) {
    [(_WTReplaceTextEffect *)self sweepDuration];
  }
  else {
    [(_WTTextEffect *)self invalidationDelay];
  }
  if (v11 > v13)
  {
    double v14 = [(_WTReplaceTextEffect *)self displayLink];
    [v14 invalidate];
  }
  double v15 = [(_WTReplaceTextEffect *)self rootMask];
  [v15 setNeedsDisplay];

  double v16 = [(_WTReplaceTextEffect *)self textContent];
  [v16 setNeedsDisplay];
}

- (void)RBLayer:(id)a3 draw:(id)a4
{
  id v76 = a3;
  id v6 = a4;
  [(_WTTextEffect *)self defaultSweepRadius];
  double v8 = v7;
  [(_WTTextEffect *)self effectVisibilityFrame];
  double v10 = v9;
  double v11 = [(_WTTextEffect *)self effectView];
  [v11 platformGetVisibleRect];
  double v13 = v12;

  [(_WTTextEffect *)self effectVisibilityFrame];
  double MidX = CGRectGetMidX(v78);
  [(_WTTextEffect *)self effectVisibilityFrame];
  double v15 = CGRectGetMinY(v79) - v8 - v13;
  double v16 = v8 - v10;
  double v75 = v8 - v10 + v10 * 3.0;
  double v17 = v8 + v10 * 3.0;
  double v18 = [(_WTReplaceTextEffect *)self displayLink];
  [v18 timestamp];
  double v20 = v19;
  [(_WTReplaceTextEffect *)self startTime];
  double v22 = v21;
  [(_WTReplaceTextEffect *)self sweepDuration];
  double v24 = v23;

  id v25 = [(_WTReplaceTextEffect *)self textContent];

  if (v25 == v76)
  {
    v32 = [(_WTReplaceTextEffect *)self colorFillInterpolator];

    if (!v32)
    {
      v33 = objc_opt_new();
      double v34 = objc_opt_new();
      double v35 = objc_opt_new();
      [v35 setInfinite];
      double v36 = objc_opt_new();
      double v37 = [(_WTTextEffect *)self effectView];
      int v38 = [v37 _WTIsDarkMode];

      LODWORD(v39) = 0.5;
      LODWORD(v40) = 0.5;
      LODWORD(v41) = 0.5;
      LODWORD(v42) = 1.0;
      objc_msgSend(v36, "setColor:", v39, v40, v41, v42);
      LODWORD(v43) = 1.0;
      [v33 drawShape:v35 fill:v36 alpha:0 blendMode:v43];
      double v44 = [(_WTReplaceTextEffect *)self destinationColor];
      double v45 = v44;
      if (v44)
      {
        id v46 = v44;
      }
      else
      {
        double v47 = 0.0;
        if (v38) {
          double v47 = 1.0;
        }
        objc_msgSend(MEMORY[0x263F825C8], "colorWithWhite:alpha:", v47);
        id v46 = (id)objc_claimAutoreleasedReturnValue();
      }
      double v48 = v46;

      if ([(_WTReplaceTextEffect *)self isDestination])
      {
        [v48 CGColor];
        RBColorFromCGColor();
      }
      else
      {
        LODWORD(v51) = 0.5;
        LODWORD(v52) = 1.0;
        LODWORD(v50) = 0.5;
        LODWORD(v49) = 0.5;
      }
      objc_msgSend(v36, "setColor:", v49, v50, v51, v52);
      LODWORD(v53) = 1.0;
      [v34 drawShape:v35 fill:v36 alpha:0 blendMode:v53];
      v54 = objc_opt_new();
      if ([(_WTReplaceTextEffect *)self isDestination])
      {
        v55 = +[_WTLightEffectPalette replaceDestinationColors];
        -[_WTTextEffect _applyToFill:colors:center:startRadius:endRadius:](self, "_applyToFill:colors:center:startRadius:endRadius:", v54, v55, MidX, v15, v16, v8);

        LODWORD(v56) = 2.0;
        [v33 drawShape:v35 fill:v54 alpha:0 blendMode:v56];
        v57 = +[_WTLightEffectPalette ponderingLightEdgeDestination];
        -[_WTTextEffect _applyToFill:colors:center:startRadius:endRadius:](self, "_applyToFill:colors:center:startRadius:endRadius:", v54, v57, MidX, v15, v8 + -80.0, v8);

        LODWORD(v58) = 1.0;
        [v33 drawShape:v35 fill:v54 alpha:27 blendMode:v58];
        [v33 addBlurFilterWithRadius:10.0];
        LODWORD(v59) = 1028443341;
        [v33 addBrightnessFilterWithAmount:v59];
        double v60 = +[_WTLightEffectPalette replaceDestinationColors];
        -[_WTTextEffect _applyToFill:colors:center:startRadius:endRadius:](self, "_applyToFill:colors:center:startRadius:endRadius:", v54, v60, MidX, v15, v75, v17);

        double v61 = 0.0;
        if (v38) {
          *(float *)&double v61 = 0.5;
        }
        [v34 drawShape:v35 fill:v54 alpha:0 blendMode:v61];
        v62 = +[_WTLightEffectPalette ponderingLightEdgeDestination];
        -[_WTTextEffect _applyToFill:colors:center:startRadius:endRadius:](self, "_applyToFill:colors:center:startRadius:endRadius:", v54, v62, MidX, v15, v17 + -80.0, v17);

        LODWORD(v63) = 1.0;
        [v34 drawShape:v35 fill:v54 alpha:27 blendMode:v63];
        [v34 addBlurFilterWithRadius:10.0];
        LODWORD(v64) = 1028443341;
        [v34 addBrightnessFilterWithAmount:v64];
      }
      double v65 = [MEMORY[0x263F63870] interpolatorWithFrom:v33 to:v34 options:0];
      [(_WTReplaceTextEffect *)self setColorFillInterpolator:v65];
    }
    uint64_t v66 = [(_WTReplaceTextEffect *)self colorFillInterpolator];
  }
  else
  {
    id v26 = [(_WTReplaceTextEffect *)self rootMask];

    if (v26 != v76) {
      goto LABEL_25;
    }
    double v27 = [(_WTReplaceTextEffect *)self interpolator];

    if (!v27)
    {
      double v28 = objc_opt_new();
      double v29 = objc_opt_new();
      double v30 = objc_opt_new();
      [v30 setInfinite];
      double v31 = objc_opt_new();
      if ([(_WTReplaceTextEffect *)self isDestination]) {
        +[_WTLightEffectPalette replaceDestinationSweepMask];
      }
      else {
      v67 = +[_WTLightEffectPalette replaceSourceSweepMask];
      }
      -[_WTTextEffect _applyToFill:colors:center:startRadius:endRadius:](self, "_applyToFill:colors:center:startRadius:endRadius:", v31, v67, MidX, v15, v16, v8);
      LODWORD(v68) = 1.0;
      [v28 drawShape:v30 fill:v31 alpha:0 blendMode:v68];
      -[_WTTextEffect _applyToFill:colors:center:startRadius:endRadius:](self, "_applyToFill:colors:center:startRadius:endRadius:", v31, v67, MidX, v15, v75, v17);
      LODWORD(v69) = 1.0;
      [v29 drawShape:v30 fill:v31 alpha:0 blendMode:v69];
      v70 = [MEMORY[0x263F63870] interpolatorWithFrom:v28 to:v29 options:0];
      [(_WTReplaceTextEffect *)self setInterpolator:v70];
    }
    uint64_t v66 = [(_WTReplaceTextEffect *)self interpolator];
  }
  v71 = (void *)v66;
  float v72 = (v20 - v22) / v24;
  uint64_t State = RBDisplayListGetState();
  *(float *)&double v74 = v72;
  [v71 drawInState:State by:v74];

LABEL_25:
}

- (id)completion
{
  return objc_getProperty(self, a2, 152, 1);
}

- (void)setCompletion:(id)a3
{
}

- (id)preCompletion
{
  return objc_getProperty(self, a2, 160, 1);
}

- (void)setPreCompletion:(id)a3
{
}

- (BOOL)animateRemovalWhenDone
{
  return self->_animateRemovalWhenDone;
}

- (void)setAnimateRemovalWhenDone:(BOOL)a3
{
  self->_animateRemovalWhenDone = a3;
}

- (BOOL)isDestination
{
  return self->_isDestination;
}

- (void)setIsDestination:(BOOL)a3
{
  self->_isDestination = a3;
}

- (BOOL)highlightsCandidateRects
{
  return self->_highlightsCandidateRects;
}

- (void)setHighlightsCandidateRects:(BOOL)a3
{
  self->_highlightsCandidateRects = a3;
}

- (_WTColor)destinationColor
{
  return self->_destinationColor;
}

- (void)setDestinationColor:(id)a3
{
}

- (RBLayer)rootMask
{
  return (RBLayer *)objc_getProperty(self, a2, 176, 1);
}

- (void)setRootMask:(id)a3
{
}

- (RBLayer)textContent
{
  return (RBLayer *)objc_getProperty(self, a2, 184, 1);
}

- (void)setTextContent:(id)a3
{
}

- (CALayer)textContentMask
{
  return (CALayer *)objc_getProperty(self, a2, 192, 1);
}

- (void)setTextContentMask:(id)a3
{
}

- (CALayer)nonCandidateTextContent
{
  return (CALayer *)objc_getProperty(self, a2, 200, 1);
}

- (void)setNonCandidateTextContent:(id)a3
{
}

- (CALayer)nonCandidateTextContentMask
{
  return (CALayer *)objc_getProperty(self, a2, 208, 1);
}

- (void)setNonCandidateTextContentMask:(id)a3
{
}

- (CADisplayLink)displayLink
{
  return (CADisplayLink *)objc_getProperty(self, a2, 216, 1);
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

- (RBDisplayListInterpolator)interpolator
{
  return (RBDisplayListInterpolator *)objc_getProperty(self, a2, 232, 1);
}

- (void)setInterpolator:(id)a3
{
}

- (RBDisplayListInterpolator)colorFillInterpolator
{
  return (RBDisplayListInterpolator *)objc_getProperty(self, a2, 240, 1);
}

- (void)setColorFillInterpolator:(id)a3
{
}

- (NSArray)coolPalette
{
  return self->_coolPalette;
}

- (NSArray)warmPalette
{
  return self->_warmPalette;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_warmPalette, 0);
  objc_storeStrong((id *)&self->_coolPalette, 0);
  objc_storeStrong((id *)&self->_colorFillInterpolator, 0);
  objc_storeStrong((id *)&self->_interpolator, 0);
  objc_storeStrong((id *)&self->_displayLink, 0);
  objc_storeStrong((id *)&self->_nonCandidateTextContentMask, 0);
  objc_storeStrong((id *)&self->_nonCandidateTextContent, 0);
  objc_storeStrong((id *)&self->_textContentMask, 0);
  objc_storeStrong((id *)&self->_textContent, 0);
  objc_storeStrong((id *)&self->_rootMask, 0);
  objc_storeStrong((id *)&self->_destinationColor, 0);
  objc_storeStrong(&self->preCompletion, 0);

  objc_storeStrong(&self->completion, 0);
}

@end