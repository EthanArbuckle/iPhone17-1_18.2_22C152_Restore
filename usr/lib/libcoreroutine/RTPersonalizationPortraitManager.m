@interface RTPersonalizationPortraitManager
- (RTPersonalizationPortraitManager)init;
- (void)_fetchRecentLocationDonationsSince:(id)a3 handler:(id)a4;
- (void)_shutdownWithHandler:(id)a3;
- (void)feedbackUsedNamedEntities:(id)a3;
- (void)fetchLocationNamesStartDate:(id)a3 endDate:(id)a4 handler:(id)a5;
- (void)fetchRecentLocationDonationsSince:(id)a3 handler:(id)a4;
@end

@implementation RTPersonalizationPortraitManager

- (RTPersonalizationPortraitManager)init
{
  v3.receiver = self;
  v3.super_class = (Class)RTPersonalizationPortraitManager;
  return [(RTNotifier *)&v3 init];
}

- (void)_shutdownWithHandler:(id)a3
{
  if (a3) {
    (*((void (**)(id, void))a3 + 2))(a3, 0);
  }
}

- (void)_fetchRecentLocationDonationsSince:(id)a3 handler:(id)a4
{
  v19[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v6 = (void (**)(id, id, id))a4;
  if (v6)
  {
    if (v5)
    {
      v7 = objc_opt_new();
      v8 = objc_opt_new();
      v9 = [MEMORY[0x1E4F28B50] _coreroutineBundle];
      v10 = [v9 bundleIdentifier];
      id v16 = v7;
      id v17 = 0;
      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3221225472;
      v15[2] = __79__RTPersonalizationPortraitManager__fetchRecentLocationDonationsSince_handler___block_invoke;
      v15[3] = &unk_1E6B962A8;
      id v11 = v7;
      [v8 iterRecentLocationDonationsSinceDate:v5 client:v10 error:&v17 block:v15];
      id v12 = v17;

      v6[2](v6, v11, v12);
    }
    else
    {
      v13 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v14 = *MEMORY[0x1E4F5CFE8];
      uint64_t v18 = *MEMORY[0x1E4F28568];
      v19[0] = @"requires a valid date.";
      id v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:&v18 count:1];
      v8 = [v13 errorWithDomain:v14 code:7 userInfo:v11];
      v6[2](v6, 0, v8);
    }
  }
}

void __79__RTPersonalizationPortraitManager__fetchRecentLocationDonationsSince_handler___block_invoke(uint64_t a1, void *a2)
{
  id v21 = a2;
  objc_super v3 = [v21 createdAt];
  v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    id v5 = [MEMORY[0x1E4F1C9C8] date];
  }
  v6 = v5;

  v7 = [v21 latitude];
  if (v7)
  {
    v8 = [v21 longitude];

    if (v8)
    {
      id v9 = objc_alloc(MEMORY[0x1E4F5CE00]);
      v10 = [v21 latitude];
      [v10 doubleValue];
      double v12 = v11;
      v13 = [v21 longitude];
      [v13 doubleValue];
      v7 = (void *)[v9 initWithLatitude:v6 longitude:v12 horizontalUncertainty:v14 date:1.0];
    }
    else
    {
      v7 = 0;
    }
  }
  v15 = [RTConnectionsLocation alloc];
  id v16 = [v21 name];
  id v17 = [v21 originatingBundleID];
  uint64_t v18 = [v21 fullFormattedAddress];
  v19 = [v21 mapItemURL];
  v20 = [(RTConnectionsLocation *)v15 initWithLocation:v7 name:v16 originatingBundleID:v17 fullFormattedAddress:v18 mapItemURL:v19 createdAt:v6];

  [*(id *)(a1 + 32) addObject:v20];
}

- (void)fetchRecentLocationDonationsSince:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(RTNotifier *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __78__RTPersonalizationPortraitManager_fetchRecentLocationDonationsSince_handler___block_invoke;
  block[3] = &unk_1E6B90660;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

uint64_t __78__RTPersonalizationPortraitManager_fetchRecentLocationDonationsSince_handler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _fetchRecentLocationDonationsSince:*(void *)(a1 + 40) handler:*(void *)(a1 + 48)];
}

- (void)fetchLocationNamesStartDate:(id)a3 endDate:(id)a4 handler:(id)a5
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v10)
  {
    double v11 = [(RTNotifier *)self queue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __80__RTPersonalizationPortraitManager_fetchLocationNamesStartDate_endDate_handler___block_invoke;
    block[3] = &unk_1E6B90660;
    double v14 = v8;
    id v15 = v9;
    id v16 = v10;
    dispatch_async(v11, block);

    id v12 = v14;
  }
  else
  {
    id v12 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      uint64_t v18 = "-[RTPersonalizationPortraitManager fetchLocationNamesStartDate:endDate:handler:]";
      __int16 v19 = 1024;
      int v20 = 116;
      _os_log_error_impl(&dword_1D9BFA000, v12, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler (in %s:%d)", buf, 0x12u);
    }
  }
}

void __80__RTPersonalizationPortraitManager_fetchLocationNamesStartDate_endDate_handler___block_invoke(void *a1)
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1E4F1CAD0];
  objc_super v3 = [MEMORY[0x1E4F28B50] _coreroutineBundle];
  v4 = [v3 bundleIdentifier];
  v30 = [v2 setWithObjects:v4, @"com.apple.Maps", 0];

  v28 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:[unk_1F3453060 count]];
  v29 = objc_opt_new();
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  uint64_t v5 = [&unk_1F3453060 countByEnumeratingWithState:&v32 objects:v37 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v33;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v33 != v7) {
          objc_enumerationMutation(&unk_1F3453060);
        }
        uint64_t v9 = *(void *)(*((void *)&v32 + 1) + 8 * i);
        id v10 = objc_opt_new();
        [v10 setLimit:-1];
        [v10 setMatchCategory:1];
        double v11 = [MEMORY[0x1E4F1CAD0] setWithObject:v9];
        [v10 setMatchingCategories:v11];

        [v10 setExcludingSourceBundleIds:v30];
        [v10 setFromDate:a1[4]];
        [v10 setToDate:a1[5]];
        id v12 = objc_opt_new();
        id v31 = 0;
        id v13 = [v12 rankedNamedEntitiesWithQuery:v10 error:&v31];
        id v14 = v31;

        id v15 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_51];
        id v16 = [v13 filteredArrayUsingPredicate:v15];

        id v17 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"score" ascending:0];
        v36 = v17;
        uint64_t v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v36 count:1];
        __int16 v19 = [v16 sortedArrayUsingDescriptors:v18];

        unint64_t v20 = [v19 count];
        if (v20 >= 3) {
          uint64_t v21 = 3;
        }
        else {
          uint64_t v21 = v20;
        }
        v22 = [v19 subarrayWithRange:0, v21];

        v23 = [[_RTMap alloc] initWithInput:v22];
        v24 = [(_RTMap *)v23 withBlock:&__block_literal_global_28];

        [v29 addObjectsFromArray:v24];
        if (v14) {
          [v28 addObject:v14];
        }
      }
      uint64_t v6 = [&unk_1F3453060 countByEnumeratingWithState:&v32 objects:v37 count:16];
    }
    while (v6);
  }
  uint64_t v25 = a1[6];
  v26 = _RTSafeArray();
  v27 = _RTMultiErrorCreate();
  (*(void (**)(uint64_t, void *, void *))(v25 + 16))(v25, v29, v27);
}

BOOL __80__RTPersonalizationPortraitManager_fetchLocationNamesStartDate_endDate_handler___block_invoke_18(uint64_t a1, void *a2)
{
  v2 = [a2 item];
  objc_super v3 = [v2 name];
  BOOL v4 = v3 != 0;

  return v4;
}

id __80__RTPersonalizationPortraitManager_fetchLocationNamesStartDate_endDate_handler___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_super v3 = [v2 item];
  BOOL v4 = [v3 name];
  if ([v4 length])
  {
    uint64_t v5 = [v2 item];
    uint64_t v6 = [v5 name];
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

- (void)feedbackUsedNamedEntities:(id)a3
{
  id v4 = a3;
  if ([v4 count])
  {
    uint64_t v5 = [(RTNotifier *)self queue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __62__RTPersonalizationPortraitManager_feedbackUsedNamedEntities___block_invoke;
    block[3] = &unk_1E6B90E70;
    id v7 = v4;
    dispatch_async(v5, block);
  }
}

void __62__RTPersonalizationPortraitManager_feedbackUsedNamedEntities___block_invoke(uint64_t a1)
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x3032000000;
  id v8 = __Block_byref_object_copy__67;
  uint64_t v9 = __Block_byref_object_dispose__67;
  id v10 = (id)objc_opt_new();
  [(id)v6[5] setClientIdentifier:@"rt-lbl"];
  id v2 = (void *)[objc_alloc(MEMORY[0x1E4F89E28]) initWithExplicitlyEngagedStrings:*(void *)(a1 + 32) explicitlyRejectedStrings:0 implicitlyEngagedStrings:0 implicitlyRejectedStrings:0];
  objc_super v3 = (void *)v6[5];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __62__RTPersonalizationPortraitManager_feedbackUsedNamedEntities___block_invoke_33;
  v4[3] = &unk_1E6B96310;
  v4[4] = &v5;
  [v3 registerFeedback:v2 completion:v4];

  _Block_object_dispose(&v5, 8);
}

void __62__RTPersonalizationPortraitManager_feedbackUsedNamedEntities___block_invoke_33(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 32) + 8);
  id v2 = *(void **)(v1 + 40);
  *(void *)(v1 + 40) = 0;
}

@end