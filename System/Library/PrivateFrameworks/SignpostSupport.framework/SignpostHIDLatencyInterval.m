@interface SignpostHIDLatencyInterval
- (SignpostHIDLatencyInterval)initWithHIDLatencyInterval:(id)a3;
- (SignpostHIDLatencyInterval)initWithStartMCT:(unint64_t)a3 endMCT:(unint64_t)a4 timebaseRatio:(double)a5 swapID:(unsigned int)a6 frameSeed:(unsigned int)a7;
- (unsigned)frameSeed;
- (unsigned)swapId;
@end

@implementation SignpostHIDLatencyInterval

- (unsigned)frameSeed
{
  return self->_frameSeed;
}

- (SignpostHIDLatencyInterval)initWithStartMCT:(unint64_t)a3 endMCT:(unint64_t)a4 timebaseRatio:(double)a5 swapID:(unsigned int)a6 frameSeed:(unsigned int)a7
{
  v10.receiver = self;
  v10.super_class = (Class)SignpostHIDLatencyInterval;
  result = [(SignpostAnimationSubInterval *)&v10 initWithStartMCT:a3 endMCT:a4 timebaseRatio:a5];
  if (result)
  {
    result->_swapId = a6;
    result->_frameSeed = a7;
  }
  return result;
}

- (SignpostHIDLatencyInterval)initWithHIDLatencyInterval:(id)a3
{
  id v4 = a3;
  v5 = [v4 beginEvent];
  v6 = [v5 _numberArgumentWithName:@"frame_seed"];

  if (v6)
  {
    uint64_t v7 = [v6 unsignedLongLongValue];
    uint64_t v8 = [v4 startMachContinuousTime];
    uint64_t v9 = [v4 endMachContinuousTime];
    [v4 timebaseRatio];
    self = -[SignpostHIDLatencyInterval initWithStartMCT:endMCT:timebaseRatio:swapID:frameSeed:](self, "initWithStartMCT:endMCT:timebaseRatio:swapID:frameSeed:", v8, v9, [v4 signpostId], v7, v10);
    v11 = self;
  }
  else
  {
    v12 = _signpost_debug_log();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
      -[SignpostHIDLatencyInterval initWithHIDLatencyInterval:](v12, v13, v14, v15, v16, v17, v18, v19);
    }

    v11 = 0;
  }

  return v11;
}

- (unsigned)swapId
{
  return self->_swapId;
}

- (void)initWithHIDLatencyInterval:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end