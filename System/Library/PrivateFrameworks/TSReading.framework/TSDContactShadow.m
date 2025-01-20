@interface TSDContactShadow
+ (id)contactShadowWithOffset:(double)a3 height:(double)a4 radius:(double)a5 opacity:(double)a6 color:(CGColor *)a7 enabled:(BOOL)a8;
- (BOOL)isEqual:(id)a3;
- (CGImage)newShadowImageForRep:(id)a3 withSize:(CGSize)a4 drawSelector:(SEL)a5 unflipped:(BOOL)a6;
- (CGImage)newShadowImageFromContext:(CGContext *)a3 withSize:(CGSize)a4 bounds:(CGRect)a5 unflipped:(BOOL)a6;
- (CGRect)boundsForRep:(id)a3;
- (CGRect)boundsInNaturalSpaceForRep:(id)a3;
- (CGRect)shadowBoundsForRect:(CGRect)a3 additionalTransform:(CGAffineTransform *)a4;
- (TSDContactShadow)initWithOffset:(double)a3 height:(double)a4 radius:(double)a5 opacity:(double)a6 color:(CGColor *)a7 enabled:(BOOL)a8;
- (double)clampOffset:(double)a3;
- (double)clampRadius:(double)a3;
- (double)height;
- (double)perspective;
- (id)copyWithZone:(_NSZone *)a3;
- (id)mixedObjectWithFraction:(double)a3 ofObject:(id)a4;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (id)newShadowClampedForSwatches;
- (int64_t)mixingTypeWithObject:(id)a3;
- (unint64_t)shadowType;
@end

@implementation TSDContactShadow

+ (id)contactShadowWithOffset:(double)a3 height:(double)a4 radius:(double)a5 opacity:(double)a6 color:(CGColor *)a7 enabled:(BOOL)a8
{
  v8 = (void *)[objc_alloc((Class)a1) initWithOffset:a7 height:a8 radius:a3 opacity:a4 color:a5 enabled:a6];
  return v8;
}

- (TSDContactShadow)initWithOffset:(double)a3 height:(double)a4 radius:(double)a5 opacity:(double)a6 color:(CGColor *)a7 enabled:(BOOL)a8
{
  BOOL v8 = a8;
  if (!a7)
  {
    v15 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v16 = [NSString stringWithUTF8String:"-[TSDContactShadow initWithOffset:height:radius:opacity:color:enabled:]"];
    objc_msgSend(v15, "handleFailureInFunction:file:lineNumber:description:", v16, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDContactShadow.m"), 47, @"invalid nil value for '%s'", "color");
  }
  v18.receiver = self;
  v18.super_class = (Class)TSDContactShadow;
  result = [(TSDShadow *)&v18 i_initWithOpacity:a7 color:v8 enabled:a6];
  if (result)
  {
    result->super.mAngle = 0.0;
    result->mHeight = a4;
    result->super.mRadius = a5;
    result->super.mOffset = a3;
  }
  return result;
}

- (unint64_t)shadowType
{
  return 2;
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
      v14.super_class = (Class)TSDContactShadow;
      BOOL v9 = [(TSDShadow *)&v14 isEqual:a3];
      if (v9)
      {
        [(TSDContactShadow *)self height];
        double v11 = v10;
        [a3 height];
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

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = +[TSDContactShadow allocWithZone:a3];
  [(TSDShadow *)self offset];
  double v6 = v5;
  [(TSDContactShadow *)self height];
  double v8 = v7;
  [(TSDShadow *)self radius];
  double v10 = v9;
  [(TSDShadow *)self opacity];
  double v12 = v11;
  v13 = [(TSDShadow *)self color];
  BOOL v14 = [(TSDShadow *)self isEnabled];
  return [(TSDContactShadow *)v4 initWithOffset:v13 height:v14 radius:v6 opacity:v8 color:v10 enabled:v12];
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  uint64_t v4 = +[TSDMutableContactShadow allocWithZone:a3];
  [(TSDShadow *)self offset];
  double v6 = v5;
  [(TSDContactShadow *)self height];
  double v8 = v7;
  [(TSDShadow *)self radius];
  double v10 = v9;
  [(TSDShadow *)self opacity];
  double v12 = v11;
  v13 = [(TSDShadow *)self color];
  BOOL v14 = [(TSDShadow *)self isEnabled];
  return [(TSDContactShadow *)v4 initWithOffset:v13 height:v14 radius:v6 opacity:v8 color:v10 enabled:v12];
}

- (id)newShadowClampedForSwatches
{
  [(TSDShadow *)self offset];
  TSUClamp();
  double v4 = v3;
  [(TSDShadow *)self radius];
  TSUClamp();
  double v6 = v5;
  [(TSDContactShadow *)self height];
  TSUClamp();
  double v8 = v7;
  double v9 = [TSDContactShadow alloc];
  [(TSDShadow *)self opacity];
  double v11 = v10;
  double v12 = [(TSDShadow *)self color];
  BOOL v13 = [(TSDShadow *)self isEnabled];
  return [(TSDContactShadow *)v9 initWithOffset:v12 height:v13 radius:v4 opacity:v8 color:v6 enabled:v11];
}

- (double)perspective
{
  return asin(self->mHeight) / 3.14159265 * 180.0;
}

- (double)clampRadius:(double)a3
{
  TSUClamp();
  return result;
}

- (double)clampOffset:(double)a3
{
  float v3 = a3;
  return roundf(v3);
}

- (CGRect)shadowBoundsForRect:(CGRect)a3 additionalTransform:(CGAffineTransform *)a4
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  if ([(TSDShadow *)self isEnabled])
  {
    long long v10 = *(_OWORD *)&a4->c;
    *(_OWORD *)&v34.a = *(_OWORD *)&a4->a;
    *(_OWORD *)&v34.c = v10;
    *(_OWORD *)&v34.tCGFloat x = *(_OWORD *)&a4->tx;
    CGAffineTransformInvert(&v35, &v34);
    v36.origin.CGFloat x = x;
    v36.origin.CGFloat y = y;
    v36.size.CGFloat width = width;
    v36.size.CGFloat height = height;
    CGRect v37 = CGRectApplyAffineTransform(v36, &v35);
    CGFloat v11 = v37.origin.x;
    CGFloat v12 = v37.origin.y;
    CGFloat v13 = v37.size.width;
    CGFloat v14 = v37.size.height;
    CGFloat v33 = height;
    double MidX = CGRectGetMidX(v37);
    v38.origin.CGFloat x = v11;
    v38.origin.CGFloat y = v12;
    v38.size.CGFloat width = v13;
    v38.size.CGFloat height = v14;
    CGFloat v32 = width;
    double MaxY = CGRectGetMaxY(v38);
    v39.origin.CGFloat x = v11;
    v39.origin.CGFloat y = v12;
    v39.size.CGFloat width = v13;
    v39.size.CGFloat height = v14;
    double v17 = CGRectGetWidth(v39);
    double v18 = TSDRectWithCenterAndSize(MidX, MaxY, v17);
    CGFloat v20 = v19;
    CGFloat v22 = v21;
    CGFloat v24 = v23;
    [(TSDShadow *)self offset];
    CGFloat v26 = v25;
    v40.origin.CGFloat x = v18;
    v40.origin.CGFloat y = v20;
    v40.size.CGFloat width = v22;
    v40.size.CGFloat height = v24;
    CGRect v41 = CGRectOffset(v40, 0.0, v26);
    CGRect v42 = CGRectInset(v41, -120.0, 0.0);
    long long v27 = *(_OWORD *)&a4->c;
    *(_OWORD *)&v34.a = *(_OWORD *)&a4->a;
    *(_OWORD *)&v34.c = v27;
    *(_OWORD *)&v34.tCGFloat x = *(_OWORD *)&a4->tx;
    CGRect v46 = CGRectApplyAffineTransform(v42, &v34);
    v43.origin.CGFloat x = x;
    v43.origin.CGFloat y = y;
    v43.size.CGFloat width = v32;
    v43.size.CGFloat height = v33;
    CGRect v44 = CGRectUnion(v43, v46);
    CGFloat x = v44.origin.x;
    CGFloat y = v44.origin.y;
    CGFloat width = v44.size.width;
    CGFloat height = v44.size.height;
  }
  double v28 = x;
  double v29 = y;
  double v30 = width;
  double v31 = height;
  result.size.CGFloat height = v31;
  result.size.CGFloat width = v30;
  result.origin.CGFloat y = v29;
  result.origin.CGFloat x = v28;
  return result;
}

- (CGRect)boundsInNaturalSpaceForRep:(id)a3
{
  objc_msgSend((id)objc_msgSend(a3, "styledLayout"), "alignmentFrameInRoot");
  v5.origin.CGFloat x = 0.0;
  v5.origin.CGFloat y = 0.0;
  CGRect result = CGRectInset(v5, -120.0, 0.0);
  double v3 = result.size.height + -75.0;
  double v4 = 150.0;
  result.size.CGFloat height = v4;
  result.origin.CGFloat y = v3;
  return result;
}

- (CGRect)boundsForRep:(id)a3
{
  objc_msgSend((id)objc_msgSend(a3, "styledLayout"), "alignmentFrameInRoot");
  CGRect result = CGRectInset(v5, -120.0, 0.0);
  double v3 = result.origin.y + result.size.height + -75.0;
  double v4 = 150.0;
  result.size.CGFloat height = v4;
  result.origin.CGFloat y = v3;
  return result;
}

- (CGImage)newShadowImageForRep:(id)a3 withSize:(CGSize)a4 drawSelector:(SEL)a5 unflipped:(BOOL)a6
{
  BOOL v6 = a6;
  double height = a4.height;
  double width = a4.width;
  -[TSDContactShadow boundsForRep:](self, "boundsForRep:");
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;
  double v19 = v18;
  if (objc_msgSend(+[TSKApplicationDelegate sharedDelegate](TSKApplicationDelegate, "sharedDelegate"), "shouldRenderContactShadow"))
  {
    CGFloat v20 = TSDBitmapContextCreate(3, v17);
    CGContextTranslateCTM(v20, -v13, -v15);
    CGContextTranslateCTM(v20, 0.0, v19 * 0.5);
    memset(&v25, 0, sizeof(v25));
    double v21 = (void *)[a3 styledLayout];
    if (v21) {
      [v21 transformInRoot];
    }
    else {
      memset(&v25, 0, sizeof(v25));
    }
    CGAffineTransform v24 = v25;
    CGContextConcatCTM(v20, &v24);
    [a3 performSelector:a5 withObject:v20];
    double v23 = -[TSDContactShadow newShadowImageFromContext:withSize:bounds:unflipped:](self, "newShadowImageFromContext:withSize:bounds:unflipped:", v20, v6, width, height, v13, v15, v17, v19);
    CGContextRelease(v20);
    return v23;
  }
  else
  {
    return -[TSDShadow i_newEmptyImageWithSize:](self, "i_newEmptyImageWithSize:", v17, 150.0);
  }
}

- (CGImage)newShadowImageFromContext:(CGContext *)a3 withSize:(CGSize)a4 bounds:(CGRect)a5 unflipped:(BOOL)a6
{
  double width = a5.size.width;
  double height = a4.height;
  double v7 = a4.width;
  v66[4] = *(double *)MEMORY[0x263EF8340];
  double v10 = a5.size.height * 0.5;
  [(TSDShadow *)self radius];
  double v12 = v11;
  [(TSDShadow *)self radius];
  double v14 = v13;
  [(TSDContactShadow *)self height];
  CGFloat v16 = v15;
  image = CGBitmapContextCreateImage(a3);
  uint64_t v17 = objc_msgSend(MEMORY[0x263F00650], "imageWithCGImage:");
  objc_msgSend((id)objc_msgSend(MEMORY[0x263F7C808], "colorWithCGColor:", -[TSDShadow color](self, "color")), "getRGBAComponents:", v66);
  double v18 = (void *)[MEMORY[0x263F00640] filterWithName:@"CIAffineTransform"];
  uint64_t v19 = *MEMORY[0x263F00968];
  [v18 setValue:v17 forKey:*MEMORY[0x263F00968]];
  [(TSDShadow *)self offset];
  TSUClamp();
  memset(&v65, 0, sizeof(v65));
  CGAffineTransformMakeTranslation(&v65, 0.0, -v20 - height * 0.5);
  CGAffineTransform v64 = v65;
  objc_msgSend(v18, "setValue:forKey:", objc_msgSend(MEMORY[0x263F08D40], "valueWithCGAffineTransform:", &v64), @"inputTransform");
  double v21 = (void *)[MEMORY[0x263F00640] filterWithName:@"CIColorMatrix"];
  uint64_t v22 = *MEMORY[0x263F009D0];
  objc_msgSend(v21, "setValue:forKey:", objc_msgSend(v18, "valueForKey:", *MEMORY[0x263F009D0]), v19);
  objc_msgSend(v21, "setValue:forKey:", objc_msgSend(MEMORY[0x263F00680], "vectorWithX:Y:Z:W:", 0.0, 0.0, 0.0, 0.0), @"inputRVector");
  objc_msgSend(v21, "setValue:forKey:", objc_msgSend(MEMORY[0x263F00680], "vectorWithX:Y:Z:W:", 0.0, 0.0, 0.0, 0.0), @"inputGVector");
  objc_msgSend(v21, "setValue:forKey:", objc_msgSend(MEMORY[0x263F00680], "vectorWithX:Y:Z:W:", 0.0, 0.0, 0.0, 0.0), @"inputBVector");
  double v23 = (void *)MEMORY[0x263F00680];
  double v24 = v66[3];
  [(TSDShadow *)self opacity];
  objc_msgSend(v21, "setValue:forKey:", objc_msgSend(v23, "vectorWithX:Y:Z:W:", 0.0, 0.0, 0.0, v24 * v25), @"inputAVector");
  objc_msgSend(v21, "setValue:forKey:", objc_msgSend(MEMORY[0x263F00680], "vectorWithX:Y:Z:W:", v66[0], v66[1], v66[2], 0.0), @"inputBiasVector");
  CGFloat v26 = (void *)[MEMORY[0x263F00640] filterWithName:@"CICrop"];
  objc_msgSend(v26, "setValue:forKey:", objc_msgSend(v21, "valueForKey:", v22), v19);
  objc_msgSend(v26, "setValue:forKey:", objc_msgSend(MEMORY[0x263F00680], "vectorWithX:Y:Z:W:", 0.0, v10 + -20.0, v7, 20.0), @"inputRectangle");
  long long v27 = (void *)[MEMORY[0x263F00640] filterWithName:@"CICrop"];
  objc_msgSend(v27, "setValue:forKey:", objc_msgSend(v21, "valueForKey:", v22), v19);
  objc_msgSend(v27, "setValue:forKey:", objc_msgSend(MEMORY[0x263F00680], "vectorWithX:Y:Z:W:", 0.0, v10 + -70.0, v7, 70.0), @"inputRectangle");
  double v28 = (void *)[v26 valueForKey:v22];
  [v28 extent];
  if (v29 <= 1.0)
  {
    uint64_t v32 = objc_msgSend(MEMORY[0x263F00650], "imageWithColor:", objc_msgSend(MEMORY[0x263F00608], "colorWithRed:green:blue:alpha:", 0.0, 0.0, 0.0, 0.0));
  }
  else
  {
    double v30 = (void *)[MEMORY[0x263F00640] filterWithName:@"CIGaussianBlur"];
    [v30 setValue:v28 forKey:v19];
    *(float *)&double v31 = fmin(v12 / 3.0, 55.0);
    objc_msgSend(v30, "setValue:forKey:", objc_msgSend(NSNumber, "numberWithFloat:", v31), @"inputRadius");
    uint64_t v32 = [v30 valueForKey:v22];
  }
  uint64_t v33 = v32;
  CGAffineTransform v34 = (void *)[v27 valueForKey:v22];
  [v34 extent];
  if (v35 <= 1.0)
  {
    uint64_t v38 = objc_msgSend(MEMORY[0x263F00650], "imageWithColor:", objc_msgSend(MEMORY[0x263F00608], "colorWithRed:green:blue:alpha:", 0.0, 0.0, 0.0, 0.0));
  }
  else
  {
    CGRect v36 = (void *)[MEMORY[0x263F00640] filterWithName:@"CIGaussianBlur"];
    [v36 setValue:v34 forKey:v19];
    *(float *)&double v37 = fmin(v14, 55.0);
    objc_msgSend(v36, "setValue:forKey:", objc_msgSend(NSNumber, "numberWithFloat:", v37), @"inputRadius");
    uint64_t v38 = [v36 valueForKey:v22];
  }
  uint64_t v39 = v38;
  memset(&v64, 0, sizeof(v64));
  CGAffineTransformMakeTranslation(&v64, 0.0, v10);
  CGAffineTransform v62 = v64;
  CGAffineTransformScale(&v63, &v62, 1.0, v16);
  CGAffineTransform v64 = v63;
  CGAffineTransform v62 = v63;
  CGAffineTransformTranslate(&v63, &v62, 0.0, 10.0 - v10);
  CGAffineTransform v64 = v63;
  CGRect v40 = (void *)[MEMORY[0x263F00640] filterWithName:@"CIAffineTransform"];
  [v40 setValue:v33 forKey:v19];
  CGAffineTransform v63 = v64;
  objc_msgSend(v40, "setValue:forKey:", objc_msgSend(MEMORY[0x263F08D40], "valueWithCGAffineTransform:", &v63), @"inputTransform");
  memset(&v63, 0, sizeof(v63));
  CGAffineTransformMakeTranslation(&v63, 0.0, v10);
  CGAffineTransform v61 = v63;
  CGAffineTransformScale(&v62, &v61, 1.0, v16);
  CGAffineTransform v63 = v62;
  CGAffineTransform v61 = v62;
  CGAffineTransformTranslate(&v62, &v61, 0.0, 35.0 - v10);
  CGAffineTransform v63 = v62;
  CGRect v41 = (void *)[MEMORY[0x263F00640] filterWithName:@"CIAffineTransform"];
  [v41 setValue:v39 forKey:v19];
  CGAffineTransform v62 = v63;
  objc_msgSend(v41, "setValue:forKey:", objc_msgSend(MEMORY[0x263F08D40], "valueWithCGAffineTransform:", &v62), @"inputTransform");
  CGRect v42 = (void *)[MEMORY[0x263F00640] filterWithName:@"CIColorMatrix"];
  [v42 setDefaults];
  objc_msgSend(v42, "setValue:forKey:", objc_msgSend(v41, "valueForKey:", v22), v19);
  objc_msgSend(v42, "setValue:forKey:", objc_msgSend(MEMORY[0x263F00680], "vectorWithX:Y:Z:W:", 0.0, 0.0, 0.0, 0.5), @"inputAVector");
  CGRect v43 = (void *)[MEMORY[0x263F00640] filterWithName:@"CISourceOverCompositing"];
  objc_msgSend(v43, "setValue:forKey:", objc_msgSend(v40, "valueForKey:", v22), v19);
  objc_msgSend(v43, "setValue:forKey:", objc_msgSend(v42, "valueForKey:", v22), @"inputBackgroundImage");
  uint64_t v44 = [v43 valueForKey:v22];
  v45 = (void *)[MEMORY[0x263F00640] filterWithName:@"CIAffineClamp"];
  long long v46 = *(_OWORD *)(MEMORY[0x263F000D0] + 16);
  *(_OWORD *)&v62.a = *MEMORY[0x263F000D0];
  *(_OWORD *)&v62.c = v46;
  *(_OWORD *)&v62.tCGFloat x = *(_OWORD *)(MEMORY[0x263F000D0] + 32);
  objc_msgSend(v45, "setValue:forKey:", objc_msgSend(MEMORY[0x263F08D40], "valueWithCGAffineTransform:", &v62), @"inputTransform");
  [v45 setValue:v44 forKey:v19];
  uint64_t v47 = objc_msgSend((id)objc_msgSend(v45, "valueForKey:", v22), "imageByCroppingToRect:", 0.0, 0.0, v7, height);
  memset(&v62, 0, sizeof(v62));
  CGAffineTransformMakeScale(&v62, 1.0, -1.0);
  CGAffineTransform v60 = v62;
  CGAffineTransformTranslate(&v61, &v60, 0.0, height);
  CGAffineTransform v62 = v61;
  v48 = (void *)[MEMORY[0x263F00640] filterWithName:@"CIAffineTransform"];
  [v48 setValue:v47 forKey:v19];
  CGAffineTransform v61 = v62;
  objc_msgSend(v48, "setValue:forKey:", objc_msgSend(MEMORY[0x263F08D40], "valueWithCGAffineTransform:", &v61), @"inputTransform");
  v49 = (void *)[MEMORY[0x263F00628] contextWithOptions:0];
  [v49 outputImageMaximumSize];
  if (v7 >= v51 || height >= v50)
  {
    v54 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v55 = [NSString stringWithUTF8String:"-[TSDContactShadow newShadowImageFromContext:withSize:bounds:unflipped:]"];
    [v54 handleFailureInFunction:v55, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDContactShadow.m"), 383, @"Cannot render contact shadow, the size is too large for the CIContext to render. Returning empty image instead" file lineNumber description];
    v53 = -[TSDShadow i_newEmptyImageWithSize:](self, "i_newEmptyImageWithSize:", width, 150.0);
  }
  else
  {
    v52 = (void *)[v48 valueForKey:v22];
    [v52 extent];
    v53 = (CGImage *)objc_msgSend(v49, "createCGImage:fromRect:", v52);
  }
  v56 = v53;
  CGImageRelease(image);
  return v56;
}

- (int64_t)mixingTypeWithObject:(id)a3
{
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __41__TSDContactShadow_mixingTypeWithObject___block_invoke;
  v4[3] = &unk_2646B1758;
  v4[4] = a3;
  v4[5] = self;
  return TSDMixingTypeWithObject((unint64_t)self, (unint64_t)a3, (uint64_t)v4);
}

uint64_t __41__TSDContactShadow_mixingTypeWithObject___block_invoke(uint64_t a1)
{
  objc_opt_class();
  uint64_t v2 = TSUDynamicCast();
  if (v2
    && ((double v3 = (void *)v2, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
     || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)))
  {
    [*(id *)(a1 + 40) height];
    double v5 = v4;
    [v3 height];
    if (vabdd_f64(v5, v6) >= 0.00999999978) {
      return 3;
    }
    [*(id *)(a1 + 40) perspective];
    double v8 = v7;
    [v3 perspective];
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
  v5[2] = __53__TSDContactShadow_mixedObjectWithFraction_ofObject___block_invoke;
  v5[3] = &unk_2646B1780;
  v5[4] = a4;
  v5[5] = self;
  *(double *)&v5[6] = a3;
  return (id)TSDMixingMixedObjectWithFraction(self, a4, (uint64_t)v5);
}

TSDContactShadow *__53__TSDContactShadow_mixedObjectWithFraction_ofObject___block_invoke(uint64_t a1)
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
    [*(id *)(a1 + 40) height];
    [v2 height];
    TSUMix();
    double v7 = v6;
    [*(id *)(a1 + 40) radius];
    [v2 radius];
    TSUMix();
    double v9 = v8;
    [*(id *)(a1 + 40) opacity];
    [v2 opacity];
  }
  else
  {
    [*(id *)(a1 + 40) height];
    double v7 = v10;
    [*(id *)(a1 + 40) radius];
    double v9 = v11;
    [*(id *)(a1 + 40) opacity];
  }
  TSUMix();
  double v13 = v12;
  double v14 = objc_msgSend(MEMORY[0x263F7C808], "colorWithCGColor:", objc_msgSend(*(id *)(a1 + 40), "color"));
  if (v2) {
    double v15 = v2;
  }
  else {
    double v15 = *(void **)(a1 + 40);
  }
  CGFloat v16 = objc_msgSend(v14, "blendedColorWithFraction:ofColor:", objc_msgSend(MEMORY[0x263F7C808], "colorWithCGColor:", objc_msgSend(v15, "color")), *(double *)(a1 + 48));
  if ([*(id *)(a1 + 40) isEnabled]) {
    uint64_t v17 = 1;
  }
  else {
    uint64_t v17 = [v2 isEnabled];
  }
  double v18 = -[TSDContactShadow initWithOffset:height:radius:opacity:color:enabled:]([TSDContactShadow alloc], "initWithOffset:height:radius:opacity:color:enabled:", [v16 CGColor], v17, v4, v7, v9, v13);
  return v18;
}

- (double)height
{
  return self->mHeight;
}

@end