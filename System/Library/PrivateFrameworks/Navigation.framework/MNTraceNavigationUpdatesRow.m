@interface MNTraceNavigationUpdatesRow
- (double)timestamp;
- (int64_t)navigationUpdateType;
- (void)setTimestamp:(double)a3;
@end

@implementation MNTraceNavigationUpdatesRow

- (int64_t)navigationUpdateType
{
  return 0;
}

- (double)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(double)a3
{
  self->_timestamp = a3;
}

@end