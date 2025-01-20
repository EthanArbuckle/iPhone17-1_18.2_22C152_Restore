@interface OS_cryptex_core_cx1_properties
- (void)dealloc;
@end

@implementation OS_cryptex_core_cx1_properties

- (void)dealloc
{
  _cryptex_core_cx1_properties_dealloc((uint64_t)self);
  v3.receiver = self;
  v3.super_class = (Class)OS_cryptex_core_cx1_properties;
  [(OS_cryptex_core_cx1_properties *)&v3 dealloc];
}

@end