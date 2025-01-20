@interface PBFilter
+ (BOOL)needsDisplayForKey:(id)a3;
+ (id)defaultValueForKey:(id)a3;
+ (id)filterWithName:(id)a3;
- (BOOL)allowAbsoluteGestures;
- (BOOL)needsWrapMirror;
- (CGPoint)pointValueForKeyIfSupported:(id)a3;
- (PBFilter)init;
- (float)floatValueForKeyIfSupported:(id)a3;
- (id)ciFilter;
- (id)ciFilterName;
- (id)createOutputImage:(id)a3 mirrored:(BOOL)a4 size:(CGSize)a5;
- (id)description;
- (id)inputKeys;
- (id)localizedName;
- (id)name;
- (void)dealloc;
- (void)handleGestureAtLocations:(CGPoint *)a3 count:(int)a4 translation:(CGPoint)a5 viewSize:(CGSize)a6 stateBegan:(BOOL)a7 mirror:(BOOL)a8;
- (void)handlePanGesture:(CGPoint)a3 viewSize:(CGSize)a4 stateBegan:(BOOL)a5 mirror:(BOOL)a6;
- (void)handlePinchGesture:(float)a3 stateBegan:(BOOL)a4;
- (void)handleRotateGesture:(float)a3 stateBegan:(BOOL)a4 mirror:(BOOL)a5;
- (void)handleTapGesture:(CGPoint)a3 viewSize:(CGSize)a4 mirror:(BOOL)a5;
- (void)renderWithContext:(id)a3 inputSize:(CGSize)a4 outputRect:(CGRect)a5 mirrored:(BOOL)a6;
- (void)resetInputImage;
- (void)setDefaults;
- (void)setFloatValue:(float)a3 forKeyIfSupported:(id)a4;
- (void)setPointValue:(CGPoint)a3 forKeyIfSupported:(id)a4;
@end

@implementation PBFilter

+ (id)filterWithName:(id)a3
{
  Class v3 = NSClassFromString((NSString *)a3);
  if (!v3) {
    return 0;
  }
  v4 = v3;
  if (![(objc_class *)v3 isSubclassOfClass:objc_opt_class()]) {
    return 0;
  }
  id v5 = objc_alloc_init(v4);

  return v5;
}

- (PBFilter)init
{
  v9.receiver = self;
  v9.super_class = (Class)PBFilter;
  v2 = [(PBFilter *)&v9 init];
  Class v3 = v2;
  if (v2)
  {
    [(PBFilter *)v2 setDefaults];
    v4 = (CIFilter *)objc_msgSend(MEMORY[0x263F00640], "filterWithName:", -[PBFilter ciFilterName](v3, "ciFilterName"));
    v3->_ciFilter = v4;
    id v5 = v4;
    if ([(PBFilter *)v3 needsWrapMirror])
    {
      v6 = (CIFilter *)[MEMORY[0x263F00640] filterWithName:@"CIWrapMirror"];
      v3->_wrapMirrorFilter = v6;
      v7 = v6;
    }
  }
  return v3;
}

- (id)ciFilterName
{
  id v2 = [(PBFilter *)self name];

  return (id)[v2 stringByReplacingOccurrencesOfString:@"PB" withString:@"CI"];
}

- (id)name
{
  id v2 = (objc_class *)objc_opt_class();

  return NSStringFromClass(v2);
}

- (BOOL)needsWrapMirror
{
  return 0;
}

- (void)dealloc
{
  ciFilter = self->_ciFilter;
  if (ciFilter) {

  }
  wrapMirrorFilter = self->_wrapMirrorFilter;
  if (wrapMirrorFilter) {

  }
  v5.receiver = self;
  v5.super_class = (Class)PBFilter;
  [(PBFilter *)&v5 dealloc];
}

- (void)setDefaults
{
  ciFilter = self->_ciFilter;
  if (ciFilter) {
    [(CIFilter *)ciFilter setDefaults];
  }
  wrapMirrorFilter = self->_wrapMirrorFilter;
  if (wrapMirrorFilter)
  {
    [(CIFilter *)wrapMirrorFilter setDefaults];
  }
}

- (id)createOutputImage:(id)a3 mirrored:(BOOL)a4 size:(CGSize)a5
{
  BOOL v5 = a4;
  if ([(PBFilter *)self needsWrapMirror])
  {
    [(CIFilter *)self->_wrapMirrorFilter setValue:a3 forKey:@"inputImage"];
    [a3 extent];
    -[PBFilter applyParametersToCIFilter:extent:](self, "applyParametersToCIFilter:extent:", v5);
    p_ciFilter = &self->_ciFilter;
    [(CIFilter *)self->_ciFilter setValue:[(CIFilter *)self->_wrapMirrorFilter outputImage] forKey:@"inputImage"];
  }
  else
  {
    p_ciFilter = &self->_ciFilter;
    ciFilter = self->_ciFilter;
    if (!ciFilter) {
      return a3;
    }
    [(CIFilter *)ciFilter setValue:a3 forKey:@"inputImage"];
    [a3 extent];
    -[PBFilter applyParametersToCIFilter:extent:](self, "applyParametersToCIFilter:extent:", v5);
  }
  v10 = *p_ciFilter;

  return [(CIFilter *)v10 outputImage];
}

- (void)resetInputImage
{
  ciFilter = self->_ciFilter;
  if (ciFilter) {
    [(CIFilter *)ciFilter setValue:0 forKey:@"inputImage"];
  }
  wrapMirrorFilter = self->_wrapMirrorFilter;
  if (wrapMirrorFilter)
  {
    [(CIFilter *)wrapMirrorFilter setValue:0 forKey:@"inputImage"];
  }
}

- (id)inputKeys
{
  id v2 = +[PBFilterClassDescription classDescriptionForClass:objc_opt_class()];

  return (id)[v2 inputKeys];
}

- (id)localizedName
{
  id v2 = (objc_class *)objc_opt_class();
  Class v3 = NSStringFromClass(v2);
  v4 = (void *)[MEMORY[0x263F086E0] bundleForClass:v2];

  return (id)[v4 localizedStringForKey:v3 value:0 table:@"PhotoBoothEffects"];
}

- (id)description
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v3 = [(PBFilter *)self inputKeys];
  if ([v3 count])
  {
    v4 = (void *)MEMORY[0x263F089D8];
    BOOL v5 = (objc_class *)objc_opt_class();
    v17 = (void *)[v4 stringWithFormat:@"%@ (%p) = { ", NSStringFromClass(v5), self];
    uint64_t v6 = [v3 lastObject];
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    uint64_t v7 = [v3 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v20;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v20 != v9) {
            objc_enumerationMutation(v3);
          }
          uint64_t v11 = *(void *)(*((void *)&v19 + 1) + 8 * i);
          v12 = NSString;
          uint64_t v13 = [(PBFilter *)self valueForKey:v11];
          v14 = ", ";
          if (v11 == v6) {
            v14 = (const char *)&unk_23C816ECA;
          }
          uint64_t v15 = [v12 stringWithFormat:@"%@ = %@%s", v11, v13, v14];
          if (v15) {
            [v17 appendString:v15];
          }
        }
        uint64_t v8 = [v3 countByEnumeratingWithState:&v19 objects:v23 count:16];
      }
      while (v8);
    }
    [v17 appendString:@" }"];
  }
  else
  {
    v18.receiver = self;
    v18.super_class = (Class)PBFilter;
    return [(PBFilter *)&v18 description];
  }
  return v17;
}

- (id)ciFilter
{
  return self->_ciFilter;
}

+ (id)defaultValueForKey:(id)a3
{
  if (!a1) {
    return 0;
  }
  v4 = (objc_class *)objc_opt_class();
  BOOL v5 = +[PBFilter filterWithName:NSStringFromClass(v4)];
  if (!v5) {
    return 0;
  }
  uint64_t v6 = v5;
  [(PBFilter *)v5 setDefaults];
  if (objc_msgSend(-[PBFilter inputKeys](v6, "inputKeys"), "containsObject:", a3)) {
    uint64_t v7 = (void *)[(PBFilter *)v6 valueForKey:a3];
  }
  else {
    uint64_t v7 = 0;
  }

  return v7;
}

+ (BOOL)needsDisplayForKey:(id)a3
{
  return a1
      && (objc_msgSend((id)objc_msgSend(MEMORY[0x263EFFA08], "setWithArray:", objc_msgSend(+[PBFilterClassDescription classDescriptionForClass:](PBFilterClassDescription, "classDescriptionForClass:", objc_opt_class()), "inputKeys")), "containsObject:", a3) & 1) != 0;
}

- (BOOL)allowAbsoluteGestures
{
  return 1;
}

- (void)renderWithContext:(id)a3 inputSize:(CGSize)a4 outputRect:(CGRect)a5 mirrored:(BOOL)a6
{
  BOOL v6 = a6;
  double height = a5.size.height;
  double width = a5.size.width;
  double y = a5.origin.y;
  double x = a5.origin.x;
  double v11 = a4.height;
  double v12 = a4.width;
  uint64_t v15 = objc_opt_class();
  if (v15 == objc_opt_class())
  {
    v16 = (__CVBuffer *)[a3 inputPixelBuffer];
    objc_sync_enter(self);
    v17 = (void *)MEMORY[0x263F00650];
    uint64_t v18 = [a3 inputTexture];
    size_t v19 = CVPixelBufferGetWidth(v16);
    id v20 = -[PBFilter createOutputImage:mirrored:size:](self, "createOutputImage:mirrored:size:", objc_msgSend(v17, "imageWithTexture:size:flipped:colorSpace:", v18, 1, 0, (double)v19, (double)CVPixelBufferGetHeight(v16)), v6, v12, v11);
    [(PBFilter *)self resetInputImage];
    objc_sync_exit(self);
    if ([a3 renderForSave])
    {
      long long v21 = (void *)[a3 ciContext];
      uint64_t v22 = [a3 outputPixelBuffer];
      objc_msgSend(v21, "render:toCVPixelBuffer:bounds:colorSpace:", v20, v22, 0, x, y, width, height);
    }
    else
    {
      if ([a3 render9Up])
      {
        long long v35 = *(_OWORD *)(MEMORY[0x263F000D0] + 16);
        *(_OWORD *)&v56.a = *MEMORY[0x263F000D0];
        long long v33 = *(_OWORD *)&v56.a;
        *(_OWORD *)&v56.c = v35;
        *(_OWORD *)&v56.tdouble x = *(_OWORD *)(MEMORY[0x263F000D0] + 32);
        long long v31 = *(_OWORD *)&v56.tx;
        CGAffineTransformMakeScale(&t2, -1.0, 1.0);
        *(_OWORD *)&t1.a = v33;
        *(_OWORD *)&t1.c = v35;
        *(_OWORD *)&t1.tdouble x = v31;
        CGAffineTransformConcat(&v56, &t1, &t2);
        CGAffineTransformMakeTranslation(&v53, v12, 0.0);
        CGAffineTransform v52 = v56;
        CGAffineTransformConcat(&t1, &v52, &v53);
        CGAffineTransform v56 = t1;
        if (v6)
        {
          CGAffineTransformMakeScale(&v51, 1.0, -1.0);
          CGAffineTransform v52 = v56;
          CGAffineTransformConcat(&t1, &v52, &v51);
          CGAffineTransform v56 = t1;
          CGAffineTransformMakeTranslation(&v50, 0.0, v11);
          CGAffineTransform v52 = v56;
          CGAffineTransformConcat(&t1, &v52, &v50);
          CGAffineTransform v56 = t1;
        }
        CGAffineTransformMakeTranslation(&v49, v12 * -0.5, v11 * -0.5);
        CGAffineTransform v52 = v56;
        CGAffineTransformConcat(&t1, &v52, &v49);
        CGAffineTransform v56 = t1;
        CGAffineTransformMakeRotation(&v48, -1.57079633);
        CGAffineTransform v52 = v56;
        CGAffineTransformConcat(&t1, &v52, &v48);
        CGAffineTransform v56 = t1;
        CGAffineTransformMakeTranslation(&v47, v11 * 0.5, v12 * 0.5);
        CGAffineTransform v52 = v56;
        CGAffineTransformConcat(&t1, &v52, &v47);
        CGAffineTransform v56 = t1;
        float v23 = height / v12;
        float v24 = width / v11;
        CGAffineTransformMakeScale(&v46, v23, v24);
        CGAffineTransform v52 = v56;
        CGAffineTransformConcat(&t1, &v52, &v46);
        CGAffineTransform v56 = t1;
        [a3 outputSize];
        CGAffineTransformMakeTranslation(&v45, x, y);
        CGAffineTransform v52 = v56;
        CGAffineTransformConcat(&t1, &v52, &v45);
        CGAffineTransform v56 = t1;
        uint64_t v25 = objc_msgSend((id)objc_msgSend(v20, "imageByApplyingTransform:", &t1), "imageByCroppingToRect:", x, y, width, height);
      }
      else
      {
        long long v36 = *(_OWORD *)(MEMORY[0x263F000D0] + 16);
        *(_OWORD *)&v56.a = *MEMORY[0x263F000D0];
        long long v34 = *(_OWORD *)&v56.a;
        *(_OWORD *)&v56.c = v36;
        *(_OWORD *)&v56.tdouble x = *(_OWORD *)(MEMORY[0x263F000D0] + 32);
        long long v32 = *(_OWORD *)&v56.tx;
        CGAffineTransformMakeScale(&v44, -1.0, 1.0);
        *(_OWORD *)&t1.a = v34;
        *(_OWORD *)&t1.c = v36;
        *(_OWORD *)&t1.tdouble x = v32;
        CGAffineTransformConcat(&v56, &t1, &v44);
        CGAffineTransformMakeTranslation(&v43, v12, 0.0);
        CGAffineTransform v52 = v56;
        CGAffineTransformConcat(&t1, &v52, &v43);
        CGAffineTransform v56 = t1;
        if (v6)
        {
          CGAffineTransformMakeScale(&v42, 1.0, -1.0);
          CGAffineTransform v52 = v56;
          CGAffineTransformConcat(&t1, &v52, &v42);
          CGAffineTransform v56 = t1;
          CGAffineTransformMakeTranslation(&v41, 0.0, v11);
          CGAffineTransform v52 = v56;
          CGAffineTransformConcat(&t1, &v52, &v41);
          CGAffineTransform v56 = t1;
        }
        CGAffineTransformMakeTranslation(&v40, v12 * -0.5, v11 * -0.5);
        CGAffineTransform v52 = v56;
        CGAffineTransformConcat(&t1, &v52, &v40);
        CGAffineTransform v56 = t1;
        CGAffineTransformMakeRotation(&v39, -1.57079633);
        CGAffineTransform v52 = v56;
        CGAffineTransformConcat(&t1, &v52, &v39);
        CGAffineTransform v56 = t1;
        CGAffineTransformMakeTranslation(&v38, v11 * 0.5, v12 * 0.5);
        CGAffineTransform v52 = v56;
        CGAffineTransformConcat(&t1, &v52, &v38);
        CGAffineTransform v56 = t1;
        if (width != v11 || height != v12)
        {
          CGAffineTransformMakeScale(&v37, width / v11, height / v12);
          CGAffineTransform v52 = v56;
          CGAffineTransformConcat(&t1, &v52, &v37);
          CGAffineTransform v56 = t1;
        }
        CGAffineTransform t1 = v56;
        uint64_t v25 = objc_msgSend(v20, "imageByApplyingTransform:", &t1, v32, v34, v36);
      }
      uint64_t v26 = v25;
      v27 = (__CVBuffer *)objc_msgSend(a3, "outputPixelBuffer", v31, v33, v35);
      v28 = (void *)[a3 ciContext];
      uint64_t v29 = [a3 outputTexture];
      double v30 = (double)CVPixelBufferGetWidth(v27);
      objc_msgSend(v28, "render:toTexture:bounds:colorSpace:", v26, v29, 0, 0.0, 0.0, v30, (double)CVPixelBufferGetHeight(v27));
    }
  }
}

- (float)floatValueForKeyIfSupported:(id)a3
{
  if (!objc_msgSend(-[PBFilter inputKeys](self, "inputKeys"), "containsObject:", a3)) {
    return NAN;
  }
  BOOL v5 = (void *)[(PBFilter *)self valueForKey:a3];

  [v5 floatValue];
  return result;
}

- (void)setFloatValue:(float)a3 forKeyIfSupported:(id)a4
{
  if (objc_msgSend(-[PBFilter inputKeys](self, "inputKeys"), "containsObject:", a4))
  {
    *(float *)&double v7 = a3;
    uint64_t v8 = [NSNumber numberWithFloat:v7];
    [(PBFilter *)self setValue:v8 forKey:a4];
  }
}

- (CGPoint)pointValueForKeyIfSupported:(id)a3
{
  if (objc_msgSend(-[PBFilter inputKeys](self, "inputKeys"), "containsObject:", a3))
  {
    BOOL v5 = (void *)[(PBFilter *)self valueForKey:a3];
    [v5 pointValue];
  }
  else
  {
    double v6 = NAN;
    double v7 = NAN;
  }
  result.double y = v7;
  result.double x = v6;
  return result;
}

- (void)setPointValue:(CGPoint)a3 forKeyIfSupported:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  if (objc_msgSend(-[PBFilter inputKeys](self, "inputKeys"), "containsObject:", a4))
  {
    uint64_t v8 = objc_msgSend(MEMORY[0x263F08D40], "valueWithPoint:", x, y);
    [(PBFilter *)self setValue:v8 forKey:a4];
  }
}

- (void)handleTapGesture:(CGPoint)a3 viewSize:(CGSize)a4 mirror:(BOOL)a5
{
  double height = a4.height;
  double width = a4.width;
  double y = a3.y;
  double x = a3.x;
  if ([(PBFilter *)self allowAbsoluteGestures]
    && objc_msgSend(-[PBFilter inputKeys](self, "inputKeys"), "containsObject:", @"inputPoint"))
  {
    float v10 = x / width;
    float v11 = y / height;
    float v12 = 1.0;
    float v13 = 1.0 - v10;
    if (v11 <= 1.0) {
      float v14 = y / height;
    }
    else {
      float v14 = 1.0;
    }
    BOOL v15 = v11 < 0.0;
    float v16 = 0.0;
    if (v15) {
      float v14 = 0.0;
    }
    double v17 = v14;
    if (v13 <= 1.0) {
      float v12 = v13;
    }
    if (v13 >= 0.0) {
      float v16 = v12;
    }
    uint64_t v18 = objc_msgSend(MEMORY[0x263F08D40], "valueWithPoint:", v17, v16);
    [(PBFilter *)self setValue:v18 forKey:@"inputPoint"];
  }
}

- (void)handleGestureAtLocations:(CGPoint *)a3 count:(int)a4 translation:(CGPoint)a5 viewSize:(CGSize)a6 stateBegan:(BOOL)a7 mirror:(BOOL)a8
{
  double height = a6.height;
  double width = a6.width;
  double y = a5.y;
  double x = a5.x;
  id v16 = [(PBFilter *)self inputKeys];
  if (a4 < 1)
  {
    int v21 = 0;
    double v20 = *MEMORY[0x263F00148];
    double v19 = *(double *)(MEMORY[0x263F00148] + 8);
    goto LABEL_5;
  }
  double v17 = a3->x;
  double v18 = a3->y;
  if (a4 == 1)
  {
    double v19 = a3->y;
    double v20 = a3->x;
    int v21 = 0;
LABEL_5:
    float v77 = 0.0;
    float v78 = NAN;
    goto LABEL_7;
  }
  double v75 = height;
  double v76 = width;
  double v22 = a3[1].x;
  double v23 = a3[1].y;
  long double v24 = v17 - v22;
  long double v25 = v18 - v23;
  double v26 = a3->x;
  double v27 = a3->y;
  float v28 = atan2(v18 - v23, v17 - v22);
  float v78 = v28;
  float v29 = hypot(v24, v25);
  float v77 = v29;
  double v20 = (v26 + v22) * 0.5;
  double v30 = v27 + v23;
  double height = v75;
  double width = v76;
  double v19 = v30 * 0.5;
  int v21 = 1;
LABEL_7:
  double Current = CFAbsoluteTimeGetCurrent();
  double v32 = x / width;
  double v33 = y / height;
  if (a7)
  {
    handleGestureAtLocations_count_translation_viewSize_stateBegan_mirror___maxcount = a4;
    handleGestureAtLocations_count_translation_viewSize_stateBegan_mirror___lastcount = 0;
    [(PBFilter *)self pointValueForKeyIfSupported:@"inputPoint"];
    *(float *)&double v34 = v34;
    handleGestureAtLocations_count_translation_viewSize_stateBegan_mirror___startX = LODWORD(v34);
    *(float *)&double v34 = v35;
    handleGestureAtLocations_count_translation_viewSize_stateBegan_mirror___startY = LODWORD(v34);
    [(PBFilter *)self floatValueForKeyIfSupported:@"inputH"];
    handleGestureAtLocations_count_translation_viewSize_stateBegan_mirror___startH = v36;
    [(PBFilter *)self floatValueForKeyIfSupported:@"inputV"];
    handleGestureAtLocations_count_translation_viewSize_stateBegan_mirror___startV = v37;
    [(PBFilter *)self floatValueForKeyIfSupported:@"inputAngle"];
    handleGestureAtLocations_count_translation_viewSize_stateBegan_mirror___startA = v38;
    uint64_t v39 = 0;
    if (v21)
    {
      [(PBFilter *)self floatValueForKeyIfSupported:@"inputAmount"];
      handleGestureAtLocations_count_translation_viewSize_stateBegan_mirror___startAmt = v40;
      handleGestureAtLocations_count_translation_viewSize_stateBegan_mirror___startDist = LODWORD(v77);
    }
LABEL_19:
    handleGestureAtLocations_count_translation_viewSize_stateBegan_mirror___end2time = v39;
    goto LABEL_20;
  }
  int v41 = handleGestureAtLocations_count_translation_viewSize_stateBegan_mirror___maxcount;
  if (handleGestureAtLocations_count_translation_viewSize_stateBegan_mirror___maxcount <= a4) {
    int v41 = a4;
  }
  handleGestureAtLocations_count_translation_viewSize_stateBegan_mirror___maxcount = v41;
  int v42 = handleGestureAtLocations_count_translation_viewSize_stateBegan_mirror___lastcount;
  if (handleGestureAtLocations_count_translation_viewSize_stateBegan_mirror___lastcount < 2) {
    char v43 = v21;
  }
  else {
    char v43 = 0;
  }
  if (v43)
  {
    [(PBFilter *)self floatValueForKeyIfSupported:@"inputAmount"];
    handleGestureAtLocations_count_translation_viewSize_stateBegan_mirror___startAmt = v44;
    handleGestureAtLocations_count_translation_viewSize_stateBegan_mirror___startDist = LODWORD(v77);
    int v42 = handleGestureAtLocations_count_translation_viewSize_stateBegan_mirror___lastcount;
  }
  if (a4 <= 1)
  {
    uint64_t v39 = *(void *)&Current;
    if (v42 == 2) {
      goto LABEL_19;
    }
  }
LABEL_20:
  float v45 = v32;
  float v46 = v33;
  if ([v16 containsObject:@"inputPoint"])
  {
    if (![(PBFilter *)self allowAbsoluteGestures])
    {
      if (a4 < 1) {
        goto LABEL_66;
      }
      float v56 = *(float *)&handleGestureAtLocations_count_translation_viewSize_stateBegan_mirror___startY - v45;
      LODWORD(v48) = 1.0;
      if ((float)(*(float *)&handleGestureAtLocations_count_translation_viewSize_stateBegan_mirror___startX + v46) <= 1.0) {
        *(float *)&double v49 = *(float *)&handleGestureAtLocations_count_translation_viewSize_stateBegan_mirror___startX + v46;
      }
      else {
        *(float *)&double v49 = 1.0;
      }
      if ((float)(*(float *)&handleGestureAtLocations_count_translation_viewSize_stateBegan_mirror___startX + v46) >= 0.0) {
        float v57 = *(float *)&v49;
      }
      else {
        float v57 = 0.0;
      }
      double v58 = v57;
      if (v56 <= 1.0) {
        *(float *)&double v48 = *(float *)&handleGestureAtLocations_count_translation_viewSize_stateBegan_mirror___startY - v45;
      }
      if (v56 >= 0.0) {
        float v59 = *(float *)&v48;
      }
      else {
        float v59 = 0.0;
      }
      [(PBFilter *)self setPointValue:@"inputPoint", v58, v59, v48, v49 forKeyIfSupported];
LABEL_52:
      if (objc_msgSend(v16, "containsObject:", @"inputH", v47))
      {
        float v60 = *(float *)&handleGestureAtLocations_count_translation_viewSize_stateBegan_mirror___startH
            + (float)(v45 * 2.0);
        float v61 = 1.0;
        if (v60 <= 1.0) {
          float v61 = *(float *)&handleGestureAtLocations_count_translation_viewSize_stateBegan_mirror___startH
        }
              + (float)(v45 * 2.0);
        BOOL v62 = v60 < 0.0;
        double v63 = 0.0;
        if (!v62) {
          *(float *)&double v63 = v61;
        }
        -[PBFilter setValue:forKey:](self, "setValue:forKey:", [NSNumber numberWithFloat:v63], @"inputH");
      }
      if ([v16 containsObject:@"inputV"])
      {
        float v64 = *(float *)&handleGestureAtLocations_count_translation_viewSize_stateBegan_mirror___startV
            + (float)(v46 * 2.0);
        float v65 = 1.0;
        if (v64 <= 1.0) {
          float v65 = *(float *)&handleGestureAtLocations_count_translation_viewSize_stateBegan_mirror___startV
        }
              + (float)(v46 * 2.0);
        BOOL v62 = v64 < 0.0;
        double v66 = 0.0;
        if (!v62) {
          *(float *)&double v66 = v65;
        }
        -[PBFilter setValue:forKey:](self, "setValue:forKey:", [NSNumber numberWithFloat:v66], @"inputV");
      }
      if ([v16 containsObject:@"inputAngle"])
      {
        double v67 = *(float *)&handleGestureAtLocations_count_translation_viewSize_stateBegan_mirror___startA + v45 * 6.0;
        *(float *)&double v67 = v67;
        -[PBFilter setValue:forKey:](self, "setValue:forKey:", [NSNumber numberWithFloat:v67], @"inputAngle");
      }
      goto LABEL_66;
    }
    if ((v21 & 1) == 0)
    {
      if (a4 <= 0)
      {
        [v16 containsObject:@"inputAmount"];
        int v21 = 0;
        goto LABEL_74;
      }
      double v47 = Current - *(double *)&handleGestureAtLocations_count_translation_viewSize_stateBegan_mirror___end2time;
      if (Current - *(double *)&handleGestureAtLocations_count_translation_viewSize_stateBegan_mirror___end2time <= 0.0500000007) {
        goto LABEL_52;
      }
    }
    float v50 = v19 / height;
    float v51 = v20 / width;
    LODWORD(v48) = 1.0;
    float v52 = 1.0 - v51;
    if (v50 <= 1.0) {
      *(float *)&double v49 = v19 / height;
    }
    else {
      *(float *)&double v49 = 1.0;
    }
    if (v50 >= 0.0) {
      float v53 = *(float *)&v49;
    }
    else {
      float v53 = 0.0;
    }
    double v54 = v53;
    if (v52 <= 1.0) {
      *(float *)&double v48 = v52;
    }
    if (v52 >= 0.0) {
      float v55 = *(float *)&v48;
    }
    else {
      float v55 = 0.0;
    }
    [(PBFilter *)self setPointValue:@"inputPoint", v54, v55, v48, v49 forKeyIfSupported];
  }
  if (a4 >= 1) {
    goto LABEL_52;
  }
LABEL_66:
  if ((v21 & [v16 containsObject:@"inputAmount"]) == 1)
  {
    if ([(PBFilter *)self allowAbsoluteGestures])
    {
      if (width >= height) {
        double v69 = height;
      }
      else {
        double v69 = width;
      }
      double v68 = v77 / v69;
      *(float *)&double v68 = v68;
    }
    else
    {
      *(float *)&double v68 = (float)(v77
                             * *(float *)&handleGestureAtLocations_count_translation_viewSize_stateBegan_mirror___startAmt)
                     / *(float *)&handleGestureAtLocations_count_translation_viewSize_stateBegan_mirror___startDist;
    }
    -[PBFilter setValue:forKey:](self, "setValue:forKey:", [NSNumber numberWithFloat:v68], @"inputAmount");
    int v21 = 1;
  }
LABEL_74:
  if ([v16 containsObject:@"inputRotation"])
  {
    int v70 = handleGestureAtLocations_count_translation_viewSize_stateBegan_mirror___lastcount > 1 ? v21 : 0;
    if (v70 == 1)
    {
      objc_msgSend((id)-[PBFilter valueForKey:](self, "valueForKey:", @"inputRotation"), "floatValue");
      float v72 = v78 - *(float *)&handleGestureAtLocations_count_translation_viewSize_stateBegan_mirror___lastangle;
      if ((float)(v78 - *(float *)&handleGestureAtLocations_count_translation_viewSize_stateBegan_mirror___lastangle) < -3.14159265)
      {
        float v73 = (float)(v78 - *(float *)&handleGestureAtLocations_count_translation_viewSize_stateBegan_mirror___lastangle)
            + 6.28318531;
        float v72 = v73;
      }
      if (v72 > 3.14159265)
      {
        float v74 = v72 + -6.28318531;
        float v72 = v74;
      }
      *(float *)&double v71 = *(float *)&v71 + v72;
      -[PBFilter setValue:forKey:](self, "setValue:forKey:", [NSNumber numberWithFloat:v71], @"inputRotation");
    }
  }
  handleGestureAtLocations_count_translation_viewSize_stateBegan_mirror___lastcount = a4;
  handleGestureAtLocations_count_translation_viewSize_stateBegan_mirror___lastangle = LODWORD(v78);
}

- (void)handlePanGesture:(CGPoint)a3 viewSize:(CGSize)a4 stateBegan:(BOOL)a5 mirror:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v7 = a5;
  double v9 = a3.x / a4.width;
  double v10 = a3.y / a4.height;
  id v11 = [(PBFilter *)self inputKeys];
  if (v7)
  {
    [(PBFilter *)self pointValueForKeyIfSupported:@"inputPoint"];
    *(float *)&double v12 = v12;
    handlePanGesture_viewSize_stateBegan_mirror__startX = LODWORD(v12);
    *(float *)&double v12 = v13;
    handlePanGesture_viewSize_stateBegan_mirror__startY = LODWORD(v12);
    [(PBFilter *)self floatValueForKeyIfSupported:@"inputH"];
    handlePanGesture_viewSize_stateBegan_mirror__startH = v14;
    [(PBFilter *)self floatValueForKeyIfSupported:@"inputV"];
    handlePanGesture_viewSize_stateBegan_mirror__startV = v15;
    [(PBFilter *)self floatValueForKeyIfSupported:@"inputAngle"];
    handlePanGesture_viewSize_stateBegan_mirror__startA = v16;
  }
  float v17 = v9;
  float v18 = v10;
  if ([v11 containsObject:@"inputPoint"])
  {
    float v19 = *(float *)&handlePanGesture_viewSize_stateBegan_mirror__startX + v18;
    double v20 = v17;
    double v21 = -1.0;
    if (v6) {
      double v21 = 1.0;
    }
    float v22 = *(float *)&handlePanGesture_viewSize_stateBegan_mirror__startY + v20 * v21;
    LODWORD(v20) = 1.0;
    if (v19 <= 1.0) {
      *(float *)&double v21 = *(float *)&handlePanGesture_viewSize_stateBegan_mirror__startX + v18;
    }
    else {
      *(float *)&double v21 = 1.0;
    }
    if (v19 >= 0.0) {
      float v23 = *(float *)&v21;
    }
    else {
      float v23 = 0.0;
    }
    double v24 = v23;
    if (v22 <= 1.0) {
      *(float *)&double v20 = v22;
    }
    if (v22 >= 0.0) {
      float v25 = *(float *)&v20;
    }
    else {
      float v25 = 0.0;
    }
    -[PBFilter setValue:forKey:](self, "setValue:forKey:", objc_msgSend(MEMORY[0x263F08D40], "valueWithPoint:", v24, v25, v20, v21), @"inputPoint");
  }
  if ([v11 containsObject:@"inputH"])
  {
    float v26 = *(float *)&handlePanGesture_viewSize_stateBegan_mirror__startH + (float)(v17 * 2.0);
    float v27 = 1.0;
    if (v26 <= 1.0) {
      float v27 = *(float *)&handlePanGesture_viewSize_stateBegan_mirror__startH + (float)(v17 * 2.0);
    }
    BOOL v28 = v26 < 0.0;
    double v29 = 0.0;
    if (!v28) {
      *(float *)&double v29 = v27;
    }
    -[PBFilter setValue:forKey:](self, "setValue:forKey:", [NSNumber numberWithFloat:v29], @"inputH");
  }
  if ([v11 containsObject:@"inputV"])
  {
    float v30 = *(float *)&handlePanGesture_viewSize_stateBegan_mirror__startV + (float)(v18 * 2.0);
    float v31 = 1.0;
    if (v30 <= 1.0) {
      float v31 = *(float *)&handlePanGesture_viewSize_stateBegan_mirror__startV + (float)(v18 * 2.0);
    }
    BOOL v28 = v30 < 0.0;
    double v32 = 0.0;
    if (!v28) {
      *(float *)&double v32 = v31;
    }
    -[PBFilter setValue:forKey:](self, "setValue:forKey:", [NSNumber numberWithFloat:v32], @"inputV");
  }
  if ([v11 containsObject:@"inputAngle"])
  {
    *(float *)&double v33 = *(float *)&handlePanGesture_viewSize_stateBegan_mirror__startA + (float)(v17 * 2.0);
    uint64_t v34 = [NSNumber numberWithFloat:v33];
    [(PBFilter *)self setValue:v34 forKey:@"inputAngle"];
  }
}

- (void)handlePinchGesture:(float)a3 stateBegan:(BOOL)a4
{
  if (objc_msgSend(-[PBFilter inputKeys](self, "inputKeys"), "containsObject:", @"inputAmount"))
  {
    if (a4)
    {
      handlePinchGesture_stateBegan__beganScale = LODWORD(a3);
      objc_msgSend((id)-[PBFilter valueForKey:](self, "valueForKey:", @"inputAmount"), "floatValue");
      handlePinchGesture_stateBegan__beganAmount = v7;
    }
    else
    {
      int v7 = handlePinchGesture_stateBegan__beganAmount;
    }
    float v8 = (float)(*(float *)&v7 * a3) / *(float *)&handlePinchGesture_stateBegan__beganScale;
    float v9 = 1.0;
    if (v8 <= 1.0) {
      float v9 = v8;
    }
    BOOL v10 = v8 < 0.0;
    double v11 = 0.0;
    if (!v10) {
      *(float *)&double v11 = v9;
    }
    uint64_t v12 = [NSNumber numberWithFloat:v11];
    [(PBFilter *)self setValue:v12 forKey:@"inputAmount"];
  }
}

- (void)handleRotateGesture:(float)a3 stateBegan:(BOOL)a4 mirror:(BOOL)a5
{
  if (objc_msgSend(-[PBFilter inputKeys](self, "inputKeys", a4, a5), "containsObject:", @"inputRotation"))
  {
    if (a4)
    {
      handleRotateGesture_stateBegan_mirror__startRot = LODWORD(a3);
      objc_msgSend((id)-[PBFilter valueForKey:](self, "valueForKey:", @"inputRotation"), "floatValue");
      handleRotateGesture_stateBegan_mirror__startVal = v8;
    }
    else
    {
      int v8 = handleRotateGesture_stateBegan_mirror__startVal;
    }
    double v9 = *(float *)&v8 - (float)(a3 - *(float *)&handleRotateGesture_stateBegan_mirror__startRot);
    *(float *)&double v9 = v9;
    uint64_t v10 = [NSNumber numberWithFloat:v9];
    [(PBFilter *)self setValue:v10 forKey:@"inputRotation"];
  }
}

@end