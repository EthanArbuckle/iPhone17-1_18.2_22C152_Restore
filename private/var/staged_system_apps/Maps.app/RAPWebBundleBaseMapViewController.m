@interface RAPWebBundleBaseMapViewController
- (CLLocationCoordinate2D)startingCoordinateForMapPicker;
- (RAPWebBundleBaseMapViewController)initWithReport:(id)a3;
- (void)_updateMapViewWithUpdateMapPickerViewDictionary:(id)a3;
- (void)didReceiveMessageFromUserContentController:(id)a3 message:(id)a4 replyHandler:(id)a5;
- (void)rapWebBundleMapViewController:(id)a3 marker:(id)a4 didUpdateLocationTo:(CLLocationCoordinate2D)a5;
- (void)scrollViewWillBeginDragging:(id)a3;
- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5;
- (void)viewDidLoad;
@end

@implementation RAPWebBundleBaseMapViewController

- (RAPWebBundleBaseMapViewController)initWithReport:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)RAPWebBundleBaseMapViewController;
  v6 = [(RAPWebBundleBaseViewController *)&v9 initWithReport:v5];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_report, a3);
  }

  return v7;
}

- (void)viewDidLoad
{
  v7.receiver = self;
  v7.super_class = (Class)RAPWebBundleBaseMapViewController;
  [(RAPWebBundleBaseViewController *)&v7 viewDidLoad];
  v3 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
  mapViews = self->_mapViews;
  self->_mapViews = v3;

  id v5 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
  mapViewConstraints = self->_mapViewConstraints;
  self->_mapViewConstraints = v5;
}

- (CLLocationCoordinate2D)startingCoordinateForMapPicker
{
  v3 = [(RAPReport *)self->_report initialQuestion];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v4 = v3;
  }
  else {
    v4 = 0;
  }
  id v5 = v4;

  if (v5)
  {
    v6 = [v5 reportedPlace];
    objc_super v7 = [v6 mapItem];

    if (v7)
    {
      v8 = [v5 reportedPlace];
      objc_super v9 = [v8 mapItem];
      v10 = [v9 placemark];
      [v10 coordinate];
      CLLocationDegrees latitude = v11;
      CLLocationDegrees longitude = v13;
    }
    else
    {
      v8 = [(RAPReport *)self->_report _context];
      objc_super v9 = [v8 mapCamera];
      [v9 centerCoordinate];
      CLLocationDegrees latitude = v15;
      CLLocationDegrees longitude = v16;
    }
  }
  else
  {
    CLLocationDegrees latitude = kCLLocationCoordinate2DInvalid.latitude;
    CLLocationDegrees longitude = kCLLocationCoordinate2DInvalid.longitude;
  }

  double v17 = latitude;
  double v18 = longitude;
  result.CLLocationDegrees longitude = v18;
  result.CLLocationDegrees latitude = v17;
  return result;
}

- (void)_updateMapViewWithUpdateMapPickerViewDictionary:(id)a3
{
  id v4 = a3;
  id v5 = [v4 objectForKeyedSubscript:@"start"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v6 = v5;
  }
  else {
    v6 = 0;
  }
  id v7 = v6;

  if (v7)
  {
    v8 = [v4 objectForKeyedSubscript:@"end"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      objc_super v9 = v8;
    }
    else {
      objc_super v9 = 0;
    }
    id v10 = v9;

    if (v10)
    {
      id v88 = v7;
      double v11 = [[RAPWebBundleMapViewPosition alloc] initWithDictionary:v7];
      id v87 = v10;
      v86 = [[RAPWebBundleMapViewPosition alloc] initWithDictionary:v10];
      id v84 = v4;
      v12 = [v4 objectForKeyedSubscript:@"duration"];
      uint64_t v85 = (uint64_t)[v12 integerValue];

      mapViews = self->_mapViews;
      v14 = [(RAPWebBundleMapViewPosition *)v11 mapId];
      double v15 = [(NSMutableDictionary *)mapViews objectForKeyedSubscript:v14];

      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        double v16 = v15;
      }
      else {
        double v16 = 0;
      }
      double v17 = v16;

      if (v17)
      {
        mapViewConstraints = self->_mapViewConstraints;
        v19 = [(RAPWebBundleMapViewPosition *)v11 mapId];
        v81 = [(NSMutableDictionary *)mapViewConstraints objectForKeyedSubscript:v19];

        +[NSLayoutConstraint deactivateConstraints:v81];
        v20 = [(RAPWebBundleMapViewController *)v17 view];
        v21 = [v20 heightAnchor];
        [(RAPWebBundleMapViewPosition *)v11 height];
        uint64_t v80 = [v21 constraintEqualToConstant:];

        v22 = [(RAPWebBundleMapViewController *)v17 view];
        v23 = [v22 topAnchor];
        v24 = [(RAPWebBundleBaseViewController *)self webView];
        v25 = [v24 scrollView];
        v26 = [v25 topAnchor];
        [(RAPWebBundleMapViewPosition *)v11 yPosition];
        uint64_t v82 = [v23 constraintEqualToAnchor:v26 constant:];

        v27 = [(RAPWebBundleMapViewController *)v17 view];
        v28 = [v27 leadingAnchor];
        v29 = [(RAPWebBundleBaseViewController *)self webView];
        v30 = [v29 safeAreaLayoutGuide];
        v31 = [v30 leadingAnchor];
        [(RAPWebBundleMapViewPosition *)v11 xPosition];
        uint64_t v32 = [v28 constraintEqualToAnchor:v31];

        v33 = [(RAPWebBundleMapViewController *)v17 view];
        v34 = [v33 trailingAnchor];
        v35 = [(RAPWebBundleBaseViewController *)self webView];
        v36 = [v35 safeAreaLayoutGuide];
        v37 = [v36 trailingAnchor];
        [(RAPWebBundleMapViewPosition *)v11 xPosition];
        v39 = [v34 constraintEqualToAnchor:v37 constant:-v38];

        v40 = (void *)v82;
        v41 = (void *)v80;

        v92[0] = v80;
        v92[1] = v82;
        v42 = (void *)v32;
        v92[2] = v32;
        v92[3] = v39;
        v43 = +[NSArray arrayWithObjects:v92 count:4];

        +[NSLayoutConstraint activateConstraints:v43];
      }
      else
      {
        [(RAPWebBundleBaseMapViewController *)self startingCoordinateForMapPicker];
        double v15 = -[RAPWebBundleMapViewController initWithReport:coordinate:]([RAPWebBundleMapViewController alloc], "initWithReport:coordinate:", self->_report, v44, v45);
        v46 = [(RAPWebBundleMapViewController *)v15 view];
        [v46 setTranslatesAutoresizingMaskIntoConstraints:0];

        [(RAPWebBundleMapViewController *)v15 setDelegate:self];
        v47 = self->_mapViews;
        v48 = [(RAPWebBundleMapViewPosition *)v11 mapId];
        [(NSMutableDictionary *)v47 setObject:v15 forKeyedSubscript:v48];

        [(RAPWebBundleBaseMapViewController *)self addChildViewController:v15];
        v49 = [(RAPWebBundleBaseViewController *)self webView];
        v50 = [v49 scrollView];
        v51 = [(RAPWebBundleMapViewController *)v15 view];
        [v50 addSubview:v51];

        [(RAPWebBundleMapViewController *)v15 didMoveToParentViewController:self];
        v52 = [(RAPWebBundleMapViewController *)v15 view];
        v53 = [v52 heightAnchor];
        [(RAPWebBundleMapViewPosition *)v11 height];
        uint64_t v54 = [v53 constraintEqualToConstant:];

        v55 = [(RAPWebBundleMapViewController *)v15 view];
        v56 = [v55 topAnchor];
        v57 = [(RAPWebBundleBaseViewController *)self webView];
        v58 = [v57 scrollView];
        v59 = [v58 topAnchor];
        [(RAPWebBundleMapViewPosition *)v11 yPosition];
        uint64_t v83 = [v56 constraintEqualToAnchor:v59];

        v41 = (void *)v54;
        v60 = [(RAPWebBundleMapViewController *)v15 view];
        v61 = [v60 leadingAnchor];
        v62 = [(RAPWebBundleBaseViewController *)self webView];
        v63 = [v62 leadingAnchor];
        uint64_t v64 = [v61 constraintEqualToAnchor:v63];

        v65 = [(RAPWebBundleMapViewController *)v15 view];
        v66 = [v65 trailingAnchor];
        v67 = [(RAPWebBundleBaseViewController *)self webView];
        v68 = [v67 trailingAnchor];
        v39 = [v66 constraintEqualToAnchor:v68];

        v40 = (void *)v83;
        v93[0] = v41;
        v93[1] = v83;
        v42 = (void *)v64;
        v93[2] = v64;
        v93[3] = v39;
        v43 = +[NSArray arrayWithObjects:v93 count:4];
        +[NSLayoutConstraint activateConstraints:v43];
      }
      v69 = self->_mapViewConstraints;
      v70 = [(RAPWebBundleMapViewPosition *)v11 mapId];
      [(NSMutableDictionary *)v69 setObject:v43 forKeyedSubscript:v70];

      [(RAPWebBundleMapViewPosition *)v11 opacity];
      double v72 = v71;
      v73 = [(RAPWebBundleMapViewController *)v15 view];
      [v73 setAlpha:v72];

      v74 = [(RAPWebBundleMapViewController *)v15 view];
      [v74 layoutIfNeeded];

      [(RAPWebBundleMapViewPosition *)v86 height];
      [v41 setConstant:];
      [(RAPWebBundleMapViewPosition *)v86 yPosition];
      [v40 setConstant:];
      [(RAPWebBundleMapViewPosition *)v86 xPosition];
      v75 = v42;
      [v42 setConstant:];
      [(RAPWebBundleMapViewPosition *)v86 xPosition];
      [v39 setConstant:-v76];
      v77 = [(RAPWebBundleMapViewController *)v15 view];
      [v77 layoutIfNeeded];

      v89[0] = _NSConcreteStackBlock;
      v89[1] = 3221225472;
      v89[2] = sub_100501548;
      v89[3] = &unk_1012E5D58;
      v90 = v15;
      v91 = v86;
      v78 = v86;
      v79 = v15;
      +[UIView animateWithDuration:v89 animations:(double)(v85 / 1000)];
      [(RAPWebBundleMapViewController *)v79 setMapViewEnabled:1];

      id v10 = v87;
      id v7 = v88;
      id v4 = v84;
    }
  }
}

- (void)didReceiveMessageFromUserContentController:(id)a3 message:(id)a4 replyHandler:(id)a5
{
  id v8 = a4;
  v10.receiver = self;
  v10.super_class = (Class)RAPWebBundleBaseMapViewController;
  [(RAPWebBundleBaseViewController *)&v10 didReceiveMessageFromUserContentController:a3 message:v8 replyHandler:a5];
  objc_super v9 = [v8 objectForKeyedSubscript:@"name"];
  LODWORD(a3) = [v9 isEqualToString:@"updateMapPickerView"];

  if (a3) {
    [(RAPWebBundleBaseMapViewController *)self _updateMapViewWithUpdateMapPickerViewDictionary:v8];
  }
}

- (void)rapWebBundleMapViewController:(id)a3 marker:(id)a4 didUpdateLocationTo:(CLLocationCoordinate2D)a5
{
  double longitude = a5.longitude;
  double latitude = a5.latitude;
  id v37 = a3;
  id v8 = a4;
  id v35 = objc_alloc_init((Class)NSMutableDictionary);
  id v39 = objc_alloc_init((Class)NSMutableArray);
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  v36 = v8;
  id obj = [v8 featureHandles];
  id v9 = [obj countByEnumeratingWithState:&v41 objects:v47 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v42;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v42 != v11) {
          objc_enumerationMutation(obj);
        }
        double v13 = *(void **)(*((void *)&v41 + 1) + 8 * i);
        id v14 = objc_alloc_init((Class)NSMutableDictionary);
        double v15 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v13 featureIndex]);
        [v14 setObject:v15 forKeyedSubscript:@"featureIndex"];

        double v16 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v13 tileX]);
        [v14 setObject:v16 forKeyedSubscript:@"featureTileX"];

        double v17 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v13 tileY]);
        [v14 setObject:v17 forKeyedSubscript:@"featureTileY"];

        double v18 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v13 tileZ]);
        [v14 setObject:v18 forKeyedSubscript:@"featureTileZ"];

        v19 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v13 tileStyle]);
        [v14 setObject:v19 forKeyedSubscript:@"style"];

        v20 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", [v13 featureType]);
        [v14 setObject:v20 forKeyedSubscript:@"type"];

        v21 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", [v13 tileVersion]);
        [v14 setObject:v21 forKeyedSubscript:@"identifier"];

        [v39 addObject:v14];
      }
      id v10 = [obj countByEnumeratingWithState:&v41 objects:v47 count:16];
    }
    while (v10);
  }

  v22 = [(NSMutableDictionary *)self->_mapViews allKeysForObject:v37];
  v23 = [v22 firstObject];

  if (v23) {
    [v35 setObject:v23 forKeyedSubscript:@"id"];
  }
  v24 = +[NSNumber numberWithDouble:latitude];
  [v35 setObject:v24 forKeyedSubscript:@"latitude"];

  v25 = +[NSNumber numberWithDouble:longitude];
  [v35 setObject:v25 forKeyedSubscript:@"longitude"];

  [v35 setObject:v39 forKeyedSubscript:@"featureHandle"];
  v26 = [v36 name];
  [v35 setObject:v26 forKeyedSubscript:@"featureName"];

  id v40 = 0;
  v27 = +[NSJSONSerialization dataWithJSONObject:v35 options:0 error:&v40];
  id v28 = v40;
  if (![v27 length] || v28)
  {
    v29 = sub_1000B8184();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v46 = v28;
      _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_ERROR, "Error serializing json into string: %@", buf, 0xCu);
    }
  }
  id v30 = [objc_alloc((Class)NSString) initWithData:v27 encoding:4];
  v31 = +[NSString stringWithFormat:@"return rapSetMapPickerValue(%@)", v30];
  uint64_t v32 = [(RAPWebBundleBaseViewController *)self webView];
  v33 = +[WKContentWorld pageWorld];
  [v32 callAsyncJavaScript:v31 arguments:&__NSDictionary0__struct inFrame:0 inContentWorld:v33 completionHandler:&stru_1012ED688];
}

- (void)scrollViewWillBeginDragging:(id)a3
{
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v3 = [(NSMutableDictionary *)self->_mapViews allValues];
  id v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      id v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v8 + 1) + 8 * (void)v7) setMapViewEnabled:0];
        id v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      id v5 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
}

- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5
{
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v5 = [(NSMutableDictionary *)self->_mapViews allValues];
  id v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      long long v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        [*(id *)(*((void *)&v10 + 1) + 8 * (void)v9) setMapViewEnabled:1];
        long long v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mapViewConstraints, 0);
  objc_storeStrong((id *)&self->_mapViews, 0);

  objc_storeStrong((id *)&self->_report, 0);
}

@end