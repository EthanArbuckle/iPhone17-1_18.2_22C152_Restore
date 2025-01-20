@interface PKPaymentSetupProduct
@end

@implementation PKPaymentSetupProduct

void __63__PKPaymentSetupProduct_PKUIUtilities__digitalCardCachedImage___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  id v13 = v4;
  if (v4)
  {
    id v5 = v4;
  }
  else if (*(void *)(a1 + 32) {
         || ([*(id *)(a1 + 40) paymentOptions],
  }
             v6 = objc_claimAutoreleasedReturnValue(),
             [v6 firstObject],
             v7 = objc_claimAutoreleasedReturnValue(),
             uint64_t v8 = [v7 cardType],
             v7,
             v6,
             v8 != 103))
  {
    PKUIDynamicImageNamed(@"Placeholder_transit_card", @"Placeholder_transit_card_Dark");
    id v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    PKUIImageNamed(@"SuicaCard");
    id v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v9 = v5;
  v10 = [*(id *)(a1 + 40) imageAssets];
  id v11 = v9;
  objc_msgSend(v10, "setDigitalCardImage:", objc_msgSend(v11, "CGImage"));

  uint64_t v12 = *(void *)(a1 + 48);
  if (v12) {
    (*(void (**)(uint64_t, uint64_t, id))(v12 + 16))(v12, 1, v13);
  }
}

void __63__PKPaymentSetupProduct_PKUIUtilities__plasticCardCachedImage___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  id v13 = v4;
  if (v4)
  {
    id v5 = v4;
  }
  else if (*(void *)(a1 + 32) {
         || ([*(id *)(a1 + 40) paymentOptions],
  }
             v6 = objc_claimAutoreleasedReturnValue(),
             [v6 firstObject],
             v7 = objc_claimAutoreleasedReturnValue(),
             uint64_t v8 = [v7 cardType],
             v7,
             v6,
             v8 != 103))
  {
    PKUIDynamicImageNamed(@"Placeholder_transit_card", @"Placeholder_transit_card_Dark");
    id v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    PKUIImageNamed(@"SuicaCard");
    id v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v9 = v5;
  v10 = [*(id *)(a1 + 40) imageAssets];
  id v11 = v9;
  objc_msgSend(v10, "setPlasticCardImage:", objc_msgSend(v11, "CGImage"));

  uint64_t v12 = *(void *)(a1 + 48);
  if (v12) {
    (*(void (**)(uint64_t, uint64_t, id))(v12 + 16))(v12, 1, v13);
  }
}

void __79__PKPaymentSetupProduct_PKUIUtilities__thumbnailCachedImageForSize_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v7 = a3;
  if (v7)
  {
    id v5 = [*(id *)(a1 + 32) imageAssets];
    objc_msgSend(v5, "setThumbnailImage:", objc_msgSend(v7, "CGImage"));
  }
  uint64_t v6 = *(void *)(a1 + 40);
  if (v6) {
    (*(void (**)(uint64_t, uint64_t, id))(v6 + 16))(v6, a2, v7);
  }
}

void __56__PKPaymentSetupProduct_PKUIUtilities__logoCachedImage___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v6 = a3;
  if (v6)
  {
    id v4 = [*(id *)(a1 + 32) imageAssets];
    objc_msgSend(v4, "setLogoImage:", objc_msgSend(v6, "CGImage"));
  }
  uint64_t v5 = *(void *)(a1 + 40);
  if (v5) {
    (*(void (**)(uint64_t, uint64_t, id))(v5 + 16))(v5, 1, v6);
  }
}

@end