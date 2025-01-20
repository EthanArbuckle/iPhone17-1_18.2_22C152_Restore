@interface PFCropUtilitiesCore
+ (CGFloat)_interpolationV2ScoreForFocusRegion:(double)a3 insideCropRect:(double)a4 withImportantRect:(double)a5;
+ (CGPoint)_translationToIncludeRect:(CGRect)a3 insideRect:(CGRect)a4;
+ (CGRect)_faceAreaRectWithPadding:(CGRect)a3;
+ (CGSize)_interpolationCropSizeForRatio:(double)a3 andZoom:(double)a4 forImageSize:(CGSize)a5;
+ (double)_curatedLibraryAdjustedRectWithFaceAreaRect:(double)a3 proposedCropRect:(double)a4 assetRect:(CGFloat)a5 verticalContentMode:(CGFloat)a6;
+ (double)_interpolationCropToSize:(double)a3 withinRect:(double)a4 withPreferredRect:(double)a5 andAcceptableRect:(double)a6 outputScore:(uint64_t)a7;
+ (double)_interpolationFactorFor:(double)a3 between:(double)a4 and:(double)a5;
+ (double)_interpolationV2AdjustedCrop:(double)a3 toFocusRegion:(double)a4 withFullsizeRect:(double)a5 andImportantRect:(double)a6;
+ (double)_interpolationV2CropForAspectRatio:(double)a3 withFocusRegion:(double)a4 andAcceptableRect:(double)a5 andPreferredRect:(uint64_t)a6 andImageRect:(uint64_t)a7 outputCropScore:(double *)a8;
+ (double)_interpolationWithFactor:(double)a3 between:(double)a4 and:(double)a5;
+ (double)_rectDimensionOffset:(CGRect)a3 insideRect:(CGRect)a4 forEdge:(unsigned int)a5;
+ (double)_rectDimensionSize:(CGRect)a3 forEdge:(unsigned int)a4;
+ (uint64_t)_interpolationCropForAspectRatio:(double)a1 acceptableRect:(double)a2 andPreferredRect:(double)a3 andImageRect:(double)a4 outputCropScore:(double)a5;
+ (uint64_t)_interpolationCropForAspectRatio:(uint64_t)a3 andZoom:(uint64_t)a4 acceptableRect:(uint64_t)a5 andPreferredRect:(double)a6 andImageRect:(double)a7 outputCropScore:(double)a8;
+ (uint64_t)_interpolationV2MaxCropSizeForAspectRatio:(double)a3 andZoom:(double)a4 withFocusRegion:(double)a5 forImageSize:(double)a6 withImportantRect:(double)a7;
+ (uint64_t)_interpolationV2ScoreAlongEdge:(double)a3 forCrop:(double)a4 withFullsizeRect:(double)a5 andPreferredRect:(double)a6 andAcceptableRect:(double)a7;
+ (uint64_t)_interpolationV2ScoreForCrop:(double)a3 withFullsizeRect:(double)a4 andPreferredRect:(double)a5 andAcceptableRect:(double)a6;
+ (uint64_t)bestCropRectForAspectRatio:verticalContentMode:cropMode:sourcePixelWidth:sourcePixelHeight:sourcePreferredCropRectNormalized:sourceAcceptableCropRectNormalized:sourceFaceAreaRectNormalized:;
+ (uint64_t)bestCropRectV2ForAspectRatio:(CGFloat)a3 withFocusRegion:(double)a4 sourcePixelWidth:(CGFloat)a5 sourcePixelHeight:(uint64_t)a6 sourcePreferredCropRectNormalized:(uint64_t)a7 sourceAcceptableCropRectNormalized:(unint64_t)a8 sourceFaceAreaRectNormalized:(unint64_t)a9 outputCropScore:(double *)a10;
+ (void)_curatedLibraryCropForAspectRatio:(CGFloat)a3 verticalContentMode:(CGFloat)a4 cropMode:(CGFloat)a5 sourcePixelWidth:(uint64_t)a6 sourcePixelHeight:(uint64_t)a7 sourcePreferredCropRectNormalized:(uint64_t)a8 sourceAcceptableCropRectNormalized:(uint64_t)a9 sourceFaceAreaRectNormalized:(unint64_t)a10;
@end

@implementation PFCropUtilitiesCore

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
  +[PFCropUtilitiesCore _rectDimensionOffset:insideRect:forEdge:](PFCropUtilitiesCore, "_rectDimensionOffset:insideRect:forEdge:", 0);
  double v20 = v12;
  +[PFCropUtilitiesCore _rectDimensionOffset:insideRect:forEdge:](PFCropUtilitiesCore, "_rectDimensionOffset:insideRect:forEdge:", 2, v11, v10, v9, v8, x, y, width, height);
  double v19 = v13;
  +[PFCropUtilitiesCore _rectDimensionOffset:insideRect:forEdge:](PFCropUtilitiesCore, "_rectDimensionOffset:insideRect:forEdge:", 1, v11, v10, v9, v8, x, y, width, height);
  double v18 = v14;
  +[PFCropUtilitiesCore _rectDimensionOffset:insideRect:forEdge:](PFCropUtilitiesCore, "_rectDimensionOffset:insideRect:forEdge:", 3, v11, v10, v9, v8, x, y, width, height);
  double v16 = fmin(v15, 0.0) - fmin(v18, 0.0);
  double v17 = fmin(v19, 0.0) - fmin(v20, 0.0);
  result.double y = v16;
  result.double x = v17;
  return result;
}

+ (double)_rectDimensionOffset:(CGRect)a3 insideRect:(CGRect)a4 forEdge:(unsigned int)a5
{
  switch(a5)
  {
    case 0u:
      a3.origin.double x = a3.origin.x - a4.origin.x;
      break;
    case 1u:
      a3.origin.double x = a3.origin.y - a4.origin.y;
      break;
    case 2u:
      a3.origin.double x = a4.origin.x + a4.size.width - (a3.origin.x + a3.size.width);
      break;
    case 3u:
      a3.origin.double x = a4.origin.y + a4.size.height - (a3.origin.y + a3.size.height);
      break;
    default:
      return a3.origin.x;
  }
  return a3.origin.x;
}

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
  result.size.double width = v6;
  result.origin.double y = v5;
  result.origin.double x = v4;
  return result;
}

+ (double)_rectDimensionSize:(CGRect)a3 forEdge:(unsigned int)a4
{
  switch(a4)
  {
    case 0u:
    case 2u:
      a3.origin.double x = a3.size.width;
      break;
    case 1u:
    case 3u:
      a3.origin.double x = a3.size.height;
      break;
    default:
      return a3.origin.x;
  }
  return a3.origin.x;
}

+ (double)_interpolationV2CropForAspectRatio:(double)a3 withFocusRegion:(double)a4 andAcceptableRect:(double)a5 andPreferredRect:(uint64_t)a6 andImageRect:(uint64_t)a7 outputCropScore:(double *)a8
{
  +[PFCropUtilitiesCore _interpolationV2MaxCropSizeForAspectRatio:andZoom:withFocusRegion:forImageSize:withImportantRect:](PFCropUtilitiesCore, "_interpolationV2MaxCropSizeForAspectRatio:andZoom:withFocusRegion:forImageSize:withImportantRect:", a1, 1.0, a2, a3, a4, a5, a27, a28, a17, a18, a19, a20);
  +[PFCropUtilitiesCore _interpolationCropToSize:withinRect:withPreferredRect:andAcceptableRect:outputScore:](PFCropUtilitiesCore, "_interpolationCropToSize:withinRect:withPreferredRect:andAcceptableRect:outputScore:", a8, a21, a22, a23, a24, a17, a18, a19, a20);
  +[PFCropUtilitiesCore _interpolationV2AdjustedCrop:toFocusRegion:withFullsizeRect:andImportantRect:](PFCropUtilitiesCore, "_interpolationV2AdjustedCrop:toFocusRegion:withFullsizeRect:andImportantRect:", *(void *)&a25, *(void *)&a26, *(void *)&a27, *(void *)&a28, a17, a18, a19, a20);
  double v30 = v26;
  double v31 = v27;
  double v32 = v28;
  double v33 = v29;
  if (a8)
  {
    +[PFCropUtilitiesCore _interpolationV2ScoreForCrop:withFullsizeRect:andPreferredRect:andAcceptableRect:](PFCropUtilitiesCore, "_interpolationV2ScoreForCrop:withFullsizeRect:andPreferredRect:andAcceptableRect:", v26, v27, v28, v29, a25, a26, a27, a28, a21, a22, a23, a24, a17, a18, a19, a20);
    double v37 = v34;
    +[PFCropUtilitiesCore _interpolationV2ScoreForFocusRegion:insideCropRect:withImportantRect:](PFCropUtilitiesCore, "_interpolationV2ScoreForFocusRegion:insideCropRect:withImportantRect:", a2, a3, a4, a5, v30, v31, v32, v33, a17, a18, a19, a20);
    *a8 = v37 * v35;
  }
  return v30;
}

+ (uint64_t)_interpolationV2MaxCropSizeForAspectRatio:(double)a3 andZoom:(double)a4 withFocusRegion:(double)a5 forImageSize:(double)a6 withImportantRect:(double)a7
{
  return +[PFCropUtilitiesCore _rectDimensionOffset:insideRect:forEdge:](PFCropUtilitiesCore, "_rectDimensionOffset:insideRect:forEdge:", 3, a3, a4, a5, a6, 0.0, 0.0, 1.0, 1.0);
}

+ (double)_interpolationV2AdjustedCrop:(double)a3 toFocusRegion:(double)a4 withFullsizeRect:(double)a5 andImportantRect:(double)a6
{
  +[PFCropUtilitiesCore _translationToIncludeRect:insideRect:](PFCropUtilitiesCore, "_translationToIncludeRect:insideRect:", a13, a14, a15, a16, a1 + a5 * a3, a2 + a6 * a4, a3 * a7, a4 * a8);
  double v29 = a1 - v28;
  +[PFCropUtilitiesCore _translationToIncludeRect:insideRect:](PFCropUtilitiesCore, "_translationToIncludeRect:insideRect:", v29, a2 - v30, a3, a4, a9, a10, a11, a12);
  return v29 + v31;
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
  return +[PFCropUtilitiesCore _interpolationV2ScoreAlongEdge:forCrop:withFullsizeRect:andPreferredRect:andAcceptableRect:](PFCropUtilitiesCore, "_interpolationV2ScoreAlongEdge:forCrop:withFullsizeRect:andPreferredRect:andAcceptableRect:", 3, a1, a2, a3, a4, a5, a6, a7, a8, a17, a18, a19, a20, a21, a22, a23, a24);
}

+ (uint64_t)_interpolationV2ScoreAlongEdge:(double)a3 forCrop:(double)a4 withFullsizeRect:(double)a5 andPreferredRect:(double)a6 andAcceptableRect:(double)a7
{
  +[PFCropUtilitiesCore _rectDimensionOffset:insideRect:forEdge:](PFCropUtilitiesCore, "_rectDimensionOffset:insideRect:forEdge:", a1, a2, a3, a4, a5);
  double v36 = v29;
  +[PFCropUtilitiesCore _rectDimensionOffset:insideRect:forEdge:](PFCropUtilitiesCore, "_rectDimensionOffset:insideRect:forEdge:", a11, a12, a13, a14, a15, a5, a6, a7, a8);
  double v35 = v30;
  +[PFCropUtilitiesCore _rectDimensionOffset:insideRect:forEdge:](PFCropUtilitiesCore, "_rectDimensionOffset:insideRect:forEdge:", a11, a16, a17, a18, a19, a5, a6, a7, a8);
  double v32 = v31;
  uint64_t result = +[PFCropUtilitiesCore _rectDimensionSize:forEdge:](PFCropUtilitiesCore, "_rectDimensionSize:forEdge:", a11, a16, a17, a18, a19);
  if (v36 > 0.0)
  {
    if (v36 <= v35)
    {
      +[PFCropUtilitiesCore _interpolationFactorFor:between:and:](PFCropUtilitiesCore, "_interpolationFactorFor:between:and:", v36, 0.0);
    }
    else if (v36 <= v32)
    {
      +[PFCropUtilitiesCore _interpolationFactorFor:v36 between:v35 and:v32];
    }
    else
    {
      if (v36 > v32 + v34) {
        return result;
      }
      +[PFCropUtilitiesCore _interpolationFactorFor:between:and:](PFCropUtilitiesCore, "_interpolationFactorFor:between:and:", v36, v32);
    }
    return +[PFCropUtilitiesCore _interpolationWithFactor:between:and:](PFCropUtilitiesCore, "_interpolationWithFactor:between:and:");
  }
  return result;
}

+ (uint64_t)_interpolationCropForAspectRatio:(uint64_t)a3 andZoom:(uint64_t)a4 acceptableRect:(uint64_t)a5 andPreferredRect:(double)a6 andImageRect:(double)a7 outputCropScore:(double)a8
{
  +[PFCropUtilitiesCore _interpolationCropSizeForRatio:andZoom:forImageSize:](PFCropUtilitiesCore, "_interpolationCropSizeForRatio:andZoom:forImageSize:", a1, a2, a18, a19);

  return +[PFCropUtilitiesCore _interpolationCropToSize:withinRect:withPreferredRect:andAcceptableRect:outputScore:](PFCropUtilitiesCore, "_interpolationCropToSize:withinRect:withPreferredRect:andAcceptableRect:outputScore:", a5);
}

+ (uint64_t)_interpolationCropForAspectRatio:(double)a1 acceptableRect:(double)a2 andPreferredRect:(double)a3 andImageRect:(double)a4 outputCropScore:(double)a5
{
  return +[PFCropUtilitiesCore _interpolationCropForAspectRatio:a1 andZoom:1.0 acceptableRect:a2 andPreferredRect:a3 andImageRect:a4 outputCropScore:a5];
}

+ (double)_interpolationCropToSize:(double)a3 withinRect:(double)a4 withPreferredRect:(double)a5 andAcceptableRect:(double)a6 outputScore:(uint64_t)a7
{
  v64.origin.double y = a17;
  uint64_t v63 = *MEMORY[0x1E4F143B8];
  v64.origin.double x = a16;
  v64.size.double width = a18;
  v64.size.double height = a19;
  if (!CGRectIsNull(v64) && a16 >= 0.0 && a17 >= 0.0 && a18 > 0.0 && a19 > 0.0)
  {
    v65.size.double height = a15;
    v65.origin.double y = a13;
    v65.origin.double x = a12;
    v65.size.double width = a14;
    if (!CGRectIsNull(v65) && a12 >= 0.0 && a13 >= 0.0 && a14 > 0.0 && a15 > 0.0)
    {
      double v54 = a2;
      if ((a1 == 0.0 || a2 == 0.0 || a1 == *MEMORY[0x1E4F8A250] && a2 == *(double *)(MEMORY[0x1E4F8A250] + 8))
        && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 134218496;
        double v58 = a1;
        __int16 v59 = 2048;
        double v60 = a2;
        __int16 v61 = 2048;
        uint64_t v62 = 0x3FF0000000000000;
        _os_log_fault_impl(&dword_1A41FE000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "PFSizeGetAspectRatio produced an undefined aspect ratio from size {%lf, %lf}. Returning %f. Use PFSizeGetAspectRatioWithDefault() to provide a value for this case.", buf, 0x20u);
      }
      PFSizeWithAspectRatioFittingSize();
      double v51 = v28;
      double v52 = v27;
      v66.origin.double x = a16;
      v66.origin.double y = a17;
      v66.size.double width = a18;
      v66.size.double height = a19;
      BOOL IsNull = CGRectIsNull(v66);
      v67.origin.double x = a12;
      v67.origin.double y = a13;
      v67.size.double width = a14;
      v67.size.double height = a15;
      BOOL v30 = !CGRectIsNull(v67);
      double v31 = a14;
      double v32 = a15;
      if (!v30)
      {
        double v32 = v51;
        double v31 = v52;
      }
      int v33 = !IsNull;
      char v34 = a1 >= a18 || IsNull;
      double v53 = v32;
      if ((v34 & 1) == 0)
      {
        +[PFCropUtilitiesCore _interpolationWithFactor:a1 / a18 between:a16 + a18 * 0.5 and:a16];
        double v25 = v39;
        double v40 = 2.0 - a1 / a18;
        goto LABEL_36;
      }
      if ((v33 & v30) == 1 && a1 < a14)
      {
        +[PFCropUtilitiesCore _interpolationFactorFor:a1 between:a18 and:a14];
        double v36 = v35;
        +[PFCropUtilitiesCore _interpolationWithFactor:between:and:](PFCropUtilitiesCore, "_interpolationWithFactor:between:and:");
        double v25 = v37;
        double v38 = 2.0;
      }
      else
      {
        double v40 = 0.0;
        if (a1 >= a5)
        {
          double v25 = 0.0;
LABEL_36:
          char v43 = v54 >= a19 || IsNull;
          if (v43)
          {
            if ((v33 & v30) == 1 && v54 < a15)
            {
              +[PFCropUtilitiesCore _interpolationFactorFor:v54 between:a19 and:a15];
              double v45 = v44;
              +[PFCropUtilitiesCore _interpolationWithFactor:between:and:](PFCropUtilitiesCore, "_interpolationWithFactor:between:and:");
              double v46 = 2.0;
LABEL_46:
              double v47 = (v46 - v45) * 0.5;
              goto LABEL_47;
            }
            double v47 = 0.0;
            if (v54 < a6)
            {
              +[PFCropUtilitiesCore _interpolationFactorFor:between:and:](PFCropUtilitiesCore, "_interpolationFactorFor:between:and:", v54, v53, a6, 0.0);
              double v45 = v48;
              +[PFCropUtilitiesCore _interpolationWithFactor:between:and:](PFCropUtilitiesCore, "_interpolationWithFactor:between:and:");
              double v46 = 1.0;
              goto LABEL_46;
            }
          }
          else
          {
            +[PFCropUtilitiesCore _interpolationWithFactor:between:and:](PFCropUtilitiesCore, "_interpolationWithFactor:between:and:", v54 / a19, a17 + a19 * 0.5);
            double v47 = 2.0 - v54 / a19;
          }
LABEL_47:
          if (!a9) {
            return v25;
          }
          if (v40 >= v47) {
            double v49 = v40;
          }
          else {
            double v49 = v47;
          }
          double v26 = (2.0 - v49) * 0.5;
          goto LABEL_52;
        }
        +[PFCropUtilitiesCore _interpolationFactorFor:between:and:](PFCropUtilitiesCore, "_interpolationFactorFor:between:and:", a1, v31);
        double v36 = v41;
        +[PFCropUtilitiesCore _interpolationWithFactor:between:and:](PFCropUtilitiesCore, "_interpolationWithFactor:between:and:");
        double v25 = v42;
        double v38 = 1.0;
      }
      double v40 = (v38 - v36) * 0.5;
      goto LABEL_36;
    }
  }
  if (a5 - a1 <= 0.0) {
    double v25 = 0.0;
  }
  else {
    double v25 = (a5 - a1) * 0.5;
  }
  if (a9)
  {
    double v26 = 0.5005;
LABEL_52:
    *a9 = v26;
  }
  return v25;
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

+ (double)_curatedLibraryAdjustedRectWithFaceAreaRect:(double)a3 proposedCropRect:(double)a4 assetRect:(CGFloat)a5 verticalContentMode:(CGFloat)a6
{
  if (!CGRectIsEmpty(*(CGRect *)&a1))
  {
    v28.origin.double x = a5;
    v28.origin.double y = a6;
    v28.size.double width = a7;
    v28.size.double height = a8;
    if (!CGRectIsEmpty(v28))
    {
      v29.size.double width = a11;
      v29.size.double height = a12;
      v29.origin.double x = a9;
      v29.origin.double y = a10;
      v30.origin.double x = a5;
      v30.origin.double y = a6;
      v30.size.double width = a7;
      v30.size.double height = a8;
      if (CGRectContainsRect(v29, v30))
      {
        double v26 = fmax(a9 + a1 * a11 + a3 * a11 * 0.5 + a7 * -0.5, 0.0);
        if (a7 + v26 <= a11) {
          return v26;
        }
        else {
          return a11 - a7;
        }
      }
    }
  }
  return a5;
}

+ (void)_curatedLibraryCropForAspectRatio:(CGFloat)a3 verticalContentMode:(CGFloat)a4 cropMode:(CGFloat)a5 sourcePixelWidth:(uint64_t)a6 sourcePixelHeight:(uint64_t)a7 sourcePreferredCropRectNormalized:(uint64_t)a8 sourceAcceptableCropRectNormalized:(uint64_t)a9 sourceFaceAreaRectNormalized:(unint64_t)a10
{
  double v23 = (double)a10;
  double v24 = (double)a11;
  double v25 = (double)a10 / (double)a11;
  if (!a11) {
    double v25 = 1.0;
  }
  if (vabdd_f64(a1, v25) > 0.00000999999975)
  {
    PFSizeWithAspectRatioFittingSize();
    double v31 = v29;
    double v32 = v23 * 0.5 + 0.0 + v29 * -0.5;
    double v66 = v30;
    double v33 = v24 * 0.5 + 0.0 + v30 * -0.5;
    if (a9 == 1)
    {
      +[PFCropUtilitiesCore _curatedLibraryAdjustedRectWithFaceAreaRect:proposedCropRect:assetRect:verticalContentMode:](PFCropUtilitiesCore, "_curatedLibraryAdjustedRectWithFaceAreaRect:proposedCropRect:assetRect:verticalContentMode:", a8, a19, a20, a21, a22, v32, v33, v29, v30, 0, 0, *(void *)&v23, *(void *)&v24);
    }
    else
    {
      CGFloat v35 = a15;
      if (a9 == 3)
      {
        double rect_8 = v23 * 0.5 + 0.0 + v31 * -0.5;
        double rect_16 = v31;
        v70.origin.double x = a19;
        v70.origin.double y = a20;
        v70.size.double width = a21;
        v70.size.double height = a22;
        if (CGRectIsEmpty(v70))
        {
          v71.origin.double x = a2;
          v71.origin.double y = a3;
          v71.size.double width = a4;
          v71.size.double height = a5;
          BOOL IsNull = CGRectIsNull(v71);
          double v38 = v66;
          double v32 = rect_8;
          double v31 = rect_16;
          if (IsNull) {
            goto LABEL_18;
          }
          PFLargestSalientAspectFilledCropRect();
          goto LABEL_17;
        }
      }
      else
      {
        if (a9 != 2)
        {
          double v38 = v30;
          goto LABEL_18;
        }
        double rect_8 = v23 * 0.5 + 0.0 + v31 * -0.5;
        double rect_16 = v31;
        if (!CGRectIsNull(*(CGRect *)&v35))
        {
          v68.origin.double x = a15;
          v68.origin.double y = a16;
          v68.size.double width = a17;
          v68.size.double height = a18;
          if (!CGRectIsEmpty(v68))
          {
            PFLargestSalientAspectFilledCropRect();
            double rect_8 = v44;
            double rect_16 = v45;
            double v33 = v46;
            double v38 = v47;
            v74.origin.double x = a19;
            v74.origin.double y = a20;
            v74.size.double width = a21;
            v74.size.double height = a22;
            if (!CGRectIsEmpty(v74))
            {
              v75.size.double width = a21 * v23 + a21 * v23;
              v75.size.double height = a22 * v24 + a22 * v24;
              v75.origin.double x = a19 * v23 + 0.0 + a21 * v23 * 0.5 + v75.size.width * -0.5;
              v75.origin.double y = a20 * v24 + 0.0 + a22 * v24 * 0.5 + v75.size.height * -0.5;
              v78.origin.double x = 0.0;
              v78.origin.double y = 0.0;
              v78.size.double width = v23;
              v78.size.double height = v24;
              CGRect v76 = CGRectIntersection(v75, v78);
              CGFloat v48 = v33;
              double x = v76.origin.x;
              double y = v76.origin.y;
              double width = v76.size.width;
              double height = v76.size.height;
              v76.origin.double x = rect_8;
              CGFloat v67 = v48;
              v76.origin.double y = v48;
              v76.size.double width = rect_16;
              v76.size.double height = v38;
              v79.origin.double x = x;
              v79.origin.double y = y;
              v79.size.double width = width;
              v79.size.double height = height;
              if (CGRectContainsRect(v76, v79))
              {
                double v33 = v67;
                double v54 = rect_8;
                double v53 = rect_16;
              }
              else
              {
                double v55 = x + width * 0.5;
                double v56 = y + height * 0.5;
                double v53 = rect_16;
                double v54 = v55 + rect_16 * -0.5;
                double v33 = v56 + v38 * -0.5;
              }
              v77.origin.double x = 0.0;
              v77.origin.double y = 0.0;
              v77.size.double width = v23;
              v77.size.double height = v24;
              v80.origin.double x = v54;
              v80.origin.double y = v33;
              v80.size.double width = v53;
              v80.size.double height = v38;
              BOOL v57 = CGRectContainsRect(v77, v80);
              double v31 = v53;
              double v58 = v53 + fmax(v54, 0.0);
              if (v58 > v23) {
                double v58 = v23;
              }
              double v59 = v58 - v53;
              double v60 = v38 + fmax(v33, 0.0);
              if (v60 > v24) {
                double v60 = v24;
              }
              double v61 = v60 - v53;
              if (v57)
              {
                double v32 = v54;
              }
              else
              {
                double v33 = v61;
                double v32 = v59;
              }
              goto LABEL_18;
            }
            goto LABEL_22;
          }
        }
        v69.origin.double x = a19;
        v69.origin.double y = a20;
        v69.size.double width = a21;
        v69.size.double height = a22;
        if (CGRectIsEmpty(v69))
        {
          double v38 = v66;
LABEL_22:
          double v32 = rect_8;
          double v31 = rect_16;
LABEL_18:
          v72.origin.double x = v32;
          v72.origin.double y = v33;
          v72.size.double width = v31;
          v72.size.double height = v38;
          if (!CGRectIsEmpty(v72))
          {
            v73.origin.double x = 0.0;
            v73.origin.double y = 0.0;
            v73.size.double width = v23;
            v73.size.double height = v24;
            CGRectIsEmpty(v73);
          }
          return;
        }
      }
      +[PFCropUtilitiesCore _curatedLibraryAdjustedRectWithFaceAreaRect:proposedCropRect:assetRect:verticalContentMode:](PFCropUtilitiesCore, "_curatedLibraryAdjustedRectWithFaceAreaRect:proposedCropRect:assetRect:verticalContentMode:", a8, a19, a20, a21, a22, rect_8, v33, rect_16, v66, 0, 0, *(void *)&v23, *(void *)&v24);
    }
LABEL_17:
    double v32 = v39;
    double v33 = v40;
    double v31 = v41;
    double v38 = v42;
    goto LABEL_18;
  }
}

+ (uint64_t)bestCropRectV2ForAspectRatio:(CGFloat)a3 withFocusRegion:(double)a4 sourcePixelWidth:(CGFloat)a5 sourcePixelHeight:(uint64_t)a6 sourcePreferredCropRectNormalized:(uint64_t)a7 sourceAcceptableCropRectNormalized:(unint64_t)a8 sourceFaceAreaRectNormalized:(unint64_t)a9 outputCropScore:(double *)a10
{
  double v26 = (double)a8;
  double v27 = (double)a9;
  double v88 = a14 * (double)a8 + 0.0;
  double v94 = a15 * (double)a9 + 0.0;
  double v76 = a16 * (double)a8;
  double v77 = a17 * (double)a9;
  double v83 = a19 * (double)a9 + 0.0;
  double v86 = a20 * (double)a8;
  double v87 = a18 * (double)a8 + 0.0;
  double r1 = a21 * (double)a9;
  double v28 = *(double *)(MEMORY[0x1E4F1DB20] + 8);
  double v95 = *MEMORY[0x1E4F1DB20];
  double v29 = *(double *)(MEMORY[0x1E4F1DB20] + 16);
  double v93 = *(double *)(MEMORY[0x1E4F1DB20] + 24);
  v97.origin.double x = a22;
  v97.origin.double y = a23;
  v97.size.double width = a24;
  v97.size.double height = a25;
  int v30 = (a22 >= 0.0) & ~CGRectIsNull(v97);
  if (a23 < 0.0) {
    int v30 = 0;
  }
  if (a24 <= 0.0) {
    int v30 = 0;
  }
  if (a25 > 0.0) {
    int v31 = v30;
  }
  else {
    int v31 = 0;
  }
  double v89 = v29;
  double v90 = v28;
  CGFloat v92 = v26;
  if (v31 != 1)
  {
    double v81 = v93;
    double r2 = v29;
    double y = v28;
    double v74 = v95;
    double v43 = r1;
    double width = v86;
    double v40 = v83;
    double x = v87;
LABEL_28:
    double v42 = v76;
    double v41 = v77;
    goto LABEL_29;
  }
  double x = v87;
  double v33 = a22 * v26 + 0.0;
  v98.size.double width = a24 * v26;
  v98.origin.double x = v33;
  v98.origin.double y = (1.0 - (a23 + a25)) * v27 + 0.0;
  double r2 = a24 * v26;
  v98.size.double height = a25 * v27;
  double v74 = v33;
  double y = v98.origin.y;
  double v81 = a25 * v27;
  if (CGRectIsNull(v98))
  {
    double v43 = r1;
    double width = v86;
LABEL_83:
    double v40 = v83;
    goto LABEL_28;
  }
  double v35 = r1;
  double v34 = v86;
  if (v33 < 0.0)
  {
    double v43 = r1;
    double width = v86;
    goto LABEL_83;
  }
  if ((1.0 - (a23 + a25)) * v27 + 0.0 < 0.0 || r2 <= 0.0 || a25 * v27 <= 0.0)
  {
    double v43 = r1;
    double width = v86;
    double v40 = v83;
    goto LABEL_28;
  }
  double v36 = v87;
  double v37 = v83;
  double height = a25 * v27;
  double width = r2;
  double v40 = (1.0 - (a23 + a25)) * v27 + 0.0;
  double x = v33;
  if (!CGRectIsNull(*(CGRect *)(&v34 - 2)))
  {
    double height = a25 * v27;
    double width = r2;
    double v40 = (1.0 - (a23 + a25)) * v27 + 0.0;
    double x = v33;
    if (v87 >= 0.0)
    {
      double height = a25 * v27;
      double width = r2;
      double v40 = (1.0 - (a23 + a25)) * v27 + 0.0;
      double x = v33;
      if (v83 >= 0.0)
      {
        double height = a25 * v27;
        double width = r2;
        double v40 = (1.0 - (a23 + a25)) * v27 + 0.0;
        double x = v33;
        if (v86 > 0.0)
        {
          double height = a25 * v27;
          double width = r2;
          double v40 = (1.0 - (a23 + a25)) * v27 + 0.0;
          double x = v33;
          if (r1 > 0.0)
          {
            v99.size.double width = v86;
            v99.origin.double x = v87;
            v99.origin.double y = v83;
            v99.size.double height = r1;
            v116.origin.double x = v33;
            v116.origin.double y = (1.0 - (a23 + a25)) * v27 + 0.0;
            v116.size.double width = r2;
            v116.size.double height = a25 * v27;
            CGRect v100 = CGRectUnion(v99, v116);
            double x = v100.origin.x;
            double v40 = v100.origin.y;
            double width = v100.size.width;
            double height = v100.size.height;
          }
        }
      }
    }
  }
  v101.origin.double x = v88;
  v101.origin.double y = v94;
  double v42 = v76;
  double v41 = v77;
  v101.size.double width = v76;
  v101.size.double height = v77;
  if (CGRectIsNull(v101))
  {
    double v43 = height;
    goto LABEL_85;
  }
  double v43 = height;
  if (v88 < 0.0)
  {
LABEL_85:
    double v26 = v92;
    goto LABEL_29;
  }
  double v26 = v92;
  if (v94 >= 0.0 && v76 > 0.0 && v77 > 0.0)
  {
    +[PFCropUtilitiesCore _faceAreaRectWithPadding:](PFCropUtilitiesCore, "_faceAreaRectWithPadding:", v74, y, r2, v81);
    v117.origin.double x = 0.0;
    v117.origin.double y = 0.0;
    v117.size.double width = v92;
    v117.size.double height = v27;
    CGRect v118 = CGRectIntersection(v102, v117);
    v103.origin.double x = v88;
    v103.origin.double y = v94;
    v103.size.double width = v76;
    v103.size.double height = v77;
    CGRect v104 = CGRectUnion(v103, v118);
    double v88 = v104.origin.x;
    double v94 = v104.origin.y;
    double v42 = v104.size.width;
    double v41 = v104.size.height;
  }
LABEL_29:
  v105.origin.double x = x;
  v105.origin.double y = v40;
  v105.size.double width = width;
  v105.size.double height = v43;
  if (!CGRectIsNull(v105) && x >= 0.0 && v40 >= 0.0 && width > 0.0 && v43 > 0.0)
  {
    v119.origin.double x = 0.0;
    v119.origin.double y = 0.0;
    v106.origin.double x = x;
    v106.origin.double y = v40;
    v106.size.double width = width;
    v106.size.double height = v43;
    v119.size.double width = v26;
    v119.size.double height = v27;
    CGRect v107 = CGRectIntersection(v106, v119);
    double v95 = v107.origin.x;
    double v89 = v107.size.width;
    double v90 = v107.origin.y;
    double v93 = v107.size.height;
  }
  v108.origin.double x = v88;
  v108.origin.double y = v94;
  v108.size.double width = v42;
  v108.size.double height = v41;
  double v44 = 0.0;
  if (CGRectIsNull(v108))
  {
    double v50 = v27;
    double v51 = v26;
    double v52 = 0.0;
    double v46 = a2;
    double v45 = a4;
  }
  else
  {
    double v46 = a2;
    double v45 = a4;
    if (v88 < 0.0 || v94 < 0.0 || v42 <= 0.0)
    {
      double v50 = v27;
      double v51 = v26;
      double v52 = 0.0;
    }
    else
    {
      double v47 = v42;
      BOOL v48 = v41 <= 0.0;
      double v49 = v41;
      double v50 = v27;
      double v51 = v26;
      double v52 = 0.0;
      if (!v48)
      {
        double v53 = v88;
        v120.size.double width = v89;
        double v54 = v94;
        v120.origin.double x = v95;
        v120.origin.double y = v90;
        v120.size.double height = v93;
        CGRect v109 = CGRectUnion(*(CGRect *)(&v47 - 2), v120);
        v121.origin.double x = 0.0;
        v121.origin.double y = 0.0;
        v121.size.double width = v26;
        v121.size.double height = v27;
        CGRect v110 = CGRectIntersection(v109, v121);
        double v52 = v110.origin.x;
        double v44 = v110.origin.y;
        double v51 = v110.size.width;
        double v50 = v110.size.height;
      }
    }
  }
  double v96 = 0.0;
  v111.origin.double x = v46;
  v111.origin.double y = a3;
  v111.size.double width = v45;
  v111.size.double height = a5;
  if (CGRectIsNull(v111)) {
    goto LABEL_48;
  }
  if (v46 < 0.0) {
    goto LABEL_48;
  }
  if (a3 < 0.0) {
    goto LABEL_48;
  }
  if (v45 <= 0.0) {
    goto LABEL_48;
  }
  if (a5 <= 0.0) {
    goto LABEL_48;
  }
  v122.origin.double x = 0.0;
  v122.origin.double y = 0.0;
  v122.size.double width = 1.0;
  v122.size.double height = 1.0;
  v112.origin.double x = v46;
  v112.origin.double y = a3;
  v112.size.double width = v45;
  v112.size.double height = a5;
  if (CGRectEqualToRect(v112, v122)) {
    goto LABEL_48;
  }
  v114.origin.double x = v95;
  v114.size.double width = v89;
  v114.origin.double y = v90;
  v114.size.double height = v93;
  if (CGRectIsNull(v114)
    || v95 < 0.0
    || v90 < 0.0
    || v89 <= 0.0
    || v93 <= 0.0
    || (v115.origin.x = v52, v115.origin.y = v44, v115.size.width = v51, v115.size.double height = v50, CGRectIsNull(v115))
    || v52 < 0.0
    || v44 < 0.0
    || v51 <= 0.0
    || v50 <= 0.0)
  {
LABEL_48:
    double v69 = v51;
    double v70 = v50;
    double v68 = v52;
    CGFloat v55 = v95;
    CGFloat v57 = v89;
    CGFloat v56 = v90;
    CGFloat v58 = v93;
    uint64_t result = +[PFCropUtilitiesCore _interpolationCropForAspectRatio:acceptableRect:andPreferredRect:andImageRect:outputCropScore:](PFCropUtilitiesCore, "_interpolationCropForAspectRatio:acceptableRect:andPreferredRect:andImageRect:outputCropScore:", &v96, a1, v95, v90, v89, *(void *)&v68, *(void *)&v44, *(void *)&v69, *(void *)&v70, 0, 0, *(void *)&v92, *(void *)&v27);
  }
  else
  {
    double v72 = v51;
    double v73 = v50;
    double v71 = v52;
    double v67 = v46;
    CGFloat v58 = v93;
    CGFloat v57 = v89;
    CGFloat v56 = v90;
    CGFloat v55 = v95;
    uint64_t result = +[PFCropUtilitiesCore _interpolationV2CropForAspectRatio:withFocusRegion:andAcceptableRect:andPreferredRect:andImageRect:outputCropScore:](PFCropUtilitiesCore, "_interpolationV2CropForAspectRatio:withFocusRegion:andAcceptableRect:andPreferredRect:andImageRect:outputCropScore:", &v96, a1, v67, 1.0 - (a3 + a5), v45, a5, *(void *)&v95, *(void *)&v90, *(void *)&v89, *(void *)&v93, *(void *)&v71, *(void *)&v44, *(void *)&v72, *(void *)&v73, 0, 0, *(void *)&v92,
               *(void *)&v27);
  }
  double v60 = v96;
  if (a10) {
    *a10 = v96;
  }
  if (v60 < 0.5) {
    int v61 = v31;
  }
  else {
    int v61 = 0;
  }
  if (v61 == 1)
  {
    v123.origin.double x = v55;
    v113.origin.double x = v74;
    v113.origin.double y = y;
    v113.size.double width = r2;
    v113.size.double height = v81;
    v123.origin.double y = v56;
    v123.size.double width = v57;
    v123.size.double height = v58;
    BOOL v62 = CGRectEqualToRect(v113, v123);
    if (v62) {
      double v63 = v87;
    }
    else {
      double v63 = v74;
    }
    if (v62) {
      double v64 = v83;
    }
    else {
      double v64 = y;
    }
    if (v62) {
      double v65 = v86;
    }
    else {
      double v65 = r2;
    }
    if (v62) {
      double v66 = r1;
    }
    else {
      double v66 = v81;
    }
    return +[PFCropUtilitiesCore _interpolationCropForAspectRatio:acceptableRect:andPreferredRect:andImageRect:outputCropScore:](PFCropUtilitiesCore, "_interpolationCropForAspectRatio:acceptableRect:andPreferredRect:andImageRect:outputCropScore:", 0, a1, v63, v64, v65, v66, *(void *)&v55, *(void *)&v56, *(void *)&v57, *(void *)&v58, 0, 0, *(void *)&v92, *(void *)&v27);
  }
  return result;
}

+ (uint64_t)bestCropRectForAspectRatio:verticalContentMode:cropMode:sourcePixelWidth:sourcePixelHeight:sourcePreferredCropRectNormalized:sourceAcceptableCropRectNormalized:sourceFaceAreaRectNormalized:
{
  return +[PFCropUtilitiesCore _curatedLibraryCropForAspectRatio:verticalContentMode:cropMode:sourcePixelWidth:sourcePixelHeight:sourcePreferredCropRectNormalized:sourceAcceptableCropRectNormalized:sourceFaceAreaRectNormalized:](PFCropUtilitiesCore, "_curatedLibraryCropForAspectRatio:verticalContentMode:cropMode:sourcePixelWidth:sourcePixelHeight:sourcePreferredCropRectNormalized:sourceAcceptableCropRectNormalized:sourceFaceAreaRectNormalized:");
}

@end