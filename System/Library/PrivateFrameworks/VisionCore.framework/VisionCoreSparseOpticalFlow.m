@interface VisionCoreSparseOpticalFlow
+ (BOOL)_point:(CGPoint)a3 inQuad:(id)a4;
+ (BOOL)_updateSession:(id)a3 referenceFrame:(__CVBuffer *)a4 error:(id *)a5;
+ (BOOL)_validateBuffer:(__CVBuffer *)a3;
+ (VisionCoreHomography)_estimateTransformSrcPts:(SEL)a3 DstPts:(void *)a4 ransacReprojErrorThreshold:(void *)a5;
+ (double)_convertToSIMDHomography:(uint64_t)a3;
+ (id)computeHomographiesForQuadrilaterals:(id)a3 inFrame:(__CVBuffer *)a4 session:(id)a5 options:(id)a6 error:(id *)a7;
+ (id)destinationKptsForTransform:(VisionCoreHomography *)a3;
+ (id)quadsConformHomographySrcQuads:(id)a3 destQuads:(id)a4 reprojError:(float)a5;
+ (id)sourceKptsForTransform:(VisionCoreHomography *)a3;
+ (id)sparseOpticalFlowResultsFromHomography:(VisionCoreHomography *)a3;
+ (id)updateSparseOpticalFlowResults:(id)a3 homography:(VisionCoreHomography *)a4;
+ (unint64_t)_mtlPixelFormatForBuffer:(__CVBuffer *)a3;
+ (vector<VisionCoreHomography,)_runSparseOpticalFlowOnFrame:(id)a2 shouldRunCorr:(SEL)a3 forSession:(__CVBuffer *)a4 error:(BOOL)a5 groups:(id)a6 options:(id *)a7;
+ (vector<int,)getInlierCountsPerQuad:()vector<int inliers:(std:(SEL)a3 :(void *)a4 allocator<int>> *)result;
+ (void)_gatherKeyPtsFromQuadsForSession:(id)a3 minGridFrequency:(int)a4;
+ (void)recursiveRansacSrcPts:(void *)a3 DstPts:(void *)a4 QuadsMatchingKptsCount:(void *)a5 resultingHomographies:(void *)a6 groups:(void *)a7 inlierRatio:(float)a8 ransacReprojErrorThreshold:(float)a9;
+ (void)updateGroupingWithQuadsOnMemory:(id)a3 groups:(void *)a4;
@end

@implementation VisionCoreSparseOpticalFlow

+ (id)sparseOpticalFlowResultsFromHomography:(VisionCoreHomography *)a3
{
  v4 = [VisionCoreSparseOpticalFlowResult alloc];
  v5 = [MEMORY[0x263F08C38] UUID];
  VisionCoreHomography::VisionCoreHomography(&v11, a3);
  v6 = +[VisionCoreSparseOpticalFlow sourceKptsForTransform:&v11];
  VisionCoreHomography::VisionCoreHomography(&v10, a3);
  v7 = +[VisionCoreSparseOpticalFlow destinationKptsForTransform:&v10];
  v8 = [(VisionCoreSparseOpticalFlowResult *)v4 initWithQuadUUID:v5 srcKeypoints:v6 dstKeypoints:v7];

  VisionCoreHomography::~VisionCoreHomography(&v10);
  VisionCoreHomography::~VisionCoreHomography(&v11);

  return v8;
}

+ (id)updateSparseOpticalFlowResults:(id)a3 homography:(VisionCoreHomography *)a4
{
  id v5 = a3;
  v6 = [VisionCoreSparseOpticalFlowResult alloc];
  v7 = [MEMORY[0x263F08C38] UUID];
  VisionCoreHomography::VisionCoreHomography(&v22, a4);
  v8 = +[VisionCoreSparseOpticalFlow sourceKptsForTransform:&v22];
  VisionCoreHomography::VisionCoreHomography(&v21, a4);
  v9 = +[VisionCoreSparseOpticalFlow destinationKptsForTransform:&v21];
  VisionCoreHomography v10 = [(VisionCoreSparseOpticalFlowResult *)v6 initWithQuadUUID:v7 srcKeypoints:v8 dstKeypoints:v9];

  VisionCoreHomography::~VisionCoreHomography(&v21);
  VisionCoreHomography::~VisionCoreHomography(&v22);

  if (v5)
  {
    VisionCoreHomography v11 = [v5 dstPts];
    v12 = [(VisionCoreSparseOpticalFlowResult *)v10 dstPts];
    v13 = [v11 arrayByAddingObjectsFromArray:v12];

    v14 = [v5 srcPts];
    v15 = [(VisionCoreSparseOpticalFlowResult *)v10 srcPts];
    v16 = [v14 arrayByAddingObjectsFromArray:v15];

    v17 = [VisionCoreSparseOpticalFlowResult alloc];
    v18 = [MEMORY[0x263F08C38] UUID];
    v19 = [(VisionCoreSparseOpticalFlowResult *)v17 initWithQuadUUID:v18 srcKeypoints:v16 dstKeypoints:v13];
  }
  else
  {
    v19 = v10;
  }

  return v19;
}

+ (id)destinationKptsForTransform:(VisionCoreHomography *)a3
{
  id v4 = objc_alloc_init(MEMORY[0x263EFF980]);
  VisionCoreHomography::CalculateReprojectionError((VisionCoreHomography *)&v12, (uint64_t)a3);
  id v5 = v12;
  if (a3->var1.var2 < 1)
  {
    if (!v12) {
      goto LABEL_10;
    }
  }
  else
  {
    unint64_t v6 = 0;
    do
    {
      v7 = [VisionCoreSparseOpticalFlowResultPoint alloc];
      if (a3->var3.var1 <= v6) {
        unint64_t v9 = 0;
      }
      else {
        unint64_t v9 = (*(unint64_t *)((char *)a3->var3.var0 + ((v6 >> 3) & 0x1FFFFFFFFFFFFFF8)) >> v6) & 1;
      }
      LODWORD(v8) = v5[v6];
      VisionCoreHomography v10 = [(VisionCoreSparseOpticalFlowResultPoint *)v7 initWithX:v9 Y:a3->var1.var0[v6] inlier:a3->var1.var1[v6] reprojError:v8];
      [v4 addObject:v10];

      ++v6;
    }
    while ((uint64_t)v6 < a3->var1.var2);
  }
  operator delete(v5);
LABEL_10:
  return v4;
}

+ (id)sourceKptsForTransform:(VisionCoreHomography *)a3
{
  id v4 = objc_alloc_init(MEMORY[0x263EFF980]);
  VisionCoreHomography::CalculateReprojectionError((VisionCoreHomography *)&v12, (uint64_t)a3);
  id v5 = v12;
  if (a3->var0.var2 < 1)
  {
    if (!v12) {
      goto LABEL_10;
    }
  }
  else
  {
    unint64_t v6 = 0;
    do
    {
      v7 = [VisionCoreSparseOpticalFlowResultPoint alloc];
      if (a3->var3.var1 <= v6) {
        unint64_t v9 = 0;
      }
      else {
        unint64_t v9 = (*(unint64_t *)((char *)a3->var3.var0 + ((v6 >> 3) & 0x1FFFFFFFFFFFFFF8)) >> v6) & 1;
      }
      LODWORD(v8) = v5[v6];
      VisionCoreHomography v10 = [(VisionCoreSparseOpticalFlowResultPoint *)v7 initWithX:v9 Y:a3->var0.var0[v6] inlier:a3->var0.var1[v6] reprojError:v8];
      [v4 addObject:v10];

      ++v6;
    }
    while ((uint64_t)v6 < a3->var0.var2);
  }
  operator delete(v5);
LABEL_10:
  return v4;
}

+ (id)computeHomographiesForQuadrilaterals:(id)a3 inFrame:(__CVBuffer *)a4 session:(id)a5 options:(id)a6 error:(id *)a7
{
  uint64_t v113 = *MEMORY[0x263EF8340];
  id v90 = a3;
  id v11 = a5;
  id v88 = a6;
  id v92 = a1;
  if ([a1 _validateBuffer:a4])
  {
    v12 = [v88 objectForKeyedSubscript:@"VisionCoreOption_MinKptsFreqForQuads"];
    v86 = v12;
    if (v12) {
      int v13 = [v12 intValue];
    }
    else {
      int v13 = 4;
    }
    v91 = objc_msgSend(objc_alloc(MEMORY[0x263EFF9A0]), "initWithCapacity:", objc_msgSend(v90, "count"));
    size_t Width = CVPixelBufferGetWidth(a4);
    v87 = a4;
    size_t Height = CVPixelBufferGetHeight(a4);
    id v15 = objc_alloc(MEMORY[0x263EFF980]);
    unint64_t v16 = [v90 count];
    if (v16 <= 1) {
      uint64_t v17 = 1;
    }
    else {
      uint64_t v17 = v16;
    }
    v18 = (void *)[v15 initWithCapacity:v17];
    unsigned int v96 = v13;
    long long v109 = 0u;
    long long v110 = 0u;
    long long v107 = 0u;
    long long v108 = 0u;
    id v19 = v90;
    uint64_t v20 = [v19 countByEnumeratingWithState:&v107 objects:v112 count:16];
    if (v20)
    {
      uint64_t v21 = *(void *)v108;
      do
      {
        for (uint64_t i = 0; i != v20; ++i)
        {
          if (*(void *)v108 != v21) {
            objc_enumerationMutation(v19);
          }
          v23 = *(void **)(*((void *)&v107 + 1) + 8 * i);
          v24 = [VisionCoreSparseOpticalFlowQuad alloc];
          [v23 topLeft];
          double v26 = v25;
          double v28 = v27;
          [v23 topRight];
          double v30 = v29;
          double v32 = v31;
          [v23 bottomRight];
          double v34 = v33;
          double v36 = v35;
          [v23 bottomLeft];
          double v38 = v37;
          double v40 = v39;
          v41 = [v23 UUID];
          v42 = -[VisionCoreSparseOpticalFlowQuad initWithTopLeft:topRight:bottomRight:bottomLeft:indentifier:homographyGroupID:](v24, "initWithTopLeft:topRight:bottomRight:bottomLeft:indentifier:homographyGroupID:", v41, [v23 homographyGroupID], v26, v28, v30, v32, v34, v36, v38, v40);

          [v18 addObject:v42];
        }
        uint64_t v20 = [v19 countByEnumeratingWithState:&v107 objects:v112 count:16];
      }
      while (v20);
    }

    if (![v19 count])
    {
      v43 = [VisionCoreSparseOpticalFlowQuad alloc];
      v44 = [MEMORY[0x263F08C38] UUID];
      v45 = -[VisionCoreSparseOpticalFlowQuad initWithTopLeft:topRight:bottomRight:bottomLeft:indentifier:](v43, "initWithTopLeft:topRight:bottomRight:bottomLeft:indentifier:", v44, (float)((float)Width * 0.25), (float)((float)Height * 0.75), (float)((float)Width * 0.75), (float)((float)Height * 0.75), (float)((float)Width * 0.75), (float)((float)Height * 0.25), (float)((float)Width * 0.25), (float)((float)Height * 0.25));

      [v18 addObject:v45];
    }
    [v11 setTrackedQuads:v18];
    v46 = _VisionCoreSignpostLog();
    if (os_signpost_enabled(v46))
    {
      LOWORD(buf.__begin_) = 0;
      _os_signpost_emit_with_name_impl(&dword_22B18B000, v46, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "VisionCoreSparseOpticalFlowKeypointsEvent", "", (uint8_t *)&buf, 2u);
    }

    [v92 _gatherKeyPtsFromQuadsForSession:v11 minGridFrequency:v96];
    v47 = _VisionCoreSignpostLog();
    if (os_signpost_enabled(v47))
    {
      LOWORD(buf.__begin_) = 0;
      _os_signpost_emit_with_name_impl(&dword_22B18B000, v47, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "VisionCoreSparseOpticalFlowKeypointsEvent", "", (uint8_t *)&buf, 2u);
    }

    v48 = [v11 texture];
    BOOL v49 = v48 == 0;

    if (v49
      || (size_t v50 = CVPixelBufferGetWidth((CVPixelBufferRef)[v11 prevFrame]),
          size_t v51 = CVPixelBufferGetHeight((CVPixelBufferRef)[v11 prevFrame]),
          double v52 = (double)Width,
          (double)Width == (double)v50)
      && (double v52 = (double)Height, (double)Height == (double)v51))
    {
      v53 = (void *)[v11 quadPointCounts];
      std::vector<int>::size_type v54 = (uint64_t)(v53[1] - *v53) >> 3;
      __x[0] = -1;
      std::vector<int>::vector(&buf, v54, __x);
      for (unint64_t j = 0; ; ++j)
      {
        v56 = [v11 trackedQuads];
        BOOL v57 = [v56 count] > j;

        if (!v57) {
          break;
        }
        v58 = [v11 trackedQuads];
        v59 = [v58 objectAtIndexedSubscript:j];

        int v60 = [v59 homographyGroupID];
        buf.__begin_[j] = v60;
      }
      v61 = _VisionCoreSignpostLog();
      if (os_signpost_enabled(v61))
      {
        LOWORD(__x[0]) = 0;
        _os_signpost_emit_with_name_impl(&dword_22B18B000, v61, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "VisionCoreSparseOpticalFlowEvent", "", (uint8_t *)__x, 2u);
      }

      v62 = (void *)[v11 allSrcPoints];
      [v92 _runSparseOpticalFlowOnFrame:v87 shouldRunCorr:v62[1] - *v62 > 8uLL forSession:v11 error:a7 groups:&buf options:v88];
      v63 = _VisionCoreSignpostLog();
      if (os_signpost_enabled(v63))
      {
        *(_WORD *)v111 = 0;
        _os_signpost_emit_with_name_impl(&dword_22B18B000, v63, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "VisionCoreSparseOpticalFlowEvent", "", v111, 2u);
      }

      objc_msgSend(v11, "setFrameCountSinceLastGrouping:", objc_msgSend(v11, "frameCountSinceLastGrouping") + 1);
      v64 = _VisionCoreSignpostLog();
      if (os_signpost_enabled(v64))
      {
        *(_WORD *)v111 = 0;
        _os_signpost_emit_with_name_impl(&dword_22B18B000, v64, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "VisionCoreSparseOpticalFlowPrepareResults", "", v111, 2u);
      }

      id v85 = *a7;
      if (!*a7)
      {
        if (buf.__end_ == buf.__begin_)
        {
LABEL_42:
          LODWORD(v65) = 0;
        }
        else
        {
          uint64_t v65 = 0;
          unint64_t v66 = buf.__end_ - buf.__begin_;
          if (v66 <= 1) {
            unint64_t v66 = 1;
          }
          while (buf.__begin_[v65])
          {
            if (v66 == ++v65) {
              goto LABEL_42;
            }
          }
        }
        VisionCoreHomography::VisionCoreHomography(&v104, (VisionCoreHomography *)(*(void *)__x + 136 * v65));
        [v92 _convertToSIMDHomography:&v104];
        double v97 = v68;
        double v100 = v67;
        double v94 = v69;
        VisionCoreHomography::~VisionCoreHomography(&v104);
        objc_msgSend(v11, "setSceneHomography:", v100, v97, v94);
        v70 = _VisionCoreSignpostLog();
        if (os_signpost_enabled(v70))
        {
          *(_WORD *)v111 = 0;
          _os_signpost_emit_with_name_impl(&dword_22B18B000, v70, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "VisionCoreSparseOpticalFlowPrepareDebuggingResults", "", v111, 2u);
        }

        uint64_t v71 = 0;
        unint64_t v72 = 0;
        v73 = (_OWORD *)MEMORY[0x263F000D0];
        while (v72 < objc_msgSend(v19, "count", v85, v86))
        {
          v74 = [v19 objectAtIndex:v72];
          VisionCoreHomography::VisionCoreHomography(&v103, (VisionCoreHomography *)(*(void *)__x + v71));
          [v92 _convertToSIMDHomography:&v103];
          double v98 = v76;
          double v101 = v75;
          double v95 = v77;
          VisionCoreHomography::~VisionCoreHomography(&v103);
          v78 = [VisionCoreWarpTransform alloc];
          long long v79 = v73[1];
          v102[0] = *v73;
          v102[1] = v79;
          v102[2] = v73[2];
          v80 = [v74 UUID];
          v81 = -[VisionCoreWarpTransform initWithWarpTransform:affineTransform:UUID:reprojectionError:groupID:](v78, "initWithWarpTransform:affineTransform:UUID:reprojectionError:groupID:", v102, v80, buf.__begin_[v72], v101, v98, v95, 0.0);

          [v91 setObject:v81 forKey:v74];
          ++v72;
          v71 += 136;
        }
        v82 = _VisionCoreSignpostLog();
        if (os_signpost_enabled(v82))
        {
          *(_WORD *)v111 = 0;
          _os_signpost_emit_with_name_impl(&dword_22B18B000, v82, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "VisionCoreSparseOpticalFlowPrepareDebuggingResults", "", v111, 2u);
        }
      }
      v83 = _VisionCoreSignpostLog();
      if (os_signpost_enabled(v83))
      {
        *(_WORD *)v111 = 0;
        _os_signpost_emit_with_name_impl(&dword_22B18B000, v83, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "VisionCoreSparseOpticalFlowPrepareResults", "", v111, 2u);
      }

      if ([v92 _updateSession:v11 referenceFrame:v87 error:a7])
      {
        if (v85)
        {
          objc_msgSend(v11, "setSceneHomography:", *MEMORY[0x263EF89A0], *(double *)(MEMORY[0x263EF89A0] + 16), *(double *)(MEMORY[0x263EF89A0] + 32));
          id v14 = (id)MEMORY[0x263EFFA78];
        }
        else
        {
          id v14 = v91;
        }
      }
      else
      {
        objc_msgSend(v11, "setSceneHomography:", *MEMORY[0x263EF89A0], *(double *)(MEMORY[0x263EF89A0] + 16), *(double *)(MEMORY[0x263EF89A0] + 32));
        id v14 = 0;
      }
      *(void *)v111 = __x;
      std::vector<VisionCoreHomography>::__destroy_vector::operator()[abi:ne180100]((void ***)v111);
      if (buf.__begin_)
      {
        buf.__end_ = buf.__begin_;
        operator delete(buf.__begin_);
      }
    }
    else if (a7)
    {
      objc_msgSend(MEMORY[0x263F087E8], "VisionCoreErrorForInternalErrorWithLocalizedDescription:", @"Frame buffer and reference frame dimensions do not match", v52);
      id v14 = 0;
      *a7 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v14 = 0;
    }
  }
  else if (a7)
  {
    [MEMORY[0x263F087E8] VisionCoreErrorForInternalErrorWithLocalizedDescription:@"Invalid buffer - ensure IO surface backed, format is BGRA / RGBA / Luma, and even dimensions"];
    id v14 = 0;
    *a7 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v14 = 0;
  }

  return v14;
}

+ (unint64_t)_mtlPixelFormatForBuffer:(__CVBuffer *)a3
{
  if (CVPixelBufferGetPixelFormatType(a3) == 1278226488) {
    return 10;
  }
  else {
    return 70;
  }
}

+ (BOOL)_validateBuffer:(__CVBuffer *)a3
{
  char Width = CVPixelBufferGetWidth(a3);
  char Height = CVPixelBufferGetHeight(a3);
  OSType PixelFormatType = CVPixelBufferGetPixelFormatType(a3);
  IOSurfaceRef IOSurface = CVPixelBufferGetIOSurface(a3);
  if (PixelFormatType != 1111970369 && PixelFormatType != 1380401729 && PixelFormatType != 1278226488) {
    return 0;
  }
  BOOL v9 = (Width & 1) == 0 && IOSurface != 0;
  return (Height & 1) == 0 && v9;
}

+ (BOOL)_point:(CGPoint)a3 inQuad:(id)a4
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  [a4 boundingBox];
  CGFloat v10 = x;
  CGFloat v11 = y;
  return CGRectContainsPoint(*(CGRect *)&v6, *(CGPoint *)&v10);
}

+ (double)_convertToSIMDHomography:(uint64_t)a3
{
  return **(double **)(a3 + 48);
}

+ (vector<VisionCoreHomography,)_runSparseOpticalFlowOnFrame:(id)a2 shouldRunCorr:(SEL)a3 forSession:(__CVBuffer *)a4 error:(BOOL)a5 groups:(id)a6 options:(id *)a7
{
  BOOL v11 = a5;
  uint64_t v171 = *MEMORY[0x263EF8340];
  id v13 = a6;
  id v14 = a9;
  id v15 = (uint64_t *)[v13 quadPointCounts];
  uint64_t v17 = *v15;
  uint64_t v16 = v15[1];
  VisionCoreHomography::VisionCoreHomography(&buf);
  std::vector<VisionCoreHomography>::vector(&retstr->var0, (v16 - v17) >> 3, &buf);
  VisionCoreHomography::~VisionCoreHomography(&buf);
  v18 = [v13 texture];
  if (v18) {
    BOOL v19 = v11;
  }
  else {
    BOOL v19 = 0;
  }

  if (v19)
  {
    uint64_t v20 = [v14 objectForKeyedSubscript:@"VisionCore_RansacMaxReprojError"];
    v142 = v20;
    if (v20)
    {
      [v20 floatValue];
      float v22 = v21;
    }
    else
    {
      float v22 = 0.5;
    }
    v23 = [v14 objectForKeyedSubscript:@"VisionCore_MultiHomographyInlierRatio"];
    v143 = v23;
    if (v23)
    {
      [v23 floatValue];
      int v25 = v24;
    }
    else
    {
      int v25 = 1036831949;
    }
    double v26 = [v14 objectForKeyedSubscript:@"VisionCoreOption_OpticalFlowPyramidScales"];
    v144 = v26;
    if (v26) {
      uint64_t v27 = [v26 intValue];
    }
    else {
      uint64_t v27 = 0xFFFFFFFFLL;
    }
    double v28 = _VisionCoreSignpostLog();
    if (os_signpost_enabled(v28))
    {
      LOWORD(buf.var0.var0) = 0;
      _os_signpost_emit_with_name_impl(&dword_22B18B000, v28, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "VisionCoreSparseOpticalFlowTexturePreparation", "", (uint8_t *)&buf, 2u);
    }

    double v29 = [v13 mtlContext];
    v149 = objc_msgSend(v29, "bindPixelBufferToMTL2DTexture:pixelFormat:plane:", a4, objc_msgSend((id)objc_opt_class(), "_mtlPixelFormatForBuffer:", a4), 0);

    unint64_t v30 = [v13 frameCountSinceLastGrouping];
    [v13 setDebuggingMemoryResult:0];
    [v13 setDebuggingResult:0];
    unint64_t v31 = v30 % 3;
    if (v30 % 3)
    {
      [v13 moveMemoryKeypointsToSessionKpts];
    }
    else
    {
      double v32 = (void *)[v13 groupingMemoryDstPoints];
      if (v32[1] != *v32)
      {
        double v33 = (uint64_t *)[v13 groupingMemorySrcPoints];
        uint64_t v35 = *v33;
        uint64_t v34 = v33[1];
        double v36 = (void *)[v13 groupingMemorySrcPoints];
        if (v34 - v35 == v36[1] - *v36)
        {
          uint64_t v37 = *((void *)a8 + 1) - *(void *)a8;
          if (v37 >= 1) {
            bzero(*(void **)a8, 4 * (((unint64_t)v37 >> 2) - ((unint64_t)v37 > 3)) + 4);
          }
          [a2 updateGroupingWithQuadsOnMemory:v13 groups:a8];
        }
      }
      [v13 resetGroupingMemory];
    }
    double v38 = [v13 mtlContext];
    double v39 = (void *)[v13 allSrcPoints];
    id v150 = (id)objc_msgSend(v38, "newBufferWithPixelFormat:width:data:", 65, (v39[1] - *v39) >> 2, *objc_msgSend(v13, "allSrcPoints"));

    double v40 = _VisionCoreSignpostLog();
    if (os_signpost_enabled(v40))
    {
      LOWORD(buf.var0.var0) = 0;
      _os_signpost_emit_with_name_impl(&dword_22B18B000, v40, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "VisionCoreSparseOpticalFlowTexturePreparation", "", (uint8_t *)&buf, 2u);
    }

    v41 = _VisionCoreSignpostLog();
    if (os_signpost_enabled(v41))
    {
      v42 = (void *)[v13 allSrcPoints];
      v43 = (float *)((unint64_t)((uint64_t)(v42[1] - *v42) >> 1) >> 1);
      LODWORD(buf.var0.var0) = 134217984;
      *(float **)((char *)&buf.var0.var0 + 4) = v43;
      _os_signpost_emit_with_name_impl(&dword_22B18B000, v41, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "VisionCoreSparseOpticalFlowRunBidirectional", "num keypoints: %lu", (uint8_t *)&buf, 0xCu);
    }

    v44 = [v13 lktSparseGPUContext];
    BOOL v45 = v44 == 0;

    if (v45)
    {
      v46 = [VisionCoreLKTSparseGPU alloc];
      v47 = [v13 mtlContext];
      size_t Width = CVPixelBufferGetWidth(a4);
      BOOL v49 = [(VisionCoreLKTSparseGPU *)v46 initWithMetalContext:v47 width:Width height:CVPixelBufferGetHeight(a4) nscales:v27];
      [v13 setLktSparseGPUContext:v49];
    }
    size_t v50 = [v13 lktSparseGPUContext];
    size_t v51 = [v13 texture];
    double v52 = (_DWORD *)[v13 allSrcPoints];
    LODWORD(v53) = 0.5;
    [v50 computeMatchingBidirectionalFromReferenceTexture:v51 targetTexture:v149 kptsBuffer:v150 bidirectionalError:(unsigned __int16)((v52[2] - *v52) >> 2) numKeypoints:v53];

    std::vector<int>::size_type v54 = [v13 lktSparseGPUContext];
    [v54 waitUntilCompleted];

    v55 = _VisionCoreSignpostLog();
    if (os_signpost_enabled(v55))
    {
      v56 = (void *)[v13 allSrcPoints];
      BOOL v57 = (float *)((unint64_t)((uint64_t)(v56[1] - *v56) >> 1) >> 1);
      LODWORD(buf.var0.var0) = 134217984;
      *(float **)((char *)&buf.var0.var0 + 4) = v57;
      _os_signpost_emit_with_name_impl(&dword_22B18B000, v55, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "VisionCoreSparseOpticalFlowRunBidirectional", "num keypoints: %lu", (uint8_t *)&buf, 0xCu);
    }

    v58 = _VisionCoreSignpostLog();
    if (os_signpost_enabled(v58))
    {
      LOWORD(buf.var0.var0) = 0;
      _os_signpost_emit_with_name_impl(&dword_22B18B000, v58, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "VisionCoreSparseOpticalFlowKeypointToQuadAllocation", "", (uint8_t *)&buf, 2u);
    }

    v59 = [v13 lktSparseGPUContext];
    id v145 = [v59 keypointsTarget];

    int v60 = [v13 lktSparseGPUContext];
    id v146 = [v60 keypointsStatus];

    id v61 = v150;
    uint64_t v62 = [v61 contents];
    id v148 = v145;
    uint64_t v63 = [v148 contents];
    id v147 = v146;
    uint64_t v64 = [v147 contents];
    if (v31)
    {
      memset(&buf, 0, 24);
      objc_msgSend(v13, "updateMemoryKeypointsWithOpticalFlowResultsSourceBuffer:destBuffer:matchBuffer:start:", v62, v63, v64, objc_msgSend(v13, "updateKeypointsWithOpticalFlowResultsSourceBuffer:destBuffer:matchBuffer:matchCount:", v62, v63, v64, &buf));
    }
    else
    {
      memset(&buf, 0, 24);
      [v13 updateKeypointsWithOpticalFlowResultsSourceBuffer:v62 destBuffer:v63 matchBuffer:v64 matchCount:&buf];
      __p = 0;
      v168 = 0;
      v169 = 0;
      var0 = buf.var0.var0;
      int64_t v66 = (char *)buf.var0.var1 - (char *)buf.var0.var0;
      if (buf.var0.var1 != buf.var0.var0)
      {
        if (v66 < 0) {
          std::vector<unsigned long>::__throw_length_error[abi:ne180100]();
        }
        __p = std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>(v66 >> 3);
        v169 = (char *)__p + 8 * v67;
        memmove(__p, var0, v66);
        v168 = (char *)__p + 8 * (v66 >> 3);
      }
      [v13 saveCurrentMatchingToMemoryMatchCounts:&__p];
      if (__p)
      {
        v168 = (char *)__p;
        operator delete(__p);
      }
    }
    if (buf.var0.var0)
    {
      buf.var0.var1 = buf.var0.var0;
      operator delete(buf.var0.var0);
    }
    double v68 = _VisionCoreSignpostLog();
    if (os_signpost_enabled(v68))
    {
      LOWORD(buf.var0.var0) = 0;
      _os_signpost_emit_with_name_impl(&dword_22B18B000, v68, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "VisionCoreSparseOpticalFlowKeypointToQuadAllocation", "", (uint8_t *)&buf, 2u);
    }

    double v69 = (uint64_t *)[v13 allSrcPoints];
    uint64_t v71 = *v69;
    uint64_t v70 = v69[1];
    unint64_t v72 = (void *)[v13 allDstPoints];
    if (v70 - v71 == v72[1] - *v72)
    {
      v73 = (void *)[v13 allSrcPoints];
      if (v73[1] != *v73)
      {
        v74 = _VisionCoreSignpostLog();
        if (os_signpost_enabled(v74))
        {
          LOWORD(buf.var0.var0) = 0;
          _os_signpost_emit_with_name_impl(&dword_22B18B000, v74, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "VisionCoreSparseOpticalFlowEstimateSceneHG", "", (uint8_t *)&buf, 2u);
        }

        uint64_t v75 = *((void *)a8 + 1) - *(void *)a8;
        if (v75)
        {
          uint64_t v76 = v75 >> 2;
          if ((unint64_t)(v75 >> 2) <= 1) {
            uint64_t v76 = 1;
          }
          double v77 = *(int **)a8;
          while (1)
          {
            int v78 = *v77++;
            if ((v78 | 0x80000000) != 0xFFFFFFFF) {
              break;
            }
            if (!--v76) {
              goto LABEL_55;
            }
          }
          id v140 = v61;
          id v141 = v14;
          for (int i = 0; i != 3; ++i)
          {
            v87 = 0;
            id v88 = 0;
            unint64_t v89 = 0;
            unint64_t v90 = 0;
            LODWORD(v91) = 0;
            v164 = 0;
            v165 = 0;
            uint64_t v166 = 0;
            v161 = 0;
            v162 = 0;
            uint64_t v163 = 0;
            v158 = 0;
            v159 = 0;
            unint64_t v160 = 0;
            while (1)
            {
              id v92 = objc_msgSend(v13, "quadPointCounts", v140);
              if (v90 >= (uint64_t)(v92[1] - *v92) >> 3) {
                break;
              }
              uint64_t v93 = (int)v91;
              uint64_t v91 = (int)v91 + 2 * *(void *)(*(void *)[v13 quadPointCounts] + 8 * v90);
              if (*(_DWORD *)(*(void *)a8 + 4 * v90) == i)
              {
                std::__unwrap_and_dispatch[abi:ne180100]<std::__overload<std::__copy_loop<std::_ClassicAlgPolicy>,std::__copy_trivial>,std::__wrap_iter<half *>,std::__wrap_iter<half *>,std::back_insert_iterator<std::vector<half>>,0>((_WORD *)(*(void *)[v13 allSrcPoints] + 2 * v93), (_WORD *)(*objc_msgSend(v13, "allSrcPoints") + 2 * (int)v91), (uint64_t)&v164);
                std::__unwrap_and_dispatch[abi:ne180100]<std::__overload<std::__copy_loop<std::_ClassicAlgPolicy>,std::__copy_trivial>,std::__wrap_iter<half *>,std::__wrap_iter<half *>,std::back_insert_iterator<std::vector<half>>,0>((_WORD *)(*(void *)[v13 allDstPoints] + 2 * v93), (_WORD *)(*objc_msgSend(v13, "allDstPoints") + 2 * (int)v91), (uint64_t)&v161);
                if ((unint64_t)v88 >= v89)
                {
                  uint64_t v95 = v88 - v87;
                  unint64_t v96 = v95 + 1;
                  if ((unint64_t)(v95 + 1) >> 61) {
                    goto LABEL_155;
                  }
                  if ((uint64_t)(v89 - (void)v87) >> 2 > v96) {
                    unint64_t v96 = (uint64_t)(v89 - (void)v87) >> 2;
                  }
                  if (v89 - (unint64_t)v87 >= 0x7FFFFFFFFFFFFFF8) {
                    unint64_t v97 = 0x1FFFFFFFFFFFFFFFLL;
                  }
                  else {
                    unint64_t v97 = v96;
                  }
                  if (v97) {
                    unint64_t v97 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>(v97);
                  }
                  else {
                    uint64_t v98 = 0;
                  }
                  v99 = (unint64_t *)(v97 + 8 * v95);
                  unint64_t *v99 = v90;
                  double v94 = v99 + 1;
                  while (v88 != v87)
                  {
                    unint64_t v100 = *--v88;
                    *--v99 = v100;
                  }
                  unint64_t v89 = v97 + 8 * v98;
                  if (v87) {
                    operator delete(v87);
                  }
                  v87 = v99;
                }
                else
                {
                  *id v88 = v90;
                  double v94 = v88 + 1;
                }
                uint64_t v101 = *(void *)[v13 quadPointCounts];
                v102 = v159;
                if ((unint64_t)v159 >= v160)
                {
                  VisionCoreHomography v104 = (char *)v158;
                  uint64_t v105 = (v159 - (unsigned char *)v158) >> 3;
                  unint64_t v106 = v105 + 1;
                  if ((unint64_t)(v105 + 1) >> 61) {
LABEL_155:
                  }
                    std::vector<unsigned long>::__throw_length_error[abi:ne180100]();
                  uint64_t v107 = v160 - (void)v158;
                  if ((uint64_t)(v160 - (void)v158) >> 2 > v106) {
                    unint64_t v106 = v107 >> 2;
                  }
                  BOOL v108 = (unint64_t)v107 >= 0x7FFFFFFFFFFFFFF8;
                  unint64_t v109 = 0x1FFFFFFFFFFFFFFFLL;
                  if (!v108) {
                    unint64_t v109 = v106;
                  }
                  if (v109)
                  {
                    unint64_t v109 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>(v109);
                    VisionCoreHomography v104 = (char *)v158;
                    v102 = v159;
                  }
                  else
                  {
                    uint64_t v110 = 0;
                  }
                  v111 = (char *)(v109 + 8 * v105);
                  *(void *)v111 = *(void *)(v101 + 8 * v90);
                  VisionCoreHomography v103 = v111 + 8;
                  while (v102 != v104)
                  {
                    uint64_t v112 = *((void *)v102 - 1);
                    v102 -= 8;
                    *((void *)v111 - 1) = v112;
                    v111 -= 8;
                  }
                  v158 = v111;
                  v159 = v103;
                  unint64_t v160 = v109 + 8 * v110;
                  if (v104) {
                    operator delete(v104);
                  }
                }
                else
                {
                  *(void *)v159 = *(void *)(v101 + 8 * v90);
                  VisionCoreHomography v103 = v102 + 8;
                }
                v159 = v103;
                id v88 = v94;
              }
              ++v90;
            }
            if (v165 != v164)
            {
              v114 = v158;
              uint64_t v113 = v159;
              VisionCoreHomography::VisionCoreHomography(&buf);
              std::vector<VisionCoreHomography>::vector(v157, (v113 - v114) >> 3, &buf);
              VisionCoreHomography::~VisionCoreHomography(&buf);
              __CGFloat x = 0;
              std::vector<int>::vector((std::vector<int> *)&buf, (v159 - (unsigned char *)v158) >> 3, &__x);
              LODWORD(v115) = 0.5;
              LODWORD(v116) = 1028443341;
              [a2 recursiveRansacSrcPts:&v164 DstPts:&v161 QuadsMatchingKptsCount:&v158 resultingHomographies:v157 groups:&buf inlierRatio:v116 ransacReprojErrorThreshold:v115];
              if (v88 != v87)
              {
                uint64_t v118 = 0;
                if ((unint64_t)(v88 - v87) <= 1) {
                  uint64_t v119 = 1;
                }
                else {
                  uint64_t v119 = v88 - v87;
                }
                v120 = v87;
                do
                {
                  uint64_t v121 = *v120++;
                  v122 = &retstr->var0[v121];
                  if (&v157[0][v118] != v122) {
                    VisionCoreHomography::copyHomography(&v157[0][v118], v122, v117);
                  }
                  ++v118;
                  --v119;
                }
                while (v119);
              }
              if (buf.var0.var0)
              {
                buf.var0.var1 = buf.var0.var0;
                operator delete(buf.var0.var0);
              }
              buf.var0.var0 = (float *)v157;
              std::vector<VisionCoreHomography>::__destroy_vector::operator()[abi:ne180100]((void ***)&buf);
            }
            if (v158)
            {
              v159 = (char *)v158;
              operator delete(v158);
            }
            if (v87) {
              operator delete(v87);
            }
            if (v161)
            {
              v162 = v161;
              operator delete(v161);
            }
            if (v164)
            {
              v165 = v164;
              operator delete(v164);
            }
          }
          v123 = *(_DWORD **)a8;
          v124 = (unsigned char *)*((void *)a8 + 1);
          id v61 = v140;
          id v14 = v141;
          if (v124 != *(unsigned char **)a8)
          {
            v125 = 0;
            uint64_t v126 = 0;
            unint64_t v127 = 0;
            v128 = 0;
            unint64_t v129 = 0;
            do
            {
              if (v123[v129] <= 0x7FFFFFFEu)
              {
                if ((unint64_t)v128 >= v127)
                {
                  uint64_t v130 = (v128 - v125) >> 2;
                  unint64_t v131 = v130 + 1;
                  if ((unint64_t)(v130 + 1) >> 62) {
                    std::vector<unsigned long>::__throw_length_error[abi:ne180100]();
                  }
                  if ((uint64_t)(v127 - (void)v125) >> 1 > v131) {
                    unint64_t v131 = (uint64_t)(v127 - (void)v125) >> 1;
                  }
                  if (v127 - (unint64_t)v125 >= 0x7FFFFFFFFFFFFFFCLL) {
                    unint64_t v132 = 0x3FFFFFFFFFFFFFFFLL;
                  }
                  else {
                    unint64_t v132 = v131;
                  }
                  if (v132)
                  {
                    unint64_t v132 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<int>>(v132);
                    v128 = (char *)v126;
                  }
                  else
                  {
                    uint64_t v133 = 0;
                  }
                  v134 = (char *)(v132 + 4 * v130);
                  *(_DWORD *)v134 = v129;
                  uint64_t v126 = (uint64_t)(v134 + 4);
                  while (v128 != v125)
                  {
                    int v135 = *((_DWORD *)v128 - 1);
                    v128 -= 4;
                    *((_DWORD *)v134 - 1) = v135;
                    v134 -= 4;
                  }
                  unint64_t v127 = v132 + 4 * v133;
                  if (v125) {
                    operator delete(v125);
                  }
                  v125 = v134;
                }
                else
                {
                  *(_DWORD *)v128 = v129;
                  uint64_t v126 = (uint64_t)(v128 + 4);
                }
                v123 = *(_DWORD **)a8;
                v124 = (unsigned char *)*((void *)a8 + 1);
                v128 = (char *)v126;
              }
              ++v129;
            }
            while (v129 < (v124 - (unsigned char *)v123) >> 2);
            id v61 = v140;
            if (v124 != (unsigned char *)v123)
            {
              uint64_t v136 = 0;
              unint64_t v137 = 0;
              do
              {
                if ((v123[v137] | 0x80000000) == 0xFFFFFFFF)
                {
                  v153 = 0;
                  v154 = 0;
                  uint64_t v155 = 0;
                  std::vector<int>::__init_with_size[abi:ne180100]<int *,int *>(&v153, v125, v126, (v126 - (uint64_t)v125) >> 2);
                  int v139 = [v13 findClosestQuadIndex:v137 candidateIndices:&v153];
                  if (v153)
                  {
                    v154 = v153;
                    operator delete(v153);
                  }
                  if (v139 != -1 && v137 != v139) {
                    VisionCoreHomography::copyHomography(&retstr->var0[v139], &retstr->var0[v136], v138);
                  }
                }
                ++v137;
                v123 = *(_DWORD **)a8;
                ++v136;
              }
              while (v137 < (uint64_t)(*((void *)a8 + 1) - *(void *)a8) >> 2);
            }
            id v14 = v141;
            if (v125) {
              operator delete(v125);
            }
          }
        }
        else
        {
LABEL_55:
          if (v75 >= 1) {
            bzero(*(void **)a8, 4 * (((unint64_t)v75 >> 2) - ((unint64_t)v75 > 3)) + 4);
          }
          uint64_t v79 = [v13 allSrcPoints];
          uint64_t v80 = [v13 allDstPoints];
          uint64_t v81 = [v13 quadPointCounts];
          LODWORD(v82) = v25;
          *(float *)&double v83 = v22;
          [a2 recursiveRansacSrcPts:v79 DstPts:v80 QuadsMatchingKptsCount:v81 resultingHomographies:retstr groups:a8 inlierRatio:v82 ransacReprojErrorThreshold:v83];
        }
        v84 = _VisionCoreSignpostLog();
        if (os_signpost_enabled(v84))
        {
          LOWORD(buf.var0.var0) = 0;
          _os_signpost_emit_with_name_impl(&dword_22B18B000, v84, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "VisionCoreSparseOpticalFlowEstimateSceneHG", "", (uint8_t *)&buf, 2u);
        }
      }
    }
  }
  return result;
}

+ (BOOL)_updateSession:(id)a3 referenceFrame:(__CVBuffer *)a4 error:(id *)a5
{
  id v6 = a3;
  v7 = [v6 mtlContext];
  double v8 = objc_msgSend(v7, "bindPixelBufferToMTL2DTexture:pixelFormat:plane:", a4, objc_msgSend((id)objc_opt_class(), "_mtlPixelFormatForBuffer:", a4), 0);
  [v6 updateReferenceTexture:v8 frame:a4];

  return 1;
}

+ (void)updateGroupingWithQuadsOnMemory:(id)a3 groups:(void *)a4
{
  id v5 = a3;
  id v6 = (uint64_t *)[v5 groupingMemoryQuadPointsCounts];
  uint64_t v8 = *v6;
  uint64_t v7 = v6[1];
  VisionCoreHomography::VisionCoreHomography(&v47);
  std::vector<VisionCoreHomography>::vector(v48, (v7 - v8) >> 3, &v47);
  VisionCoreHomography::~VisionCoreHomography(&v47);
  BOOL v9 = (void *)[v5 groupingMemoryQuadPointsCounts];
  std::vector<int>::size_type v10 = (uint64_t)(v9[1] - *v9) >> 3;
  __CGFloat x = 0;
  std::vector<int>::vector((std::vector<int> *)&v47, v10, &__x);
  uint64_t v11 = [v5 groupingMemorySrcPoints];
  uint64_t v12 = [v5 groupingMemoryDstPoints];
  uint64_t v13 = [v5 groupingMemoryQuadPointsCounts];
  LODWORD(v14) = 1036831949;
  LODWORD(v15) = 1042983595;
  [a1 recursiveRansacSrcPts:v11 DstPts:v12 QuadsMatchingKptsCount:v13 resultingHomographies:v48 groups:&v47 inlierRatio:v14 ransacReprojErrorThreshold:v15];
  uint64_t v16 = 0;
  uint64_t v17 = 0;
  unint64_t v41 = 0;
  for (unint64_t i = 0; ; ++i)
  {
    BOOL v19 = [v5 trackedQuads];
    unint64_t v20 = [v19 count];

    if (v20 <= i) {
      break;
    }
    uint64_t v21 = -1;
    do
    {
      float v22 = [v5 groupingMemoryQuadIDs];
      unint64_t v23 = [v22 count];

      if (v23 <= v21 + 1)
      {
        *(_DWORD *)(*(void *)a4 + 4 * i) = 0x7FFFFFFF;
        goto LABEL_24;
      }
      int v24 = [v5 groupingMemoryQuadIDs];
      int v25 = [v24 objectAtIndexedSubscript:v21 + 1];
      double v26 = [v5 trackedQuads];
      uint64_t v27 = [v26 objectAtIndexedSubscript:i];
      double v28 = [v27 UUID];

      ++v21;
    }
    while (v25 != v28);
    *(float *)(*(void *)a4 + 4 * i) = v47.var0.var0[v21];
    if ((unint64_t)v17 >= v41)
    {
      uint64_t v29 = (v17 - v16) >> 2;
      unint64_t v30 = v29 + 1;
      if ((unint64_t)(v29 + 1) >> 62) {
        std::vector<unsigned long>::__throw_length_error[abi:ne180100]();
      }
      if ((uint64_t)(v41 - (void)v16) >> 1 > v30) {
        unint64_t v30 = (uint64_t)(v41 - (void)v16) >> 1;
      }
      if (v41 - (unint64_t)v16 >= 0x7FFFFFFFFFFFFFFCLL) {
        unint64_t v31 = 0x3FFFFFFFFFFFFFFFLL;
      }
      else {
        unint64_t v31 = v30;
      }
      if (v31) {
        unint64_t v31 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<int>>(v31);
      }
      else {
        uint64_t v32 = 0;
      }
      double v33 = (char *)(v31 + 4 * v29);
      *(_DWORD *)double v33 = i;
      uint64_t v34 = v33 + 4;
      while (v17 != v16)
      {
        int v35 = *((_DWORD *)v17 - 1);
        v17 -= 4;
        *((_DWORD *)v33 - 1) = v35;
        v33 -= 4;
      }
      unint64_t v41 = v31 + 4 * v32;
      if (v16) {
        operator delete(v16);
      }
      uint64_t v16 = v33;
      uint64_t v17 = v34;
    }
    else
    {
      *(_DWORD *)uint64_t v17 = i;
      v17 += 4;
    }
LABEL_24:
    ;
  }
  for (unint64_t j = 0; ; ++j)
  {
    uint64_t v37 = [v5 trackedQuads];
    unint64_t v38 = [v37 count];

    if (v38 <= j) {
      break;
    }
    if (*(_DWORD *)(*(void *)a4 + 4 * j) == 0x7FFFFFFF)
    {
      __p = 0;
      v44 = 0;
      uint64_t v45 = 0;
      std::vector<int>::__init_with_size[abi:ne180100]<int *,int *>(&__p, v16, (uint64_t)v17, (v17 - v16) >> 2);
      int v39 = [v5 findClosestQuadIndex:j candidateIndices:&__p];
      if (__p)
      {
        v44 = __p;
        operator delete(__p);
      }
      if (v39 == -1) {
        int v40 = 0x7FFFFFFF;
      }
      else {
        int v40 = *(_DWORD *)(*(void *)a4 + 4 * v39);
      }
      *(_DWORD *)(*(void *)a4 + 4 * j) = v40;
    }
  }
  if (v16) {
    operator delete(v16);
  }
  if (v47.var0.var0)
  {
    v47.var0.var1 = v47.var0.var0;
    operator delete(v47.var0.var0);
  }
  v47.var0.var0 = (float *)v48;
  std::vector<VisionCoreHomography>::__destroy_vector::operator()[abi:ne180100]((void ***)&v47);
}

+ (vector<int,)getInlierCountsPerQuad:()vector<int inliers:(std:(SEL)a3 :(void *)a4 allocator<int>> *)result
{
  retstr->var0 = 0;
  retstr->var1 = 0;
  retstr->var2.var0 = 0;
  uint64_t v6 = *(void *)a4;
  if (*((void *)a4 + 1) != *(void *)a4)
  {
    uint64_t v8 = 0;
    BOOL v9 = 0;
    std::vector<int>::size_type v10 = 0;
    unint64_t v11 = 0;
    uint64_t v12 = 0;
    double v36 = a5;
    do
    {
      unint64_t v13 = (int)v12;
      BOOL v14 = v12 << 32 >= (uint64_t)0xFFFFFFFF00000001;
      uint64_t v15 = v12 & 0x3F;
      uint64_t v12 = *(void *)(v6 + 8 * v11) + (int)v12;
      uint64_t v16 = *(void *)a5;
      if (v14) {
        uint64_t v17 = v13 >> 6;
      }
      else {
        uint64_t v17 = -(uint64_t)((63 - v13) >> 6);
      }
      v18 = (int8x8_t *)(v16 + 8 * v17);
      if ((int)v12 < 0) {
        uint64_t v19 = -(uint64_t)((63 - v12) >> 6);
      }
      else {
        uint64_t v19 = v12 >> 6;
      }
      unint64_t v20 = (v12 & 0x3F) - v15 + 8 * (v16 + 8 * v19 - (void)v18);
      int v21 = v13 & 0x3F;
      if (v21)
      {
        unint64_t v22 = (64 - v21);
        if (v22 >= v20) {
          unint64_t v23 = v20;
        }
        else {
          unint64_t v23 = v22;
        }
        uint64_t v24 = (uint64_t)*v18++;
        uint8x8_t v25 = (uint8x8_t)vcnt_s8((int8x8_t)((0xFFFFFFFFFFFFFFFFLL >> (v22 - v23)) & (-1 << v15) & v24));
        v25.i16[0] = vaddlv_u8(v25);
        int v26 = v25.i32[0];
        v20 -= v23;
      }
      else
      {
        int v26 = 0;
      }
      if (v20 >= 0x40)
      {
        do
        {
          int8x8_t v27 = *v18++;
          uint8x8_t v28 = (uint8x8_t)vcnt_s8(v27);
          v28.i16[0] = vaddlv_u8(v28);
          v26 += v28.i32[0];
          v20 -= 64;
        }
        while (v20 > 0x3F);
      }
      if (v20)
      {
        uint8x8_t v29 = (uint8x8_t)vcnt_s8((int8x8_t)(*(void *)v18 & (0xFFFFFFFFFFFFFFFFLL >> -(char)v20)));
        v29.i16[0] = vaddlv_u8(v29);
        v26 += v29.i32[0];
      }
      if (v8 >= v10)
      {
        uint64_t v31 = v8 - v9;
        unint64_t v32 = v31 + 1;
        if ((unint64_t)(v31 + 1) >> 62) {
          std::vector<unsigned long>::__throw_length_error[abi:ne180100]();
        }
        if (((char *)v10 - (char *)v9) >> 1 > v32) {
          unint64_t v32 = ((char *)v10 - (char *)v9) >> 1;
        }
        if ((unint64_t)((char *)v10 - (char *)v9) >= 0x7FFFFFFFFFFFFFFCLL) {
          result = (vector<int, std::allocator<int>> *)0x3FFFFFFFFFFFFFFFLL;
        }
        else {
          result = (vector<int, std::allocator<int>> *)v32;
        }
        if (result) {
          result = (vector<int, std::allocator<int>> *)std::__allocate_at_least[abi:ne180100]<std::allocator<int>>((unint64_t)result);
        }
        else {
          uint64_t v33 = 0;
        }
        uint64_t v34 = (int *)((char *)result + 4 * v31);
        *uint64_t v34 = v26;
        unint64_t v30 = v34 + 1;
        while (v8 != v9)
        {
          int v35 = *--v8;
          *--uint64_t v34 = v35;
        }
        std::vector<int>::size_type v10 = (int *)((char *)result + 4 * v33);
        retstr->var0 = v34;
        retstr->var1 = v30;
        retstr->var2.var0 = v10;
        if (v9) {
          operator delete(v9);
        }
        BOOL v9 = v34;
        a5 = v36;
      }
      else
      {
        int *v8 = v26;
        unint64_t v30 = v8 + 1;
      }
      retstr->var1 = v30;
      ++v11;
      uint64_t v6 = *(void *)a4;
      uint64_t v8 = v30;
    }
    while (v11 < (uint64_t)(*((void *)a4 + 1) - *(void *)a4) >> 3);
  }
  return result;
}

+ (void)recursiveRansacSrcPts:(void *)a3 DstPts:(void *)a4 QuadsMatchingKptsCount:(void *)a5 resultingHomographies:(void *)a6 groups:(void *)a7 inlierRatio:(float)a8 ransacReprojErrorThreshold:(float)a9
{
  if (*((void *)a3 + 1) - *(void *)a3 < 8uLL || *((void *)a7 + 1) == *(void *)a7 || **(int **)a7 >= 2)
  {
    if (*((void *)a5 + 1) != *(void *)a5)
    {
      uint64_t v12 = 0;
      unint64_t v13 = 0;
      do
      {
        VisionCoreHomography::VisionCoreHomography(&v114);
        VisionCoreHomography::operator=(*(void *)a6 + v12, (long long *)&v114);
        VisionCoreHomography::~VisionCoreHomography(&v114);
        *(_DWORD *)(*(void *)a7 + 4 * v13++) = 0x7FFFFFFF;
        v12 += 136;
      }
      while (v13 < (uint64_t)(*((void *)a5 + 1) - *(void *)a5) >> 3);
    }
    return;
  }
  *(float *)&double v18 = a9;
  objc_msgSend(a1, "_estimateTransformSrcPts:DstPts:ransacReprojErrorThreshold:", v18);
  [a1 getInlierCountsPerQuad:a5 inliers:&v114.var3];
  unint64_t v20 = *(int **)a5;
  uint64_t v19 = *((void *)a5 + 1);
  unint64_t v110 = 0;
  uint64_t v111 = 0;
  unint64_t v109 = 0;
  uint64_t v21 = v19 - (void)v20;
  id v89 = a1;
  if (v21)
  {
    unint64_t v22 = v21 >> 3;
    std::vector<BOOL>::__vallocate[abi:ne180100](&v109, v21 >> 3);
    unint64_t v23 = v110;
    unint64_t v24 = v110 + v22;
    v110 += v22;
    if (v23)
    {
      unint64_t v25 = v24 - 1;
      if (((v24 - 1) ^ (v23 - 1)) <= 0x3F)
      {
        int v26 = v109;
LABEL_18:
        uint8x8_t v29 = &v26[v23 >> 6];
        if ((v23 & 0x3F) != 0)
        {
          if (64 - (v23 & 0x3F) >= v22) {
            unint64_t v30 = v22;
          }
          else {
            unint64_t v30 = 64 - (v23 & 0x3F);
          }
          *v29++ &= ~((0xFFFFFFFFFFFFFFFFLL >> (64 - (v23 & 0x3Fu) - v30)) & (-1 << v23));
          v22 -= v30;
        }
        unint64_t v31 = v22 >> 6;
        if (v22 >= 0x40) {
          bzero(v29, 8 * v31);
        }
        if ((v22 & 0x3F) != 0) {
          v29[v31] &= ~(0xFFFFFFFFFFFFFFFFLL >> -(v22 & 0x3F));
        }
        goto LABEL_27;
      }
    }
    else
    {
      unint64_t v25 = v24 - 1;
    }
    int v26 = v109;
    unint64_t v27 = v25 >> 6;
    if (v24 >= 0x41) {
      unint64_t v28 = v27;
    }
    else {
      unint64_t v28 = 0;
    }
    *((void *)v109 + v28) = 0;
    goto LABEL_18;
  }
  int v26 = 0;
LABEL_27:
  unint64_t v32 = (int *)v112;
  uint64_t v33 = v113;
  uint64_t v34 = *(int **)a5;
  if (v112 != v113)
  {
    int v35 = 0;
    double v36 = *(int **)a5;
    do
    {
      uint64_t v37 = 1 << v35;
      if ((float)((float)*v32 / (float)*v36) >= a8) {
        uint64_t v38 = *v26 & ~v37;
      }
      else {
        uint64_t v38 = *v26 | v37;
      }
      *int v26 = v38;
      ++v32;
      v36 += 2;
      v26 += v35 == 63;
      if (v35 == 63) {
        int v35 = 0;
      }
      else {
        ++v35;
      }
    }
    while (v32 != v33);
  }
  int v39 = (int *)*((void *)a5 + 1);
  int v40 = 0;
  unint64_t v41 = 0;
  if (v39 == v34)
  {
    unint64_t v51 = ((char *)v39 - (char *)v34) >> 3;
    int v39 = v34;
  }
  else
  {
    unint64_t v42 = 0;
    unint64_t v43 = 0;
    do
    {
      if ((*(void *)((char *)v109 + ((v43 >> 3) & 0x1FFFFFFFFFFFFFF8)) >> v43))
      {
        if ((unint64_t)v41 >= v42)
        {
          uint64_t v45 = (v41 - v40) >> 2;
          unint64_t v46 = v45 + 1;
          if ((unint64_t)(v45 + 1) >> 62) {
            std::vector<unsigned long>::__throw_length_error[abi:ne180100]();
          }
          if ((uint64_t)(v42 - (void)v40) >> 1 > v46) {
            unint64_t v46 = (uint64_t)(v42 - (void)v40) >> 1;
          }
          if (v42 - (unint64_t)v40 >= 0x7FFFFFFFFFFFFFFCLL) {
            unint64_t v47 = 0x3FFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v47 = v46;
          }
          if (v47) {
            unint64_t v47 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<int>>(v47);
          }
          else {
            uint64_t v48 = 0;
          }
          BOOL v49 = (char *)(v47 + 4 * v45);
          *(_DWORD *)BOOL v49 = v43;
          v44 = v49 + 4;
          while (v41 != v40)
          {
            int v50 = *((_DWORD *)v41 - 1);
            v41 -= 4;
            *((_DWORD *)v49 - 1) = v50;
            v49 -= 4;
          }
          unint64_t v42 = v47 + 4 * v48;
          if (v40) {
            operator delete(v40);
          }
          int v40 = v49;
        }
        else
        {
          *(_DWORD *)unint64_t v41 = v43;
          v44 = v41 + 4;
        }
        uint64_t v34 = *(int **)a5;
        int v39 = (int *)*((void *)a5 + 1);
        unint64_t v41 = v44;
      }
      ++v43;
      unint64_t v51 = ((char *)v39 - (char *)v34) >> 3;
    }
    while (v51 > v43);
  }
  if (v51 == (v41 - v40) >> 2)
  {
    if (v39 != v34)
    {
      uint64_t v52 = 0;
      unint64_t v53 = 0;
      do
      {
        VisionCoreHomography::VisionCoreHomography(&v108);
        VisionCoreHomography::operator=(*(void *)a6 + v52, (long long *)&v108);
        VisionCoreHomography::~VisionCoreHomography(&v108);
        *(_DWORD *)(*(void *)a7 + 4 * v53++) = 0x7FFFFFFF;
        v52 += 136;
      }
      while (v53 < (uint64_t)(*((void *)a5 + 1) - *(void *)a5) >> 3);
    }
  }
  else
  {
    VisionCoreHomography::VisionCoreHomography(&v108);
    std::vector<VisionCoreHomography>::vector(&v106, (v41 - v40) >> 2, &v108);
    VisionCoreHomography::~VisionCoreHomography(&v108);
    __x[0] = **(_DWORD **)a7 + 1;
    std::vector<int>::vector((std::vector<int> *)&v108, (v41 - v40) >> 2, __x);
    *(void *)__CGFloat x = 0;
    VisionCoreHomography v104 = 0;
    uint64_t v105 = 0;
    unint64_t v100 = 0;
    uint64_t v101 = 0;
    uint64_t v102 = 0;
    unint64_t v97 = 0;
    uint64_t v98 = 0;
    uint64_t v99 = 0;
    double v94 = 0;
    uint64_t v95 = 0;
    uint64_t v96 = 0;
    __p = 0;
    id v92 = 0;
    unint64_t v93 = 0;
    v56 = *(int **)a5;
    if (*((void *)a5 + 1) != *(void *)a5)
    {
      unint64_t v57 = 0;
      uint64_t v58 = 0;
      v59 = (char *)v109;
      do
      {
        uint64_t v60 = v58 << 32;
        uint64_t v61 = (int)v58;
        uint64_t v58 = 2 * *(void *)&v56[2 * v57] + (int)v58;
        uint64_t v62 = (_WORD *)(*(void *)a3 + (v60 >> 31));
        uint64_t v63 = (_WORD *)(*(void *)a3 + 2 * (int)v58);
        if ((*(void *)&v59[(v57 >> 3) & 0x1FFFFFFFFFFFFFF8] >> v57))
        {
          std::__unwrap_and_dispatch[abi:ne180100]<std::__overload<std::__copy_loop<std::_ClassicAlgPolicy>,std::__copy_trivial>,std::__wrap_iter<half *>,std::__wrap_iter<half *>,std::back_insert_iterator<std::vector<half>>,0>(v62, v63, (uint64_t)__x);
          std::__unwrap_and_dispatch[abi:ne180100]<std::__overload<std::__copy_loop<std::_ClassicAlgPolicy>,std::__copy_trivial>,std::__wrap_iter<half *>,std::__wrap_iter<half *>,std::back_insert_iterator<std::vector<half>>,0>((_WORD *)(*(void *)a4 + 2 * v61), (_WORD *)(*(void *)a4 + 2 * (int)v58), (uint64_t)&v100);
          uint64_t v65 = *(int **)a5;
          int64_t v66 = v92;
          if ((unint64_t)v92 >= v93)
          {
            double v68 = (char *)__p;
            uint64_t v69 = (v92 - (unsigned char *)__p) >> 3;
            unint64_t v70 = v69 + 1;
            if ((unint64_t)(v69 + 1) >> 61) {
              std::vector<unsigned long>::__throw_length_error[abi:ne180100]();
            }
            uint64_t v71 = v93 - (void)__p;
            if ((uint64_t)(v93 - (void)__p) >> 2 > v70) {
              unint64_t v70 = v71 >> 2;
            }
            BOOL v72 = (unint64_t)v71 >= 0x7FFFFFFFFFFFFFF8;
            unint64_t v73 = 0x1FFFFFFFFFFFFFFFLL;
            if (!v72) {
              unint64_t v73 = v70;
            }
            if (v73)
            {
              unint64_t v73 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>(v73);
              double v68 = (char *)__p;
              int64_t v66 = v92;
            }
            else
            {
              uint64_t v74 = 0;
            }
            uint64_t v75 = (char *)(v73 + 8 * v69);
            *(void *)uint64_t v75 = *(void *)&v65[2 * v57];
            uint64_t v67 = v75 + 8;
            while (v66 != v68)
            {
              uint64_t v76 = *((void *)v66 - 1);
              v66 -= 8;
              *((void *)v75 - 1) = v76;
              v75 -= 8;
            }
            __p = v75;
            id v92 = v67;
            unint64_t v93 = v73 + 8 * v74;
            if (v68) {
              operator delete(v68);
            }
          }
          else
          {
            *(void *)id v92 = *(void *)&v65[2 * v57];
            uint64_t v67 = v66 + 8;
          }
          id v92 = v67;
        }
        else
        {
          std::__unwrap_and_dispatch[abi:ne180100]<std::__overload<std::__copy_loop<std::_ClassicAlgPolicy>,std::__copy_trivial>,std::__wrap_iter<half *>,std::__wrap_iter<half *>,std::back_insert_iterator<std::vector<half>>,0>(v62, v63, (uint64_t)&v97);
          std::__unwrap_and_dispatch[abi:ne180100]<std::__overload<std::__copy_loop<std::_ClassicAlgPolicy>,std::__copy_trivial>,std::__wrap_iter<half *>,std::__wrap_iter<half *>,std::back_insert_iterator<std::vector<half>>,0>((_WORD *)(*(void *)a4 + 2 * v61), (_WORD *)(*(void *)a4 + 2 * (int)v58), (uint64_t)&v94);
        }
        ++v57;
        v56 = *(int **)a5;
        double v77 = (int *)*((void *)a5 + 1);
      }
      while (v57 < ((uint64_t)v77 - *(void *)a5) >> 3);
      if (v77 != v56)
      {
        uint64_t v78 = 0;
        unint64_t v79 = 0;
        uint64_t v80 = (char *)v109;
        do
        {
          if (((*(void *)&v80[(v79 >> 3) & 0x1FFFFFFFFFFFFFF8] >> v79) & 1) == 0)
          {
            uint64_t v81 = (VisionCoreHomography *)(*(void *)a6 + v78);
            if (v81 != &v114)
            {
              VisionCoreHomography::copyHomography(&v114, v81, v64);
              v56 = *(int **)a5;
              double v77 = (int *)*((void *)a5 + 1);
            }
          }
          ++v79;
          v78 += 136;
        }
        while (v79 < ((char *)v77 - (char *)v56) >> 3);
      }
    }
    *(float *)&double v55 = a9 + a9;
    *(float *)&double v54 = a8;
    [v89 recursiveRansacSrcPts:__x DstPts:&v100 QuadsMatchingKptsCount:&__p resultingHomographies:&v106 groups:&v108 inlierRatio:v54 ransacReprojErrorThreshold:v55];
    v84 = v106;
    double v83 = v107;
    if (v107 != v106)
    {
      uint64_t v85 = 0;
      unint64_t v86 = 0;
      do
      {
        uint64_t v87 = *(int *)&v40[4 * v86];
        id v88 = (const VisionCoreHomography *)(*(void *)a6 + 136 * (int)v87);
        if (&v84[v85] != v88)
        {
          VisionCoreHomography::copyHomography(&v84[v85], v88, v82);
          uint64_t v87 = *(int *)&v40[4 * v86];
          v84 = v106;
          double v83 = v107;
        }
        *(float *)(*(void *)a7 + 4 * v87) = v108.var0.var0[v86++];
        ++v85;
      }
      while (0xF0F0F0F0F0F0F0F1 * (((char *)v83 - (char *)v84) >> 3) > v86);
    }
    if (__p)
    {
      id v92 = (char *)__p;
      operator delete(__p);
    }
    if (v94)
    {
      uint64_t v95 = v94;
      operator delete(v94);
    }
    if (v97)
    {
      uint64_t v98 = v97;
      operator delete(v97);
    }
    if (v100)
    {
      uint64_t v101 = v100;
      operator delete(v100);
    }
    if (*(void *)__x)
    {
      VisionCoreHomography v104 = *(void **)__x;
      operator delete(*(void **)__x);
    }
    if (v108.var0.var0)
    {
      v108.var0.var1 = v108.var0.var0;
      operator delete(v108.var0.var0);
    }
    v108.var0.var0 = (float *)&v106;
    std::vector<VisionCoreHomography>::__destroy_vector::operator()[abi:ne180100]((void ***)&v108);
  }
  if (v40) {
    operator delete(v40);
  }
  if (v109) {
    operator delete(v109);
  }
  if (v112)
  {
    uint64_t v113 = (int *)v112;
    operator delete(v112);
  }
  VisionCoreHomography::~VisionCoreHomography(&v114);
}

+ (id)quadsConformHomographySrcQuads:(id)a3 destQuads:(id)a4 reprojError:(float)a5
{
  id v8 = a3;
  id v9 = a4;
  std::vector<CGPoint>::vector(&v86, 4 * [v8 count]);
  std::vector<CGPoint>::vector(v85, 4 * [v9 count]);
  std::vector<half>::vector(v84, 8 * [v8 count]);
  std::vector<half>::vector(v83, 8 * [v9 count]);
  unint64_t v10 = [v8 count];
  unint64_t v11 = v10;
  uint64_t v80 = 0;
  uint64_t v81 = 0;
  double v82 = 0;
  if (v10)
  {
    if (v10 >> 61) {
      std::vector<unsigned long>::__throw_length_error[abi:ne180100]();
    }
    uint64_t v12 = std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>(v10);
    uint64_t v80 = v12;
    double v82 = &v12[v13];
    BOOL v14 = &v12[v11];
    uint64_t v15 = 8 * v11;
    do
    {
      *v12++ = 4;
      v15 -= 8;
    }
    while (v15);
    uint64_t v81 = v14;
  }
  unint64_t v16 = [v8 count];
  VisionCoreHomography::VisionCoreHomography(&v78);
  std::vector<VisionCoreHomography>::vector(v79, v16, &v78);
  VisionCoreHomography::~VisionCoreHomography(&v78);
  __CGFloat x = 0;
  std::vector<int>::vector((std::vector<int> *)&v78, [v8 count], &__x);
  unint64_t v17 = 0;
  unsigned int v18 = 3;
  while ([v8 count] > v17)
  {
    uint64_t v19 = [v8 objectAtIndexedSubscript:v17];
    [v19 topLeft];
    uint64_t v20 = v18 - 3;
    uint64_t v21 = &v86[16 * v20];
    *(void *)uint64_t v21 = v22;
    *((void *)v21 + 1) = v23;

    unint64_t v24 = [v8 objectAtIndexedSubscript:v17];
    [v24 topRight];
    uint64_t v25 = v18 - 2;
    int v26 = &v86[16 * v25];
    *(void *)int v26 = v27;
    *((void *)v26 + 1) = v28;

    uint8x8_t v29 = [v8 objectAtIndexedSubscript:v17];
    [v29 bottomLeft];
    uint64_t v30 = v18 - 1;
    unint64_t v31 = &v86[16 * v30];
    *(void *)unint64_t v31 = v32;
    *((void *)v31 + 1) = v33;

    uint64_t v34 = [v8 objectAtIndexedSubscript:v17];
    [v34 bottomRight];
    int v35 = &v86[16 * v18];
    *(void *)int v35 = v36;
    *((void *)v35 + 1) = v37;

    uint64_t v38 = [v9 objectAtIndexedSubscript:v17];
    [v38 topLeft];
    int v39 = (char *)v85[0] + 16 * v20;
    *int v39 = v40;
    v39[1] = v41;

    unint64_t v42 = [v9 objectAtIndexedSubscript:v17];
    [v42 topRight];
    unint64_t v43 = (char *)v85[0] + 16 * v25;
    void *v43 = v44;
    v43[1] = v45;

    unint64_t v46 = [v9 objectAtIndexedSubscript:v17];
    [v46 bottomLeft];
    unint64_t v47 = (char *)v85[0] + 16 * v30;
    void *v47 = v48;
    v47[1] = v49;

    int v50 = [v9 objectAtIndexedSubscript:v17];
    [v50 bottomRight];
    unint64_t v51 = (char *)v85[0] + 16 * v18;
    *unint64_t v51 = v52;
    v51[1] = v53;

    ++v17;
    v18 += 4;
  }
  if (v87 != v86)
  {
    unint64_t v54 = (v87 - v86) >> 4;
    if (v54 <= 1) {
      unint64_t v54 = 1;
    }
    double v55 = (uint64_t *)((char *)v85[0] + 8);
    v56 = (uint64_t *)(v86 + 8);
    unint64_t v57 = (char *)v83[0] + 2;
    uint64_t v58 = (char *)v84[0] + 2;
    do
    {
      _D0 = *(v56 - 1);
      __asm { FCVT            H0, D0 }
      *(v58 - 1) = _D0;
      uint64_t v64 = *v56;
      v56 += 2;
      _D0 = v64;
      __asm { FCVT            H0, D0 }
      _WORD *v58 = _D0;
      _D0 = *(v55 - 1);
      __asm { FCVT            H0, D0 }
      *(v57 - 1) = _D0;
      uint64_t v67 = *v55;
      v55 += 2;
      _D0 = v67;
      __asm { FCVT            H0, D0 }
      *unint64_t v57 = _D0;
      v57 += 2;
      v58 += 2;
      --v54;
    }
    while (v54);
  }
  if ([v8 count])
  {
    LODWORD(v69) = 1.0;
    *(float *)&double v70 = a5;
    [a1 recursiveRansacSrcPts:v84 DstPts:v83 QuadsMatchingKptsCount:&v80 resultingHomographies:v79 groups:&v78 inlierRatio:v69 ransacReprojErrorThreshold:v70];
  }
  id v71 = objc_alloc(MEMORY[0x263EFF980]);
  BOOL v72 = (void *)[v71 initWithCapacity:v78.var0.var1 - v78.var0.var0];
  var1 = v78.var0.var1;
  if (v78.var0.var1 != v78.var0.var0)
  {
    unint64_t v74 = 0;
    var1 = v78.var0.var0;
    do
    {
      uint64_t v75 = [NSNumber numberWithInt:LODWORD(var1[v74])];
      [v72 addObject:v75];

      ++v74;
      var1 = v78.var0.var0;
    }
    while (v74 < v78.var0.var1 - v78.var0.var0);
  }
  if (var1)
  {
    v78.var0.var1 = var1;
    operator delete(var1);
  }
  v78.var0.var0 = (float *)v79;
  std::vector<VisionCoreHomography>::__destroy_vector::operator()[abi:ne180100]((void ***)&v78);
  if (v80)
  {
    uint64_t v81 = v80;
    operator delete(v80);
  }
  if (v83[0])
  {
    v83[1] = v83[0];
    operator delete(v83[0]);
  }
  if (v84[0])
  {
    v84[1] = v84[0];
    operator delete(v84[0]);
  }
  if (v85[0])
  {
    v85[1] = v85[0];
    operator delete(v85[0]);
  }
  if (v86)
  {
    uint64_t v87 = v86;
    operator delete(v86);
  }

  return v72;
}

+ (VisionCoreHomography)_estimateTransformSrcPts:(SEL)a3 DstPts:(void *)a4 ransacReprojErrorThreshold:(void *)a5
{
  uint64_t v171 = *MEMORY[0x263EF8340];
  uint64_t v11 = *(void *)a4;
  uint64_t v10 = *((void *)a4 + 1);
  retstr->var0.var0 = 0;
  retstr->var0.var1 = 0;
  retstr->var0.size_t var2 = 0;
  retstr->var1.var0 = 0;
  retstr->var1.var1 = 0;
  retstr->var1.size_t var2 = 0;
  retstr->var2.var0 = 0;
  retstr->var2.var1 = 0;
  retstr->var2.var2.var0 = 0;
  uint64_t v12 = (float *)operator new(0x24uLL);
  retstr->var2.var0 = v12;
  v12[8] = 1.0;
  *(_OWORD *)uint64_t v12 = xmmword_22B1BF5C0;
  *((_OWORD *)v12 + 1) = unk_22B1BF5D0;
  retstr->var2.var1 = v12 + 9;
  retstr->var2.var2.var0 = v12 + 9;
  *(_OWORD *)&retstr->var3.var0 = 0u;
  *(_OWORD *)&retstr->var3.var2.var0 = 0u;
  *(_OWORD *)&retstr->var4.var1 = 0u;
  uint64_t v13 = (char *)operator new(0x24uLL);
  *((_DWORD *)v13 + 8) = 1065353216;
  *(_OWORD *)uint64_t v13 = xmmword_22B1BF5C0;
  *((_OWORD *)v13 + 1) = unk_22B1BF5D0;
  retstr->var4.var0 = (float *)v13;
  retstr->var4.var1 = (float *)(v13 + 36);
  *(void *)&retstr->var5.var0 = 0;
  *(void *)&retstr->var5.size_t var2 = 0;
  retstr->var4.var2.var0 = (float *)(v13 + 36);
  Geometry2D_mallocCart2D(&v167, (unint64_t)(v10 - v11) >> 2);
  *(_OWORD *)&retstr->var0.var0 = v167;
  *(void *)&retstr->var0.size_t var2 = v168;
  Geometry2D_mallocCart2D(&v167, (unint64_t)(v10 - v11) >> 2);
  *(_OWORD *)&retstr->var1.var0 = v167;
  *(void *)&retstr->var1.size_t var2 = v168;
  retstr->var5.size_t var2 = 1000;
  *(void *)&retstr->var5.var0 = 0x3BA3D70A00000004;
  retstr->var5.float var3 = a6;
  uint64_t v14 = *((void *)a4 + 1) - *(void *)a4;
  size_t var2 = retstr->var0.var2;
  if ((unint64_t)v14 >= 4)
  {
    uint64_t v16 = 0;
    uint64_t v17 = 0;
    var0 = retstr->var0.var0;
    var1 = retstr->var0.var1;
    int v20 = retstr->var1.var2;
    unint64_t v21 = (unint64_t)(v14 >> 1) >> 1;
    uint64_t v22 = retstr->var1.var0;
    uint64_t v23 = retstr->var1.var1;
    if (v21 <= 1) {
      unint64_t v21 = 1;
    }
    unint64_t v24 = (__int16 *)(*(void *)a5 + 2);
    uint64_t v25 = (__int16 *)(*(void *)a4 + 2);
    do
    {
      if ((int)var2 > (int)v17)
      {
        _H0 = *v25;
        __asm { FCVT            S0, H0 }
        _H1 = *(v25 - 1);
        uint64_t v33 = v16 >> 30;
        __asm { FCVT            S1, H1 }
        *(_DWORD *)((char *)var0 + v33) = _S1;
        *(_DWORD *)((char *)var1 + v33) = _S0;
      }
      if (v20 > (int)v17)
      {
        _H0 = *v24;
        __asm { FCVT            S0, H0 }
        _H1 = *(v24 - 1);
        uint64_t v38 = v16 >> 30;
        __asm { FCVT            S1, H1 }
        *(_DWORD *)((char *)v22 + v38) = _S1;
        *(_DWORD *)((char *)v23 + v38) = _S0;
      }
      ++v17;
      v16 += 0x100000000;
      v24 += 2;
      v25 += 2;
    }
    while (v21 != v17);
  }
  uint64_t v40 = malloc_type_calloc(var2, 1uLL, 0x100004077774924uLL);
  std::vector<BOOL>::reserve((uint64_t)&retstr->var3, retstr->var0.var2);
  int v41 = retstr->var0.var2;
  if (v41 <= 3)
  {
    std::vector<float>::__assign_with_size[abi:ne180100]<float *,float *>((char *)&retstr->var2, (char *)retstr->var4.var0, (uint64_t)retstr->var4.var1, retstr->var4.var1 - retstr->var4.var0);
    uint64_t v42 = retstr->var0.var2;
    if (v42)
    {
      unint64_t v43 = v40;
      do
      {
        std::vector<BOOL>::push_back((uint64_t *)&retstr->var3, v43++);
        --v42;
      }
      while (v42);
    }
    goto LABEL_106;
  }
  if (!retstr->var0.var0) {
    goto LABEL_99;
  }
  uint64_t v44 = 0;
  uint64_t v45 = 1917;
  if (!retstr->var0.var1)
  {
LABEL_100:
    unint64_t v46 = 0;
    unint64_t v47 = 0;
    goto LABEL_101;
  }
  unint64_t v46 = 0;
  unint64_t v47 = 0;
  if (!retstr->var1.var0) {
    goto LABEL_101;
  }
  if (!retstr->var1.var1)
  {
LABEL_99:
    uint64_t v44 = 0;
    unint64_t v46 = 0;
    unint64_t v47 = 0;
    uint64_t v45 = 1917;
    goto LABEL_101;
  }
  uint64_t v44 = 0;
  uint64_t v45 = 1917;
  if (!v40) {
    goto LABEL_100;
  }
  int v48 = retstr->var1.var2;
  unint64_t v46 = 0;
  unint64_t v47 = 0;
  if (v48 >= 1)
  {
    if (v41 != v48)
    {
      uint64_t v44 = 0;
      unint64_t v46 = 0;
      unint64_t v47 = 0;
LABEL_108:
      uint64_t v45 = 1916;
      goto LABEL_101;
    }
    uint64_t v49 = retstr->var2.var0;
    __CLPK_integer v50 = Geometry2D_estimateWorkBufferSize(4);
    if (v50 < 0)
    {
      uint64_t v44 = 0;
      unint64_t v46 = 0;
      unint64_t v47 = 0;
      uint64_t v45 = 1903;
      goto LABEL_101;
    }
    __CLPK_integer v51 = v50;
    uint64_t v44 = (__CLPK_real *)malloc_type_malloc(4 * v50, 0x100004052888210uLL);
    if (v44)
    {
      id v141 = 0;
      v142 = 0;
      uint64_t v143 = 0;
      Geometry2D_mallocCart2D(&v141, 4);
      unint64_t v46 = 0;
      uint64_t v45 = 1915;
      if (!v141
        || !v142
        || (int)v143 < 1
        || (v138 = 0, v139 = 0, v140 = 0, Geometry2D_mallocCart2D(&v138, 4), v46 = 0, uint64_t v45 = 1915, !v138)
        || !v139
        || (int)v140 < 1)
      {
        unint64_t v47 = 0;
        goto LABEL_101;
      }
      unint64_t v46 = (float *)malloc_type_malloc(4 * retstr->var0.var2, 0x100004052888210uLL);
      if (v46)
      {
        __CLPK_integer v127 = v51;
        uint64_t v52 = (BOOL *)malloc_type_malloc(retstr->var0.var2, 0x100004077774924uLL);
        unint64_t v47 = v52;
        if (v52)
        {
          if (retstr->var0.var2 >= 4)
          {
            uint64_t v121 = v49;
            __src = v52;
            v124 = v46;
            uint64_t v53 = 0;
            int v54 = retstr->var5.var2;
            unint64_t v161 = 0;
            unint64_t v162 = 0;
            do
            {
              *(_DWORD *)((char *)&v161 + v53) = arc4random();
              v53 += 4;
            }
            while (v53 != 16);
            if ((v54 - 1) >= 0x7FFFFFFE) {
              int v55 = 0x7FFFFFFF;
            }
            else {
              int v55 = v54;
            }
            int __n = v55;
            if (v55 >= 1)
            {
              int v56 = 0;
              int v122 = 0;
              int v57 = HIDWORD(v161);
              unsigned int v58 = v161;
              int v59 = v162;
              unsigned int v60 = HIDWORD(v162);
              while (1)
              {
                uint64_t v61 = 0;
                unsigned int v62 = retstr->var0.var2;
                int v63 = v57;
                do
                {
                  HIDWORD(v64) = 5 * v63;
                  LODWORD(v64) = 5 * v63;
                  unsigned int v65 = 9 * (v64 >> 25) % v62;
                  if (v61)
                  {
                    while (1)
                    {
                      uint64_t v66 = 0;
                      while (v163[v66] != v65)
                      {
                        if (v61 == ++v66) {
                          goto LABEL_49;
                        }
                      }
                      if (v65 + 1 == v62) {
                        unsigned int v65 = 0;
                      }
                      else {
                        ++v65;
                      }
                    }
                  }
LABEL_49:
                  int v67 = v59 ^ v58;
                  int v57 = v59 ^ v58 ^ v63;
                  v58 ^= v60 ^ v63;
                  HIDWORD(v68) = v60 ^ v63;
                  LODWORD(v68) = v60 ^ v63;
                  unsigned int v60 = v68 >> 21;
                  int v59 = v67 ^ (v63 << 9);
                  v163[v61++] = v65;
                  v63 ^= v67;
                }
                while (v61 != 4);
                unsigned int v128 = v60;
                int v129 = v59;
                int v130 = v56;
                unint64_t v69 = 0;
                double v70 = retstr->var0.var0;
                id v71 = retstr->var0.var1;
                BOOL v72 = (char *)v141;
                unint64_t v73 = (char *)v142;
                unint64_t v74 = retstr->var1.var0;
                uint64_t v75 = retstr->var1.var1;
                uint64_t v76 = (char *)v138;
                double v77 = (char *)v139;
                do
                {
                  uint64_t v78 = (int)v163[v69 / 4];
                  *(float *)&v72[v69] = v70[v78];
                  *(float *)&v73[v69] = v71[v78];
                  *(float *)&v76[v69] = v74[v78];
                  *(float *)&v77[v69] = v75[v78];
                  v69 += 4;
                }
                while (v69 != 16);
                int v169 = 0;
                long long v167 = 0u;
                long long v168 = 0u;
                uint64_t v45 = Geometry2D_estimateHomographyMSS((uint64_t)&v141, (uint64_t)&v138, v44, v127, (uint64_t)&v167);
                if ((v45 & 0x80) == 0) {
                  goto LABEL_116;
                }
                LODWORD(v164) = 0;
                uint64_t v45 = Geometry2D_computeAdjointAndDeterminant((float *)&v167, __s, (float *)&v164);
                if ((v45 & 0x80) == 0) {
                  goto LABEL_124;
                }
                if (fabsf(*(float *)&v164) > 0.00000011921)
                {
                  uint64_t v45 = Geometry2D_symmetricReprojectionErrorHomography((uint64_t)retstr, (float *)&v167, (const float **)&retstr->var1.var0, v124);
                  if ((v45 & 0x80) == 0) {
                    goto LABEL_124;
                  }
                  uint64_t v79 = retstr->var0.var2;
                  if ((int)v79 < 1)
                  {
                    int v80 = 0;
                  }
                  else
                  {
                    int v80 = 0;
                    float var3 = retstr->var5.var3;
                    double v83 = __src;
                    double v82 = v124;
                    do
                    {
                      float v84 = *v82++;
                      BOOL v85 = v84 <= var3;
                      if (v84 <= var3) {
                        ++v80;
                      }
                      *v83++ = v85;
                      --v79;
                    }
                    while (v79);
                  }
                  if (v80 > v122)
                  {
                    int v86 = retstr->var0.var2;
                    if (v86 < 4 || v80 > v86)
                    {
                      uint64_t v45 = 1916;
LABEL_124:
                      unint64_t v47 = __src;
                      unint64_t v46 = v124;
                      goto LABEL_101;
                    }
                    size_t v88 = v86;
                    if (v80 >= 4)
                    {
                      int v90 = 0;
                      double v91 = 1.0;
                      do
                      {
                        double v91 = v91 * (float)((float)(v80 + v90) / (float)((int)v88 + v90));
                        --v90;
                      }
                      while (v90 != -4);
                      size_t __na = v88;
                      double v92 = log(retstr->var5.var1);
                      long double v93 = log(1.0 - v91);
                      size_t v88 = __na;
                      int v89 = (int)fmin(ceil(v92 / v93), 2147483650.0);
                    }
                    else
                    {
                      int v89 = 0x7FFFFFFF;
                    }
                    int v94 = retstr->var5.var2;
                    if (v94 < v89 && v94 > 0) {
                      int v89 = retstr->var5.var2;
                    }
                    int __n = v89;
                    memcpy(v40, __src, v88);
                    int v122 = v80;
                  }
                }
                int v56 = v130 + 1;
                unsigned int v60 = v128;
                int v59 = v129;
                if (__n <= v130 + 1)
                {
                  unint64_t v161 = __PAIR64__(v57, v58);
                  unint64_t v162 = __PAIR64__(v128, v129);
                  break;
                }
              }
            }
            int v135 = 0;
            uint64_t v136 = 0;
            uint64_t v137 = 0;
            Geometry2D_cloneUsingFlagCart2D(&v135, (uint64_t)retstr, v40);
            unint64_t v132 = 0;
            uint64_t v133 = 0;
            uint64_t v134 = 0;
            Geometry2D_cloneUsingFlagCart2D(&v132, (uint64_t)&retstr->var1, v40);
            uint64_t v96 = 0;
            v152 = 0;
            v153 = 0;
            uint64_t v154 = 0;
            v149 = 0;
            id v150 = 0;
            uint64_t v151 = 0;
            int v166 = 0;
            uint64_t v45 = 1917;
            long long v164 = 0u;
            long long v165 = 0u;
            if (!v121 || !v135) {
              goto LABEL_114;
            }
            unint64_t v97 = 0;
            if (!v136) {
              goto LABEL_115;
            }
            uint64_t v96 = 0;
            uint64_t v45 = 1917;
            if ((int)v137 < 1 || !v132 || !v133) {
              goto LABEL_114;
            }
            unint64_t v97 = 0;
            if ((int)v134 < 1) {
              goto LABEL_115;
            }
            uint64_t v96 = 0;
            uint64_t v45 = 1916;
            if ((int)v137 < 4)
            {
LABEL_114:
              unint64_t v97 = 0;
              goto LABEL_115;
            }
            unint64_t v97 = 0;
            if (v137 != v134) {
              goto LABEL_115;
            }
            uint64_t v96 = (float *)malloc_type_malloc(4 * v134, 0x100004052888210uLL);
            if (v96)
            {
              __CLPK_integer v98 = Geometry2D_estimateWorkBufferSize(v137);
              if (v98 < 0)
              {
                unint64_t v97 = 0;
                uint64_t v45 = 1903;
                goto LABEL_115;
              }
              __CLPK_integer v99 = v98;
              unint64_t v97 = (__CLPK_real *)malloc_type_malloc(4 * v98, 0x100004052888210uLL);
              if (v97)
              {
                uint64_t __C = 0;
                float32_t v146 = 0.0;
                *(float *)&int v147 = 1.0;
                *(float *)&int v144 = 1.0;
                __int32 v145 = 0;
                Geometry2D_mallocCart2D(&v152, v137);
                Geometry2D_mallocCart2D(&v149, v134);
                uint64_t v45 = Geometry2D_normalizePoints((uint64_t)&v135, v96, (uint64_t)&v152, (float *)&__C + 1, (float *)&__C, (float *)&v147);
                if ((v45 & 0x80) != 0)
                {
                  uint64_t v45 = Geometry2D_normalizePoints((uint64_t)&v132, v96, (uint64_t)&v149, &v146, (float *)&v145, (float *)&v144);
                  if ((v45 & 0x80) != 0)
                  {
                    if (v137 == 4)
                    {
                      uint64_t v45 = Geometry2D_estimateHomographyMSS((uint64_t)&v152, (uint64_t)&v149, v97, v99, (uint64_t)&v164);
                      if ((v45 & 0x80) == 0) {
                        goto LABEL_115;
                      }
                      goto LABEL_98;
                    }
                    unint64_t v131 = 0;
                    uint64_t v45 = 1917;
                    if (v152)
                    {
                      if (v153)
                      {
                        unint64_t v131 = 0;
                        uint64_t v45 = 1917;
                        if ((int)v154 >= 1 && v149 && v150)
                        {
                          if ((int)v151 < 1)
                          {
                            uint64_t v45 = 1917;
                            free(0);
                            goto LABEL_115;
                          }
                          if (v154 != v151)
                          {
                            uint64_t v45 = 1916;
                            free(0);
                            goto LABEL_115;
                          }
                          __CLPK_integer __lda = 2 * v154;
                          __CLPK_integer __ldvt = 9;
                          __CLPK_integer v158 = 0;
                          unint64_t v131 = (__CLPK_real *)malloc_type_malloc(72 * v154, 0x100004052888210uLL);
                          if (v131)
                          {
                            Geometry2D_assembleMeasurementMatrix((uint64_t)&v152, (float **)&v149, (uint64_t)v131);
                            char __jobu = 78;
                            char __jobvt = 65;
                            __CLPK_integer __lwork = v99;
                            sgesvd_(&__jobu, &__jobvt, &__lda, &__ldvt, v131, &__lda, __s, 0, &__lda, (__CLPK_real *)&v167, &__ldvt, v97, &__lwork, &v158);
                            if (!v158)
                            {
                              uint64_t v119 = &v164;
                              for (uint64_t i = 32; i != 356; i += 36)
                              {
                                *(_DWORD *)uint64_t v119 = *(_DWORD *)((char *)&v167 + i);
                                uint64_t v119 = (long long *)((char *)v119 + 4);
                              }
                              free(v131);
                              uint64_t v45 = 1920;
LABEL_98:
                              float v100 = *((float *)&__C + 1);
                              float v102 = *(float *)&v147;
                              float v101 = *(float *)&__C;
                              v103.f32[0] = v146;
                              float v104 = *(float *)&v144;
                              int v105 = v166;
                              long long v106 = v165;
                              *(_OWORD *)uint64_t v121 = v164;
                              *((_OWORD *)v121 + 1) = v106;
                              *((_DWORD *)v121 + 8) = v105;
                              *(float *)&long long v106 = v121[2] * v102;
                              *((_DWORD *)v121 + 2) = v106;
                              float v107 = v121[5] * v102;
                              v121[5] = v107;
                              float v108 = v121[8] - (float)((float)(v107 * v101) + (float)(v100 * *(float *)&v106));
                              v121[8] = v108;
                              v103.i32[1] = v145;
                              float v109 = 1.0 / v104;
                              float32x2_t v110 = vmul_n_f32(*(float32x2_t *)v121, v102);
                              float32x2_t v111 = vmul_n_f32(*(float32x2_t *)(v121 + 3), v102);
                              float32x2_t v112 = vsub_f32(*(float32x2_t *)(v121 + 6), vmla_n_f32(vmul_n_f32(v111, v101), v110, v100));
                              *(float32x2_t *)uint64_t v121 = vmla_n_f32(vmul_n_f32(v103, *(float *)&v106), v110, v109);
                              *(float32x2_t *)(v121 + 3) = vmla_n_f32(vmul_n_f32(v103, v107), v111, v109);
                              *((float32x2_t *)v121 + 3) = vmla_n_f32(vmul_n_f32(v103, v108), v112, v109);
                              goto LABEL_115;
                            }
                            uint64_t v45 = 1903;
                          }
                          else
                          {
                            unint64_t v131 = 0;
                            uint64_t v45 = 1915;
                          }
                        }
                      }
                    }
                    free(v131);
                  }
                }
LABEL_115:
                free(v152);
                v152 = 0;
                free(v153);
                v153 = 0;
                LODWORD(v154) = 0;
                free(v149);
                v149 = 0;
                free(v150);
                id v150 = 0;
                LODWORD(v151) = 0;
                free(v96);
                free(v97);
                if ((v45 & 0x80) != 0)
                {
                  unint64_t v46 = v124;
                  uint64_t v45 = Geometry2D_symmetricReprojectionErrorHomography((uint64_t)retstr, v121, (const float **)&retstr->var1.var0, v124);
                  if ((v45 & 0x80) != 0)
                  {
                    uint64_t v116 = retstr->var0.var2;
                    if ((int)v116 < 1)
                    {
                      uint64_t v45 = 1920;
                    }
                    else
                    {
                      uint64_t v117 = 0;
                      float v118 = retstr->var5.var3;
                      uint64_t v45 = 1920;
                      do
                      {
                        v40[v117] = v124[v117] <= v118;
                        ++v117;
                      }
                      while (v116 != v117);
                    }
                  }
                  goto LABEL_123;
                }
LABEL_116:
                unint64_t v46 = v124;
LABEL_123:
                unint64_t v47 = __src;
                goto LABEL_101;
              }
            }
            else
            {
              unint64_t v97 = 0;
            }
            uint64_t v45 = 1915;
            goto LABEL_115;
          }
          goto LABEL_108;
        }
LABEL_113:
        uint64_t v45 = 1915;
        goto LABEL_101;
      }
    }
    else
    {
      unint64_t v46 = 0;
    }
    unint64_t v47 = 0;
    goto LABEL_113;
  }
LABEL_101:
  free(v141);
  id v141 = 0;
  free(v142);
  v142 = 0;
  LODWORD(v143) = 0;
  free(v138);
  v138 = 0;
  free(v139);
  int v139 = 0;
  LODWORD(v140) = 0;
  free(v135);
  int v135 = 0;
  free(v136);
  uint64_t v136 = 0;
  LODWORD(v137) = 0;
  free(v132);
  unint64_t v132 = 0;
  free(v133);
  uint64_t v133 = 0;
  LODWORD(v134) = 0;
  free(v44);
  free(v46);
  free(v47);
  if (v45 != 1920) {
    std::vector<float>::__assign_with_size[abi:ne180100]<float *,float *>((char *)&retstr->var2, (char *)retstr->var4.var0, (uint64_t)retstr->var4.var1, retstr->var4.var1 - retstr->var4.var0);
  }
  uint64_t v113 = retstr->var0.var2;
  if (v113)
  {
    VisionCoreHomography v114 = v40;
    do
    {
      std::vector<BOOL>::push_back((uint64_t *)&retstr->var3, v114++);
      --v113;
    }
    while (v113);
  }
LABEL_106:
  free(v40);
  return result;
}

+ (void)_gatherKeyPtsFromQuadsForSession:(id)a3 minGridFrequency:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  uint64_t v54 = *MEMORY[0x263EF8340];
  id v41 = a3;
  id v5 = (void *)[v41 allSrcPoints];
  uint64_t v6 = (unint64_t **)[v41 quadPointCounts];
  v5[1] = *v5;
  v6[1] = *v6;
  long long v50 = 0u;
  long long v51 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  uint64_t v7 = [v41 trackedQuads];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v48 objects:v53 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v49;
    float v10 = 0.0;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v49 != v9) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void **)(*((void *)&v48 + 1) + 8 * i);
        [v12 boundingBox];
        double v14 = v13;
        [v12 boundingBox];
        float v10 = v10 + v14 * v15;
      }
      uint64_t v8 = [v7 countByEnumeratingWithState:&v48 objects:v53 count:16];
    }
    while (v8);
  }
  else
  {
    float v10 = 0.0;
  }

  long long v46 = 0u;
  long long v47 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  uint64_t v16 = [v41 trackedQuads];
  uint64_t v17 = [v16 countByEnumeratingWithState:&v44 objects:v52 count:16];
  if (v17)
  {
    uint64_t v18 = *(void *)v45;
    do
    {
      for (uint64_t j = 0; j != v17; ++j)
      {
        if (*(void *)v45 != v18) {
          objc_enumerationMutation(v16);
        }
        int v20 = *(void **)(*((void *)&v44 + 1) + 8 * j);
        [v20 boundingBox];
        double v22 = v21;
        [v20 boundingBox];
        if (v20)
        {
          *(float *)&double v23 = v22;
          float v25 = v24;
          *(float *)&double v23 = (float)((float)(*(float *)&v23 * 256.0) * v25) / v10;
          [v20 generateGridKeypointsWithMaxKeypoints:v4 minGridFrequency:v23];
          int v26 = __p;
          uint64_t v27 = v43;
        }
        else
        {
          uint64_t v27 = 0;
          int v26 = 0;
          __p = 0;
          unint64_t v43 = 0;
        }
        std::__unwrap_and_dispatch[abi:ne180100]<std::__overload<std::__copy_loop<std::_ClassicAlgPolicy>,std::__copy_trivial>,std::__wrap_iter<half *>,std::__wrap_iter<half *>,std::back_insert_iterator<std::vector<half>>,0>(v26, v27, (uint64_t)v5);
        unint64_t v28 = (unint64_t)(v43 - __p) >> 1;
        uint64_t v30 = v6[1];
        unint64_t v29 = (unint64_t)v6[2];
        if ((unint64_t)v30 >= v29)
        {
          uint64_t v32 = *v6;
          uint64_t v33 = v30 - *v6;
          unint64_t v34 = v33 + 1;
          if ((unint64_t)(v33 + 1) >> 61) {
            std::vector<unsigned long>::__throw_length_error[abi:ne180100]();
          }
          uint64_t v35 = v29 - (void)v32;
          if (v35 >> 2 > v34) {
            unint64_t v34 = v35 >> 2;
          }
          BOOL v36 = (unint64_t)v35 >= 0x7FFFFFFFFFFFFFF8;
          unint64_t v37 = 0x1FFFFFFFFFFFFFFFLL;
          if (!v36) {
            unint64_t v37 = v34;
          }
          if (v37)
          {
            unint64_t v37 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>(v37);
            uint64_t v32 = *v6;
            uint64_t v30 = v6[1];
          }
          else
          {
            uint64_t v38 = 0;
          }
          int v39 = (unint64_t *)(v37 + 8 * v33);
          *int v39 = v28;
          unint64_t v31 = v39 + 1;
          while (v30 != v32)
          {
            unint64_t v40 = *--v30;
            *--int v39 = v40;
          }
          uint64_t *v6 = v39;
          v6[1] = v31;
          v6[2] = (unint64_t *)(v37 + 8 * v38);
          if (v32) {
            operator delete(v32);
          }
        }
        else
        {
          *uint64_t v30 = v28;
          unint64_t v31 = v30 + 1;
        }
        v6[1] = v31;
        if (__p)
        {
          unint64_t v43 = __p;
          operator delete(__p);
        }
      }
      uint64_t v17 = [v16 countByEnumeratingWithState:&v44 objects:v52 count:16];
    }
    while (v17);
  }
}

@end