@interface PRSBagHandler
+ (id)sharedHandler;
+ (void)initialize;
- (BOOL)active;
- (BOOL)collectAnonymousData;
- (BOOL)collectScores;
- (BOOL)disableAsTypedSuggestion;
- (BOOL)isBagEnabled;
- (BOOL)isEnabled;
- (BOOL)resourceMetadataNeedsWrite;
- (BOOL)searchSupported:(BOOL)a3;
- (BOOL)sessionReady;
- (BOOL)use2LayerRanking;
- (GEOUserSessionEntity)geoUserSessionEntity;
- (NSArray)anonymousMetadataUndesiredBundleIDs;
- (NSArray)enabledDomains;
- (NSArray)suggestionRankerModelParams;
- (NSMutableDictionary)resourceMetadata;
- (NSSet)appBlocklist;
- (NSString)fteContinueString;
- (NSString)fteLearnMoreString;
- (NSString)fteLocString;
- (NSString)lookupFirstUseDescription1;
- (NSString)lookupFirstUseDescription2;
- (NSString)lookupFirstUseLearnMore;
- (NSString)resourceMetadataPath;
- (OS_dispatch_queue)resourceFetchQueue;
- (PRSBagHandler)init;
- (PRSSessionController)client;
- (SSPlistDataReader)cep_server_values;
- (double)searchRenderTimeout;
- (double)suggestionsRenderTimeout;
- (id)_base64CEPDataNoCopyFromFeatureData:(id)a3;
- (id)applicationNameForUserAgent;
- (id)excludedDomainIdentifiers;
- (id)userId;
- (int64_t)status;
- (void)_processQIFeatures:(id)a3 forClient:(id)a4;
- (void)fetchModifiedResourceFromSession:(id)a3 resource:(id)a4 completion:(id)a5;
- (void)getFTEStringsWithReply:(id)a3;
- (void)parseCEPFromData:(id)a3 forClient:(id)a4;
- (void)removeTask:(id)a3;
- (void)setActive:(BOOL)a3;
- (void)setAnonymousMetadataUndesiredBundleIDs:(id)a3;
- (void)setAppBlocklist:(id)a3;
- (void)setCep_server_values:(id)a3;
- (void)setClient:(id)a3;
- (void)setCollectAnonymousData:(BOOL)a3;
- (void)setCollectScores:(BOOL)a3;
- (void)setDisableAsTypedSuggestion:(BOOL)a3;
- (void)setEnabledDomains:(id)a3;
- (void)setFteContinueString:(id)a3;
- (void)setFteLearnMoreString:(id)a3;
- (void)setFteLocString:(id)a3;
- (void)setResourceFetchQueue:(id)a3;
- (void)setResourceMetadata:(id)a3;
- (void)setResourceMetadataNeedsWrite:(BOOL)a3;
- (void)setResourceMetadataPath:(id)a3;
- (void)setSearchRenderTimeout:(double)a3;
- (void)setStatus:(int64_t)a3;
- (void)setSuggestionRankerModelParams:(id)a3;
- (void)setSuggestionsRenderTimeout:(double)a3;
- (void)setUse2LayerRanking:(BOOL)a3;
- (void)triggerTaskWhenReady:(id)a3;
- (void)updateFromSession:(id)a3 bag:(id)a4 forClient:(id)a5 error:(id)a6;
- (void)updateWithBagDictionary:(id)a3 error:(id)a4;
@end

@implementation PRSBagHandler

- (id)_base64CEPDataNoCopyFromFeatureData:(id)a3
{
  id v3 = a3;
  v17[0] = 0;
  v17[1] = v17;
  v17[2] = 0x2020000000;
  int v18 = -1;
  v16[0] = 0;
  v16[1] = v16;
  v16[2] = 0x2020000000;
  v16[3] = 0;
  uint64_t v10 = 0;
  v11 = &v10;
  uint64_t v12 = 0x3810000000;
  v13 = "";
  long long v14 = xmmword_1BDC5D0F0;
  uint64_t v15 = 0;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __53__PRSBagHandler__base64CEPDataNoCopyFromFeatureData___block_invoke;
  v9[3] = &unk_1E634C188;
  v9[4] = v17;
  v9[5] = &v10;
  v9[6] = v16;
  v9[7] = "qi_features";
  v4 = (void *)MEMORY[0x1C1885400](v9);
  id v5 = v3;
  [v5 bytes];
  [v5 length];
  if (json_parse() && *((_DWORD *)v11 + 8) == 4 && (uint64_t v6 = v11[5]) != 0)
  {
    v7 = [MEMORY[0x1E4F1C9B8] dataWithBytesNoCopy:v6 length:v11[6] freeWhenDone:0];
  }
  else
  {
    v7 = 0;
  }

  _Block_object_dispose(&v10, 8);
  _Block_object_dispose(v16, 8);
  _Block_object_dispose(v17, 8);

  return v7;
}

void *__53__PRSBagHandler__base64CEPDataNoCopyFromFeatureData___block_invoke(void *result, int a2, long long *a3, unsigned char *a4)
{
  switch(a2)
  {
    case 1:
      ++*(_DWORD *)(*(void *)(result[4] + 8) + 24);
      break;
    case 2:
      *(void *)(*(void *)(result[6] + 8) + 24) = 0;
      if (!*(_DWORD *)(*(void *)(result[4] + 8) + 24) && *((void *)a3 + 2) == 11)
      {
        v8 = (void *)result[7];
        v9 = (uint64_t *)*((void *)a3 + 1);
        uint64_t v10 = *v9;
        uint64_t v11 = *(uint64_t *)((char *)v9 + 3);
        if (*v8 == v10 && *(void *)((char *)v8 + 3) == v11) {
          *(void *)(*(void *)(result[6] + 8) + 24) = v8;
        }
      }
      break;
    case 3:
      uint64_t v4 = *(void *)(result[4] + 8);
      int v5 = *(_DWORD *)(v4 + 24);
      *(_DWORD *)(v4 + 24) = v5 - 1;
      if (!v5 && *(_DWORD *)(*(void *)(result[5] + 8) + 32) != 4) {
        *a4 = 1;
      }
      break;
    case 6:
      if (!*(_DWORD *)(*(void *)(result[4] + 8) + 24)
        && *(void *)(*(void *)(result[6] + 8) + 24) == result[7])
      {
        uint64_t v6 = *(void *)(result[5] + 8);
        long long v7 = *a3;
        *(void *)(v6 + 48) = *((void *)a3 + 2);
        *(_OWORD *)(v6 + 32) = v7;
      }
      break;
    default:
      return result;
  }
  return result;
}

- (void)_processQIFeatures:(id)a3 forClient:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v20[0] = 0;
  v20[1] = v20;
  v20[2] = 0x3810000000;
  v20[3] = "";
  long long v21 = xmmword_1BDC5D0F0;
  uint64_t v22 = 0;
  v18[0] = 0;
  v18[1] = v18;
  v18[2] = 0x2020000000;
  int v19 = 0;
  v16[0] = 0;
  v16[1] = v16;
  v16[2] = 0x2020000000;
  int v17 = -1;
  Mutable = (const void *)_MDPlistContainerCreateMutable();
  _MDPlistContainerBeginContainer();
  _MDPlistContainerBeginDictionary();
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __46__PRSBagHandler__processQIFeatures_forClient___block_invoke;
  v15[3] = &unk_1E634C188;
  v15[4] = v16;
  v15[5] = v18;
  v15[6] = v20;
  v15[7] = Mutable;
  v9 = (void *)MEMORY[0x1C1885400](v15);
  id v10 = v6;
  [v10 bytes];
  [v10 length];
  int v11 = json_parse();
  _MDPlistContainerEndDictionary();
  _MDPlistContainerEndContainer();
  if (v11) {
    uint64_t v12 = [[SSPlistDataReader alloc] initWithPlistContainer:Mutable];
  }
  else {
    uint64_t v12 = 0;
  }
  CFRelease(Mutable);
  if (v12)
  {
    [(PRSBagHandler *)self setCep_server_values:v12];
    v13 = PRSLogCategoryDefault();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)long long v14 = 0;
      _os_log_impl(&dword_1BDB2A000, v13, OS_LOG_TYPE_INFO, "Loaded qi features", v14, 2u);
    }
  }
  else
  {
    v13 = PRSLogCategoryDefault();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      -[PRSBagHandler _processQIFeatures:forClient:](v13);
    }
  }

  _Block_object_dispose(v16, 8);
  _Block_object_dispose(v18, 8);
  _Block_object_dispose(v20, 8);
}

void __46__PRSBagHandler__processQIFeatures_forClient___block_invoke(void *a1, int a2, uint64_t a3)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  bzero(__s1, 0x400uLL);
  bzero(v26, 0x400uLL);
  switch(a2)
  {
    case 1:
      uint64_t v6 = *(void *)(a1[4] + 8);
      int v7 = *(_DWORD *)(v6 + 24) + 1;
      goto LABEL_10;
    case 2:
      int v8 = *(_DWORD *)(*(void *)(a1[4] + 8) + 24);
      if (v8 == 1)
      {
        uint64_t v11 = *(void *)(a1[6] + 8);
        long long v12 = *(_OWORD *)a3;
        *(void *)(v11 + 48) = *(void *)(a3 + 16);
        *(_OWORD *)(v11 + 32) = v12;
      }
      else
      {
        if (v8) {
          return;
        }
        *(_DWORD *)(*(void *)(a1[5] + 8) + 24) = 0;
        json_utf8_string(a3, __s1, 0x400uLL);
        uint64_t v9 = 1;
        while (strcmp(__s1, *((const char **)&sQIFetureKeys + v9)))
        {
          if (++v9 == 3) {
            return;
          }
        }
        *(_DWORD *)(*(void *)(a1[5] + 8) + 24) = v9;
      }
      return;
    case 3:
      uint64_t v6 = *(void *)(a1[4] + 8);
      int v7 = *(_DWORD *)(v6 + 24) - 1;
LABEL_10:
      *(_DWORD *)(v6 + 24) = v7;
      return;
    case 6:
      if (*(_DWORD *)(*(void *)(a1[4] + 8) + 24) == 1)
      {
        int v10 = *(_DWORD *)(*(void *)(a1[5] + 8) + 24);
        if (v10 == 1)
        {
          json_utf8_string(*(void *)(a1[6] + 8) + 32, __s1, 0x400uLL);
          json_utf8_string(a3, v26, 0x400uLL);
          if ((*(_DWORD *)a3 & 0xFFFFFFFE) == 6)
          {
            uint64_t v13 = 0;
            uint64_t v14 = MEMORY[0x1E4F14390];
            do
            {
              unsigned int v15 = __s1[v13];
              if (!__s1[v13]) {
                break;
              }
              if ((v15 & 0x80) == 0 && (*(_DWORD *)(v14 + 4 * v15 + 60) & 0x8000) != 0) {
                __s1[v13] = __tolower(v15);
              }
              ++v13;
            }
            while (v13 != 1024);
            _MDPlistContainerAddCString();
            atof(v26);
            _MDPlistContainerAddDoubleValue();
          }
          else
          {
            v16 = PRSLogCategoryDefault();
            if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
            {
              int v17 = *(_DWORD *)a3;
              uint64_t v18 = *((void *)&sQIFetureKeys + *(unsigned int *)(*(void *)(a1[5] + 8) + 24));
              v19[0] = 67109890;
              v19[1] = v17;
              __int16 v20 = 2080;
              uint64_t v21 = v18;
              __int16 v22 = 2080;
              v23 = __s1;
              __int16 v24 = 2080;
              v25 = v26;
              _os_log_error_impl(&dword_1BDB2A000, v16, OS_LOG_TYPE_ERROR, "## unexpected type:%d %s-%s value:%s", (uint8_t *)v19, 0x26u);
            }
          }
        }
        else if (v10 == 2)
        {
          json_utf8_string(*(void *)(a1[6] + 8) + 32, __s1, 0x400uLL);
          json_utf8_string(a3, v26, 0x400uLL);
        }
      }
      return;
    default:
      return;
  }
}

- (void)parseCEPFromData:(id)a3 forClient:(id)a4
{
  id v6 = a4;
  int v7 = [(PRSBagHandler *)self _base64CEPDataNoCopyFromFeatureData:a3];
  if (v7)
  {
    int v8 = PRSLogCategoryDefault();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)int v10 = 0;
      _os_log_impl(&dword_1BDB2A000, v8, OS_LOG_TYPE_INFO, "Loading qi features", v10, 2u);
    }

    uint64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBase64EncodedData:v7 options:0];
    [(PRSBagHandler *)self _processQIFeatures:v9 forClient:v6];
  }
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    v2 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    id v6 = [v2 stringForKey:@"ParsecExtraParam"];

    id v3 = v6;
    if (v6)
    {
      if ([v6 hasPrefix:@"&"])
      {
        uint64_t v4 = [v6 copy];
      }
      else
      {
        uint64_t v4 = [NSString stringWithFormat:@"&%@", v6];
      }
      int v5 = (void *)gExtraParam;
      gExtraParam = v4;

      id v3 = v6;
    }
  }
}

- (BOOL)isEnabled
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_client);
  char v3 = [WeakRetained isEnabled];

  return v3;
}

- (id)applicationNameForUserAgent
{
  p_client = &self->_client;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_client);
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    id v5 = objc_loadWeakRetained((id *)p_client);
    id v6 = [v5 applicationNameForUserAgent];
  }
  else
  {
    id v6 = 0;
  }
  return v6;
}

- (id)userId
{
  return 0;
}

+ (id)sharedHandler
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __30__PRSBagHandler_sharedHandler__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedHandler_onceToken != -1) {
    dispatch_once(&sharedHandler_onceToken, block);
  }
  v2 = (void *)sharedHandler_sharedHandler;
  return v2;
}

uint64_t __30__PRSBagHandler_sharedHandler__block_invoke(uint64_t a1)
{
  sharedHandler_sharedHandler = (uint64_t)objc_alloc_init(*(Class *)(a1 + 32));
  return MEMORY[0x1F41817F8]();
}

- (BOOL)searchSupported:(BOOL)a3
{
  return 1;
}

- (PRSBagHandler)init
{
  v19.receiver = self;
  v19.super_class = (Class)PRSBagHandler;
  v2 = [(PRSBagHandler *)&v19 init];
  *(_OWORD *)&v2->_searchRenderTimeout = xmmword_1BDC5D0E0;
  char v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v4 = dispatch_queue_create("Bag queue", v3);
  bagQueue = v2->_bagQueue;
  v2->_bagQueue = (OS_dispatch_queue *)v4;

  dispatch_group_t v6 = dispatch_group_create();
  locationGroup = v2->_locationGroup;
  v2->_locationGroup = (OS_dispatch_group *)v6;

  id v8 = objc_alloc_init(MEMORY[0x1E4FBA8A8]);
  id lockObject = v2->_lockObject;
  v2->_id lockObject = v8;

  int v10 = NSHomeDirectory();
  uint64_t v11 = [v10 stringByAppendingPathComponent:@"Library/Spotlight/parsecResources.plist"];

  long long v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithContentsOfFile:v11];
  uint64_t v13 = v12;
  if (v12) {
    uint64_t v14 = [v12 mutableCopy];
  }
  else {
    uint64_t v14 = objc_opt_new();
  }
  unsigned int v15 = (void *)v14;
  [(PRSBagHandler *)v2 setResourceMetadata:v14];

  [(PRSBagHandler *)v2 setResourceMetadataNeedsWrite:0];
  v16 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v17 = dispatch_queue_create("Resource fetch queue", v16);
  [(PRSBagHandler *)v2 setResourceFetchQueue:v17];

  [(PRSBagHandler *)v2 setResourceMetadataPath:v11];
  return v2;
}

- (id)excludedDomainIdentifiers
{
  p_client = &self->_client;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_client);
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    id v5 = objc_loadWeakRetained((id *)p_client);
    dispatch_group_t v6 = [v5 excludedDomainIdentifiers];
  }
  else
  {
    dispatch_group_t v6 = 0;
  }
  return v6;
}

- (BOOL)sessionReady
{
  return 1;
}

- (void)updateWithBagDictionary:(id)a3 error:(id)a4
{
  if (a4) {
    uint64_t v4 = 4;
  }
  else {
    uint64_t v4 = 2;
  }
  [(PRSBagHandler *)self setStatus:v4];
}

- (void)fetchModifiedResourceFromSession:(id)a3 resource:(id)a4 completion:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __70__PRSBagHandler_fetchModifiedResourceFromSession_resource_completion___block_invoke;
  v12[3] = &unk_1E634C1D0;
  id v13 = v8;
  uint64_t v14 = self;
  id v15 = v9;
  id v10 = v9;
  id v11 = v8;
  [a3 fileHandleAndAttributesForResource:v11 completion:v12];
}

void __70__PRSBagHandler_fetchModifiedResourceFromSession_resource_completion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v36 = a3;
  id v8 = a4;
  id v9 = v8;
  if (!v7 || v8)
  {
    v23 = PRSLogCategoryDefault();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      uint64_t v24 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138412546;
      uint64_t v42 = v24;
      __int16 v43 = 2112;
      v44 = v9;
      _os_log_impl(&dword_1BDB2A000, v23, OS_LOG_TYPE_INFO, "failed fetch resource:%@ err:%@", buf, 0x16u);
    }

    id v25 = 0;
    goto LABEL_21;
  }
  int v10 = [*(id *)(a1 + 32) isEqualToString:*MEMORY[0x1E4F5CBF8]];
  id v11 = [v36 objectForKey:*MEMORY[0x1E4F28310]];
  [v11 timeIntervalSinceReferenceDate];
  double v13 = v12;

  uint64_t v14 = [*(id *)(a1 + 40) resourceMetadata];
  objc_sync_enter(v14);
  id v15 = [*(id *)(a1 + 40) resourceMetadata];
  v16 = [v15 objectForKeyedSubscript:*(void *)(a1 + 32)];

  if (v10)
  {
    dispatch_queue_t v17 = [MEMORY[0x1E4F1CA20] currentLocale];
    uint64_t v18 = [v17 languageCode];

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_16;
    }
    objc_super v19 = [v16 objectForKeyedSubscript:@"last_modified"];
    [v19 doubleValue];
    if (v13 - v20 >= 0.01)
    {

      goto LABEL_16;
    }
    uint64_t v21 = [v16 objectForKeyedSubscript:@"language"];
    char v22 = [v21 isEqualToString:v18];

    if ((v22 & 1) == 0)
    {
LABEL_16:
      if (v18)
      {
        v39[0] = @"last_modified";
        v29 = [MEMORY[0x1E4F28ED0] numberWithDouble:v13];
        v39[1] = @"language";
        v40[0] = v29;
        v30 = [MEMORY[0x1E4F1CA20] currentLocale];
        v31 = [v30 languageCode];
        v40[1] = v31;
        uint64_t v32 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v40 forKeys:v39 count:2];

        v16 = (void *)v32;
      }
      else
      {
        v37 = @"last_modified";
        v33 = [MEMORY[0x1E4F28ED0] numberWithDouble:v13];
        v38 = v33;
        uint64_t v34 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v38 forKeys:&v37 count:1];

        uint64_t v18 = 0;
        v16 = (void *)v34;
      }
      goto LABEL_19;
    }
LABEL_13:
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    id v25 = 0;
    char v27 = 1;
    goto LABEL_20;
  }
  [v16 doubleValue];
  if (v13 - v26 < 0.01)
  {
    uint64_t v18 = 0;
    goto LABEL_13;
  }
  uint64_t v28 = [MEMORY[0x1E4F28ED0] numberWithDouble:v13];

  uint64_t v18 = 0;
  v16 = (void *)v28;
LABEL_19:
  v35 = [*(id *)(a1 + 40) resourceMetadata];
  [v35 setObject:v16 forKeyedSubscript:*(void *)(a1 + 32)];

  [*(id *)(a1 + 40) setResourceMetadataNeedsWrite:1];
  id v25 = v7;
  char v27 = 0;
LABEL_20:

  objc_sync_exit(v14);
  if ((v27 & 1) == 0) {
LABEL_21:
  }
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (void)updateFromSession:(id)a3 bag:(id)a4 forClient:(id)a5 error:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  bagQueue = self->_bagQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __55__PRSBagHandler_updateFromSession_bag_forClient_error___block_invoke;
  block[3] = &unk_1E634C2E8;
  block[4] = self;
  id v20 = v11;
  id v21 = v13;
  id v22 = v10;
  id v23 = v12;
  id v15 = v12;
  id v16 = v10;
  id v17 = v13;
  id v18 = v11;
  dispatch_async(bagQueue, block);
}

void __55__PRSBagHandler_updateFromSession_bag_forClient_error___block_invoke(uint64_t a1)
{
  v52[1] = *MEMORY[0x1E4F143B8];
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 40), *(id *)(a1 + 40));
  v2 = [*(id *)(a1 + 40) enabledDomains];
  [*(id *)(a1 + 32) setEnabledDomains:v2];

  uint64_t v3 = [*(id *)(a1 + 40) firstUseDescriptionText];
  uint64_t v4 = (void *)v3;
  if (v3) {
    id v5 = (__CFString *)v3;
  }
  else {
    id v5 = &stru_1F1824018;
  }
  [*(id *)(a1 + 32) setFteLocString:v5];

  uint64_t v6 = [*(id *)(a1 + 40) firstUseLearnMoreText];
  id v7 = (void *)v6;
  if (v6) {
    id v8 = (__CFString *)v6;
  }
  else {
    id v8 = &stru_1F1824018;
  }
  [*(id *)(a1 + 32) setFteLearnMoreString:v8];

  uint64_t v9 = [*(id *)(a1 + 40) firstUseContinueText];
  id v10 = (void *)v9;
  if (v9) {
    id v11 = (__CFString *)v9;
  }
  else {
    id v11 = &stru_1F1824018;
  }
  [*(id *)(a1 + 32) setFteContinueString:v11];

  objc_msgSend(*(id *)(a1 + 32), "setCollectAnonymousData:", objc_msgSend(*(id *)(a1 + 40), "collectAnonymousMetadata"));
  objc_msgSend(*(id *)(a1 + 32), "setDisableAsTypedSuggestion:", objc_msgSend(*(id *)(a1 + 40), "disableAsTypedSuggestion"));
  id v12 = [*(id *)(a1 + 40) searchRenderTimeout];
  [v12 doubleValue];
  double v14 = v13;

  [*(id *)(a1 + 32) setSearchRenderTimeout:v14 / 1000.0];
  id v15 = [*(id *)(a1 + 40) minSuggestionRenderTimeout];
  [v15 doubleValue];
  double v17 = v16;

  [*(id *)(a1 + 32) setSuggestionsRenderTimeout:v17 / 1000.0];
  objc_msgSend(*(id *)(a1 + 32), "setCollectScores:", objc_msgSend(*(id *)(a1 + 40), "collectScores"));
  id v18 = [*(id *)(a1 + 40) anonymousMetadataPreference];
  if (v18)
  {
    [*(id *)(a1 + 32) setAnonymousMetadataUndesiredBundleIDs:v18];
  }
  else
  {
    v52[0] = @"com.apple.application";
    objc_super v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v52 count:1];
    [*(id *)(a1 + 32) setAnonymousMetadataUndesiredBundleIDs:v19];
  }
  if (*(void *)(a1 + 48)) {
    uint64_t v20 = 4;
  }
  else {
    uint64_t v20 = 2;
  }
  [*(id *)(a1 + 32) setStatus:v20];
  objc_msgSend(*(id *)(a1 + 32), "setUse2LayerRanking:", objc_msgSend(*(id *)(a1 + 40), "use2LayerRanking"));
  id v21 = [*(id *)(a1 + 40) suggestionRankerModel];
  [*(id *)(a1 + 32) setSuggestionRankerModelParams:v21];

  *(unsigned char *)(*(void *)(a1 + 32) + 61) = [*(id *)(a1 + 40) isEnabled];
  long long v49 = 0u;
  long long v50 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  id v22 = *(id *)(*(void *)(a1 + 32) + 32);
  uint64_t v23 = [v22 countByEnumeratingWithState:&v47 objects:v51 count:16];
  if (v23)
  {
    uint64_t v24 = v23;
    uint64_t v25 = *(void *)v48;
    do
    {
      for (uint64_t i = 0; i != v24; ++i)
      {
        if (*(void *)v48 != v25) {
          objc_enumerationMutation(v22);
        }
        objc_msgSend(*(id *)(*((void *)&v47 + 1) + 8 * i), "triggerQuery:", objc_msgSend(*(id *)(a1 + 32), "status") == 2);
      }
      uint64_t v24 = [v22 countByEnumeratingWithState:&v47 objects:v51 count:16];
    }
    while (v24);
  }

  char v27 = [*(id *)(a1 + 32) resourceFetchQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __55__PRSBagHandler_updateFromSession_bag_forClient_error___block_invoke_2;
  block[3] = &unk_1E634C298;
  id v28 = *(id *)(a1 + 56);
  uint64_t v29 = *(void *)(a1 + 32);
  id v44 = v28;
  uint64_t v45 = v29;
  id v46 = *(id *)(a1 + 64);
  dispatch_async(v27, block);

  v30 = [*(id *)(a1 + 32) enabledDomains];
  v31 = (void *)[v30 copy];

  uint64_t v32 = [*(id *)(a1 + 32) suggestionRankerModelParams];
  v33 = (void *)[v32 copy];

  v38[0] = MEMORY[0x1E4F143A8];
  v38[1] = 3221225472;
  v38[2] = __55__PRSBagHandler_updateFromSession_bag_forClient_error___block_invoke_7;
  v38[3] = &unk_1E634C2C0;
  id v39 = *(id *)(a1 + 64);
  id v40 = v31;
  uint64_t v41 = *(void *)(a1 + 32);
  id v42 = v33;
  id v34 = v33;
  id v35 = v31;
  dispatch_async(MEMORY[0x1E4F14428], v38);
  uint64_t v36 = *(void *)(a1 + 32);
  v37 = *(void **)(v36 + 32);
  *(void *)(v36 + 32) = 0;
}

void __55__PRSBagHandler_updateFromSession_bag_forClient_error___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *MEMORY[0x1E4F5CC08];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __55__PRSBagHandler_updateFromSession_bag_forClient_error___block_invoke_3;
  void v16[3] = &unk_1E634C1F8;
  uint64_t v3 = *(void **)(a1 + 32);
  uint64_t v4 = *(void **)(a1 + 48);
  void v16[4] = *(void *)(a1 + 40);
  id v17 = v4;
  [v3 fileHandleAndAttributesForResource:v2 completion:v16];
  id v5 = [*(id *)(a1 + 40) resourceFetchQueue];
  dispatch_suspend(v5);

  uint64_t v7 = *(void *)(a1 + 32);
  uint64_t v6 = *(void **)(a1 + 40);
  uint64_t v8 = *MEMORY[0x1E4F5CBF8];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __55__PRSBagHandler_updateFromSession_bag_forClient_error___block_invoke_4;
  v13[3] = &unk_1E634C248;
  id v9 = *(id *)(a1 + 48);
  uint64_t v10 = *(void *)(a1 + 40);
  id v14 = v9;
  uint64_t v15 = v10;
  [v6 fetchModifiedResourceFromSession:v7 resource:v8 completion:v13];
  id v11 = [*(id *)(a1 + 40) resourceFetchQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __55__PRSBagHandler_updateFromSession_bag_forClient_error___block_invoke_6;
  block[3] = &unk_1E634C270;
  void block[4] = *(void *)(a1 + 40);
  dispatch_async(v11, block);
}

void __55__PRSBagHandler_updateFromSession_bag_forClient_error___block_invoke_3(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  if (a2 && !a4)
  {
    objc_msgSend(a2, "prs_mappedData");
    id v5 = (id)objc_claimAutoreleasedReturnValue();
    [*(id *)(a1 + 32) parseCEPFromData:v5 forClient:*(void *)(a1 + 40)];
  }
}

void __55__PRSBagHandler_updateFromSession_bag_forClient_error___block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    uint64_t v4 = dispatch_get_global_queue(9, 0);
    uint64_t v6 = MEMORY[0x1E4F143A8];
    uint64_t v7 = 3221225472;
    uint64_t v8 = __55__PRSBagHandler_updateFromSession_bag_forClient_error___block_invoke_5;
    id v9 = &unk_1E634C220;
    id v10 = *(id *)(a1 + 32);
    id v11 = v3;
    dispatch_async(v4, &v6);
  }
  id v5 = objc_msgSend(*(id *)(a1 + 40), "resourceFetchQueue", v6, v7, v8, v9);
  dispatch_resume(v5);
}

uint64_t __55__PRSBagHandler_updateFromSession_bag_forClient_error___block_invoke_5(uint64_t a1)
{
  return [*(id *)(a1 + 32) updateCorrectionDict:*(void *)(a1 + 40)];
}

void __55__PRSBagHandler_updateFromSession_bag_forClient_error___block_invoke_6(uint64_t a1)
{
  id obj = [*(id *)(a1 + 32) resourceMetadata];
  objc_sync_enter(obj);
  if ([*(id *)(a1 + 32) resourceMetadataNeedsWrite])
  {
    uint64_t v2 = [*(id *)(a1 + 32) resourceMetadata];
    id v3 = [*(id *)(a1 + 32) resourceMetadataPath];
    [v2 writeToFile:v3 atomically:1];

    [*(id *)(a1 + 32) setResourceMetadataNeedsWrite:0];
  }
  objc_sync_exit(obj);
}

void __55__PRSBagHandler_updateFromSession_bag_forClient_error___block_invoke_7(uint64_t a1)
{
  uint64_t v2 = (void *)MEMORY[0x1C1885190]();
  if (objc_opt_respondsToSelector()) {
    [*(id *)(a1 + 32) sessionReceivedBagWithEnabledDomains:*(void *)(a1 + 40)];
  }
  uint64_t v3 = [*(id *)(a1 + 48) suggestionRankerModelParams];
  if (v3)
  {
    uint64_t v4 = (void *)v3;
    char v5 = objc_opt_respondsToSelector();

    if (v5) {
      [*(id *)(a1 + 32) sessionReceivedSuggestionsParameters:*(void *)(a1 + 56)];
    }
  }
}

- (void)removeTask:(id)a3
{
  id v4 = a3;
  bagQueue = self->_bagQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __28__PRSBagHandler_removeTask___block_invoke;
  v7[3] = &unk_1E634C220;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(bagQueue, v7);
}

uint64_t __28__PRSBagHandler_removeTask___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 32) removeObject:*(void *)(a1 + 40)];
}

- (void)triggerTaskWhenReady:(id)a3
{
  id v4 = a3;
  if ([v4 needsBag])
  {
    bagQueue = self->_bagQueue;
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __38__PRSBagHandler_triggerTaskWhenReady___block_invoke;
    v6[3] = &unk_1E634C220;
    v6[4] = self;
    id v7 = v4;
    dispatch_async(bagQueue, v6);
  }
  else
  {
    [v4 triggerQuery:1];
  }
}

uint64_t __38__PRSBagHandler_triggerTaskWhenReady___block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) status] == 4
    || [*(id *)(a1 + 32) status] == 2
    || [*(id *)(a1 + 32) status] == 3)
  {
    uint64_t v2 = *(void **)(a1 + 40);
    BOOL v3 = [*(id *)(a1 + 32) status] == 2;
    return [v2 triggerQuery:v3];
  }
  else
  {
    char v5 = *(void **)(*(void *)(a1 + 32) + 32);
    if (!v5)
    {
      id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      uint64_t v7 = *(void *)(a1 + 32);
      id v8 = *(void **)(v7 + 32);
      *(void *)(v7 + 32) = v6;

      char v5 = *(void **)(*(void *)(a1 + 32) + 32);
    }
    uint64_t v9 = *(void *)(a1 + 40);
    return [v5 addObject:v9];
  }
}

- (void)getFTEStringsWithReply:(id)a3
{
  id v4 = a3;
  char v5 = PRSLogCategoryDefault();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[PRSBagHandler getFTEStringsWithReply:](v5);
  }

  id v6 = [[PRSFTETask alloc] initWithReply:v4];
  [(PRSBagHandler *)self triggerTaskWhenReady:v6];
}

- (BOOL)active
{
  return self->_active;
}

- (void)setActive:(BOOL)a3
{
  self->_active = a3;
}

- (PRSSessionController)client
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_client);
  return (PRSSessionController *)WeakRetained;
}

- (void)setClient:(id)a3
{
}

- (int64_t)status
{
  return self->_status;
}

- (void)setStatus:(int64_t)a3
{
  self->_status = a3;
}

- (double)searchRenderTimeout
{
  return self->_searchRenderTimeout;
}

- (void)setSearchRenderTimeout:(double)a3
{
  self->_searchRenderTimeout = a3;
}

- (double)suggestionsRenderTimeout
{
  return self->_suggestionsRenderTimeout;
}

- (void)setSuggestionsRenderTimeout:(double)a3
{
  self->_suggestionsRenderTimeout = a3;
}

- (SSPlistDataReader)cep_server_values
{
  return (SSPlistDataReader *)objc_getProperty(self, a2, 96, 1);
}

- (void)setCep_server_values:(id)a3
{
}

- (NSSet)appBlocklist
{
  return self->_appBlocklist;
}

- (void)setAppBlocklist:(id)a3
{
}

- (NSArray)enabledDomains
{
  return self->_enabledDomains;
}

- (void)setEnabledDomains:(id)a3
{
}

- (BOOL)disableAsTypedSuggestion
{
  return self->_disableAsTypedSuggestion;
}

- (void)setDisableAsTypedSuggestion:(BOOL)a3
{
  self->_disableAsTypedSuggestion = a3;
}

- (BOOL)collectAnonymousData
{
  return self->_collectAnonymousData;
}

- (void)setCollectAnonymousData:(BOOL)a3
{
  self->_collectAnonymousData = a3;
}

- (BOOL)collectScores
{
  return self->_collectScores;
}

- (void)setCollectScores:(BOOL)a3
{
  self->_collectScores = a3;
}

- (NSArray)anonymousMetadataUndesiredBundleIDs
{
  return (NSArray *)objc_getProperty(self, a2, 120, 1);
}

- (void)setAnonymousMetadataUndesiredBundleIDs:(id)a3
{
}

- (BOOL)use2LayerRanking
{
  return self->_use2LayerRanking;
}

- (void)setUse2LayerRanking:(BOOL)a3
{
  self->_use2LayerRanking = a3;
}

- (NSString)fteLocString
{
  return self->_fteLocString;
}

- (void)setFteLocString:(id)a3
{
}

- (NSString)fteLearnMoreString
{
  return self->_fteLearnMoreString;
}

- (void)setFteLearnMoreString:(id)a3
{
}

- (NSString)fteContinueString
{
  return self->_fteContinueString;
}

- (void)setFteContinueString:(id)a3
{
}

- (NSArray)suggestionRankerModelParams
{
  return self->_suggestionRankerModelParams;
}

- (void)setSuggestionRankerModelParams:(id)a3
{
}

- (NSString)lookupFirstUseDescription1
{
  return self->_lookupFirstUseDescription1;
}

- (NSString)lookupFirstUseDescription2
{
  return self->_lookupFirstUseDescription2;
}

- (NSString)lookupFirstUseLearnMore
{
  return self->_lookupFirstUseLearnMore;
}

- (BOOL)isBagEnabled
{
  return self->_bagEnabled;
}

- (GEOUserSessionEntity)geoUserSessionEntity
{
  return (GEOUserSessionEntity *)objc_getProperty(self, a2, 184, 1);
}

- (NSMutableDictionary)resourceMetadata
{
  return self->_resourceMetadata;
}

- (void)setResourceMetadata:(id)a3
{
}

- (BOOL)resourceMetadataNeedsWrite
{
  return self->_resourceMetadataNeedsWrite;
}

- (void)setResourceMetadataNeedsWrite:(BOOL)a3
{
  self->_resourceMetadataNeedsWrite = a3;
}

- (NSString)resourceMetadataPath
{
  return self->_resourceMetadataPath;
}

- (void)setResourceMetadataPath:(id)a3
{
}

- (OS_dispatch_queue)resourceFetchQueue
{
  return self->_resourceFetchQueue;
}

- (void)setResourceFetchQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resourceFetchQueue, 0);
  objc_storeStrong((id *)&self->_resourceMetadataPath, 0);
  objc_storeStrong((id *)&self->_resourceMetadata, 0);
  objc_storeStrong((id *)&self->_geoUserSessionEntity, 0);
  objc_storeStrong((id *)&self->_lookupFirstUseLearnMore, 0);
  objc_storeStrong((id *)&self->_lookupFirstUseDescription2, 0);
  objc_storeStrong((id *)&self->_lookupFirstUseDescription1, 0);
  objc_storeStrong((id *)&self->_suggestionRankerModelParams, 0);
  objc_storeStrong((id *)&self->_fteContinueString, 0);
  objc_storeStrong((id *)&self->_fteLearnMoreString, 0);
  objc_storeStrong((id *)&self->_fteLocString, 0);
  objc_storeStrong((id *)&self->_anonymousMetadataUndesiredBundleIDs, 0);
  objc_storeStrong((id *)&self->_enabledDomains, 0);
  objc_storeStrong((id *)&self->_appBlocklist, 0);
  objc_storeStrong((id *)&self->_cep_server_values, 0);
  objc_destroyWeak((id *)&self->_client);
  objc_storeStrong((id *)&self->_bagQueue, 0);
  objc_storeStrong((id *)&self->_bag, 0);
  objc_storeStrong((id *)&self->_tasks, 0);
  objc_storeStrong(&self->_lockObject, 0);
  objc_storeStrong((id *)&self->_locationGroup, 0);
}

- (void)_processQIFeatures:(os_log_t)log forClient:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1BDB2A000, log, OS_LOG_TYPE_ERROR, "## Error loading qi features", v1, 2u);
}

- (void)getFTEStringsWithReply:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_1BDB2A000, log, OS_LOG_TYPE_DEBUG, "[FTE] Triggering task for FTE", v1, 2u);
}

@end