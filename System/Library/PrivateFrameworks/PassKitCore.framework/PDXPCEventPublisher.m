@interface PDXPCEventPublisher
- (BOOL)receivedInitialBarrier;
- (NSMutableArray)pendingSendEventCompletions;
- (NSMutableArray)pendingSendEvents;
- (NSMutableSet)tokens;
- (NSString)streamName;
- (OS_dispatch_queue)queue;
- (OS_xpc_event_publisher)publisher;
- (PDXPCEventPublisher)initWithStreamName:(id)a3;
- (void)handleEventWithAction:(unsigned int)a3 token:(unint64_t)a4 descriptor:(id)a5;
- (void)sendEvent:(id)a3;
- (void)sendEvent:(id)a3 completion:(id)a4;
- (void)setPendingSendEventCompletions:(id)a3;
- (void)setPendingSendEvents:(id)a3;
- (void)setPublisher:(id)a3;
- (void)setQueue:(id)a3;
- (void)setReceivedInitialBarrier:(BOOL)a3;
- (void)setStreamName:(id)a3;
- (void)setTokens:(id)a3;
@end

@implementation PDXPCEventPublisher

- (PDXPCEventPublisher)initWithStreamName:(id)a3
{
  id v5 = a3;
  v26.receiver = self;
  v26.super_class = (Class)PDXPCEventPublisher;
  v6 = [(PDXPCEventPublisher *)&v26 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_streamName, a3);
    v8 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v9 = dispatch_queue_create([(NSString *)v7->_streamName UTF8String], v8);
    queue = v7->_queue;
    v7->_queue = (OS_dispatch_queue *)v9;

    id v11 = v5;
    [v11 UTF8String];
    uint64_t v12 = xpc_event_publisher_create();
    publisher = v7->_publisher;
    v7->_publisher = (OS_xpc_event_publisher *)v12;

    v14 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    pendingSendEvents = v7->_pendingSendEvents;
    v7->_pendingSendEvents = v14;

    v16 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    pendingSendEventCompletions = v7->_pendingSendEventCompletions;
    v7->_pendingSendEventCompletions = v16;

    v18 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    tokens = v7->_tokens;
    v7->_tokens = v18;

    if (v7->_publisher)
    {
      objc_initWeak(&location, v7);
      v23[0] = _NSConcreteStackBlock;
      v23[1] = 3221225472;
      v23[2] = sub_1002C55F4;
      v23[3] = &unk_1007460D0;
      objc_copyWeak(&v24, &location);
      v20 = objc_retainBlock(v23);
      xpc_event_publisher_set_handler();
      id v22 = v11;
      xpc_event_publisher_set_error_handler();
      xpc_event_publisher_activate();

      objc_destroyWeak(&v24);
      objc_destroyWeak(&location);
    }
  }
  return v7;
}

- (void)handleEventWithAction:(unsigned int)a3 token:(unint64_t)a4 descriptor:(id)a5
{
  id v8 = a5;
  dispatch_queue_t v9 = v8;
  if (v8)
  {
    v10 = xpc_copy_description(v8);
    id v11 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      streamName = self->_streamName;
      *(_DWORD *)buf = 138544130;
      v42 = streamName;
      __int16 v43 = 1024;
      unsigned int v44 = a3;
      __int16 v45 = 2048;
      unint64_t v46 = a4;
      __int16 v47 = 2080;
      v48 = v10;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "XPC event publisher for stream %{public}@ received xpc event with action %d and token %llu: %s", buf, 0x26u);
    }

    if (v10) {
      free(v10);
    }
    if (a3) {
      goto LABEL_7;
    }
LABEL_29:
    tokens = self->_tokens;
    id v16 = +[NSNumber numberWithUnsignedLongLong:a4];
    [(NSMutableSet *)tokens addObject:v16];
LABEL_31:

    goto LABEL_32;
  }
  v27 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
  {
    v28 = self->_streamName;
    *(_DWORD *)buf = 138543874;
    v42 = v28;
    __int16 v43 = 1024;
    unsigned int v44 = a3;
    __int16 v45 = 2048;
    unint64_t v46 = a4;
    _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "XPC event publisher for stream %{public}@ received xpc event with action %d and token %llu", buf, 0x1Cu);
  }

  if (!a3) {
    goto LABEL_29;
  }
LABEL_7:
  if (a3 == 1)
  {
    v30 = self->_tokens;
    id v16 = +[NSNumber numberWithUnsignedLongLong:a4];
    [(NSMutableSet *)v30 removeObject:v16];
    goto LABEL_31;
  }
  if (a3 == 2)
  {
    v13 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v14 = self->_streamName;
      *(_DWORD *)buf = 138543362;
      v42 = v14;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "XPC event publisher for stream %{public}@ received initial barrier", buf, 0xCu);
    }

    self->_receivedInitialBarrier = 1;
    id v15 = [(NSMutableArray *)self->_pendingSendEvents copy];
    [(NSMutableArray *)self->_pendingSendEvents removeAllObjects];
    long long v37 = 0u;
    long long v38 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    id v16 = v15;
    id v17 = [v16 countByEnumeratingWithState:&v35 objects:v40 count:16];
    if (v17)
    {
      id v18 = v17;
      uint64_t v19 = *(void *)v36;
      do
      {
        for (i = 0; i != v18; i = (char *)i + 1)
        {
          if (*(void *)v36 != v19) {
            objc_enumerationMutation(v16);
          }
          [(PDXPCEventPublisher *)self sendEvent:*(void *)(*((void *)&v35 + 1) + 8 * i)];
        }
        id v18 = [v16 countByEnumeratingWithState:&v35 objects:v40 count:16];
      }
      while (v18);
    }

    id v21 = [(NSMutableArray *)self->_pendingSendEventCompletions copy];
    [(NSMutableArray *)self->_pendingSendEventCompletions removeAllObjects];
    long long v33 = 0u;
    long long v34 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    id v22 = v21;
    id v23 = [v22 countByEnumeratingWithState:&v31 objects:v39 count:16];
    if (v23)
    {
      id v24 = v23;
      uint64_t v25 = *(void *)v32;
      do
      {
        for (j = 0; j != v24; j = (char *)j + 1)
        {
          if (*(void *)v32 != v25) {
            objc_enumerationMutation(v22);
          }
          (*(void (**)(void))(*(void *)(*((void *)&v31 + 1) + 8 * (void)j) + 16))(*(void *)(*((void *)&v31 + 1) + 8 * (void)j));
        }
        id v24 = [v22 countByEnumeratingWithState:&v31 objects:v39 count:16];
      }
      while (v24);
    }

    goto LABEL_31;
  }
LABEL_32:
}

- (void)sendEvent:(id)a3
{
}

- (void)sendEvent:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1002C5B3C;
  block[3] = &unk_10072E9D8;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(queue, block);
}

- (OS_xpc_event_publisher)publisher
{
  return self->_publisher;
}

- (void)setPublisher:(id)a3
{
}

- (NSString)streamName
{
  return self->_streamName;
}

- (void)setStreamName:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (NSMutableArray)pendingSendEvents
{
  return self->_pendingSendEvents;
}

- (void)setPendingSendEvents:(id)a3
{
}

- (NSMutableArray)pendingSendEventCompletions
{
  return self->_pendingSendEventCompletions;
}

- (void)setPendingSendEventCompletions:(id)a3
{
}

- (NSMutableSet)tokens
{
  return self->_tokens;
}

- (void)setTokens:(id)a3
{
}

- (BOOL)receivedInitialBarrier
{
  return self->_receivedInitialBarrier;
}

- (void)setReceivedInitialBarrier:(BOOL)a3
{
  self->_receivedInitialBarrier = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tokens, 0);
  objc_storeStrong((id *)&self->_pendingSendEventCompletions, 0);
  objc_storeStrong((id *)&self->_pendingSendEvents, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_streamName, 0);
  objc_storeStrong((id *)&self->_publisher, 0);
}

@end