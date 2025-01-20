@interface OS_launch_event_provider
- (void)dealloc;
@end

@implementation OS_launch_event_provider

- (void)dealloc
{
  sub_10003C1B4(self);
  sub_10001A5F0((uint64_t)self);
  v3.receiver = self;
  v3.super_class = (Class)OS_launch_event_provider;
  [(OS_launch_event_provider *)&v3 dealloc];
}

@end