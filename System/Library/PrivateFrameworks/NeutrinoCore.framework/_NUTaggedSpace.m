@interface _NUTaggedSpace
- (BOOL)hasTransform;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToTaggedImageSpace:(id)a3;
- (NUSpace)space;
- (_NUTaggedSpace)init;
- (_NUTaggedSpace)initWithSpace:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)tagNodes;
- (unint64_t)hash;
- (void)addTagNode:(id)a3;
- (void)addTagNodes:(id)a3;
- (void)mergeSpace:(id)a3;
@end

@implementation _NUTaggedSpace

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_space, 0);

  objc_storeStrong((id *)&self->_tagNodes, 0);
}

- (NUSpace)space
{
  return (NUSpace *)objc_getProperty(self, a2, 16, 1);
}

- (id)description
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  v3 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", -[NSMutableArray count](self->_tagNodes, "count"));
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  v4 = self->_tagNodes;
  uint64_t v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v16 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = [*(id *)(*((void *)&v15 + 1) + 8 * i) name];
        [v3 addObject:v9];
      }
      uint64_t v6 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v6);
  }

  v10 = NSString;
  space = self->_space;
  v12 = [v3 componentsJoinedByString:@","];
  v13 = [v10 stringWithFormat:@"%@  :: tags : {%@}", space, v12, (void)v15];

  return v13;
}

- (BOOL)isEqualToTaggedImageSpace:(id)a3
{
  id v4 = a3;
  space = self->_space;
  uint64_t v6 = [v4 space];
  if ([(NUSpace *)space isEqual:v6])
  {
    tagNodes = self->_tagNodes;
    v8 = [v4 tagNodes];
    char v9 = [(NSMutableArray *)tagNodes isEqualToArray:v8];
  }
  else
  {
    char v9 = 0;
  }

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0
    && [(_NUTaggedSpace *)self isEqualToTaggedImageSpace:v4];

  return v5;
}

- (unint64_t)hash
{
  v3.receiver = self;
  v3.super_class = (Class)_NUTaggedSpace;
  return [(_NUTaggedSpace *)&v3 hash];
}

- (void)mergeSpace:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!v4)
  {
    uint64_t v7 = NUAssertLogger_8557();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v8 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "space != nil");
      *(_DWORD *)buf = 138543362;
      v25 = v8;
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
        long long v15 = (void *)MEMORY[0x1E4F29060];
        id v16 = v14;
        long long v17 = [v15 callStackSymbols];
        long long v18 = [v17 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v25 = v14;
        __int16 v26 = 2114;
        v27 = v18;
        _os_log_error_impl(&dword_1A9892000, v10, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v11)
    {
      v12 = [MEMORY[0x1E4F29060] callStackSymbols];
      v13 = [v12 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v25 = v13;
      _os_log_error_impl(&dword_1A9892000, v10, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[_NUTaggedSpace mergeSpace:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Geometry/NUGeometrySpaceMap.m", 98, @"Invalid parameter not satisfying: %s", v19, v20, v21, v22, (uint64_t)"space != nil");
  }
  tagNodes = self->_tagNodes;
  id v23 = v4;
  uint64_t v6 = [v4 tagNodes];
  [(NSMutableArray *)tagNodes addObjectsFromArray:v6];
}

- (void)addTagNodes:(id)a3
{
}

- (void)addTagNode:(id)a3
{
}

- (id)tagNodes
{
  v2 = (void *)[(NSMutableArray *)self->_tagNodes copy];

  return v2;
}

- (BOOL)hasTransform
{
  v2 = [(NUSpace *)self->_space transformStack];
  BOOL v3 = [v2 count] != 0;

  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  BOOL v5 = (void *)[(NUSpace *)self->_space copy];
  uint64_t v6 = [+[_NUTaggedSpace allocWithZone:a3] initWithSpace:v5];
  [(_NUTaggedSpace *)v6 addTagNodes:self->_tagNodes];

  return v6;
}

- (_NUTaggedSpace)initWithSpace:(id)a3
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (!v5)
  {
    v12 = NUAssertLogger_8557();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v13 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "space");
      *(_DWORD *)buf = 138543362;
      v30 = v13;
      _os_log_error_impl(&dword_1A9892000, v12, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    long long v15 = NUAssertLogger_8557();
    BOOL v16 = os_log_type_enabled(v15, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v16)
      {
        uint64_t v19 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        uint64_t v20 = (void *)MEMORY[0x1E4F29060];
        id v21 = v19;
        uint64_t v22 = [v20 callStackSymbols];
        id v23 = [v22 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v30 = v19;
        __int16 v31 = 2114;
        v32 = v23;
        _os_log_error_impl(&dword_1A9892000, v15, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v16)
    {
      long long v17 = [MEMORY[0x1E4F29060] callStackSymbols];
      long long v18 = [v17 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v30 = v18;
      _os_log_error_impl(&dword_1A9892000, v15, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[_NUTaggedSpace initWithSpace:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Geometry/NUGeometrySpaceMap.m", 54, @"Invalid parameter not satisfying: %s", v24, v25, v26, v27, (uint64_t)"space");
  }
  uint64_t v6 = v5;
  v28.receiver = self;
  v28.super_class = (Class)_NUTaggedSpace;
  uint64_t v7 = [(_NUTaggedSpace *)&v28 init];
  v8 = v7;
  if (v7)
  {
    objc_storeStrong((id *)&v7->_space, a3);
    char v9 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    tagNodes = v8->_tagNodes;
    v8->_tagNodes = v9;
  }
  return v8;
}

- (_NUTaggedSpace)init
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  if (_NULogOnceToken != -1) {
    dispatch_once(&_NULogOnceToken, &__block_literal_global_8570);
  }
  BOOL v3 = (void *)_NUAssertLogger;
  if (os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR))
  {
    id v4 = NSString;
    id v5 = v3;
    uint64_t v6 = (objc_class *)objc_opt_class();
    uint64_t v7 = NSStringFromClass(v6);
    v8 = NSStringFromSelector(a2);
    char v9 = [v4 stringWithFormat:@"Initializer not available: -[%@ %@], use designated initializer instead.", v7, v8];
    *(_DWORD *)buf = 138543362;
    v29 = v9;
    _os_log_error_impl(&dword_1A9892000, v5, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    uint64_t v10 = _NULogOnceToken;
    if (!dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey))
    {
      if (v10 != -1) {
        dispatch_once(&_NULogOnceToken, &__block_literal_global_8570);
      }
      goto LABEL_8;
    }
    if (v10 != -1) {
      dispatch_once(&_NULogOnceToken, &__block_literal_global_8570);
    }
  }
  else if (!dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey))
  {
LABEL_8:
    BOOL v11 = (void *)_NUAssertLogger;
    if (!os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR)) {
      goto LABEL_15;
    }
    v12 = (void *)MEMORY[0x1E4F29060];
    v13 = v11;
    v14 = [v12 callStackSymbols];
    long long v15 = [v14 componentsJoinedByString:@"\n"];
    *(_DWORD *)buf = 138543362;
    v29 = v15;
    _os_log_error_impl(&dword_1A9892000, v13, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    goto LABEL_14;
  }
  BOOL v16 = (void *)_NUAssertLogger;
  if (!os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR)) {
    goto LABEL_15;
  }
  specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
  long long v18 = (void *)MEMORY[0x1E4F29060];
  id v19 = specific;
  v13 = v16;
  uint64_t v20 = [v18 callStackSymbols];
  id v21 = [v20 componentsJoinedByString:@"\n"];
  *(_DWORD *)buf = 138543618;
  v29 = specific;
  __int16 v30 = 2114;
  __int16 v31 = v21;
  _os_log_error_impl(&dword_1A9892000, v13, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

LABEL_14:
LABEL_15:
  uint64_t v22 = (objc_class *)objc_opt_class();
  uint64_t v23 = NSStringFromClass(v22);
  NSStringFromSelector(a2);
  objc_claimAutoreleasedReturnValue();
  _NUAssertFailHandler((uint64_t)"-[_NUTaggedSpace init]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Geometry/NUGeometrySpaceMap.m", 49, @"Initializer not available: -[%@ %@], use designated initializer instead.", v24, v25, v26, v27, v23);
}

@end