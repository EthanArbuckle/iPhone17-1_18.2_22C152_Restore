@interface _WTTextEffect
- (BOOL)hidesOriginal;
- (BOOL)needsSetup;
- (BOOL)updatesOnGeometryChange;
- (CALayer)rootLayer;
- (CGRect)effectVisibilityFrame;
- (NSTimer)timer;
- (NSUUID)identifier;
- (_WTTextChunk)chunk;
- (_WTTextEffect)initWithChunk:(id)a3 effectView:(id)a4;
- (_WTTextEffectView)effectView;
- (double)_maxRequestedEDR;
- (double)clamp:(double)a3 min:(double)a4 max:(double)a5;
- (double)defaultSweepRadius;
- (double)invalidationAnimationDuration;
- (double)invalidationDelay;
- (double)sweepDuration;
- (double)sweepRadiusForLineSize:(CGSize)a3;
- (id)completion;
- (id)preCompletion;
- (void)_applyToFill:(id)a3 colors:(id)a4 center:(CGPoint)a5 startRadius:(double)a6 endRadius:(double)a7;
- (void)_applyToFill:(id)a3 locatedColors:(id)a4 center:(CGPoint)a5 startRadius:(double)a6 endRadius:(double)a7;
- (void)_applyToFill:(id)a3 nonlocatedColors:(id)a4 center:(CGPoint)a5 startRadius:(double)a6 endRadius:(double)a7;
- (void)invalidate:(BOOL)a3;
- (void)setChunk:(id)a3;
- (void)setCompletion:(id)a3;
- (void)setEffectView:(id)a3;
- (void)setHidesOriginal:(BOOL)a3;
- (void)setIdentifier:(id)a3;
- (void)setInvalidationDelay:(double)a3;
- (void)setPreCompletion:(id)a3;
- (void)setRootLayer:(id)a3;
- (void)setTimer:(id)a3;
- (void)updateEffectWith:(id)a3;
@end

@implementation _WTTextEffect

- (_WTTextEffect)initWithChunk:(id)a3 effectView:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)_WTTextEffect;
  v8 = [(_WTTextEffect *)&v12 init];
  v9 = v8;
  if (v8)
  {
    [(_WTTextEffect *)v8 setChunk:v6];
    [(_WTTextEffect *)v9 setEffectView:v7];
    [(_WTTextEffect *)v9 setHidesOriginal:1];
    [(_WTTextEffect *)v9 setInvalidationDelay:0.0];
    v10 = v9;
  }

  return v9;
}

- (BOOL)updatesOnGeometryChange
{
  return 0;
}

- (double)_maxRequestedEDR
{
  return 1.5;
}

- (double)invalidationAnimationDuration
{
  return 0.25;
}

- (void)updateEffectWith:(id)a3
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [v4 firstObject];
  [v5 presentationFrame];
  self->_firstSnapshotRect.origin.x = v6;
  self->_firstSnapshotRect.origin.y = v7;
  self->_firstSnapshotRect.size.width = v8;
  self->_firstSnapshotRect.size.height = v9;

  self->_effectPresentationRect = self->_firstSnapshotRect;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v10 = v4;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v20;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v20 != v13) {
          objc_enumerationMutation(v10);
        }
        objc_msgSend(*(id *)(*((void *)&v19 + 1) + 8 * v14), "presentationFrame", (void)v19);
        v25.origin.x = v15;
        v25.origin.y = v16;
        v25.size.width = v17;
        v25.size.height = v18;
        self->_effectPresentationRect = CGRectUnion(self->_effectPresentationRect, v25);
        ++v14;
      }
      while (v12 != v14);
      uint64_t v12 = [v10 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v12);
  }
}

- (void)invalidate:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = [(_WTTextEffect *)self timer];
  [v5 invalidate];

  [MEMORY[0x263F158F8] begin];
  double v6 = 0.0;
  if (v3) {
    [(_WTTextEffect *)self invalidationAnimationDuration];
  }
  [MEMORY[0x263F158F8] setAnimationDuration:v6];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __28___WTTextEffect_invalidate___block_invoke;
  v8[3] = &unk_26558E530;
  v8[4] = self;
  [MEMORY[0x263F158F8] setCompletionBlock:v8];
  CGFloat v7 = [(_WTTextEffect *)self rootLayer];
  [v7 setOpacity:0.0];

  [MEMORY[0x263F158F8] commit];
}

- (void)_applyToFill:(id)a3 colors:(id)a4 center:(CGPoint)a5 startRadius:(double)a6 endRadius:(double)a7
{
  double y = a5.y;
  double x = a5.x;
  id v18 = a3;
  id v13 = a4;
  uint64_t v14 = [v13 firstObject];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    -[_WTTextEffect _applyToFill:nonlocatedColors:center:startRadius:endRadius:](self, "_applyToFill:nonlocatedColors:center:startRadius:endRadius:", v18, v13, x, y, a6, a7);
  }
  else
  {
    CGFloat v16 = [v13 firstObject];
    objc_opt_class();
    char v17 = objc_opt_isKindOfClass();

    if (v17) {
      -[_WTTextEffect _applyToFill:locatedColors:center:startRadius:endRadius:](self, "_applyToFill:locatedColors:center:startRadius:endRadius:", v18, v13, x, y, a6, a7);
    }
  }
}

- (void)_applyToFill:(id)a3 nonlocatedColors:(id)a4 center:(CGPoint)a5 startRadius:(double)a6 endRadius:(double)a7
{
  double y = a5.y;
  double x = a5.x;
  v23[1] = *MEMORY[0x263EF8340];
  id v12 = a3;
  id v13 = a4;
  uint64_t v14 = [v13 count];
  CGFloat v15 = &v23[-2 * v14];
  if (v14)
  {
    uint64_t v16 = 0;
    char v17 = v15 + 1;
    do
    {
      id v18 = [v13 objectAtIndexedSubscript:v16];
      [v18 CGColor];
      RBColorFromCGColor();
      *(v17 - 2) = v19;
      *(v17 - 1) = v20;
      *char v17 = v21;
      v17[1] = v22;
      v17 += 4;

      ++v16;
    }
    while (v14 != v16);
  }
  objc_msgSend(v12, "setRadialGradientCenter:startRadius:endRadius:stopCount:colors:locations:flags:", v14, v15, 0, 0, x, y, a6, a7);
}

- (void)_applyToFill:(id)a3 locatedColors:(id)a4 center:(CGPoint)a5 startRadius:(double)a6 endRadius:(double)a7
{
  double y = a5.y;
  double x = a5.x;
  v26[1] = *MEMORY[0x263EF8340];
  id v12 = a3;
  id v13 = a4;
  uint64_t v14 = [v13 count];
  CGFloat v15 = &v26[-2 * v14];
  uint64_t v16 = (char *)v26 - ((8 * v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (v14)
  {
    uint64_t v17 = 0;
    id v18 = v15 + 1;
    do
    {
      int v19 = [v13 objectAtIndexedSubscript:v17];
      id v20 = [v19 color];
      [v20 CGColor];
      RBColorFromCGColor();
      *(v18 - 2) = v21;
      *(v18 - 1) = v22;
      *id v18 = v23;
      v18[1] = v24;
      v18 += 4;

      [v19 location];
      *(void *)&v16[8 * v17] = v25;

      ++v17;
    }
    while (v14 != v17);
  }
  objc_msgSend(v12, "setRadialGradientCenter:startRadius:endRadius:stopCount:colors:locations:flags:", v14, v15, v16, 0, x, y, a6, a7);
}

- (double)defaultSweepRadius
{
  BOOL v3 = [(_WTTextEffect *)self effectView];
  [v3 bounds];
  double width = v4;
  if (v4 == 0.0) {
    double width = self->_firstSnapshotRect.size.width;
  }

  double height = self->_firstSnapshotRect.size.height;

  -[_WTTextEffect sweepRadiusForLineSize:](self, "sweepRadiusForLineSize:", width, height);
  return result;
}

- (double)sweepRadiusForLineSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  long double v5 = atan((a3.height + a3.height) / a3.width);
  long double v6 = cos(1.57079633 - v5);
  return sqrt(height * height + width * 0.5 * (width * 0.5)) / (v6 + v6);
}

- (CGRect)effectVisibilityFrame
{
  CGFloat x = self->_effectPresentationRect.origin.x;
  CGFloat y = self->_effectPresentationRect.origin.y;
  double width = self->_effectPresentationRect.size.width;
  double height = self->_effectPresentationRect.size.height;
  if (width == 0.0)
  {
    long double v6 = [(_WTTextEffect *)self effectView];
    [v6 bounds];
    double width = v7;
  }
  if (height >= 400.0) {
    double v8 = height;
  }
  else {
    double v8 = 400.0;
  }
  double v9 = x;
  double v10 = y;
  double v11 = width;
  result.size.double height = v8;
  result.size.double width = v11;
  result.origin.CGFloat y = v10;
  result.origin.CGFloat x = v9;
  return result;
}

- (double)clamp:(double)a3 min:(double)a4 max:(double)a5
{
  if (a3 >= a5) {
    a3 = a5;
  }
  if (a3 < a4) {
    a3 = a4;
  }
  return (a3 - a4) / (a5 - a4);
}

- (BOOL)needsSetup
{
  v2 = [(_WTTextEffect *)self rootLayer];
  BOOL v3 = v2 == 0;

  return v3;
}

- (double)sweepDuration
{
  [(_WTTextEffect *)self effectVisibilityFrame];
  double v3 = v2 / 300.0 * 2.2;
  double v4 = 2.5;
  if (v3 <= 2.5) {
    double v4 = v2 / 300.0 * 2.2;
  }
  if (v3 >= 1.5) {
    return v4;
  }
  else {
    return 1.5;
  }
}

- (_WTTextChunk)chunk
{
  return (_WTTextChunk *)objc_getProperty(self, a2, 80, 1);
}

- (void)setChunk:(id)a3
{
}

- (_WTTextEffectView)effectView
{
  return (_WTTextEffectView *)objc_getProperty(self, a2, 88, 1);
}

- (void)setEffectView:(id)a3
{
}

- (NSUUID)identifier
{
  return (NSUUID *)objc_getProperty(self, a2, 96, 1);
}

- (void)setIdentifier:(id)a3
{
}

- (BOOL)hidesOriginal
{
  return self->_hidesOriginal;
}

- (void)setHidesOriginal:(BOOL)a3
{
  self->_hidesOriginal = a3;
}

- (id)completion
{
  return objc_getProperty(self, a2, 104, 1);
}

- (void)setCompletion:(id)a3
{
}

- (id)preCompletion
{
  return objc_getProperty(self, a2, 112, 1);
}

- (void)setPreCompletion:(id)a3
{
}

- (CALayer)rootLayer
{
  return (CALayer *)objc_getProperty(self, a2, 120, 1);
}

- (void)setRootLayer:(id)a3
{
}

- (NSTimer)timer
{
  return (NSTimer *)objc_getProperty(self, a2, 128, 1);
}

- (void)setTimer:(id)a3
{
}

- (double)invalidationDelay
{
  return self->_invalidationDelay;
}

- (void)setInvalidationDelay:(double)a3
{
  self->_invalidationDelaCGFloat y = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timer, 0);
  objc_storeStrong((id *)&self->_rootLayer, 0);
  objc_storeStrong(&self->_preCompletion, 0);
  objc_storeStrong(&self->_completion, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_effectView, 0);

  objc_storeStrong((id *)&self->_chunk, 0);
}

@end