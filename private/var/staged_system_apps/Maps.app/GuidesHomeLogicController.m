@interface GuidesHomeLogicController
- (CollectionsFilterLogicController)filterLogicController;
- (GEOGuideLocation)guideLocation;
- (GEOGuidesHomeResult)result;
- (GuidesHomeHeaderViewModel)featuredGuideViewModel;
- (GuidesHomeLogicController)initWithGuidesHomeResult:(id)a3 maxWidth:(double)a4 traitEnvironment:(id)a5 guideFetcher:(id)a6 guideConsumer:(id)a7 guideLocation:(id)a8;
- (GuidesHomeSection)filteredGuidesSection;
- (GuidesHomeSection)loadingSection;
- (MKPlaceBatchConsumer)guideConsumer;
- (MKPlaceBatchFetcher)guideFetcher;
- (NSArray)batchCollectionIds;
- (NSArray)publishers;
- (NSArray)recentCollectionFromCollectionResults;
- (NSMutableArray)sections;
- (NSMutableDictionary)collectionLogicControllers;
- (NSMutableDictionary)compactCollectionLogicControllers;
- (UIFont)titleFont;
- (UITraitEnvironment)traitEnvironment;
- (double)maxWidth;
- (id)allSections;
- (id)filterValueAtIndex:(unint64_t)a3;
- (id)itemsForSectionAtIndex:(unint64_t)a3;
- (id)routeToSelectedAllCollectionsFilterAtIndexPath:(id)a3;
- (id)routeToSelectedFilterAtIndexPath:(id)a3;
- (id)routeToSelectedGuidesHomeFilterAtIndexPath:(id)a3;
- (id)sectionAtIndex:(unint64_t)a3;
- (id)selectedFilterIndexPath;
- (void)appendBatchOfCollections:(id)a3;
- (void)initializeFonts;
- (void)initializeSectionsUsingMaxWidth:(double)a3 traitEnvironment:(id)a4;
- (void)setBatchCollectionIds:(id)a3;
- (void)setCollectionLogicControllers:(id)a3;
- (void)setCompactCollectionLogicControllers:(id)a3;
- (void)setFeaturedGuideViewModel:(id)a3;
- (void)setFilterLogicController:(id)a3;
- (void)setFilteredGuidesSection:(id)a3;
- (void)setGuideConsumer:(id)a3;
- (void)setGuideFetcher:(id)a3;
- (void)setGuideLocation:(id)a3;
- (void)setLoadingSection:(id)a3;
- (void)setMaxWidth:(double)a3;
- (void)setPublishers:(id)a3;
- (void)setRecentCollectionFromCollectionResults:(id)a3;
- (void)setResult:(id)a3;
- (void)setSections:(id)a3;
- (void)setTitleFont:(id)a3;
- (void)setTraitEnvironment:(id)a3;
- (void)updateFilteredCollectionsFromResults:(id)a3 collectionIds:(id)a4;
- (void)willDisplayCellAtIndexpath:(id)a3;
@end

@implementation GuidesHomeLogicController

- (GuidesHomeLogicController)initWithGuidesHomeResult:(id)a3 maxWidth:(double)a4 traitEnvironment:(id)a5 guideFetcher:(id)a6 guideConsumer:(id)a7 guideLocation:(id)a8
{
  id v15 = a3;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  v23.receiver = self;
  v23.super_class = (Class)GuidesHomeLogicController;
  v20 = [(GuidesHomeLogicController *)&v23 init];
  v21 = v20;
  if (v20)
  {
    objc_storeStrong((id *)&v20->_result, a3);
    v21->_maxWidth = a4;
    objc_storeStrong((id *)&v21->_traitEnvironment, a5);
    objc_storeWeak((id *)&v21->_guideFetcher, v17);
    objc_storeWeak((id *)&v21->_guideConsumer, v18);
    objc_storeStrong((id *)&v21->_guideLocation, a8);
    [(GuidesHomeLogicController *)v21 initializeFonts];
    [(GuidesHomeLogicController *)v21 initializeSectionsUsingMaxWidth:v16 traitEnvironment:a4];
  }

  return v21;
}

- (void)initializeFonts
{
  id v6 = +[UIFont _mapkit_preferredFontForTextStyleInTableViewCell:UIFontTextStyleTitle3];
  [v6 _mapkit_scaledValueForValue:22.0];
  CTFontRef UIFontForLanguage = CTFontCreateUIFontForLanguage((CTFontUIFontType)0xA9u, v3, 0);
  CopyOfSystemUIFontWithGrade = (void *)CTFontCreateCopyOfSystemUIFontWithGrade();
  CFRelease(UIFontForLanguage);
  [(GuidesHomeLogicController *)self setTitleFont:CopyOfSystemUIFontWithGrade];
}

- (void)willDisplayCellAtIndexpath:(id)a3
{
  id v8 = a3;
  v4 = -[GuidesHomeLogicController sectionAtIndex:](self, "sectionAtIndex:", [v8 section]);
  if ([v4 kind] == (id)6)
  {
    v5 = [(GuidesHomeLogicController *)self collectionLogicControllers];
    id v6 = [v4 sectionIdentifier];
    v7 = [v5 objectForKey:v6];

    [v7 willDisplayCellAtIndexpath:v8];
  }
}

- (void)updateFilteredCollectionsFromResults:(id)a3 collectionIds:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!v6)
  {
    [(GuidesHomeLogicController *)self setRecentCollectionFromCollectionResults:0];
    [(GuidesHomeLogicController *)self setBatchCollectionIds:v7];
    [(GuidesHomeLogicController *)self setFilteredGuidesSection:0];
    [(GuidesHomeLogicController *)self maxWidth];
    double v22 = v21;
    id v16 = [(GuidesHomeLogicController *)self traitEnvironment];
    [(GuidesHomeLogicController *)self initializeSectionsUsingMaxWidth:v16 traitEnvironment:v22];
    goto LABEL_7;
  }
  id v8 = [(GuidesHomeLogicController *)self filteredGuidesSection];

  if (v8)
  {
LABEL_5:
    [(GuidesHomeLogicController *)self setLoadingSection:0];
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472;
    v24[2] = sub_100952C6C;
    v24[3] = &unk_1013030E8;
    id v25 = objc_alloc_init((Class)NSMutableArray);
    id v16 = v25;
    [v6 enumerateObjectsUsingBlock:v24];
    id v17 = [v16 copy];
    [(GuidesHomeLogicController *)self setRecentCollectionFromCollectionResults:v17];

    [(GuidesHomeLogicController *)self setBatchCollectionIds:v7];
    [(GuidesHomeLogicController *)self maxWidth];
    double v19 = v18;
    v20 = [(GuidesHomeLogicController *)self traitEnvironment];
    [(GuidesHomeLogicController *)self initializeSectionsUsingMaxWidth:v20 traitEnvironment:v19];

LABEL_7:
    goto LABEL_8;
  }
  if ([v6 count])
  {
    v9 = [GuidesHomeSection alloc];
    [(GuidesHomeLogicController *)self maxWidth];
    double v11 = v10;
    v12 = [(GuidesHomeLogicController *)self traitEnvironment];
    v13 = -[GuidesHomeSection initWithSectionKind:usingMaxWidth:usingTraitEnvironment:count:](v9, "initWithSectionKind:usingMaxWidth:usingTraitEnvironment:count:", 6, v12, [v6 count], v11);
    [(GuidesHomeLogicController *)self setFilteredGuidesSection:v13];

    id v14 = objc_alloc_init((Class)NSArray);
    [(GuidesHomeLogicController *)self setRecentCollectionFromCollectionResults:v14];

    id v15 = objc_alloc_init((Class)NSArray);
    [(GuidesHomeLogicController *)self setBatchCollectionIds:v15];

    goto LABEL_5;
  }
  objc_super v23 = sub_10057611C();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, "Guides Home section for filteredGuidesSection couldn't build any objects to display in section", buf, 2u);
  }

LABEL_8:
}

- (void)appendBatchOfCollections:(id)a3
{
  id v9 = a3;
  v4 = [(GuidesHomeLogicController *)self filteredGuidesSection];

  if (v4)
  {
    v5 = [(GuidesHomeLogicController *)self collectionLogicControllers];
    id v6 = [(GuidesHomeLogicController *)self filteredGuidesSection];
    id v7 = [v6 sectionIdentifier];
    id v8 = [v5 objectForKey:v7];

    [v8 appendBatchOfCollections:v9];
  }
}

- (id)allSections
{
  v2 = [(GuidesHomeLogicController *)self sections];
  id v3 = [v2 copy];

  return v3;
}

- (id)sectionAtIndex:(unint64_t)a3
{
  v5 = [(GuidesHomeLogicController *)self sections];
  id v6 = [v5 count];

  if ((unint64_t)v6 <= a3)
  {
    id v8 = 0;
  }
  else
  {
    id v7 = [(GuidesHomeLogicController *)self sections];
    id v8 = [v7 objectAtIndex:a3];
  }

  return v8;
}

- (id)filterValueAtIndex:(unint64_t)a3
{
  v4 = [(GuidesHomeLogicController *)self filterLogicController];
  v5 = [v4 filterViewModels];

  if ((unint64_t)[v5 count] <= a3)
  {
    id v7 = 0;
  }
  else
  {
    id v6 = [v5 objectAtIndex:a3];
    id v7 = [v6 filterTitle];
  }

  return v7;
}

- (id)itemsForSectionAtIndex:(unint64_t)a3
{
  v4 = self;
  v5 = [(GuidesHomeLogicController *)self sections];
  id v6 = [v5 count];

  if ((unint64_t)v6 <= a3)
  {
    v4 = &__NSArray0__struct;
  }
  else
  {
    id v7 = [v4 sections];
    id v8 = [v7 objectAtIndex:a3];

    if (v8)
    {
      [v8 configuration];

      switch((uint64_t)v27)
      {
        case 0:
          goto LABEL_8;
        case 1:
          id v17 = [v4 filterLogicController];
          uint64_t v19 = [v17 filterViewModels];
          goto LABEL_18;
        case 2:
          v20 = [v4 compactCollectionLogicControllers];
          double v21 = [v8 sectionIdentifier];
          double v22 = [v20 objectForKey:v21];

          if (!v22) {
            goto LABEL_14;
          }
          objc_super v23 = [v4 compactCollectionLogicControllers];
          v24 = [v8 sectionIdentifier];
          id v14 = [v23 objectForKey:v24];

          uint64_t v15 = [v14 compactCollectionsInSection:0];
          goto LABEL_13;
        case 3:
        case 4:
        case 6:
          id v9 = [v4 collectionLogicControllers];
          double v10 = [v8 sectionIdentifier];
          double v11 = [v9 objectForKey:v10];

          if (!v11) {
            goto LABEL_14;
          }
          v12 = [v4 collectionLogicControllers];
          v13 = [v8 sectionIdentifier];
          id v14 = [v12 objectForKey:v13];

          uint64_t v15 = [v14 collections];
LABEL_13:
          v4 = (void *)v15;

          break;
        case 5:
          v4 = [v4 publishers];
          break;
        case 7:
          id v17 = +[MKCollectionBatchCell reuseIdentifier];
          v28 = v17;
          double v18 = &v28;
          goto LABEL_17;
        default:
          break;
      }
    }
    else
    {
      long long v26 = 0u;
      long long v27 = 0u;
LABEL_8:
      id v16 = [v4 featuredGuideViewModel:v26, v27];

      if (v16)
      {
        id v17 = [v4 featuredGuideViewModel];
        v29 = v17;
        double v18 = &v29;
LABEL_17:
        uint64_t v19 = +[NSArray arrayWithObjects:v18 count:1];
LABEL_18:
        v4 = (void *)v19;
      }
      else
      {
LABEL_14:
        v4 = &__NSArray0__struct;
      }
    }
  }

  return v4;
}

- (void)initializeSectionsUsingMaxWidth:(double)a3 traitEnvironment:(id)a4
{
  id v6 = a4;
  id v7 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
  sections = self->_sections;
  self->_sections = v7;

  id v9 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
  collectionLogicControllers = self->_collectionLogicControllers;
  self->_collectionLogicControllers = v9;

  double v11 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
  compactCollectionLogicControllers = self->_compactCollectionLogicControllers;
  self->_compactCollectionLogicControllers = v11;

  v13 = [(GuidesHomeLogicController *)self result];
  id v14 = [v13 featuredGuidesSection];
  uint64_t v15 = [v14 featuredGuides];
  id v16 = [v15 firstObject];
  id v17 = [v16 collection];

  if (v17)
  {
    double v18 = [[GuidesHomeSection alloc] initWithSectionKind:0 usingMaxWidth:v6 usingTraitEnvironment:1 count:a3];
    uint64_t v19 = [GuidesHomeHeaderViewModel alloc];
    v20 = [(GuidesHomeLogicController *)self guideLocation];
    double v21 = [(GuidesHomeLogicController *)self result];
    double v22 = [v21 featuredGuidesSection];
    objc_super v23 = [v22 title];
    v24 = [(GuidesHomeHeaderViewModel *)v19 initWithGuideLocation:v20 featuredGuide:v17 sectionTitle:v23];
    [(GuidesHomeLogicController *)self setFeaturedGuideViewModel:v24];

    id v25 = [(GuidesHomeLogicController *)self sections];
    [v25 addObject:v18];
  }
  long long v26 = [(GuidesHomeLogicController *)self result];
  long long v27 = [v26 filtersSection];

  if (v27)
  {
    id v28 = [v27 filters];
    if (![v28 count])
    {
      v36 = sub_10057611C();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_ERROR, "Guides Home section for Filters couldn't build any objects to display in section", buf, 2u);
      }
      goto LABEL_8;
    }
    v29 = [CollectionsFilterLogicController alloc];
    v30 = [(GuidesHomeLogicController *)self selectedFilterIndexPath];
    id v31 = [(CollectionsFilterLogicController *)v29 initForGuidesHomeViewUsingFilters:v28 withSelectedFilterIndexPath:v30 traitEnvironment:v6];
    [(GuidesHomeLogicController *)self setFilterLogicController:v31];

    v32 = -[GuidesHomeSection initWithSectionKind:usingMaxWidth:usingTraitEnvironment:count:]([GuidesHomeSection alloc], "initWithSectionKind:usingMaxWidth:usingTraitEnvironment:count:", 1, v6, [v28 count], a3);
    v33 = [v27 title];
    [(GuidesHomeSection *)v32 setSectionTitle:v33];

    v34 = [(GuidesHomeLogicController *)self sections];
    [v34 addObject:v32];
  }
  v35 = [(GuidesHomeLogicController *)self loadingSection];

  if (v35)
  {
    id v28 = [(GuidesHomeLogicController *)self sections];
    v36 = [(GuidesHomeLogicController *)self loadingSection];
    [v28 addObject:v36];
LABEL_8:

    goto LABEL_11;
  }
  v37 = [(GuidesHomeLogicController *)self filteredGuidesSection];

  if (!v37)
  {
    v49 = [(GuidesHomeLogicController *)self result];
    v50 = [v49 repeatableSections];
    v51[0] = _NSConcreteStackBlock;
    v51[1] = 3221225472;
    v51[2] = sub_10095372C;
    v51[3] = &unk_101303138;
    double v54 = a3;
    id v52 = v6;
    v53 = self;
    [v50 enumerateObjectsUsingBlock:v51];

    goto LABEL_12;
  }
  id v38 = objc_alloc((Class)MKPlaceCollectionsLogicController);
  v39 = [(GuidesHomeLogicController *)self recentCollectionFromCollectionResults];
  v40 = [(GuidesHomeLogicController *)self batchCollectionIds];
  v41 = [(GuidesHomeLogicController *)self guideFetcher];
  v42 = [(GuidesHomeLogicController *)self guideConsumer];
  v43 = +[CuratedCollectionSyncManager sharedManager];
  id v28 = [v38 initWithCollectionView:0 withPlaceCollections:v39 usingCollectionIds:v40 usingCollectionFetcher:v41 usingGuideConsumer:v42 usingSyncCoordinator:v43 inContext:9 usingBatchSize:10];

  v44 = [(GuidesHomeLogicController *)self collectionLogicControllers];
  v45 = [(GuidesHomeLogicController *)self filteredGuidesSection];
  v46 = [v45 sectionIdentifier];
  [v44 setObject:v28 forKey:v46];

  v47 = [(GuidesHomeLogicController *)self sections];
  v48 = [(GuidesHomeLogicController *)self filteredGuidesSection];
  [v47 addObject:v48];

LABEL_11:
LABEL_12:
}

- (id)selectedFilterIndexPath
{
  v2 = [(GuidesHomeLogicController *)self filterLogicController];
  id v3 = [v2 selectedFilterIndexPath];

  return v3;
}

- (id)routeToSelectedFilterAtIndexPath:(id)a3
{
  return 0;
}

- (id)routeToSelectedAllCollectionsFilterAtIndexPath:(id)a3
{
  return 0;
}

- (id)routeToSelectedGuidesHomeFilterAtIndexPath:(id)a3
{
  id v4 = a3;
  v5 = [(GuidesHomeLogicController *)self filterLogicController];
  id v6 = [v5 routeToSelectedGuidesHomeFilterAtIndexPath:v4];

  if (v4)
  {
    id v7 = [GuidesHomeSection alloc];
    [(GuidesHomeLogicController *)self maxWidth];
    double v9 = v8;
    double v10 = [(GuidesHomeLogicController *)self traitEnvironment];
    double v11 = [(GuidesHomeSection *)v7 initWithSectionKind:7 usingMaxWidth:v10 usingTraitEnvironment:1 count:v9];
    [(GuidesHomeLogicController *)self setLoadingSection:v11];
  }
  else
  {
    [(GuidesHomeLogicController *)self setLoadingSection:0];
    [(GuidesHomeLogicController *)self setFilteredGuidesSection:0];
  }
  [(GuidesHomeLogicController *)self maxWidth];
  double v13 = v12;
  id v14 = [(GuidesHomeLogicController *)self traitEnvironment];
  [(GuidesHomeLogicController *)self initializeSectionsUsingMaxWidth:v14 traitEnvironment:v13];

  return v6;
}

- (GEOGuidesHomeResult)result
{
  return self->_result;
}

- (void)setResult:(id)a3
{
}

- (NSMutableDictionary)collectionLogicControllers
{
  return self->_collectionLogicControllers;
}

- (void)setCollectionLogicControllers:(id)a3
{
}

- (NSMutableDictionary)compactCollectionLogicControllers
{
  return self->_compactCollectionLogicControllers;
}

- (void)setCompactCollectionLogicControllers:(id)a3
{
}

- (NSArray)publishers
{
  return self->_publishers;
}

- (void)setPublishers:(id)a3
{
}

- (NSMutableArray)sections
{
  return self->_sections;
}

- (void)setSections:(id)a3
{
}

- (UIFont)titleFont
{
  return self->_titleFont;
}

- (void)setTitleFont:(id)a3
{
}

- (double)maxWidth
{
  return self->_maxWidth;
}

- (void)setMaxWidth:(double)a3
{
  self->_maxWidth = a3;
}

- (UITraitEnvironment)traitEnvironment
{
  return self->_traitEnvironment;
}

- (void)setTraitEnvironment:(id)a3
{
}

- (GEOGuideLocation)guideLocation
{
  return self->_guideLocation;
}

- (void)setGuideLocation:(id)a3
{
}

- (GuidesHomeHeaderViewModel)featuredGuideViewModel
{
  return self->_featuredGuideViewModel;
}

- (void)setFeaturedGuideViewModel:(id)a3
{
}

- (CollectionsFilterLogicController)filterLogicController
{
  return self->_filterLogicController;
}

- (void)setFilterLogicController:(id)a3
{
}

- (NSArray)recentCollectionFromCollectionResults
{
  return self->_recentCollectionFromCollectionResults;
}

- (void)setRecentCollectionFromCollectionResults:(id)a3
{
}

- (NSArray)batchCollectionIds
{
  return self->_batchCollectionIds;
}

- (void)setBatchCollectionIds:(id)a3
{
}

- (GuidesHomeSection)filteredGuidesSection
{
  return self->_filteredGuidesSection;
}

- (void)setFilteredGuidesSection:(id)a3
{
}

- (GuidesHomeSection)loadingSection
{
  return self->_loadingSection;
}

- (void)setLoadingSection:(id)a3
{
}

- (MKPlaceBatchFetcher)guideFetcher
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_guideFetcher);

  return (MKPlaceBatchFetcher *)WeakRetained;
}

- (void)setGuideFetcher:(id)a3
{
}

- (MKPlaceBatchConsumer)guideConsumer
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_guideConsumer);

  return (MKPlaceBatchConsumer *)WeakRetained;
}

- (void)setGuideConsumer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_guideConsumer);
  objc_destroyWeak((id *)&self->_guideFetcher);
  objc_storeStrong((id *)&self->_loadingSection, 0);
  objc_storeStrong((id *)&self->_filteredGuidesSection, 0);
  objc_storeStrong((id *)&self->_batchCollectionIds, 0);
  objc_storeStrong((id *)&self->_recentCollectionFromCollectionResults, 0);
  objc_storeStrong((id *)&self->_filterLogicController, 0);
  objc_storeStrong((id *)&self->_featuredGuideViewModel, 0);
  objc_storeStrong((id *)&self->_guideLocation, 0);
  objc_storeStrong((id *)&self->_traitEnvironment, 0);
  objc_storeStrong((id *)&self->_titleFont, 0);
  objc_storeStrong((id *)&self->_sections, 0);
  objc_storeStrong((id *)&self->_publishers, 0);
  objc_storeStrong((id *)&self->_compactCollectionLogicControllers, 0);
  objc_storeStrong((id *)&self->_collectionLogicControllers, 0);

  objc_storeStrong((id *)&self->_result, 0);
}

@end