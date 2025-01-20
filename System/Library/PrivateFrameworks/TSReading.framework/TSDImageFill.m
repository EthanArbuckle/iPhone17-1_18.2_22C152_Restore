@interface TSDImageFill
+ (id)presetKinds;
- (BOOL)canApplyToCALayer;
- (BOOL)canApplyToCALayerByAddingSublayers;
- (BOOL)drawsInOneStep;
- (BOOL)interpretsUntaggedImageDataAsGeneric;
- (BOOL)isEqual:(id)a3;
- (BOOL)isOpaque;
- (BOOL)p_shouldApplyTintedImage;
- (BOOL)shouldBeReappliedToCALayer:(id)a3;
- (CGImage)p_newHalfSizeImage;
- (CGImage)p_newQuarterSizeImage;
- (CGImage)p_newStandardSizeImage;
- (CGImage)p_newTintedImageWithScale:(double)a3;
- (CGRect)p_drawnRectForImageSize:(CGSize)a3 destRect:(CGRect)a4 inContext:(CGContext *)a5;
- (CGSize)fillSize;
- (CGSize)p_sizeOfFillImageForDestRect:(CGRect)a3 inContext:(CGContext *)a4;
- (CGSize)renderedImageSizeForObjectSize:(CGSize)a3;
- (NSString)presetKind;
- (SEL)mapThemeAssetSelector;
- (TSDImageFill)initWithGenericImageData:(id)a3 technique:(int)a4 tintColor:(id)a5 size:(CGSize)a6 originalImageData:(id)a7;
- (TSDImageFill)initWithImageData:(id)a3 technique:(int)a4 tintColor:(id)a5 size:(CGSize)a6 originalImageData:(id)a7;
- (TSPData)imageData;
- (TSPData)originalImageData;
- (TSUColor)tintColor;
- (double)scale;
- (id)imageDataAtFillSize;
- (id)mixedObjectWithFraction:(double)a3 ofObject:(id)a4;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (id)p_cachedImageForSize:(CGSize)a3 inContext:(CGContext *)a4 orLayer:(id)a5;
- (id)p_halfSizeCachedImage;
- (id)p_quarterSizeCachedImage;
- (id)p_standardSizeCachedImage;
- (id)p_validatedImageProvider;
- (id)referenceColor;
- (int)fillType;
- (int)technique;
- (int64_t)mixingTypeWithObject:(id)a3;
- (unint64_t)hash;
- (void)addBitmapsToRenderingQualityInfo:(id)a3 forShapeRep:(id)a4 inContext:(CGContext *)a5;
- (void)applyToCALayer:(id)a3 withScale:(double)a4;
- (void)dealloc;
- (void)drawSwatchInRect:(CGRect)a3 inContext:(CGContext *)a4;
- (void)p_drawBitmapImage:(CGImage *)a3 withOrientation:(int64_t)a4 inContext:(CGContext *)a5 bounds:(CGRect)a6;
- (void)p_drawPDFWithProvider:(id)a3 inContext:(CGContext *)a4 bounds:(CGRect)a5;
- (void)p_paintPath:(CGPath *)a3 inContext:(CGContext *)a4;
- (void)p_setFillSizeForApplicationData;
- (void)paintPath:(CGPath *)a3 inContext:(CGContext *)a4;
- (void)paintPath:(CGPath *)a3 naturalBounds:(CGRect)a4 inContext:(CGContext *)a5 isPDF:(BOOL)a6;
- (void)setTechnique:(int)a3;
@end

@implementation TSDImageFill

- (TSDImageFill)initWithImageData:(id)a3 technique:(int)a4 tintColor:(id)a5 size:(CGSize)a6 originalImageData:(id)a7
{
  CGFloat height = a6.height;
  CGFloat width = a6.width;
  if (a4 >= 5)
  {
    v14 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v15 = [NSString stringWithUTF8String:"-[TSDImageFill initWithImageData:technique:tintColor:size:originalImageData:]"];
    objc_msgSend(v14, "handleFailureInFunction:file:lineNumber:description:", v15, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDImageFill.m"), 71, @"bogus technique");
  }
  v18.receiver = self;
  v18.super_class = (Class)TSDImageFill;
  v16 = [(TSDImageFill *)&v18 init];
  if (v16)
  {
    v16->mImageData = (TSPData *)a3;
    v16->mOriginalImageData = (TSPData *)a7;
    v16->mTechnique = a4;
    v16->mTintColor = (TSUColor *)[a5 copy];
    v16->mFillSize.CGFloat width = width;
    v16->mFillSize.CGFloat height = height;
    v16->mTempRenderLock = (OS_dispatch_queue *)dispatch_queue_create("com.apple.iwork.drawing.fills.image", 0);
  }
  return v16;
}

- (TSDImageFill)initWithGenericImageData:(id)a3 technique:(int)a4 tintColor:(id)a5 size:(CGSize)a6 originalImageData:(id)a7
{
  result = -[TSDImageFill initWithImageData:technique:tintColor:size:originalImageData:](self, "initWithImageData:technique:tintColor:size:originalImageData:", a3, *(void *)&a4, a5, a7, a6.width, a6.height);
  if (result) {
    result->mInterpretsUntaggedImageDataAsGeneric = 1;
  }
  return result;
}

- (void)dealloc
{
  if (self->mImageData && self->mHasIndicatedInterestInProvider) {
    objc_msgSend(+[TSDImageProviderPool sharedPool](TSDImageProviderPool, "sharedPool"), "removeInterestInProviderForData:", self->mImageData);
  }
  dispatch_release((dispatch_object_t)self->mTempRenderLock);

  CGImageRelease(self->mTempRenderCopy);
  v3.receiver = self;
  v3.super_class = (Class)TSDImageFill;
  [(TSDImageFill *)&v3 dealloc];
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  v4 = +[TSDMutableImageFill allocWithZone:a3];
  uint64_t mTechnique = self->mTechnique;
  mTintColor = self->mTintColor;
  [(TSDImageFill *)self fillSize];
  uint64_t v7 = -[TSDImageFill initWithImageData:technique:tintColor:size:originalImageData:](v4, "initWithImageData:technique:tintColor:size:originalImageData:", 0, mTechnique, mTintColor, 0);
  if (v7)
  {
    *(void *)(v7 + 16) = self->mImageData;
    *(void *)(v7 + 24) = self->mOriginalImageData;
    *(unsigned char *)(v7 + 32) = self->mInterpretsUntaggedImageDataAsGeneric;
  }
  return (id)v7;
}

- (double)scale
{
  objc_msgSend(-[TSDImageFill p_validatedImageProvider](self, "p_validatedImageProvider"), "naturalSize");
  if (v4 == 0.0 || v3 == 0.0) {
    return 1.0;
  }
  [(TSDImageFill *)self fillSize];
  double v6 = v5;
  objc_msgSend(-[TSDImageFill p_validatedImageProvider](self, "p_validatedImageProvider"), "naturalSize");
  double v8 = v6 / v7;
  [(TSDImageFill *)self fillSize];
  double v10 = v9;
  objc_msgSend(-[TSDImageFill p_validatedImageProvider](self, "p_validatedImageProvider"), "naturalSize");
  double v12 = v10 / v11;
  if (vabdd_f64(v8, v12) >= 0.00999999978)
  {
    v13 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v14 = [NSString stringWithUTF8String:"-[TSDImageFill scale]"];
    objc_msgSend(v13, "handleFailureInFunction:file:lineNumber:description:", v14, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDImageFill.m"), 215, @"The scaled fill size should respect the aspect ratio of the natural size");
  }
  return fmin(v8, v12);
}

- (CGSize)fillSize
{
  p_mFillSize = &self->mFillSize;
  double width = self->mFillSize.width;
  double height = self->mFillSize.height;
  if (width == *MEMORY[0x263F001B0] && height == *(double *)(MEMORY[0x263F001B0] + 8))
  {
    if ([(TSPData *)[(TSDImageFill *)self imageData] isApplicationData])
    {
      [(TSDImageFill *)self p_setFillSizeForApplicationData];
      double width = p_mFillSize->width;
      double height = p_mFillSize->height;
    }
    else
    {
      objc_msgSend(-[TSDImageFill p_validatedImageProvider](self, "p_validatedImageProvider"), "dpiAdjustedNaturalSize");
    }
  }
  result.double height = height;
  result.double width = width;
  return result;
}

- (BOOL)isOpaque
{
  [(TSDImageFill *)self p_validatedImageProvider];
  objc_opt_class();
  double v3 = (void *)TSUDynamicCast();
  if ([(TSDImageFill *)self tintColor])
  {
    [(TSUColor *)[(TSDImageFill *)self tintColor] alphaComponent];
    BOOL v5 = v4 == 1.0;
  }
  else
  {
    BOOL v5 = 0;
  }
  return [v3 isOpaque] | v5;
}

- (void)p_setFillSizeForApplicationData
{
  mOriginalImageData = self->mOriginalImageData;
  if (!mOriginalImageData || mOriginalImageData == self->mImageData) {
    id v4 = [(TSDImageFill *)self p_validatedImageProvider];
  }
  else {
    id v4 = (id)objc_msgSend(+[TSDImageProviderPool sharedPool](TSDImageProviderPool, "sharedPool"), "providerForData:shouldValidate:", self->mOriginalImageData, 1);
  }
  BOOL v5 = v4;
  objc_opt_class();
  double v6 = (void *)TSUDynamicCast();
  if (v6) {
    [v6 dpiAdjustedFillSize];
  }
  else {
    [v5 naturalSize];
  }
  self->mFillSize.double width = v7;
  self->mFillSize.double height = v8;
}

- (id)imageDataAtFillSize
{
  if ([(TSDImageFill *)self originalImageData]) {
    double v3 = [(TSDImageFill *)self originalImageData];
  }
  else {
    double v3 = [(TSDImageFill *)self imageData];
  }
  id v4 = v3;
  BOOL v5 = objc_msgSend(+[TSDImageProviderPool sharedPool](TSDImageProviderPool, "sharedPool"), "providerForData:shouldValidate:", v3, 1);
  [v5 naturalSize];
  double v7 = v6;
  double v9 = v8;
  [(TSDImageFill *)self fillSize];
  if (v7 != v11 || v9 != v10)
  {
    v13 = [TSDImageResamplingOperation alloc];
    [(TSDImageFill *)self fillSize];
    uint64_t v14 = -[TSDImageResamplingOperation initWithImageProvider:desiredSize:](v13, "initWithImageProvider:desiredSize:", v5);
    [(TSDImageResamplingOperation *)v14 setDisplayName:[(TSPData *)v4 filename]];
    id v15 = [(TSDImageResamplingOperation *)v14 performResampleOperationWithResampleOptions:10 bitmapContextOptions:11];
    if (v15) {
      id v4 = (TSPData *)v15;
    }
  }
  objc_msgSend((id)objc_msgSend(+[TSDImageProviderPool sharedPool](TSDImageProviderPool, "sharedPool"), "providerForData:shouldValidate:", v4, 1), "naturalSize");
  double v17 = v16;
  double v19 = v18;
  [(TSDImageFill *)self fillSize];
  if (v17 != v21 || v19 != v20)
  {
    v23 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v24 = [NSString stringWithUTF8String:"-[TSDImageFill imageDataAtFillSize]"];
    objc_msgSend(v23, "handleFailureInFunction:file:lineNumber:description:", v24, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDImageFill.m"), 287, @"Fill size is incorrect.");
  }
  return v4;
}

- (id)referenceColor
{
  id result = self->mReferenceColor;
  if (!result)
  {
    objc_sync_enter(self);
    if (!self->mReferenceColor)
    {
      id v4 = (void *)[MEMORY[0x263F7C808] clearColor];
      if ([(TSDImageFill *)self p_validatedImageProvider])
      {
        BOOL v5 = TSDBitmapContextCreate(3, 1.0);
        if (v5)
        {
          Mutable = CGPathCreateMutable();
          if (Mutable)
          {
            [(TSDImageFill *)self fillSize];
            double v8 = v7;
            double v10 = v9;
            v19.origin.x = TSDRectWithSize();
            CGPathAddRect(Mutable, 0, v19);
            CGContextScaleCTM(v5, 1.0 / v8, 1.0 / v10);
            [(TSDImageFill *)self paintPath:Mutable inContext:v5];
            CGPathRelease(Mutable);
          }
          else
          {
            id v15 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
            uint64_t v16 = [NSString stringWithUTF8String:"-[TSDImageFill referenceColor]"];
            objc_msgSend(v15, "handleFailureInFunction:file:lineNumber:description:", v16, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDImageFill.m"), 312, @"invalid nil value for '%s'", "path");
          }
          Data = CGBitmapContextGetData(v5);
          if (Data) {
            id v4 = (void *)[MEMORY[0x263F7C808] colorWithRed:(double)BYTE2(*Data) / 255.0 green:(double)BYTE1(*Data) / 255.0 blue:(double)*Data / 255.0 alpha:1.0];
          }
          CGContextRelease(v5);
        }
        else
        {
          v13 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
          uint64_t v14 = [NSString stringWithUTF8String:"-[TSDImageFill referenceColor]"];
          objc_msgSend(v13, "handleFailureInFunction:file:lineNumber:description:", v14, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDImageFill.m"), 308, @"invalid nil value for '%s'", "smallContext");
        }
      }
      else
      {
        double v11 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
        uint64_t v12 = [NSString stringWithUTF8String:"-[TSDImageFill referenceColor]"];
        objc_msgSend(v11, "handleFailureInFunction:file:lineNumber:description:", v12, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDImageFill.m"), 302, @"invalid nil value for '%s'", "provider");
      }
      id v18 = v4;
      __dmb(0xBu);
      self->mReferenceColor = (TSUColor *)v4;
    }
    objc_sync_exit(self);
    return self->mReferenceColor;
  }
  return result;
}

- (unint64_t)hash
{
  return [(TSPData *)self->mImageData hash];
}

- (BOOL)isEqual:(id)a3
{
  if (a3 == self)
  {
    LOBYTE(v12) = 1;
  }
  else
  {
    uint64_t v24 = v5;
    uint64_t v25 = v4;
    uint64_t v26 = v3;
    objc_opt_class();
    uint64_t v12 = (void *)TSUDynamicCast();
    if (v12)
    {
      v13 = v12;
      LODWORD(v12) = -[TSPData isEqual:](-[TSDImageFill imageData](self, "imageData"), "isEqual:", [v12 imageData]);
      if (v12)
      {
        int v14 = [(TSDImageFill *)self technique];
        if (v14 == [v13 technique])
        {
          unint64_t v15 = [(TSDImageFill *)self tintColor];
          uint64_t v16 = [v13 tintColor];
          if (!(v15 | v16) || (LODWORD(v12) = [(id)v15 isEqual:v16], v12))
          {
            [(TSDImageFill *)self fillSize];
            double v18 = v17;
            double v20 = v19;
            [v13 fillSize];
            LOBYTE(v12) = v20 == v22 && v18 == v21;
          }
        }
        else
        {
          LOBYTE(v12) = 0;
        }
      }
    }
  }
  return (char)v12;
}

- (BOOL)drawsInOneStep
{
  if (self->mTintColor)
  {
    char isKindOfClass = 1;
  }
  else
  {
    [(TSDImageFill *)self p_validatedImageProvider];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
  }
  return isKindOfClass & (self->mTechnique != 2);
}

- (BOOL)canApplyToCALayer
{
  if (self->mTintColor || (self->mTechnique | 2) == 2)
  {
    LOBYTE(v3) = 0;
  }
  else
  {
    objc_opt_class();
    [(TSDImageFill *)self p_validatedImageProvider];
    uint64_t v3 = (void *)TSUDynamicCast();
    if (v3) {
      LOBYTE(v3) = [v3 orientation] == 0;
    }
  }
  return (char)v3;
}

- (BOOL)canApplyToCALayerByAddingSublayers
{
  if (self->mTintColor || self->mTechnique == 2)
  {
    LOBYTE(v3) = 0;
  }
  else
  {
    objc_opt_class();
    [(TSDImageFill *)self p_validatedImageProvider];
    uint64_t v3 = (void *)TSUDynamicCast();
    if (v3) {
      LOBYTE(v3) = [v3 orientation] == 0;
    }
  }
  return (char)v3;
}

- (int)fillType
{
  return 2;
}

- (BOOL)p_shouldApplyTintedImage
{
  id v3 = [(TSDImageFill *)self p_standardSizeCachedImage];
  if (v3) {
    LOBYTE(v3) = [(TSDImageFill *)self tintColor] != 0;
  }
  return (char)v3;
}

- (BOOL)shouldBeReappliedToCALayer:(id)a3
{
  if (!self->mTechnique) {
    return 1;
  }
  if ([(TSDImageFill *)self p_shouldApplyTintedImage]) {
    return 0;
  }
  objc_opt_class();
  [(TSDImageFill *)self p_validatedImageProvider];
  uint64_t v6 = (void *)TSUDynamicCast();
  [a3 bounds];
  uint64_t v9 = objc_msgSend(v6, "CGImageForSize:inContext:orLayer:", 0, a3, v7, v8);
  return [a3 contents] != v9;
}

- (id)p_cachedImageForSize:(CGSize)a3 inContext:(CGContext *)a4 orLayer:(id)a5
{
  double height = a3.height;
  double width = a3.width;
  if (a4)
  {
    if (a5)
    {
      uint64_t v9 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
      uint64_t v10 = [NSString stringWithUTF8String:"-[TSDImageFill p_cachedImageForSize:inContext:orLayer:]"];
      objc_msgSend(v9, "handleFailureInFunction:file:lineNumber:description:", v10, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDImageFill.m"), 442, @"using context to determine requested image size. layer should be nil");
    }
    if ((TSDCGContextIsPrintContext((uint64_t)a4) & 1) != 0 || TSDCGContextIsPDFContext((uint64_t)a4))
    {
      return [(TSDImageFill *)self p_standardSizeCachedImage];
    }
    double v13 = TSDCGContextAssociatedScreenScale((uint64_t)a4);
    double width = TSDMultiplySizeScalar(width, height, v13);
    double height = v14;
    CGContextGetCTM(&v22, a4);
    double v12 = TSDTransformScale(&v22.a);
    goto LABEL_12;
  }
  if (a5)
  {
    [a5 contentsScale];
LABEL_12:
    double width = TSDMultiplySizeScalar(width, height, v12);
    double height = v15;
  }
  [(TSDImageFill *)self fillSize];
  double v17 = v16;
  double v19 = v18;
  if (width <= TSDMultiplySizeScalar(v16, v18, 0.25) && height <= v20) {
    return [(TSDImageFill *)self p_quarterSizeCachedImage];
  }
  if (width <= TSDMultiplySizeScalar(v17, v19, 0.5)) {
    return [(TSDImageFill *)self p_halfSizeCachedImage];
  }
  return [(TSDImageFill *)self p_standardSizeCachedImage];
}

- (void)applyToCALayer:(id)a3 withScale:(double)a4
{
  if (![(TSDImageFill *)self canApplyToCALayer]
    && ![(TSDImageFill *)self canApplyToCALayerByAddingSublayers])
  {
    double v7 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v8 = [NSString stringWithUTF8String:"-[TSDImageFill applyToCALayer:withScale:]"];
    objc_msgSend(v7, "handleFailureInFunction:file:lineNumber:description:", v8, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDImageFill.m"), 472, @"Applying image fill with unsupported properties to CALayer");
  }
  objc_opt_class();
  [(TSDImageFill *)self p_validatedImageProvider];
  uint64_t v9 = (void *)TSUDynamicCast();
  BOOL v10 = [(TSDImageFill *)self p_shouldApplyTintedImage];
  [a3 bounds];
  if (v10) {
    CGImageRef v13 = (CGImageRef)objc_msgSend(-[TSDImageFill p_cachedImageForSize:inContext:orLayer:](self, "p_cachedImageForSize:inContext:orLayer:", 0, a3, v11, v12), "newImage");
  }
  else {
    CGImageRef v13 = CGImageRetain((CGImageRef)objc_msgSend(v9, "CGImageForSize:inContext:orLayer:", 0, a3, v11, v12));
  }
  double v14 = v13;
  double v15 = (double *)MEMORY[0x263F00148];
  if ([a3 sublayers]) {
    uint64_t v16 = objc_msgSend((id)objc_msgSend(a3, "sublayers"), "indexOfObjectPassingTest:", &__block_literal_global_36);
  }
  else {
    uint64_t v16 = 0x7FFFFFFFFFFFFFFFLL;
  }
  double x = *v15;
  double y = v15[1];
  switch(self->mTechnique)
  {
    case 0:
      uint64_t v19 = *MEMORY[0x263F15E10];
      if (v16 == 0x7FFFFFFFFFFFFFFFLL)
      {
        double v20 = (void *)[MEMORY[0x263F157E8] layer];
        double v21 = (void *)[MEMORY[0x263F157E8] layer];
        [v20 addSublayer:v21];
      }
      else
      {
        double v20 = objc_msgSend((id)objc_msgSend(a3, "sublayers"), "objectAtIndex:", v16);
        double v21 = objc_msgSend((id)objc_msgSend(v20, "sublayers"), "lastObject");
      }
      [MEMORY[0x263F158F8] begin];
      [MEMORY[0x263F158F8] setDisableActions:1];
      [a3 bounds];
      objc_msgSend(v20, "setPosition:", TSDCenterOfRect(v46, v47, v48, v49));
      [a3 bounds];
      objc_msgSend(v20, "setBounds:");
      [v20 setMasksToBounds:1];
      [v20 setEdgeAntialiasingMask:1];
      [v20 bounds];
      double v54 = TSDCenterOfRect(v50, v51, v52, v53);
      double v56 = v55;
      [(TSDImageFill *)self fillSize];
      double v58 = TSDRectWithCenterAndSize(v54, v56, v57);
      CGFloat v60 = v59;
      CGFloat v62 = v61;
      CGFloat v64 = v63;
      [a3 contentsScale];
      double v66 = TSDRoundedRectForScale(v58, v60, v62, v64, v65 * a4);
      CGFloat v68 = v67;
      CGFloat v70 = v69;
      CGFloat v72 = v71;
      [v21 setContents:v14];
      objc_msgSend(v21, "setPosition:", TSDCenterOfRect(v66, v68, v70, v72));
      [v21 setBounds:TSDRectWithSize()];
      [a3 contentsScale];
      objc_msgSend(v21, "setContentsScale:");
      double height = 1.0;
      CATransform3DMakeScale(&v74, a4, a4, 1.0);
      CATransform3D v73 = v74;
      [v21 setTransform:&v73];
      objc_msgSend(v21, "setDelegate:", objc_msgSend(a3, "delegate"));
      [v21 setEdgeAntialiasingMask:0];
      [MEMORY[0x263F158F8] commit];
      v45 = 0;
      double width = 1.0;
      goto LABEL_19;
    case 1:
      goto LABEL_15;
    case 3:
      uint64_t v19 = *MEMORY[0x263F15E20];
      [(TSDImageFill *)self fillSize];
      double v23 = v22;
      double v25 = v24;
      [a3 bounds];
      double v27 = v26;
      double v29 = v28;
      double v30 = TSDRectWithSize();
      double v34 = TSDFitOrFillSizeInRect(1, v23, v25, v30, v31, v32, v33);
      double v36 = 1.0 / v35;
      double v38 = 1.0 / v37;
      v78.origin.double x = -(v34 * v36);
      v78.origin.double y = -(v39 * v38);
      v78.size.double width = v27 * v36;
      v78.size.double height = v29 * v38;
      v75.size.double width = 1.0;
      v75.size.double height = 1.0;
      v75.origin.double x = x;
      v75.origin.double y = y;
      CGRect v76 = CGRectIntersection(v75, v78);
      double x = v76.origin.x;
      double y = v76.origin.y;
      double width = v76.size.width;
      double height = v76.size.height;
      double v20 = 0;
      goto LABEL_18;
    case 4:
      double v20 = 0;
      v44 = (uint64_t *)MEMORY[0x263F15E18];
      goto LABEL_17;
    default:
      v42 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
      uint64_t v43 = [NSString stringWithUTF8String:"-[TSDImageFill applyToCALayer:withScale:]"];
      objc_msgSend(v42, "handleFailureInFunction:file:lineNumber:description:", v43, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDImageFill.m"), 565, @"bogus fill technique to apply to CALayer");
LABEL_15:
      double v20 = 0;
      v44 = (uint64_t *)MEMORY[0x263F15E10];
LABEL_17:
      uint64_t v19 = *v44;
      double height = 1.0;
      double width = 1.0;
LABEL_18:
      v45 = v14;
LABEL_19:
      if ((CGImage *)[a3 contents] != v45) {
        [a3 setContents:v45];
      }
      if ([a3 contentsGravity] != v19) {
        [a3 setContentsGravity:v19];
      }
      [a3 contentsRect];
      v79.origin.double x = x;
      v79.origin.double y = y;
      v79.size.double width = width;
      v79.size.double height = height;
      if (!CGRectEqualToRect(v77, v79)) {
        objc_msgSend(a3, "setContentsRect:", x, y, width, height);
      }
      if ([a3 backgroundColor]) {
        [a3 setBackgroundColor:0];
      }
      if (v20 && v16 == 0x7FFFFFFFFFFFFFFFLL)
      {
        [v20 setName:@"TSDImageFillSublayer"];
        [a3 addSublayer:v20];
      }
      else if (!v20 && v16 != 0x7FFFFFFFFFFFFFFFLL)
      {
        objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "sublayers"), "objectAtIndex:", v16), "removeFromSuperlayer");
      }
      CGImageRelease(v14);
      return;
  }
}

uint64_t __41__TSDImageFill_applyToCALayer_withScale___block_invoke(uint64_t a1, void *a2)
{
  v2 = (void *)[a2 name];

  return [v2 isEqualToString:@"TSDImageFillSublayer"];
}

- (CGSize)renderedImageSizeForObjectSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  switch([(TSDImageFill *)self technique])
  {
    case 0:
    case 2:
      [(TSDImageFill *)self fillSize];
      goto LABEL_4;
    case 1:
      break;
    case 3:
    case 4:
      [(TSDImageFill *)self fillSize];
      double v6 = TSDFitOrFillSizeInSize([(TSDImageFill *)self technique] == 3, v8, v9, width, height);
LABEL_4:
      double width = v6;
      double height = v7;
      break;
    default:
      double height = 0.0;
      double width = 0.0;
      break;
  }
  double v10 = width;
  double v11 = height;
  result.double height = v11;
  result.double width = v10;
  return result;
}

- (void)drawSwatchInRect:(CGRect)a3 inContext:(CGContext *)a4
{
  if (a4)
  {
    CGFloat height = a3.size.height;
    CGFloat width = a3.size.width;
    CGFloat y = a3.origin.y;
    CGFloat x = a3.origin.x;
    Mutable = CGPathCreateMutable();
    v14.origin.CGFloat x = x;
    v14.origin.CGFloat y = y;
    v14.size.CGFloat width = width;
    v14.size.CGFloat height = height;
    CGPathAddRect(Mutable, 0, v14);
    [(TSDImageFill *)self paintPath:Mutable inContext:a4];
    CGPathRelease(Mutable);
  }
  else
  {
    double v11 = objc_msgSend(MEMORY[0x263F7C7F0], "currentHandler", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
    uint64_t v12 = [NSString stringWithUTF8String:"-[TSDImageFill drawSwatchInRect:inContext:]"];
    objc_msgSend(v11, "handleFailureInFunction:file:lineNumber:description:", v12, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDImageFill.m"), 621, @"invalid nil value for '%s'", "ctx");
  }
}

- (CGSize)p_sizeOfFillImageForDestRect:(CGRect)a3 inContext:(CGContext *)a4
{
  int v6 = [(TSDImageFill *)self technique];
  [(TSDImageFill *)self fillSize];
  if (v6 != 2)
  {
    -[TSDImageFill p_drawnRectForImageSize:destRect:inContext:](self, "p_drawnRectForImageSize:destRect:inContext:", a4);
    double v7 = v9;
    double v8 = v10;
  }
  result.CGFloat height = v8;
  result.CGFloat width = v7;
  return result;
}

- (void)p_paintPath:(CGPath *)a3 inContext:(CGContext *)a4
{
  if (!a3)
  {
    double v10 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v11 = [NSString stringWithUTF8String:"-[TSDImageFill p_paintPath:inContext:]"];
    objc_msgSend(v10, "handleFailureInFunction:file:lineNumber:description:", v11, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDImageFill.m"), 648, @"invalid nil value for '%s'", "path");
    if (a4) {
      return;
    }
    goto LABEL_7;
  }
  if (!a4)
  {
LABEL_7:
    uint64_t v12 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v13 = [NSString stringWithUTF8String:"-[TSDImageFill p_paintPath:inContext:]"];
    objc_msgSend(v12, "handleFailureInFunction:file:lineNumber:description:", v13, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDImageFill.m"), 649, @"invalid nil value for '%s'", "ctx");
    return;
  }
  id v7 = [(TSDImageFill *)self p_validatedImageProvider];
  if (v7)
  {
    double v8 = v7;
    CGContextSaveGState(a4);
    CGContextBeginPath(a4);
    CGContextAddPath(a4, a3);
    CGContextClip(a4);
    objc_opt_class();
    BOOL v9 = (objc_opt_isKindOfClass() & 1) == 0 || TSDCGContextGetBitmapQualityInfo((uint64_t)a4) == 0;
    PathBoundingBodouble x = CGPathGetPathBoundingBox(a3);
    double x = PathBoundingBox.origin.x;
    double y = PathBoundingBox.origin.y;
    double width = PathBoundingBox.size.width;
    double height = PathBoundingBox.size.height;
    if (-[TSDImageFill tintColor](self, "tintColor") && v9 && ([v8 isError] & 1) == 0)
    {
      -[TSDImageFill p_sizeOfFillImageForDestRect:inContext:](self, "p_sizeOfFillImageForDestRect:inContext:", a4, x, y, width, height);
      double v18 = (CGImage *)objc_msgSend(-[TSDImageFill p_cachedImageForSize:inContext:orLayer:](self, "p_cachedImageForSize:inContext:orLayer:", a4, 0), "newImage");
      -[TSDImageFill p_drawBitmapImage:withOrientation:inContext:bounds:](self, "p_drawBitmapImage:withOrientation:inContext:bounds:", v18, 0, a4, x, y, width, height);
      CGImageRelease(v18);
    }
    else
    {
      CGContextSaveGState(a4);
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        -[TSDImageFill p_sizeOfFillImageForDestRect:inContext:](self, "p_sizeOfFillImageForDestRect:inContext:", a4, x, y, width, height);
        -[TSDImageFill p_drawBitmapImage:withOrientation:inContext:bounds:](self, "p_drawBitmapImage:withOrientation:inContext:bounds:", objc_msgSend(v8, "CGImageForSize:inContext:orLayer:", a4, 0), objc_msgSend(v8, "orientation"), a4, x, y, width, height);
      }
      else
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          -[TSDImageFill p_drawPDFWithProvider:inContext:bounds:](self, "p_drawPDFWithProvider:inContext:bounds:", v8, a4, x, y, width, height);
        }
        else
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            -[TSDImageFill p_drawnRectForImageSize:destRect:inContext:](self, "p_drawnRectForImageSize:destRect:inContext:", a4, width, height, x, y, width, height);
            objc_msgSend(v8, "drawImageInContext:rect:", a4);
          }
        }
      }
      CGContextRestoreGState(a4);
      if (!v9 && [(TSDImageFill *)self tintColor]) {
        -[TSUColor paintRect:inContext:]([(TSDImageFill *)self tintColor], "paintRect:inContext:", a4, x, y, width, height);
      }
    }
    CGContextRestoreGState(a4);
  }
}

- (void)addBitmapsToRenderingQualityInfo:(id)a3 forShapeRep:(id)a4 inContext:(CGContext *)a5
{
  objc_opt_class();
  [(TSDImageFill *)self p_validatedImageProvider];
  uint64_t v9 = TSUDynamicCast();
  if (v9)
  {
    uint64_t v10 = v9;
    [(TSDImageFill *)self fillSize];
    double v12 = v11;
    double v14 = v13;
    [a4 layerFrameInScaledCanvas];
    -[TSDImageFill p_drawnRectForImageSize:destRect:inContext:](self, "p_drawnRectForImageSize:destRect:inContext:", a5, v12, v14, v15, v16, v17, v18);
    objc_msgSend(a3, "cacheProvider:ofSize:", v10, v19, v20);
  }
}

- (void)paintPath:(CGPath *)a3 inContext:(CGContext *)a4
{
  if (!a3)
  {
    id v7 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v8 = [NSString stringWithUTF8String:"-[TSDImageFill paintPath:inContext:]"];
    objc_msgSend(v7, "handleFailureInFunction:file:lineNumber:description:", v8, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDImageFill.m"), 715, @"invalid nil value for '%s'", "path");
  }

  [(TSDImageFill *)self p_paintPath:a3 inContext:a4];
}

- (void)paintPath:(CGPath *)a3 naturalBounds:(CGRect)a4 inContext:(CGContext *)a5 isPDF:(BOOL)a6
{
  if (!a3)
  {
    uint64_t v9 = objc_msgSend(MEMORY[0x263F7C7F0], "currentHandler", 0, a5, a6, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height);
    uint64_t v10 = [NSString stringWithUTF8String:"-[TSDImageFill paintPath:naturalBounds:inContext:isPDF:]"];
    objc_msgSend(v9, "handleFailureInFunction:file:lineNumber:description:", v10, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDImageFill.m"), 722, @"invalid nil value for '%s'", "path");
  }

  -[TSDImageFill p_paintPath:inContext:](self, "p_paintPath:inContext:", a3, a5, a6, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height);
}

- (CGImage)p_newTintedImageWithScale:(double)a3
{
  id v5 = [(TSDImageFill *)self p_validatedImageProvider];
  if (!-[TSDImageFill tintColor](self, "tintColor") || !v5 || ([v5 isError] & 1) != 0) {
    return 0;
  }
  [v5 naturalSize];
  TSDMultiplySizeScalar(v7, v8, a3);
  double v9 = TSDRoundedSize();
  if ([v5 imageGamut] == 2) {
    char v10 = 11;
  }
  else {
    char v10 = 43;
  }
  double v11 = TSDBitmapContextCreate(v10, v9);
  double v12 = TSDRectWithSize();
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;
  CGContextSaveGState(v11);
  objc_msgSend(v5, "drawImageInContext:rect:", v11, v12, v14, v16, v18);
  CGContextRestoreGState(v11);
  CGContextSetFillColorWithColor(v11, (CGColorRef)[(TSUColor *)[(TSDImageFill *)self tintColor] CGColor]);
  v20.origin.double x = v12;
  v20.origin.double y = v14;
  v20.size.double width = v16;
  v20.size.double height = v18;
  CGContextFillRect(v11, v20);
  Image = CGBitmapContextCreateImage(v11);
  CGContextRelease(v11);
  return Image;
}

- (CGImage)p_newStandardSizeImage
{
  return [(TSDImageFill *)self p_newTintedImageWithScale:1.0];
}

- (id)p_standardSizeCachedImage
{
  id result = [(TSDImageFill *)self tintColor];
  if (result)
  {
    mStandardSizeTintedImage = self->mStandardSizeTintedImage;
    if (!mStandardSizeTintedImage)
    {
      objc_sync_enter(self);
      if (!self->mStandardSizeTintedImage)
      {
        id v5 = (void *)[objc_alloc(MEMORY[0x263F7C838]) initWithDelegate:self createImageSelector:sel_p_newStandardSizeImage];
        __dmb(0xBu);
        self->mStandardSizeTintedImage = (TSUFlushableCachedImage *)v5;
        [v5 ownerAutoreleasedAccess];
      }
      objc_sync_exit(self);
      mStandardSizeTintedImage = self->mStandardSizeTintedImage;
    }
    return (id)[(TSUFlushableCachedImage *)mStandardSizeTintedImage ownerAutoreleasedAccess];
  }
  return result;
}

- (CGImage)p_newHalfSizeImage
{
  return [(TSDImageFill *)self p_newTintedImageWithScale:0.5];
}

- (id)p_halfSizeCachedImage
{
  id result = [(TSDImageFill *)self tintColor];
  if (result)
  {
    mHalfSizeTintedImage = self->mHalfSizeTintedImage;
    if (!mHalfSizeTintedImage)
    {
      objc_sync_enter(self);
      if (!self->mHalfSizeTintedImage)
      {
        id v5 = (void *)[objc_alloc(MEMORY[0x263F7C838]) initWithDelegate:self createImageSelector:sel_p_newHalfSizeImage];
        __dmb(0xBu);
        self->mHalfSizeTintedImage = (TSUFlushableCachedImage *)v5;
        [v5 ownerAutoreleasedAccess];
      }
      objc_sync_exit(self);
      mHalfSizeTintedImage = self->mHalfSizeTintedImage;
    }
    return (id)[(TSUFlushableCachedImage *)mHalfSizeTintedImage ownerAutoreleasedAccess];
  }
  return result;
}

- (CGImage)p_newQuarterSizeImage
{
  return [(TSDImageFill *)self p_newTintedImageWithScale:0.25];
}

- (id)p_quarterSizeCachedImage
{
  id result = [(TSDImageFill *)self tintColor];
  if (result)
  {
    mQuarterSizeTintedImage = self->mQuarterSizeTintedImage;
    if (!mQuarterSizeTintedImage)
    {
      objc_sync_enter(self);
      if (!self->mQuarterSizeTintedImage)
      {
        id v5 = (void *)[objc_alloc(MEMORY[0x263F7C838]) initWithDelegate:self createImageSelector:sel_p_newQuarterSizeImage];
        __dmb(0xBu);
        self->mQuarterSizeTintedImage = (TSUFlushableCachedImage *)v5;
        [v5 ownerAutoreleasedAccess];
      }
      objc_sync_exit(self);
      mQuarterSizeTintedImage = self->mQuarterSizeTintedImage;
    }
    return (id)[(TSUFlushableCachedImage *)mQuarterSizeTintedImage ownerAutoreleasedAccess];
  }
  return result;
}

- (int64_t)mixingTypeWithObject:(id)a3
{
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __37__TSDImageFill_mixingTypeWithObject___block_invoke;
  v4[3] = &unk_2646B1758;
  v4[4] = a3;
  v4[5] = self;
  return TSDMixingTypeWithObject((unint64_t)self, (unint64_t)a3, (uint64_t)v4);
}

uint64_t __37__TSDImageFill_mixingTypeWithObject___block_invoke(uint64_t a1)
{
  objc_opt_class();
  v2 = (void *)TSUDynamicCast();
  if (!v2)
  {
    id v3 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v4 = [NSString stringWithUTF8String:"-[TSDImageFill mixingTypeWithObject:]_block_invoke"];
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDImageFill.m"), 855, @"nil object after cast");
  }
  if (objc_msgSend((id)objc_msgSend(*(id *)(a1 + 40), "imageData"), "isEqual:", objc_msgSend(v2, "imageData"))) {
    uint64_t v5 = 5;
  }
  else {
    uint64_t v5 = TSDMixingTypeBestFromMixingTypes(5, 1);
  }
  int v6 = [*(id *)(a1 + 40) technique];
  if (v6 != [v2 technique]) {
    uint64_t v5 = TSDMixingTypeBestFromMixingTypes(v5, 2);
  }
  uint64_t v7 = [*(id *)(a1 + 40) tintColor];
  if (v7 == [v2 tintColor]
    || [*(id *)(a1 + 40) tintColor]
    && [v2 tintColor]
    && (objc_msgSend((id)objc_msgSend(*(id *)(a1 + 40), "tintColor"), "isEqual:", objc_msgSend(v2, "tintColor")) & 1) != 0)
  {
    return v5;
  }

  return TSDMixingTypeBestFromMixingTypes(v5, 3);
}

- (id)mixedObjectWithFraction:(double)a3 ofObject:(id)a4
{
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __49__TSDImageFill_mixedObjectWithFraction_ofObject___block_invoke;
  v5[3] = &unk_2646B1780;
  v5[4] = a4;
  v5[5] = self;
  *(double *)&v5[6] = a3;
  return (id)TSDMixingMixedObjectWithFraction(self, a4, (uint64_t)v5);
}

TSDImageFill *__49__TSDImageFill_mixedObjectWithFraction_ofObject___block_invoke(uint64_t a1)
{
  objc_opt_class();
  v2 = (void *)TSUDynamicCast();
  if ([*(id *)(a1 + 40) tintColor] || objc_msgSend(v2, "tintColor"))
  {
    id v3 = (void *)[*(id *)(a1 + 40) tintColor];
    if (!v3) {
      id v3 = (void *)[MEMORY[0x263F7C808] clearColor];
    }
    uint64_t v4 = [v2 tintColor];
    if (!v4) {
      uint64_t v4 = [MEMORY[0x263F7C808] clearColor];
    }
    uint64_t v5 = [v3 blendedColorWithFraction:v4 ofColor:*(double *)(a1 + 48)];
  }
  else
  {
    uint64_t v5 = 0;
  }
  [*(id *)(a1 + 40) fillSize];
  double v7 = v6;
  double v9 = v8;
  [v2 fillSize];
  double v12 = TSDMixSizes(v7, v9, v10, v11, *(double *)(a1 + 48));
  double v14 = -[TSDImageFill initWithImageData:technique:tintColor:size:originalImageData:]([TSDImageFill alloc], "initWithImageData:technique:tintColor:size:originalImageData:", [*(id *)(a1 + 40) imageData], objc_msgSend(*(id *)(a1 + 40), "technique"), v5, 0, v12, v13);

  return v14;
}

+ (id)presetKinds
{
  return (id)[MEMORY[0x263EFFA08] setWithObject:String];
}

- (NSString)presetKind
{
  return (NSString *)String;
}

- (SEL)mapThemeAssetSelector
{
  return sel_tsdMapImageFill_;
}

- (id)p_validatedImageProvider
{
  if (!self->mHasIndicatedInterestInProvider && self->mImageData)
  {
    self->mHasIndicatedInterestInProvider = 1;
    objc_msgSend(+[TSDImageProviderPool sharedPool](TSDImageProviderPool, "sharedPool"), "addInterestInProviderForData:", self->mImageData);
  }
  id v3 = +[TSDImageProviderPool sharedPool];
  mImageData = self->mImageData;

  return (id)[v3 providerForData:mImageData shouldValidate:1];
}

- (CGRect)p_drawnRectForImageSize:(CGSize)a3 destRect:(CGRect)a4 inContext:(CGContext *)a5
{
  CGFloat height = a4.size.height;
  CGFloat width = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  double v10 = a3.height;
  double v11 = a3.width;
  int v13 = [(TSDImageFill *)self technique];
  if ((v13 - 3) < 2)
  {
    double v14 = TSDFitOrFillSizeInRect([(TSDImageFill *)self technique] == 3, v11, v10, x, y, width, height);
LABEL_6:
    CGFloat x = v14;
    CGFloat y = v15;
    CGFloat width = v16;
    CGFloat height = v17;
    goto LABEL_7;
  }
  if (!v13)
  {
    CGContextGetUserSpaceToDeviceSpaceTransform(&v33, a5);
    BOOL v18 = TSDIsTransformAxisAligned(&v33.a);
    double v19 = TSDCenterOfRect(x, y, width, height);
    double v21 = TSDRectWithCenterAndSize(v19, v20, v11);
    CGFloat x = v21;
    CGFloat y = v22;
    CGFloat width = v23;
    CGFloat height = v24;
    if (v18)
    {
      CGContextConvertRectToDeviceSpace(a5, *(CGRect *)&v21);
      double v25 = TSDRoundedPoint();
      CGFloat v27 = v26;
      v34.size.CGFloat width = TSDRoundedSize();
      v34.size.CGFloat height = v28;
      v34.origin.CGFloat x = v25;
      v34.origin.CGFloat y = v27;
      *(CGRect *)&double v14 = CGContextConvertRectToUserSpace(a5, v34);
      goto LABEL_6;
    }
  }
LABEL_7:
  double v29 = x;
  double v30 = y;
  double v31 = width;
  double v32 = height;
  result.size.CGFloat height = v32;
  result.size.CGFloat width = v31;
  result.origin.CGFloat y = v30;
  result.origin.CGFloat x = v29;
  return result;
}

- (void)p_drawBitmapImage:(CGImage *)a3 withOrientation:(int64_t)a4 inContext:(CGContext *)a5 bounds:(CGRect)a6
{
  if (a3)
  {
    double height = a6.size.height;
    double width = a6.size.width;
    CGFloat y = a6.origin.y;
    CGFloat x = a6.origin.x;
    [(TSDImageFill *)self fillSize];
    double v14 = v13;
    double v16 = v15;
    -[TSDImageFill p_drawnRectForImageSize:destRect:inContext:](self, "p_drawnRectForImageSize:destRect:inContext:", a5);
    CGFloat v43 = v17;
    CGFloat v44 = v18;
    double v20 = v19;
    double v22 = v21;
    unsigned int v23 = [(TSDImageFill *)self technique];
    if (v23 > 4 || v23 == 2)
    {
      if (width > v14 || height > v16)
      {
        CGContextTranslateCTM(a5, v43, v44);
        CGContextScaleCTM(a5, 1.0, -1.0);
        double v32 = TSDRectWithSize();
        CGFloat v34 = v33;
        CGFloat v36 = v35;
        CGFloat v38 = v37;
        long long v48 = 0u;
        long long v49 = 0u;
        long long v47 = 0u;
        TSUImageOrientationTransform();
        memset(&transform, 0, sizeof(transform));
        CGContextConcatCTM(a5, &transform);
        mTempRenderLock = self->mTempRenderLock;
        block[0] = MEMORY[0x263EF8330];
        block[1] = 3221225472;
        block[2] = __67__TSDImageFill_p_drawBitmapImage_withOrientation_inContext_bounds___block_invoke;
        block[3] = &unk_2646B0858;
        block[4] = self;
        block[5] = a3;
        dispatch_sync(mTempRenderLock, block);
        v40 = CGImageRetain(self->mTempRenderCopy);
        v52.origin.CGFloat x = v32;
        v52.origin.CGFloat y = v34;
        v52.size.double width = v36;
        v52.size.double height = v38;
        CGContextDrawTiledImage(a5, v52, v40);
        CGImageRelease(v40);
        return;
      }
      v53.origin.CGFloat x = v43;
      v53.origin.CGFloat y = v44;
      v53.size.double width = v14;
      v53.size.double height = v16;
      double MinY = CGRectGetMinY(v53);
      v54.origin.CGFloat x = v43;
      v54.origin.CGFloat y = v44;
      v54.size.double width = v14;
      v54.size.double height = v16;
      CGFloat MaxY = CGRectGetMaxY(v54);
      CGContextTranslateCTM(a5, 0.0, MinY + MaxY);
      CGContextScaleCTM(a5, 1.0, -1.0);
      long long v48 = 0u;
      long long v49 = 0u;
      long long v47 = 0u;
      TSUImageOrientationTransform();
      memset(&transform, 0, sizeof(transform));
      CGContextConcatCTM(a5, &transform);
      double v26 = a5;
      CGFloat v27 = v43;
      CGFloat v28 = v44;
      double v29 = v14;
      double v30 = v16;
    }
    else
    {
      v50.origin.CGFloat x = x;
      v50.origin.CGFloat y = y;
      v50.size.double width = width;
      v50.size.double height = height;
      double v24 = CGRectGetMinY(v50);
      v51.origin.CGFloat x = x;
      v51.origin.CGFloat y = y;
      v51.size.double width = width;
      v51.size.double height = height;
      CGFloat v25 = CGRectGetMaxY(v51);
      CGContextTranslateCTM(a5, 0.0, v24 + v25);
      CGContextScaleCTM(a5, 1.0, -1.0);
      long long v48 = 0u;
      long long v49 = 0u;
      long long v47 = 0u;
      TSUImageOrientationTransform();
      memset(&transform, 0, sizeof(transform));
      CGContextConcatCTM(a5, &transform);
      double v26 = a5;
      CGFloat v27 = v43;
      CGFloat v28 = v44;
      double v29 = v20;
      double v30 = v22;
    }
    CGContextDrawImage(v26, *(CGRect *)&v27, a3);
  }
}

CGImage *__67__TSDImageFill_p_drawBitmapImage_withOrientation_inContext_bounds___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  CGRect result = (CGImage *)v2[14];
  if (!result || v2[15] != *(void *)(a1 + 40) || (uint64_t v4 = v2[16], v4 >= 4))
  {
    CGImageRelease(result);
    CGRect result = CGImageCreateCopy(*(CGImageRef *)(a1 + 40));
    *(void *)(*(void *)(a1 + 32) + 112) = result;
    *(void *)(*(void *)(a1 + 32) + 120) = *(void *)(a1 + 40);
    *(void *)(*(void *)(a1 + 32) + 128) = 0;
    v2 = *(void **)(a1 + 32);
    uint64_t v4 = v2[16];
  }
  v2[16] = v4 + 1;
  return result;
}

- (void)p_drawPDFWithProvider:(id)a3 inContext:(CGContext *)a4 bounds:(CGRect)a5
{
  CGFloat height = a5.size.height;
  CGFloat width = a5.size.width;
  CGFloat y = a5.origin.y;
  CGFloat x = a5.origin.x;
  double v11 = (CGPDFDocument *)[a3 CGPDFDocument];
  if (v11)
  {
    CGPDFPageRef Page = CGPDFDocumentGetPage(v11, 1uLL);
    if (Page)
    {
      double v13 = Page;
      CGContextSaveGState(a4);
      memset(&v51, 0, sizeof(v51));
      double v49 = 0.0;
      double v50 = 0.0;
      v44.origin.CGFloat x = TSDComputeBoxTransformAndSizeForPDFPage(v13, (uint64_t)&v51, &v49);
      v44.origin.CGFloat y = v14;
      v44.size.CGFloat width = v15;
      v44.size.CGFloat height = v16;
      [(TSDImageFill *)self fillSize];
      double v41 = v18;
      double v42 = v17;
      -[TSDImageFill p_drawnRectForImageSize:destRect:inContext:](self, "p_drawnRectForImageSize:destRect:inContext:", a4);
      CGFloat v43 = v19;
      CGFloat v21 = v20;
      CGFloat v23 = v22;
      CGFloat v25 = v24;
      v53.origin.CGFloat x = x;
      v53.origin.CGFloat y = y;
      v53.size.CGFloat width = width;
      v53.size.CGFloat height = height;
      double MinY = CGRectGetMinY(v53);
      v54.origin.CGFloat x = x;
      v54.origin.CGFloat y = y;
      v54.size.CGFloat width = width;
      v54.size.CGFloat height = height;
      CGFloat MaxY = CGRectGetMaxY(v54);
      CGContextTranslateCTM(a4, 0.0, MinY + MaxY);
      CGContextScaleCTM(a4, 1.0, -1.0);
      unsigned int v28 = [(TSDImageFill *)self technique];
      if (v28 > 4 || v28 == 2)
      {
        v52.CGFloat width = 1.0;
        v52.CGFloat height = 1.0;
        CGSize v29 = CGContextConvertSizeToDeviceSpace(a4, v52);
        double v30 = TSDMultiplySizeScalar(v42, v41, fmax(fabs(v29.width), fabs(v29.height)));
        double v31 = TSDCeilSize(v30);
        double v32 = TSDBitmapContextCreate(3, v31);
        if (v32)
        {
          double v33 = v32;
          long long v47 = 0u;
          long long v48 = 0u;
          __n128 v46 = 0u;
          double v34 = TSDRectWithSize();
          CGAffineTransform transform = v51;
          TSDComputeDrawTransformForPDFPage((__n128 *)&transform, &v46, v49, v50, v34, v35, v36, v37);
          *(__n128 *)&transform.a = v46;
          *(_OWORD *)&transform.c = v47;
          *(_OWORD *)&transform.tCGFloat x = v48;
          CGContextConcatCTM(v33, &transform);
          CGContextClipToRect(v33, v44);
          CGContextDrawPDFPage(v33, v13);
          Image = CGBitmapContextCreateImage(v33);
          CGContextRelease(v33);
          if (Image)
          {
            v55.origin.CGFloat x = x;
            v55.origin.CGFloat y = y;
            v55.size.CGFloat width = width;
            v55.size.CGFloat height = height;
            CGFloat MinX = CGRectGetMinX(v55);
            v56.origin.CGFloat x = x;
            v56.origin.CGFloat y = y;
            v56.size.CGFloat width = width;
            v56.size.CGFloat height = height;
            CGFloat v40 = CGRectGetMaxY(v56);
            CGContextTranslateCTM(a4, MinX, v40);
            v57.origin.CGFloat x = TSDRectWithSize();
            CGContextDrawTiledImage(a4, v57, Image);
            CGImageRelease(Image);
          }
        }
      }
      else
      {
        long long v47 = 0u;
        long long v48 = 0u;
        CGAffineTransform transform = v51;
        __n128 v46 = 0u;
        TSDComputeDrawTransformForPDFPage((__n128 *)&transform, &v46, v49, v50, v43, v21, v23, v25);
        *(__n128 *)&transform.a = v46;
        *(_OWORD *)&transform.c = v47;
        *(_OWORD *)&transform.tCGFloat x = v48;
        CGContextConcatCTM(a4, &transform);
        CGContextClipToRect(a4, v44);
        CGContextDrawPDFPage(a4, v13);
      }
      CGContextRestoreGState(a4);
    }
  }
}

- (TSPData)imageData
{
  return self->mImageData;
}

- (TSPData)originalImageData
{
  return self->mOriginalImageData;
}

- (int)technique
{
  return self->mTechnique;
}

- (void)setTechnique:(int)a3
{
  self->uint64_t mTechnique = a3;
}

- (TSUColor)tintColor
{
  return self->mTintColor;
}

- (BOOL)interpretsUntaggedImageDataAsGeneric
{
  return self->mInterpretsUntaggedImageDataAsGeneric;
}

@end