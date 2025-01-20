@interface RideBookingAppStoreApplicationsOutlineSection
- (BOOL)onlyAppStoreSuggestionsSection;
- (BOOL)shouldHideAppStoreSuggestionsSection;
- (BOOL)shouldShowEnableAppsCell;
- (NSArray)appStoreSuggestions;
- (RideBookingOutlineController)parentDataSource;
- (double)tableView:(id)a3 estimatedHeightForHeaderInSection:(int64_t)a4;
- (id)cellForItemAtIndexPath:(id)a3;
- (id)viewForHeaderInSection:(int64_t)a3;
- (int64_t)numberOfItemsInSection:(int64_t)a3;
- (int64_t)numberOfSections;
- (void)configureWithRideBookingRideOptionState:(id)a3;
- (void)didSelectItemAtIndexPath:(id)a3;
- (void)ridesharingAppLargeIconTableViewCell:(id)a3 didSelectActionButton:(id)a4;
- (void)ridesharingEnableAllAppsTableViewCellDidPerformEnableCommand:(id)a3;
- (void)setAppStoreSuggestions:(id)a3;
- (void)setOnlyAppStoreSuggestionsSection:(BOOL)a3;
- (void)setParentDataSource:(id)a3;
- (void)setShouldHideAppStoreSuggestionsSection:(BOOL)a3;
- (void)setShouldShowEnableAppsCell:(BOOL)a3;
@end

@implementation RideBookingAppStoreApplicationsOutlineSection

- (id)cellForItemAtIndexPath:(id)a3
{
  id v4 = a3;
  if ([(RideBookingAppStoreApplicationsOutlineSection *)self shouldShowEnableAppsCell]
    && ![v4 row])
  {
    collectionView = self->super._collectionView;
    v16 = (objc_class *)objc_opt_class();
    v17 = NSStringFromClass(v16);
    v18 = [(UICollectionView *)collectionView dequeueReusableCellWithReuseIdentifier:v17 forIndexPath:v4];

    [v18 setDelegate:self];
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472;
    v23[2] = sub_10045BB70;
    v23[3] = &unk_1012E5D08;
    id v14 = v18;
    id v24 = v14;
    +[UIView performWithoutAnimation:v23];
    id v12 = v24;
  }
  else
  {
    v5 = self->super._collectionView;
    v6 = (objc_class *)objc_opt_class();
    v7 = NSStringFromClass(v6);
    v8 = [(UICollectionView *)v5 dequeueReusableCellWithReuseIdentifier:v7 forIndexPath:v4];

    [v8 setDelegate:self];
    v9 = [(RideBookingAppStoreApplicationsOutlineSection *)self appStoreSuggestions];
    v10 = [v9 objectAtIndex:[v4 row]];

    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_10045BB7C;
    v20[3] = &unk_1012E5D58;
    id v11 = v8;
    id v21 = v11;
    v22 = v10;
    id v12 = v10;
    +[UIView performWithoutAnimation:v20];
    v13 = v22;
    id v14 = v11;
  }

  return v14;
}

- (int64_t)numberOfItemsInSection:(int64_t)a3
{
  if ([(RideBookingAppStoreApplicationsOutlineSection *)self shouldShowEnableAppsCell]) {
    return 1;
  }
  v5 = [(RideBookingAppStoreApplicationsOutlineSection *)self appStoreSuggestions];
  id v6 = [v5 count];

  return (int64_t)v6;
}

- (int64_t)numberOfSections
{
  v3 = [(RideBookingAppStoreApplicationsOutlineSection *)self appStoreSuggestions];
  if ([v3 count])
  {
    unsigned int v4 = [(RideBookingAppStoreApplicationsOutlineSection *)self shouldHideAppStoreSuggestionsSection];

    return v4 ^ 1;
  }
  else
  {

    return 0;
  }
}

- (void)didSelectItemAtIndexPath:(id)a3
{
  id v4 = a3;
  v5 = [(RideBookingAppStoreApplicationsOutlineSection *)self appStoreSuggestions];
  id v6 = [v4 row];

  id v11 = [v5 objectAtIndex:v6];

  v7 = [(RideBookingAppStoreApplicationsOutlineSection *)self parentDataSource];
  v8 = [v7 delegate];
  v9 = [v11 identifier];
  v10 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v9 integerValue]);
  [v8 didSelectAppStoreSuggestionWithIdentifier:v10];
}

- (id)viewForHeaderInSection:(int64_t)a3
{
  v5 = [(RideBookingAppStoreApplicationsOutlineSection *)self appStoreSuggestions];
  if (![v5 count]
    || [(RideBookingAppStoreApplicationsOutlineSection *)self shouldHideAppStoreSuggestionsSection])
  {
    id v6 = 0;
LABEL_4:

    goto LABEL_5;
  }
  unsigned __int8 v8 = [(RideBookingAppStoreApplicationsOutlineSection *)self onlyAppStoreSuggestionsSection];

  if ((v8 & 1) == 0)
  {
    collectionView = self->super._collectionView;
    v10 = (objc_class *)objc_opt_class();
    id v11 = NSStringFromClass(v10);
    id v12 = +[NSIndexPath indexPathForItem:0 inSection:a3];
    id v6 = [(UICollectionView *)collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:v11 forIndexPath:v12];

    v5 = +[NSBundle mainBundle];
    v13 = [v5 localizedStringForKey:@"App Store [Ridesharing]" value:@"localized string not found" table:0];
    +[RidesharingAppSelectionSectionHeaderViewComposer configureHeader:v6 withPrimaryText:v13];

    goto LABEL_4;
  }
  id v6 = 0;
LABEL_5:

  return v6;
}

- (double)tableView:(id)a3 estimatedHeightForHeaderInSection:(int64_t)a4
{
  v5 = [(RideBookingAppStoreApplicationsOutlineSection *)self appStoreSuggestions];
  if ([v5 count]
    && ![(RideBookingAppStoreApplicationsOutlineSection *)self shouldHideAppStoreSuggestionsSection])
  {
    unsigned __int8 v6 = [(RideBookingAppStoreApplicationsOutlineSection *)self onlyAppStoreSuggestionsSection];

    double result = 10.0;
    if ((v6 & 1) == 0) {
      return result;
    }
  }
  else
  {
  }
  return 0.0;
}

- (void)ridesharingEnableAllAppsTableViewCellDidPerformEnableCommand:(id)a3
{
  GEOConfigSetBOOL();
  [(RideBookingAppStoreApplicationsOutlineSection *)self setShouldShowEnableAppsCell:0];
  id v6 = [(RideBookingAppStoreApplicationsOutlineSection *)self parentDataSource];
  id v4 = [v6 delegate];
  v5 = [(RideBookingAppStoreApplicationsOutlineSection *)self parentDataSource];
  [v4 dataSourceRequiresReload:v5];
}

- (void)ridesharingAppLargeIconTableViewCell:(id)a3 didSelectActionButton:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  unsigned __int8 v8 = +[MKMapService sharedService];
  [v8 captureUserAction:14001 onTarget:304 eventValue:0];

  v9 = [v6 applicationIdentifer];
  uint64_t v22 = 0;
  v23 = &v22;
  uint64_t v24 = 0x3032000000;
  v25 = sub_100103C2C;
  v26 = sub_1001046A0;
  id v27 = 0;
  v10 = [(RideBookingAppStoreApplicationsOutlineSection *)self appStoreSuggestions];
  v16 = _NSConcreteStackBlock;
  uint64_t v17 = 3221225472;
  v18 = sub_10045C144;
  v19 = &unk_1012EAD08;
  id v11 = v9;
  id v20 = v11;
  id v21 = &v22;
  [v10 enumerateObjectsUsingBlock:&v16];

  id v12 = [(RideBookingAppStoreApplicationsOutlineSection *)self parentDataSource];
  v13 = [v12 delegate];
  id v14 = [(id)v23[5] identifier];
  v15 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v14 integerValue]);
  [v13 didSelectAppStoreSuggestionWithIdentifier:v15];

  _Block_object_dispose(&v22, 8);
}

- (void)configureWithRideBookingRideOptionState:(id)a3
{
  id v4 = a3;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  v5 = [v4 rideOptionStatusMap];
  id v6 = [v5 allValues];

  id v7 = [v6 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = 0;
    uint64_t v10 = 0;
    uint64_t v11 = *(void *)v22;
    do
    {
      id v12 = 0;
      do
      {
        if (*(void *)v22 != v11) {
          objc_enumerationMutation(v6);
        }
        v13 = [*(id *)(*((void *)&v21 + 1) + 8 * (void)v12) application];
        unsigned int v14 = [v13 enabled];

        v9 += v14 ^ 1;
        v10 += v14;
        id v12 = (char *)v12 + 1;
      }
      while (v8 != v12);
      id v8 = [v6 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v8);
    BOOL v15 = v10 == 0;
  }
  else
  {
    uint64_t v9 = 0;
    BOOL v15 = 1;
  }

  if (v9) {
    BOOL v16 = 0;
  }
  else {
    BOOL v16 = v15;
  }
  if (!v9) {
    BOOL v15 = 0;
  }
  [(RideBookingAppStoreApplicationsOutlineSection *)self setOnlyAppStoreSuggestionsSection:v16];
  uint64_t v17 = [v4 appStoreSuggestions];
  [(RideBookingAppStoreApplicationsOutlineSection *)self setAppStoreSuggestions:v17];

  int BOOL = GEOConfigGetBOOL();
  LOBYTE(v17) = BOOL;
  [(RideBookingAppStoreApplicationsOutlineSection *)self setShouldHideAppStoreSuggestionsSection:v15 & (BOOL ^ 1u)];
  if (v17)
  {
    [(RideBookingAppStoreApplicationsOutlineSection *)self setShouldShowEnableAppsCell:0];
  }
  else
  {
    v19 = [(RideBookingAppStoreApplicationsOutlineSection *)self appStoreSuggestions];
    if ([v19 count]) {
      BOOL v20 = [(RideBookingAppStoreApplicationsOutlineSection *)self onlyAppStoreSuggestionsSection];
    }
    else {
      BOOL v20 = 0;
    }
    [(RideBookingAppStoreApplicationsOutlineSection *)self setShouldShowEnableAppsCell:v20];
  }
}

- (RideBookingOutlineController)parentDataSource
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_parentDataSource);

  return (RideBookingOutlineController *)WeakRetained;
}

- (void)setParentDataSource:(id)a3
{
}

- (NSArray)appStoreSuggestions
{
  return self->_appStoreSuggestions;
}

- (void)setAppStoreSuggestions:(id)a3
{
}

- (BOOL)shouldHideAppStoreSuggestionsSection
{
  return self->_shouldHideAppStoreSuggestionsSection;
}

- (void)setShouldHideAppStoreSuggestionsSection:(BOOL)a3
{
  self->_shouldHideAppStoreSuggestionsSection = a3;
}

- (BOOL)onlyAppStoreSuggestionsSection
{
  return self->_onlyAppStoreSuggestionsSection;
}

- (void)setOnlyAppStoreSuggestionsSection:(BOOL)a3
{
  self->_onlyAppStoreSuggestionsSection = a3;
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
  objc_storeStrong((id *)&self->_appStoreSuggestions, 0);

  objc_destroyWeak((id *)&self->_parentDataSource);
}

@end