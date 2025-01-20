@interface PLCrowdSourcedThemesPublisher
+ (id)_biomeStreamForStream:(unint64_t)a3 pathManager:(id)a4;
+ (id)_nameForStream:(unint64_t)a3;
+ (id)publishedUUIDsInStream:(unint64_t)a3 pathManager:(id)a4;
+ (void)publishUUIDs:(id)a3 stream:(unint64_t)a4 pathManager:(id)a5;
@end

@implementation PLCrowdSourcedThemesPublisher

+ (id)_biomeStreamForStream:(unint64_t)a3 pathManager:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v20 = 0;
  v6 = [a4 internalDirectoryWithSubType:1 additionalPathComponents:0 createIfNeeded:1 error:&v20];
  id v7 = v20;
  if (v6)
  {
    v8 = [MEMORY[0x1E4F50278] newPrivateStreamDefaultConfigurationWithStoreBasePath:v6];
    if (a3 == 1)
    {
      id v15 = objc_alloc(MEMORY[0x1E4F50268]);
      uint64_t v10 = [v8 segmentSize];
      double v11 = 7776000.0;
      v12 = v15;
      uint64_t v13 = 1;
    }
    else
    {
      if (a3)
      {
LABEL_10:
        v17 = [a1 _nameForStream:a3];
        if (v17)
        {
          v14 = (void *)[objc_alloc(MEMORY[0x1E4F50490]) initWithPrivateStreamIdentifier:v17 storeConfig:v8 eventDataClass:0];
        }
        else
        {
          v18 = PLBackendGetLog();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 134217984;
            unint64_t v22 = a3;
            _os_log_impl(&dword_19B3C7000, v18, OS_LOG_TYPE_ERROR, "PLCrowdSourcedThemesAssetEvent: Stream %tu is not supported.", buf, 0xCu);
          }

          v14 = 0;
        }

        goto LABEL_16;
      }
      id v9 = objc_alloc(MEMORY[0x1E4F50268]);
      uint64_t v10 = [v8 segmentSize];
      double v11 = 0.0;
      v12 = v9;
      uint64_t v13 = 0;
    }
    v16 = (void *)[v12 initPruneOnAccess:1 filterByAgeOnRead:v13 maxAge:v10 maxStreamSize:v11];
    [v8 setPruningPolicy:v16];

    goto LABEL_10;
  }
  v8 = PLBackendGetLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    unint64_t v22 = (unint64_t)v7;
    _os_log_impl(&dword_19B3C7000, v8, OS_LOG_TYPE_ERROR, "PLCrowdSourcedThemesAssetEvent: Failed to create private directory for Biome stream data. Error: %@", buf, 0xCu);
  }
  v14 = 0;
LABEL_16:

  return v14;
}

+ (id)_nameForStream:(unint64_t)a3
{
  v3 = @"com.apple.photos.geoanalytics.sent";
  if (a3 != 1) {
    v3 = 0;
  }
  if (a3) {
    return v3;
  }
  else {
    return @"com.apple.photos.geoanalytics";
  }
}

+ (void)publishUUIDs:(id)a3 stream:(unint64_t)a4 pathManager:(id)a5
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = [a1 _biomeStreamForStream:a4 pathManager:a5];
  uint64_t v10 = v9;
  if (v9)
  {
    double v11 = [v9 source];
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id v12 = v8;
    uint64_t v13 = [v12 countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v21;
      do
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v21 != v15) {
            objc_enumerationMutation(v12);
          }
          uint64_t v17 = *(void *)(*((void *)&v20 + 1) + 8 * i);
          v18 = [PLCrowdSourcedThemesAssetEvent alloc];
          v19 = -[PLCrowdSourcedThemesAssetEvent initWithUUID:](v18, "initWithUUID:", v17, (void)v20);
          [v11 sendEvent:v19];
        }
        uint64_t v14 = [v12 countByEnumeratingWithState:&v20 objects:v24 count:16];
      }
      while (v14);
    }
  }
  else
  {
    double v11 = PLBackendGetLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134217984;
      unint64_t v26 = a4;
      _os_log_impl(&dword_19B3C7000, v11, OS_LOG_TYPE_ERROR, "PLCrowdSourcedThemesAssetEvent: Failed to create a biome stream with name %tu.", buf, 0xCu);
    }
  }
}

+ (id)publishedUUIDsInStream:(unint64_t)a3 pathManager:(id)a4
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = [a1 _biomeStreamForStream:a3 pathManager:v6];
  if (v7)
  {
    id v8 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    id v9 = [v7 publisherFromStartTime:0.0];
    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v27 = 0x3032000000;
    v28 = __Block_byref_object_copy__27859;
    v29 = __Block_byref_object_dispose__27860;
    id v30 = 0;
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __68__PLCrowdSourcedThemesPublisher_publishedUUIDsInStream_pathManager___block_invoke;
    v21[3] = &unk_1E5867CF8;
    v21[4] = &buf;
    uint64_t v16 = MEMORY[0x1E4F143A8];
    uint64_t v17 = 3221225472;
    v18 = __68__PLCrowdSourcedThemesPublisher_publishedUUIDsInStream_pathManager___block_invoke_1;
    v19 = &unk_1E5867D20;
    uint64_t v10 = v8;
    long long v20 = v10;
    id v11 = (id)[v9 sinkWithCompletion:v21 receiveInput:&v16];
    if ([v10 count] || !*(void *)(*((void *)&buf + 1) + 40))
    {
      id v12 = v10;
    }
    else
    {
      uint64_t v13 = PLBackendGetLog();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        uint64_t v14 = *(void *)(*((void *)&buf + 1) + 40);
        *(_DWORD *)long long v22 = 134218242;
        unint64_t v23 = a3;
        __int16 v24 = 2112;
        uint64_t v25 = v14;
        _os_log_impl(&dword_19B3C7000, v13, OS_LOG_TYPE_ERROR, "PLCrowdSourcedThemesAssetEvent: Error reading published items from stream %tu: %@.", v22, 0x16u);
      }

      id v12 = 0;
    }

    _Block_object_dispose(&buf, 8);
  }
  else
  {
    uint64_t v10 = PLBackendGetLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      LODWORD(buf) = 134217984;
      *(void *)((char *)&buf + 4) = a3;
      _os_log_impl(&dword_19B3C7000, v10, OS_LOG_TYPE_ERROR, "PLCrowdSourcedThemesAssetEvent: Failed to create a biome stream for stream %tu.", (uint8_t *)&buf, 0xCu);
    }
    id v12 = 0;
  }

  return v12;
}

void __68__PLCrowdSourcedThemesPublisher_publishedUUIDsInStream_pathManager___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = [v3 state];
  v5 = PLBackendGetLog();
  id v6 = v5;
  if (v4)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      id v7 = [v3 error];
      int v10 = 138412290;
      id v11 = v7;
      _os_log_impl(&dword_19B3C7000, v6, OS_LOG_TYPE_ERROR, "PLCrowdSourcedThemesAssetEvent: Publish error: %@.", (uint8_t *)&v10, 0xCu);
    }
    uint64_t v8 = [v3 error];
    uint64_t v9 = *(void *)(*(void *)(a1 + 32) + 8);
    id v6 = *(NSObject **)(v9 + 40);
    *(void *)(v9 + 40) = v8;
  }
  else if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    LOWORD(v10) = 0;
    _os_log_impl(&dword_19B3C7000, v6, OS_LOG_TYPE_INFO, "PLCrowdSourcedThemesAssetEvent: Publish completed.", (uint8_t *)&v10, 2u);
  }
}

void __68__PLCrowdSourcedThemesPublisher_publishedUUIDsInStream_pathManager___block_invoke_1(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v4 = [a2 eventBody];
  id v3 = [v4 uuid];
  [v2 addObject:v3];
}

@end