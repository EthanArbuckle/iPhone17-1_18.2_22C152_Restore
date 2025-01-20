@interface OS_codex
- (void)dealloc;
@end

@implementation OS_codex

- (void)dealloc
{
  sub_100016CEC((uint64_t)self);
  v3.receiver = self;
  v3.super_class = (Class)OS_codex;
  [(OS_cryptex_base *)&v3 dealloc];
}

@end