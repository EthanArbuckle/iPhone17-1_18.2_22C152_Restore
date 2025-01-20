@interface SBIconListModelTransaction
@end

@implementation SBIconListModelTransaction

void __44___SBIconListModelTransaction_commitChanges__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = v3;
  if (*(unsigned char *)(a1 + 56))
  {
    [v3 node:*(void *)(a1 + 32) didAddContainedNodeIdentifiers:*(void *)(a1 + 40)];
    id v3 = v4;
  }
  if (*(unsigned char *)(a1 + 57))
  {
    [v4 node:*(void *)(a1 + 32) didRemoveContainedNodeIdentifiers:*(void *)(a1 + 48)];
    id v3 = v4;
  }
}

uint64_t __44___SBIconListModelTransaction_commitChanges__block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _notifyListObserver:a2 didAddIcons:*(void *)(a1 + 40) didRemoveIcons:*(void *)(a1 + 48) movedIcons:*(void *)(a1 + 56) didReplaceIcon:*(void *)(a1 + 64) withIcon:*(void *)(a1 + 72)];
}

uint64_t __69___SBIconListModelTransaction_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1, void *a2)
{
  return [a2 reason];
}

@end