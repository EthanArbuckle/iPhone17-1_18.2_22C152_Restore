@interface VCActionDonationFetcher
+ (BOOL)shouldFilterDonationsForAppWithApplicationBundleIdentifier:(id)a3;
+ (BOOL)shouldKeepAction:(id)a3 forAppWithBundleIdentifier:(id)a4 filteringForTopLevel:(BOOL)a5;
+ (BOOL)shouldKeepActionWithAppBundleIdentifierForDisplay:(id)a3;
+ (id)atxClient;
+ (id)donationFromEvent:(id)a3;
+ (id)donationFromEvent:(id)a3 filteringForTopLevel:(BOOL)a4;
+ (id)donationWithUUID:(id)a3;
+ (id)fetchDonationsWithPredicate:(id)a3 limit:(unint64_t)a4 filteringForTopLevel:(BOOL)a5;
+ (id)fetchDonationsWithPredicate:(id)a3 limit:(unint64_t)a4 filteringForTopLevel:(BOOL)a5 directAccess:(BOOL)a6;
+ (id)fetchEventsWithPredicate:(id)a3 limit:(unint64_t)a4;
+ (id)fetchEventsWithPredicate:(id)a3 limit:(unint64_t)a4 directAccess:(BOOL)a5;
+ (id)filterDonations:(id)a3 forApplicationBundleIdentifier:(id)a4;
+ (id)isEligibleForPredictionPredicate;
+ (id)keyPathForStream:(id)a3;
+ (id)predicateForShortcutAvailabilityOptions:(unint64_t)a3;
+ (id)streams;
+ (id)whitelistedDonationsWithOptions:(unint64_t)a3;
+ (void)fetchDonationsForApplicationBundleIdentifier:(id)a3 limit:(unint64_t)a4 filteringForTopLevel:(BOOL)a5 filteringForIsEligibleForPrediction:(BOOL)a6 filteringForRecent:(BOOL)a7 completion:(id)a8;
+ (void)fetchDonationsForApplicationBundleIdentifier:(id)a3 limit:(unint64_t)a4 shortcutAvailability:(unint64_t)a5 completion:(id)a6;
+ (void)fetchDonationsWithLimit:(unint64_t)a3 filteringForIsEligibleForPrediction:(BOOL)a4 completion:(id)a5;
+ (void)getPredicateForIntentsWithApplicationBundleIdentifier:(id)a3 completionHandler:(id)a4;
+ (void)getPredicateForUserActivitiesWithApplicationBundleIdentifier:(id)a3 filteringForIsEligibleForPrediction:(BOOL)a4 completionHandler:(id)a5;
+ (void)sourceAppIdentifierArrayForApplicationBundleIdentifier:(id)a3 completionHandler:(id)a4;
@end

@implementation VCActionDonationFetcher

+ (id)filterDonations:(id)a3 forApplicationBundleIdentifier:(id)a4
{
  id v5 = a4;
  uint64_t v6 = filterDonations_forApplicationBundleIdentifier__onceToken;
  id v7 = a3;
  if (v6 != -1) {
    dispatch_once(&filterDonations_forApplicationBundleIdentifier__onceToken, &__block_literal_global_69);
  }
  char v8 = [(id)filterDonations_forApplicationBundleIdentifier__bundleIdentifiersRequiringDisplayFilter containsObject:v5];
  v9 = (void *)MEMORY[0x1E4F28F60];
  uint64_t v14 = MEMORY[0x1E4F143A8];
  uint64_t v15 = 3221225472;
  v16 = __74__VCActionDonationFetcher_filterDonations_forApplicationBundleIdentifier___block_invoke_2;
  v17 = &unk_1E6077D28;
  char v19 = v8;
  id v18 = v5;
  id v10 = v5;
  v11 = [v9 predicateWithBlock:&v14];
  v12 = objc_msgSend(v7, "filteredArrayUsingPredicate:", v11, v14, v15, v16, v17);

  return v12;
}

uint64_t __74__VCActionDonationFetcher_filterDonations_forApplicationBundleIdentifier___block_invoke_2(uint64_t a1, void *a2)
{
  if (!*(unsigned char *)(a1 + 40)) {
    return 1;
  }
  v3 = [a2 sourceAppIdentifierForDisplay];
  uint64_t v4 = [v3 isEqualToString:*(void *)(a1 + 32)];

  return v4;
}

uint64_t __74__VCActionDonationFetcher_filterDonations_forApplicationBundleIdentifier___block_invoke()
{
  filterDonations_forApplicationBundleIdentifier__bundleIdentifiersRequiringDisplayFilter = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"com.apple.mobilephone", @"com.apple.facetime", @"com.apple.Passbook", @"com.apple.MobileSMS", 0);
  return MEMORY[0x1F41817F8]();
}

+ (BOOL)shouldFilterDonationsForAppWithApplicationBundleIdentifier:(id)a3
{
  return VCIsShortcutsAppBundleIdentifier(a3) ^ 1;
}

+ (id)isEligibleForPredictionPredicate
{
  v2 = (void *)MEMORY[0x1E4F5B5D0];
  v3 = [MEMORY[0x1E4F5B4A8] isEligibleForPrediction];
  uint64_t v4 = [v2 predicateForObjectsWithMetadataKey:v3 andIntegerValue:1];

  return v4;
}

+ (id)donationWithUUID:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [MEMORY[0x1E4F5B5D0] predicateForObjectWithUUID:v4];
  uint64_t v6 = [a1 fetchEventsWithPredicate:v5 limit:1];
  id v7 = [v6 firstObject];

  if (v7)
  {
    char v8 = [v7 stream];
    v9 = [MEMORY[0x1E4F5B5F8] appIntentsStream];
    int v10 = [v8 isEqual:v9];

    if (v10)
    {
      v11 = VCInteractionDonation;
LABEL_8:
      v20 = (void *)[[v11 alloc] initWithEvent:v7];
      goto LABEL_13;
    }
    v17 = [v7 stream];
    id v18 = [MEMORY[0x1E4F5B5F8] appActivityStream];
    int v19 = [v17 isEqual:v18];

    if (v19)
    {
      v11 = VCUserActivityDonation;
      goto LABEL_8;
    }
    v12 = getWFVoiceShortcutClientLogObject();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v13 = [v4 UUIDString];
      int v22 = 136315650;
      v23 = "+[VCActionDonationFetcher donationWithUUID:]";
      __int16 v24 = 2112;
      v25 = v13;
      __int16 v26 = 2112;
      v27 = v7;
      uint64_t v14 = "%s Event with uuid (%@) is not of a supported type: %@";
      uint64_t v15 = v12;
      uint32_t v16 = 32;
      goto LABEL_11;
    }
  }
  else
  {
    v12 = getWFVoiceShortcutClientLogObject();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v13 = [v4 UUIDString];
      int v22 = 136315394;
      v23 = "+[VCActionDonationFetcher donationWithUUID:]";
      __int16 v24 = 2112;
      v25 = v13;
      uint64_t v14 = "%s Event with uuid (%@) not found";
      uint64_t v15 = v12;
      uint32_t v16 = 22;
LABEL_11:
      _os_log_impl(&dword_1B3C5C000, v15, OS_LOG_TYPE_ERROR, v14, (uint8_t *)&v22, v16);
    }
  }

  v20 = 0;
LABEL_13:

  return v20;
}

+ (void)fetchDonationsWithLimit:(unint64_t)a3 filteringForIsEligibleForPrediction:(BOOL)a4 completion:(id)a5
{
}

+ (void)getPredicateForIntentsWithApplicationBundleIdentifier:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __99__VCActionDonationFetcher_getPredicateForIntentsWithApplicationBundleIdentifier_completionHandler___block_invoke;
  v10[3] = &unk_1E6077D00;
  id v11 = v6;
  id v12 = v7;
  id v8 = v6;
  id v9 = v7;
  [a1 sourceAppIdentifierArrayForApplicationBundleIdentifier:v8 completionHandler:v10];
}

void __99__VCActionDonationFetcher_getPredicateForIntentsWithApplicationBundleIdentifier_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = v3;
  if (v3 && [v3 count])
  {
    uint64_t v10 = 0;
    id v11 = &v10;
    uint64_t v12 = 0x3032000000;
    v13 = __Block_byref_object_copy__5643;
    uint64_t v14 = __Block_byref_object_dispose__5644;
    id v15 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __99__VCActionDonationFetcher_getPredicateForIntentsWithApplicationBundleIdentifier_completionHandler___block_invoke_2;
    v9[3] = &unk_1E6077CB0;
    v9[4] = &v10;
    [v4 enumerateObjectsUsingBlock:v9];
    uint64_t v5 = *(void *)(a1 + 40);
    id v6 = [MEMORY[0x1E4F28BA0] orPredicateWithSubpredicates:v11[5]];
    (*(void (**)(uint64_t, void *))(v5 + 16))(v5, v6);

    _Block_object_dispose(&v10, 8);
  }
  else
  {
    uint64_t v7 = *(void *)(a1 + 40);
    id v8 = [MEMORY[0x1E4F5B5D0] predicateForEventsWithSourceID:@"intents" bundleID:*(void *)(a1 + 32)];
    (*(void (**)(uint64_t, void *))(v7 + 16))(v7, v8);
  }
}

uint64_t __99__VCActionDonationFetcher_getPredicateForIntentsWithApplicationBundleIdentifier_completionHandler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = [MEMORY[0x1E4F5B5D0] predicateForEventsWithSourceID:@"intents" bundleID:a2];
  if (v3) {
    [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) addObject:v3];
  }
  return MEMORY[0x1F41817F8]();
}

+ (void)getPredicateForUserActivitiesWithApplicationBundleIdentifier:(id)a3 filteringForIsEligibleForPrediction:(BOOL)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __142__VCActionDonationFetcher_getPredicateForUserActivitiesWithApplicationBundleIdentifier_filteringForIsEligibleForPrediction_completionHandler___block_invoke;
  v12[3] = &unk_1E6077CD8;
  BOOL v16 = a4;
  id v14 = v9;
  id v15 = a1;
  id v13 = v8;
  id v10 = v9;
  id v11 = v8;
  [a1 sourceAppIdentifierArrayForApplicationBundleIdentifier:v11 completionHandler:v12];
}

void __142__VCActionDonationFetcher_getPredicateForUserActivitiesWithApplicationBundleIdentifier_filteringForIsEligibleForPrediction_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  v18[2] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = v3;
  if (v3 && [v3 count])
  {
    uint64_t v12 = 0;
    id v13 = &v12;
    uint64_t v14 = 0x3032000000;
    id v15 = __Block_byref_object_copy__5643;
    BOOL v16 = __Block_byref_object_dispose__5644;
    id v17 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __142__VCActionDonationFetcher_getPredicateForUserActivitiesWithApplicationBundleIdentifier_filteringForIsEligibleForPrediction_completionHandler___block_invoke_2;
    v11[3] = &unk_1E6077CB0;
    v11[4] = &v12;
    [v4 enumerateObjectsUsingBlock:v11];
    uint64_t v5 = [MEMORY[0x1E4F28BA0] orPredicateWithSubpredicates:v13[5]];
    _Block_object_dispose(&v12, 8);
  }
  else
  {
    uint64_t v5 = [MEMORY[0x1E4F5B5D0] predicateForEventsWithStringValue:*(void *)(a1 + 32)];
  }
  if (*(unsigned char *)(a1 + 56)
    && [*(id *)(a1 + 48) shouldFilterDonationsForAppWithApplicationBundleIdentifier:*(void *)(a1 + 32)])
  {
    id v6 = (void *)MEMORY[0x1E4F28BA0];
    v18[0] = v5;
    uint64_t v7 = *(void *)(a1 + 40);
    id v8 = [*(id *)(a1 + 48) isEligibleForPredictionPredicate];
    v18[1] = v8;
    id v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:2];
    id v10 = [v6 andPredicateWithSubpredicates:v9];
    (*(void (**)(uint64_t, void *))(v7 + 16))(v7, v10);
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

uint64_t __142__VCActionDonationFetcher_getPredicateForUserActivitiesWithApplicationBundleIdentifier_filteringForIsEligibleForPrediction_completionHandler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = [MEMORY[0x1E4F5B5D0] predicateForEventsWithStringValue:a2];
  if (v3) {
    [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) addObject:v3];
  }
  return MEMORY[0x1F41817F8]();
}

+ (id)whitelistedDonationsWithOptions:(unint64_t)a3
{
  v60[4] = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_opt_new();
  if (a3)
  {
    v59[0] = @"com.apple.mobilenotes";
    v59[1] = @"com.apple.podcasts";
    v60[0] = &unk_1F0CB18C8;
    v60[1] = &unk_1F0CB18E0;
    v59[2] = @"com.apple.Music";
    v59[3] = @"com.apple.weather";
    v60[2] = &unk_1F0CB18F8;
    v60[3] = &unk_1F0CB1910;
    id v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v60 forKeys:v59 count:4];
    if ((a3 & 2) != 0)
    {
      uint64_t v7 = [MEMORY[0x1E4F5B5D0] predicateForEventsWithBundleID:@"com.apple.mobilenotes"];
      id v8 = (void *)MEMORY[0x1E4F5B5D0];
      id v9 = [MEMORY[0x1E4F5B550] intentClass];
      id v10 = (objc_class *)objc_opt_class();
      id v11 = NSStringFromClass(v10);
      uint64_t v12 = [v8 predicateForObjectsWithMetadataKey:v9 andStringValue:v11];

      id v13 = (void *)MEMORY[0x1E4F28BA0];
      v58[0] = v7;
      v58[1] = v12;
      uint64_t v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v58 count:2];
      id v15 = [v13 andPredicateWithSubpredicates:v14];

      BOOL v16 = (void *)MEMORY[0x1E4F5B5D0];
      id v17 = [MEMORY[0x1E4F5B4A8] activityType];
      id v18 = [v16 predicateForObjectsWithMetadataKey:v17 andStringValue:@"com.apple.notes.activity.edit-note"];

      int v19 = (void *)MEMORY[0x1E4F28BA0];
      v57[0] = v18;
      v57[1] = v7;
      v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:v57 count:2];
      v21 = [v19 andPredicateWithSubpredicates:v20];

      [v5 addObject:v15];
      [v5 addObject:v21];
    }
    if ((a3 & 8) != 0)
    {
      v34 = (void *)MEMORY[0x1E4F5B5D0];
      v35 = [MEMORY[0x1E4F5B550] intentClass];
      v36 = (objc_class *)objc_opt_class();
      v37 = NSStringFromClass(v36);
      v38 = [v34 predicateForObjectsWithMetadataKey:v35 andStringValue:v37];

      v39 = [MEMORY[0x1E4F5B5D0] predicateForEventsWithBundleID:@"com.apple.podcasts"];
      v40 = (void *)MEMORY[0x1E4F28BA0];
      v56[0] = v38;
      v56[1] = v39;
      v41 = [MEMORY[0x1E4F1C978] arrayWithObjects:v56 count:2];
      v42 = [v40 andPredicateWithSubpredicates:v41];

      [v5 addObject:v42];
      if ((a3 & 4) == 0)
      {
LABEL_6:
        if ((a3 & 0x20) == 0)
        {
LABEL_8:
          v29 = [MEMORY[0x1E4F28BA0] orPredicateWithSubpredicates:v5];
          v30 = [a1 fetchDonationsWithPredicate:v29 limit:40 filteringForTopLevel:0 directAccess:0];
          v31 = [v30 array];

          v52[0] = MEMORY[0x1E4F143A8];
          v52[1] = 3221225472;
          v52[2] = __59__VCActionDonationFetcher_whitelistedDonationsWithOptions___block_invoke;
          v52[3] = &unk_1E6077C88;
          id v53 = v6;
          id v32 = v6;
          [v31 enumerateObjectsUsingBlock:v52];

          goto LABEL_10;
        }
LABEL_7:
        int v22 = (void *)MEMORY[0x1E4F5B5D0];
        v23 = [MEMORY[0x1E4F5B550] intentClass];
        __int16 v24 = [v22 predicateForObjectsWithMetadataKey:v23 andStringValue:@"WeatherIntent"];

        v25 = [MEMORY[0x1E4F5B5D0] predicateForEventsWithBundleID:@"com.apple.weather"];
        __int16 v26 = (void *)MEMORY[0x1E4F28BA0];
        v54[0] = v24;
        v54[1] = v25;
        v27 = [MEMORY[0x1E4F1C978] arrayWithObjects:v54 count:2];
        uint64_t v28 = [v26 andPredicateWithSubpredicates:v27];

        [v5 addObject:v28];
        goto LABEL_8;
      }
    }
    else if ((a3 & 4) == 0)
    {
      goto LABEL_6;
    }
    v43 = (void *)MEMORY[0x1E4F5B5D0];
    v44 = [MEMORY[0x1E4F5B550] intentClass];
    v45 = (objc_class *)objc_opt_class();
    v46 = NSStringFromClass(v45);
    v47 = [v43 predicateForObjectsWithMetadataKey:v44 andStringValue:v46];

    v48 = [MEMORY[0x1E4F5B5D0] predicateForEventsWithBundleID:@"com.apple.Music"];
    v49 = (void *)MEMORY[0x1E4F28BA0];
    v55[0] = v47;
    v55[1] = v48;
    v50 = [MEMORY[0x1E4F1C978] arrayWithObjects:v55 count:2];
    v51 = [v49 andPredicateWithSubpredicates:v50];

    [v5 addObject:v51];
    if ((a3 & 0x20) == 0) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
  v31 = (void *)MEMORY[0x1E4F1CBF0];
LABEL_10:

  return v31;
}

uint64_t __59__VCActionDonationFetcher_whitelistedDonationsWithOptions___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  id v13 = v3;
  uint64_t v5 = [v3 sourceAppIdentifier];
  id v6 = [v4 objectForKey:v5];

  if (v6)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      uint64_t v7 = v6;
    }
    else {
      uint64_t v7 = 0;
    }
  }
  else
  {
    uint64_t v7 = 0;
  }
  id v8 = v7;

  uint64_t v9 = [v8 unsignedIntegerValue];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v10 = [v13 interaction];
    id v11 = [v10 intent];
    [v11 setShortcutAvailability:v9];
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_11;
    }
    id v10 = [v13 userActivity];
    [v10 setShortcutAvailability:v9];
  }

LABEL_11:
  return MEMORY[0x1F41817F8]();
}

+ (id)predicateForShortcutAvailabilityOptions:(unint64_t)a3
{
  unint64_t v3 = a3;
  if (a3)
  {
    id v4 = objc_opt_new();
    for (uint64_t i = 0; i != 64; ++i)
    {
      if (((1 << i) & v3) != 0)
      {
        id v6 = (void *)MEMORY[0x1E4F5B5D0];
        uint64_t v7 = [MEMORY[0x1E4F5B550] shortcutAvailability];
        id v8 = [v6 predicateForObjectsWithMetadataKey:v7 andIntegerValue:1 << i];

        uint64_t v9 = (void *)MEMORY[0x1E4F5B5D0];
        id v10 = [MEMORY[0x1E4F5B4A8] shortcutAvailability];
        id v11 = [v9 predicateForObjectsWithMetadataKey:v10 andIntegerValue:1 << i];

        [v4 addObject:v8];
        [v4 addObject:v11];
      }
    }
    unint64_t v3 = [MEMORY[0x1E4F28BA0] orPredicateWithSubpredicates:v4];
  }
  return (id)v3;
}

+ (void)fetchDonationsForApplicationBundleIdentifier:(id)a3 limit:(unint64_t)a4 shortcutAvailability:(unint64_t)a5 completion:(id)a6
{
  id v18 = a3;
  if (a5)
  {
    id v10 = (void (**)(id, void *))a6;
    id v11 = [a1 predicateForShortcutAvailabilityOptions:a5];
    uint64_t v12 = [a1 fetchDonationsWithPredicate:v11 limit:a4 filteringForTopLevel:0 directAccess:0];
    id v13 = [v12 array];

    uint64_t v14 = [a1 whitelistedDonationsWithOptions:a5];
    id v15 = [v13 arrayByAddingObjectsFromArray:v14];
    BOOL v16 = [a1 filterDonations:v15 forApplicationBundleIdentifier:v18];

    v10[2](v10, v16);
  }
  else
  {
    id v17 = (void (*)(void))*((void *)a6 + 2);
    id v11 = a6;
    v17();
  }
}

+ (void)fetchDonationsForApplicationBundleIdentifier:(id)a3 limit:(unint64_t)a4 filteringForTopLevel:(BOOL)a5 filteringForIsEligibleForPrediction:(BOOL)a6 filteringForRecent:(BOOL)a7 completion:(id)a8
{
  BOOL v29 = a6;
  BOOL v32 = a5;
  v65[1] = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v25 = a8;
  __int16 v26 = v10;
  if (v10)
  {
    v65[0] = v10;
    id v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v65 count:1];
  }
  else
  {
    id v11 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v59 = 0u;
    long long v60 = 0u;
    long long v61 = 0u;
    long long v62 = 0u;
    uint64_t v12 = [MEMORY[0x1E4F223C8] enumeratorWithOptions:0];
    uint64_t v13 = [v12 countByEnumeratingWithState:&v59 objects:v64 count:16];
    if (v13)
    {
      uint64_t v14 = *(void *)v60;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v60 != v14) {
            objc_enumerationMutation(v12);
          }
          BOOL v16 = objc_msgSend(*(id *)(*((void *)&v59 + 1) + 8 * i), "bundleIdentifier", v25, v26);
          [v11 addObject:v16];
        }
        uint64_t v13 = [v12 countByEnumeratingWithState:&v59 objects:v64 count:16];
      }
      while (v13);
    }
  }
  v57[0] = 0;
  v57[1] = v57;
  void v57[2] = 0x3032000000;
  v57[3] = __Block_byref_object_copy__5643;
  v57[4] = __Block_byref_object_dispose__5644;
  id v58 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v55[0] = 0;
  v55[1] = v55;
  void v55[2] = 0x3032000000;
  v55[3] = __Block_byref_object_copy__5643;
  v55[4] = __Block_byref_object_dispose__5644;
  id v56 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v30 = objc_alloc_init(MEMORY[0x1E4F28E08]);
  id v31 = objc_alloc_init(MEMORY[0x1E4F28E08]);
  id v17 = dispatch_group_create();
  long long v51 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  obuint64_t j = v11;
  uint64_t v18 = [obj countByEnumeratingWithState:&v51 objects:v63 count:16];
  if (v18)
  {
    uint64_t v19 = *(void *)v52;
    do
    {
      for (uint64_t j = 0; j != v18; ++j)
      {
        if (*(void *)v52 != v19) {
          objc_enumerationMutation(obj);
        }
        v21 = *(void **)(*((void *)&v51 + 1) + 8 * j);
        if ((objc_msgSend(v21, "isEqualToString:", @"com.apple.tv", v25, v26) & 1) == 0)
        {
          if (!v32 || ([v21 hasPrefix:@"com.apple."] & 1) == 0)
          {
            dispatch_group_enter(v17);
            v47[0] = MEMORY[0x1E4F143A8];
            v47[1] = 3221225472;
            v47[2] = __165__VCActionDonationFetcher_fetchDonationsForApplicationBundleIdentifier_limit_filteringForTopLevel_filteringForIsEligibleForPrediction_filteringForRecent_completion___block_invoke;
            v47[3] = &unk_1E6077C30;
            id v48 = v30;
            v50 = v57;
            v49 = v17;
            [a1 getPredicateForUserActivitiesWithApplicationBundleIdentifier:v21 filteringForIsEligibleForPrediction:v29 completionHandler:v47];
          }
          dispatch_group_enter(v17);
          v43[0] = MEMORY[0x1E4F143A8];
          v43[1] = 3221225472;
          v43[2] = __165__VCActionDonationFetcher_fetchDonationsForApplicationBundleIdentifier_limit_filteringForTopLevel_filteringForIsEligibleForPrediction_filteringForRecent_completion___block_invoke_2;
          v43[3] = &unk_1E6077C30;
          id v44 = v31;
          v46 = v55;
          v45 = v17;
          [a1 getPredicateForIntentsWithApplicationBundleIdentifier:v21 completionHandler:v43];
        }
      }
      uint64_t v18 = [obj countByEnumeratingWithState:&v51 objects:v63 count:16];
    }
    while (v18);
  }

  int v22 = dispatch_get_global_queue(2, 0);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __165__VCActionDonationFetcher_fetchDonationsForApplicationBundleIdentifier_limit_filteringForTopLevel_filteringForIsEligibleForPrediction_filteringForRecent_completion___block_invoke_3;
  block[3] = &unk_1E6077C58;
  v37 = v57;
  v38 = v55;
  BOOL v41 = a7;
  id v39 = a1;
  unint64_t v40 = a4;
  BOOL v42 = v32;
  id v35 = v26;
  id v36 = v25;
  id v23 = v25;
  id v24 = v26;
  dispatch_group_notify(v17, v22, block);

  _Block_object_dispose(v55, 8);
  _Block_object_dispose(v57, 8);
}

void __165__VCActionDonationFetcher_fetchDonationsForApplicationBundleIdentifier_limit_filteringForTopLevel_filteringForIsEligibleForPrediction_filteringForRecent_completion___block_invoke(uint64_t a1, void *a2)
{
  unint64_t v3 = *(void **)(a1 + 32);
  id v4 = a2;
  [v3 lock];
  [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) addObject:v4];

  [*(id *)(a1 + 32) unlock];
  uint64_t v5 = *(NSObject **)(a1 + 40);
  dispatch_group_leave(v5);
}

void __165__VCActionDonationFetcher_fetchDonationsForApplicationBundleIdentifier_limit_filteringForTopLevel_filteringForIsEligibleForPrediction_filteringForRecent_completion___block_invoke_2(uint64_t a1, void *a2)
{
  unint64_t v3 = *(void **)(a1 + 32);
  id v4 = a2;
  [v3 lock];
  [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) addObject:v4];

  [*(id *)(a1 + 32) unlock];
  uint64_t v5 = *(NSObject **)(a1 + 40);
  dispatch_group_leave(v5);
}

void __165__VCActionDonationFetcher_fetchDonationsForApplicationBundleIdentifier_limit_filteringForTopLevel_filteringForIsEligibleForPrediction_filteringForRecent_completion___block_invoke_3(uint64_t a1)
{
  v19[2] = *MEMORY[0x1E4F143B8];
  v2 = [MEMORY[0x1E4F28BA0] orPredicateWithSubpredicates:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)];
  unint64_t v3 = [MEMORY[0x1E4F28BA0] orPredicateWithSubpredicates:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40)];
  id v4 = (void *)MEMORY[0x1E4F28BA0];
  v19[0] = v2;
  v19[1] = v3;
  uint64_t v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:2];
  id v6 = [v4 orPredicateWithSubpredicates:v5];

  id v7 = v6;
  id v8 = v7;
  if (*(unsigned char *)(a1 + 80))
  {
    uint64_t v9 = [MEMORY[0x1E4F1C9A8] currentCalendar];
    id v10 = [MEMORY[0x1E4F1C9C8] date];
    id v11 = [v9 dateByAddingUnit:16 value:-7 toDate:v10 options:0];

    uint64_t v12 = [MEMORY[0x1E4F5B5D0] predicateForEventsWithStartDateAfter:v11];
    uint64_t v13 = (void *)MEMORY[0x1E4F28BA0];
    v18[0] = v7;
    v18[1] = v12;
    uint64_t v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:2];
    id v8 = [v13 andPredicateWithSubpredicates:v14];
  }
  id v15 = [*(id *)(a1 + 64) fetchDonationsWithPredicate:v8 limit:*(void *)(a1 + 72) filteringForTopLevel:*(unsigned __int8 *)(a1 + 81)];
  BOOL v16 = [v15 array];

  id v17 = [*(id *)(a1 + 64) filterDonations:v16 forApplicationBundleIdentifier:*(void *)(a1 + 32)];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

+ (id)fetchDonationsWithPredicate:(id)a3 limit:(unint64_t)a4 filteringForTopLevel:(BOOL)a5 directAccess:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v7 = a5;
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = getWFVoiceShortcutClientLogObject();
  os_signpost_id_t v12 = os_signpost_id_generate(v11);

  uint64_t v13 = getWFVoiceShortcutClientLogObject();
  uint64_t v14 = v13;
  unint64_t v35 = v12 - 1;
  if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1B3C5C000, v14, OS_SIGNPOST_INTERVAL_BEGIN, v12, "CoreDuetDonationFetch", "", buf, 2u);
  }
  os_signpost_id_t spid = v12;

  id v36 = v10;
  id v15 = [a1 fetchEventsWithPredicate:v10 limit:a4 directAccess:v6];
  v38 = objc_opt_new();
  id v39 = (id)objc_opt_new();
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  obuint64_t j = v15;
  uint64_t v16 = [obj countByEnumeratingWithState:&v41 objects:v49 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v42;
    uint64_t v19 = &off_1E6076000;
    uint64_t v37 = *(void *)v42;
    do
    {
      for (uint64_t i = 0; i != v17; ++i)
      {
        if (*(void *)v42 != v18) {
          objc_enumerationMutation(obj);
        }
        uint64_t v21 = *(void *)(*((void *)&v41 + 1) + 8 * i);
        int v22 = (void *)MEMORY[0x1B3EC58F0]();
        id v23 = [a1 donationFromEvent:v21 filteringForTopLevel:v7];
        if (v23)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0) {
            goto LABEL_18;
          }
          id v24 = a1;
          BOOL v25 = v7;
          __int16 v26 = v19;
          v27 = [v23 interaction];
          uint64_t v28 = [v27 intent];
          BOOL v29 = [v28 intentId];

          if (![v38 containsObject:v29])
          {
            if (v29) {
              [v38 addObject:v29];
            }

            uint64_t v19 = v26;
            BOOL v7 = v25;
            a1 = v24;
            uint64_t v18 = v37;
LABEL_18:
            [v39 addObject:v23];
            goto LABEL_19;
          }
          id v30 = getWFVoiceShortcutClientLogObject();
          if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 136315394;
            v46 = "+[VCActionDonationFetcher fetchDonationsWithPredicate:limit:filteringForTopLevel:directAccess:]";
            __int16 v47 = 2112;
            id v48 = v29;
            _os_log_impl(&dword_1B3C5C000, v30, OS_LOG_TYPE_INFO, "%s Ignoring duplicate donation for Intent Identifier %@", buf, 0x16u);
          }

          uint64_t v19 = v26;
          BOOL v7 = v25;
          a1 = v24;
          uint64_t v18 = v37;
        }
LABEL_19:
      }
      uint64_t v17 = [obj countByEnumeratingWithState:&v41 objects:v49 count:16];
    }
    while (v17);
  }

  id v31 = getWFVoiceShortcutClientLogObject();
  BOOL v32 = v31;
  if (v35 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v31))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1B3C5C000, v32, OS_SIGNPOST_INTERVAL_END, spid, "CoreDuetDonationFetch", "", buf, 2u);
  }

  return v39;
}

+ (id)fetchDonationsWithPredicate:(id)a3 limit:(unint64_t)a4 filteringForTopLevel:(BOOL)a5
{
  return (id)[a1 fetchDonationsWithPredicate:a3 limit:a4 filteringForTopLevel:a5 directAccess:1];
}

+ (id)fetchEventsWithPredicate:(id)a3 limit:(unint64_t)a4 directAccess:(BOOL)a5
{
  BOOL v5 = a5;
  v38[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  if (!v8)
  {
    uint64_t v9 = (void *)MEMORY[0x1E4F5B5D0];
    id v10 = [MEMORY[0x1E4F1C9C8] distantPast];
    id v11 = [MEMORY[0x1E4F1C9C8] distantFuture];
    id v8 = [v9 predicateForEventsWithEndInDateRangeFrom:v10 to:v11];
  }
  os_signpost_id_t v12 = getWFVoiceShortcutClientLogObject();
  os_signpost_id_t v13 = os_signpost_id_generate(v12);

  uint64_t v14 = getWFVoiceShortcutClientLogObject();
  id v15 = v14;
  if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1B3C5C000, v15, OS_SIGNPOST_INTERVAL_BEGIN, v13, "CoreDuetEventFetch", "", buf, 2u);
  }

  uint64_t v16 = (void *)MEMORY[0x1E4F5B518];
  uint64_t v17 = [a1 streams];
  uint64_t v18 = [MEMORY[0x1E4F5B5D0] startDateSortDescriptorAscending:0];
  v38[0] = v18;
  uint64_t v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v38 count:1];
  v20 = [v16 eventQueryWithPredicate:v8 eventStreams:v17 offset:0 limit:a4 sortDescriptors:v19];

  if (v5)
  {
    uint64_t v21 = [MEMORY[0x1E4F5B560] knowledgeStoreWithDirectReadOnlyAccess];
    int v22 = v21;
    uint64_t v33 = 0;
    id v23 = (id *)&v33;
    id v24 = &v33;
  }
  else
  {
    uint64_t v21 = [MEMORY[0x1E4F5B560] knowledgeStore];
    int v22 = v21;
    uint64_t v32 = 0;
    id v23 = (id *)&v32;
    id v24 = &v32;
  }
  BOOL v25 = objc_msgSend(v21, "executeQuery:error:", v20, v24, v32, v33);
  id v26 = *v23;

  v27 = getWFVoiceShortcutClientLogObject();
  uint64_t v28 = v27;
  if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v27))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1B3C5C000, v28, OS_SIGNPOST_INTERVAL_END, v13, "CoreDuetEventFetch", "", buf, 2u);
  }

  if (v25)
  {
    id v29 = v25;
  }
  else
  {
    id v30 = getWFVoiceShortcutClientLogObject();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      unint64_t v35 = "+[VCActionDonationFetcher fetchEventsWithPredicate:limit:directAccess:]";
      __int16 v36 = 2112;
      id v37 = v26;
      _os_log_impl(&dword_1B3C5C000, v30, OS_LOG_TYPE_ERROR, "%s Failed to execute CoreDuet query: %@", buf, 0x16u);
    }
  }
  return v25;
}

+ (id)fetchEventsWithPredicate:(id)a3 limit:(unint64_t)a4
{
  return (id)[a1 fetchEventsWithPredicate:a3 limit:a4 directAccess:1];
}

+ (id)keyPathForStream:(id)a3
{
  id v3 = a3;
  id v4 = [MEMORY[0x1E4F5B5F8] appIntentsStream];
  int v5 = [v3 isEqual:v4];

  if (v5)
  {
    uint64_t v6 = [MEMORY[0x1E4F5B6B8] keyPathForIntentsDataDictionary];
LABEL_5:
    uint64_t v9 = (void *)v6;
    goto LABEL_7;
  }
  BOOL v7 = [MEMORY[0x1E4F5B5F8] appActivityStream];
  int v8 = [v3 isEqual:v7];

  if (v8)
  {
    uint64_t v6 = [MEMORY[0x1E4F5B6B8] keyPathForUserActivityDataDictionary];
    goto LABEL_5;
  }
  uint64_t v9 = 0;
LABEL_7:

  return v9;
}

+ (BOOL)shouldKeepActionWithAppBundleIdentifierForDisplay:(id)a3
{
  id v4 = a3;
  int v5 = [a1 atxClient];
  char v6 = [v5 shouldPredictBundleIdForShortcuts:v4 action:@"_"];

  return v6;
}

+ (BOOL)shouldKeepAction:(id)a3 forAppWithBundleIdentifier:(id)a4 filteringForTopLevel:(BOOL)a5
{
  uint64_t v5 = a5;
  id v8 = a4;
  id v9 = a3;
  id v10 = [a1 atxClient];
  char v11 = [v10 shouldPredictAppBundleId:v8];

  os_signpost_id_t v12 = [a1 atxClient];
  LOBYTE(v5) = [v12 shouldPredictBundleIdForShortcuts:v8 action:v9 forPrimaryShortcuts:v5];

  return v11 & v5;
}

+ (id)atxClient
{
  if (atxClient_onceToken != -1) {
    dispatch_once(&atxClient_onceToken, &__block_literal_global_5691);
  }
  v2 = (void *)atxClient_client;
  return v2;
}

uint64_t __36__VCActionDonationFetcher_atxClient__block_invoke()
{
  atxClient_client = [(Class)getATXClientClass[0]() clientForConsumerType:13];
  return MEMORY[0x1F41817F8]();
}

+ (id)donationFromEvent:(id)a3 filteringForTopLevel:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  BOOL v7 = [v6 stream];
  id v8 = [MEMORY[0x1E4F5B5F8] appIntentsStream];
  int v9 = [v7 isEqual:v8];

  if (v9)
  {
    id v10 = [[VCInteractionDonation alloc] initWithEvent:v6];
    char v11 = [(VCInteractionDonation *)v10 sourceAppIdentifierForDisplay];
    int v12 = [a1 shouldKeepActionWithAppBundleIdentifierForDisplay:v11];

    if (v12)
    {
      os_signpost_id_t v13 = [(VCInteractionDonation *)v10 interaction];
      uint64_t v14 = [v13 intent];

      id v15 = [v6 metadata];
      uint64_t v16 = [MEMORY[0x1E4F5B550] intentClass];
      uint64_t v17 = [v15 objectForKeyedSubscript:v16];

      uint64_t v18 = [v6 source];
      uint64_t v19 = [v18 bundleID];

      v20 = (void *)MEMORY[0x1E4F1CAD0];
      uint64_t v21 = [a1 atxClient];
      int v22 = [v21 approvedSiriKitIntents];
      id v23 = [v20 setWithArray:v22];

      if (([v14 _type] == 2 || objc_msgSend(v23, "containsObject:", v17))
        && [a1 shouldKeepAction:v17 forAppWithBundleIdentifier:v19 filteringForTopLevel:v4]&& (-[VCInteractionDonation interaction](v10, "interaction"), id v24 = objc_claimAutoreleasedReturnValue(), v25 = objc_msgSend(v24, "direction"), v24, v25 != 2))
      {
        objc_opt_class();
        char isKindOfClass = objc_opt_isKindOfClass();
        id v26 = 0;
        if (([v14 isGenericIntent] & 1) == 0 && (isKindOfClass & 1) == 0) {
          id v26 = v10;
        }
      }
      else
      {
        id v26 = 0;
      }

      goto LABEL_9;
    }
    goto LABEL_14;
  }
  v27 = [v6 stream];
  uint64_t v28 = [MEMORY[0x1E4F5B5F8] appActivityStream];
  int v29 = [v27 isEqual:v28];

  if (v29)
  {
    id v10 = [[VCUserActivityDonation alloc] initWithEvent:v6];
    id v30 = [(VCInteractionDonation *)v10 sourceAppIdentifierForDisplay];
    int v31 = [a1 shouldKeepActionWithAppBundleIdentifierForDisplay:v30];

    if (v31)
    {
      uint64_t v14 = [(VCInteractionDonation *)v10 userActivity];
      uint64_t v32 = [v6 value];
      uint64_t v17 = [v32 stringValue];

      uint64_t v19 = [v14 activityType];
      if ([a1 shouldKeepAction:v19 forAppWithBundleIdentifier:v17 filteringForTopLevel:v4])
      {
        id v10 = v10;
        id v26 = v10;
      }
      else
      {
        id v26 = 0;
      }
LABEL_9:

LABEL_15:
      goto LABEL_17;
    }
LABEL_14:
    id v26 = 0;
    goto LABEL_15;
  }
  id v26 = 0;
LABEL_17:

  return v26;
}

+ (id)donationFromEvent:(id)a3
{
  return (id)[a1 donationFromEvent:a3 filteringForTopLevel:0];
}

+ (id)streams
{
  v6[2] = *MEMORY[0x1E4F143B8];
  v2 = [MEMORY[0x1E4F5B5F8] appIntentsStream];
  v6[0] = v2;
  id v3 = [MEMORY[0x1E4F5B5F8] appActivityStream];
  v6[1] = v3;
  BOOL v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:2];

  return v4;
}

+ (void)sourceAppIdentifierArrayForApplicationBundleIdentifier:(id)a3 completionHandler:(id)a4
{
  v17[2] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = (void (**)(id, void *))a4;
  if (([v5 isEqualToString:@"com.apple.mobilephone"] & 1) != 0
    || [v5 isEqualToString:@"com.apple.facetime"])
  {
    v6[2](v6, &unk_1F0CB1D78);
  }
  else if ([v5 isEqualToString:@"com.apple.Passbook"])
  {
    v17[0] = @"com.apple.Passbook";
    v17[1] = @"com.apple.MobileSMS";
    BOOL v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:2];
    v6[2](v6, v7);
  }
  else if ([v5 isEqualToString:@"com.apple.DocumentsApp"])
  {
    id v8 = (void *)MEMORY[0x1E4F28C70];
    uint64_t v9 = *MEMORY[0x1E4F282B0];
    uint64_t v14 = @"com.apple.fileprovider-nonui";
    uint64_t v15 = v9;
    id v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v14 count:1];
    uint64_t v16 = v10;
    char v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v16 forKeys:&v15 count:1];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __100__VCActionDonationFetcher_sourceAppIdentifierArrayForApplicationBundleIdentifier_completionHandler___block_invoke;
    v12[3] = &unk_1E6079698;
    os_signpost_id_t v13 = v6;
    [v8 extensionsWithMatchingAttributes:v11 completion:v12];
  }
  else
  {
    v6[2](v6, 0);
  }
}

void __100__VCActionDonationFetcher_sourceAppIdentifierArrayForApplicationBundleIdentifier_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  if ([v4 count])
  {
    id v3 = [v4 valueForKey:@"identifier"];
  }
  else
  {
    id v3 = 0;
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

@end