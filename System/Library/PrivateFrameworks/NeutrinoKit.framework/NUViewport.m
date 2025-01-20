@interface NUViewport
- (CGPoint)anchorPoint;
- (CGPoint)backingPosition;
- (CGPoint)position;
- (CGSize)backingSize;
- (CGSize)size;
- (NUViewport)init;
- (NUViewport)initWithSize:(CGSize)a3;
- (NUViewport)initWithSize:(CGSize)a3 backingScaleFactor:(double)a4;
- (double)backingScaleFactor;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)setAnchorPoint:(CGPoint)a3;
- (void)setPosition:(CGPoint)a3;
@end

@implementation NUViewport

- (void)setAnchorPoint:(CGPoint)a3
{
  self->_anchorPoint = a3;
}

- (CGPoint)anchorPoint
{
  double x = self->_anchorPoint.x;
  double y = self->_anchorPoint.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setPosition:(CGPoint)a3
{
  self->_position = a3;
}

- (CGPoint)position
{
  double x = self->_position.x;
  double y = self->_position.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (double)backingScaleFactor
{
  return self->_backingScaleFactor;
}

- (CGSize)size
{
  double width = self->_size.width;
  double height = self->_size.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (CGPoint)backingPosition
{
  double backingScaleFactor = self->_backingScaleFactor;
  double v3 = self->_position.x * backingScaleFactor;
  double v4 = backingScaleFactor * self->_position.y;
  result.double y = v4;
  result.double x = v3;
  return result;
}

- (CGSize)backingSize
{
  double backingScaleFactor = self->_backingScaleFactor;
  double v3 = self->_size.width * backingScaleFactor;
  double v4 = backingScaleFactor * self->_size.height;
  result.double height = v4;
  result.double width = v3;
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = (id)[(id)objc_opt_class() allocWithZone:a3];
  *((_OWORD *)result + 1) = self->_size;
  *((void *)result + 1) = *(void *)&self->_backingScaleFactor;
  *((_OWORD *)result + 2) = self->_position;
  *((_OWORD *)result + 3) = self->_anchorPoint;
  return result;
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"<%@:%p size=%gx%g scale=%g position:(%g,%g) anchor:(%g,%g)>", objc_opt_class(), self, *(void *)&self->_size.width, *(void *)&self->_size.height, *(void *)&self->_backingScaleFactor, *(void *)&self->_position.x, *(void *)&self->_position.y, *(void *)&self->_anchorPoint.x, *(void *)&self->_anchorPoint.y];
}

- (NUViewport)initWithSize:(CGSize)a3 backingScaleFactor:(double)a4
{
  uint64_t v44 = *MEMORY[0x263EF8340];
  if (a3.width <= 0.0)
  {
    v8 = NUAssertLogger_749();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "size.width > 0.0");
      v9 = (const void **)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v41 = v9;
      _os_log_error_impl(&dword_217C0A000, v8, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    v10 = (const void **)MEMORY[0x263F585C8];
    specific = dispatch_get_specific((const void *)*MEMORY[0x263F585C8]);
    v12 = NUAssertLogger_749();
    BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v13)
      {
        v26 = dispatch_get_specific(*v10);
        v27 = (void *)MEMORY[0x263F08B88];
        id v28 = v26;
        v10 = [v27 callStackSymbols];
        v29 = [v10 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v41 = (const void **)v26;
        __int16 v42 = 2114;
        v43 = v29;
        _os_log_error_impl(&dword_217C0A000, v12, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v13)
    {
      v14 = [MEMORY[0x263F08B88] callStackSymbols];
      v10 = [v14 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v41 = v10;
      _os_log_error_impl(&dword_217C0A000, v12, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    int v18 = _NUAssertFailHandler();
    goto LABEL_23;
  }
  CGFloat height = a3.height;
  if (a3.height <= 0.0)
  {
    v15 = NUAssertLogger_749();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "size.height > 0.0");
      v16 = (const void **)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v41 = v16;
      _os_log_error_impl(&dword_217C0A000, v15, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    v10 = (const void **)MEMORY[0x263F585C8];
    v17 = dispatch_get_specific((const void *)*MEMORY[0x263F585C8]);
    v12 = NUAssertLogger_749();
    int v18 = os_log_type_enabled(v12, OS_LOG_TYPE_ERROR);
    if (!v17)
    {
      if (v18)
      {
        v19 = [MEMORY[0x263F08B88] callStackSymbols];
        v10 = [v19 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543362;
        v41 = v10;
        _os_log_error_impl(&dword_217C0A000, v12, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
      }
LABEL_25:

      int v23 = _NUAssertFailHandler();
      goto LABEL_26;
    }
LABEL_23:
    if (v18)
    {
      v30 = dispatch_get_specific(*v10);
      v31 = (void *)MEMORY[0x263F08B88];
      id v32 = v30;
      v10 = [v31 callStackSymbols];
      v33 = [v10 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543618;
      v41 = (const void **)v30;
      __int16 v42 = 2114;
      v43 = v33;
      _os_log_error_impl(&dword_217C0A000, v12, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
    }
    goto LABEL_25;
  }
  if (a4 <= 0.0)
  {
    v20 = NUAssertLogger_749();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "factor > 0.0");
      v21 = (const void **)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v41 = v21;
      _os_log_error_impl(&dword_217C0A000, v20, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    v10 = (const void **)MEMORY[0x263F585C8];
    v22 = dispatch_get_specific((const void *)*MEMORY[0x263F585C8]);
    v12 = NUAssertLogger_749();
    int v23 = os_log_type_enabled(v12, OS_LOG_TYPE_ERROR);
    if (!v22)
    {
      if (v23)
      {
        v24 = [MEMORY[0x263F08B88] callStackSymbols];
        v25 = [v24 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543362;
        v41 = v25;
        _os_log_error_impl(&dword_217C0A000, v12, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
      }
      goto LABEL_28;
    }
LABEL_26:
    if (v23)
    {
      v34 = dispatch_get_specific(*v10);
      v35 = (void *)MEMORY[0x263F08B88];
      id v36 = v34;
      v37 = [v35 callStackSymbols];
      v38 = [v37 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543618;
      v41 = (const void **)v34;
      __int16 v42 = 2114;
      v43 = v38;
      _os_log_error_impl(&dword_217C0A000, v12, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
    }
LABEL_28:

    _NUAssertFailHandler();
  }
  CGFloat width = a3.width;
  v39.receiver = self;
  v39.super_class = (Class)NUViewport;
  id result = [(NUViewport *)&v39 init];
  result->_size.CGFloat width = width;
  result->_size.CGFloat height = height;
  result->_double backingScaleFactor = a4;
  return result;
}

- (NUViewport)initWithSize:(CGSize)a3
{
  return -[NUViewport initWithSize:backingScaleFactor:](self, "initWithSize:backingScaleFactor:", a3.width, a3.height, 1.0);
}

- (NUViewport)init
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  double v3 = (uint64_t *)MEMORY[0x263F586F0];
  if (*MEMORY[0x263F586F0] != -1) {
    goto LABEL_15;
  }
  while (1)
  {
    double v4 = (os_log_t *)MEMORY[0x263F586E8];
    v5 = (void *)*MEMORY[0x263F586E8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F586E8], OS_LOG_TYPE_ERROR))
    {
      v6 = NSString;
      v7 = v5;
      v8 = (objc_class *)objc_opt_class();
      v9 = NSStringFromClass(v8);
      v10 = NSStringFromSelector(a2);
      v11 = [v6 stringWithFormat:@"Initializer not available: -[%@ %@], use designated initializer instead.", v9, v10];
      *(_DWORD *)buf = 138543362;
      v26 = v11;
      _os_log_error_impl(&dword_217C0A000, v7, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

      uint64_t v12 = *v3;
      if (!dispatch_get_specific((const void *)*MEMORY[0x263F585C8]))
      {
        if (v12 != -1) {
          dispatch_once(MEMORY[0x263F586F0], &__block_literal_global_766);
        }
LABEL_7:
        os_log_t v13 = *v4;
        if (os_log_type_enabled(*v4, OS_LOG_TYPE_ERROR))
        {
          v14 = (void *)MEMORY[0x263F08B88];
          v15 = v13;
          v16 = [v14 callStackSymbols];
          v17 = [v16 componentsJoinedByString:@"\n"];
          *(_DWORD *)buf = 138543362;
          v26 = v17;
          _os_log_error_impl(&dword_217C0A000, v15, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

LABEL_13:
          goto LABEL_14;
        }
        goto LABEL_14;
      }
      if (v12 != -1) {
        dispatch_once(MEMORY[0x263F586F0], &__block_literal_global_766);
      }
    }
    else if (!dispatch_get_specific((const void *)*MEMORY[0x263F585C8]))
    {
      goto LABEL_7;
    }
    os_log_t v18 = *v4;
    if (os_log_type_enabled(*v4, OS_LOG_TYPE_ERROR))
    {
      specific = dispatch_get_specific((const void *)*MEMORY[0x263F585C8]);
      v20 = (void *)MEMORY[0x263F08B88];
      id v21 = specific;
      v15 = v18;
      v22 = [v20 callStackSymbols];
      int v23 = [v22 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543618;
      v26 = specific;
      __int16 v27 = 2114;
      id v28 = v23;
      _os_log_error_impl(&dword_217C0A000, v15, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      goto LABEL_13;
    }
LABEL_14:
    v24 = (objc_class *)objc_opt_class();
    NSStringFromClass(v24);
    objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    objc_claimAutoreleasedReturnValue();
    _NUAssertFailHandler();
LABEL_15:
    dispatch_once(MEMORY[0x263F586F0], &__block_literal_global_766);
  }
}

@end