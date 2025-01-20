@interface UIDiffableDataSourceExpandCollapseAnimationContext
@end

@implementation UIDiffableDataSourceExpandCollapseAnimationContext

void __96___UIDiffableDataSourceExpandCollapseAnimationContext_indexPathsForChildItemsInExpandingParent___block_invoke(uint64_t a1, unint64_t a2)
{
  uint64_t v3 = -[_UIDiffableDataSourceExpandCollapseAnimationContext _visibleIndexForIndex:identifiers:visibleIdentifiers:](*(void *)(a1 + 32), a2, *(void **)(*(void *)(a1 + 32) + 48), *(void **)(*(void *)(a1 + 32) + 64));
  if (v3 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v4 = *(void **)(a1 + 40);
    id v5 = [MEMORY[0x1E4F28D58] indexPathForItem:v3 inSection:*(void *)(*(void *)(a1 + 32) + 8)];
    [v4 addObject:v5];
  }
}

void __97___UIDiffableDataSourceExpandCollapseAnimationContext_indexPathsForChildItemsInCollapsingParent___block_invoke(uint64_t a1, unint64_t a2)
{
  uint64_t v3 = -[_UIDiffableDataSourceExpandCollapseAnimationContext _visibleIndexForIndex:identifiers:visibleIdentifiers:](*(void *)(a1 + 32), a2, *(void **)(*(void *)(a1 + 32) + 40), *(void **)(*(void *)(a1 + 32) + 56));
  if (v3 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v4 = *(void **)(a1 + 40);
    id v5 = [MEMORY[0x1E4F28D58] indexPathForItem:v3 inSection:*(void *)(*(void *)(a1 + 32) + 8)];
    [v4 addObject:v5];
  }
}

@end