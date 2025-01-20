@interface OS_launch_log
- (void)dealloc;
@end

@implementation OS_launch_log

- (void)dealloc
{
  sub_100043990((uint64_t)self);
  sub_10001A5F0((uint64_t)self);
  v3.receiver = self;
  v3.super_class = (Class)OS_launch_log;
  [(OS_launch_log *)&v3 dealloc];
}

@end