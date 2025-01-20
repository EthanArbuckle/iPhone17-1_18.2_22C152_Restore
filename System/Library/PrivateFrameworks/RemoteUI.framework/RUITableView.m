@interface RUITableView
+ (void)_enableTestMode;
- (BOOL)_becomeFirstResponderAtIndexPath:(id)a3;
- (BOOL)_isRegularWidth;
- (BOOL)isSearchEnabled;
- (BOOL)isShowingPicker;
- (BOOL)tableView:(id)a3 canEditRowAtIndexPath:(id)a4;
- (BOOL)tableView:(id)a3 canFocusRowAtIndexPath:(id)a4;
- (BOOL)tableView:(id)a3 canPerformAction:(SEL)a4 forRowAtIndexPath:(id)a5 withSender:(id)a6;
- (BOOL)tableView:(id)a3 shouldDrawTopSeparatorForSection:(int64_t)a4;
- (BOOL)tableView:(id)a3 shouldIndentWhileEditingRowAtIndexPath:(id)a4;
- (BOOL)tableView:(id)a3 shouldShowMenuForRowAtIndexPath:(id)a4;
- (BOOL)webViewOM:(id)a3 shouldStartLoadWithRequest:(id)a4 navigationType:(int64_t)a5;
- (CGRect)_selectPickerFrame;
- (CGRect)searchBarRectInPage:(id)a3;
- (CGSize)_tableHeaderSizeForHeader:(id)a3;
- (CGSize)scrollView:(id)a3 contentSizeForZoomScale:(double)a4 withProposedSize:(CGSize)a5;
- (Class)tableCellClassForTableViewRow:(id)a3;
- (NSDictionary)footerViewAttributes;
- (NSDictionary)headerViewAttributes;
- (NSMutableArray)sections;
- (NSString)headerTitle;
- (NSString)subHeaderTitle;
- (RUIFooterElement)footer;
- (RUIHeader)headerView;
- (RUIHeaderElement)header;
- (RUIObjectModel)objectModel;
- (RUIPage)page;
- (RUISubHeaderElement)subHeader;
- (RUITableView)initWithAttributes:(id)a3 parent:(id)a4;
- (RUITableViewRow)defaultFirstResponderRow;
- (UIPickerView)selectPicker;
- (UISearchBar)searchBar;
- (double)tableView:(id)a3 estimatedHeightForRowAtIndexPath:(id)a4;
- (double)tableView:(id)a3 heightForFooterInSection:(int64_t)a4;
- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4;
- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4;
- (id)_objectModelIndexPathForIndexPath:(id)a3;
- (id)filteredResultsWithSearchTerm:(id)a3;
- (id)indexPathForPreferredFocusedViewInTableView:(id)a3;
- (id)indexPathForRow:(id)a3;
- (id)objectModelRowForIndexPath:(id)a3;
- (id)rowWithIdentifier:(id)a3;
- (id)sourceURL;
- (id)staticValues;
- (id)subElementWithID:(id)a3;
- (id)subElementsWithName:(id)a3;
- (id)tableView;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 contextMenuConfigurationForRowAtIndexPath:(id)a4 point:(CGPoint)a5;
- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4;
- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4;
- (id)tableView:(id)a3 viewForFooterInSection:(int64_t)a4;
- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4;
- (id)textFieldRow:(id)a3 changeCharactersInRange:(_NSRange)a4 replacementString:(id)a5;
- (id)titleLabel;
- (id)viewForElementIdentifier:(id)a3;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 editingStyleForRowAtIndexPath:(id)a4;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (int64_t)tableView:(id)a3 titleAlignmentForFooterInSection:(int64_t)a4;
- (int64_t)tableView:(id)a3 titleAlignmentForHeaderInSection:(int64_t)a4;
- (int64_t)tableViewStyle;
- (void)_clearPickers;
- (void)_datePickerRevert;
- (void)_enumerateRowsUsingBlock:(id)a3;
- (void)_hideDatePickerNavBarButtonsIfNeeded;
- (void)_hideLeftBarButtonItemForLabel;
- (void)_hideRightBarButtonItemForLabel;
- (void)_loadHeaderView;
- (void)_registerForNotifications:(BOOL)a3;
- (void)_setBottomInset:(float)a3;
- (void)_showDatePickerNavBarButtonsIfNeededForRow:(id)a3;
- (void)_showLeftBarButtonItemForLabel;
- (void)_showRightBarButtonItemForLabel;
- (void)_textChanged:(id)a3;
- (void)_updateSectionContentInsetForSettingsWithAnimation:(BOOL)a3;
- (void)activateRowAtIndexPath:(id)a3 animated:(BOOL)a4;
- (void)addSearchBarToPage:(id)a3;
- (void)datePickerCancel:(id)a3;
- (void)datePickerDone:(id)a3;
- (void)dealloc;
- (void)hidePickerViewAnimated:(BOOL)a3;
- (void)insertRow:(id)a3 atIndexPath:(id)a4;
- (void)leftLabelDone:(id)a3;
- (void)performAction:(int)a3 forElement:(id)a4 completion:(id)a5;
- (void)populatePostbackDictionary:(id)a3;
- (void)populateSelectionDictionary:(id)a3;
- (void)reloadHeadersAndFootersForSection:(id)a3;
- (void)removeRowAtIndexPath:(id)a3;
- (void)rightLabelDone:(id)a3;
- (void)rowDidChange:(id)a3 action:(int)a4;
- (void)rowDidEndEditing:(id)a3;
- (void)scrollViewWillBeginDragging:(id)a3;
- (void)searchBar:(id)a3 textDidChange:(id)a4;
- (void)searchBarCancelButtonClicked:(id)a3;
- (void)searchBarSearchButtonClicked:(id)a3;
- (void)setAttributes:(id)a3;
- (void)setDefaultFirstResponderRow:(id)a3;
- (void)setEditing:(BOOL)a3;
- (void)setFooter:(id)a3;
- (void)setFooterViewAttributes:(id)a3;
- (void)setHeader:(id)a3;
- (void)setHeaderTitle:(id)a3;
- (void)setHeaderViewAttributes:(id)a3;
- (void)setImage:(id)a3;
- (void)setImageAlignment:(int)a3;
- (void)setImageSize:(CGSize)a3;
- (void)setObjectModel:(id)a3;
- (void)setPage:(id)a3;
- (void)setSelectPicker:(id)a3;
- (void)setSelectedRadioGroupRow:(id)a3;
- (void)setSubHeader:(id)a3;
- (void)setSubHeaderTitle:(id)a3;
- (void)showPickerViewForRow:(id)a3 animated:(BOOL)a4;
- (void)tableView:(id)a3 accessoryButtonTappedForRowWithIndexPath:(id)a4;
- (void)tableView:(id)a3 commitEditingStyle:(int64_t)a4 forRowAtIndexPath:(id)a5;
- (void)tableView:(id)a3 didDeselectRowAtIndexPath:(id)a4;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)tableView:(id)a3 didUpdateFocusInContext:(id)a4 withAnimationCoordinator:(id)a5;
- (void)tableView:(id)a3 performAction:(SEL)a4 forRowAtIndexPath:(id)a5 withSender:(id)a6;
- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5;
- (void)textFieldStartedEditing:(id)a3;
- (void)traitCollectionDidChangeFrom:(id)a3 toTraitCollection:(id)a4;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLayout;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation RUITableView

- (id)staticValues
{
  v6[2] = *MEMORY[0x263EF8340];
  v2 = objc_opt_new();
  [v2 setIdentifier:"sectionCount"];
  [v2 setGetter:RUIJSTable_getProperty];
  [v2 setSetter:0];
  [v2 setJSPropertyAttributes:10];
  v3 = objc_opt_new();
  [v3 setIdentifier:"editing"];
  [v3 setGetter:RUIJSTable_getProperty];
  [v3 setSetter:RUIJSTable_setProperty];
  [v3 setJSPropertyAttributes:8];
  v6[0] = v2;
  v6[1] = v3;
  v4 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:2];

  return v4;
}

+ (void)_enableTestMode
{
  gAnimatedTransitions = 1;
}

- (RUITableView)initWithAttributes:(id)a3 parent:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)RUITableView;
  v4 = [(RUIElement *)&v8 initWithAttributes:a3 parent:a4];
  if (v4)
  {
    v5 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    sections = v4->_sections;
    v4->_sections = v5;
  }
  return v4;
}

- (NSMutableArray)sections
{
  if (self->_isSearching) {
    v2 = &OBJC_IVAR___RUITableView__filteredSections;
  }
  else {
    v2 = &OBJC_IVAR___RUITableView__sections;
  }
  return (NSMutableArray *)*(id *)((char *)&self->super.super.isa + *v2);
}

- (void)_registerForNotifications:(BOOL)a3
{
  if (a3)
  {
    if (self->_registeredForNotifications) {
      return;
    }
    self->_registeredForNotifications = 1;
    v4 = [MEMORY[0x263F08A00] defaultCenter];
    [v4 addObserver:self selector:sel__textChanged_ name:*MEMORY[0x263F83AC8] object:0];

    v5 = [MEMORY[0x263F08A00] defaultCenter];
    [v5 addObserver:self selector:sel_automaticKeyboardDidShow_ name:*MEMORY[0x263F837A8] object:0];

    id v8 = [MEMORY[0x263F08A00] defaultCenter];
    [v8 addObserver:self selector:sel_automaticKeyboardDidHide_ name:*MEMORY[0x263F837A0] object:0];
  }
  else
  {
    if (!self->_registeredForNotifications) {
      return;
    }
    self->_registeredForNotifications = 0;
    v6 = [MEMORY[0x263F08A00] defaultCenter];
    [v6 removeObserver:self name:*MEMORY[0x263F83AC8] object:0];

    v7 = [MEMORY[0x263F08A00] defaultCenter];
    [v7 removeObserver:self name:*MEMORY[0x263F837A8] object:0];

    id v8 = [MEMORY[0x263F08A00] defaultCenter];
    [v8 removeObserver:self name:*MEMORY[0x263F837A0] object:0];
  }
}

- (void)dealloc
{
  [(RUITableView *)self _registerForNotifications:0];
  [(UITableView *)self->_tableView setDelegate:0];
  [(UITableView *)self->_tableView setDataSource:0];
  v3.receiver = self;
  v3.super_class = (Class)RUITableView;
  [(RUIElement *)&v3 dealloc];
}

- (void)traitCollectionDidChangeFrom:(id)a3 toTraitCollection:(id)a4
{
}

- (BOOL)isSearchEnabled
{
  v2 = [(RUIElement *)self attributes];
  objc_super v3 = [v2 objectForKeyedSubscript:@"searchEnabled"];
  char v4 = [v3 BOOLValue];

  return v4;
}

- (void)addSearchBarToPage:(id)a3
{
  id v17 = a3;
  if ([(RUITableView *)self isSearchEnabled] && !self->_searchBar)
  {
    char v4 = [(RUIElement *)self attributes];
    v5 = [v4 objectForKeyedSubscript:@"searchBarInNavigationBar"];
    int v6 = [v5 BOOLValue];

    if (v6)
    {
      v7 = (void *)[objc_alloc(MEMORY[0x263F82BA0]) initWithSearchResultsController:0];
      [v7 setObscuresBackgroundDuringPresentation:0];
      [v7 setAutomaticallyShowsSearchResultsController:0];
      id v8 = [(RUIElement *)self attributes];
      v9 = [v8 objectForKeyedSubscript:@"hidesSearchBarWhenScrolling"];
      uint64_t v10 = [v9 BOOLValue];
      v11 = [v17 navigationItem];
      [v11 setHidesSearchBarWhenScrolling:v10];

      v12 = [v17 navigationItem];
      [v12 setSearchController:v7];

      v13 = [v7 searchBar];
      searchBar = self->_searchBar;
      self->_searchBar = v13;
    }
    else
    {
      v15 = (UISearchBar *)objc_alloc_init(MEMORY[0x263F82B98]);
      v16 = self->_searchBar;
      self->_searchBar = v15;

      v7 = [v17 view];
      [v7 addSubview:self->_searchBar];
    }

    [(UISearchBar *)self->_searchBar setDelegate:self];
  }
}

- (CGRect)searchBarRectInPage:(id)a3
{
  id v4 = a3;
  if (!self->_searchBar)
  {
    id v8 = (double *)MEMORY[0x263F001A8];
    double v9 = *MEMORY[0x263F001A8];
    goto LABEL_5;
  }
  v5 = [(RUIElement *)self attributes];
  int v6 = [v5 objectForKeyedSubscript:@"searchBarInNavigationBar"];
  int v7 = [v6 BOOLValue];

  id v8 = (double *)MEMORY[0x263F001A8];
  double v9 = *MEMORY[0x263F001A8];
  if (v7)
  {
LABEL_5:
    double v20 = v8[1];
    double v15 = v8[2];
    double v17 = v8[3];
    goto LABEL_6;
  }
  searchBar = self->_searchBar;
  v11 = [v4 view];
  [v11 bounds];
  -[UISearchBar sizeThatFits:](searchBar, "sizeThatFits:", v12, v13);
  double v15 = v14;
  double v17 = v16;

  v18 = [v4 view];
  [v18 safeAreaInsets];
  double v20 = v19;

LABEL_6:
  double v21 = v9;
  double v22 = v20;
  double v23 = v15;
  double v24 = v17;
  result.size.height = v24;
  result.size.width = v23;
  result.origin.y = v22;
  result.origin.x = v21;
  return result;
}

- (id)tableView
{
  tableView = self->_tableView;
  if (!tableView)
  {
    id v4 = objc_alloc(MEMORY[0x263F82C78]);
    int64_t v5 = [(RUITableView *)self tableViewStyle];
    int v6 = (UITableView *)objc_msgSend(v4, "initWithFrame:style:", v5, *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
    int v7 = self->_tableView;
    self->_tableView = v6;

    [(UITableView *)self->_tableView setSelfSizingInvalidation:2];
    [(UITableView *)self->_tableView setPreservesSuperviewLayoutMargins:1];
    [(UITableView *)self->_tableView setAllowsSelectionDuringEditing:1];
    [(UITableView *)self->_tableView setDataSource:self];
    [(UITableView *)self->_tableView setDelegate:self];
    [(UITableView *)self->_tableView setCellLayoutMarginsFollowReadableWidth:1];
    id v8 = [(RUIElement *)self attributes];
    double v9 = [v8 objectForKey:@"sectionStyle"];

    if ([v9 isEqualToString:@"compact"]) {
      [(UITableView *)self->_tableView setSectionHeaderHeight:0.0];
    }
    [(UITableView *)self->_tableView layoutMargins];
    [(UITableView *)self->_tableView setLayoutMargins:"setLayoutMargins:"];
    uint64_t v10 = [(RUIElement *)self attributes];
    v11 = [v10 objectForKeyedSubscript:@"editing"];
    int v12 = [v11 BOOLValue];

    if (v12) {
      [(UITableView *)self->_tableView setEditing:1 animated:0];
    }
    double v13 = [(RUIElement *)self attributes];
    double v14 = [v13 objectForKeyedSubscript:@"allowsMultipleSelectionDuringEditing"];
    -[UITableView setAllowsMultipleSelectionDuringEditing:](self->_tableView, "setAllowsMultipleSelectionDuringEditing:", [v14 BOOLValue]);

    if (+[RUIPlatform isAppleTV]) {
      -[UITableView _setGradientMaskInsets:](self->_tableView, "_setGradientMaskInsets:", *MEMORY[0x263F834E8], *(double *)(MEMORY[0x263F834E8] + 8), *(double *)(MEMORY[0x263F834E8] + 16), *(double *)(MEMORY[0x263F834E8] + 24));
    }

    tableView = self->_tableView;
  }
  return tableView;
}

- (int64_t)tableViewStyle
{
  objc_super v3 = [(RUIElement *)self attributes];
  id v4 = [v3 objectForKey:@"style"];

  if ([v4 isEqualToString:@"grouped"])
  {
    int64_t v5 = 1;
  }
  else if ([v4 isEqualToString:@"plain"])
  {
    int64_t v5 = 0;
  }
  else if ([v4 isEqualToString:@"insetGrouped"])
  {
    int64_t v5 = 2;
  }
  else
  {
    int v6 = [(RUITableView *)self objectModel];
    int v7 = [v6 style];
    int64_t v5 = [v7 tableViewStyle];
  }
  return v5;
}

- (void)_updateSectionContentInsetForSettingsWithAnimation:(BOOL)a3
{
  BOOL v3 = a3;
  int64_t v5 = [(RUIElement *)self attributes];
  int v6 = [v5 objectForKey:@"style"];

  if ([v6 isEqualToString:@"settings"])
  {
    BOOL v7 = [(RUITableView *)self _isRegularWidth];
    id v8 = (double *)MEMORY[0x263F839B8];
    if (v7)
    {
      double v9 = [(RUITableView *)self view];
      [v9 layoutMargins];
      double v11 = v10;

      int v12 = [(RUITableView *)self view];
      [v12 safeAreaInsets];
      double v14 = v13;

      double v15 = 0.0;
      if (v14 <= 0.0)
      {
        double v16 = [(RUITableView *)self view];
        [v16 layoutMargins];
        double v15 = v17;
      }
    }
    else
    {
      double v15 = *MEMORY[0x263F839B8];
      double v11 = *MEMORY[0x263F839B8];
    }
    [(UITableView *)self->_tableView _sectionContentInset];
    if (v11 != v19 || v15 != v18)
    {
      double v21 = *v8;
      if (v3 && self->_sectionContentInsetInitialized)
      {
        -[UITableView _setSectionContentInset:](self->_tableView, "_setSectionContentInset:", v21, v11, *v8, v15);
      }
      else
      {
        v22[0] = MEMORY[0x263EF8330];
        v22[1] = 3221225472;
        v22[2] = __67__RUITableView__updateSectionContentInsetForSettingsWithAnimation___block_invoke;
        v22[3] = &unk_264212178;
        v22[4] = self;
        *(double *)&v22[5] = v21;
        *(double *)&v22[6] = v11;
        *(double *)&v22[7] = v21;
        *(double *)&v22[8] = v15;
        [MEMORY[0x263F82E00] performWithoutAnimation:v22];
        self->_sectionContentInsetInitialized = 1;
      }
    }
  }
}

uint64_t __67__RUITableView__updateSectionContentInsetForSettingsWithAnimation___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(void *)(a1 + 32) + 72), "_setSectionContentInset:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
}

- (BOOL)_isRegularWidth
{
  return [(UITraitCollection *)self->_currentTraitCollection horizontalSizeClass] == UIUserInterfaceSizeClassRegular;
}

- (void)setAttributes:(id)a3
{
  id v4 = a3;
  id v5 = [(RUIElement *)self attributes];

  if (v5 != v4)
  {
    v18.receiver = self;
    v18.super_class = (Class)RUITableView;
    [(RUIElement *)&v18 setAttributes:v4];
    int v6 = [(RUIElement *)self attributes];
    BOOL v7 = [v6 objectForKey:@"scrollEnabled"];

    if ([v7 length] && (objc_msgSend(v7, "BOOLValue") & 1) == 0)
    {
      id v8 = [(RUITableView *)self tableView];
      [v8 setScrollEnabled:0];
    }
    double v9 = [(RUIElement *)self attributes];
    double v10 = [v9 objectForKeyedSubscript:@"backgroundColor"];

    if (v10)
    {
      double v11 = objc_msgSend(MEMORY[0x263F825C8], "_remoteUI_colorWithString:", v10);
      int v12 = [(RUITableView *)self tableView];
      [v12 setBackgroundColor:v11];
    }
    double v13 = [(RUIElement *)self attributes];
    double v14 = [v13 objectForKeyedSubscript:@"separatorStyle"];

    if (!v14) {
      goto LABEL_14;
    }
    if ([v14 isEqualToString:@"none"])
    {
      double v15 = [(RUITableView *)self tableView];
      double v16 = v15;
      uint64_t v17 = 0;
    }
    else
    {
      if (([v14 isEqualToString:@"singleLine"] & 1) == 0
        && ![v14 isEqualToString:@"etchedLine"])
      {
        goto LABEL_14;
      }
      double v15 = [(RUITableView *)self tableView];
      double v16 = v15;
      uint64_t v17 = 1;
    }
    [v15 setSeparatorStyle:v17];

LABEL_14:
  }
}

- (void)populatePostbackDictionary:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v5 = self->_sections;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * v9++), "populatePostbackDictionary:", v4, (void)v10);
      }
      while (v7 != v9);
      uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }

  [(RUITableView *)self populateSelectionDictionary:v4];
}

- (void)populateSelectionDictionary:(id)a3
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(RUIElement *)self identifier];
  uint64_t v6 = [v5 length];

  if (v6)
  {
    uint64_t v7 = [MEMORY[0x263EFF980] array];
    long long v31 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    double v22 = self;
    obj = self->_sections;
    uint64_t v25 = [(NSMutableArray *)obj countByEnumeratingWithState:&v31 objects:v36 count:16];
    if (!v25) {
      goto LABEL_21;
    }
    uint64_t v24 = *(void *)v32;
    while (1)
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v32 != v24) {
          objc_enumerationMutation(obj);
        }
        uint64_t v26 = v8;
        uint64_t v9 = *(void **)(*((void *)&v31 + 1) + 8 * v8);
        long long v27 = 0u;
        long long v28 = 0u;
        long long v29 = 0u;
        long long v30 = 0u;
        long long v10 = objc_msgSend(v9, "rows", v22);
        uint64_t v11 = [v10 countByEnumeratingWithState:&v27 objects:v35 count:16];
        if (v11)
        {
          uint64_t v12 = v11;
          uint64_t v13 = *(void *)v28;
          do
          {
            for (uint64_t i = 0; i != v12; ++i)
            {
              if (*(void *)v28 != v13) {
                objc_enumerationMutation(v10);
              }
              uint64_t v15 = *(void **)(*((void *)&v27 + 1) + 8 * i);
              double v16 = [v15 tableCell];
              if ([v16 isSelected])
              {
                uint64_t v17 = [v15 tableCell];
                uint64_t v18 = [v17 selectionStyle];

                if (!v18) {
                  continue;
                }
                double v19 = [v15 attributes];
                double v16 = [v19 objectForKeyedSubscript:@"value"];

                if (v16) {
                  [v7 addObject:v16];
                }
              }
            }
            uint64_t v12 = [v10 countByEnumeratingWithState:&v27 objects:v35 count:16];
          }
          while (v12);
        }

        uint64_t v8 = v26 + 1;
      }
      while (v26 + 1 != v25);
      uint64_t v25 = [(NSMutableArray *)obj countByEnumeratingWithState:&v31 objects:v36 count:16];
      if (!v25)
      {
LABEL_21:

        double v20 = (void *)[v7 copy];
        double v21 = [(RUIElement *)v22 identifier];
        [v4 setObject:v20 forKeyedSubscript:v21];

        break;
      }
    }
  }
}

- (id)subElementWithID:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v5 = self->_sections;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v17;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v17 != v8) {
          objc_enumerationMutation(v5);
        }
        long long v10 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        uint64_t v11 = objc_msgSend(v10, "identifier", (void)v16);
        int v12 = [v11 isEqualToString:v4];

        if (v12)
        {
          id v13 = v10;
LABEL_13:
          double v14 = v13;
          goto LABEL_14;
        }
        id v13 = [v10 subElementWithID:v4];
        if (v13) {
          goto LABEL_13;
        }
      }
      uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
      double v14 = 0;
      if (v7) {
        continue;
      }
      break;
    }
  }
  else
  {
    double v14 = 0;
  }
LABEL_14:

  return v14;
}

- (id)subElementsWithName:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = objc_opt_new();
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  uint64_t v6 = self->_sections;
  uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        int v12 = objc_msgSend(v11, "name", (void)v16);
        int v13 = [v12 isEqualToString:v4];

        if (v13) {
          [v5 addObject:v11];
        }
        double v14 = [v11 subElementsWithName:v4];
        [v5 addObjectsFromArray:v14];
      }
      uint64_t v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v8);
  }

  return v5;
}

- (id)_objectModelIndexPathForIndexPath:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_embeddedPickerRowIndexPath)
  {
    uint64_t v6 = [v4 section];
    if (v6 == [(NSIndexPath *)self->_embeddedPickerRowIndexPath section])
    {
      uint64_t v7 = [v5 row];
      if (v7 > [(NSIndexPath *)self->_embeddedPickerRowIndexPath row])
      {
        uint64_t v8 = objc_msgSend(MEMORY[0x263F088C8], "indexPathForRow:inSection:", objc_msgSend(v5, "row") - 1, objc_msgSend(v5, "section"));

        id v5 = (void *)v8;
      }
    }
  }
  return v5;
}

- (id)objectModelRowForIndexPath:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = [(RUITableView *)self _objectModelIndexPathForIndexPath:v4];

    uint64_t v6 = [(RUITableView *)self sections];
    uint64_t v7 = objc_msgSend(v6, "objectAtIndex:", objc_msgSend(v5, "section"));

    unint64_t v8 = [v5 row];
    uint64_t v9 = [v7 rows];
    unint64_t v10 = [v9 count];

    if (v8 >= v10)
    {
      id v4 = 0;
    }
    else
    {
      uint64_t v11 = [v7 rows];
      objc_msgSend(v11, "objectAtIndex:", objc_msgSend(v5, "row"));
      id v4 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  return v4;
}

- (id)indexPathForRow:(id)a3
{
  id v4 = a3;
  id v5 = [(RUITableView *)self sections];
  uint64_t v6 = [v5 count];

  if (v6)
  {
    uint64_t v7 = 0;
    while (1)
    {
      unint64_t v8 = [(RUITableView *)self sections];
      uint64_t v9 = [v8 objectAtIndex:v7];

      unint64_t v10 = [v9 rows];
      uint64_t v11 = [v10 indexOfObject:v4];

      if (v11 != 0x7FFFFFFFFFFFFFFFLL) {
        break;
      }

      if (v6 == ++v7) {
        goto LABEL_5;
      }
    }
    int v12 = [MEMORY[0x263F088C8] indexPathForRow:v11 inSection:v7];
  }
  else
  {
LABEL_5:
    int v12 = 0;
  }

  return v12;
}

- (id)rowWithIdentifier:(id)a3
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v5 = [(RUITableView *)self sections];
  uint64_t v20 = [v5 countByEnumeratingWithState:&v25 objects:v30 count:16];
  if (v20)
  {
    uint64_t v6 = *(void *)v26;
    uint64_t v19 = *(void *)v26;
    do
    {
      for (uint64_t i = 0; i != v20; ++i)
      {
        if (*(void *)v26 != v6) {
          objc_enumerationMutation(v5);
        }
        unint64_t v8 = *(void **)(*((void *)&v25 + 1) + 8 * i);
        long long v21 = 0u;
        long long v22 = 0u;
        long long v23 = 0u;
        long long v24 = 0u;
        uint64_t v9 = objc_msgSend(v8, "rows", v19);
        uint64_t v10 = [v9 countByEnumeratingWithState:&v21 objects:v29 count:16];
        if (v10)
        {
          uint64_t v11 = v10;
          uint64_t v12 = *(void *)v22;
          while (2)
          {
            for (uint64_t j = 0; j != v11; ++j)
            {
              if (*(void *)v22 != v12) {
                objc_enumerationMutation(v9);
              }
              double v14 = *(void **)(*((void *)&v21 + 1) + 8 * j);
              uint64_t v15 = [v14 identifier];
              char v16 = [v15 isEqualToString:v4];

              if (v16)
              {
                id v17 = v14;

                goto LABEL_19;
              }
            }
            uint64_t v11 = [v9 countByEnumeratingWithState:&v21 objects:v29 count:16];
            if (v11) {
              continue;
            }
            break;
          }
        }

        uint64_t v6 = v19;
      }
      id v17 = 0;
      uint64_t v20 = [v5 countByEnumeratingWithState:&v25 objects:v30 count:16];
    }
    while (v20);
  }
  else
  {
    id v17 = 0;
  }
LABEL_19:

  return v17;
}

- (void)_clearPickers
{
  [(UIDatePicker *)self->_datePicker removeFromSuperview];
  [(UIPickerView *)self->_selectPicker removeFromSuperview];
  pickerBackdrop = self->_pickerBackdrop;
  [(_UIBackdropView *)pickerBackdrop removeFromSuperview];
}

- (void)_setBottomInset:(float)a3
{
  [(UITableView *)self->_tableView contentInset];
  tableView = self->_tableView;
  -[UITableView setContentInset:](tableView, "setContentInset:");
}

- (void)reloadHeadersAndFootersForSection:(id)a3
{
  id v8 = a3;
  id v4 = [(RUITableView *)self sections];
  uint64_t v5 = [v4 indexOfObject:v8];

  if (v5 == 0x7FFFFFFFFFFFFFFFLL)
  {
    NSLog(&cfstr_CannotFindSect.isa, v8);
  }
  else
  {
    [MEMORY[0x263F82E00] disableAnimation];
    tableView = self->_tableView;
    uint64_t v7 = [MEMORY[0x263F088D0] indexSetWithIndex:v5];
    [(UITableView *)tableView _reloadSectionHeaderFooters:v7 withRowAnimation:5];

    [MEMORY[0x263F82E00] enableAnimation];
  }
}

- (void)insertRow:(id)a3 atIndexPath:(id)a4
{
  v13[1] = *MEMORY[0x263EF8340];
  sections = self->_sections;
  id v7 = a4;
  id v8 = a3;
  uint64_t v9 = -[NSMutableArray objectAtIndexedSubscript:](sections, "objectAtIndexedSubscript:", [v7 section]);
  objc_msgSend(v9, "insertRow:atIndex:", v8, objc_msgSend(v7, "row"));

  tableView = self->_tableView;
  v13[0] = v7;
  uint64_t v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:v13 count:1];
  if (gAnimatedTransitions) {
    uint64_t v12 = 5;
  }
  else {
    uint64_t v12 = 0;
  }
  [(UITableView *)tableView insertRowsAtIndexPaths:v11 withRowAnimation:v12];
}

- (void)removeRowAtIndexPath:(id)a3
{
  v10[1] = *MEMORY[0x263EF8340];
  sections = self->_sections;
  id v5 = a3;
  uint64_t v6 = -[NSMutableArray objectAtIndexedSubscript:](sections, "objectAtIndexedSubscript:", [v5 section]);
  objc_msgSend(v6, "removeRowAtIndex:", objc_msgSend(v5, "row"));
  tableView = self->_tableView;
  v10[0] = v5;
  id v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:v10 count:1];
  if (gAnimatedTransitions) {
    uint64_t v9 = 5;
  }
  else {
    uint64_t v9 = 0;
  }
  [(UITableView *)tableView deleteRowsAtIndexPaths:v8 withRowAnimation:v9];
}

- (void)setEditing:(BOOL)a3
{
  [(UITableView *)self->_tableView setEditing:a3 animated:(gAnimatedTransitions & 1) == 0];
}

- (id)viewForElementIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  int v13 = &v12;
  uint64_t v14 = 0x3032000000;
  uint64_t v15 = __Block_byref_object_copy__3;
  char v16 = __Block_byref_object_dispose__3;
  id v17 = 0;
  sections = self->_sections;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __41__RUITableView_viewForElementIdentifier___block_invoke;
  v9[3] = &unk_2642121A0;
  uint64_t v11 = &v12;
  id v6 = v4;
  id v10 = v6;
  [(NSMutableArray *)sections enumerateObjectsUsingBlock:v9];
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

void __41__RUITableView_viewForElementIdentifier___block_invoke(uint64_t a1, void *a2, uint64_t a3, BOOL *a4)
{
  uint64_t v6 = [a2 viewForElementIdentifier:*(void *)(a1 + 32)];
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v6;

  *a4 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) != 0;
}

- (void)setHeaderViewAttributes:(id)a3
{
  id v4 = a3;
  id v5 = [(RUIElement *)[RUIHeaderElement alloc] initWithAttributes:v4 parent:self];

  header = self->_header;
  self->_header = v5;
}

- (void)setFooterViewAttributes:(id)a3
{
  id v4 = a3;
  id v5 = [(RUIElement *)[RUIFooterElement alloc] initWithAttributes:v4 parent:self];

  footer = self->_footer;
  self->_footer = v5;
}

- (NSDictionary)headerViewAttributes
{
  return [(RUIElement *)self->_header attributes];
}

- (NSDictionary)footerViewAttributes
{
  return [(RUIElement *)self->_footer attributes];
}

- (RUIHeader)headerView
{
  headerView = self->_headerView;
  if (!headerView)
  {
    [(RUITableView *)self _loadHeaderView];
    headerView = self->_headerView;
  }
  return headerView;
}

- (CGSize)_tableHeaderSizeForHeader:(id)a3
{
  id v4 = a3;
  id v5 = [(RUITableView *)self tableView];
  uint64_t v6 = [v5 readableContentGuide];
  [v6 layoutFrame];
  double v8 = v7;

  if (objc_opt_respondsToSelector())
  {
    [v4 headerHeightForWidth:self->_tableView inView:v8];
LABEL_5:
    double v10 = v9;
    goto LABEL_6;
  }
  if (objc_opt_respondsToSelector())
  {
    [v4 headerHeightForWidth:self->_tableView inTableView:v8];
    goto LABEL_5;
  }
  if ([v4 _wantsAutolayout])
  {
    double v10 = *(double *)(MEMORY[0x263F001B0] + 8);
    double v13 = *(double *)(MEMORY[0x263F83810] + 8);
    uint64_t v14 = [(RUITableView *)self tableView];
    uint64_t v15 = [v14 readableContentGuide];
    [v15 layoutFrame];
    double v17 = v16;

    objc_msgSend(v4, "systemLayoutSizeFittingSize:", v17, v13);
  }
  else
  {
    [(UITableView *)self->_tableView frame];
    objc_msgSend(v4, "sizeThatFits:", v18, v19);
    double v8 = v20;
    double v10 = v21;
  }
LABEL_6:

  double v11 = v8;
  double v12 = v10;
  result.height = v12;
  result.width = v11;
  return result;
}

- (id)titleLabel
{
  return 0;
}

- (void)_loadHeaderView
{
  v48[4] = *MEMORY[0x263EF8340];
  if (self->_header || self->_subHeader || self->_headerTitle || [(RUIElement *)self hasImage])
  {
    BOOL v3 = [(RUITableView *)self tableView];
    id v4 = [v3 tableHeaderView];

    if (!v4)
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_objectModel);
      uint64_t v6 = [(RUIElement *)self->_header attributes];
      double v7 = [WeakRetained tableHeaderViewForAttributes:v6];

      if (v7)
      {
        double v8 = *MEMORY[0x263F001A8];
        double v9 = *(double *)(MEMORY[0x263F001A8] + 8);
        [(RUITableView *)self _tableHeaderSizeForHeader:v7];
        objc_msgSend(v7, "setFrame:", v8, v9, v10, v11);
        [(UITableView *)self->_tableView setTableHeaderView:v7];
      }
      else
      {
        double v12 = [(RUITableView *)self page];
        int v13 = [v12 showsTitlesAsHeaderViews];

        if (v13)
        {
          if (_isInternalInstall())
          {
            uint64_t v14 = _RUILoggingFacility();
            if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_2144F2000, v14, OS_LOG_TYPE_DEFAULT, "Attempting modern header", buf, 2u);
            }
          }
          if ([(RUIElement *)self hasImage])
          {
            id v15 = objc_alloc_init(MEMORY[0x263F827E8]);
            double v16 = [[RUIModernHeaderView alloc] initWithTitle:self->_headerTitle detailText:self->_subHeaderTitle icon:v15];
          }
          else
          {
            double v16 = [[RUIModernHeaderView alloc] initWithTitle:self->_headerTitle detailText:self->_subHeaderTitle icon:0];
          }
          [(RUIModernHeaderView *)v16 setTranslatesAutoresizingMaskIntoConstraints:0];
        }
        else
        {
          double v16 = [[RUIHeaderView alloc] initWithAttributes:0];
          [(RUIModernHeaderView *)v16 setTranslatesAutoresizingMaskIntoConstraints:0];
          double v17 = [(RUIElement *)self style];
          [v17 subHeaderTopMargin];
          -[RUIModernHeaderView setSubHeaderTopMargin:](v16, "setSubHeaderTopMargin:");

          double v18 = [(RUIElement *)self style];
          [v18 headerImagePadding];
          -[RUIModernHeaderView setImageLabelPadding:](v16, "setImageLabelPadding:");

          double v19 = [(RUIElement *)self style];
          [v19 headerMargin];
          -[RUIModernHeaderView setHeaderMargin:](v16, "setHeaderMargin:");

          double v20 = [(RUIElement *)self style];
          double v21 = [v20 headerLabelTextColor];
          [(RUIModernHeaderView *)v16 setHeaderColor:v21];
        }
        [(RUIHeaderElement *)self->_header configureView:v16];
        [(RUISubHeaderElement *)self->_subHeader configureView:v16];
        long long v22 = objc_alloc_init(RUIReadableContentContainer);
        [(RUIReadableContentContainer *)v22 setPreservesSuperviewLayoutMargins:1];
        id v23 = objc_loadWeakRetained((id *)&self->_objectModel);
        long long v24 = [v23 style];
        [v24 headerContainerSideMargin];
        double v26 = v25;
        id v27 = objc_loadWeakRetained((id *)&self->_objectModel);
        long long v28 = [v27 style];
        [v28 headerContainerSideMargin];
        -[RUIReadableContentContainer setDirectionalLayoutMargins:](v22, "setDirectionalLayoutMargins:", 0.0, v26, 0.0, v29);

        [(RUIReadableContentContainer *)v22 addSubview:v16];
        [(UITableView *)self->_tableView setTableHeaderView:v22];
        v40 = (void *)MEMORY[0x263F08938];
        v46 = [(RUIReadableContentContainer *)v22 topAnchor];
        v45 = [(RUIModernHeaderView *)v16 topAnchor];
        v44 = [v46 constraintEqualToAnchor:v45];
        v48[0] = v44;
        v43 = [(RUIReadableContentContainer *)v22 bottomAnchor];
        v42 = [(RUIModernHeaderView *)v16 bottomAnchor];
        v41 = [v43 constraintEqualToAnchor:v42];
        v48[1] = v41;
        v39 = [(RUIReadableContentContainer *)v22 readableContentGuide];
        v38 = [v39 leadingAnchor];
        long long v30 = [(RUIModernHeaderView *)v16 leadingAnchor];
        uint64_t v31 = [v38 constraintEqualToAnchor:v30];
        v48[2] = v31;
        long long v32 = [(RUIReadableContentContainer *)v22 readableContentGuide];
        long long v33 = [v32 trailingAnchor];
        long long v34 = [(RUIModernHeaderView *)v16 trailingAnchor];
        v35 = [v33 constraintEqualToAnchor:v34];
        v48[3] = v35;
        v36 = [MEMORY[0x263EFF8C0] arrayWithObjects:v48 count:4];
        [v40 activateConstraints:v36];

        headerView = self->_headerView;
        self->_headerView = (RUIHeader *)v16;

        [(RUIElement *)self loadImage];
        double v7 = 0;
      }
    }
  }
}

- (void)setImage:(id)a3
{
  id v4 = a3;
  id v5 = [(RUITableView *)self page];
  int v6 = [v5 showsTitlesAsHeaderViews];

  double v7 = [(RUITableView *)self headerView];
  id v8 = v7;
  if (v6) {
    [v7 setIcon:v4 accessibilityLabel:0];
  }
  else {
    [v7 setIconImage:v4];
  }
}

- (void)setImageSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  int v6 = [(RUITableView *)self page];
  char v7 = [v6 showsTitlesAsHeaderViews];

  if ((v7 & 1) == 0)
  {
    id v8 = [(RUITableView *)self headerView];
    objc_msgSend(v8, "setImageSize:", width, height);
  }
}

- (void)setImageAlignment:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  id v5 = [(RUITableView *)self page];
  char v6 = [v5 showsTitlesAsHeaderViews];

  if ((v6 & 1) == 0)
  {
    id v7 = [(RUITableView *)self headerView];
    [v7 setImageAlignment:v3];
  }
}

- (void)viewWillAppear:(BOOL)a3
{
  id v4 = [(UITableView *)self->_tableView superview];
  [(UITableView *)self->_tableView frame];
  double x = v21.origin.x;
  double y = v21.origin.y;
  if (CGRectIsEmpty(v21) && v4 != 0)
  {
    [v4 bounds];
    -[UITableView setFrame:](self->_tableView, "setFrame:", x, y);
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_objectModel);
  [WeakRetained configureTableView:self];

  [(RUITableView *)self _loadHeaderView];
  if (self->_footer)
  {
    double v9 = [(UITableView *)self->_tableView tableFooterView];

    if (!v9)
    {
      id v10 = objc_loadWeakRetained((id *)&self->_objectModel);
      double v11 = [(RUIElement *)self->_footer attributes];
      double v12 = [v10 tableFooterViewForAttributes:v11];

      if (v12)
      {
        double v13 = *MEMORY[0x263F001A8];
        double v14 = *(double *)(MEMORY[0x263F001A8] + 8);
        [(UITableView *)self->_tableView frame];
        objc_msgSend(v12, "sizeThatFits:", v15, v16);
        objc_msgSend(v12, "setFrame:", v13, v14, v17, v18);
        [(UITableView *)self->_tableView setTableFooterView:v12];
      }
    }
  }
  [(RUITableView *)self _registerForNotifications:1];
  id v19 = objc_loadWeakRetained((id *)&self->_objectModel);
  [v19 tableViewOMDidChange:self];

  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __31__RUITableView_viewWillAppear___block_invoke;
  v20[3] = &unk_2642112D8;
  v20[4] = self;
  [MEMORY[0x263F82E00] performWithoutAnimation:v20];
}

uint64_t __31__RUITableView_viewWillAppear___block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 72) beginUpdates];
  [*(id *)(*(void *)(a1 + 32) + 72) layoutIfNeeded];
  v2 = *(void **)(*(void *)(a1 + 32) + 72);
  return [v2 endUpdates];
}

- (void)viewDidAppear:(BOOL)a3
{
  id v4 = [(RUIElement *)self pageElement];
  [v4 reportInternalRenderEvent];

  id v5 = [(RUITableView *)self tableView];
  [(RUIElement *)self configureAccessiblityWithTarget:v5];

  [(RUIElement *)self reportInternalRenderEvent];
  char v6 = [(RUITableView *)self sections];
  [v6 enumerateObjectsUsingBlock:&__block_literal_global_7];

  id v7 = [(RUITableView *)self defaultFirstResponderRow];

  if (v7)
  {
    id v8 = [(RUITableView *)self defaultFirstResponderRow];
    double v9 = [(RUITableView *)self indexPathForRow:v8];

    [(UITableView *)self->_tableView selectRowAtIndexPath:v9 animated:0 scrollPosition:0];
    [(RUITableView *)self activateRowAtIndexPath:v9 animated:0];
    [(RUITableView *)self setDefaultFirstResponderRow:0];
  }
  tableView = self->_tableView;
  double v11 = [(RUIElement *)self attributes];
  double v12 = [v11 objectForKeyedSubscript:@"editing"];
  [(UITableView *)tableView setEditing:v12 != 0 animated:0];

  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  void v13[2] = __30__RUITableView_viewDidAppear___block_invoke_2;
  v13[3] = &unk_2642112D8;
  v13[4] = self;
  [MEMORY[0x263F82E00] performWithoutAnimation:v13];
  [(UITableView *)self->_tableView flashScrollIndicators];
}

uint64_t __30__RUITableView_viewDidAppear___block_invoke(uint64_t a1, void *a2)
{
  return [a2 reportInternalRenderEvent];
}

uint64_t __30__RUITableView_viewDidAppear___block_invoke_2(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 72) beginUpdates];
  [*(id *)(*(void *)(a1 + 32) + 72) layoutIfNeeded];
  v2 = *(void **)(*(void *)(a1 + 32) + 72);
  return [v2 endUpdates];
}

- (void)viewWillDisappear:(BOOL)a3
{
}

- (void)viewDidLayout
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  uint64_t v3 = [(RUITableView *)self tableView];
  id v4 = [v3 traitCollection];
  uint64_t v5 = [v4 horizontalSizeClass];

  [(UITableView *)self->_tableView bounds];
  float v8 = v7;
  if (self->_lastLayoutWidth != v8)
  {
    double v9 = v6;
    if (v5 == 1) {
      double v10 = 20.0;
    }
    else {
      double v10 = 60.0;
    }
    [(UITableView *)self->_tableView contentInset];
    double v12 = v9 - v10 - v11;
    [(UITableView *)self->_tableView safeAreaInsets];
    *(float *)&double v13 = v12 - v13;
    self->_fullscreenCellHeight = *(float *)&v13;
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    double v14 = [(RUITableView *)self sections];
    uint64_t v15 = [v14 countByEnumeratingWithState:&v30 objects:v35 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v31;
      do
      {
        for (uint64_t i = 0; i != v16; ++i)
        {
          if (*(void *)v31 != v17) {
            objc_enumerationMutation(v14);
          }
          id v19 = *(void **)(*((void *)&v30 + 1) + 8 * i);
          long long v26 = 0u;
          long long v27 = 0u;
          long long v28 = 0u;
          long long v29 = 0u;
          double v20 = [v19 rows];
          uint64_t v21 = [v20 countByEnumeratingWithState:&v26 objects:v34 count:16];
          if (v21)
          {
            uint64_t v22 = v21;
            uint64_t v23 = *(void *)v27;
            do
            {
              for (uint64_t j = 0; j != v22; ++j)
              {
                if (*(void *)v27 != v23) {
                  objc_enumerationMutation(v20);
                }
                [*(id *)(*((void *)&v26 + 1) + 8 * j) clearCachedHeight];
              }
              uint64_t v22 = [v20 countByEnumeratingWithState:&v26 objects:v34 count:16];
            }
            while (v22);
          }
        }
        uint64_t v16 = [v14 countByEnumeratingWithState:&v30 objects:v35 count:16];
      }
      while (v16);
    }

    v25[0] = MEMORY[0x263EF8330];
    v25[1] = 3221225472;
    v25[2] = __29__RUITableView_viewDidLayout__block_invoke;
    v25[3] = &unk_2642112D8;
    v25[4] = self;
    [MEMORY[0x263F82E00] performWithoutAnimation:v25];
    self->_lastLayoutWidth = v8;
  }
  [(RUITableView *)self _updateSectionContentInsetForSettingsWithAnimation:0];
}

void __29__RUITableView_viewDidLayout__block_invoke(uint64_t a1)
{
  v2 = (double *)MEMORY[0x263F001A8];
  double v4 = *(double *)(MEMORY[0x263F001A8] + 16);
  double v3 = *(double *)(MEMORY[0x263F001A8] + 24);
  id v20 = [*(id *)(*(void *)(a1 + 32) + 72) tableHeaderView];
  uint64_t v5 = [*(id *)(*(void *)(a1 + 32) + 72) tableFooterView];
  double v6 = v3;
  double v7 = v4;
  if (v20)
  {
    float v8 = *(void **)(a1 + 32);
    double v9 = [v8 headerView];
    [v8 _tableHeaderSizeForHeader:v9];
    double v7 = v10;
    double v6 = v11;
  }
  double v12 = *v2;
  double v13 = v2[1];
  if (v5)
  {
    [*(id *)(*(void *)(a1 + 32) + 72) frame];
    objc_msgSend(v5, "sizeThatFits:", v14, v15);
    double v4 = v16;
    double v3 = v17;
  }
  uint64_t v18 = *(void *)(a1 + 32);
  float v19 = *(float *)(v18 + 144) - (v6 + v3);
  *(float *)(v18 + 144) = v19;
  v22.origin.double x = v12;
  v22.origin.double y = v13;
  v22.size.double width = v7;
  v22.size.double height = v6;
  if (!CGRectIsEmpty(v22))
  {
    objc_msgSend(v20, "setFrame:", v12, v13, v7, v6);
    [*(id *)(*(void *)(a1 + 32) + 72) _tableHeaderHeightDidChangeToHeight:v6];
  }
  v23.origin.double x = v12;
  v23.origin.double y = v13;
  v23.size.double width = v4;
  v23.size.double height = v3;
  if (!CGRectIsEmpty(v23))
  {
    objc_msgSend(v5, "setFrame:", v12, v13, v4, v3);
    [*(id *)(*(void *)(a1 + 32) + 72) _tableFooterHeightDidChangeToHeight:v3];
  }
  [*(id *)(*(void *)(a1 + 32) + 72) beginUpdates];
  [*(id *)(*(void *)(a1 + 32) + 72) endUpdates];
}

- (void)setSelectedRadioGroupRow:(id)a3
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [v4 attributes];
  double v6 = [v5 objectForKeyedSubscript:@"radioGroup"];

  if ([v6 length])
  {
    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    obuint64_t j = [(RUITableView *)self sections];
    uint64_t v19 = [obj countByEnumeratingWithState:&v25 objects:v30 count:16];
    if (v19)
    {
      uint64_t v18 = *(void *)v26;
      do
      {
        uint64_t v7 = 0;
        do
        {
          if (*(void *)v26 != v18) {
            objc_enumerationMutation(obj);
          }
          uint64_t v20 = v7;
          float v8 = *(void **)(*((void *)&v25 + 1) + 8 * v7);
          long long v21 = 0u;
          long long v22 = 0u;
          long long v23 = 0u;
          long long v24 = 0u;
          double v9 = [v8 rows];
          uint64_t v10 = [v9 countByEnumeratingWithState:&v21 objects:v29 count:16];
          if (v10)
          {
            uint64_t v11 = v10;
            uint64_t v12 = *(void *)v22;
            do
            {
              for (uint64_t i = 0; i != v11; ++i)
              {
                if (*(void *)v22 != v12) {
                  objc_enumerationMutation(v9);
                }
                id v14 = *(id *)(*((void *)&v21 + 1) + 8 * i);
                double v15 = [v14 attributes];
                double v16 = [v15 objectForKey:@"radioGroup"];

                if (v14 != v4 && [v16 isEqualToString:v6]) {
                  [v14 setSelected:0];
                }
              }
              uint64_t v11 = [v9 countByEnumeratingWithState:&v21 objects:v29 count:16];
            }
            while (v11);
          }

          uint64_t v7 = v20 + 1;
        }
        while (v20 + 1 != v19);
        uint64_t v19 = [obj countByEnumeratingWithState:&v25 objects:v30 count:16];
      }
      while (v19);
    }

    [v4 setSelected:1];
  }
}

- (void)_showLeftBarButtonItemForLabel
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_objectModel);
  id v4 = [WeakRetained displayedPages];
  id v9 = [v4 lastObject];

  [(RUITableView *)self _hideLeftBarButtonItemForLabel];
  self->_showingLeftLabelNavBarButtons = 1;
  uint64_t v5 = [v9 leftNavigationBarButtonItem];
  oldLeftBarButtonItemForLabel = self->_oldLeftBarButtonItemForLabel;
  self->_oldLeftBarButtonItemForLabel = v5;

  uint64_t v7 = objc_opt_new();
  float v8 = (void *)[objc_alloc(MEMORY[0x263F824A8]) initWithBarButtonSystemItem:0 target:self action:sel_leftLabelDone_];
  [v9 setLeftNavigationBarButtonItem:v7 barButtonItem:v8];
}

- (void)leftLabelDone:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_objectModel);
  uint64_t v5 = [WeakRetained visiblePage];
  double v6 = [v5 view];
  [v6 endEditing:0];

  [(RUITableView *)self _hideLeftBarButtonItemForLabel];
}

- (void)_hideLeftBarButtonItemForLabel
{
  if (self->_showingLeftLabelNavBarButtons)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_objectModel);
    id v4 = [WeakRetained displayedPages];
    id v6 = [v4 lastObject];

    [v6 setLeftNavigationBarButtonItem:self->_oldLeftBarButtonItemForLabel];
    oldLeftBarButtonItemForLabel = self->_oldLeftBarButtonItemForLabel;
    self->_oldLeftBarButtonItemForLabel = 0;

    self->_showingLeftLabelNavBarButtons = 0;
  }
}

- (void)_showRightBarButtonItemForLabel
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_objectModel);
  id v4 = [WeakRetained displayedPages];
  id v9 = [v4 lastObject];

  [(RUITableView *)self _hideRightBarButtonItemForLabel];
  self->_showingRightLabelNavBarButtons = 1;
  uint64_t v5 = [v9 rightNavigationBarButtonItem];
  oldRightBarButtonItemForLabel = self->_oldRightBarButtonItemForLabel;
  self->_oldRightBarButtonItemForLabel = v5;

  uint64_t v7 = objc_opt_new();
  float v8 = (void *)[objc_alloc(MEMORY[0x263F824A8]) initWithBarButtonSystemItem:0 target:self action:sel_rightLabelDone_];
  [v9 setRightNavigationBarButtonItem:v7 barButtonItem:v8];
}

- (void)rightLabelDone:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_objectModel);
  uint64_t v5 = [WeakRetained visiblePage];
  id v6 = [v5 view];
  [v6 endEditing:0];

  [(RUITableView *)self _hideRightBarButtonItemForLabel];
}

- (void)_hideRightBarButtonItemForLabel
{
  if (self->_showingRightLabelNavBarButtons)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_objectModel);
    id v4 = [WeakRetained displayedPages];
    id v6 = [v4 lastObject];

    [v6 setRightNavigationBarButtonItem:self->_oldRightBarButtonItemForLabel];
    oldRightBarButtonItemForLabel = self->_oldRightBarButtonItemForLabel;
    self->_oldRightBarButtonItemForLabel = 0;

    self->_showingRightLabelNavBarButtons = 0;
  }
}

- (void)_datePickerRevert
{
  if (self->_oldPickerDate)
  {
    -[UIDatePicker setDate:](self->_datePicker, "setDate:");
    id v3 = [(RUITableView *)self objectModelRowForIndexPath:self->_pickerRowIndexPath];
    [v3 setDate:self->_oldPickerDate];
  }
}

- (void)datePickerCancel:(id)a3
{
  [(RUITableView *)self _datePickerRevert];
  BOOL v4 = (gAnimatedTransitions & 1) == 0;
  [(RUITableView *)self hidePickerViewAnimated:v4];
}

- (void)datePickerDone:(id)a3
{
  id v5 = [(RUITableView *)self objectModelRowForIndexPath:self->_pickerRowIndexPath];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_objectModel);
  [WeakRetained tableViewOM:self elementDidChange:v5 action:2 completion:0];

  [(RUITableView *)self hidePickerViewAnimated:(gAnimatedTransitions & 1) == 0];
}

- (void)_showDatePickerNavBarButtonsIfNeededForRow:(id)a3
{
  BOOL v4 = [a3 attributes];
  id v5 = [v4 objectForKeyedSubscript:@"url"];

  if (v5)
  {
    id v6 = [(UIDatePicker *)self->_datePicker date];
    oldPickerDate = self->_oldPickerDate;
    self->_oldPickerDate = v6;

    id WeakRetained = objc_loadWeakRetained((id *)&self->_objectModel);
    id v9 = [WeakRetained displayedPages];
    id v24 = [v9 lastObject];

    self->_showingPickerNavBarButtons = 1;
    uint64_t v10 = [v24 leftNavigationBarButtonItem];
    oldLeftBarButtonItemForPicker = self->_oldLeftBarButtonItemForPicker;
    self->_oldLeftBarButtonItemForPicker = v10;

    uint64_t v12 = [v24 rightNavigationBarButtonItem];
    oldRightBarButtonItemForPicker = self->_oldRightBarButtonItemForPicker;
    self->_oldRightBarButtonItemForPicker = v12;

    id v14 = objc_opt_new();
    id v15 = objc_alloc(MEMORY[0x263F824A8]);
    double v16 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    double v17 = [v16 localizedStringForKey:@"CANCEL" value:&stru_26C545B50 table:@"Localizable"];
    uint64_t v18 = (void *)[v15 initWithTitle:v17 style:0 target:self action:sel_datePickerCancel_];

    [v24 setLeftNavigationBarButtonItem:v14 barButtonItem:v18];
    uint64_t v19 = objc_opt_new();
    id v20 = objc_alloc(MEMORY[0x263F824A8]);
    long long v21 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    long long v22 = [v21 localizedStringForKey:@"DONE" value:&stru_26C545B50 table:@"Localizable"];
    long long v23 = (void *)[v20 initWithTitle:v22 style:2 target:self action:sel_datePickerDone_];

    [v24 setRightNavigationBarButtonItem:v19 barButtonItem:v23];
  }
}

- (void)_hideDatePickerNavBarButtonsIfNeeded
{
  if (self->_showingPickerNavBarButtons)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_objectModel);
    BOOL v4 = [WeakRetained displayedPages];
    id v7 = [v4 lastObject];

    [v7 setLeftNavigationBarButtonItem:self->_oldLeftBarButtonItemForPicker];
    [v7 setRightNavigationBarButtonItem:self->_oldRightBarButtonItemForPicker];
    oldLeftBarButtonItemForPicker = self->_oldLeftBarButtonItemForPicker;
    self->_oldLeftBarButtonItemForPicker = 0;

    oldRightBarButtonItemForPicker = self->_oldRightBarButtonItemForPicker;
    self->_oldRightBarButtonItemForPicker = 0;

    self->_showingPickerNavBarButtons = 0;
  }
}

- (void)showPickerViewForRow:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v92 = *MEMORY[0x263EF8340];
  id v6 = a3;
  [(RUITableView *)self _datePickerRevert];
  [(RUITableView *)self _hideDatePickerNavBarButtonsIfNeeded];
  [(RUITableView *)self _selectPickerFrame];
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  id v15 = [v6 attributes];
  double v16 = [v15 objectForKeyedSubscript:@"class"];

  double v17 = [v6 attributes];
  uint64_t v18 = [v17 objectForKey:@"inline"];
  int v19 = [v18 BOOLValue];

  if (self->_embeddedPickerRowIndexPath) {
    [(RUITableView *)self hidePickerViewAnimated:v4];
  }
  id v20 = [(RUITableView *)self indexPathForRow:v6];
  objc_storeStrong((id *)&self->_pickerRowIndexPath, v20);
  long long v21 = [(UITableView *)self->_tableView firstResponder];
  [v21 resignFirstResponder];

  if (v4) {
    UIKeyboardOrderOutAutomatic();
  }
  else {
    UIKeyboardOrderOutAutomaticSkippingAnimation();
  }
  if ([v16 isEqualToString:@"select"])
  {
    self->_showSelectPicker = 1;
    selectPicker = self->_selectPicker;
    if (selectPicker)
    {
      [(UIPickerView *)selectPicker setDelegate:v6];
      [(UIPickerView *)self->_selectPicker reloadAllComponents];
    }
    else
    {
      if (!self->_pickerBackdrop)
      {
        long long v33 = (_UIBackdropView *)objc_msgSend(objc_alloc(MEMORY[0x263F82EB8]), "initWithFrame:style:", 2020, v8, v10, v12, v14);
        pickerBackdrop = self->_pickerBackdrop;
        self->_pickerBackdrop = v33;
      }
      v35 = (UIPickerView *)objc_msgSend(objc_alloc(MEMORY[0x263F82A38]), "initWithFrame:", v8, v10, v12, v14);
      uint64_t v36 = self->_selectPicker;
      self->_selectPicker = v35;

      [(UIPickerView *)self->_selectPicker setAutoresizingMask:10];
      [(UIPickerView *)self->_selectPicker setDelegate:v6];
      [(UIPickerView *)self->_selectPicker setShowsSelectionIndicator:1];
    }
    long long v32 = self->_selectPicker;
    BOOL v70 = v4;
    if (v19)
    {
      [(_UIBackdropView *)self->_pickerBackdrop removeFromSuperview];
      uint64_t v37 = (NSIndexPath *)[v20 copy];
    }
    else
    {
      v38 = [(UITableView *)self->_tableView superview];
      [v38 addSubview:self->_pickerBackdrop];

      v39 = [(UITableView *)self->_tableView superview];
      [v39 addSubview:self->_selectPicker];

      uint64_t v37 = 0;
    }
    embeddedPickerRowIndexPath = self->_embeddedPickerRowIndexPath;
    self->_embeddedPickerRowIndexPath = v37;

    uint64_t v41 = [v6 selectedRow];
    if (v41 == -1)
    {
      [v6 pickerView:self->_selectPicker didSelectRow:0 inComponent:0];
      uint64_t v41 = 0;
    }
    [(UIPickerView *)self->_selectPicker selectRow:v41 inColumn:0 animated:0];
    if (!v32) {
      goto LABEL_55;
    }
LABEL_47:
    v56 = v16;
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 3221225472;
    aBlock[2] = __46__RUITableView_showPickerViewForRow_animated___block_invoke;
    aBlock[3] = &unk_2642112D8;
    aBlock[4] = self;
    v57 = (void (**)(void))_Block_copy(aBlock);
    v58 = [(RUITableView *)self tableView];
    v78[0] = MEMORY[0x263EF8330];
    v78[1] = 3221225472;
    v78[2] = __46__RUITableView_showPickerViewForRow_animated___block_invoke_2;
    v78[3] = &unk_2642121E8;
    v78[4] = self;
    double v81 = v8;
    double v82 = v10;
    double v83 = v12;
    double v84 = v14;
    long long v32 = v32;
    v79 = v32;
    id v59 = v58;
    id v80 = v59;
    v60 = _Block_copy(v78);
    int v61 = v19;
    v62 = v60;
    if (v61)
    {
      v90 = self->_embeddedPickerRowIndexPath;
      v63 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v90 count:1];
      [v59 insertRowsAtIndexPaths:v63 withRowAnimation:100];
    }
    else
    {
      if (v70 && (!self->_datePicker || !self->_selectPicker))
      {
        -[UIPickerView setFrame:](v32, "setFrame:", v8, v10 + v14, v12, v14);
        v64 = (void *)MEMORY[0x263F82E00];
        v76[0] = MEMORY[0x263EF8330];
        v76[1] = 3221225472;
        v76[2] = __46__RUITableView_showPickerViewForRow_animated___block_invoke_3;
        v76[3] = &unk_264211528;
        id v77 = v62;
        v74[0] = MEMORY[0x263EF8330];
        v74[1] = 3221225472;
        v74[2] = __46__RUITableView_showPickerViewForRow_animated___block_invoke_4;
        v74[3] = &unk_264211B88;
        v75 = v57;
        [v64 animateWithDuration:v76 animations:v74 completion:0.3];

        goto LABEL_54;
      }
      (*((void (**)(void *))v60 + 2))(v60);
    }
    v57[2](v57);
LABEL_54:
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __46__RUITableView_showPickerViewForRow_animated___block_invoke_5;
    block[3] = &unk_264211E30;
    block[4] = self;
    id v72 = v20;
    BOOL v73 = v70;
    dispatch_async(MEMORY[0x263EF83A0], block);

    double v16 = v56;
    goto LABEL_55;
  }
  if (![v16 isEqualToString:@"datePicker"])
  {
    long long v32 = 0;
    goto LABEL_55;
  }
  BOOL v70 = v4;
  self->_showDatePicker = 1;
  datePicker = self->_datePicker;
  v69 = v16;
  if (datePicker)
  {
    int v67 = v19;
    id v24 = [(UIDatePicker *)datePicker allTargets];
    long long v86 = 0u;
    long long v87 = 0u;
    long long v88 = 0u;
    long long v89 = 0u;
    uint64_t v25 = [v24 countByEnumeratingWithState:&v86 objects:v91 count:16];
    if (v25)
    {
      uint64_t v26 = v25;
      uint64_t v27 = *(void *)v87;
      do
      {
        for (uint64_t i = 0; i != v26; ++i)
        {
          if (*(void *)v87 != v27) {
            objc_enumerationMutation(v24);
          }
          [(UIDatePicker *)self->_datePicker removeTarget:*(void *)(*((void *)&v86 + 1) + 8 * i) action:0 forControlEvents:0xFFFFFFFFLL];
        }
        uint64_t v26 = [v24 countByEnumeratingWithState:&v86 objects:v91 count:16];
      }
      while (v26);
    }
    [(UIDatePicker *)self->_datePicker removeFromSuperview];

    int v19 = v67;
  }
  if (!self->_pickerBackdrop)
  {
    long long v29 = (_UIBackdropView *)objc_msgSend(objc_alloc(MEMORY[0x263F82EB8]), "initWithFrame:style:", 2020, v8, v10, v12, v14);
    long long v30 = self->_pickerBackdrop;
    self->_pickerBackdrop = v29;
  }
  uint64_t v31 = objc_msgSend(v6, "dateFormatterCalendarIdentifier", v20);
  v68 = (void *)v31;
  if (v31) {
    [MEMORY[0x263EFF8F0] calendarWithIdentifier:v31];
  }
  else {
  v42 = [MEMORY[0x263EFF8F0] currentCalendar];
  }
  v43 = [MEMORY[0x263EFFA18] timeZoneWithName:@"UTC"];
  v66 = v42;
  [v42 setTimeZone:v43];

  v44 = (UIDatePicker *)[v6 newConfiguredDatePicker];
  v45 = self->_datePicker;
  self->_datePicker = v44;

  -[UIDatePicker setFrame:](self->_datePicker, "setFrame:", v8, v10, v12, v14);
  long long v32 = self->_datePicker;
  uint64_t v46 = [v6 datePickerMode];
  uint64_t v47 = 1;
  if ((unint64_t)(v46 - 3) < 2)
  {
    id v20 = v65;
  }
  else
  {
    id v20 = v65;
    if ((unint64_t)(v46 - 4270) >= 2)
    {
      if ([(UIDatePicker *)self->_datePicker datePickerStyle] != UIDatePickerStyleCompact) {
        goto LABEL_41;
      }
      uint64_t v47 = 3;
    }
  }
  [(UIDatePicker *)self->_datePicker setPreferredDatePickerStyle:v47];
LABEL_41:
  -[UIDatePicker setDatePickerMode:](self->_datePicker, "setDatePickerMode:", [v6 datePickerMode]);
  if ([(UIDatePicker *)self->_datePicker datePickerStyle] == UIDatePickerStyleInline) {
    int v19 = 1;
  }
  if (v19 == 1)
  {
    [(UIDatePicker *)self->_datePicker removeFromSuperview];
    [(_UIBackdropView *)self->_pickerBackdrop removeFromSuperview];
    v48 = (void *)MEMORY[0x263F088C8];
    uint64_t v49 = [v20 row] + 1;
    uint64_t v50 = [v20 section];
    v51 = v48;
    int v19 = 1;
    v52 = [v51 indexPathForRow:v49 inSection:v50];
  }
  else
  {
    v53 = [(UITableView *)self->_tableView superview];
    [v53 addSubview:self->_pickerBackdrop];

    v54 = [(UITableView *)self->_tableView superview];
    [v54 addSubview:self->_datePicker];

    v52 = 0;
  }
  v55 = self->_embeddedPickerRowIndexPath;
  self->_embeddedPickerRowIndexPath = v52;

  [(RUITableView *)self _showDatePickerNavBarButtonsIfNeededForRow:v6];
  double v16 = v69;
  if (v32) {
    goto LABEL_47;
  }
LABEL_55:
}

void __46__RUITableView_showPickerViewForRow_animated___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = 88;
  BOOL v4 = *(void **)(v2 + 88);
  if (v4 && !*(unsigned char *)(v2 + 96) && *(unsigned char *)(v2 + 80)
    || (uint64_t v3 = 320, (v4 = *(void **)(v2 + 320)) != 0) && !*(unsigned char *)(v2 + 80) && *(unsigned char *)(v2 + 96))
  {
    [v4 removeFromSuperview];
    uint64_t v5 = *(void *)(a1 + 32);
    id v6 = *(void **)(v5 + v3);
    *(void *)(v5 + v3) = 0;
  }
}

void __46__RUITableView_showPickerViewForRow_animated___block_invoke_2(uint64_t a1)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  [*(id *)(*(void *)(a1 + 32) + 104) setAutoresizingMask:10];
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 104), "setFrame:", *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80));
  objc_msgSend(*(id *)(a1 + 40), "setFrame:", *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80));
  uint64_t v2 = [*(id *)(a1 + 32) tableView];
  [v2 contentInset];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;

  objc_msgSend(*(id *)(a1 + 48), "setContentInset:", v4, v6, *(double *)(a1 + 80), v8);
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 256));
  double v10 = objc_msgSend(WeakRetained, "visiblePage", 0);
  double v11 = [v10 accessoryViews];

  uint64_t v12 = [v11 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v18;
    do
    {
      uint64_t v15 = 0;
      do
      {
        if (*(void *)v18 != v14) {
          objc_enumerationMutation(v11);
        }
        double v16 = *(void **)(*((void *)&v17 + 1) + 8 * v15);
        if (objc_opt_respondsToSelector()) {
          [v16 tableViewDidUpdateContentInset:*(void *)(a1 + 48)];
        }
        ++v15;
      }
      while (v13 != v15);
      uint64_t v13 = [v11 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v13);
  }
}

uint64_t __46__RUITableView_showPickerViewForRow_animated___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __46__RUITableView_showPickerViewForRow_animated___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __46__RUITableView_showPickerViewForRow_animated___block_invoke_5(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 72) scrollToRowAtIndexPath:*(void *)(a1 + 40) atScrollPosition:2 animated:*(unsigned __int8 *)(a1 + 48)];
}

- (void)hidePickerViewAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  v54[1] = *MEMORY[0x263EF8340];
  [(RUITableView *)self _selectPickerFrame];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  self->_showSelectPicker = 0;
  self->_showDatePicker = 0;
  datePicker = self->_datePicker;
  if (!datePicker) {
    datePicker = self->_selectPicker;
  }
  id v14 = datePicker;
  if (self->_embeddedPickerRowIndexPath)
  {
    [(UITableView *)self->_tableView beginUpdates];
    tableView = self->_tableView;
    v54[0] = self->_embeddedPickerRowIndexPath;
    double v16 = [MEMORY[0x263EFF8C0] arrayWithObjects:v54 count:1];
    [(UITableView *)tableView deleteRowsAtIndexPaths:v16 withRowAnimation:100];

    embeddedPickerRowIndexPath = self->_embeddedPickerRowIndexPath;
    self->_embeddedPickerRowIndexPath = 0;

    [(UITableView *)self->_tableView endUpdates];
  }
  else
  {
    double v18 = v8 + v12;
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 3221225472;
    aBlock[2] = __39__RUITableView_hidePickerViewAnimated___block_invoke;
    aBlock[3] = &unk_2642112D8;
    aBlock[4] = self;
    long long v19 = _Block_copy(aBlock);
    long long v20 = [(RUITableView *)self tableView];
    if (v3)
    {
      long long v21 = (void *)MEMORY[0x263F82E00];
      v45[0] = MEMORY[0x263EF8330];
      v45[1] = 3221225472;
      v45[2] = __39__RUITableView_hidePickerViewAnimated___block_invoke_2;
      v45[3] = &unk_2642121E8;
      v45[4] = self;
      double v48 = v6;
      double v49 = v18;
      double v50 = v10;
      double v51 = v12;
      id v46 = v14;
      id v47 = v20;
      v43[0] = MEMORY[0x263EF8330];
      v43[1] = 3221225472;
      v43[2] = __39__RUITableView_hidePickerViewAnimated___block_invoke_3;
      v43[3] = &unk_264211B88;
      id v44 = v19;
      [v21 animateWithDuration:v45 animations:v43 completion:0.3];
    }
    else
    {
      v38 = (void (**)(void))v19;
      -[_UIBackdropView setFrame:](self->_pickerBackdrop, "setFrame:", v6, v18, v10, v12);
      objc_msgSend(v14, "setFrame:", v6, v18, v10, v12);
      uint64_t v22 = [(RUITableView *)self tableView];
      [v22 contentInset];
      double v24 = v23;
      double v26 = v25;
      double v28 = v27;

      objc_msgSend(v20, "setContentInset:", v24, v26, 0.0, v28);
      long long v41 = 0u;
      long long v42 = 0u;
      long long v39 = 0u;
      long long v40 = 0u;
      id WeakRetained = objc_loadWeakRetained((id *)&self->_objectModel);
      long long v30 = [WeakRetained visiblePage];
      uint64_t v31 = [v30 accessoryViews];

      uint64_t v32 = [v31 countByEnumeratingWithState:&v39 objects:v53 count:16];
      if (v32)
      {
        uint64_t v33 = v32;
        uint64_t v34 = *(void *)v40;
        do
        {
          for (uint64_t i = 0; i != v33; ++i)
          {
            if (*(void *)v40 != v34) {
              objc_enumerationMutation(v31);
            }
            uint64_t v36 = *(void **)(*((void *)&v39 + 1) + 8 * i);
            if (objc_opt_respondsToSelector()) {
              [v36 tableViewDidUpdateContentInset:v20];
            }
          }
          uint64_t v33 = [v31 countByEnumeratingWithState:&v39 objects:v53 count:16];
        }
        while (v33);
      }

      long long v19 = v38;
      v38[2](v38);
      BOOL v3 = 0;
    }
  }
  [(RUITableView *)self _hideDatePickerNavBarButtonsIfNeeded];
  [(UITableView *)self->_tableView deselectRowAtIndexPath:self->_pickerRowIndexPath animated:v3];
  pickerRowIndexPath = self->_pickerRowIndexPath;
  self->_pickerRowIndexPath = 0;
}

uint64_t __39__RUITableView_hidePickerViewAnimated___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = 88;
  double v4 = *(void **)(v2 + 88);
  if (v4 || (uint64_t v3 = 320, (v4 = *(void **)(v2 + 320)) != 0))
  {
    [v4 removeFromSuperview];
    uint64_t v5 = *(void *)(a1 + 32);
    double v6 = *(void **)(v5 + v3);
    *(void *)(v5 + v3) = 0;
  }
  double v7 = *(void **)(*(void *)(a1 + 32) + 104);
  return [v7 removeFromSuperview];
}

void __39__RUITableView_hidePickerViewAnimated___block_invoke_2(uint64_t a1)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 104), "setFrame:", *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80));
  objc_msgSend(*(id *)(a1 + 40), "setFrame:", *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80));
  [*(id *)(a1 + 48) contentInset];
  double v3 = v2;
  double v5 = v4;
  double v7 = v6;
  double v8 = [*(id *)(a1 + 32) tableView];
  objc_msgSend(v8, "setContentInset:", v3, v5, 0.0, v7);

  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 256));
  double v10 = objc_msgSend(WeakRetained, "visiblePage", 0);
  double v11 = [v10 accessoryViews];

  uint64_t v12 = [v11 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v18;
    do
    {
      uint64_t v15 = 0;
      do
      {
        if (*(void *)v18 != v14) {
          objc_enumerationMutation(v11);
        }
        double v16 = *(void **)(*((void *)&v17 + 1) + 8 * v15);
        if (objc_opt_respondsToSelector()) {
          [v16 tableViewDidUpdateContentInset:*(void *)(a1 + 48)];
        }
        ++v15;
      }
      while (v13 != v15);
      uint64_t v13 = [v11 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v13);
  }
}

uint64_t __39__RUITableView_hidePickerViewAnimated___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  double v3 = [(RUITableView *)self sections];
  int64_t v4 = [v3 count];

  return v4;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  double v6 = [(RUITableView *)self sections];
  double v7 = [v6 objectAtIndex:a4];

  if (([v7 configured] & 1) == 0)
  {
    double v8 = [(RUITableView *)self objectModel];
    [v8 configureSection:v7];

    [v7 setConfigured:1];
  }
  double v9 = [v7 rows];
  int64_t v10 = [v9 count];

  embeddedPickerRowIndexPath = self->_embeddedPickerRowIndexPath;
  if (embeddedPickerRowIndexPath && [(NSIndexPath *)embeddedPickerRowIndexPath section] == a4) {
    ++v10;
  }

  return v10;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  v37[4] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  double v8 = [(RUITableView *)self objectModelRowForIndexPath:v7];
  if ([v7 isEqual:self->_embeddedPickerRowIndexPath])
  {
    double v9 = [v6 dequeueReusableCellWithIdentifier:@"embeddedPickerCell"];
    [v8 configureAccessiblityWithTarget:v9];
    if (!v9) {
      double v9 = (void *)[objc_alloc(MEMORY[0x263F82C80]) initWithStyle:0 reuseIdentifier:@"embeddedPickerCell"];
    }
    uint64_t v34 = v8;
    id v35 = v7;
    id v36 = v6;
    datePicker = self->_datePicker;
    if (!datePicker) {
      datePicker = self->_selectPicker;
    }
    id v11 = datePicker;
    uint64_t v12 = [v9 contentView];
    [v12 addSubview:v11];

    [v11 setTranslatesAutoresizingMaskIntoConstraints:0];
    double v26 = (void *)MEMORY[0x263F08938];
    uint64_t v32 = [v11 topAnchor];
    uint64_t v33 = [v9 contentView];
    uint64_t v31 = [v33 topAnchor];
    long long v30 = [v32 constraintEqualToAnchor:v31 constant:0.0];
    v37[0] = v30;
    double v28 = [v11 bottomAnchor];
    long long v29 = [v9 contentView];
    double v27 = [v29 bottomAnchor];
    double v25 = [v28 constraintEqualToAnchor:v27 constant:0.0];
    v37[1] = v25;
    double v24 = [v11 leadingAnchor];
    uint64_t v13 = [v9 contentView];
    uint64_t v14 = [v13 leadingAnchor];
    uint64_t v15 = [v24 constraintEqualToAnchor:v14 constant:0.0];
    v37[2] = v15;
    double v16 = [v11 trailingAnchor];
    long long v17 = [v9 contentView];
    long long v18 = [v17 trailingAnchor];
    long long v19 = [v16 constraintEqualToAnchor:v18 constant:0.0];
    v37[3] = v19;
    long long v20 = [MEMORY[0x263EFF8C0] arrayWithObjects:v37 count:4];
    [v26 activateConstraints:v20];

    id v7 = v35;
    id v6 = v36;
    double v8 = v34;
  }
  else
  {
    if (([v8 configured] & 1) == 0)
    {
      long long v21 = [(RUITableView *)self objectModel];
      [v21 configureRow:v8];
    }
    double v9 = [v8 tableCell];
    [v8 configureAccessiblityWithTarget:v9];
    if (-[RUITableView tableView:numberOfRowsInSection:](self, "tableView:numberOfRowsInSection:", v6, [v7 section]) == 1)objc_msgSend(v9, "setTextFieldOffset:", 0.0); {
  }
    }
  id v22 = v9;

  return v22;
}

- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5
{
  id v17 = a4;
  id v7 = a5;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    double v8 = [(RUITableView *)self objectModelRowForIndexPath:v7];
    id v9 = [v8 tableCell];
    if (v9 == v17)
    {
      int64_t v10 = [v8 attributes];
      id v11 = [v10 objectForKeyedSubscript:@"labelBold"];
      int v12 = [v11 BOOLValue];

      if (!v12)
      {
LABEL_6:

        goto LABEL_7;
      }
      id v9 = [v17 ruiTextLabel];
      uint64_t v13 = (void *)MEMORY[0x263F81708];
      uint64_t v14 = [v17 ruiTextLabel];
      uint64_t v15 = [v14 font];
      [v15 pointSize];
      double v16 = objc_msgSend(v13, "boldSystemFontOfSize:");
      [v9 setFont:v16];
    }
    goto LABEL_6;
  }
LABEL_7:
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  double v5 = [(RUITableView *)self sections];
  id v6 = [v5 objectAtIndex:a4];

  if ([v6 hasCustomHeader])
  {
    id v7 = 0;
  }
  else
  {
    double v8 = [v6 header];
    id v7 = [v8 body];
  }
  return v7;
}

- (int64_t)tableView:(id)a3 titleAlignmentForHeaderInSection:(int64_t)a4
{
  double v5 = [(RUITableView *)self sections];
  id v6 = [v5 objectAtIndex:a4];

  id v7 = [v6 header];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    id v9 = [v6 header];
    int64_t v10 = [v9 labelAlignment];
  }
  else
  {
    int64_t v10 = 4;
  }

  return v10;
}

- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4
{
  double v5 = [(RUITableView *)self sections];
  id v6 = [v5 objectAtIndex:a4];

  if ([v6 hasCustomFooter])
  {
    id v7 = 0;
  }
  else
  {
    double v8 = [v6 footer];
    id v7 = [v8 body];
  }
  return v7;
}

- (int64_t)tableView:(id)a3 titleAlignmentForFooterInSection:(int64_t)a4
{
  double v5 = [(RUITableView *)self sections];
  id v6 = [v5 objectAtIndex:a4];

  id v7 = [v6 footer];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    id v9 = [v6 footer];
    int64_t v10 = [v9 labelAlignment];
  }
  else
  {
    int64_t v10 = 4;
  }

  return v10;
}

- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4
{
  id v6 = [(RUITableView *)self sections];
  id v7 = [v6 objectAtIndex:a4];

  double v8 = [v7 header];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    int64_t v10 = [v7 header];
    [v10 loadElementIfNeeded];
    id v11 = [v10 view];
    [v11 intrinsicContentSize];
    double v13 = v12;

LABEL_3:
    goto LABEL_12;
  }
  if ([v7 hasCustomHeader])
  {
    double v13 = *MEMORY[0x263F839B8];
    goto LABEL_12;
  }
  uint64_t v14 = [(RUIElement *)self style];
  [v14 sectionSpacing];
  double v16 = v15;

  if (a4 >= 1 && v16 != 0.0)
  {
    int64_t v10 = [(RUIElement *)self style];
    [v10 sectionSpacing];
    double v13 = v17;
    goto LABEL_3;
  }
  [v7 headerHeight];
  if (a4 || (double v13 = 31.0, v18 != -1.0))
  {
    [v7 headerHeight];
    double v13 = v19;
  }
LABEL_12:

  return v13;
}

- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4
{
  id v6 = a3;
  id v7 = [(RUITableView *)self sections];
  double v8 = [v7 objectAtIndex:a4];

  id v9 = [v8 header];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    id v11 = [v8 header];
    double v12 = [v11 view];
    [v12 setBackgroundColor:0];

    [v11 loadElementIfNeeded];
    v24[0] = 0;
    v24[1] = v24;
    v24[2] = 0x3010000000;
    uint64_t v25 = 0;
    uint64_t v26 = 0;
    v24[3] = &unk_21462ED49;
    double v13 = [v11 view];
    [v13 intrinsicContentSize];
    uint64_t v25 = v14;
    uint64_t v26 = v15;

    objc_initWeak(&location, v6);
    v21[0] = MEMORY[0x263EF8330];
    v21[1] = 3221225472;
    v21[2] = __49__RUITableView_tableView_viewForHeaderInSection___block_invoke;
    v21[3] = &unk_264212210;
    objc_copyWeak(&v22, &location);
    v21[4] = v24;
    [v11 setDidLayoutSubviewsHandler:v21];
    double v16 = [v11 view];
    objc_destroyWeak(&v22);
    objc_destroyWeak(&location);
    _Block_object_dispose(v24, 8);
  }
  else if ([v8 hasCustomHeader])
  {
    double v16 = [v8 containerizedHeaderView];
    double v17 = [v16 headerView];
    char v18 = objc_opt_respondsToSelector();

    if (v18)
    {
      double v19 = [v16 headerView];
      [v19 setSectionIsFirst:a4 == 0];
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [v16 setTableView:v6];
    }
  }
  else
  {
    double v16 = 0;
  }

  return v16;
}

void __49__RUITableView_tableView_viewForHeaderInSection___block_invoke(uint64_t a1, void *a2)
{
  double v3 = (id *)(a1 + 40);
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained(v3);
  double v5 = [v4 view];

  [v5 intrinsicContentSize];
  double v7 = v6;
  double v9 = v8;

  uint64_t v10 = *(void *)(*(void *)(a1 + 32) + 8);
  if (*(double *)(v10 + 32) != v7 || *(double *)(v10 + 40) != v9)
  {
    *(double *)(v10 + 32) = v7;
    *(double *)(v10 + 40) = v9;
    [WeakRetained beginUpdates];
    [WeakRetained endUpdates];
  }
}

- (double)tableView:(id)a3 heightForFooterInSection:(int64_t)a4
{
  id v6 = a3;
  double v7 = [(RUITableView *)self sections];
  double v8 = [v7 objectAtIndex:a4];

  double v9 = [v8 header];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_4;
  }
  uint64_t v10 = [v8 rows];
  if ([v10 count])
  {

LABEL_4:
    goto LABEL_5;
  }
  double v16 = [v8 footer];

  if (!v16)
  {
    double v15 = 0.0;
    goto LABEL_11;
  }
LABEL_5:
  if ([v8 hasCustomFooter]
    && ([v6 readableContentGuide],
        id v11 = objc_claimAutoreleasedReturnValue(),
        [v11 layoutFrame],
        double v13 = v12,
        v11,
        v13 > 0.0))
  {
    double v15 = *MEMORY[0x263F839B8];
  }
  else
  {
    [v8 footerHeight];
    double v15 = v14;
  }
LABEL_11:

  return v15;
}

- (id)tableView:(id)a3 viewForFooterInSection:(int64_t)a4
{
  id v6 = a3;
  double v7 = [(RUITableView *)self sections];
  double v8 = [v7 objectAtIndex:a4];

  if ([v8 hasCustomFooter])
  {
    double v9 = [v8 containerizedFooterView];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [v9 setTableView:v6];
    }
  }
  else
  {
    double v9 = 0;
  }

  return v9;
}

- (CGRect)_selectPickerFrame
{
  double v2 = [(UITableView *)self->_tableView superview];
  [v2 bounds];
  double v4 = v3;
  double v6 = v5;

  double v7 = v6 + -216.0;
  double v8 = 216.0;
  double v9 = 0.0;
  double v10 = v4;
  result.size.double height = v8;
  result.size.double width = v10;
  result.origin.double y = v7;
  result.origin.double x = v9;
  return result;
}

- (BOOL)isShowingPicker
{
  return self->_showDatePicker || self->_showSelectPicker;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [v7 beginUpdates];
  [(RUITableView *)self activateRowAtIndexPath:v6 animated:(gAnimatedTransitions & 1) == 0];
  id v8 = [(RUITableView *)self objectModelRowForIndexPath:v6];

  [v8 didBecomeSelected];
  [v7 endUpdates];
}

- (void)tableView:(id)a3 didDeselectRowAtIndexPath:(id)a4
{
  id v13 = a4;
  id v6 = a3;
  [v6 beginUpdates];
  id v7 = [(RUITableView *)self tableView];
  int v8 = [v7 allowsMultipleSelectionDuringEditing];
  double v9 = [(RUITableView *)self tableView];
  int v10 = [v9 isEditing];

  if (v8 && v10)
  {
    id v11 = [(RUITableView *)self objectModel];
    [v11 tableViewOMDidChange:self];
  }
  double v12 = [(RUITableView *)self objectModelRowForIndexPath:v13];
  [v12 didBecomeDeselected];
  [v6 endUpdates];
}

- (void)activateRowAtIndexPath:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v54 = *MEMORY[0x263EF8340];
  id v6 = a3;
  [(UITableView *)self->_tableView beginUpdates];
  id v7 = [(RUITableView *)self objectModelRowForIndexPath:v6];
  int v8 = [v7 attributes];
  double v9 = [v8 objectForKey:@"class"];

  if (![v7 enabled]) {
    goto LABEL_36;
  }
  self->_showSelectPicker = 0;
  int v10 = [(RUITableView *)self sections];
  id v11 = objc_msgSend(v10, "objectAtIndex:", objc_msgSend(v6, "section"));

  if ([v9 isEqualToString:@"select"])
  {
    if (([(NSIndexPath *)self->_pickerRowIndexPath isEqual:v6] & 1) == 0) {
      goto LABEL_16;
    }
  }
  else
  {
    if (![v9 isEqualToString:@"datePicker"])
    {
      if (([v9 isEqualToString:@"editableText"] & 1) != 0
        || [v9 isEqualToString:@"numberPicker"])
      {
        double v12 = [v7 tableCell];
        id v13 = [v12 editableTextField];
        char v14 = [v13 isFirstResponder];

        if ((v14 & 1) == 0)
        {
          double v15 = [v7 tableCell];
          double v16 = [v15 editableTextField];
          [v16 becomeFirstResponder];
        }
        if (UIKeyboardAutomaticIsOnScreen()) {
          [(UITableView *)self->_tableView scrollToRowAtIndexPath:v6 atScrollPosition:2 animated:v4];
        }
      }
      else
      {
        long long v29 = [v11 showAllRow];

        if (v7 == v29)
        {
          [v11 tappedShowAllRowWithTable:self->_tableView];
        }
        else
        {
          long long v30 = [(UITableView *)self->_tableView firstResponder];
          [v30 resignFirstResponder];
        }
      }
      goto LABEL_17;
    }
    if ([v7 datePickerStyle] == 2)
    {
      [v7 activateDatePicker];
      [(UITableView *)self->_tableView deselectRowAtIndexPath:v6 animated:v4];
    }
    else
    {
      if (![(RUITableView *)self isShowingPicker])
      {
LABEL_16:
        [(RUITableView *)self showPickerViewForRow:v7 animated:v4];
        goto LABEL_17;
      }
      [(RUITableView *)self hidePickerViewAnimated:1];
    }
  }
LABEL_17:
  id v47 = v11;
  if (self->_datePicker && !self->_showDatePicker || self->_selectPicker && !self->_showSelectPicker) {
    [(RUITableView *)self hidePickerViewAnimated:v4];
  }
  if ([v9 isEqualToString:@"selectPage"])
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_objectModel);
    char v18 = [v7 linkedPage];
    [WeakRetained _displaySupplementalPage:v18];

    [(UITableView *)self->_tableView deselectRowAtIndexPath:v6 animated:(gAnimatedTransitions & 1) == 0];
  }
  if (([v9 isEqualToString:@"button"] & 1) != 0
    || [v9 isEqualToString:@"htmlButton"])
  {
    [(UITableView *)self->_tableView deselectRowAtIndexPath:v6 animated:(gAnimatedTransitions & 1) == 0];
    id v19 = objc_loadWeakRetained((id *)&self->_objectModel);
    [v19 tableViewOM:self elementDidChange:v7 action:2 completion:0];
  }
  else if (([v9 isEqualToString:@"link"] & 1) != 0 {
         || [v9 isEqualToString:@"htmlLink"])
  }
  {
    [(UITableView *)self->_tableView deselectRowAtIndexPath:v6 animated:(gAnimatedTransitions & 1) == 0];
    [(RUITableView *)self rowDidChange:v7 action:2];
  }
  else
  {
    uint64_t v31 = [v7 attributes];
    uint64_t v32 = [v31 objectForKey:@"radioGroup"];

    if ([v32 length])
    {
      [(RUITableView *)self setSelectedRadioGroupRow:v7];
      [(UITableView *)self->_tableView deselectRowAtIndexPath:v6 animated:(gAnimatedTransitions & 1) == 0];
      [(RUITableView *)self rowDidChange:v7 action:2];
      uint64_t v33 = [(RUITableView *)self objectModel];
      uint64_t v34 = [v33 visiblePage];
      id v35 = [v34 parentPage];

      if (v35)
      {
        id v44 = v32;
        v45 = v33;
        long long v50 = 0u;
        long long v51 = 0u;
        long long v48 = 0u;
        long long v49 = 0u;
        obuint64_t j = [(RUITableView *)self sections];
        uint64_t v36 = [obj countByEnumeratingWithState:&v48 objects:v53 count:16];
        if (v36)
        {
          uint64_t v37 = v36;
          uint64_t v38 = *(void *)v49;
          do
          {
            for (uint64_t i = 0; i != v37; ++i)
            {
              if (*(void *)v49 != v38) {
                objc_enumerationMutation(obj);
              }
              long long v40 = *(void **)(*((void *)&v48 + 1) + 8 * i);
              long long v41 = [v40 rows];
              if ([v41 containsObject:v7])
              {
                long long v42 = [v40 attributes];
                v43 = [v42 objectForKey:@"autoGoBack"];

                if (v43)
                {
                  [v45 back:self];
                  goto LABEL_54;
                }
              }
              else
              {
              }
            }
            uint64_t v37 = [obj countByEnumeratingWithState:&v48 objects:v53 count:16];
          }
          while (v37);
        }
LABEL_54:

        id v11 = v47;
        uint64_t v32 = v44;
        uint64_t v33 = v45;
      }
    }
  }
  long long v20 = [v7 attributes];
  long long v21 = [v20 objectForKeyedSubscript:@"alternateDetailLabel"];

  if (v21)
  {
    objc_msgSend(v7, "setShowAlternateDetailLabel:", objc_msgSend(v7, "showAlternateDetailLabel") ^ 1);
    tableView = self->_tableView;
    id v52 = v6;
    double v23 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v52 count:1];
    [(UITableView *)tableView reloadRowsAtIndexPaths:v23 withRowAnimation:5];
  }
  double v24 = [(RUITableView *)self tableView];
  int v25 = [v24 allowsMultipleSelectionDuringEditing];
  uint64_t v26 = [(RUITableView *)self tableView];
  int v27 = [v26 isEditing];

  if (v25 && v27)
  {
    double v28 = [(RUITableView *)self objectModel];
    [v28 tableViewOMDidChange:self];
  }
  [(UITableView *)self->_tableView endUpdates];

LABEL_36:
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  int v8 = [(RUITableView *)self objectModelRowForIndexPath:v7];
  double v9 = [v8 tableCell];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    double v11 = *MEMORY[0x263F839B8];
  }
  else if ([(NSIndexPath *)self->_embeddedPickerRowIndexPath isEqual:v7])
  {
    datePicker = self->_datePicker;
    if (!datePicker) {
      datePicker = self->_selectPicker;
    }
    [datePicker frame];
    double v11 = v15;
  }
  else
  {
    LODWORD(v12) = 2139095040;
    LODWORD(v13) = 2139095040;
    [v8 rowHeightWithMax:v6 peggedHeight:v7 tableView:v12 indexPath:v13];
    if (v16 == -1.0)
    {
      float v17 = *MEMORY[0x263F839B8];
      float v16 = v17;
    }
    double v11 = v16;
  }

  return v11;
}

- (double)tableView:(id)a3 estimatedHeightForRowAtIndexPath:(id)a4
{
  return 44.0;
}

- (BOOL)tableView:(id)a3 canFocusRowAtIndexPath:(id)a4
{
  BOOL v4 = [(RUITableView *)self objectModelRowForIndexPath:a4];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return (isKindOfClass & 1) == 0;
}

- (BOOL)tableView:(id)a3 canEditRowAtIndexPath:(id)a4
{
  BOOL v4 = [(RUITableView *)self objectModelRowForIndexPath:a4];
  char v5 = [v4 isEditingEnabled];

  return v5;
}

- (int64_t)tableView:(id)a3 editingStyleForRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  int v8 = [(RUITableView *)self objectModelRowForIndexPath:v7];
  double v9 = [v8 deleteAction];
  if (v9)
  {
  }
  else
  {
    int v10 = [v8 attributes];
    double v11 = [v10 objectForKeyedSubscript:@"deletionFunction"];

    if (!v11)
    {
      int64_t v12 = 0;
      goto LABEL_5;
    }
  }
  int64_t v12 = 1;
LABEL_5:

  return v12;
}

- (BOOL)tableView:(id)a3 shouldIndentWhileEditingRowAtIndexPath:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  int v8 = [(RUITableView *)self objectModelRowForIndexPath:v6];
  int64_t v9 = [(RUITableView *)self tableView:v7 editingStyleForRowAtIndexPath:v6];

  if (v9 != 1) {
    LOBYTE(v9) = [v8 indentWhileEditing];
  }

  return v9;
}

- (void)tableView:(id)a3 commitEditingStyle:(int64_t)a4 forRowAtIndexPath:(id)a5
{
  id v14 = a5;
  if (a4 == 1)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_objectModel);
    int v8 = [WeakRetained tableViewOM:self deleteRowAtIndexPath:v14];

    if (v8)
    {
      int64_t v9 = [(RUITableView *)self sections];
      int v10 = objc_msgSend(v9, "objectAtIndex:", objc_msgSend(v14, "section"));

      objc_msgSend(v10, "removeRowAtIndex:", objc_msgSend(v14, "row"));
      tableView = self->_tableView;
      int64_t v12 = [MEMORY[0x263EFF8C0] arrayWithObject:v14];
      if (gAnimatedTransitions) {
        uint64_t v13 = 5;
      }
      else {
        uint64_t v13 = 100;
      }
      [(UITableView *)tableView deleteRowsAtIndexPaths:v12 withRowAnimation:v13];
    }
  }
}

- (BOOL)tableView:(id)a3 shouldDrawTopSeparatorForSection:(int64_t)a4
{
  id v6 = a3;
  id v7 = [(RUITableView *)self sections];
  int v8 = [v7 objectAtIndex:a4];

  if ([v8 hasValueForDrawsTopSeparator]) {
    char v9 = [v8 drawTopSeparator];
  }
  else {
    char v9 = [v6 _drawsSeparatorAtTopOfSections];
  }
  BOOL v10 = v9;

  return v10;
}

- (void)tableView:(id)a3 accessoryButtonTappedForRowWithIndexPath:(id)a4
{
  id v5 = a4;
  id v6 = [(RUITableView *)self sections];
  objc_msgSend(v6, "objectAtIndexedSubscript:", objc_msgSend(v5, "section"));
  id v12 = (id)objc_claimAutoreleasedReturnValue();

  id v7 = [v12 rows];
  uint64_t v8 = [v5 row];

  char v9 = [v7 objectAtIndexedSubscript:v8];

  BOOL v10 = [v9 detailButton];

  if (v10)
  {
    double v11 = [v9 detailButton];
    [(RUITableView *)self performAction:2 forElement:v11 completion:0];
  }
}

- (BOOL)tableView:(id)a3 shouldShowMenuForRowAtIndexPath:(id)a4
{
  BOOL v4 = [(RUITableView *)self objectModelRowForIndexPath:a4];
  char v5 = [v4 isCopyable];

  return v5;
}

- (id)tableView:(id)a3 contextMenuConfigurationForRowAtIndexPath:(id)a4 point:(CGPoint)a5
{
  char v5 = -[RUITableView objectModelRowForIndexPath:](self, "objectModelRowForIndexPath:", a4, a5.x, a5.y);
  if ([v5 isCopyable])
  {
    id v6 = (void *)MEMORY[0x263F82610];
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __74__RUITableView_tableView_contextMenuConfigurationForRowAtIndexPath_point___block_invoke;
    v9[3] = &unk_264212260;
    id v10 = v5;
    id v7 = [v6 configurationWithIdentifier:0 previewProvider:0 actionProvider:v9];
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

id __74__RUITableView_tableView_contextMenuConfigurationForRowAtIndexPath_point___block_invoke(uint64_t a1)
{
  v21[1] = *MEMORY[0x263EF8340];
  double v2 = (void *)MEMORY[0x263F823D0];
  double v3 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  BOOL v4 = [v3 localizedStringForKey:@"COPY" value:&stru_26C545B50 table:@"Localizable"];
  char v5 = [MEMORY[0x263F827E8] systemImageNamed:@"doc.on.doc"];
  uint64_t v15 = MEMORY[0x263EF8330];
  uint64_t v16 = 3221225472;
  float v17 = __74__RUITableView_tableView_contextMenuConfigurationForRowAtIndexPath_point___block_invoke_2;
  char v18 = &unk_264212238;
  id v19 = *(id *)(a1 + 32);
  id v6 = [v2 actionWithTitle:v4 image:v5 identifier:0 handler:&v15];

  id v7 = objc_msgSend(*(id *)(a1 + 32), "attributes", v15, v16, v17, v18);
  uint64_t v8 = [v7 objectForKeyedSubscript:@"contextMenuTitle"];

  char v9 = (void *)MEMORY[0x263F82940];
  if (v8)
  {
    id v10 = [*(id *)(a1 + 32) attributes];
    double v11 = [v10 objectForKeyedSubscript:@"contextMenuTitle"];
    v21[0] = v6;
    id v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:v21 count:1];
    uint64_t v13 = [v9 menuWithTitle:v11 children:v12];
  }
  else
  {
    long long v20 = v6;
    id v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v20 count:1];
    uint64_t v13 = [v9 menuWithChildren:v10];
  }

  return v13;
}

void __74__RUITableView_tableView_contextMenuConfigurationForRowAtIndexPath_point___block_invoke_2(uint64_t a1)
{
  id v3 = [MEMORY[0x263F82A18] generalPasteboard];
  double v2 = (void *)[*(id *)(a1 + 32) copyText];
  [v3 setString:v2];
}

- (BOOL)tableView:(id)a3 canPerformAction:(SEL)a4 forRowAtIndexPath:(id)a5 withSender:(id)a6
{
  id v7 = [(RUITableView *)self objectModelRowForIndexPath:a5];
  uint64_t v8 = v7;
  BOOL v9 = sel_copy_ == a4 && ([v7 isCopyable] & 1) != 0;

  return v9;
}

- (void)tableView:(id)a3 performAction:(SEL)a4 forRowAtIndexPath:(id)a5 withSender:(id)a6
{
  if (sel_copy_ == a4)
  {
    id v9 = [(RUITableView *)self objectModelRowForIndexPath:a5];
    id v7 = [MEMORY[0x263F82A18] generalPasteboard];
    uint64_t v8 = (void *)[v9 copyText];
    [v7 setString:v8];
  }
  else
  {
    id v6 = _RUILoggingFacility();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[RUITableView tableView:performAction:forRowAtIndexPath:withSender:](v6);
    }
  }
}

- (id)indexPathForPreferredFocusedViewInTableView:(id)a3
{
  id v3 = a3;
  if ([v3 numberOfSections] < 1 || objc_msgSend(v3, "numberOfRowsInSection:", 0) < 1)
  {
    BOOL v4 = 0;
  }
  else
  {
    BOOL v4 = [MEMORY[0x263F088C8] indexPathForRow:0 inSection:0];
  }

  return v4;
}

- (void)scrollViewWillBeginDragging:(id)a3
{
  if (![(RUITableView *)self isShowingPicker])
  {
    BOOL v4 = [(UITableView *)self->_tableView firstResponder];
    [v4 resignFirstResponder];

    [(RUITableView *)self _hideRightBarButtonItemForLabel];
  }
}

- (void)tableView:(id)a3 didUpdateFocusInContext:(id)a4 withAnimationCoordinator:(id)a5
{
  id v12 = a4;
  id v6 = [v12 previouslyFocusedIndexPath];

  if (v6)
  {
    id v7 = [v12 previouslyFocusedIndexPath];
    uint64_t v8 = [(RUITableView *)self objectModelRowForIndexPath:v7];

    [v8 setFocused:0];
  }
  id v9 = [v12 nextFocusedIndexPath];

  if (v9)
  {
    id v10 = [v12 nextFocusedIndexPath];
    double v11 = [(RUITableView *)self objectModelRowForIndexPath:v10];

    [v11 setFocused:1];
  }
}

- (void)performAction:(int)a3 forElement:(id)a4 completion:(id)a5
{
  p_objectModel = &self->_objectModel;
  id v7 = a5;
  id v8 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)p_objectModel);
  [WeakRetained activateElement:v8 completion:v7];
}

- (void)textFieldStartedEditing:(id)a3
{
  id v4 = a3;
  [(UITableView *)self->_tableView selectRowAtIndexPath:0 animated:(gAnimatedTransitions & 1) == 0 scrollPosition:0];
  if (self->_showingRightLabelNavBarButtons) {
    [(RUITableView *)self _hideRightBarButtonItemForLabel];
  }
  if (self->_showingLeftLabelNavBarButtons) {
    [(RUITableView *)self _hideLeftBarButtonItemForLabel];
  }
  id v24 = v4;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  BOOL v6 = v24 == 0;
  if (isKindOfClass)
  {
    id v7 = v24;
    if (!v24) {
      goto LABEL_20;
    }
    goto LABEL_13;
  }
  id v7 = v24;
  if (v24)
  {
    id v7 = v24;
    do
    {
      id v8 = v7;
      id v7 = [v7 superview];

      objc_opt_class();
      char v9 = objc_opt_isKindOfClass();
      BOOL v6 = v7 == 0;
    }
    while ((v9 & 1) == 0 && v7);
  }
  if (!v6)
  {
LABEL_13:
    uint64_t v10 = [(UITableView *)self->_tableView indexPathForCell:v7];
    if (v10)
    {
      double v11 = (void *)v10;
      id v12 = [(RUITableView *)self objectModelRowForIndexPath:v10];
      uint64_t v13 = [v12 attributes];
      id v14 = [v13 objectForKeyedSubscript:@"class"];
      if ([v14 isEqualToString:@"editableText"])
      {
        uint64_t v15 = [v12 attributes];
        uint64_t v16 = [v15 objectForKeyedSubscript:@"changeNavButtonBarOnEdit"];
        int v17 = [v16 isEqualToString:@"true"];

        if (v17)
        {
          char v18 = [v12 attributes];
          id v19 = [v18 objectForKeyedSubscript:@"navButtonBarPosition"];
          int v20 = [v19 isEqualToString:@"right"];

          if (v20)
          {
            [(RUITableView *)self _showRightBarButtonItemForLabel];
          }
          else
          {
            long long v21 = [v12 attributes];
            id v22 = [v21 objectForKeyedSubscript:@"navButtonBarPosition"];
            int v23 = [v22 isEqualToString:@"left"];

            if (v23) {
              [(RUITableView *)self _showLeftBarButtonItemForLabel];
            }
          }
        }
      }
      else
      {
      }
      [(RUITableView *)self activateRowAtIndexPath:v11 animated:(gAnimatedTransitions & 1) == 0];
    }
  }
LABEL_20:
}

- (void)_textChanged:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_objectModel);
  [WeakRetained tableViewOMDidChange:self];
}

- (BOOL)webViewOM:(id)a3 shouldStartLoadWithRequest:(id)a4 navigationType:(int64_t)a5
{
  p_objectModel = &self->_objectModel;
  id v8 = a4;
  id v9 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_objectModel);
  LOBYTE(a5) = [WeakRetained webViewOM:v9 shouldStartLoadWithRequest:v8 navigationType:a5];

  return a5;
}

- (id)sourceURL
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_objectModel);
  id v3 = [WeakRetained sourceURL];

  return v3;
}

- (void)_enumerateRowsUsingBlock:(id)a3
{
  id v4 = (void (**)(id, void *, void *, unsigned char *))a3;
  unint64_t v5 = 0;
  unint64_t v6 = 0;
  char v16 = 0;
  do
  {
    id v7 = [(RUITableView *)self sections];
    unint64_t v8 = [v7 count];

    if (v5 >= v8) {
      break;
    }
    id v9 = [(RUITableView *)self sections];
    uint64_t v10 = [v9 objectAtIndexedSubscript:v5];

    double v11 = [v10 rows];
    unint64_t v12 = [v11 count];

    if (v6 < v12)
    {
      uint64_t v13 = [MEMORY[0x263F088C8] indexPathForRow:v6 inSection:v5];
      id v14 = [(RUITableView *)self objectModelRowForIndexPath:v13];
      v4[2](v4, v14, v13, &v16);
    }
    BOOL v15 = v6 + 1 >= v12;
    if (v6 + 1 < v12) {
      ++v6;
    }
    else {
      unint64_t v6 = 0;
    }
    if (v15) {
      ++v5;
    }
  }
  while (!v16);
}

- (void)rowDidEndEditing:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [v4 attributes];
  unint64_t v6 = [v5 objectForKey:@"nextKeyField"];

  id v7 = [v6 lowercaseString];
  char v8 = [v7 isEqualToString:@"false"];

  if ((v8 & 1) == 0)
  {
    if (v6)
    {
      uint64_t v27 = 0;
      double v28 = &v27;
      uint64_t v29 = 0x3032000000;
      long long v30 = __Block_byref_object_copy__3;
      uint64_t v31 = __Block_byref_object_dispose__3;
      id v32 = 0;
      v24[0] = MEMORY[0x263EF8330];
      v24[1] = 3221225472;
      v24[2] = __33__RUITableView_rowDidEndEditing___block_invoke;
      v24[3] = &unk_264212288;
      id v25 = v6;
      uint64_t v26 = &v27;
      [(RUITableView *)self _enumerateRowsUsingBlock:v24];
      if (v28[5]) {
        -[RUITableView _becomeFirstResponderAtIndexPath:](self, "_becomeFirstResponderAtIndexPath:");
      }

      _Block_object_dispose(&v27, 8);
    }
    else
    {
      id v9 = [(RUITableView *)self indexPathForRow:v4];
      uint64_t v10 = [v9 section];
      uint64_t v22 = [v9 row];
      double v11 = [(RUITableView *)self sections];
      uint64_t v12 = [v11 count];

      while (--v12 >= 0)
      {
        uint64_t v13 = [(RUITableView *)self sections];
        id v14 = [v13 objectAtIndexedSubscript:v12];
        BOOL v15 = [v14 rows];
        uint64_t v16 = [v15 count];

        if (v16)
        {
          if (v10 == v12)
          {
            int v17 = [(RUITableView *)self sections];
            char v18 = [v17 objectAtIndexedSubscript:v10];
            id v19 = [v18 rows];
            uint64_t v20 = [v19 count] - 1;

            if (v22 == v20)
            {
              id WeakRetained = objc_loadWeakRetained((id *)&self->_objectModel);
              [WeakRetained tableViewOMSubmitForm:self];

              [(RUITableView *)self _hideRightBarButtonItemForLabel];
              goto LABEL_13;
            }
          }
          break;
        }
      }
      [(RUITableView *)self _hideRightBarButtonItemForLabel];
      v23[0] = MEMORY[0x263EF8330];
      v23[1] = 3221225472;
      v23[2] = __33__RUITableView_rowDidEndEditing___block_invoke_2;
      v23[3] = &unk_2642122B0;
      v23[5] = v10;
      v23[6] = v22;
      v23[4] = self;
      [(RUITableView *)self _enumerateRowsUsingBlock:v23];
LABEL_13:
    }
  }
}

void __33__RUITableView_rowDidEndEditing___block_invoke(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  id v11 = a3;
  char v8 = [a2 attributes];
  id v9 = [v8 objectForKey:@"id"];
  int v10 = [v9 isEqualToString:*(void *)(a1 + 32)];

  if (v10)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a3);
    *a4 = 1;
  }
}

void __33__RUITableView_rowDidEndEditing___block_invoke_2(uint64_t a1, uint64_t a2, void *a3, unsigned char *a4)
{
  id v6 = a3;
  if (([v6 section] > *(void *)(a1 + 40)
     || [v6 section] == *(void *)(a1 + 40) && objc_msgSend(v6, "row") > *(void *)(a1 + 48))
    && [*(id *)(a1 + 32) _becomeFirstResponderAtIndexPath:v6])
  {
    *a4 = 1;
  }
}

- (BOOL)_becomeFirstResponderAtIndexPath:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(RUITableView *)self objectModelRowForIndexPath:v4];
  id v6 = [v5 tableCell];
  id v7 = [v6 editableTextField];
  if (v7)
  {
    BOOL v8 = 1;
    [(RUITableView *)self activateRowAtIndexPath:v4 animated:(gAnimatedTransitions & 1) == 0];
  }
  else if ([v5 supportsAutomaticSelection])
  {
    BOOL v8 = 1;
    [(UITableView *)self->_tableView selectRowAtIndexPath:v4 animated:(gAnimatedTransitions & 1) == 0 scrollPosition:0];
    [(RUITableView *)self tableView:self->_tableView didSelectRowAtIndexPath:v4];
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (void)rowDidChange:(id)a3 action:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_objectModel);
  [WeakRetained tableViewOMDidChange:self];

  BOOL v8 = [v6 attributes];
  id v9 = [v8 objectForKeyedSubscript:@"class"];
  if (([v9 isEqualToString:@"switch"] & 1) == 0)
  {

    goto LABEL_6;
  }
  int v10 = [v6 attributes];
  id v11 = [v10 objectForKeyedSubscript:@"url"];

  if (v11)
  {
    uint64_t v12 = [v6 attributes];
    uint64_t v13 = [v12 objectForKeyedSubscript:@"httpMethod"];

    if (!v13)
    {
      id v14 = [v6 attributes];
      BOOL v8 = (void *)[v14 mutableCopy];

      [v8 setObject:@"POST" forKeyedSubscript:@"httpMethod"];
      [v6 setAttributes:v8];
LABEL_6:
    }
  }
  [v6 startActivityIndicator];
  id v15 = objc_loadWeakRetained((id *)&self->_objectModel);
  char v16 = objc_opt_respondsToSelector();

  if (v16)
  {
    id v17 = objc_loadWeakRetained((id *)&self->_objectModel);
    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    v18[2] = __36__RUITableView_rowDidChange_action___block_invoke;
    v18[3] = &unk_2642113C0;
    id v19 = v6;
    [v17 tableViewOM:self elementDidChange:v19 action:v4 completion:v18];
  }
}

void __36__RUITableView_rowDidChange_action___block_invoke(uint64_t a1, char a2)
{
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = __36__RUITableView_rowDidChange_action___block_invoke_2;
  v2[3] = &unk_2642122D8;
  char v4 = a2;
  id v3 = *(id *)(a1 + 32);
  dispatch_async(MEMORY[0x263EF83A0], v2);
}

uint64_t __36__RUITableView_rowDidChange_action___block_invoke_2(uint64_t a1)
{
  if (!*(unsigned char *)(a1 + 40))
  {
    double v2 = [*(id *)(a1 + 32) attributes];
    id v3 = [v2 objectForKeyedSubscript:@"class"];
    int v4 = [v3 isEqualToString:@"switch"];

    if (v4) {
      [*(id *)(a1 + 32) switchCanceled];
    }
  }
  unint64_t v5 = *(void **)(a1 + 32);
  return [v5 stopActivityIndicator];
}

- (id)textFieldRow:(id)a3 changeCharactersInRange:(_NSRange)a4 replacementString:(id)a5
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  id v9 = (__CFString *)a5;
  id v10 = a3;
  id v11 = [v10 attributes];
  uint64_t v12 = [v11 objectForKey:@"changeCharactersFunction"];

  uint64_t v13 = [v10 tableCell];

  id v14 = [v13 ruiEditableTextField];
  uint64_t v15 = [v14 text];

  if (v15) {
    char v16 = (__CFString *)v15;
  }
  else {
    char v16 = &stru_26C545B50;
  }
  if (v9) {
    id v17 = v9;
  }
  else {
    id v17 = &stru_26C545B50;
  }
  p_objectModel = &self->_objectModel;
  id v19 = v9;
  id WeakRetained = objc_loadWeakRetained((id *)p_objectModel);
  long long v21 = (void *)MEMORY[0x263EFF8C0];
  uint64_t v22 = [NSNumber numberWithUnsignedInteger:location];
  int v23 = [NSNumber numberWithUnsignedInteger:length];
  id v24 = objc_msgSend(v21, "arrayWithObjects:", v16, v22, v23, v17, 0);
  id v25 = [WeakRetained invokeScriptFunction:v12 withArguments:v24];

  return v25;
}

- (Class)tableCellClassForTableViewRow:(id)a3
{
  p_objectModel = &self->_objectModel;
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_objectModel);
  id v6 = [WeakRetained customTableCellClassForTableViewRow:v4];

  return (Class)v6;
}

- (id)filteredResultsWithSearchTerm:(id)a3
{
  id v4 = a3;
  unint64_t v5 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", -[NSMutableArray count](self->_sections, "count"));
  sections = self->_sections;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __46__RUITableView_filteredResultsWithSearchTerm___block_invoke;
  v12[3] = &unk_264212328;
  id v13 = v4;
  id v7 = v5;
  id v14 = v7;
  id v8 = v4;
  [(NSMutableArray *)sections enumerateObjectsUsingBlock:v12];
  id v9 = v14;
  id v10 = v7;

  return v10;
}

void __46__RUITableView_filteredResultsWithSearchTerm___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = (void *)[v3 copy];
  unint64_t v5 = [v3 rows];

  uint64_t v9 = MEMORY[0x263EF8330];
  uint64_t v10 = 3221225472;
  id v11 = __46__RUITableView_filteredResultsWithSearchTerm___block_invoke_2;
  uint64_t v12 = &unk_264212300;
  id v13 = *(id *)(a1 + 32);
  id v6 = v4;
  id v14 = v6;
  [v5 enumerateObjectsUsingBlock:&v9];

  id v7 = objc_msgSend(v6, "rows", v9, v10, v11, v12);
  uint64_t v8 = [v7 count];

  if (v8) {
    [*(id *)(a1 + 40) addObject:v6];
  }
}

void __46__RUITableView_filteredResultsWithSearchTerm___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 matchesSearchTerm:*(void *)(a1 + 32)]) {
    [*(id *)(a1 + 40) addRow:v3];
  }
}

- (void)searchBar:(id)a3 textDidChange:(id)a4
{
  unint64_t v5 = [a3 text];
  id v6 = [MEMORY[0x263F08708] whitespaceAndNewlineCharacterSet];
  id v10 = [v5 stringByTrimmingCharactersInSet:v6];

  if ([v10 length])
  {
    self->_isSearching = 1;
    id v7 = [(RUITableView *)self filteredResultsWithSearchTerm:v10];
    filteredSections = self->_filteredSections;
    self->_filteredSections = v7;
  }
  else
  {
    self->_isSearching = 0;
    filteredSections = self->_filteredSections;
    self->_filteredSections = 0;
  }

  uint64_t v9 = [(RUITableView *)self tableView];
  [v9 reloadData];
}

- (void)searchBarCancelButtonClicked:(id)a3
{
  self->_isSearching = 0;
  filteredSections = self->_filteredSections;
  self->_filteredSections = 0;
  id v5 = a3;

  [v5 setText:&stru_26C545B50];
  id v6 = [(RUITableView *)self tableView];
  [v6 reloadData];
}

- (void)searchBarSearchButtonClicked:(id)a3
{
}

- (CGSize)scrollView:(id)a3 contentSizeForZoomScale:(double)a4 withProposedSize:(CGSize)a5
{
  CGFloat height = a5.height;
  double width = a5.width;
  p_cachedContentSize = &self->_cachedContentSize;
  double v9 = FASizeRoundMetrics(self->_cachedContentSize.width);
  double v11 = v10;
  if (v9 != FASizeRoundMetrics(width) || v11 != v12)
  {
    id v14 = [(RUIElement *)self pageElement];
    uint64_t v15 = [v14 page];
    char v16 = [v15 view];
    [v16 setNeedsLayout];
  }
  p_cachedContentSize->double width = width;
  p_cachedContentSize->CGFloat height = height;
  double v17 = width;
  double v18 = height;
  result.CGFloat height = v18;
  result.double width = v17;
  return result;
}

- (RUITableViewRow)defaultFirstResponderRow
{
  return self->_defaultFirstResponderRow;
}

- (void)setDefaultFirstResponderRow:(id)a3
{
}

- (RUIObjectModel)objectModel
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_objectModel);
  return (RUIObjectModel *)WeakRetained;
}

- (void)setObjectModel:(id)a3
{
}

- (RUIPage)page
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_page);
  return (RUIPage *)WeakRetained;
}

- (void)setPage:(id)a3
{
}

- (RUIHeaderElement)header
{
  return self->_header;
}

- (void)setHeader:(id)a3
{
}

- (RUISubHeaderElement)subHeader
{
  return self->_subHeader;
}

- (void)setSubHeader:(id)a3
{
}

- (RUIFooterElement)footer
{
  return self->_footer;
}

- (void)setFooter:(id)a3
{
}

- (NSString)headerTitle
{
  return self->_headerTitle;
}

- (void)setHeaderTitle:(id)a3
{
}

- (NSString)subHeaderTitle
{
  return self->_subHeaderTitle;
}

- (void)setSubHeaderTitle:(id)a3
{
}

- (UISearchBar)searchBar
{
  return self->_searchBar;
}

- (UIPickerView)selectPicker
{
  return self->_selectPicker;
}

- (void)setSelectPicker:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_selectPicker, 0);
  objc_storeStrong((id *)&self->_searchBar, 0);
  objc_storeStrong((id *)&self->_subHeaderTitle, 0);
  objc_storeStrong((id *)&self->_headerTitle, 0);
  objc_storeStrong((id *)&self->_footer, 0);
  objc_storeStrong((id *)&self->_subHeader, 0);
  objc_storeStrong((id *)&self->_header, 0);
  objc_destroyWeak((id *)&self->_page);
  objc_destroyWeak((id *)&self->_objectModel);
  objc_storeStrong((id *)&self->_filteredSections, 0);
  objc_storeStrong((id *)&self->_oldRightBarButtonItemForLabel, 0);
  objc_storeStrong((id *)&self->_oldLeftBarButtonItemForLabel, 0);
  objc_storeStrong((id *)&self->_currentTraitCollection, 0);
  objc_storeStrong((id *)&self->_headerView, 0);
  objc_storeStrong((id *)&self->_oldPickerDate, 0);
  objc_storeStrong((id *)&self->_oldRightBarButtonItemForPicker, 0);
  objc_storeStrong((id *)&self->_oldLeftBarButtonItemForPicker, 0);
  objc_storeStrong((id *)&self->_defaultFirstResponderRow, 0);
  objc_storeStrong((id *)&self->_embeddedPickerRowIndexPath, 0);
  objc_storeStrong((id *)&self->_pickerRowIndexPath, 0);
  objc_storeStrong((id *)&self->_pickerBackdrop, 0);
  objc_storeStrong((id *)&self->_datePicker, 0);
  objc_storeStrong((id *)&self->_tableView, 0);
  objc_storeStrong((id *)&self->_sections, 0);
}

- (void)tableView:(os_log_t)log performAction:forRowAtIndexPath:withSender:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_2144F2000, log, OS_LOG_TYPE_ERROR, "Unrecognized action for table view", v1, 2u);
}

@end