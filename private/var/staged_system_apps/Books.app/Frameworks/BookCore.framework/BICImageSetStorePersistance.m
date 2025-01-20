@interface BICImageSetStorePersistance
- (BICDataStoring)dataStore;
- (BICDescribedImageComparing)comparator;
- (BICImageSetPersisting)imageSetPersistence;
- (BICImageSetStorePersistance)initWithLevelID:(signed __int16)a3 comparator:(id)a4 dataStore:(id)a5;
- (BICImageSetStorePersistance)initWithLevelID:(signed __int16)a3 imageSetPersistence:(id)a4 comparator:(id)a5 dataStore:(id)a6;
- (BOOL)supportsImageSets;
- (NSString)identifier;
- (id)fetchEntryFromImageSet:(id)a3 matchingDescription:(id)a4 forRequest:(id)a5;
- (id)imageMatchingDescription:(id)a3 forRequest:(id)a4;
- (int64_t)costFor:(signed __int16)a3;
- (signed)levelID;
- (signed)storingMedium;
- (void)_afterAllStoreOperationsCompletedForDescribedImage:(id)a3 performBlock:(id)a4;
- (void)_clean:(id)a3;
- (void)_inventoryLevel:(signed __int16)a3 addLevelID:(BOOL)a4 completion:(id)a5;
- (void)addDescribedImages:(id)a3 forRequest:(id)a4 completion:(id)a5;
- (void)fetchImagesFromImageEntry:(id)a3 matchingDescription:(id)a4 forRequest:(id)a5 completion:(id)a6;
- (void)gatherPrunableItemsForMedium:(signed __int16)a3 level:(signed __int16)a4 withCompletion:(id)a5;
- (void)gatherPrunableItemsWithIdentifier:(id)a3 forMedium:(signed __int16)a4 level:(signed __int16)a5 withCompletion:(id)a6;
- (void)getPrimaryImageForRequest:(id)a3 completion:(id)a4;
- (void)getSortedBestMatchOf:(id)a3 completion:(id)a4;
- (void)incrementVersionForIdentifier:(id)a3;
- (void)incrementVersionForIdentifiers:(id)a3;
- (void)pruneItems:(id)a3 forMedium:(signed __int16)a4 withCompletion:(id)a5;
- (void)removeDescribedImages:(id)a3 completion:(id)a4;
- (void)setComparator:(id)a3;
- (void)setDataStore:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setImageSetPersistence:(id)a3;
- (void)setLevelID:(signed __int16)a3;
- (void)withImageSetForDescribedImage:(id)a3 performBlock:(id)a4;
@end

@implementation BICImageSetStorePersistance

- (BICImageSetStorePersistance)initWithLevelID:(signed __int16)a3 comparator:(id)a4 dataStore:(id)a5
{
  id v9 = a4;
  id v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)BICImageSetStorePersistance;
  v11 = [(BICImageSetStorePersistance *)&v14 init];
  v12 = v11;
  if (v11)
  {
    v11->_levelID = a3;
    objc_storeStrong((id *)&v11->_dataStore, a5);
    objc_storeStrong((id *)&v12->_comparator, a4);
  }

  return v12;
}

- (BICImageSetStorePersistance)initWithLevelID:(signed __int16)a3 imageSetPersistence:(id)a4 comparator:(id)a5 dataStore:(id)a6
{
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v17.receiver = self;
  v17.super_class = (Class)BICImageSetStorePersistance;
  objc_super v14 = [(BICImageSetStorePersistance *)&v17 init];
  v15 = v14;
  if (v14)
  {
    v14->_levelID = a3;
    objc_storeStrong((id *)&v14->_imageSetPersistence, a4);
    objc_storeStrong((id *)&v15->_dataStore, a6);
    objc_storeStrong((id *)&v15->_comparator, a5);
  }

  return v15;
}

- (id)imageMatchingDescription:(id)a3 forRequest:(id)a4
{
  return 0;
}

- (BOOL)supportsImageSets
{
  return 1;
}

- (void)withImageSetForDescribedImage:(id)a3 performBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(BICImageSetStorePersistance *)self imageSetPersistence];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_186D80;
  v11[3] = &unk_2CAE50;
  v11[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  [v8 withExistingImageSetForDescribedImage:v10 performBlock:v11];
}

- (void)getSortedBestMatchOf:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(BICImageSetStorePersistance *)self imageSetPersistence];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_187070;
  v11[3] = &unk_2CAE50;
  v11[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  [v8 withExistingImageSetForDescribedImage:v10 performBlock:v11];
}

- (void)_afterAllStoreOperationsCompletedForDescribedImage:(id)a3 performBlock:(id)a4
{
  id v5 = a4;
  id v6 = [(BICImageSetStorePersistance *)self dataStore];
  [v6 afterAllStoreOperationsCompletedPerformBlock:v5];
}

- (id)fetchEntryFromImageSet:(id)a3 matchingDescription:(id)a4 forRequest:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  unsigned int v11 = [v10 requestOptions];
  unsigned __int8 v12 = [v10 requestOptions];
  id v13 = [v9 entryLocationForLevelID:[self levelID]];
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  objc_super v14 = [v8 imageEntries];
  id v15 = [v14 countByEnumeratingWithState:&v27 objects:v31 count:16];
  if (v15)
  {
    id v16 = v15;
    id v26 = v8;
    LODWORD(v25) = v12 & 0x30;
    HIDWORD(v25) = v11;
    uint64_t v17 = *(void *)v28;
LABEL_3:
    uint64_t v18 = 0;
    while (1)
    {
      if (*(void *)v28 != v17) {
        objc_enumerationMutation(v14);
      }
      v19 = *(void **)(*((void *)&v27 + 1) + 8 * v18);
      v20 = [v19 entryLocation:v25];
      unsigned int v21 = [v20 isEqualToString:v13];

      if (v21) {
        break;
      }
      if (v16 == (id)++v18)
      {
        id v16 = [v14 countByEnumeratingWithState:&v27 objects:v31 count:16];
        if (v16) {
          goto LABEL_3;
        }
        goto LABEL_18;
      }
    }
    if ([v19 state] != 2)
    {
LABEL_18:
      id v22 = 0;
      id v8 = v26;
      goto LABEL_20;
    }
    id v8 = v26;
    if ([v19 isExpired]) {
      goto LABEL_17;
    }
    if ((v25 & 0x8000000000) != 0 && [v19 quality] == 101
      || !v25 && [v19 quality] == 3)
    {
      +[BICCacheStats logOperation:BICCacheStatsOperationIgnoringLowQualityImageEntry[0] forRequest:v10];
      goto LABEL_17;
    }
    v23 = +[NSDate date];
    [v19 setLastUsed:v23];

    id v22 = v19;
  }
  else
  {
LABEL_17:
    id v22 = 0;
  }
LABEL_20:

  return v22;
}

- (void)fetchImagesFromImageEntry:(id)a3 matchingDescription:(id)a4 forRequest:(id)a5 completion:(id)a6
{
  id v9 = a6;
  id v10 = a5;
  id v11 = a3;
  unsigned __int8 v12 = [(BICImageSetStorePersistance *)self dataStore];
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_187630;
  v14[3] = &unk_2C61E0;
  id v15 = v9;
  id v13 = v9;
  [v12 fetchImagesForEntry:v11 forRequest:v10 completion:v14];
}

- (void)getPrimaryImageForRequest:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(BICImageSetStorePersistance *)self imageSetPersistence];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_187764;
  v10[3] = &unk_2CAE78;
  id v11 = v6;
  id v9 = v6;
  [v8 withExistingImageSetForDescribedImage:v7 performBlock:v10];
}

- (void)addDescribedImages:(id)a3 forRequest:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = objc_opt_new();
  unsigned __int8 v12 = [(BICImageSetStorePersistance *)self dataStore];
  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v13 = v8;
  id v14 = [v13 countByEnumeratingWithState:&v27 objects:v31 count:16];
  if (v14)
  {
    uint64_t v15 = *(void *)v28;
    do
    {
      for (i = 0; i != v14; i = (char *)i + 1)
      {
        if (*(void *)v28 != v15) {
          objc_enumerationMutation(v13);
        }
        uint64_t v17 = *(void *)(*((void *)&v27 + 1) + 8 * i);
        if ([v12 canStoreDescribedImage:v17]) {
          [v11 addObject:v17];
        }
      }
      id v14 = [v13 countByEnumeratingWithState:&v27 objects:v31 count:16];
    }
    while (v14);
  }

  if ([v11 count])
  {
    objc_initWeak(&location, self);
    uint64_t v18 = [(BICImageSetStorePersistance *)self imageSetPersistence];
    uint64_t v19 = [(BICImageSetStorePersistance *)self levelID];
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_187B4C;
    v22[3] = &unk_2C7678;
    objc_copyWeak(&v25, &location);
    id v23 = v9;
    id v24 = v10;
    [v18 addImageEntriesForDescribedImages:v11 inLevelID:v19 addedEntries:v22];

    objc_destroyWeak(&v25);
    objc_destroyWeak(&location);
  }
  else
  {
    id v20 = objc_retainBlock(v10);
    unsigned int v21 = v20;
    if (v20) {
      (*((void (**)(id))v20 + 2))(v20);
    }
  }
}

- (void)incrementVersionForIdentifiers:(id)a3
{
  id v4 = a3;
  id v5 = [(BICImageSetStorePersistance *)self imageSetPersistence];
  [v5 incrementVersionForIdentifiers:v4];
}

- (void)incrementVersionForIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(BICImageSetStorePersistance *)self imageSetPersistence];
  [v5 incrementVersionForIdentifier:v4];
}

- (void)removeDescribedImages:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_opt_new();
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v9 = v6;
  id v10 = [v9 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v24;
    do
    {
      id v13 = 0;
      do
      {
        if (*(void *)v24 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = *(void *)(*((void *)&v23 + 1) + 8 * (void)v13);
        uint64_t v15 = [(BICImageSetStorePersistance *)self dataStore];
        unsigned int v16 = [v15 canStoreDescribedImage:v14];

        if (v16) {
          [v8 addObject:v14];
        }
        id v13 = (char *)v13 + 1;
      }
      while (v11 != v13);
      id v11 = [v9 countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v11);
  }

  if ([v8 count])
  {
    uint64_t v17 = [(BICImageSetStorePersistance *)self imageSetPersistence];
    uint64_t v18 = [(BICImageSetStorePersistance *)self levelID];
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_188064;
    v21[3] = &unk_2C4348;
    v21[4] = self;
    id v22 = v7;
    [v17 removeImageEntriesForDescribedImages:v8 inLevelID:v18 removedEntries:v21];
  }
  else
  {
    id v19 = objc_retainBlock(v7);
    id v20 = v19;
    if (v19) {
      (*((void (**)(id, void))v19 + 2))(v19, 0);
    }
  }
}

- (void)gatherPrunableItemsForMedium:(signed __int16)a3 level:(signed __int16)a4 withCompletion:(id)a5
{
  uint64_t v5 = a4;
  int v6 = a3;
  id v12 = a5;
  id v8 = [(BICImageSetStorePersistance *)self dataStore];
  unsigned int v9 = [v8 storingMedium];

  if (v9 == v6)
  {
    id v10 = [(BICImageSetStorePersistance *)self imageSetPersistence];
    [v10 gatherPrunableItemsForLevel:v5 withCompletion:v12];
  }
  else
  {
    id v11 = objc_retainBlock(v12);
    id v10 = v11;
    if (v11) {
      (*((void (**)(id, void *))v11 + 2))(v11, &__NSArray0__struct);
    }
  }
}

- (void)gatherPrunableItemsWithIdentifier:(id)a3 forMedium:(signed __int16)a4 level:(signed __int16)a5 withCompletion:(id)a6
{
  uint64_t v7 = a5;
  int v8 = a4;
  id v15 = a3;
  id v10 = a6;
  id v11 = [(BICImageSetStorePersistance *)self dataStore];
  unsigned int v12 = [v11 storingMedium];

  if (v12 == v8)
  {
    id v13 = [(BICImageSetStorePersistance *)self imageSetPersistence];
    [v13 gatherPrunableItemsWithIdentifier:v15 forLevel:v7 withCompletion:v10];
  }
  else
  {
    id v14 = objc_retainBlock(v10);
    id v13 = v14;
    if (v14) {
      (*((void (**)(id, void *))v14 + 2))(v14, &__NSArray0__struct);
    }
  }
}

- (void)pruneItems:(id)a3 forMedium:(signed __int16)a4 withCompletion:(id)a5
{
  uint64_t v6 = a4;
  id v8 = a3;
  id v9 = a5;
  id v10 = [(BICImageSetStorePersistance *)self dataStore];
  unsigned int v11 = [v10 storingMedium];

  if (v11 == v6)
  {
    unsigned int v12 = [(BICImageSetStorePersistance *)self imageSetPersistence];
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_188534;
    v15[3] = &unk_2C7150;
    v15[4] = self;
    [v12 pruneItems:v8 forMedium:v6 prunedEntry:v15 withCompletion:v9];
  }
  else
  {
    id v13 = objc_retainBlock(v9);
    id v14 = v13;
    if (v13) {
      (*((void (**)(id, void *))v13 + 2))(v13, &__NSArray0__struct);
    }
  }
}

- (int64_t)costFor:(signed __int16)a3
{
  uint64_t v3 = a3;
  id v4 = [(BICImageSetStorePersistance *)self dataStore];
  id v5 = [v4 costFor:v3];

  return (int64_t)v5;
}

- (signed)storingMedium
{
  v2 = [(BICImageSetStorePersistance *)self dataStore];
  signed __int16 v3 = (unsigned __int16)[v2 storingMedium];

  return v3;
}

- (void)_inventoryLevel:(signed __int16)a3 addLevelID:(BOOL)a4 completion:(id)a5
{
  BOOL v5 = a4;
  uint64_t v6 = a3;
  id v8 = a5;
  id v9 = [(BICImageSetStorePersistance *)self imageSetPersistence];
  [v9 _inventoryLevel:v6 addLevelID:v5 completion:v8];
}

- (void)_clean:(id)a3
{
  id v4 = a3;
  id v5 = [(BICImageSetStorePersistance *)self imageSetPersistence];
  [v5 _clean:v4];
}

- (NSString)identifier
{
  return self->identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (BICDescribedImageComparing)comparator
{
  return self->_comparator;
}

- (void)setComparator:(id)a3
{
}

- (BICImageSetPersisting)imageSetPersistence
{
  return self->_imageSetPersistence;
}

- (void)setImageSetPersistence:(id)a3
{
}

- (BICDataStoring)dataStore
{
  return self->_dataStore;
}

- (void)setDataStore:(id)a3
{
}

- (signed)levelID
{
  return self->_levelID;
}

- (void)setLevelID:(signed __int16)a3
{
  self->_levelID = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataStore, 0);
  objc_storeStrong((id *)&self->_imageSetPersistence, 0);
  objc_storeStrong((id *)&self->_comparator, 0);

  objc_storeStrong((id *)&self->identifier, 0);
}

@end