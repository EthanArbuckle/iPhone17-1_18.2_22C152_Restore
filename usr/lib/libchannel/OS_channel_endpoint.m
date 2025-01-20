@interface OS_channel_endpoint
- (void)dealloc;
@end

@implementation OS_channel_endpoint

- (void)dealloc
{
  channel_endpoint_dispose((uint64_t)self);
  v3.receiver = self;
  v3.super_class = (Class)OS_channel_endpoint;
  [(OS_channel_endpoint *)&v3 dealloc];
}

@end