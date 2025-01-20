@interface SUPlayerStatus
- (NSError)error;
- (double)currentTime;
- (double)duration;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)playerState;
- (void)dealloc;
- (void)setCurrentTime:(double)a3;
- (void)setDuration:(double)a3;
- (void)setError:(id)a3;
- (void)setPlayerState:(int64_t)a3;
@end

@implementation SUPlayerStatus

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)SUPlayerStatus;
  [(SUPlayerStatus *)&v3 dealloc];
}

- (id)description
{
  unint64_t v2 = self->_state - 1;
  if (v2 > 4) {
    objc_super v3 = 0;
  }
  else {
    objc_super v3 = off_264814D88[v2];
  }
  v5.receiver = self;
  v5.super_class = (Class)SUPlayerStatus;
  return (id)[NSString stringWithFormat:@"%@: Time: (%.2f : %.2f), State: %@", -[SUPlayerStatus description](&v5, sel_description), *(void *)&self->_currentTime, *(void *)&self->_duration, v3];
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  *(double *)(v4 + 8) = self->_currentTime;
  *(double *)(v4 + 16) = self->_duration;
  *(void *)(v4 + 24) = self->_error;
  *(void *)(v4 + 32) = self->_state;
  return (id)v4;
}

- (double)currentTime
{
  return self->_currentTime;
}

- (void)setCurrentTime:(double)a3
{
  self->_currentTime = a3;
}

- (double)duration
{
  return self->_duration;
}

- (void)setDuration:(double)a3
{
  self->_duration = a3;
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
}

- (int64_t)playerState
{
  return self->_state;
}

- (void)setPlayerState:(int64_t)a3
{
  self->_state = a3;
}

@end