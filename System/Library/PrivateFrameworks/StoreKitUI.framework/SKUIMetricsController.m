@interface SKUIMetricsController
+ (void)flushImmediately;
- (BOOL)canRecordEventWithType:(id)a3;
- (NSNumber)accountIdentifier;
- (NSString)applicationIdentifier;
- (NSString)hostApplicationIdentifier;
- (NSString)pageContext;
- (NSString)pageURL;
- (NSString)topic;
- (NSString)userAgent;
- (NSString)windowOrientation;
- (SKUIMetricsController)initWithGlobalConfiguration:(id)a3;
- (SKUIMetricsImpressionSession)activeImpressionsSession;
- (SSMetricsConfiguration)globalConfiguration;
- (SSMetricsConfiguration)pageConfiguration;
- (double)flushInterval;
- (id)clickEventWithItem:(id)a3 locationPosition:(int64_t)a4;
- (id)compoundStringWithElements:(id)a3;
- (id)itemOfferClickEventWithItem:(id)a3 locationPosition:(int64_t)a4;
- (id)locationWithPageComponent:(id)a3;
- (id)locationWithPosition:(int64_t)a3 type:(id)a4 fieldData:(id)a5;
- (id)performActionForItem:(id)a3;
- (id)performActionForItem:(id)a3 clientContext:(id)a4;
- (id)performActionForItem:(id)a3 offer:(id)a4 clientContext:(id)a5;
- (id)performActionForItem:(id)a3 offer:(id)a4 clientContext:(id)a5 completionBlock:(id)a6;
- (id)performActionForSoftwareItem:(id)a3 offer:(id)a4 clientContext:(id)a5 completionBlock:(id)a6;
- (id)tokenStringWithElements:(id)a3;
- (void)_insertEvent:(id)a3;
- (void)_recordActiveImpressions;
- (void)_waitUntilRecordingComplete;
- (void)closeImpressionsSession;
- (void)dealloc;
- (void)flushImmediately;
- (void)pingURLs:(id)a3;
- (void)pingURLs:(id)a3 withClientContext:(id)a4;
- (void)recordBuyConfirmedEventsForItems:(id)a3 purchaseResponses:(id)a4;
- (void)recordEvent:(id)a3;
- (void)setApplicationIdentifier:(id)a3;
- (void)setHostApplicationIdentifier:(id)a3;
- (void)setPageConfiguration:(id)a3;
- (void)setPageContext:(id)a3;
- (void)setPageURL:(id)a3;
- (void)setTopic:(id)a3;
- (void)setUserAgent:(id)a3;
- (void)setWindowOrientation:(id)a3;
@end

@implementation SKUIMetricsController

- (SKUIMetricsController)initWithGlobalConfiguration:(id)a3
{
  id v5 = a3;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
  {
    -[SKUIMetricsController initWithGlobalConfiguration:]();
  }
  v17.receiver = self;
  v17.super_class = (Class)SKUIMetricsController;
  v6 = [(SKUIMetricsController *)&v17 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_globalConfiguration, a3);
    v8 = [MEMORY[0x1E4FA8230] databasePath];
    int IsLocalWritable = SSFileIsLocalWritable();

    v10 = (Class *)0x1E4FA8220;
    if (!IsLocalWritable) {
      v10 = (Class *)0x1E4FA8210;
    }
    v11 = (SSMetricsController *)objc_alloc_init(*v10);
    controller = v7->_controller;
    v7->_controller = v11;

    [(SSMetricsController *)v7->_controller setGlobalConfiguration:v5];
    [(SSMetricsConfiguration *)v7->_globalConfiguration reportingFrequency];
    v7->_flushesImmediately = v13 == 0.0;
    v7->_impressionsEnabled = [(SKUIMetricsController *)v7 canRecordEventWithType:*MEMORY[0x1E4FA8880]];
    v14 = [MEMORY[0x1E4FA81D8] sharedConfig];
    v7->_loggingEnabled = [v14 shouldLog];

    v15 = +[SKUIMetricsFlushTimer sharedTimer];
    [v15 addMetricsController:v7];
  }
  return v7;
}

- (void)dealloc
{
  impressionsTimer = self->_impressionsTimer;
  if (impressionsTimer) {
    dispatch_source_cancel(impressionsTimer);
  }
  v4 = +[SKUIMetricsFlushTimer sharedTimer];
  [v4 removeMetricsController:self];

  v5.receiver = self;
  v5.super_class = (Class)SKUIMetricsController;
  [(SKUIMetricsController *)&v5 dealloc];
}

- (NSNumber)accountIdentifier
{
  v2 = [MEMORY[0x1E4FA8100] defaultStore];
  v3 = [v2 activeAccount];
  v4 = [v3 uniqueIdentifier];

  return (NSNumber *)v4;
}

- (SKUIMetricsImpressionSession)activeImpressionsSession
{
  if (self->_activeImpressionsSession
    || self->_impressionsEnabled
    && (v7 = objc_alloc_init(SKUIMetricsImpressionSession),
        activeImpressionsSession = self->_activeImpressionsSession,
        self->_activeImpressionsSession = v7,
        activeImpressionsSession,
        self->_activeImpressionsSession))
  {
    v3 = [MEMORY[0x1E4FB1438] sharedApplication];
    uint64_t v4 = [v3 applicationState];

    if (!v4)
    {
      impressionsTimer = self->_impressionsTimer;
      if (impressionsTimer)
      {
        dispatch_time_t v6 = dispatch_time(0, 2000000000);
        dispatch_source_set_timer(impressionsTimer, v6, 0, 0);
      }
      else
      {
        objc_initWeak(&location, self);
        v9 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, MEMORY[0x1E4F14428]);
        v10 = self->_impressionsTimer;
        self->_impressionsTimer = v9;

        v11 = self->_impressionsTimer;
        dispatch_time_t v12 = dispatch_time(0, 2000000000);
        dispatch_source_set_timer(v11, v12, 0, 0);
        double v13 = self->_impressionsTimer;
        v16[0] = MEMORY[0x1E4F143A8];
        v16[1] = 3221225472;
        v16[2] = __49__SKUIMetricsController_activeImpressionsSession__block_invoke;
        v16[3] = &unk_1E6422250;
        objc_copyWeak(&v17, &location);
        dispatch_source_set_event_handler(v13, v16);
        dispatch_resume((dispatch_object_t)self->_impressionsTimer);
        objc_destroyWeak(&v17);
        objc_destroyWeak(&location);
      }
    }
  }
  v14 = self->_activeImpressionsSession;

  return v14;
}

void __49__SKUIMetricsController_activeImpressionsSession__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained closeImpressionsSession];
}

- (BOOL)canRecordEventWithType:(id)a3
{
  id v4 = a3;
  if ([(SSMetricsConfiguration *)self->_globalConfiguration isEventTypeBlacklisted:v4]) {
    LOBYTE(v5) = 0;
  }
  else {
    int v5 = [(SSMetricsConfiguration *)self->_pageConfiguration isEventTypeBlacklisted:v4] ^ 1;
  }

  return v5;
}

- (id)clickEventWithItem:(id)a3 locationPosition:(int64_t)a4
{
  v15[1] = *MEMORY[0x1E4F143B8];
  dispatch_time_t v6 = (objc_class *)MEMORY[0x1E4FA8200];
  id v7 = a3;
  id v8 = objc_alloc_init(v6);
  v9 = objc_msgSend(NSString, "stringWithFormat:", @"%lld", objc_msgSend(v7, "itemIdentifier"));
  [v8 setTargetIdentifier:v9];

  uint64_t v10 = *MEMORY[0x1E4FA88E0];
  [v8 setTargetType:*MEMORY[0x1E4FA88E0]];
  v11 = [v7 productPageURLString];
  [v8 setTargetURL:v11];

  dispatch_time_t v12 = [(SKUIMetricsController *)self locationWithPosition:a4 type:v10 fieldData:v7];

  if (v12)
  {
    v15[0] = v12;
    double v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:1];
    [v8 setLocationWithEventLocations:v13];
  }

  return v8;
}

- (void)closeImpressionsSession
{
  [(SKUIMetricsController *)self _recordActiveImpressions];
  if (self->_flushesImmediately)
  {
    [(SKUIMetricsController *)self flushImmediately];
  }
}

- (id)compoundStringWithElements:(id)a3
{
  return (id)[(SSMetricsConfiguration *)self->_globalConfiguration compoundStringWithElements:a3];
}

- (void)flushImmediately
{
  v3 = [MEMORY[0x1E4FB1438] sharedApplication];
  uint64_t v4 = *MEMORY[0x1E4FB2748];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __41__SKUIMetricsController_flushImmediately__block_invoke;
  v12[3] = &unk_1E6426868;
  id v5 = v3;
  id v13 = v5;
  uint64_t v14 = v4;
  uint64_t v6 = [v5 beginBackgroundTaskWithName:@"SKUIMetricsController.flushImmediately" expirationHandler:v12];
  [(SKUIMetricsController *)self _recordActiveImpressions];
  controller = self->_controller;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __41__SKUIMetricsController_flushImmediately__block_invoke_2;
  v9[3] = &unk_1E6428AC8;
  id v10 = v5;
  uint64_t v11 = v6;
  id v8 = v5;
  [(SSMetricsController *)controller flushUnreportedEventsWithCompletionHandler:v9];
}

uint64_t __41__SKUIMetricsController_flushImmediately__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) endBackgroundTask:*(void *)(a1 + 40)];
}

uint64_t __41__SKUIMetricsController_flushImmediately__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) endBackgroundTask:*(void *)(a1 + 40)];
}

+ (void)flushImmediately
{
  id v2 = +[SKUIMetricsFlushTimer sharedTimer];
  [v2 flushAllMetricsControllers];
}

- (double)flushInterval
{
  [(SSMetricsConfiguration *)self->_globalConfiguration reportingFrequency];
  return result;
}

- (id)itemOfferClickEventWithItem:(id)a3 locationPosition:(int64_t)a4
{
  v20[2] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = objc_alloc_init(MEMORY[0x1E4FA8200]);
  id v8 = objc_msgSend(NSString, "stringWithFormat:", @"%lld", objc_msgSend(v6, "itemIdentifier"));
  [v7 setTargetIdentifier:v8];

  uint64_t v9 = *MEMORY[0x1E4FA88D0];
  [v7 setTargetType:*MEMORY[0x1E4FA88D0]];
  id v10 = +[SKUIItemStateCenter defaultCenter];
  uint64_t v11 = [v10 metricsActionTypeForItem:v6];

  [v7 setActionType:v11];
  if ([v11 isEqualToString:*MEMORY[0x1E4FA8860]])
  {
    dispatch_time_t v12 = [v6 bundleIdentifier];
    [v7 setActionDetails:v12];
LABEL_6:

    goto LABEL_7;
  }
  if ([v11 isEqualToString:*MEMORY[0x1E4FA8848]])
  {
    id v13 = [v6 primaryItemOffer];
    dispatch_time_t v12 = [v13 actionParameters];

    if (v12)
    {
      uint64_t v14 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C9E8]), "initWithObjectsAndKeys:", v12, @"buyParams", 0);
      [v7 setActionDetails:v14];
    }
    goto LABEL_6;
  }
LABEL_7:
  v15 = [(SKUIMetricsController *)self locationWithPosition:0 type:v9 fieldData:0];
  uint64_t v16 = [(SKUIMetricsController *)self locationWithPosition:a4 type:*MEMORY[0x1E4FA88E0] fieldData:v6];
  id v17 = (void *)v16;
  if (v15 && v16)
  {
    v20[0] = v15;
    v20[1] = v16;
    v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:2];
    [v7 setLocationWithEventLocations:v18];
  }

  return v7;
}

- (id)locationWithPageComponent:(id)a3
{
  controller = self->_controller;
  id v4 = a3;
  uint64_t v5 = [v4 metricsLocationPosition];
  id v6 = [v4 metricsElementName];
  id v7 = [(SSMetricsController *)controller locationWithPosition:v5 type:v6 fieldData:v4];

  return v7;
}

- (id)locationWithPosition:(int64_t)a3 type:(id)a4 fieldData:(id)a5
{
  return (id)[(SSMetricsController *)self->_controller locationWithPosition:a3 type:a4 fieldData:a5];
}

- (id)performActionForItem:(id)a3
{
  id v4 = a3;
  BOOL v5 = SKUIItemStateCenterUseAppstoredPurchases(v4);
  id v6 = [v4 primaryItemOffer];
  if (v5) {
    [(SKUIMetricsController *)self performActionForSoftwareItem:v4 offer:v6 clientContext:0 completionBlock:0];
  }
  else {
  id v7 = [(SKUIMetricsController *)self performActionForItem:v4 offer:v6 clientContext:0 completionBlock:0];
  }

  return v7;
}

- (id)performActionForItem:(id)a3 clientContext:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  BOOL v8 = SKUIItemStateCenterUseAppstoredPurchases(v7);
  uint64_t v9 = [v7 primaryItemOffer];
  if (v8) {
    [(SKUIMetricsController *)self performActionForSoftwareItem:v7 offer:v9 clientContext:v6 completionBlock:0];
  }
  else {
  id v10 = [(SKUIMetricsController *)self performActionForItem:v7 offer:v9 clientContext:v6 completionBlock:0];
  }

  return v10;
}

- (id)performActionForItem:(id)a3 offer:(id)a4 clientContext:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  if (SKUIItemStateCenterUseAppstoredPurchases(v10)) {
    [(SKUIMetricsController *)self performActionForSoftwareItem:v10 offer:v9 clientContext:v8 completionBlock:0];
  }
  else {
  uint64_t v11 = [(SKUIMetricsController *)self performActionForItem:v10 offer:v9 clientContext:v8 completionBlock:0];
  }

  return v11;
}

- (id)performActionForItem:(id)a3 offer:(id)a4 clientContext:(id)a5 completionBlock:(id)a6
{
  id v10 = a6;
  uint64_t v11 = (objc_class *)MEMORY[0x1E4FA8250];
  id v12 = a5;
  id v13 = a4;
  id v14 = a3;
  id v15 = objc_alloc_init(v11);
  uint64_t v16 = [v14 itemIdentifier];
  id v17 = +[SKUIItemStateCenter defaultCenter];
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __82__SKUIMetricsController_performActionForItem_offer_clientContext_completionBlock___block_invoke;
  v22[3] = &unk_1E642ADC8;
  id v23 = v15;
  v24 = self;
  id v25 = v10;
  uint64_t v26 = v16;
  id v18 = v10;
  id v19 = v15;
  v20 = [v17 performActionForItem:v14 offer:v13 clientContext:v12 completionBlock:v22];

  return v20;
}

void __82__SKUIMetricsController_performActionForItem_offer_clientContext_completionBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 transactionIdentifierForItemIdentifier:*(void *)(a1 + 56)];
  if (v4)
  {
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __82__SKUIMetricsController_performActionForItem_offer_clientContext_completionBlock___block_invoke_2;
    v8[3] = &unk_1E6423618;
    id v9 = *(id *)(a1 + 32);
    id v10 = v3;
    id v5 = v4;
    uint64_t v6 = *(void *)(a1 + 40);
    id v11 = v5;
    uint64_t v12 = v6;
    dispatch_async(MEMORY[0x1E4F14428], v8);
  }
  uint64_t v7 = *(void *)(a1 + 48);
  if (v7) {
    (*(void (**)(uint64_t, id))(v7 + 16))(v7, v3);
  }
}

uint64_t __82__SKUIMetricsController_performActionForItem_offer_clientContext_completionBlock___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) addFieldsFromPurchaseResponse:*(void *)(a1 + 40)];
  [*(id *)(a1 + 32) setTransactionIdentifier:*(void *)(a1 + 48)];
  id v2 = *(void **)(a1 + 56);
  uint64_t v3 = *(void *)(a1 + 32);

  return [v2 recordEvent:v3];
}

- (id)performActionForSoftwareItem:(id)a3 offer:(id)a4 clientContext:(id)a5 completionBlock:(id)a6
{
  id v10 = a6;
  id v11 = (objc_class *)MEMORY[0x1E4FA8250];
  id v12 = a5;
  id v13 = a4;
  id v14 = a3;
  id v15 = objc_alloc_init(v11);
  uint64_t v16 = [v14 itemIdentifier];
  id v17 = +[SKUIItemStateCenter defaultCenter];
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __90__SKUIMetricsController_performActionForSoftwareItem_offer_clientContext_completionBlock___block_invoke;
  v22[3] = &unk_1E642ADF0;
  id v23 = v15;
  v24 = self;
  id v25 = v10;
  uint64_t v26 = v16;
  id v18 = v10;
  id v19 = v15;
  v20 = [v17 performActionForSoftwareItem:v14 offer:v13 clientContext:v12 completionBlock:v22];

  return v20;
}

void __90__SKUIMetricsController_performActionForSoftwareItem_offer_clientContext_completionBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 transactionIdentifierForItemIdentifier:*(void *)(a1 + 56)];
  if (v4)
  {
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __90__SKUIMetricsController_performActionForSoftwareItem_offer_clientContext_completionBlock___block_invoke_2;
    v8[3] = &unk_1E6423618;
    id v9 = *(id *)(a1 + 32);
    id v10 = v3;
    id v5 = v4;
    uint64_t v6 = *(void *)(a1 + 40);
    id v11 = v5;
    uint64_t v12 = v6;
    dispatch_async(MEMORY[0x1E4F14428], v8);
  }
  uint64_t v7 = *(void *)(a1 + 48);
  if (v7) {
    (*(void (**)(uint64_t, id))(v7 + 16))(v7, v3);
  }
}

uint64_t __90__SKUIMetricsController_performActionForSoftwareItem_offer_clientContext_completionBlock___block_invoke_2(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = [*(id *)(a1 + 40) responseMetrics];
  [v2 addPropertiesWithDictionary:v3];

  [*(id *)(a1 + 40) requestStartTime];
  if (v4 > 2.22044605e-16) {
    objc_msgSend(*(id *)(a1 + 32), "setRequestStartTime:");
  }
  [*(id *)(a1 + 40) responseEndTime];
  if (v5 > 2.22044605e-16) {
    objc_msgSend(*(id *)(a1 + 32), "setResponseEndTime:");
  }
  [*(id *)(a1 + 40) responseStartTime];
  if (v6 > 2.22044605e-16) {
    objc_msgSend(*(id *)(a1 + 32), "setResponseStartTime:");
  }
  [*(id *)(a1 + 32) setTransactionIdentifier:*(void *)(a1 + 48)];
  uint64_t v7 = *(void **)(a1 + 56);
  uint64_t v8 = *(void *)(a1 + 32);

  return [v7 recordEvent:v8];
}

- (void)pingURLs:(id)a3
{
}

- (void)pingURLs:(id)a3 withClientContext:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  if ([v5 count])
  {
    if (!pingURLs_withClientContext__sPingQueue)
    {
      id v7 = objc_alloc_init(MEMORY[0x1E4F28F08]);
      uint64_t v8 = (void *)pingURLs_withClientContext__sPingQueue;
      pingURLs_withClientContext__sPingQueue = (uint64_t)v7;

      [(id)pingURLs_withClientContext__sPingQueue setMaxConcurrentOperationCount:1];
      [(id)pingURLs_withClientContext__sPingQueue setName:@"com.apple.StoreServices.SKUIMetricsController.ping"];
    }
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id obj = v5;
    uint64_t v9 = [obj countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v18;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v18 != v11) {
            objc_enumerationMutation(obj);
          }
          id v13 = (void *)[objc_alloc(MEMORY[0x1E4F18D50]) initWithURL:*(void *)(*((void *)&v17 + 1) + 8 * i) cachePolicy:1 timeoutInterval:20.0];
          id v14 = (void *)[objc_alloc(MEMORY[0x1E4FA8338]) initWithURLRequest:v13];
          [v14 setQueuePriority:-8];
          [v14 setRecordsMetrics:0];
          id v15 = [v6 valueForConfigurationKey:@"sfsuffix"];
          [v14 setStoreFrontSuffix:v15];

          [(id)pingURLs_withClientContext__sPingQueue addOperation:v14];
        }
        uint64_t v10 = [obj countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v10);
    }
  }
}

- (void)recordBuyConfirmedEventsForItems:(id)a3 purchaseResponses:(id)a4
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id obj = a3;
  id v21 = a4;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  uint64_t v5 = [obj countByEnumeratingWithState:&v26 objects:v31 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v27;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v27 != v7) {
          objc_enumerationMutation(obj);
        }
        uint64_t v9 = *(void **)(*((void *)&v26 + 1) + 8 * v8);
        long long v22 = 0u;
        long long v23 = 0u;
        long long v24 = 0u;
        long long v25 = 0u;
        id v10 = v21;
        uint64_t v11 = [v10 countByEnumeratingWithState:&v22 objects:v30 count:16];
        if (v11)
        {
          uint64_t v12 = v11;
          uint64_t v13 = *(void *)v23;
LABEL_8:
          uint64_t v14 = 0;
          while (1)
          {
            if (*(void *)v23 != v13) {
              objc_enumerationMutation(v10);
            }
            id v15 = *(void **)(*((void *)&v22 + 1) + 8 * v14);
            uint64_t v16 = objc_msgSend(v15, "transactionIdentifierForItemIdentifier:", objc_msgSend(v9, "itemIdentifier"));
            if (v16) {
              break;
            }
            if (v12 == ++v14)
            {
              uint64_t v12 = [v10 countByEnumeratingWithState:&v22 objects:v30 count:16];
              if (v12) {
                goto LABEL_8;
              }
              goto LABEL_14;
            }
          }
          long long v18 = (void *)v16;
          id v17 = v15;

          if (!v17) {
            goto LABEL_18;
          }
          id v10 = objc_alloc_init(MEMORY[0x1E4FA8250]);
          [v10 addFieldsFromPurchaseResponse:v17];
          [v10 setTransactionIdentifier:v18];
          [(SKUIMetricsController *)self recordEvent:v10];
        }
        else
        {
LABEL_14:
          id v17 = 0;
          long long v18 = 0;
        }

LABEL_18:
        ++v8;
      }
      while (v8 != v6);
      uint64_t v6 = [obj countByEnumeratingWithState:&v26 objects:v31 count:16];
    }
    while (v6);
  }
}

- (void)recordEvent:(id)a3
{
  [(SKUIMetricsController *)self _insertEvent:a3];
  if (self->_flushesImmediately)
  {
    [(SKUIMetricsController *)self flushImmediately];
  }
}

- (void)setPageConfiguration:(id)a3
{
  uint64_t v7 = (SSMetricsConfiguration *)a3;
  if (self->_pageConfiguration != v7)
  {
    objc_storeStrong((id *)&self->_pageConfiguration, a3);
    [(SSMetricsController *)self->_controller setPageConfiguration:v7];
    [(SSMetricsConfiguration *)self->_globalConfiguration reportingFrequency];
    self->_flushesImmediately = v5 == 0.0;
    self->_impressionsEnabled = [(SKUIMetricsController *)self canRecordEventWithType:*MEMORY[0x1E4FA8880]];
    uint64_t v6 = +[SKUIMetricsFlushTimer sharedTimer];
    [v6 reloadFlushInterval];
  }
}

- (id)tokenStringWithElements:(id)a3
{
  return (id)[(SSMetricsConfiguration *)self->_globalConfiguration tokenStringWithElements:a3];
}

- (void)_waitUntilRecordingComplete
{
  id v2 = [(SSMetricsController *)self->_controller serialQueue];
  dispatch_sync(v2, &__block_literal_global_66);
}

- (void)_insertEvent:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (self->_loggingEnabled)
  {
    double v5 = [MEMORY[0x1E4FA81D8] sharedConfig];
    int v6 = [v5 shouldLog];
    if ([v5 shouldLogToDisk]) {
      int v7 = v6 | 2;
    }
    else {
      int v7 = v6;
    }
    uint64_t v8 = [v5 OSLogObject];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO)) {
      int v9 = v7;
    }
    else {
      int v9 = v7 & 2;
    }
    if (v9)
    {
      int v18 = 138412290;
      id v19 = v4;
      LODWORD(v17) = 12;
      uint64_t v16 = &v18;
      id v10 = (void *)_os_log_send_and_compose_impl();

      if (!v10)
      {
LABEL_12:

        goto LABEL_13;
      }
      uint64_t v8 = objc_msgSend(NSString, "stringWithCString:encoding:", v10, 4, &v18, v17);
      free(v10);
      uint64_t v16 = (int *)v8;
      SSFileLog();
    }

    goto LABEL_12;
  }
LABEL_13:
  uint64_t v11 = [(SKUIMetricsController *)self accountIdentifier];
  [v4 setAccountIdentifier:v11];

  [v4 setApplicationIdentifier:self->_applicationIdentifier];
  uint64_t v12 = [MEMORY[0x1E4FB8820] sharedInstance];
  [v12 networkType];
  uint64_t v13 = SSGetStringForNetworkType();
  [v4 setConnection:v13];

  [v4 setHostApplicationIdentifier:self->_hostApplicationIdentifier];
  [v4 setPageContext:self->_pageContext];
  uint64_t v14 = [v4 topic];
  uint64_t v15 = [v14 length];

  if (!v15) {
    [v4 setTopic:self->_topic];
  }
  [v4 setUserAgent:self->_userAgent];
  [v4 setWindowOrientation:self->_windowOrientation];
  if (self->_pageURL) {
    objc_msgSend(v4, "setPageURL:");
  }
  [(SSMetricsController *)self->_controller insertEvent:v4 withCompletionHandler:0];
}

- (void)_recordActiveImpressions
{
  activeImpressionsSession = self->_activeImpressionsSession;
  if (activeImpressionsSession)
  {
    id v4 = [(SKUIMetricsImpressionSession *)activeImpressionsSession impressionIdentifiers];
    if ([v4 count])
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4FA8238]);
      [v5 setImpressionIdentifiers:v4];
      [(SKUIMetricsController *)self _insertEvent:v5];
    }
    int v6 = self->_activeImpressionsSession;
    self->_activeImpressionsSession = 0;
  }
  impressionsTimer = self->_impressionsTimer;
  if (impressionsTimer)
  {
    dispatch_source_cancel(impressionsTimer);
    uint64_t v8 = self->_impressionsTimer;
    self->_impressionsTimer = 0;
  }
}

- (NSString)applicationIdentifier
{
  return self->_applicationIdentifier;
}

- (void)setApplicationIdentifier:(id)a3
{
}

- (SSMetricsConfiguration)globalConfiguration
{
  return self->_globalConfiguration;
}

- (NSString)hostApplicationIdentifier
{
  return self->_hostApplicationIdentifier;
}

- (void)setHostApplicationIdentifier:(id)a3
{
}

- (SSMetricsConfiguration)pageConfiguration
{
  return self->_pageConfiguration;
}

- (NSString)pageContext
{
  return self->_pageContext;
}

- (void)setPageContext:(id)a3
{
}

- (NSString)pageURL
{
  return self->_pageURL;
}

- (void)setPageURL:(id)a3
{
}

- (NSString)topic
{
  return self->_topic;
}

- (void)setTopic:(id)a3
{
}

- (NSString)userAgent
{
  return self->_userAgent;
}

- (void)setUserAgent:(id)a3
{
}

- (NSString)windowOrientation
{
  return self->_windowOrientation;
}

- (void)setWindowOrientation:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_windowOrientation, 0);
  objc_storeStrong((id *)&self->_userAgent, 0);
  objc_storeStrong((id *)&self->_topic, 0);
  objc_storeStrong((id *)&self->_pageURL, 0);
  objc_storeStrong((id *)&self->_pageContext, 0);
  objc_storeStrong((id *)&self->_pageConfiguration, 0);
  objc_storeStrong((id *)&self->_impressionsTimer, 0);
  objc_storeStrong((id *)&self->_hostApplicationIdentifier, 0);
  objc_storeStrong((id *)&self->_globalConfiguration, 0);
  objc_storeStrong((id *)&self->_controller, 0);
  objc_storeStrong((id *)&self->_applicationIdentifier, 0);

  objc_storeStrong((id *)&self->_activeImpressionsSession, 0);
}

- (void)initWithGlobalConfiguration:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  v1 = "-[SKUIMetricsController initWithGlobalConfiguration:]";
}

@end