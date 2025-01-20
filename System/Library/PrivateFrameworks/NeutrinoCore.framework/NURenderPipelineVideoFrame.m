@interface NURenderPipelineVideoFrame
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)frameTime;
- (NURenderPipelineVideoFrame)initWithFrameTime:(id *)a3 pixelBuffer:(__CVBuffer *)a4;
- (__CVBuffer)pixelBuffer;
- (id)description;
- (void)dealloc;
@end

@implementation NURenderPipelineVideoFrame

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)frameTime
{
  objc_copyStruct(retstr, &self->_frameTime, 24, 1, 0);
  return result;
}

- (__CVBuffer)pixelBuffer
{
  return self->_pixelBuffer;
}

- (void)dealloc
{
  pixelBuffer = self->_pixelBuffer;
  if (pixelBuffer) {
    CFRelease(pixelBuffer);
  }
  v4.receiver = self;
  v4.super_class = (Class)NURenderPipelineVideoFrame;
  [(NURenderPipelineVideoFrame *)&v4 dealloc];
}

- (NURenderPipelineVideoFrame)initWithFrameTime:(id *)a3 pixelBuffer:(__CVBuffer *)a4
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  if (!a4)
  {
    v9 = NUAssertLogger_1297();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v10 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "pixelBuffer != nil");
      *(_DWORD *)buf = 138543362;
      v27 = v10;
      _os_log_error_impl(&dword_1A9892000, v9, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    v12 = NUAssertLogger_1297();
    BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v13)
      {
        v16 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v17 = (void *)MEMORY[0x1E4F29060];
        id v18 = v16;
        v19 = [v17 callStackSymbols];
        v20 = [v19 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v27 = v16;
        __int16 v28 = 2114;
        v29 = v20;
        _os_log_error_impl(&dword_1A9892000, v12, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v13)
    {
      v14 = [MEMORY[0x1E4F29060] callStackSymbols];
      v15 = [v14 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v27 = v15;
      _os_log_error_impl(&dword_1A9892000, v12, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NURenderPipelineVideoFrame initWithFrameTime:pixelBuffer:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderPipelineState.m", 358, @"Invalid parameter not satisfying: %s", v21, v22, v23, v24, (uint64_t)"pixelBuffer != nil");
  }
  v25.receiver = self;
  v25.super_class = (Class)NURenderPipelineVideoFrame;
  v6 = [(NURenderPipelineVideoFrame *)&v25 init];
  int64_t var3 = a3->var3;
  *(_OWORD *)&v6->_frameTime.value = *(_OWORD *)&a3->var0;
  v6->_frameTime.epoch = var3;
  v6->_pixelBuffer = a4;
  CFRetain(a4);
  return v6;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  CMTime time = (CMTime)self->_frameTime;
  v5 = (__CFString *)CMTimeCopyDescription((CFAllocatorRef)*MEMORY[0x1E4F1CF80], &time);
  v6 = [v3 stringWithFormat:@"<%@:%p frameTime: %@, pixelBuffer: %p>", v4, self, v5, self->_pixelBuffer];

  return v6;
}

@end