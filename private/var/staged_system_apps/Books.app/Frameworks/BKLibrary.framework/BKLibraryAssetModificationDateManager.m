@interface BKLibraryAssetModificationDateManager
- (AEAnnotationProvider)annotationProvider;
- (BKLibraryAssetModificationDateManager)initWithLibraryManager:(id)a3 annotationProvider:(id)a4;
- (BKLibraryManager)libraryManager;
- (id)libraryAssetForAssetIDs:(id)a3 inManagedObjectContext:(id)a4;
- (id)updatesFromLibraryAssets:(id)a3 annotations:(id)a4;
- (void)annotationsForAssetIDs:(id)a3 completion:(id)a4;
- (void)consumeUpdates:(id)a3 inManagedObjectContext:(id)a4;
- (void)resetModificationDateForAssetIDs:(id)a3 completion:(id)a4;
@end

@implementation BKLibraryAssetModificationDateManager

- (BKLibraryAssetModificationDateManager)initWithLibraryManager:(id)a3 annotationProvider:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v9 = [(BKLibraryAssetModificationDateManager *)self init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_libraryManager, a3);
    objc_storeStrong((id *)&v10->_annotationProvider, a4);
  }

  return v10;
}

- (void)resetModificationDateForAssetIDs:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v6 && ![v6 count])
  {
    id v9 = objc_retainBlock(v7);
    v10 = v9;
    if (v9) {
      (*((void (**)(id))v9 + 2))(v9);
    }
  }
  else
  {
    id v8 = dispatch_get_global_queue(-2, 0);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_57610;
    block[3] = &unk_D22F0;
    block[4] = self;
    id v12 = v6;
    id v13 = v7;
    dispatch_async(v8, block);
  }
}

- (id)libraryAssetForAssetIDs:(id)a3 inManagedObjectContext:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (v5)
  {
    id v7 = +[BKLibraryManager predicateForAssetIDsTaggedLibraryAssets:v5];
  }
  else
  {
    id v7 = 0;
  }
  v25[0] = @"assetID";
  v25[1] = @"modificationDate";
  v25[2] = @"creationDate";
  id v8 = +[NSArray arrayWithObjects:v25 count:3];
  v19 = v6;
  id v9 = [v6 copyEntityPropertiesArray:v8 fromEntityName:@"BKLibraryAsset" withPredicate:v7 sortBy:0 ascending:0];

  id v10 = [objc_alloc((Class)NSMutableDictionary) initWithCapacity:[v9 count]];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v11 = v9;
  id v12 = [v11 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v12)
  {
    id v13 = v12;
    uint64_t v14 = *(void *)v21;
    do
    {
      for (i = 0; i != v13; i = (char *)i + 1)
      {
        if (*(void *)v21 != v14) {
          objc_enumerationMutation(v11);
        }
        v16 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        v17 = [v16 objectForKeyedSubscript:@"assetID"];
        if (v17) {
          [v10 setObject:v16 forKeyedSubscript:v17];
        }
      }
      id v13 = [v11 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v13);
  }

  return v10;
}

- (void)annotationsForAssetIDs:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v13[0] = 0;
  v13[1] = v13;
  v13[2] = 0x3032000000;
  v13[3] = sub_57B3C;
  v13[4] = sub_57B4C;
  id v14 = 0;
  if ([v6 count])
  {
    id v8 = [(BKLibraryAssetModificationDateManager *)self annotationProvider];
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_57B54;
    v9[3] = &unk_D2F88;
    id v10 = v6;
    id v12 = v13;
    id v11 = v7;
    [v8 performBlockOnUserSideQueue:v9];
  }
  _Block_object_dispose(v13, 8);
}

- (id)updatesFromLibraryAssets:(id)a3 annotations:(id)a4
{
  id v21 = a3;
  id v5 = a4;
  if ([v5 count])
  {
    id v19 = objc_alloc_init((Class)NSMutableDictionary);
    id v6 = +[AEAnnotation maxModificationDateColumnName];
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    id v18 = v5;
    id obj = v5;
    id v7 = [obj countByEnumeratingWithState:&v22 objects:v26 count:16];
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v23;
      do
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(void *)v23 != v9) {
            objc_enumerationMutation(obj);
          }
          id v11 = *(void **)(*((void *)&v22 + 1) + 8 * i);
          id v12 = [v11 objectForKeyedSubscript:@"annotationAssetID" v18];
          if (v12)
          {
            id v13 = [v21 objectForKeyedSubscript:v12];
            id v14 = [v11 objectForKeyedSubscript:v6];
            if (v14)
            {
              v15 = [v13 objectForKeyedSubscript:@"modificationDate"];
              v16 = [v13 objectForKeyedSubscript:@"creationDate"];
              if (!v15
                || [v15 compare:v14] == (id)-1
                || [v15 isEqualToDate:v16])
              {
                [v19 setObject:v14 forKeyedSubscript:v12];
              }
            }
          }
        }
        id v8 = [obj countByEnumeratingWithState:&v22 objects:v26 count:16];
      }
      while (v8);
    }

    id v5 = v18;
  }
  else
  {
    id v19 = 0;
  }

  return v19;
}

- (void)consumeUpdates:(id)a3 inManagedObjectContext:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if ([v5 count])
  {
    id v7 = [v5 allKeys];
    id v18 = v6;
    id v8 = +[BKLibraryManager libraryAssetsWithAssetIDsContainedInList:v7 tempAssetIDs:0 inManagedObjectContext:v6];

    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id v9 = v8;
    id v10 = [v9 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v10)
    {
      id v11 = v10;
      uint64_t v12 = *(void *)v20;
      do
      {
        id v13 = 0;
        do
        {
          if (*(void *)v20 != v12) {
            objc_enumerationMutation(v9);
          }
          id v14 = *(id *)(*((void *)&v19 + 1) + 8 * (void)v13);
          if ([v14 isValid])
          {
            v15 = [v14 assetID];
            if (v15)
            {
              v16 = [v5 objectForKeyedSubscript:v15];
              if (v16)
              {
                [v14 setDifferentObject:v16 forKey:@"modificationDate"];
                v17 = [v14 purchasedAndLocalParent];
                [v17 setDifferentObject:v16 forKey:@"modificationDate"];
              }
            }
          }
          id v13 = (char *)v13 + 1;
        }
        while (v11 != v13);
        id v11 = [v9 countByEnumeratingWithState:&v19 objects:v23 count:16];
      }
      while (v11);
    }

    id v6 = v18;
    [v18 saveLibrary];
  }
}

- (BKLibraryManager)libraryManager
{
  return self->_libraryManager;
}

- (AEAnnotationProvider)annotationProvider
{
  return self->_annotationProvider;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_annotationProvider, 0);

  objc_storeStrong((id *)&self->_libraryManager, 0);
}

@end