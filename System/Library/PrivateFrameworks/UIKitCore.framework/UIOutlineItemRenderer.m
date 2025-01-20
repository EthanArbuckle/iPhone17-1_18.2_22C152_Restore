@interface UIOutlineItemRenderer
@end

@implementation UIOutlineItemRenderer

void __63___UIOutlineItemRenderer_initWithIdentifier_cellClass_handler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v7 = WeakRetained;
  if (WeakRetained)
  {
    v8 = [WeakRetained willUpdateCellHandler];

    if (v8)
    {
      v9 = [v7 willUpdateCellHandler];
      ((void (**)(void, id, id))v9)[2](v9, v10, v5);
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

@end