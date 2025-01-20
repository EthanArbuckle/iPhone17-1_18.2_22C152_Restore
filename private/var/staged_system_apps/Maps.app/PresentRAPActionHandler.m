@interface PresentRAPActionHandler
+ (void)_showErrorMessageinContext:(id)a3;
+ (void)_showRAPForMapItem:(id)a3 inContext:(id)a4;
+ (void)performAction:(id)a3 inContext:(id)a4;
@end

@implementation PresentRAPActionHandler

+ (void)performAction:(id)a3 inContext:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v8 = v6;
    v9 = [v8 mapItem];

    if (v9)
    {
      v10 = [v8 mapItem];
      [a1 _showRAPForMapItem:v10 inContext:v7];
LABEL_4:

LABEL_15:
      goto LABEL_16;
    }
    v11 = [v8 response];

    if (v11)
    {
      v12 = +[UIApplication sharedMapsDelegate];
      v13 = [v12 poiSearchManager];
      [v13 didReceiveRAPNotification];

      v14 = [v8 response];
      LOBYTE(location) = 0;
      unsigned __int8 v15 = [v14 canDisplayAdditionalUI];
      id v51 = 0;
      v52[0] = 0;
      unsigned __int8 v16 = [v14 getSingleServerSideAlertTitle:v52 message:&v51 messageIsSameAsNotificationTitle:&location];
      id v17 = v52[0];
      id v18 = v51;
      if ((v16 & 1) == 0)
      {
        id v49 = 0;
        id v50 = 0;
        [v14 getDefaultAlertTitle:&v50 alertMessage:&v49];
        id v19 = v50;

        id v20 = v49;
        id v18 = v20;
        id v17 = v19;
      }
      if ((_BYTE)location) {
        unsigned __int8 v21 = 0;
      }
      else {
        unsigned __int8 v21 = v16;
      }
      char v22 = v21 | v15 ^ 1;
      v23 = [v7 chrome];
      v24 = [v7 appCoordinator];
      v42[0] = _NSConcreteStackBlock;
      v42[1] = 3221225472;
      v42[2] = sub_100500228;
      v42[3] = &unk_1012ED5B8;
      char v47 = v22;
      id v43 = v17;
      id v44 = v18;
      unsigned __int8 v48 = v15;
      id v45 = v14;
      id v46 = v23;
      id v25 = v23;
      id v26 = v14;
      id v27 = v18;
      id v28 = v17;
      [v24 displayOrScheduleDisplayOfEnqueuedFixedProblem:v42];
    }
    else
    {
      v29 = [v8 rapInfo];

      if (v29)
      {
        v30 = [v7 chrome];
        v31 = [v8 rapInfo];
        v32 = [v31 rapId];
        v39[0] = _NSConcreteStackBlock;
        v39[1] = 3221225472;
        v39[2] = sub_100500430;
        v39[3] = &unk_1012ED600;
        id v40 = v7;
        id v41 = v30;
        id v26 = v30;
        +[RAPRecordManager fetchRAPRecordsMatchingProblemId:v32 completion:v39];
      }
      else
      {
        v33 = [v8 locationQueryItem];

        if (v33)
        {
          v34 = [v7 chrome];
          v10 = [v34 currentTraits];

          objc_initWeak(&location, a1);
          v35[0] = _NSConcreteStackBlock;
          v35[1] = 3221225472;
          v35[2] = sub_10050061C;
          v35[3] = &unk_1012ECE48;
          objc_copyWeak(&v37, &location);
          id v36 = v7;
          [v8 resolveMapItemWithTraits:v10 completion:v35];

          objc_destroyWeak(&v37);
          objc_destroyWeak(&location);
          goto LABEL_4;
        }
        if (![v8 showReports]) {
          goto LABEL_15;
        }
        id v26 = [v7 coordinator];
        [v26 viewControllerShowReports:0];
      }
    }

    goto LABEL_15;
  }
LABEL_16:
}

+ (void)_showRAPForMapItem:(id)a3 inContext:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (_MKRAPIsAvailable() && !sub_100521BD0())
  {
    if (([v6 _isMapItemTypeBrand] & 1) == 0)
    {
      [v6 _coordinate];
      if (v16 < -180.0 || v16 > 180.0 || v15 < -90.0 || v15 > 90.0)
      {
        [a1 _showErrorMessageinContext:v7];
        goto LABEL_5;
      }
    }
    id v8 = [[SearchResult alloc] initWithMapItem:v6];
    if (_MKRAPIsAvailable() && (sub_100521BD0() & 1) == 0 && v8)
    {
      id v17 = [v7 chrome];
      id v18 = [v17 _maps_mapsSceneDelegate];
      id v19 = [v18 rapPresenter];
      v20[0] = _NSConcreteStackBlock;
      v20[1] = 3221225472;
      v20[2] = sub_10050093C;
      v20[3] = &unk_1012ED628;
      unsigned __int8 v21 = v8;
      [v19 presentReportAProblemFromPlaceCardViewController:0 editingContext:v20 overriddenUserInterfaceStyle:0 sourceView:0 entryPoint:201 completion:0];
    }
  }
  else
  {
    id v8 = [v7 chrome];
    v9 = +[NSBundle mainBundle];
    v10 = [v9 localizedStringForKey:@"This feature isn’t available to you [Report a Problem]" value:@"localized string not found" table:0];
    v11 = +[UIAlertController alertControllerWithTitle:0 message:v10 preferredStyle:1];

    v12 = +[NSBundle mainBundle];
    v13 = [v12 localizedStringForKey:@"OK [Report a Problem push]" value:@"localized string not found" table:0];
    v14 = +[UIAlertAction actionWithTitle:v13 style:1 handler:0];
    [v11 addAction:v14];

    [(SearchResult *)v8 _maps_topMostPresentViewController:v11 animated:1 completion:0];
  }

LABEL_5:
}

+ (void)_showErrorMessageinContext:(id)a3
{
  id v9 = [a3 chrome];
  v3 = +[NSBundle mainBundle];
  v4 = [v3 localizedStringForKey:@"Location Details Not Available [Report a Problem]" value:@"localized string not found" table:0];
  v5 = +[UIAlertController alertControllerWithTitle:0 message:v4 preferredStyle:1];

  id v6 = +[NSBundle mainBundle];
  id v7 = [v6 localizedStringForKey:@"OK [Report a Problem push]" value:@"localized string not found" table:0];
  id v8 = +[UIAlertAction actionWithTitle:v7 style:1 handler:0];
  [v5 addAction:v8];

  [v9 _maps_topMostPresentViewController:v5 animated:1 completion:0];
}

@end