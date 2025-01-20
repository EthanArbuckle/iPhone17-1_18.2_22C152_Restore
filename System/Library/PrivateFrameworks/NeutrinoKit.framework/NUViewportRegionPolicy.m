@interface NUViewportRegionPolicy
- (NSString)debugDescription;
- (NUViewportRegionPolicy)init;
- (NUViewportRegionPolicy)initWithViewport:(id)a3;
- (id)regionForGeometry:(id)a3;
@end

@implementation NUViewportRegionPolicy

- (void).cxx_destruct
{
}

- (NSString)debugDescription
{
  return (NSString *)[NSString stringWithFormat:@"<%@: %p> viewport=%@", objc_opt_class(), self, self->_viewport];
}

- (id)regionForGeometry:(id)a3
{
  id v4 = a3;
  [v4 scaledExtent];
  double v6 = v5;
  double v8 = v7;
  [(NUViewport *)self->_viewport anchorPoint];
  NUAbsolutePointInRect();
  double v10 = v9;
  double v12 = v11;
  [(NUViewport *)self->_viewport backingPosition];
  CGFloat v14 = v10 - v13;
  CGFloat v16 = v12 - v15;
  [(NUViewport *)self->_viewport backingSize];
  v23.size.width = v17;
  v23.size.height = v18;
  v23.origin.x = v14;
  v23.origin.y = v16;
  CGRectOffset(v23, -v6, -v8);
  [v4 roundingPolicy];
  NUPixelRectFromCGRect();
  [v4 scaledSize];

  NUPixelRectIntersection();
  NUPixelRectFlipYOrigin();
  memset(v21, 0, sizeof(v21));
  v19 = [MEMORY[0x263F58678] regionWithRect:v21];

  return v19;
}

- (NUViewportRegionPolicy)initWithViewport:(id)a3
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (!v4)
  {
    double v10 = NUAssertLogger_802();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      double v11 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "viewport != nil");
      *(_DWORD *)buf = 138543362;
      v25 = v11;
      _os_log_error_impl(&dword_217C0A000, v10, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    double v12 = (const void **)MEMORY[0x263F585C8];
    specific = dispatch_get_specific((const void *)*MEMORY[0x263F585C8]);
    CGFloat v14 = NUAssertLogger_802();
    BOOL v15 = os_log_type_enabled(v14, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v15)
      {
        CGFloat v18 = dispatch_get_specific(*v12);
        v19 = (void *)MEMORY[0x263F08B88];
        id v20 = v18;
        v21 = [v19 callStackSymbols];
        v22 = [v21 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v25 = v18;
        __int16 v26 = 2114;
        v27 = v22;
        _os_log_error_impl(&dword_217C0A000, v14, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v15)
    {
      CGFloat v16 = [MEMORY[0x263F08B88] callStackSymbols];
      CGFloat v17 = [v16 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v25 = v17;
      _os_log_error_impl(&dword_217C0A000, v14, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler();
  }
  double v5 = v4;
  v23.receiver = self;
  v23.super_class = (Class)NUViewportRegionPolicy;
  double v6 = [(NUViewportRegionPolicy *)&v23 init];
  uint64_t v7 = [v5 copy];
  viewport = v6->_viewport;
  v6->_viewport = (NUViewport *)v7;

  return v6;
}

- (NUViewportRegionPolicy)init
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  v3 = (uint64_t *)MEMORY[0x263F586F0];
  if (*MEMORY[0x263F586F0] != -1) {
    goto LABEL_15;
  }
  while (1)
  {
    id v4 = (os_log_t *)MEMORY[0x263F586E8];
    double v5 = (void *)*MEMORY[0x263F586E8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F586E8], OS_LOG_TYPE_ERROR))
    {
      double v6 = NSString;
      uint64_t v7 = v5;
      double v8 = (objc_class *)objc_opt_class();
      double v9 = NSStringFromClass(v8);
      double v10 = NSStringFromSelector(a2);
      double v11 = [v6 stringWithFormat:@"Initializer not available: -[%@ %@], use designated initializer instead.", v9, v10];
      *(_DWORD *)buf = 138543362;
      __int16 v26 = v11;
      _os_log_error_impl(&dword_217C0A000, v7, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

      uint64_t v12 = *v3;
      if (!dispatch_get_specific((const void *)*MEMORY[0x263F585C8]))
      {
        if (v12 != -1) {
          dispatch_once(MEMORY[0x263F586F0], &__block_literal_global_817);
        }
LABEL_7:
        os_log_t v13 = *v4;
        if (os_log_type_enabled(*v4, OS_LOG_TYPE_ERROR))
        {
          CGFloat v14 = (void *)MEMORY[0x263F08B88];
          BOOL v15 = v13;
          CGFloat v16 = [v14 callStackSymbols];
          CGFloat v17 = [v16 componentsJoinedByString:@"\n"];
          *(_DWORD *)buf = 138543362;
          __int16 v26 = v17;
          _os_log_error_impl(&dword_217C0A000, v15, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

LABEL_13:
          goto LABEL_14;
        }
        goto LABEL_14;
      }
      if (v12 != -1) {
        dispatch_once(MEMORY[0x263F586F0], &__block_literal_global_817);
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
      id v20 = (void *)MEMORY[0x263F08B88];
      id v21 = specific;
      BOOL v15 = v18;
      v22 = [v20 callStackSymbols];
      objc_super v23 = [v22 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543618;
      __int16 v26 = specific;
      __int16 v27 = 2114;
      uint64_t v28 = v23;
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
    dispatch_once(MEMORY[0x263F586F0], &__block_literal_global_817);
  }
}

@end