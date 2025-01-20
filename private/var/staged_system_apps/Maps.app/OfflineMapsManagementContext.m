@interface OfflineMapsManagementContext
- (BOOL)shouldResetStateAfterResigning;
- (ChromeViewController)chromeViewController;
- (OfflineMapsManagementContext)init;
- (id)desiredCards;
- (id)renameOfflineMapControllerForDefaultText:(id)a3 saveHandler:(id)a4 cancelHandler:(id)a5;
- (void)becomeTopContextInChromeViewController:(id)a3 withAnimation:(id)a4;
- (void)closeAddNewMapSearchAutocomplete;
- (void)closeExpiredMapsManagement;
- (void)closeOfflineMapDetails;
- (void)dismiss;
- (void)enterStackInChromeViewController:(id)a3 withAnimation:(id)a4;
- (void)leaveStackInChromeViewController:(id)a3 withAnimation:(id)a4;
- (void)presentAddNewMapSearchAutocomplete;
- (void)presentExpiredMapsManagement;
- (void)presentOfflineMapDetailsForSubscriptionInfo:(id)a3;
- (void)presentOfflineMapRegionSelectorForRegion:(id)a3 name:(id)a4;
- (void)presentOfflineMapRegionSelectorForSubscriptionInfo:(id)a3;
- (void)presentRenameOfflineMapForSubscriptionInfo:(id)a3 completionHandler:(id)a4;
- (void)restoreExpiredSubscriptions:(id)a3 completionHandler:(id)a4;
- (void)resumeDownloadingForSubscriptionInfo:(id)a3;
- (void)setChromeViewController:(id)a3;
- (void)setSyncToWatch:(BOOL)a3 completionHandler:(id)a4;
- (void)showPairedDeviceDiskSpaceDialogWithRequiredDiskSpace:(int64_t)a3;
- (void)startUpdatingOfflineSubscriptions;
@end

@implementation OfflineMapsManagementContext

- (OfflineMapsManagementContext)init
{
  v6.receiver = self;
  v6.super_class = (Class)OfflineMapsManagementContext;
  v2 = [(OfflineMapsManagementContext *)&v6 init];
  if (v2)
  {
    v3 = objc_alloc_init(OfflineMapsManagementViewController);
    offlineMapsManagementViewController = v2->_offlineMapsManagementViewController;
    v2->_offlineMapsManagementViewController = v3;

    [(OfflineMapsManagementViewController *)v2->_offlineMapsManagementViewController setDelegate:v2];
  }
  return v2;
}

- (void)setChromeViewController:(id)a3
{
}

- (id)desiredCards
{
  v3 = +[NSMutableArray array];
  v4 = v3;
  if (self->_offlineMapsManagementViewController) {
    [v3 addObject:];
  }
  if (self->_expiredMapsManagementViewController) {
    [v4 addObject:];
  }
  if (self->_searchViewController) {
    [v4 addObject:];
  }
  if (self->_detailsViewController) {
    [v4 addObject:];
  }

  return v4;
}

- (BOOL)shouldResetStateAfterResigning
{
  return 0;
}

- (void)becomeTopContextInChromeViewController:(id)a3 withAnimation:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100D320F4;
  v9[3] = &unk_1012E6690;
  objc_copyWeak(&v11, &location);
  id v8 = v6;
  id v10 = v8;
  [v7 addPreparation:v9];

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

- (void)enterStackInChromeViewController:(id)a3 withAnimation:(id)a4
{
  id v4 = +[MapsOfflineUIHelper sharedHelper];
  [v4 startMonitoringPairedDeviceSubscriptionStates];
}

- (void)leaveStackInChromeViewController:(id)a3 withAnimation:(id)a4
{
  id v4 = +[MapsOfflineUIHelper sharedHelper];
  [v4 stopMonitoringPairedDeviceSubscriptionStates];
}

- (void)dismiss
{
  v3 = [(OfflineMapsManagementContext *)self iosChromeViewController];
  unsigned int v4 = [v3 isCurrentContext:self];

  v5 = [(OfflineMapsManagementContext *)self iosChromeViewController];
  id v10 = v5;
  if (v4)
  {
    [v5 popContextAnimated:1 completion:0];
    id v6 = v10;
  }
  else
  {
    id v7 = [v5 contexts];
    id v8 = [v7 mutableCopy];

    [v8 removeObject:self];
    v9 = [(OfflineMapsManagementContext *)self iosChromeViewController];
    [v9 setContexts:v8 animated:0 completion:0];

    id v6 = v8;
  }
}

- (void)presentExpiredMapsManagement
{
  v3 = objc_alloc_init(OfflineMapsManagementExpiredViewController);
  expiredMapsManagementViewController = self->_expiredMapsManagementViewController;
  self->_expiredMapsManagementViewController = v3;

  [(OfflineMapsManagementExpiredViewController *)self->_expiredMapsManagementViewController setDelegate:self];
  id v5 = [(OfflineMapsManagementContext *)self chromeViewController];
  [v5 setNeedsUpdateComponent:@"cards" animated:1];
}

- (void)closeExpiredMapsManagement
{
  expiredMapsManagementViewController = self->_expiredMapsManagementViewController;
  self->_expiredMapsManagementViewController = 0;

  id v4 = [(OfflineMapsManagementContext *)self chromeViewController];
  [v4 setNeedsUpdateComponent:@"cards" animated:1];
}

- (void)presentAddNewMapSearchAutocomplete
{
  v3 = +[MapsOfflineUIHelper sharedHelper];
  id v7 = [v3 alertControllerForAttemptedRegionDownload];

  if (v7)
  {
    id v4 = [(OfflineMapsManagementContext *)self chromeViewController];
    [v4 _maps_topMostPresentViewController:v7 animated:1 completion:0];
  }
  else
  {
    id v5 = objc_alloc_init(OfflineMapsManagementSearchAutocompleteViewController);
    searchViewController = self->_searchViewController;
    self->_searchViewController = v5;

    [(OfflineMapsManagementSearchAutocompleteViewController *)self->_searchViewController setDelegate:self];
    id v4 = [(OfflineMapsManagementContext *)self chromeViewController];
    [v4 setNeedsUpdateComponent:@"cards" animated:1];
  }
}

- (void)closeAddNewMapSearchAutocomplete
{
  searchViewController = self->_searchViewController;
  self->_searchViewController = 0;

  id v4 = [(OfflineMapsManagementContext *)self chromeViewController];
  [v4 setNeedsUpdateComponent:@"cards" animated:1];
}

- (void)presentOfflineMapDetailsForSubscriptionInfo:(id)a3
{
  id v4 = a3;
  id v5 = [[OfflineMapDetailsViewController alloc] initWithSubscriptionInfo:v4];

  detailsViewController = self->_detailsViewController;
  self->_detailsViewController = v5;

  [(OfflineMapDetailsViewController *)self->_detailsViewController setDelegate:self];
  id v7 = [(OfflineMapsManagementContext *)self chromeViewController];
  [v7 setNeedsUpdateComponent:@"cards" animated:1];
}

- (void)resumeDownloadingForSubscriptionInfo:(id)a3
{
  id v4 = a3;
  id v5 = +[MapsOfflineUIHelper sharedHelper];
  id v6 = [v5 alertControllerForAttemptedRegionDownload];

  if (v6)
  {
    id v7 = [(OfflineMapsManagementContext *)self chromeViewController];
    [v7 _maps_topMostPresentViewController:v6 animated:1 completion:0];
LABEL_9:

    goto LABEL_10;
  }
  id v8 = +[MapsOfflineUIHelper sharedHelper];
  id v9 = [v8 cellularBehaviorForDownloadOfSize:-1 forForcedDownload:1];

  if (v9 == (id)2)
  {
    id v10 = +[MapsOfflineUIHelper sharedHelper];
    id v7 = v10;
    id v11 = v4;
    uint64_t v12 = 1;
    goto LABEL_8;
  }
  if (v9 == (id)1)
  {
    v13 = +[MapsOfflineUIHelper sharedHelper];
    v14 = [v4 subscription];
    v15 = [v14 displayName];
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_100D327DC;
    v18[3] = &unk_1012E7D28;
    id v19 = v4;
    v16 = [v13 alertControllerForCellularDownloadConfirmationForRegionName:v15 size:-1 actionHandler:v18];

    v17 = [(OfflineMapsManagementContext *)self chromeViewController];
    [v17 _maps_topMostPresentViewController:v16 animated:1 completion:0];

    goto LABEL_10;
  }
  if (!v9)
  {
    id v10 = +[MapsOfflineUIHelper sharedHelper];
    id v7 = v10;
    id v11 = v4;
    uint64_t v12 = 0;
LABEL_8:
    [v10 resumeDownloadForSubscriptionInfo:v11 mode:v12];
    goto LABEL_9;
  }
LABEL_10:
}

- (void)restoreExpiredSubscriptions:(id)a3 completionHandler:(id)a4
{
  id v14 = a3;
  v15 = (void (**)(id, void))a4;
  id v6 = +[MapsOfflineUIHelper sharedHelper];
  v16 = [v6 alertControllerForAttemptedRegionDownload];

  if (v16)
  {
    id v7 = [(OfflineMapsManagementContext *)self chromeViewController];
    [v7 _maps_topMostPresentViewController:v16 animated:1 completion:0];

    if (v15) {
      v15[2](v15, 0);
    }
  }
  else
  {
    v28[0] = 0;
    v28[1] = v28;
    v28[2] = 0x2020000000;
    char v29 = 1;
    id v8 = dispatch_group_create();
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    id obj = v14;
    id v9 = [obj countByEnumeratingWithState:&v24 objects:v30 count:16];
    if (v9)
    {
      uint64_t v10 = *(void *)v25;
      do
      {
        id v11 = 0;
        do
        {
          if (*(void *)v25 != v10) {
            objc_enumerationMutation(obj);
          }
          uint64_t v12 = *(void *)(*((void *)&v24 + 1) + 8 * (void)v11);
          dispatch_group_enter(v8);
          v13 = +[MapsOfflineUIHelper sharedHelper];
          v21[0] = _NSConcreteStackBlock;
          v21[1] = 3221225472;
          v21[2] = sub_100D32B38;
          v21[3] = &unk_101322818;
          v23 = v28;
          v22 = v8;
          [v13 restoreExpiredSubscription:v12 completionHandler:v21];

          id v11 = (char *)v11 + 1;
        }
        while (v9 != v11);
        id v9 = [obj countByEnumeratingWithState:&v24 objects:v30 count:16];
      }
      while (v9);
    }

    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100D32B50;
    block[3] = &unk_1012E79E8;
    id v19 = v15;
    v20 = v28;
    dispatch_group_notify(v8, (dispatch_queue_t)&_dispatch_main_q, block);

    _Block_object_dispose(v28, 8);
  }
}

- (void)startUpdatingOfflineSubscriptions
{
  v3 = +[MapsOfflineUIHelper sharedHelper];
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100D32C08;
  v4[3] = &unk_1012E7610;
  v4[4] = self;
  [v3 fetchAllSubscriptionInfosWithCompletion:v4];
}

- (void)closeOfflineMapDetails
{
  detailsViewController = self->_detailsViewController;
  self->_detailsViewController = 0;

  id v4 = [(OfflineMapsManagementContext *)self chromeViewController];
  [v4 setNeedsUpdateComponent:@"cards" animated:1];
}

- (void)presentRenameOfflineMapForSubscriptionInfo:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 subscription];
  id v9 = [v8 displayName];
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_100D332B8;
  v16[3] = &unk_1012E8EE0;
  id v17 = v6;
  id v18 = v7;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_100D33488;
  v14[3] = &unk_1012E6EA8;
  id v15 = v18;
  id v10 = v18;
  id v11 = v6;
  uint64_t v12 = [(OfflineMapsManagementContext *)self renameOfflineMapControllerForDefaultText:v9 saveHandler:v16 cancelHandler:v14];

  v13 = [(OfflineMapsManagementContext *)self chromeViewController];
  [v13 _maps_topMostPresentViewController:v12 animated:1 completion:0];
}

- (id)renameOfflineMapControllerForDefaultText:(id)a3 saveHandler:(id)a4 cancelHandler:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = +[NSBundle mainBundle];
  long long v25 = [v10 localizedStringForKey:@"Rename Map alert title" value:@"localized string not found" table:@"Offline"];

  id v11 = +[UIAlertController alertControllerWithTitle:v25 message:0 preferredStyle:1];
  v31[0] = _NSConcreteStackBlock;
  v31[1] = 3221225472;
  v31[2] = sub_100D337B4;
  v31[3] = &unk_1013022D8;
  id v32 = v7;
  id v24 = v7;
  [v11 addTextFieldWithConfigurationHandler:v31];
  uint64_t v12 = [v11 textFields];
  v13 = [v12 firstObject];

  id v14 = +[NSBundle mainBundle];
  id v15 = [v14 localizedStringForKey:@"Cancel - Rename Map alert button" value:@"localized string not found" table:@"Offline"];
  v29[0] = _NSConcreteStackBlock;
  v29[1] = 3221225472;
  v29[2] = sub_100D33824;
  v29[3] = &unk_1012E6E08;
  id v30 = v9;
  id v16 = v9;
  id v17 = +[UIAlertAction actionWithTitle:v15 style:1 handler:v29];

  id v18 = +[NSBundle mainBundle];
  id v19 = [v18 localizedStringForKey:@"Save - Rename Map alert button" value:@"localized string not found" table:@"Offline"];
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472;
  v26[2] = sub_100D3383C;
  v26[3] = &unk_1012E8D68;
  id v27 = v13;
  id v28 = v8;
  id v20 = v13;
  id v21 = v8;
  v22 = +[UIAlertAction actionWithTitle:v19 style:0 handler:v26];

  [v11 addAction:v17];
  [v11 addAction:v22];
  [v11 setPreferredAction:v22];

  return v11;
}

- (void)presentOfflineMapRegionSelectorForRegion:(id)a3 name:(id)a4
{
  id v14 = a3;
  id v6 = a4;
  id v7 = +[MapsOfflineUIHelper sharedHelper];
  id v8 = [v7 alertControllerForAttemptedRegionDownload];

  id v9 = [(OfflineMapsManagementContext *)self chromeViewController];
  id v10 = v9;
  if (v8)
  {
    [(OfflineRegionSelectorContext *)v9 _maps_topMostPresentViewController:v8 animated:1 completion:0];
  }
  else
  {
    id v11 = [(OfflineRegionSelectorContext *)v9 topContext];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass) {
      goto LABEL_6;
    }
    id v10 = [[OfflineRegionSelectorContext alloc] initWithRegion:v14 name:v6];
    v13 = [(OfflineMapsManagementContext *)self chromeViewController];
    [v13 pushContext:v10 animated:1 completion:0];
  }
LABEL_6:
}

- (void)presentOfflineMapRegionSelectorForSubscriptionInfo:(id)a3
{
  id v11 = a3;
  id v4 = +[MapsOfflineUIHelper sharedHelper];
  id v5 = [v4 alertControllerForAttemptedRegionDownload];

  id v6 = [(OfflineMapsManagementContext *)self chromeViewController];
  id v7 = v6;
  if (v5)
  {
    [(OfflineRegionSelectorContext *)v6 _maps_topMostPresentViewController:v5 animated:1 completion:0];
  }
  else
  {
    id v8 = [(OfflineRegionSelectorContext *)v6 topContext];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass) {
      goto LABEL_6;
    }
    id v7 = [[OfflineRegionSelectorContext alloc] initWithSubscriptionInfo:v11];
    id v10 = [(OfflineMapsManagementContext *)self chromeViewController];
    [v10 pushContext:v7 animated:1 completion:0];
  }
LABEL_6:
}

- (void)setSyncToWatch:(BOOL)a3 completionHandler:(id)a4
{
  BOOL v4 = a3;
  id v6 = (void (**)(id, uint64_t))a4;
  if (v4)
  {
    GEOConfigSetBOOL();
    v6[2](v6, 1);
  }
  else
  {
    id v7 = +[MapsOfflineUIHelper sharedHelper];
    id v11 = _NSConcreteStackBlock;
    uint64_t v12 = 3221225472;
    v13 = sub_100D33CB0;
    id v14 = &unk_101322888;
    id v8 = v6;
    id v15 = v8;
    char v16 = 0;
    id v9 = [v7 alertControllerForDisableSyncToWatchWithActionHandler:&v11];

    if (v9)
    {
      id v10 = [(OfflineMapsManagementContext *)self chromeViewController];
      [v10 _maps_topMostPresentViewController:v9 animated:1 completion:0];
    }
    else
    {
      GEOConfigSetBOOL();
      v8[2](v8, 1);
    }
  }
}

- (void)showPairedDeviceDiskSpaceDialogWithRequiredDiskSpace:(int64_t)a3
{
  id v5 = +[MapsOfflineUIHelper sharedHelper];
  id v7 = [v5 alertControllerForInsufficientDiskSpaceOnPairedDeviceForDownloadSize:a3];

  id v6 = [(OfflineMapsManagementContext *)self chromeViewController];
  [v6 _maps_topMostPresentViewController:v7 animated:1 completion:0];
}

- (ChromeViewController)chromeViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_chromeViewController);

  return (ChromeViewController *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_chromeViewController);
  objc_storeStrong((id *)&self->_detailsViewController, 0);
  objc_storeStrong((id *)&self->_searchViewController, 0);
  objc_storeStrong((id *)&self->_expiredMapsManagementViewController, 0);

  objc_storeStrong((id *)&self->_offlineMapsManagementViewController, 0);
}

@end