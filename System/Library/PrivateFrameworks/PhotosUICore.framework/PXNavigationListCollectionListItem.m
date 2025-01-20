@interface PXNavigationListCollectionListItem
- (PXNavigationListCollectionListItem)initWithCollectionList:(id)a3 itemCount:(int64_t)a4 containerIdentifier:(id)a5;
- (id)copyWithZone:(_NSZone *)a3;
@end

@implementation PXNavigationListCollectionListItem

- (id)copyWithZone:(_NSZone *)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PXNavigationListCollectionListItem;
  return [(PXNavigationListDisplayCollectionListItem *)&v4 copyWithZone:a3];
}

- (PXNavigationListCollectionListItem)initWithCollectionList:(id)a3 itemCount:(int64_t)a4 containerIdentifier:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v10 = [v8 transientIdentifier];
  v11 = v10;
  if (v10)
  {
    id v12 = v10;
  }
  else
  {
    id v12 = [v8 localIdentifier];
  }
  v13 = v12;

  v14 = objc_msgSend(v8, "px_localizedTitle");
  v19.receiver = self;
  v19.super_class = (Class)PXNavigationListCollectionListItem;
  v15 = [(PXNavigationListDisplayCollectionListItem *)&v19 initWithIdentifier:v13 displayCollectionList:v8 title:v14 itemCount:a4 containerIdentifier:v9];

  if (v15)
  {
    uint64_t v16 = ([v8 isTransient] & 1) == 0
       && [(PXNavigationListDisplayCollectionListItem *)v15 isDraggable];
    [(PXNavigationListDisplayCollectionListItem *)v15 setDraggable:v16];
    if (([v8 isTransient] & 1) != 0
      || ![(PXNavigationListDisplayCollectionListItem *)v15 isReorderable])
    {
      uint64_t v17 = 0;
    }
    else
    {
      uint64_t v17 = [v8 collectionHasFixedOrder] ^ 1;
    }
    [(PXNavigationListDisplayCollectionListItem *)v15 setReorderable:v17];
  }

  return v15;
}

@end