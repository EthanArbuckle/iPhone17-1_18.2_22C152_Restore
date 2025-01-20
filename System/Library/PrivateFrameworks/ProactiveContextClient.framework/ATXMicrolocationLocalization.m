@interface ATXMicrolocationLocalization
- (ATXMicrolocationLocalization)init;
- (void)_triggerMicroLocationLocalization;
- (void)initiateLocalization;
@end

@implementation ATXMicrolocationLocalization

- (ATXMicrolocationLocalization)init
{
  v14.receiver = self;
  v14.super_class = (Class)ATXMicrolocationLocalization;
  v2 = [(ATXMicrolocationLocalization *)&v14 init];
  if (v2)
  {
    objc_initWeak(&location, v2);
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.proactive.ProactiveContextClient.ATXMicrolocationLocalization.queue", v3);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v4;

    id v6 = objc_alloc(MEMORY[0x1E4F93B98]);
    v7 = v2->_queue;
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __36__ATXMicrolocationLocalization_init__block_invoke;
    v11[3] = &unk_1E6BE68A8;
    objc_copyWeak(&v12, &location);
    uint64_t v8 = [v6 initWithQueue:v7 operation:v11];
    coalescingTimer = v2->_coalescingTimer;
    v2->_coalescingTimer = (_PASSimpleCoalescingTimer *)v8;

    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }
  return v2;
}

void __36__ATXMicrolocationLocalization_init__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _triggerMicroLocationLocalization];
}

- (void)initiateLocalization
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  dispatch_queue_t v4 = __atxlog_handle_modes();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = objc_opt_class();
    id v6 = v5;
    v7 = NSStringFromSelector(a2);
    int v8 = 138412802;
    v9 = v5;
    __int16 v10 = 2112;
    v11 = v7;
    __int16 v12 = 2048;
    uint64_t v13 = 0x4082C00000000000;
    _os_log_impl(&dword_1DAFF9000, v4, OS_LOG_TYPE_DEFAULT, "[%@][%@] Initiating localization scan in %f seconds", (uint8_t *)&v8, 0x20u);
  }
  [(_PASSimpleCoalescingTimer *)self->_coalescingTimer runAfterDelaySeconds:1 coalescingBehavior:600.0];
}

- (void)_triggerMicroLocationLocalization
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  v3 = __atxlog_handle_modes();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    dispatch_queue_t v4 = objc_opt_class();
    id v5 = v4;
    id v6 = NSStringFromSelector(a2);
    int v7 = 138412546;
    int v8 = v4;
    __int16 v9 = 2112;
    __int16 v10 = v6;
    _os_log_impl(&dword_1DAFF9000, v3, OS_LOG_TYPE_DEFAULT, "[%@][%@] Triggering localization scan now", (uint8_t *)&v7, 0x16u);
  }
  [MEMORY[0x1E4F77EF0] requestCurrentMicroLocationWithAdditionalInformation:0];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);

  objc_storeStrong((id *)&self->_coalescingTimer, 0);
}

@end