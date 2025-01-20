@interface NUSpace
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)transformTime:(SEL)a3;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)transformTime:(SEL)a3 toSpace:(id *)a4;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)transformTimeBackward:(SEL)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToSpace:(id)a3;
- (CGPoint)transformPoint:(CGPoint)a3 toSpace:(id)a4;
- (CGPoint)transformPointBackward:(CGPoint)a3;
- (CGPoint)transformPointForward:(CGPoint)a3;
- (NSArray)transformStack;
- (NUSpace)init;
- (NUSpace)initWithTransformStack:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)hash;
- (void)appendTransform:(id)a3;
- (void)setTransformStack:(id)a3;
@end

@implementation NUSpace

- (void).cxx_destruct
{
}

- (void)setTransformStack:(id)a3
{
}

- (NSArray)transformStack
{
  return (NSArray *)objc_getProperty(self, a2, 8, 1);
}

- (BOOL)isEqualToSpace:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!v4)
  {
    v8 = NUAssertLogger_34();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v9 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "other != nil");
      *(_DWORD *)buf = 138543362;
      v25 = v9;
      _os_log_error_impl(&dword_1A9892000, v8, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    v11 = NUAssertLogger_34();
    BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v12)
      {
        v15 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v16 = (void *)MEMORY[0x1E4F29060];
        id v17 = v15;
        v18 = [v16 callStackSymbols];
        v19 = [v18 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v25 = v15;
        __int16 v26 = 2114;
        v27 = v19;
        _os_log_error_impl(&dword_1A9892000, v11, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v12)
    {
      v13 = [MEMORY[0x1E4F29060] callStackSymbols];
      v14 = [v13 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v25 = v14;
      _os_log_error_impl(&dword_1A9892000, v11, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUSpace isEqualToSpace:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Geometry/transforms/NUSpace.m", 147, @"Invalid parameter not satisfying: %s", v20, v21, v22, v23, (uint64_t)"other != nil");
  }
  v5 = v4;
  char v6 = [(NSArray *)self->_transformStack isEqual:*((void *)v4 + 1)];

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0 && [(NUSpace *)self isEqualToSpace:v4];

  return v5;
}

- (unint64_t)hash
{
  return NUDeepArrayHash(self->_transformStack);
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)transformTimeBackward:(SEL)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  *retstr = *a4;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  BOOL v5 = [(NSArray *)self->_transformStack reverseObjectEnumerator];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v18 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = [*(id *)(*((void *)&v17 + 1) + 8 * i) inverseTransform];
        v11 = v10;
        if (v10)
        {
          long long v13 = *(_OWORD *)&retstr->var0;
          int64_t var3 = retstr->var3;
          [v10 transformTime:&v13];
        }
        else
        {
          long long v15 = 0uLL;
          int64_t v16 = 0;
        }
        *(_OWORD *)&retstr->var0 = v15;
        retstr->int64_t var3 = v16;
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v7);
  }

  return result;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)transformTime:(SEL)a3 toSpace:(id *)a4
{
  id v8 = a5;
  memset(&v10[1], 0, sizeof($3CC8671D27C23BF42ADDB32F2B5E48AE));
  v10[0] = *a4;
  [(NUSpace *)self transformTime:v10];
  retstr->var0 = 0;
  *(void *)&retstr->var1 = 0;
  retstr->int64_t var3 = 0;
  if (v8)
  {
    v10[0] = v10[1];
    [v8 transformTimeBackward:v10];
  }

  return result;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)transformTime:(SEL)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  *retstr = *a4;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  BOOL v5 = self->_transformStack;
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
        v10 = *(void **)(*((void *)&v16 + 1) + 8 * v9);
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

- (CGPoint)transformPointBackward:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  BOOL v5 = [(NSArray *)self->_transformStack reverseObjectEnumerator];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v16;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = [*(id *)(*((void *)&v15 + 1) + 8 * v9) inverseTransform];
        objc_msgSend(v10, "transformPoint:", x, y);
        double x = v11;
        double y = v12;

        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v7);
  }

  double v13 = x;
  double v14 = y;
  result.double y = v14;
  result.double x = v13;
  return result;
}

- (CGPoint)transformPointForward:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  BOOL v5 = self->_transformStack;
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

- (CGPoint)transformPoint:(CGPoint)a3 toSpace:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  -[NUSpace transformPointForward:](self, "transformPointForward:", x, y);
  objc_msgSend(v7, "transformPointBackward:");
  double v9 = v8;
  double v11 = v10;

  double v12 = v9;
  double v13 = v11;
  result.double y = v13;
  result.double x = v12;
  return result;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  if ([(NSArray *)self->_transformStack count]) {
    transformStack = self->_transformStack;
  }
  else {
    transformStack = (NSArray *)@"{}";
  }
  return (id)[v3 stringWithFormat:@"<%@:%p :: transforms: %@>", v4, self, transformStack];
}

- (void)appendTransform:(id)a3
{
  self->_transformStack = [(NSArray *)self->_transformStack arrayByAddingObject:a3];

  MEMORY[0x1F41817F8]();
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = +[NUSpace allocWithZone:a3];
  BOOL v5 = (void *)[(NSArray *)self->_transformStack copy];
  uint64_t v6 = [(NUSpace *)v4 initWithTransformStack:v5];

  return v6;
}

- (NUSpace)initWithTransformStack:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = (NSArray *)a3;
  if (!v4)
  {
    double v9 = NUAssertLogger_34();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      double v10 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "transformStack != nil");
      *(_DWORD *)buf = 138543362;
      v27 = v10;
      _os_log_error_impl(&dword_1A9892000, v9, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    double v12 = NUAssertLogger_34();
    BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v13)
      {
        long long v16 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        long long v17 = (void *)MEMORY[0x1E4F29060];
        id v18 = v16;
        uint64_t v19 = [v17 callStackSymbols];
        uint64_t v20 = [v19 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v27 = v16;
        __int16 v28 = 2114;
        v29 = v20;
        _os_log_error_impl(&dword_1A9892000, v12, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v13)
    {
      long long v14 = [MEMORY[0x1E4F29060] callStackSymbols];
      long long v15 = [v14 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v27 = v15;
      _os_log_error_impl(&dword_1A9892000, v12, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUSpace initWithTransformStack:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Geometry/transforms/NUSpace.m", 32, @"Invalid parameter not satisfying: %s", v21, v22, v23, v24, (uint64_t)"transformStack != nil");
  }
  BOOL v5 = v4;
  v25.receiver = self;
  v25.super_class = (Class)NUSpace;
  uint64_t v6 = [(NUSpace *)&v25 init];
  transformStack = v6->_transformStack;
  v6->_transformStack = v5;

  return v6;
}

- (NUSpace)init
{
  return [(NUSpace *)self initWithTransformStack:MEMORY[0x1E4F1CBF0]];
}

@end