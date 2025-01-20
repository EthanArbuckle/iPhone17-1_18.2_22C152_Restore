@interface CRNeuralTextDetector
+ (BOOL)_supportsFragmentedLines;
+ (CGSize)scaledImageSizeForOptions:(id)a3 imageSize:(CGSize)a4;
+ (id)_lineRegionFromLineTextFeature:(id)a3 imageSize:(CGSize)a4;
+ (id)detectorForRevision:(unint64_t)a3 imageReaderOptions:(id)a4 error:(id *)a5;
+ (id)textFeaturesFromPolygons:(void *)a3 withScale:(const float *)a4 withNMSOutputScale:(unint64_t)a5;
- (BOOL)preheatWithError:(id *)a3;
- (BOOL)shouldCancel;
- (CGSize)smallestImageSizeForTextWithRelativeHeight:(double)a3 originalImageSize:(CGSize)a4;
- (CRDetectorConfiguration)configuration;
- (CRNeuralTextDetector)init;
- (CRPerformanceStatistics)detectorStats;
- (CRPerformanceStatistics)inferenceStats;
- (CRPerformanceStatistics)postProcStats;
- (id)detectInImage:(id)a3 error:(id *)a4;
- (id)detectInImage:(id)a3 trackingSession:(id)a4 error:(id *)a5;
- (id)enumerateTilesForImage:(id)a3 block:(id)a4;
- (void)cancel;
- (void)setConfiguration:(id)a3;
- (void)setDetectorStats:(id)a3;
- (void)setInferenceStats:(id)a3;
- (void)setPostProcStats:(id)a3;
- (void)setShouldCancel:(BOOL)a3;
@end

@implementation CRNeuralTextDetector

+ (id)detectorForRevision:(unint64_t)a3 imageReaderOptions:(id)a4 error:(id *)a5
{
  id v7 = a4;
  v8 = (void *)[v7 mutableCopy];
  v9 = [v7 objectForKey:@"CRImageReaderRevisionKey"];
  uint64_t v10 = [v9 unsignedIntegerValue];

  if (v10 != a3)
  {
    v11 = [NSNumber numberWithUnsignedInteger:a3];
    [v8 setObject:v11 forKeyedSubscript:@"CRImageReaderRevisionKey"];
  }
  v12 = [[CRDetectorConfiguration alloc] initWithImageReaderOptions:v8 error:a5];
  if (!v12) {
    goto LABEL_16;
  }
  switch(a3)
  {
    case 3uLL:
LABEL_13:
      v16 = [[CRNeuralTextDetectorV3 alloc] initWithConfiguration:v12 error:a5];
      goto LABEL_17;
    case 2uLL:
      v13 = CROSLogForCategory(0);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
      {
        __int16 v18 = 0;
        v14 = "Unexpected attempt to load V2 detector";
        v15 = (uint8_t *)&v18;
        goto LABEL_11;
      }
LABEL_12:

      goto LABEL_13;
    case 1uLL:
      v13 = CROSLogForCategory(0);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
      {
        __int16 v19 = 0;
        v14 = "Unexpected attempt to load V1 detector";
        v15 = (uint8_t *)&v19;
LABEL_11:
        _os_log_impl(&dword_1DD733000, v13, OS_LOG_TYPE_FAULT, v14, v15, 2u);
        goto LABEL_12;
      }
      goto LABEL_12;
  }
  if (a5)
  {
    +[CRImageReader errorWithErrorCode:-4];
    v16 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
LABEL_16:
    v16 = 0;
  }
LABEL_17:

  return v16;
}

- (CRNeuralTextDetector)init
{
  v7.receiver = self;
  v7.super_class = (Class)CRNeuralTextDetector;
  v2 = [(CRNeuralTextDetector *)&v7 init];
  if (v2)
  {
    v3 = [[CRPerformanceStatistics alloc] initWithName:@"Detection" measureRecentPeak:0];
    [(CRNeuralTextDetector *)v2 setDetectorStats:v3];

    v4 = [[CRPerformanceStatistics alloc] initWithName:@"Post Processing" measureRecentPeak:0];
    [(CRNeuralTextDetector *)v2 setPostProcStats:v4];

    v5 = [[CRPerformanceStatistics alloc] initWithName:@"Detector Inference" measureRecentPeak:0];
    [(CRNeuralTextDetector *)v2 setInferenceStats:v5];

    [(CRNeuralTextDetector *)v2 setShouldCancel:0];
  }
  return v2;
}

- (void)cancel
{
}

- (BOOL)preheatWithError:(id *)a3
{
  return 1;
}

- (id)enumerateTilesForImage:(id)a3 block:(id)a4
{
  id v6 = a3;
  objc_super v7 = (void (**)(id, uint64_t, unsigned char *, double, double, double, double))a4;
  if (v7)
  {
    v8 = [(CRNeuralTextDetector *)self configuration];
    [v8 tileOverlap];
    double v10 = v9;

    v11 = [(CRNeuralTextDetector *)self configuration];
    [v11 tileSize];
    double rect = v12;
    double v14 = v13;

    unint64_t v15 = [v6 width];
    unint64_t v16 = [v6 height];
    double v17 = rect - v10;
    float v18 = ((double)v15 - v10) / (rect - v10);
    uint64_t v19 = vcvtps_s32_f32(v18);
    double v37 = v14 - v10;
    float v20 = ((double)v16 - v10) / (v14 - v10);
    uint64_t v21 = vcvtps_s32_f32(v20);
    v39 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:v21 * v19];
    char v41 = 0;
    if (v21 >= 1)
    {
      uint64_t v22 = 0;
      uint64_t v38 = v21;
      do
      {
        v23 = self;
        if (v19 >= 1)
        {
          uint64_t v24 = 0;
          while (1)
          {
            double x = v17 * (double)(int)v24;
            if (x >= 0.0)
            {
              double height = v14;
              double width = rect;
              double y = v37 * (double)(int)v22;
            }
            else
            {
              v43.origin.double x = v17 * (double)(int)v24;
              v43.origin.double y = v37 * (double)(int)v22;
              v43.size.double width = rect;
              v43.size.double height = v14;
              CGRect v44 = CGRectOffset(v43, -x, 0.0);
              double x = v44.origin.x;
              double y = v44.origin.y;
              double width = v44.size.width;
              double height = v44.size.height;
            }
            if (width + x >= (double)(unint64_t)[v6 width])
            {
              unint64_t v29 = [v6 width];
              v45.origin.double x = x;
              v45.origin.double y = y;
              v45.size.double width = width;
              v45.size.double height = height;
              CGRect v46 = CGRectOffset(v45, (double)v29 - (width + x), 0.0);
              double x = v46.origin.x;
              double y = v46.origin.y;
              double width = v46.size.width;
              double height = v46.size.height;
            }
            if (y < 0.0)
            {
              v47.origin.double x = x;
              v47.origin.double y = y;
              v47.size.double width = width;
              v47.size.double height = height;
              CGRect v48 = CGRectOffset(v47, 0.0, -y);
              double x = v48.origin.x;
              double y = v48.origin.y;
              double width = v48.size.width;
              double height = v48.size.height;
            }
            if (height + y >= (double)(unint64_t)[v6 height])
            {
              unint64_t v30 = [v6 height];
              v49.origin.double x = x;
              v49.origin.double y = y;
              v49.size.double width = width;
              v49.size.double height = height;
              CGRect v50 = CGRectOffset(v49, 0.0, (double)v30 - (height + y));
              double x = v50.origin.x;
              double y = v50.origin.y;
              double width = v50.size.width;
              double height = v50.size.height;
            }
            v31 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithRect:", x / (double)(unint64_t)objc_msgSend(v6, "width"), y / (double)(unint64_t)objc_msgSend(v6, "height"), width / (double)(unint64_t)objc_msgSend(v6, "width"), height / (double)(unint64_t)objc_msgSend(v6, "height"));
            [v39 addObject:v31];

            v32 = objc_msgSend(v6, "imageByCroppingRectangle:", x, y, width, height);
            v7[2](v7, [v32 pixelBuffer], &v41, x, y, width, height);
            if (v41 || [(CRNeuralTextDetector *)v23 shouldCancel]) {
              break;
            }

            if (v19 == ++v24) {
              goto LABEL_20;
            }
          }
        }
LABEL_20:
        self = v23;
        if (v41) {
          break;
        }
        char v33 = [(CRNeuralTextDetector *)v23 shouldCancel];
        char v34 = ++v22 == v38 ? 1 : v33;
      }
      while ((v34 & 1) == 0);
    }
    v35 = v39;
  }
  else
  {
    v35 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v35;
}

+ (CGSize)scaledImageSizeForOptions:(id)a3 imageSize:(CGSize)a4
{
  double height = a4.height;
  double width = a4.width;
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  unint64_t v7 = +[CRImageReader defaultRevisionNumber];
  v8 = [v6 objectForKeyedSubscript:@"CRImageReaderRevisionKey"];

  if (v8)
  {
    double v9 = [v6 objectForKey:@"CRImageReaderRevisionKey"];
    unint64_t v7 = [v9 unsignedIntegerValue];
  }
  double v10 = (void *)[v6 mutableCopy];
  v11 = [v6 objectForKey:@"CRImageReaderRevisionKey"];
  uint64_t v12 = [v11 unsignedIntegerValue];

  if (v12 != v7)
  {
    double v13 = [NSNumber numberWithUnsignedInteger:v7];
    [v10 setObject:v13 forKeyedSubscript:@"CRImageReaderRevisionKey"];
  }
  if (v7 > 2)
  {
    if (v7 == 3)
    {
      unint64_t v15 = [[CRDetectorConfiguration alloc] initWithImageReaderOptions:v10 error:0];
      +[CRNeuralTextDetectorV3 scaledImageSizeForConfiguration:imageSize:](CRNeuralTextDetectorV3, "scaledImageSizeForConfiguration:imageSize:", v15, width, height);
      double width = v16;
      double height = v17;
    }
    else
    {
      float v18 = CROSLogForCategory(0);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT))
      {
        int v21 = 134217984;
        unint64_t v22 = v7;
        _os_log_impl(&dword_1DD733000, v18, OS_LOG_TYPE_FAULT, "scaledImageSizeForOptions: not implemented for revision %lu", (uint8_t *)&v21, 0xCu);
      }
    }
  }
  else
  {
    double v14 = CROSLogForCategory(0);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v21) = 0;
      _os_log_impl(&dword_1DD733000, v14, OS_LOG_TYPE_DEFAULT, "detectorImageSizeForOptions is only supported on V3 onwards", (uint8_t *)&v21, 2u);
    }
  }
  double v19 = width;
  double v20 = height;
  result.double height = v20;
  result.double width = v19;
  return result;
}

+ (id)textFeaturesFromPolygons:(void *)a3 withScale:(const float *)a4 withNMSOutputScale:(unint64_t)a5
{
  unint64_t v54 = a5;
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  id v53 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v10 = *(void *)a3;
  if (*((void *)a3 + 1) != *(void *)a3)
  {
    unint64_t v11 = 0;
    do
    {
      uint64_t v12 = v10 + 168 * v11;
      CRDetectorUtils::sortQuadWithRotation(v12, v7, v8, v9);
      double v13 = [CRTextFeature alloc];
      double v14 = *a4;
      unint64_t v15 = -[CRTextFeature initWithTopLeft:topRight:bottomLeft:bottomRight:](v13, "initWithTopLeft:topRight:bottomLeft:bottomRight:", *(double *)v12 / v14, *(double *)(v12 + 8) / a4[1], *(double *)(v12 + 16) / v14, *(double *)(v12 + 24) / a4[1], *(double *)(v12 + 48) / v14, *(double *)(v12 + 56) / a4[1], *(double *)(v12 + 32) / v14, *(double *)(v12 + 40) / a4[1]);
      double v16 = v15;
      unint64_t v17 = *(void *)(*(void *)a3 + 168 * v11 + 72) - *(void *)(*(void *)a3 + 168 * v11 + 64);
      if ((int)(v17 >> 4) < 1)
      {
        [(CRTextFeature *)v15 setPolygon:0];
      }
      else
      {
        uint64_t v18 = (v17 >> 4);
        MEMORY[0x1F4188790](v15);
        uint64_t v20 = 0;
        uint64_t v21 = *(void *)(*(void *)a3 + 168 * v11 + 64);
        float64x2_t v22 = vcvtq_f64_f32(*(float32x2_t *)a4);
        do
        {
          *(float64x2_t *)((char *)&v53 + v20 + -16 * v18) = vdivq_f64(*(float64x2_t *)(v21 + v20), v22);
          v20 += 16;
        }
        while (v19 != v20);
        uint64_t v23 = -[CRNormalizedPolyline initWithNormalizedPoints:count:size:]([CRNormalizedPolyline alloc], "initWithNormalizedPoints:count:size:", &v53 - 2 * v18, v18, *a4, a4[1]);
        [(CRTextFeature *)v16 setPolygon:v23];
      }
      [(CRTextFeature *)v16 bounds];
      if (v24 > 0.0)
      {
        [(CRTextFeature *)v16 bounds];
        if (v25 > 0.0)
        {
          double v26 = *(double *)(v12 + 104);
          *(float *)&double v26 = v26;
          [(CRTextFeature *)v16 setBaselineAngle:v26];
          [(CRTextFeature *)v16 setIsCurved:*(unsigned __int8 *)(v12 + 136)];
          [(CRTextFeature *)v16 setFeatureID:*(unsigned int *)(v12 + 140)];
          [(CRTextFeature *)v16 setNmsOutputScale:v54];
          id v55 = [MEMORY[0x1E4F1CA48] array];
          uint64_t v30 = *(void *)a3;
          if (0xCF3CF3CF3CF3CF3DLL * ((uint64_t)(*((void *)a3 + 1) - *(void *)a3) >> 3) <= v11) {
LABEL_28:
          }
            std::vector<std::vector<BreakPoint>>::__throw_out_of_range[abi:ne180100]();
          unint64_t v31 = 0;
          while (1)
          {
            uint64_t v32 = v30 + 168 * v11;
            uint64_t v33 = *(void *)(v32 + 144);
            if (0x8E38E38E38E38E39 * ((*(void *)(v32 + 152) - v33) >> 4) <= v31) {
              break;
            }
            char v34 = (double *)(v33 + 144 * v31);
            CRDetectorUtils::sortQuadWithRotation((uint64_t)v34, v27, v28, v29);
            v35 = [CRTextFeature alloc];
            double v36 = *a4;
            double v37 = -[CRTextFeature initWithTopLeft:topRight:bottomLeft:bottomRight:](v35, "initWithTopLeft:topRight:bottomLeft:bottomRight:", *v34 / v36, v34[1] / a4[1], v34[2] / v36, v34[3] / a4[1], v34[6] / v36, v34[7] / a4[1], v34[4] / v36, v34[5] / a4[1]);
            [(CRTextFeature *)v37 bounds];
            if (v38 > 0.0)
            {
              uint64_t v39 = [(CRTextFeature *)v37 bounds];
              if (v40 > 0.0)
              {
                unint64_t v41 = *(void *)(*(void *)(*(void *)a3 + 168 * v11 + 144) + 144 * v31 + 72)
                    - *(void *)(*(void *)(*(void *)a3 + 168 * v11 + 144) + 144 * v31 + 64);
                if ((int)(v41 >> 4) < 1)
                {
                  [(CRTextFeature *)v37 setPolygon:0];
                }
                else
                {
                  uint64_t v42 = (v41 >> 4);
                  MEMORY[0x1F4188790](v39);
                  uint64_t v44 = 0;
                  uint64_t v47 = *(void *)(*(void *)(*(void *)a3 + v11 * v45 + 144) + v31 * v46 + 64);
                  float64x2_t v48 = vcvtq_f64_f32(*(float32x2_t *)a4);
                  do
                  {
                    *(float64x2_t *)((char *)&v53 + v44 + -16 * v42) = vdivq_f64(*(float64x2_t *)(v47 + v44), v48);
                    v44 += 16;
                  }
                  while (v43 != v44);
                  CGRect v49 = -[CRNormalizedPolyline initWithNormalizedPoints:count:size:]([CRNormalizedPolyline alloc], "initWithNormalizedPoints:count:size:", &v53 - 2 * v42, v42, *a4, a4[1]);
                  [(CRTextFeature *)v37 setPolygon:v49];
                }
                double v50 = *(double *)(v33 + 144 * v31 + 104);
                *(float *)&double v50 = v50;
                [(CRTextFeature *)v37 setBaselineAngle:v50];
                [(CRTextFeature *)v37 setIsCurved:*(unsigned __int8 *)(v33 + 144 * v31 + 136)];
                [(CRTextFeature *)v37 setFeatureID:*(unsigned int *)(v33 + 144 * v31 + 140)];
                [(CRTextFeature *)v37 setNmsOutputScale:v54];
                [v55 addObject:v37];
              }
            }

            ++v31;
            uint64_t v30 = *(void *)a3;
            if (0xCF3CF3CF3CF3CF3DLL * ((uint64_t)(*((void *)a3 + 1) - *(void *)a3) >> 3) <= v11) {
              goto LABEL_28;
            }
          }
          [(CRTextFeature *)v16 setSubFeatures:v55];
          [v53 addObject:v16];
        }
      }

      ++v11;
      uint64_t v10 = *(void *)a3;
    }
    while (0xCF3CF3CF3CF3CF3DLL * ((uint64_t)(*((void *)a3 + 1) - *(void *)a3) >> 3) > v11);
  }
  id v51 = v53;
  return v51;
}

+ (BOOL)_supportsFragmentedLines
{
  return 0;
}

+ (id)_lineRegionFromLineTextFeature:(id)a3 imageSize:(CGSize)a4
{
  double height = a4.height;
  double width = a4.width;
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  if ([a1 _supportsFragmentedLines])
  {
    uint64_t v8 = objc_opt_new();
    long long v44 = 0u;
    long long v45 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    double v9 = [v7 subFeatures];
    uint64_t v10 = [v9 countByEnumeratingWithState:&v42 objects:v46 count:16];
    if (v10)
    {
      uint64_t v11 = *(void *)v43;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v43 != v11) {
            objc_enumerationMutation(v9);
          }
          double v13 = objc_msgSend(a1, "_lineRegionFromLineTextFeature:imageSize:", *(void *)(*((void *)&v42 + 1) + 8 * i), width, height);
          [v8 addObject:v13];
        }
        uint64_t v10 = [v9 countByEnumeratingWithState:&v42 objects:v46 count:16];
      }
      while (v10);
    }

    double v14 = objc_opt_new();
    [v14 setRegionFragments:v8];
  }
  else
  {
    uint64_t v15 = objc_opt_new();
    double v16 = [v7 subFeatures];
    uint64_t v17 = [v16 count];

    if (v17 == 1)
    {
      uint64_t v18 = [v7 subFeatures];
      uint64_t v19 = [v18 firstObject];

      double v14 = (void *)v15;
      id v7 = (id)v19;
    }
    else
    {
      double v14 = (void *)v15;
    }
  }
  uint64_t v20 = [CRNormalizedQuad alloc];
  [v7 topLeft];
  double v22 = v21;
  double v24 = v23;
  [v7 topRight];
  double v26 = v25;
  double v28 = v27;
  [v7 bottomRight];
  double v30 = v29;
  double v32 = v31;
  [v7 bottomLeft];
  v35 = -[CRNormalizedQuad initWithNormalizedTopLeft:topRight:bottomRight:bottomLeft:size:](v20, "initWithNormalizedTopLeft:topRight:bottomRight:bottomLeft:size:", v22, v24, v26, v28, v30, v32, v33, v34, *(void *)&width, *(void *)&height);
  [v14 setBoundingQuad:v35];

  [v14 setLayoutDirection:1];
  objc_msgSend(v14, "setIsCurved:", objc_msgSend(v7, "isCurved"));
  double v36 = [v7 polygon];
  [v14 setPolygon:v36];

  double v37 = [v7 scriptCategoryResults];
  [v14 setScriptCategoryResults:v37];

  double v38 = [v7 selectedScriptCategory];
  [v14 setTopScriptCategory:v38];

  uint64_t v39 = [v7 scriptCounts];
  [v14 setScriptCategoryCounts:v39];

  objc_msgSend(v14, "setShouldRunSequenceScript:", objc_msgSend(v7, "useSequenceScriptLocale"));
  objc_msgSend(v14, "setNmsOutputScale:", objc_msgSend(v7, "nmsOutputScale"));
  if ([v7 isVerticalLayout]) {
    uint64_t v40 = 5;
  }
  else {
    uint64_t v40 = 1;
  }
  [v14 setLayoutDirection:v40];
  if ([v7 shouldRotate180]) {
    [v14 rotate180];
  }
  objc_msgSend(v14, "setShouldRotate180DetectorOrientationFallback:", objc_msgSend(v7, "shouldRotate180DetectorOrientationFallBack"));
  objc_msgSend(v14, "setShouldRunSequenceOrientation:", objc_msgSend(v7, "useSequenceOrientation"));
  objc_msgSend(v14, "setTextType:", objc_msgSend(v7, "textType"));

  return v14;
}

- (id)detectInImage:(id)a3 error:(id *)a4
{
  return 0;
}

- (id)detectInImage:(id)a3 trackingSession:(id)a4 error:(id *)a5
{
  v5 = [(CRNeuralTextDetector *)self detectInImage:a3 error:a5];
  return v5;
}

- (CGSize)smallestImageSizeForTextWithRelativeHeight:(double)a3 originalImageSize:(CGSize)a4
{
  double v4 = *MEMORY[0x1E4F1DB30];
  double v5 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  result.double height = v5;
  result.double width = v4;
  return result;
}

- (CRDetectorConfiguration)configuration
{
  return (CRDetectorConfiguration *)objc_getProperty(self, a2, 16, 1);
}

- (void)setConfiguration:(id)a3
{
}

- (CRPerformanceStatistics)detectorStats
{
  return (CRPerformanceStatistics *)objc_getProperty(self, a2, 24, 1);
}

- (void)setDetectorStats:(id)a3
{
}

- (CRPerformanceStatistics)postProcStats
{
  return (CRPerformanceStatistics *)objc_getProperty(self, a2, 32, 1);
}

- (void)setPostProcStats:(id)a3
{
}

- (CRPerformanceStatistics)inferenceStats
{
  return (CRPerformanceStatistics *)objc_getProperty(self, a2, 40, 1);
}

- (void)setInferenceStats:(id)a3
{
}

- (BOOL)shouldCancel
{
  return self->_shouldCancel;
}

- (void)setShouldCancel:(BOOL)a3
{
  self->_shouldCancel = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inferenceStats, 0);
  objc_storeStrong((id *)&self->_postProcStats, 0);
  objc_storeStrong((id *)&self->_detectorStats, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
}

@end