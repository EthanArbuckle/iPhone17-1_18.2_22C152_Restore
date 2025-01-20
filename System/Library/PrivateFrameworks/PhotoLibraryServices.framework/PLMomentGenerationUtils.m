@interface PLMomentGenerationUtils
+ (BOOL)isTopFrequentLocationForCoordinate:(CLLocationCoordinate2D)a3 startDate:(id)a4 endDate:(id)a5 frequentLocations:(id)a6;
+ (BOOL)isTopFrequentLocationForMoment:(id)a3 frequentLocations:(id)a4;
+ (BOOL)shouldConsiderAssetAsOutlierForMomentClustering:(id)a3;
+ (id)_sortedOverlappingFrequentLocations:(id)a3;
+ (id)frequentLocationNearMoment:(id)a3 withFrequentLocations:(id)a4;
+ (id)frequentLocationsOverlappingStartDate:(id)a3 endDate:(id)a4 frequentLocations:(id)a5;
+ (id)importedByBundleIdentifiersAllowListForMomentGeneration;
+ (id)importedByBundleIdentifiersToIncludeIfNotProcessed;
+ (id)internalPredicateToIncludeExternalAssetsEligibleForProcessing;
+ (id)today;
+ (signed)externalOriginatorStateForAsset:(id)a3;
+ (signed)originatorStateForAsset:(id)a3;
+ (unsigned)_locationTypeForLocation:(id)a3 horizontalAccuracy:(double)a4 startDate:(id)a5 endDate:(id)a6 locationsOfInterest:(id)a7 frequentLocations:(id)a8;
+ (unsigned)locationTypeForAsset:(id)a3 locationsOfInterest:(id)a4 frequentLocations:(id)a5;
+ (unsigned)locationTypeForMoment:(id)a3 locationsOfInterest:(id)a4 frequentLocations:(id)a5;
+ (void)overrideTodayWithDate:(id)a3;
+ (void)processLocationIfNecessaryInMoment:(id)a3 usingManager:(id)a4 frequentLocations:(id)a5 frequentLocationsDidChange:(BOOL)a6;
@end

@implementation PLMomentGenerationUtils

+ (void)overrideTodayWithDate:(id)a3
{
}

+ (id)today
{
  if (PLMomentGenerationUtilsOverridenToday)
  {
    id v2 = (id)PLMomentGenerationUtilsOverridenToday;
  }
  else
  {
    id v2 = [MEMORY[0x1E4F1C9C8] date];
  }
  return v2;
}

+ (id)internalPredicateToIncludeExternalAssetsEligibleForProcessing
{
  v12[4] = *MEMORY[0x1E4F143B8];
  id v2 = (void *)MEMORY[0x1E4F28F60];
  v3 = +[PLMomentGenerationUtils importedByBundleIdentifiersAllowListForMomentGeneration];
  v4 = [v2 predicateWithFormat:@"%K != nil && NOT %K IN %@", @"additionalAttributes.importedByBundleIdentifier", @"additionalAttributes.importedByBundleIdentifier", v3];

  v5 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K = %d", @"additionalAttributes.syndicationHistory", 1);
  v6 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"kindSubtype = %d", 10);
  v7 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"kindSubtype = %d", 103);
  v8 = (void *)MEMORY[0x1E4F28BA0];
  v12[0] = v4;
  v12[1] = v5;
  v12[2] = v6;
  v12[3] = v7;
  v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:4];
  v10 = [v8 orPredicateWithSubpredicates:v9];

  return v10;
}

+ (id)importedByBundleIdentifiersAllowListForMomentGeneration
{
  if (importedByBundleIdentifiersAllowListForMomentGeneration_onceToken != -1) {
    dispatch_once(&importedByBundleIdentifiersAllowListForMomentGeneration_onceToken, &__block_literal_global_51_117327);
  }
  id v2 = (void *)importedByBundleIdentifiersAllowListForMomentGeneration_allowList;
  return v2;
}

void __82__PLMomentGenerationUtils_importedByBundleIdentifiersAllowListForMomentGeneration__block_invoke()
{
  v6[6] = *MEMORY[0x1E4F143B8];
  v6[0] = @"com.apple.mobileslideshow";
  v6[1] = @"com.apple.Photos";
  v6[2] = @"com.apple.camera.CameraMessagesApp";
  v6[3] = @"com.apple.share.System.add-to-iphoto";
  v6[4] = @"com.apple.camera";
  v6[5] = @"com.apple.camera.lockscreen";
  v0 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:6];
  if (MEMORY[0x19F38BDA0]())
  {
    v5[0] = @"com.apple.PhotoKitEntitledTests.xctrunner";
    v5[1] = @"com.apple.photosgraph.tests.xctrunner";
    v5[2] = @"com.apple.photosctl";
    v5[3] = @"com.apple.plphotosctl";
    v5[4] = @"com.apple.PhotosIntelligenceTests.xctrunner";
    v1 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:5];
    uint64_t v2 = [v0 arrayByAddingObjectsFromArray:v1];

    v0 = (void *)v2;
  }
  uint64_t v3 = [objc_alloc(MEMORY[0x1E4F1CAD0]) initWithArray:v0];
  v4 = (void *)importedByBundleIdentifiersAllowListForMomentGeneration_allowList;
  importedByBundleIdentifiersAllowListForMomentGeneration_allowList = v3;
}

+ (id)importedByBundleIdentifiersToIncludeIfNotProcessed
{
  if (importedByBundleIdentifiersToIncludeIfNotProcessed_onceToken != -1) {
    dispatch_once(&importedByBundleIdentifiersToIncludeIfNotProcessed_onceToken, &__block_literal_global_48_117345);
  }
  uint64_t v2 = (void *)importedByBundleIdentifiersToIncludeIfNotProcessed_allowList;
  return v2;
}

void __77__PLMomentGenerationUtils_importedByBundleIdentifiersToIncludeIfNotProcessed__block_invoke()
{
  uint64_t v0 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", @"com.apple.MobileSMS", @"com.apple.sharingd", 0);
  v1 = (void *)importedByBundleIdentifiersToIncludeIfNotProcessed_allowList;
  importedByBundleIdentifiersToIncludeIfNotProcessed_allowList = v0;
}

+ (signed)externalOriginatorStateForAsset:(id)a3
{
  id v4 = a3;
  if (([v4 syndicationProcessingValue] & 0x3CF1) == 0)
  {
    v6 = [a1 importedByBundleIdentifiersToIncludeIfNotProcessed];
    v7 = [v4 importedByBundleIdentifier];
    if ([v6 containsObject:v7])
    {
      uint64_t v8 = [v4 syndicationProcessingVersion];

      if (!v8)
      {
        signed __int16 v5 = 16;
        goto LABEL_8;
      }
    }
    else
    {
    }
    signed __int16 v5 = 8;
    goto LABEL_8;
  }
  signed __int16 v5 = 0;
LABEL_8:

  return v5;
}

+ (BOOL)shouldConsiderAssetAsOutlierForMomentClustering:(id)a3
{
  id v4 = a3;
  if (([v4 isScreenRecording] & 1) != 0 || objc_msgSend(v4, "kindSubtype") == 10)
  {
    char v5 = 1;
  }
  else
  {
    [MEMORY[0x1E4F8BA10] maskForGuestAsset];
    [v4 savedAssetType];
    if ((PLValidatedSavedAssetTypeApplies() & 1) != 0 || [v4 syndicationHistory])
    {
      char v5 = ([v4 syndicationProcessingValue] & 0x3CF1) == 0;
    }
    else
    {
      v7 = [v4 importedByBundleIdentifier];
      if (v7)
      {
        uint64_t v8 = [a1 importedByBundleIdentifiersAllowListForMomentGeneration];
        char v9 = [v8 containsObject:v7];

        char v5 = v9 ^ 1;
      }
      else
      {
        char v5 = 0;
      }
    }
  }

  return v5;
}

+ (signed)originatorStateForAsset:(id)a3
{
  id v4 = a3;
  unsigned int v5 = [v4 shareState];
  if (v5 >= 3) {
    signed __int16 v6 = 0;
  }
  else {
    signed __int16 v6 = 0x400020001uLL >> (16 * v5);
  }
  if (_os_feature_enabled_impl()
    && [a1 shouldConsiderAssetAsOutlierForMomentClustering:v4])
  {
    v6 |= [a1 externalOriginatorStateForAsset:v4];
  }

  return v6;
}

+ (id)frequentLocationNearMoment:(id)a3 withFrequentLocations:(id)a4
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v6 startDate];
  char v9 = [v6 endDate];
  v28 = v7;
  v10 = [a1 frequentLocationsOverlappingStartDate:v8 endDate:v9 frequentLocations:v7];

  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v11 = v10;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v29 objects:v33 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    v14 = 0;
    uint64_t v15 = *(void *)v30;
    double v16 = 1.79769313e308;
    while (2)
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v30 != v15) {
          objc_enumerationMutation(v11);
        }
        v18 = *(void **)(*((void *)&v29 + 1) + 8 * i);
        v19 = (void *)MEMORY[0x19F38D3B0]();
        v20 = [v18 momentsSet];
        int v21 = [v20 containsObject:v6];

        if (v21)
        {
          id v26 = v18;

          v14 = v26;
          goto LABEL_15;
        }
        [v18 coordinate];
        v22 = [v6 approximateLocation];
        [v22 coordinate];

        CLLocationCoordinate2DGetDistanceFrom();
        if (v23 < v16)
        {
          double v24 = v23;
          if (v23 < 100.0)
          {
            id v25 = v18;

            double v16 = v24;
            v14 = v25;
          }
        }
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v29 objects:v33 count:16];
      if (v13) {
        continue;
      }
      break;
    }
  }
  else
  {
    v14 = 0;
  }
LABEL_15:

  return v14;
}

+ (id)frequentLocationsOverlappingStartDate:(id)a3 endDate:(id)a4 frequentLocations:(id)a5
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  int v21 = v7;
  v10 = (void *)[objc_alloc(MEMORY[0x1E4F28C18]) initWithStartDate:v7 endDate:v8];
  id v11 = [MEMORY[0x1E4F1CA80] set];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v12 = v9;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v23 != v15) {
          objc_enumerationMutation(v12);
        }
        v17 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        v18 = [v17 dateInterval];
        int v19 = [v10 intersectsDateInterval:v18];

        if (v19) {
          [v11 addObject:v17];
        }
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v14);
  }

  return v11;
}

+ (id)_sortedOverlappingFrequentLocations:(id)a3
{
  uint64_t v3 = [a3 allObjects];
  id v4 = [v3 sortedArrayUsingComparator:&__block_literal_global_117352];

  return v4;
}

uint64_t __63__PLMomentGenerationUtils__sortedOverlappingFrequentLocations___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  id v6 = [v4 sortedMoments];
  unint64_t v7 = [v6 count];

  id v8 = [v5 sortedMoments];
  unint64_t v9 = [v8 count];

  if (v7 > v9) {
    goto LABEL_4;
  }
  if (v9 > v7)
  {
LABEL_6:
    uint64_t v16 = 1;
    goto LABEL_7;
  }
  v10 = [v4 dateInterval];
  [v10 duration];
  double v12 = v11;

  uint64_t v13 = [v5 dateInterval];
  [v13 duration];
  double v15 = v14;

  if (v12 <= v15)
  {
    if (v15 <= v12)
    {
      v18 = [v5 dateInterval];
      int v19 = [v18 startDate];
      v20 = [v4 dateInterval];
      int v21 = [v20 startDate];
      uint64_t v16 = [v19 compare:v21];

      goto LABEL_7;
    }
    goto LABEL_6;
  }
LABEL_4:
  uint64_t v16 = -1;
LABEL_7:

  return v16;
}

+ (BOOL)isTopFrequentLocationForCoordinate:(CLLocationCoordinate2D)a3 startDate:(id)a4 endDate:(id)a5 frequentLocations:(id)a6
{
  double longitude = a3.longitude;
  double latitude = a3.latitude;
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  unint64_t v9 = [a1 frequentLocationsOverlappingStartDate:a4 endDate:a5 frequentLocations:a6];
  v10 = [a1 _sortedOverlappingFrequentLocations:v9];
  unint64_t v11 = [v10 count];
  if (v11 >= 2) {
    uint64_t v12 = 2;
  }
  else {
    uint64_t v12 = v11;
  }
  objc_msgSend(v10, "subarrayWithRange:", 0, v12);
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v13 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v14 = [v13 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v14)
  {
    uint64_t v15 = *(void *)v19;
    while (2)
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v19 != v15) {
          objc_enumerationMutation(v13);
        }
        if (objc_msgSend(*(id *)(*((void *)&v18 + 1) + 8 * i), "isWithinDistance:toCoordinate:", 100.0, latitude, longitude, (void)v18))
        {
          LOBYTE(v14) = 1;
          goto LABEL_14;
        }
      }
      uint64_t v14 = [v13 countByEnumeratingWithState:&v18 objects:v22 count:16];
      if (v14) {
        continue;
      }
      break;
    }
  }
LABEL_14:

  return v14;
}

+ (BOOL)isTopFrequentLocationForMoment:(id)a3 frequentLocations:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  objc_msgSend(v7, "pl_coordinate");
  double v9 = v8;
  double v11 = v10;
  uint64_t v12 = [v7 startDate];
  id v13 = [v7 endDate];

  LOBYTE(v7) = objc_msgSend(a1, "isTopFrequentLocationForCoordinate:startDate:endDate:frequentLocations:", v12, v13, v6, v9, v11);
  return (char)v7;
}

+ (unsigned)_locationTypeForLocation:(id)a3 horizontalAccuracy:(double)a4 startDate:(id)a5 endDate:(id)a6 locationsOfInterest:(id)a7 frequentLocations:(id)a8
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  id v18 = a8;
  if (!v14)
  {
    unsigned __int16 v19 = 2;
    goto LABEL_39;
  }
  if (+[PLLocationUtils horizontalAccuracyIsCoarse:a4])
  {
    unsigned __int16 v19 = 7;
    goto LABEL_39;
  }
  if (!v17)
  {
    unsigned __int16 v19 = 8;
    goto LABEL_28;
  }
  id v38 = a1;
  long long v41 = 0u;
  long long v42 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  id v20 = v17;
  uint64_t v21 = [v20 countByEnumeratingWithState:&v39 objects:v43 count:16];
  if (!v21)
  {

    unsigned __int16 v19 = 6;
    a1 = v38;
    if (v18) {
      goto LABEL_29;
    }
    goto LABEL_36;
  }
  uint64_t v22 = v21;
  id v35 = v18;
  id v36 = v16;
  id v37 = v15;
  double v23 = *MEMORY[0x1E4F1E568];
  uint64_t v24 = *(void *)v40;
  char v25 = 1;
  unsigned __int16 v19 = 6;
  do
  {
    for (uint64_t i = 0; i != v22; ++i)
    {
      if (*(void *)v40 != v24) {
        objc_enumerationMutation(v20);
      }
      uint64_t v27 = *(void **)(*((void *)&v39 + 1) + 8 * i);
      objc_msgSend(v27, "distanceFromLocation:", v14, v35, v36, v37);
      double v29 = v28;
      if (v28 <= 50.0 && v28 < v23)
      {
        uint64_t v31 = [v27 type];
        switch(v31)
        {
          case -1:
            unsigned __int16 v19 = 6;
            break;
          case 1:
            char v25 = 0;
            unsigned __int16 v19 = 4;
            break;
          case 0:
            char v25 = 0;
            unsigned __int16 v19 = 3;
            break;
        }
        double v23 = v29;
      }
    }
    uint64_t v22 = [v20 countByEnumeratingWithState:&v39 objects:v43 count:16];
  }
  while (v22);

  id v16 = v36;
  id v15 = v37;
  id v18 = v35;
  a1 = v38;
  if (v25)
  {
LABEL_28:
    if (v18)
    {
LABEL_29:
      [v14 coordinate];
      int v32 = objc_msgSend(a1, "isTopFrequentLocationForCoordinate:startDate:endDate:frequentLocations:", v15, v16, v18);
      if (v17) {
        __int16 v33 = 5;
      }
      else {
        __int16 v33 = 1;
      }
      if (v32) {
        unsigned __int16 v19 = v33;
      }
      goto LABEL_39;
    }
LABEL_36:
    if (v19 == 8) {
      unsigned __int16 v19 = 8;
    }
    else {
      unsigned __int16 v19 = 9;
    }
  }
LABEL_39:

  return v19;
}

+ (unsigned)locationTypeForMoment:(id)a3 locationsOfInterest:(id)a4 frequentLocations:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  double v11 = [v10 approximateLocation];
  [v10 gpsHorizontalAccuracy];
  double v13 = v12;
  id v14 = [v10 startDate];
  id v15 = [v10 endDate];

  LOWORD(v10) = [a1 _locationTypeForLocation:v11 horizontalAccuracy:v14 startDate:v15 endDate:v9 locationsOfInterest:v8 frequentLocations:v13];
  return (unsigned __int16)v10;
}

+ (unsigned)locationTypeForAsset:(id)a3 locationsOfInterest:(id)a4 frequentLocations:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  double v11 = [v10 location];
  [v10 gpsHorizontalAccuracy];
  double v13 = v12;
  id v14 = [v10 dateCreated];
  id v15 = [v10 dateCreated];

  LOWORD(v10) = [a1 _locationTypeForLocation:v11 horizontalAccuracy:v14 startDate:v15 endDate:v9 locationsOfInterest:v8 frequentLocations:v13];
  return (unsigned __int16)v10;
}

+ (void)processLocationIfNecessaryInMoment:(id)a3 usingManager:(id)a4 frequentLocations:(id)a5 frequentLocationsDidChange:(BOOL)a6
{
  id v20 = a3;
  id v10 = a4;
  id v11 = a5;
  unsigned int v12 = [v20 processedLocation];
  if (v12 > 0xA || ((1 << v12) & 0x49C) == 0)
  {
    unsigned int v14 = v12;
    int v15 = [v10 routineIsAvailable];
    BOOL v16 = v11 && v14 == 9;
    BOOL v17 = v16;
    if (!v14 || a6 || v17 || v15 && (v14 == 8 || v14 == 1))
    {
      id v18 = [v10 locationsOfInterest];
      uint64_t v19 = [a1 locationTypeForMoment:v20 locationsOfInterest:v18 frequentLocations:v11];

      [v20 setProcessedLocation:v19];
    }
  }
}

@end