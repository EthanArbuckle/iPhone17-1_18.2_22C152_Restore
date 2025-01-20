@interface WBSCreditCardData
@end

@implementation WBSCreditCardData

void __88__WBSCreditCardData_SafariSharedUIExtras__virtualCardArtworkWithSize_completionHandler___block_invoke(id *a1, void *a2)
{
  id v3 = a2;
  objc_initWeak(&location, a1[4]);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __88__WBSCreditCardData_SafariSharedUIExtras__virtualCardArtworkWithSize_completionHandler___block_invoke_2;
  v5[3] = &unk_1E5E415C0;
  objc_copyWeak(&v10, &location);
  id v6 = a1[5];
  id v7 = v3;
  id v8 = a1[6];
  id v9 = a1[7];
  id v4 = v3;
  dispatch_async(MEMORY[0x1E4F14428], v5);

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

void __88__WBSCreditCardData_SafariSharedUIExtras__virtualCardArtworkWithSize_completionHandler___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  if (WeakRetained) {
    [*(id *)(a1 + 32) setObject:*(void *)(a1 + 40) forKey:*(void *)(a1 + 48)];
  }
  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
}

@end