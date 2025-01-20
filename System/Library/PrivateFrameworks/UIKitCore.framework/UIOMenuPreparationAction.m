@interface UIOMenuPreparationAction
@end

@implementation UIOMenuPreparationAction

void __58___UIOMenuPreparationAction_initWithMenu_responseHandler___block_invoke(void *a1, void *a2)
{
  id v4 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    (*(void (**)(void))(a1[5] + 16))();
  }
  else
  {
    v3 = [MEMORY[0x1E4F28B00] currentHandler];
    [v3 handleFailureInMethod:a1[6] object:a1[4] file:@"_UIOMenuPreparationAction.m" lineNumber:57 description:@"We should've never received a response that isn't a UIOMenuPreparationAction"];
  }
}

void __64___UIOMenuPreparationAction_handleClientActionToOverlayService___block_invoke(uint64_t *a1, void *a2)
{
  id v9 = a2;
  if ([(id)a1[4] canSendResponse])
  {
    v3 = [[_UIOMenuPreparationResponse alloc] initWithPreparedMenu:v9];
    id v4 = [(_UIOMenuPreparationResponse *)v3 preparedMenu];

    if (!v4)
    {
      v5 = [MEMORY[0x1E4F28B00] currentHandler];
      uint64_t v6 = a1[6];
      uint64_t v7 = a1[4];
      v8 = [(_UIOMenuPreparationResponse *)v3 preparedMenu];
      [v5 handleFailureInMethod:v6, v7, @"_UIOMenuPreparationAction.m", 74, @"Prepared menu is not encoded correctly %@.", v8 object file lineNumber description];
    }
    [(id)a1[4] sendResponse:v3];
  }
  else
  {
    v3 = [MEMORY[0x1E4F28B00] currentHandler];
    [(_UIOMenuPreparationResponse *)v3 handleFailureInMethod:a1[6], a1[4], @"_UIOMenuPreparationAction.m", 77, @"Unable to send response back to the server (%@)", a1[5] object file lineNumber description];
  }
}

@end