@interface PKPaymentSetupProductCategory
@end

@implementation PKPaymentSetupProductCategory

void __64__PKPaymentSetupProductCategory_PKUIUtilities__logoCachedImage___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v7 = a3;
  if (v7)
  {
    v5 = [*(id *)(a1 + 32) imageAssets];
    objc_msgSend(v5, "setLogoImage:", objc_msgSend(v7, "CGImage"));
  }
  uint64_t v6 = *(void *)(a1 + 40);
  if (v6) {
    (*(void (**)(uint64_t, uint64_t, id))(v6 + 16))(v6, a2, v7);
  }
}

@end