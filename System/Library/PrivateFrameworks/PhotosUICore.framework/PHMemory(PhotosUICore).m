@interface PHMemory(PhotosUICore)
+ (uint64_t)px_photosGraphDataFromProperties:()PhotosUICore error:;
- (__CFString)px_navigationURLHost;
- (id)px_blockableFeatureActions;
- (id)px_mutatedPhotosGraphPropertiesWithRejectReason:()PhotosUICore;
- (id)px_photosGraphDataByMutatingPropertiesUsingBlock:()PhotosUICore error:;
- (uint64_t)px_canEditFavoriteState;
- (uint64_t)px_canPerformFeatureLessAction;
- (uint64_t)px_isTrip;
@end

@implementation PHMemory(PhotosUICore)

- (uint64_t)px_canEditFavoriteState
{
  uint64_t v2 = objc_msgSend(a1, "px_isTrip") ^ 1;
  if ((_os_feature_enabled_impl() & 1) == 0)
  {
    BOOL v3 = [a1 pendingState] != 2 || objc_msgSend(a1, "featuredState") != 2;
    return v2 & v3;
  }
  return v2;
}

- (uint64_t)px_canPerformFeatureLessAction
{
  return objc_msgSend(a1, "px_isTrip") ^ 1;
}

- (uint64_t)px_isTrip
{
  return [MEMORY[0x1E4F8E868] supportsCollection:a1];
}

- (id)px_blockableFeatureActions
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __52__PHMemory_PhotosUICore__px_blockableFeatureActions__block_invoke;
  aBlock[3] = &unk_1E5DB8EB0;
  id v4 = v3;
  id v32 = v4;
  id v5 = v2;
  id v33 = v5;
  v6 = (void (**)(void *, __CFString *, __CFString *))_Block_copy(aBlock);
  if ([a1 hasBlockableFeature])
  {
    v7 = [a1 userFeedbackProperties];
    v8 = [v7 userFeedback];

    if (!v8)
    {
      id v26 = v4;
      long long v29 = 0u;
      long long v30 = 0u;
      long long v27 = 0u;
      long long v28 = 0u;
      v9 = [a1 blockableFeatures];
      uint64_t v10 = [v9 countByEnumeratingWithState:&v27 objects:v35 count:16];
      if (v10)
      {
        uint64_t v11 = v10;
        uint64_t v12 = *(void *)v28;
        do
        {
          for (uint64_t i = 0; i != v11; ++i)
          {
            if (*(void *)v28 != v12) {
              objc_enumerationMutation(v9);
            }
            uint64_t v14 = [*(id *)(*((void *)&v27 + 1) + 8 * i) type];
            if (v14 <= 511)
            {
              if (v14 == 16)
              {
                v6[2](v6, @"PXBlockMemoryActionTitleThisDay", @"PXAssetCollectionActionTypeBlockMemoryFeatureTimeDate");
              }
              else if (v14 == 32)
              {
                v6[2](v6, @"PXBlockMemoryActionTitleThisHoliday", @"PXAssetCollectionActionTypeBlockMemoryFeatureHoliday");
              }
            }
            else if (v14 == 512)
            {
              v6[2](v6, @"PXBlockMemoryActionTitleThisDateInterval", @"PXAssetCollectionActionTypeBlockMemoryFeatureTimeDateInterval");
            }
            else if (v14 == 4096 || v14 == 0x20000)
            {
              v6[2](v6, @"PXBlockMemoryActionTitleThisPlace", @"PXAssetCollectionActionTypeBlockMemoryFeaturePlace");
            }
          }
          uint64_t v11 = [v9 countByEnumeratingWithState:&v27 objects:v35 count:16];
        }
        while (v11);
      }

      id v4 = v26;
    }
  }
  v15 = [a1 photoLibrary];
  v16 = [v15 librarySpecificFetchOptions];

  uint64_t v34 = *MEMORY[0x1E4F397E0];
  v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v34 count:1];
  [v16 setFetchPropertySets:v17];

  [v16 setPersonContext:3];
  v18 = objc_msgSend(MEMORY[0x1E4F390A0], "px_defaultDetectionTypes");
  [v16 setIncludedDetectionTypes:v18];

  v19 = [MEMORY[0x1E4F391F0] fetchPersonsForAssetCollection:a1 options:v16];
  v20 = [v19 fetchedObjects];
  v21 = +[PXPeopleWidgetUtilities verifiedPersonsFromMergeCandidatesForPersons:v20];

  uint64_t v22 = [v21 count];
  if (v22)
  {
    if (v22 == 1) {
      v23 = @"PXBlockMemoryActionTitleThisPerson";
    }
    else {
      v23 = @"PXBlockMemoryActionTitlePeople";
    }
    v6[2](v6, v23, @"PXAssetCollectionActionTypeBlockMemoryFeaturePerson");
  }

  if (![v5 count]) {
    v6[2](v6, @"PXBlockMemoryActionTitleGeneric", @"PXAssetCollectionActionTypeBlockMemory");
  }
  id v24 = v5;

  return v24;
}

- (id)px_mutatedPhotosGraphPropertiesWithRejectReason:()PhotosUICore
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v6 = 0;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __74__PHMemory_PhotosUICore__px_mutatedPhotosGraphPropertiesWithRejectReason___block_invoke;
  v7[3] = &__block_descriptor_40_e29_v16__0__NSMutableDictionary_8l;
  v7[4] = a3;
  id v3 = objc_msgSend(a1, "px_photosGraphDataByMutatingPropertiesUsingBlock:error:", v7, &v6);
  id v4 = v6;
  if (!v3) {
    PXAssertGetLog();
  }

  return v3;
}

- (id)px_photosGraphDataByMutatingPropertiesUsingBlock:()PhotosUICore error:
{
  id v6 = a3;
  v7 = [a1 photosGraphProperties];
  uint64_t v8 = (void *)[v7 mutableCopy];
  v9 = v8;
  if (v8) {
    id v10 = v8;
  }
  else {
    id v10 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  }
  uint64_t v11 = v10;

  v6[2](v6, v11);
  uint64_t v12 = objc_msgSend((id)objc_opt_class(), "px_photosGraphDataFromProperties:error:", v11, a4);

  return v12;
}

+ (uint64_t)px_photosGraphDataFromProperties:()PhotosUICore error:
{
  return [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:a3 requiringSecureCoding:1 error:a4];
}

- (__CFString)px_navigationURLHost
{
  return @"memory";
}

@end