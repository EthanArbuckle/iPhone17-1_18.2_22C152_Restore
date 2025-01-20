@interface PECleanupSegmentAnalyzer
- (BOOL)_strokeAppearsToBeClosedShape:(id)a3 imageToScreenSpaceScale:(double)a4 lassoDistance:(double)a5;
- (BOOL)cachedStrokeMaskFilled;
- (BOOL)shouldChooseSegment:(id)a3;
- (CGRect)scaleRect:(CGRect)a3 scaleFactor:(double)a4;
- (CGSize)cachedStrokeMaskSize;
- (CIImage)cachedStrokeMask;
- (NUBrushStroke)cachedBrushStroke;
- (OS_dispatch_queue)analyzerQueue;
- (PECleanupSegmentAnalyzer)init;
- (id)_brushStrokeToNormalizedSampledPointArray:(id)a3 maxPointCount:(int64_t)a4 originalImageSize:(CGSize)a5;
- (id)_evenlySampleArray:(id)a3 maxCount:(int64_t)a4;
- (id)_filledRegionOfFilledStrokeImage:(id)a3 withUnfilledStrokeImage:(id)a4;
- (id)_maskForStroke:(id)a3 imageSize:(CGSize)a4 maskSize:(CGSize)a5 filled:(BOOL)a6;
- (id)_strokeToNormalizedSampledPointArray:(id)a3 maxPointCount:(int64_t)a4 originalImageSize:(CGSize)a5 treatStrokeAsFilledCircle:(BOOL)a6;
- (void)_analyzeSegmentationResult:(id)a3 forStroke:(id)a4 treatStrokeAsFilledCircle:(BOOL)a5 maskContext:(id)a6 compositionController:(id)a7 geometry:(id)a8 usingTargetPoints:(BOOL)a9 userSettings:(id)a10 completion:(id)a11;
- (void)_analyzeStrokeMaskIntersections:(id)a3 treatStrokeAsFilledCircle:(BOOL)a4 usingMaskContext:(id)a5 useTargetPoints:(BOOL)a6 compositionController:(id)a7 geometry:(id)a8 userSettings:(id)a9 completion:(id)a10;
- (void)analyzeStrokeMaskIntersections:(id)a3 inpaintMaskContext:(id)a4 compositionController:(id)a5 geometry:(id)a6 imageToScreenSpaceScale:(double)a7 userSettings:(id)a8 faceRects:(id)a9 completion:(id)a10;
- (void)hitTestSegmentation:(CGPoint)a3 radius:(double)a4 inpaintMaskContext:(id)a5 compositionController:(id)a6 geometry:(id)a7 completion:(id)a8;
- (void)setAnalyzerQueue:(id)a3;
- (void)setCachedBrushStroke:(id)a3;
- (void)setCachedStrokeMask:(id)a3;
- (void)setCachedStrokeMaskFilled:(BOOL)a3;
- (void)setCachedStrokeMaskSize:(CGSize)a3;
@end

@implementation PECleanupSegmentAnalyzer

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedStrokeMask, 0);
  objc_storeStrong((id *)&self->_cachedBrushStroke, 0);
  objc_storeStrong((id *)&self->_analyzerQueue, 0);
}

- (void)setCachedStrokeMaskFilled:(BOOL)a3
{
  self->_cachedStrokeMaskFilled = a3;
}

- (BOOL)cachedStrokeMaskFilled
{
  return self->_cachedStrokeMaskFilled;
}

- (void)setCachedStrokeMaskSize:(CGSize)a3
{
  self->_cachedStrokeMaskSize = a3;
}

- (CGSize)cachedStrokeMaskSize
{
  double width = self->_cachedStrokeMaskSize.width;
  double height = self->_cachedStrokeMaskSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setCachedStrokeMask:(id)a3
{
}

- (CIImage)cachedStrokeMask
{
  return self->_cachedStrokeMask;
}

- (void)setCachedBrushStroke:(id)a3
{
}

- (NUBrushStroke)cachedBrushStroke
{
  return self->_cachedBrushStroke;
}

- (void)setAnalyzerQueue:(id)a3
{
}

- (OS_dispatch_queue)analyzerQueue
{
  return self->_analyzerQueue;
}

- (void)hitTestSegmentation:(CGPoint)a3 radius:(double)a4 inpaintMaskContext:(id)a5 compositionController:(id)a6 geometry:(id)a7 completion:(id)a8
{
  double y = a3.y;
  double x = a3.x;
  uint64_t v114 = *MEMORY[0x263EF8340];
  id v15 = a5;
  id v16 = a6;
  id v92 = a7;
  id v17 = a8;
  if (!v15)
  {
    v85 = PLPhotoEditGetLog();
    if (os_log_type_enabled(v85, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_217B65000, v85, OS_LOG_TYPE_ERROR, "Cleanup: No mask context provided", buf, 2u);
    }

    (*((void (**)(id, void, void))v17 + 2))(v17, 0, 0);
    goto LABEL_52;
  }
  v18 = [v15 segmentationResult];
  id v19 = objc_alloc(MEMORY[0x263F58650]);
  *(float *)&double v20 = a4;
  memset(v110, 0, sizeof(v110));
  LODWORD(v21) = 1.0;
  v22 = (void *)[v19 initWithRadius:v110 softness:0 opacity:v20 clipRect:COERCE_DOUBLE(1045220557) pressureMode:v21];
  *(float *)&double v23 = x;
  *(float *)&double v24 = y;
  v93 = v22;
  objc_msgSend(v22, "appendPoint:", v23, v24, 0.0);
  id v91 = objc_alloc_init(MEMORY[0x263EFF980]);
  v25 = [v18 backgroundInstances];
  v26 = PLPhotoEditGetLog();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
  {
    v27 = [v18 backgroundInstances];
    uint64_t v28 = [v27 count];
    v29 = [v18 foregroundInstances];
    uint64_t v30 = [v29 count];
    *(_DWORD *)buf = 134218240;
    *(void *)&buf[4] = v28;
    *(_WORD *)&buf[12] = 2048;
    *(void *)&buf[14] = v30;
    _os_log_impl(&dword_217B65000, v26, OS_LOG_TYPE_DEBUG, "Cleanup: Attempting hit test; retrieved %lu background instances, %lu foreground instances",
      buf,
      0x16u);
  }
  uint64_t v31 = [v25 count];
  v32 = (void *)MEMORY[0x263F5D5F8];
  v33 = [v16 composition];
  v34 = [v32 removeOperationsFromInstances:v25 composition:v33 context:v15];

  v35 = [MEMORY[0x263F5D5F8] removeGatedInstances:v34 context:v15];

  v94 = v35;
  if (v31 != [v35 count])
  {
    v36 = PLPhotoEditGetLog();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v37 = [v94 count];
      *(_DWORD *)buf = 134217984;
      *(void *)&buf[4] = v31 - v37;
      _os_log_impl(&dword_217B65000, v36, OS_LOG_TYPE_DEBUG, "Cleanup: %ld indices were removed from testing because those objects had previously been removed from the image", buf, 0xCu);
    }
  }
  id v89 = v15;
  id v90 = v17;
  id v88 = v16;
  uint64_t v38 = [v94 firstIndex];
  v39 = v92;
  v40 = v93;
  if (v38 == 0x7FFFFFFFFFFFFFFFLL)
  {
LABEL_31:
    v70 = objc_alloc_init(MEMORY[0x263F089C8]);
    long long v95 = 0u;
    long long v96 = 0u;
    long long v97 = 0u;
    long long v98 = 0u;
    id v71 = v91;
    uint64_t v72 = [v71 countByEnumeratingWithState:&v95 objects:v111 count:16];
    if (v72)
    {
      uint64_t v73 = v72;
      v74 = 0;
      uint64_t v75 = *(void *)v96;
      double v76 = 0.0;
      do
      {
        for (uint64_t i = 0; i != v73; ++i)
        {
          if (*(void *)v96 != v75) {
            objc_enumerationMutation(v71);
          }
          v78 = *(void **)(*((void *)&v95 + 1) + 8 * i);
          v79 = [v78 mask];
          v80 = [v78 intersector];
          [v80 brushPercentInsideMask];
          double v82 = v81;

          if (v82 > v76)
          {
            id v83 = v79;

            [v70 removeAllIndexes];
            -[NSObject addIndex:](v70, "addIndex:", [v78 segmentIndex]);
            v74 = v83;
            double v76 = v82;
          }
        }
        uint64_t v73 = [v71 countByEnumeratingWithState:&v95 objects:v111 count:16];
      }
      while (v73);

      if (v74)
      {
        v84 = PLPhotoEditGetLog();
        id v16 = v88;
        id v15 = v89;
        id v17 = v90;
        if (os_log_type_enabled(v84, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_217B65000, v84, OS_LOG_TYPE_DEFAULT, "Cleanup: Successfully chose a mask", buf, 2u);
        }
LABEL_50:

        id v87 = [v70 copy];
        (*((void (**)(id, void *, id))v17 + 2))(v17, v74, v87);

        goto LABEL_51;
      }
    }
    else
    {
    }
    v86 = PLPhotoEditGetLog();
    id v16 = v88;
    id v15 = v89;
    id v17 = v90;
    if (os_log_type_enabled(v86, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_217B65000, v86, OS_LOG_TYPE_DEBUG, "Cleanup: No segments sufficiently intersected the stroke", buf, 2u);
    }

    v74 = 0;
    v84 = v70;
    v70 = 0;
    goto LABEL_50;
  }
  uint64_t v41 = v38;
  long long v42 = 0uLL;
  while (1)
  {
    *(_OWORD *)buf = v42;
    *(_OWORD *)&buf[16] = v42;
    if (v18)
    {
      [v18 tightBoundsForInstance:v41];
      long long v108 = 0u;
      long long v109 = 0u;
      [v18 fullExtentForInstance:v41];
    }
    else
    {
      long long v108 = v42;
      long long v109 = v42;
    }
    [v39 inputRect];
    NUScaleMake();
    NUScaleToDouble();
    if (v40)
    {
      [v40 extent];
    }
    else
    {
      long long v106 = 0u;
      long long v107 = 0u;
    }
    NUPixelRectToCGRect();
    -[PECleanupSegmentAnalyzer scaleRect:scaleFactor:](self, "scaleRect:scaleFactor:");
    long long v104 = 0u;
    long long v105 = 0u;
    NUPixelRectFromCGRect();
    long long v102 = 0u;
    long long v103 = 0u;
    long long v100 = v104;
    long long v101 = v105;
    *(_OWORD *)v112 = *(_OWORD *)buf;
    *(_OWORD *)&v112[16] = *(_OWORD *)&buf[16];
    NUPixelRectIntersection();
    long long v100 = v102;
    long long v101 = v103;
    if (!NUPixelRectIsEmpty()) {
      break;
    }
    uint64_t v41 = [v94 indexGreaterThanIndex:v41];
LABEL_30:
    long long v42 = 0uLL;
    if (v41 == 0x7FFFFFFFFFFFFFFFLL) {
      goto LABEL_31;
    }
  }
  id v99 = 0;
  v43 = (void *)[v18 newMaskForInstance:v41 error:&v99];
  id v44 = v99;
  long long v100 = 0u;
  long long v101 = 0u;
  if (v18) {
    [v18 tightBoundsForInstance:v41];
  }
  v45 = [MEMORY[0x263F5D5F8] maskIdentifierForSegmentIndex:v41];
  [v39 inputRect];
  [v43 size];
  uint64_t v46 = NUScaleMake();
  uint64_t v48 = v47;
  id v49 = objc_alloc(MEMORY[0x263F5D5E0]);
  *(_OWORD *)v112 = v100;
  *(_OWORD *)&v112[16] = v101;
  v50 = objc_msgSend(v49, "initWithBuffer:identifier:extent:scale:", v43, v45, v112, v46, v48);
  if (v44)
  {
    v51 = PLPhotoEditGetLog();
    if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)v112 = 134218242;
      *(void *)&v112[4] = v41;
      *(_WORD *)&v112[12] = 2112;
      *(void *)&v112[14] = v44;
      _os_log_impl(&dword_217B65000, v51, OS_LOG_TYPE_ERROR, "Cleanup: Error retrieving mask instance %lu: %@", v112, 0x16u);
    }

    goto LABEL_30;
  }
  [v39 inputRect];
  double v53 = v52;
  double v55 = v54;
  [v43 size];
  NUPixelSizeToCGSize();
  v58 = -[PECleanupSegmentAnalyzer _maskForStroke:imageSize:maskSize:filled:](self, "_maskForStroke:imageSize:maskSize:filled:", v40, 0, v53, v55, v56, v57);
  v59 = PLPhotoEditGetLog();
  v60 = v59;
  if (v58)
  {
    if (os_log_type_enabled(v59, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v61 = [v43 size];
      [v43 size];
      *(_DWORD *)v112 = 134218496;
      *(void *)&v112[4] = v41;
      *(_WORD *)&v112[12] = 2048;
      *(void *)&v112[14] = v61;
      *(_WORD *)&v112[22] = 2048;
      *(void *)&v112[24] = v62;
      _os_log_impl(&dword_217B65000, v60, OS_LOG_TYPE_DEBUG, "Cleanup: mask instance %lu has size %lu x %lu", v112, 0x20u);
    }

    id v63 = objc_alloc(MEMORY[0x263F585E8]);
    v64 = objc_msgSend(v63, "initWithBrushMask:mask:strokeScale:", v58, v43, *MEMORY[0x263F585E0], *(void *)(MEMORY[0x263F585E0] + 8));
    v65 = PLPhotoEditGetLog();
    if (os_log_type_enabled(v65, OS_LOG_TYPE_DEBUG))
    {
      [v64 brushPercentInsideMask];
      int v67 = (int)(v66 * 100.0);
      [v64 maskPercentInsideBrush];
      *(_DWORD *)v112 = 67109632;
      *(_DWORD *)&v112[4] = v67;
      v39 = v92;
      *(_WORD *)&v112[8] = 2048;
      *(void *)&v112[10] = v41;
      *(_WORD *)&v112[18] = 1024;
      *(_DWORD *)&v112[20] = (int)(v68 * 100.0);
      _os_log_impl(&dword_217B65000, v65, OS_LOG_TYPE_DEBUG, "Cleanup: Stroke intersecting: %d%% / Segment %lu intersecting: %d%%", v112, 0x18u);
    }

    v69 = objc_alloc_init(_CleanupSegmentInfo);
    [(_CleanupSegmentInfo *)v69 setSegmentIndex:v41];
    [(_CleanupSegmentInfo *)v69 setIntersector:v64];
    [(_CleanupSegmentInfo *)v69 setMask:v50];
    [(_CleanupSegmentInfo *)v69 setUsingTargetPoints:0];
    [v91 addObject:v69];
    uint64_t v41 = [v94 indexGreaterThanIndex:v41];

    v40 = v93;
    goto LABEL_30;
  }
  if (os_log_type_enabled(v59, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v112 = 0;
    _os_log_impl(&dword_217B65000, v60, OS_LOG_TYPE_ERROR, "Cleanup: stroke mask creation failed", v112, 2u);
  }

  id v17 = v90;
  (*((void (**)(id, void, void))v90 + 2))(v90, 0, 0);

  id v16 = v88;
  id v15 = v89;
LABEL_51:

LABEL_52:
}

- (CGRect)scaleRect:(CGRect)a3 scaleFactor:(double)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  double MidX = CGRectGetMidX(a3);
  v15.origin.CGFloat x = x;
  v15.origin.CGFloat y = y;
  v15.size.double width = width;
  v15.size.double height = height;
  CGFloat v10 = CGRectGetMidY(v15) * a4;
  double v11 = width * a4;
  double v12 = height * a4;
  double v13 = MidX * a4 - width * a4 * 0.5;
  double v14 = v10 - height * a4 * 0.5;
  result.size.double height = v12;
  result.size.double width = v11;
  result.origin.CGFloat y = v14;
  result.origin.CGFloat x = v13;
  return result;
}

- (BOOL)_strokeAppearsToBeClosedShape:(id)a3 imageToScreenSpaceScale:(double)a4 lassoDistance:(double)a5
{
  uint64_t v286 = *MEMORY[0x263EF8340];
  id v7 = a3;
  if ([v7 pointCount] <= 5)
  {
    v8 = PLPhotoEditGetLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134217984;
      *(void *)&buf[4] = [v7 pointCount];
      _os_log_impl(&dword_217B65000, v8, OS_LOG_TYPE_DEBUG, "Cleanup: strokeAppearsToBeClosedShape - rejected for having only %ld points", buf, 0xCu);
    }
    BOOL v9 = 0;
    goto LABEL_186;
  }
  double v257 = a5;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __96__PECleanupSegmentAnalyzer__strokeAppearsToBeClosedShape_imageToScreenSpaceScale_lassoDistance___block_invoke_2;
  aBlock[3] = &unk_2642BE998;
  v268 = &__block_literal_global_710;
  CGFloat v10 = (double (**)(void, float, float, float, float, float, float))_Block_copy(aBlock);
  v265[0] = MEMORY[0x263EF8330];
  v265[1] = 3221225472;
  v265[2] = __96__PECleanupSegmentAnalyzer__strokeAppearsToBeClosedShape_imageToScreenSpaceScale_lassoDistance___block_invoke_4;
  v265[3] = &unk_2642BE9E0;
  id v266 = &__block_literal_global_72;
  v253 = (void (**)(void *, id, void *, double))_Block_copy(v265);
  uint64_t v11 = [v7 pointCount];
  double v12 = (void *)[objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:v11 - 1];
  [v7 pointAtIndex:0];
  double v16 = 0.0;
  if (v11 >= 2)
  {
    float v17 = v13;
    float v18 = v14;
    float v19 = v15;
    uint64_t v20 = 1;
    do
    {
      [v7 pointAtIndex:v20];
      float v22 = v21;
      float v24 = v23;
      float v26 = v25;
      double v16 = v16 + v10[2](v10, v17, v18, v19, v21, v23, v25);
      v27 = objc_msgSend(NSNumber, "numberWithDouble:");
      [v12 setObject:v27 atIndexedSubscript:v20 - 1];

      ++v20;
      float v17 = v22;
      float v18 = v24;
      float v19 = v26;
    }
    while (v11 != v20);
  }
  if ([v12 count])
  {
    uint64_t v28 = 0;
    while (1)
    {
      v29 = [v12 objectAtIndexedSubscript:v28];
      [v29 doubleValue];
      double v31 = v30;

      if (v31 >= v16 / 10.0) {
        break;
      }
      if (++v28 >= (unint64_t)[v12 count]) {
        goto LABEL_17;
      }
    }
    v32 = v253[2](v253, v7, v12, v16 / 10.0);

    uint64_t v11 = [v32 pointCount];
    v33 = (void *)[objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:v11 - 1];

    [v32 pointAtIndex:0];
    double v16 = 0.0;
    if (v11 >= 2)
    {
      float v37 = v34;
      float v38 = v35;
      float v39 = v36;
      uint64_t v40 = 1;
      do
      {
        [v32 pointAtIndex:v40];
        float v42 = v41;
        float v44 = v43;
        float v46 = v45;
        double v16 = v16 + v10[2](v10, v37, v38, v39, v41, v43, v45);
        uint64_t v47 = objc_msgSend(NSNumber, "numberWithDouble:");
        [v33 setObject:v47 atIndexedSubscript:v40 - 1];

        ++v40;
        float v37 = v42;
        float v38 = v44;
        float v39 = v46;
      }
      while (v11 != v40);
    }
    double v12 = v33;
    id v7 = v32;
  }
LABEL_17:
  [v7 pointAtIndex:0];
  double v50 = v48;
  double v51 = v49;
  uint64_t v52 = v11 - 2;
  if (v11 < 2)
  {
    double v55 = v49;
    double v54 = v48;
  }
  else
  {
    uint64_t v53 = 1;
    double v54 = v48;
    double v55 = v49;
    do
    {
      [v7 pointAtIndex:v53];
      double v58 = v57;
      if (v50 > v58) {
        double v50 = v58;
      }
      if (v54 < v58) {
        double v54 = v58;
      }
      if (v51 > v56) {
        double v51 = v56;
      }
      if (v55 < v56) {
        double v55 = v56;
      }
      ++v53;
    }
    while (v11 != v53);
  }
  double v59 = (v55 - v51) * (v55 - v51) + (v54 - v50) * (v54 - v50);
  v60 = +[PEGlobalSettings globalSettings];
  [v60 cleanupLassoHeadTailFraction];
  double v62 = v61;

  id v63 = +[PEGlobalSettings globalSettings];
  [v63 cleanupLassoHeadTailMaxLength];
  double v65 = v64 / a4;

  if (v16 * v62 >= v65) {
    double v66 = v65;
  }
  else {
    double v66 = v16 * v62;
  }
  double v67 = 0.0;
  if (v11 >= 4)
  {
    uint64_t v68 = 0;
    double v69 = 0.0;
    while (1)
    {
      v70 = [v12 objectAtIndexedSubscript:v68];
      [v70 doubleValue];
      double v69 = v69 + v71;

      ++v68;
      if (v69 >= v66) {
        break;
      }
      if (v11 - 3 == v68)
      {
        uint64_t v68 = 0;
        break;
      }
    }
  }
  else
  {
    uint64_t v68 = 0;
    double v69 = 0.0;
  }
  double v72 = sqrt(v59);
  if (v52 <= v68 + 1)
  {
LABEL_43:
    uint64_t v76 = 0;
  }
  else
  {
    double v67 = 0.0;
    uint64_t v73 = v11 - 2;
    while (1)
    {
      v74 = [v12 objectAtIndexedSubscript:v73];
      [v74 doubleValue];
      double v67 = v67 + v75;

      if (v67 >= v66) {
        break;
      }
      if (--v73 <= v68 + 1) {
        goto LABEL_43;
      }
    }
    uint64_t v76 = v11 - v73;
  }
  double v237 = v16 * a4;
  double v77 = v72 * 0.125;
  double v78 = v257 / a4;
  v79 = PLPhotoEditGetLog();
  if (os_log_type_enabled(v79, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v80 = [v7 pointCount];
    [v7 pointAtIndex:0];
    float v82 = v81;
    float v84 = v83;
    float v86 = v85;
    [v7 pointAtIndex:v11 - 1];
    double v90 = v10[2](v10, v82, v84, v86, v87, v88, v89);
    *(_DWORD *)buf = 134220800;
    *(void *)&buf[4] = v80;
    *(_WORD *)&buf[12] = 2048;
    *(double *)&buf[14] = v16;
    *(_WORD *)&buf[22] = 2048;
    *(double *)&buf[24] = v237;
    *(_WORD *)v271 = 2048;
    *(void *)&v271[2] = v68;
    *(_WORD *)&v271[10] = 2048;
    *(double *)&v271[12] = v69;
    __int16 v272 = 2048;
    double v273 = v69 / v16 * 100.0;
    __int16 v274 = 2048;
    uint64_t v275 = v76;
    __int16 v276 = 2048;
    double v277 = v67;
    __int16 v278 = 2048;
    double v279 = v67 / v16 * 100.0;
    __int16 v280 = 2048;
    double v281 = v77;
    __int16 v282 = 2048;
    double v283 = v78;
    __int16 v284 = 2048;
    double v285 = v90;
    _os_log_impl(&dword_217B65000, v79, OS_LOG_TYPE_DEBUG, "Cleanup: strokeAppearsToBeClosedShape - stroke has %ld points, length (image): %f, length (screen): %f, will be comparing the first %ld segments of length %.2f (%.2f%%) with the last %ld segments of length %.2f (%.2f%%). Looking for points closer than: %f or %f. First and last points are %f apart.", buf, 0x7Au);
  }

  if (v68 < 1 || v76 <= 0)
  {
    id v91 = PLPhotoEditGetLog();
    if (os_log_type_enabled(v91, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      id v92 = "Cleanup: strokeAppearsToBeClosedShape - something went wrong and we didn't select segments to compare";
      goto LABEL_54;
    }
LABEL_55:
    BOOL v9 = 0;
    goto LABEL_185;
  }
  if (v76 + v68 > v52)
  {
    id v91 = PLPhotoEditGetLog();
    if (os_log_type_enabled(v91, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      id v92 = "Cleanup: strokeAppearsToBeClosedShape - something went wrong and we got too many segments to compare";
LABEL_54:
      _os_log_impl(&dword_217B65000, v91, OS_LOG_TYPE_DEBUG, v92, buf, 2u);
      goto LABEL_55;
    }
    goto LABEL_55;
  }
  if (v77 >= v78) {
    double v93 = v77;
  }
  else {
    double v93 = v78;
  }
  v262[0] = MEMORY[0x263EF8330];
  v262[1] = 3221225472;
  v262[2] = __96__PECleanupSegmentAnalyzer__strokeAppearsToBeClosedShape_imageToScreenSpaceScale_lassoDistance___block_invoke_76;
  v262[3] = &unk_2642BEA08;
  v263 = &__block_literal_global_710;
  double v247 = v93 * v93;
  double v264 = v93 * v93;
  v252 = (double (**)(void *, uint8_t *, CGAffineTransform *, float, float, float, float, float, float))_Block_copy(v262);
  long long v260 = 0u;
  long long v261 = 0u;
  if (v7)
  {
    [v7 extent];
    uint64_t v94 = v261;
  }
  else
  {
    uint64_t v94 = 0;
  }
  double v95 = (double)v94;
  [v7 radius];
  if (v95 / v96 < 4.0 || ([v7 radius], (double)*((uint64_t *)&v261 + 1) / v97 < 4.0))
  {
    long long v98 = PLPhotoEditGetLog();
    if (os_log_type_enabled(v98, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134218240;
      *(void *)&buf[4] = v261;
      *(_WORD *)&buf[12] = 2048;
      *(void *)&buf[14] = *((void *)&v261 + 1);
      id v99 = "Cleanup: strokeAppearsToBeClosedShape - rejected for having too small an extent: %ld x %ld";
      goto LABEL_66;
    }
    goto LABEL_68;
  }
  uint64_t v102 = 0;
  uint64_t v248 = v76;
  uint64_t v256 = v11 - 2;
  uint64_t v258 = v11 + ~v76;
  v235 = v10;
  do
  {
    uint64_t v103 = v102 + 1;
    if (v256 >= v258)
    {
      uint64_t v104 = v11 - 2;
      do
      {
        if (v104 > v256 || v104 < 0)
        {
          v119 = PLPhotoEditGetLog();
          if (os_log_type_enabled(v119, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 134219008;
            *(void *)&buf[4] = v11;
            *(_WORD *)&buf[12] = 2048;
            *(void *)&buf[14] = v68;
            *(_WORD *)&buf[22] = 2048;
            *(void *)&buf[24] = v248;
            *(_WORD *)v271 = 2048;
            *(void *)&v271[2] = v102;
            *(_WORD *)&v271[10] = 2048;
            *(void *)&v271[12] = v104;
            _os_log_impl(&dword_217B65000, v119, OS_LOG_TYPE_ERROR, "Cleanup: index outside of stroke point array: \n\t  ptCount: %ld \n\t  compareBeginSegCount: %ld \n\t  compareEndSegCount: %ld \n\t  startSegmentCompareIndex: %ld \n\t  endSegmentCompareIndex: %ld", buf, 0x34u);
          }
        }
        else
        {
          [v7 pointAtIndex:v102];
          float v106 = v105;
          float v108 = v107;
          [v7 pointAtIndex:v102 + 1];
          float v110 = v109;
          float v112 = v111;
          [v7 pointAtIndex:v104];
          float v114 = v113;
          float v116 = v115;
          [v7 pointAtIndex:v104 + 1];
          if ((float)((float)(v114 - v106) * (float)(v118 - v108)) <= (float)((float)(v116 - v108)
                                                                             * (float)(v117 - v106)) == (float)((float)(v114 - v110) * (float)(v118 - v112)) > (float)((float)(v116 - v112) * (float)(v117 - v110))
            && (float)((float)(v110 - v106) * (float)(v116 - v108)) > (float)((float)(v112 - v108) * (float)(v114 - v106)) != (float)((float)(v110 - v106) * (float)(v118 - v108)) > (float)((float)(v112 - v108) * (float)(v117 - v106)))
          {
            v176 = PLPhotoEditGetLog();
            if (os_log_type_enabled(v176, OS_LOG_TYPE_DEBUG))
            {
              uint64_t v178 = [v7 pointCount];
              *(_DWORD *)buf = 134219008;
              *(void *)&buf[4] = v102;
              *(_WORD *)&buf[12] = 2048;
              *(void *)&buf[14] = v102 + 1;
              *(_WORD *)&buf[22] = 2048;
              *(void *)&buf[24] = v104;
              *(_WORD *)v271 = 2048;
              *(void *)&v271[2] = v104 + 1;
              *(_WORD *)&v271[10] = 2048;
              *(void *)&v271[12] = v178;
              _os_log_impl(&dword_217B65000, v176, OS_LOG_TYPE_DEBUG, "Cleanup: strokeAppearsToBeClosedShape - line segments were intersecting in segments s = {%ld, %ld} and e = {%ld, %ld}, out of %ld points", buf, 0x34u);
            }
            unint64_t v125 = 0x2642BD000uLL;
            goto LABEL_151;
          }
        }
        BOOL v120 = v104-- <= v258;
      }
      while (!v120);
    }
    ++v102;
  }
  while (v103 != v68);
  uint64_t v121 = 0;
  LOBYTE(v122) = 0;
  uint64_t v245 = -1;
  double v123 = 3.40282347e38;
  uint64_t v249 = -1;
  uint64_t v250 = -1;
  uint64_t v124 = -1;
  unint64_t v125 = 0x2642BD000;
  uint64_t v126 = v11 - 2;
  id v233 = v7;
  v234 = v12;
  do
  {
    if (v122) {
      goto LABEL_141;
    }
    uint64_t v246 = v121++;
    if (v126 < v258)
    {
      int v122 = 0;
      continue;
    }
    uint64_t v127 = v126;
    uint64_t v236 = v121;
    while (1)
    {
      if (v127 > v126 || v127 < 0)
      {
        uint64_t v161 = v124;
        v162 = PLPhotoEditGetLog();
        if (os_log_type_enabled(v162, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 134219008;
          *(void *)&buf[4] = v11;
          *(_WORD *)&buf[12] = 2048;
          *(void *)&buf[14] = v68;
          *(_WORD *)&buf[22] = 2048;
          *(void *)&buf[24] = v248;
          *(_WORD *)v271 = 2048;
          *(void *)&v271[2] = v246;
          *(_WORD *)&v271[10] = 2048;
          *(void *)&v271[12] = v127;
          _os_log_impl(&dword_217B65000, v162, OS_LOG_TYPE_ERROR, "Cleanup: index outside of stroke point array: \n\t  ptCount: %ld \n\t  compareBeginSegCount: %ld \n\t  compareEndSegCount: %ld \n\t  startSegmentCompareIndex: %ld \n\t  endSegmentCompareIndex: %ld", buf, 0x34u);
        }

        uint64_t v124 = v161;
        goto LABEL_133;
      }
      uint64_t v128 = v246;
      [v7 pointAtIndex:v246];
      float v130 = v129;
      float v240 = v131;
      float v241 = v129;
      float v132 = v131;
      float v134 = v133;
      float v242 = v133;
      [v7 pointAtIndex:v121];
      float v243 = v135;
      float v254 = v137;
      float v255 = v136;
      double v244 = v123;
      [v7 pointAtIndex:v127];
      float v239 = v138;
      float v140 = v139;
      float v142 = v141;
      objc_msgSend(v7, "pointAtIndex:");
      float v144 = v143;
      float v146 = v145;
      float v148 = v147;
      *(_DWORD *)&buf[8] = 0;
      *(void *)buf = 0;
      v269.a = 0.0;
      float v238 = v140;
      double v149 = v252[2](v252, buf, &v269, v130, v132, v134, v239, v140, v142);
      BOOL v150 = v149 < v244 && v149 < v247;
      uint64_t v151 = v250;
      if (v150) {
        uint64_t v151 = v127 + 1;
      }
      uint64_t v251 = v151;
      if (v150)
      {
        uint64_t v124 = v127;
        uint64_t v152 = v246 + 1;
      }
      else
      {
        uint64_t v152 = v249;
      }
      if (v150) {
        uint64_t v153 = v246;
      }
      else {
        uint64_t v153 = v245;
      }
      if (v150) {
        double v154 = v149;
      }
      else {
        double v154 = v244;
      }
      double v155 = v252[2](v252, buf, &v269, v243, v255, v254, v239, v140, v142);
      BOOL v156 = v155 < v247 && v155 < v154;
      if (v156) {
        LOBYTE(v150) = 1;
      }
      if (v156) {
        uint64_t v157 = v127 + 1;
      }
      else {
        uint64_t v157 = v251;
      }
      if (v156) {
        uint64_t v124 = v127;
      }
      if (v156) {
        uint64_t v158 = v246 + 1;
      }
      else {
        uint64_t v158 = v152;
      }
      uint64_t v249 = v158;
      uint64_t v250 = v157;
      if (v156)
      {
        double v159 = v155;
      }
      else
      {
        uint64_t v128 = v153;
        double v159 = v154;
      }
      double v160 = v252[2](v252, buf, &v269, v239, v238, v142, v241, v240, v242);
      if (v160 >= v247)
      {
        double v123 = v159;
        double v12 = v234;
        CGFloat v10 = v235;
      }
      else
      {
        double v123 = v159;
        double v12 = v234;
        CGFloat v10 = v235;
        if (v160 < v159)
        {
          LOBYTE(v150) = 1;
          uint64_t v124 = v127;
          uint64_t v249 = v236;
          uint64_t v250 = v127 + 1;
          uint64_t v128 = v246;
          double v123 = v160;
        }
      }
      uint64_t v245 = v128;
      double v163 = v252[2](v252, buf, &v269, v144, v146, v148, v241, v240, v242);
      uint64_t v126 = v11 - 2;
      id v7 = v233;
      if (v163 < v247 && v163 < v123)
      {
        int v122 = 1;
        uint64_t v124 = v127;
        uint64_t v121 = v236;
        uint64_t v249 = v236;
        uint64_t v250 = v127 + 1;
        uint64_t v245 = v246;
        double v123 = v163;
        goto LABEL_137;
      }
      if (v150) {
        break;
      }
      uint64_t v121 = v236;
LABEL_133:
      BOOL v120 = v127-- <= v258;
      if (v120)
      {
        int v122 = 0;
LABEL_137:
        unint64_t v125 = 0x2642BD000;
        goto LABEL_139;
      }
    }
    int v122 = 1;
    unint64_t v125 = 0x2642BD000uLL;
    uint64_t v121 = v236;
LABEL_139:
    ;
  }
  while (v121 != v68);
  if (v122)
  {
LABEL_141:
    uint64_t v164 = v124;
    v165 = PLPhotoEditGetLog();
    if (os_log_type_enabled(v165, OS_LOG_TYPE_DEBUG))
    {
      double v166 = COERCE_DOUBLE([v7 pointCount]);
      *(_DWORD *)buf = 134219264;
      *(void *)&buf[4] = sqrt(v123);
      *(_WORD *)&buf[12] = 2048;
      *(void *)&buf[14] = v245;
      *(_WORD *)&buf[22] = 2048;
      *(void *)&buf[24] = v249;
      *(_WORD *)v271 = 2048;
      *(void *)&v271[2] = v164;
      *(_WORD *)&v271[10] = 2048;
      *(void *)&v271[12] = v250;
      __int16 v272 = 2048;
      double v273 = v166;
      _os_log_impl(&dword_217B65000, v165, OS_LOG_TYPE_DEBUG, "Cleanup: strokeAppearsToBeClosedShape - points and line segments from start and end of stroke found to be close enough (%.2f) at segments s = {%ld, %ld} and e = {%ld, %ld}, out of %ld points", buf, 0x3Eu);
    }

    v167 = [*(id *)(v125 + 2264) globalSettings];
    [v167 cleanupShortStrokeLengthThreshold];
    double v169 = v168;

    if (v237 < v169)
    {
      double v170 = PEExteriorAngleSum(v7) * 57.2957795;
      v171 = [*(id *)(v125 + 2264) globalSettings];
      [v171 cleanupShortStrokeAngleThreshold];
      if (v170 >= v172)
      {
      }
      else
      {
        v173 = [*(id *)(v125 + 2264) globalSettings];
        [v173 cleanupShortStrokeAngleThreshold];
        double v175 = -v174;

        if (v170 > v175)
        {
          long long v98 = PLPhotoEditGetLog();
          if (os_log_type_enabled(v98, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 134218240;
            *(double *)&buf[4] = v237;
            *(_WORD *)&buf[12] = 2048;
            *(double *)&buf[14] = v170;
            id v99 = "Cleanup: strokeAppearsToBeClosedShape stroke is short (%.2f) and isn't enough of a circle (%.2f)";
LABEL_66:
            long long v100 = v98;
            uint32_t v101 = 22;
LABEL_67:
            _os_log_impl(&dword_217B65000, v100, OS_LOG_TYPE_DEBUG, v99, buf, v101);
          }
          goto LABEL_68;
        }
      }
      v176 = PLPhotoEditGetLog();
      if (os_log_type_enabled(v176, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 134218240;
        *(double *)&buf[4] = v237;
        *(_WORD *)&buf[12] = 2048;
        *(double *)&buf[14] = v170;
        _os_log_impl(&dword_217B65000, v176, OS_LOG_TYPE_DEBUG, "Cleanup: strokeAppearsToBeClosedShape stroke is short (%.2f) but it's enough of a circle (%.2f)", buf, 0x16u);
      }
LABEL_151:
    }
    Mutable = CGPathCreateMutable();
    if ([v7 pointCount] >= 1)
    {
      uint64_t v180 = 0;
      do
      {
        [v7 pointAtIndex:v180];
        double v182 = v181;
        double v184 = v183;
        if (v180) {
          CGPathAddLineToPoint(Mutable, 0, v182, v184);
        }
        else {
          CGPathMoveToPoint(Mutable, 0, v182, v184);
        }
        ++v180;
      }
      while (v180 < [v7 pointCount]);
    }
    CGPathCloseSubpath(Mutable);
    PathBoundingBoCGFloat x = CGPathGetPathBoundingBox(Mutable);
    double v185 = PathBoundingBox.origin.x + PathBoundingBox.size.width * 0.5;
    *(_OWORD *)v271 = 0u;
    double v186 = PathBoundingBox.origin.y + PathBoundingBox.size.height * 0.5;
    memset(buf, 0, sizeof(buf));
    CGAffineTransformMakeTranslation((CGAffineTransform *)buf, v185, v186);
    *(_OWORD *)&v259.a = *(_OWORD *)buf;
    *(_OWORD *)&v259.c = *(_OWORD *)&buf[16];
    *(_OWORD *)&v259.tCGFloat x = *(_OWORD *)v271;
    CGAffineTransformScale(&v269, &v259, 1.05, 1.05);
    *(_OWORD *)&buf[16] = *(_OWORD *)&v269.c;
    *(_OWORD *)v271 = *(_OWORD *)&v269.tx;
    *(_OWORD *)buf = *(_OWORD *)&v269.a;
    CGAffineTransform v259 = v269;
    CGAffineTransformTranslate(&v269, &v259, -v185, -v186);
    *(_OWORD *)buf = *(_OWORD *)&v269.a;
    *(_OWORD *)&buf[16] = *(_OWORD *)&v269.c;
    *(_OWORD *)v271 = *(_OWORD *)&v269.tx;
    v187 = PLPhotoEditGetLog();
    if (os_log_type_enabled(v187, OS_LOG_TYPE_DEBUG))
    {
      LODWORD(v269.a) = 134218240;
      *(double *)((char *)&v269.a + 4) = v185;
      WORD2(v269.b) = 2048;
      *(double *)((char *)&v269.b + 6) = v186;
      _os_log_impl(&dword_217B65000, v187, OS_LOG_TYPE_DEBUG, "Cleanup: Centerpoint: %f, %f", (uint8_t *)&v269, 0x16u);
    }

    if ([v7 pointCount] < 1)
    {
      uint64_t v189 = 0;
    }
    else
    {
      uint64_t v188 = 0;
      uint64_t v189 = 0;
      do
      {
        [v7 pointAtIndex:v188];
        v287.CGFloat x = v190;
        v287.CGFloat y = v191;
        v189 += CGPathContainsPoint(Mutable, (const CGAffineTransform *)buf, v287, 0);
        ++v188;
      }
      while (v188 < [v7 pointCount]);
    }
    CGPathRelease(Mutable);
    v192 = PLPhotoEditGetLog();
    if (os_log_type_enabled(v192, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v193 = [v7 pointCount];
      float v194 = (float)v189;
      uint64_t v195 = [v7 pointCount];
      LODWORD(v269.a) = 134218496;
      *(void *)((char *)&v269.a + 4) = v193;
      WORD2(v269.b) = 2048;
      *(void *)((char *)&v269.b + 6) = v189;
      HIWORD(v269.c) = 2048;
      *(void *)&v269.d = (uint64_t)(float)((float)((float)v189 / (float)v195) * 100.0);
      _os_log_impl(&dword_217B65000, v192, OS_LOG_TYPE_DEBUG, "Cleanup: strokeAppearsToBeClosedShape - path has %ld points; %ld are inside the path - %ld%%",
        (uint8_t *)&v269,
        0x20u);
    }
    else
    {
      float v194 = (float)v189;
    }

    if ((float)(v194 / (float)[v7 pointCount]) > 0.3)
    {
      v196 = PLPhotoEditGetLog();
      if (os_log_type_enabled(v196, OS_LOG_TYPE_DEBUG))
      {
        LOWORD(v269.a) = 0;
        _os_log_impl(&dword_217B65000, v196, OS_LOG_TYPE_DEBUG, "Cleanup: strokeAppearsToBeClosedShape - rejected for too many points inside the shape", (uint8_t *)&v269, 2u);
      }
      goto LABEL_182;
    }
    v196 = [v7 mutableCopy];
    [v196 pointAtIndex:0];
    -[NSObject appendPoint:](v196, "appendPoint:");
    v197 = [v196 ciImageTiled:0 closed:1 pressureMode:2 filled:0];
    v198 = [v196 ciImageTiled:0 closed:1 pressureMode:2 filled:1];
    v199 = (void *)MEMORY[0x263F5D638];
    [v197 extent];
    double v201 = v200;
    double v203 = v202;
    double v205 = v204;
    double v207 = v206;
    v208 = [MEMORY[0x263F00628] context];
    objc_msgSend(v199, "computeMatteCoverageWithRect:segmentationMatte:context:", v197, v208, v201, v203, v205, v207);
    double v210 = v209;

    v211 = (void *)MEMORY[0x263F5D638];
    [v198 extent];
    double v213 = v212;
    double v215 = v214;
    double v217 = v216;
    double v219 = v218;
    v220 = [MEMORY[0x263F00628] context];
    objc_msgSend(v211, "computeMatteCoverageWithRect:segmentationMatte:context:", v198, v220, v213, v215, v217, v219);
    double v222 = v221;

    v223 = PLPhotoEditGetLog();
    if (os_log_type_enabled(v223, OS_LOG_TYPE_DEBUG))
    {
      LODWORD(v269.a) = 134217984;
      *(double *)((char *)&v269.a + 4) = v210;
      _os_log_impl(&dword_217B65000, v223, OS_LOG_TYPE_DEBUG, "Cleanup: strokeAppearsToBeClosedShape - strokeCoverage: %f", (uint8_t *)&v269, 0xCu);
    }

    v224 = PLPhotoEditGetLog();
    if (os_log_type_enabled(v224, OS_LOG_TYPE_DEBUG))
    {
      LODWORD(v269.a) = 134217984;
      *(double *)((char *)&v269.a + 4) = v222;
      _os_log_impl(&dword_217B65000, v224, OS_LOG_TYPE_DEBUG, "Cleanup: strokeAppearsToBeClosedShape - filledCoverage: %f", (uint8_t *)&v269, 0xCu);
    }

    double v225 = (v222 - v210) / v210;
    v226 = [*(id *)(v125 + 2264) globalSettings];
    [v226 cleanupFilledCoverageRatio];
    double v228 = v227;

    CGFloat v10 = v235;
    if (v225 < v228)
    {
      v229 = PLPhotoEditGetLog();
      if (os_log_type_enabled(v229, OS_LOG_TYPE_DEBUG))
      {
        v230 = [*(id *)(v125 + 2264) globalSettings];
        [v230 cleanupFilledCoverageRatio];
        LODWORD(v269.a) = 134218240;
        *(double *)((char *)&v269.a + 4) = v225;
        WORD2(v269.b) = 2048;
        *(void *)((char *)&v269.b + 6) = v231;
        _os_log_impl(&dword_217B65000, v229, OS_LOG_TYPE_DEBUG, "Cleanup: strokeAppearsToBeClosedShape - rejected for too little fill: %f < %f", (uint8_t *)&v269, 0x16u);
      }
LABEL_182:
      BOOL v9 = 0;
    }
    else
    {

      v196 = PLPhotoEditGetLog();
      if (os_log_type_enabled(v196, OS_LOG_TYPE_DEBUG))
      {
        LOWORD(v269.a) = 0;
        _os_log_impl(&dword_217B65000, v196, OS_LOG_TYPE_DEBUG, "Cleanup: strokeAppearsToBeClosedShape - stroke recognized as lasso", (uint8_t *)&v269, 2u);
      }
      BOOL v9 = 1;
    }
  }
  else
  {
    long long v98 = PLPhotoEditGetLog();
    if (os_log_type_enabled(v98, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      id v99 = "Cleanup: strokeAppearsToBeClosedShape - rejected for head and tail of stroke not being close enough together";
      long long v100 = v98;
      uint32_t v101 = 2;
      goto LABEL_67;
    }
LABEL_68:

    BOOL v9 = 0;
  }

  id v91 = v263;
LABEL_185:

  v8 = v268;
LABEL_186:

  return v9;
}

double __96__PECleanupSegmentAnalyzer__strokeAppearsToBeClosedShape_imageToScreenSpaceScale_lassoDistance___block_invoke_2(uint64_t a1)
{
  return sqrt((*(double (**)(void))(*(void *)(a1 + 32) + 16))());
}

id __96__PECleanupSegmentAnalyzer__strokeAppearsToBeClosedShape_imageToScreenSpaceScale_lassoDistance___block_invoke_4(uint64_t a1, void *a2, void *a3, double a4)
{
  id v6 = a2;
  id v7 = a3;
  id v8 = objc_alloc(MEMORY[0x263F58650]);
  [v6 radius];
  int v10 = v9;
  [v6 softness];
  int v12 = v11;
  [v6 opacity];
  int v14 = v13;
  if (v6) {
    [v6 clipRect];
  }
  else {
    memset(v40, 0, sizeof(v40));
  }
  uint64_t v15 = [v6 pressureMode];
  LODWORD(v16) = v10;
  LODWORD(v17) = v12;
  LODWORD(v18) = v14;
  float v19 = (void *)[v8 initWithRadius:v40 softness:v15 opacity:v16 clipRect:v17 pressureMode:v18];
  if ([v6 pointCount] >= 2)
  {
    uint64_t v20 = 0;
    do
    {
      [v6 pointAtIndex:v20];
      float v22 = v21;
      float v24 = v23;
      float v26 = v25;
      objc_msgSend(v19, "appendPoint:");
      v27 = [v7 objectAtIndexedSubscript:v20];
      [v27 doubleValue];
      double v29 = v28;

      ++v20;
      if (v29 >= a4)
      {
        [v6 pointAtIndex:v20];
        float v33 = v32;
        uint64_t v34 = vcvtmd_s64_f64(v29 / a4);
        if (v34 >= 1)
        {
          float v35 = v30;
          float v36 = v31;
          for (uint64_t i = 0; i != v34; ++i)
          {
            (*(void (**)(float, float, float, float, float, float, double))(*(void *)(a1 + 32) + 16))(v22, v24, v26, v33, v35, v36, ((double)i + 1.0) / ((double)v34 + 1.0));
            objc_msgSend(v19, "appendPoint:");
          }
        }
      }
    }
    while (v20 < [v6 pointCount] - 1);
  }
  objc_msgSend(v6, "pointAtIndex:", objc_msgSend(v6, "pointCount") - 1);
  objc_msgSend(v19, "appendPoint:");

  return v19;
}

void __96__PECleanupSegmentAnalyzer__strokeAppearsToBeClosedShape_imageToScreenSpaceScale_lassoDistance___block_invoke_76(uint64_t a1, uint64_t a2, double *a3, float a4, float a5, float a6, float a7, float a8, float a9, double a10, double a11, float a12, float a13, float a14)
{
  float v20 = a8;
  float v21 = a7;
  float v25 = a14;
  double v26 = (*(double (**)(float, float, float, float, float, float))(*(void *)(a1 + 32) + 16))(a7, a8, a9, a12, a13, a14);
  if (v26 >= *(double *)(a1 + 40))
  {
    double v28 = a12 - v21;
    double v29 = a13 - v20;
    double v30 = fmax(fmin(((a5 - v20) * v29 + (a4 - v21) * v28) / v26, 1.0), 0.0);
    *(float *)&double v28 = v21 + v30 * v28;
    *(float *)&double v29 = v20 + v30 * v29;
    *(_DWORD *)a2 = LODWORD(v28);
    *(_DWORD *)(a2 + 4) = LODWORD(v29);
    *(float *)(a2 + 8) = a6;
    *a3 = v30;
  }
  else
  {
    double v31 = (*(double (**)(float, float, float, float, float))(*(void *)(a1 + 32) + 16))(a4, a5, a6, v21, v20);
    if (v31 >= (*(double (**)(float, float, float, float, float, float))(*(void *)(a1 + 32) + 16))(a4, a5, a6, a12, a13, a14))
    {
      double v27 = 1.0;
      float v21 = a12;
      float v20 = a13;
    }
    else
    {
      double v27 = 0.0;
      float v25 = a9;
    }
    *(float *)a2 = v21;
    *(float *)(a2 + 4) = v20;
    *(float *)(a2 + 8) = v25;
    *a3 = v27;
  }
}

float __96__PECleanupSegmentAnalyzer__strokeAppearsToBeClosedShape_imageToScreenSpaceScale_lassoDistance___block_invoke_3(float a1, double a2, double a3, float a4, double a5, double a6, double a7)
{
  return a1 + a7 * (float)(a4 - a1);
}

double __96__PECleanupSegmentAnalyzer__strokeAppearsToBeClosedShape_imageToScreenSpaceScale_lassoDistance___block_invoke(float a1, float a2, double a3, float a4, float a5)
{
  return (float)((float)((float)(a5 - a2) * (float)(a5 - a2)) + (float)((float)(a4 - a1) * (float)(a4 - a1)));
}

- (BOOL)shouldChooseSegment:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v3 = a3;
  if ([v3 isWire])
  {
    double v4 = 0.2;
  }
  else if ([v3 usingTargetPoints])
  {
    v5 = +[PEGlobalSettings globalSettings];
    [v5 retouchTargetPointCoverageThreshold];
    double v4 = v6;
  }
  else
  {
    double v4 = 0.800000012;
  }
  id v7 = PLPhotoEditGetLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    id v8 = [v3 intersector];
    [v8 maskPercentInsideBrush];
    int v14 = 134218240;
    double v15 = v4;
    __int16 v16 = 2048;
    uint64_t v17 = v9;
    _os_log_impl(&dword_217B65000, v7, OS_LOG_TYPE_DEBUG, "Cleanup: coverage threshold: %f - maskPercentInsideBrush: %f", (uint8_t *)&v14, 0x16u);
  }
  int v10 = [v3 intersector];
  [v10 maskPercentInsideBrush];
  BOOL v12 = v11 > v4;

  return v12;
}

- (void)analyzeStrokeMaskIntersections:(id)a3 inpaintMaskContext:(id)a4 compositionController:(id)a5 geometry:(id)a6 imageToScreenSpaceScale:(double)a7 userSettings:(id)a8 faceRects:(id)a9 completion:(id)a10
{
  id v17 = a3;
  id v42 = a4;
  id v18 = a5;
  id v19 = a6;
  id v20 = a8;
  id v21 = a9;
  id v41 = a10;
  float v22 = +[PEGlobalSettings globalSettings];
  [v22 cleanupLassoDistance];
  float v44 = v17;
  BOOL v24 = [(PECleanupSegmentAnalyzer *)self _strokeAppearsToBeClosedShape:v17 imageToScreenSpaceScale:a7 lassoDistance:v23];

  float v25 = PLPhotoEditGetLog();
  BOOL v26 = os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG);
  if (v24)
  {
    if (!v26) {
      goto LABEL_7;
    }
    *(_WORD *)buf = 0;
    double v27 = "Cleanup: Stroke appears to be a closed shape";
  }
  else
  {
    if (!v26) {
      goto LABEL_7;
    }
    *(_WORD *)buf = 0;
    double v27 = "Cleanup: Stroke is NOT a closed shape";
  }
  _os_log_impl(&dword_217B65000, v25, OS_LOG_TYPE_DEBUG, v27, buf, 2u);
LABEL_7:

  [v19 inputRect];
  uint64_t v28 = NUPixelSizeFromCGSize();
  uint64_t v30 = v29;
  id v43 = v19;
  if (![v20 retouchPixellatesFaces])
  {
LABEL_11:
    v45[0] = MEMORY[0x263EF8330];
    v45[1] = 3221225472;
    v45[2] = __167__PECleanupSegmentAnalyzer_analyzeStrokeMaskIntersections_inpaintMaskContext_compositionController_geometry_imageToScreenSpaceScale_userSettings_faceRects_completion___block_invoke;
    v45[3] = &unk_2642BE950;
    id v46 = v44;
    uint64_t v53 = v28;
    uint64_t v54 = v30;
    id v47 = v18;
    id v48 = v21;
    float v49 = self;
    BOOL v55 = v24;
    id v37 = v19;
    float v32 = v18;
    id v38 = v37;
    id v50 = v37;
    id v51 = v20;
    float v33 = v41;
    id v52 = v41;
    BOOL v39 = v24;
    float v35 = v42;
    id v40 = v38;
    uint64_t v34 = v21;
    float v36 = v43;
    [(PECleanupSegmentAnalyzer *)self _analyzeStrokeMaskIntersections:v46 treatStrokeAsFilledCircle:v39 usingMaskContext:v42 useTargetPoints:0 compositionController:v47 geometry:v40 userSettings:v51 completion:v45];

    double v31 = v46;
    goto LABEL_12;
  }
  double v31 = [v44 ciImageTiled:0 closed:0 pressureMode:2 filled:v24];
  float v32 = v18;
  if (!objc_msgSend(MEMORY[0x263F5D5F8], "maskIsMostlyWithinFace:imageSize:imageOrientation:detectedFaces:", v31, v28, v30, objc_msgSend(v18, "imageOrientation"), v21))
  {

    id v19 = v43;
    goto LABEL_11;
  }
  float v33 = v41;
  (*((void (**)(id, void, void, void, void, BOOL, uint64_t, void))v41 + 2))(v41, 0, 0, 0, 0, v24, 1, 0);
  uint64_t v34 = v21;
  float v35 = v42;
  float v36 = v43;
LABEL_12:
}

void __167__PECleanupSegmentAnalyzer_analyzeStrokeMaskIntersections_inpaintMaskContext_compositionController_geometry_imageToScreenSpaceScale_userSettings_faceRects_completion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9 = a2;
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (objc_msgSend(MEMORY[0x263F5D5F8], "strokeIsEntirelyWithinFace:imageSize:imageOrientation:detectedFaces:", *(void *)(a1 + 32), *(void *)(a1 + 88), *(void *)(a1 + 96), objc_msgSend(*(id *)(a1 + 40), "imageOrientation"), *(void *)(a1 + 48)))
  {
    int v13 = +[PEGlobalSettings globalSettings];
    int v14 = [v13 skipOnDemandSegmentationOnFaces];

    if (v14)
    {
      double v15 = PLPhotoEditGetLog();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_217B65000, v15, OS_LOG_TYPE_DEBUG, "Brush stroke was entirely inside a detected face, so skipping target point segmentation", buf, 2u);
      }

      [v10 count];
      goto LABEL_7;
    }
  }
  if ([v10 count])
  {
LABEL_7:
    (*(void (**)(void))(*(void *)(a1 + 80) + 16))();
    goto LABEL_11;
  }
  __int16 v16 = PLPhotoEditGetLog();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_217B65000, v16, OS_LOG_TYPE_DEBUG, "Cleanup: Did not find intersections using mask context; attempting resegmentation using target points",
      buf,
      2u);
  }

  uint64_t v17 = *(unsigned __int8 *)(a1 + 104);
  uint64_t v18 = *(void *)(a1 + 32);
  id v19 = *(void **)(a1 + 56);
  uint64_t v21 = *(void *)(a1 + 64);
  uint64_t v22 = *(void *)(a1 + 40);
  v23[0] = MEMORY[0x263EF8330];
  v23[1] = 3221225472;
  v23[2] = __167__PECleanupSegmentAnalyzer_analyzeStrokeMaskIntersections_inpaintMaskContext_compositionController_geometry_imageToScreenSpaceScale_userSettings_faceRects_completion___block_invoke_67;
  v23[3] = &unk_2642BE928;
  uint64_t v20 = *(void *)(a1 + 72);
  id v24 = *(id *)(a1 + 80);
  char v25 = *(unsigned char *)(a1 + 104);
  [v19 _analyzeStrokeMaskIntersections:v18 treatStrokeAsFilledCircle:v17 usingMaskContext:0 useTargetPoints:1 compositionController:v22 geometry:v21 userSettings:v20 completion:v23];

LABEL_11:
}

uint64_t __167__PECleanupSegmentAnalyzer_analyzeStrokeMaskIntersections_inpaintMaskContext_compositionController_geometry_imageToScreenSpaceScale_userSettings_faceRects_completion___block_invoke_67(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return (*(uint64_t (**)(void, uint64_t, void, uint64_t, uint64_t, void, void, uint64_t))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), a2, 0, a4, a5, *(unsigned __int8 *)(a1 + 40), 0, 1);
}

- (void)_analyzeStrokeMaskIntersections:(id)a3 treatStrokeAsFilledCircle:(BOOL)a4 usingMaskContext:(id)a5 useTargetPoints:(BOOL)a6 compositionController:(id)a7 geometry:(id)a8 userSettings:(id)a9 completion:(id)a10
{
  BOOL v12 = a6;
  BOOL v14 = a4;
  id v15 = a3;
  id v16 = a5;
  id v17 = a7;
  id v18 = a8;
  id v19 = a9;
  id v20 = a10;
  if (v16)
  {
    [v16 segmentationResult];
    v22 = BOOL v21 = v14;
    v58[0] = MEMORY[0x263EF8330];
    v58[1] = 3221225472;
    v58[2] = __174__PECleanupSegmentAnalyzer__analyzeStrokeMaskIntersections_treatStrokeAsFilledCircle_usingMaskContext_useTargetPoints_compositionController_geometry_userSettings_completion___block_invoke;
    v58[3] = &unk_2642BE8B0;
    id v59 = v20;
    id v23 = v20;
    LOBYTE(v42) = v12;
    [(PECleanupSegmentAnalyzer *)self _analyzeSegmentationResult:v22 forStroke:v15 treatStrokeAsFilledCircle:v21 maskContext:v16 compositionController:v17 geometry:v18 usingTargetPoints:v42 userSettings:v19 completion:v58];

    id v24 = v59;
    char v25 = v18;
    BOOL v26 = v17;
  }
  else
  {
    BOOL v43 = v14;
    id v27 = objc_alloc(MEMORY[0x263F586C8]);
    float v44 = v17;
    uint64_t v28 = [v17 composition];
    uint64_t v29 = (void *)[v27 initWithComposition:v28];

    uint64_t v30 = [MEMORY[0x263F5D618] pipelineFiltersForPreInpaintSegmentation];
    [v29 setPipelineFilters:v30];

    double v31 = [(PECleanupSegmentAnalyzer *)self analyzerQueue];
    [v29 setResponseQueue:v31];

    BOOL v45 = v12;
    char v25 = v18;
    id v32 = v15;
    if (v12)
    {
      float v33 = [MEMORY[0x263F5D618] pipelineFiltersForPostInpaintSegmentation];
      [v29 setPipelineFilters:v33];

      uint64_t v34 = [MEMORY[0x263F586C8] maximumTargetPoints];
      [v25 inputRect];
      id v37 = -[PECleanupSegmentAnalyzer _strokeToNormalizedSampledPointArray:maxPointCount:originalImageSize:treatStrokeAsFilledCircle:](self, "_strokeToNormalizedSampledPointArray:maxPointCount:originalImageSize:treatStrokeAsFilledCircle:", v15, v34, v43, v35, v36);
      [v29 setTargetSamplePoints:v37];
    }
    id v38 = objc_alloc(MEMORY[0x263F5D600]);
    BOOL v39 = [MEMORY[0x263F5D608] genEditIdentifier];
    id v40 = (void *)[v38 initWithIdentifier:v39 operation:3];

    [v40 beginMeasuring];
    v47[0] = MEMORY[0x263EF8330];
    v47[1] = 3221225472;
    v47[2] = __174__PECleanupSegmentAnalyzer__analyzeStrokeMaskIntersections_treatStrokeAsFilledCircle_usingMaskContext_useTargetPoints_compositionController_geometry_userSettings_completion___block_invoke_2;
    v47[3] = &unk_2642BE900;
    id v48 = v40;
    float v49 = self;
    id v50 = v15;
    BOOL v56 = v43;
    BOOL v26 = v44;
    id v51 = v44;
    id v52 = v25;
    BOOL v57 = v45;
    id v54 = v29;
    id v55 = v20;
    id v53 = v19;
    id v41 = v20;
    id v24 = v29;
    id v23 = v40;
    [v24 submit:v47];

    id v15 = v32;
  }
}

uint64_t __174__PECleanupSegmentAnalyzer__analyzeStrokeMaskIntersections_treatStrokeAsFilledCircle_usingMaskContext_useTargetPoints_compositionController_geometry_userSettings_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __174__PECleanupSegmentAnalyzer__analyzeStrokeMaskIntersections_treatStrokeAsFilledCircle_usingMaskContext_useTargetPoints_compositionController_geometry_userSettings_completion___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  [v3 endMeasuring];
  id v19 = 0;
  v5 = [v4 result:&v19];

  id v6 = v19;
  if (v6)
  {
    id v7 = PLPhotoEditGetLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v21 = v6;
      _os_log_impl(&dword_217B65000, v7, OS_LOG_TYPE_ERROR, "Cleanup: Error creating segmentation result: %@", buf, 0xCu);
    }
  }
  else
  {
    id v8 = *(void **)(a1 + 40);
    uint64_t v9 = *(void *)(a1 + 48);
    uint64_t v10 = *(unsigned __int8 *)(a1 + 96);
    uint64_t v11 = *(void *)(a1 + 64);
    char v12 = *(unsigned char *)(a1 + 97);
    uint64_t v13 = *(void *)(a1 + 72);
    uint64_t v15 = *(void *)(a1 + 56);
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __174__PECleanupSegmentAnalyzer__analyzeStrokeMaskIntersections_treatStrokeAsFilledCircle_usingMaskContext_useTargetPoints_compositionController_geometry_userSettings_completion___block_invoke_65;
    v16[3] = &unk_2642BE8D8;
    id v18 = *(id *)(a1 + 88);
    id v17 = *(id *)(a1 + 80);
    LOBYTE(v14) = v12;
    [v8 _analyzeSegmentationResult:v5 forStroke:v9 treatStrokeAsFilledCircle:v10 maskContext:0 compositionController:v15 geometry:v11 usingTargetPoints:v14 userSettings:v13 completion:v16];

    id v7 = v18;
  }
}

void __174__PECleanupSegmentAnalyzer__analyzeStrokeMaskIntersections_treatStrokeAsFilledCircle_usingMaskContext_useTargetPoints_compositionController_geometry_userSettings_completion___block_invoke_65(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = *(void **)(a1 + 32);
  uint64_t v6 = *(void *)(a1 + 40);
  id v8 = a4;
  id v9 = a3;
  id v10 = a2;
  id v11 = [v7 targetSamplePoints];
  (*(void (**)(uint64_t, id, id, id, id))(v6 + 16))(v6, v10, v9, v8, v11);
}

- (void)_analyzeSegmentationResult:(id)a3 forStroke:(id)a4 treatStrokeAsFilledCircle:(BOOL)a5 maskContext:(id)a6 compositionController:(id)a7 geometry:(id)a8 usingTargetPoints:(BOOL)a9 userSettings:(id)a10 completion:(id)a11
{
  BOOL v99 = a5;
  uint64_t v116 = *MEMORY[0x263EF8340];
  id v16 = a3;
  id v17 = a4;
  id v18 = v16;
  id v101 = v17;
  id v19 = a6;
  id v20 = a7;
  id v102 = a8;
  id v21 = v18;
  id v95 = a10;
  uint64_t v94 = (void (**)(id, id, void *, id))a11;
  id v100 = objc_alloc_init(MEMORY[0x263EFF980]);
  uint64_t v103 = [v18 instances];
  uint64_t v22 = PLPhotoEditGetLog();
  BOOL v23 = os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG);
  long long v98 = v18;
  if (a9)
  {
    if (v23)
    {
      *(_DWORD *)buf = 134217984;
      *(void *)&uint8_t buf[4] = [v103 count];
      _os_log_impl(&dword_217B65000, v22, OS_LOG_TYPE_DEBUG, "Cleanup: Attempting intersection with Target Points; retrieved %lu instances",
        buf,
        0xCu);
    }
    id v24 = v102;
LABEL_10:

    goto LABEL_11;
  }
  if (v23)
  {
    char v25 = [v18 backgroundInstances];
    uint64_t v26 = [v25 count];
    id v27 = [v18 foregroundInstances];
    *(_DWORD *)buf = 134218240;
    *(void *)&uint8_t buf[4] = v26;
    *(_WORD *)&buf[12] = 2048;
    *(void *)&buf[14] = [v27 count];
    _os_log_impl(&dword_217B65000, v22, OS_LOG_TYPE_DEBUG, "Cleanup: Attempting intersection; retrieved %lu background instances, %lu foreground instances",
      buf,
      0x16u);

    id v21 = v98;
  }

  uint64_t v28 = [v103 count];
  uint64_t v29 = (void *)MEMORY[0x263F5D5F8];
  uint64_t v30 = [v20 composition];
  double v31 = [v29 removeOperationsFromInstances:v103 composition:v30 context:v19];

  id v32 = [MEMORY[0x263F5D5F8] removeGatedInstances:v31 context:v19];

  uint64_t v103 = v32;
  id v24 = v102;
  if (v28 != [v32 count])
  {
    uint64_t v22 = PLPhotoEditGetLog();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v33 = [v103 count];
      *(_DWORD *)buf = 134217984;
      *(void *)&uint8_t buf[4] = v28 - v33;
      _os_log_impl(&dword_217B65000, v22, OS_LOG_TYPE_DEBUG, "Cleanup: %ld indices were removed from testing because those objects had previously been removed from the image", buf, 0xCu);
    }
    goto LABEL_10;
  }
LABEL_11:
  float v96 = v20;
  float v97 = v19;
  float v106 = [v21 instancesForCategory:*MEMORY[0x263F585D0]];
  uint64_t v34 = [v103 firstIndex];
  if (v34 == 0x7FFFFFFFFFFFFFFFLL)
  {
    float v105 = 0;
    double v35 = 0;
  }
  else
  {
    uint64_t v36 = v34;
    double v35 = 0;
    float v105 = 0;
    do
    {
      id v112 = 0;
      id v37 = (void *)[v21 newMaskForInstance:v36 error:&v112];
      id v38 = v112;

      memset(buf, 0, 32);
      if (v21) {
        [v21 tightBoundsForInstance:v36];
      }
      if (a9)
      {
        BOOL v39 = NSString;
        id v40 = [MEMORY[0x263F08C38] UUID];
        id v41 = [v39 stringWithFormat:@"targetPoints: %@", v40];
      }
      else
      {
        id v41 = [MEMORY[0x263F5D5F8] maskIdentifierForSegmentIndex:v36];
      }
      [v24 inputRect];
      [v37 size];
      uint64_t v42 = NUScaleMake();
      uint64_t v44 = v43;
      id v45 = objc_alloc(MEMORY[0x263F5D5E0]);
      *(_OWORD *)float v114 = *(_OWORD *)buf;
      *(_OWORD *)&v114[16] = *(_OWORD *)&buf[16];
      id v46 = objc_msgSend(v45, "initWithBuffer:identifier:extent:scale:", v37, v41, v114, v42, v44);
      unsigned int v47 = [v106 containsIndex:v36];
      if (v38)
      {
        double v35 = v38;
        id v48 = PLPhotoEditGetLog();
        if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)float v114 = 134218242;
          *(void *)&v114[4] = v36;
          *(_WORD *)&v114[12] = 2112;
          *(void *)&v114[14] = v38;
          _os_log_impl(&dword_217B65000, v48, OS_LOG_TYPE_ERROR, "Cleanup: Error retrieving mask instance %lu: %@", v114, 0x16u);
        }
      }
      else
      {
        unsigned int v104 = v47;
        [v24 inputRect];
        double v50 = v49;
        double v52 = v51;
        [v37 size];
        NUPixelSizeToCGSize();
        uint64_t v55 = -[PECleanupSegmentAnalyzer _maskForStroke:imageSize:maskSize:filled:](self, "_maskForStroke:imageSize:maskSize:filled:", v101, v99, v50, v52, v53, v54);

        BOOL v56 = PLPhotoEditGetLog();
        if (os_log_type_enabled(v56, OS_LOG_TYPE_DEBUG))
        {
          uint64_t v57 = [v37 size];
          [v37 size];
          *(_DWORD *)float v114 = 134218496;
          *(void *)&v114[4] = v36;
          *(_WORD *)&v114[12] = 2048;
          *(void *)&v114[14] = v57;
          *(_WORD *)&v114[22] = 2048;
          *(void *)&v114[24] = v58;
          _os_log_impl(&dword_217B65000, v56, OS_LOG_TYPE_DEBUG, "Cleanup: mask instance %lu has size %lu x %lu", v114, 0x20u);
        }

        id v59 = objc_alloc(MEMORY[0x263F585E8]);
        v60 = objc_msgSend(v59, "initWithBrushMask:mask:strokeScale:", v55, v37, *MEMORY[0x263F585E0], *(void *)(MEMORY[0x263F585E0] + 8));
        double v61 = PLPhotoEditGetLog();
        if (os_log_type_enabled(v61, OS_LOG_TYPE_DEBUG))
        {
          [v60 brushPercentInsideMask];
          uint64_t v63 = v55;
          int v64 = (int)(v62 * 100.0);
          [v60 maskPercentInsideBrush];
          *(_DWORD *)float v114 = 67109632;
          *(_DWORD *)&v114[4] = v64;
          uint64_t v55 = v63;
          id v21 = v98;
          *(_WORD *)&v114[8] = 2048;
          *(void *)&v114[10] = v36;
          *(_WORD *)&v114[18] = 1024;
          *(_DWORD *)&v114[20] = (int)(v65 * 100.0);
          _os_log_impl(&dword_217B65000, v61, OS_LOG_TYPE_DEBUG, "Cleanup: Stroke intersecting: %d%% / Segment %lu intersecting: %d%%", v114, 0x18u);
        }

        double v66 = objc_alloc_init(_CleanupSegmentInfo);
        [(_CleanupSegmentInfo *)v66 setSegmentIndex:v36];
        [(_CleanupSegmentInfo *)v66 setIntersector:v60];
        [(_CleanupSegmentInfo *)v66 setMask:v46];
        [(_CleanupSegmentInfo *)v66 setUsingTargetPoints:a9];
        [(_CleanupSegmentInfo *)v66 setIsWire:v104];
        [v100 addObject:v66];

        uint64_t v36 = [v103 indexGreaterThanIndex:v36];
        float v105 = (void *)v55;
        id v24 = v102;
        double v35 = 0;
      }
    }
    while (v36 != 0x7FFFFFFFFFFFFFFFLL);
  }
  float v107 = v35;
  double v67 = objc_alloc_init(MEMORY[0x263EFF980]);
  id v68 = objc_alloc_init(MEMORY[0x263EFF980]);
  id v69 = objc_alloc_init(MEMORY[0x263F089C8]);
  long long v108 = 0u;
  long long v109 = 0u;
  long long v110 = 0u;
  long long v111 = 0u;
  id v70 = v100;
  uint64_t v71 = [v70 countByEnumeratingWithState:&v108 objects:v113 count:16];
  if (v71)
  {
    uint64_t v72 = v71;
    uint64_t v73 = *(void *)v109;
    double v74 = 0.0;
    do
    {
      for (uint64_t i = 0; i != v72; ++i)
      {
        if (*(void *)v109 != v73) {
          objc_enumerationMutation(v70);
        }
        uint64_t v76 = *(void **)(*((void *)&v108 + 1) + 8 * i);
        double v77 = [v76 mask];
        if ([(PECleanupSegmentAnalyzer *)self shouldChooseSegment:v76])
        {
          [v67 addObject:v77];
          objc_msgSend(v69, "addIndex:", objc_msgSend(v76, "segmentIndex"));
          double v78 = [v76 intersector];
          [v78 brushPercentInsideMask];
          double v74 = v74 + v79;
        }
        uint64_t v80 = [v77 buffer];
        [v68 addObject:v80];
      }
      uint64_t v72 = [v70 countByEnumeratingWithState:&v108 objects:v113 count:16];
    }
    while (v72);
  }
  else
  {
    double v74 = 0.0;
  }

  if (![v67 count])
  {
    id v91 = PLPhotoEditGetLog();
    float v87 = v98;
    if (os_log_type_enabled(v91, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_217B65000, v91, OS_LOG_TYPE_DEBUG, "Cleanup: No segments sufficiently intersected the stroke", buf, 2u);
    }

    goto LABEL_57;
  }
  float v81 = +[PEGlobalSettings globalSettings];
  [v81 retouchStrokeIntersectionPercentage];
  double v83 = v82 / 100.0;

  float v84 = PLPhotoEditGetLog();
  BOOL v85 = os_log_type_enabled(v84, OS_LOG_TYPE_DEFAULT);
  BOOL v86 = v74 < v83 && !v99;
  float v87 = v98;
  if (v86)
  {
    if (v85)
    {
      uint64_t v92 = [v67 count];
      *(_DWORD *)buf = 134218240;
      *(void *)&uint8_t buf[4] = v92;
      *(_WORD *)&buf[12] = 2048;
      *(double *)&buf[14] = v74 * 100.0;
      _os_log_impl(&dword_217B65000, v84, OS_LOG_TYPE_DEFAULT, "Cleanup: %ld segments passed, but %f%% of stroke was over those segments, so not choosing any segments", buf, 0x16u);
    }

LABEL_57:
    float v89 = v67;
    double v67 = 0;
    goto LABEL_58;
  }
  if (v85)
  {
    uint64_t v88 = [v67 count];
    *(_DWORD *)buf = 134218242;
    *(void *)&uint8_t buf[4] = v88;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v67;
    _os_log_impl(&dword_217B65000, v84, OS_LOG_TYPE_DEFAULT, "Cleanup: Successfully chose %ld segments (%@)", buf, 0x16u);
  }

  float v89 = PLPhotoEditGetLog();
  if (os_log_type_enabled(v89, OS_LOG_TYPE_DEFAULT))
  {
    double v90 = @"No";
    if (v99) {
      double v90 = @"Yes";
    }
    *(_DWORD *)buf = 134218242;
    *(double *)&uint8_t buf[4] = v74 * 100.0;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v90;
    _os_log_impl(&dword_217B65000, v89, OS_LOG_TYPE_DEFAULT, "Cleanup: %f%% of stroke was over mask segments. Stroke was a closed shape? %@", buf, 0x16u);
  }
LABEL_58:

  double v93 = (void *)[v69 copy];
  v94[2](v94, v67, v93, v68);
}

- (id)_strokeToNormalizedSampledPointArray:(id)a3 maxPointCount:(int64_t)a4 originalImageSize:(CGSize)a5 treatStrokeAsFilledCircle:(BOOL)a6
{
  BOOL v6 = a6;
  double height = a5.height;
  double width = a5.width;
  id v11 = a3;
  char v12 = v11;
  uint64_t v13 = v11;
  if (v6)
  {
    uint64_t v13 = (void *)[v11 mutableCopy];
    [v13 setRadius:0.0];
  }
  long long v49 = 0u;
  long long v50 = 0u;
  if (v13) {
    [v13 extent];
  }
  double v14 = sqrt((double)a4 / (double)NUPixelSizeArea());
  double v15 = v14 + v14;
  double v16 = width * (v14 + v14);
  double v17 = height * (v14 + v14);
  uint64_t v18 = -[PECleanupSegmentAnalyzer _maskForStroke:imageSize:maskSize:filled:](self, "_maskForStroke:imageSize:maskSize:filled:", v13, v6, width, height, v16, v17);
  if (v18)
  {
    id v19 = (void *)v18;
    id v20 = +[PEGlobalSettings globalSettings];
    uint64_t v21 = [v20 targetPointsFillStrategy];

    if (v6 && v21 == 1)
    {
      uint64_t v22 = -[PECleanupSegmentAnalyzer _maskForStroke:imageSize:maskSize:filled:](self, "_maskForStroke:imageSize:maskSize:filled:", v12, 0, width, height, v16, v17);
      uint64_t v23 = [(PECleanupSegmentAnalyzer *)self _filledRegionOfFilledStrokeImage:v19 withUnfilledStrokeImage:v22];

      id v19 = (void *)v23;
    }
    long long v47 = 0u;
    long long v48 = 0u;
    *(_OWORD *)&v45.a = v49;
    *(_OWORD *)&v45.c = v50;
    NUPixelRectScale();
    CVPixelBufferRef pixelBufferOut = 0;
    if (CVPixelBufferCreate(0, 0, 0, 0x4C303038u, 0, &pixelBufferOut))
    {
      id v24 = 0;
    }
    else
    {
      unint64_t v39 = a4;
      memset(&v45, 0, sizeof(v45));
      CGAffineTransformMakeTranslation(&v45, (double)-(uint64_t)v47, (double)(uint64_t)-*((void *)&v47 + 1));
      NUPixelRectToCGRect();
      char v25 = objc_msgSend(v19, "imageByCroppingToRect:");

      CGAffineTransform v44 = v45;
      id v19 = [v25 imageByApplyingTransform:&v44];

      uint64_t v26 = [MEMORY[0x263F00628] context];
      [v26 render:v19 toCVPixelBuffer:pixelBufferOut];

      id v27 = [MEMORY[0x263EFF980] array];
      aBlock[0] = MEMORY[0x263EF8330];
      aBlock[1] = 3221225472;
      aBlock[2] = __123__PECleanupSegmentAnalyzer__strokeToNormalizedSampledPointArray_maxPointCount_originalImageSize_treatStrokeAsFilledCircle___block_invoke;
      aBlock[3] = &unk_2642BE888;
      double v42 = width;
      double v43 = height;
      id v38 = v27;
      id v41 = v38;
      uint64_t v28 = (void (**)(void, double, double))_Block_copy(aBlock);
      CVPixelBufferLockBaseAddress(pixelBufferOut, 1uLL);
      BaseAddress = CVPixelBufferGetBaseAddress(pixelBufferOut);
      if (*((uint64_t *)&v48 + 1) >= 1)
      {
        uint64_t v30 = BaseAddress;
        uint64_t v31 = 0;
        do
        {
          size_t BytesPerRow = CVPixelBufferGetBytesPerRow(pixelBufferOut);
          uint64_t v33 = v48;
          if ((uint64_t)v48 >= 1)
          {
            uint64_t v34 = 0;
            size_t v35 = (size_t)v30 + BytesPerRow * v31;
            do
            {
              if (*(char *)(v35 + v34) < 0)
              {
                v28[2](v28, (double)(v34 + v47) / v15, (double)(*((void *)&v48 + 1) - v31 + *((void *)&v47 + 1)) / v15);
                uint64_t v33 = v48;
              }
              ++v34;
            }
            while (v34 < v33);
          }
          ++v31;
        }
        while (v31 < *((uint64_t *)&v48 + 1));
      }
      CVPixelBufferUnlockBaseAddress(pixelBufferOut, 1uLL);
      CVPixelBufferRelease(pixelBufferOut);
      id v36 = v38;
      id v24 = v36;
      if ([v36 count] > v39)
      {
        id v24 = -[PECleanupSegmentAnalyzer _evenlySampleArray:maxCount:](self, "_evenlySampleArray:maxCount:", v36);
      }
    }
  }
  else
  {
    id v24 = 0;
  }

  return v24;
}

void __123__PECleanupSegmentAnalyzer__strokeToNormalizedSampledPointArray_maxPointCount_originalImageSize_treatStrokeAsFilledCircle___block_invoke(uint64_t a1, double a2, double a3)
{
  id v3 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x263F08D40], "nu_valueWithCGPoint:", fmax(fmin(a2 / *(double *)(a1 + 40), 1.0), 0.0), fmax(fmin(a3 / *(double *)(a1 + 48), 1.0), 0.0));
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [v3 addObject:v4];
}

- (id)_filledRegionOfFilledStrokeImage:(id)a3 withUnfilledStrokeImage:(id)a4
{
  v43[2] = *MEMORY[0x263EF8340];
  id v5 = a4;
  BOOL v6 = thresholdImage(a3, 0.9999);
  id v7 = thresholdImage(v5, 0.0001);

  id v8 = v7;
  [v8 extent];
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;
  double v17 = [MEMORY[0x263F00618] cachedKernelWithString:@"kernel vec4 PECleanupSegmentAnalyzerInvertMask(__sample s) { return vec4(1.0 - s); }"];
  v43[0] = v8;
  uint64_t v18 = [MEMORY[0x263EFF8C0] arrayWithObjects:v43 count:1];

  id v19 = objc_msgSend(v17, "applyWithExtent:arguments:", v18, *MEMORY[0x263F00190], *(double *)(MEMORY[0x263F00190] + 8), *(double *)(MEMORY[0x263F00190] + 16), *(double *)(MEMORY[0x263F00190] + 24));

  id v20 = objc_msgSend(v19, "imageByCroppingToRect:", v10, v12, v14, v16);

  id v21 = v6;
  id v22 = v20;
  [v21 extent];
  CGFloat v24 = v23;
  CGFloat v26 = v25;
  CGFloat v28 = v27;
  CGFloat v30 = v29;
  [v22 extent];
  v47.origin.double x = v31;
  v47.origin.double y = v32;
  v47.size.double width = v33;
  v47.size.double height = v34;
  v45.origin.double x = v24;
  v45.origin.double y = v26;
  v45.size.double width = v28;
  v45.size.double height = v30;
  CGRect v46 = CGRectIntersection(v45, v47);
  double x = v46.origin.x;
  double y = v46.origin.y;
  double width = v46.size.width;
  double height = v46.size.height;
  if (CGRectIsEmpty(v46))
  {
    unint64_t v39 = [MEMORY[0x263F00650] emptyImage];
  }
  else
  {
    id v40 = [MEMORY[0x263F00618] cachedKernelWithString:@"kernel vec4 PECleanupSegmentAnalyzerAndMasks(__sample a, __sample b) { return vec4(clamp(a, 0.0, 1.0) * clamp(b, 0.0, 1.0)); }"];
    v43[0] = v21;
    v43[1] = v22;
    id v41 = [MEMORY[0x263EFF8C0] arrayWithObjects:v43 count:2];
    unint64_t v39 = objc_msgSend(v40, "applyWithExtent:arguments:", v41, x, y, width, height);
  }
  return v39;
}

- (id)_brushStrokeToNormalizedSampledPointArray:(id)a3 maxPointCount:(int64_t)a4 originalImageSize:(CGSize)a5
{
  CGFloat height = a5.height;
  CGFloat width = a5.width;
  id v9 = a3;
  double v10 = [MEMORY[0x263EFF980] array];
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __102__PECleanupSegmentAnalyzer__brushStrokeToNormalizedSampledPointArray_maxPointCount_originalImageSize___block_invoke;
  aBlock[3] = &unk_2642BE860;
  CGFloat v25 = width;
  CGFloat v26 = height;
  id v11 = v10;
  id v24 = v11;
  double v12 = (void (**)(void))_Block_copy(aBlock);
  [v9 radius];
  float v14 = v13;
  if ([v9 pointCount] >= 1)
  {
    uint64_t v15 = 0;
    do
    {
      [v9 pointAtIndex:v15];
      float v17 = v16;
      float v19 = v18;
      v12[2](v12);
      ((void (*)(void (**)(void), float, float))v12[2])(v12, v17 - v14, v19);
      ((void (*)(void (**)(void), float, float))v12[2])(v12, v14 + v17, v19);
      ((void (*)(void (**)(void), float, float))v12[2])(v12, v17, v19 - v14);
      ((void (*)(void (**)(void), float, float))v12[2])(v12, v17, v14 + v19);
      ++v15;
    }
    while (v15 < [v9 pointCount]);
  }
  id v20 = v11;
  id v21 = v20;
  if ([v20 count] > (unint64_t)a4)
  {
    id v21 = [(PECleanupSegmentAnalyzer *)self _evenlySampleArray:v20 maxCount:a4];
  }
  return v21;
}

void __102__PECleanupSegmentAnalyzer__brushStrokeToNormalizedSampledPointArray_maxPointCount_originalImageSize___block_invoke(uint64_t a1, float a2, float a3)
{
  id v3 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x263F08D40], "nu_valueWithCGPoint:", fmax(fmin(a2 / *(double *)(a1 + 40), 0.999899983), 0.0), fmax(fmin(a3 / *(double *)(a1 + 48), 0.999899983), 0.0));
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [v3 addObject:v4];
}

- (id)_evenlySampleArray:(id)a3 maxCount:(int64_t)a4
{
  id v5 = a3;
  int64_t v6 = [v5 count];
  if (v6 <= a4)
  {
    id v12 = v5;
  }
  else
  {
    uint64_t v7 = v6;
    id v8 = [MEMORY[0x263EFF980] arrayWithCapacity:a4];
    if (a4 >= 1)
    {
      double v9 = (double)v7 / (double)a4;
      double v10 = 0.0;
      do
      {
        id v11 = [v5 objectAtIndex:(unint64_t)v10];
        [v8 addObject:v11];

        double v10 = v9 + v10;
        --a4;
      }
      while (a4);
    }
    id v12 = (id)[v8 copy];
  }
  return v12;
}

- (id)_maskForStroke:(id)a3 imageSize:(CGSize)a4 maskSize:(CGSize)a5 filled:(BOOL)a6
{
  BOOL v6 = a6;
  double height = a5.height;
  double width = a5.width;
  double v9 = a4.height;
  double v10 = a4.width;
  id v12 = a3;
  id v13 = [(PECleanupSegmentAnalyzer *)self cachedBrushStroke];
  if (v13 != v12) {
    goto LABEL_8;
  }
  float v14 = [(PECleanupSegmentAnalyzer *)self cachedStrokeMask];
  if (!v14
    || ([(PECleanupSegmentAnalyzer *)self cachedStrokeMaskSize], width != v16)
    || height != v15)
  {

    id v13 = v12;
LABEL_8:

    goto LABEL_9;
  }
  BOOL v17 = [(PECleanupSegmentAnalyzer *)self cachedStrokeMaskFilled];

  if (v17 == v6)
  {
    float v18 = [(PECleanupSegmentAnalyzer *)self cachedStrokeMask];
    goto LABEL_10;
  }
LABEL_9:
  float v19 = (void *)[v12 mutableCopy];
  CGAffineTransformMakeScale(&v22, width / v10, height / v9);
  [v19 applyTransform:&v22];
  [(PECleanupSegmentAnalyzer *)self setCachedBrushStroke:v12];
  id v20 = [v19 ciImageTiled:0 closed:0 pressureMode:2 filled:v6];
  [(PECleanupSegmentAnalyzer *)self setCachedStrokeMask:v20];

  -[PECleanupSegmentAnalyzer setCachedStrokeMaskSize:](self, "setCachedStrokeMaskSize:", width, height);
  [(PECleanupSegmentAnalyzer *)self setCachedStrokeMaskFilled:v6];
  float v18 = [(PECleanupSegmentAnalyzer *)self cachedStrokeMask];

LABEL_10:
  return v18;
}

- (PECleanupSegmentAnalyzer)init
{
  v8.receiver = self;
  v8.super_class = (Class)PECleanupSegmentAnalyzer;
  v2 = [(PECleanupSegmentAnalyzer *)&v8 init];
  if (v2)
  {
    id v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v4 = dispatch_queue_create("Cleanup Segment Analyzer", v3);
    analyzerQueue = v2->_analyzerQueue;
    v2->_analyzerQueue = (OS_dispatch_queue *)v4;

    BOOL v6 = v2;
  }

  return v2;
}

@end