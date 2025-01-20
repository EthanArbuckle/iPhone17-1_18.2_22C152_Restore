@interface PKImageResizingConstraints
+ (id)constraintsWithAspectFillToSize:(CGSize)a3;
+ (id)constraintsWithAspectFitToSize:(CGSize)a3;
+ (id)constraintsWithFixedHeight:(double)a3 minAspectRatio:(double)a4 maxAspectRatio:(double)a5;
+ (id)constraintsWithFixedLargeDimenstion:(double)a3 minAspectRatio:(double)a4 maxAspectRatio:(double)a5;
+ (id)constraintsWithFixedSmallDimenstion:(double)a3 minAspectRatio:(double)a4 maxAspectRatio:(double)a5;
+ (id)constraintsWithFixedWidth:(double)a3 minAspectRatio:(double)a4 maxAspectRatio:(double)a5;
+ (id)constraintsWithMaxSize:(CGSize)a3;
+ (id)constraintsWithMaxSize:(CGSize)a3 minAspectRatio:(double)a4 maxAspectRatio:(double)a5;
+ (id)constraintsWithMinSize:(CGSize)a3;
+ (id)constraintsWithMinSize:(CGSize)a3 minAspectRatio:(double)a4 maxAspectRatio:(double)a5;
- (BOOL)_getPixelCropRect:(CGRect *)a3 pixelOutputSize:(CGSize *)a4 forImageSize:(CGSize)a5 scale:(double)a6;
- (BOOL)_reasonable;
- (BOOL)getPixelCropRect:(CGRect *)a3 pixelOutputSize:(CGSize *)a4 forImage:(id)a5;
- (BOOL)outputMirrored;
- (CGRect)_getDrawRectForImage:(CGImage *)a3 withOutputSize:(CGSize)a4;
- (PKImageResizingConstraints)init;
- (double)outputBorderTrim;
- (double)outputCornerRadius;
- (double)outputScale;
- (id)_flippedConstraints;
- (id)resizedImage:(id)a3;
- (void)setOutputBorderTrim:(double)a3;
- (void)setOutputCornerRadius:(double)a3;
- (void)setOutputMirrored:(BOOL)a3;
- (void)setOutputScale:(double)a3;
@end

@implementation PKImageResizingConstraints

- (PKImageResizingConstraints)init
{
  v4.receiver = self;
  v4.super_class = (Class)PKImageResizingConstraints;
  v2 = [(PKImageResizingConstraints *)&v4 init];
  if (v2) {
    v2->_outputScale = PKScreenScale();
  }
  return v2;
}

- (void)setOutputScale:(double)a3
{
  if (a3 == 0.0) {
    a3 = PKScreenScale();
  }
  self->_outputScale = a3;
}

+ (id)constraintsWithFixedWidth:(double)a3 minAspectRatio:(double)a4 maxAspectRatio:(double)a5
{
  v8 = objc_alloc_init(PKImageResizingConstraints);
  v8->_constraintType = 0;
  v8->_fixedDimension = a3;
  v8->_minAspectRatio = a4;
  v8->_maxAspectRatio = a5;
  v8->_respectAspectRatioRange = 1;
  return v8;
}

+ (id)constraintsWithFixedHeight:(double)a3 minAspectRatio:(double)a4 maxAspectRatio:(double)a5
{
  v8 = objc_alloc_init(PKImageResizingConstraints);
  v8->_constraintType = 1;
  v8->_fixedDimension = a3;
  v8->_minAspectRatio = a4;
  v8->_maxAspectRatio = a5;
  v8->_respectAspectRatioRange = 1;
  return v8;
}

+ (id)constraintsWithFixedLargeDimenstion:(double)a3 minAspectRatio:(double)a4 maxAspectRatio:(double)a5
{
  v8 = objc_alloc_init(PKImageResizingConstraints);
  v8->_constraintType = 2;
  v8->_fixedDimension = a3;
  v8->_minAspectRatio = a4;
  v8->_maxAspectRatio = a5;
  v8->_respectAspectRatioRange = 1;
  return v8;
}

+ (id)constraintsWithFixedSmallDimenstion:(double)a3 minAspectRatio:(double)a4 maxAspectRatio:(double)a5
{
  v8 = objc_alloc_init(PKImageResizingConstraints);
  v8->_constraintType = 3;
  v8->_fixedDimension = a3;
  v8->_minAspectRatio = a4;
  v8->_maxAspectRatio = a5;
  v8->_respectAspectRatioRange = 1;
  return v8;
}

+ (id)constraintsWithMaxSize:(CGSize)a3 minAspectRatio:(double)a4 maxAspectRatio:(double)a5
{
  CGFloat height = a3.height;
  CGFloat width = a3.width;
  v9 = objc_alloc_init(PKImageResizingConstraints);
  v9->_constraintType = 6;
  v9->_size.CGFloat width = width;
  v9->_size.CGFloat height = height;
  v9->_minAspectRatio = a4;
  v9->_maxAspectRatio = a5;
  v9->_respectAspectRatioRange = 1;
  return v9;
}

+ (id)constraintsWithMinSize:(CGSize)a3 minAspectRatio:(double)a4 maxAspectRatio:(double)a5
{
  CGFloat height = a3.height;
  CGFloat width = a3.width;
  v9 = objc_alloc_init(PKImageResizingConstraints);
  v9->_constraintType = 7;
  v9->_size.CGFloat width = width;
  v9->_size.CGFloat height = height;
  v9->_minAspectRatio = a4;
  v9->_maxAspectRatio = a5;
  v9->_respectAspectRatioRange = 1;
  return v9;
}

+ (id)constraintsWithMaxSize:(CGSize)a3
{
  CGFloat height = a3.height;
  CGFloat width = a3.width;
  v5 = objc_alloc_init(PKImageResizingConstraints);
  v5->_constraintType = 6;
  v5->_size.CGFloat width = width;
  v5->_size.CGFloat height = height;
  return v5;
}

+ (id)constraintsWithMinSize:(CGSize)a3
{
  CGFloat height = a3.height;
  CGFloat width = a3.width;
  v5 = objc_alloc_init(PKImageResizingConstraints);
  v5->_constraintType = 7;
  v5->_size.CGFloat width = width;
  v5->_size.CGFloat height = height;
  return v5;
}

+ (id)constraintsWithAspectFillToSize:(CGSize)a3
{
  CGFloat height = a3.height;
  CGFloat width = a3.width;
  v5 = objc_alloc_init(PKImageResizingConstraints);
  v5->_constraintType = 4;
  v5->_size.CGFloat width = width;
  v5->_size.CGFloat height = height;
  return v5;
}

+ (id)constraintsWithAspectFitToSize:(CGSize)a3
{
  CGFloat height = a3.height;
  CGFloat width = a3.width;
  v5 = objc_alloc_init(PKImageResizingConstraints);
  v5->_constraintType = 5;
  v5->_size.CGFloat width = width;
  v5->_size.CGFloat height = height;
  return v5;
}

- (id)resizedImage:(id)a3
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  memset(&v30, 0, sizeof(v30));
  double v28 = 0.0;
  double v29 = 0.0;
  v5 = 0;
  if ([(PKImageResizingConstraints *)self getPixelCropRect:&v30 pixelOutputSize:&v28 forImage:v4])
  {
    BitmapContext = _CreateBitmapContext(0, 0, 0, v28, v29, 1.0);
    if (!BitmapContext) {
      goto LABEL_11;
    }
    v7 = BitmapContext;
    id v8 = v4;
    v9 = (CGImage *)[v8 imageRef];
    v10 = CGImageCreateWithImageInRect(v9, v30);
    -[PKImageResizingConstraints _getDrawRectForImage:withOutputSize:](self, "_getDrawRectForImage:withOutputSize:", v10, v28, v29);
    double v15 = v14;
    CGFloat v16 = v11;
    CGFloat v17 = v12;
    CGFloat v18 = v13;
    double outputCornerRadius = self->_outputCornerRadius;
    if (outputCornerRadius > 0.0)
    {
      +[PKRoundedPath pathWithRoundedRect:cornerRadius:](PKRoundedPath, "pathWithRoundedRect:cornerRadius:", v15, v11, v12, v13, outputCornerRadius * self->_outputScale);
      id v20 = objc_claimAutoreleasedReturnValue();
      v21 = (const CGPath *)[v20 CGPath];

      CGContextBeginPath(v7);
      CGContextAddPath(v7, v21);
      CGContextClosePath(v7);
      CGContextClip(v7);
    }
    if (v10)
    {
      v35.origin.x = v15;
      v35.origin.y = v16;
      v35.size.CGFloat width = v17;
      v35.size.CGFloat height = v18;
      CGContextDrawImage(v7, v35, v10);
      CFRelease(v10);
    }
    CGImageRef Image = CGBitmapContextCreateImage(v7);
    CFRelease(v7);
    if (Image)
    {
      BOOL outputMirrored = self->_outputMirrored;
      uint64_t v24 = [v8 orientation];
      uint64_t v25 = v24;
      if (outputMirrored)
      {
        if ((unint64_t)(v24 - 1) > 7) {
          uint64_t v25 = 0;
        }
        else {
          uint64_t v25 = qword_191673A10[v24 - 1];
        }
      }
      v5 = [[PKImage alloc] initWithCGImage:Image scale:v25 orientation:self->_outputScale];
      CFRelease(Image);
    }
    else
    {
LABEL_11:
      v26 = PKLogFacilityTypeGetObject(0);
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        id v32 = v4;
        _os_log_impl(&dword_190E10000, v26, OS_LOG_TYPE_DEFAULT, "PKImageResizingConstraints: failed to resize image %p - could not create destination context.", buf, 0xCu);
      }

      v5 = 0;
    }
  }

  return v5;
}

- (BOOL)getPixelCropRect:(CGRect *)a3 pixelOutputSize:(CGSize *)a4 forImage:(id)a5
{
  id v8 = a5;
  if ((unint64_t)([v8 orientation] - 1) > 3)
  {
    CGFloat v16 = [(PKImageResizingConstraints *)self _flippedConstraints];
    [v8 size];
    double v18 = v17;
    double v20 = v19;
    [v8 scale];
    double v22 = v21;

    char v23 = objc_msgSend(v16, "_getPixelCropRect:pixelOutputSize:forImageSize:scale:", a3, a4, v18, v20, v22);
    return v23;
  }
  else
  {
    [v8 size];
    double v10 = v9;
    double v12 = v11;
    [v8 scale];
    double v14 = v13;

    return -[PKImageResizingConstraints _getPixelCropRect:pixelOutputSize:forImageSize:scale:](self, "_getPixelCropRect:pixelOutputSize:forImageSize:scale:", a3, a4, v10, v12, v14);
  }
}

- (BOOL)_getPixelCropRect:(CGRect *)a3 pixelOutputSize:(CGSize *)a4 forImageSize:(CGSize)a5 scale:(double)a6
{
  double v7 = self->_outputBorderTrim * a6;
  double v8 = v7 * -2.0 + a5.width * a6;
  double v9 = v7 * -2.0 + a5.height * a6;
  BOOL v10 = v9 > 0.0 && v8 > 0.0;
  if (!v10) {
    return v10;
  }
  int constraintType = self->_constraintType;
  double v12 = v8 / v9;
  if (constraintType == 4)
  {
    double minAspectRatio = self->_size.width / self->_size.height;
  }
  else
  {
    double minAspectRatio = v8 / v9;
    if (self->_respectAspectRatioRange)
    {
      double minAspectRatio = self->_minAspectRatio;
      double maxAspectRatio = self->_maxAspectRatio;
      if (maxAspectRatio >= v12) {
        double maxAspectRatio = v8 / v9;
      }
      if (minAspectRatio <= maxAspectRatio) {
        double minAspectRatio = maxAspectRatio;
      }
    }
  }
  if (v12 > minAspectRatio + 0.00000011920929)
  {
    float v15 = (v8 - v9 * minAspectRatio) * 0.5;
    double v16 = v7;
    double v7 = v7 + floorf(v15);
    double v8 = v9 * minAspectRatio;
    if (!a3) {
      goto LABEL_15;
    }
    goto LABEL_14;
  }
  if (v12 < minAspectRatio + -0.00000011920929)
  {
    float v18 = (v9 - v8 / minAspectRatio) * 0.5;
    double v16 = v7 + floorf(v18);
    double v9 = v8 / minAspectRatio;
    if (!a3) {
      goto LABEL_15;
    }
LABEL_14:
    a3->origin.x = v7;
    a3->origin.y = v16;
    a3->size.CGFloat width = v8;
    a3->size.CGFloat height = v9;
    int constraintType = self->_constraintType;
    goto LABEL_15;
  }
  double v16 = v7;
  if (a3) {
    goto LABEL_14;
  }
LABEL_15:
  switch(constraintType)
  {
    case 0:
      double v8 = self->_fixedDimension * self->_outputScale;
      goto LABEL_30;
    case 1:
      double v9 = self->_fixedDimension * self->_outputScale;
      double v8 = minAspectRatio * v9;
      if (!a4) {
        return v10;
      }
      goto LABEL_49;
    case 2:
      double v8 = self->_fixedDimension * self->_outputScale;
      if (minAspectRatio <= 1.0) {
        goto LABEL_27;
      }
      goto LABEL_30;
    case 3:
      double v8 = self->_fixedDimension * self->_outputScale;
      if (minAspectRatio >= 1.0)
      {
LABEL_27:
        double v9 = v8;
        double v8 = minAspectRatio * v8;
        if (!a4) {
          return v10;
        }
      }
      else
      {
LABEL_30:
        double v9 = v8 / minAspectRatio;
        if (!a4) {
          return v10;
        }
      }
LABEL_49:
      a4->CGFloat width = v8;
      a4->CGFloat height = v9;
      break;
    case 4:
    case 5:
      double outputScale = self->_outputScale;
      double v8 = self->_size.width * outputScale;
      double v9 = outputScale * self->_size.height;
      if (!a4) {
        return v10;
      }
      goto LABEL_49;
    case 6:
      double v19 = self->_outputScale;
      double v20 = self->_size.width * v19;
      double v21 = v19 * self->_size.height;
      if (v8 <= v20 && v9 <= v21) {
        goto LABEL_48;
      }
      double v23 = v20 / v8;
      double v24 = v21 / v9;
      if (v23 < v24) {
        double v24 = v23;
      }
      float v25 = v8 * v24;
      double v8 = floorf(v25);
      float v26 = v9 * v24;
      float v27 = floorf(v26);
      goto LABEL_47;
    case 7:
      double v28 = self->_outputScale;
      double v29 = self->_size.width * v28;
      double v30 = v28 * self->_size.height;
      if (v8 >= v29 && v9 >= v30) {
        goto LABEL_48;
      }
      double v32 = v29 / v8;
      double v33 = v30 / v9;
      if (v32 > v33) {
        double v33 = v32;
      }
      float v34 = v8 * v33;
      double v8 = ceilf(v34);
      float v35 = v9 * v33;
      float v27 = ceilf(v35);
LABEL_47:
      double v9 = v27;
LABEL_48:
      if (a4) {
        goto LABEL_49;
      }
      return v10;
    default:
      double v8 = *MEMORY[0x1E4F1DB30];
      double v9 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
      if (!a4) {
        return v10;
      }
      goto LABEL_49;
  }
  return v10;
}

- (CGRect)_getDrawRectForImage:(CGImage *)a3 withOutputSize:(CGSize)a4
{
  double height = a4.height;
  double width = a4.width;
  if (self->_constraintType == 5)
  {
    size_t v8 = CGImageGetWidth(a3);
    double v9 = (double)v8;
    size_t v10 = CGImageGetHeight(a3);
    double v11 = (double)v10;
    double v12 = width / (double)v8;
    if (!v8) {
      double v12 = 1.0;
    }
    double v13 = height / v11;
    if (!v10) {
      double v13 = 1.0;
    }
    if (fmin(v12, v13) != 1.0)
    {
      if (v12 >= v13)
      {
        double v9 = height * (v9 / v11);
        double v11 = height;
      }
      else
      {
        double v11 = width * (v11 / v9);
        double v9 = width;
      }
    }
    double v14 = PKSizeAlignedInRectWithScale(0x100000001uLL, v9, v11, *MEMORY[0x1E4F1DAD8], *(CGFloat *)(MEMORY[0x1E4F1DAD8] + 8), width, height, self->_outputScale);
    double width = v16;
    double height = v17;
  }
  else
  {
    double v14 = *MEMORY[0x1E4F1DAD8];
    double v15 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  }
  double v18 = width;
  double v19 = height;
  result.size.double height = v19;
  result.size.double width = v18;
  result.origin.y = v15;
  result.origin.x = v14;
  return result;
}

- (BOOL)_reasonable
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  double fixedDimension = self->_fixedDimension;
  BOOL v4 = fixedDimension <= 2048.0;
  if (fixedDimension < 10.0) {
    BOOL v4 = 0;
  }
  if (self->_respectAspectRatioRange)
  {
    BOOL v5 = 0;
    double minAspectRatio = self->_minAspectRatio;
    if (minAspectRatio <= 5.0 && minAspectRatio >= 0.200000003)
    {
      double maxAspectRatio = self->_maxAspectRatio;
      BOOL v5 = maxAspectRatio <= 5.0;
      if (maxAspectRatio < 0.200000003) {
        BOOL v5 = 0;
      }
      if (minAspectRatio > maxAspectRatio) {
        BOOL v5 = 0;
      }
    }
  }
  else
  {
    BOOL v5 = 1;
  }
  double width = self->_size.width;
  if (width > 2048.0 || width < 10.0)
  {
    BOOL v11 = 0;
  }
  else
  {
    double height = self->_size.height;
    BOOL v11 = height >= 10.0;
    if (height > 2048.0) {
      BOOL v11 = 0;
    }
  }
  double outputScale = self->_outputScale;
  BOOL v13 = outputScale == 1.0;
  if (outputScale == 2.0) {
    BOOL v13 = 1;
  }
  if (outputScale == 3.0) {
    BOOL v13 = 1;
  }
  if (outputScale == 4.0) {
    BOOL v13 = 1;
  }
  unsigned int constraintType = self->_constraintType;
  if (constraintType - 4 < 4)
  {
    int v15 = v11 && v13;
  }
  else
  {
    if (constraintType > 3) {
      goto LABEL_32;
    }
    int v15 = v4 && v13;
  }
  if (v15 & v5) {
    return 1;
  }
LABEL_32:
  double v17 = PKLogFacilityTypeGetObject(0);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
  {
    double v19 = self->_minAspectRatio;
    double v18 = self->_maxAspectRatio;
    CGFloat v20 = self->_size.height;
    v21[0] = 67110656;
    v21[1] = constraintType;
    __int16 v22 = 2048;
    double v23 = fixedDimension;
    __int16 v24 = 2048;
    double v25 = v19;
    __int16 v26 = 2048;
    double v27 = v18;
    __int16 v28 = 2048;
    double v29 = width;
    __int16 v30 = 2048;
    CGFloat v31 = v20;
    __int16 v32 = 2048;
    double v33 = outputScale;
    _os_log_error_impl(&dword_190E10000, v17, OS_LOG_TYPE_ERROR, "Unreasonable constraints: <type: %d, dimen: %f, ratio: (%f, %f), size: (%f, %f), scale: %f>", (uint8_t *)v21, 0x44u);
  }

  return 0;
}

- (id)_flippedConstraints
{
  v3 = objc_alloc_init(PKImageResizingConstraints);
  v3->_double fixedDimension = self->_fixedDimension;
  float64x2_t v4 = (float64x2_t)vextq_s8(*(int8x16_t *)&self->_minAspectRatio, *(int8x16_t *)&self->_minAspectRatio, 8uLL);
  __asm { FMOV            V2.2D, #1.0 }
  *(int8x16_t *)&v3->_double minAspectRatio = vbicq_s8((int8x16_t)vdivq_f64(_Q2, v4), (int8x16_t)vceqzq_f64(v4));
  v3->_respectAspectRatioRange = self->_respectAspectRatioRange;
  v3->_size = (CGSize)vextq_s8((int8x16_t)self->_size, (int8x16_t)self->_size, 8uLL);
  v3->_double outputScale = self->_outputScale;
  v3->_outputBorderTrim = self->_outputBorderTrim;
  v3->_BOOL outputMirrored = self->_outputMirrored;
  int constraintType = self->_constraintType;
  if (constraintType)
  {
    if (constraintType == 1) {
      int constraintType = 0;
    }
  }
  else
  {
    int constraintType = 1;
  }
  v3->_int constraintType = constraintType;
  return v3;
}

- (double)outputScale
{
  return self->_outputScale;
}

- (double)outputBorderTrim
{
  return self->_outputBorderTrim;
}

- (void)setOutputBorderTrim:(double)a3
{
  self->_outputBorderTrim = a3;
}

- (double)outputCornerRadius
{
  return self->_outputCornerRadius;
}

- (void)setOutputCornerRadius:(double)a3
{
  self->_double outputCornerRadius = a3;
}

- (BOOL)outputMirrored
{
  return self->_outputMirrored;
}

- (void)setOutputMirrored:(BOOL)a3
{
  self->_BOOL outputMirrored = a3;
}

@end