@interface THNotesDetailTableViewController
- (BOOL)areAllNotesSelected;
- (BOOL)inSizeTransition;
- (BOOL)isLastRowInSectionForIndexPath:(id)a3;
- (BOOL)p_isTableViewInEditMode:(id)a3;
- (BOOL)p_sectionHasUnrenderedAnnotations:(id)a3;
- (BOOL)selectAllNotes;
- (BOOL)tableView:(id)a3 canEditRowAtIndexPath:(id)a4;
- (NSMutableDictionary)selectedNotes;
- (THBookViewController)bookViewController;
- (THNotesDetailTableViewController)initWithCoder:(id)a3;
- (THNotesDetailTableViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (THNotesDetailTableViewControllerDelegate)delegate;
- (UITableView)tableView;
- (double)editingHighlightWidthForAnnotationRenderer:(id)a3;
- (double)highlightWidthForAnnotationRenderer:(id)a3;
- (double)tableView:(id)a3 estimatedHeightForRowAtIndexPath:(id)a4;
- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4;
- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4;
- (id)_thTableView:(id)a3 itemsForBeginningDragSession:(id)a4 atIndexPath:(id)a5;
- (id)accessControllerForAnnotationRenderer:(id)a3;
- (id)annotationRenderer:(id)a3 contentNodeForAnnotation:(id)a4;
- (id)annotationRenderer:(id)a3 storageForAnnotationLocation:(id)a4;
- (id)author;
- (id)bookTitle;
- (id)cachedAnnotationForIndexPath:(id)a3;
- (id)p_activityIndicatorCell:(id)a3;
- (id)p_annotationAtIndexPath:(id)a3;
- (id)p_annotationCellForIndexPath:(id)a3 withTableView:(id)a4;
- (id)p_labelWithText:(id)a3 frame:(CGRect)a4 textColor:(id)a5 tag:(int64_t)a6;
- (id)p_makeViewForAnnotationAtIndexPath:(id)a3 cell:(id)a4;
- (id)pageNumberStringForAnnotation:(id)a3;
- (id)sectionTitleForIndexPath:(id)a3;
- (id)storeURL;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 itemsForAddingToDragSession:(id)a4 atIndexPath:(id)a5 point:(CGPoint)a6;
- (id)tableView:(id)a3 itemsForBeginningDragSession:(id)a4 atIndexPath:(id)a5;
- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)p_numberOfRowsInSection:(int64_t)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (unint64_t)countOfItemsToDelete;
- (unint64_t)countOfUserNotesToDelete;
- (unint64_t)maxLinesForAnnotationRenderer:(id)a3;
- (unint64_t)numberOfNotes;
- (unint64_t)p_numberOfRenderedAnnotationsInSection:(id)a3;
- (void)_renderAnnotationsForTheme:(id)a3;
- (void)_traitCollectionDidChange:(id)a3 previousTraitCollection:(id)a4;
- (void)annotationRenderer:(id)a3 didLoadContentNode:(id)a4;
- (void)annotationRenderer:(id)a3 didRenderAnnotation:(id)a4 withResult:(id)a5;
- (void)applicationWillEnterForeground:(id)a3;
- (void)clearAndReloadAnnotations;
- (void)dealloc;
- (void)deleteSelectedNotes;
- (void)deselectAllNotes;
- (void)notesDetailTableViewHeaderView:(id)a3 selected:(BOOL)a4;
- (void)p_cacheCellHeight:(id)a3 annotation:(id)a4;
- (void)p_deleteNotesAtIndexPaths:(id)a3;
- (void)p_notifySelectionDidChange;
- (void)p_reload;
- (void)p_reloadFromBottom;
- (void)paginationController:(id)a3 paginationCompleteStateChangedTo:(BOOL)a4;
- (void)reloadWithSections:(id)a3;
- (void)reloadWithSections:(id)a3 force:(BOOL)a4;
- (void)scrollToTop;
- (void)setBookViewController:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setEditing:(BOOL)a3 animated:(BOOL)a4;
- (void)setInSizeTransition:(BOOL)a3;
- (void)setSelectedNotes:(id)a3;
- (void)setTableView:(id)a3;
- (void)startEditing;
- (void)tableView:(id)a3 didDeselectRowAtIndexPath:(id)a4;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation THNotesDetailTableViewController

- (THNotesDetailTableViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  v10.receiver = self;
  v10.super_class = (Class)THNotesDetailTableViewController;
  v4 = [(THNotesDetailTableViewController *)&v10 initWithNibName:a3 bundle:a4];
  if (v4)
  {
    v5 = [[THNotesViewAnnotationRenderer alloc] initWithDelegate:v4];
    mAnnotationRenderer = v4->mAnnotationRenderer;
    v4->mAnnotationRenderer = v5;

    v7 = +[UITraitCollection bc_allAPITraits];
    id v8 = [(THNotesDetailTableViewController *)v4 registerForTraitChanges:v7 withAction:"_traitCollectionDidChange:previousTraitCollection:"];
  }
  return v4;
}

- (THNotesDetailTableViewController)initWithCoder:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)THNotesDetailTableViewController;
  v3 = [(THNotesDetailTableViewController *)&v7 initWithCoder:a3];
  if (v3)
  {
    v4 = [[THNotesViewAnnotationRenderer alloc] initWithDelegate:v3];
    mAnnotationRenderer = v3->mAnnotationRenderer;
    v3->mAnnotationRenderer = v4;
  }
  return v3;
}

- (void)dealloc
{
  v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self name:UIApplicationWillEnterForegroundNotification object:0];

  id WeakRetained = objc_loadWeakRetained((id *)&self->_tableView);
  [WeakRetained setDragDelegate:0];

  mSections = self->mSections;
  self->mSections = 0;

  mSectionSelections = self->mSectionSelections;
  self->mSectionSelections = 0;

  mSelectedNotes = self->mSelectedNotes;
  self->mSelectedNotes = 0;

  mCellHeights = self->mCellHeights;
  self->mCellHeights = 0;

  mRenderedAnnotations = self->mRenderedAnnotations;
  self->mRenderedAnnotations = 0;

  [(THNotesViewAnnotationRenderer *)self->mAnnotationRenderer setDelegate:0];
  mAnnotationRenderer = self->mAnnotationRenderer;
  self->mAnnotationRenderer = 0;

  mTableCellNIB = self->mTableCellNIB;
  self->mTableCellNIB = 0;

  v12.receiver = self;
  v12.super_class = (Class)THNotesDetailTableViewController;
  [(THNotesDetailTableViewController *)&v12 dealloc];
}

- (void)setBookViewController:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->mBookViewController);

  v5 = obj;
  if (WeakRetained != obj)
  {
    if (obj)
    {
      v6 = [obj documentViewController];
      objc_super v7 = [v6 reflowablePaginationController];
      [v7 registerObserver:self];
    }
    else
    {
      v6 = objc_loadWeakRetained((id *)&self->mBookViewController);
      objc_super v7 = [v6 documentViewController];
      id v8 = [v7 reflowablePaginationController];
      [v8 unregisterObserver:self];
    }
    objc_storeWeak((id *)&self->mBookViewController, obj);
    v5 = obj;
  }
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  v10.receiver = self;
  v10.super_class = (Class)THNotesDetailTableViewController;
  id v7 = a4;
  -[THNotesDetailTableViewController viewWillTransitionToSize:withTransitionCoordinator:](&v10, "viewWillTransitionToSize:withTransitionCoordinator:", v7, width, height);
  [(THNotesDetailTableViewController *)self setInSizeTransition:1];
  v8[4] = self;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10474C;
  v9[3] = &unk_459220;
  v9[4] = self;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_104754;
  v8[3] = &unk_459220;
  [v7 animateAlongsideTransition:v9 completion:v8];
}

- (void)viewDidLayoutSubviews
{
  v8.receiver = self;
  v8.super_class = (Class)THNotesDetailTableViewController;
  [(THNotesDetailTableViewController *)&v8 viewDidLayoutSubviews];
  v3 = [(THNotesDetailTableViewController *)self tableView];
  [v3 frame];
  if (v5 == self->mRenderedAnnotationsSize.width && v4 == self->mRenderedAnnotationsSize.height)
  {
  }
  else
  {
    NSUInteger v7 = [(NSArray *)self->mSections count];

    if (v7) {
      [(THNotesDetailTableViewController *)self clearAndReloadAnnotations];
    }
  }
}

- (void)_traitCollectionDidChange:(id)a3 previousTraitCollection:(id)a4
{
  id v5 = [a4 userInterfaceStyle:a3];
  v6 = [(THNotesDetailTableViewController *)self traitCollection];
  id v7 = [v6 userInterfaceStyle];

  if (v5 != v7)
  {
    [(THNotesDetailTableViewController *)self clearAndReloadAnnotations];
  }
}

- (void)clearAndReloadAnnotations
{
  id v3 = objc_alloc_init((Class)NSMutableArray);
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  double v4 = self->mSections;
  id v5 = [(NSArray *)v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v16;
    do
    {
      objc_super v8 = 0;
      do
      {
        if (*(void *)v16 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = [*(id *)(*((void *)&v15 + 1) + 8 * (void)v8) notes:v15];
        [v3 addObjectsFromArray:v9];

        objc_super v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id v6 = [(NSArray *)v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v6);
  }

  [(TSUNoCopyDictionary *)self->mRenderedAnnotations removeAllObjects];
  [(TSUNoCopyDictionary *)self->mCellHeights removeAllObjects];
  objc_super v10 = [(THNotesDetailTableViewController *)self view];
  v11 = [v10 safeAreaLayoutGuide];
  [v11 layoutFrame];
  self->mRenderedAnnotationsSize.double width = v12;
  self->mRenderedAnnotationsSize.double height = v13;

  if ([v3 count])
  {
    [(THNotesDetailTableViewController *)self _renderAnnotationsForTheme:v3];
    id WeakRetained = objc_loadWeakRetained((id *)&self->mDelegate);
    [WeakRetained tableViewController:self renderingInProgress:1];
  }
  [(THNotesDetailTableViewController *)self p_reload];
}

- (unint64_t)numberOfNotes
{
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v2 = self->mSections;
  id v3 = [(NSArray *)v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v3)
  {
    id v4 = v3;
    unint64_t v5 = 0;
    uint64_t v6 = *(void *)v11;
    do
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v2);
        }
        objc_super v8 = [*(id *)(*((void *)&v10 + 1) + 8 * i) notes];
        v5 += (unint64_t)[v8 count];
      }
      id v4 = [(NSArray *)v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v4);
  }
  else
  {
    unint64_t v5 = 0;
  }

  return v5;
}

- (void)reloadWithSections:(id)a3 force:(BOOL)a4
{
  uint64_t v6 = (NSArray *)a3;
  uint64_t v7 = v6;
  if (a4 || self->mSections != v6 && !-[NSArray isEqualToArray:](v6, "isEqualToArray:"))
  {
    if (self->mSections != v7)
    {
      objc_super v8 = (NSArray *)[(NSArray *)v7 copy];
      mSections = self->mSections;
      self->mSections = v8;
    }
    v28 = v7;
    long long v10 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    mSectionSelections = self->mSectionSelections;
    self->mSectionSelections = v10;

    id v12 = objc_alloc_init((Class)NSMutableArray);
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    long long v13 = self->mSections;
    id v14 = [(NSArray *)v13 countByEnumeratingWithState:&v29 objects:v33 count:16];
    if (v14)
    {
      id v15 = v14;
      uint64_t v16 = *(void *)v30;
      do
      {
        long long v17 = 0;
        do
        {
          if (*(void *)v30 != v16) {
            objc_enumerationMutation(v13);
          }
          long long v18 = [*(id *)(*((void *)&v29 + 1) + 8 * (void)v17) notes];
          [v12 addObjectsFromArray:v18];

          v19 = self->mSectionSelections;
          v20 = +[NSNumber numberWithBool:0];
          [(NSMutableArray *)v19 addObject:v20];

          long long v17 = (char *)v17 + 1;
        }
        while (v15 != v17);
        id v15 = [(NSArray *)v13 countByEnumeratingWithState:&v29 objects:v33 count:16];
      }
      while (v15);
    }

    [(TSUNoCopyDictionary *)self->mRenderedAnnotations tsu_removeObjectsWithoutKeys:v12];
    [(TSUNoCopyDictionary *)self->mCellHeights tsu_removeObjectsWithoutKeys:v12];
    v21 = [(THNotesDetailTableViewController *)self view];
    v22 = [v21 safeAreaLayoutGuide];
    [v22 layoutFrame];
    self->mRenderedAnnotationsSize.double width = v23;
    self->mRenderedAnnotationsSize.double height = v24;

    v25 = [(TSUNoCopyDictionary *)self->mRenderedAnnotations allKeys];
    v26 = [v12 tsu_arrayByRemovingObjectsInArray:v25];

    if ([v26 count])
    {
      [(THNotesDetailTableViewController *)self _renderAnnotationsForTheme:v26];
      id WeakRetained = objc_loadWeakRetained((id *)&self->mDelegate);
      [WeakRetained tableViewController:self renderingInProgress:1];
    }
    [(THNotesDetailTableViewController *)self p_reload];

    uint64_t v7 = v28;
  }
}

- (void)reloadWithSections:(id)a3
{
}

- (void)scrollToTop
{
  id v3 = [(THNotesDetailTableViewController *)self tableView];
  [v3 setContentOffset:CGPointZero];
  mAnnotationRenderer = self->mAnnotationRenderer;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_104ED0;
  v6[3] = &unk_4598E0;
  id v7 = v3;
  id v5 = v3;
  [(THNotesViewAnnotationRenderer *)mAnnotationRenderer waitWithTimeout:v6 forCondition:0.5];
}

- (void)viewDidLoad
{
  v8.receiver = self;
  v8.super_class = (Class)THNotesDetailTableViewController;
  [(THNotesDetailTableViewController *)&v8 viewDidLoad];
  id v3 = [(THNotesDetailTableViewController *)self tableView];
  [v3 setShowsVerticalScrollIndicator:1];
  [v3 setAllowsMultipleSelectionDuringEditing:0];
  [v3 setSeparatorStyle:0];
  id v4 = +[UIColor bc_booksBackground];
  [v3 setBackgroundColor:v4];

  [v3 registerClass:objc_opt_class() forHeaderFooterViewReuseIdentifier:@"notesHeaderCell"];
  [v3 setDragDelegate:self];
  id v5 = +[UIColor bc_booksBackground];
  uint64_t v6 = [(THNotesDetailTableViewController *)self view];
  [v6 setBackgroundColor:v5];

  id v7 = +[NSNotificationCenter defaultCenter];
  [v7 addObserver:self selector:"applicationWillEnterForeground:" name:UIApplicationWillEnterForegroundNotification object:0];
}

- (void)applicationWillEnterForeground:(id)a3
{
  id v9 = [(THNotesDetailTableViewController *)self tableView];
  [v9 contentSize];
  double v5 = v4;
  uint64_t v6 = [(THNotesDetailTableViewController *)self view];
  [v6 frame];
  if (v5 >= v7)
  {
  }
  else
  {
    NSUInteger v8 = [(NSArray *)self->mSections count];

    if (v8 >= 2)
    {
      [(THNotesDetailTableViewController *)self clearAndReloadAnnotations];
    }
  }
}

- (void)setEditing:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  id v13 = [(THNotesDetailTableViewController *)self tableView];
  [v13 setAllowsMultipleSelectionDuringEditing:v5];
  [v13 setEditing:v5 animated:v4];
  if ([(NSMutableArray *)self->mSectionSelections count])
  {
    unint64_t v7 = 0;
    do
    {
      mSectionSelections = self->mSectionSelections;
      id v9 = +[NSNumber numberWithBool:0];
      [(NSMutableArray *)mSectionSelections replaceObjectAtIndex:v7 withObject:v9];

      objc_opt_class();
      long long v10 = [v13 headerViewForSection:v7];
      long long v11 = TSUDynamicCast();

      if (v11) {
        [v11 setEditing:v5];
      }

      ++v7;
    }
    while (v7 < (unint64_t)[(NSMutableArray *)self->mSectionSelections count]);
  }
  mSelectedNotes = self->mSelectedNotes;
  self->mSelectedNotes = 0;
}

- (BOOL)areAllNotesSelected
{
  id v3 = [(THNotesDetailTableViewController *)self tableView];
  BOOL v4 = [v3 indexPathsForSelectedRows];
  uint64_t v5 = [(NSArray *)self->mSections count];
  if (v5 < 1)
  {
    char v8 = 1;
  }
  else
  {
    uint64_t v6 = v5;
    uint64_t v7 = 0;
    char v8 = 1;
    do
    {
      id v9 = [v3 numberOfRowsInSection:v7];
      if ((uint64_t)v9 >= 1)
      {
        id v10 = v9;
        uint64_t v11 = 0;
        while (1)
        {
          id v12 = +[NSIndexPath indexPathForRow:v11 inSection:v7];
          unsigned __int8 v13 = [v4 containsObject:v12];

          if ((v13 & 1) == 0) {
            break;
          }
          if (v10 == (id)++v11) {
            goto LABEL_9;
          }
        }
        char v8 = 0;
      }
LABEL_9:
      ++v7;
    }
    while (v7 != v6);
  }

  return v8 & 1;
}

- (BOOL)selectAllNotes
{
  id v3 = [(THNotesDetailTableViewController *)self tableView];
  NSUInteger v16 = [(NSArray *)self->mSections count];
  char v4 = 0;
  if (v16)
  {
    for (uint64_t i = 0; i != v16; ++i)
    {
      uint64_t v6 = (char *)[v3 numberOfRowsInSection:i];
      if (v6)
      {
        uint64_t v7 = v6;
        for (j = 0; j != v7; ++j)
        {
          id v9 = +[NSIndexPath indexPathForRow:j inSection:i];
          id v10 = [(NSMutableDictionary *)self->mSelectedNotes objectForKey:v9];
          [v3 selectRowAtIndexPath:v9 animated:0 scrollPosition:0];
          if (!v10) {
            [(NSMutableDictionary *)self->mSelectedNotes setObject:v9 forKey:v9];
          }
        }
        mSectionSelections = self->mSectionSelections;
        id v12 = +[NSNumber numberWithBool:1];
        [(NSMutableArray *)mSectionSelections replaceObjectAtIndex:i withObject:v12];

        objc_opt_class();
        unsigned __int8 v13 = [v3 headerViewForSection:i];
        id v14 = TSUDynamicCast();

        if (v14) {
          [v14 setSelected:1];
        }

        char v4 = 1;
      }
    }
  }

  return v4 & 1;
}

- (void)deselectAllNotes
{
  id v18 = [(THNotesDetailTableViewController *)self tableView];
  NSUInteger v3 = [(NSArray *)self->mSections count];
  if (v3)
  {
    NSUInteger v4 = v3;
    for (uint64_t i = 0; i != v4; ++i)
    {
      uint64_t v6 = (char *)[v18 numberOfRowsInSection:i];
      if (v6)
      {
        uint64_t v7 = v6;
        for (j = 0; j != v7; ++j)
        {
          id v9 = +[NSIndexPath indexPathForRow:j inSection:i];
          id v10 = [(NSMutableDictionary *)self->mSelectedNotes objectForKey:v9];
          [v18 deselectRowAtIndexPath:v9 animated:0];
          if (v10) {
            [(NSMutableDictionary *)self->mSelectedNotes removeObjectForKey:v9];
          }
        }
        mSectionSelections = self->mSectionSelections;
        id v12 = +[NSNumber numberWithBool:0];
        [(NSMutableArray *)mSectionSelections replaceObjectAtIndex:i withObject:v12];

        objc_opt_class();
        unsigned __int8 v13 = [v18 headerViewForSection:i];
        id v14 = TSUDynamicCast();

        if (v14) {
          [v14 setSelected:0];
        }
      }
    }
  }
  if ([(THNotesDetailTableViewController *)self countOfItemsToDelete])
  {
    id v15 = +[TSUAssertionHandler currentHandler];
    NSUInteger v16 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THNotesDetailTableViewController deselectAllNotes]");
    long long v17 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THNotesDetailTableViewController.m"];
    [v15 handleFailureInFunction:v16 file:v17 lineNumber:407 description:@"We should note have any more items to delete"];
  }
  [(NSMutableDictionary *)self->mSelectedNotes removeAllObjects];
}

- (BOOL)isLastRowInSectionForIndexPath:(id)a3
{
  id v4 = a3;
  id v5 = [v4 section];
  if (v5 >= (id)[(NSArray *)self->mSections count])
  {
    BOOL v9 = 0;
  }
  else
  {
    uint64_t v6 = -[NSArray objectAtIndex:](self->mSections, "objectAtIndex:", [v4 section]);
    if (v6)
    {
      id v7 = [v4 row];
      char v8 = [v6 notes];
      BOOL v9 = v7 == [v8 count];
    }
    else
    {
      BOOL v9 = 0;
    }
  }
  return v9;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return (int64_t)[(NSArray *)self->mSections count] + 1;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return [(THNotesDetailTableViewController *)self p_numberOfRowsInSection:a4];
}

- (int64_t)p_numberOfRowsInSection:(int64_t)a3
{
  if ([(NSArray *)self->mSections count] == a3) {
    return [(THNotesViewAnnotationRenderer *)self->mAnnotationRenderer doneRendering] ^ 1;
  }
  uint64_t v6 = [(NSArray *)self->mSections objectAtIndex:a3];
  id v7 = [v6 notes];
  if (-[NSIndexPath section](self->mLastInsertedRow, "section") >= a3 && [v7 count])
  {
    if ([(NSIndexPath *)self->mLastInsertedRow section] <= a3)
    {
      id v5 = [(NSIndexPath *)self->mLastInsertedRow row];
    }
    else
    {
      char v8 = [v6 notes];
      id v5 = [v8 count];
    }
  }
  else
  {
    id v5 = 0;
  }

  return (int64_t)v5;
}

- (double)tableView:(id)a3 estimatedHeightForRowAtIndexPath:(id)a4
{
  id v5 = a4;
  id v6 = [v5 section];
  if (v6 != (id)[(NSArray *)self->mSections count])
  {
    id WeakRetained = [(THNotesDetailTableViewController *)self cachedAnnotationForIndexPath:v5];
    id v10 = [(TSUNoCopyDictionary *)self->mCellHeights objectForKey:WeakRetained];
    uint64_t v11 = v10;
    if (v10)
    {
      [v10 floatValue];
      double v7 = v12;
    }
    else
    {
      double v7 = 60.0;
    }

    goto LABEL_8;
  }
  double v7 = 0.0;
  if (![(THNotesViewAnnotationRenderer *)self->mAnnotationRenderer doneRendering])
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->mDelegate);
    [WeakRetained activityIndicatorCellHeight];
    double v7 = v9;
LABEL_8:
  }
  return v7;
}

- (void)p_cacheCellHeight:(id)a3 annotation:(id)a4
{
  id v6 = a4;
  double v7 = [a3 contentView];
  char v8 = [v7 viewWithTag:12];
  id v15 = [v8 viewWithTag:9];

  mCellHeights = self->mCellHeights;
  if (!mCellHeights)
  {
    id v10 = (TSUNoCopyDictionary *)objc_alloc_init((Class)TSUNoCopyDictionary);
    uint64_t v11 = self->mCellHeights;
    self->mCellHeights = v10;

    mCellHeights = self->mCellHeights;
  }
  [v15 frame];
  *(float *)&double v13 = v12;
  id v14 = +[NSNumber numberWithFloat:v13];
  [(TSUNoCopyDictionary *)mCellHeights setObject:v14 forUncopiedKey:v6];
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v7 section];
  if (v8 != (id)[(NSArray *)self->mSections count])
  {
    id WeakRetained = [(THNotesDetailTableViewController *)self cachedAnnotationForIndexPath:v7];
    double v12 = [(TSUNoCopyDictionary *)self->mCellHeights objectForKey:WeakRetained];
    if (!v12)
    {
      double v13 = [(THNotesDetailTableViewController *)self p_annotationCellForIndexPath:v7 withTableView:v6];
      [(THNotesDetailTableViewController *)self p_cacheCellHeight:v13 annotation:WeakRetained];
      double v12 = [(TSUNoCopyDictionary *)self->mCellHeights objectForKey:WeakRetained];
    }
    [v12 floatValue];
    double v9 = v14;

    goto LABEL_7;
  }
  double v9 = 0.0;
  if (![(THNotesViewAnnotationRenderer *)self->mAnnotationRenderer doneRendering])
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->mDelegate);
    [WeakRetained activityIndicatorCellHeight];
    double v9 = v11;
LABEL_7:
  }
  return v9;
}

- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4
{
  double v6 = 0.0;
  if ([(NSArray *)self->mSections count] > a4
    && [(THNotesDetailTableViewController *)self p_numberOfRowsInSection:a4] >= 1)
  {
    id v7 = [(NSArray *)self->mSections objectAtIndex:a4];
    id v8 = [v7 chapterTitle];

    if (v8)
    {
      p_mDelegate = &self->mDelegate;
      id WeakRetained = objc_loadWeakRetained((id *)&self->mDelegate);
      [WeakRetained chapterTitleHeightForAllChapters];
      double v12 = v11;
      id v13 = objc_loadWeakRetained((id *)p_mDelegate);
      [v13 sectionTitleHeightForAllChapters];
      double v6 = v12 + v14;
    }
    else
    {
      id v15 = [v7 title];

      if (!v15)
      {
LABEL_8:

        return v6;
      }
      id WeakRetained = objc_loadWeakRetained((id *)&self->mDelegate);
      [WeakRetained sectionTitleHeight];
      double v6 = v16;
    }

    goto LABEL_8;
  }
  return v6;
}

- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4
{
  id v6 = a3;
  if ([(NSArray *)self->mSections count] > a4)
  {
    if ([(THNotesDetailTableViewController *)self inSizeTransition])
    {
      id v7 = objc_alloc_init(THNotesDetailTableViewHeaderView);
    }
    else
    {
      id v8 = [v6 dequeueReusableHeaderFooterViewWithIdentifier:@"notesHeaderCell"];
      if (v8)
      {
LABEL_8:
        [v8 setDelegate:self];
        [v8 setSection:a4];
        [v8 setEditing:[v6 isEditing] animated:0];
        double v9 = [(NSMutableArray *)self->mSectionSelections objectAtIndexedSubscript:a4];
        [v8 setSelected:[v9 BOOLValue]];
        id v10 = [(NSArray *)self->mSections objectAtIndex:a4];
        double v11 = [v10 chapterTitle];

        id WeakRetained = objc_loadWeakRetained((id *)&self->mDelegate);
        id v13 = WeakRetained;
        double v14 = TSDMovieInfo_ptr;
        if (v11)
        {
          [WeakRetained sectionTitleHeightForAllChapters];
          double v16 = v15;

          [v6 frame];
          double v18 = v17;
          id v19 = objc_loadWeakRetained((id *)&self->mDelegate);
          [v19 sectionTitleHeightForAllChapters];
          double v21 = v20;
          id v22 = objc_loadWeakRetained((id *)&self->mDelegate);
          [v22 chapterTitleHeightForAllChapters];
          double v24 = v21 + v23;

          [v8 setFrame:0.0, 0.0, v18, v24];
          v25 = [v10 chapterTitle];
          id v26 = objc_loadWeakRetained((id *)&self->mDelegate);
          [v26 chapterTitleHeightForAllChapters];
          double v28 = v27;
          long long v29 = +[UIColor bc_booksLabelColor];
          long long v30 = -[THNotesDetailTableViewController p_labelWithText:frame:textColor:tag:](self, "p_labelWithText:frame:textColor:tag:", v25, v29, 14, 0.0, 5.0, v18, v28);

          double v14 = TSDMovieInfo_ptr;
          [v8 addChapterLabel:v30];
          id v31 = objc_loadWeakRetained((id *)&self->mDelegate);
          [v31 chapterTitleHeightForAllChapters];
          double v33 = v32 + 0.0;
        }
        else
        {
          [WeakRetained sectionTitleHeight];
          double v16 = v34;

          [v6 frame];
          double v18 = v35;
          id v36 = objc_loadWeakRetained((id *)&self->mDelegate);
          [v36 sectionTitleHeight];
          double v38 = v37;

          double v33 = 0.0;
          [v8 setFrame:0.0, 0.0, v18, v38];
        }
        v39 = [v10 title];
        v40 = [v14[127] bc_booksLabelColor];
        v41 = -[THNotesDetailTableViewController p_labelWithText:frame:textColor:tag:](self, "p_labelWithText:frame:textColor:tag:", v39, v40, 8, 0.0, v33, v18, v16);

        [v8 addSectionLabel:v41];
        goto LABEL_12;
      }
      id v7 = [[THNotesDetailTableViewHeaderView alloc] initWithReuseIdentifier:@"notesHeaderCell"];
    }
    id v8 = v7;
    goto LABEL_8;
  }
  id v8 = 0;
LABEL_12:

  return v8;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v7 section];
  if (v8 == (id)[(NSArray *)self->mSections count])
  {
    if ([(THNotesViewAnnotationRenderer *)self->mAnnotationRenderer doneRendering])
    {
      double v9 = +[TSUAssertionHandler currentHandler];
      id v10 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THNotesDetailTableViewController tableView:cellForRowAtIndexPath:]");
      double v11 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THNotesDetailTableViewController.m"];
      [v9 handleFailureInFunction:v10 file:v11 lineNumber:621 description:@"shouldn't show spinner cell when done rendering"];
    }
    double v12 = [(THNotesDetailTableViewController *)self p_activityIndicatorCell:v6];
  }
  else
  {
    double v12 = [(THNotesDetailTableViewController *)self p_annotationCellForIndexPath:v7 withTableView:v6];
    id v13 = +[UIColor bc_booksBackground];
    [v12 setBackgroundColor:v13];

    double v14 = [v12 selectedBackgroundView];
    [v14 setHidden:1];

    double v15 = [(THNotesDetailTableViewController *)self cachedAnnotationForIndexPath:v7];
    double v16 = [(TSUNoCopyDictionary *)self->mCellHeights objectForKey:v15];
    if (!v16) {
      [(THNotesDetailTableViewController *)self p_cacheCellHeight:v12 annotation:v15];
    }
  }

  return v12;
}

- (BOOL)p_sectionHasUnrenderedAnnotations:(id)a3
{
  id v4 = a3;
  id v5 = [(THNotesDetailTableViewController *)self p_numberOfRenderedAnnotationsInSection:v4];
  id v6 = [v4 notes];

  LOBYTE(v5) = v5 != [v6 count];
  return (char)v5;
}

- (unint64_t)p_numberOfRenderedAnnotationsInSection:(id)a3
{
  [a3 notes];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  id v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    id v6 = v5;
    unint64_t v7 = 0;
    uint64_t v8 = *(void *)v14;
    while (2)
    {
      double v9 = 0;
      unint64_t v10 = (unint64_t)v6 + v7;
      do
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v4);
        }
        double v11 = -[TSUNoCopyDictionary objectForKey:](self->mRenderedAnnotations, "objectForKey:", *(void *)(*((void *)&v13 + 1) + 8 * (void)v9), (void)v13);

        if (!v11)
        {
          unint64_t v10 = (unint64_t)v9 + v7;
          goto LABEL_12;
        }
        double v9 = (char *)v9 + 1;
      }
      while (v6 != v9);
      id v6 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
      unint64_t v7 = v10;
      if (v6) {
        continue;
      }
      break;
    }
  }
  else
  {
    unint64_t v10 = 0;
  }
LABEL_12:

  return v10;
}

- (id)p_labelWithText:(id)a3 frame:(CGRect)a4 textColor:(id)a5 tag:(int64_t)a6
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  id v13 = a5;
  id v14 = a3;
  id v15 = [objc_alloc((Class)UILabel) initWithFrame:x, y, width, height];
  [v15 setText:v14];

  long long v16 = +[UIFont boldSystemFontOfSize:17.0];
  [v15 setFont:v16];

  [v15 setTextColor:v13];
  double v17 = +[UIColor clearColor];
  [v15 setBackgroundColor:v17];

  [v15 setAdjustsFontSizeToFitWidth:0];
  [v15 setAutoresizingMask:32];
  [v15 setLineBreakMode:4];
  [v15 sizeToFit];
  [v15 frame];
  [v15 textRectForBounds:1];
  double v19 = v18;
  double v21 = v20;
  self = (THNotesDetailTableViewController *)((char *)self + 96);
  id WeakRetained = objc_loadWeakRetained((id *)&self->super.super.super.isa);
  [WeakRetained cellMargin];
  double v24 = v23;
  double v25 = y + round((height - v21) * 0.5);

  id v26 = objc_loadWeakRetained((id *)&self->super.super.super.isa);
  [v26 cellMargin];
  double v28 = width - (v27 + 15.0);

  if (v19 <= v28) {
    double v29 = v19;
  }
  else {
    double v29 = v28;
  }
  [v15 setFrame:v24, v25, v29, v21];
  [v15 setTag:a6];

  return v15;
}

- (id)p_activityIndicatorCell:(id)a3
{
  id v4 = a3;
  id v5 = [objc_alloc((Class)UITableViewCell) initWithStyle:3 reuseIdentifier:@"ActivityIndicatorCell"];
  [v4 frame];
  double v7 = v6;

  self = (THNotesDetailTableViewController *)((char *)self + 96);
  id WeakRetained = objc_loadWeakRetained((id *)&self->super.super.super.isa);
  [WeakRetained activityIndicatorCellHeight];
  [v5 setFrame:0.0, 0.0, v7, v9];

  id v10 = objc_alloc((Class)UIActivityIndicatorView);
  double v11 = [v5 contentView];
  [v11 frame];
  double v13 = v12;
  id v14 = objc_loadWeakRetained((id *)&self->super.super.super.isa);
  [v14 activityIndicatorCellHeight];
  id v16 = [v10 initWithFrame:0.0, 0.0, v13, v15];

  double v17 = [v5 contentView];
  [v17 center];
  [v16 setCenter:];

  [v16 setAutoresizingMask:2];
  double v18 = +[UIColor bc_booksKeyColor];
  [v16 setColor:v18];

  [v16 startAnimating];
  double v19 = [v5 contentView];
  [v19 addSubview:v16];

  return v5;
}

- (id)p_annotationCellForIndexPath:(id)a3 withTableView:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [THNotesDetailTableViewCell alloc];
  double v9 = [(THNotesDetailTableViewController *)self delegate];
  id v10 = [(THNotesDetailTableViewCell *)v8 initWithStyle:3 reuseIdentifier:@"notesMainCell" tableView:v7 sizingDelegate:v9];

  [(THNotesDetailTableViewCell *)v10 setMyTableViewController:self];
  [(THNotesDetailTableViewCell *)v10 setIndexPath:v6];
  id v11 = [(THNotesDetailTableViewController *)self p_makeViewForAnnotationAtIndexPath:v6 cell:v10];

  return v10;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v18 = a3;
  id v6 = a4;
  if ([(THNotesDetailTableViewController *)self p_isTableViewInEditMode:v18])
  {
    id v7 = [(NSMutableDictionary *)self->mSelectedNotes objectForKey:v6];
    if (!v7) {
      [(NSMutableDictionary *)self->mSelectedNotes setObject:v6 forKey:v6];
    }
    id v8 = [v18 numberOfRowsInSection:[v6 section]];
    if ((uint64_t)v8 < 1)
    {
LABEL_8:
      objc_opt_class();
      double v13 = [v18 headerViewForSection:[v6 section]];
      id v14 = TSUDynamicCast();

      if (v14) {
        [v14 setSelected:1];
      }
      mSectionSelections = self->mSectionSelections;
      id v16 = [v6 section];
      double v17 = +[NSNumber numberWithBool:1];
      [(NSMutableArray *)mSectionSelections replaceObjectAtIndex:v16 withObject:v17];
    }
    else
    {
      id v9 = v8;
      uint64_t v10 = 0;
      while (1)
      {
        id v11 = +[NSIndexPath indexPathForRow:inSection:](NSIndexPath, "indexPathForRow:inSection:", v10, [v6 section]);
        double v12 = [(NSMutableDictionary *)self->mSelectedNotes objectForKey:v11];

        if (!v12) {
          break;
        }
        if (v9 == (id)++v10) {
          goto LABEL_8;
        }
      }
    }
    [(THNotesDetailTableViewController *)self p_notifySelectionDidChange];
  }
}

- (void)tableView:(id)a3 didDeselectRowAtIndexPath:(id)a4
{
  id v13 = a3;
  id v6 = a4;
  if ([(THNotesDetailTableViewController *)self p_isTableViewInEditMode:v13])
  {
    id v7 = [(NSMutableDictionary *)self->mSelectedNotes objectForKey:v6];
    if (v7) {
      [(NSMutableDictionary *)self->mSelectedNotes removeObjectForKey:v6];
    }
    objc_opt_class();
    id v8 = [v13 headerViewForSection:[v6 section]];
    id v9 = TSUDynamicCast();

    if (v9) {
      [v9 setSelected:0];
    }
    mSectionSelections = self->mSectionSelections;
    id v11 = [v6 section];
    double v12 = +[NSNumber numberWithBool:0];
    [(NSMutableArray *)mSectionSelections replaceObjectAtIndex:v11 withObject:v12];

    [(THNotesDetailTableViewController *)self p_notifySelectionDidChange];
  }
}

- (BOOL)tableView:(id)a3 canEditRowAtIndexPath:(id)a4
{
  return 1;
}

- (void)p_notifySelectionDidChange
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->mDelegate);
  [WeakRetained tableViewControllerDidChangeSelection:self];
}

- (unint64_t)countOfItemsToDelete
{
  v2 = [(NSMutableDictionary *)self->mSelectedNotes allKeys];
  id v3 = [v2 count];

  return (unint64_t)v3;
}

- (unint64_t)countOfUserNotesToDelete
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  mSelectedNotes = self->mSelectedNotes;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_106D04;
  v5[3] = &unk_459908;
  v5[4] = self;
  v5[5] = &v6;
  [(NSMutableDictionary *)mSelectedNotes enumerateKeysAndObjectsUsingBlock:v5];
  unint64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (id)cachedAnnotationForIndexPath:(id)a3
{
  mSections = self->mSections;
  id v4 = a3;
  id v5 = -[NSArray objectAtIndex:](mSections, "objectAtIndex:", [v4 section]);
  uint64_t v6 = [v5 notes];
  id v7 = [v4 row];

  uint64_t v8 = [v6 objectAtIndex:v7];

  return v8;
}

- (id)sectionTitleForIndexPath:(id)a3
{
  unint64_t v3 = -[NSArray objectAtIndex:](self->mSections, "objectAtIndex:", [a3 section]);
  id v4 = v3;
  if (v3)
  {
    id v5 = [v3 title];
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (void)deleteSelectedNotes
{
  id v4 = [(NSMutableDictionary *)self->mSelectedNotes allKeys];
  unint64_t v3 = [v4 sortedArrayUsingComparator:&stru_459928];
  [(THNotesDetailTableViewController *)self p_deleteNotesAtIndexPaths:v3];
  [(THNotesDetailTableViewController *)self p_reload];
}

- (void)p_deleteNotesAtIndexPaths:(id)a3
{
  id v4 = a3;
  id v5 = objc_opt_new();
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v6 = v4;
  id v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v17;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = -[THNotesDetailTableViewController cachedAnnotationForIndexPath:](self, "cachedAnnotationForIndexPath:", *(void *)(*((void *)&v16 + 1) + 8 * (void)v10), (void)v16);
        if (v11) {
          [v5 addObject:v11];
        }

        uint64_t v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      id v8 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v8);
  }

  if ([v5 count])
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->mBookViewController);
    id v13 = [WeakRetained documentViewController];
    id v14 = [v13 documentRoot];
    double v15 = [v14 annotationController];
    [v15 destroyAnnotations:v5 undoContext:0];
  }
}

- (void)p_reload
{
  mLastInsertedRow = self->mLastInsertedRow;
  self->mLastInsertedRow = 0;

  if ([(NSArray *)self->mSections count])
  {
    unint64_t v4 = 0;
    unint64_t v5 = 0;
    unint64_t v6 = 0;
    do
    {
      id v7 = [(NSArray *)self->mSections objectAtIndex:v6];
      id v8 = [v7 notes];
      id v9 = [v8 count];

      if (v9)
      {
        unint64_t v5 = [(THNotesDetailTableViewController *)self p_numberOfRenderedAnnotationsInSection:v7];
        ++v6;
        uint64_t v10 = [v7 notes];
        id v11 = [v10 count];

        if ((id)v5 != v11)
        {

          unint64_t v4 = v6;
          goto LABEL_11;
        }
        unint64_t v4 = v6;
      }
      else
      {
        ++v6;
      }
    }
    while (v6 < [(NSArray *)self->mSections count]);
    if (!v4) {
      goto LABEL_12;
    }
LABEL_11:
    double v12 = +[NSIndexPath indexPathForRow:v5 inSection:v4 - 1];
    id v13 = self->mLastInsertedRow;
    self->mLastInsertedRow = v12;
  }
LABEL_12:
  id v14 = [(THNotesDetailTableViewController *)self tableView];
  [v14 reloadData];
}

- (void)p_reloadFromBottom
{
  unint64_t v3 = +[NSMutableArray array];
  mLastInsertedRow = self->mLastInsertedRow;
  if (mLastInsertedRow)
  {
    unint64_t v5 = [(NSIndexPath *)mLastInsertedRow section];
    if (v5 < (char *)[(NSArray *)self->mSections count])
    {
      while (1)
      {
        unint64_t v6 = [(NSArray *)self->mSections objectAtIndex:v5];
        id v7 = [v6 notes];
        id v8 = [v7 count];

        if (v8)
        {
          unint64_t v9 = [(THNotesDetailTableViewController *)self p_numberOfRenderedAnnotationsInSection:v6];
          if (v5 == (char *)[(NSIndexPath *)self->mLastInsertedRow section]) {
            unint64_t v10 = [(NSIndexPath *)self->mLastInsertedRow row];
          }
          else {
            unint64_t v10 = 0;
          }
          if (v10 < v9)
          {
            do
            {
              id v11 = +[NSIndexPath indexPathForRow:v10 inSection:v5];
              [v3 addObject:v11];

              ++v10;
            }
            while (v9 != v10);
          }
          double v12 = [v6 notes];
          id v13 = [v12 count];

          if ((id)v9 != v13) {
            break;
          }
        }

        if (++v5 >= (char *)[(NSArray *)self->mSections count]) {
          goto LABEL_13;
        }
      }
    }
  }
LABEL_13:
  if ([v3 count])
  {
    long long v30 = [v3 lastObject];
    id v14 = +[NSIndexPath indexPathForRow:inSection:](NSIndexPath, "indexPathForRow:inSection:", (char *)[v30 row] + 1, objc_msgSend(v30, "section"));
    double v15 = (NSIndexPath *)[v14 copy];
    long long v16 = self->mLastInsertedRow;
    self->mLastInsertedRow = v15;

    +[CATransaction begin];
    +[CATransaction setDisableActions:1];
    long long v17 = [(THNotesDetailTableViewController *)self tableView];
    [v17 beginUpdates];
    [v17 insertRowsAtIndexPaths:v3 withRowAnimation:5];
    if ([(THNotesViewAnnotationRenderer *)self->mAnnotationRenderer doneRendering])
    {
      long long v18 = +[NSIndexPath indexPathForRow:0 inSection:[(NSArray *)self->mSections count]];
      long long v19 = +[NSArray arrayWithObject:v18];
      [v17 deleteRowsAtIndexPaths:v19 withRowAnimation:5];

      id WeakRetained = objc_loadWeakRetained((id *)&self->mDelegate);
      [WeakRetained tableViewController:self renderingInProgress:0];
    }
    [v17 endUpdates];
    +[CATransaction commit];
    double v21 = [(THNotesDetailTableViewController *)self tableView];
    unsigned int v22 = [v21 isEditing];

    if (v22)
    {
      long long v33 = 0u;
      long long v34 = 0u;
      long long v31 = 0u;
      long long v32 = 0u;
      id v23 = v3;
      id v24 = [v23 countByEnumeratingWithState:&v31 objects:v35 count:16];
      if (v24)
      {
        uint64_t v25 = *(void *)v32;
        do
        {
          for (uint64_t i = 0; i != v24; uint64_t i = (char *)i + 1)
          {
            if (*(void *)v32 != v25) {
              objc_enumerationMutation(v23);
            }
            uint64_t v27 = *(void *)(*((void *)&v31 + 1) + 8 * i);
            double v28 = [(NSMutableDictionary *)self->mSelectedNotes objectForKey:v27];

            if (v28)
            {
              double v29 = [(THNotesDetailTableViewController *)self tableView];
              [v29 selectRowAtIndexPath:v27 animated:0 scrollPosition:0];
            }
          }
          id v24 = [v23 countByEnumeratingWithState:&v31 objects:v35 count:16];
        }
        while (v24);
      }
    }
  }
}

- (BOOL)p_isTableViewInEditMode:(id)a3
{
  return [a3 isEditing];
}

- (void)startEditing
{
  mSelectedNotes = self->mSelectedNotes;
  if (mSelectedNotes)
  {
    unint64_t v4 = +[TSUAssertionHandler currentHandler];
    unint64_t v5 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THNotesDetailTableViewController startEditing]");
    unint64_t v6 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THNotesDetailTableViewController.m"];
    [v4 handleFailureInFunction:v5 file:v6 lineNumber:1069 description:@"expected nil value for '%s'", "mSelectedNotes"];

    mSelectedNotes = self->mSelectedNotes;
  }
  self->mSelectedNotes = 0;

  id v7 = (NSMutableDictionary *)[objc_alloc((Class)NSMutableDictionary) initWithCapacity:10];
  id v8 = self->mSelectedNotes;
  self->mSelectedNotes = v7;

  _objc_release_x1(v7, v8);
}

- (void)paginationController:(id)a3 paginationCompleteStateChangedTo:(BOOL)a4
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->mBookViewController);

  if (WeakRetained)
  {
    [(THNotesDetailTableViewController *)self p_reload];
  }
}

- (double)highlightWidthForAnnotationRenderer:(id)a3
{
  unint64_t v4 = [(THNotesDetailTableViewController *)self view];
  unint64_t v5 = [v4 safeAreaLayoutGuide];
  [v5 layoutFrame];
  double Width = CGRectGetWidth(v17);

  id v7 = [(THNotesDetailTableViewController *)self tableView];
  [v7 frame];
  double v8 = CGRectGetWidth(v18);

  if (Width >= v8) {
    double Width = v8;
  }
  p_mDelegate = &self->mDelegate;
  id WeakRetained = objc_loadWeakRetained((id *)p_mDelegate);
  [WeakRetained highlightLeftInset];
  double v12 = Width - v11;
  id v13 = objc_loadWeakRetained((id *)p_mDelegate);
  [v13 highlightRightInset];
  double v15 = v12 - v14;

  return v15;
}

- (double)editingHighlightWidthForAnnotationRenderer:(id)a3
{
  [(THNotesDetailTableViewController *)self highlightWidthForAnnotationRenderer:a3];
  double v5 = v4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->mDelegate);
  [WeakRetained highlightEditingWidthAdjustment];
  double v8 = v5 - v7;

  return v8;
}

- (unint64_t)maxLinesForAnnotationRenderer:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->mDelegate);
  id v4 = [WeakRetained maxLines];

  return (unint64_t)v4;
}

- (id)annotationRenderer:(id)a3 contentNodeForAnnotation:(id)a4
{
  p_mBookViewController = &self->mBookViewController;
  id v5 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)p_mBookViewController);
  double v7 = [WeakRetained documentViewController];
  double v8 = [v7 documentRoot];
  unint64_t v9 = [v8 annotationController];

  unint64_t v10 = [v9 contentNodeForAnnotation:v5];

  return v10;
}

- (id)annotationRenderer:(id)a3 storageForAnnotationLocation:(id)a4
{
  if (a4)
  {
    p_mBookViewController = &self->mBookViewController;
    id v5 = a4;
    id WeakRetained = objc_loadWeakRetained((id *)p_mBookViewController);
    double v7 = [WeakRetained storageForCFI:v5];
  }
  else
  {
    double v7 = 0;
  }

  return v7;
}

- (id)accessControllerForAnnotationRenderer:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->mBookViewController);
  id v4 = [WeakRetained documentViewController];
  id v5 = [v4 documentRoot];
  unint64_t v6 = [v5 accessController];

  return v6;
}

- (void)annotationRenderer:(id)a3 didLoadContentNode:(id)a4
{
  id v5 = a4;
  if (!+[NSThread isMainThread])
  {
    unint64_t v6 = +[TSUAssertionHandler currentHandler];
    double v7 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THNotesDetailTableViewController annotationRenderer:didLoadContentNode:]");
    double v8 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THNotesDetailTableViewController.m"];
    [v6 handleFailureInFunction:v7 file:v8 lineNumber:1132 description:@"This operation must only be performed on the main thread."];
  }
  if (!v5)
  {
    unint64_t v9 = +[TSUAssertionHandler currentHandler];
    unint64_t v10 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THNotesDetailTableViewController annotationRenderer:didLoadContentNode:]");
    double v11 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THNotesDetailTableViewController.m"];
    [v9 handleFailureInFunction:v10 file:v11 lineNumber:1133 description:@"invalid nil value for '%s'", "contentNode"];
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->mDelegate);
  [WeakRetained tableViewController:self didLoadContentNode:v5];
}

- (void)annotationRenderer:(id)a3 didRenderAnnotation:(id)a4 withResult:(id)a5
{
  id v24 = a4;
  id v7 = a5;
  if (!+[NSThread isMainThread])
  {
    double v8 = +[TSUAssertionHandler currentHandler];
    unint64_t v9 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THNotesDetailTableViewController annotationRenderer:didRenderAnnotation:withResult:]");
    unint64_t v10 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THNotesDetailTableViewController.m"];
    [v8 handleFailureInFunction:v9 file:v10 lineNumber:1140 description:@"This operation must only be performed on the main thread."];
  }
  if (!v24)
  {
    CGRect v18 = +[TSUAssertionHandler currentHandler];
    long long v19 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THNotesDetailTableViewController annotationRenderer:didRenderAnnotation:withResult:]");
    double v20 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THNotesDetailTableViewController.m"];
    [v18 handleFailureInFunction:v19 file:v20 lineNumber:1141 description:@"invalid nil value for '%s'", "annotation"];

    if (v7) {
      goto LABEL_12;
    }
    goto LABEL_11;
  }
  if (!v7)
  {
LABEL_11:
    double v21 = +[TSUAssertionHandler currentHandler];
    unsigned int v22 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THNotesDetailTableViewController annotationRenderer:didRenderAnnotation:withResult:]");
    id v23 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THNotesDetailTableViewController.m"];
    [v21 handleFailureInFunction:v22 file:v23 lineNumber:1142 description:@"invalid nil value for '%s'", "renderedAnnotation"];

    goto LABEL_12;
  }
  mRenderedAnnotations = self->mRenderedAnnotations;
  if (!mRenderedAnnotations)
  {
    double v12 = (TSUNoCopyDictionary *)objc_alloc_init((Class)TSUNoCopyDictionary);
    id v13 = self->mRenderedAnnotations;
    self->mRenderedAnnotations = v12;

    mRenderedAnnotations = self->mRenderedAnnotations;
  }
  double v14 = [(TSUNoCopyDictionary *)mRenderedAnnotations objectForKey:v24];

  if (v14)
  {
    double v15 = +[TSUAssertionHandler currentHandler];
    long long v16 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THNotesDetailTableViewController annotationRenderer:didRenderAnnotation:withResult:]");
    CGRect v17 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THNotesDetailTableViewController.m"];
    [v15 handleFailureInFunction:v16 file:v17 lineNumber:1151 description:@"already rendered this annotation"];
  }
  [(TSUNoCopyDictionary *)self->mRenderedAnnotations setObject:v7 forUncopiedKey:v24];
  [(THNotesDetailTableViewController *)self p_reloadFromBottom];
LABEL_12:
}

- (void)notesDetailTableViewHeaderView:(id)a3 selected:(BOOL)a4
{
  id v23 = a3;
  unint64_t v6 = [(THNotesDetailTableViewController *)self tableView];
  if ([(THNotesDetailTableViewController *)self p_isTableViewInEditMode:v6])
  {
    id v7 = [v23 section];
    double v8 = (char *)[v6 numberOfRowsInSection:v7];
    unint64_t v9 = v8;
    if (a4)
    {
      if ((uint64_t)v8 >= 1)
      {
        unint64_t v10 = 0;
        do
        {
          double v11 = +[NSIndexPath indexPathForRow:v10 inSection:v7];
          [v6 deselectRowAtIndexPath:v11 animated:0];
          [(NSMutableDictionary *)self->mSelectedNotes removeObjectForKey:v11];

          ++v10;
        }
        while (v9 != v10);
      }
      mSectionSelections = self->mSectionSelections;
      id v13 = +[NSNumber numberWithBool:0];
      [(NSMutableArray *)mSectionSelections replaceObjectAtIndex:v7 withObject:v13];

      objc_opt_class();
      double v14 = [v6 headerViewForSection:v7];
      double v15 = TSUDynamicCast();

      if (!v15) {
        goto LABEL_14;
      }
      long long v16 = v15;
      uint64_t v17 = 0;
    }
    else
    {
      if ((uint64_t)v8 >= 1)
      {
        CGRect v18 = 0;
        do
        {
          long long v19 = +[NSIndexPath indexPathForRow:v18 inSection:v7];
          [v6 selectRowAtIndexPath:v19 animated:0 scrollPosition:0];
          [(NSMutableDictionary *)self->mSelectedNotes setObject:v19 forKey:v19];

          ++v18;
        }
        while (v9 != v18);
      }
      double v20 = self->mSectionSelections;
      double v21 = +[NSNumber numberWithBool:1];
      [(NSMutableArray *)v20 replaceObjectAtIndex:v7 withObject:v21];

      objc_opt_class();
      unsigned int v22 = [v6 headerViewForSection:v7];
      double v15 = TSUDynamicCast();

      if (!v15) {
        goto LABEL_14;
      }
      long long v16 = v15;
      uint64_t v17 = 1;
    }
    [v16 setSelected:v17];
LABEL_14:

    [(THNotesDetailTableViewController *)self p_notifySelectionDidChange];
  }
}

- (id)_thTableView:(id)a3 itemsForBeginningDragSession:(id)a4 atIndexPath:(id)a5
{
  unint64_t v6 = -[THNotesDetailTableViewController p_annotationAtIndexPath:](self, "p_annotationAtIndexPath:", a5, a4);
  id v7 = +[AEAnnotationDragItemProvider itemProviderWithAnnotation:v6 propertyProvider:self];
  id v8 = [objc_alloc((Class)NSItemProvider) initWithObject:v7];
  id v9 = [objc_alloc((Class)UIDragItem) initWithItemProvider:v8];
  id v12 = v9;
  unint64_t v10 = +[NSArray arrayWithObjects:&v12 count:1];

  return v10;
}

- (id)tableView:(id)a3 itemsForBeginningDragSession:(id)a4 atIndexPath:(id)a5
{
  return [(THNotesDetailTableViewController *)self _thTableView:a3 itemsForBeginningDragSession:a4 atIndexPath:a5];
}

- (id)tableView:(id)a3 itemsForAddingToDragSession:(id)a4 atIndexPath:(id)a5 point:(CGPoint)a6
{
  return -[THNotesDetailTableViewController _thTableView:itemsForBeginningDragSession:atIndexPath:](self, "_thTableView:itemsForBeginningDragSession:atIndexPath:", a3, a4, a5, a6.x, a6.y);
}

- (void)_renderAnnotationsForTheme:(id)a3
{
  id v11 = a3;
  id v4 = [(THNotesDetailTableViewController *)self traitCollection];
  id v5 = [v4 userInterfaceStyle];

  id WeakRetained = objc_loadWeakRetained((id *)&self->mBookViewController);
  id v7 = [WeakRetained documentViewController];
  id v8 = [v7 documentRoot];
  id v9 = [v8 themeProvider];

  if (v9)
  {
    unint64_t v10 = (unint64_t)[v9 annotationPageTheme];
    if (v10 <= 0x10 && ((0x1FFEFu >> v10) & 1) != 0) {
      id v5 = (id)qword_344A38[v10];
    }
  }
  [(THNotesViewAnnotationRenderer *)self->mAnnotationRenderer renderAnnotations:v11 withUserInterfaceStyle:v5];
}

- (id)p_annotationAtIndexPath:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    unint64_t v6 = -[NSArray objectAtIndex:](self->mSections, "objectAtIndex:", [v4 section]);
    id v7 = [v5 row];
    id v8 = [v6 notes];
    id v9 = [v8 count];

    if (v7 >= v9)
    {
      unint64_t v10 = +[TSUAssertionHandler currentHandler];
      id v11 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THNotesDetailTableViewController p_annotationAtIndexPath:]");
      id v12 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THNotesDetailTableViewController.m"];
      [v10 handleFailureInFunction:v11 file:v12 lineNumber:1288 description:@"notes index out of range"];
    }
    id v13 = [v5 row];
    double v14 = [v6 notes];
    id v15 = [v14 count];

    if (v13 >= v15)
    {
      uint64_t v17 = 0;
    }
    else
    {
      long long v16 = [v6 notes];
      uint64_t v17 = [v16 objectAtIndex:[v5 row]];
    }
  }
  else
  {
    uint64_t v17 = 0;
  }

  return v17;
}

- (id)p_makeViewForAnnotationAtIndexPath:(id)a3 cell:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [THNotesDetailTableViewCellController alloc];
  p_mDelegate = &self->mDelegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->mDelegate);
  id v11 = [(THNotesDetailTableViewCellController *)v8 initWithSizingDelegate:WeakRetained];

  mTableCellNIB = self->mTableCellNIB;
  if (!mTableCellNIB)
  {
    id v13 = THBundle();
    double v14 = +[UINib nibWithNibName:@"THNotesDetailTableViewCellController" bundle:v13];
    id v15 = self->mTableCellNIB;
    self->mTableCellNIB = v14;

    mTableCellNIB = self->mTableCellNIB;
  }
  id v16 = [(UINib *)mTableCellNIB instantiateWithOwner:v11 options:0];
  uint64_t v17 = [(THNotesDetailTableViewController *)self p_annotationAtIndexPath:v6];
  if (v17)
  {
    CGRect v18 = -[NSArray objectAtIndex:](self->mSections, "objectAtIndex:", [v6 section]);
    long long v19 = [(TSUNoCopyDictionary *)self->mRenderedAnnotations objectForKey:v17];
    v42 = [(THNotesDetailTableViewController *)self tableView];
    [v42 bounds];
    double v21 = v20;
    v41 = [v19 highlightLayer];
    [v19 highlightTextFrame];
    double v23 = v22;
    double v25 = v24;
    double v27 = v26;
    double v29 = v28;
    v43 = [v19 editingHighlightLayer];
    unsigned __int8 v30 = [v17 annotationIsOrphan];
    v44 = v7;
    if (v30)
    {
      long long v31 = &stru_46D7E8;
    }
    else
    {
      id v40 = objc_loadWeakRetained((id *)&self->mBookViewController);
      long long v31 = [v40 pageNumberStringForAnnotation:v17];
    }
    id v32 = [v6 row];
    if (v32)
    {
      double v33 = 0.0;
    }
    else
    {
      id v39 = objc_loadWeakRetained((id *)p_mDelegate);
      [v39 firstNoteBelowSectionAdjustment];
      double v33 = v34;
    }
    double v35 = (char *)[v6 row];
    id v36 = v18;
    double v37 = [v18 notes];
    [v44 populateWithCellController:v11 annotation:v17 cellWidth:v41 highlightLayer:v43 highlightTextFrame:v31 count:[v37 count] - 1 topAdjustment:v21 cellWidth:v23 highlightLayer:v25 editingHighlightLayer:v27 pageNumberString:v29 divider:v33];

    if (v32)
    {
      if (v30)
      {
LABEL_13:

        id v7 = v44;
        goto LABEL_14;
      }
    }
    else
    {

      if (v30) {
        goto LABEL_13;
      }
    }

    goto LABEL_13;
  }
LABEL_14:

  return v11;
}

- (id)bookTitle
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->mBookViewController);
  unint64_t v3 = [WeakRetained bookDescription];
  id v4 = [v3 bookTitle];

  return v4;
}

- (id)author
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->mBookViewController);
  unint64_t v3 = [WeakRetained bookDescription];
  id v4 = [v3 bookAuthor];

  return v4;
}

- (id)storeURL
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->mBookViewController);
  unint64_t v3 = [WeakRetained bookDescription];
  id v4 = [v3 storeID];

  if ([v4 length])
  {
    id v5 = +[AEUserPublishing sharedInstance];
    id v6 = [v5 storeShortURLForStoreId:v4 dataSource:0];
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (id)pageNumberStringForAnnotation:(id)a3
{
  id v4 = TSUProtocolCast();
  id v5 = v4;
  if (v4 && ([v4 annotationIsOrphan] & 1) == 0)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->mBookViewController);
    id v6 = [WeakRetained pageNumberStringForAnnotation:v5];
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (THNotesDetailTableViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->mDelegate);

  return (THNotesDetailTableViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (THBookViewController)bookViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->mBookViewController);

  return (THBookViewController *)WeakRetained;
}

- (NSMutableDictionary)selectedNotes
{
  return self->mSelectedNotes;
}

- (void)setSelectedNotes:(id)a3
{
}

- (UITableView)tableView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_tableView);

  return (UITableView *)WeakRetained;
}

- (void)setTableView:(id)a3
{
}

- (BOOL)inSizeTransition
{
  return self->_inSizeTransition;
}

- (void)setInSizeTransition:(BOOL)a3
{
  self->_inSizeTransition = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_tableView);
  objc_destroyWeak((id *)&self->mBookViewController);
  objc_destroyWeak((id *)&self->mDelegate);
  objc_storeStrong((id *)&self->mLastInsertedRow, 0);
  objc_storeStrong((id *)&self->mCellHeights, 0);
  objc_storeStrong((id *)&self->mRenderedAnnotations, 0);
  objc_storeStrong((id *)&self->mAnnotationRenderer, 0);
  objc_storeStrong((id *)&self->mSelectedNotes, 0);
  objc_storeStrong((id *)&self->mSectionSelections, 0);
  objc_storeStrong((id *)&self->mSections, 0);

  objc_storeStrong((id *)&self->mTableCellNIB, 0);
}

@end