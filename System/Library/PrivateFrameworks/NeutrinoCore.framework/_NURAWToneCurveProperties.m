@interface _NURAWToneCurveProperties
- (NSData)boostCurveData;
- (_NURAWToneCurveProperties)initWithToneCurveFilter:(id)a3 gainMapTableFilter:(id)a4;
- (float)_curveValueAt:(float)result data:(id)a4;
- (float)_inverseCurveValueAt:(float)a3 data:(id)a4;
- (float)baselineExposure;
- (float)boostCurveValueAt:(float)a3;
- (float)inverseAggregatedCurveValueAt:(float)a3;
- (id)_generateCurveDataFromFilters:(id)a3 sampleCount:(unint64_t)a4;
- (id)_generateGainMapExposure;
- (id)aggregateCurveData;
- (id)localAverageCurveData;
@end

@implementation _NURAWToneCurveProperties

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rawGainTableMapFilter, 0);
  objc_storeStrong((id *)&self->_rawTRCFilter, 0);
  objc_storeStrong((id *)&self->_gainMapExposure, 0);
  objc_storeStrong((id *)&self->_aggregateCurveData, 0);
  objc_storeStrong((id *)&self->_localAverageCurveData, 0);

  objc_storeStrong((id *)&self->_boostCurveData, 0);
}

- (id)_generateGainMapExposure
{
  v32[1] = *MEMORY[0x1E4F143B8];
  v3 = self->_rawGainTableMapFilter;
  v4 = self->_rawTRCFilter;
  v6 = v4;
  float v7 = 1.0;
  if (v3) {
    BOOL v8 = v4 == 0;
  }
  else {
    BOOL v8 = 1;
  }
  unint64_t v9 = 0x1E4F28000uLL;
  if (v8)
  {
    v10 = v3;
  }
  else
  {
    if (_generateGainMapExposure_once != -1) {
      dispatch_once(&_generateGainMapExposure_once, &__block_literal_global_673);
    }
    v10 = averageLTMFilter(v3);

    id v30 = (id)_generateGainMapExposure_s_synthGainInputKernel;
    uint64_t v11 = *MEMORY[0x1E4F1E480];
    uint64_t v12 = *MEMORY[0x1E4F1E2F8];
    float v13 = 1.0;
    float v14 = 0.0;
    int v15 = -12;
    do
    {
      v16 = (void *)MEMORY[0x1AD0FAA90]();
      *(float *)&double v17 = (float)(v13 + v14) * 0.5;
      [*(id *)(v9 + 3792) numberWithFloat:v17];
      v19 = unint64_t v18 = v9;
      v32[0] = v19;
      v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:v32 count:1];
      v21 = objc_msgSend(v30, "applyWithExtent:arguments:", v20, 0.0, 0.0, 1.0, 1.0);

      [v10 setValue:v21 forKey:v11];
      v22 = [v10 outputImage];

      [v10 setValue:0 forKey:v11];
      [(CIFilter *)v6 setValue:v22 forKey:v11];
      v23 = [(CIFilter *)v6 outputImage];

      [(CIFilter *)v6 setValue:0 forKey:v11];
      memset(v31, 0, sizeof(v31));
      uint64_t v24 = _generateGainMapExposure_ctx;
      uint64_t v25 = [(id)_generateGainMapExposure_ctx workingColorSpace];
      v26 = (void *)v24;
      unint64_t v9 = v18;
      objc_msgSend(v26, "render:toBitmap:rowBytes:bounds:format:colorSpace:", v23, v31, 32, v12, v25, 0.0, 0.0, 1.0, 1.0);
      if (*(float *)v31 < 0.18) {
        float v14 = (float)(v13 + v14) * 0.5;
      }
      else {
        float v13 = (float)(v13 + v14) * 0.5;
      }
    }
    while (!__CFADD__(v15++, 1));
    float v7 = 0.18 / (float)((float)(v13 + v14) * 0.5);
  }
  *(float *)&double v5 = v7;
  v28 = [*(id *)(v9 + 3792) numberWithFloat:v5];

  return v28;
}

- (float)_inverseCurveValueAt:(float)a3 data:(id)a4
{
  id v5 = a4;
  v6 = v5;
  if (v5)
  {
    unint64_t v7 = [v5 length];
    BOOL v8 = (float *)[v6 bytes];
    float v9 = *v8;
    float v10 = 0.0;
    if (*v8 < a3)
    {
      unint64_t v11 = v7 >> 2;
      int v12 = (v7 >> 2) - 1;
      float v13 = v8[v12];
      float v10 = 1.0;
      if (v13 > a3)
      {
        float v14 = 0.0;
        if ((int)v11 >= 3)
        {
          int v15 = 0;
          do
          {
            int v16 = v15 + v12;
            if (v15 + v12 < 0 != __OFADD__(v15, v12)) {
              ++v16;
            }
            int v17 = v16 >> 1;
            if (v8[v17] <= a3) {
              int v15 = v17;
            }
            else {
              int v12 = v17;
            }
          }
          while (v12 - v15 > 1);
          float v9 = v8[v15];
          float v13 = v8[v12];
          float v14 = (float)v15;
        }
        float v10 = (float)((float)((float)((float)v12 / (float)(v11 - 1)) * (float)(a3 - v9))
                    + (float)((float)(v14 / (float)(v11 - 1)) * (float)(v13 - a3)))
            / (float)(v13 - v9);
      }
    }
  }
  else
  {
    float v10 = a3;
  }

  return v10;
}

- (float)inverseAggregatedCurveValueAt:(float)a3
{
  id v5 = [(_NURAWToneCurveProperties *)self aggregateCurveData];
  *(float *)&double v6 = a3;
  [(_NURAWToneCurveProperties *)self _inverseCurveValueAt:v5 data:v6];
  float v8 = v7;

  return v8;
}

- (float)_curveValueAt:(float)result data:(id)a4
{
  float v4 = result;
  if (a4)
  {
    id v5 = a4;
    unint64_t v6 = (unint64_t)[v5 length] >> 2;
    id v7 = v5;
    uint64_t v8 = [v7 bytes];

    float v9 = fminf(fmaxf(v4, 0.0), 1.0) * (float)(v6 - 1);
    signed int v10 = vcvtms_s32_f32(v9);
    signed int v11 = vcvtps_s32_f32(v9);
    float v12 = v9 - floorf(v9);
    return (float)(*(float *)(v8 + 4 * v10) * (float)(1.0 - v12)) + (float)(v12 * *(float *)(v8 + 4 * v11));
  }
  return result;
}

- (float)boostCurveValueAt:(float)a3
{
  id v5 = [(_NURAWToneCurveProperties *)self boostCurveData];
  *(float *)&double v6 = a3;
  [(_NURAWToneCurveProperties *)self _curveValueAt:v5 data:v6];
  float v8 = v7;

  return v8;
}

- (id)_generateCurveDataFromFilters:(id)a3 sampleCount:(unint64_t)a4
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  unint64_t v6 = 4 * a4;
  id v7 = (id) [objc_alloc(MEMORY[0x1E4F1CA58]) initWithLength:4 * a4];
  uint64_t v8 = [v7 mutableBytes];
  if (a4)
  {
    unint64_t v9 = 0;
    float v10 = (float)(a4 - 1);
    int64x2_t v11 = (int64x2_t)xmmword_1A9A72C90;
    uint64x2_t v12 = (uint64x2_t)vdupq_n_s64(a4 - 1);
    int64x2_t v13 = vdupq_n_s64(2uLL);
    do
    {
      int32x2_t v14 = vmovn_s64((int64x2_t)vcgeq_u64(v12, (uint64x2_t)v11));
      if (v14.i8[0]) {
        *(float *)(v8 + 4 * v9) = (float)v9 / v10;
      }
      if (v14.i8[4]) {
        *(float *)(v8 + 4 * v9 + 4) = (float)(v9 + 1) / v10;
      }
      v9 += 2;
      int64x2_t v11 = vaddq_s64(v11, v13);
    }
    while (((a4 + 1) & 0xFFFFFFFFFFFFFFFELL) != v9);
  }
  id v15 = objc_alloc(MEMORY[0x1E4F1E050]);
  double v16 = (double)a4;
  v35 = v7;
  unsigned int v34 = *MEMORY[0x1E4F1E2A8];
  id v17 = (id)objc_msgSend(v15, "initWithBitmapData:bytesPerRow:size:format:colorSpace:", v7, 4 * a4, (double)a4, 1.0);
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  id v18 = v5;
  uint64_t v19 = [v18 countByEnumeratingWithState:&v36 objects:v42 count:16];
  v20 = v17;
  if (v19)
  {
    uint64_t v21 = v19;
    uint64_t v22 = *(void *)v37;
    uint64_t v23 = *MEMORY[0x1E4F1E480];
    v20 = v17;
    do
    {
      uint64_t v24 = 0;
      uint64_t v25 = v20;
      do
      {
        if (*(void *)v37 != v22) {
          objc_enumerationMutation(v18);
        }
        v26 = *(void **)(*((void *)&v36 + 1) + 8 * v24);
        [v26 setValue:v25 forKey:v23];
        v20 = [v26 outputImage];

        [v26 setValue:0 forKey:v23];
        ++v24;
        uint64_t v25 = v20;
      }
      while (v21 != v24);
      uint64_t v21 = [v18 countByEnumeratingWithState:&v36 objects:v42 count:16];
    }
    while (v21);
  }

  v27 = (void *)[objc_alloc(MEMORY[0x1E4F1CA58]) initWithLength:v6];
  v28 = (void *)MEMORY[0x1E4F1E018];
  uint64_t v29 = *MEMORY[0x1E4F1E208];
  v40[0] = *MEMORY[0x1E4F1E1E0];
  v40[1] = v29;
  v41[0] = MEMORY[0x1E4F1CC28];
  v41[1] = @"_NURAWToneCurveProperties";
  id v30 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v41 forKeys:v40 count:2];
  v31 = [v28 contextWithOptions:v30];

  id v32 = v27;
  objc_msgSend(v31, "render:toBitmap:rowBytes:bounds:format:colorSpace:", v20, objc_msgSend(v32, "mutableBytes"), v6, v34, 0, 0.0, 0.0, v16, 1.0);

  return v32;
}

- (id)aggregateCurveData
{
  v21[1] = *MEMORY[0x1E4F143B8];
  v2 = self;
  objc_sync_enter(v2);
  if (!v2->_aggregateCurveData && v2->_rawGainTableMapFilter)
  {
    v3 = +[NUGlobalSettings meteorGainMapExposureCompensationMode];
    float v4 = averageLTMFilter(v2->_rawGainTableMapFilter);
    id v5 = v2->_rawTRCFilter;
    if (v3 && ([v3 isEqualToString:@"default"] & 1) == 0)
    {
      char v8 = [v3 isEqualToString:@"local"];
      if (v4) {
        char v9 = v8;
      }
      else {
        char v9 = 0;
      }
      if (v9) {
        goto LABEL_6;
      }
    }
    else if (v4)
    {
LABEL_6:
      v21[0] = v4;
      unint64_t v6 = v21;
      uint64_t v7 = 1;
      goto LABEL_17;
    }
    int v10 = [v3 isEqualToString:@"total"];
    if (v4) {
      int v11 = v10;
    }
    else {
      int v11 = 0;
    }
    if (v11 != 1 || !v5)
    {
      if (_NULogOnceToken != -1) {
        dispatch_once(&_NULogOnceToken, &__block_literal_global_711);
      }
      int64x2_t v13 = _NULogger;
      if (os_log_type_enabled((os_log_t)_NULogger, OS_LOG_TYPE_ERROR))
      {
        int v18 = 138412290;
        uint64_t v19 = v3;
        _os_log_error_impl(&dword_1A9892000, v13, OS_LOG_TYPE_ERROR, "Unsupported gain map exposure compensation mode: %@", (uint8_t *)&v18, 0xCu);
      }
      uint64x2_t v12 = (void *)MEMORY[0x1E4F1CBF0];
      goto LABEL_23;
    }
    v20[0] = v4;
    v20[1] = v5;
    unint64_t v6 = v20;
    uint64_t v7 = 2;
LABEL_17:
    uint64x2_t v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:v7];
LABEL_23:
    uint64_t v14 = [(_NURAWToneCurveProperties *)v2 _generateCurveDataFromFilters:v12 sampleCount:128];
    aggregateCurveData = v2->_aggregateCurveData;
    v2->_aggregateCurveData = (NSData *)v14;
  }
  objc_sync_exit(v2);

  double v16 = v2->_aggregateCurveData;

  return v16;
}

- (id)localAverageCurveData
{
  v10[1] = *MEMORY[0x1E4F143B8];
  v2 = self;
  objc_sync_enter(v2);
  if (!v2->_localAverageCurveData)
  {
    rawGainTableMapFilter = v2->_rawGainTableMapFilter;
    if (rawGainTableMapFilter)
    {
      float v4 = averageLTMFilter(rawGainTableMapFilter);
      v10[0] = v4;
      id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:1];
      uint64_t v6 = [(_NURAWToneCurveProperties *)v2 _generateCurveDataFromFilters:v5 sampleCount:128];
      localAverageCurveData = v2->_localAverageCurveData;
      v2->_localAverageCurveData = (NSData *)v6;
    }
  }
  objc_sync_exit(v2);

  char v8 = v2->_localAverageCurveData;

  return v8;
}

- (NSData)boostCurveData
{
  v8[1] = *MEMORY[0x1E4F143B8];
  v2 = self;
  objc_sync_enter(v2);
  if (!v2->_boostCurveData && v2->_rawTRCFilter)
  {
    v8[0] = v2->_rawTRCFilter;
    v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:1];
    uint64_t v4 = [(_NURAWToneCurveProperties *)v2 _generateCurveDataFromFilters:v3 sampleCount:11];
    boostCurveData = v2->_boostCurveData;
    v2->_boostCurveData = (NSData *)v4;
  }
  objc_sync_exit(v2);

  uint64_t v6 = v2->_boostCurveData;

  return v6;
}

- (float)baselineExposure
{
  v3 = [(_NURAWToneCurveProperties *)self localAverageCurveData];
  LODWORD(v4) = 1043878380;
  if (v3)
  {
    LODWORD(v4) = 1043878380;
    [(_NURAWToneCurveProperties *)self _inverseCurveValueAt:v3 data:v4];
  }
  float v5 = 0.18 / *(float *)&v4;

  return log2f(v5);
}

- (_NURAWToneCurveProperties)initWithToneCurveFilter:(id)a3 gainMapTableFilter:(id)a4
{
  uint64_t v6 = (CIFilter *)a3;
  uint64_t v7 = (CIFilter *)a4;
  v13.receiver = self;
  v13.super_class = (Class)_NURAWToneCurveProperties;
  char v8 = [(_NURAWToneCurveProperties *)&v13 init];
  rawTRCFilter = v8->_rawTRCFilter;
  v8->_rawTRCFilter = v6;
  int v10 = v6;

  rawGainTableMapFilter = v8->_rawGainTableMapFilter;
  v8->_rawGainTableMapFilter = v7;

  return v8;
}

@end