@interface UIBarCustomizationItem
@end

@implementation UIBarCustomizationItem

void __51___UIBarCustomizationItem__sourceFrameInContainer___block_invoke(uint64_t a1, void *a2)
{
  id v20 = a2;
  v3 = [v20 sourceViewProvider];

  v4 = v20;
  if (v3)
  {
    v5 = [v20 sourceViewProvider];
    v6 = ((void (**)(void, id))v5)[2](v5, v20);

    uint64_t v7 = [v6 window];
    if (v7)
    {
      v8 = (void *)v7;
      v9 = [v6 superview];
      v10 = +[_UIBarCustomizationCustomViewPortalSourceContainer sharedContainer];

      if (v9 != v10)
      {
        v11 = [v6 superview];
        [v6 frame];
        objc_msgSend(v11, "convertRect:toView:", *(void *)(a1 + 32));
        CGFloat v13 = v12;
        CGFloat v15 = v14;
        CGFloat v17 = v16;
        CGFloat v19 = v18;

        v22.origin.x = v13;
        v22.origin.y = v15;
        v22.size.width = v17;
        v22.size.height = v19;
        *(CGRect *)(*(void *)(*(void *)(a1 + 40) + 8) + 32) = CGRectUnion(*(CGRect *)(*(void *)(*(void *)(a1 + 40)+ 8)+ 32), v22);
      }
    }

    v4 = v20;
  }
}

uint64_t __55___UIBarCustomizationItem__enumerateSubitemsWithBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

@end