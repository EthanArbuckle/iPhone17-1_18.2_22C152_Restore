@interface UIActivityHelper
@end

@implementation UIActivityHelper

void __53___UIActivityHelper_activityTypeForBundleIdentifier___block_invoke()
{
  v3[3] = *MEMORY[0x1E4F143B8];
  v2[0] = @"com.apple.MobileSMS";
  v2[1] = @"com.apple.mobilemail";
  v3[0] = @"com.apple.UIKit.activity.Message";
  v3[1] = @"com.apple.UIKit.activity.Mail";
  v2[2] = @"com.apple.telephonyutilities.callservicesd";
  v3[2] = @"com.apple.UIKit.activity.SharePlay";
  uint64_t v0 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v3 forKeys:v2 count:3];
  v1 = (void *)activityTypeForBundleIdentifier__activityTypesForIdentifiers;
  activityTypeForBundleIdentifier__activityTypesForIdentifiers = v0;
}

void __55___UIActivityHelper_transportImageForBundleIdentifier___block_invoke()
{
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  uint64_t v0 = objc_alloc_init(UISharePlayActivity);
  v1 = [(UISharePlayActivity *)v0 activityImage];

  if (v1) {
    [v4 setObject:v1 forKey:@"com.apple.telephonyutilities.callservicesd"];
  }
  uint64_t v2 = [v4 copy];
  v3 = (void *)transportImageForBundleIdentifier__transportImagesForIdentifiers;
  transportImageForBundleIdentifier__transportImagesForIdentifiers = v2;
}

uint64_t __66___UIActivityHelper_preheatAvailableActivitiesForMatchingContext___block_invoke(uint64_t a1, void *a2)
{
  v3 = [a2 _backgroundPreheatBlock];
  id v4 = v3;
  if (v3)
  {
    v6 = v3;
    dispatch_async(*(dispatch_queue_t *)(a1 + 32), v3);
    id v4 = v6;
  }
  return MEMORY[0x1F41817F8](v3, v4);
}

uint64_t __66___UIActivityHelper_orderedAvailableActivitiesForMatchingContext___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "orderedAvailableActivitiesForMatchingContext:");
}

void __66___UIActivityHelper_orderedAvailableActivitiesForMatchingContext___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  int v4 = [*(id *)(a1 + 32) containsObject:v3];
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  v5 = +[_UIActivityHelper builtinActivityClasses];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v25 objects:v30 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v26;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v26 != v7) {
          objc_enumerationMutation(v5);
        }
        if (objc_opt_isKindOfClass())
        {
          LODWORD(v6) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v6 = [v5 countByEnumeratingWithState:&v25 objects:v30 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  uint64_t v9 = 48;
  if (v4 | v6) {
    uint64_t v9 = 40;
  }
  id v10 = *(id *)(a1 + v9);
  v11 = [*(id *)(a1 + 56) collaborationItems];
  v12 = [v11 firstObject];

  if (_canPerformActivityWithItems(v3, v10, *(void **)(a1 + 64), v12))
  {
    [*(id *)(a1 + 72) addObject:v3];
    v13 = [v3 activityType];
    int v14 = [v13 isEqualToString:@"com.apple.UIKit.activity.Print"];

    if (v14)
    {
      v15 = _UIActivityGetPrintingBasedActivities();
      long long v21 = 0u;
      long long v22 = 0u;
      long long v23 = 0u;
      long long v24 = 0u;
      uint64_t v16 = [v15 countByEnumeratingWithState:&v21 objects:v29 count:16];
      if (v16)
      {
        uint64_t v17 = v16;
        uint64_t v18 = *(void *)v22;
        do
        {
          for (uint64_t j = 0; j != v17; ++j)
          {
            if (*(void *)v22 != v18) {
              objc_enumerationMutation(v15);
            }
            v20 = *(void **)(*((void *)&v21 + 1) + 8 * j);
            _setIsContentManagedIfResctrictableActivity(v20, *(unsigned __int8 *)(a1 + 80));
            if (([*(id *)(a1 + 56) shouldExcludeActivity:v20] & 1) == 0
              && _canPerformActivityWithItems(v20, v10, *(void **)(a1 + 64), v12))
            {
              [*(id *)(a1 + 72) addObject:v20];
            }
          }
          uint64_t v17 = [v15 countByEnumeratingWithState:&v21 objects:v29 count:16];
        }
        while (v17);
      }
    }
  }
}

uint64_t __58___UIActivityHelper__activitiesByApplyingDefaultOrdering___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _defaultOrderingDescriptorForActivity:a2];
}

uint64_t __58___UIActivityHelper__activitiesByApplyingDefaultOrdering___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 activity];
}

@end