@interface UIFocusEnvironmentPreferredFocusMapContainer
@end

@implementation UIFocusEnvironmentPreferredFocusMapContainer

void ___UIFocusEnvironmentPreferredFocusMapContainer_block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  id v11 = a2;
  if (objc_opt_respondsToSelector())
  {
    v5 = [v11 _focusMapContainer];
    if (!v5)
    {
      id v7 = 0;
      goto LABEL_9;
    }
    uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 8);
    id v7 = v5;
    v8 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = v7;
    goto LABEL_7;
  }
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40)) {
    goto LABEL_10;
  }
  id v7 = [v11 focusItemContainer];
  if (v7)
  {
    uint64_t v9 = _UIFocusRegionContainerFromEnvironmentAndContainer((uint64_t)v11, (uint64_t)v7);
    uint64_t v10 = *(void *)(*(void *)(a1 + 32) + 8);
    v8 = *(void **)(v10 + 40);
    *(void *)(v10 + 40) = v9;
LABEL_7:

    *a3 = 1;
  }
LABEL_9:

LABEL_10:
}

@end