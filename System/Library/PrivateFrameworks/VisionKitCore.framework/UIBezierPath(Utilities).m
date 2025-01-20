@interface UIBezierPath(Utilities)
+ (CGPath)_cgPathFromClipperPath:()Utilities;
+ (CGPath)vk_newRoundedPathWithRadius:()Utilities points:;
+ (VKLineSegment)vk_shiftLinePerpendicularlyFromPoint:()Utilities to:radius:;
+ (double)radiusForQuads:()Utilities radiusRatio:;
+ (double)vk_clampedRadius:()Utilities p1:p2:p3:;
+ (double)vk_projectPoint:()Utilities lineStart:lineEnd:;
+ (id)mapPaths:()Utilities toQuads:;
+ (id)vk_allPointsFromCGPath:()Utilities;
+ (id)vk_groupAndRoundPaths:()Utilities radius:offset:;
+ (id)vk_subpathArrayFromCGPath:()Utilities;
+ (uint64_t)vk_cgPathcontainsAnyCurveToPoints:()Utilities;
+ (void)_processPointsForNarrowAngles:()Utilities;
+ (void)_processPointsForRounding:()Utilities withRadius:;
+ (void)vk_calculateCenterForPoints:()Utilities p2:p3:radius:;
+ (void)vk_roundAndGroupNormalizedQuadsForHighlight:()Utilities aspectRatio:expansionScale:radiusToAvgHeightRatio:;
+ (void)vk_signForRadiusWithVectorStart:()Utilities end:otherPoint:;
- (double)vk_centroid;
- (double)vk_lengthIgnoringCurves;
- (id)_vk_flattenWithPath:()Utilities clipType:;
- (id)debugQuickLookObject;
- (id)vk_expandWithOffset:()Utilities;
- (id)vk_intersectAndFlattenWithPath:()Utilities;
- (id)vk_pathByFittingToRect:()Utilities;
- (id)vk_pathFromFlippingInRect:()Utilities;
- (id)vk_unionAndFlattenWithPath:()Utilities;
- (uint64_t)vk_CGPath;
- (uint64_t)vk_allPoints;
- (uint64_t)vk_applyTransform:()Utilities;
- (uint64_t)vk_subpathArray;
- (void)vk_appendBezierPath:()Utilities;
- (void)vk_appendRect:()Utilities;
@end

@implementation UIBezierPath(Utilities)

- (uint64_t)vk_CGPath
{
  id v1 = a1;
  return [v1 CGPath];
}

- (void)vk_appendRect:()Utilities
{
  +[VKQuad quadFromCGRect:](VKQuad, "quadFromCGRect:");
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  v2 = [v3 path];
  objc_msgSend(a1, "vk_appendBezierPath:", v2);
}

- (void)vk_appendBezierPath:()Utilities
{
  id v4 = a3;
  if (v4 && ([v4 isEmpty] & 1) == 0) {
    [a1 appendPath:v4];
  }
}

- (double)vk_centroid
{
  id v1 = objc_msgSend(a1, "vk_allPoints");
  unint64_t v2 = [v1 count];
  unint64_t v3 = v2;
  double v4 = *MEMORY[0x1E4F1DAD8];
  double v5 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  if (v2 >= 3)
  {
    uint64_t v6 = 0;
    unint64_t v7 = v2 - 1;
    double v8 = 0.0;
    do
    {
      v9 = [v1 objectAtIndexedSubscript:v6];
      objc_msgSend(v9, "vk_pointValue");
      double v11 = v10;
      double v13 = v12;

      if (v7 == v6) {
        uint64_t v14 = 0;
      }
      else {
        uint64_t v14 = v6 + 1;
      }
      v15 = [v1 objectAtIndexedSubscript:v14];
      objc_msgSend(v15, "vk_pointValue");
      double v17 = v16;
      double v19 = v18;
      ++v6;

      double v20 = VKMCrossPoints(v17, v19, v11, v13);
      double v4 = v4 + (v11 + v17) * v20;
      double v5 = v5 + (v13 + v19) * v20;
      double v8 = v8 + v20 * 0.5;
    }
    while (v3 != v6);
    double v21 = VKMMultiplyPointScalar(v4, v5, 1.0 / (v8 * 6.0));
    if (v21 >= 0.0) {
      double v4 = v21;
    }
    else {
      double v4 = -v21;
    }
  }

  return v4;
}

- (double)vk_lengthIgnoringCurves
{
  uint64_t v9 = 0;
  double v10 = (double *)&v9;
  uint64_t v11 = 0x2020000000;
  uint64_t v12 = 0;
  v7[0] = 0;
  v7[1] = v7;
  v7[2] = 0x4012000000;
  v7[3] = __Block_byref_object_copy__15;
  v7[4] = __Block_byref_object_dispose__15;
  v7[5] = &unk_1DB350762;
  long long v8 = VKMPointInfinity;
  v5[0] = 0;
  v5[1] = v5;
  v5[2] = 0x4012000000;
  v5[3] = __Block_byref_object_copy__15;
  v5[4] = __Block_byref_object_dispose__15;
  v5[5] = &unk_1DB350762;
  long long v6 = VKMPointInfinity;
  id v1 = (const CGPath *)objc_msgSend(a1, "vk_CGPath");
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __50__UIBezierPath_Utilities__vk_lengthIgnoringCurves__block_invoke;
  block[3] = &unk_1E6BF3608;
  block[4] = v5;
  block[5] = v7;
  block[6] = &v9;
  CGPathApplyWithBlock(v1, block);
  double v2 = v10[3];
  _Block_object_dispose(v5, 8);
  _Block_object_dispose(v7, 8);
  _Block_object_dispose(&v9, 8);
  return v2;
}

- (uint64_t)vk_allPoints
{
  double v2 = objc_opt_class();
  uint64_t v3 = objc_msgSend(a1, "vk_CGPath");
  return objc_msgSend(v2, "vk_allPointsFromCGPath:", v3);
}

+ (id)vk_allPointsFromCGPath:()Utilities
{
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __50__UIBezierPath_Utilities__vk_allPointsFromCGPath___block_invoke;
  block[3] = &unk_1E6BF3630;
  id v5 = v4;
  id v8 = v5;
  CGPathApplyWithBlock(a3, block);

  return v5;
}

- (uint64_t)vk_applyTransform:()Utilities
{
  long long v3 = a3[1];
  v5[0] = *a3;
  v5[1] = v3;
  v5[2] = a3[2];
  return [a1 applyTransform:v5];
}

- (id)vk_pathFromFlippingInRect:()Utilities
{
  id v10 = objc_alloc_init(MEMORY[0x1E4F427D0]);
  uint64_t v11 = (const CGPath *)objc_msgSend(a1, "vk_CGPath");
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __53__UIBezierPath_Utilities__vk_pathFromFlippingInRect___block_invoke;
  block[3] = &unk_1E6BF3658;
  id v12 = v10;
  id v15 = v12;
  double v16 = a2;
  double v17 = a3;
  double v18 = a4;
  double v19 = a5;
  CGPathApplyWithBlock(v11, block);

  return v12;
}

- (id)debugQuickLookObject
{
  id v1 = a1;
  [v1 bounds];
  if (v2 >= 2.0)
  {
    [v1 bounds];
    CGFloat v3 = 20.0;
    if (v7 >= 20.0) {
      goto LABEL_6;
    }
    id v4 = v9;
    id v5 = (CGAffineTransform *)v9;
    CGFloat v6 = 20.0;
  }
  else
  {
    CGFloat v3 = 150.0;
    id v4 = v10;
    id v5 = (CGAffineTransform *)v10;
    CGFloat v6 = 150.0;
  }
  CGAffineTransformMakeScale(v5, v3, v6);
  objc_msgSend(v1, "vk_applyTransform:", v4);
LABEL_6:
  return v1;
}

- (uint64_t)vk_subpathArray
{
  double v2 = objc_opt_class();
  uint64_t v3 = objc_msgSend(a1, "vk_CGPath");
  return objc_msgSend(v2, "vk_subpathArrayFromCGPath:", v3);
}

+ (id)vk_subpathArrayFromCGPath:()Utilities
{
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v12[0] = 0;
  v12[1] = v12;
  v12[2] = 0x3032000000;
  v12[3] = __Block_byref_object_copy__8;
  v12[4] = __Block_byref_object_dispose__9;
  id v13 = objc_alloc_init(MEMORY[0x1E4F427D0]);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __53__UIBezierPath_Utilities__vk_subpathArrayFromCGPath___block_invoke;
  v9[3] = &unk_1E6BF3680;
  uint64_t v11 = v12;
  id v5 = v4;
  id v10 = v5;
  CGPathApplyWithBlock(a3, v9);
  CGFloat v6 = v10;
  id v7 = v5;

  _Block_object_dispose(v12, 8);
  return v7;
}

- (id)vk_pathByFittingToRect:()Utilities
{
  [a1 bounds];
  double v11 = v10;
  double v15 = VKMCenterOfRect(v12, v13, v10, v14);
  double v17 = v16;
  double v30 = a2;
  double v31 = a3;
  double v18 = VKMCenterOfRect(a2, a3, a4, a5);
  CGFloat v20 = v19;
  double v21 = VKMSizeRatioFromSizes(a4, a5, v11);
  CGFloat v23 = v22;
  memset(&v38, 0, sizeof(v38));
  CGAffineTransformMakeTranslation(&v38, -v15, -v17);
  CGAffineTransform t1 = v38;
  CGAffineTransformMakeScale(&t2, v21, v23);
  CGAffineTransformConcat(&v37, &t1, &t2);
  CGAffineTransform v38 = v37;
  CGAffineTransform v34 = v37;
  CGAffineTransformMakeTranslation(&v33, v18, v20);
  CGAffineTransformConcat(&v37, &v34, &v33);
  CGAffineTransform v38 = v37;
  v24 = (void *)[a1 copy];
  CGAffineTransform v32 = v38;
  objc_msgSend(v24, "vk_applyTransform:", &v32);
  [v24 bounds];
  if (!VKMNearlyEqualRects(v30, v31, a4, a5, v25, v26, v27, v28)) {
    +[VKAssert handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:](VKAssert, "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "VKMNearlyEqualRects(endBounds, result.bounds)", "-[UIBezierPath(Utilities) vk_pathByFittingToRect:]", 0, 0, @"path vk_transformToFitRect did not give a correct result");
  }
  return v24;
}

- (id)vk_unionAndFlattenWithPath:()Utilities
{
  id v4 = a3;
  id v5 = v4;
  if (v4 && ([v4 isEmpty] & 1) == 0)
  {
    CGFloat v6 = objc_msgSend(a1, "_vk_flattenWithPath:clipType:", v5, 1);
  }
  else
  {
    CGFloat v6 = 0;
  }

  return v6;
}

- (id)vk_intersectAndFlattenWithPath:()Utilities
{
  id v4 = a3;
  id v5 = v4;
  if (v4 && ([v4 isEmpty] & 1) == 0)
  {
    CGFloat v6 = objc_msgSend(a1, "_vk_flattenWithPath:clipType:", v5, 0);
  }
  else
  {
    CGFloat v6 = 0;
  }

  return v6;
}

- (id)_vk_flattenWithPath:()Utilities clipType:
{
  id v4 = a3;
  memset(v19, 0, sizeof(v19));
  ClipperLib::Clipper::Clipper((ClipperLib::Clipper *)&v10, 0);
  id v5 = a1;
  if (v4 && ([v4 isEmpty] & 1) == 0)
  {
    memset(&v9, 0, sizeof(v9));
    CGAffineTransformMakeScale(&v9, 10000.0, 10000.0);
    if (([v5 isEmpty] & 1) == 0)
    {
      CGFloat v6 = (const CGPath *)MEMORY[0x1E018D8C0](objc_msgSend(v5, "vk_CGPath"), &v9);
      VKMClipperPathsFromCGPath(v6, 1.0);
    }
    id v7 = (const CGPath *)MEMORY[0x1E018D8C0](objc_msgSend(v4, "vk_CGPath"), &v9);
    VKMClipperPathsFromCGPath(v7, 1.0);
  }
  std::__list_imp<long long>::clear(v17);
  if (__p)
  {
    double v16 = __p;
    operator delete(__p);
  }
  if (v13)
  {
    CGFloat v14 = v13;
    operator delete(v13);
  }
  if (v11)
  {
    CGFloat v12 = v11;
    operator delete(v11);
  }
  ClipperLib::ClipperBase::~ClipperBase((ClipperLib::ClipperBase *)&v18);
  CGFloat v10 = (void **)v19;
  std::vector<std::vector<ClipperLib::IntPoint>>::__destroy_vector::operator()[abi:ne180100](&v10);

  return v5;
}

- (id)vk_expandWithOffset:()Utilities
{
  id v1 = (const CGPath *)objc_msgSend(a1, "vk_CGPath");
  if ((objc_msgSend((id)objc_opt_class(), "vk_cgPathcontainsAnyCurveToPoints:", v1) & 1) == 0) {
    VKMClipperPathsFromCGPath(v1, 1.0);
  }
  return 0;
}

+ (id)vk_groupAndRoundPaths:()Utilities radius:offset:
{
  id v4 = a3;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __63__UIBezierPath_Utilities__vk_groupAndRoundPaths_radius_offset___block_invoke;
  v16[3] = &__block_descriptor_40_e29_B32__0__UIBezierPath_8Q16_B24l;
  v16[4] = a1;
  if ((objc_msgSend(v4, "vk_containsObjectPassingTest:", v16) & 1) == 0)
  {
    memset(v15, 0, sizeof(v15));
    uint64_t v8 = 0;
    CGAffineTransform v9 = &v8;
    uint64_t v10 = 0x15012000000;
    double v11 = __Block_byref_object_copy__16;
    CGFloat v12 = __Block_byref_object_dispose__17;
    CGFloat v13 = &unk_1DB350762;
    double v5 = ClipperLib::Clipper::Clipper((ClipperLib::Clipper *)&v14, 0);
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __63__UIBezierPath_Utilities__vk_groupAndRoundPaths_radius_offset___block_invoke_19;
    v7[3] = &unk_1E6BF36C8;
    v7[4] = &v8;
    objc_msgSend(v4, "enumerateObjectsUsingBlock:", v7, v5);
    ClipperLib::Clipper::Execute((uint64_t)(v9 + 6), 1, v15, 0);
    operator new();
  }

  return 0;
}

+ (uint64_t)vk_cgPathcontainsAnyCurveToPoints:()Utilities
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __61__UIBezierPath_Utilities__vk_cgPathcontainsAnyCurveToPoints___block_invoke;
  block[3] = &unk_1E6BF3718;
  void block[4] = &v6;
  CGPathApplyWithBlock(path, block);
  uint64_t v3 = *((unsigned __int8 *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

+ (CGPath)_cgPathFromClipperPath:()Utilities
{
  Mutable = CGPathCreateMutable();
  uint64_t v6 = *a3;
  double v5 = a3[1];
  while (v6 != v5)
  {
    id v7 = *v6;
    uint64_t v8 = v6[1];
    if (*v6 != v8)
    {
      char v9 = 1;
      do
      {
        if (v9) {
          CGPathMoveToPoint(Mutable, 0, (double)**v6, (double)(*v6)[1]);
        }
        else {
          CGPathAddLineToPoint(Mutable, 0, (double)*v7, (double)v7[1]);
        }
        char v9 = 0;
        v7 += 3;
      }
      while (v7 != v8);
    }
    CGPathCloseSubpath(Mutable);
    v6 += 3;
  }
  return Mutable;
}

+ (CGPath)vk_newRoundedPathWithRadius:()Utilities points:
{
  id v6 = a4;
  id v7 = (void *)[v6 mutableCopy];
  [a1 _processPointsForRounding:v7 withRadius:a2];
  [a1 _processPointsForNarrowAngles:v7];
  id v8 = v7;

  Mutable = CGPathCreateMutable();
  unint64_t v10 = 0;
  double v52 = a2;
  while (objc_msgSend(v8, "count", *(void *)&v52) > v10)
  {
    double v11 = [v8 objectAtIndex:v10];
    objc_msgSend(v11, "vk_pointValue");
    double v13 = v12;
    double v15 = v14;

    double v16 = objc_msgSend(v8, "objectAtIndex:", (v10 + 1) % objc_msgSend(v8, "count"));
    objc_msgSend(v16, "vk_pointValue");
    double v18 = v17;
    double v20 = v19;

    double v21 = objc_msgSend(v8, "objectAtIndex:", (v10 + 2) % objc_msgSend(v8, "count"));
    objc_msgSend(v21, "vk_pointValue");
    double v59 = v22;
    double v24 = v23;

    double v25 = objc_msgSend(v8, "objectAtIndex:", (v10 + 3) % objc_msgSend(v8, "count"));
    objc_msgSend(v25, "vk_pointValue");
    double v57 = v27;
    double v58 = v26;

    double v28 = v13;
    objc_msgSend(MEMORY[0x1E4F427D0], "vk_clampedRadius:p1:p2:p3:", a2, v13, v15, v18, v20, v59, v24);
    double v30 = v29;
    objc_msgSend(MEMORY[0x1E4F427D0], "vk_clampedRadius:p1:p2:p3:", a2, v18, v20, v59, v24, v58, v57);
    double v32 = v31;
    CGFloat radius = fmin(v30, v31);
    objc_msgSend(MEMORY[0x1E4F427D0], "vk_calculateCenterForPoints:p2:p3:radius:", v28, v15, v18, v20, v59, v24);
    double v34 = v33;
    double v36 = v35;
    objc_msgSend(MEMORY[0x1E4F427D0], "vk_projectPoint:lineStart:lineEnd:");
    CGFloat x = v37;
    CGFloat v39 = v38;
    objc_msgSend(MEMORY[0x1E4F427D0], "vk_projectPoint:lineStart:lineEnd:", v34, v36, v18, v20, v59, v24);
    double v53 = v41;
    double v54 = v40;
    if (!v10) {
      CGPathMoveToPoint(Mutable, 0, x, v39);
    }
    objc_msgSend(MEMORY[0x1E4F427D0], "vk_calculateCenterForPoints:p2:p3:radius:", v18, v20, v59, v24, v58, v57, v32);
    objc_msgSend(MEMORY[0x1E4F427D0], "vk_projectPoint:lineStart:lineEnd:");
    CGFloat v43 = v42;
    CGFloat v45 = v44;
    double v46 = VKMAngleBetweenPoints(v34 + 10.0, v36, v34, v36, x, v39);
    double v47 = VKMAngleBetweenPoints(v34 + 10.0, v36, v34, v36, v54, v53);
    VKMNormalizeAngleInRadians(v47 - v46);
    double v49 = v48;
    VKMNormalizeAngleInRadians(v46 - v47);
    CGPathAddArc(Mutable, 0, v34, v36, radius, v46, v47, v49 >= v50);
    a2 = v52;
    ++v10;
    CGPathAddLineToPoint(Mutable, 0, v43, v45);
  }
  CGPathCloseSubpath(Mutable);

  return Mutable;
}

+ (void)_processPointsForNarrowAngles:()Utilities
{
  id v24 = a3;
  for (unint64_t i = 0; [v24 count] > i; ++i)
  {
    unint64_t v4 = [v24 count];
    unint64_t v5 = [v24 count];
    id v6 = [v24 objectAtIndex:i];
    objc_msgSend(v6, "vk_pointValue");
    double v8 = v7;
    double v10 = v9;
    unint64_t v11 = (i + 1) % v4;

    double v12 = [v24 objectAtIndex:v11];
    objc_msgSend(v12, "vk_pointValue");
    double v14 = v13;
    double v16 = v15;

    double v17 = [v24 objectAtIndex:(i + 2) % v5];
    objc_msgSend(v17, "vk_pointValue");
    double v19 = v18;
    double v21 = v20;

    double v22 = fabs(VKMAngleBetweenPoints(v8, v10, v14, v16, v19, v21));
    if (v22 < 0.785398163 || v22 > 5.49778714)
    {
      objc_msgSend(MEMORY[0x1E4F427D0], "vk_projectPoint:lineStart:lineEnd:", v8, v10, v14, v16, v19, v21);
      double v23 = objc_msgSend(MEMORY[0x1E4F29238], "vk_valueWithPoint:");
      [v24 setObject:v23 atIndexedSubscript:v11];
    }
  }
}

+ (void)_processPointsForRounding:()Utilities withRadius:
{
  id v5 = a4;
  v24[0] = 0;
  v24[1] = v24;
  v24[2] = 0x3032000000;
  v24[3] = __Block_byref_object_copy__8;
  v24[4] = __Block_byref_object_dispose__9;
  id v25 = 0;
  uint64_t v18 = 0;
  double v19 = &v18;
  uint64_t v20 = 0x3032000000;
  double v21 = __Block_byref_object_copy__8;
  double v22 = __Block_byref_object_dispose__9;
  id v23 = 0;
  id v6 = (void *)[v5 copy];
  v17[1] = 3221225472;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[2] = __64__UIBezierPath_Utilities___processPointsForRounding_withRadius___block_invoke;
  v17[3] = &unk_1E6BF3740;
  double v7 = a1 / 3.0;
  *(double *)&v17[6] = v7;
  v17[4] = v24;
  v17[5] = &v18;
  [v6 enumerateObjectsUsingBlock:v17];

  if (v19[5]) {
    objc_msgSend(v5, "removeObjectsAtIndexes:");
  }
  double v8 = [v5 firstObject];
  objc_msgSend(v8, "vk_pointValue");
  double v10 = v9;
  double v12 = v11;
  double v13 = [v5 lastObject];
  objc_msgSend(v13, "vk_pointValue");
  BOOL v16 = VKMNearlyEqualPointsWithThreshold(v10, v12, v14, v15, v7);

  if (v16) {
    [v5 removeLastObject];
  }
  _Block_object_dispose(&v18, 8);

  _Block_object_dispose(v24, 8);
}

+ (VKLineSegment)vk_shiftLinePerpendicularlyFromPoint:()Utilities to:radius:
{
  double v10 = objc_alloc_init(VKLineSegment);
  if (a1 == a3)
  {
    double v11 = a5;
  }
  else
  {
    double v11 = 0.0;
    if (a2 != a4)
    {
      double v12 = VKMSlopeOfLine(a1, a2, a3, a4);
      long double v13 = atan(fabs(v12));
      cos(v13);
    }
  }
  [(VKLineSegment *)v10 setStartPoint:VKMAddPoints(a1, a2, v11)];
  [(VKLineSegment *)v10 setEndPoint:VKMAddPoints(a3, a4, v11)];
  return v10;
}

+ (double)vk_clampedRadius:()Utilities p1:p2:p3:
{
  return fmin(fmin(fmin(a1, fmax(vabdd_f64(a2, a4), vabdd_f64(a3, a5)) * 0.5), fmax(vabdd_f64(a2, a6), vabdd_f64(a3, a7)) * 0.5), fmax(vabdd_f64(a4, a6), vabdd_f64(a5, a7)) * 0.5);
}

+ (void)vk_signForRadiusWithVectorStart:()Utilities end:otherPoint:
{
  if (a1 != a3) {
    VKMSlopeOfLine(a1, a2, a3, a4);
  }
}

+ (void)vk_calculateCenterForPoints:()Utilities p2:p3:radius:
{
  v31[4] = *(double *)MEMORY[0x1E4F143B8];
  objc_msgSend(a1, "vk_signForRadiusWithVectorStart:end:otherPoint:");
  BOOL v16 = objc_msgSend(MEMORY[0x1E4F427D0], "vk_shiftLinePerpendicularlyFromPoint:to:radius:", a2, a3, a4, a5, v15 * a8);
  objc_msgSend(MEMORY[0x1E4F427D0], "vk_signForRadiusWithVectorStart:end:otherPoint:", a6, a7, a4, a5, a2, a3);
  uint64_t v18 = objc_msgSend(MEMORY[0x1E4F427D0], "vk_shiftLinePerpendicularlyFromPoint:to:radius:", a6, a7, a4, a5, v17 * a8);
  [v16 startPoint];
  v31[0] = v19;
  v31[1] = v20;
  [v16 endPoint];
  v31[2] = v21;
  v31[3] = v22;
  [v18 startPoint];
  v30[0] = v23;
  v30[1] = v24;
  [v18 endPoint];
  v30[2] = v25;
  v30[3] = v26;
  uint64_t v27 = 0;
  uint64_t v28 = 0;
  VKMIntersectionOfLines(v31, v30, (double *)&v27, (double *)&v28, (double *)&v29, 1, 1);
}

+ (double)vk_projectPoint:()Utilities lineStart:lineEnd:
{
  double v6 = a3;
  long long v14 = *MEMORY[0x1E4F1DAD8];
  if (a3 != a5)
  {
    if (a4 == a6)
    {
      return a1;
    }
    else
    {
      double v10 = VKMSlopeOfLine(a3, a4, a5, a6);
      double v11 = objc_alloc_init(VKLine);
      [(VKLine *)v11 setA:v10];
      [(VKLine *)v11 setB:a4 - v10 * v6];
      double v12 = objc_alloc_init(VKLine);
      [(VKLine *)v12 setA:-1.0 / v10];
      [(VKLine *)v12 setB:a2 + 1.0 / v10 * a1];
      VKMIntersectsLine(v11, v12, (uint64_t)&v14);

      return *(double *)&v14;
    }
  }
  return v6;
}

+ (void)vk_roundAndGroupNormalizedQuadsForHighlight:()Utilities aspectRatio:expansionScale:radiusToAvgHeightRatio:
{
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x1E4F427D0]);
  v6[0] = 0;
  v6[1] = v6;
  v6[2] = 0x13812000000;
  v6[3] = __Block_byref_object_copy__25;
  v6[4] = __Block_byref_object_dispose__26;
  v6[5] = &unk_1DB350762;
  ClipperLib::ClipperOffset::ClipperOffset((ClipperLib::ClipperOffset *)&v7, 2.0, 0.25);
  v5[0] = 0;
  v5[1] = v5;
  v5[2] = 0x2020000000;
  _OWORD v5[3] = 0;
  operator new();
}

+ (double)radiusForQuads:()Utilities radiusRatio:
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  unint64_t v6 = [v5 count];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v7 = v5;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v15;
    double v10 = 0.0;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v7);
        }
        objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * i), "sideLength", (void)v14);
        double v10 = v10 + v12;
      }
      uint64_t v8 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v8);
  }
  else
  {
    double v10 = 0.0;
  }

  return v10 / (double)v6 * a1;
}

+ (id)mapPaths:()Utilities toQuads:
{
  id v5 = a3;
  id v6 = a4;
  id v7 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
  uint64_t v8 = (void *)[objc_alloc(MEMORY[0x1E4F1CA80]) initWithArray:v6];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __44__UIBezierPath_Utilities__mapPaths_toQuads___block_invoke;
  v14[3] = &unk_1E6BF37E0;
  id v15 = v8;
  id v9 = v7;
  id v16 = v9;
  id v10 = v8;
  [v5 enumerateObjectsUsingBlock:v14];
  double v11 = v16;
  id v12 = v9;

  return v12;
}

@end