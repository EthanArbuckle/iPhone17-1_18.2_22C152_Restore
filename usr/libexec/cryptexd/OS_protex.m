@interface OS_protex
- (void)dealloc;
@end

@implementation OS_protex

- (void)dealloc
{
  sub_1000113D0((void **)&self->super.super.super.isa);
  v3.receiver = self;
  v3.super_class = (Class)OS_protex;
  [(OS_cryptex_base *)&v3 dealloc];
}

@end