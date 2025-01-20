@interface OS_launch_service
- (void)dealloc;
@end

@implementation OS_launch_service

- (void)dealloc
{
  sub_100004EB8((uint64_t)self);
  sub_10001A5F0((uint64_t)self);
  v3.receiver = self;
  v3.super_class = (Class)OS_launch_service;
  [(OS_launch_service *)&v3 dealloc];
}

@end