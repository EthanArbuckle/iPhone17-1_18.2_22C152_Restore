@interface _UIFloatingTabBarListItem
+ (id)placeholderItemForTab:(id)a3;
- (BOOL)containsItem:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isPlaceholder;
- (NSArray)children;
- (UITab)contentTab;
- (UITab)tabForSelection;
- (_UIFloatingTabBarListItem)initWithChildren:(id)a3;
- (_UIFloatingTabBarListItem)initWithTab:(id)a3;
- (_UIFloatingTabBarListItem)parent;
- (int64_t)itemIndex;
- (unint64_t)hash;
- (void)setContentTab:(id)a3;
@end

@implementation _UIFloatingTabBarListItem

- (_UIFloatingTabBarListItem)initWithTab:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_UIFloatingTabBarListItem;
  v6 = [(_UIFloatingTabBarListItem *)&v9 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_tabForSelection, a3);
    v7->_itemIndex = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v7;
}

+ (id)placeholderItemForTab:(id)a3
{
  v3 = (UITab *)a3;
  v4 = objc_alloc_init(_UIFloatingTabBarListItem);
  v4->_isPlaceholder = 1;
  contentTab = v4->_contentTab;
  v4->_contentTab = v3;

  return v4;
}

- (_UIFloatingTabBarListItem)initWithChildren:(id)a3
{
  id v6 = a3;
  v13.receiver = self;
  v13.super_class = (Class)_UIFloatingTabBarListItem;
  v7 = [(_UIFloatingTabBarListItem *)&v13 init];
  if (v7)
  {
    if (![v6 count])
    {
      objc_super v9 = [MEMORY[0x1E4F28B00] currentHandler];
      [v9 handleFailureInMethod:a2 object:v7 file:@"_UIFloatingTabBarListItem.m" lineNumber:35 description:@"Cannot create list item with 0 chilren."];
    }
    objc_storeStrong((id *)&v7->_children, a3);
    v7->_itemIndex = 0x7FFFFFFFFFFFFFFFLL;
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __46___UIFloatingTabBarListItem_initWithChildren___block_invoke;
    v10[3] = &unk_1E5307838;
    SEL v12 = a2;
    v11 = v7;
    [v6 enumerateObjectsUsingBlock:v10];
  }
  return v7;
}

- (UITab)contentTab
{
  contentTab = self->_contentTab;
  if (!contentTab) {
    contentTab = self->_tabForSelection;
  }
  return contentTab;
}

- (BOOL)containsItem:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_alloc(MEMORY[0x1E4F1CA48]);
  id v6 = [(_UIFloatingTabBarListItem *)self tabForSelection];
  v7 = [v6 identifier];
  v8 = objc_msgSend(v5, "initWithObjects:", v7, 0);

  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  objc_super v9 = self->_children;
  uint64_t v10 = [(NSArray *)v9 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v24 != v12) {
          objc_enumerationMutation(v9);
        }
        v14 = [*(id *)(*((void *)&v23 + 1) + 8 * i) tabForSelection];
        v15 = [v14 identifier];
        [v8 addObject:v15];
      }
      uint64_t v11 = [(NSArray *)v9 countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v11);
  }

  id v16 = v4;
  v17 = v16;
  if (v16)
  {
    v18 = v16;
    do
    {
      v19 = [v18 identifier];
      char v20 = [v8 containsObject:v19];

      if (v20) {
        break;
      }
      uint64_t v21 = [v18 _parentGroup];

      v18 = (void *)v21;
    }
    while (v21);
  }
  else
  {
    char v20 = 0;
  }

  return v20;
}

- (unint64_t)hash
{
  unint64_t v3 = [(UITab *)self->_contentTab hash];
  return [(UITab *)self->_tabForSelection hash] ^ v3 ^ self->_isPlaceholder;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (_UIFloatingTabBarListItem *)a3;
  if (v4 == self)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0
      && v4->_tabForSelection == self->_tabForSelection
      && v4->_contentTab == self->_contentTab
      && v4->_isPlaceholder == self->_isPlaceholder;
  }

  return v5;
}

- (_UIFloatingTabBarListItem)parent
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_parent);
  return (_UIFloatingTabBarListItem *)WeakRetained;
}

- (int64_t)itemIndex
{
  return self->_itemIndex;
}

- (UITab)tabForSelection
{
  return self->_tabForSelection;
}

- (BOOL)isPlaceholder
{
  return self->_isPlaceholder;
}

- (void)setContentTab:(id)a3
{
}

- (NSArray)children
{
  return self->_children;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_children, 0);
  objc_storeStrong((id *)&self->_contentTab, 0);
  objc_storeStrong((id *)&self->_tabForSelection, 0);
  objc_destroyWeak((id *)&self->_parent);
}

@end