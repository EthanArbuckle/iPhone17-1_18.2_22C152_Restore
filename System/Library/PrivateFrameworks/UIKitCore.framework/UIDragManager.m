@interface UIDragManager
@end

@implementation UIDragManager

void __42___UIDragManager_initializeDraggingSystem__block_invoke()
{
  uint64_t v0 = objc_opt_new();
  v1 = (void *)_MergedGlobals_1146;
  _MergedGlobals_1146 = v0;
}

void __52___UIDragManager_beginDragWithSessionConfiguration___block_invoke(uint64_t a1)
{
  int v2 = dyld_program_sdk_at_least();
  uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 16);
  if (v2)
  {
    if (v3 <= 0)
    {
      v4 = [MEMORY[0x1E4F28B00] currentHandler];
      [v4 handleFailureInMethod:*(void *)(a1 + 40) object:*(void *)(a1 + 32) file:@"_UIDragManager.m" lineNumber:232 description:@"Pending session request count is not valid."];
    }
  }
  else if (v3 <= 0)
  {
    v6 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &_block_invoke___s_category_5) + 8);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1853B0000, v6, OS_LOG_TYPE_ERROR, "Pending session request count is not valid.", buf, 2u);
    }
  }
  if ((uint64_t)--*(void *)(*(void *)(a1 + 32) + 16) <= 0)
  {
    v5 = +[UIApplication _systemAnimationFenceExemptQueue];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __52___UIDragManager_beginDragWithSessionConfiguration___block_invoke_33;
    v7[3] = &unk_1E52D9F70;
    v7[4] = *(void *)(a1 + 32);
    [v5 performAsync:v7];
  }
}

uint64_t __52___UIDragManager_beginDragWithSessionConfiguration___block_invoke_33(uint64_t a1)
{
  return [*(id *)(a1 + 32) performPendingSessionCompletionBlocksIfPossible];
}

@end