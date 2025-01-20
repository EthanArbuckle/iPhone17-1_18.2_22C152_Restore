@interface SFNavigationIntentBuilder
@end

@implementation SFNavigationIntentBuilder

id __66___SFNavigationIntentBuilder_navigationIntentWithOpenURLContexts___block_invoke(uint64_t a1, uint64_t a2)
{
  v2 = [*(id *)(a1 + 32) _initializeNavigationIntentWithType:9 value:a2];
  if ([v2 externalURLSourceApplicationIsSpotlight]) {
    [v2 setProvenance:3];
  }

  return v2;
}

void __84___SFNavigationIntentBuilder_buildNavigationIntentForDropSession_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 40);
  id v3 = [*(id *)(a1 + 32) _navigationIntentWithItems:a2];
  (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);
}

void __86___SFNavigationIntentBuilder_buildNavigationIntentForItemProviders_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 40);
  id v3 = [*(id *)(a1 + 32) _navigationIntentWithItems:a2];
  (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);
}

id __57___SFNavigationIntentBuilder__navigationIntentWithItems___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v4 = [*(id *)(a1 + 32) _navigationIntentForMKMapItem:v3];
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v4 = [*(id *)(a1 + 32) navigationIntentWithBookmark:v3];
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v5 = *(void **)(a1 + 32);
        v6 = objc_msgSend(v3, "safari_originalDataAsString");
        v7 = [v5 navigationIntentWithText:v6];

        goto LABEL_12;
      }
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();
      v9 = *(void **)(a1 + 32);
      if (isKindOfClass) {
        [v9 navigationIntentWithRecentlyClosedTabStateData:v3];
      }
      else {
      uint64_t v4 = [v9 navigationIntentWithText:v3];
      }
    }
  }
  v7 = (void *)v4;
LABEL_12:

  return v7;
}

@end