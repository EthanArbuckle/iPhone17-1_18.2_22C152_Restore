@interface FRDragController
- (BOOL)isHeadlineDraggable:(id)a3;
- (FRDragController)initWithDataSource:(id)a3 context:(id)a4;
- (FRDragControllerDataSource)dataSource;
- (FRFeldsparContext)context;
- (id)_collectionView:(id)a3 itemsForAddingToDragSession:(id)a4 atIndexPath:(id)a5 point:(CGPoint)a6;
- (id)_collectionView:(id)a3 itemsForBeginningDragSession:(id)a4 atIndexPath:(id)a5;
- (id)_collectionView:(id)a3 liftingPreviewParametersForItemAtIndexPath:(id)a4;
- (id)_tableView:(id)a3 itemsForAddingToDragSession:(id)a4 atIndexPath:(id)a5 point:(CGPoint)a6;
- (id)_tableView:(id)a3 itemsForBeginningDragSession:(id)a4 atIndexPath:(id)a5;
- (id)dragItemsForFeed:(id)a3;
- (id)dragItemsForHeadline:(id)a3;
- (id)dragItemsForIndexPath:(id)a3;
- (id)visiblePathForIndexPath:(id)a3;
- (void)setContext:(id)a3;
- (void)setDataSource:(id)a3;
@end

@implementation FRDragController

- (FRDragController)initWithDataSource:(id)a3 context:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)FRDragController;
  v8 = [(FRDragController *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_dataSource, v6);
    objc_storeStrong((id *)&v9->_context, a4);
  }

  return v9;
}

- (id)_collectionView:(id)a3 itemsForBeginningDragSession:(id)a4 atIndexPath:(id)a5
{
  return -[FRDragController dragItemsForIndexPath:](self, "dragItemsForIndexPath:", a5, a4);
}

- (id)_collectionView:(id)a3 itemsForAddingToDragSession:(id)a4 atIndexPath:(id)a5 point:(CGPoint)a6
{
  return -[FRDragController dragItemsForIndexPath:](self, "dragItemsForIndexPath:", a5, a4, a6.x, a6.y);
}

- (id)_tableView:(id)a3 itemsForBeginningDragSession:(id)a4 atIndexPath:(id)a5
{
  return -[FRDragController dragItemsForIndexPath:](self, "dragItemsForIndexPath:", a5, a4);
}

- (id)_tableView:(id)a3 itemsForAddingToDragSession:(id)a4 atIndexPath:(id)a5 point:(CGPoint)a6
{
  return -[FRDragController dragItemsForIndexPath:](self, "dragItemsForIndexPath:", a5, a4, a6.x, a6.y);
}

- (id)_collectionView:(id)a3 liftingPreviewParametersForItemAtIndexPath:(id)a4
{
  v4 = [(FRDragController *)self visiblePathForIndexPath:a4];
  id v5 = objc_alloc_init((Class)UIDragPreviewParameters);
  [v5 setVisiblePath:v4];

  return v5;
}

- (id)dragItemsForIndexPath:(id)a3
{
  id v4 = a3;
  id v5 = [(FRDragController *)self dataSource];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = [(FRDragController *)self dataSource];
    v8 = [v7 dragController:self headlineForCellAtIndexPath:v4];
  }
  else
  {
    v8 = 0;
  }
  v9 = [(FRDragController *)self dataSource];
  char v10 = objc_opt_respondsToSelector();

  if (v10)
  {
    objc_super v11 = [(FRDragController *)self dataSource];
    v12 = [v11 dragController:self feedForCellAtIndexPath:v4];
  }
  else
  {
    v12 = 0;
  }
  v13 = [(FRDragController *)self dragItemsForHeadline:v8];
  v14 = [(FRDragController *)self dragItemsForFeed:v12];
  v15 = objc_opt_new();
  [v15 addObjectsFromArray:v13];
  [v15 addObjectsFromArray:v14];
  if ([v15 count])
  {
    v16 = +[NSArray arrayWithArray:v15];
  }
  else
  {
    v16 = 0;
  }

  return v16;
}

- (id)dragItemsForHeadline:(id)a3
{
  id v4 = a3;
  id v5 = [v4 articleID];
  if (v5)
  {
    unsigned int v6 = [(FRDragController *)self isHeadlineDraggable:v4];

    if (v6)
    {
      id v7 = [v4 articleID];
      v8 = [v4 title];
      v9 = [v4 sourceName];
      char v10 = +[NSString stringWithFormat:@"%@ (%@)", v8, v9];
      objc_super v11 = +[NSURL nss_NewsURLForArticleID:v7 title:v10];

      id v12 = [objc_alloc((Class)NSItemProvider) initWithObject:v11];
      v13 = [v4 title];
      [v12 setSuggestedName:v13];

      id v14 = [objc_alloc((Class)UIDragItem) initWithItemProvider:v12];
      id v5 = +[NSArray arrayWithObject:v14];
    }
    else
    {
      id v5 = 0;
    }
  }

  return v5;
}

- (id)dragItemsForFeed:(id)a3
{
  id v3 = a3;
  id v4 = [v3 identifier];

  if (v4)
  {
    id v5 = [v3 identifier];
    unsigned int v6 = [v3 name];
    id v7 = +[NSURL fr_NewsURLForTagID:v5 title:v6];

    id v8 = [objc_alloc((Class)NSItemProvider) initWithObject:v7];
    id v9 = [objc_alloc((Class)UIDragItem) initWithItemProvider:v8];
    char v10 = +[NSArray arrayWithObject:v9];
  }
  else
  {
    char v10 = 0;
  }

  return v10;
}

- (BOOL)isHeadlineDraggable:(id)a3
{
  id v4 = a3;
  if ([v4 isPaid]
    && ([(FRDragController *)self context],
        id v5 = objc_claimAutoreleasedReturnValue(),
        v5,
        v5))
  {
    unsigned int v6 = [(FRDragController *)self context];
    id v7 = [v6 cloudContext];
    id v8 = [v7 purchaseController];
    id v9 = [v4 sourceChannelID];
    char v10 = [v8 purchasedTagIDs];
    unsigned __int8 v11 = [v10 containsObject:v9];
  }
  else
  {
    unsigned __int8 v11 = 1;
  }

  return v11;
}

- (id)visiblePathForIndexPath:(id)a3
{
  id v4 = a3;
  id v5 = [(FRDragController *)self dataSource];
  char v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) == 0) {
    goto LABEL_3;
  }
  id v7 = [(FRDragController *)self dataSource];
  [v7 dragController:self contentRectOfCellAtIndexPath:v4];
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;

  v19.origin.x = v9;
  v19.origin.y = v11;
  v19.size.width = v13;
  v19.size.height = v15;
  if (!CGRectIsEmpty(v19))
  {
    v16 = +[UIBezierPath bezierPathWithRect:](UIBezierPath, "bezierPathWithRect:", v9, v11, v13, v15);
  }
  else
  {
LABEL_3:
    v16 = 0;
  }

  return v16;
}

- (FRDragControllerDataSource)dataSource
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);

  return (FRDragControllerDataSource *)WeakRetained;
}

- (void)setDataSource:(id)a3
{
}

- (FRFeldsparContext)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_context, 0);

  objc_destroyWeak((id *)&self->_dataSource);
}

@end