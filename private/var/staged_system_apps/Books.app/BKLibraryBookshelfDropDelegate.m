@interface BKLibraryBookshelfDropDelegate
- (BOOL)collectionView:(id)a3 canHandleDropSession:(id)a4;
- (BOOL)collectionViewIsEditable:(id)a3;
- (BOOL)collectionViewIsReorderable:(id)a3;
- (BOOL)inDropSession;
- (BOOL)shouldRestoreSelectionForSingleItemReordering;
- (id)collectionView:(id)a3 dropPreviewParametersForItemAtIndexPath:(id)a4;
- (id)collectionView:(id)a3 dropSessionDidUpdate:(id)a4 withDestinationIndexPath:(id)a5;
- (id)collectionViewCollectionID:(id)a3;
- (void)collectionView:(id)a3 dropSessionDidEnd:(id)a4;
- (void)collectionView:(id)a3 dropSessionDidEnter:(id)a4;
- (void)collectionView:(id)a3 performDropWithCoordinator:(id)a4;
- (void)setInDropSession:(BOOL)a3;
- (void)setShouldRestoreSelectionForSingleItemReordering:(BOOL)a3;
@end

@implementation BKLibraryBookshelfDropDelegate

- (id)collectionViewCollectionID:(id)a3
{
  v3 = [a3 dataSource];
  v4 = BUProtocolCast();

  v5 = [v4 dataSourceID];

  return v5;
}

- (BOOL)collectionViewIsEditable:(id)a3
{
  v3 = [a3 dataSource];
  v4 = BUProtocolCast();

  LOBYTE(v3) = [v4 isEditable];
  return (char)v3;
}

- (BOOL)collectionViewIsReorderable:(id)a3
{
  id v3 = a3;
  v4 = [v3 dataSource];
  v5 = +[NSIndexPath indexPathForItem:0 inSection:0];
  unsigned __int8 v6 = [v4 collectionView:v3 canMoveItemAtIndexPath:v5];

  return v6;
}

- (void)collectionView:(id)a3 performDropWithCoordinator:(id)a4
{
  id v56 = a3;
  uint64_t v66 = 0;
  v67 = &v66;
  uint64_t v68 = 0x3032000000;
  v69 = sub_1000070A0;
  v70 = sub_10000722C;
  id v54 = a4;
  id v71 = [v54 destinationIndexPath];
  if (!v67[5])
  {
    uint64_t v6 = +[NSIndexPath indexPathForItem:0 inSection:0];
    v7 = (void *)v67[5];
    v67[5] = v6;
  }
  v8 = [v54 proposal];
  BOOL v9 = [v8 operation] == (id)3;

  if (v9)
  {
    v62[0] = _NSConcreteStackBlock;
    v62[1] = 3221225472;
    v62[2] = sub_1001880C8;
    v62[3] = &unk_100A440F8;
    id v63 = v56;
    id v10 = v54;
    id v64 = v10;
    v65 = &v66;
    [v63 performBatchUpdates:v62 completion:&stru_100A49070];
    v11 = [v10 items];
    v12 = [v11 firstObject];

    v13 = [v12 dragItem];
    id v14 = [v10 dropItem:v13 toItemAtIndexPath:v67[5]];

    id v15 = v63;
LABEL_27:

    goto LABEL_28;
  }
  v16 = [v54 proposal];
  BOOL v17 = [v16 operation] == (id)2;

  if (v17)
  {
    v18 = [v54 session];
    v19 = [v18 localDragSession];

    if (v19)
    {
      v20 = [v56 dataSource];
      v55 = BUProtocolCast();

      v21 = +[NSMutableArray array];
      long long v60 = 0u;
      long long v61 = 0u;
      long long v58 = 0u;
      long long v59 = 0u;
      v22 = [v54 items];
      id obj = [v22 reverseObjectEnumerator];

      id v23 = [obj countByEnumeratingWithState:&v58 objects:v72 count:16];
      if (v23)
      {
        uint64_t v24 = *(void *)v59;
        do
        {
          v25 = 0;
          do
          {
            if (*(void *)v59 != v24) {
              objc_enumerationMutation(obj);
            }
            v26 = *(void **)(*((void *)&v58 + 1) + 8 * (void)v25);
            objc_opt_class();
            v27 = [v26 dragItem];
            v28 = [v27 localObject];
            v29 = BUDynamicCast();

            objc_opt_class();
            v30 = [v26 dragItem];
            v31 = [v30 localObject];
            v32 = BUDynamicCast();

            objc_opt_class();
            v33 = [v26 dragItem];
            v34 = [v33 localObject];
            v35 = BUDynamicCast();

            v36 = [v35 assetID];
            id v37 = [v36 length];

            if (v37)
            {
              v38 = +[BKLibraryManager defaultManager];
              v39 = [v35 assetID];
              uint64_t v40 = [v38 libraryAssetOnMainQueueWithAssetID:v39];

              v29 = (void *)v40;
            }
            if (v29)
            {
              [v21 addObject:v29];
            }
            else if (v32)
            {
              v41 = [v32 storeID];
              [v55 collectionView:v56 addBookStoreItem:v41];
            }
            v25 = (char *)v25 + 1;
          }
          while (v23 != v25);
          id v23 = [obj countByEnumeratingWithState:&v58 objects:v72 count:16];
        }
        while (v23);
      }

      [v55 collectionView:v56 addAssets:v21];
      id v15 = v55;
      goto LABEL_27;
    }
    v42 = [v54 session];
    v43 = sub_100152BC0();
    if (sub_100153F70(v42, v43))
    {

LABEL_24:
      id v15 = [v56 window];
      v46 = +[BKAppDelegate sceneManager];
      v47 = [v46 sceneControllerForWindow:v15];

      id v48 = [v47 newShowURLTransaction];
      v49 = [v54 session];
      v50 = [(BKLibraryBookshelfDropDelegate *)self collectionViewCollectionID:v56];
      sub_100152F68(v49, v50, v48);

      v51 = [v54 session];
      int v52 = sub_100153DC0(v51);

      if (v52)
      {
        v53 = [v54 session];
        sub_100152E44(v53);
      }
      goto LABEL_27;
    }
    v44 = [v54 session];
    unsigned int v45 = sub_100154004(v44);

    if (v45) {
      goto LABEL_24;
    }
  }
LABEL_28:
  _Block_object_dispose(&v66, 8);
}

- (BOOL)collectionView:(id)a3 canHandleDropSession:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [v7 localDragSession];

  if (v8)
  {
    objc_opt_class();
    [v7 localDragSession];
    BOOL v9 = v44 = v6;
    id v10 = [v9 localContext];
    uint64_t v11 = BUDynamicCast();

    id v6 = v44;
    unsigned int v45 = [(BKLibraryBookshelfDropDelegate *)self collectionViewCollectionID:v44];
    if (!objc_msgSend((id)v11, "isEqualToString:")
      || ([v45 isEqualToString:kBKCollectionDefaultIDFinished] & 1) == 0)
    {
      if ([(BKLibraryBookshelfDropDelegate *)self collectionViewIsEditable:v44])
      {
        long long v52 = 0u;
        long long v53 = 0u;
        long long v50 = 0u;
        long long v51 = 0u;
        v12 = [v7 items];
        id v13 = [v12 countByEnumeratingWithState:&v50 objects:v55 count:16];
        if (v13)
        {
          id v14 = v13;
          uint64_t v42 = v11;
          id v43 = v7;
          uint64_t v15 = *(void *)v51;
          while (2)
          {
            for (i = 0; i != v14; i = (char *)i + 1)
            {
              if (*(void *)v51 != v15) {
                objc_enumerationMutation(v12);
              }
              BOOL v17 = *(void **)(*((void *)&v50 + 1) + 8 * i);
              objc_opt_class();
              v18 = [v17 localObject];
              uint64_t v19 = BUDynamicCast();

              objc_opt_class();
              v20 = [v17 localObject];
              uint64_t v21 = BUDynamicCast();

              objc_opt_class();
              v22 = [v17 localObject];
              id v23 = BUDynamicCast();

              uint64_t v24 = [v23 assetID];
              id v25 = [v24 length];

              if (v25)
              {
                v26 = +[BKLibraryManager defaultManager];
                v27 = [v23 assetID];
                uint64_t v28 = [v26 libraryAssetOnMainQueueWithAssetID:v27];

                uint64_t v19 = v28;
              }

              if (v19 | v21)
              {
                int v29 = 1;
                goto LABEL_29;
              }
            }
            id v14 = [v12 countByEnumeratingWithState:&v50 objects:v55 count:16];
            if (v14) {
              continue;
            }
            break;
          }
LABEL_15:
          int v29 = 0;
LABEL_29:
          id v7 = v43;
          id v6 = v44;
          uint64_t v11 = v42;
          goto LABEL_32;
        }
        int v29 = 0;
        goto LABEL_32;
      }
      if ([(BKLibraryBookshelfDropDelegate *)self collectionViewIsReorderable:v44])
      {
        long long v48 = 0u;
        long long v49 = 0u;
        long long v46 = 0u;
        long long v47 = 0u;
        v12 = [v7 items];
        id v31 = [v12 countByEnumeratingWithState:&v46 objects:v54 count:16];
        if (v31)
        {
          id v32 = v31;
          uint64_t v42 = v11;
          id v43 = v7;
          uint64_t v33 = *(void *)v47;
LABEL_20:
          uint64_t v34 = 0;
          while (1)
          {
            if (*(void *)v47 != v33) {
              objc_enumerationMutation(v12);
            }
            v35 = *(void **)(*((void *)&v46 + 1) + 8 * v34);
            objc_opt_class();
            v36 = [v35 localObject];
            id v37 = BUDynamicCast();

            v38 = [v37 collectionMembers];
            v39 = [v38 valueForKey:@"collectionID"];
            unsigned int v40 = [v39 containsObject:v45];

            if (!v40) {
              goto LABEL_15;
            }
            if (v32 == (id)++v34)
            {
              id v32 = [v12 countByEnumeratingWithState:&v46 objects:v54 count:16];
              int v29 = 1;
              if (v32) {
                goto LABEL_20;
              }
              goto LABEL_29;
            }
          }
        }
        int v29 = 1;
LABEL_32:

        goto LABEL_33;
      }
    }
    int v29 = 0;
LABEL_33:

    LOBYTE(v11) = v29 != 0;
    goto LABEL_34;
  }
  v30 = sub_100152A40();
  uint64_t v11 = [v7 hasItemsConformingToTypeIdentifiers:v30];

LABEL_34:
  return v11;
}

- (id)collectionView:(id)a3 dropSessionDidUpdate:(id)a4 withDestinationIndexPath:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  BOOL v9 = [v8 localDragSession];

  if (!v9)
  {
    uint64_t v33 = sub_100152BC0();
    if (sub_100153F70(v8, v33))
    {
    }
    else
    {
      unsigned __int8 v34 = sub_100154004(v8);

      if ((v34 & 1) == 0) {
        goto LABEL_41;
      }
    }
    uint64_t v32 = 0;
    uint64_t v31 = 0;
    uint64_t v14 = 2;
    goto LABEL_52;
  }
  long long v60 = self;
  long long v71 = 0u;
  long long v72 = 0u;
  long long v69 = 0u;
  long long v70 = 0u;
  id v10 = [v8 items];
  id v11 = [v10 countByEnumeratingWithState:&v69 objects:v75 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v70;
    uint64_t v14 = 2;
    do
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(void *)v70 != v13) {
          objc_enumerationMutation(v10);
        }
        v16 = *(void **)(*((void *)&v69 + 1) + 8 * i);
        objc_opt_class();
        BOOL v17 = [v16 localObject];
        v18 = BUDynamicCast();

        if (v18)
        {
          uint64_t v32 = 0;
          uint64_t v31 = 0;
          goto LABEL_51;
        }
      }
      id v12 = [v10 countByEnumeratingWithState:&v69 objects:v75 count:16];
    }
    while (v12);
  }

  uint64_t v19 = v60;
  if ([(BKLibraryBookshelfDropDelegate *)v60 collectionViewIsReorderable:v7])
  {
    id v10 = [(BKLibraryBookshelfDropDelegate *)v60 collectionViewCollectionID:v7];
    long long v65 = 0u;
    long long v66 = 0u;
    long long v67 = 0u;
    long long v68 = 0u;
    v20 = [v8 items];
    id v21 = [v20 countByEnumeratingWithState:&v65 objects:v74 count:16];
    if (!v21)
    {
      uint64_t v32 = 1;
      uint64_t v14 = 3;
      uint64_t v31 = 1;
      goto LABEL_50;
    }
    id v22 = v21;
    id v55 = v8;
    id v58 = v7;
    uint64_t v23 = *(void *)v66;
LABEL_13:
    uint64_t v24 = 0;
    while (1)
    {
      if (*(void *)v66 != v23) {
        objc_enumerationMutation(v20);
      }
      id v25 = *(void **)(*((void *)&v65 + 1) + 8 * v24);
      objc_opt_class();
      v26 = [v25 localObject];
      v27 = BUDynamicCast();

      uint64_t v28 = [v27 collectionMembers];
      int v29 = [v28 valueForKey:@"collectionID"];
      unsigned int v30 = [v29 containsObject:v10];

      if (!v30) {
        break;
      }
      if (v22 == (id)++v24)
      {
        id v22 = [v20 countByEnumeratingWithState:&v65 objects:v74 count:16];
        if (!v22)
        {
          uint64_t v31 = 1;
          uint64_t v32 = 1;
          id v7 = v58;
          id v8 = v55;
          uint64_t v14 = 3;
LABEL_50:

          goto LABEL_51;
        }
        goto LABEL_13;
      }
    }

    id v7 = v58;
    uint64_t v19 = v60;
    id v8 = v55;
  }
  if (!-[BKLibraryBookshelfDropDelegate collectionViewIsEditable:](v19, "collectionViewIsEditable:", v7, v55))
  {
LABEL_41:
    uint64_t v32 = 0;
    uint64_t v31 = 0;
    uint64_t v14 = 1;
    goto LABEL_52;
  }
  long long v63 = 0u;
  long long v64 = 0u;
  long long v61 = 0u;
  long long v62 = 0u;
  id v10 = [v8 items];
  id v35 = [v10 countByEnumeratingWithState:&v61 objects:v73 count:16];
  if (!v35)
  {
    uint64_t v32 = 0;
    uint64_t v31 = 0;
    goto LABEL_44;
  }
  id v36 = v35;
  id v56 = v8;
  id v59 = v7;
  uint64_t v37 = *(void *)v62;
  uint64_t v57 = kBKCollectionDefaultIDFinished;
  while (2)
  {
    for (j = 0; j != v36; j = (char *)j + 1)
    {
      if (*(void *)v62 != v37) {
        objc_enumerationMutation(v10);
      }
      v39 = *(void **)(*((void *)&v61 + 1) + 8 * (void)j);
      objc_opt_class();
      unsigned int v40 = [v39 localObject];
      v20 = BUDynamicCast();

      objc_opt_class();
      v41 = [v39 localObject];
      uint64_t v42 = BUDynamicCast();

      id v43 = [v42 assetID];
      id v44 = [v43 length];

      if (v44)
      {
        unsigned int v45 = +[BKLibraryManager defaultManager];
        long long v46 = [v42 assetID];
        uint64_t v47 = [v45 libraryAssetOnMainQueueWithAssetID:v46];

        v20 = (void *)v47;
      }
      if (v20)
      {
        long long v48 = [(BKLibraryBookshelfDropDelegate *)v19 collectionViewCollectionID:v59];
        if ([v48 isEqualToString:v57])
        {
          if ([v20 isFinished]) {
            uint64_t v52 = 1;
          }
          else {
            uint64_t v52 = 2;
          }
        }
        else
        {
          long long v49 = [v20 collectionMembers];
          long long v50 = [v49 valueForKey:@"collectionID"];
          unsigned int v51 = [v50 containsObject:v48];

          if (v51)
          {

            uint64_t v19 = v60;
            goto LABEL_38;
          }
          uint64_t v52 = 2;
        }

        uint64_t v32 = 0;
        uint64_t v31 = 0;
        id v7 = v59;
        id v8 = v56;
        uint64_t v14 = v52;
        goto LABEL_50;
      }
LABEL_38:
    }
    id v36 = [v10 countByEnumeratingWithState:&v61 objects:v73 count:16];
    if (v36) {
      continue;
    }
    break;
  }
  uint64_t v32 = 0;
  uint64_t v31 = 0;
  id v7 = v59;
  id v8 = v56;
LABEL_44:
  uint64_t v14 = 1;
LABEL_51:

LABEL_52:
  id v53 = [objc_alloc((Class)UICollectionViewDropProposal) initWithDropOperation:v14 intent:v31];
  [v53 setPrefersFullSizePreview:v32];

  return v53;
}

- (void)collectionView:(id)a3 dropSessionDidEnter:(id)a4
{
  id v18 = a3;
  id v6 = a4;
  if (![(BKLibraryBookshelfDropDelegate *)self inDropSession])
  {
    [(BKLibraryBookshelfDropDelegate *)self setInDropSession:1];
    id v7 = [v18 delegate];
    id v8 = BUProtocolCast();

    [v8 dragAndDropSessionDidStart];
  }
  BOOL v9 = [v6 items];
  if ([v9 count] == (id)1)
  {
    id v10 = [v18 dataSource];
    id v11 = BUProtocolCast();

    objc_opt_class();
    id v12 = [v9 firstObject];
    uint64_t v13 = [v12 localObject];
    uint64_t v14 = BUDynamicCast();

    uint64_t v15 = [v11 indexPathForRepresentedObject:v14];
    v16 = [v18 indexPathsForSelectedItems];
    BOOL v17 = [v16 firstObject];

    if (v15 == v17)
    {
      [v18 setAllowsSelection:0];
      [(BKLibraryBookshelfDropDelegate *)self setShouldRestoreSelectionForSingleItemReordering:1];
    }
  }
}

- (void)collectionView:(id)a3 dropSessionDidEnd:(id)a4
{
  id v16 = a3;
  id v6 = a4;
  id v7 = [v16 delegate];
  id v8 = BUProtocolCast();

  [v8 dragAndDropSessionDidEnd];
  [(BKLibraryBookshelfDropDelegate *)self setInDropSession:0];
  if ([(BKLibraryBookshelfDropDelegate *)self shouldRestoreSelectionForSingleItemReordering])
  {
    [v16 setAllowsSelection:1];
    [v16 setAllowsMultipleSelection:1];
    BOOL v9 = [v16 dataSource];
    id v10 = BUProtocolCast();

    objc_opt_class();
    id v11 = [v6 items];
    id v12 = [v11 firstObject];
    uint64_t v13 = [v12 localObject];
    uint64_t v14 = BUDynamicCast();

    uint64_t v15 = [v10 indexPathForRepresentedObject:v14];
    [v16 selectItemAtIndexPath:v15 animated:0 scrollPosition:0];
    [(BKLibraryBookshelfDropDelegate *)self setShouldRestoreSelectionForSingleItemReordering:0];
  }
}

- (id)collectionView:(id)a3 dropPreviewParametersForItemAtIndexPath:(id)a4
{
  v4 = [a3 cellForItemAtIndexPath:a4];
  v5 = BUProtocolCast();

  id v6 = [v5 dragPreviewParametersForDrop:1];

  return v6;
}

- (BOOL)inDropSession
{
  return self->_inDropSession;
}

- (void)setInDropSession:(BOOL)a3
{
  self->_inDropSession = a3;
}

- (BOOL)shouldRestoreSelectionForSingleItemReordering
{
  return self->_shouldRestoreSelectionForSingleItemReordering;
}

- (void)setShouldRestoreSelectionForSingleItemReordering:(BOOL)a3
{
  self->_shouldRestoreSelectionForSingleItemReordering = a3;
}

@end