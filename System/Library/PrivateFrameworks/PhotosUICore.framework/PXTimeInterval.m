@interface PXTimeInterval
- (NSMutableDictionary)tokenToTransitionHandler;
- (PXTimeInterval)init;
- (double)beginTime;
- (double)duration;
- (double)endTime;
- (id)addStateTransitionHandler:(id)a3;
- (int64_t)state;
- (void)_notifyStateTransitionHandlersOfTransitionFromState:(int64_t)a3;
- (void)beginInterval;
- (void)beginIntervalWithTimeOverride:(double)a3;
- (void)endInterval;
- (void)endIntervalWithTimeOverride:(double)a3;
- (void)removeStateTransitionHandler:(id)a3;
- (void)reset;
- (void)setBeginTime:(double)a3;
- (void)setEndTime:(double)a3;
- (void)setState:(int64_t)a3;
- (void)setTokenToTransitionHandler:(id)a3;
@end

@implementation PXTimeInterval

- (void).cxx_destruct
{
}

- (void)setTokenToTransitionHandler:(id)a3
{
}

- (NSMutableDictionary)tokenToTransitionHandler
{
  return self->_tokenToTransitionHandler;
}

- (void)setEndTime:(double)a3
{
  self->_endTime = a3;
}

- (void)setBeginTime:(double)a3
{
  self->_beginTime = a3;
}

- (int64_t)state
{
  return self->_state;
}

- (void)_notifyStateTransitionHandlersOfTransitionFromState:(int64_t)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v3 = [(PXTimeInterval *)self tokenToTransitionHandler];
  v4 = [v3 allValues];
  v5 = (void *)[v4 copy];

  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v6 = v5;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v6);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v11 + 1) + 8 * v10) + 16))(*(void *)(*((void *)&v11 + 1) + 8 * v10));
        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }
}

- (void)reset
{
  if ((unint64_t)([(PXTimeInterval *)self state] - 1) <= 1)
  {
    [(PXTimeInterval *)self setState:0];
  }
}

- (void)endIntervalWithTimeOverride:(double)a3
{
  if ([(PXTimeInterval *)self state] == 1)
  {
    [(PXTimeInterval *)self setEndTime:a3];
    [(PXTimeInterval *)self setState:2];
  }
}

- (void)endInterval
{
  double Current = CFAbsoluteTimeGetCurrent();
  [(PXTimeInterval *)self endIntervalWithTimeOverride:Current];
}

- (void)beginIntervalWithTimeOverride:(double)a3
{
  if (([(PXTimeInterval *)self state] | 2) == 2)
  {
    [(PXTimeInterval *)self setBeginTime:a3];
    [(PXTimeInterval *)self setState:1];
  }
}

- (void)beginInterval
{
  double Current = CFAbsoluteTimeGetCurrent();
  [(PXTimeInterval *)self beginIntervalWithTimeOverride:Current];
}

- (void)removeStateTransitionHandler:(id)a3
{
  id v7 = a3;
  if (!v7)
  {
    id v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2, self, @"PXTimeInterval.m", 83, @"Invalid parameter not satisfying: %@", @"token != nil" object file lineNumber description];
  }
  v5 = [(PXTimeInterval *)self tokenToTransitionHandler];
  [v5 removeObjectForKey:v7];
}

- (id)addStateTransitionHandler:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    long long v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2, self, @"PXTimeInterval.m", 75, @"Invalid parameter not satisfying: %@", @"handler != nil" object file lineNumber description];
  }
  id v6 = [MEMORY[0x1E4F29128] UUID];
  id v7 = (void *)[v5 copy];
  uint64_t v8 = _Block_copy(v7);
  uint64_t v9 = [(PXTimeInterval *)self tokenToTransitionHandler];
  [v9 setObject:v8 forKeyedSubscript:v6];

  return v6;
}

- (double)duration
{
  [(PXTimeInterval *)self endTime];
  double v4 = v3;
  [(PXTimeInterval *)self beginTime];
  return v4 - v5;
}

- (double)endTime
{
  int64_t v3 = [(PXTimeInterval *)self state];
  if (v3 == 2) {
    return self->_endTime;
  }
  double result = 0.0;
  if (v3 == 1)
  {
    return CFAbsoluteTimeGetCurrent();
  }
  return result;
}

- (double)beginTime
{
  int64_t v3 = [(PXTimeInterval *)self state];
  double result = 0.0;
  if ((unint64_t)(v3 - 1) <= 1) {
    return self->_beginTime;
  }
  return result;
}

- (void)setState:(int64_t)a3
{
  if (self->_state != a3)
  {
    self->_state = a3;
    -[PXTimeInterval _notifyStateTransitionHandlersOfTransitionFromState:](self, "_notifyStateTransitionHandlersOfTransitionFromState:");
  }
}

- (PXTimeInterval)init
{
  v7.receiver = self;
  v7.super_class = (Class)PXTimeInterval;
  v2 = [(PXTimeInterval *)&v7 init];
  int64_t v3 = v2;
  if (v2)
  {
    v2->_state = 0;
    v2->_beginTime = 0.0;
    v2->_endTime = 0.0;
    double v4 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    tokenToTransitionHandler = v3->_tokenToTransitionHandler;
    v3->_tokenToTransitionHandler = v4;
  }
  return v3;
}

@end