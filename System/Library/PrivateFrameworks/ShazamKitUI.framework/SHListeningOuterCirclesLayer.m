@interface SHListeningOuterCirclesLayer
- (CAMediaTimingFunction)inOutQuartTimingFunction;
- (CAMediaTimingFunction)inOutSineTimingFunction;
- (CAMediaTimingFunction)linearTimingFunction;
- (NSArray)outerCircleLayers;
- (id)buildOuterCircleLayers;
- (id)outerCircleCoreBorderWidthAnimation;
- (id)outerCircleCoreScaleAnimation;
- (id)outerCircleCoreSizeAnimation;
- (id)scaleNullAnimation;
- (void)addCoreAnimationToOuterCircleLayer:(id)a3 withStartOffset:(double)a4;
- (void)addScaleAnimationToCircleLayer:(id)a3;
- (void)layoutSublayers;
- (void)setOuterCircleLayers:(id)a3;
- (void)setup;
- (void)startListeningAnimation;
@end

@implementation SHListeningOuterCirclesLayer

- (void)setup
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  v3 = [(SHListeningOuterCirclesLayer *)self buildOuterCircleLayers];
  [(SHListeningOuterCirclesLayer *)self setOuterCircleLayers:v3];

  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  v4 = [(SHListeningOuterCirclesLayer *)self outerCircleLayers];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        [(SHListeningOuterCirclesLayer *)self addSublayer:*(void *)(*((void *)&v9 + 1) + 8 * v8++)];
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (id)buildOuterCircleLayers
{
  v3 = [MEMORY[0x263EFF980] arrayWithCapacity:2];
  uint64_t v4 = 0;
  char v5 = 1;
  do
  {
    char v6 = v5;
    uint64_t v7 = [SHListeningOuterCircleLayer alloc];
    uint64_t v8 = [(SHPaletteLayer *)self palette];
    long long v9 = [(SHPaletteLayer *)v7 initWithPalette:v8];

    long long v10 = [&unk_26E9F9778 objectAtIndex:v4];
    [v10 floatValue];
    -[SHListeningOuterCircleLayer setOpacity:](v9, "setOpacity:");

    [v3 addObject:v9];
    char v5 = 0;
    uint64_t v4 = 1;
  }
  while ((v6 & 1) != 0);
  return v3;
}

- (void)layoutSublayers
{
  v15.receiver = self;
  v15.super_class = (Class)SHListeningOuterCirclesLayer;
  [(SHListeningOuterCirclesLayer *)&v15 layoutSublayers];
  [(SHListeningOuterCirclesLayer *)self bounds];
  double MidX = CGRectGetMidX(v16);
  [(SHListeningOuterCirclesLayer *)self bounds];
  double MidY = CGRectGetMidY(v17);
  [(SHListeningOuterCirclesLayer *)self bounds];
  double Width = CGRectGetWidth(v18);
  [(SHListeningOuterCirclesLayer *)self bounds];
  double Height = CGRectGetHeight(v19);
  uint64_t v7 = 0;
  char v8 = 1;
  do
  {
    char v9 = v8;
    long long v10 = [(SHListeningOuterCirclesLayer *)self outerCircleLayers];
    long long v11 = [v10 objectAtIndex:v7];

    long long v12 = [&unk_26E9F9790 objectAtIndex:v7];
    [v12 floatValue];
    double v14 = v13;

    objc_msgSend(v11, "setBounds:", 0.0, 0.0, Width * v14, Height * v14);
    objc_msgSend(v11, "setPosition:", MidX, MidY);
    [v11 setNeedsDisplay];
    [v11 layoutIfNeeded];

    char v8 = 0;
    uint64_t v7 = 1;
  }
  while ((v9 & 1) != 0);
}

- (void)startListeningAnimation
{
  v3 = [(SHListeningOuterCirclesLayer *)self outerCircleLayers];
  uint64_t v4 = [v3 objectAtIndex:0];

  char v5 = [&unk_26E9F97A8 objectAtIndex:0];
  [v5 floatValue];
  double v7 = v6;

  [(SHListeningOuterCirclesLayer *)self addCoreAnimationToOuterCircleLayer:v4 withStartOffset:v7];
  [(SHListeningOuterCirclesLayer *)self addScaleAnimationToCircleLayer:v4];

  char v8 = [(SHListeningOuterCirclesLayer *)self outerCircleLayers];
  id v12 = [v8 objectAtIndex:1];

  char v9 = [&unk_26E9F97A8 objectAtIndex:1];
  [v9 floatValue];
  double v11 = v10;

  [(SHListeningOuterCirclesLayer *)self addCoreAnimationToOuterCircleLayer:v12 withStartOffset:v11];
  [(SHListeningOuterCirclesLayer *)self addScaleAnimationToCircleLayer:v12];
}

- (void)addScaleAnimationToCircleLayer:(id)a3
{
  id v4 = a3;
  id v6 = [(SHListeningOuterCirclesLayer *)self scaleNullAnimation];
  LODWORD(v5) = 2139095040;
  [v6 setRepeatCount:v5];
  [v6 setRemovedOnCompletion:0];
  [v4 addAnimation:v6 forKey:@"SHListeningOuterCircleScaleNullAnimationKey"];
}

- (void)addCoreAnimationToOuterCircleLayer:(id)a3 withStartOffset:(double)a4
{
  v23[2] = *MEMORY[0x263EF8340];
  id v6 = a3;
  double v7 = [(SHListeningOuterCirclesLayer *)self outerCircleCoreSizeAnimation];
  char v8 = [(SHListeningOuterCirclesLayer *)self outerCircleCoreBorderWidthAnimation];
  char v9 = [(SHListeningOuterCirclesLayer *)self outerCircleCoreScaleAnimation];
  float v10 = [MEMORY[0x263F15750] animation];
  v23[0] = v7;
  v23[1] = v8;
  double v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:v23 count:2];
  [v10 setAnimations:v11];

  [v10 setDuration:1.50000004];
  uint64_t v12 = *MEMORY[0x263F15AA8];
  [v10 setFillMode:*MEMORY[0x263F15AA8]];
  float v13 = [MEMORY[0x263F15750] animation];
  v22 = v9;
  double v14 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v22 count:1];
  [v13 setAnimations:v14];

  [v13 setDuration:1.50000004];
  [v13 setFillMode:v12];
  double v15 = a4 * 1.50000004;
  CGRect v16 = +[SHListeningViewHelperMethods animationFromAnimation:v10 withStartOffset:v15 duration:1.58333337];
  CGRect v17 = +[SHListeningViewHelperMethods animationFromAnimation:v13 withStartOffset:v15 duration:1.58333337];
  LODWORD(v18) = 2139095040;
  [v16 setRepeatCount:v18];
  [v16 setRemovedOnCompletion:0];
  LODWORD(v19) = 2139095040;
  [v17 setRepeatCount:v19];
  [v17 setRemovedOnCompletion:0];
  v20 = [v6 circleLayer];
  [v20 addAnimation:v16 forKey:@"SHListeningOuterCircleCoreAnimationGroup1Key"];

  v21 = [v6 circleContainerLayer];

  [v21 addAnimation:v17 forKey:@"SHListeningOuterCircleCoreAnimationGroup2Key"];
}

- (id)scaleNullAnimation
{
  v8[2] = *MEMORY[0x263EF8340];
  v3 = [MEMORY[0x263F157D8] animationWithKeyPath:@"transform.scale"];
  [v3 setValues:&unk_26E9F97C0];
  [v3 setKeyTimes:&unk_26E9F97D8];
  id v4 = [(SHListeningOuterCirclesLayer *)self linearTimingFunction];
  v8[0] = v4;
  double v5 = [(SHListeningOuterCirclesLayer *)self inOutSineTimingFunction];
  v8[1] = v5;
  id v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v8 count:2];
  [v3 setTimingFunctions:v6];

  [v3 setDuration:1.58333337];
  [v3 setFillMode:*MEMORY[0x263F15AB0]];
  return v3;
}

- (id)outerCircleCoreSizeAnimation
{
  v8[2] = *MEMORY[0x263EF8340];
  v3 = [MEMORY[0x263F157D8] animationWithKeyPath:@"transform.scale"];
  [v3 setValues:&unk_26E9F97F0];
  [v3 setKeyTimes:&unk_26E9F9808];
  id v4 = [(SHListeningOuterCirclesLayer *)self inOutSineTimingFunction];
  v8[0] = v4;
  double v5 = [(SHListeningOuterCirclesLayer *)self linearTimingFunction];
  v8[1] = v5;
  id v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v8 count:2];
  [v3 setTimingFunctions:v6];

  [v3 setDuration:1.50000004];
  [v3 setFillMode:*MEMORY[0x263F15AB0]];
  return v3;
}

- (id)outerCircleCoreBorderWidthAnimation
{
  v9[3] = *MEMORY[0x263EF8340];
  v3 = [MEMORY[0x263F157D8] animationWithKeyPath:@"borderWidth"];
  [v3 setValues:&unk_26E9F9820];
  [v3 setKeyTimes:&unk_26E9F9838];
  id v4 = [(SHListeningOuterCirclesLayer *)self inOutQuartTimingFunction];
  double v5 = [(SHListeningOuterCirclesLayer *)self linearTimingFunction];
  v9[1] = v5;
  id v6 = [(SHListeningOuterCirclesLayer *)self inOutQuartTimingFunction];
  v9[2] = v6;
  double v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v9 count:3];
  [v3 setTimingFunctions:v7];

  [v3 setDuration:1.50000004];
  [v3 setFillMode:*MEMORY[0x263F15AB0]];
  return v3;
}

- (id)outerCircleCoreScaleAnimation
{
  v8[2] = *MEMORY[0x263EF8340];
  v3 = [MEMORY[0x263F157D8] animationWithKeyPath:@"transform.scale"];
  [v3 setValues:&unk_26E9F9850];
  [v3 setKeyTimes:&unk_26E9F9868];
  id v4 = [(SHListeningOuterCirclesLayer *)self inOutSineTimingFunction];
  v8[0] = v4;
  double v5 = [(SHListeningOuterCirclesLayer *)self linearTimingFunction];
  v8[1] = v5;
  id v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v8 count:2];
  [v3 setTimingFunctions:v6];

  [v3 setDuration:1.50000004];
  [v3 setFillMode:*MEMORY[0x263F15AB0]];
  return v3;
}

- (CAMediaTimingFunction)inOutSineTimingFunction
{
  return (CAMediaTimingFunction *)+[SHListeningMediaTimingFunctionProvider inOutSineMediaTimingFunction];
}

- (CAMediaTimingFunction)inOutQuartTimingFunction
{
  return (CAMediaTimingFunction *)+[SHListeningMediaTimingFunctionProvider inOutQuartMediaTimingFunction];
}

- (CAMediaTimingFunction)linearTimingFunction
{
  return (CAMediaTimingFunction *)[MEMORY[0x263F15808] functionWithName:*MEMORY[0x263F15EC8]];
}

- (NSArray)outerCircleLayers
{
  return self->_outerCircleLayers;
}

- (void)setOuterCircleLayers:(id)a3
{
}

- (void).cxx_destruct
{
}

@end