@interface OS_channel_rt
- (void)dealloc;
@end

@implementation OS_channel_rt

- (void)dealloc
{
  channel_rt_dispose((uint64_t)self);
  v3.receiver = self;
  v3.super_class = (Class)OS_channel_rt;
  [(OS_channel *)&v3 dealloc];
}

@end