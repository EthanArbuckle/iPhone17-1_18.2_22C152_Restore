@interface NUImageProperties
@end

@implementation NUImageProperties

void __56___NUImageProperties_enumerateAuxiliaryImageProperties___block_invoke(uint64_t a1, void *a2, void *a3, uint64_t a4)
{
  uint64_t v6 = *(void *)(a1 + 32);
  id v8 = a3;
  uint64_t v7 = NUAuxiliaryImageTypeFromString(a2);
  (*(void (**)(uint64_t, uint64_t, id, uint64_t))(v6 + 16))(v6, v7, v8, a4);
}

@end