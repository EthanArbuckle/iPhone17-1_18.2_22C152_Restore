@interface BKLibraryBookshelfLibraryFinishedViewConfiguration
- (BKLibraryBookshelfLibraryFinishedViewConfiguration)init;
- (BOOL)canChangeViewMode;
- (BOOL)providesReviewData;
- (BOOL)showsSortControl;
- (BOOL)stackedSortControl;
- (id)sortControlConfig;
- (id)viewDescription;
- (id)viewTitle;
- (unint64_t)collectionType;
@end

@implementation BKLibraryBookshelfLibraryFinishedViewConfiguration

- (BKLibraryBookshelfLibraryFinishedViewConfiguration)init
{
  v11.receiver = self;
  v11.super_class = (Class)BKLibraryBookshelfLibraryFinishedViewConfiguration;
  v2 = [(BKLibraryBookshelfLibraryFinishedViewConfiguration *)&v11 init];
  if (v2)
  {
    v3 = +[BKLibraryManager defaultManager];
    v4 = [v3 collectionController];
    uint64_t v5 = kBKCollectionDefaultIDFinished;
    v6 = +[BKLibraryManager defaultManager];
    v7 = [v6 uiChildContext];
    v8 = [v4 mutableCollectionWithCollectionID:v5 inManagedObjectContext:v7 error:0];
    [(BKLibraryBookshelfLibraryBaseViewConfiguration *)v2 setCollection:v8];

    [(BKLibraryBookshelfLibraryBaseViewConfiguration *)v2 setCollectionID:v5];
    v9 = [(BKLibraryBookshelfLibraryBaseViewConfiguration *)v2 collection];
    -[BKLibraryBookshelfLibraryBaseViewConfiguration setInitialViewMode:](v2, "setInitialViewMode:", [v9 resolvedViewMode]);
  }
  return v2;
}

- (unint64_t)collectionType
{
  return 2;
}

- (BOOL)providesReviewData
{
  return 1;
}

- (BOOL)canChangeViewMode
{
  return 0;
}

- (BOOL)stackedSortControl
{
  return 0;
}

- (BOOL)showsSortControl
{
  return 0;
}

- (id)viewTitle
{
  return +[BCCollection titleForDefaultCollectionID:kBKCollectionDefaultIDFinished];
}

- (id)viewDescription
{
  return 0;
}

- (id)sortControlConfig
{
  v2 = objc_alloc_init(BKLibrarySortByMode);
  [(BKLibrarySortByMode *)v2 setSortMode:8];
  [(BKLibrarySortByMode *)v2 setTitle:&stru_100A70340];
  [(BKLibrarySortByMode *)v2 setLabel:&stru_100A70340];
  v3 = +[BKLibraryManager predicateFor_All_Finished_LibraryAssetsAllowsExplicit:1];
  [(BKLibrarySortByMode *)v2 setAllowExplicitPredicate:v3];

  v4 = +[BKLibraryManager predicateFor_All_Finished_LibraryAssetsAllowsExplicit:0];
  [(BKLibrarySortByMode *)v2 setHideExplicitPredicate:v4];

  uint64_t v5 = +[NSSortDescriptor sortDescriptorWithKey:@"dateFinished" ascending:0];
  v13[0] = v5;
  v6 = +[NSSortDescriptor sortDescriptorWithKey:@"sortTitle" ascending:1];
  v13[1] = v6;
  v7 = +[NSArray arrayWithObjects:v13 count:2];
  [(BKLibrarySortByMode *)v2 setSortDescriptors:v7];

  if (_os_feature_enabled_impl())
  {
    [(BKLibrarySortByMode *)v2 setSectionKeyPath:@"finishedCollectionSectionID"];
    CFStringRef v8 = @"finishedCollectionSectionName";
    v9 = v2;
  }
  else
  {
    [(BKLibrarySortByMode *)v2 setSectionKeyPath:0];
    v9 = v2;
    CFStringRef v8 = 0;
  }
  [(BKLibrarySortByMode *)v9 setSectionKeyPathForDisplay:v8];
  [(BKLibrarySortByMode *)v2 setEntityName:@"BKLibraryAsset"];
  [(BKLibrarySortByMode *)v2 setAllowsReordering:0];
  v12 = v2;
  v10 = +[NSArray arrayWithObjects:&v12 count:1];

  return v10;
}

@end