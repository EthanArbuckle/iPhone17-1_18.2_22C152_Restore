@interface UICalendarHeaderView
@end

@implementation UICalendarHeaderView

void __44___UICalendarHeaderView__setupViewHierarchy__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = [WeakRetained delegate];
  [v1 headerViewDidSelect:WeakRetained];
}

uint64_t __46___UICalendarHeaderView_setExpanded_animated___block_invoke(uint64_t a1)
{
  v2 = *(void **)(*(void *)(a1 + 32) + 424);
  long long v3 = *(_OWORD *)(a1 + 56);
  v5[0] = *(_OWORD *)(a1 + 40);
  v5[1] = v3;
  v5[2] = *(_OWORD *)(a1 + 72);
  [v2 setChevronTransform:v5];
  [*(id *)(*(void *)(a1 + 32) + 424) setSelected:*(unsigned __int8 *)(a1 + 88)];
  [*(id *)(a1 + 32) _updateMonthYearLabel];
  return [*(id *)(a1 + 32) _updateMonthButtonVisibility];
}

@end