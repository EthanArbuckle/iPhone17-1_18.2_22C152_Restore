@interface ICBrowseAttachmentsDragAndDropDelegate
+ (id)sharedInstance;
- (id)collectionView:(id)a3 dragPreviewParametersForItemAtIndexPath:(id)a4;
- (id)collectionView:(id)a3 itemsForAddingToDragSession:(id)a4 atIndexPath:(id)a5 point:(CGPoint)a6;
- (id)collectionView:(id)a3 itemsForBeginningDragSession:(id)a4 atIndexPath:(id)a5;
- (id)dragItemsForItemAtIndexPath:(id)a3 collectionView:(id)a4;
- (int64_t)_collectionView:(id)a3 dataOwnerForDragSession:(id)a4 atIndexPath:(id)a5;
- (void)collectionView:(id)a3 dragSessionWillBegin:(id)a4;
@end

@implementation ICBrowseAttachmentsDragAndDropDelegate

+ (id)sharedInstance
{
  if (qword_1006AA1C0 != -1) {
    dispatch_once(&qword_1006AA1C0, &stru_100628468);
  }
  v2 = (void *)qword_1006AA1B8;

  return v2;
}

- (id)dragItemsForItemAtIndexPath:(id)a3 collectionView:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  objc_opt_class();
  v7 = [v5 cellForItemAtIndexPath:v6];

  v8 = ICDynamicCast();

  uint64_t v9 = [v8 dragItemForAttachment];
  v10 = (void *)v9;
  if (v9)
  {
    uint64_t v13 = v9;
    v11 = +[NSArray arrayWithObjects:&v13 count:1];
  }
  else
  {
    v11 = &__NSArray0__struct;
  }

  return v11;
}

- (id)collectionView:(id)a3 itemsForBeginningDragSession:(id)a4 atIndexPath:(id)a5
{
  return [(ICBrowseAttachmentsDragAndDropDelegate *)self dragItemsForItemAtIndexPath:a5 collectionView:a3];
}

- (id)collectionView:(id)a3 itemsForAddingToDragSession:(id)a4 atIndexPath:(id)a5 point:(CGPoint)a6
{
  id v9 = a3;
  id v10 = a5;
  v11 = [a4 localContext];

  if (v11 == self)
  {
    v12 = [(ICBrowseAttachmentsDragAndDropDelegate *)self dragItemsForItemAtIndexPath:v10 collectionView:v9];
  }
  else
  {
    v12 = &__NSArray0__struct;
  }

  return v12;
}

- (void)collectionView:(id)a3 dragSessionWillBegin:(id)a4
{
}

- (int64_t)_collectionView:(id)a3 dataOwnerForDragSession:(id)a4 atIndexPath:(id)a5
{
  return 1;
}

- (id)collectionView:(id)a3 dragPreviewParametersForItemAtIndexPath:(id)a4
{
  v4 = [a3 cellForItemAtIndexPath:a4];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_opt_class();
    id v5 = ICDynamicCast();
    id v6 = objc_alloc_init((Class)UIDragPreviewParameters);
    v7 = [v5 attachmentBrickView];
    [v7 frame];
    double v9 = v8;
    double v11 = v10;
    double v13 = v12;
    double v15 = v14;
    v16 = [v7 layer];
    [v16 cornerRadius];
    v18 = +[UIBezierPath bezierPathWithRoundedRect:cornerRadius:](UIBezierPath, "bezierPathWithRoundedRect:cornerRadius:", v9, v11, v13, v15, v17);

    [v6 setVisiblePath:v18];
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

@end