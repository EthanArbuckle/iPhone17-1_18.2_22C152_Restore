@interface PLBackgroundJobStatusCenter
- (NSDictionary)statusDumpDictionary;
- (PLBackgroundJobStatusCenter)init;
- (void)_addRegistrationEventToQueue:(id)a3;
- (void)_addRunningEventToQueue:(id)a3;
- (void)_recordNonRegistrationEvent;
- (void)_recordRegistrationEventToState:(unint64_t)a3;
- (void)backgroundJobServiceDidChangeStateFrom:(unint64_t)a3 to:(unint64_t)a4;
- (void)recordActivityRegisteredWithCriteria:(id)a3;
- (void)recordFinishingWorker:(id)a3;
- (void)recordStartingWorker:(id)a3 withJobCount:(unint64_t)a4;
- (void)recordStoppingWorker:(id)a3 withRemainingJobCount:(unint64_t)a4;
- (void)recordWorkerHasPendingJobs:(id)a3;
@end

@implementation PLBackgroundJobStatusCenter

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_isolationQueue, 0);
  objc_storeStrong((id *)&self->_criteriaShortCodesOfRegisteredActivities, 0);
  objc_storeStrong((id *)&self->_workersResponsibleForRegistration, 0);
  objc_storeStrong((id *)&self->_runningEventsQueue, 0);
  objc_storeStrong((id *)&self->_registrationEventsQueue, 0);
}

- (void)backgroundJobServiceDidChangeStateFrom:(unint64_t)a3 to:(unint64_t)a4
{
  isolationQueue = self->_isolationQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __73__PLBackgroundJobStatusCenter_backgroundJobServiceDidChangeStateFrom_to___block_invoke;
  block[3] = &unk_1E5875E90;
  block[4] = self;
  block[5] = a4;
  block[6] = a3;
  dispatch_async(isolationQueue, block);
}

uint64_t __73__PLBackgroundJobStatusCenter_backgroundJobServiceDidChangeStateFrom_to___block_invoke(uint64_t result)
{
  v1 = (void *)result;
  if (*(void *)(result + 40) == 2)
  {
    [*(id *)(*(void *)(result + 32) + 24) removeAllObjects];
    result = [*(id *)(v1[4] + 32) removeAllObjects];
  }
  if (v1[6] == 2)
  {
    uint64_t v2 = v1[5];
    if (v2 == 3)
    {
      v4 = (void *)v1[4];
      return [v4 _recordNonRegistrationEvent];
    }
    else if (v2 == 4)
    {
      v3 = (void *)v1[4];
      return [v3 _recordRegistrationEventToState:4];
    }
  }
  return result;
}

- (NSDictionary)statusDumpDictionary
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__116117;
  v10 = __Block_byref_object_dispose__116118;
  id v11 = 0;
  isolationQueue = self->_isolationQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __51__PLBackgroundJobStatusCenter_statusDumpDictionary__block_invoke;
  v5[3] = &unk_1E5875E68;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(isolationQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSDictionary *)v3;
}

void __51__PLBackgroundJobStatusCenter_statusDumpDictionary__block_invoke(uint64_t a1)
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v3 = (void *)[*(id *)(*(void *)(a1 + 32) + 8) copy];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v23 objects:v30 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v24;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v24 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = [*(id *)(*((void *)&v23 + 1) + 8 * v7) statusDump];
        [v2 addObject:v8];

        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v23 objects:v30 count:16];
    }
    while (v5);
  }

  id v9 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  v10 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 16), "copy", 0);
  uint64_t v11 = [v10 countByEnumeratingWithState:&v19 objects:v29 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v20;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v20 != v13) {
          objc_enumerationMutation(v10);
        }
        v15 = [*(id *)(*((void *)&v19 + 1) + 8 * v14) statusDump];
        [v9 addObject:v15];

        ++v14;
      }
      while (v12 != v14);
      uint64_t v12 = [v10 countByEnumeratingWithState:&v19 objects:v29 count:16];
    }
    while (v12);
  }

  v27[0] = @"RegistrationEvents";
  v27[1] = @"RunningEvents";
  v28[0] = v2;
  v28[1] = v9;
  uint64_t v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v28 forKeys:v27 count:2];
  uint64_t v17 = *(void *)(*(void *)(a1 + 40) + 8);
  v18 = *(void **)(v17 + 40);
  *(void *)(v17 + 40) = v16;
}

- (void)recordFinishingWorker:(id)a3
{
  id v4 = a3;
  isolationQueue = self->_isolationQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __53__PLBackgroundJobStatusCenter_recordFinishingWorker___block_invoke;
  v7[3] = &unk_1E5875E18;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  dispatch_async(isolationQueue, v7);
}

void __53__PLBackgroundJobStatusCenter_recordFinishingWorker___block_invoke(uint64_t a1)
{
  id v4 = objc_alloc_init(PLBackgroundJobStatusFinishWorkerEvent);
  id v2 = [MEMORY[0x1E4F1C9C8] date];
  [(PLBackgroundJobStatusEvent *)v4 setEventTimestamp:v2];

  id v3 = [*(id *)(a1 + 32) workerName];
  [(PLBackgroundJobStatusFinishWorkerEvent *)v4 setWorker:v3];

  [*(id *)(a1 + 40) _addRunningEventToQueue:v4];
}

- (void)recordStoppingWorker:(id)a3 withRemainingJobCount:(unint64_t)a4
{
  id v6 = a3;
  isolationQueue = self->_isolationQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __74__PLBackgroundJobStatusCenter_recordStoppingWorker_withRemainingJobCount___block_invoke;
  block[3] = &unk_1E5875E40;
  uint64_t v11 = self;
  unint64_t v12 = a4;
  id v10 = v6;
  id v8 = v6;
  dispatch_async(isolationQueue, block);
}

void __74__PLBackgroundJobStatusCenter_recordStoppingWorker_withRemainingJobCount___block_invoke(uint64_t a1)
{
  id v4 = objc_alloc_init(PLBackgroundJobStatusStopWorkerEvent);
  id v2 = [MEMORY[0x1E4F1C9C8] date];
  [(PLBackgroundJobStatusEvent *)v4 setEventTimestamp:v2];

  id v3 = [*(id *)(a1 + 32) workerName];
  [(PLBackgroundJobStatusStopWorkerEvent *)v4 setWorker:v3];

  [(PLBackgroundJobStatusStopWorkerEvent *)v4 setPendingJobsCount:*(void *)(a1 + 48)];
  [*(id *)(a1 + 40) _addRunningEventToQueue:v4];
}

- (void)recordStartingWorker:(id)a3 withJobCount:(unint64_t)a4
{
  id v6 = a3;
  isolationQueue = self->_isolationQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __65__PLBackgroundJobStatusCenter_recordStartingWorker_withJobCount___block_invoke;
  block[3] = &unk_1E5875E40;
  uint64_t v11 = self;
  unint64_t v12 = a4;
  id v10 = v6;
  id v8 = v6;
  dispatch_async(isolationQueue, block);
}

void __65__PLBackgroundJobStatusCenter_recordStartingWorker_withJobCount___block_invoke(uint64_t a1)
{
  id v4 = objc_alloc_init(PLBackgroundJobStatusStartWorkerEvent);
  id v2 = [MEMORY[0x1E4F1C9C8] date];
  [(PLBackgroundJobStatusEvent *)v4 setEventTimestamp:v2];

  id v3 = [*(id *)(a1 + 32) workerName];
  [(PLBackgroundJobStatusStartWorkerEvent *)v4 setWorker:v3];

  [(PLBackgroundJobStatusStartWorkerEvent *)v4 setJobsCount:*(void *)(a1 + 48)];
  [*(id *)(a1 + 40) _addRunningEventToQueue:v4];
}

- (void)recordActivityRegisteredWithCriteria:(id)a3
{
  id v4 = a3;
  isolationQueue = self->_isolationQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __68__PLBackgroundJobStatusCenter_recordActivityRegisteredWithCriteria___block_invoke;
  v7[3] = &unk_1E5875E18;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(isolationQueue, v7);
}

void __68__PLBackgroundJobStatusCenter_recordActivityRegisteredWithCriteria___block_invoke(uint64_t a1)
{
  v1 = *(void **)(*(void *)(a1 + 32) + 32);
  id v2 = [*(id *)(a1 + 40) shortCode];
  [v1 addObject:v2];
}

- (void)recordWorkerHasPendingJobs:(id)a3
{
  id v4 = a3;
  isolationQueue = self->_isolationQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __58__PLBackgroundJobStatusCenter_recordWorkerHasPendingJobs___block_invoke;
  v7[3] = &unk_1E5875E18;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(isolationQueue, v7);
}

void __58__PLBackgroundJobStatusCenter_recordWorkerHasPendingJobs___block_invoke(uint64_t a1)
{
  v1 = *(void **)(*(void *)(a1 + 32) + 24);
  id v2 = [*(id *)(a1 + 40) workerName];
  [v1 addObject:v2];
}

- (void)_recordNonRegistrationEvent
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_isolationQueue);
  id v4 = objc_alloc_init(PLBackgroundJobStatusRegistrationEvent);
  id v3 = [MEMORY[0x1E4F1C9C8] date];
  [(PLBackgroundJobStatusEvent *)v4 setEventTimestamp:v3];

  [(PLBackgroundJobStatusRegistrationEvent *)v4 setRegisteredActivity:0];
  [(PLBackgroundJobStatusCenter *)self _addRegistrationEventToQueue:v4];
  [(NSMutableSet *)self->_workersResponsibleForRegistration removeAllObjects];
}

- (void)_recordRegistrationEventToState:(unint64_t)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_isolationQueue);
  id v4 = objc_alloc_init(PLBackgroundJobStatusRegistrationEvent);
  uint64_t v5 = [MEMORY[0x1E4F1C9C8] date];
  [(PLBackgroundJobStatusEvent *)v4 setEventTimestamp:v5];

  [(PLBackgroundJobStatusRegistrationEvent *)v4 setRegisteredActivity:1];
  id v6 = [(NSMutableSet *)self->_workersResponsibleForRegistration allObjects];
  [(PLBackgroundJobStatusRegistrationEvent *)v4 setWorkersResponsible:v6];

  id v7 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v8 = self->_criteriaShortCodesOfRegisteredActivities;
  uint64_t v9 = [(NSMutableSet *)v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v15;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v15 != v11) {
          objc_enumerationMutation(v8);
        }
        [v7 appendFormat:@"%@ ", *(void *)(*((void *)&v14 + 1) + 8 * v12++)];
      }
      while (v10 != v12);
      uint64_t v10 = [(NSMutableSet *)v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v10);
  }

  uint64_t v13 = (void *)[v7 copy];
  [(PLBackgroundJobStatusRegistrationEvent *)v4 setRegisteredPriorities:v13];

  [(PLBackgroundJobStatusCenter *)self _addRegistrationEventToQueue:v4];
  [(NSMutableSet *)self->_workersResponsibleForRegistration removeAllObjects];
  [(NSMutableSet *)self->_criteriaShortCodesOfRegisteredActivities removeAllObjects];
}

- (void)_addRunningEventToQueue:(id)a3
{
  isolationQueue = self->_isolationQueue;
  id v5 = a3;
  dispatch_assert_queue_V2(isolationQueue);
  [(NSMutableArray *)self->_runningEventsQueue addObject:v5];

  if ((unint64_t)[(NSMutableArray *)self->_runningEventsQueue count] >= 0x15)
  {
    runningEventsQueue = self->_runningEventsQueue;
    [(NSMutableArray *)runningEventsQueue removeObjectAtIndex:0];
  }
}

- (void)_addRegistrationEventToQueue:(id)a3
{
  isolationQueue = self->_isolationQueue;
  id v5 = a3;
  dispatch_assert_queue_V2(isolationQueue);
  [(NSMutableArray *)self->_registrationEventsQueue addObject:v5];

  if ((unint64_t)[(NSMutableArray *)self->_registrationEventsQueue count] >= 0x15)
  {
    registrationEventsQueue = self->_registrationEventsQueue;
    [(NSMutableArray *)registrationEventsQueue removeObjectAtIndex:0];
  }
}

- (PLBackgroundJobStatusCenter)init
{
  v16.receiver = self;
  v16.super_class = (Class)PLBackgroundJobStatusCenter;
  id v2 = [(PLBackgroundJobStatusCenter *)&v16 init];
  if (v2)
  {
    id v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    registrationEventsQueue = v2->_registrationEventsQueue;
    v2->_registrationEventsQueue = v3;

    id v5 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    runningEventsQueue = v2->_runningEventsQueue;
    v2->_runningEventsQueue = v5;

    id v7 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    workersResponsibleForRegistration = v2->_workersResponsibleForRegistration;
    v2->_workersResponsibleForRegistration = v7;

    uint64_t v9 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    criteriaShortCodesOfRegisteredActivities = v2->_criteriaShortCodesOfRegisteredActivities;
    v2->_criteriaShortCodesOfRegisteredActivities = v9;

    uint64_t v11 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    uint64_t v12 = dispatch_queue_attr_make_with_qos_class(v11, QOS_CLASS_BACKGROUND, 0);

    dispatch_queue_t v13 = dispatch_queue_create("com.apple.photos.backgroundjobstatuscenter.isolationqueue", v12);
    isolationQueue = v2->_isolationQueue;
    v2->_isolationQueue = (OS_dispatch_queue *)v13;
  }
  return v2;
}

@end