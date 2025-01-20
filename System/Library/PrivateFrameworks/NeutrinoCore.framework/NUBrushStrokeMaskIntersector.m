@interface NUBrushStrokeMaskIntersector
- (CIImage)brushMinusMaskImage;
- (CIImage)brushStrokeMaskImage;
- (CIImage)intersectionImage;
- (CIImage)maskImage;
- (NUBrushStrokeMaskIntersector)init;
- (NUBrushStrokeMaskIntersector)initWithBrushMask:(id)a3 mask:(id)a4 strokeScale:(id)a5;
- (NUHistogram)brushHistogram;
- (NUHistogram)intersectionHistogram;
- (NUHistogram)maskHistogram;
- (NUHistogramCalculator)histogramCalculator;
- (double)brushPercentInsideMask;
- (double)calculateOverlapOfHistogram:(id)a3;
- (double)maskPercentInsideBrush;
@end

@implementation NUBrushStrokeMaskIntersector

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_maskImage, 0);
  objc_storeStrong((id *)&self->_brushStrokeMaskImage, 0);
  objc_storeStrong((id *)&self->_histogramCalculator, 0);
  objc_storeStrong((id *)&self->_brushMinusMaskImage, 0);
  objc_storeStrong((id *)&self->_intersectionImage, 0);
  objc_storeStrong((id *)&self->_intersectionHistogram, 0);
  objc_storeStrong((id *)&self->_maskHistogram, 0);

  objc_storeStrong((id *)&self->_brushHistogram, 0);
}

- (CIImage)maskImage
{
  return self->_maskImage;
}

- (CIImage)brushStrokeMaskImage
{
  return self->_brushStrokeMaskImage;
}

- (NUHistogramCalculator)histogramCalculator
{
  return self->_histogramCalculator;
}

- (CIImage)brushMinusMaskImage
{
  return self->_brushMinusMaskImage;
}

- (CIImage)intersectionImage
{
  return self->_intersectionImage;
}

- (double)maskPercentInsideBrush
{
  if (_NULogOnceToken != -1) {
    dispatch_once(&_NULogOnceToken, &__block_literal_global_66);
  }
  v3 = (id)_NULogger;
  v4 = v3;
  os_signpost_id_t signpost = self->_signpost;
  if (signpost - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v3))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A9892000, v4, OS_SIGNPOST_INTERVAL_BEGIN, signpost, "NUBrushStrokeMaskIntersector.maskPercentInsideBrush", (const char *)&unk_1A9A9F00F, buf, 2u);
  }

  v6 = [(NUBrushStrokeMaskIntersector *)self maskHistogram];
  [(NUBrushStrokeMaskIntersector *)self calculateOverlapOfHistogram:v6];
  double v8 = v7;

  if (_NULogOnceToken != -1) {
    dispatch_once(&_NULogOnceToken, &__block_literal_global_66);
  }
  v9 = (id)_NULogger;
  v10 = v9;
  os_signpost_id_t v11 = self->_signpost;
  if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    *(_WORD *)v13 = 0;
    _os_signpost_emit_with_name_impl(&dword_1A9892000, v10, OS_SIGNPOST_INTERVAL_END, v11, "NUBrushStrokeMaskIntersector.maskPercentInsideBrush", (const char *)&unk_1A9A9F00F, v13, 2u);
  }

  return v8;
}

- (double)brushPercentInsideMask
{
  if (_NULogOnceToken != -1) {
    dispatch_once(&_NULogOnceToken, &__block_literal_global_66);
  }
  v3 = (id)_NULogger;
  v4 = v3;
  os_signpost_id_t signpost = self->_signpost;
  if (signpost - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v3))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A9892000, v4, OS_SIGNPOST_INTERVAL_BEGIN, signpost, "NUBrushStrokeMaskIntersector.brushPercentInsideMask", (const char *)&unk_1A9A9F00F, buf, 2u);
  }

  v6 = [(NUBrushStrokeMaskIntersector *)self brushHistogram];
  [(NUBrushStrokeMaskIntersector *)self calculateOverlapOfHistogram:v6];
  double v8 = v7;

  if (_NULogOnceToken != -1) {
    dispatch_once(&_NULogOnceToken, &__block_literal_global_66);
  }
  v9 = (id)_NULogger;
  v10 = v9;
  os_signpost_id_t v11 = self->_signpost;
  if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    *(_WORD *)v13 = 0;
    _os_signpost_emit_with_name_impl(&dword_1A9892000, v10, OS_SIGNPOST_INTERVAL_END, v11, "NUBrushStrokeMaskIntersector.brushPercentInsideMask", (const char *)&unk_1A9A9F00F, v13, 2u);
  }

  return v8;
}

- (double)calculateOverlapOfHistogram:(id)a3
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!v4)
  {
    v14 = NUAssertLogger_16692();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      v15 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "imageHistogram != nil");
      *(_DWORD *)buf = 138543362;
      v31 = v15;
      _os_log_error_impl(&dword_1A9892000, v14, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    v17 = NUAssertLogger_16692();
    BOOL v18 = os_log_type_enabled(v17, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v18)
      {
        v21 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v22 = (void *)MEMORY[0x1E4F29060];
        id v23 = v21;
        v24 = [v22 callStackSymbols];
        v25 = [v24 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v31 = v21;
        __int16 v32 = 2114;
        v33 = v25;
        _os_log_error_impl(&dword_1A9892000, v17, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v18)
    {
      v19 = [MEMORY[0x1E4F29060] callStackSymbols];
      v20 = [v19 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v31 = v20;
      _os_log_error_impl(&dword_1A9892000, v17, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUBrushStrokeMaskIntersector calculateOverlapOfHistogram:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Mask/NUBrushStrokeMaskIntersector.m", 107, @"Invalid parameter not satisfying: %s", v26, v27, v28, v29, (uint64_t)"imageHistogram != nil");
  }
  v5 = v4;
  v6 = [(NUBrushStrokeMaskIntersector *)self histogramCalculator];
  double v7 = 1.0 / (double)[v6 binCount];

  double v8 = [(NUBrushStrokeMaskIntersector *)self intersectionHistogram];
  [v8 threshold:v7];
  double v10 = v9;

  [v5 threshold:v7];
  double v12 = v11;

  return v10 / v12;
}

- (NUHistogram)intersectionHistogram
{
  intersectionHistogram = self->_intersectionHistogram;
  if (!intersectionHistogram)
  {
    id v4 = [(NUBrushStrokeMaskIntersector *)self histogramCalculator];
    v5 = [(NUBrushStrokeMaskIntersector *)self intersectionImage];
    v6 = [v4 computeHistogramFromMatte:v5];
    double v7 = self->_intersectionHistogram;
    self->_intersectionHistogram = v6;

    intersectionHistogram = self->_intersectionHistogram;
  }

  return intersectionHistogram;
}

- (NUHistogram)maskHistogram
{
  maskHistogram = self->_maskHistogram;
  if (!maskHistogram)
  {
    id v4 = [(NUBrushStrokeMaskIntersector *)self histogramCalculator];
    v5 = [(NUBrushStrokeMaskIntersector *)self maskImage];
    v6 = [v4 computeHistogramFromMatte:v5];
    double v7 = self->_maskHistogram;
    self->_maskHistogram = v6;

    maskHistogram = self->_maskHistogram;
  }

  return maskHistogram;
}

- (NUHistogram)brushHistogram
{
  brushHistogram = self->_brushHistogram;
  if (!brushHistogram)
  {
    id v4 = [(NUBrushStrokeMaskIntersector *)self histogramCalculator];
    v5 = [(NUBrushStrokeMaskIntersector *)self brushStrokeMaskImage];
    v6 = [v4 computeHistogramFromMatte:v5];
    double v7 = self->_brushHistogram;
    self->_brushHistogram = v6;

    brushHistogram = self->_brushHistogram;
  }

  return brushHistogram;
}

- (NUBrushStrokeMaskIntersector)initWithBrushMask:(id)a3 mask:(id)a4 strokeScale:(id)a5
{
  int64_t var1 = a5.var1;
  int64_t var0 = a5.var0;
  id v10 = a3;
  v39.receiver = self;
  v39.super_class = (Class)NUBrushStrokeMaskIntersector;
  id v11 = a4;
  double v12 = [(NUBrushStrokeMaskIntersector *)&v39 init];
  if (_NULogOnceToken != -1) {
    dispatch_once(&_NULogOnceToken, &__block_literal_global_66);
  }
  v12->_os_signpost_id_t signpost = os_signpost_id_make_with_pointer((os_log_t)_NULogger, v12);
  p_brushStrokeMaskImage = (void **)&v12->_brushStrokeMaskImage;
  objc_storeStrong((id *)&v12->_brushStrokeMaskImage, a3);
  if (!NUScaleEqual(var0, var1, NUScaleOne, *((uint64_t *)&NUScaleOne + 1)))
  {
    double v14 = NUScaleToDouble(var0, var1);
    memset(&v38, 0, sizeof(v38));
    CGAffineTransformMakeScale(&v38, v14, v14);
    v15 = *p_brushStrokeMaskImage;
    CGAffineTransform v37 = v38;
    uint64_t v16 = [v15 imageByApplyingTransform:&v37];
    v17 = *p_brushStrokeMaskImage;
    *p_brushStrokeMaskImage = (void *)v16;
  }
  BOOL v18 = (void *)MEMORY[0x1E4F1E050];
  v19 = [MEMORY[0x1E4F1E008] blackColor];
  v20 = [v18 imageWithColor:v19];

  v21 = [(CIImage *)v12->_brushStrokeMaskImage imageByCompositingOverImage:v20];
  uint64_t v22 = [v11 size];
  uint64_t v24 = objc_msgSend(v21, "imageByCroppingToRect:", 0.0, 0.0, (double)v22, (double)v23);
  brushStrokeMaskImage = v12->_brushStrokeMaskImage;
  v12->_brushStrokeMaskImage = (CIImage *)v24;

  uint64_t v26 = [MEMORY[0x1E4F1E050] imageWithNUImageBuffer:v11];

  maskImage = v12->_maskImage;
  v12->_maskImage = (CIImage *)v26;

  uint64_t v28 = [MEMORY[0x1E4F1E040] multiplyCompositingFilter];
  [v28 setInputImage:v12->_maskImage];
  [v28 setBackgroundImage:v12->_brushStrokeMaskImage];
  uint64_t v29 = [v28 outputImage];
  intersectionImage = v12->_intersectionImage;
  v12->_intersectionImage = (CIImage *)v29;

  v31 = [MEMORY[0x1E4F1E040] subtractBlendModeFilter];
  [v31 setInputImage:v12->_maskImage];
  [v31 setBackgroundImage:v12->_brushStrokeMaskImage];
  uint64_t v32 = [v31 outputImage];
  brushMinusMaskImage = v12->_brushMinusMaskImage;
  v12->_brushMinusMaskImage = (CIImage *)v32;

  uint64_t v34 = objc_alloc_init(NUHistogramCalculator);
  histogramCalculator = v12->_histogramCalculator;
  v12->_histogramCalculator = v34;

  return v12;
}

- (NUBrushStrokeMaskIntersector)init
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  if (_NULogOnceToken != -1) {
    dispatch_once(&_NULogOnceToken, &__block_literal_global_16706);
  }
  v3 = (void *)_NUAssertLogger;
  if (os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR))
  {
    id v4 = NSString;
    v5 = v3;
    v6 = (objc_class *)objc_opt_class();
    double v7 = NSStringFromClass(v6);
    double v8 = NSStringFromSelector(a2);
    double v9 = [v4 stringWithFormat:@"Initializer not available: -[%@ %@], use designated initializer instead.", v7, v8];
    *(_DWORD *)buf = 138543362;
    uint64_t v29 = v9;
    _os_log_error_impl(&dword_1A9892000, v5, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    uint64_t v10 = _NULogOnceToken;
    if (!dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey))
    {
      if (v10 != -1) {
        dispatch_once(&_NULogOnceToken, &__block_literal_global_16706);
      }
      goto LABEL_8;
    }
    if (v10 != -1) {
      dispatch_once(&_NULogOnceToken, &__block_literal_global_16706);
    }
  }
  else if (!dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey))
  {
LABEL_8:
    id v11 = (void *)_NUAssertLogger;
    if (!os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR)) {
      goto LABEL_15;
    }
    double v12 = (void *)MEMORY[0x1E4F29060];
    v13 = v11;
    double v14 = [v12 callStackSymbols];
    v15 = [v14 componentsJoinedByString:@"\n"];
    *(_DWORD *)buf = 138543362;
    uint64_t v29 = v15;
    _os_log_error_impl(&dword_1A9892000, v13, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    goto LABEL_14;
  }
  uint64_t v16 = (void *)_NUAssertLogger;
  if (!os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR)) {
    goto LABEL_15;
  }
  specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
  BOOL v18 = (void *)MEMORY[0x1E4F29060];
  id v19 = specific;
  v13 = v16;
  v20 = [v18 callStackSymbols];
  v21 = [v20 componentsJoinedByString:@"\n"];
  *(_DWORD *)buf = 138543618;
  uint64_t v29 = specific;
  __int16 v30 = 2114;
  v31 = v21;
  _os_log_error_impl(&dword_1A9892000, v13, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

LABEL_14:
LABEL_15:
  uint64_t v22 = (objc_class *)objc_opt_class();
  uint64_t v23 = NSStringFromClass(v22);
  NSStringFromSelector(a2);
  objc_claimAutoreleasedReturnValue();
  _NUAssertFailHandler((uint64_t)"-[NUBrushStrokeMaskIntersector init]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Mask/NUBrushStrokeMaskIntersector.m", 46, @"Initializer not available: -[%@ %@], use designated initializer instead.", v24, v25, v26, v27, v23);
}

@end