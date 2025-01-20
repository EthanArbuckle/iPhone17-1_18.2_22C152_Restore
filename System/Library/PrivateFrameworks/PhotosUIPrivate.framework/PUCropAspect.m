@interface PUCropAspect
+ (id)allAspectsWithOriginalSize:(CGSize)a3 currentSize:(CGSize)a4;
+ (id)originalAspectForWidth:(unint64_t)a3 height:(unint64_t)a4;
- (BOOL)allowOrientationChange;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToCropAspect:(id)a3;
- (BOOL)isEquivalentToCropAspect:(id)a3;
- (BOOL)isFreeformCrop;
- (CGRect)constrainRect:(CGRect)a3 boundingRect:(CGRect)a4 boundingAngle:(double)a5 minSize:(CGSize)a6;
- (NSString)localizedName;
- (PUCropAspect)init;
- (PUCropAspect)initWithWidth:(double)a3 height:(double)a4;
- (double)height;
- (double)heightForWidth:(double)a3;
- (double)ratio;
- (double)width;
- (double)widthForHeight:(double)a3;
- (id)_initWithWidth:(double)a3 height:(double)a4 localizedName:(id)a5;
- (id)description;
- (id)inverseAspect;
- (unint64_t)hash;
- (void)setAllowOrientationChange:(BOOL)a3;
@end

@implementation PUCropAspect

- (void).cxx_destruct
{
}

- (void)setAllowOrientationChange:(BOOL)a3
{
  self->_allowOrientationChange = a3;
}

- (BOOL)allowOrientationChange
{
  return self->_allowOrientationChange;
}

- (NSString)localizedName
{
  return self->_localizedName;
}

- (double)height
{
  return self->_height;
}

- (double)width
{
  return self->_width;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  v5 = [(PUCropAspect *)self localizedName];
  [(PUCropAspect *)self width];
  uint64_t v7 = v6;
  [(PUCropAspect *)self height];
  uint64_t v9 = v8;
  BOOL v10 = [(PUCropAspect *)self isFreeformCrop];
  uint64_t v11 = 0;
  if (!v10) {
    [(PUCropAspect *)self ratio];
  }
  v12 = [v3 stringWithFormat:@"<%@ %p: '%@' width: %f height: %f ratio: %f>", v4, self, v5, v7, v9, v11];

  return v12;
}

- (id)inverseAspect
{
  [(PUCropAspect *)self height];
  double v4 = v3;
  [(PUCropAspect *)self width];
  uint64_t v6 = [[PUCropAspect alloc] initWithWidth:v4 height:v5];
  return v6;
}

- (CGRect)constrainRect:(CGRect)a3 boundingRect:(CGRect)a4 boundingAngle:(double)a5 minSize:(CGSize)a6
{
  double height = a4.size.height;
  double width = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  double v43 = a3.size.height;
  double v40 = a3.size.width;
  if (v52 >= a4.size.width || v53 >= a4.size.height)
  {
    v37 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", *(void *)&a6.width, *(void *)&a6.height, v53);
    [v37 handleFailureInMethod:a2, self, @"PUCropAspect.m", 160, @"Invalid parameter not satisfying: %@", @"minSize.width < boundingRect.size.width && minSize.height < boundingRect.size.height" object file lineNumber description];
  }
  PLRectGetCenter();
  CGFloat v13 = v12;
  CGFloat v15 = v14;
  memset(&v51, 0, sizeof(v51));
  CGAffineTransformMakeTranslation(&v51, -v12, -v14);
  CGAffineTransformMakeRotation(&t2, a5);
  CGAffineTransform t1 = v51;
  CGAffineTransformConcat(&v50, &t1, &t2);
  CGAffineTransform v51 = v50;
  CGAffineTransformMakeTranslation(&v47, v13, v15);
  CGAffineTransform t1 = v51;
  CGAffineTransformConcat(&v50, &t1, &v47);
  CGAffineTransform v51 = v50;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __65__PUCropAspect_constrainRect_boundingRect_boundingAngle_minSize___block_invoke;
  aBlock[3] = &unk_1E5F24650;
  *(double *)&aBlock[5] = v52;
  *(double *)&aBlock[6] = v53;
  aBlock[4] = self;
  v16 = (double (**)(double, double, double, double))_Block_copy(aBlock);
  double v17 = v16[2](width, height, width, height);
  double v19 = v18;
  CGAffineTransform v50 = v51;
  v54.origin.CGFloat x = x;
  v54.origin.CGFloat y = y;
  v54.size.double width = v17;
  v54.size.double height = v19;
  CGRect v55 = CGRectApplyAffineTransform(v54, &v50);
  v55.origin.CGFloat x = fmin(width / v55.size.width, height / v55.size.height);
  double v20 = ((double (*)(double (**)(double, double, double, double), double, double, double, double))v16[2])(v16, v40, v43, v17 * v55.origin.x, v19 * v55.origin.x);
  double v22 = v21;
  PLRectGetCenter();
  double v44 = v51.tx + v23 * v51.c + v51.a * v24;
  double v41 = v51.ty + v23 * v51.d + v51.b * v24;
  double v38 = v20;
  double v25 = v22 * v51.c + v51.a * v20;
  double v26 = v22 * v51.d + v51.b * v20;
  v56.origin.CGFloat x = x;
  v56.origin.CGFloat y = y;
  v56.size.double width = width;
  v56.size.double height = height;
  double v39 = CGRectGetMinX(v56) + v25 * 0.5;
  v57.origin.CGFloat x = x;
  v57.origin.CGFloat y = y;
  v57.size.double width = width;
  v57.size.double height = height;
  double v27 = CGRectGetMinY(v57) + v26 * 0.5;
  v58.origin.CGFloat x = x;
  v58.origin.CGFloat y = y;
  v58.size.double width = width;
  v58.size.double height = height;
  double v28 = CGRectGetMaxX(v58) + v25 * -0.5;
  v59.origin.CGFloat x = x;
  v59.origin.CGFloat y = y;
  v59.size.double width = width;
  v59.size.double height = height;
  double v42 = fmax(v27, fmin(v41, CGRectGetMaxY(v59) + v26 * -0.5));
  CGAffineTransform v50 = v51;
  CGAffineTransformInvert(&v45, &v50);
  float64x2_t v29 = vaddq_f64(*(float64x2_t *)&v45.tx, vmlaq_n_f64(vmulq_n_f64(*(float64x2_t *)&v45.c, v42), *(float64x2_t *)&v45.a, fmax(v39, fmin(v44, v28))));
  double v30 = v29.f64[0] + v38 * -0.5;
  double v31 = v29.f64[1] + v22 * -0.5;

  double v32 = v30;
  double v33 = v31;
  double v34 = v38;
  double v35 = v22;
  result.size.double height = v35;
  result.size.double width = v34;
  result.origin.CGFloat y = v33;
  result.origin.CGFloat x = v32;
  return result;
}

double __65__PUCropAspect_constrainRect_boundingRect_boundingAngle_minSize___block_invoke(uint64_t a1, double a2, double a3, double a4, double a5)
{
  BOOL v8 = a3 > a5 || a2 > a4;
  if (v8) {
    a2 = a4;
  }
  double v9 = fmax(a2, *(double *)(a1 + 40));
  if (v8) {
    double v10 = a5;
  }
  else {
    double v10 = a3;
  }
  objc_msgSend(*(id *)(a1 + 32), "widthForHeight:", fmax(v10, *(double *)(a1 + 48)));
  double v12 = v11;
  [*(id *)(a1 + 32) heightForWidth:v9];
  BOOL v14 = v13 <= a5 && v13 >= *(double *)(a1 + 48);
  if (v12 <= a4 && v12 >= *(double *)(a1 + 40) && v14) {
    return fmax(v9, v12);
  }
  if (v14) {
    return v9;
  }
  return v12;
}

- (double)heightForWidth:(double)a3
{
  [(PUCropAspect *)self ratio];
  return a3 / v4;
}

- (double)widthForHeight:(double)a3
{
  [(PUCropAspect *)self ratio];
  return v4 * a3;
}

- (BOOL)isEquivalentToCropAspect:(id)a3
{
  id v4 = a3;
  if (![(PUCropAspect *)self isFreeformCrop]
    || (v5 = [v4 isFreeformCrop], BOOL v6 = 1, v4) && (v5 & 1) == 0)
  {
    if (-[PUCropAspect isFreeformCrop](self, "isFreeformCrop") || ([v4 isFreeformCrop] & 1) != 0)
    {
      BOOL v6 = 0;
    }
    else
    {
      [(PUCropAspect *)self ratio];
      double v8 = v7;
      [v4 ratio];
      BOOL v6 = vabdd_f64(v8, v9) < 0.01;
    }
  }

  return v6;
}

- (BOOL)isEqualToCropAspect:(id)a3
{
  id v4 = a3;
  if (![(PUCropAspect *)self isFreeformCrop]
    || (v5 = [v4 isFreeformCrop], BOOL v6 = 1, v4) && (v5 & 1) == 0)
  {
    double v7 = [(PUCropAspect *)self localizedName];
    double v8 = [v4 localizedName];
    int v9 = [v7 isEqualToString:v8];

    if (v9
      && ([(PUCropAspect *)self height],
          double v11 = v10,
          [v4 height],
          vabdd_f64(v11, v12) < 2.22044605e-16))
    {
      [(PUCropAspect *)self width];
      double v14 = v13;
      [v4 width];
      BOOL v6 = vabdd_f64(v14, v15) < 2.22044605e-16;
    }
    else
    {
      BOOL v6 = 0;
    }
  }

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (PUCropAspect *)a3;
  if (self == v4)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0 && [(PUCropAspect *)self isEqualToCropAspect:v4];
  }

  return v5;
}

- (unint64_t)hash
{
  double v3 = [NSNumber numberWithDouble:self->_width];
  uint64_t v4 = [v3 hash];
  BOOL v5 = [NSNumber numberWithDouble:self->_height];
  unint64_t v6 = [v5 hash] ^ v4;

  return v6;
}

- (double)ratio
{
  BOOL v3 = [(PUCropAspect *)self isFreeformCrop];
  double result = 1.0;
  if (!v3)
  {
    [(PUCropAspect *)self width];
    double v6 = v5;
    [(PUCropAspect *)self height];
    return v6 / v7;
  }
  return result;
}

- (BOOL)isFreeformCrop
{
  [(PUCropAspect *)self width];
  if (v3 == 0.0) {
    return 1;
  }
  [(PUCropAspect *)self height];
  return v5 == 0.0;
}

- (id)_initWithWidth:(double)a3 height:(double)a4 localizedName:(id)a5
{
  id v9 = a5;
  double v10 = v9;
  if (a3 < 0.0 || a4 < 0.0)
  {
    double v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:a2, self, @"PUCropAspect.m", 88, @"Invalid parameter not satisfying: %@", @"width >= 0 && height >= 0" object file lineNumber description];

    if (v10) {
      goto LABEL_4;
    }
  }
  else if (v9)
  {
    goto LABEL_4;
  }
  v16 = [MEMORY[0x1E4F28B00] currentHandler];
  [v16 handleFailureInMethod:a2, self, @"PUCropAspect.m", 89, @"Invalid parameter not satisfying: %@", @"name != nil" object file lineNumber description];

LABEL_4:
  v17.receiver = self;
  v17.super_class = (Class)PUCropAspect;
  double v11 = [(PUCropAspect *)&v17 init];
  if (v11)
  {
    uint64_t v12 = [v10 copy];
    localizedName = v11->_localizedName;
    v11->_localizedName = (NSString *)v12;

    v11->_double width = a3;
    v11->_double height = a4;
    v11->_allowOrientationChange = a3 != a4;
  }

  return v11;
}

- (PUCropAspect)init
{
  return [(PUCropAspect *)self initWithWidth:1.0 height:1.0];
}

- (PUCropAspect)initWithWidth:(double)a3 height:(double)a4
{
  double v7 = PULocalizedString(@"PHOTOEDIT_CROP_ASPECT_RATIO_TEMPLATE");
  double v8 = PXLocalizedStringFromInteger();
  uint64_t v12 = PXLocalizedStringFromInteger();
  id v9 = PUStringWithValidatedFormat();

  double v10 = -[PUCropAspect _initWithWidth:height:localizedName:](self, "_initWithWidth:height:localizedName:", v9, a3, a4, v8, v12);
  return v10;
}

+ (id)originalAspectForWidth:(unint64_t)a3 height:(unint64_t)a4
{
  double v7 = PULocalizedString(@"PHOTOEDIT_CROP_ASPECT_RATIO_ORIGINAL");
  double v8 = (void *)[objc_alloc((Class)a1) _initWithWidth:v7 height:(double)a3 localizedName:(double)a4];

  return v8;
}

+ (id)allAspectsWithOriginalSize:(CGSize)a3 currentSize:(CGSize)a4
{
  double height = a4.height;
  double width = a4.width;
  double v6 = a3.height;
  double v7 = a3.width;
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v9 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:8];
  if ((unint64_t)v7) {
    BOOL v10 = (unint64_t)v6 == 0;
  }
  else {
    BOOL v10 = 1;
  }
  if (!v10)
  {
    double v11 = objc_msgSend(a1, "originalAspectForWidth:height:");
    [v9 addObject:v11];
  }
  id v12 = objc_alloc((Class)a1);
  double v13 = PULocalizedString(@"PHOTOEDIT_CROP_ASPECT_RATIO_FREEFORM");
  double v14 = (void *)[v12 _initWithWidth:v13 height:0.0 localizedName:0.0];
  [v9 addObject:v14];

  id v15 = objc_alloc((Class)a1);
  v16 = PULocalizedString(@"PHOTOEDIT_CROP_ASPECT_RATIO_SQUARE");
  objc_super v17 = (void *)[v15 _initWithWidth:v16 height:1.0 localizedName:1.0];
  [v9 addObject:v17];

  double v18 = (void *)MGCopyAnswer();
  if (([v18 isEqualToString:@"iPad"] & 1) == 0)
  {
    double v19 = [MEMORY[0x1E4FB1BA8] mainScreen];
    [v19 bounds];
    double v21 = v20;
    double v23 = v22;

    id v24 = objc_alloc((Class)a1);
    double v25 = PULocalizedString(@"PHOTOEDIT_CROP_ASPECT_WALLPAPER");
    double v26 = (void *)[v24 _initWithWidth:v25 height:v21 localizedName:v23];

    [v26 setAllowOrientationChange:0];
    [v9 addObject:v26];
  }
  long long v42 = 0u;
  long long v43 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  uint64_t v27 = [&unk_1F078ACA0 countByEnumeratingWithState:&v40 objects:v44 count:16];
  if (v27)
  {
    uint64_t v28 = v27;
    uint64_t v29 = *(void *)v41;
    do
    {
      for (uint64_t i = 0; i != v28; ++i)
      {
        if (*(void *)v41 != v29) {
          objc_enumerationMutation(&unk_1F078ACA0);
        }
        double v31 = *(void **)(*((void *)&v40 + 1) + 8 * i);
        double v32 = [v31 objectAtIndexedSubscript:0];
        uint64_t v33 = [v32 unsignedIntegerValue];

        double v34 = [v31 objectAtIndexedSubscript:1];
        unint64_t v35 = [v34 unsignedIntegerValue];

        if (width >= height) {
          unint64_t v36 = v35;
        }
        else {
          unint64_t v36 = v33;
        }
        if (width >= height) {
          unint64_t v35 = v33;
        }
        v37 = (void *)[objc_alloc((Class)a1) initWithWidth:(double)v36 height:(double)v35];
        [v9 addObject:v37];
      }
      uint64_t v28 = [&unk_1F078ACA0 countByEnumeratingWithState:&v40 objects:v44 count:16];
    }
    while (v28);
  }
  double v38 = (void *)[v9 copy];

  return v38;
}

@end