@interface PIParallaxInwardFillKernel
+ (void)fillSourceTexture:(id)a3 intoDestinationTexture:(id)a4 withCommandBuffer:(id)a5;
- (MTLTexture)sourceTexture;
- (void)encodeToCommandBuffer:(id)a3 destinationTexture:(id)a4;
- (void)setSourceTexture:(id)a3;
@end

@implementation PIParallaxInwardFillKernel

- (void).cxx_destruct
{
}

- (void)setSourceTexture:(id)a3
{
}

- (MTLTexture)sourceTexture
{
  return self->_sourceTexture;
}

- (void)encodeToCommandBuffer:(id)a3 destinationTexture:(id)a4
{
  uint64_t v81 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  v11 = [(PIParallaxInwardFillKernel *)self sourceTexture];
  if (!v11)
  {
    v46 = NUAssertLogger_1087();
    if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
    {
      v47 = [NSString stringWithFormat:@"Missing input texture"];
      *(_DWORD *)buf = 138543362;
      *(void *)&buf[4] = v47;
      _os_log_error_impl(&dword_1A9680000, v46, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    v20 = (const void **)MEMORY[0x1E4F7A308];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    v49 = NUAssertLogger_1087();
    BOOL v50 = os_log_type_enabled(v49, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v50)
      {
        v57 = dispatch_get_specific(*v20);
        v58 = (void *)MEMORY[0x1E4F29060];
        id v59 = v57;
        v20 = [v58 callStackSymbols];
        id v9 = [v20 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        *(void *)&buf[4] = v57;
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v9;
        _os_log_error_impl(&dword_1A9680000, v49, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v50)
    {
      v51 = [MEMORY[0x1E4F29060] callStackSymbols];
      v20 = [v51 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      *(void *)&buf[4] = v20;
      _os_log_error_impl(&dword_1A9680000, v49, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    int v55 = _NUAssertFailHandler();
    goto LABEL_35;
  }
  v4 = v11;
  v5 = objc_msgSend(MEMORY[0x1E4F35330], "texture2DDescriptorWithPixelFormat:width:height:mipmapped:", objc_msgSend(v11, "pixelFormat"), (unint64_t)objc_msgSend(v4, "width") >> 1, (unint64_t)objc_msgSend(v4, "height") >> 1, 1);
  [v5 setUsage:3];
  [v5 setStorageMode:2];
  v12 = [v9 device];
  v13 = (void *)[v12 newTextureWithDescriptor:v5];

  if (!v13)
  {
    v52 = NUAssertLogger_1087();
    if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
    {
      v53 = [NSString stringWithFormat:@"Failed to allocate intermediate texture"];
      *(_DWORD *)buf = 138543362;
      *(void *)&buf[4] = v53;
      _os_log_error_impl(&dword_1A9680000, v52, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    v20 = (const void **)MEMORY[0x1E4F7A308];
    v54 = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    v49 = NUAssertLogger_1087();
    int v55 = os_log_type_enabled(v49, OS_LOG_TYPE_ERROR);
    if (!v54)
    {
      if (v55)
      {
        v56 = [MEMORY[0x1E4F29060] callStackSymbols];
        v20 = [v56 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543362;
        *(void *)&buf[4] = v20;
        _os_log_error_impl(&dword_1A9680000, v49, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
      }
LABEL_37:

      _NUAssertFailHandler();
LABEL_38:
      dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_106);
      goto LABEL_15;
    }
LABEL_35:
    if (v55)
    {
      v60 = dispatch_get_specific(*v20);
      v61 = (void *)MEMORY[0x1E4F29060];
      id v62 = v60;
      v20 = [v61 callStackSymbols];
      id v9 = [v20 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543618;
      *(void *)&buf[4] = v60;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v9;
      _os_log_error_impl(&dword_1A9680000, v49, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
    }
    goto LABEL_37;
  }
  v68 = v13;
  uint64_t v14 = [v13 mipmapLevelCount];
  v15 = objc_opt_class();
  v16 = [(NUComputeKernel *)self device];
  id v79 = 0;
  v6 = [v15 pipelineStateForFunctionWithName:@"pi::inward_fill_down" device:v16 error:&v79];
  id v17 = v79;

  v18 = objc_opt_class();
  v19 = [(NUComputeKernel *)self device];
  id v78 = 0;
  self = [v18 pipelineStateForFunctionWithName:@"pi::inward_fill_up" device:v19 error:&v78];
  v20 = (const void **)v78;

  if (v6 && self)
  {
    v69 = self;
    v70 = v6;
    v63 = v20;
    v64 = v5;
    v21 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v14 + 1];
    v22 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v14 + 1];
    [v21 addObject:v4];
    v71 = v22;
    [v22 addObject:v10];
    if (v14)
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        v24 = objc_msgSend(v68, "newTextureViewWithPixelFormat:textureType:levels:slices:", objc_msgSend(v68, "pixelFormat"), objc_msgSend(v68, "textureType"), i, 1, 0, 1);
        [v21 addObject:v24];
        [v71 addObject:v24];
      }
    }
    v65 = v4;
    id v66 = v10;
    v25 = [v9 computeCommandEncoder];
    [v25 pushDebugGroup:@"pi::inward_fill_down"];
    [v25 setComputePipelineState:v6];
    id v67 = v9;
    if (v14)
    {
      uint64_t v26 = 0;
      do
      {
        v27 = [v21 objectAtIndexedSubscript:v26];
        [v25 setTexture:v27 atIndex:0];
        v28 = [v71 objectAtIndexedSubscript:++v26];
        [v25 setTexture:v28 atIndex:1];
        uint64_t v29 = v14;
        v30 = v25;
        uint64_t v31 = [v28 width];
        uint64_t v32 = [v28 height];
        uint64_t v33 = [v28 depth];
        memset(buf, 0, 24);
        *(void *)&long long v76 = v31;
        *((void *)&v76 + 1) = v32;
        uint64_t v77 = v33;
        [MEMORY[0x1E4F7A410] groupSizeForImageSize:&v76 pipelineState:v70];
        long long v76 = 0uLL;
        uint64_t v77 = 0;
        long long v74 = *(_OWORD *)buf;
        uint64_t v75 = *(void *)&buf[16];
        *(void *)&long long v72 = v31;
        *((void *)&v72 + 1) = v32;
        v25 = v30;
        uint64_t v14 = v29;
        uint64_t v73 = v33;
        [MEMORY[0x1E4F7A410] gridSizeForThreadGroupSize:&v74 imageSize:&v72];
        long long v74 = v76;
        uint64_t v75 = v77;
        long long v72 = *(_OWORD *)buf;
        uint64_t v73 = *(void *)&buf[16];
        [v25 dispatchThreadgroups:&v74 threadsPerThreadgroup:&v72];
      }
      while (v29 != v26);
      [v25 popDebugGroup];
      [v25 endEncoding];

      uint64_t v34 = 0;
      id v9 = v67;
      do
      {
        v35 = [v21 objectAtIndexedSubscript:++v34];
        [v71 addObject:v35];
      }
      while (v29 != v34);
    }
    else
    {
      [v25 popDebugGroup];
      [v25 endEncoding];
    }
    v38 = [v9 computeCommandEncoder];
    [v38 pushDebugGroup:@"pi::inward_fill_up"];
    [v38 setComputePipelineState:v69];
    if (v14)
    {
      do
      {
        uint64_t v39 = v14 - 1;
        v40 = [v21 objectAtIndexedSubscript:v14 - 1];
        [v38 setTexture:v40 atIndex:0];
        v41 = [v21 objectAtIndexedSubscript:v14];
        [v38 setTexture:v41 atIndex:1];
        v42 = [v71 objectAtIndexedSubscript:v39];
        [v38 setTexture:v42 atIndex:2];
        uint64_t v43 = [v42 width];
        uint64_t v44 = [v42 height];
        uint64_t v45 = [v42 depth];
        memset(buf, 0, 24);
        *(void *)&long long v76 = v43;
        *((void *)&v76 + 1) = v44;
        uint64_t v77 = v45;
        [MEMORY[0x1E4F7A410] groupSizeForImageSize:&v76 pipelineState:v69];
        long long v76 = 0uLL;
        uint64_t v77 = 0;
        long long v74 = *(_OWORD *)buf;
        uint64_t v75 = *(void *)&buf[16];
        *(void *)&long long v72 = v43;
        *((void *)&v72 + 1) = v44;
        uint64_t v73 = v45;
        [MEMORY[0x1E4F7A410] gridSizeForThreadGroupSize:&v74 imageSize:&v72];
        long long v74 = v76;
        uint64_t v75 = v77;
        long long v72 = *(_OWORD *)buf;
        uint64_t v73 = *(void *)&buf[16];
        [v38 dispatchThreadgroups:&v74 threadsPerThreadgroup:&v72];

        uint64_t v14 = v39;
      }
      while (v39);
    }
    [v38 popDebugGroup];
    [v38 endEncoding];

    id v10 = v66;
    id v9 = v67;
    v5 = v64;
    v4 = v65;
    v36 = v68;
    self = v69;
    v6 = v70;
    v20 = v63;
    goto LABEL_21;
  }
  if (*MEMORY[0x1E4F7A750] != -1) {
    goto LABEL_38;
  }
LABEL_15:
  v36 = v68;
  v37 = *MEMORY[0x1E4F7A758];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F7A758], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    *(void *)&buf[4] = v20;
    _os_log_error_impl(&dword_1A9680000, v37, OS_LOG_TYPE_ERROR, "Failed to load compute pipeline: %@", buf, 0xCu);
  }
LABEL_21:
}

+ (void)fillSourceTexture:(id)a3 intoDestinationTexture:(id)a4 withCommandBuffer:(id)a5
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v43 = a3;
  id v7 = a4;
  id v8 = a5;
  if (!v43)
  {
    v12 = NUAssertLogger_1087();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "inputTexture != nil");
      v13 = (const void **)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      uint64_t v45 = v13;
      _os_log_error_impl(&dword_1A9680000, v12, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    uint64_t v14 = (const void **)MEMORY[0x1E4F7A308];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    v16 = NUAssertLogger_1087();
    BOOL v17 = os_log_type_enabled(v16, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v17)
      {
        v30 = dispatch_get_specific(*v14);
        uint64_t v31 = (void *)MEMORY[0x1E4F29060];
        id v32 = v30;
        uint64_t v14 = [v31 callStackSymbols];
        uint64_t v33 = [v14 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        uint64_t v45 = (const void **)v30;
        __int16 v46 = 2114;
        v47 = v33;
        _os_log_error_impl(&dword_1A9680000, v16, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v17)
    {
      v18 = [MEMORY[0x1E4F29060] callStackSymbols];
      uint64_t v14 = [v18 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      uint64_t v45 = v14;
      _os_log_error_impl(&dword_1A9680000, v16, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    int v22 = _NUAssertFailHandler();
    goto LABEL_25;
  }
  if (!v7)
  {
    v19 = NUAssertLogger_1087();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "outputTexture != nil");
      v20 = (const void **)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      uint64_t v45 = v20;
      _os_log_error_impl(&dword_1A9680000, v19, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    uint64_t v14 = (const void **)MEMORY[0x1E4F7A308];
    v21 = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    v16 = NUAssertLogger_1087();
    int v22 = os_log_type_enabled(v16, OS_LOG_TYPE_ERROR);
    if (!v21)
    {
      if (v22)
      {
        v23 = [MEMORY[0x1E4F29060] callStackSymbols];
        uint64_t v14 = [v23 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543362;
        uint64_t v45 = v14;
        _os_log_error_impl(&dword_1A9680000, v16, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
      }
LABEL_27:

      int v27 = _NUAssertFailHandler();
      goto LABEL_28;
    }
LABEL_25:
    if (v22)
    {
      uint64_t v34 = dispatch_get_specific(*v14);
      v35 = (void *)MEMORY[0x1E4F29060];
      id v36 = v34;
      uint64_t v14 = [v35 callStackSymbols];
      v37 = [v14 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543618;
      uint64_t v45 = (const void **)v34;
      __int16 v46 = 2114;
      v47 = v37;
      _os_log_error_impl(&dword_1A9680000, v16, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
    }
    goto LABEL_27;
  }
  if (!v8)
  {
    v24 = NUAssertLogger_1087();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "commandBuffer != nil");
      v25 = (const void **)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      uint64_t v45 = v25;
      _os_log_error_impl(&dword_1A9680000, v24, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    uint64_t v14 = (const void **)MEMORY[0x1E4F7A308];
    uint64_t v26 = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    v16 = NUAssertLogger_1087();
    int v27 = os_log_type_enabled(v16, OS_LOG_TYPE_ERROR);
    if (!v26)
    {
      if (v27)
      {
        v28 = [MEMORY[0x1E4F29060] callStackSymbols];
        uint64_t v29 = [v28 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543362;
        uint64_t v45 = v29;
        _os_log_error_impl(&dword_1A9680000, v16, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
      }
      goto LABEL_30;
    }
LABEL_28:
    if (v27)
    {
      v38 = dispatch_get_specific(*v14);
      uint64_t v39 = (void *)MEMORY[0x1E4F29060];
      id v40 = v38;
      v41 = [v39 callStackSymbols];
      v42 = [v41 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543618;
      uint64_t v45 = (const void **)v38;
      __int16 v46 = 2114;
      v47 = v42;
      _os_log_error_impl(&dword_1A9680000, v16, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
    }
LABEL_30:

    _NUAssertFailHandler();
  }
  id v9 = [PIParallaxInwardFillKernel alloc];
  id v10 = [v8 device];
  v11 = [(NUComputeKernel *)v9 initWithDevice:v10];

  [(PIParallaxInwardFillKernel *)v11 setSourceTexture:v43];
  [(PIParallaxInwardFillKernel *)v11 encodeToCommandBuffer:v8 destinationTexture:v7];
}

@end