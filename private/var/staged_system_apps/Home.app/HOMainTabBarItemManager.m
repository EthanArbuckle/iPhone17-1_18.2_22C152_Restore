@interface HOMainTabBarItemManager
- (HFRoomItemProvider)roomItemProvider;
- (HOMainTabItemProvider)tabItemProvider;
- (id)_buildItemProvidersForHome:(id)a3;
- (id)_buildSectionsWithDisplayedItems:(id)a3;
- (void)setRoomItemProvider:(id)a3;
- (void)setTabItemProvider:(id)a3;
@end

@implementation HOMainTabBarItemManager

- (id)_buildItemProvidersForHome:(id)a3
{
  id v4 = a3;
  v5 = +[NSMutableArray array];
  v6 = [[HOMainTabItemProvider alloc] initWithHome:v4];

  [(HOMainTabBarItemManager *)self setTabItemProvider:v6];
  v7 = [(HOMainTabBarItemManager *)self tabItemProvider];
  [v5 addObject:v7];

  return v5;
}

- (id)_buildSectionsWithDisplayedItems:(id)a3
{
  id v4 = a3;
  v5 = +[NSMutableArray array];
  id v6 = [objc_alloc((Class)HFMutableItemSection) initWithIdentifier:@"HOMainTabBarItemManagerTabSectionIdentifier"];
  v7 = [(HOMainTabBarItemManager *)self tabItemProvider];
  v8 = [v7 orderedTabItems];
  [v6 setItems:v8 filteringToDisplayedItems:v4];

  [v5 addObject:v6];
  v9 = [(HOMainTabBarItemManager *)self roomItemProvider];

  if (v9)
  {
    id v10 = [objc_alloc((Class)HFMutableItemSection) initWithIdentifier:@"HOMainTabBarItemManagerRoomSectionIdentifier"];
    v11 = [(HOMainTabBarItemManager *)self roomItemProvider];
    v12 = [v11 items];
    v13 = [v12 allObjects];
    v14 = +[HFItemSection defaultItemComparator];
    v15 = [v13 sortedArrayUsingComparator:v14];
    [v10 setItems:v15 filteringToDisplayedItems:v4];

    [v5 addObject:v10];
  }

  return v5;
}

- (HFRoomItemProvider)roomItemProvider
{
  return self->_roomItemProvider;
}

- (void)setRoomItemProvider:(id)a3
{
}

- (HOMainTabItemProvider)tabItemProvider
{
  return self->_tabItemProvider;
}

- (void)setTabItemProvider:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tabItemProvider, 0);

  objc_storeStrong((id *)&self->_roomItemProvider, 0);
}

@end