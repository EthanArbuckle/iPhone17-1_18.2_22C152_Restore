@interface SUTableViewController
- (BOOL)canSelectRowAtIndexPath:(id)a3;
- (BOOL)deleteRowAtIndexPath:(id)a3;
- (BOOL)handleSelectionForIndexPath:(id)a3 tapCount:(int64_t)a4;
- (BOOL)indexPathIsPlaceholder:(id)a3;
- (SUTableDataSource)dataSource;
- (SUTableViewController)init;
- (UITableView)tableView;
- (double)tableView:(id)a3 heightForFooterInSection:(int64_t)a4;
- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4;
- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4;
- (id)copyArchivableContext;
- (id)copyDefaultScriptProperties;
- (id)copyScriptProperties;
- (id)newTableView;
- (id)sectionIndexTitlesForTableView:(id)a3;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 titleForDeleteConfirmationButtonForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4;
- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4;
- (id)tableView:(id)a3 willSelectRowAtIndexPath:(id)a4;
- (int)clippedCornersForIndexPath:(id)a3;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 editingStyleForRowAtIndexPath:(id)a4;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (int64_t)tableView:(id)a3 sectionForSectionIndexTitle:(id)a4 atIndex:(int64_t)a5;
- (int64_t)tableViewStyle;
- (unint64_t)numberOfRows;
- (void)_deliverTapCount:(int64_t)a3 forIndexPath:(id)a4;
- (void)_doubleTapTimeout;
- (void)_reloadPlaceholderCells;
- (void)_resetTableView;
- (void)dealloc;
- (void)didReceiveMemoryWarning;
- (void)loadView;
- (void)reloadData;
- (void)scrollToRowAtIndexPath:(id)a3 atScrollPosition:(int64_t)a4 animated:(BOOL)a5;
- (void)scrollViewDidEndDecelerating:(id)a3;
- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4;
- (void)scrollViewWillBeginDragging:(id)a3;
- (void)setDataSource:(id)a3;
- (void)setScriptProperties:(id)a3;
- (void)setTableViewStyle:(int64_t)a3;
- (void)tableView:(id)a3 commitEditingStyle:(int64_t)a4 forRowAtIndexPath:(id)a5;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)willAnimateRotationToInterfaceOrientation:(int64_t)a3 duration:(double)a4;
@end

@implementation SUTableViewController

- (SUTableViewController)init
{
  v5.receiver = self;
  v5.super_class = (Class)SUTableViewController;
  v2 = [(SUViewController *)&v5 init];
  v3 = v2;
  if (v2) {
    v2->_disappearOrientation = [(SUViewController *)v2 interfaceOrientation];
  }
  return v3;
}

- (void)dealloc
{
  [(SUTableDataSource *)self->_dataSource setCellReuseSource:0];

  self->_dataSource = 0;
  self->_firstTapIndexPath = 0;
  [(SUTableView *)self->_tableView setDataSource:0];
  [(SUTableView *)self->_tableView setDelegate:0];

  self->_tableView = 0;
  v3.receiver = self;
  v3.super_class = (Class)SUTableViewController;
  [(SUViewController *)&v3 dealloc];
}

- (BOOL)canSelectRowAtIndexPath:(id)a3
{
  return 1;
}

- (int)clippedCornersForIndexPath:(id)a3
{
  if (self->_tableViewStyle != 1) {
    return 0;
  }
  uint64_t v5 = [a3 row];
  if (v5 == -[SUTableDataSource numberOfRowsInSection:](self->_dataSource, "numberOfRowsInSection:", [a3 section])- 1)return (v5 == 0) | 4; {
  else
  }
    return v5 == 0;
}

- (BOOL)deleteRowAtIndexPath:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  uint64_t v5 = [(SUTableDataSource *)self->_dataSource numberOfSections];
  BOOL v6 = [(SUTableDataSource *)self->_dataSource deleteIndexPath:a3];
  if (v6)
  {
    v7 = [(SUTableViewController *)self tableView];
    [(SUTableViewController *)self reloadForChangedRowCount:[(SUTableViewController *)self numberOfRows] - 1];
    [(UITableView *)v7 beginUpdates];
    if (v5 >= 2 && v5 > [(SUTableDataSource *)self->_dataSource numberOfSections]) {
      -[UITableView deleteSections:withRowAnimation:](v7, "deleteSections:withRowAnimation:", objc_msgSend(MEMORY[0x263F088D0], "indexSetWithIndex:", objc_msgSend(a3, "section")), 1);
    }
    -[UITableView deleteRowsAtIndexPaths:withRowAnimation:](v7, "deleteRowsAtIndexPaths:withRowAnimation:", objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:", a3, 0), 1);
    [(UITableView *)v7 endUpdates];
    v8 = [(UITableView *)v7 indexPathsForVisibleRows];
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    uint64_t v9 = [(NSArray *)v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v15;
      do
      {
        uint64_t v12 = 0;
        do
        {
          if (*(void *)v15 != v11) {
            objc_enumerationMutation(v8);
          }
          [(SUTableDataSource *)self->_dataSource configureCell:[(UITableView *)v7 cellForRowAtIndexPath:*(void *)(*((void *)&v14 + 1) + 8 * v12)] forIndexPath:*(void *)(*((void *)&v14 + 1) + 8 * v12)];
          ++v12;
        }
        while (v10 != v12);
        uint64_t v10 = [(NSArray *)v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v10);
    }
  }
  return v6;
}

- (BOOL)handleSelectionForIndexPath:(id)a3 tapCount:(int64_t)a4
{
  return 0;
}

- (BOOL)indexPathIsPlaceholder:(id)a3
{
  if (self->_placeholderRowCount < 1) {
    return 0;
  }
  int64_t v5 = [(SUTableViewController *)self numberOfSectionsInTableView:self->_tableView];
  if ([a3 section] != v5 - 1) {
    return 0;
  }
  int64_t v6 = -[SUTableViewController tableView:numberOfRowsInSection:](self, "tableView:numberOfRowsInSection:", self->_tableView, [a3 section]);
  return [a3 row] >= v6 - self->_placeholderRowCount;
}

- (id)newTableView
{
  objc_super v3 = [SUTableView alloc];
  objc_msgSend((id)-[SUTableViewController view](self, "view"), "bounds");
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  int64_t v12 = [(SUTableViewController *)self tableViewStyle];

  return -[SUTableView initWithFrame:style:](v3, "initWithFrame:style:", v12, v5, v7, v9, v11);
}

- (void)reloadData
{
  [(SUTableDataSource *)self->_dataSource reloadData];
  -[SUTableView setAllowsHeaderAndFooterToFloat:](self->_tableView, "setAllowsHeaderAndFooterToFloat:", objc_msgSend(-[SUTableViewController sectionIndexTitlesForTableView:](self, "sectionIndexTitlesForTableView:", self->_tableView), "count") != 0);
  [(SUTableView *)self->_tableView reloadData];
  [(SUTableViewController *)self _reloadPlaceholderCells];
  if ([(SUTableDataSource *)self->_dataSource numberOfSections] >= 1)
  {
    objc_super v3 = [(SUViewControllerContext *)[(SUViewController *)self _restoredContext] valueForMetadataKey:@"offset"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      CGPoint v4 = CGPointFromString(v3);
      [(SUTableView *)self->_tableView contentOffset];
      if (v4.x != v6 || v4.y != v5)
      {
        [(SUTableView *)self->_tableView contentSize];
        double v9 = v8;
        [(SUTableView *)self->_tableView frame];
        if (v4.y <= v9 - v10)
        {
          -[SUTableView setContentOffset:](self->_tableView, "setContentOffset:", v4.x, v4.y);
          [(SUTableView *)self->_tableView flashScrollIndicators];
        }
      }
    }
    [(SUViewController *)self resetRestoredContext];
  }
  unint64_t v11 = [(SUTableViewController *)self numberOfRows];

  [(SUTableViewController *)self reloadForChangedRowCount:v11];
}

- (void)scrollToRowAtIndexPath:(id)a3 atScrollPosition:(int64_t)a4 animated:(BOOL)a5
{
  BOOL v5 = a5;
  double v8 = [(SUTableViewController *)self tableView];
  [(UITableView *)v8 scrollToRowAtIndexPath:a3 atScrollPosition:1 animated:v5];
  uint64_t v9 = [(UITableView *)v8 delegate];
  if (a4 == 1)
  {
    double v10 = (void *)v9;
    if (objc_opt_respondsToSelector())
    {
      [v10 tableView:v8 heightForHeaderInSection:0];
      if (v11 > 0.00000011920929)
      {
        [(UITableView *)v8 contentOffset];
        -[UITableView setContentOffset:animated:](v8, "setContentOffset:animated:", v5);
      }
    }
  }
}

- (void)setTableViewStyle:(int64_t)a3
{
  if (self->_tableViewStyle != a3)
  {
    self->_tableViewStyle = a3;
    [(SUTableViewController *)self _resetTableView];
  }
}

- (id)copyArchivableContext
{
  v7.receiver = self;
  v7.super_class = (Class)SUTableViewController;
  id v3 = [(SUViewController *)&v7 copyArchivableContext];
  if (![(SUViewController *)self shouldExcludeFromNavigationHistory])
  {
    tableView = self->_tableView;
    if (tableView)
    {
      [(SUTableView *)tableView contentOffset];
      BOOL v5 = NSStringFromCGPoint(v8);
LABEL_6:
      [v3 setValue:v5 forMetadataKey:@"offset"];
      return v3;
    }
    if ([(SUViewController *)self _restoredContext])
    {
      BOOL v5 = [(SUViewControllerContext *)[(SUViewController *)self _restoredContext] valueForMetadataKey:@"offset"];
      goto LABEL_6;
    }
  }
  return v3;
}

- (id)copyDefaultScriptProperties
{
  v4.receiver = self;
  v4.super_class = (Class)SUTableViewController;
  id v2 = [(SUViewController *)&v4 copyDefaultScriptProperties];
  [v2 setScrollingDisabled:0];
  [v2 setShowsBackgroundShadow:0];
  return v2;
}

- (id)copyScriptProperties
{
  id v3 = [(SUTableViewController *)self copyDefaultScriptProperties];
  tableView = self->_tableView;
  if (tableView)
  {
    objc_msgSend(v3, "setBackgroundColor:", -[SUTableView backgroundColor](tableView, "backgroundColor"));
    objc_msgSend(v3, "setScrollingDisabled:", -[SUTableView isScrollEnabled](self->_tableView, "isScrollEnabled") ^ 1);
    objc_msgSend(v3, "setShowsBackgroundShadow:", -[SUTableView _showsBackgroundShadow](self->_tableView, "_showsBackgroundShadow"));
    objc_msgSend(v3, "setTopExtensionColor:", -[UIScrollView topExtensionViewColor](self->_tableView, "topExtensionViewColor"));
  }
  return v3;
}

- (void)didReceiveMemoryWarning
{
  [(SUTableDataSource *)self->_dataSource resetCaches];
  v3.receiver = self;
  v3.super_class = (Class)SUTableViewController;
  [(SUViewController *)&v3 didReceiveMemoryWarning];
}

- (void)loadView
{
  v3.receiver = self;
  v3.super_class = (Class)SUTableViewController;
  [(SUViewController *)&v3 loadView];
  self->_preferUserInteractionWhileScrolling = MGGetBoolAnswer() ^ 1;
  [(SUTableViewController *)self _resetTableView];
  [(SUTableViewController *)self reloadData];
}

- (void)setScriptProperties:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SUTableViewController;
  -[SUViewController setScriptProperties:](&v5, sel_setScriptProperties_);
  if ([a3 backgroundColor]) {
    -[SUTableView setBackgroundColor:](self->_tableView, "setBackgroundColor:", [a3 backgroundColor]);
  }
  -[SUTableView setScrollEnabled:](self->_tableView, "setScrollEnabled:", [a3 isScrollingDisabled] ^ 1);
  -[SUTableView _setShowsBackgroundShadow:](self->_tableView, "_setShowsBackgroundShadow:", [a3 showsBackgroundShadow]);
  if ([a3 topExtensionColor]) {
    -[UIScrollView setTopExtensionViewColor:](self->_tableView, "setTopExtensionViewColor:", [a3 topExtensionColor]);
  }
}

- (void)viewDidAppear:(BOOL)a3
{
  BOOL v3 = a3;
  [(SUTableView *)self->_tableView flashScrollIndicators];
  v5.receiver = self;
  v5.super_class = (Class)SUTableViewController;
  [(SUViewController *)&v5 viewDidAppear:v3];
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  int64_t disappearOrientation = self->_disappearOrientation;
  if (disappearOrientation == objc_msgSend((id)objc_msgSend(MEMORY[0x263F1C408], "sharedApplication"), "statusBarOrientation"))
  {
    [(SUTableViewController *)self _reloadPlaceholderCells];
    [(SUTableView *)self->_tableView deselectRowAtIndexPath:[(SUTableView *)self->_tableView indexPathForSelectedRow] animated:v3];
  }
  else
  {
    [(SUTableDataSource *)self->_dataSource resetLayoutCaches];
    [(SUTableViewController *)self reloadData];
  }
  v6.receiver = self;
  v6.super_class = (Class)SUTableViewController;
  [(SUViewController *)&v6 viewWillAppear:v3];
}

- (void)viewWillDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  self->_int64_t disappearOrientation = objc_msgSend((id)objc_msgSend(MEMORY[0x263F1C408], "sharedApplication"), "statusBarOrientation");
  [MEMORY[0x263F8C6D0] cancelPreviousPerformRequestsWithTarget:self selector:sel__doubleTapTimeout object:0];
  v5.receiver = self;
  v5.super_class = (Class)SUTableViewController;
  [(SUViewController *)&v5 viewWillDisappear:v3];
}

- (void)willAnimateRotationToInterfaceOrientation:(int64_t)a3 duration:(double)a4
{
  [(SUTableDataSource *)self->_dataSource resetLayoutCaches];
  [(SUTableViewController *)self reloadData];
  v7.receiver = self;
  v7.super_class = (Class)SUTableViewController;
  [(SUViewController *)&v7 willAnimateRotationToInterfaceOrientation:a3 duration:a4];
}

- (unint64_t)numberOfRows
{
  id v2 = [(SUTableViewController *)self tableView];
  uint64_t v3 = [(UITableView *)v2 numberOfSections];
  if (!v3) {
    return 0;
  }
  uint64_t v4 = v3;
  unint64_t v5 = 0;
  for (uint64_t i = 0; i != v4; ++i)
    v5 += [(UITableView *)v2 numberOfRowsInSection:i];
  return v5;
}

- (void)setDataSource:(id)a3
{
  dataSource = self->_dataSource;
  if (dataSource != a3)
  {
    [(SUTableDataSource *)dataSource setCellReuseSource:0];

    objc_super v6 = (SUTableDataSource *)a3;
    self->_dataSource = v6;
    [(SUTableDataSource *)v6 setCellReuseSource:self->_tableView];
    objc_super v7 = self->_dataSource;
    if (v7)
    {
      uint64_t v8 = [(SUTableDataSource *)v7 tableViewStyle];
      [(SUTableViewController *)self setTableViewStyle:v8];
    }
  }
}

- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4
{
  if (!a4 && self->_preferUserInteractionWhileScrolling) {
    [(SUTableDataSource *)self->_dataSource endPreferringUserInteraction];
  }
}

- (void)scrollViewDidEndDecelerating:(id)a3
{
  if (self->_preferUserInteractionWhileScrolling) {
    [(SUTableDataSource *)self->_dataSource endPreferringUserInteraction];
  }
}

- (void)scrollViewWillBeginDragging:(id)a3
{
  if (self->_preferUserInteractionWhileScrolling) {
    [(SUTableDataSource *)self->_dataSource beginPreferringUserInteraction];
  }
}

- (id)sectionIndexTitlesForTableView:(id)a3
{
  return [(SUTableDataSource *)self->_dataSource sectionIndexTitles];
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  BOOL v6 = [(SUTableViewController *)self indexPathIsPlaceholder:a4];
  dataSource = self->_dataSource;
  if (v6) {
    id v8 = [(SUTableDataSource *)dataSource placeholderCellForIndexPath:a4];
  }
  else {
    id v8 = [(SUTableDataSource *)dataSource cellForIndexPath:a4];
  }
  uint64_t v9 = v8;
  objc_msgSend(v8, "setClipCorners:", -[SUTableViewController clippedCornersForIndexPath:](self, "clippedCornersForIndexPath:", a4));
  return v9;
}

- (void)tableView:(id)a3 commitEditingStyle:(int64_t)a4 forRowAtIndexPath:(id)a5
{
  if (a4 == 1) {
    [(SUTableViewController *)self deleteRowAtIndexPath:a5];
  }
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  int64_t v7 = [(SUTableDataSource *)self->_dataSource numberOfRowsInSection:a4];
  int64_t v8 = [(SUTableViewController *)self numberOfSectionsInTableView:a3];
  int64_t placeholderRowCount = self->_placeholderRowCount;
  if (v8 - 1 != a4 || placeholderRowCount <= 0) {
    int64_t placeholderRowCount = 0;
  }
  return placeholderRowCount + v7;
}

- (int64_t)tableView:(id)a3 sectionForSectionIndexTitle:(id)a4 atIndex:(int64_t)a5
{
  return [(SUTableDataSource *)self->_dataSource sectionIndexForIndexTitle:a4 atIndex:a5];
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  return [(SUTableDataSource *)self->_dataSource titleForHeaderInSection:a4];
}

- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5
{
  BOOL v8 = [(SUTableViewController *)self indexPathIsPlaceholder:a5];
  dataSource = self->_dataSource;
  if (v8) {
    [(SUTableDataSource *)dataSource configurePlaceholderCell:a4 forIndexPath:a5];
  }
  else {
    [(SUTableDataSource *)dataSource configureCell:a4 forIndexPath:a5];
  }
  double v10 = (void *)[a4 accessoryView];
  if (!v10)
  {
    uint64_t v13 = [a4 isUserInteractionEnabled];
    goto LABEL_9;
  }
  char v11 = [v10 isUserInteractionEnabled];
  uint64_t v12 = [a4 isUserInteractionEnabled];
  if (v12 && (v11 & 1) == 0)
  {
    uint64_t v13 = [(SUTableViewController *)self canSelectRowAtIndexPath:a5];
LABEL_9:
    uint64_t v12 = v13;
  }

  [a4 setUserInteractionEnabled:v12];
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  int64_t result = [(SUTableDataSource *)self->_dataSource numberOfSections];
  if (result <= 1) {
    return 1;
  }
  return result;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  [MEMORY[0x263F8C6D0] cancelPreviousPerformRequestsWithTarget:self selector:sel__doubleTapTimeout object:0];
  int64_t v7 = self->_firstTapIndexPath;

  self->_firstTapIndexPath = 0;
  if (v7 && ([(NSIndexPath *)v7 isEqual:a4] & 1) != 0)
  {
    uint64_t v6 = 2;
  }
  else
  {
    if ([(SUTableDataSource *)self->_dataSource canDoubleTapIndexPath:a4])
    {
      self->_firstTapIndexPath = (NSIndexPath *)a4;
      [(SUTableViewController *)self performSelector:sel__doubleTapTimeout withObject:0 afterDelay:0.349999994];
      goto LABEL_8;
    }
    uint64_t v6 = 1;
  }
  [(SUTableViewController *)self _deliverTapCount:v6 forIndexPath:a4];
LABEL_8:
}

- (int64_t)tableView:(id)a3 editingStyleForRowAtIndexPath:(id)a4
{
  if ([(SUTableViewController *)self indexPathIsPlaceholder:a4]) {
    return 0;
  }
  else {
    return [(SUTableDataSource *)self->_dataSource canDeleteIndexPath:a4];
  }
}

- (double)tableView:(id)a3 heightForFooterInSection:(int64_t)a4
{
  [(SUTableDataSource *)self->_dataSource heightForFooterInSection:a4];
  return result;
}

- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4
{
  id v7 = [(SUTableDataSource *)self->_dataSource headerViewForSection:a4];
  if (v7)
  {
    [v7 frame];
    return v8;
  }
  else if ([(SUTableDataSource *)self->_dataSource titleForHeaderInSection:a4])
  {
    [a3 sectionHeaderHeight];
  }
  else
  {
    return *MEMORY[0x263F1D600];
  }
  return result;
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  if (self->_dataSource)
  {
    BOOL v6 = [(SUTableViewController *)self indexPathIsPlaceholder:a4];
    dataSource = self->_dataSource;
    if (v6) {
      [(SUTableDataSource *)dataSource heightForPlaceholderCells];
    }
    else {
      [(SUTableDataSource *)dataSource cellHeightForIndexPath:a4];
    }
  }
  else
  {
    double v8 = 45.0;
  }
  return fmax(v8, 1.0);
}

- (id)tableView:(id)a3 titleForDeleteConfirmationButtonForRowAtIndexPath:(id)a4
{
  return [(SUTableDataSource *)self->_dataSource titleForDeleteConfirmationForIndexPath:a4];
}

- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4
{
  return [(SUTableDataSource *)self->_dataSource headerViewForSection:a4];
}

- (id)tableView:(id)a3 willSelectRowAtIndexPath:(id)a4
{
  BOOL v6 = (void *)[a3 cellForRowAtIndexPath:a4];
  if (!v6 || [v6 isUserInteractionEnabled])
  {
    dataSource = self->_dataSource;
    if (!dataSource || [(SUTableDataSource *)dataSource canSelectIndexPath:a4])
    {
      BOOL v8 = [(SUTableViewController *)self canSelectRowAtIndexPath:a4];
      if (a4)
      {
        if (v8) {
          return a4;
        }
      }
    }
  }
  double v10 = (void *)MEMORY[0x263F088C8];

  return (id)[v10 indexPathForRow:0x7FFFFFFFFFFFFFFFLL inSection:0x7FFFFFFFFFFFFFFFLL];
}

- (void)_doubleTapTimeout
{
  if (self->_firstTapIndexPath)
  {
    -[SUTableViewController _deliverTapCount:forIndexPath:](self, "_deliverTapCount:forIndexPath:", 1);

    self->_firstTapIndexPath = 0;
  }
}

- (void)_deliverTapCount:(int64_t)a3 forIndexPath:(id)a4
{
  if (![(SUTableViewController *)self handleSelectionForIndexPath:a4 tapCount:a3])
  {
    BOOL v6 = [(SUTableViewController *)self tableView];
    [(UITableView *)v6 deselectRowAtIndexPath:a4 animated:1];
  }
}

- (void)_reloadPlaceholderCells
{
  tableView = self->_tableView;
  if (tableView)
  {
    [(SUTableView *)tableView bounds];
    double v5 = v4;
  }
  else
  {
    double v5 = *(double *)(MEMORY[0x263F001A8] + 24);
  }
  if (v5 > 0.00000011920929)
  {
    int64_t placeholderRowCount = self->_placeholderRowCount;
    dataSource = self->_dataSource;
    if (dataSource)
    {
      [(SUTableDataSource *)dataSource heightForPlaceholderCells];
      double v9 = v8;
    }
    else
    {
      double v9 = -1.0;
    }
    double v10 = self->_tableView;
    if (v10) {
      [(SUTableView *)v10 contentSize];
    }
    else {
      double v11 = *(double *)(MEMORY[0x263F001B0] + 8);
    }
    double v12 = floor(v9 * (double)placeholderRowCount);
    if (v9 <= 0.00000011920929) {
      double v12 = 0.0;
    }
    double v13 = v11 - v12;
    if (v13 >= v5 || v9 < 0.00000011920929) {
      int64_t v15 = 0;
    }
    else {
      int64_t v15 = vcvtmd_s64_f64((v5 - v13) / v9);
    }
    if (self->_placeholderRowCount != v15)
    {
      self->_int64_t placeholderRowCount = v15;
      long long v16 = self->_tableView;
      [(SUTableView *)v16 reloadData];
    }
  }
}

- (void)_resetTableView
{
  if (self->_tableView)
  {
    [(SUTableDataSource *)self->_dataSource setCellReuseSource:0];
    [(SUTableView *)self->_tableView setDataSource:0];
    [(SUTableView *)self->_tableView setDelegate:0];
    [(SUTableView *)self->_tableView removeFromSuperview];

    self->_tableView = 0;
  }
  if ([(SUTableViewController *)self isViewLoaded])
  {
    uint64_t v3 = [(SUTableViewController *)self newTableView];
    self->_tableView = v3;
    [(SUTableView *)v3 setAutoresizingMask:18];
    [(SUTableView *)self->_tableView setDataSource:self];
    [(SUTableView *)self->_tableView setDelegate:self];
    [(SUTableDataSource *)self->_dataSource setCellReuseSource:self->_tableView];
    double v4 = (void *)[(SUTableViewController *)self view];
    tableView = self->_tableView;
    [v4 addSubview:tableView];
  }
}

- (SUTableDataSource)dataSource
{
  return self->_dataSource;
}

- (UITableView)tableView
{
  return &self->_tableView->super;
}

- (int64_t)tableViewStyle
{
  return self->_tableViewStyle;
}

@end