@interface SFSWYCollaborationItem
@end

@implementation SFSWYCollaborationItem

void __84___SFSWYCollaborationItem_initWithItemProvider_activityItem_isURLProviderSupported___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __84___SFSWYCollaborationItem_initWithItemProvider_activityItem_isURLProviderSupported___block_invoke_2;
    v4[3] = &unk_1E5BBBD18;
    id v5 = *(id *)(a1 + 32);
    id v6 = v3;
    dispatch_async(MEMORY[0x1E4F14428], v4);
  }
}

void __84___SFSWYCollaborationItem_initWithItemProvider_activityItem_isURLProviderSupported___block_invoke_2(uint64_t a1)
{
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 160), *(id *)(a1 + 40));
  v2 = *(void **)(a1 + 32);
  id v3 = [*(id *)(a1 + 40) collaborationMetadata];
  [v2 _didLoadMetadata:v3];
}

@end