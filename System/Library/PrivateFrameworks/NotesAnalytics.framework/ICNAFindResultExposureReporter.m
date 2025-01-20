@interface ICNAFindResultExposureReporter
- (BOOL)hasActiveTrackingFindSession;
- (FindSessionData)findSessionData;
- (ICNAEventReporter)eventReporter;
- (ICNAFindResultExposureReporter)initWithWindow:(id)a3;
- (OS_dispatch_queue)isolationQueue;
- (UIWindow)window;
- (void)eventReporterLostSession:(id)a3;
- (void)setEventReporter:(id)a3;
- (void)setFindSessionData:(id)a3;
- (void)setIsolationQueue:(id)a3;
- (void)setWindow:(id)a3;
- (void)startTrackingFindSession;
- (void)submitEventIfApplicableForNote:(id)a3;
- (void)updateWithSearchQuery:(id)a3;
@end

@implementation ICNAFindResultExposureReporter

- (ICNAFindResultExposureReporter)initWithWindow:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)ICNAFindResultExposureReporter;
  v5 = [(ICNAFindResultExposureReporter *)&v10 init];
  if (v5)
  {
    v6 = dispatch_queue_attr_make_with_qos_class(MEMORY[0x1E4F14430], QOS_CLASS_UTILITY, 0);
    dispatch_queue_t v7 = dispatch_queue_create("com.apple.notes.analytics.findResultExposureReporter", v6);
    isolationQueue = v5->_isolationQueue;
    v5->_isolationQueue = (OS_dispatch_queue *)v7;

    objc_storeWeak((id *)&v5->_window, v4);
  }

  return v5;
}

- (void)startTrackingFindSession
{
  v3 = [(ICNAFindResultExposureReporter *)self isolationQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __58__ICNAFindResultExposureReporter_startTrackingFindSession__block_invoke;
  block[3] = &unk_1E64B8A48;
  block[4] = self;
  dispatch_async(v3, block);
}

void __58__ICNAFindResultExposureReporter_startTrackingFindSession__block_invoke(uint64_t a1)
{
  v2 = objc_alloc_init(FindSessionData);
  [*(id *)(a1 + 32) setFindSessionData:v2];

  id v3 = [*(id *)(a1 + 32) eventReporter];
  [v3 startFindInNoteEvent];
}

- (void)updateWithSearchQuery:(id)a3
{
  id v4 = a3;
  v5 = [(ICNAFindResultExposureReporter *)self isolationQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __56__ICNAFindResultExposureReporter_updateWithSearchQuery___block_invoke;
  v7[3] = &unk_1E64B8A70;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __56__ICNAFindResultExposureReporter_updateWithSearchQuery___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  id v2 = [*(id *)(a1 + 32) findSessionData];
  [v2 setSearchQuery:v1];
}

- (void)submitEventIfApplicableForNote:(id)a3
{
  id v4 = a3;
  v5 = [(ICNAFindResultExposureReporter *)self isolationQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __65__ICNAFindResultExposureReporter_submitEventIfApplicableForNote___block_invoke;
  v7[3] = &unk_1E64B8A70;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __65__ICNAFindResultExposureReporter_submitEventIfApplicableForNote___block_invoke(uint64_t a1)
{
  id v4 = [*(id *)(a1 + 32) findSessionData];
  if (v4)
  {
    id v2 = [*(id *)(a1 + 32) eventReporter];
    id v3 = [v4 searchQuery];
    objc_msgSend(v2, "submitFindInNoteEventWasSearchQueryEntered:modernNote:", objc_msgSend(v3, "length") != 0, *(void *)(a1 + 40));

    [*(id *)(a1 + 32) setFindSessionData:0];
  }
}

- (BOOL)hasActiveTrackingFindSession
{
  id v2 = self;
  uint64_t v6 = 0;
  dispatch_queue_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  id v3 = [(ICNAFindResultExposureReporter *)self isolationQueue];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __62__ICNAFindResultExposureReporter_hasActiveTrackingFindSession__block_invoke;
  v5[3] = &unk_1E64B8A98;
  v5[4] = v2;
  v5[5] = &v6;
  dispatch_sync(v3, v5);

  LOBYTE(v2) = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

void __62__ICNAFindResultExposureReporter_hasActiveTrackingFindSession__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) findSessionData];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v2 != 0;
}

- (ICNAEventReporter)eventReporter
{
  if (!self->_eventReporter
    && +[ICNAOptedInObject isOptedInForAnalytics])
  {
    id v3 = [ICNAEventReporter alloc];
    id v4 = (objc_class *)objc_opt_class();
    v5 = NSStringFromClass(v4);
    uint64_t v6 = [(ICNAFindResultExposureReporter *)self window];
    dispatch_queue_t v7 = [(ICNAEventReporter *)v3 initWithSubTrackerName:v5 window:v6];
    eventReporter = self->_eventReporter;
    self->_eventReporter = v7;

    char v9 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v9 addObserver:self selector:sel_eventReporterLostSession_ name:@"ICNAEventReporterLostSessionNotification" object:self->_eventReporter];
  }
  objc_super v10 = self->_eventReporter;
  return v10;
}

- (void)eventReporterLostSession:(id)a3
{
  eventReporter = self->_eventReporter;
  self->_eventReporter = 0;
  id v5 = a3;

  id v7 = [MEMORY[0x1E4F28EB8] defaultCenter];
  uint64_t v6 = [v5 object];

  [v7 removeObserver:self name:@"ICNAEventReporterLostSessionNotification" object:v6];
}

- (OS_dispatch_queue)isolationQueue
{
  return self->_isolationQueue;
}

- (void)setIsolationQueue:(id)a3
{
}

- (UIWindow)window
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_window);
  return (UIWindow *)WeakRetained;
}

- (void)setWindow:(id)a3
{
}

- (void)setEventReporter:(id)a3
{
}

- (FindSessionData)findSessionData
{
  return self->_findSessionData;
}

- (void)setFindSessionData:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_findSessionData, 0);
  objc_storeStrong((id *)&self->_eventReporter, 0);
  objc_destroyWeak((id *)&self->_window);
  objc_storeStrong((id *)&self->_isolationQueue, 0);
}

@end