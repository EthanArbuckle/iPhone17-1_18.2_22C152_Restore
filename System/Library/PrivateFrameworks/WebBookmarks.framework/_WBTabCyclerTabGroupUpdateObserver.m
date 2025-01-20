@interface _WBTabCyclerTabGroupUpdateObserver
+ (id)observeTabGroupManager:(id)a3 waitForTabGroups:(BOOL)a4 handler:(id)a5;
- (_WBTabCyclerTabGroupUpdateObserver)initWithTabGroupManager:(id)a3 handler:(id)a4;
- (void)_timeout;
- (void)startObserving;
- (void)tabGroupManagerDidUpdateTabGroups:(id)a3;
@end

@implementation _WBTabCyclerTabGroupUpdateObserver

+ (id)observeTabGroupManager:(id)a3 waitForTabGroups:(BOOL)a4 handler:(id)a5
{
  id v7 = a5;
  id v8 = a3;
  v9 = [[_WBTabCyclerTabGroupUpdateObserver alloc] initWithTabGroupManager:v8 handler:v7];

  v9->_waitForTabGroups = a4;
  [(_WBTabCyclerTabGroupUpdateObserver *)v9 startObserving];
  return v9;
}

- (_WBTabCyclerTabGroupUpdateObserver)initWithTabGroupManager:(id)a3 handler:(id)a4
{
  id v7 = a3;
  id v8 = (void (**)(id, void))a4;
  v15.receiver = self;
  v15.super_class = (Class)_WBTabCyclerTabGroupUpdateObserver;
  v9 = [(_WBTabCyclerTabGroupUpdateObserver *)&v15 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_tabGroupManager, a3);
    uint64_t v11 = MEMORY[0x21D4A1230](v8);
    id handler = v10->_handler;
    v10->_id handler = (id)v11;

    v13 = v10;
  }
  else
  {
    v8[2](v8, 0);
  }

  return v10;
}

- (void)startObserving
{
  objc_initWeak(&location, self);
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = __52___WBTabCyclerTabGroupUpdateObserver_startObserving__block_invoke;
  v2[3] = &unk_2643D9D58;
  objc_copyWeak(&v3, &location);
  dispatch_async(MEMORY[0x263EF83A0], v2);
  objc_destroyWeak(&v3);
  objc_destroyWeak(&location);
}

- (void)_timeout
{
  id v3 = WBS_LOG_CHANNEL_PREFIXCycler();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_21C043000, v3, OS_LOG_TYPE_INFO, "Timed out while waiting for Tab Group updates", v4, 2u);
  }
  [(WBTabGroupManager *)self->_tabGroupManager removeTabGroupObserver:self];
  (*((void (**)(void))self->_handler + 2))();
}

- (void)tabGroupManagerDidUpdateTabGroups:(id)a3
{
  id v4 = a3;
  v5 = WBS_LOG_CHANNEL_PREFIXCycler();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21C043000, v5, OS_LOG_TYPE_INFO, "Received notification of Tab Group updates", buf, 2u);
  }
  if (self->_waitForTabGroups
    && ([v4 allNamedTabGroupsUnsorted],
        v6 = objc_claimAutoreleasedReturnValue(),
        uint64_t v7 = [v6 count],
        v6,
        !v7))
  {
    id v8 = WBS_LOG_CHANNEL_PREFIXCycler();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl(&dword_21C043000, v8, OS_LOG_TYPE_INFO, "Expected tab groups after update but none were found. Continuing to wait.", v9, 2u);
    }
  }
  else
  {
    [(NSTimer *)self->_timeoutTimer invalidate];
    [(WBTabGroupManager *)self->_tabGroupManager removeTabGroupObserver:self];
    (*((void (**)(void))self->_handler + 2))();
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timeoutTimer, 0);
  objc_storeStrong((id *)&self->_tabGroupManager, 0);
  objc_storeStrong(&self->_handler, 0);
}

@end