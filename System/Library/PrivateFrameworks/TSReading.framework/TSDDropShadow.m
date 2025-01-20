@interface TSDDropShadow
- (BOOL)isEqual:(id)a3;
- (CGImage)newShadowImageForRep:(id)a3 withSize:(CGSize)a4 drawSelector:(SEL)a5 unflipped:(BOOL)a6;
- (CGRect)boundsForRep:(id)a3;
- (CGRect)boundsInNaturalSpaceForRep:(id)a3;
- (TSDDropShadow)initWithAngle:(double)a3 offset:(double)a4 radius:(double)a5 opacity:(double)a6 color:(CGColor *)a7 enabled:(BOOL)a8;
- (id)copyWithZone:(_NSZone *)a3;
- (id)mixedObjectWithFraction:(double)a3 ofObject:(id)a4;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (id)newShadowClampedForSwatches;
- (int64_t)mixingTypeWithObject:(id)a3;
- (unint64_t)shadowType;
@end

@implementation TSDDropShadow

- (TSDDropShadow)initWithAngle:(double)a3 offset:(double)a4 radius:(double)a5 opacity:(double)a6 color:(CGColor *)a7 enabled:(BOOL)a8
{
  v16.receiver = self;
  v16.super_class = (Class)TSDDropShadow;
  v11 = [(TSDShadow *)&v16 i_initWithOpacity:a7 color:a8 enabled:a6];
  if (v11)
  {
    TSDNormalizeAngleInDegrees(a3);
    v11->super.mAngle = v12;
    [(TSDShadow *)v11 clampOffset:a4];
    v11->super.mOffset = v13;
    [(TSDShadow *)v11 clampRadius:a5];
    v11->super.mRadius = v14;
  }
  return v11;
}

- (unint64_t)shadowType
{
  return 1;
}

- (BOOL)isEqual:(id)a3
{
  if (a3 == self) {
    return 1;
  }
  uint64_t v9 = v3;
  uint64_t v10 = v4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  v8.receiver = self;
  v8.super_class = (Class)TSDDropShadow;
  return [(TSDShadow *)&v8 isEqual:a3];
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = +[TSDDropShadow allocWithZone:a3];
  [(TSDShadow *)self angle];
  double v6 = v5;
  [(TSDShadow *)self offset];
  double v8 = v7;
  [(TSDShadow *)self radius];
  double v10 = v9;
  [(TSDShadow *)self opacity];
  double v12 = v11;
  double v13 = [(TSDShadow *)self color];
  BOOL v14 = [(TSDShadow *)self isEnabled];

  return [(TSDDropShadow *)v4 initWithAngle:v13 offset:v14 radius:v6 opacity:v8 color:v10 enabled:v12];
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  uint64_t v4 = +[TSDMutableDropShadow allocWithZone:a3];
  [(TSDShadow *)self angle];
  double v6 = v5;
  [(TSDShadow *)self offset];
  double v8 = v7;
  [(TSDShadow *)self radius];
  double v10 = v9;
  [(TSDShadow *)self opacity];
  double v12 = v11;
  double v13 = [(TSDShadow *)self color];
  BOOL v14 = [(TSDShadow *)self isEnabled];

  return [(TSDDropShadow *)v4 initWithAngle:v13 offset:v14 radius:v6 opacity:v8 color:v10 enabled:v12];
}

- (id)newShadowClampedForSwatches
{
  [(TSDShadow *)self radius];
  double v4 = v3;
  [(TSDShadow *)self offset];
  double v6 = v4 + v5;
  [(TSDShadow *)self radius];
  double v8 = v7;
  [(TSDShadow *)self offset];
  double v10 = v9;
  if (v6 > 10.0)
  {
    double v8 = v8 * (10.0 / v6);
    double v10 = v9 * (10.0 / v6);
  }
  double v11 = [TSDDropShadow alloc];
  [(TSDShadow *)self angle];
  double v13 = v12;
  [(TSDShadow *)self opacity];
  double v15 = v14;
  objc_super v16 = [(TSDShadow *)self color];
  BOOL v17 = [(TSDShadow *)self isEnabled];

  return [(TSDDropShadow *)v11 initWithAngle:v16 offset:v17 radius:v13 opacity:v10 color:v8 enabled:v15];
}

- (CGRect)boundsInNaturalSpaceForRep:(id)a3
{
  double v3 = (void *)[a3 styledLayout];

  [v3 shadowedNaturalBoundsWithoutOffset];
  result.size.height = v7;
  result.size.width = v6;
  result.origin.y = v5;
  result.origin.x = v4;
  return result;
}

- (CGRect)boundsForRep:(id)a3
{
  double v3 = (void *)[a3 styledLayout];

  [v3 shadowedNaturalBoundsWithoutOffset];
  result.size.height = v7;
  result.size.width = v6;
  result.origin.y = v5;
  result.origin.x = v4;
  return result;
}

- (CGImage)newShadowImageForRep:(id)a3 withSize:(CGSize)a4 drawSelector:(SEL)a5 unflipped:(BOOL)a6
{
  BOOL v6 = a6;
  double v10 = TSDRoundedSize();
  double v12 = v11;
  double v13 = TSDRectWithSize();
  double v17 = TSDRoundedRect(v13, v14, v15, v16);
  Image = 0;
  if (v19 != 0.0 && v20 != 0.0)
  {
    double v22 = v17;
    double v23 = v19;
    unint64_t v24 = vcvtpd_u64_f64(fmax(v10, v19));
    unint64_t v25 = vcvtpd_u64_f64(fmax(v12, v20));
    if (v24) {
      BOOL v26 = v25 == 0;
    }
    else {
      BOOL v26 = 1;
    }
    if (v26) {
      return 0;
    }
    double v27 = v18;
    v28 = [(TSDShadow *)self color];
    v29 = TSDBitmapContextCreate(11, v23);
    if (!v29)
    {
      return 0;
    }
    else
    {
      v30 = v29;
      v31 = (void *)[a3 layout];
      if (v31) {
        [v31 transformInRoot];
      }
      else {
        memset(v63, 0, sizeof(v63));
      }
      double v32 = TSDTransformAngle((double *)v63);
      TSDSetCGContextInfoForShadowContext((uint64_t)v30, v32);
      [(TSDShadow *)self radius];
      CGFloat v34 = v33;
      CGContextTranslateCTM(v30, -v22, -v27);
      CGContextTranslateCTM(v30, -(float)((float)v24 + 10.0), -0.0);
      if (v6)
      {
        long long v61 = 0u;
        long long v62 = 0u;
        long long v60 = 0u;
        v35 = objc_msgSend((id)objc_msgSend(a3, "layout"), "geometry");
        if (v35)
        {
          [v35 transform];
          double v37 = *((double *)&v60 + 1);
          double v36 = *(double *)&v60;
          double v39 = *((double *)&v61 + 1);
          double v38 = *(double *)&v61;
        }
        else
        {
          long long v61 = 0u;
          long long v62 = 0u;
          double v39 = 0.0;
          double v37 = 0.0;
          double v38 = 0.0;
          double v36 = 0.0;
          long long v60 = 0u;
        }
        if (TSDCrossPoints(v36, v38, v37, v39) > 0.0)
        {
          transform.a = -1.0;
          transform.b = 0.0;
          transform.c = 0.0;
          transform.d = 1.0;
          transform.tx = v10;
          transform.ty = 0.0;
          CGContextConcatCTM(v30, &transform);
        }
        v58.b = 0.0;
        v58.c = 0.0;
        v58.a = 1.0;
        *(_OWORD *)&v58.d = xmmword_2238393D0;
        v58.ty = v12;
        CGContextConcatCTM(v30, &v58);
      }
      v64.height = 0.0;
      v64.width = (float)((float)v24 + 10.0);
      CGContextSetShadowWithColor(v30, v64, v34, v28);
      CGContextTranslateCTM(v30, v34, v34);
      if ([a3 canDrawShadowInOneStepWithChildren:1])
      {
        [a3 performSelector:a5 withObject:v30];
      }
      else
      {
        [a3 naturalBounds];
        double v41 = v40;
        double v43 = v42;
        TSDRectWithSize();
        double v45 = v44;
        double v47 = v46;
        double v48 = TSDShrinkSizeToFitInSize(v41, v43, 2048.0, 2048.0);
        if (v48 > 0.0 && v49 > 0.0)
        {
          double v50 = v48 / v45;
          double v51 = v49 / v47;
          v52 = CGLayerCreateWithContext(v30, *(CGSize *)&v48, 0);
          Context = CGLayerGetContext(v52);
          v54 = (void *)[a3 layout];
          if (v54) {
            [v54 transformInRoot];
          }
          else {
            memset(v57, 0, sizeof(v57));
          }
          double v55 = TSDTransformAngle((double *)v57);
          TSDSetCGContextInfoForShadowContext((uint64_t)Context, v55);
          CGContextScaleCTM(Context, v50, v51);
          [a3 performSelector:a5 withObject:Context];
          TSDClearCGContextInfo((uint64_t)Context);
          v65.origin.x = TSDRectWithSize();
          CGContextDrawLayerInRect(v30, v65, v52);
          CGLayerRelease(v52);
        }
      }
      Image = CGBitmapContextCreateImage(v30);
      TSDClearCGContextInfo((uint64_t)v30);
      CGContextRelease(v30);
    }
  }
  return Image;
}

- (int64_t)mixingTypeWithObject:(id)a3
{
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __38__TSDDropShadow_mixingTypeWithObject___block_invoke;
  v4[3] = &unk_2646B1758;
  v4[4] = a3;
  v4[5] = self;
  return TSDMixingTypeWithObject((unint64_t)self, (unint64_t)a3, (uint64_t)v4);
}

uint64_t __38__TSDDropShadow_mixingTypeWithObject___block_invoke(uint64_t a1)
{
  objc_opt_class();
  uint64_t v2 = TSUDynamicCast();
  if (v2
    && ((double v3 = (void *)v2, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
     || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)))
  {
    [*(id *)(a1 + 40) radius];
    double v5 = v4;
    [v3 radius];
    if (vabdd_f64(v5, v6) >= 0.00999999978) {
      return 3;
    }
    else {
      return 4;
    }
  }
  else
  {
    objc_opt_class();
    uint64_t v8 = TSUDynamicCast();
    if (!v8) {
      return 1;
    }
    double v9 = (void *)v8;
    if [*(id *)(a1 + 40) isEnabled] && (objc_msgSend(v9, "isEnabled")) {
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
  v5[2] = __50__TSDDropShadow_mixedObjectWithFraction_ofObject___block_invoke;
  v5[3] = &unk_2646B1780;
  v5[4] = a4;
  v5[5] = self;
  *(double *)&v5[6] = a3;
  return (id)TSDMixingMixedObjectWithFraction(self, a4, (uint64_t)v5);
}

TSDDropShadow *__50__TSDDropShadow_mixedObjectWithFraction_ofObject___block_invoke(uint64_t a1)
{
  objc_opt_class();
  uint64_t v2 = (void *)TSUDynamicCast();
  [*(id *)(a1 + 40) angle];
  long double v4 = v3;
  if (v2)
  {
    [v2 angle];
    TSDMixAnglesInDegrees(v4, v5, *(double *)(a1 + 48));
    long double v4 = v6;
    [*(id *)(a1 + 40) offset];
    [v2 offset];
    TSUMix();
    double v8 = v7;
    [*(id *)(a1 + 40) radius];
    [v2 radius];
    TSUMix();
    double v10 = round(v9);
    [*(id *)(a1 + 40) opacity];
    [v2 opacity];
  }
  else
  {
    [*(id *)(a1 + 40) offset];
    double v8 = v11;
    [*(id *)(a1 + 40) radius];
    double v10 = v12;
    [*(id *)(a1 + 40) opacity];
  }
  TSUMix();
  double v14 = v13;
  CGFloat v15 = objc_msgSend(MEMORY[0x263F7C808], "colorWithCGColor:", objc_msgSend(*(id *)(a1 + 40), "color"));
  if (v2) {
    CGFloat v16 = v2;
  }
  else {
    CGFloat v16 = *(void **)(a1 + 40);
  }
  double v17 = objc_msgSend(v15, "blendedColorWithFraction:ofColor:", objc_msgSend(MEMORY[0x263F7C808], "colorWithCGColor:", objc_msgSend(v16, "color")), *(double *)(a1 + 48));
  if ([*(id *)(a1 + 40) isEnabled]) {
    uint64_t v18 = 1;
  }
  else {
    uint64_t v18 = [v2 isEnabled];
  }
  double v19 = -[TSDDropShadow initWithAngle:offset:radius:opacity:color:enabled:]([TSDDropShadow alloc], "initWithAngle:offset:radius:opacity:color:enabled:", [v17 CGColor], v18, (double)v4, v8, v10, v14);

  return v19;
}

@end