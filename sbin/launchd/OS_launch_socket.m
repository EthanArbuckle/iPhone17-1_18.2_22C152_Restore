@interface OS_launch_socket
- (void)dealloc;
@end

@implementation OS_launch_socket

- (void)dealloc
{
  sub_10001B2E8((uint64_t)self);
  sub_10001A5F0((uint64_t)self);
  v3.receiver = self;
  v3.super_class = (Class)OS_launch_socket;
  [(OS_launch_socket *)&v3 dealloc];
}

@end