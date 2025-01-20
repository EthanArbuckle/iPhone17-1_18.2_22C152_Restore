@interface _NUPipeline
+ (id)buildFilterPipelineWithName:(id)a3 error:(id *)a4;
+ (id)buildPipelineWithIdentifier:(id)a3 error:(id *)a4;
+ (id)buildSourcePipeline;
- (BOOL)_isPrivate;
- (BOOL)bind:(id)a3 to:(id)a4 error:(id *)a5;
- (BOOL)bindInputChannel:(id)a3 to:(id)a4 error:(id *)a5;
- (BOOL)bindInputPort:(id)a3 to:(id)a4 error:(id *)a5;
- (BOOL)canConnectInputPort:(id)a3 toOutputPort:(id)a4 error:(id *)a5;
- (BOOL)connect:(id)a3 input:(id)a4 to:(id)a5 error:(id *)a6;
- (BOOL)connect:(id)a3 input:(id)a4 to:(id)a5 key:(id)a6 error:(id *)a7;
- (BOOL)connect:(id)a3 input:(id)a4 to:(id)a5 output:(id)a6 error:(id *)a7;
- (BOOL)connect:(id)a3 to:(id)a4 output:(id)a5 error:(id *)a6;
- (BOOL)connectInputPort:(id)a3 toOutputPort:(id)a4 error:(id *)a5;
- (BOOL)validateInputPort:(id)a3 error:(id *)a4;
- (BOOL)validateOutputPort:(id)a3 error:(id *)a4;
- (NSArray)innerPipelines;
- (NSArray)inputChannels;
- (NSArray)outputChannels;
- (NSString)alias;
- (NSString)compactDescription;
- (NSString)description;
- (NSString)name;
- (NUIdentifier)identifier;
- (_NUPipeline)initWithIdentifier:(id)a3;
- (_NUPipeline)outerPipeline;
- (id)_compactDescription;
- (id)_description;
- (id)addCIFilterPipelineWithName:(id)a3 error:(id *)a4;
- (id)addInputChannel:(id)a3;
- (id)addOutputChannel:(id)a3;
- (id)addPipelineWithIdentifier:(id)a3 error:(id *)a4;
- (id)addSourcePipeline;
- (id)evaluate:(id)a3 error:(id *)a4;
- (id)evaluateOutputChannel:(id)a3 error:(id *)a4;
- (id)evaluateOutputPort:(id)a3 error:(id *)a4;
- (id)inputChannelMatching:(id)a3;
- (id)inputPortForChannel:(id)a3;
- (id)inputPortMatching:(id)a3;
- (id)outputChannelMatching:(id)a3;
- (id)outputPortForChannel:(id)a3;
- (id)outputPortMatching:(id)a3;
- (void)addInnerPipeline:(id)a3;
- (void)setOuterPipeline:(id)a3;
@end

@implementation _NUPipeline

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_innerPipelines, 0);
  objc_storeStrong((id *)&self->_outputPorts, 0);
  objc_storeStrong((id *)&self->_inputPorts, 0);
  objc_storeStrong((id *)&self->_outputChannels, 0);

  objc_storeStrong((id *)&self->_inputChannels, 0);
}

- (void)setOuterPipeline:(id)a3
{
  self->_outerPipeline = (_NUPipeline *)a3;
}

- (_NUPipeline)outerPipeline
{
  return self->_outerPipeline;
}

- (NUIdentifier)identifier
{
  return self->_identifier;
}

- (id)_compactDescription
{
  v3 = [(_NUPipeline *)self inputChannels];
  v4 = PFMap();

  v5 = [(_NUPipeline *)self outputChannels];
  v6 = PFMap();

  v7 = NSString;
  v8 = [(_NUPipeline *)self alias];
  v9 = [v4 componentsJoinedByString:@","];
  v10 = [v6 componentsJoinedByString:@","];
  v11 = [v7 stringWithFormat:@"%@(%@|%@)", v8, v9, v10];

  return v11;
}

- (NSString)compactDescription
{
  if ([(_NUPipeline *)self _isPrivate])
  {
    v3 = [(_NUPipeline *)self _compactDescription];
  }
  else
  {
    v4 = [(_NUPipeline *)self innerPipelines];
    v5 = PFMap();

    v6 = [(_NUPipeline *)self inputChannels];
    uint64_t v17 = MEMORY[0x1E4F143A8];
    v7 = PFMap();

    v8 = [(_NUPipeline *)self outputChannels];
    uint64_t v16 = MEMORY[0x1E4F143A8];
    v9 = PFMap();

    v10 = NSString;
    v11 = [(_NUPipeline *)self alias];
    v12 = [v7 componentsJoinedByString:@","];
    v13 = [v9 componentsJoinedByString:@","];
    v14 = [v5 componentsJoinedByString:@";"];
    v3 = [v10 stringWithFormat:@"%@(%@|%@)={%@}", v11, v12, v13, v14, v16, 3221225472, __33___NUPipeline_compactDescription__block_invoke_5, &unk_1E5D94400, self, v17, 3221225472, __33___NUPipeline_compactDescription__block_invoke_4, &unk_1E5D94400, self];
  }

  return (NSString *)v3;
}

- (NSString)alias
{
  v2 = [(_NUPipeline *)self name];
  v3 = [MEMORY[0x1E4F28B88] uppercaseLetterCharacterSet];
  id v4 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  uint64_t v5 = [v2 length];
  uint64_t v6 = objc_msgSend(v2, "rangeOfCharacterFromSet:options:range:", v3, 2, 0, v5);
  if (v6 != 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v8 = 0;
    do
    {
      uint64_t v9 = v6 + v7;
      uint64_t v10 = v8 - (v6 + v7) + v5;
      v11 = [v3 invertedSet];
      uint64_t v12 = objc_msgSend(v2, "rangeOfCharacterFromSet:options:range:", v11, 2, v9, v10);
      uint64_t v14 = v13;

      uint64_t v15 = v8 + v5;
      if (v12 == 0x7FFFFFFFFFFFFFFFLL) {
        uint64_t v16 = v8 + v5;
      }
      else {
        uint64_t v16 = v12;
      }
      uint64_t v17 = objc_msgSend(v2, "substringWithRange:", v16 - 1, 1);
      [v4 appendString:v17];

      uint64_t v8 = v16 + v14;
      uint64_t v5 = v15 - v8;
      uint64_t v6 = objc_msgSend(v2, "rangeOfCharacterFromSet:options:range:", v3, 2, v8, v15 - v8);
    }
    while (v6 != 0x7FFFFFFFFFFFFFFFLL);
  }
  if (![v4 length])
  {
    v18 = [v2 substringToIndex:1];
    v19 = [v18 capitalizedString];
    [v4 appendString:v19];
  }

  return (NSString *)v4;
}

- (id)_description
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc(MEMORY[0x1E4F28E78]);
  id v4 = [(_NUPipeline *)self name];
  uint64_t v5 = [(_NUPipeline *)self inputChannels];
  uint64_t v6 = [v5 count];
  uint64_t v7 = [(_NUPipeline *)self outputChannels];
  uint64_t v8 = (void *)[v3 initWithFormat:@"%@(%lu|%lu) = {", v4, v6, objc_msgSend(v7, "count")];

  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  uint64_t v9 = [(_NUPipeline *)self inputChannels];
  uint64_t v10 = [v9 countByEnumeratingWithState:&v26 objects:v31 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v27;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v27 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = [*(id *)(*((void *)&v26 + 1) + 8 * i) description];
        [v8 appendFormat:@"\n\t- %@", v14];
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v26 objects:v31 count:16];
    }
    while (v11);
  }

  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  uint64_t v15 = [(_NUPipeline *)self outputChannels];
  uint64_t v16 = [v15 countByEnumeratingWithState:&v22 objects:v30 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v23;
    do
    {
      for (uint64_t j = 0; j != v17; ++j)
      {
        if (*(void *)v23 != v18) {
          objc_enumerationMutation(v15);
        }
        v20 = [*(id *)(*((void *)&v22 + 1) + 8 * j) description];
        [v8 appendFormat:@"\n\t+ %@", v20];
      }
      uint64_t v17 = [v15 countByEnumeratingWithState:&v22 objects:v30 count:16];
    }
    while (v17);
  }

  [v8 appendString:@"\n}"];

  return v8;
}

- (NSString)description
{
  uint64_t v79 = *MEMORY[0x1E4F143B8];
  if ([(_NUPipeline *)self _isPrivate])
  {
    id v3 = [(_NUPipeline *)self _description];
  }
  else
  {
    id v4 = objc_alloc(MEMORY[0x1E4F28E78]);
    uint64_t v5 = [(_NUPipeline *)self name];
    uint64_t v6 = [(_NUPipeline *)self inputChannels];
    uint64_t v7 = [v6 count];
    uint64_t v8 = [(_NUPipeline *)self outputChannels];
    id v3 = (void *)[v4 initWithFormat:@"%@(%lu|%lu) = {", v5, v7, objc_msgSend(v8, "count")];

    long long v72 = 0u;
    long long v73 = 0u;
    long long v70 = 0u;
    long long v71 = 0u;
    uint64_t v9 = [(_NUPipeline *)self inputChannels];
    uint64_t v10 = [v9 countByEnumeratingWithState:&v70 objects:v78 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v71;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v71 != v12) {
            objc_enumerationMutation(v9);
          }
          uint64_t v14 = [*(id *)(*((void *)&v70 + 1) + 8 * i) description];
          [v3 appendFormat:@"\n\t- %@", v14];
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v70 objects:v78 count:16];
      }
      while (v11);
    }

    long long v68 = 0u;
    long long v69 = 0u;
    long long v66 = 0u;
    long long v67 = 0u;
    v49 = self;
    obuint64_t j = [(_NUPipeline *)self innerPipelines];
    uint64_t v52 = [obj countByEnumeratingWithState:&v66 objects:v77 count:16];
    if (v52)
    {
      uint64_t v51 = *(void *)v67;
      do
      {
        uint64_t v15 = 0;
        do
        {
          if (*(void *)v67 != v51) {
            objc_enumerationMutation(obj);
          }
          uint64_t v53 = v15;
          uint64_t v16 = *(void **)(*((void *)&v66 + 1) + 8 * v15);
          uint64_t v17 = [v16 name];
          [v3 appendFormat:@"\n\t* %@", v17];

          long long v64 = 0u;
          long long v65 = 0u;
          long long v62 = 0u;
          long long v63 = 0u;
          uint64_t v18 = [v16 inputChannels];
          uint64_t v19 = [v18 countByEnumeratingWithState:&v62 objects:v76 count:16];
          if (v19)
          {
            uint64_t v20 = v19;
            uint64_t v21 = *(void *)v63;
            do
            {
              for (uint64_t j = 0; j != v20; ++j)
              {
                if (*(void *)v63 != v21) {
                  objc_enumerationMutation(v18);
                }
                long long v23 = *(void **)(*((void *)&v62 + 1) + 8 * j);
                long long v24 = [v16 inputPortForChannel:v23];
                long long v25 = [v24 inputPort];

                uint64_t v26 = [v23 description];
                long long v27 = (void *)v26;
                if (v25)
                {
                  long long v28 = [v25 description];
                  [v3 appendFormat:@"\n\t\t- %@ << %@", v27, v28];
                }
                else
                {
                  [v3 appendFormat:@"\n\t\t- %@ <>", v26];
                }
              }
              uint64_t v20 = [v18 countByEnumeratingWithState:&v62 objects:v76 count:16];
            }
            while (v20);
          }

          long long v60 = 0u;
          long long v61 = 0u;
          long long v58 = 0u;
          long long v59 = 0u;
          long long v29 = [v16 outputChannels];
          uint64_t v30 = [v29 countByEnumeratingWithState:&v58 objects:v75 count:16];
          if (v30)
          {
            uint64_t v31 = v30;
            uint64_t v32 = *(void *)v59;
            do
            {
              for (uint64_t k = 0; k != v31; ++k)
              {
                if (*(void *)v59 != v32) {
                  objc_enumerationMutation(v29);
                }
                v34 = *(void **)(*((void *)&v58 + 1) + 8 * k);
                v35 = [v16 outputPortForChannel:v34];
                v36 = [v34 name];
                v37 = [v35 outputPorts];
                [v3 appendFormat:@"\n\t\t+ %@ >> [%lu]", v36, objc_msgSend(v37, "count")];
              }
              uint64_t v31 = [v29 countByEnumeratingWithState:&v58 objects:v75 count:16];
            }
            while (v31);
          }

          uint64_t v15 = v53 + 1;
        }
        while (v53 + 1 != v52);
        uint64_t v52 = [obj countByEnumeratingWithState:&v66 objects:v77 count:16];
      }
      while (v52);
    }

    long long v56 = 0u;
    long long v57 = 0u;
    long long v54 = 0u;
    long long v55 = 0u;
    v38 = [(_NUPipeline *)v49 outputChannels];
    uint64_t v39 = [v38 countByEnumeratingWithState:&v54 objects:v74 count:16];
    if (v39)
    {
      uint64_t v40 = v39;
      uint64_t v41 = *(void *)v55;
      do
      {
        for (uint64_t m = 0; m != v40; ++m)
        {
          if (*(void *)v55 != v41) {
            objc_enumerationMutation(v38);
          }
          v43 = *(void **)(*((void *)&v54 + 1) + 8 * m);
          v44 = [(_NUPipeline *)v49 outputPortForChannel:v43];
          v45 = [v44 inputPort];

          v46 = [v43 description];
          v47 = [v45 description];
          [v3 appendFormat:@"\n\t+ %@ << %@", v46, v47];
        }
        uint64_t v40 = [v38 countByEnumeratingWithState:&v54 objects:v74 count:16];
      }
      while (v40);
    }

    [v3 appendString:@"\n}"];
  }

  return (NSString *)v3;
}

- (BOOL)_isPrivate
{
  id v3 = [(_NUPipeline *)self identifier];
  id v4 = [v3 namespace];
  char v5 = [v4 isEqualToString:@"com.apple.photo"];

  if (v5) {
    return 1;
  }
  uint64_t v7 = [(_NUPipeline *)self identifier];
  uint64_t v8 = [v7 namespace];
  char v9 = [v8 isEqualToString:@"com.apple.CoreImage"];

  return v9;
}

- (NSArray)innerPipelines
{
  v2 = (void *)[(NSMutableArray *)self->_innerPipelines copy];

  return (NSArray *)v2;
}

- (void)addInnerPipeline:(id)a3
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!v4)
  {
    char v5 = NUAssertLogger_5149();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      uint64_t v6 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "pipeline != nil");
      *(_DWORD *)buf = 138543362;
      uint64_t v39 = v6;
      _os_log_error_impl(&dword_1A9892000, v5, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    uint64_t v8 = NUAssertLogger_5149();
    BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v9)
      {
        uint64_t v19 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        uint64_t v20 = (void *)MEMORY[0x1E4F29060];
        id v21 = v19;
        long long v22 = [v20 callStackSymbols];
        long long v23 = [v22 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        uint64_t v39 = v19;
        __int16 v40 = 2114;
        uint64_t v41 = v23;
        _os_log_error_impl(&dword_1A9892000, v8, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v9)
    {
      uint64_t v10 = [MEMORY[0x1E4F29060] callStackSymbols];
      uint64_t v11 = [v10 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      uint64_t v39 = v11;
      _os_log_error_impl(&dword_1A9892000, v8, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[_NUPipeline addInnerPipeline:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/API/NUPipeline.m", 559, @"Invalid parameter not satisfying: %s", v24, v25, v26, v27, (uint64_t)"pipeline != nil");
  }
  id v37 = v4;
  if ([(NSMutableArray *)self->_innerPipelines indexOfObjectIdenticalTo:v4] != 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v12 = NUAssertLogger_5149();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      uint64_t v13 = [NSString stringWithFormat:@"Pipeline already added: %@", v37];
      *(_DWORD *)buf = 138543362;
      uint64_t v39 = v13;
      _os_log_error_impl(&dword_1A9892000, v12, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    uint64_t v14 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    uint64_t v15 = NUAssertLogger_5149();
    BOOL v16 = os_log_type_enabled(v15, OS_LOG_TYPE_ERROR);
    if (v14)
    {
      if (v16)
      {
        long long v28 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        long long v29 = (void *)MEMORY[0x1E4F29060];
        id v30 = v28;
        uint64_t v31 = [v29 callStackSymbols];
        uint64_t v32 = [v31 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        uint64_t v39 = v28;
        __int16 v40 = 2114;
        uint64_t v41 = v32;
        _os_log_error_impl(&dword_1A9892000, v15, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v16)
    {
      uint64_t v17 = [MEMORY[0x1E4F29060] callStackSymbols];
      uint64_t v18 = [v17 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      uint64_t v39 = v18;
      _os_log_error_impl(&dword_1A9892000, v15, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[_NUPipeline addInnerPipeline:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/API/NUPipeline.m", 560, @"Pipeline already added: %@", v33, v34, v35, v36, (uint64_t)v37);
  }
  [(NSMutableArray *)self->_innerPipelines addObject:v37];
  [v37 setOuterPipeline:self];
}

- (id)addSourcePipeline
{
  id v3 = [(id)objc_opt_class() buildSourcePipeline];
  [(_NUPipeline *)self addInnerPipeline:v3];

  return v3;
}

- (id)addPipelineWithIdentifier:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v7 = [(id)objc_opt_class() buildPipelineWithIdentifier:v6 error:a4];

  if (v7) {
    [(_NUPipeline *)self addInnerPipeline:v7];
  }

  return v7;
}

- (id)addCIFilterPipelineWithName:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v7 = [(id)objc_opt_class() buildFilterPipelineWithName:v6 error:a4];

  [(_NUPipeline *)self addInnerPipeline:v7];

  return v7;
}

- (id)evaluate:(id)a3 error:(id *)a4
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (!v6)
  {
    uint64_t v11 = NUAssertLogger_5149();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      uint64_t v12 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "outputMatching != nil");
      *(_DWORD *)buf = 138543362;
      v44 = v12;
      _os_log_error_impl(&dword_1A9892000, v11, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    uint64_t v14 = NUAssertLogger_5149();
    BOOL v15 = os_log_type_enabled(v14, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v15)
      {
        uint64_t v25 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        uint64_t v26 = (void *)MEMORY[0x1E4F29060];
        id v27 = v25;
        long long v28 = [v26 callStackSymbols];
        long long v29 = [v28 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v44 = v25;
        __int16 v45 = 2114;
        v46 = v29;
        _os_log_error_impl(&dword_1A9892000, v14, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v15)
    {
      BOOL v16 = [MEMORY[0x1E4F29060] callStackSymbols];
      uint64_t v17 = [v16 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v44 = v17;
      _os_log_error_impl(&dword_1A9892000, v14, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[_NUPipeline evaluate:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/API/NUPipeline.m", 488, @"Invalid parameter not satisfying: %s", v30, v31, v32, v33, (uint64_t)"outputMatching != nil");
  }
  if (!a4)
  {
    uint64_t v18 = NUAssertLogger_5149();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      uint64_t v19 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "error != NULL");
      *(_DWORD *)buf = 138543362;
      v44 = v19;
      _os_log_error_impl(&dword_1A9892000, v18, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    uint64_t v20 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    id v21 = NUAssertLogger_5149();
    BOOL v22 = os_log_type_enabled(v21, OS_LOG_TYPE_ERROR);
    if (v20)
    {
      if (v22)
      {
        uint64_t v34 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        uint64_t v35 = (void *)MEMORY[0x1E4F29060];
        id v36 = v34;
        id v37 = [v35 callStackSymbols];
        v38 = [v37 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v44 = v34;
        __int16 v45 = 2114;
        v46 = v38;
        _os_log_error_impl(&dword_1A9892000, v21, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v22)
    {
      long long v23 = [MEMORY[0x1E4F29060] callStackSymbols];
      uint64_t v24 = [v23 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v44 = v24;
      _os_log_error_impl(&dword_1A9892000, v21, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[_NUPipeline evaluate:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/API/NUPipeline.m", 489, @"Invalid parameter not satisfying: %s", v39, v40, v41, v42, (uint64_t)"error != NULL");
  }
  uint64_t v7 = v6;
  uint64_t v8 = [(_NUPipeline *)self outputPortMatching:v6];
  if (v8)
  {
    BOOL v9 = [(_NUPipeline *)self evaluateOutputPort:v8 error:a4];
  }
  else
  {
    +[NUError notFoundError:@"No matching output port" object:v7];
    BOOL v9 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v9;
}

- (id)evaluateOutputChannel:(id)a3 error:(id *)a4
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (!v6)
  {
    uint64_t v11 = NUAssertLogger_5149();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      uint64_t v12 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "channel != nil");
      *(_DWORD *)buf = 138543362;
      v44 = v12;
      _os_log_error_impl(&dword_1A9892000, v11, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    uint64_t v14 = NUAssertLogger_5149();
    BOOL v15 = os_log_type_enabled(v14, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v15)
      {
        uint64_t v25 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        uint64_t v26 = (void *)MEMORY[0x1E4F29060];
        id v27 = v25;
        long long v28 = [v26 callStackSymbols];
        long long v29 = [v28 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v44 = v25;
        __int16 v45 = 2114;
        v46 = v29;
        _os_log_error_impl(&dword_1A9892000, v14, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v15)
    {
      BOOL v16 = [MEMORY[0x1E4F29060] callStackSymbols];
      uint64_t v17 = [v16 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v44 = v17;
      _os_log_error_impl(&dword_1A9892000, v14, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[_NUPipeline evaluateOutputChannel:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/API/NUPipeline.m", 475, @"Invalid parameter not satisfying: %s", v30, v31, v32, v33, (uint64_t)"channel != nil");
  }
  if (!a4)
  {
    uint64_t v18 = NUAssertLogger_5149();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      uint64_t v19 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "error != NULL");
      *(_DWORD *)buf = 138543362;
      v44 = v19;
      _os_log_error_impl(&dword_1A9892000, v18, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    uint64_t v20 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    id v21 = NUAssertLogger_5149();
    BOOL v22 = os_log_type_enabled(v21, OS_LOG_TYPE_ERROR);
    if (v20)
    {
      if (v22)
      {
        uint64_t v34 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        uint64_t v35 = (void *)MEMORY[0x1E4F29060];
        id v36 = v34;
        id v37 = [v35 callStackSymbols];
        v38 = [v37 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v44 = v34;
        __int16 v45 = 2114;
        v46 = v38;
        _os_log_error_impl(&dword_1A9892000, v21, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v22)
    {
      long long v23 = [MEMORY[0x1E4F29060] callStackSymbols];
      uint64_t v24 = [v23 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v44 = v24;
      _os_log_error_impl(&dword_1A9892000, v21, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[_NUPipeline evaluateOutputChannel:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/API/NUPipeline.m", 476, @"Invalid parameter not satisfying: %s", v39, v40, v41, v42, (uint64_t)"error != NULL");
  }
  uint64_t v7 = v6;
  uint64_t v8 = [(_NUPipeline *)self outputPortForChannel:v6];
  if (v8)
  {
    BOOL v9 = [(_NUPipeline *)self evaluateOutputPort:v8 error:a4];
  }
  else
  {
    +[NUError notFoundError:@"No matching output port" object:v7];
    BOOL v9 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v9;
}

- (id)evaluateOutputPort:(id)a3 error:(id *)a4
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (!v6)
  {
    uint64_t v12 = NUAssertLogger_5149();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      uint64_t v13 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "port != nil");
      *(_DWORD *)buf = 138543362;
      __int16 v45 = v13;
      _os_log_error_impl(&dword_1A9892000, v12, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    BOOL v15 = NUAssertLogger_5149();
    BOOL v16 = os_log_type_enabled(v15, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v16)
      {
        uint64_t v26 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        id v27 = (void *)MEMORY[0x1E4F29060];
        id v28 = v26;
        long long v29 = [v27 callStackSymbols];
        uint64_t v30 = [v29 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        __int16 v45 = v26;
        __int16 v46 = 2114;
        uint64_t v47 = v30;
        _os_log_error_impl(&dword_1A9892000, v15, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v16)
    {
      uint64_t v17 = [MEMORY[0x1E4F29060] callStackSymbols];
      uint64_t v18 = [v17 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      __int16 v45 = v18;
      _os_log_error_impl(&dword_1A9892000, v15, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[_NUPipeline evaluateOutputPort:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/API/NUPipeline.m", 462, @"Invalid parameter not satisfying: %s", v31, v32, v33, v34, (uint64_t)"port != nil");
  }
  if (!a4)
  {
    uint64_t v19 = NUAssertLogger_5149();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      uint64_t v20 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "error != NULL");
      *(_DWORD *)buf = 138543362;
      __int16 v45 = v20;
      _os_log_error_impl(&dword_1A9892000, v19, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    id v21 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    BOOL v22 = NUAssertLogger_5149();
    BOOL v23 = os_log_type_enabled(v22, OS_LOG_TYPE_ERROR);
    if (v21)
    {
      if (v23)
      {
        uint64_t v35 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        id v36 = (void *)MEMORY[0x1E4F29060];
        id v37 = v35;
        v38 = [v36 callStackSymbols];
        uint64_t v39 = [v38 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        __int16 v45 = v35;
        __int16 v46 = 2114;
        uint64_t v47 = v39;
        _os_log_error_impl(&dword_1A9892000, v22, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v23)
    {
      uint64_t v24 = [MEMORY[0x1E4F29060] callStackSymbols];
      uint64_t v25 = [v24 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      __int16 v45 = v25;
      _os_log_error_impl(&dword_1A9892000, v22, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[_NUPipeline evaluateOutputPort:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/API/NUPipeline.m", 463, @"Invalid parameter not satisfying: %s", v40, v41, v42, v43, (uint64_t)"error != NULL");
  }
  uint64_t v7 = v6;
  uint64_t v8 = [v6 channel];
  BOOL v9 = [(_NUPipeline *)self outputPortForChannel:v8];

  if (v9 == v7)
  {
    uint64_t v10 = [v7 evaluate:a4];
  }
  else
  {
    +[NUError invalidError:@"Unknown output port" object:v7];
    uint64_t v10 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v10;
}

- (BOOL)bind:(id)a3 to:(id)a4 error:(id *)a5
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  if (!v8)
  {
    uint64_t v14 = NUAssertLogger_5149();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      BOOL v15 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "inputMatching != nil");
      *(_DWORD *)buf = 138543362;
      uint64_t v47 = v15;
      _os_log_error_impl(&dword_1A9892000, v14, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    uint64_t v17 = NUAssertLogger_5149();
    BOOL v18 = os_log_type_enabled(v17, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v18)
      {
        id v28 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        long long v29 = (void *)MEMORY[0x1E4F29060];
        id v30 = v28;
        uint64_t v31 = [v29 callStackSymbols];
        uint64_t v32 = [v31 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        uint64_t v47 = v28;
        __int16 v48 = 2114;
        v49 = v32;
        _os_log_error_impl(&dword_1A9892000, v17, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v18)
    {
      uint64_t v19 = [MEMORY[0x1E4F29060] callStackSymbols];
      uint64_t v20 = [v19 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      uint64_t v47 = v20;
      _os_log_error_impl(&dword_1A9892000, v17, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[_NUPipeline bind:to:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/API/NUPipeline.m", 449, @"Invalid parameter not satisfying: %s", v33, v34, v35, v36, (uint64_t)"inputMatching != nil");
  }
  uint64_t v10 = v9;
  if (!v9)
  {
    id v21 = NUAssertLogger_5149();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      BOOL v22 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "data != nil");
      *(_DWORD *)buf = 138543362;
      uint64_t v47 = v22;
      _os_log_error_impl(&dword_1A9892000, v21, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    BOOL v23 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    uint64_t v24 = NUAssertLogger_5149();
    BOOL v25 = os_log_type_enabled(v24, OS_LOG_TYPE_ERROR);
    if (v23)
    {
      if (v25)
      {
        id v37 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v38 = (void *)MEMORY[0x1E4F29060];
        id v39 = v37;
        uint64_t v40 = [v38 callStackSymbols];
        uint64_t v41 = [v40 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        uint64_t v47 = v37;
        __int16 v48 = 2114;
        v49 = v41;
        _os_log_error_impl(&dword_1A9892000, v24, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v25)
    {
      uint64_t v26 = [MEMORY[0x1E4F29060] callStackSymbols];
      id v27 = [v26 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      uint64_t v47 = v27;
      _os_log_error_impl(&dword_1A9892000, v24, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[_NUPipeline bind:to:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/API/NUPipeline.m", 450, @"Invalid parameter not satisfying: %s", v42, v43, v44, v45, (uint64_t)"data != nil");
  }
  uint64_t v11 = [(_NUPipeline *)self inputPortMatching:v8];
  if (v11)
  {
    BOOL v12 = [(_NUPipeline *)self bindInputPort:v11 to:v10 error:a5];
  }
  else
  {
    +[NUError notFoundError:@"No matching input port" object:v8];
    BOOL v12 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v12;
}

- (BOOL)bindInputChannel:(id)a3 to:(id)a4 error:(id *)a5
{
  uint64_t v66 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  if (!v9)
  {
    uint64_t v14 = NUAssertLogger_5149();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      BOOL v15 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "data != nil");
      *(_DWORD *)buf = 138543362;
      long long v63 = v15;
      _os_log_error_impl(&dword_1A9892000, v14, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    uint64_t v17 = NUAssertLogger_5149();
    BOOL v18 = os_log_type_enabled(v17, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v18)
      {
        uint64_t v35 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        uint64_t v36 = (void *)MEMORY[0x1E4F29060];
        id v37 = v35;
        v38 = [v36 callStackSymbols];
        id v39 = [v38 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        long long v63 = v35;
        __int16 v64 = 2114;
        long long v65 = v39;
        _os_log_error_impl(&dword_1A9892000, v17, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v18)
    {
      uint64_t v19 = [MEMORY[0x1E4F29060] callStackSymbols];
      uint64_t v20 = [v19 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      long long v63 = v20;
      _os_log_error_impl(&dword_1A9892000, v17, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[_NUPipeline bindInputChannel:to:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/API/NUPipeline.m", 435, @"Invalid parameter not satisfying: %s", v40, v41, v42, v43, (uint64_t)"data != nil");
  }
  if (!v8)
  {
    id v21 = NUAssertLogger_5149();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      BOOL v22 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "channel != nil");
      *(_DWORD *)buf = 138543362;
      long long v63 = v22;
      _os_log_error_impl(&dword_1A9892000, v21, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    BOOL v23 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    uint64_t v24 = NUAssertLogger_5149();
    BOOL v25 = os_log_type_enabled(v24, OS_LOG_TYPE_ERROR);
    if (v23)
    {
      if (v25)
      {
        uint64_t v44 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        uint64_t v45 = (void *)MEMORY[0x1E4F29060];
        id v46 = v44;
        uint64_t v47 = [v45 callStackSymbols];
        __int16 v48 = [v47 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        long long v63 = v44;
        __int16 v64 = 2114;
        long long v65 = v48;
        _os_log_error_impl(&dword_1A9892000, v24, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v25)
    {
      uint64_t v26 = [MEMORY[0x1E4F29060] callStackSymbols];
      id v27 = [v26 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      long long v63 = v27;
      _os_log_error_impl(&dword_1A9892000, v24, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[_NUPipeline bindInputChannel:to:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/API/NUPipeline.m", 436, @"Invalid parameter not satisfying: %s", v49, v50, v51, v52, (uint64_t)"channel != nil");
  }
  if (!a5)
  {
    id v28 = NUAssertLogger_5149();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      long long v29 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "error != NULL");
      *(_DWORD *)buf = 138543362;
      long long v63 = v29;
      _os_log_error_impl(&dword_1A9892000, v28, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    id v30 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    uint64_t v31 = NUAssertLogger_5149();
    BOOL v32 = os_log_type_enabled(v31, OS_LOG_TYPE_ERROR);
    if (v30)
    {
      if (v32)
      {
        uint64_t v53 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        long long v54 = (void *)MEMORY[0x1E4F29060];
        id v55 = v53;
        long long v56 = [v54 callStackSymbols];
        long long v57 = [v56 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        long long v63 = v53;
        __int16 v64 = 2114;
        long long v65 = v57;
        _os_log_error_impl(&dword_1A9892000, v31, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v32)
    {
      uint64_t v33 = [MEMORY[0x1E4F29060] callStackSymbols];
      uint64_t v34 = [v33 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      long long v63 = v34;
      _os_log_error_impl(&dword_1A9892000, v31, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[_NUPipeline bindInputChannel:to:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/API/NUPipeline.m", 437, @"Invalid parameter not satisfying: %s", v58, v59, v60, v61, (uint64_t)"error != NULL");
  }
  uint64_t v10 = v9;
  uint64_t v11 = [(_NUPipeline *)self inputPortForChannel:v8];
  if (v11)
  {
    BOOL v12 = [(_NUPipeline *)self bindInputPort:v11 to:v10 error:a5];
  }
  else
  {
    +[NUError notFoundError:@"No matching input port" object:v8];
    BOOL v12 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v12;
}

- (BOOL)bindInputPort:(id)a3 to:(id)a4 error:(id *)a5
{
  uint64_t v72 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  if (!v8)
  {
    uint64_t v19 = NUAssertLogger_5149();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      uint64_t v20 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "port != nil");
      *(_DWORD *)buf = 138543362;
      long long v69 = v20;
      _os_log_error_impl(&dword_1A9892000, v19, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    BOOL v22 = NUAssertLogger_5149();
    BOOL v23 = os_log_type_enabled(v22, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v23)
      {
        uint64_t v40 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        uint64_t v41 = (void *)MEMORY[0x1E4F29060];
        id v42 = v40;
        uint64_t v43 = [v41 callStackSymbols];
        uint64_t v44 = [v43 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        long long v69 = v40;
        __int16 v70 = 2114;
        long long v71 = v44;
        _os_log_error_impl(&dword_1A9892000, v22, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v23)
    {
      uint64_t v24 = [MEMORY[0x1E4F29060] callStackSymbols];
      BOOL v25 = [v24 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      long long v69 = v25;
      _os_log_error_impl(&dword_1A9892000, v22, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[_NUPipeline bindInputPort:to:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/API/NUPipeline.m", 414, @"Invalid parameter not satisfying: %s", v45, v46, v47, v48, (uint64_t)"port != nil");
  }
  uint64_t v10 = v9;
  if (!v9)
  {
    uint64_t v26 = NUAssertLogger_5149();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      id v27 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "data != nil");
      *(_DWORD *)buf = 138543362;
      long long v69 = v27;
      _os_log_error_impl(&dword_1A9892000, v26, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    id v28 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    long long v29 = NUAssertLogger_5149();
    BOOL v30 = os_log_type_enabled(v29, OS_LOG_TYPE_ERROR);
    if (v28)
    {
      if (v30)
      {
        uint64_t v49 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        uint64_t v50 = (void *)MEMORY[0x1E4F29060];
        id v51 = v49;
        uint64_t v52 = [v50 callStackSymbols];
        uint64_t v53 = [v52 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        long long v69 = v49;
        __int16 v70 = 2114;
        long long v71 = v53;
        _os_log_error_impl(&dword_1A9892000, v29, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v30)
    {
      uint64_t v31 = [MEMORY[0x1E4F29060] callStackSymbols];
      BOOL v32 = [v31 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      long long v69 = v32;
      _os_log_error_impl(&dword_1A9892000, v29, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[_NUPipeline bindInputPort:to:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/API/NUPipeline.m", 415, @"Invalid parameter not satisfying: %s", v54, v55, v56, v57, (uint64_t)"data != nil");
  }
  if (!a5)
  {
    uint64_t v33 = NUAssertLogger_5149();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
    {
      uint64_t v34 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "error != NULL");
      *(_DWORD *)buf = 138543362;
      long long v69 = v34;
      _os_log_error_impl(&dword_1A9892000, v33, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    uint64_t v35 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    uint64_t v36 = NUAssertLogger_5149();
    BOOL v37 = os_log_type_enabled(v36, OS_LOG_TYPE_ERROR);
    if (v35)
    {
      if (v37)
      {
        uint64_t v58 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        uint64_t v59 = (void *)MEMORY[0x1E4F29060];
        id v60 = v58;
        uint64_t v61 = [v59 callStackSymbols];
        long long v62 = [v61 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        long long v69 = v58;
        __int16 v70 = 2114;
        long long v71 = v62;
        _os_log_error_impl(&dword_1A9892000, v36, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v37)
    {
      v38 = [MEMORY[0x1E4F29060] callStackSymbols];
      id v39 = [v38 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      long long v69 = v39;
      _os_log_error_impl(&dword_1A9892000, v36, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[_NUPipeline bindInputPort:to:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/API/NUPipeline.m", 416, @"Invalid parameter not satisfying: %s", v63, v64, v65, v66, (uint64_t)"error != NULL");
  }
  uint64_t v11 = [v8 channel];
  id v12 = [(_NUPipeline *)self inputPortForChannel:v11];

  if (v12 == v8)
  {
    uint64_t v14 = [v8 channel];
    BOOL v15 = [v14 format];
    id v67 = 0;
    char v16 = [v15 validateChannelData:v10 error:&v67];
    id v17 = v67;

    if (v16)
    {
      char v13 = [v8 bindTo:v10 error:a5];
    }
    else
    {
      +[NUError errorWithCode:2 reason:@"Invalid channel data" object:v10 underlyingError:v17];
      char v13 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    +[NUError invalidError:@"Unknown input port" object:v8];
    char v13 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v13;
}

- (BOOL)connect:(id)a3 to:(id)a4 output:(id)a5 error:(id *)a6
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (!v11)
  {
    id v17 = NUAssertLogger_5149();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      BOOL v18 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "pipeline != nil");
      *(_DWORD *)buf = 138543362;
      uint64_t v50 = v18;
      _os_log_error_impl(&dword_1A9892000, v17, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    uint64_t v20 = NUAssertLogger_5149();
    BOOL v21 = os_log_type_enabled(v20, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v21)
      {
        uint64_t v31 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        BOOL v32 = (void *)MEMORY[0x1E4F29060];
        id v33 = v31;
        uint64_t v34 = [v32 callStackSymbols];
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
      BOOL v22 = [MEMORY[0x1E4F29060] callStackSymbols];
      BOOL v23 = [v22 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      uint64_t v50 = v23;
      _os_log_error_impl(&dword_1A9892000, v20, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[_NUPipeline connect:to:output:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/API/NUPipeline.m", 401, @"Invalid parameter not satisfying: %s", v36, v37, v38, v39, (uint64_t)"pipeline != nil");
  }
  char v13 = v12;
  if (!v12)
  {
    uint64_t v24 = NUAssertLogger_5149();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      BOOL v25 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "outputMatching != nil");
      *(_DWORD *)buf = 138543362;
      uint64_t v50 = v25;
      _os_log_error_impl(&dword_1A9892000, v24, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    uint64_t v26 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    id v27 = NUAssertLogger_5149();
    BOOL v28 = os_log_type_enabled(v27, OS_LOG_TYPE_ERROR);
    if (v26)
    {
      if (v28)
      {
        uint64_t v40 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
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
      long long v29 = [MEMORY[0x1E4F29060] callStackSymbols];
      BOOL v30 = [v29 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      uint64_t v50 = v30;
      _os_log_error_impl(&dword_1A9892000, v27, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[_NUPipeline connect:to:output:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/API/NUPipeline.m", 402, @"Invalid parameter not satisfying: %s", v45, v46, v47, v48, (uint64_t)"outputMatching != nil");
  }
  uint64_t v14 = [v11 outputPortMatching:v12];
  if (v14)
  {
    BOOL v15 = [(_NUPipeline *)self connectInputPort:v10 toOutputPort:v14 error:a6];
  }
  else
  {
    +[NUError notFoundError:@"No matching output port" object:v13];
    BOOL v15 = 0;
    *a6 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v15;
}

- (BOOL)connect:(id)a3 input:(id)a4 to:(id)a5 key:(id)a6 error:(id *)a7
{
  uint64_t v89 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  if (!v12)
  {
    BOOL v21 = NUAssertLogger_5149();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      BOOL v22 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "pipeline != nil");
      *(_DWORD *)buf = 138543362;
      v86 = v22;
      _os_log_error_impl(&dword_1A9892000, v21, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    uint64_t v24 = NUAssertLogger_5149();
    BOOL v25 = os_log_type_enabled(v24, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v25)
      {
        uint64_t v49 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        uint64_t v50 = (void *)MEMORY[0x1E4F29060];
        id v51 = v49;
        uint64_t v52 = [v50 callStackSymbols];
        uint64_t v53 = [v52 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v86 = v49;
        __int16 v87 = 2114;
        v88 = v53;
        _os_log_error_impl(&dword_1A9892000, v24, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v25)
    {
      uint64_t v26 = [MEMORY[0x1E4F29060] callStackSymbols];
      id v27 = [v26 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v86 = v27;
      _os_log_error_impl(&dword_1A9892000, v24, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[_NUPipeline connect:input:to:key:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/API/NUPipeline.m", 380, @"Invalid parameter not satisfying: %s", v54, v55, v56, v57, (uint64_t)"pipeline != nil");
  }
  if (!v13)
  {
    BOOL v28 = NUAssertLogger_5149();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      long long v29 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "inputMatching != nil");
      *(_DWORD *)buf = 138543362;
      v86 = v29;
      _os_log_error_impl(&dword_1A9892000, v28, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    BOOL v30 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    uint64_t v31 = NUAssertLogger_5149();
    BOOL v32 = os_log_type_enabled(v31, OS_LOG_TYPE_ERROR);
    if (v30)
    {
      if (v32)
      {
        uint64_t v58 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        uint64_t v59 = (void *)MEMORY[0x1E4F29060];
        id v60 = v58;
        uint64_t v61 = [v59 callStackSymbols];
        long long v62 = [v61 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v86 = v58;
        __int16 v87 = 2114;
        v88 = v62;
        _os_log_error_impl(&dword_1A9892000, v31, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v32)
    {
      id v33 = [MEMORY[0x1E4F29060] callStackSymbols];
      uint64_t v34 = [v33 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v86 = v34;
      _os_log_error_impl(&dword_1A9892000, v31, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[_NUPipeline connect:input:to:key:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/API/NUPipeline.m", 381, @"Invalid parameter not satisfying: %s", v63, v64, v65, v66, (uint64_t)"inputMatching != nil");
  }
  if (!v14)
  {
    uint64_t v35 = NUAssertLogger_5149();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
    {
      uint64_t v36 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "outputPort != nil");
      *(_DWORD *)buf = 138543362;
      v86 = v36;
      _os_log_error_impl(&dword_1A9892000, v35, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    uint64_t v37 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    uint64_t v38 = NUAssertLogger_5149();
    BOOL v39 = os_log_type_enabled(v38, OS_LOG_TYPE_ERROR);
    if (v37)
    {
      if (v39)
      {
        id v67 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        long long v68 = (void *)MEMORY[0x1E4F29060];
        id v69 = v67;
        __int16 v70 = [v68 callStackSymbols];
        long long v71 = [v70 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v86 = v67;
        __int16 v87 = 2114;
        v88 = v71;
        _os_log_error_impl(&dword_1A9892000, v38, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v39)
    {
      uint64_t v40 = [MEMORY[0x1E4F29060] callStackSymbols];
      uint64_t v41 = [v40 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v86 = v41;
      _os_log_error_impl(&dword_1A9892000, v38, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[_NUPipeline connect:input:to:key:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/API/NUPipeline.m", 382, @"Invalid parameter not satisfying: %s", v72, v73, v74, v75, (uint64_t)"outputPort != nil");
  }
  char v16 = v15;
  if (!v15)
  {
    id v42 = NUAssertLogger_5149();
    if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
    {
      uint64_t v43 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "key != nil");
      *(_DWORD *)buf = 138543362;
      v86 = v43;
      _os_log_error_impl(&dword_1A9892000, v42, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    uint64_t v44 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    uint64_t v45 = NUAssertLogger_5149();
    BOOL v46 = os_log_type_enabled(v45, OS_LOG_TYPE_ERROR);
    if (v44)
    {
      if (v46)
      {
        v76 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v77 = (void *)MEMORY[0x1E4F29060];
        id v78 = v76;
        uint64_t v79 = [v77 callStackSymbols];
        v80 = [v79 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v86 = v76;
        __int16 v87 = 2114;
        v88 = v80;
        _os_log_error_impl(&dword_1A9892000, v45, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v46)
    {
      uint64_t v47 = [MEMORY[0x1E4F29060] callStackSymbols];
      uint64_t v48 = [v47 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v86 = v48;
      _os_log_error_impl(&dword_1A9892000, v45, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[_NUPipeline connect:input:to:key:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/API/NUPipeline.m", 383, @"Invalid parameter not satisfying: %s", v81, v82, v83, v84, (uint64_t)"key != nil");
  }
  id v17 = [v12 inputPortMatching:v13];
  if (v17)
  {
    BOOL v18 = [v14 subportForKey:v16];
    if (v18)
    {
      BOOL v19 = [(_NUPipeline *)self connectInputPort:v17 toOutputPort:v18 error:a7];
    }
    else
    {
      +[NUError notFoundError:@"No matching output port for key" object:v16];
      BOOL v19 = 0;
      *a7 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    +[NUError notFoundError:@"No matching input port" object:v13];
    BOOL v19 = 0;
    *a7 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v19;
}

- (BOOL)connect:(id)a3 input:(id)a4 to:(id)a5 error:(id *)a6
{
  uint64_t v69 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (!v10)
  {
    id v17 = NUAssertLogger_5149();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      BOOL v18 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "pipeline != nil");
      *(_DWORD *)buf = 138543362;
      uint64_t v66 = v18;
      _os_log_error_impl(&dword_1A9892000, v17, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    uint64_t v20 = NUAssertLogger_5149();
    BOOL v21 = os_log_type_enabled(v20, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v21)
      {
        uint64_t v38 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        BOOL v39 = (void *)MEMORY[0x1E4F29060];
        id v40 = v38;
        uint64_t v41 = [v39 callStackSymbols];
        id v42 = [v41 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        uint64_t v66 = v38;
        __int16 v67 = 2114;
        long long v68 = v42;
        _os_log_error_impl(&dword_1A9892000, v20, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v21)
    {
      BOOL v22 = [MEMORY[0x1E4F29060] callStackSymbols];
      BOOL v23 = [v22 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      uint64_t v66 = v23;
      _os_log_error_impl(&dword_1A9892000, v20, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[_NUPipeline connect:input:to:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/API/NUPipeline.m", 366, @"Invalid parameter not satisfying: %s", v43, v44, v45, v46, (uint64_t)"pipeline != nil");
  }
  if (!v11)
  {
    uint64_t v24 = NUAssertLogger_5149();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      BOOL v25 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "inputMatching != nil");
      *(_DWORD *)buf = 138543362;
      uint64_t v66 = v25;
      _os_log_error_impl(&dword_1A9892000, v24, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    uint64_t v26 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    id v27 = NUAssertLogger_5149();
    BOOL v28 = os_log_type_enabled(v27, OS_LOG_TYPE_ERROR);
    if (v26)
    {
      if (v28)
      {
        uint64_t v47 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        uint64_t v48 = (void *)MEMORY[0x1E4F29060];
        id v49 = v47;
        uint64_t v50 = [v48 callStackSymbols];
        id v51 = [v50 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        uint64_t v66 = v47;
        __int16 v67 = 2114;
        long long v68 = v51;
        _os_log_error_impl(&dword_1A9892000, v27, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v28)
    {
      long long v29 = [MEMORY[0x1E4F29060] callStackSymbols];
      BOOL v30 = [v29 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      uint64_t v66 = v30;
      _os_log_error_impl(&dword_1A9892000, v27, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[_NUPipeline connect:input:to:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/API/NUPipeline.m", 367, @"Invalid parameter not satisfying: %s", v52, v53, v54, v55, (uint64_t)"inputMatching != nil");
  }
  id v13 = v12;
  if (!v12)
  {
    uint64_t v31 = NUAssertLogger_5149();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    {
      BOOL v32 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "outputPort != nil");
      *(_DWORD *)buf = 138543362;
      uint64_t v66 = v32;
      _os_log_error_impl(&dword_1A9892000, v31, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    id v33 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    uint64_t v34 = NUAssertLogger_5149();
    BOOL v35 = os_log_type_enabled(v34, OS_LOG_TYPE_ERROR);
    if (v33)
    {
      if (v35)
      {
        uint64_t v56 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        uint64_t v57 = (void *)MEMORY[0x1E4F29060];
        id v58 = v56;
        uint64_t v59 = [v57 callStackSymbols];
        id v60 = [v59 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        uint64_t v66 = v56;
        __int16 v67 = 2114;
        long long v68 = v60;
        _os_log_error_impl(&dword_1A9892000, v34, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v35)
    {
      uint64_t v36 = [MEMORY[0x1E4F29060] callStackSymbols];
      uint64_t v37 = [v36 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      uint64_t v66 = v37;
      _os_log_error_impl(&dword_1A9892000, v34, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[_NUPipeline connect:input:to:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/API/NUPipeline.m", 368, @"Invalid parameter not satisfying: %s", v61, v62, v63, v64, (uint64_t)"outputPort != nil");
  }
  id v14 = [v10 inputPortMatching:v11];
  if (v14)
  {
    BOOL v15 = [(_NUPipeline *)self connectInputPort:v14 toOutputPort:v13 error:a6];
  }
  else
  {
    +[NUError notFoundError:@"No matching input port" object:v11];
    BOOL v15 = 0;
    *a6 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v15;
}

- (BOOL)connect:(id)a3 input:(id)a4 to:(id)a5 output:(id)a6 error:(id *)a7
{
  uint64_t v89 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  if (!v12)
  {
    BOOL v21 = NUAssertLogger_5149();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      BOOL v22 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "pipeline1 != nil");
      *(_DWORD *)buf = 138543362;
      v86 = v22;
      _os_log_error_impl(&dword_1A9892000, v21, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    uint64_t v24 = NUAssertLogger_5149();
    BOOL v25 = os_log_type_enabled(v24, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v25)
      {
        id v49 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        uint64_t v50 = (void *)MEMORY[0x1E4F29060];
        id v51 = v49;
        uint64_t v52 = [v50 callStackSymbols];
        uint64_t v53 = [v52 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v86 = v49;
        __int16 v87 = 2114;
        v88 = v53;
        _os_log_error_impl(&dword_1A9892000, v24, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v25)
    {
      uint64_t v26 = [MEMORY[0x1E4F29060] callStackSymbols];
      id v27 = [v26 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v86 = v27;
      _os_log_error_impl(&dword_1A9892000, v24, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[_NUPipeline connect:input:to:output:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/API/NUPipeline.m", 345, @"Invalid parameter not satisfying: %s", v54, v55, v56, v57, (uint64_t)"pipeline1 != nil");
  }
  if (!v14)
  {
    BOOL v28 = NUAssertLogger_5149();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      long long v29 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "pipeline2 != nil");
      *(_DWORD *)buf = 138543362;
      v86 = v29;
      _os_log_error_impl(&dword_1A9892000, v28, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    BOOL v30 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    uint64_t v31 = NUAssertLogger_5149();
    BOOL v32 = os_log_type_enabled(v31, OS_LOG_TYPE_ERROR);
    if (v30)
    {
      if (v32)
      {
        id v58 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        uint64_t v59 = (void *)MEMORY[0x1E4F29060];
        id v60 = v58;
        uint64_t v61 = [v59 callStackSymbols];
        uint64_t v62 = [v61 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v86 = v58;
        __int16 v87 = 2114;
        v88 = v62;
        _os_log_error_impl(&dword_1A9892000, v31, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v32)
    {
      id v33 = [MEMORY[0x1E4F29060] callStackSymbols];
      uint64_t v34 = [v33 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v86 = v34;
      _os_log_error_impl(&dword_1A9892000, v31, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[_NUPipeline connect:input:to:output:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/API/NUPipeline.m", 346, @"Invalid parameter not satisfying: %s", v63, v64, v65, v66, (uint64_t)"pipeline2 != nil");
  }
  if (!v13)
  {
    BOOL v35 = NUAssertLogger_5149();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
    {
      uint64_t v36 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "inputMatching != nil");
      *(_DWORD *)buf = 138543362;
      v86 = v36;
      _os_log_error_impl(&dword_1A9892000, v35, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    uint64_t v37 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    uint64_t v38 = NUAssertLogger_5149();
    BOOL v39 = os_log_type_enabled(v38, OS_LOG_TYPE_ERROR);
    if (v37)
    {
      if (v39)
      {
        __int16 v67 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        long long v68 = (void *)MEMORY[0x1E4F29060];
        id v69 = v67;
        __int16 v70 = [v68 callStackSymbols];
        long long v71 = [v70 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v86 = v67;
        __int16 v87 = 2114;
        v88 = v71;
        _os_log_error_impl(&dword_1A9892000, v38, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v39)
    {
      id v40 = [MEMORY[0x1E4F29060] callStackSymbols];
      uint64_t v41 = [v40 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v86 = v41;
      _os_log_error_impl(&dword_1A9892000, v38, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[_NUPipeline connect:input:to:output:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/API/NUPipeline.m", 347, @"Invalid parameter not satisfying: %s", v72, v73, v74, v75, (uint64_t)"inputMatching != nil");
  }
  char v16 = v15;
  if (!v15)
  {
    id v42 = NUAssertLogger_5149();
    if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
    {
      uint64_t v43 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "outputMatching != nil");
      *(_DWORD *)buf = 138543362;
      v86 = v43;
      _os_log_error_impl(&dword_1A9892000, v42, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    uint64_t v44 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    uint64_t v45 = NUAssertLogger_5149();
    BOOL v46 = os_log_type_enabled(v45, OS_LOG_TYPE_ERROR);
    if (v44)
    {
      if (v46)
      {
        v76 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v77 = (void *)MEMORY[0x1E4F29060];
        id v78 = v76;
        uint64_t v79 = [v77 callStackSymbols];
        v80 = [v79 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v86 = v76;
        __int16 v87 = 2114;
        v88 = v80;
        _os_log_error_impl(&dword_1A9892000, v45, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v46)
    {
      uint64_t v47 = [MEMORY[0x1E4F29060] callStackSymbols];
      uint64_t v48 = [v47 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v86 = v48;
      _os_log_error_impl(&dword_1A9892000, v45, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[_NUPipeline connect:input:to:output:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/API/NUPipeline.m", 348, @"Invalid parameter not satisfying: %s", v81, v82, v83, v84, (uint64_t)"outputMatching != nil");
  }
  id v17 = [v12 inputPortMatching:v13];
  if (v17)
  {
    BOOL v18 = [v14 outputPortMatching:v16];
    if (v18)
    {
      BOOL v19 = [(_NUPipeline *)self connectInputPort:v17 toOutputPort:v18 error:a7];
    }
    else
    {
      +[NUError notFoundError:@"No matching output port" object:v16];
      BOOL v19 = 0;
      *a7 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    +[NUError notFoundError:@"No matching input port" object:v13];
    BOOL v19 = 0;
    *a7 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v19;
}

- (BOOL)connectInputPort:(id)a3 toOutputPort:(id)a4 error:(id *)a5
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  if (!v8)
  {
    id v13 = NUAssertLogger_5149();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      id v14 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "inputPort != nil");
      *(_DWORD *)buf = 138543362;
      BOOL v46 = v14;
      _os_log_error_impl(&dword_1A9892000, v13, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    char v16 = NUAssertLogger_5149();
    BOOL v17 = os_log_type_enabled(v16, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v17)
      {
        id v27 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        BOOL v28 = (void *)MEMORY[0x1E4F29060];
        id v29 = v27;
        BOOL v30 = [v28 callStackSymbols];
        uint64_t v31 = [v30 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        BOOL v46 = v27;
        __int16 v47 = 2114;
        uint64_t v48 = v31;
        _os_log_error_impl(&dword_1A9892000, v16, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v17)
    {
      BOOL v18 = [MEMORY[0x1E4F29060] callStackSymbols];
      BOOL v19 = [v18 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      BOOL v46 = v19;
      _os_log_error_impl(&dword_1A9892000, v16, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[_NUPipeline connectInputPort:toOutputPort:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/API/NUPipeline.m", 331, @"Invalid parameter not satisfying: %s", v32, v33, v34, v35, (uint64_t)"inputPort != nil");
  }
  id v10 = v9;
  if (!v9)
  {
    uint64_t v20 = NUAssertLogger_5149();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      BOOL v21 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "outputPort != nil");
      *(_DWORD *)buf = 138543362;
      BOOL v46 = v21;
      _os_log_error_impl(&dword_1A9892000, v20, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    BOOL v22 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    BOOL v23 = NUAssertLogger_5149();
    BOOL v24 = os_log_type_enabled(v23, OS_LOG_TYPE_ERROR);
    if (v22)
    {
      if (v24)
      {
        uint64_t v36 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        uint64_t v37 = (void *)MEMORY[0x1E4F29060];
        id v38 = v36;
        BOOL v39 = [v37 callStackSymbols];
        id v40 = [v39 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        BOOL v46 = v36;
        __int16 v47 = 2114;
        uint64_t v48 = v40;
        _os_log_error_impl(&dword_1A9892000, v23, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v24)
    {
      BOOL v25 = [MEMORY[0x1E4F29060] callStackSymbols];
      uint64_t v26 = [v25 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      BOOL v46 = v26;
      _os_log_error_impl(&dword_1A9892000, v23, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[_NUPipeline connectInputPort:toOutputPort:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/API/NUPipeline.m", 332, @"Invalid parameter not satisfying: %s", v41, v42, v43, v44, (uint64_t)"outputPort != nil");
  }
  BOOL v11 = [(_NUPipeline *)self canConnectInputPort:v8 toOutputPort:v9 error:a5];
  if (v11) {
    [v8 setInputPort:v10];
  }

  return v11;
}

- (BOOL)canConnectInputPort:(id)a3 toOutputPort:(id)a4 error:(id *)a5
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  if (!v8)
  {
    BOOL v17 = NUAssertLogger_5149();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      BOOL v18 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "inputPort != nil");
      *(_DWORD *)buf = 138543362;
      uint64_t v50 = v18;
      _os_log_error_impl(&dword_1A9892000, v17, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    uint64_t v20 = NUAssertLogger_5149();
    BOOL v21 = os_log_type_enabled(v20, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v21)
      {
        uint64_t v31 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        uint64_t v32 = (void *)MEMORY[0x1E4F29060];
        id v33 = v31;
        uint64_t v34 = [v32 callStackSymbols];
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
      BOOL v22 = [MEMORY[0x1E4F29060] callStackSymbols];
      BOOL v23 = [v22 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      uint64_t v50 = v23;
      _os_log_error_impl(&dword_1A9892000, v20, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[_NUPipeline canConnectInputPort:toOutputPort:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/API/NUPipeline.m", 311, @"Invalid parameter not satisfying: %s", v36, v37, v38, v39, (uint64_t)"inputPort != nil");
  }
  id v10 = v9;
  if (!v9)
  {
    BOOL v24 = NUAssertLogger_5149();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      BOOL v25 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "outputPort != nil");
      *(_DWORD *)buf = 138543362;
      uint64_t v50 = v25;
      _os_log_error_impl(&dword_1A9892000, v24, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    uint64_t v26 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    id v27 = NUAssertLogger_5149();
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
      id v29 = [MEMORY[0x1E4F29060] callStackSymbols];
      BOOL v30 = [v29 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      uint64_t v50 = v30;
      _os_log_error_impl(&dword_1A9892000, v27, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[_NUPipeline canConnectInputPort:toOutputPort:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/API/NUPipeline.m", 312, @"Invalid parameter not satisfying: %s", v45, v46, v47, v48, (uint64_t)"outputPort != nil");
  }
  if (![(_NUPipeline *)self validateInputPort:v8 error:a5]
    || ![(_NUPipeline *)self validateOutputPort:v10 error:a5])
  {
    goto LABEL_8;
  }
  BOOL v11 = [v8 channel];
  id v12 = [v10 channel];
  char v13 = [v11 isCompatibleWithChannel:v12];

  if ((v13 & 1) == 0)
  {
    id v15 = [v10 channel];
    *a5 = +[NUError invalidError:@"Incompatible output channel" object:v15];

LABEL_8:
    BOOL v14 = 0;
    goto LABEL_9;
  }
  BOOL v14 = 1;
LABEL_9:

  return v14;
}

- (BOOL)validateOutputPort:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v7 = [v6 pipeline];
  id v8 = v7;
  if (v7 != self)
  {
    id v9 = [(_NUPipeline *)v7 outerPipeline];

    if (v9 != self)
    {
      id v10 = @"Output port is out of scope";
LABEL_8:
      +[NUError invalidError:v10 object:v6];
      BOOL v14 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_11;
    }
    id v15 = [v6 channel];
    id v16 = [(_NUPipeline *)v8 outputPortForChannel:v15];

    if (v16 != v6)
    {
      id v10 = @"Unknown output port";
      goto LABEL_8;
    }
LABEL_10:
    BOOL v14 = 1;
    goto LABEL_11;
  }
  BOOL v11 = [v6 rootPort];
  id v12 = [v11 channel];
  char v13 = [(_NUPipeline *)self inputPortForChannel:v12];

  if (v13 == v11)
  {

    goto LABEL_10;
  }
  *a4 = +[NUError invalidError:@"Unknown output port" object:v6];

  BOOL v14 = 0;
LABEL_11:

  return v14;
}

- (BOOL)validateInputPort:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v7 = [v6 pipeline];
  id v8 = v7;
  if (v7 == self)
  {
    BOOL v11 = [v6 channel];
    id v12 = [(_NUPipeline *)self outputPortForChannel:v11];

    if (v12 == v6)
    {
LABEL_8:
      BOOL v13 = 1;
      goto LABEL_9;
    }
LABEL_5:
    id v10 = @"Unknown input port";
    goto LABEL_6;
  }
  id v9 = [(_NUPipeline *)v7 outerPipeline];

  if (v9 == self)
  {
    BOOL v14 = [v6 channel];
    id v15 = [(_NUPipeline *)v8 inputPortForChannel:v14];

    if (v15 == v6) {
      goto LABEL_8;
    }
    goto LABEL_5;
  }
  id v10 = @"Input port is out of scope";
LABEL_6:
  +[NUError invalidError:v10 object:v6];
  BOOL v13 = 0;
  *a4 = (id)objc_claimAutoreleasedReturnValue();
LABEL_9:

  return v13;
}

- (id)outputPortMatching:(id)a3
{
  id v4 = [(_NUPipeline *)self outputChannelMatching:a3];
  if (v4)
  {
    char v5 = [(_NUPipeline *)self outputPortForChannel:v4];
  }
  else
  {
    char v5 = 0;
  }

  return v5;
}

- (id)inputPortMatching:(id)a3
{
  id v4 = [(_NUPipeline *)self inputChannelMatching:a3];
  if (v4)
  {
    char v5 = [(_NUPipeline *)self inputPortForChannel:v4];
  }
  else
  {
    char v5 = 0;
  }

  return v5;
}

- (id)outputChannelMatching:(id)a3
{
  id v6 = a3;
  id v3 = v6;
  id v4 = PFFind();

  return v4;
}

- (id)inputChannelMatching:(id)a3
{
  id v6 = a3;
  id v3 = v6;
  id v4 = PFFind();

  return v4;
}

- (id)addOutputChannel:(id)a3
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!v4)
  {
    id v8 = NUAssertLogger_5149();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      id v9 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "channel != nil");
      *(_DWORD *)buf = 138543362;
      uint64_t v41 = v9;
      _os_log_error_impl(&dword_1A9892000, v8, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    BOOL v11 = NUAssertLogger_5149();
    BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v12)
      {
        BOOL v22 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        BOOL v23 = (void *)MEMORY[0x1E4F29060];
        id v24 = v22;
        BOOL v25 = [v23 callStackSymbols];
        uint64_t v26 = [v25 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        uint64_t v41 = v22;
        __int16 v42 = 2114;
        uint64_t v43 = v26;
        _os_log_error_impl(&dword_1A9892000, v11, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v12)
    {
      BOOL v13 = [MEMORY[0x1E4F29060] callStackSymbols];
      BOOL v14 = [v13 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      uint64_t v41 = v14;
      _os_log_error_impl(&dword_1A9892000, v11, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[_NUPipeline addOutputChannel:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/API/NUPipeline.m", 228, @"Invalid parameter not satisfying: %s", v27, v28, v29, v30, (uint64_t)"channel != nil");
  }
  char v5 = v4;
  [(NSMutableDictionary *)self->_outputPorts objectForKey:v4];
  if (objc_claimAutoreleasedReturnValue())
  {
    id v15 = NUAssertLogger_5149();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      id v16 = [NSString stringWithFormat:@"Channel already exists: %@", v5];
      *(_DWORD *)buf = 138543362;
      uint64_t v41 = v16;
      _os_log_error_impl(&dword_1A9892000, v15, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    BOOL v17 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    BOOL v18 = NUAssertLogger_5149();
    BOOL v19 = os_log_type_enabled(v18, OS_LOG_TYPE_ERROR);
    if (v17)
    {
      if (v19)
      {
        uint64_t v31 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        uint64_t v32 = (void *)MEMORY[0x1E4F29060];
        id v33 = v31;
        uint64_t v34 = [v32 callStackSymbols];
        uint64_t v35 = [v34 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        uint64_t v41 = v31;
        __int16 v42 = 2114;
        uint64_t v43 = v35;
        _os_log_error_impl(&dword_1A9892000, v18, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v19)
    {
      uint64_t v20 = [MEMORY[0x1E4F29060] callStackSymbols];
      BOOL v21 = [v20 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      uint64_t v41 = v21;
      _os_log_error_impl(&dword_1A9892000, v18, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[_NUPipeline addOutputChannel:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/API/NUPipeline.m", 230, @"Channel already exists: %@", v36, v37, v38, v39, (uint64_t)v5);
  }
  id v6 = [[_NUChannelPort alloc] initWithChannel:v5];
  [(NSMutableArray *)self->_outputChannels addObject:v5];
  [(NSMutableDictionary *)self->_outputPorts setObject:v6 forKey:v5];
  [(_NUChannelPort *)v6 setPipeline:self];

  return v6;
}

- (id)addInputChannel:(id)a3
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!v4)
  {
    id v8 = NUAssertLogger_5149();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      id v9 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "channel != nil");
      *(_DWORD *)buf = 138543362;
      uint64_t v41 = v9;
      _os_log_error_impl(&dword_1A9892000, v8, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    BOOL v11 = NUAssertLogger_5149();
    BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v12)
      {
        BOOL v22 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        BOOL v23 = (void *)MEMORY[0x1E4F29060];
        id v24 = v22;
        BOOL v25 = [v23 callStackSymbols];
        uint64_t v26 = [v25 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        uint64_t v41 = v22;
        __int16 v42 = 2114;
        uint64_t v43 = v26;
        _os_log_error_impl(&dword_1A9892000, v11, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v12)
    {
      BOOL v13 = [MEMORY[0x1E4F29060] callStackSymbols];
      BOOL v14 = [v13 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      uint64_t v41 = v14;
      _os_log_error_impl(&dword_1A9892000, v11, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[_NUPipeline addInputChannel:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/API/NUPipeline.m", 217, @"Invalid parameter not satisfying: %s", v27, v28, v29, v30, (uint64_t)"channel != nil");
  }
  char v5 = v4;
  [(NSMutableDictionary *)self->_inputPorts objectForKey:v4];
  if (objc_claimAutoreleasedReturnValue())
  {
    id v15 = NUAssertLogger_5149();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      id v16 = [NSString stringWithFormat:@"Channel already exists: %@", v5];
      *(_DWORD *)buf = 138543362;
      uint64_t v41 = v16;
      _os_log_error_impl(&dword_1A9892000, v15, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    BOOL v17 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    BOOL v18 = NUAssertLogger_5149();
    BOOL v19 = os_log_type_enabled(v18, OS_LOG_TYPE_ERROR);
    if (v17)
    {
      if (v19)
      {
        uint64_t v31 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        uint64_t v32 = (void *)MEMORY[0x1E4F29060];
        id v33 = v31;
        uint64_t v34 = [v32 callStackSymbols];
        uint64_t v35 = [v34 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        uint64_t v41 = v31;
        __int16 v42 = 2114;
        uint64_t v43 = v35;
        _os_log_error_impl(&dword_1A9892000, v18, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v19)
    {
      uint64_t v20 = [MEMORY[0x1E4F29060] callStackSymbols];
      BOOL v21 = [v20 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      uint64_t v41 = v21;
      _os_log_error_impl(&dword_1A9892000, v18, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[_NUPipeline addInputChannel:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/API/NUPipeline.m", 219, @"Channel already exists: %@", v36, v37, v38, v39, (uint64_t)v5);
  }
  id v6 = [[_NUChannelPort alloc] initWithChannel:v5];
  [(_NUChannelPort *)v6 setPipeline:self];
  [(NSMutableArray *)self->_inputChannels addObject:v5];
  [(NSMutableDictionary *)self->_inputPorts setObject:v6 forKey:v5];

  return v6;
}

- (id)outputPortForChannel:(id)a3
{
  return (id)[(NSMutableDictionary *)self->_outputPorts objectForKey:a3];
}

- (id)inputPortForChannel:(id)a3
{
  return (id)[(NSMutableDictionary *)self->_inputPorts objectForKey:a3];
}

- (NSArray)outputChannels
{
  v2 = (void *)[(NSMutableArray *)self->_outputChannels copy];

  return (NSArray *)v2;
}

- (NSArray)inputChannels
{
  v2 = (void *)[(NSMutableArray *)self->_inputChannels copy];

  return (NSArray *)v2;
}

- (NSString)name
{
  v2 = [(_NUPipeline *)self identifier];
  id v3 = [v2 name];

  return (NSString *)v3;
}

- (_NUPipeline)initWithIdentifier:(id)a3
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v4 = (NUIdentifier *)a3;
  if (!v4)
  {
    uint64_t v20 = NUAssertLogger_5149();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      BOOL v21 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "identifier != nil");
      *(_DWORD *)buf = 138543362;
      uint64_t v38 = v21;
      _os_log_error_impl(&dword_1A9892000, v20, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    BOOL v23 = NUAssertLogger_5149();
    BOOL v24 = os_log_type_enabled(v23, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v24)
      {
        uint64_t v27 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        uint64_t v28 = (void *)MEMORY[0x1E4F29060];
        id v29 = v27;
        uint64_t v30 = [v28 callStackSymbols];
        uint64_t v31 = [v30 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        uint64_t v38 = v27;
        __int16 v39 = 2114;
        id v40 = v31;
        _os_log_error_impl(&dword_1A9892000, v23, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v24)
    {
      BOOL v25 = [MEMORY[0x1E4F29060] callStackSymbols];
      uint64_t v26 = [v25 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      uint64_t v38 = v26;
      _os_log_error_impl(&dword_1A9892000, v23, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[_NUPipeline initWithIdentifier:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/API/NUPipeline.m", 185, @"Invalid parameter not satisfying: %s", v32, v33, v34, v35, (uint64_t)"identifier != nil");
  }
  char v5 = v4;
  v36.receiver = self;
  v36.super_class = (Class)_NUPipeline;
  id v6 = [(_NUPipeline *)&v36 init];
  identifier = v6->_identifier;
  v6->_identifier = v5;
  id v8 = v5;

  id v9 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
  inputChannels = v6->_inputChannels;
  v6->_inputChannels = v9;

  BOOL v11 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
  inputPorts = v6->_inputPorts;
  v6->_inputPorts = v11;

  BOOL v13 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
  outputChannels = v6->_outputChannels;
  v6->_outputChannels = v13;

  id v15 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
  outputPorts = v6->_outputPorts;
  v6->_outputPorts = v15;

  BOOL v17 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
  innerPipelines = v6->_innerPipelines;
  v6->_innerPipelines = v17;

  return v6;
}

+ (id)buildSourcePipeline
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  v2 = objc_alloc_init(_NUSourcePipelineBuilder);
  id v23 = 0;
  id v3 = [(_NUSourcePipelineBuilder *)v2 buildPipeline:&v23];
  id v4 = v23;
  if (!v3)
  {
    id v6 = NUAssertLogger_5149();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      uint64_t v7 = [NSString stringWithFormat:@"Failed to build source pipeline!"];
      *(_DWORD *)buf = 138543362;
      BOOL v25 = v7;
      _os_log_error_impl(&dword_1A9892000, v6, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    id v9 = NUAssertLogger_5149();
    BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v10)
      {
        BOOL v13 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        BOOL v14 = (void *)MEMORY[0x1E4F29060];
        id v15 = v13;
        id v16 = [v14 callStackSymbols];
        BOOL v17 = [v16 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        BOOL v25 = v13;
        __int16 v26 = 2114;
        uint64_t v27 = v17;
        _os_log_error_impl(&dword_1A9892000, v9, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v10)
    {
      BOOL v11 = [MEMORY[0x1E4F29060] callStackSymbols];
      BOOL v12 = [v11 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      BOOL v25 = v12;
      _os_log_error_impl(&dword_1A9892000, v9, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"+[_NUPipeline buildSourcePipeline]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/API/NUPipeline.m", 554, @"Failed to build source pipeline!", v18, v19, v20, v21, v22);
  }

  return v3;
}

+ (id)buildPipelineWithIdentifier:(id)a3 error:(id *)a4
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (!v5)
  {
    BOOL v13 = NUAssertLogger_5149();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      BOOL v14 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "identifier != nil");
      *(_DWORD *)buf = 138543362;
      uint64_t v31 = v14;
      _os_log_error_impl(&dword_1A9892000, v13, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    id v16 = NUAssertLogger_5149();
    BOOL v17 = os_log_type_enabled(v16, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v17)
      {
        uint64_t v20 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        uint64_t v21 = (void *)MEMORY[0x1E4F29060];
        id v22 = v20;
        id v23 = [v21 callStackSymbols];
        BOOL v24 = [v23 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        uint64_t v31 = v20;
        __int16 v32 = 2114;
        uint64_t v33 = v24;
        _os_log_error_impl(&dword_1A9892000, v16, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v17)
    {
      uint64_t v18 = [MEMORY[0x1E4F29060] callStackSymbols];
      uint64_t v19 = [v18 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      uint64_t v31 = v19;
      _os_log_error_impl(&dword_1A9892000, v16, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"+[_NUPipeline buildPipelineWithIdentifier:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/API/NUPipeline.m", 528, @"Invalid parameter not satisfying: %s", v25, v26, v27, v28, (uint64_t)"identifier != nil");
  }
  id v6 = v5;
  uint64_t v7 = +[NUPipelineBuilderRegistry pipelineBuilderForIdentifier:v5];
  if (v7)
  {
    id v8 = [[_NUPipeline alloc] initWithIdentifier:v6];
    id v29 = 0;
    if ([v7 buildPipeline:v8 error:&v29])
    {
      id v9 = v8;
    }
    else
    {
      id v10 = v29;
      id v11 = +[NUError errorWithCode:1 reason:@"Pipeline builder failure" object:v6 underlyingError:v10];

      id v9 = 0;
      *a4 = v11;
    }
  }
  else
  {
    +[NUError notFoundError:@"Pipeline builder not found for identifier" object:v6];
    id v9 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v9;
}

+ (id)buildFilterPipelineWithName:(id)a3 error:(id *)a4
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (!v5)
  {
    BOOL v14 = NUAssertLogger_5149();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      id v15 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "filterName != nil");
      *(_DWORD *)buf = 138543362;
      __int16 v32 = v15;
      _os_log_error_impl(&dword_1A9892000, v14, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    BOOL v17 = NUAssertLogger_5149();
    BOOL v18 = os_log_type_enabled(v17, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v18)
      {
        uint64_t v21 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        id v22 = (void *)MEMORY[0x1E4F29060];
        id v23 = v21;
        BOOL v24 = [v22 callStackSymbols];
        uint64_t v25 = [v24 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        __int16 v32 = v21;
        __int16 v33 = 2114;
        uint64_t v34 = v25;
        _os_log_error_impl(&dword_1A9892000, v17, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v18)
    {
      uint64_t v19 = [MEMORY[0x1E4F29060] callStackSymbols];
      uint64_t v20 = [v19 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      __int16 v32 = v20;
      _os_log_error_impl(&dword_1A9892000, v17, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"+[_NUPipeline buildFilterPipelineWithName:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/API/NUPipeline.m", 508, @"Invalid parameter not satisfying: %s", v26, v27, v28, v29, (uint64_t)"filterName != nil");
  }
  id v6 = v5;
  uint64_t v7 = [[_NUCIFilterPipelineBuilder alloc] initWithCIFilterName:v5];
  id v30 = 0;
  id v8 = [(_NUCIFilterPipelineBuilder *)v7 buildPipeline:&v30];
  id v9 = v8;
  if (v8)
  {
    id v10 = v8;
  }
  else
  {
    id v11 = v30;
    id v12 = +[NUError errorWithCode:1 reason:@"Failed to build filter pipeline" object:v6 underlyingError:v11];

    *a4 = v12;
  }

  return v9;
}

@end