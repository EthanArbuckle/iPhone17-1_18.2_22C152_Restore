@interface UICollectionViewListHeaderFooter
@end

@implementation UICollectionViewListHeaderFooter

id __80___UICollectionViewListHeaderFooter__defaultBackgroundViewConfigurationProvider__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if ((unint64_t)(v2 - 1) >= 2)
  {
    if (v2 == 3) {
      +[_UIBackgroundViewConfiguration defaultOutlineParentCellConfigurationForState:a2];
    }
    else {
    v3 = +[_UIBackgroundViewConfiguration defaultPlainListHeaderFooterConfigurationForState:a2];
    }
  }
  else
  {
    v3 = +[_UIBackgroundViewConfiguration defaultGroupedListHeaderFooterConfigurationForState:a2];
  }
  return v3;
}

void __71___UICollectionViewListHeaderFooter__updateDefaultBackgroundAppearance__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) _defaultBackgroundViewConfigurationProvider];
  [*(id *)(a1 + 32) _setBackgroundViewConfigurationProvider:v2];
}

uint64_t __58___UICollectionViewListHeaderFooter__resetBackgroundColor__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setBackgroundColor:0];
}

uint64_t __70___UICollectionViewListHeaderFooter__resetBackgroundViewConfiguration__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _setBackgroundViewConfigurationProvider:0];
  id v2 = *(void **)(a1 + 32);
  return [v2 _setBackgroundViewConfiguration:0];
}

void __119___UICollectionViewListHeaderFooter_systemLayoutSizeFittingSize_withHorizontalFittingPriority_verticalFittingPriority___block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v2 = *(NSObject **)(__UILogGetCategoryCachedImpl("Warning", &_UIInternalPreference_UIViewDebugSignposts_block_invoke___s_category_14)+ 8);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v4 = 138412290;
    uint64_t v5 = v3;
    _os_log_impl(&dword_1853B0000, v2, OS_LOG_TYPE_ERROR, "Warning once only: Detected a case where constraints ambiguously suggest a size of zero for a _UICollectionViewListHeaderFooter's content view. We're considering the collapse unintentional and using standard size instead. Header/footer: %@", (uint8_t *)&v4, 0xCu);
  }
}

@end