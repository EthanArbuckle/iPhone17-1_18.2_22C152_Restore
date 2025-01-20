@interface _UIDragMonitorSessionBadgeUpdate
- (_UIDragMonitorSessionBadgeUpdate)initWithDragBadgeStyle:(int64_t)a3;
- (int64_t)badgeStyle;
@end

@implementation _UIDragMonitorSessionBadgeUpdate

- (_UIDragMonitorSessionBadgeUpdate)initWithDragBadgeStyle:(int64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)_UIDragMonitorSessionBadgeUpdate;
  result = [(_UIDragMonitorSessionBadgeUpdate *)&v5 init];
  if (result) {
    result->_badgeStyle = a3;
  }
  return result;
}

- (int64_t)badgeStyle
{
  return self->_badgeStyle;
}

@end