@interface SearchResultVenueSubDataProvider
- (GEOSearchCategory)currentCategory;
- (NSArray)browseCategories;
- (NSArray)buildings;
- (NSArray)subcategories;
- (NSArray)venueContents;
- (SearchResultVenueSubDataProvider)initWithDelegate:(id)a3;
- (VenueCategoryCardItem)venueCardItem;
- (VenueCategoryContentDownloader)contentDownloader;
- (id)_sortedBuildings;
- (int)subcategoriesType;
- (void)performSearchWithActionCoordination:(id)a3;
- (void)setCurrentCategory:(id)a3;
- (void)setVenueCardItem:(id)a3;
- (void)setVenueContents:(id)a3;
@end

@implementation SearchResultVenueSubDataProvider

- (SearchResultVenueSubDataProvider)initWithDelegate:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)SearchResultVenueSubDataProvider;
  v5 = [(SearchResultVenueSubDataProvider *)&v8 init];
  v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->_delegate, v4);
  }

  return v6;
}

- (void)setVenueCardItem:(id)a3
{
  v6 = (VenueCategoryCardItem *)a3;
  venueCardItem = self->_venueCardItem;
  if (venueCardItem != v6 && ([(VenueCategoryCardItem *)venueCardItem isEqual:v6] & 1) == 0)
  {
    objc_super v8 = sub_1000AA148();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      v9 = objc_opt_class();
      id v10 = v9;
      v11 = NSStringFromSelector(a2);
      v12 = self->_venueCardItem;
      int v30 = 138412802;
      v31 = v9;
      __int16 v32 = 2112;
      v33 = v11;
      __int16 v34 = 2112;
      v35 = v12;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%@ %@, updates = %@", (uint8_t *)&v30, 0x20u);
    }
    objc_storeStrong((id *)&self->_venueCardItem, a3);
    v13 = [(VenueCategoryCardItem *)self->_venueCardItem venueSearchCategory];
    currentCategory = self->_currentCategory;
    self->_currentCategory = v13;

    v15 = [(VenueCategoryCardItem *)self->_venueCardItem venueMapItem];
    v16 = [v15 _browseCategories];
    v17 = (NSArray *)[v16 copy];
    browseCategories = self->_browseCategories;
    self->_browseCategories = v17;

    v19 = [(VenueCategoryCardItem *)self->_venueCardItem venueSearchCategory];
    v20 = [v19 subcategories];
    v21 = (NSArray *)[v20 copy];
    subcategories = self->_subcategories;
    self->_subcategories = v21;

    v23 = [(SearchResultVenueSubDataProvider *)self _sortedBuildings];
    buildings = self->_buildings;
    self->_buildings = v23;

    v25 = [(VenueCategoryCardItem *)v6 venueSearchCategory];
    self->_subcategoriesType = [v25 subCategoryType];

    v26 = [VenueCategoryContentDownloader alloc];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    v28 = [(VenueCategoryContentDownloader *)v26 initWithDelegate:WeakRetained venueCategoryCardItem:self->_venueCardItem];
    contentDownloader = self->_contentDownloader;
    self->_contentDownloader = v28;
  }
}

- (void)performSearchWithActionCoordination:(id)a3
{
  id v4 = a3;
  id v5 = [(SearchResultVenueSubDataProvider *)self currentCategory];
  -[VenueCategoryContentDownloader performSearchWithSearchCategory:subcategoriesType:filter:shouldFrameMapViewport:actionCoordination:](self->_contentDownloader, "performSearchWithSearchCategory:subcategoriesType:filter:shouldFrameMapViewport:actionCoordination:", v5, -[SearchResultVenueSubDataProvider subcategoriesType](self, "subcategoriesType"), 0, [v5 isSubCategorySameAsTopLevel] ^ 1, v4);
}

- (id)_sortedBuildings
{
  venueCardItem = self->_venueCardItem;
  if (venueCardItem)
  {
    v3 = [(VenueCategoryCardItem *)venueCardItem venueMapItem];
    id v4 = [v3 _venueInfo];
    id v5 = [v4 filters];

    id v6 = [objc_alloc((Class)NSMutableArray) initWithCapacity:(char *)[v5 count] + 1];
    v7 = [VenueAllBuildings alloc];
    objc_super v8 = [v3 _venueInfo];
    v9 = [v8 venueIdentifier];
    id v10 = [(VenueAllBuildings *)v7 initWithVenueIdentifier:v9];
    [v6 addObject:v10];

    v11 = [[AlphabeticallyOrderedDataSource alloc] initWithObjects:v5];
    v12 = [(AlphabeticallyOrderedDataSource *)v11 orderedObjects];
    [v6 addObjectsFromArray:v12];

    id v13 = [v6 copy];
  }
  else
  {
    id v13 = &__NSArray0__struct;
  }

  return v13;
}

- (void)setVenueContents:(id)a3
{
  id v4 = a3;
  v9 = [[AlphabeticallyOrderedDataSource alloc] initWithObjects:v4];

  id v5 = [(AlphabeticallyOrderedDataSource *)v9 orderedObjects];
  id v6 = v5;
  if (v5 != self->_venueContents && (-[NSArray isEqual:](v5, "isEqual:") & 1) == 0)
  {
    v7 = (NSArray *)[(NSArray *)v6 copy];
    venueContents = self->_venueContents;
    self->_venueContents = v7;
  }
}

- (VenueCategoryCardItem)venueCardItem
{
  return self->_venueCardItem;
}

- (NSArray)venueContents
{
  return self->_venueContents;
}

- (GEOSearchCategory)currentCategory
{
  return self->_currentCategory;
}

- (void)setCurrentCategory:(id)a3
{
}

- (NSArray)browseCategories
{
  return self->_browseCategories;
}

- (NSArray)subcategories
{
  return self->_subcategories;
}

- (int)subcategoriesType
{
  return self->_subcategoriesType;
}

- (NSArray)buildings
{
  return self->_buildings;
}

- (VenueCategoryContentDownloader)contentDownloader
{
  return self->_contentDownloader;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentDownloader, 0);
  objc_storeStrong((id *)&self->_buildings, 0);
  objc_storeStrong((id *)&self->_subcategories, 0);
  objc_storeStrong((id *)&self->_browseCategories, 0);
  objc_storeStrong((id *)&self->_currentCategory, 0);
  objc_storeStrong((id *)&self->_venueContents, 0);
  objc_storeStrong((id *)&self->_venueCardItem, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end