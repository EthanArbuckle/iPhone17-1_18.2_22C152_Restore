@interface VKAnimation
- (BOOL)hasFrequency;
- (BOOL)running;
- (BOOL)runsForever;
- (BOOL)timed;
- (NSString)name;
- (VKAnimation)initWithName:(id)a3;
- (VKAnimation)initWithPriority:(int64_t)a3;
- (VKAnimation)initWithPriority:(int64_t)a3 name:(id)a4;
- (double)duration;
- (float)frequency;
- (id)completionHandler;
- (id)description;
- (int64_t)priority;
- (int64_t)state;
- (void)onTimerFired:(double)a3;
- (void)pause;
- (void)resume;
- (void)setCompletionHandler:(id)a3;
- (void)setFrequency:(float)a3;
- (void)setRunsForever:(BOOL)a3;
- (void)startWithRunner:(id)a3;
- (void)stop;
- (void)stopAnimation:(BOOL)a3;
- (void)transferToRunner:(id)a3;
@end

@implementation VKAnimation

- (BOOL)running
{
  return (self->_state & 0xFFFFFFFFFFFFFFFDLL) == 1;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_runner);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong(&self->_completionHandler, 0);
}

- (void)setCompletionHandler:(id)a3
{
}

- (void)setRunsForever:(BOOL)a3
{
  self->_runsForever = a3;
}

- (VKAnimation)initWithPriority:(int64_t)a3
{
  result = [(VKAnimation *)self init];
  if (result) {
    result->_priority = a3;
  }
  return result;
}

- (void)onTimerFired:(double)a3
{
  if (self->_state == 3) {
    -[VKAnimation stopAnimation:](self, "stopAnimation:", 1, a3);
  }
}

- (BOOL)runsForever
{
  return self->_runsForever;
}

- (void)stopAnimation:(BOOL)a3
{
  int64_t state = self->_state;
  if (state) {
    BOOL v4 = a3;
  }
  else {
    BOOL v4 = 0;
  }
  if (state != 4)
  {
    self->_int64_t state = 4;
    v6 = self;
    completionHandler = (void (**)(id, BOOL))v6->_completionHandler;
    if (completionHandler)
    {
      completionHandler[2](completionHandler, v4);
      id v8 = v6->_completionHandler;
    }
    else
    {
      id v8 = 0;
    }
    v6->_completionHandler = 0;

    self->_int64_t state = 0;
    id WeakRetained = objc_loadWeakRetained((id *)&v6->_runner);
    [WeakRetained animationDidStop:v6];

    objc_storeWeak((id *)&v6->_runner, 0);
  }
}

- (void)stop
{
  [(VKAnimation *)self stopAnimation:self->_state == 3];
}

- (void)startWithRunner:(id)a3
{
  if (self->_state != 4)
  {
    objc_storeWeak((id *)&self->_runner, a3);
    self->_int64_t state = 1;
  }
}

- (int64_t)priority
{
  return self->_priority;
}

- (BOOL)hasFrequency
{
  return self->_frequency != 0.0;
}

- (void)setFrequency:(float)a3
{
  self->_frequency = a3;
}

- (float)frequency
{
  return self->_frequency;
}

- (int64_t)state
{
  return self->_state;
}

- (NSString)name
{
  return self->_name;
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)resume
{
  p_runner = &self->_runner;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_runner);

  if (WeakRetained)
  {
    self->_int64_t state = 1;
    id v5 = objc_loadWeakRetained((id *)p_runner);
    [v5 animationDidResume:self];
  }
}

- (void)pause
{
  self->_int64_t state = 2;
}

- (void)transferToRunner:(id)a3
{
}

- (id)description
{
  v3 = NSString;
  v7.receiver = self;
  v7.super_class = (Class)VKAnimation;
  BOOL v4 = [(VKAnimation *)&v7 description];
  id v5 = [v3 stringWithFormat:@"%@ state: %ld, name: %@", v4, self->_state, self->_name];

  return v5;
}

- (VKAnimation)initWithPriority:(int64_t)a3 name:(id)a4
{
  result = [(VKAnimation *)self initWithName:a4];
  if (result) {
    result->_priority = a3;
  }
  return result;
}

- (VKAnimation)initWithName:(id)a3
{
  id v4 = a3;
  id v5 = [(VKAnimation *)self init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    name = v5->_name;
    v5->_name = (NSString *)v6;
  }
  return v5;
}

- (BOOL)timed
{
  return 0;
}

- (double)duration
{
  return 0.0;
}

@end