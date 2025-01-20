@interface MapsDebugValuesViewController
+ (BOOL)isSearchable;
+ (id)navigationDestinationTitle;
- (BOOL)debugTableRow:(id)a3 matches:(id)a4;
- (BOOL)debugTableSection:(id)a3 matches:(id)a4;
- (MapsDebugValuesViewController)init;
- (MapsDebugViewControllerDelegate)delegate;
- (MapsDebugViewControllerNavigationDelegate)navigationDelegate;
- (NSString)navigationDestinationTitle;
- (double)tableView:(id)a3 estimatedHeightForRowAtIndexPath:(id)a4;
- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4;
- (id)_sections;
- (id)addSectionWithTitle:(id)a3 content:(id)a4;
- (id)prepareContentBlock;
- (id)rowAtIndexPath:(id)a3;
- (id)sectionAtIndex:(int64_t)a3;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4 itemIdentifier:(id)a5;
- (void)_applySnapshotWithFilterText:(id)a3 animated:(BOOL)a4;
- (void)_done;
- (void)addSection:(id)a3;
- (void)dealloc;
- (void)loadContentNowIfNeeded;
- (void)loadContentNowIfNeeded:(BOOL)a3;
- (void)prepareContent;
- (void)rebuildSections;
- (void)reloadData;
- (void)searchBar:(id)a3 textDidChange:(id)a4;
- (void)searchBarCancelButtonClicked:(id)a3;
- (void)segueToViewController:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setNavigationDelegate:(id)a3;
- (void)setNavigationDestinationTitle:(id)a3;
- (void)setPrepareContentBlock:(id)a3;
- (void)tableView:(id)a3 didEndDisplayingCell:(id)a4 forRowAtIndexPath:(id)a5;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)updateSearchResultsForSearchController:(id)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)willNavigateToSubsequentController:(id)a3;
@end

@implementation MapsDebugValuesViewController

+ (id)navigationDestinationTitle
{
  return @"Debug Settings";
}

- (MapsDebugValuesViewController)init
{
  v9.receiver = self;
  v9.super_class = (Class)MapsDebugValuesViewController;
  v2 = [(MapsDebugValuesViewController *)&v9 initWithStyle:2];
  if (v2)
  {
    v3 = [(id)objc_opt_class() navigationDestinationTitle];
    [(MapsDebugValuesViewController *)v2 setTitle:v3];

    id v4 = [objc_alloc((Class)UIBarButtonItem) initWithBarButtonSystemItem:0 target:v2 action:"_done"];
    v5 = [(MapsDebugValuesViewController *)v2 navigationItem];
    [v5 setRightBarButtonItem:v4];

    if ([(id)objc_opt_class() isSearchable])
    {
      v6 = (UISearchController *)objc_alloc_init((Class)UISearchController);
      searchController = v2->_searchController;
      v2->_searchController = v6;

      [(UISearchController *)v2->_searchController setDelegate:v2];
      [(UISearchController *)v2->_searchController setActive:1];
      [(UISearchController *)v2->_searchController setSearchResultsUpdater:v2];
      [(UISearchController *)v2->_searchController setObscuresBackgroundDuringPresentation:0];
    }
  }
  return v2;
}

- (void)dealloc
{
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v3 = self->_sections;
  id v4 = [(NSArray *)v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      v7 = 0;
      do
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v9 + 1) + 8 * (void)v7) setDisplayingViewController:0];
        v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      id v5 = [(NSArray *)v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }

  v8.receiver = self;
  v8.super_class = (Class)MapsDebugValuesViewController;
  [(MapsDebugValuesViewController *)&v8 dealloc];
}

- (void)viewDidLoad
{
  v13.receiver = self;
  v13.super_class = (Class)MapsDebugValuesViewController;
  [(MapsDebugValuesViewController *)&v13 viewDidLoad];
  if (self->_searchController)
  {
    v3 = [MapsDebugValuesViewDiffableDataSource alloc];
    id v4 = [(MapsDebugValuesViewController *)self tableView];
    id v5 = sub_1005B3760(self);
    uint64_t v6 = [(MapsDebugValuesViewDiffableDataSource *)v3 initWithTableView:v4 cellProvider:v5];
    diffableDataSource = self->_diffableDataSource;
    self->_diffableDataSource = v6;

    [(MapsDebugValuesViewDiffableDataSource *)self->_diffableDataSource setDefaultRowAnimation:0];
    objc_storeWeak((id *)&self->_diffableDataSource->_debugVC, self);
    objc_super v8 = [(UISearchController *)self->_searchController searchBar];
    [v8 setDelegate:self];

    searchController = self->_searchController;
    long long v10 = [(MapsDebugValuesViewController *)self navigationItem];
    [v10 setSearchController:searchController];

    long long v11 = [(UISearchController *)self->_searchController searchBar];
    [v11 setTranslatesAutoresizingMaskIntoConstraints:0];

    long long v12 = [(UISearchController *)self->_searchController searchBar];
    [v12 setAutocorrectionType:1];
  }
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)MapsDebugValuesViewController;
  [(MapsDebugValuesViewController *)&v4 viewWillAppear:a3];
  [(MapsDebugValuesViewController *)self loadContentNowIfNeeded:0];
}

+ (BOOL)isSearchable
{
  return 1;
}

- (void)prepareContent
{
  if (self->_navigationDestinationTitle) {
    -[MapsDebugValuesViewController setTitle:](self, "setTitle:");
  }
  id prepareContentBlock = self->_prepareContentBlock;
  if (prepareContentBlock)
  {
    objc_super v4 = (void (*)(void))*((void *)prepareContentBlock + 2);
    v4();
  }
}

- (void)addSection:(id)a3
{
}

- (id)addSectionWithTitle:(id)a3 content:(id)a4
{
  uint64_t v6 = (void (**)(id, MapsDebugTableSection *))a4;
  id v7 = a3;
  objc_super v8 = objc_alloc_init(MapsDebugTableSection);
  [(MapsDebugTableSection *)v8 setTitle:v7];

  v6[2](v6, v8);
  [(MapsDebugTableSection *)v8 commit];
  [(NSMutableArray *)self->_mutableSections addObject:v8];

  return v8;
}

- (id)_sections
{
  [(MapsDebugValuesViewController *)self loadContentNowIfNeeded:0];
  sections = self->_sections;

  return sections;
}

- (void)loadContentNowIfNeeded
{
}

- (void)loadContentNowIfNeeded:(BOOL)a3
{
  if (!self->_sections)
  {
    v3 = self;
    BOOL v34 = a3;
    objc_super v4 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    mutableSections = v3->_mutableSections;
    v3->_mutableSections = v4;

    [(MapsDebugValuesViewController *)v3 prepareContent];
    uint64_t v6 = (NSArray *)[(NSMutableArray *)v3->_mutableSections copy];
    sections = v3->_sections;
    v3->_sections = v6;

    objc_super v8 = v3->_mutableSections;
    v3->_mutableSections = 0;

    v36 = +[NSMutableDictionary dictionary];
    long long v9 = +[NSMutableDictionary dictionary];
    long long v47 = 0u;
    long long v48 = 0u;
    long long v49 = 0u;
    long long v50 = 0u;
    long long v10 = v3->_sections;
    id v11 = [(NSArray *)v10 countByEnumeratingWithState:&v47 objects:v53 count:16];
    v35 = v3;
    if (v11)
    {
      id v12 = v11;
      uint64_t v13 = *(void *)v48;
      do
      {
        for (i = 0; i != v12; i = (char *)i + 1)
        {
          if (*(void *)v48 != v13) {
            objc_enumerationMutation(v10);
          }
          v15 = *(void **)(*((void *)&v47 + 1) + 8 * i);
          [v15 setDisplayingViewController:v3];
          [v15 commit];
          if ([v15 visible])
          {
            v16 = +[NSNumber numberWithUnsignedLong:v15];
            [v36 setObject:v15 forKeyedSubscript:v16];

            v3 = v35;
          }
        }
        id v12 = [(NSArray *)v10 countByEnumeratingWithState:&v47 objects:v53 count:16];
      }
      while (v12);
    }

    v17 = (NSDictionary *)[v36 copy];
    sectionIdentifierMap = v3->_sectionIdentifierMap;
    v3->_sectionIdentifierMap = v17;

    long long v45 = 0u;
    long long v46 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    obj = v3->_sections;
    id v19 = [(NSArray *)obj countByEnumeratingWithState:&v43 objects:v52 count:16];
    if (v19)
    {
      id v20 = v19;
      uint64_t v38 = *(void *)v44;
      do
      {
        for (j = 0; j != v20; j = (char *)j + 1)
        {
          if (*(void *)v44 != v38) {
            objc_enumerationMutation(obj);
          }
          v22 = *(void **)(*((void *)&v43 + 1) + 8 * (void)j);
          long long v39 = 0u;
          long long v40 = 0u;
          long long v41 = 0u;
          long long v42 = 0u;
          v23 = [v22 rows];
          id v24 = [v23 countByEnumeratingWithState:&v39 objects:v51 count:16];
          if (v24)
          {
            id v25 = v24;
            uint64_t v26 = *(void *)v40;
            do
            {
              for (k = 0; k != v25; k = (char *)k + 1)
              {
                if (*(void *)v40 != v26) {
                  objc_enumerationMutation(v23);
                }
                v28 = *(void **)(*((void *)&v39 + 1) + 8 * (void)k);
                if ([v28 visible])
                {
                  v29 = +[NSNumber numberWithUnsignedLong:v28];
                  [v9 setObject:v28 forKeyedSubscript:v29];
                }
              }
              id v25 = [v23 countByEnumeratingWithState:&v39 objects:v51 count:16];
            }
            while (v25);
          }
        }
        id v20 = [(NSArray *)obj countByEnumeratingWithState:&v43 objects:v52 count:16];
      }
      while (v20);
    }

    v30 = (NSDictionary *)[v9 copy];
    rowIdentifierMap = v35->_rowIdentifierMap;
    v35->_rowIdentifierMap = v30;

    if ([(UISearchController *)v35->_searchController isActive])
    {
      v32 = [(UISearchController *)v35->_searchController searchBar];
      v33 = [v32 text];
    }
    else
    {
      v33 = 0;
    }
    [(MapsDebugValuesViewController *)v35 _applySnapshotWithFilterText:v33 animated:v34];
  }
}

- (BOOL)debugTableSection:(id)a3 matches:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = [v5 title];
  if ([v7 localizedCaseInsensitiveContainsString:v6])
  {
    unsigned __int8 v8 = 1;
  }
  else
  {
    long long v9 = [v5 footer];
    unsigned __int8 v8 = [v9 localizedCaseInsensitiveContainsString:v6];
  }
  return v8;
}

- (BOOL)debugTableRow:(id)a3 matches:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = [v5 title];
  if ([v7 localizedCaseInsensitiveContainsString:v6])
  {
    unsigned __int8 v8 = 1;
  }
  else
  {
    long long v9 = [v5 subtitle];
    unsigned __int8 v8 = [v9 localizedCaseInsensitiveContainsString:v6];
  }
  return v8;
}

- (void)_applySnapshotWithFilterText:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if (self->_searchController)
  {
    BOOL v30 = v4;
    v33 = +[NSMutableArray arrayWithCapacity:[(NSArray *)self->_sections count]];
    long long v47 = 0u;
    long long v48 = 0u;
    long long v49 = 0u;
    long long v50 = 0u;
    id v7 = self->_sections;
    id v8 = [(NSArray *)v7 countByEnumeratingWithState:&v47 objects:v53 count:16];
    long long v9 = &OBJC_IVAR___RoutingMaterialColorSwitchingView__lightMaterial;
    if (v8)
    {
      id v10 = v8;
      uint64_t v11 = *(void *)v48;
      do
      {
        for (i = 0; i != v10; i = (char *)i + 1)
        {
          if (*(void *)v48 != v11) {
            objc_enumerationMutation(v7);
          }
          uint64_t v13 = +[NSNumber numberWithUnsignedLong:*(void *)(*((void *)&v47 + 1) + 8 * i)];
          v14 = [(NSDictionary *)self->_sectionIdentifierMap objectForKeyedSubscript:v13];

          if (v14) {
            [v33 addObject:v13];
          }
        }
        id v10 = [(NSArray *)v7 countByEnumeratingWithState:&v47 objects:v53 count:16];
      }
      while (v10);
    }

    id v32 = objc_alloc_init((Class)NSDiffableDataSourceSnapshot);
    [v32 appendSectionsWithIdentifiers:v33];
    long long v45 = 0u;
    long long v46 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    obj = self->_sections;
    id v35 = [(NSArray *)obj countByEnumeratingWithState:&v43 objects:v52 count:16];
    if (v35)
    {
      uint64_t v34 = *(void *)v44;
      uint64_t v38 = v6;
      do
      {
        for (j = 0; j != v35; j = (char *)j + 1)
        {
          if (*(void *)v44 != v34) {
            objc_enumerationMutation(obj);
          }
          v16 = *(void **)(*((void *)&v43 + 1) + 8 * (void)j);
          v17 = +[NSNumber numberWithUnsignedLong:v16];
          v18 = [*(id *)((char *)&self->super.super.super.super.isa + v9[162]) objectForKeyedSubscript:v17];

          if (v18)
          {
            v36 = v17;
            v37 = j;
            if ([v6 length]) {
              unsigned __int8 v19 = [(MapsDebugValuesViewController *)self debugTableSection:v16 matches:v6];
            }
            else {
              unsigned __int8 v19 = 1;
            }
            id v20 = [v16 rows];
            v21 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v20 count]);

            long long v41 = 0u;
            long long v42 = 0u;
            long long v39 = 0u;
            long long v40 = 0u;
            v22 = [v16 rows];
            id v23 = [v22 countByEnumeratingWithState:&v39 objects:v51 count:16];
            if (v23)
            {
              id v24 = v23;
              uint64_t v25 = *(void *)v40;
              do
              {
                for (k = 0; k != v24; k = (char *)k + 1)
                {
                  if (*(void *)v40 != v25) {
                    objc_enumerationMutation(v22);
                  }
                  uint64_t v27 = *(void *)(*((void *)&v39 + 1) + 8 * (void)k);
                  v28 = +[NSNumber numberWithUnsignedLong:v27];
                  v29 = [(NSDictionary *)self->_rowIdentifierMap objectForKeyedSubscript:v28];

                  if (v29
                    && ((v19 & 1) != 0
                     || ![v38 length]
                     || [(MapsDebugValuesViewController *)self debugTableRow:v27 matches:v38]))
                  {
                    [v21 addObject:v28];
                  }
                }
                id v24 = [v22 countByEnumeratingWithState:&v39 objects:v51 count:16];
              }
              while (v24);
            }

            v17 = v36;
            [v32 appendItemsWithIdentifiers:v21 intoSectionWithIdentifier:v36];

            j = v37;
            id v6 = v38;
            long long v9 = &OBJC_IVAR___RoutingMaterialColorSwitchingView__lightMaterial;
          }
        }
        id v35 = [(NSArray *)obj countByEnumeratingWithState:&v43 objects:v52 count:16];
      }
      while (v35);
    }

    [(MapsDebugValuesViewDiffableDataSource *)self->_diffableDataSource applySnapshot:v32 animatingDifferences:v30];
  }
}

- (void)segueToViewController:(id)a3
{
  id v4 = a3;
  [(MapsDebugValuesViewController *)self willNavigateToSubsequentController:v4];
  id v5 = [(MapsDebugValuesViewController *)self navigationDelegate];

  if (v5)
  {
    id v6 = [(MapsDebugValuesViewController *)self navigationDelegate];
    [v6 debugViewController:self segueToViewController:v4];
  }
  else
  {
    id v6 = [(MapsDebugValuesViewController *)self navigationController];
    [v6 pushViewController:v4 animated:1];
  }
}

- (void)willNavigateToSubsequentController:(id)a3
{
  id v4 = a3;
  id v5 = [(MapsDebugValuesViewController *)self delegate];
  [v4 setDelegate:v5];
}

- (void)_done
{
  id v3 = [(MapsDebugValuesViewController *)self delegate];
  [v3 debugControllerDidFinish:self];
}

- (id)sectionAtIndex:(int64_t)a3
{
  id v4 = [(MapsDebugValuesViewDiffableDataSource *)self->_diffableDataSource sectionIdentifierForIndex:a3];
  id v5 = [(NSDictionary *)self->_sectionIdentifierMap objectForKeyedSubscript:v4];

  return v5;
}

- (id)rowAtIndexPath:(id)a3
{
  id v4 = [(MapsDebugValuesViewDiffableDataSource *)self->_diffableDataSource itemIdentifierForIndexPath:a3];
  id v5 = [(NSDictionary *)self->_rowIdentifierMap objectForKeyedSubscript:v4];

  return v5;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4 itemIdentifier:(id)a5
{
  rowIdentifierMap = self->_rowIdentifierMap;
  id v7 = a3;
  id v8 = [(NSDictionary *)rowIdentifierMap objectForKeyedSubscript:a5];
  long long v9 = [v8 cellForTableView:v7];

  id v10 = [v8 selectionAction];
  [v9 setSelectionStyle:v10 != 0];

  [v8 setCurrentCell:v9];

  return v9;
}

- (void)tableView:(id)a3 didEndDisplayingCell:(id)a4 forRowAtIndexPath:(id)a5
{
  id v7 = a4;
  id v9 = [(MapsDebugValuesViewController *)self rowAtIndexPath:a5];
  id v8 = [v9 currentCell];

  if (v8 == v7) {
    [v9 setCurrentCell:0];
  }
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  return UITableViewAutomaticDimension;
}

- (double)tableView:(id)a3 estimatedHeightForRowAtIndexPath:(id)a4
{
  return 44.0;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  id v7 = [(MapsDebugValuesViewController *)self rowAtIndexPath:v6];
  id v8 = [v7 selectionAction];

  if (v8)
  {
    id v9 = [v7 selectionAction];
    v9[2]();
  }
  [v10 deselectRowAtIndexPath:v6 animated:1];
}

- (void)reloadData
{
  id v2 = [(MapsDebugValuesViewController *)self tableView];
  [v2 reloadData];
}

- (void)rebuildSections
{
  sections = self->_sections;
  self->_sections = 0;

  [(MapsDebugValuesViewController *)self loadContentNowIfNeeded:1];

  [(MapsDebugValuesViewController *)self reloadData];
}

- (void)updateSearchResultsForSearchController:(id)a3
{
  id v5 = [a3 searchBar];
  id v4 = [v5 text];
  [(MapsDebugValuesViewController *)self _applySnapshotWithFilterText:v4 animated:1];
}

- (void)searchBar:(id)a3 textDidChange:(id)a4
{
}

- (void)searchBarCancelButtonClicked:(id)a3
{
}

- (MapsDebugViewControllerNavigationDelegate)navigationDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_navigationDelegate);

  return (MapsDebugViewControllerNavigationDelegate *)WeakRetained;
}

- (void)setNavigationDelegate:(id)a3
{
}

- (MapsDebugViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (MapsDebugViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (id)prepareContentBlock
{
  return self->_prepareContentBlock;
}

- (void)setPrepareContentBlock:(id)a3
{
}

- (NSString)navigationDestinationTitle
{
  return self->_navigationDestinationTitle;
}

- (void)setNavigationDestinationTitle:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_navigationDestinationTitle, 0);
  objc_storeStrong(&self->_prepareContentBlock, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_navigationDelegate);
  objc_storeStrong((id *)&self->_diffableDataSource, 0);
  objc_storeStrong((id *)&self->_searchController, 0);
  objc_storeStrong((id *)&self->_rowIdentifierMap, 0);
  objc_storeStrong((id *)&self->_sectionIdentifierMap, 0);
  objc_storeStrong((id *)&self->_sections, 0);

  objc_storeStrong((id *)&self->_mutableSections, 0);
}

@end