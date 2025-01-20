@interface UITraitCollection
@end

@implementation UITraitCollection

void __90__UITraitCollection_PBFDisplayContextAdditions__pbf_traitCollectionCompatibleWithContext___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  objc_msgSend(v3, "setUserInterfaceStyle:", UIUserInterfaceStyleFromPBFUserInterfaceStyle(objc_msgSend(v2, "pbf_userInterfaceStyle")));
}

@end