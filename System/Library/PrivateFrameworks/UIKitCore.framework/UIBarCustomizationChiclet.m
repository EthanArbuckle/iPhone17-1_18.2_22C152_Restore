@interface UIBarCustomizationChiclet
@end

@implementation UIBarCustomizationChiclet

void __43___UIBarCustomizationChiclet_initWithItem___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  _itemViewFromItem(a2, *(CGFloat *)(a1 + 40), *(CGFloat *)(a1 + 48), *(CGFloat *)(a1 + 56), *(CGFloat *)(a1 + 64));
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  [v2 addObject:v3];
}

void __46___UIBarCustomizationChiclet_setLabelVisible___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  id v3 = [v2 label];
  [v2 addSubview:v3];

  v4 = [*(id *)(a1 + 32) label];
  [v4 setAlpha:0.0];

  v5 = [*(id *)(a1 + 32) platterView];
  v6 = [*(id *)(a1 + 32) platterView];
  [v6 bounds];
  objc_msgSend(v5, "convertRect:toView:", *(void *)(a1 + 32));
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  CGFloat v12 = v11;
  CGFloat v14 = v13;

  v19.origin.x = v8;
  v19.origin.y = v10;
  v19.size.width = v12;
  v19.size.height = v14;
  double MidX = CGRectGetMidX(v19);
  v20.origin.x = v8;
  v20.origin.y = v10;
  v20.size.width = v12;
  v20.size.height = v14;
  CGFloat v16 = CGRectGetMaxY(v20) + 10.0;
  id v17 = [*(id *)(a1 + 32) label];
  objc_msgSend(v17, "setCenter:", MidX, v16);
}

@end