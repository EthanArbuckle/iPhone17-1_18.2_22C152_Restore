@interface MapsActivityViewController
- (GEOComposedRoute)route;
- (MapsActivityViewController)initWithShareItem:(id)a3;
- (MapsActivityViewControllerDelegate)mapsActivityDelegate;
- (SearchResult)searchResult;
- (id)airdropURLJSONForMapActivity:(id)a3;
- (id)annotationViewForMapActivity:(id)a3;
- (id)titleForMapActivity:(id)a3;
- (id)urlForMapActivity:(id)a3;
- (void)mapkitActivityViewController:(id)a3 postCompletedActivityOfType:(id)a4 completed:(BOOL)a5;
- (void)setMapsActivityDelegate:(id)a3;
- (void)setRoute:(id)a3;
- (void)setSearchResult:(id)a3;
@end

@implementation MapsActivityViewController

- (MapsActivityViewController)initWithShareItem:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)MapsActivityViewController;
  v5 = [(MapsActivityViewController *)&v16 initWithShareItem:v4];
  if (v5)
  {
    if (qword_10160F0D8 != -1) {
      dispatch_once(&qword_10160F0D8, &stru_1012EEDC8);
    }
    v6 = (void *)qword_10160F0D0;
    if (os_log_type_enabled((os_log_t)qword_10160F0D0, OS_LOG_TYPE_INFO))
    {
      v7 = v6;
      v8 = [v4 searchResult];
      v9 = [v4 route];
      v10 = [v9 uniqueRouteID];
      *(_DWORD *)buf = 134349826;
      v18 = v5;
      __int16 v19 = 2112;
      id v20 = v4;
      __int16 v21 = 2112;
      v22 = v8;
      __int16 v23 = 2112;
      v24 = v10;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "[%{public}p] Initializing with share item: %@ search result: %@ route: %@", buf, 0x2Au);
    }
    uint64_t v11 = [v4 searchResult];
    searchResult = v5->_searchResult;
    v5->_searchResult = (SearchResult *)v11;

    uint64_t v13 = [v4 route];
    route = v5->_route;
    v5->_route = (GEOComposedRoute *)v13;

    [v4 setActivityProviderDelegate:v5];
    [(MapsActivityViewController *)v5 setActivityControllerDelegate:v5];
  }

  return v5;
}

- (void)mapkitActivityViewController:(id)a3 postCompletedActivityOfType:(id)a4 completed:(BOOL)a5
{
  BOOL v5 = a5;
  id v7 = a4;
  v8 = [(MapsActivityViewController *)self mapsActivityDelegate];
  char v9 = objc_opt_respondsToSelector();

  if (v9)
  {
    v10 = [(MapsActivityViewController *)self mapsActivityDelegate];
    [v10 mapsActivityViewController:self activityCompleted:1];
  }
  if ([v7 isEqualToString:UIActivityTypePrint])
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10055C640;
    block[3] = &unk_1012E5D08;
    block[4] = self;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  }
  else if (+[SendToRoutingAppActivity isActivityForType:v7])
  {
    uint64_t v11 = [(MapsActivityViewController *)self mapsActivityDelegate];
    char v12 = objc_opt_respondsToSelector();

    if (v12)
    {
      uint64_t v13 = [(MapsActivityViewController *)self mapsActivityDelegate];
      [v13 mapsActivityViewControllerPresentRoutingApps:self];
    }
  }
  v14 = +[MKMapService sharedService];
  v15 = v14;
  if (v5) {
    uint64_t v16 = 17;
  }
  else {
    uint64_t v16 = 4;
  }
  [v14 captureUserAction:v16 onTarget:622 eventValue:v7];
}

- (id)annotationViewForMapActivity:(id)a3
{
  id v4 = [(MapsActivityViewController *)self searchResult];
  unsigned int v5 = [v4 type];

  if (v5 == 4)
  {
    v6 = (MapsActivityAnnotation *)objc_alloc_init((Class)MKUserLocation);
    id v7 = [(MapsActivityViewController *)self searchResult];
    [v7 coordinate];
    -[MapsActivityAnnotation setCoordinate:](v6, "setCoordinate:");

    id v8 = [objc_alloc((Class)_MKUserLocationView) initWithAnnotation:v6 reuseIdentifier:0];
  }
  else
  {
    char v9 = [MapsActivityAnnotation alloc];
    v10 = [(MapsActivityViewController *)self searchResult];
    v6 = [(MapsActivityAnnotation *)v9 initWithSearchResult:v10];

    id v8 = [objc_alloc((Class)MKMarkerAnnotationView) initWithAnnotation:v6 reuseIdentifier:0];
    [v8 setHidden:0];
  }

  return v8;
}

- (id)urlForMapActivity:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    unsigned int v5 = [(MapsActivityViewController *)self searchResult];
    v6 = [(MapsActivityViewController *)self mapsActivityDelegate];
    id v7 = [v6 mapsActivityMapView];
    id v8 = [v5 mapsURLfromMapView:v7];
    char v9 = +[NSURL URLWithString:v8];
  }
  else
  {
    char v9 = 0;
  }

  return v9;
}

- (id)titleForMapActivity:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
    uint64_t v11 = [(MapsActivityViewController *)self searchResult];
    unsigned int v12 = [v11 type];
    id v9 = [v11 title];

    if (v12 != 4) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v13 = +[AddressBookManager sharedManager];
    v14 = [v13 meCard];

    v15 = +[CNContactFormatter stringFromContact:v14 style:0];
    uint64_t v16 = +[NSBundle mainBundle];
    if (v15)
    {
      v17 = [v16 localizedStringForKey:@"Person_Name_Location_Activity_Controller" value:@"localized string not found" table:0];
      v10 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v17, v15);
    }
    else
    {
      v10 = [v16 localizedStringForKey:@"Shared Location" value:@"localized string not found" table:0];
    }

    goto LABEL_9;
  }
  v6 = [(MapsActivityViewController *)self route];
  id v7 = [v6 destination];

  unsigned __int8 v8 = [v7 isCurrentLocation];
  id v9 = [v7 navDisplayName];

  if (v8) {
    goto LABEL_5;
  }
LABEL_3:
  id v9 = v9;
  v10 = v9;
LABEL_9:

  return v10;
}

- (id)airdropURLJSONForMapActivity:(id)a3
{
  id v4 = a3;
  unsigned int v5 = [(MapsActivityViewController *)self searchResult];
  unsigned int v6 = [v5 type];

  if (v6 == 4)
  {
    id v7 = &off_1013AEBF0;
  }
  else
  {
    unsigned __int8 v8 = [(MapsActivityViewController *)self searchResult];
    unsigned int v9 = [v8 type];

    if (v9 == 3)
    {
      id v7 = &off_1013AEC18;
    }
    else
    {
      v12[0] = @"SFAirDropActivitySubjectMain";
      v10 = [(MapsActivityViewController *)self titleForMapActivity:v4];
      v12[1] = @"SFAirDropActivitySubjectMapsLinkType";
      v13[0] = v10;
      v13[1] = &off_1013A77C8;
      id v7 = +[NSDictionary dictionaryWithObjects:v13 forKeys:v12 count:2];
    }
  }

  return v7;
}

- (MapsActivityViewControllerDelegate)mapsActivityDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_mapsActivityDelegate);

  return (MapsActivityViewControllerDelegate *)WeakRetained;
}

- (void)setMapsActivityDelegate:(id)a3
{
}

- (SearchResult)searchResult
{
  return self->_searchResult;
}

- (void)setSearchResult:(id)a3
{
}

- (GEOComposedRoute)route
{
  return self->_route;
}

- (void)setRoute:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_route, 0);
  objc_storeStrong((id *)&self->_searchResult, 0);

  objc_destroyWeak((id *)&self->_mapsActivityDelegate);
}

@end