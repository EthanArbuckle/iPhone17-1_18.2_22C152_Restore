@interface SignpostRenderServerRenderInterval
- (BOOL)didSkipRender;
- (BOOL)hasOffScreenPassCount;
- (NSMutableArray)clientDrawableIntervals;
- (NSMutableArray)imageQueueSampleEvents;
- (NSNumber)cachingLayersRerenderCount;
- (NSNumber)fallbackShaderDrawCount;
- (NSNumber)synchronousMetalShaderCompileCount;
- (NSString)renderSkipReason;
- (SignpostRenderServerRenderInterval)initWithRenderServerRenderInterval:(id)a3;
- (int)renderServerPID;
- (unint64_t)displayRefreshIntervalMachContinuousTime;
- (unint64_t)renderServerTID;
- (unsigned)displayID;
- (unsigned)frameSeed;
- (unsigned)offScreenPassCount;
- (void)setClientDrawableIntervals:(id)a3;
- (void)setImageQueueSampleEvents:(id)a3;
@end

@implementation SignpostRenderServerRenderInterval

- (SignpostRenderServerRenderInterval)initWithRenderServerRenderInterval:(id)a3
{
  id v4 = a3;
  v43.receiver = self;
  v43.super_class = (Class)SignpostRenderServerRenderInterval;
  v5 = [(SignpostAnimationSubInterval *)&v43 initWithInterval:v4];
  if (v5)
  {
    v6 = [v4 beginEvent];
    v5->_renderServerPID = [v6 processID];

    v7 = [v4 beginEvent];
    v5->_renderServerTID = [v7 threadID];

    v5->_frameSeed = [v4 signpostId];
    v8 = [v4 beginEvent];
    v9 = [v8 _numberArgumentWithName:@"refresh_interval"];

    if (v9)
    {
      v5->_displayRefreshIntervalMachContinuousTime = [v9 unsignedLongLongValue];

      v10 = [v4 beginEvent];
      v11 = [v10 _numberArgumentWithName:@"display_id"];

      if (v11)
      {
        v5->_displayID = [v11 unsignedLongLongValue];

        v12 = [v4 endEvent];
        v13 = [v12 _numberArgumentWithName:@"pass_count"];

        if (v13)
        {
          v5->_hasOffScreenPassCount = 1;
          v5->_offScreenPassCount = [v13 unsignedIntegerValue];
        }
        v14 = [v4 endEvent];
        uint64_t v15 = [v14 _stringArgumentWithName:@"skipped_render_reason"];
        renderSkipReason = v5->_renderSkipReason;
        v5->_renderSkipReason = (NSString *)v15;

        v17 = [v4 endEvent];
        uint64_t v18 = [v17 _numberArgumentWithName:@"compile_count"];
        synchronousMetalShaderCompileCount = v5->_synchronousMetalShaderCompileCount;
        v5->_synchronousMetalShaderCompileCount = (NSNumber *)v18;

        v20 = [v4 endEvent];
        uint64_t v21 = [v20 _numberArgumentWithName:@"cache_misses"];
        cachingLayersRerenderCount = v5->_cachingLayersRerenderCount;
        v5->_cachingLayersRerenderCount = (NSNumber *)v21;

        v23 = [v4 endEvent];
        uint64_t v24 = [v23 _numberArgumentWithName:@"fallback_draws"];
        fallbackShaderDrawCount = v5->_fallbackShaderDrawCount;
        v5->_fallbackShaderDrawCount = (NSNumber *)v24;

        goto LABEL_7;
      }
      v27 = _signpost_debug_log();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG)) {
        -[SignpostRenderServerRenderInterval initWithRenderServerRenderInterval:](v27, v35, v36, v37, v38, v39, v40, v41);
      }
    }
    else
    {
      v27 = _signpost_debug_log();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG)) {
        -[SignpostRenderServerRenderInterval initWithRenderServerRenderInterval:](v27, v28, v29, v30, v31, v32, v33, v34);
      }
    }

    v26 = 0;
    goto LABEL_13;
  }
LABEL_7:
  v26 = v5;
LABEL_13:

  return v26;
}

- (unsigned)frameSeed
{
  return self->_frameSeed;
}

- (void)setImageQueueSampleEvents:(id)a3
{
}

- (NSMutableArray)imageQueueSampleEvents
{
  return self->_imageQueueSampleEvents;
}

- (BOOL)didSkipRender
{
  v2 = [(SignpostRenderServerRenderInterval *)self renderSkipReason];
  BOOL v3 = v2 != 0;

  return v3;
}

- (NSString)renderSkipReason
{
  return self->_renderSkipReason;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientDrawableIntervals, 0);
  objc_storeStrong((id *)&self->_imageQueueSampleEvents, 0);
  objc_storeStrong((id *)&self->_fallbackShaderDrawCount, 0);
  objc_storeStrong((id *)&self->_cachingLayersRerenderCount, 0);
  objc_storeStrong((id *)&self->_synchronousMetalShaderCompileCount, 0);

  objc_storeStrong((id *)&self->_renderSkipReason, 0);
}

- (unint64_t)displayRefreshIntervalMachContinuousTime
{
  return self->_displayRefreshIntervalMachContinuousTime;
}

- (unsigned)displayID
{
  return self->_displayID;
}

- (BOOL)hasOffScreenPassCount
{
  return self->_hasOffScreenPassCount;
}

- (unsigned)offScreenPassCount
{
  return self->_offScreenPassCount;
}

- (int)renderServerPID
{
  return self->_renderServerPID;
}

- (unint64_t)renderServerTID
{
  return self->_renderServerTID;
}

- (NSNumber)synchronousMetalShaderCompileCount
{
  return self->_synchronousMetalShaderCompileCount;
}

- (NSNumber)cachingLayersRerenderCount
{
  return self->_cachingLayersRerenderCount;
}

- (NSNumber)fallbackShaderDrawCount
{
  return self->_fallbackShaderDrawCount;
}

- (NSMutableArray)clientDrawableIntervals
{
  return self->_clientDrawableIntervals;
}

- (void)setClientDrawableIntervals:(id)a3
{
}

- (void)initWithRenderServerRenderInterval:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithRenderServerRenderInterval:(uint64_t)a3 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end