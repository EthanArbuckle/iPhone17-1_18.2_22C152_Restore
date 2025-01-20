@interface _UIHostedMenuManager
- (UIMenu)displayedMenu;
- (UIMenu)rootMenu;
- (id)_menuForIdentifier:(id)a3 menu:(id)a4;
- (id)_menuLeafForIdentifier:(id)a3 menu:(id)a4;
- (id)menuForIdentifier:(id)a3;
- (id)menuLeafForIdentifier:(id)a3;
- (void)setDisplayedMenu:(id)a3;
- (void)setRootMenu:(id)a3;
@end

@implementation _UIHostedMenuManager

- (id)menuLeafForIdentifier:(id)a3
{
  id v4 = a3;
  v5 = [(_UIHostedMenuManager *)self _menuLeafForIdentifier:v4 menu:self->_displayedMenu];
  if (!v5)
  {
    v5 = [(_UIHostedMenuManager *)self _menuLeafForIdentifier:v4 menu:self->_rootMenu];
  }

  return v5;
}

- (id)menuForIdentifier:(id)a3
{
  id v4 = a3;
  v5 = [(_UIHostedMenuManager *)self _menuForIdentifier:v4 menu:self->_displayedMenu];
  if (!v5)
  {
    v5 = [(_UIHostedMenuManager *)self _menuForIdentifier:v4 menu:self->_rootMenu];
  }

  return v5;
}

- (id)_menuLeafForIdentifier:(id)a3 menu:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (a4)
  {
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    v7 = objc_msgSend(a4, "children", 0);
    uint64_t v8 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v19;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v19 != v10) {
            objc_enumerationMutation(v7);
          }
          v12 = *(void **)(*((void *)&v18 + 1) + 8 * i);
          if ([v12 _isLeaf]
            && ([v12 _internalIdentifier],
                v13 = objc_claimAutoreleasedReturnValue(),
                int v14 = [v13 isEqualToString:v6],
                v13,
                v14))
          {
            id v15 = v12;
          }
          else
          {
            if ([v12 _isLeaf]) {
              continue;
            }
            id v15 = [(_UIHostedMenuManager *)self _menuLeafForIdentifier:v6 menu:v12];
          }
          v16 = v15;
          if (v15) {
            goto LABEL_16;
          }
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v9);
    }
    v16 = 0;
LABEL_16:
  }
  else
  {
    v16 = 0;
  }

  return v16;
}

- (id)_menuForIdentifier:(id)a3 menu:(id)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v7 _internalIdentifier];
  int v9 = [v8 isEqualToString:v6];

  if (v9)
  {
    id v10 = v7;
  }
  else if (v7)
  {
    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    v11 = objc_msgSend(v7, "children", 0);
    uint64_t v12 = [v11 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v20;
      while (2)
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v20 != v14) {
            objc_enumerationMutation(v11);
          }
          v16 = *(void **)(*((void *)&v19 + 1) + 8 * i);
          if (([v16 _isLeaf] & 1) == 0)
          {
            uint64_t v17 = [(_UIHostedMenuManager *)self _menuForIdentifier:v6 menu:v16];
            if (v17)
            {
              id v10 = (id)v17;
              goto LABEL_16;
            }
          }
        }
        uint64_t v13 = [v11 countByEnumeratingWithState:&v19 objects:v23 count:16];
        if (v13) {
          continue;
        }
        break;
      }
    }
    id v10 = 0;
LABEL_16:
  }
  else
  {
    id v10 = 0;
  }

  return v10;
}

- (UIMenu)rootMenu
{
  return self->_rootMenu;
}

- (void)setRootMenu:(id)a3
{
}

- (UIMenu)displayedMenu
{
  return self->_displayedMenu;
}

- (void)setDisplayedMenu:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayedMenu, 0);
  objc_storeStrong((id *)&self->_rootMenu, 0);
}

@end