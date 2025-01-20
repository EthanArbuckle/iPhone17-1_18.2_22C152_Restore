@interface TimerOperation
+ (id)operationWithTimeInterval:(double)a3;
- (BOOL)isAsynchronous;
- (BOOL)isExecuting;
- (BOOL)isFinished;
- (NSTimer)timer;
- (TimerOperation)init;
- (TimerOperation)initWithTimeInterval:(double)a3;
- (double)timeInterval;
- (void)cancel;
- (void)finish;
- (void)main;
- (void)setTimeInterval:(double)a3;
- (void)setTimer:(id)a3;
- (void)start;
- (void)timerFired:(id)a3;
@end

@implementation TimerOperation

+ (id)operationWithTimeInterval:(double)a3
{
  v3 = [[TimerOperation alloc] initWithTimeInterval:a3];

  return v3;
}

- (TimerOperation)initWithTimeInterval:(double)a3
{
  v7.receiver = self;
  v7.super_class = (Class)TimerOperation;
  v4 = [(TimerOperation *)&v7 init];
  v5 = v4;
  if (v4)
  {
    v4->_executing = 0;
    v4->_finished = 0;
    [(TimerOperation *)v4 setTimeInterval:a3];
  }
  return v5;
}

- (TimerOperation)init
{
  return [(TimerOperation *)self initWithTimeInterval:0.0];
}

- (BOOL)isAsynchronous
{
  return 1;
}

- (void)finish
{
  [(TimerOperation *)self willChangeValueForKey:@"isFinished"];
  [(TimerOperation *)self willChangeValueForKey:@"isExecuting"];
  self->_executing = 0;
  self->_finished = 1;
  [(TimerOperation *)self didChangeValueForKey:@"isExecuting"];

  [(TimerOperation *)self didChangeValueForKey:@"isFinished"];
}

- (void)start
{
  if ([(TimerOperation *)self isCancelled])
  {
    CFStringRef v3 = @"isFinished";
    [(TimerOperation *)self willChangeValueForKey:@"isFinished"];
    v4 = &OBJC_IVAR___TimerOperation__finished;
  }
  else
  {
    CFStringRef v3 = @"isExecuting";
    [(TimerOperation *)self willChangeValueForKey:@"isExecuting"];
    [(TimerOperation *)self performSelectorOnMainThread:"main" withObject:0 waitUntilDone:0];
    v4 = &OBJC_IVAR___TimerOperation__executing;
  }
  *((unsigned char *)&self->super.super.isa + *v4) = 1;

  [(TimerOperation *)self didChangeValueForKey:v3];
}

- (void)timerFired:(id)a3
{
  if (([(TimerOperation *)self isCancelled] & 1) == 0)
  {
    [(TimerOperation *)self finish];
  }
}

- (void)main
{
  [(TimerOperation *)self timeInterval];
  +[NSTimer scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:](NSTimer, "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", self, "timerFired:", 0, 0);
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  [(TimerOperation *)self setTimer:v3];
}

- (void)cancel
{
  id v3 = [(TimerOperation *)self timer];
  [v3 invalidate];

  v4.receiver = self;
  v4.super_class = (Class)TimerOperation;
  [(TimerOperation *)&v4 cancel];
  [(TimerOperation *)self finish];
}

- (BOOL)isExecuting
{
  return self->_executing;
}

- (BOOL)isFinished
{
  return self->_finished;
}

- (double)timeInterval
{
  return self->_timeInterval;
}

- (void)setTimeInterval:(double)a3
{
  self->_timeInterval = a3;
}

- (NSTimer)timer
{
  return self->_timer;
}

- (void)setTimer:(id)a3
{
}

- (void).cxx_destruct
{
}

@end