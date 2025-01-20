@interface UIDragItem(MobileSafariExtras)
+ (id)safari_itemWithTab:()MobileSafariExtras tabItem:browserController:;
+ (uint64_t)safari_itemWithTab:()MobileSafariExtras browserController:;
- (id)safari_localBrowserController;
- (id)safari_localSourceTabView;
- (id)safari_localTab;
- (id)safari_localTabItem;
- (id)safari_localWBTab;
- (uint64_t)safari_dragPreviewRequiresUpdateForTabView:()MobileSafariExtras pinned:;
- (uint64_t)safari_localTabIsPinnable;
@end

@implementation UIDragItem(MobileSafariExtras)

+ (uint64_t)safari_itemWithTab:()MobileSafariExtras browserController:
{
  return objc_msgSend(a1, "safari_itemWithTab:tabItem:browserController:", a3, 0, a4);
}

+ (id)safari_itemWithTab:()MobileSafariExtras tabItem:browserController:
{
  v8 = (void *)MEMORY[0x1E4F28D78];
  id v9 = a5;
  id v10 = a4;
  id v11 = a3;
  v12 = objc_msgSend(v8, "safari_itemProviderForTab:browserController:", v11, v9);
  v13 = (void *)[[a1 alloc] initWithItemProvider:v12];
  v14 = objc_alloc_init(TabDragMetadata);
  [(TabDragMetadata *)v14 setTab:v11];

  [(TabDragMetadata *)v14 setTabItem:v10];
  [(TabDragMetadata *)v14 setBrowserController:v9];

  [v13 setLocalObject:v14];
  return v13;
}

- (id)safari_localWBTab
{
  v1 = -[UIDragItem _safari_localTabDragMetadata](a1);
  v2 = [v1 tab];

  return v2;
}

- (uint64_t)safari_localTabIsPinnable
{
  v2 = objc_msgSend(a1, "safari_localBrowserController");
  v3 = [v2 tabController];
  v4 = objc_msgSend(a1, "safari_localWBTab");
  uint64_t v5 = [v3 isTabPinnable:v4];

  return v5;
}

- (id)safari_localTabItem
{
  v1 = -[UIDragItem _safari_localTabDragMetadata](a1);
  v2 = [v1 tabItem];

  return v2;
}

- (id)safari_localBrowserController
{
  v1 = -[UIDragItem _safari_localTabDragMetadata](a1);
  v2 = [v1 browserController];

  return v2;
}

- (id)safari_localTab
{
  id v2 = objc_alloc(MEMORY[0x1E4F29128]);
  v3 = objc_msgSend(a1, "safari_localWBTab");
  v4 = [v3 uuid];
  uint64_t v5 = (void *)[v2 initWithUUIDString:v4];

  v6 = objc_msgSend(a1, "safari_localBrowserController");
  v7 = [v6 tabController];
  v8 = [v7 tabWithUUID:v5];

  return v8;
}

- (id)safari_localSourceTabView
{
  id v2 = objc_msgSend(a1, "safari_localTabItem");
  if (v2)
  {
    v3 = objc_msgSend(a1, "safari_localBrowserController");
    v4 = [v3 tabCollectionViewProvider];
    uint64_t v5 = [v4 tabCollectionViewForItem:v2];
  }
  else
  {
    uint64_t v5 = 0;
  }

  return v5;
}

- (uint64_t)safari_dragPreviewRequiresUpdateForTabView:()MobileSafariExtras pinned:
{
  id v6 = a3;
  v7 = -[UIDragItem _safari_localTabDragMetadata](a1);
  v8 = [v7 targetTabViewForDragPreview];
  id v9 = v8;
  if (v8)
  {
    id v10 = v8;
  }
  else
  {
    objc_msgSend(a1, "safari_localSourceTabView");
    id v10 = (id)objc_claimAutoreleasedReturnValue();
  }
  id v11 = v10;

  [v7 setTargetTabViewForDragPreview:v6];
  int v12 = [v7 dragPreviewPinned];
  [v7 setDragPreviewPinned:a4];

  if (v11 == v6) {
    uint64_t v13 = v12 ^ a4;
  }
  else {
    uint64_t v13 = 1;
  }

  return v13;
}

@end