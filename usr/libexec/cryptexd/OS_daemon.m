@interface OS_daemon
- (void)dealloc;
@end

@implementation OS_daemon

- (void)dealloc
{
  sub_100009B2C((uint64_t)self);
  v3.receiver = self;
  v3.super_class = (Class)OS_daemon;
  [(OS_daemon *)&v3 dealloc];
}

@end