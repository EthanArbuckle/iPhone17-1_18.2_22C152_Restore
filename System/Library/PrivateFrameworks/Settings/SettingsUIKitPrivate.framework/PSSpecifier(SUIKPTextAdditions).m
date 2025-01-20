@interface PSSpecifier(SUIKPTextAdditions)
- (uint64_t)suikp_autoCapsType;
- (uint64_t)suikp_autoCorrectionType;
- (uint64_t)suikp_keyboardType;
@end

@implementation PSSpecifier(SUIKPTextAdditions)

- (uint64_t)suikp_keyboardType
{
  return *(void *)(a1 + (int)*MEMORY[0x263F5FE30]);
}

- (uint64_t)suikp_autoCapsType
{
  return *(void *)(a1 + (int)*MEMORY[0x263F5FE00]);
}

- (uint64_t)suikp_autoCorrectionType
{
  return *(void *)(a1 + (int)*MEMORY[0x263F5FE08]);
}

@end