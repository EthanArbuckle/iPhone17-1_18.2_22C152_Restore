@interface PIParallaxClockLayoutRequest
- (PFPosterOrientedLayout)layout;
- (PIParallaxClockLayoutRequest)initWithComposition:(id)a3;
- (PIParallaxClockLayoutRequest)initWithSegmentationItem:(id)a3;
- (PISegmentationItem)segmentationItem;
- (id)copyWithZone:(_NSZone *)a3;
- (id)newRenderJob;
- (int64_t)mediaComponentType;
- (void)setLayout:(id)a3;
- (void)submit:(id)a3;
@end

@implementation PIParallaxClockLayoutRequest

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_layout, 0);
  objc_storeStrong((id *)&self->_segmentationItem, 0);
}

- (void)setLayout:(id)a3
{
}

- (PFPosterOrientedLayout)layout
{
  return self->_layout;
}

- (PISegmentationItem)segmentationItem
{
  return self->_segmentationItem;
}

- (void)submit:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v18 = a3;
  v4 = [(PIParallaxClockLayoutRequest *)self layout];

  if (!v4)
  {
    v5 = NUAssertLogger_930();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v6 = [NSString stringWithFormat:@"Layout must be set before submitting ClockLayoutRequest"];
      *(_DWORD *)buf = 138543362;
      v20 = v6;
      _os_log_error_impl(&dword_1A9680000, v5, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    v7 = (const void **)MEMORY[0x1E4F7A308];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    v9 = NUAssertLogger_930();
    BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v10)
      {
        v13 = dispatch_get_specific(*v7);
        v14 = (void *)MEMORY[0x1E4F29060];
        id v15 = v13;
        v16 = [v14 callStackSymbols];
        v17 = [v16 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v20 = v13;
        __int16 v21 = 2114;
        v22 = v17;
        _os_log_error_impl(&dword_1A9680000, v9, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v10)
    {
      v11 = [MEMORY[0x1E4F29060] callStackSymbols];
      v12 = [v11 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v20 = v12;
      _os_log_error_impl(&dword_1A9680000, v9, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler();
  }
  [(NURenderRequest *)self submitGeneric:v18];
}

- (int64_t)mediaComponentType
{
  return 1;
}

- (id)newRenderJob
{
  v3 = [_PIParallaxClockLayoutJob alloc];
  return [(_PIParallaxClockLayoutJob *)v3 initWithParallaxClockLayoutRequest:self];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v10.receiver = self;
  v10.super_class = (Class)PIParallaxClockLayoutRequest;
  v4 = [(NURenderRequest *)&v10 copyWithZone:a3];
  if (v4)
  {
    uint64_t v5 = [(PIParallaxClockLayoutRequest *)self segmentationItem];
    v6 = (void *)v4[19];
    v4[19] = v5;

    uint64_t v7 = [(PIParallaxClockLayoutRequest *)self layout];
    v8 = (void *)v4[20];
    v4[20] = v7;
  }
  return v4;
}

- (PIParallaxClockLayoutRequest)initWithSegmentationItem:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  v4 = (PISegmentationItem *)a3;
  if (!v4)
  {
    objc_super v10 = NUAssertLogger_930();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v11 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "segmentationItem != nil");
      *(_DWORD *)buf = 138543362;
      v25 = v11;
      _os_log_error_impl(&dword_1A9680000, v10, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    v12 = (const void **)MEMORY[0x1E4F7A308];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    v14 = NUAssertLogger_930();
    BOOL v15 = os_log_type_enabled(v14, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v15)
      {
        id v18 = dispatch_get_specific(*v12);
        v19 = (void *)MEMORY[0x1E4F29060];
        id v20 = v18;
        __int16 v21 = [v19 callStackSymbols];
        v22 = [v21 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v25 = v18;
        __int16 v26 = 2114;
        v27 = v22;
        _os_log_error_impl(&dword_1A9680000, v14, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v15)
    {
      v16 = [MEMORY[0x1E4F29060] callStackSymbols];
      v17 = [v16 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v25 = v17;
      _os_log_error_impl(&dword_1A9680000, v14, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler();
  }
  uint64_t v5 = v4;
  v6 = [(PISegmentationItem *)v4 composition];
  v23.receiver = self;
  v23.super_class = (Class)PIParallaxClockLayoutRequest;
  uint64_t v7 = [(NURenderRequest *)&v23 initWithComposition:v6];

  segmentationItem = v7->_segmentationItem;
  v7->_segmentationItem = v5;

  return v7;
}

- (PIParallaxClockLayoutRequest)initWithComposition:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = (void *)MEMORY[0x1E4F7A750];
  if (*MEMORY[0x1E4F7A750] != -1) {
    goto LABEL_15;
  }
  while (1)
  {
    uint64_t v5 = (os_log_t *)MEMORY[0x1E4F7A748];
    v6 = (void *)*MEMORY[0x1E4F7A748];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F7A748], OS_LOG_TYPE_ERROR))
    {
      uint64_t v7 = NSString;
      v8 = v6;
      v9 = (objc_class *)objc_opt_class();
      objc_super v10 = NSStringFromClass(v9);
      v11 = [v7 stringWithFormat:@"This is an abstract method! Subclass '%@' should provide concrete implementation", v10];
      *(_DWORD *)buf = 138543362;
      v25 = v11;
      _os_log_error_impl(&dword_1A9680000, v8, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

      uint64_t v12 = *v4;
      if (!dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]))
      {
        if (v12 != -1) {
          dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_941);
        }
LABEL_7:
        os_log_t v13 = *v5;
        if (os_log_type_enabled(*v5, OS_LOG_TYPE_ERROR))
        {
          v14 = (void *)MEMORY[0x1E4F29060];
          BOOL v15 = v13;
          v16 = [v14 callStackSymbols];
          v17 = [v16 componentsJoinedByString:@"\n"];
          *(_DWORD *)buf = 138543362;
          v25 = v17;
          _os_log_error_impl(&dword_1A9680000, v15, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

LABEL_13:
          goto LABEL_14;
        }
        goto LABEL_14;
      }
      if (v12 != -1) {
        dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_941);
      }
    }
    else if (!dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]))
    {
      goto LABEL_7;
    }
    os_log_t v18 = *v5;
    if (os_log_type_enabled(*v5, OS_LOG_TYPE_ERROR))
    {
      specific = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
      id v20 = (void *)MEMORY[0x1E4F29060];
      id v21 = specific;
      BOOL v15 = v18;
      v22 = [v20 callStackSymbols];
      v4 = [v22 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543618;
      v25 = specific;
      __int16 v26 = 2114;
      v27 = v4;
      _os_log_error_impl(&dword_1A9680000, v15, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      goto LABEL_13;
    }
LABEL_14:
    objc_super v23 = (objc_class *)objc_opt_class();
    NSStringFromClass(v23);
    objc_claimAutoreleasedReturnValue();
    _NUAssertFailHandler();
LABEL_15:
    dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_941);
  }
}

@end