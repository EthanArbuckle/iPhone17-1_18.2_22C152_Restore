@interface UITextSearchingFindSessionAggregator
@end

@implementation UITextSearchingFindSessionAggregator

void __63___UITextSearchingFindSessionAggregator__performOnMainIfValid___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
    id WeakRetained = v3;
  }
}

uint64_t __58___UITextSearchingFindSessionAggregator_finishedSearching__block_invoke(uint64_t a1, void *a2)
{
  return [a2 _finishedSearching];
}

uint64_t __79___UITextSearchingFindSessionAggregator_foundRange_forSearchString_inDocument___block_invoke(void *a1, void *a2)
{
  return [a2 _foundRange:a1[4] forSearchString:a1[5] inDocument:a1[6]];
}

uint64_t __73___UITextSearchingFindSessionAggregator_invalidateFoundRange_inDocument___block_invoke(uint64_t a1, void *a2)
{
  return [a2 _invalidateFoundRange:*(void *)(a1 + 32) inDocument:*(void *)(a1 + 40)];
}

uint64_t __51___UITextSearchingFindSessionAggregator_invalidate__block_invoke(uint64_t a1, void *a2)
{
  return [a2 _invalidateAllFoundRanges];
}

@end