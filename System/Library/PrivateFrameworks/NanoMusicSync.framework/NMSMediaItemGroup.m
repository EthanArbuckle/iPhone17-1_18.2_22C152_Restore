@interface NMSMediaItemGroup
+ (NMSMediaItemGroup)itemGroupWithAudiobookIdentifier:(id)a3 downloadLimit:(unint64_t)a4 manuallyAdded:(BOOL)a5 downloadedItemsOnly:(BOOL)a6;
+ (NMSMediaItemGroup)itemGroupWithCustomPodcastFeedURL:(id)a3 downloadedItemsOnly:(BOOL)a4;
+ (NMSMediaItemGroup)itemGroupWithPodcastFeedURL:(id)a3 downloadOrder:(unint64_t)a4 episodeLimit:(unint64_t)a5 manuallyAdded:(BOOL)a6 downloadedItemsOnly:(BOOL)a7;
+ (NMSMediaItemGroup)itemGroupWithPodcastStationUUID:(id)a3 downloadedItemsOnly:(BOOL)a4;
+ (NMSMediaItemGroup)itemGroupWithQuotaRefObj:(id)a3;
+ (NMSMediaItemGroup)itemGroupWithRecommendation:(id)a3 downloadedItemsOnly:(BOOL)a4;
+ (NMSMediaItemGroup)itemGroupWithSavedEpisodesDownloadedItemsOnly:(BOOL)a3;
+ (NMSMediaItemGroup)itemGroupWithSyncedAlbumID:(id)a3 downloadedItemsOnly:(BOOL)a4;
+ (NMSMediaItemGroup)itemGroupWithSyncedPlaylistID:(id)a3 downloadedItemsOnly:(BOOL)a4;
+ (NMSMediaItemGroup)itemGroupWithUpNextEpisodesDownloadedItemsOnly:(BOOL)a3;
+ (id)_itemsForContainerClass:(Class)a3 containerIDs:(id)a4 includingNonLibraryContent:(BOOL)a5 includingDownloadedContentOnly:(BOOL)a6 manuallyAdded:(BOOL)a7;
+ (id)sharedLibraryRequestQueue;
- (BOOL)downloadedItemsOnly;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToContainer:(id)a3;
- (BOOL)isEstimate;
- (BOOL)manuallyAdded;
- (NMSMediaContainerQuotaData)quotaData;
- (NMSMediaItemGroup)initWithType:(unint64_t)a3 refObj:(id)a4 manuallyAdded:(BOOL)a5 quotaRefObj:(id)a6 downloadedItemsOnly:(BOOL)a7;
- (id)description;
- (id)identifiers;
- (id)identifiersForContainerType:(unint64_t)a3;
- (id)itemList;
- (id)referenceObj;
- (unint64_t)hash;
- (unint64_t)type;
- (void)itemList;
- (void)setDownloadedItemsOnly:(BOOL)a3;
- (void)setManuallyAdded:(BOOL)a3;
- (void)setQuotaData:(id)a3;
- (void)setReferenceObj:(id)a3;
- (void)setType:(unint64_t)a3;
@end

@implementation NMSMediaItemGroup

+ (id)sharedLibraryRequestQueue
{
  if (sharedLibraryRequestQueue_onceToken != -1) {
    dispatch_once(&sharedLibraryRequestQueue_onceToken, &__block_literal_global_132);
  }
  v2 = (void *)sharedLibraryRequestQueue_sharedQueue;

  return v2;
}

uint64_t __46__NMSMediaItemGroup_sharedLibraryRequestQueue__block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x263F08A48]);
  v1 = (void *)sharedLibraryRequestQueue_sharedQueue;
  sharedLibraryRequestQueue_sharedQueue = (uint64_t)v0;

  [(id)sharedLibraryRequestQueue_sharedQueue setMaxConcurrentOperationCount:4];
  [(id)sharedLibraryRequestQueue_sharedQueue setName:@"com.apple.NanoMusicSync.NMSMediaItemGroup.LibraryRequestQueue"];
  v2 = (void *)sharedLibraryRequestQueue_sharedQueue;

  return [v2 setQualityOfService:-1];
}

+ (NMSMediaItemGroup)itemGroupWithRecommendation:(id)a3 downloadedItemsOnly:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = a3;
  v6 = [(NMSMediaItemGroup *)[NMSRecommendationMediaItemGroup alloc] initWithType:6 refObj:v5 manuallyAdded:0 quotaRefObj:v5 downloadedItemsOnly:v4];

  return (NMSMediaItemGroup *)v6;
}

+ (NMSMediaItemGroup)itemGroupWithUpNextEpisodesDownloadedItemsOnly:(BOOL)a3
{
  v3 = [(NMSMediaItemGroup *)[NMSPodcastUpNextMediaItemGroup alloc] initWithType:2 refObj:@"NMSRefObj_UpNext" manuallyAdded:0 quotaRefObj:@"NMSRefObj_UpNext" downloadedItemsOnly:a3];

  return (NMSMediaItemGroup *)v3;
}

+ (NMSMediaItemGroup)itemGroupWithSavedEpisodesDownloadedItemsOnly:(BOOL)a3
{
  v3 = [(NMSMediaItemGroup *)[NMSPodcastSavedEpisodesMediaItemGroup alloc] initWithType:4 refObj:@"NMSRefObj_SavedEpisodes" manuallyAdded:0 quotaRefObj:@"NMSRefObj_SavedEpisodes" downloadedItemsOnly:a3];

  return (NMSMediaItemGroup *)v3;
}

+ (NMSMediaItemGroup)itemGroupWithCustomPodcastFeedURL:(id)a3 downloadedItemsOnly:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = a3;
  v6 = [(NMSMediaItemGroup *)[NMSPodcastCustomShowMediaItemGroup alloc] initWithType:2 refObj:v5 manuallyAdded:0 quotaRefObj:v5 downloadedItemsOnly:v4];

  return (NMSMediaItemGroup *)v6;
}

+ (NMSMediaItemGroup)itemGroupWithPodcastStationUUID:(id)a3 downloadedItemsOnly:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = a3;
  v6 = [(NMSMediaItemGroup *)[NMSPodcastStationMediaItemGroup alloc] initWithType:3 refObj:v5 manuallyAdded:0 quotaRefObj:v5 downloadedItemsOnly:v4];

  return (NMSMediaItemGroup *)v6;
}

+ (NMSMediaItemGroup)itemGroupWithPodcastFeedURL:(id)a3 downloadOrder:(unint64_t)a4 episodeLimit:(unint64_t)a5 manuallyAdded:(BOOL)a6 downloadedItemsOnly:(BOOL)a7
{
  return (NMSMediaItemGroup *)objc_msgSend(a1, "itemGroupWithCustomPodcastFeedURL:downloadedItemsOnly:", a3, 0, a5, a6, a7);
}

+ (NMSMediaItemGroup)itemGroupWithAudiobookIdentifier:(id)a3 downloadLimit:(unint64_t)a4 manuallyAdded:(BOOL)a5 downloadedItemsOnly:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v7 = a5;
  id v9 = a3;
  v10 = [[NMSAudiobookReferenceObject alloc] initWithAudiobookIdentifier:v9 downloadLimit:a4];
  v11 = [(NMSMediaItemGroup *)[NMSAudiobooksMediaItemGroup alloc] initWithType:7 refObj:v10 manuallyAdded:v7 quotaRefObj:v9 downloadedItemsOnly:v6];

  return (NMSMediaItemGroup *)v11;
}

- (NMSMediaItemGroup)initWithType:(unint64_t)a3 refObj:(id)a4 manuallyAdded:(BOOL)a5 quotaRefObj:(id)a6 downloadedItemsOnly:(BOOL)a7
{
  id v13 = a4;
  id v14 = a6;
  v21.receiver = self;
  v21.super_class = (Class)NMSMediaItemGroup;
  v15 = [(NMSMediaItemGroup *)&v21 init];
  v16 = v15;
  if (v15)
  {
    v15->_type = a3;
    objc_storeStrong(&v15->_referenceObj, a4);
    v16->_manuallyAdded = a5;
    if (!v14)
    {
      v17 = NMLogForCategory(5);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
        -[NMSMediaItemGroup initWithType:refObj:manuallyAdded:quotaRefObj:downloadedItemsOnly:]();
      }
    }
    v18 = objc_alloc_init(NMSMediaContainerQuotaData);
    quotaData = v16->_quotaData;
    v16->_quotaData = v18;

    [(NMSMediaContainerQuotaData *)v16->_quotaData setQuotaRefObj:v14];
    v16->_downloadedItemsOnly = a7;
  }

  return v16;
}

- (BOOL)isEqualToContainer:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(NMSMediaItemGroup *)self type];
  if (v5 == [v4 type])
  {
    BOOL v6 = [(NMSMediaItemGroup *)self referenceObj];
    BOOL v7 = [v4 referenceObj];
    char v8 = [v6 isEqual:v7];
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (NMSMediaItemGroup *)a3;
  unint64_t v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(NMSMediaItemGroup *)self isEqualToContainer:v5];

  return v6;
}

- (unint64_t)hash
{
  v2 = [(NMSMediaItemGroup *)self referenceObj];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (id)description
{
  unint64_t v3 = NSString;
  v9.receiver = self;
  v9.super_class = (Class)NMSMediaItemGroup;
  id v4 = [(NMSMediaItemGroup *)&v9 description];
  unint64_t v5 = [(NMSMediaItemGroup *)self type];
  BOOL v6 = [(NMSMediaItemGroup *)self referenceObj];
  BOOL v7 = [v3 stringWithFormat:@"<%@ type:%tu, refObj:%@>", v4, v5, v6];

  return v7;
}

- (id)identifiers
{
  unint64_t v3 = [(NMSMediaItemGroup *)self type];

  return [(NMSMediaItemGroup *)self identifiersForContainerType:v3];
}

- (id)identifiersForContainerType:(unint64_t)a3
{
  unint64_t v3 = NMLogForCategory(5);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    -[NMSMediaItemGroup identifiersForContainerType:]();
  }

  return 0;
}

- (id)itemList
{
  unint64_t v3 = [(NMSMediaItemGroup *)self type];
  if (v3 - 2 >= 6)
  {
    if (v3 == 1)
    {
      uint64_t v15 = objc_opt_class();
      uint64_t v16 = objc_opt_class();
      char v8 = [(NMSMediaItemGroup *)self identifiers];
      BOOL v9 = [(NMSMediaItemGroup *)self downloadedItemsOnly];
      BOOL v10 = [(NMSMediaItemGroup *)self manuallyAdded];
      v11 = (void *)v15;
      uint64_t v12 = v16;
      id v13 = v8;
      uint64_t v14 = 0;
    }
    else
    {
      if (v3)
      {
        unint64_t v5 = 0;
        goto LABEL_11;
      }
      uint64_t v6 = objc_opt_class();
      uint64_t v7 = objc_opt_class();
      char v8 = [(NMSMediaItemGroup *)self identifiers];
      BOOL v9 = [(NMSMediaItemGroup *)self downloadedItemsOnly];
      BOOL v10 = [(NMSMediaItemGroup *)self manuallyAdded];
      v11 = (void *)v6;
      uint64_t v12 = v7;
      id v13 = v8;
      uint64_t v14 = 1;
    }
    unint64_t v5 = [v11 _itemsForContainerClass:v12 containerIDs:v13 includingNonLibraryContent:v14 includingDownloadedContentOnly:v9 manuallyAdded:v10];

    goto LABEL_11;
  }
  id v4 = NMLogForCategory(5);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    -[NMSMediaItemGroup itemList]();
  }

  unint64_t v5 = [MEMORY[0x263EFF8C0] array];
LABEL_11:

  return v5;
}

- (BOOL)isEstimate
{
  return 0;
}

+ (id)_itemsForContainerClass:(Class)a3 containerIDs:(id)a4 includingNonLibraryContent:(BOOL)a5 includingDownloadedContentOnly:(BOOL)a6 manuallyAdded:(BOOL)a7
{
  BOOL v53 = a7;
  uint64_t v76 = *MEMORY[0x263EF8340];
  id v8 = a4;
  v54 = [MEMORY[0x263EFF9B0] orderedSet];
  long long v69 = 0u;
  long long v70 = 0u;
  long long v71 = 0u;
  long long v72 = 0u;
  id v9 = v8;
  uint64_t v63 = [v9 countByEnumeratingWithState:&v69 objects:v75 count:16];
  if (v63)
  {
    uint64_t v60 = *(void *)v70;
    uint64_t v58 = *MEMORY[0x263F573A8];
    uint64_t v59 = *MEMORY[0x263F573B0];
    uint64_t v57 = *MEMORY[0x263F57378];
    uint64_t v52 = *MEMORY[0x263F573C8];
    uint64_t v56 = *MEMORY[0x263F573A0];
    unint64_t v10 = 0x263F57000uLL;
    uint64_t v55 = *MEMORY[0x263F573D8];
    id v62 = v9;
    BOOL v61 = a5;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v70 != v60) {
          objc_enumerationMutation(v9);
        }
        uint64_t v68 = v11;
        uint64_t v12 = *(void **)(*((void *)&v69 + 1) + 8 * v11);
        v66 = *(void **)(v10 + 1016);
        id v13 = (void *)MEMORY[0x263F57420];
        if ((Class)objc_opt_class() == a3) {
          uint64_t v14 = v59;
        }
        else {
          uint64_t v14 = v58;
        }
        uint64_t v15 = (void *)MEMORY[0x263EFFA08];
        uint64_t v16 = NSNumber;
        v17 = [v12 library];
        v18 = objc_msgSend(v16, "numberWithLongLong:", objc_msgSend(v17, "persistentID"));
        v19 = [v15 setWithObject:v18];
        v20 = [v13 predicateWithProperty:v14 values:v19];
        v74[0] = v20;
        objc_super v21 = (void *)MEMORY[0x263F57458];
        v22 = [MEMORY[0x263F57428] predicateWithProperty:v57 values:&unk_26D51CE90];
        v23 = [v21 predicateWithPredicate:v22];
        v74[1] = v23;
        v24 = [MEMORY[0x263F890A0] defaultManager];
        v25 = [v24 ageVerificationState];
        v64 = v12;
        v67 = v17;
        if ([v25 status] == 2) {
          [MEMORY[0x263F57410] predicateWithProperty:v52 value:MEMORY[0x263EFFA80] comparison:1];
        }
        else {
        v26 = [MEMORY[0x263F57478] truePredicate];
        }
        v74[2] = v26;
        v27 = [MEMORY[0x263EFF8C0] arrayWithObjects:v74 count:3];
        v28 = [v66 predicateMatchingPredicates:v27];

        v29 = (void *)MEMORY[0x263F57470];
        v30 = [MEMORY[0x263F57448] autoupdatingSharedLibrary];
        if (v61) {
          [v29 allItemsQueryWithLibrary:v30 predicate:v28 orderingTerms:0 usingSections:0];
        }
        else {
        v31 = [v29 queryWithLibrary:v30 predicate:v28];
        }
        id v9 = v62;
        unint64_t v10 = 0x263F57000uLL;

        v32 = [v31 valueForAggregateFunction:v56 onEntitiesForProperty:v55];
        uint64_t v33 = [v32 unsignedLongLongValue];

        v34 = (void *)MEMORY[0x263F573F8];
        v73[0] = v28;
        v35 = [MEMORY[0x263F57410] predicateWithProperty:v55 value:&unk_26D51D208 comparison:1];
        v73[1] = v35;
        v36 = [MEMORY[0x263EFF8C0] arrayWithObjects:v73 count:2];
        v37 = [v34 predicateMatchingPredicates:v36];

        v38 = (void *)MEMORY[0x263F57470];
        v39 = [MEMORY[0x263F57448] autoupdatingSharedLibrary];
        if (v61) {
          [v38 allItemsQueryWithLibrary:v39 predicate:v37 orderingTerms:0 usingSections:0];
        }
        else {
        v40 = [v38 queryWithLibrary:v39 predicate:v37];
        }

        uint64_t v41 = v33 + 7000000 * [v40 countOfEntities];
        if (v41)
        {
          v42 = [NMSDownloadableItem alloc];
          v43 = NSNumber;
          [v64 library];
          v45 = v44 = v28;
          v46 = objc_msgSend(v43, "numberWithLongLong:", objc_msgSend(v45, "persistentID"));
          if ((Class)objc_opt_class() == a3) {
            uint64_t v47 = 3;
          }
          else {
            uint64_t v47 = 4;
          }
          v48 = [(NMSDownloadableItem *)v42 initWithMediaLibraryIdentifier:v46 externalLibraryIdentifier:0 size:v41 itemType:v47 manuallyAdded:v53];
          [v54 addObject:v48];

          v28 = v44;
          id v9 = v62;
          unint64_t v10 = 0x263F57000;
        }

        uint64_t v11 = v68 + 1;
      }
      while (v63 != v68 + 1);
      uint64_t v63 = [v9 countByEnumeratingWithState:&v69 objects:v75 count:16];
    }
    while (v63);
  }

  v49 = NMLogForCategory(5);
  if (os_log_type_enabled(v49, OS_LOG_TYPE_DEBUG)) {
    +[NMSMediaItemGroup _itemsForContainerClass:containerIDs:includingNonLibraryContent:includingDownloadedContentOnly:manuallyAdded:](v54, (uint64_t)v9, v49);
  }

  v50 = [v54 array];

  return v50;
}

+ (NMSMediaItemGroup)itemGroupWithSyncedPlaylistID:(id)a3 downloadedItemsOnly:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = a3;
  uint64_t v6 = [(NMSMediaItemGroup *)[NMSSyncedMediaItemGroup alloc] initWithType:0 refObj:v5 manuallyAdded:1 quotaRefObj:v5 downloadedItemsOnly:v4];

  return (NMSMediaItemGroup *)v6;
}

+ (NMSMediaItemGroup)itemGroupWithSyncedAlbumID:(id)a3 downloadedItemsOnly:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = a3;
  uint64_t v6 = [(NMSMediaItemGroup *)[NMSSyncedMediaItemGroup alloc] initWithType:1 refObj:v5 manuallyAdded:1 quotaRefObj:v5 downloadedItemsOnly:v4];

  return (NMSMediaItemGroup *)v6;
}

+ (NMSMediaItemGroup)itemGroupWithQuotaRefObj:(id)a3
{
  id v3 = a3;
  BOOL v4 = [(NMSMediaItemGroup *)[NMSRecommendationMediaItemGroup alloc] initWithType:6 refObj:v3 manuallyAdded:0 quotaRefObj:v3 downloadedItemsOnly:0];

  return (NMSMediaItemGroup *)v4;
}

- (id)referenceObj
{
  return self->_referenceObj;
}

- (void)setReferenceObj:(id)a3
{
}

- (NMSMediaContainerQuotaData)quotaData
{
  return self->_quotaData;
}

- (void)setQuotaData:(id)a3
{
}

- (unint64_t)type
{
  return self->_type;
}

- (void)setType:(unint64_t)a3
{
  self->_type = a3;
}

- (BOOL)manuallyAdded
{
  return self->_manuallyAdded;
}

- (void)setManuallyAdded:(BOOL)a3
{
  self->_manuallyAdded = a3;
}

- (BOOL)downloadedItemsOnly
{
  return self->_downloadedItemsOnly;
}

- (void)setDownloadedItemsOnly:(BOOL)a3
{
  self->_downloadedItemsOnly = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_quotaData, 0);

  objc_storeStrong(&self->_referenceObj, 0);
}

- (void)initWithType:refObj:manuallyAdded:quotaRefObj:downloadedItemsOnly:.cold.1()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  v1[0] = 138412802;
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_3_0();
  _os_log_error_impl(&dword_2228FD000, v0, OS_LOG_TYPE_ERROR, "%@ %s Unexpected nil quotaRefObj for refObj:%{public}@", (uint8_t *)v1, 0x20u);
}

- (void)identifiersForContainerType:.cold.1()
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  v3[0] = 138413058;
  OUTLINED_FUNCTION_0_0();
  BOOL v4 = "-[NMSMediaItemGroup identifiersForContainerType:]";
  __int16 v5 = 2048;
  uint64_t v6 = v0;
  __int16 v7 = 2114;
  uint64_t v8 = v1;
  _os_log_error_impl(&dword_2228FD000, v2, OS_LOG_TYPE_ERROR, "%@ %s No identifiers for type (%lu): %{public}@", (uint8_t *)v3, 0x2Au);
}

- (void)itemList
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  v1[0] = 138412802;
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_3_0();
  _os_log_error_impl(&dword_2228FD000, v0, OS_LOG_TYPE_ERROR, "%@ %s No itemList: %{public}@", (uint8_t *)v1, 0x20u);
}

+ (void)_itemsForContainerClass:(NSObject *)a3 containerIDs:includingNonLibraryContent:includingDownloadedContentOnly:manuallyAdded:.cold.1(void *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  [a1 count];
  v7[0] = 138413314;
  OUTLINED_FUNCTION_0_0();
  uint64_t v8 = "+[NMSMediaItemGroup _itemsForContainerClass:containerIDs:includingNonLibraryContent:includingDownloadedContentOnl"
       "y:manuallyAdded:]";
  __int16 v9 = 2048;
  uint64_t v10 = v6;
  __int16 v11 = 2114;
  uint64_t v12 = a2;
  __int16 v13 = 2114;
  uint64_t v14 = a1;
  _os_log_debug_impl(&dword_2228FD000, a3, OS_LOG_TYPE_DEBUG, "%@ %s NMSMediaItemGroup: Fetched %tu items %{public}@, items @ %{public}@", (uint8_t *)v7, 0x34u);
}

@end