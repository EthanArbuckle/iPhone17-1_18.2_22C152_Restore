@interface NCNotificationCollapsingQueue
- (BOOL)containsNotificationRequest:(id)a3;
- (BOOL)containsNotificationRequestMatchingRequest:(id)a3;
- (NCNotificationCollapsingQueue)init;
- (NSArray)enqueuedRequestIdentifiers;
- (NSMutableArray)requests;
- (id)_collapsedNotificationRequestForNotificationRequest:(id)a3 atIndex:(unint64_t)a4;
- (id)_collapsedNotificationRequestFromCollapsibleRequests:(id)a3;
- (id)_requestsCollapsibleWithNotificationRequest:(id)a3;
- (id)notificationRequestsCoalescebleWithCoalescedRequest:(id)a3;
- (id)peekNextNotificationRequest;
- (id)peekNextNotificationRequestPassingTest:(id)a3;
- (unint64_t)_collapsedCountForCollapsibleRequests:(id)a3;
- (unint64_t)_indexOfRequestMatchingNotificationRequest:(id)a3;
- (unint64_t)collapsingThreshold;
- (unint64_t)count;
- (void)_insertPreemptingNotificationRequest:(id)a3;
- (void)addNotificationRequest:(id)a3;
- (void)removeNotificationRequest:(id)a3;
- (void)replaceNotificationRequest:(id)a3;
- (void)setCollapsingThreshold:(unint64_t)a3;
- (void)setRequests:(id)a3;
@end

@implementation NCNotificationCollapsingQueue

- (NCNotificationCollapsingQueue)init
{
  v6.receiver = self;
  v6.super_class = (Class)NCNotificationCollapsingQueue;
  v2 = [(NCNotificationCollapsingQueue *)&v6 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    requests = v2->_requests;
    v2->_requests = (NSMutableArray *)v3;

    v2->_collapsingThreshold = 5;
  }
  return v2;
}

- (unint64_t)count
{
  v2 = [(NCNotificationCollapsingQueue *)self requests];
  unint64_t v3 = [v2 count];

  return v3;
}

- (NSArray)enqueuedRequestIdentifiers
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  unint64_t v3 = objc_opt_new();
  v4 = [(NCNotificationCollapsingQueue *)self requests];
  v5 = (void *)[v4 copy];

  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v6 = v5;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * i), "notificationIdentifier", (void)v13);
        [v3 addObject:v11];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }

  return (NSArray *)v3;
}

- (void)addNotificationRequest:(id)a3
{
  id v9 = a3;
  unint64_t v4 = -[NCNotificationCollapsingQueue _indexOfRequestMatchingNotificationRequest:](self, "_indexOfRequestMatchingNotificationRequest:");
  if (v4 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v5 = [v9 options];
    int v6 = [v5 preemptsPresentedNotification];

    if (v6)
    {
      [(NCNotificationCollapsingQueue *)self _insertPreemptingNotificationRequest:v9];
      goto LABEL_7;
    }
    uint64_t v8 = [(NCNotificationCollapsingQueue *)self requests];
    [v8 addObject:v9];
  }
  else
  {
    unint64_t v7 = v4;
    uint64_t v8 = [(NCNotificationCollapsingQueue *)self requests];
    [v8 replaceObjectAtIndex:v7 withObject:v9];
  }

LABEL_7:
}

- (void)replaceNotificationRequest:(id)a3
{
  id v7 = a3;
  unint64_t v4 = -[NCNotificationCollapsingQueue _indexOfRequestMatchingNotificationRequest:](self, "_indexOfRequestMatchingNotificationRequest:");
  if (v4 != 0x7FFFFFFFFFFFFFFFLL)
  {
    unint64_t v5 = v4;
    int v6 = [(NCNotificationCollapsingQueue *)self requests];
    [v6 replaceObjectAtIndex:v5 withObject:v7];
  }
}

- (void)removeNotificationRequest:(id)a3
{
  unint64_t v4 = [(NCNotificationCollapsingQueue *)self _indexOfRequestMatchingNotificationRequest:a3];
  if (v4 != 0x7FFFFFFFFFFFFFFFLL)
  {
    unint64_t v5 = v4;
    id v6 = [(NCNotificationCollapsingQueue *)self requests];
    [v6 removeObjectAtIndex:v5];
  }
}

- (BOOL)containsNotificationRequest:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(NCNotificationCollapsingQueue *)self requests];
  char v6 = [v5 containsObject:v4];

  return v6;
}

- (BOOL)containsNotificationRequestMatchingRequest:(id)a3
{
  return [(NCNotificationCollapsingQueue *)self _indexOfRequestMatchingNotificationRequest:a3] != 0x7FFFFFFFFFFFFFFFLL;
}

- (id)peekNextNotificationRequest
{
  return [(NCNotificationCollapsingQueue *)self peekNextNotificationRequestPassingTest:0];
}

- (id)peekNextNotificationRequestPassingTest:(id)a3
{
  id v4 = (unsigned int (**)(id, void *))a3;
  unint64_t v5 = [(NCNotificationCollapsingQueue *)self requests];
  uint64_t v6 = [v5 count];

  if (v6)
  {
    unint64_t v7 = 0;
    while (1)
    {
      uint64_t v8 = [(NCNotificationCollapsingQueue *)self requests];
      id v9 = [v8 objectAtIndex:v7];

      v10 = [(NCNotificationCollapsingQueue *)self _collapsedNotificationRequestForNotificationRequest:v9 atIndex:v7];
      if (!v4 || v4[2](v4, v10)) {
        break;
      }
      ++v7;

      v11 = [(NCNotificationCollapsingQueue *)self requests];
      unint64_t v12 = [v11 count];

      if (v7 >= v12) {
        goto LABEL_6;
      }
    }
  }
  else
  {
LABEL_6:
    v10 = 0;
  }

  return v10;
}

- (id)notificationRequestsCoalescebleWithCoalescedRequest:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  unint64_t v5 = objc_opt_new();
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v6 = [(NCNotificationCollapsingQueue *)self requests];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v13 + 1) + 8 * i);
        if ([v4 matchesThreadForRequest:v11]) {
          [v5 addObject:v11];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }

  return v5;
}

- (void)_insertPreemptingNotificationRequest:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(NCNotificationCollapsingQueue *)self requests];
  uint64_t v6 = [v5 indexOfObjectPassingTest:&__block_literal_global_0];

  uint64_t v7 = [(NCNotificationCollapsingQueue *)self requests];
  id v8 = v7;
  if (v6 == 0x7FFFFFFFFFFFFFFFLL) {
    [v7 addObject:v4];
  }
  else {
    [v7 insertObject:v4 atIndex:v6];
  }
}

uint64_t __70__NCNotificationCollapsingQueue__insertPreemptingNotificationRequest___block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 options];
  uint64_t v3 = [v2 preemptsPresentedNotification] ^ 1;

  return v3;
}

- (unint64_t)_indexOfRequestMatchingNotificationRequest:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(NCNotificationCollapsingQueue *)self requests];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __76__NCNotificationCollapsingQueue__indexOfRequestMatchingNotificationRequest___block_invoke;
  v9[3] = &unk_264559E10;
  id v10 = v4;
  id v6 = v4;
  unint64_t v7 = [v5 indexOfObjectPassingTest:v9];

  return v7;
}

uint64_t __76__NCNotificationCollapsingQueue__indexOfRequestMatchingNotificationRequest___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 notificationIdentifier];
  unint64_t v5 = [v3 notificationIdentifier];

  uint64_t v6 = [v4 isEqualToString:v5];
  return v6;
}

- (id)_requestsCollapsibleWithNotificationRequest:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  unint64_t v5 = objc_opt_new();
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v6 = [(NCNotificationCollapsingQueue *)self requests];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        if ([v11 isCollapsibleWithNotificationRequest:v4]) {
          [v5 addObject:v11];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }

  return v5;
}

- (unint64_t)_collapsedCountForCollapsibleRequests:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v3 = a3;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    unint64_t v6 = 0;
    uint64_t v7 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v3);
        }
        uint64_t v9 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        if ([v9 isCollapsedNotification]) {
          uint64_t v10 = [v9 collapsedNotificationsCount];
        }
        else {
          uint64_t v10 = 1;
        }
        v6 += v10;
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v5);
  }
  else
  {
    unint64_t v6 = 0;
  }

  return v6;
}

- (id)_collapsedNotificationRequestFromCollapsibleRequests:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_new();
  unint64_t v6 = [v4 firstObject];
  uint64_t v7 = [v6 notificationIdentifier];
  [v5 setNotificationIdentifier:v7];

  uint64_t v8 = [v6 sectionIdentifier];
  [v5 setSectionIdentifier:v8];

  uint64_t v9 = [v6 threadIdentifier];
  [v5 setThreadIdentifier:v9];

  uint64_t v10 = [v6 timestamp];
  [v5 setTimestamp:v10];

  uint64_t v11 = [v6 requestDestinations];
  [v5 setRequestDestinations:v11];

  long long v12 = [v6 options];
  [v5 setOptions:v12];

  long long v13 = [v6 context];
  [v5 setContext:v13];

  long long v14 = [v6 settingsSections];
  [v5 setSettingsSections:v14];

  long long v15 = [v6 sound];
  [v5 setSound:v15];

  long long v16 = [v6 sourceInfo];
  [v5 setSourceInfo:v16];

  uint64_t v17 = [v6 cancelAction];
  [v5 setCancelAction:v17];

  uint64_t v18 = [v6 clearAction];
  [v5 setClearAction:v18];

  v19 = [v6 closeAction];
  [v5 setCloseAction:v19];

  v20 = [v6 defaultAction];
  [v5 setDefaultAction:v20];

  v21 = [v6 silenceAction];
  [v5 setSilenceAction:v21];

  v22 = objc_opt_new();
  v23 = [v6 content];
  v24 = [v23 customHeader];
  [v22 setCustomHeader:v24];

  v25 = [v6 content];
  v26 = [v25 defaultHeader];
  [v22 setDefaultHeader:v26];

  v27 = [v6 content];
  v28 = [v27 icons];
  [v22 setIcons:v28];

  v29 = [v6 content];
  v30 = [v29 carPlayIcons];
  [v22 setCarPlayIcons:v30];

  v31 = [v6 content];
  v32 = [v31 hiddenPreviewsBodyPlaceholder];
  [v22 setHiddenPreviewsBodyPlaceholder:v32];

  v33 = [MEMORY[0x263EFF910] date];
  [v22 setDate:v33];

  [v5 setContent:v22];
  [v5 setIsCollapsedNotification:1];
  unint64_t v34 = [(NCNotificationCollapsingQueue *)self _collapsedCountForCollapsibleRequests:v4];

  [v5 setCollapsedNotificationsCount:v34];

  return v5;
}

- (id)_collapsedNotificationRequestForNotificationRequest:(id)a3 atIndex:(unint64_t)a4
{
  id v6 = a3;
  uint64_t v7 = [(NCNotificationCollapsingQueue *)self _requestsCollapsibleWithNotificationRequest:v6];
  unint64_t v8 = [(NCNotificationCollapsingQueue *)self _collapsedCountForCollapsibleRequests:v7];
  uint64_t v9 = v6;
  if ([(NCNotificationCollapsingQueue *)self collapsingThreshold] >= 2)
  {
    uint64_t v9 = v6;
    if (v8 >= [(NCNotificationCollapsingQueue *)self collapsingThreshold])
    {
      uint64_t v9 = [(NCNotificationCollapsingQueue *)self _collapsedNotificationRequestFromCollapsibleRequests:v7];

      uint64_t v10 = [(NCNotificationCollapsingQueue *)self requests];
      [v10 removeObjectsInArray:v7];

      uint64_t v11 = [(NCNotificationCollapsingQueue *)self requests];
      [v11 insertObject:v9 atIndex:a4];
    }
  }

  return v9;
}

- (unint64_t)collapsingThreshold
{
  return self->_collapsingThreshold;
}

- (void)setCollapsingThreshold:(unint64_t)a3
{
  self->_collapsingThreshold = a3;
}

- (NSMutableArray)requests
{
  return self->_requests;
}

- (void)setRequests:(id)a3
{
}

- (void).cxx_destruct
{
}

@end