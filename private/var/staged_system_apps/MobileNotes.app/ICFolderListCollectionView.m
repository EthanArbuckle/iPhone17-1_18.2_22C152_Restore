@interface ICFolderListCollectionView
- (BOOL)hasGroupInset;
- (BOOL)hasSwipeActions;
- (BOOL)shouldShowAllowNotificationsView;
- (BOOL)shouldShowMoveHeader;
- (ICFolderListCollectionView)initWithPresentingViewController:(id)a3 legacyManagedObjectContext:(id)a4 modernManagedObjectContext:(id)a5 viewControllerManager:(id)a6;
- (ICTagContainerCell)tagContainerCell;
- (id)createLayout;
- (void)deselectAllTagsAnimated:(BOOL)a3;
- (void)selectTagsWithTagSelection:(id)a3 animated:(BOOL)a4;
- (void)setHasGroupInset:(BOOL)a3;
- (void)setHasSwipeActions:(BOOL)a3;
- (void)setShouldShowAllowNotificationsView:(BOOL)a3;
- (void)setShouldShowMoveHeader:(BOOL)a3;
@end

@implementation ICFolderListCollectionView

- (id)createLayout
{
  objc_initWeak(&location, self);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1000F491C;
  v13[3] = &unk_100629C70;
  objc_copyWeak(&v14, &location);
  v13[4] = self;
  v3 = objc_retainBlock(v13);
  v4 = +[NSMutableArray array];
  if ([(ICFolderListCollectionView *)self shouldShowMoveHeader])
  {
    v5 = +[NSCollectionLayoutDimension fractionalWidthDimension:1.0];
    +[ICMoveHeaderView absoluteHeight];
    v6 = +[NSCollectionLayoutDimension absoluteDimension:](NSCollectionLayoutDimension, "absoluteDimension:");
    v7 = +[NSCollectionLayoutSize sizeWithWidthDimension:v5 heightDimension:v6];
    v8 = +[NSCollectionLayoutBoundarySupplementaryItem boundarySupplementaryItemWithLayoutSize:v7 elementKind:UICollectionElementKindSectionHeader alignment:1];
    [v4 addObject:v8];
  }
  else
  {
    if (![(ICFolderListCollectionView *)self shouldShowAllowNotificationsView]) {
      goto LABEL_6;
    }
    v5 = +[NSCollectionLayoutDimension fractionalWidthDimension:1.0];
    v6 = +[NSCollectionLayoutDimension estimatedDimension:128.0];
    v7 = +[NSCollectionLayoutSize sizeWithWidthDimension:v5 heightDimension:v6];
    v8 = +[NSCollectionLayoutBoundarySupplementaryItem boundarySupplementaryItemWithLayoutSize:v7 elementKind:UICollectionElementKindSectionHeader alignment:1];
    [v4 addObject:v8];
  }

LABEL_6:
  id v9 = objc_alloc_init((Class)UICollectionViewCompositionalLayoutConfiguration);
  id v10 = [v4 copy];
  [v9 setBoundarySupplementaryItems:v10];

  id v11 = [objc_alloc((Class)UICollectionViewCompositionalLayout) initWithSectionProvider:v3 configuration:v9];
  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);

  return v11;
}

- (BOOL)shouldShowMoveHeader
{
  return self->_shouldShowMoveHeader;
}

- (BOOL)shouldShowAllowNotificationsView
{
  return self->_shouldShowAllowNotificationsView;
}

- (void)setHasGroupInset:(BOOL)a3
{
  self->_hasGroupInset = a3;
}

- (ICFolderListCollectionView)initWithPresentingViewController:(id)a3 legacyManagedObjectContext:(id)a4 modernManagedObjectContext:(id)a5 viewControllerManager:(id)a6
{
  v9.receiver = self;
  v9.super_class = (Class)ICFolderListCollectionView;
  v6 = [(ICCollectionView *)&v9 initWithPresentingViewController:a3 legacyManagedObjectContext:a4 modernManagedObjectContext:a5 viewControllerManager:a6];
  v7 = v6;
  if (v6)
  {
    v6->_hasSwipeActions = 1;
    [(ICFolderListCollectionView *)v6 setDragInteractionEnabled:1];
    [(ICFolderListCollectionView *)v7 setSpringLoaded:1];
  }
  return v7;
}

- (void)setShouldShowMoveHeader:(BOOL)a3
{
  if (self->_shouldShowMoveHeader != a3)
  {
    self->_shouldShowMoveHeader = a3;
    id v4 = [(ICFolderListCollectionView *)self createLayout];
    [(ICFolderListCollectionView *)self setCollectionViewLayout:v4];
  }
}

- (void)setShouldShowAllowNotificationsView:(BOOL)a3
{
  if (self->_shouldShowAllowNotificationsView != a3)
  {
    self->_shouldShowAllowNotificationsView = a3;
    id v4 = [(ICFolderListCollectionView *)self createLayout];
    [(ICFolderListCollectionView *)self setCollectionViewLayout:v4];
  }
}

- (void)deselectAllTagsAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(ICFolderListCollectionView *)self tagContainerCell];
  [v4 deselectAllItemsAnimated:v3];
}

- (void)selectTagsWithTagSelection:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = [(ICFolderListCollectionView *)self tagContainerCell];
  [v7 selectTagsWithTagSelection:v6 animated:v4];
}

- (ICTagContainerCell)tagContainerCell
{
  BOOL v3 = [(ICCollectionView *)self diffableDataSource];
  BOOL v4 = +[ICTagContainerItemIdentifier sharedItemIdentifier];
  v5 = [v3 indexPathForItemIdentifier:v4];

  if (v5)
  {
    objc_opt_class();
    id v6 = [(ICFolderListCollectionView *)self cellForItemAtIndexPath:v5];
    id v7 = ICDynamicCast();
  }
  else
  {
    id v7 = 0;
  }

  return (ICTagContainerCell *)v7;
}

- (BOOL)hasGroupInset
{
  return self->_hasGroupInset;
}

- (BOOL)hasSwipeActions
{
  return self->_hasSwipeActions;
}

- (void)setHasSwipeActions:(BOOL)a3
{
  self->_hasSwipeActions = a3;
}

@end