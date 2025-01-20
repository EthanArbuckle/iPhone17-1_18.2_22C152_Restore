@interface PFCropUtilities
+ (BOOL)_rectIsValid:(CGRect)a3;
+ (CGFloat)_interpolationV2ScoreForFocusRegion:(double)a3 insideCropRect:(double)a4 withImportantRect:(double)a5;
+ (CGPoint)_translationToIncludeRect:(CGRect)a3 insideRect:(CGRect)a4;
+ (CGRect)_faceAreaRectWithPadding:(CGRect)a3;
+ (CGRect)bestCropRectV2ForAspectRatio:(double)a3 sourcePixelWidth:(unint64_t)a4 sourcePixelHeight:(unint64_t)a5 sourceEssentialAreaRect:(CGRect)a6 sourceSecondaryEssentialAreaRect:(CGRect)a7;
+ (CGRect)bestCropRectV2ForAspectRatio:(double)a3 sourcePixelWidth:(unint64_t)a4 sourcePixelHeight:(unint64_t)a5 sourceEssentialAreaRect:(CGRect)a6 sourceSecondaryEssentialAreaRect:(CGRect)a7 outputCropScore:(double *)a8;
+ (CGRect)bestCropRectV2ForAspectRatio:(double)a3 zoom:(double)a4 sourcePixelWidth:(unint64_t)a5 sourcePixelHeight:(unint64_t)a6 sourceEssentialAreaRect:(CGRect)a7 sourceSecondaryEssentialAreaRect:(CGRect)a8 outputCropScore:(double *)a9;
+ (CGSize)_interpolationCropSizeForRatio:(double)a3 andZoom:(double)a4 forImageSize:(CGSize)a5;
+ (double)_interpolationCropToSize:(double)a3 withinRect:(double)a4 withPreferredRect:(double)a5 andAcceptableRect:(double)a6 outputScore:(uint64_t)a7;
+ (double)_interpolationFactorFor:(double)a3 between:(double)a4 and:(double)a5;
+ (double)_interpolationV2AdjustedCrop:(double)a3 toFocusRegion:(double)a4 withFullsizeRect:(double)a5 andImportantRect:(double)a6;
+ (double)_interpolationV2CropForAspectRatio:(double)a3 withFocusRegion:(double)a4 andAcceptableRect:(double)a5 andPreferredRect:(uint64_t)a6 andImageRect:(uint64_t)a7 outputCropScore:(double *)a8;
+ (double)_interpolationWithFactor:(double)a3 between:(double)a4 and:(double)a5;
+ (double)_rectDimensionOffset:(CGRect)a3 insideRect:(CGRect)a4 forEdge:(unsigned int)a5;
+ (double)_rectDimensionSize:(CGRect)a3 forEdge:(unsigned int)a4;
+ (double)bestCropRectV2ForPosterClassification:(double)a3 layoutConfiguration:(double)a4 sourcePixelWidth:(double)a5 sourcePixelHeight:(double)a6 sourcePreferredCropRectNormalized:(double)a7 sourceAcceptableCropRectNormalized:(double)a8 sourceFaceAreaRectNormalized:(uint64_t)a9 outputCropScore:(uint64_t)a10 outputLayoutScore:(unint64_t)a11 outputClockOverlapAcceptable:(void *)a12;
+ (uint64_t)_interpolationCropForAspectRatio:(double)a3 acceptableRect:(double)a4 andPreferredRect:(double)a5 andImageRect:(double)a6 outputCropScore:(double)a7;
+ (uint64_t)_interpolationCropForAspectRatio:(uint64_t)a3 andZoom:(uint64_t)a4 acceptableRect:(uint64_t)a5 andPreferredRect:(double)a6 andImageRect:(double)a7 outputCropScore:(double)a8;
+ (uint64_t)_interpolationV2MaxCropSizeForAspectRatio:(double)a3 andZoom:(double)a4 withFocusRegion:(double)a5 forImageSize:(double)a6 withImportantRect:(double)a7;
+ (uint64_t)_interpolationV2ScoreAlongEdge:(double)a3 forCrop:(double)a4 withFullsizeRect:(double)a5 andPreferredRect:(double)a6 andAcceptableRect:(double)a7;
+ (uint64_t)_interpolationV2ScoreForCrop:(double)a3 withFullsizeRect:(double)a4 andPreferredRect:(double)a5 andAcceptableRect:(double)a6;
+ (uint64_t)bestCropRectForAspectRatio:verticalContentMode:cropMode:sourcePixelWidth:sourcePixelHeight:sourcePreferredCropRectNormalized:sourceAcceptableCropRectNormalized:sourceFaceAreaRectNormalized:;
+ (uint64_t)bestCropRectV2ForAspectRatio:(CGFloat)a3 withFocusRegion:(CGFloat)a4 sourcePixelWidth:(CGFloat)a5 sourcePixelHeight:(CGFloat)a6 sourcePreferredCropRectNormalized:(uint64_t)a7 sourceAcceptableCropRectNormalized:(unint64_t)a8 sourceFaceAreaRectNormalized:(unint64_t)a9 outputCropScore:(double *)a10;
+ (uint64_t)bestCropRectV2ForAspectRatio:(uint64_t)a3 withFocusRegion:(uint64_t)a4 sourcePixelWidth:sourcePixelHeight:sourcePreferredCropRectNormalized:sourceAcceptableCropRectNormalized:sourceFaceAreaRectNormalized:;
+ (uint64_t)scoreForCropRect:(double)a3 sourcePixelWidth:(double)a4 sourcePixelHeight:(double)a5 sourceEssentialAreaRect:(double)a6 sourceSecondaryEssentialAreaRect:(double)a7;
@end

@implementation PFCropUtilities

+ (CGRect)_faceAreaRectWithPadding:(CGRect)a3
{
  if (a3.size.width >= a3.size.height) {
    double height = a3.size.height;
  }
  else {
    double height = a3.size.width;
  }
  double v4 = a3.origin.x + height * -0.1;
  double v5 = a3.origin.y + height * -0.25;
  double v6 = a3.size.width + height * 0.2;
  double v7 = a3.size.height + height * 0.75;
  result.size.double height = v7;
  result.size.width = v6;
  result.origin.y = v5;
  result.origin.x = v4;
  return result;
}

+ (CGPoint)_translationToIncludeRect:(CGRect)a3 insideRect:(CGRect)a4
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  double v8 = a3.size.height;
  double v9 = a3.size.width;
  double v10 = a3.origin.y;
  double v11 = a3.origin.x;
  +[PFCropUtilities _rectDimensionOffset:insideRect:forEdge:](PFCropUtilities, "_rectDimensionOffset:insideRect:forEdge:", 0);
  double v20 = v12;
  +[PFCropUtilities _rectDimensionOffset:insideRect:forEdge:](PFCropUtilities, "_rectDimensionOffset:insideRect:forEdge:", 2, v11, v10, v9, v8, x, y, width, height);
  double v19 = v13;
  +[PFCropUtilities _rectDimensionOffset:insideRect:forEdge:](PFCropUtilities, "_rectDimensionOffset:insideRect:forEdge:", 1, v11, v10, v9, v8, x, y, width, height);
  double v18 = v14;
  +[PFCropUtilities _rectDimensionOffset:insideRect:forEdge:](PFCropUtilities, "_rectDimensionOffset:insideRect:forEdge:", 3, v11, v10, v9, v8, x, y, width, height);
  double v16 = fmin(v15, 0.0) - fmin(v18, 0.0);
  double v17 = fmin(v19, 0.0) - fmin(v20, 0.0);
  result.double y = v16;
  result.double x = v17;
  return result;
}

+ (double)_rectDimensionOffset:(CGRect)a3 insideRect:(CGRect)a4 forEdge:(unsigned int)a5
{
  CGFloat height = a4.size.height;
  CGFloat width = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  CGFloat v9 = a3.size.height;
  CGFloat v10 = a3.size.width;
  CGFloat v11 = a3.origin.y;
  CGFloat v12 = a3.origin.x;
  switch(a5)
  {
    case 0u:
      double MinX = CGRectGetMinX(a3);
      v18.origin.CGFloat x = x;
      v18.origin.CGFloat y = y;
      v18.size.CGFloat width = width;
      v18.size.CGFloat height = height;
      double MinY = CGRectGetMinX(v18);
      goto LABEL_4;
    case 1u:
      double MinX = CGRectGetMinY(a3);
      v19.origin.CGFloat x = x;
      v19.origin.CGFloat y = y;
      v19.size.CGFloat width = width;
      v19.size.CGFloat height = height;
      double MinY = CGRectGetMinY(v19);
LABEL_4:
      a3.origin.CGFloat x = MinX - MinY;
      return a3.origin.x;
    case 2u:
      double MaxX = CGRectGetMaxX(a4);
      v20.origin.CGFloat x = v12;
      v20.origin.CGFloat y = v11;
      v20.size.CGFloat width = v10;
      v20.size.CGFloat height = v9;
      double MaxY = CGRectGetMaxX(v20);
      goto LABEL_7;
    case 3u:
      double MaxX = CGRectGetMaxY(a4);
      v21.origin.CGFloat x = v12;
      v21.origin.CGFloat y = v11;
      v21.size.CGFloat width = v10;
      v21.size.CGFloat height = v9;
      double MaxY = CGRectGetMaxY(v21);
LABEL_7:
      a3.origin.CGFloat x = MaxX - MaxY;
      break;
    default:
      return a3.origin.x;
  }
  return a3.origin.x;
}

+ (double)_rectDimensionSize:(CGRect)a3 forEdge:(unsigned int)a4
{
  switch(a4)
  {
    case 0u:
    case 2u:
      a3.origin.CGFloat x = a3.size.width;
      break;
    case 1u:
    case 3u:
      a3.origin.CGFloat x = a3.size.height;
      break;
    default:
      return a3.origin.x;
  }
  return a3.origin.x;
}

+ (BOOL)_rectIsValid:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  if (CGRectIsNull(a3)) {
    return 0;
  }
  BOOL v7 = height > 0.0;
  if (width <= 0.0) {
    BOOL v7 = 0;
  }
  if (y < 0.0) {
    BOOL v7 = 0;
  }
  return x >= 0.0 && v7;
}

+ (uint64_t)_interpolationV2ScoreAlongEdge:(double)a3 forCrop:(double)a4 withFullsizeRect:(double)a5 andPreferredRect:(double)a6 andAcceptableRect:(double)a7
{
  +[PFCropUtilities _rectDimensionOffset:insideRect:forEdge:](PFCropUtilities, "_rectDimensionOffset:insideRect:forEdge:", a1, a2, a3, a4, a5);
  double v36 = v29;
  +[PFCropUtilities _rectDimensionOffset:insideRect:forEdge:](PFCropUtilities, "_rectDimensionOffset:insideRect:forEdge:", a11, a12, a13, a14, a15, a5, a6, a7, a8);
  double v35 = v30;
  +[PFCropUtilities _rectDimensionOffset:insideRect:forEdge:](PFCropUtilities, "_rectDimensionOffset:insideRect:forEdge:", a11, a16, a17, a18, a19, a5, a6, a7, a8);
  double v32 = v31;
  uint64_t result = +[PFCropUtilities _rectDimensionSize:forEdge:](PFCropUtilities, "_rectDimensionSize:forEdge:", a11, a16, a17, a18, a19);
  if (v36 > 0.0)
  {
    if (v36 <= v35)
    {
      +[PFCropUtilities _interpolationFactorFor:between:and:](PFCropUtilities, "_interpolationFactorFor:between:and:", v36, 0.0);
    }
    else if (v36 <= v32)
    {
      +[PFCropUtilities _interpolationFactorFor:v36 between:v35 and:v32];
    }
    else
    {
      if (v36 > v32 + v34) {
        return result;
      }
      +[PFCropUtilities _interpolationFactorFor:between:and:](PFCropUtilities, "_interpolationFactorFor:between:and:", v36, v32);
    }
    return +[PFCropUtilities _interpolationWithFactor:between:and:](PFCropUtilities, "_interpolationWithFactor:between:and:");
  }
  return result;
}

+ (CGFloat)_interpolationV2ScoreForFocusRegion:(double)a3 insideCropRect:(double)a4 withImportantRect:(double)a5
{
  v23.origin.double x = a5 + a1 * a7;
  v23.origin.double y = a6 + a2 * a8;
  v23.size.double width = a3 * a7;
  v23.size.double height = a4 * a8;
  v21.origin.double x = a9;
  v21.origin.double y = a10;
  v21.size.double width = a11;
  v21.size.double height = a12;
  CGRect v22 = CGRectIntersection(v21, v23);
  return v22.size.width * v22.size.height / (a11 * a12);
}

+ (uint64_t)_interpolationV2ScoreForCrop:(double)a3 withFullsizeRect:(double)a4 andPreferredRect:(double)a5 andAcceptableRect:(double)a6
{
  return +[PFCropUtilities _interpolationV2ScoreAlongEdge:forCrop:withFullsizeRect:andPreferredRect:andAcceptableRect:](PFCropUtilities, "_interpolationV2ScoreAlongEdge:forCrop:withFullsizeRect:andPreferredRect:andAcceptableRect:", 3, a1, a2, a3, a4, a5, a6, a7, a8, a17, a18, a19, a20, a21, a22, a23, a24);
}

+ (double)_interpolationV2AdjustedCrop:(double)a3 toFocusRegion:(double)a4 withFullsizeRect:(double)a5 andImportantRect:(double)a6
{
  +[PFCropUtilities _translationToIncludeRect:insideRect:](PFCropUtilities, "_translationToIncludeRect:insideRect:", a13, a14, a15, a16, a1 + a5 * a3, a2 + a6 * a4, a3 * a7, a4 * a8);
  double v29 = a1 - v28;
  +[PFCropUtilities _translationToIncludeRect:insideRect:](PFCropUtilities, "_translationToIncludeRect:insideRect:", v29, a2 - v30, a3, a4, a9, a10, a11, a12);
  return v29 + v31;
}

+ (uint64_t)_interpolationV2MaxCropSizeForAspectRatio:(double)a3 andZoom:(double)a4 withFocusRegion:(double)a5 forImageSize:(double)a6 withImportantRect:(double)a7
{
  double v23 = *MEMORY[0x1E4F1DAD8];
  double v22 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  +[PFCropUtilities _rectDimensionSize:forEdge:](PFCropUtilities, "_rectDimensionSize:forEdge:", 0, a9, a10, a11, a12);
  +[PFCropUtilities _rectDimensionSize:forEdge:](PFCropUtilities, "_rectDimensionSize:forEdge:", 1, a9, a10, a11, a12);
  +[PFCropUtilities _rectDimensionOffset:insideRect:forEdge:](PFCropUtilities, "_rectDimensionOffset:insideRect:forEdge:", 0, a9, a10, a11, a12, v23, v22, a7, a8);
  +[PFCropUtilities _rectDimensionOffset:insideRect:forEdge:](PFCropUtilities, "_rectDimensionOffset:insideRect:forEdge:", 2, a9, a10, a11, a12, v23, v22, a7, a8);
  +[PFCropUtilities _rectDimensionOffset:insideRect:forEdge:](PFCropUtilities, "_rectDimensionOffset:insideRect:forEdge:", 1, a9, a10, a11, a12, v23, v22, a7, a8);
  +[PFCropUtilities _rectDimensionOffset:insideRect:forEdge:](PFCropUtilities, "_rectDimensionOffset:insideRect:forEdge:", 3, a9, a10, a11, a12, v23, v22, a7, a8);
  +[PFCropUtilities _rectDimensionSize:forEdge:](PFCropUtilities, "_rectDimensionSize:forEdge:", 0, a3, a4, a5, a6);
  +[PFCropUtilities _rectDimensionSize:forEdge:](PFCropUtilities, "_rectDimensionSize:forEdge:", 1, a3, a4, a5, a6);
  +[PFCropUtilities _rectDimensionOffset:insideRect:forEdge:](PFCropUtilities, "_rectDimensionOffset:insideRect:forEdge:", 0, a3, a4, a5, a6, 0.0, 0.0, 1.0, 1.0);
  +[PFCropUtilities _rectDimensionOffset:insideRect:forEdge:](PFCropUtilities, "_rectDimensionOffset:insideRect:forEdge:", 2, a3, a4, a5, a6, 0.0, 0.0, 1.0, 1.0);
  +[PFCropUtilities _rectDimensionOffset:insideRect:forEdge:](PFCropUtilities, "_rectDimensionOffset:insideRect:forEdge:", 1, a3, a4, a5, a6, 0.0, 0.0, 1.0, 1.0);
  return +[PFCropUtilities _rectDimensionOffset:insideRect:forEdge:](PFCropUtilities, "_rectDimensionOffset:insideRect:forEdge:", 3, a3, a4, a5, a6, 0.0, 0.0, 1.0, 1.0);
}

+ (double)_interpolationV2CropForAspectRatio:(double)a3 withFocusRegion:(double)a4 andAcceptableRect:(double)a5 andPreferredRect:(uint64_t)a6 andImageRect:(uint64_t)a7 outputCropScore:(double *)a8
{
  +[PFCropUtilities _interpolationV2MaxCropSizeForAspectRatio:andZoom:withFocusRegion:forImageSize:withImportantRect:](PFCropUtilities, "_interpolationV2MaxCropSizeForAspectRatio:andZoom:withFocusRegion:forImageSize:withImportantRect:", a1, 1.0, a2, a3, a4, a5, a27, a28, a17, a18, a19, a20);
  +[PFCropUtilities _interpolationCropToSize:withinRect:withPreferredRect:andAcceptableRect:outputScore:](PFCropUtilities, "_interpolationCropToSize:withinRect:withPreferredRect:andAcceptableRect:outputScore:", a8, a21, a22, a23, a24, a17, a18, a19, a20);
  +[PFCropUtilities _interpolationV2AdjustedCrop:toFocusRegion:withFullsizeRect:andImportantRect:](PFCropUtilities, "_interpolationV2AdjustedCrop:toFocusRegion:withFullsizeRect:andImportantRect:", *(void *)&a25, *(void *)&a26, *(void *)&a27, *(void *)&a28, a17, a18, a19, a20);
  double v30 = v26;
  double v31 = v27;
  double v32 = v28;
  double v33 = v29;
  if (a8)
  {
    +[PFCropUtilities _interpolationV2ScoreForCrop:withFullsizeRect:andPreferredRect:andAcceptableRect:](PFCropUtilities, "_interpolationV2ScoreForCrop:withFullsizeRect:andPreferredRect:andAcceptableRect:", v26, v27, v28, v29, a25, a26, a27, a28, a21, a22, a23, a24, a17, a18, a19, a20);
    double v37 = v34;
    +[PFCropUtilities _interpolationV2ScoreForFocusRegion:insideCropRect:withImportantRect:](PFCropUtilities, "_interpolationV2ScoreForFocusRegion:insideCropRect:withImportantRect:", a2, a3, a4, a5, v30, v31, v32, v33, a17, a18, a19, a20);
    *a8 = v37 * v35;
  }
  return v30;
}

+ (double)_interpolationWithFactor:(double)a3 between:(double)a4 and:(double)a5
{
  return a4 + a3 * (a5 - a4);
}

+ (double)_interpolationFactorFor:(double)a3 between:(double)a4 and:(double)a5
{
  double v6 = a5 - a4;
  double result = 0.5;
  if (v6 > 0.0) {
    return (a3 - a4) / v6;
  }
  return result;
}

+ (CGSize)_interpolationCropSizeForRatio:(double)a3 andZoom:(double)a4 forImageSize:(CGSize)a5
{
  double width = a5.height * a3;
  if (a5.width < a5.height * a3) {
    double width = a5.width;
  }
  double v6 = width / a4;
  double height = a5.width / a3;
  if (a5.height < height) {
    double height = a5.height;
  }
  double v8 = height / a4;
  double v9 = v6;
  result.double height = v8;
  result.double width = v9;
  return result;
}

+ (double)_interpolationCropToSize:(double)a3 withinRect:(double)a4 withPreferredRect:(double)a5 andAcceptableRect:(double)a6 outputScore:(uint64_t)a7
{
  uint64_t v66 = *MEMORY[0x1E4F143B8];
  if (!+[PFCropUtilities _rectIsValid:a16]
    || !+[PFCropUtilities _rectIsValid:](PFCropUtilities, "_rectIsValid:"))
  {
    if (a5 - a1 <= 0.0) {
      double v28 = 0.0;
    }
    else {
      double v28 = (a5 - a1) * 0.5;
    }
    if (a9)
    {
      double v29 = 0.5005;
LABEL_48:
      *a9 = v29;
      return v28;
    }
    return v28;
  }
  if (a1 == 0.0
    || a2 == 0.0
    || (a1 == *MEMORY[0x1E4F8A250] ? (BOOL v27 = a2 == *(double *)(MEMORY[0x1E4F8A250] + 8)) : (BOOL v27 = 0), v27))
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 134218496;
      double v61 = a1;
      __int16 v62 = 2048;
      double v63 = a2;
      __int16 v64 = 2048;
      uint64_t v65 = 0x3FF0000000000000;
      _os_log_fault_impl(&dword_1A41FE000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "PFSizeGetAspectRatio produced an undefined aspect ratio from size {%lf, %lf}. Returning %f. Use PFSizeGetAspectRatioWithDefault() to provide a value for this case.", buf, 0x20u);
    }
  }
  PFSizeWithAspectRatioFittingSize();
  double v56 = v31;
  double v58 = v30;
  BOOL v32 = +[PFCropUtilities _rectIsValid:](PFCropUtilities, "_rectIsValid:", a16, a17, a18, a19);
  BOOL v33 = +[PFCropUtilities _rectIsValid:](PFCropUtilities, "_rectIsValid:", a12, a13, a14, a15);
  BOOL v35 = v33;
  double v36 = a12;
  double v37 = a14;
  double v38 = a15;
  if (!v33)
  {
    double v36 = a3 + a5 * 0.5 + v58 * -0.5;
    double v34 = v56;
    double v37 = v58;
    double v38 = v56;
  }
  uint64_t v39 = MEMORY[0x1E4F1DAD8];
  BOOL v40 = a1 < a18 && v32;
  double v57 = v38;
  if (v40)
  {
    v67.origin.double x = a16;
    v67.origin.double y = a17;
    v67.size.double width = a18;
    v67.size.double height = a19;
    +[PFCropUtilities _interpolationWithFactor:a1 / a18 between:CGRectGetMidX(v67) and:a16];
    double v28 = v41;
    double v42 = 2.0 - a1 / a18;
  }
  else
  {
    if (v32 && v33 && a1 < a14)
    {
      +[PFCropUtilities _interpolationFactorFor:between:and:](PFCropUtilities, "_interpolationFactorFor:between:and:", a1, a18, a14, v34, v36);
      double v44 = v43;
      +[PFCropUtilities _interpolationWithFactor:between:and:](PFCropUtilities, "_interpolationWithFactor:between:and:");
      double v28 = v45;
      double v46 = 2.0;
    }
    else
    {
      if (a1 >= a5)
      {
        double v42 = *MEMORY[0x1E4F1DAD8];
        double v28 = *MEMORY[0x1E4F1DAD8];
        goto LABEL_31;
      }
      +[PFCropUtilities _interpolationFactorFor:a1 between:v37 and:a5];
      double v44 = v47;
      +[PFCropUtilities _interpolationWithFactor:between:and:](PFCropUtilities, "_interpolationWithFactor:between:and:");
      double v28 = v48;
      double v46 = 1.0;
    }
    double v42 = (v46 - v44) * 0.5;
  }
LABEL_31:
  if (a2 < a19 && v32)
  {
    v68.origin.double x = a16;
    v68.origin.double y = a17;
    v68.size.double width = a18;
    v68.size.double height = a19;
    +[PFCropUtilities _interpolationWithFactor:a2 / a19 between:CGRectGetMidY(v68) and:a17];
    double v50 = 2.0 - a2 / a19;
    if (!a9) {
      return v28;
    }
    goto LABEL_45;
  }
  if (v32 && v35 && a2 < a15)
  {
    +[PFCropUtilities _interpolationFactorFor:a2 between:a19 and:a15];
    double v52 = v51;
    +[PFCropUtilities _interpolationWithFactor:between:and:](PFCropUtilities, "_interpolationWithFactor:between:and:");
    double v53 = 2.0;
    goto LABEL_42;
  }
  if (a2 < a6)
  {
    +[PFCropUtilities _interpolationFactorFor:between:and:](PFCropUtilities, "_interpolationFactorFor:between:and:", a2, v57);
    double v52 = v54;
    +[PFCropUtilities _interpolationWithFactor:between:and:](PFCropUtilities, "_interpolationWithFactor:between:and:");
    double v53 = 1.0;
LABEL_42:
    double v50 = (v53 - v52) * 0.5;
    if (!a9) {
      return v28;
    }
    goto LABEL_45;
  }
  double v50 = *(double *)(v39 + 8);
  if (a9)
  {
LABEL_45:
    if (v42 >= v50) {
      double v50 = v42;
    }
    double v29 = (2.0 - v50) * 0.5;
    goto LABEL_48;
  }
  return v28;
}

+ (uint64_t)_interpolationCropForAspectRatio:(uint64_t)a3 andZoom:(uint64_t)a4 acceptableRect:(uint64_t)a5 andPreferredRect:(double)a6 andImageRect:(double)a7 outputCropScore:(double)a8
{
  +[PFCropUtilities _interpolationCropSizeForRatio:andZoom:forImageSize:](PFCropUtilities, "_interpolationCropSizeForRatio:andZoom:forImageSize:", a1, a2, a18, a19);

  return +[PFCropUtilities _interpolationCropToSize:withinRect:withPreferredRect:andAcceptableRect:outputScore:](PFCropUtilities, "_interpolationCropToSize:withinRect:withPreferredRect:andAcceptableRect:outputScore:", a5);
}

+ (uint64_t)_interpolationCropForAspectRatio:(double)a3 acceptableRect:(double)a4 andPreferredRect:(double)a5 andImageRect:(double)a6 outputCropScore:(double)a7
{
  return [a1 _interpolationCropForAspectRatio:a3 andZoom:1.0 acceptableRect:a4 andPreferredRect:a5 andImageRect:a6 outputCropScore:a7];
}

+ (double)bestCropRectV2ForPosterClassification:(double)a3 layoutConfiguration:(double)a4 sourcePixelWidth:(double)a5 sourcePixelHeight:(double)a6 sourcePreferredCropRectNormalized:(double)a7 sourceAcceptableCropRectNormalized:(double)a8 sourceFaceAreaRectNormalized:(uint64_t)a9 outputCropScore:(uint64_t)a10 outputLayoutScore:(unint64_t)a11 outputClockOverlapAcceptable:(void *)a12
{
  double v28 = a17;
  uint64_t v93 = *MEMORY[0x1E4F143B8];
  id v29 = a12;
  [v29 screenSize];
  double v32 = v30;
  double v33 = v31;
  if (v30 == 0.0
    || v31 == 0.0
    || (v30 == *MEMORY[0x1E4F8A250] ? (BOOL v34 = v31 == *(double *)(MEMORY[0x1E4F8A250] + 8)) : (BOOL v34 = 0), v34))
  {
    double v67 = 1.0;
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 134218496;
      *(double *)&uint8_t buf[4] = v32;
      __int16 v89 = 2048;
      double v90 = v33;
      __int16 v91 = 2048;
      uint64_t v92 = 0x3FF0000000000000;
      _os_log_fault_impl(&dword_1A41FE000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "PFSizeGetAspectRatio produced an undefined aspect ratio from size {%lf, %lf}. Returning %f. Use PFSizeGetAspectRatioWithDefault() to provide a value for this case.", buf, 0x20u);
    }
  }
  else
  {
    double v67 = fabs(v30 / v31);
  }
  if (+[PFCropUtilities _rectIsValid:](PFCropUtilities, "_rectIsValid:", a17, a18, a19, a20))
  {
    double v35 = 1.0 - (a18 + a20);
    double v36 = *MEMORY[0x1E4F1DB20];
    double v37 = *(double *)(MEMORY[0x1E4F1DB20] + 8);
    double v38 = *(double *)(MEMORY[0x1E4F1DB20] + 16);
    double v39 = *(double *)(MEMORY[0x1E4F1DB20] + 24);
    double v40 = a19;
    double v41 = a20;
  }
  else
  {
    double v36 = *MEMORY[0x1E4F1DB20];
    double v37 = *(double *)(MEMORY[0x1E4F1DB20] + 8);
    double v38 = *(double *)(MEMORY[0x1E4F1DB20] + 16);
    double v39 = *(double *)(MEMORY[0x1E4F1DB20] + 24);
    double v28 = *MEMORY[0x1E4F1DB20];
    double v35 = v37;
    double v40 = v38;
    double v41 = v39;
  }
  double v71 = v35;
  double v82 = (double)a14;
  double v69 = v38;
  double v70 = v39;
  double v68 = v37;
  double v83 = v36;
  +[PFParallaxLayoutUtilities effectiveAcceptableRectForClassification:havePetFaces:sourcePreferredCropRectNormalized:sourceAcceptableCropRectNormalized:sourceFaceAreaRectNormalized:sourceGazeAreaRectNormalized:](PFParallaxLayoutUtilities, "effectiveAcceptableRectForClassification:havePetFaces:sourcePreferredCropRectNormalized:sourceAcceptableCropRectNormalized:sourceFaceAreaRectNormalized:sourceGazeAreaRectNormalized:", a11, 0, a1, a2, a3, a4, a5, a6, a7, a8, *(void *)&v28, *(void *)&v35, *(void *)&v40, *(void *)&v41, *(void *)&v36, *(void *)&v37,
    *(void *)&v38,
    *(void *)&v39);
  double v86 = v43;
  double v87 = v42;
  double v84 = v45;
  double v85 = v44;
  +[PFParallaxLayoutUtilities effectivePreferredRectForClassification:havePetFaces:sourcePreferredCropRectNormalized:sourceAcceptableCropRectNormalized:sourceFaceAreaRectNormalized:](PFParallaxLayoutUtilities, "effectivePreferredRectForClassification:havePetFaces:sourcePreferredCropRectNormalized:sourceAcceptableCropRectNormalized:sourceFaceAreaRectNormalized:", a11, 0, a1, a2, a3, a4, a5, a6, a7, a8, *(void *)&v28, *(void *)&v71, *(void *)&v40, *(void *)&v41);
  uint64_t v79 = v48;
  uint64_t v81 = v47;
  uint64_t v75 = v46;
  uint64_t v77 = v49;
  if (a11 > 5)
  {
    double v50 = (double)a13;
    double v54 = 0.0;
    double v55 = 0.0;
    double v56 = 0.0;
    double v57 = 0.0;
  }
  else
  {
    if (((1 << a11) & 0x39) != 0)
    {
      double v50 = (double)a13;
      double v51 = v68;
      double v52 = v69;
      double v53 = v70;
      +[PFCropUtilities bestCropRectV2ForAspectRatio:withFocusRegion:sourcePixelWidth:sourcePixelHeight:sourcePreferredCropRectNormalized:sourceAcceptableCropRectNormalized:sourceFaceAreaRectNormalized:outputCropScore:](PFCropUtilities, "bestCropRectV2ForAspectRatio:withFocusRegion:sourcePixelWidth:sourcePixelHeight:sourcePreferredCropRectNormalized:sourceAcceptableCropRectNormalized:sourceFaceAreaRectNormalized:outputCropScore:", a13, a14, a15, v67, v83, v68, v69, v70, v46, v47, v48, v49, *(void *)&v87, *(void *)&v86, *(void *)&v85, *(void *)&v84,
        *(void *)&a17,
        *(void *)&a18,
        *(void *)&a19,
        *(void *)&a20);
      goto LABEL_20;
    }
    double v50 = (double)a13;
    *(void *)buf = 0;
    +[PFCropUtilities bestCropRectV2ForAspectRatio:sourcePixelWidth:sourcePixelHeight:sourceEssentialAreaRect:sourceSecondaryEssentialAreaRect:outputCropScore:](PFCropUtilities, "bestCropRectV2ForAspectRatio:sourcePixelWidth:sourcePixelHeight:sourceEssentialAreaRect:sourceSecondaryEssentialAreaRect:outputCropScore:", a13, a14, buf, v67, v87, v86, v85, v84, v46, v47, v48, v49);
    if (a15) {
      *a15 = *(double *)buf;
    }
  }
  double v51 = v68;
  double v52 = v69;
  double v53 = v70;
LABEL_20:
  double v58 = -[PFParallaxLayoutHelper initWithPosterClassification:initialRect:imageSize:effectiveAcceptableRect:effectivePreferredRect:validBoundsNormalized:headroomFeasible:hasTopEdgeContact:layoutType:layoutConfiguration:]([PFParallaxLayoutHelper alloc], "initWithPosterClassification:initialRect:imageSize:effectiveAcceptableRect:effectivePreferredRect:validBoundsNormalized:headroomFeasible:hasTopEdgeContact:layoutType:layoutConfiguration:", a11, 0, 0, +[PFParallaxLayoutUtilities layoutTypeFromLayoutConfiguration:](PFParallaxLayoutUtilities, "layoutTypeFromLayoutConfiguration:", v29), v29, v54 * v50 + 0.0, v55 * v82 + 0.0, v56 * v50, v57 * v82, v50, v82, *(void *)&v87, *(void *)&v86,
          *(void *)&v85,
          *(void *)&v84,
          v75,
          v81,
          v79,
          v77,
          *(void *)&v83,
          *(void *)&v51,
          *(void *)&v52,
          *(void *)&v53);
  v59 = +[PFParallaxLayoutUtilities computeLayoutWithHelper:v58];
  [v59 visibleRect];
  double v61 = v60;
  if (a13) {
    double v61 = v60 / v50;
  }
  +[PFParallaxLayoutUtilities headroomPenaltyForIntermediateLayout:originalFullExtent:layoutConfiguration:](PFParallaxLayoutUtilities, "headroomPenaltyForIntermediateLayout:originalFullExtent:layoutConfiguration:", v59, v29, 0.0, 0.0, v50, v82);
  float v63 = v62;
  if (a15)
  {
    [v59 cropScore];
    *a15 = v64 - v63;
  }
  if (a16)
  {
    [v59 layoutScore];
    *a16 = v65 - v63;
  }
  if (a21) {
    *a21 = [v59 clockOverlapAcceptableForLayoutConfiguration:v29];
  }

  return v61;
}

+ (uint64_t)scoreForCropRect:(double)a3 sourcePixelWidth:(double)a4 sourcePixelHeight:(double)a5 sourceEssentialAreaRect:(double)a6 sourceSecondaryEssentialAreaRect:(double)a7
{
  return +[PFCropUtilities _interpolationV2ScoreForCrop:withFullsizeRect:andPreferredRect:andAcceptableRect:](PFCropUtilities, "_interpolationV2ScoreForCrop:withFullsizeRect:andPreferredRect:andAcceptableRect:", a1, a2, a3, a4, 0.0, 0.0, (double)a11, (double)a12, a17, a18, a19, *(void *)&a5, *(void *)&a6, *(void *)&a7, *(void *)&a8);
}

+ (CGRect)bestCropRectV2ForAspectRatio:(double)a3 sourcePixelWidth:(unint64_t)a4 sourcePixelHeight:(unint64_t)a5 sourceEssentialAreaRect:(CGRect)a6 sourceSecondaryEssentialAreaRect:(CGRect)a7 outputCropScore:(double *)a8
{
  objc_msgSend(a1, "bestCropRectV2ForAspectRatio:zoom:sourcePixelWidth:sourcePixelHeight:sourceEssentialAreaRect:sourceSecondaryEssentialAreaRect:outputCropScore:", a4, a5, a8, a3, 1.0, a6.origin.x, a6.origin.y, a6.size.width, a6.size.height);
  result.size.double height = v11;
  result.size.double width = v10;
  result.origin.double y = v9;
  result.origin.double x = v8;
  return result;
}

+ (CGRect)bestCropRectV2ForAspectRatio:(double)a3 zoom:(double)a4 sourcePixelWidth:(unint64_t)a5 sourcePixelHeight:(unint64_t)a6 sourceEssentialAreaRect:(CGRect)a7 sourceSecondaryEssentialAreaRect:(CGRect)a8 outputCropScore:(double *)a9
{
  double v12 = (double)a5;
  double v13 = (double)a6;
  double v14 = a7.origin.x * (double)a5 + 0.0;
  double v15 = a7.origin.y * (double)a6 + 0.0;
  double v16 = a7.size.width * (double)a5;
  double v17 = a7.size.height * (double)a6;
  double v33 = a8.origin.x * (double)a5 + 0.0;
  double v31 = a8.origin.y * (double)a6 + 0.0;
  double v18 = a8.size.width * (double)a5;
  double v19 = a8.size.height * (double)a6;
  if (+[PFCropUtilities _rectIsValid:](PFCropUtilities, "_rectIsValid:", v14, v15, v16, v17))
  {
    v42.origin.double x = 0.0;
    v42.origin.double y = 0.0;
    v37.origin.double x = v14;
    v37.origin.double y = v15;
    v37.size.double width = v16;
    v37.size.double height = v17;
    v42.size.double width = v12;
    v42.size.double height = v13;
    CGRect v38 = CGRectIntersection(v37, v42);
    double x = v38.origin.x;
    double y = v38.origin.y;
    double width = v38.size.width;
    double height = v38.size.height;
  }
  else
  {
    double x = *MEMORY[0x1E4F1DB20];
    double width = *(double *)(MEMORY[0x1E4F1DB20] + 16);
    double y = *(double *)(MEMORY[0x1E4F1DB20] + 8);
    double height = *(double *)(MEMORY[0x1E4F1DB20] + 24);
  }
  if (+[PFCropUtilities _rectIsValid:](PFCropUtilities, "_rectIsValid:", v33, v31, v18, v19))
  {
    v43.origin.double x = 0.0;
    v43.origin.double y = 0.0;
    v39.origin.double x = v33;
    v39.origin.double y = v31;
    v39.size.double width = v18;
    v39.size.double height = v19;
    v43.size.double width = v12;
    v43.size.double height = v13;
    CGRect v40 = CGRectIntersection(v39, v43);
  }
  else
  {
    v40.origin.double y = 0.0;
    v40.size.double height = v13;
    v40.size.double width = v12;
    v40.origin.double x = 0.0;
  }
  uint64_t v36 = 0;
  +[PFCropUtilities _interpolationCropForAspectRatio:andZoom:acceptableRect:andPreferredRect:andImageRect:outputCropScore:](PFCropUtilities, "_interpolationCropForAspectRatio:andZoom:acceptableRect:andPreferredRect:andImageRect:outputCropScore:", &v36, a3, a4, x, y, width, height, *(void *)&v40.origin.x, *(void *)&v40.origin.y, *(void *)&v40.size.width, *(void *)&v40.size.height, 0, 0, *(void *)&v12, *(void *)&v13);
  double v26 = v25;
  if (a9) {
    *(void *)a9 = v36;
  }
  double v27 = 0.0;
  if (!a5)
  {
    double v28 = 0.0;
    if (!a6) {
      goto LABEL_12;
    }
    goto LABEL_11;
  }
  double v22 = v22 / v12;
  double v28 = v24 / v12;
  if (a6)
  {
LABEL_11:
    double v23 = v23 / v13;
    double v27 = v26 / v13;
  }
LABEL_12:
  double v29 = 1.0 - (v27 + v23);
  result.size.double height = v27;
  result.size.double width = v28;
  result.origin.double y = v29;
  result.origin.double x = v22;
  return result;
}

+ (CGRect)bestCropRectV2ForAspectRatio:(double)a3 sourcePixelWidth:(unint64_t)a4 sourcePixelHeight:(unint64_t)a5 sourceEssentialAreaRect:(CGRect)a6 sourceSecondaryEssentialAreaRect:(CGRect)a7
{
  +[PFCropUtilities bestCropRectV2ForAspectRatio:sourcePixelWidth:sourcePixelHeight:sourceEssentialAreaRect:sourceSecondaryEssentialAreaRect:outputCropScore:](PFCropUtilities, "bestCropRectV2ForAspectRatio:sourcePixelWidth:sourcePixelHeight:sourceEssentialAreaRect:sourceSecondaryEssentialAreaRect:outputCropScore:", a4, a5, 0, a3, a6.origin.x, a6.origin.y, a6.size.width, a6.size.height);
  result.size.double height = v10;
  result.size.double width = v9;
  result.origin.double y = v8;
  result.origin.double x = v7;
  return result;
}

+ (uint64_t)bestCropRectV2ForAspectRatio:(CGFloat)a3 withFocusRegion:(CGFloat)a4 sourcePixelWidth:(CGFloat)a5 sourcePixelHeight:(CGFloat)a6 sourcePreferredCropRectNormalized:(uint64_t)a7 sourceAcceptableCropRectNormalized:(unint64_t)a8 sourceFaceAreaRectNormalized:(unint64_t)a9 outputCropScore:(double *)a10
{
  double v27 = (double)a8;
  double v28 = (double)a9;
  double r1 = a14 * (double)a8 + 0.0;
  double v68 = a15 * (double)a9 + 0.0;
  double v69 = a16 * (double)a8;
  double v62 = a17 * (double)a9;
  double r1_16 = a19 * (double)a9 + 0.0;
  double r1_24 = a18 * (double)a8 + 0.0;
  double r1_8 = a20 * (double)a8;
  double height = a21 * (double)a9;
  double v31 = *MEMORY[0x1E4F1DB20];
  double v30 = *(double *)(MEMORY[0x1E4F1DB20] + 8);
  double v33 = *(double *)(MEMORY[0x1E4F1DB20] + 16);
  double v32 = *(double *)(MEMORY[0x1E4F1DB20] + 24);
  BOOL v34 = +[PFCropUtilities _rectIsValid:](PFCropUtilities, "_rectIsValid:");
  double v79 = v27;
  double v67 = height;
  double v77 = v30;
  double v78 = v31;
  double v75 = v32;
  double v76 = v33;
  if (!v34)
  {
    *(double *)&v61[16] = v33;
    *(double *)&v61[24] = v32;
    *(double *)double v61 = v31;
    *(double *)&v61[8] = v30;
    double width = r1_8;
    double y = r1_16;
    double x = r1_24;
    CGFloat v39 = v27;
LABEL_9:
    double v38 = v62;
    goto LABEL_10;
  }
  double x = a22 * v27 + 0.0;
  double y = (1.0 - (a23 + a25)) * v28 + 0.0;
  double width = a24 * v27;
  double height = a25 * v28;
  *(double *)&v61[16] = a24 * v27;
  *(double *)&v61[24] = a25 * v28;
  *(double *)double v61 = x;
  *(double *)&v61[8] = y;
  if (!+[PFCropUtilities _rectIsValid:](PFCropUtilities, "_rectIsValid:", x, y, a24 * v27, a25 * v28))
  {
    double height = v67;
    double width = r1_8;
    double y = r1_16;
    double x = r1_24;
    CGFloat v39 = v27;
    goto LABEL_9;
  }
  if (+[PFCropUtilities _rectIsValid:](PFCropUtilities, "_rectIsValid:", r1_24, r1_16, r1_8, v67))
  {
    v81.origin.double x = r1_24;
    v81.origin.double y = r1_16;
    v81.size.double width = r1_8;
    v81.size.double height = v67;
    v92.origin.double x = a22 * v27 + 0.0;
    v92.origin.double y = (1.0 - (a23 + a25)) * v28 + 0.0;
    v92.size.double width = a24 * v27;
    v92.size.double height = a25 * v28;
    CGRect v82 = CGRectUnion(v81, v92);
    double x = v82.origin.x;
    double y = v82.origin.y;
    double width = v82.size.width;
    double height = v82.size.height;
  }
  double v38 = v62;
  CGFloat v39 = v27;
  if (+[PFCropUtilities _rectIsValid:](PFCropUtilities, "_rectIsValid:", r1, v68, v69, v62))
  {
    objc_msgSend(a1, "_faceAreaRectWithPadding:", *(double *)v61, *(double *)&v61[8], *(double *)&v61[16], *(double *)&v61[24]);
    v93.origin.double x = 0.0;
    v93.origin.double y = 0.0;
    v93.size.double width = v27;
    v93.size.double height = v28;
    CGRect v94 = CGRectIntersection(v83, v93);
    v84.origin.double x = r1;
    v84.origin.double y = v68;
    v84.size.double width = v69;
    v84.size.double height = v62;
    CGRect v85 = CGRectUnion(v84, v94);
    double r1 = v85.origin.x;
    double v68 = v85.origin.y;
    double v69 = v85.size.width;
    double v38 = v85.size.height;
  }
LABEL_10:
  if (+[PFCropUtilities _rectIsValid:](PFCropUtilities, "_rectIsValid:", x, y, width, height))
  {
    v95.origin.double x = 0.0;
    v95.origin.double y = 0.0;
    v86.origin.double x = x;
    v86.origin.double y = y;
    v86.size.double width = width;
    v86.size.double height = height;
    v95.size.double width = v39;
    v95.size.double height = v28;
    CGRect v87 = CGRectIntersection(v86, v95);
    double v77 = v87.origin.y;
    double v78 = v87.origin.x;
    double v75 = v87.size.height;
    double v76 = v87.size.width;
  }
  if (+[PFCropUtilities _rectIsValid:](PFCropUtilities, "_rectIsValid:", r1, v68, v69, v38))
  {
    v88.origin.double x = r1;
    v88.origin.double y = v68;
    v88.size.double width = v69;
    v88.size.double height = v38;
    v96.origin.double y = v77;
    v96.origin.double x = v78;
    v96.size.double height = v75;
    v96.size.double width = v76;
    CGRect v89 = CGRectUnion(v88, v96);
    v97.origin.double x = 0.0;
    v97.origin.double y = 0.0;
    v97.size.double width = v39;
    v97.size.double height = v28;
    CGRect v90 = CGRectIntersection(v89, v97);
    double v40 = v90.origin.x;
    double v41 = v90.origin.y;
    double v42 = v90.size.width;
    double v43 = v90.size.height;
  }
  else
  {
    double v42 = v39;
    double v41 = 0.0;
    double v43 = v28;
    double v40 = 0.0;
  }
  double v80 = 0.0;
  if (!objc_msgSend(a1, "_rectIsValid:", a3, a4, a5, a6)) {
    goto LABEL_21;
  }
  v98.origin.double x = 0.0;
  v98.origin.double y = 0.0;
  v98.size.double width = 1.0;
  v98.size.double height = 1.0;
  v91.origin.double x = a3;
  v91.origin.double y = a4;
  v91.size.double width = a5;
  v91.size.double height = a6;
  if (CGRectEqualToRect(v91, v98)
    || !objc_msgSend(a1, "_rectIsValid:", v78, v77, v76, v75)
    || !objc_msgSend(a1, "_rectIsValid:", v40, v41, v42, v43))
  {
LABEL_21:
    double v57 = v43;
    double v56 = v42;
    double v55 = v40;
    CGFloat v46 = v77;
    CGFloat v47 = v78;
    CGFloat v44 = v75;
    CGFloat v45 = v76;
    uint64_t result = +[PFCropUtilities _interpolationCropForAspectRatio:acceptableRect:andPreferredRect:andImageRect:outputCropScore:](PFCropUtilities, "_interpolationCropForAspectRatio:acceptableRect:andPreferredRect:andImageRect:outputCropScore:", &v80, a2, v78, v77, v76, v75, *(void *)&v55, *(void *)&v41, *(void *)&v56, *(void *)&v57, 0, 0, *(void *)&v79, *(void *)&v28);
    if (!a10) {
      goto LABEL_23;
    }
    goto LABEL_22;
  }
  double v60 = v43;
  double v59 = v42;
  double v58 = v40;
  CGFloat v44 = v75;
  CGFloat v45 = v76;
  CGFloat v46 = v77;
  CGFloat v47 = v78;
  uint64_t result = +[PFCropUtilities _interpolationV2CropForAspectRatio:withFocusRegion:andAcceptableRect:andPreferredRect:andImageRect:outputCropScore:](PFCropUtilities, "_interpolationV2CropForAspectRatio:withFocusRegion:andAcceptableRect:andPreferredRect:andImageRect:outputCropScore:", &v80, a2, a3, 1.0 - (a4 + a6), a5, a6, *(void *)&v78, *(void *)&v77, *(void *)&v76, *(void *)&v75, *(void *)&v58, *(void *)&v41, *(void *)&v59, *(void *)&v60, 0, 0, *(void *)&v79,
             *(void *)&v28);
  if (a10) {
LABEL_22:
  }
    *a10 = v80;
LABEL_23:
  if (v80 < 0.5 && v34)
  {
    v99.origin.double x = v47;
    v99.origin.double y = v46;
    v99.size.double width = v45;
    v99.size.double height = v44;
    BOOL v50 = CGRectEqualToRect(*(CGRect *)v61, v99);
    if (v50) {
      double v51 = r1_24;
    }
    else {
      double v51 = *(double *)v61;
    }
    if (v50) {
      double v52 = r1_16;
    }
    else {
      double v52 = *(double *)&v61[8];
    }
    if (v50) {
      double v53 = r1_8;
    }
    else {
      double v53 = *(double *)&v61[16];
    }
    if (v50) {
      double v54 = v67;
    }
    else {
      double v54 = *(double *)&v61[24];
    }
    return +[PFCropUtilities _interpolationCropForAspectRatio:acceptableRect:andPreferredRect:andImageRect:outputCropScore:](PFCropUtilities, "_interpolationCropForAspectRatio:acceptableRect:andPreferredRect:andImageRect:outputCropScore:", 0, a2, v51, v52, v53, v54, *(void *)&v47, *(void *)&v46, *(void *)&v45, *(void *)&v44, 0, 0, *(void *)&v79, *(void *)&v28);
  }
  return result;
}

+ (uint64_t)bestCropRectV2ForAspectRatio:(uint64_t)a3 withFocusRegion:(uint64_t)a4 sourcePixelWidth:sourcePixelHeight:sourcePreferredCropRectNormalized:sourceAcceptableCropRectNormalized:sourceFaceAreaRectNormalized:
{
  return +[PFCropUtilitiesCore bestCropRectV2ForAspectRatio:withFocusRegion:sourcePixelWidth:sourcePixelHeight:sourcePreferredCropRectNormalized:sourceAcceptableCropRectNormalized:sourceFaceAreaRectNormalized:outputCropScore:](PFCropUtilitiesCore, "bestCropRectV2ForAspectRatio:withFocusRegion:sourcePixelWidth:sourcePixelHeight:sourcePreferredCropRectNormalized:sourceAcceptableCropRectNormalized:sourceFaceAreaRectNormalized:outputCropScore:", a3, a4, 0);
}

+ (uint64_t)bestCropRectForAspectRatio:verticalContentMode:cropMode:sourcePixelWidth:sourcePixelHeight:sourcePreferredCropRectNormalized:sourceAcceptableCropRectNormalized:sourceFaceAreaRectNormalized:
{
  return +[PFCropUtilitiesCore bestCropRectForAspectRatio:verticalContentMode:cropMode:sourcePixelWidth:sourcePixelHeight:sourcePreferredCropRectNormalized:sourceAcceptableCropRectNormalized:sourceFaceAreaRectNormalized:](PFCropUtilitiesCore, "bestCropRectForAspectRatio:verticalContentMode:cropMode:sourcePixelWidth:sourcePixelHeight:sourcePreferredCropRectNormalized:sourceAcceptableCropRectNormalized:sourceFaceAreaRectNormalized:");
}

@end