@interface NURAWImageSourceNode
+ (id)_firstFilterOfType:(int)a3 inArray:(id)a4;
+ (int)_filterTypeForClassName:(id)a3;
- (BOOL)_hasLensCorrectionFilter:(id)a3;
- (BOOL)canPropagateOriginalAuxiliaryData:(int64_t)a3;
- (BOOL)load:(id *)a3;
- (BOOL)shouldGenerateMeteorGainMap;
- (BOOL)supportsPipelineState:(id)a3 error:(id *)a4;
- (NURAWImageSourceNode)initWithImageSource:(CGImageSource *)a3 identifier:(id)a4;
- (NURAWImageSourceNode)initWithURL:(id)a3 UTI:(id)a4 identifier:(id)a5;
- (NURAWImageSourceNode)initWithURL:(id)a3 UTI:(id)a4 settings:(id)a5;
- (id)_RAWCameraSpaceProperties:(id)a3 RAWProperties:(id)a4;
- (id)_RAWToneCurveProperties:(id)a3;
- (id)_appendFilter:(id)a3 filterType:(int)a4 settings:(id)a5 source:(id)a6;
- (id)_cachedRawImagePropertiesForOptions:(id)a3 error:(id *)a4;
- (id)_evaluateImageGeometryWithSourceOptions:(id)a3 error:(id *)a4;
- (id)_evaluateImagePropertiesWithSourceOptions:(id)a3 error:(id *)a4;
- (id)_evaluateImageWithSourceOptions:(id)a3 subsampleFactor:(int64_t *)a4 error:(id *)a5;
- (id)_neutralColorArrayForSettings:(id)a3;
- (id)_neutralColorVectorForSettings:(id)a3;
- (id)_rawFiltersWithSourceOptions:(id)a3 error:(id *)a4;
- (id)_rawMethodVersionForSettings:(id)a3 error:(id *)a4;
- (id)_sourceOptionsForSettings:(id)a3 rawMethodVersion:(id)a4 sushiLevel:(id)a5;
- (id)preparedNodeWithSourceContainer:(id)a3 pipelineState:(id)a4 pipelineSettings:(id)a5 sourceSettings:(id)a6 error:(id *)a7;
- (id)resolvedNodeWithCachedInputs:(id)a3 settings:(id)a4 pipelineState:(id)a5 error:(id *)a6;
- (id)sourceOptionsForSettings:(id)a3 error:(id *)a4;
- (void)_addDefaultFinalizedSourceOptions:(id)a3;
- (void)_processRAWProperties:(id)a3;
@end

@implementation NURAWImageSourceNode

- (void).cxx_destruct
{
}

- (BOOL)canPropagateOriginalAuxiliaryData:(int64_t)a3
{
  return 0;
}

- (id)preparedNodeWithSourceContainer:(id)a3 pipelineState:(id)a4 pipelineSettings:(id)a5 sourceSettings:(id)a6 error:(id *)a7
{
  uint64_t v175 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  v15 = a7;
  id v134 = v14;
  id v16 = a6;
  v17 = [(NURAWImageSourceNode *)self sourceOptionsForSettings:v16 error:a7];
  if (!v17 || ![(NURAWImageSourceNode *)self supportsPipelineState:v13 error:v15])
  {
    v21 = 0;
    goto LABEL_92;
  }
  v133 = v15;
  v18 = [v17 objectForKeyedSubscript:*MEMORY[0x1E4F2FF38]];
  uint64_t v19 = [v17 objectForKeyedSubscript:*MEMORY[0x1E4F2FF20]];
  if (!v18)
  {
    v87 = NUAssertLogger();
    if (os_log_type_enabled(v87, OS_LOG_TYPE_ERROR))
    {
      v88 = [NSString stringWithFormat:@"Missing kCIInputDecoderVersionKey"];
      *(_DWORD *)buf = 138543362;
      v172 = v88;
      _os_log_error_impl(&dword_1A9892000, v87, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    v90 = NUAssertLogger();
    BOOL v91 = os_log_type_enabled(v90, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v91)
      {
        v101 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v102 = (void *)MEMORY[0x1E4F29060];
        id v103 = v101;
        v104 = [v102 callStackSymbols];
        v105 = [v104 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v172 = v101;
        __int16 v173 = 2114;
        v174 = v105;
        _os_log_error_impl(&dword_1A9892000, v90, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v91)
    {
      v92 = [MEMORY[0x1E4F29060] callStackSymbols];
      v93 = [v92 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v172 = v93;
      _os_log_error_impl(&dword_1A9892000, v90, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NURAWImageSourceNode preparedNodeWithSourceContainer:pipelineState:pipelineSettings:sourceSettings:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderSourceNode+RAW.m", 836, @"Missing kCIInputDecoderVersionKey", v106, v107, v108, v109, v119);
  }
  if (!v19)
  {
    v94 = NUAssertLogger();
    if (os_log_type_enabled(v94, OS_LOG_TYPE_ERROR))
    {
      v95 = [NSString stringWithFormat:@"Missing sushi level"];
      *(_DWORD *)buf = 138543362;
      v172 = v95;
      _os_log_error_impl(&dword_1A9892000, v94, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    v96 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    v97 = NUAssertLogger();
    BOOL v98 = os_log_type_enabled(v97, OS_LOG_TYPE_ERROR);
    if (v96)
    {
      if (v98)
      {
        v110 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v111 = (void *)MEMORY[0x1E4F29060];
        id v112 = v110;
        v113 = [v111 callStackSymbols];
        v114 = [v113 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v172 = v110;
        __int16 v173 = 2114;
        v174 = v114;
        _os_log_error_impl(&dword_1A9892000, v97, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v98)
    {
      v99 = [MEMORY[0x1E4F29060] callStackSymbols];
      v100 = [v99 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v172 = v100;
      _os_log_error_impl(&dword_1A9892000, v97, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NURAWImageSourceNode preparedNodeWithSourceContainer:pipelineState:pipelineSettings:sourceSettings:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderSourceNode+RAW.m", 837, @"Missing sushi level", v115, v116, v117, v118, v119);
  }
  v123 = (void *)v19;
  if ([v13 auxiliaryImageType] == 1)
  {
    uint64_t v20 = 1;
LABEL_11:
    uint64_t v138 = v20;
LABEL_14:
    v22 = [(NURAWImageSourceNode *)self _rawFiltersWithSourceOptions:v17 error:v133];
    if (!v22)
    {
      v21 = 0;
LABEL_90:

      goto LABEL_91;
    }
    v122 = v22;
    v127 = [(NURAWImageSourceNode *)self _RAWToneCurveProperties:v22];
    if (v138 == 1)
    {
      v137 = [v13 beginGroupWithName:@"RAW" error:v133];
      if (!v137)
      {
        v21 = 0;
LABEL_89:

        v22 = v122;
        goto LABEL_90;
      }
    }
    else
    {
      v137 = 0;
    }
    v121 = v18;
    v131 = v13;
    v120 = v17;
    v23 = [[NUSubsampleNode alloc] initWithPreparedSource:self container:v12 pipelineSettings:v134 sourceOptions:v17];
    long long v149 = 0u;
    long long v150 = 0u;
    long long v151 = 0u;
    long long v152 = 0u;
    id obj = v122;
    uint64_t v136 = [obj countByEnumeratingWithState:&v149 objects:v170 count:16];
    v130 = v23;
    if (!v136)
    {
      v147 = 0;
      v148 = 0;
      id v139 = 0;
      id v24 = v23;
      v145 = v23;
LABEL_83:

      id v13 = v131;
      if (v137 && ![v131 endGroupWithName:@"RAW" error:v133])
      {
        v21 = 0;
      }
      else
      {
        id v24 = v24;
        v21 = v24;
      }
      v17 = v120;
      v39 = v145;
LABEL_88:

      v18 = v121;
      goto LABEL_89;
    }
    char v140 = 0;
    char v141 = 0;
    unsigned __int8 v146 = 0;
    v147 = 0;
    v148 = 0;
    id v139 = 0;
    uint64_t v135 = *(void *)v150;
    v125 = self;
    uint64_t v126 = *MEMORY[0x1E4F1E470];
    uint64_t v129 = *MEMORY[0x1E4F1E480];
    uint64_t v124 = *MEMORY[0x1E4F1E428];
    id v24 = v23;
    v145 = v23;
    v143 = v16;
LABEL_22:
    uint64_t v25 = 0;
    while (1)
    {
      if (*(void *)v150 != v135) {
        objc_enumerationMutation(obj);
      }
      uint64_t v26 = *(void *)(*((void *)&v149 + 1) + 8 * v25);
      v27 = (objc_class *)objc_opt_class();
      v144 = NSStringFromClass(v27);
      uint64_t v28 = [(id)objc_opt_class() _filterTypeForClassName:v144];
      uint64_t v29 = v28;
      BOOL v31 = v28 > 8 && v138 == 7;
      char v32 = v28 > 0xA || v31;
      BOOL v33 = v28 < 4;
      id v24 = v24;

      id v34 = v145;
      char v35 = v33 | v141;
      v147 = v34;
      v148 = v24;
      v36 = v34;
      if ((v35 & 1) == 0)
      {
        v37 = [(NUSourceNode *)self _addResampleNode:v24 subsampleNode:v130];

        v38 = [(NUSourceNode *)self _addScaleNode:v37 pipelineState:v131 pipelineSettings:v134 sourceSettings:v16];

        id v24 = v38;
        char v141 = 1;
        v36 = v24;
      }
      if (v140 & 1 | ((v32 & 1) == 0))
      {
        v39 = v36;
      }
      else
      {
        [(NUSourceNode *)self _addOrientationNode:v24 sourceSettings:v16 error:v133];
        v41 = id v40 = v16;

        v39 = [(NUSourceNode *)self _addOrientationNode:v36 sourceSettings:v40 error:v133];

        if (!v41)
        {

          id v24 = 0;
          v21 = 0;
          v17 = v120;
          id v13 = v131;
          id v16 = v143;
          goto LABEL_88;
        }
        char v140 = 1;
        id v24 = (id)v41;
        id v16 = v143;
      }
      if (!v139)
      {
        if ((v29 & 0xFFFFFFFE) == 0xA) {
          id v139 = v24;
        }
        else {
          id v139 = 0;
        }
      }
      BOOL v42 = v29 != 11 || v137 == 0;
      v43 = @"Linear";
      if (!v42) {
        break;
      }
      BOOL v44 = v29 != 6 || v137 == 0;
      v43 = @"SushiLevel1";
      if (!v44) {
        break;
      }
      BOOL v45 = v29 == 10;
      BOOL v46 = v29 == 14 || v29 == 10;
      if (!v46 || v138 != 10)
      {
        BOOL v142 = v29 == 14;
LABEL_63:
        v49 = v24;
        id v24 = [(NURAWImageSourceNode *)self _appendFilter:v26 filterType:v29 settings:v16 source:v24];

        v145 = [(NURAWImageSourceNode *)self _appendFilter:v26 filterType:v29 settings:0 source:v39];

        if (((v29 == 9) & v146) == 1)
        {
          v50 = [v16 objectForKeyedSubscript:@"gainMapVersion"];
          v51 = [v16 objectForKeyedSubscript:@"gainMapParameters"];
          v52 = [[NURAWGainMapNode alloc] initWithInput:v24 gainMapVersion:v50 gainMapParameters:v51];

          id v24 = v52;
        }
        if (v45)
        {
          id v16 = v143;
          v53 = [v143 objectForKeyedSubscript:@"debugTransferTone"];
          int v54 = [v53 BOOLValue];

          if (v54)
          {
            [v127 baselineExposure];
            int v56 = v55;
            v57 = [NUFilterNode alloc];
            uint64_t v168 = v126;
            LODWORD(v58) = v56;
            v59 = [NSNumber numberWithFloat:v58];
            v169 = v59;
            v60 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v169 forKeys:&v168 count:1];
            uint64_t v166 = v129;
            v167 = v147;
            v61 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v167 forKeys:&v166 count:1];
            v128 = [(NUFilterNode *)v57 initWithFilterName:@"CIExposureAdjust" settings:v60 inputs:v61];

            v62 = [NUFilterNode alloc];
            uint64_t v164 = v126;
            LODWORD(v63) = v56;
            v64 = [NSNumber numberWithFloat:v63];
            v165 = v64;
            v65 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v165 forKeys:&v164 count:1];
            uint64_t v162 = v129;
            v163 = v148;
            v66 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v163 forKeys:&v162 count:1];
            v67 = [(NUFilterNode *)v62 initWithFilterName:@"CIExposureAdjust" settings:v65 inputs:v66];

            uint64_t v68 = [v143 objectForKeyedSubscript:@"inputToneMapping"];
            v69 = (void *)v68;
            v70 = &unk_1F004A500;
            if (v68) {
              v70 = (void *)v68;
            }
            id v71 = v70;

            v72 = [NURawFilterNode alloc];
            v160 = @"inputStrength";
            id v161 = v71;
            v73 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v161 forKeys:&v160 count:1];
            v158[0] = v129;
            self = v125;
            v159[0] = v67;
            v159[1] = v128;
            v158[1] = @"inputSourceImage";
            v158[2] = @"inputTargetImage";
            v159[2] = v145;
            v74 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v159 forKeys:v158 count:3];

            uint64_t v75 = [(NURawFilterNode *)v72 initWithRawFilterName:@"NUToneTransferFilter" type:v29 settings:v73 inputs:v74];
            id v16 = v143;

            id v24 = (id)v75;
          }
        }
        else
        {
          id v16 = v143;
        }
        v146 |= v29 == 5;
        if (v142)
        {
          v76 = [v16 objectForKeyedSubscript:@"debugTransferTone"];
          int v77 = [v76 BOOLValue];

          if (v77)
          {
            uint64_t v78 = [v16 objectForKeyedSubscript:v124];
            v79 = (void *)v78;
            v80 = &unk_1F004A500;
            if (v78) {
              v80 = (void *)v78;
            }
            id v81 = v80;

            v82 = [NURawFilterNode alloc];
            v156 = @"inputStrength";
            id v157 = v81;
            v83 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v157 forKeys:&v156 count:1];
            v154[0] = v129;
            v154[1] = @"inputSourceImage";
            v155[0] = v148;
            v155[1] = v147;
            v154[2] = @"inputTargetImage";
            v155[2] = v145;
            v84 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v155 forKeys:v154 count:3];

            uint64_t v85 = [(NURawFilterNode *)v82 initWithRawFilterName:@"NUToneTransferFilter" type:v29 settings:v83 inputs:v84];
            id v24 = (id)v85;
          }
        }
        goto LABEL_77;
      }
      v145 = v39;
LABEL_77:

      if (v136 == ++v25)
      {
        uint64_t v136 = [obj countByEnumeratingWithState:&v149 objects:v170 count:16];
        if (v136) {
          goto LABEL_22;
        }
        goto LABEL_83;
      }
    }
    uint64_t v48 = [v137 addTag:v43 forNode:v24];

    BOOL v142 = 0;
    BOOL v45 = 0;
    id v24 = (id)v48;
    goto LABEL_63;
  }
  if ([v13 auxiliaryImageType] == 7
    && [(NURAWImageSourceNode *)self shouldGenerateMeteorGainMap])
  {
    uint64_t v20 = 7;
    goto LABEL_11;
  }
  if ([v13 auxiliaryImageType] == 10)
  {
    uint64_t v138 = [v13 auxiliaryImageType];
    goto LABEL_14;
  }
  v153.receiver = self;
  v153.super_class = (Class)NURAWImageSourceNode;
  v21 = [(NUCGImageSourceNode *)&v153 preparedNodeWithSourceContainer:v12 pipelineState:v13 pipelineSettings:v134 sourceSettings:v16 error:v133];
LABEL_91:

LABEL_92:

  return v21;
}

- (id)_rawFiltersWithSourceOptions:(id)a3 error:(id *)a4
{
  v4 = [(NURAWImageSourceNode *)self _cachedRawImagePropertiesForOptions:a3 error:a4];
  v5 = v4;
  if (v4)
  {
    v6 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F2FD18]];
    v7 = [v6 objectForKeyedSubscript:@"filters"];

    unint64_t v8 = [v7 indexOfObjectPassingTest:&__block_literal_global_278];
    unint64_t v9 = [v7 indexOfObjectPassingTest:&__block_literal_global_280];
    if (v8 != 0x7FFFFFFFFFFFFFFFLL && v9 != 0x7FFFFFFFFFFFFFFFLL && v8 > v9)
    {
      unint64_t v12 = v9;
      id v13 = [v7 objectAtIndex:v8];
      id v14 = (void *)[v7 mutableCopy];
      [v14 removeObjectAtIndex:v8];
      [v14 insertObject:v13 atIndex:v12];
      uint64_t v15 = [v14 copy];

      v7 = (void *)v15;
    }
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

uint64_t __59__NURAWImageSourceNode__rawFiltersWithSourceOptions_error___block_invoke_2(uint64_t a1, void *a2)
{
  v2 = [a2 name];
  uint64_t v3 = [v2 isEqualToString:@"RAWLinearSpacePlaceholder"];

  return v3;
}

uint64_t __59__NURAWImageSourceNode__rawFiltersWithSourceOptions_error___block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 name];
  uint64_t v3 = [v2 isEqualToString:@"RAWProfileGainTableMap"];

  return v3;
}

- (id)resolvedNodeWithCachedInputs:(id)a3 settings:(id)a4 pipelineState:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if ([v12 auxiliaryImageType] == 7
    && [(NURAWImageSourceNode *)self shouldGenerateMeteorGainMap]
    || [v12 auxiliaryImageType] == 10)
  {
    id v13 = self;
  }
  else
  {
    v16.receiver = self;
    v16.super_class = (Class)NURAWImageSourceNode;
    id v13 = [(NUCGImageSourceNode *)&v16 resolvedNodeWithCachedInputs:v10 settings:v11 pipelineState:v12 error:a6];
  }
  id v14 = v13;

  return v14;
}

- (BOOL)supportsPipelineState:(id)a3 error:(id *)a4
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (!a4)
  {
    id v10 = NUAssertLogger();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      id v11 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "error != nil");
      *(_DWORD *)buf = 138543362;
      uint64_t v28 = v11;
      _os_log_error_impl(&dword_1A9892000, v10, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    id v13 = NUAssertLogger();
    BOOL v14 = os_log_type_enabled(v13, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v14)
      {
        v17 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v18 = (void *)MEMORY[0x1E4F29060];
        id v19 = v17;
        uint64_t v20 = [v18 callStackSymbols];
        v21 = [v20 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        uint64_t v28 = v17;
        __int16 v29 = 2114;
        v30 = v21;
        _os_log_error_impl(&dword_1A9892000, v13, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v14)
    {
      uint64_t v15 = [MEMORY[0x1E4F29060] callStackSymbols];
      objc_super v16 = [v15 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      uint64_t v28 = v16;
      _os_log_error_impl(&dword_1A9892000, v13, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NURAWImageSourceNode supportsPipelineState:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderSourceNode+RAW.m", 751, @"Invalid parameter not satisfying: %s", v22, v23, v24, v25, (uint64_t)"error != nil");
  }
  v7 = v6;
  if ([v6 mediaComponentType] == 1)
  {
    if ([v7 auxiliaryImageType] == 7
      && [(NURAWImageSourceNode *)self shouldGenerateMeteorGainMap]
      || [v7 auxiliaryImageType] == 10)
    {
      BOOL v8 = 1;
    }
    else
    {
      v26.receiver = self;
      v26.super_class = (Class)NURAWImageSourceNode;
      BOOL v8 = [(NUCGImageSourceNode *)&v26 supportsPipelineState:v7 error:a4];
    }
  }
  else
  {
    +[NUError mismatchError:@"expected image media type" object:v7];
    BOOL v8 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v8;
}

- (BOOL)shouldGenerateMeteorGainMap
{
  v21[1] = *MEMORY[0x1E4F143B8];
  if (+[NUGlobalSettings forceMeteorGainMapGeneration]) {
    return 1;
  }
  if (+[NUGlobalSettings disableMeteorGainMapGeneration])
  {
    return 0;
  }
  v4 = [(NUCGImageSourceNode *)self cgImageProperties];
  v5 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F2FED8]];

  uint64_t v6 = [v5 objectForKeyedSubscript:@"kCGImageSourceMethodVersion"];
  v7 = (void *)v6;
  if (v6)
  {
    uint64_t v20 = @"inputDecoderVersion";
    v21[0] = v6;
    BOOL v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v21 forKeys:&v20 count:1];
    id v17 = 0;
    unint64_t v9 = [(NURAWImageSourceNode *)self sourceOptionsForSettings:v8 error:&v17];
    id v10 = v17;
    if (v9)
    {
      id v16 = 0;
      id v11 = [(NURAWImageSourceNode *)self _rawFiltersWithSourceOptions:v9 error:&v16];
      id v12 = v16;

      if (v11)
      {
        BOOL v3 = [(NURAWImageSourceNode *)self _hasLensCorrectionFilter:v11];
      }
      else
      {
        if (_NULogOnceToken != -1) {
          dispatch_once(&_NULogOnceToken, &__block_literal_global_711);
        }
        BOOL v14 = _NULogger;
        if (os_log_type_enabled((os_log_t)_NULogger, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543362;
          id v19 = v12;
          _os_log_error_impl(&dword_1A9892000, v14, OS_LOG_TYPE_ERROR, "Failed to get RAW filters: %{public}@", buf, 0xCu);
        }
        BOOL v3 = 0;
      }
    }
    else
    {
      if (_NULogOnceToken != -1) {
        dispatch_once(&_NULogOnceToken, &__block_literal_global_711);
      }
      id v13 = _NULogger;
      if (os_log_type_enabled((os_log_t)_NULogger, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        id v19 = v10;
        _os_log_error_impl(&dword_1A9892000, v13, OS_LOG_TYPE_ERROR, "Failed to get RAW source options: %{public}@", buf, 0xCu);
      }
      BOOL v3 = 0;
      id v12 = v10;
    }
  }
  else
  {
    BOOL v3 = 0;
  }

  return v3;
}

- (id)sourceOptionsForSettings:(id)a3 error:(id *)a4
{
  v19[2] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if ([(NUSourceNode *)self isValid:a4])
  {
    uint64_t v7 = [(NURAWImageSourceNode *)self _rawMethodVersionForSettings:v6 error:a4];
    BOOL v8 = (void *)v7;
    if (v7)
    {
      uint64_t v9 = *MEMORY[0x1E4F2FF20];
      v18[0] = *MEMORY[0x1E4F2FF38];
      v18[1] = v9;
      v19[0] = v7;
      v19[1] = @"1";
      id v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:v18 count:2];
      id v11 = [(NURAWImageSourceNode *)self _cachedRawImagePropertiesForOptions:v10 error:a4];
      if (v11)
      {
        id v12 = [v6 objectForKeyedSubscript:v9];
        id v13 = [v11 objectForKeyedSubscript:*MEMORY[0x1E4F2FED8]];
        BOOL v14 = [v13 objectForKeyedSubscript:@"kCGImageSourceSupportedSushiLevels"];

        if (v12 && [v14 containsObject:v12])
        {
          uint64_t v15 = v12;
        }
        else
        {
          uint64_t v15 = @"3";
          if (([v14 containsObject:@"3"] & 1) == 0)
          {
            uint64_t v15 = @"2";
            if (![v14 containsObject:@"2"]) {
              uint64_t v15 = @"1";
            }
          }
        }
        id v16 = [(NURAWImageSourceNode *)self _sourceOptionsForSettings:v6 rawMethodVersion:v8 sushiLevel:v15];
      }
      else
      {
        id v16 = 0;
      }
    }
    else
    {
      id v16 = 0;
    }
  }
  else
  {
    id v16 = 0;
  }

  return v16;
}

- (id)_appendFilter:(id)a3 filterType:(int)a4 settings:(id)a5 source:(id)a6
{
  uint64_t v8 = *(void *)&a4;
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  id v13 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  switch((int)v8)
  {
    case 1:
      BOOL v14 = [NURAWDemosaicNode alloc];
      id v15 = v10;
      uint64_t v16 = 1;
      goto LABEL_22;
    case 2:
      id v17 = [v10 valueForKey:@"inputCropRect"];
      v18 = [NUCropNode alloc];
      [v17 CGRectValue];
      v59.origin.x = v19;
      v59.origin.y = v20;
      v59.size.width = v21;
      v59.size.height = v22;
      NU::RectT<long>::RectT(v58, &v59, 2);
      v57[0] = v58[0];
      v57[1] = v58[1];
      uint64_t v23 = [(NUCropNode *)v18 initWithRect:v57 input:v12];
      goto LABEL_34;
    case 3:
      BOOL v14 = [NURAWGeometryResetNode alloc];
      id v15 = v10;
      uint64_t v16 = 3;
      goto LABEL_22;
    case 4:
      uint64_t v24 = [v11 objectForKeyedSubscript:*MEMORY[0x1E4F1E490]];
      if (v24) {
        [v13 setObject:v24 forKeyedSubscript:@"inputLNRAmount"];
      }
      uint64_t v25 = [v11 objectForKeyedSubscript:@"inputUILuminanceNoiseReductionAmount"];

      if (v25)
      {
        objc_super v26 = [(NUCGImageSourceNode *)self cgImageProperties];
        v27 = [v26 objectForKeyedSubscript:*MEMORY[0x1E4F2FED8]];

        uint64_t v28 = [v27 objectForKeyedSubscript:@"kCGImageSourceLuminanceNoiseReductionAmount"];
        [v28 doubleValue];
        double v30 = v29;

        [v25 doubleValue];
        if (v31 >= 0.0 || v30 <= 0.0) {
          double v32 = v30 + fmin(fmax(v31, 0.0), 1.0) * (1.0 - v30);
        }
        else {
          double v32 = (fmin(fmax(v31, -0.1), 0.0) + 0.1) / 0.1 * v30 + 0.0;
        }
        v49 = [NSNumber numberWithDouble:v32];
        [v13 setObject:v49 forKeyedSubscript:@"inputLNRAmount"];
      }
      v50 = [v11 objectForKeyedSubscript:*MEMORY[0x1E4F1E450]];

      if (v50) {
        [v13 setObject:v50 forKeyedSubscript:@"inputCNRAmount"];
      }
      id v17 = [v11 objectForKeyedSubscript:@"inputUIColorNoiseReductionAmount"];

      if (v17)
      {
        [v17 doubleValue];
        v52 = objc_msgSend(NSNumber, "numberWithDouble:", fmax(fmin((v51 + 1.0) * 0.5, 1.0), 0.0));
        [v13 setObject:v52 forKeyedSubscript:@"inputCNRAmount"];
      }
      v53 = [v11 objectForKeyedSubscript:*MEMORY[0x1E4F1E4D8]];
      [v13 setObject:v53 forKeyedSubscript:@"inputSharpenAmount"];

      int v54 = [v11 objectForKeyedSubscript:*MEMORY[0x1E4F1E4C8]];
      [v13 setObject:v54 forKeyedSubscript:@"inputContrastAmount"];

      int v55 = [v11 objectForKeyedSubscript:*MEMORY[0x1E4F1E4D0]];
      [v13 setObject:v55 forKeyedSubscript:@"inputDetailAmount"];

      int v56 = +[NURenderPipelineFunction functionWithEvaluationBlock:&__block_literal_global_224];
      [v13 setObject:v56 forKeyedSubscript:@"inputScaleFactor"];

      uint64_t v23 = [[NURawFilterNode alloc] initWithRawFilter:v10 type:4 settings:v13 input:v12];
LABEL_34:
      p_super = v23;

      goto LABEL_24;
    case 6:
      BOOL v33 = [(NURAWImageSourceNode *)self _neutralColorArrayForSettings:v11];
      [v13 setObject:v33 forKeyedSubscript:@"inputNeutral"];

      BOOL v14 = [NURawFilterNode alloc];
      id v15 = v10;
      uint64_t v16 = 6;
      goto LABEL_22;
    case 7:
      id v34 = [(NURAWImageSourceNode *)self _neutralColorVectorForSettings:v11];
      [v13 setObject:v34 forKeyedSubscript:@"inputWhitePoint"];

      BOOL v14 = [NURawFilterNode alloc];
      id v15 = v10;
      uint64_t v16 = 7;
      goto LABEL_22;
    case 8:
      char v35 = [(NURAWImageSourceNode *)self _neutralColorVectorForSettings:v11];
      [v13 setObject:v35 forKeyedSubscript:@"inputWhitePoint"];

      v36 = [v11 objectForKeyedSubscript:*MEMORY[0x1E4F1E470]];
      [v13 setObject:v36 forKeyedSubscript:@"inputExposure"];

      BOOL v14 = [NURawFilterNode alloc];
      id v15 = v10;
      uint64_t v16 = 8;
      goto LABEL_22;
    case 9:
      v37 = [v11 objectForKeyedSubscript:*MEMORY[0x1E4F1E470]];
      [v13 setObject:v37 forKeyedSubscript:@"inputExposure"];

      v38 = [v11 objectForKeyedSubscript:*MEMORY[0x1E4F1E420]];
      [v13 setObject:v38 forKeyedSubscript:@"inputBias"];

      BOOL v14 = [NURawFilterNode alloc];
      id v15 = v10;
      uint64_t v16 = 9;
      goto LABEL_22;
    case 10:
      v39 = [v11 objectForKeyedSubscript:@"inputToneMapping"];
      [v13 setObject:v39 forKeyedSubscript:@"inputStrength"];

      BOOL v14 = [NURawFilterNode alloc];
      id v15 = v10;
      uint64_t v16 = 10;
      goto LABEL_22;
    case 11:
      goto LABEL_19;
    case 12:
      id v40 = [v11 objectForKeyedSubscript:*MEMORY[0x1E4F1E428]];
      [v13 setObject:v40 forKeyedSubscript:@"inputBoostAmount"];

      BOOL v14 = [NURawFilterNode alloc];
      id v15 = v10;
      uint64_t v16 = 12;
      goto LABEL_22;
    case 13:
      uint64_t v41 = [v11 objectForKeyedSubscript:@"debugDisableGamutMap"];
      char v42 = [v41 BOOLValue];

      if (v42)
      {
LABEL_19:
        v43 = (NURAWDemosaicNode *)v12;
      }
      else
      {
        BOOL v46 = [v11 objectForKeyedSubscript:@"inputGamutMapMax"];
        [v13 setObject:v46 forKeyedSubscript:@"inputGamutMapMax"];

        BOOL v14 = [NURawFilterNode alloc];
        id v15 = v10;
        uint64_t v16 = 13;
LABEL_22:
        v43 = [(NURawFilterNode *)v14 initWithRawFilter:v15 type:v16 settings:v13 input:v12];
      }
      p_super = &v43->super;
LABEL_24:

      return p_super;
    case 14:
      BOOL v44 = [v11 objectForKeyedSubscript:*MEMORY[0x1E4F1E428]];
      [v13 setObject:v44 forKeyedSubscript:@"inputBoostAmount"];

      BOOL v45 = [v11 objectForKeyedSubscript:*MEMORY[0x1E4F1E430]];
      [v13 setObject:v45 forKeyedSubscript:@"inputBoostShadowAmount"];

      BOOL v14 = [NURawFilterNode alloc];
      id v15 = v10;
      uint64_t v16 = 14;
      goto LABEL_22;
    default:
      BOOL v14 = [NURawFilterNode alloc];
      id v15 = v10;
      uint64_t v16 = v8;
      goto LABEL_22;
  }
}

uint64_t __65__NURAWImageSourceNode__appendFilter_filterType_settings_source___block_invoke(uint64_t a1, void *a2)
{
  v2 = NSNumber;
  uint64_t v3 = [a2 scale];
  double v5 = NUScaleToDouble(v3, v4);

  return [v2 numberWithDouble:v5];
}

- (id)_cachedRawImagePropertiesForOptions:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v7 = [(NSCache *)self->_propertiesByOptionCache objectForKey:v6];
  if (!v7)
  {
    uint64_t v7 = [(NUCGImageSourceNode *)self _evaluateRawImagePropertiesWithSourceOptions:v6 error:a4];
    if (v7)
    {
      propertiesByOptionCache = self->_propertiesByOptionCache;
      uint64_t v9 = (void *)[v6 copy];
      [(NSCache *)propertiesByOptionCache setObject:v7 forKey:v9];
    }
  }

  return v7;
}

- (id)_sourceOptionsForSettings:(id)a3 rawMethodVersion:(id)a4 sushiLevel:(id)a5
{
  uint64_t v60 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (!v9)
  {
    CGFloat v22 = NUAssertLogger();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      uint64_t v23 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "rawMethodVersion != nil");
      *(_DWORD *)buf = 138543362;
      v57 = v23;
      _os_log_error_impl(&dword_1A9892000, v22, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    uint64_t v25 = NUAssertLogger();
    BOOL v26 = os_log_type_enabled(v25, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v26)
      {
        v36 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v37 = (void *)MEMORY[0x1E4F29060];
        id v38 = v36;
        v39 = [v37 callStackSymbols];
        id v40 = [v39 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v57 = v36;
        __int16 v58 = 2114;
        CGRect v59 = v40;
        _os_log_error_impl(&dword_1A9892000, v25, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v26)
    {
      v27 = [MEMORY[0x1E4F29060] callStackSymbols];
      uint64_t v28 = [v27 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v57 = v28;
      _os_log_error_impl(&dword_1A9892000, v25, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NURAWImageSourceNode _sourceOptionsForSettings:rawMethodVersion:sushiLevel:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderSourceNode+RAW.m", 412, @"Invalid parameter not satisfying: %s", v41, v42, v43, v44, (uint64_t)"rawMethodVersion != nil");
  }
  id v11 = v10;
  if (!v10)
  {
    double v29 = NUAssertLogger();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      double v30 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "sushiLevel != nil");
      *(_DWORD *)buf = 138543362;
      v57 = v30;
      _os_log_error_impl(&dword_1A9892000, v29, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    double v31 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    double v32 = NUAssertLogger();
    BOOL v33 = os_log_type_enabled(v32, OS_LOG_TYPE_ERROR);
    if (v31)
    {
      if (v33)
      {
        BOOL v45 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        BOOL v46 = (void *)MEMORY[0x1E4F29060];
        id v47 = v45;
        uint64_t v48 = [v46 callStackSymbols];
        v49 = [v48 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v57 = v45;
        __int16 v58 = 2114;
        CGRect v59 = v49;
        _os_log_error_impl(&dword_1A9892000, v32, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v33)
    {
      id v34 = [MEMORY[0x1E4F29060] callStackSymbols];
      char v35 = [v34 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v57 = v35;
      _os_log_error_impl(&dword_1A9892000, v32, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NURAWImageSourceNode _sourceOptionsForSettings:rawMethodVersion:sushiLevel:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderSourceNode+RAW.m", 413, @"Invalid parameter not satisfying: %s", v50, v51, v52, v53, (uint64_t)"sushiLevel != nil");
  }
  id v12 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  [v12 setObject:v9 forKeyedSubscript:*MEMORY[0x1E4F2FF38]];
  [v12 setObject:v11 forKeyedSubscript:*MEMORY[0x1E4F2FF20]];
  if ([v9 integerValue] > 5)
  {
    if (![v11 isEqualToString:@"1"]) {
      goto LABEL_10;
    }
    id v14 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    uint64_t v16 = [v8 objectForKeyedSubscript:*MEMORY[0x1E4F1E490]];
    [v14 setObject:v16 forKeyedSubscript:@"kCGImageSourceLuminanceNoiseReductionAmount"];

    id v17 = [v8 objectForKeyedSubscript:*MEMORY[0x1E4F1E450]];
    [v14 setObject:v17 forKeyedSubscript:@"kCGImageSourceColorNoiseReductionAmount"];

    v18 = [v8 objectForKeyedSubscript:*MEMORY[0x1E4F1E4D8]];
    [v14 setObject:v18 forKeyedSubscript:@"kCGImageSourceNoiseReductionSharpnessAmount"];

    CGFloat v19 = [v8 objectForKeyedSubscript:*MEMORY[0x1E4F1E4C8]];
    [v14 setObject:v19 forKeyedSubscript:@"kCGImageSourceNoiseReductionContrastAmount"];

    CGFloat v20 = [v8 objectForKeyedSubscript:*MEMORY[0x1E4F1E4D0]];
    [v14 setObject:v20 forKeyedSubscript:@"kCGImageSourceNoiseReductionDetailAmount"];

    if ([v14 count]) {
      [v12 setObject:v14 forKeyedSubscript:*MEMORY[0x1E4F2FED8]];
    }
  }
  else
  {
    uint64_t v13 = [(NURAWImageSourceNode *)self _neutralColorArrayForSettings:v8];
    id v14 = (id)v13;
    if (v13)
    {
      int v54 = @"kCGImageSourceNeutral";
      uint64_t v55 = v13;
      id v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v55 forKeys:&v54 count:1];
      [v12 setObject:v15 forKeyedSubscript:*MEMORY[0x1E4F2FED8]];
    }
  }

LABEL_10:

  return v12;
}

- (id)_neutralColorVectorForSettings:(id)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  double v5 = [(NURAWImageSourceNode *)self _neutralColorArrayForSettings:v4];
  id v6 = v5;
  if (v5)
  {
    if ([v5 count] != 2)
    {
      id v15 = NUAssertLogger();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        uint64_t v16 = [NSString stringWithFormat:@"Incorrect count for neutral: %@, %@", v6, v4];
        *(_DWORD *)buf = 138543362;
        double v32 = v16;
        _os_log_error_impl(&dword_1A9892000, v15, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
      }
      specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
      v18 = NUAssertLogger();
      BOOL v19 = os_log_type_enabled(v18, OS_LOG_TYPE_ERROR);
      if (specific)
      {
        if (v19)
        {
          CGFloat v22 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
          uint64_t v23 = (void *)MEMORY[0x1E4F29060];
          id v24 = v22;
          uint64_t v25 = [v23 callStackSymbols];
          BOOL v26 = [v25 componentsJoinedByString:@"\n"];
          *(_DWORD *)buf = 138543618;
          double v32 = v22;
          __int16 v33 = 2114;
          id v34 = v26;
          _os_log_error_impl(&dword_1A9892000, v18, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
        }
      }
      else if (v19)
      {
        CGFloat v20 = [MEMORY[0x1E4F29060] callStackSymbols];
        CGFloat v21 = [v20 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543362;
        double v32 = v21;
        _os_log_error_impl(&dword_1A9892000, v18, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
      }
      _NUAssertFailHandler((uint64_t)"-[NURAWImageSourceNode _neutralColorVectorForSettings:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderSourceNode+RAW.m", 401, @"Incorrect count for neutral: %@, %@", v27, v28, v29, v30, (uint64_t)v6);
    }
    uint64_t v7 = (void *)MEMORY[0x1E4F1E080];
    id v8 = [v6 objectAtIndexedSubscript:0];
    [v8 doubleValue];
    double v10 = v9;
    id v11 = [v6 objectAtIndexedSubscript:1];
    [v11 doubleValue];
    uint64_t v13 = [v7 vectorWithX:v10 Y:v12];
  }
  else
  {
    uint64_t v13 = 0;
  }

  return v13;
}

- (id)_neutralColorArrayForSettings:(id)a3
{
  v22[2] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = [v3 objectForKeyedSubscript:*MEMORY[0x1E4F1E4B8]];
  uint64_t v5 = [v3 objectForKeyedSubscript:*MEMORY[0x1E4F1E4C0]];
  id v6 = (void *)v5;
  if (v4) {
    BOOL v7 = v5 == 0;
  }
  else {
    BOOL v7 = 1;
  }
  if (v7)
  {
    id v14 = [v3 objectForKeyedSubscript:*MEMORY[0x1E4F1E4A8]];
    uint64_t v8 = [v3 objectForKeyedSubscript:*MEMORY[0x1E4F1E4B0]];
    id v15 = (void *)v8;
    if (v14) {
      BOOL v9 = v8 == 0;
    }
    else {
      BOOL v9 = 1;
    }
    if (v9)
    {
      double v10 = 0;
      goto LABEL_13;
    }
    v21[0] = v14;
    v21[1] = v8;
    uint64_t v16 = (void *)MEMORY[0x1E4F1C978];
    id v17 = v21;
  }
  else
  {
    double v19 = 0.0;
    double v20 = 0.0;
    [v4 doubleValue];
    double v12 = v11;
    [v6 doubleValue];
    nu_tempTint_to_xy(&v20, &v19, v12, v13);
    id v14 = [NSNumber numberWithDouble:v20];
    v22[0] = v14;
    id v15 = [NSNumber numberWithDouble:v19];
    v22[1] = v15;
    uint64_t v16 = (void *)MEMORY[0x1E4F1C978];
    id v17 = v22;
  }
  double v10 = [v16 arrayWithObjects:v17 count:2];
LABEL_13:

  return v10;
}

- (id)_rawMethodVersionForSettings:(id)a3 error:(id *)a4
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (!a4)
  {
    id v17 = NUAssertLogger();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      v18 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "error != nil");
      *(_DWORD *)buf = 138543362;
      uint64_t v50 = v18;
      _os_log_error_impl(&dword_1A9892000, v17, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    double v20 = NUAssertLogger();
    BOOL v21 = os_log_type_enabled(v20, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v21)
      {
        double v31 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        double v32 = (void *)MEMORY[0x1E4F29060];
        id v33 = v31;
        id v34 = [v32 callStackSymbols];
        uint64_t v35 = [v34 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        uint64_t v50 = v31;
        __int16 v51 = 2114;
        uint64_t v52 = v35;
        _os_log_error_impl(&dword_1A9892000, v20, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v21)
    {
      CGFloat v22 = [MEMORY[0x1E4F29060] callStackSymbols];
      uint64_t v23 = [v22 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      uint64_t v50 = v23;
      _os_log_error_impl(&dword_1A9892000, v20, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NURAWImageSourceNode _rawMethodVersionForSettings:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderSourceNode+RAW.m", 353, @"Invalid parameter not satisfying: %s", v36, v37, v38, v39, (uint64_t)"error != nil");
  }
  BOOL v7 = v6;
  uint64_t v8 = [(NUCGImageSourceNode *)self cgImageProperties];
  BOOL v9 = [v8 objectForKeyedSubscript:*MEMORY[0x1E4F2FED8]];

  uint64_t v10 = [v9 objectForKeyedSubscript:*MEMORY[0x1E4F2FED0]];
  if (!v10)
  {
    id v24 = NUAssertLogger();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      uint64_t v25 = [NSString stringWithFormat:@"No kCISupportedDecoderVersionsKey available: %@", self];
      *(_DWORD *)buf = 138543362;
      uint64_t v50 = v25;
      _os_log_error_impl(&dword_1A9892000, v24, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    BOOL v26 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    uint64_t v27 = NUAssertLogger();
    BOOL v28 = os_log_type_enabled(v27, OS_LOG_TYPE_ERROR);
    if (v26)
    {
      if (v28)
      {
        id v40 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        uint64_t v41 = (void *)MEMORY[0x1E4F29060];
        id v42 = v40;
        uint64_t v43 = [v41 callStackSymbols];
        uint64_t v44 = [v43 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        uint64_t v50 = v40;
        __int16 v51 = 2114;
        uint64_t v52 = v44;
        _os_log_error_impl(&dword_1A9892000, v27, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v28)
    {
      uint64_t v29 = [MEMORY[0x1E4F29060] callStackSymbols];
      uint64_t v30 = [v29 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      uint64_t v50 = v30;
      _os_log_error_impl(&dword_1A9892000, v27, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NURAWImageSourceNode _rawMethodVersionForSettings:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderSourceNode+RAW.m", 359, @"No kCISupportedDecoderVersionsKey available: %@", v45, v46, v47, v48, (uint64_t)self);
  }
  double v11 = (void *)v10;
  uint64_t v12 = [v7 objectForKeyedSubscript:*MEMORY[0x1E4F1E460]];
  if (v12)
  {
    double v13 = (void *)v12;
    if (([v11 containsObject:v12] & 1) == 0)
    {
      if (_NULogOnceToken != -1) {
        dispatch_once(&_NULogOnceToken, &__block_literal_global_711);
      }
      id v14 = _NULogger;
      if (os_log_type_enabled((os_log_t)_NULogger, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412546;
        uint64_t v50 = v13;
        __int16 v51 = 2112;
        uint64_t v52 = v11;
        _os_log_impl(&dword_1A9892000, v14, OS_LOG_TYPE_INFO, "Requested kCIInputDecoderVersionKey %@ is not available: %@, falling back to newest", buf, 0x16u);
      }
      uint64_t v15 = [v11 lastObject];

      double v13 = (void *)v15;
    }
  }
  else
  {
    double v13 = [v11 lastObject];
  }

  return v13;
}

- (BOOL)load:(id *)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  if (!a3)
  {
    uint64_t v10 = NUAssertLogger();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      double v11 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "error != nil");
      *(_DWORD *)buf = 138543362;
      BOOL v28 = v11;
      _os_log_error_impl(&dword_1A9892000, v10, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    double v13 = NUAssertLogger();
    BOOL v14 = os_log_type_enabled(v13, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v14)
      {
        id v17 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v18 = (void *)MEMORY[0x1E4F29060];
        id v19 = v17;
        double v20 = [v18 callStackSymbols];
        BOOL v21 = [v20 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        BOOL v28 = v17;
        __int16 v29 = 2114;
        uint64_t v30 = v21;
        _os_log_error_impl(&dword_1A9892000, v13, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v14)
    {
      uint64_t v15 = [MEMORY[0x1E4F29060] callStackSymbols];
      uint64_t v16 = [v15 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      BOOL v28 = v16;
      _os_log_error_impl(&dword_1A9892000, v13, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NURAWImageSourceNode load:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderSourceNode+RAW.m", 337, @"Invalid parameter not satisfying: %s", v22, v23, v24, v25, (uint64_t)"error != nil");
  }
  v26.receiver = self;
  v26.super_class = (Class)NURAWImageSourceNode;
  BOOL v5 = -[NUCGImageSourceNode load:](&v26, sel_load_);
  id v6 = [(NUCGImageSourceNode *)self cgImageProperties];
  BOOL v7 = v6;
  if (v6)
  {
    uint64_t v8 = [v6 objectForKeyedSubscript:*MEMORY[0x1E4F2FED8]];

    if (!v8)
    {
      +[NUError unsupportedError:@"Unsupported RAW source" object:self];
      BOOL v5 = 0;
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }
  }

  return v5;
}

- (id)_evaluateImageWithSourceOptions:(id)a3 subsampleFactor:(int64_t *)a4 error:(id *)a5
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  if (!a4)
  {
    BOOL v14 = NUAssertLogger();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      uint64_t v15 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "subsampleFactor != NULL");
      *(_DWORD *)buf = 138543362;
      double v32 = v15;
      _os_log_error_impl(&dword_1A9892000, v14, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    id v17 = NUAssertLogger();
    BOOL v18 = os_log_type_enabled(v17, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v18)
      {
        BOOL v21 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        uint64_t v22 = (void *)MEMORY[0x1E4F29060];
        id v23 = v21;
        uint64_t v24 = [v22 callStackSymbols];
        uint64_t v25 = [v24 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        double v32 = v21;
        __int16 v33 = 2114;
        id v34 = v25;
        _os_log_error_impl(&dword_1A9892000, v17, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v18)
    {
      id v19 = [MEMORY[0x1E4F29060] callStackSymbols];
      double v20 = [v19 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      double v32 = v20;
      _os_log_error_impl(&dword_1A9892000, v17, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NURAWImageSourceNode _evaluateImageWithSourceOptions:subsampleFactor:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderSourceNode+RAW.m", 321, @"Invalid parameter not satisfying: %s", v26, v27, v28, v29, (uint64_t)"subsampleFactor != NULL");
  }
  BOOL v9 = v8;
  uint64_t v10 = [v8 objectForKeyedSubscript:*MEMORY[0x1E4F2FF38]];
  int v11 = [v10 intValue];

  if (v11 <= 5 && *a4 >= 2) {
    *a4 = 1;
  }
  v30.receiver = self;
  v30.super_class = (Class)NURAWImageSourceNode;
  uint64_t v12 = [(NUCGImageSourceNode *)&v30 _evaluateImageWithSourceOptions:v9 subsampleFactor:a4 error:a5];

  return v12;
}

- (id)_evaluateImageGeometryWithSourceOptions:(id)a3 error:(id *)a4
{
  v6.receiver = self;
  v6.super_class = (Class)NURAWImageSourceNode;
  id v4 = [(NUCGImageSourceNode *)&v6 _evaluateImageGeometryWithSourceOptions:a3 error:a4];

  return v4;
}

- (id)_evaluateImagePropertiesWithSourceOptions:(id)a3 error:(id *)a4
{
  v7.receiver = self;
  v7.super_class = (Class)NURAWImageSourceNode;
  BOOL v5 = [(NUCGImageSourceNode *)&v7 _evaluateImagePropertiesWithSourceOptions:a3 error:a4];
  [(NURAWImageSourceNode *)self _processRAWProperties:v5];

  return v5;
}

- (void)_processRAWProperties:(id)a3
{
  id v50 = a3;
  id v4 = [v50 metadata];
  uint64_t v5 = *MEMORY[0x1E4F2FD18];
  uint64_t v6 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F2FD18]];

  objc_super v7 = [v50 metadata];
  uint64_t v8 = *MEMORY[0x1E4F2FED8];
  uint64_t v9 = [v7 objectForKeyedSubscript:*MEMORY[0x1E4F2FED8]];

  if (!(v6 | v9)) {
    goto LABEL_7;
  }
  uint64_t v10 = [v50 metadata];
  int v11 = (void *)[v10 mutableCopy];

  [v11 removeObjectForKey:v5];
  [v11 removeObjectForKey:v8];
  [v50 setMetadata:v11];

  if (!v6 || v9 == 0)
  {
LABEL_7:
    double v13 = 0;
  }
  else
  {
    double v13 = objc_alloc_init(_NURAWImageProperties);
    BOOL v14 = [(id)v9 objectForKeyedSubscript:@"kCGImageSourceMethodVersion"];
    [(_NURAWImageProperties *)v13 setDecoderVersion:v14];

    uint64_t v15 = [(id)v9 objectForKeyedSubscript:*MEMORY[0x1E4F2FED0]];
    [(_NURAWImageProperties *)v13 setAvailableDecoderVersions:v15];

    uint64_t v16 = [(id)v6 objectForKeyedSubscript:@"wx"];
    uint64_t v17 = [(id)v6 objectForKeyedSubscript:@"wy"];
    BOOL v18 = (void *)v17;
    if (v16 && v17)
    {
      double v51 = 0.0;
      double v52 = 0.0;
      [v16 doubleValue];
      double v20 = v19;
      [v18 doubleValue];
      nu_xy_to_tempTint(&v52, &v51, v20, v21);
      [(_NURAWImageProperties *)v13 setTemperature:v52];
      double v22 = v51;
    }
    else
    {
      [(_NURAWImageProperties *)v13 setTemperature:5000.0];
      double v22 = 0.0;
    }
    [(_NURAWImageProperties *)v13 setTint:v22];
  }
  id v23 = [(id)v9 objectForKeyedSubscript:@"kCGImageSourceLuminanceNoiseReductionAmount"];

  if (v23)
  {
    uint64_t v24 = objc_alloc_init(_NURAWNoiseReductionProperties);
    uint64_t v25 = [(id)v9 objectForKeyedSubscript:@"kCGImageSourceLuminanceNoiseReductionAmount"];
    [v25 doubleValue];
    -[_NURAWNoiseReductionProperties setLuminance:](v24, "setLuminance:");

    uint64_t v26 = [(id)v9 objectForKeyedSubscript:@"kCGImageSourceColorNoiseReductionAmount"];
    [v26 doubleValue];
    -[_NURAWNoiseReductionProperties setColor:](v24, "setColor:");

    uint64_t v27 = [(id)v9 objectForKeyedSubscript:@"kCGImageSourceNoiseReductionSharpnessAmount"];
    [v27 doubleValue];
    -[_NURAWNoiseReductionProperties setSharpness:](v24, "setSharpness:");

    uint64_t v28 = [(id)v9 objectForKeyedSubscript:@"kCGImageSourceNoiseReductionContrastAmount"];
    [v28 doubleValue];
    -[_NURAWNoiseReductionProperties setContrast:](v24, "setContrast:");

    uint64_t v29 = [(id)v9 objectForKeyedSubscript:@"kCGImageSourceNoiseReductionDetailAmount"];
    [v29 doubleValue];
    -[_NURAWNoiseReductionProperties setDetail:](v24, "setDetail:");

    [(_NURAWImageProperties *)v13 setNoiseReductionProperties:v24];
  }
  objc_super v30 = [(id)v6 objectForKeyedSubscript:@"filters"];
  uint64_t v31 = [(NURAWImageSourceNode *)self _RAWCameraSpaceProperties:v30 RAWProperties:v13];
  [(_NURAWImageProperties *)v13 setRawCameraSpaceProperties:v31];

  double v32 = [(id)v6 objectForKeyedSubscript:@"filters"];
  __int16 v33 = [(NURAWImageSourceNode *)self _RAWToneCurveProperties:v32];
  [(_NURAWImageProperties *)v13 setRawToneCurveProperties:v33];

  id v34 = [v50 metadata];
  uint64_t v35 = [v34 objectForKeyedSubscript:*MEMORY[0x1E4F2FC20]];

  uint64_t v36 = *MEMORY[0x1E4F15578];
  uint64_t v37 = [v35 objectForKeyedSubscript:*MEMORY[0x1E4F15578]];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    uint64_t v39 = [v35 objectForKeyedSubscript:v36];
    int v40 = [v39 unsignedIntValue];

    if ((v40 & 0x10000) != 0) {
      [(_NURAWImageProperties *)v13 setIsAppleProRaw:1];
    }
  }
  uint64_t v41 = [v35 objectForKeyedSubscript:@"23"];
  objc_opt_class();
  char v42 = objc_opt_isKindOfClass();

  if (v42)
  {
    uint64_t v43 = [v35 objectForKeyedSubscript:@"23"];
    int v44 = [v43 unsignedLongLongValue];

    if ((v44 & 4) != 0) {
      [(_NURAWImageProperties *)v13 setIsSensorRawCapture:1];
    }
    if ((v44 & 0x100000) != 0) {
      [(_NURAWImageProperties *)v13 setIsUnifiedBracketingHDRCapture:1];
    }
  }
  uint64_t v45 = [v35 objectForKeyedSubscript:@"20"];
  objc_opt_class();
  char v46 = objc_opt_isKindOfClass();

  if (v46)
  {
    uint64_t v47 = [v35 objectForKeyedSubscript:@"20"];
    int v48 = [v47 intValue];

    if (v48 == 12) {
      [(_NURAWImageProperties *)v13 setIsDeepFusion:1];
    }
  }
  v49 = [(id)v6 objectForKeyedSubscript:@"filters"];
  [(_NURAWImageProperties *)v13 setHasLensCorrection:[(NURAWImageSourceNode *)self _hasLensCorrectionFilter:v49]];

  [v50 setRawProperties:v13];
}

- (BOOL)_hasLensCorrectionFilter:(id)a3
{
  id v3 = a3;
  id v4 = [(id)objc_opt_class() _firstFilterOfType:5 inArray:v3];

  return v4 != 0;
}

- (id)_RAWToneCurveProperties:(id)a3
{
  id v3 = a3;
  id v4 = [(id)objc_opt_class() _firstFilterOfType:14 inArray:v3];
  if (v4)
  {
    uint64_t v5 = [(id)objc_opt_class() _firstFilterOfType:10 inArray:v3];
    uint64_t v6 = [[_NURAWToneCurveProperties alloc] initWithToneCurveFilter:v4 gainMapTableFilter:v5];
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

- (id)_RAWCameraSpaceProperties:(id)a3 RAWProperties:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  objc_super v7 = [(id)objc_opt_class() _firstFilterOfType:6 inArray:v6];

  [v5 setRawConvert:v7];
  uint64_t v8 = [v5 rawConvert];

  if (v8)
  {
    uint64_t v8 = objc_alloc_init(_NURAWCameraSpaceProperties);
    uint64_t v9 = [v5 rawConvert];
    uint64_t v10 = [v9 valueForKey:@"inputXYZtoCamera1"];
    [(_NURAWCameraSpaceProperties *)v8 setXyzToCamera1:v10];

    int v11 = [v5 rawConvert];
    uint64_t v12 = [v11 valueForKey:@"inputXYZtoCamera2"];
    [(_NURAWCameraSpaceProperties *)v8 setXyzToCamera2:v12];

    double v13 = [v5 rawConvert];
    BOOL v14 = [v13 valueForKey:@"inputRange"];
    [v14 doubleValue];
    -[_NURAWCameraSpaceProperties setWhiteValue:](v8, "setWhiteValue:");

    uint64_t v15 = [v5 rawConvert];
    uint64_t v16 = [v15 valueForKey:@"inputFactor"];
    [v16 doubleValue];
    -[_NURAWCameraSpaceProperties setWhiteFactor:](v8, "setWhiteFactor:");
  }

  return v8;
}

- (void)_addDefaultFinalizedSourceOptions:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)NURAWImageSourceNode;
  id v3 = a3;
  [(NUCGImageSourceNode *)&v5 _addDefaultFinalizedSourceOptions:v3];
  uint64_t v4 = MEMORY[0x1E4F1CC38];
  objc_msgSend(v3, "setObject:forKeyedSubscript:", MEMORY[0x1E4F1CC38], *MEMORY[0x1E4F2FEC8], v5.receiver, v5.super_class);
  [v3 setObject:@"1" forKeyedSubscript:*MEMORY[0x1E4F2FF20]];
  [v3 setObject:v4 forKeyedSubscript:@"kCGImageSourceShouldUseRawDataForFullSize"];
}

- (NURAWImageSourceNode)initWithURL:(id)a3 UTI:(id)a4 settings:(id)a5
{
  v9.receiver = self;
  v9.super_class = (Class)NURAWImageSourceNode;
  objc_super v5 = [(NUCGImageSourceNode *)&v9 initWithURL:a3 UTI:a4 settings:a5];
  id v6 = (NSCache *)objc_alloc_init(MEMORY[0x1E4F1C998]);
  propertiesByOptionCache = v5->_propertiesByOptionCache;
  v5->_propertiesByOptionCache = v6;

  [(NSCache *)v5->_propertiesByOptionCache setName:@"NURAWImageSourceNode.propertiesCache"];
  [(NSCache *)v5->_propertiesByOptionCache setCountLimit:8];
  return v5;
}

- (NURAWImageSourceNode)initWithURL:(id)a3 UTI:(id)a4 identifier:(id)a5
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (!v8)
  {
    uint64_t v15 = NUAssertLogger();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      uint64_t v16 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "URL != nil");
      *(_DWORD *)buf = 138543362;
      id v50 = v16;
      _os_log_error_impl(&dword_1A9892000, v15, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    BOOL v18 = NUAssertLogger();
    BOOL v19 = os_log_type_enabled(v18, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v19)
      {
        uint64_t v29 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        objc_super v30 = (void *)MEMORY[0x1E4F29060];
        id v31 = v29;
        double v32 = [v30 callStackSymbols];
        __int16 v33 = [v32 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        id v50 = v29;
        __int16 v51 = 2114;
        double v52 = v33;
        _os_log_error_impl(&dword_1A9892000, v18, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v19)
    {
      double v20 = [MEMORY[0x1E4F29060] callStackSymbols];
      double v21 = [v20 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      id v50 = v21;
      _os_log_error_impl(&dword_1A9892000, v18, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NURAWImageSourceNode initWithURL:UTI:identifier:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderSourceNode+RAW.m", 135, @"Invalid parameter not satisfying: %s", v34, v35, v36, v37, (uint64_t)"URL != nil");
  }
  int v11 = v10;
  if (!v10)
  {
    double v22 = NUAssertLogger();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      id v23 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "identifier != nil");
      *(_DWORD *)buf = 138543362;
      id v50 = v23;
      _os_log_error_impl(&dword_1A9892000, v22, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    uint64_t v24 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    uint64_t v25 = NUAssertLogger();
    BOOL v26 = os_log_type_enabled(v25, OS_LOG_TYPE_ERROR);
    if (v24)
    {
      if (v26)
      {
        uint64_t v38 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        uint64_t v39 = (void *)MEMORY[0x1E4F29060];
        id v40 = v38;
        uint64_t v41 = [v39 callStackSymbols];
        char v42 = [v41 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        id v50 = v38;
        __int16 v51 = 2114;
        double v52 = v42;
        _os_log_error_impl(&dword_1A9892000, v25, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v26)
    {
      uint64_t v27 = [MEMORY[0x1E4F29060] callStackSymbols];
      uint64_t v28 = [v27 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      id v50 = v28;
      _os_log_error_impl(&dword_1A9892000, v25, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NURAWImageSourceNode initWithURL:UTI:identifier:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderSourceNode+RAW.m", 136, @"Invalid parameter not satisfying: %s", v43, v44, v45, v46, (uint64_t)"identifier != nil");
  }
  v47[0] = @"asRAW";
  v47[1] = @"identifier";
  v48[0] = MEMORY[0x1E4F1CC38];
  v48[1] = v10;
  uint64_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v48 forKeys:v47 count:2];
  double v13 = [(NURAWImageSourceNode *)self initWithURL:v8 UTI:v9 settings:v12];

  return v13;
}

- (NURAWImageSourceNode)initWithImageSource:(CGImageSource *)a3 identifier:(id)a4
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  if (_NULogOnceToken != -1) {
    dispatch_once(&_NULogOnceToken, &__block_literal_global_709);
  }
  id v6 = (void *)_NUAssertLogger;
  if (os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR))
  {
    objc_super v7 = NSString;
    id v8 = v6;
    id v9 = (objc_class *)objc_opt_class();
    id v10 = NSStringFromClass(v9);
    int v11 = NSStringFromSelector(a2);
    uint64_t v12 = [v7 stringWithFormat:@"Initializer not available: -[%@ %@], use designated initializer instead.", v10, v11];
    *(_DWORD *)buf = 138543362;
    double v32 = v12;
    _os_log_error_impl(&dword_1A9892000, v8, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    uint64_t v13 = _NULogOnceToken;
    if (!dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey))
    {
      if (v13 != -1) {
        dispatch_once(&_NULogOnceToken, &__block_literal_global_709);
      }
      goto LABEL_8;
    }
    if (v13 != -1) {
      dispatch_once(&_NULogOnceToken, &__block_literal_global_709);
    }
  }
  else if (!dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey))
  {
LABEL_8:
    BOOL v14 = (void *)_NUAssertLogger;
    if (!os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR)) {
      goto LABEL_15;
    }
    uint64_t v15 = (void *)MEMORY[0x1E4F29060];
    uint64_t v16 = v14;
    uint64_t v17 = [v15 callStackSymbols];
    BOOL v18 = [v17 componentsJoinedByString:@"\n"];
    *(_DWORD *)buf = 138543362;
    double v32 = v18;
    _os_log_error_impl(&dword_1A9892000, v16, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    goto LABEL_14;
  }
  BOOL v19 = (void *)_NUAssertLogger;
  if (!os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR)) {
    goto LABEL_15;
  }
  specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
  double v21 = (void *)MEMORY[0x1E4F29060];
  id v22 = specific;
  uint64_t v16 = v19;
  id v23 = [v21 callStackSymbols];
  uint64_t v24 = [v23 componentsJoinedByString:@"\n"];
  *(_DWORD *)buf = 138543618;
  double v32 = specific;
  __int16 v33 = 2114;
  uint64_t v34 = v24;
  _os_log_error_impl(&dword_1A9892000, v16, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

LABEL_14:
LABEL_15:
  uint64_t v25 = (objc_class *)objc_opt_class();
  uint64_t v26 = NSStringFromClass(v25);
  NSStringFromSelector(a2);
  objc_claimAutoreleasedReturnValue();
  _NUAssertFailHandler((uint64_t)"-[NURAWImageSourceNode initWithImageSource:identifier:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderSourceNode+RAW.m", 130, @"Initializer not available: -[%@ %@], use designated initializer instead.", v27, v28, v29, v30, v26);
}

+ (int)_filterTypeForClassName:(id)a3
{
  id v3 = a3;
  if (_filterTypeForClassName__onceToken != -1) {
    dispatch_once(&_filterTypeForClassName__onceToken, &__block_literal_global);
  }
  uint64_t v4 = [(id)_filterTypeForClassName__typeMapping objectForKeyedSubscript:v3];
  id v5 = v4;
  if (v4) {
    int v6 = [v4 unsignedIntegerValue];
  }
  else {
    int v6 = 0;
  }

  return v6;
}

void __48__NURAWImageSourceNode__filterTypeForClassName___block_invoke()
{
  v0 = (void *)_filterTypeForClassName__typeMapping;
  _filterTypeForClassName__typeMapping = (uint64_t)&unk_1F004A280;
}

+ (id)_firstFilterOfType:(int)a3 inArray:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v6 = a4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v17;
    while (2)
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(v6);
        }
        int v11 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        uint64_t v12 = objc_msgSend(v11, "attributes", (void)v16);
        uint64_t v13 = [v12 objectForKeyedSubscript:@"CIAttributeFilterName"];

        if ([a1 _filterTypeForClassName:v13] == a3)
        {
          id v14 = v11;

          goto LABEL_11;
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
  id v14 = 0;
LABEL_11:

  return v14;
}

@end