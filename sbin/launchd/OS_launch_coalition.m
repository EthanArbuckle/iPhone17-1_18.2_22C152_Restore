@interface OS_launch_coalition
- (void)dealloc;
@end

@implementation OS_launch_coalition

- (void)dealloc
{
  sub_100012608((uint64_t)self);
  sub_10001A5F0((uint64_t)self);
  v3.receiver = self;
  v3.super_class = (Class)OS_launch_coalition;
  [(OS_launch_coalition *)&v3 dealloc];
}

@end