@interface ContinuousReadingController
- (BOOL)unreadReadingListItemsOnly;
- (ContinuousReadingController)initWithTabController:(id)a3;
- (id)_itemAtIndex:(unsigned int)a3 inReadingList:(id)a4;
- (id)_tabDocument;
- (id)currentReadingListItem;
- (id)nextReadingListItem;
- (id)previousReadingListItem;
- (void)_clearCachedItems;
- (void)_updateCachedItemsIfNeeded;
- (void)dealloc;
- (void)setUnreadReadingListItemsOnly:(BOOL)a3;
@end

@implementation ContinuousReadingController

- (id)nextReadingListItem
{
  [(ContinuousReadingController *)self _updateCachedItemsIfNeeded];
  nextContinuousItem = self->_nextContinuousItem;
  return nextContinuousItem;
}

- (ContinuousReadingController)initWithTabController:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)ContinuousReadingController;
  v6 = [(ContinuousReadingController *)&v10 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_tabController, a3);
    v8 = v7;
  }

  return v7;
}

- (void)_updateCachedItemsIfNeeded
{
  v3 = [(ContinuousReadingController *)self _tabDocument];
  uint64_t v4 = [v3 readingListBookmarkID];

  if (v4)
  {
    if (self->_activeDocumentBookmarkID != v4)
    {
      [(ContinuousReadingController *)self _clearCachedItems];
      self->_activeDocumentBookmarkID = v4;
      id v23 = [MEMORY[0x1E4FB60E8] mainBookmarkCollection];
      id v5 = [v23 bookmarkWithID:v4];
      v6 = +[ContinuousReadingItem itemWithReadingListItem:v5];
      currentContinuousItem = self->_currentContinuousItem;
      self->_currentContinuousItem = v6;

      unint64_t v8 = [v23 indexOfReadingListBookmark:v5 countingOnlyUnread:self->_unreadReadingListItemsOnly];
      unint64_t v9 = v8;
      objc_super v10 = [MEMORY[0x1E4FB60E8] mainBookmarkCollection];
      v11 = [v10 readingListWithUnreadOnly:self->_unreadReadingListItemsOnly];

      v12 = 0;
      uint64_t v13 = (v8 + 1);
      while (1)
      {
        v14 = v12;
        v12 = [(ContinuousReadingController *)self _itemAtIndex:v13 inReadingList:v11];

        if (!v12) {
          break;
        }
        v15 = -[WebBookmark safari_bestCurrentURL](v12);

        uint64_t v13 = (v13 + 1);
        if (v15)
        {
          v16 = +[ContinuousReadingItem itemWithReadingListItem:v12];
          nextContinuousItem = self->_nextContinuousItem;
          self->_nextContinuousItem = v16;

          break;
        }
      }
      v18 = 0;
      while (v9 - 1 < v8)
      {
        v19 = [(ContinuousReadingController *)self _itemAtIndex:(v9 - 1) inReadingList:v11];

        if (!v19) {
          goto LABEL_18;
        }
        v20 = -[WebBookmark safari_bestCurrentURL](v19);

        v18 = v19;
        --v9;
        if (v20) {
          goto LABEL_17;
        }
      }
      v19 = v18;
      if (!v18) {
        goto LABEL_18;
      }
LABEL_17:
      v21 = +[ContinuousReadingItem itemWithReadingListItem:v19];
      previousContinuousItem = self->_previousContinuousItem;
      self->_previousContinuousItem = v21;

LABEL_18:
    }
  }
  else
  {
    [(ContinuousReadingController *)self _clearCachedItems];
  }
}

- (id)_tabDocument
{
  return [(TabController *)self->_tabController activeTabDocument];
}

- (void)_clearCachedItems
{
  self->_activeDocumentBookmarkID = 0;
  currentContinuousItem = self->_currentContinuousItem;
  self->_currentContinuousItem = 0;

  nextContinuousItem = self->_nextContinuousItem;
  self->_nextContinuousItem = 0;

  previousContinuousItem = self->_previousContinuousItem;
  self->_previousContinuousItem = 0;
}

- (void)dealloc
{
  [(ContinuousReadingController *)self _clearCachedItems];
  v3.receiver = self;
  v3.super_class = (Class)ContinuousReadingController;
  [(ContinuousReadingController *)&v3 dealloc];
}

- (id)currentReadingListItem
{
  [(ContinuousReadingController *)self _updateCachedItemsIfNeeded];
  currentContinuousItem = self->_currentContinuousItem;
  return currentContinuousItem;
}

- (id)previousReadingListItem
{
  [(ContinuousReadingController *)self _updateCachedItemsIfNeeded];
  previousContinuousItem = self->_previousContinuousItem;
  return previousContinuousItem;
}

- (id)_itemAtIndex:(unsigned int)a3 inReadingList:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v5 = a4;
  if ([v5 bookmarkCount] <= v4)
  {
    v6 = 0;
  }
  else
  {
    v6 = [v5 bookmarkAtIndex:v4];
  }

  return v6;
}

- (BOOL)unreadReadingListItemsOnly
{
  return self->_unreadReadingListItemsOnly;
}

- (void)setUnreadReadingListItemsOnly:(BOOL)a3
{
  self->_unreadReadingListItemsOnly = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_previousContinuousItem, 0);
  objc_storeStrong((id *)&self->_nextContinuousItem, 0);
  objc_storeStrong((id *)&self->_currentContinuousItem, 0);
  objc_storeStrong((id *)&self->_tabController, 0);
}

@end