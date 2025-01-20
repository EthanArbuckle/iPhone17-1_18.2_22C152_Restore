@interface _UIBarButtonItemSearchBarGroup
- (BOOL)_disabledExpansion;
- (BOOL)_isCritical;
- (_UIBarButtonItemSearchBarGroup)initWithBarButtonItems:(id)a3 representativeItem:(id)a4;
- (double)_contextualExpandedPadding;
- (id)searchBar;
- (id)searchItem;
- (void)_checkInstanceVariables;
- (void)setBarButtonItems:(id)a3;
- (void)setHidden:(BOOL)a3;
- (void)setProvidesRestingMeasurementValues:(uint64_t)a1;
- (void)setRepresentativeItem:(id)a3;
@end

@implementation _UIBarButtonItemSearchBarGroup

- (void)setHidden:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)_UIBarButtonItemSearchBarGroup;
  -[UIBarButtonItemGroup setHidden:](&v5, sel_setHidden_);
  if (v3) {
    self->_disabledExpansion = 0;
  }
}

- (id)searchBar
{
  if (WeakRetained)
  {
    WeakRetained = (id *)objc_loadWeakRetained(WeakRetained + 15);
    uint64_t v1 = vars8;
  }
  return WeakRetained;
}

- (_UIBarButtonItemSearchBarGroup)initWithBarButtonItems:(id)a3 representativeItem:(id)a4
{
  v6.receiver = self;
  v6.super_class = (Class)_UIBarButtonItemSearchBarGroup;
  v4 = [(UIBarButtonItemGroup *)&v6 initWithBarButtonItems:a3 representativeItem:a4];
  -[_UIBarButtonItemSearchBarGroup _checkInstanceVariables]((uint64_t)v4);
  return v4;
}

- (void)_checkInstanceVariables
{
  if (a1)
  {
    id v8 = *(id *)(a1 + 8);
    if ((unint64_t)[v8 count] >= 2)
    {
      v7 = [MEMORY[0x1E4F28B00] currentHandler];
      [v7 handleFailureInMethod:sel__checkInstanceVariables, a1, @"_UIBarButtonItemSearchBarGroup.m", 29, @"Too many items assigned to a _UIBarButtonItemSearchBarGroup. Fix this. self = %@", a1 object file lineNumber description];
    }
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 120));
    if (WeakRetained)
    {
      BOOL v3 = WeakRetained;
      id v4 = objc_loadWeakRetained((id *)(a1 + 120));
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();

      if ((isKindOfClass & 1) == 0)
      {
        objc_super v6 = [MEMORY[0x1E4F28B00] currentHandler];
        [v6 handleFailureInMethod:sel__checkInstanceVariables, a1, @"_UIBarButtonItemSearchBarGroup.m", 30, @"_UIBarButtonItemSearchBarGroup's item's view must be a UISearchBar. Fix this. self = %@", a1 object file lineNumber description];
      }
    }
  }
}

- (BOOL)_isCritical
{
  return 1;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_searchIconItem);
  objc_destroyWeak((id *)&self->_searchBar);
  objc_destroyWeak((id *)&self->_searchItem);
}

- (void)setBarButtonItems:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)_UIBarButtonItemSearchBarGroup;
  id v4 = a3;
  [(UIBarButtonItemGroup *)&v8 setBarButtonItems:v4];
  objc_super v5 = objc_msgSend(v4, "firstObject", v8.receiver, v8.super_class);

  objc_storeWeak((id *)&self->_searchItem, v5);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_searchItem);
  v7 = [WeakRetained view];
  objc_storeWeak((id *)&self->_searchBar, v7);

  -[_UIBarButtonItemSearchBarGroup _checkInstanceVariables]((uint64_t)self);
}

- (void)setRepresentativeItem:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    v5.receiver = self;
    v5.super_class = (Class)_UIBarButtonItemSearchBarGroup;
    [(UIBarButtonItemGroup *)&v5 setRepresentativeItem:v4];
    objc_storeWeak((id *)&self->_searchIconItem, v4);
  }
  else if (self->_providesRestingMeasurementValues)
  {
    self->_hadRepresentativeItemBeforeMovingToProvisionalState = 0;
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)_UIBarButtonItemSearchBarGroup;
    [(UIBarButtonItemGroup *)&v5 setRepresentativeItem:0];
  }
}

- (void)setProvidesRestingMeasurementValues:(uint64_t)a1
{
  if (a1)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 120));
    [WeakRetained _setProvidesRestingMeasurementValues:a2];

    if (a2)
    {
      objc_super v5 = [(id)a1 representativeItem];
      *(unsigned char *)(a1 + 88) = v5 != 0;

      if (!*(unsigned char *)(a1 + 88))
      {
        id v6 = objc_loadWeakRetained((id *)(a1 + 128));
        v7 = v6;
        if (v6)
        {
          id v8 = v6;
        }
        else
        {
          id v12 = objc_loadWeakRetained((id *)(a1 + 120));
          id v8 = [v12 _searchIconBarButtonItem];
        }
        v17.receiver = (id)a1;
        v17.super_class = (Class)_UIBarButtonItemSearchBarGroup;
        objc_msgSendSuper2(&v17, sel_setRepresentativeItem_, v8);
        id v11 = objc_loadWeakRetained((id *)(a1 + 120));
        [v11 _idealInlineWidthForLayoutState:2];
        double v14 = v13;
        id v15 = objc_loadWeakRetained((id *)(a1 + 112));
        [v15 _setWidth:v14];

        goto LABEL_10;
      }
    }
    else if (!*(unsigned char *)(a1 + 88))
    {
      v16.receiver = (id)a1;
      v16.super_class = (Class)_UIBarButtonItemSearchBarGroup;
      objc_msgSendSuper2(&v16, sel_setRepresentativeItem_, 0);
      id v8 = objc_loadWeakRetained((id *)(a1 + 120));
      [v8 _idealInlineWidthForLayoutState:3];
      double v10 = v9;
      id v11 = objc_loadWeakRetained((id *)(a1 + 112));
      [v11 _setWidth:v10];
LABEL_10:
    }
    *(unsigned char *)(a1 + 104) = a2;
  }
}

- (BOOL)_disabledExpansion
{
  return self->_disabledExpansion;
}

- (double)_contextualExpandedPadding
{
  return self->_contextualExpandedPadding;
}

- (id)searchItem
{
  if (WeakRetained)
  {
    id WeakRetained = (id *)objc_loadWeakRetained(WeakRetained + 14);
    uint64_t v1 = vars8;
  }
  return WeakRetained;
}

@end