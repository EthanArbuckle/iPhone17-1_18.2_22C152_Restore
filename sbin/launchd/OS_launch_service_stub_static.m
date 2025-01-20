@interface OS_launch_service_stub_static
- (void)dealloc;
@end

@implementation OS_launch_service_stub_static

- (void)dealloc
{
  sub_1000127A8((uint64_t)self);
  sub_10001A5F0((uint64_t)self);
  v3.receiver = self;
  v3.super_class = (Class)OS_launch_service_stub_static;
  [(OS_launch_service_stub_static *)&v3 dealloc];
}

@end