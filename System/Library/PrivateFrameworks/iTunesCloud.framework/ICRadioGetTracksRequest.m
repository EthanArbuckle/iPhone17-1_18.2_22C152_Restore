@interface ICRadioGetTracksRequest
- (BOOL)allowsExplicitContent;
- (BOOL)isPreservingCurrentlyPlayingItem;
- (BOOL)shouldResponseContainStationMetadata;
- (ICRadioContentReference)nowPlayingContentReference;
- (ICRadioContentReference)seedContentReference;
- (ICRadioGetTracksRequest)init;
- (ICStoreRequestContext)requestContext;
- (NSArray)queueContentReferences;
- (NSDictionary)additionalRequestParameters;
- (NSNumber)isDelegatedPrivateListeningEnabled;
- (NSNumber)isPrivateListeningEnabled;
- (NSString)stationHash;
- (NSString)stationStringID;
- (NSURL)stationURL;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)reasonType;
- (int64_t)requestedTrackCount;
- (int64_t)stationID;
- (void)performWithResponseHandler:(id)a3;
- (void)setAdditionalRequestParameters:(id)a3;
- (void)setAllowsExplicitContent:(BOOL)a3;
- (void)setDelegatedPrivateListeningEnabled:(id)a3;
- (void)setNowPlayingContentReference:(id)a3;
- (void)setPreservingCurrentlyPlayingItem:(BOOL)a3;
- (void)setPrivateListeningEnabled:(id)a3;
- (void)setQueueContentReferences:(id)a3;
- (void)setReasonType:(int64_t)a3;
- (void)setRequestContext:(id)a3;
- (void)setRequestedTrackCount:(int64_t)a3;
- (void)setSeedContentReference:(id)a3;
- (void)setShouldResponseContainStationMetadata:(BOOL)a3;
- (void)setStationHash:(id)a3;
- (void)setStationID:(int64_t)a3;
- (void)setStationStringID:(id)a3;
- (void)setStationURL:(id)a3;
@end

@implementation ICRadioGetTracksRequest

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queueContentReferences, 0);
  objc_storeStrong((id *)&self->_nowPlayingContentReference, 0);
  objc_storeStrong((id *)&self->_seedContentReference, 0);
  objc_storeStrong((id *)&self->_stationURL, 0);
  objc_storeStrong((id *)&self->_stationStringID, 0);
  objc_storeStrong((id *)&self->_stationHash, 0);
  objc_storeStrong((id *)&self->_requestContext, 0);
  objc_storeStrong((id *)&self->_delegatedPrivateListeningEnabled, 0);
  objc_storeStrong((id *)&self->_privateListeningEnabled, 0);

  objc_storeStrong((id *)&self->_additionalRequestParameters, 0);
}

- (void)setQueueContentReferences:(id)a3
{
}

- (NSArray)queueContentReferences
{
  return self->_queueContentReferences;
}

- (void)setNowPlayingContentReference:(id)a3
{
}

- (ICRadioContentReference)nowPlayingContentReference
{
  return self->_nowPlayingContentReference;
}

- (void)setSeedContentReference:(id)a3
{
}

- (ICRadioContentReference)seedContentReference
{
  return self->_seedContentReference;
}

- (void)setStationURL:(id)a3
{
}

- (NSURL)stationURL
{
  return self->_stationURL;
}

- (void)setStationStringID:(id)a3
{
}

- (NSString)stationStringID
{
  return self->_stationStringID;
}

- (void)setStationID:(int64_t)a3
{
  self->_stationID = a3;
}

- (int64_t)stationID
{
  return self->_stationID;
}

- (void)setStationHash:(id)a3
{
}

- (NSString)stationHash
{
  return self->_stationHash;
}

- (void)setRequestedTrackCount:(int64_t)a3
{
  self->_requestedTrackCount = a3;
}

- (int64_t)requestedTrackCount
{
  return self->_requestedTrackCount;
}

- (void)setShouldResponseContainStationMetadata:(BOOL)a3
{
  self->_shouldResponseContainStationMetadata = a3;
}

- (BOOL)shouldResponseContainStationMetadata
{
  return self->_shouldResponseContainStationMetadata;
}

- (void)setRequestContext:(id)a3
{
}

- (ICStoreRequestContext)requestContext
{
  return self->_requestContext;
}

- (void)setReasonType:(int64_t)a3
{
  self->_reasonType = a3;
}

- (int64_t)reasonType
{
  return self->_reasonType;
}

- (void)setDelegatedPrivateListeningEnabled:(id)a3
{
}

- (NSNumber)isDelegatedPrivateListeningEnabled
{
  return self->_delegatedPrivateListeningEnabled;
}

- (void)setPrivateListeningEnabled:(id)a3
{
}

- (NSNumber)isPrivateListeningEnabled
{
  return self->_privateListeningEnabled;
}

- (void)setPreservingCurrentlyPlayingItem:(BOOL)a3
{
  self->_preservingCurrentlyPlayingItem = a3;
}

- (BOOL)isPreservingCurrentlyPlayingItem
{
  return self->_preservingCurrentlyPlayingItem;
}

- (void)setAllowsExplicitContent:(BOOL)a3
{
  self->_allowsExplicitContent = a3;
}

- (BOOL)allowsExplicitContent
{
  return self->_allowsExplicitContent;
}

- (void)setAdditionalRequestParameters:(id)a3
{
}

- (void)performWithResponseHandler:(id)a3
{
  id v5 = a3;
  v6 = [(ICRadioGetTracksRequest *)self requestContext];
  if (!v6)
  {
    v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2 object:self file:@"ICRadioGetTracksRequest.m" lineNumber:72 description:@"Request context must not be nil."];
  }
  v7 = +[ICURLBagProvider sharedBagProvider];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __54__ICRadioGetTracksRequest_performWithResponseHandler___block_invoke;
  v11[3] = &unk_1E5ACD1D8;
  id v12 = v6;
  v13 = self;
  id v14 = v5;
  id v8 = v5;
  id v9 = v6;
  [v7 getBagForRequestContext:v9 withCompletionHandler:v11];
}

void __54__ICRadioGetTracksRequest_performWithResponseHandler___block_invoke(id *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v7 = v6;
  if (!v5 || v6)
  {
    v21 = (void (**)(id, void, id))a1[6];
    if (v21)
    {
      if (v6)
      {
        v21[2](a1[6], 0, v6);
      }
      else
      {
        v24 = [MEMORY[0x1E4F28C58] errorWithDomain:@"ICError" code:-7200 userInfo:0];
        v21[2](v21, 0, v24);
      }
    }
  }
  else
  {
    id v8 = [v5 radioConfiguration];
    id v9 = [v8 baseURL];
    v10 = [v9 URLByAppendingPathComponent:@"getTracks" isDirectory:0];
    if (v10)
    {
      v26 = v9;
      v11 = [a1[4] clientInfo];
      id v12 = [ICNetworkConstraints alloc];
      v25 = v11;
      v13 = [v11 clientBundleIdentifier];
      id v14 = [(ICNetworkConstraints *)v12 initWithBundleIdentifier:v13];

      v15 = (void *)[objc_alloc(MEMORY[0x1E4F18D50]) initWithURL:v10];
      [v15 setHTTPMethod:@"POST"];
      objc_msgSend(v15, "setAllowsCellularAccess:", -[ICNetworkConstraints shouldAllowDataForCellularNetworkTypes](v14, "shouldAllowDataForCellularNetworkTypes"));
      v16 = [[ICRadioURLRequest alloc] initWithURLRequest:v15 requestContext:a1[4]];
      [(ICRadioURLRequest *)v16 setPrivateListeningEnabled:*((void *)a1[5] + 3)];
      [(ICRadioURLRequest *)v16 setDelegatedPrivateListeningEnabled:*((void *)a1[5] + 4)];
      -[ICRadioURLRequest setProtocolVersion:](v16, "setProtocolVersion:", [v8 maxSupportedProtocolVersion]);
      [(ICURLRequest *)v16 enableLoadURLMetricsWithRequestName:@"radio/getTracks"];
      objc_initWeak(&location, a1[5]);
      v17 = +[ICMusicSubscriptionStatusController sharedStatusController];
      v18 = [a1[4] identity];
      v27[0] = MEMORY[0x1E4F143A8];
      v27[1] = 3221225472;
      v27[2] = __54__ICRadioGetTracksRequest_performWithResponseHandler___block_invoke_2;
      v27[3] = &unk_1E5AC9B30;
      v19 = v16;
      id v20 = a1[5];
      v28 = v19;
      id v29 = v20;
      objc_copyWeak(&v32, &location);
      id v30 = v8;
      id v31 = a1[6];
      [v17 getSubscriptionStatusForUserIdentity:v18 withCompletionHandler:v27];

      objc_destroyWeak(&v32);
      objc_destroyWeak(&location);

      id v9 = v26;
    }
    else
    {
      v22 = (void (**)(id, void, void *))a1[6];
      if (v22)
      {
        v23 = [MEMORY[0x1E4F28C58] errorWithDomain:@"ICError" code:-7201 userInfo:0];
        v22[2](v22, 0, v23);
      }
    }
  }
}

void __54__ICRadioGetTracksRequest_performWithResponseHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __54__ICRadioGetTracksRequest_performWithResponseHandler___block_invoke_3;
  v17[3] = &unk_1E5AC9B08;
  v7 = *(void **)(a1 + 32);
  v17[4] = *(void *)(a1 + 40);
  objc_copyWeak(&v20, (id *)(a1 + 64));
  id v18 = *(id *)(a1 + 48);
  id v8 = v5;
  id v19 = v8;
  [v7 setRadioContentDictionaryCreationBlock:v17];
  id v9 = +[ICURLSessionManager highPrioritySession];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __54__ICRadioGetTracksRequest_performWithResponseHandler___block_invoke_81;
  v13[3] = &unk_1E5ACD388;
  int8x16_t v12 = *(int8x16_t *)(a1 + 32);
  id v10 = (id)v12.i64[0];
  int8x16_t v14 = vextq_s8(v12, v12, 8uLL);
  id v11 = v6;
  id v15 = v11;
  id v16 = *(id *)(a1 + 56);
  [v9 enqueueDataRequest:v10 withCompletionHandler:v13];

  objc_destroyWeak(&v20);
}

void __54__ICRadioGetTracksRequest_performWithResponseHandler___block_invoke_3(uint64_t a1, void *a2, void *a3, void *a4)
{
  v98[1] = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id v10 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  if ([*(id *)(*(void *)(a1 + 32) + 16) count]) {
    [v10 addEntriesFromDictionary:*(void *)(*(void *)(a1 + 32) + 16)];
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  uint64_t v12 = [*(id *)(a1 + 40) getTracksDPInfoKBSyncCount];
  v13 = [v8 DSID];
  uint64_t v14 = [v13 unsignedLongLongValue];

  id v75 = v7;
  v76 = WeakRetained;
  id v74 = v9;
  if (v12 < 1)
  {
    id v16 = 0;
  }
  else
  {
    id v70 = v8;
    id v15 = 0;
    id v16 = 0;
    while (1)
    {
      v17 = v15;
      id v81 = v15;
      id v82 = 0;
      BOOL v18 = ICFairPlayCopyKeyBagSyncData(v14, 9, &v82, &v81);
      id v19 = v82;
      id v15 = v81;

      if (!v18) {
        break;
      }
      id v20 = [v19 base64EncodedStringWithOptions:0];
      if ([v20 length])
      {
        if (!v16) {
          id v16 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
        }
        [v16 addObject:v20];
      }

      if (!--v12) {
        goto LABEL_16;
      }
    }
    if (!v15)
    {
      id v15 = [MEMORY[0x1E4F28C58] errorWithDomain:@"ICError" code:-7002 userInfo:0];
    }

LABEL_16:
    v21 = v75;
    if (v15)
    {
      v22 = v9;
      (*((void (**)(id, void, id))v9 + 2))(v9, 0, v15);
      id v8 = v70;
      id WeakRetained = v76;
      goto LABEL_54;
    }
    id v8 = v70;
    id WeakRetained = v76;
  }
  if ([v16 count]) {
    [v10 setObject:v16 forKey:@"kbsyncs"];
  }
  id v23 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  uint64_t v24 = [WeakRetained stationStringID];
  unint64_t v25 = 0x1E4F28000;
  if (!v24)
  {
    v26 = [WeakRetained stationURL];
    v27 = [v26 absoluteString];
    if (v27)
    {
      [v23 setObject:v27 forKey:@"url"];
LABEL_31:

      unint64_t v25 = 0x1E4F28000uLL;
      goto LABEL_32;
    }
    uint64_t v28 = [WeakRetained stationID];
    if (v28)
    {
      id v29 = [NSNumber numberWithLongLong:v28];
      id v30 = @"station-id";
    }
    else
    {
      uint64_t v31 = [WeakRetained stationHash];
      id v32 = WeakRetained;
      id v29 = (void *)v31;
      if (!v31)
      {
        id v73 = v8;
        [v32 seedContentReference];
        v65 = v64 = v23;
        v66 = [v65 matchDictionaryWithSubscriptionStatus:*(void *)(a1 + 48)];

        id v23 = v64;
        if ([v66 count]) {
          [v64 setObject:v66 forKey:@"match"];
        }

        id v8 = v73;
        goto LABEL_30;
      }
      id v30 = @"station-hash";
    }
    [v23 setObject:v29 forKey:v30];
LABEL_30:

    id WeakRetained = v76;
    goto LABEL_31;
  }
  [v23 setObject:v24 forKey:@"radio-station-id"];
LABEL_32:
  if (*(uint64_t *)(*(void *)(a1 + 32) + 56) >= 2)
  {
    v33 = objc_msgSend(*(id *)(v25 + 3792), "numberWithInteger:");
    [v23 setObject:v33 forKey:@"count"];
  }
  v34 = (void *)v24;
  v35 = objc_msgSend(*(id *)(v25 + 3792), "numberWithBool:", objc_msgSend(WeakRetained, "allowsExplicitContent") ^ 1);
  [v23 setObject:v35 forKey:@"clean"];

  v98[0] = v23;
  v36 = [MEMORY[0x1E4F1C978] arrayWithObjects:v98 count:1];
  [v10 setObject:v36 forKey:@"station-requests"];

  [v10 setObject:&unk_1EF6409D8 forKey:@"global-version"];
  uint64_t v37 = MEMORY[0x1E4F1CC38];
  [v10 setObject:MEMORY[0x1E4F1CC38] forKey:@"include-metadata"];
  [v10 setObject:v37 forKey:@"include-asset-info"];
  if ([WeakRetained shouldResponseContainStationMetadata]) {
    [v10 setObject:MEMORY[0x1E4F1CC38] forKey:@"include-station-dict"];
  }
  v38 = [WeakRetained nowPlayingContentReference];
  v39 = [v38 matchDictionaryWithSubscriptionStatus:*(void *)(a1 + 48)];

  if ([v39 count]) {
    [v10 setObject:v39 forKey:@"now-playing-match"];
  }
  v69 = v39;
  uint64_t v40 = [WeakRetained reasonType];
  v41 = v34;
  v21 = v75;
  if (v40)
  {
    uint64_t v42 = v40;
    if (v40 == 6)
    {
      v67 = v41;
      id v68 = v23;
      id v71 = v8;
      v43 = [WeakRetained queueContentReferences];
      v44 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v43, "count"));
      long long v77 = 0u;
      long long v78 = 0u;
      long long v79 = 0u;
      long long v80 = 0u;
      id v45 = v43;
      uint64_t v46 = [v45 countByEnumeratingWithState:&v77 objects:v97 count:16];
      if (v46)
      {
        uint64_t v47 = v46;
        uint64_t v48 = *(void *)v78;
        do
        {
          for (uint64_t i = 0; i != v47; ++i)
          {
            if (*(void *)v78 != v48) {
              objc_enumerationMutation(v45);
            }
            v50 = [*(id *)(*((void *)&v77 + 1) + 8 * i) rawContentDictionaryWithSubscriptionStatus:*(void *)(a1 + 48)];
            if ([v50 count]) {
              [v44 addObject:v50];
            }
          }
          uint64_t v47 = [v45 countByEnumeratingWithState:&v77 objects:v97 count:16];
        }
        while (v47);
      }

      v95 = @"queue";
      v96 = v44;
      v51 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v96 forKeys:&v95 count:1];
      [v10 setObject:v51 forKeyedSubscript:@"playback-context"];

      v21 = v75;
      id WeakRetained = v76;
      id v8 = v71;
      v41 = v67;
      id v23 = v68;
      unint64_t v25 = 0x1E4F28000uLL;
    }
    v52 = [*(id *)(v25 + 3792) numberWithInteger:v42];
    [v10 setObject:v52 forKey:@"reason-type"];
  }
  v53 = objc_msgSend(*(id *)(v25 + 3792), "numberWithBool:", objc_msgSend(WeakRetained, "isPreservingCurrentlyPlayingItem"));
  [v10 setObject:v53 forKey:@"will-continue-playback"];

  v54 = os_log_create("com.apple.amp.iTunesCloud", "Default_Oversize");
  if (os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
  {
    v72 = [WeakRetained isPrivateListeningEnabled];
    int v55 = [v72 BOOLValue];
    v56 = [v76 isDelegatedPrivateListeningEnabled];
    id v57 = v8;
    id v58 = v10;
    v59 = v41;
    v60 = v21;
    id v61 = v23;
    int v62 = [v56 BOOLValue];
    int v63 = [v76 allowsExplicitContent];
    *(_DWORD *)buf = 134219266;
    v84 = v76;
    __int16 v85 = 1024;
    int v86 = v55;
    id WeakRetained = v76;
    __int16 v87 = 1024;
    int v88 = v62;
    id v23 = v61;
    v21 = v60;
    v41 = v59;
    id v10 = v58;
    id v8 = v57;
    __int16 v89 = 1024;
    int v90 = v63;
    __int16 v91 = 2114;
    id v92 = v23;
    __int16 v93 = 2114;
    id v94 = v10;
    _os_log_impl(&dword_1A2D01000, v54, OS_LOG_TYPE_DEFAULT, "<ICRadioGetTracksRequest %p> Configured ICRadioURLRequest. privateListeningEnabled=%{BOOL}u delegatedPrivateListeningEnabled=%{BOOL}u allowsExplicitContent=%{BOOL}u stationDictionary=%{public}@ contentDictionary=%{public}@", buf, 0x32u);
  }
  v22 = v74;
  (*((void (**)(id, id, void))v74 + 2))(v74, v10, 0);

  id v15 = 0;
LABEL_54:
}

void __54__ICRadioGetTracksRequest_performWithResponseHandler___block_invoke_81(uint64_t a1, void *a2, void *a3)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = *(id *)(a1 + 32);
  id v8 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = *(void *)(a1 + 32);
    uint64_t v10 = *(void *)(a1 + 40);
    uint64_t v11 = *(void *)(a1 + 48);
    *(_DWORD *)buf = 134218498;
    uint64_t v18 = v9;
    __int16 v19 = 2114;
    uint64_t v20 = v10;
    __int16 v21 = 2114;
    uint64_t v22 = v11;
    _os_log_impl(&dword_1A2D01000, v8, OS_LOG_TYPE_DEFAULT, "<ICRadioGetTracksRequest %p> Received response for %{public}@ error=%{public}@", buf, 0x20u);
  }

  if (v5 && !v6)
  {
    uint64_t v12 = [v5 statusCode];
    if (v12 < 400)
    {
      uint64_t v14 = [(ICRadioResponse *)[ICRadioGetTracksResponse alloc] initWithURLResponse:v5];
      v13 = 0;
    }
    else
    {
      v13 = objc_msgSend(MEMORY[0x1E4F28C58], "msv_errorWithDomain:code:debugDescription:", @"ICError", -7101, @"httpStatusCode=%ld", v12);
      uint64_t v14 = 0;
    }
    uint64_t v16 = *(void *)(a1 + 56);
    if (v16) {
      (*(void (**)(uint64_t, ICRadioGetTracksResponse *, void *))(v16 + 16))(v16, v14, v13);
    }

    goto LABEL_14;
  }
  uint64_t v15 = *(void *)(a1 + 56);
  if (v15)
  {
    if (!v6)
    {
      uint64_t v14 = [MEMORY[0x1E4F28C58] errorWithDomain:@"ICError" code:-7102 userInfo:0];
      (*(void (**)(uint64_t, void, ICRadioGetTracksResponse *))(v15 + 16))(v15, 0, v14);
LABEL_14:

      goto LABEL_15;
    }
    (*(void (**)(uint64_t, void, id))(v15 + 16))(v15, 0, v6);
  }
LABEL_15:
}

- (NSDictionary)additionalRequestParameters
{
  if (self->_additionalRequestParameters) {
    return self->_additionalRequestParameters;
  }
  else {
    return (NSDictionary *)MEMORY[0x1E4F1CC08];
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  if (v5)
  {
    uint64_t v6 = [(NSDictionary *)self->_additionalRequestParameters copyWithZone:a3];
    id v7 = *(void **)(v5 + 16);
    *(void *)(v5 + 16) = v6;

    *(unsigned char *)(v5 + 8) = self->_allowsExplicitContent;
    uint64_t v8 = [(NSNumber *)self->_delegatedPrivateListeningEnabled copyWithZone:a3];
    uint64_t v9 = *(void **)(v5 + 32);
    *(void *)(v5 + 32) = v8;

    uint64_t v10 = [(NSNumber *)self->_privateListeningEnabled copyWithZone:a3];
    uint64_t v11 = *(void **)(v5 + 24);
    *(void *)(v5 + 24) = v10;

    id v12 = [(ICRadioContentReference *)self->_nowPlayingContentReference copyWithZone:a3];
    v13 = *(void **)(v5 + 104);
    *(void *)(v5 + 104) = v12;

    *(unsigned char *)(v5 + 9) = self->_preservingCurrentlyPlayingItem;
    *(void *)(v5 + 40) = self->_reasonType;
    objc_storeStrong((id *)(v5 + 48), self->_requestContext);
    id v14 = [(ICRadioContentReference *)self->_seedContentReference copyWithZone:a3];
    uint64_t v15 = *(void **)(v5 + 96);
    *(void *)(v5 + 96) = v14;

    *(unsigned char *)(v5 + 10) = self->_shouldResponseContainStationMetadata;
    *(void *)(v5 + 56) = self->_requestedTrackCount;
    objc_storeStrong((id *)(v5 + 80), self->_stationStringID);
    objc_storeStrong((id *)(v5 + 88), self->_stationURL);
    objc_storeStrong((id *)(v5 + 64), self->_stationHash);
    *(void *)(v5 + 72) = self->_stationID;
    uint64_t v16 = [(NSArray *)self->_queueContentReferences copyWithZone:a3];
    v17 = *(void **)(v5 + 112);
    *(void *)(v5 + 112) = v16;
  }
  return (id)v5;
}

- (ICRadioGetTracksRequest)init
{
  v3.receiver = self;
  v3.super_class = (Class)ICRadioGetTracksRequest;
  result = [(ICRadioGetTracksRequest *)&v3 init];
  if (result) {
    result->_allowsExplicitContent = 1;
  }
  return result;
}

@end