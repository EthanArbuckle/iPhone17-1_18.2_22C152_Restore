@interface PISemanticStyleRenderNode
- (BOOL)requiresVideoComposition;
- (BOOL)shouldCacheNodeForPipelineState:(id)a3;
- (NURenderNode)input;
- (PISemanticStyleRenderNode)initWithInput:(id)a3 settings:(id)a4;
- (PISemanticStyleRenderNode)initWithSettings:(id)a3 inputs:(id)a4;
- (id)_evaluateImage:(id *)a3;
- (id)_evaluateImageGeometry:(id *)a3;
- (id)_evaluateVideo:(id *)a3;
- (id)_evaluateVideoComposition:(id *)a3;
- (id)nodeByReplayingAgainstCache:(id)a3 pipelineState:(id)a4 error:(id *)a5;
- (id)resolvedNodeWithCachedInputs:(id)a3 settings:(id)a4 pipelineState:(id)a5 error:(id *)a6;
@end

@implementation PISemanticStyleRenderNode

- (id)_evaluateImage:(id *)a3
{
  uint64_t v141 = *MEMORY[0x1E4F143B8];
  v135 = [(NURenderNode *)self inputForKey:*MEMORY[0x1E4F1E480]];
  v5 = [v135 outputImage:a3];
  if (v5)
  {
    v6 = [(NURenderNode *)self inputForKey:@"subjectMatte"];
    id v139 = 0;
    v7 = [v6 outputImage:&v139];
    id v8 = v139;
    if (!v7)
    {
      if (*MEMORY[0x1E4F7A750] != -1) {
        dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_267_9815);
      }
      v9 = *MEMORY[0x1E4F7A758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F7A758], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138543362;
        *(void *)&buf[4] = v8;
        _os_log_impl(&dword_1A9680000, v9, OS_LOG_TYPE_INFO, "Failed to obtain matte image: %{public}@", buf, 0xCu);
      }
      v10 = (void *)MEMORY[0x1E4F1E050];
      v11 = [MEMORY[0x1E4F1E008] blackColor];
      v12 = [v10 imageWithColor:v11];
      [v5 extent];
      v7 = objc_msgSend(v12, "imageByCroppingToRect:");
    }
    v13 = [(NURenderNode *)self inputForKey:@"skinMatte"];
    id v138 = 0;
    uint64_t v14 = [v13 outputImage:&v138];
    id v15 = v138;

    v133 = (void *)v14;
    if (!v14)
    {
      if (*MEMORY[0x1E4F7A750] != -1) {
        dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_267_9815);
      }
      v16 = *MEMORY[0x1E4F7A758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F7A758], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138543362;
        *(void *)&buf[4] = v15;
        _os_log_impl(&dword_1A9680000, v16, OS_LOG_TYPE_INFO, "Failed to obtain matte image: %{public}@", buf, 0xCu);
      }
      v17 = (void *)MEMORY[0x1E4F1E050];
      v18 = [MEMORY[0x1E4F1E008] blackColor];
      v19 = [v17 imageWithColor:v18];
      [v5 extent];
      v133 = objc_msgSend(v19, "imageByCroppingToRect:");
    }
    [(NURenderNode *)self inputForKey:@"skyMatte"];
    v132 = id v137 = 0;
    v20 = [v132 outputImage:&v137];
    id v21 = v137;

    if (!v20)
    {
      if (*MEMORY[0x1E4F7A750] != -1) {
        dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_267_9815);
      }
      v22 = *MEMORY[0x1E4F7A758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F7A758], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138543362;
        *(void *)&buf[4] = v21;
        _os_log_impl(&dword_1A9680000, v22, OS_LOG_TYPE_INFO, "Failed to obtain matte image: %{public}@", buf, 0xCu);
      }
      v23 = (void *)MEMORY[0x1E4F1E050];
      v24 = [MEMORY[0x1E4F1E008] blackColor];
      v25 = [v23 imageWithColor:v24];
      [v5 extent];
      v20 = objc_msgSend(v25, "imageByCroppingToRect:");
    }
    v134 = v5;
    v26 = [(NURenderNode *)self inputForKey:@"linearThumbnail"];
    id v136 = 0;
    id v27 = [v26 outputImage:&v136];
    id v28 = v136;

    if (v27)
    {
      v114 = v26;
      v130 = v20;
      v29 = [(NURenderNode *)self settings];
      v30 = [v29 objectForKeyedSubscript:@"applyInverseCurveToLinearThumbnail"];
      int v31 = [v30 BOOLValue];

      v115 = v13;
      v116 = v6;
      v131 = v7;
      if (v31)
      {
        v32 = [v27 imageByApplyingFilter:@"CIAppleLogToLinear"];
        v33 = v32;
        if (v32)
        {
          id v34 = v32;

          id v27 = v34;
        }
        else
        {
          if (*MEMORY[0x1E4F7A750] != -1) {
            dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_267_9815);
          }
          v35 = *MEMORY[0x1E4F7A758];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F7A758], OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            *(void *)&buf[4] = @"CIAppleLogToLinear";
            _os_log_error_impl(&dword_1A9680000, v35, OS_LOG_TYPE_ERROR, "Failed to convert linear thumbnail from Log to Linear: missing filter (%@)", buf, 0xCu);
          }
        }
        v36 = [(NURenderNode *)self settings];
        v37 = [v36 objectForKeyedSubscript:@"linearRangeMin"];

        v38 = [(NURenderNode *)self settings];
        v39 = [v38 objectForKeyedSubscript:@"linearRangeMax"];

        v40 = [(NURenderNode *)self settings];
        v41 = [v40 objectForKeyedSubscript:@"linearGain"];

        if (v37 && v39 && v41)
        {
          [v41 floatValue];
          LODWORD(v42) = 0;
          *((float *)&v42 + 1) = 1.0 / v43;
          v44 = [v27 _imageByApplyingColorMatrixRed:COERCE_DOUBLE((unint64_t)COERCE_UNSIGNED_INT(1.0 / v43)) green:v42 blue:0.0 bias:0.0];

          [v37 floatValue];
          float v46 = v45;
          [v39 floatValue];
          float v48 = v47;
          v49 = [MEMORY[0x1E4F1E040] colorClampFilter];
          [v49 setInputImage:v44];
          v50 = [MEMORY[0x1E4F1E080] vectorWithX:v46 Y:v46 Z:v46 W:0.0];
          [v49 setMinComponents:v50];

          v51 = [MEMORY[0x1E4F1E080] vectorWithX:v48 Y:v48 Z:v48 W:1.0];
          [v49 setMaxComponents:v51];

          id v27 = [v49 outputImage];
        }
        v13 = v115;
        v6 = v116;
      }
      v52 = [MEMORY[0x1E4F7A400] displayP3LinearColorSpace];
      v129 = objc_msgSend(v27, "imageByColorMatchingColorSpaceToWorkingSpace:", objc_msgSend(v52, "CGColorSpace"));

      v53 = [(NURenderNode *)self settings];
      v54 = [v53 objectForKeyedSubscript:@"globalToneCurve"];

      if (!v54)
      {
        *(void *)buf = 0x3F80000000000000;
        v54 = [MEMORY[0x1E4F1C9B8] dataWithBytes:buf length:8];
      }
      v55 = [(NURenderNode *)self settings];
      uint64_t v56 = [v55 objectForKeyedSubscript:@"baselineExposure"];

      v57 = &unk_1F000A478;
      if (v56) {
        v57 = (void *)v56;
      }
      v128 = v57;
      v58 = [(NURenderNode *)self settings];
      v127 = [v58 objectForKeyedSubscript:@"sceneType"];

      v59 = [(NURenderNode *)self settings];
      v126 = [v59 objectForKeyedSubscript:@"inputSRLCurveParameter"];

      v60 = [(NURenderNode *)self settings];
      v125 = [v60 objectForKeyedSubscript:@"stats"];

      v61 = [(NURenderNode *)self settings];
      v124 = [v61 objectForKeyedSubscript:@"lightMap"];

      v62 = [(NURenderNode *)self settings];
      v123 = [v62 objectForKeyedSubscript:@"linearLightMap"];

      v63 = [(NURenderNode *)self settings];
      v122 = [v63 objectForKeyedSubscript:@"lightMapWidth"];

      v64 = [(NURenderNode *)self settings];
      v121 = [v64 objectForKeyedSubscript:@"lightMapHeight"];

      v65 = [(NURenderNode *)self settings];
      v120 = [v65 objectForKeyedSubscript:@"tuningType"];

      v66 = [(NURenderNode *)self settings];
      v119 = [v66 objectForKeyedSubscript:@"brightness"];

      v67 = [(NURenderNode *)self settings];
      v118 = [v67 objectForKeyedSubscript:@"baseGain"];

      v68 = [(NURenderNode *)self settings];
      v117 = [v68 objectForKeyedSubscript:@"faceBasedGlobalExposureBoostRatio"];

      v69 = [(NURenderNode *)self settings];
      v70 = [v69 objectForKeyedSubscript:@"xstats"];

      v71 = [(NURenderNode *)self settings];
      v72 = [v71 objectForKeyedSubscript:@"tone"];
      [v72 doubleValue];
      double v74 = v73;

      v75 = [(NURenderNode *)self settings];
      v76 = [v75 objectForKeyedSubscript:@"color"];
      [v76 doubleValue];
      double v78 = v77;

      v79 = [(NURenderNode *)self settings];
      v80 = [v79 objectForKeyedSubscript:@"cast"];

      uint64_t v81 = [(NURenderNode *)self settings];
      v82 = [(id)v81 objectForKeyedSubscript:@"intensity"];
      [v82 doubleValue];
      double v84 = v83;

      LOBYTE(v81) = [v80 isEqualToString:@"None"];
      id v27 = v134;
      if ((v81 & 1) == 0)
      {
        v85 = [(NURenderNode *)self settings];
        v86 = [v85 objectForKeyedSubscript:@"isFallback"];
        int v87 = [v86 BOOLValue];

        if (v87)
        {
          v88 = (void *)MEMORY[0x1E4F1E050];
          v89 = [MEMORY[0x1E4F1E008] colorWithRed:0.76 green:0.69 blue:0.88];
          v90 = [v88 imageWithColor:v89];
          [v27 extent];
          double v92 = v91;
          double v94 = v93;
          double v96 = v95;
          double v98 = v97;

          objc_msgSend(v90, "imageByCroppingToRect:", v92, v94, v96, v98);
          id v27 = (id)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v89 = objc_alloc_init(PISemanticStyleFilter);
          [(PISemanticStyleFilter *)v89 setInputImage:v27];
          [(PISemanticStyleFilter *)v89 setInputSubjectMatteImage:v131];
          [(PISemanticStyleFilter *)v89 setInputSkinMatteImage:v133];
          [(PISemanticStyleFilter *)v89 setInputSkyMatteImage:v130];
          [(PISemanticStyleFilter *)v89 setInputLinearThumbnailImage:v129];
          v99 = (void *)MEMORY[0x1E4F1E050];
          v100 = [MEMORY[0x1E4F1E008] blackColor];
          v101 = [v99 imageWithColor:v100];
          [v27 extent];
          double v103 = v102;
          double v105 = v104;
          double v107 = v106;
          double v109 = v108;

          v110 = objc_msgSend(v101, "imageByCroppingToRect:", v103, v105, v107, v109);
          [(PISemanticStyleFilter *)v89 setInputGainMapImage:v110];

          [(PISemanticStyleFilter *)v89 setInputToneBias:v74];
          [(PISemanticStyleFilter *)v89 setInputColorBias:v78];
          [(PISemanticStyleFilter *)v89 setInputCast:v80];
          [(PISemanticStyleFilter *)v89 setInputIntensity:v84];
          [(PISemanticStyleFilter *)v89 setInputSceneType:v127];
          [(PISemanticStyleFilter *)v89 setInputTRCData:v54];
          [v128 doubleValue];
          -[PISemanticStyleFilter setInputBaselineExposure:](v89, "setInputBaselineExposure:");
          [(PISemanticStyleFilter *)v89 setInputSRLCurveParameter:v126];
          [(PISemanticStyleFilter *)v89 setInputStatistics:v125];
          [(PISemanticStyleFilter *)v89 setInputExtendedStatistics:v70];
          [(PISemanticStyleFilter *)v89 setInputLightMapData:v124];
          [(PISemanticStyleFilter *)v89 setInputLinearLightMapData:v123];
          [(PISemanticStyleFilter *)v89 setInputLightMapWidth:v122];
          [(PISemanticStyleFilter *)v89 setInputLightMapHeight:v121];
          [(PISemanticStyleFilter *)v89 setBrightnessValue:v119];
          [(PISemanticStyleFilter *)v89 setTuningType:v120];
          [(PISemanticStyleFilter *)v89 setBaseGain:v118];
          [(PISemanticStyleFilter *)v89 setFaceBasedGlobalExposureBoostRatio:v117];
          v111 = [(NURenderNode *)self settings];
          v112 = [v111 objectForKeyedSubscript:@"useStyleEngine"];
          -[PISemanticStyleFilter setUseStyleEngine:](v89, "setUseStyleEngine:", [v112 BOOLValue]);

          id v27 = [(PISemanticStyleFilter *)v89 outputImage];
        }
        v13 = v115;
        v6 = v116;
      }
      v20 = v130;
      v7 = v131;
      v26 = v114;
    }
    else
    {
      *a3 = [MEMORY[0x1E4F7A438] errorWithCode:1 reason:@"Failed to evaluate linear thumbnail" object:v26 underlyingError:v28];
    }

    v5 = v134;
  }
  else
  {
    id v27 = 0;
  }

  return v27;
}

- (id)_evaluateImageGeometry:(id *)a3
{
  v4 = [(NURenderNode *)self inputForKey:*MEMORY[0x1E4F1E480]];
  v5 = [v4 outputImageGeometry:a3];
  v6 = v5;
  if (v5) {
    id v7 = v5;
  }

  return v6;
}

- (id)resolvedNodeWithCachedInputs:(id)a3 settings:(id)a4 pipelineState:(id)a5 error:(id *)a6
{
  uint64_t v64 = *MEMORY[0x1E4F143B8];
  v10 = a3;
  id specific = a4;
  v12 = (const void **)a5;
  if (!a6)
  {
    v52 = NUAssertLogger_9921();
    if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
    {
      v53 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "error != NULL");
      *(_DWORD *)buf = 138543362;
      *(void *)&buf[4] = v53;
      _os_log_error_impl(&dword_1A9680000, v52, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    v13 = (const void **)MEMORY[0x1E4F7A308];
    id specific = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    v10 = NUAssertLogger_9921();
    BOOL v54 = os_log_type_enabled(v10, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v54)
      {
        id specific = dispatch_get_specific(*v13);
        v55 = (void *)MEMORY[0x1E4F29060];
        id v56 = specific;
        v13 = [v55 callStackSymbols];
        v57 = [v13 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        *(void *)&buf[4] = specific;
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v57;
        _os_log_error_impl(&dword_1A9680000, v10, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v54)
    {
      id specific = [MEMORY[0x1E4F29060] callStackSymbols];
      v13 = [specific componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      *(void *)&buf[4] = v13;
      _os_log_error_impl(&dword_1A9680000, v10, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler();
    goto LABEL_44;
  }
  v13 = v12;
  if ([v12 evaluationMode] == 2 || !objc_msgSend(v13, "evaluationMode"))
  {
    v62.receiver = self;
    v62.super_class = (Class)PISemanticStyleRenderNode;
    v20 = [(NURenderNode *)&v62 resolvedNodeWithCachedInputs:v10 settings:specific pipelineState:v13 error:a6];
    goto LABEL_28;
  }
  if ([v13 evaluationMode] != 3)
  {
    if ([v13 evaluationMode] != 1)
    {
      id v15 = 0;
      id v58 = 0;
LABEL_14:
      v23 = (void *)[specific mutableCopy];
      v24 = [v15 subjectRelightingValue];
      [v23 setObject:v24 forKeyedSubscript:@"srlCurveParameter"];

      v25 = [v15 globalToneCurveData];
      [v23 setObject:v25 forKeyedSubscript:@"globalToneCurve"];

      v26 = NSNumber;
      [v15 baselineExposure];
      id v27 = objc_msgSend(v26, "numberWithDouble:");
      [v23 setObject:v27 forKeyedSubscript:@"baselineExposure"];

      id v28 = [v15 sceneType];
      [v23 setObject:v28 forKeyedSubscript:@"sceneType"];

      v29 = [v15 tuningType];
      [v23 setObject:v29 forKeyedSubscript:@"tuningType"];

      v30 = [v15 brightness];
      [v23 setObject:v30 forKeyedSubscript:@"brightness"];

      int v31 = [v15 stats];
      [v23 setObject:v31 forKeyedSubscript:@"stats"];

      v32 = [v15 lightMapData];
      [v23 setObject:v32 forKeyedSubscript:@"lightMap"];

      v33 = [v15 linearLightMapData];
      [v23 setObject:v33 forKeyedSubscript:@"linearLightMap"];

      id v34 = [v15 lightMapWidth];
      [v23 setObject:v34 forKeyedSubscript:@"lightMapWidth"];

      v35 = [v15 lightMapHeight];
      [v23 setObject:v35 forKeyedSubscript:@"lightMapHeight"];

      v36 = [v15 baseGain];
      [v23 setObject:v36 forKeyedSubscript:@"baseGain"];

      v37 = [v15 faceBasedGlobalExposureBoostRatio];
      [v23 setObject:v37 forKeyedSubscript:@"faceBasedGlobalExposureBoostRatio"];

      v38 = [v15 extendedStats];
      [v23 setObject:v38 forKeyedSubscript:@"xstats"];

      uint64_t v39 = [v15 linearGain];
      if (v39)
      {
        v40 = (void *)v39;
        uint64_t v41 = [v15 linearRangeMin];
        if (v41)
        {
          double v42 = (void *)v41;
          float v43 = [v15 linearRangeMax];

          if (v43)
          {
            v44 = [v15 linearGain];
            [v23 setObject:v44 forKeyedSubscript:@"linearGain"];

            float v45 = [v15 linearRangeMin];
            [v23 setObject:v45 forKeyedSubscript:@"linearRangeMin"];

            float v46 = [v15 linearRangeMax];
            [v23 setObject:v46 forKeyedSubscript:@"linearRangeMax"];
            BOOL v47 = 1;
            goto LABEL_24;
          }
        }
        else
        {
        }
      }
      if ([v13 mediaComponentType] != 2)
      {
        BOOL v47 = 0;
        goto LABEL_26;
      }
      float v46 = [v15 version];
      BOOL v47 = [v46 minor] > 9;
LABEL_24:

LABEL_26:
      v49 = [NSNumber numberWithBool:v47];
      [v23 setObject:v49 forKeyedSubscript:@"applyInverseCurveToLinearThumbnail"];

      v59.receiver = self;
      v59.super_class = (Class)PISemanticStyleRenderNode;
      v20 = [(NURenderNode *)&v59 resolvedNodeWithCachedInputs:v10 settings:v23 pipelineState:v13 error:a6];

      id v19 = v58;
      goto LABEL_27;
    }
    id v15 = [v10 objectForKeyedSubscript:@"inputImage"];
    id v60 = 0;
    id v21 = [v15 imageProperties:&v60];
    id v19 = v60;
    uint64_t v22 = [v21 semanticStyleProperties];
    if (!v22)
    {
      *a6 = [MEMORY[0x1E4F7A438] errorWithCode:3 reason:@"Unable to obtain styles properties" object:0 underlyingError:v19];

      v20 = 0;
      goto LABEL_27;
    }
    uint64_t v18 = v22;

LABEL_12:
    id v58 = v19;

    id v15 = (void *)v18;
    goto LABEL_14;
  }
  uint64_t v14 = [v13 videoMetadataSamples];
  id v15 = [v14 objectForKeyedSubscript:*MEMORY[0x1E4F7A340]];

  if (!v15)
  {
    if (*MEMORY[0x1E4F7A750] == -1)
    {
LABEL_19:
      float v48 = (id)*MEMORY[0x1E4F7A758];
      if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
      {
        if (v13) {
          [v13 time];
        }
        else {
          memset(&v61[1], 0, 24);
        }
        v51 = NUStringFromTime();
        *(_DWORD *)buf = 138543362;
        *(void *)&buf[4] = v51;
        _os_log_error_impl(&dword_1A9680000, v48, OS_LOG_TYPE_ERROR, "Missing style metadata sample at %{public}@, style won't be applied", buf, 0xCu);
      }
      v20 = [v10 objectForKeyedSubscript:@"inputImage"];
      id v15 = 0;
      id v19 = 0;
      goto LABEL_27;
    }
LABEL_44:
    dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_267_9815);
    goto LABEL_19;
  }
  v16 = (void *)MEMORY[0x1E4F7A718];
  v17 = [v15 metadataGroup];
  v61[0] = 0;
  *(_OWORD *)buf = *MEMORY[0x1E4F1F9F8];
  *(void *)&uint8_t buf[16] = *(void *)(MEMORY[0x1E4F1F9F8] + 16);
  uint64_t v18 = [v16 semanticStylePropertiesFromMetadataGroup:v17 keyTime:buf error:v61];
  id v19 = v61[0];

  if (v18) {
    goto LABEL_12;
  }
  [MEMORY[0x1E4F7A438] errorWithCode:3 reason:@"Unable to obtain semantic style metadata" object:v15 underlyingError:v19];
  v20 = 0;
  *a6 = (id)objc_claimAutoreleasedReturnValue();
LABEL_27:

LABEL_28:
  return v20;
}

- (id)_evaluateVideoComposition:(id *)a3
{
  v82[1] = *MEMORY[0x1E4F143B8];
  if (!a3)
  {
    float v45 = NUAssertLogger_9921();
    if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
    {
      float v46 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "error != NULL");
      LODWORD(v81.value) = 138543362;
      *(CMTimeValue *)((char *)&v81.value + 4) = (CMTimeValue)v46;
      _os_log_error_impl(&dword_1A9680000, v45, OS_LOG_TYPE_ERROR, "Fail: %{public}@", (uint8_t *)&v81, 0xCu);
    }
    BOOL v47 = (const void **)MEMORY[0x1E4F7A308];
    id specific = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    v49 = NUAssertLogger_9921();
    BOOL v50 = os_log_type_enabled(v49, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v50)
      {
        v53 = dispatch_get_specific(*v47);
        BOOL v54 = (void *)MEMORY[0x1E4F29060];
        id v55 = v53;
        id v56 = [v54 callStackSymbols];
        v57 = [v56 componentsJoinedByString:@"\n"];
        LODWORD(v81.value) = 138543618;
        *(CMTimeValue *)((char *)&v81.value + 4) = (CMTimeValue)v53;
        LOWORD(v81.flags) = 2114;
        *(void *)((char *)&v81.flags + 2) = v57;
        _os_log_error_impl(&dword_1A9680000, v49, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", (uint8_t *)&v81, 0x16u);
      }
    }
    else if (v50)
    {
      v51 = [MEMORY[0x1E4F29060] callStackSymbols];
      v52 = [v51 componentsJoinedByString:@"\n"];
      LODWORD(v81.value) = 138543362;
      *(CMTimeValue *)((char *)&v81.value + 4) = (CMTimeValue)v52;
      _os_log_error_impl(&dword_1A9680000, v49, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", (uint8_t *)&v81, 0xCu);
    }
    _NUAssertFailHandler();
  }
  v5 = [(NURenderNode *)self outputVideo:"outputVideo:"];
  if (!v5)
  {
    id v21 = 0;
    goto LABEL_29;
  }
  v6 = [(PISemanticStyleRenderNode *)self input];
  id v7 = [v6 outputVideoComposition:a3];

  if (v7)
  {
    id v8 = [v7 instructions];
    uint64_t v9 = [v8 count];

    if (v9 == 1)
    {
      v10 = [v7 instructions];
      v11 = [v10 firstObject];

      v12 = [(PISemanticStyleRenderNode *)self input];
      v13 = [v12 videoProperties:a3];

      if (v13)
      {
        uint64_t v14 = (void *)[v11 copy];
        id v60 = v13;
        id v15 = [v13 auxiliaryVideoTrackProperties];
        v76[0] = MEMORY[0x1E4F143A8];
        v76[1] = 3221225472;
        v76[2] = __55__PISemanticStyleRenderNode__evaluateVideoComposition___block_invoke;
        v76[3] = &unk_1E5D7FA20;
        v61 = v11;
        id v77 = v11;
        id v16 = v14;
        id v78 = v16;
        [v15 enumerateKeysAndObjectsUsingBlock:v76];

        v17 = [MEMORY[0x1E4F7A718] metadataTrackWithIdenfifier:*MEMORY[0x1E4F7A768] forAsset:v5];
        uint64_t v18 = v17;
        if (v17)
        {
          uint64_t v19 = *MEMORY[0x1E4F7A340];
          v20 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v17, "trackID"));
          [v16 setSourceIdentifier:v19 forMetadataTrackID:v20];
        }
        id v58 = v18;
        id v21 = (void *)[v7 mutableCopy];
        v82[0] = v16;
        uint64_t v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:v82 count:1];
        [v21 setInstructions:v22];

        v23 = [v16 requiredSourceSampleDataTrackIDs];
        [v21 setSourceSampleDataTrackIDs:v23];

        [v16 setRequestedWindowOfSamples:1];
        [v16 setMainTrackSourceIdentifier:@"video"];
        [MEMORY[0x1E4F7A4A0] semanticStyleInterpolationHalfWindowTime];
        memset(&v81, 0, sizeof(v81));
        CMTimeMakeWithSeconds(&v81, v24, 600);
        id v25 = objc_alloc(MEMORY[0x1E4F166E0]);
        CMTime v75 = v81;
        CMTime v74 = v81;
        long long v72 = *MEMORY[0x1E4F1FA48];
        uint64_t v73 = *(void *)(MEMORY[0x1E4F1FA48] + 16);
        long long v70 = v72;
        uint64_t v71 = v73;

        v26 = (void *)MEMORY[0x1E4F1CA60];
        id v27 = [v16 requiredSourceTrackIDs];
        id v28 = objc_msgSend(v26, "dictionaryWithCapacity:", objc_msgSend(v27, "count"));

        long long v68 = 0u;
        long long v69 = 0u;
        long long v66 = 0u;
        long long v67 = 0u;
        v29 = [v16 requiredSourceTrackIDs];
        uint64_t v30 = [v29 countByEnumeratingWithState:&v66 objects:v80 count:16];
        if (v30)
        {
          uint64_t v31 = v30;
          uint64_t v32 = *(void *)v67;
          do
          {
            for (uint64_t i = 0; i != v31; ++i)
            {
              if (*(void *)v67 != v32) {
                objc_enumerationMutation(v29);
              }
              [v28 setObject:v25 forKeyedSubscript:*(void *)(*((void *)&v66 + 1) + 8 * i)];
            }
            uint64_t v31 = [v29 countByEnumeratingWithState:&v66 objects:v80 count:16];
          }
          while (v31);
        }

        [v21 setSourceVideoTrackWindowsForTrackIDs:v28];
        id v34 = (void *)MEMORY[0x1E4F1CA60];
        v35 = [v16 requiredSourceSampleDataTrackIDs];
        v36 = objc_msgSend(v34, "dictionaryWithCapacity:", objc_msgSend(v35, "count"));

        long long v64 = 0u;
        long long v65 = 0u;
        long long v62 = 0u;
        long long v63 = 0u;
        objc_super v59 = v16;
        v37 = [v16 requiredSourceSampleDataTrackIDs];
        uint64_t v38 = [v37 countByEnumeratingWithState:&v62 objects:v79 count:16];
        if (v38)
        {
          uint64_t v39 = v38;
          uint64_t v40 = *(void *)v63;
          do
          {
            for (uint64_t j = 0; j != v39; ++j)
            {
              if (*(void *)v63 != v40) {
                objc_enumerationMutation(v37);
              }
              [v36 setObject:v25 forKeyedSubscript:*(void *)(*((void *)&v62 + 1) + 8 * j)];
            }
            uint64_t v39 = [v37 countByEnumeratingWithState:&v62 objects:v79 count:16];
          }
          while (v39);
        }

        [v21 setSourceSampleDataTrackWindowsForTrackIDs:v36];
        v13 = v60;
        v11 = v61;
      }
      else
      {
        id v21 = 0;
      }

      goto LABEL_28;
    }
    double v42 = (void *)MEMORY[0x1E4F7A438];
    float v43 = [v7 instructions];
    *a3 = [v42 unsupportedError:@"Unsupported video configuration" object:v43];
  }
  id v21 = 0;
LABEL_28:

LABEL_29:
  return v21;
}

void __55__PISemanticStyleRenderNode__evaluateVideoComposition___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v15 = a3;
  v5 = *(void **)(a1 + 32);
  id v6 = a2;
  id v7 = [v5 requiredSourceTrackIDs];
  id v8 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v15, "trackID"));
  char v9 = [v7 containsObject:v8];

  if ((v9 & 1) == 0)
  {
    v10 = [*(id *)(a1 + 40) requiredSourceTrackIDs];
    v11 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v15, "trackID"));
    v12 = [v10 arrayByAddingObject:v11];
    [*(id *)(a1 + 40) setRequiredSourceTrackIDs:v12];
  }
  v13 = *(void **)(a1 + 40);
  uint64_t v14 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v15, "trackID"));
  [v13 setSourceIdentifier:v6 forTrackID:v14];
}

- (id)_evaluateVideo:(id *)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PISemanticStyleRenderNode;
  v3 = [(NURenderNode *)&v5 _evaluateVideo:a3];
  return v3;
}

- (BOOL)requiresVideoComposition
{
  return 1;
}

- (BOOL)shouldCacheNodeForPipelineState:(id)a3
{
  return (unint64_t)[a3 evaluationMode] < 4;
}

- (id)nodeByReplayingAgainstCache:(id)a3 pipelineState:(id)a4 error:(id *)a5
{
  uint64_t v88 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  if (![v9 evaluationMode])
  {
    v85.receiver = self;
    v85.super_class = (Class)PISemanticStyleRenderNode;
    [(NURenderNode *)&v85 nodeByReplayingAgainstCache:v8 pipelineState:v9 error:a5];
    goto LABEL_6;
  }
  if ([v9 auxiliaryImageType] == 1)
  {
    if ([v9 evaluationMode] == 2)
    {
      v84.receiver = self;
      v84.super_class = (Class)PISemanticStyleRenderNode;
      [(NURenderNode *)&v84 nodeByReplayingAgainstCache:v8 pipelineState:v9 error:a5];
      v10 = LABEL_6:;
      goto LABEL_44;
    }
    v12 = [(PISemanticStyleRenderNode *)self input];
    v13 = [(PISemanticStyleRenderNode *)self input];
    uint64_t v14 = [v13 imageProperties:a5];

    id v15 = [v14 auxiliaryImagePropertiesForType:10];
    id v78 = v15;
    if (v15)
    {
      uint64_t v16 = [v15 size];
      uint64_t v18 = v17;
    }
    else
    {
      uint64_t v18 = 96;
      uint64_t v16 = 128;
    }
    id v19 = objc_alloc(MEMORY[0x1E4F7A5D0]);
    BOOL v20 = v18 <= 192 || v16 <= 256;
    uint64_t v21 = v16 * v18;
    if (v20) {
      uint64_t v22 = 49152;
    }
    else {
      uint64_t v22 = v21;
    }
    v23 = (void *)[v19 initWithTargetPixelCount:v22];
    Float64 v24 = (void *)[objc_alloc(MEMORY[0x1E4F7A5D0]) initWithTargetPixelCount:v21];
    id v25 = [(PISemanticStyleRenderNode *)self input];
    v26 = [v25 outputImageGeometry:a5];

    id v77 = v26;
    if (!v26)
    {
      v10 = 0;
      v11 = v12;
LABEL_42:

      goto LABEL_43;
    }
    v76 = v14;
    uint64_t v27 = [v26 size];
    CMTime v75 = v23;
    uint64_t v29 = objc_msgSend(v23, "scaleForImageSize:", v27, v28);
    uint64_t v31 = v30;
    uint64_t v32 = [v26 size];
    CMTime v74 = v24;
    uint64_t v34 = objc_msgSend(v24, "scaleForImageSize:", v32, v33);
    uint64_t v72 = v35;
    v36 = (void *)[v9 copy];
    id v79 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    v11 = [v12 nodeByReplayingAgainstCache:v8 pipelineState:v9 error:a5];

    if (!v11)
    {
      v10 = 0;
      v23 = v75;
      uint64_t v14 = v76;
      Float64 v24 = v74;
      long long v63 = v79;
LABEL_41:

      goto LABEL_42;
    }
    objc_msgSend(v36, "setScale:", v29, v31);
    [v36 setSampleMode:2];
    uint64_t v71 = v11;
    [v79 setObject:v11 forKeyedSubscript:*MEMORY[0x1E4F1E480]];
    v37 = [(NURenderNode *)self settings];
    uint64_t v38 = [v37 objectForKeyedSubscript:@"isFallback"];
    char v39 = [v38 BOOLValue];

    if ((v39 & 1) == 0)
    {
      long long v70 = v36;
      id v40 = (id)[v9 copy];
      [v40 setAuxiliaryImageType:10];
      objc_msgSend(v40, "setScale:", v34, v72);
      uint64_t v41 = [(PISemanticStyleRenderNode *)self input];
      id v83 = 0;
      uint64_t v42 = [v41 nodeByReplayingAgainstCache:v8 pipelineState:v40 error:&v83];
      id v43 = v83;

      if (!v42)
      {
        long long v66 = (void *)MEMORY[0x1E4F7A438];
        long long v67 = [(PISemanticStyleRenderNode *)self input];
        id v68 = [v66 errorWithCode:1 reason:@"Failed to evaluate linear thumbnail" object:v67 underlyingError:v43];

        *a5 = v68;
        v10 = 0;
        v23 = v75;
        uint64_t v14 = v76;
        Float64 v24 = v74;
        v36 = v70;
        long long v63 = v79;
LABEL_40:

        v11 = v71;
        goto LABEL_41;
      }
      uint64_t v73 = (void *)v42;
      [v79 setObject:v42 forKeyedSubscript:@"linearThumbnail"];
      v44 = v70;
      [v70 setAuxiliaryImageType:3];
      float v45 = [(PISemanticStyleRenderNode *)self input];
      id v82 = 0;
      uint64_t v46 = [v45 nodeByReplayingAgainstCache:v8 pipelineState:v70 error:&v82];
      id v47 = v82;

      if (!v46)
      {
        float v48 = NULogger_9971();
        if (os_log_type_enabled(v48, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138543362;
          id v87 = v47;
          _os_log_impl(&dword_1A9680000, v48, OS_LOG_TYPE_INFO, "Missing subject matte image: %{public}@", buf, 0xCu);
        }

        v44 = v70;
      }
      [v79 setObject:v46 forKeyedSubscript:@"subjectMatte"];
      [v44 setAuxiliaryImageType:4];
      v49 = [(PISemanticStyleRenderNode *)self input];
      id v81 = 0;
      uint64_t v50 = [v49 nodeByReplayingAgainstCache:v8 pipelineState:v44 error:&v81];
      id v51 = v81;
      v52 = v47;
      id v53 = v51;

      BOOL v54 = (void *)v50;
      if (!v50)
      {
        id v55 = v53;
        id v56 = NULogger_9971();
        if (os_log_type_enabled(v56, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138543362;
          id v87 = v55;
          _os_log_impl(&dword_1A9680000, v56, OS_LOG_TYPE_INFO, "Missing skin matte image: %{public}@", buf, 0xCu);
        }

        v44 = v70;
        id v53 = v55;
      }
      objc_msgSend(v79, "setObject:forKeyedSubscript:", v54, @"skinMatte", v46);
      [v44 setAuxiliaryImageType:9];
      [(PISemanticStyleRenderNode *)self input];
      id v58 = v57 = v54;
      id v80 = 0;
      objc_super v59 = [v58 nodeByReplayingAgainstCache:v8 pipelineState:v44 error:&v80];
      id v60 = v80;

      if (!v59)
      {
        v61 = NULogger_9971();
        if (os_log_type_enabled(v61, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138543362;
          id v87 = v60;
          _os_log_impl(&dword_1A9680000, v61, OS_LOG_TYPE_INFO, "Missing sky matte image: %{public}@", buf, 0xCu);
        }
      }
      [v79 setObject:v59 forKeyedSubscript:@"skyMatte"];

      v36 = v70;
    }
    [v36 setAuxiliaryImageType:1];
    long long v62 = self;
    long long v63 = v79;
    long long v64 = [(NURenderNode *)v62 resolvedNodeWithCachedInputs:v79 cache:v8 pipelineState:v36 error:a5];
    if (v64)
    {
      id v40 = v64;
      v10 = v40;
    }
    else
    {
      id v40 = 0;
      v10 = 0;
    }
    v23 = v75;
    uint64_t v14 = v76;
    Float64 v24 = v74;
    goto LABEL_40;
  }
  v11 = [(PISemanticStyleRenderNode *)self input];
  v10 = [v11 nodeByReplayingAgainstCache:v8 pipelineState:v9 error:a5];
LABEL_43:

LABEL_44:
  return v10;
}

- (NURenderNode)input
{
  v2 = [(NURenderNode *)self inputs];
  v3 = [v2 objectForKeyedSubscript:*MEMORY[0x1E4F1E480]];

  return (NURenderNode *)v3;
}

- (PISemanticStyleRenderNode)initWithInput:(id)a3 settings:(id)a4
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (!v6)
  {
    v12 = NUAssertLogger_9921();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v13 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "input != nil");
      *(_DWORD *)buf = 138543362;
      uint64_t v29 = v13;
      _os_log_error_impl(&dword_1A9680000, v12, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    uint64_t v14 = (const void **)MEMORY[0x1E4F7A308];
    id specific = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    uint64_t v16 = NUAssertLogger_9921();
    BOOL v17 = os_log_type_enabled(v16, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v17)
      {
        BOOL v20 = dispatch_get_specific(*v14);
        uint64_t v21 = (void *)MEMORY[0x1E4F29060];
        id v22 = v20;
        v23 = [v21 callStackSymbols];
        Float64 v24 = [v23 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        uint64_t v29 = v20;
        __int16 v30 = 2114;
        uint64_t v31 = v24;
        _os_log_error_impl(&dword_1A9680000, v16, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v17)
    {
      uint64_t v18 = [MEMORY[0x1E4F29060] callStackSymbols];
      id v19 = [v18 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      uint64_t v29 = v19;
      _os_log_error_impl(&dword_1A9680000, v16, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler();
  }
  id v8 = v7;
  uint64_t v26 = *MEMORY[0x1E4F1E480];
  id v27 = v6;
  id v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v27 forKeys:&v26 count:1];
  v25.receiver = self;
  v25.super_class = (Class)PISemanticStyleRenderNode;
  v10 = [(NURenderNode *)&v25 initWithSettings:v8 inputs:v9];

  return v10;
}

- (PISemanticStyleRenderNode)initWithSettings:(id)a3 inputs:(id)a4
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
    v10 = (void *)*MEMORY[0x1E4F7A748];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F7A748], OS_LOG_TYPE_ERROR))
    {
      v11 = NSString;
      v12 = v10;
      v13 = (objc_class *)objc_opt_class();
      uint64_t v14 = NSStringFromClass(v13);
      id v15 = NSStringFromSelector(a2);
      uint64_t v16 = [v11 stringWithFormat:@"Initializer not available: -[%@ %@], use designated initializer instead.", v14, v15];
      *(_DWORD *)buf = 138543362;
      uint64_t v31 = v16;
      _os_log_error_impl(&dword_1A9680000, v12, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

      uint64_t v17 = *v8;
      if (!dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]))
      {
        if (v17 != -1) {
          dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_255);
        }
LABEL_7:
        os_log_t v18 = *v9;
        if (os_log_type_enabled(*v9, OS_LOG_TYPE_ERROR))
        {
          id v19 = (void *)MEMORY[0x1E4F29060];
          BOOL v20 = v18;
          uint64_t v21 = [v19 callStackSymbols];
          id v22 = [v21 componentsJoinedByString:@"\n"];
          *(_DWORD *)buf = 138543362;
          uint64_t v31 = v22;
          _os_log_error_impl(&dword_1A9680000, v20, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

LABEL_13:
          goto LABEL_14;
        }
        goto LABEL_14;
      }
      if (v17 != -1) {
        dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_255);
      }
    }
    else if (!dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]))
    {
      goto LABEL_7;
    }
    os_log_t v23 = *v9;
    if (os_log_type_enabled(*v9, OS_LOG_TYPE_ERROR))
    {
      id specific = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
      objc_super v25 = (void *)MEMORY[0x1E4F29060];
      id v26 = specific;
      BOOL v20 = v23;
      id v27 = [v25 callStackSymbols];
      uint64_t v28 = [v27 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543618;
      uint64_t v31 = specific;
      __int16 v32 = 2114;
      uint64_t v33 = v28;
      _os_log_error_impl(&dword_1A9680000, v20, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      goto LABEL_13;
    }
LABEL_14:
    uint64_t v29 = (objc_class *)objc_opt_class();
    NSStringFromClass(v29);
    objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    objc_claimAutoreleasedReturnValue();
    _NUAssertFailHandler();
LABEL_15:
    dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_255);
  }
}

@end