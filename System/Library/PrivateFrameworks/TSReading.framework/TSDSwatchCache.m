@interface TSDSwatchCache
+ (id)swatchCache;
- (CGImage)p_newImageWithConnectionLineKnobsForShape:(id)a3 atScale:(double)a4 ofSize:(CGSize)a5 overImage:(CGImage *)a6;
- (CGSize)imageSizeForPreset:(id)a3 swatchSize:(CGSize)a4;
- (CGSize)shapeSwatchInset;
- (TSDSwatchCache)init;
- (id)imageForImagePreset:(id)a3 imageSize:(CGSize)a4 imageScale:(double)a5 imageInfo:(id)a6 shouldClipVertically:(BOOL)a7 documentRoot:(id)a8;
- (id)imageForImagePreset:(id)a3 imageSize:(CGSize)a4 imageScale:(double)a5 swatchFrame:(CGRect)a6 imageInfo:(id)a7 shouldClipVertically:(BOOL)a8 documentRoot:(id)a9;
- (id)imageForMoviePreset:(id)a3 imageSize:(CGSize)a4 imageScale:(double)a5 movieInfo:(id)a6 shouldClipVertically:(BOOL)a7 documentRoot:(id)a8;
- (id)imageForMoviePreset:(id)a3 imageSize:(CGSize)a4 imageScale:(double)a5 swatchFrame:(CGRect)a6 movieInfo:(id)a7 shouldClipVertically:(BOOL)a8 documentRoot:(id)a9;
- (id)imageForShapePreset:(id)a3 imageSize:(CGSize)a4 imageScale:(double)a5 shapeType:(int)a6 angle:(double)a7 documentRoot:(id)a8;
- (id)imageForShapePreset:(id)a3 imageSize:(CGSize)a4 imageScale:(double)a5 swatchFrame:(CGRect)a6 shapeType:(int)a7 angle:(double)a8 documentRoot:(id)a9;
- (id)p_maskInfoForMovieInfo:(id)a3 context:(id)a4;
- (id)p_thumbnailImageDataForImageData:(id)a3;
- (void)applyFakeShadowForWhitePresetsIfNecessary:(id)a3 documentRoot:(id)a4;
- (void)dealloc;
- (void)warmStyle:(id)a3 withFillProperty:(int)a4 documentRoot:(id)a5;
@end

@implementation TSDSwatchCache

+ (id)swatchCache
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __29__TSDSwatchCache_swatchCache__block_invoke;
  block[3] = &unk_2646AF7B8;
  block[4] = a1;
  if (swatchCache_sSwatchCacheOnce != -1) {
    dispatch_once(&swatchCache_sSwatchCacheOnce, block);
  }
  return (id)swatchCache_sSwatchCache;
}

id __29__TSDSwatchCache_swatchCache__block_invoke(uint64_t a1)
{
  id result = objc_alloc_init(*(Class *)(a1 + 32));
  swatchCache_sSwatchCache = (uint64_t)result;
  return result;
}

- (TSDSwatchCache)init
{
  v4.receiver = self;
  v4.super_class = (Class)TSDSwatchCache;
  v2 = [(TSDSwatchCache *)&v4 init];
  if (v2) {
    v2->mOperationQueue = (NSOperationQueue *)objc_alloc_init(MEMORY[0x263F08A48]);
  }
  return v2;
}

- (void)dealloc
{
  [(NSOperationQueue *)self->mOperationQueue cancelAllOperations];

  v3.receiver = self;
  v3.super_class = (Class)TSDSwatchCache;
  [(TSDSwatchCache *)&v3 dealloc];
}

- (void)warmStyle:(id)a3 withFillProperty:(int)a4 documentRoot:(id)a5
{
  v6 = -[TSDStyleWarmingOperation initWithStyle:property:accessController:]([TSDStyleWarmingOperation alloc], "initWithStyle:property:accessController:", a3, *(void *)&a4, [a5 accessController]);
  [(NSOperationQueue *)self->mOperationQueue addOperation:v6];
}

- (CGSize)shapeSwatchInset
{
  if (!TSUPhoneUI()
    || (v2 = objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(MEMORY[0x263F1C408], "sharedApplication"), "keyWindow"), "windowScene"), "interfaceOrientation"), double v3 = 4.0, (unint64_t)(v2 - 5) <= 0xFFFFFFFFFFFFFFFDLL))
  {
    double v3 = 8.0;
  }
  double v4 = v3;
  result.height = v4;
  result.width = v3;
  return result;
}

- (void)applyFakeShadowForWhitePresetsIfNecessary:(id)a3 documentRoot:(id)a4
{
  if ((objc_msgSend((id)objc_msgSend(a3, "fill"), "isNearlyWhite")
     && (objc_msgSend((id)objc_msgSend(a3, "stroke"), "isNullStroke") & 1) != 0
     || [a3 stroke] && objc_msgSend((id)objc_msgSend(a3, "stroke"), "isNearlyWhite"))
    && (![a3 shadow] || (objc_msgSend((id)objc_msgSend(a3, "shadow"), "isEnabled") & 1) == 0))
  {
    id v6 = (id)objc_msgSend((id)objc_msgSend(a3, "style"), "copyWithContext:", objc_msgSend(a4, "context"));
    objc_msgSend(v6, "setBoxedValue:forProperty:", +[TSDShadow shadowWithAngle:offset:radius:opacity:color:enabled:](TSDShadow, "shadowWithAngle:offset:radius:opacity:color:enabled:", objc_msgSend((id)objc_msgSend(MEMORY[0x263F7C808], "blackColor"), "CGColor"), 1, 0.0, 0.0, 4.0, 0.45), 520);
    [a3 setStyle:v6];
  }
}

- (id)imageForShapePreset:(id)a3 imageSize:(CGSize)a4 imageScale:(double)a5 shapeType:(int)a6 angle:(double)a7 documentRoot:(id)a8
{
  uint64_t v10 = *(void *)&a6;
  double height = a4.height;
  double width = a4.width;
  objc_opt_class();
  id v15 = (id)objc_msgSend((id)TSUDynamicCast(), "copyWithContext:", objc_msgSend(a8, "context"));
  [(TSDSwatchCache *)self shapeSwatchInset];
  double v17 = v16;
  double v19 = v18;
  uint64_t v20 = [v15 boxedValueForProperty:520];
  if (!v20 || v20 == [MEMORY[0x263EFF9D0] null])
  {
    int v21 = 0;
  }
  else
  {
    [v15 constrainShadowForSwatchGeneration];
    int v21 = 1;
  }
  v22 = (void *)[v15 boxedValueForProperty:517];
  if (!v22 || v22 == (void *)[MEMORY[0x263EFF9D0] null])
  {
    int v23 = 0;
  }
  else
  {
    [v15 constrainStrokeForSwatchGeneration];
    int v23 = 1;
  }
  uint64_t v24 = [v15 boxedObjectForProperty:519];
  if (v24 && v24 != [MEMORY[0x263EFF9D0] null]) {
    [v15 fadeReflectionForSwatchGeneration];
  }
  if ((v21 & 1) != 0 || v10 <= 0x13 && ((1 << v10) & 0xC0004) != 0)
  {
    double v17 = v17 + 3.0;
    double v19 = v19 + 3.0;
  }
  double v25 = width - v17 * 2.0;
  double v26 = height - v19 * 2.0;
  if (v23)
  {
    double v54 = 1.0;
    if ([v22 isFrame])
    {
      v27 = (void *)[v15 boxedValueForProperty:517];
      [v27 coverageRect:TSDRectWithSize()];
      BOOL v30 = v29 - width <= v17 + v17 && v28 - height <= v19 + v19;
      if (!v30
        || ([v27 coverageRect:TSDRectWithSize()],
            (objc_msgSend(v27, "shouldRenderForSizeIncludingCoverage:", v52, v53) & 1) == 0))
      {
        double v54 = 2.0;
        double v25 = TSDMultiplySizeScalar(width - v17 * 2.0, height - v19 * 2.0, 2.0);
        double v26 = v31;
        double v17 = TSDMultiplySizeScalar(v17, v19, 2.0);
        double v19 = v32;
      }
    }
  }
  else
  {
    double v54 = 1.0;
  }
  objc_msgSend(v15, "fixImageFillTechniqueForSwatchOfSize:", v25, v26);
  if (v10 > 0x13) {
    goto LABEL_34;
  }
  if (((1 << v10) & 0xD8006) == 0)
  {
    if (v10 == 9)
    {
      double v35 = 0.0;
      if (v21) {
        double v35 = 3.0;
      }
      double v25 = v25 + 8.0;
      double v33 = v26 + v35 * -2.0;
      double v17 = v17 + -4.0;
      double v19 = v35 + v19;
      goto LABEL_49;
    }
LABEL_34:
    unsigned int v36 = v10 - 13;
    double v37 = 7.0;
    if (v21) {
      double v37 = 9.0;
    }
    double v38 = v25 - v37;
    double v39 = v26 + 0.0;
    double v40 = v37 + v17;
    if (v10 != 12)
    {
      double v38 = v25;
      double v39 = v26;
      double v40 = v17;
    }
    double v41 = 4.0;
    if (v21) {
      double v41 = 2.0;
    }
    double v42 = v25 + v41 * 2.0;
    double v43 = v26 + v41 * 2.0;
    double v44 = v17 - v41;
    if (v36 <= 1) {
      double v25 = v42;
    }
    else {
      double v25 = v38;
    }
    if (v36 <= 1) {
      double v33 = v43;
    }
    else {
      double v33 = v39;
    }
    if (v36 <= 1) {
      double v17 = v44;
    }
    else {
      double v17 = v40;
    }
    goto LABEL_49;
  }
  double v19 = v26 * 0.5 + v19;
  if (a7 != 0.0)
  {
    double v25 = hypot(v25, v26);
    double v17 = 0.0;
  }
  double v33 = 0.0;
  v34 = -[TSDInfoGeometry initWithPosition:size:angle:]([TSDInfoGeometry alloc], "initWithPosition:size:angle:", v17, v19, v25, 0.0, a7);
  if (!v34) {
LABEL_49:
  }
    v34 = -[TSDInfoGeometry initWithPosition:size:]([TSDInfoGeometry alloc], "initWithPosition:size:", v17, v19, v25, v33);
  v45 = v34;
  v46 = objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithContext:geometry:style:pathSource:", objc_msgSend(a8, "context"), v34, v15, +[TSDPathSource pathSourceForShapeType:naturalSize:](TSDPathSource, "pathSourceForShapeType:naturalSize:", v10, v25, v33));
  if (v10 == 15)
  {
    objc_msgSend(v46, "setHeadLineEnd:", +[TSDLineEnd openArrow](TSDLineEnd, "openArrow"));
    objc_msgSend(v46, "setTailLineEnd:", +[TSDLineEnd simpleArrow](TSDLineEnd, "simpleArrow"));
  }
  else if (v10 == 16)
  {
    objc_msgSend(v46, "setHeadLineEnd:", +[TSDLineEnd simpleArrow](TSDLineEnd, "simpleArrow"));
  }
  [(TSDSwatchCache *)self applyFakeShadowForWhitePresetsIfNecessary:v46 documentRoot:a8];
  v47 = [[TSDImager alloc] initWithDocumentRoot:a8];
  [(TSDImager *)v47 setScaledImageSize:TSDMultiplySizeScalar(width, height, a5)];
  TSDMultiplySizeScalar(width, height, v54);
  [(TSDImager *)v47 setUnscaledClipRect:TSDRectWithSize()];
  -[TSDImager setInfos:](v47, "setInfos:", [MEMORY[0x263EFF8C0] arrayWithObject:v46]);
  [MEMORY[0x263F158F8] begin];
  [MEMORY[0x263F158F8] setDisableActions:1];
  v48 = [(TSDImager *)v47 newImage];
  if (v10 <= 0x13 && ((1 << v10) & 0xC0004) != 0)
  {
    objc_opt_class();
    v49 = -[TSDSwatchCache p_newImageWithConnectionLineKnobsForShape:atScale:ofSize:overImage:](self, "p_newImageWithConnectionLineKnobsForShape:atScale:ofSize:overImage:", TSUDynamicCast(), v48, a5, width, height);
    CGImageRelease(v48);
    v48 = v49;
  }
  v50 = (void *)[MEMORY[0x263F7C858] imageWithCGImage:v48 scale:0 orientation:a5];
  CGImageRelease(v48);
  [MEMORY[0x263F158F8] commit];

  return v50;
}

- (id)imageForImagePreset:(id)a3 imageSize:(CGSize)a4 imageScale:(double)a5 imageInfo:(id)a6 shouldClipVertically:(BOOL)a7 documentRoot:(id)a8
{
  double height = a4.height;
  CGFloat width = a4.width;
  int v14 = TSUPhoneUI();
  double v112 = width;
  double v15 = 3.0;
  if (v14) {
    double v16 = 3.0;
  }
  else {
    double v16 = 2.0;
  }
  double v17 = 30.0;
  if (v14) {
    double v17 = 8.0;
  }
  double v18 = v17 + (v112 - v112) * 0.5;
  if (!v14) {
    double v15 = 1.0;
  }
  double v19 = v15 * (v17 + (height - height) * 0.25);
  double v20 = v16 * (v112 - v17);
  double v21 = v16 * (height - v17);
  objc_opt_class();
  id v22 = (id)objc_msgSend((id)TSUDynamicCast(), "copyWithContext:", objc_msgSend(a8, "context"));
  objc_msgSend((id)objc_msgSend(a6, "geometry"), "size");
  double v24 = v23;
  double v111 = v25;
  objc_opt_class();
  [v22 valueForProperty:517];
  double v26 = (void *)TSUDynamicCast();
  if (v26)
  {
    objc_msgSend(v26, "coverageRect:", v18, v19, v20, v21);
    BOOL v29 = v28 < 0.0;
    *(float *)&double v28 = v28;
    double v30 = roundf(*(float *)&v28);
    double v31 = v19 - v30;
    double v32 = v21 + v30;
    if (v29) {
      double v21 = v32;
    }
    if (v29) {
      double v19 = v31;
    }
    BOOL v33 = v27 < 0.0;
    float v34 = v27;
    double v35 = roundf(v34);
    double v36 = v18 - v35;
    double v37 = v20 + v35;
    if (v33) {
      double v20 = v37;
    }
    if (v33) {
      double v18 = v36;
    }
  }
  objc_opt_class();
  [v22 valueForProperty:520];
  if (TSUDynamicCast())
  {
    [v22 constrainShadowForSwatchGeneration];
    objc_opt_class();
    [v22 valueForProperty:520];
    double v38 = (void *)TSUDynamicCast();
    if ([v38 isDropShadow])
    {
      objc_msgSend(v38, "shadowBoundsForRect:", v18, v19, v20, v21);
      BOOL v29 = v40 < 0.0;
      *(float *)&double v40 = v40;
      double v41 = v21 + roundf(*(float *)&v40);
      if (v29) {
        double v21 = v41;
      }
      BOOL v29 = v39 < 0.0;
      float v42 = v39;
      double v43 = v20 + roundf(v42);
      if (v29) {
        double v20 = v43;
      }
    }
  }
  double v44 = (TSDMaskInfo *)[a6 maskInfo];
  double v108 = v16;
  double v109 = height;
  if (v44)
  {
    if (a7) {
      goto LABEL_31;
    }
  }
  else
  {
    if (![a6 instantAlphaPath])
    {
      if (a7) {
        goto LABEL_38;
      }
      double v44 = 0;
      goto LABEL_42;
    }
    double v44 = (TSDMaskInfo *)objc_msgSend(a6, "defaultMaskInfoWithContext:", objc_msgSend(a8, "context"));
    if (a7)
    {
LABEL_31:
      if (v44)
      {
        v45 = [(TSDDrawableInfo *)v44 geometry];
        [(TSDInfoGeometry *)v45 size];
        double v48 = TSDScaleSizeWithinSize(v20, v21, v46, v47);
        double v50 = v49;
        [(TSDInfoGeometry *)v45 center];
        double v52 = v51;
        double v54 = v53;
        id v55 = +[TSDScalarPathSource rectangleWithNaturalSize:](TSDScalarPathSource, "rectangleWithNaturalSize:", v48, v50);
        v56 = [TSDInfoGeometry alloc];
        double v57 = v52;
        double v58 = v54;
        double v59 = v48;
        double v60 = v50;
        goto LABEL_39;
      }
LABEL_38:
      double v63 = TSDScaleSizeWithinSize(v20, v21, v24, v111);
      double v65 = v64;
      id v55 = +[TSDScalarPathSource rectangleWithNaturalSize:v63];
      v56 = [TSDInfoGeometry alloc];
      double v57 = v24 * 0.5;
      double v58 = v111 * 0.5;
      double v59 = v63;
      double v60 = v65;
LABEL_39:
      v66 = -[TSDInfoGeometry initWithCenter:size:](v56, "initWithCenter:size:", v57, v58, v59, v60);
      double v44 = -[TSDMaskInfo initWithContext:geometry:pathSource:]([TSDMaskInfo alloc], "initWithContext:geometry:pathSource:", [a8 context], v66, v55);

      if (!v44) {
        goto LABEL_56;
      }
      goto LABEL_47;
    }
  }
  if (v44)
  {
    [(TSDInfoGeometry *)[(TSDDrawableInfo *)v44 geometry] size];
    goto LABEL_43;
  }
LABEL_42:
  double v62 = v111;
  double v61 = v24;
LABEL_43:
  double v67 = v61 / v62;
  if (v67 <= v112 / height)
  {
    double v20 = v21 * v67;
    if (!v44) {
      goto LABEL_56;
    }
  }
  else
  {
    double v21 = v20 / v67;
    if (!v44) {
      goto LABEL_56;
    }
  }
LABEL_47:
  v68 = [(TSDDrawableInfo *)v44 geometry];
  [(TSDInfoGeometry *)v68 size];
  double v71 = v20 / v70;
  BOOL v72 = v70 <= 0.0;
  double v73 = 1.0;
  if (v72) {
    double v71 = 1.0;
  }
  if (v69 > 0.0) {
    double v73 = v21 / v69;
  }
  if (v71 <= v73) {
    double v74 = v73;
  }
  else {
    double v74 = v71;
  }
  [(TSDInfoGeometry *)v68 position];
  double v77 = TSDMultiplyPointScalar(v75, v76, v74);
  double v79 = v78;
  id v80 = +[TSDScalarPathSource rectangleWithNaturalSize:](TSDScalarPathSource, "rectangleWithNaturalSize:", v20, v21);
  v81 = -[TSDInfoGeometry initWithPosition:size:]([TSDInfoGeometry alloc], "initWithPosition:size:", v77, v79, v20, v21);
  double v44 = -[TSDMaskInfo initWithContext:geometry:pathSource:]([TSDMaskInfo alloc], "initWithContext:geometry:pathSource:", [a8 context], v81, v80);

LABEL_56:
  double v82 = TSDRoundedSize();
  double v84 = v83;
  double v85 = TSDRoundedPoint();
  double v87 = v86;
  uint64_t v88 = [v22 boxedObjectForProperty:519];
  if (v88 && v88 != [MEMORY[0x263EFF9D0] null]) {
    [v22 fadeReflectionForSwatchGeneration];
  }
  v89 = -[TSDInfoGeometry initWithPosition:size:]([TSDInfoGeometry alloc], "initWithPosition:size:", v85, v87, v82, v84);
  id v90 = (id)[a6 thumbnailImageData];
  if (!v90) {
    id v90 = -[TSDSwatchCache p_thumbnailImageDataForImageData:](self, "p_thumbnailImageDataForImageData:", [a6 imageData]);
  }
  v91 = -[TSDImageInfo initWithContext:geometry:style:imageData:originalImageData:]([TSDImageInfo alloc], "initWithContext:geometry:style:imageData:originalImageData:", [a8 context], v89, v22, v90, 0);
  [(TSDImageInfo *)v91 setMaskInfo:v44];
  if ([a6 instantAlphaPath])
  {
    objc_msgSend((id)objc_msgSend(+[TSDImageProviderPool sharedPool](TSDImageProviderPool, "sharedPool"), "temporaryProviderForData:shouldValidate:", v90, 1), "naturalSize");
    double v93 = v92;
    double v95 = v94;
    [a6 naturalSize];
    CGFloat v97 = v93 / v96;
    CGFloat v99 = v95 / v98;
    v100 = objc_msgSend((id)objc_msgSend(a6, "instantAlphaPath"), "copy");
    CGAffineTransformMakeScale(&v113, v97, v99);
    [v100 transformUsingAffineTransform:&v113];
    [(TSDImageInfo *)v91 setInstantAlphaPath:v100];
  }
  v101 = [[TSDImager alloc] initWithDocumentRoot:a8];
  [(TSDImager *)v101 setScaledImageSize:TSDMultiplySizeScalar(v112, v109, a5)];
  double v102 = TSDMultiplySizeScalar(v112, v109, v108);
  [(TSDImager *)v101 setUnscaledClipRect:TSDRectWithOriginAndSize(v103, *MEMORY[0x263F00148], *(double *)(MEMORY[0x263F00148] + 8), v102, v104)];
  -[TSDImager setInfos:](v101, "setInfos:", [MEMORY[0x263EFF8C0] arrayWithObject:v91]);
  [MEMORY[0x263F158F8] begin];
  [MEMORY[0x263F158F8] setDisableActions:1];
  v105 = [(TSDImager *)v101 newImage];
  v106 = (void *)[MEMORY[0x263F7C858] imageWithCGImage:v105 scale:0 orientation:a5];
  CGImageRelease(v105);
  [MEMORY[0x263F158F8] commit];

  return v106;
}

- (id)imageForShapePreset:(id)a3 imageSize:(CGSize)a4 imageScale:(double)a5 swatchFrame:(CGRect)a6 shapeType:(int)a7 angle:(double)a8 documentRoot:(id)a9
{
  uint64_t v10 = *(void *)&a7;
  double height = a6.size.height;
  double width = a6.size.width;
  double y = a6.origin.y;
  double x = a6.origin.x;
  double v16 = a4.height;
  double v17 = a4.width;
  objc_opt_class();
  id v19 = (id)objc_msgSend((id)TSUDynamicCast(), "copyWithContext:", objc_msgSend(a9, "context"));
  uint64_t v20 = [v19 boxedValueForProperty:520];
  if (v20)
  {
    if (v20 == [MEMORY[0x263EFF9D0] null])
    {
      LODWORD(v20) = 0;
    }
    else
    {
      [v19 constrainShadowForSwatchGeneration];
      LODWORD(v20) = 1;
    }
  }
  objc_msgSend(v19, "fixImageFillTechniqueForSwatchOfSize:", width, height);
  BOOL v21 = (v10 & 0xFFFFFFEF) == 2 || v10 == 19;
  if (v10 > 0x13) {
    goto LABEL_41;
  }
  if (((1 << v10) & 0x18002) != 0)
  {
    double v28 = hypot(width, height);
    v82.origin.double x = x;
    v82.origin.double y = y;
    v82.size.double width = width;
    v82.size.double height = height;
    double y = CGRectGetMidY(v82);
    v83.origin.double x = x;
    v83.origin.double y = y;
    v83.size.double width = width;
    v83.size.double height = height;
    double x = CGRectGetMidX(v83) + v28 * -0.5;
    double height = 0.0;
    double width = v28;
    goto LABEL_15;
  }
  if (((1 << v10) & 0xC0004) != 0)
  {
    CGFloat v22 = 6.0;
    CGFloat v23 = 6.0;
LABEL_12:
    double v24 = x;
    double v25 = y;
    double v26 = width;
LABEL_13:
    double v27 = height;
    CGRect v81 = CGRectInset(*(CGRect *)&v24, v22, v23);
    double x = v81.origin.x;
    double y = v81.origin.y;
    double width = v81.size.width;
    double height = v81.size.height;
    goto LABEL_15;
  }
  if (v10 == 9)
  {
    double x = 0.0;
    if (v20)
    {
      double v24 = 0.0;
      CGFloat v22 = 4.0;
      CGFloat v23 = 0.0;
      double v25 = y;
      double v26 = v17;
      goto LABEL_13;
    }
    double width = v17;
  }
  else
  {
LABEL_41:
    if ((v10 - 13) > 1)
    {
      if (v10 == 12)
      {
        objc_msgSend((id)objc_msgSend(+[TSDPathSource pathSourceForShapeType:naturalSize:](TSDPathSource, "pathSourceForShapeType:naturalSize:", 12, width, height), "bezierPath"), "bounds");
        CGFloat v72 = v52;
        CGFloat v54 = x + v53;
        CGFloat v73 = x + v53;
        CGFloat v74 = v55;
        CGFloat v75 = y + v56;
        double v71 = TSDRectWithSize();
        CGFloat v78 = v58;
        CGFloat v79 = v57;
        CGFloat rect = v59;
        v84.origin.double x = v54;
        v84.size.double width = v74;
        v84.origin.double y = v75;
        v84.size.double height = v72;
        double MinX = CGRectGetMinX(v84);
        v85.origin.double x = v71;
        v85.size.double width = v78;
        v85.origin.double y = v79;
        v85.size.double height = rect;
        double v70 = MinX - CGRectGetMinX(v85);
        v86.origin.double x = v73;
        v86.size.double width = v74;
        v86.origin.double y = v75;
        v86.size.double height = v72;
        double MaxX = CGRectGetMaxX(v86);
        v87.origin.double x = v71;
        v87.size.double width = v78;
        v87.origin.double y = v79;
        v87.size.double height = rect;
        double v68 = MaxX - CGRectGetMaxX(v87);
        v88.origin.double x = v73;
        v88.size.double width = v74;
        v88.origin.double y = v75;
        v88.size.double height = v72;
        double MinY = CGRectGetMinY(v88);
        v89.origin.double x = v71;
        v89.size.double width = v78;
        v89.origin.double y = v79;
        v89.size.double height = rect;
        double v60 = MinY - CGRectGetMinY(v89);
        v90.origin.double x = v73;
        v90.size.double width = v74;
        v90.origin.double y = v75;
        v90.size.double height = v72;
        double MaxY = CGRectGetMaxY(v90);
        v91.origin.double x = v71;
        v91.size.double width = v78;
        v91.origin.double y = v79;
        v91.size.double height = rect;
        double v61 = MaxY - CGRectGetMaxY(v91);
        double v62 = x - fmin(v70, 0.0);
        double v63 = v70;
        double v64 = -0.0;
        if (v70 >= 0.0) {
          double v63 = -0.0;
        }
        double v65 = width + v63 - fmax(v68, 0.0);
        double y = y - fmin(v60, 0.0);
        if (v60 < 0.0) {
          double v64 = v60;
        }
        double height = height + v64 - fmax(v61, 0.0);
        if (v20) {
          double x = v62 + 4.0;
        }
        else {
          double x = v62;
        }
        if (v20) {
          double width = v65 + -4.0;
        }
        else {
          double width = v65;
        }
      }
    }
    else
    {
      double x = TSDRectWithSize();
      double y = v49;
      double width = v50;
      double height = v51;
      if (v20)
      {
        CGFloat v22 = 4.0;
        CGFloat v23 = 4.0;
        goto LABEL_12;
      }
    }
  }
LABEL_15:
  objc_opt_class();
  [v19 valueForProperty:517];
  BOOL v29 = (void *)TSUDynamicCast();
  if (v29)
  {
    if (v10 > 0x13 || (double v30 = 2.0, ((1 << v10) & 0xD8006) == 0)) {
      objc_msgSend(v29, "width", v30, *(void *)&MinY);
    }
    if (v30 >= width) {
      double v31 = width;
    }
    else {
      double v31 = v30;
    }
    if (v30 >= height) {
      double v30 = height;
    }
    double x = x + v31;
    double width = width - v31 * 2.0;
    double y = y + v30;
    double height = height - v30 * 2.0;
  }
  double v32 = TSDRoundedRect(x, y, width, height);
  double v34 = v33;
  double v36 = v35;
  double v38 = v37;
  uint64_t v39 = [v19 boxedObjectForProperty:519];
  if (v39 && v39 != [MEMORY[0x263EFF9D0] null]) {
    [v19 fadeReflectionForSwatchGeneration];
  }
  if (v21) {
    double v40 = 0.0;
  }
  else {
    double v40 = a8;
  }
  double v41 = -[TSDInfoGeometry initWithPosition:size:angle:]([TSDMutableInfoGeometry alloc], "initWithPosition:size:angle:", v32, v34, v36, v38, v40);
  [(TSDInfoGeometry *)v41 size];
  id v42 = +[TSDPathSource pathSourceForShapeType:naturalSize:](TSDPathSource, "pathSourceForShapeType:naturalSize:", v10);
  [v42 naturalSize];
  -[TSDMutableInfoGeometry setSize:](v41, "setSize:");
  double v43 = objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithContext:geometry:style:pathSource:", objc_msgSend(a9, "context"), v41, v19, v42);
  if (v10 == 15)
  {
    objc_msgSend(v43, "setHeadLineEnd:", +[TSDLineEnd openArrow](TSDLineEnd, "openArrow"));
    objc_msgSend(v43, "setTailLineEnd:", +[TSDLineEnd simpleArrow](TSDLineEnd, "simpleArrow"));
  }
  else if (v10 == 16)
  {
    objc_msgSend(v43, "setHeadLineEnd:", +[TSDLineEnd simpleArrow](TSDLineEnd, "simpleArrow"));
  }
  -[TSDSwatchCache applyFakeShadowForWhitePresetsIfNecessary:documentRoot:](self, "applyFakeShadowForWhitePresetsIfNecessary:documentRoot:", v43, a9, *(void *)&MinY);
  double v44 = [[TSDImager alloc] initWithDocumentRoot:a9];
  [(TSDImager *)v44 setScaledImageSize:TSDMultiplySizeScalar(v17, v16, a5)];
  -[TSDImager setUnscaledClipRect:](v44, "setUnscaledClipRect:", 0.0, 0.0, v17, v16);
  -[TSDImager setInfos:](v44, "setInfos:", [MEMORY[0x263EFF8C0] arrayWithObject:v43]);
  [MEMORY[0x263F158F8] begin];
  [MEMORY[0x263F158F8] setDisableActions:1];
  v45 = [(TSDImager *)v44 newImage];
  if (v10 <= 0x13 && ((1 << v10) & 0xC0004) != 0)
  {
    objc_opt_class();
    double v46 = -[TSDSwatchCache p_newImageWithConnectionLineKnobsForShape:atScale:ofSize:overImage:](self, "p_newImageWithConnectionLineKnobsForShape:atScale:ofSize:overImage:", TSUDynamicCast(), v45, a5, v17, v16);
    CGImageRelease(v45);
    v45 = v46;
  }
  double v47 = (void *)[MEMORY[0x263F7C858] imageWithCGImage:v45 scale:0 orientation:a5];
  CGImageRelease(v45);
  [MEMORY[0x263F158F8] commit];

  return v47;
}

- (CGImage)p_newImageWithConnectionLineKnobsForShape:(id)a3 atScale:(double)a4 ofSize:(CGSize)a5 overImage:(CGImage *)a6
{
  double v9 = TSDMultiplySizeScalar(a5.width, a5.height, a4);
  uint64_t v11 = v10;
  v12 = TSDBitmapContextCreate(3, v9);
  v13 = (void *)[MEMORY[0x263F7C858] imageNamed:@"sf-ios-canvas-knob-blue" inBundle:TSDBundle()];
  int v14 = (void *)[MEMORY[0x263F7C858] imageNamed:@"sf-ios-canvas-knob-green" inBundle:TSDBundle()];
  [v13 size];
  double v16 = v15;
  double v18 = v17;
  uint64_t v65 = 0;
  v66 = (double *)&v65;
  uint64_t v67 = 0x3010000000;
  double v68 = &unk_22389B221;
  long long v69 = *MEMORY[0x263F00148];
  uint64_t v60 = 0;
  double v61 = (double *)&v60;
  uint64_t v62 = 0x3010000000;
  double v63 = &unk_22389B221;
  long long v64 = v69;
  uint64_t v55 = 0;
  double v56 = (double *)&v55;
  uint64_t v57 = 0x3010000000;
  double v58 = &unk_22389B221;
  long long v59 = v69;
  v54[0] = MEMORY[0x263EF8330];
  v54[1] = 3221225472;
  v54[2] = __85__TSDSwatchCache_p_newImageWithConnectionLineKnobsForShape_atScale_ofSize_overImage___block_invoke;
  v54[3] = &unk_2646B1D20;
  v54[4] = &v65;
  v54[5] = &v60;
  v54[6] = &v55;
  *(double *)&v54[7] = a4;
  *(double *)&v54[8] = v9;
  v54[9] = v11;
  [a3 performBlockWithTemporaryLayout:v54];
  double v19 = TSDRectWithSize();
  CGFloat v52 = v20;
  CGFloat v53 = v19;
  CGFloat v50 = v22;
  CGFloat v51 = v21;
  double v23 = TSDMultiplySizeScalar(v16, v18, a4);
  TSDRectWithCenterAndSize(v61[4], v61[5], v23);
  CGFloat v47 = v25;
  CGFloat v48 = v24;
  TSDRectWithCenterAndSize(v66[4], v66[5], v23);
  CGFloat v44 = v27;
  CGFloat v45 = v26;
  TSDRectWithCenterAndSize(v56[4], v56[5], v23);
  CGFloat v29 = v28;
  CGFloat rect = v30;
  double v31 = TSDRoundedPoint();
  CGFloat v46 = v32;
  double v33 = TSDRoundedPoint();
  CGFloat v35 = v34;
  double v36 = TSDRoundedPoint();
  CGFloat v38 = v37;
  v70.origin.double y = v52;
  v70.origin.double x = v53;
  v70.size.double height = v50;
  v70.size.double width = v51;
  CGContextDrawImage(v12, v70, a6);
  uint64_t v39 = (CGImage *)[v13 CGImageForContentsScale:a4];
  v71.origin.double x = v36;
  v71.origin.double y = v38;
  v71.size.double width = v29;
  v71.size.double height = rect;
  CGContextDrawImage(v12, v71, v39);
  double v40 = (CGImage *)[v14 CGImageForContentsScale:a4];
  v72.origin.double x = v31;
  v72.origin.double y = v46;
  v72.size.double height = v47;
  v72.size.double width = v48;
  CGContextDrawImage(v12, v72, v40);
  double v41 = (CGImage *)[v13 CGImageForContentsScale:a4];
  v73.origin.double x = v33;
  v73.origin.double y = v35;
  v73.size.double height = v44;
  v73.size.double width = v45;
  CGContextDrawImage(v12, v73, v41);
  Image = CGBitmapContextCreateImage(v12);
  CGContextRelease(v12);
  _Block_object_dispose(&v55, 8);
  _Block_object_dispose(&v60, 8);
  _Block_object_dispose(&v65, 8);
  return Image;
}

CGFloat __85__TSDSwatchCache_p_newImageWithConnectionLineKnobsForShape_atScale_ofSize_overImage___block_invoke(uint64_t a1)
{
  objc_opt_class();
  uint64_t v2 = (void *)TSUDynamicCast();
  [v2 tailPoint];
  uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 8);
  *(void *)(v3 + 32) = v4;
  *(void *)(v3 + 40) = v5;
  [v2 getControlKnobPosition:12];
  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
  *(void *)(v6 + 32) = v7;
  *(void *)(v6 + 40) = v8;
  [v2 headPoint];
  uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
  *(void *)(v9 + 32) = v10;
  *(void *)(v9 + 40) = v11;
  memset(&v37, 0, sizeof(v37));
  if (v2) {
    [v2 transformInRoot];
  }
  CGAffineTransformMakeScale(&t2, *(CGFloat *)(a1 + 56), *(CGFloat *)(a1 + 56));
  CGAffineTransform t1 = v37;
  CGAffineTransformConcat(&v36, &t1, &t2);
  CGAffineTransform v37 = v36;
  double v12 = TSDRectWithSize();
  TSDAffineTransformForFlips(0, 1, (uint64_t)&v33, v12, v13, v14, v15);
  CGAffineTransform t1 = v37;
  CGAffineTransformConcat(&v36, &t1, &v33);
  CGAffineTransform v37 = v36;
  uint64_t v16 = *(void *)(*(void *)(a1 + 32) + 8);
  double v17 = *(double *)(v16 + 32);
  double v18 = *(double *)(v16 + 40);
  long long v19 = *(_OWORD *)&v36.a;
  long long v20 = *(_OWORD *)&v36.c;
  CGFloat v21 = v36.tx + v18 * v36.c + v36.a * v17;
  CGFloat v22 = v36.ty + v18 * v36.d + v36.b * v17;
  *(CGFloat *)(v16 + 32) = v21;
  *(CGFloat *)(v16 + 40) = v22;
  uint64_t v23 = *(void *)(*(void *)(a1 + 40) + 8);
  double v24 = *(double *)(v23 + 32);
  double v25 = *(double *)(v23 + 40);
  double v26 = *(double *)&v20 * v25 + *(double *)&v19 * v24;
  CGFloat v27 = v37.ty + *((double *)&v20 + 1) * v25 + *((double *)&v19 + 1) * v24;
  *(double *)(v23 + 32) = v37.tx + v26;
  *(CGFloat *)(v23 + 40) = v27;
  uint64_t v28 = *(void *)(*(void *)(a1 + 48) + 8);
  double v29 = *(double *)(v28 + 32);
  double v30 = *(double *)(v28 + 40);
  CGFloat v31 = v37.tx + *(double *)&v20 * v30 + *(double *)&v19 * v29;
  CGFloat result = v37.ty + *((double *)&v20 + 1) * v30 + *((double *)&v19 + 1) * v29;
  *(CGFloat *)(v28 + 32) = v31;
  *(CGFloat *)(v28 + 40) = result;
  return result;
}

- (id)imageForImagePreset:(id)a3 imageSize:(CGSize)a4 imageScale:(double)a5 swatchFrame:(CGRect)a6 imageInfo:(id)a7 shouldClipVertically:(BOOL)a8 documentRoot:(id)a9
{
  CGFloat height = a6.size.height;
  CGFloat width = a6.size.width;
  CGFloat y = a6.origin.y;
  double x = a6.origin.x;
  double v15 = a4.height;
  double v81 = a4.width;
  if (a4.width < CGRectGetMaxX(a6)
    || (v85.origin.x = x, v85.origin.y = y, v85.size.width = width, v85.size.CGFloat height = height, v15 < CGRectGetMaxY(v85)))
  {
    uint64_t v16 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v17 = [NSString stringWithUTF8String:"-[TSDSwatchCache imageForImagePreset:imageSize:imageScale:swatchFrame:imageInfo:shouldClipVertically:documentRoot:]"];
    objc_msgSend(v16, "handleFailureInFunction:file:lineNumber:description:", v17, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDSwatchCache.m"), 1059, @"imageSize must enclose swatchFrame");
  }
  double v18 = TSDMultiplyRectScalar(x, y, width, height, 2.0);
  double v20 = v19;
  double v22 = v21;
  double v24 = v23;
  objc_opt_class();
  id v25 = (id)objc_msgSend((id)TSUDynamicCast(), "copyWithContext:", objc_msgSend(a9, "context"));
  objc_msgSend((id)objc_msgSend(a7, "geometry"), "size");
  double v79 = v27;
  double v80 = v26;
  uint64_t v28 = [v25 boxedValueForProperty:520];
  if (v28 && v28 != [MEMORY[0x263EFF9D0] null]) {
    [v25 constrainShadowForSwatchGeneration];
  }
  double v82 = v15;
  double v29 = (void *)[a7 maskInfo];
  if (!v29) {
    double v29 = objc_msgSend(a7, "defaultMaskInfoWithContext:", objc_msgSend(a9, "context"));
  }
  double v30 = (void *)[v29 geometry];
  [v30 size];
  double v33 = TSDScaleSizeWithinSize(v22, v24, v31, v32);
  double v35 = v34;
  [v30 center];
  CGFloat v38 = -[TSDMaskInfo initWithContext:geometry:pathSource:]([TSDMaskInfo alloc], "initWithContext:geometry:pathSource:", [a9 context], -[TSDInfoGeometry initWithCenter:size:]([TSDInfoGeometry alloc], "initWithCenter:size:", v36, v37, v33, v35), +[TSDScalarPathSource rectangleWithNaturalSize:](TSDScalarPathSource, "rectangleWithNaturalSize:", v33, v35));
  if (v38)
  {
    uint64_t v39 = [(TSDDrawableInfo *)v38 geometry];
    [(TSDInfoGeometry *)v39 size];
    double v41 = v22 / v40;
    double v43 = v24 / v42;
    if (v41 <= v43) {
      double v44 = v43;
    }
    else {
      double v44 = v41;
    }
    [(TSDInfoGeometry *)v39 position];
    double v47 = TSDMultiplyPointScalar(v45, v46, v44);
    double v49 = v48;
    CGFloat v50 = -[TSDMaskInfo initWithContext:geometry:pathSource:]([TSDMaskInfo alloc], "initWithContext:geometry:pathSource:", [a9 context], -[TSDInfoGeometry initWithPosition:size:]([TSDInfoGeometry alloc], "initWithPosition:size:", v47, v48, v22, v24), +[TSDScalarPathSource rectangleWithNaturalSize:](TSDScalarPathSource, "rectangleWithNaturalSize:", v22, v24));
    double v22 = v80 * v44;
    double v24 = v79 * v44;
    double v18 = v18 - v47;
    double v20 = v20 - v49;
  }
  else
  {
    CGFloat v50 = 0;
  }
  double v51 = TSDRoundedRect(v18, v20, v22, v24);
  double v53 = v52;
  double v55 = v54;
  double v57 = v56;
  uint64_t v58 = [v25 boxedObjectForProperty:519];
  if (v58 && v58 != [MEMORY[0x263EFF9D0] null]) {
    [v25 fadeReflectionForSwatchGeneration];
  }
  long long v59 = -[TSDInfoGeometry initWithPosition:size:]([TSDInfoGeometry alloc], "initWithPosition:size:", v51, v53, v55, v57);
  id v60 = (id)[a7 thumbnailImageData];
  if (!v60) {
    id v60 = -[TSDSwatchCache p_thumbnailImageDataForImageData:](self, "p_thumbnailImageDataForImageData:", [a7 imageData]);
  }
  double v61 = -[TSDImageInfo initWithContext:geometry:style:imageData:originalImageData:]([TSDImageInfo alloc], "initWithContext:geometry:style:imageData:originalImageData:", [a9 context], v59, v25, v60, 0);
  [(TSDImageInfo *)v61 setMaskInfo:v50];
  if ([a7 instantAlphaPath])
  {
    objc_msgSend((id)objc_msgSend(+[TSDImageProviderPool sharedPool](TSDImageProviderPool, "sharedPool"), "temporaryProviderForData:shouldValidate:", v60, 1), "naturalSize");
    double v63 = v62;
    double v65 = v64;
    [a7 naturalSize];
    CGFloat v67 = v63 / v66;
    CGFloat v69 = v65 / v68;
    CGRect v70 = objc_msgSend((id)objc_msgSend(a7, "instantAlphaPath"), "copy");
    CGAffineTransformMakeScale(&v84, v67, v69);
    [v70 transformUsingAffineTransform:&v84];
    [(TSDImageInfo *)v61 setInstantAlphaPath:v70];
  }
  CGRect v71 = [[TSDImager alloc] initWithDocumentRoot:a9];
  [(TSDImager *)v71 setScaledImageSize:TSDMultiplySizeScalar(v81, v82, a5)];
  double v72 = TSDMultiplySizeScalar(v81, v82, 2.0);
  [(TSDImager *)v71 setUnscaledClipRect:TSDRectWithOriginAndSize(v73, *MEMORY[0x263F00148], *(double *)(MEMORY[0x263F00148] + 8), v72, v74)];
  -[TSDImager setInfos:](v71, "setInfos:", [MEMORY[0x263EFF8C0] arrayWithObject:v61]);
  [MEMORY[0x263F158F8] begin];
  [MEMORY[0x263F158F8] setDisableActions:1];
  CGFloat v75 = [(TSDImager *)v71 newImage];
  double v76 = (void *)[MEMORY[0x263F7C858] imageWithCGImage:v75 scale:0 orientation:a5];
  CGImageRelease(v75);
  [MEMORY[0x263F158F8] commit];

  return v76;
}

- (CGSize)imageSizeForPreset:(id)a3 swatchSize:(CGSize)a4
{
  double v4 = TSDRectWithSize();
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  objc_opt_class();
  uint64_t v11 = (void *)TSUDynamicCast();
  id v12 = (id)objc_msgSend(v11, "copyWithContext:", objc_msgSend(v11, "context"));
  if (v12)
  {
    CGFloat v13 = v12;
    double v14 = TSDMultiplyRectScalar(v4, v6, v8, v10, 2.0);
    double v16 = v15;
    double v18 = v17;
    double v20 = v19;
    objc_opt_class();
    [v13 valueForProperty:517];
    double v21 = (void *)TSUDynamicCast();
    if (v21)
    {
      double v22 = v21;
      if ((objc_msgSend((id)objc_msgSend((id)objc_msgSend(v21, "frameSpec"), "frameName"), "isEqualToString:", @"Renaissance 1") & 1) == 0)
      {
        objc_msgSend(v22, "coverageRect:", v14, v16, v18, v20);
        double v14 = v23;
        double v16 = v24;
        double v18 = v25;
        double v20 = v26;
      }
    }
    objc_opt_class();
    [v13 valueForProperty:519];
    TSUDynamicCast();
    objc_opt_class();
    [v13 valueForProperty:520];
    if (TSUDynamicCast())
    {
      [v13 constrainShadowForSwatchGeneration];
      objc_opt_class();
      [v13 valueForProperty:520];
      objc_msgSend((id)TSUDynamicCast(), "shadowBoundsForRect:", v14, v16, v18, v20);
      double v14 = v27;
      double v16 = v28;
      double v18 = v29;
      double v20 = v30;
    }
    TSDMultiplyRectScalar(v14, v16, v18, v20, 0.5);
    CGFloat v8 = v31;
    CGFloat v10 = v32;
  }
  double v33 = v8;
  double v34 = v10;
  result.CGFloat height = v34;
  result.CGFloat width = v33;
  return result;
}

- (id)p_maskInfoForMovieInfo:(id)a3 context:(id)a4
{
  double v5 = (void *)[a3 geometry];
  [v5 center];
  double v7 = v6;
  double v9 = v8;
  [v5 position];
  double v11 = TSDSubtractPoints(v7, v9, v10);
  double v13 = v12;
  [v5 size];
  double v15 = v14;
  double v17 = v16;
  id v18 = +[TSDScalarPathSource rectangleWithNaturalSize:](TSDScalarPathSource, "rectangleWithNaturalSize:");
  double v19 = -[TSDInfoGeometry initWithCenter:size:]([TSDInfoGeometry alloc], "initWithCenter:size:", v11, v13, v15, v17);
  double v20 = [[TSDMaskInfo alloc] initWithContext:a4 geometry:v19 pathSource:v18];

  return v20;
}

- (id)p_thumbnailImageDataForImageData:(id)a3
{
  if (p_thumbnailImageDataForImageData__sOnce != -1) {
    dispatch_once(&p_thumbnailImageDataForImageData__sOnce, &__block_literal_global_41);
  }
  double v4 = (void *)p_thumbnailImageDataForImageData__sCache;
  objc_sync_enter((id)p_thumbnailImageDataForImageData__sCache);
  id v5 = (id)[(id)p_thumbnailImageDataForImageData__sCache objectForKey:a3];
  objc_sync_exit(v4);
  if (a3 && !v5) {
    id v5 = TSDResampleImageData(a3, 0, 0, 256.0, 256.0);
  }
  if (!v5 || v5 == a3) {
    return a3;
  }
  double v6 = (void *)p_thumbnailImageDataForImageData__sCache;
  objc_sync_enter((id)p_thumbnailImageDataForImageData__sCache);
  [(id)p_thumbnailImageDataForImageData__sCache setObject:v5 forKey:a3];
  objc_sync_exit(v6);
  return v5;
}

uint64_t __51__TSDSwatchCache_p_thumbnailImageDataForImageData___block_invoke()
{
  uint64_t result = [objc_alloc(MEMORY[0x263F7C868]) initWithMaxSize:1];
  p_thumbnailImageDataForImageData__sCache = result;
  return result;
}

- (id)imageForMoviePreset:(id)a3 imageSize:(CGSize)a4 imageScale:(double)a5 swatchFrame:(CGRect)a6 movieInfo:(id)a7 shouldClipVertically:(BOOL)a8 documentRoot:(id)a9
{
  CGFloat height = a6.size.height;
  CGFloat width = a6.size.width;
  CGFloat y = a6.origin.y;
  double x = a6.origin.x;
  double v15 = a4.height;
  double v63 = a4.width;
  if (a4.width < CGRectGetMaxX(a6)
    || (v66.origin.x = x, v66.origin.y = y, v66.size.width = width, v66.size.CGFloat height = height, v15 < CGRectGetMaxY(v66)))
  {
    double v17 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v18 = [NSString stringWithUTF8String:"-[TSDSwatchCache imageForMoviePreset:imageSize:imageScale:swatchFrame:movieInfo:shouldClipVertically:documentRoot:]"];
    objc_msgSend(v17, "handleFailureInFunction:file:lineNumber:description:", v18, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDSwatchCache.m"), 1392, @"imageSize must enclose swatchFrame");
  }
  double v19 = TSDMultiplyRectScalar(x, y, width, height, 2.0);
  double v21 = v20;
  double v23 = v22;
  double v25 = v24;
  objc_opt_class();
  id v26 = (id)objc_msgSend((id)TSUDynamicCast(), "copyWithContext:", objc_msgSend(a9, "context"));
  objc_msgSend((id)objc_msgSend(a7, "geometry"), "size");
  double v28 = v27;
  double v30 = v29;
  uint64_t v31 = [v26 boxedValueForProperty:520];
  if (v31 && v31 != [MEMORY[0x263EFF9D0] null]) {
    [v26 constrainShadowForSwatchGeneration];
  }
  double v64 = v15;
  id v32 = -[TSDSwatchCache p_maskInfoForMovieInfo:context:](self, "p_maskInfoForMovieInfo:context:", a7, [a9 context]);
  if (v32)
  {
    double v33 = (void *)[v32 geometry];
    [v33 size];
    double v35 = v23 / v34;
    double v37 = v25 / v36;
    if (v35 <= v37) {
      double v38 = v37;
    }
    else {
      double v38 = v35;
    }
    [v33 position];
    double v62 = v19;
    double v41 = v21;
    double v42 = v28;
    double v43 = TSDMultiplyPointScalar(v39, v40, v38);
    double v45 = v44;
    double v46 = -[TSDMaskInfo initWithContext:geometry:pathSource:]([TSDMaskInfo alloc], "initWithContext:geometry:pathSource:", [a9 context], -[TSDInfoGeometry initWithPosition:size:]([TSDInfoGeometry alloc], "initWithPosition:size:", v43, v44, v23, v25), +[TSDScalarPathSource rectangleWithNaturalSize:](TSDScalarPathSource, "rectangleWithNaturalSize:", v23, v25));
    double v23 = v42 * v38;
    double v47 = v41;
    double v25 = v30 * v38;
    double v19 = v62 - v43;
    double v21 = v47 - v45;
  }
  else
  {
    double v46 = 0;
  }
  uint64_t v48 = [v26 boxedObjectForProperty:519];
  if (v48 && v48 != [MEMORY[0x263EFF9D0] null]) {
    [v26 fadeReflectionForSwatchGeneration];
  }
  double v49 = TSDRoundedRect(v19, v21, v23, v25);
  double v53 = -[TSDInfoGeometry initWithPosition:size:]([TSDInfoGeometry alloc], "initWithPosition:size:", v49, v50, v51, v52);
  double v54 = -[TSDImageInfo initWithContext:geometry:style:imageData:originalImageData:]([TSDImageInfo alloc], "initWithContext:geometry:style:imageData:originalImageData:", [a9 context], v53, v26, -[TSDSwatchCache p_thumbnailImageDataForImageData:](self, "p_thumbnailImageDataForImageData:", objc_msgSend(a7, "posterImageData")), 0);
  [(TSDImageInfo *)v54 setMaskInfo:v46];
  double v55 = [[TSDImager alloc] initWithDocumentRoot:a9];
  [(TSDImager *)v55 setScaledImageSize:TSDMultiplySizeScalar(v63, v64, a5)];
  double v56 = TSDMultiplySizeScalar(v63, v64, 2.0);
  [(TSDImager *)v55 setUnscaledClipRect:TSDRectWithOriginAndSize(v57, *MEMORY[0x263F00148], *(double *)(MEMORY[0x263F00148] + 8), v56, v58)];
  -[TSDImager setInfos:](v55, "setInfos:", [MEMORY[0x263EFF8C0] arrayWithObject:v54]);
  [MEMORY[0x263F158F8] begin];
  [MEMORY[0x263F158F8] setDisableActions:1];
  long long v59 = [(TSDImager *)v55 newImage];
  id v60 = (void *)[MEMORY[0x263F7C858] imageWithCGImage:v59 scale:0 orientation:a5];
  CGImageRelease(v59);
  [MEMORY[0x263F158F8] commit];

  return v60;
}

- (id)imageForMoviePreset:(id)a3 imageSize:(CGSize)a4 imageScale:(double)a5 movieInfo:(id)a6 shouldClipVertically:(BOOL)a7 documentRoot:(id)a8
{
  double height = a4.height;
  double width = a4.width;
  int v14 = TSUPhoneUI();
  double v15 = 3.0;
  if (v14) {
    double v16 = 3.0;
  }
  else {
    double v16 = 2.0;
  }
  double v17 = 30.0;
  if (v14) {
    double v17 = 8.0;
  }
  double v18 = v17 + (width - width) * 0.5;
  if (!v14) {
    double v15 = 1.0;
  }
  double v19 = v15 * (v17 + (height - height) * 0.25);
  double v20 = v16 * (width - v17);
  double v21 = v16 * (height - v17);
  objc_opt_class();
  id v22 = (id)objc_msgSend((id)TSUDynamicCast(), "copyWithContext:", objc_msgSend(a8, "context"));
  objc_msgSend((id)objc_msgSend(a6, "geometry"), "size");
  double v24 = v23;
  double v85 = v25;
  objc_opt_class();
  [v22 valueForProperty:517];
  id v26 = (void *)TSUDynamicCast();
  if (v26)
  {
    objc_msgSend(v26, "coverageRect:", v18, v19, v20, v21);
    BOOL v29 = v28 < 0.0;
    *(float *)&double v28 = v28;
    double v30 = roundf(*(float *)&v28);
    double v31 = v19 - v30;
    double v32 = v21 + v30;
    if (v29) {
      double v21 = v32;
    }
    if (v29) {
      double v19 = v31;
    }
    BOOL v33 = v27 < 0.0;
    float v34 = v27;
    double v35 = roundf(v34);
    double v36 = v18 - v35;
    double v37 = v20 + v35;
    if (v33) {
      double v20 = v37;
    }
    if (v33) {
      double v18 = v36;
    }
  }
  objc_opt_class();
  [v22 valueForProperty:520];
  if (TSUDynamicCast()
    && ([v22 constrainShadowForSwatchGeneration],
        objc_opt_class(),
        [v22 valueForProperty:520],
        double v38 = (void *)TSUDynamicCast(),
        [v38 isDropShadow]))
  {
    objc_msgSend(v38, "shadowBoundsForRect:", v18, v19, v20, v21);
    if (v40 < 0.0)
    {
      float v41 = v40;
      double v21 = v21 + roundf(v41);
    }
    double v42 = v85;
    if (v39 < 0.0)
    {
      float v43 = v39;
      double v20 = v20 + roundf(v43);
    }
  }
  else
  {
    double v42 = v85;
  }
  double v82 = width;
  double v83 = height;
  double v81 = v16;
  if (a7)
  {
    double v44 = v24;
    double v45 = v42;
    double v46 = TSDScaleSizeWithinSize(v20, v21, v24, v42);
    double v48 = v47;
    id v49 = +[TSDScalarPathSource rectangleWithNaturalSize:](TSDScalarPathSource, "rectangleWithNaturalSize:", v46, *(void *)&v44, *(void *)&v81);
    double v50 = -[TSDInfoGeometry initWithCenter:size:]([TSDInfoGeometry alloc], "initWithCenter:size:", v44 * 0.5, v45 * 0.5, v46, v48);
    double v51 = -[TSDMaskInfo initWithContext:geometry:pathSource:]([TSDMaskInfo alloc], "initWithContext:geometry:pathSource:", [a8 context], v50, v49);

    if (v51)
    {
      double v52 = [(TSDDrawableInfo *)v51 geometry];
      [(TSDInfoGeometry *)v52 size];
      double v54 = v20 / v53;
      double v56 = v21 / v55;
      if (v54 <= v56) {
        double v57 = v56;
      }
      else {
        double v57 = v54;
      }
      [(TSDInfoGeometry *)v52 position];
      double v60 = TSDMultiplyPointScalar(v58, v59, v57);
      double v62 = v61;
      id v63 = +[TSDScalarPathSource rectangleWithNaturalSize:](TSDScalarPathSource, "rectangleWithNaturalSize:", v20, v21);
      double v64 = -[TSDInfoGeometry initWithPosition:size:]([TSDInfoGeometry alloc], "initWithPosition:size:", v60, v62, v20, v21);
      double v65 = -[TSDMaskInfo initWithContext:geometry:pathSource:]([TSDMaskInfo alloc], "initWithContext:geometry:pathSource:", [a8 context], v64, v63);
    }
    else
    {
      double v65 = 0;
    }
  }
  else
  {
    double v65 = 0;
  }
  uint64_t v66 = [v22 boxedObjectForProperty:519];
  if (v66 && v66 != [MEMORY[0x263EFF9D0] null]) {
    [v22 fadeReflectionForSwatchGeneration];
  }
  double v67 = TSDRoundedPoint();
  double v69 = v68;
  double v70 = TSDRoundedSize();
  double v72 = -[TSDInfoGeometry initWithPosition:size:]([TSDInfoGeometry alloc], "initWithPosition:size:", v67, v69, v70, v71);
  uint64_t v73 = -[TSDImageInfo initWithContext:geometry:style:imageData:originalImageData:]([TSDImageInfo alloc], "initWithContext:geometry:style:imageData:originalImageData:", [a8 context], v72, v22, -[TSDSwatchCache p_thumbnailImageDataForImageData:](self, "p_thumbnailImageDataForImageData:", objc_msgSend(a6, "posterImageData")), 0);
  [(TSDImageInfo *)v73 setMaskInfo:v65];
  double v74 = [[TSDImager alloc] initWithDocumentRoot:a8];
  [(TSDImager *)v74 setScaledImageSize:TSDMultiplySizeScalar(v82, v83, a5)];
  double v75 = TSDMultiplySizeScalar(v82, v83, v81);
  [(TSDImager *)v74 setUnscaledClipRect:TSDRectWithOriginAndSize(v76, *MEMORY[0x263F00148], *(double *)(MEMORY[0x263F00148] + 8), v75, v77)];
  -[TSDImager setInfos:](v74, "setInfos:", [MEMORY[0x263EFF8C0] arrayWithObject:v73]);
  [MEMORY[0x263F158F8] begin];
  [MEMORY[0x263F158F8] setDisableActions:1];
  CGFloat v78 = [(TSDImager *)v74 newImage];
  double v79 = (void *)[MEMORY[0x263F7C858] imageWithCGImage:v78 scale:0 orientation:a5];
  CGImageRelease(v78);
  [MEMORY[0x263F158F8] commit];

  return v79;
}

@end