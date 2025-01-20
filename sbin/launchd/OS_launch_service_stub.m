@interface OS_launch_service_stub
- (void)dealloc;
@end

@implementation OS_launch_service_stub

- (void)dealloc
{
  sub_1000471E0((uint64_t)self);
  sub_10001A5F0((uint64_t)self);
  v3.receiver = self;
  v3.super_class = (Class)OS_launch_service_stub;
  [(OS_launch_service_stub *)&v3 dealloc];
}

@end