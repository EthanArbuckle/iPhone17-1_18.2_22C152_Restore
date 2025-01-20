@interface NSSUsageData
+ (id)createLegacyUsageDictionary:(id)a3;
+ (id)createNSSUsageApp:(id)a3;
+ (id)createNSSUsageBundle:(id)a3;
+ (id)dedupeBundles:(id)a3;
+ (id)newAppBundleFromAppBundleMsg:(id)a3;
+ (id)newAppBundleFromAppUsageMsg:(id)a3;
+ (id)newAppBundleFromBundleUsageMsg:(id)a3;
+ (id)newAppBundleMsgFrom:(id)a3;
+ (id)newMsgFromSize:(id)a3;
+ (id)newSizeCategoryMsgFrom:(id)a3;
+ (id)newSizeFromMsg:(id)a3;
+ (id)newUsageDataFromUsageRespMsg:(id)a3;
+ (id)newUsageRespMsgFrom:(id)a3;
+ (id)setUsageRespMsgFrom:(id)a3 usageRespMsg:(id)a4;
- (BOOL)partiallyCharged;
- (BOOL)trusted;
- (NSArray)appBundleUsage;
- (NSArray)categories;
- (NSSUsageData)initWithCapacity:(unint64_t)a3 usedStorageInBytes:(unint64_t)a4 available:(unint64_t)a5 usageTimeInSeconds:(float)a6 standbyTimeInSeconds:(float)a7 trusted:(BOOL)a8 partiallyCharged:(BOOL)a9 appBundleUsage:(id)a10 categories:(id)a11;
- (NSSUsageData)initWithUsed:(unint64_t)a3 available:(unint64_t)a4 usageTimeInSeconds:(float)a5 standbyTimeInSeconds:(float)a6 trusted:(BOOL)a7 partiallyCharged:(BOOL)a8 appBundleUsage:(id)a9 categories:(id)a10;
- (float)standbyTimeInSeconds;
- (float)usageTimeInSeconds;
- (unint64_t)availableStorageInBytes;
- (unint64_t)capacityInBytes;
- (unint64_t)usedStorageInBytes;
@end

@implementation NSSUsageData

- (NSSUsageData)initWithUsed:(unint64_t)a3 available:(unint64_t)a4 usageTimeInSeconds:(float)a5 standbyTimeInSeconds:(float)a6 trusted:(BOOL)a7 partiallyCharged:(BOOL)a8 appBundleUsage:(id)a9 categories:(id)a10
{
  id v19 = a9;
  id v20 = a10;
  v24.receiver = self;
  v24.super_class = (Class)NSSUsageData;
  v21 = [(NSSUsageData *)&v24 init];
  v22 = v21;
  if (v21)
  {
    v21->_usedStorageInBytes = a3;
    v21->_availableStorageInBytes = a4;
    v21->_usageTimeInSeconds = a5;
    v21->_standbyTimeInSeconds = a6;
    v21->_trusted = a7;
    v21->_partiallyCharged = a8;
    objc_storeStrong((id *)&v21->_appBundleUsage, a9);
    objc_storeStrong((id *)&v22->_categories, a10);
  }

  return v22;
}

- (NSSUsageData)initWithCapacity:(unint64_t)a3 usedStorageInBytes:(unint64_t)a4 available:(unint64_t)a5 usageTimeInSeconds:(float)a6 standbyTimeInSeconds:(float)a7 trusted:(BOOL)a8 partiallyCharged:(BOOL)a9 appBundleUsage:(id)a10 categories:(id)a11
{
  id v20 = a10;
  id v21 = a11;
  v25.receiver = self;
  v25.super_class = (Class)NSSUsageData;
  v22 = [(NSSUsageData *)&v25 init];
  v23 = v22;
  if (v22)
  {
    v22->_capacityInBytes = a3;
    v22->_usedStorageInBytes = a4;
    v22->_availableStorageInBytes = a5;
    v22->_usageTimeInSeconds = a6;
    v22->_standbyTimeInSeconds = a7;
    v22->_trusted = a8;
    v22->_partiallyCharged = a9;
    objc_storeStrong((id *)&v22->_appBundleUsage, a10);
    objc_storeStrong((id *)&v23->_categories, a11);
  }

  return v23;
}

+ (id)createNSSUsageBundle:(id)a3
{
  id v3 = a3;
  v4 = objc_opt_new();
  v5 = [v3 name];
  [v4 setName:v5];

  v6 = [v3 bundleIdentifier];
  [v4 setBundleIdentifier:v6];

  uint64_t v7 = [v3 supportsManualPurge];
  [v4 setPurgeable:v7];
  v8 = [MEMORY[0x263EFF980] array];
  [v4 setCategories:v8];

  return v4;
}

+ (id)createNSSUsageApp:(id)a3
{
  id v3 = a3;
  v4 = objc_opt_new();
  v5 = [v3 name];
  [v4 setName:v5];

  v6 = [v3 bundleIdentifier];
  [v4 setBundleIdentifier:v6];

  uint64_t v7 = [v3 bundleVersion];
  [v4 setBundleVersion:v7];

  v8 = [v3 size];
  objc_msgSend(v4, "setStaticSize:", objc_msgSend(v8, "fixed"));

  v9 = [v3 size];

  objc_msgSend(v4, "setDynamicSize:", objc_msgSend(v9, "docsAndData"));
  return v4;
}

+ (id)createLegacyUsageDictionary:(id)a3
{
  uint64_t v54 = *MEMORY[0x263EF8340];
  id v3 = a3;
  v41 = [MEMORY[0x263EFF980] array];
  v4 = [MEMORY[0x263EFF980] array];
  v5 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", @"com.apple.NanoMailUsageBundle", @"com.apple.NanoCalendarUsage", @"com.apple.ContactsUsageBundle", @"com.apple.NanoPhoneUsageBundle", @"com.apple.NanoHealthUsage", @"com.apple.NanoPassbookUsageBundle", @"com.apple.SoftwareUpdateUsage", @"com.apple.NanoBooks.Usage", 0);
  v6 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", @"com.apple.NanoPhotos", @"com.apple.NanoMusic", @"com.apple.podcasts", 0);
  long long v46 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  v40 = v3;
  uint64_t v7 = [v3 appBundleUsage];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v46 objects:v53 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v47;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v47 != v10) {
          objc_enumerationMutation(v7);
        }
        v12 = *(void **)(*((void *)&v46 + 1) + 8 * i);
        v13 = [v12 bundleIdentifier];
        if (([v6 containsObject:v13] & 1) == 0)
        {
          if ([v5 containsObject:v13])
          {
            v14 = +[NSSUsageData createNSSUsageBundle:v12];
            v15 = v4;
          }
          else
          {
            v14 = +[NSSUsageData createNSSUsageApp:v12];
            v15 = v41;
          }
          [v15 addObject:v14];
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v46 objects:v53 count:16];
    }
    while (v9);
  }

  v51[0] = @"Apps";
  v51[1] = @"Bundles";
  v52[0] = v41;
  v52[1] = v4;
  v51[2] = @"UsedStorage";
  v38 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v40, "usedStorageInBytes"));
  v52[2] = v38;
  v51[3] = @"AvailableStorage";
  v37 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v40, "availableStorageInBytes"));
  v52[3] = v37;
  v51[4] = @"Usage";
  v16 = NSNumber;
  [v40 usageTimeInSeconds];
  v36 = objc_msgSend(v16, "numberWithFloat:");
  v52[4] = v36;
  v51[5] = @"Standby";
  v17 = NSNumber;
  [v40 standbyTimeInSeconds];
  v18 = objc_msgSend(v17, "numberWithFloat:");
  v52[5] = v18;
  v51[6] = @"Trusted";
  id v19 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v40, "trusted"));
  v52[6] = v19;
  v51[7] = @"Partially";
  id v20 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v40, "partiallyCharged"));
  v52[7] = v20;
  id v21 = [NSDictionary dictionaryWithObjects:v52 forKeys:v51 count:8];
  v39 = (void *)[v21 mutableCopy];

  id v22 = objc_alloc(MEMORY[0x263EFF9A0]);
  v23 = [v40 categories];
  objc_super v24 = objc_msgSend(v22, "initWithCapacity:", objc_msgSend(v23, "count"));

  long long v44 = 0u;
  long long v45 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  objc_super v25 = [v40 categories];
  uint64_t v26 = [v25 countByEnumeratingWithState:&v42 objects:v50 count:16];
  if (v26)
  {
    uint64_t v27 = v26;
    uint64_t v28 = *(void *)v43;
    do
    {
      for (uint64_t j = 0; j != v27; ++j)
      {
        if (*(void *)v43 != v28) {
          objc_enumerationMutation(v25);
        }
        v30 = *(void **)(*((void *)&v42 + 1) + 8 * j);
        v31 = [v30 categoryIdentifier];
        [v24 setValue:v30 forKey:v31];
      }
      uint64_t v27 = [v25 countByEnumeratingWithState:&v42 objects:v50 count:16];
    }
    while (v27);
  }

  v32 = [v24 valueForKey:@"CAT_MEDIA"];
  addCategoryToDict(v39, @"Songs", v32);

  [v39 setValue:@"com.apple.NanoMusic" forKey:@"MusicAppId"];
  v33 = [v24 valueForKey:@"CAT_PHOTOS"];
  addCategoryToDict(v39, @"PhotoLibrary", v33);

  [v39 setValue:@"com.apple.NanoPhotos" forKey:@"PhotosAppId"];
  v34 = [v24 valueForKey:@"CAT_BOOKS"];
  addCategoryToDict(v39, @"Audiobooks", v34);

  [v39 setValue:@"com.apple.podcasts" forKey:@"PodcastsAppId"];
  return v39;
}

- (unint64_t)capacityInBytes
{
  return self->_capacityInBytes;
}

- (unint64_t)usedStorageInBytes
{
  return self->_usedStorageInBytes;
}

- (unint64_t)availableStorageInBytes
{
  return self->_availableStorageInBytes;
}

- (float)usageTimeInSeconds
{
  return self->_usageTimeInSeconds;
}

- (float)standbyTimeInSeconds
{
  return self->_standbyTimeInSeconds;
}

- (BOOL)trusted
{
  return self->_trusted;
}

- (BOOL)partiallyCharged
{
  return self->_partiallyCharged;
}

- (NSArray)appBundleUsage
{
  return self->_appBundleUsage;
}

- (NSArray)categories
{
  return self->_categories;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_categories, 0);
  objc_storeStrong((id *)&self->_appBundleUsage, 0);
}

+ (id)newAppBundleFromAppBundleMsg:(id)a3
{
  id v4 = a3;
  v5 = [NSSUsageDataAppBundle alloc];
  v6 = [v4 name];
  uint64_t v7 = [v4 bundleIdentifier];
  uint64_t v8 = [v4 bundleVersion];
  uint64_t v9 = [v4 vendor];
  uint64_t v10 = [v4 size];
  v11 = (void *)[a1 newSizeFromMsg:v10];
  uint64_t v12 = [v4 supportsManualPurge];

  v13 = [(NSSUsageDataAppBundle *)v5 initWithName:v6 bundleIdentifier:v7 bundleVersion:v8 vendor:v9 size:v11 supportsPurge:v12];
  return v13;
}

+ (id)newAppBundleFromBundleUsageMsg:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v3 = a3;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v4 = objc_msgSend(v3, "categories", 0);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = 0;
    uint64_t v8 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v17 != v8) {
          objc_enumerationMutation(v4);
        }
        v7 += [*(id *)(*((void *)&v16 + 1) + 8 * i) usageInBytes];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v6);
  }
  else
  {
    uint64_t v7 = 0;
  }

  uint64_t v10 = [NSSUsageDataAppBundle alloc];
  v11 = [v3 name];
  uint64_t v12 = [v3 bundleIdentifier];
  v13 = +[NSSSizeVector docsAndData:v7];
  v14 = -[NSSUsageDataAppBundle initWithName:bundleIdentifier:bundleVersion:vendor:size:supportsPurge:](v10, "initWithName:bundleIdentifier:bundleVersion:vendor:size:supportsPurge:", v11, v12, 0, 0, v13, [v3 purgeable]);

  return v14;
}

+ (id)newAppBundleFromAppUsageMsg:(id)a3
{
  id v3 = a3;
  id v4 = [NSSUsageDataAppBundle alloc];
  uint64_t v5 = [v3 name];
  uint64_t v6 = [v3 bundleIdentifier];
  uint64_t v7 = [v3 bundleVersion];
  uint64_t v8 = [v3 staticSizeInBytes];
  uint64_t v9 = [v3 dynamicSizeInBytes];

  uint64_t v10 = +[NSSSizeVector fixed:v8 docsAndData:v9];
  v11 = [(NSSUsageDataAppBundle *)v4 initWithName:v5 bundleIdentifier:v6 bundleVersion:v7 vendor:0 size:v10 supportsPurge:0];

  return v11;
}

+ (id)newSizeFromMsg:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [v3 fixed];
  uint64_t v5 = [v3 docsAndData];
  uint64_t v6 = [v3 purgeable];

  +[NSSSizeVector fixed:v4 docsAndData:v5 purgeable:v6];
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)dedupeBundles:(id)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v3 = a3;
  uint64_t v4 = objc_msgSend(objc_alloc(MEMORY[0x263EFF9A0]), "initWithCapacity:", objc_msgSend(v3, "count"));
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v18 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        v11 = objc_msgSend(v10, "bundleIdentifier", (void)v17);
        uint64_t v12 = [v4 objectForKeyedSubscript:v11];
        v13 = [v10 mergeWith:v12];
        v14 = [v10 bundleIdentifier];
        [v4 setObject:v13 forKeyedSubscript:v14];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v7);
  }

  v15 = [v4 allValues];

  return v15;
}

+ (id)newUsageDataFromUsageRespMsg:(id)a3
{
  uint64_t v107 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = objc_alloc(MEMORY[0x263EFF9A0]);
  uint64_t v6 = [v4 appBundleUsages];
  v82 = objc_msgSend(v5, "initWithCapacity:", objc_msgSend(v6, "count"));

  uint64_t v7 = v4;
  v83 = objc_opt_new();
  long long v99 = 0u;
  long long v100 = 0u;
  long long v101 = 0u;
  long long v102 = 0u;
  uint64_t v8 = [v4 appBundleUsages];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v99 objects:v106 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v100;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v100 != v11) {
          objc_enumerationMutation(v8);
        }
        v13 = (void *)[a1 newAppBundleFromAppBundleMsg:*(void *)(*((void *)&v99 + 1) + 8 * i)];
        [v83 addObject:v13];
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v99 objects:v106 count:16];
    }
    while (v10);
  }

  long long v97 = 0u;
  long long v98 = 0u;
  long long v95 = 0u;
  long long v96 = 0u;
  v80 = v7;
  v14 = [v7 appUsages];
  uint64_t v15 = [v14 countByEnumeratingWithState:&v95 objects:v105 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v96;
    do
    {
      for (uint64_t j = 0; j != v16; ++j)
      {
        if (*(void *)v96 != v17) {
          objc_enumerationMutation(v14);
        }
        long long v19 = (void *)[a1 newAppBundleFromAppUsageMsg:*(void *)(*((void *)&v95 + 1) + 8 * j)];
        [v83 addObject:v19];
        long long v20 = [v19 size];
        addToCategory(v82, @"CAT_APPS", [v20 userTotal]);
      }
      uint64_t v16 = [v14 countByEnumeratingWithState:&v95 objects:v105 count:16];
    }
    while (v16);
  }

  long long v93 = 0u;
  long long v94 = 0u;
  long long v91 = 0u;
  long long v92 = 0u;
  uint64_t v21 = [v80 bundleUsages];
  uint64_t v22 = [v21 countByEnumeratingWithState:&v91 objects:v104 count:16];
  if (v22)
  {
    uint64_t v23 = v22;
    uint64_t v24 = *(void *)v92;
    do
    {
      uint64_t v25 = 0;
      do
      {
        if (*(void *)v92 != v24) {
          objc_enumerationMutation(v21);
        }
        uint64_t v26 = *(void **)(*((void *)&v91 + 1) + 8 * v25);
        uint64_t v27 = (void *)[a1 newAppBundleFromBundleUsageMsg:v26];
        [v83 addObject:v27];
        id v28 = [v26 bundleIdentifier];
        if (legacyUsageBundleIdToCategory_onceToken != -1) {
          dispatch_once(&legacyUsageBundleIdToCategory_onceToken, &__block_literal_global_1);
        }
        v29 = [(id)legacyUsageBundleIdToCategory_legacyBundleIdToNewBundleIdMap objectForKey:v28];
        if (!v29) {
          v29 = @"CAT_APPS";
        }

        v30 = [v27 size];
        addToCategory(v82, v29, [v30 userTotal]);

        ++v25;
      }
      while (v23 != v25);
      uint64_t v23 = [v21 countByEnumeratingWithState:&v91 objects:v104 count:16];
    }
    while (v23);
  }

  if (([v80 hasCameralRollUsage] & 1) != 0
    || ([v80 hasPhotoLibraryUsage] & 1) != 0
    || [v80 hasPhotoStreamUsage])
  {
    v31 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v32 = [v31 localizedStringForKey:@"PHOTO" value:&stru_26CC7AE70 table:@"Localization-shared"];
    v33 = newFakeAppBundleFromLegacyData(v32, @"com.apple.NanoPhotos", [v80 photoLibraryUsage]+ objc_msgSend(v80, "cameralRollUsage")+ objc_msgSend(v80, "photoStreamUsage"));

    [v83 addObject:v33];
  }
  if (([v80 hasSongsUsage] & 1) != 0
    || ([v80 hasAudiobooksUsage] & 1) != 0
    || [v80 hasAudioCoursesUsage])
  {
    v34 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v35 = [v34 localizedStringForKey:@"MUSIC" value:&stru_26CC7AE70 table:@"Localization-shared"];
    v36 = newFakeAppBundleFromLegacyData(v35, @"com.apple.NanoMusic", [v80 audiobooksUsage] + objc_msgSend(v80, "songsUsage") + objc_msgSend(v80, "audioCoursesUsage"));

    [v83 addObject:v36];
  }
  if ([v80 hasAudioPodcastsUsage])
  {
    v37 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v38 = [v37 localizedStringForKey:@"PODCASTS" value:&stru_26CC7AE70 table:@"Localization-shared"];
    v39 = newFakeAppBundleFromLegacyData(v38, @"com.apple.podcasts", [v80 audioPodcastsUsage]);

    [v83 addObject:v39];
  }
  addToCategory(v82, @"CAT_MEDIA", [v80 moviesUsage]);
  addToCategory(v82, @"CAT_MEDIA", [v80 movieRentalsUsage]);
  addToCategory(v82, @"CAT_MEDIA", [v80 tvShowsUsage]);
  addToCategory(v82, @"CAT_MEDIA", [v80 audioCoursesUsage]);
  addToCategory(v82, @"CAT_MEDIA", [v80 videoCoursesUsage]);
  addToCategory(v82, @"CAT_MEDIA", [v80 musicVideosUsage]);
  addToCategory(v82, @"CAT_MEDIA", [v80 audioPodcastsUsage]);
  addToCategory(v82, @"CAT_MEDIA", [v80 videoPodcastsUsage]);
  addToCategory(v82, @"CAT_MEDIA", [v80 songsUsage]);
  addToCategory(v82, @"CAT_BOOKS", [v80 audiobooksUsage]);
  addToCategory(v82, @"CAT_MEDIA", [v80 homeVideosUsage]);
  addToCategory(v82, @"CAT_PHOTOS", [v80 cameralRollUsage]);
  addToCategory(v82, @"CAT_PHOTOS", [v80 photoLibraryUsage]);
  addToCategory(v82, @"CAT_PHOTOS", [v80 photoStreamUsage]);
  id v40 = objc_alloc(MEMORY[0x263EFF9A0]);
  v41 = [v80 categories];
  long long v42 = objc_msgSend(v40, "initWithCapacity:", objc_msgSend(v41, "count"));

  long long v89 = 0u;
  long long v90 = 0u;
  long long v87 = 0u;
  long long v88 = 0u;
  long long v43 = [v80 categories];
  uint64_t v44 = [v43 countByEnumeratingWithState:&v87 objects:v103 count:16];
  if (v44)
  {
    uint64_t v45 = v44;
    uint64_t v46 = *(void *)v88;
    do
    {
      for (uint64_t k = 0; k != v45; ++k)
      {
        if (*(void *)v88 != v46) {
          objc_enumerationMutation(v43);
        }
        long long v48 = *(void **)(*((void *)&v87 + 1) + 8 * k);
        uint64_t v49 = [v48 categoryIdentifier];
        if (v49)
        {
          v50 = (void *)v49;
          v51 = [v48 size];

          if (v51)
          {
            v52 = [v48 categoryIdentifier];
            v53 = [v48 size];
            uint64_t v54 = (void *)[a1 newSizeFromMsg:v53];
            addUsageSizeToCategory(v82, v52, v54);
          }
        }
        uint64_t v55 = [v48 categoryIdentifier];
        if (v55)
        {
          v56 = (void *)v55;
          v57 = [v48 name];

          if (v57)
          {
            v58 = [v48 name];
            v59 = [v48 categoryIdentifier];
            [v42 setObject:v58 forKeyedSubscript:v59];
          }
        }
      }
      uint64_t v45 = [v43 countByEnumeratingWithState:&v87 objects:v103 count:16];
    }
    while (v45);
  }

  id v60 = objc_alloc_init(MEMORY[0x263EFF980]);
  v84[0] = MEMORY[0x263EF8330];
  v84[1] = 3221225472;
  v84[2] = __52__NSSUsageData_Proto__newUsageDataFromUsageRespMsg___block_invoke;
  v84[3] = &unk_2643FBC58;
  id v85 = v60;
  id v86 = v42;
  id v81 = v42;
  id v79 = v60;
  [v82 enumerateKeysAndObjectsUsingBlock:v84];
  uint64_t v61 = [v80 capacityInBytes];
  if ([v80 hasCapacityInBytes])
  {
    unint64_t v62 = 0x2643FB000;
    uint64_t v78 = v61;
  }
  else
  {
    uint64_t v63 = [v80 availableStorageInBytes];
    uint64_t v78 = [v80 usedStorageInBytes] + v63;
    unint64_t v62 = 0x2643FB000uLL;
  }
  id v64 = objc_alloc(*(Class *)(v62 + 760));
  uint64_t v65 = [v80 usedStorageInBytes];
  uint64_t v66 = [v80 availableStorageInBytes];
  [v80 usageTimeInSeconds];
  int v68 = v67;
  [v80 standbyTimeInSeconds];
  int v70 = v69;
  uint64_t v71 = [v80 trusted];
  uint64_t v72 = [v80 partiallyCharged];
  v73 = [a1 dedupeBundles:v83];
  LODWORD(v74) = v68;
  LODWORD(v75) = v70;
  v76 = (void *)[v64 initWithCapacity:v78 usedStorageInBytes:v65 available:v66 usageTimeInSeconds:v71 standbyTimeInSeconds:v72 trusted:v73 partiallyCharged:v74 appBundleUsage:v75 categories:v79];

  return v76;
}

void __52__NSSUsageData_Proto__newUsageDataFromUsageRespMsg___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = *(void **)(a1 + 32);
  id v6 = a3;
  id v7 = a2;
  uint64_t v8 = [NSSUsageDataSizeCategory alloc];
  id v10 = [*(id *)(a1 + 40) objectForKeyedSubscript:v7];
  uint64_t v9 = [(NSSUsageDataSizeCategory *)v8 initWithIdentifier:v7 size:v6 name:v10];

  [v5 addObject:v9];
}

+ (id)newMsgFromSize:(id)a3
{
  id v3 = a3;
  id v4 = objc_opt_new();
  if ([v3 docsAndData])
  {
    uint64_t v5 = [v3 docsAndData];
    [v4 setDocsAndData:v5 & ~(v5 >> 63)];
  }
  if ([v3 fixed])
  {
    uint64_t v6 = [v3 fixed];
    [v4 setFixed:v6 & ~(v6 >> 63)];
  }
  if ([v3 purgeable])
  {
    uint64_t v7 = [v3 purgeable];
    [v4 setPurgeable:v7 & ~(v7 >> 63)];
  }

  return v4;
}

+ (id)newSizeCategoryMsgFrom:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_new();
  uint64_t v6 = [v4 categoryIdentifier];
  [v5 setCategoryIdentifier:v6];

  uint64_t v7 = [v4 name];
  [v5 setName:v7];

  uint64_t v8 = [v4 size];

  uint64_t v9 = (void *)[a1 newMsgFromSize:v8];
  [v5 setSize:v9];

  return v5;
}

+ (id)newAppBundleMsgFrom:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_new();
  uint64_t v6 = [v4 bundleIdentifier];
  [v5 setBundleIdentifier:v6];

  uint64_t v7 = [v4 bundleVersion];
  [v5 setBundleVersion:v7];

  objc_msgSend(v5, "setSupportsManualPurge:", objc_msgSend(v4, "supportsManualPurge"));
  uint64_t v8 = [v4 size];
  uint64_t v9 = (void *)[a1 newMsgFromSize:v8];
  [v5 setSize:v9];

  id v10 = [v4 name];

  [v5 setName:v10];
  return v5;
}

+ (id)newUsageRespMsgFrom:(id)a3
{
  id v3 = a3;
  id v4 = objc_opt_new();
  id v5 = +[NSSUsageData setUsageRespMsgFrom:v3 usageRespMsg:v4];

  return v4;
}

+ (id)setUsageRespMsgFrom:(id)a3 usageRespMsg:(id)a4
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  objc_msgSend(v7, "setCapacityInBytes:", objc_msgSend(v6, "capacityInBytes"));
  objc_msgSend(v7, "setUsedStorageInBytes:", objc_msgSend(v6, "usedStorageInBytes"));
  objc_msgSend(v7, "setAvailableStorageInBytes:", objc_msgSend(v6, "availableStorageInBytes"));
  [v6 usageTimeInSeconds];
  objc_msgSend(v7, "setUsageTimeInSeconds:");
  [v6 standbyTimeInSeconds];
  objc_msgSend(v7, "setStandbyTimeInSeconds:");
  objc_msgSend(v7, "setTrusted:", objc_msgSend(v6, "trusted"));
  objc_msgSend(v7, "setPartiallyCharged:", objc_msgSend(v6, "partiallyCharged"));
  uint64_t v8 = [MEMORY[0x263EFF980] array];
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  uint64_t v9 = [v6 categories];
  uint64_t v10 = [v9 countByEnumeratingWithState:&v27 objects:v32 count:16];
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
        v14 = (void *)[a1 newSizeCategoryMsgFrom:*(void *)(*((void *)&v27 + 1) + 8 * i)];
        [v8 addObject:v14];
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v27 objects:v32 count:16];
    }
    while (v11);
  }

  [v7 setCategories:v8];
  uint64_t v15 = [MEMORY[0x263EFF980] array];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  uint64_t v16 = objc_msgSend(v6, "appBundleUsage", 0);
  uint64_t v17 = [v16 countByEnumeratingWithState:&v23 objects:v31 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v24;
    do
    {
      for (uint64_t j = 0; j != v18; ++j)
      {
        if (*(void *)v24 != v19) {
          objc_enumerationMutation(v16);
        }
        uint64_t v21 = (void *)[a1 newAppBundleMsgFrom:*(void *)(*((void *)&v23 + 1) + 8 * j)];
        [v15 addObject:v21];
      }
      uint64_t v18 = [v16 countByEnumeratingWithState:&v23 objects:v31 count:16];
    }
    while (v18);
  }

  [v7 setAppBundleUsages:v15];
  return v7;
}

@end