@interface WLKContinueWatchingRequestOperation
+ (void)donateMediaItems:(id)a3;
- (WLKContinueWatchingRequestOperation)init;
- (WLKContinueWatchingRequestOperation)initWithCaller:(id)a3 options:(int64_t)a4;
- (WLKContinueWatchingRequestOperation)initWithQueryParameters:(id)a3;
- (WLKContinueWatchingResponse)response;
- (void)processResponse;
- (void)setResponse:(id)a3;
@end

@implementation WLKContinueWatchingRequestOperation

- (WLKContinueWatchingRequestOperation)init
{
  return [(WLKContinueWatchingRequestOperation *)self initWithQueryParameters:0];
}

- (WLKContinueWatchingRequestOperation)initWithCaller:(id)a3 options:(int64_t)a4
{
  return -[WLKContinueWatchingRequestOperation initWithQueryParameters:](self, "initWithQueryParameters:", 0, a4);
}

- (WLKContinueWatchingRequestOperation)initWithQueryParameters:(id)a3
{
  id v4 = a3;
  if (WLKIsTVApp()) {
    uint64_t v5 = 0;
  }
  else {
    uint64_t v5 = WLKIsTool() ^ 1;
  }
  v6 = [NSNumber numberWithDouble:15.0];
  v7 = +[WLKURLRequestProperties requestPropertiesWithEndpoint:@"shelves/uts.col.UpNext" queryParameters:v4 httpMethod:0 headers:0 caller:0 timeout:v6 apiVersion:&unk_1F13D9818 options:v5];

  v10.receiver = self;
  v10.super_class = (Class)WLKContinueWatchingRequestOperation;
  v8 = [(WLKUTSNetworkRequestOperation *)&v10 initWithRequestProperties:v7];

  return v8;
}

- (void)processResponse
{
  objc_super v10 = objc_alloc_init(WLKDictionaryResponseProcessor);
  [(WLKDictionaryResponseProcessor *)v10 setObjectClass:objc_opt_class()];
  v3 = [(WLKNetworkRequestOperation *)self data];
  id v4 = [(WLKDictionaryResponseProcessor *)v10 processResponseData:v3 error:0];
  [(WLKContinueWatchingRequestOperation *)self setResponse:v4];

  uint64_t v5 = [(WLKUTSNetworkRequestOperation *)self requestProperties];
  v6 = [v5 queryParameters];

  if (![v6 count] && WLKIsTVApp())
  {
    if ([(WLKNetworkRequestOperation *)self resourceFetchType] == 1)
    {
      v7 = [MEMORY[0x1E4F28C40] defaultCenter];
      [v7 postNotificationName:@"WLKContinueWatchingRequestDidCompleteNotification" object:0];
    }
    v8 = objc_opt_class();
    v9 = [(WLKContinueWatchingResponse *)self->_response items];
    [v8 donateMediaItems:v9];
  }
}

+ (void)donateMediaItems:(id)a3
{
  uint64_t v127 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v92 = objc_alloc_init(MEMORY[0x1E4F1CA70]);
  MGGetFloat32Answer();
  float v5 = v4;
  v6 = WLKSiriActionsLogObject();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v3, "count"));
    *(_DWORD *)buf = 138412290;
    id v123 = v7;
    _os_log_impl(&dword_1BA2E8000, v6, OS_LOG_TYPE_DEFAULT, "WLKContinueWatchingResponse - UpNext items: %@", buf, 0xCu);
  }
  long long v118 = 0u;
  long long v119 = 0u;
  long long v116 = 0u;
  long long v117 = 0u;
  id obj = v3;
  uint64_t v8 = [obj countByEnumeratingWithState:&v116 objects:v126 count:16];
  if (v8)
  {
    double v9 = v5 * 60.0;
    uint64_t v102 = *(void *)v117;
    do
    {
      uint64_t v10 = 0;
      uint64_t v103 = v8;
      do
      {
        if (*(void *)v117 != v102) {
          objc_enumerationMutation(obj);
        }
        v110 = *(void **)(*((void *)&v116 + 1) + 8 * v10);
        v11 = [v110 movieOrShowContent];
        uint64_t v12 = [v11 contentType];
        v13 = [v11 canonicalID];
        v14 = [v11 title];
        v15 = [v11 images];
        v16 = [v15 artworkVariantOfType:26];
        v17 = v16;
        if (v16)
        {
          id v18 = v16;
        }
        else
        {
          [v11 images];
          uint64_t v107 = v10;
          v19 = v11;
          v20 = v14;
          v22 = v21 = v13;
          id v18 = [v22 artworkVariantOfType:4];

          v13 = v21;
          v14 = v20;
          v11 = v19;
          uint64_t v10 = v107;
        }

        if (v12 != 1)
        {
          if (v12 == 4)
          {
            objc_opt_class();
            id v108 = v18;
            v109 = v14;
            if (objc_opt_isKindOfClass())
            {
              id v23 = v11;
              v28 = [v23 images];
              v29 = [v28 artworkVariantOfType:26];
              v30 = v29;
              if (v29)
              {
                id v27 = v29;
              }
              else
              {
                [v23 images];
                v48 = v47 = v13;
                id v27 = [v48 artworkVariantOfType:17];

                v13 = v47;
              }

              v39 = [v23 canonicalShowID];
              v40 = [v23 showTitle];
              uint64_t v43 = 13;
              goto LABEL_28;
            }
            id v27 = 0;
            v40 = 0;
            v39 = 0;
            uint64_t v43 = 13;
          }
          else
          {
            if (v12 != 2) {
              goto LABEL_62;
            }
            id v108 = v18;
            id v23 = [v110 movieOrShowContent];
            v24 = [v23 images];
            v25 = [v24 artworkVariantOfType:26];
            v26 = v25;
            v109 = v14;
            if (v25)
            {
              id v27 = v25;
            }
            else
            {
              [v110 movieOrShowContent];
              v44 = v105 = v13;
              v45 = [v44 images];
              uint64_t v46 = [v45 artworkVariantOfType:4];

              id v27 = (id)v46;
              v13 = v105;
            }

            v40 = 0;
            v39 = 0;
            uint64_t v43 = 12;
LABEL_28:
          }
          if (![v39 length] || !objc_msgSend(v40, "length"))
          {
            v60 = WLKSiriActionsLogObject();
            if (os_log_type_enabled(v60, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412546;
              id v123 = v39;
              __int16 v124 = 2112;
              v125 = v40;
              _os_log_impl(&dword_1BA2E8000, v60, OS_LOG_TYPE_DEFAULT, "WLKContinueWatchingResponse - Skipping donation, missing media container info. mediaContainerCanonicalId: %@, mediaContainerItemTitle: %@", buf, 0x16u);
            }
            goto LABEL_61;
          }
          v104 = v13;
          [v27 artworkSize];
          double v50 = v49;
          [v27 artworkSize];
          double v52 = v50 / v51;
          v53 = (void *)MEMORY[0x1E4F304C0];
          id v101 = v27;
          objc_msgSend(v27, "artworkURLForSize:format:", @"jpg", v9, v9 * v52);
          uint64_t v54 = v43;
          v55 = v40;
          v57 = v56 = v39;
          v37 = [v53 imageWithURL:v57 width:60.0 height:v52 * 60.0];

          v39 = v56;
          v40 = v55;
          uint64_t v41 = [objc_alloc(MEMORY[0x1E4F30540]) initWithIdentifier:v39 title:v55 type:v54 artwork:v37];
          char v42 = 0;
          uint64_t v38 = 0;
          goto LABEL_32;
        }
        v104 = v13;
        id v108 = v18;
        v109 = v14;
        if (![v13 length] || !objc_msgSend(v14, "length"))
        {
          v39 = 0;
          v40 = 0;
          id v101 = 0;
          uint64_t v38 = 0;
          uint64_t v41 = 0;
          char v42 = 1;
          goto LABEL_33;
        }
        [v18 artworkSize];
        double v32 = v31;
        [v18 artworkSize];
        double v34 = v32 / v33;
        v35 = (void *)MEMORY[0x1E4F304C0];
        v36 = objc_msgSend(v18, "artworkURLForSize:format:", @"jpg", v9, v9 * v34);
        v37 = [v35 imageWithURL:v36 width:60.0 height:v34 * 60.0];

        uint64_t v38 = [objc_alloc(MEMORY[0x1E4F30540]) initWithIdentifier:v13 title:v14 type:11 artwork:v37];
        v39 = 0;
        v40 = 0;
        id v101 = 0;
        uint64_t v41 = 0;
        char v42 = 1;
LABEL_32:

LABEL_33:
        v106 = v41;
        v100 = (void *)v38;
        if (!(v38 | v41))
        {
          v61 = WLKSiriActionsLogObject();
          v13 = v104;
          if (os_log_type_enabled(v61, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            id v123 = v110;
            _os_log_impl(&dword_1BA2E8000, v61, OS_LOG_TYPE_DEFAULT, "WLKContinueWatchingResponse - Skipping donation, no mediaItem or container %@", buf, 0xCu);
          }
          v60 = v106;
          id v27 = v101;
          goto LABEL_60;
        }
        v99 = v11;
        char v58 = v42 ^ 1;
        if (!v38) {
          char v58 = 1;
        }
        v94 = v39;
        if (v58)
        {
          uint64_t v59 = 0;
        }
        else
        {
          uint64_t v121 = v38;
          uint64_t v59 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v121 count:1];
        }
        v96 = v40;
        id v62 = objc_alloc(MEMORY[0x1E4F305C8]);
        v63 = [v110 playable];
        v64 = [v63 playEvent];
        if (v64) {
          uint64_t v65 = MEMORY[0x1E4F1CC38];
        }
        else {
          uint64_t v65 = MEMORY[0x1E4F1CC28];
        }
        v95 = v59;
        v66 = (void *)[v62 initWithMediaItems:v59 mediaContainer:v106 playShuffled:MEMORY[0x1E4F1CC28] playbackRepeatMode:1 resumePlayback:v65 playbackQueueLocation:1 playbackSpeed:&unk_1F13D9830 mediaSearch:0];

        v67 = [v110 siriActionsExpirationEpochMillis];
        [v67 floatValue];
        double v69 = v68 / 1000.0;

        [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSince1970:v69];
        v93 = v98 = v66;
        objc_msgSend(v66, "setExpirationDate:");
        v70 = [v110 siriActionsCategories];
        id v71 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
        long long v112 = 0u;
        long long v113 = 0u;
        long long v114 = 0u;
        long long v115 = 0u;
        id v72 = v70;
        uint64_t v73 = [v72 countByEnumeratingWithState:&v112 objects:v120 count:16];
        if (v73)
        {
          uint64_t v74 = v73;
          uint64_t v75 = *(void *)v113;
          do
          {
            for (uint64_t i = 0; i != v74; ++i)
            {
              if (*(void *)v113 != v75) {
                objc_enumerationMutation(v72);
              }
              v77 = (void *)[objc_alloc(MEMORY[0x1E4F30750]) initWithVocabularyIdentifier:*(void *)(*((void *)&v112 + 1) + 8 * i) spokenPhrase:@"TV" pronunciationHint:@"TV"];
              [v71 addObject:v77];
            }
            uint64_t v74 = [v72 countByEnumeratingWithState:&v112 objects:v120 count:16];
          }
          while (v74);
        }

        [v98 setBuckets:v71];
        v78 = WLKTVAppBundleID();
        objc_msgSend(v98, "_setLaunchId:");
        [v98 _setExtensionBundleId:0];
        v79 = [v110 playable];
        v80 = [v79 channelDetails];
        v81 = [v80 appBundleIDs];
        v82 = [v81 firstObject];

        if (![v82 length]) {
          goto LABEL_58;
        }
        v83 = [v79 channelDetails];
        if ([v83 isiTunes])
        {

LABEL_58:
          id v85 = v78;

          v82 = v85;
          goto LABEL_59;
        }
        v84 = [v79 channelDetails];
        int v111 = [v84 isFirstParty];

        if (v111) {
          goto LABEL_58;
        }
LABEL_59:
        v39 = v94;
        [v98 setProxiedBundleIdentifier:v82];
        [v92 addObject:v98];

        v13 = v104;
        v60 = v106;
        v11 = v99;
        id v27 = v101;
        v61 = v95;
        v40 = v96;
LABEL_60:

LABEL_61:
        id v18 = v108;
        v14 = v109;
LABEL_62:

        ++v10;
      }
      while (v10 != v103);
      uint64_t v8 = [obj countByEnumeratingWithState:&v116 objects:v126 count:16];
    }
    while (v8);
  }

  v86 = [MEMORY[0x1E4F30810] sharedManager];
  [v86 setPredictionMode:1 forType:12];

  v87 = [MEMORY[0x1E4F30810] sharedManager];
  [v87 setPredictionMode:1 forType:13];

  v88 = [MEMORY[0x1E4F30810] sharedManager];
  [v88 setPredictionMode:1 forType:11];

  v89 = [MEMORY[0x1E4F30810] sharedManager];
  v90 = (void *)[v92 copy];
  [v89 setSuggestedMediaIntents:v90];

  v91 = WLKSiriActionsLogObject();
  if (os_log_type_enabled(v91, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v123 = v92;
    _os_log_impl(&dword_1BA2E8000, v91, OS_LOG_TYPE_DEFAULT, "WLKContinueWatchingResponse - Donated media intents: %@", buf, 0xCu);
  }
}

- (WLKContinueWatchingResponse)response
{
  return self->_response;
}

- (void)setResponse:(id)a3
{
}

- (void).cxx_destruct
{
}

@end