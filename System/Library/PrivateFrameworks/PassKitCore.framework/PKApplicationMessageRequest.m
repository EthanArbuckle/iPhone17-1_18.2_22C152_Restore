@interface PKApplicationMessageRequest
- (BOOL)badge;
- (BOOL)resetCreatedDate;
- (unint64_t)priority;
- (void)setBadge:(BOOL)a3;
- (void)setPriority:(unint64_t)a3;
- (void)setResetCreatedDate:(BOOL)a3;
@end

@implementation PKApplicationMessageRequest

- (unint64_t)priority
{
  return self->_priority;
}

- (void)setPriority:(unint64_t)a3
{
  self->_priority = a3;
}

- (BOOL)badge
{
  return self->_badge;
}

- (void)setBadge:(BOOL)a3
{
  self->_badge = a3;
}

- (BOOL)resetCreatedDate
{
  return self->_resetCreatedDate;
}

- (void)setResetCreatedDate:(BOOL)a3
{
  self->_resetCreatedDate = a3;
}

@end