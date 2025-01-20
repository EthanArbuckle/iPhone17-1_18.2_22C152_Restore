@interface OS_launch_event_realm
- (void)dealloc;
@end

@implementation OS_launch_event_realm

- (void)dealloc
{
  sub_10003C210(self);
  sub_10001A5F0((uint64_t)self);
  v3.receiver = self;
  v3.super_class = (Class)OS_launch_event_realm;
  [(OS_launch_event_realm *)&v3 dealloc];
}

@end