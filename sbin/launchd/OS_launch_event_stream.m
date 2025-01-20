@interface OS_launch_event_stream
- (void)dealloc;
@end

@implementation OS_launch_event_stream

- (void)dealloc
{
  sub_10003C2BC((uint64_t)self);
  sub_10001A5F0((uint64_t)self);
  v3.receiver = self;
  v3.super_class = (Class)OS_launch_event_stream;
  [(OS_launch_event_stream *)&v3 dealloc];
}

@end