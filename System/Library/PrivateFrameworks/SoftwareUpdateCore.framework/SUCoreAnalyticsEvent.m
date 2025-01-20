@interface SUCoreAnalyticsEvent
- (NSDictionary)eventPayload;
- (NSString)eventName;
- (NSString)eventUUID;
- (SUCoreAnalyticsEvent)init;
- (SUCoreAnalyticsEvent)initWithEventName:(id)a3;
- (id)description;
- (void)_queue_removeEventPayloadEntry:(id)a3;
- (void)_queue_setEventPayloadEntry:(id)a3 value:(id)a4;
- (void)_queue_setEventPayloadEntryToNull:(id)a3;
- (void)removeEventPayloadEntry:(id)a3;
- (void)setEventPayloadEntry:(id)a3 value:(id)a4;
- (void)setEventPayloadEntryToNull:(id)a3;
- (void)setEventUUID:(id)a3;
@end

@implementation SUCoreAnalyticsEvent

- (SUCoreAnalyticsEvent)init
{
  return 0;
}

- (SUCoreAnalyticsEvent)initWithEventName:(id)a3
{
  id v5 = a3;
  v17.receiver = self;
  v17.super_class = (Class)SUCoreAnalyticsEvent;
  v6 = [(SUCoreAnalyticsEvent *)&v17 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_eventName, a3);
    v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    mutableEventPayload = v7->_mutableEventPayload;
    v7->_mutableEventPayload = v8;

    v10 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v11 = dispatch_queue_create("com.apple.SUCore.CoreAnalyticsEventQueue", v10);
    stateQueue = v7->_stateQueue;
    v7->_stateQueue = (OS_dispatch_queue *)v11;

    v13 = [MEMORY[0x263F08C38] UUID];
    uint64_t v14 = [v13 UUIDString];
    eventUUID = v7->_eventUUID;
    v7->_eventUUID = (NSString *)v14;
  }
  return v7;
}

- (NSDictionary)eventPayload
{
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_stateQueue);
  uint64_t v7 = 0;
  v8 = &v7;
  uint64_t v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__3;
  dispatch_queue_t v11 = __Block_byref_object_dispose__3;
  id v12 = 0;
  stateQueue = self->_stateQueue;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __36__SUCoreAnalyticsEvent_eventPayload__block_invoke;
  v6[3] = &unk_2640DC360;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(stateQueue, v6);
  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSDictionary *)v4;
}

uint64_t __36__SUCoreAnalyticsEvent_eventPayload__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [NSDictionary dictionaryWithDictionary:*(void *)(*(void *)(a1 + 32) + 16)];

  return MEMORY[0x270F9A758]();
}

- (void)setEventPayloadEntry:(id)a3 value:(id)a4
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_stateQueue);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    stateQueue = self->_stateQueue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __51__SUCoreAnalyticsEvent_setEventPayloadEntry_value___block_invoke;
    block[3] = &unk_2640DCD70;
    block[4] = self;
    id v14 = v6;
    id v15 = v7;
    dispatch_sync(stateQueue, block);
  }
  else
  {
    uint64_t v9 = [MEMORY[0x263F77DE8] sharedLogger];
    v10 = [v9 oslog];

    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      dispatch_queue_t v11 = (objc_class *)objc_opt_class();
      id v12 = NSStringFromClass(v11);
      *(_DWORD *)buf = 138543618;
      id v17 = v6;
      __int16 v18 = 2114;
      v19 = v12;
      _os_log_impl(&dword_20C8EA000, v10, OS_LOG_TYPE_DEFAULT, "Event payload data \"%{public}@\" is unsupported type \"%{public}@\". Supported Types: NSString, NSNumber, NSData, NSDate", buf, 0x16u);
    }
  }
}

uint64_t __51__SUCoreAnalyticsEvent_setEventPayloadEntry_value___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_setEventPayloadEntry:value:", *(void *)(a1 + 40), *(void *)(a1 + 48));
}

- (void)setEventPayloadEntryToNull:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_stateQueue);
  stateQueue = self->_stateQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __51__SUCoreAnalyticsEvent_setEventPayloadEntryToNull___block_invoke;
  v7[3] = &unk_2640DCE98;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(stateQueue, v7);
}

uint64_t __51__SUCoreAnalyticsEvent_setEventPayloadEntryToNull___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_setEventPayloadEntryToNull:", *(void *)(a1 + 40));
}

- (void)removeEventPayloadEntry:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_stateQueue);
  stateQueue = self->_stateQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __48__SUCoreAnalyticsEvent_removeEventPayloadEntry___block_invoke;
  v7[3] = &unk_2640DCE98;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(stateQueue, v7);
}

uint64_t __48__SUCoreAnalyticsEvent_removeEventPayloadEntry___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_removeEventPayloadEntry:", *(void *)(a1 + 40));
}

- (void)_queue_setEventPayloadEntry:(id)a3 value:(id)a4
{
  stateQueue = self->_stateQueue;
  id v7 = a4;
  id v8 = a3;
  dispatch_assert_queue_V2(stateQueue);
  [(NSMutableDictionary *)self->_mutableEventPayload setSafeObject:v7 forKey:v8];
}

- (void)_queue_setEventPayloadEntryToNull:(id)a3
{
  stateQueue = self->_stateQueue;
  id v5 = a3;
  dispatch_assert_queue_V2(stateQueue);
  mutableEventPayload = self->_mutableEventPayload;
  id v7 = [MEMORY[0x263EFF9D0] null];
  [(NSMutableDictionary *)mutableEventPayload setSafeObject:v7 forKey:v5];
}

- (void)_queue_removeEventPayloadEntry:(id)a3
{
  stateQueue = self->_stateQueue;
  id v5 = a3;
  dispatch_assert_queue_V2(stateQueue);
  [(NSMutableDictionary *)self->_mutableEventPayload setObject:0 forKeyedSubscript:v5];
}

- (id)description
{
  v3 = NSString;
  id v4 = [(SUCoreAnalyticsEvent *)self eventName];
  id v5 = [(SUCoreAnalyticsEvent *)self eventUUID];
  id v6 = [(SUCoreAnalyticsEvent *)self eventPayload];
  id v7 = [v3 stringWithFormat:@"EventName: %@ EventUUID: %@ EventPayload: %@", v4, v5, v6];

  return v7;
}

- (NSString)eventName
{
  return self->_eventName;
}

- (NSString)eventUUID
{
  return self->_eventUUID;
}

- (void)setEventUUID:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eventUUID, 0);
  objc_storeStrong((id *)&self->_stateQueue, 0);
  objc_storeStrong((id *)&self->_mutableEventPayload, 0);

  objc_storeStrong((id *)&self->_eventName, 0);
}

@end