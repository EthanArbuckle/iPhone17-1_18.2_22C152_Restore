@interface VUIStoreAuxMediaItem
+ (NSString)mediaUserAgent;
+ (void)initialize;
- (BOOL)disableResumeMenu;
- (BOOL)disableScrubbing;
- (BOOL)hasTrait:(id)a3;
- (BOOL)ignoreExistingOfflineKeyData;
- (BOOL)ignoreStartOverParam;
- (BOOL)isAudioOnly;
- (BOOL)isEqualToMediaItem:(id)a3;
- (BOOL)isFamilySharingContent;
- (BOOL)isForStartingDownload;
- (BOOL)isHLS;
- (BOOL)isLiveContent;
- (BOOL)isSportingEvent;
- (BOOL)isiTunesPurchasedOrRentedContent;
- (BOOL)sendsLocationToPlaybackKeyServerWhenOptedIn;
- (BOOL)sendsMescalHeaderToPlaybackKeyServer;
- (NSDictionary)fpsAdditionalServerParams;
- (NSError)fpsKeyError;
- (NSObject)parentReportingToken;
- (NSString)bookmarkID;
- (NSURL)fpsCertificateURL;
- (NSURL)fpsKeyServerURL;
- (NSURL)streamingOverrideURLForDownload;
- (NSURL)url;
- (TVPPlayer)scrubPlayer;
- (VUIMutableBookmark)bookmark;
- (VUIStoreAuxMediaItem)initWithURL:(id)a3;
- (VUIStoreAuxMediaItem)initWithVideoManagedObject:(id)a3 isForStartingDownload:(BOOL)a4;
- (VUIStoreFPSKeyLoader)storeFPSKeyLoader;
- (VUIVideoManagedObject)videoManagedObject;
- (id)_offlineKeyDataForKeyRequest:(id)a3;
- (id)_replacementErrorForITunesPlaybackError:(id)a3;
- (id)_replacementErrorForPlaybackError:(id)a3;
- (id)_tvpRatingDomainFromUTSRatingDomain:(id)a3;
- (id)mediaItemMetadataForProperty:(id)a3;
- (id)replacementErrorForPlaybackError:(id)a3;
- (int64_t)playbackType;
- (unint64_t)playbackContext;
- (void)_scrubPlayerItemDidLoad:(id)a3;
- (void)cleanUpMediaItem;
- (void)dealloc;
- (void)loadFairPlayStreamingKeyRequests:(id)a3;
- (void)loadFairPlayStreamingKeyRequests:(id)a3 completion:(id)a4;
- (void)mediaItem:(id)a3 didChangeFromPlaybackState:(id)a4 toPlaybackState:(id)a5 updatedRate:(double)a6 player:(id)a7;
- (void)mediaItem:(id)a3 errorDidOccur:(id)a4 player:(id)a5;
- (void)prepareForLoadingWithCompletion:(id)a3;
- (void)resetReportingEventCollection;
- (void)setBookmark:(id)a3;
- (void)setBookmarkID:(id)a3;
- (void)setDisableResumeMenu:(BOOL)a3;
- (void)setDisableScrubbing:(BOOL)a3;
- (void)setFpsAdditionalServerParams:(id)a3;
- (void)setFpsCertificateURL:(id)a3;
- (void)setFpsKeyError:(id)a3;
- (void)setFpsKeyServerURL:(id)a3;
- (void)setIgnoreExistingOfflineKeyData:(BOOL)a3;
- (void)setIgnoreStartOverParam:(BOOL)a3;
- (void)setIsAudioOnly:(BOOL)a3;
- (void)setIsFamilySharingContent:(BOOL)a3;
- (void)setIsForStartingDownload:(BOOL)a3;
- (void)setIsHLS:(BOOL)a3;
- (void)setIsLiveContent:(BOOL)a3;
- (void)setIsSportingEvent:(BOOL)a3;
- (void)setIsiTunesPurchasedOrRentedContent:(BOOL)a3;
- (void)setMediaItemMetadata:(id)a3 forProperty:(id)a4;
- (void)setParentReportingToken:(id)a3;
- (void)setPlaybackContext:(unint64_t)a3;
- (void)setPlaybackType:(int64_t)a3;
- (void)setScrubPlayer:(id)a3;
- (void)setSendsLocationToPlaybackKeyServerWhenOptedIn:(BOOL)a3;
- (void)setSendsMescalHeaderToPlaybackKeyServer:(BOOL)a3;
- (void)setStoreFPSKeyLoader:(id)a3;
- (void)setStreamingOverrideURLForDownload:(id)a3;
- (void)setUrl:(id)a3;
- (void)setVideoManagedObject:(id)a3;
- (void)storeFPSKeyLoader:(id)a3 didLoadOfflineKeyData:(id)a4 forKeyRequest:(id)a5;
- (void)storeFPSKeyLoader:(id)a3 willFailWithError:(id)a4 forKeyRequest:(id)a5;
- (void)updateBookmarkWithSuggestedTime:(double)a3 forElapsedTime:(double)a4 duration:(double)a5 playbackOfMediaItemIsEnding:(BOOL)a6;
- (void)updateOfflineKeyWithIdentifier:(id)a3 updatedOfflineKeyData:(id)a4;
@end

@implementation VUIStoreAuxMediaItem

+ (void)initialize
{
  if (initialize_onceToken_11 != -1) {
    dispatch_once(&initialize_onceToken_11, &__block_literal_global_158);
  }
}

void __34__VUIStoreAuxMediaItem_initialize__block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.AppleTV.playback", "VUIStoreAuxMediaItem");
  v1 = (void *)sLogObject_23;
  sLogObject_23 = (uint64_t)v0;

  os_log_t v2 = os_log_create("com.apple.AppleTV.playback", "SecureKeyDelivery");
  v3 = (void *)sSecureKeyDeliveryLogObject_0;
  sSecureKeyDeliveryLogObject_0 = (uint64_t)v2;
}

+ (NSString)mediaUserAgent
{
  os_log_t v2 = (void *)MEMORY[0x1E4F4DE90];
  v3 = [MEMORY[0x1E4F4DDC8] currentProcess];
  v4 = [v2 userAgentForProcessInfo:v3];

  return (NSString *)v4;
}

- (VUIStoreAuxMediaItem)initWithURL:(id)a3
{
  id v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)VUIStoreAuxMediaItem;
  v5 = [(TVPBaseMediaItem *)&v22 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    url = v5->_url;
    v5->_url = (NSURL *)v6;

    v8 = [v4 pathExtension];
    if (([v8 isEqualToString:@"m3u8"] & 1) != 0
      || ([v8 isEqualToString:@"m3u"] & 1) != 0)
    {
      char v9 = 1;
    }
    else
    {
      char v9 = [v8 isEqualToString:@"movpkg"];
    }
    v5->_isHLS = v9;
    v10 = objc_msgSend(MEMORY[0x1E4F179C8], "ams_sharedAccountStore");
    v11 = objc_msgSend(v10, "ams_activeiTunesAccount");

    v12 = objc_msgSend(v11, "ams_DSID");
    v13 = objc_msgSend(v11, "ams_storefront");
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __36__VUIStoreAuxMediaItem_initWithURL___block_invoke;
    v18[3] = &unk_1E6DF45D8;
    v14 = v5;
    v19 = v14;
    id v20 = v12;
    id v21 = v13;
    id v15 = v13;
    id v16 = v12;
    [(TVPBaseMediaItem *)v14 performMediaItemMetadataTransactionWithBlock:v18];
    [(VUIStoreAuxMediaItem *)v14 resetReportingEventCollection];
  }
  return v5;
}

uint64_t __36__VUIStoreAuxMediaItem_initWithURL___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setMediaItemMetadata:*(void *)(a1 + 40) forProperty:*MEMORY[0x1E4FA9E70]];
  os_log_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 48);
  uint64_t v4 = *MEMORY[0x1E4FAA0D0];
  return [v2 setMediaItemMetadata:v3 forProperty:v4];
}

- (VUIStoreAuxMediaItem)initWithVideoManagedObject:(id)a3 isForStartingDownload:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if (!v6)
  {
    v7 = sLogObject_23;
    if (os_log_type_enabled((os_log_t)sLogObject_23, OS_LOG_TYPE_ERROR)) {
      -[VUIStoreAuxMediaItem initWithVideoManagedObject:isForStartingDownload:](v7, v8, v9, v10, v11, v12, v13, v14);
    }
  }
  uint64_t v15 = [v6 downloadState];
  if (!v4)
  {
    uint64_t v16 = v15;
    if (v15 != 1)
    {
      v17 = sLogObject_23;
      BOOL v18 = os_log_type_enabled((os_log_t)sLogObject_23, OS_LOG_TYPE_DEFAULT);
      if (v16 == 2)
      {
        if (v18)
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1E2BD7000, v17, OS_LOG_TYPE_DEFAULT, "Media item is fully downloaded.  Using file path URL", buf, 2u);
        }
        uint64_t v19 = [v6 localPlaybackURL];
        goto LABEL_21;
      }
      if (v18)
      {
        *(_WORD *)buf = 0;
        v24 = "Media item is not being used for downloading.  Using streaming URL";
        v25 = v17;
LABEL_19:
        _os_log_impl(&dword_1E2BD7000, v25, OS_LOG_TYPE_DEFAULT, v24, buf, 2u);
        goto LABEL_20;
      }
      goto LABEL_20;
    }
  }
  id v20 = sLogObject_23;
  if (os_log_type_enabled((os_log_t)sLogObject_23, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1E2BD7000, v20, OS_LOG_TYPE_DEFAULT, "Media item will start downloading or is already being downloaded", buf, 2u);
  }
  uint64_t v21 = [v6 downloadURL];
  objc_super v22 = sLogObject_23;
  BOOL v23 = os_log_type_enabled((os_log_t)sLogObject_23, OS_LOG_TYPE_DEFAULT);
  if (!v21)
  {
    if (v23)
    {
      *(_WORD *)buf = 0;
      v24 = "Using streaming URL for download since download URL is not available";
      v25 = v22;
      goto LABEL_19;
    }
LABEL_20:
    uint64_t v19 = [v6 playbackURL];
LABEL_21:
    uint64_t v21 = v19;
    goto LABEL_22;
  }
  if (v23)
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1E2BD7000, v22, OS_LOG_TYPE_DEFAULT, "Using download URL", buf, 2u);
  }
LABEL_22:
  v26 = [(VUIStoreAuxMediaItem *)self initWithURL:v21];
  [(VUIStoreAuxMediaItem *)v26 setIsForStartingDownload:v4];
  [(VUIStoreAuxMediaItem *)v26 setVideoManagedObject:v6];
  v27 = [v6 fpsCertificateURL];
  [(VUIStoreAuxMediaItem *)v26 setFpsCertificateURL:v27];

  v28 = [v6 fpsKeyServerURL];
  [(VUIStoreAuxMediaItem *)v26 setFpsKeyServerURL:v28];

  v29 = [v6 additionalFPSRequestParams];
  [(VUIStoreAuxMediaItem *)v26 setFpsAdditionalServerParams:v29];

  -[VUIStoreAuxMediaItem setIsSportingEvent:](v26, "setIsSportingEvent:", [v6 isSportingEvent]);
  v30 = [v6 vpafMetricsJSONData];
  v51 = v30;
  v52 = (void *)v21;
  if (![v30 length])
  {
    id v33 = 0;
    goto LABEL_31;
  }
  id v58 = 0;
  v31 = [MEMORY[0x1E4F28D90] JSONObjectWithData:v30 options:0 error:&v58];
  id v32 = v58;
  if (!v31)
  {
    if (os_log_type_enabled((os_log_t)sLogObject_23, OS_LOG_TYPE_ERROR)) {
      -[VUIStoreAuxMediaItem initWithVideoManagedObject:isForStartingDownload:]();
    }
    goto LABEL_29;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
LABEL_29:
    id v33 = 0;
    goto LABEL_30;
  }
  id v33 = v31;
LABEL_30:

LABEL_31:
  v34 = [v6 bookmarkTime];
  v35 = [v6 bookmarkTimeStamp];
  v36 = [v6 mainContentRelativeBookmarkTime];
  v37 = [v6 mainContentRelativeBookmarkTimeStamp];
  if (v34)
  {
    v38 = v37;
    v39 = v35;
    v40 = [[VUIMediaStartTimeInfo alloc] initWithStartTime:v34 timestamp:v35 type:0 source:@"Sideband Library"];
    v41 = [(VUIBaseMediaItem *)v26 startTimeCollection];
    [v41 addStartTimeInfo:v40];

    v35 = v39;
    v37 = v38;
  }
  if (v36)
  {
    v42 = [[VUIMediaStartTimeInfo alloc] initWithStartTime:v36 timestamp:v37 type:1 source:@"Sideband Library"];
    [(VUIBaseMediaItem *)v26 startTimeCollection];
    v44 = v43 = v35;
    [v44 addStartTimeInfo:v42];

    v35 = v43;
  }
  v53[0] = MEMORY[0x1E4F143A8];
  v53[1] = 3221225472;
  v53[2] = __73__VUIStoreAuxMediaItem_initWithVideoManagedObject_isForStartingDownload___block_invoke;
  v53[3] = &unk_1E6DF4B28;
  v54 = v26;
  id v55 = v6;
  id v56 = v33;
  v45 = v54;
  v57 = v45;
  id v46 = v6;
  id v47 = v33;
  [(TVPBaseMediaItem *)v45 performMediaItemMetadataTransactionWithBlock:v53];
  v48 = v57;
  v49 = v45;

  return v49;
}

void __73__VUIStoreAuxMediaItem_initWithVideoManagedObject_isForStartingDownload___block_invoke(uint64_t a1)
{
  uint64_t v100 = *MEMORY[0x1E4F143B8];
  os_log_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = [*(id *)(a1 + 40) canonicalID];
  [v2 setMediaItemMetadata:v3 forProperty:*MEMORY[0x1E4FA9E28]];

  BOOL v4 = *(void **)(a1 + 32);
  v5 = [*(id *)(a1 + 40) title];
  [v4 setMediaItemMetadata:v5 forProperty:*MEMORY[0x1E4FAA0E8]];

  id v6 = *(void **)(a1 + 32);
  v7 = [*(id *)(a1 + 40) externalID];
  [v6 setMediaItemMetadata:v7 forProperty:*MEMORY[0x1E4FA9ED8]];

  uint64_t v8 = *(void **)(a1 + 32);
  uint64_t v9 = [*(id *)(a1 + 40) adamID];
  [v8 setMediaItemMetadata:v9 forProperty:*MEMORY[0x1E4FAA0D8]];

  uint64_t v10 = *(void **)(a1 + 32);
  uint64_t v11 = [*(id *)(a1 + 40) rtcServiceIdentifier];
  [v10 setMediaItemMetadata:v11 forProperty:*MEMORY[0x1E4FAA070]];

  uint64_t v12 = *(void **)(a1 + 32);
  uint64_t v13 = [*(id *)(a1 + 40) brandID];
  [v12 setMediaItemMetadata:v13 forProperty:*MEMORY[0x1E4FA9E10]];

  uint64_t v14 = *(void **)(a1 + 32);
  uint64_t v15 = [*(id *)(a1 + 40) brandName];
  [v14 setMediaItemMetadata:v15 forProperty:*MEMORY[0x1E4FA9E18]];

  uint64_t v16 = *(void **)(a1 + 32);
  v17 = [*(id *)(a1 + 40) contentRatingRank];
  [v16 setMediaItemMetadata:v17 forProperty:*MEMORY[0x1E4FA9E60]];

  BOOL v18 = *(void **)(a1 + 32);
  uint64_t v19 = [*(id *)(a1 + 40) dsid];
  [v18 setMediaItemMetadata:v19 forProperty:*MEMORY[0x1E4FA9E70]];

  id v20 = *(void **)(a1 + 32);
  uint64_t v21 = [*(id *)(a1 + 40) referenceID];
  [v20 setMediaItemMetadata:v21 forProperty:*MEMORY[0x1E4FAA008]];

  objc_super v22 = *(void **)(a1 + 32);
  BOOL v23 = [*(id *)(a1 + 40) genreName];
  [v22 setMediaItemMetadata:v23 forProperty:*MEMORY[0x1E4FA9F20]];

  v24 = *(void **)(a1 + 32);
  v25 = [*(id *)(a1 + 40) releaseDate];
  [v24 setMediaItemMetadata:v25 forProperty:*MEMORY[0x1E4FA9E80]];

  v26 = *(void **)(a1 + 32);
  v27 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithBool:", objc_msgSend(*(id *)(a1 + 40), "isAdultContent"));
  [v26 setMediaItemMetadata:v27 forProperty:*MEMORY[0x1E4FA9F70]];

  [*(id *)(a1 + 32) setMediaItemMetadata:*(void *)(a1 + 48) forProperty:*MEMORY[0x1E4FAA108]];
  v28 = *(void **)(a1 + 32);
  v29 = [*(id *)(a1 + 40) mediaMetrics];
  [v28 setMediaItemMetadata:v29 forProperty:*MEMORY[0x1E4FA9FA8]];

  v30 = *(void **)(a1 + 32);
  v31 = [*(id *)(a1 + 40) playbackModes];
  [v30 setMediaItemMetadata:v31 forProperty:@"VUIContentMetadataPlaybackModes"];

  id v32 = *(void **)(a1 + 32);
  id v33 = [*(id *)(a1 + 40) requiredAgeForPlayback];
  [v32 setMediaItemMetadata:v33 forProperty:*MEMORY[0x1E4FAA030]];

  v34 = *(void **)(a1 + 32);
  v35 = [*(id *)(a1 + 40) frequencyOfAgeConfirmation];
  [v34 setMediaItemMetadata:v35 forProperty:*MEMORY[0x1E4FA9F18]];

  v36 = *(void **)(a1 + 32);
  v37 = [*(id *)(a1 + 40) expirationDate];
  [v36 setMediaItemMetadata:v37 forProperty:@"VUIContentMetadataDownloadExpirationDate"];

  v38 = *(void **)(a1 + 32);
  v39 = [*(id *)(a1 + 40) availabilityEndDate];
  [v38 setMediaItemMetadata:v39 forProperty:@"VUIContentMetadataAvailabilityEndDate"];

  v40 = *(void **)(a1 + 32);
  v41 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithBool:", objc_msgSend(*(id *)(a1 + 40), "allowsManualRenewal"));
  [v40 setMediaItemMetadata:v41 forProperty:@"VUIContentMetadataDownloadAllowsManualRenewal"];

  v42 = (void *)MEMORY[0x1E4F28ED0];
  v43 = *(void **)(a1 + 32);
  v44 = [*(id *)(a1 + 40) offlineKeyRenewalPolicy];
  v45 = objc_msgSend(v42, "numberWithInt:", objc_msgSend(v44, "integerValue") == 1);
  [v43 setMediaItemMetadata:v45 forProperty:@"VUIContentMetadataDownloadRenewsKeysAutomatically"];

  [*(id *)(a1 + 32) setMediaItemMetadata:*(void *)(a1 + 40) forProperty:@"VUIContentMetadataDownloadVideoManagedObject"];
  id v46 = *(void **)(a1 + 32);
  id v47 = [*(id *)(a1 + 40) shareURL];
  [v46 setMediaItemMetadata:v47 forProperty:@"VUIContentMetadataDeepLinkURL"];

  v48 = *(void **)(a1 + 32);
  v49 = [*(id *)(a1 + 40) rentalID];
  [v48 setMediaItemMetadata:v49 forProperty:*MEMORY[0x1E4FAA018]];

  v50 = *(void **)(a1 + 32);
  v51 = [*(id *)(a1 + 40) buyParams];
  [v50 setMediaItemMetadata:v51 forProperty:*MEMORY[0x1E4FA9E20]];

  v52 = *(void **)(a1 + 32);
  v53 = [*(id *)(a1 + 40) rentalPlaybackStartDate];
  [v52 setMediaItemMetadata:v53 forProperty:*MEMORY[0x1E4FAA028]];

  v54 = *(void **)(a1 + 32);
  id v55 = [*(id *)(a1 + 40) downloadedPlaybackMode];
  [v54 setMediaItemMetadata:v55 forProperty:@"VUIContentMetadataDownloadedPlaybackMode"];

  id v56 = *(void **)(a1 + 32);
  v57 = [*(id *)(a1 + 40) playablePassThrough];
  [v56 setMediaItemMetadata:v57 forProperty:@"VUIMediaItemMetadataPlayablePassThrough"];

  id v58 = [*(id *)(a1 + 40) programID];
  if (!v58)
  {
    v59 = [*(id *)(a1 + 40) downloadURL];
    if (v59)
    {
      v94 = v59;
      v93 = (void *)[objc_alloc(MEMORY[0x1E4F29088]) initWithURL:v59 resolvingAgainstBaseURL:0];
      v60 = [v93 queryItems];
      v61 = (void *)[v60 mutableCopy];

      long long v97 = 0u;
      long long v98 = 0u;
      long long v95 = 0u;
      long long v96 = 0u;
      id v62 = v61;
      uint64_t v63 = [v62 countByEnumeratingWithState:&v95 objects:v99 count:16];
      if (v63)
      {
        uint64_t v64 = v63;
        id v58 = 0;
        uint64_t v65 = *(void *)v96;
        do
        {
          for (uint64_t i = 0; i != v64; ++i)
          {
            if (*(void *)v96 != v65) {
              objc_enumerationMutation(v62);
            }
            v67 = *(void **)(*((void *)&v95 + 1) + 8 * i);
            v68 = [v67 name];
            int v69 = [v68 isEqualToString:@"id"];

            if (v69)
            {
              uint64_t v70 = [v67 value];

              id v58 = (void *)v70;
            }
          }
          uint64_t v64 = [v62 countByEnumeratingWithState:&v95 objects:v99 count:16];
        }
        while (v64);
      }
      else
      {
        id v58 = 0;
      }

      v59 = v94;
    }
    else
    {
      id v58 = 0;
    }
  }
  [*(id *)(a1 + 32) setMediaItemMetadata:v58 forProperty:*MEMORY[0x1E4FA9F30]];
  v71 = [*(id *)(a1 + 40) contentRatingDomain];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v72 = *(id *)(a1 + 40);
    if (![v71 length])
    {
      v73 = @"Show";

      v71 = v73;
    }
    [*(id *)(a1 + 32) setMediaItemMetadata:*MEMORY[0x1E4FAA200] forProperty:*MEMORY[0x1E4FA9FB0]];
    v74 = *(void **)(a1 + 32);
    v75 = [v72 series];
    v76 = [v75 title];
    [v74 setMediaItemMetadata:v76 forProperty:*MEMORY[0x1E4FAA068]];

    v77 = *(void **)(a1 + 32);
    v78 = [v72 series];
    v79 = [v78 canonicalID];
    [v77 setMediaItemMetadata:v79 forProperty:*MEMORY[0x1E4FAA080]];

    v80 = *(void **)(a1 + 32);
    v81 = [v72 season];
    v82 = [v81 canonicalID];
    [v80 setMediaItemMetadata:v82 forProperty:*MEMORY[0x1E4FAA058]];

    v83 = *(void **)(a1 + 32);
    v84 = [v72 season];
    v85 = [v84 seasonNumber];
    [v83 setMediaItemMetadata:v85 forProperty:*MEMORY[0x1E4FAA060]];

    v86 = *(void **)(a1 + 32);
    v87 = [v72 episodeNumberInSeason];
    [v86 setMediaItemMetadata:v87 forProperty:*MEMORY[0x1E4FA9EC0]];

    v88 = *(void **)(a1 + 32);
    v89 = [v72 episodeNumberInSeries];
    [v88 setMediaItemMetadata:v89 forProperty:*MEMORY[0x1E4FA9EB8]];
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      if (![v71 length])
      {
        v90 = @"Movie";

        v71 = v90;
      }
      [*(id *)(a1 + 32) setMediaItemMetadata:*MEMORY[0x1E4FAA1E8] forProperty:*MEMORY[0x1E4FA9FB0]];
    }
  }
  v91 = *(void **)(a1 + 32);
  v92 = [*(id *)(a1 + 56) _tvpRatingDomainFromUTSRatingDomain:v71];
  [v91 setMediaItemMetadata:v92 forProperty:*MEMORY[0x1E4FA9E48]];
}

- (id)_tvpRatingDomainFromUTSRatingDomain:(id)a3
{
  id v4 = (id)*MEMORY[0x1E4FA9E50];
  if ([a3 isEqualToString:@"Show"])
  {
    id v5 = (id)*MEMORY[0x1E4FA9E58];

    id v4 = v5;
  }
  return v4;
}

- (void)resetReportingEventCollection
{
  id v4 = objc_alloc_init(MEMORY[0x1E4FA9D78]);
  [v4 addStartEventWithName:*MEMORY[0x1E4FAA370]];
  [v4 addStartEventWithName:*MEMORY[0x1E4FAA388]];
  if ([(VUIStoreAuxMediaItem *)self isHLS]) {
    uint64_t v3 = 2;
  }
  else {
    uint64_t v3 = 1;
  }
  [v4 setVideoType:v3];
  [(VUIStoreAuxMediaItem *)self setMediaItemMetadata:v4 forProperty:*MEMORY[0x1E4FAA148]];
}

- (void)dealloc
{
  uint64_t v3 = sLogObject_23;
  if (os_log_type_enabled((os_log_t)sLogObject_23, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1E2BD7000, v3, OS_LOG_TYPE_DEFAULT, "VUIStoreAuxMediaItem deallocated", buf, 2u);
  }
  v4.receiver = self;
  v4.super_class = (Class)VUIStoreAuxMediaItem;
  [(VUIStoreAuxMediaItem *)&v4 dealloc];
}

- (BOOL)isEqualToMediaItem:(id)a3
{
  objc_super v4 = (VUIStoreAuxMediaItem *)a3;
  if (self == v4)
  {
    char v7 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = [(VUIStoreAuxMediaItem *)self url];
      id v6 = [(VUIStoreAuxMediaItem *)v4 url];
      char v7 = [v5 isEqual:v6];
    }
    else
    {
      char v7 = 0;
    }
  }

  return v7;
}

- (BOOL)hasTrait:(id)a3
{
  id v4 = a3;
  if (![v4 isEqualToString:*MEMORY[0x1E4FAA170]])
  {
    if ([v4 isEqualToString:*MEMORY[0x1E4FAA1B8]])
    {
      id v6 = [(VUIStoreAuxMediaItem *)self bookmarkID];
      uint64_t v7 = [v6 length];

      if (!v7)
      {
        uint64_t v8 = [(VUIStoreAuxMediaItem *)self videoManagedObject];
LABEL_6:
        char v5 = v8 != 0;

        goto LABEL_14;
      }
LABEL_10:
      char v5 = 1;
      goto LABEL_14;
    }
    if ([v4 isEqualToString:*MEMORY[0x1E4FAA158]])
    {
      unsigned __int8 v9 = [(VUIStoreAuxMediaItem *)self disableResumeMenu];
LABEL_13:
      char v5 = v9;
      goto LABEL_14;
    }
    if ([v4 isEqualToString:*MEMORY[0x1E4FAA178]]) {
      goto LABEL_10;
    }
    if ([v4 isEqualToString:*MEMORY[0x1E4FAA168]])
    {
      unsigned __int8 v9 = [(VUIStoreAuxMediaItem *)self isHLS];
      goto LABEL_13;
    }
    if ([v4 isEqualToString:*MEMORY[0x1E4FAA188]])
    {
      uint64_t v11 = [(VUIStoreAuxMediaItem *)self videoManagedObject];
      if (v11)
      {
        uint64_t v12 = [(VUIStoreAuxMediaItem *)self videoManagedObject];
        char v5 = [v12 downloadState] == 2;
      }
      else
      {
        char v5 = 0;
      }
      goto LABEL_23;
    }
    if ([v4 isEqualToString:*MEMORY[0x1E4FAA1B0]])
    {
      char v5 = [(VUIStoreAuxMediaItem *)self playbackType] == 1;
      goto LABEL_14;
    }
    if ([v4 isEqualToString:*MEMORY[0x1E4FAA160]])
    {
      unsigned __int8 v9 = [(VUIStoreAuxMediaItem *)self disableScrubbing];
      goto LABEL_13;
    }
    if ([v4 isEqualToString:*MEMORY[0x1E4FAA1C8]]) {
      goto LABEL_10;
    }
    if ([v4 isEqualToString:*MEMORY[0x1E4FAA190]])
    {
      uint64_t v8 = [(VUIStoreAuxMediaItem *)self mediaItemMetadataForProperty:*MEMORY[0x1E4FAA018]];
      goto LABEL_6;
    }
    if ([v4 isEqualToString:*MEMORY[0x1E4FAA180]])
    {
      if ([(VUIStoreAuxMediaItem *)self isLiveContent]) {
        goto LABEL_10;
      }
    }
    else
    {
      if ([v4 isEqualToString:*MEMORY[0x1E4FAA1A8]])
      {
        uint64_t v11 = [(VUIStoreAuxMediaItem *)self mediaItemMetadataForProperty:@"VUIContentMetadataDisableSpeculativeLoading"];
        char v5 = [v11 BOOLValue];
LABEL_23:

        goto LABEL_14;
      }
      if (![v4 isEqualToString:VUIMediaItemTraitIsSportingEvent]
        && ![v4 isEqualToString:*MEMORY[0x1E4FAA1D8]])
      {
        v13.receiver = self;
        v13.super_class = (Class)VUIStoreAuxMediaItem;
        unsigned __int8 v9 = [(TVPBaseMediaItem *)&v13 hasTrait:v4];
        goto LABEL_13;
      }
    }
    unsigned __int8 v9 = [(VUIStoreAuxMediaItem *)self isSportingEvent];
    goto LABEL_13;
  }
  char v5 = [(VUIStoreAuxMediaItem *)self playbackContext] != 6;
LABEL_14:

  return v5;
}

- (id)mediaItemMetadataForProperty:(id)a3
{
  id v4 = a3;
  v46.receiver = self;
  v46.super_class = (Class)VUIStoreAuxMediaItem;
  id v5 = [(VUIBaseMediaItem *)&v46 mediaItemMetadataForProperty:v4];
  if (v5) {
    goto LABEL_31;
  }
  if ([v4 isEqualToString:*MEMORY[0x1E4FA9F98]])
  {
LABEL_3:
    id v5 = 0;
    goto LABEL_31;
  }
  if ([v4 isEqualToString:*MEMORY[0x1E4FA9F38]])
  {
    id v5 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    id v6 = [(id)objc_opt_class() mediaUserAgent];
    uint64_t v7 = [(VUIStoreAuxMediaItem *)self mediaItemMetadataForProperty:*MEMORY[0x1E4FA9E70]];
    uint64_t v8 = [v7 stringValue];
    if (v6) {
      [v5 setObject:v6 forKey:@"User-Agent"];
    }
    if (v8 && [(VUIStoreAuxMediaItem *)self playbackContext] != 6) {
      [v5 setObject:v8 forKey:@"X-Dsid"];
    }
    [v5 setObject:@"https://tv.apple.com" forKey:@"Referer"];
    if (![v5 count])
    {

      id v5 = 0;
    }
    goto LABEL_12;
  }
  if (![v4 isEqualToString:*MEMORY[0x1E4FAA090]])
  {
    if ([v4 isEqualToString:*MEMORY[0x1E4FA9FA0]])
    {
      id v6 = [(VUIStoreAuxMediaItem *)self videoManagedObject];
      if (v6
        && (-[VUIStoreAuxMediaItem mediaItemMetadataForProperty:](self, "mediaItemMetadataForProperty:", *MEMORY[0x1E4FA9F10]), uint64_t v10 = objc_claimAutoreleasedReturnValue(), v11 = [v10 BOOLValue], v10, (v11 & 1) == 0))
      {
        uint64_t v21 = [(VUIStoreAuxMediaItem *)self videoManagedObject];
        unint64_t v22 = [v21 downloadState];

        if (v22 > 3) {
          uint64_t v12 = 0;
        }
        else {
          uint64_t v12 = qword_1E38FE6D0[v22];
        }
      }
      else
      {
        uint64_t v12 = 1;
      }
      id v5 = [MEMORY[0x1E4F28ED0] numberWithInteger:v12];
      goto LABEL_14;
    }
    if ([v4 isEqualToString:*MEMORY[0x1E4FA9EA0]])
    {
      uint64_t v14 = [(VUIStoreAuxMediaItem *)self videoManagedObject];
      id v5 = [v14 downloadTaskIdentifier];
LABEL_30:

      goto LABEL_31;
    }
    if ([v4 isEqualToString:*MEMORY[0x1E4FA9DF8]])
    {
      id v5 = [(VUIStoreAuxMediaItem *)self videoManagedObject];

      if (!v5) {
        goto LABEL_31;
      }
      uint64_t v16 = [VUISidebandMediaEntityImageLoadParams alloc];
      v17 = [(VUIStoreAuxMediaItem *)self videoManagedObject];
      BOOL v18 = v16;
      uint64_t v19 = v17;
      uint64_t v20 = 0;
LABEL_42:
      id v6 = [(VUISidebandMediaEntityImageLoadParams *)v18 initWithVideoManagedObject:v19 imageType:v20];

      v24 = (objc_class *)MEMORY[0x1E4FA9CA0];
LABEL_51:
      id v31 = [v24 alloc];
      uint64_t v7 = +[VUIMediaLibraryManager defaultManager];
      uint64_t v8 = [v7 sidebandMediaLibrary];
      id v5 = (id)[v31 initWithObject:v6 imageLoader:v8 groupType:0];
LABEL_12:

LABEL_13:
LABEL_14:

      goto LABEL_31;
    }
    if ([v4 isEqualToString:*MEMORY[0x1E4FA9DF0]])
    {
      id v5 = [(VUIStoreAuxMediaItem *)self videoManagedObject];

      if (!v5) {
        goto LABEL_31;
      }
      BOOL v23 = [VUISidebandMediaEntityImageLoadParams alloc];
      v17 = [(VUIStoreAuxMediaItem *)self videoManagedObject];
      BOOL v18 = v23;
      uint64_t v19 = v17;
      uint64_t v20 = 1;
      goto LABEL_42;
    }
    if ([v4 isEqualToString:@"VUIMediaItemMetadataArtworkEpisodePreviewVUIImageProxy"])
    {
      id v5 = [(VUIStoreAuxMediaItem *)self videoManagedObject];

      if (!v5) {
        goto LABEL_31;
      }
      v25 = [VUISidebandMediaEntityImageLoadParams alloc];
      v26 = [(VUIStoreAuxMediaItem *)self videoManagedObject];
      v27 = v25;
      v28 = v26;
      uint64_t v29 = 1;
LABEL_50:
      id v6 = [(VUISidebandMediaEntityImageLoadParams *)v27 initWithVideoManagedObject:v28 imageType:v29];

      v24 = (objc_class *)MEMORY[0x1E4FB3CD0];
      goto LABEL_51;
    }
    if ([v4 isEqualToString:@"VUIMediaItemMetadataPostPlayVUIImageProxy"])
    {
      id v5 = [(VUIStoreAuxMediaItem *)self videoManagedObject];

      if (!v5) {
        goto LABEL_31;
      }
      v30 = [VUISidebandMediaEntityImageLoadParams alloc];
      v26 = [(VUIStoreAuxMediaItem *)self videoManagedObject];
      v27 = v30;
      v28 = v26;
      uint64_t v29 = 2;
      goto LABEL_50;
    }
    if ([v4 isEqualToString:*MEMORY[0x1E4FA9DD8]])
    {
      id v6 = (VUISidebandMediaEntityImageLoadParams *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
      uint64_t v7 = [(VUIStoreAuxMediaItem *)self mediaItemMetadataForProperty:*MEMORY[0x1E4FA9FA8]];
      if ([v7 count])
      {
        [(VUISidebandMediaEntityImageLoadParams *)v6 addEntriesFromDictionary:v7];
        id v32 = [(VUIStoreAuxMediaItem *)self mediaItemMetadataForProperty:*MEMORY[0x1E4FA9E10]];
        if ([v32 length]) {
          [(VUISidebandMediaEntityImageLoadParams *)v6 setObject:v32 forKey:*MEMORY[0x1E4F16100]];
        }
      }
      if ([(VUISidebandMediaEntityImageLoadParams *)v6 count]) {
        id v5 = (id)[(VUISidebandMediaEntityImageLoadParams *)v6 copy];
      }
      else {
        id v5 = 0;
      }
      goto LABEL_13;
    }
    if (![v4 isEqualToString:*MEMORY[0x1E4FA9E98]]) {
      goto LABEL_3;
    }
    uint64_t v14 = [(VUIStoreAuxMediaItem *)self videoManagedObject];
    id v33 = [v14 downloadQOSMetricsJSONData];
    if (![v33 length])
    {
      id v5 = 0;
LABEL_72:

      goto LABEL_30;
    }
    id v45 = 0;
    v34 = [MEMORY[0x1E4F28D90] JSONObjectWithData:v33 options:0 error:&v45];
    id v35 = v45;
    if (v34)
    {
      objc_opt_class();
      v36 = v34;
      if (objc_opt_isKindOfClass())
      {
        id v5 = v34;
LABEL_71:

        goto LABEL_72;
      }
      BOOL v37 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR);
      if (v37) {
        -[VUIStoreMediaItem_iOS mediaItemMetadataForProperty:](v37, v38, v39, v40, v41, v42, v43, v44);
      }
    }
    else
    {
      v36 = 0;
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
        -[VUIStoreMediaItem_iOS mediaItemMetadataForProperty:]();
      }
    }
    id v5 = 0;
    goto LABEL_71;
  }
  if ([(VUIStoreAuxMediaItem *)self isAudioOnly])
  {
    unsigned __int8 v9 = (void *)*MEMORY[0x1E4F18A70];
  }
  else
  {
    unsigned __int8 v9 = (void *)*MEMORY[0x1E4F18A68];
    objc_super v13 = [(VUIStoreAuxMediaItem *)self mediaItemMetadataForProperty:*MEMORY[0x1E4FA9FB0]];
    if (([v13 isEqualToString:*MEMORY[0x1E4FAA1E8]] & 1) == 0
      && [v13 isEqualToString:*MEMORY[0x1E4FAA200]])
    {
      unsigned __int8 v9 = (void *)*MEMORY[0x1E4F18A78];
    }
  }
  id v5 = v9;
LABEL_31:

  return v5;
}

- (void)setMediaItemMetadata:(id)a3 forProperty:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v7 isEqualToString:*MEMORY[0x1E4FA9E98]])
  {
    uint64_t v8 = [(VUIStoreAuxMediaItem *)self videoManagedObject];
    id v9 = v6;
    if ([v9 count] && objc_msgSend(MEMORY[0x1E4F28D90], "isValidJSONObject:", v9))
    {
      id v15 = 0;
      uint64_t v10 = [MEMORY[0x1E4F28D90] dataWithJSONObject:v9 options:0 error:&v15];
      id v11 = v15;
      if ([v10 length])
      {
        [v8 setDownloadQOSMetricsJSONData:v10];
        uint64_t v12 = +[VUIMediaLibraryManager defaultManager];
        objc_super v13 = [v12 sidebandMediaLibrary];
        [v13 saveChangesToManagedObjects];
      }
      else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        -[VUIStoreMediaItem_iOS setMediaItemMetadata:forProperty:]();
      }
    }
  }
  else
  {
    v14.receiver = self;
    v14.super_class = (Class)VUIStoreAuxMediaItem;
    [(TVPBaseMediaItem *)&v14 setMediaItemMetadata:v6 forProperty:v7];
  }
}

- (void)prepareForLoadingWithCompletion:(id)a3
{
  uint64_t v79 = *MEMORY[0x1E4F143B8];
  id v4 = (void (**)(id, uint64_t, void))a3;
  [(VUIStoreAuxMediaItem *)self setFpsKeyError:0];
  id v5 = [(VUIStoreAuxMediaItem *)self storeFPSKeyLoader];
  [v5 removeAllEntriesFromKeyIdentifierPenaltyBox];

  id v6 = [(VUIStoreAuxMediaItem *)self videoManagedObject];
  uint64_t v7 = [v6 downloadState];
  uint64_t v8 = [(VUIStoreAuxMediaItem *)self mediaItemMetadataForProperty:*MEMORY[0x1E4FA9F10]];
  int v9 = [v8 BOOLValue];

  unsigned int v10 = ((unint64_t)(v7 - 3) < 0xFFFFFFFFFFFFFFFELL) & ~[(VUIStoreAuxMediaItem *)self isForStartingDownload];
  if (v10) {
    id v11 = @"Streaming";
  }
  else {
    id v11 = @"Downloading or Downloaded";
  }
  if (v10) {
    uint64_t v12 = 1;
  }
  else {
    uint64_t v12 = 2;
  }
  if ((v10 & 1) != 0 || !v9) {
    goto LABEL_18;
  }
  objc_super v13 = sLogObject_23;
  if (os_log_type_enabled((os_log_t)sLogObject_23, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1E2BD7000, v13, OS_LOG_TYPE_DEFAULT, "Force streaming is set; configuring for streaming",
      buf,
      2u);
  }
  objc_super v14 = [(VUIStoreAuxMediaItem *)self streamingOverrideURLForDownload];
  if (v14)
  {
    id v15 = sLogObject_23;
    if (os_log_type_enabled((os_log_t)sLogObject_23, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v78 = v14;
      uint64_t v16 = "Using streaming override URL: %@";
LABEL_16:
      _os_log_impl(&dword_1E2BD7000, v15, OS_LOG_TYPE_DEFAULT, v16, buf, 0xCu);
    }
  }
  else
  {
    objc_super v14 = [v6 playbackURL];
    id v15 = sLogObject_23;
    if (os_log_type_enabled((os_log_t)sLogObject_23, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v78 = v14;
      uint64_t v16 = "Using download's original URL: %@";
      goto LABEL_16;
    }
  }
  [(VUIStoreAuxMediaItem *)self setUrl:v14];

  id v11 = @"Streaming";
  uint64_t v12 = 1;
LABEL_18:
  if (v6) {
    BOOL v17 = v7 == 2;
  }
  else {
    BOOL v17 = 0;
  }
  if (v17) {
    char v18 = v9;
  }
  else {
    char v18 = 1;
  }
  if ((v18 & 1) == 0)
  {
    uint64_t v19 = [(VUIStoreAuxMediaItem *)self mediaItemMetadataForProperty:*MEMORY[0x1E4FAA148]];
    [v19 setIsDownloaded:1];

    id v20 = objc_alloc_init(MEMORY[0x1E4F28CB8]);
    uint64_t v21 = [(VUIStoreAuxMediaItem *)self url];
    unint64_t v22 = [v21 path];

    if (!v22 || ([v20 fileExistsAtPath:v22] & 1) == 0)
    {
      BOOL v23 = sLogObject_23;
      if (os_log_type_enabled((os_log_t)sLogObject_23, OS_LOG_TYPE_ERROR)) {
        -[VUIStoreAuxMediaItem prepareForLoadingWithCompletion:](v23, v24, v25, v26, v27, v28, v29, v30);
      }
      id v31 = +[VUIMediaLibraryManager defaultManager];
      id v32 = [v31 sidebandMediaLibrary];
      [v32 removeDownloadedMediaForVideoManagedObject:v6 markAsDeleted:0 invalidateImmediately:1];
    }
  }
  id v33 = [(VUIStoreAuxMediaItem *)self mediaItemMetadataForProperty:@"VUIContentMetadataGroupActivityDay"];
  if ([v33 length])
  {
    v34 = [(VUIStoreAuxMediaItem *)self url];
    id v35 = v34;
    if (v34)
    {
      if (([v34 isFileURL] & 1) == 0)
      {
        v36 = objc_msgSend(v35, "vui_URLByAddingQueryParamWithName:value:", @"groupActivityDay", v33);
        [(VUIStoreAuxMediaItem *)self setUrl:v36];

        BOOL v37 = (void *)sLogObject_23;
        if (os_log_type_enabled((os_log_t)sLogObject_23, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v38 = v37;
          uint64_t v39 = [(VUIStoreAuxMediaItem *)self url];
          *(_DWORD *)buf = 138412290;
          v78 = v39;
          _os_log_impl(&dword_1E2BD7000, v38, OS_LOG_TYPE_DEFAULT, "Added groupActivityDay param to playback URL: %@", buf, 0xCu);
        }
      }
    }
  }
  if ([(VUIStoreAuxMediaItem *)self ignoreStartOverParam])
  {
    uint64_t v40 = [(VUIStoreAuxMediaItem *)self url];
    uint64_t v41 = objc_msgSend(v40, "vui_URLByRemovingQueryParamWithName:", @"startOver");

    [(VUIStoreAuxMediaItem *)self setUrl:v41];
    uint64_t v42 = (void *)sLogObject_23;
    if (os_log_type_enabled((os_log_t)sLogObject_23, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v43 = v42;
      uint64_t v44 = [(VUIStoreAuxMediaItem *)self url];
      *(_DWORD *)buf = 138412290;
      v78 = v44;
      _os_log_impl(&dword_1E2BD7000, v43, OS_LOG_TYPE_DEFAULT, "Removed startOver param from playback URL: %@", buf, 0xCu);
    }
  }
  id v45 = sLogObject_23;
  if (os_log_type_enabled((os_log_t)sLogObject_23, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v78 = v11;
    _os_log_impl(&dword_1E2BD7000, v45, OS_LOG_TYPE_DEFAULT, "Setting playback type to %@", buf, 0xCu);
  }
  [(VUIStoreAuxMediaItem *)self setPlaybackType:v12];
  objc_super v46 = [(VUIStoreAuxMediaItem *)self mediaItemMetadataForProperty:*MEMORY[0x1E4FAA048]];
  if (v46)
  {
    id v47 = (void *)[objc_alloc(MEMORY[0x1E4FA9D98]) initWithName:@"Scrub AVPlayerItem loader"];
    [v47 setUpdatesMediaRemoteInfoAutomatically:0];
    [v47 setSendsPlayerReports:0];
    [v47 setUpdatesBookmarks:0];
    [v47 setCreatesPlayerItemButDoesNotEnqueue:1];
    [v47 setCurrentMediaItem:v46];
    objc_msgSend(v47, "setIFramePrefetchMaxSize:", 400.0, 400.0);
    [(VUIStoreAuxMediaItem *)self setScrubPlayer:v47];
    [v47 pause];
    v48 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v48 addObserver:self selector:sel__scrubPlayerItemDidLoad_ name:*MEMORY[0x1E4FAA408] object:v47];
  }
  v49 = [(VUIStoreAuxMediaItem *)self bookmarkID];
  if ([(VUIBookmarkKey *)v49 length])
  {
    v50 = [(VUIStoreAuxMediaItem *)self bookmark];
    BOOL v51 = v50 == 0;

    if (!v51) {
      goto LABEL_51;
    }
    v52 = [VUIBookmarkKey alloc];
    v53 = [(VUIStoreAuxMediaItem *)self bookmarkID];
    v49 = [(VUIBookmarkKey *)v52 initWithIdentifier:v53 keyType:2];

    v54 = [(VUIBookmark *)[VUIMutableBookmark alloc] initWithKey:v49];
    [(VUIBookmark *)v54 bookmarkTime];
    if (v55 != 0.0)
    {
      id v56 = [VUIMediaStartTimeInfo alloc];
      v57 = (void *)MEMORY[0x1E4F28ED0];
      [(VUIBookmark *)v54 bookmarkTime];
      id v58 = objc_msgSend(v57, "numberWithDouble:");
      v59 = [(VUIBookmark *)v54 bookmarkTimestamp];
      v60 = [(VUIMediaStartTimeInfo *)v56 initWithStartTime:v58 timestamp:v59 type:0 source:@"Store Bookkeeper"];

      v61 = [(VUIBaseMediaItem *)self startTimeCollection];
      [v61 addStartTimeInfo:v60];
    }
    [(VUIStoreAuxMediaItem *)self setBookmark:v54];
  }
LABEL_51:
  id v62 = [(VUIStoreAuxMediaItem *)self bookmark];
  BOOL v63 = v62 == 0;

  if (v63)
  {
    if (v4) {
      v4[2](v4, 1, 0);
    }
  }
  else
  {
    uint64_t v64 = +[VideosExtrasBookmarkController sharedInstance];
    [v64 setMinimumBookmarkUpdateInterval:0.0];

    uint64_t v65 = *MEMORY[0x1E4FAA148];
    v66 = [(VUIStoreAuxMediaItem *)self mediaItemMetadataForProperty:*MEMORY[0x1E4FAA148]];
    [v66 addStartEventWithName:*MEMORY[0x1E4FAA2B0]];

    v67 = [(VUIStoreAuxMediaItem *)self mediaItemMetadataForProperty:v65];
    [v67 addSingleShotEventWithName:*MEMORY[0x1E4FAA2B8] value:MEMORY[0x1E4F1CC38]];

    objc_initWeak((id *)buf, self);
    v68 = +[VideosExtrasBookmarkController sharedInstance];
    int v69 = [(VUIStoreAuxMediaItem *)self bookmark];
    uint64_t v70 = [v69 key];
    v71 = [v70 identifier];
    v76 = v71;
    id v72 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v76 count:1];
    v73[0] = MEMORY[0x1E4F143A8];
    v73[1] = 3221225472;
    v73[2] = __56__VUIStoreAuxMediaItem_prepareForLoadingWithCompletion___block_invoke;
    v73[3] = &unk_1E6DFD4A0;
    objc_copyWeak(&v75, (id *)buf);
    v74 = v4;
    [v68 pullBookmarksForIdentifiers:v72 completionBlock:v73];

    objc_destroyWeak(&v75);
    objc_destroyWeak((id *)buf);
  }
}

void __56__VUIStoreAuxMediaItem_prepareForLoadingWithCompletion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  objc_copyWeak(&v7, (id *)(a1 + 40));
  id v5 = v4;
  id v6 = *(id *)(a1 + 32);
  TVPPerformBlockOnMainThreadIfNeeded();

  objc_destroyWeak(&v7);
}

void __56__VUIStoreAuxMediaItem_prepareForLoadingWithCompletion___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  os_log_t v2 = [*(id *)(a1 + 32) firstObject];
  if (v2)
  {
    uint64_t v3 = [WeakRetained bookmark];
    [v2 doubleValue];
    objc_msgSend(v3, "setBookmarkTime:");
  }
  id v4 = [WeakRetained mediaItemMetadataForProperty:*MEMORY[0x1E4FAA148]];
  [v4 addEndEventWithName:*MEMORY[0x1E4FAA2B0]];

  uint64_t v5 = *(void *)(a1 + 40);
  if (v5) {
    (*(void (**)(uint64_t, uint64_t, void))(v5 + 16))(v5, 1, 0);
  }
}

- (id)replacementErrorForPlaybackError:(id)a3
{
  id v4 = a3;
  if ([(VUIStoreAuxMediaItem *)self isiTunesPurchasedOrRentedContent]) {
    [(VUIStoreAuxMediaItem *)self _replacementErrorForITunesPlaybackError:v4];
  }
  else {
  uint64_t v5 = [(VUIStoreAuxMediaItem *)self _replacementErrorForPlaybackError:v4];
  }

  return v5;
}

- (id)_replacementErrorForPlaybackError:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(VUIStoreAuxMediaItem *)self fpsKeyError];

  id v6 = v4;
  if (v5)
  {
    id v7 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    [v7 setObject:MEMORY[0x1E4F1CC38] forKey:*MEMORY[0x1E4FAA140]];
    uint64_t v8 = [(VUIStoreAuxMediaItem *)self fpsKeyError];
    [v7 setObject:v8 forKey:*MEMORY[0x1E4F28A50]];

    int v9 = [(VUIStoreAuxMediaItem *)self fpsKeyError];
    uint64_t v10 = [v9 code];

    if (v10 == -345015)
    {
      id v11 = +[VUILocalizationManager sharedInstance];
      uint64_t v12 = [v11 localizedStringForKey:@"ContentNotAuthorizedErrorDescription"];
      [v7 setObject:v12 forKey:*MEMORY[0x1E4F285A0]];

      id v13 = objc_alloc(MEMORY[0x1E4F28C58]);
      uint64_t v14 = 811;
    }
    else
    {
      id v15 = [(VUIStoreAuxMediaItem *)self fpsKeyError];
      uint64_t v16 = [v15 code];

      if (v16 == -345014)
      {
        BOOL v17 = [(VUIStoreAuxMediaItem *)self mediaItemMetadataForProperty:*MEMORY[0x1E4FA9E18]];
        char v18 = [(VUIStoreAuxMediaItem *)self mediaItemMetadataForProperty:*MEMORY[0x1E4FA9FB0]];
        if ([(VUIStoreAuxMediaItem *)self hasTrait:*MEMORY[0x1E4FAA180]])
        {
          uint64_t v19 = NSString;
          id v20 = +[VUILocalizationManager sharedInstance];
          uint64_t v21 = v20;
          unint64_t v22 = @"TOO_MANY_DEVICES_STREAMING_VIDEO_ERROR_FORMAT";
        }
        else
        {
          int v27 = [v18 isEqualToString:*MEMORY[0x1E4FAA200]];
          uint64_t v19 = NSString;
          id v20 = +[VUILocalizationManager sharedInstance];
          uint64_t v21 = v20;
          if (v27) {
            unint64_t v22 = @"TOO_MANY_DEVICES_STREAMING_EPISODE_ERROR_FORMAT";
          }
          else {
            unint64_t v22 = @"TOO_MANY_DEVICES_STREAMING_MOVIE_ERROR_FORMAT";
          }
        }
        uint64_t v30 = [v20 localizedStringForKey:v22];
        id v31 = [v19 localizedStringWithValidatedFormat:v30, @"%@", 0, v17 validFormatSpecifiers error];

        id v32 = NSString;
        id v33 = +[VUILocalizationManager sharedInstance];
        v34 = [v33 localizedStringForKey:@"TOO_MANY_DEVICES_STREAMING_TITLE_FORMAT"];
        id v35 = [v32 localizedStringWithValidatedFormat:v34, @"%@", 0, v17 validFormatSpecifiers error];

        [v7 setObject:v31 forKey:*MEMORY[0x1E4F285A0]];
        [v7 setObject:v35 forKey:*MEMORY[0x1E4F28568]];
        id v6 = (void *)[objc_alloc(MEMORY[0x1E4F28C58]) initWithDomain:@"TVPlaybackErrorDomain" code:810 userInfo:v7];

        goto LABEL_17;
      }
      BOOL v23 = [(VUIStoreAuxMediaItem *)self fpsKeyError];
      uint64_t v24 = [v23 code];

      if (v24 == -345023)
      {
        uint64_t v25 = +[VUILocalizationManager sharedInstance];
        uint64_t v26 = [v25 localizedStringForKey:@"VIDEO_UNAVAILABLE_IN_THIS_REGION_ERROR"];
        [v7 setObject:v26 forKey:*MEMORY[0x1E4F285A0]];

        id v13 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v14 = 828;
      }
      else
      {
        uint64_t v28 = [(VUIStoreAuxMediaItem *)self fpsKeyError];
        uint64_t v29 = [v28 code];

        id v13 = objc_alloc(MEMORY[0x1E4F28C58]);
        if (v29 == -345028) {
          uint64_t v14 = 827;
        }
        else {
          uint64_t v14 = 820;
        }
      }
    }
    id v6 = (void *)[v13 initWithDomain:@"TVPlaybackErrorDomain" code:v14 userInfo:v7];
    BOOL v17 = v4;
LABEL_17:
  }
  return v6;
}

- (id)_replacementErrorForITunesPlaybackError:(id)a3
{
  id v4 = (__CFString *)a3;
  uint64_t v5 = [(VUIStoreAuxMediaItem *)self fpsKeyError];

  id v6 = v4;
  if (v5)
  {
    id v7 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    [v7 setObject:MEMORY[0x1E4F1CC38] forKey:*MEMORY[0x1E4FAA140]];
    uint64_t v8 = [(VUIStoreAuxMediaItem *)self fpsKeyError];
    [v7 setObject:v8 forKey:*MEMORY[0x1E4F28A50]];

    int v9 = [(VUIStoreAuxMediaItem *)self fpsKeyError];
    if ([v9 code] == -345015)
    {
    }
    else
    {
      uint64_t v10 = [(VUIStoreAuxMediaItem *)self fpsKeyError];
      uint64_t v11 = [v10 code];

      if (v11 != -345017)
      {
        char v18 = [(VUIStoreAuxMediaItem *)self fpsKeyError];
        uint64_t v19 = [v18 code];

        if (v19 == -345014)
        {
          uint64_t v16 = [(VUIStoreAuxMediaItem *)self mediaItemMetadataForProperty:*MEMORY[0x1E4FAA0E8]];
          if (![(__CFString *)v16 length])
          {

            uint64_t v16 = &stru_1F3E921E0;
          }
          id v20 = NSString;
          uint64_t v21 = +[VUILocalizationManager sharedInstance];
          unint64_t v22 = [v21 localizedStringForKey:@"TOO_MANY_STREAMS_FORMAT_PURCHASE"];
          BOOL v23 = [v20 stringWithValidatedFormat:v22, @"%@", 0, v16 validFormatSpecifiers error];

          [v7 setObject:v23 forKey:*MEMORY[0x1E4F285A0]];
          id v24 = objc_alloc(MEMORY[0x1E4F28C58]);
          uint64_t v25 = 810;
        }
        else
        {
          uint64_t v26 = [(VUIStoreAuxMediaItem *)self fpsKeyError];
          uint64_t v27 = [v26 code];

          if (v27 != -345016)
          {
            id v31 = [(VUIStoreAuxMediaItem *)self fpsKeyError];
            uint64_t v32 = [v31 code];

            id v14 = objc_alloc(MEMORY[0x1E4F28C58]);
            if (v32 == -345028) {
              uint64_t v15 = 827;
            }
            else {
              uint64_t v15 = 820;
            }
            goto LABEL_6;
          }
          uint64_t v16 = [(VUIStoreAuxMediaItem *)self mediaItemMetadataForProperty:*MEMORY[0x1E4FAA0E8]];
          if (![(__CFString *)v16 length])
          {

            uint64_t v16 = &stru_1F3E921E0;
          }
          uint64_t v28 = NSString;
          uint64_t v29 = +[VUILocalizationManager sharedInstance];
          uint64_t v30 = [v29 localizedStringForKey:@"TOO_MANY_STREAMS_FORMAT"];
          BOOL v23 = [v28 stringWithValidatedFormat:v30, @"%@", 0, v16 validFormatSpecifiers error];

          [v7 setObject:v23 forKey:*MEMORY[0x1E4F285A0]];
          id v24 = objc_alloc(MEMORY[0x1E4F28C58]);
          uint64_t v25 = 812;
        }
        id v6 = (__CFString *)[v24 initWithDomain:@"TVPlaybackErrorDomain" code:v25 userInfo:v7];

        goto LABEL_7;
      }
    }
    uint64_t v12 = +[VUILocalizationManager sharedInstance];
    id v13 = [v12 localizedStringForKey:@"ContentNotAuthorizedErrorDescription"];
    [v7 setObject:v13 forKey:*MEMORY[0x1E4F285A0]];

    id v14 = objc_alloc(MEMORY[0x1E4F28C58]);
    uint64_t v15 = 811;
LABEL_6:
    id v6 = (__CFString *)[v14 initWithDomain:@"TVPlaybackErrorDomain" code:v15 userInfo:v7];
    uint64_t v16 = v4;
LABEL_7:
  }
  return v6;
}

- (void)updateBookmarkWithSuggestedTime:(double)a3 forElapsedTime:(double)a4 duration:(double)a5 playbackOfMediaItemIsEnding:(BOOL)a6
{
  uint64_t v10 = [(VUIStoreAuxMediaItem *)self bookmark];

  if (v10)
  {
    uint64_t v11 = [(VUIStoreAuxMediaItem *)self bookmark];
    [v11 setBookmarkTime:a3];

    uint64_t v12 = [(VUIStoreAuxMediaItem *)self bookmark];
    id v13 = [MEMORY[0x1E4F1C9C8] date];
    [v12 setBookmarkTimestamp:v13];

    [MEMORY[0x1E4FA9D90] playedThresholdTimeForDuration:a5];
    double v15 = v14;
    if ([(VUIStoreAuxMediaItem *)self isFamilySharingContent])
    {
      id v16 = objc_alloc(MEMORY[0x1E4F31A68]);
      BOOL v17 = [(VUIStoreAuxMediaItem *)self bookmarkID];
      id v37 = (id)[v16 initWithUbiquitousIdentifier:v17];

      [v37 setBookmarkTime:a3];
      [v37 setBookmarkTimestamp:CFAbsoluteTimeGetCurrent()];
      char v18 = [MEMORY[0x1E4F31A60] sharedUbiquitousPlaybackPositionController];
      [v18 persistPlaybackPositionMetadataEntity:v37 isCheckpoint:0 completion:0];
    }
    else
    {
      id v37 = +[VideosExtrasBookmarkController sharedInstance];
      char v18 = [(VUIStoreAuxMediaItem *)self bookmark];
      id v24 = [v18 key];
      uint64_t v25 = [v24 identifier];
      [v37 pushBookmarkForIdentifier:v25 bookmarkTime:v15 <= a4 playedToNominalLength:a4];
    }
  }
  else
  {
    uint64_t v19 = [(VUIStoreAuxMediaItem *)self videoManagedObject];

    if (!v19) {
      return;
    }
    id v37 = [MEMORY[0x1E4F1C9C8] date];
    char v18 = [(VUIStoreAuxMediaItem *)self mediaItemMetadataForProperty:*MEMORY[0x1E4FA9F00]];
    uint64_t v20 = [(VUIStoreAuxMediaItem *)self mediaItemMetadataForProperty:*MEMORY[0x1E4FA9EF8]];
    uint64_t v21 = (void *)v20;
    if (v18) {
      BOOL v22 = v20 == 0;
    }
    else {
      BOOL v22 = 1;
    }
    if (v22)
    {
      BOOL v23 = 0;
    }
    else
    {
      [v18 doubleValue];
      double v27 = fmax(a3 - v26, 0.0);
      [v21 doubleValue];
      if (v27 >= v28)
      {
        [v21 doubleValue];
        double v27 = v29;
      }
      BOOL v23 = [MEMORY[0x1E4F28ED0] numberWithDouble:v27];
    }
    uint64_t v30 = [(VUIStoreAuxMediaItem *)self videoManagedObject];
    id v31 = [MEMORY[0x1E4F28ED0] numberWithDouble:a3];
    [v30 setBookmarkTime:v31];

    uint64_t v32 = [(VUIStoreAuxMediaItem *)self videoManagedObject];
    [v32 setBookmarkTimeStamp:v37];

    id v33 = [(VUIStoreAuxMediaItem *)self videoManagedObject];
    [v33 setMainContentRelativeBookmarkTime:v23];

    v34 = [(VUIStoreAuxMediaItem *)self videoManagedObject];
    [v34 setMainContentRelativeBookmarkTimeStamp:v37];

    id v35 = +[VUIMediaLibraryManager defaultManager];
    v36 = [v35 sidebandMediaLibrary];
    [v36 saveChangesToManagedObjects];
  }
}

- (void)cleanUpMediaItem
{
  uint64_t v3 = [(VUIStoreAuxMediaItem *)self storeFPSKeyLoader];
  [v3 sendStreamingStopRequestIfNecessary];

  [(VUIStoreAuxMediaItem *)self setPlaybackType:0];
  [(VUIStoreAuxMediaItem *)self setMediaItemMetadata:0 forProperty:*MEMORY[0x1E4FAA148]];
  [(VUIStoreAuxMediaItem *)self setBookmark:0];
  id v4 = [(VUIStoreAuxMediaItem *)self scrubPlayer];

  if (v4)
  {
    uint64_t v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
    uint64_t v6 = *MEMORY[0x1E4FAA408];
    id v7 = [(VUIStoreAuxMediaItem *)self scrubPlayer];
    [v5 removeObserver:self name:v6 object:v7];

    uint64_t v8 = [(VUIStoreAuxMediaItem *)self scrubPlayer];
    [v8 invalidate];

    [(VUIStoreAuxMediaItem *)self setScrubPlayer:0];
  }
  [(VUIStoreAuxMediaItem *)self setParentReportingToken:0];
}

- (void)mediaItem:(id)a3 errorDidOccur:(id)a4 player:(id)a5
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = [v6 domain];
  if (![v7 isEqualToString:*MEMORY[0x1E4F15AC0]])
  {
LABEL_16:

    goto LABEL_17;
  }
  uint64_t v8 = [v6 code];

  if (v8 == -11800)
  {
    int v9 = [v6 userInfo];
    id v7 = [v9 objectForKey:*MEMORY[0x1E4F28A50]];

    if ([v7 code] == -42803 || objc_msgSend(v7, "code") == -42799)
    {
      uint64_t v10 = [(VUIStoreAuxMediaItem *)self videoManagedObject];

      if (v10)
      {
        uint64_t v11 = sLogObject_23;
        if (os_log_type_enabled((os_log_t)sLogObject_23, OS_LOG_TYPE_ERROR)) {
          -[VUIStoreAuxMediaItem mediaItem:errorDidOccur:player:](v11, v12, v13, v14, v15, v16, v17, v18);
        }
        long long v32 = 0u;
        long long v33 = 0u;
        long long v30 = 0u;
        long long v31 = 0u;
        uint64_t v19 = [(VUIStoreAuxMediaItem *)self videoManagedObject];
        uint64_t v20 = [v19 fpsKeyInfo];

        uint64_t v21 = [v20 countByEnumeratingWithState:&v30 objects:v34 count:16];
        if (v21)
        {
          uint64_t v22 = v21;
          uint64_t v23 = *(void *)v31;
          do
          {
            for (uint64_t i = 0; i != v22; ++i)
            {
              if (*(void *)v31 != v23) {
                objc_enumerationMutation(v20);
              }
              uint64_t v25 = *(void **)(*((void *)&v30 + 1) + 8 * i);
              [v25 setIsInvalid:1];
              double v26 = [MEMORY[0x1E4F1C9C8] distantPast];
              [v25 setRenewalDate:v26];
            }
            uint64_t v22 = [v20 countByEnumeratingWithState:&v30 objects:v34 count:16];
          }
          while (v22);
        }

        double v27 = +[VUIMediaLibraryManager defaultManager];
        double v28 = [v27 sidebandMediaLibrary];
        [v28 saveChangesToManagedObjects];

        double v29 = +[VUIOfflineKeyRenewalManager sharedInstance];
        [v29 updateKeyRenewalAndExpiration];
      }
    }
    goto LABEL_16;
  }
LABEL_17:
}

- (void)mediaItem:(id)a3 didChangeFromPlaybackState:(id)a4 toPlaybackState:(id)a5 updatedRate:(double)a6 player:(id)a7
{
  id v13 = a4;
  id v9 = a5;
  id v10 = [MEMORY[0x1E4FA9D88] stopped];
  uint64_t v11 = v13;
  if (v10 != v13)
  {
    id v12 = [MEMORY[0x1E4FA9D88] stopped];

    if (v12 != v9) {
      goto LABEL_5;
    }
    uint64_t v11 = [(VUIStoreAuxMediaItem *)self storeFPSKeyLoader];
    [v11 sendStreamingStopRequestIfNecessary];
  }

LABEL_5:
}

- (void)loadFairPlayStreamingKeyRequests:(id)a3
{
}

- (void)loadFairPlayStreamingKeyRequests:(id)a3 completion:(id)a4
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v34 = a4;
  id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v36 = v6;
  if ([(VUIStoreAuxMediaItem *)self playbackType] == 2)
  {
    long long v45 = 0u;
    long long v46 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    id v8 = v6;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v43 objects:v50 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v44;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v44 != v11) {
            objc_enumerationMutation(v8);
          }
          id v13 = *(void **)(*((void *)&v43 + 1) + 8 * i);
          if (objc_msgSend(v13, "type", v34))
          {
            if ([v13 type] == 2)
            {
              uint64_t v14 = [(VUIStoreAuxMediaItem *)self _offlineKeyDataForKeyRequest:v13];
              uint64_t v15 = sSecureKeyDeliveryLogObject_0;
              if (v14)
              {
                if (os_log_type_enabled((os_log_t)sSecureKeyDeliveryLogObject_0, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138412290;
                  v49 = v13;
                  _os_log_impl(&dword_1E2BD7000, v15, OS_LOG_TYPE_DEFAULT, "Using existing offline key data for request %@", buf, 0xCu);
                }
                [v13 setKeyResponseData:v14];
                [v13 finish];
              }
              else
              {
                if (os_log_type_enabled((os_log_t)sSecureKeyDeliveryLogObject_0, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 138412290;
                  v49 = v13;
                  _os_log_error_impl(&dword_1E2BD7000, v15, OS_LOG_TYPE_ERROR, "Offline key data does not exist for request %@", buf, 0xCu);
                }
                [v7 addObject:v13];
              }
            }
            else
            {
              [v7 addObject:v13];
            }
          }
          else
          {
            [v13 finishByRequestingOfflineKeysIfPossible];
          }
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v43 objects:v50 count:16];
      }
      while (v10);
    }

    id v6 = v36;
  }
  else
  {
    [v7 addObjectsFromArray:v6];
  }
  if (objc_msgSend(v7, "count", v34))
  {
    uint64_t v16 = [(VUIStoreAuxMediaItem *)self storeFPSKeyLoader];

    if (!v16)
    {
      uint64_t v17 = [(VUIStoreAuxMediaItem *)self fpsCertificateURL];
      uint64_t v18 = [(VUIStoreAuxMediaItem *)self fpsKeyServerURL];
      uint64_t v19 = [[VUIStoreFPSKeyLoader alloc] initWithCertificateURL:v17 keyServerURL:v18];
      [(VUIStoreFPSKeyLoader *)v19 setSendsMescalHeader:[(VUIStoreAuxMediaItem *)self sendsMescalHeaderToPlaybackKeyServer]];
      [(VUIStoreFPSKeyLoader *)v19 setSendsLocationWhenOptedIn:[(VUIStoreAuxMediaItem *)self sendsLocationToPlaybackKeyServerWhenOptedIn]];
      if ([(VUIStoreAuxMediaItem *)self hasTrait:*MEMORY[0x1E4FAA190]])
      {
        uint64_t v20 = [(VUIStoreAuxMediaItem *)self mediaItemMetadataForProperty:*MEMORY[0x1E4FAA018]];
        [(VUIStoreFPSKeyLoader *)v19 setRentalID:v20];
        [(VUIStoreFPSKeyLoader *)v19 setDidSkipRentalCheckout:1];
      }
      uint64_t v21 = [(VUIStoreAuxMediaItem *)self mediaItemMetadataForProperty:*MEMORY[0x1E4FAA148]];
      [(VUIStoreFPSKeyLoader *)v19 setEventCollection:v21];

      [(VUIStoreFPSKeyLoader *)v19 setDelegate:self];
      [(VUIStoreAuxMediaItem *)self setStoreFPSKeyLoader:v19];
    }
    uint64_t v22 = [(VUIStoreAuxMediaItem *)self fpsAdditionalServerParams];
    long long v39 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    id v23 = v7;
    uint64_t v24 = [v23 countByEnumeratingWithState:&v39 objects:v47 count:16];
    if (v24)
    {
      uint64_t v25 = v24;
      uint64_t v26 = *(void *)v40;
      uint64_t v27 = *MEMORY[0x1E4FAA0D8];
      do
      {
        for (uint64_t j = 0; j != v25; ++j)
        {
          if (*(void *)v40 != v26) {
            objc_enumerationMutation(v23);
          }
          double v29 = *(void **)(*((void *)&v39 + 1) + 8 * j);
          [v29 setAdditionalRequestParams:v22];
          long long v30 = [(VUIStoreAuxMediaItem *)self mediaItemMetadataForProperty:v27];
          [v29 setAdamID:v30];
        }
        uint64_t v25 = [v23 countByEnumeratingWithState:&v39 objects:v47 count:16];
      }
      while (v25);
    }

    long long v31 = sLogObject_23;
    if (os_log_type_enabled((os_log_t)sLogObject_23, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1E2BD7000, v31, OS_LOG_TYPE_DEFAULT, "Keeping media item alive until key response(s) are received", buf, 2u);
    }
    long long v32 = [(VUIStoreAuxMediaItem *)self storeFPSKeyLoader];
    v37[0] = MEMORY[0x1E4F143A8];
    v37[1] = 3221225472;
    v37[2] = __68__VUIStoreAuxMediaItem_loadFairPlayStreamingKeyRequests_completion___block_invoke;
    v37[3] = &unk_1E6DF4AD0;
    v37[4] = self;
    long long v33 = v35;
    uint64_t v38 = v35;
    [v32 loadFairPlayStreamingKeyRequests:v23 completion:v37];

    id v6 = v36;
  }
  else
  {
    long long v33 = v35;
    if (v35) {
      v35[2](v35);
    }
  }
}

uint64_t __68__VUIStoreAuxMediaItem_loadFairPlayStreamingKeyRequests_completion___block_invoke(uint64_t a1)
{
  os_log_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = [v2 storeFPSKeyLoader];
  [v2 _keepKeyLoaderAlive:v3];

  id v4 = sLogObject_23;
  if (os_log_type_enabled((os_log_t)sLogObject_23, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl(&dword_1E2BD7000, v4, OS_LOG_TYPE_DEFAULT, "Received response for key request(s)", v6, 2u);
  }
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)updateOfflineKeyWithIdentifier:(id)a3 updatedOfflineKeyData:(id)a4
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = sLogObject_23;
  if (os_log_type_enabled((os_log_t)sLogObject_23, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v36 = v6;
    _os_log_impl(&dword_1E2BD7000, v8, OS_LOG_TYPE_DEFAULT, "Offline key data was updated for video with playback expiration policy.  Key identifier is %@", buf, 0xCu);
  }
  uint64_t v9 = [(VUIStoreAuxMediaItem *)self videoManagedObject];
  uint64_t v10 = v9;
  if (v6 && v9)
  {
    uint64_t v11 = [v7 length];

    if (v11)
    {
      id v12 = +[VUIMediaLibraryManager defaultManager];
      id v13 = [v12 sidebandMediaLibrary];
      uint64_t v14 = [(VUIStoreAuxMediaItem *)self videoManagedObject];
      uint64_t v15 = [v13 fpsKeyInfoForVideo:v14 keyURI:v6 createIfNeeded:0 wasCreated:0];

      uint64_t v16 = [MEMORY[0x1E4F1C9C8] date];
      long long v33 = v15;
      uint64_t v17 = [v15 playbackDuration];
      id v34 = v7;
      if (v17)
      {
        uint64_t v18 = v17;
        [v17 doubleValue];
        uint64_t v19 = v16;
        uint64_t v20 = objc_msgSend(v16, "dateByAddingTimeInterval:");
      }
      else
      {
        uint64_t v18 = 0;
        uint64_t v19 = v16;
        uint64_t v20 = 0;
      }
      uint64_t v21 = [MEMORY[0x1E4F28EB8] defaultCenter];
      uint64_t v22 = [(VUIStoreAuxMediaItem *)self videoManagedObject];
      id v23 = [v22 objectID];
      [v21 postNotificationName:@"VUIVideoManagedObjectPlaybackExpirationWillChangeNotification" object:v23];

      uint64_t v24 = (void *)sLogObject_23;
      if (os_log_type_enabled((os_log_t)sLogObject_23, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v25 = v24;
        [v18 doubleValue];
        *(_DWORD *)buf = 138412802;
        id v36 = v19;
        __int16 v37 = 2112;
        uint64_t v38 = v20;
        __int16 v39 = 2048;
        uint64_t v40 = v26;
        _os_log_impl(&dword_1E2BD7000, v25, OS_LOG_TYPE_DEFAULT, "Updating playback start date to %@, expiration date to %@ based on playback duration %f", buf, 0x20u);
      }
      id v7 = v34;
      if (v20) {
        [v33 setExpirationDate:v20];
      }
      [v33 setPlaybackExpirationStartDate:v19];
      [v33 setKeyData:v34];
      uint64_t v27 = +[VUIMediaLibraryManager defaultManager];
      double v28 = [v27 sidebandMediaLibrary];
      [v28 saveChangesToManagedObjects];

      double v29 = +[VUIOfflineKeyRenewalManager sharedInstance];
      [v29 updateKeyRenewalAndExpiration];

      if (_os_feature_enabled_impl())
      {
        long long v30 = [MEMORY[0x1E4F28EB8] defaultCenter];
        long long v31 = [(VUIStoreAuxMediaItem *)self videoManagedObject];
        long long v32 = [v31 objectID];
        [v30 postNotificationName:@"VUIVideoManagedObjectPlaybackExpirationDidChangeNotification" object:v32];
      }
      goto LABEL_19;
    }
  }
  else
  {
  }
  if (os_log_type_enabled((os_log_t)sLogObject_23, OS_LOG_TYPE_ERROR)) {
    -[VUIStoreAuxMediaItem updateOfflineKeyWithIdentifier:updatedOfflineKeyData:]();
  }
LABEL_19:
}

- (void)storeFPSKeyLoader:(id)a3 willFailWithError:(id)a4 forKeyRequest:(id)a5
{
  v23[2] = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = [(VUIStoreAuxMediaItem *)self fpsKeyError];

  if (!v7)
  {
    [(VUIStoreAuxMediaItem *)self setFpsKeyError:v6];
    if (TVPErrorIsFatalSKDError())
    {
      if ([v6 code] != -345015)
      {
        id v8 = v6;
        id v9 = [v8 domain];
        if ([v9 isEqualToString:*MEMORY[0x1E4FAA418]])
        {
          uint64_t v10 = [v8 code];

          if (v10 != -345018)
          {
LABEL_8:
            uint64_t v14 = *MEMORY[0x1E4FAA138];
            v22[0] = *MEMORY[0x1E4FAA140];
            v22[1] = v14;
            v23[0] = MEMORY[0x1E4F1CC38];
            v23[1] = v8;
            uint64_t v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v23 forKeys:v22 count:2];
            uint64_t v16 = [MEMORY[0x1E4F28EB8] defaultCenter];
            [v16 postNotificationName:*MEMORY[0x1E4FAA130] object:self userInfo:v15];

            goto LABEL_9;
          }
          id v9 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
          [v9 setObject:v8 forKey:*MEMORY[0x1E4F28A50]];
          uint64_t v11 = +[VUILocalizationManager sharedInstance];
          id v12 = [v11 localizedStringForKey:@"SignInToWatchThisVideoErrorDescription"];
          [v9 setObject:v12 forKey:*MEMORY[0x1E4F285A0]];

          uint64_t v13 = [objc_alloc(MEMORY[0x1E4F28C58]) initWithDomain:@"TVPlaybackErrorDomain" code:813 userInfo:v9];
          [(VUIStoreAuxMediaItem *)self setFpsKeyError:0];
          id v8 = (id)v13;
        }

        goto LABEL_8;
      }
    }
  }
LABEL_9:
  if ([(VUIStoreAuxMediaItem *)self playbackType] == 2)
  {
    uint64_t v17 = *MEMORY[0x1E4FAA138];
    v20[0] = *MEMORY[0x1E4FAA140];
    v20[1] = v17;
    v21[0] = MEMORY[0x1E4F1CC38];
    v21[1] = v6;
    uint64_t v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v21 forKeys:v20 count:2];
    uint64_t v19 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v19 postNotificationName:*MEMORY[0x1E4FAA130] object:self userInfo:v18];
  }
}

- (void)storeFPSKeyLoader:(id)a3 didLoadOfflineKeyData:(id)a4 forKeyRequest:(id)a5
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  id v8 = a5;
  id v9 = [v8 keyIdentifier];
  uint64_t v10 = [(VUIStoreAuxMediaItem *)self videoManagedObject];
  if (!v10 || !v9)
  {
LABEL_10:

    goto LABEL_11;
  }
  uint64_t v11 = [v7 length];

  if (v11)
  {
    id v12 = sLogObject_23;
    if (os_log_type_enabled((os_log_t)sLogObject_23, OS_LOG_TYPE_DEFAULT))
    {
      int v26 = 138412290;
      id v27 = v8;
      _os_log_impl(&dword_1E2BD7000, v12, OS_LOG_TYPE_DEFAULT, "Saving offline key data to database: %@", (uint8_t *)&v26, 0xCu);
    }
    uint64_t v13 = +[VUIMediaLibraryManager defaultManager];
    uint64_t v14 = [v13 sidebandMediaLibrary];
    uint64_t v15 = [(VUIStoreAuxMediaItem *)self videoManagedObject];
    uint64_t v10 = [v14 fpsKeyInfoForVideo:v15 keyURI:v9 createIfNeeded:1 wasCreated:0];

    uint64_t v16 = [(VUIStoreAuxMediaItem *)self videoManagedObject];
    [v10 populateFromKeyRequest:v8 video:v16];

    uint64_t v17 = +[VUIMediaLibraryManager defaultManager];
    uint64_t v18 = [v17 sidebandMediaLibrary];
    [v18 saveChangesToManagedObjects];

    uint64_t v19 = +[VUIOfflineKeyRenewalManager sharedInstance];
    [v19 updateKeyRenewalAndExpiration];

    uint64_t v20 = [(VUIStoreAuxMediaItem *)self videoManagedObject];
    uint64_t v21 = [v20 downloadState];

    if (!v21)
    {
      uint64_t v22 = sLogObject_23;
      if (os_log_type_enabled((os_log_t)sLogObject_23, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v26) = 0;
        _os_log_impl(&dword_1E2BD7000, v22, OS_LOG_TYPE_DEFAULT, "Offline keys received for an item that is no longer downloading or downloaded.  Invalidating keys.", (uint8_t *)&v26, 2u);
      }
      id v23 = +[VUIMediaLibraryManager defaultManager];
      uint64_t v24 = [v23 sidebandMediaLibrary];
      uint64_t v25 = [(VUIStoreAuxMediaItem *)self videoManagedObject];
      [v24 removeDownloadedMediaForVideoManagedObject:v25 markAsDeleted:0 invalidateImmediately:1];
    }
    goto LABEL_10;
  }
LABEL_11:
}

- (void)_scrubPlayerItemDidLoad:(id)a3
{
  id v4 = [(VUIStoreAuxMediaItem *)self scrubPlayer];
  id v5 = [v4 unqueuedPlayerItem];

  [(VUIStoreAuxMediaItem *)self setMediaItemMetadata:v5 forProperty:*MEMORY[0x1E4FAA050]];
}

- (id)_offlineKeyDataForKeyRequest:(id)a3
{
  id v4 = a3;
  if ([(VUIStoreAuxMediaItem *)self ignoreExistingOfflineKeyData])
  {
    id v5 = 0;
  }
  else
  {
    id v6 = [v4 keyIdentifier];
    id v7 = [(VUIStoreAuxMediaItem *)self videoManagedObject];

    id v5 = 0;
    if (v7 && v6)
    {
      id v8 = +[VUIMediaLibraryManager defaultManager];
      id v9 = [v8 sidebandMediaLibrary];
      uint64_t v10 = [(VUIStoreAuxMediaItem *)self videoManagedObject];
      uint64_t v11 = [v9 fpsKeyInfoForVideo:v10 keyURI:v6 createIfNeeded:0 wasCreated:0];

      id v5 = [v11 keyData];
    }
  }

  return v5;
}

- (NSURL)streamingOverrideURLForDownload
{
  return self->_streamingOverrideURLForDownload;
}

- (void)setStreamingOverrideURLForDownload:(id)a3
{
}

- (NSURL)fpsCertificateURL
{
  return self->_fpsCertificateURL;
}

- (void)setFpsCertificateURL:(id)a3
{
}

- (NSURL)fpsKeyServerURL
{
  return self->_fpsKeyServerURL;
}

- (void)setFpsKeyServerURL:(id)a3
{
}

- (NSDictionary)fpsAdditionalServerParams
{
  return self->_fpsAdditionalServerParams;
}

- (void)setFpsAdditionalServerParams:(id)a3
{
}

- (BOOL)isAudioOnly
{
  return self->_isAudioOnly;
}

- (void)setIsAudioOnly:(BOOL)a3
{
  self->_isAudioOnly = a3;
}

- (NSString)bookmarkID
{
  return self->_bookmarkID;
}

- (void)setBookmarkID:(id)a3
{
}

- (BOOL)disableResumeMenu
{
  return self->_disableResumeMenu;
}

- (void)setDisableResumeMenu:(BOOL)a3
{
  self->_disableResumeMenu = a3;
}

- (BOOL)disableScrubbing
{
  return self->_disableScrubbing;
}

- (void)setDisableScrubbing:(BOOL)a3
{
  self->_disableScrubbing = a3;
}

- (BOOL)isiTunesPurchasedOrRentedContent
{
  return self->_isiTunesPurchasedOrRentedContent;
}

- (void)setIsiTunesPurchasedOrRentedContent:(BOOL)a3
{
  self->_isiTunesPurchasedOrRentedContent = a3;
}

- (BOOL)ignoreExistingOfflineKeyData
{
  return self->_ignoreExistingOfflineKeyData;
}

- (void)setIgnoreExistingOfflineKeyData:(BOOL)a3
{
  self->_ignoreExistingOfflineKeyData = a3;
}

- (BOOL)isFamilySharingContent
{
  return self->_isFamilySharingContent;
}

- (void)setIsFamilySharingContent:(BOOL)a3
{
  self->_isFamilySharingContent = a3;
}

- (BOOL)isLiveContent
{
  return self->_isLiveContent;
}

- (void)setIsLiveContent:(BOOL)a3
{
  self->_isLiveContent = a3;
}

- (BOOL)isSportingEvent
{
  return self->_isSportingEvent;
}

- (void)setIsSportingEvent:(BOOL)a3
{
  self->_isSportingEvent = a3;
}

- (unint64_t)playbackContext
{
  return self->_playbackContext;
}

- (void)setPlaybackContext:(unint64_t)a3
{
  self->_playbackContext = a3;
}

- (BOOL)sendsLocationToPlaybackKeyServerWhenOptedIn
{
  return self->_sendsLocationToPlaybackKeyServerWhenOptedIn;
}

- (void)setSendsLocationToPlaybackKeyServerWhenOptedIn:(BOOL)a3
{
  self->_sendsLocationToPlaybackKeyServerWhenOptedIn = a3;
}

- (BOOL)sendsMescalHeaderToPlaybackKeyServer
{
  return self->_sendsMescalHeaderToPlaybackKeyServer;
}

- (void)setSendsMescalHeaderToPlaybackKeyServer:(BOOL)a3
{
  self->_sendsMescalHeaderToPlaybackKeyServer = a3;
}

- (BOOL)ignoreStartOverParam
{
  return self->_ignoreStartOverParam;
}

- (void)setIgnoreStartOverParam:(BOOL)a3
{
  self->_ignoreStartOverParam = a3;
}

- (NSURL)url
{
  return self->_url;
}

- (void)setUrl:(id)a3
{
}

- (VUIMutableBookmark)bookmark
{
  return self->_bookmark;
}

- (void)setBookmark:(id)a3
{
}

- (TVPPlayer)scrubPlayer
{
  return self->_scrubPlayer;
}

- (void)setScrubPlayer:(id)a3
{
}

- (VUIStoreFPSKeyLoader)storeFPSKeyLoader
{
  return self->_storeFPSKeyLoader;
}

- (void)setStoreFPSKeyLoader:(id)a3
{
}

- (NSError)fpsKeyError
{
  return self->_fpsKeyError;
}

- (void)setFpsKeyError:(id)a3
{
}

- (NSObject)parentReportingToken
{
  return self->_parentReportingToken;
}

- (void)setParentReportingToken:(id)a3
{
}

- (int64_t)playbackType
{
  return self->_playbackType;
}

- (void)setPlaybackType:(int64_t)a3
{
  self->_playbackType = a3;
}

- (BOOL)isHLS
{
  return self->_isHLS;
}

- (void)setIsHLS:(BOOL)a3
{
  self->_isHLS = a3;
}

- (VUIVideoManagedObject)videoManagedObject
{
  return self->_videoManagedObject;
}

- (void)setVideoManagedObject:(id)a3
{
}

- (BOOL)isForStartingDownload
{
  return self->_isForStartingDownload;
}

- (void)setIsForStartingDownload:(BOOL)a3
{
  self->_isForStartingDownload = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_videoManagedObject, 0);
  objc_storeStrong((id *)&self->_parentReportingToken, 0);
  objc_storeStrong((id *)&self->_fpsKeyError, 0);
  objc_storeStrong((id *)&self->_storeFPSKeyLoader, 0);
  objc_storeStrong((id *)&self->_scrubPlayer, 0);
  objc_storeStrong((id *)&self->_bookmark, 0);
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_bookmarkID, 0);
  objc_storeStrong((id *)&self->_fpsAdditionalServerParams, 0);
  objc_storeStrong((id *)&self->_fpsKeyServerURL, 0);
  objc_storeStrong((id *)&self->_fpsCertificateURL, 0);
  objc_storeStrong((id *)&self->_streamingOverrideURLForDownload, 0);
}

- (void)initWithVideoManagedObject:isForStartingDownload:.cold.1()
{
  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_2_4(&dword_1E2BD7000, v0, v1, "Unable to deserialize vpafMetrics: %@", v2, v3, v4, v5, v6);
}

- (void)initWithVideoManagedObject:(uint64_t)a3 isForStartingDownload:(uint64_t)a4 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)prepareForLoadingWithCompletion:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)mediaItem:(uint64_t)a3 errorDidOccur:(uint64_t)a4 player:(uint64_t)a5 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)updateOfflineKeyWithIdentifier:updatedOfflineKeyData:.cold.1()
{
  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_2_4(&dword_1E2BD7000, v0, v1, "Unable to save offline key data for %@", v2, v3, v4, v5, v6);
}

@end