@interface SignpostFrameLatencyInterval
- (NSSet)contributingPids;
- (SignpostFrameLatencyInterval)initWithFrameLatencyInterval:(id)a3 isLong:(BOOL)a4;
- (SignpostFrameLatencyInterval)initWithStartMCT:(unint64_t)a3 endMCT:(unint64_t)a4 timebaseRatio:(double)a5 swapID:(unsigned int)a6 frameSeed:(unsigned int)a7 totalFrameCount:(unint64_t)a8 lateFrameCount:(unint64_t)a9;
- (unint64_t)lateFrameCount;
- (unint64_t)totalFrameCount;
- (unsigned)frameSeed;
- (unsigned)swapId;
- (void)setContributingPids:(id)a3;
@end

@implementation SignpostFrameLatencyInterval

- (unsigned)frameSeed
{
  return self->_frameSeed;
}

- (void).cxx_destruct
{
}

- (SignpostFrameLatencyInterval)initWithStartMCT:(unint64_t)a3 endMCT:(unint64_t)a4 timebaseRatio:(double)a5 swapID:(unsigned int)a6 frameSeed:(unsigned int)a7 totalFrameCount:(unint64_t)a8 lateFrameCount:(unint64_t)a9
{
  v14.receiver = self;
  v14.super_class = (Class)SignpostFrameLatencyInterval;
  result = [(SignpostAnimationSubInterval *)&v14 initWithStartMCT:a3 endMCT:a4 timebaseRatio:a5];
  if (result)
  {
    result->_swapId = a6;
    result->_frameSeed = a7;
    result->_totalFrameCount = a8;
    result->_lateFrameCount = a9;
  }
  return result;
}

- (SignpostFrameLatencyInterval)initWithFrameLatencyInterval:(id)a3 isLong:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v45.receiver = self;
  v45.super_class = (Class)SignpostFrameLatencyInterval;
  v7 = [(SignpostAnimationSubInterval *)&v45 initWithInterval:v6];
  uint64_t v8 = [v6 signpostId];
  v9 = [v6 beginEvent];
  v10 = [v9 _numberArgumentWithName:@"frame_seed"];

  if (!v10)
  {
    v18 = _signpost_debug_log();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
      -[SignpostFrameLatencyInterval initWithFrameLatencyInterval:isLong:](v18, v19, v20, v21, v22, v23, v24, v25);
    }
    goto LABEL_12;
  }
  uint64_t v11 = [v10 unsignedLongLongValue];
  if (!v4)
  {
    uint64_t v14 = 0;
    uint64_t v17 = 0;
    goto LABEL_9;
  }
  v12 = [v6 beginEvent];
  v13 = [v12 _numberArgumentWithName:@"frame_count"];

  if (!v13)
  {
    v18 = _signpost_debug_log();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
      -[SignpostFrameLatencyInterval initWithFrameLatencyInterval:isLong:](v18, v29, v30, v31, v32, v33, v34, v35);
    }
LABEL_12:

LABEL_13:
    v28 = 0;
    goto LABEL_14;
  }
  uint64_t v14 = [v13 unsignedLongLongValue];
  v15 = [v6 beginEvent];
  v16 = [v15 _numberArgumentWithName:@"late_frame_count"];

  if (!v16)
  {
    v37 = _signpost_debug_log();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG)) {
      -[SignpostFrameLatencyInterval initWithFrameLatencyInterval:isLong:](v37, v38, v39, v40, v41, v42, v43, v44);
    }

    goto LABEL_13;
  }
  uint64_t v17 = [v16 unsignedLongLongValue];

LABEL_9:
  uint64_t v26 = [v6 startMachContinuousTime];
  uint64_t v27 = [v6 endMachContinuousTime];
  [v6 timebaseRatio];
  v7 = -[SignpostFrameLatencyInterval initWithStartMCT:endMCT:timebaseRatio:swapID:frameSeed:totalFrameCount:lateFrameCount:](v7, "initWithStartMCT:endMCT:timebaseRatio:swapID:frameSeed:totalFrameCount:lateFrameCount:", v26, v27, v8, v11, v14, v17);
  v28 = v7;
LABEL_14:

  return v28;
}

- (unsigned)swapId
{
  return self->_swapId;
}

- (unint64_t)totalFrameCount
{
  return self->_totalFrameCount;
}

- (unint64_t)lateFrameCount
{
  return self->_lateFrameCount;
}

- (NSSet)contributingPids
{
  return self->_contributingPids;
}

- (void)setContributingPids:(id)a3
{
}

- (void)initWithFrameLatencyInterval:(uint64_t)a3 isLong:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithFrameLatencyInterval:(uint64_t)a3 isLong:(uint64_t)a4 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithFrameLatencyInterval:(uint64_t)a3 isLong:(uint64_t)a4 .cold.3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end