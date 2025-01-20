@interface WFTriggerNotificationDebouncer
- (NSMutableDictionary)notificationItemTable;
- (OS_dispatch_queue)queue;
- (WFTriggerNotificationDebouncer)init;
- (WFTriggerNotificationDebouncerDelegate)delegate;
- (void)addEventsWithIdentifiers:(id)a3 configuredTrigger:(id)a4 workflowReference:(id)a5;
- (void)debouncerDidFire:(id)a3;
- (void)setDelegate:(id)a3;
@end

@implementation WFTriggerNotificationDebouncer

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_notificationItemTable, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (NSMutableDictionary)notificationItemTable
{
  return self->_notificationItemTable;
}

- (void)setDelegate:(id)a3
{
}

- (WFTriggerNotificationDebouncerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (WFTriggerNotificationDebouncerDelegate *)WeakRetained;
}

- (void)debouncerDidFire:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(WFTriggerNotificationDebouncer *)self queue];
  dispatch_assert_queue_V2(v5);

  v6 = [v4 userInfo];

  if (v6)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v7 = v6;
    }
    else {
      v7 = 0;
    }
  }
  else
  {
    v7 = 0;
  }
  id v8 = v7;

  v9 = [(WFTriggerNotificationDebouncer *)self notificationItemTable];
  v10 = [v9 objectForKey:v8];

  v11 = getWFTriggersLogObject();
  v12 = v11;
  if (v10)
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      int v18 = 136315394;
      v19 = "-[WFTriggerNotificationDebouncer debouncerDidFire:]";
      __int16 v20 = 2114;
      id v21 = v10;
      _os_log_impl(&dword_1C7D7E000, v12, OS_LOG_TYPE_DEBUG, "%s Debouncer fired with notification item: %{public}@", (uint8_t *)&v18, 0x16u);
    }

    v12 = [(WFTriggerNotificationDebouncer *)self delegate];
    v13 = [v10 configuredTrigger];
    v14 = [v10 reference];
    v15 = [v10 triggerEventIDs];
    v16 = [v15 allObjects];
    [v12 postNotificationForTrigger:v13 workflowReference:v14 pendingTriggerEventIDs:v16];
  }
  else if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
  {
    int v18 = 136315394;
    v19 = "-[WFTriggerNotificationDebouncer debouncerDidFire:]";
    __int16 v20 = 2114;
    id v21 = v8;
    _os_log_impl(&dword_1C7D7E000, v12, OS_LOG_TYPE_FAULT, "%s No WFTriggerNotificationDebouncerItem item found for trigger identifier: %{public}@", (uint8_t *)&v18, 0x16u);
  }

  v17 = [(WFTriggerNotificationDebouncer *)self notificationItemTable];
  [v17 removeObjectForKey:v8];
}

- (void)addEventsWithIdentifiers:(id)a3 configuredTrigger:(id)a4 workflowReference:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = [(WFTriggerNotificationDebouncer *)self queue];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __95__WFTriggerNotificationDebouncer_addEventsWithIdentifiers_configuredTrigger_workflowReference___block_invoke;
  v15[3] = &unk_1E6540240;
  id v16 = v8;
  id v17 = v9;
  int v18 = self;
  id v19 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(v11, v15);
}

void __95__WFTriggerNotificationDebouncer_addEventsWithIdentifiers_configuredTrigger_workflowReference___block_invoke(uint64_t a1)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  v2 = getWFTriggersLogObject();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    v3 = *(WFTriggerNotificationDebouncerItem **)(a1 + 32);
    int v20 = 136315394;
    id v21 = "-[WFTriggerNotificationDebouncer addEventsWithIdentifiers:configuredTrigger:workflowReference:]_block_invoke";
    __int16 v22 = 2112;
    v23 = v3;
    _os_log_impl(&dword_1C7D7E000, v2, OS_LOG_TYPE_DEBUG, "%s Adding eventIDs: %@", (uint8_t *)&v20, 0x16u);
  }

  id v4 = [*(id *)(a1 + 40) identifier];
  v5 = [*(id *)(a1 + 48) notificationItemTable];
  v6 = [v5 objectForKey:v4];

  if (v6)
  {
    v7 = [v6 triggerEventIDs];
    id v8 = [v7 setByAddingObjectsFromArray:*(void *)(a1 + 32)];

    id v9 = [WFTriggerNotificationDebouncerItem alloc];
    uint64_t v10 = *(void *)(a1 + 40);
    uint64_t v11 = *(void *)(a1 + 56);
    id v12 = [v6 debouncer];
    id v13 = [(WFTriggerNotificationDebouncerItem *)v9 initWithConfiguredTrigger:v10 reference:v11 triggerEventIDs:v8 debouncer:v12];
  }
  else
  {
    id v14 = getWFTriggersLogObject();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      int v20 = 136315138;
      id v21 = "-[WFTriggerNotificationDebouncer addEventsWithIdentifiers:configuredTrigger:workflowReference:]_block_invoke";
      _os_log_impl(&dword_1C7D7E000, v14, OS_LOG_TYPE_DEBUG, "%s Creating a new notification item and debouncer, because none were found", (uint8_t *)&v20, 0xCu);
    }

    id v15 = objc_alloc(MEMORY[0x1E4FB71B8]);
    id v16 = [*(id *)(a1 + 48) queue];
    id v8 = (void *)[v15 initWithDelay:v16 maximumDelay:v4 queue:0 userInfo:4.0 unboundedFiringReasons:0.0];

    [v8 addTarget:*(void *)(a1 + 48) action:sel_debouncerDidFire_];
    id v12 = [MEMORY[0x1E4F1CAD0] setWithArray:*(void *)(a1 + 32)];
    id v13 = [[WFTriggerNotificationDebouncerItem alloc] initWithConfiguredTrigger:*(void *)(a1 + 40) reference:*(void *)(a1 + 56) triggerEventIDs:v12 debouncer:v8];
  }

  id v17 = getWFTriggersLogObject();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
  {
    int v20 = 136315394;
    id v21 = "-[WFTriggerNotificationDebouncer addEventsWithIdentifiers:configuredTrigger:workflowReference:]_block_invoke";
    __int16 v22 = 2114;
    v23 = v13;
    _os_log_impl(&dword_1C7D7E000, v17, OS_LOG_TYPE_DEBUG, "%s Poking debouncer with notification item: %{public}@", (uint8_t *)&v20, 0x16u);
  }

  int v18 = [*(id *)(a1 + 48) notificationItemTable];
  [v18 setObject:v13 forKey:v4];

  id v19 = [(WFTriggerNotificationDebouncerItem *)v13 debouncer];
  [v19 poke];
}

- (WFTriggerNotificationDebouncer)init
{
  v11.receiver = self;
  v11.super_class = (Class)WFTriggerNotificationDebouncer;
  v2 = [(WFTriggerNotificationDebouncer *)&v11 init];
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    notificationItemTable = v2->_notificationItemTable;
    v2->_notificationItemTable = v3;

    v5 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v6 = dispatch_queue_attr_make_with_qos_class(v5, QOS_CLASS_DEFAULT, 0);
    dispatch_queue_t v7 = dispatch_queue_create("com.apple.shortcuts.WFTriggerNotificationDebouncer", v6);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v7;

    id v9 = v2;
  }

  return v2;
}

@end