@interface TSDCurvedShadow
+ (id)curvedShadowWithOffset:(double)a3 angle:(double)a4 radius:(double)a5 curve:(double)a6 opacity:(double)a7 color:(CGColor *)a8 enabled:(BOOL)a9;
- (BOOL)isEqual:(id)a3;
- (BOOL)showForEditingText;
- (CGImage)newShadowImageForRep:(id)a3 withSize:(CGSize)a4 drawSelector:(SEL)a5 unflipped:(BOOL)a6;
- (CGPoint)boundsShiftForSize:(CGSize)a3;
- (CGRect)boundsForRep:(id)a3;
- (CGRect)boundsInNaturalSpaceForRep:(id)a3;
- (CGRect)expandedBoundsForRect:(CGRect)a3;
- (CGRect)shadowBoundsForRect:(CGRect)a3 additionalTransform:(CGAffineTransform *)a4;
- (TSDCurvedShadow)initWithOffset:(double)a3 angle:(double)a4 radius:(double)a5 curve:(double)a6 opacity:(double)a7 color:(CGColor *)a8 enabled:(BOOL)a9;
- (double)clampOffset:(double)a3;
- (double)curve;
- (double)getVerticalOffset:(CGSize)a3;
- (double)offsetFromCurve;
- (double)paddingForBlur;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)mixedObjectWithFraction:(double)a3 ofObject:(id)a4;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (id)newShadowClampedForSwatches;
- (int64_t)mixingTypeWithObject:(id)a3;
- (unint64_t)shadowType;
@end

@implementation TSDCurvedShadow

+ (id)curvedShadowWithOffset:(double)a3 angle:(double)a4 radius:(double)a5 curve:(double)a6 opacity:(double)a7 color:(CGColor *)a8 enabled:(BOOL)a9
{
  v9 = (void *)[objc_alloc((Class)a1) initWithOffset:a8 angle:a9 radius:a3 curve:a4 opacity:a5 color:a6 enabled:a7];

  return v9;
}

- (TSDCurvedShadow)initWithOffset:(double)a3 angle:(double)a4 radius:(double)a5 curve:(double)a6 opacity:(double)a7 color:(CGColor *)a8 enabled:(BOOL)a9
{
  BOOL v9 = a9;
  if (!a8)
  {
    v17 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v18 = [NSString stringWithUTF8String:"-[TSDCurvedShadow initWithOffset:angle:radius:curve:opacity:color:enabled:]"];
    objc_msgSend(v17, "handleFailureInFunction:file:lineNumber:description:", v18, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDCurvedShadow.m"), 50, @"invalid nil value for '%s'", "color");
  }
  v20.receiver = self;
  v20.super_class = (Class)TSDCurvedShadow;
  result = [(TSDShadow *)&v20 i_initWithOpacity:a8 color:v9 enabled:a7];
  if (result)
  {
    result->super.mOffset = a3;
    result->super.mRadius = a5;
    result->mCurve = a6;
    result->super.mAngle = a4;
  }
  return result;
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  if (self->super.mEnabled) {
    v6 = @"YES";
  }
  else {
    v6 = @"NO";
  }
  return (id)[v3 stringWithFormat:@"<%@ %p: angle=%g offset=%g radius=%g opacity=%g color=%p enabled=%@  curve=%f type=%@>", v5, self, *(void *)&self->super.mAngle, *(void *)&self->super.mOffset, *(void *)&self->super.mRadius, *(void *)&self->super.mOpacity, self->super.mColor, v6, *(void *)&self->mCurve, -[TSDShadow typeDescription](self, "typeDescription")];
}

- (double)clampOffset:(double)a3
{
  float v3 = a3;
  return roundf(v3);
}

- (unint64_t)shadowType
{
  return 3;
}

- (double)paddingForBlur
{
  return 40.0;
}

- (CGRect)expandedBoundsForRect:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  -[TSDCurvedShadow getVerticalOffset:](self, "getVerticalOffset:", a3.size.width, a3.size.height);
  double v9 = v8;
  [(TSDCurvedShadow *)self paddingForBlur];
  double v11 = -v10;
  CGFloat v12 = x;
  CGFloat v13 = y;
  CGFloat v14 = width;
  CGFloat v15 = height;

  return CGRectInset(*(CGRect *)&v12, v11, -v9);
}

- (CGPoint)boundsShiftForSize:(CGSize)a3
{
  -[TSDCurvedShadow getVerticalOffset:](self, "getVerticalOffset:", a3.width, a3.height);
  double v5 = v4;
  [(TSDCurvedShadow *)self paddingForBlur];
  double v7 = v5;
  result.CGFloat y = v7;
  result.CGFloat x = v6;
  return result;
}

- (double)getVerticalOffset:(CGSize)a3
{
  CGFloat v3 = a3.height * 0.3;
  [(TSDCurvedShadow *)self paddingForBlur];
  return v3 + v4;
}

- (double)offsetFromCurve
{
  [(TSDCurvedShadow *)self curve];
  return v2 * 0.25 * 150.0;
}

- (id)copyWithZone:(_NSZone *)a3
{
  double v4 = +[TSDCurvedShadow allocWithZone:a3];
  [(TSDShadow *)self offset];
  double v6 = v5;
  [(TSDShadow *)self angle];
  double v8 = v7;
  [(TSDShadow *)self radius];
  double v10 = v9;
  [(TSDCurvedShadow *)self curve];
  double v12 = v11;
  [(TSDShadow *)self opacity];
  double v14 = v13;
  CGFloat v15 = [(TSDShadow *)self color];
  BOOL v16 = [(TSDShadow *)self isEnabled];

  return [(TSDCurvedShadow *)v4 initWithOffset:v15 angle:v16 radius:v6 curve:v8 opacity:v10 color:v12 enabled:v14];
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  double v4 = +[TSDMutableCurvedShadow allocWithZone:a3];
  [(TSDShadow *)self offset];
  double v6 = v5;
  [(TSDShadow *)self angle];
  double v8 = v7;
  [(TSDShadow *)self radius];
  double v10 = v9;
  [(TSDCurvedShadow *)self curve];
  double v12 = v11;
  [(TSDShadow *)self opacity];
  double v14 = v13;
  CGFloat v15 = [(TSDShadow *)self color];
  BOOL v16 = [(TSDShadow *)self isEnabled];

  return [(TSDCurvedShadow *)v4 initWithOffset:v15 angle:v16 radius:v6 curve:v8 opacity:v10 color:v12 enabled:v14];
}

- (id)newShadowClampedForSwatches
{
  [(TSDCurvedShadow *)self curve];
  TSUClamp();
  double v4 = v3;
  [(TSDShadow *)self offset];
  TSUClamp();
  double v6 = v5;
  double v7 = [TSDCurvedShadow alloc];
  [(TSDShadow *)self angle];
  double v9 = v8;
  [(TSDShadow *)self radius];
  double v11 = v10;
  [(TSDShadow *)self opacity];
  double v13 = v12;
  double v14 = [(TSDShadow *)self color];
  BOOL v15 = [(TSDShadow *)self isEnabled];

  return [(TSDCurvedShadow *)v7 initWithOffset:v14 angle:v15 radius:v6 curve:v9 opacity:v11 color:v4 enabled:v13];
}

- (BOOL)isEqual:(id)a3
{
  if (a3 == self)
  {
    LOBYTE(v9) = 1;
  }
  else
  {
    uint64_t v15 = v6;
    uint64_t v16 = v5;
    uint64_t v17 = v3;
    uint64_t v18 = v4;
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v14.receiver = self;
      v14.super_class = (Class)TSDCurvedShadow;
      BOOL v9 = [(TSDShadow *)&v14 isEqual:a3];
      if (v9)
      {
        [(TSDCurvedShadow *)self curve];
        double v11 = v10;
        [a3 curve];
        LOBYTE(v9) = v11 == v12;
      }
    }
    else
    {
      LOBYTE(v9) = 0;
    }
  }
  return v9;
}

- (BOOL)showForEditingText
{
  return 0;
}

- (CGRect)shadowBoundsForRect:(CGRect)a3 additionalTransform:(CGAffineTransform *)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  if ([(TSDShadow *)self isEnabled])
  {
    -[TSDCurvedShadow expandedBoundsForRect:](self, "expandedBoundsForRect:", x, y, width, height);
    CGFloat rect = v9;
    CGFloat v11 = v10;
    CGFloat v13 = v12;
    CGFloat v15 = v14;
    [(TSDShadow *)self offsetDelta];
    CGFloat v17 = v16;
    [(TSDShadow *)self offsetDelta];
    CGFloat v19 = v18;
    v25.origin.double x = rect;
    v25.origin.double y = v11;
    v25.size.double width = v13;
    v25.size.double height = v15;
    CGRect v29 = CGRectOffset(v25, v17, v19);
    v26.origin.double x = x;
    v26.origin.double y = y;
    v26.size.double width = width;
    v26.size.double height = height;
    CGRect v27 = CGRectUnion(v26, v29);
    double x = v27.origin.x;
    double y = v27.origin.y;
    double width = v27.size.width;
    double height = v27.size.height;
  }
  double v20 = x;
  double v21 = y;
  double v22 = width;
  double v23 = height;
  result.size.double height = v23;
  result.size.double width = v22;
  result.origin.double y = v21;
  result.origin.double x = v20;
  return result;
}

- (CGRect)boundsInNaturalSpaceForRep:(id)a3
{
  objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "styledLayout"), "geometryInRoot"), "frame");

  -[TSDCurvedShadow expandedBoundsForRect:](self, "expandedBoundsForRect:", 0.0, 0.0);
  result.size.double height = v7;
  result.size.double width = v6;
  result.origin.double y = v5;
  result.origin.double x = v4;
  return result;
}

- (CGRect)boundsForRep:(id)a3
{
  objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "styledLayout"), "geometryInRoot"), "frame");

  -[TSDCurvedShadow expandedBoundsForRect:](self, "expandedBoundsForRect:");
  result.size.double height = v7;
  result.size.double width = v6;
  result.origin.double y = v5;
  result.origin.double x = v4;
  return result;
}

- (CGImage)newShadowImageForRep:(id)a3 withSize:(CGSize)a4 drawSelector:(SEL)a5 unflipped:(BOOL)a6
{
  BOOL v6 = a6;
  double height = a4.height;
  double width = a4.width;
  double v12 = objc_msgSend(MEMORY[0x263F7C808], "colorWithCGColor:", -[TSDShadow color](self, "color"));
  if (!objc_msgSend(+[TSKApplicationDelegate sharedDelegate](TSKApplicationDelegate, "sharedDelegate"), "shouldRenderCurvedShadow")|| (-[TSDShadow opacity](self, "opacity"), v13 == 0.0)|| (objc_msgSend(v12, "alphaComponent"), v14 == 0.0))
  {
LABEL_4:
    return -[TSDShadow i_newEmptyImageWithSize:](self, "i_newEmptyImageWithSize:", width, height);
  }
  [(TSDCurvedShadow *)self boundsForRep:a3];
  double v17 = v16;
  double v19 = v18;
  double v21 = TSDBitmapContextCreate(3, v20);
  if (!v21)
  {
    CGRect v25 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v26 = [NSString stringWithUTF8String:"-[TSDCurvedShadow newShadowImageForRep:withSize:drawSelector:unflipped:]"];
    [v25 handleFailureInFunction:v26, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDCurvedShadow.m"), 235, @"Cannot render curved shadow, the size is too large for the CGContext to render. Returning empty image instead" file lineNumber description];
    goto LABEL_4;
  }
  double v22 = v21;
  double v23 = TSDBitmapContextCreate(11, width);
  CGContextTranslateCTM(v23, -v17, -v19);
  memset(&v39, 0, sizeof(v39));
  v24 = (void *)[a3 styledLayout];
  if (v24) {
    [v24 transformInRoot];
  }
  else {
    memset(&v39, 0, sizeof(v39));
  }
  CGAffineTransform transform = v39;
  CGContextConcatCTM(v23, &transform);
  [a3 performSelector:a5 withObject:v23];
  Image = CGBitmapContextCreateImage(v23);
  if (v6)
  {
    memset(&transform, 0, sizeof(transform));
    v28 = objc_msgSend((id)objc_msgSend(a3, "layout"), "geometry");
    if (v28)
    {
      [v28 transform];
      double a = transform.a;
      double b = transform.b;
      double c = transform.c;
      double d = transform.d;
    }
    else
    {
      double d = 0.0;
      double b = 0.0;
      double c = 0.0;
      double a = 0.0;
      memset(&transform, 0, sizeof(transform));
    }
    if (TSDCrossPoints(a, c, b, d) > 0.0)
    {
      v37.double a = -1.0;
      v37.double b = 0.0;
      v37.double c = 0.0;
      v37.double d = 1.0;
      v37.tdouble x = width;
      v37.tdouble y = 0.0;
      CGContextConcatCTM(v22, &v37);
    }
    v36.double b = 0.0;
    v36.double c = 0.0;
    v36.double a = 1.0;
    *(_OWORD *)&v36.double d = xmmword_2238393D0;
    v36.tdouble y = height;
    CGContextConcatCTM(v22, &v36);
  }
  if (!Image)
  {
    v33 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v34 = [NSString stringWithUTF8String:"-[TSDCurvedShadow newShadowImageForRep:withSize:drawSelector:unflipped:]"];
    objc_msgSend(v33, "handleFailureInFunction:file:lineNumber:description:", v34, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDCurvedShadow.m"), 265, @"invalid nil value for '%s'", "imageWithoutShadow");
  }
  v35 = CGBitmapContextCreateImage(v22);
  CGContextRelease(v22);
  CGContextRelease(v23);
  CGImageRelease(Image);
  return v35;
}

- (int64_t)mixingTypeWithObject:(id)a3
{
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __40__TSDCurvedShadow_mixingTypeWithObject___block_invoke;
  v4[3] = &unk_2646B1758;
  v4[4] = a3;
  v4[5] = self;
  return TSDMixingTypeWithObject((unint64_t)self, (unint64_t)a3, (uint64_t)v4);
}

uint64_t __40__TSDCurvedShadow_mixingTypeWithObject___block_invoke(uint64_t a1)
{
  objc_opt_class();
  uint64_t v2 = TSUDynamicCast();
  if (v2
    && ((uint64_t v3 = (void *)v2, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
     || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)))
  {
    [*(id *)(a1 + 40) curve];
    double v5 = v4;
    [v3 curve];
    if (vabdd_f64(v5, v6) >= 0.00999999978) {
      return 3;
    }
    [*(id *)(a1 + 40) angle];
    double v8 = v7;
    [v3 angle];
    if (vabdd_f64(v8, v9) >= 0.00999999978) {
      return 3;
    }
    [*(id *)(a1 + 40) offset];
    double v11 = v10;
    [v3 offset];
    if (vabdd_f64(v11, v12) >= 0.00999999978)
    {
      return 3;
    }
    else
    {
      [*(id *)(a1 + 40) radius];
      double v14 = v13;
      [v3 radius];
      if (vabdd_f64(v14, v15) >= 0.00999999978) {
        return 3;
      }
      else {
        return 4;
      }
    }
  }
  else
  {
    objc_opt_class();
    uint64_t v17 = TSUDynamicCast();
    if (!v17) {
      return 1;
    }
    double v18 = (void *)v17;
    if [*(id *)(a1 + 40) isEnabled] && (objc_msgSend(v18, "isEnabled")) {
      return 1;
    }
    else {
      return 2;
    }
  }
}

- (id)mixedObjectWithFraction:(double)a3 ofObject:(id)a4
{
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __52__TSDCurvedShadow_mixedObjectWithFraction_ofObject___block_invoke;
  v5[3] = &unk_2646B1780;
  v5[4] = a4;
  v5[5] = self;
  *(double *)&v5[6] = a3;
  return (id)TSDMixingMixedObjectWithFraction(self, a4, (uint64_t)v5);
}

TSDCurvedShadow *__52__TSDCurvedShadow_mixedObjectWithFraction_ofObject___block_invoke(uint64_t a1)
{
  objc_opt_class();
  uint64_t v2 = (void *)TSUDynamicCast();
  [*(id *)(a1 + 40) offset];
  double v4 = v3;
  if (v2)
  {
    [v2 offset];
    TSUMix();
    double v4 = v5;
    [*(id *)(a1 + 40) angle];
    [v2 angle];
    TSUMix();
    double v7 = v6;
    [*(id *)(a1 + 40) radius];
    [v2 radius];
    TSUMix();
    double v9 = v8;
    [*(id *)(a1 + 40) curve];
    [v2 curve];
    TSUMix();
    double v11 = v10;
    [*(id *)(a1 + 40) opacity];
    [v2 opacity];
  }
  else
  {
    [*(id *)(a1 + 40) angle];
    double v7 = v12;
    [*(id *)(a1 + 40) radius];
    double v9 = v13;
    [*(id *)(a1 + 40) curve];
    double v11 = v14;
    [*(id *)(a1 + 40) opacity];
  }
  TSUMix();
  double v16 = v15;
  uint64_t v17 = objc_msgSend(MEMORY[0x263F7C808], "colorWithCGColor:", objc_msgSend(*(id *)(a1 + 40), "color"));
  if (v2) {
    double v18 = v2;
  }
  else {
    double v18 = *(void **)(a1 + 40);
  }
  double v19 = objc_msgSend(v17, "blendedColorWithFraction:ofColor:", objc_msgSend(MEMORY[0x263F7C808], "colorWithCGColor:", objc_msgSend(v18, "color")), *(double *)(a1 + 48));
  if ([*(id *)(a1 + 40) isEnabled]) {
    uint64_t v20 = 1;
  }
  else {
    uint64_t v20 = [v2 isEnabled];
  }
  double v21 = -[TSDCurvedShadow initWithOffset:angle:radius:curve:opacity:color:enabled:]([TSDCurvedShadow alloc], "initWithOffset:angle:radius:curve:opacity:color:enabled:", [v19 CGColor], v20, v4, v7, v9, v11, v16);

  return v21;
}

- (double)curve
{
  return self->mCurve;
}

@end