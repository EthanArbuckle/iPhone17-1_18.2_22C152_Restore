@interface RAPRouteStepDetailViewController
- (CLLocationCoordinate2D)startingCoordinateForMapPicker;
- (RAPRouteStepDetailViewController)initWithReport:(id)a3 step:(id)a4 userPath:(id)a5 routeIndex:(unint64_t)a6 delegate:(id)a7;
- (id)context;
- (void)_dismiss;
- (void)_saveManeuverIconWithCompletion:(id)a3;
- (void)_saveMapImageWithCompletion:(id)a3;
- (void)_submit;
- (void)_submitPressed:(id)a3;
- (void)_takeSnapshots;
- (void)_updateAggregatedDataWithCompletion:(id)a3;
- (void)_uploadForm:(id)a3;
- (void)didReceiveMessageFromUserContentController:(id)a3 message:(id)a4 replyHandler:(id)a5;
- (void)macFooterViewRightButtonTapped:(id)a3;
- (void)setupViews;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
@end

@implementation RAPRouteStepDetailViewController

- (RAPRouteStepDetailViewController)initWithReport:(id)a3 step:(id)a4 userPath:(id)a5 routeIndex:(unint64_t)a6 delegate:(id)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a7;
  v20.receiver = self;
  v20.super_class = (Class)RAPRouteStepDetailViewController;
  v17 = [(RAPWebBundleBaseMapViewController *)&v20 initWithReport:v13];
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_report, a3);
    objc_storeStrong((id *)&v18->_step, a4);
    objc_storeStrong((id *)&v18->_userPath, a5);
    v18->_isMissedStep = [v15 traversal] == 2;
    v18->_routeIndex = a6;
    objc_storeWeak((id *)&v18->_delegate, v16);
  }

  return v18;
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)RAPRouteStepDetailViewController;
  [(RAPWebBundleBaseMapViewController *)&v3 viewDidLoad];
  [(RAPRouteStepDetailViewController *)self _takeSnapshots];
}

- (void)viewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)RAPRouteStepDetailViewController;
  [(RAPRouteStepDetailViewController *)&v4 viewDidAppear:a3];
  +[RAPAnalyticsManager captureRAPRevealActionFromReport:self->_report];
}

- (void)viewDidDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)RAPRouteStepDetailViewController;
  [(RAPRouteStepDetailViewController *)&v4 viewDidDisappear:a3];
  if ([(RAPRouteStepDetailViewController *)self isMovingFromParentViewController])
  {
    [(RAPRouteStepDetailViewController *)self _updateAggregatedDataWithCompletion:0];
    +[GEOAPPortal captureUserAction:10111 target:31 value:0];
  }
}

- (void)setupViews
{
  id v3 = objc_alloc((Class)UIBarButtonItem);
  objc_super v4 = +[NSBundle mainBundle];
  v5 = [v4 localizedStringForKey:@"[RAP Web UI] Send" value:@"localized string not found" table:0];
  id v6 = [v3 initWithTitle:v5 style:2 target:self action:"_submitPressed:"];
  v7 = [(RAPRouteStepDetailViewController *)self navigationItem];
  [v7 setRightBarButtonItem:v6];

  id v8 = [objc_alloc((Class)UIBarButtonItem) initWithBarButtonSystemItem:1 target:self action:"_cancelPressed:"];
  v9 = [(RAPRouteStepDetailViewController *)self navigationItem];
  [v9 setLeftBarButtonItem:v8];

  v10 = +[NSBundle mainBundle];
  v11 = [v10 localizedStringForKey:@"[RAP Web UI] Report an Issue" value:@"localized string not found" table:0];
  v12 = [(RAPRouteStepDetailViewController *)self navigationItem];
  [v12 setTitle:v11];

  v13.receiver = self;
  v13.super_class = (Class)RAPRouteStepDetailViewController;
  [(RAPWebBundleBaseViewController *)&v13 setupViews];
}

- (id)context
{
  context = self->_context;
  if (!context)
  {
    if (!self->_mapSnapshotId)
    {
      objc_super v4 = sub_10057670C();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)id v8 = 0;
        _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "Map snapshot should be ready by now.", v8, 2u);
      }
    }
    v5 = [[RAPWebBundleRouteStepContext alloc] initWithRouteStep:self->_step isMissedStep:self->_isMissedStep aggregatedData:self->_aggregatedData locales:self->_locales mapSnapshotId:self->_mapSnapshotId routeIndex:self->_routeIndex];
    id v6 = self->_context;
    self->_context = v5;

    context = self->_context;
  }

  return context;
}

- (void)_takeSnapshots
{
  id v3 = sub_10057670C();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Started capturing snapshots.", (uint8_t *)buf, 2u);
  }

  objc_super v4 = dispatch_group_create();
  objc_initWeak(buf, self);
  dispatch_group_enter(v4);
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10040D354;
  v11[3] = &unk_1012E5D08;
  v5 = v4;
  v12 = v5;
  [(RAPRouteStepDetailViewController *)self _saveManeuverIconWithCompletion:v11];
  dispatch_group_enter(v5);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10040D3C8;
  v9[3] = &unk_1012E5D08;
  id v6 = v5;
  v10 = v6;
  [(RAPRouteStepDetailViewController *)self _saveMapImageWithCompletion:v9];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10040D43C;
  block[3] = &unk_1012E6708;
  objc_copyWeak(&v8, buf);
  dispatch_group_notify(v6, (dispatch_queue_t)&_dispatch_main_q, block);
  objc_destroyWeak(&v8);

  objc_destroyWeak(buf);
}

- (void)_saveManeuverIconWithCompletion:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  v5 = dispatch_get_global_queue(33, 0);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10040D5A4;
  v7[3] = &unk_1012E9730;
  objc_copyWeak(&v9, &location);
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (void)_saveMapImageWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init((Class)MKMapSnapshotOptions);
  id v6 = [(RAPRouteStepDetailViewController *)self view];
  [v6 frame];
  double v8 = v7 + -32.0;

  double v69 = v8 * 0.453999996;
  double v70 = v8;
  [v5 setSize:v8];
  [v5 setMapType:0];
  id v9 = [(GEOComposedRouteStep *)self->_step composedRoute];
  [v5 _setComposedRouteForRouteLine:v9];

  if ([(GEOComposedRouteStep *)self->_step isArrivalStep])
  {
    v10 = [(GEOComposedRouteStep *)self->_step composedRoute];
    id v11 = [v10 legIndexForStepIndex:[self->_step stepIndex]];

    v12 = [(GEOComposedRouteStep *)self->_step composedRoute];
    objc_super v13 = [v12 legs];
    id v14 = [v13 count];

    if (v11 < v14)
    {
      [(GEOComposedRouteStep *)self->_step endGeoCoordinate];
      double v16 = v15;
      [(GEOComposedRouteStep *)self->_step endGeoCoordinate];
      double v18 = v17;
      id v19 = [objc_alloc((Class)VKCustomFeature) initWithCoordinate:v16, v17];
      objc_super v20 = [(GEOComposedRouteStep *)self->_step composedRoute];
      v21 = [v20 legs];
      v22 = [v21 objectAtIndexedSubscript:v11];
      v23 = [v22 destination];

      v24 = [v23 styleAttributes];
      if (([v24 hasAttributes] & 1) == 0)
      {
        uint64_t v25 = +[GEOFeatureStyleAttributes markerStyleAttributes];

        v24 = (void *)v25;
      }
      id v26 = [v24 copy];

      *(_OWORD *)buf = xmmword_100F6F4E0;
      [v26 replaceAttributes:buf count:2];
      [v19 setStyleAttributes:v26];
      id v27 = [objc_alloc((Class)MKMapSnapshotCustomFeatureAnnotation) initWithCustomFeature:v19 coordinate:v16];
      id v74 = v27;
      v28 = +[NSArray arrayWithObjects:&v74 count:1];
      [v5 _setCustomFeatureAnnotations:v28];
    }
  }
  step = self->_step;
  if (step)
  {
    v30 = step;
    v31 = [(GEOComposedRouteStep *)v30 composedRoute];
    [v31 pointAtRouteCoordinate:[v30 maneuverStartRouteCoordinate]];
    double v68 = v32;
    CLLocationDegrees v34 = v33;
    CLLocationDegrees v36 = v35;

    v37 = [(GEOComposedRouteStep *)v30 composedRoute];
    id v38 = [(GEOComposedRouteStep *)v30 endRouteCoordinate];

    [v37 pointAtRouteCoordinate:v38];
    double v67 = v39;
    CLLocationDegrees v41 = v40;
    CLLocationDegrees v43 = v42;

    CLLocationCoordinate2D v44 = CLLocationCoordinate2DMake(v34, v36);
    CLLocationCoordinate2D v45 = CLLocationCoordinate2DMake(v41, v43);
    *(MKMapPoint *)buf = MKMapPointForCoordinate(v44);
    MKMapPoint v76 = MKMapPointForCoordinate(v45);
    MKMapRectBoundingMapPoints();
    double x = v46;
    double y = v48;
    double width = v50;
    double height = v52;
    GEOCalculateDistance();
    if (sqrt((v68 - v67) * (v68 - v67) + v54 * v54) < 150.0)
    {
      v77.double x = x + width * 0.5;
      v77.double y = y + height * 0.5;
      MKCoordinateForMapPoint(v77);
      MKMapRectMakeWithRadialDistance();
      double x = v55;
      double y = v56;
      double width = v57;
      double height = v58;
    }
  }
  else
  {
    double x = MKMapRectNull.origin.x;
    double y = MKMapRectNull.origin.y;
    double width = MKMapRectNull.size.width;
    double height = MKMapRectNull.size.height;
  }
  v59 = +[MKMapCamera _cameraLookingAtMapRect:forViewSize:](MKMapCamera, "_cameraLookingAtMapRect:forViewSize:", x, y, width, height, v70, v69, *(void *)&v67);
  [v59 centerCoordinateDistance];
  [v59 setCenterCoordinateDistance:v60 * 1.2];
  [v5 setCamera:v59];
  [v5 _setSearchResultsType:1];
  v61 = (MKMapSnapshotter *)[objc_alloc((Class)MKMapSnapshotter) initWithOptions:v5];
  mapSnapshotter = self->_mapSnapshotter;
  self->_mapSnapshotter = v61;

  id v63 = [(GEOComposedRouteStep *)self->_step stepIndex];
  v64 = sub_10057670C();
  if (os_log_type_enabled(v64, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134217984;
    *(void *)&buf[4] = v63;
    _os_log_impl((void *)&_mh_execute_header, v64, OS_LOG_TYPE_INFO, "Will create a snapshot of step with stepInde: %lu", buf, 0xCu);
  }

  objc_initWeak((id *)buf, self);
  v65 = self->_mapSnapshotter;
  v71[0] = _NSConcreteStackBlock;
  v71[1] = 3221225472;
  v71[2] = sub_10040E288;
  v71[3] = &unk_1012E9758;
  objc_copyWeak(v73, (id *)buf);
  v73[1] = v63;
  id v66 = v4;
  id v72 = v66;
  [(MKMapSnapshotter *)v65 startWithCompletionHandler:v71];

  objc_destroyWeak(v73);
  objc_destroyWeak((id *)buf);
}

- (void)_submitPressed:(id)a3
{
  id v4 = a3;
  id v5 = sub_10057670C();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "User pressed submit, will dismiss viewController", (uint8_t *)buf, 2u);
  }

  objc_initWeak(buf, self);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10040E540;
  v6[3] = &unk_1012E6708;
  objc_copyWeak(&v7, buf);
  [(RAPRouteStepDetailViewController *)self _updateAggregatedDataWithCompletion:v6];
  objc_destroyWeak(&v7);
  objc_destroyWeak(buf);
}

- (void)_updateAggregatedDataWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = sub_10057670C();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "_updateAggregatedDataWithCompletion will fetch latest aggregatedData.", buf, 2u);
  }

  id v6 = [(RAPWebBundleBaseViewController *)self webView];
  id v7 = +[WKContentWorld pageWorld];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10040E6A8;
  v9[3] = &unk_1012E9780;
  void v9[4] = self;
  id v10 = v4;
  id v8 = v4;
  [v6 callAsyncJavaScript:@"return rapGetData()" arguments:0 inFrame:0 inContentWorld:v7 completionHandler:v9];
}

- (void)_dismiss
{
  id v3 = sub_10057670C();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "_cancelPressed, will pop to previous VC", v6, 2u);
  }

  id v4 = [(RAPRouteStepDetailViewController *)self navigationController];
  id v5 = [v4 popViewControllerAnimated:1];

  +[RAPAnalyticsManager captureRAPCancelActionFromReport:self->_report];
}

- (void)_submit
{
  id v3 = sub_10057670C();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    aggregatedData = self->_aggregatedData;
    int v7 = 138412290;
    id v8 = aggregatedData;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "_submit: will try to submit RAP with aggregatedData: %@", (uint8_t *)&v7, 0xCu);
  }

  id v5 = [objc_alloc((Class)NSData) initWithBase64EncodedString:self->_aggregatedData options:0];
  id v6 = [objc_alloc((Class)GEORPFeedbackDynamicForm) initWithData:v5];
  [(RAPRouteStepDetailViewController *)self _uploadForm:v6];
}

- (void)_uploadForm:(id)a3
{
  id v4 = a3;
  id v5 = [(RAPReport *)self->_report initialQuestion];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v6 = v5;
  }
  else {
    id v6 = 0;
  }
  id v7 = v6;

  if (v7)
  {
    [v7 setDynamicForm:v4];
    [v7 setReportedUserPath:self->_userPath];
    if (self->_mapSnapshot)
    {
      id v8 = [RAPPhoto alloc];
      mapSnapshot = self->_mapSnapshot;
      id v10 = +[NSDate date];
      id v11 = [(RAPPhoto *)v8 initWithPhoto:mapSnapshot date:v10 location:0];

      v12 = [[RAPPhotoWithMetadata alloc] initWithRAPPhoto:v11 photoType:3];
      [(RAPReport *)self->_report addPhotoWithMetadata:v12];
    }
    else
    {
      id v14 = sub_10057670C();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "Couldn't append photo because the snapshot was nil.", buf, 2u);
      }
    }
    double v15 = sub_1009A033C();
    objc_initWeak((id *)buf, self);
    report = self->_report;
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_10040ED74;
    v21[3] = &unk_1012E97E8;
    objc_copyWeak(&v23, (id *)buf);
    id v17 = v15;
    id v22 = v17;
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_10040EE60;
    v18[3] = &unk_1012E9810;
    objc_copyWeak(&v20, (id *)buf);
    objc_super v13 = v17;
    id v19 = v13;
    [(RAPReport *)report submitWithPrivacyRequestHandler:&stru_1012E97C0 willStartSubmitting:v21 didFinishSubmitting:v18];

    objc_destroyWeak(&v20);
    objc_destroyWeak(&v23);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    objc_super v13 = sub_10057670C();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v25 = 0;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_FAULT, "Failed to upload form, question was of unsupported type: %@", buf, 0xCu);
    }
  }
}

- (CLLocationCoordinate2D)startingCoordinateForMapPicker
{
  [(GEOComposedRouteStep *)self->_step endGeoCoordinate];
  CLLocationDegrees v4 = v3;
  [(GEOComposedRouteStep *)self->_step endGeoCoordinate];

  CLLocationCoordinate2D v8 = CLLocationCoordinate2DMake(v4, v5);
  double longitude = v8.longitude;
  double latitude = v8.latitude;
  result.double longitude = longitude;
  result.double latitude = latitude;
  return result;
}

- (void)didReceiveMessageFromUserContentController:(id)a3 message:(id)a4 replyHandler:(id)a5
{
  id v8 = a4;
  id v9 = (void (**)(id, void *, void))a5;
  id v10 = a3;
  id v11 = sub_10057670C();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    id v23 = v8;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "didReceiveMessageFromUserContentController:message:replyHandler called with message: %@", buf, 0xCu);
  }

  v21.receiver = self;
  v21.super_class = (Class)RAPRouteStepDetailViewController;
  [(RAPWebBundleBaseMapViewController *)&v21 didReceiveMessageFromUserContentController:v10 message:v8 replyHandler:v9];

  v12 = [v8 objectForKeyedSubscript:@"name"];
  unsigned int v13 = [v12 isEqualToString:@"context"];

  if (v13)
  {
    id v14 = [v8 objectForKeyedSubscript:@"supportedLocales"];
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      uint64_t v15 = +[NSArray array];

      id v14 = (NSArray *)v15;
    }
    locales = self->_locales;
    self->_locales = v14;

    id v17 = [(RAPRouteStepDetailViewController *)self context];
    double v18 = [v17 context];
    v9[2](v9, v18, 0);
  }
  else
  {
    id v19 = [v8 objectForKeyedSubscript:@"name"];
    unsigned int v20 = [v19 isEqualToString:@"setValid"];

    if (v20) {
      [(RAPRouteStepDetailViewController *)self _updateAggregatedDataWithCompletion:0];
    }
  }
}

- (void)macFooterViewRightButtonTapped:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mapSnapshot, 0);
  objc_storeStrong((id *)&self->_mapSnapshotId, 0);
  objc_storeStrong((id *)&self->_mapSnapshotter, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_aggregatedData, 0);
  objc_storeStrong((id *)&self->_locales, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_userPath, 0);
  objc_storeStrong((id *)&self->_step, 0);

  objc_storeStrong((id *)&self->_report, 0);
}

@end