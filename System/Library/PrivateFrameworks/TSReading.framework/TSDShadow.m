@interface TSDShadow
+ (BOOL)automaticallyNotifiesObserversOfTSUColor;
+ (BOOL)canMixWithNilObjects;
+ (TSDShadow)shadowWithAngle:(double)a3 offset:(double)a4 radius:(double)a5 opacity:(double)a6 color:(CGColor *)a7 enabled:(BOOL)a8;
+ (TSDShadow)shadowWithNSShadow:(id)a3;
+ (id)contactShadowWithAngle:(double)a3 offset:(double)a4 radius:(double)a5 height:(double)a6 opacity:(double)a7 color:(CGColor *)a8 enabled:(BOOL)a9;
+ (id)curvedShadowWithOffset:(double)a3 angle:(double)a4 radius:(double)a5 curve:(double)a6 opacity:(double)a7 color:(CGColor *)a8 enabled:(BOOL)a9;
+ (id)defaultDisabledShadow;
+ (id)defaultShadow;
+ (id)keyPathsForValuesAffectingTSUColor;
+ (id)mixableObjectClasses;
+ (id)p_defaultShadowEnabled:(BOOL)a3;
+ (id)presetKinds;
+ (void)bootstrapPresetsOfKind:(id)a3 inTheme:(id)a4 alternate:(int)a5;
- (BOOL)differenceRequiresRebuilding:(id)a3;
- (BOOL)isContactShadow;
- (BOOL)isCurvedShadow;
- (BOOL)isDropShadow;
- (BOOL)isEnabled;
- (BOOL)isEqual:(id)a3;
- (BOOL)showForEditingText;
- (CGColor)color;
- (CGImage)i_newEmptyImageWithSize:(CGSize)a3;
- (CGImage)newShadowImageForRep:(id)a3 withSize:(CGSize)a4 drawSelector:(SEL)a5 unflipped:(BOOL)a6;
- (CGPoint)offsetDelta;
- (CGRect)boundsForRep:(id)a3;
- (CGRect)boundsInNaturalSpaceForRep:(id)a3;
- (CGRect)shadowBoundsForRect:(CGRect)a3;
- (CGRect)shadowBoundsForRect:(CGRect)a3 additionalAngle:(double)a4;
- (CGRect)shadowBoundsForRect:(CGRect)a3 additionalTransform:(CGAffineTransform *)a4;
- (NSString)presetKind;
- (SEL)mapThemeAssetSelector;
- (TSUColor)TSUColor;
- (double)angle;
- (double)clampOffset:(double)a3;
- (double)clampOpacity:(double)a3;
- (double)clampRadius:(double)a3;
- (double)offset;
- (double)opacity;
- (double)radius;
- (id)NSShadow;
- (id)description;
- (id)i_initWithOpacity:(double)a3 color:(CGColor *)a4 enabled:(BOOL)a5;
- (id)mixedBaseObjectWithObject:(id)a3;
- (id)mixedObjectWithFraction:(double)a3 ofObject:(id)a4;
- (id)mutableCopy;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (id)newShadowClampedForSwatches;
- (id)shadowByTransformingByTransform:(CGAffineTransform *)a3;
- (id)typeDescription;
- (int64_t)mixingTypeWithObject:(id)a3;
- (unint64_t)hash;
- (unint64_t)shadowType;
- (void)applyToContext:(CGContext *)a3 viewScale:(double)a4;
- (void)applyToContext:(CGContext *)a3 viewScale:(double)a4 flipped:(BOOL)a5;
- (void)applyToContext:(CGContext *)a3 viewScale:(double)a4 flipped:(BOOL)a5 extraOffset:(CGSize)a6;
- (void)dealloc;
@end

@implementation TSDShadow

+ (id)p_defaultShadowEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t DeviceRGB = TSUCGColorCreateDeviceRGB();
  if (DeviceRGB)
  {
    v5 = (CGColor *)DeviceRGB;
    v6 = [[TSDDropShadow alloc] initWithAngle:DeviceRGB offset:v3 radius:315.0 opacity:5.0 color:1.0 enabled:1.0];
    CGColorRelease(v5);
  }
  else
  {
    v6 = 0;
  }
  return v6;
}

+ (id)defaultShadow
{
  return (id)objc_msgSend(a1, "p_defaultShadowEnabled:", 1);
}

+ (id)defaultDisabledShadow
{
  return (id)objc_msgSend(a1, "p_defaultShadowEnabled:", 0);
}

+ (TSDShadow)shadowWithAngle:(double)a3 offset:(double)a4 radius:(double)a5 opacity:(double)a6 color:(CGColor *)a7 enabled:(BOOL)a8
{
  v8 = [[TSDDropShadow alloc] initWithAngle:a7 offset:a8 radius:a3 opacity:a4 color:a5 enabled:a6];
  return (TSDShadow *)v8;
}

+ (id)contactShadowWithAngle:(double)a3 offset:(double)a4 radius:(double)a5 height:(double)a6 opacity:(double)a7 color:(CGColor *)a8 enabled:(BOOL)a9
{
  v9 = [[TSDContactShadow alloc] initWithOffset:a8 height:a9 radius:a4 opacity:a6 color:a5 enabled:a7];
  return v9;
}

+ (TSDShadow)shadowWithNSShadow:(id)a3
{
  [a3 shadowOffset];
  long double v5 = v4;
  double v7 = v6;
  v8 = (CGColor *)[a3 shadowColor];
  double v9 = -v7;
  double v10 = TSDAngleFromDelta(v5, v9) * 57.2957795;
  double v11 = TSDDistance(*MEMORY[0x263F00148], *(double *)(MEMORY[0x263F00148] + 8), v5, v9);
  [a3 shadowBlurRadius];
  double v13 = v12;
  objc_msgSend((id)objc_msgSend(MEMORY[0x263F7C808], "colorWithCGColor:", v8), "alphaComponent");
  double v15 = v14;
  CopyWithAlpha = CGColorCreateCopyWithAlpha(v8, 1.0);
  v17 = +[TSDShadow shadowWithAngle:CopyWithAlpha offset:1 radius:v10 opacity:v11 color:v13 enabled:v15];
  CGColorRelease(CopyWithAlpha);
  return v17;
}

+ (id)curvedShadowWithOffset:(double)a3 angle:(double)a4 radius:(double)a5 curve:(double)a6 opacity:(double)a7 color:(CGColor *)a8 enabled:(BOOL)a9
{
  double v9 = [[TSDCurvedShadow alloc] initWithOffset:a8 angle:a9 radius:a3 curve:a4 opacity:a5 color:a6 enabled:a7];
  return v9;
}

- (double)clampOffset:(double)a3
{
  TSUClamp();
  return result;
}

- (double)clampRadius:(double)a3
{
  TSUClamp();
  return result;
}

- (double)clampOpacity:(double)a3
{
  TSUClamp();
  return result;
}

- (id)mutableCopy
{
  uint64_t v3 = [(TSDShadow *)self zone];
  return [(TSDShadow *)self mutableCopyWithZone:v3];
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  return 0;
}

- (id)newShadowClampedForSwatches
{
  return 0;
}

- (void)dealloc
{
  CGColorRelease(self->mColor);
  v3.receiver = self;
  v3.super_class = (Class)TSDShadow;
  [(TSDShadow *)&v3 dealloc];
}

- (unint64_t)hash
{
  return CFHash(self->mColor);
}

- (BOOL)isContactShadow
{
  return [(TSDShadow *)self shadowType] == 2;
}

- (BOOL)isDropShadow
{
  return [(TSDShadow *)self shadowType] == 1;
}

- (BOOL)isCurvedShadow
{
  return [(TSDShadow *)self shadowType] == 3;
}

- (BOOL)showForEditingText
{
  return 0;
}

- (unint64_t)shadowType
{
  return 0;
}

- (BOOL)isEqual:(id)a3
{
  if (a3 == self)
  {
    LOBYTE(v18) = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_8;
    }
    [(TSDShadow *)self angle];
    double v6 = v5;
    [a3 angle];
    if (v6 != v7) {
      goto LABEL_8;
    }
    [(TSDShadow *)self offset];
    double v9 = v8;
    [a3 offset];
    if (v9 != v10) {
      goto LABEL_8;
    }
    [(TSDShadow *)self radius];
    double v12 = v11;
    [a3 radius];
    if (v12 == v13
      && (-[TSDShadow opacity](self, "opacity"), double v15 = v14, [a3 opacity], v15 == v16)
      && (int v17 = -[TSDShadow isEnabled](self, "isEnabled"), v17 == [a3 isEnabled]))
    {
      BOOL v18 = CGColorEqualToColor(-[TSDShadow color](self, "color"), (CGColorRef)[a3 color]);
      if (v18)
      {
        unint64_t v19 = [(TSDShadow *)self shadowType];
        LOBYTE(v18) = v19 == [a3 shadowType];
      }
    }
    else
    {
LABEL_8:
      LOBYTE(v18) = 0;
    }
  }
  return v18;
}

- (id)description
{
  objc_super v3 = NSString;
  double v4 = (objc_class *)objc_opt_class();
  double v5 = NSStringFromClass(v4);
  if (self->mEnabled) {
    double v6 = @"YES";
  }
  else {
    double v6 = @"NO";
  }
  return (id)[v3 stringWithFormat:@"<%@ %p: angle=%g offset=%g radius=%g opacity=%g color=%p enabled=%@ type=%@>", v5, self, *(_OWORD *)&self->mAngle, *(void *)&self->mRadius, *(void *)&self->mOpacity, self->mColor, v6, -[TSDShadow typeDescription](self, "typeDescription")];
}

- (id)typeDescription
{
  unint64_t v2 = [(TSDShadow *)self shadowType];
  if (v2 > 3) {
    return 0;
  }
  else {
    return off_2646B1AF8[v2];
  }
}

- (CGPoint)offsetDelta
{
  double v8 = 0.0;
  double v9 = 0.0;
  [(TSDShadow *)self offset];
  double v4 = v3;
  [(TSDShadow *)self angle];
  TSDOriginRotate(&v8, v4, v5 * 0.0174532925);
  double v6 = v8;
  double v7 = v9;
  result.y = v7;
  result.x = v6;
  return result;
}

+ (id)keyPathsForValuesAffectingTSUColor
{
  return (id)[MEMORY[0x263EFFA08] setWithObject:@"color"];
}

+ (BOOL)automaticallyNotifiesObserversOfTSUColor
{
  return 0;
}

- (TSUColor)TSUColor
{
  unint64_t v2 = (void *)MEMORY[0x263F7C808];
  double v3 = [(TSDShadow *)self color];
  return (TSUColor *)[v2 colorWithCGColor:v3];
}

- (void)applyToContext:(CGContext *)a3 viewScale:(double)a4
{
}

- (void)applyToContext:(CGContext *)a3 viewScale:(double)a4 flipped:(BOOL)a5
{
}

- (void)applyToContext:(CGContext *)a3 viewScale:(double)a4 flipped:(BOOL)a5 extraOffset:(CGSize)a6
{
  double height = a6.height;
  double width = a6.width;
  BOOL v8 = a5;
  if ([(TSDShadow *)self isEnabled])
  {
    double v29 = 0.0;
    double v30 = 0.0;
    [(TSDShadow *)self angle];
    if (v8) {
      double v13 = v12;
    }
    else {
      double v13 = -v12;
    }
    int IsCALayerContext = TSDCGContextIsCALayerContext((uint64_t)a3);
    double v15 = TSDCGContextAssociatedScreenScale((uint64_t)a3);
    double v16 = v15;
    if (IsCALayerContext)
    {
      double width = TSDMultiplySizeScalar(width, height, 1.0 / v15);
      double height = v17;
      double v16 = 1.0;
    }
    [(TSDShadow *)self radius];
    CGFloat v19 = v16 * (v18 * a4);
    [(TSDShadow *)self offset];
    TSDOriginRotate(&v29, v16 * (v20 * a4), v13 * 0.0174532925);
    v31.double width = width;
    v31.double height = height;
    CGSize v21 = CGContextConvertSizeToDeviceSpace(a3, v31);
    CGFloat v22 = v29 + v21.width;
    CGFloat v23 = v21.height + v30;
    v24 = [(TSDShadow *)self color];
    [(TSDShadow *)self opacity];
    double v26 = v25;
    CGFloat Alpha = CGColorGetAlpha([(TSDShadow *)self color]);
    CopyWithCGFloat Alpha = CGColorCreateCopyWithAlpha(v24, v26 * Alpha);
    v32.double width = v22;
    v32.double height = v23;
    CGContextSetShadowWithColor(a3, v32, v19, CopyWithAlpha);
    CGColorRelease(CopyWithAlpha);
  }
}

- (CGRect)boundsInNaturalSpaceForRep:(id)a3
{
  double v3 = *MEMORY[0x263F001A8];
  double v4 = *(double *)(MEMORY[0x263F001A8] + 8);
  double v5 = *(double *)(MEMORY[0x263F001A8] + 16);
  double v6 = *(double *)(MEMORY[0x263F001A8] + 24);
  result.size.double height = v6;
  result.size.double width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (CGRect)boundsForRep:(id)a3
{
  double v3 = *MEMORY[0x263F001A8];
  double v4 = *(double *)(MEMORY[0x263F001A8] + 8);
  double v5 = *(double *)(MEMORY[0x263F001A8] + 16);
  double v6 = *(double *)(MEMORY[0x263F001A8] + 24);
  result.size.double height = v6;
  result.size.double width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (CGImage)newShadowImageForRep:(id)a3 withSize:(CGSize)a4 drawSelector:(SEL)a5 unflipped:(BOOL)a6
{
  return 0;
}

- (CGRect)shadowBoundsForRect:(CGRect)a3 additionalTransform:(CGAffineTransform *)a4
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  if ([(TSDShadow *)self isEnabled])
  {
    [(TSDShadow *)self radius];
    CGFloat v11 = -v10;
    [(TSDShadow *)self radius];
    CGFloat v13 = -v12;
    v29.origin.CGFloat x = x;
    v29.origin.CGFloat y = y;
    v29.size.CGFloat width = width;
    v29.size.CGFloat height = height;
    CGRect v30 = CGRectInset(v29, v11, v13);
    CGFloat v14 = v30.origin.x;
    CGFloat v15 = v30.origin.y;
    CGFloat v16 = v30.size.width;
    CGFloat v17 = v30.size.height;
    [(TSDShadow *)self offsetDelta];
    float64x2_t v18 = *(float64x2_t *)&a4->c;
    v28[0] = *(float64x2_t *)&a4->a;
    v28[1] = v18;
    v28[2] = *(float64x2_t *)&a4->tx;
    double v21 = TSDDeltaApplyAffineTransform(v28, v19, v20);
    CGFloat v23 = v22;
    v31.origin.CGFloat x = v14;
    v31.origin.CGFloat y = v15;
    v31.size.CGFloat width = v16;
    v31.size.CGFloat height = v17;
    CGRect v35 = CGRectOffset(v31, v21, v23);
    v32.origin.CGFloat x = x;
    v32.origin.CGFloat y = y;
    v32.size.CGFloat width = width;
    v32.size.CGFloat height = height;
    CGRect v33 = CGRectUnion(v32, v35);
    CGFloat x = v33.origin.x;
    CGFloat y = v33.origin.y;
    CGFloat width = v33.size.width;
    CGFloat height = v33.size.height;
  }
  double v24 = x;
  double v25 = y;
  double v26 = width;
  double v27 = height;
  result.size.CGFloat height = v27;
  result.size.CGFloat width = v26;
  result.origin.CGFloat y = v25;
  result.origin.CGFloat x = v24;
  return result;
}

- (CGRect)shadowBoundsForRect:(CGRect)a3
{
  long long v3 = *(_OWORD *)(MEMORY[0x263F000D0] + 16);
  v8[0] = *MEMORY[0x263F000D0];
  v8[1] = v3;
  v8[2] = *(_OWORD *)(MEMORY[0x263F000D0] + 32);
  -[TSDShadow shadowBoundsForRect:additionalTransform:](self, "shadowBoundsForRect:additionalTransform:", v8, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  result.size.CGFloat height = v7;
  result.size.CGFloat width = v6;
  result.origin.CGFloat y = v5;
  result.origin.CGFloat x = v4;
  return result;
}

- (CGRect)shadowBoundsForRect:(CGRect)a3 additionalAngle:(double)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  CGAffineTransformMakeRotation(&v13, a4 * 0.0174532925);
  -[TSDShadow shadowBoundsForRect:additionalTransform:](self, "shadowBoundsForRect:additionalTransform:", &v13, x, y, width, height);
  result.size.double height = v12;
  result.size.double width = v11;
  result.origin.double y = v10;
  result.origin.double x = v9;
  return result;
}

- (BOOL)differenceRequiresRebuilding:(id)a3
{
  BOOL result = 1;
  if (a3)
  {
    [(TSDShadow *)self radius];
    double v6 = v5;
    [a3 radius];
    if (v6 == v7)
    {
      [(TSDShadow *)self opacity];
      double v9 = v8;
      [a3 opacity];
      if (v9 == v10 && CGColorEqualToColor(-[TSDShadow color](self, "color"), (CGColorRef)[a3 color]))
      {
        int v11 = [(TSDShadow *)self isEnabled];
        if (v11 == [a3 isEnabled]) {
          return 0;
        }
      }
    }
  }
  return result;
}

+ (id)presetKinds
{
  return (id)[MEMORY[0x263EFFA08] setWithObject:String];
}

+ (void)bootstrapPresetsOfKind:(id)a3 inTheme:(id)a4 alternate:(int)a5
{
  if (([a3 isEqual:String] & 1) == 0)
  {
    double v8 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v9 = [NSString stringWithUTF8String:"+[TSDShadow bootstrapPresetsOfKind:inTheme:alternate:]"];
    [v8 handleFailureInFunction:v9, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDShadow.m"), 487, @"Attempt to bootstrap shadow presets for kind %@ in theme <%p>.", a3, a4 file lineNumber description];
  }
  double v10 = (void *)[objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:8];
  id v27 = a4;
  id v28 = a3;
  if (a5 >= 7)
  {
    double v12 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v13 = [NSString stringWithUTF8String:"+[TSDShadow bootstrapPresetsOfKind:inTheme:alternate:]"];
    objc_msgSend(v12, "handleFailureInFunction:file:lineNumber:description:", v13, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDShadow.m"), 507, @"invalid theme alternate value");
    uint64_t v11 = 0;
  }
  else
  {
    uint64_t v11 = (uint64_t)*(&off_2646B1B18 + a5);
  }
  unint64_t v14 = 0;
  uint64_t v15 = v11 + 32;
  do
  {
    double v17 = *(double *)(v15 - 32);
    double v16 = *(double *)(v15 - 24);
    int v18 = *(_DWORD *)(v15 - 16);
    double v19 = *(double *)(v15 - 8);
    char v20 = *(unsigned char *)(v15 + 16);
    double v21 = *(double *)(v15 + 24);
    uint64_t v22 = objc_msgSend((id)objc_msgSend(MEMORY[0x263F7C808], "colorWithRed:green:blue:alpha:", *(float *)v15, *(float *)(v15 + 4), *(float *)(v15 + 8), *(float *)(v15 + 12)), "CGColor");
    if (v14 > 3)
    {
      uint64_t v24 = v20 & 1;
      if (v14 > 5) {
        CGFloat v23 = [[TSDContactShadow alloc] initWithOffset:v22 height:v24 radius:v16 opacity:v21 color:(double)v18 enabled:v19];
      }
      else {
        CGFloat v23 = [[TSDCurvedShadow alloc] initWithOffset:v22 angle:v24 radius:v16 curve:v17 opacity:(double)v18 color:v21 enabled:v19];
      }
    }
    else
    {
      CGFloat v23 = [[TSDDropShadow alloc] initWithAngle:v22 offset:v20 & 1 radius:v17 opacity:v16 color:(double)v18 enabled:v19];
    }
    double v25 = v23;
    [v10 addObject:v23];

    ++v14;
    v15 += 64;
  }
  while (v14 != 8);
  id v26 = (id)[objc_alloc(MEMORY[0x263EFF8C0]) initWithArray:v10];
  [v27 setPresets:v26 ofKind:v28];
}

- (NSString)presetKind
{
  return (NSString *)String;
}

- (SEL)mapThemeAssetSelector
{
  return sel_tsdMapShadow_;
}

+ (BOOL)canMixWithNilObjects
{
  return 1;
}

+ (id)mixableObjectClasses
{
  v3[3] = *MEMORY[0x263EF8340];
  v3[0] = objc_opt_class();
  v3[1] = objc_opt_class();
  v3[2] = objc_opt_class();
  return (id)[MEMORY[0x263EFF8C0] arrayWithObjects:v3 count:3];
}

- (int64_t)mixingTypeWithObject:(id)a3
{
  long long v3 = objc_msgSend(MEMORY[0x263F7C7F0], "currentHandler", a3);
  uint64_t v4 = [NSString stringWithUTF8String:"-[TSDShadow mixingTypeWithObject:]"];
  objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDShadow.m"), 591, @"Implement me in subclass!");
  return 1;
}

- (id)mixedObjectWithFraction:(double)a3 ofObject:(id)a4
{
  uint64_t v4 = objc_msgSend(MEMORY[0x263F7C7F0], "currentHandler", a4, a3);
  uint64_t v5 = [NSString stringWithUTF8String:"-[TSDShadow mixedObjectWithFraction:ofObject:]"];
  objc_msgSend(v4, "handleFailureInFunction:file:lineNumber:description:", v5, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDShadow.m"), 597, @"Implement me in subclass!");
  return 0;
}

- (id)mixedBaseObjectWithObject:(id)a3
{
  if ([(TSDShadow *)self isEnabled]) {
    return self;
  }
  else {
    return a3;
  }
}

- (id)shadowByTransformingByTransform:(CGAffineTransform *)a3
{
  double v4 = fmin(a3->a, a3->d);
  id v5 = [(TSDShadow *)self mutableCopy];
  [(TSDShadow *)self radius];
  [v5 setRadius:floor(v4 * v6)];
  [(TSDShadow *)self offset];
  [v5 setOffset:floor(v4 * v7)];
  return v5;
}

- (id)NSShadow
{
  if ([(TSDShadow *)self isEnabled])
  {
    id v3 = objc_alloc_init(MEMORY[0x263F1C360]);
    [(TSDShadow *)self angle];
    double v5 = v4 * 0.0174532925;
    [(TSDShadow *)self offset];
    double v7 = v6;
    double v8 = TSDDeltaFromAngle(v5);
    objc_msgSend(v3, "setShadowOffset:", TSDMultiplyPointScalar(v8, -v9, v7));
    [(TSDShadow *)self radius];
    objc_msgSend(v3, "setShadowBlurRadius:");
    double v10 = [(TSDShadow *)self color];
    [(TSDShadow *)self opacity];
    double v12 = v11;
    CGFloat Alpha = CGColorGetAlpha(v10);
    CopyWithCGFloat Alpha = CGColorCreateCopyWithAlpha(v10, v12 * Alpha);
    if (!CopyWithAlpha)
    {
      uint64_t v15 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
      uint64_t v16 = [NSString stringWithUTF8String:"-[TSDShadow NSShadow]"];
      objc_msgSend(v15, "handleFailureInFunction:file:lineNumber:description:", v16, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDShadow.m"), 640, @"invalid nil value for '%s'", "color");
    }
    [v3 setShadowColor:CopyWithAlpha];
    CGColorRelease(CopyWithAlpha);
  }
  else
  {
    id v3 = 0;
  }
  return v3;
}

- (double)angle
{
  return self->mAngle;
}

- (double)offset
{
  return self->mOffset;
}

- (double)radius
{
  return self->mRadius;
}

- (double)opacity
{
  return self->mOpacity;
}

- (CGColor)color
{
  return self->mColor;
}

- (BOOL)isEnabled
{
  return self->mEnabled;
}

- (id)i_initWithOpacity:(double)a3 color:(CGColor *)a4 enabled:(BOOL)a5
{
  if (!a4)
  {
    double v9 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v10 = [NSString stringWithUTF8String:"-[TSDShadow(Internal) i_initWithOpacity:color:enabled:]"];
    objc_msgSend(v9, "handleFailureInFunction:file:lineNumber:description:", v10, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDShadow-Internal.m"), 21, @"invalid nil value for '%s'", "color");
  }
  v16.receiver = self;
  v16.super_class = (Class)TSDShadow;
  double v11 = [(TSDShadow *)&v16 init];
  double v12 = v11;
  if (v11)
  {
    [(TSDShadow *)v11 clampOpacity:a3];
    v12->mOpacitdouble y = v13;
    if (a4) {
      CGColorRef v14 = CGColorRetain(a4);
    }
    else {
      CGColorRef v14 = 0;
    }
    v12->mColor = v14;
    v12->mEnabled = a5;
  }
  return v12;
}

- (CGImage)i_newEmptyImageWithSize:(CGSize)a3
{
  id v3 = TSDBitmapContextCreate(3, a3.width);
  Image = CGBitmapContextCreateImage(v3);
  CGContextRelease(v3);
  return Image;
}

@end