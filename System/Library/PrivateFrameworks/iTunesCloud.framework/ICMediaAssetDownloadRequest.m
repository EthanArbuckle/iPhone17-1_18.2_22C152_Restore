@interface ICMediaAssetDownloadRequest
- (BOOL)allowDownloadOnConstrainedNetworks;
- (BOOL)allowsCellularData;
- (BOOL)allowsCellularFallback;
- (BOOL)allowsProxyCellularData;
- (BOOL)isDiscretionary;
- (BOOL)prefersHLSAsset;
- (BOOL)prefersLossless;
- (BOOL)prefersMultichannel;
- (BOOL)requiresPower;
- (ICMediaAssetDownloadRequest)initWithRequestContext:(id)a3 storeMediaResponseItem:(id)a4 resumeData:(id)a5;
- (NSData)resumeData;
- (NSNumber)maximumSampleRate;
- (NSNumber)minimumBitrate;
- (NSURL)destinationURL;
- (id)_createAVAssetDownloadOptionsDictionary;
- (id)_mediaKindFromResponseItemMetadata:(id)a3;
- (id)_sessionIdentifier;
- (void)cancel;
- (void)contentKeySession:(id)a3 didFinishProcessingKey:(id)a4 withResponse:(id)a5 error:(id)a6;
- (void)execute;
- (void)finishWithError:(id)a3;
- (void)performRequestWithResponseHandler:(id)a3;
- (void)setAllowDownloadOnConstrainedNetworks:(BOOL)a3;
- (void)setAllowsCellularData:(BOOL)a3;
- (void)setAllowsCellularFallback:(BOOL)a3;
- (void)setAllowsProxyCellularData:(BOOL)a3;
- (void)setDestinationURL:(id)a3;
- (void)setDiscretionary:(BOOL)a3;
- (void)setMaximumSampleRate:(id)a3;
- (void)setMinimumBitrate:(id)a3;
- (void)setPrefersHLSAsset:(BOOL)a3;
- (void)setPrefersLossless:(BOOL)a3;
- (void)setPrefersMultichannel:(BOOL)a3;
- (void)setRequiresPower:(BOOL)a3;
- (void)setResumeData:(id)a3;
- (void)setValue:(id)a3 forHTTPHeaderField:(id)a4;
@end

@implementation ICMediaAssetDownloadRequest

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_maximumSampleRate, 0);
  objc_storeStrong((id *)&self->_minimumBitrate, 0);
  objc_storeStrong((id *)&self->_resumeData, 0);
  objc_storeStrong((id *)&self->_destinationURL, 0);
  objc_storeStrong((id *)&self->_keyDeliveryError, 0);
  objc_storeStrong((id *)&self->_contentKeySession, 0);
  objc_storeStrong((id *)&self->_response, 0);
  objc_storeStrong((id *)&self->_request, 0);
  objc_storeStrong((id *)&self->_downloadSession, 0);
  objc_storeStrong((id *)&self->_additionalHTTPHeaderFields, 0);
  objc_storeStrong((id *)&self->_storeMediaResponseItem, 0);

  objc_storeStrong((id *)&self->_requestContext, 0);
}

- (void)setPrefersMultichannel:(BOOL)a3
{
  self->_prefersMultichannel = a3;
}

- (BOOL)prefersMultichannel
{
  return self->_prefersMultichannel;
}

- (void)setPrefersLossless:(BOOL)a3
{
  self->_prefersLossless = a3;
}

- (BOOL)prefersLossless
{
  return self->_prefersLossless;
}

- (void)setMaximumSampleRate:(id)a3
{
}

- (NSNumber)maximumSampleRate
{
  return self->_maximumSampleRate;
}

- (void)setMinimumBitrate:(id)a3
{
}

- (NSNumber)minimumBitrate
{
  return self->_minimumBitrate;
}

- (void)setResumeData:(id)a3
{
}

- (NSData)resumeData
{
  return self->_resumeData;
}

- (void)setPrefersHLSAsset:(BOOL)a3
{
  self->_prefersHLSAsset = a3;
}

- (BOOL)prefersHLSAsset
{
  return self->_prefersHLSAsset;
}

- (void)setRequiresPower:(BOOL)a3
{
  self->_requiresPower = a3;
}

- (BOOL)requiresPower
{
  return self->_requiresPower;
}

- (void)setDiscretionary:(BOOL)a3
{
  self->_discretionary = a3;
}

- (BOOL)isDiscretionary
{
  return self->_discretionary;
}

- (void)setAllowDownloadOnConstrainedNetworks:(BOOL)a3
{
  self->_allowDownloadOnConstrainedNetworks = a3;
}

- (BOOL)allowDownloadOnConstrainedNetworks
{
  return self->_allowDownloadOnConstrainedNetworks;
}

- (void)setAllowsCellularFallback:(BOOL)a3
{
  self->_allowsCellularFallback = a3;
}

- (BOOL)allowsCellularFallback
{
  return self->_allowsCellularFallback;
}

- (void)setAllowsProxyCellularData:(BOOL)a3
{
  self->_allowsProxyCellularData = a3;
}

- (BOOL)allowsProxyCellularData
{
  return self->_allowsProxyCellularData;
}

- (void)setAllowsCellularData:(BOOL)a3
{
  self->_allowsCellularData = a3;
}

- (BOOL)allowsCellularData
{
  return self->_allowsCellularData;
}

- (void)setDestinationURL:(id)a3
{
}

- (NSURL)destinationURL
{
  return self->_destinationURL;
}

- (id)_mediaKindFromResponseItemMetadata:(id)a3
{
  uint64_t v3 = _mediaKindFromResponseItemMetadata__sOnceToken;
  id v4 = a3;
  if (v3 != -1) {
    dispatch_once(&_mediaKindFromResponseItemMetadata__sOnceToken, &__block_literal_global_3675);
  }
  v5 = (void *)_mediaKindFromResponseItemMetadata__sDownloadMediaTypeToAVMediaKind;
  v6 = [v4 kind];

  v7 = [v5 objectForKey:v6];

  return v7;
}

void __66__ICMediaAssetDownloadRequest__mediaKindFromResponseItemMetadata___block_invoke()
{
  v3[4] = *MEMORY[0x1E4F143B8];
  v2[0] = @"song";
  v2[1] = @"feature-movie";
  v3[0] = @"music";
  v3[1] = @"movie";
  v2[2] = @"music-video";
  v2[3] = @"tv-episode";
  v3[2] = @"musicvideo";
  v3[3] = @"tvshow";
  uint64_t v0 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v3 forKeys:v2 count:4];
  v1 = (void *)_mediaKindFromResponseItemMetadata__sDownloadMediaTypeToAVMediaKind;
  _mediaKindFromResponseItemMetadata__sDownloadMediaTypeToAVMediaKind = v0;
}

- (id)_createAVAssetDownloadOptionsDictionary
{
  uint64_t v60 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:10];
  id v4 = [(ICRequestContext *)self->_requestContext clientInfo];
  v5 = [v4 clientIdentifier];
  [v3 setObject:v5 forKeyedSubscript:*MEMORY[0x1E4F15630]];

  v6 = (void *)[(NSMutableDictionary *)self->_additionalHTTPHeaderFields mutableCopy];
  v7 = [(ICStoreMediaResponseItem *)self->_storeMediaResponseItem downloadableAsset];
  v8 = v7;
  if (v7)
  {
    v9 = [v7 downloadKey];

    if (v9)
    {
      v10 = NSString;
      v11 = [v8 downloadKey];
      v12 = [v10 stringWithFormat:@"downloadKey=%@", v11];
      [v6 setObject:v12 forKey:@"Cookie"];
    }
  }
  if ([v6 count]) {
    [v3 setObject:v6 forKeyedSubscript:*MEMORY[0x1E4F15638]];
  }
  if ((([(ICMediaAssetDownloadRequest *)self qualityOfService] - 25) & 0xFFFFFFFFFFFFFFF7) != 0) {
    uint64_t v13 = -1;
  }
  else {
    uint64_t v13 = 0;
  }
  v14 = [NSNumber numberWithInteger:v13];
  [v3 setObject:v14 forKeyedSubscript:*MEMORY[0x1E4F15648]];

  id v15 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v16 = [v8 md5];
  [v15 setObject:v16 forKeyedSubscript:*MEMORY[0x1E4F580B8]];

  v17 = [v8 fairPlayInfoList];
  uint64_t v18 = [v17 count];

  if (v18)
  {
    v48 = v6;
    v19 = v15;
    id v20 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v51 = 0u;
    long long v52 = 0u;
    long long v53 = 0u;
    long long v54 = 0u;
    v21 = [v8 fairPlayInfoList];
    uint64_t v22 = [v21 countByEnumeratingWithState:&v51 objects:v59 count:16];
    if (v22)
    {
      uint64_t v23 = v22;
      uint64_t v24 = *(void *)v52;
      do
      {
        for (uint64_t i = 0; i != v23; ++i)
        {
          if (*(void *)v52 != v24) {
            objc_enumerationMutation(v21);
          }
          v26 = [*(id *)(*((void *)&v51 + 1) + 8 * i) responseSinfDictionary];
          [v20 addObject:v26];
        }
        uint64_t v23 = [v21 countByEnumeratingWithState:&v51 objects:v59 count:16];
      }
      while (v23);
    }

    id v15 = v19;
    if ([v20 count]) {
      [v19 setObject:v20 forKeyedSubscript:*MEMORY[0x1E4F580D0]];
    }

    v6 = v48;
  }
  v49 = v15;
  [v3 setObject:v15 forKeyedSubscript:*MEMORY[0x1E4F15650]];
  id v27 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v28 = [(ICStoreRequestContext *)self->_requestContext identity];
  v29 = [(ICStoreRequestContext *)self->_requestContext identityStore];
  v30 = 0;
  v47 = v29;
  if (v28
    && v29
    && (id v50 = 0,
        [v29 getPropertiesForUserIdentity:v28 error:&v50],
        v30 = objc_claimAutoreleasedReturnValue(),
        (id v31 = v50) != 0))
  {
    id v32 = v31;
    v33 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    v46 = v30;
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      v56 = self;
      __int16 v57 = 2114;
      id v58 = v32;
      _os_log_impl(&dword_1A2D01000, v33, OS_LOG_TYPE_ERROR, "%{public}@ failed to load identity properties. err=%{public}@", buf, 0x16u);
    }
  }
  else
  {
    v46 = v30;
    v33 = [v30 DSID];
    [v27 setObject:v33 forKeyedSubscript:*MEMORY[0x1E4F15658]];
    id v32 = 0;
  }
  v34 = v32;

  v35 = [(ICStoreMediaResponseItem *)self->_storeMediaResponseItem redownloadParameters];
  [v27 setObject:v35 forKeyedSubscript:*MEMORY[0x1E4F15660]];

  v36 = [(ICStoreMediaResponseItem *)self->_storeMediaResponseItem metadata];
  if (!v36)
  {
    v36 = [v8 metadata];
  }
  v37 = [v36 itemCloudID];

  if (v37)
  {
    v38 = [v36 itemCloudID];
    v39 = @"match";
  }
  else
  {
    v38 = objc_msgSend(NSNumber, "numberWithLongLong:", -[ICStoreMediaResponseItem storeAdamID](self->_storeMediaResponseItem, "storeAdamID"));
    v39 = @"purchaseHistory";
  }
  [v27 setObject:v38 forKeyedSubscript:*MEMORY[0x1E4F15668]];

  [v27 setObject:v39 forKeyedSubscript:*MEMORY[0x1E4F15680]];
  if (v36)
  {
    v40 = [(ICMediaAssetDownloadRequest *)self _mediaKindFromResponseItemMetadata:v36];
    [v27 setObject:v40 forKeyedSubscript:*MEMORY[0x1E4F15678]];
  }
  v41 = [(ICStoreRequestContext *)self->_requestContext userAgent];
  [v27 setObject:v41 forKeyedSubscript:*MEMORY[0x1E4F15688]];

  [v3 setObject:v27 forKeyedSubscript:*MEMORY[0x1E4F15670]];
  if (!self->_allowsCellularData)
  {
    [v3 setObject:&unk_1EF6407F8 forKeyedSubscript:*MEMORY[0x1E4F15640]];
    [v3 setObject:MEMORY[0x1E4F1CC28] forKeyedSubscript:*MEMORY[0x1E4F15628]];
  }
  minimumBitrate = self->_minimumBitrate;
  if (minimumBitrate) {
    [v3 setObject:minimumBitrate forKeyedSubscript:*MEMORY[0x1E4F156B8]];
  }
  maximumSampleRate = self->_maximumSampleRate;
  if (maximumSampleRate) {
    [v3 setObject:maximumSampleRate forKeyedSubscript:*MEMORY[0x1E4F156A0]];
  }
  if (self->_prefersLossless) {
    [v3 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:*MEMORY[0x1E4F156C8]];
  }
  v44 = [NSNumber numberWithBool:self->_prefersMultichannel];
  [v3 setObject:v44 forKeyedSubscript:*MEMORY[0x1E4F156B0]];

  return v3;
}

- (id)_sessionIdentifier
{
  uint64_t v3 = [MEMORY[0x1E4F28E78] stringWithString:@"com.apple.iTunesCloud.ICMediaAssetDownloadRequest."];
  id v4 = [(ICRequestContext *)self->_requestContext clientInfo];
  v5 = [v4 clientIdentifier];

  if (v5)
  {
    [v3 appendString:v5];
    [v3 appendString:@"."];
  }
  v6 = [(ICRequestContext *)self->_requestContext clientInfo];
  v7 = [v6 requestingBundleIdentifier];

  if (v7)
  {
    [v3 appendString:v7];
    [v3 appendString:@"."];
  }
  if (self->_discretionary) {
    [v3 appendString:@"discretionary."];
  }
  if (self->_requiresPower) {
    [v3 appendString:@"power."];
  }
  if (!self->_allowsCellularData) {
    [v3 appendString:@"wifi."];
  }
  if (!self->_allowDownloadOnConstrainedNetworks) {
    [v3 appendString:@"failDownloadOnConstrainedNetworks."];
  }
  [v3 appendString:@"av"];

  return v3;
}

- (void)contentKeySession:(id)a3 didFinishProcessingKey:(id)a4 withResponse:(id)a5 error:(id)a6
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v9 = a6;
  if (v9)
  {
    v10 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      int v11 = 138543874;
      v12 = self;
      __int16 v13 = 2114;
      id v14 = v8;
      __int16 v15 = 2114;
      id v16 = v9;
      _os_log_impl(&dword_1A2D01000, v10, OS_LOG_TYPE_ERROR, "%{public}@ Failed to fetch key with identifier '%{public}@'. err=%{public}@", (uint8_t *)&v11, 0x20u);
    }

    objc_storeStrong((id *)&self->_keyDeliveryError, a6);
  }
}

- (void)finishWithError:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)ICMediaAssetDownloadRequest;
  [(ICRequestOperation *)&v6 finishWithError:a3];
  request = self->_request;
  self->_request = 0;

  downloadSession = self->_downloadSession;
  self->_downloadSession = 0;
}

- (void)cancel
{
  v3.receiver = self;
  v3.super_class = (Class)ICMediaAssetDownloadRequest;
  [(ICMediaAssetDownloadRequest *)&v3 cancel];
  if (self->_request) {
    -[ICURLSession cancelRequest:](self->_downloadSession, "cancelRequest:");
  }
}

- (void)setValue:(id)a3 forHTTPHeaderField:(id)a4
{
  additionalHTTPHeaderFields = self->_additionalHTTPHeaderFields;
  if (a3) {
    [(NSMutableDictionary *)additionalHTTPHeaderFields setObject:a3 forKey:a4];
  }
  else {
    [(NSMutableDictionary *)additionalHTTPHeaderFields removeObjectForKey:a4];
  }
}

- (void)execute
{
  uint64_t v101 = *MEMORY[0x1E4F143B8];
  objc_super v3 = +[ICDeviceInfo currentDeviceInfo];
  char v4 = [v3 isWatch];

  v5 = [(ICMediaAssetDownloadRequest *)self _sessionIdentifier];
  objc_super v6 = +[ICURLSessionManager sharedSessionManager];
  v91[0] = MEMORY[0x1E4F143A8];
  v91[1] = 3221225472;
  v91[2] = __38__ICMediaAssetDownloadRequest_execute__block_invoke;
  v91[3] = &unk_1E5AC74C8;
  char v94 = v4 ^ 1;
  id v7 = v5;
  id v92 = v7;
  v93 = self;
  id v8 = [v6 sessionWithIdentifier:v7 creationBlock:v91];
  downloadSession = self->_downloadSession;
  self->_downloadSession = v8;

  if (self->_downloadSession)
  {
    v10 = [(ICStoreMediaResponseItem *)self->_storeMediaResponseItem hlsAsset];
    int v11 = [v10 playlistURL];
    if (v11 && self->_prefersHLSAsset)
    {
      v12 = os_log_create("com.apple.amp.iTunesCloud", "Default");
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v98 = self;
        _os_log_impl(&dword_1A2D01000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@ An HLS asset is available and is preferred, so we will use it", buf, 0xCu);
      }

      id v13 = v11;
    }
    else
    {
      id v14 = [(ICStoreMediaResponseItem *)self->_storeMediaResponseItem downloadableAsset];
      id v13 = [v14 assetURL];

      if (!v13)
      {
        long long v51 = os_log_create("com.apple.amp.iTunesCloud", "Default");
        if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
        {
          storeMediaResponseItem = self->_storeMediaResponseItem;
          *(_DWORD *)buf = 138543618;
          v98 = self;
          __int16 v99 = 2114;
          id v100 = storeMediaResponseItem;
          _os_log_impl(&dword_1A2D01000, v51, OS_LOG_TYPE_ERROR, "%{public}@ Failed to download because the item is invalid (assetURL=nil) %{public}@", buf, 0x16u);
        }

        long long v53 = objc_msgSend(MEMORY[0x1E4F28C58], "msv_errorWithDomain:code:debugDescription:", @"ICError", -8301, @"Invalid ICStoreMediaResponseItem object (assetURL=nil)");
        [(ICMediaAssetDownloadRequest *)self finishWithError:v53];

        id v13 = 0;
        goto LABEL_38;
      }
    }
    __int16 v15 = [[ICURLRequest alloc] initWithURL:v13 requestContext:self->_requestContext resumeData:self->_resumeData];
    request = self->_request;
    self->_request = v15;

    uint64_t v17 = [(ICRequestOperation *)self progress];
    uint64_t v18 = [(ICURLRequest *)self->_request progress];
    [v17 addChild:v18 withPendingUnitCount:100];

    if (self->_destinationURL)
    {
      if (v4)
      {
LABEL_10:
        v19 = os_log_create("com.apple.amp.iTunesCloud", "Default");
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          v98 = self;
          _os_log_impl(&dword_1A2D01000, v19, OS_LOG_TYPE_DEFAULT, "%{public}@ Enqueueing standard file asset download", buf, 0xCu);
        }

        id v20 = self->_downloadSession;
        v21 = self->_request;
        destinationURL = self->_destinationURL;
        v85[0] = MEMORY[0x1E4F143A8];
        v85[1] = 3221225472;
        v85[2] = __38__ICMediaAssetDownloadRequest_execute__block_invoke_45;
        v85[3] = &unk_1E5ACD928;
        v85[4] = self;
        [(ICURLSession *)v20 enqueueDownloadRequest:v21 toDestination:destinationURL withCompletionHandler:v85];
LABEL_38:

        goto LABEL_39;
      }
    }
    else
    {
      uint64_t v24 = (void *)MEMORY[0x1E4F1CB10];
      v25 = NSTemporaryDirectory();
      [MEMORY[0x1E4F29128] UUID];
      v26 = id v83 = v7;
      [v26 UUIDString];
      id v81 = v13;
      v28 = id v27 = v11;
      v29 = [v25 stringByAppendingPathComponent:v28];
      v30 = [v24 fileURLWithPath:v29];
      id v31 = self->_destinationURL;
      self->_destinationURL = v30;

      int v11 = v27;
      id v13 = v81;

      id v7 = v83;
      if (v4) {
        goto LABEL_10;
      }
    }
    BOOL prefersHLSAsset = self->_prefersHLSAsset;
    v33 = self->_downloadSession;
    v34 = v33;
    if (prefersHLSAsset)
    {
      v77 = v11;
      v78 = v33;
      id v84 = v7;
      v35 = (void *)MEMORY[0x1E4F166C8];
      uint64_t v95 = *MEMORY[0x1E4F16170];
      v96 = &unk_1EF6407E0;
      v36 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v96 forKeys:&v95 count:1];
      id v82 = v13;
      uint64_t v37 = [v35 URLAssetWithURL:v13 options:v36];

      v38 = [MEMORY[0x1E4F28CB8] defaultManager];
      v39 = (void *)MEMORY[0x1E4F1CB10];
      v40 = NSTemporaryDirectory();
      v41 = [MEMORY[0x1E4F29128] UUID];
      v42 = [v41 UUIDString];
      v43 = [v40 stringByAppendingPathComponent:v42];
      v44 = [v39 fileURLWithPath:v43];

      id v90 = 0;
      v76 = v38;
      LOBYTE(v39) = [v38 createDirectoryAtURL:v44 withIntermediateDirectories:1 attributes:0 error:&v90];
      id v45 = v90;
      if ((v39 & 1) == 0)
      {
        v46 = os_log_create("com.apple.amp.iTunesCloud", "Default");
        if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543618;
          v98 = self;
          __int16 v99 = 2114;
          id v100 = v45;
          _os_log_impl(&dword_1A2D01000, v46, OS_LOG_TYPE_ERROR, "%{public}@ Failed to create download destination directory. This isn't fatal but may result in failure to save the playback keys. err=%{public}@", buf, 0x16u);
        }

        v47 = self->_destinationURL;
        v44 = v47;
      }
      v75 = v45;
      v80 = [v10 keyServerURL];
      uint64_t v79 = [v10 keyCertificateURL];
      v48 = [v10 keyServerProtocolType];
      v49 = v48;
      if (v48 == @"simplified") {
        uint64_t v50 = 1;
      }
      else {
        uint64_t v50 = [(__CFString *)v48 isEqual:@"simplified"];
      }

      id v58 = [ICContentKeySession alloc];
      requestContext = self->_requestContext;
      uint64_t v60 = [ICFileContentKeyStore alloc];
      v61 = [v44 path];
      v62 = [(ICFileContentKeyStore *)v60 initWithPath:v61];
      v63 = [(ICContentKeySession *)v58 initWithRequestContext:requestContext keyStore:v62 delegate:self];
      contentKeySession = self->_contentKeySession;
      self->_contentKeySession = v63;

      [(ICContentKeySession *)self->_contentKeySession setRequestOfflineKeys:1];
      [(ICContentKeySession *)self->_contentKeySession setKeyServerURL:v80];
      [(ICContentKeySession *)self->_contentKeySession setKeyServerProtocolType:v50];
      v65 = (void *)v79;
      [(ICContentKeySession *)self->_contentKeySession setKeyCertificateURL:v79];
      v66 = self->_contentKeySession;
      v67 = objc_msgSend(NSNumber, "numberWithLongLong:", -[ICStoreMediaResponseItem storeAdamID](self->_storeMediaResponseItem, "storeAdamID"));
      [(ICContentKeySession *)v66 setAdamID:v67];

      v68 = (void *)v37;
      [(ICContentKeySession *)self->_contentKeySession addAsset:v37 shouldPreloadKeys:1 waitForKeyIdentifiers:1];
      [(ICContentKeySession *)self->_contentKeySession waitForAllKeysToProcess];
      if (self->_keyDeliveryError)
      {
        -[ICMediaAssetDownloadRequest finishWithError:](self, "finishWithError:");
        int v11 = v77;
        v34 = v78;
        id v13 = v82;
        v69 = v76;
      }
      else
      {
        v70 = os_log_create("com.apple.amp.iTunesCloud", "Default");
        int v11 = v77;
        if (os_log_type_enabled(v70, OS_LOG_TYPE_DEFAULT))
        {
          v71 = self->_contentKeySession;
          *(_DWORD *)buf = 138543618;
          v98 = self;
          __int16 v99 = 2114;
          id v100 = v71;
          _os_log_impl(&dword_1A2D01000, v70, OS_LOG_TYPE_DEFAULT, "%{public}@ Enqueueing aggregate asset download using key session %{public}@", buf, 0x16u);
        }

        v72 = self->_request;
        v73 = self->_destinationURL;
        v74 = [(ICMediaAssetDownloadRequest *)self _createAVAssetDownloadOptionsDictionary];
        v87[0] = MEMORY[0x1E4F143A8];
        v87[1] = 3221225472;
        v87[2] = __38__ICMediaAssetDownloadRequest_execute__block_invoke_41;
        v87[3] = &unk_1E5AC8C90;
        v87[4] = self;
        id v88 = v44;
        v69 = v38;
        id v89 = v38;
        v34 = v78;
        [(ICURLSession *)v78 enqueueAggregateAssetDownloadRequest:v72 toDestination:v73 withAVURLAsset:v37 options:v74 completionHandler:v87];

        id v13 = v82;
        v65 = (void *)v79;
      }

      id v7 = v84;
    }
    else
    {
      long long v54 = os_log_create("com.apple.amp.iTunesCloud", "Default");
      if (os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v98 = self;
        _os_log_impl(&dword_1A2D01000, v54, OS_LOG_TYPE_DEFAULT, "%{public}@ Enqueueing AV asset download", buf, 0xCu);
      }

      v55 = self->_request;
      v56 = self->_destinationURL;
      __int16 v57 = [(ICMediaAssetDownloadRequest *)self _createAVAssetDownloadOptionsDictionary];
      v86[0] = MEMORY[0x1E4F143A8];
      v86[1] = 3221225472;
      v86[2] = __38__ICMediaAssetDownloadRequest_execute__block_invoke_44;
      v86[3] = &unk_1E5ACD928;
      v86[4] = self;
      [(ICURLSession *)v34 enqueueAVDownloadRequest:v55 toDestination:v56 withOptions:v57 completionHandler:v86];
    }
    goto LABEL_38;
  }
  uint64_t v23 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    v98 = self;
    _os_log_impl(&dword_1A2D01000, v23, OS_LOG_TYPE_ERROR, "%{public}@ Failed to create an ICURLSession instance", buf, 0xCu);
  }

  objc_msgSend(MEMORY[0x1E4F28C58], "msv_errorWithDomain:code:debugDescription:", @"ICError", -8300, @"Failed to create an ICURLSession instance");
  id v13 = (id)objc_claimAutoreleasedReturnValue();
  [(ICMediaAssetDownloadRequest *)self finishWithError:v13];
LABEL_39:
}

id __38__ICMediaAssetDownloadRequest_execute__block_invoke(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 48)) {
    [MEMORY[0x1E4F18DD0] backgroundSessionConfigurationWithIdentifier:*(void *)(a1 + 32)];
  }
  else {
  v2 = [MEMORY[0x1E4F18DD0] defaultSessionConfiguration];
  }
  [v2 setDiscretionary:*(unsigned __int8 *)(*(void *)(a1 + 40) + 372)];
  [v2 setHTTPCookieAcceptPolicy:1];
  [v2 setHTTPShouldSetCookies:0];
  [v2 setHTTPShouldUsePipelining:1];
  [v2 setRequestCachePolicy:1];
  [v2 setSessionSendsLaunchEvents:1];
  objc_msgSend(v2, "set_requiresPowerPluggedIn:", *(unsigned __int8 *)(*(void *)(a1 + 40) + 373));
  objc_super v3 = [*(id *)(*(void *)(a1 + 40) + 304) clientInfo];
  char v4 = [v3 requestingBundleIdentifier];

  if (v4)
  {
    id v5 = v4;
LABEL_7:
    objc_msgSend(v2, "set_sourceApplicationBundleIdentifier:", v5);

    goto LABEL_8;
  }
  objc_super v6 = [*(id *)(*(void *)(a1 + 40) + 304) clientInfo];
  id v5 = [v6 clientIdentifier];

  if (v5) {
    goto LABEL_7;
  }
LABEL_8:
  id v7 = [MEMORY[0x1E4F1CA60] dictionary];
  id v8 = v7;
  uint64_t v9 = *(void *)(a1 + 40);
  uint64_t v10 = MEMORY[0x1E4F1CC28];
  if (*(unsigned char *)(v9 + 370) && *(unsigned char *)(v9 + 368)) {
    uint64_t v10 = MEMORY[0x1E4F1CC38];
  }
  [v7 setObject:v10 forKey:*MEMORY[0x1E4F190A0]];
  if (!*(unsigned char *)(*(void *)(a1 + 40) + 371)) {
    [v8 setObject:MEMORY[0x1E4F1CC28] forKey:*MEMORY[0x1E4F18EE8]];
  }
  objc_msgSend(v2, "set_socketStreamProperties:", v8);
  int v11 = +[ICDeviceInfo currentDeviceInfo];
  int v12 = [v11 isWatch];

  if (!v12)
  {
    uint64_t v14 = *(unsigned __int8 *)(*(void *)(a1 + 40) + 368);
    goto LABEL_17;
  }
  objc_msgSend(v2, "set_prefersInfraWiFi:", 1);
  objc_msgSend(v2, "set_companionProxyPreference:", 2);
  uint64_t v13 = *(void *)(a1 + 40);
  if (*(unsigned char *)(v13 + 368) || !*(unsigned char *)(v13 + 369))
  {
    uint64_t v14 = *(unsigned __int8 *)(v13 + 368) != 0;
LABEL_17:
    [v2 setAllowsCellularAccess:v14];
    goto LABEL_18;
  }
  objc_msgSend(v2, "set_allowsWCA:", 0);
LABEL_18:
  __int16 v15 = off_1E5AC6348;
  if (*(unsigned char *)(a1 + 48)) {
    __int16 v15 = off_1E5AC5C78;
  }
  id v16 = (void *)[objc_alloc(*v15) initWithConfiguration:v2];

  return v16;
}

void __38__ICMediaAssetDownloadRequest_execute__block_invoke_41(id *a1, void *a2, void *a3)
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = a1[4];
    uint64_t v9 = [v5 bodyDataURL];
    *(_DWORD *)buf = 138543874;
    id v46 = v8;
    __int16 v47 = 2114;
    id v48 = v6;
    __int16 v49 = 2114;
    id v50 = v9;
    _os_log_impl(&dword_1A2D01000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ Aggregate asset download complete. err=%{public}@, destinationPath=%{public}@", buf, 0x20u);
  }
  id v10 = (id)*((void *)a1[4] + 48);
  id v11 = a1[5];
  if (v10 == v11)
  {
  }
  else
  {
    int v12 = v11;
    id v13 = v10;
    char v14 = [v13 isEqual:v12];

    if ((v14 & 1) == 0)
    {
      if (!v6)
      {
        id v36 = v5;
        id v16 = a1[5];
        id v15 = a1[6];
        uint64_t v17 = [MEMORY[0x1E4F1C978] array];
        id v43 = 0;
        uint64_t v18 = [v15 contentsOfDirectoryAtURL:v16 includingPropertiesForKeys:v17 options:0 error:&v43];
        id v19 = v43;

        long long v41 = 0u;
        long long v42 = 0u;
        long long v39 = 0u;
        long long v40 = 0u;
        id obj = v18;
        uint64_t v20 = [obj countByEnumeratingWithState:&v39 objects:v44 count:16];
        if (v20)
        {
          uint64_t v21 = v20;
          uint64_t v22 = *(void *)v40;
          do
          {
            uint64_t v23 = 0;
            uint64_t v24 = v19;
            do
            {
              if (*(void *)v40 != v22) {
                objc_enumerationMutation(obj);
              }
              v25 = *(void **)(*((void *)&v39 + 1) + 8 * v23);
              v26 = [v25 lastPathComponent];
              id v27 = [*((id *)a1[4] + 48) path];
              v28 = [v27 stringByAppendingPathComponent:v26];

              v29 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v28];
              id v30 = a1[6];
              id v38 = v24;
              LOBYTE(v25) = [v30 moveItemAtURL:v25 toURL:v29 error:&v38];
              id v19 = v38;

              if ((v25 & 1) == 0)
              {
                id v31 = os_log_create("com.apple.amp.iTunesCloud", "Default");
                if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
                {
                  id v32 = a1[4];
                  *(_DWORD *)buf = 138543874;
                  id v46 = v32;
                  __int16 v47 = 2114;
                  id v48 = v26;
                  __int16 v49 = 2114;
                  id v50 = v19;
                  _os_log_impl(&dword_1A2D01000, v31, OS_LOG_TYPE_ERROR, "%{public}@ Failed to copy key file '%{public}@'. err=%{public}@", buf, 0x20u);
                }
              }
              ++v23;
              uint64_t v24 = v19;
            }
            while (v21 != v23);
            uint64_t v21 = [obj countByEnumeratingWithState:&v39 objects:v44 count:16];
          }
          while (v21);
        }

        id v5 = v36;
        id v6 = 0;
      }
      [a1[6] removeItemAtURL:a1[5] error:0];
    }
  }
  v33 = a1[4];
  v34 = (void *)v33[43];
  v33[43] = v5;
  id v35 = v5;

  [a1[4] finishWithError:v6];
}

void __38__ICMediaAssetDownloadRequest_execute__block_invoke_44(uint64_t a1, void *a2, void *a3)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = *(void *)(a1 + 32);
    uint64_t v9 = [v5 bodyDataURL];
    int v13 = 138543874;
    uint64_t v14 = v8;
    __int16 v15 = 2114;
    id v16 = v6;
    __int16 v17 = 2114;
    uint64_t v18 = v9;
    _os_log_impl(&dword_1A2D01000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ AV asset download complete. err=%{public}@, destinationPath=%{public}@", (uint8_t *)&v13, 0x20u);
  }
  uint64_t v10 = *(void *)(a1 + 32);
  id v11 = *(void **)(v10 + 344);
  *(void *)(v10 + 344) = v5;
  id v12 = v5;

  [*(id *)(a1 + 32) finishWithError:v6];
}

void __38__ICMediaAssetDownloadRequest_execute__block_invoke_45(uint64_t a1, void *a2, void *a3)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = *(void *)(a1 + 32);
    uint64_t v9 = [v5 bodyDataURL];
    int v13 = 138543874;
    uint64_t v14 = v8;
    __int16 v15 = 2114;
    id v16 = v6;
    __int16 v17 = 2114;
    uint64_t v18 = v9;
    _os_log_impl(&dword_1A2D01000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ File asset download complete. err=%{public}@, destinationPath=%{public}@", (uint8_t *)&v13, 0x20u);
  }
  uint64_t v10 = *(void *)(a1 + 32);
  id v11 = *(void **)(v10 + 344);
  *(void *)(v10 + 344) = v5;
  id v12 = v5;

  [*(id *)(a1 + 32) finishWithError:v6];
}

- (void)performRequestWithResponseHandler:(id)a3
{
  id v4 = a3;
  id v5 = objc_msgSend(MEMORY[0x1E4F28F08], "ic_sharedRequestOperationQueueWithQualityOfService:", -[ICMediaAssetDownloadRequest qualityOfService](self, "qualityOfService"));
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __65__ICMediaAssetDownloadRequest_performRequestWithResponseHandler___block_invoke;
  v7[3] = &unk_1E5ACD8E0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [(ICRequestOperation *)self performRequestOnOperationQueue:v5 withCompletionHandler:v7];
}

void __65__ICMediaAssetDownloadRequest_performRequestWithResponseHandler___block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  uint64_t v2 = *(void *)(a1 + 32);
  objc_super v3 = *(void **)(v2 + 344);
  *(void *)(v2 + 344) = 0;

  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = *(void **)(v4 + 392);
  *(void *)(v4 + 392) = 0;
}

- (ICMediaAssetDownloadRequest)initWithRequestContext:(id)a3 storeMediaResponseItem:(id)a4 resumeData:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v17.receiver = self;
  v17.super_class = (Class)ICMediaAssetDownloadRequest;
  id v12 = [(ICRequestOperation *)&v17 init];
  int v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_requestContext, a3);
    v13->_allowsCellularData = 1;
    v13->_allowsProxyCellularData = 1;
    v13->_allowsCellularFallback = 1;
    v13->_allowDownloadOnConstrainedNetworks = 1;
    objc_storeStrong((id *)&v13->_storeMediaResponseItem, a4);
    v13->_discretionary = 0;
    v13->_BOOL prefersHLSAsset = 0;
    objc_storeStrong((id *)&v13->_resumeData, a5);
    uint64_t v14 = [MEMORY[0x1E4F1CA60] dictionary];
    additionalHTTPHeaderFields = v13->_additionalHTTPHeaderFields;
    v13->_additionalHTTPHeaderFields = (NSMutableDictionary *)v14;
  }
  return v13;
}

@end