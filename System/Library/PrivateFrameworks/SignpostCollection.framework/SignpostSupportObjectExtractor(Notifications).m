@interface SignpostSupportObjectExtractor(Notifications)
- (BOOL)processNotificationsWithIntervalTimeoutInSeconds:()Notifications shouldCalculateAnimationFramerate:targetQueue:errorOut:;
- (uint64_t)processNotificationsWithIntervalTimeoutInSeconds:()Notifications errorOut:;
- (void)_processStreamedOSLogEventProxy:()Notifications shouldCalculateFramerate:;
@end

@implementation SignpostSupportObjectExtractor(Notifications)

- (uint64_t)processNotificationsWithIntervalTimeoutInSeconds:()Notifications errorOut:
{
  return [a1 processNotificationsWithIntervalTimeoutInSeconds:a3 shouldCalculateAnimationFramerate:1 targetQueue:0 errorOut:a4];
}

- (void)_processStreamedOSLogEventProxy:()Notifications shouldCalculateFramerate:
{
  id v6 = a3;
  v7 = (void *)MEMORY[0x223C1AE00]();
  [a1 cachedTimebaseRatio];
  if (v8 == 0.0) {
    objc_msgSend(a1, "setCachedTimebaseRatio:", (double)(unint64_t)objc_msgSend(v6, "continuousNanosecondsSinceBoot")/ (double)(unint64_t)objc_msgSend(v6, "machContinuousTimestamp"));
  }
  if ([v6 type] == 1024
    && ([a1 logMessageProcessingBlock],
        v9 = objc_claimAutoreleasedReturnValue(),
        v9,
        v9))
  {
    unsigned __int8 v34 = 0;
    uint64_t v10 = [v6 processIdentifier];
    uint64_t v11 = [v6 creatorProcessUniqueIdentifier];
    v12 = [v6 process];
    v13 = [v6 subsystem];
    v14 = [v6 category];
    LODWORD(v10) = [a1 _shouldBuildEventWithPid:v10 uniquePid:v11 processName:v12 subsystem:v13 category:v14 shouldReport:&v34];

    if (v10)
    {
      id v15 = objc_alloc(MEMORY[0x263F6C590]);
      [a1 cachedTimebaseRatio];
      v16 = objc_msgSend(v15, "initWithOSLogEventProxy:timebaseRatio:", v6);
      if (!v16 || ([a1 _processSignpostSupportLogMessage:v16] & 1) != 0) {
        goto LABEL_14;
      }
      goto LABEL_13;
    }
  }
  else if ([v6 type] == 1536)
  {
    if ([a1 _hasSignpostProcessingBlock])
    {
      unsigned __int8 v34 = 0;
      uint64_t v17 = [v6 processIdentifier];
      uint64_t v18 = [v6 creatorProcessUniqueIdentifier];
      v19 = [v6 process];
      v20 = [v6 subsystem];
      v21 = [v6 category];
      LODWORD(v17) = [a1 _shouldBuildEventWithPid:v17 uniquePid:v18 processName:v19 subsystem:v20 category:v21 shouldReport:&v34];

      if (v17)
      {
        unint64_t add = atomic_fetch_add(&_processStreamedOSLogEventProxy_shouldCalculateFramerate__nextSerialNumber, 1uLL);
        int v23 = [a1 _isTrackingIntervals];
        char v24 = v23;
        uint64_t v25 = v23 & a4;
        id v26 = objc_alloc(MEMORY[0x263F6C588]);
        [a1 cachedTimebaseRatio];
        double v28 = v27;
        uint64_t v29 = [a1 shouldComposeMetadataString];
        uint64_t v30 = [a1 _notificationTimeout];
        v31 = [a1 notificationProcessingQueue];
        v32[0] = MEMORY[0x263EF8330];
        v32[1] = 3221225472;
        v32[2] = __106__SignpostSupportObjectExtractor_Notifications___processStreamedOSLogEventProxy_shouldCalculateFramerate___block_invoke;
        v32[3] = &unk_264487EA8;
        char v33 = v24;
        v32[4] = a1;
        v32[5] = add;
        v16 = (void *)[v26 initWithOSLogEventProxy:v6 timebaseRatio:v29 shouldCompose:add serialNumber:v25 shouldCollectFrameInfo:v30 timeoutInSec:v31 timeoutHandlingQueue:v28 timeoutHandlingBlock:v32];

        if ([a1 _processSignpostEvent:v16 shouldReport:v34])
        {
LABEL_14:

          goto LABEL_15;
        }
LABEL_13:
        [a1 stopProcessing];
        goto LABEL_14;
      }
    }
  }
LABEL_15:
}

- (BOOL)processNotificationsWithIntervalTimeoutInSeconds:()Notifications shouldCalculateAnimationFramerate:targetQueue:errorOut:
{
  id v10 = a5;
  [a1 _processingStarting];
  if ([a1 _hasProcessingBlock])
  {
    objc_msgSend(a1, "set_shouldStopProcessing:", 0);
    objc_msgSend(a1, "set_notificationTimeout:", a3);
    uint64_t v47 = 0;
    v48 = &v47;
    uint64_t v49 = 0x3032000000;
    v50 = __Block_byref_object_copy_;
    v51 = __Block_byref_object_dispose_;
    id v52 = 0;
    uint64_t v43 = 0;
    v44 = &v43;
    uint64_t v45 = 0x2020000000;
    char v46 = 1;
    uint64_t v11 = [MEMORY[0x263F52738] liveLocalStore];
    v42[0] = MEMORY[0x263EF8330];
    v42[1] = 3221225472;
    v42[2] = __153__SignpostSupportObjectExtractor_Notifications__processNotificationsWithIntervalTimeoutInSeconds_shouldCalculateAnimationFramerate_targetQueue_errorOut___block_invoke;
    v42[3] = &unk_264487ED0;
    v42[5] = &v47;
    v42[6] = a6;
    v42[4] = &v43;
    [v11 prepareWithCompletionHandler:v42];
    BOOL v12 = *((unsigned char *)v44 + 24) != 0;
    if (*((unsigned char *)v44 + 24))
    {
      objc_initWeak(&location, a1);
      id v13 = objc_alloc(MEMORY[0x263F52740]);
      v14 = (void *)[v13 initWithLiveSource:v48[5]];
      objc_msgSend(a1, "set_liveStream:", v14);

      if (v10)
      {
        [a1 setNotificationProcessingQueue:v10];
      }
      else
      {
        dispatch_queue_t v15 = dispatch_queue_create("SignpostSupportObjectExtractor notification processing queue", 0);
        [a1 setNotificationProcessingQueue:v15];
      }
      v16 = [a1 notificationProcessingQueue];
      uint64_t v17 = [a1 _liveStream];
      [v17 setQueue:v16];

      uint64_t v18 = [a1 _liveStream];
      v38[0] = MEMORY[0x263EF8330];
      v38[1] = 3221225472;
      v38[2] = __153__SignpostSupportObjectExtractor_Notifications__processNotificationsWithIntervalTimeoutInSeconds_shouldCalculateAnimationFramerate_targetQueue_errorOut___block_invoke_2;
      v38[3] = &unk_264487EF8;
      objc_copyWeak(&v39, &location);
      char v40 = a4;
      [v18 setEventHandler:v38];

      v19 = [a1 _liveStream];
      v36[0] = MEMORY[0x263EF8330];
      v36[1] = 3221225472;
      v36[2] = __153__SignpostSupportObjectExtractor_Notifications__processNotificationsWithIntervalTimeoutInSeconds_shouldCalculateAnimationFramerate_targetQueue_errorOut___block_invoke_3;
      v36[3] = &unk_264487F20;
      objc_copyWeak(&v37, &location);
      [v19 setInvalidationHandler:v36];

      v20 = [a1 _liveStream];
      objc_msgSend(v20, "setFlags:", objc_msgSend(v20, "flags") | 4);

      v21 = [a1 _liveStream];
      objc_msgSend(v21, "setFlags:", objc_msgSend(v21, "flags") | 0x90);

      if ([a1 _hasSignpostProcessingBlock])
      {
        v22 = [a1 _liveStream];
        objc_msgSend(v22, "setFlags:", objc_msgSend(v22, "flags") | 0x20);
      }
      int v23 = [a1 logMessageProcessingBlock];

      [a1 _liveStream];
      if (v23) {
        char v24 = {;
      }
        objc_msgSend(v24, "setFlags:", objc_msgSend(v24, "flags") | 1);

        uint64_t v25 = [a1 _liveStream];
        objc_msgSend(v25, "setFlags:", objc_msgSend(v25, "flags") | 2);
      }
      else {
        id v26 = {;
      }
        objc_msgSend(v26, "setFlags:", objc_msgSend(v26, "flags") | 0x200);

        uint64_t v25 = [a1 _liveStream];
        objc_msgSend(v25, "setFlags:", objc_msgSend(v25, "flags") | 0x100);
      }

      uint64_t v31 = MEMORY[0x263EF8330];
      uint64_t v32 = 3221225472;
      char v33 = __153__SignpostSupportObjectExtractor_Notifications__processNotificationsWithIntervalTimeoutInSeconds_shouldCalculateAnimationFramerate_targetQueue_errorOut___block_invoke_4;
      unsigned __int8 v34 = &unk_264487F48;
      objc_copyWeak(&v35, &location);
      objc_msgSend(a1, "set_stopProcessingBlock:", &v31);
      double v27 = objc_msgSend(a1, "_loggingSupportStreamPredicateFromFiltersWithForLiveStreaming:", 1, v31, v32, v33, v34);
      double v28 = [a1 _liveStream];
      [v28 setFilterPredicate:v27];

      uint64_t v29 = [a1 _liveStream];
      [v29 activate];

      objc_destroyWeak(&v35);
      objc_destroyWeak(&v37);
      objc_destroyWeak(&v39);
      objc_destroyWeak(&location);
    }

    _Block_object_dispose(&v43, 8);
    _Block_object_dispose(&v47, 8);
  }
  else if (a6)
  {
    [MEMORY[0x263F087E8] errorWithCode:8 description:@"No processing blocks specified"];
    BOOL v12 = 0;
    *a6 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    BOOL v12 = 0;
  }

  return v12;
}

@end