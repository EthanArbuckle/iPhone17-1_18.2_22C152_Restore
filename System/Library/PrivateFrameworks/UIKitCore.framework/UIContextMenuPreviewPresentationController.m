@interface UIContextMenuPreviewPresentationController
@end

@implementation UIContextMenuPreviewPresentationController

void __83___UIContextMenuPreviewPresentationController__traitCollectionForChildEnvironment___block_invoke(uint64_t a1, void *a2, void *a3)
{
  v16 = a2;
  v5 = a3;
  if (*(void *)(a1 + 32))
  {
    v6 = v16[2]();
    uint64_t v7 = [v6 horizontalSizeClass];
    uint64_t v8 = *(void *)(a1 + 32);

    if (v7 != v8)
    {
      uint64_t v9 = *(void *)(a1 + 32);
      v10 = v5[2](v5);
      [v10 setHorizontalSizeClass:v9];
    }
  }
  if (*(void *)(a1 + 40))
  {
    v11 = v16[2]();
    uint64_t v12 = [v11 verticalSizeClass];
    uint64_t v13 = *(void *)(a1 + 40);

    if (v12 != v13)
    {
      uint64_t v14 = *(void *)(a1 + 40);
      v15 = v5[2](v5);
      [v15 setVerticalSizeClass:v14];
    }
  }
}

@end