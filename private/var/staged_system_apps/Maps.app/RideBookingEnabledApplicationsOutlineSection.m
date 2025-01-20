@interface RideBookingEnabledApplicationsOutlineSection
- (NSArray)enabledApplicationsStatuses;
- (RideBookingEnabledApplicationsOutlineSection)initWithCollectionView:(id)a3 sectionIdentifier:(id)a4;
- (RideBookingOutlineController)parentDataSource;
- (id)cellForItemAtIndexPath:(id)a3;
- (int64_t)numberOfItemsInSection:(int64_t)a3;
- (int64_t)numberOfSections;
- (void)configureWithRideBookingRideOptionState:(id)a3;
- (void)ridesharingAppActionCollectionViewCellDidPerformAction:(id)a3;
- (void)ridesharingAppLargeIconTableViewCell:(id)a3 didSelectActionButton:(id)a4;
- (void)setEnabledApplicationsStatuses:(id)a3;
- (void)setParentDataSource:(id)a3;
@end

@implementation RideBookingEnabledApplicationsOutlineSection

- (RideBookingEnabledApplicationsOutlineSection)initWithCollectionView:(id)a3 sectionIdentifier:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)RideBookingEnabledApplicationsOutlineSection;
  return [(RoutePlanningOutlineSection *)&v5 initWithCollectionView:a3 sectionIdentifier:a4];
}

- (id)cellForItemAtIndexPath:(id)a3
{
  id v4 = a3;
  objc_super v5 = [(RideBookingEnabledApplicationsOutlineSection *)self enabledApplicationsStatuses];
  v6 = [v5 objectAtIndex:[v4 section]];

  if ([v6 loadingRideOptions])
  {
    collectionView = self->super._collectionView;
    v8 = (objc_class *)objc_opt_class();
    v9 = NSStringFromClass(v8);
    v10 = [(UICollectionView *)collectionView dequeueReusableCellWithReuseIdentifier:v9 forIndexPath:v4];

    v38[0] = _NSConcreteStackBlock;
    v38[1] = 3221225472;
    v38[2] = sub_10056DCAC;
    v38[3] = &unk_1012E5D58;
    id v11 = v10;
    id v39 = v11;
    id v40 = v6;
    +[UIView performWithoutAnimation:v38];
    v12 = v40;
    id v13 = v11;

    v14 = v39;
LABEL_11:

    goto LABEL_12;
  }
  if ([v6 rideOptionStatusError] && !objc_msgSend(v4, "row"))
  {
    v24 = self->super._collectionView;
    v25 = (objc_class *)objc_opt_class();
    v26 = NSStringFromClass(v25);
    v27 = [(UICollectionView *)v24 dequeueReusableCellWithReuseIdentifier:v26 forIndexPath:v4];

    [v27 setDelegate:self];
    v35[0] = _NSConcreteStackBlock;
    v35[1] = 3221225472;
    v35[2] = sub_10056DD00;
    v35[3] = &unk_1012E5D58;
    id v28 = v27;
    id v36 = v28;
    id v37 = v6;
    +[UIView performWithoutAnimation:v35];
    v29 = v37;
    id v13 = v28;

    v14 = v36;
    goto LABEL_11;
  }
  if ([v4 row] == (id)1)
  {
    v15 = self->super._collectionView;
    v16 = (objc_class *)objc_opt_class();
    v17 = NSStringFromClass(v16);
    v18 = [(UICollectionView *)v15 dequeueReusableCellWithReuseIdentifier:v17 forIndexPath:v4];

    [v18 setDelegate:self];
    v31[0] = _NSConcreteStackBlock;
    v31[1] = 3221225472;
    v31[2] = sub_10056DD0C;
    v31[3] = &unk_1012EA9E0;
    id v19 = v18;
    id v32 = v19;
    id v33 = v6;
    uint64_t v34 = 0;
    +[UIView performWithoutAnimation:v31];
    v20 = v33;
    id v13 = v19;

    v14 = v32;
    goto LABEL_11;
  }
  v21 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
  {
    v22 = basename("/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Ride Booking/TableViewDataSources/RideBookingEnabledApplicationsOutlineSection.m");
    id v23 = [objc_alloc((Class)NSString) initWithFormat:@"We shouldn't get here. Row: %lu, Section: %lu, Status: %@", v4.row, v4.section, v6];
    *(_DWORD *)buf = 136315394;
    v42 = v22;
    __int16 v43 = 2112;
    id v44 = v23;
    _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "{RBError}{%s}: %@", buf, 0x16u);
  }
  id v13 = [objc_alloc((Class)UICollectionViewCell) initWithFrame:CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height];
LABEL_12:

  return v13;
}

- (int64_t)numberOfItemsInSection:(int64_t)a3
{
  objc_super v5 = [(RideBookingEnabledApplicationsOutlineSection *)self enabledApplicationsStatuses];
  id v6 = [v5 count];

  if ((unint64_t)v6 <= a3) {
    return 0;
  }
  v7 = [(RideBookingEnabledApplicationsOutlineSection *)self enabledApplicationsStatuses];
  v8 = [v7 objectAtIndex:a3];

  if ([v8 loadingRideOptions]) {
    int64_t v9 = 1;
  }
  else {
    int64_t v9 = 2 * ([v8 rideOptionStatusError] != 0);
  }

  return v9;
}

- (int64_t)numberOfSections
{
  v2 = [(RideBookingEnabledApplicationsOutlineSection *)self enabledApplicationsStatuses];
  id v3 = [v2 count];

  return (int64_t)v3;
}

- (void)configureWithRideBookingRideOptionState:(id)a3
{
  id v3 = a3;
  id v4 = objc_opt_new();
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  objc_super v5 = [v3 rideOptionStatusMap];
  id v6 = [v5 allValues];

  id v7 = [v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v19;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v19 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        v12 = [v11 application];
        if ([v12 enabled])
        {
          id v13 = [v11 rideOptions];
          id v14 = [v13 count];

          if (!v14) {
            [v4 addObject:v11];
          }
        }
        else
        {
        }
      }
      id v8 = [v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v8);
  }

  v15 = [v3 installedSuggestions];
  v16 = +[RidesharingAppPreferenceManager sortedRideOptionStatuses:v4 withStoreOrdering:v15];
  [(RideBookingEnabledApplicationsOutlineSection *)self setEnabledApplicationsStatuses:v16];
}

- (void)ridesharingAppLargeIconTableViewCell:(id)a3 didSelectActionButton:(id)a4
{
  objc_super v5 = [a3 applicationIdentifer];
  if (v5)
  {
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v6 = [(RideBookingEnabledApplicationsOutlineSection *)self enabledApplicationsStatuses];
    id v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v17;
      while (2)
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(void *)v17 != v9) {
            objc_enumerationMutation(v6);
          }
          id v11 = [*(id *)(*((void *)&v16 + 1) + 8 * i) application];
          v12 = [v11 identifier];
          unsigned int v13 = [v12 isEqualToString:v5];

          if (v13)
          {
            id v14 = [(RideBookingEnabledApplicationsOutlineSection *)self parentDataSource];
            v15 = [v14 delegate];
            [v15 didSelectFeedbackWithAppIdentifier:v5];

            goto LABEL_12;
          }
        }
        id v8 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
        if (v8) {
          continue;
        }
        break;
      }
    }
LABEL_12:
  }
}

- (void)ridesharingAppActionCollectionViewCellDidPerformAction:(id)a3
{
  id v4 = a3;
  id v14 = [v4 status];
  id v5 = [v4 titleType];

  if ((unint64_t)v5 >= 2)
  {
    if (v5 != (id)2) {
      goto LABEL_6;
    }
    uint64_t v9 = +[MKMapService sharedService];
    v10 = [v14 application];
    id v11 = [v10 name];
    [v9 captureUserAction:14008 onTarget:1401 eventValue:v11];

    id v8 = [(RideBookingEnabledApplicationsOutlineSection *)self parentDataSource];
    v12 = [v8 delegate];
    unsigned int v13 = [(RideBookingEnabledApplicationsOutlineSection *)self parentDataSource];
    [v12 dataSourceRequiresReload:v13];
  }
  else
  {
    id v6 = [v14 application];
    id v7 = [v14 userActivity];
    +[RideBookingDataCoordinator openRideBookingApplication:v6 withUserActivity:v7];

    id v8 = +[MKMapService sharedService];
    [v8 captureUserAction:6020 onTarget:304 eventValue:0];
  }

LABEL_6:
}

- (RideBookingOutlineController)parentDataSource
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_parentDataSource);

  return (RideBookingOutlineController *)WeakRetained;
}

- (void)setParentDataSource:(id)a3
{
}

- (NSArray)enabledApplicationsStatuses
{
  return self->_enabledApplicationsStatuses;
}

- (void)setEnabledApplicationsStatuses:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_enabledApplicationsStatuses, 0);

  objc_destroyWeak((id *)&self->_parentDataSource);
}

@end