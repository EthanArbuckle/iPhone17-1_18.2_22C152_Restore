@interface SUAnalyticsEvent
+ (BOOL)supportsSecureCoding;
- (NSDictionary)eventPayload;
- (NSString)eventName;
- (NSString)eventUUID;
- (SUAnalyticsEvent)initWithCoder:(id)a3;
- (SUAnalyticsEvent)initWithEventName:(id)a3;
- (id)description;
- (void)_queue_removeEventPayloadEntry:(id)a3;
- (void)_queue_setEventPayloadEntry:(id)a3 BOOLValue:(BOOL)a4;
- (void)_queue_setEventPayloadEntry:(id)a3 numberValue:(id)a4;
- (void)_queue_setEventPayloadEntry:(id)a3 stringValue:(id)a4;
- (void)_queue_setEventPayloadEntryToNull:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)removeEventPayloadEntry:(id)a3;
- (void)setEventPayloadEntry:(id)a3 BOOLValue:(BOOL)a4;
- (void)setEventPayloadEntry:(id)a3 numberValue:(id)a4;
- (void)setEventPayloadEntry:(id)a3 stringValue:(id)a4;
- (void)setEventPayloadEntryToNull:(id)a3;
- (void)setEventUUID:(id)a3;
@end

@implementation SUAnalyticsEvent

- (SUAnalyticsEvent)initWithEventName:(id)a3
{
  id v5 = a3;
  v17.receiver = self;
  v17.super_class = (Class)SUAnalyticsEvent;
  v6 = [(SUAnalyticsEvent *)&v17 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_eventName, a3);
    v8 = [MEMORY[0x263F08C38] UUID];
    uint64_t v9 = [v8 UUIDString];
    eventUUID = v7->_eventUUID;
    v7->_eventUUID = (NSString *)v9;

    v11 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    mutableEventPayload = v7->_mutableEventPayload;
    v7->_mutableEventPayload = v11;

    v13 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v14 = dispatch_queue_create("com.apple.SUServices.CoreAnalyticsEventQueue", v13);
    stateQueue = v7->_stateQueue;
    v7->_stateQueue = (OS_dispatch_queue *)v14;
  }
  return v7;
}

- (SUAnalyticsEvent)initWithCoder:(id)a3
{
  id v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)SUAnalyticsEvent;
  id v5 = [(SUAnalyticsEvent *)&v22 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"analyticsEventName"];
    eventName = v5->_eventName;
    v5->_eventName = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"analyticsEventUUID"];
    eventUUID = v5->_eventUUID;
    v5->_eventUUID = (NSString *)v8;

    v10 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0);
    v11 = (void *)MEMORY[0x263EFFA08];
    uint64_t v12 = objc_opt_class();
    uint64_t v13 = objc_opt_class();
    dispatch_queue_t v14 = objc_msgSend(v11, "setWithObjects:", v12, v13, objc_opt_class(), 0);
    v15 = [v4 decodeDictionaryWithKeysOfClasses:v10 objectsOfClasses:v14 forKey:@"analyticsEventPayload"];
    uint64_t v16 = [v15 mutableCopy];
    mutableEventPayload = v5->_mutableEventPayload;
    v5->_mutableEventPayload = (NSMutableDictionary *)v16;

    v18 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v19 = dispatch_queue_create("com.apple.SUServices.CoreAnalyticsEventQueue", v18);
    stateQueue = v5->_stateQueue;
    v5->_stateQueue = (OS_dispatch_queue *)v19;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(SUAnalyticsEvent *)self eventName];
  [v4 encodeObject:v5 forKey:@"analyticsEventName"];

  uint64_t v6 = [(SUAnalyticsEvent *)self eventPayload];
  [v4 encodeObject:v6 forKey:@"analyticsEventPayload"];

  id v7 = [(SUAnalyticsEvent *)self eventUUID];
  [v4 encodeObject:v7 forKey:@"analyticsEventUUID"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSDictionary)eventPayload
{
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_stateQueue);
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__18;
  v11 = __Block_byref_object_dispose__18;
  id v12 = 0;
  stateQueue = self->_stateQueue;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __32__SUAnalyticsEvent_eventPayload__block_invoke;
  v6[3] = &unk_26447C8A0;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(stateQueue, v6);
  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSDictionary *)v4;
}

uint64_t __32__SUAnalyticsEvent_eventPayload__block_invoke(uint64_t a1)
{
  uint64_t v2 = [NSDictionary dictionaryWithDictionary:*(void *)(*(void *)(a1 + 32) + 16)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void *)(v3 + 40);
  *(void *)(v3 + 40) = v2;
  return MEMORY[0x270F9A758](v2, v4);
}

- (void)setEventPayloadEntry:(id)a3 BOOLValue:(BOOL)a4
{
  id v6 = a3;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_stateQueue);
  stateQueue = self->_stateQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __51__SUAnalyticsEvent_setEventPayloadEntry_BOOLValue___block_invoke;
  block[3] = &unk_26447CED8;
  block[4] = self;
  id v10 = v6;
  BOOL v11 = a4;
  id v8 = v6;
  dispatch_sync(stateQueue, block);
}

uint64_t __51__SUAnalyticsEvent_setEventPayloadEntry_BOOLValue___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_setEventPayloadEntry:BOOLValue:", *(void *)(a1 + 40), *(unsigned __int8 *)(a1 + 48));
}

- (void)setEventPayloadEntry:(id)a3 numberValue:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_stateQueue);
  stateQueue = self->_stateQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __53__SUAnalyticsEvent_setEventPayloadEntry_numberValue___block_invoke;
  block[3] = &unk_26447CD70;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_sync(stateQueue, block);
}

uint64_t __53__SUAnalyticsEvent_setEventPayloadEntry_numberValue___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_setEventPayloadEntry:numberValue:", *(void *)(a1 + 40), *(void *)(a1 + 48));
}

- (void)setEventPayloadEntry:(id)a3 stringValue:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_stateQueue);
  stateQueue = self->_stateQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __53__SUAnalyticsEvent_setEventPayloadEntry_stringValue___block_invoke;
  block[3] = &unk_26447CD70;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_sync(stateQueue, block);
}

uint64_t __53__SUAnalyticsEvent_setEventPayloadEntry_stringValue___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_setEventPayloadEntry:stringValue:", *(void *)(a1 + 40), *(void *)(a1 + 48));
}

- (void)setEventPayloadEntryToNull:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_stateQueue);
  stateQueue = self->_stateQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __47__SUAnalyticsEvent_setEventPayloadEntryToNull___block_invoke;
  v7[3] = &unk_26447C8C8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(stateQueue, v7);
}

uint64_t __47__SUAnalyticsEvent_setEventPayloadEntryToNull___block_invoke(uint64_t a1)
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
  v7[2] = __44__SUAnalyticsEvent_removeEventPayloadEntry___block_invoke;
  v7[3] = &unk_26447C8C8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(stateQueue, v7);
}

uint64_t __44__SUAnalyticsEvent_removeEventPayloadEntry___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_removeEventPayloadEntry:", *(void *)(a1 + 40));
}

- (void)_queue_setEventPayloadEntry:(id)a3 BOOLValue:(BOOL)a4
{
  BOOL v4 = a4;
  id v14 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_stateQueue);
  if (v14)
  {
    id v6 = [NSNumber numberWithBool:v4];
    [(NSMutableDictionary *)self->_mutableEventPayload setObject:v6 forKeyedSubscript:v14];
  }
  else
  {
    id v6 = SULogAnalytics();
    SULogErrorForSubsystem(v6, @"invalid key passed to setEventPayloadEntry", v7, v8, v9, v10, v11, v12, v13);
  }
}

- (void)_queue_setEventPayloadEntry:(id)a3 numberValue:(id)a4
{
  id v15 = a3;
  id v6 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_stateQueue);
  if (v15 && v6)
  {
    [(NSMutableDictionary *)self->_mutableEventPayload setObject:v6 forKeyedSubscript:v15];
  }
  else
  {
    uint64_t v7 = SULogAnalytics();
    SULogErrorForSubsystem(v7, @"invalid key/numberValue passed to setEventPayloadEntry", v8, v9, v10, v11, v12, v13, v14);
  }
}

- (void)_queue_setEventPayloadEntry:(id)a3 stringValue:(id)a4
{
  id v15 = a3;
  id v6 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_stateQueue);
  if (v15 && v6)
  {
    [(NSMutableDictionary *)self->_mutableEventPayload setObject:v6 forKeyedSubscript:v15];
  }
  else
  {
    uint64_t v7 = SULogAnalytics();
    SULogErrorForSubsystem(v7, @"invalid key/stringValue passed to setEventPayloadEntry", v8, v9, v10, v11, v12, v13, v14);
  }
}

- (void)_queue_setEventPayloadEntryToNull:(id)a3
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_stateQueue);
  BOOL v4 = SULogAnalytics();
  id v13 = v4;
  if (a3) {
    uint64_t v11 = @"not supported";
  }
  else {
    uint64_t v11 = @"invalid key passed to setEventPayloadEntrytoNull";
  }
  SULogErrorForSubsystem(v4, v11, v5, v6, v7, v8, v9, v10, v12);
}

- (void)_queue_removeEventPayloadEntry:(id)a3
{
  id v12 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_stateQueue);
  if (v12)
  {
    [(NSMutableDictionary *)self->_mutableEventPayload setObject:0 forKeyedSubscript:v12];
  }
  else
  {
    BOOL v4 = SULogAnalytics();
    SULogErrorForSubsystem(v4, @"invalid key passed to removePayloadEntry", v5, v6, v7, v8, v9, v10, v11);
  }
}

- (id)description
{
  uint64_t v3 = NSString;
  BOOL v4 = [(SUAnalyticsEvent *)self eventName];
  uint64_t v5 = [(SUAnalyticsEvent *)self eventUUID];
  uint64_t v6 = [(SUAnalyticsEvent *)self eventPayload];
  uint64_t v7 = [v3 stringWithFormat:@"EventName: %@ EventUUID: %@ EventPayload: %@", v4, v5, v6];

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