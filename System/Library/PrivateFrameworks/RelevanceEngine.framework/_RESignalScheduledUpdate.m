@interface _RESignalScheduledUpdate
- (NSDate)lastFireDate;
- (double)interval;
- (id)completion;
- (void)setCompletion:(id)a3;
- (void)setInterval:(double)a3;
- (void)setLastFireDate:(id)a3;
@end

@implementation _RESignalScheduledUpdate

- (double)interval
{
  return self->_interval;
}

- (void)setInterval:(double)a3
{
  self->_interval = a3;
}

- (id)completion
{
  return self->_completion;
}

- (void)setCompletion:(id)a3
{
}

- (NSDate)lastFireDate
{
  return self->_lastFireDate;
}

- (void)setLastFireDate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastFireDate, 0);
  objc_storeStrong(&self->_completion, 0);
}

@end