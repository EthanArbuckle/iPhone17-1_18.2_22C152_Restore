@interface MTPageEventHandler
- (NSMutableArray)trackedPageHistory;
- (id)eventType;
- (id)eventVersion:(id)a3;
- (id)knownFields;
- (id)pageHistory:(id)a3;
- (void)didCreateMetricsData:(id)a3;
- (void)setTrackedPageHistory:(id)a3;
- (void)updatePageHistoryWithPage:(id)a3;
@end

@implementation MTPageEventHandler

- (NSMutableArray)trackedPageHistory
{
  trackedPageHistory = self->_trackedPageHistory;
  if (!trackedPageHistory)
  {
    v4 = (NSMutableArray *)objc_opt_new();
    v5 = self->_trackedPageHistory;
    self->_trackedPageHistory = v4;

    trackedPageHistory = self->_trackedPageHistory;
  }

  return trackedPageHistory;
}

- (id)knownFields
{
  v10[6] = *MEMORY[0x263EF8340];
  v3 = [(MTEventDataProvider *)self delegate];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    v5 = [(MTEventDataProvider *)self delegate];
    v6 = [v5 knownFields];
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)MTPageEventHandler;
    v5 = [(MTEventHandler *)&v9 knownFields];
    v10[0] = @"extRefUrl";
    v10[1] = @"refApp";
    v10[2] = @"pageHistory";
    v10[3] = @"refUrl";
    v10[4] = @"searchFilters";
    v10[5] = @"searchTerm";
    v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v10 count:6];
    v6 = [v5 arrayByAddingObjectsFromArray:v7];
  }

  return v6;
}

- (id)eventType
{
  v6.receiver = self;
  v6.super_class = (Class)MTPageEventHandler;
  v2 = [(MTEventHandler *)&v6 eventType];
  v3 = v2;
  if (!v2) {
    v2 = @"page";
  }
  char v4 = v2;

  return v4;
}

- (id)eventVersion:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)MTPageEventHandler;
  v3 = [(MTEventHandler *)&v7 eventVersion:a3];
  char v4 = v3;
  if (!v3) {
    v3 = &unk_26C96FD00;
  }
  id v5 = v3;

  return v5;
}

- (id)pageHistory:(id)a3
{
  id v4 = a3;
  id v5 = [(MTEventDataProvider *)self delegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    objc_super v7 = [(MTEventDataProvider *)self delegate];
    v8 = [(MTPageEventHandler *)v7 pageHistory:v4];
  }
  else
  {
    objc_super v9 = [v4 objectForKeyedSubscript:@"pageHistory"];

    if (v9)
    {
      v8 = [v4 objectForKeyedSubscript:@"pageHistory"];
      goto LABEL_7;
    }
    objc_super v7 = self;
    objc_sync_enter(v7);
    v10 = [(MTPageEventHandler *)v7 trackedPageHistory];
    v8 = (void *)[v10 copy];

    objc_sync_exit(v7);
  }

LABEL_7:

  return v8;
}

- (void)updatePageHistoryWithPage:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v10 = v4;
    id v5 = self;
    objc_sync_enter(v5);
    char v6 = [(MTPageEventHandler *)v5 trackedPageHistory];
    unint64_t v7 = [v6 count];

    if (v7 >= 5)
    {
      v8 = [(MTPageEventHandler *)v5 trackedPageHistory];
      [v8 removeObjectAtIndex:0];
    }
    objc_super v9 = [(MTPageEventHandler *)v5 trackedPageHistory];
    [v9 addObject:v10];

    objc_sync_exit(v5);
    id v4 = v10;
  }
}

- (void)didCreateMetricsData:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __43__MTPageEventHandler_didCreateMetricsData___block_invoke;
  v5[3] = &unk_26430F7D0;
  objc_copyWeak(&v6, &location);
  [v4 addPostProcessingBlock:v5];
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

void __43__MTPageEventHandler_didCreateMetricsData___block_invoke(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  id v4 = [v3 objectForKeyedSubscript:@"page"];

  [WeakRetained updatePageHistoryWithPage:v4];
}

- (void)setTrackedPageHistory:(id)a3
{
}

- (void).cxx_destruct
{
}

@end