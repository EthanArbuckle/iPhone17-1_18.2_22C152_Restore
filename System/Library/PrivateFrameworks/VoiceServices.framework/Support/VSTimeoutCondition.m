@interface VSTimeoutCondition
- (BOOL)_waitForTimeInterval:(double)a3;
- (BOOL)shouldStop;
- (BOOL)wait;
- (NSCondition)refreshTimeoutCondition;
- (VSTimeoutCondition)initWithTimeoutValue:(double)a3;
- (double)timeoutValue;
- (void)refresh;
- (void)setRefreshTimeoutCondition:(id)a3;
- (void)setShouldStop:(BOOL)a3;
- (void)setTimeoutValue:(double)a3;
- (void)stop;
@end

@implementation VSTimeoutCondition

- (void).cxx_destruct
{
}

- (void)setShouldStop:(BOOL)a3
{
  self->_shouldStop = a3;
}

- (BOOL)shouldStop
{
  return self->_shouldStop;
}

- (void)setRefreshTimeoutCondition:(id)a3
{
}

- (NSCondition)refreshTimeoutCondition
{
  return self->_refreshTimeoutCondition;
}

- (void)setTimeoutValue:(double)a3
{
  self->_timeoutValue = a3;
}

- (double)timeoutValue
{
  return self->_timeoutValue;
}

- (BOOL)wait
{
  do
  {
    [(VSTimeoutCondition *)self timeoutValue];
    BOOL v3 = -[VSTimeoutCondition _waitForTimeInterval:](self, "_waitForTimeInterval:");
  }
  while (v3 && ![(VSTimeoutCondition *)self shouldStop]);
  return v3;
}

- (void)stop
{
  BOOL v3 = [(VSTimeoutCondition *)self refreshTimeoutCondition];
  [v3 lock];

  self->_shouldStop = 1;
  v4 = [(VSTimeoutCondition *)self refreshTimeoutCondition];
  [v4 signal];

  id v5 = [(VSTimeoutCondition *)self refreshTimeoutCondition];
  [v5 unlock];
}

- (void)refresh
{
  BOOL v3 = [(VSTimeoutCondition *)self refreshTimeoutCondition];
  [v3 lock];

  v4 = [(VSTimeoutCondition *)self refreshTimeoutCondition];
  [v4 signal];

  id v5 = [(VSTimeoutCondition *)self refreshTimeoutCondition];
  [v5 unlock];
}

- (BOOL)_waitForTimeInterval:(double)a3
{
  id v5 = [(VSTimeoutCondition *)self refreshTimeoutCondition];
  [v5 lock];

  v6 = [(VSTimeoutCondition *)self refreshTimeoutCondition];
  v7 = [MEMORY[0x263EFF910] dateWithTimeIntervalSinceNow:a3];
  char v8 = [v6 waitUntilDate:v7];

  v9 = [(VSTimeoutCondition *)self refreshTimeoutCondition];
  [v9 unlock];

  return v8;
}

- (VSTimeoutCondition)initWithTimeoutValue:(double)a3
{
  v9.receiver = self;
  v9.super_class = (Class)VSTimeoutCondition;
  v4 = [(VSTimeoutCondition *)&v9 init];
  id v5 = v4;
  if (v4)
  {
    v4->_timeoutValue = a3;
    v6 = (NSCondition *)objc_alloc_init(MEMORY[0x263F08740]);
    refreshTimeoutCondition = v5->_refreshTimeoutCondition;
    v5->_refreshTimeoutCondition = v6;

    v5->_shouldStop = 0;
  }
  return v5;
}

@end