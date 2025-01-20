@interface NUCompoundTransform
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)transformTime:(SEL)a3;
- (CGPoint)transformPoint:(CGPoint)a3;
- (NUCompoundTransform)initWithSrcTransforms:(id)a3 dstTransforms:(id)a4;
- (NUCompoundTransform)initWithTransforms:(id)a3;
- (id)description;
- (id)inverseTransform;
- (void)transformMatrix:(_OWORD *)a3@<X8>;
@end

@implementation NUCompoundTransform

- (void).cxx_destruct
{
}

- (id)description
{
  return [(NSArray *)self->_transforms componentsJoinedByString:@", "];
}

- (void)transformMatrix:(_OWORD *)a3@<X8>
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  long long v4 = a2[5];
  a3[4] = a2[4];
  a3[5] = v4;
  long long v5 = a2[7];
  a3[6] = a2[6];
  a3[7] = v5;
  long long v6 = a2[1];
  *a3 = *a2;
  a3[1] = v6;
  long long v7 = a2[3];
  a3[2] = a2[2];
  a3[3] = v7;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id v8 = *(id *)(a1 + 8);
  uint64_t v9 = [v8 countByEnumeratingWithState:&v31 objects:v35 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v32;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v32 != v11) {
          objc_enumerationMutation(v8);
        }
        v13 = *(void **)(*((void *)&v31 + 1) + 8 * v12);
        if (v13)
        {
          long long v14 = a3[5];
          v22[4] = a3[4];
          v22[5] = v14;
          long long v15 = a3[7];
          v22[6] = a3[6];
          v22[7] = v15;
          long long v16 = a3[1];
          v22[0] = *a3;
          v22[1] = v16;
          long long v17 = a3[3];
          v22[2] = a3[2];
          v22[3] = v17;
          [v13 transformMatrix:v22];
        }
        else
        {
          long long v29 = 0u;
          long long v30 = 0u;
          long long v27 = 0u;
          long long v28 = 0u;
          long long v25 = 0u;
          long long v26 = 0u;
          long long v23 = 0u;
          long long v24 = 0u;
        }
        long long v18 = v28;
        a3[4] = v27;
        a3[5] = v18;
        long long v19 = v30;
        a3[6] = v29;
        a3[7] = v19;
        long long v20 = v24;
        *a3 = v23;
        a3[1] = v20;
        long long v21 = v26;
        ++v12;
        a3[2] = v25;
        a3[3] = v21;
      }
      while (v10 != v12);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v31 objects:v35 count:16];
    }
    while (v10);
  }
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)transformTime:(SEL)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  *retstr = *a4;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v5 = self->_transforms;
  uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v17;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v17 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v16 + 1) + 8 * v9);
        if (v10)
        {
          long long v12 = *(_OWORD *)&retstr->var0;
          int64_t var3 = retstr->var3;
          [v10 transformTime:&v12];
        }
        else
        {
          long long v14 = 0uLL;
          int64_t v15 = 0;
        }
        *(_OWORD *)&retstr->var0 = v14;
        retstr->int64_t var3 = v15;
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v7);
  }

  return result;
}

- (CGPoint)transformPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v5 = self->_transforms;
  uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v15;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * v9), "transformPoint:", x, y, (void)v14);
        double x = v10;
        double y = v11;
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v7);
  }

  double v12 = x;
  double v13 = y;
  result.double y = v13;
  result.double x = v12;
  return result;
}

- (id)inverseTransform
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  v3 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSArray count](self->_transforms, "count"));
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v4 = [(NSArray *)self->_transforms reverseObjectEnumerator];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = [*(id *)(*((void *)&v12 + 1) + 8 * i) inverseTransform];
        [v3 addObject:v9];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }

  double v10 = [[NUCompoundTransform alloc] initWithTransforms:v3];

  return v10;
}

- (NUCompoundTransform)initWithTransforms:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!v4)
  {
    double v10 = NUAssertLogger_21663();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      double v11 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "transforms != nil");
      *(_DWORD *)buf = 138543362;
      long long v28 = v11;
      _os_log_error_impl(&dword_1A9892000, v10, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    long long v13 = NUAssertLogger_21663();
    BOOL v14 = os_log_type_enabled(v13, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v14)
      {
        uint64_t v17 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        long long v18 = (void *)MEMORY[0x1E4F29060];
        id v19 = v17;
        long long v20 = [v18 callStackSymbols];
        uint64_t v21 = [v20 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        long long v28 = v17;
        __int16 v29 = 2114;
        long long v30 = v21;
        _os_log_error_impl(&dword_1A9892000, v13, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v14)
    {
      long long v15 = [MEMORY[0x1E4F29060] callStackSymbols];
      long long v16 = [v15 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      long long v28 = v16;
      _os_log_error_impl(&dword_1A9892000, v13, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUCompoundTransform initWithTransforms:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Geometry/transforms/NUCompoundTransform.m", 36, @"Invalid parameter not satisfying: %s", v22, v23, v24, v25, (uint64_t)"transforms != nil");
  }
  uint64_t v5 = v4;
  v26.receiver = self;
  v26.super_class = (Class)NUCompoundTransform;
  uint64_t v6 = [(NUCompoundTransform *)&v26 init];
  uint64_t v7 = [v5 copy];
  transforms = v6->_transforms;
  v6->_transforms = (NSArray *)v7;

  return v6;
}

- (NUCompoundTransform)initWithSrcTransforms:(id)a3 dstTransforms:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithArray:v6];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  uint64_t v9 = objc_msgSend(v7, "reverseObjectEnumerator", 0);
  uint64_t v10 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v18;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v18 != v12) {
          objc_enumerationMutation(v9);
        }
        BOOL v14 = [*(id *)(*((void *)&v17 + 1) + 8 * v13) inverseTransform];
        [v8 addObject:v14];

        ++v13;
      }
      while (v11 != v13);
      uint64_t v11 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v11);
  }

  long long v15 = [(NUCompoundTransform *)self initWithTransforms:v8];
  return v15;
}

@end