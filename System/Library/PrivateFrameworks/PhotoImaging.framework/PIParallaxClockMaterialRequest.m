@interface PIParallaxClockMaterialRequest
- (PFParallaxLayerStack)layerStack;
- (PIParallaxClockMaterialRequest)initWithComposition:(id)a3;
- (PIParallaxClockMaterialRequest)initWithLayerStack:(id)a3;
- (PIParallaxStyle)style;
- (id)copyWithZone:(_NSZone *)a3;
- (id)newRenderJob;
- (int64_t)mediaComponentType;
- (void)setLayerStack:(id)a3;
- (void)setStyle:(id)a3;
@end

@implementation PIParallaxClockMaterialRequest

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_style, 0);
  objc_storeStrong((id *)&self->_layerStack, 0);
}

- (void)setStyle:(id)a3
{
}

- (PIParallaxStyle)style
{
  return self->_style;
}

- (void)setLayerStack:(id)a3
{
}

- (PFParallaxLayerStack)layerStack
{
  return self->_layerStack;
}

- (int64_t)mediaComponentType
{
  return 1;
}

- (id)newRenderJob
{
  v3 = [_PIParallaxClockMaterialJob alloc];
  return [(NURenderJob *)v3 initWithRequest:self];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v10.receiver = self;
  v10.super_class = (Class)PIParallaxClockMaterialRequest;
  v4 = [(NURenderRequest *)&v10 copyWithZone:a3];
  if (v4)
  {
    uint64_t v5 = [(PIParallaxClockMaterialRequest *)self layerStack];
    v6 = (void *)v4[19];
    v4[19] = v5;

    uint64_t v7 = [(PIParallaxClockMaterialRequest *)self style];
    v8 = (void *)v4[20];
    v4[20] = v7;
  }
  return v4;
}

- (PIParallaxClockMaterialRequest)initWithComposition:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = (uint64_t *)MEMORY[0x1E4F7A750];
  if (*MEMORY[0x1E4F7A750] != -1) {
    goto LABEL_15;
  }
  while (1)
  {
    v6 = (os_log_t *)MEMORY[0x1E4F7A748];
    uint64_t v7 = (void *)*MEMORY[0x1E4F7A748];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F7A748], OS_LOG_TYPE_ERROR))
    {
      v8 = NSString;
      v9 = v7;
      objc_super v10 = (objc_class *)objc_opt_class();
      v11 = NSStringFromClass(v10);
      v12 = NSStringFromSelector(a2);
      v13 = [v8 stringWithFormat:@"Initializer not available: -[%@ %@], use designated initializer instead.", v11, v12];
      *(_DWORD *)buf = 138543362;
      v28 = v13;
      _os_log_error_impl(&dword_1A9680000, v9, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

      uint64_t v14 = *v5;
      if (!dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]))
      {
        if (v14 != -1) {
          dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_3251);
        }
LABEL_7:
        os_log_t v15 = *v6;
        if (os_log_type_enabled(*v6, OS_LOG_TYPE_ERROR))
        {
          v16 = (void *)MEMORY[0x1E4F29060];
          v17 = v15;
          v18 = [v16 callStackSymbols];
          v19 = [v18 componentsJoinedByString:@"\n"];
          *(_DWORD *)buf = 138543362;
          v28 = v19;
          _os_log_error_impl(&dword_1A9680000, v17, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

LABEL_13:
          goto LABEL_14;
        }
        goto LABEL_14;
      }
      if (v14 != -1) {
        dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_3251);
      }
    }
    else if (!dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]))
    {
      goto LABEL_7;
    }
    os_log_t v20 = *v6;
    if (os_log_type_enabled(*v6, OS_LOG_TYPE_ERROR))
    {
      specific = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
      v22 = (void *)MEMORY[0x1E4F29060];
      id v23 = specific;
      v17 = v20;
      v24 = [v22 callStackSymbols];
      v25 = [v24 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543618;
      v28 = specific;
      __int16 v29 = 2114;
      v30 = v25;
      _os_log_error_impl(&dword_1A9680000, v17, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      goto LABEL_13;
    }
LABEL_14:
    v26 = (objc_class *)objc_opt_class();
    NSStringFromClass(v26);
    objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    objc_claimAutoreleasedReturnValue();
    _NUAssertFailHandler();
LABEL_15:
    dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_3251);
  }
}

- (PIParallaxClockMaterialRequest)initWithLayerStack:(id)a3
{
  id v5 = a3;
  id v6 = +[PIPhotoEditHelper newComposition];
  uint64_t v7 = (void *)MEMORY[0x1E4F1E050];
  v8 = [MEMORY[0x1E4F1E008] whiteColor];
  v9 = [v7 imageWithColor:v8];
  objc_super v10 = +[PIPhotoEditHelper imageSourceWithCIImage:v9 orientation:1];

  [v6 setObject:v10 forKeyedSubscript:@"source"];
  [v6 setMediaType:1];
  v14.receiver = self;
  v14.super_class = (Class)PIParallaxClockMaterialRequest;
  v11 = [(NURenderRequest *)&v14 initWithComposition:v6];
  v12 = v11;
  if (v11) {
    objc_storeStrong((id *)&v11->_layerStack, a3);
  }

  return v12;
}

@end