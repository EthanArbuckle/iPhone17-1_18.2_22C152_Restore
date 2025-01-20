@interface OS_launch_event_subscription
- (void)dealloc;
@end

@implementation OS_launch_event_subscription

- (void)dealloc
{
  sub_10003C2DC(self);
  sub_10001A5F0((uint64_t)self);
  v3.receiver = self;
  v3.super_class = (Class)OS_launch_event_subscription;
  [(OS_launch_event_subscription *)&v3 dealloc];
}

@end