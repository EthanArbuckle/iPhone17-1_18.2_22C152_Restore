@interface NUImageExportFormatJPEG
- (NUImageExportFormatJPEG)init;
- (double)compressionQuality;
- (id)copyWithZone:(_NSZone *)a3;
- (id)fileType;
- (id)pixelFormat;
- (void)addImageDestinationOptionsToImageProperties:(id)a3;
- (void)setCompressionQuality:(double)a3;
@end

@implementation NUImageExportFormatJPEG

- (void)addImageDestinationOptionsToImageProperties:(id)a3
{
  uint64_t v3 = *MEMORY[0x1E4F2F430];
  v4 = NSNumber;
  double compressionQuality = self->_compressionQuality;
  id v6 = a3;
  id v7 = [v4 numberWithDouble:compressionQuality];
  [v6 setObject:v7 forKeyedSubscript:v3];
}

- (id)pixelFormat
{
  return +[NUPixelFormat RGBA8];
}

- (id)fileType
{
  return (id)[(id)*MEMORY[0x1E4F44410] identifier];
}

- (void)setCompressionQuality:(double)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  if (a3 < 0.0 || a3 > 1.0)
  {
    if (_NULogOnceToken != -1) {
      dispatch_once(&_NULogOnceToken, &__block_literal_global_5861);
    }
    id v6 = (void *)_NUAssertLogger;
    if (os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_DEFAULT))
    {
      id v7 = NSString;
      v8 = v6;
      v9 = [v7 stringWithFormat:@"Compression quality should be between 0 and 1"];
      *(_DWORD *)v26 = 138543362;
      *(void *)&v26[4] = v9;
      _os_log_impl(&dword_1A9892000, v8, OS_LOG_TYPE_DEFAULT, "Continue: %{public}@", v26, 0xCu);

      uint64_t v10 = _NULogOnceToken;
      if (dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey))
      {
        if (v10 != -1) {
          dispatch_once(&_NULogOnceToken, &__block_literal_global_5861);
        }
LABEL_13:
        v11 = (void *)_NUAssertLogger;
        if (os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR))
        {
          specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
          v17 = (void *)MEMORY[0x1E4F29060];
          id v18 = specific;
          v19 = v11;
          v20 = [v17 callStackSymbols];
          v21 = [v20 componentsJoinedByString:@"\n"];
          *(_DWORD *)v26 = 138543618;
          *(void *)&v26[4] = specific;
          __int16 v27 = 2114;
          v28 = v21;
          _os_log_error_impl(&dword_1A9892000, v19, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", v26, 0x16u);

LABEL_21:
          goto LABEL_18;
        }
        goto LABEL_18;
      }
      if (v10 != -1) {
        dispatch_once(&_NULogOnceToken, &__block_literal_global_5861);
      }
    }
    else if (dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey))
    {
      goto LABEL_13;
    }
    v22 = (void *)_NUAssertLogger;
    if (os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR))
    {
      v23 = (void *)MEMORY[0x1E4F29060];
      v19 = v22;
      v24 = [v23 callStackSymbols];
      v25 = [v24 componentsJoinedByString:@"\n"];
      *(_DWORD *)v26 = 138543362;
      *(void *)&v26[4] = v25;
      _os_log_error_impl(&dword_1A9892000, v19, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", v26, 0xCu);

      goto LABEL_21;
    }
LABEL_18:
    _NUAssertContinueHandler((uint64_t)"-[NUImageExportFormatJPEG setCompressionQuality:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Render/NUImageExportFormat.m", 139, @"Compression quality should be between 0 and 1", v12, v13, v14, v15, *(uint64_t *)v26);
  }
  self->_double compressionQuality = fmax(fmin(a3, 1.0), 0.0);
}

- (double)compressionQuality
{
  return self->_compressionQuality;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = (id)[(id)objc_opt_class() allocWithZone:a3];
  if (result) {
    *((void *)result + 1) = *(void *)&self->_compressionQuality;
  }
  return result;
}

- (NUImageExportFormatJPEG)init
{
  v3.receiver = self;
  v3.super_class = (Class)NUImageExportFormatJPEG;
  id result = [(NUImageExportFormatJPEG *)&v3 init];
  result->_double compressionQuality = 0.75;
  return result;
}

@end