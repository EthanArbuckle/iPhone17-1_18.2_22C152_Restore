@interface OS_launch_domain
- (void)dealloc;
@end

@implementation OS_launch_domain

- (void)dealloc
{
  sub_10002A2D4((uint64_t)self);
  sub_10001A5F0((uint64_t)self);
  v3.receiver = self;
  v3.super_class = (Class)OS_launch_domain;
  [(OS_launch_domain *)&v3 dealloc];
}

@end