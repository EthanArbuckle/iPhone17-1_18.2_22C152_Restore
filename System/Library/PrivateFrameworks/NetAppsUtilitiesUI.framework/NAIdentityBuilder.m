@interface NAIdentityBuilder
@end

@implementation NAIdentityBuilder

CFNumberRef __73__NAIdentityBuilder_NAUIAdditions__appendCGFloatCharacteristic_withRole___block_invoke(uint64_t a1)
{
  double valuePtr = (*(double (**)(void))(*(void *)(a1 + 32) + 16))();
  return CFNumberCreate((CFAllocatorRef)*MEMORY[0x263EFFB28], kCFNumberCGFloatType, &valuePtr);
}

uint64_t __73__NAIdentityBuilder_NAUIAdditions__appendCGPointCharacteristic_withRole___block_invoke(uint64_t a1)
{
  v1 = (void *)MEMORY[0x263F08D40];
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  return objc_msgSend(v1, "valueWithCGPoint:");
}

uint64_t __72__NAIdentityBuilder_NAUIAdditions__appendCGRectCharacteristic_withRole___block_invoke(uint64_t a1)
{
  v1 = (void *)MEMORY[0x263F08D40];
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  return objc_msgSend(v1, "valueWithCGRect:");
}

@end