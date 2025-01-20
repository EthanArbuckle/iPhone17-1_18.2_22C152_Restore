@interface BICImageSetStore
- (BICDataStoring)dataStore;
- (BICDescribedImageComparing)comparator;
- (BICImageSetStore)initWithLevelID:(signed __int16)a3 comparator:(id)a4 dataStore:(id)a5;
- (BOOL)supportsImageSets;
- (NSMutableSet)imagesInCacheSinceLaunch;
- (NSString)identifier;
- (id)_imageEntryLocationMatchingDescription:(id)a3;
- (id)fetchEntryFromImageSet:(id)a3 matchingDescription:(id)a4 forRequest:(id)a5;
- (id)imageMatchingDescription:(id)a3 forRequest:(id)a4;
- (int64_t)costFor:(signed __int16)a3;
- (signed)levelID;
- (signed)storingMedium;
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
- (void)setImagesInCacheSinceLaunch:(id)a3;
- (void)setLevelID:(signed __int16)a3;
- (void)withImageSetForDescribedImage:(id)a3 performBlock:(id)a4;
@end

@implementation BICImageSetStore

- (BICImageSetStore)initWithLevelID:(signed __int16)a3 comparator:(id)a4 dataStore:(id)a5
{
  id v9 = a4;
  id v10 = a5;
  v16.receiver = self;
  v16.super_class = (Class)BICImageSetStore;
  v11 = [(BICImageSetStore *)&v16 init];
  v12 = v11;
  if (v11)
  {
    v11->_accessLock._os_unfair_lock_opaque = 0;
    uint64_t v13 = +[NSMutableSet set];
    imagesInCacheSinceLaunch = v12->_imagesInCacheSinceLaunch;
    v12->_imagesInCacheSinceLaunch = (NSMutableSet *)v13;

    v12->_levelID = a3;
    objc_storeStrong((id *)&v12->_comparator, a4);
    objc_storeStrong((id *)&v12->_dataStore, a5);
  }

  return v12;
}

- (id)imageMatchingDescription:(id)a3 forRequest:(id)a4
{
  id v6 = a4;
  v7 = [(BICImageSetStore *)self _imageEntryLocationMatchingDescription:a3];
  if (v7)
  {
    v8 = [(BICImageSetStore *)self dataStore];
    id v9 = [v8 imageForEntryLocation:v7];
  }
  else
  {
    id v9 = 0;
  }
  unsigned __int8 v10 = [v6 requestOptions];
  unsigned int v11 = [v9 quality];
  if ((v10 & 0x80) != 0 && v11 == 101 || (v10 & 0x30) == 0 && v11 == 3)
  {

    +[BICCacheStats logOperation:BICCacheStatsOperationIgnoringLowQualityImageEntry[0] forRequest:v6];
    id v9 = 0;
  }
  v12 = BICCacheStatsOperationSyncFetchExactSuccess;
  if (!v9) {
    v12 = BICCacheStatsOperationSyncFetchExactFail;
  }
  +[BICCacheStats logOperation:*v12 forRequest:v6];
  +[BICCacheStats logDescribedImage:v9 withComment:@"ImageSetStoreLoadMatchedImage"];

  return v9;
}

- (void)incrementVersionForIdentifiers:(id)a3
{
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_6D45C;
  v6[3] = &unk_2C3AF8;
  p_accessLock = &self->_accessLock;
  id v7 = a3;
  v8 = self;
  id v5 = v7;
  os_unfair_lock_lock(p_accessLock);
  sub_6D45C((uint64_t)v6);
  os_unfair_lock_unlock(p_accessLock);
}

- (BOOL)supportsImageSets
{
  return 0;
}

- (void)withImageSetForDescribedImage:(id)a3 performBlock:(id)a4
{
}

- (void)getSortedBestMatchOf:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [v6 identifier];
  uint64_t v21 = 0;
  v22 = &v21;
  uint64_t v23 = 0x3032000000;
  v24 = sub_6D8A8;
  v25 = sub_6D8B8;
  id v26 = 0;
  if ([v8 length])
  {
    p_accessLock = &self->_accessLock;
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v15 = sub_6D8C0;
    objc_super v16 = &unk_2C5680;
    v17 = self;
    id v18 = v8;
    v20 = &v21;
    id v19 = v6;
    unsigned __int8 v10 = v14;
    os_unfair_lock_lock(p_accessLock);
    v15((uint64_t)v10);
    os_unfair_lock_unlock(p_accessLock);
  }
  else
  {
    unsigned int v11 = (void *)v22[5];
    v22[5] = (uint64_t)&__NSArray0__struct;
  }
  id v12 = objc_retainBlock(v7);
  uint64_t v13 = v12;
  if (v12) {
    (*((void (**)(id, uint64_t))v12 + 2))(v12, v22[5]);
  }

  _Block_object_dispose(&v21, 8);
}

- (void)getPrimaryImageForRequest:(id)a3 completion:(id)a4
{
}

- (id)fetchEntryFromImageSet:(id)a3 matchingDescription:(id)a4 forRequest:(id)a5
{
  return 0;
}

- (void)fetchImagesFromImageEntry:(id)a3 matchingDescription:(id)a4 forRequest:(id)a5 completion:(id)a6
{
  id v6 = objc_retainBlock(a6);
  if (v6)
  {
    id v7 = v6;
    (*((void (**)(id, void))v6 + 2))(v6, 0);
    id v6 = v7;
  }
}

- (void)addDescribedImages:(id)a3 forRequest:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v24 = a4;
  id v23 = a5;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id v9 = [v8 countByEnumeratingWithState:&v30 objects:v34 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v31;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v31 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void **)(*((void *)&v30 + 1) + 8 * i);
        v14 = [(BICImageSetStore *)self dataStore];
        unsigned int v15 = [v14 canStoreDescribedImage:v13];

        if (v15)
        {
          objc_super v16 = [v13 entryLocationForLevelID:[self levelID]];
          v17 = [(BICImageSetStore *)self dataStore];
          id v18 = [v17 imageForEntryLocation:v16];

          LODWORD(v17) = [v13 quality];
          if (v17 > [v18 quality])
          {
            v25[0] = _NSConcreteStackBlock;
            v25[1] = 3221225472;
            id v26 = sub_6DD60;
            v27 = &unk_2C3AF8;
            v28 = self;
            id v19 = v16;
            id v29 = v19;
            os_unfair_lock_lock(&self->_accessLock);
            v26((uint64_t)v25);
            os_unfair_lock_unlock(&self->_accessLock);
            v20 = [(BICImageSetStore *)self dataStore];
            [v20 storeImage:v13 forRequest:v24 forEntryLocation:v19];
          }
        }
      }
      id v10 = [v8 countByEnumeratingWithState:&v30 objects:v34 count:16];
    }
    while (v10);
  }
  id v21 = objc_retainBlock(v23);
  v22 = v21;
  if (v21) {
    (*((void (**)(id))v21 + 2))(v21);
  }
}

- (void)removeDescribedImages:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v19 = a4;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v7 = [v6 countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v26;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v26 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void **)(*((void *)&v25 + 1) + 8 * i);
        id v12 = [(BICImageSetStore *)self dataStore];
        unsigned int v13 = [v12 canStoreDescribedImage:v11];

        if (v13)
        {
          v14 = [v11 entryLocationForLevelID:[self levelID]];
          v20[0] = _NSConcreteStackBlock;
          v20[1] = 3221225472;
          id v21 = sub_6DFCC;
          v22 = &unk_2C3AF8;
          id v23 = self;
          id v24 = v14;
          id v15 = v14;
          os_unfair_lock_lock(&self->_accessLock);
          v21((uint64_t)v20);
          os_unfair_lock_unlock(&self->_accessLock);
          objc_super v16 = [(BICImageSetStore *)self dataStore];
          [v16 deleteImageForEntryLocation:v15];
        }
      }
      id v8 = [v6 countByEnumeratingWithState:&v25 objects:v29 count:16];
    }
    while (v8);
  }
  id v17 = objc_retainBlock(v19);
  id v18 = v17;
  if (v17) {
    (*((void (**)(id, id))v17 + 2))(v17, v6);
  }
}

- (void)incrementVersionForIdentifier:(id)a3
{
  if (a3)
  {
    +[NSSet setWithObject:](NSSet, "setWithObject:");
    id v4 = (id)objc_claimAutoreleasedReturnValue();
    [(BICImageSetStore *)self incrementVersionForIdentifiers:v4];
  }
}

- (id)_imageEntryLocationMatchingDescription:(id)a3
{
  id v4 = a3;
  uint64_t v25 = 0;
  long long v26 = &v25;
  uint64_t v27 = 0x3032000000;
  long long v28 = sub_6D8A8;
  id v29 = sub_6D8B8;
  id v30 = 0;
  if (([v4 requestOptions] & 0x30) != 0)
  {
    [v4 identifier];
    p_accessLock = &self->_accessLock;
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    id v19 = sub_6E2B8;
    v20 = &unk_2C5658;
    id v21 = self;
    id v6 = (id)objc_claimAutoreleasedReturnValue();
    id v22 = v6;
    id v23 = v4;
    id v24 = &v25;
    id v7 = v18;
    os_unfair_lock_lock(p_accessLock);
    v19((uint64_t)v7);
    id v8 = &v22;
    os_unfair_lock_unlock(p_accessLock);

    uint64_t v9 = v23;
  }
  else
  {
    [v4 entryLocationForLevelID:[self levelID]];
    id v10 = &self->_accessLock;
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v14 = sub_6E418;
    id v15 = &unk_2C4720;
    objc_super v16 = self;
    id v6 = (id)objc_claimAutoreleasedReturnValue();
    v17[0] = v6;
    v17[1] = &v25;
    uint64_t v9 = v13;
    os_unfair_lock_lock(v10);
    v14((uint64_t)v9);
    id v8 = (id *)v17;
    os_unfair_lock_unlock(v10);
  }

  id v11 = (id)v26[5];
  _Block_object_dispose(&v25, 8);

  return v11;
}

- (void)gatherPrunableItemsForMedium:(signed __int16)a3 level:(signed __int16)a4 withCompletion:(id)a5
{
  unsigned int v25 = a3;
  id v22 = a5;
  id v24 = +[NSMutableArray array];
  id v5 = [(BICImageSetStore *)self dataStore];
  unsigned int v6 = [v5 storingMedium];

  if (v6 == v25)
  {
    uint64_t v36 = 0;
    v37 = &v36;
    uint64_t v38 = 0x3032000000;
    v39 = sub_6D8A8;
    v40 = sub_6D8B8;
    id v41 = 0;
    v31[0] = _NSConcreteStackBlock;
    v31[1] = 3221225472;
    long long v32 = sub_6E7F0;
    long long v33 = &unk_2C39F0;
    v34 = self;
    v35 = &v36;
    id v7 = v31;
    os_unfair_lock_lock(&self->_accessLock);
    v32((uint64_t)v7);
    os_unfair_lock_unlock(&self->_accessLock);

    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    id obj = (id)v37[5];
    id v8 = [obj countByEnumeratingWithState:&v27 objects:v42 count:16];
    if (v8)
    {
      uint64_t v9 = *(void *)v28;
      do
      {
        id v10 = 0;
        do
        {
          if (*(void *)v28 != v9) {
            objc_enumerationMutation(obj);
          }
          uint64_t v11 = *(void *)(*((void *)&v27 + 1) + 8 * (void)v10);
          id v12 = [(BICImageSetStore *)self dataStore];
          unsigned int v13 = [v12 imageForEntryLocation:v11];

          id v14 = [v13 costFor:v25];
          id v15 = [v13 lastUsed];
          [v13 imageSize];
          unint64_t v18 = +[BICPruneableItem pruneScoreFrom:lastUsedDate:oldVersion:expired:processed:](BICPruneableItem, "pruneScoreFrom:lastUsedDate:oldVersion:expired:processed:", v15, [v13 isOldVersion], 0, objc_msgSend(v13, "processingOptions") != 0, v16, v17);
          if ((v18 & 0x8000000000000000) == 0)
          {
            id v19 = +[BICPruneableItem pruneableItemFromEntryLocation:v11 cost:v14 pruneScore:v18];
            [v24 addObject:v19];
          }
          id v10 = (char *)v10 + 1;
        }
        while (v8 != v10);
        id v8 = [obj countByEnumeratingWithState:&v27 objects:v42 count:16];
      }
      while (v8);
    }

    _Block_object_dispose(&v36, 8);
  }
  id v20 = objc_retainBlock(v22);
  id v21 = v20;
  if (v20) {
    (*((void (**)(id, void *))v20 + 2))(v20, v24);
  }
}

- (void)gatherPrunableItemsWithIdentifier:(id)a3 forMedium:(signed __int16)a4 level:(signed __int16)a5 withCompletion:(id)a6
{
  unsigned int v28 = a4;
  id v24 = a3;
  id v25 = a6;
  long long v27 = +[NSMutableArray array];
  id v7 = [(BICImageSetStore *)self dataStore];
  unsigned int v8 = [v7 storingMedium];

  if (v8 == v28)
  {
    uint64_t v40 = 0;
    id v41 = &v40;
    uint64_t v42 = 0x3032000000;
    v43 = sub_6D8A8;
    v44 = sub_6D8B8;
    id v45 = 0;
    v34[0] = _NSConcreteStackBlock;
    v34[1] = 3221225472;
    v35 = sub_6EBE0;
    uint64_t v36 = &unk_2C3AD0;
    v39 = &v40;
    v37 = self;
    id v38 = v24;
    uint64_t v9 = v34;
    os_unfair_lock_lock(&self->_accessLock);
    v35((uint64_t)v9);
    os_unfair_lock_unlock(&self->_accessLock);

    long long v32 = 0u;
    long long v33 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    id obj = (id)v41[5];
    id v10 = [obj countByEnumeratingWithState:&v30 objects:v46 count:16];
    if (v10)
    {
      uint64_t v11 = *(void *)v31;
      do
      {
        id v12 = 0;
        do
        {
          if (*(void *)v31 != v11) {
            objc_enumerationMutation(obj);
          }
          uint64_t v13 = *(void *)(*((void *)&v30 + 1) + 8 * (void)v12);
          id v14 = [(BICImageSetStore *)self dataStore];
          id v15 = [v14 imageForEntryLocation:v13];

          id v16 = [v15 costFor:v28];
          double v17 = [v15 lastUsed];
          [v15 imageSize];
          unint64_t v20 = +[BICPruneableItem pruneScoreFrom:lastUsedDate:oldVersion:expired:processed:](BICPruneableItem, "pruneScoreFrom:lastUsedDate:oldVersion:expired:processed:", v17, [v15 isOldVersion], 0, objc_msgSend(v15, "processingOptions") != 0, v18, v19);
          if ((v20 & 0x8000000000000000) == 0)
          {
            id v21 = +[BICPruneableItem pruneableItemFromEntryLocation:v13 cost:v16 pruneScore:v20];
            [v27 addObject:v21];
          }
          id v12 = (char *)v12 + 1;
        }
        while (v10 != v12);
        id v10 = [obj countByEnumeratingWithState:&v30 objects:v46 count:16];
      }
      while (v10);
    }

    _Block_object_dispose(&v40, 8);
  }
  id v22 = objc_retainBlock(v25);
  id v23 = v22;
  if (v22) {
    (*((void (**)(id, void *))v22 + 2))(v22, v27);
  }
}

- (void)pruneItems:(id)a3 forMedium:(signed __int16)a4 withCompletion:(id)a5
{
  int v6 = a4;
  id v8 = a3;
  id v9 = a5;
  id v10 = [(BICImageSetStore *)self dataStore];
  unsigned int v11 = [v10 storingMedium];

  if (v11 == v6)
  {
    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    id obj = v8;
    id v12 = [obj countByEnumeratingWithState:&v27 objects:v31 count:16];
    if (v12)
    {
      id v13 = v12;
      uint64_t v14 = *(void *)v28;
      do
      {
        for (i = 0; i != v13; i = (char *)i + 1)
        {
          if (*(void *)v28 != v14) {
            objc_enumerationMutation(obj);
          }
          id v16 = [*(id *)(*((void *)&v27 + 1) + 8 * i) entryLocation];
          double v17 = [(BICImageSetStore *)self dataStore];
          [v17 deleteImageForEntryLocation:v16];

          v22[0] = _NSConcreteStackBlock;
          v22[1] = 3221225472;
          id v23 = sub_6EE9C;
          id v24 = &unk_2C3AF8;
          id v25 = self;
          id v26 = v16;
          id v18 = v16;
          os_unfair_lock_lock(&self->_accessLock);
          v23((uint64_t)v22);
          os_unfair_lock_unlock(&self->_accessLock);
        }
        id v13 = [obj countByEnumeratingWithState:&v27 objects:v31 count:16];
      }
      while (v13);
    }
  }
  id v19 = objc_retainBlock(v9);
  unint64_t v20 = v19;
  if (v19) {
    (*((void (**)(id, void))v19 + 2))(v19, 0);
  }
}

- (int64_t)costFor:(signed __int16)a3
{
  uint64_t v3 = a3;
  id v4 = [(BICImageSetStore *)self dataStore];
  id v5 = [v4 costFor:v3];

  return (int64_t)v5;
}

- (signed)storingMedium
{
  v2 = [(BICImageSetStore *)self dataStore];
  signed __int16 v3 = (unsigned __int16)[v2 storingMedium];

  return v3;
}

- (void)_inventoryLevel:(signed __int16)a3 addLevelID:(BOOL)a4 completion:(id)a5
{
  BOOL v5 = a4;
  uint64_t v6 = a3;
  id v8 = a5;
  id v9 = [(BICImageSetStore *)self dataStore];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_6F02C;
  v11[3] = &unk_2C61E0;
  id v12 = v8;
  id v10 = v8;
  [v9 _inventoryLevel:v6 addLevelID:v5 completion:v11];
}

- (void)_clean:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(BICImageSetStore *)self dataStore];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_6F144;
  v7[3] = &unk_2C4280;
  id v8 = v4;
  id v6 = v4;
  [v5 _clean:v7];
}

- (NSString)identifier
{
  return self->_identifier;
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

- (NSMutableSet)imagesInCacheSinceLaunch
{
  return self->_imagesInCacheSinceLaunch;
}

- (void)setImagesInCacheSinceLaunch:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imagesInCacheSinceLaunch, 0);
  objc_storeStrong((id *)&self->_dataStore, 0);
  objc_storeStrong((id *)&self->_comparator, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

@end