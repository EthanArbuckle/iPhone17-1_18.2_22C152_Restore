@interface NURenderTagGroup
+ (BOOL)validatePath:(id)a3 error:(id *)a4;
- (NURenderTagGroup)init;
- (NURenderTagGroup)parent;
- (id)_descriptionWithLevel:(int64_t)a3;
- (id)_nodeWithPathComponents:(id)a3 atIndex:(unint64_t)a4;
- (id)_root;
- (id)addTag:(id)a3 forNode:(id)a4;
- (id)childWithName:(id)a3;
- (id)children;
- (id)description;
- (id)finalizeMap:(id)a3;
- (id)leafName;
- (id)nodeWithPath:(id)a3;
- (id)path;
- (void)_composePathComponents:(id)a3;
- (void)addChild:(id)a3 withName:(id)a4;
- (void)removeChildWithName:(id)a3;
- (void)setParent:(id)a3;
- (void)visitEveryTagWithBlock:(id)a3;
@end

@implementation NURenderTagGroup

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_parent);
  objc_storeStrong((id *)&self->_children, 0);

  objc_storeStrong((id *)&self->_tags, 0);
}

- (void)setParent:(id)a3
{
}

- (NURenderTagGroup)parent
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_parent);

  return (NURenderTagGroup *)WeakRetained;
}

- (id)finalizeMap:(id)a3
{
  id v4 = a3;
  v5 = objc_alloc_init(NUGeometrySpaceMap);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __32__NURenderTagGroup_finalizeMap___block_invoke;
  v11[3] = &unk_1E5D954D8;
  v6 = v5;
  v12 = v6;
  id v13 = v4;
  id v7 = v4;
  [(NURenderTagGroup *)self visitEveryTagWithBlock:v11];
  v8 = v13;
  v9 = v6;

  return v9;
}

uint64_t __32__NURenderTagGroup_finalizeMap___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) setSpacesFromMap:*(void *)(a1 + 40) andPruneAgainstTagNode:a2 withPath:a3];
}

- (void)visitEveryTagWithBlock:(id)a3
{
  id v4 = a3;
  tags = self->_tags;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __43__NURenderTagGroup_visitEveryTagWithBlock___block_invoke;
  v11[3] = &unk_1E5D95488;
  void v11[4] = self;
  id v6 = v4;
  id v12 = v6;
  [(NSMutableDictionary *)tags enumerateKeysAndObjectsUsingBlock:v11];
  children = self->_children;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __43__NURenderTagGroup_visitEveryTagWithBlock___block_invoke_2;
  v9[3] = &unk_1E5D954B0;
  id v10 = v6;
  id v8 = v6;
  [(NSMutableDictionary *)children enumerateKeysAndObjectsUsingBlock:v9];
}

void __43__NURenderTagGroup_visitEveryTagWithBlock___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  v11[2] = *MEMORY[0x1E4F143B8];
  id v4 = NSString;
  v5 = *(void **)(a1 + 32);
  id v6 = a3;
  id v7 = [v5 path];
  v11[0] = v7;
  id v8 = [v6 name];
  v11[1] = v8;
  v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:2];
  id v10 = [v4 pathWithComponents:v9];

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

uint64_t __43__NURenderTagGroup_visitEveryTagWithBlock___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 visitEveryTagWithBlock:*(void *)(a1 + 32)];
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  v5 = [(NURenderTagGroup *)self path];
  id v6 = [(NURenderTagGroup *)self _descriptionWithLevel:0];
  id v7 = [v3 stringWithFormat:@"<%@:%p path: %@ %@>", v4, self, v5, v6];

  return v7;
}

- (id)_descriptionWithLevel:(int64_t)a3
{
  v5 = [MEMORY[0x1E4F28E78] stringWithFormat:@"tags : %@\n", self->_tags];
  if ([(NSMutableDictionary *)self->_children count])
  {
    if (a3 >= 1)
    {
      int64_t v6 = a3;
      do
      {
        [v5 appendString:@"  "];
        --v6;
      }
      while (v6);
    }
    objc_msgSend(v5, "appendFormat:", @"> Children (%d):", -[NSMutableDictionary count](self->_children, "count"));
    children = self->_children;
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __42__NURenderTagGroup__descriptionWithLevel___block_invoke;
    v9[3] = &unk_1E5D95460;
    id v10 = v5;
    int64_t v11 = a3;
    [(NSMutableDictionary *)children enumerateKeysAndObjectsUsingBlock:v9];
  }

  return v5;
}

void __42__NURenderTagGroup__descriptionWithLevel___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  [*(id *)(a1 + 32) appendString:@"\n"];
  uint64_t v6 = *(void *)(a1 + 40);
  if (v6 >= 1)
  {
    for (uint64_t i = 0; i < v6; ++i)
    {
      [*(id *)(a1 + 32) appendString:@"--"];
      uint64_t v6 = *(void *)(a1 + 40);
    }
  }
  id v8 = *(void **)(a1 + 32);
  v9 = [v5 _descriptionWithLevel:v6 + 1];
  [v8 appendFormat:@"> '%@'  %@", v10, v9];
}

- (id)nodeWithPath:(id)a3
{
  uint64_t v4 = [a3 pathComponents];
  id v5 = [(NURenderTagGroup *)self _nodeWithPathComponents:v4 atIndex:0];

  return v5;
}

- (id)_nodeWithPathComponents:(id)a3 atIndex:(unint64_t)a4
{
  id v6 = a3;
  unint64_t v7 = a4 + 1;
  if ([v6 count] == a4 + 1)
  {
    tags = self->_tags;
    v9 = [v6 objectAtIndexedSubscript:a4];
    uint64_t v10 = [(NSMutableDictionary *)tags objectForKey:v9];
LABEL_10:
    v18 = (void *)v10;

    goto LABEL_11;
  }
  int64_t v11 = [v6 objectAtIndexedSubscript:a4];
  int v12 = [v11 isEqualToString:@".."];

  if (v12)
  {
    id v13 = [(NURenderTagGroup *)self parent];
    v9 = v13;
    id v14 = v6;
    uint64_t v15 = v7;
LABEL_9:
    uint64_t v10 = [v13 _nodeWithPathComponents:v14 atIndex:v15];
    goto LABEL_10;
  }
  v16 = [v6 objectAtIndexedSubscript:a4];
  int v17 = [v16 isEqualToString:@"."];

  if (v17)
  {
    v18 = [(NURenderTagGroup *)self _nodeWithPathComponents:v6 atIndex:a4 + 1];
    goto LABEL_11;
  }
  v19 = [v6 objectAtIndexedSubscript:a4];
  int v20 = [v19 isEqualToString:@"/"];

  if (v20)
  {
    id v13 = [(NURenderTagGroup *)self _root];
    v9 = v13;
    id v14 = v6;
    uint64_t v15 = 1;
    goto LABEL_9;
  }
  children = self->_children;
  v23 = [v6 objectAtIndexedSubscript:a4];
  v24 = [(NSMutableDictionary *)children objectForKey:v23];

  v18 = [v24 _nodeWithPathComponents:v6 atIndex:v7];

LABEL_11:

  return v18;
}

- (id)_root
{
  v3 = [(NURenderTagGroup *)self parent];
  uint64_t v4 = v3;
  if (v3)
  {
    id v5 = [v3 _root];
  }
  else
  {
    id v5 = self;
  }
  id v6 = v5;

  return v6;
}

- (id)addTag:(id)a3 forNode:(id)a4
{
  uint64_t v63 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (!v6)
  {
    int64_t v11 = NUAssertLogger_20502();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      int v12 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "name != nil");
      *(_DWORD *)buf = 138543362;
      v60 = v12;
      _os_log_error_impl(&dword_1A9892000, v11, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    id v14 = NUAssertLogger_20502();
    BOOL v15 = os_log_type_enabled(v14, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v15)
      {
        v32 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v33 = (void *)MEMORY[0x1E4F29060];
        id v34 = v32;
        v35 = [v33 callStackSymbols];
        v36 = [v35 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v60 = v32;
        __int16 v61 = 2114;
        v62 = v36;
        _os_log_error_impl(&dword_1A9892000, v14, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v15)
    {
      v16 = [MEMORY[0x1E4F29060] callStackSymbols];
      int v17 = [v16 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v60 = v17;
      _os_log_error_impl(&dword_1A9892000, v14, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NURenderTagGroup addTag:forNode:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderTagGroup.m", 109, @"Invalid parameter not satisfying: %s", v37, v38, v39, v40, (uint64_t)"name != nil");
  }
  id v8 = v7;
  if (!v7)
  {
    v18 = NUAssertLogger_20502();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      v19 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "node != nil");
      *(_DWORD *)buf = 138543362;
      v60 = v19;
      _os_log_error_impl(&dword_1A9892000, v18, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    int v20 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    v21 = NUAssertLogger_20502();
    BOOL v22 = os_log_type_enabled(v21, OS_LOG_TYPE_ERROR);
    if (v20)
    {
      if (v22)
      {
        v41 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v42 = (void *)MEMORY[0x1E4F29060];
        id v43 = v41;
        v44 = [v42 callStackSymbols];
        v45 = [v44 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v60 = v41;
        __int16 v61 = 2114;
        v62 = v45;
        _os_log_error_impl(&dword_1A9892000, v21, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v22)
    {
      v23 = [MEMORY[0x1E4F29060] callStackSymbols];
      v24 = [v23 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v60 = v24;
      _os_log_error_impl(&dword_1A9892000, v21, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NURenderTagGroup addTag:forNode:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderTagGroup.m", 110, @"Invalid parameter not satisfying: %s", v46, v47, v48, v49, (uint64_t)"node != nil");
  }
  [(NURenderTagGroup *)self nodeWithPath:v6];
  if (objc_claimAutoreleasedReturnValue())
  {
    v25 = NUAssertLogger_20502();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      v26 = [NSString stringWithFormat:@"Failed when attempting to add tag - key '%@' is already present", v6];
      *(_DWORD *)buf = 138543362;
      v60 = v26;
      _os_log_error_impl(&dword_1A9892000, v25, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    v27 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    v28 = NUAssertLogger_20502();
    BOOL v29 = os_log_type_enabled(v28, OS_LOG_TYPE_ERROR);
    if (v27)
    {
      if (v29)
      {
        v50 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v51 = (void *)MEMORY[0x1E4F29060];
        id v52 = v50;
        v53 = [v51 callStackSymbols];
        v54 = [v53 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v60 = v50;
        __int16 v61 = 2114;
        v62 = v54;
        _os_log_error_impl(&dword_1A9892000, v28, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v29)
    {
      v30 = [MEMORY[0x1E4F29060] callStackSymbols];
      v31 = [v30 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v60 = v31;
      _os_log_error_impl(&dword_1A9892000, v28, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NURenderTagGroup addTag:forNode:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderTagGroup.m", 114, @"Failed when attempting to add tag - key '%@' is already present", v55, v56, v57, v58, (uint64_t)v6);
  }
  v9 = [[NURenderTagNode alloc] initWithInput:v8 name:v6];
  [(NSMutableDictionary *)self->_tags setValue:v9 forKey:v6];

  return v9;
}

- (id)path
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  [v3 addObject:@"/"];
  [(NURenderTagGroup *)self _composePathComponents:v3];
  uint64_t v4 = [NSString pathWithComponents:v3];

  return v4;
}

- (void)_composePathComponents:(id)a3
{
  id v7 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_parent);
  id v5 = WeakRetained;
  if (WeakRetained) {
    [WeakRetained _composePathComponents:v7];
  }
  id v6 = [(NURenderTagGroup *)self leafName];
  if (v6) {
    [v7 addObject:v6];
  }
}

- (id)leafName
{
  uint64_t v8 = 0;
  v9 = &v8;
  uint64_t v10 = 0x3032000000;
  int64_t v11 = __Block_byref_object_copy__20528;
  int v12 = __Block_byref_object_dispose__20529;
  id v13 = 0;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_parent);
  uint64_t v4 = [WeakRetained children];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __28__NURenderTagGroup_leafName__block_invoke;
  v7[3] = &unk_1E5D95438;
  v7[4] = self;
  v7[5] = &v8;
  [v4 enumerateKeysAndObjectsUsingBlock:v7];

  id v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return v5;
}

void __28__NURenderTagGroup_leafName__block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v8 = a2;
  if (*(void *)(a1 + 32) == a3)
  {
    id v9 = v8;
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
    id v8 = v9;
    *a4 = 1;
  }
}

- (id)children
{
  return self->_children;
}

- (void)removeChildWithName:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!v4)
  {
    id v6 = NUAssertLogger_20502();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      id v7 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "name != nil");
      *(_DWORD *)buf = 138543362;
      v24 = v7;
      _os_log_error_impl(&dword_1A9892000, v6, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    id v9 = NUAssertLogger_20502();
    BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v10)
      {
        id v13 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        id v14 = (void *)MEMORY[0x1E4F29060];
        id v15 = v13;
        v16 = [v14 callStackSymbols];
        int v17 = [v16 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v24 = v13;
        __int16 v25 = 2114;
        v26 = v17;
        _os_log_error_impl(&dword_1A9892000, v9, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v10)
    {
      int64_t v11 = [MEMORY[0x1E4F29060] callStackSymbols];
      int v12 = [v11 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v24 = v12;
      _os_log_error_impl(&dword_1A9892000, v9, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NURenderTagGroup removeChildWithName:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderTagGroup.m", 57, @"Invalid parameter not satisfying: %s", v18, v19, v20, v21, (uint64_t)"name != nil");
  }
  id v22 = v4;
  id v5 = [(NSMutableDictionary *)self->_children objectForKey:v4];
  [v5 setParent:0];
  [(NSMutableDictionary *)self->_children removeObjectForKey:v22];
}

- (id)childWithName:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!v4)
  {
    id v8 = NUAssertLogger_20502();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      id v9 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "name != nil");
      *(_DWORD *)buf = 138543362;
      __int16 v25 = v9;
      _os_log_error_impl(&dword_1A9892000, v8, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    int64_t v11 = NUAssertLogger_20502();
    BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v12)
      {
        id v15 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v16 = (void *)MEMORY[0x1E4F29060];
        id v17 = v15;
        uint64_t v18 = [v16 callStackSymbols];
        uint64_t v19 = [v18 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        __int16 v25 = v15;
        __int16 v26 = 2114;
        uint64_t v27 = v19;
        _os_log_error_impl(&dword_1A9892000, v11, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v12)
    {
      id v13 = [MEMORY[0x1E4F29060] callStackSymbols];
      id v14 = [v13 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      __int16 v25 = v14;
      _os_log_error_impl(&dword_1A9892000, v11, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NURenderTagGroup childWithName:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderTagGroup.m", 50, @"Invalid parameter not satisfying: %s", v20, v21, v22, v23, (uint64_t)"name != nil");
  }
  id v5 = v4;
  id v6 = [(NSMutableDictionary *)self->_children objectForKey:v4];

  return v6;
}

- (void)addChild:(id)a3 withName:(id)a4
{
  uint64_t v79 = *MEMORY[0x1E4F143B8];
  id v74 = a3;
  id v6 = a4;
  if (!v74)
  {
    id v9 = NUAssertLogger_20502();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      BOOL v10 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "child != nil");
      *(_DWORD *)buf = 138543362;
      v76 = v10;
      _os_log_error_impl(&dword_1A9892000, v9, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    BOOL v12 = NUAssertLogger_20502();
    BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v13)
      {
        uint64_t v37 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        uint64_t v38 = (void *)MEMORY[0x1E4F29060];
        id v39 = v37;
        uint64_t v40 = [v38 callStackSymbols];
        v41 = [v40 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v76 = v37;
        __int16 v77 = 2114;
        v78 = v41;
        _os_log_error_impl(&dword_1A9892000, v12, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v13)
    {
      id v14 = [MEMORY[0x1E4F29060] callStackSymbols];
      id v15 = [v14 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v76 = v15;
      _os_log_error_impl(&dword_1A9892000, v12, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NURenderTagGroup addChild:withName:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderTagGroup.m", 38, @"Invalid parameter not satisfying: %s", v42, v43, v44, v45, (uint64_t)"child != nil");
  }
  if (!v6)
  {
    v16 = NUAssertLogger_20502();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      id v17 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "name != nil");
      *(_DWORD *)buf = 138543362;
      v76 = v17;
      _os_log_error_impl(&dword_1A9892000, v16, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    uint64_t v18 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    uint64_t v19 = NUAssertLogger_20502();
    BOOL v20 = os_log_type_enabled(v19, OS_LOG_TYPE_ERROR);
    if (v18)
    {
      if (v20)
      {
        uint64_t v46 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        uint64_t v47 = (void *)MEMORY[0x1E4F29060];
        id v48 = v46;
        uint64_t v49 = [v47 callStackSymbols];
        v50 = [v49 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v76 = v46;
        __int16 v77 = 2114;
        v78 = v50;
        _os_log_error_impl(&dword_1A9892000, v19, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v20)
    {
      uint64_t v21 = [MEMORY[0x1E4F29060] callStackSymbols];
      uint64_t v22 = [v21 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v76 = v22;
      _os_log_error_impl(&dword_1A9892000, v19, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NURenderTagGroup addChild:withName:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderTagGroup.m", 39, @"Invalid parameter not satisfying: %s", v51, v52, v53, v54, (uint64_t)"name != nil");
  }
  id v7 = [v74 parent];

  if (v7)
  {
    uint64_t v23 = NUAssertLogger_20502();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      v24 = [NSString stringWithFormat:@"Attempting to add a child that is already parented"];
      *(_DWORD *)buf = 138543362;
      v76 = v24;
      _os_log_error_impl(&dword_1A9892000, v23, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    __int16 v25 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    __int16 v26 = NUAssertLogger_20502();
    BOOL v27 = os_log_type_enabled(v26, OS_LOG_TYPE_ERROR);
    if (v25)
    {
      if (v27)
      {
        uint64_t v55 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        uint64_t v56 = (void *)MEMORY[0x1E4F29060];
        id v57 = v55;
        uint64_t v58 = [v56 callStackSymbols];
        v59 = [v58 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v76 = v55;
        __int16 v77 = 2114;
        v78 = v59;
        _os_log_error_impl(&dword_1A9892000, v26, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v27)
    {
      uint64_t v28 = [MEMORY[0x1E4F29060] callStackSymbols];
      BOOL v29 = [v28 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v76 = v29;
      _os_log_error_impl(&dword_1A9892000, v26, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NURenderTagGroup addChild:withName:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderTagGroup.m", 41, @"Attempting to add a child that is already parented", v60, v61, v62, v63, v73);
  }
  id v8 = [(NSMutableDictionary *)self->_children objectForKey:v6];

  if (v8)
  {
    v30 = NUAssertLogger_20502();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      v31 = [NSString stringWithFormat:@"A child node with that tag is already present!"];
      *(_DWORD *)buf = 138543362;
      v76 = v31;
      _os_log_error_impl(&dword_1A9892000, v30, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    v32 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    v33 = NUAssertLogger_20502();
    BOOL v34 = os_log_type_enabled(v33, OS_LOG_TYPE_ERROR);
    if (v32)
    {
      if (v34)
      {
        v64 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v65 = (void *)MEMORY[0x1E4F29060];
        id v66 = v64;
        v67 = [v65 callStackSymbols];
        v68 = [v67 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v76 = v64;
        __int16 v77 = 2114;
        v78 = v68;
        _os_log_error_impl(&dword_1A9892000, v33, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v34)
    {
      v35 = [MEMORY[0x1E4F29060] callStackSymbols];
      v36 = [v35 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v76 = v36;
      _os_log_error_impl(&dword_1A9892000, v33, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NURenderTagGroup addChild:withName:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderTagGroup.m", 42, @"A child node with that tag is already present!", v69, v70, v71, v72, v73);
  }
  [v74 setParent:self];
  [(NSMutableDictionary *)self->_children setObject:v74 forKey:v6];
}

- (NURenderTagGroup)init
{
  v8.receiver = self;
  v8.super_class = (Class)NURenderTagGroup;
  v2 = [(NURenderTagGroup *)&v8 init];
  id v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
  tags = v2->_tags;
  v2->_tags = v3;

  id v5 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
  children = v2->_children;
  v2->_children = v5;

  return v2;
}

+ (BOOL)validatePath:(id)a3 error:(id *)a4
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (!v5)
  {
    id v9 = NUAssertLogger_20502();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      BOOL v10 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "path != nil");
      *(_DWORD *)buf = 138543362;
      uint64_t v42 = v10;
      _os_log_error_impl(&dword_1A9892000, v9, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    BOOL v12 = NUAssertLogger_20502();
    BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v13)
      {
        uint64_t v23 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v24 = (void *)MEMORY[0x1E4F29060];
        id v25 = v23;
        __int16 v26 = [v24 callStackSymbols];
        BOOL v27 = [v26 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        uint64_t v42 = v23;
        __int16 v43 = 2114;
        uint64_t v44 = v27;
        _os_log_error_impl(&dword_1A9892000, v12, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v13)
    {
      id v14 = [MEMORY[0x1E4F29060] callStackSymbols];
      id v15 = [v14 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      uint64_t v42 = v15;
      _os_log_error_impl(&dword_1A9892000, v12, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"+[NURenderTagGroup validatePath:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderTagGroup.m", 125, @"Invalid parameter not satisfying: %s", v28, v29, v30, v31, (uint64_t)"path != nil");
  }
  if (!a4)
  {
    v16 = NUAssertLogger_20502();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      id v17 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "error != NULL");
      *(_DWORD *)buf = 138543362;
      uint64_t v42 = v17;
      _os_log_error_impl(&dword_1A9892000, v16, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    uint64_t v18 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    uint64_t v19 = NUAssertLogger_20502();
    BOOL v20 = os_log_type_enabled(v19, OS_LOG_TYPE_ERROR);
    if (v18)
    {
      if (v20)
      {
        v32 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v33 = (void *)MEMORY[0x1E4F29060];
        id v34 = v32;
        v35 = [v33 callStackSymbols];
        v36 = [v35 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        uint64_t v42 = v32;
        __int16 v43 = 2114;
        uint64_t v44 = v36;
        _os_log_error_impl(&dword_1A9892000, v19, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v20)
    {
      uint64_t v21 = [MEMORY[0x1E4F29060] callStackSymbols];
      uint64_t v22 = [v21 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      uint64_t v42 = v22;
      _os_log_error_impl(&dword_1A9892000, v19, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"+[NURenderTagGroup validatePath:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderTagGroup.m", 126, @"Invalid parameter not satisfying: %s", v37, v38, v39, v40, (uint64_t)"error != NULL");
  }
  id v6 = v5;
  int v7 = [v5 isEqualToString:&stru_1F0017700];
  if (v7)
  {
    *a4 = +[NUError mismatchError:@"Empty paths not allowed" object:v6];
  }

  return v7 ^ 1;
}

@end