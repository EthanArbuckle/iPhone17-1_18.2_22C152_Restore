@interface MAAssetQuery
- (BOOL)doNotBlockBeforeFirstUnlock;
- (BOOL)doNotBlockOnNetworkStatus;
- (BOOL)isCatalogFetchedFromLiveServer;
- (BOOL)isCatalogFetchedWithinThePastFewDays:(int)a3;
- (BOOL)isDone;
- (MAAssetQuery)initWithType:(id)a3;
- (MAAssetQuery)initWithType:(id)a3 andPurpose:(id)a4;
- (NSArray)results;
- (NSDate)lastFetchDate;
- (NSDate)postedDate;
- (NSMutableArray)queryParams;
- (NSSet)assetIds;
- (NSString)assetType;
- (NSString)purpose;
- (id)description;
- (int64_t)addKeyValueArray:(id)a3 with:(id)a4;
- (int64_t)addKeyValueNull:(id)a3;
- (int64_t)addKeyValuePair:(id)a3 with:(id)a4;
- (int64_t)queryInstalledAssetIds;
- (int64_t)queryMetaDataSync;
- (int64_t)resultCode;
- (int64_t)returnTypes;
- (void)getResultsFromMessage:(id)a3;
- (void)queryMetaData:(id)a3;
- (void)queryMetaDataWithError:(id)a3;
- (void)returnTypes:(int64_t)a3;
- (void)setDoNotBlockBeforeFirstUnlock:(BOOL)a3;
- (void)setDoNotBlockOnNetworkStatus:(BOOL)a3;
- (void)setPurpose:(id)a3;
@end

@implementation MAAssetQuery

- (void)setDoNotBlockBeforeFirstUnlock:(BOOL)a3
{
  self->_doNotBlockBeforeFirstUnlock = a3;
}

- (void)queryMetaData:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __30__MAAssetQuery_queryMetaData___block_invoke;
  v6[3] = &unk_1E6004E40;
  id v7 = v4;
  id v5 = v4;
  [(MAAssetQuery *)self queryMetaDataWithError:v6];
}

- (void)queryMetaDataWithError:(id)a3
{
  id v4 = a3;
  id v5 = (void *)MEMORY[0x1B3EAACB0]();
  self->_isDone = 0;
  assetType = self->_assetType;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __39__MAAssetQuery_queryMetaDataWithError___block_invoke;
  v8[3] = &unk_1E6004E90;
  v8[4] = self;
  id v7 = v4;
  id v9 = v7;
  _MAsendQueryMetaData(assetType, self, v8);
}

- (MAAssetQuery)initWithType:(id)a3 andPurpose:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v18.receiver = self;
  v18.super_class = (Class)MAAssetQuery;
  id v9 = [(MAAssetQuery *)&v18 init];
  v10 = v9;
  if (v9)
  {
    v9->_isDone = 0;
    uint64_t v11 = objc_opt_new();
    queryParams = v10->_queryParams;
    v10->_queryParams = (NSMutableArray *)v11;

    objc_storeStrong((id *)&v10->_assetType, a3);
    results = v10->_results;
    v10->_results = 0;

    v10->_returnTypes = 0;
    postedDate = v10->_postedDate;
    v10->_resultCode = 12;
    v10->_postedDate = 0;

    lastFetchDate = v10->_lastFetchDate;
    v10->_lastFetchDate = 0;

    v10->_isPallasResult = 0;
    assetIds = v10->_assetIds;
    v10->_assetIds = 0;

    v10->_doNotBlockBeforeFirstUnlock = 0;
    objc_storeStrong((id *)&v10->_purpose, a4);
  }

  return v10;
}

- (MAAssetQuery)initWithType:(id)a3
{
  return [(MAAssetQuery *)self initWithType:a3 andPurpose:0];
}

- (void)returnTypes:(int64_t)a3
{
  self->_returnTypes = a3;
}

- (void)setDoNotBlockOnNetworkStatus:(BOOL)a3
{
  self->_doNotBlockOnNetworkStatus = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_purpose, 0);
  objc_storeStrong((id *)&self->_lastFetchDate, 0);
  objc_storeStrong((id *)&self->_assetIds, 0);
  objc_storeStrong((id *)&self->_results, 0);
  objc_storeStrong((id *)&self->_assetType, 0);
  objc_storeStrong((id *)&self->_queryParams, 0);
  objc_storeStrong((id *)&self->_postedDate, 0);
}

- (void)getResultsFromMessage:(id)a3
{
  uint64_t v80 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  self->_resultCode = xpc_dictionary_get_int64(v4, "Result");
  results = self->_results;
  self->_results = 0;

  v6 = [(MAAssetQuery *)self assetType];
  _MobileAssetLog(0, 6, (uint64_t)"-[MAAssetQuery getResultsFromMessage:]", @"Got the query meta data reply for: %@, response: %ld", v7, v8, v9, v10, (uint64_t)v6);

  size_t length = 0;
  uint64_t v11 = (void *)MEMORY[0x1B3EAACB0]();
  data = xpc_dictionary_get_data(v4, (const char *)[@"xmlData" UTF8String], &length);
  if (!data)
  {
    v31 = @"rawData is null skipping";
LABEL_7:
    _MobileAssetLog(0, 6, (uint64_t)"-[MAAssetQuery getResultsFromMessage:]", v31, v13, v14, v15, v16, v67);
    goto LABEL_36;
  }
  uint64_t v17 = [MEMORY[0x1E4F1C9B8] dataWithBytesNoCopy:data length:length freeWhenDone:0];
  if (!v17)
  {
    v31 = @"data is nil, skipping";
    goto LABEL_7;
  }
  objc_super v18 = (void *)v17;
  id v77 = 0;
  v19 = (void *)[objc_alloc(MEMORY[0x1E4F28DC0]) initForReadingFromData:v17 error:&v77];
  id v20 = v77;
  v25 = v20;
  if (v20)
  {
    v26 = [v20 description];
    _MobileAssetLog(0, 3, (uint64_t)"-[MAAssetQuery getResultsFromMessage:]", @"Unable to initialize keyed unarchiver, error: %@", v27, v28, v29, v30, (uint64_t)v26);

LABEL_35:

    goto LABEL_36;
  }
  if (!v19)
  {
    v65 = @"Keyed archive is nil, skipping.";
    int v66 = 3;
LABEL_33:
    _MobileAssetLog(0, v66, (uint64_t)"-[MAAssetQuery getResultsFromMessage:]", v65, v21, v22, v23, v24, v67);
    goto LABEL_35;
  }
  v32 = [v19 decodePropertyListForKey:*MEMORY[0x1E4F284E8]];
  [v19 finishDecoding];
  if (!v32)
  {
    v65 = @"allData is nil, skipping";
    int v66 = 6;
    goto LABEL_33;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    _MobileAssetLog(0, 6, (uint64_t)"-[MAAssetQuery getResultsFromMessage:]", @"allData is not a dictionary, skipping", v33, v34, v35, v36, v67);

    goto LABEL_35;
  }

  v37 = (void *)MEMORY[0x1B3EAACB0]();
  v38 = [v32 objectForKey:@"metaToFrameWork"];
  v39 = v38;
  if (v38)
  {
    v40 = [v38 objectForKey:@"lastTimeChecked"];
    lastFetchDate = self->_lastFetchDate;
    self->_lastFetchDate = v40;

    v42 = [v39 objectForKey:@"postedDate"];
    postedDate = self->_postedDate;
    self->_postedDate = v42;
  }
  v44 = [v32 objectForKey:@"catalogInfoToFrameWork"];
  if (v44)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v45 = [v44 objectForKey:@"isLiveServer"];
      if (v45)
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          if ([v45 BOOLValue]) {
            self->_isPallasResult = 1;
          }
        }
      }
    }
  }
  uint64_t v46 = [v32 objectForKey:@"assetsToFrameWork"];
  if (v46)
  {
    v51 = (void *)v46;
    v70 = v32;
    location = (id *)&self->_results;
    id v72 = v4;
    v68 = self;

    context = (void *)MEMORY[0x1B3EAACB0]();
    id v52 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v53 = objc_opt_new();
    long long v73 = 0u;
    long long v74 = 0u;
    long long v75 = 0u;
    long long v76 = 0u;
    id v54 = v51;
    uint64_t v55 = [v54 countByEnumeratingWithState:&v73 objects:v79 count:16];
    if (v55)
    {
      uint64_t v56 = v55;
      uint64_t v57 = *(void *)v74;
      do
      {
        for (uint64_t i = 0; i != v56; ++i)
        {
          if (*(void *)v74 != v57) {
            objc_enumerationMutation(v54);
          }
          uint64_t v59 = *(void *)(*((void *)&v73 + 1) + 8 * i);
          v60 = (void *)MEMORY[0x1B3EAACB0]();
          v61 = [[MAAsset alloc] initWithAttributes:v59];
          [v53 addObject:v61];
          v62 = [(MAAsset *)v61 assetId];
          [v52 addObject:v62];
        }
        uint64_t v56 = [v54 countByEnumeratingWithState:&v73 objects:v79 count:16];
      }
      while (v56);
    }

    if (v52)
    {
      uint64_t v63 = [objc_alloc(MEMORY[0x1E4F1CAD0]) initWithArray:v52];
      assetIds = v68->_assetIds;
      v68->_assetIds = (NSSet *)v63;
    }
    objc_storeStrong(location, v53);

    id v4 = v72;
  }
  else
  {
    _MobileAssetLog(0, 6, (uint64_t)"-[MAAssetQuery getResultsFromMessage:]", @"attributes is nil", v47, v48, v49, v50, v67);
  }
LABEL_36:
}

- (int64_t)addKeyValuePair:(id)a3 with:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 && (objc_opt_class(), (objc_opt_isKindOfClass()))
  {
    uint64_t v8 = objc_opt_new();
    [v8 addObject:v7];
    int64_t v9 = [(MAAssetQuery *)self addKeyValueArray:v6 with:v8];
  }
  else
  {
    int64_t v9 = 1;
  }

  return v9;
}

- (int64_t)addKeyValueArray:(id)a3 with:(id)a4
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 && (objc_opt_class(), (objc_opt_isKindOfClass()))
  {
    v25 = self;
    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    id v8 = v7;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v26 objects:v30 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v27;
      do
      {
        uint64_t v12 = 0;
        do
        {
          if (*(void *)v27 != v11) {
            objc_enumerationMutation(v8);
          }
          uint64_t v13 = *(void **)(*((void *)&v26 + 1) + 8 * v12);
          uint64_t v14 = [MEMORY[0x1E4F1CA98] null];
          if (v13 == (void *)v14)
          {
          }
          else
          {
            uint64_t v15 = (void *)v14;
            objc_opt_class();
            char isKindOfClass = objc_opt_isKindOfClass();

            if ((isKindOfClass & 1) == 0)
            {
              _MobileAssetLog(0, 6, (uint64_t)"-[MAAssetQuery addKeyValueArray:with:]", @"Skipping due to bad value in array", v17, v18, v19, v20, v24);
              int64_t v22 = 1;
              goto LABEL_16;
            }
          }
          ++v12;
        }
        while (v10 != v12);
        uint64_t v10 = [v8 countByEnumeratingWithState:&v26 objects:v30 count:16];
      }
      while (v10);
    }

    uint64_t v21 = objc_opt_new();
    [v21 setValue:v8 forKey:@"queryValue"];
    [v21 setValue:v6 forKey:@"queryKey"];
    [(NSMutableArray *)v25->_queryParams addObject:v21];
    int64_t v22 = 0;
    id v8 = v21;
LABEL_16:
  }
  else
  {
    int64_t v22 = 1;
  }

  return v22;
}

- (int64_t)queryMetaDataSync
{
  self->_isDone = 0;
  v3 = (void *)MEMORY[0x1B3EAACB0]();
  xpc_object_t v4 = xpc_dictionary_create(0, 0, 0);
  if (v4)
  {
    id v5 = [(MAAssetQuery *)self assetType];

    if (v5)
    {
      id v5 = [(MAAssetQuery *)self queryParams];

      if (v5)
      {
        uint64_t v10 = (void *)MEMORY[0x1E4F28DB0];
        uint64_t v11 = [(MAAssetQuery *)self queryParams];
        id v33 = 0;
        id v5 = [v10 archivedDataWithRootObject:v11 requiringSecureCoding:1 error:&v33];
        id v12 = v33;

        if (!v5 || v12)
        {
          _MobileAssetLog(0, 6, (uint64_t)"-[MAAssetQuery queryMetaDataSync]", @"Discarding params as they could not be encoded: %@", v13, v14, v15, v16, (uint64_t)v12);
          long long v29 = 0;
          long long v27 = 0;
          int64_t v30 = 8;
          goto LABEL_17;
        }
        uint64_t v17 = (const char *)[@"QueryParams" UTF8String];
        id v5 = v5;
        xpc_dictionary_set_data(v4, v17, (const void *)[v5 bytes], objc_msgSend(v5, "length"));
      }
      if (self->_purpose)
      {
        _MobileAssetLog(0, 6, (uint64_t)"-[MAAssetQuery queryMetaDataSync]", @"Querying with purpose: %@", v6, v7, v8, v9, (uint64_t)self->_purpose);
        xpc_dictionary_set_string(v4, "Purpose", [(NSString *)self->_purpose UTF8String]);
      }
      id v18 = [(MAAssetQuery *)self assetType];
      xpc_dictionary_set_string(v4, "AssetType", (const char *)[v18 UTF8String]);

      xpc_dictionary_set_uint64(v4, "messageAction", 1uLL);
      xpc_dictionary_set_uint64(v4, "returnAssetTypes", [(MAAssetQuery *)self returnTypes]);
      xpc_dictionary_set_BOOL(v4, "doNotBlockBeforeFirstUnlock", [(MAAssetQuery *)self doNotBlockBeforeFirstUnlock]);
      xpc_dictionary_set_BOOL(v4, "doNotBlockOnNetworkStatus", [(MAAssetQuery *)self doNotBlockOnNetworkStatus]);
      uint64_t v19 = objc_msgSend(NSString, "stringWithFormat:", @"%s", getprogname());
      long long v27 = v19;
      if (v19) {
        xpc_dictionary_set_string(v4, "clientName", (const char *)[v19 UTF8String]);
      }
      uint64_t v32 = 12;
      long long v28 = _getCommsManager((uint64_t)v19, v20, v21, v22, v23, v24, v25, v26);
      long long v29 = [v28 sendSync:v4 gettingResponseCode:&v32 codeForXpcError:1 loggingName:@"queryMetaDataSync"];

      int64_t v30 = v32;
      if (v29) {
        [(MAAssetQuery *)self getResultsFromMessage:v29];
      }
      id v12 = 0;
    }
    else
    {
      long long v29 = 0;
      id v12 = 0;
      long long v27 = 0;
      int64_t v30 = 7;
    }
  }
  else
  {
    long long v29 = 0;
    id v5 = 0;
    id v12 = 0;
    long long v27 = 0;
    int64_t v30 = 6;
  }
LABEL_17:
  self->_isDone = 1;

  self->_resultCode = v30;
  return v30;
}

- (NSString)assetType
{
  return self->_assetType;
}

- (NSMutableArray)queryParams
{
  return self->_queryParams;
}

- (int64_t)returnTypes
{
  return self->_returnTypes;
}

- (BOOL)doNotBlockBeforeFirstUnlock
{
  return self->_doNotBlockBeforeFirstUnlock;
}

- (BOOL)doNotBlockOnNetworkStatus
{
  return self->_doNotBlockOnNetworkStatus;
}

- (NSArray)results
{
  return self->_results;
}

- (NSString)purpose
{
  return self->_purpose;
}

void __39__MAAssetQuery_queryMetaDataWithError___block_invoke(uint64_t a1, void *a2)
{
  xpc_object_t xdict = a2;
  if (MEMORY[0x1B3EAB1B0]() == MEMORY[0x1E4F145A8])
  {
    int64_t int64 = 1;
    xpc_object_t v4 = errorStringForMAQueryResult(1uLL);
    MAError(@"com.apple.MobileAssetError.Query", 1, @"%@ due to XPC_TYPE_ERROR", v10, v11, v12, v13, v14, (uint64_t)v4);
    goto LABEL_5;
  }
  int64_t int64 = xpc_dictionary_get_int64(xdict, "Result");
  if (isQueryResultFailure(int64))
  {
    xpc_object_t v4 = errorStringForMAQueryResult(int64);
    MAError(@"com.apple.MobileAssetError.Query", int64, @"%@", v5, v6, v7, v8, v9, (uint64_t)v4);
    uint64_t v15 = LABEL_5:;

    goto LABEL_7;
  }
  [*(id *)(a1 + 32) getResultsFromMessage:xdict];
  uint64_t v15 = 0;
LABEL_7:
  *(unsigned char *)(*(void *)(a1 + 32) + 9) = 1;
  uint64_t v16 = *(void *)(a1 + 40);
  if (v16) {
    (*(void (**)(uint64_t, int64_t, void *))(v16 + 16))(v16, int64, v15);
  }
}

uint64_t __30__MAAssetQuery_queryMetaData___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (int64_t)addKeyValueNull:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v5 = objc_opt_new();
    uint64_t v6 = [MEMORY[0x1E4F1CA98] null];
    [v5 addObject:v6];

    int64_t v7 = [(MAAssetQuery *)self addKeyValueArray:v4 with:v5];
  }
  else
  {
    int64_t v7 = 1;
  }

  return v7;
}

- (int64_t)queryInstalledAssetIds
{
  v3 = (void *)MEMORY[0x1B3EAACB0](self, a2);
  xpc_object_t v8 = xpc_dictionary_create(0, 0, 0);
  size_t length = 0;
  if (!v8)
  {
    int64_t v32 = 6;
    _MobileAssetLog(0, 6, (uint64_t)"-[MAAssetQuery queryInstalledAssetIds]", @"Could not create message for queryInstalledAssetIds", v4, v5, v6, v7, v55);
    goto LABEL_21;
  }
  uint64_t v9 = [(MAAssetQuery *)self assetType];

  if (!v9)
  {
    _MobileAssetLog(0, 6, (uint64_t)"-[MAAssetQuery queryInstalledAssetIds]", @"queryInstalledAssetIds failure due to nil asset type", v10, v11, v12, v13, v55);
    int64_t v32 = 7;
    goto LABEL_21;
  }
  id v14 = [(MAAssetQuery *)self assetType];
  xpc_dictionary_set_string(v8, "AssetType", (const char *)[v14 UTF8String]);

  xpc_dictionary_set_uint64(v8, "messageAction", 0x12uLL);
  uint64_t v15 = NSString;
  uint64_t v56 = getprogname();
  uint64_t v16 = [v15 stringWithFormat:@"%s"];
  uint64_t v24 = v16;
  if (v16) {
    xpc_dictionary_set_string(v8, "clientName", (const char *)[v16 UTF8String]);
  }
  uint64_t v57 = 12;
  uint64_t v25 = _getCommsManager((uint64_t)v16, v17, v18, v19, v20, v21, v22, v23);
  uint64_t v26 = [NSString stringWithUTF8String:"-[MAAssetQuery queryInstalledAssetIds]"];
  long long v27 = [v25 sendSync:v8 gettingResponseCode:&v57 codeForXpcError:1 loggingName:v26];

  if (!MAIsQueryResultFailure(v57))
  {
    data = xpc_dictionary_get_data(v27, (const char *)[@"QueryAssetIdsResponse" UTF8String], &length);
    if (data)
    {
      uint64_t v38 = [MEMORY[0x1E4F1C9B8] dataWithBytesNoCopy:data length:length freeWhenDone:0];
      if (v38)
      {
        v39 = (void *)v38;
        v40 = (void *)[objc_alloc(MEMORY[0x1E4F28DC0]) initForReadingFromData:v38 error:0];
        v41 = queryDecodeClasses();
        v42 = [v40 decodeObjectOfClasses:v41 forKey:*MEMORY[0x1E4F284E8]];

        [v40 finishDecoding];
        if (v42)
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            v51 = [v42 objectForKey:@"QueryAssetIds"];
            assetIds = self->_assetIds;
            self->_assetIds = v51;

            int64_t v32 = 0;
            goto LABEL_21;
          }
          _MobileAssetLog(0, 6, (uint64_t)"-[MAAssetQuery queryInstalledAssetIds]", @"queryInstalledAssetIds allData is not a dictionary skipping", v47, v48, v49, v50, (uint64_t)v56);
        }
        else
        {
          _MobileAssetLog(0, 6, (uint64_t)"-[MAAssetQuery queryInstalledAssetIds]", @"queryInstalledAssetIds allData is null skipping", v43, v44, v45, v46, (uint64_t)v56);
        }

LABEL_20:
        int64_t v32 = 3;
        goto LABEL_21;
      }
      v53 = @"queryInstalledAssetIds data is null skipping";
    }
    else
    {
      v53 = @"queryInstalledAssetIds rawData is null skipping";
    }
    _MobileAssetLog(0, 6, (uint64_t)"-[MAAssetQuery queryInstalledAssetIds]", v53, v34, v35, v36, v37, (uint64_t)v56);
    goto LABEL_20;
  }
  int64_t v32 = 3;
  _MobileAssetLog(0, 6, (uint64_t)"-[MAAssetQuery queryInstalledAssetIds]", @"queryInstalledAssetIds failure server side: %ld", v28, v29, v30, v31, 3);

LABEL_21:
  return v32;
}

- (BOOL)isCatalogFetchedWithinThePastFewDays:(int)a3
{
  BOOL v3 = 0;
  if (a3 >= 1 && self->_lastFetchDate)
  {
    uint64_t v6 = [MEMORY[0x1E4F1C9A8] currentCalendar];
    lastFetchDate = self->_lastFetchDate;
    xpc_object_t v8 = [MEMORY[0x1E4F1C9C8] date];
    uint64_t v9 = [v6 components:16 fromDate:lastFetchDate toDate:v8 options:0];

    BOOL v3 = v9 && [v9 day] < a3 && objc_msgSend(v9, "day") > -a3;
  }
  return v3;
}

- (BOOL)isCatalogFetchedFromLiveServer
{
  return self->_isPallasResult;
}

- (id)description
{
  unint64_t returnTypes;
  __CFString *v11;
  void *v12;
  unint64_t resultCode;
  void *v14;
  void *v15;
  uint64_t vars8;

  uint64_t v3 = [(NSSet *)self->_assetIds anyObject];
  uint64_t v4 = (void *)v3;
  if (v3) {
    uint64_t v5 = (__CFString *)v3;
  }
  else {
    uint64_t v5 = &stru_1F0A75970;
  }
  uint64_t v6 = v5;

  NSUInteger v7 = [(NSSet *)self->_assetIds count];
  xpc_object_t v8 = @"...";
  if (v7 <= 1) {
    xpc_object_t v8 = &stru_1F0A75970;
  }
  uint64_t v9 = NSString;
  returnTypes = self->_returnTypes;
  uint64_t v11 = v8;
  uint64_t v12 = stringForMAQueryReturnTypes(returnTypes);
  resultCode = self->_resultCode;
  id v14 = stringForMAQueryResult(resultCode);
  uint64_t v15 = [v9 stringWithFormat:@"query returnTypes: %ld (%@) result: %ld (%@) count: %ld (%@%@)", returnTypes, v12, resultCode, v14, -[NSArray count](self->_results, "count"), v6, v11];

  return v15;
}

- (BOOL)isDone
{
  return self->_isDone;
}

- (int64_t)resultCode
{
  return self->_resultCode;
}

- (NSDate)postedDate
{
  return self->_postedDate;
}

- (NSSet)assetIds
{
  return self->_assetIds;
}

- (NSDate)lastFetchDate
{
  return self->_lastFetchDate;
}

- (void)setPurpose:(id)a3
{
}

@end