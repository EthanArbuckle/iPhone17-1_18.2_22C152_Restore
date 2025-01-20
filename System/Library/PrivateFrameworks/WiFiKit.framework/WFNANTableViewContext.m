@interface WFNANTableViewContext
- (NSMutableArray)publishers;
- (NSMutableArray)subscribers;
- (NSMutableDictionary)dataSessionsForPublish;
- (NSMutableDictionary)dataSessionsForSubscribe;
- (NSMutableDictionary)discoveryResults;
- (WFNANTableViewContext)init;
- (id)getDataSessionAtIndex:(int64_t)a3 forPublisher:(id)a4;
- (id)getDataSessionAtIndex:(int64_t)a3 forSubscriber:(id)a4;
- (id)getDataSessionsForPublisher:(id)a3;
- (id)getDataSessionsForSubscriber:(id)a3;
- (id)getDiscoveryResultAtIndex:(int64_t)a3 forSubscriber:(id)a4;
- (id)getDiscoveryResultsForSubscriber:(id)a3;
- (id)getPublisherAtIndex:(int64_t)a3;
- (id)getPublishers;
- (id)getSubscriberAtIndex:(int64_t)a3;
- (id)getSubscribers;
- (int64_t)getDataSessionsCountForPublisher:(id)a3;
- (int64_t)getDataSessionsCountForSubscriber:(id)a3;
- (int64_t)getDiscoveryResultsCountForSubscriber:(id)a3;
- (int64_t)getPublishersCount;
- (int64_t)getSubscribersCount;
- (void)addDataSession:(id)a3 forPublisher:(id)a4;
- (void)addDataSession:(id)a3 forSubscriber:(id)a4;
- (void)addDiscoveryResult:(id)a3 forSubscriber:(id)a4;
- (void)addPublisher:(id)a3;
- (void)addSubscriber:(id)a3;
- (void)publisher:(id)a3 dataConfirmedForHandle:(id)a4 localInterfaceIndex:(unsigned int)a5 serviceSpecificInfo:(id)a6;
- (void)publisher:(id)a3 dataTerminatedForHandle:(id)a4 reason:(int64_t)a5;
- (void)publisher:(id)a3 failedToStartWithError:(int64_t)a4;
- (void)publisher:(id)a3 terminatedWithReason:(int64_t)a4;
- (void)publisherStarted:(id)a3;
- (void)removeDataSession:(id)a3 forPublisher:(id)a4;
- (void)removeDataSession:(id)a3 forSubscriber:(id)a4;
- (void)removeDiscoveryResultWithPublishID:(unsigned __int8)a3 andPublisherAddress:(id)a4 forSubscriber:(id)a5;
- (void)removePublisher:(id)a3;
- (void)removePublisherAtIndex:(int64_t)a3;
- (void)removeSubscriber:(id)a3;
- (void)removeSubscriberAtIndex:(int64_t)a3;
- (void)setDataSessionsForPublish:(id)a3;
- (void)setDataSessionsForSubscribe:(id)a3;
- (void)setDiscoveryResults:(id)a3;
- (void)setPublishers:(id)a3;
- (void)setSubscribers:(id)a3;
- (void)subscriber:(id)a3 failedToStartWithError:(int64_t)a4;
- (void)subscriber:(id)a3 lostDiscoveryResultForPublishID:(unsigned __int8)a4 address:(id)a5;
- (void)subscriber:(id)a3 receivedDiscoveyResult:(id)a4;
- (void)subscriber:(id)a3 terminatedWithReason:(int64_t)a4;
- (void)subscriberStarted:(id)a3;
@end

@implementation WFNANTableViewContext

- (WFNANTableViewContext)init
{
  v14.receiver = self;
  v14.super_class = (Class)WFNANTableViewContext;
  v2 = [(WFNANTableViewContext *)&v14 init];
  uint64_t v3 = [MEMORY[0x263EFF980] array];
  publishers = v2->_publishers;
  v2->_publishers = (NSMutableArray *)v3;

  uint64_t v5 = [MEMORY[0x263EFF9A0] dictionary];
  dataSessionsForPublish = v2->_dataSessionsForPublish;
  v2->_dataSessionsForPublish = (NSMutableDictionary *)v5;

  uint64_t v7 = [MEMORY[0x263EFF980] array];
  subscribers = v2->_subscribers;
  v2->_subscribers = (NSMutableArray *)v7;

  uint64_t v9 = [MEMORY[0x263EFF9A0] dictionary];
  discoveryResults = v2->_discoveryResults;
  v2->_discoveryResults = (NSMutableDictionary *)v9;

  uint64_t v11 = [MEMORY[0x263EFF9A0] dictionary];
  dataSessionsForSubscribe = v2->_dataSessionsForSubscribe;
  v2->_dataSessionsForSubscribe = (NSMutableDictionary *)v11;

  return v2;
}

- (void)addPublisher:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v4 = a3;
  [v4 start];
  [(NSMutableArray *)self->_publishers addObject:v4];
  uint64_t v5 = WFLogForCategory(0);
  os_log_type_t v6 = OSLogForWFLogLevel(3uLL);
  if ((unint64_t)WFCurrentLogLevel() >= 3 && v5)
  {
    uint64_t v7 = v5;
    if (os_log_type_enabled(v7, v6))
    {
      uint64_t v8 = [(NSMutableArray *)self->_publishers count];
      *(_DWORD *)buf = 134217984;
      uint64_t v13 = v8;
      _os_log_impl(&dword_226071000, v7, v6, "Added new publisher, new count is %lu", buf, 0xCu);
    }
  }
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __38__WFNANTableViewContext_addPublisher___block_invoke;
  block[3] = &unk_26478E528;
  id v11 = v4;
  id v9 = v4;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __38__WFNANTableViewContext_addPublisher___block_invoke(uint64_t a1)
{
  v6[2] = *MEMORY[0x263EF8340];
  v5[0] = @"WFNANTableViewContextChangedOperationTypeKey";
  v2 = [NSNumber numberWithUnsignedInteger:0];
  v5[1] = @"WFNANTableViewContextChangedPublisherKey";
  v6[0] = v2;
  v6[1] = *(void *)(a1 + 32);
  uint64_t v3 = [NSDictionary dictionaryWithObjects:v6 forKeys:v5 count:2];

  id v4 = [MEMORY[0x263F08A00] defaultCenter];
  [v4 postNotificationName:@"WFNANPublishersChangedNotification" object:0 userInfo:v3];
}

- (void)addSubscriber:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v4 = a3;
  [v4 start];
  [(NSMutableArray *)self->_subscribers addObject:v4];
  uint64_t v5 = WFLogForCategory(0);
  os_log_type_t v6 = OSLogForWFLogLevel(3uLL);
  if ((unint64_t)WFCurrentLogLevel() >= 3 && v5)
  {
    uint64_t v7 = v5;
    if (os_log_type_enabled(v7, v6))
    {
      uint64_t v8 = [(NSMutableArray *)self->_subscribers count];
      *(_DWORD *)buf = 134217984;
      uint64_t v13 = v8;
      _os_log_impl(&dword_226071000, v7, v6, "Added new subcriber, new count is %lu", buf, 0xCu);
    }
  }
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __39__WFNANTableViewContext_addSubscriber___block_invoke;
  block[3] = &unk_26478E528;
  id v11 = v4;
  id v9 = v4;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __39__WFNANTableViewContext_addSubscriber___block_invoke(uint64_t a1)
{
  v6[2] = *MEMORY[0x263EF8340];
  v5[0] = @"WFNANTableViewContextChangedOperationTypeKey";
  v2 = [NSNumber numberWithUnsignedInteger:0];
  v5[1] = @"WFNANTableViewContextChangedSubscriberKey";
  v6[0] = v2;
  v6[1] = *(void *)(a1 + 32);
  uint64_t v3 = [NSDictionary dictionaryWithObjects:v6 forKeys:v5 count:2];

  id v4 = [MEMORY[0x263F08A00] defaultCenter];
  [v4 postNotificationName:@"WFNANSubscribersChangedNotification" object:0 userInfo:v3];
}

- (void)addDiscoveryResult:(id)a3 forSubscriber:(id)a4
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  discoveryResults = self->_discoveryResults;
  id v9 = [v7 configuration];
  v10 = [(NSMutableDictionary *)discoveryResults objectForKey:v9];

  if (!v10)
  {
    v10 = [MEMORY[0x263EFF980] array];
  }
  [v10 addObject:v6];
  id v11 = self->_discoveryResults;
  v12 = [v7 configuration];
  [(NSMutableDictionary *)v11 setObject:v10 forKey:v12];

  uint64_t v13 = WFLogForCategory(0);
  os_log_type_t v14 = OSLogForWFLogLevel(3uLL);
  if ((unint64_t)WFCurrentLogLevel() >= 3 && v13)
  {
    v15 = v13;
    if (os_log_type_enabled(v15, v14))
    {
      v16 = [v7 configuration];
      v17 = [v16 serviceName];
      *(_DWORD *)buf = 138412546;
      v24 = v17;
      __int16 v25 = 2048;
      uint64_t v26 = [v10 count];
      _os_log_impl(&dword_226071000, v15, v14, "Added new discovery result for subscriber %@, new count is %lu", buf, 0x16u);
    }
  }

  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __58__WFNANTableViewContext_addDiscoveryResult_forSubscriber___block_invoke;
  v20[3] = &unk_26478E7D8;
  id v21 = v7;
  id v22 = v6;
  id v18 = v6;
  id v19 = v7;
  dispatch_async(MEMORY[0x263EF83A0], v20);
}

void __58__WFNANTableViewContext_addDiscoveryResult_forSubscriber___block_invoke(uint64_t a1)
{
  v8[3] = *MEMORY[0x263EF8340];
  v7[0] = @"WFNANTableViewContextChangedOperationTypeKey";
  v2 = [NSNumber numberWithUnsignedInteger:0];
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  v8[0] = v2;
  v8[1] = v3;
  v7[1] = @"WFNANTableViewContextChangedSubscriberKey";
  v7[2] = @"WFNANTableViewContextChangedDiscoveryResultKey";
  v8[2] = v4;
  uint64_t v5 = [NSDictionary dictionaryWithObjects:v8 forKeys:v7 count:3];

  id v6 = [MEMORY[0x263F08A00] defaultCenter];
  [v6 postNotificationName:@"WFNANDiscoveryResultsChangedNotification" object:0 userInfo:v5];
}

- (void)addDataSession:(id)a3 forPublisher:(id)a4
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  dataSessionsForPublish = self->_dataSessionsForPublish;
  id v9 = [v7 configuration];
  v10 = [(NSMutableDictionary *)dataSessionsForPublish objectForKey:v9];

  if (!v10)
  {
    v10 = [MEMORY[0x263EFF980] array];
  }
  [v10 addObject:v6];
  id v11 = self->_dataSessionsForPublish;
  v12 = [v7 configuration];
  [(NSMutableDictionary *)v11 setObject:v10 forKey:v12];

  uint64_t v13 = WFLogForCategory(0);
  os_log_type_t v14 = OSLogForWFLogLevel(3uLL);
  if ((unint64_t)WFCurrentLogLevel() >= 3 && v13)
  {
    v15 = v13;
    if (os_log_type_enabled(v15, v14))
    {
      v16 = [v7 configuration];
      v17 = [v16 serviceName];
      *(_DWORD *)buf = 138412546;
      v24 = v17;
      __int16 v25 = 2048;
      uint64_t v26 = [v10 count];
      _os_log_impl(&dword_226071000, v15, v14, "Added new data session for publisher %@, new count is %lu", buf, 0x16u);
    }
  }

  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __53__WFNANTableViewContext_addDataSession_forPublisher___block_invoke;
  v20[3] = &unk_26478E7D8;
  id v21 = v7;
  id v22 = v6;
  id v18 = v6;
  id v19 = v7;
  dispatch_async(MEMORY[0x263EF83A0], v20);
}

void __53__WFNANTableViewContext_addDataSession_forPublisher___block_invoke(uint64_t a1)
{
  v8[3] = *MEMORY[0x263EF8340];
  v7[0] = @"WFNANTableViewContextChangedOperationTypeKey";
  v2 = [NSNumber numberWithUnsignedInteger:0];
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  v8[0] = v2;
  v8[1] = v3;
  v7[1] = @"WFNANTableViewContextChangedPublisherKey";
  v7[2] = @"WFNANTableViewContextChangedDataSessionKey";
  v8[2] = v4;
  uint64_t v5 = [NSDictionary dictionaryWithObjects:v8 forKeys:v7 count:3];

  id v6 = [MEMORY[0x263F08A00] defaultCenter];
  [v6 postNotificationName:@"WFNANDataSessionsForPublishChangedNotification" object:0 userInfo:v5];
}

- (void)addDataSession:(id)a3 forSubscriber:(id)a4
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  dataSessionsForSubscribe = self->_dataSessionsForSubscribe;
  id v9 = [v7 configuration];
  v10 = [(NSMutableDictionary *)dataSessionsForSubscribe objectForKey:v9];

  if (!v10)
  {
    v10 = [MEMORY[0x263EFF980] array];
  }
  [v10 addObject:v6];
  id v11 = self->_dataSessionsForSubscribe;
  v12 = [v7 configuration];
  [(NSMutableDictionary *)v11 setObject:v10 forKey:v12];

  uint64_t v13 = WFLogForCategory(0);
  os_log_type_t v14 = OSLogForWFLogLevel(3uLL);
  if ((unint64_t)WFCurrentLogLevel() >= 3 && v13)
  {
    v15 = v13;
    if (os_log_type_enabled(v15, v14))
    {
      v16 = [v7 configuration];
      v17 = [v16 serviceName];
      *(_DWORD *)buf = 138412546;
      v24 = v17;
      __int16 v25 = 2048;
      uint64_t v26 = [v10 count];
      _os_log_impl(&dword_226071000, v15, v14, "Added new data session for subscriber %@, new count is %lu", buf, 0x16u);
    }
  }

  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __54__WFNANTableViewContext_addDataSession_forSubscriber___block_invoke;
  v20[3] = &unk_26478E7D8;
  id v21 = v7;
  id v22 = v6;
  id v18 = v6;
  id v19 = v7;
  dispatch_async(MEMORY[0x263EF83A0], v20);
}

void __54__WFNANTableViewContext_addDataSession_forSubscriber___block_invoke(uint64_t a1)
{
  v8[3] = *MEMORY[0x263EF8340];
  v7[0] = @"WFNANTableViewContextChangedOperationTypeKey";
  v2 = [NSNumber numberWithUnsignedInteger:0];
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  v8[0] = v2;
  v8[1] = v3;
  v7[1] = @"WFNANTableViewContextChangedSubscriberKey";
  v7[2] = @"WFNANTableViewContextChangedDataSessionKey";
  v8[2] = v4;
  uint64_t v5 = [NSDictionary dictionaryWithObjects:v8 forKeys:v7 count:3];

  id v6 = [MEMORY[0x263F08A00] defaultCenter];
  [v6 postNotificationName:@"WFNANDataSessionsForSubscribeChangedNotification" object:0 userInfo:v5];
}

- (void)removePublisherAtIndex:(int64_t)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  uint64_t v5 = -[WFNANTableViewContext getPublisherAtIndex:](self, "getPublisherAtIndex:");
  [v5 stop];
  [(NSMutableArray *)self->_publishers removeObjectAtIndex:a3];
  id v6 = WFLogForCategory(0);
  os_log_type_t v7 = OSLogForWFLogLevel(3uLL);
  if ((unint64_t)WFCurrentLogLevel() >= 3 && v6)
  {
    uint64_t v8 = v6;
    if (os_log_type_enabled(v8, v7))
    {
      uint64_t v9 = [(NSMutableArray *)self->_publishers count];
      *(_DWORD *)buf = 134218240;
      int64_t v14 = a3;
      __int16 v15 = 2048;
      uint64_t v16 = v9;
      _os_log_impl(&dword_226071000, v8, v7, "Removed publisher at index %ld, new count is %lu", buf, 0x16u);
    }
  }
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __48__WFNANTableViewContext_removePublisherAtIndex___block_invoke;
  block[3] = &unk_26478E528;
  id v12 = v5;
  id v10 = v5;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __48__WFNANTableViewContext_removePublisherAtIndex___block_invoke(uint64_t a1)
{
  v6[2] = *MEMORY[0x263EF8340];
  v5[0] = @"WFNANTableViewContextChangedOperationTypeKey";
  v2 = [NSNumber numberWithUnsignedInteger:1];
  v5[1] = @"WFNANTableViewContextChangedPublisherKey";
  v6[0] = v2;
  v6[1] = *(void *)(a1 + 32);
  uint64_t v3 = [NSDictionary dictionaryWithObjects:v6 forKeys:v5 count:2];

  uint64_t v4 = [MEMORY[0x263F08A00] defaultCenter];
  [v4 postNotificationName:@"WFNANPublishersChangedNotification" object:0 userInfo:v3];
}

- (void)removePublisher:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if ([(NSMutableArray *)self->_publishers count])
  {
    uint64_t v5 = 0;
    while (1)
    {
      id v6 = [(NSMutableArray *)self->_publishers objectAtIndex:v5];
      if ([v6 isEqual:v4]) {
        break;
      }

      if ((unint64_t)++v5 >= [(NSMutableArray *)self->_publishers count]) {
        goto LABEL_5;
      }
    }
    [v4 stop];
    [(NSMutableArray *)self->_publishers removeObjectAtIndex:v5];
    uint64_t v8 = WFLogForCategory(0);
    os_log_type_t v9 = OSLogForWFLogLevel(3uLL);
    if ((unint64_t)WFCurrentLogLevel() >= 3 && v8)
    {
      id v10 = v8;
      if (os_log_type_enabled(v10, v9))
      {
        uint64_t v11 = [(NSMutableArray *)self->_publishers count];
        *(_DWORD *)buf = 134218240;
        __int16 v15 = v5;
        __int16 v16 = 2048;
        uint64_t v17 = v11;
        _os_log_impl(&dword_226071000, v10, v9, "Removed publisher at index %ld, new count is %lu", buf, 0x16u);
      }
    }
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __41__WFNANTableViewContext_removePublisher___block_invoke;
    block[3] = &unk_26478E528;
    id v13 = v4;
    dispatch_async(MEMORY[0x263EF83A0], block);
  }
  else
  {
LABEL_5:
    id v6 = WFLogForCategory(0);
    os_log_type_t v7 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v6 && os_log_type_enabled(v6, v7))
    {
      *(_DWORD *)buf = 138412290;
      __int16 v15 = (char *)v4;
      _os_log_impl(&dword_226071000, v6, v7, "Publisher %@ does not exist", buf, 0xCu);
    }
  }
}

void __41__WFNANTableViewContext_removePublisher___block_invoke(uint64_t a1)
{
  v6[2] = *MEMORY[0x263EF8340];
  v5[0] = @"WFNANTableViewContextChangedOperationTypeKey";
  v2 = [NSNumber numberWithUnsignedInteger:1];
  v5[1] = @"WFNANTableViewContextChangedPublisherKey";
  v6[0] = v2;
  v6[1] = *(void *)(a1 + 32);
  uint64_t v3 = [NSDictionary dictionaryWithObjects:v6 forKeys:v5 count:2];

  id v4 = [MEMORY[0x263F08A00] defaultCenter];
  [v4 postNotificationName:@"WFNANPublishersChangedNotification" object:0 userInfo:v3];
}

- (void)removeSubscriberAtIndex:(int64_t)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  uint64_t v5 = -[WFNANTableViewContext getSubscriberAtIndex:](self, "getSubscriberAtIndex:");
  [v5 stop];
  [(NSMutableArray *)self->_subscribers removeObjectAtIndex:a3];
  id v6 = WFLogForCategory(0);
  os_log_type_t v7 = OSLogForWFLogLevel(3uLL);
  if ((unint64_t)WFCurrentLogLevel() >= 3 && v6)
  {
    uint64_t v8 = v6;
    if (os_log_type_enabled(v8, v7))
    {
      uint64_t v9 = [(NSMutableArray *)self->_subscribers count];
      *(_DWORD *)buf = 134218240;
      int64_t v14 = a3;
      __int16 v15 = 2048;
      uint64_t v16 = v9;
      _os_log_impl(&dword_226071000, v8, v7, "Removed subscriber at index %ld, new count is %lu", buf, 0x16u);
    }
  }
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __49__WFNANTableViewContext_removeSubscriberAtIndex___block_invoke;
  block[3] = &unk_26478E528;
  id v12 = v5;
  id v10 = v5;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __49__WFNANTableViewContext_removeSubscriberAtIndex___block_invoke(uint64_t a1)
{
  v6[2] = *MEMORY[0x263EF8340];
  v5[0] = @"WFNANTableViewContextChangedOperationTypeKey";
  v2 = [NSNumber numberWithUnsignedInteger:1];
  v5[1] = @"WFNANTableViewContextChangedSubscriberKey";
  v6[0] = v2;
  v6[1] = *(void *)(a1 + 32);
  uint64_t v3 = [NSDictionary dictionaryWithObjects:v6 forKeys:v5 count:2];

  id v4 = [MEMORY[0x263F08A00] defaultCenter];
  [v4 postNotificationName:@"WFNANSubscribersChangedNotification" object:0 userInfo:v3];
}

- (void)removeSubscriber:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if ([(NSMutableArray *)self->_subscribers count])
  {
    uint64_t v5 = 0;
    while (1)
    {
      id v6 = [(NSMutableArray *)self->_subscribers objectAtIndex:v5];
      if ([v6 isEqual:v4]) {
        break;
      }

      if ((unint64_t)++v5 >= [(NSMutableArray *)self->_subscribers count]) {
        goto LABEL_5;
      }
    }
    [v4 stop];
    [(NSMutableArray *)self->_subscribers removeObjectAtIndex:v5];
    uint64_t v8 = WFLogForCategory(0);
    os_log_type_t v9 = OSLogForWFLogLevel(3uLL);
    if ((unint64_t)WFCurrentLogLevel() >= 3 && v8)
    {
      id v10 = v8;
      if (os_log_type_enabled(v10, v9))
      {
        uint64_t v11 = [(NSMutableArray *)self->_subscribers count];
        *(_DWORD *)buf = 134218240;
        __int16 v15 = v5;
        __int16 v16 = 2048;
        uint64_t v17 = v11;
        _os_log_impl(&dword_226071000, v10, v9, "Removed subscriber at index %ld, new count is %lu", buf, 0x16u);
      }
    }
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __42__WFNANTableViewContext_removeSubscriber___block_invoke;
    block[3] = &unk_26478E528;
    id v13 = v4;
    dispatch_async(MEMORY[0x263EF83A0], block);
  }
  else
  {
LABEL_5:
    id v6 = WFLogForCategory(0);
    os_log_type_t v7 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v6 && os_log_type_enabled(v6, v7))
    {
      *(_DWORD *)buf = 138412290;
      __int16 v15 = (char *)v4;
      _os_log_impl(&dword_226071000, v6, v7, "Subscriber %@ does not exist", buf, 0xCu);
    }
  }
}

void __42__WFNANTableViewContext_removeSubscriber___block_invoke(uint64_t a1)
{
  v6[2] = *MEMORY[0x263EF8340];
  v5[0] = @"WFNANTableViewContextChangedOperationTypeKey";
  v2 = [NSNumber numberWithUnsignedInteger:1];
  v5[1] = @"WFNANTableViewContextChangedSubscriberKey";
  v6[0] = v2;
  v6[1] = *(void *)(a1 + 32);
  uint64_t v3 = [NSDictionary dictionaryWithObjects:v6 forKeys:v5 count:2];

  id v4 = [MEMORY[0x263F08A00] defaultCenter];
  [v4 postNotificationName:@"WFNANSubscribersChangedNotification" object:0 userInfo:v3];
}

- (void)removeDiscoveryResultWithPublishID:(unsigned __int8)a3 andPublisherAddress:(id)a4 forSubscriber:(id)a5
{
  int v6 = a3;
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v8 = a4;
  id v9 = a5;
  discoveryResults = self->_discoveryResults;
  uint64_t v11 = [v9 configuration];
  id v12 = [(NSMutableDictionary *)discoveryResults objectForKey:v11];

  if ([v12 count])
  {
    uint64_t v13 = 0;
    while (1)
    {
      int64_t v14 = [v12 objectAtIndex:v13];
      if ([v14 publishID] == v6)
      {
        __int16 v15 = [v14 publisherAddress];
        int v16 = [v15 isEqual:v8];

        if (v16) {
          break;
        }
      }

      if (++v13 >= (unint64_t)[v12 count]) {
        goto LABEL_6;
      }
    }
    [v12 removeObjectAtIndex:v13];
    v23 = self->_discoveryResults;
    v24 = [v9 configuration];
    [(NSMutableDictionary *)v23 setObject:v12 forKey:v24];

    __int16 v25 = WFLogForCategory(0);
    os_log_type_t v26 = OSLogForWFLogLevel(3uLL);
    if ((unint64_t)WFCurrentLogLevel() >= 3 && v25)
    {
      uint64_t v27 = v25;
      if (os_log_type_enabled(v27, v26))
      {
        v28 = [v9 configuration];
        v29 = [v28 serviceName];
        *(_DWORD *)buf = 138412546;
        *(void *)v34 = v29;
        *(_WORD *)&v34[8] = 2048;
        *(void *)&v34[10] = [v12 count];
        _os_log_impl(&dword_226071000, v27, v26, "Removed discovery result for subcriber %@, new count is %lu", buf, 0x16u);
      }
    }

    v30[0] = MEMORY[0x263EF8330];
    v30[1] = 3221225472;
    v30[2] = __94__WFNANTableViewContext_removeDiscoveryResultWithPublishID_andPublisherAddress_forSubscriber___block_invoke;
    v30[3] = &unk_26478E7D8;
    v31 = v9;
    id v32 = v14;
    id v17 = v14;
    dispatch_async(MEMORY[0x263EF83A0], v30);

    id v19 = v31;
    goto LABEL_17;
  }
LABEL_6:
  WFLogForCategory(0);
  id v17 = (id)objc_claimAutoreleasedReturnValue();
  os_log_type_t v18 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel() && v17)
  {
    id v19 = v17;
    if (os_log_type_enabled(v19, v18))
    {
      v20 = [v8 description];
      id v21 = [v9 configuration];
      id v22 = [v21 serviceName];
      *(_DWORD *)buf = 67109634;
      *(_DWORD *)v34 = v6;
      *(_WORD *)&v34[4] = 2112;
      *(void *)&v34[6] = v20;
      *(_WORD *)&v34[14] = 2112;
      *(void *)&v34[16] = v22;
      _os_log_impl(&dword_226071000, v19, v18, "Discovery result with publish ID %hhu and address %@ does not exist for subscriber %@", buf, 0x1Cu);
    }
    id v17 = v19;
LABEL_17:
  }
}

void __94__WFNANTableViewContext_removeDiscoveryResultWithPublishID_andPublisherAddress_forSubscriber___block_invoke(uint64_t a1)
{
  v8[3] = *MEMORY[0x263EF8340];
  v7[0] = @"WFNANTableViewContextChangedOperationTypeKey";
  v2 = [NSNumber numberWithUnsignedInteger:1];
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  v8[0] = v2;
  v8[1] = v3;
  v7[1] = @"WFNANTableViewContextChangedSubscriberKey";
  v7[2] = @"WFNANTableViewContextChangedDiscoveryResultKey";
  v8[2] = v4;
  uint64_t v5 = [NSDictionary dictionaryWithObjects:v8 forKeys:v7 count:3];

  int v6 = [MEMORY[0x263F08A00] defaultCenter];
  [v6 postNotificationName:@"WFNANDiscoveryResultsChangedNotification" object:0 userInfo:v5];
}

- (void)removeDataSession:(id)a3 forPublisher:(id)a4
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  dataSessionsForPublish = self->_dataSessionsForPublish;
  id v9 = [v7 configuration];
  id v10 = [(NSMutableDictionary *)dataSessionsForPublish objectForKey:v9];

  if ([v10 count])
  {
    uint64_t v11 = 0;
    while (1)
    {
      id v12 = [v10 objectAtIndex:v11];
      if ([v12 isEqual:v6]) {
        break;
      }

      if (++v11 >= (unint64_t)[v10 count]) {
        goto LABEL_5;
      }
    }
    [v10 removeObjectAtIndex:v11];
    id v17 = self->_dataSessionsForPublish;
    os_log_type_t v18 = [v7 configuration];
    [(NSMutableDictionary *)v17 setObject:v10 forKey:v18];

    id v19 = WFLogForCategory(0);
    os_log_type_t v20 = OSLogForWFLogLevel(3uLL);
    if ((unint64_t)WFCurrentLogLevel() >= 3 && v19)
    {
      id v21 = v19;
      if (os_log_type_enabled(v21, v20))
      {
        id v22 = [v7 configuration];
        v23 = [v22 serviceName];
        *(_DWORD *)buf = 138412546;
        id v28 = v23;
        __int16 v29 = 2048;
        uint64_t v30 = [v10 count];
        _os_log_impl(&dword_226071000, v21, v20, "Removed data session for publisher %@, new count is %lu", buf, 0x16u);
      }
    }

    v24[0] = MEMORY[0x263EF8330];
    v24[1] = 3221225472;
    v24[2] = __56__WFNANTableViewContext_removeDataSession_forPublisher___block_invoke;
    v24[3] = &unk_26478E7D8;
    __int16 v25 = v7;
    id v26 = v6;
    dispatch_async(MEMORY[0x263EF83A0], v24);

    int64_t v14 = v25;
    goto LABEL_16;
  }
LABEL_5:
  id v12 = WFLogForCategory(0);
  os_log_type_t v13 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel() && v12)
  {
    int64_t v14 = v12;
    if (os_log_type_enabled(v14, v13))
    {
      __int16 v15 = [v7 configuration];
      int v16 = [v15 serviceName];
      *(_DWORD *)buf = 138412546;
      id v28 = v6;
      __int16 v29 = 2112;
      uint64_t v30 = (uint64_t)v16;
      _os_log_impl(&dword_226071000, v14, v13, "Data session %@ does not exist for publisher %@", buf, 0x16u);
    }
    id v12 = v14;
LABEL_16:
  }
}

void __56__WFNANTableViewContext_removeDataSession_forPublisher___block_invoke(uint64_t a1)
{
  v8[3] = *MEMORY[0x263EF8340];
  v7[0] = @"WFNANTableViewContextChangedOperationTypeKey";
  v2 = [NSNumber numberWithUnsignedInteger:1];
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  v8[0] = v2;
  v8[1] = v3;
  v7[1] = @"WFNANTableViewContextChangedPublisherKey";
  v7[2] = @"WFNANTableViewContextChangedDataSessionKey";
  v8[2] = v4;
  uint64_t v5 = [NSDictionary dictionaryWithObjects:v8 forKeys:v7 count:3];

  id v6 = [MEMORY[0x263F08A00] defaultCenter];
  [v6 postNotificationName:@"WFNANDataSessionsForPublishChangedNotification" object:0 userInfo:v5];
}

- (void)removeDataSession:(id)a3 forSubscriber:(id)a4
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  dataSessionsForSubscribe = self->_dataSessionsForSubscribe;
  id v9 = [v7 configuration];
  id v10 = [(NSMutableDictionary *)dataSessionsForSubscribe objectForKey:v9];

  if ([v10 count])
  {
    uint64_t v11 = 0;
    while (1)
    {
      id v12 = [v10 objectAtIndex:v11];
      if ([v12 isEqual:v6]) {
        break;
      }

      if (++v11 >= (unint64_t)[v10 count]) {
        goto LABEL_5;
      }
    }
    [v10 removeObjectAtIndex:v11];
    id v17 = self->_dataSessionsForSubscribe;
    os_log_type_t v18 = [v7 configuration];
    [(NSMutableDictionary *)v17 setObject:v10 forKey:v18];

    id v19 = WFLogForCategory(0);
    os_log_type_t v20 = OSLogForWFLogLevel(3uLL);
    if ((unint64_t)WFCurrentLogLevel() >= 3 && v19)
    {
      id v21 = v19;
      if (os_log_type_enabled(v21, v20))
      {
        id v22 = [v7 configuration];
        v23 = [v22 serviceName];
        *(_DWORD *)buf = 138412546;
        id v28 = v23;
        __int16 v29 = 2048;
        uint64_t v30 = [v10 count];
        _os_log_impl(&dword_226071000, v21, v20, "Removed data session for subscriber %@, new count is %lu", buf, 0x16u);
      }
    }

    v24[0] = MEMORY[0x263EF8330];
    v24[1] = 3221225472;
    v24[2] = __57__WFNANTableViewContext_removeDataSession_forSubscriber___block_invoke;
    v24[3] = &unk_26478E7D8;
    __int16 v25 = v7;
    id v26 = v6;
    dispatch_async(MEMORY[0x263EF83A0], v24);

    int64_t v14 = v25;
    goto LABEL_16;
  }
LABEL_5:
  id v12 = WFLogForCategory(0);
  os_log_type_t v13 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel() && v12)
  {
    int64_t v14 = v12;
    if (os_log_type_enabled(v14, v13))
    {
      __int16 v15 = [v7 configuration];
      int v16 = [v15 serviceName];
      *(_DWORD *)buf = 138412546;
      id v28 = v6;
      __int16 v29 = 2112;
      uint64_t v30 = (uint64_t)v16;
      _os_log_impl(&dword_226071000, v14, v13, "Data session %@ does not exist for subscriber %@", buf, 0x16u);
    }
    id v12 = v14;
LABEL_16:
  }
}

void __57__WFNANTableViewContext_removeDataSession_forSubscriber___block_invoke(uint64_t a1)
{
  v8[3] = *MEMORY[0x263EF8340];
  v7[0] = @"WFNANTableViewContextChangedOperationTypeKey";
  v2 = [NSNumber numberWithUnsignedInteger:1];
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  v8[0] = v2;
  v8[1] = v3;
  v7[1] = @"WFNANTableViewContextChangedSubscriberKey";
  v7[2] = @"WFNANTableViewContextChangedDataSessionKey";
  v8[2] = v4;
  uint64_t v5 = [NSDictionary dictionaryWithObjects:v8 forKeys:v7 count:3];

  id v6 = [MEMORY[0x263F08A00] defaultCenter];
  [v6 postNotificationName:@"WFNANDataSessionsForSubscribeChangedNotification" object:0 userInfo:v5];
}

- (id)getPublisherAtIndex:(int64_t)a3
{
  if ([(NSMutableArray *)self->_publishers count] <= (unint64_t)a3)
  {
    uint64_t v5 = 0;
  }
  else
  {
    uint64_t v5 = [(NSMutableArray *)self->_publishers objectAtIndex:a3];
  }
  return v5;
}

- (id)getSubscriberAtIndex:(int64_t)a3
{
  if ([(NSMutableArray *)self->_subscribers count] <= (unint64_t)a3)
  {
    uint64_t v5 = 0;
  }
  else
  {
    uint64_t v5 = [(NSMutableArray *)self->_subscribers objectAtIndex:a3];
  }
  return v5;
}

- (id)getDiscoveryResultAtIndex:(int64_t)a3 forSubscriber:(id)a4
{
  discoveryResults = self->_discoveryResults;
  id v6 = [a4 configuration];
  id v7 = [(NSMutableDictionary *)discoveryResults objectForKey:v6];

  if ([v7 count] <= (unint64_t)a3)
  {
    id v8 = 0;
  }
  else
  {
    id v8 = [v7 objectAtIndex:a3];
  }

  return v8;
}

- (id)getDataSessionAtIndex:(int64_t)a3 forPublisher:(id)a4
{
  dataSessionsForPublish = self->_dataSessionsForPublish;
  id v6 = [a4 configuration];
  id v7 = [(NSMutableDictionary *)dataSessionsForPublish objectForKey:v6];

  if ([v7 count] <= (unint64_t)a3)
  {
    id v8 = 0;
  }
  else
  {
    id v8 = [v7 objectAtIndex:a3];
  }

  return v8;
}

- (id)getDataSessionAtIndex:(int64_t)a3 forSubscriber:(id)a4
{
  dataSessionsForSubscribe = self->_dataSessionsForSubscribe;
  id v6 = [a4 configuration];
  id v7 = [(NSMutableDictionary *)dataSessionsForSubscribe objectForKey:v6];

  if ([v7 count] <= (unint64_t)a3)
  {
    id v8 = 0;
  }
  else
  {
    id v8 = [v7 objectAtIndex:a3];
  }

  return v8;
}

- (id)getPublishers
{
  return self->_publishers;
}

- (id)getSubscribers
{
  return self->_subscribers;
}

- (id)getDiscoveryResultsForSubscriber:(id)a3
{
  discoveryResults = self->_discoveryResults;
  uint64_t v4 = [a3 configuration];
  uint64_t v5 = [(NSMutableDictionary *)discoveryResults objectForKey:v4];

  return v5;
}

- (id)getDataSessionsForPublisher:(id)a3
{
  dataSessionsForPublish = self->_dataSessionsForPublish;
  uint64_t v4 = [a3 configuration];
  uint64_t v5 = [(NSMutableDictionary *)dataSessionsForPublish objectForKey:v4];

  return v5;
}

- (id)getDataSessionsForSubscriber:(id)a3
{
  dataSessionsForSubscribe = self->_dataSessionsForSubscribe;
  uint64_t v4 = [a3 configuration];
  uint64_t v5 = [(NSMutableDictionary *)dataSessionsForSubscribe objectForKey:v4];

  return v5;
}

- (int64_t)getPublishersCount
{
  return [(NSMutableArray *)self->_publishers count];
}

- (int64_t)getSubscribersCount
{
  return [(NSMutableArray *)self->_subscribers count];
}

- (int64_t)getDiscoveryResultsCountForSubscriber:(id)a3
{
  discoveryResults = self->_discoveryResults;
  uint64_t v4 = [a3 configuration];
  uint64_t v5 = [(NSMutableDictionary *)discoveryResults objectForKey:v4];

  int64_t v6 = [v5 count];
  return v6;
}

- (int64_t)getDataSessionsCountForPublisher:(id)a3
{
  dataSessionsForPublish = self->_dataSessionsForPublish;
  uint64_t v4 = [a3 configuration];
  uint64_t v5 = [(NSMutableDictionary *)dataSessionsForPublish objectForKey:v4];

  int64_t v6 = [v5 count];
  return v6;
}

- (int64_t)getDataSessionsCountForSubscriber:(id)a3
{
  dataSessionsForSubscribe = self->_dataSessionsForSubscribe;
  uint64_t v4 = [a3 configuration];
  uint64_t v5 = [(NSMutableDictionary *)dataSessionsForSubscribe objectForKey:v4];

  int64_t v6 = [v5 count];
  return v6;
}

- (void)publisherStarted:(id)a3
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v3 = a3;
  uint64_t v4 = WFLogForCategory(0);
  os_log_type_t v5 = OSLogForWFLogLevel(3uLL);
  if ((unint64_t)WFCurrentLogLevel() >= 3 && v4)
  {
    int64_t v6 = v4;
    if (os_log_type_enabled(v6, v5))
    {
      id v7 = [v3 configuration];
      id v8 = [v7 serviceName];
      int v9 = 138412290;
      id v10 = v8;
      _os_log_impl(&dword_226071000, v6, v5, "NAN publish %@ started", (uint8_t *)&v9, 0xCu);
    }
  }
}

- (void)publisher:(id)a3 failedToStartWithError:(int64_t)a4
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = WFLogForCategory(0);
  os_log_type_t v8 = OSLogForWFLogLevel(3uLL);
  if ((unint64_t)WFCurrentLogLevel() >= 3 && v7)
  {
    int v9 = v7;
    if (os_log_type_enabled(v9, v8))
    {
      id v10 = [v6 configuration];
      uint64_t v11 = [v10 serviceName];
      int v12 = 138412546;
      os_log_type_t v13 = v11;
      __int16 v14 = 2048;
      int64_t v15 = a4;
      _os_log_impl(&dword_226071000, v9, v8, "NAN publish %@ failed to start with error %ld", (uint8_t *)&v12, 0x16u);
    }
  }

  [(WFNANTableViewContext *)self removePublisher:v6];
}

- (void)publisher:(id)a3 terminatedWithReason:(int64_t)a4
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = WFLogForCategory(0);
  os_log_type_t v8 = OSLogForWFLogLevel(3uLL);
  if ((unint64_t)WFCurrentLogLevel() >= 3 && v7)
  {
    int v9 = v7;
    if (os_log_type_enabled(v9, v8))
    {
      id v10 = [v6 configuration];
      uint64_t v11 = [v10 serviceName];
      int v12 = 138412546;
      os_log_type_t v13 = v11;
      __int16 v14 = 2048;
      int64_t v15 = a4;
      _os_log_impl(&dword_226071000, v9, v8, "NAN publish %@ terminated with reason %ld", (uint8_t *)&v12, 0x16u);
    }
  }

  [(WFNANTableViewContext *)self removePublisher:v6];
}

- (void)publisher:(id)a3 dataConfirmedForHandle:(id)a4 localInterfaceIndex:(unsigned int)a5 serviceSpecificInfo:(id)a6
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v8 = a4;
  id v9 = a3;
  id v10 = WFLogForCategory(0);
  os_log_type_t v11 = OSLogForWFLogLevel(3uLL);
  if ((unint64_t)WFCurrentLogLevel() >= 3 && v10)
  {
    int v12 = v10;
    if (os_log_type_enabled(v12, v11))
    {
      os_log_type_t v13 = [v8 initiatorDataAddress];
      int v14 = 138412290;
      int64_t v15 = v13;
      _os_log_impl(&dword_226071000, v12, v11, "Data confirmed for session with peer %@", (uint8_t *)&v14, 0xCu);
    }
  }

  [(WFNANTableViewContext *)self addDataSession:v8 forPublisher:v9];
}

- (void)publisher:(id)a3 dataTerminatedForHandle:(id)a4 reason:(int64_t)a5
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v7 = a4;
  id v8 = a3;
  id v9 = WFLogForCategory(0);
  os_log_type_t v10 = OSLogForWFLogLevel(3uLL);
  if ((unint64_t)WFCurrentLogLevel() >= 3 && v9)
  {
    os_log_type_t v11 = v9;
    if (os_log_type_enabled(v11, v10))
    {
      int v12 = [v7 initiatorDataAddress];
      int v13 = 138412290;
      int v14 = v12;
      _os_log_impl(&dword_226071000, v11, v10, "Data terminated for session with peer %@", (uint8_t *)&v13, 0xCu);
    }
  }

  [(WFNANTableViewContext *)self removeDataSession:v7 forPublisher:v8];
}

- (void)subscriberStarted:(id)a3
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v3 = a3;
  uint64_t v4 = WFLogForCategory(0);
  os_log_type_t v5 = OSLogForWFLogLevel(3uLL);
  if ((unint64_t)WFCurrentLogLevel() >= 3 && v4)
  {
    id v6 = v4;
    if (os_log_type_enabled(v6, v5))
    {
      id v7 = [v3 configuration];
      id v8 = [v7 serviceName];
      int v9 = 138412290;
      os_log_type_t v10 = v8;
      _os_log_impl(&dword_226071000, v6, v5, "NAN subscribe %@ started", (uint8_t *)&v9, 0xCu);
    }
  }
}

- (void)subscriber:(id)a3 failedToStartWithError:(int64_t)a4
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = WFLogForCategory(0);
  os_log_type_t v8 = OSLogForWFLogLevel(3uLL);
  if ((unint64_t)WFCurrentLogLevel() >= 3 && v7)
  {
    int v9 = v7;
    if (os_log_type_enabled(v9, v8))
    {
      os_log_type_t v10 = [v6 configuration];
      uint64_t v11 = [v10 serviceName];
      int v12 = 138412546;
      int v13 = v11;
      __int16 v14 = 2048;
      int64_t v15 = a4;
      _os_log_impl(&dword_226071000, v9, v8, "NAN subscribe %@ failed to start with error %ld", (uint8_t *)&v12, 0x16u);
    }
  }

  [(WFNANTableViewContext *)self removeSubscriber:v6];
}

- (void)subscriber:(id)a3 terminatedWithReason:(int64_t)a4
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = WFLogForCategory(0);
  os_log_type_t v8 = OSLogForWFLogLevel(3uLL);
  if ((unint64_t)WFCurrentLogLevel() >= 3 && v7)
  {
    int v9 = v7;
    if (os_log_type_enabled(v9, v8))
    {
      os_log_type_t v10 = [v6 configuration];
      uint64_t v11 = [v10 serviceName];
      int v12 = 138412546;
      int v13 = v11;
      __int16 v14 = 2048;
      int64_t v15 = a4;
      _os_log_impl(&dword_226071000, v9, v8, "NAN subscribe %@ terminated with reason %ld", (uint8_t *)&v12, 0x16u);
    }
  }

  [(WFNANTableViewContext *)self removeSubscriber:v6];
}

- (void)subscriber:(id)a3 receivedDiscoveyResult:(id)a4
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  os_log_type_t v8 = WFLogForCategory(0);
  os_log_type_t v9 = OSLogForWFLogLevel(3uLL);
  if ((unint64_t)WFCurrentLogLevel() >= 3 && v8)
  {
    os_log_type_t v10 = v8;
    if (os_log_type_enabled(v10, v9))
    {
      uint64_t v11 = [v6 configuration];
      int v12 = [v11 serviceName];
      int v13 = [v7 serviceSpecificInfo];
      __int16 v14 = [v13 description];
      int v15 = 138412546;
      uint64_t v16 = v12;
      __int16 v17 = 2112;
      os_log_type_t v18 = v14;
      _os_log_impl(&dword_226071000, v10, v9, "NAN subscribe %@ received discovery result %@", (uint8_t *)&v15, 0x16u);
    }
  }

  [(WFNANTableViewContext *)self addDiscoveryResult:v7 forSubscriber:v6];
}

- (void)subscriber:(id)a3 lostDiscoveryResultForPublishID:(unsigned __int8)a4 address:(id)a5
{
  uint64_t v6 = a4;
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a5;
  os_log_type_t v10 = WFLogForCategory(0);
  os_log_type_t v11 = OSLogForWFLogLevel(3uLL);
  if ((unint64_t)WFCurrentLogLevel() >= 3 && v10)
  {
    int v12 = v10;
    if (os_log_type_enabled(v12, v11))
    {
      int v13 = [v8 configuration];
      __int16 v14 = [v13 serviceName];
      int v15 = [v9 description];
      int v16 = 138412802;
      __int16 v17 = v14;
      __int16 v18 = 1024;
      int v19 = v6;
      __int16 v20 = 2112;
      id v21 = v15;
      _os_log_impl(&dword_226071000, v12, v11, "NAN subscribe %@ lost discovery result with publish ID %hhu and address %@", (uint8_t *)&v16, 0x1Cu);
    }
  }

  [(WFNANTableViewContext *)self removeDiscoveryResultWithPublishID:v6 andPublisherAddress:v9 forSubscriber:v8];
}

- (NSMutableArray)publishers
{
  return self->_publishers;
}

- (void)setPublishers:(id)a3
{
}

- (NSMutableDictionary)dataSessionsForPublish
{
  return self->_dataSessionsForPublish;
}

- (void)setDataSessionsForPublish:(id)a3
{
}

- (NSMutableArray)subscribers
{
  return self->_subscribers;
}

- (void)setSubscribers:(id)a3
{
}

- (NSMutableDictionary)discoveryResults
{
  return self->_discoveryResults;
}

- (void)setDiscoveryResults:(id)a3
{
}

- (NSMutableDictionary)dataSessionsForSubscribe
{
  return self->_dataSessionsForSubscribe;
}

- (void)setDataSessionsForSubscribe:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataSessionsForSubscribe, 0);
  objc_storeStrong((id *)&self->_discoveryResults, 0);
  objc_storeStrong((id *)&self->_subscribers, 0);
  objc_storeStrong((id *)&self->_dataSessionsForPublish, 0);
  objc_storeStrong((id *)&self->_publishers, 0);
}

@end