@interface NMSAudiobooksMediaItemGroup
- (id)identifiersForContainerType:(unint64_t)a3;
- (id)itemList;
- (void)itemList;
@end

@implementation NMSAudiobooksMediaItemGroup

- (id)identifiersForContainerType:(unint64_t)a3
{
  v5 = [MEMORY[0x263EFF980] array];
  if ([(NMSMediaItemGroup *)self type] == a3)
  {
    v6 = [(NMSMediaItemGroup *)self referenceObj];
    id v7 = objc_alloc(MEMORY[0x263F11DB0]);
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __59__NMSAudiobooksMediaItemGroup_identifiersForContainerType___block_invoke;
    v12[3] = &unk_264633DA0;
    id v13 = v6;
    id v8 = v6;
    v9 = (void *)[v7 initWithBlock:v12];
    [v5 addObject:v9];
  }
  v10 = (void *)[v5 copy];

  return v10;
}

void __59__NMSAudiobooksMediaItemGroup_identifiersForContainerType___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 audiobookIdentifier];
  objc_msgSend(v3, "setStoreAdamID:", objc_msgSend(v4, "longLongValue"));
}

- (id)itemList
{
  uint64_t v54 = *MEMORY[0x263EF8340];
  id v3 = [(NMSMediaItemGroup *)self referenceObj];
  id v4 = [v3 audiobookMediaItem];
  if (!v4)
  {
    v5 = NMLogForCategory(5);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      [(NMSAudiobooksMediaItemGroup *)(uint64_t)v3 itemList];
    }
    goto LABEL_8;
  }
  if ([(NMSMediaItemGroup *)self downloadedItemsOnly])
  {
    v5 = +[NMSAudiobookCacheItemMetadata metaDataForMediaItem:v4];
    if (!v5)
    {
      v5 = NMLogForCategory(5);
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
        -[NMSAudiobooksMediaItemGroup itemList](v5);
      }
LABEL_8:
      v12 = (void *)MEMORY[0x263EFFA68];
      goto LABEL_22;
    }
  }
  else
  {
    v5 = 0;
  }
  id v13 = [v4 valueForProperty:*MEMORY[0x263F11258]];
  [v13 doubleValue];
  double v15 = v14;

  v16 = [v4 valueForProperty:*MEMORY[0x263F11380]];
  [v16 doubleValue];
  double v18 = v17;

  v19 = [v4 valueForProperty:*MEMORY[0x263F11250]];
  v20 = v19;
  if (v19 && [v19 unsignedIntegerValue]) {
    unint64_t v21 = [v20 unsignedIntegerValue];
  }
  else {
    unint64_t v21 = 64000;
  }
  if ([(NMSMediaItemGroup *)self downloadedItemsOnly])
  {
    [v5 cachedStartTime];
    double v23 = v22;
    [v5 cachedDuration];
    double v25 = v23 + v24;
  }
  else
  {
    double v23 = fmax(v15 + -300.0, 0.0);
    unint64_t v26 = [v3 downloadLimit];
    if (v18 >= v15 + (double)v26) {
      double v25 = v15 + (double)v26;
    }
    else {
      double v25 = v18;
    }
  }
  double v27 = (v25 - v23) * (double)v21 * 0.125;
  v28 = NMLogForCategory(5);
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138414594;
    v35 = v4;
    __int16 v36 = 2048;
    double v37 = v15;
    __int16 v38 = 2048;
    double v39 = v18;
    __int16 v40 = 2112;
    v41 = v20;
    __int16 v42 = 2048;
    unint64_t v43 = v21;
    __int16 v44 = 2048;
    double v45 = v23;
    __int16 v46 = 2048;
    double v47 = v25;
    __int16 v48 = 2048;
    double v49 = v25;
    __int16 v50 = 2048;
    double v51 = (v25 - v23) * (double)v21 * 0.125;
    __int16 v52 = 2048;
    double v53 = v51;
    _os_log_debug_impl(&dword_2228FD000, v28, OS_LOG_TYPE_DEBUG, "[Audiobook Quota Evaluation] Item: %@, Bookmark Time: %f, Book Duration: %f, MediaLibrary BitRate: %@, Final BitRate: %lu, Start Time: %f, Minimum End Time: %f, Expected End Time: %f, Minimum Size: %f, Expected Size: %f", buf, 0x66u);
  }

  v29 = [NMSPartialDownloadableItem alloc];
  v30 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v4, "persistentID"));
  v31 = [(NMSPartialDownloadableItem *)v29 initWithMediaLibraryIdentifier:v30 externalLibraryIdentifier:0 size:(unint64_t)v27 itemType:2 manuallyAdded:[(NMSMediaItemGroup *)self manuallyAdded] minimumSize:(unint64_t)v27 offset:(unint64_t)v23];
  v33 = v31;
  v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v33 count:1];

LABEL_22:

  return v12;
}

- (void)itemList
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_2228FD000, log, OS_LOG_TYPE_DEBUG, "[Audiobook Quota Evaluation] downloadedItemsOnly is true but audiobook is not downloaded", v1, 2u);
}

@end