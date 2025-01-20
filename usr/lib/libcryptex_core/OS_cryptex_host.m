@interface OS_cryptex_host
- (void)dealloc;
@end

@implementation OS_cryptex_host

- (void)dealloc
{
  _cryptex_host_dealloc((uint64_t)self);
  v3.receiver = self;
  v3.super_class = (Class)OS_cryptex_host;
  [(OS_cryptex_host *)&v3 dealloc];
}

@end