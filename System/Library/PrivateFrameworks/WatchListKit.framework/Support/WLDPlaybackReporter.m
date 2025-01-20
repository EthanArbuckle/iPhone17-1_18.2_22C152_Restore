@interface WLDPlaybackReporter
+ (id)_cachedMetadataByIdentifier;
+ (id)_cachedNotFoundIdentifiers;
+ (int64_t)_intentsMediaItemTypeFromWLKContentType:(unint64_t)a3;
+ (void)_decorateVODSummary:(id)a3 completion:(id)a4;
+ (void)_donateIntentWithPlaybackSummary:(id)a3 andMetadata:(id)a4;
- (WLDPlaybackReporter)initWithSessionID:(id)a3;
- (void)_cleanupWithSuccess:(BOOL)a3 error:(id)a4 completion:(id)a5;
- (void)_clearBDTimer;
- (void)_reportPlayEvent:(id)a3 summary:(id)a4 completion:(id)a5;
- (void)_scheduleTimedReportForSummary:(id)a3 afterMillis:(id)a4;
- (void)dealloc;
- (void)getCachedCanonicalIDForSummary:(id)a3 completionHandler:(id)a4;
- (void)reportPlayback:(id)a3 completion:(id)a4;
@end

@implementation WLDPlaybackReporter

- (WLDPlaybackReporter)initWithSessionID:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)WLDPlaybackReporter;
  v6 = [(WLDPlaybackReporter *)&v10 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_sessionID, a3);
  }
  v8 = WLKPlaybackTrackingLogObject();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v12 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "WLDPlaybackReporter - %@ init:", buf, 0xCu);
  }

  return v7;
}

- (void)dealloc
{
  v3 = WLKPlaybackTrackingLogObject();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    sessionID = self->_sessionID;
    *(_DWORD *)buf = 138412546;
    v7 = self;
    __int16 v8 = 2112;
    v9 = sessionID;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "WLDPlaybackReporter - %@ dealloc: sessionID: %@", buf, 0x16u);
  }

  [(WLDPlaybackReporter *)self _clearBDTimer];
  v5.receiver = self;
  v5.super_class = (Class)WLDPlaybackReporter;
  [(WLDPlaybackReporter *)&v5 dealloc];
}

- (void)reportPlayback:(id)a3 completion:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v9 = self;
  objc_sync_enter(v9);
  objc_super v10 = (WLKTransactionScope *)[objc_alloc((Class)WLKTransactionScope) initWithIdentifier:@"WLDPlaybackReporter.reportPlayback"];
  transaction = v9->_transaction;
  v9->_transaction = v10;

  objc_storeStrong((id *)&v9->_lastSummary, a3);
  v12 = WLKPlaybackTrackingLogObject();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v13 = +[WLKPlaybackSummary debugStringForPlaybackState:[(WLKPlaybackSummary *)v9->_lastSummary playbackState]];
    *(_DWORD *)buf = 138412546;
    v20 = v9;
    __int16 v21 = 2112;
    v22 = v13;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "WLDPlaybackReporter - %@ Begin Transaction: setLastSummary playbackState %@", buf, 0x16u);
  }
  objc_sync_exit(v9);

  [(WLDPlaybackReporter *)v9 _clearBDTimer];
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = __49__WLDPlaybackReporter_reportPlayback_completion___block_invoke;
  v16[3] = &unk_100045248;
  id v17 = v7;
  id v18 = v8;
  v16[4] = v9;
  id v14 = v7;
  id v15 = v8;
  [v14 resolveChannelID:v16];
}

void __49__WLDPlaybackReporter_reportPlayback_completion___block_invoke(id *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    id v7 = [a1[5] contentID];
    id v8 = [a1[5] duration];
    v9 = +[WLKPlayActivityDecorateVODOperation identifierForPlayActivityID:v7 channelID:v5 duration:v8];

    if ([v9 length])
    {
      objc_super v10 = objc_opt_class();
      v16[0] = _NSConcreteStackBlock;
      v16[1] = 3221225472;
      v16[2] = __49__WLDPlaybackReporter_reportPlayback_completion___block_invoke_9;
      v16[3] = &unk_100045220;
      id v11 = a1[5];
      v16[4] = a1[4];
      id v18 = a1[6];
      id v17 = a1[5];
      [v10 _decorateVODSummary:v11 completion:v16];
    }
    else
    {
      v13 = WLKPlaybackTrackingLogObject();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v20 = v5;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "WLDPlaybackReporter - Error: could not resolve lookupID for %@", buf, 0xCu);
      }

      id v14 = +[NSString stringWithFormat:@"could not resolve lookupID for %@", v5];
      id v15 = WLKError();

      [a1[4] _cleanupWithSuccess:0 error:v15 completion:a1[6]];
    }
  }
  else
  {
    v12 = WLKPlaybackTrackingLogObject();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v20 = v6;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "WLDPlaybackReporter - Error: Failed to resolve channelID %@", buf, 0xCu);
    }

    [a1[4] _cleanupWithSuccess:0 error:v6 completion:a1[6]];
  }
}

void __49__WLDPlaybackReporter_reportPlayback_completion___block_invoke_9(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  if (v5)
  {
    id v6 = objc_alloc_init(UWLPlayEvent);
    id v7 = WLKPlaybackTrackingLogObject();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = *(void *)(a1 + 32);
      uint64_t v9 = *(void *)(a1 + 40);
      int v36 = 138412802;
      uint64_t v37 = v8;
      __int16 v38 = 2048;
      v39 = v6;
      __int16 v40 = 2048;
      uint64_t v41 = v9;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "WLDPlaybackReporter - %@ Report playback activity:%p summary:%p", (uint8_t *)&v36, 0x20u);
    }

    objc_super v10 = [*(id *)(a1 + 40) bundleID];
    [(UWLPlayEvent *)v6 setBundleId:v10];

    id v11 = [*(id *)(a1 + 40) externalProfileID];
    [(UWLPlayEvent *)v6 setProfileId:v11];

    [(UWLPlayEvent *)v6 setExternalPlayableId:&stru_100047980];
    v12 = [*(id *)(a1 + 40) elapsedTime];
    [v12 doubleValue];
    [(UWLPlayEvent *)v6 setPlayHeadInMilliseconds:llround(v13 * 1000.0)];

    id v14 = [*(id *)(a1 + 40) duration];
    [v14 doubleValue];
    [(UWLPlayEvent *)v6 setMediaLengthInMilliseconds:llround(v15 * 1000.0)];

    v16 = +[NSDate date];
    id v17 = [*(id *)(a1 + 40) timestamp];
    [v16 timeIntervalSinceDate:v17];
    [(UWLPlayEvent *)v6 setMillisecondsSinceEvent:llround(v18 * 1000.0)];

    if ([*(id *)(a1 + 40) isTimerDerived]) {
      uint64_t v19 = 2;
    }
    else {
      uint64_t v19 = 1;
    }
    [(UWLPlayEvent *)v6 setContractOrTimed:v19];
    id v20 = objc_alloc_init(UWLSectionInfo);
    __int16 v21 = [*(id *)(a1 + 40) featureDuration];

    v22 = *(void **)(a1 + 40);
    if (v21)
    {
      v23 = [v22 featureDuration];
    }
    else
    {
      v24 = [v22 duration];

      if (!v24) {
        goto LABEL_13;
      }
      v23 = [*(id *)(a1 + 40) duration];
    }
    v25 = v23;
    [v23 doubleValue];
    [(UWLSectionInfo *)v20 setLengthInMilliseconds:llround(v26 * 1000.0)];

LABEL_13:
    v27 = [*(id *)(a1 + 40) featureElapsedTime];

    v28 = *(void **)(a1 + 40);
    if (v27)
    {
      v29 = [v28 featureElapsedTime];
    }
    else
    {
      v30 = [v28 elapsedTime];

      if (!v30) {
        goto LABEL_18;
      }
      v29 = [*(id *)(a1 + 40) elapsedTime];
    }
    v31 = v29;
    [v29 doubleValue];
    [(UWLSectionInfo *)v20 setPlayheadInMilliseconds:llround(v32 * 1000.0)];

LABEL_18:
    id v33 = [*(id *)(a1 + 40) completionState];
    if (v33 == (id)1)
    {
      uint64_t v34 = 0;
    }
    else
    {
      if (v33 != (id)2)
      {
LABEL_23:
        v35 = [v5 nowPlayingPassThrough];
        [(UWLSectionInfo *)v20 setPassThrough:v35];

        [(UWLPlayEvent *)v6 setMainContentInfo:v20];
        [*(id *)(a1 + 32) _reportPlayEvent:v6 summary:*(void *)(a1 + 40) completion:*(void *)(a1 + 48)];
        [(id)objc_opt_class() _donateIntentWithPlaybackSummary:*(void *)(a1 + 40) andMetadata:v5];

        goto LABEL_24;
      }
      uint64_t v34 = 1;
    }
    [(UWLSectionInfo *)v20 setIsDone:v34];
    goto LABEL_23;
  }
  [*(id *)(a1 + 32) _cleanupWithSuccess:0 error:a3 completion:*(void *)(a1 + 48)];
LABEL_24:
}

- (void)getCachedCanonicalIDForSummary:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = __72__WLDPlaybackReporter_getCachedCanonicalIDForSummary_completionHandler___block_invoke;
  v9[3] = &unk_100044EF0;
  id v11 = self;
  id v12 = a4;
  id v10 = v6;
  id v7 = v6;
  id v8 = v12;
  [v7 resolveChannelID:v9];
}

void __72__WLDPlaybackReporter_getCachedCanonicalIDForSummary_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if ([v5 length])
  {
    id v7 = [*(id *)(a1 + 32) duration];
    if (v7)
    {
      id v8 = [*(id *)(a1 + 32) contentID];
      uint64_t v9 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v7 integerValue]);
      id v10 = +[WLKPlayActivityDecorateVODOperation identifierForPlayActivityID:v8 channelID:v5 duration:v9];

      if ([v10 length])
      {
        id v11 = [(id)objc_opt_class() _cachedMetadataByIdentifier];
        id v12 = [v11 objectForKey:v10];

        double v13 = WLKPlaybackTrackingLogObject();
        BOOL v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);
        if (v12)
        {
          if (v14)
          {
            double v15 = *(void **)(a1 + 40);
            int v27 = 138412546;
            id v28 = v15;
            __int16 v29 = 2112;
            v30 = v10;
            _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "WLDPlaybackReporter - %@ Returning cached metadata for %@.", (uint8_t *)&v27, 0x16u);
          }

          uint64_t v16 = *(void *)(a1 + 48);
          id v17 = [v12 canonicalID];
          (*(void (**)(uint64_t, void *, void))(v16 + 16))(v16, v17, 0);
        }
        else
        {
          if (v14)
          {
            v25 = *(void **)(a1 + 40);
            int v27 = 138412546;
            id v28 = v25;
            __int16 v29 = 2112;
            v30 = v10;
            _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "WLDPlaybackReporter - %@ Cached metadata not found for %@.", (uint8_t *)&v27, 0x16u);
          }

          uint64_t v26 = *(void *)(a1 + 48);
          id v17 = WLKError();
          (*(void (**)(uint64_t, void, void *))(v26 + 16))(v26, 0, v17);
        }
      }
      else
      {
        v22 = WLKPlaybackTrackingLogObject();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
        {
          v23 = [*(id *)(a1 + 32) bundleID];
          int v27 = 138412290;
          id v28 = v23;
          _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "WLDPlaybackReporter - Error: could not resolve lookupID for %@", (uint8_t *)&v27, 0xCu);
        }
        uint64_t v24 = *(void *)(a1 + 48);
        id v12 = WLKError();
        (*(void (**)(uint64_t, void, void *))(v24 + 16))(v24, 0, v12);
      }
    }
    else
    {
      uint64_t v19 = WLKPlaybackTrackingLogObject();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        id v20 = [*(id *)(a1 + 32) bundleID];
        int v27 = 138412290;
        id v28 = v20;
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "WLDPlaybackReporter - Error: Nil duration found in playback summary for %@", (uint8_t *)&v27, 0xCu);
      }
      uint64_t v21 = *(void *)(a1 + 48);
      id v10 = WLKError();
      (*(void (**)(uint64_t, void, void *))(v21 + 16))(v21, 0, v10);
    }
  }
  else
  {
    double v18 = WLKPlaybackTrackingLogObject();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      int v27 = 138412290;
      id v28 = v6;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "WLDPlaybackReporter - Error: Failed to resolve channelID %@", (uint8_t *)&v27, 0xCu);
    }

    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

+ (id)_cachedMetadataByIdentifier
{
  if (_cachedMetadataByIdentifier___once != -1) {
    dispatch_once(&_cachedMetadataByIdentifier___once, &__block_literal_global_4);
  }
  v2 = (void *)_cachedMetadataByIdentifier___cachedMetadataByIdentifier;

  return v2;
}

void __50__WLDPlaybackReporter__cachedMetadataByIdentifier__block_invoke(id a1)
{
  id v1 = objc_alloc_init((Class)WLKCache);
  v2 = (void *)_cachedMetadataByIdentifier___cachedMetadataByIdentifier;
  _cachedMetadataByIdentifier___cachedMetadataByIdentifier = (uint64_t)v1;

  v3 = (void *)_cachedMetadataByIdentifier___cachedMetadataByIdentifier;

  [v3 setCountLimit:5];
}

+ (id)_cachedNotFoundIdentifiers
{
  if (_cachedNotFoundIdentifiers___once != -1) {
    dispatch_once(&_cachedNotFoundIdentifiers___once, &__block_literal_global_31);
  }
  v2 = (void *)_cachedNotFoundIdentifiers___cachedNotFoundIdentifiers;

  return v2;
}

void __49__WLDPlaybackReporter__cachedNotFoundIdentifiers__block_invoke(id a1)
{
  _cachedNotFoundIdentifiers___cachedNotFoundIdentifiers = (uint64_t)objc_alloc_init((Class)NSMutableSet);

  _objc_release_x1();
}

+ (void)_decorateVODSummary:(id)a3 completion:(id)a4
{
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = __54__WLDPlaybackReporter__decorateVODSummary_completion___block_invoke;
  v8[3] = &unk_1000452B0;
  id v9 = a3;
  id v10 = a4;
  id v11 = a1;
  id v6 = v9;
  id v7 = v10;
  [v6 resolveChannelID:v8];
}

void __54__WLDPlaybackReporter__decorateVODSummary_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if ([v5 length])
  {
    id v7 = [*(id *)(a1 + 32) duration];
    if (v7)
    {
      id v8 = [*(id *)(a1 + 32) contentID];
      id v9 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v7 integerValue]);
      id v10 = +[WLKPlayActivityDecorateVODOperation identifierForPlayActivityID:v8 channelID:v5 duration:v9];

      if ([v10 length])
      {
        id v11 = [(id)objc_opt_class() _cachedMetadataByIdentifier];
        id v12 = [v11 objectForKey:v10];

        if (v12)
        {
          double v13 = WLKPlaybackTrackingLogObject();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
          {
            BOOL v14 = *(void **)(a1 + 48);
            *(_DWORD *)buf = 138412546;
            id v40 = v14;
            __int16 v41 = 2112;
            v42 = v10;
            _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "WLDPlaybackReporter - %@ Returning cached metadata for %@.", buf, 0x16u);
          }

          (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
        }
        else
        {
          v22 = [(id)objc_opt_class() _cachedNotFoundIdentifiers];
          unsigned int v23 = [v22 containsObject:v10];

          if (v23)
          {
            uint64_t v24 = WLKPlaybackTrackingLogObject();
            if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              id v40 = v10;
              _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "WLDPlaybackReporter - Item with identifier %@ is known to be unavailable.", buf, 0xCu);
            }

            uint64_t v25 = *(void *)(a1 + 40);
            uint64_t v26 = WLKError();
            (*(void (**)(uint64_t, void, void *))(v25 + 16))(v25, 0, v26);
          }
          else
          {
            id v27 = objc_alloc((Class)WLKPlayActivityDecorateVODOperation);
            id v28 = [*(id *)(a1 + 32) contentID];
            __int16 v29 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v7 integerValue]);
            id v30 = [v27 initWithExternalId:v28 brandId:v5 hlsAssetDuration:v29];

            objc_initWeak((id *)buf, v30);
            double v32 = _NSConcreteStackBlock;
            uint64_t v33 = 3221225472;
            uint64_t v34 = __54__WLDPlaybackReporter__decorateVODSummary_completion___block_invoke_36;
            v35 = &unk_100044F40;
            objc_copyWeak(v38, (id *)buf);
            v38[1] = *(id *)(a1 + 48);
            id v36 = v10;
            id v37 = *(id *)(a1 + 40);
            [v30 setCompletionBlock:&v32];
            v31 = WLDOperationQueue();
            objc_msgSend(v31, "addOperation:", v30, v32, v33, v34, v35);

            objc_destroyWeak(v38);
            objc_destroyWeak((id *)buf);
          }
        }
      }
      else
      {
        uint64_t v19 = WLKPlaybackTrackingLogObject();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          id v20 = [*(id *)(a1 + 32) bundleID];
          *(_DWORD *)buf = 138412290;
          id v40 = v20;
          _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "WLDPlaybackReporter - Error: could not resolve lookupID for %@", buf, 0xCu);
        }
        uint64_t v21 = *(void *)(a1 + 40);
        id v12 = WLKError();
        (*(void (**)(uint64_t, void, void *))(v21 + 16))(v21, 0, v12);
      }
    }
    else
    {
      uint64_t v16 = WLKPlaybackTrackingLogObject();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        id v17 = [*(id *)(a1 + 32) bundleID];
        *(_DWORD *)buf = 138412290;
        id v40 = v17;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "WLDPlaybackReporter - Error: Nil duration found in playback summary for %@", buf, 0xCu);
      }
      uint64_t v18 = *(void *)(a1 + 40);
      id v10 = WLKError();
      (*(void (**)(uint64_t, void, void *))(v18 + 16))(v18, 0, v10);
    }
  }
  else
  {
    double v15 = WLKPlaybackTrackingLogObject();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v40 = v6;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "WLDPlaybackReporter - Error: Failed to resolve channelID %@", buf, 0xCu);
    }

    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

void __54__WLDPlaybackReporter__decorateVODSummary_completion___block_invoke_36(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v3 = [WeakRetained error];

  if (v3)
  {
    v4 = WLKPlaybackTrackingLogObject();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      id v5 = [WeakRetained error];
      int v23 = 138412290;
      uint64_t v24 = v5;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "WLDPlaybackReporter - Activity lookup failed: %@", (uint8_t *)&v23, 0xCu);
    }
    id v6 = [WeakRetained httpResponse];
    id v7 = (char *)[v6 statusCode];

    if ((unint64_t)(v7 - 400) <= 0x63)
    {
      id v8 = WLKPlaybackTrackingLogObject();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        int v23 = 134217984;
        uint64_t v24 = v7;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "WLDPlaybackReporter - Activity lookup got a %ld. We will not retry.", (uint8_t *)&v23, 0xCu);
      }

      id v9 = [(id)objc_opt_class() _cachedNotFoundIdentifiers];
      [v9 addObject:*(void *)(a1 + 32)];
    }
    uint64_t v10 = *(void *)(a1 + 40);
    id v11 = [WeakRetained error];
    (*(void (**)(uint64_t, void, void *))(v10 + 16))(v10, 0, v11);
  }
  else
  {
    id v12 = [WeakRetained metadataByIdentifier];
    id v11 = [v12 objectForKeyedSubscript:*(void *)(a1 + 32)];

    double v13 = WLKPlaybackTrackingLogObject();
    BOOL v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);
    if (v11)
    {
      if (v14)
      {
        double v15 = *(char **)(a1 + 56);
        uint64_t v16 = *(void *)(a1 + 32);
        int v23 = 138412546;
        uint64_t v24 = v15;
        __int16 v25 = 2112;
        uint64_t v26 = v16;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "WLDPlaybackReporter - %@ Got metadata for %@.", (uint8_t *)&v23, 0x16u);
      }

      id v17 = [(id)objc_opt_class() _cachedMetadataByIdentifier];
      [v17 setObject:v11 forKey:*(void *)(a1 + 32)];

      uint64_t v18 = *(void *)(a1 + 40);
      uint64_t v19 = *(void (**)(uint64_t, void *, void))(v18 + 16);
      id v20 = v11;
    }
    else
    {
      if (v14)
      {
        uint64_t v21 = *(char **)(a1 + 56);
        uint64_t v22 = *(void *)(a1 + 32);
        int v23 = 138412546;
        uint64_t v24 = v21;
        __int16 v25 = 2112;
        uint64_t v26 = v22;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "WLDPlaybackReporter - %@ Metadata not found even after successfully receiving response from backend for %@.", (uint8_t *)&v23, 0x16u);
      }

      uint64_t v18 = *(void *)(a1 + 40);
      uint64_t v19 = *(void (**)(uint64_t, void *, void))(v18 + 16);
      id v20 = 0;
    }
    v19(v18, v20, 0);
  }
}

- (void)_reportPlayEvent:(id)a3 summary:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [WLDPlayActivityReportOperation alloc];
  id v40 = v8;
  id v12 = +[NSArray arrayWithObjects:&v40 count:1];
  double v13 = [(WLDPlayActivityReportOperation *)v11 initWithPlayEvents:v12];

  BOOL v14 = +[ACAccountStore ams_sharedAccountStore];
  double v15 = objc_msgSend(v14, "ams_activeiTunesAccount");
  uint64_t v16 = objc_msgSend(v15, "ams_DSID");
  id v17 = [v16 stringValue];

  uint64_t v18 = [v9 accountID];
  id v19 = v17;
  id v20 = v18;
  uint64_t v21 = v20;
  if (v19 == v20)
  {

    int v23 = v19;
LABEL_11:

    goto LABEL_12;
  }
  if (!v19 || !v20)
  {

    goto LABEL_8;
  }
  unsigned __int8 v22 = [v19 isEqual:v20];

  if ((v22 & 1) == 0)
  {
LABEL_8:
    uint64_t v24 = WLKPlaybackTrackingLogObject();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412802;
      v35 = self;
      __int16 v36 = 2112;
      id v37 = v19;
      __int16 v38 = 2112;
      v39 = v21;
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "WLDPlaybackReporter - %@: Note: DSID mismatch. Active:%@ Summary:%@", buf, 0x20u);
    }

    int v23 = +[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", [v21 longLongValue]);
    [(WLDPlayActivityReportOperation *)v13 setDSID:v23];
    goto LABEL_11;
  }
LABEL_12:
  objc_initWeak(&location, v13);
  v29[0] = _NSConcreteStackBlock;
  v29[1] = 3221225472;
  v29[2] = __59__WLDPlaybackReporter__reportPlayEvent_summary_completion___block_invoke;
  v29[3] = &unk_1000452D8;
  objc_copyWeak(&v32, &location);
  v29[4] = self;
  id v25 = v9;
  id v30 = v25;
  id v26 = v10;
  id v31 = v26;
  [(WLDPlayActivityReportOperation *)v13 setCompletionBlock:v29];
  id v27 = WLKPlaybackTrackingLogObject();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v35 = self;
    __int16 v36 = 2048;
    id v37 = v8;
    _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "WLDPlaybackReporter - %@ Queueing activity report: %p", buf, 0x16u);
  }

  id v28 = WLDOperationQueue();
  [v28 addOperation:v13];

  objc_destroyWeak(&v32);
  objc_destroyWeak(&location);
}

void __59__WLDPlaybackReporter__reportPlayEvent_summary_completion___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  v2 = [WeakRetained error];

  if (!v2)
  {
    v3 = *(void **)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    id v5 = [WeakRetained nextExpectedReportMillis];
    [v3 _scheduleTimedReportForSummary:v4 afterMillis:v5];
  }
  id v6 = *(void **)(a1 + 32);
  id v7 = [WeakRetained error];
  [v6 _cleanupWithSuccess:v2 == 0 error:v7 completion:*(void *)(a1 + 48)];
}

- (void)_cleanupWithSuccess:(BOOL)a3 error:(id)a4 completion:(id)a5
{
  BOOL v6 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = v9;
  if (v9) {
    (*((void (**)(id, BOOL, id))v9 + 2))(v9, v6, v8);
  }
  id v11 = self;
  objc_sync_enter(v11);
  transaction = v11->_transaction;
  v11->_transaction = 0;

  double v13 = WLKPlaybackTrackingLogObject();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = 138412290;
    double v15 = v11;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "WLDPlaybackReporter - %@ Ended Transaction", (uint8_t *)&v14, 0xCu);
  }

  objc_sync_exit(v11);
}

+ (int64_t)_intentsMediaItemTypeFromWLKContentType:(unint64_t)a3
{
  if (a3 - 1 > 4) {
    return 0;
  }
  else {
    return qword_1000420F8[a3 - 1];
  }
}

+ (void)_donateIntentWithPlaybackSummary:(id)a3 andMetadata:(id)a4
{
  id v6 = a4;
  if ([a3 playbackState] == (id)1)
  {
    id v39 = 0;
    id v7 = +[LSBundleRecord bundleRecordWithApplicationIdentifier:@"com.apple.tv" error:&v39];
    id v8 = v39;
    if (kCFBundleExecutableKey)
    {
      uint64_t v33 = v7;
      id v9 = [v7 localizedName];
      uint64_t v34 = v8;
      id v32 = v9;
      if (objc_msgSend(a1, "_intentsMediaItemTypeFromWLKContentType:", objc_msgSend(v6, "contentType")) == (id)13)
      {
        id v10 = objc_alloc((Class)INMediaItem);
        id v11 = [v6 canonicalShowID];
        id v12 = [v10 initWithIdentifier:v11 title:v9 type:12 artwork:0];

        double v13 = 0;
      }
      else
      {
        double v13 = v9;
        id v12 = 0;
      }
      id v15 = objc_alloc((Class)INMediaItem);
      uint64_t v16 = [v6 canonicalID];
      id v17 = objc_msgSend(v15, "initWithIdentifier:title:type:artwork:", v16, v13, objc_msgSend(a1, "_intentsMediaItemTypeFromWLKContentType:", objc_msgSend(v6, "contentType")), 0);

      id v18 = objc_alloc((Class)INPlayMediaIntent);
      id v30 = v17;
      id v42 = v17;
      id v19 = +[NSArray arrayWithObjects:&v42 count:1];
      id v31 = v12;
      id v20 = [v18 initWithMediaItems:v19 mediaContainer:v12 playShuffled:&__kCFBooleanFalse playbackRepeatMode:1 resumePlayback:&__kCFBooleanTrue playbackQueueLocation:1 playbackSpeed:&off_100049BD8 mediaSearch:0];

      uint64_t v21 = [v6 siriActionsCategories];
      unsigned __int8 v22 = objc_opt_new();
      long long v35 = 0u;
      long long v36 = 0u;
      long long v37 = 0u;
      long long v38 = 0u;
      id v23 = v21;
      id v24 = [v23 countByEnumeratingWithState:&v35 objects:v41 count:16];
      if (v24)
      {
        id v25 = v24;
        uint64_t v26 = *(void *)v36;
        do
        {
          for (i = 0; i != v25; i = (char *)i + 1)
          {
            if (*(void *)v36 != v26) {
              objc_enumerationMutation(v23);
            }
            id v28 = [objc_alloc((Class)INSpeakableString) initWithVocabularyIdentifier:*(void *)(*((void *)&v35 + 1) + 8 * i) spokenPhrase:@"TV" pronunciationHint:@"TV"];
            [v22 addObject:v28];
          }
          id v25 = [v23 countByEnumeratingWithState:&v35 objects:v41 count:16];
        }
        while (v25);
      }

      [v20 setBuckets:v22];
      [v20 _setLaunchId:@"com.apple.tv"];
      [v20 _setExtensionBundleId:0];
      id v29 = [objc_alloc((Class)INInteraction) initWithIntent:v20 response:0];
      [v29 donateInteractionWithCompletion:&__block_literal_global_55];

      id v7 = v33;
      id v8 = v34;
      int v14 = v32;
    }
    else
    {
      int v14 = WLKPlaybackTrackingLogObject();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        +[WLDPlaybackReporter _donateIntentWithPlaybackSummary:andMetadata:](v8, v14);
      }
    }
  }
  else
  {
    id v8 = WLKPlaybackTrackingLogObject();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "WLDPlaybackReporter - Skipping donation because user didn't initiate playback.", buf, 2u);
    }
  }
}

void __68__WLDPlaybackReporter__donateIntentWithPlaybackSummary_andMetadata___block_invoke(id a1, NSError *a2)
{
  v2 = a2;
  if (v2)
  {
    v3 = WLKPlaybackTrackingLogObject();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      int v4 = 138412290;
      id v5 = v2;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "WLDPlaybackReporter - Error donating interaction: %@", (uint8_t *)&v4, 0xCu);
    }
  }
}

- (void)_clearBDTimer
{
  v2 = self;
  objc_sync_enter(v2);
  BDTimer = v2->_BDTimer;
  if (BDTimer)
  {
    int v4 = WLKPlaybackTrackingLogObject();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      int v5 = 138412290;
      id v6 = v2;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "WLDPlaybackReporter - %@ TR: Cancelling existing timer", (uint8_t *)&v5, 0xCu);
    }

    dispatch_source_cancel((dispatch_source_t)v2->_BDTimer);
    BDTimer = v2->_BDTimer;
  }
  v2->_BDTimer = 0;

  objc_sync_exit(v2);
}

- (void)_scheduleTimedReportForSummary:(id)a3 afterMillis:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    BOOL v8 = [v6 playbackState] == (id)1;
    WLKPlaybackTrackingLogObject();
    id v9 = (WLDPlaybackReporter *)objc_claimAutoreleasedReturnValue();
    BOOL v10 = os_log_type_enabled(&v9->super, OS_LOG_TYPE_DEFAULT);
    if (v8)
    {
      if (v10)
      {
        *(_DWORD *)buf = 138412546;
        uint64_t v21 = self;
        __int16 v22 = 2112;
        id v23 = v7;
        _os_log_impl((void *)&_mh_execute_header, &v9->super, OS_LOG_TYPE_DEFAULT, "WLDPlaybackReporter - %@ TR: Will schedule timed report in %@ millis", buf, 0x16u);
      }

      id v9 = self;
      objc_sync_enter(v9);
      id v11 = WLDDispatchQueue();
      dispatch_source_t v12 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, v11);
      BDTimer = v9->_BDTimer;
      v9->_BDTimer = (OS_dispatch_source *)v12;

      [v7 doubleValue];
      dispatch_time_t v15 = dispatch_time(0, (uint64_t)(v14 * 1000000.0));
      dispatch_source_set_timer((dispatch_source_t)v9->_BDTimer, v15, 0xFFFFFFFFFFFFFFFFLL, 0);
      objc_initWeak((id *)buf, v9);
      uint64_t v16 = v9->_BDTimer;
      handler[0] = _NSConcreteStackBlock;
      handler[1] = 3221225472;
      handler[2] = __66__WLDPlaybackReporter__scheduleTimedReportForSummary_afterMillis___block_invoke;
      handler[3] = &unk_100045348;
      objc_copyWeak(&v19, (id *)buf);
      handler[4] = v9;
      id v18 = v6;
      dispatch_source_set_event_handler(v16, handler);
      dispatch_activate((dispatch_object_t)v9->_BDTimer);

      objc_destroyWeak(&v19);
      objc_destroyWeak((id *)buf);
      objc_sync_exit(v9);
    }
    else if (v10)
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v21 = self;
      _os_log_impl((void *)&_mh_execute_header, &v9->super, OS_LOG_TYPE_DEFAULT, "WLDPlaybackReporter - %@ TR: Will not generate timed report because playback state is not playing", buf, 0xCu);
    }
  }
}

void __66__WLDPlaybackReporter__scheduleTimedReportForSummary_afterMillis___block_invoke(id *a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained(a1 + 6);
  if (WeakRetained)
  {
    id v3 = a1[4];
    objc_sync_enter(v3);
    id v4 = WeakRetained[4];
    objc_sync_exit(v3);

    if ([v4 playbackState] == (id)1 && objc_msgSend(v4, "isSameContent:", a1[5]))
    {
      int v5 = [a1[5] elapsedTimeSummaryWithPlaybackState:1 timerDerived:1];
      id v6 = WLKPlaybackTrackingLogObject();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        id v7 = a1[4];
        *(_DWORD *)buf = 138412546;
        id v11 = v7;
        __int16 v12 = 2112;
        double v13 = v5;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "WLDPlaybackReporter - %@ TR: Will enqueue: %@", buf, 0x16u);
      }

      v9[0] = _NSConcreteStackBlock;
      v9[1] = 3221225472;
      v9[2] = __66__WLDPlaybackReporter__scheduleTimedReportForSummary_afterMillis___block_invoke_56;
      v9[3] = &unk_100045320;
      void v9[4] = WeakRetained;
      [WeakRetained reportPlayback:v5 completion:v9];
    }
    else
    {
      int v5 = WLKPlaybackTrackingLogObject();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        id v8 = a1[4];
        *(_DWORD *)buf = 138412290;
        id v11 = v8;
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "WLDPlaybackReporter - %@ TR: Will not generate report because current playback state does not satisfy conditions", buf, 0xCu);
      }
    }
  }
}

void __66__WLDPlaybackReporter__scheduleTimedReportForSummary_afterMillis___block_invoke_56(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  id v6 = WLKPlaybackTrackingLogObject();
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (a2)
  {
    if (v7)
    {
      uint64_t v8 = *(void *)(a1 + 32);
      int v13 = 138412290;
      uint64_t v14 = v8;
      id v9 = "WLDPlaybackReporter - %@ TR: Successful playback report";
      BOOL v10 = v6;
      uint32_t v11 = 12;
LABEL_6:
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, v9, (uint8_t *)&v13, v11);
    }
  }
  else if (v7)
  {
    uint64_t v12 = *(void *)(a1 + 32);
    int v13 = 138412546;
    uint64_t v14 = v12;
    __int16 v15 = 2112;
    id v16 = v5;
    id v9 = "WLDPlaybackReporter - %@: TR: Failed playback report %@";
    BOOL v10 = v6;
    uint32_t v11 = 22;
    goto LABEL_6;
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastSummary, 0);
  objc_storeStrong((id *)&self->_sessionID, 0);
  objc_storeStrong((id *)&self->_BDTimer, 0);

  objc_storeStrong((id *)&self->_transaction, 0);
}

+ (void)_donateIntentWithPlaybackSummary:(void *)a1 andMetadata:(NSObject *)a2 .cold.1(void *a1, NSObject *a2)
{
  id v3 = [a1 localizedDescription];
  int v4 = 138412290;
  id v5 = v3;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "WLDPlaybackReporter - Could not find bundle for ID com.apple.tv - %@", (uint8_t *)&v4, 0xCu);
}

@end