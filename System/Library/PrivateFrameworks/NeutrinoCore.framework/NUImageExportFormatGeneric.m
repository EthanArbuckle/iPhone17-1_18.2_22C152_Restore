@interface NUImageExportFormatGeneric
- (NSDictionary)options;
- (NSString)fileType;
- (NUImageExportFormatGeneric)initWithFileType:(id)a3;
- (NUPixelFormat)pixelFormat;
- (id)copyWithZone:(_NSZone *)a3;
- (void)addImageDestinationOptionsToImageProperties:(id)a3;
- (void)setFileType:(id)a3;
- (void)setOptions:(id)a3;
- (void)setPixelFormat:(id)a3;
@end

@implementation NUImageExportFormatGeneric

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_pixelFormat, 0);

  objc_storeStrong((id *)&self->_fileType, 0);
}

- (void)setOptions:(id)a3
{
}

- (NSDictionary)options
{
  return (NSDictionary *)objc_getProperty(self, a2, 24, 1);
}

- (void)setPixelFormat:(id)a3
{
}

- (NUPixelFormat)pixelFormat
{
  return (NUPixelFormat *)objc_getProperty(self, a2, 16, 1);
}

- (void)setFileType:(id)a3
{
}

- (NSString)fileType
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (void)addImageDestinationOptionsToImageProperties:(id)a3
{
  id v4 = a3;
  options = self->_options;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __74__NUImageExportFormatGeneric_addImageDestinationOptionsToImageProperties___block_invoke;
  v7[3] = &unk_1E5D94470;
  id v8 = v4;
  id v6 = v4;
  [(NSDictionary *)options enumerateKeysAndObjectsUsingBlock:v7];
}

uint64_t __74__NUImageExportFormatGeneric_addImageDestinationOptionsToImageProperties___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) setObject:a3 forKeyedSubscript:a2];
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = [(id)objc_opt_class() allocWithZone:a3];
  if (v4)
  {
    uint64_t v5 = [(NSString *)self->_fileType copy];
    id v6 = *(void **)(v4 + 8);
    *(void *)(v4 + 8) = v5;

    objc_storeStrong((id *)(v4 + 16), self->_pixelFormat);
    uint64_t v7 = [(NSDictionary *)self->_options copy];
    id v8 = *(void **)(v4 + 24);
    *(void *)(v4 + 24) = v7;
  }
  return (id)v4;
}

- (NUImageExportFormatGeneric)initWithFileType:(id)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = (NSString *)a3;
  if (!v4)
  {
    v14 = NUAssertLogger_5901();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      v15 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "fileType != nil");
      *(_DWORD *)buf = 138543362;
      v32 = v15;
      _os_log_error_impl(&dword_1A9892000, v14, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    v17 = NUAssertLogger_5901();
    BOOL v18 = os_log_type_enabled(v17, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v18)
      {
        v21 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v22 = (void *)MEMORY[0x1E4F29060];
        id v23 = v21;
        v24 = [v22 callStackSymbols];
        v25 = [v24 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v32 = v21;
        __int16 v33 = 2114;
        v34 = v25;
        _os_log_error_impl(&dword_1A9892000, v17, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v18)
    {
      v19 = [MEMORY[0x1E4F29060] callStackSymbols];
      v20 = [v19 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v32 = v20;
      _os_log_error_impl(&dword_1A9892000, v17, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUImageExportFormatGeneric initWithFileType:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Render/NUImageExportFormat.m", 71, @"Invalid parameter not satisfying: %s", v26, v27, v28, v29, (uint64_t)"fileType != nil");
  }
  uint64_t v5 = v4;
  v30.receiver = self;
  v30.super_class = (Class)NUImageExportFormatGeneric;
  id v6 = [(NUImageExportFormatGeneric *)&v30 init];
  fileType = v6->_fileType;
  v6->_fileType = v5;
  id v8 = v5;

  uint64_t v9 = +[NUPixelFormat RGBA8];
  pixelFormat = v6->_pixelFormat;
  v6->_pixelFormat = (NUPixelFormat *)v9;

  v11 = (NSDictionary *)objc_alloc_init(MEMORY[0x1E4F1C9E8]);
  options = v6->_options;
  v6->_options = v11;

  return v6;
}

@end