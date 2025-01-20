@interface UIButtonBarItemGroupLayout
@end

@implementation UIButtonBarItemGroupLayout

uint64_t __70___UIButtonBarItemGroupLayout__addConstraintsToActivate_toDeactivate___block_invoke(uint64_t a1, void *a2)
{
  return [a2 addConstraintsToActivate:*(void *)(a1 + 32) toDeactivate:*(void *)(a1 + 40)];
}

uint64_t __48___UIButtonBarItemGroupLayout__addLayoutGuides___block_invoke(uint64_t a1, void *a2)
{
  return [a2 addLayoutGuides:*(void *)(a1 + 32)];
}

uint64_t __47___UIButtonBarItemGroupLayout__addLayoutViews___block_invoke(uint64_t a1, void *a2)
{
  return [a2 addLayoutViews:*(void *)(a1 + 32)];
}

void __72___UIButtonBarItemGroupLayout_initWithLayoutMetrics_barButtonItemGroup___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 widthAnchor];
  [v3 setGroupSizeGuide:v4];
}

@end