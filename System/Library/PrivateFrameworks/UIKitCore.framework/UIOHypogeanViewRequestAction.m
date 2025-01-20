@interface UIOHypogeanViewRequestAction
@end

@implementation UIOHypogeanViewRequestAction

void __66___UIOHypogeanViewRequestAction_TestingOnly__overlay_viewRegistry__block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v1 = (void *)qword_1EB262170;
  qword_1EB262170 = (uint64_t)v0;
}

void __83___UIOHypogeanViewRequestAction_TestingOnly_initWithConfiguration_responseHandler___block_invoke(uint64_t a1, void *a2)
{
  v3 = (void *)MEMORY[0x1E4F28DC0];
  id v4 = a2;
  uint64_t v5 = objc_opt_class();
  v6 = [v4 info];

  v7 = [v6 objectForSetting:1];
  id v8 = [v3 unarchivedObjectOfClass:v5 fromData:v7 error:0];

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __73___UIOHypogeanViewRequestAction_TestingOnly_performActionFromConnection___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _performActionWithDisplayDelegate:a2];
}

void __79___UIOHypogeanViewRequestAction_TestingOnly__performActionWithDisplayDelegate___block_invoke()
{
  id v0 = UIOLog();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v1 = 0;
    _os_log_debug_impl(&dword_1853B0000, v0, OS_LOG_TYPE_DEBUG, "Hypogean Button Pressed!", v1, 2u);
  }
}

@end