@interface _PIParallaxRenderBuffer
- ($0AC6E346AE4835514AAA8AC86D8F4844)size;
- (CIRenderInfo)renderInfo;
- (CIRenderTask)renderTask;
- (NUColorSpace)colorSpace;
- (NUImageBuffer)pixelBuffer;
- (NUPixelFormat)format;
- (_PIParallaxRenderBuffer)initWithPixelBuffer:(id)a3 renderTask:(id)a4;
- (__CVBuffer)CVPixelBuffer;
@end

@implementation _PIParallaxRenderBuffer

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_renderInfo, 0);
  objc_storeStrong((id *)&self->_renderTask, 0);
  objc_storeStrong((id *)&self->_pixelBuffer, 0);
}

- (CIRenderInfo)renderInfo
{
  return self->_renderInfo;
}

- (CIRenderTask)renderTask
{
  return self->_renderTask;
}

- (NUImageBuffer)pixelBuffer
{
  return self->_pixelBuffer;
}

- (__CVBuffer)CVPixelBuffer
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  renderTask = self->_renderTask;
  id v12 = 0;
  v4 = [(CIRenderTask *)renderTask waitUntilCompletedAndReturnError:&v12];
  id v5 = v12;
  renderInfo = self->_renderInfo;
  self->_renderInfo = v4;

  if (self->_renderInfo) {
    BOOL v7 = v5 == 0;
  }
  else {
    BOOL v7 = 0;
  }
  if (!v7)
  {
    if (*MEMORY[0x1E4F7A750] != -1) {
      dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_19344);
    }
    v8 = *MEMORY[0x1E4F7A758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F7A758], OS_LOG_TYPE_ERROR))
    {
      v11 = self->_renderTask;
      *(_DWORD *)buf = 138543618;
      v14 = v11;
      __int16 v15 = 2114;
      id v16 = v5;
      _os_log_error_impl(&dword_1A9680000, v8, OS_LOG_TYPE_ERROR, "Failed to render %{public}@, error: %{public}@", buf, 0x16u);
    }
  }
  v9 = (__CVBuffer *)[(NUImageBuffer *)self->_pixelBuffer CVPixelBuffer];

  return v9;
}

- (NUPixelFormat)format
{
  return (NUPixelFormat *)[(NUImageBuffer *)self->_pixelBuffer format];
}

- (NUColorSpace)colorSpace
{
  return (NUColorSpace *)[(NUImageBuffer *)self->_pixelBuffer colorSpace];
}

- ($0AC6E346AE4835514AAA8AC86D8F4844)size
{
  int64_t v2 = [(NUImageBuffer *)self->_pixelBuffer size];
  result.var1 = v3;
  result.var0 = v2;
  return result;
}

- (_PIParallaxRenderBuffer)initWithPixelBuffer:(id)a3 renderTask:(id)a4
{
  v6 = (NUImageBuffer *)a3;
  BOOL v7 = (CIRenderTask *)a4;
  v13.receiver = self;
  v13.super_class = (Class)_PIParallaxRenderBuffer;
  v8 = [(_PIParallaxRenderBuffer *)&v13 init];
  pixelBuffer = v8->_pixelBuffer;
  v8->_pixelBuffer = v6;
  v10 = v6;

  renderTask = v8->_renderTask;
  v8->_renderTask = v7;

  return v8;
}

@end