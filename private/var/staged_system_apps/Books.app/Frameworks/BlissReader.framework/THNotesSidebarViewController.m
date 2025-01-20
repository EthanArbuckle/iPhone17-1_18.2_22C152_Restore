@interface THNotesSidebarViewController
- (BOOL)cellHeightValid;
- (BOOL)shouldDismissAfterRotate;
- (BOOL)tableView:(id)a3 canEditRowAtIndexPath:(id)a4;
- (NSArray)sectionProviders;
- (NSIndexPath)highlightedIndexPath;
- (NSIndexPath)selectedIndexPath;
- (NSLayoutConstraint)searchbarHeightConstraint;
- (NSString)searchText;
- (THNotesSidebarDelegate)sidebarDelegate;
- (UISearchBar)searchBar;
- (UITableView)tableView;
- (UITableViewController)notesTableViewController;
- (UIView)searchBarSeparator;
- (double)cellHeight;
- (double)p_cellHeight;
- (id)emptyCellForTable:(id)a3;
- (id)p_cellFontTextStyle;
- (id)p_cellForIndexPath:(id)a3;
- (id)p_findConstraint:(id)a3 onView:(id)a4;
- (id)p_indexPathForCell:(id)a3;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 willSelectRowAtIndexPath:(id)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 editingStyleForRowAtIndexPath:(id)a4;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (unint64_t)p_numberOfNotes;
- (unint64_t)p_visibleSectionProviderIndexForIndexPath:(id)a3;
- (unint64_t)providerIndex;
- (void)cancelSearch;
- (void)dealloc;
- (void)didReceiveMemoryWarning;
- (void)keyboardDidShow:(id)a3;
- (void)notesSidebarCell:(id)a3 highlightDidChange:(BOOL)a4;
- (void)notesSidebarCell:(id)a3 selectionDidChange:(BOOL)a4;
- (void)p_cleanup;
- (void)p_contentSizeCategoryDidChange:(id)a3;
- (void)p_setConstraint:(id)a3 onView:(id)a4 toValue:(double)a5;
- (void)p_setSeparatorsHidden:(BOOL)a3 forCellAtIndexPath:(id)a4;
- (void)p_setupChildViewControllers;
- (void)setCellHeight:(double)a3;
- (void)setCellHeightValid:(BOOL)a3;
- (void)setHighlightedIndexPath:(id)a3;
- (void)setNotesTableViewController:(id)a3;
- (void)setProviderIndex:(unint64_t)a3;
- (void)setSearchBar:(id)a3;
- (void)setSearchBarSeparator:(id)a3;
- (void)setSearchbarHeightConstraint:(id)a3;
- (void)setSectionProviders:(id)a3;
- (void)setSelectedIndexPath:(id)a3;
- (void)setSidebarDelegate:(id)a3;
- (void)setTableView:(id)a3;
- (void)tableView:(id)a3 didEndDisplayingCell:(id)a4 forRowAtIndexPath:(id)a5;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5;
- (void)updateVisibleIndexes;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation THNotesSidebarViewController

- (void)dealloc
{
  [(THNotesSidebarViewController *)self p_cleanup];
  [(THNotesSidebarViewController *)self setSidebarDelegate:0];
  [(THNotesSidebarViewController *)self setNotesTableViewController:0];
  [(THNotesSidebarViewController *)self setSectionProviders:0];
  v3.receiver = self;
  v3.super_class = (Class)THNotesSidebarViewController;
  [(THNotesSidebarViewController *)&v3 dealloc];
}

- (void)p_cleanup
{
  [(THNotesSidebarViewController *)self setTableView:0];

  [(THNotesSidebarViewController *)self setSearchBar:0];
}

- (void)viewDidLoad
{
  v7.receiver = self;
  v7.super_class = (Class)THNotesSidebarViewController;
  [(THNotesSidebarViewController *)&v7 viewDidLoad];
  [(THNotesSidebarViewController *)self p_setupChildViewControllers];
  if (!self->mCellMap)
  {
    objc_super v3 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    mCellMap = self->mCellMap;
    self->mCellMap = v3;
  }
  v5 = +[UIColor bc_booksBackground];
  v6 = [(THNotesSidebarViewController *)self view];
  [v6 setBackgroundColor:v5];
}

- (void)didReceiveMemoryWarning
{
  v2.receiver = self;
  v2.super_class = (Class)THNotesSidebarViewController;
  [(THNotesSidebarViewController *)&v2 didReceiveMemoryWarning];
}

- (void)viewWillAppear:(BOOL)a3
{
  v10.receiver = self;
  v10.super_class = (Class)THNotesSidebarViewController;
  [(THNotesSidebarViewController *)&v10 viewWillAppear:a3];
  v4 = [(THNotesSidebarViewController *)self tableView];
  [v4 setShowsVerticalScrollIndicator:0];

  v5 = [(THNotesSidebarViewController *)self searchBar];
  [v5 setBarStyle:0];

  v6 = [(THNotesSidebarViewController *)self view];
  unsigned int v7 = [v6 im_isStyleDark];

  if (v7)
  {
    v8 = [(THNotesSidebarViewController *)self searchBar];
    [v8 setBarStyle:1];
  }
  v9 = +[NSNotificationCenter defaultCenter];
  [v9 addObserver:self selector:"keyboardDidShow:" name:UIKeyboardDidShowNotification object:0];
  [v9 addObserver:self selector:"p_contentSizeCategoryDidChange:" name:UIContentSizeCategoryDidChangeNotification object:0];
}

- (void)viewDidAppear:(BOOL)a3
{
  v25.receiver = self;
  v25.super_class = (Class)THNotesSidebarViewController;
  [(THNotesSidebarViewController *)&v25 viewDidAppear:a3];
  v4 = [(THNotesSidebarViewController *)self tableView];
  [v4 setShowsVerticalScrollIndicator:1];

  v5 = [(THNotesSidebarViewController *)self tableView];
  [v5 accessibilityFrame];
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  CGFloat v13 = v12;
  v14 = [(THNotesSidebarViewController *)self tableView];
  v15 = [v14 window];
  [v15 accessibilityFrame];
  v28.origin.double x = v16;
  v28.origin.double y = v17;
  v28.size.double width = v18;
  v28.size.double height = v19;
  v26.origin.double x = v7;
  v26.origin.double y = v9;
  v26.size.double width = v11;
  v26.size.double height = v13;
  CGRect v27 = CGRectIntersection(v26, v28);
  double x = v27.origin.x;
  double y = v27.origin.y;
  double width = v27.size.width;
  double height = v27.size.height;
  v24 = [(THNotesSidebarViewController *)self tableView];
  [v24 setAccessibilityFrame:x, y, width, height];
}

- (void)viewWillDisappear:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)THNotesSidebarViewController;
  [(THNotesSidebarViewController *)&v6 viewWillDisappear:a3];
  v4 = [(THNotesSidebarViewController *)self searchBar];
  [v4 resignFirstResponder];

  v5 = +[NSNotificationCenter defaultCenter];
  [v5 removeObserver:self];
}

- (void)setSectionProviders:(id)a3
{
  id obj = a3;
  id v4 = [(THNotesSidebarViewController *)self sectionProviders];

  if (v4 != obj) {
    objc_storeWeak((id *)&self->mSectionProviders, obj);
  }
  [(THNotesSidebarViewController *)self updateVisibleIndexes];
}

- (void)setProviderIndex:(unint64_t)a3
{
  self->mProviderIndedouble x = a3;
  [(THNotesSidebarViewController *)self updateVisibleIndexes];
}

- (void)updateVisibleIndexes
{
  id v3 = objc_alloc_init((Class)NSMutableIndexSet);
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v4 = [(THNotesSidebarViewController *)self sectionProviders];
  id v5 = [v4 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = 0;
    uint64_t v8 = *(void *)v20;
    do
    {
      CGFloat v9 = 0;
      do
      {
        if (*(void *)v20 != v8) {
          objc_enumerationMutation(v4);
        }
        double v10 = *(void **)(*((void *)&v19 + 1) + 8 * (void)v9);
        if ((char *)v9 + v7 == (char *)[(THNotesSidebarViewController *)self providerIndex]) {
          goto LABEL_7;
        }
        if ([v10 wantsVisibility])
        {
          CGFloat v11 = [(THNotesSidebarViewController *)self searchText];
          if (![v11 length])
          {

LABEL_7:
            [v3 addIndex:(char *)v9 + v7];
            goto LABEL_11;
          }
          id v12 = [v10 annotationCount];

          if (v12) {
            goto LABEL_7;
          }
        }
LABEL_11:
        CGFloat v9 = (char *)v9 + 1;
      }
      while (v6 != v9);
      id v13 = [v4 countByEnumeratingWithState:&v19 objects:v23 count:16];
      id v6 = v13;
      v7 += (uint64_t)v9;
    }
    while (v13);
  }

  v14 = [(THNotesSidebarViewController *)self searchText];
  if ([v14 length])
  {
    unint64_t v15 = [(THNotesSidebarViewController *)self p_numberOfNotes];

    if (!v15) {
      [v3 removeAllIndexes];
    }
  }
  else
  {
  }
  objc_storeStrong((id *)&self->mVisibleSectionProviderIndicies, v3);
  CGFloat v16 = [(THNotesSidebarViewController *)self tableView];
  [v16 reloadData];
  if ([(NSMutableIndexSet *)self->mVisibleSectionProviderIndicies containsIndex:[(THNotesSidebarViewController *)self providerIndex]])
  {
    id v17 = -[NSMutableIndexSet countOfIndexesInRange:](self->mVisibleSectionProviderIndicies, "countOfIndexesInRange:", 0, [(THNotesSidebarViewController *)self providerIndex]);
    if (v17 < [v16 numberOfSections])
    {
      CGFloat v18 = +[NSIndexPath indexPathForRow:0 inSection:v17];
      [v16 selectRowAtIndexPath:v18 animated:0 scrollPosition:1];
    }
  }
}

- (void)cancelSearch
{
  id v3 = [(THNotesSidebarViewController *)self searchBar];
  [v3 resignFirstResponder];

  id v4 = [(THNotesSidebarViewController *)self searchBar];
  [v4 setText:&stru_46D7E8];
}

- (void)p_contentSizeCategoryDidChange:(id)a3
{
  [(THNotesSidebarViewController *)self setCellHeightValid:0];
  [(THNotesSidebarViewController *)self p_cellHeight];
  double v5 = v4;
  id v6 = [(THNotesSidebarViewController *)self tableView];
  [v6 setRowHeight:v5];

  id v7 = [(THNotesSidebarViewController *)self view];
  [v7 setNeedsLayout];
}

- (id)p_cellForIndexPath:(id)a3
{
  return [(NSMutableDictionary *)self->mCellMap objectForKey:a3];
}

- (id)p_indexPathForCell:(id)a3
{
  id v3 = [(NSMutableDictionary *)self->mCellMap allKeysForObject:a3];
  if ([v3 count])
  {
    double v4 = [v3 firstObject];
  }
  else
  {
    double v4 = 0;
  }

  return v4;
}

- (void)p_setSeparatorsHidden:(BOOL)a3 forCellAtIndexPath:(id)a4
{
  id v18 = a4;
  if (a3)
  {
    id v6 = 0;
  }
  else
  {
    id v7 = [(THNotesSidebarViewController *)self tableView];
    id v6 = [v7 separatorStyle];
  }
  uint64_t v8 = [(THNotesSidebarViewController *)self tableView];
  CGFloat v9 = [v8 indexPathForRowPreceedingIndexPath:v18];

  if (v9)
  {
    double v10 = [(THNotesSidebarViewController *)self p_cellForIndexPath:v9];
    if (!v10)
    {
      CGFloat v11 = +[TSUAssertionHandler currentHandler];
      id v12 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THNotesSidebarViewController p_setSeparatorsHidden:forCellAtIndexPath:]");
      id v13 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THNotesSidebarViewController.m"];
      [v11 handleFailureInFunction:v12 file:v13 lineNumber:257 description:@"invalid nil value for '%s'", "previousCell"];
    }
    [v10 setSeparatorStyle:v6];
  }
  v14 = [(THNotesSidebarViewController *)self p_cellForIndexPath:v18];
  if (!v14)
  {
    unint64_t v15 = +[TSUAssertionHandler currentHandler];
    CGFloat v16 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THNotesSidebarViewController p_setSeparatorsHidden:forCellAtIndexPath:]");
    id v17 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THNotesSidebarViewController.m"];
    [v15 handleFailureInFunction:v16 file:v17 lineNumber:262 description:@"invalid nil value for '%s'", "thisCell"];
  }
  [v14 setSeparatorStyle:v6];
}

- (id)p_findConstraint:(id)a3 onView:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = v7;
  if (v7)
  {
    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    CGFloat v9 = [v7 constraints];
    id v10 = [v9 countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v10)
    {
      id v11 = v10;
      uint64_t v12 = *(void *)v21;
LABEL_4:
      uint64_t v13 = 0;
      while (1)
      {
        if (*(void *)v21 != v12) {
          objc_enumerationMutation(v9);
        }
        v14 = *(void **)(*((void *)&v20 + 1) + 8 * v13);
        unint64_t v15 = [v14 identifier];
        unsigned __int8 v16 = [v15 isEqualToString:v6];

        if (v16) {
          break;
        }
        if (v11 == (id)++v13)
        {
          id v11 = [v9 countByEnumeratingWithState:&v20 objects:v24 count:16];
          if (v11) {
            goto LABEL_4;
          }
          goto LABEL_10;
        }
      }
      id v17 = v14;

      if (v17) {
        goto LABEL_14;
      }
    }
    else
    {
LABEL_10:
    }
    id v18 = [v8 superview];
    id v17 = [(THNotesSidebarViewController *)self p_findConstraint:v6 onView:v18];
  }
  else
  {
    id v17 = 0;
  }
LABEL_14:

  return v17;
}

- (void)p_setConstraint:(id)a3 onView:(id)a4 toValue:(double)a5
{
  id v11 = a3;
  id v7 = -[THNotesSidebarViewController p_findConstraint:onView:](self, "p_findConstraint:onView:");
  if (!v7)
  {
    uint64_t v8 = +[TSUAssertionHandler currentHandler];
    CGFloat v9 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THNotesSidebarViewController p_setConstraint:onView:toValue:]");
    id v10 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THNotesSidebarViewController.m"];
    [v8 handleFailureInFunction:v9, v10, 294, @"Constraint not found: %@", v11 file lineNumber description];
  }
  [v7 setConstant:a5];
}

- (void)p_setupChildViewControllers
{
  id v3 = [(THNotesSidebarViewController *)self notesTableViewController];

  if (!v3)
  {
    id v4 = objc_alloc_init((Class)UITableViewController);
    [(THNotesSidebarViewController *)self setNotesTableViewController:v4];

    double v5 = [(THNotesSidebarViewController *)self notesTableViewController];
    [v5 setClearsSelectionOnViewWillAppear:0];

    id v6 = [(THNotesSidebarViewController *)self notesTableViewController];
    [(THNotesSidebarViewController *)self addChildViewController:v6];
  }
  id v7 = [(THNotesSidebarViewController *)self tableView];
  [v7 setDelegate:self];

  uint64_t v8 = [(THNotesSidebarViewController *)self tableView];
  [v8 setDataSource:self];

  CGFloat v9 = [(THNotesSidebarViewController *)self tableView];
  +[UIViewController removeViewControllerForView:v9];

  id v10 = [(THNotesSidebarViewController *)self tableView];
  id v11 = [(THNotesSidebarViewController *)self notesTableViewController];
  [v11 setTableView:v10];

  [(THNotesSidebarViewController *)self p_cellHeight];
  double v13 = v12;
  v14 = [(THNotesSidebarViewController *)self notesTableViewController];
  unint64_t v15 = [v14 tableView];
  [v15 setRowHeight:v13];

  unsigned __int8 v16 = [(THNotesSidebarViewController *)self searchBar];
  [v16 setAutocorrectionType:1];

  id v17 = THBundle();
  id v18 = [v17 localizedStringForKey:@"Search" value:&stru_46D7E8 table:0];
  long long v19 = [(THNotesSidebarViewController *)self searchBar];
  [v19 setPlaceholder:v18];

  long long v20 = (NSMutableIndexSet *)objc_alloc_init((Class)NSMutableIndexSet);
  mVisibleSectionProviderIndicies = self->mVisibleSectionProviderIndicies;
  self->mVisibleSectionProviderIndicies = v20;

  TSUScreenScale();
  double v23 = 1.0 / v22;
  v24 = [(THNotesSidebarViewController *)self searchBarSeparator];
  [(THNotesSidebarViewController *)self p_setConstraint:@"SearchBarSeparatorHeight" onView:v24 toValue:v23];

  objc_super v25 = [(THNotesSidebarViewController *)self searchBarSeparator];
  [(THNotesSidebarViewController *)self p_setConstraint:@"SearchBarSeparatorVerticalSpace" onView:v25 toValue:-v23];

  id v30 = [objc_alloc((Class)UIView) initWithFrame:CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height];
  CGRect v26 = +[UIColor clearColor];
  [v30 setBackgroundColor:v26];

  CGRect v27 = [(THNotesSidebarViewController *)self tableView];
  [v27 setTableFooterView:v30];

  CGRect v28 = +[UIColor bc_booksSeparatorColor];
  v29 = [(THNotesSidebarViewController *)self searchBarSeparator];
  [v29 setBackgroundColor:v28];
}

- (double)p_cellHeight
{
  if (![(THNotesSidebarViewController *)self cellHeightValid])
  {
    id v3 = [objc_alloc((Class)UILabel) initWithFrame:CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height];
    id v4 = [(THNotesSidebarViewController *)self p_cellFontTextStyle];
    double v5 = +[UIFont preferredFontForTextStyle:v4];
    [v3 setFont:v5];

    [v3 setText:@"One line"];
    [v3 setNumberOfLines:1];
    id v6 = [(THNotesSidebarViewController *)self view];
    [v6 bounds];
    [v3 sizeThatFits:v7, v8];
    double v10 = v9;

    [v3 setText:@"Two\nlines"];
    [v3 setNumberOfLines:2];
    id v11 = [(THNotesSidebarViewController *)self view];
    [v11 bounds];
    [v3 sizeThatFits:v12, v13];
    double v15 = v14;

    [(THNotesSidebarViewController *)self setCellHeight:v10 + 3.0 + 3.0 + v15 + 3.0];
  }

  [(THNotesSidebarViewController *)self cellHeight];
  return result;
}

- (id)p_cellFontTextStyle
{
  return UIFontTextStyleSubheadline;
}

- (unint64_t)p_numberOfNotes
{
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  objc_super v2 = [(THNotesSidebarViewController *)self sectionProviders];
  id v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    id v4 = v3;
    unint64_t v5 = 0;
    uint64_t v6 = *(void *)v10;
    do
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v2);
        }
        v5 += (unint64_t)[*(id *)(*((void *)&v9 + 1) + 8 * i) annotationCount];
      }
      id v4 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v4);
  }
  else
  {
    unint64_t v5 = 0;
  }

  return v5;
}

- (unint64_t)p_visibleSectionProviderIndexForIndexPath:(id)a3
{
  id v4 = a3;
  id v5 = [(NSMutableIndexSet *)self->mVisibleSectionProviderIndicies firstIndex];
  if ((uint64_t)[v4 section] >= 1)
  {
    uint64_t v6 = 0;
    do
    {
      id v5 = [(NSMutableIndexSet *)self->mVisibleSectionProviderIndicies indexGreaterThanIndex:v5];
      ++v6;
    }
    while ((uint64_t)[v4 section] > v6);
  }

  return (unint64_t)v5;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  int64_t result = (int64_t)[(NSMutableIndexSet *)self->mVisibleSectionProviderIndicies count];
  if ((unint64_t)result <= 1) {
    return 1;
  }
  return result;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return 1;
}

- (id)emptyCellForTable:(id)a3
{
  id v3 = [a3 dequeueReusableCellWithIdentifier:@"emptyCell"];
  if (!v3)
  {
    id v3 = [[THNotesSidebarTableCell alloc] initWithStyle:3 reuseIdentifier:@"emptyCell"];
    id v4 = [(THNotesSidebarTableCell *)v3 textLabel];
    [v4 setText:&stru_46D7E8];

    id v5 = +[UIColor clearColor];
    [(THNotesSidebarTableCell *)v3 setBackgroundColor:v5];
  }

  return v3;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(THNotesSidebarViewController *)self p_numberOfNotes]
    || ([(THNotesSidebarViewController *)self searchText],
        long long v21 = objc_claimAutoreleasedReturnValue(),
        id v22 = [v21 length],
        v21,
        !v22))
  {
    id v8 = [v7 section];
    if (v8 >= [(NSMutableIndexSet *)self->mVisibleSectionProviderIndicies count])
    {
      long long v9 = [(THNotesSidebarViewController *)self emptyCellForTable:v6];
      goto LABEL_15;
    }
    long long v9 = [v6 dequeueReusableCellWithIdentifier:@"notesViewCell"];
    if (!v9)
    {
      long long v10 = THBundle();
      long long v11 = (objc_class *)objc_opt_class();
      long long v12 = NSStringFromClass(v11);
      double v13 = [v10 loadNibNamed:v12 owner:self options:0];

      long long v9 = [v13 objectAtIndex:0];
      id v14 = objc_alloc((Class)UIView);
      [(THNotesSidebarTableCell *)v9 frame];
      id v15 = [v14 initWithFrame:];
      [(THNotesSidebarTableCell *)v9 setSelectedBackgroundView:v15];

      unsigned __int8 v16 = +[UIColor bc_booksTableSelectionColor];
      id v17 = [(THNotesSidebarTableCell *)v9 selectedBackgroundView];
      [v17 setBackgroundColor:v16];

      id v18 = +[UIColor bc_booksBackground];
      [(THNotesSidebarTableCell *)v9 setBackgroundColor:v18];

      [(THNotesSidebarTableCell *)v9 setClipsToBounds:1];
      [(THNotesSidebarTableCell *)v9 setImageBorderVisible:1];
      [(THNotesSidebarTableCell *)v9 setTopBorderVisible:0];
      [(THNotesSidebarTableCell *)v9 setBottomBorderVisible:0];
    }
    long long v19 = [(THNotesSidebarViewController *)self sectionProviders];
    [v19 objectAtIndex:[self p_visibleSectionProviderIndexForIndexPath:v7]];
    id v20 = (id)objc_claimAutoreleasedReturnValue();
    [(THNotesSidebarTableCell *)v9 setSectionProvider:v20];
  }
  else
  {
    long long v19 = [v6 indexPathForSelectedRow];
    if (v19) {
      [v6 deselectRowAtIndexPath:v19 animated:0];
    }
    if ([v7 section])
    {
      long long v9 = [(THNotesSidebarViewController *)self emptyCellForTable:v6];
      goto LABEL_14;
    }
    long long v9 = [v6 dequeueReusableCellWithIdentifier:@"noResultCell"];
    if (v9) {
      goto LABEL_14;
    }
    long long v9 = [[THNotesSidebarTableCell alloc] initWithStyle:0 reuseIdentifier:@"noResultCell"];
    v24 = +[UIColor clearColor];
    [(THNotesSidebarTableCell *)v9 setBackgroundColor:v24];

    id v20 = objc_alloc_init((Class)UILabel);
    objc_super v25 = THBundle();
    CGRect v26 = [v25 localizedStringForKey:@"No Results" value:&stru_46D7E8 table:0];
    [v20 setText:v26];

    [v20 setTextAlignment:1];
    CGRect v27 = [(THNotesSidebarViewController *)self p_cellFontTextStyle];
    CGRect v28 = +[UIFont preferredFontForTextStyle:v27];
    [v20 setFont:v28];

    v29 = +[UIColor bc_booksSecondaryLabelColor];
    [v20 setTextColor:v29];

    id v30 = +[UIColor bc_booksBackground];
    [v20 setBackgroundColor:v30];

    [v20 sizeToFit];
    [v20 frame];
    double v32 = v31;
    double v34 = v33;
    v35 = [(THNotesSidebarViewController *)self tableView];
    [v35 frame];
    float v37 = (v36 - v32) * 0.5;
    double v38 = ceilf(v37);

    [(THNotesSidebarViewController *)self p_cellHeight];
    *(float *)&double v39 = (v39 - v34) * 0.5;
    [v20 setFrame:v38, ceilf(*(float *)&v39), v32, v34];
    [(THNotesSidebarTableCell *)v9 setNoResultsLabel:v20];
    v40 = [(THNotesSidebarTableCell *)v9 contentView];
    [v40 addSubview:v20];

    [(THNotesSidebarTableCell *)v9 setImageBorderVisible:0];
    [(THNotesSidebarTableCell *)v9 setTopBorderVisible:0];
    [(THNotesSidebarTableCell *)v9 setBottomBorderVisible:1];
  }

LABEL_14:
LABEL_15:
  [(THNotesSidebarTableCell *)v9 setDelegate:self];

  return v9;
}

- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5
{
  id v25 = a3;
  id v8 = a4;
  id v9 = a5;
  long long v10 = [v8 reuseIdentifier];
  unsigned int v11 = [v10 isEqualToString:@"notesViewCell"];

  if (v11)
  {
    [(NSMutableDictionary *)self->mCellMap setObject:v8 forKey:v9];
    long long v12 = [(THNotesSidebarViewController *)self highlightedIndexPath];
    if (v12)
    {
      double v13 = [(THNotesSidebarViewController *)self highlightedIndexPath];
      BOOL v14 = [v9 compare:v13] == 0;
    }
    else
    {
      BOOL v14 = 0;
    }

    id v15 = [(THNotesSidebarViewController *)self selectedIndexPath];
    if (v15)
    {
      unsigned __int8 v16 = [(THNotesSidebarViewController *)self selectedIndexPath];
      BOOL v17 = [v9 compare:v16] == 0;
    }
    else
    {
      BOOL v17 = 0;
    }

    if (v14 || v17)
    {
      id v18 = [v25 indexPathForRowPreceedingIndexPath:v9];
      if (v18)
      {
        long long v19 = [(THNotesSidebarViewController *)self p_cellForIndexPath:v18];
        if (!v19)
        {
          id v20 = +[TSUAssertionHandler currentHandler];
          long long v21 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THNotesSidebarViewController tableView:willDisplayCell:forRowAtIndexPath:]");
          id v22 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THNotesSidebarViewController.m"];
          [v20 handleFailureInFunction:v21 file:v22 lineNumber:513 description:@"invalid nil value for '%s'", "previousCell"];
        }
        [v19 setSeparatorStyle:0];
      }
      [v8 setSeparatorStyle:0];
    }
    else
    {
      [v8 setSeparatorStyle:[v25 separatorStyle]];
    }
    double v23 = [(THNotesSidebarViewController *)self sidebarDelegate];
    unsigned int v24 = [v23 isCollapsedForSidebarContentViewController:self];

    [v8 setAccessoryType:v24];
  }
}

- (void)tableView:(id)a3 didEndDisplayingCell:(id)a4 forRowAtIndexPath:(id)a5
{
}

- (id)tableView:(id)a3 willSelectRowAtIndexPath:(id)a4
{
  id v5 = a4;
  if (((unint64_t)[v5 section] & 0x8000000000000000) != 0
    || (id v6 = [v5 section],
        v6 >= [(NSMutableIndexSet *)self->mVisibleSectionProviderIndicies count]))
  {
    id v7 = 0;
  }
  else
  {
    id v7 = v5;
  }

  return v7;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v10 = a4;
  id v5 = [v10 row];
  if (v5 < [(NSMutableIndexSet *)self->mVisibleSectionProviderIndicies count])
  {
    [(THNotesSidebarViewController *)self setProviderIndex:[(THNotesSidebarViewController *)self p_visibleSectionProviderIndexForIndexPath:v10]];
    id v6 = [(THNotesSidebarViewController *)self sectionProviders];
    id v7 = [v6 objectAtIndex:[self providerIndex]];

    id v8 = [(THNotesSidebarViewController *)self sidebarDelegate];
    [v8 sidebarContentViewController:self willSelectSectionProvider:v7];

    id v9 = [(THNotesSidebarViewController *)self searchBar];
    [v9 resignFirstResponder];
  }
}

- (BOOL)tableView:(id)a3 canEditRowAtIndexPath:(id)a4
{
  return 0;
}

- (int64_t)tableView:(id)a3 editingStyleForRowAtIndexPath:(id)a4
{
  return 0;
}

- (void)notesSidebarCell:(id)a3 highlightDidChange:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v6 = [(THNotesSidebarViewController *)self p_indexPathForCell:a3];
  id v11 = (id)v6;
  if (v4) {
    uint64_t v7 = v6;
  }
  else {
    uint64_t v7 = 0;
  }
  [(THNotesSidebarViewController *)self setHighlightedIndexPath:v7];
  id v8 = v11;
  if (v11)
  {
    [(THNotesSidebarViewController *)self p_setSeparatorsHidden:v4 forCellAtIndexPath:v11];
    id v9 = [(THNotesSidebarViewController *)self selectedIndexPath];

    id v8 = v11;
    if (v9)
    {
      id v10 = [(THNotesSidebarViewController *)self selectedIndexPath];
      [(THNotesSidebarViewController *)self p_setSeparatorsHidden:1 forCellAtIndexPath:v10];

      id v8 = v11;
    }
  }
}

- (void)notesSidebarCell:(id)a3 selectionDidChange:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v6 = [(THNotesSidebarViewController *)self p_indexPathForCell:a3];
  id v11 = (id)v6;
  if (v4)
  {
    if (!v6)
    {
      id v9 = [(THNotesSidebarViewController *)self tableView];
      id v10 = [v9 indexPathForSelectedRow];
      [(THNotesSidebarViewController *)self setSelectedIndexPath:v10];

      goto LABEL_8;
    }
    [(THNotesSidebarViewController *)self setSelectedIndexPath:v6];
  }
  else
  {
    [(THNotesSidebarViewController *)self setSelectedIndexPath:0];
    uint64_t v7 = v11;
    if (!v11) {
      goto LABEL_9;
    }
  }
  [(THNotesSidebarViewController *)self p_setSeparatorsHidden:v4 forCellAtIndexPath:v11];
  id v8 = [(THNotesSidebarViewController *)self highlightedIndexPath];

  uint64_t v7 = v11;
  if (!v8) {
    goto LABEL_9;
  }
  id v9 = [(THNotesSidebarViewController *)self highlightedIndexPath];
  [(THNotesSidebarViewController *)self p_setSeparatorsHidden:1 forCellAtIndexPath:v9];
LABEL_8:

  uint64_t v7 = v11;
LABEL_9:
}

- (NSString)searchText
{
  objc_super v2 = [(THNotesSidebarViewController *)self searchBar];
  id v3 = [v2 text];

  return (NSString *)v3;
}

- (void)keyboardDidShow:(id)a3
{
  if (([(THNotesSidebarViewController *)self im_isCompactHeight] & 1) == 0)
  {
    id v4 = [(THNotesSidebarViewController *)self tableView];
    [v4 scrollToNearestSelectedRowAtScrollPosition:0 animated:1];
  }
}

- (UITableView)tableView
{
  return self->mNotesTableView;
}

- (void)setTableView:(id)a3
{
}

- (THNotesSidebarDelegate)sidebarDelegate
{
  return self->mSidebarDelegate;
}

- (void)setSidebarDelegate:(id)a3
{
  self->mSidebarDelegate = (THNotesSidebarDelegate *)a3;
}

- (BOOL)shouldDismissAfterRotate
{
  return self->mShouldDismissAfterRotate;
}

- (UISearchBar)searchBar
{
  return self->mSearchBar;
}

- (void)setSearchBar:(id)a3
{
}

- (unint64_t)providerIndex
{
  return self->mProviderIndex;
}

- (NSArray)sectionProviders
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->mSectionProviders);

  return (NSArray *)WeakRetained;
}

- (NSIndexPath)selectedIndexPath
{
  return self->mSelectedIndexPath;
}

- (void)setSelectedIndexPath:(id)a3
{
}

- (NSIndexPath)highlightedIndexPath
{
  return self->mHighlightedIndexPath;
}

- (void)setHighlightedIndexPath:(id)a3
{
}

- (UIView)searchBarSeparator
{
  return self->_searchBarSeparator;
}

- (void)setSearchBarSeparator:(id)a3
{
}

- (NSLayoutConstraint)searchbarHeightConstraint
{
  return self->_searchbarHeightConstraint;
}

- (void)setSearchbarHeightConstraint:(id)a3
{
}

- (UITableViewController)notesTableViewController
{
  return self->_notesTableViewController;
}

- (void)setNotesTableViewController:(id)a3
{
}

- (double)cellHeight
{
  return self->_cellHeight;
}

- (void)setCellHeight:(double)a3
{
  self->_cellHeight = a3;
}

- (BOOL)cellHeightValid
{
  return self->_cellHeightValid;
}

- (void)setCellHeightValid:(BOOL)a3
{
  self->_cellHeightValid = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_notesTableViewController, 0);
  objc_storeStrong((id *)&self->_searchbarHeightConstraint, 0);
  objc_storeStrong((id *)&self->_searchBarSeparator, 0);
  objc_destroyWeak((id *)&self->mSectionProviders);
  objc_storeStrong((id *)&self->mSearchBar, 0);
  objc_storeStrong((id *)&self->mNotesTableView, 0);
  objc_storeStrong((id *)&self->mCellMap, 0);
  objc_storeStrong((id *)&self->mHighlightedIndexPath, 0);
  objc_storeStrong((id *)&self->mSelectedIndexPath, 0);

  objc_storeStrong((id *)&self->mVisibleSectionProviderIndicies, 0);
}

@end