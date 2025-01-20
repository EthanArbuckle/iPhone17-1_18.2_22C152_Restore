@interface BKBookmarkThumbnailDirectory
- (id)_noBookmarksView;
- (id)fetchedResultsController;
- (id)locationAtIndex:(unint64_t)a3;
- (int64_t)leftPageNumberAtIndex:(unint64_t)a3;
- (int64_t)numberOfCellsInGridView:(id)a3;
- (int64_t)pageNumberForCellIndex:(unint64_t)a3;
- (int64_t)rightPageNumberAtIndex:(unint64_t)a3;
- (unint64_t)indexForLocation:(id)a3;
- (void)configureCell:(id)a3 atIndex:(unint64_t)a4;
- (void)dealloc;
- (void)releaseViews;
- (void)reloadData;
@end

@implementation BKBookmarkThumbnailDirectory

- (void)releaseViews
{
  v4.receiver = self;
  v4.super_class = (Class)BKBookmarkThumbnailDirectory;
  [(BKThumbnailDirectory *)&v4 releaseViews];
  noBookmarksView = self->_noBookmarksView;
  self->_noBookmarksView = 0;
}

- (void)dealloc
{
  [(BKBookmarkThumbnailDirectory *)self releaseViews];
  [(NSFetchedResultsController *)self->_fetchedResultsController setDelegate:0];
  fetchedResultsController = self->_fetchedResultsController;
  self->_fetchedResultsController = 0;

  v4.receiver = self;
  v4.super_class = (Class)BKBookmarkThumbnailDirectory;
  [(BKThumbnailDirectory *)&v4 dealloc];
}

- (id)locationAtIndex:(unint64_t)a3
{
  objc_super v4 = [(BKBookmarkThumbnailDirectory *)self fetchedResultsController];
  v5 = [v4 fetchedObjects];
  v6 = [v5 objectAtIndex:a3];

  v7 = [v6 location];

  return v7;
}

- (unint64_t)indexForLocation:(id)a3
{
  id v4 = a3;
  v5 = [(BKBookmarkThumbnailDirectory *)self fetchedResultsController];
  v6 = [v5 fetchedObjects];

  v7 = [v6 valueForKey:@"location"];
  id v8 = [v7 indexOfObject:v4];

  return (unint64_t)v8;
}

- (int64_t)pageNumberForCellIndex:(unint64_t)a3
{
  id v4 = [(BKBookmarkThumbnailDirectory *)self locationAtIndex:a3];
  int64_t v5 = [(BKDirectoryContent *)self pageNumberForLocation:v4];

  return v5;
}

- (int64_t)leftPageNumberAtIndex:(unint64_t)a3
{
  int64_t v4 = [(BKBookmarkThumbnailDirectory *)self pageNumberForCellIndex:a3];
  if ([(BKViewController *)self layoutDirection])
  {
    if ((v4 & 1) == 0 && v4 > 1) {
      ++v4;
    }
    v6 = [(BKDirectoryContent *)self locationForPageNumber:v4];

    if (v6) {
      return v4;
    }
    else {
      return 0x7FFFFFFFFFFFFFFFLL;
    }
  }
  else if (v4 - ((v4 != 0x7FFFFFFFFFFFFFFFLL) & v4) >= 2)
  {
    return v4 - ((v4 != 0x7FFFFFFFFFFFFFFFLL) & v4);
  }
  else
  {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
}

- (int64_t)rightPageNumberAtIndex:(unint64_t)a3
{
  int64_t v4 = [(BKBookmarkThumbnailDirectory *)self pageNumberForCellIndex:a3];
  if ([(BKViewController *)self layoutDirection])
  {
    if (v4 - ((v4 != 0x7FFFFFFFFFFFFFFFLL) & v4) >= 2) {
      return v4 - ((v4 != 0x7FFFFFFFFFFFFFFFLL) & v4);
    }
    else {
      return 0x7FFFFFFFFFFFFFFFLL;
    }
  }
  else
  {
    if ((v4 & 1) == 0 && v4 > 1) {
      ++v4;
    }
    v7 = [(BKDirectoryContent *)self locationForPageNumber:v4];

    if (v7) {
      return v4;
    }
    else {
      return 0x7FFFFFFFFFFFFFFFLL;
    }
  }
}

- (void)configureCell:(id)a3 atIndex:(unint64_t)a4
{
  id v6 = a3;
  v12.receiver = self;
  v12.super_class = (Class)BKBookmarkThumbnailDirectory;
  [(BKThumbnailDirectory *)&v12 configureCell:v6 atIndex:a4];
  [v6 setHasRibbon:1];
  v7 = [(BKDirectoryContent *)self directoryDelegate];
  char v8 = objc_opt_respondsToSelector();

  if (v8)
  {
    v9 = [(BKDirectoryContent *)self directoryDelegate];
    id v10 = [v9 thumbnailDirectoryWantsPageNumber:self];
    v11 = [v6 pageView];
    [v11 setShowsPageNumber:v10];
  }
}

- (id)fetchedResultsController
{
  fetchedResultsController = self->_fetchedResultsController;
  if (!fetchedResultsController)
  {
    int64_t v4 = [(BKContentViewController *)self book];
    id v5 = objc_alloc_init((Class)NSFetchRequest);
    id v6 = [v4 databaseKey];
    v7 = +[AEAnnotation pageBookmarksPredicate:v6];
    [v5 setPredicate:v7];

    char v8 = [v4 annotationProvider];
    v9 = [v8 uiManagedObjectContext];

    id v10 = +[NSEntityDescription entityForName:@"AEAnnotation" inManagedObjectContext:v9];
    [v5 setEntity:v10];

    id v11 = [objc_alloc((Class)NSSortDescriptor) initWithKey:@"plLocationRangeStart" ascending:1];
    id v12 = [objc_alloc((Class)NSSortDescriptor) initWithKey:@"annotationCreationDate" ascending:1];
    id v13 = [objc_alloc((Class)NSArray) initWithObjects:v11, v12, 0];
    [v5 setSortDescriptors:v13];
    v23 = v4;
    v14 = [v4 databaseKey];
    v15 = +[NSString stringWithFormat:@"%@-bm", v14];

    v16 = (NSFetchedResultsController *)[objc_alloc((Class)IMUbiquitousFetchedResultsController) initWithFetchRequest:v5 managedObjectContext:v9 sectionNameKeyPath:0 cacheName:v15];
    v17 = self->_fetchedResultsController;
    self->_fetchedResultsController = v16;

    [(NSFetchedResultsController *)self->_fetchedResultsController setDelegate:self];
    v18 = self->_fetchedResultsController;
    id v24 = 0;
    unsigned __int8 v19 = [(NSFetchedResultsController *)v18 performFetch:&v24];
    id v20 = v24;
    if ((v19 & 1) == 0)
    {
      v21 = BCIMLog();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
        sub_137E0C((uint64_t)v20, v21);
      }
    }
    fetchedResultsController = self->_fetchedResultsController;
  }

  return fetchedResultsController;
}

- (int64_t)numberOfCellsInGridView:(id)a3
{
  v3 = [(BKBookmarkThumbnailDirectory *)self fetchedResultsController];
  int64_t v4 = [v3 fetchedObjects];
  id v5 = [v4 count];

  return (int64_t)v5;
}

- (id)_noBookmarksView
{
  noBookmarksView = self->_noBookmarksView;
  if (!noBookmarksView)
  {
    int64_t v4 = -[BKTOCBookmarksDescription initWithFrame:]([BKTOCBookmarksDescription alloc], "initWithFrame:", 0.0, 0.0, 320.0, 480.0);
    id v5 = self->_noBookmarksView;
    self->_noBookmarksView = v4;

    id v6 = +[UIColor clearColor];
    [(BKTOCBookmarksDescription *)self->_noBookmarksView setBackgroundColor:v6];

    [(BKTOCBookmarksDescription *)self->_noBookmarksView setAutoresizingMask:18];
    int v7 = isPad();
    double v8 = 27.0;
    if (!v7) {
      double v8 = 17.0;
    }
    v9 = +[UIFont systemFontOfSize:v8];
    id v10 = [(BKTOCBookmarksDescription *)self->_noBookmarksView titleLabel];
    [v10 setFont:v9];

    int v11 = isPad();
    double v12 = 13.0;
    if (v11) {
      double v12 = 17.0;
    }
    id v13 = +[UIFont systemFontOfSize:v12];
    v14 = [(BKTOCBookmarksDescription *)self->_noBookmarksView descriptionLabel];
    [v14 setFont:v13];

    v15 = [(BKTOCBookmarksDescription *)self->_noBookmarksView titleLabel];
    v16 = AEBundle();
    v17 = [v16 localizedStringForKey:@"Adding Bookmarks…" value:&stru_1DF0D8 table:0];
    [v15 setText:v17];

    v18 = +[UIColor bc_booksSecondaryLabelColor];
    [v15 setTextColor:v18];

    unsigned __int8 v19 = [(BKContentViewController *)self book];
    LODWORD(v17) = [v19 contentType];

    id v20 = AEBundle();
    v21 = v20;
    if (v17 == 2) {
      CFStringRef v22 = @"When you’re reading a PDF,\ntap the Bookmark button to\nmark the current page.";
    }
    else {
      CFStringRef v22 = @"When you’re reading a book, tap the Bookmark button to mark the current page.";
    }
    v23 = [v20 localizedStringForKey:v22 value:&stru_1DF0D8 table:0];

    id v24 = [(BKTOCBookmarksDescription *)self->_noBookmarksView descriptionLabel];
    [v24 setText:v23];
    v25 = +[UIColor bc_booksSecondaryLabelColor];
    [v24 setTextColor:v25];

    [v24 setNumberOfLines:0];
    noBookmarksView = self->_noBookmarksView;
  }

  return noBookmarksView;
}

- (void)reloadData
{
  v9.receiver = self;
  v9.super_class = (Class)BKBookmarkThumbnailDirectory;
  [(BKThumbnailDirectory *)&v9 reloadData];
  if ([(BKBookmarkThumbnailDirectory *)self isViewLoaded])
  {
    v3 = [(BKBookmarkThumbnailDirectory *)self fetchedResultsController];
    int64_t v4 = [v3 fetchedObjects];
    id v5 = [v4 count];

    if (v5)
    {
      [(BKTOCBookmarksDescription *)self->_noBookmarksView removeFromSuperview];
      noBookmarksView = self->_noBookmarksView;
      self->_noBookmarksView = 0;
    }
    else
    {
      noBookmarksView = [(BKBookmarkThumbnailDirectory *)self _noBookmarksView];
      int v7 = [(BKBookmarkThumbnailDirectory *)self view];
      [v7 bounds];
      [noBookmarksView setFrame:];

      double v8 = [(BKBookmarkThumbnailDirectory *)self view];
      [v8 addSubview:noBookmarksView];
    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_noBookmarksView, 0);

  objc_storeStrong((id *)&self->_fetchedResultsController, 0);
}

@end