@interface UIDynamicCaretAlternatives
@end

@implementation UIDynamicCaretAlternatives

uint64_t __45___UIDynamicCaretAlternatives_layoutSubviews__block_invoke(uint64_t a1, void *a2, unint64_t a3)
{
  double v3 = 0.0;
  if (a3) {
    double v4 = *(double *)(a1 + 32);
  }
  else {
    double v4 = 0.0;
  }
  if (a3 >= 2) {
    double v3 = *(double *)(a1 + 40);
  }
  return objc_msgSend(a2, "setFrame:", v4, v3, *(double *)(a1 + 32), *(double *)(a1 + 40));
}

void __47___UIDynamicCaretAlternatives_setButtonLabels___block_invoke(uint64_t a1, void *a2, unint64_t a3)
{
  v5 = *(void **)(a1 + 32);
  id v6 = a2;
  if ([v5 count] <= a3)
  {
    id v7 = 0;
  }
  else
  {
    id v7 = [*(id *)(a1 + 32) objectAtIndex:a3];
  }
  [v6 setHighlighted:0];
  [v6 setTitle:v7 forState:0];
}

@end