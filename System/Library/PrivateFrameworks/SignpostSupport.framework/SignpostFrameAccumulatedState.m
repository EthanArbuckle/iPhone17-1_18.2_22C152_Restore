@interface SignpostFrameAccumulatedState
- (NSMutableDictionary)contextIDtoContextInfoDict;
- (NSMutableDictionary)frameSeedToSkippedRenderIntervals;
- (SignpostFrameAccumulatedState)initWithFrameSeed:(unsigned int)a3;
- (SignpostFrameLatencyInterval)frameLatency;
- (SignpostHIDLatencyInterval)hidLatency;
- (SignpostRenderServerRenderInterval)renderInterval;
- (unsigned)frameSeed;
- (void)_addSkippedRender:(id)a3;
- (void)setContextIDtoContextInfoDict:(id)a3;
- (void)setFrameLatency:(id)a3;
- (void)setFrameSeedToSkippedRenderIntervals:(id)a3;
- (void)setHidLatency:(id)a3;
- (void)setRenderInterval:(id)a3;
@end

@implementation SignpostFrameAccumulatedState

- (NSMutableDictionary)contextIDtoContextInfoDict
{
  return self->_contextIDtoContextInfoDict;
}

- (NSMutableDictionary)frameSeedToSkippedRenderIntervals
{
  return self->_frameSeedToSkippedRenderIntervals;
}

- (void)setRenderInterval:(id)a3
{
}

- (SignpostRenderServerRenderInterval)renderInterval
{
  return self->_renderInterval;
}

- (SignpostFrameAccumulatedState)initWithFrameSeed:(unsigned int)a3
{
  v9.receiver = self;
  v9.super_class = (Class)SignpostFrameAccumulatedState;
  v4 = [(SignpostFrameAccumulatedState *)&v9 init];
  v5 = v4;
  if (v4)
  {
    v4->_frameSeed = a3;
    uint64_t v6 = [MEMORY[0x1E4F1CA60] dictionary];
    contextIDtoContextInfoDict = v5->_contextIDtoContextInfoDict;
    v5->_contextIDtoContextInfoDict = (NSMutableDictionary *)v6;
  }
  return v5;
}

- (void)_addSkippedRender:(id)a3
{
  id v12 = a3;
  v4 = [(SignpostFrameAccumulatedState *)self frameSeedToSkippedRenderIntervals];

  if (!v4)
  {
    v5 = [MEMORY[0x1E4F1CA60] dictionary];
    frameSeedToSkippedRenderIntervals = self->_frameSeedToSkippedRenderIntervals;
    self->_frameSeedToSkippedRenderIntervals = v5;
  }
  v7 = [(SignpostFrameAccumulatedState *)self frameSeedToSkippedRenderIntervals];
  v8 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(v12, "frameSeed"));
  objc_super v9 = [v7 objectForKeyedSubscript:v8];

  if (!v9)
  {
    objc_super v9 = [MEMORY[0x1E4F1CA48] array];
    v10 = [(SignpostFrameAccumulatedState *)self frameSeedToSkippedRenderIntervals];
    v11 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(v12, "frameSeed"));
    [v10 setObject:v9 forKeyedSubscript:v11];
  }
  [v9 addObject:v12];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_frameLatency, 0);
  objc_storeStrong((id *)&self->_hidLatency, 0);
  objc_storeStrong((id *)&self->_frameSeedToSkippedRenderIntervals, 0);
  objc_storeStrong((id *)&self->_renderInterval, 0);

  objc_storeStrong((id *)&self->_contextIDtoContextInfoDict, 0);
}

- (unsigned)frameSeed
{
  return self->_frameSeed;
}

- (void)setContextIDtoContextInfoDict:(id)a3
{
}

- (void)setFrameSeedToSkippedRenderIntervals:(id)a3
{
}

- (SignpostHIDLatencyInterval)hidLatency
{
  return self->_hidLatency;
}

- (void)setHidLatency:(id)a3
{
}

- (SignpostFrameLatencyInterval)frameLatency
{
  return self->_frameLatency;
}

- (void)setFrameLatency:(id)a3
{
}

@end