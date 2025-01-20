@interface THGlossaryTermsViewController
+ (id)newViewController;
- (BOOL)hasDoneLayout;
- (BOOL)isSearching;
- (BOOL)shouldHighlightWord:(id)a3;
- (BOOL)tableView:(id)a3 canEditRowAtIndexPath:(id)a4;
- (BOOL)tableView:(id)a3 canMoveRowAtIndexPath:(id)a4;
- (CGRect)tableView:(id)a3 frameForSectionIndexGivenProposedFrame:(CGRect)a4;
- (NSLayoutConstraint)dividerHeightConstraint;
- (NSLayoutConstraint)searchBarBottomConstraint;
- (NSLayoutConstraint)searchBarTopConstraint;
- (NSString)searchString;
- (THFloatingHeaderController)floatingHeaderController;
- (THGlossaryController)glossaryController;
- (THGlossaryIndex)glossaryIndex;
- (THGlossaryNavigationDelegate)navigationDelegate;
- (THGlossaryTermsViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (UISearchBar)searchBar;
- (UITableView)tableView;
- (UIView)dividerView;
- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4;
- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4;
- (id)didLayoutBlock;
- (id)layerForFloatingHeaderAtIndex:(unint64_t)a3 forController:(id)a4;
- (id)p_activeTableView;
- (id)p_constraintsOfSeparatorInCell:(id)a3 tableView:(id)a4 indexPath:(id)a5;
- (id)p_previousCellForTableView:(id)a3 indexPath:(id)a4;
- (id)sectionIndexTitlesForTableView:(id)a3;
- (id)selectedEntry;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4;
- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4;
- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4;
- (id)tableView:(id)a3 willSelectRowAtIndexPath:(id)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)overrideUserInterfaceStyle;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (int64_t)tableView:(id)a3 sectionForSectionIndexTitle:(id)a4 atIndex:(int64_t)a5;
- (unint64_t)numberOfFloatingHeaders:(id)a3;
- (unint64_t)numberOfRowsForFloatingHeaderAtIndex:(unint64_t)a3 forController:(id)a4;
- (unint64_t)rowNumberForFloatingHeaderAtIndex:(unint64_t)a3 forController:(id)a4;
- (void)_styleForTheme;
- (void)clearSearch;
- (void)dealloc;
- (void)dismissSearchKeyboard:(id)a3;
- (void)glossaryTermTableCell:(id)a3 selected:(BOOL)a4;
- (void)scrollToEntry:(id)a3 scrollPosition:(int64_t)a4;
- (void)scrollViewDidScroll:(id)a3;
- (void)searchBar:(id)a3 textDidChange:(id)a4;
- (void)searchBarCancelButtonClicked:(id)a3;
- (void)searchBarSearchButtonClicked:(id)a3;
- (void)searchBarTextDidBeginEditing:(id)a3;
- (void)searchBarTextDidEndEditing:(id)a3;
- (void)selectEntry:(id)a3 scrollPosition:(int64_t)a4 animated:(BOOL)a5;
- (void)setDidLayoutBlock:(id)a3;
- (void)setDividerHeightConstraint:(id)a3;
- (void)setDividerView:(id)a3;
- (void)setFloatingHeaderController:(id)a3;
- (void)setGlossaryController:(id)a3;
- (void)setHasDoneLayout:(BOOL)a3;
- (void)setNavigationDelegate:(id)a3;
- (void)setSearchBar:(id)a3;
- (void)setSearchBarBottomConstraint:(id)a3;
- (void)setSearchBarTopConstraint:(id)a3;
- (void)setSearchString:(id)a3;
- (void)setTableView:(id)a3;
- (void)setTheme:(id)a3;
- (void)tableView:(id)a3 didHighlightRowAtIndexPath:(id)a4;
- (void)tableView:(id)a3 didUnhighlightRowAtIndexPath:(id)a4;
- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewSafeAreaInsetsDidChange;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation THGlossaryTermsViewController

+ (id)newViewController
{
  v2 = [THGlossaryTermsViewController alloc];

  return [(THGlossaryTermsViewController *)v2 initWithNibName:0 bundle:0];
}

- (THGlossaryTermsViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  uint64_t v6 = THBundle();
  v9.receiver = self;
  v9.super_class = (Class)THGlossaryTermsViewController;
  v7 = [(THGlossaryTermsViewController *)&v9 initWithNibName:a3 bundle:v6];
  if (v7)
  {
    [(THGlossaryTermsViewController *)v7 setTheme:+[IMTheme themeWithIdentifier:kIMThemeIdentifierDynamicTheme]];
    [(THGlossaryTermsViewController *)v7 registerForTraitChanges:+[UITraitCollection bc_allAPITraits] withAction:"_traitCollectionDidChange:previousTraitCollection:"];
  }
  return v7;
}

- (void)dealloc
{
  [+[NSNotificationCenter defaultCenter] removeObserver:self];
  [(THGlossaryTermsViewController *)self setDidLayoutBlock:0];

  self->_searchString = 0;
  self->_glossaryIndex = 0;
  [(THFloatingHeaderController *)self->_floatingHeaderController setDelegate:0];
  [(THFloatingHeaderController *)self->_floatingHeaderController setTableView:0];

  self->_floatingHeaderController = 0;
  [(UISearchBar *)self->_searchBar setDelegate:0];
  v3.receiver = self;
  v3.super_class = (Class)THGlossaryTermsViewController;
  [(THGlossaryTermsViewController *)&v3 dealloc];
}

- (void)viewDidLayoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)THGlossaryTermsViewController;
  [(THGlossaryTermsViewController *)&v3 viewDidLayoutSubviews];
  [(THGlossaryTermsViewController *)self setHasDoneLayout:1];
  if ([(THGlossaryTermsViewController *)self didLayoutBlock])
  {
    (*((void (**)(void))[(THGlossaryTermsViewController *)self didLayoutBlock] + 2))();
    [(THGlossaryTermsViewController *)self setDidLayoutBlock:0];
  }
}

- (void)setTheme:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)THGlossaryTermsViewController;
  [(THGlossaryTermsViewController *)&v4 setTheme:a3];
  [(THGlossaryTermsViewController *)self _styleForTheme];
}

- (void)_styleForTheme
{
  id v3 = [[self themePage] backgroundColorForTraitEnvironment:self];
  [-[THGlossaryTermsViewController tableView](self, "tableView") setSeparatorColor:[self themePage].separatorColor];
  [(UITableView *)[(THGlossaryTermsViewController *)self tableView] setBackgroundColor:v3];
  [self view].backgroundColor = v3;
  [(UITableView *)[(THGlossaryTermsViewController *)self tableView] reloadData];
  objc_super v4 = [(THGlossaryTermsViewController *)self floatingHeaderController];

  [(THFloatingHeaderController *)v4 reloadData];
}

- (THGlossaryIndex)glossaryIndex
{
  result = self->_glossaryIndex;
  if (!result)
  {
    if ([(THGlossaryTermsViewController *)self isSearching]) {
      id v4 = +[THGlossaryIndex alphabeticalIndexForGlossary:[(THGlossaryController *)[(THGlossaryTermsViewController *)self glossaryController] model] withPrefix:self->_searchString];
    }
    else {
      id v4 = [(THGlossaryController *)[(THGlossaryTermsViewController *)self glossaryController] alphabeticalTermIndex];
    }
    result = (THGlossaryIndex *)v4;
    self->_glossaryIndex = result;
  }
  return result;
}

- (BOOL)isSearching
{
  return [(NSString *)self->_searchString length] != 0;
}

- (BOOL)shouldHighlightWord:(id)a3
{
  NSUInteger v5 = [(NSString *)self->_searchString length];
  if (v5)
  {
    id v6 = [a3 normalizedStringForSearch];
    id v7 = [(NSString *)self->_searchString normalizedStringForSearch];
    LOBYTE(v5) = [v6 hasPrefix:v7];
  }
  return v5;
}

- (void)viewDidLoad
{
  v5.receiver = self;
  v5.super_class = (Class)THGlossaryTermsViewController;
  [(THGlossaryTermsViewController *)&v5 viewDidLoad];
  [(-[THGlossaryTermsViewController view](self, "view")) setBackgroundColor:[-[THGlossaryTermsViewController themePage](self, "themePage") backgroundColorForTraitEnvironment:self]];
  [self view].setOpaque:1;
  [self view].clipsToBounds = 1;
  -[UISearchBar setPlaceholder:](-[THGlossaryTermsViewController searchBar](self, "searchBar"), "setPlaceholder:", [(id)THBundle() localizedStringForKey:@"Search" value:&stru_46D7E8 table:0]);
  [(UISearchBar *)[(THGlossaryTermsViewController *)self searchBar] setDelegate:self];
  [(UIView *)[(THGlossaryTermsViewController *)self dividerView] setBackgroundColor:+[UIColor colorWithRed:0.784313725 green:0.780392157 blue:0.8 alpha:1.0]];
  [(UITableView *)[(THGlossaryTermsViewController *)self tableView] setSectionHeaderHeight:0.0];
  [(UITableView *)[(THGlossaryTermsViewController *)self tableView] setRowHeight:44.0];
  [(UITableView *)[(THGlossaryTermsViewController *)self tableView] setSeparatorStyle:0];
  [(UITableView *)[(THGlossaryTermsViewController *)self tableView] setSectionIndexBackgroundColor:+[UIColor clearColor]];
  [(UITableView *)[(THGlossaryTermsViewController *)self tableView] setClipsToBounds:1];
  [(UITableView *)[(THGlossaryTermsViewController *)self tableView] setContentInsetAdjustmentBehavior:0];
  [(THGlossaryTermsViewController *)self setFloatingHeaderController:objc_alloc_init(THFloatingHeaderController)];
  [(THFloatingHeaderController *)[(THGlossaryTermsViewController *)self floatingHeaderController] setDelegate:self];
  [(THFloatingHeaderController *)[(THGlossaryTermsViewController *)self floatingHeaderController] setTableView:[(THGlossaryTermsViewController *)self tableView]];
  [(THFloatingHeaderController *)[(THGlossaryTermsViewController *)self floatingHeaderController] reloadData];
  TSUScreenScale();
  [(NSLayoutConstraint *)[(THGlossaryTermsViewController *)self dividerHeightConstraint] setConstant:1.0 / v3];
  id v4 = +[NSNotificationCenter defaultCenter];
  [(NSNotificationCenter *)v4 addObserver:self selector:"dismissSearchKeyboard:" name:kTHGlossaryDismissSearchNotification object:0];
}

- (void)viewWillDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)THGlossaryTermsViewController;
  [(THGlossaryTermsViewController *)&v4 viewWillDisappear:a3];
  [(UISearchBar *)[(THGlossaryTermsViewController *)self searchBar] resignFirstResponder];
}

- (void)viewSafeAreaInsetsDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)THGlossaryTermsViewController;
  [(THGlossaryTermsViewController *)&v3 viewSafeAreaInsetsDidChange];
  [(THFloatingHeaderController *)[(THGlossaryTermsViewController *)self floatingHeaderController] layoutHeaders];
}

- (void)scrollViewDidScroll:(id)a3
{
  objc_super v3 = [(THGlossaryTermsViewController *)self floatingHeaderController];

  [(THFloatingHeaderController *)v3 layoutHeaders];
}

- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4
{
  return 0.0;
}

- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4
{
  return 0;
}

- (id)p_previousCellForTableView:(id)a3 indexPath:(id)a4
{
  id result = [a3 indexPathForRowPreceedingIndexPath:a4];
  if (result)
  {
    id v6 = result;
    objc_opt_class();
    [a3 cellForRowAtIndexPath:v6];
    return (id)TSUDynamicCast();
  }
  return result;
}

- (id)tableView:(id)a3 willSelectRowAtIndexPath:(id)a4
{
  return a4;
}

- (void)tableView:(id)a3 didHighlightRowAtIndexPath:(id)a4
{
  id v4 = [(THGlossaryTermsViewController *)self p_previousCellForTableView:a3 indexPath:a4];

  [v4 setFollowingCellHighlighted:1];
}

- (void)tableView:(id)a3 didUnhighlightRowAtIndexPath:(id)a4
{
  id v4 = [(THGlossaryTermsViewController *)self p_previousCellForTableView:a3 indexPath:a4];

  [v4 setFollowingCellHighlighted:0];
}

- (CGRect)tableView:(id)a3 frameForSectionIndexGivenProposedFrame:(CGRect)a4
{
  CGFloat height = a4.size.height;
  CGFloat width = a4.size.width;
  CGFloat y = a4.origin.y;
  double x = a4.origin.x;
  unsigned int v9 = [a3 _shouldReverseLayoutDirection];
  [a3 safeAreaInsets];
  double v12 = -v11;
  if (v9) {
    double v12 = v10;
  }
  double v13 = x + v12;
  double v14 = y;
  double v15 = width;
  double v16 = height;
  result.size.CGFloat height = v16;
  result.size.CGFloat width = v15;
  result.origin.CGFloat y = v14;
  result.origin.double x = v13;
  return result;
}

- (void)glossaryTermTableCell:(id)a3 selected:(BOOL)a4
{
  BOOL v4 = a4;
  id v7 = [(THGlossaryTermsViewController *)self tableView];
  id v8 = [(THGlossaryTermsViewController *)self p_previousCellForTableView:v7 indexPath:[(UITableView *)v7 indexPathForCell:a3]];

  [v8 setFollowingCellSelected:v4];
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  objc_super v3 = [(THGlossaryTermsViewController *)self glossaryIndex];

  return [(THGlossaryIndex *)v3 numberOfSections];
}

- (BOOL)tableView:(id)a3 canEditRowAtIndexPath:(id)a4
{
  return 0;
}

- (BOOL)tableView:(id)a3 canMoveRowAtIndexPath:(id)a4
{
  return 0;
}

- (id)p_constraintsOfSeparatorInCell:(id)a3 tableView:(id)a4 indexPath:(id)a5
{
  unsigned int v7 = [(THGlossaryIndex *)[(THGlossaryTermsViewController *)self glossaryIndex] isLastInSection:a5];
  id v8 = +[NSMutableArray array];
  TSUScreenScale();
  double v10 = +[NSNumber numberWithDouble:1.0 / v9];
  if ([(THGlossaryTermsViewController *)self isSearching] | v7) {
    double v11 = &off_499180;
  }
  else {
    double v11 = &off_498F68;
  }
  id v12 = [a3 separatorView];
  double v13 = _NSDictionaryOfVariableBindings(@"leftIndent", v11, 0);
  [v8 addObjectsFromArray:+[NSLayoutConstraint constraintsWithVisualFormat:options:metrics:views:](NSLayoutConstraint, "constraintsWithVisualFormat:options:metrics:views:", @"H:|-leftIndent-[separatorView]|", 0, v13, _NSDictionaryOfVariableBindings(@"separatorView", v12, 0))];
  double v14 = _NSDictionaryOfVariableBindings(@"separatorHeight", v10, 0);
  [v8 addObjectsFromArray:+[NSLayoutConstraint constraintsWithVisualFormat:options:metrics:views:](NSLayoutConstraint, "constraintsWithVisualFormat:options:metrics:views:", @"V:[separatorView(==separatorHeight)]|", 0, v14, _NSDictionaryOfVariableBindings(@"separatorView", v12, 0))];
  return v8;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  unsigned int v7 = (THGlossaryTermTableViewCell *)[a3 dequeueReusableCellWithIdentifier:@"THGlossaryTermTableViewCell"];
  if (!v7)
  {
    unsigned int v7 = [[THGlossaryTermTableViewCell alloc] initWithStyle:0 reuseIdentifier:@"THGlossaryTermTableViewCell"];
    [(THGlossaryTermTableViewCell *)v7 setSelectionStyle:0];
    [(THLabelWithWordHighlights *)[(THGlossaryTermTableViewCell *)v7 labelWithHighlights] setTranslatesAutoresizingMaskIntoConstraints:0];
    [(THLabelWithWordHighlights *)[(THGlossaryTermTableViewCell *)v7 labelWithHighlights] setBackgroundColor:+[UIColor clearColor]];
    [(THLabelWithWordHighlights *)[(THGlossaryTermTableViewCell *)v7 labelWithHighlights] setTextFont:+[UIFont systemFontOfSize:17.0]];
    [(THLabelWithWordHighlights *)[(THGlossaryTermTableViewCell *)v7 labelWithHighlights] setHighlightedTextFont:+[UIFont boldSystemFontOfSize:17.0]];
    [(THLabelWithWordHighlights *)[(THGlossaryTermTableViewCell *)v7 labelWithHighlights] setDelegate:self];
    [(UIView *)[(THGlossaryTermTableViewCell *)v7 separatorView] setTranslatesAutoresizingMaskIntoConstraints:0];
    [(THGlossaryTermTableViewCell *)v7 setDelegate:self];
  }
  id v8 = [(THGlossaryTermsViewController *)self themePage];
  [v7 contentView].backgroundColor = [UIColor clearColor];
  -[THLabelWithWordHighlights setTextColor:](-[THGlossaryTermTableViewCell labelWithHighlights](v7, "labelWithHighlights"), "setTextColor:", [v8 primaryTextColor]);
  -[THLabelWithWordHighlights setHighlightedTextColor:](-[THGlossaryTermTableViewCell labelWithHighlights](v7, "labelWithHighlights"), "setHighlightedTextColor:", [v8 primaryTextColor]);
  -[UIView setBackgroundColor:](-[THGlossaryTermTableViewCell separatorView](v7, "separatorView"), "setBackgroundColor:", [v8 separatorColor]);
  [v7 selectedBackgroundView].backgroundColor = [v8 tableViewCellSelectedColor];
  -[THLabelWithWordHighlights setText:](-[THGlossaryTermTableViewCell labelWithHighlights](v7, "labelWithHighlights"), "setText:", objc_msgSend(-[THGlossaryIndex entryForRowAtIndexPath:](-[THGlossaryTermsViewController glossaryIndex](self, "glossaryIndex"), "entryForRowAtIndexPath:", a4), "term"));
  id v9 = +[NSMutableArray array];
  double v10 = _NSDictionaryOfVariableBindings(@"labelWithHighlights", [(THGlossaryTermTableViewCell *)v7 labelWithHighlights], 0);
  double v11 = _NSDictionaryOfVariableBindings(@"glossaryTermIndent", &off_498F68, 0);
  [v9 addObjectsFromArray:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-glossaryTermIndent-[labelWithHighlights]|" options:0x10000 metrics:v11 views:v10]];
  [v9 addObjectsFromArray:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[labelWithHighlights]|" options:0 metrics:v11 views:v10]];
  [v9 addObjectsFromArray:[self p_constraintsOfSeparatorInCell:v7 tableView:a3 indexPath:a4]];
  [(THGlossaryTermTableViewCell *)v7 removeConstraints:[(THGlossaryTermTableViewCell *)v7 constraints]];
  [(THGlossaryTermTableViewCell *)v7 addConstraints:v9];
  return v7;
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  return 44.0;
}

- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5
{
  objc_opt_class();
  uint64_t v7 = TSUDynamicCast();
  if (v7)
  {
    id v8 = (void *)v7;
    id v9 = [[-[THGlossaryTermsViewController glossaryIndex](self, "glossaryIndex") entryForRowAtIndexPath:a5] term];
    id v10 = [v8 labelWithHighlights];
    [v10 setText:v9];
  }
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  objc_super v5 = [(THGlossaryTermsViewController *)self glossaryIndex];

  return [(THGlossaryIndex *)v5 numberOfRowsInSection:a4];
}

- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4
{
  return 0;
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  objc_super v5 = [(THGlossaryTermsViewController *)self glossaryIndex];

  return [(THGlossaryIndex *)v5 titleForHeaderInSection:a4];
}

- (id)sectionIndexTitlesForTableView:(id)a3
{
  if ([(THGlossaryTermsViewController *)self isSearching]) {
    return 0;
  }
  BOOL v4 = [+[UILocalizedIndexedCollation currentCollation] sectionIndexTitles];

  return +[NSMutableArray arrayWithArray:v4];
}

- (int64_t)tableView:(id)a3 sectionForSectionIndexTitle:(id)a4 atIndex:(int64_t)a5
{
  if (a5)
  {
    if ([(THGlossaryIndex *)[(THGlossaryTermsViewController *)self glossaryIndex] numberOfEntries] < 1)
    {
      return 0;
    }
    else
    {
      id v8 = [(THGlossaryTermsViewController *)self glossaryIndex];
      return [(THGlossaryIndex *)v8 sectionForSectionIndexTitle:a4 atIndex:a5];
    }
  }
  else
  {
    [a3 scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0] atScrollPosition:3 animated:0];
    return 0x7FFFFFFFFFFFFFFFLL;
  }
}

- (id)p_activeTableView
{
  if ([(THGlossaryTermsViewController *)self isSearching]
    && [(THGlossaryTermsViewController *)self searchDisplayController])
  {
    id v3 = [(THGlossaryTermsViewController *)self searchDisplayController];
    return [v3 searchResultsTableView];
  }
  else
  {
    return [(THGlossaryTermsViewController *)self tableView];
  }
}

- (void)selectEntry:(id)a3 scrollPosition:(int64_t)a4 animated:(BOOL)a5
{
  BOOL v5 = a5;
  if ([(THGlossaryTermsViewController *)self hasDoneLayout])
  {
    id v9 = [(THGlossaryTermsViewController *)self p_activeTableView];
    if ([(THGlossaryIndex *)[(THGlossaryTermsViewController *)self glossaryIndex] indexForEntry:a3] == 0x7FFFFFFFFFFFFFFFLL)
    {
      id v10 = [v9 indexPathForSelectedRow];
      [v9 deselectRowAtIndexPath:v10 animated:0];
    }
    else
    {
      id v11 = [(THGlossaryIndex *)[(THGlossaryTermsViewController *)self glossaryIndex] indexPathForEntry:a3];
      [v9 selectRowAtIndexPath:v11 animated:v5 scrollPosition:a4];
      [v9 scrollToRowAtIndexPath:v11 atScrollPosition:a4 animated:v5];
    }
  }
  else
  {
    v13[0] = 0;
    v13[1] = v13;
    v13[2] = 0x3052000000;
    v13[3] = sub_BDC48;
    v13[4] = sub_BDC58;
    v13[5] = self;
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_BDC64;
    v12[3] = &unk_458E98;
    v12[4] = a3;
    v12[5] = v13;
    v12[6] = a4;
    [(THGlossaryTermsViewController *)self setDidLayoutBlock:v12];
    _Block_object_dispose(v13, 8);
  }
}

- (void)scrollToEntry:(id)a3 scrollPosition:(int64_t)a4
{
  if (a3
    && [(THGlossaryIndex *)[(THGlossaryTermsViewController *)self glossaryIndex] indexForEntry:a3] != 0x7FFFFFFFFFFFFFFFLL)
  {
    id v7 = [(THGlossaryTermsViewController *)self p_activeTableView];
    id v8 = [(THGlossaryIndex *)[(THGlossaryTermsViewController *)self glossaryIndex] indexPathForEntry:a3];
    [v7 scrollToRowAtIndexPath:v8 atScrollPosition:a4 animated:1];
  }
}

- (id)selectedEntry
{
  id v3 = [self p_activeTableView].indexPathForSelectedRow;
  BOOL v4 = [(THGlossaryTermsViewController *)self glossaryIndex];

  return [(THGlossaryIndex *)v4 entryForRowAtIndexPath:v3];
}

- (void)setSearchString:(id)a3
{
  if (+[NSString normalizedCompare:a3 with:self->_searchString])
  {
    id v5 = [(THGlossaryNavigationDelegate *)[(THGlossaryTermsViewController *)self navigationDelegate] displayedEntry];

    self->_searchString = (NSString *)[a3 copy];
    self->_glossaryIndedouble x = 0;
    [(UITableView *)[(THGlossaryTermsViewController *)self tableView] reloadData];
    if ([(THGlossaryIndex *)[(THGlossaryTermsViewController *)self glossaryIndex] numberOfEntries] >= 1&& [(THGlossaryIndex *)[(THGlossaryTermsViewController *)self glossaryIndex] indexForEntry:v5] != 0x7FFFFFFFFFFFFFFFLL)
    {
      [(THGlossaryTermsViewController *)self selectEntry:v5 scrollPosition:1 animated:1];
    }
    id v6 = [(THGlossaryTermsViewController *)self navigationDelegate];
    [(THGlossaryNavigationDelegate *)v6 displayEntry:v5 whenCollapsed:0];
  }
}

- (int64_t)overrideUserInterfaceStyle
{
  int64_t result = [self themePage].userInterfaceStyle;
  if ((unint64_t)result <= 1) {
    return 1;
  }
  return result;
}

- (void)searchBarTextDidBeginEditing:(id)a3
{
}

- (void)searchBarTextDidEndEditing:(id)a3
{
}

- (void)searchBar:(id)a3 textDidChange:(id)a4
{
  -[THGlossaryTermsViewController setSearchString:](self, "setSearchString:", [a3 text]);
  id v6 = [(THGlossaryTermsViewController *)self floatingHeaderController];
  BOOL v7 = [a4 length] != 0;

  [(THFloatingHeaderController *)v6 setHeaderHidden:v7];
}

- (void)searchBarSearchButtonClicked:(id)a3
{
}

- (void)searchBarCancelButtonClicked:(id)a3
{
  [a3 setText:0];

  [(THGlossaryTermsViewController *)self clearSearch];
}

- (void)dismissSearchKeyboard:(id)a3
{
}

- (void)clearSearch
{
  [(THGlossaryTermsViewController *)self dismissSearchKeyboard:0];
  id v3 = +[NSString string];

  [(THGlossaryTermsViewController *)self setSearchString:v3];
}

- (unint64_t)numberOfFloatingHeaders:(id)a3
{
  id v3 = [(THGlossaryTermsViewController *)self glossaryIndex];

  return [(THGlossaryIndex *)v3 numberOfSections];
}

- (id)layerForFloatingHeaderAtIndex:(unint64_t)a3 forController:(id)a4
{
  long long v15 = *(_OWORD *)&CATransform3DIdentity.m33;
  long long v16 = *(_OWORD *)&CATransform3DIdentity.m31;
  *(_OWORD *)&v20.m31 = v16;
  *(_OWORD *)&v20.m33 = v15;
  long long v13 = *(_OWORD *)&CATransform3DIdentity.m43;
  long long v14 = *(_OWORD *)&CATransform3DIdentity.m41;
  *(_OWORD *)&v20.m41 = v14;
  *(_OWORD *)&v20.m43 = v13;
  long long v11 = *(_OWORD *)&CATransform3DIdentity.m13;
  long long v12 = *(_OWORD *)&CATransform3DIdentity.m11;
  *(_OWORD *)&v20.m11 = *(_OWORD *)&CATransform3DIdentity.m11;
  *(_OWORD *)&v20.m13 = v11;
  long long v9 = *(_OWORD *)&CATransform3DIdentity.m23;
  long long v10 = *(_OWORD *)&CATransform3DIdentity.m21;
  *(_OWORD *)&v20.m21 = v10;
  *(_OWORD *)&v20.m23 = v9;
  if (objc_msgSend(objc_msgSend(a4, "tableView"), "_shouldReverseLayoutDirection"))
  {
    *(_OWORD *)&v19.m31 = v16;
    *(_OWORD *)&v19.m33 = v15;
    *(_OWORD *)&v19.m41 = v14;
    *(_OWORD *)&v19.m43 = v13;
    *(_OWORD *)&v19.m11 = v12;
    *(_OWORD *)&v19.m13 = v11;
    *(_OWORD *)&v19.m21 = v10;
    *(_OWORD *)&v19.m23 = v9;
    CATransform3DScale(&v20, &v19, -1.0, 1.0, 1.0);
  }
  id v6 = +[CATextLayer layer];
  CATransform3D v18 = v20;
  [v6 setTransform:&v18];
  [v6 setFrame:0.0, 2.0, 41.0, 20.0];
  [v6 setAnchorPoint:0.5, 0.0];
  [v6 setFont:[+[TSUFont systemFontOfSize:](TSUFont, "systemFontOfSize:", 17.0) fontName]];
  [v6 setFontSize:17.0];
  [v6 setAlignmentMode:kCAAlignmentCenter];
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_BE260;
  v17[3] = &unk_456E38;
  v17[4] = v6;
  v17[5] = self;
  [self traitCollection].performAsCurrentTraitCollection:v17;
  [v6 setBackgroundColor:[UIColor clearColor].CGColor];
  [v6 setString:[-[THGlossaryTermsViewController glossaryIndex](self, "glossaryIndex") titleForHeaderInSection:a3]];
  [+[UIScreen mainScreen] scale];
  [v6 setContentsScale:];
  BOOL v7 = +[CALayer layer];
  -[CALayer setFrame:](v7, "setFrame:", 0.0, 0.0, 44.0, 44.0);
  -[CALayer setAnchorPoint:](v7, "setAnchorPoint:", 0.0, 0.0);
  [(CALayer *)v7 setBackgroundColor:[+[UIColor clearColor] CGColor]];
  [(CALayer *)v7 addSublayer:v6];
  return v7;
}

- (unint64_t)rowNumberForFloatingHeaderAtIndex:(unint64_t)a3 forController:(id)a4
{
  if (!a3) {
    return 0;
  }
  unint64_t v5 = 0;
  unint64_t v6 = a3 - 1;
  do
    v5 += [(THGlossaryIndex *)[(THGlossaryTermsViewController *)self glossaryIndex] numberOfRowsInSection:v6--];
  while (v6 != -1);
  return v5;
}

- (unint64_t)numberOfRowsForFloatingHeaderAtIndex:(unint64_t)a3 forController:(id)a4
{
  unint64_t v5 = [(THGlossaryTermsViewController *)self glossaryIndex];

  return [(THGlossaryIndex *)v5 numberOfRowsInSection:a3];
}

- (THGlossaryController)glossaryController
{
  return self->_glossaryController;
}

- (void)setGlossaryController:(id)a3
{
  self->_glossaryController = (THGlossaryController *)a3;
}

- (THFloatingHeaderController)floatingHeaderController
{
  return self->_floatingHeaderController;
}

- (void)setFloatingHeaderController:(id)a3
{
}

- (UITableView)tableView
{
  return self->_tableView;
}

- (void)setTableView:(id)a3
{
  self->_tableView = (UITableView *)a3;
}

- (THGlossaryNavigationDelegate)navigationDelegate
{
  return self->_navigationDelegate;
}

- (void)setNavigationDelegate:(id)a3
{
  self->_navigationDelegate = (THGlossaryNavigationDelegate *)a3;
}

- (UISearchBar)searchBar
{
  return self->_searchBar;
}

- (void)setSearchBar:(id)a3
{
  self->_searchBar = (UISearchBar *)a3;
}

- (UIView)dividerView
{
  return self->_dividerView;
}

- (void)setDividerView:(id)a3
{
  self->_dividerView = (UIView *)a3;
}

- (NSLayoutConstraint)searchBarTopConstraint
{
  return self->_searchBarTopConstraint;
}

- (void)setSearchBarTopConstraint:(id)a3
{
  self->_searchBarTopConstraint = (NSLayoutConstraint *)a3;
}

- (NSLayoutConstraint)searchBarBottomConstraint
{
  return self->_searchBarBottomConstraint;
}

- (void)setSearchBarBottomConstraint:(id)a3
{
  self->_searchBarBottomConstraint = (NSLayoutConstraint *)a3;
}

- (NSString)searchString
{
  return self->_searchString;
}

- (id)didLayoutBlock
{
  return self->_didLayoutBlock;
}

- (void)setDidLayoutBlock:(id)a3
{
}

- (BOOL)hasDoneLayout
{
  return self->_hasDoneLayout;
}

- (void)setHasDoneLayout:(BOOL)a3
{
  self->_hasDoneLayout = a3;
}

- (NSLayoutConstraint)dividerHeightConstraint
{
  return self->_dividerHeightConstraint;
}

- (void)setDividerHeightConstraint:(id)a3
{
  self->_dividerHeightConstraint = (NSLayoutConstraint *)a3;
}

@end