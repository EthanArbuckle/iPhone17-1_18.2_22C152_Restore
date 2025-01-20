@interface SignpostRenderAccumulatedState
- (NSMutableArray)clientDrawableIntervals;
- (NSMutableArray)imageQueueSampleEvents;
- (SignpostRenderAccumulatedState)initWithFrameSeed:(unsigned int)a3;
- (unsigned)frameSeed;
- (void)setClientDrawableIntervals:(id)a3;
- (void)setImageQueueSampleEvents:(id)a3;
@end

@implementation SignpostRenderAccumulatedState

- (NSMutableArray)imageQueueSampleEvents
{
  return self->_imageQueueSampleEvents;
}

- (SignpostRenderAccumulatedState)initWithFrameSeed:(unsigned int)a3
{
  v11.receiver = self;
  v11.super_class = (Class)SignpostRenderAccumulatedState;
  v4 = [(SignpostRenderAccumulatedState *)&v11 init];
  v5 = v4;
  if (v4)
  {
    v4->_frameSeed = a3;
    uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
    imageQueueSampleEvents = v5->_imageQueueSampleEvents;
    v5->_imageQueueSampleEvents = (NSMutableArray *)v6;

    uint64_t v8 = [MEMORY[0x1E4F1CA48] array];
    clientDrawableIntervals = v5->_clientDrawableIntervals;
    v5->_clientDrawableIntervals = (NSMutableArray *)v8;
  }
  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientDrawableIntervals, 0);

  objc_storeStrong((id *)&self->_imageQueueSampleEvents, 0);
}

- (unsigned)frameSeed
{
  return self->_frameSeed;
}

- (void)setImageQueueSampleEvents:(id)a3
{
}

- (NSMutableArray)clientDrawableIntervals
{
  return self->_clientDrawableIntervals;
}

- (void)setClientDrawableIntervals:(id)a3
{
}

@end