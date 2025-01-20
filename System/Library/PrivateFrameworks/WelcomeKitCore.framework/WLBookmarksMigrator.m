@interface WLBookmarksMigrator
+ (id)_bookmarkFolderAtTitlePath:(id)a3 withinBookmarkFolder:(id)a4;
+ (id)_bookmarkFolderAtTitlePath:(id)a3 withinRootFolder:(id)a4;
+ (id)_createBookmarkFolderWithTitle:(id)a3 UUID:(id)a4;
+ (id)_createRootBookmarkFolder;
+ (id)contentType;
- (BOOL)accountBased;
- (BOOL)storeRecordDataInDatabase;
- (BOOL)wantsSegmentedDownloads;
- (WLFeaturePayload)featurePayload;
- (id)contentType;
- (id)dataType;
- (id)importDidEnd;
- (id)importWillBegin;
- (void)addWorkingTime:(unint64_t)a3;
- (void)enable;
- (void)estimateItemSizeForSummary:(id)a3 account:(id)a4;
- (void)importDataFromProvider:(id)a3 forSummaries:(id)a4 summaryStart:(id)a5 summaryCompletion:(id)a6;
- (void)setEstimatedDataSize:(unint64_t)a3;
- (void)setFeaturePayload:(id)a3;
- (void)setState:(id)a3;
@end

@implementation WLBookmarksMigrator

- (void)enable
{
  p_featurePayload = &self->_featurePayload;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_featurePayload);
  [WeakRetained setEnabled:1];

  id v4 = objc_loadWeakRetained((id *)p_featurePayload);
  [v4 setState:@"enabled"];
}

- (void)setState:(id)a3
{
  p_featurePayload = &self->_featurePayload;
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_featurePayload);
  [WeakRetained setState:v4];
}

- (void)setEstimatedDataSize:(unint64_t)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_featurePayload);
  [WeakRetained setSize:a3];
}

- (void)addWorkingTime:(unint64_t)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_featurePayload);
  objc_msgSend(WeakRetained, "setElapsedTime:", objc_msgSend(WeakRetained, "elapsedTime") + a3);
}

+ (id)contentType
{
  return @"bookmarks";
}

- (id)contentType
{
  return +[WLBookmarksMigrator contentType];
}

- (id)dataType
{
  return +[WLBookmarksMigrator contentType];
}

- (BOOL)accountBased
{
  return 1;
}

- (BOOL)storeRecordDataInDatabase
{
  return 1;
}

- (BOOL)wantsSegmentedDownloads
{
  return 0;
}

- (void)estimateItemSizeForSummary:(id)a3 account:(id)a4
{
  id v4 = a3;
  if (![v4 itemSize]) {
    [v4 setItemSize:3072];
  }
}

- (id)importWillBegin
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_featurePayload);
  [WeakRetained setSize:0];

  _WLLog();
  if (objc_msgSend(MEMORY[0x263F861E0], "lockSync", self))
  {
    id v4 = [MEMORY[0x263F861E0] safariBookmarkCollection];
    collection = self->_collection;
    self->_collection = v4;

    if (self->_collection)
    {
      v6 = 0;
      goto LABEL_7;
    }
    v8 = (void *)MEMORY[0x263F087E8];
    uint64_t v9 = *MEMORY[0x263F86308];
    uint64_t v18 = *MEMORY[0x263F08320];
    v19 = @"Bookmarks migrator couldn't create collection.";
    v10 = NSDictionary;
    v11 = &v19;
    v12 = &v18;
  }
  else
  {
    v15 = self;
    _WLLog();
    v7 = self->_collection;
    self->_collection = 0;

    v8 = (void *)MEMORY[0x263F087E8];
    uint64_t v9 = *MEMORY[0x263F86308];
    uint64_t v16 = *MEMORY[0x263F08320];
    v17 = @"Bookmarks migrator couldn't obtain lock.";
    v10 = NSDictionary;
    v11 = &v17;
    v12 = &v16;
  }
  v13 = objc_msgSend(v10, "dictionaryWithObjects:forKeys:count:", v11, v12, 1, v15, v16, v17, v18, v19, v20);
  v6 = [v8 errorWithDomain:v9 code:1 userInfo:v13];

LABEL_7:
  return v6;
}

+ (id)_createBookmarkFolderWithTitle:(id)a3 UUID:(id)a4
{
  id v5 = a3;
  v6 = (objc_class *)MEMORY[0x263EFF9A0];
  id v7 = a4;
  v8 = (void *)[[v6 alloc] initWithCapacity:4];
  [v8 setObject:@"WebBookmarkTypeList" forKey:@"WebBookmarkType"];
  [v8 setObject:v7 forKey:@"WebBookmarkUUID"];

  id v9 = objc_alloc_init(MEMORY[0x263EFF980]);
  [v8 setObject:v9 forKey:@"Children"];

  if (v5) {
    [v8 setObject:v5 forKey:@"Title"];
  }

  return v8;
}

+ (id)_createRootBookmarkFolder
{
  v2 = +[WLBookmarksMigrator _createBookmarkFolderWithTitle:0 UUID:@"Root"];
  v3 = [v2 objectForKeyedSubscript:@"Children"];
  id v4 = [MEMORY[0x263F08C38] UUID];
  id v5 = [v4 UUIDString];
  v6 = +[WLBookmarksMigrator _createBookmarkFolderWithTitle:@"BookmarksBar" UUID:v5];

  [v3 addObject:v6];
  return v2;
}

+ (id)_bookmarkFolderAtTitlePath:(id)a3 withinBookmarkFolder:(id)a4
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if ([v6 count])
  {
    id v24 = a1;
    v8 = [v6 objectAtIndexedSubscript:0];
    id v25 = v7;
    [v7 objectForKeyedSubscript:@"Children"];
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    id v9 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v10 = [v9 countByEnumeratingWithState:&v26 objects:v30 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v27;
LABEL_4:
      uint64_t v13 = 0;
      while (1)
      {
        if (*(void *)v27 != v12) {
          objc_enumerationMutation(v9);
        }
        v14 = *(void **)(*((void *)&v26 + 1) + 8 * v13);
        v15 = [v14 objectForKeyedSubscript:@"Title"];
        char v16 = [v8 isEqualToString:v15];

        if (v16) {
          break;
        }
        if (v11 == ++v13)
        {
          uint64_t v11 = [v9 countByEnumeratingWithState:&v26 objects:v30 count:16];
          if (v11) {
            goto LABEL_4;
          }
          goto LABEL_10;
        }
      }
      id v18 = v14;

      v17 = v24;
      if (v18) {
        goto LABEL_13;
      }
    }
    else
    {
LABEL_10:

      v17 = v24;
    }
    v19 = [MEMORY[0x263F08C38] UUID];
    uint64_t v20 = [v19 UUIDString];
    id v18 = [v17 _createBookmarkFolderWithTitle:v8 UUID:v20];

    [v9 addObject:v18];
LABEL_13:
    if ((unint64_t)[v6 count] >= 2)
    {
      v21 = objc_msgSend(v6, "subarrayWithRange:", 1, objc_msgSend(v6, "count") - 1);
      uint64_t v22 = [v17 _bookmarkFolderAtTitlePath:v21 withinBookmarkFolder:v18];

      id v18 = (id)v22;
    }
    id v7 = v25;
  }
  else
  {
    id v18 = v7;
  }

  return v18;
}

+ (id)_bookmarkFolderAtTitlePath:(id)a3 withinRootFolder:(id)a4
{
  id v6 = a3;
  id v7 = [a4 objectForKeyedSubscript:@"Children"];
  v8 = [v7 objectAtIndexedSubscript:0];

  if ([v6 length])
  {
    id v9 = [v6 pathComponents];
    uint64_t v10 = [a1 _bookmarkFolderAtTitlePath:v9 withinBookmarkFolder:v8];

    v8 = (void *)v10;
  }

  return v8;
}

- (void)importDataFromProvider:(id)a3 forSummaries:(id)a4 summaryStart:(id)a5 summaryCompletion:(id)a6
{
  uint64_t v81 = *MEMORY[0x263EF8340];
  v60 = (void (**)(id, void))a3;
  id v9 = a4;
  id v10 = a5;
  v62 = (void (**)(id, uint64_t, void))a6;
  v51 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", objc_msgSend(v9, "count"));
  v50 = +[WLBookmarksMigrator _createRootBookmarkFolder];
  long long v69 = 0u;
  long long v70 = 0u;
  long long v71 = 0u;
  long long v72 = 0u;
  id v11 = v9;
  uint64_t v12 = (void (**)(void, void))v10;
  obuint64_t j = v11;
  v52 = (void (**)(void, void))v10;
  uint64_t v61 = [v11 countByEnumeratingWithState:&v69 objects:v80 count:16];
  if (v61)
  {
    p_featurePayload = &self->_featurePayload;
    uint64_t v59 = *(void *)v70;
    uint64_t v48 = *MEMORY[0x263F08320];
    uint64_t v49 = *MEMORY[0x263F86308];
    do
    {
      for (uint64_t i = 0; i != v61; ++i)
      {
        if (*(void *)v70 != v59) {
          objc_enumerationMutation(obj);
        }
        uint64_t v15 = *(void *)(*((void *)&v69 + 1) + 8 * i);
        if (v12) {
          v12[2](v12, *(void *)(*((void *)&v69 + 1) + 8 * i));
        }
        char v16 = v60[2](v60, v15);
        id WeakRetained = objc_loadWeakRetained((id *)p_featurePayload);
        objc_msgSend(WeakRetained, "setCount:", objc_msgSend(WeakRetained, "count") + 1);

        id v18 = objc_loadWeakRetained((id *)p_featurePayload);
        objc_msgSend(v18, "setSize:", objc_msgSend(v18, "size") + objc_msgSend(v16, "length"));

        if (v16)
        {
          id v68 = 0;
          v19 = [MEMORY[0x263F08900] JSONObjectWithData:v16 options:0 error:&v68];
          id v20 = v68;
          if (!v20)
          {
            if (v19)
            {
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                id v21 = v19;
                uint64_t v22 = [v21 objectForKeyedSubscript:@"itemID"];
                uint64_t v23 = [v21 objectForKeyedSubscript:@"itemTitle"];
                id v24 = [v21 objectForKeyedSubscript:@"itemFolder"];
                id v53 = v21;
                uint64_t v47 = [v21 objectForKeyedSubscript:@"itemUrl"];
                v57 = (void *)v23;
                uint64_t v44 = v22;
                uint64_t v46 = v23;
                v54 = (void *)v22;
                _WLLog();
                v55 = (void *)v47;
                if (v47 && v23 && v24)
                {
                  v79[0] = @"WebBookmarkTypeLeaf";
                  v78[0] = @"WebBookmarkType";
                  v78[1] = @"WebBookmarkUUID";
                  id v25 = objc_msgSend(MEMORY[0x263F08C38], "UUID", self, v22, v23, v24, v47);
                  [v25 UUIDString];
                  v27 = long long v26 = v24;
                  v79[1] = v27;
                  v78[2] = @"URIDictionary";
                  v76 = @"title";
                  v77 = v57;
                  long long v28 = [NSDictionary dictionaryWithObjects:&v77 forKeys:&v76 count:1];
                  v78[3] = @"URLString";
                  v79[2] = v28;
                  v79[3] = v55;
                  long long v29 = [NSDictionary dictionaryWithObjects:v79 forKeys:v78 count:4];

                  id v24 = v26;
                  v30 = +[WLBookmarksMigrator _bookmarkFolderAtTitlePath:v26 withinRootFolder:v50];
                  uint64_t v31 = [v30 objectForKeyedSubscript:@"Children"];
                  [v31 addObject:v29];
                  [v51 addObject:v15];

                  uint64_t v12 = v52;
                  v32 = v53;
                  p_featurePayload = &self->_featurePayload;
                }
                else
                {
                  uint64_t v12 = v52;
                  if (!v47 && v23 && v24)
                  {
                    _WLLog();
                    v32 = v21;
                    p_featurePayload = &self->_featurePayload;
                    if (v62) {
                      v62[2](v62, v15, 0);
                    }
                  }
                  else
                  {
                    _WLLog();
                    v32 = v21;
                    p_featurePayload = &self->_featurePayload;
                    if (v62)
                    {
                      v33 = (void *)MEMORY[0x263F087E8];
                      uint64_t v74 = v48;
                      v75 = @"Bookmark had missing property";
                      v34 = objc_msgSend(NSDictionary, "dictionaryWithObjects:forKeys:count:", &v75, &v74, 1, self, v44, v46, v24, v47);
                      v35 = [v33 errorWithDomain:v49 code:1 userInfo:v34];
                      ((void (**)(id, uint64_t, void *))v62)[2](v62, v15, v35);

                      uint64_t v12 = v52;
                    }
                  }
                }
              }
            }
          }
        }
        else
        {
          _WLLog();
          if (v62) {
            v62[2](v62, v15, 0);
          }
        }
      }
      uint64_t v61 = [obj countByEnumeratingWithState:&v69 objects:v80 count:16];
    }
    while (v61);
  }

  if ([v51 count])
  {
    _WLLog();
    collection = self->_collection;
    id v67 = 0;
    uint64_t v37 = -[WebBookmarkCollection mergeWithBookmarksDictionary:clearHidden:error:](collection, "mergeWithBookmarksDictionary:clearHidden:error:", v50, 0, &v67, self, v50);
    id v38 = v67;
    v45 = [NSNumber numberWithBool:v37];
    _WLLog();

    if (v62)
    {
      long long v65 = 0u;
      long long v66 = 0u;
      long long v63 = 0u;
      long long v64 = 0u;
      id v39 = v51;
      uint64_t v40 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v63, v73, 16, self, v45, v38);
      if (v40)
      {
        uint64_t v41 = v40;
        uint64_t v42 = *(void *)v64;
        do
        {
          for (uint64_t j = 0; j != v41; ++j)
          {
            if (*(void *)v64 != v42) {
              objc_enumerationMutation(v39);
            }
            ((void (**)(id, uint64_t, id))v62)[2](v62, *(void *)(*((void *)&v63 + 1) + 8 * j), v38);
          }
          uint64_t v41 = [v39 countByEnumeratingWithState:&v63 objects:v73 count:16];
        }
        while (v41);
      }
    }
    uint64_t v12 = v52;
  }
}

- (id)importDidEnd
{
  _WLLog();
  collection = self->_collection;
  if (collection)
  {
    self->_collection = 0;

    objc_msgSend(MEMORY[0x263F861E0], "unlockSync", self);
  }
  return 0;
}

- (WLFeaturePayload)featurePayload
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_featurePayload);
  return (WLFeaturePayload *)WeakRetained;
}

- (void)setFeaturePayload:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_featurePayload);
  objc_storeStrong((id *)&self->_collection, 0);
}

@end