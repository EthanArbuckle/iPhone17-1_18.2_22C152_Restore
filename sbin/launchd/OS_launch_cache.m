@interface OS_launch_cache
- (void)dealloc;
@end

@implementation OS_launch_cache

- (void)dealloc
{
  sub_1000463E8((uint64_t)self);
  sub_10001A5F0((uint64_t)self);
  v3.receiver = self;
  v3.super_class = (Class)OS_launch_cache;
  [(OS_launch_cache *)&v3 dealloc];
}

@end