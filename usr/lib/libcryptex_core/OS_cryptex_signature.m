@interface OS_cryptex_signature
- (void)dealloc;
@end

@implementation OS_cryptex_signature

- (void)dealloc
{
  _cryptex_signature_dealloc((uint64_t)self);
  v3.receiver = self;
  v3.super_class = (Class)OS_cryptex_signature;
  [(OS_cryptex_signature *)&v3 dealloc];
}

@end