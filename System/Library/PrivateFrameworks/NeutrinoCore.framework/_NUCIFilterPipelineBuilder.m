@interface _NUCIFilterPipelineBuilder
+ (id)channelFormatForFilterAttributes:(id)a3;
- (BOOL)buildPipeline:(id)a3 error:(id *)a4;
- (NSString)filterName;
- (_NUCIFilterPipelineBuilder)init;
- (_NUCIFilterPipelineBuilder)initWithCIFilterName:(id)a3;
- (id)buildPipeline:(id *)a3;
@end

@implementation _NUCIFilterPipelineBuilder

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_filter, 0);

  objc_storeStrong((id *)&self->_filterName, 0);
}

- (NSString)filterName
{
  return self->_filterName;
}

- (BOOL)buildPipeline:(id)a3 error:(id *)a4
{
  v30 = a4;
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  id v40 = a3;
  id v38 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v37 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v36 = [(CIFilter *)self->_filter attributes];
  long long v45 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  v39 = self;
  obuint64_t j = [(CIFilter *)self->_filter inputKeys];
  uint64_t v5 = [obj countByEnumeratingWithState:&v45 objects:v52 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v46;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v46 != v7) {
          objc_enumerationMutation(obj);
        }
        uint64_t v9 = *(void *)(*((void *)&v45 + 1) + 8 * i);
        v10 = objc_msgSend(v36, "objectForKeyedSubscript:", v9, v30);
        v11 = [(id)objc_opt_class() channelFormatForFilterAttributes:v10];
        v12 = [[NUChannel alloc] initWithName:v9 format:v11 index:0];
        v13 = [v40 addInputChannel:v12];
        uint64_t v14 = [v11 channelType];
        v15 = [v13 node];
        if (v14 == 1) {
          v16 = v38;
        }
        else {
          v16 = v37;
        }
        [v16 setObject:v15 forKeyedSubscript:v9];
      }
      uint64_t v6 = [obj countByEnumeratingWithState:&v45 objects:v52 count:16];
    }
    while (v6);
  }

  obja = [[NUFilterNode alloc] initWithFilterName:v39->_filterName settings:v37 inputs:v38];
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  id v31 = [(CIFilter *)v39->_filter outputKeys];
  uint64_t v17 = [v31 countByEnumeratingWithState:&v41 objects:v51 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v33 = *(void *)v42;
    uint64_t v19 = *MEMORY[0x1E4F1E520];
    uint64_t v32 = *MEMORY[0x1E4F1E0F0];
    uint64_t v20 = *MEMORY[0x1E4F1E120];
    while (2)
    {
      for (uint64_t j = 0; j != v18; ++j)
      {
        if (*(void *)v42 != v33) {
          objc_enumerationMutation(v31);
        }
        v22 = *(void **)(*((void *)&v41 + 1) + 8 * j);
        if ((objc_msgSend(v22, "isEqualToString:", v19, v30) & 1) == 0)
        {
          +[NUError unsupportedError:@"Unsupported output key" object:v22];
          BOOL v28 = 0;
          id *v30 = (id)objc_claimAutoreleasedReturnValue();
          goto LABEL_21;
        }
        uint64_t v49 = v32;
        uint64_t v50 = v20;
        v23 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v50 forKeys:&v49 count:1];
        v24 = [(id)objc_opt_class() channelFormatForFilterAttributes:v23];
        v25 = [[NUChannel alloc] initWithName:v22 format:v24 index:0];
        v26 = [v40 addOutputChannel:v25];
        v27 = [v26 node];
        [v27 setInputNode:obja];
      }
      uint64_t v18 = [v31 countByEnumeratingWithState:&v41 objects:v51 count:16];
      if (v18) {
        continue;
      }
      break;
    }
  }
  BOOL v28 = 1;
LABEL_21:

  return v28;
}

- (id)buildPipeline:(id *)a3
{
  uint64_t v5 = [MEMORY[0x1E4F1E040] filterWithName:self->_filterName];
  filter = self->_filter;
  self->_filter = v5;

  uint64_t v7 = self->_filter;
  if (v7)
  {
    v8 = [(CIFilter *)v7 valueForKey:*MEMORY[0x1E4F1E510]];
    uint64_t v9 = -[NUVersion initWithMajor:minor:]([NUVersion alloc], "initWithMajor:minor:", [v8 integerValue], 0);
    v10 = [[NUIdentifier alloc] initWithNamespace:@"com.apple.CoreImage" name:self->_filterName version:v9];
    v11 = [[_NUPipeline alloc] initWithIdentifier:v10];
    if ([(_NUCIFilterPipelineBuilder *)self buildPipeline:v11 error:a3]) {
      v12 = v11;
    }
    else {
      v12 = 0;
    }
    v13 = v12;
  }
  else
  {
    +[NUError invalidError:@"Filter not found" object:self->_filterName];
    v13 = 0;
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v13;
}

- (_NUCIFilterPipelineBuilder)initWithCIFilterName:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!v4)
  {
    v10 = NUAssertLogger_5149();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v11 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "filterName != nil");
      *(_DWORD *)buf = 138543362;
      BOOL v28 = v11;
      _os_log_error_impl(&dword_1A9892000, v10, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    v13 = NUAssertLogger_5149();
    BOOL v14 = os_log_type_enabled(v13, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v14)
      {
        uint64_t v17 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        uint64_t v18 = (void *)MEMORY[0x1E4F29060];
        id v19 = v17;
        uint64_t v20 = [v18 callStackSymbols];
        v21 = [v20 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        BOOL v28 = v17;
        __int16 v29 = 2114;
        v30 = v21;
        _os_log_error_impl(&dword_1A9892000, v13, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v14)
    {
      v15 = [MEMORY[0x1E4F29060] callStackSymbols];
      v16 = [v15 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      BOOL v28 = v16;
      _os_log_error_impl(&dword_1A9892000, v13, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[_NUCIFilterPipelineBuilder initWithCIFilterName:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/API/NUPipeline.m", 753, @"Invalid parameter not satisfying: %s", v22, v23, v24, v25, (uint64_t)"filterName != nil");
  }
  uint64_t v5 = v4;
  v26.receiver = self;
  v26.super_class = (Class)_NUCIFilterPipelineBuilder;
  uint64_t v6 = [(_NUCIFilterPipelineBuilder *)&v26 init];
  uint64_t v7 = [v5 copy];
  filterName = v6->_filterName;
  v6->_filterName = (NSString *)v7;

  return v6;
}

- (_NUCIFilterPipelineBuilder)init
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  if (_NULogOnceToken != -1) {
    dispatch_once(&_NULogOnceToken, &__block_literal_global_598);
  }
  v3 = (void *)_NUAssertLogger;
  if (os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR))
  {
    id v4 = NSString;
    uint64_t v5 = v3;
    uint64_t v6 = (objc_class *)objc_opt_class();
    uint64_t v7 = NSStringFromClass(v6);
    v8 = NSStringFromSelector(a2);
    uint64_t v9 = [v4 stringWithFormat:@"Initializer not available: -[%@ %@], use designated initializer instead.", v7, v8];
    *(_DWORD *)buf = 138543362;
    __int16 v29 = v9;
    _os_log_error_impl(&dword_1A9892000, v5, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    uint64_t v10 = _NULogOnceToken;
    if (!dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey))
    {
      if (v10 != -1) {
        dispatch_once(&_NULogOnceToken, &__block_literal_global_598);
      }
      goto LABEL_8;
    }
    if (v10 != -1) {
      dispatch_once(&_NULogOnceToken, &__block_literal_global_598);
    }
  }
  else if (!dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey))
  {
LABEL_8:
    v11 = (void *)_NUAssertLogger;
    if (!os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR)) {
      goto LABEL_15;
    }
    v12 = (void *)MEMORY[0x1E4F29060];
    v13 = v11;
    BOOL v14 = [v12 callStackSymbols];
    v15 = [v14 componentsJoinedByString:@"\n"];
    *(_DWORD *)buf = 138543362;
    __int16 v29 = v15;
    _os_log_error_impl(&dword_1A9892000, v13, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    goto LABEL_14;
  }
  v16 = (void *)_NUAssertLogger;
  if (!os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR)) {
    goto LABEL_15;
  }
  specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
  uint64_t v18 = (void *)MEMORY[0x1E4F29060];
  id v19 = specific;
  v13 = v16;
  uint64_t v20 = [v18 callStackSymbols];
  v21 = [v20 componentsJoinedByString:@"\n"];
  *(_DWORD *)buf = 138543618;
  __int16 v29 = specific;
  __int16 v30 = 2114;
  uint64_t v31 = v21;
  _os_log_error_impl(&dword_1A9892000, v13, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

LABEL_14:
LABEL_15:
  uint64_t v22 = (objc_class *)objc_opt_class();
  uint64_t v23 = NSStringFromClass(v22);
  NSStringFromSelector(a2);
  objc_claimAutoreleasedReturnValue();
  _NUAssertFailHandler((uint64_t)"-[_NUCIFilterPipelineBuilder init]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/API/NUPipeline.m", 749, @"Initializer not available: -[%@ %@], use designated initializer instead.", v24, v25, v26, v27, v23);
}

+ (id)channelFormatForFilterAttributes:(id)a3
{
  v48[2] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = [v3 objectForKeyedSubscript:*MEMORY[0x1E4F1E0F0]];
  uint64_t v5 = [v3 objectForKeyedSubscript:*MEMORY[0x1E4F1E090]];
  if (([v4 isEqualToString:*MEMORY[0x1E4F1E120]] & 1) != 0
    || !v4 && [v5 isEqualToString:@"CIImage"])
  {
    uint64_t v6 = [[NUChannelMediaFormat alloc] initWithMediaType:1];
    goto LABEL_21;
  }
  id v7 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  uint64_t v8 = *MEMORY[0x1E4F1E098];
  uint64_t v9 = [v3 objectForKeyedSubscript:*MEMORY[0x1E4F1E098]];
  [v7 setObject:v9 forKeyedSubscript:@"default"];

  uint64_t v10 = [v3 objectForKeyedSubscript:*MEMORY[0x1E4F1E0C8]];
  [v7 setObject:v10 forKeyedSubscript:@"identity"];

  v11 = NSNumber;
  v12 = [v3 objectForKeyedSubscript:v8];
  v13 = [v11 numberWithInt:v12 == 0];
  [v7 setObject:v13 forKeyedSubscript:@"required"];

  if (![v4 isEqualToString:*MEMORY[0x1E4F1E100]])
  {
    if (([v4 isEqualToString:*MEMORY[0x1E4F1E160]] & 1) != 0
      || ([v4 isEqualToString:*MEMORY[0x1E4F1E158]] & 1) != 0
      || ([v4 isEqualToString:*MEMORY[0x1E4F1E118]] & 1) != 0
      || ([v4 isEqualToString:*MEMORY[0x1E4F1E0F8]] & 1) != 0
      || ([v4 isEqualToString:*MEMORY[0x1E4F1E128]] & 1) != 0
      || [v4 isEqualToString:*MEMORY[0x1E4F1E110]])
    {
      uint64_t v16 = [v3 objectForKeyedSubscript:*MEMORY[0x1E4F1E0D8]];
      uint64_t v17 = (void *)v16;
      uint64_t v18 = &unk_1F004A6B8;
      if (v16) {
        uint64_t v18 = (void *)v16;
      }
      id v19 = v18;

      uint64_t v20 = [v3 objectForKeyedSubscript:*MEMORY[0x1E4F1E0D0]];
      v21 = (void *)v20;
      uint64_t v22 = &unk_1F004A6C8;
      if (v20) {
        uint64_t v22 = (void *)v20;
      }
      id v23 = v22;

      uint64_t v24 = [[NUNumberSetting alloc] initWithMinimum:v19 maximum:v23 attributes:v7];
      goto LABEL_19;
    }
    if (([v4 isEqualToString:*MEMORY[0x1E4F1E140]] & 1) != 0
      || [v4 isEqualToString:*MEMORY[0x1E4F1E130]])
    {
      uint64_t v26 = [NUNumberSetting alloc];
      id v19 = [(NUNumberSetting *)v26 initWithMinimum:&unk_1F0049CF8 maximum:&unk_1F0049D10 attributes:MEMORY[0x1E4F1CC08]];
      uint64_t v27 = [NUCompoundSetting alloc];
      v47[0] = @"x";
      v47[1] = @"y";
      v48[0] = v19;
      v48[1] = v19;
      BOOL v28 = (void *)MEMORY[0x1E4F1C9E8];
      __int16 v29 = v48;
      __int16 v30 = v47;
      uint64_t v31 = 2;
LABEL_27:
      id v23 = [v28 dictionaryWithObjects:v29 forKeys:v30 count:v31];
      uint64_t v24 = [(NUCompoundSetting *)v27 initWithProperties:v23 attributes:v7];
LABEL_19:
      v15 = v24;

      goto LABEL_20;
    }
    if ([v4 isEqualToString:*MEMORY[0x1E4F1E148]])
    {
      uint64_t v32 = [NUNumberSetting alloc];
      id v19 = [(NUNumberSetting *)v32 initWithMinimum:&unk_1F0049CF8 maximum:&unk_1F0049D10 attributes:MEMORY[0x1E4F1CC08]];
      uint64_t v27 = [NUCompoundSetting alloc];
      v45[0] = @"x";
      v45[1] = @"y";
      v46[0] = v19;
      v46[1] = v19;
      v45[2] = @"z";
      v46[2] = v19;
      BOOL v28 = (void *)MEMORY[0x1E4F1C9E8];
      __int16 v29 = v46;
      __int16 v30 = v45;
LABEL_36:
      uint64_t v31 = 3;
      goto LABEL_27;
    }
    if ([v4 isEqualToString:*MEMORY[0x1E4F1E150]])
    {
      uint64_t v33 = [NUNumberSetting alloc];
      id v19 = [(NUNumberSetting *)v33 initWithMinimum:&unk_1F0049CF8 maximum:&unk_1F0049D10 attributes:MEMORY[0x1E4F1CC08]];
      uint64_t v27 = [NUCompoundSetting alloc];
      v43[0] = @"x";
      v43[1] = @"y";
      v44[0] = v19;
      v44[1] = v19;
      v43[2] = @"w";
      v43[3] = @"h";
      v44[2] = v19;
      v44[3] = v19;
      BOOL v28 = (void *)MEMORY[0x1E4F1C9E8];
      __int16 v29 = v44;
      __int16 v30 = v43;
LABEL_32:
      uint64_t v31 = 4;
      goto LABEL_27;
    }
    if (([v4 isEqualToString:*MEMORY[0x1E4F1E108]] & 1) != 0
      || [v4 isEqualToString:*MEMORY[0x1E4F1E138]])
    {
      v34 = [NUNumberSetting alloc];
      id v19 = [(NUNumberSetting *)v34 initWithMinimum:&unk_1F004A520 maximum:&unk_1F004A530 attributes:MEMORY[0x1E4F1CC08]];
      uint64_t v27 = [NUCompoundSetting alloc];
      v41[0] = @"r";
      v41[1] = @"g";
      v42[0] = v19;
      v42[1] = v19;
      v41[2] = @"b";
      v42[2] = v19;
      BOOL v28 = (void *)MEMORY[0x1E4F1C9E8];
      __int16 v29 = v42;
      __int16 v30 = v41;
      goto LABEL_36;
    }
    if (![v4 isEqualToString:*MEMORY[0x1E4F1E168]])
    {
      if (!v4 && [v5 isEqualToString:@"CIVector"])
      {
        v35 = [NUNumberSetting alloc];
        id v19 = [(NUNumberSetting *)v35 initWithMinimum:&unk_1F004A520 maximum:&unk_1F004A530 attributes:MEMORY[0x1E4F1CC08]];
        uint64_t v27 = [NUCompoundSetting alloc];
        v39[0] = @"r";
        v39[1] = @"g";
        v40[0] = v19;
        v40[1] = v19;
        v39[2] = @"b";
        v39[3] = @"a";
        v40[2] = v19;
        v40[3] = v19;
        BOOL v28 = (void *)MEMORY[0x1E4F1C9E8];
        __int16 v29 = v40;
        __int16 v30 = v39;
        goto LABEL_32;
      }
      v36 = NULogger_5506();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
      {
        int v37 = 138543362;
        id v38 = v3;
        _os_log_error_impl(&dword_1A9892000, v36, OS_LOG_TYPE_ERROR, "Unsupported filter attributes: %{public}@", (uint8_t *)&v37, 0xCu);
      }
    }
    BOOL v14 = NUOpaqueSetting;
    goto LABEL_7;
  }
  BOOL v14 = NUBoolSetting;
LABEL_7:
  v15 = (NUNumberSetting *)[[v14 alloc] initWithAttributes:v7];
LABEL_20:
  uint64_t v6 = [[NUChannelControlFormat alloc] initWithControlType:1 dataModel:v15];

LABEL_21:

  return v6;
}

@end