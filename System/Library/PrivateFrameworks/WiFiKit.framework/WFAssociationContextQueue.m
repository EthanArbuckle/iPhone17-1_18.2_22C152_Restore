@interface WFAssociationContextQueue
- (NSMutableArray)queue;
- (WFAssociationContextQueue)init;
- (id)peek;
- (id)pop;
- (void)_dumpQueue;
- (void)push:(id)a3;
- (void)removeAll;
- (void)setQueue:(id)a3;
@end

@implementation WFAssociationContextQueue

- (WFAssociationContextQueue)init
{
  v6.receiver = self;
  v6.super_class = (Class)WFAssociationContextQueue;
  v2 = [(WFAssociationContextQueue *)&v6 init];
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    queue = v2->_queue;
    v2->_queue = v3;
  }
  return v2;
}

- (id)peek
{
  v3 = [(WFAssociationContextQueue *)self queue];
  objc_sync_enter(v3);
  v4 = [(WFAssociationContextQueue *)self queue];
  v5 = [v4 firstObject];

  objc_sync_exit(v3);
  return v5;
}

- (void)push:(id)a3
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [(WFAssociationContextQueue *)self queue];
  objc_sync_enter(v5);
  objc_super v6 = WFLogForCategory(5uLL);
  os_log_type_t v7 = OSLogForWFLogLevel(4uLL);
  if ((unint64_t)WFCurrentLogLevel() >= 4 && v6 && os_log_type_enabled(v6, v7))
  {
    int v9 = 138412290;
    id v10 = v4;
    _os_log_impl(&dword_226071000, v6, v7, "adding %@ to association queue", (uint8_t *)&v9, 0xCu);
  }

  v8 = [(WFAssociationContextQueue *)self queue];
  [v8 addObject:v4];

  objc_sync_exit(v5);
}

- (id)pop
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  v3 = [(WFAssociationContextQueue *)self peek];
  if (v3)
  {
    id v4 = [(WFAssociationContextQueue *)self queue];
    objc_sync_enter(v4);
    v5 = WFLogForCategory(5uLL);
    os_log_type_t v6 = OSLogForWFLogLevel(4uLL);
    if ((unint64_t)WFCurrentLogLevel() >= 4 && v5 && os_log_type_enabled(v5, v6))
    {
      int v10 = 138412290;
      uint64_t v11 = v3;
      _os_log_impl(&dword_226071000, v5, v6, "removing %@ from association queue", (uint8_t *)&v10, 0xCu);
    }

    os_log_type_t v7 = [(WFAssociationContextQueue *)self queue];
    [v7 removeObject:v3];

    objc_sync_exit(v4);
  }
  else
  {
    id v4 = WFLogForCategory(0);
    os_log_type_t v9 = OSLogForWFLogLevel(3uLL);
    if ((unint64_t)WFCurrentLogLevel() >= 3 && v4 && os_log_type_enabled(v4, v9))
    {
      int v10 = 136315138;
      uint64_t v11 = "-[WFAssociationContextQueue pop]";
      _os_log_impl(&dword_226071000, v4, v9, "%s: attempted to pop when queue is empty", (uint8_t *)&v10, 0xCu);
    }
  }

  return v3;
}

- (void)removeAll
{
  v3 = WFLogForCategory(5uLL);
  os_log_type_t v4 = OSLogForWFLogLevel(4uLL);
  if ((unint64_t)WFCurrentLogLevel() >= 4 && v3 && os_log_type_enabled(v3, v4))
  {
    *(_WORD *)os_log_type_t v7 = 0;
    _os_log_impl(&dword_226071000, v3, v4, "removing all objects in association queue", v7, 2u);
  }

  [(WFAssociationContextQueue *)self _dumpQueue];
  v5 = [(WFAssociationContextQueue *)self queue];
  objc_sync_enter(v5);
  os_log_type_t v6 = [(WFAssociationContextQueue *)self queue];
  [v6 removeAllObjects];

  objc_sync_exit(v5);
}

- (void)_dumpQueue
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v2 = [(WFAssociationContextQueue *)self queue];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v10 objects:v16 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v11 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void *)(*((void *)&v10 + 1) + 8 * i);
        v8 = WFLogForCategory(5uLL);
        os_log_type_t v9 = OSLogForWFLogLevel(1uLL);
        if (WFCurrentLogLevel() && v8 && os_log_type_enabled(v8, v9))
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v15 = v7;
          _os_log_impl(&dword_226071000, v8, v9, "%@", buf, 0xCu);
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v10 objects:v16 count:16];
    }
    while (v4);
  }
}

- (NSMutableArray)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (void).cxx_destruct
{
}

@end