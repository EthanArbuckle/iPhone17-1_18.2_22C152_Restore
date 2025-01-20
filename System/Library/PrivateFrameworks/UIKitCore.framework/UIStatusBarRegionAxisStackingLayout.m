@interface UIStatusBarRegionAxisStackingLayout
@end

@implementation UIStatusBarRegionAxisStackingLayout

void __101___UIStatusBarRegionAxisStackingLayout_constraintsForDisplayItems_layoutGuides_inContainerItem_axis___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  v5 = [a2 layoutItem];
  if (a3
    && (v11 = v5,
        [*(id *)(a1 + 32) objectAtIndexedSubscript:a3 - 1],
        v6 = objc_claimAutoreleasedReturnValue(),
        [v6 layoutItem],
        v7 = objc_claimAutoreleasedReturnValue(),
        v6,
        v5 = v11,
        v7))
  {
    v8 = *(void **)(a1 + 40);
    v9 = [MEMORY[0x1E4F5B268] constraintWithItem:v11 attribute:*(void *)(a1 + 64) relatedBy:0 toItem:v7 attribute:*(void *)(a1 + 72) multiplier:1.0 constant:*(double *)(a1 + 80) * *(double *)(*(void *)(a1 + 48) + 24)];
    [v8 addObject:v9];
  }
  else
  {
    if (*(unsigned char *)(a1 + 88)) {
      goto LABEL_7;
    }
    v10 = *(void **)(a1 + 40);
    v11 = v5;
    v7 = [MEMORY[0x1E4F5B268] constraintWithItem:v5 attribute:*(void *)(a1 + 64) relatedBy:0 toItem:*(void *)(a1 + 56) attribute:*(void *)(a1 + 64) multiplier:1.0 constant:0.0];
    [v10 addObject:v7];
  }

  v5 = v11;
LABEL_7:
}

@end