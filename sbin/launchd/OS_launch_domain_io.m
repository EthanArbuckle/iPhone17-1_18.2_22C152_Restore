@interface OS_launch_domain_io
- (void)dealloc;
@end

@implementation OS_launch_domain_io

- (void)dealloc
{
  sub_100016DBC((uint64_t)self);
  sub_10001A5F0((uint64_t)self);
  v3.receiver = self;
  v3.super_class = (Class)OS_launch_domain_io;
  [(OS_launch_domain_io *)&v3 dealloc];
}

@end