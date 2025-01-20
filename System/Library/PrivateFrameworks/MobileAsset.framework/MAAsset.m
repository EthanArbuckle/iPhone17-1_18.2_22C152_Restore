@interface MAAsset
+ (id)getLoadResultFromMessage:(id)a3;
+ (id)loadSync:(id)a3 allowingDifferences:(id)a4 error:(id *)a5;
+ (id)loadSync:(id)a3 allowingDifferences:(id)a4 withPurpose:(id)a5 error:(id *)a6;
+ (id)loadSync:(id)a3 error:(id *)a4;
+ (id)loadSync:(id)a3 withPurpose:(id)a4 error:(id *)a5;
+ (void)cancelCatalogDownload:(id)a3 then:(id)a4;
+ (void)cancelCatalogDownload:(id)a3 withPurpose:(id)a4 then:(id)a5;
+ (void)startCatalogDownload:(id)a3 options:(id)a4 completionWithError:(id)a5;
+ (void)startCatalogDownload:(id)a3 options:(id)a4 then:(id)a5;
+ (void)startCatalogDownload:(id)a3 then:(id)a4;
- (BOOL)isEqual:(id)a3;
- (BOOL)nonUserInitiatedDownloadsAllowed;
- (BOOL)overrideGarbageCollectionThreshold:(unint64_t)a3;
- (BOOL)refreshState;
- (BOOL)spaceCheck:(int64_t *)a3;
- (BOOL)wasDownloadable;
- (BOOL)wasInCatalog;
- (BOOL)wasLocal;
- (BOOL)wasPreinstalled;
- (BOOL)wasPurgeable;
- (MAAsset)initWithAttributes:(id)a3;
- (NSDictionary)attributes;
- (NSString)assetId;
- (NSString)assetType;
- (NSString)purpose;
- (id)absoluteAssetId;
- (id)assetProperty:(id)a3;
- (id)assetServerUrl;
- (id)description;
- (id)getLocalFilePath;
- (id)getLocalFileUrl;
- (id)hashToString:(id)a3;
- (int64_t)calculateTimeout;
- (int64_t)cancelDownloadSync;
- (int64_t)configDownloadSync:(id)a3;
- (int64_t)purgeSync;
- (int64_t)state;
- (unint64_t)hash;
- (void)_invokeClientDownloadCompletionAlreadyOnQueue:(int64_t)a3 asset:(id)a4 completionBlockWithError:(id)a5;
- (void)attachProgressCallBack:(id)a3;
- (void)cancelDownload:(id)a3;
- (void)commonAssetDownload:(id)a3 options:(id)a4 then:(id)a5;
- (void)configDownload:(id)a3 completion:(id)a4;
- (void)invokeClientDownloadCompletion:(int64_t)a3 asset:(id)a4 completionBlockWithError:(id)a5;
- (void)logAsset;
- (void)purge:(id)a3;
- (void)purgeWithError:(id)a3;
- (void)startDownload:(id)a3;
- (void)startDownload:(id)a3 completionWithError:(id)a4;
- (void)startDownload:(id)a3 then:(id)a4;
- (void)startDownloadWithExtractor:(id)a3 completion:(id)a4;
- (void)startDownloadWithExtractor:(id)a3 options:(id)a4 completion:(id)a5;
- (void)startDownloadWithExtractor:(id)a3 options:(id)a4 completionWithError:(id)a5;
@end

@implementation MAAsset

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_purpose, 0);
  objc_storeStrong((id *)&self->_assetId, 0);
  objc_storeStrong((id *)&self->_assetType, 0);
  objc_storeStrong((id *)&self->_attributes, 0);
}

+ (void)startCatalogDownload:(id)a3 options:(id)a4 completionWithError:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  v10 = (void *)MEMORY[0x1B3EAACB0]();
  v21[0] = 0;
  v21[1] = v21;
  v21[2] = 0x2020000000;
  v21[3] = 1;
  if (v8) {
    id v11 = v8;
  }
  else {
    id v11 = (id)objc_opt_new();
  }
  v12 = v11;
  if ([v11 timeoutIntervalForResource] == -1) {
    [v12 setTimeoutIntervalForResource:900];
  }
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __60__MAAsset_startCatalogDownload_options_completionWithError___block_invoke;
  v16[3] = &unk_1E6004F08;
  v20 = v21;
  id v13 = v7;
  id v17 = v13;
  id v14 = v12;
  id v18 = v14;
  id v15 = v9;
  id v19 = v15;
  _MAsendDownloadMetaData(v13, v14, v16);

  _Block_object_dispose(v21, 8);
}

void __60__MAAsset_startCatalogDownload_options_completionWithError___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = v3;
  *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
  if (v3)
  {
    if (MEMORY[0x1B3EAB1B0](v3) == MEMORY[0x1E4F145A8])
    {
      uint64_t v16 = *(void *)(a1 + 32);
      v6 = stringForMADownloadResult(*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24));
      _MobileAssetLog(0, 6, (uint64_t)"+[MAAsset startCatalogDownload:options:completionWithError:]_block_invoke", @"Error on the download meta data reply for %@, response: %ld (%@)", v17, v18, v19, v20, v16);
    }
    else
    {
      *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = xpc_dictionary_get_int64(v4, "Result");
      uint64_t v5 = *(void *)(a1 + 32);
      v6 = stringForMADownloadResult(*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24));
      _MobileAssetLog(0, 6, (uint64_t)"+[MAAsset startCatalogDownload:options:completionWithError:]_block_invoke", @"Got the download meta data reply for %@, response: %ld (%@)", v7, v8, v9, v10, v5);
    }
  }
  else
  {
    uint64_t v11 = *(void *)(a1 + 32);
    v6 = stringForMADownloadResult(*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24));
    _MobileAssetLog(0, 6, (uint64_t)"+[MAAsset startCatalogDownload:options:completionWithError:]_block_invoke", @"Error on the download meta data reply for %@, response: %ld (%@) due to not having an xpc message", v12, v13, v14, v15, v11);
  }

  uint64_t v25 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
  if (v25 == 13)
  {
    _MobileAssetLog(0, 6, (uint64_t)"+[MAAsset startCatalogDownload:options:completionWithError:]_block_invoke", @"Will retry download meta data for %@, after %ld seconds", v21, v22, v23, v24, *(void *)(a1 + 32));
    dispatch_time_t v26 = dispatch_time(0, 2000000000);
    if (getRetryXpcDelayQueue_onceToken_0 != -1) {
      dispatch_once(&getRetryXpcDelayQueue_onceToken_0, &__block_literal_global_2);
    }
    v27 = getRetryXpcDelayQueue_retryQueue_0;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __60__MAAsset_startCatalogDownload_options_completionWithError___block_invoke_2;
    block[3] = &unk_1E6004EE0;
    id v39 = *(id *)(a1 + 32);
    id v40 = *(id *)(a1 + 40);
    long long v37 = *(_OWORD *)(a1 + 48);
    id v28 = (id)v37;
    long long v41 = v37;
    dispatch_after(v26, v27, block);
  }
  else if (*(void *)(a1 + 48))
  {
    if (isDownloadResultFailure(v25))
    {
      unint64_t v29 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
      v30 = errorStringForMADownloadResult(v29);
      v36 = MAErrorForDownloadResultWithUnderlying(v29, 0, @"%@ (Catalog download for %@)", v31, v32, v33, v34, v35, (uint64_t)v30);
    }
    else
    {
      v36 = 0;
    }
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

uint64_t __45__MAAsset_startCatalogDownload_options_then___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (id)getLocalFileUrl
{
  v2 = [(MAAsset *)self getLocalFilePath];
  if (v2)
  {
    id v3 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v2 isDirectory:1];
  }
  else
  {
    id v3 = 0;
  }

  return v3;
}

- (id)getLocalFilePath
{
  int64_t state = self->_state;
  assetType = self->_assetType;
  if (state == 5)
  {
    uint64_t v5 = getLocalUrlFromTypeAndIdGivenDefaultRepoWithPurpose(assetType, self->_assetId, 5, 0, 0);
    v6 = [v5 path];
  }
  else
  {
    _MAensureExtension(assetType);
    v6 = _MAsendUpdateClientAccessGetPathWithPurposeSync(self->_assetType, self->_assetId, self->_state, self->_purpose);
  }
  return v6;
}

+ (void)startCatalogDownload:(id)a3 options:(id)a4 then:(id)a5
{
  id v7 = a5;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __45__MAAsset_startCatalogDownload_options_then___block_invoke;
  v9[3] = &unk_1E6004E40;
  id v10 = v7;
  id v8 = v7;
  +[MAAsset startCatalogDownload:a3 options:a4 completionWithError:v9];
}

- (BOOL)wasLocal
{
  return (self->_state < 7uLL) & (0x6Cu >> self->_state);
}

- (BOOL)wasPreinstalled
{
  return (unint64_t)(self->_state - 5) < 2;
}

- (BOOL)wasPurgeable
{
  return (self->_state < 7uLL) & (0x5Cu >> self->_state);
}

- (BOOL)wasInCatalog
{
  return (self->_state < 5uLL) & (0x16u >> self->_state);
}

- (BOOL)wasDownloadable
{
  int64_t state = self->_state;
  return state == 1 || state == 4;
}

- (MAAsset)initWithAttributes:(id)a3
{
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)MAAsset;
  uint64_t v5 = [(MAAsset *)&v19 init];
  if (v5)
  {
    uint64_t v6 = [v4 objectForKey:@"AssetProperties"];
    attributes = v5->_attributes;
    v5->_attributes = (NSDictionary *)v6;

    uint64_t v8 = [(NSDictionary *)v5->_attributes objectForKey:@"AssetPurpose"];
    purpose = v5->_purpose;
    v5->_purpose = (NSString *)v8;

    id v10 = [v4 objectForKey:@"AssetAddedProperties"];
    uint64_t v11 = v10;
    if (v10)
    {
      uint64_t v12 = [v10 objectForKey:@"AssetState"];
      uint64_t v13 = v12;
      if (v12) {
        uint64_t v12 = (void *)[v12 integerValue];
      }
      v5->_int64_t state = (int64_t)v12;
      uint64_t v14 = [v11 objectForKey:@"AssetType"];
      assetType = v5->_assetType;
      v5->_assetType = (NSString *)v14;

      uint64_t v16 = [v11 objectForKey:@"AssetId"];
      assetId = v5->_assetId;
      v5->_assetId = (NSString *)v16;
    }
  }

  return v5;
}

+ (id)getLoadResultFromMessage:(id)a3
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  size_t length = 0;
  data = xpc_dictionary_get_data(v3, (const char *)[@"xmlData" UTF8String], &length);
  if (!data)
  {
    _MobileAssetLog(0, 6, (uint64_t)"+[MAAsset getLoadResultFromMessage:]", @"load rawData is null skipping", v5, v6, v7, v8, v37);
    id v24 = 0;
    uint64_t v33 = 0;
    uint64_t v14 = 0;
    uint64_t v15 = 0;
    uint64_t v13 = 0;
LABEL_24:
    id v27 = 0;
    goto LABEL_25;
  }
  uint64_t v13 = [MEMORY[0x1E4F1C9B8] dataWithBytesNoCopy:data length:length freeWhenDone:0];
  if (!v13)
  {
    _MobileAssetLog(0, 6, (uint64_t)"+[MAAsset getLoadResultFromMessage:]", @"load data is null skipping", v9, v10, v11, v12, v37);
    id v24 = 0;
    uint64_t v33 = 0;
    uint64_t v14 = 0;
    uint64_t v15 = 0;
    goto LABEL_24;
  }
  uint64_t v14 = (void *)[objc_alloc(MEMORY[0x1E4F28DC0]) initForReadingFromData:v13 error:0];
  uint64_t v15 = [v14 decodePropertyListForKey:*MEMORY[0x1E4F284E8]];
  [v14 finishDecoding];
  if (!v15)
  {
    uint64_t v34 = @"load allData is null skipping";
LABEL_21:
    _MobileAssetLog(0, 6, (uint64_t)"+[MAAsset getLoadResultFromMessage:]", v34, v16, v17, v18, v19, v37);
    id v24 = 0;
LABEL_23:
    uint64_t v33 = 0;
    goto LABEL_24;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    uint64_t v34 = @"load allData is not a dictionary";
    goto LABEL_21;
  }
  id v24 = [v15 objectForKey:@"assetsToFrameWork"];
  if (!v24 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    _MobileAssetLog(0, 6, (uint64_t)"+[MAAsset getLoadResultFromMessage:]", @"attributes is nil", v20, v21, v22, v23, v37);
    goto LABEL_23;
  }
  long long v39 = 0u;
  long long v40 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  id v24 = v24;
  uint64_t v25 = [v24 countByEnumeratingWithState:&v37 objects:v42 count:16];
  if (v25)
  {
    uint64_t v26 = v25;
    id v27 = 0;
    uint64_t v28 = *(void *)v38;
    while (2)
    {
      uint64_t v29 = 0;
      v30 = v27;
      do
      {
        if (*(void *)v38 != v28) {
          objc_enumerationMutation(v24);
        }
        id v27 = *(id *)(*((void *)&v37 + 1) + 8 * v29);

        uint64_t v31 = [MAAsset alloc];
        uint64_t v32 = -[MAAsset initWithAttributes:](v31, "initWithAttributes:", v27, (void)v37);
        if (v32)
        {
          uint64_t v33 = (void *)v32;
          goto LABEL_29;
        }
        ++v29;
        v30 = v27;
      }
      while (v26 != v29);
      uint64_t v26 = [v24 countByEnumeratingWithState:&v37 objects:v42 count:16];
      if (v26) {
        continue;
      }
      break;
    }
  }
  uint64_t v33 = 0;
  id v27 = 0;
LABEL_29:

LABEL_25:
  id v35 = v33;

  return v35;
}

+ (id)loadSync:(id)a3 error:(id *)a4
{
  return (id)[a1 loadSync:a3 allowingDifferences:0 withPurpose:0 error:a4];
}

+ (id)loadSync:(id)a3 withPurpose:(id)a4 error:(id *)a5
{
  return (id)[a1 loadSync:a3 allowingDifferences:0 withPurpose:a4 error:a5];
}

+ (id)loadSync:(id)a3 allowingDifferences:(id)a4 error:(id *)a5
{
  return (id)[a1 loadSync:a3 allowingDifferences:a4 withPurpose:0 error:a5];
}

+ (id)loadSync:(id)a3 allowingDifferences:(id)a4 withPurpose:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  xpc_object_t v13 = xpc_dictionary_create(0, 0, 0);
  id v14 = [v10 assetType];
  xpc_dictionary_set_string(v13, "AssetType", (const char *)[v14 UTF8String]);

  v74 = v12;
  if (v10 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    uint64_t v19 = [v10 encodeAsPlist];
    addObjectToMessage(v19, v13, "loadAssetIdLength", "loadAssetId");
    xpc_dictionary_set_uint64(v13, "messageAction", 0x1BuLL);
    CFAllocatorRef v20 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
    v71 = getprogname();
    uint64_t v21 = (id) CFStringCreateWithFormat(v20, 0, @"%s");
    xpc_dictionary_set_string(v13, "clientName", (const char *)[(__CFString *)v21 UTF8String]);
    if (v12) {
      xpc_dictionary_set_string(v13, "Purpose", (const char *)[v12 UTF8String]);
    }
    if (!v11)
    {
      id v11 = +[MAAssetDiff defaultAllowedDifferences];
    }
    v75 = v11;
    uint64_t v22 = [v11 encodeAsPlist];
    uint64_t v23 = addObjectToMessage(v22, v13, "allowedDifferencesLength", "allowedDifferences");
    uint64_t v76 = 12;
    uint64_t v31 = _getCommsManager(v23, v24, v25, v26, v27, v28, v29, v30);
    uint64_t v32 = [NSString stringWithUTF8String:"+[MAAsset loadSync:allowingDifferences:withPurpose:error:]"];
    uint64_t v33 = [v31 sendSync:v13 gettingResponseCode:&v76 codeForXpcError:1 loggingName:v32];

    unint64_t v38 = v76;
    if (v76 != 1)
    {
      v52 = [a1 getLoadResultFromMessage:v33];
      v46 = v52;
      if (v52)
      {
        v57 = [v52 absoluteAssetId];
        v45 = [v57 description];
      }
      else
      {
        v45 = @"nothing";
      }
      if (v38 == 14)
      {
        v58 = [v46 absoluteAssetId];
        v59 = [v10 diffFrom:v58];

        _MobileAssetLog(0, 6, (uint64_t)"+[MAAsset loadSync:allowingDifferences:withPurpose:error:]", @"Asset load result for %@: %ld (MAQueryHasAllowedDifferences). Found match %@ within allowed differences %@ (actual differences were %@)", v60, v61, v62, v63, (uint64_t)v10);
      }
      else
      {
        if (!v38)
        {
          _MobileAssetLog(0, 6, (uint64_t)"+[MAAsset loadSync:allowingDifferences:withPurpose:error:]", @"Asset load result for %@: %ld (MAQuerySuccessful). Found %@.", v53, v54, v55, v56, (uint64_t)v10);
          goto LABEL_24;
        }
        v59 = stringForMAQueryResult(v38);
        _MobileAssetLog(0, 6, (uint64_t)"+[MAAsset loadSync:allowingDifferences:withPurpose:error:]", @"Asset load result for %@: %ld (%@)", v64, v65, v66, v67, (uint64_t)v10);
      }

      goto LABEL_24;
    }
    _MobileAssetLog(0, 6, (uint64_t)"+[MAAsset loadSync:allowingDifferences:withPurpose:error:]", @"Asset load failed due to XPC", v34, v35, v36, v37, (uint64_t)v71);
    if (!a6)
    {
      v45 = 0;
      v46 = 0;
      goto LABEL_24;
    }
    MAError(@"com.apple.MobileAssetError.Query", 1, @"Asset load failed due to an XPC error", v39, v40, v41, v42, v43, v72);
    id v44 = (id)objc_claimAutoreleasedReturnValue();
    v45 = 0;
    v46 = 0;
  }
  else
  {
    v75 = v11;
    _MobileAssetLog(0, 6, (uint64_t)"+[MAAsset loadSync:allowingDifferences:withPurpose:error:]", @"Asset load failed due to nil or invalid type", v15, v16, v17, v18, v70);
    if (!a6)
    {
      v45 = 0;
      uint64_t v21 = 0;
      v46 = 0;
      uint64_t v33 = 0;
      uint64_t v19 = 0;
      uint64_t v22 = 0;
      goto LABEL_24;
    }
    MAError(@"com.apple.MobileAssetError.Query", 8, @"Asset load failed due to the absoluteId being nil or the wrong type", v47, v48, v49, v50, v51, v73);
    id v44 = (id)objc_claimAutoreleasedReturnValue();
    v45 = 0;
    uint64_t v21 = 0;
    v46 = 0;
    uint64_t v33 = 0;
    uint64_t v19 = 0;
    uint64_t v22 = 0;
  }
  *a6 = v44;
LABEL_24:
  id v68 = v46;

  return v68;
}

- (BOOL)nonUserInitiatedDownloadsAllowed
{
  return 1;
}

- (unint64_t)hash
{
  return [(NSString *)self->_assetId hash];
}

- (id)assetServerUrl
{
  id v3 = [(NSDictionary *)self->_attributes objectForKey:@"__RelativePath"];
  if (!v3)
  {
    id v4 = 0;
    goto LABEL_5;
  }
  id v4 = [(NSDictionary *)self->_attributes objectForKey:@"__BaseURL"];
  if (!v4)
  {
LABEL_5:
    uint64_t v6 = 0;
    goto LABEL_6;
  }
  uint64_t v5 = [MEMORY[0x1E4F1CB10] URLWithString:v4];
  uint64_t v6 = [v5 URLByAppendingPathComponent:v3];

LABEL_6:
  id v7 = v6;

  return v7;
}

- (void)attachProgressCallBack:(id)a3
{
  id v4 = a3;
  _getCommsManager((uint64_t)v4, v5, v6, v7, v8, v9, v10, v11);
  id v12 = (id)objc_claimAutoreleasedReturnValue();
  [v12 attachProgressHandler:self->_assetType assetId:self->_assetId callBack:v4 withPurpose:self->_purpose];
}

- (id)assetProperty:(id)a3
{
  return [(NSDictionary *)self->_attributes objectForKey:a3];
}

- (id)description
{
  return (id)objc_msgSend(NSString, "stringWithFormat:", @"assetType: \"%@\"; assetId: %@ State: %ld",
               self->_assetType,
               self->_assetId,
               self->_state);
}

- (void)logAsset
{
  *(_OWORD *)id v12 = *(_OWORD *)&self->_assetId;
  uint64_t v11 = purposeDirectoryName(self->_purpose);
  _MobileAssetLog(0, 6, (uint64_t)"-[MAAsset logAsset]", @"assetId: %@ State: %ld attributes: %@ purpose: %@", v3, v4, v5, v6, (uint64_t)v12[0]);

  if ([(MAAsset *)self wasLocal])
  {
    xpc_object_t v13 = [(MAAsset *)self getLocalUrl];
    _MobileAssetLog(0, 6, (uint64_t)"-[MAAsset logAsset]", @"The asset is installed at: %@", v7, v8, v9, v10, (uint64_t)v13);
  }
}

- (id)absoluteAssetId
{
  uint64_t v3 = [MAAbsoluteAssetId alloc];
  uint64_t v4 = [(MAAsset *)self assetId];
  uint64_t v5 = [(MAAsset *)self assetType];
  uint64_t v6 = [(MAAsset *)self attributes];
  uint64_t v7 = [(MAAbsoluteAssetId *)v3 initWithAssetId:v4 forAssetType:v5 attributes:v6];

  return v7;
}

- (void)startDownloadWithExtractor:(id)a3 completion:(id)a4
{
}

- (void)startDownloadWithExtractor:(id)a3 options:(id)a4 completion:(id)a5
{
  id v8 = a5;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __57__MAAsset_startDownloadWithExtractor_options_completion___block_invoke;
  v10[3] = &unk_1E6004E40;
  id v11 = v8;
  id v9 = v8;
  [(MAAsset *)self startDownloadWithExtractor:a3 options:a4 completionWithError:v10];
}

uint64_t __57__MAAsset_startDownloadWithExtractor_options_completion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)startDownloadWithExtractor:(id)a3 options:(id)a4 completionWithError:(id)a5
{
  id v17 = a3;
  id v8 = a4;
  id v9 = a5;
  uint64_t v10 = (void *)MEMORY[0x1B3EAACB0]();
  id v11 = [(NSDictionary *)self->_attributes objectForKey:@"_Measurement"];
  id v12 = [(MAAsset *)self hashToString:v11];

  xpc_object_t v13 = [(NSDictionary *)self->_attributes objectForKey:@"_UnarchivedSize"];
  id v14 = [(NSDictionary *)self->_attributes objectForKey:@"_LengthOfDataRange"];
  uint64_t v15 = v14;
  if (v12 && v14 && v13)
  {
    uint64_t v16 = (*((void (**)(id, void, uint64_t, void *, void, void))v17 + 2))(v17, 0, 2, v12, (int)[v14 intValue], (int)objc_msgSend(v13, "intValue"));
    [(MAAsset *)self commonAssetDownload:v16 options:v8 then:v9];
  }
  else
  {
    [(MAAsset *)self invokeClientDownloadCompletion:3 asset:self completionBlockWithError:v9];
  }
}

- (id)hashToString:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [v3 bytes];
  uint64_t v5 = [MEMORY[0x1E4F28E78] string];
  if ([v3 length])
  {
    unint64_t v6 = 0;
    do
      objc_msgSend(v5, "appendFormat:", @"%02x", *(unsigned __int8 *)(v4 + v6++));
    while ([v3 length] > v6);
  }

  return v5;
}

- (void)startDownload:(id)a3
{
}

- (void)startDownload:(id)a3 then:(id)a4
{
  id v6 = a4;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __30__MAAsset_startDownload_then___block_invoke;
  v8[3] = &unk_1E6004E40;
  id v9 = v6;
  id v7 = v6;
  [(MAAsset *)self startDownload:a3 completionWithError:v8];
}

uint64_t __30__MAAsset_startDownload_then___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)startDownload:(id)a3 completionWithError:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  id v7 = (void *)MEMORY[0x1B3EAACB0]();
  [(MAAsset *)self commonAssetDownload:0 options:v8 then:v6];
}

- (int64_t)calculateTimeout
{
  v2 = [(NSDictionary *)self->_attributes objectForKey:@"_DownloadSize"];
  uint64_t v3 = [v2 longLongValue];

  return calculateTimeout(v3, v4, v5, v6, v7, v8, v9, v10);
}

- (void)_invokeClientDownloadCompletionAlreadyOnQueue:(int64_t)a3 asset:(id)a4 completionBlockWithError:(id)a5
{
  id v18 = a4;
  uint64_t v7 = (void (**)(id, int64_t, void *))a5;
  uint64_t v8 = _getClientCallbackQueue();
  dispatch_assert_queue_V2(v8);

  if (isDownloadResultFailure(a3))
  {
    uint64_t v9 = errorStringForMADownloadResult(a3);
    uint64_t v10 = [v18 assetType];
    id v17 = [v18 assetId];
    uint64_t v16 = MAErrorForDownloadResultWithUnderlying(a3, 0, @"%@ (Asset download for %@ %@)", v11, v12, v13, v14, v15, (uint64_t)v9);
  }
  else
  {
    uint64_t v16 = 0;
  }
  v7[2](v7, a3, v16);
}

- (void)invokeClientDownloadCompletion:(int64_t)a3 asset:(id)a4 completionBlockWithError:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  uint64_t v10 = _getClientCallbackQueue();
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __73__MAAsset_invokeClientDownloadCompletion_asset_completionBlockWithError___block_invoke;
  v13[3] = &unk_1E6004E68;
  v13[4] = self;
  id v14 = v8;
  id v15 = v9;
  int64_t v16 = a3;
  id v11 = v9;
  id v12 = v8;
  dispatch_async(v10, v13);
}

uint64_t __73__MAAsset_invokeClientDownloadCompletion_asset_completionBlockWithError___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _invokeClientDownloadCompletionAlreadyOnQueue:*(void *)(a1 + 56) asset:*(void *)(a1 + 40) completionBlockWithError:*(void *)(a1 + 48)];
}

- (void)commonAssetDownload:(id)a3 options:(id)a4 then:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (!self->_assetId || !self->_assetType)
  {
    id v18 = self;
    uint64_t v19 = 23;
LABEL_9:
    [(MAAsset *)v18 invokeClientDownloadCompletion:v19 asset:self completionBlockWithError:v10];
    goto LABEL_10;
  }
  if (self->_purpose)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      id v18 = self;
      uint64_t v19 = 74;
      goto LABEL_9;
    }
  }
  id v11 = [(MAAsset *)self assetProperty:@"__BaseURL"];
  id v12 = [(MAAsset *)self assetProperty:@"__RelativePath"];
  uint64_t v13 = [(NSDictionary *)self->_attributes objectForKey:@"_DownloadSize"];
  uint64_t v14 = [v13 longLongValue];

  int64_t state = self->_state;
  if (state == 6)
  {
    int64_t v16 = self;
    uint64_t v17 = 29;
    goto LABEL_13;
  }
  if (state == 5)
  {
    int64_t v16 = self;
    uint64_t v17 = 15;
LABEL_13:
    [(MAAsset *)v16 invokeClientDownloadCompletion:v17 asset:self completionBlockWithError:v10];

    goto LABEL_10;
  }
  if (v9) {
    id v20 = v9;
  }
  else {
    id v20 = (id)objc_opt_new();
  }
  uint64_t v21 = v20;
  uint64_t v22 = suAssetTypes();
  int v23 = [v22 containsObject:self->_assetType];

  if (v23) {
    [v9 setAllowDaemonConnectionRetries:1];
  }
  if ([v9 discretionary]
    && ![(MAAsset *)self nonUserInitiatedDownloadsAllowed])
  {
    _MobileAssetLog(0, 6, (uint64_t)"-[MAAsset commonAssetDownload:options:then:]", @"Cannot download %@ %@ unless the download is user-initiated (non-discretionary) as the user has turned off background system file updates (check first if nonUserInitiatedDownloadsAllowed).", v24, v25, v26, v27, (uint64_t)self->_assetType);
    [(MAAsset *)self invokeClientDownloadCompletion:34 asset:self completionBlockWithError:v10];
  }
  else
  {
    if ([v21 timeoutIntervalForResource] == -1) {
      objc_msgSend(v21, "setTimeoutIntervalForResource:", -[MAAsset calculateTimeout](self, "calculateTimeout"));
    }
    uint64_t v39 = v14;
    uint64_t v40 = v11;
    uint64_t v28 = [(NSDictionary *)self->_attributes objectForKey:@"__CanUseLocalCacheServer"];
    char v29 = objc_opt_respondsToSelector();
    if (v9 && (v29 & 1) != 0)
    {
      objc_msgSend(v21, "setCanUseLocalCacheServer:", objc_msgSend(v28, "BOOLValue"));
      unsigned int v30 = [v21 canUseLocalCacheServer];
      _MobileAssetLog(0, 6, (uint64_t)"-[MAAsset commonAssetDownload:options:then:]", @"The cache server is: %d", v31, v32, v33, v34, v30);
    }
    assetType = self->_assetType;
    assetId = self->_assetId;
    uint64_t v37 = v21;
    purpose = self->_purpose;
    v41[0] = MEMORY[0x1E4F143A8];
    v41[1] = 3221225472;
    v41[2] = __44__MAAsset_commonAssetDownload_options_then___block_invoke;
    v41[3] = &unk_1E6004E90;
    v41[4] = self;
    id v42 = v10;
    _MAsendDownloadAsset(v37, assetType, assetId, v39, v40, v12, 0, v8, purpose, v41);
  }
LABEL_10:
}

void __44__MAAsset_commonAssetDownload_options_then___block_invoke(uint64_t a1, void *a2)
{
  xpc_object_t xdict = a2;
  if (xdict)
  {
    if (MEMORY[0x1B3EAB1B0]() == MEMORY[0x1E4F145A8])
    {
      uint64_t v15 = *(void *)(*(void *)(a1 + 32) + 16);
      int64_t int64 = 1;
      uint64_t v5 = stringForMADownloadResult(1uLL);
      _MobileAssetLog(0, 6, (uint64_t)"-[MAAsset commonAssetDownload:options:then:]_block_invoke", @"Error on the download asset reply for %@, response: %ld (%@)", v16, v17, v18, v19, v15);
    }
    else
    {
      int64_t int64 = xpc_dictionary_get_int64(xdict, "Result");
      uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 16);
      uint64_t v5 = stringForMADownloadResult(int64);
      _MobileAssetLog(0, 6, (uint64_t)"-[MAAsset commonAssetDownload:options:then:]_block_invoke", @"Got the download asset reply for %@, response: %ld (%@)", v6, v7, v8, v9, v4);
    }
  }
  else
  {
    uint64_t v10 = *(void *)(*(void *)(a1 + 32) + 16);
    int64_t int64 = 1;
    uint64_t v5 = stringForMADownloadResult(1uLL);
    _MobileAssetLog(0, 6, (uint64_t)"-[MAAsset commonAssetDownload:options:then:]_block_invoke", @"Error on the download asset reply for %@, response: %ld (%@) due to no xpc message", v11, v12, v13, v14, v10);
  }

  [*(id *)(a1 + 32) _invokeClientDownloadCompletionAlreadyOnQueue:int64 asset:*(void *)(a1 + 32) completionBlockWithError:*(void *)(a1 + 40)];
}

+ (void)startCatalogDownload:(id)a3 then:(id)a4
{
}

void __60__MAAsset_startCatalogDownload_options_completionWithError___block_invoke_2(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void **)(a1 + 40);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __60__MAAsset_startCatalogDownload_options_completionWithError___block_invoke_3;
  v4[3] = &unk_1E6004EB8;
  uint64_t v7 = *(void *)(a1 + 56);
  id v5 = v2;
  id v6 = *(id *)(a1 + 48);
  _MAsendDownloadMetaData(v5, v3, v4);
}

void __60__MAAsset_startCatalogDownload_options_completionWithError___block_invoke_3(void *a1, void *a2)
{
  id v3 = a2;
  *(void *)(*(void *)(a1[6] + 8) + 24) = 1;
  xpc_object_t xdict = v3;
  if (v3)
  {
    if (MEMORY[0x1B3EAB1B0]() == MEMORY[0x1E4F145A8])
    {
      *(void *)(*(void *)(a1[6] + 8) + 24) = 1;
    }
    else
    {
      *(void *)(*(void *)(a1[6] + 8) + 24) = xpc_dictionary_get_int64(xdict, "Result");
      if (!isDownloadResultFailure(*(void *)(*(void *)(a1[6] + 8) + 24)))
      {
        uint64_t v4 = a1[4];
        id v5 = stringForMADownloadResult(*(void *)(*(void *)(a1[6] + 8) + 24));
        _MobileAssetLog(0, 6, (uint64_t)"+[MAAsset startCatalogDownload:options:completionWithError:]_block_invoke_3", @"Got the retry download meta data reply for %@, response: %ld (%@)", v6, v7, v8, v9, v4);
        uint64_t v10 = 0;
        goto LABEL_8;
      }
    }
    unint64_t v23 = *(void *)(*(void *)(a1[6] + 8) + 24);
    uint64_t v24 = errorStringForMADownloadResult(v23);
    uint64_t v10 = MAErrorForDownloadResultWithUnderlying(v23, 0, @"%@ (Catalog download for %@)", v25, v26, v27, v28, v29, (uint64_t)v24);

    uint64_t v30 = a1[4];
    id v5 = stringForMADownloadResult(*(void *)(*(void *)(a1[6] + 8) + 24));
    _MobileAssetLog(0, 6, (uint64_t)"+[MAAsset startCatalogDownload:options:completionWithError:]_block_invoke_3", @"Error on the retry download meta data reply for %@, response: %ld (%@)", v31, v32, v33, v34, v30);
  }
  else
  {
    *(void *)(*(void *)(a1[6] + 8) + 24) = 24;
    unint64_t v11 = *(void *)(*(void *)(a1[6] + 8) + 24);
    uint64_t v12 = errorStringForMADownloadResult(v11);
    uint64_t v10 = MAErrorForDownloadResultWithUnderlying(v11, 0, @"%@ (Catalog download for %@)", v13, v14, v15, v16, v17, (uint64_t)v12);

    uint64_t v18 = a1[4];
    id v5 = stringForMADownloadResult(*(void *)(*(void *)(a1[6] + 8) + 24));
    _MobileAssetLog(0, 6, (uint64_t)"+[MAAsset startCatalogDownload:options:completionWithError:]_block_invoke_3", @"Error on the retry download meta data reply for %@, response: %ld (%@) due to not having an xpc message", v19, v20, v21, v22, v18);
  }
LABEL_8:

  uint64_t v35 = a1[5];
  if (v35) {
    (*(void (**)(uint64_t, void, void *))(v35 + 16))(v35, *(void *)(*(void *)(a1[6] + 8) + 24), v10);
  }
}

- (void)purge:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __17__MAAsset_purge___block_invoke;
  v6[3] = &unk_1E6004E40;
  id v7 = v4;
  id v5 = v4;
  [(MAAsset *)self purgeWithError:v6];
}

uint64_t __17__MAAsset_purge___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)purgeWithError:(id)a3
{
  id v4 = a3;
  id v5 = (void *)MEMORY[0x1B3EAACB0]();
  uint64_t state = self->_state;
  if (state != 5)
  {
    assetType = self->_assetType;
    assetId = self->_assetId;
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __26__MAAsset_purgeWithError___block_invoke_2;
    v11[3] = &unk_1E6004E90;
    v11[4] = self;
    id v12 = v4;
    _MAsendPurgeAsset(assetType, assetId, state, v11);
    uint64_t v8 = v12;
    goto LABEL_5;
  }
  if (v4)
  {
    id v7 = _getClientCallbackQueue();
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __26__MAAsset_purgeWithError___block_invoke;
    block[3] = &unk_1E6004F30;
    id v14 = v4;
    dispatch_async(v7, block);

    uint64_t v8 = v14;
LABEL_5:
  }
}

void __26__MAAsset_purgeWithError___block_invoke(uint64_t a1)
{
  v2 = errorStringForMAPurgeResult(7);
  MAError(@"com.apple.MobileAssetError.Purge", 7, @"%@", v3, v4, v5, v6, v7, (uint64_t)v2);
  id v8 = (id)objc_claimAutoreleasedReturnValue();

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __26__MAAsset_purgeWithError___block_invoke_2(uint64_t a1, void *a2)
{
  xpc_object_t xdict = a2;
  if (MEMORY[0x1B3EAB1B0]() == MEMORY[0x1E4F145A8])
  {
    uint64_t v15 = *(void *)(*(void *)(a1 + 32) + 16);
    int64_t int64 = 5;
    uint64_t v28 = stringForMAPurgeResult(5uLL);
    _MobileAssetLog(0, 6, (uint64_t)"-[MAAsset purgeWithError:]_block_invoke_2", @"Error on the purge asset reply for %@, response: %ld (%@) due to XPC_TYPE_ERROR", v16, v17, v18, v19, v15);

    uint64_t v9 = errorStringForMAPurgeResult(5);
    MAError(@"com.apple.MobileAssetError.Purge", 5, @"%@", v20, v21, v22, v23, v24, (uint64_t)v9);
    goto LABEL_5;
  }
  int64_t int64 = xpc_dictionary_get_int64(xdict, "Result");
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 16);
  uint64_t v27 = stringForMAPurgeResult(int64);
  _MobileAssetLog(0, 6, (uint64_t)"-[MAAsset purgeWithError:]_block_invoke_2", @"Got the purge asset reply for %@, response: %ld (%@)", v5, v6, v7, v8, v4);

  if (int64)
  {
    uint64_t v9 = errorStringForMAPurgeResult(int64);
    MAError(@"com.apple.MobileAssetError.Purge", int64, @"%@", v10, v11, v12, v13, v14, (uint64_t)v9);
    uint64_t v25 = LABEL_5:;

    goto LABEL_7;
  }
  uint64_t v25 = 0;
LABEL_7:
  uint64_t v26 = *(void *)(a1 + 40);
  if (v26) {
    (*(void (**)(uint64_t, int64_t, void *))(v26 + 16))(v26, int64, v25);
  }
}

- (int64_t)purgeSync
{
  if (self->_state == 5) {
    return 7;
  }
  xpc_object_t v4 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v4, "AssetType", [(NSString *)self->_assetType UTF8String]);
  xpc_dictionary_set_string(v4, "AssetId", [(NSString *)self->_assetId UTF8String]);
  purpose = self->_purpose;
  if (purpose) {
    xpc_dictionary_set_string(v4, "Purpose", [(NSString *)purpose UTF8String]);
  }
  xpc_dictionary_set_uint64(v4, "messageAction", 5uLL);
  xpc_dictionary_set_uint64(v4, "assetState", self->_state);
  objc_msgSend(NSString, "stringWithFormat:", @"%s", getprogname());
  id v6 = objc_claimAutoreleasedReturnValue();
  xpc_dictionary_set_string(v4, "clientName", (const char *)[v6 UTF8String]);
  unint64_t v29 = 5;
  uint64_t v15 = _getCommsManager(v7, v8, v9, v10, v11, v12, v13, v14);
  uint64_t v16 = [NSString stringWithUTF8String:"-[MAAsset purgeSync]"];
  id v17 = (id)[v15 sendSync:v4 gettingResponseCode:&v29 codeForXpcError:5 loggingName:v16];

  uint64_t v2 = v29;
  uint64_t v28 = stringForMAPurgeResult(v29);
  _MobileAssetLog(0, 6, (uint64_t)"-[MAAsset purgeSync]", @"Result from purge sync: %ld (%@)", v18, v19, v20, v21, v2);

  if (v2) {
    _MobileAssetLog(0, 6, (uint64_t)"-[MAAsset purgeSync]", @"Purge sync check failure server side", v22, v23, v24, v25, v27);
  }

  return v2;
}

+ (void)cancelCatalogDownload:(id)a3 withPurpose:(id)a4 then:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  uint64_t v10 = (void *)MEMORY[0x1B3EAACB0]();
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __50__MAAsset_cancelCatalogDownload_withPurpose_then___block_invoke;
  v13[3] = &unk_1E6004E90;
  id v11 = v7;
  id v14 = v11;
  id v12 = v9;
  id v15 = v12;
  _MAsendCancelDownloadMetaData(v11, (uint64_t)v8, v13);
}

void __50__MAAsset_cancelCatalogDownload_withPurpose_then___block_invoke(uint64_t a1, void *a2)
{
  xpc_object_t xdict = a2;
  if (MEMORY[0x1B3EAB1B0]() == MEMORY[0x1E4F145A8])
  {
    _MobileAssetLog(0, 6, (uint64_t)"+[MAAsset cancelCatalogDownload:withPurpose:then:]_block_invoke", @"Error on the cancel catalog asset reply", v3, v4, v5, v6, v11);
  }
  else
  {
    xpc_dictionary_get_int64(xdict, "Result");
    _MobileAssetLog(0, 6, (uint64_t)"+[MAAsset cancelCatalogDownload:withPurpose:then:]_block_invoke", @"Got the cancel catalog reply for %@, response: %ld", v7, v8, v9, v10, *(void *)(a1 + 32));
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

+ (void)cancelCatalogDownload:(id)a3 then:(id)a4
{
}

- (void)cancelDownload:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)MEMORY[0x1B3EAACB0]();
  _MobileAssetLog(0, 6, (uint64_t)"-[MAAsset cancelDownload:]", @"the current state is: %ld", v6, v7, v8, v9, self->_state);
  if ((unint64_t)(self->_state - 5) > 1)
  {
    assetType = self->_assetType;
    assetId = self->_assetId;
    purpose = self->_purpose;
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __26__MAAsset_cancelDownload___block_invoke_2;
    v15[3] = &unk_1E6004E90;
    v15[4] = self;
    id v16 = v4;
    _MAsendCancelDownload(assetType, assetId, purpose, v15);
    uint64_t v11 = v16;
  }
  else
  {
    uint64_t v10 = _getClientCallbackQueue();
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __26__MAAsset_cancelDownload___block_invoke;
    block[3] = &unk_1E60042B8;
    void block[4] = self;
    id v18 = v4;
    dispatch_async(v10, block);

    uint64_t v11 = v18;
  }
}

uint64_t __26__MAAsset_cancelDownload___block_invoke(uint64_t a1)
{
  if (*(void *)(*(void *)(a1 + 32) + 32) == 5) {
    uint64_t v1 = 6;
  }
  else {
    uint64_t v1 = 7;
  }
  return (*(uint64_t (**)(void, uint64_t))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), v1);
}

void __26__MAAsset_cancelDownload___block_invoke_2(uint64_t a1, void *a2)
{
  xpc_object_t xdict = a2;
  if (MEMORY[0x1B3EAB1B0]() == MEMORY[0x1E4F145A8])
  {
    uint64_t v10 = *(void *)(*(void *)(a1 + 32) + 16);
    uint64_t v5 = stringForMACancelDownloadResult(4uLL);
    _MobileAssetLog(0, 6, (uint64_t)"-[MAAsset cancelDownload:]_block_invoke_2", @"Error on the cancel download asset reply for %@, response: %ld (%@)", v11, v12, v13, v14, v10);
  }
  else
  {
    int64_t int64 = xpc_dictionary_get_int64(xdict, "Result");
    uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 16);
    uint64_t v5 = stringForMACancelDownloadResult(int64);
    _MobileAssetLog(0, 6, (uint64_t)"-[MAAsset cancelDownload:]_block_invoke_2", @"Got the cancel download asset reply for %@, response: %ld (%@)", v6, v7, v8, v9, v4);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (int64_t)cancelDownloadSync
{
  int64_t state = self->_state;
  if ((unint64_t)(state - 5) > 1)
  {
    xpc_object_t v5 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_string(v5, "AssetType", [(NSString *)self->_assetType UTF8String]);
    xpc_dictionary_set_string(v5, "AssetId", [(NSString *)self->_assetId UTF8String]);
    xpc_dictionary_set_uint64(v5, "messageAction", 6uLL);
    uint64_t v6 = NSString;
    uint64_t v24 = getprogname();
    id v7 = [v6 stringWithFormat:@"%s"];
    xpc_dictionary_set_string(v5, "clientName", (const char *)[v7 UTF8String]);
    uint64_t v25 = 4;
    id v16 = _getCommsManager(v8, v9, v10, v11, v12, v13, v14, v15);
    id v17 = [NSString stringWithUTF8String:"-[MAAsset cancelDownloadSync]"];
    id v18 = (id)[v16 sendSync:v5 gettingResponseCode:&v25 codeForXpcError:4 loggingName:v17];

    int64_t v3 = v25;
    if (v25) {
      _MobileAssetLog(0, 6, (uint64_t)"-[MAAsset cancelDownloadSync]", @"Cancel sync check failure server side", v19, v20, v21, v22, (uint64_t)v24);
    }
  }
  else if (state == 5)
  {
    return 6;
  }
  else
  {
    return 7;
  }
  return v3;
}

- (void)configDownload:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = (void *)MEMORY[0x1B3EAACB0]();
  assetType = self->_assetType;
  assetId = self->_assetId;
  purpose = self->_purpose;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __37__MAAsset_configDownload_completion___block_invoke;
  v13[3] = &unk_1E6004E90;
  void v13[4] = self;
  id v12 = v7;
  id v14 = v12;
  _MAsendConfigDownload(assetType, assetId, purpose, v6, v13);
}

void __37__MAAsset_configDownload_completion___block_invoke(uint64_t a1, void *a2)
{
  xpc_object_t xdict = a2;
  if (MEMORY[0x1B3EAB1B0]() == MEMORY[0x1E4F145A8])
  {
    _MobileAssetLog(0, 6, (uint64_t)"-[MAAsset configDownload:completion:]_block_invoke", @"Error on the cancel download asset reply", v3, v4, v5, v6, v14);
    int64_t int64 = 2;
  }
  else
  {
    int64_t int64 = xpc_dictionary_get_int64(xdict, "Result");
    uint64_t v8 = *(void *)(*(void *)(a1 + 32) + 16);
    uint64_t v15 = stringForMAOperationResult(int64);
    _MobileAssetLog(0, 6, (uint64_t)"-[MAAsset configDownload:completion:]_block_invoke", @"Got the config download reply for %@, response: %ld (%@)", v9, v10, v11, v12, v8);
  }
  uint64_t v13 = *(void *)(a1 + 40);
  if (v13) {
    (*(void (**)(uint64_t, int64_t))(v13 + 16))(v13, int64);
  }
}

- (int64_t)configDownloadSync:(id)a3
{
  id v4 = a3;
  xpc_object_t v5 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v5, "AssetType", [(NSString *)self->_assetType UTF8String]);
  xpc_dictionary_set_string(v5, "AssetId", [(NSString *)self->_assetId UTF8String]);
  if (isWellFormedPurpose(self->_purpose))
  {
    uint64_t v10 = [(NSString *)self->_purpose UTF8String];
    if (v10) {
      xpc_dictionary_set_string(v5, "Purpose", v10);
    }
    xpc_dictionary_set_uint64(v5, "messageAction", 0x13uLL);
    objc_msgSend(NSString, "stringWithFormat:", @"%s", getprogname());
    id v11 = objc_claimAutoreleasedReturnValue();
    xpc_dictionary_set_string(v5, "clientName", (const char *)[v11 UTF8String]);
    uint64_t v12 = [v4 encodeAsPlist];
    uint64_t v13 = addObjectToMessage(v12, v5, "downloadConfigLength", "downloadConfig");
    unint64_t v32 = 4;
    uint64_t v21 = _getCommsManager(v13, v14, v15, v16, v17, v18, v19, v20);
    uint64_t v22 = [NSString stringWithUTF8String:"-[MAAsset configDownloadSync:]"];
    id v23 = (id)[v21 sendSync:v5 gettingResponseCode:&v32 codeForXpcError:1 loggingName:v22];

    uint64_t v24 = v32;
    if (v32)
    {
      uint64_t v31 = stringForMAOperationResult(v32);
      _MobileAssetLog(0, 6, (uint64_t)"-[MAAsset configDownloadSync:]", @"Config download sync check failure server side: %lld (%@)", v25, v26, v27, v28, v24);
    }
  }
  else
  {
    _MobileAssetLog(0, 6, (uint64_t)"-[MAAsset configDownloadSync:]", @"Config download failure due to invalid purpose", v6, v7, v8, v9, v30);
    id v11 = 0;
    uint64_t v12 = 0;
    uint64_t v24 = 2;
  }

  return v24;
}

- (BOOL)overrideGarbageCollectionThreshold:(unint64_t)a3
{
  xpc_object_t v5 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v5, "AssetType", [(NSString *)self->_assetType UTF8String]);
  xpc_dictionary_set_string(v5, "AssetId", [(NSString *)self->_assetId UTF8String]);
  xpc_dictionary_set_uint64(v5, "GCOverrideDays", a3);
  xpc_dictionary_set_uint64(v5, "messageAction", 0x19uLL);
  unint64_t v29 = 4;
  uint64_t v14 = _getCommsManager(v6, v7, v8, v9, v10, v11, v12, v13);
  uint64_t v15 = [NSString stringWithUTF8String:"-[MAAsset overrideGarbageCollectionThreshold:]"];
  id v16 = (id)[v14 sendSync:v5 gettingResponseCode:&v29 codeForXpcError:1 loggingName:v15];

  uint64_t v17 = v29;
  uint64_t v28 = stringForMAOperationResult(v29);
  _MobileAssetLog(0, 6, (uint64_t)"-[MAAsset overrideGarbageCollectionThreshold:]", @"Result from overrideGarbageCollectionThreshold: %ld (%@)", v18, v19, v20, v21, v17);

  if (v17) {
    _MobileAssetLog(0, 6, (uint64_t)"-[MAAsset overrideGarbageCollectionThreshold:]", @"overrideGarbageCollectionThreshold failure server side", v22, v23, v24, v25, v27);
  }

  return v17 == 0;
}

- (BOOL)spaceCheck:(int64_t *)a3
{
  xpc_object_t v5 = xpc_dictionary_create(0, 0, 0);
  int64_t v41 = 0;
  if (determineUnarchiveSizeFromAttributes(self->_attributes, &v41))
  {
    uint64_t v10 = objc_msgSend(NSString, "stringWithFormat:", @"%lld", v41);
    uint64_t v11 = (const char *)[@"_UnarchivedSize" UTF8String];
    id v12 = v10;
    xpc_dictionary_set_string(v5, v11, (const char *)[v12 UTF8String]);
    xpc_dictionary_set_uint64(v5, "messageAction", 0x11uLL);
    objc_msgSend(NSString, "stringWithFormat:", @"%s", getprogname());
    id v13 = objc_claimAutoreleasedReturnValue();
    xpc_dictionary_set_string(v5, "clientName", (const char *)[v13 UTF8String]);
    unint64_t v40 = 4;
    uint64_t v22 = _getCommsManager(v14, v15, v16, v17, v18, v19, v20, v21);
    uint64_t v23 = [NSString stringWithUTF8String:"-[MAAsset spaceCheck:]"];
    id v24 = (id)[v22 sendSync:v5 gettingResponseCode:&v40 codeForXpcError:1 loggingName:v23];

    uint64_t v25 = v40;
    uint64_t v39 = stringForMAOperationResult(v40);
    _MobileAssetLog(0, 6, (uint64_t)"-[MAAsset spaceCheck:]", @"Result from space check: %ld (%@)", v26, v27, v28, v29, v25);

    if (v25)
    {
      _MobileAssetLog(0, 6, (uint64_t)"-[MAAsset spaceCheck:]", @"Space check failure server side", v30, v31, v32, v33, v38);
      uint64_t v34 = 1;
      if (!a3) {
        goto LABEL_9;
      }
    }
    else
    {
      uint64_t v34 = 0;
      if (!a3) {
        goto LABEL_9;
      }
    }
    goto LABEL_8;
  }
  int64_t v41 = 1000000;
  _MobileAssetLog(0, 6, (uint64_t)"-[MAAsset spaceCheck:]", @"Unable to get unarchived size for asset. Using default of %lld for non-local asset.", v6, v7, v8, v9, 1000000);
  BOOL v35 = [(MAAsset *)self wasLocal];
  id v12 = 0;
  id v13 = 0;
  uint64_t v34 = 2;
  if (v35) {
    uint64_t v34 = 0;
  }
  if (a3) {
LABEL_8:
  }
    *a3 = v41;
LABEL_9:
  BOOL v36 = v34 == 0;

  return v36;
}

- (BOOL)refreshState
{
  xpc_object_t v3 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v3, "AssetType", [(NSString *)self->_assetType UTF8String]);
  xpc_dictionary_set_string(v3, "AssetId", [(NSString *)self->_assetId UTF8String]);
  xpc_dictionary_set_uint64(v3, "messageAction", 8uLL);
  objc_msgSend(NSString, "stringWithFormat:", @"%s", getprogname());
  id v4 = objc_claimAutoreleasedReturnValue();
  xpc_dictionary_set_string(v3, "clientName", (const char *)[v4 UTF8String]);
  purpose = self->_purpose;
  if (purpose)
  {
    xpc_dictionary_set_string(v3, "Purpose", [(NSString *)purpose UTF8String]);
    if (self->_purpose) {
      _MobileAssetLog(0, 7, (uint64_t)"-[MAAsset refreshState]", @"Refreshing with purpose: %@", v8, v9, v10, v11, (uint64_t)self->_purpose);
    }
  }
  unint64_t v43 = 4;
  id v13 = _getCommsManager((uint64_t)purpose, v5, v6, v7, v8, v9, v10, v11);
  uint64_t v14 = [NSString stringWithUTF8String:"-[MAAsset refreshState]"];
  uint64_t v15 = [v13 sendSync:v3 gettingResponseCode:&v43 codeForXpcError:1 loggingName:v14];

  uint64_t v16 = v43;
  if (v43)
  {
    unint64_t v40 = stringForMAOperationResult(v43);
    _MobileAssetLog(0, 6, (uint64_t)"-[MAAsset refreshState]", @"State refresh failure server side: %ld (%@)", v17, v18, v19, v20, v16);
  }
  else
  {
    int64_t int64 = xpc_dictionary_get_int64(v15, "StateResult");
    if (int64)
    {
      unint64_t v23 = int64;
      int64_t state = self->_state;
      uint64_t v25 = stringForMAAssetState(state);
      int64_t v41 = stringForMAAssetState(v23);
      _MobileAssetLog(0, 6, (uint64_t)"-[MAAsset refreshState]", @"Old state: %ld (%@) --> new state: %lld (%@)", v26, v27, v28, v29, state);

      self->_int64_t state = v23;
      _MobileAssetLog(0, 7, (uint64_t)"-[MAAsset refreshState]", @"Refresh state completed with result:%ld success:%@", v30, v31, v32, v33, 0);
      BOOL v21 = 1;
      goto LABEL_9;
    }
    assetType = self->_assetType;
    id v42 = stringForMAAssetState(self->_state);
    _MobileAssetLog(0, 6, (uint64_t)"-[MAAsset refreshState]", @"Could not determine state for %@ asset %@; leaving state the same %ld (%@).",
      v36,
      v37,
      v38,
      v39,
      (uint64_t)assetType);
  }
  BOOL v21 = 0;
LABEL_9:

  return v21;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v5 = [(MAAsset *)self assetId];
    uint64_t v6 = [v4 assetId];
    char v7 = [v5 isEqualToString:v6];
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (NSDictionary)attributes
{
  return self->_attributes;
}

- (NSString)assetType
{
  return self->_assetType;
}

- (NSString)assetId
{
  return self->_assetId;
}

- (int64_t)state
{
  return self->_state;
}

- (NSString)purpose
{
  return self->_purpose;
}

@end