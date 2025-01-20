@interface EventMonitorEvent
- (BOOL)hasOccurred;
- (BOOL)shouldKeepDaemonAlive;
- (EventMonitorEvent)init;
- (double)_lastOccurrenceCheckTime;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)pollInterval;
- (void)_setLastOccurrenceCheckTime:(double)a3;
- (void)setPollInterval:(int64_t)a3;
- (void)setShouldKeepDaemonAlive:(BOOL)a3;
@end

@implementation EventMonitorEvent

- (EventMonitorEvent)init
{
  v3.receiver = self;
  v3.super_class = (Class)EventMonitorEvent;
  result = [(EventMonitorEvent *)&v3 init];
  if (result) {
    result->_lastOccurrenceCheckTime = -1.79769313e308;
  }
  return result;
}

- (BOOL)hasOccurred
{
  return 0;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = objc_msgSend(objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  *((void *)result + 2) = self->_pollInterval;
  *((unsigned char *)result + 24) = self->_shouldKeepDaemonAlive;
  return result;
}

- (double)_lastOccurrenceCheckTime
{
  return self->_lastOccurrenceCheckTime;
}

- (void)_setLastOccurrenceCheckTime:(double)a3
{
  self->_lastOccurrenceCheckTime = a3;
}

- (int64_t)pollInterval
{
  return self->_pollInterval;
}

- (void)setPollInterval:(int64_t)a3
{
  self->_pollInterval = a3;
}

- (BOOL)shouldKeepDaemonAlive
{
  return self->_shouldKeepDaemonAlive;
}

- (void)setShouldKeepDaemonAlive:(BOOL)a3
{
  self->_shouldKeepDaemonAlive = a3;
}

@end