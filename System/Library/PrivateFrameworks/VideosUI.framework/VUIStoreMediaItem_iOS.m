@interface VUIStoreMediaItem_iOS
+ (void)initialize;
- (BOOL)_loadingCancelled:(unint64_t)a3;
- (BOOL)_url:(id)a3 hasSameAdamIDAsURL:(id)a4;
- (BOOL)hasTrait:(id)a3;
- (BOOL)isEqualToMediaItem:(id)a3;
- (BOOL)isForStartingDownload;
- (BOOL)needsRentalCheckin;
- (BOOL)needsRentalCheckoutPriorToPlayback;
- (BOOL)shouldRetryPlaybackForError:(id)a3;
- (BOOL)useSidebandLibraryForPlaybackKeys;
- (NSDictionary)fpsAdditionalServerParams;
- (NSDictionary)sinfsDict;
- (NSError)fpsKeyError;
- (NSNumber)downloadToken;
- (NSNumber)fileSize;
- (NSObject)parentReportingToken;
- (NSURL)downloadDestinationURL;
- (NSURL)fpsCertificateURL;
- (NSURL)fpsKeyServerURL;
- (NSURL)hlsPlaybackURL;
- (NSURL)playbackURL;
- (VUIStoreDownloadMonitor)downloadMonitor;
- (VUIStoreFPSKeyLoader)storeFPSKeyLoader;
- (VUIStoreMediaItem_iOS)initWithAdamID:(int64_t)a3 videoManagedObject:(id)a4 isForStartingDownload:(BOOL)a5;
- (VUIStoreMediaItem_iOS)initWithMPMediaItem:(id)a3 videoManagedObject:(id)a4 isForStartingDownload:(BOOL)a5;
- (VUIVideoManagedObject)videoManagedObject;
- (id)_downloadForThisMediaItemReturningDownloadManager:(id *)a3;
- (id)_hlsURLEnsuringDsidQueryParamIsPresentFromURL:(id)a3;
- (id)_iTunesStoreContentInfo;
- (id)_iTunesStoreContentPurchasedMediaKind;
- (id)_offlineKeyDataForKeyRequest:(id)a3;
- (id)_rentalEndDate;
- (id)_rentalExpirationDate;
- (id)_rentalPlaybackEndDate;
- (id)_videoPlaybackTypeDescription;
- (id)mediaItemMetadataForProperty:(id)a3;
- (id)replacementErrorForPlaybackError:(id)a3;
- (int64_t)playbackType;
- (unint64_t)loadingContext;
- (unint64_t)playbackContext;
- (void)_checkInRental;
- (void)_checkoutRentalWithCheckoutType:(unint64_t)a3 startPlaybackClock:(BOOL)a4 completion:(id)a5;
- (void)_configureForDownloadingWithCompletion:(id)a3;
- (void)_configureForLocalPlaybackWithURL:(id)a3 completion:(id)a4;
- (void)_configureForPlaybackFromExistingDownload:(id)a3 downloadManager:(id)a4 completion:(id)a5;
- (void)_configureForStreamingPlaybackWithCompletion:(id)a3;
- (void)_deleteDownloadKeyCookieForURL:(id)a3;
- (void)_externalPlaybackTypeDidChange:(id)a3;
- (void)_performRedownloadWithType:(int64_t)a3 completion:(id)a4;
- (void)_persistOfflineKeyData:(id)a3 forKeyRequest:(id)a4;
- (void)_setDownloadKeyCookieWithURL:(id)a3 downloadKey:(id)a4;
- (void)_updateRentalPlaybackStartDate:(id)a3;
- (void)cleanUpMediaItem;
- (void)dealloc;
- (void)loadFairPlayStreamingKeyRequests:(id)a3;
- (void)loadFairPlayStreamingKeyRequests:(id)a3 completion:(id)a4;
- (void)mediaItemAllInitialLoadingComplete:(id)a3 totalTime:(double)a4 player:(id)a5;
- (void)prepareForLoadingWithCompletion:(id)a3;
- (void)prepareForPlaybackInitiationWithCompletion:(id)a3;
- (void)processFinishedDownloadWithCompletion:(id)a3;
- (void)resetReportingEventCollection;
- (void)setDownloadDestinationURL:(id)a3;
- (void)setDownloadMonitor:(id)a3;
- (void)setDownloadToken:(id)a3;
- (void)setFileSize:(id)a3;
- (void)setFpsAdditionalServerParams:(id)a3;
- (void)setFpsCertificateURL:(id)a3;
- (void)setFpsKeyError:(id)a3;
- (void)setFpsKeyServerURL:(id)a3;
- (void)setHlsPlaybackURL:(id)a3;
- (void)setIsForStartingDownload:(BOOL)a3;
- (void)setLoadingContext:(unint64_t)a3;
- (void)setMediaItemMetadata:(id)a3 forProperty:(id)a4;
- (void)setNeedsRentalCheckin:(BOOL)a3;
- (void)setNeedsRentalCheckoutPriorToPlayback:(BOOL)a3;
- (void)setParentReportingToken:(id)a3;
- (void)setPlaybackContext:(unint64_t)a3;
- (void)setPlaybackType:(int64_t)a3;
- (void)setPlaybackURL:(id)a3;
- (void)setSinfsDict:(id)a3;
- (void)setStoreFPSKeyLoader:(id)a3;
- (void)setUseSidebandLibraryForPlaybackKeys:(BOOL)a3;
- (void)setVideoManagedObject:(id)a3;
- (void)storeFPSKeyLoader:(id)a3 didLoadOfflineKeyData:(id)a4 forKeyRequest:(id)a5;
- (void)storeFPSKeyLoader:(id)a3 didReceiveUpdatedRentalExpirationDate:(id)a4 playbackStartDate:(id)a5;
- (void)storeFPSKeyLoader:(id)a3 willFailWithError:(id)a4 forKeyRequest:(id)a5;
- (void)updateBookmarkWithSuggestedTime:(double)a3 forElapsedTime:(double)a4 duration:(double)a5 playbackOfMediaItemIsEnding:(BOOL)a6;
@end

@implementation VUIStoreMediaItem_iOS

+ (void)initialize
{
  if (initialize_onceToken_7 != -1) {
    dispatch_once(&initialize_onceToken_7, &__block_literal_global_95);
  }
}

- (VUIStoreMediaItem_iOS)initWithAdamID:(int64_t)a3 videoManagedObject:(id)a4 isForStartingDownload:(BOOL)a5
{
  BOOL v5 = a5;
  v8 = (void *)MEMORY[0x1E4F31928];
  v9 = (void *)MEMORY[0x1E4F28ED0];
  id v10 = a4;
  v11 = [v9 numberWithLongLong:a3];
  v12 = objc_msgSend(v8, "vui_mediaItemForStoreIdentifier:", v11);

  v13 = [(VUIStoreMediaItem_iOS *)self initWithMPMediaItem:v12 videoManagedObject:v10 isForStartingDownload:v5];
  return v13;
}

- (VUIStoreMediaItem_iOS)initWithMPMediaItem:(id)a3 videoManagedObject:(id)a4 isForStartingDownload:(BOOL)a5
{
  id v9 = a4;
  v37.receiver = self;
  v37.super_class = (Class)VUIStoreMediaItem_iOS;
  id v10 = [(VUILibraryMediaItem_iOS *)&v37 initWithMPMediaItem:a3];
  if (v10)
  {
    id v11 = objc_alloc_init(MEMORY[0x1E4FA9D78]);
    [v11 addStartEventWithName:*MEMORY[0x1E4FAA370]];
    [v11 addStartEventWithName:*MEMORY[0x1E4FAA388]];
    [(VUIStoreMediaItem_iOS *)v10 setMediaItemMetadata:v11 forProperty:*MEMORY[0x1E4FAA148]];
    v12 = objc_msgSend(MEMORY[0x1E4F179C8], "ams_sharedAccountStore");
    v13 = objc_msgSend(v12, "ams_activeiTunesAccount");
    v14 = objc_msgSend(v13, "ams_DSID");
    [(VUIStoreMediaItem_iOS *)v10 setMediaItemMetadata:v14 forProperty:*MEMORY[0x1E4FA9E70]];

    v10->_isForStartingDownload = a5;
    if (v9)
    {
      objc_storeStrong((id *)&v10->_videoManagedObject, a4);
      uint64_t v15 = [v9 fpsCertificateURL];
      fpsCertificateURL = v10->_fpsCertificateURL;
      v10->_fpsCertificateURL = (NSURL *)v15;

      uint64_t v17 = [v9 fpsKeyServerURL];
      fpsKeyServerURL = v10->_fpsKeyServerURL;
      v10->_fpsKeyServerURL = (NSURL *)v17;

      uint64_t v19 = [v9 additionalFPSRequestParams];
      fpsAdditionalServerParams = v10->_fpsAdditionalServerParams;
      v10->_fpsAdditionalServerParams = (NSDictionary *)v19;

      v21 = [v9 bookmarkTime];
      v22 = [v9 bookmarkTimeStamp];
      v23 = [v9 mainContentRelativeBookmarkTime];
      v24 = [v9 mainContentRelativeBookmarkTimeStamp];
      if (v21)
      {
        v25 = [[VUIMediaStartTimeInfo alloc] initWithStartTime:v21 timestamp:v22 type:0 source:@"Sideband Library"];
        v26 = [(VUIBaseMediaItem *)v10 startTimeCollection];
        [v26 addStartTimeInfo:v25];
      }
      if (v23)
      {
        v27 = [[VUIMediaStartTimeInfo alloc] initWithStartTime:v23 timestamp:v24 type:1 source:@"Sideband Library"];
        v28 = [(VUIBaseMediaItem *)v10 startTimeCollection];
        [v28 addStartTimeInfo:v27];
      }
      uint64_t v31 = MEMORY[0x1E4F143A8];
      uint64_t v32 = 3221225472;
      v33 = __86__VUIStoreMediaItem_iOS_initWithMPMediaItem_videoManagedObject_isForStartingDownload___block_invoke;
      v34 = &unk_1E6DF3F68;
      v35 = v10;
      id v36 = v9;
      [(TVPBaseMediaItem *)v35 performMediaItemMetadataTransactionWithBlock:&v31];
    }
    v29 = objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter", v31, v32, v33, v34);
    [v29 addObserver:v10 selector:sel__externalPlaybackTypeDidChange_ name:*MEMORY[0x1E4FAA3F8] object:0];
  }
  return v10;
}

- (void)dealloc
{
  v3 = sLogObject_14;
  if (os_log_type_enabled((os_log_t)sLogObject_14, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1E2BD7000, v3, OS_LOG_TYPE_DEFAULT, "VUIStoreMediaItem_iOS deallocated", buf, 2u);
  }
  v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v4 removeObserver:self];

  v5.receiver = self;
  v5.super_class = (Class)VUIStoreMediaItem_iOS;
  [(VUIStoreMediaItem_iOS *)&v5 dealloc];
}

- (void)resetReportingEventCollection
{
  id v3 = objc_alloc_init(MEMORY[0x1E4FA9D78]);
  [v3 addStartEventWithName:*MEMORY[0x1E4FAA370]];
  [v3 addStartEventWithName:*MEMORY[0x1E4FAA388]];
  [(VUIStoreMediaItem_iOS *)self setMediaItemMetadata:v3 forProperty:*MEMORY[0x1E4FAA148]];
}

- (BOOL)isEqualToMediaItem:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)VUIStoreMediaItem_iOS;
  if ([(VUILibraryMediaItem_iOS *)&v8 isEqualToMediaItem:v4]
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    BOOL v5 = [(VUIStoreMediaItem_iOS *)self isForStartingDownload];
    int v6 = v5 ^ [v4 isForStartingDownload] ^ 1;
  }
  else
  {
    LOBYTE(v6) = 0;
  }

  return v6;
}

- (BOOL)hasTrait:(id)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([v4 isEqualToString:*MEMORY[0x1E4FAA1A0]]) {
    goto LABEL_4;
  }
  if ([v4 isEqualToString:*MEMORY[0x1E4FAA170]]) {
    goto LABEL_9;
  }
  if ([v4 isEqualToString:*MEMORY[0x1E4FAA1B0]])
  {
LABEL_4:
    BOOL v5 = [(VUIStoreMediaItem_iOS *)self playbackType] == 2;
    goto LABEL_5;
  }
  if ([v4 isEqualToString:*MEMORY[0x1E4FAA1A8]])
  {
LABEL_9:
    unsigned __int8 v6 = 1;
    goto LABEL_10;
  }
  if (![v4 isEqualToString:*MEMORY[0x1E4FAA1D0]])
  {
    uint64_t v8 = *MEMORY[0x1E4FAA190];
    if ([v4 isEqualToString:*MEMORY[0x1E4FAA190]])
    {
      id v9 = [(VUILibraryMediaItem_iOS *)self ml3Track];

      if (v9)
      {
        id v10 = [(VUILibraryMediaItem_iOS *)self ml3Track];
        id v11 = [v10 valueForProperty:*MEMORY[0x1E4F79758]];
        unsigned __int8 v6 = [v11 BOOLValue];
LABEL_16:

LABEL_33:
        goto LABEL_10;
      }
      v22 = [(VUIStoreMediaItem_iOS *)self videoManagedObject];

      if (v22)
      {
        id v10 = [(VUIStoreMediaItem_iOS *)self videoManagedObject];
        v23 = [v10 rentalID];
        unsigned __int8 v6 = v23 != 0;

        goto LABEL_33;
      }
      v24 = [(VUIStoreMediaItem_iOS *)self mediaItemMetadataForProperty:*MEMORY[0x1E4FAA018]];
LABEL_40:
      unsigned __int8 v6 = v24 != 0;

      goto LABEL_10;
    }
    if ([v4 isEqualToString:*MEMORY[0x1E4FAA150]])
    {
      v12 = [(VUILibraryMediaItem_iOS *)self ml3Track];

      if (v12)
      {
        v13 = [(VUILibraryMediaItem_iOS *)self ml3Track];
        v14 = [v13 valueForProperty:*MEMORY[0x1E4F79678]];
        char v15 = [v14 BOOLValue];

        unsigned __int8 v6 = v15 ^ 1;
        goto LABEL_10;
      }
    }
    else
    {
      if ([v4 isEqualToString:*MEMORY[0x1E4FAA1C8]]) {
        goto LABEL_9;
      }
      if (![v4 isEqualToString:VUIMediaItemTraitStopWhenPausedForTooLong])
      {
        if (![v4 isEqualToString:*MEMORY[0x1E4FAA188]])
        {
          v29.receiver = self;
          v29.super_class = (Class)VUIStoreMediaItem_iOS;
          unsigned __int8 v6 = [(VUILibraryMediaItem_iOS *)&v29 hasTrait:v4];
          goto LABEL_10;
        }
        uint64_t v25 = [(VUIStoreMediaItem_iOS *)self videoManagedObject];
        if (v25)
        {
          v26 = (void *)v25;
          v27 = [(VUIStoreMediaItem_iOS *)self videoManagedObject];
          uint64_t v28 = [v27 downloadState];

          if (v28 == 2) {
            goto LABEL_9;
          }
        }
        v24 = [(VUILibraryMediaItem_iOS *)self _localPlaybackFilePathURL];
        goto LABEL_40;
      }
      if ([(VUIStoreMediaItem_iOS *)self hasTrait:v8]
        && ([(VUIStoreMediaItem_iOS *)self playbackType] == 2
         || [(VUIStoreMediaItem_iOS *)self playbackType] == 1))
      {
        id v10 = [(VUIStoreMediaItem_iOS *)self mediaItemMetadataForProperty:*MEMORY[0x1E4FAA010]];
        if (!v10)
        {
          unsigned __int8 v6 = 0;
          goto LABEL_33;
        }
        v16 = sLogObject_14;
        if (os_log_type_enabled((os_log_t)sLogObject_14, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v31 = v10;
          _os_log_impl(&dword_1E2BD7000, v16, OS_LOG_TYPE_DEFAULT, "Evaluating for VUIMediaItemTraitStopWhenPausedForTooLong.  Rental expiration is %@", buf, 0xCu);
        }
        uint64_t v17 = [MEMORY[0x1E4F1C9C8] date];
        id v11 = [v17 dateByAddingTimeInterval:3600.0];

        v18 = [v10 laterDate:v11];

        uint64_t v19 = sLogObject_14;
        BOOL v20 = os_log_type_enabled((os_log_t)sLogObject_14, OS_LOG_TYPE_DEFAULT);
        unsigned __int8 v6 = v18 == v10;
        if (v6)
        {
          if (!v20) {
            goto LABEL_16;
          }
          *(_WORD *)buf = 0;
          v21 = "Rental is not expired and not expiring in the next hour.  Will stop after being paused for too long to a"
                "llow other devices to play rental.";
        }
        else
        {
          if (!v20) {
            goto LABEL_16;
          }
          *(_WORD *)buf = 0;
          v21 = "Rental is either expired or expiring in the next hour.  Will not stop after being paused for too long";
        }
        _os_log_impl(&dword_1E2BD7000, v19, OS_LOG_TYPE_DEFAULT, v21, buf, 2u);
        goto LABEL_16;
      }
    }
    unsigned __int8 v6 = 0;
    goto LABEL_10;
  }
  BOOL v5 = [(VUIStoreMediaItem_iOS *)self playbackType] == 1;
LABEL_5:
  unsigned __int8 v6 = v5;
LABEL_10:

  return v6;
}

- (id)mediaItemMetadataForProperty:(id)a3
{
  id v4 = a3;
  if ([v4 isEqualToString:*MEMORY[0x1E4FA9F38]])
  {
    id v5 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    unsigned __int8 v6 = +[VUIStoreAuxMediaItem mediaUserAgent];
    v7 = [(VUIStoreMediaItem_iOS *)self mediaItemMetadataForProperty:*MEMORY[0x1E4FA9E70]];
    uint64_t v8 = [v7 stringValue];

    if ([(VUISidebandMediaEntityImageLoadParams *)v6 length]) {
      [v5 setObject:v6 forKey:@"User-Agent"];
    }
    if ([v8 length]) {
      [v5 setObject:v8 forKey:@"X-Dsid"];
    }
    [v5 setObject:@"https://tv.apple.com" forKey:@"Referer"];
    if (![v5 count])
    {

      id v5 = 0;
    }

    goto LABEL_9;
  }
  uint64_t v9 = *MEMORY[0x1E4FAA0D8];
  if (([v4 isEqualToString:*MEMORY[0x1E4FAA0D8]] & 1) != 0
    || [v4 isEqualToString:*MEMORY[0x1E4FA9ED8]])
  {
    id v10 = [(VUILibraryMediaItem_iOS *)self mpMediaItem];

    if (v10)
    {
      id v11 = [(VUILibraryMediaItem_iOS *)self mpMediaItem];
      v12 = [v11 valueForProperty:*MEMORY[0x1E4F31500]];

      if ([(VUISidebandMediaEntityImageLoadParams *)v12 longLongValue])
      {
        uint64_t v13 = [(VUISidebandMediaEntityImageLoadParams *)v12 stringValue];
LABEL_17:
        id v5 = (id)v13;
LABEL_144:

        goto LABEL_145;
      }
LABEL_143:
      id v5 = 0;
      goto LABEL_144;
    }
    v14 = [(VUIStoreMediaItem_iOS *)self videoManagedObject];

    if (v14)
    {
      v12 = [(VUIStoreMediaItem_iOS *)self videoManagedObject];
      uint64_t v13 = [(VUISidebandMediaEntityImageLoadParams *)v12 adamID];
      goto LABEL_17;
    }
    v130.receiver = self;
    v130.super_class = (Class)VUIStoreMediaItem_iOS;
    [(VUILibraryMediaItem_iOS *)&v130 mediaItemMetadataForProperty:v9];
    goto LABEL_25;
  }
  if ([v4 isEqualToString:*MEMORY[0x1E4FA9DE0]])
  {
    if ([(VUIStoreMediaItem_iOS *)self playbackType] == 1)
    {
      id v15 = [(VUIStoreMediaItem_iOS *)self sinfsDict];
LABEL_30:
      id v5 = v15;
      goto LABEL_145;
    }
    goto LABEL_166;
  }
  if ([v4 isEqualToString:*MEMORY[0x1E4FA9F08]])
  {
    id v15 = [(VUIStoreMediaItem_iOS *)self fileSize];
    goto LABEL_30;
  }
  if ([v4 isEqualToString:*MEMORY[0x1E4FA9EA8]])
  {
    id v15 = [(VUIStoreMediaItem_iOS *)self downloadToken];
    goto LABEL_30;
  }
  if ([v4 isEqualToString:*MEMORY[0x1E4FA9E90]])
  {
    id v15 = [(VUIStoreMediaItem_iOS *)self downloadDestinationURL];
    goto LABEL_30;
  }
  uint64_t v16 = *MEMORY[0x1E4FAA018];
  if ([v4 isEqualToString:*MEMORY[0x1E4FAA018]])
  {
    v129.receiver = self;
    v129.super_class = (Class)VUIStoreMediaItem_iOS;
    id v5 = [(VUILibraryMediaItem_iOS *)&v129 mediaItemMetadataForProperty:v16];
    if (v5) {
      goto LABEL_145;
    }
    uint64_t v17 = [(VUILibraryMediaItem_iOS *)self ml3Track];

    if (!v17)
    {
      id v5 = [(VUIStoreMediaItem_iOS *)self videoManagedObject];

      if (!v5) {
        goto LABEL_145;
      }
      v12 = [(VUIStoreMediaItem_iOS *)self videoManagedObject];
      uint64_t v13 = [(VUISidebandMediaEntityImageLoadParams *)v12 rentalID];
      goto LABEL_17;
    }
    v18 = [(VUILibraryMediaItem_iOS *)self ml3Track];
    uint64_t v19 = [v18 valueForProperty:*MEMORY[0x1E4F79758]];
    int v20 = [v19 BOOLValue];

    if (v20)
    {
      v21 = [(VUILibraryMediaItem_iOS *)self ml3Track];
      v12 = v21;
      v22 = (void *)MEMORY[0x1E4F79980];
LABEL_46:
      uint64_t v13 = [(VUISidebandMediaEntityImageLoadParams *)v21 valueForProperty:*v22];
      goto LABEL_17;
    }
LABEL_166:
    id v5 = 0;
    goto LABEL_145;
  }
  if ([v4 isEqualToString:*MEMORY[0x1E4FAA070]])
  {
    uint64_t v23 = [(VUIStoreMediaItem_iOS *)self mediaItemMetadataForProperty:*MEMORY[0x1E4FA9FB0]];
    unsigned __int8 v6 = (VUISidebandMediaEntityImageLoadParams *)v23;
    if (v23 == *MEMORY[0x1E4FAA1F8])
    {
      BOOL v26 = [(VUIStoreMediaItem_iOS *)self isForStartingDownload];
      v27 = VUIStoreMediaItemRTCServiceIdentifierMovieRental_iOS_cloud;
      uint64_t v28 = VUIStoreMediaItemRTCServiceIdentifierMovieRental_iOS_download;
    }
    else if (v23 == *MEMORY[0x1E4FAA1E8])
    {
      BOOL v26 = [(VUIStoreMediaItem_iOS *)self isForStartingDownload];
      v27 = VUIStoreMediaItemRTCServiceIdentifierMoviePurchase_iOS_cloud;
      uint64_t v28 = VUIStoreMediaItemRTCServiceIdentifierMoviePurchase_iOS_download;
    }
    else
    {
      if (v23 != *MEMORY[0x1E4FAA200])
      {
LABEL_40:
        id v5 = 0;
LABEL_9:

        goto LABEL_145;
      }
      BOOL v26 = [(VUIStoreMediaItem_iOS *)self isForStartingDownload];
      v27 = VUIStoreMediaItemRTCServiceIdentifierTVShowPurchase_iOS_cloud;
      uint64_t v28 = VUIStoreMediaItemRTCServiceIdentifierTVShowPurchase_iOS_download;
    }
    if (v26) {
      v27 = v28;
    }
    v33 = *v27;
LABEL_59:
    id v5 = v33;
    goto LABEL_9;
  }
  if ([v4 isEqualToString:*MEMORY[0x1E4FAA128]])
  {
    id v15 = [(VUIStoreMediaItem_iOS *)self _iTunesStoreContentInfo];
    goto LABEL_30;
  }
  uint64_t v24 = *MEMORY[0x1E4FA9E20];
  if ([v4 isEqualToString:*MEMORY[0x1E4FA9E20]])
  {
    uint64_t v25 = [(VUILibraryMediaItem_iOS *)self ml3Track];

    if (v25)
    {
      v21 = [(VUILibraryMediaItem_iOS *)self ml3Track];
      v12 = v21;
      v22 = (void *)MEMORY[0x1E4F799B8];
      goto LABEL_46;
    }
    objc_super v37 = [(VUIStoreMediaItem_iOS *)self videoManagedObject];

    if (v37)
    {
      v12 = [(VUIStoreMediaItem_iOS *)self videoManagedObject];
      uint64_t v13 = [(VUISidebandMediaEntityImageLoadParams *)v12 buyParams];
      goto LABEL_17;
    }
    v128.receiver = self;
    v128.super_class = (Class)VUIStoreMediaItem_iOS;
    [(VUILibraryMediaItem_iOS *)&v128 mediaItemMetadataForProperty:v24];
LABEL_25:
    id v15 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_30;
  }
  if ([v4 isEqualToString:*MEMORY[0x1E4FA9EF0]])
  {
    objc_super v29 = [(VUILibraryMediaItem_iOS *)self ml3Track];
    unsigned __int8 v6 = [v29 valueForProperty:*MEMORY[0x1E4F79958]];

    if (![(VUISidebandMediaEntityImageLoadParams *)v6 length]) {
      goto LABEL_40;
    }
    v30 = [(VUILibraryMediaItem_iOS *)self ml3Track];
    uint64_t v31 = [v30 valueForProperty:*MEMORY[0x1E4F79758]];
    char v32 = [v31 BOOLValue];

    if (v32) {
      goto LABEL_40;
    }
    v33 = (__CFString *)[objc_alloc(MEMORY[0x1E4F1CB10]) initWithString:v6];
    goto LABEL_59;
  }
  if ([v4 isEqualToString:*MEMORY[0x1E4FAA0D0]])
  {
    v12 = [(VUIStoreMediaItem_iOS *)self mediaItemMetadataForProperty:*MEMORY[0x1E4FA9E70]];
    if (!v12) {
      goto LABEL_143;
    }
    v34 = objc_msgSend(MEMORY[0x1E4F179C8], "ams_sharedAccountStore");
    v35 = objc_msgSend(v34, "ams_iTunesAccountWithDSID:", v12);
    uint64_t v36 = objc_msgSend(v35, "ams_storefront");
    goto LABEL_63;
  }
  if ([v4 isEqualToString:*MEMORY[0x1E4FAA010]])
  {
    id v15 = [(VUIStoreMediaItem_iOS *)self _rentalExpirationDate];
    goto LABEL_30;
  }
  if ([v4 isEqualToString:*MEMORY[0x1E4FAA020]])
  {
    v38 = [(VUILibraryMediaItem_iOS *)self ml3Track];

    if (!v38)
    {
      id v5 = &unk_1F3F3E688;
      goto LABEL_145;
    }
    v21 = [(VUILibraryMediaItem_iOS *)self ml3Track];
    v12 = v21;
    v22 = (void *)MEMORY[0x1E4F79808];
    goto LABEL_46;
  }
  uint64_t v39 = *MEMORY[0x1E4FA9E10];
  if ([v4 isEqualToString:*MEMORY[0x1E4FA9E10]])
  {
    id v15 = (id)*MEMORY[0x1E4FB5200];
    goto LABEL_30;
  }
  if ([v4 isEqualToString:*MEMORY[0x1E4FA9FA0]])
  {
    int64_t v40 = [(VUIStoreMediaItem_iOS *)self playbackType];
    if ((unint64_t)(v40 - 1) > 5) {
      uint64_t v41 = 0;
    }
    else {
      uint64_t v41 = qword_1E38FDF70[v40 - 1];
    }
    id v15 = [MEMORY[0x1E4F28ED0] numberWithInteger:v41];
    goto LABEL_30;
  }
  v42 = (__CFString *)*MEMORY[0x1E4FAA028];
  if ([v4 isEqualToString:*MEMORY[0x1E4FAA028]])
  {
    v43 = [(VUILibraryMediaItem_iOS *)self ml3Track];

    if (v43)
    {
      v44 = [(VUILibraryMediaItem_iOS *)self ml3Track];
      v45 = [v44 valueForProperty:*MEMORY[0x1E4F79810]];
      [v45 doubleValue];
      double v47 = v46;

      if (v47 != 0.0)
      {
        id v15 = (id)[objc_alloc(MEMORY[0x1E4F1C9C8]) initWithTimeIntervalSinceReferenceDate:v47];
        goto LABEL_30;
      }
      goto LABEL_166;
    }
    v52 = [(VUIStoreMediaItem_iOS *)self videoManagedObject];

    if (v52)
    {
      v12 = [(VUIStoreMediaItem_iOS *)self videoManagedObject];
      uint64_t v13 = [(VUISidebandMediaEntityImageLoadParams *)v12 rentalPlaybackStartDate];
      goto LABEL_17;
    }
    v127[0] = self;
    v127[1] = VUIStoreMediaItem_iOS;
    v53 = (objc_super *)v127;
    goto LABEL_102;
  }
  if ([v4 isEqualToString:*MEMORY[0x1E4FA9DD8]])
  {
    unsigned __int8 v6 = (VUISidebandMediaEntityImageLoadParams *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    v48 = [(VUIStoreMediaItem_iOS *)self mediaItemMetadataForProperty:*MEMORY[0x1E4FA9FA8]];
    if ([v48 count])
    {
      [(VUISidebandMediaEntityImageLoadParams *)v6 addEntriesFromDictionary:v48];
      v49 = [(VUIStoreMediaItem_iOS *)self mediaItemMetadataForProperty:v39];
      if ([v49 length]) {
        [(VUISidebandMediaEntityImageLoadParams *)v6 setObject:v49 forKey:*MEMORY[0x1E4F16100]];
      }
    }
    if ([(VUISidebandMediaEntityImageLoadParams *)v6 count]) {
      id v5 = (id)[(VUISidebandMediaEntityImageLoadParams *)v6 copy];
    }
    else {
      id v5 = 0;
    }
    goto LABEL_100;
  }
  uint64_t v50 = *MEMORY[0x1E4FAA068];
  if ([v4 isEqualToString:*MEMORY[0x1E4FAA068]])
  {
    v51 = [(VUILibraryMediaItem_iOS *)self mpMediaItem];

    if (v51)
    {
      v21 = [(VUILibraryMediaItem_iOS *)self mpMediaItem];
      v12 = v21;
      v22 = (void *)MEMORY[0x1E4F314A8];
      goto LABEL_46;
    }
    v57 = [(VUIStoreMediaItem_iOS *)self videoManagedObject];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) == 0)
    {
      v126.receiver = self;
      v126.super_class = (Class)VUIStoreMediaItem_iOS;
      [(VUILibraryMediaItem_iOS *)&v126 mediaItemMetadataForProperty:v50];
      goto LABEL_25;
    }
    v12 = [(VUIStoreMediaItem_iOS *)self videoManagedObject];
    v34 = [(VUISidebandMediaEntityImageLoadParams *)v12 series];
    uint64_t v59 = [v34 title];
    goto LABEL_111;
  }
  if ([v4 isEqualToString:*MEMORY[0x1E4FA9EA0]])
  {
    v12 = [(VUIStoreMediaItem_iOS *)self videoManagedObject];
    uint64_t v13 = [(VUISidebandMediaEntityImageLoadParams *)v12 downloadTaskIdentifier];
    goto LABEL_17;
  }
  if ([v4 isEqualToString:*MEMORY[0x1E4FA9E98]])
  {
    v54 = [(VUIStoreMediaItem_iOS *)self videoManagedObject];
    v12 = v54;
    if (!v54) {
      goto LABEL_143;
    }
    v34 = [(VUISidebandMediaEntityImageLoadParams *)v54 downloadQOSMetricsJSONData];
    if (![v34 length])
    {
      id v5 = 0;
      goto LABEL_64;
    }
    id v125 = 0;
    v55 = [MEMORY[0x1E4F28D90] JSONObjectWithData:v34 options:0 error:&v125];
    id v56 = v125;
    if (v55)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v5 = v55;
LABEL_137:

        goto LABEL_64;
      }
      BOOL v79 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR);
      if (v79) {
        -[VUIStoreMediaItem_iOS mediaItemMetadataForProperty:](v79, v80, v81, v82, v83, v84, v85, v86);
      }
    }
    else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      -[VUIStoreMediaItem_iOS mediaItemMetadataForProperty:]();
    }
    id v5 = 0;
    goto LABEL_137;
  }
  uint64_t v60 = *MEMORY[0x1E4FAA0E8];
  if ([v4 isEqualToString:*MEMORY[0x1E4FAA0E8]])
  {
    v61 = [(VUILibraryMediaItem_iOS *)self ml3Track];
    id v5 = [v61 valueForProperty:*MEMORY[0x1E4F799F0]];

    if (![v5 length])
    {
      v62 = [(VUIStoreMediaItem_iOS *)self videoManagedObject];
      uint64_t v63 = [v62 title];

      id v5 = (id)v63;
    }
    if (![v5 length])
    {
      v124.receiver = self;
      v124.super_class = (Class)VUIStoreMediaItem_iOS;
      id v64 = [(VUILibraryMediaItem_iOS *)&v124 mediaItemMetadataForProperty:v60];
LABEL_152:
      id v95 = v64;

      id v5 = v95;
      goto LABEL_145;
    }
    goto LABEL_145;
  }
  uint64_t v65 = *MEMORY[0x1E4FA9FB0];
  if ([v4 isEqualToString:*MEMORY[0x1E4FA9FB0]])
  {
    v123.receiver = self;
    v123.super_class = (Class)VUIStoreMediaItem_iOS;
    id v5 = [(VUILibraryMediaItem_iOS *)&v123 mediaItemMetadataForProperty:v65];
    if ([v5 length]) {
      goto LABEL_145;
    }
    v66 = [(VUIStoreMediaItem_iOS *)self videoManagedObject];
    objc_opt_class();
    char v67 = objc_opt_isKindOfClass();

    if (v67)
    {
      v68 = (id *)MEMORY[0x1E4FAA200];
    }
    else
    {
      v91 = [(VUIStoreMediaItem_iOS *)self videoManagedObject];
      objc_opt_class();
      char v92 = objc_opt_isKindOfClass();

      if ((v92 & 1) == 0) {
        goto LABEL_145;
      }
      v93 = [(VUIStoreMediaItem_iOS *)self videoManagedObject];
      v94 = [v93 rentalID];

      v68 = (id *)MEMORY[0x1E4FAA1F8];
      if (!v94) {
        v68 = (id *)MEMORY[0x1E4FAA1E8];
      }
    }
    goto LABEL_151;
  }
  uint64_t v69 = *MEMORY[0x1E4FA9DF8];
  if ([v4 isEqualToString:*MEMORY[0x1E4FA9DF8]])
  {
    v122.receiver = self;
    v122.super_class = (Class)VUIStoreMediaItem_iOS;
    id v5 = [(VUILibraryMediaItem_iOS *)&v122 mediaItemMetadataForProperty:v69];
    if (v5) {
      goto LABEL_145;
    }
    id v5 = [(VUIStoreMediaItem_iOS *)self videoManagedObject];

    if (!v5) {
      goto LABEL_145;
    }
    v70 = [VUISidebandMediaEntityImageLoadParams alloc];
    v71 = [(VUIStoreMediaItem_iOS *)self videoManagedObject];
    v72 = v70;
    v73 = v71;
    uint64_t v74 = 0;
    goto LABEL_133;
  }
  uint64_t v75 = *MEMORY[0x1E4FA9DF0];
  if ([v4 isEqualToString:*MEMORY[0x1E4FA9DF0]])
  {
    v121.receiver = self;
    v121.super_class = (Class)VUIStoreMediaItem_iOS;
    id v5 = [(VUILibraryMediaItem_iOS *)&v121 mediaItemMetadataForProperty:v75];
    if (v5) {
      goto LABEL_145;
    }
    id v5 = [(VUIStoreMediaItem_iOS *)self videoManagedObject];

    if (!v5) {
      goto LABEL_145;
    }
    v76 = [VUISidebandMediaEntityImageLoadParams alloc];
    v71 = [(VUIStoreMediaItem_iOS *)self videoManagedObject];
    v72 = v76;
    v73 = v71;
    uint64_t v74 = 1;
LABEL_133:
    unsigned __int8 v6 = [(VUISidebandMediaEntityImageLoadParams *)v72 initWithVideoManagedObject:v73 imageType:v74];

    id v77 = objc_alloc(MEMORY[0x1E4FA9CA0]);
    v48 = +[VUIMediaLibraryManager defaultManager];
    v78 = [v48 sidebandMediaLibrary];
    id v5 = (id)[v77 initWithObject:v6 imageLoader:v78 groupType:0];

LABEL_100:
    goto LABEL_9;
  }
  if ([v4 isEqualToString:@"VUIMediaItemMetadataArtworkEpisodePreviewVUIImageProxy"])
  {
    v120.receiver = self;
    v120.super_class = (Class)VUIStoreMediaItem_iOS;
    id v5 = [(VUILibraryMediaItem_iOS *)&v120 mediaItemMetadataForProperty:@"VUIMediaItemMetadataArtworkEpisodePreviewVUIImageProxy"];
    if (!v5)
    {
      id v5 = [(VUIStoreMediaItem_iOS *)self videoManagedObject];

      if (v5)
      {
        v87 = [VUISidebandMediaEntityImageLoadParams alloc];
        v88 = [(VUIStoreMediaItem_iOS *)self videoManagedObject];
        v12 = [(VUISidebandMediaEntityImageLoadParams *)v87 initWithVideoManagedObject:v88 imageType:1];

        if (!v12) {
          goto LABEL_143;
        }
        id v89 = objc_alloc(MEMORY[0x1E4FB3CD0]);
        v34 = +[VUIMediaLibraryManager defaultManager];
        v35 = [v34 sidebandMediaLibrary];
        uint64_t v36 = [v89 initWithObject:v12 imageLoader:v35 groupType:0];
LABEL_63:
        id v5 = (id)v36;

LABEL_64:
        goto LABEL_144;
      }
    }
    goto LABEL_145;
  }
  v42 = @"VUIMediaItemMetadataPostPlayVUIImageProxy";
  if ([v4 isEqualToString:@"VUIMediaItemMetadataPostPlayVUIImageProxy"])
  {
    v96 = [(VUIStoreMediaItem_iOS *)self videoManagedObject];

    if (!v96) {
      goto LABEL_157;
    }
    v97 = [VUISidebandMediaEntityImageLoadParams alloc];
    v98 = [(VUIStoreMediaItem_iOS *)self videoManagedObject];
    v99 = [(VUISidebandMediaEntityImageLoadParams *)v97 initWithVideoManagedObject:v98 imageType:2];

    if (!v99) {
      goto LABEL_157;
    }
    id v100 = objc_alloc(MEMORY[0x1E4FB3CD0]);
    v101 = +[VUIMediaLibraryManager defaultManager];
    v102 = [v101 sidebandMediaLibrary];
    id v5 = (id)[v100 initWithObject:v99 imageLoader:v102 groupType:0];

    if (!v5)
    {
LABEL_157:
      v119[0] = self;
      v119[1] = VUIStoreMediaItem_iOS;
      v53 = (objc_super *)v119;
LABEL_102:
      [(objc_super *)v53 mediaItemMetadataForProperty:v42];
      goto LABEL_25;
    }
    goto LABEL_145;
  }
  uint64_t v103 = *MEMORY[0x1E4FA9EC0];
  if ([v4 isEqualToString:*MEMORY[0x1E4FA9EC0]])
  {
    v118.receiver = self;
    v118.super_class = (Class)VUIStoreMediaItem_iOS;
    id v5 = [(VUILibraryMediaItem_iOS *)&v118 mediaItemMetadataForProperty:v103];
    if (v5) {
      goto LABEL_145;
    }
    v104 = [(VUIStoreMediaItem_iOS *)self videoManagedObject];
    objc_opt_class();
    char v105 = objc_opt_isKindOfClass();

    if (v105)
    {
      v12 = [(VUIStoreMediaItem_iOS *)self videoManagedObject];
      uint64_t v13 = [(VUISidebandMediaEntityImageLoadParams *)v12 episodeNumberInSeries];
      goto LABEL_17;
    }
    goto LABEL_166;
  }
  uint64_t v106 = *MEMORY[0x1E4FAA060];
  if ([v4 isEqualToString:*MEMORY[0x1E4FAA060]])
  {
    v117.receiver = self;
    v117.super_class = (Class)VUIStoreMediaItem_iOS;
    id v5 = [(VUILibraryMediaItem_iOS *)&v117 mediaItemMetadataForProperty:v106];
    if (v5) {
      goto LABEL_145;
    }
    v107 = [(VUIStoreMediaItem_iOS *)self videoManagedObject];
    objc_opt_class();
    char v108 = objc_opt_isKindOfClass();

    if ((v108 & 1) == 0) {
      goto LABEL_166;
    }
    v12 = [(VUIStoreMediaItem_iOS *)self videoManagedObject];
    v34 = [(VUISidebandMediaEntityImageLoadParams *)v12 season];
    uint64_t v59 = [v34 seasonNumber];
LABEL_111:
    id v5 = (id)v59;
    goto LABEL_64;
  }
  uint64_t v109 = *MEMORY[0x1E4FA9E60];
  if ([v4 isEqualToString:*MEMORY[0x1E4FA9E60]])
  {
    v116.receiver = self;
    v116.super_class = (Class)VUIStoreMediaItem_iOS;
    id v5 = [(VUILibraryMediaItem_iOS *)&v116 mediaItemMetadataForProperty:v109];
    if (!v5)
    {
      v12 = [(VUIStoreMediaItem_iOS *)self videoManagedObject];
      uint64_t v13 = [(VUISidebandMediaEntityImageLoadParams *)v12 contentRatingRank];
      goto LABEL_17;
    }
    goto LABEL_145;
  }
  uint64_t v110 = *MEMORY[0x1E4FA9E48];
  if (![v4 isEqualToString:*MEMORY[0x1E4FA9E48]])
  {
    v114.receiver = self;
    v114.super_class = (Class)VUIStoreMediaItem_iOS;
    [(VUILibraryMediaItem_iOS *)&v114 mediaItemMetadataForProperty:v4];
    goto LABEL_25;
  }
  v115.receiver = self;
  v115.super_class = (Class)VUIStoreMediaItem_iOS;
  id v5 = [(VUILibraryMediaItem_iOS *)&v115 mediaItemMetadataForProperty:v110];
  if (![v5 length])
  {
    v111 = [(VUIStoreMediaItem_iOS *)self videoManagedObject];

    if (v111)
    {
      v112 = [(VUIStoreMediaItem_iOS *)self videoManagedObject];
      objc_opt_class();
      char v113 = objc_opt_isKindOfClass();

      v68 = (id *)MEMORY[0x1E4FA9E58];
      if ((v113 & 1) == 0) {
        v68 = (id *)MEMORY[0x1E4FA9E50];
      }
LABEL_151:
      id v64 = *v68;
      goto LABEL_152;
    }
  }
LABEL_145:

  return v5;
}

- (void)setMediaItemMetadata:(id)a3 forProperty:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v7 isEqualToString:*MEMORY[0x1E4FA9E98]])
  {
    uint64_t v8 = [(VUIStoreMediaItem_iOS *)self videoManagedObject];
    if (v8)
    {
      id v9 = v6;
      if ([v9 count] && objc_msgSend(MEMORY[0x1E4F28D90], "isValidJSONObject:", v9))
      {
        id v15 = 0;
        id v10 = [MEMORY[0x1E4F28D90] dataWithJSONObject:v9 options:0 error:&v15];
        id v11 = v15;
        if ([v10 length])
        {
          [v8 setDownloadQOSMetricsJSONData:v10];
          v12 = +[VUIMediaLibraryManager defaultManager];
          uint64_t v13 = [v12 sidebandMediaLibrary];
          [v13 saveChangesToManagedObjects];
        }
        else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
        {
          -[VUIStoreMediaItem_iOS setMediaItemMetadata:forProperty:]();
        }
      }
    }
  }
  else
  {
    v14.receiver = self;
    v14.super_class = (Class)VUIStoreMediaItem_iOS;
    [(TVPBaseMediaItem *)&v14 setMediaItemMetadata:v6 forProperty:v7];
  }
}

- (void)prepareForLoadingWithCompletion:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __57__VUIStoreMediaItem_iOS_prepareForLoadingWithCompletion___block_invoke;
  v7[3] = &unk_1E6DF9540;
  id v5 = v4;
  id v8 = v5;
  objc_copyWeak(&v9, &location);
  v6.receiver = self;
  v6.super_class = (Class)VUIStoreMediaItem_iOS;
  [(VUILibraryMediaItem_iOS *)&v6 prepareForLoadingWithCompletion:v7];
  objc_destroyWeak(&v9);

  objc_destroyWeak(&location);
}

- (void)prepareForPlaybackInitiationWithCompletion:(id)a3
{
  id v4 = a3;
  if ([(VUIStoreMediaItem_iOS *)self hasTrait:*MEMORY[0x1E4FAA190]])
  {
    objc_initWeak(&location, self);
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __68__VUIStoreMediaItem_iOS_prepareForPlaybackInitiationWithCompletion___block_invoke;
    aBlock[3] = &unk_1E6DF9518;
    objc_copyWeak(&v11, &location);
    id v10 = v4;
    id v5 = _Block_copy(aBlock);
    if ([(VUIStoreMediaItem_iOS *)self playbackType] == 1)
    {
      [(VUIStoreMediaItem_iOS *)self setNeedsRentalCheckin:1];
      objc_super v6 = [(VUIStoreMediaItem_iOS *)self mediaItemMetadataForProperty:*MEMORY[0x1E4FAA148]];
      [v6 addStartEventWithName:*MEMORY[0x1E4FAA368]];
      uint64_t v7 = 2;
    }
    else
    {
      if (![(VUIStoreMediaItem_iOS *)self needsRentalCheckoutPriorToPlayback]
        && [(VUIStoreMediaItem_iOS *)self playbackType] != 3
        && [(VUIStoreMediaItem_iOS *)self playbackType] != 4)
      {
        char v8 = 0;
LABEL_11:

        objc_destroyWeak(&v11);
        objc_destroyWeak(&location);
        if (!v4) {
          goto LABEL_14;
        }
        goto LABEL_12;
      }
      [(VUIStoreMediaItem_iOS *)self setNeedsRentalCheckoutPriorToPlayback:0];
      [(VUIStoreMediaItem_iOS *)self setNeedsRentalCheckin:0];
      objc_super v6 = [(VUIStoreMediaItem_iOS *)self mediaItemMetadataForProperty:*MEMORY[0x1E4FAA148]];
      [v6 addStartEventWithName:*MEMORY[0x1E4FAA368]];
      uint64_t v7 = 1;
    }

    [(VUIStoreMediaItem_iOS *)self _checkoutRentalWithCheckoutType:v7 startPlaybackClock:0 completion:v5];
    char v8 = 1;
    goto LABEL_11;
  }
  char v8 = 0;
  if (!v4) {
    goto LABEL_14;
  }
LABEL_12:
  if ((v8 & 1) == 0) {
    (*((void (**)(id, uint64_t, void))v4 + 2))(v4, 1, 0);
  }
LABEL_14:
}

- (BOOL)shouldRetryPlaybackForError:(id)a3
{
  id v4 = a3;
  if (![(VUIStoreMediaItem_iOS *)self hasTrait:*MEMORY[0x1E4FAA190]]
    || [(VUIStoreMediaItem_iOS *)self playbackType] != 5
    && [(VUIStoreMediaItem_iOS *)self playbackType] != 6)
  {
    goto LABEL_10;
  }
  id v5 = [v4 domain];
  if (![v5 isEqualToString:@"TVPlaybackErrorDomain"])
  {

    goto LABEL_10;
  }
  uint64_t v6 = [v4 code];

  if (v6 != 811)
  {
LABEL_10:
    BOOL v10 = 0;
    goto LABEL_11;
  }
  uint64_t v7 = [(VUIStoreMediaItem_iOS *)self _rentalExpirationDate];
  if (!v7
    || ([MEMORY[0x1E4F1C9C8] date],
        char v8 = objc_claimAutoreleasedReturnValue(),
        [v7 laterDate:v8],
        id v9 = objc_claimAutoreleasedReturnValue(),
        v9,
        v8,
        v9 == v7))
  {
    v12 = sLogObject_14;
    if (os_log_type_enabled((os_log_t)sLogObject_14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v13 = 0;
      _os_log_impl(&dword_1E2BD7000, v12, OS_LOG_TYPE_DEFAULT, "Downloaded rental is not authorized for playback even though it hasn't expired.  Will retry playback and perform rental checkout", v13, 2u);
    }
    BOOL v10 = 1;
    [(VUIStoreMediaItem_iOS *)self setNeedsRentalCheckoutPriorToPlayback:1];
  }
  else
  {
    BOOL v10 = 0;
  }

LABEL_11:
  return v10;
}

- (id)replacementErrorForPlaybackError:(id)a3
{
  v31[1] = *MEMORY[0x1E4F143B8];
  id v4 = (__CFString *)a3;
  id v5 = [(__CFString *)v4 domain];
  if (![v5 isEqualToString:@"TVPlaybackErrorDomain"])
  {

    goto LABEL_7;
  }
  uint64_t v6 = [(__CFString *)v4 code];

  if (v6 != 827)
  {
LABEL_7:
    BOOL v10 = [(VUIStoreMediaItem_iOS *)self fpsKeyError];
    if (!v10)
    {
      uint64_t v7 = v4;
      if (!TVPErrorIsSKDError()) {
        goto LABEL_26;
      }
      BOOL v10 = v4;
      if (!v10)
      {
        uint64_t v7 = 0;
        goto LABEL_26;
      }
    }
    id v11 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    [v11 setObject:MEMORY[0x1E4F1CC38] forKey:*MEMORY[0x1E4FAA140]];
    [v11 setObject:v10 forKey:*MEMORY[0x1E4F28A50]];
    if ([(__CFString *)v10 code] == -345014)
    {
      v12 = [(VUIStoreMediaItem_iOS *)self mediaItemMetadataForProperty:*MEMORY[0x1E4FAA0E8]];
      if (![(__CFString *)v12 length])
      {

        v12 = &stru_1F3E921E0;
      }
      uint64_t v13 = NSString;
      objc_super v14 = +[VUILocalizationManager sharedInstance];
      id v15 = [v14 localizedStringForKey:@"TOO_MANY_STREAMS_FORMAT_PURCHASE"];
      uint64_t v16 = [v13 stringWithValidatedFormat:v15, @"%@", 0, v12 validFormatSpecifiers error];

      [v11 setObject:v16 forKey:*MEMORY[0x1E4F285A0]];
      id v17 = objc_alloc(MEMORY[0x1E4F28C58]);
      uint64_t v18 = 810;
    }
    else
    {
      if ([(__CFString *)v10 code] != -345016)
      {
        if ([(__CFString *)v10 code] == -345015 || [(__CFString *)v10 code] == -345017)
        {
          id v22 = objc_alloc(MEMORY[0x1E4F28C58]);
          uint64_t v23 = 811;
        }
        else
        {
          uint64_t v28 = [(__CFString *)v10 code];
          id v22 = objc_alloc(MEMORY[0x1E4F28C58]);
          if (v28 == -345028) {
            uint64_t v23 = 827;
          }
          else {
            uint64_t v23 = 820;
          }
        }
        uint64_t v7 = (__CFString *)[v22 initWithDomain:@"TVPlaybackErrorDomain" code:v23 userInfo:v11];
        v12 = v4;
        goto LABEL_24;
      }
      v12 = [(VUIStoreMediaItem_iOS *)self mediaItemMetadataForProperty:*MEMORY[0x1E4FAA0E8]];
      if (![(__CFString *)v12 length])
      {

        v12 = &stru_1F3E921E0;
      }
      uint64_t v19 = NSString;
      int v20 = +[VUILocalizationManager sharedInstance];
      v21 = [v20 localizedStringForKey:@"TOO_MANY_STREAMS_FORMAT"];
      uint64_t v16 = [v19 stringWithValidatedFormat:v21, @"%@", 0, v12 validFormatSpecifiers error];

      [v11 setObject:v16 forKey:*MEMORY[0x1E4F285A0]];
      id v17 = objc_alloc(MEMORY[0x1E4F28C58]);
      uint64_t v18 = 812;
    }
    uint64_t v7 = (__CFString *)[v17 initWithDomain:@"TVPlaybackErrorDomain" code:v18 userInfo:v11];

LABEL_24:
    goto LABEL_25;
  }
  uint64_t v7 = v4;
  if (![(VUIStoreMediaItem_iOS *)self hasTrait:*MEMORY[0x1E4FAA190]]) {
    goto LABEL_26;
  }
  char v8 = [(__CFString *)v4 userInfo];
  uint64_t v9 = *MEMORY[0x1E4F28A50];
  BOOL v10 = [v8 objectForKey:*MEMORY[0x1E4F28A50]];

  if (v10)
  {
    uint64_t v30 = v9;
    v31[0] = v10;
    id v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v31 forKeys:&v30 count:1];
  }
  else
  {
    id v11 = 0;
  }
  if ([(VUIStoreMediaItem_iOS *)self playbackType] == 1)
  {
    uint64_t v25 = sLogObject_14;
    if (os_log_type_enabled((os_log_t)sLogObject_14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1E2BD7000, v25, OS_LOG_TYPE_DEFAULT, "AirPlay of streaming CRABS rental failed because device does not support playback.  Video must be downloaded in order to AirPlay", buf, 2u);
    }
    uint64_t v26 = 831;
LABEL_38:
    uint64_t v7 = (__CFString *)[objc_alloc(MEMORY[0x1E4F28C58]) initWithDomain:@"TVPlaybackErrorDomain" code:v26 userInfo:v11];

    goto LABEL_25;
  }
  uint64_t v7 = v4;
  if ([(VUIStoreMediaItem_iOS *)self playbackType] == 3)
  {
    v27 = sLogObject_14;
    if (os_log_type_enabled((os_log_t)sLogObject_14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1E2BD7000, v27, OS_LOG_TYPE_DEFAULT, "AirPlay of downloading CRABS rental failed because device does not support playback.  Video must be fully downloaded in order to AirPlay", buf, 2u);
    }
    uint64_t v26 = 832;
    goto LABEL_38;
  }
LABEL_25:

LABEL_26:
  return v7;
}

- (void)updateBookmarkWithSuggestedTime:(double)a3 forElapsedTime:(double)a4 duration:(double)a5 playbackOfMediaItemIsEnding:(BOOL)a6
{
  BOOL v6 = a6;
  id v11 = [(VUIStoreMediaItem_iOS *)self videoManagedObject];

  if (v11)
  {
    v12 = [MEMORY[0x1E4F1C9C8] date];
    uint64_t v13 = [(VUIStoreMediaItem_iOS *)self mediaItemMetadataForProperty:*MEMORY[0x1E4FA9F00]];
    uint64_t v14 = [(VUIStoreMediaItem_iOS *)self mediaItemMetadataForProperty:*MEMORY[0x1E4FA9EF8]];
    id v15 = (void *)v14;
    if (v13) {
      BOOL v16 = v14 == 0;
    }
    else {
      BOOL v16 = 1;
    }
    if (v16)
    {
      id v17 = 0;
    }
    else
    {
      [v13 doubleValue];
      double v19 = fmax(a3 - v18, 0.0);
      [v15 doubleValue];
      if (v19 >= v20)
      {
        [v15 doubleValue];
        double v19 = v21;
      }
      id v17 = [MEMORY[0x1E4F28ED0] numberWithDouble:v19];
    }
    id v22 = [(VUIStoreMediaItem_iOS *)self videoManagedObject];
    uint64_t v23 = [MEMORY[0x1E4F28ED0] numberWithDouble:a3];
    [v22 setBookmarkTime:v23];

    uint64_t v24 = [(VUIStoreMediaItem_iOS *)self videoManagedObject];
    [v24 setBookmarkTimeStamp:v12];

    uint64_t v25 = [(VUIStoreMediaItem_iOS *)self videoManagedObject];
    [v25 setMainContentRelativeBookmarkTime:v17];

    uint64_t v26 = [(VUIStoreMediaItem_iOS *)self videoManagedObject];
    [v26 setMainContentRelativeBookmarkTimeStamp:v12];

    v27 = +[VUIMediaLibraryManager defaultManager];
    uint64_t v28 = [v27 sidebandMediaLibrary];
    [v28 saveChangesToManagedObjects];
  }
  v29.receiver = self;
  v29.super_class = (Class)VUIStoreMediaItem_iOS;
  [(VUILibraryMediaItem_iOS *)&v29 updateBookmarkWithSuggestedTime:v6 forElapsedTime:a3 duration:a4 playbackOfMediaItemIsEnding:a5];
}

- (void)processFinishedDownloadWithCompletion:(id)a3
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  id v4 = (void (**)(id, void *))a3;
  id v5 = sLogObject_14;
  if (os_log_type_enabled((os_log_t)sLogObject_14, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1E2BD7000, v5, OS_LOG_TYPE_DEFAULT, "processFinishedDownloadWithCompletion", buf, 2u);
  }
  BOOL v6 = [(VUIStoreMediaItem_iOS *)self videoManagedObject];
  uint64_t v7 = [v6 localPlaybackURL];

  unsigned __int8 v47 = 0;
  char v8 = [v7 pathExtension];
  if (![v8 isEqualToString:@"movpkg"]) {
    goto LABEL_19;
  }
  uint64_t v9 = [MEMORY[0x1E4F28CB8] defaultManager];
  BOOL v10 = [v7 path];
  if (![v9 fileExistsAtPath:v10 isDirectory:&v47]) {
    goto LABEL_17;
  }
  int v11 = v47;

  if (!v11)
  {
    v12 = sLogObject_14;
    if (os_log_type_enabled((os_log_t)sLogObject_14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v51 = v7;
      _os_log_impl(&dword_1E2BD7000, v12, OS_LOG_TYPE_DEFAULT, "After downloading, CRABS download has incorrect file extension of .movpkg: %@", buf, 0xCu);
    }
    uint64_t v13 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    char v14 = [v13 BOOLForKey:@"DisableCRABSMovpkgWorkound"];

    if ((v14 & 1) == 0)
    {
      id v15 = [(VUIStoreMediaItem_iOS *)self videoManagedObject];
      char v8 = [v15 playbackURL];

      uint64_t v9 = [v8 pathExtension];
      if (![v9 length])
      {
LABEL_18:

LABEL_19:
        goto LABEL_20;
      }
      BOOL v16 = [v7 URLByDeletingPathExtension];
      BOOL v10 = [v16 URLByAppendingPathExtension:v9];

      id v17 = sLogObject_14;
      if (os_log_type_enabled((os_log_t)sLogObject_14, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v51 = v10;
        _os_log_impl(&dword_1E2BD7000, v17, OS_LOG_TYPE_DEFAULT, "Correcting CRABS download file URL to %@", buf, 0xCu);
      }
      double v18 = [MEMORY[0x1E4F28CB8] defaultManager];
      id v46 = 0;
      int v19 = [v18 moveItemAtURL:v7 toURL:v10 error:&v46];
      id v20 = v46;

      if (v19)
      {
        double v21 = [(VUIStoreMediaItem_iOS *)self videoManagedObject];
        [v21 setLocalPlaybackURL:v10];

        id v22 = +[VUIMediaLibraryManager defaultManager];
        uint64_t v23 = [v22 sidebandMediaLibrary];
        [v23 saveChangesToManagedObjects];

        id v24 = v10;
        uint64_t v7 = v24;
      }
      else if (os_log_type_enabled((os_log_t)sLogObject_14, OS_LOG_TYPE_ERROR))
      {
        -[VUIStoreMediaItem_iOS processFinishedDownloadWithCompletion:]();
      }

LABEL_17:
      goto LABEL_18;
    }
  }
LABEL_20:
  uint64_t v25 = [(VUIStoreMediaItem_iOS *)self videoManagedObject];
  uint64_t v26 = [v25 localPlaybackURL];
  v27 = [v26 pathExtension];
  char v28 = [v27 isEqualToString:@"movpkg"];

  if ((v28 & 1) == 0)
  {
    objc_super v29 = [(VUIStoreMediaItem_iOS *)self videoManagedObject];
    uint64_t v30 = [v29 redownloadProductResponseDictionary];

    uint64_t v31 = [v30 objectForKey:@"sinfs"];
    id v32 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    v33 = v32;
    if (v31) {
      [v32 setObject:v31 forKey:*MEMORY[0x1E4F580D0]];
    }
    v34 = sLogObject_14;
    if (os_log_type_enabled((os_log_t)sLogObject_14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1E2BD7000, v34, OS_LOG_TYPE_DEFAULT, "Processing sinfs", buf, 2u);
    }
    v35 = [MEMORY[0x1E4F580D8] fileProcessor];
    uint64_t v36 = [v7 path];
    objc_super v37 = [v35 processPurchasedItem:v36 withAttributes:v33];

    v38 = sLogObject_14;
    if (os_log_type_enabled((os_log_t)sLogObject_14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1E2BD7000, v38, OS_LOG_TYPE_DEFAULT, "Done processing sinfs", buf, 2u);
    }
    if (v37)
    {
      if (os_log_type_enabled((os_log_t)sLogObject_14, OS_LOG_TYPE_ERROR))
      {
        -[VUIStoreMediaItem_iOS processFinishedDownloadWithCompletion:]();
        if (v4) {
          goto LABEL_30;
        }
      }
      else if (v4)
      {
LABEL_30:
        id v39 = objc_alloc(MEMORY[0x1E4F28C58]);
        int64_t v40 = VUIStoreMediaItemErrorDomain;
        uint64_t v48 = *MEMORY[0x1E4F28A50];
        v49 = v37;
        uint64_t v41 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v49 forKeys:&v48 count:1];
        v42 = (void *)[v39 initWithDomain:v40 code:-123009 userInfo:v41];

        v4[2](v4, v42);
        goto LABEL_39;
      }
    }
  }
  if ([(VUIStoreMediaItem_iOS *)self hasTrait:*MEMORY[0x1E4FAA190]])
  {
    v43 = sLogObject_14;
    if (os_log_type_enabled((os_log_t)sLogObject_14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1E2BD7000, v43, OS_LOG_TYPE_DEFAULT, "Checking out rental since download is complete", buf, 2u);
    }
    v44[0] = MEMORY[0x1E4F143A8];
    v44[1] = 3221225472;
    v44[2] = __63__VUIStoreMediaItem_iOS_processFinishedDownloadWithCompletion___block_invoke;
    v44[3] = &unk_1E6DF49E8;
    v45 = v4;
    [(VUIStoreMediaItem_iOS *)self _checkoutRentalWithCheckoutType:1 startPlaybackClock:0 completion:v44];
  }
  else if (v4)
  {
    v4[2](v4, 0);
  }
LABEL_39:
}

- (void)cleanUpMediaItem
{
  [(VUIStoreMediaItem_iOS *)self setLoadingContext:[(VUIStoreMediaItem_iOS *)self loadingContext] + 1];
  if ([(VUIStoreMediaItem_iOS *)self needsRentalCheckin])
  {
    [(VUIStoreMediaItem_iOS *)self setNeedsRentalCheckin:0];
    [(VUIStoreMediaItem_iOS *)self _checkInRental];
  }
  id v3 = [(VUIStoreMediaItem_iOS *)self playbackURL];
  [(VUIStoreMediaItem_iOS *)self _deleteDownloadKeyCookieForURL:v3];

  [(VUIStoreMediaItem_iOS *)self setPlaybackType:0];
  [(VUIStoreMediaItem_iOS *)self setPlaybackURL:0];
  [(VUIStoreMediaItem_iOS *)self setSinfsDict:0];
  [(VUIStoreMediaItem_iOS *)self setFileSize:0];
  [(VUIStoreMediaItem_iOS *)self setDownloadDestinationURL:0];
  [(VUIStoreMediaItem_iOS *)self setDownloadToken:0];
  [(VUIStoreMediaItem_iOS *)self setDownloadMonitor:0];
  [(VUIStoreMediaItem_iOS *)self setParentReportingToken:0];
  id v4 = [(VUIStoreMediaItem_iOS *)self storeFPSKeyLoader];
  [v4 sendStreamingStopRequestIfNecessary];

  [(VUIStoreMediaItem_iOS *)self setStoreFPSKeyLoader:0];
  [(VUIStoreMediaItem_iOS *)self setMediaItemMetadata:0 forProperty:*MEMORY[0x1E4FAA148]];
  v5.receiver = self;
  v5.super_class = (Class)VUIStoreMediaItem_iOS;
  [(VUILibraryMediaItem_iOS *)&v5 cleanUpMediaItem];
}

- (void)mediaItemAllInitialLoadingComplete:(id)a3 totalTime:(double)a4 player:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  if ([(VUIStoreMediaItem_iOS *)self hasTrait:*MEMORY[0x1E4FAA190]])
  {
    objc_initWeak(&location, self);
    uint64_t v11 = MEMORY[0x1E4F143A8];
    uint64_t v12 = 3221225472;
    uint64_t v13 = __77__VUIStoreMediaItem_iOS_mediaItemAllInitialLoadingComplete_totalTime_player___block_invoke;
    char v14 = &unk_1E6DF6A38;
    objc_copyWeak(&v15, &location);
    uint64_t v9 = (void (**)(void *, uint64_t, void))_Block_copy(&v11);
    if ([(VUIStoreMediaItem_iOS *)self playbackType] == 1)
    {
      uint64_t v10 = 2;
    }
    else
    {
      if ([(VUIStoreMediaItem_iOS *)self playbackType] != 3
        && [(VUIStoreMediaItem_iOS *)self playbackType] != 4)
      {
        if ([(VUIStoreMediaItem_iOS *)self playbackType] == 5
          || [(VUIStoreMediaItem_iOS *)self playbackType] == 6)
        {
          [(VUIStoreMediaItem_iOS *)self _checkoutRentalWithCheckoutType:1 startPlaybackClock:1 completion:0];
          v9[2](v9, 1, 0);
        }
        goto LABEL_8;
      }
      uint64_t v10 = 1;
    }
    [(VUIStoreMediaItem_iOS *)self _checkoutRentalWithCheckoutType:v10 startPlaybackClock:1 completion:v9];
LABEL_8:

    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);
  }
}

- (void)loadFairPlayStreamingKeyRequests:(id)a3
{
}

- (void)loadFairPlayStreamingKeyRequests:(id)a3 completion:(id)a4
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v35 = (void (**)(void))a4;
  int64_t v7 = [(VUIStoreMediaItem_iOS *)self playbackType];
  id v8 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v9 = v8;
  id v36 = v6;
  if ((unint64_t)(v7 - 4) > 2)
  {
    [v8 addObjectsFromArray:v6];
  }
  else
  {
    long long v45 = 0u;
    long long v46 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    id v10 = v6;
    uint64_t v11 = [v10 countByEnumeratingWithState:&v43 objects:v50 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v44;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v44 != v13) {
            objc_enumerationMutation(v10);
          }
          id v15 = *(void **)(*((void *)&v43 + 1) + 8 * i);
          if ([v15 type])
          {
            if ([v15 type] == 2)
            {
              BOOL v16 = [(VUIStoreMediaItem_iOS *)self _offlineKeyDataForKeyRequest:v15];
              id v17 = sSecureKeyDeliveryLogObject;
              if (v16)
              {
                if (os_log_type_enabled((os_log_t)sSecureKeyDeliveryLogObject, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138412290;
                  v49 = v15;
                  _os_log_impl(&dword_1E2BD7000, v17, OS_LOG_TYPE_DEFAULT, "Using existing offline key data for request %@", buf, 0xCu);
                }
                [v15 setKeyResponseData:v16];
                [v15 finish];
              }
              else
              {
                if (os_log_type_enabled((os_log_t)sSecureKeyDeliveryLogObject, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 138412290;
                  v49 = v15;
                  _os_log_error_impl(&dword_1E2BD7000, v17, OS_LOG_TYPE_ERROR, "Offline key data does not exist for request %@", buf, 0xCu);
                }
                [v9 addObject:v15];
              }
            }
            else
            {
              [v9 addObject:v15];
            }
          }
          else
          {
            [v15 finishByRequestingOfflineKeysIfPossible];
          }
        }
        uint64_t v12 = [v10 countByEnumeratingWithState:&v43 objects:v50 count:16];
      }
      while (v12);
    }

    id v6 = v36;
  }
  if ([v9 count])
  {
    double v18 = [(VUIStoreMediaItem_iOS *)self storeFPSKeyLoader];

    if (!v18)
    {
      int v19 = [(VUIStoreMediaItem_iOS *)self fpsCertificateURL];
      id v20 = [(VUIStoreMediaItem_iOS *)self fpsKeyServerURL];
      double v21 = [[VUIStoreFPSKeyLoader alloc] initWithCertificateURL:v19 keyServerURL:v20];
      if ([(VUIStoreMediaItem_iOS *)self hasTrait:*MEMORY[0x1E4FAA190]])
      {
        id v22 = [(VUIStoreMediaItem_iOS *)self mediaItemMetadataForProperty:*MEMORY[0x1E4FAA018]];
        [(VUIStoreFPSKeyLoader *)v21 setRentalID:v22];
        if ([(VUIStoreMediaItem_iOS *)self playbackType] == 2) {
          [(VUIStoreFPSKeyLoader *)v21 setDidSkipRentalCheckout:1];
        }
      }
      [(VUIStoreFPSKeyLoader *)v21 setDelegate:self];
      uint64_t v23 = [(VUIStoreMediaItem_iOS *)self mediaItemMetadataForProperty:*MEMORY[0x1E4FAA148]];
      [(VUIStoreFPSKeyLoader *)v21 setEventCollection:v23];

      [(VUIStoreMediaItem_iOS *)self setStoreFPSKeyLoader:v21];
    }
    id v24 = [(VUIStoreMediaItem_iOS *)self fpsAdditionalServerParams];
    long long v39 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    id v25 = v9;
    uint64_t v26 = [v25 countByEnumeratingWithState:&v39 objects:v47 count:16];
    if (v26)
    {
      uint64_t v27 = v26;
      uint64_t v28 = *(void *)v40;
      uint64_t v29 = *MEMORY[0x1E4FAA0D8];
      do
      {
        for (uint64_t j = 0; j != v27; ++j)
        {
          if (*(void *)v40 != v28) {
            objc_enumerationMutation(v25);
          }
          uint64_t v31 = *(void **)(*((void *)&v39 + 1) + 8 * j);
          [v31 setAdditionalRequestParams:v24];
          id v32 = [(VUIStoreMediaItem_iOS *)self mediaItemMetadataForProperty:v29];
          [v31 setAdamID:v32];
        }
        uint64_t v27 = [v25 countByEnumeratingWithState:&v39 objects:v47 count:16];
      }
      while (v27);
    }

    v33 = [(VUIStoreMediaItem_iOS *)self storeFPSKeyLoader];
    v37[0] = MEMORY[0x1E4F143A8];
    v37[1] = 3221225472;
    v37[2] = __69__VUIStoreMediaItem_iOS_loadFairPlayStreamingKeyRequests_completion___block_invoke;
    v37[3] = &unk_1E6DF3DD0;
    v34 = v35;
    v38 = v35;
    [v33 loadFairPlayStreamingKeyRequests:v25 completion:v37];

    id v6 = v36;
  }
  else
  {
    v34 = v35;
    if (v35) {
      v35[2](v35);
    }
  }
}

- (void)storeFPSKeyLoader:(id)a3 willFailWithError:(id)a4 forKeyRequest:(id)a5
{
  v18[2] = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  int64_t v7 = [(VUIStoreMediaItem_iOS *)self fpsKeyError];

  if (v6)
  {
    if (!v7)
    {
      [(VUIStoreMediaItem_iOS *)self setFpsKeyError:v6];
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
LABEL_9:
              uint64_t v14 = *MEMORY[0x1E4FAA138];
              v17[0] = *MEMORY[0x1E4FAA140];
              v17[1] = v14;
              v18[0] = MEMORY[0x1E4F1CC38];
              v18[1] = v8;
              id v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:v17 count:2];
              BOOL v16 = [MEMORY[0x1E4F28EB8] defaultCenter];
              [v16 postNotificationName:*MEMORY[0x1E4FAA130] object:self userInfo:v15];

              goto LABEL_10;
            }
            id v9 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
            [v9 setObject:v8 forKey:*MEMORY[0x1E4F28A50]];
            uint64_t v11 = +[VUILocalizationManager sharedInstance];
            uint64_t v12 = [v11 localizedStringForKey:@"SignInToWatchThisVideoErrorDescription"];
            [v9 setObject:v12 forKey:*MEMORY[0x1E4F285A0]];

            uint64_t v13 = [objc_alloc(MEMORY[0x1E4F28C58]) initWithDomain:@"TVPlaybackErrorDomain" code:813 userInfo:v9];
            [(VUIStoreMediaItem_iOS *)self setFpsKeyError:0];
            id v8 = (id)v13;
          }

          goto LABEL_9;
        }
      }
    }
  }
LABEL_10:
}

- (void)storeFPSKeyLoader:(id)a3 didLoadOfflineKeyData:(id)a4 forKeyRequest:(id)a5
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  id v8 = a5;
  id v9 = (void *)sLogObject_14;
  if (os_log_type_enabled((os_log_t)sLogObject_14, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v10 = v9;
    int v11 = 134218240;
    uint64_t v12 = [v7 length];
    __int16 v13 = 2048;
    uint64_t v14 = [v8 requestID];
    _os_log_impl(&dword_1E2BD7000, v10, OS_LOG_TYPE_DEFAULT, "Received offline key data with length %lu for id %lu", (uint8_t *)&v11, 0x16u);
  }
  [(VUIStoreMediaItem_iOS *)self _persistOfflineKeyData:v7 forKeyRequest:v8];
}

- (void)storeFPSKeyLoader:(id)a3 didReceiveUpdatedRentalExpirationDate:(id)a4 playbackStartDate:(id)a5
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  int v11 = sLogObject_14;
  if (os_log_type_enabled((os_log_t)sLogObject_14, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 138412290;
    id v14 = v9;
    _os_log_impl(&dword_1E2BD7000, v11, OS_LOG_TYPE_DEFAULT, "Received updated rental expiration date from FPS loader: %@", (uint8_t *)&v13, 0xCu);
  }
  uint64_t v12 = sLogObject_14;
  if (os_log_type_enabled((os_log_t)sLogObject_14, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 138412290;
    id v14 = v10;
    _os_log_impl(&dword_1E2BD7000, v12, OS_LOG_TYPE_DEFAULT, "Received updated rental playback start date from FPS loader: %@", (uint8_t *)&v13, 0xCu);
  }
  [(VUIStoreMediaItem_iOS *)self _updateRentalPlaybackStartDate:v10];
}

- (void)_updateRentalPlaybackStartDate:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    objc_super v5 = [(VUILibraryMediaItem_iOS *)self mpMediaItem];
    uint64_t v6 = *MEMORY[0x1E4F31480];
    id v7 = [v5 valueForProperty:*MEMORY[0x1E4F31480]];

    if (!v7
      || ([v7 doubleValue], v8 <= 0.0)
      || (id v9 = (void *)MEMORY[0x1E4F1C9C8],
          [v7 doubleValue],
          objc_msgSend(v9, "dateWithTimeIntervalSinceReferenceDate:"),
          (id v10 = objc_claimAutoreleasedReturnValue()) == 0))
    {
      int v11 = [(VUIStoreMediaItem_iOS *)self videoManagedObject];
      id v10 = [v11 rentalPlaybackStartDate];

      if (!v10) {
        goto LABEL_7;
      }
    }
    [v10 timeIntervalSinceDate:v4];
    if (fabs(v12) <= 5.0)
    {
      int v19 = sLogObject_14;
      if (os_log_type_enabled((os_log_t)sLogObject_14, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v20) = 0;
        _os_log_impl(&dword_1E2BD7000, v19, OS_LOG_TYPE_DEFAULT, "Not updating MPMediaItem with new rental playback start date since it's close to existing start date", (uint8_t *)&v20, 2u);
      }
    }
    else
    {
LABEL_7:
      int v13 = sLogObject_14;
      if (os_log_type_enabled((os_log_t)sLogObject_14, OS_LOG_TYPE_DEFAULT))
      {
        int v20 = 138412290;
        id v21 = v4;
        _os_log_impl(&dword_1E2BD7000, v13, OS_LOG_TYPE_DEFAULT, "Updating MPMediaItem with new rental playback start date: %@", (uint8_t *)&v20, 0xCu);
      }
      id v14 = [(VUILibraryMediaItem_iOS *)self mpMediaItem];
      uint64_t v15 = (void *)MEMORY[0x1E4F28ED0];
      [v4 timeIntervalSinceReferenceDate];
      BOOL v16 = objc_msgSend(v15, "numberWithDouble:");
      [v14 setValue:v16 forProperty:v6 withCompletionBlock:0];

      id v17 = [(VUIStoreMediaItem_iOS *)self videoManagedObject];
      double v18 = [MEMORY[0x1E4F1C9C8] date];
      [v17 setRentalPlaybackStartDate:v18];
    }
  }
}

- (void)_configureForLocalPlaybackWithURL:(id)a3 completion:(id)a4
{
  id v14 = (void (**)(id, uint64_t, void))a4;
  id v6 = a3;
  id v7 = [v6 pathExtension];
  int v8 = [v7 isEqualToString:@"movpkg"];

  [(VUIStoreMediaItem_iOS *)self setPlaybackURL:v6];
  if (v8) {
    uint64_t v9 = 6;
  }
  else {
    uint64_t v9 = 5;
  }
  if (v8) {
    uint64_t v10 = 2;
  }
  else {
    uint64_t v10 = 1;
  }
  [(VUIStoreMediaItem_iOS *)self setPlaybackType:v9];
  uint64_t v11 = *MEMORY[0x1E4FAA148];
  double v12 = [(VUIStoreMediaItem_iOS *)self mediaItemMetadataForProperty:*MEMORY[0x1E4FAA148]];
  [v12 setIsDownloaded:1];

  int v13 = [(VUIStoreMediaItem_iOS *)self mediaItemMetadataForProperty:v11];
  [v13 setVideoType:v10];

  v14[2](v14, 1, 0);
}

- (void)_configureForPlaybackFromExistingDownload:(id)a3 downloadManager:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = [[VUIStoreDownloadMonitor alloc] initWithDownload:v8 downloadManager:v9];
  [(VUIStoreMediaItem_iOS *)self setDownloadMonitor:v11];
  double v12 = [(VUIStoreMediaItem_iOS *)self loadingContext];
  objc_initWeak(&location, self);
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __94__VUIStoreMediaItem_iOS__configureForPlaybackFromExistingDownload_downloadManager_completion___block_invoke;
  v15[3] = &unk_1E6DF9590;
  objc_copyWeak(v18, &location);
  v18[1] = v12;
  id v13 = v10;
  id v17 = v13;
  id v14 = v8;
  id v16 = v14;
  [(VUIStoreDownloadMonitor *)v11 waitForDownloadToBecomePlayableWithCompletion:v15];

  objc_destroyWeak(v18);
  objc_destroyWeak(&location);
}

- (void)_configureForStreamingPlaybackWithCompletion:(id)a3
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  objc_super v5 = [(VUILibraryMediaItem_iOS *)self ml3Track];
  uint64_t v6 = *MEMORY[0x1E4F79648];
  id v7 = [v5 valueForProperty:*MEMORY[0x1E4F79648]];

  uint64_t v8 = [(VUIStoreMediaItem_iOS *)self hlsPlaybackURL];
  id v9 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  int v10 = [v9 BOOLForKey:@"ForceCRABS"];

  if (v10)
  {
    uint64_t v11 = sLogObject_14;
    if (os_log_type_enabled((os_log_t)sLogObject_14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1E2BD7000, v11, OS_LOG_TYPE_DEFAULT, "Will attempt CRABS playback since ForceCRABS defaults key is set", buf, 2u);
    }
  }
  if ([v7 length] | v8) {
    char v12 = v10;
  }
  else {
    char v12 = 1;
  }
  if (v12)
  {
    id v13 = [(VUIStoreMediaItem_iOS *)self loadingContext];
    objc_initWeak((id *)buf, self);
    uint64_t v14 = *MEMORY[0x1E4FAA148];
    uint64_t v15 = [(VUIStoreMediaItem_iOS *)self mediaItemMetadataForProperty:*MEMORY[0x1E4FAA148]];
    [v15 addSingleShotEventWithName:*MEMORY[0x1E4FAA2C8] value:MEMORY[0x1E4F1CC38]];

    id v16 = [(VUIStoreMediaItem_iOS *)self mediaItemMetadataForProperty:v14];
    [v16 addStartEventWithName:*MEMORY[0x1E4FAA2C0]];

    v31[0] = MEMORY[0x1E4F143A8];
    v31[1] = 3221225472;
    void v31[2] = __70__VUIStoreMediaItem_iOS__configureForStreamingPlaybackWithCompletion___block_invoke;
    v31[3] = &unk_1E6DF95B8;
    objc_copyWeak(v33, (id *)buf);
    v33[1] = v13;
    char v34 = v10;
    id v32 = v4;
    [(VUIStoreMediaItem_iOS *)self _performRedownloadWithType:0 completion:v31];

    objc_destroyWeak(v33);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    id v17 = sLogObject_14;
    if (os_log_type_enabled((os_log_t)sLogObject_14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1E2BD7000, v17, OS_LOG_TYPE_DEFAULT, "HLS URL is available; skipping redownload", buf, 2u);
    }
    if (v8)
    {
      double v18 = [MEMORY[0x1E4F1CB10] URLWithString:v7];
      BOOL v19 = [(VUIStoreMediaItem_iOS *)self _url:v8 hasSameAdamIDAsURL:v18];

      if (v19)
      {
        int v20 = sLogObject_14;
        if (os_log_type_enabled((os_log_t)sLogObject_14, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v38 = v8;
          _os_log_impl(&dword_1E2BD7000, v20, OS_LOG_TYPE_DEFAULT, "Updating ML3Track's HLS playlist URL with value from UTS: %@", buf, 0xCu);
        }
        id v21 = [(VUILibraryMediaItem_iOS *)self ml3Track];
        uint64_t v36 = v8;
        uint64_t v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v36 count:1];
        uint64_t v35 = v6;
        uint64_t v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v35 count:1];
        [v21 setValues:v22 forProperties:v23 async:1 withCompletionBlock:0];
      }
      id v24 = (id)v8;
    }
    else
    {
      id v24 = (id)[objc_alloc(MEMORY[0x1E4F1CB10]) initWithString:v7];
    }
    id v25 = v24;
    uint64_t v26 = [(VUIStoreMediaItem_iOS *)self _hlsURLEnsuringDsidQueryParamIsPresentFromURL:v24];

    uint64_t v27 = +[VUIPlaybackUtilities updatedHLSURL:v26 forPlaybackContext:[(VUIStoreMediaItem_iOS *)self playbackContext]];

    [(VUIStoreMediaItem_iOS *)self setPlaybackURL:v27];
    [(VUIStoreMediaItem_iOS *)self setPlaybackType:2];
    uint64_t v28 = *MEMORY[0x1E4FAA148];
    uint64_t v29 = [(VUIStoreMediaItem_iOS *)self mediaItemMetadataForProperty:*MEMORY[0x1E4FAA148]];
    [v29 setVideoType:2];

    uint64_t v30 = [(VUIStoreMediaItem_iOS *)self mediaItemMetadataForProperty:v28];
    [v30 addSingleShotEventWithName:*MEMORY[0x1E4FAA2C8] value:MEMORY[0x1E4F1CC28]];

    (*((void (**)(id, uint64_t, void))v4 + 2))(v4, 1, 0);
  }
}

- (void)_configureForDownloadingWithCompletion:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(VUIStoreMediaItem_iOS *)self isForStartingDownload];
  uint64_t v6 = sLogObject_14;
  BOOL v7 = os_log_type_enabled((os_log_t)sLogObject_14, OS_LOG_TYPE_DEFAULT);
  if (v5)
  {
    if (v7)
    {
      LOWORD(buf[0]) = 0;
      uint64_t v8 = "Media item will start downloading";
LABEL_6:
      _os_log_impl(&dword_1E2BD7000, v6, OS_LOG_TYPE_DEFAULT, v8, (uint8_t *)buf, 2u);
    }
  }
  else if (v7)
  {
    LOWORD(buf[0]) = 0;
    uint64_t v8 = "Media item being downloaded";
    goto LABEL_6;
  }
  id v9 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  int v10 = [v9 BOOLForKey:@"ForceCRABS"];

  if (v10)
  {
    uint64_t v11 = sLogObject_14;
    if (os_log_type_enabled((os_log_t)sLogObject_14, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl(&dword_1E2BD7000, v11, OS_LOG_TYPE_DEFAULT, "Will attempt CRABS download since ForceCRABS defaults key is set", (uint8_t *)buf, 2u);
    }
  }
  char v12 = [(VUIStoreMediaItem_iOS *)self loadingContext];
  objc_initWeak(buf, self);
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __64__VUIStoreMediaItem_iOS__configureForDownloadingWithCompletion___block_invoke;
  v14[3] = &unk_1E6DF95B8;
  objc_copyWeak(v16, buf);
  v16[1] = v12;
  char v17 = v10;
  id v13 = v4;
  id v15 = v13;
  [(VUIStoreMediaItem_iOS *)self _performRedownloadWithType:1 completion:v14];

  objc_destroyWeak(v16);
  objc_destroyWeak(buf);
}

- (void)_performRedownloadWithType:(int64_t)a3 completion:(id)a4
{
  uint64_t v6 = *MEMORY[0x1E4FA9E20];
  id v7 = a4;
  id v12 = [(VUIStoreMediaItem_iOS *)self mediaItemMetadataForProperty:v6];
  if ([v12 length])
  {
    uint64_t v8 = [MEMORY[0x1E4F4DC00] buyParamsWithString:v12];
    id v9 = v8;
    if (!a3)
    {
      [v8 setParameter:@"1" forKey:@"playback"];
      [v9 setParameter:@"1" forKey:@"lightweight"];
      if ([(VUIStoreMediaItem_iOS *)self hasTrait:*MEMORY[0x1E4FAA190]]) {
        [v9 setParameter:MEMORY[0x1E4F1CC38] forKey:@"streamingRental"];
      }
    }
    int v10 = +[VUIRedownloadEndpointManager sharedInstance];
    [v10 performRedownloadWithType:a3 buyParams:v9 completion:v7];

    id v7 = v10;
  }
  else
  {
    id v11 = objc_alloc(MEMORY[0x1E4F28C58]);
    id v9 = (void *)[v11 initWithDomain:VUIStoreMediaItemErrorDomain code:-123001 userInfo:0];
    (*((void (**)(id, void, void *))v7 + 2))(v7, 0, v9);
  }
}

- (BOOL)_loadingCancelled:(unint64_t)a3
{
  return [(VUIStoreMediaItem_iOS *)self loadingContext] != a3;
}

- (id)_iTunesStoreContentPurchasedMediaKind
{
  v2 = [(VUIStoreMediaItem_iOS *)self mediaItemMetadataForProperty:*MEMORY[0x1E4FA9FB0]];
  if (v2 == (void *)*MEMORY[0x1E4FAA200]) {
    id v3 = @"tvshow";
  }
  else {
    id v3 = 0;
  }
  if (v2 == (void *)*MEMORY[0x1E4FAA1E8]) {
    id v4 = @"movie";
  }
  else {
    id v4 = v3;
  }

  return v4;
}

- (void)_setDownloadKeyCookieWithURL:(id)a3 downloadKey:(id)a4
{
  v17[5] = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  uint64_t v6 = v5;
  if (a3 && v5)
  {
    id v7 = a3;
    uint64_t v8 = [v7 host];
    id v9 = [v7 path];

    if (v8 && v9)
    {
      int v10 = (void *)MEMORY[0x1E4F28D10];
      uint64_t v11 = *MEMORY[0x1E4F28448];
      v16[0] = *MEMORY[0x1E4F28418];
      v16[1] = v11;
      v17[0] = @"downloadKey";
      v17[1] = v6;
      uint64_t v12 = *MEMORY[0x1E4F28428];
      id v16[2] = *MEMORY[0x1E4F28400];
      v16[3] = v12;
      void v17[2] = v8;
      v17[3] = v9;
      v16[4] = *MEMORY[0x1E4F28450];
      v17[4] = @"0";
      id v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:v16 count:5];
      uint64_t v14 = [v10 cookieWithProperties:v13];

      id v15 = [MEMORY[0x1E4F28D18] sharedHTTPCookieStorage];
      [v15 setCookie:v14];
    }
  }
}

- (void)_deleteDownloadKeyCookieForURL:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (v3)
  {
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id v4 = objc_msgSend(MEMORY[0x1E4F28D18], "sharedHTTPCookieStorage", 0);
    id v5 = [v4 cookiesForURL:v3];

    uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v15;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v15 != v8) {
            objc_enumerationMutation(v5);
          }
          int v10 = *(void **)(*((void *)&v14 + 1) + 8 * i);
          uint64_t v11 = [v10 name];
          int v12 = [v11 isEqualToString:@"downloadKey"];

          if (v12)
          {
            id v13 = [MEMORY[0x1E4F28D18] sharedHTTPCookieStorage];
            [v13 deleteCookie:v10];
          }
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v7);
    }
  }
}

- (id)_downloadForThisMediaItemReturningDownloadManager:(id *)a3
{
  v41[2] = *MEMORY[0x1E4F143B8];
  id v4 = objc_alloc_init(MEMORY[0x1E4FA8178]);
  uint64_t v5 = *MEMORY[0x1E4FA84C0];
  v41[0] = *MEMORY[0x1E4FA8490];
  v41[1] = v5;
  uint64_t v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v41 count:2];
  [v4 setDownloadKinds:v6];

  [v4 setShouldFilterExternalOriginatedDownloads:0];
  uint64_t v7 = *MEMORY[0x1E4FA85F8];
  uint64_t v8 = *MEMORY[0x1E4FA8630];
  v40[0] = *MEMORY[0x1E4FA85F8];
  v40[1] = v8;
  v40[2] = *MEMORY[0x1E4FA85A8];
  id v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v40 count:3];
  [v4 setPrefetchedDownloadProperties:v9];

  uint64_t v26 = v4;
  id v24 = (void *)[objc_alloc(MEMORY[0x1E4FA8170]) initWithManagerOptions:v4];
  [v24 downloads];
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  obuint64_t j = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v33 = [obj countByEnumeratingWithState:&v34 objects:v39 count:16];
  if (v33)
  {
    id v28 = 0;
    uint64_t v32 = *(void *)v35;
    uint64_t v31 = *MEMORY[0x1E4F79978];
    uint64_t v29 = *MEMORY[0x1E4FA8528];
    uint64_t v27 = *MEMORY[0x1E4FA8530];
LABEL_3:
    uint64_t v10 = 0;
    while (1)
    {
      if (*(void *)v35 != v32) {
        objc_enumerationMutation(obj);
      }
      uint64_t v11 = *(void **)(*((void *)&v34 + 1) + 8 * v10);
      v38[0] = v7;
      v38[1] = v8;
      int v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v38 count:2];
      id v13 = objc_msgSend(v11, "vui_valuesForProperties:", v12);

      long long v14 = [v13 objectForKey:v7];
      long long v15 = [v13 objectForKey:v8];
      long long v16 = [(VUILibraryMediaItem_iOS *)self ml3Track];
      long long v17 = [v16 valueForProperty:v31];

      uint64_t v18 = [v14 longLongValue];
      if (v18 == [(VUILibraryMediaItem_iOS *)self persistentID]
        || (v15 ? (BOOL v22 = v17 == 0) : (BOOL v22 = 1), !v22 && [v15 isEqualToNumber:v17]))
      {
        uint64_t v19 = [v11 downloadPhaseIdentifier];
        if (([v19 isEqualToString:v29] & 1) == 0
          && ([v19 isEqualToString:v27] & 1) == 0)
        {
          id v20 = v11;

          id v28 = v20;
        }

        int v21 = 0;
      }
      else
      {
        int v21 = 1;
      }

      if (!v21) {
        break;
      }
      if (v33 == ++v10)
      {
        uint64_t v33 = [obj countByEnumeratingWithState:&v34 objects:v39 count:16];
        if (v33) {
          goto LABEL_3;
        }
        break;
      }
    }
  }
  else
  {
    id v28 = 0;
  }

  if (a3) {
    *a3 = v24;
  }

  return v28;
}

- (id)_videoPlaybackTypeDescription
{
  unint64_t v2 = [(VUIStoreMediaItem_iOS *)self playbackType];
  if (v2 > 6) {
    return 0;
  }
  else {
    return off_1E6DF95D8[v2];
  }
}

- (id)_offlineKeyDataForKeyRequest:(id)a3
{
  id v4 = a3;
  if (![(VUIStoreMediaItem_iOS *)self useSidebandLibraryForPlaybackKeys])
  {
    int v12 = [(VUILibraryMediaItem_iOS *)self ml3Track];
    uint64_t v5 = [v12 valueForProperty:*MEMORY[0x1E4F79640]];

    if (!v5)
    {
      uint64_t v7 = 0;
      goto LABEL_17;
    }
    id v13 = (void *)MEMORY[0x1E4F28DC0];
    long long v14 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v15 = objc_opt_class();
    uint64_t v16 = objc_opt_class();
    long long v17 = objc_msgSend(v14, "setWithObjects:", v15, v16, objc_opt_class(), 0);
    id v23 = 0;
    uint64_t v18 = [v13 unarchivedObjectOfClasses:v17 fromData:v5 error:&v23];
    id v19 = v23;

    if (v19 && os_log_type_enabled((os_log_t)sLogObject_14, OS_LOG_TYPE_ERROR))
    {
      -[VUIStoreMediaItem_iOS _offlineKeyDataForKeyRequest:]();
      if (v18) {
        goto LABEL_9;
      }
    }
    else if (v18)
    {
LABEL_9:
      id v20 = [v4 keyIdentifier];
      int v21 = [v20 absoluteString];

      if (v21)
      {
        uint64_t v7 = [v18 objectForKey:v21];
      }
      else
      {
        uint64_t v7 = 0;
      }

      goto LABEL_16;
    }
    uint64_t v7 = 0;
LABEL_16:

    goto LABEL_17;
  }
  uint64_t v5 = [v4 keyIdentifier];
  uint64_t v6 = [(VUIStoreMediaItem_iOS *)self videoManagedObject];

  uint64_t v7 = 0;
  if (v6 && v5)
  {
    uint64_t v8 = +[VUIMediaLibraryManager defaultManager];
    id v9 = [v8 sidebandMediaLibrary];
    uint64_t v10 = [(VUIStoreMediaItem_iOS *)self videoManagedObject];
    uint64_t v11 = [v9 fpsKeyInfoForVideo:v10 keyURI:v5 createIfNeeded:0 wasCreated:0];

    uint64_t v7 = [v11 keyData];
  }
LABEL_17:

  return v7;
}

- (void)_persistOfflineKeyData:(id)a3 forKeyRequest:(id)a4
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if ([(VUIStoreMediaItem_iOS *)self useSidebandLibraryForPlaybackKeys])
  {
    uint64_t v8 = [v7 keyIdentifier];
    id v9 = [(VUIStoreMediaItem_iOS *)self videoManagedObject];
    if (!v9 || !v8)
    {
LABEL_9:

      goto LABEL_22;
    }
    uint64_t v10 = [v6 length];

    if (v10)
    {
      uint64_t v11 = [(VUIStoreMediaItem_iOS *)self videoManagedObject];
      uint64_t v12 = [v11 downloadState];

      id v13 = sLogObject_14;
      BOOL v14 = os_log_type_enabled((os_log_t)sLogObject_14, OS_LOG_TYPE_DEFAULT);
      if (v12)
      {
        if (v14)
        {
          *(_DWORD *)buf = 138412290;
          id v41 = v7;
          _os_log_impl(&dword_1E2BD7000, v13, OS_LOG_TYPE_DEFAULT, "Saving offline key data to database: %@", buf, 0xCu);
        }
        uint64_t v15 = +[VUIMediaLibraryManager defaultManager];
        uint64_t v16 = [v15 sidebandMediaLibrary];
        long long v17 = [(VUIStoreMediaItem_iOS *)self videoManagedObject];
        id v9 = [v16 fpsKeyInfoForVideo:v17 keyURI:v8 createIfNeeded:1 wasCreated:0];

        uint64_t v18 = [(VUIStoreMediaItem_iOS *)self videoManagedObject];
        [v9 populateFromKeyRequest:v7 video:v18];

        id v19 = +[VUIMediaLibraryManager defaultManager];
        id v20 = [v19 sidebandMediaLibrary];
        [v20 saveChangesToManagedObjects];

        goto LABEL_9;
      }
      if (v14)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1E2BD7000, v13, OS_LOG_TYPE_DEFAULT, "Offline keys received for an item that is no longer downloading or downloaded.  Not saving keys.", buf, 2u);
      }
    }
  }
  else
  {
    int v21 = [(VUILibraryMediaItem_iOS *)self ml3Track];
    uint64_t v22 = *MEMORY[0x1E4F79640];
    uint64_t v8 = [v21 valueForProperty:*MEMORY[0x1E4F79640]];

    if (!v8) {
      goto LABEL_15;
    }
    id v23 = (void *)MEMORY[0x1E4F28DC0];
    id v24 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v25 = objc_opt_class();
    uint64_t v26 = objc_opt_class();
    uint64_t v27 = objc_msgSend(v24, "setWithObjects:", v25, v26, objc_opt_class(), 0);
    id v37 = 0;
    id v28 = [v23 unarchivedObjectOfClasses:v27 fromData:v8 error:&v37];
    id v29 = v37;

    if (v29 && os_log_type_enabled((os_log_t)sLogObject_14, OS_LOG_TYPE_ERROR)) {
      -[VUIStoreMediaItem_iOS _offlineKeyDataForKeyRequest:]();
    }
    id v30 = (id)[v28 mutableCopy];

    if (!v30) {
LABEL_15:
    }
      id v30 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    uint64_t v31 = [v7 keyIdentifier];
    uint64_t v32 = [v31 absoluteString];

    if ([v6 length] && v32)
    {
      [v30 setObject:v6 forKey:v32];
      uint64_t v33 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v30 requiringSecureCoding:1 error:0];
      if (v33)
      {
        long long v34 = [(VUILibraryMediaItem_iOS *)self ml3Track];
        uint64_t v39 = v33;
        long long v35 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v39 count:1];
        uint64_t v38 = v22;
        long long v36 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v38 count:1];
        [v34 setValues:v35 forProperties:v36 async:1 withCompletionBlock:0];
      }
    }
  }
LABEL_22:
}

- (void)_checkoutRentalWithCheckoutType:(unint64_t)a3 startPlaybackClock:(BOOL)a4 completion:(id)a5
{
  BOOL v5 = a4;
  id v8 = a5;
  id v9 = [(VUIStoreMediaItem_iOS *)self mediaItemMetadataForProperty:*MEMORY[0x1E4FAA018]];
  uint64_t v10 = [(VUIStoreMediaItem_iOS *)self mediaItemMetadataForProperty:*MEMORY[0x1E4FA9E70]];
  objc_initWeak(&location, self);
  uint64_t v11 = +[VUIRentalManager sharedInstance];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __87__VUIStoreMediaItem_iOS__checkoutRentalWithCheckoutType_startPlaybackClock_completion___block_invoke;
  v13[3] = &unk_1E6DF9518;
  objc_copyWeak(&v15, &location);
  id v12 = v8;
  id v14 = v12;
  [v11 checkOutRentalWithID:v9 dsid:v10 checkoutType:a3 startPlaybackClock:v5 completion:v13];

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);
}

- (void)_checkInRental
{
  id v5 = [(VUIStoreMediaItem_iOS *)self mediaItemMetadataForProperty:*MEMORY[0x1E4FAA018]];
  id v3 = [(VUIStoreMediaItem_iOS *)self mediaItemMetadataForProperty:*MEMORY[0x1E4FA9E70]];
  id v4 = +[VUIRentalManager sharedInstance];
  [v4 checkInRentalWithID:v5 dsid:v3 completion:0];
}

- (void)_externalPlaybackTypeDidChange:(id)a3
{
  v21[2] = *MEMORY[0x1E4F143B8];
  id v4 = [a3 object];
  id v5 = [v4 currentMediaItem];
  int v6 = [v5 isEqualToMediaItem:self];

  if (v6
    && [v4 externalPlaybackType] == 1
    && [(VUIStoreMediaItem_iOS *)self hasTrait:*MEMORY[0x1E4FAA190]])
  {
    if ([(VUIStoreMediaItem_iOS *)self playbackType] == 1)
    {
      id v7 = sLogObject_14;
      if (os_log_type_enabled((os_log_t)sLogObject_14, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)long long v17 = 0;
        _os_log_impl(&dword_1E2BD7000, v7, OS_LOG_TYPE_DEFAULT, "Not allowing AirPlay playback of streaming CRABS rental", v17, 2u);
      }
      id v8 = (void *)[objc_alloc(MEMORY[0x1E4F28C58]) initWithDomain:@"TVPlaybackErrorDomain" code:831 userInfo:0];
      uint64_t v9 = *MEMORY[0x1E4FAA138];
      v20[0] = *MEMORY[0x1E4FAA140];
      v20[1] = v9;
      v21[0] = MEMORY[0x1E4F1CC38];
      v21[1] = v8;
      uint64_t v10 = (void *)MEMORY[0x1E4F1C9E8];
      uint64_t v11 = v21;
      id v12 = v20;
LABEL_12:
      id v15 = [v10 dictionaryWithObjects:v11 forKeys:v12 count:2];
      uint64_t v16 = [MEMORY[0x1E4F28EB8] defaultCenter];
      [v16 postNotificationName:*MEMORY[0x1E4FAA130] object:self userInfo:v15];

      goto LABEL_13;
    }
    if ([(VUIStoreMediaItem_iOS *)self playbackType] == 3)
    {
      id v13 = sLogObject_14;
      if (os_log_type_enabled((os_log_t)sLogObject_14, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)long long v17 = 0;
        _os_log_impl(&dword_1E2BD7000, v13, OS_LOG_TYPE_DEFAULT, "Not allowing AirPlay playback of downloading CRABS rental", v17, 2u);
      }
      id v8 = (void *)[objc_alloc(MEMORY[0x1E4F28C58]) initWithDomain:@"TVPlaybackErrorDomain" code:832 userInfo:0];
      uint64_t v14 = *MEMORY[0x1E4FAA138];
      v18[0] = *MEMORY[0x1E4FAA140];
      v18[1] = v14;
      v19[0] = MEMORY[0x1E4F1CC38];
      v19[1] = v8;
      uint64_t v10 = (void *)MEMORY[0x1E4F1C9E8];
      uint64_t v11 = v19;
      id v12 = v18;
      goto LABEL_12;
    }
  }
LABEL_13:
}

- (id)_iTunesStoreContentInfo
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v4 = [(VUIStoreMediaItem_iOS *)self mediaItemMetadataForProperty:*MEMORY[0x1E4FAA0D8]];
  if ([v4 length])
  {
    id v5 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithLongLong:", objc_msgSend(v4, "longLongValue"));
  }
  else
  {
    id v5 = 0;
  }
  int v6 = [(VUILibraryMediaItem_iOS *)self ml3Track];
  if (v6)
  {
    id v7 = [(VUILibraryMediaItem_iOS *)self ml3Track];
    id v8 = [v7 valueForProperty:*MEMORY[0x1E4F79648]];
  }
  else
  {
    id v7 = [(VUIStoreMediaItem_iOS *)self videoManagedObject];
    uint64_t v9 = [v7 playbackURL];
    id v8 = [v9 absoluteString];
  }
  if (![v8 length])
  {
    uint64_t v10 = [(VUIStoreMediaItem_iOS *)self hlsPlaybackURL];
    uint64_t v11 = [v10 absoluteString];

    id v8 = (void *)v11;
  }
  if ([v8 length])
  {
    id v12 = (void *)[objc_alloc(MEMORY[0x1E4F1CB10]) initWithString:v8];
    id v13 = [(VUIStoreMediaItem_iOS *)self _hlsURLEnsuringDsidQueryParamIsPresentFromURL:v12];

    uint64_t v14 = +[VUIPlaybackUtilities updatedHLSURL:v13 forPlaybackContext:[(VUIStoreMediaItem_iOS *)self playbackContext]];

    id v15 = [v14 absoluteString];
    if ([v15 length])
    {
      id v16 = v15;

      id v8 = v16;
    }
    [v3 setObject:v8 forKey:*MEMORY[0x1E4F16190]];
  }
  if ([(VUIStoreMediaItem_iOS *)self hasTrait:*MEMORY[0x1E4FAA190]])
  {
    long long v17 = [(VUIStoreMediaItem_iOS *)self mediaItemMetadataForProperty:*MEMORY[0x1E4FAA018]];
    if (v17) {
      [v3 setObject:v17 forKey:*MEMORY[0x1E4F161A8]];
    }
  }
  else
  {
    if (!v5) {
      goto LABEL_27;
    }
    [v3 setObject:v5 forKey:*MEMORY[0x1E4F16198]];
    [v3 setObject:@"purchaseHistory" forKey:*MEMORY[0x1E4F161B0]];
    long long v17 = [(VUIStoreMediaItem_iOS *)self _iTunesStoreContentPurchasedMediaKind];
    if (v17) {
      [v3 setObject:v17 forKey:*MEMORY[0x1E4F161A0]];
    }
    uint64_t v18 = (void *)MEMORY[0x1E4F4DE90];
    id v19 = [MEMORY[0x1E4F4DDC8] currentProcess];
    id v20 = [v18 userAgentForProcessInfo:v19];

    if (v20) {
      [v3 setObject:v20 forKey:*MEMORY[0x1E4F161B8]];
    }
    int v21 = [(VUIStoreMediaItem_iOS *)self mediaItemMetadataForProperty:*MEMORY[0x1E4FA9E70]];
    if (v21) {
      [v3 setObject:v21 forKey:*MEMORY[0x1E4F16180]];
    }
    uint64_t v22 = [(VUIStoreMediaItem_iOS *)self mediaItemMetadataForProperty:*MEMORY[0x1E4FA9E20]];
    if (v22) {
      [v3 setObject:v22 forKey:*MEMORY[0x1E4F16188]];
    }
  }
LABEL_27:
  if ([v3 count]) {
    id v23 = (void *)[v3 copy];
  }
  else {
    id v23 = 0;
  }

  return v23;
}

- (id)_rentalEndDate
{
  id v3 = [(VUILibraryMediaItem_iOS *)self ml3Track];

  if (!v3)
  {
    id v8 = [MEMORY[0x1E4F1C9C8] date];
    uint64_t v14 = [v8 dateByAddingTimeInterval:2592000.0];
    goto LABEL_7;
  }
  id v4 = [(VUILibraryMediaItem_iOS *)self ml3Track];
  id v5 = [v4 valueForProperty:*MEMORY[0x1E4F79818]];
  [v5 doubleValue];
  double v7 = v6;

  if (v7 != 0.0)
  {
    id v8 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceReferenceDate:v7];
    uint64_t v9 = [(VUILibraryMediaItem_iOS *)self ml3Track];
    uint64_t v10 = [v9 valueForProperty:*MEMORY[0x1E4F797F8]];
    [v10 doubleValue];
    double v12 = v11;

    id v13 = 0;
    if (!v8 || v12 == 0.0) {
      goto LABEL_8;
    }
    uint64_t v14 = [objc_alloc(MEMORY[0x1E4F1C9C8]) initWithTimeInterval:v8 sinceDate:v12];
LABEL_7:
    id v13 = (void *)v14;
LABEL_8:

    goto LABEL_10;
  }
  id v13 = 0;
LABEL_10:
  return v13;
}

- (id)_rentalPlaybackEndDate
{
  id v3 = [(VUILibraryMediaItem_iOS *)self ml3Track];

  if (!v3)
  {
    id v16 = [(VUIStoreMediaItem_iOS *)self videoManagedObject];
    id v8 = [v16 rentalPlaybackStartDate];

    if (!v8)
    {
      id v13 = 0;
      goto LABEL_11;
    }
    id v14 = objc_alloc(MEMORY[0x1E4F1C9C8]);
    double v15 = 172800.0;
    goto LABEL_8;
  }
  id v4 = [(VUILibraryMediaItem_iOS *)self ml3Track];
  id v5 = [v4 valueForProperty:*MEMORY[0x1E4F79810]];
  [v5 doubleValue];
  double v7 = v6;

  if (v7 == 0.0)
  {
    id v13 = 0;
    goto LABEL_12;
  }
  id v8 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceReferenceDate:v7];
  uint64_t v9 = [(VUILibraryMediaItem_iOS *)self ml3Track];
  uint64_t v10 = [v9 valueForProperty:*MEMORY[0x1E4F79808]];
  [v10 doubleValue];
  double v12 = v11;

  id v13 = 0;
  if (v8 && v12 != 0.0)
  {
    id v14 = objc_alloc(MEMORY[0x1E4F1C9C8]);
    double v15 = v12;
LABEL_8:
    id v13 = (void *)[v14 initWithTimeInterval:v8 sinceDate:v15];
  }
LABEL_11:

LABEL_12:
  return v13;
}

- (id)_rentalExpirationDate
{
  id v3 = [(VUIStoreMediaItem_iOS *)self _rentalPlaybackEndDate];
  id v4 = [(VUIStoreMediaItem_iOS *)self _rentalEndDate];
  id v5 = v4;
  if (v3 && v4)
  {
    id v6 = [v3 earlierDate:v4];
  }
  else if (v3)
  {
    id v6 = v3;
  }
  else if (v4)
  {
    id v6 = v4;
  }
  else
  {
    id v6 = 0;
  }
  id v7 = v6;

  return v7;
}

- (id)_hlsURLEnsuringDsidQueryParamIsPresentFromURL:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = v4;
  if (v4 && (objc_msgSend(v4, "vui_containsQueryParamWithName:", @"dsid") & 1) == 0)
  {
    id v8 = sLogObject_14;
    if (os_log_type_enabled((os_log_t)sLogObject_14, OS_LOG_TYPE_DEFAULT))
    {
      int v15 = 138412290;
      id v16 = v5;
      _os_log_impl(&dword_1E2BD7000, v8, OS_LOG_TYPE_DEFAULT, "dsid query param is missing from HLS URL: %@", (uint8_t *)&v15, 0xCu);
    }
    uint64_t v9 = [(VUIStoreMediaItem_iOS *)self mediaItemMetadataForProperty:*MEMORY[0x1E4FA9E70]];
    uint64_t v10 = [v9 stringValue];

    id v7 = v5;
    if ([v10 length])
    {
      double v11 = objc_msgSend(v5, "vui_URLByAddingQueryParamWithName:value:", @"dsid", v10);
      double v12 = v11;
      id v7 = v5;
      if (v11)
      {
        id v7 = v11;

        id v13 = sLogObject_14;
        if (os_log_type_enabled((os_log_t)sLogObject_14, OS_LOG_TYPE_DEFAULT))
        {
          int v15 = 138412290;
          id v16 = v7;
          _os_log_impl(&dword_1E2BD7000, v13, OS_LOG_TYPE_DEFAULT, "HLS URL after adding dsid param: %@", (uint8_t *)&v15, 0xCu);
        }
      }
    }
  }
  else
  {
    id v6 = sLogObject_14;
    id v7 = v5;
    if (os_log_type_enabled((os_log_t)sLogObject_14, OS_LOG_TYPE_DEFAULT))
    {
      int v15 = 138412290;
      id v16 = v5;
      _os_log_impl(&dword_1E2BD7000, v6, OS_LOG_TYPE_DEFAULT, "dsid query param is present in HLS URL: %@", (uint8_t *)&v15, 0xCu);
      id v7 = v5;
    }
  }

  return v7;
}

- (BOOL)_url:(id)a3 hasSameAdamIDAsURL:(id)a4
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  id v7 = v6;
  char v8 = 0;
  if (v5 && v6)
  {
    uint64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4F29088]) initWithURL:v5 resolvingAgainstBaseURL:0];
    uint64_t v10 = [objc_alloc(MEMORY[0x1E4F29088]) initWithURL:v7 resolvingAgainstBaseURL:0];
    double v11 = (void *)v10;
    char v8 = 0;
    if (v9) {
      BOOL v12 = v10 == 0;
    }
    else {
      BOOL v12 = 1;
    }
    if (!v12)
    {
      id v37 = v9;
      uint64_t v38 = v7;
      id v13 = [v9 queryItems];
      id v14 = [v11 queryItems];
      long long v43 = 0u;
      long long v44 = 0u;
      long long v45 = 0u;
      long long v46 = 0u;
      id v15 = v13;
      uint64_t v16 = [v15 countByEnumeratingWithState:&v43 objects:v48 count:16];
      long long v36 = v11;
      if (v16)
      {
        uint64_t v17 = v16;
        long long v34 = v14;
        uint64_t v18 = *(void *)v44;
        while (2)
        {
          for (uint64_t i = 0; i != v17; ++i)
          {
            if (*(void *)v44 != v18) {
              objc_enumerationMutation(v15);
            }
            id v20 = *(void **)(*((void *)&v43 + 1) + 8 * i);
            int v21 = [v20 name];
            uint64_t v22 = [v21 caseInsensitiveCompare:@"a"];

            if (!v22)
            {
              long long v35 = [v20 value];
              goto LABEL_17;
            }
          }
          uint64_t v17 = [v15 countByEnumeratingWithState:&v43 objects:v48 count:16];
          if (v17) {
            continue;
          }
          break;
        }
        long long v35 = 0;
LABEL_17:
        id v14 = v34;
      }
      else
      {
        long long v35 = 0;
      }

      long long v41 = 0u;
      long long v42 = 0u;
      long long v39 = 0u;
      long long v40 = 0u;
      id v23 = v14;
      uint64_t v24 = [v23 countByEnumeratingWithState:&v39 objects:v47 count:16];
      if (v24)
      {
        uint64_t v25 = v24;
        uint64_t v26 = *(void *)v40;
        while (2)
        {
          for (uint64_t j = 0; j != v25; ++j)
          {
            if (*(void *)v40 != v26) {
              objc_enumerationMutation(v23);
            }
            id v28 = *(void **)(*((void *)&v39 + 1) + 8 * j);
            id v29 = [v28 name];
            uint64_t v30 = [v29 caseInsensitiveCompare:@"a"];

            if (!v30)
            {
              uint64_t v31 = [v28 value];

              char v8 = 0;
              uint64_t v32 = v35;
              if (v35)
              {
                uint64_t v9 = v37;
                id v7 = v38;
                double v11 = v36;
                if (v31) {
                  char v8 = [v35 isEqualToString:v31];
                }
              }
              else
              {
                uint64_t v9 = v37;
                id v7 = v38;
                double v11 = v36;
              }
              goto LABEL_32;
            }
          }
          uint64_t v25 = [v23 countByEnumeratingWithState:&v39 objects:v47 count:16];
          if (v25) {
            continue;
          }
          break;
        }
      }

      uint64_t v31 = 0;
      char v8 = 0;
      uint64_t v9 = v37;
      id v7 = v38;
      uint64_t v32 = v35;
      double v11 = v36;
LABEL_32:
    }
  }

  return v8;
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

- (unint64_t)playbackContext
{
  return self->_playbackContext;
}

- (void)setPlaybackContext:(unint64_t)a3
{
  self->_playbackContext = a3;
}

- (NSURL)hlsPlaybackURL
{
  return self->_hlsPlaybackURL;
}

- (void)setHlsPlaybackURL:(id)a3
{
}

- (unint64_t)loadingContext
{
  return self->_loadingContext;
}

- (void)setLoadingContext:(unint64_t)a3
{
  self->_loadingContext = a3;
}

- (NSDictionary)sinfsDict
{
  return self->_sinfsDict;
}

- (void)setSinfsDict:(id)a3
{
}

- (NSNumber)fileSize
{
  return self->_fileSize;
}

- (void)setFileSize:(id)a3
{
}

- (NSURL)downloadDestinationURL
{
  return self->_downloadDestinationURL;
}

- (void)setDownloadDestinationURL:(id)a3
{
}

- (NSNumber)downloadToken
{
  return self->_downloadToken;
}

- (void)setDownloadToken:(id)a3
{
}

- (VUIStoreFPSKeyLoader)storeFPSKeyLoader
{
  return self->_storeFPSKeyLoader;
}

- (void)setStoreFPSKeyLoader:(id)a3
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

- (NSURL)playbackURL
{
  return self->_playbackURL;
}

- (void)setPlaybackURL:(id)a3
{
}

- (VUIStoreDownloadMonitor)downloadMonitor
{
  return self->_downloadMonitor;
}

- (void)setDownloadMonitor:(id)a3
{
}

- (BOOL)needsRentalCheckin
{
  return self->_needsRentalCheckin;
}

- (void)setNeedsRentalCheckin:(BOOL)a3
{
  self->_needsRentalCheckin = a3;
}

- (NSObject)parentReportingToken
{
  return self->_parentReportingToken;
}

- (void)setParentReportingToken:(id)a3
{
}

- (NSError)fpsKeyError
{
  return self->_fpsKeyError;
}

- (void)setFpsKeyError:(id)a3
{
}

- (BOOL)needsRentalCheckoutPriorToPlayback
{
  return self->_needsRentalCheckoutPriorToPlayback;
}

- (void)setNeedsRentalCheckoutPriorToPlayback:(BOOL)a3
{
  self->_needsRentalCheckoutPriorToPlayback = a3;
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

- (BOOL)useSidebandLibraryForPlaybackKeys
{
  return self->_useSidebandLibraryForPlaybackKeys;
}

- (void)setUseSidebandLibraryForPlaybackKeys:(BOOL)a3
{
  self->_useSidebandLibraryForPlaybackKeys = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_videoManagedObject, 0);
  objc_storeStrong((id *)&self->_fpsKeyError, 0);
  objc_storeStrong((id *)&self->_parentReportingToken, 0);
  objc_storeStrong((id *)&self->_downloadMonitor, 0);
  objc_storeStrong((id *)&self->_playbackURL, 0);
  objc_storeStrong((id *)&self->_storeFPSKeyLoader, 0);
  objc_storeStrong((id *)&self->_downloadToken, 0);
  objc_storeStrong((id *)&self->_downloadDestinationURL, 0);
  objc_storeStrong((id *)&self->_fileSize, 0);
  objc_storeStrong((id *)&self->_sinfsDict, 0);
  objc_storeStrong((id *)&self->_hlsPlaybackURL, 0);
  objc_storeStrong((id *)&self->_fpsAdditionalServerParams, 0);
  objc_storeStrong((id *)&self->_fpsKeyServerURL, 0);
  objc_storeStrong((id *)&self->_fpsCertificateURL, 0);
}

- (void)mediaItemMetadataForProperty:.cold.1()
{
  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_2_4(&dword_1E2BD7000, MEMORY[0x1E4F14500], v0, "Unable to deserialize qosMetrics: %@", v1, v2, v3, v4, v5);
}

- (void)mediaItemMetadataForProperty:(uint64_t)a3 .cold.2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)setMediaItemMetadata:forProperty:.cold.1()
{
  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_2_4(&dword_1E2BD7000, MEMORY[0x1E4F14500], v0, "Unable to serialize qosMetrics data: %@", v1, v2, v3, v4, v5);
}

- (void)processFinishedDownloadWithCompletion:.cold.1()
{
  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_2_4(&dword_1E2BD7000, v0, v1, "Error processings sinfs: %@", v2, v3, v4, v5, v6);
}

- (void)processFinishedDownloadWithCompletion:.cold.2()
{
  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_2_4(&dword_1E2BD7000, v0, v1, "Error renaming file URL: %@", v2, v3, v4, v5, v6);
}

- (void)_offlineKeyDataForKeyRequest:.cold.1()
{
  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_2_4(&dword_1E2BD7000, v0, v1, "Unable to unarchive offline key data: %@", v2, v3, v4, v5, v6);
}

@end