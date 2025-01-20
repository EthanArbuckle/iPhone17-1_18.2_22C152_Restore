@interface SHListeningInnerCirclesLayer
- (CAMediaTimingFunction)inOutSineTimingFunction;
- (CAMediaTimingFunction)linearTimingFunction;
- (NSArray)innerCircleLayers;
- (id)buildInnerCircleLayers;
- (id)innerCircleCoreAnimation;
- (id)innerCircleScaleNullAnimation;
- (void)addCoreAnimationToInnerCircleLayer:(id)a3 withStartOffset:(double)a4;
- (void)addScaleNullAnimationToInnerCircleLayer:(id)a3;
- (void)layoutSublayers;
- (void)setInnerCircleLayers:(id)a3;
- (void)setup;
- (void)startListeningAnimation;
@end

@implementation SHListeningInnerCirclesLayer

- (void)setup
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  v3 = [(SHListeningInnerCirclesLayer *)self buildInnerCircleLayers];
  [(SHListeningInnerCirclesLayer *)self setInnerCircleLayers:v3];

  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  v4 = [(SHListeningInnerCirclesLayer *)self innerCircleLayers];
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
        [(SHListeningInnerCirclesLayer *)self addSublayer:*(void *)(*((void *)&v9 + 1) + 8 * v8++)];
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (id)buildInnerCircleLayers
{
  v3 = [MEMORY[0x263EFF980] arrayWithCapacity:4];
  for (uint64_t i = 0; i != 4; ++i)
  {
    uint64_t v5 = [SHListeningInnerCircleLayer alloc];
    uint64_t v6 = [(SHPaletteLayer *)self palette];
    uint64_t v7 = [(SHPaletteLayer *)v5 initWithPalette:v6];

    uint64_t v8 = [&unk_26E9F9670 objectAtIndex:i];
    [v8 floatValue];
    -[SHListeningInnerCircleLayer setOpacity:](v7, "setOpacity:");

    [v3 addObject:v7];
  }
  return v3;
}

- (void)layoutSublayers
{
  v13.receiver = self;
  v13.super_class = (Class)SHListeningInnerCirclesLayer;
  [(SHListeningInnerCirclesLayer *)&v13 layoutSublayers];
  [(SHListeningInnerCirclesLayer *)self bounds];
  double MidX = CGRectGetMidX(v14);
  [(SHListeningInnerCirclesLayer *)self bounds];
  double MidY = CGRectGetMidY(v15);
  [(SHListeningInnerCirclesLayer *)self bounds];
  double Width = CGRectGetWidth(v16);
  [(SHListeningInnerCirclesLayer *)self bounds];
  double Height = CGRectGetHeight(v17);
  for (uint64_t i = 0; i != 4; ++i)
  {
    uint64_t v8 = [(SHListeningInnerCirclesLayer *)self innerCircleLayers];
    long long v9 = [v8 objectAtIndex:i];

    long long v10 = [&unk_26E9F9688 objectAtIndex:i];
    [v10 floatValue];
    double v12 = v11;

    objc_msgSend(v9, "setBounds:", 0.0, 0.0, Width * v12, Height * v12);
    objc_msgSend(v9, "setPosition:", MidX, MidY);
    [v9 setNeedsLayout];
    [v9 layoutIfNeeded];
  }
}

- (void)startListeningAnimation
{
  for (uint64_t i = 0; i != 4; ++i)
  {
    v4 = [(SHListeningInnerCirclesLayer *)self innerCircleLayers];
    uint64_t v5 = [v4 objectAtIndex:i];

    uint64_t v6 = [&unk_26E9F96A0 objectAtIndex:i];
    [v6 floatValue];
    double v8 = v7;

    [(SHListeningInnerCirclesLayer *)self addCoreAnimationToInnerCircleLayer:v5 withStartOffset:v8];
    [(SHListeningInnerCirclesLayer *)self addScaleNullAnimationToInnerCircleLayer:v5];
  }
}

- (void)addCoreAnimationToInnerCircleLayer:(id)a3 withStartOffset:(double)a4
{
  id v6 = a3;
  id v12 = [(SHListeningInnerCirclesLayer *)self innerCircleCoreAnimation];
  [v12 duration];
  double v8 = +[SHListeningViewHelperMethods animationFromAnimation:v12 withStartOffset:v7 * a4 duration:2.32916653];
  long long v9 = +[SHListeningViewHelperMethods animationFromAnimation:v8 withStartOffset:0.209624996 duration:1.90991654];

  [v9 setRemovedOnCompletion:0];
  LODWORD(v10) = 2139095040;
  [v9 setRepeatCount:v10];
  float v11 = [v6 circleContainerLayer];

  [v11 addAnimation:v9 forKey:@"SHListeningInnerCircleCoreAnimationGroupKey"];
}

- (void)addScaleNullAnimationToInnerCircleLayer:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(SHListeningInnerCirclesLayer *)self innerCircleScaleNullAnimation];
  id v7 = +[SHListeningViewHelperMethods animationFromAnimation:v5 withStartOffset:0.209624996 duration:1.90991654];

  [v7 setRemovedOnCompletion:0];
  LODWORD(v6) = 2139095040;
  [v7 setRepeatCount:v6];
  [v4 addAnimation:v7 forKey:@"SHListeningInnerCircleScaleNullAnimationKey"];
}

- (id)innerCircleScaleNullAnimation
{
  v8[2] = *MEMORY[0x263EF8340];
  v3 = [MEMORY[0x263F157D8] animationWithKeyPath:@"transform.scale"];
  [v3 setValues:&unk_26E9F96B8];
  [v3 setKeyTimes:&unk_26E9F96D0];
  [v3 setDuration:2.32916653];
  id v4 = [(SHListeningInnerCirclesLayer *)self linearTimingFunction];
  v8[0] = v4;
  uint64_t v5 = [(SHListeningInnerCirclesLayer *)self inOutSineTimingFunction];
  v8[1] = v5;
  double v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v8 count:2];
  [v3 setTimingFunctions:v6];

  return v3;
}

- (id)innerCircleCoreAnimation
{
  v21[2] = *MEMORY[0x263EF8340];
  v3 = [MEMORY[0x263F157D8] animationWithKeyPath:@"transform.scale"];
  [v3 setValues:&unk_26E9F96E8];
  [v3 setKeyTimes:&unk_26E9F9700];
  id v4 = [(SHListeningInnerCirclesLayer *)self inOutSineTimingFunction];
  v21[0] = v4;
  uint64_t v5 = [(SHListeningInnerCirclesLayer *)self linearTimingFunction];
  v21[1] = v5;
  double v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v21 count:2];
  [v3 setTimingFunctions:v6];

  [v3 setDuration:2.92499983];
  id v7 = [MEMORY[0x263F157D8] animationWithKeyPath:@"opacity"];
  [v7 setValues:&unk_26E9F9718];
  [v7 setKeyTimes:&unk_26E9F9730];
  double v8 = [(SHListeningInnerCirclesLayer *)self inOutSineTimingFunction];
  v20[0] = v8;
  long long v9 = [(SHListeningInnerCirclesLayer *)self inOutSineTimingFunction];
  v20[1] = v9;
  double v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v20 count:2];
  [v7 setTimingFunctions:v10];

  [v7 setDuration:2.92499983];
  float v11 = [MEMORY[0x263F157D8] animationWithKeyPath:@"sublayerTransform.scale"];
  [v11 setValues:&unk_26E9F9748];
  [v11 setKeyTimes:&unk_26E9F9760];
  id v12 = [(SHListeningInnerCirclesLayer *)self inOutSineTimingFunction];
  v19[0] = v12;
  objc_super v13 = [(SHListeningInnerCirclesLayer *)self inOutSineTimingFunction];
  v19[1] = v13;
  CGRect v14 = [MEMORY[0x263EFF8C0] arrayWithObjects:v19 count:2];
  [v11 setTimingFunctions:v14];

  [v11 setDuration:2.92499983];
  CGRect v15 = [MEMORY[0x263F15750] animation];
  v18[0] = v3;
  v18[1] = v7;
  v18[2] = v11;
  CGRect v16 = [MEMORY[0x263EFF8C0] arrayWithObjects:v18 count:3];
  [v15 setAnimations:v16];

  [v15 setDuration:2.92499983];
  [v15 setFillMode:*MEMORY[0x263F15AB0]];

  return v15;
}

- (CAMediaTimingFunction)inOutSineTimingFunction
{
  return (CAMediaTimingFunction *)+[SHListeningMediaTimingFunctionProvider inOutSineMediaTimingFunction];
}

- (CAMediaTimingFunction)linearTimingFunction
{
  return (CAMediaTimingFunction *)[MEMORY[0x263F15808] functionWithName:*MEMORY[0x263F15EC8]];
}

- (NSArray)innerCircleLayers
{
  return self->_innerCircleLayers;
}

- (void)setInnerCircleLayers:(id)a3
{
}

- (void).cxx_destruct
{
}

@end