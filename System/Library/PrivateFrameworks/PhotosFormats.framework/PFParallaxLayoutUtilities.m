@interface PFParallaxLayoutUtilities
+ ($54B668FA3CFF7C50914A1C899F2834C0)facePositionLimits;
+ (BOOL)_rectIsValid:(CGRect)a3;
+ (BOOL)facePositionAcceptable:(CGRect)a3 imageAspect:(double)a4;
+ (CGFloat)effectiveAcceptableRectForClassification:(double)a3 havePetFaces:(double)a4 sourcePreferredCropRectNormalized:(double)a5 sourceAcceptableCropRectNormalized:(CGFloat)x sourceFaceAreaRectNormalized:(CGFloat)y sourceGazeAreaRectNormalized:(CGFloat)width;
+ (CGRect)bestFaceRectWithImageSize:(CGSize)a3 deviceSize:(CGSize)a4 faceRegions:(id)a5;
+ (double)computeInactiveAvoidingRectForVisibleRect:(CGFloat)a3 acceptableFrame:(CGFloat)a4 unsafeRect:(CGFloat)a5 imageSize:(CGFloat)a6 considerHeadroom:(CGFloat)a7 newVisibleRect:(CGFloat)a8;
+ (double)cropScoreThresholdForClassification:(unint64_t)a3;
+ (double)effectiveMatteInspectionRectForClassification:(double)a3 havePetFaces:(double)a4 sourceAcceptableCropRectNormalized:(double)a5 sourceFaceAreaRectNormalized:(CGFloat)a6 sourcePreferredRectNormalized:(double)a7 originalMatteRectDenormalized:(CGFloat)a8;
+ (double)effectivePreferredRectForClassification:(double)y havePetFaces:(double)width sourcePreferredCropRectNormalized:(double)height sourceAcceptableCropRectNormalized:(double)a6 sourceFaceAreaRectNormalized:(double)a7;
+ (double)timeOverlapCheckThresholdForTopRect:(CGRect)a3 isInteractive:(BOOL)a4;
+ (float)headroomPenaltyForIntermediateLayout:(id)a3 originalFullExtent:(CGRect)a4 layoutConfiguration:(id)a5;
+ (id)computeLayoutWithHelper:(id)a3;
+ (id)computeLayoutsWithHelper:(id)a3;
+ (unint64_t)clockIntersectionFromTopRectMatteCoverage:(double)a3 bottomRectMatteCoverage:(double)a4;
+ (unint64_t)layoutTypeFromLayoutConfiguration:(id)a3;
@end

@implementation PFParallaxLayoutUtilities

+ (float)headroomPenaltyForIntermediateLayout:(id)a3 originalFullExtent:(CGRect)a4 layoutConfiguration:(id)a5
{
  double height = a4.size.height;
  id v7 = a5;
  id v8 = a3;
  [v8 visibleRect];
  double v10 = v9;
  [v8 visibleRect];
  double v12 = v11;

  double v13 = v10 + v12 - height;
  [v7 screenSize];
  double v15 = v14;
  [v7 screenScale];
  double v17 = v15 / v16;
  [v7 screenScale];
  double v19 = v18;

  double v20 = v17 * (v13 / v19);
  double v21 = v20 / 489574.4 * 5.0;
  BOOL v22 = v20 <= 0.0;
  double v23 = 0.0;
  if (!v22) {
    return v21;
  }
  return v23;
}

+ (double)computeInactiveAvoidingRectForVisibleRect:(CGFloat)a3 acceptableFrame:(CGFloat)a4 unsafeRect:(CGFloat)a5 imageSize:(CGFloat)a6 considerHeadroom:(CGFloat)a7 newVisibleRect:(CGFloat)a8
{
  CGFloat v29 = a1 + a3 * 0.5;
  memset(&v80, 0, sizeof(v80));
  CGAffineTransformMakeTranslation(&v80, -v29, -a2);
  memset(&v79, 0, sizeof(v79));
  CGAffineTransformMakeScale(&v79, 1.03, 1.03);
  memset(&v78, 0, sizeof(v78));
  CGAffineTransformMakeTranslation(&v78, v29, a2);
  memset(&v77, 0, sizeof(v77));
  CGAffineTransform t1 = v80;
  CGAffineTransform t2 = v79;
  CGAffineTransformConcat(&v76, &t1, &t2);
  CGAffineTransform t1 = v78;
  CGAffineTransformConcat(&v77, &v76, &t1);
  CGAffineTransform t1 = v77;
  v81.origin.CGFloat x = a1;
  v81.origin.CGFloat y = a2;
  v81.size.CGFloat width = a3;
  v81.size.CGFloat height = a4;
  CGRect v82 = CGRectApplyAffineTransform(v81, &t1);
  CGFloat v61 = a5;
  CGFloat x = v82.origin.x;
  CGFloat y = v82.origin.y;
  CGFloat width = v82.size.width;
  CGFloat height = v82.size.height;
  v82.origin.CGFloat x = a5;
  v82.origin.CGFloat y = a6;
  v82.size.CGFloat width = a7;
  v82.size.CGFloat height = a8;
  double MaxY = CGRectGetMaxY(v82);
  v83.origin.CGFloat y = a2 + a14 * a4;
  v83.size.CGFloat width = a3 * a15;
  v83.size.CGFloat height = a4 * a16;
  double v63 = a1 + a13 * a3;
  v83.origin.CGFloat x = v63;
  double v59 = a3 * a15;
  double v60 = v83.origin.y;
  double v58 = a4 * a16;
  double v34 = MaxY - CGRectGetMinY(v83);
  if (v34 > 0.0) {
    double v34 = 0.0;
  }
  if (v34 < -0.03) {
    double v34 = -0.03;
  }
  memset(&t1, 0, sizeof(t1));
  CGAffineTransformMakeTranslation(&t1, 0.0, -v34);
  CGAffineTransform t2 = t1;
  v84.origin.CGFloat x = x;
  v84.origin.CGFloat y = y;
  v84.size.CGFloat width = width;
  v84.size.CGFloat height = height;
  CGRect v85 = CGRectApplyAffineTransform(v84, &t2);
  CGFloat v35 = v85.origin.x;
  CGFloat v36 = v85.origin.y;
  CGFloat v37 = v85.size.width;
  CGFloat v38 = v85.size.height;
  v85.origin.CGFloat x = 0.0;
  v85.origin.CGFloat y = 0.0;
  v85.size.CGFloat width = a17;
  v85.size.CGFloat height = a18;
  double v67 = a1;
  CGFloat v68 = a2;
  v90.origin.CGFloat x = a1;
  v90.origin.CGFloat y = a2;
  CGFloat v39 = a3;
  v90.size.CGFloat width = a3;
  CGFloat v69 = a4;
  v90.size.CGFloat height = a4;
  CGFloat v40 = v36;
  CGFloat v41 = v37;
  BOOL v42 = CGRectContainsRect(v85, v90);
  double v43 = 1.35;
  if (a11 ^ 1 | v42) {
    double v43 = 1.0;
  }
  v86.size.CGFloat height = a18 * v43;
  v86.origin.CGFloat x = 0.0;
  v86.origin.CGFloat y = 0.0;
  v86.size.CGFloat width = a17;
  v91.origin.CGFloat x = v35;
  v91.origin.CGFloat y = v40;
  v91.size.CGFloat width = v41;
  v91.size.CGFloat height = v38;
  if (CGRectContainsRect(v86, v91))
  {
    if (a12)
    {
      *a12 = a1;
      a12[1] = v68;
      double v67 = v35;
      a12[2] = v39;
      a12[3] = v69;
    }
    else
    {
      return v35;
    }
  }
  else
  {
    memset(&t2, 0, sizeof(t2));
    CGAffineTransformMakeScale(&t2, 0.970873786, 0.970873786);
    memset(&v73, 0, sizeof(v73));
    CGAffineTransform v71 = v80;
    CGAffineTransform v70 = t2;
    CGAffineTransformConcat(&v72, &v71, &v70);
    CGAffineTransform v71 = v78;
    CGAffineTransformConcat(&v73, &v72, &v71);
    CGAffineTransform v71 = v73;
    v87.origin.CGFloat x = a1;
    v87.origin.CGFloat y = v68;
    CGFloat v44 = v39;
    v87.size.CGFloat width = v39;
    v87.size.CGFloat height = v69;
    CGRect v88 = CGRectApplyAffineTransform(v87, &v71);
    double v45 = v88.origin.x;
    double v46 = v88.origin.y;
    double v47 = v88.size.width;
    double v48 = v88.size.height;
    v88.origin.CGFloat x = v61;
    v88.origin.CGFloat y = a6;
    v88.size.CGFloat width = a7;
    v88.size.CGFloat height = a8;
    double v49 = CGRectGetMaxY(v88);
    v89.origin.CGFloat x = v63;
    v89.size.CGFloat width = v59;
    v89.origin.CGFloat y = v60;
    v89.size.CGFloat height = v58;
    double MinY = CGRectGetMinY(v89);
    if (a12)
    {
      double v51 = v49 - MinY;
      if (v51 > 0.0) {
        double v51 = 0.0;
      }
      BOOL v52 = fabs(v51) <= 0.03;
      double v54 = v68;
      double v53 = v69;
      if (v52) {
        double v53 = v48;
      }
      if (v52) {
        double v54 = v46;
      }
      double v55 = a1;
      if (v52) {
        double v55 = v45;
      }
      *a12 = v55;
      a12[1] = v54;
      if (v52) {
        double v56 = v47;
      }
      else {
        double v56 = v44;
      }
      a12[2] = v56;
      a12[3] = v53;
    }
  }
  return v67;
}

+ (unint64_t)clockIntersectionFromTopRectMatteCoverage:(double)a3 bottomRectMatteCoverage:(double)a4
{
  if (a4 <= 0.0 && a3 <= 0.0) {
    return 2;
  }
  else {
    return 1;
  }
}

+ ($54B668FA3CFF7C50914A1C899F2834C0)facePositionLimits
{
  *retstr = *($54B668FA3CFF7C50914A1C899F2834C0 *)byte_1A42D3600;
  return result;
}

+ (BOOL)facePositionAcceptable:(CGRect)a3 imageAspect:(double)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  +[PFParallaxLayoutUtilities facePositionLimits];
  if (a4 <= 1.0) {
    double v9 = width * a4;
  }
  else {
    double v9 = height * (1.0 / a4);
  }
  if (v9 < 0.0 || v9 > 0.0) {
    return 0;
  }
  v12.origin.double x = x;
  v12.origin.double y = y;
  v12.size.double width = width;
  v12.size.double height = height;
  if (CGRectGetMinX(v12) < 0.0) {
    return 0;
  }
  v13.origin.double x = x;
  v13.origin.double y = y;
  v13.size.double width = width;
  v13.size.double height = height;
  if (CGRectGetMaxX(v13) > 0.0) {
    return 0;
  }
  +[PFParallaxLayoutHelper inflatePersonFaceRect:](PFParallaxLayoutHelper, "inflatePersonFaceRect:", x, y, width, height);
  return CGRectGetMaxY(v14) <= 0.0;
}

+ (double)cropScoreThresholdForClassification:(unint64_t)a3
{
  if (a3 > 5) {
    return 0.6;
  }
  else {
    return dbl_1A42D39D0[a3];
  }
}

+ (double)timeOverlapCheckThresholdForTopRect:(CGRect)a3 isInteractive:(BOOL)a4
{
  BOOL v4 = a4;
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  double v9 = +[PFParallaxLayoutTextOverlapParameters systemParameters];
  objc_msgSend(v9, "maxTopOverlapForTopRect:isInteractive:", v4, x, y, width, height);
  double v11 = v10;

  return v11;
}

+ (unint64_t)layoutTypeFromLayoutConfiguration:(id)a3
{
  id v3 = a3;
  [v3 screenSize];
  double v5 = v4;
  [v3 screenScale];
  double v7 = v5 / v6;
  [v3 screenSize];
  double v9 = v8;
  [v3 screenScale];
  double v11 = v10;

  return v7 * (v9 / v11) >= 600000.0;
}

+ (CGRect)bestFaceRectWithImageSize:(CGSize)a3 deviceSize:(CGSize)a4 faceRegions:(id)a5
{
  double height = a4.height;
  double width = a4.width;
  double v7 = a3.height;
  double v8 = a3.width;
  uint64_t v83 = *MEMORY[0x1E4F143B8];
  id v9 = a5;
  if (v8 == 0.0
    || v7 == 0.0
    || ((double v63 = *(double *)(MEMORY[0x1E4F8A250] + 8), v64 = *MEMORY[0x1E4F8A250], v8 == *MEMORY[0x1E4F8A250])
      ? (BOOL v10 = v7 == *(double *)(MEMORY[0x1E4F8A250] + 8))
      : (BOOL v10 = 0),
        v10))
  {
    _PFAssertFailHandler();
  }
  double v11 = v9;
  if (width / height < v8 / v7) {
    double v12 = v7 * (width / height);
  }
  else {
    double v12 = v8;
  }
  if (width / height < v8 / v7) {
    double v13 = v7;
  }
  else {
    double v13 = v8 / (width / height);
  }
  double v67 = 0.0;
  double v68 = 0.0;
  double v66 = 0.0;
  if (v8 != 0.0)
  {
    double v66 = 0.0 / v8;
    double v67 = v12 / v8;
  }
  double v65 = 0.0;
  if (v7 != 0.0)
  {
    double v65 = 0.0 / v7;
    double v68 = v13 / v7;
  }
  double v14 = *MEMORY[0x1E4F1DB20];
  double v15 = *(double *)(MEMORY[0x1E4F1DB20] + 8);
  double v16 = *(double *)(MEMORY[0x1E4F1DB20] + 16);
  double v17 = *(double *)(MEMORY[0x1E4F1DB20] + 24);
  long long v79 = 0u;
  long long v80 = 0u;
  long long v77 = 0u;
  long long v78 = 0u;
  uint64_t v18 = [v9 countByEnumeratingWithState:&v77 objects:v82 count:16];
  if (v18)
  {
    uint64_t v19 = v18;
    uint64_t v20 = *(void *)v78;
    double v62 = 0.0;
    double v54 = v17;
    double v21 = v17;
    double v22 = v16;
    double v23 = v15;
    double v24 = v14;
    double v56 = v15;
    double v57 = v14;
    double v55 = v16;
    do
    {
      uint64_t v25 = 0;
      do
      {
        if (*(void *)v78 != v20) {
          objc_enumerationMutation(v11);
        }
        double v58 = v24;
        double v59 = v23;
        double v60 = v22;
        double v61 = v21;
        [*(id *)(*((void *)&v77 + 1) + 8 * v25) rectValue];
        v76[0] = MEMORY[0x1E4F143A8];
        v76[1] = 3221225472;
        v76[2] = __78__PFParallaxLayoutUtilities_bestFaceRectWithImageSize_deviceSize_faceRegions___block_invoke;
        v76[3] = &__block_descriptor_64_e29_q24__0__NSValue_8__NSValue_16l;
        v76[4] = v26;
        v76[5] = v27;
        v76[6] = v28;
        v76[7] = v29;
        v30 = [v11 sortedArrayUsingComparator:v76];
        long long v72 = 0u;
        long long v73 = 0u;
        long long v74 = 0u;
        long long v75 = 0u;
        id v31 = v30;
        uint64_t v32 = [v31 countByEnumeratingWithState:&v72 objects:v81 count:16];
        if (v32)
        {
          uint64_t v33 = v32;
          uint64_t v34 = *(void *)v73;
          double v71 = 0.0;
          while (2)
          {
            uint64_t v35 = 0;
            CGFloat v36 = v14;
            CGFloat v37 = v15;
            CGFloat v38 = v16;
            CGFloat v39 = v17;
            do
            {
              if (*(void *)v73 != v34) {
                objc_enumerationMutation(v31);
              }
              [*(id *)(*((void *)&v72 + 1) + 8 * v35) rectValue];
              v87.origin.CGFloat x = v40;
              v87.origin.CGFloat y = v41;
              double v43 = v42;
              double v45 = v44;
              v84.origin.CGFloat x = v36;
              v84.origin.CGFloat y = v37;
              v84.size.double width = v38;
              v84.size.double height = v39;
              v87.size.double width = v43;
              v87.size.double height = v45;
              CGRect v85 = CGRectUnion(v84, v87);
              CGFloat x = v85.origin.x;
              CGFloat y = v85.origin.y;
              v88.size.double width = v85.size.width;
              v88.size.double height = v85.size.height;
              v88.origin.CGFloat x = 0.0;
              v88.origin.CGFloat y = 0.0;
              v85.origin.CGFloat y = v65;
              v85.origin.CGFloat x = v66;
              v85.size.double width = v67;
              v85.size.double height = v68;
              double v16 = v88.size.width;
              double v17 = v88.size.height;
              if (!CGRectContainsRect(v85, v88))
              {
                double v14 = v36;
                double v15 = v37;
                double v16 = v38;
                double v17 = v39;
                goto LABEL_41;
              }
              if (v43 == 0.0 || v45 == 0.0 || (v45 == v63 ? (BOOL v46 = v43 == v64) : (BOOL v46 = 0), v46)) {
                double v47 = 0.0;
              }
              else {
                double v47 = v43 * v45;
              }
              ++v35;
              double v14 = x;
              double v15 = y;
              CGFloat v36 = x;
              double v71 = v71 + v47;
              CGFloat v37 = y;
              CGFloat v38 = v16;
              CGFloat v39 = v17;
            }
            while (v33 != v35);
            uint64_t v33 = [v31 countByEnumeratingWithState:&v72 objects:v81 count:16];
            if (v33) {
              continue;
            }
            break;
          }
        }
        else
        {
          double v71 = 0.0;
        }
LABEL_41:

        double v21 = v61;
        double v48 = v62;
        BOOL v49 = v71 <= v62;
        if (v71 > v62) {
          double v48 = v71;
        }
        double v62 = v48;
        if (!v49) {
          double v21 = v17;
        }
        double v23 = v59;
        double v22 = v60;
        if (!v49)
        {
          double v22 = v16;
          double v23 = v15;
        }
        double v24 = v58;
        if (!v49) {
          double v24 = v14;
        }

        ++v25;
        double v15 = v56;
        double v14 = v57;
        double v17 = v54;
        double v16 = v55;
      }
      while (v25 != v19);
      uint64_t v19 = [v11 countByEnumeratingWithState:&v77 objects:v82 count:16];
    }
    while (v19);
  }
  else
  {
    double v21 = v17;
    double v22 = v16;
    double v23 = v15;
    double v24 = v14;
  }

  double v50 = v24;
  double v51 = v23;
  double v52 = v22;
  double v53 = v21;
  result.size.double height = v53;
  result.size.double width = v52;
  result.origin.CGFloat y = v51;
  result.origin.CGFloat x = v50;
  return result;
}

uint64_t __78__PFParallaxLayoutUtilities_bestFaceRectWithImageSize_deviceSize_faceRegions___block_invoke(double *a1, void *a2, void *a3)
{
  id v5 = a3;
  [a2 rectValue];
  double v10 = hypot(a1[4] + a1[6] * 0.5 - (v6 + v7 * 0.5), a1[5] + a1[7] * 0.5 - (v8 + v9 * 0.5));
  [v5 rectValue];
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;

  double v19 = hypot(a1[4] + a1[6] * 0.5 - (v12 + v16 * 0.5), a1[5] + a1[7] * 0.5 - (v14 + v18 * 0.5));
  if (v10 < v19) {
    return -1;
  }
  else {
    return v10 > v19;
  }
}

+ (double)effectiveMatteInspectionRectForClassification:(double)a3 havePetFaces:(double)a4 sourceAcceptableCropRectNormalized:(double)a5 sourceFaceAreaRectNormalized:(CGFloat)a6 sourcePreferredRectNormalized:(double)a7 originalMatteRectDenormalized:(CGFloat)a8
{
  v58.origin.double x = r2;
  v58.size.double width = r2_16;
  v55.origin.CGFloat y = 0.0;
  v55.size.CGFloat height = 1.0;
  v58.origin.CGFloat y = 0.0;
  v58.size.CGFloat height = 1.0;
  v55.origin.double x = a6;
  v55.size.double width = a8;
  CGRect v56 = CGRectUnion(v55, v58);
  double x = v56.origin.x;
  CGFloat y = v56.origin.y;
  CGFloat height = v56.size.height;
  double v36 = a7;
  double v37 = a9;
  double v54 = a4;
  double v39 = a19;
  double v38 = a20;
  double v41 = a17;
  double v40 = a18;
  switch(a11)
  {
    case 0:
    case 3:
    case 4:
    case 5:
      break;
    case 1:
      double v52 = height;
      double v43 = a6;
      double width = v56.size.width;
      double v45 = a8;
      double v46 = y;
      int v47 = objc_msgSend(a1, "_rectIsValid:", v43, v36, v45, v37);
      if (v47)
      {
        double v38 = a20 * v52;
        double v39 = a19 * width;
      }
      else
      {
        double v39 = v54 * a19;
      }
      if (v47) {
        double v40 = a18 + v46 * a20;
      }
      else {
        double v40 = a18 + a20 * 0.0;
      }
      if (v47) {
        double v41 = a17 + x * a19;
      }
      else {
        double v41 = a17 + a2 * a19;
      }
      break;
    case 2:
      if (a12
        && (double v53 = height,
            double v48 = a6,
            double v49 = v56.size.width,
            double v50 = a8,
            double v51 = y,
            objc_msgSend(a1, "_rectIsValid:", v48, v36, v50, v37)))
      {
        double v41 = a17 + x * a19;
        double v40 = a18 + v51 * a20;
        double v39 = a19 * v49;
        double v38 = a20 * v53;
      }
      else
      {
        double v41 = a17 + a2 * a19;
        double v40 = a18 + a20 * 0.0;
        double v39 = v54 * a19;
      }
      break;
    default:
      double v41 = *MEMORY[0x1E4F1DB20];
      double v40 = *(double *)(MEMORY[0x1E4F1DB20] + 8);
      double v39 = *(double *)(MEMORY[0x1E4F1DB20] + 16);
      double v38 = *(double *)(MEMORY[0x1E4F1DB20] + 24);
      break;
  }
  v57.origin.double x = v41;
  v57.origin.CGFloat y = v40;
  v57.size.double width = v39;
  v57.size.CGFloat height = v38;
  if (CGRectIsEmpty(v57)) {
    return *MEMORY[0x1E4F8A248];
  }
  return v41;
}

+ (double)effectivePreferredRectForClassification:(double)y havePetFaces:(double)width sourcePreferredCropRectNormalized:(double)height sourceAcceptableCropRectNormalized:(double)a6 sourceFaceAreaRectNormalized:(double)a7
{
  switch(a11)
  {
    case 0:
    case 3:
    case 4:
    case 5:
      break;
    case 1:
      double x = a6;
      CGFloat y = a7;
      double width = a8;
      CGFloat height = a9;
      if (objc_msgSend(a1, "_rectIsValid:", a13, a14, a15, a16))
      {
        double v25 = a13;
        double v26 = a14;
        double v27 = a15;
        double v28 = a16;
        double v29 = x;
        double v30 = y;
        double v31 = width;
        double v32 = height;
        goto LABEL_11;
      }
      break;
    case 2:
      if (a12 && objc_msgSend(a1, "_rectIsValid:", a13, a14, a15, a16))
      {
        double v25 = a13;
        double v26 = a14;
        double v27 = a15;
        double v28 = a16;
        double v29 = a6;
        double v30 = a7;
        double v31 = a8;
        double v32 = a9;
LABEL_11:
        CGRect v38 = CGRectUnion(*(CGRect *)&v25, *(CGRect *)&v29);
        double x = v38.origin.x;
        CGFloat y = v38.origin.y;
        double width = v38.size.width;
        CGFloat height = v38.size.height;
      }
      break;
    default:
      double x = *MEMORY[0x1E4F1DB20];
      CGFloat y = *(double *)(MEMORY[0x1E4F1DB20] + 8);
      double width = *(double *)(MEMORY[0x1E4F1DB20] + 16);
      CGFloat height = *(double *)(MEMORY[0x1E4F1DB20] + 24);
      break;
  }
  v37.origin.double x = x;
  v37.origin.CGFloat y = y;
  v37.size.double width = width;
  v37.size.CGFloat height = height;
  if (CGRectIsEmpty(v37)) {
    return *MEMORY[0x1E4F8A248];
  }
  return x;
}

+ (CGFloat)effectiveAcceptableRectForClassification:(double)a3 havePetFaces:(double)a4 sourcePreferredCropRectNormalized:(double)a5 sourceAcceptableCropRectNormalized:(CGFloat)x sourceFaceAreaRectNormalized:(CGFloat)y sourceGazeAreaRectNormalized:(CGFloat)width
{
  switch(a11)
  {
    case 0:
    case 3:
    case 4:
    case 5:
      break;
    case 1:
      if (objc_msgSend(a1, "_rectIsValid:", a13, a14, a15, a16))
      {
        if (objc_msgSend(a1, "_rectIsValid:", a17, a18, a19, a20))
        {
          CGFloat height = a16;
          double width = a15;
          CGFloat y = a14;
          double x = a13;
          if (+[PFWallpaperCompoundDeviceConfiguration deviceSupportsLandscapeConfiguration])
          {
            v30.origin.double x = a13;
            v30.origin.CGFloat y = a14;
            v30.size.double width = a15;
            v30.size.CGFloat height = a16;
            v33.origin.double x = a17;
            v33.origin.CGFloat y = a18;
            v33.size.double width = a19;
            v33.size.CGFloat height = a20;
            CGRect v31 = CGRectUnion(v30, v33);
            double x = v31.origin.x;
            CGFloat y = v31.origin.y;
            double width = v31.size.width;
            CGFloat height = v31.size.height;
          }
        }
        else
        {
          CGFloat height = a16;
          double width = a15;
          CGFloat y = a14;
          double x = a13;
        }
      }
      break;
    case 2:
      if (a12 && (objc_msgSend(a1, "_rectIsValid:", a13, a14, a15, a16) & 1) != 0)
      {
        CGFloat height = a16;
        double width = a15;
        CGFloat y = a14;
        double x = a13;
      }
      break;
    default:
      double x = *MEMORY[0x1E4F1DB20];
      CGFloat y = *(double *)(MEMORY[0x1E4F1DB20] + 8);
      double width = *(double *)(MEMORY[0x1E4F1DB20] + 16);
      CGFloat height = *(double *)(MEMORY[0x1E4F1DB20] + 24);
      break;
  }
  v32.origin.double x = x;
  v32.origin.CGFloat y = y;
  v32.size.double width = width;
  v32.size.CGFloat height = height;
  if (CGRectIsEmpty(v32)) {
    return *MEMORY[0x1E4F8A248];
  }
  return x;
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

+ (id)computeLayoutsWithHelper:(id)a3
{
  uint64_t v90 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  double v4 = [PFParallaxIntermediateLayout alloc];
  [v3 initialRect];
  uint64_t v5 = -[PFParallaxIntermediateLayout initWithVisibleRect:](v4, "initWithVisibleRect:");
  id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v8 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v9 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v10 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  CGRect v55 = (void *)v5;
  double v11 = [v3 intermediateWithHeadroomStrategy:1 intermediate:v5];
  if (v11) {
    [v6 addObject:v11];
  }

  if (PFPosterEnableHeadroom()
    && [v3 headroomFeasible]
    && [v3 layoutType] != 2)
  {
    double v12 = [v3 intermediateWithHeadroomStrategy:2 intermediate:v55];
    if (v12) {
      [v6 addObject:v12];
    }
  }
  long long v73 = 0u;
  long long v74 = 0u;
  long long v71 = 0u;
  long long v72 = 0u;
  obuint64_t j = v6;
  uint64_t v13 = [obj countByEnumeratingWithState:&v71 objects:v89 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v72;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v72 != v15) {
          objc_enumerationMutation(obj);
        }
        uint64_t v17 = *(void *)(*((void *)&v71 + 1) + 8 * i);
        double v18 = [v3 intermediateWithZoomStrategy:1 intermediate:v17];
        if (v18) {
          [v7 addObject:v18];
        }

        double v19 = [v3 intermediateWithZoomStrategy:2 intermediate:v17];
        if (v19) {
          [v7 addObject:v19];
        }

        uint64_t v20 = [v3 intermediateWithZoomStrategy:3 intermediate:v17];
        if (v20) {
          [v7 addObject:v20];
        }
      }
      uint64_t v14 = [obj countByEnumeratingWithState:&v71 objects:v89 count:16];
    }
    while (v14);
  }

  long long v69 = 0u;
  long long v70 = 0u;
  long long v67 = 0u;
  long long v68 = 0u;
  id v21 = v7;
  uint64_t v22 = [v21 countByEnumeratingWithState:&v67 objects:v88 count:16];
  if (v22)
  {
    uint64_t v23 = v22;
    uint64_t v24 = *(void *)v68;
    do
    {
      for (uint64_t j = 0; j != v23; ++j)
      {
        if (*(void *)v68 != v24) {
          objc_enumerationMutation(v21);
        }
        uint64_t v26 = *(void *)(*((void *)&v67 + 1) + 8 * j);
        double v27 = [v3 intermediateWithOverlapStrategy:1 intermediate:v26];
        if (v27) {
          [v8 addObject:v27];
        }

        double v28 = [v3 intermediateWithOverlapStrategy:2 intermediate:v26];
        if (v28) {
          [v8 addObject:v28];
        }

        double v29 = [v3 intermediateWithOverlapStrategy:3 intermediate:v26];
        if (v29) {
          [v8 addObject:v29];
        }
      }
      uint64_t v23 = [v21 countByEnumeratingWithState:&v67 objects:v88 count:16];
    }
    while (v23);
  }

  long long v65 = 0u;
  long long v66 = 0u;
  long long v63 = 0u;
  long long v64 = 0u;
  id v30 = v8;
  uint64_t v31 = [v30 countByEnumeratingWithState:&v63 objects:v87 count:16];
  if (v31)
  {
    uint64_t v32 = v31;
    uint64_t v33 = *(void *)v64;
    do
    {
      for (uint64_t k = 0; k != v32; ++k)
      {
        if (*(void *)v64 != v33) {
          objc_enumerationMutation(v30);
        }
        uint64_t v35 = [v3 intermediateWithParallaxStrategy:1 intermediate:*(void *)(*((void *)&v63 + 1) + 8 * k)];
        if (v35) {
          [v9 addObject:v35];
        }
      }
      uint64_t v32 = [v30 countByEnumeratingWithState:&v63 objects:v87 count:16];
    }
    while (v32);
  }

  long long v61 = 0u;
  long long v62 = 0u;
  long long v59 = 0u;
  long long v60 = 0u;
  id v36 = v9;
  uint64_t v37 = [v36 countByEnumeratingWithState:&v59 objects:v86 count:16];
  if (v37)
  {
    uint64_t v38 = v37;
    uint64_t v39 = *(void *)v60;
    do
    {
      for (uint64_t m = 0; m != v38; ++m)
      {
        if (*(void *)v60 != v39) {
          objc_enumerationMutation(v36);
        }
        uint64_t v41 = *(void *)(*((void *)&v59 + 1) + 8 * m);
        double v42 = [v3 intermediateWithInactiveStrategy:1 intermediate:v41];
        if (v42) {
          [v10 addObject:v42];
        }

        if ([v3 layoutType] != 2)
        {
          double v43 = [v3 intermediateWithInactiveStrategy:2 intermediate:v41];
          if (v43) {
            [v10 addObject:v43];
          }
        }
      }
      uint64_t v38 = [v36 countByEnumeratingWithState:&v59 objects:v86 count:16];
    }
    while (v38);
  }

  if ([v10 count])
  {
    id v44 = v10;
    double v45 = v55;
  }
  else
  {
    double v45 = v55;
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
    {
      uint64_t v50 = [obj count];
      uint64_t v51 = [v21 count];
      uint64_t v52 = [v30 count];
      uint64_t v53 = [v36 count];
      uint64_t v54 = [v10 count];
      *(_DWORD *)buf = 134219008;
      uint64_t v77 = v50;
      __int16 v78 = 2048;
      uint64_t v79 = v51;
      __int16 v80 = 2048;
      uint64_t v81 = v52;
      __int16 v82 = 2048;
      uint64_t v83 = v53;
      __int16 v84 = 2048;
      uint64_t v85 = v54;
      _os_log_fault_impl(&dword_1A41FE000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "No intermediate layouts available to be scored, falling back to initial layout. Counts: headroom=%tu, zoom=%tu, overlap=%tu, parallax=%tu, inactive=%tu", buf, 0x34u);
    }
    long long v75 = v55;
    id v44 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v75 count:1];
  }
  v57[0] = MEMORY[0x1E4F143A8];
  v57[1] = 3221225472;
  v57[2] = __54__PFParallaxLayoutUtilities_computeLayoutsWithHelper___block_invoke;
  v57[3] = &unk_1E5B2E1A8;
  id v58 = v3;
  id v46 = v3;
  int v47 = PFMap(v44, v57);
  double v48 = (void *)[v47 copy];

  return v48;
}

uint64_t __54__PFParallaxLayoutUtilities_computeLayoutsWithHelper___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) scoreIntermediate:a2];
}

+ (id)computeLayoutWithHelper:(id)a3
{
  id v3 = a3;
  double v4 = +[PFParallaxLayoutUtilities computeLayoutsWithHelper:v3];
  uint64_t v5 = [v3 bestLayout:v4];

  return v5;
}

@end