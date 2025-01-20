@interface _VUIAppDocumentUpdateEventObserverContext
- (NSMutableDictionary)refreshTimerByEventDescriptor;
- (NSSet)eventDescriptors;
- (UIViewController)viewController;
- (id)_refreshTimerWithRefreshTimeEventDescriptor:(id)a3;
- (id)refreshTimerFiredBlock;
- (void)_cancelAllRefreshTimers;
- (void)_cancelRefreshTimer:(id)a3;
- (void)_cancelRefreshTimers:(id)a3;
- (void)_startRefreshTimer:(id)a3;
- (void)dealloc;
- (void)invalidate;
- (void)setEventDescriptors:(id)a3;
- (void)setRefreshTimerByEventDescriptor:(id)a3;
- (void)setRefreshTimerFiredBlock:(id)a3;
- (void)setViewController:(id)a3;
- (void)updateDescriptorsWithDescriptors:(id)a3;
@end

@implementation _VUIAppDocumentUpdateEventObserverContext

- (void)setEventDescriptors:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  v4 = (NSSet *)[a3 copy];
  eventDescriptors = self->_eventDescriptors;
  self->_eventDescriptors = v4;

  v6 = [(_VUIAppDocumentUpdateEventObserverContext *)self refreshTimerByEventDescriptor];
  id v7 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  v8 = self->_eventDescriptors;
  uint64_t v9 = [(NSSet *)v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v19;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v19 != v11) {
          objc_enumerationMutation(v8);
        }
        v13 = *(void **)(*((void *)&v18 + 1) + 8 * v12);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v14 = v13;
          uint64_t v15 = objc_msgSend(v6, "objectForKey:", v14, (void)v18);
          if (v15)
          {
            v16 = (void *)v15;
            [v6 removeObjectForKey:v14];
            goto LABEL_10;
          }
          v16 = [(_VUIAppDocumentUpdateEventObserverContext *)self _refreshTimerWithRefreshTimeEventDescriptor:v14];
          [(_VUIAppDocumentUpdateEventObserverContext *)self _startRefreshTimer:v16];
          if (v16)
          {
LABEL_10:
            [v7 setObject:v16 forKey:v14];
          }
        }
        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [(NSSet *)v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v10);
  }

  v17 = [v6 allValues];
  [(_VUIAppDocumentUpdateEventObserverContext *)self _cancelRefreshTimers:v17];

  [(_VUIAppDocumentUpdateEventObserverContext *)self setRefreshTimerByEventDescriptor:v7];
}

- (void)_startRefreshTimer:(id)a3
{
  if (a3) {
    dispatch_resume((dispatch_object_t)a3);
  }
}

- (id)_refreshTimerWithRefreshTimeEventDescriptor:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 delayInSeconds];
  if (v5)
  {
    uint64_t v6 = v5;
    id v7 = dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, MEMORY[0x1E4F14428]);
    objc_initWeak(&location, self);
    handler[0] = MEMORY[0x1E4F143A8];
    handler[1] = 3221225472;
    handler[2] = __89___VUIAppDocumentUpdateEventObserverContext__refreshTimerWithRefreshTimeEventDescriptor___block_invoke;
    handler[3] = &unk_1E6DF5490;
    objc_copyWeak(&v12, &location);
    id v11 = v4;
    dispatch_source_set_event_handler(v7, handler);
    dispatch_time_t v8 = dispatch_time(0, 1000000000 * v6);
    dispatch_source_set_timer(v7, v8, 0xFFFFFFFFFFFFFFFFLL, 0);

    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (NSMutableDictionary)refreshTimerByEventDescriptor
{
  return self->_refreshTimerByEventDescriptor;
}

- (void)setRefreshTimerByEventDescriptor:(id)a3
{
}

- (void)_cancelRefreshTimers:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        [(_VUIAppDocumentUpdateEventObserverContext *)self _cancelRefreshTimer:*(void *)(*((void *)&v9 + 1) + 8 * v8++)];
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (void)setViewController:(id)a3
{
}

- (void)setRefreshTimerFiredBlock:(id)a3
{
}

- (void)dealloc
{
  [(_VUIAppDocumentUpdateEventObserverContext *)self invalidate];
  v3.receiver = self;
  v3.super_class = (Class)_VUIAppDocumentUpdateEventObserverContext;
  [(_VUIAppDocumentUpdateEventObserverContext *)&v3 dealloc];
}

- (void)invalidate
{
  [(_VUIAppDocumentUpdateEventObserverContext *)self setEventDescriptors:0];
  [(_VUIAppDocumentUpdateEventObserverContext *)self setRefreshTimerFiredBlock:0];
  [(_VUIAppDocumentUpdateEventObserverContext *)self _cancelAllRefreshTimers];
}

- (void)updateDescriptorsWithDescriptors:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(_VUIAppDocumentUpdateEventObserverContext *)self eventDescriptors];
  uint64_t v6 = [v5 setByAddingObjectsFromSet:v4];
  eventDescriptors = self->_eventDescriptors;
  self->_eventDescriptors = v6;

  uint64_t v8 = [(_VUIAppDocumentUpdateEventObserverContext *)self refreshTimerByEventDescriptor];
  long long v9 = (void *)[v8 mutableCopy];

  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v10 = v4;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v19 objects:v23 count:16];
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
        uint64_t v15 = *(void **)(*((void *)&v19 + 1) + 8 * v14);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v16 = v15;
          v17 = objc_msgSend(v9, "objectForKey:", v16, (void)v19);
          if (v17)
          {
            [v9 removeObjectForKey:v16];
            [(_VUIAppDocumentUpdateEventObserverContext *)self _cancelRefreshTimer:v17];
          }
          long long v18 = [(_VUIAppDocumentUpdateEventObserverContext *)self _refreshTimerWithRefreshTimeEventDescriptor:v16];

          if (v18)
          {
            [(_VUIAppDocumentUpdateEventObserverContext *)self _startRefreshTimer:v18];
            [v9 setObject:v18 forKey:v16];
          }
        }
        ++v14;
      }
      while (v12 != v14);
      uint64_t v12 = [v10 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v12);
  }

  [(_VUIAppDocumentUpdateEventObserverContext *)self setRefreshTimerByEventDescriptor:v9];
}

- (void)_cancelRefreshTimer:(id)a3
{
  if (a3) {
    dispatch_source_cancel((dispatch_source_t)a3);
  }
}

- (void)_cancelAllRefreshTimers
{
  objc_super v3 = [(_VUIAppDocumentUpdateEventObserverContext *)self refreshTimerByEventDescriptor];
  id v4 = [v3 allValues];

  [(_VUIAppDocumentUpdateEventObserverContext *)self setRefreshTimerByEventDescriptor:0];
  [(_VUIAppDocumentUpdateEventObserverContext *)self _cancelRefreshTimers:v4];
}

- (NSSet)eventDescriptors
{
  return self->_eventDescriptors;
}

- (id)refreshTimerFiredBlock
{
  return self->_refreshTimerFiredBlock;
}

- (UIViewController)viewController
{
  return self->_viewController;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewController, 0);
  objc_storeStrong(&self->_refreshTimerFiredBlock, 0);
  objc_storeStrong((id *)&self->_refreshTimerByEventDescriptor, 0);
  objc_storeStrong((id *)&self->_eventDescriptors, 0);
}

@end