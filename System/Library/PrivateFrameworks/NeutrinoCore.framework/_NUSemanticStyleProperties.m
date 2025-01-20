@interface _NUSemanticStyleProperties
+ (id)baselineExposureFromLegacyMetadata:(id)a3 error:(id *)a4;
+ (id)globalToneCurveDataFromCaptureMetadata:(id)a3 error:(id *)a4;
+ (id)legacySemanticStylePropertiesFromData:(id)a3 fromVideo:(BOOL)a4 keyTime:(id *)a5 error:(id *)a6;
+ (id)semanticStylePropertiesFromData:(id)a3 fromVideo:(BOOL)a4 keyTime:(id *)a5 error:(id *)a6;
+ (id)semanticStylePropertiesFromImageMetadata:(id)a3 error:(id *)a4;
+ (id)semanticStylePropertiesFromVideoMetadata:(id)a3 keyTime:(id *)a4 error:(id *)a5;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)keyTime;
- (BOOL)isVideo;
- (BOOL)styleDataIsFloat16;
- (NSData)globalToneCurveData;
- (NSData)lightMapData;
- (NSData)linearLightMapData;
- (NSData)styleData;
- (NSDictionary)extendedStats;
- (NSDictionary)stats;
- (NSNumber)baseGain;
- (NSNumber)brightness;
- (NSNumber)faceBasedGlobalExposureBoostRatio;
- (NSNumber)lightMapHeight;
- (NSNumber)lightMapWidth;
- (NSNumber)linearGain;
- (NSNumber)linearRangeMax;
- (NSNumber)linearRangeMin;
- (NSNumber)sceneType;
- (NSNumber)subjectRelightingValue;
- (NSNumber)tuningType;
- (NSString)description;
- (NUVersion)version;
- (double)baselineExposure;
- (id)copyWithZone:(_NSZone *)a3;
- (void)setBaseGain:(id)a3;
- (void)setBaselineExposure:(double)a3;
- (void)setBrightness:(id)a3;
- (void)setExtendedStats:(id)a3;
- (void)setFaceBasedGlobalExposureBoostRatio:(id)a3;
- (void)setGlobalToneCurveData:(id)a3;
- (void)setIsVideo:(BOOL)a3;
- (void)setKeyTime:(id *)a3;
- (void)setLightMapData:(id)a3;
- (void)setLightMapHeight:(id)a3;
- (void)setLightMapWidth:(id)a3;
- (void)setLinearGain:(id)a3;
- (void)setLinearLightMapData:(id)a3;
- (void)setLinearRangeMax:(id)a3;
- (void)setLinearRangeMin:(id)a3;
- (void)setSceneType:(id)a3;
- (void)setStats:(id)a3;
- (void)setStyleData:(id)a3;
- (void)setStyleDataIsFloat16:(BOOL)a3;
- (void)setSubjectRelightingValue:(id)a3;
- (void)setTuningType:(id)a3;
- (void)setVersion:(id)a3;
@end

@implementation _NUSemanticStyleProperties

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_extendedStats, 0);
  objc_storeStrong((id *)&self->_faceBasedGlobalExposureBoostRatio, 0);
  objc_storeStrong((id *)&self->_linearRangeMax, 0);
  objc_storeStrong((id *)&self->_linearRangeMin, 0);
  objc_storeStrong((id *)&self->_linearGain, 0);
  objc_storeStrong((id *)&self->_baseGain, 0);
  objc_storeStrong((id *)&self->_lightMapHeight, 0);
  objc_storeStrong((id *)&self->_lightMapWidth, 0);
  objc_storeStrong((id *)&self->_linearLightMapData, 0);
  objc_storeStrong((id *)&self->_lightMapData, 0);
  objc_storeStrong((id *)&self->_stats, 0);
  objc_storeStrong((id *)&self->_subjectRelightingValue, 0);
  objc_storeStrong((id *)&self->_sceneType, 0);
  objc_storeStrong((id *)&self->_globalToneCurveData, 0);
  objc_storeStrong((id *)&self->_styleData, 0);
  objc_storeStrong((id *)&self->_version, 0);
  objc_storeStrong((id *)&self->_brightness, 0);

  objc_storeStrong((id *)&self->_tuningType, 0);
}

- (void)setExtendedStats:(id)a3
{
}

- (NSDictionary)extendedStats
{
  return self->_extendedStats;
}

- (void)setFaceBasedGlobalExposureBoostRatio:(id)a3
{
}

- (NSNumber)faceBasedGlobalExposureBoostRatio
{
  return self->_faceBasedGlobalExposureBoostRatio;
}

- (void)setLinearRangeMax:(id)a3
{
}

- (NSNumber)linearRangeMax
{
  return self->_linearRangeMax;
}

- (void)setLinearRangeMin:(id)a3
{
}

- (NSNumber)linearRangeMin
{
  return self->_linearRangeMin;
}

- (void)setLinearGain:(id)a3
{
}

- (NSNumber)linearGain
{
  return self->_linearGain;
}

- (void)setBaseGain:(id)a3
{
}

- (NSNumber)baseGain
{
  return self->_baseGain;
}

- (void)setLightMapHeight:(id)a3
{
}

- (NSNumber)lightMapHeight
{
  return self->_lightMapHeight;
}

- (void)setLightMapWidth:(id)a3
{
}

- (NSNumber)lightMapWidth
{
  return self->_lightMapWidth;
}

- (void)setLinearLightMapData:(id)a3
{
}

- (NSData)linearLightMapData
{
  return self->_linearLightMapData;
}

- (void)setLightMapData:(id)a3
{
}

- (NSData)lightMapData
{
  return self->_lightMapData;
}

- (void)setStats:(id)a3
{
}

- (NSDictionary)stats
{
  return self->_stats;
}

- (void)setSubjectRelightingValue:(id)a3
{
}

- (NSNumber)subjectRelightingValue
{
  return self->_subjectRelightingValue;
}

- (void)setSceneType:(id)a3
{
}

- (NSNumber)sceneType
{
  return self->_sceneType;
}

- (void)setBaselineExposure:(double)a3
{
  self->_baselineExposure = a3;
}

- (double)baselineExposure
{
  return self->_baselineExposure;
}

- (void)setGlobalToneCurveData:(id)a3
{
}

- (NSData)globalToneCurveData
{
  return self->_globalToneCurveData;
}

- (void)setKeyTime:(id *)a3
{
  long long v3 = *(_OWORD *)&a3->var0;
  self->_keyTime.epoch = a3->var3;
  *(_OWORD *)&self->_keyTime.value = v3;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)keyTime
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = ($95D729B680665BEAEFA1D6FCA8238556)self[7];
  return self;
}

- (void)setIsVideo:(BOOL)a3
{
  self->_isVideo = a3;
}

- (BOOL)isVideo
{
  return self->_isVideo;
}

- (void)setStyleDataIsFloat16:(BOOL)a3
{
  self->_styleDataIsFloat16 = a3;
}

- (BOOL)styleDataIsFloat16
{
  return self->_styleDataIsFloat16;
}

- (void)setStyleData:(id)a3
{
}

- (NSData)styleData
{
  return self->_styleData;
}

- (void)setVersion:(id)a3
{
}

- (NUVersion)version
{
  return self->_version;
}

- (void)setBrightness:(id)a3
{
}

- (NSNumber)brightness
{
  return self->_brightness;
}

- (void)setTuningType:(id)a3
{
}

- (NSNumber)tuningType
{
  return self->_tuningType;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = +[_NUSemanticStyleProperties allocWithZone:a3];
  v5 = [(_NUSemanticStyleProperties *)self version];
  [(_NUSemanticStyleProperties *)v4 setVersion:v5];

  v6 = [(_NUSemanticStyleProperties *)self styleData];
  [(_NUSemanticStyleProperties *)v4 setStyleData:v6];

  [(_NUSemanticStyleProperties *)v4 setStyleDataIsFloat16:[(_NUSemanticStyleProperties *)self styleDataIsFloat16]];
  [(_NUSemanticStyleProperties *)v4 setIsVideo:[(_NUSemanticStyleProperties *)self isVideo]];
  [(_NUSemanticStyleProperties *)self keyTime];
  long long v22 = v24;
  uint64_t v23 = v25;
  [(_NUSemanticStyleProperties *)v4 setKeyTime:&v22];
  v7 = [(_NUSemanticStyleProperties *)self globalToneCurveData];
  [(_NUSemanticStyleProperties *)v4 setGlobalToneCurveData:v7];

  [(_NUSemanticStyleProperties *)self baselineExposure];
  -[_NUSemanticStyleProperties setBaselineExposure:](v4, "setBaselineExposure:");
  v8 = [(_NUSemanticStyleProperties *)self sceneType];
  [(_NUSemanticStyleProperties *)v4 setSceneType:v8];

  v9 = [(_NUSemanticStyleProperties *)self subjectRelightingValue];
  [(_NUSemanticStyleProperties *)v4 setSubjectRelightingValue:v9];

  v10 = [(_NUSemanticStyleProperties *)self stats];
  [(_NUSemanticStyleProperties *)v4 setStats:v10];

  v11 = [(_NUSemanticStyleProperties *)self lightMapData];
  [(_NUSemanticStyleProperties *)v4 setLightMapData:v11];

  v12 = [(_NUSemanticStyleProperties *)self linearLightMapData];
  [(_NUSemanticStyleProperties *)v4 setLinearLightMapData:v12];

  v13 = [(_NUSemanticStyleProperties *)self lightMapWidth];
  [(_NUSemanticStyleProperties *)v4 setLightMapWidth:v13];

  v14 = [(_NUSemanticStyleProperties *)self lightMapHeight];
  [(_NUSemanticStyleProperties *)v4 setLightMapHeight:v14];

  v15 = [(_NUSemanticStyleProperties *)self baseGain];
  [(_NUSemanticStyleProperties *)v4 setBaseGain:v15];

  v16 = [(_NUSemanticStyleProperties *)self linearGain];
  [(_NUSemanticStyleProperties *)v4 setLinearGain:v16];

  v17 = [(_NUSemanticStyleProperties *)self linearRangeMin];
  [(_NUSemanticStyleProperties *)v4 setLinearRangeMin:v17];

  v18 = [(_NUSemanticStyleProperties *)self linearRangeMax];
  [(_NUSemanticStyleProperties *)v4 setLinearRangeMax:v18];

  v19 = [(_NUSemanticStyleProperties *)self faceBasedGlobalExposureBoostRatio];
  [(_NUSemanticStyleProperties *)v4 setFaceBasedGlobalExposureBoostRatio:v19];

  v20 = [(_NUSemanticStyleProperties *)self extendedStats];
  [(_NUSemanticStyleProperties *)v4 setExtendedStats:v20];

  return v4;
}

- (NSString)description
{
  v33 = NSString;
  uint64_t v32 = objc_opt_class();
  uint64_t v3 = [(_NUSemanticStyleProperties *)self version];
  BOOL v31 = [(_NUSemanticStyleProperties *)self isVideo];
  [(_NUSemanticStyleProperties *)self keyTime];
  if (v40)
  {
    v4 = NSNumber;
    [(_NUSemanticStyleProperties *)self keyTime];
    v36 = [v4 numberWithLongLong:v39];
  }
  else
  {
    v36 = @"-";
  }
  [(_NUSemanticStyleProperties *)self keyTime];
  v34 = (void *)v3;
  if (v38)
  {
    v5 = NSNumber;
    [(_NUSemanticStyleProperties *)self keyTime];
    v35 = [v5 numberWithInt:v37];
  }
  else
  {
    v35 = @"-";
  }
  v30 = [(_NUSemanticStyleProperties *)self styleData];
  uint64_t v27 = [v30 length];
  BOOL v25 = [(_NUSemanticStyleProperties *)self styleDataIsFloat16];
  v29 = [(_NUSemanticStyleProperties *)self globalToneCurveData];
  uint64_t v23 = [v29 length];
  [(_NUSemanticStyleProperties *)self baselineExposure];
  uint64_t v7 = v6;
  long long v22 = [(_NUSemanticStyleProperties *)self sceneType];
  v21 = [(_NUSemanticStyleProperties *)self subjectRelightingValue];
  v19 = [(_NUSemanticStyleProperties *)self baseGain];
  v28 = [(_NUSemanticStyleProperties *)self stats];
  uint64_t v20 = [v28 count];
  v26 = [(_NUSemanticStyleProperties *)self lightMapData];
  uint64_t v18 = [v26 length];
  long long v24 = [(_NUSemanticStyleProperties *)self linearLightMapData];
  uint64_t v8 = [v24 length];
  v17 = [(_NUSemanticStyleProperties *)self lightMapWidth];
  v9 = [(_NUSemanticStyleProperties *)self lightMapHeight];
  v10 = [(_NUSemanticStyleProperties *)self linearGain];
  v11 = [(_NUSemanticStyleProperties *)self linearRangeMin];
  v12 = [(_NUSemanticStyleProperties *)self linearRangeMax];
  v13 = [(_NUSemanticStyleProperties *)self faceBasedGlobalExposureBoostRatio];
  v14 = [(_NUSemanticStyleProperties *)self extendedStats];
  objc_msgSend(v33, "stringWithFormat:", @"<%@:%p version=%@ video=%d key=%@/%@ data:%luB float16:%d GTC:%luB exp:%g scn=%@ srl=%@ gain=%@ stats:%luB lightMap:%luB/%luB(%@x%@) lin:(x%@,%@:%@) fb=%@ xstats=%@>", v32, self, v34, v31, v36, v35, v27, v25, v23, v7, v22, v21, v19, v20, v18, v8,
    v17,
    v9,
    v10,
    v11,
    v12,
    v13,
  v15 = v14);

  if (v38) {
  if (v40)
  }

  return (NSString *)v15;
}

+ (id)legacySemanticStylePropertiesFromData:(id)a3 fromVideo:(BOOL)a4 keyTime:(id *)a5 error:(id *)a6
{
  BOOL v8 = a4;
  uint64_t v95 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  if (!v10)
  {
    v43 = NUAssertLogger_2895();
    if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
    {
      v44 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "data != nil");
      *(_DWORD *)buf = 138543362;
      v92 = v44;
      _os_log_error_impl(&dword_1A9892000, v43, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    v46 = NUAssertLogger_2895();
    BOOL v47 = os_log_type_enabled(v46, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v47)
      {
        v57 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v58 = (void *)MEMORY[0x1E4F29060];
        id v59 = v57;
        v60 = [v58 callStackSymbols];
        v61 = [v60 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v92 = v57;
        __int16 v93 = 2114;
        v94 = v61;
        _os_log_error_impl(&dword_1A9892000, v46, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v47)
    {
      v48 = [MEMORY[0x1E4F29060] callStackSymbols];
      v49 = [v48 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v92 = v49;
      _os_log_error_impl(&dword_1A9892000, v46, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"+[_NUSemanticStyleProperties legacySemanticStylePropertiesFromData:fromVideo:keyTime:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Render/NUImageProperties.m", 899, @"Invalid parameter not satisfying: %s", v62, v63, v64, v65, (uint64_t)"data != nil");
  }
  if (!a6)
  {
    v50 = NUAssertLogger_2895();
    if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
    {
      v51 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "error != NULL");
      *(_DWORD *)buf = 138543362;
      v92 = v51;
      _os_log_error_impl(&dword_1A9892000, v50, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    v52 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    v53 = NUAssertLogger_2895();
    BOOL v54 = os_log_type_enabled(v53, OS_LOG_TYPE_ERROR);
    if (v52)
    {
      if (v54)
      {
        v66 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v67 = (void *)MEMORY[0x1E4F29060];
        id v68 = v66;
        v69 = [v67 callStackSymbols];
        v70 = [v69 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v92 = v66;
        __int16 v93 = 2114;
        v94 = v70;
        _os_log_error_impl(&dword_1A9892000, v53, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v54)
    {
      v55 = [MEMORY[0x1E4F29060] callStackSymbols];
      v56 = [v55 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v92 = v56;
      _os_log_error_impl(&dword_1A9892000, v53, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"+[_NUSemanticStyleProperties legacySemanticStylePropertiesFromData:fromVideo:keyTime:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Render/NUImageProperties.m", 900, @"Invalid parameter not satisfying: %s", v71, v72, v73, v74, (uint64_t)"error != NULL");
  }
  v11 = v10;
  id v90 = 0;
  v12 = [MEMORY[0x1E4F28F98] propertyListWithData:v10 options:0 format:0 error:&v90];
  id v13 = v90;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    +[NUError errorWithCode:1 reason:@"Could not deserialized property list from data" object:v11 underlyingError:v13];
    v17 = 0;
    *a6 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_81;
  }
  v14 = objc_alloc_init(_NUSemanticStyleProperties);
  [(_NUSemanticStyleProperties *)v14 setIsVideo:v8];
  long long v88 = *(_OWORD *)&a5->var0;
  int64_t var3 = a5->var3;
  [(_NUSemanticStyleProperties *)v14 setKeyTime:&v88];
  v15 = [v12 objectForKeyedSubscript:@"smartStyleMetadataVersion"];
  objc_opt_class();
  v84 = v15;
  if (objc_opt_isKindOfClass())
  {
    v16 = +[NUVersion versionWithPackedUInt32:](NUVersion, "versionWithPackedUInt32:", [v15 unsignedIntValue]);
  }
  else
  {
    v16 = 0;
  }
  [(_NUSemanticStyleProperties *)v14 setVersion:v16];
  uint64_t v18 = [v12 objectForKeyedSubscript:@"smartStyleLearnedCoefficients"];
  v19 = v18;
  if (!v16 || v18)
  {
    if (!v16 && v18 && !v8)
    {
      id v87 = v13;
      v17 = [(_NUSemanticStyleProperties *)v18 decompressedDataUsingAlgorithm:1 error:&v87];
      id v20 = v87;

      if (!v17)
      {
        *a6 = +[NUError errorWithCode:1 reason:@"Failed to decompress style data" object:v12 underlyingError:v20];
        id v13 = v20;
        goto LABEL_80;
      }
      v19 = v17;
      id v13 = v20;
    }
    [(_NUSemanticStyleProperties *)v14 setStyleData:v19];
    v21 = [v12 objectForKeyedSubscript:@"smartStyleLearnedCoefficientsUseFloat16"];
    if (v21)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (_NULogOnceToken != -1) {
          dispatch_once(&_NULogOnceToken, &__block_literal_global_684);
        }
        long long v22 = _NULogger;
        if (os_log_type_enabled((os_log_t)_NULogger, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543362;
          v92 = v21;
          _os_log_error_impl(&dword_1A9892000, v22, OS_LOG_TYPE_ERROR, "Invalid use float16 value: %{public}@, ignored", buf, 0xCu);
        }

        v21 = 0;
      }
    }
    -[_NUSemanticStyleProperties setStyleDataIsFloat16:](v14, "setStyleDataIsFloat16:", [v21 BOOLValue]);
    uint64_t v23 = [v12 objectForKeyedSubscript:@"GlobalToneCurveLookUpTable"];
    v83 = v19;
    if (v23)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v82 = v21;
        id v86 = 0;
        [a1 globalToneCurveDataFromCaptureMetadata:v23 error:&v86];
        long long v24 = (void *)v23;
        v17 = (_NUSemanticStyleProperties *)objc_claimAutoreleasedReturnValue();
        id v25 = v86;

        if (v17)
        {
          [(_NUSemanticStyleProperties *)v14 setGlobalToneCurveData:v17];

          uint64_t v23 = (uint64_t)v24;
LABEL_28:
          v81 = (void *)v23;
          id v85 = 0;
          v26 = [a1 baselineExposureFromLegacyMetadata:v12 error:&v85];
          id v13 = v85;

          if (v26)
          {
            [v26 doubleValue];
            -[_NUSemanticStyleProperties setBaselineExposure:](v14, "setBaselineExposure:");
            uint64_t v27 = [v12 objectForKey:@"smartStyleSemanticStyleSceneType"];
            if (v27)
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0)
              {
                if (_NULogOnceToken != -1) {
                  dispatch_once(&_NULogOnceToken, &__block_literal_global_684);
                }
                v28 = _NULogger;
                if (os_log_type_enabled((os_log_t)_NULogger, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 138543362;
                  v92 = v27;
                  _os_log_error_impl(&dword_1A9892000, v28, OS_LOG_TYPE_ERROR, "Invalid scene type: %{public}@, ignored", buf, 0xCu);
                }

                uint64_t v27 = 0;
              }
            }
            [(_NUSemanticStyleProperties *)v14 setSceneType:v27];
            v29 = [v12 objectForKey:@"smartStyleSRLCoefficient"];
            if (v29)
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0)
              {
                if (_NULogOnceToken != -1) {
                  dispatch_once(&_NULogOnceToken, &__block_literal_global_684);
                }
                v30 = _NULogger;
                if (os_log_type_enabled((os_log_t)_NULogger, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 138543362;
                  v92 = v29;
                  _os_log_error_impl(&dword_1A9892000, v30, OS_LOG_TYPE_ERROR, "Invalid Style SRL Curve Parameter: %{public}@, ignored", buf, 0xCu);
                }

                v29 = 0;
              }
            }
            [(_NUSemanticStyleProperties *)v14 setSubjectRelightingValue:v29];
            BOOL v31 = [v12 objectForKey:@"smartStyleImageStatistics"];
            if (v31)
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0)
              {
                if (_NULogOnceToken != -1) {
                  dispatch_once(&_NULogOnceToken, &__block_literal_global_684);
                }
                uint64_t v32 = _NULogger;
                if (os_log_type_enabled((os_log_t)_NULogger, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 138543362;
                  v92 = v31;
                  _os_log_error_impl(&dword_1A9892000, v32, OS_LOG_TYPE_ERROR, "Invalid Style Stats: %{public}@, ignored", buf, 0xCu);
                }

                BOOL v31 = 0;
              }
            }
            [(_NUSemanticStyleProperties *)v14 setStats:v31];
            uint64_t v33 = [v12 objectForKey:@"smallLightMapData"];
            v78 = v31;
            if (v33)
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0)
              {
                v75 = (void *)v33;
                if (_NULogOnceToken != -1) {
                  dispatch_once(&_NULogOnceToken, &__block_literal_global_684);
                }
                v34 = _NULogger;
                if (os_log_type_enabled((os_log_t)_NULogger, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 138543362;
                  v92 = v75;
                  _os_log_error_impl(&dword_1A9892000, v34, OS_LOG_TYPE_ERROR, "Invalid Style Lightmap: %{public}@, ignored", buf, 0xCu);
                }

                uint64_t v33 = 0;
              }
            }
            [(_NUSemanticStyleProperties *)v14 setLightMapData:v33];
            v35 = [v12 objectForKey:@"smallLinearLightMapData"];
            v79 = v29;
            v80 = v27;
            v77 = v26;
            if (v35)
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0)
              {
                uint64_t v76 = v33;
                if (_NULogOnceToken != -1) {
                  dispatch_once(&_NULogOnceToken, &__block_literal_global_684);
                }
                v36 = _NULogger;
                if (os_log_type_enabled((os_log_t)_NULogger, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 138543362;
                  v92 = v35;
                  _os_log_error_impl(&dword_1A9892000, v36, OS_LOG_TYPE_ERROR, "Invalid Style Linear Lightmap: %{public}@, ignored", buf, 0xCu);
                }

                v35 = 0;
                uint64_t v33 = v76;
              }
            }
            [(_NUSemanticStyleProperties *)v14 setLinearLightMapData:v35];
            unsigned int v37 = [v12 objectForKey:@"smallLightMapWidth"];
            char v38 = [v12 objectForKey:@"smallLightMapHeight"];
            if (v37 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)
              || v38 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
            {
              char v40 = (void *)v33;
              if (_NULogOnceToken != -1) {
                dispatch_once(&_NULogOnceToken, &__block_literal_global_684);
              }
              v41 = _NULogger;
              if (os_log_type_enabled((os_log_t)_NULogger, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138543618;
                v92 = v37;
                __int16 v93 = 2114;
                v94 = v38;
                _os_log_error_impl(&dword_1A9892000, v41, OS_LOG_TYPE_ERROR, "Invalid Style Lightmap Dimensions: %{public}@, %{public}@, ignored", buf, 0x16u);
              }

              uint64_t v39 = 0;
              v35 = 0;
              unsigned int v37 = 0;
              char v38 = 0;
            }
            else
            {
              uint64_t v39 = (void *)v33;
            }
            [(_NUSemanticStyleProperties *)v14 setLightMapWidth:v37];
            [(_NUSemanticStyleProperties *)v14 setLightMapHeight:v38];
            v17 = v14;

            v21 = v82;
            v26 = v77;
          }
          else
          {
            +[NUError errorWithCode:1 reason:@"Failed to get baseline exposure value" object:v12 underlyingError:v13];
            v17 = 0;
            *a6 = (id)objc_claimAutoreleasedReturnValue();
            v21 = v82;
          }

          long long v24 = v81;
          goto LABEL_79;
        }
        *a6 = +[NUError errorWithCode:1 reason:@"Failed to read GTC data" object:v24 underlyingError:v25];
        id v13 = v25;
        v21 = v82;
      }
      else
      {
        +[NUError errorWithCode:1 reason:@"Invalid GTC data" object:v23 underlyingError:v13];
        long long v24 = (void *)v23;
        v17 = 0;
        *a6 = (id)objc_claimAutoreleasedReturnValue();
      }
LABEL_79:

      goto LABEL_80;
    }
    v82 = v21;
    id v25 = v13;
    goto LABEL_28;
  }
  +[NUError missingError:@"Missing style data" object:v12];
  v17 = 0;
  *a6 = (id)objc_claimAutoreleasedReturnValue();
LABEL_80:

LABEL_81:

  return v17;
}

+ (id)baselineExposureFromLegacyMetadata:(id)a3 error:(id *)a4
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (!v5)
  {
    uint64_t v27 = NUAssertLogger_2895();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      v28 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "metadata != nil");
      *(_DWORD *)buf = 138543362;
      v44 = v28;
      _os_log_error_impl(&dword_1A9892000, v27, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    v30 = NUAssertLogger_2895();
    BOOL v31 = os_log_type_enabled(v30, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v31)
      {
        v34 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v35 = (void *)MEMORY[0x1E4F29060];
        id v36 = v34;
        unsigned int v37 = [v35 callStackSymbols];
        char v38 = [v37 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v44 = v34;
        __int16 v45 = 2114;
        v46 = v38;
        _os_log_error_impl(&dword_1A9892000, v30, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v31)
    {
      uint64_t v32 = [MEMORY[0x1E4F29060] callStackSymbols];
      uint64_t v33 = [v32 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v44 = v33;
      _os_log_error_impl(&dword_1A9892000, v30, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"+[_NUSemanticStyleProperties baselineExposureFromLegacyMetadata:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Render/NUImageProperties.m", 837, @"Invalid parameter not satisfying: %s", v39, v40, v41, v42, (uint64_t)"metadata != nil");
  }
  uint64_t v6 = v5;
  uint64_t v7 = [v5 objectForKeyedSubscript:@"smartStyleBaselineExposure"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if (v7) {
      goto LABEL_28;
    }
  }
  else
  {
    if (_NULogOnceToken != -1) {
      dispatch_once(&_NULogOnceToken, &__block_literal_global_684);
    }
    BOOL v8 = _NULogger;
    if (os_log_type_enabled((os_log_t)_NULogger, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v44 = v7;
      _os_log_error_impl(&dword_1A9892000, v8, OS_LOG_TYPE_ERROR, "Invalid baseline exposure value: %{public}@, ignored", buf, 0xCu);
    }
  }
  v9 = [v6 objectForKeyedSubscript:@"ispDGain"];
  if (v9)
  {
    id v10 = [v6 objectForKeyedSubscript:@"ispDGainRangeExpansionFactor"];
    if (!v10)
    {
      +[NUError missingError:@"Missing metadata property" object:@"ispDGain"];
      uint64_t v7 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
LABEL_26:

      goto LABEL_27;
    }
    [v9 doubleValue];
    double v12 = v11;
    [v10 doubleValue];
    double v14 = v13;
    v15 = [v6 objectForKeyedSubscript:@"AverageLTM"];
    v16 = v15;
    double v17 = 1.0;
    if (v15)
    {
      uint64_t v18 = objc_msgSend(v15, "count", 1.0);
      uint64_t v7 = (void *)v18;
      if (!v18)
      {
        *a4 = +[NUError invalidError:@"Invalid metadata property" object:@"AverageLTM"];
LABEL_25:

        goto LABEL_26;
      }
      if (v18 == 1)
      {
        double v19 = 1.0;
        double v20 = 0.0;
      }
      else
      {
        double v20 = (double)(unint64_t)(v18 - 1);
        double v19 = 1.0;
        unint64_t v21 = 1;
        do
        {
          long long v22 = [v16 objectAtIndexedSubscript:v21];
          [v22 doubleValue];
          double v24 = v23 / 65535.0;

          double v19 = v19 * (v24 / ((double)v21++ / v20));
        }
        while (v7 != (void *)v21);
      }
      double v17 = pow(v19, 1.0 / v20);
    }
    double v25 = v12 / (v14 * 256.0) * v17 * 1.41;
    if (v25 < 1.0) {
      double v25 = 1.0;
    }
    uint64_t v7 = [NSNumber numberWithDouble:v25];
    goto LABEL_25;
  }
  +[NUError missingError:@"Missing metadata property" object:@"ispDGain"];
  uint64_t v7 = 0;
  *a4 = (id)objc_claimAutoreleasedReturnValue();
LABEL_27:

LABEL_28:

  return v7;
}

+ (id)globalToneCurveDataFromCaptureMetadata:(id)a3 error:(id *)a4
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (!v5)
  {
    double v20 = NUAssertLogger_2895();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      unint64_t v21 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "gtcData != nil");
      *(_DWORD *)buf = 138543362;
      unsigned int v37 = v21;
      _os_log_error_impl(&dword_1A9892000, v20, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    double v23 = NUAssertLogger_2895();
    BOOL v24 = os_log_type_enabled(v23, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v24)
      {
        uint64_t v27 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v28 = (void *)MEMORY[0x1E4F29060];
        id v29 = v27;
        v30 = [v28 callStackSymbols];
        BOOL v31 = [v30 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        unsigned int v37 = v27;
        __int16 v38 = 2114;
        uint64_t v39 = v31;
        _os_log_error_impl(&dword_1A9892000, v23, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v24)
    {
      double v25 = [MEMORY[0x1E4F29060] callStackSymbols];
      v26 = [v25 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      unsigned int v37 = v26;
      _os_log_error_impl(&dword_1A9892000, v23, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"+[_NUSemanticStyleProperties globalToneCurveDataFromCaptureMetadata:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Render/NUImageProperties.m", 806, @"Invalid parameter not satisfying: %s", v32, v33, v34, v35, (uint64_t)"gtcData != nil");
  }
  uint64_t v6 = v5;
  if ((unint64_t)[v5 length] < 2)
  {
    uint64_t v7 = @"Invalid GTC metadata size";
LABEL_6:
    +[NUError invalidError:v7 object:v6];
    id v9 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_7;
  }
  BOOL v8 = (_WORD *)[v6 bytes];
  if ((unsigned __int16)*v8 - 1 > 0x100)
  {
    uint64_t v7 = @"Invalid GTC metadata count";
    goto LABEL_6;
  }
  double v11 = v8;
  uint64_t v12 = (unsigned __int16)(*v8 - 1);
  int v13 = (unsigned __int16)(*v8 - 1);
  id v9 = (id) [objc_alloc(MEMORY[0x1E4F1CA58]) initWithLength:4 * v12];
  uint64_t v14 = [v9 mutableBytes];
  if (v13)
  {
    v15 = (float *)v14;
    v16 = v11 + 1;
    do
    {
      unsigned int v17 = *v16++;
      float v18 = (float)v17 / 65535.0;
      if (v18 <= 0.04045) {
        float v19 = v18 / 12.92;
      }
      else {
        float v19 = powf((float)(v18 + 0.055) / 1.055, 2.4);
      }
      *v15++ = v19;
      --v12;
    }
    while (v12);
  }
LABEL_7:

  return v9;
}

+ (id)semanticStylePropertiesFromVideoMetadata:(id)a3 keyTime:(id *)a4 error:(id *)a5
{
  $3CC8671D27C23BF42ADDB32F2B5E48AE v7 = *a4;
  id v5 = [a1 semanticStylePropertiesFromData:a3 fromVideo:1 keyTime:&v7 error:a5];

  return v5;
}

+ (id)semanticStylePropertiesFromImageMetadata:(id)a3 error:(id *)a4
{
  long long v6 = *MEMORY[0x1E4F1F9F8];
  uint64_t v7 = *(void *)(MEMORY[0x1E4F1F9F8] + 16);
  v4 = [a1 semanticStylePropertiesFromData:a3 fromVideo:0 keyTime:&v6 error:a4];

  return v4;
}

+ (id)semanticStylePropertiesFromData:(id)a3 fromVideo:(BOOL)a4 keyTime:(id *)a5 error:(id *)a6
{
  BOOL v8 = a4;
  uint64_t v112 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  if (!v10)
  {
    v57 = NUAssertLogger_2895();
    if (os_log_type_enabled(v57, OS_LOG_TYPE_ERROR))
    {
      v58 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "data != nil");
      *(_DWORD *)buf = 138543362;
      *(void *)&uint8_t buf[4] = v58;
      _os_log_error_impl(&dword_1A9892000, v57, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    v60 = NUAssertLogger_2895();
    BOOL v61 = os_log_type_enabled(v60, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v61)
      {
        uint64_t v71 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        uint64_t v72 = (void *)MEMORY[0x1E4F29060];
        id v73 = v71;
        uint64_t v74 = [v72 callStackSymbols];
        v75 = [v74 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        *(void *)&uint8_t buf[4] = v71;
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v75;
        _os_log_error_impl(&dword_1A9892000, v60, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v61)
    {
      uint64_t v62 = [MEMORY[0x1E4F29060] callStackSymbols];
      uint64_t v63 = [v62 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      *(void *)&uint8_t buf[4] = v63;
      _os_log_error_impl(&dword_1A9892000, v60, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"+[_NUSemanticStyleProperties semanticStylePropertiesFromData:fromVideo:keyTime:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Render/NUImageProperties.m", 630, @"Invalid parameter not satisfying: %s", v76, v77, v78, v79, (uint64_t)"data != nil");
  }
  if (!a6)
  {
    uint64_t v64 = NUAssertLogger_2895();
    if (os_log_type_enabled(v64, OS_LOG_TYPE_ERROR))
    {
      uint64_t v65 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "error != NULL");
      *(_DWORD *)buf = 138543362;
      *(void *)&uint8_t buf[4] = v65;
      _os_log_error_impl(&dword_1A9892000, v64, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    v66 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    v67 = NUAssertLogger_2895();
    BOOL v68 = os_log_type_enabled(v67, OS_LOG_TYPE_ERROR);
    if (v66)
    {
      if (v68)
      {
        v80 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v81 = (void *)MEMORY[0x1E4F29060];
        id v82 = v80;
        v83 = [v81 callStackSymbols];
        v84 = [v83 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        *(void *)&uint8_t buf[4] = v80;
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v84;
        _os_log_error_impl(&dword_1A9892000, v67, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v68)
    {
      v69 = [MEMORY[0x1E4F29060] callStackSymbols];
      v70 = [v69 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      *(void *)&uint8_t buf[4] = v70;
      _os_log_error_impl(&dword_1A9892000, v67, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"+[_NUSemanticStyleProperties semanticStylePropertiesFromData:fromVideo:keyTime:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Render/NUImageProperties.m", 631, @"Invalid parameter not satisfying: %s", v85, v86, v87, v88, (uint64_t)"error != NULL");
  }
  double v11 = v10;
  id v109 = 0;
  uint64_t v12 = [MEMORY[0x1E4F28F98] propertyListWithData:v10 options:0 format:0 error:&v109];
  id v13 = v109;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    +[NUError errorWithCode:1 reason:@"Could not deserialized property list from data" object:v11 underlyingError:v13];
    double v20 = 0;
    *a6 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_128;
  }
  uint64_t v14 = [v12 objectForKeyedSubscript:@"0"];

  if (!v14)
  {
    *(_OWORD *)buf = *(_OWORD *)&a5->var0;
    *(void *)&buf[16] = a5->var3;
    double v20 = [a1 legacySemanticStylePropertiesFromData:v11 fromVideo:v8 keyTime:buf error:a6];
    goto LABEL_128;
  }
  id v15 = v13;
  v16 = objc_alloc_init(_NUSemanticStyleProperties);
  [(_NUSemanticStyleProperties *)v16 setIsVideo:v8];
  long long v107 = *(_OWORD *)&a5->var0;
  int64_t var3 = a5->var3;
  [(_NUSemanticStyleProperties *)v16 setKeyTime:&v107];
  unsigned int v17 = [v12 objectForKeyedSubscript:@"0"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v98 = v17;
    v100 = +[NUVersion versionWithPackedUInt32:](NUVersion, "versionWithPackedUInt32:", [v17 unsignedIntValue]);
    -[_NUSemanticStyleProperties setVersion:](v16, "setVersion:");
    v99 = [v12 objectForKeyedSubscript:@"1"];
    -[_NUSemanticStyleProperties setStyleData:](v16, "setStyleData:");
    v105 = [v12 objectForKeyedSubscript:@"2"];
    v103 = v15;
    if (v105)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        goto LABEL_14;
      }
      if (_NULogOnceToken != -1) {
        dispatch_once(&_NULogOnceToken, &__block_literal_global_684);
      }
      float v18 = (id)_NULogger;
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        *(void *)&uint8_t buf[4] = v105;
        _os_log_error_impl(&dword_1A9892000, v18, OS_LOG_TYPE_ERROR, "Invalid use float16 value: %{public}@, ignored", buf, 0xCu);
      }
    }
    v105 = 0;
LABEL_14:
    -[_NUSemanticStyleProperties setStyleDataIsFloat16:](v16, "setStyleDataIsFloat16:", [v105 BOOLValue]);
    float v19 = [v12 objectForKeyedSubscript:@"3"];
    if (v19)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v106 = 0;
        double v20 = [a1 globalToneCurveDataFromCaptureMetadata:v19 error:&v106];
        id v15 = v106;

        if (v20)
        {
          v89 = v19;
          [(_NUSemanticStyleProperties *)v16 setGlobalToneCurveData:v20];

          v103 = v15;
LABEL_22:
          unint64_t v21 = [v12 objectForKeyedSubscript:@"4"];
          if (v21)
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              if (_NULogOnceToken != -1) {
                dispatch_once(&_NULogOnceToken, &__block_literal_global_684);
              }
              long long v22 = (id)_NULogger;
              if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138543362;
                *(void *)&uint8_t buf[4] = v21;
                _os_log_error_impl(&dword_1A9892000, v22, OS_LOG_TYPE_ERROR, "Invalid baselineExposure value: %{public}@, ignored.", buf, 0xCu);
              }

              unint64_t v21 = 0;
            }
          }
          [v21 doubleValue];
          -[_NUSemanticStyleProperties setBaselineExposure:](v16, "setBaselineExposure:");
          uint64_t v23 = [v12 objectForKey:@"5"];
          if (v23)
          {
            BOOL v24 = (void *)v23;
            objc_opt_class();
            double v25 = v24;
            if (objc_opt_isKindOfClass())
            {
              v26 = v24;
              goto LABEL_39;
            }
            if (_NULogOnceToken != -1) {
              dispatch_once(&_NULogOnceToken, &__block_literal_global_684);
            }
            v28 = (id)_NULogger;
            if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138543362;
              *(void *)&uint8_t buf[4] = v25;
              _os_log_error_impl(&dword_1A9892000, v28, OS_LOG_TYPE_ERROR, "Invalid scene type: %{public}@, ignored", buf, 0xCu);
            }
          }
          v26 = 0;
LABEL_39:
          v96 = v26;
          -[_NUSemanticStyleProperties setSceneType:](v16, "setSceneType:");
          if (v8) {
            id v29 = &unk_1F0049CC8;
          }
          else {
            id v29 = &unk_1F0049CE0;
          }
          [(_NUSemanticStyleProperties *)v16 setTuningType:v29];
          v30 = [v12 objectForKey:@"b"];
          if (v30)
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              if (_NULogOnceToken != -1) {
                dispatch_once(&_NULogOnceToken, &__block_literal_global_684);
              }
              BOOL v31 = (id)_NULogger;
              if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138543362;
                *(void *)&uint8_t buf[4] = v30;
                _os_log_error_impl(&dword_1A9892000, v31, OS_LOG_TYPE_ERROR, "Invalid Style SRL Curve Parameter: %{public}@, ignored", buf, 0xCu);
              }

              v30 = 0;
            }
          }
          [(_NUSemanticStyleProperties *)v16 setSubjectRelightingValue:v30];
          uint64_t v32 = [v12 objectForKey:@"6"];
          if (v32)
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              if (_NULogOnceToken != -1) {
                dispatch_once(&_NULogOnceToken, &__block_literal_global_684);
              }
              uint64_t v33 = (id)_NULogger;
              if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138543362;
                *(void *)&uint8_t buf[4] = v32;
                _os_log_error_impl(&dword_1A9892000, v33, OS_LOG_TYPE_ERROR, "Invalid Style Stats: %{public}@, ignored", buf, 0xCu);
              }

              uint64_t v32 = 0;
            }
          }
          [(_NUSemanticStyleProperties *)v16 setStats:v32];
          uint64_t v34 = [v12 objectForKey:@"c"];
          v97 = v21;
          __int16 v93 = v30;
          if (v34)
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              uint64_t v35 = (void *)v34;
              if (_NULogOnceToken != -1) {
                dispatch_once(&_NULogOnceToken, &__block_literal_global_684);
              }
              id v36 = (id)_NULogger;
              if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138543362;
                *(void *)&uint8_t buf[4] = v35;
                _os_log_error_impl(&dword_1A9892000, v36, OS_LOG_TYPE_ERROR, "Invalid Style Lightmap: %{public}@, ignored", buf, 0xCu);
              }

              uint64_t v34 = 0;
            }
          }
          [(_NUSemanticStyleProperties *)v16 setLightMapData:v34];
          v104 = [v12 objectForKey:@"d"];
          if (v104)
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              uint64_t v37 = v34;
              if (_NULogOnceToken != -1) {
                dispatch_once(&_NULogOnceToken, &__block_literal_global_684);
              }
              __int16 v38 = (id)_NULogger;
              if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138543362;
                *(void *)&uint8_t buf[4] = v104;
                _os_log_error_impl(&dword_1A9892000, v38, OS_LOG_TYPE_ERROR, "Invalid Style Linear Lightmap: %{public}@, ignored", buf, 0xCu);
              }

              v104 = 0;
              uint64_t v34 = v37;
              [(_NUSemanticStyleProperties *)v16 setLinearLightMapData:0];
LABEL_72:
              uint64_t v39 = [v12 objectForKey:@"e"];
              v101 = [v12 objectForKey:@"f"];
              if (!v39 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
              {
                if (!v101)
                {
                  uint64_t v40 = 0;
LABEL_83:
                  v92 = v39;
                  [(_NUSemanticStyleProperties *)v16 setLightMapWidth:v39];
                  v102 = v40;
                  [(_NUSemanticStyleProperties *)v16 setLightMapHeight:v40];
                  v43 = [v12 objectForKey:@"h"];
                  uint64_t v95 = v32;
                  if (v43)
                  {
                    objc_opt_class();
                    if ((objc_opt_isKindOfClass() & 1) == 0)
                    {
                      uint64_t v44 = v34;
                      if (_NULogOnceToken != -1) {
                        dispatch_once(&_NULogOnceToken, &__block_literal_global_684);
                      }
                      __int16 v45 = (id)_NULogger;
                      if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
                      {
                        *(_DWORD *)buf = 138543362;
                        *(void *)&uint8_t buf[4] = v43;
                        _os_log_error_impl(&dword_1A9892000, v45, OS_LOG_TYPE_ERROR, "Invalid Style baseGain Parameter: %{public}@, ignored", buf, 0xCu);
                      }

                      v43 = 0;
                      uint64_t v34 = v44;
                    }
                  }
                  [(_NUSemanticStyleProperties *)v16 setBaseGain:v43];
                  v46 = [v12 objectForKey:@"i"];
                  v94 = (void *)v34;
                  if (v46)
                  {
                    objc_opt_class();
                    if ((objc_opt_isKindOfClass() & 1) == 0)
                    {
                      if (_NULogOnceToken != -1) {
                        dispatch_once(&_NULogOnceToken, &__block_literal_global_684);
                      }
                      uint64_t v47 = (id)_NULogger;
                      if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
                      {
                        *(_DWORD *)buf = 138543362;
                        *(void *)&uint8_t buf[4] = v46;
                        _os_log_error_impl(&dword_1A9892000, v47, OS_LOG_TYPE_ERROR, "Invalid Style Linear Encoding Parameters: %{public}@, ignored", buf, 0xCu);
                      }

                      v46 = 0;
                    }
                  }
                  v48 = [v46 objectForKey:@"Gain"];
                  v49 = [v46 objectForKey:@"OriginalRangeMin"];
                  v50 = [v46 objectForKey:@"OriginalRangeMax"];
                  v91 = v43;
                  if (v48 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)
                    || v49 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)
                    || v50 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
                  {
                    if (_NULogOnceToken != -1) {
                      dispatch_once(&_NULogOnceToken, &__block_literal_global_684);
                    }
                    v51 = (id)_NULogger;
                    if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
                    {
                      *(_DWORD *)buf = 138543874;
                      *(void *)&uint8_t buf[4] = v48;
                      *(_WORD *)&buf[12] = 2114;
                      *(void *)&buf[14] = v49;
                      *(_WORD *)&buf[22] = 2114;
                      v111 = v50;
                      _os_log_error_impl(&dword_1A9892000, v51, OS_LOG_TYPE_ERROR, "Invalid Style Linear Encoding Parameters: %{public}@, %{public}@, %{public}@, ignored", buf, 0x20u);
                    }

                    v48 = 0;
                    v49 = 0;
                    v50 = 0;
                  }
                  [(_NUSemanticStyleProperties *)v16 setLinearGain:v48];
                  [(_NUSemanticStyleProperties *)v16 setLinearRangeMin:v49];
                  id v90 = v50;
                  [(_NUSemanticStyleProperties *)v16 setLinearRangeMax:v50];
                  v52 = [v12 objectForKey:@"j"];
                  if (v52)
                  {
                    objc_opt_class();
                    if ((objc_opt_isKindOfClass() & 1) == 0)
                    {
                      if (_NULogOnceToken != -1) {
                        dispatch_once(&_NULogOnceToken, &__block_literal_global_684);
                      }
                      v53 = (id)_NULogger;
                      if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
                      {
                        *(_DWORD *)buf = 138543362;
                        *(void *)&uint8_t buf[4] = v52;
                        _os_log_error_impl(&dword_1A9892000, v53, OS_LOG_TYPE_ERROR, "Invalid Style Face Based Global Exposure Boost Ratio: %{public}@, ignored", buf, 0xCu);
                      }

                      v52 = 0;
                    }
                  }
                  [(_NUSemanticStyleProperties *)v16 setFaceBasedGlobalExposureBoostRatio:v52];
                  BOOL v54 = [v12 objectForKey:@"7"];
                  if (v54 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
                  {
                    if (_NULogOnceToken != -1) {
                      dispatch_once(&_NULogOnceToken, &__block_literal_global_684);
                    }
                    v55 = (id)_NULogger;
                    if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR))
                    {
                      *(_DWORD *)buf = 138543362;
                      *(void *)&uint8_t buf[4] = v54;
                      _os_log_error_impl(&dword_1A9892000, v55, OS_LOG_TYPE_ERROR, "Invalid Extended Style Stats: %{public}@, ignored", buf, 0xCu);
                    }
                    id v15 = v103;

                    BOOL v54 = 0;
                  }
                  else
                  {
                    id v15 = v103;
                  }
                  [(_NUSemanticStyleProperties *)v16 setExtendedStats:v54];
                  double v20 = v16;

                  unsigned int v17 = v98;
                  float v19 = v89;
                  goto LABEL_126;
                }
                objc_opt_class();
                if (objc_opt_isKindOfClass())
                {
                  uint64_t v40 = v101;
                  goto LABEL_83;
                }
              }
              uint64_t v41 = (void *)v34;
              if (_NULogOnceToken != -1) {
                dispatch_once(&_NULogOnceToken, &__block_literal_global_684);
              }
              uint64_t v42 = (id)_NULogger;
              if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138543618;
                *(void *)&uint8_t buf[4] = v39;
                *(_WORD *)&buf[12] = 2114;
                *(void *)&buf[14] = v101;
                _os_log_error_impl(&dword_1A9892000, v42, OS_LOG_TYPE_ERROR, "Invalid Style Lightmap Dimensions: %{public}@, %{public}@, ignored", buf, 0x16u);
              }

              uint64_t v34 = 0;
              v104 = 0;
              uint64_t v39 = 0;
              uint64_t v40 = 0;
              goto LABEL_83;
            }
          }
          else
          {
            v104 = 0;
          }
          [(_NUSemanticStyleProperties *)v16 setLinearLightMapData:v104];
          goto LABEL_72;
        }
        id v27 = +[NUError errorWithCode:1 reason:@"Failed to read GTC data" object:v19 underlyingError:v15];
      }
      else
      {
        +[NUError errorWithCode:reason:object:underlyingError:](NUError, "errorWithCode:reason:object:underlyingError:", 1, @"Invalid GTC data", v19);
        id v27 = (id)objc_claimAutoreleasedReturnValue();
        double v20 = 0;
      }
      *a6 = v27;
LABEL_126:

      goto LABEL_127;
    }
    v89 = 0;
    goto LABEL_22;
  }
  +[NUError missingError:@"Invalid style version" object:v12];
  double v20 = 0;
  *a6 = (id)objc_claimAutoreleasedReturnValue();
LABEL_127:

  id v13 = v15;
LABEL_128:

  return v20;
}

@end