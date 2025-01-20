@interface RideBookingDisabledApplicationsOutlineSection
- (BOOL)shouldShowEnableAppsCell;
- (NSArray)disabledApplicationsStatuses;
- (RideBookingOutlineController)parentDataSource;
- (id)cellForItemAtIndexPath:(id)a3;
- (int64_t)numberOfItemsInSection:(int64_t)a3;
- (int64_t)numberOfSections;
- (void)configureWithRideBookingRideOptionState:(id)a3;
- (void)ridesharingAppLargeIconTableViewCell:(id)a3 didSelectActionButton:(id)a4;
- (void)ridesharingEnableAllAppsTableViewCellDidPerformEnableCommand:(id)a3;
- (void)setDisabledApplicationsStatuses:(id)a3;
- (void)setParentDataSource:(id)a3;
- (void)setShouldShowEnableAppsCell:(BOOL)a3;
@end

@implementation RideBookingDisabledApplicationsOutlineSection

- (id)cellForItemAtIndexPath:(id)a3
{
  id v4 = a3;
  v5 = (char *)[v4 row];
  if (![(RideBookingDisabledApplicationsOutlineSection *)self shouldShowEnableAppsCell]) {
    goto LABEL_4;
  }
  if (v5)
  {
    --v5;
LABEL_4:
    v6 = [(RideBookingDisabledApplicationsOutlineSection *)self disabledApplicationsStatuses];
    v7 = [v6 objectAtIndex:v5];

    collectionView = self->super._collectionView;
    v9 = (objc_class *)objc_opt_class();
    v10 = NSStringFromClass(v9);
    v11 = [(UICollectionView *)collectionView dequeueReusableCellWithReuseIdentifier:v10 forIndexPath:v4];

    [v11 setDelegate:self];
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_10078FFB4;
    v20[3] = &unk_1012E66E0;
    id v12 = v11;
    id v21 = v12;
    id v22 = v7;
    v23 = self;
    id v13 = v7;
    +[UIView performWithoutAnimation:v20];
    id v14 = v12;

    goto LABEL_6;
  }
  v15 = self->super._collectionView;
  v16 = (objc_class *)objc_opt_class();
  v17 = NSStringFromClass(v16);
  v18 = [(UICollectionView *)v15 dequeueReusableCellWithReuseIdentifier:v17 forIndexPath:v4];

  [v18 setDelegate:self];
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_10078FFA8;
  v24[3] = &unk_1012E5D08;
  id v14 = v18;
  id v25 = v14;
  +[UIView performWithoutAnimation:v24];
  id v13 = v25;
LABEL_6:

  return v14;
}

- (int64_t)numberOfItemsInSection:(int64_t)a3
{
  id v4 = [(RideBookingDisabledApplicationsOutlineSection *)self disabledApplicationsStatuses];
  id v5 = [v4 count];
  int64_t v6 = (int64_t)v5
     + [(RideBookingDisabledApplicationsOutlineSection *)self shouldShowEnableAppsCell];

  return v6;
}

- (int64_t)numberOfSections
{
  v2 = [(RideBookingDisabledApplicationsOutlineSection *)self disabledApplicationsStatuses];
  int64_t v3 = [v2 count] != 0;

  return v3;
}

- (void)configureWithRideBookingRideOptionState:(id)a3
{
  id v3 = a3;
  id v4 = objc_opt_new();
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v5 = [v3 rideOptionStatusMap];
  int64_t v6 = [v5 allValues];

  id v7 = [v6 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v7)
  {
    id v8 = v7;
    char v9 = 0;
    uint64_t v10 = *(void *)v23;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v23 != v10) {
          objc_enumerationMutation(v6);
        }
        id v12 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        id v13 = [v12 application];
        unsigned __int8 v14 = [v13 enabled];

        if (v14) {
          char v9 = 1;
        }
        else {
          [v4 addObject:v12];
        }
      }
      id v8 = [v6 countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v8);
  }
  else
  {
    char v9 = 0;
  }

  v15 = [v3 installedSuggestions];
  v16 = +[RidesharingAppPreferenceManager sortedRideOptionStatuses:v4 withStoreOrdering:v15];
  [(RideBookingDisabledApplicationsOutlineSection *)self setDisabledApplicationsStatuses:v16];

  int BOOL = GEOConfigGetBOOL();
  if (v9)
  {
    [(RideBookingDisabledApplicationsOutlineSection *)self setShouldShowEnableAppsCell:0];
  }
  else
  {
    int v18 = BOOL;
    v19 = [(RideBookingDisabledApplicationsOutlineSection *)self disabledApplicationsStatuses];
    if ([v19 count]) {
      uint64_t v20 = v18 ^ 1u;
    }
    else {
      uint64_t v20 = 0;
    }
    [(RideBookingDisabledApplicationsOutlineSection *)self setShouldShowEnableAppsCell:v20];
  }
}

- (void)ridesharingAppLargeIconTableViewCell:(id)a3 didSelectActionButton:(id)a4
{
  id v5 = [a3 applicationIdentifer];
  if (v5)
  {
    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    int64_t v6 = [(RideBookingDisabledApplicationsOutlineSection *)self disabledApplicationsStatuses];
    id v7 = [v6 countByEnumeratingWithState:&v19 objects:v24 count:16];
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v20;
      while (2)
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(void *)v20 != v9) {
            objc_enumerationMutation(v6);
          }
          v11 = *(void **)(*((void *)&v19 + 1) + 8 * i);
          id v12 = [v11 application];
          id v13 = [v12 identifier];
          unsigned int v14 = [v13 isEqualToString:v5];

          if (v14)
          {
            v15 = +[MKMapService sharedService];
            [v15 captureUserAction:14002 onTarget:304 eventValue:0];

            v16 = +[RideBookingAccessProxy coordinator];
            v17 = [v11 application];
            long long v23 = v17;
            int v18 = +[NSArray arrayWithObjects:&v23 count:1];
            [v16 enableRideBookingApplications:v18];

            goto LABEL_12;
          }
        }
        id v8 = [v6 countByEnumeratingWithState:&v19 objects:v24 count:16];
        if (v8) {
          continue;
        }
        break;
      }
    }
LABEL_12:
  }
}

- (void)ridesharingEnableAllAppsTableViewCellDidPerformEnableCommand:(id)a3
{
  GEOConfigSetBOOL();
  id v4 = +[MKMapService sharedService];
  [v4 captureUserAction:14007 onTarget:1401 eventValue:0];

  id v5 = objc_opt_new();
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  int64_t v6 = [(RideBookingDisabledApplicationsOutlineSection *)self disabledApplicationsStatuses];
  id v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v16;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        id v12 = [v11 application];

        if (v12)
        {
          id v13 = [v11 application];
          [v5 addObject:v13];
        }
      }
      id v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v8);
  }

  unsigned int v14 = +[RideBookingAccessProxy coordinator];
  [v14 enableRideBookingApplications:v5];
}

- (RideBookingOutlineController)parentDataSource
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_parentDataSource);

  return (RideBookingOutlineController *)WeakRetained;
}

- (void)setParentDataSource:(id)a3
{
}

- (NSArray)disabledApplicationsStatuses
{
  return self->_disabledApplicationsStatuses;
}

- (void)setDisabledApplicationsStatuses:(id)a3
{
}

- (BOOL)shouldShowEnableAppsCell
{
  return self->_shouldShowEnableAppsCell;
}

- (void)setShouldShowEnableAppsCell:(BOOL)a3
{
  self->_shouldShowEnableAppsCell = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_disabledApplicationsStatuses, 0);

  objc_destroyWeak((id *)&self->_parentDataSource);
}

@end