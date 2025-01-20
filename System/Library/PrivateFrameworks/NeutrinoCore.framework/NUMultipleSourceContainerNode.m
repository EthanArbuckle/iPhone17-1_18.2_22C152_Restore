@interface NUMultipleSourceContainerNode
- (NSArray)sources;
- (NUMultipleSourceContainerNode)initWithAssetIdentifier:(id)a3;
- (NUMultipleSourceContainerNode)initWithSourceNodes:(id)a3 assetIdentifier:(id)a4;
- (id)description;
- (id)primarySourceNode;
- (id)resolveSourceNodeForPipelineState:(id)a3 foundScale:(id *)a4 error:(id *)a5;
- (id)sourceNodeForPipelineState:(id)a3 error:(id *)a4;
- (void)setSources:(id)a3;
@end

@implementation NUMultipleSourceContainerNode

- (void).cxx_destruct
{
}

- (void)setSources:(id)a3
{
}

- (NSArray)sources
{
  return (NSArray *)objc_getProperty(self, a2, 168, 1);
}

- (id)sourceNodeForPipelineState:(id)a3 error:(id *)a4
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (!a4)
  {
    v11 = NUAssertLogger_7355();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v12 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "error != NULL");
      *(_DWORD *)buf = 138543362;
      v28 = v12;
      _os_log_error_impl(&dword_1A9892000, v11, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    v14 = NUAssertLogger_7355();
    BOOL v15 = os_log_type_enabled(v14, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v15)
      {
        v18 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v19 = (void *)MEMORY[0x1E4F29060];
        id v20 = v18;
        v21 = [v19 callStackSymbols];
        v22 = [v21 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v28 = v18;
        __int16 v29 = 2114;
        v30 = v22;
        _os_log_error_impl(&dword_1A9892000, v14, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v15)
    {
      v16 = [MEMORY[0x1E4F29060] callStackSymbols];
      v17 = [v16 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v28 = v17;
      _os_log_error_impl(&dword_1A9892000, v14, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUMultipleSourceContainerNode sourceNodeForPipelineState:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderSourceNode.m", 339, @"Invalid parameter not satisfying: %s", v23, v24, v25, v26, (uint64_t)"error != NULL");
  }
  v7 = v6;
  v8 = [(NUMultipleSourceContainerNode *)self primarySourceNode];
  if ([v8 load:a4] && objc_msgSend(v8, "isValid:", a4)) {
    id v9 = v8;
  }
  else {
    id v9 = 0;
  }

  return v9;
}

- (id)resolveSourceNodeForPipelineState:(id)a3 foundScale:(id *)a4 error:(id *)a5
{
  uint64_t v87 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  if (!a5)
  {
    v44 = NUAssertLogger_7355();
    if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
    {
      v45 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "error != NULL");
      *(_DWORD *)buf = 138543362;
      v84 = v45;
      _os_log_error_impl(&dword_1A9892000, v44, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    v47 = NUAssertLogger_7355();
    BOOL v48 = os_log_type_enabled(v47, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v48)
      {
        v51 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v52 = (void *)MEMORY[0x1E4F29060];
        id v53 = v51;
        v54 = [v52 callStackSymbols];
        v55 = [v54 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v84 = v51;
        __int16 v85 = 2114;
        v86 = v55;
        _os_log_error_impl(&dword_1A9892000, v47, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v48)
    {
      v49 = [MEMORY[0x1E4F29060] callStackSymbols];
      v50 = [v49 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v84 = v50;
      _os_log_error_impl(&dword_1A9892000, v47, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUMultipleSourceContainerNode resolveSourceNodeForPipelineState:foundScale:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderSourceNode.m", 251, @"Invalid parameter not satisfying: %s", v56, v57, v58, v59, (uint64_t)"error != NULL");
  }
  id v9 = v8;
  v10 = [(NUMultipleSourceContainerNode *)self primarySourceNode];
  if (![v10 load:a5] || !objc_msgSend(v10, "isValid:", a5))
  {
    id v41 = 0;
    goto LABEL_40;
  }
  uint64_t v11 = [v9 mediaComponentType];
  v12 = self->_sources;
  if ([(NSArray *)v12 count])
  {
    uint64_t v70 = [v9 scale];
    if (v70 >= 1 && v13 > 0)
    {
      uint64_t v68 = v13;
      uint64_t v15 = NUScaleZero;
      uint64_t v14 = unk_1E9807168;
      long long v73 = NUScaleOne;
      long long v78 = 0u;
      long long v79 = 0u;
      long long v80 = 0u;
      long long v81 = 0u;
      v16 = v12;
      uint64_t v17 = [(NSArray *)v16 countByEnumeratingWithState:&v78 objects:v82 count:16];
      if (v17)
      {
        uint64_t v18 = v17;
        v61 = a5;
        v62 = a4;
        v60 = self;
        v63 = v12;
        v64 = v10;
        v69 = v9;
        v65 = 0;
        v66 = 0;
        id v19 = 0;
        uint64_t v20 = *(void *)v79;
        uint64_t v71 = *(void *)v79;
        v72 = v16;
        do
        {
          uint64_t v21 = 0;
          uint64_t v67 = v18;
          do
          {
            if (*(void *)v79 != v20) {
              objc_enumerationMutation(v16);
            }
            v22 = *(void **)(*((void *)&v78 + 1) + 8 * v21);
            id v77 = 0;
            int v23 = [v22 load:&v77];
            id v24 = v77;

            if (v23)
            {
              id v76 = 0;
              int v25 = [v22 isValid:&v76];
              id v19 = v76;

              if (v25)
              {
                id v75 = 0;
                uint64_t v26 = [v22 outputImageGeometry:&v75];
                id v27 = v75;

                uint64_t v28 = v15;
                if (v26)
                {
                  id v74 = 0;
                  int v29 = [v22 supportsPipelineState:v69 error:&v74];
                  id v19 = v74;

                  if (!v29) {
                    goto LABEL_23;
                  }
                  uint64_t v30 = [v26 renderScale];
                  uint64_t v32 = v31;
                  if (NUScaleCompare(v30, v31, v70, v68) < 0
                    && (NUScaleCompare(v30, v32, v28, v14) & 0x8000000000000000) == 0)
                  {
                    id v33 = v22;

                    uint64_t v28 = v30;
                    uint64_t v14 = v32;
                    v66 = v33;
                  }
                  if (NUScaleCompare(v30, v32, v70, v68) < 0)
                  {
LABEL_23:
                    uint64_t v32 = *((void *)&v73 + 1);
                    uint64_t v30 = v73;
                  }
                  else
                  {
                    if (NUScaleCompare(v30, v32, v73, *((uint64_t *)&v73 + 1)) <= 0)
                    {
                      id v34 = v22;

                      v65 = v34;
                    }
                    else
                    {
                      uint64_t v32 = *((void *)&v73 + 1);
                      uint64_t v30 = v73;
                    }
                    uint64_t v18 = v67;
                  }
                }
                else
                {
                  uint64_t v32 = *((void *)&v73 + 1);
                  uint64_t v30 = v73;
                  id v19 = v27;
                }

                *(void *)&long long v73 = v30;
                *((void *)&v73 + 1) = v32;
                uint64_t v15 = v28;
                uint64_t v20 = v71;
                v16 = v72;
              }
            }
            else
            {
              id v19 = v24;
            }
            ++v21;
          }
          while (v18 != v21);
          uint64_t v18 = [(NSArray *)v16 countByEnumeratingWithState:&v78 objects:v82 count:16];
        }
        while (v18);

        v36 = v65;
        v35 = v66;
        v37 = v65;
        int64_t v38 = *((void *)&v73 + 1);
        int64_t v39 = v73;
        if (v65 || (v37 = v66, v39 = v15, int64_t v38 = v14, v66))
        {
          id v40 = v37;
          v62->var0 = v39;
          v62->var1 = v38;
          id v41 = v40;
          id v9 = v69;
          v12 = v63;
          v10 = v64;
LABEL_38:

          goto LABEL_39;
        }
        id v9 = v69;
        v12 = v63;
        v10 = v64;
        self = v60;
        a5 = v61;
      }
      else
      {

        id v19 = 0;
      }
      +[NUError errorWithCode:5 reason:@"Couldn't find any matching source node" object:self underlyingError:v19];
      v36 = 0;
      v35 = 0;
      id v41 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_38;
    }
    *a4 = ($0AC6E346AE4835514AAA8AC86D8F4844)NUScaleUnknown;
    id v41 = [(NSArray *)v12 objectAtIndexedSubscript:0];
  }
  else
  {
    v42 = [NSNumber numberWithInteger:v11];
    *a5 = +[NUError missingError:@"No matching source for type" object:v42];

    id v41 = 0;
  }
LABEL_39:

LABEL_40:

  return v41;
}

- (id)primarySourceNode
{
  return [(NSArray *)self->_sources objectAtIndexedSubscript:0];
}

- (id)description
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  [v3 appendFormat:@"<%@:%p>", v5, self];

  objc_msgSend(v3, "appendFormat:", @"Count:%lu ", -[NSArray count](self->_sources, "count"));
  if ([(NSArray *)self->_sources count])
  {
    unint64_t v6 = 0;
    do
    {
      if ([(NSArray *)self->_sources count] >= 2) {
        [v3 appendFormat:@"\n"];
      }
      v7 = [(NSArray *)self->_sources objectAtIndexedSubscript:v6];
      id v8 = [v7 description];
      [v3 appendFormat:@"[%lu]=%@", v6, v8];

      ++v6;
    }
    while (v6 < [(NSArray *)self->_sources count]);
  }

  return v3;
}

- (NUMultipleSourceContainerNode)initWithSourceNodes:(id)a3 assetIdentifier:(id)a4
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (![v6 count])
  {
    id v19 = NUAssertLogger_7355();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      uint64_t v20 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "nodes.count >= 1");
      *(_DWORD *)buf = 138543362;
      v42 = v20;
      _os_log_error_impl(&dword_1A9892000, v19, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    v22 = NUAssertLogger_7355();
    BOOL v23 = os_log_type_enabled(v22, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v23)
      {
        uint64_t v26 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        id v27 = (void *)MEMORY[0x1E4F29060];
        id v28 = v26;
        int v29 = [v27 callStackSymbols];
        uint64_t v30 = [v29 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v42 = v26;
        __int16 v43 = 2114;
        v44 = v30;
        _os_log_error_impl(&dword_1A9892000, v22, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v23)
    {
      id v24 = [MEMORY[0x1E4F29060] callStackSymbols];
      int v25 = [v24 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v42 = v25;
      _os_log_error_impl(&dword_1A9892000, v22, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUMultipleSourceContainerNode initWithSourceNodes:assetIdentifier:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderSourceNode.m", 214, @"Invalid parameter not satisfying: %s", v31, v32, v33, v34, (uint64_t)"nodes.count >= 1");
  }
  v39.receiver = self;
  v39.super_class = (Class)NUMultipleSourceContainerNode;
  id v8 = [(NUSourceContainerNode *)&v39 initWithAssetIdentifier:v7];
  uint64_t v9 = [v6 copy];
  sources = v8->_sources;
  v8->_sources = (NSArray *)v9;

  uint64_t v11 = [(NUMultipleSourceContainerNode *)v8 primarySourceNode];
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  id v12 = v6;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v35 objects:v40 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v36;
    do
    {
      uint64_t v16 = 0;
      do
      {
        if (*(void *)v36 != v15) {
          objc_enumerationMutation(v12);
        }
        uint64_t v17 = *(void **)(*((void *)&v35 + 1) + 8 * v16);
        if (v17 != v11) {
          [v17 setOriginalNode:v11];
        }
        ++v16;
      }
      while (v14 != v16);
      uint64_t v14 = [v12 countByEnumeratingWithState:&v35 objects:v40 count:16];
    }
    while (v14);
  }

  return v8;
}

- (NUMultipleSourceContainerNode)initWithAssetIdentifier:(id)a3
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (_NULogOnceToken != -1) {
    dispatch_once(&_NULogOnceToken, &__block_literal_global_317);
  }
  v5 = (void *)_NUAssertLogger;
  if (os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR))
  {
    id v6 = NSString;
    id v7 = v5;
    id v8 = (objc_class *)objc_opt_class();
    uint64_t v9 = NSStringFromClass(v8);
    v10 = NSStringFromSelector(a2);
    uint64_t v11 = [v6 stringWithFormat:@"Initializer not available: -[%@ %@], use designated initializer instead.", v9, v10];
    *(_DWORD *)buf = 138543362;
    uint64_t v31 = v11;
    _os_log_error_impl(&dword_1A9892000, v7, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    uint64_t v12 = _NULogOnceToken;
    if (!dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey))
    {
      if (v12 != -1) {
        dispatch_once(&_NULogOnceToken, &__block_literal_global_317);
      }
      goto LABEL_8;
    }
    if (v12 != -1) {
      dispatch_once(&_NULogOnceToken, &__block_literal_global_317);
    }
  }
  else if (!dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey))
  {
LABEL_8:
    uint64_t v13 = (void *)_NUAssertLogger;
    if (!os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR)) {
      goto LABEL_15;
    }
    uint64_t v14 = (void *)MEMORY[0x1E4F29060];
    uint64_t v15 = v13;
    uint64_t v16 = [v14 callStackSymbols];
    uint64_t v17 = [v16 componentsJoinedByString:@"\n"];
    *(_DWORD *)buf = 138543362;
    uint64_t v31 = v17;
    _os_log_error_impl(&dword_1A9892000, v15, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    goto LABEL_14;
  }
  uint64_t v18 = (void *)_NUAssertLogger;
  if (!os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR)) {
    goto LABEL_15;
  }
  specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
  uint64_t v20 = (void *)MEMORY[0x1E4F29060];
  id v21 = specific;
  uint64_t v15 = v18;
  v22 = [v20 callStackSymbols];
  BOOL v23 = [v22 componentsJoinedByString:@"\n"];
  *(_DWORD *)buf = 138543618;
  uint64_t v31 = specific;
  __int16 v32 = 2114;
  uint64_t v33 = v23;
  _os_log_error_impl(&dword_1A9892000, v15, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

LABEL_14:
LABEL_15:
  id v24 = (objc_class *)objc_opt_class();
  uint64_t v25 = NSStringFromClass(v24);
  NSStringFromSelector(a2);
  objc_claimAutoreleasedReturnValue();
  _NUAssertFailHandler((uint64_t)"-[NUMultipleSourceContainerNode initWithAssetIdentifier:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderSourceNode.m", 209, @"Initializer not available: -[%@ %@], use designated initializer instead.", v26, v27, v28, v29, v25);
}

@end