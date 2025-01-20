@interface OS_channel
- (void)dealloc;
@end

@implementation OS_channel

- (void)dealloc
{
  Channel::assert_recv_sane((Channel *)self);
  v3.receiver = self;
  v3.super_class = (Class)OS_channel;
  [(OS_channel *)&v3 dealloc];
}

@end