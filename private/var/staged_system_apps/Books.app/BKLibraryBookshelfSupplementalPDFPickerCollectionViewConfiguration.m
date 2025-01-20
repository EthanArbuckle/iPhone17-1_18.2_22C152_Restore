@interface BKLibraryBookshelfSupplementalPDFPickerCollectionViewConfiguration
- (BKLibraryBookshelfSupplementalPDFPickerCollectionViewConfiguration)initWithCollection:(id)a3 storePlaylistID:(id)a4 fromActionMenu:(BOOL)a5;
- (BOOL)canChangeViewMode;
- (BOOL)hideTopSeparatorLine;
- (BOOL)includeCollectionInfo;
- (BOOL)showCancelNavigationBarItem;
- (BOOL)showsSortControl;
- (BOOL)supplementalContentPDFPicker;
- (id)sortControlConfig;
- (id)supplementalContentPDFTitle;
@end

@implementation BKLibraryBookshelfSupplementalPDFPickerCollectionViewConfiguration

- (BKLibraryBookshelfSupplementalPDFPickerCollectionViewConfiguration)initWithCollection:(id)a3 storePlaylistID:(id)a4 fromActionMenu:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  v14.receiver = self;
  v14.super_class = (Class)BKLibraryBookshelfSupplementalPDFPickerCollectionViewConfiguration;
  v10 = [(BKLibraryBookshelfSupplementalPDFPickerCollectionViewConfiguration *)&v14 init];
  v11 = v10;
  if (v10)
  {
    [(BKLibraryBookshelfLibraryBaseViewConfiguration *)v10 setCollection:v8];
    v12 = [v8 collectionID];
    [(BKLibraryBookshelfLibraryBaseViewConfiguration *)v11 setCollectionID:v12];

    [(BKLibraryBookshelfLibraryBaseViewConfiguration *)v11 setSupplementalContentStorePlaylistID:v9];
    [(BKLibraryBookshelfLibraryBaseViewConfiguration *)v11 setInitialViewMode:2];
    [(BKLibraryBookshelfLibraryBaseViewConfiguration *)v11 setFromActionMenu:v5];
  }

  return v11;
}

- (id)sortControlConfig
{
  v3 = +[NSMutableArray array];
  v4 = objc_alloc_init(BKLibrarySortByMode);
  [(BKLibrarySortByMode *)v4 setSortMode:2];
  [(BKLibrarySortByMode *)v4 setTitle:&stru_100A70340];
  [(BKLibrarySortByMode *)v4 setLabel:&stru_100A70340];
  BOOL v5 = [(BKLibraryBookshelfLibraryBaseViewConfiguration *)self supplementalContentStorePlaylistID];
  v6 = +[BKLibraryManager predicateForSupplementalContentLibraryAssetsWithStorePlaylistID:v5];
  [(BKLibrarySortByMode *)v4 setAllowExplicitPredicate:v6];

  v7 = [(BKLibrarySortByMode *)v4 allowExplicitPredicate];
  v15[0] = v7;
  id v8 = +[BKLibraryManager predicateToExcludeLibraryAssetsWithExplicitContent];
  v15[1] = v8;
  id v9 = +[NSArray arrayWithObjects:v15 count:2];
  v10 = +[NSCompoundPredicate andPredicateWithSubpredicates:v9];
  [(BKLibrarySortByMode *)v4 setHideExplicitPredicate:v10];

  v11 = +[NSSortDescriptor sortDescriptorWithKey:@"sortTitle" ascending:1 selector:"localizedStandardCompare:"];
  objc_super v14 = v11;
  v12 = +[NSArray arrayWithObjects:&v14 count:1];
  [(BKLibrarySortByMode *)v4 setSortDescriptors:v12];

  [(BKLibrarySortByMode *)v4 setSectionKeyPath:0];
  [(BKLibrarySortByMode *)v4 setSectionKeyPathForDisplay:0];
  [(BKLibrarySortByMode *)v4 setEntityName:@"BKLibraryAsset"];
  [(BKLibrarySortByMode *)v4 setAllowsReordering:0];
  [v3 addObject:v4];

  return v3;
}

- (BOOL)hideTopSeparatorLine
{
  return 1;
}

- (id)supplementalContentPDFTitle
{
  v2 = +[NSBundle mainBundle];
  v3 = [v2 localizedStringForKey:@"Choose a PDF" value:&stru_100A70340 table:0];

  return v3;
}

- (BOOL)supplementalContentPDFPicker
{
  return 1;
}

- (BOOL)showCancelNavigationBarItem
{
  return 1;
}

- (BOOL)includeCollectionInfo
{
  return 0;
}

- (BOOL)showsSortControl
{
  return 0;
}

- (BOOL)canChangeViewMode
{
  return 1;
}

@end