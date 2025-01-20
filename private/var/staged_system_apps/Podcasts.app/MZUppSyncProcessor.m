@interface MZUppSyncProcessor
- (MZUppSyncProcessor)initWithStorageProviderDelegate:(id)a3;
- (MZUppSyncProcessorStorageProviding)storageProvider;
- (NSMutableDictionary)metadataItemsFromDataSource;
- (NSMutableDictionary)metadataItemsFromKVSStorage;
- (NSMutableDictionary)metadataItemsToCommitToDataSource;
- (NSMutableDictionary)metadataItemsToCommitToKVSStorage;
- (NSMutableDictionary)reportedItemVersionForIdentifier;
- (NSString)responseDomainVersion;
- (id)dataForSetTransaction:(id)a3 key:(id)a4 version:(id *)a5;
- (id)versionForGetTransaction:(id)a3 key:(id)a4;
- (int)mergeMetadataItemFromSetResponse:(id)a3;
- (void)conflictForSetTransaction:(id)a3 withData:(id)a4 forKey:(id)a5 version:(id)a6 finishedBlock:(id)a7;
- (void)mergeMetadataItemsFromGetResponse;
- (void)setMetadataItemsFromDataSource:(id)a3;
- (void)setMetadataItemsFromKVSStorage:(id)a3;
- (void)setMetadataItemsToCommitToDataSource:(id)a3;
- (void)setMetadataItemsToCommitToKVSStorage:(id)a3;
- (void)setReportedItemVersionForIdentifier:(id)a3;
- (void)setResponseDomainVersion:(id)a3;
- (void)setStorageProvider:(id)a3;
- (void)successfulGetTransaction:(id)a3 withData:(id)a4 forKey:(id)a5 version:(id)a6 finishedBlock:(id)a7;
- (void)successfulSetTransaction:(id)a3 withData:(id)a4 forKey:(id)a5 version:(id)a6 finishedBlock:(id)a7;
- (void)transaction:(id)a3 willProcessResponseWithDomainVersion:(id)a4;
@end

@implementation MZUppSyncProcessor

- (MZUppSyncProcessor)initWithStorageProviderDelegate:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)MZUppSyncProcessor;
  v5 = [(MZUppSyncProcessor *)&v13 init];
  v6 = v5;
  if (v5)
  {
    [(MZUppSyncProcessor *)v5 setStorageProvider:v4];
    v7 = +[NSMutableDictionary dictionary];
    [(MZUppSyncProcessor *)v6 setMetadataItemsFromDataSource:v7];

    v8 = +[NSMutableDictionary dictionary];
    [(MZUppSyncProcessor *)v6 setMetadataItemsFromKVSStorage:v8];

    v9 = +[NSMutableDictionary dictionary];
    [(MZUppSyncProcessor *)v6 setMetadataItemsToCommitToDataSource:v9];

    v10 = +[NSMutableDictionary dictionary];
    [(MZUppSyncProcessor *)v6 setMetadataItemsToCommitToKVSStorage:v10];

    v11 = +[NSMutableDictionary dictionary];
    [(MZUppSyncProcessor *)v6 setReportedItemVersionForIdentifier:v11];
  }
  return v6;
}

- (int)mergeMetadataItemFromSetResponse:(id)a3
{
  id v4 = a3;
  v5 = [(MZUppSyncProcessor *)self metadataItemsFromKVSStorage];
  v6 = [v4 itemIdentifier];
  [v5 setObject:v4 forKey:v6];

  v7 = [(MZUppSyncProcessor *)self storageProvider];
  v8 = [(MZUppSyncProcessor *)self metadataItemsFromKVSStorage];
  [v7 setNumMetadataItemsFromKVSStorage:[v8 count]];

  v9 = [(MZUppSyncProcessor *)self metadataItemsFromDataSource];
  v10 = [v4 itemIdentifier];
  v11 = [v9 objectForKey:v10];

  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472;
  v27[2] = sub_1000C073C;
  v27[3] = &unk_1005506B0;
  v27[4] = self;
  id v12 = v4;
  id v28 = v12;
  id v13 = v11;
  id v29 = v13;
  v14 = objc_retainBlock(v27);
  if (!v13) {
    goto LABEL_5;
  }
  [v13 timestamp];
  double v16 = v15;
  [v12 timestamp];
  if (v16 > v17)
  {
    v18 = (uint64_t (*)(void *, uint64_t))v14[2];
LABEL_8:
    v22 = v14;
    uint64_t v23 = 1;
    goto LABEL_9;
  }
  [v13 timestamp];
  double v20 = v19;
  [v12 timestamp];
  if (v20 >= v21)
  {
    unsigned int v24 = [v13 isEqual:v12];
    v18 = (uint64_t (*)(void *, uint64_t))v14[2];
    if (!v24) {
      goto LABEL_8;
    }
  }
  else
  {
LABEL_5:
    v18 = (uint64_t (*)(void *, uint64_t))v14[2];
  }
  v22 = v14;
  uint64_t v23 = 2;
LABEL_9:
  int v25 = v18(v22, v23);

  return v25;
}

- (void)mergeMetadataItemsFromGetResponse
{
  v3 = [(MZUppSyncProcessor *)self metadataItemsFromDataSource];
  id v4 = [(MZUppSyncProcessor *)self metadataItemsFromKVSStorage];
  [(MZUppSyncProcessor *)self metadataItemsToCommitToDataSource];
  v44 = v43 = self;
  v5 = [(MZUppSyncProcessor *)self metadataItemsToCommitToKVSStorage];
  v6 = _MTLogCategoryUPPSync();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v56 = v3;
    __int16 v57 = 2114;
    v58 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Merging local and remote items\nlocal items = %{public}@\nremote items = %{public}@", buf, 0x16u);
  }

  long long v51 = 0u;
  long long v52 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  v7 = [v3 allValues];
  id v8 = [v7 countByEnumeratingWithState:&v49 objects:v54 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v50;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v50 != v10) {
          objc_enumerationMutation(v7);
        }
        id v12 = *(void **)(*((void *)&v49 + 1) + 8 * i);
        id v13 = [v12 itemIdentifier];
        v14 = [v4 objectForKey:v13];

        if (!v14
          || ([v12 timestamp], double v16 = v15, objc_msgSend(v14, "timestamp"), v16 > v17)
          || ([v12 timestamp], double v19 = v18, objc_msgSend(v14, "timestamp"), v19 == v20)
          && ([v12 isEqual:v14] & 1) == 0)
        {
          double v21 = [v12 itemIdentifier];
          [v5 setObject:v12 forKey:v21];
        }
      }
      id v9 = [v7 countByEnumeratingWithState:&v49 objects:v54 count:16];
    }
    while (v9);
  }

  long long v47 = 0u;
  long long v48 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  v22 = [v4 allValues];
  id v23 = [v22 countByEnumeratingWithState:&v45 objects:v53 count:16];
  if (v23)
  {
    id v24 = v23;
    uint64_t v25 = *(void *)v46;
    do
    {
      for (j = 0; j != v24; j = (char *)j + 1)
      {
        if (*(void *)v46 != v25) {
          objc_enumerationMutation(v22);
        }
        v27 = *(void **)(*((void *)&v45 + 1) + 8 * (void)j);
        id v28 = [v27 itemIdentifier];
        id v29 = [v5 objectForKey:v28];

        if (!v29)
        {
          v30 = [v27 itemIdentifier];
          v31 = [v3 objectForKey:v30];

          if (!v31 || ([v27 timestamp], double v33 = v32, objc_msgSend(v31, "timestamp"), v33 > v34))
          {
            v35 = [v27 itemIdentifier];
            [v44 setObject:v27 forKey:v35];
          }
        }
      }
      id v24 = [v22 countByEnumeratingWithState:&v45 objects:v53 count:16];
    }
    while (v24);
  }

  v36 = _MTLogCategoryUPPSync();
  if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
  {
    v37 = [(MZUppSyncProcessor *)v43 metadataItemsToCommitToDataSource];
    v38 = [(MZUppSyncProcessor *)v43 metadataItemsToCommitToKVSStorage];
    *(_DWORD *)buf = 138543618;
    v56 = v37;
    __int16 v57 = 2114;
    v58 = v38;
    _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_DEFAULT, "Merge result:\nmetadataItemsToCommitToDataSource = %{public}@\nmetadataItemsToCommitToKVSStorage = %{public}@", buf, 0x16u);
  }
  v39 = [(MZUppSyncProcessor *)v43 storageProvider];
  v40 = [(MZUppSyncProcessor *)v43 metadataItemsToCommitToDataSource];
  [v39 setNumMetadataItemsToCommitToDataSource:[v40 count]];

  v41 = [(MZUppSyncProcessor *)v43 storageProvider];
  v42 = [(MZUppSyncProcessor *)v43 metadataItemsToCommitToKVSStorage];
  [v41 setNumMetadataItemsToCommitToKVSStorage:[v42 count]];
}

- (id)versionForGetTransaction:(id)a3 key:(id)a4
{
  return 0;
}

- (id)dataForSetTransaction:(id)a3 key:(id)a4 version:(id *)a5
{
  id v7 = a4;
  id v8 = [(MZUppSyncProcessor *)self reportedItemVersionForIdentifier];
  *a5 = [v8 objectForKey:v7];

  id v9 = [(MZUppSyncProcessor *)self metadataItemsToCommitToKVSStorage];
  uint64_t v10 = [v9 objectForKey:v7];

  v11 = [v10 keyValueStorePayload];

  return v11;
}

- (void)transaction:(id)a3 willProcessResponseWithDomainVersion:(id)a4
{
  if (a4)
  {
    [(MZUppSyncProcessor *)self setResponseDomainVersion:a4];
  }
  else
  {
    id v5 = [(MZUppSyncProcessor *)self responseDomainVersion];
    [(MZUppSyncProcessor *)self setResponseDomainVersion:v5];
  }
}

- (void)successfulGetTransaction:(id)a3 withData:(id)a4 forKey:(id)a5 version:(id)a6 finishedBlock:(id)a7
{
  id v23 = a4;
  id v11 = a5;
  id v12 = a6;
  id v13 = (void (**)(id, void))a7;
  v14 = [(MZUppSyncProcessor *)self storageProvider];
  unsigned int v15 = [v14 wasCanceled];

  if (v15)
  {
    v13[2](v13, 0);
  }
  else
  {
    double v16 = +[MZUniversalPlaybackPositionMetadata metadataWithValuesItemIdentifier:v11 keyValueStorePayload:v23];
    if (v16)
    {
      double v17 = [(MZUppSyncProcessor *)self metadataItemsFromKVSStorage];
      double v18 = [v16 itemIdentifier];
      [v17 setObject:v16 forKey:v18];

      double v19 = [(MZUppSyncProcessor *)self reportedItemVersionForIdentifier];
      double v20 = [v16 itemIdentifier];
      [v19 setObject:v12 forKey:v20];

      double v21 = [(MZUppSyncProcessor *)self storageProvider];
      v22 = [(MZUppSyncProcessor *)self metadataItemsFromKVSStorage];
      [v21 setNumMetadataItemsFromKVSStorage:[v22 count]];
    }
    v13[2](v13, 0);
  }
}

- (void)successfulSetTransaction:(id)a3 withData:(id)a4 forKey:(id)a5 version:(id)a6 finishedBlock:(id)a7
{
  id v9 = (void (**)(id, void))a7;
  id v8 = [(MZUppSyncProcessor *)self storageProvider];
  [v8 wasCanceled];

  v9[2](v9, 0);
}

- (void)conflictForSetTransaction:(id)a3 withData:(id)a4 forKey:(id)a5 version:(id)a6 finishedBlock:(id)a7
{
  id v20 = a4;
  id v11 = a5;
  id v12 = a6;
  id v13 = (void (**)(id, void))a7;
  v14 = [(MZUppSyncProcessor *)self storageProvider];
  unsigned int v15 = [v14 wasCanceled];

  if (v15)
  {
    v13[2](v13, 0);
  }
  else
  {
    double v16 = +[MZUniversalPlaybackPositionMetadata metadataWithValuesItemIdentifier:v11 keyValueStorePayload:v20];
    if (v16)
    {
      double v17 = [(MZUppSyncProcessor *)self reportedItemVersionForIdentifier];
      double v18 = [v16 itemIdentifier];
      [v17 setObject:v12 forKey:v18];

      BOOL v19 = [(MZUppSyncProcessor *)self mergeMetadataItemFromSetResponse:v16] == 1;
    }
    else
    {
      BOOL v19 = 0;
    }
    v13[2](v13, v19);
  }
}

- (NSString)responseDomainVersion
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (void)setResponseDomainVersion:(id)a3
{
}

- (NSMutableDictionary)metadataItemsFromDataSource
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 16, 1);
}

- (void)setMetadataItemsFromDataSource:(id)a3
{
}

- (NSMutableDictionary)metadataItemsToCommitToDataSource
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 24, 1);
}

- (void)setMetadataItemsToCommitToDataSource:(id)a3
{
}

- (NSMutableDictionary)metadataItemsToCommitToKVSStorage
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 32, 1);
}

- (void)setMetadataItemsToCommitToKVSStorage:(id)a3
{
}

- (NSMutableDictionary)metadataItemsFromKVSStorage
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 40, 1);
}

- (void)setMetadataItemsFromKVSStorage:(id)a3
{
}

- (NSMutableDictionary)reportedItemVersionForIdentifier
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 48, 1);
}

- (void)setReportedItemVersionForIdentifier:(id)a3
{
}

- (MZUppSyncProcessorStorageProviding)storageProvider
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_storageProvider);

  return (MZUppSyncProcessorStorageProviding *)WeakRetained;
}

- (void)setStorageProvider:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_storageProvider);
  objc_storeStrong((id *)&self->_reportedItemVersionForIdentifier, 0);
  objc_storeStrong((id *)&self->_metadataItemsFromKVSStorage, 0);
  objc_storeStrong((id *)&self->_metadataItemsToCommitToKVSStorage, 0);
  objc_storeStrong((id *)&self->_metadataItemsToCommitToDataSource, 0);
  objc_storeStrong((id *)&self->_metadataItemsFromDataSource, 0);

  objc_storeStrong((id *)&self->_responseDomainVersion, 0);
}

@end