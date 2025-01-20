@interface _UITabBarItemBridgedElement
- (BOOL)_isBridgedItem;
- (BOOL)isEnabled;
- (BOOL)isSelected;
- (BOOL)isSpringLoaded;
- (UIEdgeInsets)imageInsetsForStyle:(int64_t)a3 state:(int64_t)a4;
- (UITabBarItem)tabBarItem;
- (_UITabBarItemBridgedElement)initWithViewController:(id)a3;
- (id)_resolvedTabBarItemSourceItemForPopoverPresentationControllerSourceItem;
- (id)accessibilityAttributedLabel;
- (id)accessibilityIdentifier;
- (id)badgeForStyle:(int64_t)a3 state:(int64_t)a4;
- (id)badgeValue;
- (id)image;
- (id)imageForStyle:(int64_t)a3 state:(int64_t)a4;
- (id)scrollEdgeAppearance;
- (id)standardAppearance;
- (id)title;
- (id)titleForStyle:(int64_t)a3 state:(int64_t)a4;
- (int64_t)preferredPlacement;
- (void)_reloadTabBarItem;
- (void)_setBridgedTabBarItem:(id)a3;
- (void)_tabDataProviderContentDidChange:(id)a3;
- (void)_updateView;
@end

@implementation _UITabBarItemBridgedElement

- (int64_t)preferredPlacement
{
  v2 = [(_UITabBarItemBridgedElement *)self tabBarItem];
  int64_t v3 = [v2 preferredPlacement];

  return v3;
}

- (UITabBarItem)tabBarItem
{
  return self->_tabBarItem;
}

- (_UITabBarItemBridgedElement)initWithViewController:(id)a3
{
  id v4 = a3;
  v5 = [MEMORY[0x1E4F29128] UUID];
  v6 = [v5 UUIDString];
  v13.receiver = self;
  v13.super_class = (Class)_UITabBarItemBridgedElement;
  v7 = [(_UITabElement *)&v13 initWithIdentifier:v6 title:&stru_1ED0E84C0 image:0];

  if (v7)
  {
    uint64_t v8 = [v4 tabBarItem];
    tabBarItem = v7->_tabBarItem;
    v7->_tabBarItem = (UITabBarItem *)v8;

    v10 = v7->_tabBarItem;
    if (v10)
    {
      objc_storeWeak((id *)&v10->_changeObserver, v7);
      uint64_t v11 = (uint64_t)v7->_tabBarItem;
    }
    else
    {
      uint64_t v11 = 0;
    }
    -[UITabBarItem set_fallbackSourceItem:](v11, v7);
    [(_UITabElement *)v7 _setViewController:v4];
  }

  return v7;
}

- (BOOL)_isBridgedItem
{
  return 1;
}

- (void)_setBridgedTabBarItem:(id)a3
{
  v5 = (UITabBarItem *)a3;
  p_tabBarItem = &self->_tabBarItem;
  tabBarItem = self->_tabBarItem;
  if (tabBarItem != v5)
  {
    uint64_t v11 = v5;
    -[UITabBarItem _changeObserver]((id *)&tabBarItem->super.super.isa);
    uint64_t v8 = (_UITabBarItemBridgedElement *)objc_claimAutoreleasedReturnValue();

    if (v8 == self)
    {
      if (*p_tabBarItem)
      {
        objc_storeWeak((id *)&(*p_tabBarItem)->_changeObserver, 0);
        uint64_t v9 = (uint64_t)*p_tabBarItem;
      }
      else
      {
        uint64_t v9 = 0;
      }
      -[UITabBarItem set_fallbackSourceItem:](v9, 0);
    }
    objc_storeStrong((id *)&self->_tabBarItem, a3);
    if (*p_tabBarItem)
    {
      objc_storeWeak((id *)&(*p_tabBarItem)->_changeObserver, self);
      uint64_t v10 = (uint64_t)*p_tabBarItem;
    }
    else
    {
      uint64_t v10 = 0;
    }
    -[UITabBarItem set_fallbackSourceItem:](v10, self);
    v5 = v11;
  }
}

- (void)_tabDataProviderContentDidChange:(id)a3
{
  id v4 = [(UITab *)self _tabModel];
  [v4 tabContentDidChange:self];
}

- (void)_updateView
{
}

- (void)_reloadTabBarItem
{
  int64_t v3 = [(_UITabElement *)self _viewController];
  id v4 = [v3 tabBarItem];

  [(_UITabBarItemBridgedElement *)self _setBridgedTabBarItem:v4];
}

- (id)title
{
  v2 = [(_UITabBarItemBridgedElement *)self titleForStyle:1 state:0];
  int64_t v3 = v2;
  if (!v2) {
    v2 = &stru_1ED0E84C0;
  }
  id v4 = v2;

  return v4;
}

- (id)image
{
  return [(_UITabBarItemBridgedElement *)self imageForStyle:1 state:0];
}

- (id)badgeValue
{
  v2 = [(_UITabBarItemBridgedElement *)self tabBarItem];
  int64_t v3 = [v2 badgeValue];

  return v3;
}

- (id)_resolvedTabBarItemSourceItemForPopoverPresentationControllerSourceItem
{
  return -[UITabBarItem _tabBarButton]((id *)&self->_tabBarItem->super.super.isa);
}

- (BOOL)isEnabled
{
  v2 = [(_UITabBarItemBridgedElement *)self tabBarItem];
  char v3 = [v2 isEnabled];

  return v3;
}

- (BOOL)isSelected
{
  v2 = [(_UITabBarItemBridgedElement *)self tabBarItem];
  char v3 = [v2 isSelected];

  return v3;
}

- (BOOL)isSpringLoaded
{
  v2 = [(_UITabBarItemBridgedElement *)self tabBarItem];
  char v3 = [v2 isSpringLoaded];

  return v3;
}

- (id)titleForStyle:(int64_t)a3 state:(int64_t)a4
{
  v6 = [(_UITabBarItemBridgedElement *)self tabBarItem];
  v7 = [v6 titleForStyle:a3 state:a4];

  return v7;
}

- (id)badgeForStyle:(int64_t)a3 state:(int64_t)a4
{
  v6 = [(_UITabBarItemBridgedElement *)self tabBarItem];
  v7 = [v6 badgeForStyle:a3 state:a4];

  return v7;
}

- (id)imageForStyle:(int64_t)a3 state:(int64_t)a4
{
  v6 = [(_UITabBarItemBridgedElement *)self tabBarItem];
  v7 = [v6 imageForStyle:a3 state:a4];

  return v7;
}

- (UIEdgeInsets)imageInsetsForStyle:(int64_t)a3 state:(int64_t)a4
{
  v6 = [(_UITabBarItemBridgedElement *)self tabBarItem];
  [v6 imageInsetsForStyle:a3 state:a4];
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;

  double v15 = v8;
  double v16 = v10;
  double v17 = v12;
  double v18 = v14;
  result.right = v18;
  result.bottom = v17;
  result.left = v16;
  result.top = v15;
  return result;
}

- (id)standardAppearance
{
  v2 = [(_UITabBarItemBridgedElement *)self tabBarItem];
  char v3 = [v2 standardAppearance];

  return v3;
}

- (id)scrollEdgeAppearance
{
  v2 = [(_UITabBarItemBridgedElement *)self tabBarItem];
  char v3 = [v2 scrollEdgeAppearance];

  return v3;
}

- (id)accessibilityIdentifier
{
  v2 = [(_UITabBarItemBridgedElement *)self tabBarItem];
  char v3 = [v2 accessibilityIdentifier];

  return v3;
}

- (id)accessibilityAttributedLabel
{
  v2 = [(_UITabBarItemBridgedElement *)self tabBarItem];
  char v3 = [v2 accessibilityAttributedLabel];

  return v3;
}

- (void).cxx_destruct
{
}

@end