@interface ICBrowseAttachmentsCollectionController
- (BOOL)accessibilityPerformEscape;
- (BOOL)browseAttachmentsCell:(id)a3 didSelectAttachment:(id)a4;
- (BOOL)canBecomeFirstResponder;
- (BOOL)displayAllSections;
- (BOOL)isAttachmentBrowser;
- (BOOL)updatingAccounts;
- (BOOL)useImagesAndMoviesScrollViewAtIndexPath:(id)a3;
- (BOOL)useImagesAndMoviesScrollViewForSection:(signed __int16)a3;
- (CGSize)collectionView:(id)a3 layout:(id)a4 referenceSizeForHeaderInSection:(int64_t)a5;
- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5;
- (ICBrowseAttachmentsCollectionController)init;
- (ICBrowseAttachmentsCollectionController)initWithAttachmentSection:(signed __int16)a3;
- (ICNAEventReporter)eventReporter;
- (NSArray)sortedSections;
- (NSFetchedResultsController)fetchedResultsController;
- (NSIndexPath)selectedIndexPath;
- (UIContextMenuInteraction)contextInteraction;
- (UIEdgeInsets)collectionView:(id)a3 layout:(id)a4 insetForSectionAtIndex:(int64_t)a5;
- (UILabel)emptyDetailsLabel;
- (UILabel)noAttachmentsLabel;
- (UISegmentedControl)segmentedControl;
- (UIView)emptyView;
- (double)collectionView:(id)a3 layout:(id)a4 minimumLineSpacingForSectionAtIndex:(int64_t)a5;
- (double)estimatedHeightForAXLargerTextSizesForSection:(unint64_t)a3;
- (double)leadingMargin;
- (double)trailingMargin;
- (id)attachmentAtIndexPath:(id)a3;
- (id)attachmentPresenter:(id)a3 transitionViewForAttachment:(id)a4;
- (id)attachmentsToPreviewWhenSelectingAttachment:(id)a3;
- (id)browserDidCloseHandler;
- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4;
- (id)collectionView:(id)a3 viewForSupplementaryElementOfKind:(id)a4 atIndexPath:(id)a5;
- (id)collectionViewIndexPathFromFetchedResultsControllerIndexPath:(id)a3;
- (id)contextMenuInteraction:(id)a3 configuration:(id)a4 highlightPreviewForItemWithIdentifier:(id)a5;
- (id)contextMenuInteraction:(id)a3 configurationForMenuAtLocation:(CGPoint)a4;
- (id)emptyTextForAttachmentSection:(signed __int16)a3;
- (id)nonScrollingCellIdentifierForAttachmentType:(signed __int16)a3;
- (id)titleForAttachmentSection:(signed __int16)a3;
- (id)viewControllerForAttachmentSection:(signed __int16)a3;
- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4;
- (int64_t)numberOfItemsToDisplayInSection:(int64_t)a3 withTraitCollection:(id)a4;
- (int64_t)numberOfSectionsInCollectionView:(id)a3;
- (signed)attachmentSection;
- (unint64_t)cellsPerRow;
- (void)accountsDidChange;
- (void)accountsWillChange;
- (void)adjustContentInsetOfImageScroller:(id)a3;
- (void)applyAccessibilityInfo;
- (void)browseAttachmentsCell:(id)a3 shouldInspectAttachment:(id)a4;
- (void)browseAttachmentsCell:(id)a3 shouldShareAttachment:(id)a4;
- (void)browseAttachmentsCollectionView:(id)a3 cell:(id)a4 shouldShareAttachment:(id)a5;
- (void)browseAttachmentsCollectionView:(id)a3 didSelectAttachment:(id)a4 indexPath:(id)a5;
- (void)browseAttachmentsCollectionView:(id)a3 shouldInspectAttachment:(id)a4;
- (void)contentSizeCategoryDidChange;
- (void)contextMenuInteraction:(id)a3 willPerformPreviewActionForMenuWithConfiguration:(id)a4 animator:(id)a5;
- (void)controllerDidChangeContent:(id)a3;
- (void)dealloc;
- (void)doneAction:(id)a3;
- (void)eventReporterLostSession:(id)a3;
- (void)icaxDismissAttachmentBrowser;
- (void)notesContextRefreshNotification:(id)a3;
- (void)performCmd3:(id)a3;
- (void)reload;
- (void)respondToTapGesture:(id)a3;
- (void)segmentedControlValueDidChange:(id)a3;
- (void)setAttachmentSection:(signed __int16)a3;
- (void)setBrowserDidCloseHandler:(id)a3;
- (void)setContextInteraction:(id)a3;
- (void)setEmptyDetailsLabel:(id)a3;
- (void)setEmptyView:(id)a3;
- (void)setEventReporter:(id)a3;
- (void)setFetchedResultsController:(id)a3;
- (void)setNoAttachmentsLabel:(id)a3;
- (void)setSelectedIndexPath:(id)a3;
- (void)setSortedSections:(id)a3;
- (void)setUpdatingAccounts:(BOOL)a3;
- (void)showAllForAttachmentSection:(signed __int16)a3;
- (void)sortFetchedResultsSections;
- (void)updateEmptyView;
- (void)updateEmptyViewFonts;
- (void)updateHeaderViewMargins;
- (void)updateImagesAndMoviesScrollViewContentInset;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)viewWillLayoutSubviews;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation ICBrowseAttachmentsCollectionController

- (BOOL)accessibilityPerformEscape
{
  return 1;
}

- (ICBrowseAttachmentsCollectionController)initWithAttachmentSection:(signed __int16)a3
{
  v5 = objc_alloc_init(ICBrowseAttachmentsCollectionViewLayout);
  v8.receiver = self;
  v8.super_class = (Class)ICBrowseAttachmentsCollectionController;
  v6 = [(ICBrowseAttachmentsCollectionController *)&v8 initWithCollectionViewLayout:v5];

  if (v6) {
    v6->_attachmentSection = a3;
  }
  return v6;
}

- (ICBrowseAttachmentsCollectionController)init
{
  return [(ICBrowseAttachmentsCollectionController *)self initWithAttachmentSection:0];
}

- (void)dealloc
{
  v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)ICBrowseAttachmentsCollectionController;
  [(ICBrowseAttachmentsCollectionController *)&v4 dealloc];
}

- (void)viewDidLoad
{
  v35.receiver = self;
  v35.super_class = (Class)ICBrowseAttachmentsCollectionController;
  [(ICBrowseAttachmentsCollectionController *)&v35 viewDidLoad];
  v3 = [(ICBrowseAttachmentsCollectionController *)self navigationController];
  objc_super v4 = [v3 navigationBar];
  [v4 setPrefersLargeTitles:1];

  if ([(ICBrowseAttachmentsCollectionController *)self displayAllSections]) {
    uint64_t v5 = 1;
  }
  else {
    uint64_t v5 = 2;
  }
  v6 = [(ICBrowseAttachmentsCollectionController *)self navigationItem];
  [v6 setLargeTitleDisplayMode:v5];

  if (+[UIDevice ic_isVision])
  {
    v7 = [(ICBrowseAttachmentsCollectionController *)self navigationItem];
    [v7 setStyle:0];

    objc_super v8 = [(ICBrowseAttachmentsCollectionController *)self segmentedControl];
    v9 = [(ICBrowseAttachmentsCollectionController *)self navigationItem];
    [v9 setTitleView:v8];
  }
  v10 = +[UIColor ICBackgroundColor];
  v11 = [(ICBrowseAttachmentsCollectionController *)self collectionView];
  [v11 setBackgroundColor:v10];

  v12 = [(ICBrowseAttachmentsCollectionController *)self collectionView];
  [v12 registerClass:objc_opt_class() forCellWithReuseIdentifier:@"ICBrowseAttachmentsImagesAndMoviesCell"];

  v13 = [(ICBrowseAttachmentsCollectionController *)self collectionView];
  [v13 registerClass:objc_opt_class() forCellWithReuseIdentifier:@"ICBrowseAttachmentsScannedPagesCell"];

  v14 = [(ICBrowseAttachmentsCollectionController *)self collectionView];
  [v14 registerClass:objc_opt_class() forCellWithReuseIdentifier:@"ICBrowseAttachmentsBrickCell"];

  v15 = [(ICBrowseAttachmentsCollectionController *)self collectionView];
  [v15 registerClass:objc_opt_class() forCellWithReuseIdentifier:@"kICBrowseAttachmentsImageCell"];

  v16 = [(ICBrowseAttachmentsCollectionController *)self collectionView];
  [v16 registerClass:objc_opt_class() forCellWithReuseIdentifier:@"kICBrowseAttachmentsMovieCell"];

  v17 = [(ICBrowseAttachmentsCollectionController *)self collectionView];
  [v17 registerClass:objc_opt_class() forCellWithReuseIdentifier:@"kICBrowseAttachmentsDrawingCell"];

  v18 = -[ICBrowseAttachmentsBrickCell initWithFrame:]([ICBrowseAttachmentsBrickCell alloc], "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  defaultSizingBrickCell = self->_defaultSizingBrickCell;
  self->_defaultSizingBrickCell = v18;

  v20 = (objc_class *)objc_opt_class();
  v21 = NSStringFromClass(v20);
  v22 = +[NSBundle bundleForClass:objc_opt_class()];
  v23 = +[UINib nibWithNibName:v21 bundle:v22];

  v24 = [(ICBrowseAttachmentsCollectionController *)self collectionView];
  [v24 registerNib:v23 forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"ICBrowseAttachmentsHeaderView"];

  id v25 = [objc_alloc((Class)UIBarButtonItem) initWithBarButtonSystemItem:0 target:self action:"doneAction:"];
  id v36 = v25;
  v26 = +[NSArray arrayWithObjects:&v36 count:1];
  v27 = [(ICBrowseAttachmentsCollectionController *)self navigationItem];
  [v27 setRightBarButtonItems:v26];

  id v28 = [objc_alloc((Class)UITapGestureRecognizer) initWithTarget:self action:"respondToTapGesture:"];
  v29 = [(ICBrowseAttachmentsCollectionController *)self collectionView];
  [v29 addGestureRecognizer:v28];

  v30 = +[ICBrowseAttachmentsDragAndDropDelegate sharedInstance];
  v31 = [(ICBrowseAttachmentsCollectionController *)self collectionView];
  [v31 setDragDelegate:v30];

  id v32 = [objc_alloc((Class)UIContextMenuInteraction) initWithDelegate:self];
  [(ICBrowseAttachmentsCollectionController *)self setContextInteraction:v32];

  v33 = [(ICBrowseAttachmentsCollectionController *)self collectionView];
  v34 = [(ICBrowseAttachmentsCollectionController *)self contextInteraction];
  [v33 addInteraction:v34];
}

- (void)viewWillLayoutSubviews
{
  v16.receiver = self;
  v16.super_class = (Class)ICBrowseAttachmentsCollectionController;
  [(ICBrowseAttachmentsCollectionController *)&v16 viewWillLayoutSubviews];
  v3 = [(ICBrowseAttachmentsCollectionController *)self view];
  [v3 directionalLayoutMargins];
  double v5 = v4;
  double v7 = v6;

  if (+[UIDevice ic_isVision])
  {
    double v8 = 32.0;
  }
  else
  {
    v9 = [(ICBrowseAttachmentsCollectionController *)self view];
    v10 = [v9 traitCollection];
    id v11 = [v10 horizontalSizeClass];

    if (v11 == (id)2) {
      double v8 = 28.0;
    }
    else {
      double v8 = 16.0;
    }
  }
  v12 = [(ICBrowseAttachmentsCollectionController *)self view];
  [v12 setDirectionalLayoutMargins:v5, v8, v7, v8];

  v13 = [(ICBrowseAttachmentsCollectionController *)self navigationItem];
  [v13 setLargeTitleInsets:0.0, v8, 0.0, v8];

  v14 = [(ICBrowseAttachmentsCollectionController *)self navigationController];
  v15 = [v14 navigationBar];
  [v15 layoutSubviews];
}

- (void)viewWillAppear:(BOOL)a3
{
  v8.receiver = self;
  v8.super_class = (Class)ICBrowseAttachmentsCollectionController;
  [(ICBrowseAttachmentsCollectionController *)&v8 viewWillAppear:a3];
  [(ICBrowseAttachmentsCollectionController *)self reload];
  double v4 = +[NSNotificationCenter defaultCenter];
  [v4 addObserver:self selector:"notesContextRefreshNotification:" name:ICNotesContextRefreshNotification object:0];

  double v5 = +[NSNotificationCenter defaultCenter];
  [v5 addObserver:self selector:"contentSizeCategoryDidChange" name:UIContentSizeCategoryDidChangeNotification object:0];

  double v6 = +[NSNotificationCenter defaultCenter];
  [v6 addObserver:self selector:"accountsWillChange" name:ICAccountsWillChangeNotification object:0];

  double v7 = +[NSNotificationCenter defaultCenter];
  [v7 addObserver:self selector:"accountsDidChange" name:ICAccountsDidChangeNotification object:0];
}

- (void)viewDidAppear:(BOOL)a3
{
  v3.receiver = self;
  v3.super_class = (Class)ICBrowseAttachmentsCollectionController;
  [(ICBrowseAttachmentsCollectionController *)&v3 viewDidAppear:a3];
  UIAccessibilityPostNotification(UIAccessibilityLayoutChangedNotification, 0);
}

- (void)viewWillDisappear:(BOOL)a3
{
  v8.receiver = self;
  v8.super_class = (Class)ICBrowseAttachmentsCollectionController;
  [(ICBrowseAttachmentsCollectionController *)&v8 viewWillDisappear:a3];
  double v4 = +[NSNotificationCenter defaultCenter];
  [v4 removeObserver:self name:ICNotesContextRefreshNotification object:0];

  double v5 = +[NSNotificationCenter defaultCenter];
  [v5 removeObserver:self name:UIContentSizeCategoryDidChangeNotification object:0];

  double v6 = +[NSNotificationCenter defaultCenter];
  [v6 removeObserver:self name:ICAccountsWillChangeNotification object:0];

  double v7 = +[NSNotificationCenter defaultCenter];
  [v7 removeObserver:self name:ICAccountsDidChangeNotification object:0];
}

- (void)viewDidDisappear:(BOOL)a3
{
  v7.receiver = self;
  v7.super_class = (Class)ICBrowseAttachmentsCollectionController;
  [(ICBrowseAttachmentsCollectionController *)&v7 viewDidDisappear:a3];
  double v4 = [(ICBrowseAttachmentsCollectionController *)self fetchedResultsController];
  [v4 setDelegate:0];

  [(ICBrowseAttachmentsCollectionController *)self setFetchedResultsController:0];
  double v5 = [(ICBrowseAttachmentsCollectionController *)self browserDidCloseHandler];

  if (v5)
  {
    double v6 = [(ICBrowseAttachmentsCollectionController *)self browserDidCloseHandler];
    v6[2](v6, 0);
  }
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  id v7 = a4;
  objc_super v8 = [(ICBrowseAttachmentsCollectionController *)self collectionViewLayout];
  [v8 invalidateLayout];

  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100123168;
  v10[3] = &unk_100625AC8;
  v10[4] = self;
  [v7 animateAlongsideTransition:v10 completion:0];
  v9.receiver = self;
  v9.super_class = (Class)ICBrowseAttachmentsCollectionController;
  -[ICBrowseAttachmentsCollectionController viewWillTransitionToSize:withTransitionCoordinator:](&v9, "viewWillTransitionToSize:withTransitionCoordinator:", v7, width, height);
}

- (BOOL)canBecomeFirstResponder
{
  return 1;
}

- (void)setAttachmentSection:(signed __int16)a3
{
  self->_attachmentSection = a3;
  [(ICBrowseAttachmentsCollectionController *)self reload];
}

- (void)reload
{
  id v3 = +[ICAttachment newFetchRequestForAttachments];
  id v4 = [objc_alloc((Class)NSSortDescriptor) initWithKey:@"section" ascending:1];
  v35[0] = v4;
  id v5 = [objc_alloc((Class)NSSortDescriptor) initWithKey:@"modificationDate" ascending:0];
  v35[1] = v5;
  double v6 = +[NSArray arrayWithObjects:v35 count:2];
  [v3 setSortDescriptors:v6];

  if ([(ICBrowseAttachmentsCollectionController *)self attachmentSection])
  {
    id v7 = +[NSPredicate predicateWithFormat:@"section == %d", [(ICBrowseAttachmentsCollectionController *)self attachmentSection]];
    if ([(ICBrowseAttachmentsCollectionController *)self attachmentSection] == 6)
    {
      v34[0] = v7;
      objc_super v8 = +[NSPredicate predicateWithFormat:@"typeUTI == %@", ICAttachmentUTTypePaperDocumentScan];
      v34[1] = v8;
      objc_super v9 = +[NSArray arrayWithObjects:v34 count:2];
      uint64_t v10 = +[NSCompoundPredicate orPredicateWithSubpredicates:v9];

      id v7 = (void *)v10;
    }
    v33[0] = v7;
    id v11 = +[ICNoteContext sharedContext];
    v12 = [v11 managedObjectContext];
    v13 = +[ICAttachment predicateForAttachmentBrowserWithContext:v12];
    v33[1] = v13;
    v14 = +[NSArray arrayWithObjects:v33 count:2];

    id v15 = [objc_alloc((Class)NSCompoundPredicate) initWithType:1 subpredicates:v14];
  }
  else
  {
    objc_super v16 = +[NSPredicate predicateWithFormat:@"section != %d", 0];
    v32[0] = v16;
    v17 = +[ICNoteContext sharedContext];
    v18 = [v17 managedObjectContext];
    v19 = +[ICAttachment predicateForAttachmentBrowserWithContext:v18];
    v32[1] = v19;
    id v7 = +[NSArray arrayWithObjects:v32 count:2];

    id v15 = [objc_alloc((Class)NSCompoundPredicate) initWithType:1 subpredicates:v7];
  }

  [v3 setPredicate:v15];
  v20 = +[ICNoteContext sharedContext];
  v21 = [v20 fetchedResultsControllerForFetchRequest:v3 sectionNameKeyPath:@"section"];
  [(ICBrowseAttachmentsCollectionController *)self setFetchedResultsController:v21];

  v22 = +[NSArray array];
  [(ICBrowseAttachmentsCollectionController *)self setSortedSections:v22];

  v23 = [(ICBrowseAttachmentsCollectionController *)self fetchedResultsController];
  [v23 setDelegate:self];

  [(ICBrowseAttachmentsCollectionController *)self sortFetchedResultsSections];
  if ([(ICBrowseAttachmentsCollectionController *)self displayAllSections])
  {
    v24 = +[NSBundle mainBundle];
    id v25 = [v24 localizedStringForKey:@"Attachments" value:&stru_10063F3D8 table:0];
    v26 = [(ICBrowseAttachmentsCollectionController *)self navigationItem];
    [v26 setTitle:v25];
  }
  else
  {
    v24 = [(ICBrowseAttachmentsCollectionController *)self titleForAttachmentSection:[(ICBrowseAttachmentsCollectionController *)self attachmentSection]];
    id v25 = [(ICBrowseAttachmentsCollectionController *)self navigationItem];
    [v25 setTitle:v24];
  }

  v27 = +[ICAttachment attachmentSectionSortOrder];
  id v28 = +[NSNumber numberWithShort:[(ICBrowseAttachmentsCollectionController *)self attachmentSection]];
  id v29 = [v27 indexOfObject:v28];
  v30 = [(ICBrowseAttachmentsCollectionController *)self segmentedControl];
  [v30 setSelectedSegmentIndex:v29];

  [(ICBrowseAttachmentsCollectionController *)self updateEmptyView];
  v31 = [(ICBrowseAttachmentsCollectionController *)self fetchedResultsController];
  [(ICBrowseAttachmentsCollectionController *)self controllerDidChangeContent:v31];

  [(ICBrowseAttachmentsCollectionController *)self applyAccessibilityInfo];
}

- (BOOL)displayAllSections
{
  return [(ICBrowseAttachmentsCollectionController *)self attachmentSection] == 0;
}

- (id)attachmentAtIndexPath:(id)a3
{
  id v4 = a3;
  id v5 = [(ICBrowseAttachmentsCollectionController *)self fetchedResultsController];

  if (!v5)
  {
    objc_super v16 = 0;
    goto LABEL_14;
  }
  id v6 = [v4 section];
  id v7 = [(ICBrowseAttachmentsCollectionController *)self sortedSections];
  id v8 = [v7 count];

  if (v6 >= v8)
  {
    uint64_t v10 = os_log_create("com.apple.notes", "UI");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_1004DCC40((uint64_t)v4, self);
    }

    goto LABEL_12;
  }
  objc_super v9 = [(ICBrowseAttachmentsCollectionController *)self sortedSections];
  uint64_t v10 = [v9 objectAtIndexedSubscript:[v4 section]];

  id v11 = [v4 row];
  v12 = [v10 objects];
  id v13 = [v12 count];

  if (v11 >= v13)
  {
    v17 = os_log_create("com.apple.notes", "UI");
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      sub_1004DCC40((uint64_t)v4, self);
    }

LABEL_12:
    objc_super v16 = 0;
    goto LABEL_13;
  }
  objc_opt_class();
  v14 = [v10 objects];
  id v15 = [v14 objectAtIndexedSubscript:[v4 row]];
  objc_super v16 = ICCheckedDynamicCast();

LABEL_13:
LABEL_14:

  return v16;
}

- (BOOL)useImagesAndMoviesScrollViewForSection:(signed __int16)a3
{
  int v3 = a3;
  unsigned __int8 v4 = +[UIDevice ic_isVision];
  BOOL v6 = v3 == 1 || v3 == 7;
  return (v4 & 1) == 0 && v6;
}

- (BOOL)useImagesAndMoviesScrollViewAtIndexPath:(id)a3
{
  id v4 = a3;
  id v5 = [(ICBrowseAttachmentsCollectionController *)self sortedSections];
  id v6 = [v4 section];

  id v7 = [v5 objectAtIndexedSubscript:v6];

  id v8 = [v7 name];
  LOWORD(v6) = (unsigned __int16)[v8 intValue];

  LOBYTE(self) = [(ICBrowseAttachmentsCollectionController *)self useImagesAndMoviesScrollViewForSection:(__int16)v6];
  return (char)self;
}

- (UISegmentedControl)segmentedControl
{
  segmentedControl = self->_segmentedControl;
  if (!segmentedControl)
  {
    id v4 = +[ICAttachment attachmentSectionSortOrder];
    id v5 = [v4 array];
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_100123A7C;
    v10[3] = &unk_10062A778;
    v10[4] = self;
    id v6 = [v5 ic_compactMap:v10];

    id v7 = (UISegmentedControl *)[objc_alloc((Class)UISegmentedControl) initWithItems:v6];
    id v8 = self->_segmentedControl;
    self->_segmentedControl = v7;

    [(UISegmentedControl *)self->_segmentedControl setApportionsSegmentWidthsByContent:1];
    [(UISegmentedControl *)self->_segmentedControl addTarget:self action:"segmentedControlValueDidChange:" forControlEvents:4096];

    segmentedControl = self->_segmentedControl;
  }

  return segmentedControl;
}

- (void)segmentedControlValueDidChange:(id)a3
{
  id v4 = a3;
  id v7 = +[ICAttachment attachmentSectionSortOrder];
  id v5 = [v4 selectedSegmentIndex];

  id v6 = [v7 objectAtIndexedSubscript:v5];
  -[ICBrowseAttachmentsCollectionController setAttachmentSection:](self, "setAttachmentSection:", (__int16)[v6 integerValue]);
}

- (void)doneAction:(id)a3
{
  id v4 = [(ICBrowseAttachmentsCollectionController *)self browserDidCloseHandler];
  id v5 = [v4 copy];

  [(ICBrowseAttachmentsCollectionController *)self setBrowserDidCloseHandler:0];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100123C34;
  v8[3] = &unk_100625988;
  id v9 = v5;
  id v6 = v5;
  [(ICBrowseAttachmentsCollectionController *)self dismissViewControllerAnimated:1 completion:v8];
  id v7 = [(ICBrowseAttachmentsCollectionController *)self eventReporter];
  [v7 submitAttachmentBrowserActionEventForType:1];
}

- (void)respondToTapGesture:(id)a3
{
  id v4 = a3;
  id v5 = [(ICBrowseAttachmentsCollectionController *)self collectionView];
  [v4 locationInView:v5];
  double v7 = v6;
  double v9 = v8;

  uint64_t v10 = [(ICBrowseAttachmentsCollectionController *)self collectionView];
  [v10 indexPathForItemAtPoint:v7, v9];
  id v13 = (id)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    id v11 = [(ICBrowseAttachmentsCollectionController *)self attachmentAtIndexPath:v13];
    v12 = [(ICBrowseAttachmentsCollectionController *)self collectionView];
    [(ICBrowseAttachmentsCollectionController *)self browseAttachmentsCollectionView:v12 didSelectAttachment:v11 indexPath:v13];
  }
}

- (int64_t)numberOfSectionsInCollectionView:(id)a3
{
  if ([(ICBrowseAttachmentsCollectionController *)self updatingAccounts]) {
    return 0;
  }
  id v5 = [(ICBrowseAttachmentsCollectionController *)self sortedSections];
  id v6 = [v5 count];

  return (int64_t)v6;
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  id v6 = [(ICBrowseAttachmentsCollectionController *)self collectionView];
  double v7 = [v6 traitCollection];
  int64_t v8 = [(ICBrowseAttachmentsCollectionController *)self numberOfItemsToDisplayInSection:a4 withTraitCollection:v7];

  return v8;
}

- (id)nonScrollingCellIdentifierForAttachmentType:(signed __int16)a3
{
  int v3 = @"kICBrowseAttachmentsImageCell";
  switch(a3)
  {
    case 0:
    case 1:
    case 2:
    case 4:
    case 6:
    case 7:
    case 8:
    case 11:
    case 12:
    case 14:
      int v3 = @"ICBrowseAttachmentsBrickCell";
      break;
    case 5:
      int v3 = @"kICBrowseAttachmentsMovieCell";
      break;
    case 9:
    case 10:
    case 13:
      int v3 = @"kICBrowseAttachmentsDrawingCell";
      break;
    case 15:
      int v3 = @"ICBrowseAttachmentsBrickCell";
      if (+[UIDevice ic_isVision])
      {
        if ([(ICBrowseAttachmentsCollectionController *)self attachmentSection] == 7) {
          id v5 = @"kICBrowseAttachmentsImageCell";
        }
        else {
          id v5 = @"ICBrowseAttachmentsBrickCell";
        }
        int v3 = v5;
      }
      break;
    default:
      break;
  }

  return v3;
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  int64_t v8 = [(ICBrowseAttachmentsCollectionController *)self sortedSections];
  double v9 = [v8 objectAtIndexedSubscript:[v7 section]];

  uint64_t v10 = [v9 name];
  signed __int16 v11 = (unsigned __int16)[v10 intValue];

  v12 = [(ICBrowseAttachmentsCollectionController *)self attachmentAtIndexPath:v7];
  if ([(ICBrowseAttachmentsCollectionController *)self useImagesAndMoviesScrollViewAtIndexPath:v7])
  {
    id v31 = v6;
    uint64_t v13 = v11;
    if (v11 == 1)
    {
      CFStringRef v14 = @"ICBrowseAttachmentsImagesAndMoviesCell";
    }
    else if (v13 == 7)
    {
      CFStringRef v14 = @"ICBrowseAttachmentsScannedPagesCell";
    }
    else
    {
      +[ICAssert handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:](ICAssert, "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "__objc_no", "-[ICBrowseAttachmentsCollectionController collectionView:cellForItemAtIndexPath:]", 1, 0, @"Unhandled cell key case");
      CFStringRef v14 = &stru_10063F3D8;
    }
    v17 = [(ICBrowseAttachmentsCollectionController *)self collectionView];
    objc_super v16 = [v17 dequeueReusableCellWithReuseIdentifier:v14 forIndexPath:v7];

    v18 = [v16 contentView];
    v19 = [v18 subviews];
    id v20 = [v19 count];

    if (v20)
    {
      objc_opt_class();
      v21 = [v16 contentView];
      v22 = [v21 subviews];
      v23 = [v22 firstObject];
      ICCheckedDynamicCast();
      id v15 = (ICImagesAndMoviesScrollView *)objc_claimAutoreleasedReturnValue();

      [(ICImagesAndMoviesScrollView *)v15 setAttachmentSection:v13];
    }
    else
    {
      v24 = [ICImagesAndMoviesScrollView alloc];
      id v25 = [v16 contentView];
      [v25 bounds];
      id v15 = -[ICImagesAndMoviesScrollView initWithFrame:forAttachmentSection:](v24, "initWithFrame:forAttachmentSection:", v13);

      [(ICImagesAndMoviesScrollView *)v15 setViewController:self];
      [(ICImagesAndMoviesScrollView *)v15 setDelegate:self];
      [(ICImagesAndMoviesScrollView *)v15 setAutoresizingMask:18];
      v26 = [(ICImagesAndMoviesScrollView *)v15 collectionView];
      [v26 setContentInsetAdjustmentBehavior:2];

      v27 = [v16 contentView];
      [v27 addSubview:v15];
    }
    [(ICBrowseAttachmentsCollectionController *)self adjustContentInsetOfImageScroller:v15];
    id v6 = v31;
  }
  else
  {
    -[ICBrowseAttachmentsCollectionController nonScrollingCellIdentifierForAttachmentType:](self, "nonScrollingCellIdentifierForAttachmentType:", [v12 attachmentType]);
    id v15 = (ICImagesAndMoviesScrollView *)objc_claimAutoreleasedReturnValue();
    objc_super v16 = [v6 dequeueReusableCellWithReuseIdentifier:v15 forIndexPath:v7];
  }

  objc_opt_class();
  id v28 = ICDynamicCast();
  [v28 setAttachment:v12];
  [v28 setDelegate:self];
  [v28 setCollectionController:self];
  objc_opt_class();
  id v29 = ICDynamicCast();
  [v29 setThumbnailLayout:2];

  return v16;
}

- (id)collectionView:(id)a3 viewForSupplementaryElementOfKind:(id)a4 atIndexPath:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = a4;
  signed __int16 v11 = [(ICBrowseAttachmentsCollectionController *)self sortedSections];
  v12 = [v11 objectAtIndexedSubscript:[v9 section]];

  uint64_t v13 = [v12 name];
  signed __int16 v14 = (unsigned __int16)[v13 intValue];

  unsigned int v15 = [v10 isEqualToString:UICollectionElementKindSectionHeader];
  if (v15)
  {
    id v16 = [v8 dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"ICBrowseAttachmentsHeaderView" forIndexPath:v9];
    uint64_t v17 = v14;
    v18 = [(ICBrowseAttachmentsCollectionController *)self titleForAttachmentSection:v17];
    v19 = [v16 sectionLabel];
    [v19 setText:v18];

    id v20 = [(ICBrowseAttachmentsCollectionController *)self view];
    [v20 directionalLayoutMargins];
    [v16 setLeadingMargin:v21];

    v22 = [(ICBrowseAttachmentsCollectionController *)self view];
    [v22 directionalLayoutMargins];
    [v16 setTrailingMargin:v23];

    [v16 setAttachmentSection:v17];
    [v16 setDelegate:self];
    [v16 contentSizeCategoryDidChange];
  }
  else
  {
    id v16 = objc_alloc_init((Class)UICollectionReusableView);
  }

  return v16;
}

- (unint64_t)cellsPerRow
{
  if (+[UIDevice ic_isVision])
  {
    unsigned int v3 = [(ICBrowseAttachmentsCollectionController *)self attachmentSection];
    if (v3 < 8) {
      return qword_100524C90[v3];
    }
  }
  id v5 = [(ICBrowseAttachmentsCollectionController *)self collectionView];
  id v6 = [v5 traitCollection];
  id v7 = [v6 verticalSizeClass];

  if (v7 == (id)1) {
    return 2;
  }
  id v8 = [(ICBrowseAttachmentsCollectionController *)self collectionView];
  [v8 frame];
  double v10 = v9;
  [(ICBrowseAttachmentsCollectionController *)self leadingMargin];
  double v12 = v10 - v11;
  [(ICBrowseAttachmentsCollectionController *)self trailingMargin];
  unint64_t v4 = vcvtmd_u64_f64((v12 - v13) / 310.0);

  return v4;
}

- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  [v7 frame];
  double v10 = v9;
  if ([(ICBrowseAttachmentsCollectionController *)self useImagesAndMoviesScrollViewAtIndexPath:v8])
  {
    *(double *)&uint64_t v11 = 128.0;
  }
  else
  {
    double v12 = [(ICBrowseAttachmentsCollectionController *)self attachmentAtIndexPath:v8];
    double v13 = [v7 traitCollection];
    id v14 = [v13 horizontalSizeClass];

    if (v14 == (id)1
      && (+[ICDeviceSupport isLargerCompactHorizontalWidthDevice] & 1) == 0)
    {
      [(ICBrowseAttachmentsCollectionController *)self leadingMargin];
      double v23 = v10 - v22;
      [(ICBrowseAttachmentsCollectionController *)self trailingMargin];
      double v10 = v23 - v24;
    }
    else
    {
      double v15 = (double)[(ICBrowseAttachmentsCollectionController *)self cellsPerRow];
      unsigned int v16 = +[UIDevice ic_isVision];
      double v17 = 28.0;
      if (v16) {
        double v17 = 20.0;
      }
      double v18 = v10 - v17 * (v15 + -1.0);
      [(ICBrowseAttachmentsCollectionController *)self leadingMargin];
      double v20 = v18 - v19;
      [(ICBrowseAttachmentsCollectionController *)self trailingMargin];
      double v10 = floor((v20 - v21) / v15);
    }
    id v25 = -[ICBrowseAttachmentsCollectionController nonScrollingCellIdentifierForAttachmentType:](self, "nonScrollingCellIdentifierForAttachmentType:", [v12 attachmentType]);
    *(double *)&uint64_t v11 = v10;
    if ([v25 isEqual:@"ICBrowseAttachmentsBrickCell"])
    {
      v26 = [(ICBrowseAttachmentsCollectionController *)self attachmentAtIndexPath:v8];
      [(ICBrowseAttachmentsBrickCell *)self->_defaultSizingBrickCell setAttachment:v26];

      v27 = [(ICBrowseAttachmentsBrickCell *)self->_defaultSizingBrickCell attachmentBrickView];
      [v27 computedSize];
      uint64_t v11 = v28;
    }
  }

  double v29 = v10;
  double v30 = *(double *)&v11;
  result.double height = v30;
  result.double width = v29;
  return result;
}

- (UIEdgeInsets)collectionView:(id)a3 layout:(id)a4 insetForSectionAtIndex:(int64_t)a5
{
  id v7 = a3;
  id v8 = [(ICBrowseAttachmentsCollectionController *)self sortedSections];
  double v9 = [v8 objectAtIndexedSubscript:a5];

  double v10 = [v9 name];
  signed __int16 v11 = (unsigned __int16)[v10 intValue];

  double v12 = [v7 traitCollection];

  id v13 = [v12 horizontalSizeClass];
  if ([(ICBrowseAttachmentsCollectionController *)self useImagesAndMoviesScrollViewForSection:v11])
  {
    if (v13 == (id)1) {
      double v14 = 16.0;
    }
    else {
      double v14 = 19.0;
    }
    double v15 = 0.0;
    double v16 = 0.0;
  }
  else
  {
    [(ICBrowseAttachmentsCollectionController *)self leadingMargin];
    double v15 = v17;
    if (v13 == (id)1) {
      double v14 = 16.0;
    }
    else {
      double v14 = 19.0;
    }
    [(ICBrowseAttachmentsCollectionController *)self trailingMargin];
    double v16 = v18;
  }
  double v19 = [(ICBrowseAttachmentsCollectionController *)self view];
  id v20 = [v19 effectiveUserInterfaceLayoutDirection];

  if (v20 == (id)1) {
    double v21 = v15;
  }
  else {
    double v21 = v16;
  }
  if (v20 == (id)1) {
    double v15 = v16;
  }

  double v22 = 15.0;
  double v23 = v15;
  double v24 = v14;
  double v25 = v21;
  result.right = v25;
  result.bottom = v24;
  result.left = v23;
  result.top = v22;
  return result;
}

- (double)collectionView:(id)a3 layout:(id)a4 minimumLineSpacingForSectionAtIndex:(int64_t)a5
{
  unsigned int v5 = +[UIDevice ic_isVision];
  double result = 16.0;
  if (v5) {
    return 20.0;
  }
  return result;
}

- (CGSize)collectionView:(id)a3 layout:(id)a4 referenceSizeForHeaderInSection:(int64_t)a5
{
  id v7 = a3;
  if ([(ICBrowseAttachmentsCollectionController *)self displayAllSections])
  {
    id v8 = +[UIFont ic_attachmentBrowserTitleFont];
    [v8 lineHeight];
    double v10 = round(v9);

    signed __int16 v11 = [v7 window];
    double v12 = [v11 windowScene];
    id v13 = (char *)[v12 interfaceOrientation];

    double v14 = [v7 traitCollection];
    id v15 = [v14 horizontalSizeClass];

    if (ICAccessibilityAccessibilityLargerTextSizesEnabled()
      && (unint64_t)(v13 - 3) >= 0xFFFFFFFFFFFFFFFELL
      && v15 == (id)1)
    {
      [(ICBrowseAttachmentsCollectionController *)self estimatedHeightForAXLargerTextSizesForSection:a5];
      double v10 = v10 + v16;
    }
    double v17 = 15.0;
    if (a5 > 0) {
      double v17 = 14.0;
    }
    double height = v17 + v10;
    CGFloat width = 0.0;
  }
  else
  {
    CGFloat width = CGSizeZero.width;
    double height = CGSizeZero.height;
  }

  double v20 = width;
  double v21 = height;
  result.double height = v21;
  result.CGFloat width = v20;
  return result;
}

- (void)sortFetchedResultsSections
{
  unsigned int v3 = [(ICBrowseAttachmentsCollectionController *)self fetchedResultsController];
  unint64_t v4 = [v3 sections];
  id v5 = [v4 mutableCopy];

  +[NSMutableSet set];
  uint64_t v24 = 0;
  double v25 = &v24;
  uint64_t v26 = 0x2020000000;
  uint64_t v27 = 0x7FFFFFFFFFFFFFFFLL;
  uint64_t v20 = 0;
  double v21 = &v20;
  uint64_t v22 = 0x2020000000;
  uint64_t v23 = 0x7FFFFFFFFFFFFFFFLL;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_100124C68;
  v16[3] = &unk_10062A7A0;
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  id v17 = v6;
  double v18 = &v20;
  double v19 = &v24;
  [v5 enumerateObjectsUsingBlock:v16];
  if (![v6 count]
    || [(ICBrowseAttachmentsCollectionController *)self attachmentSection] == 7)
  {
    goto LABEL_16;
  }
  id v7 = [ICBrowseAttachmentsSectionInfo alloc];
  uint64_t v8 = v25[3];
  if (v8 == 0x7FFFFFFFFFFFFFFFLL)
  {
    double v9 = 0;
  }
  else
  {
    double v9 = [v5 objectAtIndexedSubscript:v25[3]];
    if (v25[3] != 0x7FFFFFFFFFFFFFFFLL)
    {
      int v11 = 0;
      double v10 = 0;
      goto LABEL_8;
    }
  }
  double v10 = [&off_10064B438 stringValue];
  int v11 = 1;
LABEL_8:
  double v12 = +[NSSortDescriptor sortDescriptorWithKey:@"modificationDate" ascending:0];
  uint64_t v28 = v12;
  id v13 = +[NSArray arrayWithObjects:&v28 count:1];
  double v14 = [(ICBrowseAttachmentsSectionInfo *)v7 initWithSectionInfo:v9 name:v10 additionalObjects:v6 sortDescriptors:v13];

  if (v11) {
  if (v8 != 0x7FFFFFFFFFFFFFFFLL)
  }

  if (v25[3] == 0x7FFFFFFFFFFFFFFFLL) {
    [v5 addObject:v14];
  }
  else {
    [v5 setObject:v14 atIndexedSubscript:];
  }

LABEL_16:
  if ([(ICBrowseAttachmentsCollectionController *)self attachmentSection] == 6
    && v21[3] != 0x7FFFFFFFFFFFFFFFLL)
  {
    [v5 removeObjectAtIndex:];
  }
  [v5 sortUsingComparator:&stru_10062A7E0];
  id v15 = [v5 copy];
  [(ICBrowseAttachmentsCollectionController *)self setSortedSections:v15];

  _Block_object_dispose(&v20, 8);
  _Block_object_dispose(&v24, 8);
}

- (void)controllerDidChangeContent:(id)a3
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100125014;
  block[3] = &unk_100625AF0;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)notesContextRefreshNotification:(id)a3
{
  id v3 = [(ICBrowseAttachmentsCollectionController *)self fetchedResultsController];
  [v3 performFetch:0];
}

- (void)accountsWillChange
{
  [(ICBrowseAttachmentsCollectionController *)self setUpdatingAccounts:1];
  id v3 = [(ICBrowseAttachmentsCollectionController *)self view];
  [v3 setUserInteractionEnabled:0];

  unint64_t v4 = [(ICBrowseAttachmentsCollectionController *)self collectionView];
  [v4 reloadData];

  id v5 = [(ICBrowseAttachmentsCollectionController *)self collectionViewLayout];
  [v5 invalidateLayout];

  [(ICBrowseAttachmentsCollectionController *)self updateEmptyView];
}

- (void)accountsDidChange
{
  [(ICBrowseAttachmentsCollectionController *)self setUpdatingAccounts:0];
  id v3 = [(ICBrowseAttachmentsCollectionController *)self view];
  [v3 setUserInteractionEnabled:1];

  unint64_t v4 = [(ICBrowseAttachmentsCollectionController *)self fetchedResultsController];
  [v4 performFetch:0];

  [(ICBrowseAttachmentsCollectionController *)self sortFetchedResultsSections];
  id v5 = [(ICBrowseAttachmentsCollectionController *)self collectionView];
  [v5 reloadData];

  id v6 = [(ICBrowseAttachmentsCollectionController *)self collectionViewLayout];
  [v6 invalidateLayout];

  [(ICBrowseAttachmentsCollectionController *)self updateEmptyView];
}

- (id)viewControllerForAttachmentSection:(signed __int16)a3
{
  uint64_t v3 = a3;
  unsigned int v4 = -[ICBrowseAttachmentsCollectionController useImagesAndMoviesScrollViewForSection:](self, "useImagesAndMoviesScrollViewForSection:");
  id v5 = &off_100621900;
  if (!v4) {
    id v5 = &off_100621738;
  }
  id v6 = [objc_alloc(*v5) initWithAttachmentSection:v3];

  return v6;
}

- (void)showAllForAttachmentSection:(signed __int16)a3
{
  uint64_t v3 = a3;
  -[ICBrowseAttachmentsCollectionController viewControllerForAttachmentSection:](self, "viewControllerForAttachmentSection:");
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  id v5 = [(ICBrowseAttachmentsCollectionController *)self titleForAttachmentSection:v3];
  id v6 = [v9 navigationItem];
  [v6 setTitle:v5];

  id v7 = [(ICBrowseAttachmentsCollectionController *)self navigationController];
  [v7 showViewController:v9 sender:self];

  uint64_t v8 = [(ICBrowseAttachmentsCollectionController *)self eventReporter];
  [v8 submitAttachmentBrowserActionEventForType:2];
}

- (BOOL)browseAttachmentsCell:(id)a3 didSelectAttachment:(id)a4
{
  id v5 = a4;
  id v6 = [(ICBrowseAttachmentsCollectionController *)self collectionView];
  [(ICBrowseAttachmentsCollectionController *)self browseAttachmentsCollectionView:v6 didSelectAttachment:v5 indexPath:0];

  return 1;
}

- (void)browseAttachmentsCell:(id)a3 shouldShareAttachment:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(ICBrowseAttachmentsCollectionController *)self collectionView];
  [(ICBrowseAttachmentsCollectionController *)self browseAttachmentsCollectionView:v8 cell:v7 shouldShareAttachment:v6];
}

- (void)browseAttachmentsCell:(id)a3 shouldInspectAttachment:(id)a4
{
  id v5 = a4;
  id v6 = [(ICBrowseAttachmentsCollectionController *)self collectionView];
  [(ICBrowseAttachmentsCollectionController *)self browseAttachmentsCollectionView:v6 shouldInspectAttachment:v5];
}

- (void)browseAttachmentsCollectionView:(id)a3 didSelectAttachment:(id)a4 indexPath:(id)a5
{
  id v7 = a4;
  [(ICBrowseAttachmentsCollectionController *)self setSelectedIndexPath:a5];
  id v8 = [(ICBrowseAttachmentsCollectionController *)self attachmentsToPreviewWhenSelectingAttachment:v7];
  id v9 = [v8 indexOfObject:v7];
  if (v9 == (id)0x7FFFFFFFFFFFFFFFLL)
  {
    double v10 = os_log_create("com.apple.notes", "UI");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      int v11 = [v7 shortLoggingDescription];
      *(_DWORD *)buf = 138412290;
      double v18 = v11;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "Could not find attachment %@ in list of attachments in attachment browser. Falling back to single attachment", buf, 0xCu);
    }
    id v16 = v7;
    uint64_t v12 = +[NSArray arrayWithObjects:&v16 count:1];

    id v13 = 0;
    id v8 = (void *)v12;
  }
  else
  {
    id v13 = v9;
  }
  double v14 = [(ICBrowseAttachmentsCollectionController *)self eventReporter];
  [v14 submitAttachmentBrowserActionEventForType:4];

  id v15 = [(ICBrowseAttachmentsCollectionController *)self ic_viewControllerManager];
  [v15 presentAttachments:v8 startingAtIndex:v13 delegate:self displayShowInNote:1 editable:0 selectedSubAttachment:0 presentingViewController:self];
}

- (void)browseAttachmentsCollectionView:(id)a3 cell:(id)a4 shouldShareAttachment:(id)a5
{
  id v7 = a4;
  id v9 = +[ICAttachmentActivityViewController makeWithAttachment:a5 quickLookItemDelegate:0 completion:0];
  id v8 = [v9 popoverPresentationController];
  [v8 setSourceView:v7];

  [(ICBrowseAttachmentsCollectionController *)self presentViewController:v9 animated:1 completion:0];
}

- (void)browseAttachmentsCollectionView:(id)a3 shouldInspectAttachment:(id)a4
{
  id v5 = a4;
  id v7 = [[ICAttachmentInspectorViewController alloc] initWithAttachment:v5];

  id v6 = [(ICAttachmentInspectorViewController *)v7 ic_embedInNavigationControllerForModalPresentation];
  [(ICBrowseAttachmentsCollectionController *)self presentViewController:v6 animated:1 completion:0];
}

- (id)attachmentPresenter:(id)a3 transitionViewForAttachment:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(ICBrowseAttachmentsCollectionController *)self selectedIndexPath];

  if (v8)
  {
    id v9 = [(ICBrowseAttachmentsCollectionController *)self selectedIndexPath];
  }
  else
  {
    double v10 = [(ICBrowseAttachmentsCollectionController *)self fetchedResultsController];
    int v11 = [v10 indexPathForObject:v7];

    id v9 = [(ICBrowseAttachmentsCollectionController *)self collectionViewIndexPathFromFetchedResultsControllerIndexPath:v11];
    if (!v9) {
      id v9 = v11;
    }
  }
  if ((uint64_t)[v9 item] >= 1
    && ([(ICBrowseAttachmentsCollectionController *)self collectionView],
        uint64_t v12 = objc_claimAutoreleasedReturnValue(),
        id v13 = objc_msgSend(v12, "numberOfItemsInSection:", objc_msgSend(v9, "section")),
        v12,
        v13 == (id)1))
  {
    double v14 = +[NSIndexPath indexPathForItem:inSection:](NSIndexPath, "indexPathForItem:inSection:", 0, [v9 section]);
    id v15 = [(ICBrowseAttachmentsCollectionController *)self collectionView];
    id v16 = [v15 cellForItemAtIndexPath:v14];
  }
  else
  {
    double v14 = [(ICBrowseAttachmentsCollectionController *)self collectionView];
    id v16 = [v14 cellForItemAtIndexPath:v9];
  }

  id v17 = [v16 contentView];
  double v18 = [v17 subviews];
  double v19 = [v18 firstObject];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v20 = [v19 attachmentPresenter:v6 transitionViewForAttachment:v7];
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      objc_opt_class();
      double v21 = ICDynamicCast();
      uint64_t v22 = [v21 attachmentBrickView];
      uint64_t v23 = [v22 quickLookTransitionView];

      goto LABEL_16;
    }
    uint64_t v20 = [(ICBrowseAttachmentsCollectionController *)self view];
  }
  uint64_t v23 = (void *)v20;
LABEL_16:

  return v23;
}

- (BOOL)isAttachmentBrowser
{
  return 1;
}

- (id)contextMenuInteraction:(id)a3 configurationForMenuAtLocation:(CGPoint)a4
{
  id v5 = a3;
  id v6 = [(ICBrowseAttachmentsCollectionController *)self collectionView];
  id v7 = [(ICBrowseAttachmentsCollectionController *)self collectionView];
  [v5 locationInView:v7];
  double v9 = v8;
  double v11 = v10;

  uint64_t v12 = [v6 ic_cellAtLocation:v9, v11];

  if (v12 && [v12 conformsToProtocol:&OBJC_PROTOCOL___ICNotePreviewingActions])
  {
    id v13 = v12;
    objc_opt_class();
    double v14 = ICDynamicCast();
    id v15 = [v14 attachment];
    if ([v15 attachmentType] == 11)
    {
      objc_opt_class();
      id v16 = [v15 attachmentModel];
      id v17 = ICDynamicCast();

      if (v17)
      {
        uint64_t v18 = [v17 firstSubAttachment];

        id v15 = (void *)v18;
      }
    }
    if (v15)
    {
      double v19 = [(ICBrowseAttachmentsCollectionController *)self ic_viewControllerManager];
      id v31 = v15;
      uint64_t v20 = +[NSArray arrayWithObjects:&v31 count:1];
      double v21 = +[ICAttachmentPresenter previewViewControllerWithViewControllerManager:v19 attachments:v20 startingAtIndex:0 delegate:0 editable:0 isFromAttachmentBrowser:1];
    }
    else
    {
      double v21 = 0;
    }
    v29[0] = _NSConcreteStackBlock;
    v29[1] = 3221225472;
    v29[2] = sub_100125CA4;
    v29[3] = &unk_100629760;
    id v30 = v21;
    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472;
    v26[2] = sub_100125CAC;
    v26[3] = &unk_10062A808;
    id v27 = v13;
    uint64_t v28 = self;
    id v23 = v13;
    id v24 = v21;
    uint64_t v22 = +[UIContextMenuConfiguration configurationWithIdentifier:0 previewProvider:v29 actionProvider:v26];
  }
  else
  {
    uint64_t v22 = 0;
  }

  return v22;
}

- (id)contextMenuInteraction:(id)a3 configuration:(id)a4 highlightPreviewForItemWithIdentifier:(id)a5
{
  id v6 = a3;
  id v7 = [(ICBrowseAttachmentsCollectionController *)self collectionView];
  double v8 = [(ICBrowseAttachmentsCollectionController *)self collectionView];
  [v6 locationInView:v8];
  double v10 = v9;
  double v12 = v11;

  id v13 = [v7 ic_cellAtLocation:v10, v12];

  double v14 = [v13 contentView];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_opt_class();
    id v15 = ICDynamicCast();
    uint64_t v16 = [v15 attachmentBrickView];

    double v14 = (void *)v16;
  }
  if (v14) {
    id v17 = [objc_alloc((Class)UITargetedPreview) initWithView:v14];
  }
  else {
    id v17 = 0;
  }

  return v17;
}

- (void)contextMenuInteraction:(id)a3 willPerformPreviewActionForMenuWithConfiguration:(id)a4 animator:(id)a5
{
  id v7 = a5;
  id v8 = a3;
  double v9 = [(ICBrowseAttachmentsCollectionController *)self collectionView];
  double v10 = [(ICBrowseAttachmentsCollectionController *)self collectionView];
  [v8 locationInView:v10];
  double v12 = v11;
  double v14 = v13;

  id v15 = [v9 indexPathForItemAtPoint:v12, v14];

  uint64_t v16 = [(ICBrowseAttachmentsCollectionController *)self attachmentAtIndexPath:v15];
  [v7 setPreferredCommitStyle:1];
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_100125FD4;
  v19[3] = &unk_100625A00;
  v19[4] = self;
  id v20 = v16;
  id v21 = v15;
  id v17 = v15;
  id v18 = v16;
  [v7 addCompletion:v19];
}

- (void)performCmd3:(id)a3
{
}

- (id)collectionViewIndexPathFromFetchedResultsControllerIndexPath:(id)a3
{
  id v4 = a3;
  id v5 = [(ICBrowseAttachmentsCollectionController *)self fetchedResultsController];
  id v6 = [v5 sections];
  id v7 = [v6 objectAtIndexedSubscript:[v4 section]];

  id v8 = [(ICBrowseAttachmentsCollectionController *)self sortedSections];
  id v9 = [v8 count];

  if (v9)
  {
    unint64_t v10 = 0;
    while (1)
    {
      double v11 = [(ICBrowseAttachmentsCollectionController *)self sortedSections];
      double v12 = [v11 objectAtIndexedSubscript:v10];

      double v13 = [v12 name];
      double v14 = [v7 name];
      unsigned int v15 = [v13 isEqual:v14];

      if (v15) {
        break;
      }

      ++v10;
      uint64_t v16 = [(ICBrowseAttachmentsCollectionController *)self sortedSections];
      id v17 = [v16 count];

      if (v10 >= (unint64_t)v17) {
        goto LABEL_5;
      }
    }
    id v18 = +[NSIndexPath indexPathForItem:inSection:](NSIndexPath, "indexPathForItem:inSection:", [v4 item], v10);
  }
  else
  {
LABEL_5:
    id v18 = 0;
  }

  return v18;
}

- (int64_t)numberOfItemsToDisplayInSection:(int64_t)a3 withTraitCollection:(id)a4
{
  id v6 = a4;
  id v7 = [(ICBrowseAttachmentsCollectionController *)self sortedSections];
  id v8 = [v7 objectAtIndexedSubscript:a3];

  id v9 = [v8 name];
  signed __int16 v10 = (unsigned __int16)[v9 intValue];

  if ([(ICBrowseAttachmentsCollectionController *)self useImagesAndMoviesScrollViewForSection:v10])
  {
    int64_t v11 = 1;
  }
  else
  {
    int64_t v11 = (int64_t)[v8 numberOfObjects];
    if ([(ICBrowseAttachmentsCollectionController *)self displayAllSections])
    {
      id v12 = [v6 horizontalSizeClass];
      id v13 = [v6 verticalSizeClass];
      uint64_t v14 = 6;
      if (v11 < 6) {
        uint64_t v14 = v11;
      }
      uint64_t v15 = 4;
      if (v11 < 4) {
        uint64_t v15 = v11;
      }
      if (v13 == (id)1) {
        uint64_t v14 = v15;
      }
      uint64_t v16 = 3;
      if (v11 == 4) {
        uint64_t v16 = 4;
      }
      if (v11 < 4) {
        uint64_t v16 = v11;
      }
      if (v12 == (id)1) {
        int64_t v11 = v16;
      }
      else {
        int64_t v11 = v14;
      }
    }
  }

  return v11;
}

- (id)titleForAttachmentSection:(signed __int16)a3
{
  uint64_t v3 = 0;
  switch(a3)
  {
    case 1:
      id v4 = +[NSBundle mainBundle];
      id v5 = v4;
      CFStringRef v6 = @"Photos and Videos";
      goto LABEL_8;
    case 3:
      id v4 = +[NSBundle mainBundle];
      id v5 = v4;
      CFStringRef v6 = @"Maps";
      goto LABEL_8;
    case 4:
      id v4 = +[NSBundle mainBundle];
      id v5 = v4;
      CFStringRef v6 = @"Websites";
      goto LABEL_8;
    case 5:
      id v4 = +[NSBundle mainBundle];
      id v5 = v4;
      CFStringRef v6 = @"Audio";
      goto LABEL_8;
    case 6:
      id v4 = +[NSBundle mainBundle];
      id v5 = v4;
      CFStringRef v6 = @"Documents";
      goto LABEL_8;
    case 7:
      id v4 = +[NSBundle mainBundle];
      id v5 = v4;
      CFStringRef v6 = @"Scans";
LABEL_8:
      uint64_t v3 = [v4 localizedStringForKey:v6 value:&stru_10063F3D8 table:0];

      break;
    default:
      break;
  }

  return v3;
}

- (void)contentSizeCategoryDidChange
{
  self->_brickCellSize = CGSizeZero;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v3 = [(ICBrowseAttachmentsCollectionController *)self collectionView];
  id v4 = [v3 _visibleSupplementaryViewsOfKind:UICollectionElementKindSectionHeader];

  id v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      id v8 = 0;
      do
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = *(void **)(*((void *)&v11 + 1) + 8 * (void)v8);
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          [v9 contentSizeCategoryDidChange];
        }
        id v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }

  signed __int16 v10 = [(ICBrowseAttachmentsCollectionController *)self collectionViewLayout];
  [v10 invalidateLayout];

  [(ICBrowseAttachmentsCollectionController *)self updateEmptyViewFonts];
}

- (void)updateHeaderViewMargins
{
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v3 = [(ICBrowseAttachmentsCollectionController *)self collectionView];
  id v4 = [v3 _visibleSupplementaryViewsOfKind:UICollectionElementKindSectionHeader];

  id v5 = (char *)[v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v15;
    do
    {
      id v8 = 0;
      do
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v4);
        }
        objc_opt_class();
        id v9 = ICDynamicCast();
        if (v9)
        {
          signed __int16 v10 = [(ICBrowseAttachmentsCollectionController *)self view];
          [v10 directionalLayoutMargins];
          [v9 setLeadingMargin:v11];

          long long v12 = [(ICBrowseAttachmentsCollectionController *)self view];
          [v12 directionalLayoutMargins];
          [v9 setTrailingMargin:v13];
        }
        ++v8;
      }
      while (v6 != v8);
      id v6 = (char *)[v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v6);
  }
}

- (void)updateImagesAndMoviesScrollViewContentInset
{
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  uint64_t v3 = [(ICBrowseAttachmentsCollectionController *)self collectionView];
  id v4 = [v3 indexPathsForVisibleItems];

  id v5 = [v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v17;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v17 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v16 + 1) + 8 * i);
        if ([(ICBrowseAttachmentsCollectionController *)self useImagesAndMoviesScrollViewAtIndexPath:v9])
        {
          signed __int16 v10 = [(ICBrowseAttachmentsCollectionController *)self collectionView];
          double v11 = [v10 cellForItemAtIndexPath:v9];

          objc_opt_class();
          long long v12 = [v11 contentView];
          double v13 = [v12 subviews];
          long long v14 = [v13 firstObject];
          long long v15 = ICCheckedDynamicCast();

          [(ICBrowseAttachmentsCollectionController *)self adjustContentInsetOfImageScroller:v15];
        }
      }
      id v6 = [v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v6);
  }
}

- (id)emptyTextForAttachmentSection:(signed __int16)a3
{
  switch(a3)
  {
    case 0:
      id v4 = +[NSBundle mainBundle];
      id v5 = v4;
      CFStringRef v6 = @"Photos, maps, and other items added to your notes appear here.";
      goto LABEL_10;
    case 1:
      id v4 = +[NSBundle mainBundle];
      id v5 = v4;
      CFStringRef v6 = @"Photos and videos added to your notes appear here.";
      goto LABEL_10;
    case 2:
      id v4 = +[NSBundle mainBundle];
      id v5 = v4;
      CFStringRef v6 = @"Drawings added to your notes appear here.";
      goto LABEL_10;
    case 3:
      id v4 = +[NSBundle mainBundle];
      id v5 = v4;
      CFStringRef v6 = @"Map attachments added to your notes appear here.";
      goto LABEL_10;
    case 4:
      id v4 = +[NSBundle mainBundle];
      id v5 = v4;
      CFStringRef v6 = @"Websites added to your notes appear here.";
      goto LABEL_10;
    case 5:
      id v4 = +[NSBundle mainBundle];
      id v5 = v4;
      CFStringRef v6 = @"Audio files added to your notes appear here.";
      goto LABEL_10;
    case 6:
      id v4 = +[NSBundle mainBundle];
      id v5 = v4;
      CFStringRef v6 = @"Documents added to your notes appear here.";
      goto LABEL_10;
    case 7:
      id v4 = +[NSBundle mainBundle];
      id v5 = v4;
      CFStringRef v6 = @"Scans added to your notes appear here.";
LABEL_10:
      uint64_t v3 = [v4 localizedStringForKey:v6 value:&stru_10063F3D8 table:0];

      break;
    default:
      break;
  }

  return v3;
}

- (void)updateEmptyView
{
  uint64_t v3 = [(ICBrowseAttachmentsCollectionController *)self collectionView];
  int64_t v4 = [(ICBrowseAttachmentsCollectionController *)self numberOfSectionsInCollectionView:v3];

  id v5 = [(ICBrowseAttachmentsCollectionController *)self emptyView];
  id v26 = v5;
  if (v4)
  {
    [v5 removeFromSuperview];
  }
  else
  {

    if (!v26)
    {
      CFStringRef v6 = +[NSBundle bundleForClass:objc_opt_class()];
      uint64_t v7 = +[UINib nibWithNibName:@"ICBrowseAttachmentsEmpty" bundle:v6];

      id v8 = [v7 instantiateWithOwner:self options:0];
      uint64_t v9 = [(ICBrowseAttachmentsCollectionController *)self emptyView];
      [v9 setTranslatesAutoresizingMaskIntoConstraints:0];
    }
    id v10 = objc_alloc_init((Class)NSMutableParagraphStyle);
    [v10 setLineSpacing:2.0];
    [v10 setParagraphSpacing:2.0];
    [v10 setAlignment:1];
    NSAttributedStringKey v29 = NSParagraphStyleAttributeName;
    id v30 = v10;
    double v11 = +[NSDictionary dictionaryWithObjects:&v30 forKeys:&v29 count:1];
    id v12 = objc_alloc((Class)NSAttributedString);
    double v13 = [(ICBrowseAttachmentsCollectionController *)self emptyTextForAttachmentSection:[(ICBrowseAttachmentsCollectionController *)self attachmentSection]];
    id v14 = [v12 initWithString:v13 attributes:v11];
    long long v15 = [(ICBrowseAttachmentsCollectionController *)self emptyDetailsLabel];
    [v15 setAttributedText:v14];

    long long v16 = [(ICBrowseAttachmentsCollectionController *)self emptyView];
    long long v17 = [v16 superview];

    if (!v17)
    {
      long long v18 = [(ICBrowseAttachmentsCollectionController *)self view];
      long long v19 = [(ICBrowseAttachmentsCollectionController *)self emptyView];
      [v18 addSubview:v19];

      CFStringRef v27 = @"emptyView";
      id v20 = [(ICBrowseAttachmentsCollectionController *)self emptyView];
      uint64_t v28 = v20;
      id v21 = +[NSDictionary dictionaryWithObjects:&v28 forKeys:&v27 count:1];

      uint64_t v22 = [(ICBrowseAttachmentsCollectionController *)self view];
      id v23 = +[NSLayoutConstraint constraintsWithVisualFormat:@"|[emptyView]|" options:0 metrics:0 views:v21];
      [v22 addConstraints:v23];

      id v24 = [(ICBrowseAttachmentsCollectionController *)self view];
      double v25 = +[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[emptyView]|" options:0 metrics:0 views:v21];
      [v24 addConstraints:v25];
    }
    [(ICBrowseAttachmentsCollectionController *)self updateEmptyViewFonts];
  }
}

- (id)attachmentsToPreviewWhenSelectingAttachment:(id)a3
{
  id v4 = a3;
  id v5 = [(ICBrowseAttachmentsCollectionController *)self fetchedResultsController];
  CFStringRef v6 = [v5 indexPathForObject:v4];

  id v7 = [(ICBrowseAttachmentsCollectionController *)self collectionViewIndexPathFromFetchedResultsControllerIndexPath:v6];
  if (!v7) {
    id v7 = v6;
  }
  id v8 = +[NSIndexPath indexPathForItem:inSection:](NSIndexPath, "indexPathForItem:inSection:", 0, [v7 section]);
  uint64_t v9 = [(ICBrowseAttachmentsCollectionController *)self collectionView];
  id v10 = [v9 cellForItemAtIndexPath:v8];

  double v11 = [v10 contentView];
  id v12 = [v11 subviews];
  double v13 = [v12 firstObject];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v14 = [v13 attachments];
  }
  else
  {
    long long v15 = [(ICBrowseAttachmentsCollectionController *)self fetchedResultsController];
    long long v16 = [v15 sections];
    long long v17 = objc_msgSend(v16, "objectAtIndexedSubscript:", objc_msgSend(v7, "section"));

    id v14 = [v17 objects];
  }

  return v14;
}

- (double)leadingMargin
{
  v2 = [(ICBrowseAttachmentsCollectionController *)self view];
  [v2 directionalLayoutMargins];
  double v4 = v3;

  return v4;
}

- (double)trailingMargin
{
  v2 = [(ICBrowseAttachmentsCollectionController *)self view];
  [v2 directionalLayoutMargins];
  double v4 = v3;

  return v4;
}

- (void)adjustContentInsetOfImageScroller:(id)a3
{
  id v32 = a3;
  double v4 = +[UIApplication sharedApplication];
  id v5 = [v4 userInterfaceLayoutDirection];

  CFStringRef v6 = [v32 collectionView];
  [v6 contentInset];
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;

  long long v15 = [v32 collectionView];
  [v15 contentOffset];
  double v17 = v16;
  double v19 = v18;

  double v20 = -v17;
  if (v5 == (id)1) {
    double v21 = v14;
  }
  else {
    double v21 = v10;
  }
  BOOL v22 = v21 == v20 || vabdd_f64(v20, v21) < fabs(v21 * 0.000000999999997);
  if (v5 == (id)1)
  {
    [(ICBrowseAttachmentsCollectionController *)self trailingMargin];
    double v24 = v23;
    [(ICBrowseAttachmentsCollectionController *)self leadingMargin];
    double v26 = v25;
    double v27 = v25;
  }
  else
  {
    [(ICBrowseAttachmentsCollectionController *)self leadingMargin];
    double v24 = v28;
    [(ICBrowseAttachmentsCollectionController *)self trailingMargin];
    double v27 = v29;
    double v26 = v24;
  }
  id v30 = [v32 collectionView];
  [v30 setContentInset:v8, v24, v12, v27];

  if (v22)
  {
    id v31 = [v32 collectionView];
    [v31 setContentOffset:-v26 v19];
  }
}

- (void)icaxDismissAttachmentBrowser
{
}

- (void)applyAccessibilityInfo
{
  id v3 = [(ICBrowseAttachmentsCollectionController *)self noAttachmentsLabel];
  unint64_t v2 = (unint64_t)[v3 accessibilityTraits];
  [v3 setAccessibilityTraits:UIAccessibilityTraitHeader | v2];
}

- (double)estimatedHeightForAXLargerTextSizesForSection:(unint64_t)a3
{
  id v5 = [(ICBrowseAttachmentsCollectionController *)self sortedSections];
  CFStringRef v6 = [v5 objectAtIndexedSubscript:a3];

  double v7 = [v6 name];
  signed __int16 v8 = (unsigned __int16)[v7 intValue];

  double v9 = [(ICBrowseAttachmentsCollectionController *)self titleForAttachmentSection:v8];
  double v10 = +[UIFont ic_attachmentBrowserTitleFont];
  if (UIAccessibilityIsBoldTextEnabled())
  {
    [v10 pointSize];
    *(float *)&double v11 = v11 * 1.1;
    double v12 = +[UIFont systemFontOfSize:roundf(*(float *)&v11) weight:UIFontWeightHeavy];
    uint64_t v13 = [v12 ic_fontWithSingleLineA];

    double v10 = (void *)v13;
  }
  double v14 = [(ICBrowseAttachmentsCollectionController *)self view];
  [v14 frame];
  double v16 = v15;
  NSAttributedStringKey v21 = NSFontAttributeName;
  BOOL v22 = v10;
  double v17 = +[NSDictionary dictionaryWithObjects:&v22 forKeys:&v21 count:1];
  [v9 boundingRectWithSize:3 options:v17 attributes:0 context:1.79769313e308];
  double v19 = v18;

  return v19;
}

- (void)updateEmptyViewFonts
{
  id v3 = [(ICBrowseAttachmentsCollectionController *)self emptyView];

  if (v3)
  {
    double v4 = +[UIFont ic_preferredFontForTextStyle:UIFontTextStyleBody adjustedForDefaultSize:28.0 maxSize:53.0];
    id v5 = [(ICBrowseAttachmentsCollectionController *)self noAttachmentsLabel];
    [v5 setFont:v4];

    CFStringRef v6 = +[UIFont ic_preferredFontForTextStyle:UIFontTextStyleBody adjustedForDefaultSize:17.0 maxSize:44.0];
    double v7 = [(ICBrowseAttachmentsCollectionController *)self emptyDetailsLabel];
    [v7 setFont:v6];

    signed __int16 v8 = [(ICBrowseAttachmentsCollectionController *)self noAttachmentsLabel];
    double v9 = [v8 font];
    double v10 = [(ICBrowseAttachmentsCollectionController *)self emptyDetailsLabel];
    double v11 = [v10 font];
    NSLog(@"Setting fonts:\n\t%@\n\t%@", v9, v11);

    id v16 = +[UIColor colorWithWhite:0.6 alpha:1.0];
    if (ICAccessibilityAccessibilityLargerTextSizesEnabled())
    {
      double v12 = +[UIColor ic_darkerAccessibilityColorForColor:v16];
      uint64_t v13 = [(ICBrowseAttachmentsCollectionController *)self noAttachmentsLabel];
      [v13 setTextColor:v12];

      double v14 = [(ICBrowseAttachmentsCollectionController *)self emptyDetailsLabel];
      [v14 setTextColor:v12];
    }
    else
    {
      double v15 = [(ICBrowseAttachmentsCollectionController *)self noAttachmentsLabel];
      [v15 setTextColor:v16];

      double v12 = [(ICBrowseAttachmentsCollectionController *)self emptyDetailsLabel];
      [v12 setTextColor:v16];
    }
  }
}

- (ICNAEventReporter)eventReporter
{
  if (!self->_eventReporter)
  {
    if (+[ICNAEventReporter isOptedInForAnalytics])
    {
      id v3 = [(ICBrowseAttachmentsCollectionController *)self viewIfLoaded];

      if (v3)
      {
        id v4 = objc_alloc((Class)ICNAEventReporter);
        id v5 = (objc_class *)objc_opt_class();
        CFStringRef v6 = NSStringFromClass(v5);
        double v7 = [(ICBrowseAttachmentsCollectionController *)self view];
        signed __int16 v8 = (ICNAEventReporter *)[v4 initWithSubTrackerName:v6 view:v7];
        eventReporter = self->_eventReporter;
        self->_eventReporter = v8;

        double v10 = +[NSNotificationCenter defaultCenter];
        [v10 addObserver:self selector:"eventReporterLostSession:" name:ICNAEventReporterLostSessionNotification object:self->_eventReporter];
      }
    }
  }
  double v11 = self->_eventReporter;

  return v11;
}

- (void)eventReporterLostSession:(id)a3
{
  eventReporter = self->_eventReporter;
  self->_eventReporter = 0;
  id v5 = a3;

  id v8 = +[NSNotificationCenter defaultCenter];
  uint64_t v6 = ICNAEventReporterLostSessionNotification;
  double v7 = [v5 object];

  [v8 removeObserver:self name:v6 object:v7];
}

- (id)browserDidCloseHandler
{
  return self->_browserDidCloseHandler;
}

- (void)setBrowserDidCloseHandler:(id)a3
{
}

- (UIView)emptyView
{
  return self->_emptyView;
}

- (void)setEmptyView:(id)a3
{
}

- (UILabel)noAttachmentsLabel
{
  return self->_noAttachmentsLabel;
}

- (void)setNoAttachmentsLabel:(id)a3
{
}

- (UILabel)emptyDetailsLabel
{
  return self->_emptyDetailsLabel;
}

- (void)setEmptyDetailsLabel:(id)a3
{
}

- (signed)attachmentSection
{
  return self->_attachmentSection;
}

- (NSFetchedResultsController)fetchedResultsController
{
  return self->_fetchedResultsController;
}

- (void)setFetchedResultsController:(id)a3
{
}

- (BOOL)updatingAccounts
{
  return self->_updatingAccounts;
}

- (void)setUpdatingAccounts:(BOOL)a3
{
  self->_updatingAccounts = a3;
}

- (NSArray)sortedSections
{
  return self->_sortedSections;
}

- (void)setSortedSections:(id)a3
{
}

- (void)setEventReporter:(id)a3
{
}

- (UIContextMenuInteraction)contextInteraction
{
  return self->_contextInteraction;
}

- (void)setContextInteraction:(id)a3
{
}

- (NSIndexPath)selectedIndexPath
{
  return self->_selectedIndexPath;
}

- (void)setSelectedIndexPath:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_selectedIndexPath, 0);
  objc_storeStrong((id *)&self->_contextInteraction, 0);
  objc_storeStrong((id *)&self->_eventReporter, 0);
  objc_storeStrong((id *)&self->_sortedSections, 0);
  objc_storeStrong((id *)&self->_fetchedResultsController, 0);
  objc_storeStrong((id *)&self->_emptyDetailsLabel, 0);
  objc_storeStrong((id *)&self->_noAttachmentsLabel, 0);
  objc_storeStrong((id *)&self->_emptyView, 0);
  objc_storeStrong(&self->_browserDidCloseHandler, 0);
  objc_storeStrong((id *)&self->_segmentedControl, 0);
  objc_storeStrong((id *)&self->_defaultSizingBrickCell, 0);
  objc_storeStrong((id *)&self->_itemChanges, 0);

  objc_storeStrong((id *)&self->_sectionChanges, 0);
}

@end