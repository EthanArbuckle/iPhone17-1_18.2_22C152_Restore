@interface PISliderNetAdjustmentsJob
- (BOOL)networkProcessingWithResultingPixelBuffer:(__CVBuffer *)a3 error:(id *)a4;
- (BOOL)prepare:(id *)a3;
- (BOOL)wantsCompleteStage;
- (BOOL)wantsOutputGeometry;
- (BOOL)wantsOutputImage;
- (id)cacheKey;
- (id)result;
- (id)scalePolicy;
- (void)cleanUp;
@end

@implementation PISliderNetAdjustmentsJob

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sourceContentFeatureVector, 0);
  objc_storeStrong((id *)&self->_sourceStyleFeatureVector, 0);
  objc_storeStrong((id *)&self->_adjustments, 0);
}

- (void)cleanUp
{
  v4.receiver = self;
  v4.super_class = (Class)PISliderNetAdjustmentsJob;
  [(NURenderJob *)&v4 cleanUp];
  adjustments = self->_adjustments;
  self->_adjustments = 0;
}

- (id)result
{
  v3 = objc_alloc_init(_PISliderNetAdjustmentsResult);
  [(_PISliderNetAdjustmentsResult *)v3 setAdjustments:self->_adjustments];
  *(float *)&double v4 = self->_similarityScore;
  [(_PISliderNetAdjustmentsResult *)v3 setSimilarityScore:v4];
  return v3;
}

- (BOOL)networkProcessingWithResultingPixelBuffer:(__CVBuffer *)a3 error:(id *)a4
{
  v7 = [(NURenderJob *)self request];
  v8 = [v7 sliderNetModel];
  v9 = [v7 assetScenePrint];
  id v36 = 0;
  v10 = [v8 predictStylePrintForPixelBuffer:a3 scenePrint:v9 error:&v36];
  id v11 = v36;

  if (v10)
  {
    v12 = [v7 sliderNetModel];
    sourceStyleFeatureVector = self->_sourceStyleFeatureVector;
    id v35 = 0;
    [v12 gatingScoreToTransferStyleFrom:sourceStyleFeatureVector to:v10 error:&v35];
    float v15 = v14;
    id v16 = v35;
    self->_double similarityScore = v15;

    if (v16)
    {
      v17 = (void *)MEMORY[0x1E4F7A438];
      id adjustments = [(NURenderJob *)self request];
      [v17 errorWithCode:1 reason:@"Unable to get a gating score from from network" object:adjustments underlyingError:v16];
      BOOL v19 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
LABEL_13:

      goto LABEL_14;
    }
    [v7 similarityGatingThreshold];
    if (v21 == -1.0)
    {
      v24 = [v7 sliderNetModel];
      v25 = self->_sourceStyleFeatureVector;
      v33 = 0;
      v26 = [v24 predictSlidersToTransferStyleFrom:v25 to:v10 error:&v33];
      v27 = v33;
    }
    else
    {
      double similarityScore = self->_similarityScore;
      [v7 similarityGatingThreshold];
      if (v23 > similarityScore)
      {
        id adjustments = self->_adjustments;
        self->_id adjustments = (NSDictionary *)MEMORY[0x1E4F1CC08];
LABEL_11:
        BOOL v19 = 1;
        goto LABEL_13;
      }
      v24 = [v7 sliderNetModel];
      v28 = self->_sourceStyleFeatureVector;
      v34 = 0;
      v26 = [v24 predictSlidersToTransferStyleFrom:v28 to:v10 error:&v34];
      v27 = v34;
    }
    id adjustments = v27;
    v29 = self->_adjustments;
    self->_id adjustments = v26;

    if (!self->_adjustments)
    {
      v30 = (void *)MEMORY[0x1E4F7A438];
      v31 = [(NURenderJob *)self request];
      *a4 = [v30 errorWithCode:1 reason:@"Unable to get sliders data from network" object:v31 underlyingError:adjustments];

      BOOL v19 = 0;
      goto LABEL_13;
    }
    goto LABEL_11;
  }
  v20 = (void *)MEMORY[0x1E4F7A438];
  id v16 = [(NURenderJob *)self request];
  [v20 errorWithCode:1 reason:@"Unable to get a content feature Vector from network" object:v16 underlyingError:v11];
  BOOL v19 = 0;
  *a4 = (id)objc_claimAutoreleasedReturnValue();
LABEL_14:

  return v19;
}

- (BOOL)prepare:(id *)a3
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  v33.receiver = self;
  v33.super_class = (Class)PISliderNetAdjustmentsJob;
  if (!-[NURenderJob prepare:](&v33, sel_prepare_)) {
    return 0;
  }
  v5 = [(NURenderJob *)self prepareNode];
  BOOL v6 = v5 == 0;

  if (v6)
  {
    BOOL v19 = NUAssertLogger_19209();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      v20 = [NSString stringWithFormat:@"Missing prepare node"];
      *(_DWORD *)buf = 138543362;
      *(void *)&buf[4] = v20;
      _os_log_error_impl(&dword_1A9680000, v19, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    double v21 = (const void **)MEMORY[0x1E4F7A308];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    double v23 = NUAssertLogger_19209();
    BOOL v24 = os_log_type_enabled(v23, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v24)
      {
        v27 = dispatch_get_specific(*v21);
        v28 = (void *)MEMORY[0x1E4F29060];
        id v29 = v27;
        v30 = [v28 callStackSymbols];
        v31 = [v30 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        *(void *)&buf[4] = v27;
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v31;
        _os_log_error_impl(&dword_1A9680000, v23, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v24)
    {
      v25 = [MEMORY[0x1E4F29060] callStackSymbols];
      v26 = [v25 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      *(void *)&buf[4] = v26;
      _os_log_error_impl(&dword_1A9680000, v23, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler();
    __break(1u);
  }
  v7 = [(NURenderJob *)self request];
  v8 = (void *)MEMORY[0x1E4F28DC0];
  uint64_t v34 = 0;
  id v35 = &v34;
  uint64_t v36 = 0x2050000000;
  v9 = (void *)getIHKFeatureVectorClass_softClass;
  uint64_t v37 = getIHKFeatureVectorClass_softClass;
  if (!getIHKFeatureVectorClass_softClass)
  {
    *(void *)buf = MEMORY[0x1E4F143A8];
    *(void *)&buf[8] = 3221225472;
    *(void *)&buf[16] = __getIHKFeatureVectorClass_block_invoke;
    v39 = &unk_1E5D81578;
    v40 = &v34;
    __getIHKFeatureVectorClass_block_invoke((uint64_t)buf);
    v9 = (void *)v35[3];
  }
  id v10 = v9;
  _Block_object_dispose(&v34, 8);
  id v11 = [v7 styleFeatureVectorData];
  id v32 = 0;
  uint64_t v12 = [v8 unarchivedObjectOfClass:v10 fromData:v11 error:&v32];
  id v13 = v32;
  p_sourceStyleFeatureVector = &self->_sourceStyleFeatureVector;
  float v15 = *p_sourceStyleFeatureVector;
  *p_sourceStyleFeatureVector = (IHKFeatureVector *)v12;

  id v16 = *p_sourceStyleFeatureVector;
  BOOL v17 = *p_sourceStyleFeatureVector != 0;
  if (!v16)
  {
    *a3 = [MEMORY[0x1E4F7A438] errorWithCode:1 reason:@"Unable to unarchive style feature vector data" object:v7 underlyingError:v13];
  }

  return v17;
}

- (id)cacheKey
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F7A428]);
  double v4 = [(NURenderJob *)self renderNode];
  objc_msgSend(v4, "nu_updateDigest:", v3);

  [v3 finalize];
  v5 = [v3 stringValue];

  return v5;
}

- (BOOL)wantsCompleteStage
{
  return 1;
}

- (BOOL)wantsOutputImage
{
  return 1;
}

- (BOOL)wantsOutputGeometry
{
  return 1;
}

- (id)scalePolicy
{
  v2 = [(NURenderJob *)self request];
  id v3 = [v2 scalePolicy];

  return v3;
}

@end