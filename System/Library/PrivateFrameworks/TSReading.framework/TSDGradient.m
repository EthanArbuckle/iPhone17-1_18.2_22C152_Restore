@interface TSDGradient
+ (BOOL)useInflections;
+ (BOOL)useQuartzShadings;
+ (id)linearGradientWithGradientStops:(id)a3;
+ (id)linearGradientWithStartColor:(id)a3 endColor:(id)a4;
+ (id)presetKinds;
+ (id)radialGradientWithGradientStops:(id)a3;
+ (id)radialGradientWithStartColor:(id)a3 endColor:(id)a4;
+ (void)bootstrapPresetsOfKind:(id)a3 inTheme:(id)a4 alternate:(int)a5;
+ (void)disableInflections;
+ (void)enableInflections;
+ (void)sortStopsArray:(id)a3;
- (BOOL)hasAlpha;
- (BOOL)isAdvancedGradient;
- (BOOL)isAdvancedGradientIgnoringFlag;
- (BOOL)isEqual:(id)a3;
- (BOOL)isOpaque;
- (CGAffineTransform)centeredRadialTransformInRect:(SEL)a3;
- (CGContext)p_beginBitmapWrapperContextInContext:(CGContext *)a3 returningIntegralBounds:(CGRect *)a4;
- (CGPoint)endPointForPath:(id)a3 andBounds:(CGRect)a4;
- (CGPoint)startPointForPath:(id)a3 andBounds:(CGRect)a4;
- (CGShading)shadingRef;
- (NSArray)gradientStops;
- (NSString)presetKind;
- (SEL)mapThemeAssetSelector;
- (TSDGradient)init;
- (TSDGradient)initWithGradientStops:(id)a3 type:(unint64_t)a4;
- (TSDGradient)initWithGradientStops:(id)a3 type:(unint64_t)a4 opacity:(double)a5;
- (TSDGradient)initWithStartColor:(id)a3 endColor:(id)a4 type:(unint64_t)a5;
- (TSUColor)firstColor;
- (TSUColor)lastColor;
- (double)opacity;
- (id)description;
- (id)mixedObjectWithFraction:(double)a3 ofObject:(id)a4;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (id)newColorAtFraction:(double)a3;
- (id)p_insertStopAtFraction:(double)a3;
- (id)p_insertStopAtFraction:(double)a3 withColor:(id)a4;
- (id)p_removeStopAtIndex:(unint64_t)a3;
- (id)stopAfterFraction:(double)a3;
- (id)stopAtIndex:(unint64_t)a3;
- (id)stopBeforeFraction:(double)a3;
- (int)fillType;
- (int64_t)mixingTypeWithObject:(id)a3;
- (unint64_t)gradientType;
- (unint64_t)hash;
- (void)colorComponents:(double *)a3 atFraction:(double)a4;
- (void)dealloc;
- (void)p_endBitmapWrapperContext:(CGContext *)a3 inContext:(CGContext *)a4 withIntegralBounds:(CGRect)a5;
- (void)p_evenlyDistributeStops;
- (void)p_insertGradientStop:(id)a3;
- (void)p_moveStopAtIndex:(unint64_t)a3 toFraction:(double)a4;
- (void)p_removeStop:(id)a3;
- (void)p_reverseStopOrder;
- (void)p_setAlpha:(CGContext *)a3;
- (void)p_setColorOfStopAtIndex:(unint64_t)a3 toColor:(id)a4;
- (void)p_setGradientStops:(id)a3;
- (void)p_setGradientType:(unint64_t)a3;
- (void)p_setInflectionOfStopAtIndex:(unint64_t)a3 toInflection:(double)a4;
- (void)p_swapStopAtIndex:(unint64_t)a3 withStopAtIndex:(unint64_t)a4;
- (void)paintPath:(CGPath *)a3 inContext:(CGContext *)a4;
- (void)paintRect:(CGRect)a3 inContext:(CGContext *)a4;
- (void)paintRect:(CGRect)a3 inContext:(CGContext *)a4 atAngle:(double)a5;
- (void)releaseShadingRef;
- (void)setIsAdvancedGradient:(BOOL)a3;
- (void)setOpacity:(double)a3;
@end

@implementation TSDGradient

+ (void)enableInflections
{
  sUseInflections = 0;
}

+ (void)disableInflections
{
  sUseInflections = 1;
}

+ (BOOL)useInflections
{
  return (sUseInflections & 1) == 0;
}

- (TSDGradient)init
{
  v4.receiver = self;
  v4.super_class = (Class)TSDGradient;
  v2 = [(TSDGradient *)&v4 init];
  if (v2) {
    v2->mStops = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
  }
  return v2;
}

- (TSDGradient)initWithGradientStops:(id)a3 type:(unint64_t)a4 opacity:(double)a5
{
  v8 = [(TSDGradient *)self init];
  v9 = v8;
  if (v8)
  {
    mStops = v8->mStops;
    if (mStops) {
      [(NSMutableArray *)mStops setArray:a3];
    }
    else {
      v9->mStops = (NSMutableArray *)[a3 mutableCopy];
    }
    v9->mType = a4;
    v9->mOpacity = a5;
  }
  return v9;
}

- (TSDGradient)initWithGradientStops:(id)a3 type:(unint64_t)a4
{
  return [(TSDGradient *)self initWithGradientStops:a3 type:a4 opacity:1.0];
}

- (TSDGradient)initWithStartColor:(id)a3 endColor:(id)a4 type:(unint64_t)a5
{
  uint64_t v7 = objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:", +[TSDGradientStop gradientStopWithColor:fraction:](TSDGradientStop, "gradientStopWithColor:fraction:", a3, 0.0), +[TSDGradientStop gradientStopWithColor:fraction:](TSDGradientStop, "gradientStopWithColor:fraction:", a4, 1.0), 0);

  return [(TSDGradient *)self initWithGradientStops:v7 type:a5];
}

- (void)dealloc
{
  [(TSDGradient *)self releaseShadingRef];
  v3.receiver = self;
  v3.super_class = (Class)TSDGradient;
  [(TSDGradient *)&v3 dealloc];
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"TSDGradient<%p>: type=%lu opacity=%f \n\tstops<%p>=%@", self, self->mType, *(void *)&self->mOpacity, self->mStops, self->mStops];
}

- (unint64_t)hash
{
  [(NSMutableArray *)self->mStops hash];
  TSUHashWithSeed();
  TSUHashWithSeed();

  return TSUHashWithSeed();
}

- (BOOL)isEqual:(id)a3
{
  if (a3 == self)
  {
    LOBYTE(v4) = 1;
  }
  else
  {
    objc_opt_class();
    objc_super v4 = (void *)TSUDynamicCast();
    if (v4)
    {
      v5 = v4;
      if ([v4 gradientType] == self->mType && (objc_msgSend(v5, "opacity"), v6 == self->mOpacity))
      {
        LODWORD(v4) = -[NSMutableArray isEqualToArray:](self->mStops, "isEqualToArray:", [v5 gradientStops]);
        if (v4)
        {
          char v7 = [v5 isAdvancedGradient];
          LOBYTE(v4) = v7 ^ [(TSDGradient *)self isAdvancedGradient] ^ 1;
        }
      }
      else
      {
        LOBYTE(v4) = 0;
      }
    }
  }
  return (char)v4;
}

+ (BOOL)useQuartzShadings
{
  return 1;
}

+ (void)sortStopsArray:(id)a3
{
}

+ (id)linearGradientWithStartColor:(id)a3 endColor:(id)a4
{
  objc_super v4 = (void *)[objc_alloc((Class)objc_opt_class()) initWithStartColor:a3 endColor:a4 type:0];

  return v4;
}

+ (id)linearGradientWithGradientStops:(id)a3
{
  objc_super v3 = (void *)[objc_alloc((Class)objc_opt_class()) initWithGradientStops:a3 type:0];

  return v3;
}

+ (id)radialGradientWithStartColor:(id)a3 endColor:(id)a4
{
  objc_super v4 = (void *)[objc_alloc((Class)objc_opt_class()) initWithStartColor:a3 endColor:a4 type:1];

  return v4;
}

+ (id)radialGradientWithGradientStops:(id)a3
{
  objc_super v3 = (void *)[objc_alloc((Class)objc_opt_class()) initWithGradientStops:a3 type:1];

  return v3;
}

- (NSArray)gradientStops
{
  return &self->mStops->super;
}

- (TSUColor)firstColor
{
  v2 = (void *)[(NSMutableArray *)self->mStops objectAtIndex:0];

  return (TSUColor *)[v2 color];
}

- (TSUColor)lastColor
{
  v2 = (void *)[(NSMutableArray *)self->mStops lastObject];

  return (TSUColor *)[v2 color];
}

- (CGShading)shadingRef
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  result = self->mShadingRef;
  if (!result)
  {
    objc_super v4 = (CGColorSpace *)TSUDeviceRGBColorSpace();
    *(_OWORD *)domain = xmmword_2238393F0;
    range[0] = 0.0;
    uint64_t v9 = 0;
    uint64_t v11 = 0;
    range[1] = 1.0;
    uint64_t v10 = 0x3FF0000000000000;
    uint64_t v12 = 0x3FF0000000000000;
    uint64_t v13 = 0;
    uint64_t v14 = 0x3FF0000000000000;
    *(void *)&callbacks.version = 0;
    callbacks.evaluate = (CGFunctionEvaluateCallback)p_evaluateGradient;
    callbacks.releaseInfo = _release;
    v5 = CGFunctionCreate((void *)[(TSDGradient *)self copy], 1uLL, domain, 4uLL, range, &callbacks);
    if ([(TSDGradient *)self gradientType])
    {
      v17.x = 0.0;
      v17.y = 0.0;
      v20.x = 0.0;
      v20.y = 0.0;
      Radial = CGShadingCreateRadial(v4, v17, 0.0, v20, 100.0, v5, 1, 1);
    }
    else
    {
      v19.x = 100.0;
      v18.x = 0.0;
      v18.y = 0.0;
      v19.y = 0.0;
      Radial = CGShadingCreateAxial(v4, v18, v19, v5, 1, 1);
    }
    self->mShadingRef = Radial;
    CGFunctionRelease(v5);
    return self->mShadingRef;
  }
  return result;
}

- (void)releaseShadingRef
{
  self->mShadingRef = 0;
}

- (BOOL)isAdvancedGradient
{
  return self->mIsAdvancedGradient
      || [(TSDGradient *)self isAdvancedGradientIgnoringFlag];
}

- (BOOL)isAdvancedGradientIgnoringFlag
{
  if (self->mType) {
    return 1;
  }
  if ([(NSMutableArray *)self->mStops count] != 2) {
    return 1;
  }
  objc_msgSend((id)-[NSMutableArray objectAtIndex:](self->mStops, "objectAtIndex:", 0), "fraction");
  if (v3 != 0.0) {
    return 1;
  }
  objc_msgSend((id)-[NSMutableArray objectAtIndex:](self->mStops, "objectAtIndex:", 0), "inflection");
  if (v4 != 0.5 && fabs(v4 + -0.5) >= 5.0e-11) {
    return 1;
  }
  objc_msgSend((id)-[NSMutableArray lastObject](self->mStops, "lastObject"), "fraction");
  return v6 != 1.0;
}

- (id)stopBeforeFraction:(double)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  TSUClamp();
  double v5 = v4;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  double v6 = (void *)[(NSMutableArray *)self->mStops reverseObjectEnumerator];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (!v7) {
    return (id)[(NSMutableArray *)self->mStops objectAtIndex:0];
  }
  uint64_t v8 = v7;
  uint64_t v9 = *(void *)v15;
LABEL_3:
  uint64_t v10 = 0;
  while (1)
  {
    if (*(void *)v15 != v9) {
      objc_enumerationMutation(v6);
    }
    uint64_t v11 = *(void **)(*((void *)&v14 + 1) + 8 * v10);
    [v11 fraction];
    if (v12 <= v5) {
      return v11;
    }
    if (v8 == ++v10)
    {
      uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v8) {
        goto LABEL_3;
      }
      return (id)[(NSMutableArray *)self->mStops objectAtIndex:0];
    }
  }
}

- (id)stopAfterFraction:(double)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  TSUClamp();
  if (v4 == 1.0)
  {
    mStops = self->mStops;
    return (id)[(NSMutableArray *)mStops lastObject];
  }
  else
  {
    double v7 = v4;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    uint64_t v8 = self->mStops;
    uint64_t v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (!v9) {
      return (id)[(NSMutableArray *)self->mStops lastObject];
    }
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v16;
LABEL_7:
    uint64_t v12 = 0;
    while (1)
    {
      if (*(void *)v16 != v11) {
        objc_enumerationMutation(v8);
      }
      uint64_t v13 = *(void **)(*((void *)&v15 + 1) + 8 * v12);
      [v13 fraction];
      if (v14 > v7) {
        return v13;
      }
      if (v10 == ++v12)
      {
        uint64_t v10 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
        if (v10) {
          goto LABEL_7;
        }
        return (id)[(NSMutableArray *)self->mStops lastObject];
      }
    }
  }
}

- (id)stopAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->mStops objectAtIndex:a3];
}

- (id)newColorAtFraction:(double)a3
{
  if (a3 == 0.0)
  {
    double v4 = [(TSDGradient *)self firstColor];
LABEL_5:
    return v4;
  }
  if (a3 == 1.0)
  {
    double v4 = [(TSDGradient *)self lastColor];
    goto LABEL_5;
  }
  id v7 = [(TSDGradient *)self stopBeforeFraction:a3];
  id v8 = [(TSDGradient *)self stopAfterFraction:a3];
  if (v7 == v8)
  {
    double v4 = (TSUColor *)[v7 color];
    goto LABEL_5;
  }
  uint64_t v9 = v8;
  [v7 fraction];
  double v11 = v10;
  [v9 fraction];
  double v13 = 0.0;
  if (v12 - v11 > 0.001)
  {
    TSUClamp();
    double v15 = v14;
    double v13 = v14;
    if (+[TSDGradient useInflections])
    {
      [v7 inflection];
      TSUClamp();
      if (v15 >= v16)
      {
        double v13 = 0.5;
        if (v16 != 1.0) {
          double v13 = (v15 - v16) / (1.0 - v16) * 0.5 + 0.5;
        }
      }
      else
      {
        double v13 = v15 / v16 * 0.5;
      }
    }
  }
  long long v17 = (void *)[v7 color];
  uint64_t v18 = [v9 color];

  return (id)[v17 newBlendedColorWithFraction:v18 ofColor:v13];
}

- (void)colorComponents:(double *)a3 atFraction:(double)a4
{
  id v6 = [(TSDGradient *)self newColorAtFraction:a4];
  Components = CGColorGetComponents((CGColorRef)[v6 CGColor]);
  *a3 = *Components;
  a3[1] = Components[1];
  a3[2] = Components[2];
  a3[3] = Components[3];
}

- (void)paintRect:(CGRect)a3 inContext:(CGContext *)a4
{
}

- (void)paintRect:(CGRect)a3 inContext:(CGContext *)a4 atAngle:(double)a5
{
}

- (void)paintPath:(CGPath *)a3 inContext:(CGContext *)a4
{
}

- (CGAffineTransform)centeredRadialTransformInRect:(SEL)a3
{
  CGFloat height = a4.size.height;
  CGFloat width = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  double v9 = CGRectGetWidth(a4);
  v19.origin.CGFloat x = x;
  v19.origin.CGFloat y = y;
  v19.size.CGFloat width = width;
  v19.size.CGFloat height = height;
  double v10 = CGRectGetHeight(v19);
  *(_OWORD *)&retstr->a = 0u;
  *(_OWORD *)&retstr->c = 0u;
  *(_OWORD *)&retstr->tCGFloat x = 0u;
  v20.origin.CGFloat x = x;
  v20.origin.CGFloat y = y;
  v20.size.CGFloat width = width;
  v20.size.CGFloat height = height;
  CGFloat MidX = CGRectGetMidX(v20);
  v21.origin.CGFloat x = x;
  v21.origin.CGFloat y = y;
  v21.size.CGFloat width = width;
  v21.size.CGFloat height = height;
  CGFloat MidY = CGRectGetMidY(v21);
  CGAffineTransformMakeTranslation(retstr, MidX, MidY);
  CGAffineTransformMakeScale(&t1, v9 * 0.00707106781, v10 * 0.00707106781);
  long long v13 = *(_OWORD *)&retstr->c;
  *(_OWORD *)&v16.a = *(_OWORD *)&retstr->a;
  *(_OWORD *)&v16.c = v13;
  *(_OWORD *)&v16.tCGFloat x = *(_OWORD *)&retstr->tx;
  result = CGAffineTransformConcat(&v18, &t1, &v16);
  long long v15 = *(_OWORD *)&v18.c;
  *(_OWORD *)&retstr->a = *(_OWORD *)&v18.a;
  *(_OWORD *)&retstr->c = v15;
  *(_OWORD *)&retstr->tCGFloat x = *(_OWORD *)&v18.tx;
  return result;
}

- (BOOL)isOpaque
{
  [(TSDGradient *)self opacity];
  if (v3 == 1.0)
  {
    uint64_t v4 = [(NSMutableArray *)self->mStops count];
    if (v4)
    {
      unint64_t v5 = v4;
      unint64_t v6 = 1;
      do
      {
        int v7 = objc_msgSend((id)objc_msgSend((id)-[NSMutableArray objectAtIndex:](self->mStops, "objectAtIndex:", v6 - 1), "color"), "isOpaque");
        if (v7) {
          BOOL v8 = v6 >= v5;
        }
        else {
          BOOL v8 = 1;
        }
        ++v6;
      }
      while (!v8);
    }
    else
    {
      LOBYTE(v7) = 1;
    }
  }
  else
  {
    LOBYTE(v7) = 0;
  }
  return v7;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  uint64_t v4 = [(TSDGradient *)+[TSDMutableGradient allocWithZone:a3] initWithGradientStops:self->mStops type:self->mType opacity:self->mOpacity];
  [(TSDGradient *)v4 setIsAdvancedGradient:self->mIsAdvancedGradient];
  return v4;
}

- (BOOL)hasAlpha
{
  v2 = (void *)[(NSMutableArray *)self->mStops objectEnumerator];
  do
  {
    double v3 = (void *)[v2 nextObject];
    uint64_t v4 = v3;
  }
  while (v3 && CGColorGetAlpha((CGColorRef)objc_msgSend((id)objc_msgSend(v3, "color"), "CGColor")) == 1.0);
  return v4 != 0;
}

- (int)fillType
{
  return 1;
}

- (int64_t)mixingTypeWithObject:(id)a3
{
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __36__TSDGradient_mixingTypeWithObject___block_invoke;
  v4[3] = &unk_2646B1758;
  v4[4] = a3;
  v4[5] = self;
  return TSDMixingTypeWithObject((unint64_t)self, (unint64_t)a3, (uint64_t)v4);
}

uint64_t __36__TSDGradient_mixingTypeWithObject___block_invoke(uint64_t a1)
{
  objc_opt_class();
  v2 = (void *)TSUDynamicCast();
  if (!v2)
  {
    double v3 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v4 = [NSString stringWithUTF8String:"-[TSDGradient mixingTypeWithObject:]_block_invoke"];
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDGradient.m"), 538, @"nil object after cast");
  }
  uint64_t v5 = [*(id *)(a1 + 40) gradientType];
  if (v5 != [v2 gradientType]) {
    return 1;
  }
  uint64_t v6 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 40), "gradientStops"), "count");
  if (v6 != objc_msgSend((id)objc_msgSend(v2, "gradientStops"), "count")) {
    return 2;
  }
  if (!objc_msgSend((id)objc_msgSend(*(id *)(a1 + 40), "gradientStops"), "count")) {
    return 4;
  }
  unint64_t v7 = 0;
  uint64_t v8 = 4;
  do
  {
    uint64_t v8 = TSDMixingTypeBestFromMixingTypes(v8, objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 40), "gradientStops"), "objectAtIndex:", v7), "mixingTypeWithObject:", objc_msgSend((id)objc_msgSend(v2, "gradientStops"), "objectAtIndex:", v7)));
    ++v7;
  }
  while (v7 < objc_msgSend((id)objc_msgSend(*(id *)(a1 + 40), "gradientStops"), "count"));
  return v8;
}

- (id)mixedObjectWithFraction:(double)a3 ofObject:(id)a4
{
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __48__TSDGradient_mixedObjectWithFraction_ofObject___block_invoke;
  v5[3] = &unk_2646B1780;
  v5[4] = a4;
  v5[5] = self;
  *(double *)&v5[6] = a3;
  return (id)TSDMixingMixedObjectWithFraction(self, a4, (uint64_t)v5);
}

TSDGradient *__48__TSDGradient_mixedObjectWithFraction_ofObject___block_invoke(uint64_t a1)
{
  objc_opt_class();
  v2 = (void *)TSUDynamicCast();
  double v3 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend((id)objc_msgSend(*(id *)(a1 + 40), "gradientStops"), "count"));
  if (objc_msgSend((id)objc_msgSend(*(id *)(a1 + 40), "gradientStops"), "count"))
  {
    unint64_t v4 = 0;
    do
    {
      objc_msgSend(v3, "addObject:", objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 40), "gradientStops"), "objectAtIndex:", v4), "mixedObjectWithFraction:ofObject:", objc_msgSend((id)objc_msgSend(v2, "gradientStops"), "objectAtIndex:", v4), *(double *)(a1 + 48)));
      ++v4;
    }
    while (v4 < objc_msgSend((id)objc_msgSend(*(id *)(a1 + 40), "gradientStops"), "count"));
  }
  [*(id *)(a1 + 40) opacity];
  double v6 = v5;
  [v2 opacity];
  uint64_t v8 = -[TSDGradient initWithGradientStops:type:opacity:]([TSDGradient alloc], "initWithGradientStops:type:opacity:", v3, [*(id *)(a1 + 40) gradientType], TSDMixFloats(v6, v7, *(double *)(a1 + 48)));

  return v8;
}

- (CGPoint)startPointForPath:(id)a3 andBounds:(CGRect)a4
{
  unint64_t v4 = objc_msgSend(MEMORY[0x263F7C7F0], "currentHandler", a3, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height);
  uint64_t v5 = [NSString stringWithUTF8String:"-[TSDGradient startPointForPath:andBounds:]"];
  objc_msgSend(v4, "handleFailureInFunction:file:lineNumber:description:", v5, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDGradient.m"), 581, @"Subclasses should override.");
  double v6 = *MEMORY[0x263F00148];
  double v7 = *(double *)(MEMORY[0x263F00148] + 8);
  result.CGFloat y = v7;
  result.CGFloat x = v6;
  return result;
}

- (CGPoint)endPointForPath:(id)a3 andBounds:(CGRect)a4
{
  unint64_t v4 = objc_msgSend(MEMORY[0x263F7C7F0], "currentHandler", a3, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height);
  uint64_t v5 = [NSString stringWithUTF8String:"-[TSDGradient endPointForPath:andBounds:]"];
  objc_msgSend(v4, "handleFailureInFunction:file:lineNumber:description:", v5, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDGradient.m"), 587, @"Subclasses should override.");
  double v6 = *MEMORY[0x263F00148];
  double v7 = *(double *)(MEMORY[0x263F00148] + 8);
  result.CGFloat y = v7;
  result.CGFloat x = v6;
  return result;
}

- (void)p_setAlpha:(CGContext *)a3
{
  [(TSDGradient *)self opacity];

  CGContextSetAlpha(a3, v4);
}

- (CGContext)p_beginBitmapWrapperContextInContext:(CGContext *)a3 returningIntegralBounds:(CGRect *)a4
{
  if (!a3) {
    return 0;
  }
  ClipBoundingBodouble x = CGContextGetClipBoundingBox(a3);
  CGRect v13 = CGRectIntegral(ClipBoundingBox);
  double x = v13.origin.x;
  double y = v13.origin.y;
  CGFloat width = v13.size.width;
  CGFloat height = v13.size.height;
  double v9 = TSDBitmapContextCreate(3, v13.size.width);
  double v10 = v9;
  if (v9) {
    CGContextTranslateCTM(v9, -x, -y);
  }
  if (a4)
  {
    a4->origin.double x = x;
    a4->origin.double y = y;
    a4->size.CGFloat width = width;
    a4->size.CGFloat height = height;
  }
  return v10;
}

- (void)p_endBitmapWrapperContext:(CGContext *)a3 inContext:(CGContext *)a4 withIntegralBounds:(CGRect)a5
{
  if (a3)
  {
    if (a4)
    {
      CGFloat height = a5.size.height;
      CGFloat width = a5.size.width;
      CGFloat y = a5.origin.y;
      CGFloat x = a5.origin.x;
      CGImageRef Image = CGBitmapContextCreateImage(a3);
      if (Image)
      {
        double v12 = Image;
        CGContextSaveGState(a4);
        v14.origin.CGFloat x = x;
        v14.origin.CGFloat y = y;
        v14.size.CGFloat width = width;
        v14.size.CGFloat height = height;
        CGContextDrawImage(a4, v14, v12);
        CGContextRestoreGState(a4);
        CGImageRelease(v12);
      }
    }
    CGContextRelease(a3);
  }
}

+ (id)presetKinds
{
  return (id)[MEMORY[0x263EFFA08] setWithObject:String];
}

+ (void)bootstrapPresetsOfKind:(id)a3 inTheme:(id)a4 alternate:(int)a5
{
  if (([a3 isEqual:String] & 1) == 0)
  {
    uint64_t v8 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v9 = [NSString stringWithUTF8String:"+[TSDGradient bootstrapPresetsOfKind:inTheme:alternate:]"];
    [v8 handleFailureInFunction:v9, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDGradient.m"), 677, @"Attempt to bootstrap gradient presets for kind %@ in theme <%p>.", a3, a4 file lineNumber description];
  }
  double v10 = (void *)[a4 colors];
  if (!v10)
  {
    double v11 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v12 = [NSString stringWithUTF8String:"+[TSDGradient bootstrapPresetsOfKind:inTheme:alternate:]"];
    objc_msgSend(v11, "handleFailureInFunction:file:lineNumber:description:", v12, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDGradient.m"), 679, @"invalid nil value for '%s'", "colors");
  }
  CGRect v13 = (void *)[objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:6];
  if (a5 >= 7)
  {
    long long v15 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v16 = [NSString stringWithUTF8String:"+[TSDGradient bootstrapPresetsOfKind:inTheme:alternate:]"];
    objc_msgSend(v15, "handleFailureInFunction:file:lineNumber:description:", v16, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDGradient.m"), 697, @"invalid theme alternate value");
    uint64_t v14 = 0;
  }
  else
  {
    uint64_t v14 = (uint64_t)*(&off_2646B17C8 + a5);
  }
  for (uint64_t i = 0; i != 192; i += 32)
  {
    CGAffineTransform v18 = -[TSDAngleGradient initWithGradientStops:type:opacity:angle:]([TSDAngleGradient alloc], "initWithGradientStops:type:opacity:angle:", objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:", +[TSDGradientStop gradientStopWithColor:fraction:](TSDGradientStop, "gradientStopWithColor:fraction:", objc_msgSend(v10, "objectAtIndex:", *(void *)(v14 + i)), 0.0), +[TSDGradientStop gradientStopWithColor:fraction:](TSDGradientStop, "gradientStopWithColor:fraction:", objc_msgSend(v10, "objectAtIndex:", *(void *)(v14 + i + 8)), 1.0), 0), *(void *)(v14 + i + 24), 1.0, *(double *)(v14 + i + 16));
    [v13 addObject:v18];
  }
  id v19 = (id)[objc_alloc(MEMORY[0x263EFF8C0]) initWithArray:v13];
  [a4 setPresets:v19 ofKind:a3];
}

- (NSString)presetKind
{
  return (NSString *)String;
}

- (SEL)mapThemeAssetSelector
{
  return sel_tsdMapGradient_;
}

- (void)p_setGradientStops:(id)a3
{
  if (self->mStops != a3)
  {
    uint64_t v5 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithArray:");
    if ([a3 count])
    {
      uint64_t v6 = 0;
      unsigned int v7 = 1;
      do
      {
        uint64_t v8 = (void *)[a3 objectAtIndex:v6];
        uint64_t v9 = (void *)[v8 color];
        ColorSpace = CGColorGetColorSpace((CGColorRef)[v9 CGColor]);
        if (CGColorSpaceGetModel(ColorSpace) != kCGColorSpaceModelRGB)
        {
          double v11 = (void *)MEMORY[0x263F7C808];
          [v9 redComponent];
          double v13 = v12;
          [v9 greenComponent];
          double v15 = v14;
          [v9 blueComponent];
          double v17 = v16;
          [v9 alphaComponent];
          objc_msgSend(v5, "replaceObjectAtIndex:withObject:", v6, objc_msgSend(v8, "gradientStopWithColor:", objc_msgSend(v11, "colorWithRed:green:blue:alpha:", v13, v15, v17, v18)));
        }
        uint64_t v6 = v7;
      }
      while ([a3 count] > (unint64_t)v7++);
    }
    [(NSMutableArray *)self->mStops removeAllObjects];
    [(NSMutableArray *)self->mStops addObjectsFromArray:v5];
    [(TSDGradient *)self releaseShadingRef];
  }
}

- (void)p_insertGradientStop:(id)a3
{
  if ([(NSMutableArray *)self->mStops count])
  {
    uint64_t v8 = 0;
    uint64_t v9 = &v8;
    uint64_t v10 = 0x2020000000;
    uint64_t v11 = 0;
    uint64_t v11 = [(NSMutableArray *)self->mStops count];
    mStops = self->mStops;
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __36__TSDGradient_p_insertGradientStop___block_invoke;
    v7[3] = &unk_2646B17A8;
    v7[4] = a3;
    v7[5] = &v8;
    [(NSMutableArray *)mStops enumerateObjectsUsingBlock:v7];
    [(NSMutableArray *)self->mStops insertObject:a3 atIndex:v9[3]];
    [(TSDGradient *)self releaseShadingRef];
    _Block_object_dispose(&v8, 8);
  }
  else
  {
    uint64_t v6 = self->mStops;
    [(NSMutableArray *)v6 addObject:a3];
  }
}

uint64_t __36__TSDGradient_p_insertGradientStop___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  [a2 fraction];
  double v8 = v7;
  uint64_t result = [*(id *)(a1 + 32) fraction];
  if (v8 > v10)
  {
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a3;
    *a4 = 1;
  }
  return result;
}

- (void)p_removeStop:(id)a3
{
  if ((unint64_t)[(NSMutableArray *)self->mStops count] < 3) {
    [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF488] format:@"Attempted to remove too many gradient stops. Must have at least 2."];
  }
  else {
    [(NSMutableArray *)self->mStops removeObject:a3];
  }

  [(TSDGradient *)self releaseShadingRef];
}

- (id)p_removeStopAtIndex:(unint64_t)a3
{
  if ((unint64_t)[(NSMutableArray *)self->mStops count] < 3) {
    objc_exception_throw((id)[MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF4A0] reason:@"Attempted to remove too many gradient stops. Must have at least 2." userInfo:0]);
  }
  id v5 = (id)[(NSMutableArray *)self->mStops objectAtIndex:a3];
  [(NSMutableArray *)self->mStops removeObjectAtIndex:a3];

  return v5;
}

- (id)p_insertStopAtFraction:(double)a3
{
  id v5 = -[TSDGradient newColorAtFraction:](self, "newColorAtFraction:");

  return [(TSDGradient *)self p_insertStopAtFraction:v5 withColor:a3];
}

- (id)p_insertStopAtFraction:(double)a3 withColor:(id)a4
{
  id v5 = +[TSDGradientStop gradientStopWithColor:a4 fraction:a3];
  [(TSDGradient *)self p_insertGradientStop:v5];
  [(TSDGradient *)self releaseShadingRef];
  return v5;
}

- (void)p_reverseStopOrder
{
  uint64_t v3 = [(NSMutableArray *)self->mStops count];
  CGFloat v4 = (void *)[MEMORY[0x263EFF980] arrayWithCapacity:v3];
  if (v3)
  {
    for (uint64_t i = 0; i != v3; ++i)
      objc_msgSend(v4, "addObject:", (id)objc_msgSend((id)-[NSMutableArray objectAtIndexedSubscript:](self->mStops, "objectAtIndexedSubscript:", i), "mutableCopy"));
  }
  unint64_t v6 = 1;
  uint64_t v7 = v3 - 1;
  do
  {
    double v8 = (void *)[v4 objectAtIndexedSubscript:v6 - 1];
    [v8 fraction];
    [v8 setFraction:1.0 - v9];
    if (v6 - 1 != v7)
    {
      double v10 = (void *)[v4 objectAtIndexedSubscript:v7];
      [v10 fraction];
      [v10 setFraction:1.0 - v11];
      [v4 exchangeObjectAtIndex:v6 - 1 withObjectAtIndex:v7];
    }
  }
  while (v6++ <= --v7);
  if (v3 != 1)
  {
    uint64_t v13 = 0;
    uint64_t v14 = v3 - 2;
    do
    {
      double v15 = (void *)[v4 objectAtIndex:v13];
      objc_msgSend((id)-[NSMutableArray objectAtIndex:](self->mStops, "objectAtIndex:", v14), "inflection");
      [v15 setInflection:1.0 - v16];
      ++v13;
      --v14;
    }
    while (v14 != -1);
  }
  objc_msgSend((id)objc_msgSend(v4, "objectAtIndex:", v3 - 1), "setInflection:", 0.5);
  if (v3)
  {
    for (uint64_t j = 0; j != v3; ++j)
    {
      double v18 = -[TSDGradientStop initWithGradientStop:]([TSDGradientStop alloc], "initWithGradientStop:", [v4 objectAtIndexedSubscript:j]);
      [(NSMutableArray *)self->mStops setObject:v18 atIndexedSubscript:j];
    }
  }

  [(TSDGradient *)self releaseShadingRef];
}

- (void)p_evenlyDistributeStops
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  uint64_t v3 = [(NSMutableArray *)self->mStops count];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  mStops = self->mStops;
  uint64_t v5 = [(NSMutableArray *)mStops countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    double v7 = 1.0 / (double)(unint64_t)(v3 - 1);
    uint64_t v8 = *(void *)v12;
    double v9 = 0.0;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(mStops);
        }
        [*(id *)(*((void *)&v11 + 1) + 8 * i) setFraction:v9];
        double v9 = v7 + v9;
      }
      uint64_t v6 = [(NSMutableArray *)mStops countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }
  [(TSDGradient *)self releaseShadingRef];
}

- (void)p_setGradientType:(unint64_t)a3
{
  self->mType = a3;
  [(TSDGradient *)self releaseShadingRef];
}

- (void)p_moveStopAtIndex:(unint64_t)a3 toFraction:(double)a4
{
  id v7 = (id)objc_msgSend((id)-[NSMutableArray objectAtIndexedSubscript:](self->mStops, "objectAtIndexedSubscript:"), "mutableCopy");
  [v7 setFraction:a4];
  uint64_t v8 = [[TSDGradientStop alloc] initWithGradientStop:v7];
  [(NSMutableArray *)self->mStops setObject:v8 atIndexedSubscript:a3];

  [(TSDGradient *)self releaseShadingRef];
}

- (void)p_swapStopAtIndex:(unint64_t)a3 withStopAtIndex:(unint64_t)a4
{
  id v7 = (id)objc_msgSend((id)-[NSMutableArray objectAtIndexedSubscript:](self->mStops, "objectAtIndexedSubscript:"), "mutableCopy");
  uint64_t v8 = -[TSDGradientStop initWithGradientStop:]([TSDGradientStop alloc], "initWithGradientStop:", (id)objc_msgSend((id)-[NSMutableArray objectAtIndexedSubscript:](self->mStops, "objectAtIndexedSubscript:", a4), "mutableCopy"));
  double v9 = [[TSDGradientStop alloc] initWithGradientStop:v7];
  [(NSMutableArray *)self->mStops setObject:v8 atIndexedSubscript:a3];
  [(NSMutableArray *)self->mStops setObject:v9 atIndexedSubscript:a4];

  [(TSDGradient *)self releaseShadingRef];
}

- (void)p_setColorOfStopAtIndex:(unint64_t)a3 toColor:(id)a4
{
  id v7 = (id)objc_msgSend((id)-[NSMutableArray objectAtIndexedSubscript:](self->mStops, "objectAtIndexedSubscript:"), "mutableCopy");
  [v7 setColor:a4];
  uint64_t v8 = [[TSDGradientStop alloc] initWithGradientStop:v7];
  [(NSMutableArray *)self->mStops setObject:v8 atIndexedSubscript:a3];

  [(TSDGradient *)self releaseShadingRef];
}

- (void)p_setInflectionOfStopAtIndex:(unint64_t)a3 toInflection:(double)a4
{
  id v7 = (id)objc_msgSend((id)-[NSMutableArray objectAtIndexedSubscript:](self->mStops, "objectAtIndexedSubscript:"), "mutableCopy");
  [v7 setInflection:a4];
  uint64_t v8 = [[TSDGradientStop alloc] initWithGradientStop:v7];
  [(NSMutableArray *)self->mStops setObject:v8 atIndexedSubscript:a3];

  [(TSDGradient *)self releaseShadingRef];
}

- (unint64_t)gradientType
{
  return self->mType;
}

- (double)opacity
{
  return self->mOpacity;
}

- (void)setOpacity:(double)a3
{
  self->mOpacitCGFloat y = a3;
}

- (void)setIsAdvancedGradient:(BOOL)a3
{
  self->mIsAdvancedGradient = a3;
}

@end