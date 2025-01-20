@interface PXWidgetCompositionElementScanner
@end

@implementation PXWidgetCompositionElementScanner

void __66___PXWidgetCompositionElementScanner_enumerateElementsUsingBlock___block_invoke(uint64_t a1, void *a2)
{
  id v5 = [a2 widget];
  if (objc_opt_respondsToSelector())
  {
    [v5 preferredContentHeightForWidth:*(double *)(a1 + 40)];
    uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
    if (*(double *)(v4 + 24) >= v3) {
      double v3 = *(double *)(v4 + 24);
    }
    *(double *)(v4 + 24) = v3;
  }
}

uint64_t __66___PXWidgetCompositionElementScanner_enumerateElementsUsingBlock___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(double, double))(*(void *)(a1 + 32) + 16))(*(double *)(a1 + 48), *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 24));
}

@end