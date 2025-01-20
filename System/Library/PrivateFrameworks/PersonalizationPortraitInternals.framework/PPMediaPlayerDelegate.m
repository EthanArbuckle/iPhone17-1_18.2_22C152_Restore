@interface PPMediaPlayerDelegate
+ (id)bundleIdOfCurrentForegroundApp;
- (PPMediaPlayerDelegate)init;
- (PPMediaPlayerDelegate)initWithNamedEntityStore:(id)a3 donationDelaySeconds:(double)a4 registersResponseLoading:(BOOL)a5 useNamedEntityDissector:(BOOL)a6;
- (id)getResponse;
- (void)_donateDelayedResponse:(id)a3 timePlayed:(double)a4 bundleId:(id)a5;
- (void)_registerForNowPlayingNotifications;
- (void)processResponse:(id)a3;
- (void)waitForQueueEmpty;
@end

@implementation PPMediaPlayerDelegate

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_pendingDonationTimestamp, 0);
  objc_storeStrong((id *)&self->_pendingDonation, 0);
  objc_storeStrong((id *)&self->_namedEntityStore, 0);
}

- (void)waitForQueueEmpty
{
}

- (void)processResponse:(id)a3
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v6 = objc_opt_new();
  v7 = pp_entities_log_handle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v28 = [v5 title];
    uint64_t v23 = [v28 length];
    unsigned int v24 = [v5 state];
    v25 = [v5 bundleID];
    v26 = [v5 playerID];
    *(_DWORD *)buf = 134219010;
    uint64_t v34 = v23;
    __int16 v35 = 1024;
    unsigned int v36 = v24;
    __int16 v37 = 2112;
    v38 = v6;
    __int16 v39 = 2112;
    v40 = v25;
    __int16 v41 = 2112;
    v42 = v26;
    _os_log_debug_impl(&dword_1CA9A8000, v7, OS_LOG_TYPE_DEBUG, "PPMediaPlayerDelegate: processResponse: title.length:%tu state:%d timestamp:%@ bundleId:%@ playerId:%@", buf, 0x30u);
  }
  if ([v5 state] != 1
    || ([v5 isEqualToResponse:self->_pendingDonation] & 1) == 0)
  {
    p_pendingDonation = &self->_pendingDonation;
    v9 = self->_pendingDonation;
    v10 = self->_pendingDonationTimestamp;
    if ([v5 state] == 1)
    {
      objc_storeStrong((id *)&self->_pendingDonation, a3);
      v11 = v6;
    }
    else
    {
      v12 = *p_pendingDonation;
      *p_pendingDonation = 0;

      v11 = 0;
    }
    pendingDonationTimestamp = self->_pendingDonationTimestamp;
    self->_pendingDonationTimestamp = v11;

    v14 = objc_opt_new();
    [v14 timeIntervalSinceDate:v10];
    double v16 = v15;

    if (v9 && v16 >= self->_donationDelaySeconds)
    {
      v17 = [(PPMediaPlayerResponse *)v9 bundleID];
      if (([v17 hasPrefix:@"com.apple.WebKit"] & 1) == 0
        && ([v17 isEqualToString:*MEMORY[0x1E4F8A0E8]] & 1) == 0)
      {
        v18 = pp_entities_log_handle();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          v27 = [(PPMediaPlayerResponse *)v9 title];
          uint64_t v19 = [v27 length];
          unsigned int v20 = [(PPMediaPlayerResponse *)v9 state];
          v21 = [(PPMediaPlayerResponse *)v9 playerID];
          *(_DWORD *)buf = 134218754;
          uint64_t v34 = v19;
          __int16 v35 = 1024;
          unsigned int v36 = v20;
          __int16 v37 = 2112;
          v38 = v17;
          __int16 v39 = 2112;
          v40 = v21;
          _os_log_impl(&dword_1CA9A8000, v18, OS_LOG_TYPE_DEFAULT, "PPMediaPlayerDelegate: donating response: title.length:%tu state:%d bundleId:%@ playerId:%@", buf, 0x26u);
        }
        dispatchQueue = self->_dispatchQueue;
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __41__PPMediaPlayerDelegate_processResponse___block_invoke;
        block[3] = &unk_1E65DB3B0;
        block[4] = self;
        v30 = v9;
        double v32 = v16;
        id v31 = v17;
        dispatch_async(dispatchQueue, block);
      }
    }
  }
}

uint64_t __41__PPMediaPlayerDelegate_processResponse___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _donateDelayedResponse:*(void *)(a1 + 40) timePlayed:*(void *)(a1 + 48) bundleId:*(double *)(a1 + 56)];
}

- (id)getResponse
{
  v2 = objc_opt_new();
  v3 = dispatch_group_create();
  dispatch_group_enter(v3);
  Default = (const void *)MRPlaybackQueueRequestCreateDefault();
  id v9 = v2;
  v10 = v3;
  MRMediaRemoteRequestNowPlayingPlaybackQueueSync();
  dispatch_group_enter(v10);
  id v5 = v9;
  v6 = v10;
  MRMediaRemoteGetNowPlayingApplicationPlaybackState();
  dispatch_group_wait(v6, 0xFFFFFFFFFFFFFFFFLL);
  if (Default) {
    CFRelease(Default);
  }
  id v7 = v5;

  return v7;
}

void __36__PPMediaPlayerDelegate_getResponse__block_invoke(uint64_t a1, void *a2)
{
  id v31 = a2;
  v3 = [v31 resolvedPlayerPath];
  v4 = [v3 player];
  id v5 = [v4 displayName];
  [*(id *)(a1 + 32) setPlayerID:v5];

  v6 = [v31 resolvedPlayerPath];
  id v7 = [v6 client];
  v8 = [v7 bundleIdentifier];
  [*(id *)(a1 + 32) setBundleID:v8];

  id v9 = [v31 contentItems];
  uint64_t v10 = [v9 count];

  if (v10)
  {
    v11 = [v31 contentItems];
    v12 = [v11 objectAtIndexedSubscript:0];
    v13 = [v12 metadata];
    v14 = [v13 title];
    [*(id *)(a1 + 32) setTitle:v14];

    double v15 = [v31 contentItems];
    double v16 = [v15 objectAtIndexedSubscript:0];
    v17 = [v16 metadata];
    v18 = [v17 albumName];
    [*(id *)(a1 + 32) setAlbum:v18];

    uint64_t v19 = [v31 contentItems];
    unsigned int v20 = [v19 objectAtIndexedSubscript:0];
    v21 = [v20 metadata];
    v22 = [v21 trackArtistName];
    [*(id *)(a1 + 32) setArtist:v22];

    uint64_t v23 = NSNumber;
    unsigned int v24 = [v31 contentItems];
    v25 = [v24 objectAtIndexedSubscript:0];
    v26 = [v25 metadata];
    v27 = objc_msgSend(v23, "numberWithLongLong:", objc_msgSend(v26, "iTunesStoreIdentifier"));
    [*(id *)(a1 + 32) setStoreItemID:v27];

    v28 = [v31 contentItems];
    v29 = [v28 objectAtIndexedSubscript:0];
    v30 = [v29 metadata];
    [v30 duration];
    objc_msgSend(*(id *)(a1 + 32), "setDuration:");
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void __36__PPMediaPlayerDelegate_getResponse__block_invoke_2(uint64_t a1, uint64_t a2)
{
  [*(id *)(a1 + 32) setState:a2];
  v3 = *(NSObject **)(a1 + 40);
  dispatch_group_leave(v3);
}

- (void)_donateDelayedResponse:(id)a3 timePlayed:(double)a4 bundleId:(id)a5
{
  uint64_t v148 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  if (v8)
  {
    uint64_t v10 = [v8 title];
    uint64_t v11 = [v10 length];

    if (v11)
    {
      if ([v9 length])
      {
        [v8 duration];
        double v13 = fmin(a4 / v12, 1.0);
        if (v13 < 0.0) {
          double v13 = 0.0;
        }
        if (v12 > 0.0) {
          double v14 = v13;
        }
        else {
          double v14 = 1.0;
        }
        double v15 = [objc_alloc(MEMORY[0x1E4F89F48]) initWithDwellTimeSeconds:a4 lengthSeconds:v12 lengthCharacters:0 donationCount:0 contactHandleCount:0 flags:0];
        uint64_t v16 = [v8 storeItemID];
        if (v16
          && (v17 = (void *)v16,
              [v8 storeItemID],
              v18 = objc_claimAutoreleasedReturnValue(),
              uint64_t v19 = [v18 longValue],
              v18,
              v17,
              v19))
        {
          id v20 = [NSString alloc];
          v21 = [v8 storeItemID];
          uint64_t v22 = [v20 initWithFormat:@"storeAdamID:%@", v21];
        }
        else
        {
          v21 = objc_opt_new();
          uint64_t v22 = [v21 UUIDString];
        }
        uint64_t v23 = (void *)v22;

        id v24 = objc_alloc(MEMORY[0x1E4F89F40]);
        uint64_t v25 = *MEMORY[0x1E4F8A158];
        v26 = objc_opt_new();
        v27 = (void *)[v24 initWithBundleId:v9 groupId:v25 documentId:v23 date:v26 relevanceDate:0 contactHandles:0 language:0 metadata:v15];

        uint64_t v28 = objc_opt_new();
        v29 = (void *)v28;
        v113 = self;
        v114 = v23;
        if (self->_useNamedEntityDissector)
        {
          v123 = (void *)v28;
          v107 = v15;
          v30 = +[PPConfiguration sharedInstance];
          id v31 = [v27 language];
          id v108 = v9;
          uint64_t v32 = [v30 extractionAlgorithmsForBundleId:v9 sourceLanguage:v31 conservative:1 domain:1];

          v33 = +[PPNamedEntityDissector sharedInstance];
          v112 = v8;
          uint64_t v34 = [v8 title];
          v109 = v33;
          v110 = (void *)v32;
          v111 = v27;
          __int16 v35 = [v33 entitiesInPlainText:v34 eligibleRegions:0 source:v27 cloudSync:0 algorithms:v32];

          long long v140 = 0u;
          long long v141 = 0u;
          long long v138 = 0u;
          long long v139 = 0u;
          id v36 = v35;
          uint64_t v117 = [v36 countByEnumeratingWithState:&v138 objects:v147 count:16];
          if (v117)
          {
            uint64_t v115 = *(void *)v139;
            v119 = v36;
            do
            {
              uint64_t v37 = 0;
              do
              {
                if (*(void *)v139 != v115) {
                  objc_enumerationMutation(v36);
                }
                uint64_t v121 = v37;
                v38 = *(void **)(*((void *)&v138 + 1) + 8 * v37);
                long long v134 = 0u;
                long long v135 = 0u;
                long long v136 = 0u;
                long long v137 = 0u;
                __int16 v39 = [v38 entities];
                uint64_t v40 = [v39 countByEnumeratingWithState:&v134 objects:v146 count:16];
                if (v40)
                {
                  uint64_t v41 = v40;
                  uint64_t v42 = *(void *)v135;
                  do
                  {
                    for (uint64_t i = 0; i != v41; ++i)
                    {
                      if (*(void *)v135 != v42) {
                        objc_enumerationMutation(v39);
                      }
                      v44 = *(void **)(*((void *)&v134 + 1) + 8 * i);
                      v45 = (void *)MEMORY[0x1CB79D060]();
                      id v46 = objc_alloc(MEMORY[0x1E4F89E90]);
                      v47 = [v44 item];
                      v48 = [v47 name];
                      v49 = [v44 item];
                      v50 = [v49 bestLanguage];
                      v51 = (void *)[v46 initWithName:v48 category:6 language:v50];

                      v52 = (void *)[objc_alloc(MEMORY[0x1E4F89F00]) initWithItem:v51 score:v14];
                      [v123 addObject:v52];
                    }
                    uint64_t v41 = [v39 countByEnumeratingWithState:&v134 objects:v146 count:16];
                  }
                  while (v41);
                }

                id v36 = v119;
                uint64_t v37 = v121 + 1;
              }
              while (v121 + 1 != v117);
              uint64_t v117 = [v119 countByEnumeratingWithState:&v138 objects:v147 count:16];
            }
            while (v117);
          }

          id v8 = v112;
          v53 = [v112 album];
          uint64_t v54 = [v53 length];

          if (v54)
          {
            v55 = [v112 album];
            v56 = [v109 entitiesInPlainText:v55 eligibleRegions:0 source:v111 cloudSync:0 algorithms:v110];

            long long v132 = 0u;
            long long v133 = 0u;
            long long v130 = 0u;
            long long v131 = 0u;
            id v36 = v56;
            uint64_t v118 = [v36 countByEnumeratingWithState:&v130 objects:v145 count:16];
            if (v118)
            {
              uint64_t v116 = *(void *)v131;
              v120 = v36;
              do
              {
                uint64_t v57 = 0;
                do
                {
                  if (*(void *)v131 != v116) {
                    objc_enumerationMutation(v36);
                  }
                  uint64_t v122 = v57;
                  v58 = *(void **)(*((void *)&v130 + 1) + 8 * v57);
                  long long v126 = 0u;
                  long long v127 = 0u;
                  long long v128 = 0u;
                  long long v129 = 0u;
                  v59 = [v58 entities];
                  uint64_t v60 = [v59 countByEnumeratingWithState:&v126 objects:v144 count:16];
                  if (v60)
                  {
                    uint64_t v61 = v60;
                    uint64_t v62 = *(void *)v127;
                    do
                    {
                      for (uint64_t j = 0; j != v61; ++j)
                      {
                        if (*(void *)v127 != v62) {
                          objc_enumerationMutation(v59);
                        }
                        v64 = *(void **)(*((void *)&v126 + 1) + 8 * j);
                        v65 = (void *)MEMORY[0x1CB79D060]();
                        id v66 = objc_alloc(MEMORY[0x1E4F89E90]);
                        v67 = [v64 item];
                        v68 = [v67 name];
                        v69 = [v64 item];
                        v70 = [v69 bestLanguage];
                        v71 = (void *)[v66 initWithName:v68 category:6 language:v70];

                        v72 = (void *)[objc_alloc(MEMORY[0x1E4F89F00]) initWithItem:v71 score:v14];
                        [v123 addObject:v72];
                      }
                      uint64_t v61 = [v59 countByEnumeratingWithState:&v126 objects:v144 count:16];
                    }
                    while (v61);
                  }

                  id v36 = v120;
                  uint64_t v57 = v122 + 1;
                }
                while (v122 + 1 != v118);
                uint64_t v118 = [v120 countByEnumeratingWithState:&v130 objects:v145 count:16];
              }
              while (v118);
            }

            id v8 = v112;
          }
          double v15 = v107;
          id v9 = v108;
          v73 = v113;
          v27 = v111;
          v29 = v123;
        }
        else
        {
          id v75 = objc_alloc(MEMORY[0x1E4F89E90]);
          v76 = [v8 title];
          v77 = [MEMORY[0x1E4F89FC8] currentLocaleLanguageCode];
          v78 = (void *)[v75 initWithName:v76 category:6 language:v77];

          v79 = (void *)[objc_alloc(MEMORY[0x1E4F89F00]) initWithItem:v78 score:v14];
          [v29 addObject:v79];
          v80 = [v8 album];
          uint64_t v81 = [v80 length];

          if (v81)
          {
            id v82 = objc_alloc(MEMORY[0x1E4F89E90]);
            v83 = [v8 album];
            v84 = [MEMORY[0x1E4F89FC8] currentLocaleLanguageCode];
            v85 = (void *)[v82 initWithName:v83 category:6 language:v84];

            v86 = (void *)[objc_alloc(MEMORY[0x1E4F89F00]) initWithItem:v85 score:v14];
            [v29 addObject:v86];
          }
          v73 = v113;
        }
        v87 = [v8 artist];
        uint64_t v88 = [v87 length];

        if (v88)
        {
          id v89 = objc_alloc(MEMORY[0x1E4F89E90]);
          v90 = [v8 artist];
          v91 = [MEMORY[0x1E4F89FC8] currentLocaleLanguageCode];
          v92 = (void *)[v89 initWithName:v90 category:7 language:v91];

          v93 = (void *)[objc_alloc(MEMORY[0x1E4F89F00]) initWithItem:v92 score:v14];
          [v29 addObject:v93];
        }
        v94 = pp_entities_log_handle();
        if (os_log_type_enabled(v94, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v95 = [v29 count];
          *(_DWORD *)buf = 134217984;
          uint64_t v143 = v95;
          _os_log_impl(&dword_1CA9A8000, v94, OS_LOG_TYPE_DEFAULT, "PPMediaPlayerDelegate: entity count: %tu", buf, 0xCu);
        }

        if ([v29 count])
        {
          namedEntityStore = v73->_namedEntityStore;
          id v125 = 0;
          v97 = v29;
          v98 = v29;
          v99 = v27;
          BOOL v100 = [(PPNamedEntityStore *)namedEntityStore donateNamedEntities:v98 source:v27 algorithm:8 cloudSync:0 sentimentScore:&v125 error:0.0];
          id v101 = v125;
          if (v100)
          {
            v102 = v73->_namedEntityStore;
            id v124 = 0;
            BOOL v103 = [(PPNamedEntityStore *)v102 flushDonationsWithError:&v124];
            v104 = v124;
            if (!v103)
            {
              v105 = pp_default_log_handle();
              if (os_log_type_enabled(v105, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412290;
                uint64_t v143 = (uint64_t)v104;
                _os_log_impl(&dword_1CA9A8000, v105, OS_LOG_TYPE_DEFAULT, "PPMediaPlayerDelegate: Warning: failed to flush: %@", buf, 0xCu);
              }
            }
            v106 = pp_entities_log_handle();
            if (os_log_type_enabled(v106, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_1CA9A8000, v106, OS_LOG_TYPE_DEFAULT, "PPMediaPlayerDelegate: completed donation.", buf, 2u);
            }
          }
          else
          {
            v104 = pp_entities_log_handle();
            if (os_log_type_enabled(v104, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              uint64_t v143 = (uint64_t)v101;
              _os_log_error_impl(&dword_1CA9A8000, v104, OS_LOG_TYPE_ERROR, "PPMediaPlayerDelegate: failed to donate named entities: %@", buf, 0xCu);
            }
          }

          v27 = v99;
          v29 = v97;
        }
      }
      else
      {
        v74 = pp_entities_log_handle();
        if (os_log_type_enabled(v74, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_error_impl(&dword_1CA9A8000, v74, OS_LOG_TYPE_ERROR, "PPMediaPlayerDelegate: previous MRPlaybackQueue has no playerPath.bundleID", buf, 2u);
        }

        double v15 = +[PPMetricsUtils loggingQueue];
        dispatch_async(v15, &__block_literal_global_23347);
      }
    }
  }
}

void __68__PPMediaPlayerDelegate__donateDelayedResponse_timePlayed_bundleId___block_invoke()
{
  id v1 = (id)objc_opt_new();
  [v1 setSource:19];
  [v1 setErrorMessage:@"PPMediaPlayerDelegate: previous MRPlaybackQueue has no playerPath.bundleID."];
  v0 = [MEMORY[0x1E4F93728] sharedInstance];
  [v0 trackScalarForMessage:v1];
}

- (void)_registerForNowPlayingNotifications
{
  MRMediaRemoteSetWantsNowPlayingNotifications();
  LocalCenter = CFNotificationCenterGetLocalCenter();
  CFNotificationCenterAddObserver(LocalCenter, self, (CFNotificationCallback)_nowPlayingInfoCallback, (CFStringRef)*MEMORY[0x1E4F774B8], 0, CFNotificationSuspensionBehaviorDrop);
  v4 = CFNotificationCenterGetLocalCenter();
  CFStringRef v5 = (const __CFString *)*MEMORY[0x1E4F773D0];
  CFNotificationCenterAddObserver(v4, self, (CFNotificationCallback)_nowPlayingInfoCallback, v5, 0, CFNotificationSuspensionBehaviorDrop);
}

- (PPMediaPlayerDelegate)initWithNamedEntityStore:(id)a3 donationDelaySeconds:(double)a4 registersResponseLoading:(BOOL)a5 useNamedEntityDissector:(BOOL)a6
{
  BOOL v7 = a5;
  id v12 = a3;
  if (!v12)
  {
    v21 = [MEMORY[0x1E4F28B00] currentHandler];
    [v21 handleFailureInMethod:a2, self, @"PPMediaPlayerDelegate.m", 80, @"Invalid parameter not satisfying: %@", @"namedEntityStore" object file lineNumber description];
  }
  v22.receiver = self;
  v22.super_class = (Class)PPMediaPlayerDelegate;
  double v13 = [(PPMediaPlayerDelegate *)&v22 init];
  if (v13)
  {
    double v14 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    double v15 = dispatch_queue_attr_make_with_qos_class(v14, QOS_CLASS_BACKGROUND, 0);

    dispatch_queue_t v16 = dispatch_queue_create("PPMediaPlayerDelegateQueue", v15);
    dispatchQueue = v13->_dispatchQueue;
    v13->_dispatchQueue = (OS_dispatch_queue *)v16;

    objc_storeStrong((id *)&v13->_namedEntityStore, a3);
    v13->_donationDelaySeconds = a4;
    v13->_useNamedEntityDissector = a6;
    pendingDonation = v13->_pendingDonation;
    v13->_pendingDonation = 0;

    pendingDonationTimestamp = v13->_pendingDonationTimestamp;
    v13->_pendingDonationTimestamp = 0;

    if (v7) {
      [(PPMediaPlayerDelegate *)v13 _registerForNowPlayingNotifications];
    }
  }
  return v13;
}

- (PPMediaPlayerDelegate)init
{
  v3 = +[PPLocalNamedEntityStore defaultStore];
  if (v3)
  {
    self = [(PPMediaPlayerDelegate *)self initWithNamedEntityStore:v3 donationDelaySeconds:1 registersResponseLoading:1 useNamedEntityDissector:32.0];
    v4 = self;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

+ (id)bundleIdOfCurrentForegroundApp
{
  v2 = [MEMORY[0x1E4F5B6A8] userContext];
  v3 = [MEMORY[0x1E4F5B6B8] keyPathForForegroundApp];
  v4 = [v2 objectForKeyedSubscript:v3];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v5 = v4;
  }
  else {
    id v5 = 0;
  }

  return v5;
}

@end