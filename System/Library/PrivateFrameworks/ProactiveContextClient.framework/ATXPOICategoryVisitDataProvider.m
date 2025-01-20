@interface ATXPOICategoryVisitDataProvider
- (ATXPOICategoryEventAggregator)streamAggregator;
- (ATXPOICategoryVisitDataProvider)init;
- (ATXPOICategoryVisitDataProvider)initWithStream:(id)a3;
- (BMBiomeScheduler)scheduler;
- (BMStream)stream;
- (BOOL)hasExitedAllCategories:(id)a3;
- (BPSSink)sink;
- (OS_dispatch_queue)queue;
- (id)getCurrentVisit;
- (id)getCurrentVisitAtDate:(id)a3;
- (void)setQueue:(id)a3;
- (void)setScheduler:(id)a3;
- (void)setSink:(id)a3;
- (void)setStream:(id)a3;
- (void)setStreamAggregator:(id)a3;
- (void)subscribeToPOIChangesForCategories:(id)a3 observer:(id)a4 enterSelector:(SEL)a5 exitSelector:(SEL)a6 sinkCompletion:(id)a7;
- (void)unsubscribeToPOIChanges;
@end

@implementation ATXPOICategoryVisitDataProvider

- (ATXPOICategoryVisitDataProvider)init
{
  v3 = BiomeLibrary();
  v4 = [v3 Location];
  v5 = [v4 PointOfInterest];
  v6 = [v5 Category];
  v7 = [(ATXPOICategoryVisitDataProvider *)self initWithStream:v6];

  return v7;
}

- (ATXPOICategoryVisitDataProvider)initWithStream:(id)a3
{
  id v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)ATXPOICategoryVisitDataProvider;
  v6 = [(ATXPOICategoryVisitDataProvider *)&v14 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_stream, a3);
    v8 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v9 = dispatch_queue_create("com.apple.proactive.ATXPOICategoryVisitDataProvider.subscribe", v8);
    queue = v7->_queue;
    v7->_queue = (OS_dispatch_queue *)v9;

    uint64_t v11 = objc_opt_new();
    streamAggregator = v7->_streamAggregator;
    v7->_streamAggregator = (ATXPOICategoryEventAggregator *)v11;
  }
  return v7;
}

- (id)getCurrentVisit
{
  v3 = [(BMStream *)self->_stream atx_publisherWithStartDate:0 endDate:0 maxEvents:&unk_1F3539508 lastN:&unk_1F3539508 reversed:0];
  [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
  double v5 = v4 + -86400.0;
  [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
  v7 = [(ATXPOICategoryEventAggregator *)self->_streamAggregator groupVisitsFromPublisher:v3 startTimestamp:v5 endTimestamp:v6];
  v8 = [v7 finalPOIWithoutExit];

  return v8;
}

- (id)getCurrentVisitAtDate:(id)a3
{
  id v4 = a3;
  double v5 = [v4 dateByAddingTimeInterval:-86400.0];
  double v6 = [(BMStream *)self->_stream atx_publisherWithStartDate:v5 endDate:v4 maxEvents:0 lastN:0 reversed:0];
  streamAggregator = self->_streamAggregator;
  [v5 timeIntervalSinceReferenceDate];
  double v9 = v8;
  [v4 timeIntervalSinceReferenceDate];
  double v11 = v10;

  v12 = [(ATXPOICategoryEventAggregator *)streamAggregator groupVisitsFromPublisher:v6 startTimestamp:v9 endTimestamp:v11];
  v13 = [v12 finalPOIWithoutExit];

  return v13;
}

- (void)subscribeToPOIChangesForCategories:(id)a3 observer:(id)a4 enterSelector:(SEL)a5 exitSelector:(SEL)a6 sinkCompletion:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a7;
  [(ATXPOICategoryVisitDataProvider *)self unsubscribeToPOIChanges];
  v15 = [MEMORY[0x1E4F28F80] processInfo];
  v16 = [v15 processName];
  v17 = [v16 lowercaseString];

  v18 = [@"ATXPOICategoryVisitDataProvider.subscribe." stringByAppendingString:v17];
  v19 = (BMBiomeScheduler *)[objc_alloc(MEMORY[0x1E4F502E8]) initWithIdentifier:v18 targetQueue:self->_queue];
  scheduler = self->_scheduler;
  self->_scheduler = v19;

  v33[0] = 0;
  v33[1] = v33;
  v33[2] = 0x2020000000;
  char v34 = 0;
  v21 = [(BMStream *)self->_stream atx_DSLPublisher];
  v22 = [v21 subscribeOn:self->_scheduler];
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __121__ATXPOICategoryVisitDataProvider_subscribeToPOIChangesForCategories_observer_enterSelector_exitSelector_sinkCompletion___block_invoke;
  v27[3] = &unk_1E6BE6F88;
  v30 = v33;
  SEL v31 = a6;
  v27[4] = self;
  id v23 = v12;
  id v28 = v23;
  SEL v32 = a5;
  id v24 = v13;
  id v29 = v24;
  v25 = [v22 sinkWithCompletion:v14 receiveInput:v27];
  sink = self->_sink;
  self->_sink = v25;

  _Block_object_dispose(v33, 8);
}

void __121__ATXPOICategoryVisitDataProvider_subscribeToPOIChangesForCategories_observer_enterSelector_exitSelector_sinkCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v10 = a2;
  v3 = [v10 eventBody];
  id v4 = (uint64_t *)(a1 + 64);
  if (*(void *)(a1 + 64)
    && *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24)
    && [*(id *)(a1 + 32) hasExitedAllCategories:*(void *)(a1 + 40)])
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 0;
  }
  else
  {
    if (*(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24)) {
      goto LABEL_11;
    }
    double v5 = *(void **)(a1 + 40);
    double v6 = [v3 poiCategory];
    LODWORD(v5) = [v5 containsObject:v6];

    if (!v5) {
      goto LABEL_11;
    }
    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = *(void *)(a1 + 64) != 0;
    id v4 = (uint64_t *)(a1 + 72);
  }
  uint64_t v7 = *v4;
  double v8 = (void *)MEMORY[0x1E0187360]();
  double v9 = *(void **)(a1 + 48);
  if (v9) {
    ((void (*)(void, uint64_t))[v9 methodForSelector:v7])(*(void *)(a1 + 48), v7);
  }
LABEL_11:
}

- (BOOL)hasExitedAllCategories:(id)a3
{
  id v4 = a3;
  double v5 = [(ATXPOICategoryVisitDataProvider *)self getCurrentVisit];
  double v6 = v5;
  if (v5 && ([v5 hasExited] & 1) == 0)
  {
    uint64_t v13 = 0;
    id v14 = &v13;
    uint64_t v15 = 0x2020000000;
    char v16 = 0;
    double v8 = [v6 possibleCategoryNames];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __58__ATXPOICategoryVisitDataProvider_hasExitedAllCategories___block_invoke;
    v10[3] = &unk_1E6BE6FB0;
    id v11 = v4;
    id v12 = &v13;
    [v8 enumerateObjectsUsingBlock:v10];

    BOOL v7 = *((unsigned char *)v14 + 24) == 0;
    _Block_object_dispose(&v13, 8);
  }
  else
  {
    BOOL v7 = 1;
  }

  return v7;
}

uint64_t __58__ATXPOICategoryVisitDataProvider_hasExitedAllCategories___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v7 = a2;
  if (a3 != 3)
  {
    if (![*(id *)(a1 + 32) containsObject:v7]) {
      goto LABEL_5;
    }
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  }
  *a4 = 1;
LABEL_5:

  return MEMORY[0x1F41817F8]();
}

- (void)unsubscribeToPOIChanges
{
  [(BPSSink *)self->_sink cancel];
  sink = self->_sink;
  self->_sink = 0;

  scheduler = self->_scheduler;
  self->_scheduler = 0;
}

- (ATXPOICategoryEventAggregator)streamAggregator
{
  return self->_streamAggregator;
}

- (void)setStreamAggregator:(id)a3
{
}

- (BMStream)stream
{
  return self->_stream;
}

- (void)setStream:(id)a3
{
}

- (BMBiomeScheduler)scheduler
{
  return self->_scheduler;
}

- (void)setScheduler:(id)a3
{
}

- (BPSSink)sink
{
  return self->_sink;
}

- (void)setSink:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_sink, 0);
  objc_storeStrong((id *)&self->_scheduler, 0);
  objc_storeStrong((id *)&self->_stream, 0);

  objc_storeStrong((id *)&self->_streamAggregator, 0);
}

@end