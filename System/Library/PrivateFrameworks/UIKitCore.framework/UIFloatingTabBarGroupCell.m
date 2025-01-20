@interface UIFloatingTabBarGroupCell
@end

@implementation UIFloatingTabBarGroupCell

void __46___UIFloatingTabBarGroupCell__reloadItemsView__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  v6 = [_UIFloatingTabBarGroupItemView alloc];
  v7 = [v5 contentTab];

  v8 = [v7 image];
  v10 = [(_UIFloatingTabBarGroupItemView *)v6 initWithImage:v8 needsPunchOut:a3 != 0];

  v9 = [*(id *)(a1 + 32) contentView];
  [v9 addSubview:v10];

  [*(id *)(a1 + 40) addObject:v10];
}

@end