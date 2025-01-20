@interface BKLibraryBookshelfDragDelegate
+ (void)initialize;
- (BKLibraryBookshelfBooksDataSource)bookDataSource;
- (BKLibraryBookshelfDragDelegate)initWithBookDataSource:(id)a3;
- (BOOL)collectionView:(id)a3 dragSessionAllowsMoveOperation:(id)a4;
- (BOOL)collectionView:(id)a3 dragSessionIsRestrictedToDraggingApplication:(id)a4;
- (BOOL)collectionViewIsReorderable:(id)a3;
- (id)collectionView:(id)a3 dragPreviewParametersForItemAtIndexPath:(id)a4;
- (id)collectionView:(id)a3 itemsForAddingToDragSession:(id)a4 atIndexPath:(id)a5 point:(CGPoint)a6;
- (id)collectionView:(id)a3 itemsForBeginningDragSession:(id)a4 atIndexPath:(id)a5;
- (id)collectionViewCollectionID:(id)a3;
- (id)dragItemAtIndexPath:(id)a3;
- (void)collectionView:(id)a3 dragSessionDidEnd:(id)a4;
- (void)collectionView:(id)a3 dragSessionWillBegin:(id)a4;
- (void)setBookDataSource:(id)a3;
@end

@implementation BKLibraryBookshelfDragDelegate

+ (void)initialize
{
  if ((id)objc_opt_class() == a1 && qword_100B4A5E0 != -1)
  {
    dispatch_once(&qword_100B4A5E0, &stru_100A4A6A8);
  }
}

- (BKLibraryBookshelfDragDelegate)initWithBookDataSource:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)BKLibraryBookshelfDragDelegate;
  v6 = [(BKLibraryBookshelfDragDelegate *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_bookDataSource, a3);
  }

  return v7;
}

- (id)collectionViewCollectionID:(id)a3
{
  v3 = [a3 dataSource];
  v4 = BUProtocolCast();

  id v5 = [v4 dataSourceID];

  return v5;
}

- (BOOL)collectionViewIsReorderable:(id)a3
{
  id v3 = a3;
  v4 = [v3 dataSource];
  id v5 = +[NSIndexPath indexPathForItem:0 inSection:0];
  unsigned __int8 v6 = [v4 collectionView:v3 canMoveItemAtIndexPath:v5];

  return v6;
}

- (id)dragItemAtIndexPath:(id)a3
{
  id v4 = a3;
  id v5 = [(BKLibraryBookshelfDragDelegate *)self bookDataSource];
  unsigned __int8 v6 = [v5 representedObjectForIndexPath:v4];

  id v7 = objc_alloc_init((Class)NSItemProvider);
  v8 = +[BKLibraryManager defaultManager];
  objc_super v9 = [v8 dragInfoFromLibraryAsset:v6];

  if ([v6 isOwned]) {
    uint64_t v10 = [v6 isPreorderBook] ^ 1;
  }
  else {
    uint64_t v10 = 0;
  }
  +[BCDragRepresentationFactory registerRepresentationsFromAssetDragInfo:v9 withProvider:v7 canDragToNewCanvas:v10];
  id v11 = [objc_alloc((Class)UIDragItem) initWithItemProvider:v7];
  [v11 setLocalObject:v6];

  return v11;
}

- (id)collectionView:(id)a3 itemsForBeginningDragSession:(id)a4 atIndexPath:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  if (([v7 hasActiveDrop] & 1) != 0
    || ([v7 hasActiveDrag] & 1) != 0
    || (byte_100B4A5D0 = 1,
        [(BKLibraryBookshelfDragDelegate *)self dragItemAtIndexPath:v8],
        (uint64_t v9 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    id v11 = 0;
  }
  else
  {
    uint64_t v10 = (void *)v9;
    uint64_t v13 = v9;
    id v11 = +[NSArray arrayWithObjects:&v13 count:1];
  }

  return v11;
}

- (id)collectionView:(id)a3 itemsForAddingToDragSession:(id)a4 atIndexPath:(id)a5 point:(CGPoint)a6
{
  id v9 = a4;
  id v10 = a5;
  if ([a3 isEditing])
  {
    id v11 = 0;
  }
  else
  {
    id v27 = v10;
    v12 = [(BKLibraryBookshelfDragDelegate *)self dragItemAtIndexPath:v10];
    objc_opt_class();
    v29 = v12;
    uint64_t v13 = [v12 localObject];
    v14 = BUDynamicCast();

    long long v32 = 0u;
    long long v33 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    id v28 = v9;
    v15 = [v9 items];
    id v16 = [v15 countByEnumeratingWithState:&v30 objects:v35 count:16];
    if (v16)
    {
      id v17 = v16;
      uint64_t v18 = *(void *)v31;
      while (2)
      {
        for (i = 0; i != v17; i = (char *)i + 1)
        {
          if (*(void *)v31 != v18) {
            objc_enumerationMutation(v15);
          }
          v20 = *(void **)(*((void *)&v30 + 1) + 8 * i);
          objc_opt_class();
          v21 = [v20 localObject];
          v22 = BUDynamicCast();

          v23 = [v22 assetID];
          v24 = [v14 assetID];
          unsigned int v25 = [v23 isEqualToString:v24];

          if (v25)
          {

            id v11 = 0;
            goto LABEL_14;
          }
        }
        id v17 = [v15 countByEnumeratingWithState:&v30 objects:v35 count:16];
        if (v17) {
          continue;
        }
        break;
      }
    }

    v14 = v29;
    if (v29)
    {
      v34 = v29;
      id v11 = +[NSArray arrayWithObjects:&v34 count:1];
LABEL_14:
      id v10 = v27;
      id v9 = v28;
    }
    else
    {
      id v11 = 0;
      id v10 = v27;
      id v9 = v28;
    }
  }

  return v11;
}

- (id)collectionView:(id)a3 dragPreviewParametersForItemAtIndexPath:(id)a4
{
  id v4 = [a3 cellForItemAtIndexPath:a4];
  id v5 = BUProtocolCast();

  [v5 prepareForDragPreview];
  unsigned __int8 v6 = [v5 dragPreviewParametersForDrop:0];

  return v6;
}

- (void)collectionView:(id)a3 dragSessionWillBegin:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [v7 delegate];
  BUProtocolCast();
  id v10 = (id)objc_claimAutoreleasedReturnValue();

  [v10 dragAndDropSessionDidStart];
  id v9 = [(BKLibraryBookshelfDragDelegate *)self collectionViewCollectionID:v7];

  [v6 setLocalContext:v9];
}

- (void)collectionView:(id)a3 dragSessionDidEnd:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = +[BKDragAndDropMonitor sharedInstance];
  [v7 processWithDragSession:v5];

  id v8 = [v6 delegate];

  BUProtocolCast();
  id v9 = (id)objc_claimAutoreleasedReturnValue();

  [v9 dragAndDropSessionDidEnd];
}

- (BOOL)collectionView:(id)a3 dragSessionAllowsMoveOperation:(id)a4
{
  return 1;
}

- (BOOL)collectionView:(id)a3 dragSessionIsRestrictedToDraggingApplication:(id)a4
{
  return 0;
}

- (BKLibraryBookshelfBooksDataSource)bookDataSource
{
  return (BKLibraryBookshelfBooksDataSource *)objc_getProperty(self, a2, 8, 1);
}

- (void)setBookDataSource:(id)a3
{
}

- (void).cxx_destruct
{
}

@end