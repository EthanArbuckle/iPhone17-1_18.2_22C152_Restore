@interface OS_at_encoder
- (BOOL)isEqual:(id)a3;
- (NSString)debugDescription;
- (void)dealloc;
@end

@implementation OS_at_encoder

- (void)dealloc
{
  ATEncoder_dtor((uint64_t)self);
  v3.receiver = self;
  v3.super_class = (Class)OS_at_encoder;
  [(OS_at_encoder *)&v3 dealloc];
}

- (NSString)debugDescription
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  result = (NSString *)objc_lookUpClass("NSString");
  if (result)
  {
    v4 = result;
    v5[0] = 0;
    ATEncoder_GetDescription((uint64_t)self);
    return [(NSString *)v4 stringWithCString:v5 encoding:1];
  }
  return result;
}

- (BOOL)isEqual:(id)a3
{
  if (self && a3) {
    return ATEncoder_IsEqual((uint64_t)self, (uint64_t)a3);
  }
  else {
    return 0;
  }
}

@end