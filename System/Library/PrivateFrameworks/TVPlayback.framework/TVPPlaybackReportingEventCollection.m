@interface TVPPlaybackReportingEventCollection
+ (double)_totalTimeSpentDoingFPSFetchesFromEndEvents:(id)a3;
+ (void)initialize;
- (BOOL)complete;
- (BOOL)containsEventWithName:(id)a3;
- (BOOL)initialFPSRequestsComplete;
- (BOOL)isDownloaded;
- (BOOL)isGroupActivity;
- (BOOL)isGroupActivityOriginator;
- (NSDictionary)rtcReportingEventDict;
- (NSDictionary)startupEventsDict;
- (NSMutableArray)eventArray;
- (NSMutableDictionary)openEvents;
- (TVPPlaybackReportingEventCollection)init;
- (int64_t)videoType;
- (void)_addEventWithName:(id)a3 type:(int64_t)a4 identifier:(id)a5 value:(id)a6 timestamp:(id)a7 forceAdd:(BOOL)a8 isUIInteraction:(BOOL)a9;
- (void)_addStartupEventWithName:(id)a3 timestamp:(double)a4 durationMS:(id)a5 toDictionary:(id)a6;
- (void)_closeOpenEvents;
- (void)_setError:(id)a3 inEventDict:(id)a4 errorCodeKey:(id)a5 errorDomainKey:(id)a6;
- (void)addEndEventWithName:(id)a3;
- (void)addEndEventWithName:(id)a3 identifier:(id)a4;
- (void)addEndEventWithName:(id)a3 identifier:(id)a4 timestamp:(id)a5;
- (void)addOrReplaceStartEventWithName:(id)a3 date:(id)a4;
- (void)addSingleShotEventWithName:(id)a3 value:(id)a4;
- (void)addStartEventWithName:(id)a3;
- (void)addStartEventWithName:(id)a3 identifier:(id)a4;
- (void)addStartEventWithName:(id)a3 isUIInteraction:(BOOL)a4;
- (void)setComplete:(BOOL)a3;
- (void)setEventArray:(id)a3;
- (void)setInitialFPSRequestsComplete:(BOOL)a3;
- (void)setIsDownloaded:(BOOL)a3;
- (void)setIsGroupActivity:(BOOL)a3;
- (void)setIsGroupActivityOriginator:(BOOL)a3;
- (void)setOpenEvents:(id)a3;
- (void)setVideoType:(int64_t)a3;
@end

@implementation TVPPlaybackReportingEventCollection

+ (void)initialize
{
  if (initialize_onceToken_0 != -1) {
    dispatch_once(&initialize_onceToken_0, &__block_literal_global_3);
  }
}

uint64_t __49__TVPPlaybackReportingEventCollection_initialize__block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.AppleTV.playback", "TVPPlaybackReportingEventCollection");
  v1 = (void *)sLogObject_0;
  sLogObject_0 = (uint64_t)v0;

  objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", TVPPlaybackReportingEventTotalStartupSequence, TVPPlaybackReportingEventPrepareForLoading, TVPPlaybackReportingEventEnsureSufficientDiskSpace, TVPPlaybackReportingEventLoadAVAssetKeysPrimary, TVPPlaybackReportingEventLoadAVAssetKeysSecondary, TVPPlaybackReportingEventLoadAVAssetKeysTotal, TVPPlaybackReportingEventPrepareForPlaybackInitiation, TVPPlaybackReportingEventBookmarkSync, TVPPlaybackReportingEventBuyProduct, TVPPlaybackReportingEventBuyProductServerProcessingTimeMS, TVPPlaybackReportingEventBuyProductBlockedPlaybackStartup, TVPPlaybackReportingEventFetchRental, TVPPlaybackReportingEventLoadBumperConfig, TVPPlaybackReportingEventRentalCheckout, TVPPlaybackReportingEventRentalCheckoutServerProcessingTimeMS, TVPPlaybackReportingEventCRABSLease, TVPPlaybackReportingEventCRABSLeaseServerProcessingTimeMS,
    TVPPlaybackReportingEventPlaybackStartupResult,
    TVPPlaybackReportingEventError,
    TVPPlaybackReportingEventErrorEvent,
    TVPPlaybackReportingEventTotalUIStartupTimeNotIncludingUserInteraction,
    @"fpsLongestCertFetchTime",
    @"fpsLongestRequestDataGenerationTime",
    @"fpsLongestServerFetchAsMeasuredByAppTime",
    @"fpsLongestServerProcessingTime",
    @"fpsLongestFetchTime",
    @"fpsFetchCount",
    TVPPlaybackReportingEventRentalCheckoutDoneInParallelWithFPSKeyFetch,
    TVPPlaybackReportingEventBookmarkSyncPerformed,
    TVPPlaybackReportingEventSyncedBookmarkMatchesPreviousBookmark,
    TVPPlaybackReportingEventFPSURLBagFetch,
    TVPPlaybackReportingEventCreatePlayerItemToLikelyToKeepUp,
    TVPPlaybackReportingEventWaitingForTimeControlStatus,
    TVPPlaybackReportingEventUserPlayToLoadingInitiation,
    @"reportingKeysWereOmittedDueToReportingError",
    TVPPlaybackReportingEventOpenURLTime,
    TVPPlaybackReportingEventPlaybackInitiationAction,
    TVPPlaybackReportingEventLinearTokenFetch,
    TVPPlaybackReportingEventLongestFetchLocationAuthorizationStatus,
    TVPPlaybackReportingEventHLSPlaylistPreloadState,
  uint64_t v2 = 0);
  v3 = (void *)sReportableEvents;
  sReportableEvents = v2;

  sFPSIndividualEvents = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", TVPPlaybackReportingEventFPSCertFetch, TVPPlaybackReportingEventFPSRequestDataGeneration, TVPPlaybackReportingEventFPSServerKeyFetch, TVPPlaybackReportingEventFPSServerProcessingTimeMS, TVPPlaybackReportingEventFPSOverallFetch, TVPPlaybackReportingEventFPSUsingCachedCertData, TVPPlaybackReportingEventLinearTokenFetch, TVPPlaybackReportingEventFetchLocationAuthorizationStatus, 0);
  return MEMORY[0x270F9A758]();
}

- (TVPPlaybackReportingEventCollection)init
{
  v8.receiver = self;
  v8.super_class = (Class)TVPPlaybackReportingEventCollection;
  uint64_t v2 = [(TVPPlaybackReportingEventCollection *)&v8 init];
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    eventArray = v2->_eventArray;
    v2->_eventArray = v3;

    v5 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    openEvents = v2->_openEvents;
    v2->_openEvents = v5;

    v2->_videoType = 0;
  }
  return v2;
}

- (void)addStartEventWithName:(id)a3
{
  LOBYTE(v3) = 0;
  [(TVPPlaybackReportingEventCollection *)self _addEventWithName:a3 type:0 identifier:0 value:0 timestamp:0 forceAdd:0 isUIInteraction:v3];
}

- (void)addStartEventWithName:(id)a3 isUIInteraction:(BOOL)a4
{
  LOBYTE(v4) = a4;
  [(TVPPlaybackReportingEventCollection *)self _addEventWithName:a3 type:0 identifier:0 value:0 timestamp:0 forceAdd:0 isUIInteraction:v4];
}

- (void)addOrReplaceStartEventWithName:(id)a3 date:(id)a4
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v19 = 0;
  v20 = &v19;
  uint64_t v21 = 0x2020000000;
  uint64_t v22 = 0x7FFFFFFFFFFFFFFFLL;
  if (v6)
  {
    objc_super v8 = [(TVPPlaybackReportingEventCollection *)self eventArray];
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __75__TVPPlaybackReportingEventCollection_addOrReplaceStartEventWithName_date___block_invoke;
    v16[3] = &unk_264CC5150;
    id v9 = v6;
    id v17 = v9;
    v18 = &v19;
    [v8 enumerateObjectsUsingBlock:v16];

    if (v20[3] != 0x7FFFFFFFFFFFFFFFLL)
    {
      v10 = sLogObject_0;
      if (os_log_type_enabled((os_log_t)sLogObject_0, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v24 = v9;
        _os_log_impl(&dword_236FC5000, v10, OS_LOG_TYPE_DEFAULT, "Replacing start event with name %@", buf, 0xCu);
      }
      v11 = [(TVPPlaybackReportingEventCollection *)self eventArray];
      [v11 removeObjectAtIndex:v20[3]];

      v12 = [(TVPPlaybackReportingEventCollection *)self openEvents];
      [v12 removeObjectForKey:v9];
    }
  }
  if (v7)
  {
    v13 = NSNumber;
    [v7 timeIntervalSinceReferenceDate];
    v14 = objc_msgSend(v13, "numberWithDouble:");
  }
  else
  {
    v14 = 0;
  }
  LOBYTE(v15) = 0;
  [(TVPPlaybackReportingEventCollection *)self _addEventWithName:v6 type:0 identifier:0 value:0 timestamp:v14 forceAdd:0 isUIInteraction:v15];

  _Block_object_dispose(&v19, 8);
}

void __75__TVPPlaybackReportingEventCollection_addOrReplaceStartEventWithName_date___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v9 = a2;
  id v7 = [v9 name];
  if ([v7 isEqualToString:*(void *)(a1 + 32)])
  {
    uint64_t v8 = [v9 type];

    if (!v8)
    {
      *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a3;
      *a4 = 1;
    }
  }
  else
  {
  }
}

- (void)addStartEventWithName:(id)a3 identifier:(id)a4
{
  LOBYTE(v4) = 0;
  [(TVPPlaybackReportingEventCollection *)self _addEventWithName:a3 type:0 identifier:a4 value:0 timestamp:0 forceAdd:0 isUIInteraction:v4];
}

- (void)addEndEventWithName:(id)a3
{
  LOBYTE(v3) = 0;
  [(TVPPlaybackReportingEventCollection *)self _addEventWithName:a3 type:1 identifier:0 value:0 timestamp:0 forceAdd:0 isUIInteraction:v3];
}

- (void)addEndEventWithName:(id)a3 identifier:(id)a4
{
  LOBYTE(v4) = 0;
  [(TVPPlaybackReportingEventCollection *)self _addEventWithName:a3 type:1 identifier:a4 value:0 timestamp:0 forceAdd:0 isUIInteraction:v4];
}

- (void)addEndEventWithName:(id)a3 identifier:(id)a4 timestamp:(id)a5
{
  LOBYTE(v5) = 0;
  [(TVPPlaybackReportingEventCollection *)self _addEventWithName:a3 type:1 identifier:a4 value:0 timestamp:a5 forceAdd:0 isUIInteraction:v5];
}

- (void)addSingleShotEventWithName:(id)a3 value:(id)a4
{
  LOBYTE(v4) = 0;
  [(TVPPlaybackReportingEventCollection *)self _addEventWithName:a3 type:3 identifier:0 value:a4 timestamp:0 forceAdd:0 isUIInteraction:v4];
}

- (BOOL)containsEventWithName:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  uint64_t v5 = [(TVPPlaybackReportingEventCollection *)self eventArray];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __61__TVPPlaybackReportingEventCollection_containsEventWithName___block_invoke;
  v8[3] = &unk_264CC5150;
  id v6 = v4;
  id v9 = v6;
  v10 = &v11;
  [v5 enumerateObjectsUsingBlock:v8];

  LOBYTE(v5) = *((unsigned char *)v12 + 24);
  _Block_object_dispose(&v11, 8);

  return (char)v5;
}

void __61__TVPPlaybackReportingEventCollection_containsEventWithName___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v6 = [a2 name];
  int v7 = [v6 isEqualToString:*(void *)(a1 + 32)];

  if (v7)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
    *a4 = 1;
  }
}

- (void)setComplete:(BOOL)a3
{
  if (self->_complete != a3)
  {
    self->_complete = a3;
    [(TVPPlaybackReportingEventCollection *)self _closeOpenEvents];
  }
}

- (NSDictionary)rtcReportingEventDict
{
  uint64_t v170 = *MEMORY[0x263EF8340];
  id v153 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  p_vtable = &OBJC_METACLASS___TVPPlaybackReportingEventCollection.vtable;
  uint64_t v3 = (id)sLogObject_0;
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_236FC5000, v3, OS_LOG_TYPE_DEFAULT, "Playback startup events:", buf, 2u);
  }

  id v151 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v161 = 0u;
  long long v162 = 0u;
  long long v163 = 0u;
  long long v164 = 0u;
  id obj = [(TVPPlaybackReportingEventCollection *)self eventArray];
  uint64_t v4 = [obj countByEnumeratingWithState:&v161 objects:v169 count:16];
  unint64_t v5 = 0x263F08000uLL;
  unint64_t v6 = 0x2688EC000uLL;
  unint64_t v7 = 0x2688EC000uLL;
  if (!v4)
  {
    uint64_t v152 = 0;
    double v9 = 0.0;
    double v10 = 0.0;
    double v11 = 0.0;
    double v12 = 0.0;
    double v13 = 0.0;
    double v155 = 0.0;
    double v156 = 0.0;
    double v154 = 0.0;
    double v14 = 0.0;
    double v15 = 0.0;
    double v16 = 0.0;
    goto LABEL_103;
  }
  uint64_t v8 = v4;
  uint64_t v152 = 0;
  uint64_t v159 = *(void *)v162;
  uint64_t v147 = *MEMORY[0x263F08608];
  double v9 = 0.0;
  double v10 = 0.0;
  double v11 = 0.0;
  double v12 = 0.0;
  double v13 = 0.0;
  double v155 = 0.0;
  double v156 = 0.0;
  double v154 = 0.0;
  double v14 = 0.0;
  double v15 = 0.0;
  double v16 = 0.0;
  do
  {
    uint64_t v17 = 0;
    uint64_t v157 = v8;
    do
    {
      if (*(void *)v162 != v159) {
        objc_enumerationMutation(obj);
      }
      v18 = *(void **)(*((void *)&v161 + 1) + 8 * v17);
      uint64_t v19 = (void *)sReportableEvents;
      v20 = [v18 name];
      LODWORD(v19) = [v19 containsObject:v20];

      if (v19)
      {
        if ([v18 type] == 3)
        {
          uint64_t v21 = [v18 name];
          if (v21)
          {
            uint64_t v22 = (void *)v21;
            v23 = [v18 value];

            if (v23)
            {
              id v24 = [v18 name];
              int v25 = [v24 isEqualToString:TVPPlaybackReportingEventError];

              v26 = [v18 value];
              if (!v25) {
                goto LABEL_21;
              }
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                id v27 = v26;
                v28 = [v27 userInfo];
                v29 = [v28 objectForKey:v147];

                [(TVPPlaybackReportingEventCollection *)self _setError:v27 inEventDict:v153 errorCodeKey:@"errorCode" errorDomainKey:@"errorDomain"];
                objc_opt_class();
                if (objc_opt_isKindOfClass()) {
                  [(TVPPlaybackReportingEventCollection *)self _setError:v29 inEventDict:v153 errorCodeKey:@"underlyingErrorCode" errorDomainKey:@"underlyingErrorDomain"];
                }

                v26 = v27;
                goto LABEL_22;
              }
              goto LABEL_23;
            }
          }
        }
        else if ([v18 type] == 1 || objc_msgSend(v18, "type") == 2)
        {
          v30 = [v18 name];

          if (v30)
          {
            v26 = objc_msgSend(*(id *)(v5 + 2584), "numberWithInteger:", objc_msgSend(v18, "durationMS"));
LABEL_21:
            id v27 = [v18 name];
            [v153 setObject:v26 forKey:v27];
LABEL_22:

LABEL_23:
            uint64_t v8 = v157;
          }
        }
      }
      if ([v18 type])
      {
        if ([v18 type] == 3)
        {
          v31 = [v18 name];
          int v32 = [v31 isEqualToString:TVPPlaybackReportingEventFPSServerProcessingTimeMS];

          if (v32)
          {
            v33 = [v18 value];
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              uint64_t v34 = [v33 integerValue];
              v35 = p_vtable[258];
              if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
              {
                double v149 = v16;
                double v36 = v15;
                double v37 = v12;
                double v38 = v14;
                double v39 = v13;
                double v40 = v10;
                double v41 = v11;
                double v42 = v9;
                double v43 = (double)v34 / 1000.0;
                v44 = v35;
                v45 = [v18 name];
                *(_DWORD *)buf = 138412546;
                v166 = v45;
                __int16 v167 = 2048;
                double v168 = v43;
                double v9 = v42;
                double v11 = v41;
                double v10 = v40;
                double v13 = v39;
                double v14 = v38;
                double v12 = v37;
                double v15 = v36;
                double v16 = v149;
                _os_log_impl(&dword_236FC5000, v44, OS_LOG_TYPE_DEFAULT, "%@: %f", buf, 0x16u);
              }
            }
          }
          else
          {
            v96 = p_vtable[258];
            if (os_log_type_enabled(v96, OS_LOG_TYPE_DEFAULT))
            {
              v97 = v96;
              v98 = [v18 name];
              double v99 = [v18 value];
              *(_DWORD *)buf = 138412546;
              v166 = v98;
              __int16 v167 = 2112;
              double v168 = v99;
              _os_log_impl(&dword_236FC5000, v97, OS_LOG_TYPE_DEFAULT, "%@: %@", buf, 0x16u);
            }
          }
          v100 = [v18 name];
          int v101 = [v100 isEqualToString:*(void *)(v6 + 3136)];

          if (v101)
          {
            v102 = [v18 value];
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              [v102 doubleValue];
              double v11 = v103;
            }
          }
          v104 = [v18 name];
          int v105 = [v104 isEqualToString:TVPPlaybackReportingEventFPSServerProcessingTimeMS];

          if (v105)
          {
            v106 = [v18 value];
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              uint64_t v107 = [v106 integerValue];
              uint64_t v108 = v152;
              if (v107 > v152) {
                uint64_t v108 = v107;
              }
              uint64_t v152 = v108;
            }
          }
          goto LABEL_96;
        }
        if ([v18 type] != 1 && objc_msgSend(v18, "type") != 2) {
          goto LABEL_96;
        }
        if ([v18 type] == 2)
        {
          v49 = p_vtable[258];
          if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
          {
            v50 = [v18 name];
            *(_DWORD *)buf = 138412290;
            v166 = v50;
            _os_log_impl(&dword_236FC5000, v49, OS_LOG_TYPE_DEFAULT, "Aborted event: %@", buf, 0xCu);
          }
        }
        v51 = p_vtable[258];
        if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
        {
          v52 = [v18 name];
          [v18 duration];
          *(_DWORD *)buf = 138412546;
          v166 = v52;
          __int16 v167 = 2048;
          double v168 = v53;
          _os_log_impl(&dword_236FC5000, v51, OS_LOG_TYPE_DEFAULT, "%@Duration: %f", buf, 0x16u);
        }
        v54 = [v18 name];
        int v55 = [v54 isEqualToString:TVPPlaybackReportingEventFPSCertFetch];

        if (v55)
        {
          [v18 duration];
          double v57 = v154;
          if (v56 >= v154) {
            double v57 = v56;
          }
          double v154 = v57;
        }
        v58 = [v18 name];
        int v59 = [v58 isEqualToString:TVPPlaybackReportingEventFPSOverallFetch];

        if (v59)
        {
          [v151 addObject:v18];
          [v18 timestamp];
          [v18 duration];
          if (v60 >= v14) {
            double v14 = v60;
          }
        }
        v61 = [v18 name];
        int v62 = [v61 isEqualToString:TVPPlaybackReportingEventFPSRequestDataGeneration];

        if (v62)
        {
          [v18 duration];
          double v64 = v155;
          if (v63 >= v155) {
            double v64 = v63;
          }
          double v155 = v64;
        }
        v65 = [v18 name];
        int v66 = [v65 isEqualToString:TVPPlaybackReportingEventFPSServerKeyFetch];

        if (v66)
        {
          [v18 duration];
          double v68 = v156;
          if (v67 >= v156) {
            double v68 = v67;
          }
          double v156 = v68;
        }
        v69 = [v18 name];
        int v70 = [v69 isEqualToString:TVPPlaybackReportingEventLinearTokenFetch];

        if (v70)
        {
          [v18 duration];
          if (v71 >= v13) {
            double v13 = v71;
          }
        }
        v72 = [v18 name];
        int v73 = [v72 isEqualToString:TVPPlaybackReportingEventFetchLocationAuthorizationStatus];

        if (v73)
        {
          [v18 duration];
          if (v74 >= v9) {
            double v9 = v74;
          }
        }
        v75 = [v18 name];
        int v76 = [v75 isEqualToString:TVPPlaybackReportingEventTotalStartupSequence];

        if (v76)
        {
          [v18 duration];
          [v18 duration];
          double v16 = v16 + v77;
        }
        v78 = [v18 name];
        int v79 = [v78 isEqualToString:*(void *)(v7 + 3168)];

        if (v79)
        {
          [v18 duration];
          double v15 = v15 + v80;
        }
        v81 = [v18 name];
        if (([v81 isEqualToString:TVPPlaybackReportingEventRestrictionsPasscodeDisplay] & 1) == 0)
        {
          unint64_t v82 = v7;
          unint64_t v83 = v6;
          v84 = p_vtable;
          unint64_t v85 = v5;
          v86 = [v18 name];
          if (([v86 isEqualToString:TVPPlaybackReportingEventResumeMenuDisplay] & 1) == 0)
          {
            v87 = [v18 name];
            if (([v87 isEqualToString:TVPPlaybackReportingEventPressPlayToStartDisplay] & 1) == 0)
            {
              v88 = [v18 name];
              if (([v88 isEqualToString:TVPPlaybackReportingEventBumperVideoDisplay] & 1) == 0)
              {
                v150 = [v18 name];
                if (([v150 isEqualToString:TVPPlaybackReportingEventBumperTextDisplay] & 1) == 0)
                {
                  v145 = [v18 startEvent];
                  char v146 = [v145 isUIInteraction];

                  unint64_t v5 = v85;
                  p_vtable = v84;
                  unint64_t v6 = v83;
                  unint64_t v7 = v82;
                  uint64_t v8 = v157;
                  if ((v146 & 1) == 0)
                  {
LABEL_78:
                    v91 = [v18 name];
                    int v92 = [v91 isEqualToString:TVPPlaybackReportingEventRentalCheckout];

                    if (v92)
                    {
                      [v18 duration];
                      [v18 timestamp];
                    }
                    goto LABEL_96;
                  }
LABEL_77:
                  [v18 duration];
                  double v16 = v16 - v89;
                  [v18 duration];
                  double v15 = v15 - v90;
                  goto LABEL_78;
                }
              }
            }

            uint64_t v8 = v157;
          }

          unint64_t v5 = v85;
          p_vtable = v84;
          unint64_t v6 = v83;
          unint64_t v7 = v82;
        }

        goto LABEL_77;
      }
      v46 = [v18 name];
      int v47 = [v46 isEqualToString:TVPPlaybackReportingEventFPSOverallFetch];

      if (v47)
      {
        [v18 timestamp];
        if (v12 == 0.0)
        {
          double v12 = v48;
        }
        else if (v48 < v12)
        {
          double v12 = v48;
        }
      }
      else
      {
        v93 = [v18 name];
        int v94 = [v93 isEqualToString:TVPPlaybackReportingEventCreatePlayerItemToLikelyToKeepUp];

        if (v94)
        {
          [v18 timestamp];
          double v10 = v95;
        }
      }
LABEL_96:
      ++v17;
    }
    while (v8 != v17);
    uint64_t v109 = [obj countByEnumeratingWithState:&v161 objects:v169 count:16];
    uint64_t v8 = v109;
  }
  while (v109);
LABEL_103:

  [(id)objc_opt_class() _totalTimeSpentDoingFPSFetchesFromEndEvents:v151];
  double v160 = v110;
  uint64_t v111 = [v151 count];
  if (v111)
  {
    double v112 = *(double *)&v111;
    v113 = p_vtable[258];
    if (os_log_type_enabled(v113, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v166 = @"fpsFetchCount";
      __int16 v167 = 2048;
      double v168 = v112;
      _os_log_impl(&dword_236FC5000, v113, OS_LOG_TYPE_DEFAULT, "%@: %lu", buf, 0x16u);
    }

    v114 = [*(id *)(v5 + 2584) numberWithUnsignedInteger:*(void *)&v112];
    [v153 setObject:v114 forKey:@"fpsFetchCount"];
  }
  if (v154 > 0.0)
  {
    v115 = p_vtable[258];
    if (os_log_type_enabled(v115, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v166 = @"fpsLongestCertFetchTime";
      __int16 v167 = 2048;
      double v168 = v154;
      _os_log_impl(&dword_236FC5000, v115, OS_LOG_TYPE_DEFAULT, "%@: %f", buf, 0x16u);
    }

    v116 = [*(id *)(v5 + 2584) numberWithInteger:llround(v154 * 1000.0)];
    [v153 setObject:v116 forKey:@"fpsLongestCertFetchTime"];
  }
  if (v155 > 0.0)
  {
    v117 = p_vtable[258];
    if (os_log_type_enabled(v117, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v166 = @"fpsLongestRequestDataGenerationTime";
      __int16 v167 = 2048;
      double v168 = v155;
      _os_log_impl(&dword_236FC5000, v117, OS_LOG_TYPE_DEFAULT, "%@: %f", buf, 0x16u);
    }

    v118 = [*(id *)(v5 + 2584) numberWithInteger:llround(v155 * 1000.0)];
    [v153 setObject:v118 forKey:@"fpsLongestRequestDataGenerationTime"];
  }
  if (v156 > 0.0)
  {
    v119 = p_vtable[258];
    if (os_log_type_enabled(v119, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v166 = @"fpsLongestServerFetchAsMeasuredByAppTime";
      __int16 v167 = 2048;
      double v168 = v156;
      _os_log_impl(&dword_236FC5000, v119, OS_LOG_TYPE_DEFAULT, "%@: %f", buf, 0x16u);
    }

    v120 = [*(id *)(v5 + 2584) numberWithInteger:llround(v156 * 1000.0)];
    [v153 setObject:v120 forKey:@"fpsLongestServerFetchAsMeasuredByAppTime"];
  }
  if (v152 >= 1)
  {
    v121 = p_vtable[258];
    if (os_log_type_enabled(v121, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v166 = @"fpsLongestServerProcessingTime";
      __int16 v167 = 2048;
      double v168 = (double)v152 / 1000.0;
      _os_log_impl(&dword_236FC5000, v121, OS_LOG_TYPE_DEFAULT, "%@: %f", buf, 0x16u);
    }

    v122 = [*(id *)(v5 + 2584) numberWithInteger:v152];
    [v153 setObject:v122 forKey:@"fpsLongestServerProcessingTime"];
  }
  if (v14 > 0.0)
  {
    v123 = p_vtable[258];
    if (os_log_type_enabled(v123, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v166 = @"fpsLongestFetchTime";
      __int16 v167 = 2048;
      double v168 = v14;
      _os_log_impl(&dword_236FC5000, v123, OS_LOG_TYPE_DEFAULT, "%@: %f", buf, 0x16u);
    }

    v124 = [*(id *)(v5 + 2584) numberWithInteger:llround(v14 * 1000.0)];
    [v153 setObject:v124 forKey:@"fpsLongestFetchTime"];
  }
  if (v13 > 0.0)
  {
    v125 = p_vtable[258];
    if (os_log_type_enabled(v125, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v166 = (__CFString *)TVPPlaybackReportingEventLinearTokenFetch;
      __int16 v167 = 2048;
      double v168 = v13;
      _os_log_impl(&dword_236FC5000, v125, OS_LOG_TYPE_DEFAULT, "%@: %f", buf, 0x16u);
    }

    v126 = [*(id *)(v5 + 2584) numberWithInteger:llround(v13 * 1000.0)];
    [v153 setObject:v126 forKey:TVPPlaybackReportingEventLinearTokenFetch];
  }
  if (v160 > 0.0)
  {
    v127 = p_vtable[258];
    if (os_log_type_enabled(v127, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v166 = (__CFString *)TVPPlaybackReportingEventTotalTimeSpendDoingFPSFetches;
      __int16 v167 = 2048;
      double v168 = v160;
      _os_log_impl(&dword_236FC5000, v127, OS_LOG_TYPE_DEFAULT, "%@: %f", buf, 0x16u);
    }

    v128 = [*(id *)(v5 + 2584) numberWithInteger:llround(v160 * 1000.0)];
    [v153 setObject:v128 forKey:TVPPlaybackReportingEventTotalTimeSpendDoingFPSFetches];
  }
  if (v16 > 0.0)
  {
    v129 = p_vtable[258];
    if (os_log_type_enabled(v129, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v166 = (__CFString *)TVPPlaybackReportingEventTotalUIStartupTimeNotIncludingUserInteraction;
      __int16 v167 = 2048;
      double v168 = v16;
      _os_log_impl(&dword_236FC5000, v129, OS_LOG_TYPE_DEFAULT, "%@: %f", buf, 0x16u);
    }

    v130 = [*(id *)(v5 + 2584) numberWithInteger:llround(v16 * 1000.0)];
    [v153 setObject:v130 forKey:TVPPlaybackReportingEventTotalUIStartupTimeNotIncludingUserInteraction];
  }
  if (v15 > 0.0)
  {
    v131 = p_vtable[258];
    if (os_log_type_enabled(v131, OS_LOG_TYPE_DEFAULT))
    {
      v132 = *(__CFString **)(v7 + 3168);
      *(_DWORD *)buf = 138412546;
      v166 = v132;
      __int16 v167 = 2048;
      double v168 = v15;
      _os_log_impl(&dword_236FC5000, v131, OS_LOG_TYPE_DEFAULT, "%@: %f", buf, 0x16u);
    }

    v133 = [*(id *)(v5 + 2584) numberWithInteger:llround(v15 * 1000.0)];
    [v153 setObject:v133 forKey:*(void *)(v7 + 3168)];
  }
  if (v10 > 0.0 && v12 > 0.0)
  {
    double v134 = v12 - v10;
    v135 = p_vtable[258];
    if (os_log_type_enabled(v135, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v166 = @"createAVPlayerItemToFirstFPSFetchTime";
      __int16 v167 = 2048;
      double v168 = v134;
      _os_log_impl(&dword_236FC5000, v135, OS_LOG_TYPE_DEFAULT, "%@: %f", buf, 0x16u);
    }

    if (v134 > 0.0)
    {
      v136 = [*(id *)(v5 + 2584) numberWithInteger:llround(v134 * 1000.0)];
      [v153 setObject:v136 forKey:@"createAVPlayerItemToFirstFPSFetchTime"];
    }
  }
  if (v11 > 0.0)
  {
    v137 = [*(id *)(v5 + 2584) numberWithInteger:llround(v11 * 1000.0)];
    [v153 setObject:v137 forKey:*(void *)(v6 + 3136)];
  }
  if (v9 > 0.0)
  {
    v138 = p_vtable[258];
    if (os_log_type_enabled(v138, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v166 = (__CFString *)TVPPlaybackReportingEventLongestFetchLocationAuthorizationStatus;
      __int16 v167 = 2048;
      double v168 = v9;
      _os_log_impl(&dword_236FC5000, v138, OS_LOG_TYPE_DEFAULT, "%@: %f", buf, 0x16u);
    }

    v139 = [*(id *)(v5 + 2584) numberWithInteger:llround(v9 * 1000.0)];
    [v153 setObject:v139 forKey:TVPPlaybackReportingEventLongestFetchLocationAuthorizationStatus];
  }
  v140 = objc_msgSend(*(id *)(v5 + 2584), "numberWithBool:", -[TVPPlaybackReportingEventCollection isDownloaded](self, "isDownloaded"));
  [v153 setObject:v140 forKey:@"isDownloaded"];

  v141 = objc_msgSend(*(id *)(v5 + 2584), "numberWithBool:", -[TVPPlaybackReportingEventCollection isGroupActivity](self, "isGroupActivity"));
  [v153 setObject:v141 forKey:@"isGroupActivity"];

  v142 = objc_msgSend(*(id *)(v5 + 2584), "numberWithBool:", -[TVPPlaybackReportingEventCollection isGroupActivityOriginator](self, "isGroupActivityOriginator"));
  [v153 setObject:v142 forKey:@"isGroupActivityOriginator"];

  v143 = (NSDictionary *)v153;
  return v143;
}

- (NSDictionary)startupEventsDict
{
  v47[6] = *MEMORY[0x263EF8340];
  double v41 = [(TVPPlaybackReportingEventCollection *)self rtcReportingEventDict];
  id v3 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  id v39 = objc_alloc_init(MEMORY[0x263EFF980]);
  id v38 = objc_alloc_init(MEMORY[0x263EFF980]);
  v47[0] = TVPPlaybackReportingEventUserPlayToLoadingInitiation;
  v47[1] = TVPPlaybackReportingEventPrepareForLoading;
  v47[2] = TVPPlaybackReportingEventPrepareForPlaybackInitiation;
  v47[3] = TVPPlaybackReportingEventCreatePlayerItemToLikelyToKeepUp;
  v47[4] = TVPPlaybackReportingEventWaitingForTimeControlStatus;
  v47[5] = TVPPlaybackReportingEventLoadAVAssetKeysTotal;
  uint64_t v4 = [MEMORY[0x263EFF8C0] arrayWithObjects:v47 count:6];
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  unint64_t v5 = self;
  id obj = [(TVPPlaybackReportingEventCollection *)self eventArray];
  uint64_t v6 = [obj countByEnumeratingWithState:&v42 objects:v46 count:16];
  if (!v6)
  {
    double v9 = 0.0;
    double v10 = 0.0;
    goto LABEL_29;
  }
  uint64_t v7 = v6;
  uint64_t v8 = *(void *)v43;
  double v9 = 0.0;
  double v10 = 0.0;
  do
  {
    for (uint64_t i = 0; i != v7; ++i)
    {
      double v12 = v9;
      if (*(void *)v43 != v8) {
        objc_enumerationMutation(obj);
      }
      double v13 = *(void **)(*((void *)&v42 + 1) + 8 * i);
      double v14 = [v13 name];
      if ([v4 containsObject:v14])
      {
        uint64_t v15 = [v13 type];

        if (v15 != 1) {
          goto LABEL_10;
        }
        double v14 = [v13 name];
        double v16 = [v13 startEvent];
        [v16 timestamp];
        double v18 = v17;

        uint64_t v19 = [v41 objectForKey:v14];
        [(TVPPlaybackReportingEventCollection *)v5 _addStartupEventWithName:v14 timestamp:v19 durationMS:v3 toDictionary:v18];
      }
LABEL_10:
      v20 = [v13 name];
      int v21 = [v20 isEqualToString:TVPPlaybackReportingEventTotalStartupSequence];

      if (v21)
      {
        id v22 = (id)TVPPlaybackReportingEventTotalUIStartupTimeNotIncludingUserInteraction;
        v23 = [v41 objectForKey:v22];
        id v24 = [v13 startEvent];
        [v24 timestamp];
        -[TVPPlaybackReportingEventCollection _addStartupEventWithName:timestamp:durationMS:toDictionary:](v5, "_addStartupEventWithName:timestamp:durationMS:toDictionary:", v22, v23, v3);
      }
      int v25 = [v13 name];
      int v26 = [v25 isEqualToString:TVPPlaybackReportingEventFPSOverallFetch];

      if (v26)
      {
        [v39 addObject:v13];
        [v13 timestamp];
        if (v27 >= v10) {
          double v28 = v10;
        }
        else {
          double v28 = v27;
        }
        if (v10 == 0.0) {
          double v10 = v27;
        }
        else {
          double v10 = v28;
        }
      }
      v29 = [v13 name];
      int v30 = [v29 isEqualToString:TVPPlaybackReportingEventFetchLocationAuthorizationStatus];

      if (v30)
      {
        [v38 addObject:v13];
        [v13 timestamp];
        double v9 = v31;
        if (v12 != 0.0 && v31 >= v12) {
          double v9 = v12;
        }
      }
      else
      {
        double v9 = v12;
      }
    }
    uint64_t v7 = [obj countByEnumeratingWithState:&v42 objects:v46 count:16];
  }
  while (v7);
LABEL_29:

  [(id)objc_opt_class() _totalTimeSpentDoingFPSFetchesFromEndEvents:v39];
  uint64_t v32 = TVPPlaybackReportingEventTotalTimeSpendDoingFPSFetches;
  uint64_t v34 = [NSNumber numberWithInteger:llround(v33 * 1000.0)];
  [(TVPPlaybackReportingEventCollection *)v5 _addStartupEventWithName:v32 timestamp:v34 durationMS:v3 toDictionary:v10];

  uint64_t v35 = TVPPlaybackReportingEventLongestFetchLocationAuthorizationStatus;
  double v36 = [v41 objectForKey:TVPPlaybackReportingEventLongestFetchLocationAuthorizationStatus];
  [(TVPPlaybackReportingEventCollection *)v5 _addStartupEventWithName:v35 timestamp:v36 durationMS:v3 toDictionary:v9];

  return (NSDictionary *)v3;
}

- (void)_addStartupEventWithName:(id)a3 timestamp:(double)a4 durationMS:(id)a5 toDictionary:(id)a6
{
  id v12 = a3;
  id v9 = a6;
  id v10 = a5;
  double v11 = [[TVPPlaybackStartupEvent alloc] initWithName:v12 timestamp:v10 durationMS:a4];

  if (v12) {
    [v9 setObject:v11 forKey:v12];
  }
}

- (void)_addEventWithName:(id)a3 type:(int64_t)a4 identifier:(id)a5 value:(id)a6 timestamp:(id)a7 forceAdd:(BOOL)a8 isUIInteraction:(BOOL)a9
{
  id v15 = a3;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  if (a8 || ![(TVPPlaybackReportingEventCollection *)self complete])
  {
    if ([(id)sFPSIndividualEvents containsObject:v15]
      && [(TVPPlaybackReportingEventCollection *)self initialFPSRequestsComplete])
    {
      uint64_t v19 = sLogObject_0;
      if (os_log_type_enabled((os_log_t)sLogObject_0, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)uint64_t v32 = 0;
        _os_log_impl(&dword_236FC5000, v19, OS_LOG_TYPE_DEFAULT, "Ignoring FPS event since initial FPS requests are already complete.", v32, 2u);
      }
    }
    else
    {
      v20 = objc_alloc_init(TVPPlaybackReportingEvent);
      if (!v16) {
        id v16 = v15;
      }
      [(TVPPlaybackReportingEvent *)v20 setName:v15];
      if (v18) {
        [v18 doubleValue];
      }
      else {
        [MEMORY[0x263EFF910] timeIntervalSinceReferenceDate];
      }
      -[TVPPlaybackReportingEvent setTimestamp:](v20, "setTimestamp:");
      [(TVPPlaybackReportingEvent *)v20 setType:a4];
      [(TVPPlaybackReportingEvent *)v20 setValue:v17];
      [(TVPPlaybackReportingEvent *)v20 setIsUIInteraction:a9];
      int v21 = [(TVPPlaybackReportingEventCollection *)self eventArray];
      [v21 addObject:v20];

      if (a4)
      {
        if ((unint64_t)a4 <= 2)
        {
          id v22 = [(TVPPlaybackReportingEventCollection *)self openEvents];
          v23 = [v22 objectForKey:v16];

          [(TVPPlaybackReportingEvent *)v20 setStartEvent:v23];
          id v24 = [(TVPPlaybackReportingEventCollection *)self openEvents];
          [v24 removeObjectForKey:v16];

          if (!v23)
          {
            int v25 = sLogObject_0;
            if (os_log_type_enabled((os_log_t)sLogObject_0, OS_LOG_TYPE_ERROR)) {
              -[TVPPlaybackReportingEventCollection _addEventWithName:type:identifier:value:timestamp:forceAdd:isUIInteraction:]((uint64_t)v15, v25);
            }
            int v26 = [(TVPPlaybackReportingEventCollection *)self eventArray];
            [v26 removeObject:v20];

            if (![(TVPPlaybackReportingEventCollection *)self containsEventWithName:@"reportingKeysWereOmittedDueToReportingError"])
            {
              double v27 = objc_alloc_init(TVPPlaybackReportingEvent);
              [(TVPPlaybackReportingEvent *)v27 setName:@"reportingKeysWereOmittedDueToReportingError"];
              [MEMORY[0x263EFF910] timeIntervalSinceReferenceDate];
              -[TVPPlaybackReportingEvent setTimestamp:](v27, "setTimestamp:");
              [(TVPPlaybackReportingEvent *)v27 setType:3];
              [(TVPPlaybackReportingEvent *)v27 setValue:MEMORY[0x263EFFA88]];
              double v28 = [(TVPPlaybackReportingEventCollection *)self eventArray];
              [v28 addObject:v27];
            }
          }
        }
      }
      else
      {
        v29 = [(TVPPlaybackReportingEventCollection *)self openEvents];
        int v30 = [v29 objectForKey:v16];

        if (!v30)
        {
          double v31 = [(TVPPlaybackReportingEventCollection *)self openEvents];
          [v31 setObject:v20 forKey:v16];
        }
      }
    }
  }
}

- (void)_closeOpenEvents
{
  id v3 = [(TVPPlaybackReportingEventCollection *)self openEvents];
  uint64_t v4 = (void *)[v3 copy];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __55__TVPPlaybackReportingEventCollection__closeOpenEvents__block_invoke;
  v5[3] = &unk_264CC5178;
  v5[4] = self;
  [v4 enumerateKeysAndObjectsUsingBlock:v5];
}

void __55__TVPPlaybackReportingEventCollection__closeOpenEvents__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4 = *(void **)(a1 + 32);
  id v5 = a2;
  id v7 = [a3 name];
  LOBYTE(v6) = 0;
  [v4 _addEventWithName:v7 type:2 identifier:v5 value:0 timestamp:0 forceAdd:1 isUIInteraction:v6];
}

- (void)_setError:(id)a3 inEventDict:(id)a4 errorCodeKey:(id)a5 errorDomainKey:(id)a6
{
  id v15 = a4;
  id v9 = a6;
  id v10 = a5;
  id v11 = a3;
  uint64_t v12 = [v11 code];
  double v13 = [v11 domain];

  double v14 = [NSNumber numberWithInteger:v12];
  [v15 setObject:v14 forKey:v10];

  if (v13) {
    [v15 setObject:v13 forKey:v9];
  }
}

+ (double)_totalTimeSpentDoingFPSFetchesFromEndEvents:(id)a3
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v33 objects:v37 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v34;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v34 != v7) {
          objc_enumerationMutation(v5);
        }
        id v9 = *(void **)(*((void *)&v33 + 1) + 8 * i);
        id v10 = [v9 startEvent];
        BOOL v11 = v10 == 0;

        if (!v11)
        {
          uint64_t v12 = [TVPTimeRange alloc];
          double v13 = [v9 startEvent];
          [v13 timestamp];
          double v15 = v14;
          [v9 timestamp];
          id v17 = [(TVPTimeRange *)v12 initWithStartTime:v15 endTime:v16];
          [v4 addObject:v17];
        }
      }
      uint64_t v6 = [v5 countByEnumeratingWithState:&v33 objects:v37 count:16];
    }
    while (v6);
  }

  [v4 sortUsingComparator:&__block_literal_global_307];
  uint64_t v27 = 0;
  double v28 = &v27;
  uint64_t v29 = 0x3032000000;
  int v30 = __Block_byref_object_copy_;
  double v31 = __Block_byref_object_dispose_;
  id v32 = 0;
  uint64_t v23 = 0;
  id v24 = (double *)&v23;
  uint64_t v25 = 0x2020000000;
  uint64_t v26 = 0;
  v22[0] = MEMORY[0x263EF8330];
  v22[1] = 3221225472;
  v22[2] = __83__TVPPlaybackReportingEventCollection__totalTimeSpentDoingFPSFetchesFromEndEvents___block_invoke_308;
  v22[3] = &unk_264CC51C0;
  v22[4] = &v27;
  v22[5] = &v23;
  [v4 enumerateObjectsUsingBlock:v22];
  id v18 = (void *)v28[5];
  if (v18)
  {
    [v18 duration];
    double v20 = v19 + v24[3];
    v24[3] = v20;
  }
  else
  {
    double v20 = v24[3];
  }
  _Block_object_dispose(&v23, 8);
  _Block_object_dispose(&v27, 8);

  return v20;
}

uint64_t __83__TVPPlaybackReportingEventCollection__totalTimeSpentDoingFPSFetchesFromEndEvents___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = NSNumber;
  id v5 = a3;
  [a2 startTime];
  uint64_t v6 = objc_msgSend(v4, "numberWithDouble:");
  uint64_t v7 = NSNumber;
  [v5 startTime];
  double v9 = v8;

  id v10 = [v7 numberWithDouble:v9];
  uint64_t v11 = [v6 compare:v10];

  return v11;
}

void __83__TVPPlaybackReportingEventCollection__totalTimeSpentDoingFPSFetchesFromEndEvents___block_invoke_308(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 8);
  id v22 = v5;
  if (a3)
  {
    uint64_t v7 = *(void **)(v6 + 40);
    [v5 startTime];
    if (objc_msgSend(v7, "containsTime:"))
    {
      double v8 = [TVPTimeRange alloc];
      [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) startTime];
      double v10 = v9;
      [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) endTime];
      double v12 = v11;
      [v22 endTime];
      if (v12 >= v13) {
        double v14 = v12;
      }
      else {
        double v14 = v13;
      }
      uint64_t v15 = [(TVPTimeRange *)v8 initWithStartTime:v10 endTime:v14];
      uint64_t v16 = *(void *)(*(void *)(a1 + 32) + 8);
      id v17 = *(void **)(v16 + 40);
      *(void *)(v16 + 40) = v15;
    }
    else
    {
      [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) duration];
      *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v19
                                                                  + *(double *)(*(void *)(*(void *)(a1 + 40) + 8)
                                                                              + 24);
      uint64_t v20 = *(void *)(*(void *)(a1 + 32) + 8);
      id v21 = v22;
      id v17 = *(void **)(v20 + 40);
      *(void *)(v20 + 40) = v21;
    }
  }
  else
  {
    id v18 = v5;
    id v17 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = v18;
  }
}

- (int64_t)videoType
{
  return self->_videoType;
}

- (void)setVideoType:(int64_t)a3
{
  self->_videoType = a3;
}

- (BOOL)isDownloaded
{
  return self->_isDownloaded;
}

- (void)setIsDownloaded:(BOOL)a3
{
  self->_isDownloaded = a3;
}

- (BOOL)isGroupActivity
{
  return self->_isGroupActivity;
}

- (void)setIsGroupActivity:(BOOL)a3
{
  self->_isGroupActivity = a3;
}

- (BOOL)isGroupActivityOriginator
{
  return self->_isGroupActivityOriginator;
}

- (void)setIsGroupActivityOriginator:(BOOL)a3
{
  self->_isGroupActivityOriginator = a3;
}

- (BOOL)complete
{
  return self->_complete;
}

- (BOOL)initialFPSRequestsComplete
{
  return self->_initialFPSRequestsComplete;
}

- (void)setInitialFPSRequestsComplete:(BOOL)a3
{
  self->_initialFPSRequestsComplete = a3;
}

- (NSMutableArray)eventArray
{
  return self->_eventArray;
}

- (void)setEventArray:(id)a3
{
}

- (NSMutableDictionary)openEvents
{
  return self->_openEvents;
}

- (void)setOpenEvents:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_openEvents, 0);
  objc_storeStrong((id *)&self->_eventArray, 0);
}

- (void)_addEventWithName:(uint64_t)a1 type:(NSObject *)a2 identifier:value:timestamp:forceAdd:isUIInteraction:.cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_236FC5000, a2, OS_LOG_TYPE_ERROR, "Event %@ has no corresponding start event.  Removing from event array", (uint8_t *)&v2, 0xCu);
}

@end