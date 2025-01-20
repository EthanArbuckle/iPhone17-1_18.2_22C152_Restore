@interface PIAutoLoopExportRequest
- (NSString)destinationUTI;
- (NSURL)destinationLongExposureURL;
- (NSURL)destinationMaskURL;
- (NUColorSpace)outputColorSpace;
- (PIAutoLoopExportRequest)initWithComposition:(id)a3 destinationURL:(id)a4;
- (PIAutoLoopExportRequest)initWithComposition:(id)a3 stabilizedVideoURL:(id)a4 longExposureDestinationURL:(id)a5 maskDestinationURL:(id)a6 destinationUTI:(id)a7;
- (PIAutoLoopExportRequest)initWithRequest:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)newRenderJob;
- (int64_t)mediaComponentType;
@end

@implementation PIAutoLoopExportRequest

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_destinationMaskURL, 0);
  objc_storeStrong((id *)&self->_destinationLongExposureURL, 0);
  objc_storeStrong((id *)&self->_destinationUTI, 0);
}

- (NSURL)destinationMaskURL
{
  return (NSURL *)objc_getProperty(self, a2, 224, 1);
}

- (NSURL)destinationLongExposureURL
{
  return (NSURL *)objc_getProperty(self, a2, 216, 1);
}

- (NSString)destinationUTI
{
  return (NSString *)objc_getProperty(self, a2, 208, 1);
}

- (NUColorSpace)outputColorSpace
{
  v2 = [(NUVideoExportRequest *)self outputSettings];
  v3 = [v2 objectForKey:*MEMORY[0x1E4F16258]];

  if (!v3
    || ([MEMORY[0x1E4F7A400] colorSpaceFromVideoColorProperties:v3],
        (v4 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    v4 = [MEMORY[0x1E4F7A400] sRGBColorSpace];
  }

  return (NUColorSpace *)v4;
}

- (int64_t)mediaComponentType
{
  return 2;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)PIAutoLoopExportRequest;
  v4 = [(NUVideoExportRequest *)&v6 copyWithZone:a3];
  objc_storeStrong(v4 + 26, self->_destinationUTI);
  objc_storeStrong(v4 + 27, self->_destinationLongExposureURL);
  objc_storeStrong(v4 + 28, self->_destinationMaskURL);
  return v4;
}

- (id)newRenderJob
{
  v3 = [PIAutoLoopExportJob alloc];
  return [(PIAutoLoopExportJob *)v3 initWithAutoLoopExportRequest:self];
}

- (PIAutoLoopExportRequest)initWithComposition:(id)a3 stabilizedVideoURL:(id)a4 longExposureDestinationURL:(id)a5 maskDestinationURL:(id)a6 destinationUTI:(id)a7
{
  v22.receiver = self;
  v22.super_class = (Class)PIAutoLoopExportRequest;
  id v11 = a7;
  id v12 = a6;
  id v13 = a5;
  v14 = [(NUExportRequest *)&v22 initWithComposition:a3 destinationURL:a4];
  uint64_t v15 = objc_msgSend(v11, "copy", v22.receiver, v22.super_class);

  destinationUTI = v14->_destinationUTI;
  v14->_destinationUTI = (NSString *)v15;

  uint64_t v17 = [v13 copy];
  destinationLongExposureURL = v14->_destinationLongExposureURL;
  v14->_destinationLongExposureURL = (NSURL *)v17;

  uint64_t v19 = [v12 copy];
  destinationMaskURL = v14->_destinationMaskURL;
  v14->_destinationMaskURL = (NSURL *)v19;

  return v14;
}

- (PIAutoLoopExportRequest)initWithComposition:(id)a3 destinationURL:(id)a4
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = (uint64_t *)MEMORY[0x1E4F7A750];
  if (*MEMORY[0x1E4F7A750] != -1) {
    goto LABEL_15;
  }
  while (1)
  {
    v9 = (os_log_t *)MEMORY[0x1E4F7A748];
    v10 = (void *)*MEMORY[0x1E4F7A748];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F7A748], OS_LOG_TYPE_ERROR))
    {
      id v11 = NSString;
      id v12 = v10;
      id v13 = (objc_class *)objc_opt_class();
      v14 = NSStringFromClass(v13);
      uint64_t v15 = NSStringFromSelector(a2);
      v16 = [v11 stringWithFormat:@"Initializer not available: -[%@ %@], use designated initializer instead.", v14, v15];
      *(_DWORD *)buf = 138543362;
      v31 = v16;
      _os_log_error_impl(&dword_1A9680000, v12, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

      uint64_t v17 = *v8;
      if (!dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]))
      {
        if (v17 != -1) {
          dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_2303);
        }
LABEL_7:
        os_log_t v18 = *v9;
        if (os_log_type_enabled(*v9, OS_LOG_TYPE_ERROR))
        {
          uint64_t v19 = (void *)MEMORY[0x1E4F29060];
          v20 = v18;
          v21 = [v19 callStackSymbols];
          objc_super v22 = [v21 componentsJoinedByString:@"\n"];
          *(_DWORD *)buf = 138543362;
          v31 = v22;
          _os_log_error_impl(&dword_1A9680000, v20, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

LABEL_13:
          goto LABEL_14;
        }
        goto LABEL_14;
      }
      if (v17 != -1) {
        dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_2303);
      }
    }
    else if (!dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]))
    {
      goto LABEL_7;
    }
    os_log_t v23 = *v9;
    if (os_log_type_enabled(*v9, OS_LOG_TYPE_ERROR))
    {
      specific = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
      v25 = (void *)MEMORY[0x1E4F29060];
      id v26 = specific;
      v20 = v23;
      v27 = [v25 callStackSymbols];
      v28 = [v27 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543618;
      v31 = specific;
      __int16 v32 = 2114;
      v33 = v28;
      _os_log_error_impl(&dword_1A9680000, v20, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      goto LABEL_13;
    }
LABEL_14:
    v29 = (objc_class *)objc_opt_class();
    NSStringFromClass(v29);
    objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    objc_claimAutoreleasedReturnValue();
    _NUAssertFailHandler();
LABEL_15:
    dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_2303);
  }
}

- (PIAutoLoopExportRequest)initWithRequest:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = (uint64_t *)MEMORY[0x1E4F7A750];
  if (*MEMORY[0x1E4F7A750] != -1) {
    goto LABEL_15;
  }
  while (1)
  {
    id v6 = (os_log_t *)MEMORY[0x1E4F7A748];
    id v7 = (void *)*MEMORY[0x1E4F7A748];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F7A748], OS_LOG_TYPE_ERROR))
    {
      v8 = NSString;
      v9 = v7;
      v10 = (objc_class *)objc_opt_class();
      id v11 = NSStringFromClass(v10);
      id v12 = NSStringFromSelector(a2);
      id v13 = [v8 stringWithFormat:@"Initializer not available: -[%@ %@], use designated initializer instead.", v11, v12];
      *(_DWORD *)buf = 138543362;
      v28 = v13;
      _os_log_error_impl(&dword_1A9680000, v9, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

      uint64_t v14 = *v5;
      if (!dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]))
      {
        if (v14 != -1) {
          dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_2303);
        }
LABEL_7:
        os_log_t v15 = *v6;
        if (os_log_type_enabled(*v6, OS_LOG_TYPE_ERROR))
        {
          v16 = (void *)MEMORY[0x1E4F29060];
          uint64_t v17 = v15;
          os_log_t v18 = [v16 callStackSymbols];
          uint64_t v19 = [v18 componentsJoinedByString:@"\n"];
          *(_DWORD *)buf = 138543362;
          v28 = v19;
          _os_log_error_impl(&dword_1A9680000, v17, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

LABEL_13:
          goto LABEL_14;
        }
        goto LABEL_14;
      }
      if (v14 != -1) {
        dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_2303);
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
      objc_super v22 = (void *)MEMORY[0x1E4F29060];
      id v23 = specific;
      uint64_t v17 = v20;
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
    id v26 = (objc_class *)objc_opt_class();
    NSStringFromClass(v26);
    objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    objc_claimAutoreleasedReturnValue();
    _NUAssertFailHandler();
LABEL_15:
    dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_2303);
  }
}

@end