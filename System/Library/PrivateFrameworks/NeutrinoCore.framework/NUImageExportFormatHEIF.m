@interface NUImageExportFormatHEIF
- (BOOL)supportsHDR;
- (NUImageExportFormatHEIF)init;
- (NUImageExportFormatHEIF)initWithBitDepth:(int64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)fileType;
- (id)pixelFormat;
- (int64_t)bitDepth;
- (void)addImageDestinationOptionsToImageProperties:(id)a3;
- (void)setBitDepth:(int64_t)a3;
@end

@implementation NUImageExportFormatHEIF

- (void)setBitDepth:(int64_t)a3
{
  self->_bitDepth = a3;
}

- (int64_t)bitDepth
{
  return self->_bitDepth;
}

- (void)addImageDestinationOptionsToImageProperties:(id)a3
{
  v4 = NSNumber;
  id v5 = a3;
  objc_msgSend(v4, "numberWithInteger:", -[NUImageExportFormatHEIF bitDepth](self, "bitDepth"));
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  [v5 setObject:v6 forKeyedSubscript:*MEMORY[0x1E4F2F6B8]];
}

- (BOOL)supportsHDR
{
  return [(NUImageExportFormatHEIF *)self bitDepth] > 9;
}

- (id)pixelFormat
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  if ([(NUImageExportFormatHEIF *)self bitDepth] == 8)
  {
    v3 = +[NUPixelFormat RGBA8];
  }
  else
  {
    if ([(NUImageExportFormatHEIF *)self bitDepth] != 10)
    {
      id v5 = NUAssertLogger_5901();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        id v6 = objc_msgSend(NSString, "stringWithFormat:", @"Unsupported bit depth: %ld", -[NUImageExportFormatHEIF bitDepth](self, "bitDepth"));
        *(_DWORD *)buf = 138543362;
        v23 = v6;
        _os_log_error_impl(&dword_1A9892000, v5, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
      }
      specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
      v8 = NUAssertLogger_5901();
      BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_ERROR);
      if (specific)
      {
        if (v9)
        {
          v12 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
          v13 = (void *)MEMORY[0x1E4F29060];
          id v14 = v12;
          v15 = [v13 callStackSymbols];
          v16 = [v15 componentsJoinedByString:@"\n"];
          *(_DWORD *)buf = 138543618;
          v23 = v12;
          __int16 v24 = 2114;
          v25 = v16;
          _os_log_error_impl(&dword_1A9892000, v8, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
        }
      }
      else if (v9)
      {
        v10 = [MEMORY[0x1E4F29060] callStackSymbols];
        v11 = [v10 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543362;
        v23 = v11;
        _os_log_error_impl(&dword_1A9892000, v8, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
      }
      uint64_t v17 = [(NUImageExportFormatHEIF *)self bitDepth];
      _NUAssertFailHandler((uint64_t)"-[NUImageExportFormatHEIF pixelFormat]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Render/NUImageExportFormat.m", 199, @"Unsupported bit depth: %ld", v18, v19, v20, v21, v17);
    }
    v3 = +[NUPixelFormat X2RGB10];
  }

  return v3;
}

- (id)fileType
{
  return (id)[(id)*MEMORY[0x1E4F443E0] identifier];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = (id)[(id)objc_opt_class() allocWithZone:a3];
  *((void *)result + 1) = self->_bitDepth;
  return result;
}

- (NUImageExportFormatHEIF)initWithBitDepth:(int64_t)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  if ((a3 & 0xFFFFFFFFFFFFFFFDLL) != 8)
  {
    id v5 = NUAssertLogger_5901();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      id v6 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "bitDepth == 8 || bitDepth == 10");
      *(_DWORD *)buf = 138543362;
      v23 = v6;
      _os_log_error_impl(&dword_1A9892000, v5, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    v8 = NUAssertLogger_5901();
    BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v9)
      {
        v12 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v13 = (void *)MEMORY[0x1E4F29060];
        id v14 = v12;
        v15 = [v13 callStackSymbols];
        v16 = [v15 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v23 = v12;
        __int16 v24 = 2114;
        v25 = v16;
        _os_log_error_impl(&dword_1A9892000, v8, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v9)
    {
      v10 = [MEMORY[0x1E4F29060] callStackSymbols];
      v11 = [v10 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v23 = v11;
      _os_log_error_impl(&dword_1A9892000, v8, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUImageExportFormatHEIF initWithBitDepth:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Render/NUImageExportFormat.m", 169, @"Invalid parameter not satisfying: %s", v17, v18, v19, v20, (uint64_t)"bitDepth == 8 || bitDepth == 10");
  }
  v21.receiver = self;
  v21.super_class = (Class)NUImageExportFormatHEIF;
  id result = [(NUImageExportFormatHEIF *)&v21 init];
  result->_bitDepth = a3;
  return result;
}

- (NUImageExportFormatHEIF)init
{
  return [(NUImageExportFormatHEIF *)self initWithBitDepth:8];
}

@end