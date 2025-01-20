@interface MessageListDragDropHelper
+ (OS_os_log)log;
- (BOOL)_canMoveDragItems:(id)a3 toMailboxes:(id)a4;
- (BOOL)collectionView:(id)a3 canHandleDropSession:(id)a4;
- (MessageListDragDropHelper)initWithDataSource:(id)a3 delegate:(id)a4;
- (MessageListDragDropHelperDataSource)dataSource;
- (MessageListDragDropHelperDelegate)delegate;
- (id)_dragItemsForDragSession:(id)a3 atIndexPath:(id)a4;
- (id)collectionView:(id)a3 dragPreviewParametersForItemAtIndexPath:(id)a4;
- (id)collectionView:(id)a3 dropSessionDidUpdate:(id)a4 withDestinationIndexPath:(id)a5;
- (id)collectionView:(id)a3 itemsForAddingToDragSession:(id)a4 atIndexPath:(id)a5 point:(CGPoint)a6;
- (id)collectionView:(id)a3 itemsForBeginningDragSession:(id)a4 atIndexPath:(id)a5;
- (int64_t)_collectionView:(id)a3 dataOwnerForDragSession:(id)a4 atIndexPath:(id)a5;
- (int64_t)_collectionView:(id)a3 dataOwnerForDropSession:(id)a4 withDestinationIndexPath:(id)a5;
- (int64_t)_dataOwnerForMailboxes:(id)a3;
- (void)collectionView:(id)a3 dragSessionWillBegin:(id)a4;
- (void)collectionView:(id)a3 performDropWithCoordinator:(id)a4;
- (void)setDataSource:(id)a3;
- (void)setDelegate:(id)a3;
@end

@implementation MessageListDragDropHelper

- (MessageListDragDropHelper)initWithDataSource:(id)a3 delegate:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)MessageListDragDropHelper;
  v8 = [(MessageListDragDropHelper *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_dataSource, v6);
    objc_storeWeak((id *)&v9->_delegate, v7);
  }

  return v9;
}

+ (OS_os_log)log
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100139690;
  block[3] = &unk_1006044D8;
  block[4] = a1;
  if (qword_1006998D8 != -1) {
    dispatch_once(&qword_1006998D8, block);
  }
  v2 = (void *)qword_1006998D0;

  return (OS_os_log *)v2;
}

- (id)_dragItemsForDragSession:(id)a3 atIndexPath:(id)a4
{
  id v27 = a3;
  id v28 = a4;
  id v6 = +[MessageListDragDropHelper log];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v31 = v28;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Drag source items requested for indexpath: %{public}@", buf, 0xCu);
  }

  id v7 = [(MessageListDragDropHelper *)self dataSource];
  v8 = [v7 messageDragDropHelper:self itemContextForIndexPath:v28];
  if (v8)
  {
    v9 = [v27 items];
    v10 = +[NSMutableArray arrayWithArray:v9];

    objc_super v11 = [v8 messageListItem];
    v12 = +[NSMutableSet setWithObject:v11];

    v13 = [v7 undoManagerForMessageListDragDropHelper:self];
    if ([v10 count])
    {
      v14 = [v10 firstObject];
      v15 = [v14 localObject];
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();

      if (isKindOfClass)
      {
        v17 = [v14 localObject];
        v18 = [v17 messageListItemSelection];
        v19 = [v18 messageListItems];
        [v12 addObjectsFromArray:v19];
      }
      [v14 setLocalObject:0];
    }
    v20 = +[MessageListDragDropHelper log];
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      id v21 = [v12 count];
      *(_DWORD *)buf = 134217984;
      id v31 = v21;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Will begin dragging %lu message list items", buf, 0xCu);
    }

    v22 = [v8 dragItem];
    v23 = [v12 allObjects];
    v24 = +[MFTriageInteraction interactionWithMessageListItems:v23 undoManager:v13 origin:2 actor:2];
    [v22 setLocalObject:v24];

    v29 = v22;
    v25 = +[NSArray arrayWithObjects:&v29 count:1];
  }
  else
  {
    v10 = +[MessageListDragDropHelper log];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v31 = v28;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Context is nil. Cancel drag for item at indexPath: %{public}@", buf, 0xCu);
    }
    v25 = 0;
  }

  return v25;
}

- (id)collectionView:(id)a3 itemsForBeginningDragSession:(id)a4 atIndexPath:(id)a5
{
  v5 = [(MessageListDragDropHelper *)self _dragItemsForDragSession:a4 atIndexPath:a5];

  return v5;
}

- (id)collectionView:(id)a3 dragPreviewParametersForItemAtIndexPath:(id)a4
{
  v5 = [a3 cellForItemAtIndexPath:a4];
  id v6 = [(MessageListDragDropHelper *)self delegate];
  [v6 dragItemCornerRadius:self];

  id v7 = objc_alloc_init((Class)UIDragPreviewParameters);
  [v5 bounds];
  v8 = +[UIBezierPath bezierPathWithRoundedRect:cornerRadius:](UIBezierPath, "bezierPathWithRoundedRect:cornerRadius:");
  [v7 setVisiblePath:v8];

  return v7;
}

- (id)collectionView:(id)a3 itemsForAddingToDragSession:(id)a4 atIndexPath:(id)a5 point:(CGPoint)a6
{
  id v6 = -[MessageListDragDropHelper _dragItemsForDragSession:atIndexPath:](self, "_dragItemsForDragSession:atIndexPath:", a4, a5, a6.x, a6.y);

  return v6;
}

- (void)collectionView:(id)a3 dragSessionWillBegin:(id)a4
{
  id v5 = [(MessageListDragDropHelper *)self delegate];
  [v5 willBeginDragForMessageListDragDropHelper:self];
}

- (BOOL)_canMoveDragItems:(id)a3 toMailboxes:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v22 = v5;
  if ([v6 count])
  {
    id v7 = [v6 ef_compactMap:&stru_100609358];
    v20 = +[NSSet setWithArray:v7];

    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    id obj = v5;
    id v8 = [obj countByEnumeratingWithState:&v27 objects:v32 count:16];
    if (v8)
    {
      uint64_t v19 = *(void *)v28;
      do
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(void *)v28 != v19) {
            objc_enumerationMutation(obj);
          }
          v10 = [*(id *)(*((void *)&v27 + 1) + 8 * i) localObject:v19];
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            long long v25 = 0u;
            long long v26 = 0u;
            long long v23 = 0u;
            long long v24 = 0u;
            id v11 = v20;
            id v12 = [v11 countByEnumeratingWithState:&v23 objects:v31 count:16];
            if (v12)
            {
              uint64_t v13 = *(void *)v24;
              while (2)
              {
                for (j = 0; j != v12; j = (char *)j + 1)
                {
                  if (*(void *)v24 != v13) {
                    objc_enumerationMutation(v11);
                  }
                  uint64_t v15 = *(void *)(*((void *)&v23 + 1) + 8 * (void)j);
                  id v16 = v10;
                  LODWORD(v15) = [v16 isPermittedWithTargetAccount:v15];

                  if (!v15)
                  {

                    BOOL v17 = 0;
                    goto LABEL_23;
                  }
                }
                id v12 = [v11 countByEnumeratingWithState:&v23 objects:v31 count:16];
                if (v12) {
                  continue;
                }
                break;
              }
            }
          }
        }
        id v8 = [obj countByEnumeratingWithState:&v27 objects:v32 count:16];
        BOOL v17 = 1;
      }
      while (v8);
    }
    else
    {
      BOOL v17 = 1;
    }
LABEL_23:
  }
  else
  {
    BOOL v17 = 0;
  }

  return v17;
}

- (id)collectionView:(id)a3 dropSessionDidUpdate:(id)a4 withDestinationIndexPath:(id)a5
{
  id v6 = a4;
  id v7 = [(MessageListDragDropHelper *)self dataSource];
  id v8 = [v7 dropMailboxesForMessageListDragDropHelper:self];

  v9 = [v6 items];
  LODWORD(self) = [(MessageListDragDropHelper *)self _canMoveDragItems:v9 toMailboxes:v8];

  id v10 = objc_alloc((Class)UICollectionViewDropProposal);
  if (self) {
    uint64_t v11 = 3;
  }
  else {
    uint64_t v11 = 1;
  }
  id v12 = [v10 initWithDropOperation:v11 dropLocation:2];

  return v12;
}

- (BOOL)collectionView:(id)a3 canHandleDropSession:(id)a4
{
  id v28 = a4;
  id v5 = [(MessageListDragDropHelper *)self dataSource];
  id v6 = [v5 dropMailboxesForMessageListDragDropHelper:self];

  if (!v6) {
    goto LABEL_21;
  }
  long long v27 = v6;
  id v7 = [v28 items];
  unsigned __int8 v8 = +[MessageListItemDragContext dragItemsAreAllMessageListItems:v7];

  if ((v8 & 1) == 0) {
    goto LABEL_21;
  }
  v9 = [v6 firstObject];
  id v10 = [v9 type];

  v38[0] = _NSConcreteStackBlock;
  v38[1] = 3221225472;
  v38[2] = sub_10013A5FC;
  v38[3] = &unk_100609378;
  v38[4] = v10;
  if (objc_msgSend(v6, "ef_all:", v38))
  {
    long long v26 = +[NSSet setWithArray:v6];
    id v11 = objc_alloc_init((Class)NSMutableSet);
    long long v36 = 0u;
    long long v37 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    id v12 = [v28 items];
    id obj = v12;
    id v13 = [v12 countByEnumeratingWithState:&v34 objects:v40 count:16];
    if (v13)
    {
      uint64_t v14 = *(void *)v35;
      do
      {
        for (i = 0; i != v13; i = (char *)i + 1)
        {
          if (*(void *)v35 != v14) {
            objc_enumerationMutation(obj);
          }
          id v16 = [v34 localObject:v26];
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            long long v32 = 0u;
            long long v33 = 0u;
            long long v30 = 0u;
            long long v31 = 0u;
            BOOL v17 = [v16 messageListItemSelection];
            v18 = [v17 messageListItems];

            id v19 = [v18 countByEnumeratingWithState:&v30 objects:v39 count:16];
            if (v19)
            {
              uint64_t v20 = *(void *)v31;
              do
              {
                for (j = 0; j != v19; j = (char *)j + 1)
                {
                  if (*(void *)v31 != v20) {
                    objc_enumerationMutation(v18);
                  }
                  v22 = [*(id *)(*((void *)&v30 + 1) + 8 * (void)j) mailboxes];
                  [v11 addObjectsFromArray:v22];
                }
                id v19 = [v18 countByEnumeratingWithState:&v30 objects:v39 count:16];
              }
              while (v19);
            }
          }
        }
        id v12 = obj;
        id v13 = [obj countByEnumeratingWithState:&v34 objects:v40 count:16];
      }
      while (v13);
    }

    unsigned __int8 v23 = [v26 intersectsSet:v11];
    char v24 = v23 ^ 1;
    id v6 = v27;
  }
  else
  {
LABEL_21:
    char v24 = 0;
  }

  return v24;
}

- (void)collectionView:(id)a3 performDropWithCoordinator:(id)a4
{
  id v22 = a3;
  id v23 = a4;
  id v6 = [v23 session];
  id v21 = [v6 items];

  id v7 = objc_alloc((Class)UIDragPreviewTarget);
  [v22 bounds];
  double MidX = CGRectGetMidX(v31);
  [v22 bounds];
  double MidY = CGRectGetMidY(v32);
  CGAffineTransformMakeScale(&v29, 0.0, 0.0);
  id v24 = [v7 initWithContainer:v22 center:&v29 transform:MidX, MidY];
  id v10 = [(MessageListDragDropHelper *)self dataSource];
  id v11 = [v10 dropMailboxesForMessageListDragDropHelper:self];

  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v12 = v21;
  id v13 = [v12 countByEnumeratingWithState:&v25 objects:v30 count:16];
  if (v13)
  {
    uint64_t v14 = *(void *)v26;
    do
    {
      for (i = 0; i != v13; i = (char *)i + 1)
      {
        if (*(void *)v26 != v14) {
          objc_enumerationMutation(v12);
        }
        id v16 = *(void **)(*((void *)&v25 + 1) + 8 * i);
        BOOL v17 = [v16 localObject:v21];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v18 = v17;
          id v19 = [v11 firstObject];
          [v18 setTargetMailbox:v19];

          [v18 performInteraction];
          id v20 = [v23 dropItem:v16 toTarget:v24];
        }
      }
      id v13 = [v12 countByEnumeratingWithState:&v25 objects:v30 count:16];
    }
    while (v13);
  }
}

- (int64_t)_dataOwnerForMailboxes:(id)a3
{
  id v3 = a3;
  v4 = v3;
  if (v3)
  {
    if (objc_msgSend(v3, "ef_any:", &stru_100609398)) {
      int64_t v5 = 2;
    }
    else {
      int64_t v5 = 1;
    }
  }
  else
  {
    int64_t v5 = 0;
  }

  return v5;
}

- (int64_t)_collectionView:(id)a3 dataOwnerForDragSession:(id)a4 atIndexPath:(id)a5
{
  id v6 = a5;
  id v7 = [(MessageListDragDropHelper *)self dataSource];
  unsigned __int8 v8 = [v7 messageDragDropHelper:self itemContextForIndexPath:v6];

  v9 = [v8 messageListItem];
  id v10 = [v9 mailboxes];
  int64_t v11 = [(MessageListDragDropHelper *)self _dataOwnerForMailboxes:v10];

  return v11;
}

- (int64_t)_collectionView:(id)a3 dataOwnerForDropSession:(id)a4 withDestinationIndexPath:(id)a5
{
  id v6 = [(MessageListDragDropHelper *)self dataSource];
  id v7 = [v6 dropMailboxesForMessageListDragDropHelper:self];

  int64_t v8 = [(MessageListDragDropHelper *)self _dataOwnerForMailboxes:v7];
  return v8;
}

- (MessageListDragDropHelperDataSource)dataSource
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);

  return (MessageListDragDropHelperDataSource *)WeakRetained;
}

- (void)setDataSource:(id)a3
{
}

- (MessageListDragDropHelperDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (MessageListDragDropHelperDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);

  objc_destroyWeak((id *)&self->_dataSource);
}

@end