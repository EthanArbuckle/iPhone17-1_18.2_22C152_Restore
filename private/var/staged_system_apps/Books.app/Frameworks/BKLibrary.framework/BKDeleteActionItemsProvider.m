@interface BKDeleteActionItemsProvider
- (BKCollection)collection;
- (BKDeleteActionItemsProvider)initWithBooks:(id)a3 currentCollectionId:(id)a4;
- (BOOL)canDeleteFromAllDevices;
- (BOOL)canRemoveFromCollection;
- (BOOL)isRemovingFromWantToRead;
- (BOOL)memberOfOtherManualCollection;
- (BOOL)memberOfSampleCollection;
- (NSArray)actionItems;
- (NSSet)booksToDelete;
- (NSString)collectionId;
- (id)_assetPurchasedDSIDForLibraryAsset:(id)a3;
- (int64_t)localOnlyBookCount;
- (unint64_t)cloudITSAudiobookCount;
- (unint64_t)countForActionItem:(int64_t)a3;
- (unint64_t)downloadingCount;
- (unint64_t)ghostBookCount;
- (unint64_t)iTunesUCount;
- (unint64_t)localITSAudiobookCount;
- (unint64_t)localJaliscoBooksOnlyCount;
- (unint64_t)localSampleCount;
- (unint64_t)localUbiquityCount;
- (unint64_t)localiTunesUCount;
- (unint64_t)nonLocalSampleCount;
- (unint64_t)nonStoreAudiobookCount;
- (unint64_t)nonlocalUbiquityCount;
- (unint64_t)nonlocaliTunesUCount;
- (unint64_t)pdfCount;
- (unint64_t)recentBooksCount;
- (unint64_t)sampleCount;
- (unint64_t)seriesItemCount;
- (unint64_t)seriesStackCount;
- (unint64_t)sideloadedItemCount;
- (unint64_t)storeItemCount;
- (unint64_t)ubiquityCount;
- (unint64_t)ubiquityErrorCount;
- (void)computeCounts;
@end

@implementation BKDeleteActionItemsProvider

- (BKDeleteActionItemsProvider)initWithBooks:(id)a3 currentCollectionId:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)BKDeleteActionItemsProvider;
  v9 = [(BKDeleteActionItemsProvider *)&v14 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_booksToDelete, a3);
    v11 = (NSString *)[v8 copy];
    collectionId = v10->_collectionId;
    v10->_collectionId = v11;

    [(BKDeleteActionItemsProvider *)v10 computeCounts];
  }

  return v10;
}

- (void)computeCounts
{
  v3 = +[BUAccountsProvider sharedProvider];
  unsigned int v62 = [v3 isUserSignedInToiCloud];

  v4 = +[BUAccountsProvider sharedProvider];
  v5 = [v4 activeStoreAccount];
  v6 = [v5 ams_DSID];
  v41 = [v6 stringValue];

  id v7 = [(BKDeleteActionItemsProvider *)self booksToDelete];
  v40 = +[NSMutableSet setWithCapacity:](NSMutableSet, "setWithCapacity:", [v7 count]);

  id v8 = [(BKDeleteActionItemsProvider *)self collectionId];
  long long v69 = 0u;
  long long v70 = 0u;
  long long v71 = 0u;
  long long v72 = 0u;
  v38 = self;
  id obj = [(BKDeleteActionItemsProvider *)self booksToDelete];
  id v63 = [obj countByEnumeratingWithState:&v69 objects:v74 count:16];
  if (v63)
  {
    unint64_t v53 = 0;
    unint64_t v54 = 0;
    unint64_t v59 = 0;
    unint64_t v60 = 0;
    unint64_t v9 = 0;
    unint64_t v48 = 0;
    unint64_t v49 = 0;
    unint64_t v44 = 0;
    unint64_t v45 = 0;
    unint64_t v42 = 0;
    unint64_t v43 = 0;
    unint64_t v51 = 0;
    unint64_t v52 = 0;
    char v58 = 0;
    int v10 = 0;
    unint64_t v46 = 0;
    unint64_t v47 = 0;
    unint64_t v55 = 0;
    unint64_t v56 = 0;
    v39 = 0;
    unint64_t v50 = 0;
    uint64_t v61 = *(void *)v70;
    do
    {
      for (i = 0; i != v63; i = (char *)i + 1)
      {
        if (*(void *)v70 != v61) {
          objc_enumerationMutation(obj);
        }
        v12 = *(void **)(*((void *)&v69 + 1) + 8 * i);
        unsigned int v13 = [v12 isInSamples];
        if ([v12 iTunesU])
        {
          if ([v12 isLocal]) {
            ++v55;
          }
          else {
            v56 += [v12 isCloud];
          }
        }
        else
        {
          objc_super v14 = [v12 storeID];
          id v15 = [v14 longLongValue];

          if (v15)
          {
            if ([v12 isCloud])
            {
              ++v50;
            }
            else if (([v12 isStoreItem] ^ 1 | v13))
            {
              if ([v12 isDownloading])
              {
                ++v46;
              }
              else if ([v12 isSample])
              {
                ++v45;
              }
              else if ([v12 isNonLocalSample])
              {
                ++v44;
              }
              else if ([v12 isSeriesItem])
              {
                ++v43;
              }
              else if ([v12 isContainer])
              {
                ++v42;
              }
              else
              {
                if (v41 && [v12 isBook])
                {
                  v16 = [(BKDeleteActionItemsProvider *)v38 _assetPurchasedDSIDForLibraryAsset:v12];
                  v39 += [v16 isEqualToString:v41];
                }
                v17 = [v12 storeID];
                [v40 addObject:v17];
              }
            }
            else
            {
              ++v49;
            }
          }
          else
          {
            ++v54;
            if ([v12 canRedownload])
            {
              if ([v12 isLocal]) {
                ++v47;
              }
              else {
                v48 += [v12 isCloud];
              }
            }
          }
        }
        if ([v12 isAudiobook])
        {
          v18 = [v12 storeID];
          id v19 = [v18 longLongValue];

          if (v19)
          {
            if ([v12 isCloud]) {
              ++v52;
            }
            else {
              v51 += [v12 isLocal];
            }
          }
          else
          {
            ++v53;
          }
        }
        if (v62)
        {
          v20 = +[BKLibraryAssetStatusController sharedController];
          v21 = [v12 permanentOrTemporaryAssetID];
          v22 = [v20 statusForAssetID:v21];

          if (v22)
          {
            v23 = (char *)[v22 state];
            unint64_t v24 = v59;
            if (v23 == (unsigned char *)&dword_8 + 2) {
              unint64_t v24 = v59 + 1;
            }
            unint64_t v59 = v24;
          }
        }
        if ([v12 contentType] == 3) {
          ++v9;
        }
        if ([v12 isTrackedAsRecent]
          && (![v12 isStoreItem]
           || ([v12 isAudiobook] & 1) == 0))
        {
          ++v60;
        }
        long long v67 = 0u;
        long long v68 = 0u;
        long long v65 = 0u;
        long long v66 = 0u;
        v25 = [v12 collectionMembers];
        id v26 = [v25 countByEnumeratingWithState:&v65 objects:v73 count:16];
        if (v26)
        {
          id v27 = v26;
          v64 = i;
          unsigned int v28 = v13;
          int v29 = v10;
          unint64_t v30 = v9;
          uint64_t v31 = *(void *)v66;
          while (2)
          {
            for (j = 0; j != v27; j = (char *)j + 1)
            {
              if (*(void *)v66 != v31) {
                objc_enumerationMutation(v25);
              }
              v33 = [*(id *)(*((void *)&v65 + 1) + 8 * (void)j) collection];
              v34 = [v33 collectionID];

              if (v34
                && ([v8 isEqualToString:v34] & 1) == 0
                && +[BKCollection allowsManualAdditionToCollectionWithID:v34])
              {

                char v58 = 1;
                goto LABEL_63;
              }
            }
            id v27 = [v25 countByEnumeratingWithState:&v65 objects:v73 count:16];
            if (v27) {
              continue;
            }
            break;
          }
LABEL_63:
          unint64_t v9 = v30;
          int v10 = v29;
          unsigned int v13 = v28;
          i = v64;
        }
        v10 |= v13;
      }
      id v63 = [obj countByEnumeratingWithState:&v69 objects:v74 count:16];
    }
    while (v63);
  }
  else
  {
    unint64_t v53 = 0;
    unint64_t v54 = 0;
    unint64_t v59 = 0;
    unint64_t v60 = 0;
    unint64_t v9 = 0;
    unint64_t v48 = 0;
    unint64_t v49 = 0;
    unint64_t v44 = 0;
    unint64_t v45 = 0;
    unint64_t v42 = 0;
    unint64_t v43 = 0;
    unint64_t v51 = 0;
    unint64_t v52 = 0;
    char v58 = 0;
    LOBYTE(v10) = 0;
    unint64_t v46 = 0;
    unint64_t v47 = 0;
    unint64_t v55 = 0;
    unint64_t v56 = 0;
    v39 = 0;
    unint64_t v50 = 0;
  }

  if ([v40 count])
  {
    v35 = +[BKLibraryManager defaultManager];
    v36 = [v35 assetIDsInDataSourceWithIdentifier:@"com.apple.ibooks.datasource.jalisco.purchases" intersectingWithAssetIDs:v40];

    id v37 = v39;
    if ([v36 count]) {
      id v37 = [v36 count];
    }
  }
  else
  {
    id v37 = v39;
  }
  v38->_ghostBookCount = v50;
  v38->_localJaliscoBooksOnlyCount = (unint64_t)v37;
  v38->_localUbiquityCount = v47;
  v38->_nonlocalUbiquityCount = v48;
  v38->_localiTunesUCount = v55;
  v38->_nonlocaliTunesUCount = v56;
  v38->_downloadingCount = v46;
  v38->_localITSAudiobookCount = v51;
  v38->_cloudITSAudiobookCount = v52;
  v38->_nonStoreAudiobookCount = v53;
  v38->_ubiquityErrorCount = v59;
  v38->_pdfCount = v9;
  v38->_storeItemCount = v49;
  v38->_localSampleCount = v45;
  v38->_nonLocalSampleCount = v44;
  v38->_recentBooksCount = v60;
  v38->_memberOfOtherManualCollection = v58 & 1;
  v38->_memberOfSampleCollection = v10 & 1;
  v38->_seriesItemCount = v43;
  v38->_seriesStackCount = v42;
  v38->_sideloadedItemCount = v54;
}

- (unint64_t)ubiquityCount
{
  unint64_t v3 = [(BKDeleteActionItemsProvider *)self localUbiquityCount];
  return [(BKDeleteActionItemsProvider *)self nonlocalUbiquityCount] + v3;
}

- (unint64_t)iTunesUCount
{
  unint64_t v3 = [(BKDeleteActionItemsProvider *)self localiTunesUCount];
  return [(BKDeleteActionItemsProvider *)self nonlocaliTunesUCount] + v3;
}

- (int64_t)localOnlyBookCount
{
  unint64_t v3 = [(BKDeleteActionItemsProvider *)self booksToDelete];
  id v15 = [v3 count];
  unint64_t v14 = [(BKDeleteActionItemsProvider *)self ghostBookCount];
  unint64_t v4 = [(BKDeleteActionItemsProvider *)self localJaliscoBooksOnlyCount];
  unint64_t v5 = [(BKDeleteActionItemsProvider *)self localITSAudiobookCount];
  unint64_t v6 = [(BKDeleteActionItemsProvider *)self ubiquityCount];
  unint64_t v7 = [(BKDeleteActionItemsProvider *)self iTunesUCount];
  unint64_t v8 = [(BKDeleteActionItemsProvider *)self downloadingCount];
  unint64_t v9 = [(BKDeleteActionItemsProvider *)self storeItemCount];
  unint64_t v10 = [(BKDeleteActionItemsProvider *)self sampleCount];
  unint64_t v11 = [(BKDeleteActionItemsProvider *)self seriesItemCount];
  int64_t v12 = v15
      - ((unsigned char *)[(BKDeleteActionItemsProvider *)self seriesStackCount]
       + v10
       + v11)
      - (v14
       + v4
       + v5
       + v6
       + v7
       + v8
       + v9);

  return v12;
}

- (unint64_t)sampleCount
{
  unint64_t v3 = [(BKDeleteActionItemsProvider *)self localSampleCount];
  return [(BKDeleteActionItemsProvider *)self nonLocalSampleCount] + v3;
}

- (BOOL)canDeleteFromAllDevices
{
  BOOL v3 = (![(BKDeleteActionItemsProvider *)self localOnlyBookCount]
     || [(BKDeleteActionItemsProvider *)self ubiquityCount]
     || [(BKDeleteActionItemsProvider *)self iTunesUCount])
    && ![(BKDeleteActionItemsProvider *)self ghostBookCount]
    && ![(BKDeleteActionItemsProvider *)self localJaliscoBooksOnlyCount]
    && ![(BKDeleteActionItemsProvider *)self localITSAudiobookCount]
    && [(BKDeleteActionItemsProvider *)self seriesStackCount] == 0;
  if (![(BKDeleteActionItemsProvider *)self ubiquityCount]
    && ![(BKDeleteActionItemsProvider *)self iTunesUCount])
  {
    unint64_t v4 = [(BKDeleteActionItemsProvider *)self collectionId];
    if ([v4 isEqualToString:kBKCollectionDefaultAll])
    {

      return 0;
    }
    unint64_t v5 = [(BKDeleteActionItemsProvider *)self collection];
    unsigned int v6 = [v5 isSeriesCollection];

    if (v6) {
      return 0;
    }
  }
  return v3;
}

- (BOOL)canRemoveFromCollection
{
  v2 = [(BKDeleteActionItemsProvider *)self collection];
  unsigned __int8 v3 = [v2 deleteRemovesFromCollection];

  return v3;
}

- (BKCollection)collection
{
  unsigned __int8 v3 = [(BKDeleteActionItemsProvider *)self collectionId];

  if (v3)
  {
    objc_opt_class();
    unint64_t v4 = +[BKLibraryManager defaultManager];
    unint64_t v5 = [v4 collectionProvider];
    unsigned int v6 = [(BKDeleteActionItemsProvider *)self collectionId];
    unint64_t v7 = [v5 collectionOnMainQueueWithCollectionID:v6 error:0];
    unint64_t v8 = BUDynamicCast();
  }
  else
  {
    unint64_t v8 = 0;
  }

  return (BKCollection *)v8;
}

- (NSArray)actionItems
{
  unsigned __int8 v3 = +[BUAccountsProvider sharedProvider];
  unsigned int v4 = [v3 isUserSignedInToiCloud];

  unsigned int v5 = [(BKDeleteActionItemsProvider *)self canRemoveFromCollection];
  unsigned int v6 = [(BKDeleteActionItemsProvider *)self canDeleteFromAllDevices];
  if (v4)
  {
    unsigned int v7 = v6;
    if ([(BKDeleteActionItemsProvider *)self localUbiquityCount]
      || [(BKDeleteActionItemsProvider *)self localiTunesUCount])
    {
      goto LABEL_14;
    }
    if (v7
      && ([(BKDeleteActionItemsProvider *)self nonlocalUbiquityCount]
       || [(BKDeleteActionItemsProvider *)self nonlocaliTunesUCount]))
    {
      int v8 = 0;
      int v9 = 0;
      int v10 = 0;
      unsigned int v7 = 1;
      goto LABEL_15;
    }
    if ([(BKDeleteActionItemsProvider *)self ubiquityErrorCount]) {
      goto LABEL_46;
    }
  }
  if ([(BKDeleteActionItemsProvider *)self localOnlyBookCount] >= 1
    && ![(BKDeleteActionItemsProvider *)self sampleCount])
  {
LABEL_46:
    unsigned int v7 = 0;
    int v8 = 0;
    int v9 = 0;
    int v10 = 1;
  }
  else
  {
    if ([(BKDeleteActionItemsProvider *)self localJaliscoBooksOnlyCount]
      || [(BKDeleteActionItemsProvider *)self localITSAudiobookCount])
    {
      unsigned int v7 = 0;
LABEL_14:
      int v9 = 0;
      int v10 = 0;
      int v8 = 1;
      goto LABEL_15;
    }
    if ([(BKDeleteActionItemsProvider *)self sampleCount])
    {
      if ([(BKDeleteActionItemsProvider *)self localSampleCount]
        && ([(NSString *)self->_collectionId isEqualToString:kBKCollectionDefaultAll]
         || [(NSString *)self->_collectionId isEqualToString:kBKCollectionDefaultIDSamples]
         || [(NSString *)self->_collectionId isEqualToString:kBKCollectionDefaultIDDownloaded]))
      {
        unsigned int v7 = 0;
        int v10 = 0;
        int v8 = 1;
      }
      else
      {
        unsigned int v7 = 0;
        int v8 = 0;
        int v10 = 0;
      }
      int v9 = 1;
    }
    else
    {
      if ([(BKDeleteActionItemsProvider *)self storeItemCount]) {
        unsigned int v7 = [(BKDeleteActionItemsProvider *)self memberOfOtherManualCollection];
      }
      else {
        unsigned int v7 = 0;
      }
      int v8 = 0;
      int v9 = 0;
      int v10 = 0;
    }
  }
LABEL_15:
  if ([(BKDeleteActionItemsProvider *)self sideloadedItemCount]) {
    int v11 = 0;
  }
  else {
    int v11 = [(BKDeleteActionItemsProvider *)self countForActionItem:7] != 0;
  }
  if ([(BKDeleteActionItemsProvider *)self downloadingCount]) {
    int v12 = 1;
  }
  else {
    int v12 = v8;
  }
  unsigned int v13 = [(BKDeleteActionItemsProvider *)self memberOfSampleCollection];
  if ([(BKDeleteActionItemsProvider *)self storeItemCount])
  {
    unint64_t v14 = [(BKDeleteActionItemsProvider *)self collectionId];
    if (v14) {
      int v15 = v5 ^ 1;
    }
    else {
      int v15 = 0;
    }
  }
  else
  {
    int v15 = 0;
  }
  v16 = +[NSMutableArray arrayWithCapacity:3];
  v17 = v16;
  if (v5) {
    [v16 addObject:&off_D9EC0];
  }
  if ([(BKDeleteActionItemsProvider *)self memberOfSampleCollection])
  {
    v18 = [(BKDeleteActionItemsProvider *)self collectionId];
    unsigned __int8 v19 = [v18 isEqualToString:kBKCollectionDefaultIDSamples];

    if ((v19 & 1) == 0) {
      [v17 addObject:&off_D9ED8];
    }
  }
  v20 = +[UIApplication sharedApplication];
  unsigned __int8 v21 = [(id)objc_opt_class() isRunningInStoreDemoMode];

  if ((v21 & 1) == 0)
  {
    if (v12) {
      [v17 addObject:&off_D9EF0];
    }
    if (v11) {
      [v17 addObject:&off_D9F08];
    }
    if (v10 | v15) {
      [v17 addObject:&off_D9F20];
    }
    if (v7) {
      [v17 addObject:&off_D9F38];
    }
    if (v9 | v13 & ~v11 & (v7 ^ 1)) {
      [v17 addObject:&off_D9F50];
    }
  }
  id v22 = [v17 copy];

  return (NSArray *)v22;
}

- (unint64_t)countForActionItem:(int64_t)a3
{
  if (a3 == 7)
  {
    if ((+[BLLibraryUtility _isMultiUser] & 1) == 0)
    {
      int v8 = +[BURestrictionsProvider sharedInstance];
      unsigned int v9 = [v8 isAccountModificationAllowed];

      if (v9)
      {
        unint64_t v10 = [(BKDeleteActionItemsProvider *)self localJaliscoBooksOnlyCount];
        int v11 = (char *)[(BKDeleteActionItemsProvider *)self localITSAudiobookCount] + v10;
        return [(BKDeleteActionItemsProvider *)self ghostBookCount] + (void)v11;
      }
    }
    return 0;
  }
  if (a3 != 2) {
    return 0;
  }
  unsigned int v4 = +[BUAccountsProvider sharedProvider];
  unsigned int v5 = [v4 isUserSignedInToiCloud];

  if (v5)
  {
    unint64_t v6 = [(BKDeleteActionItemsProvider *)self localUbiquityCount];
    unint64_t v7 = [(BKDeleteActionItemsProvider *)self localiTunesUCount];
  }
  else
  {
    unint64_t v6 = 0;
    unint64_t v7 = 0;
  }
  unint64_t v13 = [(BKDeleteActionItemsProvider *)self localJaliscoBooksOnlyCount];
  unint64_t v14 = [(BKDeleteActionItemsProvider *)self localITSAudiobookCount];
  return [(BKDeleteActionItemsProvider *)self localSampleCount] + v14 + v7 + v6 + v13;
}

- (id)_assetPurchasedDSIDForLibraryAsset:(id)a3
{
  id v3 = a3;
  uint64_t v12 = 0;
  unint64_t v13 = &v12;
  uint64_t v14 = 0x3032000000;
  int v15 = sub_51438;
  v16 = sub_51448;
  id v17 = 0;
  dispatch_semaphore_t v4 = dispatch_semaphore_create(0);
  unsigned int v5 = +[BKLibraryManager defaultManager];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_51450;
  v9[3] = &unk_D2E70;
  int v11 = &v12;
  unint64_t v6 = v4;
  unint64_t v10 = v6;
  [v5 assetAccountIdentifiersForAsset:v3 completion:v9];

  dispatch_semaphore_wait(v6, 0xFFFFFFFFFFFFFFFFLL);
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);

  return v7;
}

- (NSSet)booksToDelete
{
  return self->_booksToDelete;
}

- (NSString)collectionId
{
  return self->_collectionId;
}

- (unint64_t)ghostBookCount
{
  return self->_ghostBookCount;
}

- (unint64_t)localJaliscoBooksOnlyCount
{
  return self->_localJaliscoBooksOnlyCount;
}

- (unint64_t)localUbiquityCount
{
  return self->_localUbiquityCount;
}

- (unint64_t)nonlocalUbiquityCount
{
  return self->_nonlocalUbiquityCount;
}

- (unint64_t)localiTunesUCount
{
  return self->_localiTunesUCount;
}

- (unint64_t)nonlocaliTunesUCount
{
  return self->_nonlocaliTunesUCount;
}

- (unint64_t)downloadingCount
{
  return self->_downloadingCount;
}

- (unint64_t)localITSAudiobookCount
{
  return self->_localITSAudiobookCount;
}

- (unint64_t)cloudITSAudiobookCount
{
  return self->_cloudITSAudiobookCount;
}

- (unint64_t)nonStoreAudiobookCount
{
  return self->_nonStoreAudiobookCount;
}

- (unint64_t)ubiquityErrorCount
{
  return self->_ubiquityErrorCount;
}

- (unint64_t)pdfCount
{
  return self->_pdfCount;
}

- (unint64_t)storeItemCount
{
  return self->_storeItemCount;
}

- (unint64_t)localSampleCount
{
  return self->_localSampleCount;
}

- (unint64_t)nonLocalSampleCount
{
  return self->_nonLocalSampleCount;
}

- (unint64_t)recentBooksCount
{
  return self->_recentBooksCount;
}

- (BOOL)memberOfOtherManualCollection
{
  return self->_memberOfOtherManualCollection;
}

- (BOOL)memberOfSampleCollection
{
  return self->_memberOfSampleCollection;
}

- (unint64_t)seriesItemCount
{
  return self->_seriesItemCount;
}

- (unint64_t)seriesStackCount
{
  return self->_seriesStackCount;
}

- (unint64_t)sideloadedItemCount
{
  return self->_sideloadedItemCount;
}

- (BOOL)isRemovingFromWantToRead
{
  return self->_isRemovingFromWantToRead;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_collectionId, 0);

  objc_storeStrong((id *)&self->_booksToDelete, 0);
}

@end