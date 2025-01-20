@interface RideBookingOutlineController
+ (id)cellClasses;
+ (id)headerFooterViewClasses;
- (NSArray)rideOptionsStatuses;
- (NSMutableDictionary)applicationSectionIsExpanded;
- (NSMutableDictionary)rideOptionsSourcesDictionary;
- (RideBookingAppStoreApplicationsOutlineSection)appStoreApplicationsSource;
- (RideBookingDisabledApplicationsOutlineSection)disabledApplicationsSource;
- (RideBookingEnabledApplicationsOutlineSection)enabledApplicationsSource;
- (RideBookingOutlineController)initWithCollectionView:(id)a3;
- (RideBookingRoutePlanningTableViewDataSourceDelegate)delegate;
- (void)_configureRideOptionsSources:(id)a3;
- (void)applicationsDidInstall:(id)a3;
- (void)applicationsDidUninstall:(id)a3;
- (void)configureWithRideBookingRideOptionState:(id)a3;
- (void)dealloc;
- (void)didExpandSection:(id)a3;
- (void)prepareOutlineSections;
- (void)setAppStoreApplicationsSource:(id)a3;
- (void)setApplicationSectionIsExpanded:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDisabledApplicationsSource:(id)a3;
- (void)setEnabledApplicationsSource:(id)a3;
- (void)setRideOptionsSourcesDictionary:(id)a3;
- (void)setRideOptionsStatuses:(id)a3;
- (void)tableViewDismissed;
@end

@implementation RideBookingOutlineController

- (RideBookingOutlineController)initWithCollectionView:(id)a3
{
  id v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)RideBookingOutlineController;
  v5 = [(RoutePlanningOutlineController *)&v25 initWithCollectionView:v4];
  if (v5)
  {
    v6 = sub_100D522D0();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134349056;
      v28 = v5;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "[%{public}p] Initializing", buf, 0xCu);
    }

    v7 = [(id)objc_opt_class() cellClasses];
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472;
    v23[2] = sub_100D52324;
    v23[3] = &unk_1012FFFA8;
    id v8 = v4;
    id v24 = v8;
    [v7 enumerateKeysAndObjectsUsingBlock:v23];

    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    v9 = [objc_opt_class() headerFooterViewClasses];
    id v10 = [v9 countByEnumeratingWithState:&v19 objects:v26 count:16];
    if (v10)
    {
      id v11 = v10;
      uint64_t v12 = *(void *)v20;
      do
      {
        for (i = 0; i != v11; i = (char *)i + 1)
        {
          if (*(void *)v20 != v12) {
            objc_enumerationMutation(v9);
          }
          v14 = *(objc_class **)(*((void *)&v19 + 1) + 8 * i);
          v15 = NSStringFromClass(v14);
          [v8 registerClass:v14 forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:v15];
        }
        id v11 = [v9 countByEnumeratingWithState:&v19 objects:v26 count:16];
      }
      while (v11);
    }

    v16 = +[LSApplicationWorkspace defaultWorkspace];
    [v16 addObserver:v5];

    id v17 = objc_alloc_init((Class)NSMutableDictionary);
    [(RideBookingOutlineController *)v5 setApplicationSectionIsExpanded:v17];
  }
  return v5;
}

- (void)dealloc
{
  v3 = sub_100D522D0();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134349056;
    v7 = self;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "[%{public}p] Deallocating", buf, 0xCu);
  }

  id v4 = +[LSApplicationWorkspace defaultWorkspace];
  [v4 removeObserver:self];

  v5.receiver = self;
  v5.super_class = (Class)RideBookingOutlineController;
  [(RoutePlanningOutlineController *)&v5 dealloc];
}

- (void)prepareOutlineSections
{
  v2 = self;
  v3 = [(RoutePlanningOutlineController *)self collectionView];

  if (v3)
  {
    if (!v2->_enabledApplicationsSource)
    {
      id v4 = [RideBookingEnabledApplicationsOutlineSection alloc];
      objc_super v5 = [(RoutePlanningOutlineController *)v2 collectionView];
      v6 = [(RideBookingEnabledApplicationsOutlineSection *)v4 initWithCollectionView:v5 sectionIdentifier:@"EnabledApplications"];
      enabledApplicationsSource = v2->_enabledApplicationsSource;
      v2->_enabledApplicationsSource = v6;

      [(RideBookingEnabledApplicationsOutlineSection *)v2->_enabledApplicationsSource setParentDataSource:v2];
      id v8 = [RideBookingDisabledApplicationsOutlineSection alloc];
      v9 = [(RoutePlanningOutlineController *)v2 collectionView];
      id v10 = [(RoutePlanningOutlineSection *)v8 initWithCollectionView:v9 sectionIdentifier:@"DisabledApps"];
      disabledApplicationsSource = v2->_disabledApplicationsSource;
      v2->_disabledApplicationsSource = v10;

      [(RideBookingDisabledApplicationsOutlineSection *)v2->_disabledApplicationsSource setParentDataSource:v2];
      uint64_t v12 = [RideBookingAppStoreApplicationsOutlineSection alloc];
      v13 = [(RoutePlanningOutlineController *)v2 collectionView];
      v14 = [(RoutePlanningOutlineSection *)v12 initWithCollectionView:v13 sectionIdentifier:@"AppStoreApps"];
      appStoreApplicationsSource = v2->_appStoreApplicationsSource;
      v2->_appStoreApplicationsSource = v14;

      [(RideBookingAppStoreApplicationsOutlineSection *)v2->_appStoreApplicationsSource setParentDataSource:v2];
    }
    id v38 = objc_alloc_init((Class)NSMutableArray);
    [v38 addObject:v2->_enabledApplicationsSource];
    if ([(NSMutableDictionary *)v2->_rideOptionsSourcesDictionary count])
    {
      long long v47 = 0u;
      long long v48 = 0u;
      long long v45 = 0u;
      long long v46 = 0u;
      obj = v2->_rideOptionsSourcesDictionary;
      id v39 = [(NSMutableDictionary *)obj countByEnumeratingWithState:&v45 objects:v51 count:16];
      if (v39)
      {
        uint64_t v37 = *(void *)v46;
        do
        {
          for (i = 0; i != v39; i = (char *)i + 1)
          {
            if (*(void *)v46 != v37) {
              objc_enumerationMutation(obj);
            }
            uint64_t v17 = *(void *)(*((void *)&v45 + 1) + 8 * i);
            v18 = [(NSMutableDictionary *)v2->_rideOptionsSourcesDictionary objectForKey:v17];
            long long v19 = v2;
            long long v20 = [(RideBookingOutlineController *)v2 applicationSectionIsExpanded];
            long long v21 = [v20 objectForKeyedSubscript:v17];
            id v22 = [v21 BOOLValue];

            long long v43 = 0u;
            long long v44 = 0u;
            long long v41 = 0u;
            long long v42 = 0u;
            id v23 = v18;
            id v24 = [v23 countByEnumeratingWithState:&v41 objects:v50 count:16];
            if (v24)
            {
              id v25 = v24;
              uint64_t v26 = 0;
              uint64_t v27 = *(void *)v42;
              do
              {
                for (j = 0; j != v25; j = (char *)j + 1)
                {
                  if (*(void *)v42 != v27) {
                    objc_enumerationMutation(v23);
                  }
                  v29 = *(void **)(*((void *)&v41 + 1) + 8 * (void)j);
                  [v29 setApplicationSectionIsExpanded:v22];
                  [v29 setAdjustedSectionOffset:(char *)j + v26];
                }
                id v25 = [v23 countByEnumeratingWithState:&v41 objects:v50 count:16];
                v26 += (uint64_t)j;
              }
              while (v25);
            }

            if (v22)
            {
              [v38 addObjectsFromArray:v23];
              v2 = v19;
            }
            else
            {
              if ((unint64_t)[v23 count] <= 3) {
                uint64_t v30 = (uint64_t)[v23 count];
              }
              else {
                uint64_t v30 = 3;
              }
              v2 = v19;
              v31 = [v23 subarrayWithRange:0, v30];
              id v32 = [v31 mutableCopy];
              [v38 addObjectsFromArray:v32];
            }
          }
          id v39 = [(NSMutableDictionary *)obj countByEnumeratingWithState:&v45 objects:v51 count:16];
        }
        while (v39);
      }
    }
    [v38 addObject:v2->_disabledApplicationsSource];
    [v38 addObject:v2->_appStoreApplicationsSource];
    v33 = (NSArray *)[v38 copy];
    outlineSections = v2->super._outlineSections;
    v2->super._outlineSections = v33;

    v40.receiver = v2;
    v40.super_class = (Class)RideBookingOutlineController;
    [(RoutePlanningOutlineController *)&v40 prepareOutlineSections];
  }
  else
  {
    v35 = v2->super._outlineSections;
    v2->super._outlineSections = (NSArray *)&__NSArray0__struct;

    v49.receiver = v2;
    v49.super_class = (Class)RideBookingOutlineController;
    [(RoutePlanningOutlineController *)&v49 prepareOutlineSections];
  }
}

- (void)configureWithRideBookingRideOptionState:(id)a3
{
  id v4 = a3;
  [(RideBookingOutlineController *)self _configureRideOptionsSources:v4];
  objc_super v5 = [(RideBookingOutlineController *)self enabledApplicationsSource];
  [v5 configureWithRideBookingRideOptionState:v4];

  v6 = [(RideBookingOutlineController *)self disabledApplicationsSource];
  [v6 configureWithRideBookingRideOptionState:v4];

  v7 = [(RideBookingOutlineController *)self appStoreApplicationsSource];
  [v7 configureWithRideBookingRideOptionState:v4];

  [(RideBookingOutlineController *)self prepareOutlineSections];
  id v8 = [(RideBookingOutlineController *)self delegate];
  [v8 dataSourceRequiresReload:self];
}

- (void)_configureRideOptionsSources:(id)a3
{
  id v45 = a3;
  id v46 = objc_alloc_init((Class)NSMutableArray);
  long long v58 = 0u;
  long long v59 = 0u;
  long long v60 = 0u;
  long long v61 = 0u;
  id v4 = [v45 rideOptionStatusMap];
  objc_super v5 = [v4 allValues];

  id v6 = [v5 countByEnumeratingWithState:&v58 objects:v63 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v59;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v59 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v58 + 1) + 8 * i);
        id v11 = [v10 application];
        if ([v11 enabled])
        {
          uint64_t v12 = [v10 rideOptions];
          id v13 = [v12 count];

          if (v13) {
            [v46 addObject:v10];
          }
        }
        else
        {
        }
      }
      id v7 = [v5 countByEnumeratingWithState:&v58 objects:v63 count:16];
    }
    while (v7);
  }

  v14 = [v45 installedSuggestions];
  v15 = +[RidesharingAppPreferenceManager sortedRideOptionStatuses:v46 withStoreOrdering:v14];
  [(RideBookingOutlineController *)self setRideOptionsStatuses:v15];

  v16 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
  rideOptionsSourcesDictionary = self->_rideOptionsSourcesDictionary;
  self->_rideOptionsSourcesDictionary = v16;

  long long v56 = 0u;
  long long v57 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  id obj = [(RideBookingOutlineController *)self rideOptionsStatuses];
  id v49 = [obj countByEnumeratingWithState:&v54 objects:v62 count:16];
  if (v49)
  {
    uint64_t v48 = *(void *)v55;
    p_info = &OBJC_METACLASS___ParkedCarHeaderButtonsSectionController.info;
    long long v19 = NSCollectionLayoutEdgeSpacing_ptr;
    CFStringRef v20 = @"%@";
    do
    {
      uint64_t v21 = 0;
      do
      {
        if (*(void *)v55 != v48) {
          objc_enumerationMutation(obj);
        }
        uint64_t v52 = v21;
        id v22 = *(void **)(*((void *)&v54 + 1) + 8 * v21);
        id v23 = [v22 application];
        uint64_t v24 = [v23 identifier];

        id v25 = [(RideBookingOutlineController *)self applicationSectionIsExpanded];
        uint64_t v26 = [v25 objectForKey:v24];

        v50 = (void *)v26;
        if (!v26)
        {
          uint64_t v27 = [(RideBookingOutlineController *)self applicationSectionIsExpanded];
          [v27 setObject:&__kCFBooleanFalse forKeyedSubscript:v24];
        }
        v51 = (void *)v24;
        id v28 = objc_alloc_init((Class)NSMutableArray);
        v29 = [v22 rideOptions];
        id v30 = [v29 count];

        if (v30)
        {
          unint64_t v31 = 0;
          v53 = v28;
          do
          {
            id v32 = [v22 rideOptions];
            v33 = [v32 objectAtIndex:v31];

            id v34 = objc_alloc((Class)(p_info + 471));
            [(RoutePlanningOutlineController *)self collectionView];
            v36 = v35 = p_info;
            [v19[75] stringWithFormat:v20, v33];
            uint64_t v37 = self;
            CFStringRef v38 = v20;
            v40 = id v39 = v19;
            id v41 = [v34 initWithCollectionView:v36 sectionIdentifier:v40];

            long long v19 = v39;
            CFStringRef v20 = v38;
            self = v37;

            [v41 setParentDataSource:v37];
            [v41 setDelegate:v37];
            long long v42 = [v22 rideOptions];
            [v41 setRideBookingRideOptions:v42];

            p_info = v35;
            id v28 = v53;
            [v41 setRideBookingRideOptionIndex:v31];
            [v41 setRideBookingRideOptionStatus:v22];
            [v53 addObject:v41];

            ++v31;
            long long v43 = [v22 rideOptions];
            id v44 = [v43 count];
          }
          while (v31 < (unint64_t)v44);
        }
        [(NSMutableDictionary *)self->_rideOptionsSourcesDictionary setObject:v28 forKey:v51];

        uint64_t v21 = v52 + 1;
      }
      while ((id)(v52 + 1) != v49);
      id v49 = [obj countByEnumeratingWithState:&v54 objects:v62 count:16];
    }
    while (v49);
  }
}

- (void)tableViewDismissed
{
  v3 = sub_100D522D0();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    int v5 = 134349056;
    id v6 = self;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "[%{public}p] Table view dismissed", (uint8_t *)&v5, 0xCu);
  }

  id v4 = objc_alloc_init((Class)NSMutableDictionary);
  [(RideBookingOutlineController *)self setApplicationSectionIsExpanded:v4];
}

+ (id)cellClasses
{
  v2 = (objc_class *)objc_opt_class();
  v3 = NSStringFromClass(v2);
  v10[0] = v3;
  v11[0] = objc_opt_class();
  id v4 = (objc_class *)objc_opt_class();
  int v5 = NSStringFromClass(v4);
  v10[1] = v5;
  v11[1] = objc_opt_class();
  v10[2] = @"RideBooking";
  v11[2] = objc_opt_class();
  v10[3] = @"RideBookingAX";
  v11[3] = objc_opt_class();
  id v6 = (objc_class *)objc_opt_class();
  id v7 = NSStringFromClass(v6);
  v10[4] = v7;
  v11[4] = objc_opt_class();
  uint64_t v8 = +[NSDictionary dictionaryWithObjects:v11 forKeys:v10 count:5];

  return v8;
}

+ (id)headerFooterViewClasses
{
  uint64_t v4 = objc_opt_class();
  v2 = +[NSArray arrayWithObjects:&v4 count:1];

  return v2;
}

- (void)applicationsDidInstall:(id)a3
{
  uint64_t v4 = sub_100D522D0();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134349056;
    uint64_t v8 = self;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "[%{public}p] Applications did install; reloading",
      buf,
      0xCu);
  }

  objc_initWeak((id *)buf, self);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100D531A0;
  block[3] = &unk_1012E6708;
  objc_copyWeak(&v6, (id *)buf);
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  objc_destroyWeak(&v6);
  objc_destroyWeak((id *)buf);
}

- (void)applicationsDidUninstall:(id)a3
{
  uint64_t v4 = sub_100D522D0();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134349056;
    uint64_t v8 = self;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "[%{public}p] Applications did uninstall; reloading",
      buf,
      0xCu);
  }

  objc_initWeak((id *)buf, self);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100D53324;
  block[3] = &unk_1012E6708;
  objc_copyWeak(&v6, (id *)buf);
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  objc_destroyWeak(&v6);
  objc_destroyWeak((id *)buf);
}

- (void)didExpandSection:(id)a3
{
  id v4 = a3;
  int v5 = [(RideBookingOutlineController *)self applicationSectionIsExpanded];
  [v5 setObject:&__kCFBooleanTrue forKeyedSubscript:v4];

  [(RideBookingOutlineController *)self prepareOutlineSections];
}

- (RideBookingRoutePlanningTableViewDataSourceDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (RideBookingRoutePlanningTableViewDataSourceDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (RideBookingEnabledApplicationsOutlineSection)enabledApplicationsSource
{
  return self->_enabledApplicationsSource;
}

- (void)setEnabledApplicationsSource:(id)a3
{
}

- (NSArray)rideOptionsStatuses
{
  return self->_rideOptionsStatuses;
}

- (void)setRideOptionsStatuses:(id)a3
{
}

- (NSMutableDictionary)rideOptionsSourcesDictionary
{
  return self->_rideOptionsSourcesDictionary;
}

- (void)setRideOptionsSourcesDictionary:(id)a3
{
}

- (NSMutableDictionary)applicationSectionIsExpanded
{
  return self->_applicationSectionIsExpanded;
}

- (void)setApplicationSectionIsExpanded:(id)a3
{
}

- (RideBookingDisabledApplicationsOutlineSection)disabledApplicationsSource
{
  return self->_disabledApplicationsSource;
}

- (void)setDisabledApplicationsSource:(id)a3
{
}

- (RideBookingAppStoreApplicationsOutlineSection)appStoreApplicationsSource
{
  return self->_appStoreApplicationsSource;
}

- (void)setAppStoreApplicationsSource:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appStoreApplicationsSource, 0);
  objc_storeStrong((id *)&self->_disabledApplicationsSource, 0);
  objc_storeStrong((id *)&self->_applicationSectionIsExpanded, 0);
  objc_storeStrong((id *)&self->_rideOptionsSourcesDictionary, 0);
  objc_storeStrong((id *)&self->_rideOptionsStatuses, 0);
  objc_storeStrong((id *)&self->_enabledApplicationsSource, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end