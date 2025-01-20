@interface NFXPCEventPublisher
- (BOOL)receivedInitialBarrier;
- (NFXPCEventPublisher)initWithStreamName:(id)a3 queue:(id)a4;
- (NSMutableArray)pendingSendEvents;
- (NSMutableSet)tokens;
- (NSString)streamName;
- (OS_dispatch_queue)queue;
- (OS_xpc_event_publisher)publisher;
- (void)handleEventWithAction:(unsigned int)a3 token:(unint64_t)a4 descriptor:(id)a5;
- (void)sendXpcNotificationEvent:(id)a3;
- (void)sendXpcNotificationEventWithDictionary:(id)a3;
- (void)sendXpcNotificationEventWithString:(id)a3;
- (void)setPendingSendEvents:(id)a3;
- (void)setPublisher:(id)a3;
- (void)setQueue:(id)a3;
- (void)setReceivedInitialBarrier:(BOOL)a3;
- (void)setStreamName:(id)a3;
- (void)setTokens:(id)a3;
@end

@implementation NFXPCEventPublisher

- (NFXPCEventPublisher)initWithStreamName:(id)a3 queue:(id)a4
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  v39.receiver = self;
  v39.super_class = (Class)NFXPCEventPublisher;
  v10 = [(NFXPCEventPublisher *)&v39 init];
  v11 = v10;
  if (!v10) {
    goto LABEL_4;
  }
  objc_storeStrong((id *)&v10->_streamName, a3);
  objc_storeStrong((id *)&v11->_queue, a4);
  id v12 = v8;
  [v12 UTF8String];
  uint64_t v13 = xpc_event_publisher_create();
  publisher = v11->_publisher;
  v11->_publisher = (OS_xpc_event_publisher *)v13;

  uint64_t v15 = objc_opt_new();
  pendingSendEvents = v11->_pendingSendEvents;
  v11->_pendingSendEvents = (NSMutableArray *)v15;

  uint64_t v17 = objc_opt_new();
  tokens = v11->_tokens;
  v11->_tokens = (NSMutableSet *)v17;

  if (v11->_publisher)
  {
    objc_initWeak(&location, v11);
    v37[0] = MEMORY[0x1E4F143A8];
    v37[1] = 3221225472;
    v37[2] = __48__NFXPCEventPublisher_initWithStreamName_queue___block_invoke;
    v37[3] = &unk_1E65ABC08;
    objc_copyWeak(&v38, &location);
    v19 = (void *)MEMORY[0x1CB7978C0](v37);
    xpc_event_publisher_set_handler();
    objc_copyWeak(v36, &location);
    v36[1] = (id)a2;
    id v35 = v12;
    xpc_event_publisher_set_error_handler();
    xpc_event_publisher_activate();

    objc_destroyWeak(v36);
    objc_destroyWeak(&v38);
    objc_destroyWeak(&location);
LABEL_4:
    v20 = v11;
    goto LABEL_19;
  }
  v21 = kNFLOG_DISPATCH_SPECIFIC_KEY;
  specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  if ((unint64_t)specific >= 4) {
    __assert_rtn("NFLogGetLogger", "NFSharedLog.c", 216, "category < NFLogCategoryMax");
  }
  v23 = (void (*)(uint64_t, const char *, ...))*(&_NFLogCustomLoggers + (void)specific);
  if (v23)
  {
    Class = object_getClass(v11);
    if (class_isMetaClass(Class)) {
      uint64_t v25 = 43;
    }
    else {
      uint64_t v25 = 45;
    }
    ClassName = object_getClassName(v11);
    Name = sel_getName(a2);
    v23(3, "%c[%{public}s %{public}s]:%i Could not create the Publisher!!!", v25, ClassName, Name, 65);
    v21 = kNFLOG_DISPATCH_SPECIFIC_KEY;
  }
  v28 = dispatch_get_specific(v21);
  if (NFSharedLogInitialize_onceToken != -1) {
    dispatch_once(&NFSharedLogInitialize_onceToken, &__block_literal_global_3);
  }
  v29 = (id)_NFSharedLogClient[(void)v28];
  if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
  {
    v30 = object_getClass(v11);
    if (class_isMetaClass(v30)) {
      int v31 = 43;
    }
    else {
      int v31 = 45;
    }
    v32 = object_getClassName(v11);
    v33 = sel_getName(a2);
    LODWORD(location) = 67109890;
    HIDWORD(location) = v31;
    __int16 v41 = 2082;
    v42 = v32;
    __int16 v43 = 2082;
    v44 = v33;
    __int16 v45 = 1024;
    int v46 = 65;
    _os_log_impl(&dword_1CA51A000, v29, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Could not create the Publisher!!!", (uint8_t *)&location, 0x22u);
  }

  v20 = 0;
LABEL_19:

  return v20;
}

void __48__NFXPCEventPublisher_initWithStreamName_queue___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v9 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v8 = WeakRetained;
  if (WeakRetained) {
    [WeakRetained handleEventWithAction:a2 token:a3 descriptor:v9];
  }
}

void __48__NFXPCEventPublisher_initWithStreamName_queue___block_invoke_2(uint64_t a1)
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v3 = kNFLOG_DISPATCH_SPECIFIC_KEY;
    specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    if ((unint64_t)specific >= 4) {
      __assert_rtn("NFLogGetLogger", "NFSharedLog.c", 216, "category < NFLogCategoryMax");
    }
    v5 = (void (*)(uint64_t, const char *, ...))*(&_NFLogCustomLoggers + (void)specific);
    if (v5)
    {
      Class = object_getClass(WeakRetained);
      BOOL isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(WeakRetained);
      Name = sel_getName(*(SEL *)(a1 + 48));
      uint64_t v18 = *(void *)(a1 + 32);
      uint64_t v19 = xpc_strerror();
      uint64_t v10 = 45;
      if (isMetaClass) {
        uint64_t v10 = 43;
      }
      v5(3, "%c[%{public}s %{public}s]:%i Unexpected error from XPC event publisher for stream %{public}@: %s", v10, ClassName, Name, 59, v18, v19);
      v3 = kNFLOG_DISPATCH_SPECIFIC_KEY;
    }
    v11 = dispatch_get_specific(v3);
    if (NFSharedLogInitialize_onceToken != -1) {
      dispatch_once(&NFSharedLogInitialize_onceToken, &__block_literal_global_3);
    }
    id v12 = (id)_NFSharedLogClient[(void)v11];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      uint64_t v13 = object_getClass(WeakRetained);
      if (class_isMetaClass(v13)) {
        int v14 = 43;
      }
      else {
        int v14 = 45;
      }
      uint64_t v15 = object_getClassName(WeakRetained);
      v16 = sel_getName(*(SEL *)(a1 + 48));
      uint64_t v17 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 67110402;
      int v21 = v14;
      __int16 v22 = 2082;
      v23 = v15;
      __int16 v24 = 2082;
      uint64_t v25 = v16;
      __int16 v26 = 1024;
      int v27 = 59;
      __int16 v28 = 2114;
      uint64_t v29 = v17;
      __int16 v30 = 2080;
      uint64_t v31 = xpc_strerror();
      _os_log_impl(&dword_1CA51A000, v12, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Unexpected error from XPC event publisher for stream %{public}@: %s", buf, 0x36u);
    }
  }
}

- (void)handleEventWithAction:(unsigned int)a3 token:(unint64_t)a4 descriptor:(id)a5
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v8 = a5;
  id v9 = v8;
  if (v8)
  {
    uint64_t v10 = (void *)MEMORY[0x1CB797CE0](v8);
    if (v10) {
      free(v10);
    }
  }
  switch(a3)
  {
    case 0u:
      tokens = self->_tokens;
      id v12 = [NSNumber numberWithUnsignedLongLong:a4];
      [(NSMutableSet *)tokens addObject:v12];
LABEL_17:

      break;
    case 1u:
      uint64_t v18 = self->_tokens;
      id v12 = [NSNumber numberWithUnsignedLongLong:a4];
      [(NSMutableSet *)v18 removeObject:v12];
      goto LABEL_17;
    case 2u:
      self->_receivedInitialBarrier = 1;
      v11 = (void *)[(NSMutableArray *)self->_pendingSendEvents copy];
      [(NSMutableArray *)self->_pendingSendEvents removeAllObjects];
      long long v21 = 0u;
      long long v22 = 0u;
      long long v19 = 0u;
      long long v20 = 0u;
      id v12 = v11;
      uint64_t v13 = [v12 countByEnumeratingWithState:&v19 objects:v23 count:16];
      if (v13)
      {
        uint64_t v14 = v13;
        uint64_t v15 = *(void *)v20;
        do
        {
          uint64_t v16 = 0;
          do
          {
            if (*(void *)v20 != v15) {
              objc_enumerationMutation(v12);
            }
            -[NFXPCEventPublisher sendXpcNotificationEvent:](self, "sendXpcNotificationEvent:", *(void *)(*((void *)&v19 + 1) + 8 * v16++), (void)v19);
          }
          while (v14 != v16);
          uint64_t v14 = [v12 countByEnumeratingWithState:&v19 objects:v23 count:16];
        }
        while (v14);
      }

      goto LABEL_17;
  }
}

- (void)sendXpcNotificationEvent:(id)a3
{
  id v5 = a3;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __48__NFXPCEventPublisher_sendXpcNotificationEvent___block_invoke;
  block[3] = &unk_1E65AB840;
  block[4] = self;
  id v9 = v5;
  SEL v10 = a2;
  id v7 = v5;
  dispatch_async(queue, block);
}

void __48__NFXPCEventPublisher_sendXpcNotificationEvent___block_invoke(uint64_t a1)
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v2 + 8))
  {
    long long v31 = 0u;
    long long v32 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    id obj = *(id *)(v2 + 48);
    uint64_t v3 = [obj countByEnumeratingWithState:&v29 objects:v47 count:16];
    if (v3)
    {
      uint64_t v4 = v3;
      uint64_t v28 = *(void *)v30;
      do
      {
        uint64_t v5 = 0;
        do
        {
          if (*(void *)v30 != v28) {
            objc_enumerationMutation(obj);
          }
          v6 = *(void **)(*((void *)&v29 + 1) + 8 * v5);
          [v6 unsignedLongLongValue];
          if (xpc_event_publisher_fire())
          {
            id v7 = kNFLOG_DISPATCH_SPECIFIC_KEY;
            specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
            if ((unint64_t)specific >= 4) {
              __assert_rtn("NFLogGetLogger", "NFSharedLog.c", 216, "category < NFLogCategoryMax");
            }
            id v9 = (void (*)(uint64_t, const char *, ...))*(&_NFLogCustomLoggers + (void)specific);
            if (v9)
            {
              Class = object_getClass(*(id *)(a1 + 32));
              BOOL isMetaClass = class_isMetaClass(Class);
              ClassName = object_getClassName(*(id *)(a1 + 32));
              Name = sel_getName(*(SEL *)(a1 + 48));
              uint64_t v14 = *(void *)(*(void *)(a1 + 32) + 24);
              uint64_t v26 = xpc_strerror();
              uint64_t v15 = 45;
              if (isMetaClass) {
                uint64_t v15 = 43;
              }
              v9(3, "%c[%{public}s %{public}s]:%i Failed to send event to XPC event stream %{public}@ for token %{public}@: %s", v15, ClassName, Name, 112, v14, v6, v26);
              id v7 = kNFLOG_DISPATCH_SPECIFIC_KEY;
            }
            uint64_t v16 = dispatch_get_specific(v7);
            if (NFSharedLogInitialize_onceToken != -1) {
              dispatch_once(&NFSharedLogInitialize_onceToken, &__block_literal_global_3);
            }
            uint64_t v17 = (id)_NFSharedLogClient[(void)v16];
            if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
            {
              uint64_t v18 = object_getClass(*(id *)(a1 + 32));
              if (class_isMetaClass(v18)) {
                int v19 = 43;
              }
              else {
                int v19 = 45;
              }
              long long v20 = object_getClassName(*(id *)(a1 + 32));
              long long v21 = sel_getName(*(SEL *)(a1 + 48));
              uint64_t v22 = *(void *)(*(void *)(a1 + 32) + 24);
              uint64_t v23 = xpc_strerror();
              *(_DWORD *)buf = 67110658;
              int v34 = v19;
              __int16 v35 = 2082;
              v36 = v20;
              __int16 v37 = 2082;
              id v38 = v21;
              __int16 v39 = 1024;
              int v40 = 112;
              __int16 v41 = 2114;
              uint64_t v42 = v22;
              __int16 v43 = 2114;
              v44 = v6;
              __int16 v45 = 2080;
              uint64_t v46 = v23;
              _os_log_impl(&dword_1CA51A000, v17, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Failed to send event to XPC event stream %{public}@ for token %{public}@: %s", buf, 0x40u);
            }
          }
          ++v5;
        }
        while (v4 != v5);
        uint64_t v4 = [obj countByEnumeratingWithState:&v29 objects:v47 count:16];
      }
      while (v4);
    }
  }
  else
  {
    uint64_t v24 = *(void **)(v2 + 40);
    uint64_t v25 = *(void *)(a1 + 40);
    [v24 addObject:v25];
  }
}

- (void)sendXpcNotificationEventWithString:(id)a3
{
  id v4 = a3;
  xpc_object_t xdict = xpc_dictionary_create(0, 0, 0);
  id v5 = v4;
  v6 = (const char *)[v5 UTF8String];

  xpc_dictionary_set_string(xdict, "Payload", v6);
  [(NFXPCEventPublisher *)self sendXpcNotificationEvent:xdict];
}

- (void)sendXpcNotificationEventWithDictionary:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v5 = (void *)_CFXPCCreateXPCObjectFromCFObject();
  v6 = v5;
  if (v5)
  {
    if (xpc_dictionary_get_count(v5)) {
      [(NFXPCEventPublisher *)self sendXpcNotificationEvent:v6];
    }
  }
  else
  {
    id v7 = kNFLOG_DISPATCH_SPECIFIC_KEY;
    specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    if ((unint64_t)specific >= 4) {
      __assert_rtn("NFLogGetLogger", "NFSharedLog.c", 216, "category < NFLogCategoryMax");
    }
    id v9 = (void (*)(uint64_t, const char *, ...))*(&_NFLogCustomLoggers + (void)specific);
    if (v9)
    {
      Class = object_getClass(self);
      BOOL isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(self);
      Name = sel_getName(a2);
      uint64_t v13 = 45;
      if (isMetaClass) {
        uint64_t v13 = 43;
      }
      v9(3, "%c[%{public}s %{public}s]:%i Unable to create event dictionary; dropping event",
        v13,
        ClassName,
        Name,
        132);
      id v7 = kNFLOG_DISPATCH_SPECIFIC_KEY;
    }
    uint64_t v14 = dispatch_get_specific(v7);
    if (NFSharedLogInitialize_onceToken != -1) {
      dispatch_once(&NFSharedLogInitialize_onceToken, &__block_literal_global_3);
    }
    uint64_t v15 = (id)_NFSharedLogClient[(void)v14];
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      uint64_t v16 = object_getClass(self);
      if (class_isMetaClass(v16)) {
        int v17 = 43;
      }
      else {
        int v17 = 45;
      }
      *(_DWORD *)buf = 67109890;
      int v20 = v17;
      __int16 v21 = 2082;
      uint64_t v22 = object_getClassName(self);
      __int16 v23 = 2082;
      uint64_t v24 = sel_getName(a2);
      __int16 v25 = 1024;
      int v26 = 132;
      _os_log_impl(&dword_1CA51A000, v15, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Unable to create event dictionary; dropping event",
        buf,
        0x22u);
    }
  }
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
  objc_storeStrong((id *)&self->_pendingSendEvents, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_streamName, 0);

  objc_storeStrong((id *)&self->_publisher, 0);
}

@end