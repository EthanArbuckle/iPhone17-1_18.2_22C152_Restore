@interface NUGeometrySpaceMap
+ (BOOL)_canReduceSpaces:(id)a3 withSpaces:(id)a4;
+ (id)_reduceSpaces:(id)a3 withSpaces:(id)a4;
- (NUGeometrySpaceMap)init;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)spaceForKey:(id)a3;
- (id)spacesForKey:(id)a3;
- (id)taggedSpacesForKey:(id)a3;
- (id)transformWithSourceSpace:(id)a3 destinationSpace:(id)a4 error:(id *)a5;
- (unint64_t)count;
- (void)addTagNode:(id)a3;
- (void)applyTransform:(id)a3;
- (void)enumerateSpacesUsingBlock:(id)a3;
- (void)mergeWithSpaceMap:(id)a3;
- (void)setSpace:(id)a3 forKey:(id)a4;
- (void)setSpaces:(id)a3 forKey:(id)a4;
- (void)setSpacesFromMap:(id)a3 andPruneAgainstTagNode:(id)a4 withPath:(id)a5;
@end

@implementation NUGeometrySpaceMap

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_spaces, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = [(NSMutableDictionary *)self->_spaces count];
  if ([(NSMutableDictionary *)self->_spaces count]) {
    spaces = self->_spaces;
  }
  else {
    spaces = (NSMutableDictionary *)@"{}";
  }
  return (id)[v3 stringWithFormat:@"<%@:%p spaces (%lu)  :: %@>", v4, self, v5, spaces];
}

- (id)transformWithSourceSpace:(id)a3 destinationSpace:(id)a4 error:(id *)a5
{
  uint64_t v78 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  if (!v8)
  {
    v26 = NUAssertLogger_8557();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      v27 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "srcSpaceName != nil");
      *(_DWORD *)buf = 138543362;
      v75 = v27;
      _os_log_error_impl(&dword_1A9892000, v26, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    v29 = NUAssertLogger_8557();
    BOOL v30 = os_log_type_enabled(v29, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v30)
      {
        v47 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v48 = (void *)MEMORY[0x1E4F29060];
        id v49 = v47;
        v50 = [v48 callStackSymbols];
        v51 = [v50 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v75 = v47;
        __int16 v76 = 2114;
        v77 = v51;
        _os_log_error_impl(&dword_1A9892000, v29, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v30)
    {
      v31 = [MEMORY[0x1E4F29060] callStackSymbols];
      v32 = [v31 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v75 = v32;
      _os_log_error_impl(&dword_1A9892000, v29, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUGeometrySpaceMap transformWithSourceSpace:destinationSpace:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Geometry/NUGeometrySpaceMap.m", 418, @"Invalid parameter not satisfying: %s", v52, v53, v54, v55, (uint64_t)"srcSpaceName != nil");
  }
  v10 = v9;
  if (!v9)
  {
    v33 = NUAssertLogger_8557();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
    {
      v34 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "dstSpaceName != nil");
      *(_DWORD *)buf = 138543362;
      v75 = v34;
      _os_log_error_impl(&dword_1A9892000, v33, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    v35 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    v36 = NUAssertLogger_8557();
    BOOL v37 = os_log_type_enabled(v36, OS_LOG_TYPE_ERROR);
    if (v35)
    {
      if (v37)
      {
        v56 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v57 = (void *)MEMORY[0x1E4F29060];
        id v58 = v56;
        v59 = [v57 callStackSymbols];
        v60 = [v59 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v75 = v56;
        __int16 v76 = 2114;
        v77 = v60;
        _os_log_error_impl(&dword_1A9892000, v36, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v37)
    {
      v38 = [MEMORY[0x1E4F29060] callStackSymbols];
      v39 = [v38 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v75 = v39;
      _os_log_error_impl(&dword_1A9892000, v36, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUGeometrySpaceMap transformWithSourceSpace:destinationSpace:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Geometry/NUGeometrySpaceMap.m", 419, @"Invalid parameter not satisfying: %s", v61, v62, v63, v64, (uint64_t)"dstSpaceName != nil");
  }
  if (!a5)
  {
    v40 = NUAssertLogger_8557();
    if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
    {
      v41 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "error != NULL");
      *(_DWORD *)buf = 138543362;
      v75 = v41;
      _os_log_error_impl(&dword_1A9892000, v40, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    v42 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    v43 = NUAssertLogger_8557();
    BOOL v44 = os_log_type_enabled(v43, OS_LOG_TYPE_ERROR);
    if (v42)
    {
      if (v44)
      {
        v65 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v66 = (void *)MEMORY[0x1E4F29060];
        id v67 = v65;
        v68 = [v66 callStackSymbols];
        v69 = [v68 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v75 = v65;
        __int16 v76 = 2114;
        v77 = v69;
        _os_log_error_impl(&dword_1A9892000, v43, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v44)
    {
      v45 = [MEMORY[0x1E4F29060] callStackSymbols];
      v46 = [v45 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v75 = v46;
      _os_log_error_impl(&dword_1A9892000, v43, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUGeometrySpaceMap transformWithSourceSpace:destinationSpace:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Geometry/NUGeometrySpaceMap.m", 420, @"Invalid parameter not satisfying: %s", v70, v71, v72, v73, (uint64_t)"error != NULL");
  }
  v11 = [(NUGeometrySpaceMap *)self taggedSpacesForKey:v8];
  v12 = v11;
  if (!v11)
  {
    v23 = +[NUError missingError:@"No such space" object:v8];
LABEL_11:
    v22 = 0;
    *a5 = v23;
    goto LABEL_16;
  }
  if ([v11 count] != 1)
  {
    v23 = +[NUError errorWithCode:2 reason:@"Ill-posed space map / incorrect number of entries for the source space" object:v12];
    goto LABEL_11;
  }
  v13 = [(NUGeometrySpaceMap *)self taggedSpacesForKey:v10];
  v14 = v13;
  if (!v13)
  {
    v24 = +[NUError missingError:@"No such space" object:v10];
LABEL_14:
    v22 = 0;
    *a5 = v24;
    goto LABEL_15;
  }
  if ([v13 count] != 1)
  {
    v24 = +[NUError errorWithCode:2 reason:@"Ill-posed space map / incorrect number of entries for the destination space" object:v14];
    goto LABEL_14;
  }
  v15 = [v12 objectAtIndexedSubscript:0];
  v16 = [v15 space];

  v17 = [v14 objectAtIndexedSubscript:0];
  v18 = [v17 space];

  v19 = [NUCompoundTransform alloc];
  v20 = [v16 transformStack];
  v21 = [v18 transformStack];
  v22 = [(NUCompoundTransform *)v19 initWithSrcTransforms:v20 dstTransforms:v21];

LABEL_15:
LABEL_16:

  return v22;
}

- (void)mergeWithSpaceMap:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!v4)
  {
    v7 = NUAssertLogger_8557();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      id v8 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "otherSpaceMap != nil");
      *(_DWORD *)buf = 138543362;
      v27 = v8;
      _os_log_error_impl(&dword_1A9892000, v7, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    v10 = NUAssertLogger_8557();
    BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v11)
      {
        v14 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v15 = (void *)MEMORY[0x1E4F29060];
        id v16 = v14;
        v17 = [v15 callStackSymbols];
        v18 = [v17 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v27 = v14;
        __int16 v28 = 2114;
        v29 = v18;
        _os_log_error_impl(&dword_1A9892000, v10, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v11)
    {
      v12 = [MEMORY[0x1E4F29060] callStackSymbols];
      v13 = [v12 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v27 = v13;
      _os_log_error_impl(&dword_1A9892000, v10, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUGeometrySpaceMap mergeWithSpaceMap:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Geometry/NUGeometrySpaceMap.m", 373, @"Invalid parameter not satisfying: %s", v19, v20, v21, v22, (uint64_t)"otherSpaceMap != nil");
  }
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __40__NUGeometrySpaceMap_mergeWithSpaceMap___block_invoke;
  block[3] = &unk_1E5D95E18;
  id v24 = v4;
  v25 = self;
  id v6 = v4;
  dispatch_sync(queue, block);
}

uint64_t __40__NUGeometrySpaceMap_mergeWithSpaceMap___block_invoke(uint64_t a1)
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __40__NUGeometrySpaceMap_mergeWithSpaceMap___block_invoke_2;
  v3[3] = &unk_1E5D94598;
  v1 = *(void **)(a1 + 32);
  v3[4] = *(void *)(a1 + 40);
  return [v1 enumerateSpacesUsingBlock:v3];
}

void __40__NUGeometrySpaceMap_mergeWithSpaceMap___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v11 = a2;
  id v5 = a3;
  id v6 = [*(id *)(*(void *)(a1 + 32) + 16) objectForKey:v11];
  v7 = v6;
  if (v6)
  {
    if ([v6 isEqualToArray:v5]) {
      goto LABEL_9;
    }
    if (!+[NUGeometrySpaceMap _canReduceSpaces:v7 withSpaces:v5])
    {
      id v9 = (void *)[v7 mutableCopy];
      v10 = (void *)[objc_alloc(MEMORY[0x1E4F1C978]) initWithArray:v5 copyItems:1];
      [v9 addObjectsFromArray:v10];
      [*(id *)(*(void *)(a1 + 32) + 16) setObject:v9 forKey:v11];

      goto LABEL_8;
    }
    uint64_t v8 = +[NUGeometrySpaceMap _reduceSpaces:v7 withSpaces:v5];
  }
  else
  {
    uint64_t v8 = [objc_alloc(MEMORY[0x1E4F1C978]) initWithArray:v5 copyItems:1];
  }
  id v9 = (void *)v8;
  [*(id *)(*(void *)(a1 + 32) + 16) setObject:v8 forKey:v11];
LABEL_8:

LABEL_9:
}

- (void)enumerateSpacesUsingBlock:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __48__NUGeometrySpaceMap_enumerateSpacesUsingBlock___block_invoke;
  v7[3] = &unk_1E5D95F30;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(queue, v7);
}

uint64_t __48__NUGeometrySpaceMap_enumerateSpacesUsingBlock___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 16) enumerateKeysAndObjectsUsingBlock:*(void *)(a1 + 40)];
}

- (void)setSpacesFromMap:(id)a3 andPruneAgainstTagNode:(id)a4 withPath:(id)a5
{
  uint64_t v69 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [v9 geometryNode];
  if (!v11)
  {
    v35 = NUAssertLogger_8557();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
    {
      v36 = [NSString stringWithFormat:@"Cannot find the node for the given tag '%@' in the map", v10];
      *(_DWORD *)buf = 138543362;
      v66 = v36;
      _os_log_error_impl(&dword_1A9892000, v35, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    v38 = NUAssertLogger_8557();
    BOOL v39 = os_log_type_enabled(v38, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v39)
      {
        v42 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v43 = (void *)MEMORY[0x1E4F29060];
        id v44 = v42;
        v45 = [v43 callStackSymbols];
        v46 = [v45 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v66 = v42;
        __int16 v67 = 2114;
        v68 = v46;
        _os_log_error_impl(&dword_1A9892000, v38, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v39)
    {
      v40 = [MEMORY[0x1E4F29060] callStackSymbols];
      v41 = [v40 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v66 = v41;
      _os_log_error_impl(&dword_1A9892000, v38, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUGeometrySpaceMap setSpacesFromMap:andPruneAgainstTagNode:withPath:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Geometry/NUGeometrySpaceMap.m", 292, @"Cannot find the node for the given tag '%@' in the map", v47, v48, v49, v50, (uint64_t)v10);
  }
  v12 = v11;
  v13 = [v11 spaceMapKey];
  v14 = [v8 taggedSpacesForKey:v13];

  if (v14)
  {
    v51 = v12;
    uint64_t v52 = self;
    id v53 = v8;
    id v54 = v10;
    v15 = objc_opt_new();
    long long v59 = 0u;
    long long v60 = 0u;
    long long v61 = 0u;
    long long v62 = 0u;
    id v16 = v14;
    uint64_t v17 = [v16 countByEnumeratingWithState:&v59 objects:v64 count:16];
    if (v17)
    {
      uint64_t v18 = v17;
      uint64_t v19 = *(void *)v60;
      do
      {
        for (uint64_t i = 0; i != v18; ++i)
        {
          if (*(void *)v60 != v19) {
            objc_enumerationMutation(v16);
          }
          uint64_t v21 = *(void **)(*((void *)&v59 + 1) + 8 * i);
          uint64_t v22 = [v21 tagNodes];
          if ([v22 containsObject:v9])
          {
            v23 = [_NUTaggedSpace alloc];
            id v24 = [v21 space];
            v25 = [(_NUTaggedSpace *)v23 initWithSpace:v24];

            [v15 addObject:v25];
          }
        }
        uint64_t v18 = [v16 countByEnumeratingWithState:&v59 objects:v64 count:16];
      }
      while (v18);
    }

    if (![v15 count])
    {
      long long v57 = 0u;
      long long v58 = 0u;
      long long v55 = 0u;
      long long v56 = 0u;
      id v26 = v16;
      uint64_t v27 = [v26 countByEnumeratingWithState:&v55 objects:v63 count:16];
      if (v27)
      {
        uint64_t v28 = v27;
        uint64_t v29 = *(void *)v56;
        do
        {
          for (uint64_t j = 0; j != v28; ++j)
          {
            if (*(void *)v56 != v29) {
              objc_enumerationMutation(v26);
            }
            v31 = *(void **)(*((void *)&v55 + 1) + 8 * j);
            v32 = [_NUTaggedSpace alloc];
            v33 = [v31 space];
            v34 = [(_NUTaggedSpace *)v32 initWithSpace:v33];

            [v15 addObject:v34];
          }
          uint64_t v28 = [v26 countByEnumeratingWithState:&v55 objects:v63 count:16];
        }
        while (v28);
      }
    }
    id v10 = v54;
    [(NUGeometrySpaceMap *)v52 setSpaces:v15 forKey:v54];

    id v8 = v53;
    v12 = v51;
  }
}

- (void)setSpaces:(id)a3 forKey:(id)a4
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (!v6)
  {
    id v11 = NUAssertLogger_8557();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v12 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "spaces != nil");
      *(_DWORD *)buf = 138543362;
      uint64_t v47 = v12;
      _os_log_error_impl(&dword_1A9892000, v11, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    v14 = NUAssertLogger_8557();
    BOOL v15 = os_log_type_enabled(v14, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v15)
      {
        v25 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        id v26 = (void *)MEMORY[0x1E4F29060];
        id v27 = v25;
        uint64_t v28 = [v26 callStackSymbols];
        uint64_t v29 = [v28 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        uint64_t v47 = v25;
        __int16 v48 = 2114;
        uint64_t v49 = v29;
        _os_log_error_impl(&dword_1A9892000, v14, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v15)
    {
      id v16 = [MEMORY[0x1E4F29060] callStackSymbols];
      uint64_t v17 = [v16 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      uint64_t v47 = v17;
      _os_log_error_impl(&dword_1A9892000, v14, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUGeometrySpaceMap setSpaces:forKey:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Geometry/NUGeometrySpaceMap.m", 276, @"Invalid parameter not satisfying: %s", v30, v31, v32, v33, (uint64_t)"spaces != nil");
  }
  if (!v7)
  {
    uint64_t v18 = NUAssertLogger_8557();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      uint64_t v19 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "key != nil");
      *(_DWORD *)buf = 138543362;
      uint64_t v47 = v19;
      _os_log_error_impl(&dword_1A9892000, v18, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    uint64_t v20 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    uint64_t v21 = NUAssertLogger_8557();
    BOOL v22 = os_log_type_enabled(v21, OS_LOG_TYPE_ERROR);
    if (v20)
    {
      if (v22)
      {
        v34 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v35 = (void *)MEMORY[0x1E4F29060];
        id v36 = v34;
        BOOL v37 = [v35 callStackSymbols];
        v38 = [v37 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        uint64_t v47 = v34;
        __int16 v48 = 2114;
        uint64_t v49 = v38;
        _os_log_error_impl(&dword_1A9892000, v21, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v22)
    {
      v23 = [MEMORY[0x1E4F29060] callStackSymbols];
      id v24 = [v23 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      uint64_t v47 = v24;
      _os_log_error_impl(&dword_1A9892000, v21, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUGeometrySpaceMap setSpaces:forKey:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Geometry/NUGeometrySpaceMap.m", 277, @"Invalid parameter not satisfying: %s", v39, v40, v41, v42, (uint64_t)"key != nil");
  }
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __39__NUGeometrySpaceMap_setSpaces_forKey___block_invoke;
  block[3] = &unk_1E5D95878;
  void block[4] = self;
  id v44 = v6;
  id v45 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_sync(queue, block);
}

void __39__NUGeometrySpaceMap_setSpaces_forKey___block_invoke(uint64_t a1)
{
  v2 = *(void **)(*(void *)(a1 + 32) + 16);
  id v3 = (id)[*(id *)(a1 + 40) copy];
  [v2 setObject:v3 forKey:*(void *)(a1 + 48)];
}

- (void)setSpace:(id)a3 forKey:(id)a4
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (!v6)
  {
    id v11 = NUAssertLogger_8557();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v12 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "space != nil");
      *(_DWORD *)buf = 138543362;
      id v45 = v12;
      _os_log_error_impl(&dword_1A9892000, v11, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    v14 = NUAssertLogger_8557();
    BOOL v15 = os_log_type_enabled(v14, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v15)
      {
        v25 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        id v26 = (void *)MEMORY[0x1E4F29060];
        id v27 = v25;
        uint64_t v28 = [v26 callStackSymbols];
        uint64_t v29 = [v28 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        id v45 = v25;
        __int16 v46 = 2114;
        uint64_t v47 = v29;
        _os_log_error_impl(&dword_1A9892000, v14, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v15)
    {
      id v16 = [MEMORY[0x1E4F29060] callStackSymbols];
      uint64_t v17 = [v16 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      id v45 = v17;
      _os_log_error_impl(&dword_1A9892000, v14, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUGeometrySpaceMap setSpace:forKey:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Geometry/NUGeometrySpaceMap.m", 267, @"Invalid parameter not satisfying: %s", v30, v31, v32, v33, (uint64_t)"space != nil");
  }
  id v8 = v7;
  if (!v7)
  {
    uint64_t v18 = NUAssertLogger_8557();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      uint64_t v19 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "key != nil");
      *(_DWORD *)buf = 138543362;
      id v45 = v19;
      _os_log_error_impl(&dword_1A9892000, v18, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    uint64_t v20 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    uint64_t v21 = NUAssertLogger_8557();
    BOOL v22 = os_log_type_enabled(v21, OS_LOG_TYPE_ERROR);
    if (v20)
    {
      if (v22)
      {
        v34 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v35 = (void *)MEMORY[0x1E4F29060];
        id v36 = v34;
        BOOL v37 = [v35 callStackSymbols];
        v38 = [v37 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        id v45 = v34;
        __int16 v46 = 2114;
        uint64_t v47 = v38;
        _os_log_error_impl(&dword_1A9892000, v21, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v22)
    {
      v23 = [MEMORY[0x1E4F29060] callStackSymbols];
      id v24 = [v23 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      id v45 = v24;
      _os_log_error_impl(&dword_1A9892000, v21, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUGeometrySpaceMap setSpace:forKey:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Geometry/NUGeometrySpaceMap.m", 268, @"Invalid parameter not satisfying: %s", v39, v40, v41, v42, (uint64_t)"key != nil");
  }
  id v9 = [[_NUTaggedSpace alloc] initWithSpace:v6];
  v43 = v9;
  id v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v43 count:1];
  [(NUGeometrySpaceMap *)self setSpaces:v10 forKey:v8];
}

- (id)spaceForKey:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!v4)
  {
    id v10 = NUAssertLogger_8557();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      id v11 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "key != nil");
      *(_DWORD *)buf = 138543362;
      id v27 = v11;
      _os_log_error_impl(&dword_1A9892000, v10, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    v13 = NUAssertLogger_8557();
    BOOL v14 = os_log_type_enabled(v13, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v14)
      {
        uint64_t v17 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        uint64_t v18 = (void *)MEMORY[0x1E4F29060];
        id v19 = v17;
        uint64_t v20 = [v18 callStackSymbols];
        uint64_t v21 = [v20 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        id v27 = v17;
        __int16 v28 = 2114;
        uint64_t v29 = v21;
        _os_log_error_impl(&dword_1A9892000, v13, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v14)
    {
      BOOL v15 = [MEMORY[0x1E4F29060] callStackSymbols];
      id v16 = [v15 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      id v27 = v16;
      _os_log_error_impl(&dword_1A9892000, v13, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUGeometrySpaceMap spaceForKey:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Geometry/NUGeometrySpaceMap.m", 255, @"Invalid parameter not satisfying: %s", v22, v23, v24, v25, (uint64_t)"key != nil");
  }
  id v5 = v4;
  id v6 = [(NUGeometrySpaceMap *)self taggedSpacesForKey:v4];
  if ([v6 count] == 1)
  {
    id v7 = [v6 objectAtIndexedSubscript:0];
    id v8 = [v7 space];
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

- (id)spacesForKey:(id)a3
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!v4)
  {
    id v16 = NUAssertLogger_8557();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      uint64_t v17 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "key != nil");
      *(_DWORD *)buf = 138543362;
      v38 = v17;
      _os_log_error_impl(&dword_1A9892000, v16, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    id v19 = NUAssertLogger_8557();
    BOOL v20 = os_log_type_enabled(v19, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v20)
      {
        uint64_t v23 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        uint64_t v24 = (void *)MEMORY[0x1E4F29060];
        id v25 = v23;
        id v26 = [v24 callStackSymbols];
        id v27 = [v26 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v38 = v23;
        __int16 v39 = 2114;
        uint64_t v40 = v27;
        _os_log_error_impl(&dword_1A9892000, v19, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v20)
    {
      uint64_t v21 = [MEMORY[0x1E4F29060] callStackSymbols];
      uint64_t v22 = [v21 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v38 = v22;
      _os_log_error_impl(&dword_1A9892000, v19, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUGeometrySpaceMap spacesForKey:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Geometry/NUGeometrySpaceMap.m", 238, @"Invalid parameter not satisfying: %s", v28, v29, v30, v31, (uint64_t)"key != nil");
  }
  id v5 = v4;
  id v6 = [(NUGeometrySpaceMap *)self taggedSpacesForKey:v4];
  id v7 = v6;
  if (v6)
  {
    id v8 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v6, "count"));
    long long v32 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    id v9 = v7;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v32 objects:v36 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v33;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v33 != v12) {
            objc_enumerationMutation(v9);
          }
          BOOL v14 = [*(id *)(*((void *)&v32 + 1) + 8 * i) space];
          [v8 addObject:v14];
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v32 objects:v36 count:16];
      }
      while (v11);
    }
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

- (id)taggedSpacesForKey:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  v13 = &v12;
  uint64_t v14 = 0x3032000000;
  BOOL v15 = __Block_byref_object_copy__8674;
  id v16 = __Block_byref_object_dispose__8675;
  id v17 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __41__NUGeometrySpaceMap_taggedSpacesForKey___block_invoke;
  block[3] = &unk_1E5D959D8;
  id v10 = v4;
  uint64_t v11 = &v12;
  void block[4] = self;
  id v6 = v4;
  dispatch_sync(queue, block);
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);

  return v7;
}

uint64_t __41__NUGeometrySpaceMap_taggedSpacesForKey___block_invoke(void *a1)
{
  *(void *)(*(void *)(a1[6] + 8) + 40) = [*(id *)(a1[4] + 16) objectForKeyedSubscript:a1[5]];

  return MEMORY[0x1F41817F8]();
}

- (void)addTagNode:(id)a3
{
  id v4 = a3;
  id v5 = [v4 geometryNode];
  id v6 = [v5 spaceMapKey];
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __33__NUGeometrySpaceMap_addTagNode___block_invoke;
  block[3] = &unk_1E5D95878;
  void block[4] = self;
  id v11 = v6;
  id v12 = v4;
  id v8 = v4;
  id v9 = v6;
  dispatch_sync(queue, block);
}

void __33__NUGeometrySpaceMap_addTagNode___block_invoke(void *a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1[4] + 16) objectForKeyedSubscript:a1[5]];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        [*(id *)(*((void *)&v7 + 1) + 8 * v6++) addTagNode:a1[6]];
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

- (void)applyTransform:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  if (v4)
  {
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __37__NUGeometrySpaceMap_applyTransform___block_invoke;
    v6[3] = &unk_1E5D94598;
    id v7 = v4;
    [(NUGeometrySpaceMap *)self enumerateSpacesUsingBlock:v6];
  }
}

void __37__NUGeometrySpaceMap_applyTransform___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        long long v9 = [*(id *)(*((void *)&v10 + 1) + 8 * v8) space];
        [v9 appendTransform:*(void *)(a1 + 32)];

        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }
}

- (unint64_t)count
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __27__NUGeometrySpaceMap_count__block_invoke;
  v5[3] = &unk_1E5D95E40;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  unint64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __27__NUGeometrySpaceMap_count__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 16) count];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = [+[NUGeometrySpaceMap allocWithZone:](NUGeometrySpaceMap, "allocWithZone:") init];
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __35__NUGeometrySpaceMap_copyWithZone___block_invoke;
  block[3] = &unk_1E5D95C28;
  uint64_t v7 = v5;
  long long v11 = v7;
  long long v12 = self;
  long long v13 = a3;
  dispatch_sync(queue, block);
  uint64_t v8 = v7;

  return v8;
}

uint64_t __35__NUGeometrySpaceMap_copyWithZone___block_invoke(void *a1)
{
  *(void *)(a1[4] + 16) = [*(id *)(a1[5] + 16) mutableCopyWithZone:a1[6]];

  return MEMORY[0x1F41817F8]();
}

- (NUGeometrySpaceMap)init
{
  v9.receiver = self;
  v9.super_class = (Class)NUGeometrySpaceMap;
  v2 = [(NUGeometrySpaceMap *)&v9 init];
  unint64_t v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v4 = dispatch_queue_create("NUGeometrySpaceMap", v3);
  queue = v2->_queue;
  v2->_queue = (OS_dispatch_queue *)v4;

  uint64_t v6 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
  spaces = v2->_spaces;
  v2->_spaces = v6;

  return v2;
}

+ (id)_reduceSpaces:(id)a3 withSpaces:(id)a4
{
  id v5 = a4;
  uint64_t v6 = (void *)[a3 mutableCopy];
  if ([v5 count])
  {
    unint64_t v7 = 0;
    do
    {
      uint64_t v8 = [v5 objectAtIndexedSubscript:v7];
      objc_super v9 = [v6 objectAtIndexedSubscript:v7];
      [v9 mergeSpace:v8];

      ++v7;
    }
    while (v7 < [v5 count]);
  }

  return v6;
}

+ (BOOL)_canReduceSpaces:(id)a3 withSpaces:(id)a4
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = [v5 count];
  if (v7 == [v6 count])
  {
    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    id v8 = v5;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v23 objects:v28 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v24;
LABEL_4:
      uint64_t v12 = 0;
      while (1)
      {
        if (*(void *)v24 != v11) {
          objc_enumerationMutation(v8);
        }
        if ([*(id *)(*((void *)&v23 + 1) + 8 * v12) hasTransform]) {
          break;
        }
        if (v10 == ++v12)
        {
          uint64_t v10 = [v8 countByEnumeratingWithState:&v23 objects:v28 count:16];
          if (v10) {
            goto LABEL_4;
          }
          goto LABEL_10;
        }
      }
    }
    else
    {
LABEL_10:

      long long v21 = 0u;
      long long v22 = 0u;
      long long v19 = 0u;
      long long v20 = 0u;
      id v8 = v6;
      uint64_t v13 = [v8 countByEnumeratingWithState:&v19 objects:v27 count:16];
      if (!v13)
      {
        BOOL v17 = 1;
        goto LABEL_21;
      }
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v20;
LABEL_12:
      uint64_t v16 = 0;
      while (1)
      {
        if (*(void *)v20 != v15) {
          objc_enumerationMutation(v8);
        }
        if (objc_msgSend(*(id *)(*((void *)&v19 + 1) + 8 * v16), "hasTransform", (void)v19)) {
          break;
        }
        if (v14 == ++v16)
        {
          uint64_t v14 = [v8 countByEnumeratingWithState:&v19 objects:v27 count:16];
          BOOL v17 = 1;
          if (v14) {
            goto LABEL_12;
          }
          goto LABEL_21;
        }
      }
    }
    BOOL v17 = 0;
LABEL_21:

    goto LABEL_22;
  }
  BOOL v17 = 0;
LABEL_22:

  return v17;
}

@end