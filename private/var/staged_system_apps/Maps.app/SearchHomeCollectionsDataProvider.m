@interface SearchHomeCollectionsDataProvider
- (BOOL)itemIsSaved:(id)a3;
- (GEOExploreGuides)exploreGuides;
- (NSArray)objects;
- (NSArray)viewModels;
- (NSString)identifier;
- (NSString)title;
- (SearchHomeCollectionsDataProvider)initWithObjects:(id)a3 type:(int64_t)a4 identifier:(id)a5 title:(id)a6;
- (id)headerAccessibilityIdentifier;
- (int64_t)type;
- (void)configureWithExploreGuides:(id)a3;
- (void)setObjects:(id)a3;
- (void)setViewModels:(id)a3;
@end

@implementation SearchHomeCollectionsDataProvider

- (SearchHomeCollectionsDataProvider)initWithObjects:(id)a3 type:(int64_t)a4 identifier:(id)a5 title:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  v26.receiver = self;
  v26.super_class = (Class)SearchHomeCollectionsDataProvider;
  v13 = [(SearchHomeCollectionsDataProvider *)&v26 init];
  if (v13)
  {
    v14 = (NSArray *)[v10 copy];
    objects = v13->_objects;
    v13->_objects = v14;

    id v16 = objc_alloc((Class)MKPlaceCollectionsLogicController);
    v17 = +[CuratedCollectionSyncManager sharedManager];
    id v18 = [v16 initWithPlaceCollections:v10 usingSyncCoordinator:v17 inContext:3];

    uint64_t v19 = [v18 collections];
    viewModels = v13->_viewModels;
    v13->_viewModels = (NSArray *)v19;

    v13->_type = a4;
    v21 = (NSString *)[v11 copy];
    identifier = v13->_identifier;
    v13->_identifier = v21;

    v23 = (NSString *)[v12 copy];
    title = v13->_title;
    v13->_title = v23;
  }
  return v13;
}

- (id)headerAccessibilityIdentifier
{
  return @"SearchHomeCollections";
}

- (BOOL)itemIsSaved:(id)a3
{
  id v4 = a3;
  v5 = [(SearchHomeCollectionsDataProvider *)self objects];
  id v6 = [v5 indexOfObject:v4];

  v7 = [(SearchHomeCollectionsDataProvider *)self viewModels];
  id v8 = [v7 count];

  if (v6 >= v8) {
    return 0;
  }
  v9 = [(SearchHomeCollectionsDataProvider *)self viewModels];
  id v10 = [v9 objectAtIndex:v6];

  LOBYTE(v9) = [v10 isSaved];
  return (char)v9;
}

- (void)configureWithExploreGuides:(id)a3
{
}

- (int64_t)type
{
  return self->_type;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)title
{
  return self->_title;
}

- (GEOExploreGuides)exploreGuides
{
  return self->_exploreGuides;
}

- (NSArray)objects
{
  return self->_objects;
}

- (void)setObjects:(id)a3
{
}

- (NSArray)viewModels
{
  return self->_viewModels;
}

- (void)setViewModels:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewModels, 0);
  objc_storeStrong((id *)&self->_objects, 0);
  objc_storeStrong((id *)&self->_exploreGuides, 0);
  objc_storeStrong((id *)&self->_title, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

@end