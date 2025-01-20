@interface CNContactStore
@end

@implementation CNContactStore

uint64_t __39__CNContactStore_NanoPhone__nph_shared__block_invoke()
{
  nph_shared_sharedContactStore = (uint64_t)objc_alloc_init(MEMORY[0x263EFEA58]);
  return MEMORY[0x270F9A758]();
}

void __63__CNContactStore_NanoPhone__nph_shared_with_nanophone_identity__block_invoke()
{
  id v3 = objc_alloc_init(MEMORY[0x263EFEA68]);
  [@"com.apple.NanoPhone" UTF8String];
  v0 = (void *)tcc_identity_create();
  [v3 setAssumedIdentity:v0];

  uint64_t v1 = [objc_alloc(MEMORY[0x263EFEA58]) initWithConfiguration:v3];
  v2 = (void *)nph_shared_with_nanophone_identity_sharedContactStore;
  nph_shared_with_nanophone_identity_sharedContactStore = v1;
}

@end