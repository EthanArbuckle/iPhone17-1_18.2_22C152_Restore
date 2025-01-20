@interface TabGroupTabOrderProvider
- (TabGroupTabOrderProvider)initWithTabGroup:(id)a3;
- (WBSOrderedTab)selectedTabForTabOrderProvider;
- (WBTabGroup)tabGroup;
- (id)orderedTabsForTabs:(id)a3;
- (id)originatingTabForTab:(id)a3;
- (id)tabAtIndex:(unint64_t)a3;
- (id)wbTabForOrderedTab:(id)a3;
- (unint64_t)indexForTab:(id)a3;
- (unint64_t)indexOfSelectedTab;
- (unint64_t)numberOfTabs;
@end

@implementation TabGroupTabOrderProvider

- (TabGroupTabOrderProvider)initWithTabGroup:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)TabGroupTabOrderProvider;
  v6 = [(TabGroupTabOrderProvider *)&v10 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_tabGroup, a3);
    v8 = v7;
  }

  return v7;
}

- (id)wbTabForOrderedTab:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = [v4 tab];
  }
  else
  {
    tabGroup = self->_tabGroup;
    uint64_t v7 = [v4 identifier];

    id v5 = [(WBTabGroup *)tabGroup tabWithUUID:v7];
    id v4 = (id)v7;
  }

  return v5;
}

- (id)orderedTabsForTabs:(id)a3
{
  return (id)objc_msgSend(a3, "safari_mapObjectsUsingBlock:", &__block_literal_global_47);
}

OrderedWBTabWrapper *__47__TabGroupTabOrderProvider_orderedTabsForTabs___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = [[OrderedWBTabWrapper alloc] initWithWBTab:v2];

  return v3;
}

- (unint64_t)indexForTab:(id)a3
{
  tabGroup = self->_tabGroup;
  id v5 = a3;
  v6 = [(WBTabGroup *)tabGroup tabs];
  uint64_t v7 = [(TabGroupTabOrderProvider *)self wbTabForOrderedTab:v5];

  unint64_t v8 = [v6 indexOfObject:v7];
  return v8;
}

- (unint64_t)indexOfSelectedTab
{
  v3 = [(WBTabGroup *)self->_tabGroup tabs];
  id v4 = [(TabGroupTabOrderProvider *)self selectedTabForTabOrderProvider];
  id v5 = [(TabGroupTabOrderProvider *)self wbTabForOrderedTab:v4];
  unint64_t v6 = [v3 indexOfObject:v5];

  return v6;
}

- (unint64_t)numberOfTabs
{
  id v2 = [(WBTabGroup *)self->_tabGroup tabs];
  unint64_t v3 = [v2 count];

  return v3;
}

- (id)originatingTabForTab:(id)a3
{
  id v4 = a3;
  if ([v4 shouldSelectOriginatingTabWhenClosed])
  {
    id v5 = [v4 ancestorTabIdentifiers];
    unint64_t v6 = [v5 lastObject];

    if (v6)
    {
      uint64_t v7 = [OrderedWBTabWrapper alloc];
      unint64_t v8 = [(WBTabGroup *)self->_tabGroup tabWithUUID:v6];
      v9 = [(OrderedWBTabWrapper *)v7 initWithWBTab:v8];
    }
    else
    {
      v9 = 0;
    }
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (WBSOrderedTab)selectedTabForTabOrderProvider
{
  id v2 = self->_tabGroup;
  unint64_t v3 = [OrderedWBTabWrapper alloc];
  id v4 = [(WBTabGroup *)v2 lastSelectedTabUUID];
  id v5 = [(WBTabGroup *)v2 tabWithUUID:v4];

  unint64_t v6 = [(OrderedWBTabWrapper *)v3 initWithWBTab:v5];
  return (WBSOrderedTab *)v6;
}

- (id)tabAtIndex:(unint64_t)a3
{
  id v5 = [OrderedWBTabWrapper alloc];
  unint64_t v6 = [(WBTabGroup *)self->_tabGroup tabs];
  uint64_t v7 = [v6 objectAtIndexedSubscript:a3];
  unint64_t v8 = [(OrderedWBTabWrapper *)v5 initWithWBTab:v7];

  return v8;
}

- (WBTabGroup)tabGroup
{
  return self->_tabGroup;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tabGroup, 0);
  objc_storeStrong((id *)&self->_overrideActiveTabGroupUUID, 0);
}

@end