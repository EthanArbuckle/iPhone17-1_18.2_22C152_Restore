@interface PIInpaintCacheNode
+ (NSCache)intermediateCache;
+ (id)inpaintNodeWithInput:(id)a3 operations:(id)a4 masks:(id)a5 error:(id *)a6;
+ (void)purge;
- ($FD18CD26FAB5729647810B74E671536E)_exclusionMaskExtentForOperation:(SEL)a3 error:(id)a4;
- ($FD18CD26FAB5729647810B74E671536E)_extentForInputIdentifiers:(SEL)a3 error:(id)a4;
- ($FD18CD26FAB5729647810B74E671536E)_maskExtentForOperation:(SEL)a3 error:(id)a4;
- (BOOL)_applyInpaintOperation:(id)a3 toImage:(id)a4 operationIndex:(unint64_t)a5 renderer:(id)a6 error:(id *)a7;
- (BOOL)_renderBackgroundImage:(id)a3 intoMutableBuffer:(id)a4 renderer:(id)a5 error:(id *)a6;
- (BOOL)_renderWithBackgroundImage:(id)a3 error:(id *)a4;
- (BOOL)_tryLoad:(id *)a3;
- (BOOL)_updateInputRegion:(id)a3 outputRegion:(id)a4 forOperation:(id)a5 geometry:(id)a6 error:(id *)a7;
- (BOOL)applyInpaintOperations:(id)a3 toImage:(id)a4 renderer:(id)a5 error:(id *)a6;
- (BOOL)shouldCacheIntermediates;
- (BOOL)shouldDumpSourceMasks;
- (BOOL)tryLoad:(id *)a3;
- (BOOL)wantsDependentJob;
- (PIInpaintCacheNode)initWithInputs:(id)a3 settings:(id)a4;
- (PIInpaintCacheNode)initWithInputs:(id)a3 settings:(id)a4 subsampleFactor:(int64_t)a5;
- (id)_computeBaseIdentifier;
- (id)_evaluateImage:(id *)a3;
- (id)_evaluateImageGeometry:(id *)a3;
- (id)_modifyEvaluatedGeometry:(id)a3;
- (id)_newMaskImageFromIdentifiers:(id)a3 useSourceImage:(BOOL)a4 error:(id *)a5;
- (id)descriptionSubClassHook;
- (id)evaluateRenderDependenciesWithRequest:(id)a3 error:(id *)a4;
- (id)newExclusionMaskImageForOperation:(id)a3 inputImage:(id)a4 error:(id *)a5;
- (id)newImageOfSize:(id)a3 colorSpace:(id)a4;
- (id)newMaskImageForOperation:(id)a3 useSourceImage:(BOOL)a4 error:(id *)a5;
- (id)nodeByReplayingAgainstCache:(id)a3 pipelineState:(id)a4 error:(id *)a5;
- (id)outputRegion;
- (int64_t)padding;
- (int64_t)subsampleFactorForScale:(id)a3;
- (void)_debugDumpMaskImage:(id)a3 name:(id)a4;
- (void)provideImageData:(void *)a3 bytesPerRow:(unint64_t)a4 origin:(unint64_t)a5 :(unint64_t)a6 size:(unint64_t)a7 :(unint64_t)a8 userInfo:(id)a9;
@end

@implementation PIInpaintCacheNode

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cacheKey, 0);
  objc_storeStrong((id *)&self->_operations, 0);
  objc_storeStrong((id *)&self->_outputRegion, 0);
  objc_storeStrong((id *)&self->_inputRegion, 0);
  objc_storeStrong((id *)&self->_outputImage, 0);
  objc_storeStrong((id *)&self->_inputImage, 0);
  objc_storeStrong((id *)&self->_inpaintQueue, 0);
}

- (BOOL)applyInpaintOperations:(id)a3 toImage:(id)a4 renderer:(id)a5 error:(id *)a6
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if ([v9 count])
  {
    uint64_t v12 = 0;
    while (1)
    {
      uint64_t v13 = kdebug_trace();
      v14 = (void *)MEMORY[0x1AD0F8D70](v13);
      v15 = [v9 objectAtIndexedSubscript:v12];
      id v25 = 0;
      BOOL v16 = [(PIInpaintCacheNode *)self _applyInpaintOperation:v15 toImage:v10 operationIndex:v12 renderer:v11 error:&v25];
      id v17 = v25;

      kdebug_trace();
      if (!v16) {
        break;
      }

      if (++v12 >= (unint64_t)[v9 count]) {
        goto LABEL_5;
      }
    }
    id v22 = v17;
    *a6 = v22;

    BOOL v21 = 0;
  }
  else
  {
LABEL_5:
    if (*MEMORY[0x1E4F7A750] != -1) {
      dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_276);
    }
    v18 = (void *)*MEMORY[0x1E4F7A758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F7A758], OS_LOG_TYPE_DEFAULT))
    {
      v19 = v18;
      uint64_t v20 = [v9 count];
      *(_DWORD *)buf = 134217984;
      uint64_t v27 = v20;
      _os_log_impl(&dword_1A9680000, v19, OS_LOG_TYPE_DEFAULT, "Recomputed inpaint for %ld operations", buf, 0xCu);
    }
    BOOL v21 = 1;
  }

  return v21;
}

- (BOOL)_applyInpaintOperation:(id)a3 toImage:(id)a4 operationIndex:(unint64_t)a5 renderer:(id)a6 error:(id *)a7
{
  uint64_t v100 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v14 = a6;
  v15 = (void *)[MEMORY[0x1E4F7A500] newCIImageFromBufferImage:v13];
  uint64_t v16 = [v12 mode];
  if (v16 == 2)
  {
    unint64_t v91 = a5;
    unint64_t v17 = ((unint64_t)[v12 options] >> 4) & 1;
    v18 = [v12 brushStroke];
    id v19 = [v18 ciImageTiled:0 closed:1 pressureMode:1 filled:v17];
    if ([(PIInpaintCacheNode *)self shouldDumpSourceMasks])
    {
      objc_msgSend(NSString, "stringWithFormat:", @"%02ld_brushStroke", v91);
      id v88 = v13;
      uint64_t v20 = a7;
      v22 = id v21 = v14;
      v23 = [MEMORY[0x1E4F1E050] blackImage];
      [v15 extent];
      v24 = objc_msgSend(v23, "imageByCroppingToRect:");

      id v25 = +[PIInpaintRendering imageByOverlayingMaskImage:v19 onImage:v24 withOpacity:1.0];

      [(PIInpaintCacheNode *)self _debugDumpMaskImage:v25 name:v22];
      id v14 = v21;
      a7 = v20;
      id v13 = v88;
    }

    v26 = v19;
    goto LABEL_15;
  }
  if ((unint64_t)(v16 - 3) <= 1)
  {
    if ([(PIInpaintCacheNode *)self shouldDumpSourceMasks])
    {
      uint64_t v97 = 0;
      id v27 = [(PIInpaintCacheNode *)self newMaskImageForOperation:v12 useSourceImage:1 error:&v97];
      uint64_t v28 = objc_msgSend(NSString, "stringWithFormat:", @"%02ld_inpaintMask", a5);
      [(PIInpaintCacheNode *)self _debugDumpMaskImage:v27 name:v28];
    }
    id v29 = [(PIInpaintCacheNode *)self newMaskImageForOperation:v12 useSourceImage:0 error:a7];
    if (!v29)
    {
      BOOL v33 = 0;
LABEL_45:

      return v33;
    }
    unint64_t v91 = a5;
    id v19 = v29;
    if (+[PIInpaintRendering shouldDilateMaskForOperation:v12])
    {
      id v89 = v14;
      v30 = +[PIGlobalSettings globalSettings];
      int v31 = [v30 inpaintFillsMaskHoles];

      v32 = v19;
      if (v31)
      {
        v32 = +[PIInpaintRendering maskByFillingHolesInMask:v19];
      }
      [v15 extent];
      v26 = +[PIInpaintRendering maskByDilatingMask:fullExtent:](PIInpaintRendering, "maskByDilatingMask:fullExtent:", v32);

      id v14 = v89;
    }
    else
    {
      v26 = v19;
    }
LABEL_15:
    long long v95 = 0u;
    long long v96 = 0u;
    [v26 extent];
    NUPixelRectFromCGRect();
    if ([v12 options])
    {
      v42 = +[PIInpaintRendering redactedImageWithInputImage:v15 maskImage:v26];
      if (!v42)
      {
LABEL_43:
        [MEMORY[0x1E4F7A438] invalidError:@"couldn't get inpainted image" object:0];
        BOOL v33 = 0;
        *a7 = (id)objc_claimAutoreleasedReturnValue();
LABEL_44:

        goto LABEL_45;
      }
    }
    else
    {
      v87 = a7;
      v90 = v14;
      id v34 = [(PIInpaintCacheNode *)self newExclusionMaskImageForOperation:v12 inputImage:v15 error:a7];
      int64_t sourceOrientation = self->_sourceOrientation;
      v36 = +[PIGlobalSettings globalSettings];
      if ([v36 inpaintOrientInputImages])
      {
        int IsValid = NUOrientationIsValid();

        if (!IsValid || sourceOrientation == 1)
        {
          int v86 = 0;
        }
        else
        {
          long long v99 = 0u;
          memset(buf, 0, sizeof(buf));
          [v15 extent];
          NUPixelSizeFromCGSize();
          NUOrientationMakeTransformWithSize();
          long long v92 = *(_OWORD *)buf;
          long long v93 = *(_OWORD *)&buf[16];
          long long v94 = v99;
          uint64_t v38 = [v15 imageByApplyingTransform:&v92];

          long long v92 = *(_OWORD *)buf;
          long long v93 = *(_OWORD *)&buf[16];
          long long v94 = v99;
          uint64_t v39 = [v26 imageByApplyingTransform:&v92];

          long long v92 = *(_OWORD *)buf;
          long long v93 = *(_OWORD *)&buf[16];
          long long v94 = v99;
          uint64_t v40 = [v19 imageByApplyingTransform:&v92];

          long long v92 = *(_OWORD *)buf;
          long long v93 = *(_OWORD *)&buf[16];
          long long v94 = v99;
          uint64_t v41 = [v34 imageByApplyingTransform:&v92];

          int v86 = 1;
          id v34 = (id)v41;
          id v19 = (id)v40;
          v26 = (void *)v39;
          v15 = (void *)v38;
        }
      }
      else
      {

        int v86 = 0;
      }
      v44 = +[PIGlobalSettings globalSettings];
      int v45 = [v44 inpaintDumpsProcessedMasks];

      if (v45)
      {
        v46 = [MEMORY[0x1E4F1E050] blackImage];
        v47 = [v26 imageByCompositingOverImage:v46];
        [v15 extent];
        v48 = objc_msgSend(v47, "imageByCroppingToRect:");

        v49 = objc_msgSend(NSString, "stringWithFormat:", @"%02ld_processedInputMask", v91);
        [(PIInpaintCacheNode *)self _debugDumpMaskImage:v48 name:v49];
      }
      v50 = +[PIGlobalSettings globalSettings];
      int v51 = [v50 inpaintOverlaysMasks];

      id v14 = v90;
      if (v51)
      {
        v53 = +[PIInpaintRendering imageByOverlayingMaskImage:v26 onImage:v15 withOpacity:0.25];
        v42 = +[PIInpaintRendering imageByOverlayingMaskImage:v19 onImage:v53 withOpacity:0.8];
      }
      else
      {
        if (self->_sourceIsHDR)
        {
          [v26 extent];
          double v55 = v54;
          double v57 = v56;
          double v59 = v58;
          double v61 = v60;
          v62 = [v90 context];
          +[PIInpaintRendering computeLocalHeadroomForHDRImage:inRect:context:](PIInpaintRendering, "computeLocalHeadroomForHDRImage:inRect:context:", v15, v62, v55, v57, v59, v61);
          LODWORD(v55) = v63;

          v64 = v15;
          v65 = v26;
          id v66 = v34;
          LODWORD(v52) = LODWORD(v55);
        }
        else
        {
          LODWORD(v52) = 1.0;
          v64 = v15;
          v65 = v26;
          id v66 = v34;
        }
        v42 = +[PIInpaintRendering inpaintedImageWithInputImage:v64 maskImage:v65 exclusionMaskImage:v66 headroom:v52];
      }
      v67 = +[PIGlobalSettings globalSettings];
      int v68 = [v67 inpaintOverlaysMaskBounds];

      if (v68)
      {
        [v26 extent];
        uint64_t v69 = +[PIInpaintRendering imageByOverlayingBoundsRect:onImage:](PIInpaintRendering, "imageByOverlayingBoundsRect:onImage:", v42);

        v42 = (void *)v69;
      }
      if (v86)
      {
        long long v99 = 0u;
        memset(buf, 0, sizeof(buf));
        NUOrientationInverse();
        [v15 extent];
        NUPixelSizeFromCGSize();
        NUOrientationMakeTransformWithSize();
        long long v92 = *(_OWORD *)buf;
        long long v93 = *(_OWORD *)&buf[16];
        long long v94 = v99;
        uint64_t v70 = [v42 imageByApplyingTransform:&v92];

        v42 = (void *)v70;
      }

      a7 = v87;
      if (!v42) {
        goto LABEL_43;
      }
    }
    *(_OWORD *)buf = v95;
    *(_OWORD *)&buf[16] = v96;
    if (+[PIInpaintRendering renderImage:v42 intoMutableBuffer:v13 destinationBounds:buf renderer:v14 error:a7])
    {
      BOOL v33 = 1;
    }
    else
    {
      if (*MEMORY[0x1E4F7A750] != -1) {
        dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_276);
      }
      v43 = *MEMORY[0x1E4F7A758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F7A758], OS_LOG_TYPE_ERROR))
      {
        id v72 = *a7;
        *(_DWORD *)buf = 138412546;
        *(void *)&uint8_t buf[4] = v12;
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v72;
        _os_log_error_impl(&dword_1A9680000, v43, OS_LOG_TYPE_ERROR, "Unable to apply object removal operation for operation: %@ error: %@", buf, 0x16u);
      }
      BOOL v33 = 0;
    }
    goto LABEL_44;
  }
  v73 = NUAssertLogger_15728();
  if (os_log_type_enabled(v73, OS_LOG_TYPE_ERROR))
  {
    v74 = [NSString stringWithFormat:@"Invalid inpaint operation: %@", v12];
    *(_DWORD *)buf = 138543362;
    *(void *)&uint8_t buf[4] = v74;
    _os_log_error_impl(&dword_1A9680000, v73, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
  }
  v75 = (const void **)MEMORY[0x1E4F7A308];
  specific = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
  v77 = NUAssertLogger_15728();
  BOOL v78 = os_log_type_enabled(v77, OS_LOG_TYPE_ERROR);
  if (specific)
  {
    if (v78)
    {
      v81 = dispatch_get_specific(*v75);
      v82 = (void *)MEMORY[0x1E4F29060];
      id v83 = v81;
      v84 = [v82 callStackSymbols];
      v85 = [v84 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543618;
      *(void *)&uint8_t buf[4] = v81;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v85;
      _os_log_error_impl(&dword_1A9680000, v77, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
    }
  }
  else if (v78)
  {
    v79 = [MEMORY[0x1E4F29060] callStackSymbols];
    v80 = [v79 componentsJoinedByString:@"\n"];
    *(_DWORD *)buf = 138543362;
    *(void *)&uint8_t buf[4] = v80;
    _os_log_error_impl(&dword_1A9680000, v77, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
  }
  _NUAssertFailHandler();
  return NUAssertLogger_15728();
}

- (BOOL)shouldDumpSourceMasks
{
  v2 = +[PIGlobalSettings globalSettings];
  if ([v2 inpaintDumpsOriginalMasks]) {
    char v3 = 1;
  }
  else {
    char v3 = [MEMORY[0x1E4F7A4A0] inpaintDumpsInputImages];
  }

  return v3;
}

- (id)newExclusionMaskImageForOperation:(id)a3 inputImage:(id)a4 error:(id *)a5
{
  uint64_t v80 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v69 = a4;
  id v10 = [v9 exclusionMaskIdentifiers];
  if (![v10 count])
  {
    uint64_t v40 = 0;
    goto LABEL_20;
  }
  if ([(PIInpaintCacheNode *)self shouldDumpSourceMasks])
  {
    uint64_t v74 = 0;
    id v11 = [(PIInpaintCacheNode *)self _newMaskImageFromIdentifiers:v10 useSourceImage:1 error:&v74];
    [(PIInpaintCacheNode *)self _debugDumpMaskImage:v11 name:@"exclusionMask"];
  }
  v65 = v10;
  id v66 = v9;
  long long v72 = 0u;
  long long v73 = 0u;
  long long v70 = 0u;
  long long v71 = 0u;
  id obj = v10;
  uint64_t v12 = [obj countByEnumeratingWithState:&v70 objects:v79 count:16];
  if (!v12)
  {
    id v14 = 0;
    goto LABEL_18;
  }
  uint64_t v13 = v12;
  id v14 = 0;
  uint64_t v15 = *(void *)v71;
  do
  {
    uint64_t v16 = 0;
    id v17 = v14;
    do
    {
      if (*(void *)v71 != v15) {
        objc_enumerationMutation(obj);
      }
      uint64_t v18 = *(void *)(*((void *)&v70 + 1) + 8 * v16);
      uint64_t v19 = [(NURenderNode *)self inputForKey:v18];
      if (!v19)
      {
        v42 = NUAssertLogger_15728();
        if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
        {
          v43 = [NSString stringWithFormat:@"Missing mask for identifier %@", v18];
          *(_DWORD *)buf = 138543362;
          v76 = v43;
          _os_log_error_impl(&dword_1A9680000, v42, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
        }
        v44 = (const void **)MEMORY[0x1E4F7A308];
        specific = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
        v46 = NUAssertLogger_15728();
        BOOL v47 = os_log_type_enabled(v46, OS_LOG_TYPE_ERROR);
        if (specific)
        {
          if (v47)
          {
            double v56 = dispatch_get_specific(*v44);
            double v57 = (void *)MEMORY[0x1E4F29060];
            v5 = v56;
            double v58 = [v57 callStackSymbols];
            double v59 = [v58 componentsJoinedByString:@"\n"];
            *(_DWORD *)buf = 138543618;
            v76 = v56;
            __int16 v77 = 2114;
            BOOL v78 = v59;
            _os_log_error_impl(&dword_1A9680000, v46, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
          }
        }
        else if (v47)
        {
          v48 = [MEMORY[0x1E4F29060] callStackSymbols];
          v49 = [v48 componentsJoinedByString:@"\n"];
          *(_DWORD *)buf = 138543362;
          v76 = v49;
          _os_log_error_impl(&dword_1A9680000, v46, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
        }
        int v53 = _NUAssertFailHandler();
LABEL_34:
        if (v53)
        {
          double v60 = dispatch_get_specific(*v5);
          double v61 = (void *)MEMORY[0x1E4F29060];
          id v62 = v60;
          int v63 = [v61 callStackSymbols];
          v64 = [v63 componentsJoinedByString:@"\n"];
          *(_DWORD *)buf = 138543618;
          *(void *)(v6 + 4) = v60;
          __int16 v77 = 2114;
          *(void *)(v6 + 14) = v64;
          _os_log_error_impl(&dword_1A9680000, v46, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
        }
LABEL_36:

        _NUAssertFailHandler();
      }
      uint64_t v20 = (void *)v19;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v50 = NUAssertLogger_15728();
        uint64_t v6 = (uint64_t)buf;
        if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
        {
          int v51 = [NSString stringWithFormat:@"maskNode is not of expected class: %@", v20];
          *(_DWORD *)buf = 138543362;
          v76 = v51;
          _os_log_error_impl(&dword_1A9680000, v50, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
        }
        v5 = (const void **)MEMORY[0x1E4F7A308];
        double v52 = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
        v46 = NUAssertLogger_15728();
        int v53 = os_log_type_enabled(v46, OS_LOG_TYPE_ERROR);
        if (v52) {
          goto LABEL_34;
        }
        if (v53)
        {
          double v54 = [MEMORY[0x1E4F29060] callStackSymbols];
          double v55 = [v54 componentsJoinedByString:@"\n"];
          *(_DWORD *)buf = 138543362;
          v76 = v55;
          _os_log_error_impl(&dword_1A9680000, v46, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
        }
        goto LABEL_36;
      }
      uint64_t v21 = [v20 sourceImage:a5];
      if (!v21)
      {

        uint64_t v40 = 0;
        goto LABEL_19;
      }
      id v22 = (void *)v21;
      [v20 croppedExtent];
      NUPixelRectToCGRect();
      double v24 = v23;
      double v26 = v25;
      double v28 = v27;
      double v30 = v29;
      [v20 croppedExtent];
      [v20 scale];
      NUPixelRectScaleRational();
      NUPixelRectToCGRect();
      double v32 = v31;
      double v34 = v33;
      double v36 = v35;
      double v38 = v37;
      uint64_t v39 = objc_msgSend(v22, "imageByCroppingToRect:", v24, v26, v28, v30);

      objc_msgSend(v69, "imageByCroppingToRect:", v32, v34, v36, v38);
      v5 = (const void **)objc_claimAutoreleasedReturnValue();
      uint64_t v6 = +[PIInpaintRendering maskByUpscalingMask:v39 withGuideImage:v5];

      id v14 = +[PIInpaintRendering maskByAddingMask:v6 toMask:v17];

      ++v16;
      id v17 = v14;
    }
    while (v13 != v16);
    uint64_t v13 = [obj countByEnumeratingWithState:&v70 objects:v79 count:16];
  }
  while (v13);
LABEL_18:

  id v17 = v14;
  uint64_t v40 = v17;
LABEL_19:

  id v10 = v65;
  id v9 = v66;
LABEL_20:

  return v40;
}

- (id)newMaskImageForOperation:(id)a3 useSourceImage:(BOOL)a4 error:(id *)a5
{
  BOOL v6 = a4;
  v8 = [a3 maskIdentifiers];
  id v9 = [(PIInpaintCacheNode *)self _newMaskImageFromIdentifiers:v8 useSourceImage:v6 error:a5];

  return v9;
}

- (id)_newMaskImageFromIdentifiers:(id)a3 useSourceImage:(BOOL)a4 error:(id *)a5
{
  BOOL v6 = a4;
  uint64_t v59 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  if (!a5) {
    goto LABEL_28;
  }
  long long v52 = 0u;
  long long v53 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  id v9 = v8;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v50 objects:v54 count:16];
  if (!v10)
  {
    uint64_t v12 = 0;
LABEL_18:

    id v15 = v12;
    uint64_t v21 = v15;
    goto LABEL_19;
  }
  uint64_t v11 = v10;
  uint64_t v12 = 0;
  uint64_t v13 = *(void *)v51;
  id obj = v9;
LABEL_4:
  uint64_t v14 = 0;
  id v15 = v12;
  while (1)
  {
    if (*(void *)v51 != v13) {
      objc_enumerationMutation(obj);
    }
    uint64_t v16 = *(void *)(*((void *)&v50 + 1) + 8 * v14);
    uint64_t v17 = [(NURenderNode *)self inputForKey:v16];
    if (!v17)
    {
      double v23 = NUAssertLogger_15728();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        double v24 = [NSString stringWithFormat:@"Missing mask for identifier %@", v16];
        *(_DWORD *)buf = 138543362;
        double v56 = v24;
        _os_log_error_impl(&dword_1A9680000, v23, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
      }
      double v25 = (const void **)MEMORY[0x1E4F7A308];
      specific = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
      double v27 = NUAssertLogger_15728();
      BOOL v28 = os_log_type_enabled(v27, OS_LOG_TYPE_ERROR);
      if (specific)
      {
        if (v28)
        {
          double v31 = dispatch_get_specific(*v25);
          double v32 = (void *)MEMORY[0x1E4F29060];
          id v33 = v31;
          double v34 = [v32 callStackSymbols];
          double v35 = [v34 componentsJoinedByString:@"\n"];
          *(_DWORD *)buf = 138543618;
          double v56 = v31;
          __int16 v57 = 2114;
          double v58 = v35;
          _os_log_error_impl(&dword_1A9680000, v27, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
        }
      }
      else if (v28)
      {
        double v29 = [MEMORY[0x1E4F29060] callStackSymbols];
        double v30 = [v29 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543362;
        double v56 = v30;
        _os_log_error_impl(&dword_1A9680000, v27, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
      }
      _NUAssertFailHandler();
LABEL_28:
      double v36 = NUAssertLogger_15728();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
      {
        double v37 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "error != NULL");
        *(_DWORD *)buf = 138543362;
        double v56 = v37;
        _os_log_error_impl(&dword_1A9680000, v36, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
      }
      double v38 = (const void **)MEMORY[0x1E4F7A308];
      uint64_t v39 = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
      uint64_t v40 = NUAssertLogger_15728();
      BOOL v41 = os_log_type_enabled(v40, OS_LOG_TYPE_ERROR);
      if (v39)
      {
        if (v41)
        {
          v44 = dispatch_get_specific(*v38);
          int v45 = (void *)MEMORY[0x1E4F29060];
          id v46 = v44;
          BOOL v47 = [v45 callStackSymbols];
          v48 = [v47 componentsJoinedByString:@"\n"];
          *(_DWORD *)buf = 138543618;
          double v56 = v44;
          __int16 v57 = 2114;
          double v58 = v48;
          _os_log_error_impl(&dword_1A9680000, v40, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
        }
      }
      else if (v41)
      {
        v42 = [MEMORY[0x1E4F29060] callStackSymbols];
        v43 = [v42 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543362;
        double v56 = v43;
        _os_log_error_impl(&dword_1A9680000, v40, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
      }
      _NUAssertFailHandler();
    }
    uint64_t v18 = (void *)v17;
    if (v6 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      uint64_t v19 = [v18 sourceImage:a5];
    }
    else
    {
      uint64_t v19 = [v18 outputImage:a5];
    }
    uint64_t v20 = (void *)v19;
    if (!v19) {
      break;
    }
    uint64_t v12 = +[PIInpaintRendering maskByAddingMask:v19 toMask:v15];

    ++v14;
    id v15 = v12;
    if (v11 == v14)
    {
      id v9 = obj;
      uint64_t v11 = [obj countByEnumeratingWithState:&v50 objects:v54 count:16];
      if (!v11) {
        goto LABEL_18;
      }
      goto LABEL_4;
    }
  }

  id v9 = obj;
  uint64_t v21 = 0;
LABEL_19:

  return v21;
}

- (void)_debugDumpMaskImage:(id)a3 name:(id)a4
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  id v6 = a3;
  v7 = +[PIGlobalSettings globalSettings];
  id v8 = [v7 inpaintDumpPath];

  id v9 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v29 = 0;
  char v10 = [v9 createDirectoryAtPath:v8 withIntermediateDirectories:1 attributes:0 error:&v29];
  id v11 = v29;

  uint64_t v12 = (void *)MEMORY[0x1E4F7A750];
  uint64_t v13 = (os_log_t *)MEMORY[0x1E4F7A758];
  if ((v10 & 1) == 0)
  {
    if (*MEMORY[0x1E4F7A750] != -1) {
      dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_276);
    }
    uint64_t v14 = *v13;
    if (os_log_type_enabled(*v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v31 = (uint64_t)v11;
      _os_log_impl(&dword_1A9680000, v14, OS_LOG_TYPE_DEFAULT, "Error creating mask directory: %@", buf, 0xCu);
    }
    uint64_t v15 = [MEMORY[0x1E4F7A4A0] tempDir];

    uint64_t v16 = [MEMORY[0x1E4F28CB8] defaultManager];
    [v16 createDirectoryAtPath:v15 withIntermediateDirectories:1 attributes:0 error:0];

    id v8 = (void *)v15;
  }
  uint64_t v17 = [v5 stringByAppendingPathExtension:@"png"];
  uint64_t v18 = [v8 stringByAppendingPathComponent:v17];

  uint64_t v19 = [MEMORY[0x1E4F28CB8] defaultManager];
  [v19 removeItemAtPath:v18 error:0];

  uint64_t v20 = [MEMORY[0x1E4F1E018] context];
  if (*v12 != -1) {
    dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_276);
  }
  uint64_t v21 = *v13;
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    id v22 = v18;
    double v23 = v21;
    uint64_t v24 = [v22 UTF8String];
    *(_DWORD *)buf = 136315138;
    uint64_t v31 = v24;
    _os_log_impl(&dword_1A9680000, v23, OS_LOG_TYPE_DEFAULT, "saving: %s\n", buf, 0xCu);
  }
  double v25 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v18];
  uint64_t v26 = *MEMORY[0x1E4F1E298];
  double v27 = [MEMORY[0x1E4F7A400] linearGrayColorSpace];
  uint64_t v28 = [v27 CGColorSpace];
  [v20 writePNGRepresentationOfImage:v6 toURL:v25 format:v26 colorSpace:v28 options:MEMORY[0x1E4F1CC08] error:0];
}

- (BOOL)_renderBackgroundImage:(id)a3 intoMutableBuffer:(id)a4 renderer:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  inputRegion = self->_inputRegion;
  uint64_t v14 = [(NUMutableBufferImage *)self->_inputImage validRegion];
  uint64_t v15 = [(NURegion *)inputRegion regionByRemovingRegion:v14];

  if ([v15 isEmpty])
  {
    BOOL v16 = 1;
  }
  else
  {
    uint64_t v30 = 0;
    uint64_t v31 = &v30;
    uint64_t v32 = 0x2020000000;
    char v33 = 0;
    uint64_t v24 = 0;
    double v25 = &v24;
    uint64_t v26 = 0x3032000000;
    double v27 = __Block_byref_object_copy__15790;
    uint64_t v28 = __Block_byref_object_dispose__15791;
    id v29 = 0;
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __78__PIInpaintCacheNode__renderBackgroundImage_intoMutableBuffer_renderer_error___block_invoke;
    v18[3] = &unk_1E5D80488;
    id v19 = v11;
    id v22 = &v30;
    id v20 = v10;
    id v21 = v12;
    double v23 = &v24;
    [v15 enumerateRects:v18];
    *a6 = (id) v25[5];
    BOOL v16 = *((unsigned char *)v31 + 24) != 0;

    _Block_object_dispose(&v24, 8);
    _Block_object_dispose(&v30, 8);
  }

  return v16;
}

void __78__PIInpaintCacheNode__renderBackgroundImage_intoMutableBuffer_renderer_error___block_invoke(uint64_t a1, long long *a2)
{
  long long v20 = 0u;
  long long v21 = 0u;
  uint64_t v4 = [*(id *)(a1 + 32) size];
  uint64_t v16 = 0;
  uint64_t v17 = 0;
  uint64_t v18 = v4;
  uint64_t v19 = v5;
  long long v6 = a2[1];
  long long v14 = *a2;
  long long v15 = v6;
  NUPixelRectFlipYOrigin();
  uint64_t v8 = *(void *)(a1 + 32);
  uint64_t v7 = *(void *)(a1 + 40);
  uint64_t v9 = *(void *)(a1 + 48);
  id v13 = 0;
  long long v14 = 0u;
  long long v15 = 0u;
  BOOL v10 = +[PIInpaintRendering renderImage:v7 intoMutableBuffer:v8 destinationBounds:&v14 renderer:v9 error:&v13];
  id v11 = v13;
  id v12 = v13;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = v10;
  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24)) {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40), v11);
  }
}

- (BOOL)_renderWithBackgroundImage:(id)a3 error:(id *)a4
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (!self->_inputImage)
  {
    double v23 = NUAssertLogger_15728();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      uint64_t v24 = [NSString stringWithFormat:@"No input image!"];
      *(_DWORD *)buf = 138543362;
      BOOL v41 = v24;
      _os_log_error_impl(&dword_1A9680000, v23, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    double v25 = (const void **)MEMORY[0x1E4F7A308];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    double v27 = NUAssertLogger_15728();
    BOOL v28 = os_log_type_enabled(v27, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v28)
      {
        uint64_t v31 = dispatch_get_specific(*v25);
        uint64_t v32 = (void *)MEMORY[0x1E4F29060];
        id v33 = v31;
        double v34 = [v32 callStackSymbols];
        double v35 = [v34 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        BOOL v41 = v31;
        __int16 v42 = 2114;
        v43 = v35;
        _os_log_error_impl(&dword_1A9680000, v27, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v28)
    {
      id v29 = [MEMORY[0x1E4F29060] callStackSymbols];
      uint64_t v30 = [v29 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      BOOL v41 = v30;
      _os_log_error_impl(&dword_1A9680000, v27, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler();
  }
  uint64_t v7 = v6;
  uint64_t v8 = (void *)MEMORY[0x1E4F1E018];
  uint64_t v38 = *MEMORY[0x1E4F1E1E0];
  uint64_t v39 = MEMORY[0x1E4F1CC28];
  uint64_t v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v39 forKeys:&v38 count:1];
  BOOL v10 = [v8 contextWithOptions:v9];

  id v11 = (void *)[objc_alloc(MEMORY[0x1E4F7A650]) initWithCIContext:v10 priority:1];
  inputImage = self->_inputImage;
  id v37 = 0;
  BOOL v13 = [(PIInpaintCacheNode *)self _renderBackgroundImage:v7 intoMutableBuffer:inputImage renderer:v11 error:&v37];
  id v14 = v37;
  if (v13)
  {
    operations = self->_operations;
    uint64_t v16 = self->_inputImage;
    id v36 = 0;
    BOOL v17 = [(PIInpaintCacheNode *)self applyInpaintOperations:operations toImage:v16 renderer:v11 error:&v36];
    id v18 = v36;

    if (v17)
    {
      if ([(PIInpaintCacheNode *)self shouldCacheIntermediates])
      {
        uint64_t v19 = [(id)objc_opt_class() intermediateCache];
        long long v20 = [(NUMutableBufferImage *)self->_inputImage purgeableImageCopy];
        [v19 setObject:v20 forKey:self->_cacheKey];
      }
      BOOL v21 = 1;
    }
    else
    {
      [MEMORY[0x1E4F7A438] errorWithCode:1 reason:@"Failed to render inpaint operations:@" object:self->_operations underlyingError:v18];
      BOOL v21 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    id v14 = v18;
  }
  else
  {
    [MEMORY[0x1E4F7A438] errorWithCode:1 reason:@"Failed to render inpaint background" object:v7 underlyingError:v14];
    BOOL v21 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v21;
}

- (void)provideImageData:(void *)a3 bytesPerRow:(unint64_t)a4 origin:(unint64_t)a5 :(unint64_t)a6 size:(unint64_t)a7 :(unint64_t)a8 userInfo:(id)a9
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v40 = a9;
  uint64_t v16 = (void *)MEMORY[0x1E4F7A750];
  if (*MEMORY[0x1E4F7A750] != -1) {
    dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_276);
  }
  BOOL v17 = (void *)*MEMORY[0x1E4F7A758];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F7A758], OS_LOG_TYPE_DEBUG))
  {
    double v35 = a3;
    id v36 = (void *)MEMORY[0x1E4F29060];
    id v37 = v17;
    uint64_t v38 = [v36 currentThread];
    LODWORD(buf) = 67110144;
    DWORD1(buf) = a5;
    WORD4(buf) = 1024;
    *(_DWORD *)((char *)&buf + 10) = a6;
    HIWORD(buf) = 1024;
    *(_DWORD *)long long v50 = a7;
    *(_WORD *)&v50[4] = 1024;
    *(_DWORD *)&v50[6] = a8;
    *(_WORD *)&v50[10] = 2048;
    *(void *)&v50[12] = v38;
    _os_log_debug_impl(&dword_1A9680000, v37, OS_LOG_TYPE_DEBUG, "provideImageData (%d,%d,%d,%d) tid=%p", (uint8_t *)&buf, 0x24u);

    a3 = v35;
  }
  outputImage = self->_outputImage;
  unint64_t v39 = a5;
  if (!outputImage)
  {
    unint64_t v19 = a4;
    long long v20 = a3;
    id v48 = 0;
    BOOL v21 = [(PIInpaintCacheNode *)self _renderWithBackgroundImage:v40 error:&v48];
    id v22 = v48;
    if (!v21)
    {
      if (*v16 != -1) {
        dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_276);
      }
      double v23 = *MEMORY[0x1E4F7A758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F7A758], OS_LOG_TYPE_ERROR))
      {
        LODWORD(buf) = 138543362;
        *(void *)((char *)&buf + 4) = v22;
        _os_log_error_impl(&dword_1A9680000, v23, OS_LOG_TYPE_ERROR, "Failed to render: %{public}@", (uint8_t *)&buf, 0xCu);
      }
    }
    uint64_t v24 = [(NUMutableBufferImage *)self->_inputImage immutableImageCopy];
    double v25 = self->_outputImage;
    self->_outputImage = v24;

    inputImage = self->_inputImage;
    self->_inputImage = 0;

    outputImage = self->_outputImage;
    a3 = v20;
    a4 = v19;
    a5 = v39;
  }
  *(void *)&long long buf = a5;
  *((void *)&buf + 1) = a6;
  *(void *)long long v50 = a7;
  *(void *)&v50[8] = a8;
  [MEMORY[0x1E4F7A528] copyPixelsFromImage:outputImage rect:&buf destPtr:a3 destPtrRowBytes:a4];
  *(void *)&long long buf = a5;
  *((void *)&buf + 1) = a6;
  *(void *)long long v50 = a7;
  *(void *)&v50[8] = a8;
  [MEMORY[0x1E4F7A5F8] regionWithRect:&buf];
  v28 = double v27 = a3;
  id v29 = [(NUBufferImage *)self->_outputImage validRegion];
  uint64_t v30 = [v28 regionByRemovingRegion:v29];

  id v31 = objc_alloc(MEMORY[0x1E4F7A588]);
  uint64_t v32 = [(NUBufferImage *)self->_outputImage format];
  id v33 = objc_msgSend(v31, "initWithSize:format:rowBytes:mutableBytes:", a7, a8, v32, a4, v27);

  *(void *)&long long buf = 0;
  v41[0] = MEMORY[0x1E4F143A8];
  v41[1] = 3221225472;
  v41[2] = __74__PIInpaintCacheNode_provideImageData_bytesPerRow_origin::size::userInfo___block_invoke;
  v41[3] = &unk_1E5D80460;
  unint64_t v44 = a6;
  unint64_t v45 = a7;
  id v42 = v33;
  unint64_t v43 = v39;
  unint64_t v46 = a8;
  p_long long buf = &buf;
  id v34 = v33;
  [v30 enumerateRects:v41];
}

uint64_t __74__PIInpaintCacheNode_provideImageData_bytesPerRow_origin::size::userInfo___block_invoke(uint64_t a1, long long *a2)
{
  long long v9 = 0u;
  long long v10 = 0u;
  long long v3 = a2[1];
  long long v7 = *a2;
  long long v8 = v3;
  NUPixelRectOffset();
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 72);
  long long v7 = 0u;
  long long v8 = 0u;
  return [MEMORY[0x1E4F7A528] fillPixelsInBuffer:v4 rect:&v7 srcPixel:v5];
}

- (id)_evaluateImage:(id *)a3
{
  v24[1] = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [(NUCacheNode *)self inputNode];
  id v6 = [v5 outputImage:a3];

  if (v6)
  {
    long long v7 = [(NUCacheNode *)self inputNode];
    long long v8 = [v7 outputImageGeometry:a3];

    if (v8)
    {
      uint64_t v9 = [v8 scaledSize];
      uint64_t v11 = v10;
      uint64_t v23 = *MEMORY[0x1E4F1E3E8];
      id v12 = [MEMORY[0x1E4F1CA98] null];
      v24[0] = v12;
      id v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v24 forKeys:&v23 count:1];

      objc_initWeak(&location, self);
      v19[0] = MEMORY[0x1E4F143A8];
      v19[1] = 3221225472;
      v19[2] = __37__PIInpaintCacheNode__evaluateImage___block_invoke;
      v19[3] = &unk_1E5D80438;
      objc_copyWeak(&v21, &location);
      id v20 = v6;
      BOOL v13 = (void *)MEMORY[0x1AD0F8FE0](v19);
      id v14 = [(NUMutableBufferImage *)self->_inputImage format];
      long long v15 = [(NUMutableBufferImage *)self->_inputImage colorSpace];
      uint64_t v16 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1E050]), "initWithImageProvider:width:height:format:colorSpace:options:", v13, v9, v11, objc_msgSend(v14, "CIFormat"), objc_msgSend(v15, "CGColorSpace"), v18);

      objc_destroyWeak(&v21);
      objc_destroyWeak(&location);
    }
    else
    {
      uint64_t v16 = 0;
    }
  }
  else
  {
    uint64_t v16 = 0;
  }

  return v16;
}

void __37__PIInpaintCacheNode__evaluateImage___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained provideImageData:a2 bytesPerRow:a3 origin:a4 :a5 size:a6 :a7 userInfo:*(void *)(a1 + 32)];
}

- (BOOL)shouldCacheIntermediates
{
  return 1;
}

- (id)outputRegion
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  uint64_t v18 = 0;
  unint64_t v19 = &v18;
  uint64_t v20 = 0x3032000000;
  id v21 = __Block_byref_object_copy__15790;
  id v22 = __Block_byref_object_dispose__15791;
  id v23 = 0;
  inpaintQueue = self->_inpaintQueue;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __34__PIInpaintCacheNode_outputRegion__block_invoke;
  v17[3] = &unk_1E5D80410;
  v17[4] = self;
  v17[5] = &v18;
  dispatch_sync(inpaintQueue, v17);
  long long v3 = (void *)v19[5];
  if (!v3)
  {
    id v6 = NUAssertLogger_15728();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      long long v7 = [NSString stringWithFormat:@"Missing output region"];
      *(_DWORD *)long long buf = 138543362;
      double v25 = v7;
      _os_log_error_impl(&dword_1A9680000, v6, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    long long v8 = (const void **)MEMORY[0x1E4F7A308];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    uint64_t v10 = NUAssertLogger_15728();
    BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v11)
      {
        id v14 = dispatch_get_specific(*v8);
        long long v15 = [MEMORY[0x1E4F29060] callStackSymbols];
        uint64_t v16 = [v15 componentsJoinedByString:@"\n"];
        *(_DWORD *)long long buf = 138543618;
        double v25 = v14;
        __int16 v26 = 2114;
        double v27 = v16;
        _os_log_error_impl(&dword_1A9680000, v10, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v11)
    {
      id v12 = [MEMORY[0x1E4F29060] callStackSymbols];
      BOOL v13 = [v12 componentsJoinedByString:@"\n"];
      *(_DWORD *)long long buf = 138543362;
      double v25 = v13;
      _os_log_error_impl(&dword_1A9680000, v10, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler();
    __break(1u);
  }
  id v4 = v3;
  _Block_object_dispose(&v18, 8);

  return v4;
}

void __34__PIInpaintCacheNode_outputRegion__block_invoke(uint64_t a1)
{
}

- (id)_evaluateImageGeometry:(id *)a3
{
  v12.receiver = self;
  v12.super_class = (Class)PIInpaintCacheNode;
  id v13 = 0;
  uint64_t v5 = [(NUCacheNode *)&v12 _evaluateImageGeometry:&v13];
  if (v5)
  {
    id v6 = v13;
    long long v7 = [(PIInpaintCacheNode *)self _modifyEvaluatedGeometry:v5];
  }
  else
  {
    long long v8 = (void *)MEMORY[0x1E4F7A438];
    id v9 = v13;
    id v10 = [v8 errorWithCode:1 reason:@"Could not get the input geometry" object:self underlyingError:v9];

    long long v7 = 0;
    *a3 = v10;
  }

  return v7;
}

- (id)_modifyEvaluatedGeometry:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc(MEMORY[0x1E4F7A508]);
  if (v3)
  {
    [v3 extent];
  }
  else
  {
    long long v8 = 0u;
    long long v9 = 0u;
  }
  uint64_t v5 = objc_msgSend(v3, "orientation", v8, v9);
  id v6 = objc_msgSend(v4, "initWithExtent:renderScale:orientation:", &v8, *MEMORY[0x1E4F7A338], *(void *)(MEMORY[0x1E4F7A338] + 8), v5);

  return v6;
}

- (BOOL)_updateInputRegion:(id)a3 outputRegion:(id)a4 forOperation:(id)a5 geometry:(id)a6 error:(id *)a7
{
  uint64_t v73 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  uint64_t v16 = v15;
  long long v67 = 0u;
  long long v68 = 0u;
  if (v15) {
    [v15 extent];
  }
  if ([v14 mode] == 2)
  {
    BOOL v17 = [v14 brushStroke];
    uint64_t v18 = v17;
    if (v17)
    {
      [v17 extent];
    }
    else
    {
      long long v64 = 0u;
      long long v65 = 0u;
    }
    *(_OWORD *)long long v71 = v67;
    *(_OWORD *)&v71[16] = v68;
    NUPixelRectIntersection();
    long long v66 = *(_OWORD *)buf;
    uint64_t v20 = *(void *)&buf[24];
    uint64_t v19 = *(void *)&buf[16];

    goto LABEL_11;
  }
  if ([v14 mode] == 3 || objc_msgSend(v14, "mode") == 4)
  {
    [(PIInpaintCacheNode *)self _maskExtentForOperation:v14 error:a7];
    long long v66 = *(_OWORD *)buf;
    uint64_t v20 = *(void *)&buf[24];
    uint64_t v19 = *(void *)&buf[16];
LABEL_11:
    *(_OWORD *)long long buf = v66;
    *(void *)&buf[16] = v19;
    *(void *)&buf[24] = v20;
    if (NUPixelRectIsNull())
    {
      if (*MEMORY[0x1E4F7A750] != -1) {
        dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_276);
      }
      id v21 = *MEMORY[0x1E4F7A758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F7A758], OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)long long buf = 138543362;
        *(void *)&uint8_t buf[4] = v14;
        _os_log_fault_impl(&dword_1A9680000, v21, OS_LOG_TYPE_FAULT, "Invalid mask extent for operation %{public}@", buf, 0xCu);
      }
      [MEMORY[0x1E4F7A438] errorWithCode:2 reason:@"Invalid mask extent for operation" object:v14 underlyingError:*a7];
      char v22 = 0;
      *a7 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      long long v23 = *(_OWORD *)(MEMORY[0x1E4F7A320] + 16);
      *(_OWORD *)long long buf = *MEMORY[0x1E4F7A320];
      *(_OWORD *)&buf[16] = v23;
      if ([v14 hasExclusionMask])
      {
        [(PIInpaintCacheNode *)self _exclusionMaskExtentForOperation:v14 error:a7];
        *(_OWORD *)long long v71 = *(_OWORD *)buf;
        *(_OWORD *)&v71[16] = *(_OWORD *)&buf[16];
        if (NUPixelRectIsNull())
        {
          if (*MEMORY[0x1E4F7A750] != -1) {
            dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_276);
          }
          uint64_t v24 = *MEMORY[0x1E4F7A758];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F7A758], OS_LOG_TYPE_ERROR))
          {
            id v34 = *a7;
            *(_DWORD *)long long v71 = 138543618;
            *(void *)&v71[4] = v14;
            *(_WORD *)&v71[12] = 2114;
            *(void *)&v71[14] = v34;
            _os_log_error_impl(&dword_1A9680000, v24, OS_LOG_TYPE_ERROR, "Invalid exclusion mask extent for operation %{public}@, error %{public}@", v71, 0x16u);
          }
        }
      }
      if (+[PIInpaintRendering shouldDilateMaskForOperation:v14])
      {
        NUPixelSizeToCGSize();
        double v26 = v25;
        double v28 = v27;
        NUPixelSizeToCGSize();
        +[PIInpaintRendering dilationAmountForMaskSize:fullSize:](PIInpaintRendering, "dilationAmountForMaskSize:fullSize:", v26, v28, v29, v30);
        NUPixelRectDilate();
        *(_OWORD *)id v69 = *(_OWORD *)v71;
        long long v70 = *(_OWORD *)&v71[16];
        long long v62 = v67;
        long long v63 = v68;
        NUPixelRectIntersection();
        long long v66 = *(_OWORD *)v71;
        uint64_t v20 = *(void *)&v71[24];
        uint64_t v19 = *(void *)&v71[16];
      }
      memset(v71, 0, sizeof(v71));
      *(_OWORD *)id v69 = v66;
      *(void *)&long long v70 = v19;
      *((void *)&v70 + 1) = v20;
      long long v62 = *(_OWORD *)buf;
      long long v63 = *(_OWORD *)&buf[16];
      long long v60 = v67;
      long long v61 = v68;
      +[PIInpaintRendering sourceExtentForMaskExtent:v69 exclusionMaskExtent:&v62 imageExtent:&v60];
      *(_OWORD *)id v69 = *(_OWORD *)v71;
      long long v70 = *(_OWORD *)&v71[16];
      int IsNull = NUPixelRectIsNull();
      if (IsNull)
      {
        if (*MEMORY[0x1E4F7A750] != -1) {
          dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_276);
        }
        uint64_t v32 = *MEMORY[0x1E4F7A758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F7A758], OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)id v69 = 138543362;
          *(void *)&v69[4] = v14;
          _os_log_fault_impl(&dword_1A9680000, v32, OS_LOG_TYPE_FAULT, "Invalid source extent for operation %{public}@", v69, 0xCu);
        }
        *a7 = [MEMORY[0x1E4F7A438] invalidError:@"Invalid source extent for operation" object:v14];
      }
      else
      {
        *(_OWORD *)id v69 = *(_OWORD *)v71;
        long long v70 = *(_OWORD *)&v71[16];
        long long v62 = *(_OWORD *)v71;
        long long v63 = *(_OWORD *)&v71[16];
        long long v60 = v67;
        long long v61 = v68;
        NUPixelRectFlipYOrigin();
        long long v60 = *(_OWORD *)v71;
        long long v61 = *(_OWORD *)&v71[16];
        NUPixelRectFlipYOrigin();
        *(_OWORD *)long long v71 = v62;
        *(_OWORD *)&v71[16] = v63;
        [(PIInpaintCacheNode *)self padding];
        long long v60 = *(_OWORD *)v69;
        long long v61 = v70;
        NUPixelRectDilate();
        *(_OWORD *)id v69 = v62;
        long long v70 = v63;
        long long v62 = 0u;
        long long v63 = 0u;
        long long v60 = *(_OWORD *)v71;
        long long v61 = *(_OWORD *)&v71[16];
        NUAlignPixelRectToPixelGrid();
        long long v60 = v62;
        long long v61 = v63;
        long long v58 = v67;
        long long v59 = v68;
        NUPixelRectIntersection();
        [v12 addRect:v57];
        long long v60 = 0u;
        long long v61 = 0u;
        long long v58 = *(_OWORD *)v69;
        long long v59 = v70;
        NUAlignPixelRectToPixelGrid();
        long long v58 = v60;
        long long v59 = v61;
        NUPixelRectIntersection();
        [v12 addRect:v56];
        long long v58 = 0u;
        long long v59 = 0u;
        NUAlignPixelRectToPixelGrid();
        long long v54 = v58;
        long long v55 = v59;
        NUPixelRectIntersection();
        [v13 addRect:v53];
      }
      char v22 = IsNull ^ 1;
    }

    return v22;
  }
  double v35 = NUAssertLogger_15728();
  if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
  {
    id v36 = [NSString stringWithFormat:@"Invalid operation: %@", v14];
    *(_DWORD *)long long buf = 138543362;
    *(void *)&uint8_t buf[4] = v36;
    _os_log_error_impl(&dword_1A9680000, v35, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
  }
  id v37 = (const void **)MEMORY[0x1E4F7A308];
  specific = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
  unint64_t v39 = NUAssertLogger_15728();
  BOOL v40 = os_log_type_enabled(v39, OS_LOG_TYPE_ERROR);
  if (specific)
  {
    if (v40)
    {
      unint64_t v43 = dispatch_get_specific(*v37);
      unint64_t v44 = (void *)MEMORY[0x1E4F29060];
      id v45 = v43;
      unint64_t v46 = [v44 callStackSymbols];
      BOOL v47 = [v46 componentsJoinedByString:@"\n"];
      *(_DWORD *)long long buf = 138543618;
      *(void *)&uint8_t buf[4] = v43;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v47;
      _os_log_error_impl(&dword_1A9680000, v39, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
    }
  }
  else if (v40)
  {
    BOOL v41 = [MEMORY[0x1E4F29060] callStackSymbols];
    id v42 = [v41 componentsJoinedByString:@"\n"];
    *(_DWORD *)long long buf = 138543362;
    *(void *)&uint8_t buf[4] = v42;
    _os_log_error_impl(&dword_1A9680000, v39, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
  }
  id v48 = (PIInpaintCacheNode *)_NUAssertFailHandler();
  return -[PIInpaintCacheNode _exclusionMaskExtentForOperation:error:](v52, v48, v49, v50, v51);
}

- ($FD18CD26FAB5729647810B74E671536E)_exclusionMaskExtentForOperation:(SEL)a3 error:(id)a4
{
  retstr->var0 = 0u;
  retstr->var1 = 0u;
  id v8 = [a4 exclusionMaskIdentifiers];
  [(PIInpaintCacheNode *)self _extentForInputIdentifiers:v8 error:a5];

  return result;
}

- ($FD18CD26FAB5729647810B74E671536E)_maskExtentForOperation:(SEL)a3 error:(id)a4
{
  retstr->var0 = 0u;
  retstr->var1 = 0u;
  id v8 = [a4 maskIdentifiers];
  [(PIInpaintCacheNode *)self _extentForInputIdentifiers:v8 error:a5];

  return result;
}

- ($FD18CD26FAB5729647810B74E671536E)_extentForInputIdentifiers:(SEL)a3 error:(id)a4
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  $0AC6E346AE4835514AAA8AC86D8F4844 v21 = *($0AC6E346AE4835514AAA8AC86D8F4844 *)(MEMORY[0x1E4F7A320] + 16);
  $0AC6E346AE4835514AAA8AC86D8F4844 v22 = ($0AC6E346AE4835514AAA8AC86D8F4844)*MEMORY[0x1E4F7A320];
  $0AC6E346AE4835514AAA8AC86D8F4844 v29 = ($0AC6E346AE4835514AAA8AC86D8F4844)*MEMORY[0x1E4F7A320];
  $0AC6E346AE4835514AAA8AC86D8F4844 v30 = v21;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v9 = v8;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v25 objects:v31 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v26;
    while (2)
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v26 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = *(void *)(*((void *)&v25 + 1) + 8 * v13);
        id v15 = [(NURenderNode *)self inputs];
        uint64_t v16 = [v15 objectForKeyedSubscript:v14];

        BOOL v17 = [v16 outputImageGeometry:a5];
        if (!v17)
        {
          retstr->var0 = v22;
          retstr->var1 = v21;

          goto LABEL_11;
        }
        uint64_t v18 = v17;
        [v17 extent];
        $0AC6E346AE4835514AAA8AC86D8F4844 v23 = v29;
        $0AC6E346AE4835514AAA8AC86D8F4844 v24 = v30;
        NUPixelRectUnion();

        ++v13;
      }
      while (v11 != v13);
      uint64_t v11 = [v9 countByEnumeratingWithState:&v25 objects:v31 count:16];
      if (v11) {
        continue;
      }
      break;
    }
  }

  $0AC6E346AE4835514AAA8AC86D8F4844 v19 = v30;
  retstr->var0 = v29;
  retstr->var1 = v19;
LABEL_11:

  return result;
}

- (int64_t)padding
{
  return 80;
}

- (id)newImageOfSize:(id)a3 colorSpace:(id)a4
{
  int64_t var1 = a3.var1;
  int64_t var0 = a3.var0;
  id v6 = a4;
  long long v7 = objc_msgSend(MEMORY[0x1E4F7A510], "tiledLayoutForImageSize:tileSize:", var0, var1, 256, 256);
  if (([v6 hasCICP] & 1) == 0)
  {
    uint64_t v8 = [MEMORY[0x1E4F7A400] displayP3ColorSpace];

    id v6 = (id)v8;
  }
  if ([v6 isExtended]) {
    [MEMORY[0x1E4F7A5D8] RGBAh];
  }
  else {
  id v9 = [MEMORY[0x1E4F7A5D8] A2RGB10];
  }
  uint64_t v10 = [MEMORY[0x1E4F7A500] bufferImageWithLayout:v7 format:v9 colorSpace:v6];

  return v10;
}

- (BOOL)_tryLoad:(id *)a3
{
  uint64_t v92 = *MEMORY[0x1E4F143B8];
  if (self->_outputRegion) {
    return 1;
  }
  uint64_t v5 = [(NURenderNode *)self settings];
  id v6 = [v5 objectForKeyedSubscript:@"operations"];

  uint64_t v54 = [v6 count];
  long long v7 = [(PIInpaintCacheNode *)self _computeBaseIdentifier];
  uint64_t v8 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:");
  [v8 addObject:v7];
  long long v82 = 0u;
  long long v83 = 0u;
  long long v80 = 0u;
  long long v81 = 0u;
  id v9 = v6;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v80 objects:v91 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v81;
    do
    {
      uint64_t v12 = 0;
      uint64_t v13 = v7;
      do
      {
        if (*(void *)v81 != v11) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = *(void **)(*((void *)&v80 + 1) + 8 * v12);
        id v15 = objc_alloc_init(MEMORY[0x1E4F7A428]);
        objc_msgSend(v13, "nu_updateDigest:", v15);
        objc_msgSend(v14, "nu_updateDigest:", v15);
        long long v7 = [v15 stringValue];

        [v8 addObject:v7];
        ++v12;
        uint64_t v13 = v7;
      }
      while (v10 != v12);
      uint64_t v10 = [v9 countByEnumeratingWithState:&v80 objects:v91 count:16];
    }
    while (v10);
  }

  uint64_t v16 = [(NUCacheNode *)self inputNode];
  BOOL v17 = [v16 outputImageGeometry:a3];

  if (v17)
  {
    long long v53 = [(NURenderNode *)self imageProperties:a3];
    if (v53)
    {
      id v56 = objc_alloc_init(MEMORY[0x1E4F7A5A0]);
      id v18 = objc_alloc_init(MEMORY[0x1E4F7A5A0]);
      __int16 v57 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v54 + 1];
      $0AC6E346AE4835514AAA8AC86D8F4844 v19 = [MEMORY[0x1E4F7A5F8] region];
      [v57 addObject:v19];

      long long v78 = 0u;
      long long v79 = 0u;
      long long v76 = 0u;
      long long v77 = 0u;
      id obj = v9;
      uint64_t v20 = [obj countByEnumeratingWithState:&v76 objects:v90 count:16];
      if (v20)
      {
        uint64_t v21 = *(void *)v77;
        while (2)
        {
          for (uint64_t i = 0; i != v20; ++i)
          {
            if (*(void *)v77 != v21) {
              objc_enumerationMutation(obj);
            }
            if (![(PIInpaintCacheNode *)self _updateInputRegion:v56 outputRegion:v18 forOperation:*(void *)(*((void *)&v76 + 1) + 8 * i) geometry:v17 error:a3])
            {

              BOOL v3 = 0;
              goto LABEL_37;
            }
            $0AC6E346AE4835514AAA8AC86D8F4844 v23 = (void *)[v18 copy];
            [v57 addObject:v23];
          }
          uint64_t v20 = [obj countByEnumeratingWithState:&v76 objects:v90 count:16];
          if (v20) {
            continue;
          }
          break;
        }
      }

      $0AC6E346AE4835514AAA8AC86D8F4844 v24 = (NURegion *)[v18 copy];
      outputRegion = self->_outputRegion;
      self->_outputRegion = v24;

      long long v26 = (NURegion *)[v56 copy];
      inputRegion = self->_inputRegion;
      self->_inputRegion = v26;

      uint64_t v72 = 0;
      uint64_t v73 = &v72;
      uint64_t v74 = 0x2020000000;
      uint64_t v75 = 0x7FFFFFFFFFFFFFFFLL;
      uint64_t v66 = 0;
      long long v67 = &v66;
      uint64_t v68 = 0x3032000000;
      id v69 = __Block_byref_object_copy__15790;
      long long v70 = __Block_byref_object_dispose__15791;
      id v71 = 0;
      long long v28 = self;
      if ([(PIInpaintCacheNode *)self shouldCacheIntermediates])
      {
        $0AC6E346AE4835514AAA8AC86D8F4844 v29 = [(id)objc_opt_class() intermediateCache];
        v59[0] = MEMORY[0x1E4F143A8];
        v59[1] = 3221225472;
        v59[2] = __31__PIInpaintCacheNode__tryLoad___block_invoke;
        v59[3] = &unk_1E5D803E8;
        long long v63 = &v66;
        id v30 = v29;
        id v60 = v30;
        id v61 = v57;
        long long v62 = self;
        long long v64 = &v72;
        uint64_t v65 = v54;
        [v8 enumerateObjectsWithOptions:2 usingBlock:v59];

        long long v28 = self;
      }
      if (v67[5])
      {
        if (*MEMORY[0x1E4F7A750] != -1) {
          dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_276);
        }
        id v31 = (id)*MEMORY[0x1E4F7A758];
        if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
        {
          int v32 = [(NUCacheNode *)v28 subsampleFactor];
          uint64_t v33 = v73[3];
          *(_DWORD *)long long buf = 67109632;
          int v85 = v32;
          __int16 v86 = 1024;
          int v87 = v33;
          __int16 v88 = 1024;
          LODWORD(v89) = v54;
          _os_log_impl(&dword_1A9680000, v31, OS_LOG_TYPE_DEFAULT, "Inpaint intermediate #%d cache hit (operation #%d out of %d)", buf, 0x14u);
        }

        id v34 = [(id)v67[5] mutableImageCopy];
        inputImage = self->_inputImage;
        self->_inputImage = v34;

        objc_msgSend(obj, "subarrayWithRange:", v73[3], v54 - v73[3]);
        id v36 = (NSArray *)objc_claimAutoreleasedReturnValue();
        operations = self->_operations;
        self->_operations = v36;

        [(id)v67[5] endAccess];
        uint64_t v38 = self;
      }
      else
      {
        if (*MEMORY[0x1E4F7A750] != -1) {
          dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_276);
        }
        unint64_t v39 = (id)*MEMORY[0x1E4F7A758];
        if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
        {
          int v40 = [(NUCacheNode *)v28 subsampleFactor];
          *(_DWORD *)long long buf = 67109632;
          int v85 = v40;
          __int16 v86 = 1024;
          int v87 = v54;
          __int16 v88 = 2048;
          id v89 = v28;
          _os_log_impl(&dword_1A9680000, v39, OS_LOG_TYPE_DEFAULT, "Inpaint intermediate #%d cache miss [%d operations] (%p)", buf, 0x18u);
        }

        uint64_t v41 = [v17 scaledSize];
        uint64_t v43 = v42;
        unint64_t v44 = [v53 colorSpace];
        id v45 = -[PIInpaintCacheNode newImageOfSize:colorSpace:](self, "newImageOfSize:colorSpace:", v41, v43, v44);
        unint64_t v46 = self->_inputImage;
        self->_inputImage = v45;

        BOOL v47 = (NSArray *)[obj copy];
        id v48 = self->_operations;
        self->_operations = v47;

        uint64_t v38 = self;
      }
      uint64_t v49 = [v7 copy];
      cacheKey = v38->_cacheKey;
      v38->_cacheKey = (NSString *)v49;

      outputImage = self->_outputImage;
      self->_outputImage = 0;

      self->_sourceIsHDR = [v53 isHDR];
      self->_int64_t sourceOrientation = [v53 orientation];
      _Block_object_dispose(&v66, 8);

      _Block_object_dispose(&v72, 8);
      BOOL v3 = 1;
LABEL_37:
    }
    else
    {
      BOOL v3 = 0;
    }
  }
  else
  {
    BOOL v3 = 0;
  }

  return v3;
}

void __31__PIInpaintCacheNode__tryLoad___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  uint64_t v8 = [*(id *)(a1 + 32) objectForKey:v7];
  uint64_t v9 = *(void *)(*(void *)(a1 + 56) + 8);
  uint64_t v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v8;

  uint64_t v11 = *(void **)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
  if (v11)
  {
    [v11 beginAccess];
    uint64_t v12 = [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) validRegion];
    uint64_t v13 = [*(id *)(a1 + 40) objectAtIndexedSubscript:a3];
    int v14 = [v12 includesRegion:v13];

    if (v14)
    {
      *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = a3;
      *a4 = 1;
    }
    else
    {
      if (*MEMORY[0x1E4F7A750] != -1) {
        dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_276);
      }
      id v15 = (void *)*MEMORY[0x1E4F7A758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F7A758], OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v16 = *(void **)(a1 + 48);
        BOOL v17 = v15;
        int v18 = [v16 subsampleFactor];
        uint64_t v19 = *(void *)(a1 + 72);
        v20[0] = 67109632;
        v20[1] = v18;
        __int16 v21 = 1024;
        int v22 = a3;
        __int16 v23 = 1024;
        int v24 = v19;
        _os_log_impl(&dword_1A9680000, v17, OS_LOG_TYPE_DEFAULT, "Inpaint intermediate #%d cache miss [purged] (operation #%d out of %d)", (uint8_t *)v20, 0x14u);
      }
      [*(id *)(a1 + 32) removeObjectForKey:v7];
      [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) endAccess];
    }
  }
}

- (id)_computeBaseIdentifier
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F7A428]);
  id v4 = [(NUCacheNode *)self inputNode];
  objc_msgSend(v4, "nu_updateDigest:", v3);

  [v3 addString:@"subsample["];
  uint64_t v5 = objc_msgSend(NSNumber, "numberWithInteger:", -[NUCacheNode subsampleFactor](self, "subsampleFactor"));
  objc_msgSend(v5, "nu_updateDigest:", v3);

  [v3 addString:@"]"];
  id v6 = [v3 stringValue];

  return v6;
}

- (BOOL)tryLoad:(id *)a3
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x2020000000;
  inpaintQueue = self->_inpaintQueue;
  char v10 = 0;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __30__PIInpaintCacheNode_tryLoad___block_invoke;
  block[3] = &unk_1E5D803C0;
  block[4] = self;
  block[5] = &v7;
  block[6] = a3;
  dispatch_sync(inpaintQueue, block);
  char v4 = *((unsigned char *)v8 + 24);
  _Block_object_dispose(&v7, 8);
  return v4;
}

uint64_t __30__PIInpaintCacheNode_tryLoad___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) _tryLoad:*(void *)(a1 + 48)];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (id)evaluateRenderDependenciesWithRequest:(id)a3 error:(id *)a4
{
  v9.receiver = self;
  v9.super_class = (Class)PIInpaintCacheNode;
  id v6 = -[NUCacheNode evaluateRenderDependenciesWithRequest:error:](&v9, sel_evaluateRenderDependenciesWithRequest_error_, a3);
  if ([(PIInpaintCacheNode *)self tryLoad:a4]) {
    id v7 = v6;
  }
  else {
    id v7 = 0;
  }

  return v7;
}

- (id)nodeByReplayingAgainstCache:(id)a3 pipelineState:(id)a4 error:(id *)a5
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  if (!a5)
  {
    id v31 = NUAssertLogger_15728();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    {
      int v32 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "error != NULL");
      *(_DWORD *)long long buf = 138543362;
      id v50 = v32;
      _os_log_error_impl(&dword_1A9680000, v31, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    uint64_t v33 = (const void **)MEMORY[0x1E4F7A308];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    double v35 = NUAssertLogger_15728();
    BOOL v36 = os_log_type_enabled(v35, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v36)
      {
        unint64_t v39 = dispatch_get_specific(*v33);
        int v40 = (void *)MEMORY[0x1E4F29060];
        id v41 = v39;
        uint64_t v42 = [v40 callStackSymbols];
        uint64_t v43 = [v42 componentsJoinedByString:@"\n"];
        *(_DWORD *)long long buf = 138543618;
        id v50 = v39;
        __int16 v51 = 2114;
        long long v52 = v43;
        _os_log_error_impl(&dword_1A9680000, v35, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v36)
    {
      id v37 = [MEMORY[0x1E4F29060] callStackSymbols];
      uint64_t v38 = [v37 componentsJoinedByString:@"\n"];
      *(_DWORD *)long long buf = 138543362;
      id v50 = v38;
      _os_log_error_impl(&dword_1A9680000, v35, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler();
  }
  char v10 = v9;
  if ([v9 evaluationMode] == 1 || !objc_msgSend(v10, "evaluationMode"))
  {
    uint64_t v12 = (void *)[v10 copy];
    [v12 setDisableIntermediateCaching:0];
    v48.receiver = self;
    v48.super_class = (Class)PIInpaintCacheNode;
    uint64_t v13 = [(NUCacheNode *)&v48 nodeByReplayingAgainstCache:v8 pipelineState:v12 error:a5];
    if (v13)
    {
      if ([(NURenderNode *)self isCached])
      {
        id v11 = v13;
      }
      else
      {
        [v13 subsampleFactor];
        uint64_t v14 = NUScaleMake();
        uint64_t v16 = v15;
        [v10 scale];
        uint64_t v45 = v16;
        uint64_t v17 = NUScaleDivide();
        uint64_t v19 = v18;
        uint64_t v20 = (uint64_t *)MEMORY[0x1E4F7A338];
        uint64_t v44 = *MEMORY[0x1E4F7A338];
        uint64_t v47 = *(void *)(MEMORY[0x1E4F7A338] + 8);
        NUScaleMake();
        if (NUScaleCompare() < 1)
        {
          uint64_t v21 = v19;
          uint64_t v22 = v17;
          uint64_t v17 = v44;
        }
        else
        {
          objc_msgSend(v12, "setScale:", v14, v45);
          uint64_t v47 = v19;
          uint64_t v22 = *v20;
          uint64_t v21 = v20[1];
        }
        __int16 v23 = [(PIInpaintCacheNode *)self inpaintInputNode];
        int v24 = [v23 nodeByReplayingAgainstCache:v8 pipelineState:v12 error:a5];

        if (v24)
        {
          uint64_t v25 = -[PIInpaintCompositeNode initWithScale:sampleMode:input:retouch:]([PIInpaintCompositeNode alloc], "initWithScale:sampleMode:input:retouch:", v22, v21, [v10 sampleMode], v24, v13);
          id v11 = [MEMORY[0x1E4F7A610] nodeFromCache:v25 cache:v8];

          objc_msgSend(v11, "setEvaluatedForMode:", objc_msgSend(v10, "evaluationMode"));
          if ((NUScaleEqual() & 1) == 0)
          {
            id v46 = objc_alloc(MEMORY[0x1E4F7A678]);
            uint64_t v26 = v17;
            uint64_t v27 = [v10 scale];
            $0AC6E346AE4835514AAA8AC86D8F4844 v29 = objc_msgSend(v46, "initWithTargetScale:effectiveScale:sampleMode:input:", v27, v28, v26, v47, objc_msgSend(v10, "sampleMode"), v11);

            id v11 = [MEMORY[0x1E4F7A610] nodeFromCache:v29 cache:v8];

            objc_msgSend(v11, "setEvaluatedForMode:", objc_msgSend(v10, "evaluationMode"));
          }
        }
        else
        {
          id v11 = 0;
        }
      }
    }
    else
    {
      id v11 = 0;
    }
  }
  else
  {
    [MEMORY[0x1E4F7A438] invalidError:@"Cannot evaluate cache node" object:self];
    id v11 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v11;
}

- (int64_t)subsampleFactorForScale:(id)a3
{
  return 1;
}

- (BOOL)wantsDependentJob
{
  return 0;
}

- (id)descriptionSubClassHook
{
  return (id)objc_msgSend(NSString, "stringWithFormat:", @"Inpaint sub=%ld", -[NUCacheNode subsampleFactor](self, "subsampleFactor"));
}

- (PIInpaintCacheNode)initWithInputs:(id)a3 settings:(id)a4 subsampleFactor:(int64_t)a5
{
  id v8 = a3;
  id v9 = (void *)[a4 mutableCopy];
  [v9 setObject:*MEMORY[0x1E4F7A300] forKeyedSubscript:@"__dominantInputSettingsKey"];
  v14.receiver = self;
  v14.super_class = (Class)PIInpaintCacheNode;
  char v10 = [(NUCacheNode *)&v14 initWithInputs:v8 settings:v9 subsampleFactor:a5];

  dispatch_queue_t v11 = dispatch_queue_create("PIInpaintCacheNode", 0);
  inpaintQueue = v10->_inpaintQueue;
  v10->_inpaintQueue = (OS_dispatch_queue *)v11;

  return v10;
}

- (PIInpaintCacheNode)initWithInputs:(id)a3 settings:(id)a4
{
  return [(PIInpaintCacheNode *)self initWithInputs:a3 settings:a4 subsampleFactor:0];
}

+ (NSCache)intermediateCache
{
  if (intermediateCache_onceToken != -1) {
    dispatch_once(&intermediateCache_onceToken, &__block_literal_global_104_15915);
  }
  v2 = (void *)intermediateCache_s_inpaintIntermediateCache;
  return (NSCache *)v2;
}

uint64_t __39__PIInpaintCacheNode_intermediateCache__block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F1C998]);
  v1 = (void *)intermediateCache_s_inpaintIntermediateCache;
  intermediateCache_s_inpaintIntermediateCache = (uint64_t)v0;

  v2 = (void *)intermediateCache_s_inpaintIntermediateCache;
  return [v2 setCountLimit:5];
}

+ (void)purge
{
  id v2 = [a1 intermediateCache];
  [v2 removeAllObjects];
}

+ (id)inpaintNodeWithInput:(id)a3 operations:(id)a4 masks:(id)a5 error:(id *)a6
{
  uint64_t v72 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (!a6)
  {
    $0AC6E346AE4835514AAA8AC86D8F4844 v29 = NUAssertLogger_15728();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "error != nil");
      id v30 = (const void **)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)long long buf = 138543362;
      id v69 = v30;
      _os_log_error_impl(&dword_1A9680000, v29, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    id v31 = (const void **)MEMORY[0x1E4F7A308];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    uint64_t v33 = NUAssertLogger_15728();
    BOOL v34 = os_log_type_enabled(v33, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v34)
      {
        uint64_t v47 = dispatch_get_specific(*v31);
        objc_super v48 = (void *)MEMORY[0x1E4F29060];
        id v49 = v47;
        id v31 = [v48 callStackSymbols];
        id v50 = [v31 componentsJoinedByString:@"\n"];
        *(_DWORD *)long long buf = 138543618;
        id v69 = (const void **)v47;
        __int16 v70 = 2114;
        id v71 = v50;
        _os_log_error_impl(&dword_1A9680000, v33, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v34)
    {
      double v35 = [MEMORY[0x1E4F29060] callStackSymbols];
      id v31 = [v35 componentsJoinedByString:@"\n"];
      *(_DWORD *)long long buf = 138543362;
      id v69 = v31;
      _os_log_error_impl(&dword_1A9680000, v33, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    int v39 = _NUAssertFailHandler();
    goto LABEL_35;
  }
  if (!v9)
  {
    BOOL v36 = NUAssertLogger_15728();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "input != nil");
      id v37 = (const void **)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)long long buf = 138543362;
      id v69 = v37;
      _os_log_error_impl(&dword_1A9680000, v36, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    id v31 = (const void **)MEMORY[0x1E4F7A308];
    uint64_t v38 = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    uint64_t v33 = NUAssertLogger_15728();
    int v39 = os_log_type_enabled(v33, OS_LOG_TYPE_ERROR);
    if (!v38)
    {
      if (v39)
      {
        int v40 = [MEMORY[0x1E4F29060] callStackSymbols];
        id v31 = [v40 componentsJoinedByString:@"\n"];
        *(_DWORD *)long long buf = 138543362;
        id v69 = v31;
        _os_log_error_impl(&dword_1A9680000, v33, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
      }
LABEL_37:

      int v44 = _NUAssertFailHandler();
      goto LABEL_38;
    }
LABEL_35:
    if (v39)
    {
      __int16 v51 = dispatch_get_specific(*v31);
      long long v52 = (void *)MEMORY[0x1E4F29060];
      id v53 = v51;
      id v31 = [v52 callStackSymbols];
      uint64_t v54 = [v31 componentsJoinedByString:@"\n"];
      *(_DWORD *)long long buf = 138543618;
      id v69 = (const void **)v51;
      __int16 v70 = 2114;
      id v71 = v54;
      _os_log_error_impl(&dword_1A9680000, v33, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
    }
    goto LABEL_37;
  }
  if (!v10)
  {
    id v41 = NUAssertLogger_15728();
    if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "operations != nil");
      uint64_t v42 = (const void **)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)long long buf = 138543362;
      id v69 = v42;
      _os_log_error_impl(&dword_1A9680000, v41, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    id v31 = (const void **)MEMORY[0x1E4F7A308];
    uint64_t v43 = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    uint64_t v33 = NUAssertLogger_15728();
    int v44 = os_log_type_enabled(v33, OS_LOG_TYPE_ERROR);
    if (!v43)
    {
      if (v44)
      {
        uint64_t v45 = [MEMORY[0x1E4F29060] callStackSymbols];
        id v46 = [v45 componentsJoinedByString:@"\n"];
        *(_DWORD *)long long buf = 138543362;
        id v69 = v46;
        _os_log_error_impl(&dword_1A9680000, v33, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
      }
      goto LABEL_40;
    }
LABEL_38:
    if (v44)
    {
      long long v55 = dispatch_get_specific(*v31);
      id v56 = (void *)MEMORY[0x1E4F29060];
      id v57 = v55;
      long long v58 = [v56 callStackSymbols];
      long long v59 = [v58 componentsJoinedByString:@"\n"];
      *(_DWORD *)long long buf = 138543618;
      id v69 = (const void **)v55;
      __int16 v70 = 2114;
      id v71 = v59;
      _os_log_error_impl(&dword_1A9680000, v33, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
    }
LABEL_40:

    _NUAssertFailHandler();
  }
  uint64_t v12 = v11;
  id v60 = a6;
  id v61 = v10;
  uint64_t v13 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(v11, "count") + 1);
  uint64_t v14 = *MEMORY[0x1E4F7A300];
  [v13 setObject:v9 forKeyedSubscript:*MEMORY[0x1E4F7A300]];
  long long v65 = 0u;
  long long v66 = 0u;
  long long v63 = 0u;
  long long v64 = 0u;
  id v15 = v12;
  uint64_t v16 = [v15 countByEnumeratingWithState:&v63 objects:v67 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v64;
    while (2)
    {
      for (uint64_t i = 0; i != v17; ++i)
      {
        if (*(void *)v64 != v18) {
          objc_enumerationMutation(v15);
        }
        uint64_t v20 = *(void **)(*((void *)&v63 + 1) + 8 * i);
        id v62 = 0;
        uint64_t v21 = (void *)[v20 newSourceNode:&v62];
        id v22 = v62;
        if (!v21)
        {
          *id v60 = [MEMORY[0x1E4F7A438] errorWithCode:1 reason:@"Failed to create inpaint mask source node" object:v20 underlyingError:v22];

          uint64_t v27 = 0;
          int v24 = v15;
          uint64_t v25 = v61;
          goto LABEL_14;
        }
        __int16 v23 = [v20 assetIdentifier];
        [v13 setObject:v21 forKeyedSubscript:v23];
      }
      uint64_t v17 = [v15 countByEnumeratingWithState:&v63 objects:v67 count:16];
      if (v17) {
        continue;
      }
      break;
    }
  }

  int v24 = [MEMORY[0x1E4F1CA60] dictionary];
  [v24 setObject:v14 forKeyedSubscript:@"__dominantInputSettingsKey"];
  uint64_t v25 = v61;
  uint64_t v26 = PFMap();
  [v24 setObject:v26 forKeyedSubscript:@"operations"];

  uint64_t v27 = [(NURenderNode *)[PIInpaintPlaceholderNode alloc] initWithSettings:v24 inputs:v13];
LABEL_14:

  return v27;
}

PIInpaintOperation *__66__PIInpaintCacheNode_inpaintNodeWithInput_operations_masks_error___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [[PIInpaintOperation alloc] initWithDictionary:v2];

  return v3;
}

@end