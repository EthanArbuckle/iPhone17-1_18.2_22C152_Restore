@interface UIONavigationBarTitleRenamerViewMetricsUpdateAction
@end

@implementation UIONavigationBarTitleRenamerViewMetricsUpdateAction

void __108___UIONavigationBarTitleRenamerViewMetricsUpdateAction_initWithFrame_textAlignment_session_responseHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __108___UIONavigationBarTitleRenamerViewMetricsUpdateAction_initWithFrame_textAlignment_session_responseHandler___block_invoke_2;
  v7[3] = &unk_1E52DB330;
  id v5 = *(id *)(a1 + 32);
  id v8 = v4;
  id v9 = v5;
  id v6 = v4;
  dispatch_async(MEMORY[0x1E4F14428], v7);
}

uint64_t __108___UIONavigationBarTitleRenamerViewMetricsUpdateAction_initWithFrame_textAlignment_session_responseHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

@end