@interface UIFloatingTabBarCollectionViewLayout
@end

@implementation UIFloatingTabBarCollectionViewLayout

id __64___UIFloatingTabBarCollectionViewLayout_initWithFloatingTabBar___block_invoke(uint64_t a1)
{
  v11[1] = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v3 = [off_1E52D2B08 estimatedDimension:80.0];
  v4 = [off_1E52D2B08 fractionalHeightDimension:1.0];
  v5 = [off_1E52D2B30 sizeWithWidthDimension:v3 heightDimension:v4];

  v6 = [off_1E52D2B20 itemWithLayoutSize:v5];
  v11[0] = v6;
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:1];
  v8 = [off_1E52D2B18 verticalGroupWithLayoutSize:v5 subitems:v7];

  v9 = [off_1E52D2B28 sectionWithGroup:v8];
  [v9 setContentInsetsReference:1];
  objc_msgSend(v9, "setContentInsets:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));

  return v9;
}

void __91___UIFloatingTabBarCollectionViewLayout__animationForReusableView_toLayoutAttributes_type___block_invoke(id *a1, void *a2)
{
  id v3 = a2;
  v4 = [a1[4] floatingTabBar];
  v5 = [v4 outgoingExpandedGroupItem];

  v6 = [a1[4] floatingTabBar];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __91___UIFloatingTabBarCollectionViewLayout__animationForReusableView_toLayoutAttributes_type___block_invoke_2;
  v13[3] = &unk_1E52D9F98;
  id v14 = a1[5];
  id v15 = a1[6];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __91___UIFloatingTabBarCollectionViewLayout__animationForReusableView_toLayoutAttributes_type___block_invoke_3;
  v9[3] = &unk_1E530F288;
  id v10 = a1[5];
  id v11 = v5;
  id v12 = v3;
  id v7 = v3;
  id v8 = v5;
  [v6 _animateSelection:v13 completion:v9];
}

void __91___UIFloatingTabBarCollectionViewLayout__animationForReusableView_toLayoutAttributes_type___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 40) frame];
  objc_msgSend(*(id *)(a1 + 32), "setFrame:");
  [*(id *)(a1 + 40) alpha];
  objc_msgSend(*(id *)(a1 + 32), "setAlpha:");
  id v2 = *(id *)(a1 + 32);
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(v2, "setGroupItemMinimized:", objc_msgSend(*(id *)(a1 + 40), "isGroupItemMinimized"));
  }
}

void __91___UIFloatingTabBarCollectionViewLayout__animationForReusableView_toLayoutAttributes_type___block_invoke_3(uint64_t a1)
{
  id v8 = *(id *)(a1 + 32);
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v2 = *(void **)(a1 + 40);
    id v3 = [v8 listItem];
    id v4 = v2;
    id v5 = v3;
    if (v4 == v5)
    {
    }
    else
    {
      v6 = v5;
      if (!v4 || !v5)
      {

        goto LABEL_10;
      }
      int v7 = [v4 isEqual:v5];

      if (!v7) {
        goto LABEL_11;
      }
    }
    v6 = [v8 contentView];
    [v6 setHidden:0];
LABEL_10:
  }
LABEL_11:
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

@end