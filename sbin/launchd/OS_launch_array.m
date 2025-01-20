@interface OS_launch_array
- (void)dealloc;
@end

@implementation OS_launch_array

- (void)dealloc
{
  sub_1000113BC((uint64_t)self);
  sub_10001A5F0((uint64_t)self);
  v3.receiver = self;
  v3.super_class = (Class)OS_launch_array;
  [(OS_launch_array *)&v3 dealloc];
}

@end