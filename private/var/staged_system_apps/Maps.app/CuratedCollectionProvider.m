@interface CuratedCollectionProvider
- (BOOL)isApplyingSnapshot;
- (CGRect)subheaderFrame;
- (CuratedCollectionActionCellModel)actionModel;
- (CuratedCollectionDescriptionCellModel)descriptionModel;
- (CuratedCollectionMediaIntegrationViewModel)mediaIntegrationModel;
- (CuratedCollectionProvider)initWithTableView:(id)a3 curatedCollectionIdentifier:(id)a4;
- (CuratedCollectionProvider)initWithTableView:(id)a3 fullyClientizedCuratedCollection:(id)a4;
- (CuratedCollectionResolver)resolver;
- (CuratedCollectionResolverInfo)resolverInfo;
- (CuratedCollectionRichTextParser)parser;
- (CuratedCollectionViewAnalyticsController)analyticsController;
- (GEOPlaceCollection)curatedCollection;
- (NSArray)collectionItems;
- (NSArray)footerActionItems;
- (NSArray)models;
- (NSArray)storeSubscriptionTypes;
- (TwoLinesContentViewModel)publisherModel;
- (UITableViewDiffableDataSource)dataSource;
- (_TtC8MapsSync13MapsSyncStore)mapsSyncStore;
- (double)subheaderTransitionFraction;
- (double)tableView:(id)a3 estimatedHeightForRowAtIndexPath:(id)a4;
- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4;
- (id)keyCommands;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4 itemIdentifier:(id)a5;
- (void)_commonInitWithTableView:(id)a3;
- (void)_openURL:(id)a3;
- (void)_punchoutToViewModel:(id)a3;
- (void)_reconfigureSnapshot:(id)a3 updatedModels:(id)a4;
- (void)_updateActionColorsInCell:(id)a3 animated:(BOOL)a4;
- (void)_updateDescriptionColorsInCell:(id)a3 animated:(BOOL)a4;
- (void)_updateKeyCommandsAtIndexPath:(id)a3;
- (void)_updateLibraryStatusForModels;
- (void)_updateSnapshotWithCollection:(id)a3 resolverInfo:(id)a4;
- (void)_updateSubheaderColors;
- (void)addToUserCollection:(id)a3;
- (void)cellExpansionOccured:(id)a3;
- (void)cellPublisherLogoTapped:(id)a3;
- (void)collectionManager:(id)a3 contentDidChange:(id)a4;
- (void)dealloc;
- (void)didFailToResolveCollectionWithError:(id)a3 withFetchedCollection:(id)a4;
- (void)didResolveCollection:(id)a3 resolverInfo:(id)a4;
- (void)didSelectAddOrRemoveFromLibrary:(BOOL)a3 forModel:(id)a4;
- (void)didSelectAddToUserCollection:(id)a3 forMapItem:(id)a4 sourceView:(id)a5 onSaveCompletion:(id)a6;
- (void)mediaIntegrationCell:(id)a3 didSelectChildLink:(id)a4;
- (void)mediaIntegrationCellDidDisplayChildLinks:(id)a3;
- (void)openAppClip:(id)a3;
- (void)refresh;
- (void)setActionModel:(id)a3;
- (void)setAnalyticsController:(id)a3;
- (void)setCollectionItems:(id)a3;
- (void)setCuratedCollection:(id)a3;
- (void)setDataSource:(id)a3;
- (void)setDescriptionModel:(id)a3;
- (void)setFooterActionItems:(id)a3;
- (void)setMapsSyncStore:(id)a3;
- (void)setMediaIntegrationModel:(id)a3;
- (void)setModels:(id)a3;
- (void)setParser:(id)a3;
- (void)setPublisherModel:(id)a3;
- (void)setResolver:(id)a3;
- (void)setResolverInfo:(id)a3;
- (void)setStoreSubscriptionTypes:(id)a3;
- (void)setSubheaderTransitionFraction:(double)a3;
- (void)startResolvingCollection;
- (void)storeDidChangeWithTypes:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)tableView:(id)a3 didUpdateFocusInContext:(id)a4 withAnimationCoordinator:(id)a5;
- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5;
- (void)willPunchOutToPublisherWebpageForPlaceCollectionItem:(id)a3;
@end

@implementation CuratedCollectionProvider

- (CuratedCollectionProvider)initWithTableView:(id)a3 curatedCollectionIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)CuratedCollectionProvider;
  v8 = [(DataSource *)&v12 initWithTableView:v6 updateLocation:1];
  if (v8)
  {
    v9 = [[CuratedCollectionResolver alloc] initWithCuratedCollectionIdentifier:v7 delegate:v8];
    resolver = v8->_resolver;
    v8->_resolver = v9;

    [(CuratedCollectionProvider *)v8 _commonInitWithTableView:v6];
  }

  return v8;
}

- (CuratedCollectionProvider)initWithTableView:(id)a3 fullyClientizedCuratedCollection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)CuratedCollectionProvider;
  v8 = [(DataSource *)&v12 initWithTableView:v6 updateLocation:1];
  if (v8)
  {
    v9 = [[CuratedCollectionResolver alloc] initWithFullyClientizedCuratedCollection:v7 delegate:v8];
    resolver = v8->_resolver;
    v8->_resolver = v9;

    [(CuratedCollectionProvider *)v8 _commonInitWithTableView:v6];
  }

  return v8;
}

- (void)dealloc
{
  if (+[LibraryUIUtilities isMyPlacesEnabled])
  {
    v3 = [(CuratedCollectionProvider *)self mapsSyncStore];
    [v3 unsubscribe:self];
  }
  v4.receiver = self;
  v4.super_class = (Class)CuratedCollectionProvider;
  [(CuratedCollectionProvider *)&v4 dealloc];
}

- (void)_commonInitWithTableView:(id)a3
{
  v32[0] = objc_opt_class();
  v32[1] = objc_opt_class();
  objc_super v4 = +[NSArray arrayWithObjects:v32 count:2];
  storeSubscriptionTypes = self->_storeSubscriptionTypes;
  self->_storeSubscriptionTypes = v4;

  id v6 = +[MapsSyncStore sharedStore];
  [(CuratedCollectionProvider *)self setMapsSyncStore:v6];

  if (+[LibraryUIUtilities isMyPlacesEnabled])
  {
    id v7 = [(CuratedCollectionProvider *)self mapsSyncStore];
    [v7 subscribe:self];
  }
  else
  {
    id v7 = +[CollectionManager sharedManager];
    [v7 addObserver:self];
  }

  v8 = [(DataSource *)self tableView];
  [v8 setDelegate:self];

  v9 = [(DataSource *)self tableView];
  uint64_t v10 = objc_opt_class();
  v11 = +[CuratedCollectionDescriptionTableViewCell reuseIdentifier];
  [v9 registerClass:v10 forCellReuseIdentifier:v11];

  objc_super v12 = [(DataSource *)self tableView];
  uint64_t v13 = objc_opt_class();
  v14 = +[CuratedCollectionActionTableViewCell reuseIdentifier];
  [v12 registerClass:v13 forCellReuseIdentifier:v14];

  v15 = [(DataSource *)self tableView];
  uint64_t v16 = objc_opt_class();
  v17 = +[CuratedCollectionItemTableViewCell reuseIdentifier];
  [v15 registerClass:v16 forCellReuseIdentifier:v17];

  v18 = [(DataSource *)self tableView];
  uint64_t v19 = objc_opt_class();
  v20 = +[TwoLinesTableViewCell identifier];
  [v18 registerClass:v19 forCellReuseIdentifier:v20];

  v21 = [(DataSource *)self tableView];
  uint64_t v22 = objc_opt_class();
  v23 = +[CuratedCollectionFooterActionTableViewCell reuseIdentifier];
  [v21 registerClass:v22 forCellReuseIdentifier:v23];

  v24 = [(DataSource *)self tableView];
  uint64_t v25 = objc_opt_class();
  v26 = +[CuratedCollectionMediaIntegrationTableViewCell reuseIdentifier];
  [v24 registerClass:v25 forCellReuseIdentifier:v26];

  id v27 = objc_alloc((Class)UITableViewDiffableDataSource);
  v28 = [(DataSource *)self tableView];
  v29 = sub_1005B3760(self);
  v30 = (UITableViewDiffableDataSource *)[v27 initWithTableView:v28 cellProvider:v29];
  dataSource = self->_dataSource;
  self->_dataSource = v30;
}

- (void)startResolvingCollection
{
  [(CuratedCollectionResolver *)self->_resolver setShouldResolveAppClips:MapsFeature_IsEnabled_Maps269()];
  resolver = self->_resolver;

  [(CuratedCollectionResolver *)resolver resolveCollection];
}

- (void)addToUserCollection:(id)a3
{
  id v7 = a3;
  objc_super v4 = [(DataSource *)self tableView];
  v5 = [v7 cell_IndexPath];
  id v6 = [v4 cellForRowAtIndexPath:v5];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [v6 addToUserCollection:v7];
  }
}

- (void)_updateKeyCommandsAtIndexPath:(id)a3
{
  id v4 = a3;
  v5 = [(DataSource *)self tableView];
  uint64_t v6 = sub_1000BBB44(v5);

  id v7 = &__NSArray0__struct;
  if (v4 && v6 != 5)
  {
    v8 = sub_100A4B500((uint64_t)"addToUserCollection:", v4);
    v11 = v8;
    id v7 = +[NSArray arrayWithObjects:&v11 count:1];
  }
  v9 = (NSArray *)[v7 copy];
  keyCommands = self->_keyCommands;
  self->_keyCommands = v9;
}

- (CGRect)subheaderFrame
{
  v3 = [(CuratedCollectionProvider *)self descriptionModel];

  if (v3
    && (dataSource = self->_dataSource,
        [(CuratedCollectionProvider *)self descriptionModel],
        v5 = objc_claimAutoreleasedReturnValue(),
        [(UITableViewDiffableDataSource *)dataSource indexPathForItemIdentifier:v5],
        uint64_t v6 = objc_claimAutoreleasedReturnValue(),
        v5,
        v6))
  {
    id v7 = [(DataSource *)self tableView];
    [v7 rectForRowAtIndexPath:v6];
    CGFloat x = v8;
    CGFloat y = v10;
    CGFloat width = v12;
    CGFloat height = v14;
  }
  else
  {
    CGFloat x = CGRectZero.origin.x;
    CGFloat y = CGRectZero.origin.y;
    CGFloat width = CGRectZero.size.width;
    CGFloat height = CGRectZero.size.height;
  }
  double v16 = x;
  double v17 = y;
  double v18 = width;
  double v19 = height;
  result.size.CGFloat height = v19;
  result.size.CGFloat width = v18;
  result.origin.CGFloat y = v17;
  result.origin.CGFloat x = v16;
  return result;
}

- (void)setSubheaderTransitionFraction:(double)a3
{
  if (self->_subheaderTransitionFraction != a3)
  {
    self->_subheaderTransitionFraction = a3;
    [(CuratedCollectionProvider *)self _updateSubheaderColors];
  }
}

- (void)_updateSubheaderColors
{
  v3 = [(CuratedCollectionProvider *)self descriptionModel];

  if (v3)
  {
    dataSource = self->_dataSource;
    v5 = [(CuratedCollectionProvider *)self descriptionModel];
    uint64_t v6 = [(UITableViewDiffableDataSource *)dataSource indexPathForItemIdentifier:v5];

    if (v6)
    {
      id v7 = [(DataSource *)self tableView];
      double v8 = [v7 cellForRowAtIndexPath:v6];

      if (v8) {
        [(CuratedCollectionProvider *)self _updateDescriptionColorsInCell:v8 animated:1];
      }
    }
  }
  v9 = [(CuratedCollectionProvider *)self actionModel];

  if (v9)
  {
    double v10 = self->_dataSource;
    v11 = [(CuratedCollectionProvider *)self actionModel];
    id v15 = [(UITableViewDiffableDataSource *)v10 indexPathForItemIdentifier:v11];

    double v12 = v15;
    if (v15)
    {
      uint64_t v13 = [(DataSource *)self tableView];
      double v14 = [v13 cellForRowAtIndexPath:v15];

      if (v14) {
        [(CuratedCollectionProvider *)self _updateActionColorsInCell:v14 animated:1];
      }

      double v12 = v15;
    }
  }
}

- (void)_updateDescriptionColorsInCell:(id)a3 animated:(BOOL)a4
{
}

- (void)_updateActionColorsInCell:(id)a3 animated:(BOOL)a4
{
}

- (void)didResolveCollection:(id)a3 resolverInfo:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  double v8 = [CuratedCollectionRichTextParser alloc];
  v9 = [v7 collectionItems];
  double v10 = [(DataSource *)self tableView];
  v11 = [v10 traitCollection];
  double v12 = [(CuratedCollectionRichTextParser *)v8 initWithCollection:v6 collectionItems:v9 traitCollection:v11];
  parser = self->_parser;
  self->_parser = v12;

  double v14 = self->_parser;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_100BC16FC;
  v17[3] = &unk_1012EA2C0;
  objc_copyWeak(&v20, &location);
  id v15 = v6;
  id v18 = v15;
  id v16 = v7;
  id v19 = v16;
  [(CuratedCollectionRichTextParser *)v14 parseRichTextDescriptionsWithCompletion:v17];

  objc_destroyWeak(&v20);
  objc_destroyWeak(&location);
}

- (void)_updateSnapshotWithCollection:(id)a3 resolverInfo:(id)a4
{
  id v103 = a3;
  id v6 = a4;
  id v7 = sub_100BC22B0();
  os_signpost_id_t v8 = os_signpost_id_generate(v7);

  v9 = sub_100BC22B0();
  double v10 = v9;
  unint64_t v11 = v8 - 1;
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v10, OS_SIGNPOST_INTERVAL_BEGIN, v8, "ResolvedCollectionWithItems", "", buf, 2u);
  }

  id v12 = objc_alloc_init((Class)NSDiffableDataSourceSnapshot);
  [(CuratedCollectionProvider *)self setCuratedCollection:v103];
  [(CuratedCollectionProvider *)self setResolverInfo:v6];
  uint64_t v13 = [v6 collectionItems];
  [(CuratedCollectionProvider *)self setCollectionItems:v13];

  if (([v103 isSuppressed] & 1) != 0
    || ([v103 isBlocked] & 1) != 0)
  {
    id v14 = [objc_alloc((Class)UIView) initWithFrame:CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height];
    id v15 = [(DataSource *)self tableView];
    [v15 setTableFooterView:v14];

    id v16 = [(DataSource *)self tableView];
    [v16 setScrollEnabled:0];

    double v17 = +[UIColor clearColor];
    id v18 = [(DataSource *)self tableView];
    [v18 setSeparatorColor:v17];
  }
  else
  {
    unint64_t v95 = v8 - 1;
    os_signpost_id_t v96 = v8;
    v97 = v6;
    id v19 = [CuratedCollectionActionCellModel alloc];
    id v20 = [(CuratedCollectionProvider *)self curatedCollection];
    v21 = [(CuratedCollectionActionCellModel *)v19 initWithCollection:v20];
    [(CuratedCollectionProvider *)self setActionModel:v21];

    uint64_t v22 = [(DataSource *)self delegate];
    v23 = [(CuratedCollectionProvider *)self actionModel];
    [v23 setActionDelegate:v22];

    CFStringRef v118 = @"CollectionActionSection";
    v24 = +[NSArray arrayWithObjects:&v118 count:1];
    [v12 appendSectionsWithIdentifiers:v24];

    uint64_t v25 = [(CuratedCollectionProvider *)self actionModel];
    v117 = v25;
    v26 = +[NSArray arrayWithObjects:&v117 count:1];
    [v12 appendItemsWithIdentifiers:v26];

    id v27 = [CuratedCollectionDescriptionCellModel alloc];
    v28 = [(CuratedCollectionProvider *)self curatedCollection];
    v29 = [(CuratedCollectionRichTextParser *)self->_parser collectionDescription];
    v30 = [(CuratedCollectionDescriptionCellModel *)v27 initWithCollection:v28 collectionDescription:v29];
    [(CuratedCollectionProvider *)self setDescriptionModel:v30];

    CFStringRef v116 = @"CollectionDescriptionSection";
    v31 = +[NSArray arrayWithObjects:&v116 count:1];
    [v12 appendSectionsWithIdentifiers:v31];

    v32 = [(CuratedCollectionProvider *)self descriptionModel];
    v115 = v32;
    v33 = +[NSArray arrayWithObjects:&v115 count:1];
    v94 = v12;
    [v12 appendItemsWithIdentifiers:v33];

    v100 = +[CollectionManager sharedManager];
    v102 = +[NSMutableArray array];
    long long v106 = 0u;
    long long v107 = 0u;
    long long v108 = 0u;
    long long v109 = 0u;
    id obj = [(CuratedCollectionProvider *)self collectionItems];
    v101 = self;
    id v104 = [obj countByEnumeratingWithState:&v106 objects:v114 count:16];
    if (v104)
    {
      uint64_t v99 = *(void *)v107;
      do
      {
        for (i = 0; i != v104; i = (char *)i + 1)
        {
          if (*(void *)v107 != v99) {
            objc_enumerationMutation(obj);
          }
          v35 = *(void **)(*((void *)&v106 + 1) + 8 * i);
          id v36 = objc_alloc((Class)MKMapItemIdentifier);
          v37 = [v35 placeCollectionItem];
          v38 = [v37 itemIdentifier];
          id v39 = [v36 initWithGEOMapItemIdentifier:v38];

          v40 = [(CuratedCollectionRichTextParser *)self->_parser collectionItemDescriptions];
          v41 = [v40 objectForKeyedSubscript:v39];

          v42 = [v35 mapItem];
          v43 = [v100 firstUserGuideContainingMapItem:v42 requiresOrdering:0];
          BOOL v44 = v43 != 0;

          v45 = [(CuratedCollectionResolver *)self->_resolver appClips];
          v46 = [v35 placeCollectionItem];
          v47 = [v46 itemIdentifier];
          v48 = [v45 objectForKeyedSubscript:v47];

          v49 = [_TtC4Maps29LibraryDataOperationsProvider alloc];
          v50 = [(CuratedCollectionProvider *)self mapsSyncStore];
          v51 = [(LibraryDataOperationsProvider *)v49 initWithMapsSyncStore:v50];

          v52 = [_TtC4Maps39CuratedCollectionItemLibraryCoordinator alloc];
          v53 = [v35 mapItem];
          v54 = [(CuratedCollectionItemLibraryCoordinator *)v52 initWithInitialMapItem:v53 dataOperationsProvider:v51];

          v55 = [CuratedCollectionItemCellModel alloc];
          v56 = [v103 publisherAttribution];
          v57 = [(CuratedCollectionItemCellModel *)v55 initWithMKPlaceCollectionMapItem:v35 usingAttribution:v56 itemDescription:v41 itemInUserCollection:v44 libraryOperationsCoordinator:v54 appClip:v48];
          [v102 addObject:v57];

          self = v101;
        }
        id v104 = [obj countByEnumeratingWithState:&v106 objects:v114 count:16];
      }
      while (v104);
    }

    id v6 = v97;
    v58 = [v97 mediaIntegration];
    id v12 = v94;
    unint64_t v11 = v95;
    if (v58)
    {
      if ([v97 mediaIntegrationCollectionItemIndex] != (id)0x7FFFFFFFFFFFFFFFLL)
      {
        v59 = [CuratedCollectionMediaIntegrationViewModel alloc];
        v60 = [v97 thirdPartyLinks];
        v61 = [(CuratedCollectionMediaIntegrationViewModel *)v59 initWithAppleMediaServicesResult:v58 thirdPartyLinks:v60];
        [(CuratedCollectionProvider *)self setMediaIntegrationModel:v61];

        v62 = [(CuratedCollectionProvider *)self mediaIntegrationModel];

        if (v62)
        {
          id v63 = [v97 mediaIntegrationPosition];
          if (!v63 || v63 == (id)2)
          {
            uint64_t v64 = (uint64_t)[v97 mediaIntegrationCollectionItemIndex] + 1;
          }
          else if (v63 == (id)1)
          {
            uint64_t v64 = (uint64_t)[v97 mediaIntegrationCollectionItemIndex];
          }
          else
          {
            uint64_t v64 = 0;
          }
          id v65 = (id)(v64 & ~(v64 >> 63));
          if ((uint64_t)v65 >= (uint64_t)[v102 count]) {
            id v65 = [v102 count];
          }
          v66 = [(CuratedCollectionProvider *)self mediaIntegrationModel];
          [v102 insertObject:v66 atIndex:v65];
        }
      }
    }
    id v67 = [v102 copy];
    [(CuratedCollectionProvider *)self setModels:v67];

    CFStringRef v113 = @"CollectionItemSection";
    v68 = +[NSArray arrayWithObjects:&v113 count:1];
    [v94 appendSectionsWithIdentifiers:v68];

    v69 = [(CuratedCollectionProvider *)self models];
    [v94 appendItemsWithIdentifiers:v69];

    v70 = +[NSMutableArray arrayWithCapacity:1];
    v71 = +[UIDevice currentDevice];
    BOOL v72 = [v71 userInterfaceIdiom] != (id)5;

    v73 = [v103 publisher];
    v74 = +[TwoLinesContentViewModelComposer cellModelForPublisher:v73 showDisclosureIndicator:v72];
    [v70 addObject:v74];

    id v75 = [v70 copy];
    [(CuratedCollectionProvider *)self setPublisherModel:v75];

    CFStringRef v112 = @"CollectionPublisherItemSection";
    v76 = +[NSArray arrayWithObjects:&v112 count:1];
    [v94 appendSectionsWithIdentifiers:v76];

    v77 = [(CuratedCollectionProvider *)self publisherModel];
    [v94 appendItemsWithIdentifiers:v77];

    v78 = [CuratedCollectionFooterActionItem alloc];
    v79 = +[NSBundle mainBundle];
    v80 = [v79 localizedStringForKey:@"Report an Issue" value:@"localized string not found" table:0];
    v81 = [(CuratedCollectionFooterActionItem *)v78 initWithType:0 title:v80 glyph:@"exclamationmark.bubble.fill"];

    self = v101;
    [(CuratedCollectionProvider *)v101 setFooterActionItems:&__NSArray0__struct];
    if (_MKRAPIsAvailable() && (sub_100521BD0() & 1) == 0)
    {
      v82 = [(CuratedCollectionProvider *)v101 footerActionItems];
      v83 = [v82 arrayByAddingObject:v81];
      [(CuratedCollectionProvider *)v101 setFooterActionItems:v83];
    }
    CFStringRef v111 = @"ActionsItemSection";
    v84 = +[NSArray arrayWithObjects:&v111 count:1];
    [v94 appendSectionsWithIdentifiers:v84];

    v85 = [(CuratedCollectionProvider *)v101 footerActionItems];
    [v94 appendItemsWithIdentifiers:v85];

    v86 = [(DataSource *)v101 tableView];
    [v86 setScrollEnabled:1];

    v87 = +[UIColor separatorColor];
    v88 = [(DataSource *)v101 tableView];
    [v88 setSeparatorColor:v87];

    v89 = [(DataSource *)v101 tableView];
    [v89 setTableFooterView:0];

    os_signpost_id_t v8 = v96;
    double v17 = v100;
    id v18 = v102;
  }

  v90 = [(CuratedCollectionProvider *)self dataSource];
  v105[0] = _NSConcreteStackBlock;
  v105[1] = 3221225472;
  v105[2] = sub_100BC2304;
  v105[3] = &unk_1012E5D08;
  v105[4] = self;
  [v90 applySnapshot:v12 animatingDifferences:0 completion:v105];

  v91 = [(DataSource *)self delegate];
  [v91 dataSourceUpdated:self];

  v92 = sub_100BC22B0();
  v93 = v92;
  if (v11 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v92))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v93, OS_SIGNPOST_INTERVAL_END, v8, "ResolvedCollectionWithItems", "", buf, 2u);
  }
}

- (void)didFailToResolveCollectionWithError:(id)a3 withFetchedCollection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  os_signpost_id_t v8 = sub_100BC22B0();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    int v17 = 138412290;
    id v18 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "Failed to resolve collection with error %@", (uint8_t *)&v17, 0xCu);
  }

  id v9 = [objc_alloc((Class)UIView) initWithFrame:CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height];
  double v10 = [(DataSource *)self tableView];
  [v10 setTableFooterView:v9];

  unint64_t v11 = [(DataSource *)self tableView];
  [v11 setScrollEnabled:0];

  id v12 = +[UIColor clearColor];
  uint64_t v13 = [(DataSource *)self tableView];
  [v13 setSeparatorColor:v12];

  id v14 = [(DataSource *)self delegate];
  id v15 = v7;
  if ([v15 isBlocked])
  {
    uint64_t v16 = 1;
  }
  else if ([v15 isSuppressed])
  {
    uint64_t v16 = 2;
  }
  else if (MKCurrentNetworkConnectionFailureDiagnosis())
  {
    uint64_t v16 = 3;
  }
  else
  {
    uint64_t v16 = 0;
  }

  [v14 dataSource:self didFailWithErrorState:v16];
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4 itemIdentifier:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  unint64_t v11 = [(CuratedCollectionProvider *)self dataSource];
  id v12 = [v11 snapshot];

  uint64_t v13 = [v12 sectionIdentifiers];
  id v14 = [v13 objectAtIndex:[v9 section]];

  if ([v14 isEqualToString:@"CollectionActionSection"])
  {
    id v15 = +[CuratedCollectionActionTableViewCell reuseIdentifier];
    uint64_t v16 = [v8 dequeueReusableCellWithIdentifier:v15 forIndexPath:v9];

    [v16 configureWithModel:v10];
    [(CuratedCollectionProvider *)self _updateActionColorsInCell:v16 animated:0];
    goto LABEL_20;
  }
  if ([v14 isEqualToString:@"CollectionDescriptionSection"])
  {
    int v17 = +[CuratedCollectionDescriptionTableViewCell reuseIdentifier];
    uint64_t v16 = [v8 dequeueReusableCellWithIdentifier:v17 forIndexPath:v9];

    [v16 setDelegate:self];
    [v16 bounds];
    [v16 setSeparatorInset:CGRectMake(0.0, CGRectGetWidth(v34), 0.0, 0.0)];
    [v16 configureWithModel:v10];
    [(CuratedCollectionProvider *)self _updateDescriptionColorsInCell:v16 animated:0];
    goto LABEL_20;
  }
  if ([v14 isEqualToString:@"CollectionItemSection"])
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v18 = v10;
      id v19 = [(DataSource *)self currentLocation];
      [v18 setCurrentLocation:v19];

      id v20 = +[CuratedCollectionItemTableViewCell reuseIdentifier];
      uint64_t v16 = [v8 dequeueReusableCellWithIdentifier:v20 forIndexPath:v9];

      [v16 setDelegate:self];
      [v16 configureWithModel:v18];
      id v21 = [v9 row];
      uint64_t v22 = [(CuratedCollectionProvider *)self resolverInfo];
      if (v21 == [v22 mediaIntegrationCollectionItemIndex])
      {
        v23 = [(CuratedCollectionProvider *)self resolverInfo];
        id v24 = [v23 mediaIntegrationPosition];

        if (v24 == (id)2)
        {
          [v16 bounds];
          [v16 setSeparatorInset:CGRectMake(0.0, CGRectGetWidth(v35), 0.0, 0.0)];
        }
      }
      else
      {
      }
      goto LABEL_19;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v26 = +[CuratedCollectionMediaIntegrationTableViewCell reuseIdentifier];
      uint64_t v16 = [v8 dequeueReusableCellWithIdentifier:v26 forIndexPath:v9];

      [v16 setViewModel:v10];
      id v27 = [(CuratedCollectionProvider *)self resolverInfo];
      [v16 setPosition:[v27 mediaIntegrationPosition]];

      [v16 setDelegate:self];
      goto LABEL_20;
    }
    goto LABEL_17;
  }
  if ([v14 isEqualToString:@"CollectionPublisherItemSection"])
  {
    id v18 = v10;
    uint64_t v25 = +[TwoLinesTableViewCell identifier];
    uint64_t v16 = [v8 dequeueReusableCellWithIdentifier:v25];

    [v16 setViewModel:v18];
LABEL_19:

    goto LABEL_20;
  }
  if (![v14 isEqualToString:@"ActionsItemSection"])
  {
LABEL_17:
    uint64_t v16 = 0;
    goto LABEL_20;
  }
  v28 = +[CuratedCollectionFooterActionTableViewCell reuseIdentifier];
  uint64_t v16 = [v8 dequeueReusableCellWithIdentifier:v28 forIndexPath:v9];

  [v16 setActionItem:v10];
  v29 = (char *)[v9 row];
  v30 = [(CuratedCollectionProvider *)self footerActionItems];
  v31 = (char *)[v30 count] - 1;

  if (v29 == v31)
  {
    [v16 bounds];
    [v16 setSeparatorInset:CGRectMake(0.0, CGRectGetWidth(v36), 0.0, 0.0)];
  }
LABEL_20:

  return v16;
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  return UITableViewAutomaticDimension;
}

- (double)tableView:(id)a3 estimatedHeightForRowAtIndexPath:(id)a4
{
  id v5 = a4;
  id v6 = [(CuratedCollectionProvider *)self dataSource];
  id v7 = [v6 snapshot];

  id v8 = [v7 sectionIdentifiers];
  id v9 = [v5 section];

  id v10 = [v8 objectAtIndex:v9];

  if ([v10 isEqualToString:@"CollectionDescriptionSection"])
  {
    unint64_t v11 = CuratedCollectionDescriptionTableViewCell;
  }
  else
  {
    if (![v10 isEqualToString:@"CollectionItemSection"])
    {
      double v13 = UITableViewAutomaticDimension;
      goto LABEL_7;
    }
    unint64_t v11 = CuratedCollectionItemTableViewCell;
  }
  [(__objc2_class *)v11 estimatedCellHeight];
  double v13 = v12;
LABEL_7:

  return v13;
}

- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5
{
  id v18 = a4;
  id v7 = a5;
  id v8 = [(CuratedCollectionProvider *)self dataSource];
  id v9 = [v8 snapshot];

  id v10 = [v9 sectionIdentifiers];
  id v11 = [v7 section];

  double v12 = [v10 objectAtIndex:v11];

  if ([v12 isEqualToString:@"CollectionActionSection"])
  {
    id v13 = v18;
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v14 = v13;
    }
    else {
      id v14 = 0;
    }
    id v15 = v14;

    [(CuratedCollectionProvider *)self _updateActionColorsInCell:v15 animated:0];
  }
  else
  {
    if (![v12 isEqualToString:@"CollectionDescriptionSection"]) {
      goto LABEL_12;
    }
    id v16 = v18;
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      int v17 = v16;
    }
    else {
      int v17 = 0;
    }
    id v15 = v17;

    [(CuratedCollectionProvider *)self _updateDescriptionColorsInCell:v15 animated:0];
  }

LABEL_12:
}

- (void)tableView:(id)a3 didUpdateFocusInContext:(id)a4 withAnimationCoordinator:(id)a5
{
  id v17 = a3;
  id v7 = [a4 nextFocusedItem];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v8 = [v17 indexPathForCell:v7];
    if (v8)
    {
      id v9 = [(CuratedCollectionProvider *)self dataSource];
      id v10 = [v9 snapshot];

      id v11 = [v10 sectionIdentifiers];
      double v12 = [v11 objectAtIndex:[v8 section]];

      if ([v12 isEqualToString:@"CollectionItemSection"])
      {
        id v13 = [(CuratedCollectionProvider *)self models];
        id v14 = [v13 objectAtIndex:[v8 row]];

        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v15 = [v14 collectionItem];
          id v16 = [(DataSource *)self delegate];
          [v16 dataSource:self itemFocused:v15];

          [(CuratedCollectionProvider *)self _updateKeyCommandsAtIndexPath:v8];
          goto LABEL_10;
        }
      }
    }
  }
  [(CuratedCollectionProvider *)self _updateKeyCommandsAtIndexPath:0];
  id v8 = [(DataSource *)self delegate];
  [v8 dataSource:self itemFocused:0];
LABEL_10:
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v19 = a3;
  id v6 = a4;
  id v7 = [(CuratedCollectionProvider *)self dataSource];
  id v8 = [v7 snapshot];

  id v9 = [v8 sectionIdentifiers];
  id v10 = [v9 objectAtIndex:[v6 section]];

  if (![v10 isEqualToString:@"CollectionItemSection"])
  {
    if ([v10 isEqualToString:@"ActionsItemSection"])
    {
      [v19 deselectRowAtIndexPath:v6 animated:1];
      id v15 = [(CuratedCollectionProvider *)self footerActionItems];
      double v12 = [v15 objectAtIndex:[v6 row]];

      if ([v12 type]) {
        goto LABEL_13;
      }
      id v13 = [v19 cellForRowAtIndexPath:v6];
      id v16 = [(DataSource *)self delegate];
      [v16 presentRAPWithSourceView:v13];
    }
    else
    {
      if (![v10 isEqualToString:@"CollectionPublisherItemSection"]) {
        goto LABEL_14;
      }
      [v19 deselectRowAtIndexPath:v6 animated:1];
      double v12 = [(DataSource *)self delegate];
      id v13 = [(CuratedCollectionProvider *)self curatedCollection];
      id v16 = [v13 publisher];
      [v12 showPublisherView:v16];
    }

    goto LABEL_12;
  }
  id v11 = [(CuratedCollectionProvider *)self models];
  double v12 = [v11 objectAtIndex:[v6 row]];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v13 = [v12 collectionItem];
    id v14 = [(DataSource *)self delegate];
    [v14 dataSource:self itemTapped:v13];

LABEL_12:
    goto LABEL_13;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [v19 deselectRowAtIndexPath:v6 animated:1];
    id v17 = [(CuratedCollectionProvider *)self analyticsController];
    id v18 = [(CuratedCollectionProvider *)self mediaIntegrationModel];
    [v17 logTapMediaIntegrationWithType:[v18 mediaType] verticalIndex:[v6 row]];

    id v13 = [(CuratedCollectionProvider *)self mediaIntegrationModel];
    [(CuratedCollectionProvider *)self _punchoutToViewModel:v13];
    goto LABEL_12;
  }
LABEL_13:

LABEL_14:
}

- (void)_openURL:(id)a3
{
  id v3 = a3;
  id v4 = +[UIApplication sharedApplication];
  [v4 _maps_openURL:v3];
}

- (void)didSelectAddOrRemoveFromLibrary:(BOOL)a3 forModel:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  id v8 = [(DataSource *)self delegate];
  id v7 = [v6 libraryOperationsCoordinator];

  if (v4) {
    [v8 dataSource:self addPlaceToLibraryUsingCoordinator:v7];
  }
  else {
    [v8 dataSource:self removePlaceFromLibraryUsingCoordinator:v7];
  }
}

- (void)didSelectAddToUserCollection:(id)a3 forMapItem:(id)a4 sourceView:(id)a5 onSaveCompletion:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  id v14 = [(DataSource *)self delegate];
  [v14 dataSource:self addToUserCollection:v13 forMapItem:v12 sourceView:v11 onSaveCompletion:v10];
}

- (void)willPunchOutToPublisherWebpageForPlaceCollectionItem:(id)a3
{
  id v4 = a3;
  id v5 = [(DataSource *)self delegate];
  [v5 dataSource:self willPunchOuToPublisherWebpageForPlaceCollectionItem:v4];
}

- (void)openAppClip:(id)a3
{
  id v4 = a3;
  id v5 = [(DataSource *)self delegate];
  [v5 dataSource:self openAppClip:v4];
}

- (void)cellPublisherLogoTapped:(id)a3
{
  id v6 = [(DataSource *)self delegate];
  id v4 = [(CuratedCollectionProvider *)self curatedCollection];
  id v5 = [v4 publisher];
  [v6 showPublisherView:v5];
}

- (void)cellExpansionOccured:(id)a3
{
  unsigned int v4 = [a3 expanded];
  id v5 = [(CuratedCollectionProvider *)self analyticsController];
  id v6 = v5;
  if (v4) {
    [v5 logTapShowMoreDescription];
  }
  else {
    [v5 logTapShowLessDescription];
  }

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100BC3548;
  block[3] = &unk_1012E5D08;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)refresh
{
  id v3 = +[UIColor separatorColor];
  unsigned int v4 = [(DataSource *)self tableView];
  [v4 setSeparatorColor:v3];

  resolver = self->_resolver;

  [(CuratedCollectionResolver *)resolver resolveCollection];
}

- (void)_updateLibraryStatusForModels
{
  id v3 = [(CuratedCollectionProvider *)self dataSource];
  unsigned int v4 = [v3 snapshot];

  if ([v4 indexOfSectionIdentifier:@"CollectionItemSection"] != (id)0x7FFFFFFFFFFFFFFFLL)
  {
    dispatch_group_t v5 = dispatch_group_create();
    id v6 = [v4 itemIdentifiersInSectionWithIdentifier:@"CollectionItemSection"];
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_100BC37CC;
    v12[3] = &unk_10131A958;
    dispatch_group_t v13 = v5;
    id v7 = v5;
    [v6 enumerateObjectsUsingBlock:v12];
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_100BC38BC;
    v9[3] = &unk_1012E66E0;
    v9[4] = self;
    id v10 = v4;
    id v11 = v6;
    id v8 = v6;
    dispatch_group_notify(v7, (dispatch_queue_t)&_dispatch_main_q, v9);
  }
}

- (void)collectionManager:(id)a3 contentDidChange:(id)a4
{
  id v5 = a3;
  if (+[LibraryUIUtilities isMyPlacesEnabled])
  {
    [(CuratedCollectionProvider *)self _updateLibraryStatusForModels];
  }
  else
  {
    id v6 = [(CuratedCollectionProvider *)self dataSource];
    id v7 = [v6 snapshot];

    if ([v7 indexOfSectionIdentifier:@"CollectionItemSection"] == (id)0x7FFFFFFFFFFFFFFFLL)
    {
      id v8 = sub_100BC22B0();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        id v9 = [(CuratedCollectionProvider *)self curatedCollection];
        id v10 = [(CuratedCollectionProvider *)self curatedCollection];
        id v11 = sub_100097E28((int)[v10 isSuppressed]);
        id v12 = [(CuratedCollectionProvider *)self curatedCollection];
        dispatch_group_t v13 = sub_100097E28((int)[v12 isBlocked]);
        id v14 = [v7 sectionIdentifiers];
        id v15 = [v7 itemIdentifiers];
        *(_DWORD *)buf = 138413314;
        id v19 = v9;
        __int16 v20 = 2112;
        id v21 = v11;
        __int16 v22 = 2112;
        v23 = v13;
        __int16 v24 = 2112;
        uint64_t v25 = v14;
        __int16 v26 = 2112;
        id v27 = v15;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "Failed to find collection items section during contentDidChange.                         Collection: %@. isSuppressed/isBlocked: %@/%@. Sections: %@. Identifiers: %@", buf, 0x34u);
      }
    }
    else
    {
      id v8 = [v7 itemIdentifiersInSectionWithIdentifier:@"CollectionItemSection"];
      v16[0] = _NSConcreteStackBlock;
      v16[1] = 3221225472;
      v16[2] = sub_100BC3B34;
      v16[3] = &unk_10131A958;
      id v17 = v5;
      [v8 enumerateObjectsUsingBlock:v16];
      [(CuratedCollectionProvider *)self _reconfigureSnapshot:v7 updatedModels:v8];
    }
  }
}

- (void)_reconfigureSnapshot:(id)a3 updatedModels:(id)a4
{
  id v6 = a3;
  [v6 reconfigureItemsWithIdentifiers:a4];
  self->_isApplyingSnapshot = 1;
  dataSource = self->_dataSource;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100BC3CB4;
  v8[3] = &unk_1012E5D08;
  v8[4] = self;
  [(UITableViewDiffableDataSource *)dataSource applySnapshotUsingReloadData:v6 completion:v8];
}

- (void)mediaIntegrationCellDidDisplayChildLinks:(id)a3
{
  id v9 = a3;
  unsigned int v4 = [(DataSource *)self tableView];
  id v5 = [v4 indexPathForCell:v9];

  if (v5)
  {
    id v6 = [(CuratedCollectionProvider *)self analyticsController];
    id v7 = [v9 viewModel];
    [v6 logTapMediaIntegrationWithType:[v7 mediaType] verticalIndex:[v5 row]];

    id v8 = [(CuratedCollectionProvider *)self analyticsController];
    [v8 logShowMediaAppMenu];
  }
}

- (void)mediaIntegrationCell:(id)a3 didSelectChildLink:(id)a4
{
  id v7 = a4;
  id v5 = [(CuratedCollectionProvider *)self analyticsController];
  id v6 = [v7 targetAppIdentifier];
  [v5 logTapMediaAppWithIdentifier:v6];

  [(CuratedCollectionProvider *)self _punchoutToViewModel:v7];
}

- (void)_punchoutToViewModel:(id)a3
{
  id v4 = a3;
  id v5 = [(CuratedCollectionProvider *)self analyticsController];
  id v6 = [v4 targetAppIdentifier];
  [v5 logPunchOutUsingAppWithIdentifier:v6];

  id v7 = [(CuratedCollectionProvider *)self analyticsController];
  id v8 = [v4 url];
  [v7 logPunchOutToURL:v8];

  id v9 = [v4 url];

  [(CuratedCollectionProvider *)self _openURL:v9];
}

- (void)storeDidChangeWithTypes:(id)a3
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100BC3F7C;
  block[3] = &unk_1012E5D08;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (id)keyCommands
{
  return self->_keyCommands;
}

- (NSArray)storeSubscriptionTypes
{
  return self->_storeSubscriptionTypes;
}

- (void)setStoreSubscriptionTypes:(id)a3
{
}

- (GEOPlaceCollection)curatedCollection
{
  return self->_curatedCollection;
}

- (void)setCuratedCollection:(id)a3
{
}

- (NSArray)collectionItems
{
  return self->_collectionItems;
}

- (void)setCollectionItems:(id)a3
{
}

- (CuratedCollectionViewAnalyticsController)analyticsController
{
  return self->_analyticsController;
}

- (void)setAnalyticsController:(id)a3
{
}

- (BOOL)isApplyingSnapshot
{
  return self->_isApplyingSnapshot;
}

- (double)subheaderTransitionFraction
{
  return self->_subheaderTransitionFraction;
}

- (CuratedCollectionActionCellModel)actionModel
{
  return self->_actionModel;
}

- (void)setActionModel:(id)a3
{
}

- (CuratedCollectionDescriptionCellModel)descriptionModel
{
  return self->_descriptionModel;
}

- (void)setDescriptionModel:(id)a3
{
}

- (CuratedCollectionMediaIntegrationViewModel)mediaIntegrationModel
{
  return self->_mediaIntegrationModel;
}

- (void)setMediaIntegrationModel:(id)a3
{
}

- (CuratedCollectionResolverInfo)resolverInfo
{
  return self->_resolverInfo;
}

- (void)setResolverInfo:(id)a3
{
}

- (NSArray)models
{
  return self->_models;
}

- (void)setModels:(id)a3
{
}

- (TwoLinesContentViewModel)publisherModel
{
  return self->_publisherModel;
}

- (void)setPublisherModel:(id)a3
{
}

- (NSArray)footerActionItems
{
  return self->_footerActionItems;
}

- (void)setFooterActionItems:(id)a3
{
}

- (CuratedCollectionResolver)resolver
{
  return self->_resolver;
}

- (void)setResolver:(id)a3
{
}

- (CuratedCollectionRichTextParser)parser
{
  return self->_parser;
}

- (void)setParser:(id)a3
{
}

- (UITableViewDiffableDataSource)dataSource
{
  return self->_dataSource;
}

- (void)setDataSource:(id)a3
{
}

- (_TtC8MapsSync13MapsSyncStore)mapsSyncStore
{
  return self->_mapsSyncStore;
}

- (void)setMapsSyncStore:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mapsSyncStore, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_parser, 0);
  objc_storeStrong((id *)&self->_resolver, 0);
  objc_storeStrong((id *)&self->_footerActionItems, 0);
  objc_storeStrong((id *)&self->_publisherModel, 0);
  objc_storeStrong((id *)&self->_models, 0);
  objc_storeStrong((id *)&self->_resolverInfo, 0);
  objc_storeStrong((id *)&self->_mediaIntegrationModel, 0);
  objc_storeStrong((id *)&self->_descriptionModel, 0);
  objc_storeStrong((id *)&self->_actionModel, 0);
  objc_storeStrong((id *)&self->_analyticsController, 0);
  objc_storeStrong((id *)&self->_collectionItems, 0);
  objc_storeStrong((id *)&self->_curatedCollection, 0);
  objc_storeStrong((id *)&self->_storeSubscriptionTypes, 0);

  objc_storeStrong((id *)&self->_keyCommands, 0);
}

@end