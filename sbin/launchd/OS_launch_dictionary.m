@interface OS_launch_dictionary
- (void)dealloc;
@end

@implementation OS_launch_dictionary

- (void)dealloc
{
  sub_100045FF8((uint64_t)self);
  sub_10001A5F0((uint64_t)self);
  v3.receiver = self;
  v3.super_class = (Class)OS_launch_dictionary;
  [(OS_launch_dictionary *)&v3 dealloc];
}

@end