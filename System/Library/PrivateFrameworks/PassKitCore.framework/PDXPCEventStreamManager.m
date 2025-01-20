@interface PDXPCEventStreamManager
- (PDXPCEventStreamManager)init;
- (PDXPCEventStreamManager)initWithEventStream:(id)a3 startedPaused:(BOOL)a4;
- (void)_deliverEvent:(id)a3 toObservers:(id)a4 withTransaction:(id)a5;
- (void)_deliverEvents:(id)a3 eventsWerePreviouslyDeferred:(BOOL)a4;
- (void)beginEventDelivery;
- (void)registerObserver:(id)a3 withReplyQueue:(id)a4;
- (void)unregisterObserver:(id)a3;
@end

@implementation PDXPCEventStreamManager

- (void)_deliverEvents:(id)a3 eventsWerePreviouslyDeferred:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  os_unfair_lock_lock(&self->_observersLock);
  pendingEvents = self->_pendingEvents;
  if (!pendingEvents)
  {
    id v19 = [(NSMutableArray *)self->_observers copy];
    os_unfair_lock_unlock(&self->_observersLock);
    if (!v19) {
      goto LABEL_32;
    }
    id v10 = (id)PDOSTransactionCreate("PDXPCEventStreamManager");
    long long v39 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    id v33 = v6;
    id obj = v6;
    id v20 = [obj countByEnumeratingWithState:&v39 objects:v48 count:16];
    if (!v20) {
      goto LABEL_28;
    }
    id v21 = v20;
    uint64_t v22 = *(void *)v40;
LABEL_17:
    uint64_t v23 = 0;
    while (1)
    {
      if (*(void *)v40 != v22) {
        objc_enumerationMutation(obj);
      }
      v24 = *(void **)(*((void *)&v39 + 1) + 8 * v23);
      v25 = PKLogFacilityTypeGetObject();
      BOOL v26 = os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT);
      if (v4)
      {
        if (v26)
        {
          eventStream = self->_eventStream;
          string = xpc_dictionary_get_string(v24, _xpc_event_key_name);
          *(_DWORD *)buf = 138543618;
          v45 = eventStream;
          __int16 v46 = 2080;
          v47 = string;
          v29 = v25;
          v30 = "PDXPCEventStreamManager (%{public}@): (deferred delivery) XPC wake for %s.";
LABEL_25:
          _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, v30, buf, 0x16u);
        }
      }
      else if (v26)
      {
        v31 = self->_eventStream;
        v32 = xpc_dictionary_get_string(v24, _xpc_event_key_name);
        *(_DWORD *)buf = 138543618;
        v45 = v31;
        __int16 v46 = 2080;
        v47 = v32;
        v29 = v25;
        v30 = "PDXPCEventStreamManager (%{public}@): XPC wake for %s.";
        goto LABEL_25;
      }

      [(PDXPCEventStreamManager *)self _deliverEvent:v24 toObservers:v19 withTransaction:v10];
      if (v21 == (id)++v23)
      {
        id v21 = [obj countByEnumeratingWithState:&v39 objects:v48 count:16];
        if (!v21)
        {
LABEL_28:

          goto LABEL_29;
        }
        goto LABEL_17;
      }
    }
  }
  [(NSMutableArray *)pendingEvents addObjectsFromArray:v6];
  if (!self->_pendingEventsTransaction)
  {
    v8 = (OS_os_transaction *)PDOSTransactionCreate("PDXPCEventStreamManager.deferred");
    pendingEventsTransaction = self->_pendingEventsTransaction;
    self->_pendingEventsTransaction = v8;
  }
  os_unfair_lock_unlock(&self->_observersLock);
  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id v10 = v6;
  id v11 = [v10 countByEnumeratingWithState:&v35 objects:v43 count:16];
  if (v11)
  {
    id v12 = v11;
    id v33 = v6;
    uint64_t v13 = *(void *)v36;
    do
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(void *)v36 != v13) {
          objc_enumerationMutation(v10);
        }
        v15 = *(void **)(*((void *)&v35 + 1) + 8 * i);
        v16 = PKLogFacilityTypeGetObject();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          v17 = self->_eventStream;
          v18 = xpc_dictionary_get_string(v15, _xpc_event_key_name);
          *(_DWORD *)buf = 138543618;
          v45 = v17;
          __int16 v46 = 2080;
          v47 = v18;
          _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "PDXPCEventStreamManager (%{public}@): (deferred) XPC wake for %s.", buf, 0x16u);
        }
      }
      id v12 = [v10 countByEnumeratingWithState:&v35 objects:v43 count:16];
    }
    while (v12);
    id v19 = 0;
LABEL_29:
    id v6 = v33;
  }
  else
  {
    id v19 = 0;
  }

LABEL_32:
}

- (void)_deliverEvent:(id)a3 toObservers:(id)a4 withTransaction:(id)a5
{
  id v21 = a3;
  id v8 = a4;
  id v9 = a5;
  if ([v8 count])
  {
    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    id v20 = v8;
    id v10 = v8;
    id v11 = [v10 countByEnumeratingWithState:&v27 objects:v31 count:16];
    if (v11)
    {
      id v12 = v11;
      uint64_t v13 = *(void *)v28;
      do
      {
        for (i = 0; i != v12; i = (char *)i + 1)
        {
          if (*(void *)v28 != v13) {
            objc_enumerationMutation(v10);
          }
          v15 = *(void **)(*((void *)&v27 + 1) + 8 * i);
          v16 = objc_msgSend(v15, "observer", v20);
          if (v16)
          {
            v17 = [v15 replyQueue];
            replyQueue = v17;
            if (!v17) {
              replyQueue = self->_replyQueue;
            }
            id v19 = replyQueue;

            block[0] = _NSConcreteStackBlock;
            block[1] = 3221225472;
            block[2] = sub_1000213A0;
            block[3] = &unk_100730198;
            id v23 = v9;
            id v24 = v16;
            id v25 = v21;
            BOOL v26 = self;
            dispatch_async(v19, block);
          }
        }
        id v12 = [v10 countByEnumeratingWithState:&v27 objects:v31 count:16];
      }
      while (v12);
    }

    id v8 = v20;
  }
}

- (PDXPCEventStreamManager)init
{
  return 0;
}

- (PDXPCEventStreamManager)initWithEventStream:(id)a3 startedPaused:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v26.receiver = self;
  v26.super_class = (Class)PDXPCEventStreamManager;
  v7 = [(PDXPCEventStreamManager *)&v26 init];
  if (v7)
  {
    id v8 = (NSString *)[v6 copy];
    eventStream = v7->_eventStream;
    v7->_eventStream = v8;

    v7->_observersLock._os_unfair_lock_opaque = 0;
    id v10 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    observers = v7->_observers;
    v7->_observers = v10;

    if (v4)
    {
      id v12 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
      pendingEvents = v7->_pendingEvents;
      v7->_pendingEvents = v12;
    }
    v14 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v15 = dispatch_queue_create("com.apple.passd.xpcEventStreamManager.event", v14);
    eventQueue = v7->_eventQueue;
    v7->_eventQueue = (OS_dispatch_queue *)v15;

    dispatch_queue_t v17 = dispatch_queue_create("com.apple.passd.xpcEventStreamManager.reply", v14);
    replyQueue = v7->_replyQueue;
    v7->_replyQueue = (OS_dispatch_queue *)v17;

    id v19 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      id v20 = v7->_eventStream;
      *(_DWORD *)buf = 138543362;
      long long v28 = v20;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "PDXPCEventStreamManager: Registering for stream %{public}@.", buf, 0xCu);
    }

    id v21 = [(NSString *)v7->_eventStream UTF8String];
    uint64_t v22 = v7->_eventQueue;
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_1000093A8;
    handler[3] = &unk_100731230;
    id v25 = v7;
    xpc_set_event_stream_handler(v21, v22, handler);
  }
  return v7;
}

- (void)beginEventDelivery
{
  p_observersLock = &self->_observersLock;
  os_unfair_lock_lock(&self->_observersLock);
  BOOL v4 = self->_pendingEvents;
  v5 = self->_pendingEventsTransaction;
  pendingEvents = self->_pendingEvents;
  self->_pendingEvents = 0;

  pendingEventsTransaction = self->_pendingEventsTransaction;
  self->_pendingEventsTransaction = 0;

  os_unfair_lock_unlock(p_observersLock);
  if ([(NSMutableArray *)v4 count])
  {
    eventQueue = self->_eventQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100066238;
    block[3] = &unk_10072E238;
    id v10 = v5;
    id v11 = self;
    id v12 = v4;
    dispatch_async(eventQueue, block);
  }
}

- (void)registerObserver:(id)a3 withReplyQueue:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    id v8 = objc_alloc_init((Class)NSMutableArray);
    os_unfair_lock_lock(&self->_observersLock);
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v9 = self->_observers;
    id v10 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v10)
    {
      id v11 = v10;
      uint64_t v12 = *(void *)v17;
      while (2)
      {
        for (i = 0; i != v11; i = (char *)i + 1)
        {
          if (*(void *)v17 != v12) {
            objc_enumerationMutation(v9);
          }
          v14 = *(void **)(*((void *)&v16 + 1) + 8 * i);
          id v15 = [v14 observer];
          if (v15)
          {
            [v8 addObject:v15];
            if (v15 == v6)
            {
              [v14 setReplyQueue:v7];

              goto LABEL_13;
            }
          }
        }
        id v11 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
        if (v11) {
          continue;
        }
        break;
      }
    }

    id v9 = objc_alloc_init(PDXPCEventStreamObserverEntry);
    [(NSMutableArray *)v9 setObserver:v6];
    [(NSMutableArray *)v9 setReplyQueue:v7];
    [(NSMutableArray *)self->_observers addObject:v9];
LABEL_13:

    os_unfair_lock_unlock(&self->_observersLock);
  }
}

- (void)unregisterObserver:(id)a3
{
  id v10 = a3;
  id v4 = objc_alloc_init((Class)NSMutableArray);
  os_unfair_lock_lock(&self->_observersLock);
  v5 = (char *)[(NSMutableArray *)self->_observers count];
  id v6 = objc_alloc_init((Class)NSMutableIndexSet);
  if (v5)
  {
    for (i = 0; i != v5; ++i)
    {
      id v8 = [(NSMutableArray *)self->_observers objectAtIndexedSubscript:i];
      id v9 = [v8 observer];

      if (!v9 || ([v4 addObject:v9], v10) && v9 == v10) {
        [v6 addIndex:i];
      }
    }
  }
  [(NSMutableArray *)self->_observers removeObjectsAtIndexes:v6];
  os_unfair_lock_unlock(&self->_observersLock);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_replyQueue, 0);
  objc_storeStrong((id *)&self->_eventQueue, 0);
  objc_storeStrong((id *)&self->_pendingEventsTransaction, 0);
  objc_storeStrong((id *)&self->_pendingEvents, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_eventStream, 0);
}

@end