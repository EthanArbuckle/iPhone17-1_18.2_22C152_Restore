@interface PIVideoReframeNode
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)frameDuration;
- ($FD18CD26FAB5729647810B74E671536E)stabCropRect;
- (BOOL)canPropagateOriginalLivePhotoMetadataTrack;
- (BOOL)requiresVideoComposition;
- (BOOL)shouldApplyWatermark;
- (BOOL)shouldCacheNodeForPipelineState:(id)a3;
- (NUVideoProperties)inputVideoProperties;
- (PIReframeKeyframeSequence)keyframeSequence;
- (PIVideoReframeNode)initWithKeyframes:(id)a3 stabCropRect:(id *)a4 input:(id)a5;
- (PIVideoReframeNode)initWithSettings:(id)a3 inputs:(id)a4;
- (id)_evaluateImage:(id *)a3;
- (id)_evaluateImageGeometry:(id *)a3;
- (id)_evaluateVideoProperties:(id *)a3;
- (id)_stabilizeImage:(void *)a3 cleanRect:(void *)a4 cropRect:(uint64_t)a5 transform:(uint64_t)a6 geometry:(uint64_t)a7;
- (id)resolvedNodeWithCachedInputs:(id)a3 settings:(id)a4 pipelineState:(id)a5 error:(id *)a6;
- (void)setFrameDuration:(id *)a3;
- (void)setInputVideoProperties:(id)a3;
- (void)setKeyframeSequence:(id)a3;
- (void)setShouldApplyWatermark:(BOOL)a3;
- (void)setStabCropRect:(id *)a3;
@end

@implementation PIVideoReframeNode

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inputVideoProperties, 0);
  objc_storeStrong((id *)&self->_keyframeSequence, 0);
}

- (void)setShouldApplyWatermark:(BOOL)a3
{
  self->_shouldApplyWatermark = a3;
}

- (BOOL)shouldApplyWatermark
{
  return self->_shouldApplyWatermark;
}

- (void)setFrameDuration:(id *)a3
{
  int64_t var3 = a3->var3;
  *(_OWORD *)&self->_frameDuration.value = *(_OWORD *)&a3->var0;
  self->_frameDuration.epoch = var3;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)frameDuration
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = ($95D729B680665BEAEFA1D6FCA8238556)self[8];
  return self;
}

- (void)setInputVideoProperties:(id)a3
{
}

- (NUVideoProperties)inputVideoProperties
{
  return self->_inputVideoProperties;
}

- (void)setStabCropRect:(id *)a3
{
  $0AC6E346AE4835514AAA8AC86D8F4844 var1 = a3->var1;
  self->_stabCropRect.origin = ($86B46DF249C2B4242DBB096758D29184)a3->var0;
  self->_stabCropRect.size = ($5BB7312FFE32F1AB3F1F5957C99A58B3)var1;
}

- ($FD18CD26FAB5729647810B74E671536E)stabCropRect
{
  $0AC6E346AE4835514AAA8AC86D8F4844 v3 = *($0AC6E346AE4835514AAA8AC86D8F4844 *)&self[7].var0.var1;
  retstr->var0 = *($0AC6E346AE4835514AAA8AC86D8F4844 *)&self[6].var1.var1;
  retstr->$0AC6E346AE4835514AAA8AC86D8F4844 var1 = v3;
  return self;
}

- (void)setKeyframeSequence:(id)a3
{
}

- (PIReframeKeyframeSequence)keyframeSequence
{
  return self->_keyframeSequence;
}

- (id)_stabilizeImage:(void *)a3 cleanRect:(void *)a4 cropRect:(uint64_t)a5 transform:(uint64_t)a6 geometry:(uint64_t)a7
{
  v63[4] = *MEMORY[0x1E4F143B8];
  id v13 = a4;
  id v14 = a3;
  [v13 renderScale];
  NUScaleToDouble();
  double v59 = v15;
  NUScaleRect();
  double v17 = v16;
  double v19 = v18;
  v20 = objc_msgSend(v14, "imageByCroppingToRect:");

  CGAffineTransformMakeTranslation(&v61, -v17, -v19);
  v21 = [v20 imageByApplyingTransform:&v61];

  [v21 extent];
  double MinX = CGRectGetMinX(v65);
  [v21 extent];
  double MaxY = CGRectGetMaxY(v66);
  [v21 extent];
  double MaxX = CGRectGetMaxX(v67);
  [v21 extent];
  double v25 = CGRectGetMaxY(v68);
  [v21 extent];
  double v26 = CGRectGetMinX(v69);
  [v21 extent];
  double MinY = CGRectGetMinY(v70);
  [v21 extent];
  double v28 = CGRectGetMaxX(v71);
  [v21 extent];
  CGFloat v29 = CGRectGetMinY(v72);
  float v30 = MinX / v59;
  float v31 = MaxY / v59;
  int32x4_t v32 = (int32x4_t)vaddq_f32(a11, vmlaq_n_f32(vmulq_n_f32(a9, v30), a10, v31));
  float64x2_t v33 = vmulq_n_f64(vcvtq_f64_f32(vdiv_f32(*(float32x2_t *)v32.i8, (float32x2_t)vdup_laneq_s32(v32, 2))), v59);
  *(float *)v32.i32 = MaxX / v59;
  float v34 = v25 / v59;
  int32x4_t v35 = (int32x4_t)vaddq_f32(a11, vmlaq_n_f32(vmulq_n_f32(a9, *(float *)v32.i32), a10, v34));
  float64x2_t v57 = vmulq_n_f64(vcvtq_f64_f32(vdiv_f32(*(float32x2_t *)v35.i8, (float32x2_t)vdup_laneq_s32(v35, 2))), v59);
  *(float *)v35.i32 = v26 / v59;
  float v36 = MinY / v59;
  int32x4_t v37 = (int32x4_t)vaddq_f32(a11, vmlaq_n_f32(vmulq_n_f32(a9, *(float *)v35.i32), a10, v36));
  float64x2_t v56 = vmulq_n_f64(vcvtq_f64_f32(vdiv_f32(*(float32x2_t *)v37.i8, (float32x2_t)vdup_laneq_s32(v37, 2))), v59);
  *(float *)v37.i32 = v28 / v59;
  *(float *)&CGFloat v29 = v29 / v59;
  int32x4_t v38 = (int32x4_t)vaddq_f32(a11, vmlaq_n_f32(vmulq_n_f32(a9, *(float *)v37.i32), a10, *(float *)&v29));
  float64x2_t v58 = vmulq_n_f64(vcvtq_f64_f32(vdiv_f32(*(float32x2_t *)v38.i8, (float32x2_t)vdup_laneq_s32(v38, 2))), v59);
  v62[0] = @"inputTopLeft";
  v39 = [MEMORY[0x1E4F1E080] vectorWithCGPoint:*(_OWORD *)&v33];
  v63[0] = v39;
  v62[1] = @"inputTopRight";
  v40 = [MEMORY[0x1E4F1E080] vectorWithCGPoint:*(_OWORD *)&v57];
  v63[1] = v40;
  v62[2] = @"inputBottomLeft";
  v41 = [MEMORY[0x1E4F1E080] vectorWithCGPoint:*(_OWORD *)&v56];
  v63[2] = v41;
  v62[3] = @"inputBottomRight";
  v42 = [MEMORY[0x1E4F1E080] vectorWithCGPoint:*(_OWORD *)&v58];
  v63[3] = v42;
  v43 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v63 forKeys:v62 count:4];
  v44 = [v21 imageByApplyingFilter:@"CIPerspectiveTransform" withInputParameters:v43];

  NUScaleRect();
  double v46 = v45;
  double v48 = v47;
  uint64_t v49 = [v13 scaledSize];
  uint64_t v51 = v50;

  v52 = objc_msgSend(v44, "imageByCroppingToRect:", v46, v48, (double)v49, (double)v51);
  CGAffineTransformMakeTranslation(&v60, -v46, -v48);
  v53 = [v52 imageByApplyingTransform:&v60];

  if (*(unsigned char *)(a1 + 168))
  {
    uint64_t v54 = objc_msgSend(v53, "pi_imageByApplyingStabilizationWatermark");

    v53 = (void *)v54;
  }

  return v53;
}

- (id)_evaluateImage:(id *)a3
{
  v5 = [(NURenderNode *)self inputForKey:*MEMORY[0x1E4F1E480]];
  id v48 = 0;
  id v6 = [v5 outputImage:&v48];
  id v7 = v48;
  if (!v6)
  {
    [MEMORY[0x1E4F7A438] errorWithCode:1 reason:@"Could not get the input image" object:self underlyingError:v7];
    id v13 = 0;
    *a3 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_19;
  }
  id v47 = 0;
  v8 = [(NURenderNode *)self outputImageGeometry:&v47];
  id v9 = v47;

  if (v8)
  {
    id v46 = 0;
    v10 = [(NURenderNode *)self imageProperties:&v46];
    id v7 = v46;

    if (!v10)
    {
      [MEMORY[0x1E4F7A438] errorWithCode:1 reason:@"Could not get the input image properties" object:self underlyingError:v7];
      id v13 = 0;
      *a3 = (id)objc_claimAutoreleasedReturnValue();
LABEL_17:

      goto LABEL_18;
    }
    v11 = [(NURenderNode *)self settings];
    v12 = [v11 objectForKeyedSubscript:@"pipelineState"];

    long long v44 = 0uLL;
    uint64_t v45 = 0;
    if (v12)
    {
      [v12 rawTime];
      if (BYTE12(v44))
      {
LABEL_12:
        id v14 = [(PIVideoReframeNode *)self inputVideoProperties];
        double v15 = v14;
        if (v14) {
          [v14 cleanAperture];
        }
        NUPixelRectToCGRect();
        double v17 = v16;
        double v19 = v18;
        double v21 = v20;
        double v23 = v22;

        [(PIVideoReframeNode *)self stabCropRect];
        NUPixelRectToCGRect();
        double v25 = v24;
        double v27 = v26;
        double v29 = v28;
        double v31 = v30;
        int32x4_t v32 = [(PIVideoReframeNode *)self keyframeSequence];
        long long v42 = v44;
        uint64_t v43 = v45;
        [v32 homographyAtTime:&v42];
        v33.i32[3] = 0;
        v34.i32[3] = 0;
        float32x4_t v39 = v34;
        float32x4_t v40 = v33;
        v35.i32[3] = 0;
        float32x4_t v41 = v35;

        uint32x4_t v36 = (uint32x4_t)vandq_s8(vandq_s8((int8x16_t)vceqq_f32(v40, *MEMORY[0x1E4F14998]), (int8x16_t)vceqq_f32(v39, *(float32x4_t *)(MEMORY[0x1E4F14998] + 16))), (int8x16_t)vceqq_f32(v41, *(float32x4_t *)(MEMORY[0x1E4F14998] + 32)));
        v36.i32[3] = v36.i32[2];
        if ((vminvq_u32(v36) & 0x80000000) == 0)
        {
          uint64_t v37 = -[PIVideoReframeNode _stabilizeImage:cleanRect:cropRect:transform:geometry:](self, "_stabilizeImage:cleanRect:cropRect:transform:geometry:", v6, v8, v17, v19, v21, v23, v25, v27, v29, v31, *(_OWORD *)&v40, *(_OWORD *)&v39, *(_OWORD *)&v41);

          id v6 = (id)v37;
        }
        id v6 = v6;

        id v13 = v6;
        goto LABEL_17;
      }
      [v12 time];
    }
    else
    {
      long long v42 = 0uLL;
      uint64_t v43 = 0;
    }
    long long v44 = v42;
    uint64_t v45 = v43;
    goto LABEL_12;
  }
  [MEMORY[0x1E4F7A438] errorWithCode:1 reason:@"Could not get the input geometry" object:self underlyingError:v9];
  id v13 = 0;
  *a3 = (id)objc_claimAutoreleasedReturnValue();
  id v7 = v9;
LABEL_18:

LABEL_19:
  return v13;
}

- (BOOL)canPropagateOriginalLivePhotoMetadataTrack
{
  return 0;
}

- (id)_evaluateImageGeometry:(id *)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  if (!a3)
  {
    double v16 = NUAssertLogger_24469();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      double v17 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "error != nil");
      *(_DWORD *)buf = 138543362;
      *(void *)&buf[4] = v17;
      _os_log_error_impl(&dword_1A9680000, v16, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    double v18 = (const void **)MEMORY[0x1E4F7A308];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    double v20 = NUAssertLogger_24469();
    BOOL v21 = os_log_type_enabled(v20, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v21)
      {
        double v24 = dispatch_get_specific(*v18);
        double v25 = (void *)MEMORY[0x1E4F29060];
        id v26 = v24;
        double v27 = [v25 callStackSymbols];
        double v28 = [v27 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        *(void *)&buf[4] = v24;
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v28;
        _os_log_error_impl(&dword_1A9680000, v20, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v21)
    {
      double v22 = [MEMORY[0x1E4F29060] callStackSymbols];
      double v23 = [v22 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      *(void *)&buf[4] = v23;
      _os_log_error_impl(&dword_1A9680000, v20, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler();
  }
  v5 = [(NURenderNode *)self inputs];
  id v6 = [v5 objectForKeyedSubscript:*MEMORY[0x1E4F1E480]];

  id v30 = 0;
  id v7 = [v6 outputImageGeometry:&v30];
  id v8 = v30;
  if (v7)
  {
    memset(buf, 0, 32);
    [(PIVideoReframeNode *)self stabCropRect];
    *(_OWORD *)buf = *MEMORY[0x1E4F7A318];
    id v9 = objc_alloc(MEMORY[0x1E4F7A508]);
    uint64_t v10 = [v7 renderScale];
    uint64_t v12 = v11;
    uint64_t v13 = [v7 orientation];
    v29[0] = *(_OWORD *)buf;
    v29[1] = *(_OWORD *)&buf[16];
    id v14 = objc_msgSend(v9, "initWithExtent:renderScale:orientation:", v29, v10, v12, v13);
  }
  else
  {
    [MEMORY[0x1E4F7A438] errorWithCode:1 reason:@"Failed to get input geometry" object:self underlyingError:v8];
    id v14 = 0;
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v14;
}

- (id)_evaluateVideoProperties:(id *)a3
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  if (!a3)
  {
    double v15 = NUAssertLogger_24469();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      double v16 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "error != NULL");
      *(_DWORD *)buf = 138543362;
      id v30 = v16;
      _os_log_error_impl(&dword_1A9680000, v15, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    double v17 = (const void **)MEMORY[0x1E4F7A308];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    double v19 = NUAssertLogger_24469();
    BOOL v20 = os_log_type_enabled(v19, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v20)
      {
        double v23 = dispatch_get_specific(*v17);
        double v24 = (void *)MEMORY[0x1E4F29060];
        id v25 = v23;
        id v26 = [v24 callStackSymbols];
        double v27 = [v26 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        id v30 = v23;
        __int16 v31 = 2114;
        uint64_t v32 = v27;
        _os_log_error_impl(&dword_1A9680000, v19, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v20)
    {
      BOOL v21 = [MEMORY[0x1E4F29060] callStackSymbols];
      double v22 = [v21 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      id v30 = v22;
      _os_log_error_impl(&dword_1A9680000, v19, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler();
  }
  v5 = [(NURenderNode *)self inputs];
  id v6 = [v5 objectForKeyedSubscript:*MEMORY[0x1E4F1E480]];

  id v7 = [v6 videoProperties:a3];
  if (v7)
  {
    id v8 = [(NURenderNode *)self outputImageGeometry:a3];
    id v9 = v8;
    if (v8)
    {
      uint64_t v10 = [v8 scaledSize];
      uint64_t v12 = v11;
      uint64_t v13 = (void *)[objc_alloc(MEMORY[0x1E4F7A740]) initWithProperties:v7];
      v28[0] = 0;
      v28[1] = 0;
      v28[2] = v10;
      v28[3] = v12;
      [v13 setCleanAperture:v28];
      objc_msgSend(v13, "setSize:", v10, v12);
    }
    else
    {
      uint64_t v13 = 0;
    }
  }
  else
  {
    uint64_t v13 = 0;
  }

  return v13;
}

- (BOOL)requiresVideoComposition
{
  return 1;
}

- (id)resolvedNodeWithCachedInputs:(id)a3 settings:(id)a4 pipelineState:(id)a5 error:(id *)a6
{
  v20.receiver = self;
  v20.super_class = (Class)PIVideoReframeNode;
  id v8 = -[NURenderNode resolvedNodeWithCachedInputs:settings:pipelineState:error:](&v20, sel_resolvedNodeWithCachedInputs_settings_pipelineState_error_, a3, a4, a5);
  id v9 = [(NURenderNode *)self inputs];
  uint64_t v10 = [v9 objectForKeyedSubscript:*MEMORY[0x1E4F1E480]];
  uint64_t v11 = [v10 videoProperties:a6];

  uint64_t v12 = [(NURenderNode *)self outputVideoComposition:a6];
  if (v8)
  {
    [v8 setKeyframeSequence:self->_keyframeSequence];
    $5BB7312FFE32F1AB3F1F5957C99A58B3 size = self->_stabCropRect.size;
    v19[0] = self->_stabCropRect.origin;
    v19[1] = size;
    [v8 setStabCropRect:v19];
    [v8 setShouldApplyWatermark:self->_shouldApplyWatermark];
    [v8 setInputVideoProperties:v11];
    if (v12)
    {
      [v12 frameDuration];
    }
    else
    {
      long long v17 = 0uLL;
      uint64_t v18 = 0;
    }
    long long v15 = v17;
    uint64_t v16 = v18;
    [v8 setFrameDuration:&v15];
  }

  return v8;
}

- (BOOL)shouldCacheNodeForPipelineState:(id)a3
{
  unint64_t v3 = [a3 evaluationMode];
  return (v3 < 4) & (0xBu >> (v3 & 0xF));
}

- (PIVideoReframeNode)initWithSettings:(id)a3 inputs:(id)a4
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = (uint64_t *)MEMORY[0x1E4F7A750];
  if (*MEMORY[0x1E4F7A750] != -1) {
    goto LABEL_15;
  }
  while (1)
  {
    id v9 = (os_log_t *)MEMORY[0x1E4F7A748];
    uint64_t v10 = (void *)*MEMORY[0x1E4F7A748];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F7A748], OS_LOG_TYPE_ERROR))
    {
      uint64_t v11 = NSString;
      uint64_t v12 = v10;
      uint64_t v13 = (objc_class *)objc_opt_class();
      id v14 = NSStringFromClass(v13);
      long long v15 = NSStringFromSelector(a2);
      uint64_t v16 = [v11 stringWithFormat:@"Initializer not available: -[%@ %@], use designated initializer instead.", v14, v15];
      *(_DWORD *)buf = 138543362;
      __int16 v31 = v16;
      _os_log_error_impl(&dword_1A9680000, v12, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

      uint64_t v17 = *v8;
      if (!dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]))
      {
        if (v17 != -1) {
          dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_128_24487);
        }
LABEL_7:
        os_log_t v18 = *v9;
        if (os_log_type_enabled(*v9, OS_LOG_TYPE_ERROR))
        {
          double v19 = (void *)MEMORY[0x1E4F29060];
          objc_super v20 = v18;
          BOOL v21 = [v19 callStackSymbols];
          double v22 = [v21 componentsJoinedByString:@"\n"];
          *(_DWORD *)buf = 138543362;
          __int16 v31 = v22;
          _os_log_error_impl(&dword_1A9680000, v20, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

LABEL_13:
          goto LABEL_14;
        }
        goto LABEL_14;
      }
      if (v17 != -1) {
        dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_128_24487);
      }
    }
    else if (!dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]))
    {
      goto LABEL_7;
    }
    os_log_t v23 = *v9;
    if (os_log_type_enabled(*v9, OS_LOG_TYPE_ERROR))
    {
      specific = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
      id v25 = (void *)MEMORY[0x1E4F29060];
      id v26 = specific;
      objc_super v20 = v23;
      double v27 = [v25 callStackSymbols];
      double v28 = [v27 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543618;
      __int16 v31 = specific;
      __int16 v32 = 2114;
      uint64_t v33 = v28;
      _os_log_error_impl(&dword_1A9680000, v20, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      goto LABEL_13;
    }
LABEL_14:
    double v29 = (objc_class *)objc_opt_class();
    NSStringFromClass(v29);
    objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    objc_claimAutoreleasedReturnValue();
    _NUAssertFailHandler();
LABEL_15:
    dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_128_24487);
  }
}

- (PIVideoReframeNode)initWithKeyframes:(id)a3 stabCropRect:(id *)a4 input:(id)a5
{
  v33[1] = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a5;
  $0AC6E346AE4835514AAA8AC86D8F4844 var1 = a4->var1;
  $0AC6E346AE4835514AAA8AC86D8F4844 var0 = a4->var0;
  $0AC6E346AE4835514AAA8AC86D8F4844 v29 = var1;
  if (NUPixelRectIsEmpty())
  {
    id v25 = [MEMORY[0x1E4F28B00] currentHandler];
    [v25 handleFailureInMethod:a2 object:self file:@"PIVideoReframeNode.m" lineNumber:62 description:@"invalid crop rect"];
  }
  __int16 v32 = @"pipelineState";
  uint64_t v12 = objc_alloc_init(PITimeVaryingPipelineStateSetting);
  v33[0] = v12;
  uint64_t v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v33 forKeys:&v32 count:1];

  uint64_t v30 = *MEMORY[0x1E4F1E480];
  id v31 = v10;
  id v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v31 forKeys:&v30 count:1];
  v27.receiver = self;
  v27.super_class = (Class)PIVideoReframeNode;
  long long v15 = [(NURenderNode *)&v27 initWithSettings:v13 inputs:v14];
  if (v15)
  {
    uint64_t v16 = [[PIReframeKeyframeSequence alloc] initWithKeyframeArray:v9];
    [(PIVideoReframeNode *)v15 setKeyframeSequence:v16];

    $0AC6E346AE4835514AAA8AC86D8F4844 v17 = a4->var1;
    v26[0] = a4->var0;
    v26[1] = v17;
    [(PIVideoReframeNode *)v15 setStabCropRect:v26];
    if (NUIsAppleInternal())
    {
      os_log_t v18 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
      double v19 = [v18 dictionaryForKey:@"PURootSettings"];

      objc_super v20 = [v19 objectForKey:@"PXSettingsArchiveKey"];

      BOOL v21 = [v20 objectForKey:@"photoEditingSettings"];

      double v22 = [v21 objectForKey:@"showStabilizationWatermark"];

      if (v22)
      {
        os_log_t v23 = [v21 objectForKey:@"showStabilizationWatermark"];
        LOBYTE(v22) = [v23 BOOLValue];
      }
      v15->_shouldApplyWatermark = (char)v22;
    }
  }

  return v15;
}

@end