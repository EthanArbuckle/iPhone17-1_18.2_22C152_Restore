@interface PIObjectRemoval
+ ($FD18CD26FAB5729647810B74E671536E)_tightImageSpaceBoundsForOperation:(SEL)a3 composition:(id)a4 error:(id)a5;
+ (BOOL)_loadAndRegisterModelForKey:(id)a3 error:(id *)a4;
+ (BOOL)_operationIsBrushStroke:(id)a3;
+ (BOOL)_regionSupportsObjectRemoval;
+ (BOOL)brushStrokeExceedsSizeLimit:(id)a3 imageSize:(CGSize)a4 closeAndFillStroke:(BOOL)a5;
+ (BOOL)deviceSupportsObjectRemoval;
+ (BOOL)loadAndRegisterInpaintModel:(id *)a3;
+ (BOOL)loadAndRegisterModelForKey:(id)a3 error:(id *)a4;
+ (BOOL)loadAndRegisterRefinementModel:(id *)a3;
+ (BOOL)mask:(id)a3 containsPoint:(CGPoint)a4;
+ (BOOL)mask:(id)a3 intersectsDiskWithOrigin:(CGPoint)a4 radius:(double)a5;
+ (BOOL)maskIdentifierIsDeclutter:(id)a3;
+ (BOOL)maskIsMostlyWithinFace:(id)a3 imageSize:(id)a4 imageOrientation:(int64_t)a5 detectedFaces:(id)a6;
+ (BOOL)objectMasksExceedSizeLimit:(id)a3 imageSize:(CGSize)a4;
+ (BOOL)strokeIsEntirelyWithinFace:(id)a3 imageSize:(id)a4 imageOrientation:(int64_t)a5 detectedFaces:(id)a6;
+ (CGRect)inflatedFaceRect:(CGRect)result imageOrientation:(int64_t)a4;
+ (id)_instancesForOperation:(id)a3;
+ (id)_instancesFromMaskIdentifier:(id)a3;
+ (id)_maskSourceWithIdentifier:(id)a3 composition:(id)a4;
+ (id)_newMaskForInstance:(unint64_t)a3 context:(id)a4 maskIdentifier:(id)a5 error:(id *)a6;
+ (id)_newMaskForInstances:(id)a3 context:(id)a4 maskIdentifier:(id)a5 error:(id *)a6;
+ (id)_newMaskImageForOperation:(id)a3 composition:(id)a4 error:(id *)a5;
+ (id)_nonInstancedOperationsFromComposition:(id)a3;
+ (id)createMaskForInstance:(unint64_t)a3 context:(id)a4 maskIdentifierPrefix:(id)a5 error:(id *)a6;
+ (id)maskIdentifierForSegmentIndex:(unint64_t)a3;
+ (id)maskIdentifierForSegmentIndices:(id)a3;
+ (id)removeGatedInstances:(id)a3 context:(id)a4;
+ (id)removeInstancesOccludedByOperations:(id)a3 fromInstances:(id)a4 composition:(id)a5 maskContext:(id)a6;
+ (id)removeOperationsFromInstances:(id)a3 composition:(id)a4 context:(id)a5;
+ (void)createAvailableObjectsMaskForContext:(id)a3 composition:(id)a4 completion:(id)a5;
+ (void)createDeclutterMaskForContext:(id)a3 composition:(id)a4 completion:(id)a5;
+ (void)createMaskContextForComposition:(id)a3 requestID:(id)a4 completionQueue:(id)a5 completion:(id)a6;
+ (void)createSubjectMaskForContext:(id)a3 composition:(id)a4 completion:(id)a5;
+ (void)initialize;
+ (void)purgeIntermediateInpaintCaches;
+ (void)updateMaskContext:(id)a3 forComposition:(id)a4 requestID:(id)a5 completionQueue:(id)a6 completion:(id)a7;
+ (void)warmUpResources;
@end

@implementation PIObjectRemoval

+ (BOOL)brushStrokeExceedsSizeLimit:(id)a3 imageSize:(CGSize)a4 closeAndFillStroke:(BOOL)a5
{
  BOOL v9 = a5;
  double height = a4.height;
  double width = a4.width;
  uint64_t v59 = *MEMORY[0x1E4F143B8];
  v12 = a3;
  if (width == 0.0
    || height == 0.0
    || (width == *MEMORY[0x1E4F8A250] ? (BOOL v13 = height == *(double *)(MEMORY[0x1E4F8A250] + 8)) : (BOOL v13 = 0), v13))
  {
    v40 = NUAssertLogger_11809();
    v28 = "PFSizeIsEmpty(imageSize) == NO";
    if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
    {
      v41 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "PFSizeIsEmpty(imageSize) == NO");
      *(_DWORD *)v58 = 138543362;
      *(void *)&v58[4] = v41;
      _os_log_error_impl(&dword_1A9680000, v40, OS_LOG_TYPE_ERROR, "Fail: %{public}@", v58, 0xCu);
    }
    v42 = (const void **)MEMORY[0x1E4F7A308];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    v14 = NUAssertLogger_11809();
    BOOL v44 = os_log_type_enabled(v14, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v44)
      {
        v47 = dispatch_get_specific(*v42);
        v48 = (void *)MEMORY[0x1E4F29060];
        id v49 = v47;
        v50 = [v48 callStackSymbols];
        v5 = [v50 componentsJoinedByString:@"\n"];
        *(_DWORD *)v58 = 138543618;
        *(void *)&v58[4] = v47;
        *(_WORD *)&v58[12] = 2114;
        *(void *)&v58[14] = v5;
        _os_log_error_impl(&dword_1A9680000, v14, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", v58, 0x16u);
      }
    }
    else if (v44)
    {
      v45 = [MEMORY[0x1E4F29060] callStackSymbols];
      v46 = [v45 componentsJoinedByString:@"\n"];
      *(_DWORD *)v58 = 138543362;
      *(void *)&v58[4] = v46;
      _os_log_error_impl(&dword_1A9680000, v14, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", v58, 0xCu);
    }
    _NUAssertFailHandler();
LABEL_35:
    dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_297);
    goto LABEL_15;
  }
  v14 = v12;
  v15 = +[PIGlobalSettings globalSettings];
  [v15 inpaintMaxAreaPercentage];
  double v17 = v16;

  memset(v58, 0, sizeof(v58));
  if (v14)
  {
    [v14 extent];
    double v18 = (double)(uint64_t)(*(void *)&v58[24] * *(void *)&v58[16]);
  }
  else
  {
    double v18 = 0.0;
  }
  if (v18 / (width * height) <= v17) {
    goto LABEL_25;
  }
  v19 = [v14 ciImageTiled:0 closed:1 pressureMode:2 filled:v9];
  v20 = (void *)MEMORY[0x1E4F1E050];
  v21 = [MEMORY[0x1E4F1E008] blackColor];
  uint64_t v22 = [v20 imageWithColor:v21];

  v51 = (void *)v22;
  v23 = [v19 imageByCompositingOverImage:v22];
  uint64_t v24 = objc_msgSend(v23, "imageByCroppingToRect:", 0.0, 0.0, width, height);

  v25 = (void *)MEMORY[0x1E4F7A718];
  uint64_t v26 = NUPixelSizeFromCGSize();
  v5 = objc_msgSend(v25, "newPixelBufferOfSize:format:", v26, v27, 1278226488);
  v28 = (char *)objc_msgSend(objc_alloc(MEMORY[0x1E4F1E070]), "initWithPixelBuffer:", objc_msgSend(v5, "CVPixelBuffer"));
  id v6 = objc_alloc_init(MEMORY[0x1E4F1E018]);
  id v55 = 0;
  v7 = [v6 startTaskToRender:v24 toDestination:v28 error:&v55];
  id v29 = v55;
  v8 = v29;
  v52 = (void *)v24;
  v53 = v19;
  if (v7)
  {
    id v54 = v29;
    v30 = [v7 waitUntilCompletedAndReturnError:&v54];
    id v31 = v54;

    BOOL v32 = v30 != 0;
    if (v30)
    {
      v33 = [MEMORY[0x1E4F7A560] propertiesForMask:v5 context:v6];
      [v33 density];
      BOOL v35 = v34 > v17;
    }
    else
    {
      if (*MEMORY[0x1E4F7A750] != -1) {
        dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_297);
      }
      v38 = *MEMORY[0x1E4F7A758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F7A758], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        id v57 = v31;
        _os_log_error_impl(&dword_1A9680000, v38, OS_LOG_TYPE_ERROR, "Cleanup: Failed to render stroke mask, error: %{public}@", buf, 0xCu);
      }
      BOOL v35 = 1;
    }
    v37 = v51;

    goto LABEL_24;
  }
  if (*MEMORY[0x1E4F7A750] != -1) {
    goto LABEL_35;
  }
LABEL_15:
  v36 = *MEMORY[0x1E4F7A758];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F7A758], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    id v57 = v8;
    _os_log_error_impl(&dword_1A9680000, v36, OS_LOG_TYPE_ERROR, "Cleanup: Failed to start rendering stroke mask, error: %{public}@", buf, 0xCu);
  }
  BOOL v32 = 0;
  BOOL v35 = 1;
  id v31 = v8;
  v37 = v51;
LABEL_24:

  if (!v35) {
LABEL_25:
  }
    BOOL v32 = 0;

  return v32;
}

+ (BOOL)objectMasksExceedSizeLimit:(id)a3 imageSize:(CGSize)a4
{
  double height = a4.height;
  double width = a4.width;
  uint64_t v69 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (width == 0.0
    || height == 0.0
    || (width == *MEMORY[0x1E4F8A250] ? (BOOL v7 = height == *(double *)(MEMORY[0x1E4F8A250] + 8)) : (BOOL v7 = 0), v7))
  {
    double v34 = NUAssertLogger_11809();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
    {
      BOOL v35 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "PFSizeIsEmpty(imageSize) == NO");
      *(_DWORD *)buf = 138543362;
      *(void *)&uint8_t buf[4] = v35;
      _os_log_error_impl(&dword_1A9680000, v34, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    v36 = (const void **)MEMORY[0x1E4F7A308];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    v38 = NUAssertLogger_11809();
    BOOL v39 = os_log_type_enabled(v38, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v39)
      {
        v42 = dispatch_get_specific(*v36);
        v43 = (void *)MEMORY[0x1E4F29060];
        id v44 = v42;
        v45 = [v43 callStackSymbols];
        v46 = [v45 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        *(void *)&uint8_t buf[4] = v42;
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v46;
        _os_log_error_impl(&dword_1A9680000, v38, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v39)
    {
      v40 = [MEMORY[0x1E4F29060] callStackSymbols];
      v41 = [v40 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      *(void *)&uint8_t buf[4] = v41;
      _os_log_error_impl(&dword_1A9680000, v38, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler();
  }
  v8 = v6;
  BOOL v9 = +[PIGlobalSettings globalSettings];
  [v9 inpaintMaxAreaPercentage];
  double v11 = v10;

  long long v12 = *MEMORY[0x1E4F7A328];
  uint64_t v13 = *(void *)(MEMORY[0x1E4F7A328] + 16);
  uint64_t v14 = *(void *)(MEMORY[0x1E4F7A328] + 24);
  long long v61 = 0u;
  long long v62 = 0u;
  long long v63 = 0u;
  long long v64 = 0u;
  long long v65 = v12;
  id v15 = v8;
  uint64_t v16 = [v15 countByEnumeratingWithState:&v61 objects:v68 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v62;
    do
    {
      for (uint64_t i = 0; i != v17; ++i)
      {
        if (*(void *)v62 != v18) {
          objc_enumerationMutation(v15);
        }
        v20 = *(void **)(*((void *)&v61 + 1) + 8 * i);
        memset(buf, 0, 32);
        if (v20)
        {
          [v20 extent];
        }
        else
        {
          long long v59 = 0uLL;
          long long v60 = 0uLL;
        }
        [v20 scale];
        NUPixelRectScaleRational();
        uint64_t v54 = v13;
        uint64_t v55 = v14;
        long long v51 = *(_OWORD *)buf;
        long long v52 = *(_OWORD *)&buf[16];
        long long v53 = v65;
        NUPixelRectUnion();
        long long v65 = v56;
        uint64_t v13 = v57;
        uint64_t v14 = v58;
      }
      uint64_t v17 = [v15 countByEnumeratingWithState:&v61 objects:v68 count:16];
    }
    while (v17);
  }

  if ((double)(v13 * v14) / (width * height) <= v11) {
    goto LABEL_28;
  }
  v21 = [MEMORY[0x1E4F1E018] context];
  long long v47 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  id v22 = v15;
  uint64_t v23 = [v22 countByEnumeratingWithState:&v47 objects:v66 count:16];
  if (v23)
  {
    uint64_t v24 = v23;
    uint64_t v25 = *(void *)v48;
    double v26 = 0.0;
    do
    {
      for (uint64_t j = 0; j != v24; ++j)
      {
        if (*(void *)v48 != v25) {
          objc_enumerationMutation(v22);
        }
        v28 = (void *)MEMORY[0x1E4F7A560];
        id v29 = [*(id *)(*((void *)&v47 + 1) + 8 * j) buffer];
        v30 = [v28 propertiesForMask:v29 context:v21];

        [v30 density];
        double v26 = v26 + v31;
      }
      uint64_t v24 = [v22 countByEnumeratingWithState:&v47 objects:v66 count:16];
    }
    while (v24);
  }
  else
  {
    double v26 = 0.0;
  }

  if (v26 > v11) {
    BOOL v32 = 1;
  }
  else {
LABEL_28:
  }
    BOOL v32 = 0;

  return v32;
}

+ (CGRect)inflatedFaceRect:(CGRect)result imageOrientation:(int64_t)a4
{
  switch(a4)
  {
    case 1:
    case 2:
      result.size.double height = result.size.height * 1.33;
      double v4 = 0.0;
      goto LABEL_4;
    case 3:
    case 4:
      double v4 = result.size.height * 1.33 - result.size.height;
      result.size.double height = result.size.height * 1.33;
LABEL_4:
      result.origin.y = result.origin.y - v4;
      return result;
    case 5:
    case 6:
      double v5 = result.size.width * 1.33 - result.size.width;
      result.size.double width = result.size.width * 1.33;
      goto LABEL_7;
    case 7:
    case 8:
      result.size.double width = result.size.width * 1.33;
      double v5 = 0.0;
LABEL_7:
      result.origin.x = result.origin.x - v5;
      break;
    default:
      return result;
  }
  return result;
}

+ (BOOL)strokeIsEntirelyWithinFace:(id)a3 imageSize:(id)a4 imageOrientation:(int64_t)a5 detectedFaces:(id)a6
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a6;
  if (v9)
  {
    [v9 extent];
  }
  else
  {
    long long v30 = 0u;
    long long v31 = 0u;
  }
  NUPixelRectToCGRect();
  CGFloat v12 = v11;
  CGFloat v14 = v13;
  CGFloat v16 = v15;
  CGFloat v18 = v17;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v19 = v10;
  uint64_t v20 = [v19 countByEnumeratingWithState:&v26 objects:v32 count:16];
  if (v20)
  {
    uint64_t v21 = v20;
    uint64_t v22 = *(void *)v27;
    while (2)
    {
      for (uint64_t i = 0; i != v21; ++i)
      {
        if (*(void *)v27 != v22) {
          objc_enumerationMutation(v19);
        }
        objc_msgSend(*(id *)(*((void *)&v26 + 1) + 8 * i), "boundingBox", (void)v26);
        objc_msgSend(a1, "inflatedFaceRect:imageOrientation:", a5);
        NURectDenormalize();
        v35.origin.x = v12;
        v35.origin.y = v14;
        v35.size.double width = v16;
        v35.size.double height = v18;
        if (CGRectContainsRect(v34, v35))
        {
          BOOL v24 = 1;
          goto LABEL_14;
        }
      }
      uint64_t v21 = [v19 countByEnumeratingWithState:&v26 objects:v32 count:16];
      if (v21) {
        continue;
      }
      break;
    }
  }
  BOOL v24 = 0;
LABEL_14:

  return v24;
}

+ (BOOL)maskIsMostlyWithinFace:(id)a3 imageSize:(id)a4 imageOrientation:(int64_t)a5 detectedFaces:(id)a6
{
  uint64_t v97 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a6;
  if (NUPixelSizeIsEmpty())
  {
    uint64_t v57 = NUAssertLogger_11809();
    if (os_log_type_enabled(v57, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "NUPixelSizeIsEmpty(imageSize) == NO");
      uint64_t v58 = (const void **)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v91 = v58;
      _os_log_error_impl(&dword_1A9680000, v57, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    long long v59 = (const void **)MEMORY[0x1E4F7A308];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    long long v61 = NUAssertLogger_11809();
    BOOL v62 = os_log_type_enabled(v61, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v62)
      {
        v70 = dispatch_get_specific(*v59);
        v71 = (void *)MEMORY[0x1E4F29060];
        id v72 = v70;
        long long v59 = [v71 callStackSymbols];
        double v73 = [v59 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v91 = (const void **)v70;
        __int16 v92 = 2114;
        double v93 = v73;
        _os_log_error_impl(&dword_1A9680000, v61, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v62)
    {
      long long v63 = [MEMORY[0x1E4F29060] callStackSymbols];
      long long v59 = [v63 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v91 = v59;
      _os_log_error_impl(&dword_1A9680000, v61, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    int v67 = _NUAssertFailHandler();
    goto LABEL_72;
  }
  [v7 extent];
  if (CGRectIsEmpty(v98))
  {
    long long v64 = NUAssertLogger_11809();
    if (os_log_type_enabled(v64, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "CGRectIsEmpty(strokeMask.extent) == NO");
      long long v65 = (const void **)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v91 = v65;
      _os_log_error_impl(&dword_1A9680000, v64, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    long long v59 = (const void **)MEMORY[0x1E4F7A308];
    v66 = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    long long v61 = NUAssertLogger_11809();
    int v67 = os_log_type_enabled(v61, OS_LOG_TYPE_ERROR);
    if (!v66)
    {
      if (v67)
      {
        v68 = [MEMORY[0x1E4F29060] callStackSymbols];
        uint64_t v69 = [v68 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543362;
        v91 = v69;
        _os_log_error_impl(&dword_1A9680000, v61, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
      }
      goto LABEL_74;
    }
LABEL_72:
    if (v67)
    {
      v74 = dispatch_get_specific(*v59);
      v75 = (void *)MEMORY[0x1E4F29060];
      id v76 = v74;
      v77 = [v75 callStackSymbols];
      double v78 = [v77 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543618;
      v91 = (const void **)v74;
      __int16 v92 = 2114;
      double v93 = v78;
      _os_log_error_impl(&dword_1A9680000, v61, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
    }
LABEL_74:

    _NUAssertFailHandler();
  }
  id v9 = +[PIGlobalSettings globalSettings];
  [v9 inpaintPixellationIntersectionAreaToMaskAreaThreshold];
  double v84 = v10;

  double v11 = +[PIGlobalSettings globalSettings];
  [v11 inpaintPixellationIntersectionAreaToFaceAreaThreshold];
  double v79 = v12;

  [v7 extent];
  double v15 = (double *)MEMORY[0x1E4F8A250];
  if (v13 == 0.0
    || v14 == 0.0
    || (v14 == *(double *)(MEMORY[0x1E4F8A250] + 8) ? (BOOL v16 = v13 == *MEMORY[0x1E4F8A250]) : (BOOL v16 = 0), v16))
  {
    double v17 = 0.0;
  }
  else
  {
    double v17 = v13 * v14;
  }
  double v85 = v17;
  long long v88 = 0u;
  long long v89 = 0u;
  long long v86 = 0u;
  long long v87 = 0u;
  obuint64_t j = v8;
  uint64_t v18 = [obj countByEnumeratingWithState:&v86 objects:v96 count:16];
  if (v18)
  {
    uint64_t v19 = v18;
    uint64_t v20 = 0;
    uint64_t v21 = 0;
    uint64_t v22 = *(void *)v87;
    double v23 = v15[1];
    double v81 = *v15;
    BOOL v24 = (dispatch_once_t *)MEMORY[0x1E4F7A750];
    uint64_t v25 = (os_log_t *)MEMORY[0x1E4F7A758];
    while (1)
    {
      uint64_t v26 = 0;
      do
      {
        if (*(void *)v87 != v22) {
          objc_enumerationMutation(obj);
        }
        [*(id *)(*((void *)&v86 + 1) + 8 * v26) boundingBox];
        objc_msgSend(a1, "inflatedFaceRect:imageOrientation:", a5);
        NURectDenormalize();
        CGFloat v28 = v27;
        CGFloat v30 = v29;
        double v32 = v31;
        double v34 = v33;
        [v7 extent];
        v101.origin.double x = v35;
        v101.origin.double y = v36;
        v101.size.double width = v37;
        v101.size.double height = v38;
        v99.origin.double x = v28;
        v99.origin.double y = v30;
        v99.size.double width = v32;
        v99.size.double height = v34;
        CGRect v100 = CGRectIntersection(v99, v101);
        double x = v100.origin.x;
        double y = v100.origin.y;
        double width = v100.size.width;
        double height = v100.size.height;
        if (v100.size.width == 0.0
          || v100.size.height == 0.0
          || (v100.size.height == v23 ? (BOOL v43 = v100.size.width == v81) : (BOOL v43 = 0), v43))
        {
          double v44 = 0.0;
        }
        else
        {
          double v44 = v100.size.width * v100.size.height;
        }
        if (v32 == 0.0 || v34 == 0.0 || (v34 == v23 ? (BOOL v45 = v32 == v81) : (BOOL v45 = 0), v45)) {
          double v46 = 0.0;
        }
        else {
          double v46 = v32 * v34;
        }
        if (*v24 != -1) {
          dispatch_once(v24, &__block_literal_global_297);
        }
        long long v47 = *v25;
        if (os_log_type_enabled(*v25, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 134218240;
          v91 = (const void **)(v20 + v26);
          __int16 v92 = 2048;
          double v93 = v85;
          _os_log_debug_impl(&dword_1A9680000, v47, OS_LOG_TYPE_DEBUG, "Pixellation[%lu] maskBBoxArea        : %.2f", buf, 0x16u);
          if (*v24 != -1) {
            dispatch_once(v24, &__block_literal_global_297);
          }
        }
        long long v48 = *v25;
        if (os_log_type_enabled(*v25, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 134218240;
          v91 = (const void **)(v20 + v26);
          __int16 v92 = 2048;
          double v93 = v44;
          _os_log_debug_impl(&dword_1A9680000, v48, OS_LOG_TYPE_DEBUG, "Pixellation[%lu] intersectionBBoxArea: %.2f", buf, 0x16u);
          if (*v24 != -1) {
            dispatch_once(v24, &__block_literal_global_297);
          }
        }
        long long v49 = *v25;
        if (os_log_type_enabled(*v25, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 134218240;
          v91 = (const void **)(v20 + v26);
          __int16 v92 = 2048;
          double v93 = v46;
          _os_log_debug_impl(&dword_1A9680000, v49, OS_LOG_TYPE_DEBUG, "Pixellation[%lu] faceBBoxArea        : %.2f", buf, 0x16u);
        }
        if (v44 / v85 < v84) {
          goto LABEL_45;
        }
        if (*v24 != -1) {
          dispatch_once(v24, &__block_literal_global_297);
        }
        long long v50 = *v25;
        if (!os_log_type_enabled(*v25, OS_LOG_TYPE_DEBUG))
        {
          if (v21) {
            goto LABEL_44;
          }
LABEL_43:
          uint64_t v21 = [MEMORY[0x1E4F1E018] context];
          goto LABEL_44;
        }
        *(_DWORD *)buf = 134218496;
        v91 = (const void **)(v20 + v26);
        __int16 v92 = 2048;
        double v93 = v44 / v85;
        __int16 v94 = 2048;
        double v95 = v84;
        _os_log_debug_impl(&dword_1A9680000, v50, OS_LOG_TYPE_DEBUG, "Pixellation[%lu] intersectionBBoxArea / maskBBoxArea of %.2f exceeds threshold of %.2f", buf, 0x20u);
        if (!v21) {
          goto LABEL_43;
        }
LABEL_44:
        long long v51 = objc_msgSend(v7, "imageByCroppingToRect:", x, y, width, height);
        [MEMORY[0x1E4F7A560] densityForMask:v51 context:v21];
        double v53 = v44 / v46 * v52;

        if (v53 >= v79)
        {
          BOOL v55 = 1;
          goto LABEL_58;
        }
LABEL_45:
        ++v26;
      }
      while (v19 != v26);
      v20 += v26;
      uint64_t v54 = [obj countByEnumeratingWithState:&v86 objects:v96 count:16];
      uint64_t v19 = v54;
      if (!v54) {
        goto LABEL_57;
      }
    }
  }
  uint64_t v21 = 0;
LABEL_57:
  BOOL v55 = 0;
LABEL_58:

  return v55;
}

+ (BOOL)mask:(id)a3 intersectsDiskWithOrigin:(CGPoint)a4 radius:(double)a5
{
  double y = a4.y;
  double x = a4.x;
  uint64_t v65 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  double v10 = (void *)MEMORY[0x1E4F7A750];
  if (*MEMORY[0x1E4F7A750] != -1) {
    dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_297);
  }
  double v11 = (os_log_t *)MEMORY[0x1E4F7A758];
  double v12 = (id)*MEMORY[0x1E4F7A758];
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    if (v9) {
      [v9 extent];
    }
    double v13 = NSStringFromNUPixelRect();
    *(_DWORD *)buf = 134218754;
    *(double *)&uint8_t buf[4] = x;
    *(_WORD *)&buf[12] = 2048;
    *(double *)&buf[14] = y;
    *(_WORD *)&buf[22] = 2048;
    *(double *)&buf[24] = a5;
    __int16 v63 = 2112;
    double v64 = *(double *)&v13;
    _os_log_impl(&dword_1A9680000, v12, OS_LOG_TYPE_INFO, "Cleanup: exclusion mask disk sampling with origin (%.1f, %.1f) and radius %.1f in mask extent: %@", buf, 0x2Au);
  }
  if (a5 <= 0.5)
  {
    if (*v10 != -1) {
      dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_297);
    }
    double v14 = *v11;
    if (os_log_type_enabled(*v11, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      double v15 = "Cleanup: exclusion mask disk sampling with radius <= 0.5, so falling back to point-in-mask test";
      goto LABEL_23;
    }
LABEL_24:
    char v22 = objc_msgSend(a1, "mask:containsPoint:", v9, x, y);
    goto LABEL_30;
  }
  NUPixelRectFromCGRect();
  if (v9) {
    [v9 extent];
  }
  memset(buf, 0, sizeof(buf));
  if ((NUPixelRectIntersectsRect() & 1) == 0)
  {
    if (*v10 != -1) {
      dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_297);
    }
    os_log_t v23 = *v11;
    if (os_log_type_enabled(*v11, OS_LOG_TYPE_INFO))
    {
      memset(buf, 0, sizeof(buf));
      BOOL v24 = v23;
      uint64_t v25 = NSStringFromNUPixelRect();
      *(_DWORD *)buf = 138412290;
      *(void *)&uint8_t buf[4] = v25;
      _os_log_impl(&dword_1A9680000, v24, OS_LOG_TYPE_INFO, "Cleanup: exclusion mask disk sampling rect rejection with diskRect: %@ ", buf, 0xCu);
    }
    goto LABEL_29;
  }
  BOOL v16 = [v9 buffer];
  double v17 = (__CVBuffer *)[v16 CVPixelBuffer];

  uint64_t PixelFormatType = CVPixelBufferGetPixelFormatType(v17);
  uint64_t v19 = PixelFormatType;
  if (PixelFormatType != 1278226488 && PixelFormatType != 1278226534)
  {
    BOOL v43 = NUAssertLogger_11809();
    if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
    {
      double v44 = NSString;
      BOOL v45 = [MEMORY[0x1E4F8CC38] stringFromFourCharCode:v19];
      double v46 = [v44 stringWithFormat:@"Cleanup: checking exclusion masks, and mask pixel buffers are not of the type we expect (got %@)", v45];
      *(_DWORD *)buf = 138543362;
      *(void *)&uint8_t buf[4] = v46;
      _os_log_error_impl(&dword_1A9680000, v43, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    long long v47 = (const void **)MEMORY[0x1E4F7A308];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    long long v49 = NUAssertLogger_11809();
    BOOL v50 = os_log_type_enabled(v49, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v50)
      {
        double v53 = dispatch_get_specific(*v47);
        uint64_t v54 = (void *)MEMORY[0x1E4F29060];
        id v55 = v53;
        long long v56 = [v54 callStackSymbols];
        uint64_t v57 = [v56 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        *(void *)&uint8_t buf[4] = v53;
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v57;
        _os_log_error_impl(&dword_1A9680000, v49, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v50)
    {
      long long v51 = [MEMORY[0x1E4F29060] callStackSymbols];
      double v52 = [v51 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      *(void *)&uint8_t buf[4] = v52;
      _os_log_error_impl(&dword_1A9680000, v49, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    [MEMORY[0x1E4F8CC38] stringFromFourCharCode:v19];
    objc_claimAutoreleasedReturnValue();
    uint64_t v58 = (void *)_NUAssertFailHandler();
    return +[PIObjectRemoval mask:v60 containsPoint:v66];
  }
  CVPixelBufferLockBaseAddress(v17, 1uLL);
  BaseAddress = CVPixelBufferGetBaseAddress(v17);
  size_t BytesPerRow = CVPixelBufferGetBytesPerRow(v17);
  if (a5 < 0.0)
  {
    CVPixelBufferUnlockBaseAddress(v17, 1uLL);
    goto LABEL_19;
  }
  size_t v27 = BytesPerRow;
  char v28 = 0;
  double v29 = -a5;
  if (a5 >= 5.0) {
    double v30 = 2.0;
  }
  else {
    double v30 = 1.0;
  }
  while (1)
  {
    unint64_t v31 = vcvtmd_s64_f64(v29);
    double v32 = (double)(v31 & 1);
    if (a5 < 5.0) {
      double v32 = 0.0;
    }
    double v33 = v32 - a5;
    if (v32 - a5 <= a5) {
      break;
    }
LABEL_52:
    double v29 = v29 + 1.0;
    if (v29 > a5)
    {
      CVPixelBufferUnlockBaseAddress(v17, 1uLL);
      double v11 = (os_log_t *)MEMORY[0x1E4F7A758];
      double v10 = (void *)MEMORY[0x1E4F7A750];
      if (v28)
      {
        if (*MEMORY[0x1E4F7A750] != -1) {
          dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_297);
        }
        v41 = *v11;
        if (os_log_type_enabled(*v11, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1A9680000, v41, OS_LOG_TYPE_INFO, "Cleanup: exclusion mask disk sampling found no intersection", buf, 2u);
        }
LABEL_29:
        char v22 = 0;
        goto LABEL_30;
      }
LABEL_19:
      if (*v10 != -1) {
        dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_297);
      }
      double v14 = *v11;
      if (os_log_type_enabled(*v11, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        double v15 = "Cleanup: exclusion mask disk sampling tested no points, so falling back to point-in-mask test";
LABEL_23:
        _os_log_impl(&dword_1A9680000, v14, OS_LOG_TYPE_INFO, v15, buf, 2u);
      }
      goto LABEL_24;
    }
  }
  unint64_t v61 = v31;
  uint64_t v34 = vcvtmd_s64_f64(y + v29);
  while (1)
  {
    double v35 = v29 * v29 + v33 * v33;
    if (a5 > 2.0 && v35 > a5 * a5) {
      goto LABEL_51;
    }
    if (v9) {
      objc_msgSend(v9, "extent", v35);
    }
    uint64_t v37 = vcvtmd_s64_f64(x + v33);
    if (!NUPixelPointInRect()) {
      goto LABEL_51;
    }
    size_t v38 = (size_t)BaseAddress + (CVPixelBufferGetHeight(v17) + ~v34) * v27;
    if (v19 == 1278226488) {
      break;
    }
    if (v19 == 1278226534)
    {
      float v40 = *(float *)(v38 + 4 * v37);
      goto LABEL_49;
    }
LABEL_50:
    char v28 = 1;
LABEL_51:
    double v33 = v30 + v33;
    if (v33 > a5) {
      goto LABEL_52;
    }
  }
  LOBYTE(v39) = *(unsigned char *)(v38 + v37);
  float v40 = (float)v39 / 255.0;
LABEL_49:
  if (v40 < 0.5) {
    goto LABEL_50;
  }
  CVPixelBufferUnlockBaseAddress(v17, 1uLL);
  if (*MEMORY[0x1E4F7A750] != -1) {
    dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_297);
  }
  v42 = *MEMORY[0x1E4F7A758];
  char v22 = 1;
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F7A758], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134218752;
    *(void *)&uint8_t buf[4] = vcvtmd_s64_f64(v33);
    *(_WORD *)&buf[12] = 2048;
    *(void *)&buf[14] = v61;
    *(_WORD *)&buf[22] = 2048;
    *(double *)&buf[24] = (double)v37;
    __int16 v63 = 2048;
    double v64 = (double)v34;
    _os_log_impl(&dword_1A9680000, v42, OS_LOG_TYPE_INFO, "Cleanup: exclusion mask disk sampling found intersection at [%ld, %ld]: (%.1f, %.1f)", buf, 0x2Au);
  }
LABEL_30:

  return v22;
}

+ (BOOL)mask:(id)a3 containsPoint:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  NUPixelPointFromCGPoint();
  if (v6) {
    [v6 extent];
  }
  if (!NUPixelPointInRect())
  {
    BOOL v15 = 0;
LABEL_14:

    return v15;
  }
  id v7 = [v6 buffer];
  id v8 = (__CVBuffer *)[v7 CVPixelBuffer];

  uint64_t PixelFormatType = CVPixelBufferGetPixelFormatType(v8);
  CVPixelBufferLockBaseAddress(v8, 1uLL);
  BaseAddress = CVPixelBufferGetBaseAddress(v8);
  size_t BytesPerRow = CVPixelBufferGetBytesPerRow(v8);
  size_t v12 = (size_t)BaseAddress + (CVPixelBufferGetHeight(v8) + ~vcvtmd_u64_f64(y)) * BytesPerRow;
  if (PixelFormatType == 1278226488)
  {
    LOBYTE(v13) = *(unsigned char *)(v12 + vcvtmd_s64_f64(x));
    float v14 = (float)v13 / 255.0;
    goto LABEL_9;
  }
  if (PixelFormatType == 1278226534)
  {
    float v14 = *(float *)(v12 + 4 * vcvtmd_s64_f64(x));
LABEL_9:
    CVPixelBufferUnlockBaseAddress(v8, 1uLL);
    if (*MEMORY[0x1E4F7A750] != -1) {
      dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_297);
    }
    BOOL v16 = *MEMORY[0x1E4F7A758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F7A758], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134218496;
      double v37 = x;
      __int16 v38 = 2048;
      double v39 = y;
      __int16 v40 = 2048;
      double v41 = v14;
      _os_log_impl(&dword_1A9680000, v16, OS_LOG_TYPE_INFO, "Cleanup: exclusion mask sampling at (%.1f, %.1f) - mask value: %f", buf, 0x20u);
    }
    BOOL v15 = v14 >= 0.5;
    goto LABEL_14;
  }
  uint64_t v18 = NUAssertLogger_11809();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
  {
    uint64_t v19 = NSString;
    uint64_t v20 = [MEMORY[0x1E4F8CC38] stringFromFourCharCode:PixelFormatType];
    uint64_t v21 = [v19 stringWithFormat:@"Cleanup: checking exclusion masks, and mask pixel buffers are not of the type we expect (got %@)", v20];
    *(_DWORD *)buf = 138543362;
    double v37 = *(double *)&v21;
    _os_log_error_impl(&dword_1A9680000, v18, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
  }
  char v22 = (const void **)MEMORY[0x1E4F7A308];
  specific = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
  BOOL v24 = NUAssertLogger_11809();
  BOOL v25 = os_log_type_enabled(v24, OS_LOG_TYPE_ERROR);
  if (specific)
  {
    if (v25)
    {
      char v28 = dispatch_get_specific(*v22);
      double v29 = (void *)MEMORY[0x1E4F29060];
      id v30 = v28;
      unint64_t v31 = [v29 callStackSymbols];
      double v32 = [v31 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543618;
      double v37 = *(double *)&v28;
      __int16 v38 = 2114;
      double v39 = *(double *)&v32;
      _os_log_error_impl(&dword_1A9680000, v24, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
    }
  }
  else if (v25)
  {
    uint64_t v26 = [MEMORY[0x1E4F29060] callStackSymbols];
    size_t v27 = [v26 componentsJoinedByString:@"\n"];
    *(_DWORD *)buf = 138543362;
    double v37 = *(double *)&v27;
    _os_log_error_impl(&dword_1A9680000, v24, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
  }
  [MEMORY[0x1E4F8CC38] stringFromFourCharCode:PixelFormatType];
  objc_claimAutoreleasedReturnValue();
  double v33 = (void *)_NUAssertFailHandler();
  return +[PIObjectRemoval _instancesFromMaskIdentifier:v35];
}

+ (id)_instancesFromMaskIdentifier:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  double v4 = [MEMORY[0x1E4F28D60] indexSet];
  uint64_t v5 = [v3 rangeOfString:@"instances:"];
  if (v5 != 0x7FFFFFFFFFFFFFFFLL)
  {
    id v7 = [v3 substringFromIndex:v5 + v6];
    id v8 = [MEMORY[0x1E4F28B88] characterSetWithCharactersInString:@"[]"];
    id v9 = [MEMORY[0x1E4F28B88] characterSetWithCharactersInString:@","];
    uint64_t v20 = v7;
    double v10 = [v7 stringByTrimmingCharactersInSet:v8];
    double v11 = [v10 componentsSeparatedByCharactersInSet:v9];
    size_t v12 = objc_opt_new();
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    id v13 = v11;
    uint64_t v14 = [v13 countByEnumeratingWithState:&v21 objects:v25 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v22;
      do
      {
        for (uint64_t i = 0; i != v15; ++i)
        {
          if (*(void *)v22 != v16) {
            objc_enumerationMutation(v13);
          }
          objc_msgSend(v12, "addIndex:", objc_msgSend(*(id *)(*((void *)&v21 + 1) + 8 * i), "integerValue"));
        }
        uint64_t v15 = [v13 countByEnumeratingWithState:&v21 objects:v25 count:16];
      }
      while (v15);
    }

    uint64_t v18 = [v12 copy];
    double v4 = (void *)v18;
  }

  return v4;
}

+ (id)maskIdentifierForSegmentIndex:(unint64_t)a3
{
  double v4 = [MEMORY[0x1E4F28D60] indexSetWithIndex:a3];
  uint64_t v5 = [a1 maskIdentifierForSegmentIndices:v4];

  return v5;
}

+ (id)maskIdentifierForSegmentIndices:(id)a3
{
  id v3 = NSString;
  double v4 = PIStringFromIndexSet(a3);
  uint64_t v5 = [v3 stringWithFormat:@"groupSelect-instances:%@", v4];

  return v5;
}

+ (BOOL)maskIdentifierIsDeclutter:(id)a3
{
  return [a3 rangeOfString:@"declutter"] != 0x7FFFFFFFFFFFFFFFLL;
}

+ (void)createSubjectMaskForContext:(id)a3 composition:(id)a4 completion:(id)a5
{
  id v9 = a3;
  uint64_t v6 = (void (**)(id, void *, void))a5;
  id v7 = [v9 subjectMask];

  if (v7)
  {
    id v8 = [v9 subjectMask];
    v6[2](v6, v8, 0);
  }
  else
  {
    id v8 = [MEMORY[0x1E4F7A438] missingError:@"No subject buffer" object:0];
    ((void (**)(id, void *, void *))v6)[2](v6, 0, v8);
  }
}

+ (void)createDeclutterMaskForContext:(id)a3 composition:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  double v10 = (void (**)(id, void *, id))a5;
  double v11 = (id)s_log_11880;
  size_t v12 = v11;
  id v13 = &unk_1E9805000;
  os_signpost_id_t v14 = s_signpost_11881;
  if ((unint64_t)(s_signpost_11881 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A9680000, v12, OS_SIGNPOST_INTERVAL_BEGIN, v14, "PIObjectRemoval.declutterMask", "", buf, 2u);
  }

  uint64_t v15 = [v8 segmentationResult];
  uint64_t v16 = [v15 backgroundInstances];

  double v17 = [a1 removeOperationsFromInstances:v16 composition:v9 context:v8];

  uint64_t v18 = [a1 removeGatedInstances:v17 context:v8];

  uint64_t v19 = [a1 _nonInstancedOperationsFromComposition:v9];
  uint64_t v20 = [a1 removeInstancesOccludedByOperations:v19 fromInstances:v18 composition:v9 maskContext:v8];

  if ([v20 count])
  {
    long long v21 = NSString;
    long long v22 = PIStringFromIndexSet(v20);
    long long v23 = [v21 stringWithFormat:@"declutter-instances:%@", v22];

    id v30 = 0;
    long long v24 = (void *)[a1 _newMaskForInstances:v20 context:v8 maskIdentifier:v23 error:&v30];
    id v25 = v30;

    id v13 = (void *)&unk_1E9805000;
  }
  else
  {
    id v25 = 0;
    long long v24 = 0;
  }
  uint64_t v26 = (id)s_log_11880;
  size_t v27 = v26;
  os_signpost_id_t v28 = v13[130];
  if (v28 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v26))
  {
    *(_WORD *)double v29 = 0;
    _os_signpost_emit_with_name_impl(&dword_1A9680000, v27, OS_SIGNPOST_INTERVAL_END, v28, "PIObjectRemoval.declutterMask", "", v29, 2u);
  }

  v10[2](v10, v24, v25);
}

+ (void)createAvailableObjectsMaskForContext:(id)a3 composition:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  double v10 = (void (**)(id, void *, id))a5;
  double v11 = (id)s_log_11880;
  size_t v12 = v11;
  os_signpost_id_t v13 = s_signpost_11881;
  if ((unint64_t)(s_signpost_11881 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A9680000, v12, OS_SIGNPOST_INTERVAL_BEGIN, v13, "PIObjectRemoval.instancesMask", "", buf, 2u);
  }

  os_signpost_id_t v14 = [v8 segmentationResult];
  uint64_t v15 = [v14 instances];

  uint64_t v16 = [a1 removeOperationsFromInstances:v15 composition:v9 context:v8];

  double v17 = [a1 removeGatedInstances:v16 context:v8];

  if ([v17 count])
  {
    uint64_t v18 = NSString;
    uint64_t v19 = PIStringFromIndexSet(v17);
    uint64_t v20 = [v18 stringWithFormat:@"available-instances:%@", v19];

    id v27 = 0;
    long long v21 = (void *)[a1 _newMaskForInstances:v17 context:v8 maskIdentifier:v20 error:&v27];
    id v22 = v27;
  }
  else
  {
    id v22 = 0;
    long long v21 = 0;
  }
  long long v23 = (id)s_log_11880;
  long long v24 = v23;
  os_signpost_id_t v25 = s_signpost_11881;
  if ((unint64_t)(s_signpost_11881 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v23))
  {
    *(_WORD *)uint64_t v26 = 0;
    _os_signpost_emit_with_name_impl(&dword_1A9680000, v24, OS_SIGNPOST_INTERVAL_END, v25, "PIObjectRemoval.instancesMask", "", v26, 2u);
  }

  v10[2](v10, v21, v22);
}

+ (id)createMaskForInstance:(unint64_t)a3 context:(id)a4 maskIdentifierPrefix:(id)a5 error:(id *)a6
{
  double v10 = NSString;
  id v11 = a4;
  size_t v12 = [v10 stringWithFormat:@"%@-instance:%ld", a5, a3];
  os_signpost_id_t v13 = [MEMORY[0x1E4F28D60] indexSetWithIndex:a3];
  os_signpost_id_t v14 = (void *)[a1 _newMaskForInstances:v13 context:v11 maskIdentifier:v12 error:a6];

  return v14;
}

+ (void)warmUpResources
{
  v2 = [MEMORY[0x1E4F1E050] blackImage];
  double v3 = *MEMORY[0x1E4F8A248];
  double v4 = *(double *)(MEMORY[0x1E4F8A248] + 8);
  double v5 = *(double *)(MEMORY[0x1E4F8A248] + 16);
  double v6 = *(double *)(MEMORY[0x1E4F8A248] + 24);
  objc_msgSend(v2, "imageByCroppingToRect:", *MEMORY[0x1E4F8A248], v4, v5, v6);
  id v11 = (id)objc_claimAutoreleasedReturnValue();

  id v7 = [MEMORY[0x1E4F1E050] whiteImage];
  id v8 = objc_msgSend(v7, "imageByCroppingToRect:", v3, v4, v5, v6);

  id v9 = +[PIInpaintRendering inpaintedImageWithInputImage:v11 maskImage:v8 exclusionMaskImage:0 headroom:0.0];
  id v10 = objc_alloc_init(MEMORY[0x1E4F1E018]);
  CGImageRelease((CGImageRef)objc_msgSend(v10, "createCGImage:fromRect:", v9, v3, v4, v5, v6));
}

+ (BOOL)loadAndRegisterRefinementModel:(id *)a3
{
  return [a1 loadAndRegisterModelForKey:PIModelKeyRefinement error:a3];
}

+ (BOOL)loadAndRegisterInpaintModel:(id *)a3
{
  return [a1 loadAndRegisterModelForKey:PIModelKeyInpaint error:a3];
}

+ (BOOL)loadAndRegisterModelForKey:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if (loadAndRegisterModelForKey_error__once != -1) {
    dispatch_once(&loadAndRegisterModelForKey_error__once, &__block_literal_global_194);
  }
  uint64_t v22 = 0;
  long long v23 = &v22;
  uint64_t v24 = 0x2020000000;
  char v25 = 0;
  uint64_t v16 = 0;
  double v17 = &v16;
  uint64_t v18 = 0x3032000000;
  uint64_t v19 = __Block_byref_object_copy__11870;
  uint64_t v20 = __Block_byref_object_dispose__11871;
  id v21 = 0;
  id v7 = loadAndRegisterModelForKey_error__queue;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __52__PIObjectRemoval_loadAndRegisterModelForKey_error___block_invoke_2;
  v11[3] = &unk_1E5D7FEE8;
  id v12 = v6;
  os_signpost_id_t v13 = &v22;
  os_signpost_id_t v14 = &v16;
  id v15 = a1;
  id v8 = v6;
  dispatch_sync(v7, v11);
  *a4 = (id) v17[5];
  char v9 = *((unsigned char *)v23 + 24);

  _Block_object_dispose(&v16, 8);
  _Block_object_dispose(&v22, 8);
  return v9;
}

void __52__PIObjectRemoval_loadAndRegisterModelForKey_error___block_invoke_2(void *a1)
{
  uint64_t v2 = a1[4];
  double v3 = (void *)a1[7];
  double v4 = (id *)(*(void *)(a1[6] + 8) + 40);
  obuint64_t j = 0;
  char v5 = [v3 _loadAndRegisterModelForKey:v2 error:&obj];
  objc_storeStrong(v4, obj);
  *(unsigned char *)(*(void *)(a1[5] + 8) + 24) = v5;
}

void __52__PIObjectRemoval_loadAndRegisterModelForKey_error___block_invoke()
{
  uint64_t v2 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v0 = dispatch_queue_create("PIObjectRemoval.modelLoading", v2);
  v1 = (void *)loadAndRegisterModelForKey_error__queue;
  loadAndRegisterModelForKey_error__queue = (uint64_t)v0;
}

+ (BOOL)_loadAndRegisterModelForKey:(id)a3 error:(id *)a4
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = [MEMORY[0x1E4F7A448] sharedFactory];
  id v7 = [v6 modelRegistry];

  id v8 = [v7 modelForKey:v5];

  if (!v8)
  {
    int v10 = [v5 isEqualToString:PIModelKeyInpaint];
    char v11 = [v5 isEqualToString:PIModelKeyRefinement];
    if ((v10 & 1) == 0 && (v11 & 1) == 0)
    {
      uint64_t v20 = NUAssertLogger_11809();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        id v21 = [NSString stringWithFormat:@"Unknown model"];
        int v33 = 138543362;
        SEL v34 = v21;
        _os_log_error_impl(&dword_1A9680000, v20, OS_LOG_TYPE_ERROR, "Fail: %{public}@", (uint8_t *)&v33, 0xCu);
      }
      uint64_t v22 = (const void **)MEMORY[0x1E4F7A308];
      specific = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
      uint64_t v24 = NUAssertLogger_11809();
      BOOL v25 = os_log_type_enabled(v24, OS_LOG_TYPE_ERROR);
      if (specific)
      {
        if (v25)
        {
          os_signpost_id_t v28 = dispatch_get_specific(*v22);
          double v29 = (void *)MEMORY[0x1E4F29060];
          id v30 = v28;
          unint64_t v31 = [v29 callStackSymbols];
          double v32 = [v31 componentsJoinedByString:@"\n"];
          int v33 = 138543618;
          SEL v34 = v28;
          __int16 v35 = 2114;
          CGFloat v36 = v32;
          _os_log_error_impl(&dword_1A9680000, v24, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", (uint8_t *)&v33, 0x16u);
        }
      }
      else if (v25)
      {
        uint64_t v26 = [MEMORY[0x1E4F29060] callStackSymbols];
        id v27 = [v26 componentsJoinedByString:@"\n"];
        int v33 = 138543362;
        SEL v34 = v27;
        _os_log_error_impl(&dword_1A9680000, v24, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", (uint8_t *)&v33, 0xCu);
      }
      _NUAssertFailHandler();
    }
    id v12 = +[PIModelCatalog shared];
    os_signpost_id_t v13 = v12;
    if (v10)
    {
      os_signpost_id_t v14 = [v12 inpaintModelURL:a4];
      if (v14)
      {
        id v15 = v14;
        uint64_t v16 = @"inpaintModelLoadOptions";
        uint64_t v17 = 6;
LABEL_10:
        uint64_t v18 = objc_msgSend(v7, "loadModelAtURL:options:error:", v15, PIModelLoadingOptions(v14, v16, v17), a4);
        BOOL v9 = v18 != 0;
        if (v18)
        {
          [v7 registerModel:v18 forKey:v5];
        }
        else
        {
          *a4 = [MEMORY[0x1E4F7A438] errorWithCode:1 reason:@"Can't load model" object:v15 underlyingError:*a4];
        }

        goto LABEL_15;
      }
    }
    else
    {
      os_signpost_id_t v14 = [v12 refinementModelURL:a4];
      if (v14)
      {
        id v15 = v14;
        uint64_t v16 = @"refinementModelLoadOptions";
        uint64_t v17 = 8;
        goto LABEL_10;
      }
    }
    [MEMORY[0x1E4F7A438] errorWithCode:3 reason:@"Can't find model" object:0 underlyingError:*a4];
    BOOL v9 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
LABEL_15:

    goto LABEL_16;
  }
  BOOL v9 = 1;
LABEL_16:

  return v9;
}

+ (void)purgeIntermediateInpaintCaches
{
}

+ (id)removeInstancesOccludedByOperations:(id)a3 fromInstances:(id)a4 composition:(id)a5 maskContext:(id)a6
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v24 = a6;
  uint64_t v26 = v11;
  id v25 = (id)[v11 mutableCopy];
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  id v13 = v10;
  uint64_t v14 = [v13 countByEnumeratingWithState:&v35 objects:v40 count:16];
  if (v14)
  {
    uint64_t v16 = v14;
    uint64_t v17 = *(void *)v36;
    *(void *)&long long v15 = 138543362;
    long long v23 = v15;
    do
    {
      uint64_t v18 = 0;
      do
      {
        if (*(void *)v36 != v17) {
          objc_enumerationMutation(v13);
        }
        uint64_t v19 = *(void *)(*((void *)&v35 + 1) + 8 * v18);
        long long v33 = 0u;
        long long v34 = 0u;
        id v32 = 0;
        objc_msgSend(a1, "_tightImageSpaceBoundsForOperation:composition:error:", v19, v12, &v32, v23);
        id v20 = v32;
        buf[0] = v33;
        buf[1] = v34;
        if (NUPixelRectIsEmpty())
        {
          if (*MEMORY[0x1E4F7A750] != -1) {
            dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_297);
          }
          id v21 = *MEMORY[0x1E4F7A758];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F7A758], OS_LOG_TYPE_ERROR))
          {
            LODWORD(buf[0]) = v23;
            *(void *)((char *)buf + 4) = v20;
            _os_log_error_impl(&dword_1A9680000, v21, OS_LOG_TYPE_ERROR, "Error computing tight bounds for operation: %{public}@", (uint8_t *)buf, 0xCu);
          }
        }
        else
        {
          v27[0] = MEMORY[0x1E4F143A8];
          v27[1] = 3221225472;
          v27[2] = __93__PIObjectRemoval_removeInstancesOccludedByOperations_fromInstances_composition_maskContext___block_invoke;
          v27[3] = &unk_1E5D7FEC0;
          id v28 = v24;
          long long v30 = v33;
          long long v31 = v34;
          id v29 = v25;
          [v26 enumerateIndexesUsingBlock:v27];
        }
        ++v18;
      }
      while (v16 != v18);
      uint64_t v16 = [v13 countByEnumeratingWithState:&v35 objects:v40 count:16];
    }
    while (v16);
  }

  return v25;
}

void __93__PIObjectRemoval_removeInstancesOccludedByOperations_fromInstances_composition_maskContext___block_invoke(uint64_t a1, uint64_t a2)
{
  double v4 = [MEMORY[0x1E4F28D60] indexSetWithIndex:a2];
  id v5 = [*(id *)(a1 + 32) segmentationResult];
  id v6 = v5;
  if (v5) {
    [v5 tightBoundsForInstances:v4];
  }

  id v7 = [*(id *)(a1 + 32) segmentationResult];
  id v8 = v7;
  if (v7) {
    [v7 fullExtentForInstances:v4];
  }

  BOOL v9 = *(void **)(a1 + 32);
  if (v9) {
    [v9 fullImageExtent];
  }
  NUScaleMake();
  NUPixelRectScaleRational();
  long long v10 = *(_OWORD *)(a1 + 48);
  long long v11 = *(_OWORD *)(a1 + 64);
  NUPixelRectIntersection();
  if ((NUPixelRectIsEmpty() & 1) == 0
    && (double)0 / (double)(uint64_t)(*(void *)(a1 + 72) * *(void *)(a1 + 64)) > 0.75)
  {
    objc_msgSend(*(id *)(a1 + 40), "removeIndex:", a2, v10, v11, 0, 0, 0, 0);
  }
}

+ (id)removeOperationsFromInstances:(id)a3 composition:(id)a4 context:(id)a5
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  id v8 = (void *)[a3 mutableCopy];
  [v8 removeIndex:0];
  BOOL v9 = [v7 objectForKeyedSubscript:@"inpaint"];
  long long v10 = [v9 objectForKeyedSubscript:@"operations"];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v18 != v13) {
          objc_enumerationMutation(v10);
        }
        long long v15 = [a1 _instancesForOperation:*(void *)(*((void *)&v17 + 1) + 8 * i)];
        [v8 removeIndexes:v15];
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v12);
  }

  return v8;
}

+ (id)removeGatedInstances:(id)a3 context:(id)a4
{
  id v5 = a4;
  id v6 = (void *)[a3 mutableCopy];
  id v7 = [v5 segmentationResult];

  id v8 = [v7 gatedInstances];
  [v6 removeIndexes:v8];

  return v6;
}

+ (id)_instancesForOperation:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [MEMORY[0x1E4F28E60] indexSet];
  id v6 = [v4 objectForKeyedSubscript:@"maskIdentifiers"];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = [a1 _instancesFromMaskIdentifier:*(void *)(*((void *)&v13 + 1) + 8 * i)];
        [v5 addIndexes:v11];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }

  return v5;
}

+ (void)updateMaskContext:(id)a3 forComposition:(id)a4 requestID:(id)a5 completionQueue:(id)a6 completion:(id)a7
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  long long v16 = [[PICompositionController alloc] initWithComposition:v12];
  long long v17 = [(PICompositionController *)v16 livePhotoKeyFrameAdjustmentController];
  uint64_t v18 = v17;
  CMTime v24 = *(CMTime *)*(void *)&MEMORY[0x1E4F1F9F8];
  if (v17) {
    [v17 keyFrameTime];
  }
  if (v11) {
    [v11 livePhotoKeyFrameTime];
  }
  else {
    memset(&time2, 0, sizeof(time2));
  }
  CMTime v22 = v24;
  if (CMTimeCompare(&v22, &time2))
  {
    [v11 _resetForComposition:v12 requestID:v13 completionQueue:v14 completion:v15];
  }
  else
  {
    long long v19 = [v11 subjectMask];
    long long v20 = [v19 buffer];
    id v21 = [v11 subjectMaskDigestForComposition:v12 subjectMaskBuffer:v20];

    [v11 updateSubjectMaskBufferIfNeededForComposition:v12 digest:v21 completionQueue:v14 completion:v15];
  }
}

+ (void)createMaskContextForComposition:(id)a3 requestID:(id)a4 completionQueue:(id)a5 completion:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  id v13 = [PIPerfPowerService alloc];
  id v14 = +[PIPerfPowerServiceIdentifier genEditIdentifier];
  id v15 = [(PIPerfPowerService *)v13 initWithIdentifier:v14 operation:5];

  [(PIPerfPowerService *)v15 beginMeasuring];
  long long v16 = (id)s_log_11880;
  long long v17 = v16;
  os_signpost_id_t v18 = s_signpost_11881;
  if ((unint64_t)(s_signpost_11881 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v16))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A9680000, v17, OS_SIGNPOST_INTERVAL_BEGIN, v18, "PIObjectRemoval.createMaskContext", "", buf, 2u);
  }

  [MEMORY[0x1E4F7A648] begin];
  uint64_t v19 = +[PIPhotoEditHelper pipelineFiltersForPreInpaintSegmentation];
  *(void *)buf = 0;
  int v67 = buf;
  uint64_t v68 = 0x3032000000;
  uint64_t v69 = __Block_byref_object_copy__11870;
  v70 = __Block_byref_object_dispose__11871;
  id v71 = 0;
  v64[0] = 0;
  v64[1] = v64;
  v64[2] = 0x3032000000;
  v64[3] = __Block_byref_object_copy__11870;
  v64[4] = __Block_byref_object_dispose__11871;
  id v65 = 0;
  long long v20 = (void *)[objc_alloc(MEMORY[0x1E4F7A728]) initWithComposition:v9];
  [v20 setPipelineFilters:v19];
  [v20 setResponseQueue:v11];
  v63[0] = MEMORY[0x1E4F143A8];
  v63[1] = 3221225472;
  v63[2] = __88__PIObjectRemoval_createMaskContextForComposition_requestID_completionQueue_completion___block_invoke;
  v63[3] = &unk_1E5D7FDF8;
  v63[4] = buf;
  v63[5] = v64;
  [v20 submit:v63];
  v61[0] = 0;
  v61[1] = v61;
  v61[2] = 0x3032000000;
  v61[3] = __Block_byref_object_copy__11870;
  v61[4] = __Block_byref_object_dispose__11871;
  id v62 = 0;
  v59[0] = 0;
  v59[1] = v59;
  v59[2] = 0x3032000000;
  v59[3] = __Block_byref_object_copy__11870;
  v59[4] = __Block_byref_object_dispose__11871;
  id v60 = 0;
  id v21 = +[PIFaceObservationCache faceRequestWithRequest:v20];
  [v21 setPipelineFilters:v19];
  [v21 setResponseQueue:v11];
  v58[0] = MEMORY[0x1E4F143A8];
  v58[1] = 3221225472;
  v58[2] = __88__PIObjectRemoval_createMaskContextForComposition_requestID_completionQueue_completion___block_invoke_2;
  v58[3] = &unk_1E5D7FDF8;
  v58[4] = v61;
  v58[5] = v59;
  [v21 submit:v58];
  long long v33 = v21;
  long long v34 = v20;
  v56[0] = 0;
  v56[1] = v56;
  v56[2] = 0x3032000000;
  v56[3] = __Block_byref_object_copy__11870;
  v56[4] = __Block_byref_object_dispose__11871;
  id v57 = 0;
  v54[0] = 0;
  v54[1] = v54;
  v54[2] = 0x3032000000;
  v54[3] = __Block_byref_object_copy__11870;
  v54[4] = __Block_byref_object_dispose__11871;
  id v55 = 0;
  CMTime v22 = (void *)[objc_alloc(MEMORY[0x1E4F7A498]) initWithComposition:v9];
  [v22 setPipelineFilters:v19];
  [v22 setResponseQueue:v11];
  v53[0] = MEMORY[0x1E4F143A8];
  v53[1] = 3221225472;
  v53[2] = __88__PIObjectRemoval_createMaskContextForComposition_requestID_completionQueue_completion___block_invoke_3;
  v53[3] = &unk_1E5D7FDF8;
  v53[4] = v56;
  v53[5] = v54;
  [v22 submit:v53];
  long long v35 = (void *)v19;
  long long v23 = v11;
  v51[0] = 0;
  v51[1] = v51;
  v51[2] = 0x3032000000;
  v51[3] = __Block_byref_object_copy__11870;
  v51[4] = __Block_byref_object_dispose__11871;
  id v52 = 0;
  v49[0] = 0;
  v49[1] = v49;
  v49[2] = 0x3032000000;
  v49[3] = __Block_byref_object_copy__11870;
  v49[4] = __Block_byref_object_dispose__11871;
  id v50 = 0;
  CMTime v24 = [[PISensitiveContentAnalysisRequest alloc] initWithComposition:v9];
  [(NURenderRequest *)v24 setPipelineFilters:v19];
  [(NURenderRequest *)v24 setResponseQueue:v23];
  v48[0] = MEMORY[0x1E4F143A8];
  v48[1] = 3221225472;
  v48[2] = __88__PIObjectRemoval_createMaskContextForComposition_requestID_completionQueue_completion___block_invoke_4;
  v48[3] = &unk_1E5D7FDF8;
  v48[4] = v51;
  v48[5] = v49;
  [(PISensitiveContentAnalysisRequest *)v24 submit:v48];
  id v25 = [v9 objectForKeyedSubscript:@"source"];
  uint64_t v26 = [v25 assetIdentifier];
  id v27 = (void *)MEMORY[0x1E4F7A648];
  v36[0] = MEMORY[0x1E4F143A8];
  v36[1] = 3221225472;
  v36[2] = __88__PIObjectRemoval_createMaskContextForComposition_requestID_completionQueue_completion___block_invoke_5;
  v36[3] = &unk_1E5D7FE98;
  id v28 = v15;
  long long v37 = v28;
  uint64_t v42 = buf;
  BOOL v43 = v56;
  double v44 = v64;
  BOOL v45 = v61;
  double v46 = v51;
  id v29 = v9;
  id v38 = v29;
  id v30 = v26;
  id v39 = v30;
  id v31 = v10;
  id v40 = v31;
  id v32 = v12;
  id v41 = v32;
  long long v47 = v54;
  [v27 commitAndNotifyOnQueue:v23 withBlock:v36];

  _Block_object_dispose(v49, 8);
  _Block_object_dispose(v51, 8);

  _Block_object_dispose(v54, 8);
  _Block_object_dispose(v56, 8);

  _Block_object_dispose(v59, 8);
  _Block_object_dispose(v61, 8);

  _Block_object_dispose(v64, 8);
  _Block_object_dispose(buf, 8);
}

void __88__PIObjectRemoval_createMaskContextForComposition_requestID_completionQueue_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  obuint64_t j = *(id *)(v3 + 40);
  uint64_t v4 = [a2 result:&obj];
  objc_storeStrong((id *)(v3 + 40), obj);
  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;
}

void __88__PIObjectRemoval_createMaskContextForComposition_requestID_completionQueue_completion___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  obuint64_t j = *(id *)(v3 + 40);
  uint64_t v4 = [a2 result:&obj];
  objc_storeStrong((id *)(v3 + 40), obj);
  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;
}

void __88__PIObjectRemoval_createMaskContextForComposition_requestID_completionQueue_completion___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  obuint64_t j = *(id *)(v3 + 40);
  uint64_t v4 = [a2 result:&obj];
  objc_storeStrong((id *)(v3 + 40), obj);
  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;
}

void __88__PIObjectRemoval_createMaskContextForComposition_requestID_completionQueue_completion___block_invoke_4(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  obuint64_t j = *(id *)(v3 + 40);
  uint64_t v4 = [a2 result:&obj];
  objc_storeStrong((id *)(v3 + 40), obj);
  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;
}

void __88__PIObjectRemoval_createMaskContextForComposition_requestID_completionQueue_completion___block_invoke_5(uint64_t a1)
{
  uint64_t v2 = (id)s_log_11880;
  uint64_t v3 = v2;
  os_signpost_id_t v4 = s_signpost_11881;
  if ((unint64_t)(s_signpost_11881 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v2))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A9680000, v3, OS_SIGNPOST_INTERVAL_END, v4, "PIObjectRemoval.createMaskContext", "", buf, 2u);
  }

  [*(id *)(a1 + 32) endMeasuring];
  uint64_t v5 = *(void **)(*(void *)(*(void *)(a1 + 72) + 8) + 40);
  if (v5 && *(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 40))
  {
    id v6 = [v5 foregroundInstances];
    uint64_t v7 = [v6 count];

    if (v7)
    {
      uint64_t v8 = *(void **)(*(void *)(*(void *)(a1 + 72) + 8) + 40);
      id v9 = [v8 foregroundInstances];
      id v10 = (id *)(*(void *)(*(void *)(a1 + 88) + 8) + 40);
      id v34 = 0;
      id v11 = (void *)[v8 newMaskForInstances:v9 error:&v34];
      objc_storeStrong(v10, v34);
    }
    else
    {
      id v11 = 0;
    }
    *(_OWORD *)buf = 0u;
    long long v33 = 0u;
    id v13 = [*(id *)(*(void *)(*(void *)(a1 + 80) + 8) + 40) geometry];
    id v14 = v13;
    if (v13)
    {
      [v13 extent];
    }
    else
    {
      *(_OWORD *)buf = 0u;
      long long v33 = 0u;
    }

    id v15 = [*(id *)(*(void *)(*(void *)(a1 + 96) + 8) + 40) faces];
    [*(id *)(*(void *)(*(void *)(a1 + 104) + 8) + 40) sensitivityScore];
    double v17 = v16;
    os_signpost_id_t v18 = [[PICompositionController alloc] initWithComposition:*(void *)(a1 + 40)];
    uint64_t v19 = [(PICompositionController *)v18 livePhotoKeyFrameAdjustmentController];
    long long v20 = v19;
    long long v30 = *MEMORY[0x1E4F1F9F8];
    uint64_t v31 = *(void *)(MEMORY[0x1E4F1F9F8] + 16);
    if (v19) {
      [v19 keyFrameTime];
    }
    id v21 = [PIInpaintMaskContext alloc];
    uint64_t v22 = *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40);
    uint64_t v23 = *(void *)(a1 + 40);
    uint64_t v24 = *(void *)(a1 + 48);
    uint64_t v25 = *(void *)(a1 + 56);
    v29[0] = *(_OWORD *)buf;
    v29[1] = v33;
    long long v27 = v30;
    uint64_t v28 = v31;
    uint64_t v26 = [(PIInpaintMaskContext *)v21 initWithSegmentationResult:v22 composition:v23 subjectMaskBuffer:v11 detectedFaces:v15 fullImageExtent:v29 assetIdentifier:v24 requestID:v17 initialSensitivityScore:v25 livePhotoKeyFrameTime:&v27];
    (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
  }
  else
  {
    uint64_t v12 = *(void *)(*(void *)(*(void *)(a1 + 88) + 8) + 40);
    if (!v12) {
      uint64_t v12 = *(void *)(*(void *)(*(void *)(a1 + 112) + 8) + 40);
    }
    (*(void (**)(void, void, uint64_t))(*(void *)(a1 + 64) + 16))(*(void *)(a1 + 64), 0, v12);
  }
}

+ ($FD18CD26FAB5729647810B74E671536E)_tightImageSpaceBoundsForOperation:(SEL)a3 composition:(id)a4 error:(id)a5
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v10 = a4;
  id v11 = a5;
  $0AC6E346AE4835514AAA8AC86D8F4844 v24 = *($0AC6E346AE4835514AAA8AC86D8F4844 *)(MEMORY[0x1E4F7A320] + 16);
  $0AC6E346AE4835514AAA8AC86D8F4844 v25 = ($0AC6E346AE4835514AAA8AC86D8F4844)*MEMORY[0x1E4F7A320];
  $0AC6E346AE4835514AAA8AC86D8F4844 v34 = ($0AC6E346AE4835514AAA8AC86D8F4844)*MEMORY[0x1E4F7A320];
  $0AC6E346AE4835514AAA8AC86D8F4844 v35 = v24;
  if ([a2 _operationIsBrushStroke:v10])
  {
    uint64_t v12 = +[PIRepairUtilities brushStrokeFromRetouchStrokeDictionary:v10];
    id v13 = v12;
    if (v12)
    {
      [v12 extent];
    }
    else
    {
      $0AC6E346AE4835514AAA8AC86D8F4844 v32 = ($0AC6E346AE4835514AAA8AC86D8F4844)0;
      $0AC6E346AE4835514AAA8AC86D8F4844 v33 = ($0AC6E346AE4835514AAA8AC86D8F4844)0;
    }
    $0AC6E346AE4835514AAA8AC86D8F4844 v34 = v32;
    $0AC6E346AE4835514AAA8AC86D8F4844 v35 = v33;
  }
  else
  {
    uint64_t v23 = a6;
    [v10 objectForKeyedSubscript:@"maskIdentifiers"];
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    id v13 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v14 = [v13 countByEnumeratingWithState:&v28 objects:v36 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v29;
      while (2)
      {
        for (uint64_t i = 0; i != v15; ++i)
        {
          if (*(void *)v29 != v16) {
            objc_enumerationMutation(v13);
          }
          uint64_t v18 = *(void *)(*((void *)&v28 + 1) + 8 * i);
          uint64_t v19 = [a2 _maskSourceWithIdentifier:v18 composition:v11];
          if (!v19)
          {
            id *v23 = [MEMORY[0x1E4F7A438] missingError:@"Can't find source for mask" object:v18];
            retstr->var0 = v25;
            retstr->var1 = v24;

            goto LABEL_17;
          }
          long long v20 = v19;
          $0AC6E346AE4835514AAA8AC86D8F4844 v32 = ($0AC6E346AE4835514AAA8AC86D8F4844)0;
          $0AC6E346AE4835514AAA8AC86D8F4844 v33 = ($0AC6E346AE4835514AAA8AC86D8F4844)0;
          [v19 extent];
          [v20 scale];
          NUPixelRectScaleRational();
          $0AC6E346AE4835514AAA8AC86D8F4844 v32 = v26;
          $0AC6E346AE4835514AAA8AC86D8F4844 v33 = v27;
          $0AC6E346AE4835514AAA8AC86D8F4844 v26 = v34;
          $0AC6E346AE4835514AAA8AC86D8F4844 v27 = v35;
          NUPixelRectUnion();
        }
        uint64_t v15 = [v13 countByEnumeratingWithState:&v28 objects:v36 count:16];
        if (v15) {
          continue;
        }
        break;
      }
    }
  }
  $0AC6E346AE4835514AAA8AC86D8F4844 v21 = v35;
  retstr->var0 = v34;
  retstr->var1 = v21;
LABEL_17:

  return result;
}

+ (id)_newMaskImageForOperation:(id)a3 composition:(id)a4 error:(id *)a5
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  if ([a1 _operationIsBrushStroke:v8])
  {
    id v10 = +[PIRepairUtilities brushStrokeFromRetouchStrokeDictionary:v8];
    id v11 = [v10 ciImageTiled:0 closed:1 pressureMode:1];

    goto LABEL_15;
  }
  [v8 objectForKeyedSubscript:@"maskIdentifiers"];
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  obuint64_t j = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v12 = [obj countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (!v12)
  {
    id v11 = 0;
    goto LABEL_14;
  }
  uint64_t v13 = v12;
  id v11 = 0;
  uint64_t v14 = *(void *)v27;
  id v24 = v8;
  while (2)
  {
    uint64_t v15 = 0;
    id v16 = v11;
    do
    {
      if (*(void *)v27 != v14) {
        objc_enumerationMutation(obj);
      }
      uint64_t v17 = *(void *)(*((void *)&v26 + 1) + 8 * v15);
      uint64_t v18 = objc_msgSend(a1, "_maskSourceWithIdentifier:composition:", v17, v9, v24);
      if (!v18)
      {
        *a5 = [MEMORY[0x1E4F7A438] missingError:@"Can't find source for mask" object:v17];
LABEL_18:

        uint64_t v22 = 0;
        id v8 = v24;
        goto LABEL_19;
      }
      uint64_t v19 = v18;
      uint64_t v20 = [v18 sourceImage:a5];
      if (!v20)
      {

        goto LABEL_18;
      }
      $0AC6E346AE4835514AAA8AC86D8F4844 v21 = (void *)v20;
      id v11 = +[PIInpaintRendering maskByAddingMask:v20 toMask:v16];

      ++v15;
      id v16 = v11;
    }
    while (v13 != v15);
    uint64_t v13 = [obj countByEnumeratingWithState:&v26 objects:v30 count:16];
    id v8 = v24;
    if (v13) {
      continue;
    }
    break;
  }
LABEL_14:

LABEL_15:
  id v16 = v11;
  uint64_t v22 = v16;
LABEL_19:

  return v22;
}

+ (id)_newMaskForInstance:(unint64_t)a3 context:(id)a4 maskIdentifier:(id)a5 error:(id *)a6
{
  id v9 = a4;
  id v10 = a5;
  id v11 = [v9 segmentationResult];
  uint64_t v12 = (void *)[v11 newMaskForInstance:a3 error:a6];

  if (v12)
  {
    long long v22 = 0u;
    long long v23 = 0u;
    uint64_t v13 = [v9 segmentationResult];
    uint64_t v14 = v13;
    if (v13)
    {
      [v13 tightBoundsForInstance:a3];
    }
    else
    {
      long long v22 = 0u;
      long long v23 = 0u;
    }

    if (v9) {
      [v9 fullImageExtent];
    }
    else {
      memset(&v21[2], 0, 32);
    }
    [v12 size];
    uint64_t v16 = NUScaleMake();
    uint64_t v18 = v17;
    uint64_t v19 = [PIInpaintMask alloc];
    v21[0] = v22;
    v21[1] = v23;
    uint64_t v15 = -[PIInpaintMask initWithBuffer:identifier:extent:scale:](v19, "initWithBuffer:identifier:extent:scale:", v12, v10, v21, v16, v18);
  }
  else
  {
    uint64_t v15 = 0;
  }

  return v15;
}

+ (id)_newMaskForInstances:(id)a3 context:(id)a4 maskIdentifier:(id)a5 error:(id *)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  uint64_t v12 = [v10 segmentationResult];
  uint64_t v13 = (void *)[v12 newMaskForInstances:v9 error:a6];

  if (v13)
  {
    long long v23 = 0u;
    long long v24 = 0u;
    uint64_t v14 = [v10 segmentationResult];
    uint64_t v15 = v14;
    if (v14)
    {
      [v14 tightBoundsForInstances:v9];
    }
    else
    {
      long long v23 = 0u;
      long long v24 = 0u;
    }

    if (v10) {
      [v10 fullImageExtent];
    }
    else {
      memset(&v22[2], 0, 32);
    }
    [v13 size];
    uint64_t v17 = NUScaleMake();
    uint64_t v19 = v18;
    uint64_t v20 = [PIInpaintMask alloc];
    v22[0] = v23;
    v22[1] = v24;
    uint64_t v16 = -[PIInpaintMask initWithBuffer:identifier:extent:scale:](v20, "initWithBuffer:identifier:extent:scale:", v13, v11, v22, v17, v19);
  }
  else
  {
    uint64_t v16 = 0;
  }

  return v16;
}

+ (id)_nonInstancedOperationsFromComposition:(id)a3
{
  uint64_t v3 = [a3 objectForKeyedSubscript:@"inpaint"];
  os_signpost_id_t v4 = [v3 objectForKeyedSubscript:@"operations"];
  uint64_t v5 = PFFilter();

  return v5;
}

uint64_t __58__PIObjectRemoval__nonInstancedOperationsFromComposition___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = [[PIInpaintOperation alloc] initWithDictionary:v2];

  uint64_t v4 = [(PIInpaintOperation *)v3 mode] == 2
    || [(PIInpaintOperation *)v3 isTargetPoints]
    || [(PIInpaintOperation *)v3 isFilledBrushStroke];

  return v4;
}

+ (id)_maskSourceWithIdentifier:(id)a3 composition:(id)a4
{
  id v5 = a3;
  id v6 = [a4 objectForKeyedSubscript:@"inpaintMasks"];
  id v10 = v5;
  id v7 = v5;
  id v8 = PFFind();

  return v8;
}

uint64_t __57__PIObjectRemoval__maskSourceWithIdentifier_composition___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 assetIdentifier];
  uint64_t v4 = [v3 isEqualToString:*(void *)(a1 + 32)];

  return v4;
}

+ (BOOL)_operationIsBrushStroke:(id)a3
{
  uint64_t v3 = [a3 objectForKeyedSubscript:@"mode"];
  uint64_t v4 = PIRetouchModeFromString(v3);

  return v4 == 2;
}

+ (BOOL)deviceSupportsObjectRemoval
{
  if ([a1 _regionSupportsObjectRemoval])
  {
    if ([MEMORY[0x1E4F7A4A0] overrideCleanupHardwareCheck])
    {
      return 1;
    }
    else
    {
      return MEMORY[0x1F417CE00](@"DeviceSupportsGenerativeModelSystems");
    }
  }
  else
  {
    uint64_t v3 = s_log_11880;
    BOOL v4 = os_log_type_enabled((os_log_t)s_log_11880, OS_LOG_TYPE_DEFAULT);
    BOOL result = 0;
    if (v4)
    {
      *(_WORD *)id v5 = 0;
      _os_log_impl(&dword_1A9680000, v3, OS_LOG_TYPE_DEFAULT, "PIObjectRemoval: Clean up unavailable due to result of os_eligibility checks", v5, 2u);
      return 0;
    }
  }
  return result;
}

+ (BOOL)_regionSupportsObjectRemoval
{
  if (_regionSupportsObjectRemoval_once != -1) {
    dispatch_once(&_regionSupportsObjectRemoval_once, &__block_literal_global_12054);
  }
  return _regionSupportsObjectRemoval_cleanupSupported;
}

void __47__PIObjectRemoval__regionSupportsObjectRemoval__block_invoke()
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  int domain_answer = os_eligibility_get_domain_answer();
  if (domain_answer)
  {
    int v1 = domain_answer;
    id v2 = strerror(domain_answer);
    uint64_t v3 = s_log_11880;
    if (os_log_type_enabled((os_log_t)s_log_11880, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109378;
      int v5 = v1;
      __int16 v6 = 2080;
      id v7 = v2;
      _os_log_error_impl(&dword_1A9680000, v3, OS_LOG_TYPE_ERROR, "os_eligibility_get_domain_answer failed with errno %d: %s", buf, 0x12u);
    }
  }
  _regionSupportsObjectRemoval_cleanupSupported = 1;
}

+ (void)initialize
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __29__PIObjectRemoval_initialize__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (initialize_onceToken_12058 != -1) {
    dispatch_once(&initialize_onceToken_12058, block);
  }
}

os_signpost_id_t __29__PIObjectRemoval_initialize__block_invoke(uint64_t a1)
{
  os_log_t v2 = os_log_create("com.apple.photos.PhotoImaging", "ObjectRemoval");
  uint64_t v3 = (void *)s_log_11880;
  s_log_11880 = (uint64_t)v2;

  os_signpost_id_t result = os_signpost_id_make_with_pointer((os_log_t)s_log_11880, *(const void **)(a1 + 32));
  s_signpost_11881 = result;
  return result;
}

@end