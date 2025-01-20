@interface MFWidgetController
+ (EFScheduler)scheduler;
+ (MFWidgetController)sharedController;
+ (OS_os_log)log;
+ (OS_os_log)signpostLog;
- (CHSTimelineController)timelineController;
- (MFWidgetController)init;
- (unint64_t)signpostID;
- (void)reloadTimelinesWithReason:(id)a3;
- (void)setTimelineController:(id)a3;
@end

@implementation MFWidgetController

+ (OS_os_log)log
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __25__MFWidgetController_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken_7 != -1) {
    dispatch_once(&log_onceToken_7, block);
  }
  v2 = (void *)log_log_7;
  return (OS_os_log *)v2;
}

void __25__MFWidgetController_log__block_invoke(uint64_t a1)
{
  NSStringFromClass(*(Class *)(a1 + 32));
  id v3 = objc_claimAutoreleasedReturnValue();
  os_log_t v1 = os_log_create("com.apple.email", (const char *)[v3 UTF8String]);
  v2 = (void *)log_log_7;
  log_log_7 = (uint64_t)v1;
}

+ (OS_os_log)signpostLog
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __33__MFWidgetController_signpostLog__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (signpostLog_onceToken_1 != -1) {
    dispatch_once(&signpostLog_onceToken_1, block);
  }
  v2 = (void *)signpostLog_log_1;
  return (OS_os_log *)v2;
}

void __33__MFWidgetController_signpostLog__block_invoke(uint64_t a1)
{
  NSStringFromClass(*(Class *)(a1 + 32));
  id v3 = objc_claimAutoreleasedReturnValue();
  os_log_t v1 = os_log_create("com.apple.email.signposts", (const char *)[v3 UTF8String]);
  v2 = (void *)signpostLog_log_1;
  signpostLog_log_1 = (uint64_t)v1;
}

- (unint64_t)signpostID
{
  id v3 = [(id)objc_opt_class() signpostLog];
  os_signpost_id_t v4 = os_signpost_id_make_with_pointer(v3, self);

  return v4;
}

+ (MFWidgetController)sharedController
{
  if (sharedController_onceToken != -1) {
    dispatch_once(&sharedController_onceToken, &__block_literal_global_11);
  }
  v2 = (void *)sharedController_controller;
  return (MFWidgetController *)v2;
}

void __38__MFWidgetController_sharedController__block_invoke()
{
  v0 = objc_alloc_init(MFWidgetController);
  os_log_t v1 = (void *)sharedController_controller;
  sharedController_controller = (uint64_t)v0;
}

+ (EFScheduler)scheduler
{
  if (scheduler_onceToken != -1) {
    dispatch_once(&scheduler_onceToken, &__block_literal_global_14);
  }
  v2 = (void *)scheduler_scheduler;
  return (EFScheduler *)v2;
}

void __31__MFWidgetController_scheduler__block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F60F28] serialDispatchQueueSchedulerWithName:@"com.apple.mobilemail.reload-timeline" qualityOfService:25];
  os_log_t v1 = (void *)scheduler_scheduler;
  scheduler_scheduler = v0;
}

- (MFWidgetController)init
{
  v7.receiver = self;
  v7.super_class = (Class)MFWidgetController;
  v2 = [(MFWidgetController *)&v7 init];
  if (v2)
  {
    id v3 = objc_alloc(MEMORY[0x1E4F58DA0]);
    uint64_t v4 = [v3 initWithExtensionBundleIdentifier:*MEMORY[0x1E4F77E28] kind:*MEMORY[0x1E4F77E30]];
    timelineController = v2->_timelineController;
    v2->_timelineController = (CHSTimelineController *)v4;
  }
  return v2;
}

- (void)reloadTimelinesWithReason:(id)a3
{
  id v4 = a3;
  v5 = +[MFWidgetController signpostLog];
  os_signpost_id_t v6 = os_signpost_id_generate(v5);
  objc_super v7 = v5;
  v8 = v7;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1DDF5A000, v8, OS_SIGNPOST_INTERVAL_BEGIN, v6, "RELOAD WIDGET TIMELINE", "Perform block", buf, 2u);
  }

  v9 = +[MFWidgetController scheduler];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __48__MFWidgetController_reloadTimelinesWithReason___block_invoke;
  v12[3] = &unk_1E6D1AE58;
  v10 = v8;
  os_signpost_id_t v16 = v6;
  v13 = v10;
  v14 = self;
  id v11 = v4;
  id v15 = v11;
  [v9 performBlock:v12];
}

void __48__MFWidgetController_reloadTimelinesWithReason___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  v2 = *(id *)(a1 + 32);
  id v3 = v2;
  os_signpost_id_t v4 = *(void *)(a1 + 56);
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v2))
  {
    LOWORD(v11[0]) = 0;
    _os_signpost_emit_with_name_impl(&dword_1DDF5A000, v3, OS_SIGNPOST_EVENT, v4, "RELOAD WIDGET TIMELINE", "Reload timelines", (uint8_t *)v11, 2u);
  }

  v5 = [*(id *)(a1 + 40) timelineController];
  os_signpost_id_t v6 = [v5 reloadTimelineWithReason:*(void *)(a1 + 48)];

  if (v6)
  {
    objc_super v7 = +[MFWidgetController log];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __48__MFWidgetController_reloadTimelinesWithReason___block_invoke_cold_1((uint64_t)v6, v7);
    }
  }
  else
  {
    objc_super v7 = +[MFWidgetController log];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v11[0]) = 0;
      _os_log_impl(&dword_1DDF5A000, v7, OS_LOG_TYPE_DEFAULT, "Reload timelines", (uint8_t *)v11, 2u);
    }
  }

  v8 = *(id *)(a1 + 32);
  v9 = v8;
  os_signpost_id_t v10 = *(void *)(a1 + 56);
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    v11[0] = 67109120;
    v11[1] = v6 == 0;
    _os_signpost_emit_with_name_impl(&dword_1DDF5A000, v9, OS_SIGNPOST_INTERVAL_END, v10, "RELOAD WIDGET TIMELINE", "Reload timelines completed (success=%{BOOL}d) enableTelemetry=YES ", (uint8_t *)v11, 8u);
  }
}

- (CHSTimelineController)timelineController
{
  return self->_timelineController;
}

- (void)setTimelineController:(id)a3
{
}

- (void).cxx_destruct
{
}

void __48__MFWidgetController_reloadTimelinesWithReason___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1DDF5A000, a2, OS_LOG_TYPE_ERROR, "Reload timelines failed with error: %{public}@", (uint8_t *)&v2, 0xCu);
}

@end