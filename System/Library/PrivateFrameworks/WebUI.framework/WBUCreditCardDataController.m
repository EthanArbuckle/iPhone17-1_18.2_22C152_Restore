@interface WBUCreditCardDataController
+ (id)sharedCreditCardDataController;
- (BOOL)_shouldOfferVirtualCards;
- (BOOL)hasUsedNonVirtualCard;
- (unint64_t)virtualCardFieldsToRequest;
- (void)setHasUsedNonVirtualCard;
@end

@implementation WBUCreditCardDataController

+ (id)sharedCreditCardDataController
{
  v3 = (void *)sharedCreditCardDataController_sharedInstance;
  if (!sharedCreditCardDataController_sharedInstance)
  {
    id v4 = objc_alloc_init((Class)a1);
    v5 = (void *)sharedCreditCardDataController_sharedInstance;
    sharedCreditCardDataController_sharedInstance = (uint64_t)v4;

    v3 = (void *)sharedCreditCardDataController_sharedInstance;
  }
  return v3;
}

- (unint64_t)virtualCardFieldsToRequest
{
  if (MGGetBoolAnswer()) {
    return 3;
  }
  else {
    return 1;
  }
}

- (BOOL)hasUsedNonVirtualCard
{
  v2 = objc_msgSend(MEMORY[0x263EFFA40], "webui_defaults");
  char v3 = [v2 BOOLForKey:*(void *)off_2643EFF00];

  return v3;
}

- (void)setHasUsedNonVirtualCard
{
  objc_msgSend(MEMORY[0x263EFFA40], "webui_defaults");
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [v2 setBool:1 forKey:*(void *)off_2643EFF00];
}

- (BOOL)_shouldOfferVirtualCards
{
  return +[WBUFeatureManager shouldOfferVirtualCards];
}

@end