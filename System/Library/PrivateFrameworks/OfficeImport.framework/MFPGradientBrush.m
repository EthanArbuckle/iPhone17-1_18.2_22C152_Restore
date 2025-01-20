@interface MFPGradientBrush
- (MFPGradientBrush)init;
- (id)color;
- (id)colorAtPosition:(float)a3;
- (id)endColor;
- (id)startColor;
- (void)createPhoneBrush;
- (void)createShadingFunction;
- (void)createStopsFromBlend;
- (void)createStopsFromColorBlend;
- (void)createStopsFromStartAndEndColors;
- (void)dealloc;
- (void)fillPath:(id)a3;
- (void)setBlend:(id)a3;
- (void)setColorBlend:(id)a3;
- (void)setTransform:(CGAffineTransform *)a3;
- (void)setWrapMode:(int)a3;
@end

@implementation MFPGradientBrush

- (MFPGradientBrush)init
{
  v5.receiver = self;
  v5.super_class = (Class)MFPGradientBrush;
  result = [(MFPGradientBrush *)&v5 init];
  if (result)
  {
    long long v4 = *(_OWORD *)(MEMORY[0x263F000D0] + 16);
    long long v3 = *(_OWORD *)(MEMORY[0x263F000D0] + 32);
    *(_OWORD *)&result->mTransform.a = *MEMORY[0x263F000D0];
    *(_OWORD *)&result->mTransform.c = v4;
    *(_OWORD *)&result->mTransform.tx = v3;
  }
  return result;
}

- (void)dealloc
{
  CGShadingRelease(self->mShading);
  CGFunctionRelease(self->mShadingFunction);
  v3.receiver = self;
  v3.super_class = (Class)MFPGradientBrush;
  [(MFPGradientBrush *)&v3 dealloc];
}

- (void)setTransform:(CGAffineTransform *)a3
{
  long long v4 = *(_OWORD *)&a3->c;
  long long v3 = *(_OWORD *)&a3->tx;
  *(_OWORD *)&self->mTransform.a = *(_OWORD *)&a3->a;
  *(_OWORD *)&self->mTransform.c = v4;
  *(_OWORD *)&self->mTransform.tx = v3;
}

- (void)setBlend:(id)a3
{
}

- (void)setColorBlend:(id)a3
{
}

- (void)setWrapMode:(int)a3
{
  self->mWrapMode = a3;
}

- (void)fillPath:(id)a3
{
  id v5 = a3;
  long long v4 = TCCurrentGraphicsContext();
  CGContextSaveGState(v4);
  [v5 addClip];
  CGContextDrawShading(v4, self->mShading);
  CGContextRestoreGState(v4);
}

- (id)color
{
  return [(MFPGradientBrush *)self colorAtPosition:0.0];
}

- (void)createPhoneBrush
{
  if (self->mColorBlend)
  {
    [(MFPGradientBrush *)self createStopsFromColorBlend];
  }
  else if (self->mBlend)
  {
    [(MFPGradientBrush *)self createStopsFromBlend];
  }
  else
  {
    [(MFPGradientBrush *)self createStopsFromStartAndEndColors];
  }
  [(MFPGradientBrush *)self createShadingFunction];
  [(MFPGradientBrush *)self createShading];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mStops, 0);
  objc_storeStrong((id *)&self->mColorBlend, 0);
  objc_storeStrong((id *)&self->mBlend, 0);
}

- (id)startColor
{
  return 0;
}

- (id)endColor
{
  return 0;
}

- (id)colorAtPosition:(float)a3
{
  if (a3 <= 0.0)
  {
    v9 = [(NSArray *)self->mStops objectAtIndex:0];
    uint64_t v14 = [v9 color];
LABEL_11:
    v13 = (void *)v14;
    goto LABEL_12;
  }
  mStops = self->mStops;
  if (a3 >= 1.0)
  {
    v9 = [(NSArray *)mStops lastObject];
    uint64_t v14 = [v9 color];
    goto LABEL_11;
  }
  uint64_t v6 = [(NSArray *)mStops count];
  if (v6 == 1)
  {
LABEL_8:
    v13 = 0;
    goto LABEL_13;
  }
  uint64_t v7 = v6;
  uint64_t v8 = 1;
  while (1)
  {
    v9 = [(NSArray *)self->mStops objectAtIndex:v8 - 1];
    v10 = [(NSArray *)self->mStops objectAtIndex:v8];
    [v9 position];
    if (v11 <= a3)
    {
      [v10 position];
      if (v12 >= a3) {
        break;
      }
    }

    if (v7 == ++v8) {
      goto LABEL_8;
    }
  }
  [v10 position];
  float v17 = v16;
  [v9 position];
  float v19 = v18;
  [v9 position];
  float v21 = v20;
  v22 = [v9 color];
  v23 = [v10 color];
  v13 = [v22 blendedColorWithFraction:v23 ofColor:(float)((float)(a3 - v21) / (float)(v17 - v19))];

LABEL_12:
LABEL_13:
  return v13;
}

- (void)createStopsFromColorBlend
{
}

- (void)createStopsFromBlend
{
  id v16 = [(MFPGradientBrush *)self startColor];
  long long v3 = [(MFPGradientBrush *)self endColor];
  NSUInteger v4 = [(NSArray *)self->mBlend count];
  id v5 = (NSArray *)[objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:v4];
  if (v4)
  {
    for (uint64_t i = 0; i != v4; ++i)
    {
      uint64_t v7 = [(NSArray *)self->mBlend objectAtIndex:i];
      [v7 position];
      int v9 = v8;
      [v7 factor];
      float v11 = [v16 blendedColorWithFraction:v3 ofColor:v10];
      float v12 = [MFPGradientStop alloc];
      LODWORD(v13) = v9;
      uint64_t v14 = [(MFPGradientStop *)v12 initWithColor:v11 position:v13];
      [(NSArray *)v5 addObject:v14];
    }
  }
  mStops = self->mStops;
  self->mStops = v5;
}

- (void)createStopsFromStartAndEndColors
{
  id v10 = [(MFPGradientBrush *)self startColor];
  long long v3 = [[MFPGradientStop alloc] initWithColor:v10 position:0.0];
  NSUInteger v4 = [(MFPGradientBrush *)self endColor];
  id v5 = [MFPGradientStop alloc];
  LODWORD(v6) = 1.0;
  uint64_t v7 = [(MFPGradientStop *)v5 initWithColor:v4 position:v6];
  int v8 = (NSArray *)objc_msgSend(objc_alloc(MEMORY[0x263EFF8C0]), "initWithObjects:", v3, v7, 0);
  mStops = self->mStops;
  self->mStops = v8;
}

- (void)createShadingFunction
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  *(_OWORD *)domain = xmmword_238EDE4C0;
  range[0] = 0.0;
  uint64_t v4 = 0;
  uint64_t v6 = 0;
  range[1] = 1.0;
  uint64_t v5 = 0x3FF0000000000000;
  uint64_t v7 = 0x3FF0000000000000;
  uint64_t v8 = 0;
  uint64_t v9 = 0x3FF0000000000000;
  callbacks.version = 0;
  callbacks.evaluate = (CGFunctionEvaluateCallback)evaluateGradient;
  callbacks.releaseInfo = 0;
  self->mShadingFunction = CGFunctionCreate(self, 1uLL, domain, 4uLL, range, &callbacks);
}

@end