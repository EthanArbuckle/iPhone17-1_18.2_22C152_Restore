@interface PICombineRGBKernel
+ (void)combineRGBTextures:(id)a3 intoDestinationTexture:(id)a4 withCommandBuffer:(id)a5;
- (MTLTexture)blueTexture;
- (MTLTexture)greenTexture;
- (MTLTexture)redTexture;
- (void)encodeToCommandBuffer:(id)a3 destinationTexture:(id)a4;
- (void)setBlueTexture:(id)a3;
- (void)setGreenTexture:(id)a3;
- (void)setRedTexture:(id)a3;
@end

@implementation PICombineRGBKernel

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_blueTexture, 0);
  objc_storeStrong((id *)&self->_greenTexture, 0);
  objc_storeStrong((id *)&self->_redTexture, 0);
}

- (void)setBlueTexture:(id)a3
{
}

- (MTLTexture)blueTexture
{
  return self->_blueTexture;
}

- (void)setGreenTexture:(id)a3
{
}

- (MTLTexture)greenTexture
{
  return self->_greenTexture;
}

- (void)setRedTexture:(id)a3
{
}

- (MTLTexture)redTexture
{
  return self->_redTexture;
}

- (void)encodeToCommandBuffer:(id)a3 destinationTexture:(id)a4
{
  uint64_t v59 = *MEMORY[0x1E4F143B8];
  v9 = a3;
  id specific = a4;
  uint64_t v11 = [(PICombineRGBKernel *)self redTexture];
  if (!v11)
  {
    v34 = NUAssertLogger_5247();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
    {
      v35 = [NSString stringWithFormat:@"Missing red input texture"];
      *(_DWORD *)buf = 138543362;
      *(void *)&buf[4] = v35;
      _os_log_error_impl(&dword_1A9680000, v34, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    v12 = (const void **)MEMORY[0x1E4F7A308];
    id specific = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    v9 = NUAssertLogger_5247();
    int v36 = os_log_type_enabled(v9, OS_LOG_TYPE_ERROR);
    if (!specific)
    {
      if (v36)
      {
        id specific = [MEMORY[0x1E4F29060] callStackSymbols];
        v12 = [specific componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543362;
        *(void *)&buf[4] = v12;
        _os_log_error_impl(&dword_1A9680000, v9, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
      }
      goto LABEL_57;
    }
LABEL_55:
    if (v36)
    {
      id specific = dispatch_get_specific(*v12);
      v46 = (void *)MEMORY[0x1E4F29060];
      id v4 = specific;
      v12 = [v46 callStackSymbols];
      v5 = [v12 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543618;
      *(void *)&buf[4] = specific;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v5;
      _os_log_error_impl(&dword_1A9680000, v9, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
    }
LABEL_57:

    int v39 = _NUAssertFailHandler();
    goto LABEL_58;
  }
  v12 = (const void **)v11;
  uint64_t v13 = [(PICombineRGBKernel *)self greenTexture];
  if (!v13)
  {
    v37 = NUAssertLogger_5247();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
    {
      v38 = [NSString stringWithFormat:@"Missing green input texture"];
      *(_DWORD *)buf = 138543362;
      *(void *)&buf[4] = v38;
      _os_log_error_impl(&dword_1A9680000, v37, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    v12 = (const void **)MEMORY[0x1E4F7A308];
    id specific = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    v9 = NUAssertLogger_5247();
    int v39 = os_log_type_enabled(v9, OS_LOG_TYPE_ERROR);
    if (!specific)
    {
      if (v39)
      {
        id specific = [MEMORY[0x1E4F29060] callStackSymbols];
        v12 = [specific componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543362;
        *(void *)&buf[4] = v12;
        _os_log_error_impl(&dword_1A9680000, v9, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
      }
      goto LABEL_60;
    }
LABEL_58:
    if (v39)
    {
      id specific = dispatch_get_specific(*v12);
      v47 = (void *)MEMORY[0x1E4F29060];
      id v4 = specific;
      v12 = [v47 callStackSymbols];
      v5 = [v12 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543618;
      *(void *)&buf[4] = specific;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v5;
      _os_log_error_impl(&dword_1A9680000, v9, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
    }
LABEL_60:

    int v42 = _NUAssertFailHandler();
    goto LABEL_61;
  }
  id v4 = (id)v13;
  uint64_t v14 = [(PICombineRGBKernel *)self blueTexture];
  if (!v14)
  {
    v40 = NUAssertLogger_5247();
    if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
    {
      v41 = [NSString stringWithFormat:@"Missing blue input texture"];
      *(_DWORD *)buf = 138543362;
      *(void *)&buf[4] = v41;
      _os_log_error_impl(&dword_1A9680000, v40, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    v12 = (const void **)MEMORY[0x1E4F7A308];
    id specific = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    v9 = NUAssertLogger_5247();
    int v42 = os_log_type_enabled(v9, OS_LOG_TYPE_ERROR);
    if (!specific)
    {
      if (v42)
      {
        id specific = [MEMORY[0x1E4F29060] callStackSymbols];
        v12 = [specific componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543362;
        *(void *)&buf[4] = v12;
        _os_log_error_impl(&dword_1A9680000, v9, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
      }
      goto LABEL_63;
    }
LABEL_61:
    if (v42)
    {
      id specific = dispatch_get_specific(*v12);
      v48 = (void *)MEMORY[0x1E4F29060];
      id v4 = specific;
      v12 = [v48 callStackSymbols];
      v5 = [v12 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543618;
      *(void *)&buf[4] = specific;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v5;
      _os_log_error_impl(&dword_1A9680000, v9, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
    }
LABEL_63:

    _NUAssertFailHandler();
LABEL_64:
    dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_277);
    goto LABEL_13;
  }
  v5 = (void *)v14;
  id v6 = (id)[v12 width];
  if (v6 != (id)[specific width]
    || (id v6 = (id)[v12 width], v6 != (id)objc_msgSend(specific, "width")))
  {
    v25 = NUAssertLogger_5247();
    id v4 = &unk_1A980A000;
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      v26 = [NSString stringWithFormat:@"Input size mismatch"];
      *(_DWORD *)buf = 138543362;
      *(void *)&buf[4] = v26;
      _os_log_error_impl(&dword_1A9680000, v25, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    v12 = (const void **)MEMORY[0x1E4F7A308];
    id specific = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    v9 = NUAssertLogger_5247();
    BOOL v27 = os_log_type_enabled(v9, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v27)
      {
        id specific = dispatch_get_specific(*v12);
        v43 = (void *)MEMORY[0x1E4F29060];
        id v4 = specific;
        v12 = [v43 callStackSymbols];
        v5 = [v12 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        *(void *)&buf[4] = specific;
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v5;
        _os_log_error_impl(&dword_1A9680000, v9, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v27)
    {
      id specific = [MEMORY[0x1E4F29060] callStackSymbols];
      v12 = [specific componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      *(void *)&buf[4] = v12;
      _os_log_error_impl(&dword_1A9680000, v9, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    int v30 = _NUAssertFailHandler();
    goto LABEL_49;
  }
  id v6 = (id)[v4 width];
  if (v6 != (id)[specific width]
    || (id v6 = (id)[v4 width], v6 != (id)objc_msgSend(specific, "width")))
  {
    v28 = NUAssertLogger_5247();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      v29 = [NSString stringWithFormat:@"Input size mismatch"];
      *(_DWORD *)buf = 138543362;
      *(void *)&buf[4] = v29;
      _os_log_error_impl(&dword_1A9680000, v28, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    v12 = (const void **)MEMORY[0x1E4F7A308];
    id specific = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    v9 = NUAssertLogger_5247();
    int v30 = os_log_type_enabled(v9, OS_LOG_TYPE_ERROR);
    if (!specific)
    {
      if (v30)
      {
        id specific = [MEMORY[0x1E4F29060] callStackSymbols];
        v12 = [specific componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543362;
        *(void *)&buf[4] = v12;
        _os_log_error_impl(&dword_1A9680000, v9, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
      }
LABEL_51:

      int v33 = _NUAssertFailHandler();
      goto LABEL_52;
    }
LABEL_49:
    if (v30)
    {
      id specific = dispatch_get_specific(*v12);
      v44 = (void *)MEMORY[0x1E4F29060];
      id v4 = specific;
      v12 = [v44 callStackSymbols];
      v5 = [v12 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543618;
      *(void *)&buf[4] = specific;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v5;
      _os_log_error_impl(&dword_1A9680000, v9, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
    }
    goto LABEL_51;
  }
  id v6 = (id)[v5 width];
  if (v6 != (id)[specific width]
    || (id v6 = (id)[v5 width], v6 != (id)objc_msgSend(specific, "width")))
  {
    v31 = NUAssertLogger_5247();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    {
      v32 = [NSString stringWithFormat:@"Input size mismatch"];
      *(_DWORD *)buf = 138543362;
      *(void *)&buf[4] = v32;
      _os_log_error_impl(&dword_1A9680000, v31, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    v12 = (const void **)MEMORY[0x1E4F7A308];
    id specific = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    v9 = NUAssertLogger_5247();
    int v33 = os_log_type_enabled(v9, OS_LOG_TYPE_ERROR);
    if (!specific)
    {
      if (v33)
      {
        id specific = [MEMORY[0x1E4F29060] callStackSymbols];
        v12 = [specific componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543362;
        *(void *)&buf[4] = v12;
        _os_log_error_impl(&dword_1A9680000, v9, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
      }
LABEL_54:

      int v36 = _NUAssertFailHandler();
      goto LABEL_55;
    }
LABEL_52:
    if (v33)
    {
      id specific = dispatch_get_specific(*v12);
      v45 = (void *)MEMORY[0x1E4F29060];
      id v4 = specific;
      v12 = [v45 callStackSymbols];
      v5 = [v12 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543618;
      *(void *)&buf[4] = specific;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v5;
      _os_log_error_impl(&dword_1A9680000, v9, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
    }
    goto LABEL_54;
  }
  v15 = objc_opt_class();
  v16 = [(NUComputeKernel *)self device];
  id v57 = 0;
  self = [v15 pipelineStateForFunctionWithName:@"pi::combineRGB" device:v16 error:&v57];
  id v6 = v57;

  if (self)
  {
    v17 = [v9 computeCommandEncoder];
    [v17 pushDebugGroup:@"pi::combineRGB"];
    [v17 setComputePipelineState:self];
    [v17 setTexture:v12 atIndex:0];
    [v17 setTexture:v4 atIndex:1];
    [v17 setTexture:v5 atIndex:2];
    [v17 setTexture:specific atIndex:3];
    v56[0] = [specific width];
    v56[1] = [specific height];
    [v17 setBytes:v56 length:4 atIndex:0];
    uint64_t v18 = [specific width];
    uint64_t v19 = [specific height];
    v49 = v5;
    id v20 = v4;
    v21 = v12;
    v22 = v9;
    uint64_t v23 = [specific depth];
    memset(buf, 0, sizeof(buf));
    *(void *)&long long v54 = v18;
    *((void *)&v54 + 1) = v19;
    uint64_t v55 = v23;
    [MEMORY[0x1E4F7A410] groupSizeForImageSize:&v54 pipelineState:self];
    long long v54 = 0uLL;
    uint64_t v55 = 0;
    long long v52 = *(_OWORD *)buf;
    uint64_t v53 = *(void *)&buf[16];
    *(void *)&long long v50 = v18;
    *((void *)&v50 + 1) = v19;
    uint64_t v51 = v23;
    v9 = v22;
    v12 = v21;
    id v4 = v20;
    v5 = v49;
    [MEMORY[0x1E4F7A410] gridSizeForThreadGroupSize:&v52 imageSize:&v50];
    long long v52 = v54;
    uint64_t v53 = v55;
    long long v50 = *(_OWORD *)buf;
    uint64_t v51 = *(void *)&buf[16];
    [v17 dispatchThreadgroups:&v52 threadsPerThreadgroup:&v50];
    [v17 popDebugGroup];
    [v17 endEncoding];

    goto LABEL_15;
  }
  if (*MEMORY[0x1E4F7A750] != -1) {
    goto LABEL_64;
  }
LABEL_13:
  v24 = *MEMORY[0x1E4F7A758];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F7A758], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    *(void *)&buf[4] = v6;
    _os_log_error_impl(&dword_1A9680000, v24, OS_LOG_TYPE_ERROR, "Failed to load compute pipeline: %@", buf, 0xCu);
  }
LABEL_15:
}

+ (void)combineRGBTextures:(id)a3 intoDestinationTexture:(id)a4 withCommandBuffer:(id)a5
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v46 = a3;
  id v7 = a4;
  id v8 = a5;
  if ([v46 count] != 3)
  {
    v15 = NUAssertLogger_5247();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "srcTextures.count == 3");
      v16 = (const void **)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v48 = v16;
      _os_log_error_impl(&dword_1A9680000, v15, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    v17 = (const void **)MEMORY[0x1E4F7A308];
    id specific = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    uint64_t v19 = NUAssertLogger_5247();
    BOOL v20 = os_log_type_enabled(v19, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v20)
      {
        int v33 = dispatch_get_specific(*v17);
        v34 = (void *)MEMORY[0x1E4F29060];
        id v35 = v33;
        v17 = [v34 callStackSymbols];
        int v36 = [v17 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v48 = (const void **)v33;
        __int16 v49 = 2114;
        long long v50 = v36;
        _os_log_error_impl(&dword_1A9680000, v19, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v20)
    {
      v21 = [MEMORY[0x1E4F29060] callStackSymbols];
      v17 = [v21 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v48 = v17;
      _os_log_error_impl(&dword_1A9680000, v19, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    int v25 = _NUAssertFailHandler();
    goto LABEL_25;
  }
  if (!v7)
  {
    v22 = NUAssertLogger_5247();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "outputTexture != nil");
      uint64_t v23 = (const void **)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v48 = v23;
      _os_log_error_impl(&dword_1A9680000, v22, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    v17 = (const void **)MEMORY[0x1E4F7A308];
    v24 = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    uint64_t v19 = NUAssertLogger_5247();
    int v25 = os_log_type_enabled(v19, OS_LOG_TYPE_ERROR);
    if (!v24)
    {
      if (v25)
      {
        v26 = [MEMORY[0x1E4F29060] callStackSymbols];
        v17 = [v26 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543362;
        v48 = v17;
        _os_log_error_impl(&dword_1A9680000, v19, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
      }
LABEL_27:

      int v30 = _NUAssertFailHandler();
      goto LABEL_28;
    }
LABEL_25:
    if (v25)
    {
      v37 = dispatch_get_specific(*v17);
      v38 = (void *)MEMORY[0x1E4F29060];
      id v39 = v37;
      v17 = [v38 callStackSymbols];
      v40 = [v17 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543618;
      v48 = (const void **)v37;
      __int16 v49 = 2114;
      long long v50 = v40;
      _os_log_error_impl(&dword_1A9680000, v19, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
    }
    goto LABEL_27;
  }
  if (!v8)
  {
    BOOL v27 = NUAssertLogger_5247();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "commandBuffer != nil");
      v28 = (const void **)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v48 = v28;
      _os_log_error_impl(&dword_1A9680000, v27, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    v17 = (const void **)MEMORY[0x1E4F7A308];
    v29 = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    uint64_t v19 = NUAssertLogger_5247();
    int v30 = os_log_type_enabled(v19, OS_LOG_TYPE_ERROR);
    if (!v29)
    {
      if (v30)
      {
        v31 = [MEMORY[0x1E4F29060] callStackSymbols];
        v32 = [v31 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543362;
        v48 = v32;
        _os_log_error_impl(&dword_1A9680000, v19, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
      }
      goto LABEL_30;
    }
LABEL_28:
    if (v30)
    {
      v41 = dispatch_get_specific(*v17);
      int v42 = (void *)MEMORY[0x1E4F29060];
      id v43 = v41;
      v44 = [v42 callStackSymbols];
      v45 = [v44 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543618;
      v48 = (const void **)v41;
      __int16 v49 = 2114;
      long long v50 = v45;
      _os_log_error_impl(&dword_1A9680000, v19, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
    }
LABEL_30:

    _NUAssertFailHandler();
  }
  v9 = [PICombineRGBKernel alloc];
  v10 = [v8 device];
  uint64_t v11 = [(NUComputeKernel *)v9 initWithDevice:v10];

  v12 = [v46 objectAtIndexedSubscript:0];
  [(PICombineRGBKernel *)v11 setRedTexture:v12];

  uint64_t v13 = [v46 objectAtIndexedSubscript:1];
  [(PICombineRGBKernel *)v11 setGreenTexture:v13];

  uint64_t v14 = [v46 objectAtIndexedSubscript:2];
  [(PICombineRGBKernel *)v11 setBlueTexture:v14];

  [(PICombineRGBKernel *)v11 encodeToCommandBuffer:v8 destinationTexture:v7];
}

@end