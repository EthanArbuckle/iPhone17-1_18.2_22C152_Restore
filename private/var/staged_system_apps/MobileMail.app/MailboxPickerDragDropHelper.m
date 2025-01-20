@interface MailboxPickerDragDropHelper
- (BOOL)_canMoveDragItems:(id)a3 toFavoriteItem:(id)a4;
- (BOOL)_dragItemsAreAllMessages:(id)a3;
- (BOOL)collectionView:(id)a3 canHandleDropSession:(id)a4;
- (MailboxPickerDragDropHelper)initWithDelegate:(id)a3;
- (MailboxPickerDragDropHelperDelegate)delegate;
- (id)collectionView:(id)a3 dropSessionDidUpdate:(id)a4 withDestinationIndexPath:(id)a5;
- (int64_t)_collectionView:(id)a3 dataOwnerForDropSession:(id)a4 withDestinationIndexPath:(id)a5;
- (void)collectionView:(id)a3 dropSessionDidEnter:(id)a4;
- (void)collectionView:(id)a3 dropSessionDidExit:(id)a4;
- (void)collectionView:(id)a3 performDropWithCoordinator:(id)a4;
- (void)setDelegate:(id)a3;
@end

@implementation MailboxPickerDragDropHelper

- (MailboxPickerDragDropHelper)initWithDelegate:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)MailboxPickerDragDropHelper;
  v5 = [(MailboxPickerDragDropHelper *)&v8 init];
  v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->_delegate, v4);
  }

  return v6;
}

- (BOOL)collectionView:(id)a3 canHandleDropSession:(id)a4
{
  v5 = [a4 items:a3];
  LOBYTE(self) = [(MailboxPickerDragDropHelper *)self _dragItemsAreAllMessages:v5];

  return (char)self;
}

- (void)collectionView:(id)a3 dropSessionDidEnter:(id)a4
{
  v17 = [a4 items:a3];
  v5 = v17;
  if ([(MailboxPickerDragDropHelper *)self _dragItemsAreAllMessages:v17])
  {
    v6 = +[UIImage imageNamed:@"MFMailMessageDragPreview"];
    [v6 size];
    double v8 = v7;
    [v6 size];
    v16 = +[UIBezierPath bezierPathWithRoundedRect:cornerRadius:](UIBezierPath, "bezierPathWithRoundedRect:cornerRadius:", 0.0, 0.0, v8, v9, 4.0);
    id v10 = objc_alloc_init((Class)UIDragPreviewParameters);
    [v10 setVisiblePath:v16];
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    id v11 = v17;
    id v12 = [v11 countByEnumeratingWithState:&v21 objects:v25 count:16];
    if (v12)
    {
      uint64_t v13 = *(void *)v22;
      do
      {
        for (i = 0; i != v12; i = (char *)i + 1)
        {
          if (*(void *)v22 != v13) {
            objc_enumerationMutation(v11);
          }
          v15 = *(void **)(*((void *)&v21 + 1) + 8 * i);
          v18[0] = _NSConcreteStackBlock;
          v18[1] = 3221225472;
          v18[2] = sub_1000F8AD8;
          v18[3] = &unk_1006080C8;
          id v19 = v6;
          id v20 = v10;
          [v15 setPreviewProvider:v18];
        }
        id v12 = [v11 countByEnumeratingWithState:&v21 objects:v25 count:16];
      }
      while (v12);
    }

    v5 = v17;
  }
}

- (void)collectionView:(id)a3 dropSessionDidExit:(id)a4
{
  id v5 = a4;
  v6 = [v5 items];
  LODWORD(self) = [(MailboxPickerDragDropHelper *)self _dragItemsAreAllMessages:v6];

  if (self)
  {
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    double v7 = [v5 items];
    id v8 = [v7 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v8)
    {
      uint64_t v9 = *(void *)v12;
      do
      {
        id v10 = 0;
        do
        {
          if (*(void *)v12 != v9) {
            objc_enumerationMutation(v7);
          }
          [*(id *)(*((void *)&v11 + 1) + 8 * (void)v10) setPreviewProvider:0];
          id v10 = (char *)v10 + 1;
        }
        while (v8 != v10);
        id v8 = [v7 countByEnumeratingWithState:&v11 objects:v15 count:16];
      }
      while (v8);
    }
  }
}

- (void)collectionView:(id)a3 performDropWithCoordinator:(id)a4
{
  id v32 = a3;
  id v33 = a4;
  v34 = self;
  v35 = [(MailboxPickerDragDropHelper *)self delegate];
  v6 = [v33 destinationIndexPath];
  if (v6)
  {
    v36 = v6;
    double v7 = [v32 cellForItemAtIndexPath:];
    [v7 bounds];
    CGFloat v9 = v8;
    CGFloat v11 = v10;
    CGFloat v13 = v12;
    CGFloat v15 = v14;

    v42.origin.x = v9;
    v42.origin.y = v11;
    v42.size.width = v13;
    v42.size.height = v15;
    double MidX = CGRectGetMidX(v42);
    v43.origin.x = v9;
    v43.origin.y = v11;
    v43.size.width = v13;
    v43.size.height = v15;
    double MidY = CGRectGetMidY(v43);
    long long v39 = 0u;
    long long v40 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    v18 = [v33 items];
    id v19 = [v18 countByEnumeratingWithState:&v37 objects:v41 count:16];
    if (v19)
    {
      uint64_t v20 = *(void *)v38;
      do
      {
        for (i = 0; i != v19; i = (char *)i + 1)
        {
          if (*(void *)v38 != v20) {
            objc_enumerationMutation(v18);
          }
          long long v22 = *(void **)(*((void *)&v37 + 1) + 8 * i);
          long long v23 = [v22 sourceIndexPath];
          BOOL v24 = v23 == 0;

          if (v24)
          {
            v25 = [v22 dragItem];
            v26 = [v25 localObject];
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              id v27 = v26;
              v28 = [v35 mailboxPickerDragDropHelper:v34 favoriteItemAtIndexPath:v36];
              if ([v28 type] == (id)4)
              {
                [v28 mailboxType];
                [v27 setTargetMailboxType:ECMailboxTypeFromMailboxUidType()];
              }
              else
              {
                v29 = [v28 representingMailbox];
                v30 = [v35 mailboxPickerDragDropHelper:v34 mailboxForMailboxUid:v29];
                [v27 setTargetMailbox:v30];
              }
              [v27 performInteraction];
              id v31 = [v33 dropItem:v25 intoItemAtIndexPath:v36 rect:MidX, MidY, 0.0, 0.0];
            }
          }
        }
        id v19 = [v18 countByEnumeratingWithState:&v37 objects:v41 count:16];
      }
      while (v19);
    }

    v6 = v36;
  }
}

- (id)collectionView:(id)a3 dropSessionDidUpdate:(id)a4 withDestinationIndexPath:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v10)
  {
    CGFloat v11 = [v9 localDragSession];

    if (v11)
    {
      if ([v8 hasActiveDrag])
      {
        uint64_t v12 = 1;
        uint64_t v13 = 3;
        goto LABEL_14;
      }
      double v14 = [v9 items];
      unsigned int v15 = [(MailboxPickerDragDropHelper *)self _dragItemsAreAllMessages:v14];

      if (v15)
      {
        v16 = [(MailboxPickerDragDropHelper *)self delegate];
        v17 = [v16 mailboxPickerDragDropHelper:self favoriteItemAtIndexPath:v10];

        v18 = [v9 items];
        unsigned int v19 = [(MailboxPickerDragDropHelper *)self _canMoveDragItems:v18 toFavoriteItem:v17];

        if (v19) {
          uint64_t v13 = 3;
        }
        else {
          uint64_t v13 = 1;
        }
        if (v19) {
          uint64_t v12 = 2;
        }
        else {
          uint64_t v12 = 0;
        }

        goto LABEL_14;
      }
    }
  }
  uint64_t v12 = 0;
  uint64_t v13 = 1;
LABEL_14:
  id v20 = [objc_alloc((Class)UICollectionViewDropProposal) initWithDropOperation:v13 intent:v12];

  return v20;
}

- (int64_t)_collectionView:(id)a3 dataOwnerForDropSession:(id)a4 withDestinationIndexPath:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (!v10) {
    goto LABEL_13;
  }
  CGFloat v11 = [v9 localDragSession];
  if (!v11 || ([v8 hasActiveDrag] & 1) != 0) {
    goto LABEL_4;
  }
  uint64_t v13 = [v9 items];
  unsigned int v14 = [(MailboxPickerDragDropHelper *)self _dragItemsAreAllMessages:v13];

  if (!v14)
  {
LABEL_13:
    int64_t v12 = 3;
    goto LABEL_14;
  }
  unsigned int v15 = [(MailboxPickerDragDropHelper *)self delegate];
  CGFloat v11 = [v15 mailboxPickerDragDropHelper:self favoriteItemAtIndexPath:v10];

  if ([v11 acceptsMessageTransfers])
  {
    v16 = [v11 account];

    if (v16)
    {
      v17 = [v11 account];
      if ([v17 sourceIsManaged]) {
        int64_t v12 = 2;
      }
      else {
        int64_t v12 = 1;
      }

      goto LABEL_5;
    }
  }
LABEL_4:
  int64_t v12 = 3;
LABEL_5:

LABEL_14:
  return v12;
}

- (BOOL)_dragItemsAreAllMessages:(id)a3
{
  id v3 = a3;
  if (+[MessageListItemDragContext dragItemsAreAllMessageListItems:v3])
  {
    unsigned __int8 v4 = 1;
  }
  else
  {
    unsigned __int8 v4 = +[MFMailMessage dragItemsAreAllMessages:v3];
  }

  return v4;
}

- (BOOL)_canMoveDragItems:(id)a3 toFavoriteItem:(id)a4
{
  id v16 = a3;
  id v5 = a4;
  if ([v5 acceptsMessageTransfers])
  {
    v6 = [v5 account];
    if (v6)
    {
      long long v19 = 0u;
      long long v20 = 0u;
      long long v17 = 0u;
      long long v18 = 0u;
      id v7 = v16;
      id v8 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
      if (v8)
      {
        uint64_t v9 = *(void *)v18;
        while (2)
        {
          for (i = 0; i != v8; i = (char *)i + 1)
          {
            if (*(void *)v18 != v9) {
              objc_enumerationMutation(v7);
            }
            CGFloat v11 = [*(id *)(*((void *)&v17 + 1) + 8 * i) localObject];
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              id v12 = v11;
              unsigned __int8 v13 = [v12 isPermittedWithTargetAccount:v6];

              if ((v13 & 1) == 0)
              {

                BOOL v14 = 0;
                goto LABEL_16;
              }
            }
          }
          id v8 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
          if (v8) {
            continue;
          }
          break;
        }
      }
      BOOL v14 = 1;
LABEL_16:
    }
    else
    {
      BOOL v14 = 0;
    }
  }
  else
  {
    BOOL v14 = 0;
  }

  return v14;
}

- (MailboxPickerDragDropHelperDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (MailboxPickerDragDropHelperDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end