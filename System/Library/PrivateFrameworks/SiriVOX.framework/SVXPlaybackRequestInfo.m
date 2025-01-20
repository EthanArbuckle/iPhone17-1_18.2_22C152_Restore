@interface SVXPlaybackRequestInfo
- (BOOL)didFinish;
- (BOOL)didStart;
- (double)duration;
- (double)finish;
- (double)start;
- (void)setDidFinish:(BOOL)a3;
- (void)setDidStart:(BOOL)a3;
- (void)setFinish:(double)a3;
- (void)setStart:(double)a3;
@end

@implementation SVXPlaybackRequestInfo

- (void)setFinish:(double)a3
{
  self->_finish = a3;
}

- (double)finish
{
  return self->_finish;
}

- (void)setStart:(double)a3
{
  self->_start = a3;
}

- (double)start
{
  return self->_start;
}

- (void)setDidFinish:(BOOL)a3
{
  self->_didFinish = a3;
}

- (BOOL)didFinish
{
  return self->_didFinish;
}

- (void)setDidStart:(BOOL)a3
{
  self->_didStart = a3;
}

- (BOOL)didStart
{
  return self->_didStart;
}

- (double)duration
{
  if (!self->_didStart) {
    return 0.0;
  }
  if (self->_didFinish)
  {
    double finish = self->_finish;
  }
  else
  {
    v5 = [MEMORY[0x263F08AB0] processInfo];
    [v5 systemUptime];
    double finish = v6;
  }
  return vabdd_f64(finish, self->_start);
}

@end