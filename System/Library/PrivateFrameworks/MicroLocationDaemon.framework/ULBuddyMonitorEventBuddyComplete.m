@interface ULBuddyMonitorEventBuddyComplete
- (BOOL)buddyComplete;
- (void)setBuddyComplete:(BOOL)a3;
@end

@implementation ULBuddyMonitorEventBuddyComplete

- (BOOL)buddyComplete
{
  return self->_buddyComplete;
}

- (void)setBuddyComplete:(BOOL)a3
{
  self->_buddyComplete = a3;
}

@end