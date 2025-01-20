@interface OS_cryptex_scrivener
- (void)dealloc;
@end

@implementation OS_cryptex_scrivener

- (void)dealloc
{
  _cryptex_scrivener_dealloc((uint64_t)self);
  v3.receiver = self;
  v3.super_class = (Class)OS_cryptex_scrivener;
  [(OS_cryptex_base *)&v3 dealloc];
}

@end