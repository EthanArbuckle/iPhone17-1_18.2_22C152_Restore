@interface PILongExposureRegistrationJob
- ($FD18CD26FAB5729647810B74E671536E)guideExtent;
- (BOOL)prepare:(id *)a3;
- (BOOL)render:(id *)a3;
- (BOOL)wantsCompleteStage;
- (BOOL)wantsOutputGeometry;
- (BOOL)wantsOutputImage;
- (BOOL)wantsRenderScaleClampedToNativeScale;
- (CIImage)stillImage;
- (VNImageHomographicAlignmentObservation)observation;
- (id)newRenderPipelineStateForEvaluationMode:(int64_t)a3;
- (id)result;
- (id)scalePolicy;
- (void)setGuideExtent:(id *)a3;
- (void)setObservation:(id)a3;
- (void)setStillImage:(id)a3;
@end

@implementation PILongExposureRegistrationJob

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observation, 0);
  objc_storeStrong((id *)&self->_stillImage, 0);
}

- (void)setObservation:(id)a3
{
}

- (VNImageHomographicAlignmentObservation)observation
{
  return self->_observation;
}

- (void)setStillImage:(id)a3
{
}

- (CIImage)stillImage
{
  return self->_stillImage;
}

- (void)setGuideExtent:(id *)a3
{
  $0AC6E346AE4835514AAA8AC86D8F4844 var1 = a3->var1;
  self->_guideExtent.origin = ($86B46DF249C2B4242DBB096758D29184)a3->var0;
  self->_guideExtent.size = ($5BB7312FFE32F1AB3F1F5957C99A58B3)var1;
}

- ($FD18CD26FAB5729647810B74E671536E)guideExtent
{
  $0AC6E346AE4835514AAA8AC86D8F4844 v3 = *($0AC6E346AE4835514AAA8AC86D8F4844 *)&self[8].var0.var1;
  retstr->var0 = *($0AC6E346AE4835514AAA8AC86D8F4844 *)&self[7].var1.var1;
  retstr->$0AC6E346AE4835514AAA8AC86D8F4844 var1 = v3;
  return self;
}

- (id)result
{
  $0AC6E346AE4835514AAA8AC86D8F4844 v3 = objc_alloc_init(_PILongExposureRegistrationResult);
  v4 = [(PILongExposureRegistrationJob *)self observation];
  [(_PILongExposureRegistrationResult *)v3 setObservation:v4];

  [(PILongExposureRegistrationJob *)self guideExtent];
  v6[0] = v6[2];
  v6[1] = v6[3];
  [(_PILongExposureRegistrationResult *)v3 setExtent:v6];
  return v3;
}

- (BOOL)render:(id *)a3
{
  uint64_t v116 = *MEMORY[0x1E4F143B8];
  if (!a3)
  {
    v74 = NUAssertLogger_14610();
    if (os_log_type_enabled(v74, OS_LOG_TYPE_ERROR))
    {
      v75 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "error != nil");
      LODWORD(v115.a) = 138543362;
      *(void *)((char *)&v115.a + 4) = v75;
      _os_log_error_impl(&dword_1A9680000, v74, OS_LOG_TYPE_ERROR, "Fail: %{public}@", (uint8_t *)&v115, 0xCu);
    }
    v76 = (const void **)MEMORY[0x1E4F7A308];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    v77 = NUAssertLogger_14610();
    BOOL v78 = os_log_type_enabled(v77, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v78)
      {
        specific = dispatch_get_specific(*v76);
        v80 = (void *)MEMORY[0x1E4F29060];
        id v81 = specific;
        v82 = [v80 callStackSymbols];
        v83 = [v82 componentsJoinedByString:@"\n"];
        LODWORD(v115.a) = 138543618;
        *(void *)((char *)&v115.a + 4) = specific;
        WORD2(v115.b) = 2114;
        *(void *)((char *)&v115.b + 6) = v83;
        _os_log_error_impl(&dword_1A9680000, v77, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", (uint8_t *)&v115, 0x16u);
      }
    }
    else if (v78)
    {
      specific = [MEMORY[0x1E4F29060] callStackSymbols];
      v79 = [specific componentsJoinedByString:@"\n"];
      LODWORD(v115.a) = 138543362;
      *(void *)((char *)&v115.a + 4) = v79;
      _os_log_error_impl(&dword_1A9680000, v77, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", (uint8_t *)&v115, 0xCu);
    }
    _NUAssertFailHandler();
    goto LABEL_30;
  }
  v5 = -[NURenderJob renderer:](self, "renderer:");
  if (v5)
  {
    v98 = a3;
    id v102 = v5;
    v6 = [(PILongExposureRegistrationJob *)self stillImage];
    v7 = [(NURenderJob *)self outputImage];
    v8 = [(NURenderJob *)self outputGeometry];
    [v8 renderScale];

    NUScaleInvert();
    NUScaleToDouble();
    memset(&v115, 0, sizeof(v115));
    CGAffineTransformMakeScale(&v115, v9, v9);
    v97 = v7;
    v10 = [v7 imageByClampingToExtent];
    CGAffineTransform v109 = v115;
    v11 = [v10 imageByApplyingTransform:&v109];

    memset(&v109, 0, 32);
    v101 = self;
    [(PILongExposureRegistrationJob *)self guideExtent];
    long long v12 = *(_OWORD *)&v109.c;
    v13 = +[PIAutoLoopKernels rgbToLumaKernel];
    v14 = [MEMORY[0x1E4F7A400] sRGBColorSpace];
    long long buf = *(_OWORD *)&v109.a;
    long long v114 = *(_OWORD *)&v109.c;
    NUPixelRectToCGRect();
    double v16 = v15;
    double v18 = v17;
    double v20 = v19;
    double v22 = v21;
    v94 = v6;
    v23 = objc_msgSend(v6, "imageByColorMatchingWorkingSpaceToColorSpace:", objc_msgSend(v14, "CGColorSpace"));
    v112 = v23;
    v24 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v112 count:1];
    v25 = objc_msgSend(v13, "applyWithExtent:arguments:", v24, v16, v18, v20, v22);

    long long buf = 0uLL;
    long long v114 = v12;
    NUPixelRectToCGRect();
    double v27 = v26;
    double v29 = v28;
    double v31 = v30;
    double v33 = v32;
    v95 = v14;
    v96 = v11;
    v34 = objc_msgSend(v11, "imageByColorMatchingWorkingSpaceToColorSpace:", objc_msgSend(v14, "CGColorSpace"));
    v111 = v34;
    v35 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v111 count:1];
    v36 = objc_msgSend(v13, "applyWithExtent:arguments:", v35, v27, v29, v31, v33);

    long long buf = *(_OWORD *)&v109.a;
    long long v114 = *(_OWORD *)&v109.c;
    NUPixelRectToCGRect();
    v37 = objc_msgSend(v25, "imageByCroppingToRect:");
    long long buf = *(_OWORD *)&v109.a;
    long long v114 = *(_OWORD *)&v109.c;
    CGFloat v38 = (double)-NUMinX();
    long long buf = *(_OWORD *)&v109.a;
    long long v114 = *(_OWORD *)&v109.c;
    uint64_t v39 = NUMinY();
    CGAffineTransformMakeTranslation(&v108, v38, (double)-v39);
    uint64_t v40 = [v37 imageByApplyingTransform:&v108];

    specific = objc_msgSend(MEMORY[0x1E4F7A718], "newPixelBufferOfSize:format:", *(void *)&v109.c, *(void *)&v109.d, 1278226488);
    uint64_t v42 = [MEMORY[0x1E4F7A718] newPixelBufferOfSize:v12 format:1278226488];
    v99 = (void *)v40;
    v100 = (void *)v42;
    if (!specific || (v43 = (void *)v42) == 0)
    {
      [MEMORY[0x1E4F7A438] failureError:@"Failed to allocate intermediate pixel buffer" object:v101];
      BOOL v67 = 0;
      v69 = v97;
      id *v98 = (id)objc_claimAutoreleasedReturnValue();
      v71 = v95;
      v70 = v96;
LABEL_20:

      v5 = v102;
      goto LABEL_21;
    }
    v87 = v13;
    v89 = specific;
    v44 = v36;
    v45 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1E070]), "initWithPixelBuffer:", objc_msgSend(specific, "CVPixelBuffer"));
    v46 = objc_msgSend(NSString, "stringWithFormat:", @"PILongExposureRegistrationJob-render-j%lld", -[NURenderJob jobNumber](v101, "jobNumber"));
    [v45 setLabel:v46];

    uint64_t v47 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1E070]), "initWithPixelBuffer:", objc_msgSend(v43, "CVPixelBuffer"));
    v48 = objc_msgSend(NSString, "stringWithFormat:", @"PILongExposureRegistrationJob-reference-j%lld", -[NURenderJob jobNumber](v101, "jobNumber"));
    [v45 setLabel:v48];

    v106[0] = 0;
    v106[1] = 0;
    long long v107 = *(_OWORD *)&v109.c;
    uint64_t v49 = *MEMORY[0x1E4F7A318];
    uint64_t v50 = *(void *)(MEMORY[0x1E4F7A318] + 8);
    v91 = v45;
    v51 = objc_msgSend(v102, "renderImage:rect:toDestination:atPoint:error:", v40, v106, v45, *MEMORY[0x1E4F7A318], v50, v98);
    v104[0] = 0;
    v104[1] = 0;
    long long v105 = v12;
    v88 = v44;
    v52 = objc_msgSend(v102, "renderImage:rect:toDestination:atPoint:error:", v44, v104, v47, v49, v50, v98);
    v93 = v51;
    uint64_t v53 = [v51 waitUntilCompletedAndReturnError:v98];
    v90 = (void *)v47;
    v92 = v52;
    if (!v53
      || (v54 = (void *)v53,
          [v52 waitUntilCompletedAndReturnError:v98],
          v55 = objc_claimAutoreleasedReturnValue(),
          v55,
          v54,
          !v55))
    {
      [MEMORY[0x1E4F7A438] errorWithCode:1 reason:@"Failed to render luma" object:v101 underlyingError:*v98];
      BOOL v67 = 0;
      id *v98 = (id)objc_claimAutoreleasedReturnValue();
      v6 = v94;
      v71 = v95;
      v70 = v96;
      v69 = v97;
      v13 = v87;
      v36 = v88;
      specific = v89;
LABEL_19:

      goto LABEL_20;
    }
    id v56 = objc_alloc(MEMORY[0x1E4F45860]);
    specific = v89;
    uint64_t v57 = [v89 CVPixelBuffer];
    v58 = (void *)[v56 initWithTargetedCVPixelBuffer:v57 options:MEMORY[0x1E4F1CC08]];
    id v59 = objc_alloc(MEMORY[0x1E4F45890]);
    uint64_t v60 = [v100 CVPixelBuffer];
    v61 = [MEMORY[0x1E4F7A448] sharedFactory];
    uint64_t v62 = [v61 visionSession];
    v63 = (void *)[v59 initWithCVPixelBuffer:v60 options:MEMORY[0x1E4F1CC08] session:v62];

    v110 = v58;
    v64 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v110 count:1];
    id v103 = 0;
    LOBYTE(v62) = [v63 performRequests:v64 error:&v103];
    id v86 = v103;

    v84 = v63;
    v85 = v58;
    if (v62)
    {
      v65 = [v58 results];
      uint64_t v66 = [v65 count];
      BOOL v67 = v66 == 1;
      if (v66 == 1)
      {
        v68 = [v65 objectAtIndexedSubscript:0];
        [(PILongExposureRegistrationJob *)v101 setObservation:v68];
      }
      else
      {
        id *v98 = [MEMORY[0x1E4F7A438] errorWithCode:1 reason:@"Image registration failure (expected 1 observation)" object:v101];
      }
      v6 = v94;
      v13 = v87;

      v70 = v96;
      v69 = v97;
      v71 = v95;
      v36 = v88;
LABEL_18:

      goto LABEL_19;
    }
    if (*MEMORY[0x1E4F7A750] == -1)
    {
LABEL_15:
      v6 = v94;
      v71 = v95;
      v70 = v96;
      v69 = v97;
      v13 = v87;
      v36 = v88;
      v72 = *MEMORY[0x1E4F7A760];
      BOOL v67 = 1;
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F7A760], OS_LOG_TYPE_INFO))
      {
        LODWORD(buf) = 138412290;
        *(void *)((char *)&buf + 4) = v86;
        _os_log_impl(&dword_1A9680000, v72, OS_LOG_TYPE_INFO, "High-resolution image registration failure : %@", (uint8_t *)&buf, 0xCu);
      }
      goto LABEL_18;
    }
LABEL_30:
    dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_290);
    goto LABEL_15;
  }
  BOOL v67 = 0;
LABEL_21:

  return v67;
}

- (BOOL)prepare:(id *)a3
{
  v78[1] = *MEMORY[0x1E4F143B8];
  if (!a3)
  {
    id v56 = NUAssertLogger_14610();
    if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR))
    {
      uint64_t v57 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "error != nil");
      *(_DWORD *)long long buf = 138543362;
      *(void *)&buf[4] = v57;
      _os_log_error_impl(&dword_1A9680000, v56, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    p_isa = (const void **)MEMORY[0x1E4F7A308];
    id specific = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    v8 = NUAssertLogger_14610();
    BOOL v58 = os_log_type_enabled(v8, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v58)
      {
        id v59 = dispatch_get_specific(*p_isa);
        uint64_t v60 = (void *)MEMORY[0x1E4F29060];
        id specific = v59;
        p_isa = [v60 callStackSymbols];
        $0AC6E346AE4835514AAA8AC86D8F4844 v3 = [p_isa componentsJoinedByString:@"\n"];
        *(_DWORD *)long long buf = 138543618;
        *(void *)&buf[4] = v59;
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v3;
        _os_log_error_impl(&dword_1A9680000, v8, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v58)
    {
      id specific = [MEMORY[0x1E4F29060] callStackSymbols];
      p_isa = [specific componentsJoinedByString:@"\n"];
      *(_DWORD *)long long buf = 138543362;
      *(void *)&buf[4] = p_isa;
      _os_log_error_impl(&dword_1A9680000, v8, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    uint64_t v62 = "error != nil";
    _NUAssertFailHandler();
    __break(1u);
    goto LABEL_39;
  }
  v4 = a3;
  p_isa = (const void **)&self->super.super.isa;
  v72.receiver = self;
  v72.super_class = (Class)PILongExposureRegistrationJob;
  if (!-[NURenderJob prepare:](&v72, sel_prepare_)) {
    return 0;
  }
  if (([p_isa _shouldWaitForDependentJobs] & 1) == 0)
  {
    v7 = (void *)[p_isa newRenderPipelineStateForEvaluationMode:0];
    v8 = [objc_alloc(MEMORY[0x1E4F7A618]) initWithBlock:&__block_literal_global_229];
    v78[0] = v8;
    CGFloat v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v78 count:1];
    [v7 setPipelineFilters:v9];

    v10 = [p_isa prepareNodeWithPipelineState:v7 error:v4];
    id specific = (id)[p_isa newRenderPipelineStateForEvaluationMode:1];

    objc_msgSend(specific, "setScale:", *MEMORY[0x1E4F7A338], *(void *)(MEMORY[0x1E4F7A338] + 8));
    $0AC6E346AE4835514AAA8AC86D8F4844 v3 = [v10 nodeByReplayingAgainstCache:specific error:v4];

    if (!v3)
    {
      BOOL v6 = 0;
LABEL_43:

      return v6;
    }
    if (*MEMORY[0x1E4F7A750] == -1)
    {
LABEL_8:
      long long v12 = (void *)*MEMORY[0x1E4F7A760];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F7A760], OS_LOG_TYPE_DEBUG))
      {
        v45 = v12;
        v46 = [v3 debugDescription];
        *(_DWORD *)long long buf = 138412290;
        *(void *)&buf[4] = v46;
        _os_log_debug_impl(&dword_1A9680000, v45, OS_LOG_TYPE_DEBUG, "Still image node:\n%@", buf, 0xCu);
      }
      v13 = objc_msgSend(v3, "outputImageGeometry:", v4, v62);
      if (!v13) {
        goto LABEL_23;
      }
      if (*MEMORY[0x1E4F7A750] != -1) {
        dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_290);
      }
      v14 = (void *)*MEMORY[0x1E4F7A760];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F7A760], OS_LOG_TYPE_DEBUG))
      {
        uint64_t v47 = v14;
        v48 = [v13 debugDescription];
        *(_DWORD *)long long buf = 138412290;
        *(void *)&buf[4] = v48;
        _os_log_debug_impl(&dword_1A9680000, v47, OS_LOG_TYPE_DEBUG, "Still image geometry:\n%@", buf, 0xCu);
      }
      uint64_t v15 = [v3 outputImage:v4];
      [p_isa setStillImage:v15];

      double v16 = [p_isa stillImage];
      LOBYTE(v15) = v16 == 0;

      if (v15)
      {
LABEL_23:
        BOOL v6 = 0;
      }
      else
      {
        if (*MEMORY[0x1E4F7A750] != -1) {
          dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_290);
        }
        double v17 = (void *)*MEMORY[0x1E4F7A760];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F7A760], OS_LOG_TYPE_DEBUG))
        {
          uint64_t v49 = v17;
          uint64_t v50 = [p_isa stillImage];
          v51 = [v50 debugDescription];
          *(_DWORD *)long long buf = 138412290;
          *(void *)&buf[4] = v51;
          _os_log_debug_impl(&dword_1A9680000, v49, OS_LOG_TYPE_DEBUG, "Still image:\n%@", buf, 0xCu);
        }
        double v18 = [p_isa prepareNode];
        double v19 = [v18 videoProperties:v4];

        if (v19)
        {
          double v20 = [p_isa registrationRequest];
          double v21 = v20;
          if (v20)
          {
            [v20 cleanAperture];
          }
          else
          {
            long long v70 = 0u;
            long long v71 = 0u;
          }
          NUPixelRectToCGRect();
          CGFloat v23 = v22;
          CGFloat v25 = v24;
          CGFloat v27 = v26;
          CGFloat v29 = v28;

          double v30 = [p_isa outputGeometry];
          [v30 renderScale];

          double v31 = [p_isa outputGeometry];
          uint64_t v32 = [v31 size];
          uint64_t v65 = v33;
          uint64_t v66 = v32;

          v34 = [p_isa registrationRequest];
          v35 = [v34 recipe];
          v36 = PIAutoLoopRecipeForFlavor(v35, 3);

          double CropRect = PIAutoLoopRecipeGetCropRect(v36);
          CGFloat v39 = v38;
          CGFloat v41 = v40;
          CGFloat v43 = v42;

          NUScaleInvert();
          NUScaleToDouble();
          NUScaleRect();
          long long v68 = 0u;
          NUPixelRectFromCGRect();
          *(void *)&long long v69 = v66;
          *((void *)&v69 + 1) = v65;
          if (*MEMORY[0x1E4F7A750] != -1) {
            dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_290);
          }
          v44 = (void *)*MEMORY[0x1E4F7A760];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F7A760], OS_LOG_TYPE_DEBUG))
          {
            v63 = v44;
            v79.origin.x = v23;
            v79.origin.y = v25;
            v79.size.width = v27;
            v79.size.height = v29;
            v64 = NSStringFromRect(v79);
            v80.origin.x = CropRect;
            v80.origin.y = v39;
            v80.size.width = v41;
            v80.size.height = v43;
            v52 = NSStringFromRect(v80);
            uint64_t v53 = NSStringFromNUPixelSize();
            v54 = NUScaleToString();
            *(_OWORD *)long long buf = v68;
            *(_OWORD *)&buf[16] = v69;
            v55 = NSStringFromNUPixelRect();
            *(_DWORD *)long long buf = 138413314;
            *(void *)&buf[4] = v64;
            *(_WORD *)&buf[12] = 2112;
            *(void *)&buf[14] = v52;
            *(_WORD *)&buf[22] = 2112;
            *(void *)&buf[24] = v53;
            __int16 v74 = 2112;
            v75 = v54;
            __int16 v76 = 2112;
            v77 = v55;
            _os_log_debug_impl(&dword_1A9680000, v63, OS_LOG_TYPE_DEBUG, "clap=%@, crop=%@, fullSize=%@, videoScale=%@ => guide rect: %@", buf, 0x34u);
          }
          v67[0] = v68;
          v67[1] = v69;
          [p_isa setGuideExtent:v67];
          BOOL v6 = 1;
        }
        else
        {
          BOOL v6 = 0;
        }
      }
      goto LABEL_43;
    }
LABEL_39:
    dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_290);
    goto LABEL_8;
  }
  return 1;
}

id __41__PILongExposureRegistrationJob_prepare___block_invoke(uint64_t a1, void *a2, void *a3, uint64_t a4, uint64_t a5)
{
  id v7 = a2;
  v8 = [a3 objectForKeyedSubscript:@"source"];
  CGFloat v9 = [v7 renderNodeFromSource:v8 settings:&unk_1F000AF58 error:a5];

  return v9;
}

- (id)newRenderPipelineStateForEvaluationMode:(int64_t)a3
{
  v9[1] = *MEMORY[0x1E4F143B8];
  v8.receiver = self;
  v8.super_class = (Class)PILongExposureRegistrationJob;
  id v4 = -[NURenderJob newRenderPipelineStateForEvaluationMode:](&v8, sel_newRenderPipelineStateForEvaluationMode_);
  if (!a3)
  {
    v5 = [MEMORY[0x1E4F7A618] stopAtTagFilter:@"/AutoLoop/LongExposure"];
    v9[0] = v5;
    BOOL v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:1];
    [v4 setPipelineFilters:v6];
  }
  return v4;
}

- (id)scalePolicy
{
  return (id)[MEMORY[0x1E4F7A478] oneToOneScalePolicy];
}

- (BOOL)wantsRenderScaleClampedToNativeScale
{
  return 1;
}

- (BOOL)wantsCompleteStage
{
  return 0;
}

- (BOOL)wantsOutputImage
{
  return 1;
}

- (BOOL)wantsOutputGeometry
{
  return 1;
}

@end