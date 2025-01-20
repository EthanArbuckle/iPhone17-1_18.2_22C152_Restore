@interface VenueCategoryDataSource
- (GEOSearchCategory)searchCategory;
- (MKMapItem)mapItem;
- (NSArray)buildings;
- (NSArray)filterBarTitles;
- (NSArray)sectionIndexTitles;
- (NSArray)subcategories;
- (NSCache)placeSummaryTemplateViewModels;
- (NSMutableDictionary)mapitemTemplates;
- (SearchResultsDataSourceContent)content;
- (VenueCategoryDataSource)initWithTableView:(id)a3 searchCategory:(id)a4;
- (_TtC4Maps28PlaceSummaryAsyncDataManager)placeSummaryAsyncDataManager;
- (_TtC4Maps31PlaceSummaryEVChargerDownloader)evChargerDownloader;
- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4;
- (id)filterBarTitlesWithBuildings;
- (id)filterBarTitlesWithSubcategories;
- (id)personalizedItemForQuickActionMenuWithCell:(id)a3;
- (id)placeSummaryTemplateForSearchResult:(id)a3 indexPath:(id)a4;
- (id)sectionIndexTitlesForTableView:(id)a3;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)venueIdentifier;
- (int)subcategoriesType;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (unint64_t)numberOfSectionsNotEmpty;
- (unint64_t)searchResultLabelContext;
- (void)_cacheEVChargersTemplates;
- (void)dealloc;
- (void)iterateThroughIndexPathsAndExecuteBlock:(id)a3;
- (void)refreshEVChargers:(id)a3;
- (void)resetCache;
- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5;
- (void)setBuildingsWithMapItem:(id)a3;
- (void)setContent:(id)a3;
- (void)setEvChargerDownloader:(id)a3;
- (void)setMapItem:(id)a3;
- (void)setMapitemTemplates:(id)a3;
- (void)setPlaceSummaryAsyncDataManager:(id)a3;
- (void)setPlaceSummaryTemplateViewModels:(id)a3;
- (void)setSearchCategory:(id)a3;
- (void)setSearchResultLabelContext:(unint64_t)a3;
- (void)setSearchResults:(id)a3 labelContext:(unint64_t)a4;
- (void)setSectionIndexTitles:(id)a3;
- (void)setSubcategories:(id)a3;
- (void)setSubcategoriesType:(int)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)tableView:(id)a3 didUpdateFocusInContext:(id)a4 withAnimationCoordinator:(id)a5;
@end

@implementation VenueCategoryDataSource

- (VenueCategoryDataSource)initWithTableView:(id)a3 searchCategory:(id)a4
{
  id v7 = a4;
  v26.receiver = self;
  v26.super_class = (Class)VenueCategoryDataSource;
  v8 = [(DataSource *)&v26 initWithTableView:a3 updateLocation:0];
  v9 = v8;
  if (v8)
  {
    v10 = [(DataSource *)v8 tableView];
    [v10 setDelegate:v9];

    v11 = [(DataSource *)v9 tableView];
    [v11 setDataSource:v9];

    v12 = [(DataSource *)v9 tableView];
    uint64_t v13 = objc_opt_class();
    v14 = +[PlaceSummaryTableViewCell reuseIdentifier];
    [v12 registerClass:v13 forCellReuseIdentifier:v14];

    uint64_t UInteger = GEOConfigGetUInteger();
    v16 = [(DataSource *)v9 tableView];
    [v16 setSectionIndexMinimumDisplayRowCount:UInteger];

    objc_storeStrong((id *)&v9->_searchCategory, a4);
    v9->_searchResultLabelContext = 1;
    v17 = objc_alloc_init(_TtC4Maps28PlaceSummaryAsyncDataManager);
    placeSummaryAsyncDataManager = v9->_placeSummaryAsyncDataManager;
    v9->_placeSummaryAsyncDataManager = v17;

    v19 = objc_alloc_init(_TtC4Maps31PlaceSummaryEVChargerDownloader);
    evChargerDownloader = v9->_evChargerDownloader;
    v9->_evChargerDownloader = v19;

    v21 = (NSCache *)objc_alloc_init((Class)NSCache);
    placeSummaryTemplateViewModels = v9->_placeSummaryTemplateViewModels;
    v9->_placeSummaryTemplateViewModels = v21;

    uint64_t v23 = +[NSMutableDictionary dictionary];
    mapitemTemplates = v9->_mapitemTemplates;
    v9->_mapitemTemplates = (NSMutableDictionary *)v23;
  }
  return v9;
}

- (void)dealloc
{
  [(VenueCategoryDataSource *)self resetCache];
  v3.receiver = self;
  v3.super_class = (Class)VenueCategoryDataSource;
  [(VenueCategoryDataSource *)&v3 dealloc];
}

- (void)resetCache
{
  if (self->_placeSummaryTemplateViewModels)
  {
    objc_super v3 = [(VenueCategoryDataSource *)self placeSummaryTemplateViewModels];
    [v3 removeAllObjects];

    [(VenueCategoryDataSource *)self setPlaceSummaryTemplateViewModels:0];
  }
  evChargerDownloader = self->_evChargerDownloader;
  if (evChargerDownloader)
  {
    self->_evChargerDownloader = 0;
  }
}

- (void)setMapItem:(id)a3
{
  id v7 = a3;
  objc_storeStrong((id *)&self->_mapItem, a3);
  [(VenueCategoryDataSource *)self setBuildingsWithMapItem:self->_mapItem];
  v5 = [(VenueCategoryDataSource *)self content];

  if (v5)
  {
    v6 = [(DataSource *)self tableView];
    [v6 reloadData];
  }
}

- (void)_cacheEVChargersTemplates
{
  objc_super v3 = [(SearchResultsDataSourceContent *)self->_content objects];
  id v4 = [v3 count];

  if (v4)
  {
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_100CFFFFC;
    v5[3] = &unk_1012F5F78;
    v5[4] = self;
    [(VenueCategoryDataSource *)self iterateThroughIndexPathsAndExecuteBlock:v5];
  }
}

- (void)iterateThroughIndexPathsAndExecuteBlock:(id)a3
{
  v11 = (void (**)(id, void *))a3;
  id v4 = [(VenueCategoryDataSource *)self content];
  uint64_t v5 = (uint64_t)[v4 numberOfSections];

  if (v5 >= 1)
  {
    for (uint64_t i = 0; i != v5; ++i)
    {
      id v7 = [(VenueCategoryDataSource *)self content];
      uint64_t v8 = (uint64_t)[v7 numberOfRowsInSection:i];

      if (v8 >= 1)
      {
        for (uint64_t j = 0; j != v8; ++j)
        {
          v10 = +[NSIndexPath indexPathForRow:j inSection:i];
          v11[2](v11, v10);
        }
      }
    }
  }
}

- (id)placeSummaryTemplateForSearchResult:(id)a3 indexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(VenueCategoryDataSource *)self placeSummaryTemplateViewModels];
  v9 = [v8 objectForKey:v7];

  if (!v9)
  {
    v9 = +[PlaceSummaryViewModelTemplateFactory venueViewModelWithSearchResult:v6 metadata:0 labelContext:self->_searchResultLabelContext];
    v10 = [(VenueCategoryDataSource *)self placeSummaryTemplateViewModels];
    [v10 setObject:v9 forKey:v7];
  }
  id v11 = v9;

  return v11;
}

- (id)venueIdentifier
{
  v2 = [(VenueCategoryDataSource *)self mapItem];
  objc_super v3 = [v2 _venueInfo];
  id v4 = [v3 venueIdentifier];

  return v4;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = [(VenueCategoryDataSource *)self content];
  v9 = [v8 objectAtIndexPath:v6];

  v10 = [(VenueCategoryDataSource *)self placeSummaryTemplateForSearchResult:v9 indexPath:v6];

  id v11 = +[PlaceSummaryTableViewCell reuseIdentifier];
  v12 = [v7 dequeueReusableCellWithIdentifier:v11];

  [v12 setViewModel:v10 delegate:self asyncDataManager:self->_placeSummaryAsyncDataManager];

  return v12;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  uint64_t v5 = [(VenueCategoryDataSource *)self content];
  id v6 = [v5 numberOfRowsInSection:a4];

  return (int64_t)v6;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  objc_super v3 = [(VenueCategoryDataSource *)self content];
  id v4 = [v3 numberOfSections];

  return (int64_t)v4;
}

- (id)sectionIndexTitlesForTableView:(id)a3
{
  return self->_sectionIndexTitles;
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  +[_SearchResultTableViewCell cellHeight];
  return result;
}

- (void)tableView:(id)a3 didUpdateFocusInContext:(id)a4 withAnimationCoordinator:(id)a5
{
  id v13 = a3;
  id v7 = [a4 nextFocusedItem];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && ([v13 indexPathForCell:v7], (uint64_t v8 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v9 = (void *)v8;
    v10 = [(DataSource *)self delegate];
    id v11 = [(VenueCategoryDataSource *)self content];
    v12 = [v11 objectAtIndexPath:v9];
    [v10 dataSource:self itemFocused:v12];
  }
  else
  {
    v9 = [(DataSource *)self delegate];
    [v9 dataSource:self itemFocused:0];
  }
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = [(VenueCategoryDataSource *)self content];
  id v10 = [v8 objectAtIndexPath:v6];

  [(DataSource *)self sendAnalyticsForDataAtIndexPath:v6 object:v10 action:2007];
  v9 = [(DataSource *)self delegate];
  [v9 dataSource:self itemTapped:v10];

  [v7 deselectRowAtIndexPath:v6 animated:1];
}

- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5
{
  double y = a4.y;
  double x = a4.x;
  id v14 = a3;
  v9 = [(DataSource *)self delegate];
  char v10 = objc_opt_respondsToSelector();

  if (v10)
  {
    id v11 = [(DataSource *)self delegate];
    [v11 scrollViewWillEndDragging:v14 withVelocity:a5 targetContentOffset:x, y];
  }
  if (y <= 0.0) {
    uint64_t v12 = 7;
  }
  else {
    uint64_t v12 = 8;
  }
  id v13 = +[MKMapService sharedService];
  [v13 captureUserAction:v12 onTarget:106 eventValue:0];
}

- (void)setBuildingsWithMapItem:(id)a3
{
  id v4 = [a3 _venueInfo];
  id v15 = [v4 filters];

  id v5 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", (char *)objc_msgSend(v15, "count") + 1);
  id v6 = [VenueAllBuildings alloc];
  id v7 = [(VenueCategoryDataSource *)self mapItem];
  uint64_t v8 = [v7 _venueInfo];
  v9 = [v8 venueIdentifier];
  char v10 = [(VenueAllBuildings *)v6 initWithVenueIdentifier:v9];
  [v5 addObject:v10];

  id v11 = [[AlphabeticallyOrderedDataSource alloc] initWithObjects:v15];
  uint64_t v12 = [(AlphabeticallyOrderedDataSource *)v11 orderedObjects];
  [v5 addObjectsFromArray:v12];

  id v13 = (NSArray *)[v5 copy];
  buildings = self->_buildings;
  self->_buildings = v13;
}

- (void)refreshEVChargers:(id)a3
{
  id v4 = a3;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v5 = [v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v6; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v17 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        char v10 = [v9 mapItem];
        id v11 = [v10 _identifier];

        uint64_t v12 = [(NSMutableDictionary *)self->_mapitemTemplates objectForKeyedSubscript:v11];

        if (v12)
        {
          evChargerDownloader = self->_evChargerDownloader;
          id v14 = [(NSMutableDictionary *)self->_mapitemTemplates objectForKeyedSubscript:v11];
          id v15 = [v9 mapItem];
          [(PlaceSummaryEVChargerDownloader *)evChargerDownloader refreshResultForForTemplate:v14 mapItem:v15];
        }
      }
      id v6 = [v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v6);
  }
}

- (void)setSearchResults:(id)a3 labelContext:(unint64_t)a4
{
  id v6 = a3;
  id v13 = [[AlphabeticallyOrderedDataSource alloc] initWithAlphabeticallySortableObject:v6];

  self->_numberOfSectionsNotEmptdouble y = [(AlphabeticallyOrderedDataSource *)v13 numberOfSectionsNotEmpty];
  uint64_t v7 = [(AlphabeticallyOrderedDataSource *)v13 sectionIndexTitles];
  sectionIndexTitles = self->_sectionIndexTitles;
  self->_sectionIndexTitles = v7;

  self->_searchResultLabelContext = a4;
  v9 = [[SearchResultsDataSourceContent alloc] initWithOrderedDataSource:v13];
  content = self->_content;
  self->_content = v9;

  id v11 = [(VenueCategoryDataSource *)self placeSummaryTemplateViewModels];

  if (v11)
  {
    uint64_t v12 = [(VenueCategoryDataSource *)self placeSummaryTemplateViewModels];
    [v12 removeAllObjects];
  }
  [(VenueCategoryDataSource *)self _cacheEVChargersTemplates];
}

- (NSArray)filterBarTitles
{
  uint64_t v3 = [(VenueCategoryDataSource *)self subcategoriesType];
  if (v3 >= 2)
  {
    if (v3 == 2)
    {
      uint64_t v3 = [(VenueCategoryDataSource *)self filterBarTitlesWithBuildings];
    }
  }
  else
  {
    uint64_t v3 = [(VenueCategoryDataSource *)self filterBarTitlesWithSubcategories];
  }

  return (NSArray *)(id)v3;
}

- (id)filterBarTitlesWithSubcategories
{
  uint64_t v3 = [(VenueCategoryDataSource *)self subcategories];
  id v4 = [v3 count];

  if (v4)
  {
    id v5 = objc_alloc((Class)NSMutableArray);
    id v6 = [(VenueCategoryDataSource *)self subcategories];
    id v7 = [v5 initWithCapacity:[v6 count]];

    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    uint64_t v8 = [(VenueCategoryDataSource *)self subcategories];
    id v9 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v9)
    {
      id v10 = v9;
      uint64_t v11 = *(void *)v17;
      do
      {
        for (uint64_t i = 0; i != v10; uint64_t i = (char *)i + 1)
        {
          if (*(void *)v17 != v11) {
            objc_enumerationMutation(v8);
          }
          id v13 = [*(id *)(*((void *)&v16 + 1) + 8 * i) displayString];
          [v7 addObject:v13];
        }
        id v10 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v10);
    }

    id v14 = [v7 copy];
  }
  else
  {
    id v14 = 0;
  }

  return v14;
}

- (id)filterBarTitlesWithBuildings
{
  uint64_t v3 = [(VenueCategoryDataSource *)self buildings];
  id v4 = [v3 count];

  if (v4)
  {
    id v5 = objc_alloc((Class)NSMutableArray);
    id v6 = [(VenueCategoryDataSource *)self buildings];
    id v7 = [v5 initWithCapacity:[v6 count]];

    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    uint64_t v8 = [(VenueCategoryDataSource *)self buildings];
    id v9 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v9)
    {
      id v10 = v9;
      uint64_t v11 = *(void *)v18;
      do
      {
        for (uint64_t i = 0; i != v10; uint64_t i = (char *)i + 1)
        {
          if (*(void *)v18 != v11) {
            objc_enumerationMutation(v8);
          }
          id v13 = [*(id *)(*((void *)&v17 + 1) + 8 * i) label];
          id v14 = [v13 name];
          [v7 addObject:v14];
        }
        id v10 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v10);
    }

    id v15 = [v7 copy];
  }
  else
  {
    id v15 = 0;
  }

  return v15;
}

- (id)personalizedItemForQuickActionMenuWithCell:(id)a3
{
  return 0;
}

- (MKMapItem)mapItem
{
  return self->_mapItem;
}

- (NSArray)subcategories
{
  return self->_subcategories;
}

- (void)setSubcategories:(id)a3
{
}

- (int)subcategoriesType
{
  return self->_subcategoriesType;
}

- (void)setSubcategoriesType:(int)a3
{
  self->_subcategoriesType = a3;
}

- (SearchResultsDataSourceContent)content
{
  return self->_content;
}

- (void)setContent:(id)a3
{
}

- (GEOSearchCategory)searchCategory
{
  return self->_searchCategory;
}

- (void)setSearchCategory:(id)a3
{
}

- (NSArray)buildings
{
  return self->_buildings;
}

- (unint64_t)numberOfSectionsNotEmpty
{
  return self->_numberOfSectionsNotEmpty;
}

- (NSArray)sectionIndexTitles
{
  return self->_sectionIndexTitles;
}

- (void)setSectionIndexTitles:(id)a3
{
}

- (unint64_t)searchResultLabelContext
{
  return self->_searchResultLabelContext;
}

- (void)setSearchResultLabelContext:(unint64_t)a3
{
  self->_searchResultLabelContext = a3;
}

- (_TtC4Maps28PlaceSummaryAsyncDataManager)placeSummaryAsyncDataManager
{
  return self->_placeSummaryAsyncDataManager;
}

- (void)setPlaceSummaryAsyncDataManager:(id)a3
{
}

- (_TtC4Maps31PlaceSummaryEVChargerDownloader)evChargerDownloader
{
  return self->_evChargerDownloader;
}

- (void)setEvChargerDownloader:(id)a3
{
}

- (NSCache)placeSummaryTemplateViewModels
{
  return self->_placeSummaryTemplateViewModels;
}

- (void)setPlaceSummaryTemplateViewModels:(id)a3
{
}

- (NSMutableDictionary)mapitemTemplates
{
  return self->_mapitemTemplates;
}

- (void)setMapitemTemplates:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mapitemTemplates, 0);
  objc_storeStrong((id *)&self->_placeSummaryTemplateViewModels, 0);
  objc_storeStrong((id *)&self->_evChargerDownloader, 0);
  objc_storeStrong((id *)&self->_placeSummaryAsyncDataManager, 0);
  objc_storeStrong((id *)&self->_sectionIndexTitles, 0);
  objc_storeStrong((id *)&self->_buildings, 0);
  objc_storeStrong((id *)&self->_searchCategory, 0);
  objc_storeStrong((id *)&self->_content, 0);
  objc_storeStrong((id *)&self->_subcategories, 0);

  objc_storeStrong((id *)&self->_mapItem, 0);
}

@end