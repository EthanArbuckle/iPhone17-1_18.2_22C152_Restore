@interface ICImagesAndMoviesScrollView
- (BOOL)browseAttachmentsCell:(id)a3 didSelectAttachment:(id)a4;
- (BOOL)collectionView:(id)a3 canPerformAction:(SEL)a4 forItemAtIndexPath:(id)a5 withSender:(id)a6;
- (BOOL)performingBatchUpdatesFromFetchedResultsController;
- (BOOL)reloadDataAfterBatchUpdates;
- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5;
- (ICBrowseAttachmentsCollectionDelegate)delegate;
- (ICImagesAndMoviesScrollView)initWithFrame:(CGRect)a3 forAttachmentSection:(signed __int16)a4;
- (NSArray)attachments;
- (NSFetchedResultsController)fetchedResultsController;
- (NSMutableArray)changesFromFetchedResultsController;
- (UICollectionView)collectionView;
- (UICollectionViewFlowLayout)collectionViewFlowLayout;
- (UIContextMenuInteraction)contextInteraction;
- (UIViewController)viewController;
- (id)attachmentPresenter:(id)a3 transitionViewForAttachment:(id)a4;
- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4;
- (id)collectionView:(id)a3 viewForSupplementaryElementOfKind:(id)a4 atIndexPath:(id)a5;
- (id)contextMenuInteraction:(id)a3 configuration:(id)a4 highlightPreviewForItemWithIdentifier:(id)a5;
- (id)contextMenuInteraction:(id)a3 configurationForMenuAtLocation:(CGPoint)a4;
- (id)initForAttachmentSection:(signed __int16)a3;
- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4;
- (int64_t)numberOfSectionsInCollectionView:(id)a3;
- (int64_t)scrollDirection;
- (signed)attachmentSection;
- (unint64_t)thumbnailLayout;
- (void)accountsDidChange:(id)a3;
- (void)browseAttachmentsCell:(id)a3 shouldInspectAttachment:(id)a4;
- (void)browseAttachmentsCell:(id)a3 shouldShareAttachment:(id)a4;
- (void)commonInitForAttachmentSection:(signed __int16)a3;
- (void)contextMenuInteraction:(id)a3 willPerformPreviewActionForMenuWithConfiguration:(id)a4 animator:(id)a5;
- (void)controller:(id)a3 didChangeObject:(id)a4 atIndexPath:(id)a5 forChangeType:(unint64_t)a6 newIndexPath:(id)a7;
- (void)controllerDidChangeContent:(id)a3;
- (void)dealloc;
- (void)layoutSubviews;
- (void)notesContextRefreshNotification:(id)a3;
- (void)recreateFetchedResultsController;
- (void)registerForTraitChanges;
- (void)respondToTapGesture:(id)a3;
- (void)setAttachmentSection:(signed __int16)a3;
- (void)setBackground;
- (void)setChangesFromFetchedResultsController:(id)a3;
- (void)setCollectionView:(id)a3;
- (void)setContextInteraction:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setFetchedResultsController:(id)a3;
- (void)setPerformingBatchUpdatesFromFetchedResultsController:(BOOL)a3;
- (void)setReloadDataAfterBatchUpdates:(BOOL)a3;
- (void)setScrollDirection:(int64_t)a3;
- (void)setViewController:(id)a3;
- (void)updateCollectionViewItemSizeAndFrame;
@end

@implementation ICImagesAndMoviesScrollView

- (void)commonInitForAttachmentSection:(signed __int16)a3
{
  v5 = +[UIColor clearColor];
  [(ICImagesAndMoviesScrollView *)self setBackgroundColor:v5];

  id v29 = objc_alloc_init((Class)UICollectionViewFlowLayout);
  [v29 setScrollDirection:1];
  id v6 = objc_alloc((Class)UICollectionView);
  [(ICImagesAndMoviesScrollView *)self bounds];
  id v7 = [v6 initWithFrame:v29 collectionViewLayout:];
  [(ICImagesAndMoviesScrollView *)self setCollectionView:v7];

  v8 = [(ICImagesAndMoviesScrollView *)self collectionView];
  [v8 setAutoresizingMask:18];

  v9 = [(ICImagesAndMoviesScrollView *)self collectionView];
  [v9 setDataSource:self];

  v10 = [(ICImagesAndMoviesScrollView *)self collectionView];
  [v10 setDelegate:self];

  v11 = [(ICImagesAndMoviesScrollView *)self collectionView];
  [v11 setShowsHorizontalScrollIndicator:0];

  v12 = [(ICImagesAndMoviesScrollView *)self collectionView];
  [v12 setShowsVerticalScrollIndicator:0];

  v13 = +[UIColor clearColor];
  v14 = [(ICImagesAndMoviesScrollView *)self collectionView];
  [v14 setBackgroundColor:v13];

  v15 = [(ICImagesAndMoviesScrollView *)self collectionView];
  [v15 setClipsToBounds:0];

  v16 = [(ICImagesAndMoviesScrollView *)self collectionView];
  [v16 registerClass:objc_opt_class() forCellWithReuseIdentifier:@"Image"];

  v17 = [(ICImagesAndMoviesScrollView *)self collectionView];
  [v17 registerClass:objc_opt_class() forCellWithReuseIdentifier:@"Movie"];

  v18 = [(ICImagesAndMoviesScrollView *)self collectionView];
  [v18 registerClass:objc_opt_class() forCellWithReuseIdentifier:@"Drawing"];

  v19 = [(ICImagesAndMoviesScrollView *)self collectionView];
  [(ICImagesAndMoviesScrollView *)self addSubview:v19];

  v20 = +[NSMutableArray array];
  [(ICImagesAndMoviesScrollView *)self setChangesFromFetchedResultsController:v20];

  self->_attachmentSection = a3;
  [(ICImagesAndMoviesScrollView *)self recreateFetchedResultsController];
  v21 = +[NSNotificationCenter defaultCenter];
  [v21 addObserver:self selector:"notesContextRefreshNotification:" name:ICNotesContextRefreshNotification object:0];
  [v21 addObserver:self selector:"accountsDidChange:" name:ICAccountsDidChangeNotification object:0];
  id v22 = [objc_alloc((Class)UITapGestureRecognizer) initWithTarget:self action:"respondToTapGesture:"];
  v23 = [(ICImagesAndMoviesScrollView *)self collectionView];
  [v23 addGestureRecognizer:v22];

  v24 = +[ICBrowseAttachmentsDragAndDropDelegate sharedInstance];
  v25 = [(ICImagesAndMoviesScrollView *)self collectionView];
  [v25 setDragDelegate:v24];

  id v26 = [objc_alloc((Class)UIContextMenuInteraction) initWithDelegate:self];
  [(ICImagesAndMoviesScrollView *)self setContextInteraction:v26];

  v27 = [(ICImagesAndMoviesScrollView *)self collectionView];
  v28 = [(ICImagesAndMoviesScrollView *)self contextInteraction];
  [v27 addInteraction:v28];

  [(ICImagesAndMoviesScrollView *)self registerForTraitChanges];
}

- (id)initForAttachmentSection:(signed __int16)a3
{
  uint64_t v3 = a3;
  v7.receiver = self;
  v7.super_class = (Class)ICImagesAndMoviesScrollView;
  v4 = [(ICImagesAndMoviesScrollView *)&v7 init];
  v5 = v4;
  if (v4) {
    [(ICImagesAndMoviesScrollView *)v4 commonInitForAttachmentSection:v3];
  }
  return v5;
}

- (ICImagesAndMoviesScrollView)initWithFrame:(CGRect)a3 forAttachmentSection:(signed __int16)a4
{
  uint64_t v4 = a4;
  v8.receiver = self;
  v8.super_class = (Class)ICImagesAndMoviesScrollView;
  v5 = -[ICImagesAndMoviesScrollView initWithFrame:](&v8, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  id v6 = v5;
  if (v5) {
    [(ICImagesAndMoviesScrollView *)v5 commonInitForAttachmentSection:v4];
  }
  return v6;
}

- (void)dealloc
{
  uint64_t v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self name:ICNotesContextRefreshNotification object:0];
  [v3 removeObserver:self name:ICAccountsDidChangeNotification object:0];

  v4.receiver = self;
  v4.super_class = (Class)ICImagesAndMoviesScrollView;
  [(ICImagesAndMoviesScrollView *)&v4 dealloc];
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)ICImagesAndMoviesScrollView;
  [(ICImagesAndMoviesScrollView *)&v3 layoutSubviews];
  [(ICImagesAndMoviesScrollView *)self updateCollectionViewItemSizeAndFrame];
}

- (void)setBackground
{
  id v4 = +[UIColor ICBackgroundColor];
  objc_super v3 = [(ICImagesAndMoviesScrollView *)self collectionView];
  [v3 setBackgroundColor:v4];
}

- (void)respondToTapGesture:(id)a3
{
  id v4 = a3;
  v5 = [(ICImagesAndMoviesScrollView *)self collectionView];
  [v4 locationInView:v5];
  double v7 = v6;
  double v9 = v8;

  v10 = [(ICImagesAndMoviesScrollView *)self collectionView];
  [v10 indexPathForItemAtPoint:v7, v9];
  id v15 = (id)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    v11 = [(ICImagesAndMoviesScrollView *)self fetchedResultsController];
    v12 = [v11 objectAtIndexPath:v15];

    v13 = [(ICImagesAndMoviesScrollView *)self delegate];
    v14 = [(ICImagesAndMoviesScrollView *)self collectionView];
    [v13 browseAttachmentsCollectionView:v14 didSelectAttachment:v12 indexPath:0];
  }
}

- (int64_t)numberOfSectionsInCollectionView:(id)a3
{
  objc_super v3 = [(ICImagesAndMoviesScrollView *)self fetchedResultsController];
  id v4 = [v3 sections];
  id v5 = [v4 count];

  return (int64_t)v5;
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  id v5 = [(ICImagesAndMoviesScrollView *)self fetchedResultsController];
  double v6 = [v5 sections];
  double v7 = [v6 objectAtIndexedSubscript:a4];

  id v8 = [v7 numberOfObjects];
  return (int64_t)v8;
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(ICImagesAndMoviesScrollView *)self fetchedResultsController];
  double v9 = [v8 objectAtIndexPath:v7];

  unsigned int v10 = [v9 attachmentType];
  if (v10 != 3)
  {
    if (v10 == 9)
    {
      CFStringRef v11 = @"Drawing";
      goto LABEL_10;
    }
    if (v10 == 5)
    {
      CFStringRef v11 = @"Movie";
      goto LABEL_10;
    }
    v12 = os_log_create("com.apple.notes", "UI");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_1004DB0A0(v9, v12);
    }
  }
  CFStringRef v11 = @"Image";
LABEL_10:
  v13 = [v6 dequeueReusableCellWithReuseIdentifier:v11 forIndexPath:v7];
  [v13 setAttachment:v9];
  [v13 setThumbnailLayout:[self thumbnailLayout]];
  objc_opt_class();
  v14 = [(ICImagesAndMoviesScrollView *)self viewController];
  id v15 = ICDynamicCast();
  [v13 setCollectionController:v15];

  [v13 setScrollView:self];
  [v13 setDelegate:self];

  return v13;
}

- (id)collectionView:(id)a3 viewForSupplementaryElementOfKind:(id)a4 atIndexPath:(id)a5
{
  return [a3 dequeueReusableSupplementaryViewOfKind:a4 withReuseIdentifier:@"Padding" forIndexPath:a5];
}

- (BOOL)collectionView:(id)a3 canPerformAction:(SEL)a4 forItemAtIndexPath:(id)a5 withSender:(id)a6
{
  id v9 = a6;
  unsigned int v10 = [a3 cellForItemAtIndexPath:a5];
  LOBYTE(a4) = [v10 canPerformAction:a4 withSender:v9];

  return (char)a4;
}

- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  if ((id)[(ICImagesAndMoviesScrollView *)self scrollDirection] == (id)1)
  {
    id v9 = [(ICImagesAndMoviesScrollView *)self fetchedResultsController];
    unsigned int v10 = [v9 objectAtIndexPath:v8];

    [v10 intrinsicContentSize];
    double v12 = v11;
    double v14 = v13;
    [(ICImagesAndMoviesScrollView *)self bounds];
    double v16 = v15;
    double v17 = v15;
    if (v12 > 0.0)
    {
      double v17 = v15;
      if (v14 > 0.0) {
        double v17 = ceil(v12 / v14 * v15);
      }
    }
  }
  else
  {
    [v7 itemSize];
    double v17 = v18;
    double v16 = v19;
  }

  double v20 = v17;
  double v21 = v16;
  result.height = v21;
  result.width = v20;
  return result;
}

- (id)contextMenuInteraction:(id)a3 configurationForMenuAtLocation:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  id v7 = [(ICImagesAndMoviesScrollView *)self collectionView];
  id v8 = [v7 ic_cellAtLocation:x, y];

  if (v8 && [v8 conformsToProtocol:&OBJC_PROTOCOL___ICNotePreviewingActions])
  {
    id v9 = v8;
    unsigned int v10 = [(ICImagesAndMoviesScrollView *)self ic_viewControllerManager];
    double v11 = [v9 previewActionsForViewControllerManager:v10 fromView:self];

    objc_opt_class();
    double v12 = ICDynamicCast();
    double v13 = v12;
    if (v12
      && ([v12 attachment], double v14 = objc_claimAutoreleasedReturnValue(), v14, v14))
    {
      double v15 = [(ICImagesAndMoviesScrollView *)self ic_viewControllerManager];
      double v16 = [v13 attachment];
      v27 = v16;
      double v17 = +[NSArray arrayWithObjects:&v27 count:1];
      double v18 = +[ICAttachmentPresenter previewViewControllerWithViewControllerManager:v15 attachments:v17 startingAtIndex:0 delegate:0 editable:0 isFromAttachmentBrowser:0];
    }
    else
    {
      double v18 = 0;
    }
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472;
    v25[2] = sub_1000DF7FC;
    v25[3] = &unk_100629760;
    id v26 = v18;
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472;
    v23[2] = sub_1000DF804;
    v23[3] = &unk_100629788;
    id v24 = v11;
    id v20 = v11;
    id v21 = v18;
    double v19 = +[UIContextMenuConfiguration configurationWithIdentifier:0 previewProvider:v25 actionProvider:v23];
  }
  else
  {
    double v19 = 0;
  }

  return v19;
}

- (id)contextMenuInteraction:(id)a3 configuration:(id)a4 highlightPreviewForItemWithIdentifier:(id)a5
{
  id v6 = a3;
  id v7 = [(ICImagesAndMoviesScrollView *)self collectionView];
  id v8 = [(ICImagesAndMoviesScrollView *)self collectionView];
  [v6 locationInView:v8];
  double v10 = v9;
  double v12 = v11;

  double v13 = [v7 ic_cellAtLocation:v10, v12];

  double v14 = ICProtocolCast();
  uint64_t v15 = [v14 contextMenuInteractionPreview];
  double v16 = (void *)v15;
  if (v15) {
    double v17 = (void *)v15;
  }
  else {
    double v17 = v13;
  }
  id v18 = v17;

  if (v18) {
    id v19 = [objc_alloc((Class)UITargetedPreview) initWithView:v18];
  }
  else {
    id v19 = 0;
  }

  return v19;
}

- (void)contextMenuInteraction:(id)a3 willPerformPreviewActionForMenuWithConfiguration:(id)a4 animator:(id)a5
{
  id v7 = a5;
  id v8 = a3;
  double v9 = [(ICImagesAndMoviesScrollView *)self collectionView];
  double v10 = [(ICImagesAndMoviesScrollView *)self collectionView];
  [v8 locationInView:v10];
  double v12 = v11;
  double v14 = v13;

  uint64_t v15 = [v9 indexPathForItemAtPoint:v12, v14];

  double v16 = [(ICImagesAndMoviesScrollView *)self fetchedResultsController];
  double v17 = [v16 objectAtIndexPath:v15];

  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_1000DFA8C;
  v20[3] = &unk_100625A00;
  v20[4] = self;
  id v21 = v17;
  id v22 = v15;
  id v18 = v15;
  id v19 = v17;
  [v7 addCompletion:v20];
}

- (void)controller:(id)a3 didChangeObject:(id)a4 atIndexPath:(id)a5 forChangeType:(unint64_t)a6 newIndexPath:(id)a7
{
  id v11 = a7;
  id v12 = a5;
  id v13 = a4;
  uint64_t v15 = objc_alloc_init(ICFetchedResultsControllerChange);
  [(ICFetchedResultsControllerChange *)v15 setType:a6];
  [(ICFetchedResultsControllerChange *)v15 setObject:v13];

  [(ICFetchedResultsControllerChange *)v15 setIndexPath:v12];
  [(ICFetchedResultsControllerChange *)v15 setTheNewIndexPath:v11];

  double v14 = [(ICImagesAndMoviesScrollView *)self changesFromFetchedResultsController];
  [v14 addObject:v15];
}

- (void)controllerDidChangeContent:(id)a3
{
  [(ICImagesAndMoviesScrollView *)self setPerformingBatchUpdatesFromFetchedResultsController:1];
  id v4 = [(ICImagesAndMoviesScrollView *)self collectionView];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000DFCAC;
  v6[3] = &unk_100625AF0;
  v6[4] = self;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1000DFF3C;
  v5[3] = &unk_100626580;
  v5[4] = self;
  [v4 performBatchUpdates:v6 completion:v5];
}

- (void)notesContextRefreshNotification:(id)a3
{
  if ([(ICImagesAndMoviesScrollView *)self performingBatchUpdatesFromFetchedResultsController])
  {
    [(ICImagesAndMoviesScrollView *)self setReloadDataAfterBatchUpdates:1];
  }
  else
  {
    id v4 = [(ICImagesAndMoviesScrollView *)self collectionView];
    [v4 reloadData];
  }
}

- (void)accountsDidChange:(id)a3
{
  uint64_t v4 = [(ICImagesAndMoviesScrollView *)self fetchedResultsController];
  if (v4)
  {
    id v5 = (void *)v4;
    id v6 = [(ICImagesAndMoviesScrollView *)self fetchedResultsController];
    id v10 = 0;
    unsigned __int8 v7 = [v6 performFetch:&v10];
    id v8 = v10;

    if ((v7 & 1) == 0)
    {
      double v9 = os_log_create("com.apple.notes", "UI");
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        sub_1004DB138((uint64_t)self, (uint64_t)v8, v9);
      }
    }
  }
  else
  {
    id v8 = 0;
  }
}

- (void)recreateFetchedResultsController
{
  objc_super v3 = [(ICImagesAndMoviesScrollView *)self fetchedResultsController];
  [v3 setDelegate:0];

  [(ICImagesAndMoviesScrollView *)self setFetchedResultsController:0];
  id v4 = +[ICAttachment newFetchRequestForAttachments];
  id v5 = [objc_alloc((Class)NSSortDescriptor) initWithKey:@"modificationDate" ascending:0];
  id v30 = v5;
  id v6 = +[NSArray arrayWithObjects:&v30 count:1];
  [v4 setSortDescriptors:v6];

  unsigned __int8 v7 = +[NSPredicate predicateWithFormat:@"%K == %d", @"section", [(ICImagesAndMoviesScrollView *)self attachmentSection]];
  v29[0] = v7;
  id v8 = +[NSPredicate predicateWithFormat:@"%K.@count > 0", @"previewImages"];
  v29[1] = v8;
  double v9 = +[ICNoteContext sharedContext];
  id v10 = [v9 managedObjectContext];
  id v11 = +[ICAttachment predicateForAttachmentBrowserWithContext:v10];
  v29[2] = v11;
  id v12 = +[NSArray arrayWithObjects:v29 count:3];
  id v13 = +[NSMutableArray arrayWithArray:v12];

  if ([(ICImagesAndMoviesScrollView *)self attachmentSection] == 1)
  {
    double v14 = +[NSPredicate predicateWithFormat:@"%K >= %d", @"sizeWidth", 50];
    v28[0] = v14;
    uint64_t v15 = +[NSPredicate predicateWithFormat:@"%K >= %d", @"sizeHeight", 50];
    v28[1] = v15;
    double v16 = +[NSArray arrayWithObjects:v28 count:2];
    [v13 addObjectsFromArray:v16];
  }
  double v17 = +[NSCompoundPredicate andPredicateWithSubpredicates:v13];
  [v4 setPredicate:v17];

  [(ICImagesAndMoviesScrollView *)self bounds];
  if (v18 > 0.0)
  {
    [(ICImagesAndMoviesScrollView *)self bounds];
    if (v19 > 0.0)
    {
      [(ICImagesAndMoviesScrollView *)self bounds];
      float v21 = v20 * 0.0078125;
      unint64_t v22 = vcvtps_u32_f32(v21);
      if ((id)[(ICImagesAndMoviesScrollView *)self scrollDirection] != (id)1)
      {
        [(ICImagesAndMoviesScrollView *)self bounds];
        float v24 = v23 * 0.0078125;
        v22 *= vcvtps_u32_f32(v24);
      }
      [v4 setFetchBatchSize:v22];
    }
  }
  v25 = +[ICNoteContext sharedContext];
  id v26 = [v25 fetchedResultsControllerForFetchRequest:v4 sectionNameKeyPath:0];
  [(ICImagesAndMoviesScrollView *)self setFetchedResultsController:v26];

  v27 = [(ICImagesAndMoviesScrollView *)self fetchedResultsController];
  [v27 setDelegate:self];
}

- (void)updateCollectionViewItemSizeAndFrame
{
  id v20 = [(ICImagesAndMoviesScrollView *)self collectionViewFlowLayout];
  [(ICImagesAndMoviesScrollView *)self bounds];
  if (v3 > 0.0)
  {
    double v4 = v3;
    if ((id)[(ICImagesAndMoviesScrollView *)self scrollDirection] == (id)1)
    {
      [(ICImagesAndMoviesScrollView *)self frame];
      CGFloat Height = CGRectGetHeight(v22);
      [v20 setItemSize:Height, Height];
      id v6 = [(ICImagesAndMoviesScrollView *)self traitCollection];
      double v7 = 4.0;
      if ([v6 horizontalSizeClass] != (id)1)
      {
        id v8 = [(ICImagesAndMoviesScrollView *)self traitCollection];
        if ([v8 verticalSizeClass] == (id)1) {
          double v7 = 4.0;
        }
        else {
          double v7 = 12.0;
        }
      }
      [v20 setMinimumInteritemSpacing:v7];
      [v20 setMinimumLineSpacing:4.0];
      double top = UIEdgeInsetsZero.top;
      double left = UIEdgeInsetsZero.left;
      double bottom = UIEdgeInsetsZero.bottom;
      double right = UIEdgeInsetsZero.right;
      id v13 = v20;
      goto LABEL_19;
    }
    double v14 = [(ICImagesAndMoviesScrollView *)self traitCollection];
    if ([v14 horizontalSizeClass] == (id)1)
    {
    }
    else
    {
      uint64_t v15 = [(ICImagesAndMoviesScrollView *)self traitCollection];
      id v16 = [v15 verticalSizeClass];

      if (v16 != (id)1)
      {
        [v20 setItemSize:128.0, 128.0];
        double top = 12.0;
        [v20 setMinimumInteritemSpacing:12.0];
        [v20 setMinimumLineSpacing:12.0];
        id v13 = v20;
        double left = 28.0;
        double bottom = 0.0;
        double right = 28.0;
LABEL_19:
        [v13 setSectionInset:top left:left bottom:bottom right:right];
        goto LABEL_20;
      }
    }
    uint64_t v17 = dword_100699E30;
    if (dword_100699E30)
    {
      double v18 = (double *)&qword_100524B18;
      while (*(v18 - 2) != v4)
      {
        v18 += 4;
        if (!--v17) {
          goto LABEL_16;
        }
      }
      [v20 setItemSize:*(v18 - 1), *(v18 - 1)];
      [v20 setMinimumInteritemSpacing:*v18];
      [v20 setMinimumLineSpacing:v18[1]];
      id v13 = v20;
      double top = 0.0;
      double left = 0.0;
      double bottom = 0.0;
      double right = 0.0;
    }
    else
    {
LABEL_16:
      double v19 = floor((v4 + -2.0 + -10.0) / 6.0);
      [v20 setItemSize:v19, v19];
      [v20 setMinimumInteritemSpacing:2.0];
      [v20 setMinimumLineSpacing:2.0];
      id v13 = v20;
      double left = 1.0;
      double top = 0.0;
      double bottom = 0.0;
      double right = 1.0;
    }
    goto LABEL_19;
  }
LABEL_20:
}

- (void)registerForTraitChanges
{
  objc_initWeak(&location, self);
  uint64_t v8 = objc_opt_class();
  double v3 = +[NSArray arrayWithObjects:&v8 count:1];
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1000E0828;
  v5[3] = &unk_100625EB8;
  objc_copyWeak(&v6, &location);
  id v4 = [(ICImagesAndMoviesScrollView *)self registerForTraitChanges:v3 withHandler:v5];

  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

- (UICollectionViewFlowLayout)collectionViewFlowLayout
{
  v2 = [(ICImagesAndMoviesScrollView *)self collectionView];
  double v3 = [v2 collectionViewLayout];

  return (UICollectionViewFlowLayout *)v3;
}

- (void)setAttachmentSection:(signed __int16)a3
{
  if (self->_attachmentSection != a3)
  {
    self->_attachmentSection = a3;
    [(ICImagesAndMoviesScrollView *)self recreateFetchedResultsController];
    id v4 = [(ICImagesAndMoviesScrollView *)self collectionView];
    [v4 reloadData];
  }
}

- (void)setScrollDirection:(int64_t)a3
{
  id v5 = [(ICImagesAndMoviesScrollView *)self collectionViewFlowLayout];
  [v5 setScrollDirection:a3];

  [(ICImagesAndMoviesScrollView *)self updateCollectionViewItemSizeAndFrame];
}

- (int64_t)scrollDirection
{
  v2 = [(ICImagesAndMoviesScrollView *)self collectionViewFlowLayout];
  id v3 = [v2 scrollDirection];

  return (int64_t)v3;
}

- (unint64_t)thumbnailLayout
{
  if ([(ICImagesAndMoviesScrollView *)self scrollDirection]) {
    return 1;
  }
  id v4 = [(ICImagesAndMoviesScrollView *)self traitCollection];
  if ([v4 horizontalSizeClass] == (id)1)
  {

    return 0;
  }
  id v5 = [(ICImagesAndMoviesScrollView *)self traitCollection];
  id v6 = [v5 verticalSizeClass];

  if (v6 == (id)1) {
    return 0;
  }
  return 2;
}

- (NSArray)attachments
{
  v2 = [(ICImagesAndMoviesScrollView *)self fetchedResultsController];
  id v3 = [v2 fetchedObjects];

  return (NSArray *)v3;
}

- (id)attachmentPresenter:(id)a3 transitionViewForAttachment:(id)a4
{
  id v5 = a4;
  id v6 = [(ICImagesAndMoviesScrollView *)self fetchedResultsController];
  double v7 = [v6 indexPathForObject:v5];

  uint64_t v8 = [(ICImagesAndMoviesScrollView *)self collectionView];
  double v9 = [v8 cellForItemAtIndexPath:v7];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v10 = [(ICImagesAndMoviesScrollView *)v9 thumbnailView];
  }
  else
  {
    if (v9) {
      id v11 = v9;
    }
    else {
      id v11 = self;
    }
    id v10 = v11;
  }
  id v12 = v10;

  return v12;
}

- (BOOL)browseAttachmentsCell:(id)a3 didSelectAttachment:(id)a4
{
  id v5 = a4;
  id v6 = [(ICImagesAndMoviesScrollView *)self delegate];

  if (v6)
  {
    double v7 = [(ICImagesAndMoviesScrollView *)self delegate];
    uint64_t v8 = [(ICImagesAndMoviesScrollView *)self collectionView];
    [v7 browseAttachmentsCollectionView:v8 didSelectAttachment:v5 indexPath:0];
  }
  return v6 != 0;
}

- (void)browseAttachmentsCell:(id)a3 shouldShareAttachment:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v9 = [(ICImagesAndMoviesScrollView *)self delegate];
  uint64_t v8 = [(ICImagesAndMoviesScrollView *)self collectionView];
  [v9 browseAttachmentsCollectionView:v8 cell:v7 shouldShareAttachment:v6];
}

- (void)browseAttachmentsCell:(id)a3 shouldInspectAttachment:(id)a4
{
  id v9 = a4;
  id v5 = [(ICImagesAndMoviesScrollView *)self delegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = [(ICImagesAndMoviesScrollView *)self delegate];
    uint64_t v8 = [(ICImagesAndMoviesScrollView *)self collectionView];
    [v7 browseAttachmentsCollectionView:v8 shouldInspectAttachment:v9];
  }
}

- (signed)attachmentSection
{
  return self->_attachmentSection;
}

- (UIViewController)viewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_viewController);

  return (UIViewController *)WeakRetained;
}

- (void)setViewController:(id)a3
{
}

- (UICollectionView)collectionView
{
  return self->_collectionView;
}

- (void)setCollectionView:(id)a3
{
}

- (ICBrowseAttachmentsCollectionDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (ICBrowseAttachmentsCollectionDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSFetchedResultsController)fetchedResultsController
{
  return self->_fetchedResultsController;
}

- (void)setFetchedResultsController:(id)a3
{
}

- (NSMutableArray)changesFromFetchedResultsController
{
  return self->_changesFromFetchedResultsController;
}

- (void)setChangesFromFetchedResultsController:(id)a3
{
}

- (BOOL)performingBatchUpdatesFromFetchedResultsController
{
  return self->_performingBatchUpdatesFromFetchedResultsController;
}

- (void)setPerformingBatchUpdatesFromFetchedResultsController:(BOOL)a3
{
  self->_performingBatchUpdatesFromFetchedResultsController = a3;
}

- (BOOL)reloadDataAfterBatchUpdates
{
  return self->_reloadDataAfterBatchUpdates;
}

- (void)setReloadDataAfterBatchUpdates:(BOOL)a3
{
  self->_reloadDataAfterBatchUpdates = a3;
}

- (UIContextMenuInteraction)contextInteraction
{
  return self->_contextInteraction;
}

- (void)setContextInteraction:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contextInteraction, 0);
  objc_storeStrong((id *)&self->_changesFromFetchedResultsController, 0);
  objc_storeStrong((id *)&self->_fetchedResultsController, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_collectionView, 0);

  objc_destroyWeak((id *)&self->_viewController);
}

@end