@interface BKLibraryBookshelfLibrarySeriesViewConfiguration
- (BKLibraryAsset)seriesContainer;
- (BKLibraryBookshelfLibrarySeriesViewConfiguration)initWithSeriesContainer:(id)a3 initialViewMode:(unint64_t)a4;
- (BOOL)stackedSortControl;
- (NSString)seriesPurchased;
- (id)noBooksDescription;
- (id)noBooksDescriptionHeader;
- (id)seriesID;
- (id)sortControlConfig;
- (id)viewDescription;
- (id)viewTitle;
- (unint64_t)initialSortMode;
- (void)setInitialSortMode:(unint64_t)a3;
- (void)setSeriesContainer:(id)a3;
- (void)setSeriesPurchased:(id)a3;
@end

@implementation BKLibraryBookshelfLibrarySeriesViewConfiguration

- (BKLibraryBookshelfLibrarySeriesViewConfiguration)initWithSeriesContainer:(id)a3 initialViewMode:(unint64_t)a4
{
  id v6 = a3;
  v15.receiver = self;
  v15.super_class = (Class)BKLibraryBookshelfLibrarySeriesViewConfiguration;
  v7 = [(BKLibraryBookshelfLibrarySeriesViewConfiguration *)&v15 init];
  if (v7)
  {
    v8 = +[BKLibraryManager defaultManager];
    [(BKLibraryBookshelfLibrarySeriesViewConfiguration *)v7 setSeriesContainer:v6];
    [(BKLibraryBookshelfLibraryBaseViewConfiguration *)v7 setInitialViewMode:a4];
    [(BKLibraryBookshelfLibrarySeriesViewConfiguration *)v7 setInitialSortMode:+[BKCollection sortModeForSeriesCollections]];
    v9 = [v6 managedObjectContext];
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_1001E2C74;
    v12[3] = &unk_100A43DD8;
    id v13 = v6;
    id v14 = v8;
    id v10 = v8;
    [v9 performBlock:v12];
  }
  return v7;
}

- (id)seriesID
{
  v2 = [(BKLibraryBookshelfLibrarySeriesViewConfiguration *)self seriesContainer];
  v3 = [v2 assetID];

  return v3;
}

- (BOOL)stackedSortControl
{
  return 1;
}

- (id)viewTitle
{
  v2 = [(BKLibraryBookshelfLibrarySeriesViewConfiguration *)self seriesContainer];
  v3 = [v2 title];

  return v3;
}

- (id)viewDescription
{
  v2 = [(BKLibraryBookshelfLibrarySeriesViewConfiguration *)self seriesContainer];
  v3 = [v2 displayAuthor];

  return v3;
}

- (id)noBooksDescriptionHeader
{
  v2 = +[NSBundle mainBundle];
  v3 = [v2 localizedStringForKey:@"No Purchased Books" value:&stru_100A70340 table:0];

  return v3;
}

- (id)noBooksDescription
{
  v2 = +[NSBundle mainBundle];
  v3 = [v2 localizedStringForKey:@"You haven’t purchased any books in this series." value:&stru_100A70340 table:0];

  return v3;
}

- (id)sortControlConfig
{
  v3 = +[BKLibraryManager defaultManager];
  v4 = +[NSBundle mainBundle];
  v5 = [v4 localizedStringForKey:@"Filter by…" value:&stru_100A70340 table:0];

  id v6 = objc_alloc_init(BKLibrarySortByMode);
  [(BKLibrarySortByMode *)v6 setSortMode:9];
  v7 = +[NSBundle mainBundle];
  v8 = [v7 localizedStringForKey:@"Purchased" value:&stru_100A70340 table:0];
  [(BKLibrarySortByMode *)v6 setTitle:v8];

  [(BKLibrarySortByMode *)v6 setLabel:v5];
  v9 = [(BKLibraryBookshelfLibrarySeriesViewConfiguration *)self seriesID];
  id v10 = [v3 contentPredicateForSeriesID:v9 onlyPurchased:1 forceCloud:1 allowsExplicit:1];
  [(BKLibrarySortByMode *)v6 setAllowExplicitPredicate:v10];

  v11 = [(BKLibraryBookshelfLibrarySeriesViewConfiguration *)self seriesID];
  v12 = [v3 contentPredicateForSeriesID:v11 onlyPurchased:1 forceCloud:1 allowsExplicit:0];
  [(BKLibrarySortByMode *)v6 setHideExplicitPredicate:v12];

  id v13 = +[NSSortDescriptor sortDescriptorWithKey:@"seriesSortKey" ascending:1];
  v28 = v13;
  id v14 = +[NSArray arrayWithObjects:&v28 count:1];
  [(BKLibrarySortByMode *)v6 setSortDescriptors:v14];

  [(BKLibrarySortByMode *)v6 setSectionKeyPath:0];
  [(BKLibrarySortByMode *)v6 setSectionKeyPathForDisplay:0];
  [(BKLibrarySortByMode *)v6 setEntityName:@"BKLibraryAsset"];
  [(BKLibrarySortByMode *)v6 setAllowsReordering:0];
  objc_super v15 = objc_alloc_init(BKLibrarySortByMode);
  [(BKLibrarySortByMode *)v15 setSortMode:10];
  v16 = +[NSBundle mainBundle];
  v17 = [v16 localizedStringForKey:@"All In Series" value:&stru_100A70340 table:0];
  [(BKLibrarySortByMode *)v15 setTitle:v17];

  [(BKLibrarySortByMode *)v15 setLabel:v5];
  v18 = [(BKLibraryBookshelfLibrarySeriesViewConfiguration *)self seriesID];
  v19 = [v3 contentPredicateForSeriesID:v18 onlyPurchased:0 forceCloud:1 allowsExplicit:1];
  [(BKLibrarySortByMode *)v15 setAllowExplicitPredicate:v19];

  v20 = [(BKLibraryBookshelfLibrarySeriesViewConfiguration *)self seriesID];
  v21 = [v3 contentPredicateForSeriesID:v20 onlyPurchased:0 forceCloud:1 allowsExplicit:0];
  [(BKLibrarySortByMode *)v15 setHideExplicitPredicate:v21];

  v22 = +[NSSortDescriptor sortDescriptorWithKey:@"seriesSortKey" ascending:1];
  v27 = v22;
  v23 = +[NSArray arrayWithObjects:&v27 count:1];
  [(BKLibrarySortByMode *)v15 setSortDescriptors:v23];

  [(BKLibrarySortByMode *)v15 setSectionKeyPath:0];
  [(BKLibrarySortByMode *)v15 setSectionKeyPathForDisplay:0];
  [(BKLibrarySortByMode *)v15 setEntityName:@"BKLibraryAsset"];
  [(BKLibrarySortByMode *)v15 setAllowsReordering:0];
  v26[0] = v15;
  v26[1] = v6;
  v24 = +[NSArray arrayWithObjects:v26 count:2];

  return v24;
}

- (unint64_t)initialSortMode
{
  return self->_initialSortMode;
}

- (void)setInitialSortMode:(unint64_t)a3
{
  self->_initialSortMode = a3;
}

- (BKLibraryAsset)seriesContainer
{
  return self->_seriesContainer;
}

- (void)setSeriesContainer:(id)a3
{
}

- (NSString)seriesPurchased
{
  return self->_seriesPurchased;
}

- (void)setSeriesPurchased:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_seriesPurchased, 0);

  objc_storeStrong((id *)&self->_seriesContainer, 0);
}

@end