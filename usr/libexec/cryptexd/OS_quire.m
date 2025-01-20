@interface OS_quire
- (void)dealloc;
@end

@implementation OS_quire

- (void)dealloc
{
  sub_10002DC74((uint64_t)self);
  v3.receiver = self;
  v3.super_class = (Class)OS_quire;
  [(OS_cryptex_base *)&v3 dealloc];
}

@end