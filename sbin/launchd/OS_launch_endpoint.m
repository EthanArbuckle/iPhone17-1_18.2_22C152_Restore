@interface OS_launch_endpoint
- (void)dealloc;
@end

@implementation OS_launch_endpoint

- (void)dealloc
{
  sub_100048704((uint64_t)self, (uint64_t)a2, v2, v3, v4, v5, v6, v7);
  sub_10001A5F0((uint64_t)self);
  v9.receiver = self;
  v9.super_class = (Class)OS_launch_endpoint;
  [(OS_launch_endpoint *)&v9 dealloc];
}

@end