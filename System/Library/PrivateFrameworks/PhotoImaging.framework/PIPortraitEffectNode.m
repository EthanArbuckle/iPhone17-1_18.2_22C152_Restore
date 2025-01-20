@interface PIPortraitEffectNode
- (BOOL)canPropagateOriginalAuxiliaryData:(int64_t)a3;
- (BOOL)isPortraitMono;
- (BOOL)isPortraitStage;
- (PIPortraitEffectNode)initWithInput:(id)a3 blurMap:(id)a4 settings:(id)a5;
- (PIPortraitEffectNode)initWithSettings:(id)a3 inputs:(id)a4;
- (id)nodeByReplayingAgainstCache:(id)a3 pipelineState:(id)a4 error:(id *)a5;
- (int64_t)portraitVersion;
@end

@implementation PIPortraitEffectNode

- (id)nodeByReplayingAgainstCache:(id)a3 pipelineState:(id)a4 error:(id *)a5
{
  uint64_t v158 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  if (!a5)
  {
    v112 = NUAssertLogger_15192();
    if (os_log_type_enabled(v112, OS_LOG_TYPE_ERROR))
    {
      v113 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "error != NULL");
      *(_DWORD *)buf = 138543362;
      v155 = v113;
      _os_log_error_impl(&dword_1A9680000, v112, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    v114 = (const void **)MEMORY[0x1E4F7A308];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    v116 = NUAssertLogger_15192();
    BOOL v117 = os_log_type_enabled(v116, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v117)
      {
        v120 = dispatch_get_specific(*v114);
        v121 = (void *)MEMORY[0x1E4F29060];
        id v122 = v120;
        v123 = [v121 callStackSymbols];
        v124 = [v123 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v155 = v120;
        __int16 v156 = 2114;
        v157 = v124;
        _os_log_error_impl(&dword_1A9680000, v116, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v117)
    {
      v118 = [MEMORY[0x1E4F29060] callStackSymbols];
      v119 = [v118 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v155 = v119;
      _os_log_error_impl(&dword_1A9680000, v116, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler();
  }
  v10 = v9;
  if ([v9 evaluationMode] != 1)
  {
    [MEMORY[0x1E4F7A438] unsupportedError:@"Portrait Effect only applies to images" object:0];
    id v27 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_85;
  }
  if ([v10 auxiliaryImageType] != 1 && objc_msgSend(v10, "auxiliaryImageType") != 7)
  {
    v28 = [(PIPortraitNode *)self input];
    id v27 = [v28 nodeByReplayingAgainstCache:v8 pipelineState:v10 error:a5];

    goto LABEL_85;
  }
  v11 = [(PIPortraitNode *)self input];
  uint64_t v12 = [v11 imageProperties:a5];

  v144 = (void *)v12;
  if (v12)
  {
    v13 = [(PIPortraitNode *)self input];
    v14 = [v13 nodeByReplayingAgainstCache:v8 pipelineState:v10 error:a5];

    if (!v14)
    {
      id v27 = 0;
LABEL_83:

      goto LABEL_84;
    }
    v15 = [MEMORY[0x1E4F1CA60] dictionary];
    v16 = [(NURenderNode *)self settings];
    v17 = [v16 objectForKeyedSubscript:@"portraitInfo"];

    v18 = [v17 objectForKeyedSubscript:@"faceLandmarks"];
    [v15 setObject:v18 forKeyedSubscript:@"inputFaceLandmarkArray"];

    v140 = v17;
    v19 = [v17 objectForKeyedSubscript:@"faceLandmarks"];
    uint64_t v20 = [v19 count];

    v142 = (void *)[v10 copy];
    v21 = [v144 auxiliaryImagePropertiesForType:3];
    v22 = 0;
    v141 = v15;
    if (v21)
    {
      v143 = 0;
      if (v20)
      {
        [v142 setAuxiliaryImageType:3];
        [v144 size];
        [v21 size];
        uint64_t v23 = NUScaleToFillSizeInSize();
        objc_msgSend(v142, "setScale:", v23, v24);
        v25 = [(PIPortraitNode *)self input];
        id v153 = 0;
        v22 = [v25 nodeByReplayingAgainstCache:v8 pipelineState:v142 error:&v153];
        id v26 = v153;

        v143 = v26;
        if (!v22)
        {
          v34 = (void *)MEMORY[0x1E4F7A438];
          uint64_t v35 = [(PIPortraitNode *)self input];
          v36 = v34;
          v22 = (void *)v35;
          [v36 errorWithCode:1 reason:@"Failed to obtain portrait matte aux image" object:v35 underlyingError:v26];
          id v27 = 0;
          *a5 = (id)objc_claimAutoreleasedReturnValue();
          v15 = v141;
          goto LABEL_82;
        }
        v15 = v141;
      }
    }
    else
    {
      v143 = 0;
    }
    if ([v10 auxiliaryImageType] == 7)
    {
      if ([(PIPortraitEffectNode *)self isPortraitMono])
      {
        [MEMORY[0x1E4F7A438] invalidError:@"Gain map is disabled" object:self];
        id v27 = 0;
        *a5 = (id)objc_claimAutoreleasedReturnValue();
LABEL_82:

        goto LABEL_83;
      }
      if ([(PIPortraitEffectNode *)self isPortraitStage])
      {
        v33 = [v144 flexRangeProperties];
        v138 = v22;
        if (v33)
        {

LABEL_49:
          v66 = [MEMORY[0x1E4F1CA60] dictionary];
          [v66 setObject:v14 forKeyedSubscript:@"inputGainMap"];
          [v66 setObject:v138 forKeyedSubscript:@"inputMatte"];
          v67 = v15;
          v68 = (void *)[objc_alloc(MEMORY[0x1E4F7A460]) initWithFilterName:@"NUGainMapClearFilter" settings:&unk_1F000AF80 inputs:v66];
          id v27 = [v68 resolvedNodeWithCachedInputs:v66 cache:v8 pipelineState:v10 error:a5];

          v15 = v67;
          v22 = v138;
          goto LABEL_82;
        }
        v63 = [v144 meteorPlusGainMapVersion];
        uint64_t v64 = [v63 major];

        BOOL v65 = v64 < 2;
        v22 = v138;
        if (!v65) {
          goto LABEL_49;
        }
      }
      id v27 = v14;
      goto LABEL_82;
    }
    v134 = v14;
    v29 = [(PIPortraitNode *)self blurMap];

    if (v29)
    {
      v30 = [(PIPortraitNode *)self blurMap];
      id v152 = 0;
      uint64_t v31 = [v30 nodeByReplayingAgainstCache:v8 pipelineState:v10 error:&v152];
      id v32 = v152;

      v135 = (void *)v31;
      if (!v31)
      {
        v61 = (void *)MEMORY[0x1E4F7A438];
        v136 = [(PIPortraitNode *)self blurMap];
        objc_msgSend(v61, "errorWithCode:reason:object:underlyingError:", 1, @"Failed to obtain portrait blur map");
        id v27 = 0;
        *a5 = (id)objc_claimAutoreleasedReturnValue();
        v143 = v32;
        v14 = v134;
        v15 = v141;

        goto LABEL_82;
      }
      v143 = v32;
    }
    else
    {
      v135 = 0;
    }
    v139 = v22;
    int64_t v130 = [(PIPortraitEffectNode *)self portraitVersion];
    v37 = [(NURenderNode *)self settings];
    v131 = [v37 objectForKeyedSubscript:@"kind"];

    v38 = [v144 auxiliaryImagePropertiesForType:2];

    v15 = v141;
    v132 = v38;
    if (v38)
    {
      [v142 setAuxiliaryImageType:2];
      [v144 size];
      [v38 size];
      uint64_t v39 = NUScaleToFillSizeInSize();
      objc_msgSend(v142, "setScale:", v39, v40);
      v41 = [(PIPortraitNode *)self input];
      id v151 = 0;
      v137 = [v41 nodeByReplayingAgainstCache:v8 pipelineState:v142 error:&v151];
      id v42 = v151;

      v143 = v42;
    }
    else
    {
      v137 = 0;
    }
    v43 = v131;
    if ([v131 isEqualToString:@"Black"]) {
      int v44 = 1;
    }
    else {
      int v44 = [v131 isEqualToString:@"BlackoutMono"];
    }
    if (!v137 && v44)
    {
      v45 = (void *)MEMORY[0x1E4F7A438];
      v46 = [(PIPortraitNode *)self input];
      [v45 errorWithCode:1 reason:@"Failed to obtain disparity aux image" object:v46 underlyingError:v143];
      id v27 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
      v47 = v132;
      v14 = v134;
LABEL_81:

      v21 = v47;
      goto LABEL_82;
    }
    if (v130 == 2 && v20)
    {
      v47 = [v144 auxiliaryImagePropertiesForType:4];

      if (v47)
      {
        [v142 setAuxiliaryImageType:4];
        [v144 size];
        [v47 size];
        uint64_t v48 = NUScaleToFillSizeInSize();
        objc_msgSend(v142, "setScale:", v48, v49);
        v50 = [(PIPortraitNode *)self input];
        id v150 = 0;
        uint64_t v51 = [v50 nodeByReplayingAgainstCache:v8 pipelineState:v142 error:&v150];
        id v52 = v150;

        if (!v51)
        {
          v107 = (void *)MEMORY[0x1E4F7A438];
          v46 = [(PIPortraitNode *)self input];
          [v107 errorWithCode:1 reason:@"Failed to obtain skin matte aux image" object:v46 underlyingError:v52];
          id v27 = 0;
          *a5 = (id)objc_claimAutoreleasedReturnValue();
          v143 = v52;
          v14 = v134;
          goto LABEL_80;
        }
        v143 = v52;
      }
      else
      {
        uint64_t v51 = 0;
      }
      v90 = [v144 auxiliaryImagePropertiesForType:5];

      v129 = (void *)v51;
      v133 = v90;
      if (v90)
      {
        [v142 setAuxiliaryImageType:5];
        [v144 size];
        [v90 size];
        uint64_t v91 = NUScaleToFillSizeInSize();
        objc_msgSend(v142, "setScale:", v91, v92);
        v93 = [(PIPortraitNode *)self input];
        id v149 = 0;
        uint64_t v94 = [v93 nodeByReplayingAgainstCache:v8 pipelineState:v142 error:&v149];
        id v95 = v149;

        v128 = (void *)v94;
        if (!v94)
        {
          v108 = (void *)MEMORY[0x1E4F7A438];
          v109 = [(PIPortraitNode *)self input];
          *a5 = [v108 errorWithCode:1 reason:@"Failed to obtain hair matte aux image" object:v109 underlyingError:v95];

          id v27 = 0;
          v143 = v95;
          v47 = v90;
          v14 = v134;
          v22 = v139;
          v46 = v129;
          v43 = v131;
          goto LABEL_81;
        }
        v143 = v95;
      }
      else
      {
        v128 = 0;
      }
      v43 = v131;
      v47 = [v144 auxiliaryImagePropertiesForType:6];

      if (v47)
      {
        [v142 setAuxiliaryImageType:6];
        [v144 size];
        [v47 size];
        uint64_t v99 = NUScaleToFillSizeInSize();
        objc_msgSend(v142, "setScale:", v99, v100);
        v101 = [(PIPortraitNode *)self input];
        id v148 = 0;
        uint64_t v102 = [v101 nodeByReplayingAgainstCache:v8 pipelineState:v142 error:&v148];
        id v103 = v148;

        v127 = (void *)v102;
        if (!v102)
        {
          v110 = (void *)MEMORY[0x1E4F7A438];
          v111 = [(PIPortraitNode *)self input];
          *a5 = [v110 errorWithCode:1 reason:@"Failed to obtain teeth matte aux image" object:v111 underlyingError:v103];

          id v27 = 0;
          v143 = v103;
          v14 = v134;
          v22 = v139;
          v46 = v129;
          goto LABEL_81;
        }
        v132 = v47;
        v143 = v103;
      }
      else
      {
        v127 = 0;
        v132 = 0;
      }
    }
    else
    {
      v127 = 0;
      v128 = 0;
      v129 = 0;
    }
    v53 = [(NURenderNode *)self settings];
    v54 = [v53 objectForKeyedSubscript:@"glassesMatteAllowed"];
    int v55 = [v54 BOOLValue];

    if (v55)
    {
      v47 = [v144 auxiliaryImagePropertiesForType:8];

      if (v47)
      {
        [v142 setAuxiliaryImageType:8];
        [v144 size];
        [v47 size];
        uint64_t v56 = NUScaleToFillSizeInSize();
        objc_msgSend(v142, "setScale:", v56, v57);
        v58 = [(PIPortraitNode *)self input];
        id v147 = 0;
        uint64_t v59 = [v58 nodeByReplayingAgainstCache:v8 pipelineState:v142 error:&v147];
        id v60 = v147;

        if (!v59)
        {
          v96 = (void *)MEMORY[0x1E4F7A438];
          v126 = [(PIPortraitNode *)self input];
          objc_msgSend(v96, "errorWithCode:reason:object:underlyingError:", 1, @"Failed to obtain glasses matte aux image");
          id v27 = 0;
          *a5 = (id)objc_claimAutoreleasedReturnValue();
          v143 = v60;
          v14 = v134;
          v46 = v129;
LABEL_79:

LABEL_80:
          v22 = v139;
          goto LABEL_81;
        }
        v143 = v60;
      }
      else
      {
        uint64_t v59 = 0;
      }
      v126 = (void *)v59;
      v69 = [v144 auxiliaryImagePropertiesForType:7];

      if (v69)
      {
        [v142 setAuxiliaryImageType:7];
        [v144 size];
        v132 = v69;
        [v69 size];
        uint64_t v70 = NUScaleToFillSizeInSize();
        objc_msgSend(v142, "setScale:", v70, v71);
        v72 = [(PIPortraitNode *)self input];
        id v146 = 0;
        uint64_t v73 = [v72 nodeByReplayingAgainstCache:v8 pipelineState:v142 error:&v146];
        id v74 = v146;

        if (!v73)
        {
          v105 = (void *)MEMORY[0x1E4F7A438];
          v106 = [(PIPortraitNode *)self input];
          *a5 = [v105 errorWithCode:1 reason:@"Failed to obtain gain map aux image" object:v106 underlyingError:v74];

          id v27 = 0;
          v143 = v74;
          v47 = v69;
          v14 = v134;
          v46 = v129;
          v43 = v131;
          goto LABEL_79;
        }
        v125 = (void *)v73;
        v143 = v74;
      }
      else
      {
        v125 = 0;
        v132 = 0;
      }
      v62 = v134;
      v43 = v131;
    }
    else
    {
      v125 = 0;
      v126 = 0;
      v62 = v134;
    }
    id v75 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    [v75 setObject:v62 forKeyedSubscript:@"inputImage"];
    v76 = NSNumber;
    [v10 scale];
    NUScaleToDouble();
    v77 = objc_msgSend(v76, "numberWithDouble:");
    [v141 setObject:v77 forKeyedSubscript:@"inputScale"];

    v78 = [NSNumber numberWithInteger:v130];
    [v141 setObject:v78 forKeyedSubscript:@"inputVersion"];

    [v141 setObject:v43 forKeyedSubscript:@"inputKind"];
    if (v130 == 2)
    {
      [v75 setObject:v137 forKeyedSubscript:@"inputDisparity"];
      [v75 setObject:v135 forKeyedSubscript:@"inputBlurMap"];
      [v75 setObject:v139 forKeyedSubscript:@"inputMatte"];
      [v75 setObject:v129 forKeyedSubscript:@"inputFaceMask"];
      [v75 setObject:v128 forKeyedSubscript:@"inputHairMask"];
      [v75 setObject:v127 forKeyedSubscript:@"inputTeethMask"];
      v79 = [(NURenderNode *)self settings];
      v80 = [v79 objectForKeyedSubscript:@"spillMatteAllowed"];
      int v81 = [v80 BOOLValue];

      if (v81) {
        [v141 setObject:&unk_1F000A538 forKeyedSubscript:@"inputGenerateSpillMatte"];
      }
      v82 = [(NURenderNode *)self settings];
      v83 = [v82 objectForKeyedSubscript:@"strength"];
      v15 = v141;
      [v141 setObject:v83 forKeyedSubscript:@"inputStrength"];

      v84 = [(NURenderNode *)self settings];
      v85 = [v84 objectForKeyedSubscript:@"disablePortraitMixing"];
      [v141 setObject:v85 forKeyedSubscript:@"inputOneShot"];
    }
    else if (([v43 isEqualToString:@"Black"] & 1) != 0 {
           || [v43 isEqualToString:@"BlackoutMono"])
    }
    {
      [v75 setObject:v137 forKeyedSubscript:@"inputDisparity"];
      v86 = (void *)[v10 copy];
      objc_msgSend(v86, "setScale:", *MEMORY[0x1E4F7A338], *(void *)(MEMORY[0x1E4F7A338] + 8));
      v87 = [(PIPortraitNode *)self input];
      id v145 = 0;
      v88 = [v87 nodeByReplayingAgainstCache:v8 pipelineState:v86 error:&v145];
      id v89 = v145;

      if (!v88)
      {
        v97 = (void *)MEMORY[0x1E4F7A438];
        v98 = [(PIPortraitNode *)self input];
        *a5 = [v97 errorWithCode:1 reason:@"Failed to obtain full-size input image" object:v98 underlyingError:v89];

        id v27 = 0;
        v14 = v134;
        v15 = v141;
LABEL_78:

        v46 = v129;
        v47 = v132;
        goto LABEL_79;
      }
      [v75 setObject:v88 forKeyedSubscript:@"inputFullSizeImage"];
      [v75 setObject:v139 forKeyedSubscript:@"inputMatte"];

      v15 = v141;
    }
    else if (([v43 isEqualToString:@"Light"] & 1) == 0)
    {
      [v75 setObject:v135 forKeyedSubscript:@"inputBlurMap"];
    }
    id v89 = (id)[objc_alloc(MEMORY[0x1E4F7A460]) initWithFilterName:@"PIPortraitEffectFilter" settings:v15 inputs:v75];
    id v27 = [v89 resolvedNodeWithCachedInputs:v75 cache:v8 pipelineState:v10 error:a5];
    v14 = v134;
    goto LABEL_78;
  }
  id v27 = 0;
LABEL_84:

LABEL_85:
  return v27;
}

- (BOOL)canPropagateOriginalAuxiliaryData:(int64_t)a3
{
  v7.receiver = self;
  v7.super_class = (Class)PIPortraitEffectNode;
  BOOL v5 = -[PIPortraitNode canPropagateOriginalAuxiliaryData:](&v7, sel_canPropagateOriginalAuxiliaryData_);
  if (a3 == 7 && v5) {
    LOBYTE(v5) = ![(PIPortraitEffectNode *)self isPortraitStage];
  }
  return v5;
}

- (BOOL)isPortraitStage
{
  v3 = objc_opt_class();
  v4 = [(NURenderNode *)self settings];
  BOOL v5 = [v4 objectForKeyedSubscript:@"kind"];
  LOBYTE(v3) = [v3 isPortraitStageEffect:v5];

  return (char)v3;
}

- (BOOL)isPortraitMono
{
  v3 = objc_opt_class();
  v4 = [(NURenderNode *)self settings];
  BOOL v5 = [v4 objectForKeyedSubscript:@"kind"];
  LOBYTE(v3) = [v3 isPortraitMonoEffect:v5];

  return (char)v3;
}

- (int64_t)portraitVersion
{
  v2 = [(NURenderNode *)self settings];
  v3 = [v2 objectForKeyedSubscript:@"kind"];

  if ([&unk_1F000AAD8 containsObject:v3]) {
    int64_t v4 = 2;
  }
  else {
    int64_t v4 = 1;
  }

  return v4;
}

- (PIPortraitEffectNode)initWithInput:(id)a3 blurMap:(id)a4 settings:(id)a5
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (!v8)
  {
    v19 = NUAssertLogger_15192();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      uint64_t v20 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "input != nil");
      *(_DWORD *)buf = 138543362;
      v38 = v20;
      _os_log_error_impl(&dword_1A9680000, v19, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    v21 = (const void **)MEMORY[0x1E4F7A308];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    uint64_t v23 = NUAssertLogger_15192();
    BOOL v24 = os_log_type_enabled(v23, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v24)
      {
        id v27 = dispatch_get_specific(*v21);
        v28 = (void *)MEMORY[0x1E4F29060];
        id v29 = v27;
        v30 = [v28 callStackSymbols];
        uint64_t v31 = [v30 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v38 = v27;
        __int16 v39 = 2114;
        uint64_t v40 = v31;
        _os_log_error_impl(&dword_1A9680000, v23, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v24)
    {
      v25 = [MEMORY[0x1E4F29060] callStackSymbols];
      id v26 = [v25 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v38 = v26;
      _os_log_error_impl(&dword_1A9680000, v23, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler();
  }
  v11 = v10;
  if (v9)
  {
    v35[0] = @"inputImage";
    v35[1] = @"inputBlurMap";
    v36[0] = v8;
    v36[1] = v9;
    uint64_t v12 = (void *)MEMORY[0x1E4F1C9E8];
    v13 = (id *)v36;
    v14 = (__CFString **)v35;
    uint64_t v15 = 2;
  }
  else
  {
    v33 = @"inputImage";
    id v34 = v8;
    uint64_t v12 = (void *)MEMORY[0x1E4F1C9E8];
    v13 = &v34;
    v14 = &v33;
    uint64_t v15 = 1;
  }
  v16 = [v12 dictionaryWithObjects:v13 forKeys:v14 count:v15];
  v32.receiver = self;
  v32.super_class = (Class)PIPortraitEffectNode;
  v17 = [(NURenderNode *)&v32 initWithSettings:v11 inputs:v16];

  return v17;
}

- (PIPortraitEffectNode)initWithSettings:(id)a3 inputs:(id)a4
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
    id v10 = (void *)*MEMORY[0x1E4F7A748];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F7A748], OS_LOG_TYPE_ERROR))
    {
      v11 = NSString;
      uint64_t v12 = v10;
      v13 = (objc_class *)objc_opt_class();
      v14 = NSStringFromClass(v13);
      uint64_t v15 = NSStringFromSelector(a2);
      v16 = [v11 stringWithFormat:@"Initializer not available: -[%@ %@], use designated initializer instead.", v14, v15];
      *(_DWORD *)buf = 138543362;
      uint64_t v31 = v16;
      _os_log_error_impl(&dword_1A9680000, v12, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

      uint64_t v17 = *v8;
      if (!dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]))
      {
        if (v17 != -1) {
          dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_15332);
        }
LABEL_7:
        os_log_t v18 = *v9;
        if (os_log_type_enabled(*v9, OS_LOG_TYPE_ERROR))
        {
          v19 = (void *)MEMORY[0x1E4F29060];
          uint64_t v20 = v18;
          v21 = [v19 callStackSymbols];
          v22 = [v21 componentsJoinedByString:@"\n"];
          *(_DWORD *)buf = 138543362;
          uint64_t v31 = v22;
          _os_log_error_impl(&dword_1A9680000, v20, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

LABEL_13:
          goto LABEL_14;
        }
        goto LABEL_14;
      }
      if (v17 != -1) {
        dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_15332);
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
      v25 = (void *)MEMORY[0x1E4F29060];
      id v26 = specific;
      uint64_t v20 = v23;
      id v27 = [v25 callStackSymbols];
      v28 = [v27 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543618;
      uint64_t v31 = specific;
      __int16 v32 = 2114;
      v33 = v28;
      _os_log_error_impl(&dword_1A9680000, v20, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      goto LABEL_13;
    }
LABEL_14:
    id v29 = (objc_class *)objc_opt_class();
    NSStringFromClass(v29);
    objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    objc_claimAutoreleasedReturnValue();
    _NUAssertFailHandler();
LABEL_15:
    dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_15332);
  }
}

@end