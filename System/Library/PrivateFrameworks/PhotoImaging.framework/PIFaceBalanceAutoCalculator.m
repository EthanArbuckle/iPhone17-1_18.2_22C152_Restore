@interface PIFaceBalanceAutoCalculator
+ ($1AB5FA073B851C12C2339EC22442E995)faceBalanceFromFaceImage:(id)a3 forFaceRect:(id *)a4;
+ ($FD18CD26FAB5729647810B74E671536E)faceRectFromNormalizedFaceRet:(SEL)a3 forImageExtent:(CGRect)a4 scaleX:(id *)a5 scaleY:(double)a6;
+ (id)faceBalanceResultFromFaceObservations:(id)a3 request:(id)a4 error:(id *)a5;
+ (void)calculateRAWWithRequest:(id)a3 completion:(id)a4;
+ (void)calculateWithRequest:(id)a3 completion:(id)a4;
- (PIFaceBalanceAutoCalculator)initWithRequest:(id)a3 isRAW:(BOOL)a4;
- (int64_t)rawState;
- (void)submit:(id)a3;
@end

@implementation PIFaceBalanceAutoCalculator

- (int64_t)rawState
{
  return self->_rawState;
}

- (void)submit:(id)a3
{
  id v4 = a3;
  int64_t rawState = self->_rawState;
  if (rawState)
  {
    if (rawState == 2)
    {
      +[PIFaceBalanceAutoCalculator calculateRAWWithRequest:self completion:v4];
    }
    else if (rawState == 1)
    {
      +[PIFaceBalanceAutoCalculator calculateWithRequest:self completion:v4];
    }
  }
  else
  {
    v6 = (void *)[objc_alloc(MEMORY[0x1E4F7A520]) initWithRequest:self];
    [v6 setName:@"PIFaceBalanceAutoCalculator-imageProperties"];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __38__PIFaceBalanceAutoCalculator_submit___block_invoke;
    v7[3] = &unk_1E5D81798;
    v7[4] = self;
    id v8 = v4;
    [v6 submit:v7];
  }
}

void __38__PIFaceBalanceAutoCalculator_submit___block_invoke(uint64_t a1, void *a2)
{
  id v11 = 0;
  v3 = [a2 result:&v11];
  id v4 = v11;
  if (v3)
  {
    v5 = [v3 properties];
    v6 = [v5 rawProperties];

    uint64_t v7 = *(void *)(a1 + 32);
    uint64_t v8 = *(void *)(a1 + 40);
    if (v6) {
      +[PIFaceBalanceAutoCalculator calculateRAWWithRequest:v7 completion:v8];
    }
    else {
      +[PIFaceBalanceAutoCalculator calculateWithRequest:v7 completion:v8];
    }
  }
  else
  {
    uint64_t v9 = *(void *)(a1 + 40);
    v10 = (void *)[objc_alloc(MEMORY[0x1E4F7A660]) initWithError:v4];
    (*(void (**)(uint64_t, void *))(v9 + 16))(v9, v10);
  }
}

- (PIFaceBalanceAutoCalculator)initWithRequest:(id)a3 isRAW:(BOOL)a4
{
  BOOL v4 = a4;
  v7.receiver = self;
  v7.super_class = (Class)PIFaceBalanceAutoCalculator;
  result = [(NURenderRequest *)&v7 initWithRequest:a3];
  int64_t v6 = 1;
  if (v4) {
    int64_t v6 = 2;
  }
  result->_int64_t rawState = v6;
  return result;
}

+ ($1AB5FA073B851C12C2339EC22442E995)faceBalanceFromFaceImage:(id)a3 forFaceRect:(id *)a4
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v44 = 0;
  v45 = (double *)&v44;
  uint64_t v46 = 0x3810000000;
  v47 = &unk_1A984BDE3;
  uint64_t v48 = 0;
  uint64_t v49 = 0;
  uint64_t v50 = 0;
  int64_t v6 = [v5 format];
  objc_super v7 = [MEMORY[0x1E4F7A5D8] ARGB8];
  char v8 = [v6 isEqualToPixelFormat:v7];

  if (v8)
  {
    uint64_t v9 = 0x200000001;
    int v10 = 3;
  }
  else
  {
    id v11 = [v5 format];
    v12 = [MEMORY[0x1E4F7A5D8] RGBA8];
    char v13 = [v11 isEqualToPixelFormat:v12];

    if (v13)
    {
      uint64_t v9 = 0x100000000;
      int v10 = 2;
    }
    else
    {
      v14 = [v5 format];
      v15 = [MEMORY[0x1E4F7A5D8] BGRA8];
      char v16 = [v14 isEqualToPixelFormat:v15];

      if ((v16 & 1) == 0)
      {
        v28 = NUAssertLogger_6606();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
        {
          v29 = [NSString stringWithFormat:@"unsupported format - incorrect white balance"];
          *(_DWORD *)buf = 138543362;
          *(void *)&buf[4] = v29;
          _os_log_error_impl(&dword_1A9680000, v28, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
        }
        v30 = (const void **)MEMORY[0x1E4F7A308];
        specific = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
        v32 = NUAssertLogger_6606();
        BOOL v33 = os_log_type_enabled(v32, OS_LOG_TYPE_ERROR);
        if (specific)
        {
          if (v33)
          {
            v36 = dispatch_get_specific(*v30);
            v37 = [MEMORY[0x1E4F29060] callStackSymbols];
            v38 = [v37 componentsJoinedByString:@"\n"];
            *(_DWORD *)buf = 138543618;
            *(void *)&buf[4] = v36;
            *(_WORD *)&buf[12] = 2114;
            *(void *)&buf[14] = v38;
            _os_log_error_impl(&dword_1A9680000, v32, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
          }
        }
        else if (v33)
        {
          v34 = [MEMORY[0x1E4F29060] callStackSymbols];
          v35 = [v34 componentsJoinedByString:@"\n"];
          *(_DWORD *)buf = 138543362;
          *(void *)&buf[4] = v35;
          _os_log_error_impl(&dword_1A9680000, v32, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
        }
        _NUAssertFailHandler();
        __break(1u);
      }
      int v10 = 0;
      uint64_t v9 = 0x100000002;
    }
  }
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x2020000000;
  int v52 = 0;
  v17 = [v5 validRegion];
  v39[0] = MEMORY[0x1E4F143A8];
  v39[1] = 3221225472;
  v39[2] = __68__PIFaceBalanceAutoCalculator_faceBalanceFromFaceImage_forFaceRect___block_invoke;
  v39[3] = &unk_1E5D7F408;
  $0AC6E346AE4835514AAA8AC86D8F4844 var1 = a4->var1;
  $0AC6E346AE4835514AAA8AC86D8F4844 var0 = a4->var0;
  $0AC6E346AE4835514AAA8AC86D8F4844 v41 = var1;
  uint64_t v42 = v9;
  int v43 = v10;
  v39[4] = &v44;
  v39[5] = buf;
  [v5 readBufferRegion:v17 withBlock:v39];

  int v19 = *(_DWORD *)(*(void *)&buf[8] + 24);
  v20 = v45;
  double v21 = v45[4];
  if (v19 <= 0)
  {
    double v23 = v45[5];
    double v24 = v45[6];
  }
  else
  {
    double v21 = v21 / (double)v19;
    double v22 = v45[6];
    double v23 = v45[5] / (double)v19;
    v45[4] = v21;
    v20[5] = v23;
    double v24 = v22 / (double)v19;
    v20[6] = v24;
  }
  _Block_object_dispose(buf, 8);
  _Block_object_dispose(&v44, 8);

  double v25 = v21;
  double v26 = v23;
  double v27 = v24;
  result.var2 = v27;
  result.$0AC6E346AE4835514AAA8AC86D8F4844 var1 = v26;
  result.$0AC6E346AE4835514AAA8AC86D8F4844 var0 = v25;
  return result;
}

void __68__PIFaceBalanceAutoCalculator_faceBalanceFromFaceImage_forFaceRect___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = [v2 buffer];
  if (v2) {
    [v2 frameRect];
  }
  [v3 size];
  NUPixelRectIntersection();
}

+ ($FD18CD26FAB5729647810B74E671536E)faceRectFromNormalizedFaceRet:(SEL)a3 forImageExtent:(CGRect)a4 scaleX:(id *)a5 scaleY:(double)a6
{
  CGFloat height = a4.size.height;
  CGFloat width = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  CGAffineTransformMakeScale(&v14, a6, a7);
  v15.origin.CGFloat x = x;
  v15.origin.CGFloat y = y;
  v15.size.CGFloat width = width;
  v15.size.CGFloat height = height;
  CGRectApplyAffineTransform(v15, &v14);
  retstr->$0AC6E346AE4835514AAA8AC86D8F4844 var0 = 0u;
  retstr->$0AC6E346AE4835514AAA8AC86D8F4844 var1 = 0u;
  NUPixelRectFromCGRect();
  NUPixelRectMaxCenteredInRect();
  *retstr = v13;
  NUPixelRectInset();
  *retstr = v13;
  $1AB5FA073B851C12C2339EC22442E995 result = ($FD18CD26FAB5729647810B74E671536E *)NUPixelRectFlipYOrigin();
  *retstr = v13;
  return result;
}

+ (id)faceBalanceResultFromFaceObservations:(id)a3 request:(id)a4 error:(id *)a5
{
  uint64_t v9 = v91;
  uint64_t v98 = *MEMORY[0x1E4F143B8];
  int v10 = a3;
  id v72 = a4;
  if (!a5)
  {
    v59 = NUAssertLogger_6606();
    if (os_log_type_enabled(v59, OS_LOG_TYPE_ERROR))
    {
      v60 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "error != nil");
      *(_DWORD *)v91 = 138543362;
      *(void *)&v91[4] = v60;
      _os_log_error_impl(&dword_1A9680000, v59, OS_LOG_TYPE_ERROR, "Fail: %{public}@", v91, 0xCu);
    }
    v61 = (const void **)MEMORY[0x1E4F7A308];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    int v10 = NUAssertLogger_6606();
    BOOL v63 = os_log_type_enabled(v10, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v63)
      {
        id v5 = dispatch_get_specific(*v61);
        v66 = (void *)MEMORY[0x1E4F29060];
        id v67 = v5;
        v68 = [v66 callStackSymbols];
        uint64_t v9 = [v68 componentsJoinedByString:@"\n"];
        *(_DWORD *)v91 = 138543618;
        *(void *)&v91[4] = v5;
        *(_WORD *)&v91[12] = 2114;
        *(void *)&v91[14] = v9;
        _os_log_error_impl(&dword_1A9680000, v10, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", v91, 0x16u);
      }
    }
    else if (v63)
    {
      v64 = [MEMORY[0x1E4F29060] callStackSymbols];
      v65 = [v64 componentsJoinedByString:@"\n"];
      *(_DWORD *)v91 = 138543362;
      *(void *)&v91[4] = v65;
      _os_log_error_impl(&dword_1A9680000, v10, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", v91, 0xCu);
    }
    v69 = "error != nil";
    _NUAssertFailHandler();
    __break(1u);
    goto LABEL_39;
  }
  group = dispatch_group_create();
  uint64_t v9 = [v10 faces];
  if (![v9 count])
  {
    double v25 = (void *)MEMORY[0x1E4F1CC08];
    goto LABEL_28;
  }
  uint64_t v11 = [v10 imageSize];
  uint64_t v13 = v12;
  id v5 = objc_alloc_init(MEMORY[0x1E4F7A5A0]);
  long long v84 = 0u;
  long long v85 = 0u;
  long long v86 = 0u;
  long long v87 = 0u;
  id v14 = v9;
  uint64_t v15 = [v14 countByEnumeratingWithState:&v84 objects:v97 count:16];
  if (v15)
  {
    uint64_t v16 = *(void *)v85;
    do
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v85 != v16) {
          objc_enumerationMutation(v14);
        }
        [*(id *)(*((void *)&v84 + 1) + 8 * i) boundingBox];
        v101.origin.CGFloat x = 0.0;
        v101.origin.CGFloat y = 0.0;
        v101.size.CGFloat width = 1.0;
        v101.size.CGFloat height = 1.0;
        CGRectIntersection(v100, v101);
        memset(v91, 0, sizeof(v91));
        long long v78 = 0uLL;
        *(void *)&long long v79 = v11;
        *((void *)&v79 + 1) = v13;
        NUPixelRectDenormalize();
        long long v78 = *(_OWORD *)v91;
        long long v79 = *(_OWORD *)&v91[16];
        [v5 addRect:&v78];
      }
      uint64_t v15 = [v14 countByEnumeratingWithState:&v84 objects:v97 count:16];
    }
    while (v15);
  }

  long long v82 = 0u;
  long long v83 = 0u;
  if (v5) {
    [v5 bounds];
  }
  long long v78 = v82;
  long long v79 = v83;
  *(void *)buf = 0;
  *(void *)&buf[8] = 0;
  *(void *)&buf[16] = v11;
  uint64_t v96 = v13;
  NUPixelRectFlipYOrigin();
  long long v82 = *(_OWORD *)v91;
  long long v83 = *(_OWORD *)&v91[16];
  *(void *)v91 = 0;
  *(void *)&v91[8] = v91;
  *(void *)&v91[16] = 0x3810000000;
  *(void *)&v91[24] = &unk_1A984BDE3;
  uint64_t v92 = 0;
  uint64_t v93 = 0;
  uint64_t v94 = 0;
  int64_t v6 = (void *)[objc_alloc(MEMORY[0x1E4F7A3B8]) initWithRequest:v72];
  [v6 setName:@"PIWhiteBalanceAutoCalculator-face-balance"];
  v18 = +[PIPipelineFilters rawFaceBalanceFilter];
  v90 = v18;
  int v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v90 count:1];
  [v6 setPipelineFilters:v19];

  v20 = (void *)[objc_alloc(MEMORY[0x1E4F7A5D0]) initWithTargetPixelCount:0x400000];
  [v6 setScalePolicy:v20];

  [v6 setSampleMode:1];
  id v21 = objc_alloc(MEMORY[0x1E4F7A470]);
  long long v78 = v82;
  long long v79 = v83;
  double v22 = (void *)[v21 initWithRect:&v78];
  [v6 setRegionPolicy:v22];

  dispatch_queue_t v23 = dispatch_queue_create("PIRAWFaceBalanceAutoCalculator.responseQueue", 0);
  [v6 setResponseQueue:v23];

  dispatch_group_enter(group);
  *(void *)&long long v78 = 0;
  *((void *)&v78 + 1) = &v78;
  *(void *)&long long v79 = 0x3032000000;
  *((void *)&v79 + 1) = __Block_byref_object_copy__6630;
  v80 = __Block_byref_object_dispose__6631;
  id v81 = 0;
  v73[0] = MEMORY[0x1E4F143A8];
  v73[1] = 3221225472;
  v73[2] = __83__PIFaceBalanceAutoCalculator_faceBalanceResultFromFaceObservations_request_error___block_invoke;
  v73[3] = &unk_1E5D7F3E0;
  v76 = &v78;
  id v74 = v14;
  v77 = v91;
  double v24 = group;
  v75 = v24;
  [v6 submit:v73];
  dispatch_group_wait(v24, 0xFFFFFFFFFFFFFFFFLL);
  if (!*(void *)(*((void *)&v78 + 1) + 40))
  {
    double v26 = *(double *)(*(void *)&v91[8] + 32);
    double v27 = *(double *)(*(void *)&v91[8] + 40);
    double v28 = *(double *)(*(void *)&v91[8] + 48);
    double v29 = v26 + v27 * 0.956295729 + v28 * 0.62102443;
    double v30 = v26 + v27 * -0.272122115 + v28 * -0.64738059;
    *(float64x2_t *)(*(void *)&v91[8] + 40) = vmlaq_n_f64(vmlaq_n_f64(vmulq_n_f64((float64x2_t)xmmword_1A980B940, v30 * 0.843295753+ v29 * 0.0951450467+ (v26 + v27 * -1.10698903 + v28 * 1.704615) * 0.0615592338), (float64x2_t)xmmword_1A980B950, v30 * 0.404303581+ v29 * 0.592828095+ (v26 + v27 * -1.10698903 + v28 * 1.704615) * 0.00286814501), (float64x2_t)xmmword_1A980B960, v30 * 0.0696689114+ v29 * 0.0117029343+ (v26 + v27 * -1.10698903 + v28 * 1.704615) * 0.918628156);
    if (*MEMORY[0x1E4F7A750] == -1)
    {
LABEL_16:
      v31 = *MEMORY[0x1E4F7A758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F7A758], OS_LOG_TYPE_INFO))
      {
        uint64_t v32 = *(void *)(*(void *)&v91[8] + 32);
        uint64_t v33 = *(void *)(*(void *)&v91[8] + 40);
        uint64_t v34 = *(void *)(*(void *)&v91[8] + 48);
        *(_DWORD *)buf = 134218496;
        *(void *)&buf[4] = v32;
        *(_WORD *)&buf[12] = 2048;
        *(void *)&buf[14] = v33;
        *(_WORD *)&buf[22] = 2048;
        uint64_t v96 = v34;
        _os_log_impl(&dword_1A9680000, v31, OS_LOG_TYPE_INFO, "facerect yiq = %.5f, %.5f, %.5f\n", buf, 0x20u);
      }
      double v36 = *(double *)(*(void *)&v91[8] + 40);
      double v35 = *(double *)(*(void *)&v91[8] + 48);
      v70 = +[PICompositionController settingForAdjustmentKey:@"whiteBalance", @"warmTemp", v69 settingKey];
      v37 = +[PICompositionController settingForAdjustmentKey:@"whiteBalance" settingKey:@"warmTint"];
      v38 = [v70 minimumValue];
      [v38 doubleValue];
      double v40 = v39;

      $0AC6E346AE4835514AAA8AC86D8F4844 v41 = [v70 maximumValue];
      [v41 doubleValue];
      double v43 = v42;

      double v44 = 0.055 - v36;
      double v45 = 0.0 - v35;
      double v46 = (v44 + (0.0 - v35) * -0.2) * 4.0;
      if (v46 >= v43) {
        double v46 = v43;
      }
      if (v40 < v46) {
        double v40 = v46;
      }
      v47 = [v37 minimumValue];
      [v47 doubleValue];
      double v49 = v48;

      uint64_t v50 = [v37 maximumValue];
      [v50 doubleValue];
      double v52 = v51;

      double v53 = (v44 + v45 * 5.0) * 4.0;
      if (v53 >= v52) {
        double v53 = v52;
      }
      if (v49 < v53) {
        double v49 = v53;
      }
      v88[0] = @"OrigI";
      v54 = [NSNumber numberWithDouble:*(double *)(*(void *)&v91[8] + 40)];
      v89[0] = v54;
      v88[1] = @"OrigQ";
      v55 = [NSNumber numberWithDouble:*(double *)(*(void *)&v91[8] + 48)];
      v89[1] = v55;
      v89[2] = &unk_1F000A378;
      v88[2] = @"Warmth";
      v88[3] = @"Strength";
      v89[3] = &unk_1F000A388;
      v88[4] = @"WarmTemp";
      v56 = [NSNumber numberWithDouble:v40];
      v89[4] = v56;
      v88[5] = @"WarmTint";
      v57 = [NSNumber numberWithDouble:v49];
      v88[6] = @"WarmFace";
      v89[5] = v57;
      v89[6] = MEMORY[0x1E4F1CC38];
      double v25 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v89 forKeys:v88 count:7];

      goto LABEL_27;
    }
LABEL_39:
    dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_303);
    goto LABEL_16;
  }
  objc_msgSend(MEMORY[0x1E4F7A438], "errorWithCode:reason:object:underlyingError:", 1, @"Failure in rendering image", v5);
  double v25 = 0;
  *a5 = (id)objc_claimAutoreleasedReturnValue();
LABEL_27:

  _Block_object_dispose(&v78, 8);
  _Block_object_dispose(v91, 8);

LABEL_28:
  return v25;
}

void __83__PIFaceBalanceAutoCalculator_faceBalanceResultFromFaceObservations_request_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  id obj = *(id *)(v3 + 40);
  BOOL v4 = [a2 result:&obj];
  objc_storeStrong((id *)(v3 + 40), obj);
  if (v4)
  {
    id v5 = [v4 image];
    [v5 size];
    [v5 size];
    uint64_t v6 = [v5 size];
    [v5 size];
    uint64_t v8 = v7;
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    id v9 = *(id *)(a1 + 32);
    uint64_t v10 = [v9 countByEnumeratingWithState:&v30 objects:v36 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v31;
      double v13 = 0.0;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v31 != v12) {
            objc_enumerationMutation(v9);
          }
          [*(id *)(*((void *)&v30 + 1) + 8 * i) boundingBox];
          memset(buf, 0, sizeof(buf));
          long long v28 = 0uLL;
          *(void *)&long long v29 = v6;
          *((void *)&v29 + 1) = v8;
          +[PIFaceBalanceAutoCalculator faceRectFromNormalizedFaceRet:forImageExtent:scaleX:scaleY:](PIFaceBalanceAutoCalculator, "faceRectFromNormalizedFaceRet:forImageExtent:scaleX:scaleY:", &v28);
          long long v28 = *(_OWORD *)buf;
          long long v29 = *(_OWORD *)&buf[16];
          +[PIFaceBalanceAutoCalculator faceBalanceFromFaceImage:v5 forFaceRect:&v28];
          double v18 = v17;
          double v19 = v15;
          double v20 = v16;
          double v21 = fmax(((v16 + -0.00999999978) * -0.0199999996 + (v15 + -0.0399999991) * 0.0649999976) / 0.00462499967, 0.0);
          if (v21 > 1.0) {
            double v21 = 1.0;
          }
          double v22 = fmin(1.0/ fmax(pow(sqrt((v15 - ((v21 * 0.5 + 0.25) * 0.0649999976 + 0.0399999991))* (v15 - ((v21 * 0.5 + 0.25) * 0.0649999976 + 0.0399999991))+ (v16 - ((v21 * 0.5 + 0.25) * -0.0199999996 + 0.00999999978))* (v16 - ((v21 * 0.5 + 0.25) * -0.0199999996 + 0.00999999978)))/ 0.0680073501, 3.0), 0.0001), 1.0)* (double)(uint64_t)(*(void *)&buf[24] * *(void *)&buf[16]);
          *(double *)(*(void *)(*(void *)(a1 + 56) + 8) + 32) = *(double *)(*(void *)(*(void *)(a1 + 56)
                                                                                              + 8)
                                                                                  + 32)
                                                                      + v22 * v18;
          *(double *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) = *(double *)(*(void *)(*(void *)(a1 + 56)
                                                                                              + 8)
                                                                                  + 40)
                                                                      + v22 * v19;
          *(double *)(*(void *)(*(void *)(a1 + 56) + 8) + 48) = *(double *)(*(void *)(*(void *)(a1 + 56)
                                                                                              + 8)
                                                                                  + 48)
                                                                      + v22 * v20;
          double v13 = v13 + v22;
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v30 objects:v36 count:16];
      }
      while (v11);

      if (v13 > 0.0)
      {
        *(double *)(*(void *)(*(void *)(a1 + 56) + 8) + 32) = *(double *)(*(void *)(*(void *)(a1 + 56) + 8)
                                                                                + 32)
                                                                    / v13;
        *(double *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) = *(double *)(*(void *)(*(void *)(a1 + 56) + 8)
                                                                                + 40)
                                                                    / v13;
        *(double *)(*(void *)(*(void *)(a1 + 56) + 8) + 48) = *(double *)(*(void *)(*(void *)(a1 + 56) + 8)
                                                                                + 48)
                                                                    / v13;
        if (*MEMORY[0x1E4F7A750] != -1) {
          dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_303);
        }
        dispatch_queue_t v23 = *MEMORY[0x1E4F7A758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F7A758], OS_LOG_TYPE_INFO))
        {
          double v24 = *(void **)(*(void *)(a1 + 56) + 8);
          uint64_t v25 = v24[4];
          uint64_t v26 = v24[5];
          uint64_t v27 = v24[6];
          *(_DWORD *)buf = 134218496;
          *(void *)&buf[4] = v25;
          *(_WORD *)&buf[12] = 2048;
          *(void *)&buf[14] = v26;
          *(_WORD *)&buf[22] = 2048;
          *(void *)&unsigned char buf[24] = v27;
          _os_log_impl(&dword_1A9680000, v23, OS_LOG_TYPE_INFO, "facerect yiq = %.5f, %.5f, %.5f\n", buf, 0x20u);
        }
      }
    }
    else
    {
    }
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

+ (void)calculateRAWWithRequest:(id)a3 completion:(id)a4
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  if (!v6)
  {
    id v14 = NUAssertLogger_6606();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      double v15 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "completion != nil");
      *(_DWORD *)buf = 138543362;
      long long v32 = v15;
      _os_log_error_impl(&dword_1A9680000, v14, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    double v16 = (const void **)MEMORY[0x1E4F7A308];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    double v18 = NUAssertLogger_6606();
    BOOL v19 = os_log_type_enabled(v18, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v19)
      {
        double v22 = dispatch_get_specific(*v16);
        dispatch_queue_t v23 = (void *)MEMORY[0x1E4F29060];
        id v24 = v22;
        uint64_t v25 = [v23 callStackSymbols];
        uint64_t v26 = [v25 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        long long v32 = v22;
        __int16 v33 = 2114;
        uint64_t v34 = v26;
        _os_log_error_impl(&dword_1A9680000, v18, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v19)
    {
      double v20 = [MEMORY[0x1E4F29060] callStackSymbols];
      double v21 = [v20 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      long long v32 = v21;
      _os_log_error_impl(&dword_1A9680000, v18, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler();
  }
  uint64_t v7 = v6;
  uint64_t v8 = (void *)[objc_alloc(MEMORY[0x1E4F7A440]) initWithRequest:v5];
  id v9 = +[PIPipelineFilters rawFaceBalanceFilter];
  long long v30 = v9;
  uint64_t v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v30 count:1];
  [v8 setPipelineFilters:v10];

  uint64_t v11 = (void *)[objc_alloc(MEMORY[0x1E4F7A5D0]) initWithTargetPixelCount:0x400000];
  [v8 setScalePolicy:v11];

  [v8 setSampleMode:1];
  [v8 setName:@"PIFaceBalanceAutoCalculator-RAW-face-request"];
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __66__PIFaceBalanceAutoCalculator_calculateRAWWithRequest_completion___block_invoke;
  v27[3] = &unk_1E5D81798;
  id v28 = v5;
  id v29 = v7;
  id v12 = v7;
  id v13 = v5;
  [v8 submit:v27];
}

void __66__PIFaceBalanceAutoCalculator_calculateRAWWithRequest_completion___block_invoke(uint64_t a1, void *a2)
{
  id v12 = 0;
  uint64_t v3 = [a2 result:&v12];
  id v4 = v12;
  if (v3)
  {
    uint64_t v5 = *(void *)(a1 + 32);
    id v11 = 0;
    id v6 = +[PIFaceBalanceAutoCalculator faceBalanceResultFromFaceObservations:v3 request:v5 error:&v11];
    id v7 = v11;
    id v8 = objc_alloc(MEMORY[0x1E4F7A660]);
    if (v6) {
      uint64_t v9 = [v8 initWithResult:v6];
    }
    else {
      uint64_t v9 = [v8 initWithError:v7];
    }
    uint64_t v10 = (void *)v9;
  }
  else
  {
    uint64_t v10 = (void *)[objc_alloc(MEMORY[0x1E4F7A660]) initWithError:v4];
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

+ (void)calculateWithRequest:(id)a3 completion:(id)a4
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  if (!v6)
  {
    id v13 = NUAssertLogger_6606();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      id v14 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "completion != nil");
      *(_DWORD *)buf = 138543362;
      long long v30 = v14;
      _os_log_error_impl(&dword_1A9680000, v13, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    double v15 = (const void **)MEMORY[0x1E4F7A308];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    double v17 = NUAssertLogger_6606();
    BOOL v18 = os_log_type_enabled(v17, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v18)
      {
        double v21 = dispatch_get_specific(*v15);
        double v22 = (void *)MEMORY[0x1E4F29060];
        id v23 = v21;
        id v24 = [v22 callStackSymbols];
        uint64_t v25 = [v24 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        long long v30 = v21;
        __int16 v31 = 2114;
        long long v32 = v25;
        _os_log_error_impl(&dword_1A9680000, v17, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v18)
    {
      BOOL v19 = [MEMORY[0x1E4F29060] callStackSymbols];
      double v20 = [v19 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      long long v30 = v20;
      _os_log_error_impl(&dword_1A9680000, v17, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler();
  }
  id v7 = v6;
  id v8 = (void *)[objc_alloc(MEMORY[0x1E4F7A4D8]) initWithRequest:v5 dataExtractor:@"CIFaceBalance" options:0];
  [v8 setName:@"PIFaceBalanceAutoCalculator-calculate"];
  uint64_t v9 = +[PIPipelineFilters stopAtTagIncludeOrientationFilter:@"/Master/Source"];
  id v28 = v9;
  uint64_t v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v28 count:1];
  [v8 setPipelineFilters:v10];

  id v11 = (void *)[objc_alloc(MEMORY[0x1E4F7A5D0]) initWithTargetPixelCount:0x400000];
  [v8 setScalePolicy:v11];

  [v8 setSampleMode:1];
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __63__PIFaceBalanceAutoCalculator_calculateWithRequest_completion___block_invoke;
  v26[3] = &unk_1E5D81670;
  id v27 = v7;
  id v12 = v7;
  [v8 submit:v26];
}

void __63__PIFaceBalanceAutoCalculator_calculateWithRequest_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = (objc_class *)MEMORY[0x1E4F1CA60];
  id v4 = a2;
  id v5 = [v3 alloc];
  id v41 = 0;
  id v6 = [v4 result:&v41];

  id v7 = v41;
  id v8 = [v6 data];
  uint64_t v9 = (void *)[v5 initWithDictionary:v8];

  if (v9)
  {
    uint64_t v10 = [v9 objectForKeyedSubscript:@"WarmTemp"];
    if (v10)
    {
      id v11 = (void *)v10;
      id v12 = [v9 objectForKeyedSubscript:@"WarmTint"];

      if (v12)
      {
        id v13 = +[PICompositionController settingForAdjustmentKey:@"whiteBalance" settingKey:@"warmTemp"];
        id v14 = +[PICompositionController settingForAdjustmentKey:@"whiteBalance" settingKey:@"warmTint"];
        double v15 = NSNumber;
        double v16 = [v13 minimumValue];
        [v16 doubleValue];
        double v18 = v17;

        BOOL v19 = [v9 objectForKeyedSubscript:@"WarmTemp"];
        [v19 doubleValue];
        double v21 = v20;

        double v22 = [v13 maximumValue];
        [v22 doubleValue];
        double v24 = v23;

        if (v21 >= v24) {
          double v25 = v24;
        }
        else {
          double v25 = v21;
        }
        if (v18 >= v25) {
          double v25 = v18;
        }
        uint64_t v26 = [v15 numberWithDouble:v25];
        [v9 setObject:v26 forKeyedSubscript:@"WarmTemp"];

        id v27 = NSNumber;
        id v28 = [v14 minimumValue];
        [v28 doubleValue];
        double v30 = v29;

        __int16 v31 = [v9 objectForKeyedSubscript:@"WarmTint"];
        [v31 doubleValue];
        double v33 = v32;

        uint64_t v34 = [v14 maximumValue];
        [v34 doubleValue];
        double v36 = v35;

        if (v33 >= v36) {
          double v37 = v36;
        }
        else {
          double v37 = v33;
        }
        if (v30 >= v37) {
          double v37 = v30;
        }
        v38 = [v27 numberWithDouble:v37];
        [v9 setObject:v38 forKeyedSubscript:@"WarmTint"];
      }
    }
    uint64_t v39 = [objc_alloc(MEMORY[0x1E4F7A660]) initWithResult:v9];
  }
  else
  {
    uint64_t v39 = [objc_alloc(MEMORY[0x1E4F7A660]) initWithError:v7];
  }
  double v40 = (void *)v39;
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

@end