@interface UIOMenuLeafPerformAction
@end

@implementation UIOMenuLeafPerformAction

void __91___UIOMenuLeafPerformAction_initWithMenuElement_pasteAuthenticationMesage_responseHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

void __64___UIOMenuLeafPerformAction_handleClientActionToOverlayService___block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) canSendResponse])
  {
    v2 = [[_UIOMenuLeafPerformResponse alloc] initWithInfo:0 error:0];
    [*(id *)(a1 + 32) sendResponse:v2];
  }
}

@end