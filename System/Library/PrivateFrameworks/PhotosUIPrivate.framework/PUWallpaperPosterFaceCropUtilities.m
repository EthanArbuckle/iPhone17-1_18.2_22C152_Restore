@interface PUWallpaperPosterFaceCropUtilities
+ (CGRect)_getBoundingFaceRectFor:(id)a3 userInfo:(id)a4 visibleFrame:(CGRect)a5 originalImage:(CGRect)a6;
+ (CGRect)getSquareCropForVisibleFrame:(CGRect)a3 layerStack:(id)a4 userInfo:(id)a5 originalImage:(CGRect)a6;
+ (double)_getNormalizedRectForSaliencyRect:(double)a3 originalImage:(double)a4 visibleFrame:(double)a5;
+ (id)_getNormalizedFaceRects:(id)a3 userInfo:(id)a4 originalImage:(CGRect)a5 visibleFrame:(CGRect)a6;
+ (uint64_t)_getBestCropForVisibleFrame:(double)a3 preferredCropCrect:(double)a4 acceptableCropRect:(double)a5 faceRect:(double)a6;
@end

@implementation PUWallpaperPosterFaceCropUtilities

+ (id)_getNormalizedFaceRects:(id)a3 userInfo:(id)a4 originalImage:(CGRect)a5 visibleFrame:(CGRect)a6
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  v7 = [a4 objectForKeyedSubscript:@"regions"];
  v8 = [v7 objectForKeyedSubscript:@"faces"];

  id v9 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  id v10 = v8;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v39 objects:v44 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v40;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v40 != v13) {
          objc_enumerationMutation(v10);
        }
        CFDictionaryRef v15 = *(const __CFDictionary **)(*((void *)&v39 + 1) + 8 * i);
        memset(&rect, 0, sizeof(rect));
        if (CGRectMakeWithDictionaryRepresentation(v15, &rect))
        {
          v16 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGRect:", rect.origin.x, rect.origin.y, rect.size.width, rect.size.height);
          [v9 addObject:v16];
        }
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v39 objects:v44 count:16];
    }
    while (v12);
  }

  id v17 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  id v18 = v9;
  uint64_t v19 = [v18 countByEnumeratingWithState:&v34 objects:v43 count:16];
  if (v19)
  {
    uint64_t v20 = v19;
    uint64_t v21 = *(void *)v35;
    CGFloat v22 = *MEMORY[0x1E4F1DB20];
    CGFloat v23 = *(double *)(MEMORY[0x1E4F1DB20] + 8);
    CGFloat v24 = *(double *)(MEMORY[0x1E4F1DB20] + 16);
    CGFloat v25 = *(double *)(MEMORY[0x1E4F1DB20] + 24);
    do
    {
      for (uint64_t j = 0; j != v20; ++j)
      {
        if (*(void *)v35 != v21) {
          objc_enumerationMutation(v18);
        }
        [*(id *)(*((void *)&v34 + 1) + 8 * j) CGRectValue];
        objc_msgSend(a1, "_getNormalizedRectForSaliencyRect:originalImage:visibleFrame:", *(void *)&a6.origin.x, *(void *)&a6.origin.y, *(void *)&a6.size.width, *(void *)&a6.size.height);
        double x = v47.origin.x;
        double y = v47.origin.y;
        double width = v47.size.width;
        double height = v47.size.height;
        v48.origin.double x = v22;
        v48.origin.double y = v23;
        v48.size.double width = v24;
        v48.size.double height = v25;
        if (!CGRectEqualToRect(v47, v48))
        {
          v31 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGRect:", x, y, width, height);
          [v17 addObject:v31];
        }
      }
      uint64_t v20 = [v18 countByEnumeratingWithState:&v34 objects:v43 count:16];
    }
    while (v20);
  }

  return v17;
}

+ (CGRect)_getBoundingFaceRectFor:(id)a3 userInfo:(id)a4 visibleFrame:(CGRect)a5 originalImage:(CGRect)a6
{
  uint64_t v82 = *MEMORY[0x1E4F143B8];
  CGFloat x = a5.origin.x;
  CGFloat y = a5.origin.y;
  CGFloat height = a5.size.height;
  double width = a5.size.width;
  v6 = objc_msgSend(a1, "_getNormalizedFaceRects:userInfo:originalImage:visibleFrame:", a3, a4, a6.origin.x, a6.origin.y, a6.size.width, a6.size.height, a5.origin.x, a5.origin.y, a5.size.width, a5.size.height);
  if ((unint64_t)[v6 count] < 2)
  {
    if ([v6 count] == 1)
    {
      v55 = [v6 firstObject];
      if (v55)
      {
        v56 = [v6 firstObject];
        [v56 CGRectValue];
        CGFloat v16 = v57;
        CGFloat v15 = v58;
        CGFloat v14 = v59;
        CGFloat v13 = v60;
      }
      else
      {
        CGFloat v16 = *MEMORY[0x1E4F1DB20];
        CGFloat v15 = *(double *)(MEMORY[0x1E4F1DB20] + 8);
        CGFloat v14 = *(double *)(MEMORY[0x1E4F1DB20] + 16);
        CGFloat v13 = *(double *)(MEMORY[0x1E4F1DB20] + 24);
      }
    }
    else
    {
      CGFloat v16 = *MEMORY[0x1E4F1DB20];
      CGFloat v15 = *(double *)(MEMORY[0x1E4F1DB20] + 8);
      CGFloat v14 = *(double *)(MEMORY[0x1E4F1DB20] + 16);
      CGFloat v13 = *(double *)(MEMORY[0x1E4F1DB20] + 24);
    }
  }
  else
  {
    double v7 = *MEMORY[0x1E4F1DB20];
    double v8 = *(double *)(MEMORY[0x1E4F1DB20] + 8);
    double v9 = *(double *)(MEMORY[0x1E4F1DB20] + 16);
    double v10 = *(double *)(MEMORY[0x1E4F1DB20] + 24);
    long long v78 = 0u;
    long long v79 = 0u;
    long long v76 = 0u;
    long long v77 = 0u;
    id v11 = v6;
    uint64_t v12 = [v11 countByEnumeratingWithState:&v76 objects:v81 count:16];
    CGFloat v13 = v10;
    CGFloat v14 = v9;
    CGFloat v15 = v8;
    CGFloat v16 = v7;
    if (v12)
    {
      uint64_t v17 = v12;
      uint64_t v18 = *(void *)v77;
      CGFloat v13 = v10;
      CGFloat v14 = v9;
      CGFloat v15 = v8;
      CGFloat v16 = v7;
      do
      {
        for (uint64_t i = 0; i != v17; ++i)
        {
          if (*(void *)v77 != v18) {
            objc_enumerationMutation(v11);
          }
          [*(id *)(*((void *)&v76 + 1) + 8 * i) CGRectValue];
          v88.origin.CGFloat x = v20;
          v88.origin.CGFloat y = v21;
          v88.size.double width = v22;
          v88.size.CGFloat height = v23;
          v83.origin.CGFloat x = v16;
          v83.origin.CGFloat y = v15;
          v83.size.double width = v14;
          v83.size.CGFloat height = v13;
          CGRect v84 = CGRectUnion(v83, v88);
          CGFloat v16 = v84.origin.x;
          CGFloat v15 = v84.origin.y;
          CGFloat v14 = v84.size.width;
          CGFloat v13 = v84.size.height;
        }
        uint64_t v17 = [v11 countByEnumeratingWithState:&v76 objects:v81 count:16];
      }
      while (v17);
    }
    double v67 = v7;

    PXRectDenormalize();
    if (v24 > width)
    {
      CGFloat v25 = [v11 sortedArrayUsingComparator:&__block_literal_global];
      v26 = objc_msgSend(v25, "objectAtIndexedSubscript:", objc_msgSend(v25, "count") - 1);
      [v26 CGRectValue];
      double v65 = v27;
      double v29 = v28;
      double v31 = v30;
      double v33 = v32;

      long long v34 = objc_msgSend(v25, "objectAtIndexedSubscript:", objc_msgSend(v25, "count") - 2);
      [v34 CGRectValue];
      double v36 = v35;
      double v38 = v37;

      if (v31 * v33 >= v36 * v38 * 1.1)
      {
        CGFloat v13 = v33;
        double v9 = v31;
        double v8 = v29;
        CGFloat v16 = v65;
      }
      else
      {
        double v66 = v10;
        v85.origin.CGFloat x = x;
        v85.origin.CGFloat y = y;
        v85.size.CGFloat height = height;
        v85.size.double width = width;
        double MidY = CGRectGetMidY(v85);
        long long v72 = 0u;
        long long v73 = 0u;
        long long v74 = 0u;
        long long v75 = 0u;
        id v40 = v11;
        uint64_t v41 = [v40 countByEnumeratingWithState:&v72 objects:v80 count:16];
        if (v41)
        {
          uint64_t v42 = v41;
          uint64_t v43 = *(void *)v73;
          double v44 = 1.79769313e308;
          do
          {
            for (uint64_t j = 0; j != v42; ++j)
            {
              if (*(void *)v73 != v43) {
                objc_enumerationMutation(v40);
              }
              objc_msgSend(*(id *)(*((void *)&v72 + 1) + 8 * j), "CGRectValue", *(void *)&v66);
              double v47 = v46;
              double v49 = v48;
              double v51 = v50;
              double v53 = v52;
              PXRectDenormalize();
              double v54 = vabdd_f64(MidY, CGRectGetMidY(v86));
              if (v54 < v44)
              {
                double v66 = v53;
                double v67 = v47;
                double v9 = v51;
                double v8 = v49;
                double v44 = v54;
              }
            }
            uint64_t v42 = [v40 countByEnumeratingWithState:&v72 objects:v80 count:16];
          }
          while (v42);
        }

        CGFloat v13 = v66;
        CGFloat v16 = v67;
      }

      CGFloat v14 = v9;
      CGFloat v15 = v8;
    }
  }

  double v61 = v16;
  double v62 = v15;
  double v63 = v14;
  double v64 = v13;
  result.size.CGFloat height = v64;
  result.size.double width = v63;
  result.origin.CGFloat y = v62;
  result.origin.CGFloat x = v61;
  return result;
}

uint64_t __98__PUWallpaperPosterFaceCropUtilities__getBoundingFaceRectFor_userInfo_visibleFrame_originalImage___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  [a2 CGRectValue];
  double v6 = v5;
  double v8 = v7;
  [v4 CGRectValue];
  double v10 = v9;
  double v12 = v11;

  if (v6 * v8 < v10 * v12) {
    return -1;
  }
  else {
    return v6 * v8 > v10 * v12;
  }
}

+ (uint64_t)_getBestCropForVisibleFrame:(double)a3 preferredCropCrect:(double)a4 acceptableCropRect:(double)a5 faceRect:(double)a6
{
  objc_msgSend(MEMORY[0x1E4F8CBF8], "bestCropRectV2ForAspectRatio:withFocusRegion:sourcePixelWidth:sourcePixelHeight:sourcePreferredCropRectNormalized:sourceAcceptableCropRectNormalized:sourceFaceAreaRectNormalized:outputCropScore:", (unint64_t)a3, (unint64_t)a4, 0, 1.0, *MEMORY[0x1E4F1DB20], *(double *)(MEMORY[0x1E4F1DB20] + 8), *(double *)(MEMORY[0x1E4F1DB20] + 16), *(double *)(MEMORY[0x1E4F1DB20] + 24), *(void *)&a5, *(void *)&a6, *(void *)&a7, *(void *)&a8, a17, a18, a19, a20,
    a21,
    a22);
  return PXRectDenormalize();
}

+ (double)_getNormalizedRectForSaliencyRect:(double)a3 originalImage:(double)a4 visibleFrame:(double)a5
{
  double v16 = *MEMORY[0x1E4F1DB20];
  if (!CGRectEqualToRect(*(CGRect *)&a1, *MEMORY[0x1E4F1DB20]))
  {
    PXRectDenormalize();
    v20.origin.CGFloat x = a9;
    v20.origin.CGFloat y = a10;
    v20.size.double width = a11;
    v20.size.CGFloat height = a12;
    CGRectIntersection(v19, v20);
    PXRectNormalize();
    return v17;
  }
  return v16;
}

+ (CGRect)getSquareCropForVisibleFrame:(CGRect)a3 layerStack:(id)a4 userInfo:(id)a5 originalImage:(CGRect)a6
{
  double height = a6.size.height;
  double width = a6.size.width;
  double y = a6.origin.y;
  double x = a6.origin.x;
  double v11 = a3.size.height;
  double v12 = a3.size.width;
  double v13 = a3.origin.y;
  double v14 = a3.origin.x;
  uint64_t v71 = *MEMORY[0x1E4F143B8];
  id v16 = a5;
  double v65 = width;
  double v66 = height;
  objc_msgSend(a1, "_getBoundingFaceRectFor:userInfo:visibleFrame:originalImage:", a4, v16, v14, v13, v12, v11, x, y, width, height);
  uint64_t v63 = v18;
  uint64_t v64 = v17;
  double v61 = v19;
  double v62 = v20;
  uint64_t v21 = MEMORY[0x1E4F8A248];
  memset(&rect, 0, sizeof(rect));
  CGFloat v22 = [v16 objectForKeyedSubscript:@"regions"];
  CGFloat v23 = [v22 objectForKeyedSubscript:@"acceptable"];

  CFDictionaryRef v24 = v23;
  uint64_t v25 = MEMORY[0x1E4F1DB20];
  if (v24 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    BOOL v26 = CGRectMakeWithDictionaryRepresentation(v24, &rect);

    if (v26) {
      goto LABEL_9;
    }
  }
  else
  {
  }
  CGSize v27 = *(CGSize *)(v25 + 16);
  rect.origin = *(CGPoint *)v25;
  rect.size = v27;
  double v28 = PLWallpaperGetLog();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
  {
    LODWORD(buf.origin.x) = 138412290;
    *(void *)((char *)&buf.origin.x + 4) = v24;
    _os_log_impl(&dword_1AE9F8000, v28, OS_LOG_TYPE_ERROR, "Expected a rect value: %@", (uint8_t *)&buf, 0xCu);
  }

LABEL_9:
  double v29 = *(double *)(v21 + 8);
  double v30 = *(double *)(v21 + 24);
  objc_msgSend(a1, "_getNormalizedRectForSaliencyRect:originalImage:visibleFrame:", rect.origin.x, rect.origin.y, rect.size.width, rect.size.height, x, y, v65, v66, *(void *)&v14, *(void *)&v13, *(void *)&v12, *(void *)&v11);
  uint64_t v59 = v32;
  uint64_t v60 = v31;
  uint64_t v57 = v34;
  uint64_t v58 = v33;
  memset(&buf, 0, sizeof(buf));
  double v35 = [v16 objectForKeyedSubscript:@"regions"];
  double v36 = [v35 objectForKeyedSubscript:@"preferred"];

  CFDictionaryRef v37 = v36;
  if (v37 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    BOOL v38 = CGRectMakeWithDictionaryRepresentation(v37, &buf);

    if (v38) {
      goto LABEL_17;
    }
  }
  else
  {
  }
  CGSize v39 = *(CGSize *)(v25 + 16);
  buf.origin = *(CGPoint *)v25;
  buf.size = v39;
  id v40 = PLWallpaperGetLog();
  if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)v68 = 138412290;
    CFDictionaryRef v69 = v37;
    _os_log_impl(&dword_1AE9F8000, v40, OS_LOG_TYPE_ERROR, "Expected a rect value: %@", v68, 0xCu);
  }

LABEL_17:
  objc_msgSend(a1, "_getNormalizedRectForSaliencyRect:originalImage:visibleFrame:", buf.origin.x, buf.origin.y, *(_OWORD *)&buf.size, x, y, v65, v66, *(void *)&v14, *(void *)&v13, *(void *)&v12, *(void *)&v11);
  objc_msgSend(a1, "_getBestCropForVisibleFrame:preferredCropCrect:acceptableCropRect:faceRect:", v14, v13, v12, v11, v41, v42, v43, v44, v60, v59, v58, v57, v64, v29 + v30 - (v61 + v62), v63, *(void *)&v62);
  double v46 = v45;
  double v48 = v47;
  double v50 = v49;
  double v52 = v51;

  double v53 = v46;
  double v54 = v48;
  double v55 = v50;
  double v56 = v52;
  result.size.double height = v56;
  result.size.double width = v55;
  result.origin.double y = v54;
  result.origin.double x = v53;
  return result;
}

@end