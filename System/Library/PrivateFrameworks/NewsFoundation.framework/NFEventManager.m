@interface NFEventManager
- (NFEventManager)init;
- (NSMutableDictionary)triggers;
- (NSMutableSet)events;
- (void)attemptTriggersForCurrentEvent:(id)a3;
- (void)fireEvent:(id)a3;
- (void)handleAlwaysTrigger:(id)a3 event:(id)a4;
- (void)handleOnceTrigger:(id)a3 event:(id)a4;
- (void)triggerAlwaysWhenAllEventsHaveOccurred:(id)a3 block:(id)a4;
- (void)triggerOnAnyEvent:(id)a3 block:(id)a4;
- (void)triggerOnEvent:(id)a3 block:(id)a4;
- (void)triggerOnceWhenAllEventsHaveOccurred:(id)a3 block:(id)a4;
- (void)triggerOnceWhenAnyEventHasOccurred:(id)a3 block:(id)a4;
@end

@implementation NFEventManager

- (void)triggerOnceWhenAllEventsHaveOccurred:(id)a3 block:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [MEMORY[0x263F08B88] isMainThread];
  if (v7 && [v6 count])
  {
    v8 = [NFEventTrigger alloc];
    v9 = [MEMORY[0x263F08C38] UUID];
    v10 = [v9 UUIDString];
    v11 = [(NFEventTrigger *)v8 initWithKey:v10 fireOnce:1 fireOnAny:0 events:v6 block:v7];

    v12 = [(NFEventManager *)self triggers];
    v13 = [(NFEventTrigger *)v11 key];
    [v12 setObject:v11 forKey:v13];
  }
  else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
  {
    -[NFEventManager triggerOnceWhenAllEventsHaveOccurred:block:]();
  }
}

- (NSMutableDictionary)triggers
{
  return self->_triggers;
}

- (NFEventManager)init
{
  v8.receiver = self;
  v8.super_class = (Class)NFEventManager;
  v2 = [(NFEventManager *)&v8 init];
  if (v2)
  {
    v3 = (NSMutableSet *)objc_alloc_init(MEMORY[0x263EFF9C0]);
    events = v2->_events;
    v2->_events = v3;

    v5 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    triggers = v2->_triggers;
    v2->_triggers = v5;
  }
  return v2;
}

- (void)fireEvent:(id)a3
{
  id v4 = a3;
  [MEMORY[0x263F08B88] isMainThread];
  if (v4)
  {
    v5 = [(NFEventManager *)self events];
    [v5 addObject:v4];

    [(NFEventManager *)self attemptTriggersForCurrentEvent:v4];
  }
  else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
  {
    -[NFEventManager fireEvent:]();
  }
}

- (void)triggerAlwaysWhenAllEventsHaveOccurred:(id)a3 block:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [MEMORY[0x263F08B88] isMainThread];
  if (v7 && [v6 count])
  {
    objc_super v8 = [NFEventTrigger alloc];
    v9 = [MEMORY[0x263F08C38] UUID];
    v10 = [v9 UUIDString];
    v11 = [(NFEventTrigger *)v8 initWithKey:v10 fireOnce:0 fireOnAny:0 events:v6 block:v7];

    v12 = [(NFEventManager *)self triggers];
    v13 = [(NFEventTrigger *)v11 key];
    [v12 setObject:v11 forKey:v13];
  }
  else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
  {
    -[NFEventManager triggerAlwaysWhenAllEventsHaveOccurred:block:]();
  }
}

- (void)triggerOnceWhenAnyEventHasOccurred:(id)a3 block:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [MEMORY[0x263F08B88] isMainThread];
  if (v7 && [v6 count])
  {
    objc_super v8 = [NFEventTrigger alloc];
    v9 = [MEMORY[0x263F08C38] UUID];
    v10 = [v9 UUIDString];
    v11 = [(NFEventTrigger *)v8 initWithKey:v10 fireOnce:1 fireOnAny:1 events:v6 block:v7];

    v12 = [(NFEventManager *)self triggers];
    v13 = [(NFEventTrigger *)v11 key];
    [v12 setObject:v11 forKey:v13];
  }
  else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
  {
    -[NFEventManager triggerOnceWhenAnyEventHasOccurred:block:]();
  }
}

- (void)triggerOnEvent:(id)a3 block:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [MEMORY[0x263F08B88] isMainThread];
  if (v6 && v7)
  {
    objc_super v8 = [MEMORY[0x263EFFA08] setWithObject:v6];
    [(NFEventManager *)self triggerOnAnyEvent:v8 block:v7];
  }
  else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
  {
    -[NFEventManager triggerOnEvent:block:]();
  }
}

- (void)triggerOnAnyEvent:(id)a3 block:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [MEMORY[0x263F08B88] isMainThread];
  if (v6 && v7 && [v6 count])
  {
    objc_super v8 = [NFEventTrigger alloc];
    v9 = [MEMORY[0x263F08C38] UUID];
    v10 = [v9 UUIDString];
    v11 = [(NFEventTrigger *)v8 initWithKey:v10 fireOnce:0 fireOnAny:1 events:v6 block:v7];

    v12 = [(NFEventManager *)self triggers];
    v13 = [(NFEventTrigger *)v11 key];
    [v12 setObject:v11 forKey:v13];
  }
  else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
  {
    -[NFEventManager triggerOnAnyEvent:block:]();
  }
}

- (void)attemptTriggersForCurrentEvent:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  v5 = [(NFEventManager *)self triggers];
  id v6 = [v5 allValues];

  uint64_t v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        if ([v11 fireOnce]) {
          [(NFEventManager *)self handleOnceTrigger:v11 event:v4];
        }
        else {
          [(NFEventManager *)self handleAlwaysTrigger:v11 event:v4];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v8);
  }
}

- (void)handleOnceTrigger:(id)a3 event:(id)a4
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if ([v6 fireOnAny])
  {
    uint64_t v8 = [v6 events];
    char v9 = [v8 containsObject:v7];

    if ((v9 & 1) == 0) {
      goto LABEL_15;
    }
  }
  else
  {
    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    objc_msgSend(v6, "events", 0);
    v10 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    uint64_t v11 = [v10 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v20;
LABEL_6:
      uint64_t v14 = 0;
      while (1)
      {
        if (*(void *)v20 != v13) {
          objc_enumerationMutation(v10);
        }
        uint64_t v15 = *(void *)(*((void *)&v19 + 1) + 8 * v14);
        v16 = [(NFEventManager *)self events];
        LODWORD(v15) = [v16 containsObject:v15];

        if (!v15) {
          goto LABEL_14;
        }
        if (v12 == ++v14)
        {
          uint64_t v12 = [v10 countByEnumeratingWithState:&v19 objects:v23 count:16];
          if (v12) {
            goto LABEL_6;
          }
          break;
        }
      }
    }
  }
  uint64_t v17 = [(NFEventManager *)self triggers];
  v18 = [v6 key];
  [v17 removeObjectForKey:v18];

  v10 = [v6 block];
  v10[2]();
LABEL_14:

LABEL_15:
}

- (void)handleAlwaysTrigger:(id)a3 event:(id)a4
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if ([v6 fireOnAny])
  {
    uint64_t v8 = [v6 events];
    char v9 = [v8 containsObject:v7];

    if ((v9 & 1) == 0) {
      goto LABEL_15;
    }
  }
  else
  {
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    objc_msgSend(v6, "events", 0);
    v10 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    uint64_t v11 = [v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v18;
LABEL_6:
      uint64_t v14 = 0;
      while (1)
      {
        if (*(void *)v18 != v13) {
          objc_enumerationMutation(v10);
        }
        uint64_t v15 = *(void *)(*((void *)&v17 + 1) + 8 * v14);
        v16 = [(NFEventManager *)self events];
        LODWORD(v15) = [v16 containsObject:v15];

        if (!v15) {
          goto LABEL_14;
        }
        if (v12 == ++v14)
        {
          uint64_t v12 = [v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
          if (v12) {
            goto LABEL_6;
          }
          break;
        }
      }
    }
  }
  v10 = [v6 block];
  v10[2]();
LABEL_14:

LABEL_15:
}

- (NSMutableSet)events
{
  return self->_events;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_triggers, 0);
  objc_storeStrong((id *)&self->_events, 0);
}

- (void)fireEvent:.cold.1()
{
  v0 = (void *)[[NSString alloc] initWithFormat:@"You cannot fire a nil event"];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2(&dword_21DE44000, &_os_log_internal, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, 2u);
}

- (void)triggerOnceWhenAllEventsHaveOccurred:block:.cold.1()
{
  v0 = (void *)[[NSString alloc] initWithFormat:@"There is no point of creating a trigger without a block or events"];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2(&dword_21DE44000, &_os_log_internal, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, 2u);
}

- (void)triggerAlwaysWhenAllEventsHaveOccurred:block:.cold.1()
{
  v0 = (void *)[[NSString alloc] initWithFormat:@"There is no point of creating a trigger without a block or events"];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2(&dword_21DE44000, &_os_log_internal, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, 2u);
}

- (void)triggerOnceWhenAnyEventHasOccurred:block:.cold.1()
{
  v0 = (void *)[[NSString alloc] initWithFormat:@"There is no point of creating a trigger without a block or events"];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2(&dword_21DE44000, &_os_log_internal, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, 2u);
}

- (void)triggerOnEvent:block:.cold.1()
{
  v0 = (void *)[[NSString alloc] initWithFormat:@"There is no point of creating a trigger without a block or event"];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2(&dword_21DE44000, &_os_log_internal, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, 2u);
}

- (void)triggerOnAnyEvent:block:.cold.1()
{
  v0 = (void *)[[NSString alloc] initWithFormat:@"There is no point of creating a trigger without a block or event"];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2(&dword_21DE44000, &_os_log_internal, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, 2u);
}

@end