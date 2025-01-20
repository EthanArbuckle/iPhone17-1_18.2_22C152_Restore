@interface NTSourceAvailabilityManager
- (Class)preferredSourceFetchDescriptorClass;
- (NSOrderedSet)availabilityEntriesInPreferredOrder;
- (NTSourceAvailabilityManager)init;
- (NTSourceAvailabilityManager)initWithAvailabilityEntriesInPreferredOrder:(id)a3 queue:(id)a4;
- (OS_dispatch_queue)queue;
- (id)preferredSourceChangedNotificationBlock;
- (void)_recomputePreferredAvailableTodayResultsSource;
- (void)_setPreferredAvailableTodayResultsSource:(Class)a3;
- (void)setAvailabilityEntriesInPreferredOrder:(id)a3;
- (void)setPreferredSourceChangedNotificationBlock:(id)a3;
- (void)setPreferredSourceFetchDescriptorClass:(Class)a3;
- (void)setQueue:(id)a3;
@end

@implementation NTSourceAvailabilityManager

- (NSOrderedSet)availabilityEntriesInPreferredOrder
{
  return self->_availabilityEntriesInPreferredOrder;
}

- (NTSourceAvailabilityManager)init
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
  {
    v2 = (void *)[[NSString alloc] initWithFormat:@"Do not call method"];
    *(_DWORD *)buf = 136315906;
    v8 = "-[NTSourceAvailabilityManager init]";
    __int16 v9 = 2080;
    v10 = "NTSourceAvailabilityManager.m";
    __int16 v11 = 1024;
    int v12 = 26;
    __int16 v13 = 2114;
    v14 = v2;
    _os_log_error_impl(&dword_22592C000, &_os_log_internal, OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  v3 = (void *)MEMORY[0x263EFF940];
  uint64_t v4 = *MEMORY[0x263EFF498];
  v5 = [NSString stringWithFormat:@"%@: %s", @"Do not call method", "-[NTSourceAvailabilityManager init]"];
  id v6 = [v3 exceptionWithName:v4 reason:v5 userInfo:0];

  objc_exception_throw(v6);
}

- (NTSourceAvailabilityManager)initWithAvailabilityEntriesInPreferredOrder:(id)a3 queue:(id)a4
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if (!v6 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    -[NTSourceAvailabilityManager initWithAvailabilityEntriesInPreferredOrder:queue:]();
  }
  if (!objc_msgSend(v6, "count", v6) && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    -[NTSourceAvailabilityManager initWithAvailabilityEntriesInPreferredOrder:queue:]();
  }
  v26.receiver = self;
  v26.super_class = (Class)NTSourceAvailabilityManager;
  val = [(NTSourceAvailabilityManager *)&v26 init];
  if (val)
  {
    uint64_t v8 = [v16 copy];
    availabilityEntriesInPreferredOrder = val->_availabilityEntriesInPreferredOrder;
    val->_availabilityEntriesInPreferredOrder = (NSOrderedSet *)v8;

    objc_storeStrong((id *)&val->_queue, a4);
    objc_initWeak(&location, val);
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    id v10 = v16;
    uint64_t v11 = [v10 countByEnumeratingWithState:&v21 objects:v27 count:16];
    if (v11)
    {
      uint64_t v12 = *(void *)v22;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v22 != v12) {
            objc_enumerationMutation(v10);
          }
          v14 = *(void **)(*((void *)&v21 + 1) + 8 * i);
          v18[0] = MEMORY[0x263EF8330];
          v18[1] = 3221225472;
          v18[2] = __81__NTSourceAvailabilityManager_initWithAvailabilityEntriesInPreferredOrder_queue___block_invoke;
          v18[3] = &unk_26475D0A0;
          id v19 = v7;
          objc_copyWeak(&v20, &location);
          [v14 setAvailabilityChangedNotificationBlock:v18];
          objc_destroyWeak(&v20);
        }
        uint64_t v11 = [v10 countByEnumeratingWithState:&v21 objects:v27 count:16];
      }
      while (v11);
    }

    [(NTSourceAvailabilityManager *)val _recomputePreferredAvailableTodayResultsSource];
    objc_destroyWeak(&location);
  }

  return val;
}

void __81__NTSourceAvailabilityManager_initWithAvailabilityEntriesInPreferredOrder_queue___block_invoke(uint64_t a1)
{
  v1 = *(NSObject **)(a1 + 32);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __81__NTSourceAvailabilityManager_initWithAvailabilityEntriesInPreferredOrder_queue___block_invoke_2;
  block[3] = &unk_26475D078;
  objc_copyWeak(&v3, (id *)(a1 + 40));
  dispatch_async(v1, block);
  objc_destroyWeak(&v3);
}

void __81__NTSourceAvailabilityManager_initWithAvailabilityEntriesInPreferredOrder_queue___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _recomputePreferredAvailableTodayResultsSource];
}

- (void)setPreferredSourceChangedNotificationBlock:(id)a3
{
  uint64_t v4 = (void *)[a3 copy];
  id preferredSourceChangedNotificationBlock = self->_preferredSourceChangedNotificationBlock;
  self->_id preferredSourceChangedNotificationBlock = v4;

  MEMORY[0x270F9A758](v4, preferredSourceChangedNotificationBlock);
}

- (id)preferredSourceChangedNotificationBlock
{
  v2 = (void *)MEMORY[0x22A638590](self->_preferredSourceChangedNotificationBlock, a2);

  return v2;
}

- (void)_recomputePreferredAvailableTodayResultsSource
{
  id v5 = [(NTSourceAvailabilityManager *)self availabilityEntriesInPreferredOrder];
  uint64_t v3 = [v5 indexOfObjectPassingTest:&__block_literal_global_11];
  if (v3 == 0x7FFFFFFFFFFFFFFFLL)
  {
    [(NTSourceAvailabilityManager *)self _setPreferredAvailableTodayResultsSource:0];
  }
  else
  {
    uint64_t v4 = [v5 objectAtIndexedSubscript:v3];
    -[NTSourceAvailabilityManager _setPreferredAvailableTodayResultsSource:](self, "_setPreferredAvailableTodayResultsSource:", [v4 todayResultsFetchDescriptorClass]);
  }
}

uint64_t __77__NTSourceAvailabilityManager__recomputePreferredAvailableTodayResultsSource__block_invoke(uint64_t a1, void *a2)
{
  return [a2 isAvailable];
}

- (void)_setPreferredAvailableTodayResultsSource:(Class)a3
{
  if ([(NTSourceAvailabilityManager *)self preferredSourceFetchDescriptorClass] != a3)
  {
    [(NTSourceAvailabilityManager *)self setPreferredSourceFetchDescriptorClass:a3];
    id v5 = [(NTSourceAvailabilityManager *)self preferredSourceChangedNotificationBlock];

    if (v5)
    {
      id v6 = [(NTSourceAvailabilityManager *)self preferredSourceChangedNotificationBlock];
      v6[2]();
    }
  }
}

- (Class)preferredSourceFetchDescriptorClass
{
  return self->_preferredSourceFetchDescriptorClass;
}

- (void)setPreferredSourceFetchDescriptorClass:(Class)a3
{
  self->_preferredSourceFetchDescriptorClass = a3;
}

- (void)setAvailabilityEntriesInPreferredOrder:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_availabilityEntriesInPreferredOrder, 0);

  objc_storeStrong(&self->_preferredSourceChangedNotificationBlock, 0);
}

- (void)initWithAvailabilityEntriesInPreferredOrder:queue:.cold.1()
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  v0 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "availabilityEntries.count > 0");
  *(_DWORD *)buf = 136315906;
  v2 = "-[NTSourceAvailabilityManager initWithAvailabilityEntriesInPreferredOrder:queue:]";
  __int16 v3 = 2080;
  uint64_t v4 = "NTSourceAvailabilityManager.m";
  __int16 v5 = 1024;
  OUTLINED_FUNCTION_0();
  _os_log_error_impl(&dword_22592C000, &_os_log_internal, OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
}

- (void)initWithAvailabilityEntriesInPreferredOrder:queue:.cold.2()
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  v0 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "availabilityEntries");
  *(_DWORD *)buf = 136315906;
  v2 = "-[NTSourceAvailabilityManager initWithAvailabilityEntriesInPreferredOrder:queue:]";
  __int16 v3 = 2080;
  uint64_t v4 = "NTSourceAvailabilityManager.m";
  __int16 v5 = 1024;
  OUTLINED_FUNCTION_0();
  _os_log_error_impl(&dword_22592C000, &_os_log_internal, OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
}

@end