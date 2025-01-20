@interface _MKHandlerURLHandlingTask
- ($04D47FADD0355EF96E203C25856C2375)regionForLaunchOptions:(SEL)a3 andMapItems:(id)a4;
- (BOOL)URLHandler:(id)a3 enterLookAroundWithLocationQueryItem:(id)a4;
- (BOOL)URLHandler:(id)a3 enterLookAroundWithViewState:(id)a4;
- (BOOL)URLHandler:(id)a3 initiateOfflineDownloadForRegion:(id)a4 displayName:(id)a5;
- (BOOL)URLHandler:(id)a3 launchIntoDirectionsWithMapItems:(id)a4 options:(id)a5 context:(id)a6;
- (BOOL)URLHandler:(id)a3 launchIntoPhotoThumbnailGalleryForMapItem:(id)a4 albumIndex:(unint64_t)a5 options:(id)a6 context:(id)a7;
- (BOOL)URLHandler:(id)a3 launchIntoRAPForMapItem:(id)a4 options:(id)a5 context:(id)a6;
- (BOOL)URLHandler:(id)a3 launchIntoSearchWithMapItems:(id)a4 options:(id)a5 context:(id)a6;
- (BOOL)URLHandler:(id)a3 launchIntoShowMapItems:(id)a4 options:(id)a5 context:(id)a6;
- (BOOL)URLHandler:(id)a3 launchIntoTableBookingForMapItem:(id)a4 options:(id)a5 context:(id)a6;
- (BOOL)URLHandler:(id)a3 launchIntoTesterWithParam:(id)a4;
- (BOOL)URLHandler:(id)a3 launchWithOptions:(id)a4;
- (BOOL)URLHandler:(id)a3 search:(id)a4 at:(CLLocationCoordinate2D)a5;
- (BOOL)URLHandler:(id)a3 setContentProvider:(id)a4;
- (BOOL)URLHandler:(id)a3 setMapType:(unint64_t)a4;
- (BOOL)URLHandler:(id)a3 setRegion:(id *)a4;
- (BOOL)URLHandler:(id)a3 setRegionWithCamera:(id *)a4 pitch:(double)a5 yaw:(double)a6;
- (BOOL)URLHandler:(id)a3 setRegionWithCenter:(CLLocationCoordinate2D)a4;
- (BOOL)URLHandler:(id)a3 setRegionWithCenter:(CLLocationCoordinate2D)a4 altitude:(double)a5;
- (BOOL)URLHandler:(id)a3 setRegionWithCenter:(CLLocationCoordinate2D)a4 zoomLevel:(double)a5;
- (BOOL)URLHandler:(id)a3 setRegionWithCenterAndCamera:(CLLocationCoordinate2D)a4 altitude:(double)a5 pitch:(double)a6 yaw:(double)a7;
- (BOOL)URLHandler:(id)a3 setRegionWithCenterAndCamera:(CLLocationCoordinate2D)a4 zoomLevel:(double)a5 pitch:(double)a6 yaw:(double)a7;
- (BOOL)URLHandler:(id)a3 setSchemeForCapture:(id)a4 sourceApplication:(id)a5 isLaunchedFromTTL:(BOOL)a6 ttlEventTime:(id)a7;
- (BOOL)URLHandler:(id)a3 setShowTraffic:(BOOL)a4;
- (BOOL)URLHandler:(id)a3 setUserTrackingMode:(int64_t)a4;
- (BOOL)URLHandler:(id)a3 showAddress:(id)a4 label:(id)a5;
- (BOOL)URLHandler:(id)a3 showAddress:(id)a4 label:(id)a5 at:(CLLocationCoordinate2D)a6;
- (BOOL)URLHandler:(id)a3 showAddressByCNContactIdentifier:(id)a4 addressIdentifier:(id)a5;
- (BOOL)URLHandler:(id)a3 showAddressByRecordID:(id)a4 addressID:(id)a5;
- (BOOL)URLHandler:(id)a3 showCollection:(id)a4;
- (BOOL)URLHandler:(id)a3 showCuratedCollectionWithID:(unint64_t)a4 resultProviderID:(int)a5;
- (BOOL)URLHandler:(id)a3 showDirectionsFrom:(id)a4 to:(id)a5 using:(unint64_t)a6 directionsOptions:(id)a7;
- (BOOL)URLHandler:(id)a3 showDirectionsFrom:(id)a4 to:(id)a5 using:(unint64_t)a6 muid:(unint64_t)a7 providerId:(int)a8 showLabel:(id)a9 directionsOptions:(id)a10;
- (BOOL)URLHandler:(id)a3 showDirectionsFrom:(id)a4 toDestinations:(id)a5 using:(unint64_t)a6 directionsOptions:(id)a7;
- (BOOL)URLHandler:(id)a3 showExternalBusinessID:(id)a4 ofContentProvider:(id)a5;
- (BOOL)URLHandler:(id)a3 showFavoritesType:(int64_t)a4;
- (BOOL)URLHandler:(id)a3 showLabel:(id)a4 at:(CLLocationCoordinate2D)a5;
- (BOOL)URLHandler:(id)a3 showLineWithID:(unint64_t)a4 name:(id)a5;
- (BOOL)URLHandler:(id)a3 showMUID:(unint64_t)a4 resultProviderID:(int)a5 coordinate:(CLLocationCoordinate2D)a6 query:(id)a7;
- (BOOL)URLHandler:(id)a3 showMapItem:(id)a4 label:(id)a5 at:(CLLocationCoordinate2D)a6;
- (BOOL)URLHandler:(id)a3 showMapWithoutPinAt:(CLLocationCoordinate2D)a4;
- (BOOL)URLHandler:(id)a3 showPublisherWithID:(unint64_t)a4 resultProviderID:(int)a5;
- (BOOL)URLHandler:(id)a3 showReportAProblemWithLocationQuery:(id)a4;
- (BOOL)URLHandlerShouldPerformForwardGeocoding:(id)a3;
- (BOOL)URLHandlerShouldPerformRefinementRequest:(id)a3;
- (BOOL)URLHandlerShouldPerformReverseGeocoding:(id)a3;
- (BOOL)URLHandlerShowAllCuratedCollections:(id)a3;
- (BOOL)URLHandlerShowCarDestinations:(id)a3;
- (BOOL)URLHandlerShowMyLocationCard:(id)a3;
- (BOOL)URLHandlerShowParkedCar:(id)a3;
- (BOOL)URLHandlerShowReports:(id)a3;
- (BOOL)_URLHandler:(id)a3 addFindMyStopWithHandleIdentifier:(id)a4 coordinate:(id)a5;
- (BOOL)_URLHandler:(id)a3 addStopWithMapItem:(id)a4;
- (BOOL)_shouldAddStopWithLaunchOptions:(id)a3 requireLaunchIntoNavOrDirectionsModeOption:(BOOL)a4 requireSearchAlongRouteOption:(BOOL)a5;
- (BOOL)isCompatibleWithNavigation;
- (BOOL)shouldResetUI;
- (id)displayOptions;
- (id)mapsActivity;
- (void)URLHandler:(id)a3 didFinishAsynchronousHandlingWithError:(id)a4;
- (void)URLHandlerWillStartAsynchronousHandling:(id)a3;
- (void)_createRichMapsActivity;
- (void)_processMKOptions:(id)a3;
- (void)_sendWidgetAnalytics;
- (void)performTask;
- (void)taskFailed;
- (void)taskFinished:(id)a3;
@end

@implementation _MKHandlerURLHandlingTask

- (id)mapsActivity
{
  mapsActivity = self->_mapsActivity;
  if (!mapsActivity)
  {
    v4 = objc_alloc_init(MapsActivity);
    v5 = self->_mapsActivity;
    self->_mapsActivity = v4;

    mapsActivity = self->_mapsActivity;
  }

  return mapsActivity;
}

- (id)displayOptions
{
  v3 = [(_MKHandlerURLHandlingTask *)self mapsActivity];
  unsigned __int8 v4 = [v3 hasDisplayOptions];

  if ((v4 & 1) == 0)
  {
    id v5 = objc_alloc_init((Class)GEOURLOptions);
    v6 = [(_MKHandlerURLHandlingTask *)self mapsActivity];
    [v6 setDisplayOptions:v5];
  }
  v7 = [(_MKHandlerURLHandlingTask *)self mapsActivity];
  v8 = [v7 displayOptions];

  return v8;
}

- (void)performTask
{
  [(RichMapsActivityCreatingTaskImpl *)self taskStarted];
  uint64_t v3 = [(URLHandlingTask *)self url];
  if (v3)
  {
    unsigned __int8 v4 = (void *)v3;
    id v5 = [(URLHandlingTask *)self url];
    if (+[GEOURLBackedMapItem urlContainsExtraStorage:v5])
    {
      v6 = [(URLHandlingTask *)self url];
      v7 = +[MKMapItem _mapItemBackedByURL:v6];

      if (v7)
      {
        v16 = v7;
        v8 = +[NSArray arrayWithObjects:&v16 count:1];
        v9 = [(URLHandlingTask *)self mkOptions];
        [(_MKHandlerURLHandlingTask *)self URLHandler:0 launchIntoSearchWithMapItems:v8 options:v9 context:self->_urlContext];

        goto LABEL_7;
      }
    }
    else
    {
    }
  }
  v10 = (_MKURLHandler *)objc_alloc_init((Class)_MKURLHandler);
  urlHandler = self->_urlHandler;
  self->_urlHandler = v10;

  [(_MKURLHandler *)self->_urlHandler setDelegate:self];
  v12 = [(URLHandlingTask *)self mkOptions];
  [(_MKHandlerURLHandlingTask *)self URLHandler:0 launchWithOptions:v12];

  v13 = self->_urlHandler;
  v14 = [(URLHandlingTask *)self url];
  v15 = [(URLHandlingTask *)self sourceApplication];
  [(_MKURLHandler *)v13 handleURL:v14 sourceApplication:v15 context:self->_urlContext];

LABEL_7:
  if (!self->_asyncTaskInProgress) {
    [(_MKHandlerURLHandlingTask *)self _createRichMapsActivity];
  }
}

- (void)taskFinished:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)_MKHandlerURLHandlingTask;
  [(URLHandlingTask *)&v4 taskFinished:a3];
  [(_MKHandlerURLHandlingTask *)self _sendWidgetAnalytics];
}

- (void)taskFailed
{
  v3.receiver = self;
  v3.super_class = (Class)_MKHandlerURLHandlingTask;
  [(URLHandlingTask *)&v3 taskFailed];
  [(_MKHandlerURLHandlingTask *)self _sendWidgetAnalytics];
}

- (void)_createRichMapsActivity
{
  if (!self->_asyncTaskInProgress && !self->_taskFinished)
  {
    objc_super v3 = sub_1000A930C();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      int v18 = 138412290;
      v19 = self;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "URLHandlingTask _createRichMapsActivity %@", (uint8_t *)&v18, 0xCu);
    }

    if (self->_currentError)
    {
      objc_super v4 = +[NSBundle mainBundle];
      id v5 = [v4 localizedStringForKey:@"Error Title URL" value:@"localized string not found" table:0];

      v6 = +[NSBundle mainBundle];
      v7 = [v6 localizedStringForKey:@"Error Message URL" value:@"localized string not found" table:0];

      v8 = [[ErrorAction alloc] initWithTitle:v5 message:v7 options:0];
      currentAction = self->_currentAction;
      self->_currentAction = &v8->super;
    }
    if (!self->_currentAction)
    {
      if (!self->_mapsActivity)
      {
        [(_MKHandlerURLHandlingTask *)self taskFailed];
        return;
      }
      v10 = [(URLHandlingTask *)self sourceApplication];
      if ([v10 isEqualToString:@"com.apple.AssistantServices"])
      {

        v11 = &off_1012D45D0;
      }
      else
      {
        v12 = [(URLHandlingTask *)self sourceApplication];
        unsigned int v13 = [v12 isEqualToString:@"com.apple.WorkflowKit.BackgroundShortcutRunner"];

        v11 = &off_1012D4AE8;
        if (v13) {
          v11 = &off_1012D45D0;
        }
      }
      v14 = [objc_alloc(*v11) initWithResetUI:[self shouldResetUI] compatibleWithNavigation:[self isCompatibleWithNavigation]];
      v15 = self->_currentAction;
      self->_currentAction = v14;
    }
    if (self->_needsUserLocation) {
      [(MapsAction *)self->_currentAction setUserLocationAccuracy:self->_userLocationDesiredAccuracy];
    }
    v16 = [[RichMapsActivity alloc] initWithMapsActivity:self->_mapsActivity mapsAction:self->_currentAction];
    mapsActivity = self->_mapsActivity;
    self->_mapsActivity = 0;

    [(_MKHandlerURLHandlingTask *)self taskFinished:v16];
    self->_taskFinished = 1;
  }
}

- (BOOL)shouldResetUI
{
  mapsActivity = self->_mapsActivity;
  if (mapsActivity && !self->_currentAction && !self->_needsUserLocation && !self->_currentError)
  {
    v6 = [(MapsActivity *)mapsActivity dictionaryRepresentation];
    v7 = [v6 allKeys];
    if ([v7 count] == (id)1)
    {
      v8 = [v6 objectForKeyedSubscript:@"displayOptions"];

      if (!v8) {
        goto LABEL_14;
      }
      v7 = [(MapsActivity *)self->_mapsActivity displayOptions];
      v9 = [v7 dictionaryRepresentation];
      v10 = [v9 allKeys];
      if ([v10 count] == (id)1)
      {
        v11 = [v9 objectForKeyedSubscript:@"enableTraffic"];
        if (v11)
        {

LABEL_17:
          BOOL v4 = 0;
          goto LABEL_15;
        }
        v12 = [v9 objectForKeyedSubscript:@"mapType"];

        if (v12) {
          goto LABEL_17;
        }
LABEL_14:
        BOOL v4 = 1;
LABEL_15:

        return v4;
      }
    }
    goto LABEL_14;
  }
  return 1;
}

- (BOOL)isCompatibleWithNavigation
{
  mapsActivity = self->_mapsActivity;
  if (mapsActivity)
  {
    BOOL v4 = [(MapsActivity *)mapsActivity dictionaryRepresentation];
    id v5 = [v4 allKeys];
    if ([v5 count])
    {
      v6 = [v4 objectForKeyedSubscript:@"displayOptions"];

      if (!v6) {
        goto LABEL_10;
      }
      id v5 = [(MapsActivity *)self->_mapsActivity displayOptions];
      v7 = [v5 dictionaryRepresentation];
      v8 = [v7 allKeys];
      if ([v8 count])
      {
        v9 = [v7 objectForKeyedSubscript:@"userTrackingMode"];

        if (v9)
        {
          BOOL v10 = 1;
LABEL_11:

          return v10;
        }
LABEL_10:
        BOOL v10 = 0;
        goto LABEL_11;
      }
    }
    goto LABEL_10;
  }
  return 0;
}

- (void)_sendWidgetAnalytics
{
  objc_super v3 = [(URLHandlingTask *)self sourceApplication];
  unsigned int v4 = [v3 isEqualToString:@"com.apple.Maps.GeneralMapsWidget"];

  if (v4)
  {
    uint64_t analyticsAction = self->_analyticsAction;
    uint64_t analyticsTarget = self->_analyticsTarget;
    analyticsValue = self->_analyticsValue;
    +[GEOAPPortal captureUserAction:analyticsAction target:analyticsTarget value:analyticsValue];
  }
}

- (void)_processMKOptions:(id)a3
{
  id v4 = a3;
  id v5 = sub_1000A930C();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v91 = 138412290;
    id v92 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "URLHandlingTask mkOptions %@", (uint8_t *)&v91, 0xCu);
  }

  self->_mkOptionsParsed = 1;
  if (v4)
  {
    v6 = [v4 objectForKeyedSubscript:@"MKURLContext"];

    if (v6)
    {
      v7 = [v4 objectForKeyedSubscript:@"MKURLContext"];
      urlContext = self->_urlContext;
      self->_urlContext = v7;
    }
    v9 = [v4 objectForKeyedSubscript:MKLaunchOptionsLaunchIntoSearchHomeKey];

    if (v9)
    {
      BOOL v10 = objc_alloc_init(PresentNearbySearchAction);
      currentAction = self->_currentAction;
      self->_currentAction = &v10->super;
    }
    v12 = [v4 objectForKeyedSubscript:MKLaunchOptionsLaunchIntoNavOverviewKey];
    if (v12)
    {

      uint64_t v13 = MKLaunchOptionsLaunchIntoNavDetailKey;
    }
    else
    {
      uint64_t v13 = MKLaunchOptionsLaunchIntoNavDetailKey;
      v14 = [v4 objectForKeyedSubscript:MKLaunchOptionsLaunchIntoNavDetailKey];

      if (!v14)
      {
LABEL_12:
        v19 = [v4 objectForKeyedSubscript:MKLaunchOptionsLaunchIntoNavShareETAKey];

        if (v19)
        {
          v20 = objc_alloc_init(PresentNavShareETAAction);
          v21 = self->_currentAction;
          self->_currentAction = &v20->super;
        }
        uint64_t v22 = MKLaunchOptionsCameraAltitudeMultiplierKey;
        v23 = [v4 objectForKeyedSubscript:MKLaunchOptionsCameraAltitudeMultiplierKey];

        if (v23)
        {
          v24 = [ZoomMapAction alloc];
          v25 = [v4 objectForKeyedSubscript:v22];
          [v25 doubleValue];
          v26 = -[ZoomMapAction initWithZoomFactor:](v24, "initWithZoomFactor:");
          v27 = self->_currentAction;
          self->_currentAction = v26;
        }
        uint64_t v28 = MKLaunchOptionsLaunchIntoKeyboardKey;
        v29 = [v4 objectForKeyedSubscript:MKLaunchOptionsLaunchIntoKeyboardKey];

        if (v29)
        {
          v30 = [ShowKeyboardAction alloc];
          v31 = [v4 objectForKeyedSubscript:v28];
          v32 = -[ShowKeyboardAction initWithInteractionModel:](v30, "initWithInteractionModel:", [v31 unsignedIntegerValue]);
          v33 = self->_currentAction;
          self->_currentAction = v32;
        }
        uint64_t v34 = MKLaunchOptionsLaunchIntoNavTraceKey;
        v35 = [v4 objectForKeyedSubscript:MKLaunchOptionsLaunchIntoNavTraceKey];

        if (v35)
        {
          v36 = [v4 objectForKeyedSubscript:v34];
          v37 = +[MNFilePaths navTracesDirectoryPath];
          v38 = [v37 stringByAppendingPathComponent:v36];
          v39 = +[MNFilePaths navTraceExtension];
          v40 = [v38 stringByAppendingPathExtension:v39];

          uint64_t v41 = MKLaunchOptionsLaunchIntoNavTraceStartNavKey;
          v42 = [v4 objectForKeyedSubscript:MKLaunchOptionsLaunchIntoNavTraceStartNavKey];

          if (v42)
          {
            v43 = [v4 objectForKeyedSubscript:v41];
            BOOL v44 = v43 != 0;
          }
          else
          {
            BOOL v44 = 0;
          }
          v45 = sub_1000A930C();
          if (os_log_type_enabled(v45, OS_LOG_TYPE_INFO))
          {
            int v91 = 138412290;
            id v92 = v40;
            _os_log_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_INFO, "URLHandlingTask OpenTraceAction: %@", (uint8_t *)&v91, 0xCu);
          }

          v46 = [[OpenTraceAction alloc] initWithFilePath:v40 shouldStartNav:v44];
          v47 = self->_currentAction;
          self->_currentAction = &v46->super;
        }
        v48 = [v4 objectForKeyedSubscript:MKLaunchOptionsCameraKey];

        if (v48)
        {
          v49 = [v4 objectForKeyedSubscript:MKLaunchOptionsCameraKey];
          v50 = [v49 geoCamera];
          v51 = [(_MKHandlerURLHandlingTask *)self displayOptions];
          [v51 setCamera:v50];
        }
        v52 = +[MNNavigationService sharedService];
        [v52 state];
        int IsNavigating = MNNavigationServiceStateIsNavigating();

        if (IsNavigating)
        {
          if ((MapsFeature_IsEnabled_DrivingMultiWaypointRoutes() & 1) != 0
            || (MapsFeature_IsEnabled_Maps420() & 1) != 0)
          {
            char IsEnabled_Maps182 = 1;
          }
          else
          {
            char IsEnabled_Maps182 = MapsFeature_IsEnabled_Maps182();
          }
        }
        else
        {
          char IsEnabled_Maps182 = 0;
        }
        self->_searchAlongRoute = IsEnabled_Maps182;
        uint64_t v55 = _MKLaunchOptionsSearchAlongRouteKey;
        v56 = [v4 objectForKeyedSubscript:_MKLaunchOptionsSearchAlongRouteKey];

        if (v56)
        {
          if (self->_searchAlongRoute)
          {
            self->_searchAlongRoute = 1;
          }
          else
          {
            v57 = [v4 objectForKeyedSubscript:v55];
            self->_searchAlongRoute = [v57 BOOLValue];
          }
        }
        uint64_t v58 = _MKLaunchOptionsRoutingAvoidHighwaysKey;
        v59 = [v4 objectForKeyedSubscript:_MKLaunchOptionsRoutingAvoidHighwaysKey];

        if (v59)
        {
          v60 = [v4 objectForKeyedSubscript:v58];
          routeAvoidHighways = self->_routeAvoidHighways;
          self->_routeAvoidHighways = v60;
        }
        uint64_t v62 = _MKLaunchOptionsRoutingAvoidTollsKey;
        v63 = [v4 objectForKeyedSubscript:_MKLaunchOptionsRoutingAvoidTollsKey];

        if (v63)
        {
          v64 = [v4 objectForKeyedSubscript:v62];
          routeAvoidTolls = self->_routeAvoidTolls;
          self->_routeAvoidTolls = v64;
        }
        uint64_t v66 = MKLaunchOptionsTimePointKey;
        v67 = [v4 objectForKeyedSubscript:MKLaunchOptionsTimePointKey];

        if (v67)
        {
          v68 = [v4 objectForKeyedSubscript:v66];
          timePoint = self->_timePoint;
          self->_timePoint = v68;
        }
        uint64_t v70 = MKLaunchOptionsMapRadiusInMetersKey;
        v71 = [v4 objectForKeyedSubscript:MKLaunchOptionsMapRadiusInMetersKey];

        if (v71)
        {
          v72 = [v4 objectForKeyedSubscript:v70];
          radiusInMeter = self->_radiusInMeter;
          self->_radiusInMeter = v72;
        }
        uint64_t v74 = MKLaunchOptionsSearchTermsKey;
        v75 = [v4 objectForKeyedSubscript:MKLaunchOptionsSearchTermsKey];

        if (v75)
        {
          v76 = [v4 objectForKeyedSubscript:v74];
          searchTerm = self->_searchTerm;
          self->_searchTerm = v76;
        }
        uint64_t v78 = MKLaunchOptionsReferralIdentifierKey;
        v79 = [v4 objectForKeyedSubscript:MKLaunchOptionsReferralIdentifierKey];

        if (v79)
        {
          v80 = [v4 objectForKeyedSubscript:v78];
          [(URLHandlingTask *)self setSourceApplication:v80];
        }
        uint64_t v81 = MKLaunchOptionsAnalyticsActionKey;
        v82 = [v4 objectForKeyedSubscript:MKLaunchOptionsAnalyticsActionKey];

        if (v82)
        {
          v83 = [v4 objectForKeyedSubscript:v81];
          self->_uint64_t analyticsAction = [v83 unsignedIntegerValue];
        }
        uint64_t v84 = MKLaunchOptionsAnalyticsTargetKey;
        v85 = [v4 objectForKeyedSubscript:MKLaunchOptionsAnalyticsTargetKey];

        if (v85)
        {
          v86 = [v4 objectForKeyedSubscript:v84];
          self->_uint64_t analyticsTarget = [v86 unsignedIntegerValue];
        }
        uint64_t v87 = MKLaunchOptionsAnalyticsValueKey;
        v88 = [v4 objectForKeyedSubscript:MKLaunchOptionsAnalyticsValueKey];

        if (v88)
        {
          v89 = [v4 objectForKeyedSubscript:v87];
          analyticsValue = self->_analyticsValue;
          self->_analyticsValue = v89;
        }
        goto LABEL_54;
      }
    }
    v15 = [DisplayModeNavAction alloc];
    v16 = [v4 objectForKeyedSubscript:v13];
    v17 = [(DisplayModeNavAction *)v15 initWithShowDetails:v16 != 0];
    int v18 = self->_currentAction;
    self->_currentAction = v17;

    goto LABEL_12;
  }
LABEL_54:
}

- (BOOL)URLHandlerShouldPerformRefinementRequest:(id)a3
{
  return 0;
}

- (BOOL)URLHandlerShouldPerformReverseGeocoding:(id)a3
{
  return 0;
}

- (BOOL)URLHandlerShouldPerformForwardGeocoding:(id)a3
{
  return 0;
}

- (void)URLHandlerWillStartAsynchronousHandling:(id)a3
{
  id v4 = sub_1000A930C();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    int v5 = 138412290;
    v6 = self;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "URLHandlingTask URLHandlerStartAsynchonousTask %@", (uint8_t *)&v5, 0xCu);
  }

  self->_asyncTaskInProgress = 1;
}

- (void)URLHandler:(id)a3 didFinishAsynchronousHandlingWithError:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    v8 = sub_1000A930C();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      int v10 = 138412546;
      v11 = self;
      __int16 v12 = 2112;
      id v13 = v7;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "URLHandlingTask %@ error %@", (uint8_t *)&v10, 0x16u);
    }

    objc_storeStrong((id *)&self->_currentError, a4);
  }
  v9 = sub_1000A930C();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    int v10 = 138412290;
    v11 = self;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "URLHandlingTask URLHandlerFinishedAsynchonousTask %@", (uint8_t *)&v10, 0xCu);
  }

  self->_asyncTaskInProgress = 0;
  [(_MKHandlerURLHandlingTask *)self _createRichMapsActivity];
}

- (BOOL)URLHandler:(id)a3 launchWithOptions:(id)a4
{
  return 1;
}

- (BOOL)URLHandler:(id)a3 setSchemeForCapture:(id)a4 sourceApplication:(id)a5 isLaunchedFromTTL:(BOOL)a6 ttlEventTime:(id)a7
{
  BOOL v7 = a6;
  id v9 = a7;
  int v10 = sub_1000A930C();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)__int16 v12 = 0;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "URLHandlingTask setSchemeForCapture", v12, 2u);
  }

  [(URLHandlingTask *)self setLaunchedFromTTL:v7];
  [(URLHandlingTask *)self setTtlEventTime:v9];

  return 1;
}

- (BOOL)URLHandler:(id)a3 setContentProvider:(id)a4
{
  id v5 = a4;
  id v6 = sub_1000A930C();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)int v10 = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "URLHandlingTask setContentProvider", v10, 2u);
  }

  BOOL v7 = (NSString *)[v5 copy];
  contentProvider = self->_contentProvider;
  self->_contentProvider = v7;

  return 1;
}

- (BOOL)URLHandler:(id)a3 launchIntoDirectionsWithMapItems:(id)a4 options:(id)a5 context:(id)a6
{
  id v70 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  [(_MKHandlerURLHandlingTask *)self _processMKOptions:v11];
  if ([v10 count])
  {
    id v13 = [v10 indexOfObjectPassingTest:&stru_1012F1870];
    v71 = [v11 objectForKey:_MKLaunchOptionsFindMyHandleIdentifiersKey];
    if ([v71 count]) {
      uint64_t v14 = MapsFeature_IsEnabled_MapsWally() ^ 1;
    }
    else {
      uint64_t v14 = 1;
    }
    if (v13 != (id)0x7FFFFFFFFFFFFFFFLL
      || ![(_MKHandlerURLHandlingTask *)self _shouldAddStopWithLaunchOptions:v11 requireLaunchIntoNavOrDirectionsModeOption:1 requireSearchAlongRouteOption:v14])
    {
      v25 = sub_1000A930C();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412546;
        *(void *)&buf[4] = v10;
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v11;
        _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEBUG, "URLHandlingTask launchIntoDirectionsWithMapItems %@ %@", buf, 0x16u);
      }

      id v26 = objc_alloc_init((Class)NSMutableArray);
      *(void *)buf = 0;
      *(void *)&buf[8] = buf;
      *(void *)&buf[16] = 0x2020000000;
      LOBYTE(v77) = 0;
      if ([v10 count] == (id)1)
      {
        *(unsigned char *)(*(void *)&buf[8] + 24) = 1;
        id v27 = [objc_alloc((Class)GEOComposedWaypoint) initWithLocation:0 isCurrentLocation:1];
        [v26 addObject:v27];
      }
      v72[0] = _NSConcreteStackBlock;
      v72[1] = 3221225472;
      v72[2] = sub_1005DC76C;
      v72[3] = &unk_1012F1898;
      id v28 = v26;
      id v73 = v28;
      v75 = buf;
      id v74 = v71;
      [v10 enumerateObjectsUsingBlock:v72];
      v29 = objc_alloc_init(DirectionsPlan);
      id v30 = objc_alloc_init((Class)GEOStorageRouteRequestStorage);
      [(DirectionsPlan *)v29 setRouteRequestStorage:v30];

      v31 = [(DirectionsPlan *)v29 routeRequestStorage];
      [v31 setWaypoints:v28];

      v32 = [v28 lastObject];
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();

      if (isKindOfClass)
      {
        uint64_t v34 = [v28 lastObject];
        v35 = [v34 route];
        v36 = [v35 persistentData];
        v37 = [(DirectionsPlan *)v29 routeRequestStorage];
        [v37 setDestinationRouteData:v36];
      }
      v38 = [v11 objectForKeyedSubscript:MKLaunchOptionsDirectionsModeKey];

      if (v38)
      {
        v39 = [v11 objectForKeyedSubscript:MKLaunchOptionsDirectionsModeKey];
        if (([v39 isEqualToString:MKLaunchOptionsDirectionsModeDefault] & 1) == 0)
        {
          if (([v39 isEqualToString:MKLaunchOptionsDirectionsModeWalking] & 1) != 0
            || ([v39 isEqualToString:MKLaunchOptionsDirectionsModeRoutingApps] & 1) != 0)
          {
            uint64_t v40 = 2;
          }
          else if ([v39 isEqualToString:MKLaunchOptionsDirectionsModeTransit])
          {
            uint64_t v40 = 1;
          }
          else if ([v39 isEqualToString:MKLaunchOptionsDirectionsModeDriving])
          {
            uint64_t v40 = 0;
          }
          else if ([v39 isEqualToString:MKLaunchOptionsDirectionsModeCycling])
          {
            uint64_t v40 = 3;
          }
          else
          {
            uint64_t v40 = 0;
          }
          uint64_t v41 = [(DirectionsPlan *)v29 routeRequestStorage];
          [v41 setTransportType:v40];
        }
      }
      v42 = [v11 objectForKeyedSubscript:MKLaunchOptionsLaunchIntoNavKey];
      unsigned int v43 = [v42 BOOLValue];

      if (v43) {
        uint64_t v44 = 2;
      }
      else {
        uint64_t v44 = 1;
      }
      [(DirectionsPlan *)v29 setDisplayMethod:v44];
      v45 = [v11 objectForKeyedSubscript:_MKLaunchOptionsRoutingAvoidTollsKey];
      unsigned int v46 = [v45 BOOLValue];

      if (v46) {
        [(DirectionsPlan *)v29 setAvoidTolls:1];
      }
      v47 = [v11 objectForKeyedSubscript:_MKLaunchOptionsRoutingAvoidHighwaysKey];
      unsigned int v48 = [v47 BOOLValue];

      if (v48) {
        [(DirectionsPlan *)v29 setAvoidHighways:1];
      }
      v49 = [v11 objectForKey:MKLaunchOptionsRouteHandleKey];
      if (v49)
      {
        v50 = [(DirectionsPlan *)v29 routeRequestStorage];
        BOOL v51 = [v50 transportType] == 1;

        if (v51)
        {
          v52 = [(DirectionsPlan *)v29 routeRequestStorage];
          [v52 setRouteHandle:v49];
        }
      }
      timePoint = self->_timePoint;
      if (timePoint)
      {
        v54 = timePoint;
        if ([(GEOURLTimePoint *)v54 hasTime])
        {
          [(GEOURLTimePoint *)v54 time];
          double v56 = v55;
          if ([(GEOURLTimePoint *)v54 hasType])
          {
            unsigned int v57 = [(GEOURLTimePoint *)v54 type];
            if (v57)
            {
              if (v57 == 1) {
                [(DirectionsPlan *)v29 setArrivalTime:v56];
              }
            }
            else
            {
              [(DirectionsPlan *)v29 setDepartureTime:v56];
            }
          }
        }
      }
      v59 = [v12 companionRouteContext];

      if (v59)
      {
        v60 = [v12 companionRouteContext];
        v61 = [v60 data];
        [(DirectionsPlan *)v29 setCompanionRouteContextData:v61];
      }
      uint64_t v62 = [(_MKHandlerURLHandlingTask *)self mapsActivity];
      [v62 setDirectionsPlan:v29];

      if (*(unsigned char *)(*(void *)&buf[8] + 24))
      {
        self->_needsUserLocation = 1;
        self->_userLocationDesiredAccuracy = kCLLocationAccuracyBestForNavigation;
      }

      _Block_object_dispose(buf, 8);
      BOOL v15 = 1;
      goto LABEL_56;
    }
    v16 = +[MKMapService sharedService];
    [v16 captureUserAction:356 onTarget:505 eventValue:0];

    if (![v71 count] || !MapsFeature_IsEnabled_MapsWally())
    {
      uint64_t v58 = [v10 lastObject];
      BOOL v15 = [(_MKHandlerURLHandlingTask *)self _URLHandler:v70 addStopWithMapItem:v58];

LABEL_56:
      goto LABEL_57;
    }
    v17 = [v71 lastObject];
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v64 = sub_1005762E4();
      if (os_log_type_enabled(v64, OS_LOG_TYPE_ERROR))
      {
        v65 = (objc_class *)objc_opt_class();
        uint64_t v66 = NSStringFromClass(v65);
        v67 = +[NSString stringWithFormat:@"Find My handle identifier is wrong type: %@", v66];
        *(_DWORD *)buf = 136316162;
        *(void *)&buf[4] = "-[_MKHandlerURLHandlingTask URLHandler:launchIntoDirectionsWithMapItems:options:context:]";
        *(_WORD *)&buf[12] = 2080;
        *(void *)&buf[14] = "URLHandlingTask.m";
        *(_WORD *)&buf[22] = 1024;
        int v77 = 993;
        __int16 v78 = 2080;
        v79 = "[findMyHandleIdentifier isKindOfClass:NSString.class]";
        __int16 v80 = 2112;
        uint64_t v81 = v67;
        _os_log_impl((void *)&_mh_execute_header, v64, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion: (%s) '%@'", buf, 0x30u);
      }
      if (sub_100BB36BC())
      {
        v68 = sub_1005762E4();
        if (os_log_type_enabled(v68, OS_LOG_TYPE_ERROR))
        {
          v69 = +[NSThread callStackSymbols];
          *(_DWORD *)buf = 138412290;
          *(void *)&buf[4] = v69;
          _os_log_impl((void *)&_mh_execute_header, v68, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
        }
      }
    }
    int v18 = [v10 lastObject];
    v19 = [v18 _geoMapItemStorageForPersistence];

    if (v19)
    {
      [v19 coordinate];
      double v22 = v21;
      double v23 = -180.0;
      if (v20 >= -180.0 && v20 <= 180.0 && v22 >= -90.0)
      {
        double v24 = -180.0;
        if (v22 <= 90.0) {
          [v19 coordinate:-180.0, -180.0];
        }
        goto LABEL_60;
      }
    }
    else
    {
      double v23 = -180.0;
    }
    double v24 = -180.0;
LABEL_60:
    BOOL v15 = -[_MKHandlerURLHandlingTask _URLHandler:addFindMyStopWithHandleIdentifier:coordinate:](self, "_URLHandler:addFindMyStopWithHandleIdentifier:coordinate:", v70, v17, v23, v24);

    goto LABEL_56;
  }
  BOOL v15 = 0;
LABEL_57:

  return v15;
}

- (BOOL)_shouldAddStopWithLaunchOptions:(id)a3 requireLaunchIntoNavOrDirectionsModeOption:(BOOL)a4 requireSearchAlongRouteOption:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  id v7 = a3;
  v8 = +[MNNavigationService sharedService];
  [v8 state];
  if (MNNavigationServiceStateIsNavigating())
  {
    id v9 = +[MNNavigationService sharedService];
    BOOL v10 = [v9 navigationState] != 6;
  }
  else
  {
    BOOL v10 = 0;
  }

  id v11 = [v7 objectForKeyedSubscript:_MKLaunchOptionsRoutingAvoidTollsKey];
  if (v11)
  {
    BOOL v12 = 1;
  }
  else
  {
    id v13 = [v7 objectForKeyedSubscript:_MKLaunchOptionsRoutingAvoidHighwaysKey];
    BOOL v12 = v13 != 0;
  }
  uint64_t v14 = +[MNNavigationService sharedService];
  switch([v14 navigationTransportType])
  {
    case 1u:
    case 6u:

      goto LABEL_12;
    case 2u:
      char IsEnabled_Maps182 = MapsFeature_IsEnabled_Maps182();
      goto LABEL_11;
    case 3u:
      char IsEnabled_Maps182 = MapsFeature_IsEnabled_Maps420();
LABEL_11:
      char v16 = IsEnabled_Maps182;

      if (v16) {
        goto LABEL_15;
      }
LABEL_12:
      int IsEnabled_DrivingMultiWaypointRoutes = 0;
      goto LABEL_13;
    default:
      int IsEnabled_DrivingMultiWaypointRoutes = MapsFeature_IsEnabled_DrivingMultiWaypointRoutes();

      if (IsEnabled_DrivingMultiWaypointRoutes)
      {
LABEL_15:
        int IsEnabled_DrivingMultiWaypointRoutes = v10 && !v12;
        CFStringRef v18 = @"YES";
      }
      else
      {
LABEL_13:
        CFStringRef v18 = @"NO";
      }
      CFStringRef v48 = v18;
      v19 = [v7 objectForKeyedSubscript:MKLaunchOptionsLaunchIntoNavKey];
      unsigned int v20 = [v19 BOOLValue];

      double v21 = [v7 objectForKey:MKLaunchOptionsDirectionsModeKey];

      if (v21) {
        int v22 = 1;
      }
      else {
        int v22 = v20;
      }
      int v23 = IsEnabled_DrivingMultiWaypointRoutes & v22;
      if (v6) {
        int IsEnabled_DrivingMultiWaypointRoutes = v23;
      }
      double v24 = [v7 objectForKeyedSubscript:_MKLaunchOptionsSearchAlongRouteKey];
      unsigned int v25 = [v24 BOOLValue];

      if (v5) {
        int v26 = IsEnabled_DrivingMultiWaypointRoutes & v25;
      }
      else {
        int v26 = IsEnabled_DrivingMultiWaypointRoutes;
      }
      id v27 = sub_1000A930C();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
      {
        id v47 = v7;
        int v28 = v26;
        BOOL v29 = v12;
        if (v6) {
          id v30 = @"YES";
        }
        else {
          id v30 = @"NO";
        }
        v49 = v30;
        if (v5) {
          v31 = @"YES";
        }
        else {
          v31 = @"NO";
        }
        unsigned int v46 = v31;
        if (v10) {
          v32 = @"YES";
        }
        else {
          v32 = @"NO";
        }
        v45 = v32;
        if (v20) {
          v33 = @"YES";
        }
        else {
          v33 = @"NO";
        }
        uint64_t v44 = v33;
        if (v21) {
          uint64_t v34 = @"YES";
        }
        else {
          uint64_t v34 = @"NO";
        }
        v35 = v34;
        BOOL v36 = !v29;
        int v26 = v28;
        id v7 = v47;
        if (v36) {
          v37 = @"NO";
        }
        else {
          v37 = @"YES";
        }
        unsigned int v43 = v37;
        if (v25) {
          v38 = @"YES";
        }
        else {
          v38 = @"NO";
        }
        v39 = v38;
        if (v26) {
          uint64_t v40 = @"YES";
        }
        else {
          uint64_t v40 = @"NO";
        }
        uint64_t v41 = v40;
        *(_DWORD *)buf = 138545410;
        BOOL v51 = v49;
        __int16 v52 = 2114;
        v53 = v46;
        __int16 v54 = 2114;
        double v55 = v45;
        __int16 v56 = 2114;
        unsigned int v57 = v44;
        __int16 v58 = 2114;
        v59 = v35;
        __int16 v60 = 2114;
        v61 = v43;
        __int16 v62 = 2114;
        v63 = v39;
        __int16 v64 = 2114;
        CFStringRef v65 = v48;
        __int16 v66 = 2114;
        v67 = v41;
        _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_INFO, "_shouldAddStopWithLaunchOptions: requireLaunchIntoNavOrDirectionsModeOption: %{public}@ requireSearchAlongRouteOption: %{public}@ isNavigating %{public}@, launchIntoNav %{public}@, hasLaunchIntoDirectionsKey %{public}@, hasCustomLaunchOptions %{public}@, searchAlongRoute %{public}@, IsMPREnabled %{public}@, shouldAddStop %{public}@", buf, 0x5Cu);
      }
      return v26;
  }
}

- (BOOL)_URLHandler:(id)a3 addStopWithMapItem:(id)a4
{
  id v5 = a4;
  BOOL v6 = sub_1000A930C();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    int v10 = 138412290;
    id v11 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "URLHandlingTask addStopWithMapItem %@", (uint8_t *)&v10, 0xCu);
  }

  id v7 = [[AddAStopAction alloc] initWithMapItem:v5];
  currentAction = self->_currentAction;
  self->_currentAction = &v7->super;

  return 1;
}

- (BOOL)_URLHandler:(id)a3 addFindMyStopWithHandleIdentifier:(id)a4 coordinate:(id)a5
{
  double var1 = a5.var1;
  double var0 = a5.var0;
  id v8 = a4;
  id v9 = sub_1000A930C();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    int v13 = 138412803;
    id v14 = v8;
    __int16 v15 = 2049;
    double v16 = var0;
    __int16 v17 = 2049;
    double v18 = var1;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "URLHandlingTask addFindMyStopWithHandleIdentifier %@ coordinate: {%{private}f, %{private}f}", (uint8_t *)&v13, 0x20u);
  }

  int v10 = -[FindMyAction initWithFindMyHandleIdentifier:coordinate:]([FindMyAction alloc], "initWithFindMyHandleIdentifier:coordinate:", v8, var0, var1);
  currentAction = self->_currentAction;
  self->_currentAction = &v10->super;

  return 1;
}

- (BOOL)URLHandler:(id)a3 launchIntoShowMapItems:(id)a4 options:(id)a5 context:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = sub_1000A930C();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    int v21 = 138412546;
    id v22 = v11;
    __int16 v23 = 2112;
    id v24 = v12;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEBUG, "URLHandlingTask launchIntoShowMapItems %@ %@", (uint8_t *)&v21, 0x16u);
  }

  [(_MKHandlerURLHandlingTask *)self _processMKOptions:v12];
  __int16 v15 = +[CarDisplayController sharedInstance];
  id v16 = [v15 isCarAppSceneHostingNavigation];

  if (-[_MKHandlerURLHandlingTask _shouldAddStopWithLaunchOptions:requireLaunchIntoNavOrDirectionsModeOption:requireSearchAlongRouteOption:](self, "_shouldAddStopWithLaunchOptions:requireLaunchIntoNavOrDirectionsModeOption:requireSearchAlongRouteOption:", v12, v16, 1)&& [v11 count] == (id)1)
  {
    __int16 v17 = +[MKMapService sharedService];
    [v17 captureUserAction:356 onTarget:505 eventValue:0];

    double v18 = [v11 firstObject];
    BOOL v19 = [(_MKHandlerURLHandlingTask *)self _URLHandler:v10 addStopWithMapItem:v18];
  }
  else
  {
    BOOL v19 = [(_MKHandlerURLHandlingTask *)self URLHandler:v10 launchIntoSearchWithMapItems:v11 options:v12 context:v13];
  }

  return v19;
}

- (BOOL)URLHandler:(id)a3 launchIntoSearchWithMapItems:(id)a4 options:(id)a5 context:(id)a6
{
  id v8 = a4;
  id v9 = a5;
  id v10 = sub_1000A930C();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412546;
    id v67 = v8;
    __int16 v68 = 2112;
    id v69 = v9;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "URLHandlingTask launchIntoSearchWithMapItems %@ %@", buf, 0x16u);
  }

  [(_MKHandlerURLHandlingTask *)self _processMKOptions:v9];
  id v11 = [v9 objectForKeyedSubscript:_MKLaunchOptionsPreserveSearchResultsKey];
  unsigned int v12 = [v11 BOOLValue];

  uint64_t v13 = MKLaunchOptionsSelectedIndexKey;
  uint64_t v14 = [v9 objectForKeyedSubscript:MKLaunchOptionsSelectedIndexKey];
  __int16 v15 = (void *)v14;
  if (!v8 && v12 && v14 != 0)
  {
    __int16 v17 = [SearchSelectionAction alloc];
    double v18 = [v9 objectForKeyedSubscript:v13];
    BOOL v19 = -[SearchSelectionAction initWithSelectedIndex:](v17, "initWithSelectedIndex:", [v18 unsignedIntegerValue]);

    currentAction = self->_currentAction;
    self->_currentAction = v19;
    goto LABEL_61;
  }
  if ([v8 count] == (id)1)
  {
    currentAction = [v8 objectAtIndexedSubscript:0];
    if ([currentAction isCurrentLocation])
    {
      uint64_t v21 = [v9 objectForKey:MKLaunchOptionsMapSpanKey];
      uint64_t v22 = [v9 objectForKey:MKLaunchOptionsMapCenterKey];
      if (!(v21 | v22))
      {
        id v47 = [(_MKHandlerURLHandlingTask *)self displayOptions];
        [v47 setUserTrackingMode:1];
LABEL_60:

        goto LABEL_61;
      }
    }
    if ([currentAction _hasMuninViewState])
    {
      __int16 v23 = OpenLookAroundAction;
LABEL_59:
      __int16 v56 = (MapsAction *)[[v23 alloc] initWithMapItem:currentAction];
      id v47 = self->_currentAction;
      self->_currentAction = v56;
      goto LABEL_60;
    }
    if (([currentAction _hasMUID] & 1) == 0
      && [currentAction _hasResolvablePartialInformation])
    {
      __int16 v23 = ForwardGeocodeAction;
      goto LABEL_59;
    }
    id v24 = [currentAction _geoAddress];
    unsigned int v25 = [v24 structuredAddress];
    if (v25)
    {
    }
    else
    {
      __int16 v54 = [currentAction _geoAddress];
      id v55 = [v54 formattedAddressLinesCount];

      if (v55)
      {
        __int16 v23 = RefineMapItemAction;
        goto LABEL_59;
      }
    }
  }
  unsigned int v59 = v12;
  __int16 v60 = self;
  [(_MKHandlerURLHandlingTask *)self regionForLaunchOptions:v9 andMapItems:v8];
  double v27 = v26;
  double v29 = v28;
  double v31 = v30;
  double v33 = v32;
  uint64_t v34 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v8 count]);
  long long v61 = 0u;
  long long v62 = 0u;
  long long v63 = 0u;
  long long v64 = 0u;
  id v35 = v8;
  id v36 = [v35 countByEnumeratingWithState:&v61 objects:v65 count:16];
  if (v36)
  {
    id v37 = v36;
    uint64_t v38 = *(void *)v62;
    do
    {
      for (i = 0; i != v37; i = (char *)i + 1)
      {
        if (*(void *)v62 != v38) {
          objc_enumerationMutation(v35);
        }
        uint64_t v40 = *(void **)(*((void *)&v61 + 1) + 8 * i);
        uint64_t v41 = [[SearchResult alloc] initWithMapItem:v40];
        if (([v40 isCurrentLocation] & 1) == 0)
        {
          if (!v41) {
            continue;
          }
          [v34 addObject:v41];
        }
      }
      id v37 = [v35 countByEnumeratingWithState:&v61 objects:v65 count:16];
    }
    while (v37);
  }

  if (v29 < -180.0 || v29 > 180.0 || v27 < -90.0 || v27 > 90.0 || v31 < 0.0 || v31 > 180.0 || v33 < 0.0 || v33 > 360.0)
  {
    v42 = +[SearchInfo searchInfoWithResults:v34];
  }
  else
  {
    v42 = +[SearchInfo searchInfoWithResults:mapRegion:](SearchInfo, "searchInfoWithResults:mapRegion:", v34, v27, v29, v31, v33);
  }
  currentAction = v42;
  if (v15) {
    [v42 setSelectedIndex:[v15 unsignedIntegerValue]];
  }
  unsigned int v43 = v60->_searchTerm;
  if (![(NSString *)v43 length])
  {
    uint64_t v44 = [currentAction selectedResult];
    v45 = v44;
    if (v44)
    {
      id v46 = v44;
    }
    else
    {
      __int16 v58 = [currentAction results];
      id v46 = [v58 firstObject];
    }
    uint64_t v48 = [v46 name];

    unsigned int v43 = (NSString *)v48;
  }
  [currentAction setShouldPreserveResults:v59];
  v49 = +[MNNavigationService sharedService];
  [v49 state];
  int IsNavigating = MNNavigationServiceStateIsNavigating();

  if (IsNavigating)
  {
    if (v60->_searchAlongRoute
      || (MapsFeature_IsEnabled_DrivingMultiWaypointRoutes() & 1) != 0
      || (MapsFeature_IsEnabled_Maps420() & 1) != 0)
    {
      uint64_t IsEnabled_Maps182 = 1;
    }
    else
    {
      uint64_t IsEnabled_Maps182 = MapsFeature_IsEnabled_Maps182();
    }
  }
  else
  {
    uint64_t IsEnabled_Maps182 = 0;
  }
  [currentAction setSearchAlongRoute:IsEnabled_Maps182];
  [currentAction setSearchText:v43];
  __int16 v52 = [[ShowSearchInfoAction alloc] initWithSearchInfo:currentAction];
  v53 = v60->_currentAction;
  v60->_currentAction = &v52->super;

LABEL_61:
  return 1;
}

- (BOOL)URLHandler:(id)a3 setRegion:(id *)a4
{
  double v8 = v7;
  double v9 = v6;
  double v10 = v5;
  double v11 = v4;
  uint64_t v13 = sub_1000A930C();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)double v28 = 0;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEBUG, "URLHandlingTask setRegion", v28, 2u);
  }

  BOOL result = 0;
  if (v10 >= -180.0 && v10 <= 180.0 && v11 >= -90.0 && v11 <= 90.0)
  {
    BOOL result = 0;
    if (v9 >= 0.0 && v9 <= 180.0 && v8 >= 0.0 && v8 <= 360.0)
    {
      MKMapRectForCoordinateRegion();
      double v16 = v15;
      double v18 = v17;
      double v20 = v19;
      double v22 = v21;
      [(URLHandlingTask *)self windowSize];
      unsigned int v25 = +[MKMapCamera _cameraLookingAtMapRect:forViewSize:](MKMapCamera, "_cameraLookingAtMapRect:forViewSize:", v16, v18, v20, v22, v23, v24);
      double v26 = [v25 geoCamera];
      double v27 = [(_MKHandlerURLHandlingTask *)self displayOptions];
      [v27 setCamera:v26];

      return 1;
    }
  }
  return result;
}

- (BOOL)URLHandler:(id)a3 setRegionWithCamera:(id *)a4 pitch:(double)a5 yaw:(double)a6
{
  double v10 = v9;
  double v11 = v8;
  double v12 = v7;
  double v13 = v6;
  double v17 = sub_1000A930C();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)double v32 = 0;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEBUG, "URLHandlingTask setRegionWithCamera", v32, 2u);
  }

  BOOL result = 0;
  if (a6 >= -180.0 && a6 <= 180.0 && a5 >= -90.0 && a5 <= 90.0)
  {
    BOOL result = 0;
    if (v13 >= 0.0 && v13 <= 180.0 && v12 >= 0.0 && v12 <= 360.0)
    {
      MKMapRectForCoordinateRegion();
      double v20 = v19;
      double v22 = v21;
      double v24 = v23;
      double v26 = v25;
      [(URLHandlingTask *)self windowSize];
      double v29 = +[MKMapCamera _cameraLookingAtMapRect:forViewSize:](MKMapCamera, "_cameraLookingAtMapRect:forViewSize:", v20, v22, v24, v26, v27, v28);
      [v29 setPitch:v11];
      [v29 setHeading:v10];
      double v30 = [v29 geoCamera];
      double v31 = [(_MKHandlerURLHandlingTask *)self displayOptions];
      [v31 setCamera:v30];

      return 1;
    }
  }
  return result;
}

- (BOOL)URLHandler:(id)a3 setRegionWithCenter:(CLLocationCoordinate2D)a4 altitude:(double)a5
{
  double longitude = a4.longitude;
  double latitude = a4.latitude;
  double v9 = sub_1000A930C();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)uint64_t v14 = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "URLHandlingTask setRegionWithCenterAndCamera", v14, 2u);
  }

  double v10 = +[MKMapCamera cameraLookingAtCenterCoordinate:fromDistance:pitch:heading:](MKMapCamera, "cameraLookingAtCenterCoordinate:fromDistance:pitch:heading:", latitude, longitude, a5, 0.0, 0.0);
  double v11 = [v10 geoCamera];
  double v12 = [(_MKHandlerURLHandlingTask *)self displayOptions];
  [v12 setCamera:v11];

  return 1;
}

- (BOOL)URLHandler:(id)a3 setRegionWithCenterAndCamera:(CLLocationCoordinate2D)a4 altitude:(double)a5 pitch:(double)a6 yaw:(double)a7
{
  double longitude = a4.longitude;
  double latitude = a4.latitude;
  double v13 = sub_1000A930C();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)double v18 = 0;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEBUG, "URLHandlingTask setRegionWithCenterAndCamera", v18, 2u);
  }

  uint64_t v14 = +[MKMapCamera cameraLookingAtCenterCoordinate:fromDistance:pitch:heading:](MKMapCamera, "cameraLookingAtCenterCoordinate:fromDistance:pitch:heading:", latitude, longitude, (double)(a5 / cos(a6 * 0.0174532925)), a6, a7);
  double v15 = [v14 geoCamera];
  double v16 = [(_MKHandlerURLHandlingTask *)self displayOptions];
  [v16 setCamera:v15];

  return 1;
}

- (BOOL)URLHandler:(id)a3 setRegionWithCenterAndCamera:(CLLocationCoordinate2D)a4 zoomLevel:(double)a5 pitch:(double)a6 yaw:(double)a7
{
  double longitude = a4.longitude;
  double latitude = a4.latitude;
  id v10 = a3;
  double v11 = sub_1000A930C();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)uint64_t v14 = 0;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "URLHandlingTask setRegionWithCenter/zoomLevel", v14, 2u);
  }

  BOOL v12 = 0;
  if (longitude >= -180.0 && longitude <= 180.0 && latitude >= -90.0 && latitude <= 90.0)
  {
    CLLocationCoordinate2DMake(latitude, longitude);
    [(URLHandlingTask *)self windowSize];
    MKCoordinateRegionMakeWithZoomLevel();
    BOOL v12 = -[_MKHandlerURLHandlingTask URLHandler:setRegionWithCamera:pitch:yaw:](self, "URLHandler:setRegionWithCamera:pitch:yaw:", v10);
  }

  return v12;
}

- (BOOL)URLHandler:(id)a3 setRegionWithCenter:(CLLocationCoordinate2D)a4 zoomLevel:(double)a5
{
  double longitude = a4.longitude;
  double latitude = a4.latitude;
  id v8 = a3;
  double v9 = sub_1000A930C();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)BOOL v12 = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "URLHandlingTask setRegionWithCenter/zoomLevel", v12, 2u);
  }

  BOOL v10 = 0;
  if (longitude >= -180.0 && longitude <= 180.0 && latitude >= -90.0 && latitude <= 90.0)
  {
    CLLocationCoordinate2DMake(latitude, longitude);
    [(URLHandlingTask *)self windowSize];
    MKCoordinateRegionMakeWithZoomLevel();
    BOOL v10 = -[_MKHandlerURLHandlingTask URLHandler:setRegion:](self, "URLHandler:setRegion:", v8);
  }

  return v10;
}

- (BOOL)URLHandler:(id)a3 setRegionWithCenter:(CLLocationCoordinate2D)a4
{
  double longitude = a4.longitude;
  double latitude = a4.latitude;
  id v7 = a3;
  id v8 = sub_1000A930C();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)double v11 = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "URLHandlingTask setRegionWithCenter", v11, 2u);
  }

  BOOL v9 = -[_MKHandlerURLHandlingTask URLHandler:setRegionWithCenter:zoomLevel:](self, "URLHandler:setRegionWithCenter:zoomLevel:", v7, latitude, longitude, (double)(unint64_t)GEOConfigGetUInteger());
  return v9;
}

- (BOOL)URLHandler:(id)a3 setUserTrackingMode:(int64_t)a4
{
  double v6 = sub_1000A930C();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    int v10 = 134217984;
    int64_t v11 = a4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "URLHandlingTask setUserTrackingMode %lu", (uint8_t *)&v10, 0xCu);
  }

  if (a4 == 1) {
    uint64_t v7 = 1;
  }
  else {
    uint64_t v7 = 2 * (a4 == 2);
  }
  id v8 = [(_MKHandlerURLHandlingTask *)self displayOptions];
  [v8 setUserTrackingMode:v7];

  return 1;
}

- (BOOL)URLHandler:(id)a3 setMapType:(unint64_t)a4
{
  double v6 = +[MNNavigationService sharedService];
  [v6 state];
  int IsNavigating = MNNavigationServiceStateIsNavigating();

  id v8 = sub_1000A930C();
  BOOL v9 = v8;
  if (IsNavigating)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      int v15 = 134217984;
      unint64_t v16 = a4;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "URLHandlingTask ignoring setMapType %lu", (uint8_t *)&v15, 0xCu);
    }
    goto LABEL_17;
  }
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    int v15 = 134217984;
    unint64_t v16 = a4;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "URLHandlingTask setMapType %lu", (uint8_t *)&v15, 0xCu);
  }

  switch(a4)
  {
    case 1uLL:
    case 3uLL:
      uint64_t v10 = 1;
      break;
    case 2uLL:
    case 4uLL:
      uint64_t v10 = 2;
      break;
    default:
      if (a4 == 108) {
        unsigned int v11 = 4;
      }
      else {
        unsigned int v11 = 0;
      }
      if (a4 == 104) {
        uint64_t v10 = 3;
      }
      else {
        uint64_t v10 = v11;
      }
      break;
  }
  BOOL v12 = [(_MKHandlerURLHandlingTask *)self displayOptions];
  [v12 setMapType:v10];

  double v13 = [(_MKHandlerURLHandlingTask *)self displayOptions];
  LODWORD(v12) = [v13 hasMapType];

  if (v12)
  {
    BOOL v9 = [(_MKHandlerURLHandlingTask *)self displayOptions];
    [v9 setIgnoreLabelPreference:1];
LABEL_17:
  }
  return IsNavigating ^ 1;
}

- (BOOL)URLHandler:(id)a3 setShowTraffic:(BOOL)a4
{
  BOOL v4 = a4;
  double v6 = sub_1000A930C();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    CFStringRef v7 = @"NO";
    if (v4) {
      CFStringRef v7 = @"YES";
    }
    int v10 = 138412290;
    CFStringRef v11 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "URLHandlingTask setShowTraffic %@", (uint8_t *)&v10, 0xCu);
  }

  id v8 = [(_MKHandlerURLHandlingTask *)self displayOptions];
  [v8 setEnableTraffic:v4];

  return 1;
}

- (BOOL)URLHandler:(id)a3 showMapWithoutPinAt:(CLLocationCoordinate2D)a4
{
  BOOL v4 = sub_1000A930C();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)double v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "URLHandlingTask showMapWithoutPinAt", v6, 2u);
  }

  return 1;
}

- (BOOL)URLHandler:(id)a3 showDirectionsFrom:(id)a4 to:(id)a5 using:(unint64_t)a6 directionsOptions:(id)a7
{
  return [(_MKHandlerURLHandlingTask *)self URLHandler:a3 showDirectionsFrom:a4 to:a5 using:a6 muid:0 providerId:0 showLabel:0 directionsOptions:a7];
}

- (BOOL)URLHandler:(id)a3 showDirectionsFrom:(id)a4 to:(id)a5 using:(unint64_t)a6 muid:(unint64_t)a7 providerId:(int)a8 showLabel:(id)a9 directionsOptions:(id)a10
{
  uint64_t v10 = *(void *)&a8;
  id v16 = a3;
  id v17 = a4;
  unint64_t v18 = (unint64_t)a5;
  unint64_t v19 = (unint64_t)a9;
  id v20 = a10;
  if (v18 | v19)
  {
    id v21 = objc_alloc_init((Class)NSMutableDictionary);
    double v22 = v21;
    if (v18) {
      [v21 setObject:v18 forKeyedSubscript:MKURLDestinationAddressKey];
    }
    if (a7 && (int)v10 >= 1)
    {
      double v23 = +[NSNumber numberWithUnsignedLongLong:a7];
      [v22 setObject:v23 forKeyedSubscript:MKURLDestinationMUIDKey];

      double v24 = +[NSNumber numberWithInt:v10];
      [v22 setObject:v24 forKeyedSubscript:MKURLDestinationProviderIDKey];
    }
    if (v19) {
      [v22 setObject:v19 forKeyedSubscript:MKURLDestinationLabelKey];
    }
    id v25 = [v22 copy];
    id v30 = v25;
    double v26 = +[NSArray arrayWithObjects:&v30 count:1];
  }
  else
  {
    double v26 = 0;
  }
  id v27 = [v26 copy];
  BOOL v28 = [(_MKHandlerURLHandlingTask *)self URLHandler:v16 showDirectionsFrom:v17 toDestinations:v27 using:a6 directionsOptions:v20];

  return v28;
}

- (BOOL)URLHandler:(id)a3 showDirectionsFrom:(id)a4 toDestinations:(id)a5 using:(unint64_t)a6 directionsOptions:(id)a7
{
  id v78 = a3;
  id v10 = a4;
  id v11 = a5;
  id v80 = a7;
  BOOL v12 = sub_1000A930C();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    id v94 = v10;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEBUG, "URLHandlingTask showDirectionsFrom %@...", buf, 0xCu);
  }
  int v77 = v10;

  id v13 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", objc_msgSend(v11, "count"));
  long long v89 = 0u;
  long long v90 = 0u;
  long long v91 = 0u;
  long long v92 = 0u;
  id obj = v11;
  id v14 = [obj countByEnumeratingWithState:&v89 objects:v99 count:16];
  id v82 = v13;
  if (v14)
  {
    id v15 = v14;
    uint64_t v85 = *(void *)v90;
    uint64_t v83 = MKURLDestinationMUIDKey;
    uint64_t v84 = MKURLDestinationAddressKey;
    uint64_t v16 = MKURLDestinationProviderIDKey;
    uint64_t v17 = MKURLDestinationLabelKey;
    double longitude = kCLLocationCoordinate2DInvalid.longitude;
    do
    {
      for (i = 0; i != v15; i = (char *)i + 1)
      {
        if (*(void *)v90 != v85) {
          objc_enumerationMutation(obj);
        }
        id v20 = *(void **)(*((void *)&v89 + 1) + 8 * i);
        id v21 = [v20 objectForKeyedSubscript:v84];
        double v22 = [v20 objectForKeyedSubscript:v83];
        id v23 = [v22 unsignedLongValue];

        double v24 = [v20 objectForKeyedSubscript:v16];
        id v25 = [v24 intValue];

        double v26 = [v20 objectForKeyedSubscript:v17];
        id v27 = objc_alloc_init(SearchFieldItem);
        if (v23)
        {
          BOOL v28 = sub_1000A930C();
          if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412802;
            id v94 = v26;
            __int16 v95 = 2048;
            id v96 = v23;
            __int16 v97 = 1024;
            int v98 = (int)v25;
            _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEBUG, "\t-> %@ (ID=%llu, providerID=%d)", buf, 0x1Cu);
          }

          double v29 = -[ExternalURLQuery initWithQuery:coordinate:muid:resultProviderId:contentProvider:]([ExternalURLQuery alloc], "initWithQuery:coordinate:muid:resultProviderId:contentProvider:", v26, v23, v25, 0, kCLLocationCoordinate2DInvalid.latitude, longitude);
          [(SearchFieldItem *)v27 setExternalURLQuery:v29];

          if (v26) {
            id v30 = v26;
          }
          else {
            id v30 = v21;
          }
          [(SearchFieldItem *)v27 setExternalQueryName:v30];
          id v13 = v82;
        }
        else if ([v21 length])
        {
          double v31 = sub_1000A930C();
          if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            id v94 = v21;
            _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEBUG, "\t-> %@", buf, 0xCu);
          }

          [(SearchFieldItem *)v27 setSearchString:v21];
        }
        [v13 addObject:v27];
      }
      id v15 = [obj countByEnumeratingWithState:&v89 objects:v99 count:16];
    }
    while (v15);
  }

  double v32 = objc_alloc_init(SearchFieldItem);
  if ([v77 length])
  {
    id v33 = [objc_alloc((Class)GEOMapItemIdentifier) initWithMapsIdentifierString:v77];
    uint64_t v34 = v80;
    if ([v33 isValid])
    {
      id v35 = [[ExternalURLQuery alloc] initWithQuery:0 muid:[v33 muid] resultProviderId:[v33 resultProviderID] contentProvider:kCLLocationCoordinate2DInvalid.latitude kCLLocationCoordinate2DInvalid.longitude];
      [(SearchFieldItem *)v32 setExternalURLQuery:v35];

      [(SearchFieldItem *)v32 setExternalQueryName:v77];
    }
    else
    {
      [(SearchFieldItem *)v32 setSearchString:v77];
    }
  }
  else
  {
    id v33 = +[SearchResult currentLocationSearchResult];
    [(SearchFieldItem *)v32 setSearchResult:v33];
    uint64_t v34 = v80;
  }

  [v13 insertObject:v32 atIndex:0];
  if ([v13 count] == (id)1)
  {
    id v36 = objc_alloc_init(SearchFieldItem);
    [v13 addObject:v36];
  }
  id v37 = +[MNNavigationService sharedService];
  [v37 state];
  int IsNavigating = MNNavigationServiceStateIsNavigating();

  v39 = [v13 lastObject];
  uint64_t v40 = [v39 searchString];

  if (IsNavigating && [v40 length])
  {
    uint64_t v41 = v78;
    [(_MKHandlerURLHandlingTask *)self URLHandlerWillStartAsynchronousHandling:v78];
    v42 = +[MKMapService sharedService];
    unsigned int v43 = [v42 ticketForForwardGeocodeString:v40 traits:0];

    v87[0] = _NSConcreteStackBlock;
    v87[1] = 3221225472;
    v87[2] = sub_1005DEFD0;
    v87[3] = &unk_1012E7B20;
    v87[4] = self;
    id v88 = v78;
    [(DirectionItem *)v43 submitWithHandler:v87 networkActivity:0];

    goto LABEL_51;
  }
  unint64_t v44 = a6;
  switch(a6)
  {
    case 1uLL:
      break;
    case 2uLL:
      unint64_t v44 = 2;
      break;
    case 4uLL:
      unint64_t v44 = 3;
      break;
    case 8uLL:
      unint64_t v44 = 5;
      break;
    default:
      unint64_t v44 = 0;
      break;
  }
  unsigned int v43 = [[DirectionItem alloc] initWithItems:v13 transportType:v44];
  v86 = v40;
  if (v34)
  {
    if ([v34 hasDrivingPreferences])
    {
      v45 = [DrivePreferences alloc];
      id v46 = [v34 avoidTolls];
      id v47 = [v34 avoidHighways];
      uint64_t v48 = +[NSUserDefaults standardUserDefaults];
      v49 = [(DrivePreferences *)v45 initWithAvoidTolls:v46 avoidHighways:v47 ignoreLiveTraffic:0 defaults:v48];

      uint64_t v34 = v80;
      [(DirectionItem *)v43 setDrivePreferences:v49];
    }
    if ([v34 hasWalkingOrCyclingPreferences])
    {
      v50 = [WalkPreferences alloc];
      id v51 = [v34 avoidHills];
      id v52 = [v34 avoidBusyRoads];
      id v53 = [v34 avoidBusyRoads];
      __int16 v54 = +[NSUserDefaults standardUserDefaults];
      id v55 = [(WalkPreferences *)v50 initWithAvoidHills:v51 avoidBusyRoads:v52 avoidStairs:v53 defaults:v54];

      __int16 v56 = [CyclePreferences alloc];
      id v57 = [v80 avoidHills];
      id v58 = [v80 avoidBusyRoads];
      unsigned int v59 = +[NSUserDefaults standardUserDefaults];
      id v60 = v58;
      uint64_t v34 = v80;
      long long v61 = [(CyclePreferences *)v56 initWithAvoidHills:v57 avoidBusyRoads:v60 ebike:0 defaults:v59];

      [(DirectionItem *)v43 setWalkPreferences:v55];
      [(DirectionItem *)v43 setCyclePreferences:v61];
    }
    if (![v34 hasTransitPreferences]) {
      goto LABEL_47;
    }
    long long v62 = [TransitMutablePreferences alloc];
    long long v63 = +[NSUserDefaults standardUserDefaults];
    long long v64 = [(WatchSyncedPreferences *)v62 initWithDefaults:v63];

    -[TransitMutablePreferences setMode:disabled:](v64, "setMode:disabled:", 1, [v34 transitPreferBus] ^ 1);
    -[TransitMutablePreferences setMode:disabled:](v64, "setMode:disabled:", 2, [v34 transitPreferSubway] ^ 1);
    -[TransitMutablePreferences setMode:disabled:](v64, "setMode:disabled:", 4, [v34 transitPreferCommuter] ^ 1);
    -[TransitMutablePreferences setMode:disabled:](v64, "setMode:disabled:", 8, [v34 transitPreferFerry] ^ 1);
    [(DirectionItem *)v43 setTransitPreferences:v64];
    goto LABEL_46;
  }
  if (self->_routeAvoidTolls || self->_routeAvoidHighways)
  {
    CFStringRef v65 = [DrivePreferences alloc];
    BOOL v66 = [(NSNumber *)self->_routeAvoidTolls BOOLValue];
    BOOL v67 = [(NSNumber *)self->_routeAvoidHighways BOOLValue];
    __int16 v68 = +[NSUserDefaults standardUserDefaults];
    long long v64 = [(DrivePreferences *)v65 initWithAvoidTolls:v66 avoidHighways:v67 ignoreLiveTraffic:0 defaults:v68];

    uint64_t v34 = v80;
    [(DirectionItem *)v43 setDrivePreferences:v64];
LABEL_46:
  }
LABEL_47:
  if ([(MKURLContext *)self->_urlContext originatedFromWatch]) {
    uint64_t v69 = 1;
  }
  else {
    uint64_t v69 = 2;
  }
  id v70 = [DirectionAction alloc];
  timePoint = self->_timePoint;
  v72 = [v34 navigationAutoLaunchDelay];
  id v73 = [(DirectionAction *)v70 initWithDirectionItem:v43 timePoint:timePoint source:v69 navigationAutoLaunchDelay:v72];

  uint64_t v34 = v80;
  [(MapsAction *)v73 setUserLocationAccuracy:kCLLocationAccuracyBestForNavigation];
  currentAction = self->_currentAction;
  self->_currentAction = v73;

  self->_needsUserLocation = 1;
  self->_userLocationDesiredAccuracy = kCLLocationAccuracyBestForNavigation;
  uint64_t v41 = v78;
  id v13 = v82;
  uint64_t v40 = v86;
LABEL_51:

  return 1;
}

- (BOOL)URLHandler:(id)a3 launchIntoRAPForMapItem:(id)a4 options:(id)a5 context:(id)a6
{
  id v8 = a4;
  id v9 = a5;
  id v10 = sub_1000A930C();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    int v14 = 138412546;
    id v15 = v8;
    __int16 v16 = 2112;
    id v17 = v9;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "URLHandlingTask launchIntoRAPForMapItem %@ options %@", (uint8_t *)&v14, 0x16u);
  }

  id v11 = [[PresentRAPAction alloc] initWithMapItem:v8];
  currentAction = self->_currentAction;
  self->_currentAction = &v11->super;

  return 1;
}

- (BOOL)URLHandler:(id)a3 launchIntoPhotoThumbnailGalleryForMapItem:(id)a4 albumIndex:(unint64_t)a5 options:(id)a6 context:(id)a7
{
  id v10 = a4;
  id v11 = a6;
  BOOL v12 = sub_1000A930C();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    int v16 = 134218498;
    unint64_t v17 = a5;
    __int16 v18 = 2112;
    id v19 = v10;
    __int16 v20 = 2112;
    id v21 = v11;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEBUG, "URLHandlingTask launchIntoPhotoThumbnailGalleryForMapItem %lu albumIndex %@ options %@", (uint8_t *)&v16, 0x20u);
  }

  id v13 = [[PresentPhotoThumbnailGalleryAction alloc] initWithMapItem:v10 albumIndex:a5];
  currentAction = self->_currentAction;
  self->_currentAction = &v13->super;

  return 1;
}

- (BOOL)URLHandler:(id)a3 launchIntoTableBookingForMapItem:(id)a4 options:(id)a5 context:(id)a6
{
  id v8 = a4;
  id v9 = a5;
  id v10 = sub_1000A930C();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    int v14 = 138412546;
    id v15 = v8;
    __int16 v16 = 2112;
    id v17 = v9;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "URLHandlingTask launchIntoTableBookingForMapItem %@ options %@", (uint8_t *)&v14, 0x16u);
  }

  id v11 = [[PresentTableBookingAction alloc] initWithMapItem:v8];
  currentAction = self->_currentAction;
  self->_currentAction = &v11->super;

  return 1;
}

- (BOOL)URLHandler:(id)a3 showAddressByRecordID:(id)a4 addressID:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  id v9 = sub_1000A930C();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    int v18 = 138412546;
    id v19 = v7;
    __int16 v20 = 2112;
    id v21 = v8;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "URLHandlingTask showAddressByRecordID %@ addressID %@", (uint8_t *)&v18, 0x16u);
  }

  BOOL v10 = 0;
  if (v7 && v8)
  {
    id v11 = [v7 intValue];
    if (v11 == -1)
    {
      BOOL v10 = 0;
    }
    else
    {
      BOOL v12 = -[AddressBookAddress initWithRecordID:addressID:]([AddressBookAddress alloc], "initWithRecordID:addressID:", v11, [v8 intValue]);
      id v13 = [(AddressBookAddress *)v12 contact];
      BOOL v10 = v13 != 0;

      if (v13)
      {
        int v14 = objc_alloc_init(SearchFieldItem);
        [(SearchFieldItem *)v14 setAddress:v12];
        id v15 = [[SearchAction alloc] initWithSearchItem:v14 alongRoute:self->_searchAlongRoute];
        currentAction = self->_currentAction;
        self->_currentAction = &v15->super;
      }
    }
  }

  return v10;
}

- (BOOL)URLHandler:(id)a3 showAddressByCNContactIdentifier:(id)a4 addressIdentifier:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  id v9 = sub_1000A930C();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    int v17 = 138412546;
    id v18 = v7;
    __int16 v19 = 2112;
    id v20 = v8;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "URLHandlingTask showAddressByCNContactIdentifier %@ addressID %@", (uint8_t *)&v17, 0x16u);
  }

  if ([v7 length] && objc_msgSend(v8, "length"))
  {
    BOOL v10 = [[AddressBookAddress alloc] initWithCNContactIdentifier:v7 addressIdentifier:v8];
    id v11 = [(AddressBookAddress *)v10 contact];
    BOOL v12 = v11 != 0;

    if (v11)
    {
      id v13 = objc_alloc_init(SearchFieldItem);
      [(SearchFieldItem *)v13 setAddress:v10];
      int v14 = [[SearchAction alloc] initWithSearchItem:v13 alongRoute:self->_searchAlongRoute];
      currentAction = self->_currentAction;
      self->_currentAction = &v14->super;
    }
  }
  else
  {
    BOOL v12 = 0;
  }

  return v12;
}

- (BOOL)URLHandler:(id)a3 showAddress:(id)a4 label:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  id v9 = sub_1000A930C();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    int v14 = 138412546;
    id v15 = v7;
    __int16 v16 = 2112;
    id v17 = v8;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "URLHandlingTask showAddress %@ addressID %@", (uint8_t *)&v14, 0x16u);
  }

  BOOL v10 = objc_alloc_init(SearchFieldItem);
  [(SearchFieldItem *)v10 setAddressString:v7];
  [(SearchFieldItem *)v10 setAddressStringLabel:v8];
  id v11 = [[SearchAction alloc] initWithSearchItem:v10 alongRoute:self->_searchAlongRoute];
  currentAction = self->_currentAction;
  self->_currentAction = &v11->super;

  self->_userLocationDesiredAccuracy = kCLLocationAccuracyBest;
  return 1;
}

- (BOOL)URLHandler:(id)a3 showAddress:(id)a4 label:(id)a5 at:(CLLocationCoordinate2D)a6
{
  double longitude = a6.longitude;
  double latitude = a6.latitude;
  id v10 = a4;
  id v11 = a5;
  BOOL v12 = sub_1000A930C();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    int v16 = 138412546;
    id v17 = v10;
    __int16 v18 = 2112;
    id v19 = v11;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEBUG, "URLHandlingTask showAddress %@ addressID %@ at coordinate", (uint8_t *)&v16, 0x16u);
  }

  id v13 = -[PlaceRefinementAction initWithLabel:atCoordinate:address:]([PlaceRefinementAction alloc], "initWithLabel:atCoordinate:address:", v11, v10, latitude, longitude);
  currentAction = self->_currentAction;
  self->_currentAction = &v13->super.super;

  self->_userLocationDesiredAccuracy = kCLLocationAccuracyBest;
  return 1;
}

- (BOOL)URLHandler:(id)a3 showLabel:(id)a4 at:(CLLocationCoordinate2D)a5
{
  double longitude = a5.longitude;
  double latitude = a5.latitude;
  id v8 = a4;
  id v9 = sub_1000A930C();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    int v13 = 138412290;
    id v14 = v8;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "URLHandlingTask label %@  at coordinate", (uint8_t *)&v13, 0xCu);
  }

  id v10 = -[ReverseGeocodeAction initWithLabel:atCoordinate:]([ReverseGeocodeAction alloc], "initWithLabel:atCoordinate:", v8, latitude, longitude);
  currentAction = self->_currentAction;
  self->_currentAction = &v10->super;

  self->_userLocationDesiredAccuracy = kCLLocationAccuracyBest;
  return 1;
}

- (BOOL)URLHandler:(id)a3 showMUID:(unint64_t)a4 resultProviderID:(int)a5 coordinate:(CLLocationCoordinate2D)a6 query:(id)a7
{
  double longitude = a6.longitude;
  double latitude = a6.latitude;
  uint64_t v9 = *(void *)&a5;
  id v12 = a7;
  int v13 = sub_1000A930C();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    int v19 = 134218498;
    unint64_t v20 = a4;
    __int16 v21 = 1024;
    int v22 = v9;
    __int16 v23 = 2112;
    id v24 = v12;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEBUG, "URLHandlingTask showMUID %llu  resultProviderID:%d query:%@", (uint8_t *)&v19, 0x1Cu);
  }

  id v14 = -[ExternalURLQuery initWithQuery:coordinate:muid:resultProviderId:contentProvider:]([ExternalURLQuery alloc], "initWithQuery:coordinate:muid:resultProviderId:contentProvider:", v12, a4, v9, self->_contentProvider, latitude, longitude);
  if (v14)
  {
    id v15 = objc_alloc_init(SearchFieldItem);
    [(SearchFieldItem *)v15 setExternalURLQuery:v14];
    int v16 = [[SearchAction alloc] initWithSearchItem:v15 alongRoute:self->_searchAlongRoute];
    currentAction = self->_currentAction;
    self->_currentAction = &v16->super;

    self->_userLocationDesiredAccuracy = kCLLocationAccuracyBest;
  }

  return 1;
}

- (BOOL)URLHandler:(id)a3 showExternalBusinessID:(id)a4 ofContentProvider:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  uint64_t v9 = sub_1000A930C();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    int v15 = 138412546;
    id v16 = v7;
    __int16 v17 = 2112;
    id v18 = v8;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "URLHandlingTask showExternalBusinessID %@ contentProvider %@", (uint8_t *)&v15, 0x16u);
  }

  if (!self->_contentProvider)
  {
    id v10 = (NSString *)[v8 copy];
    contentProvider = self->_contentProvider;
    self->_contentProvider = v10;
  }
  id v12 = [[ResolveMUIDAction alloc] initWithBusinessID:v7 contentProvider:self->_contentProvider];
  currentAction = self->_currentAction;
  self->_currentAction = &v12->super;

  return 1;
}

- (BOOL)URLHandler:(id)a3 search:(id)a4 at:(CLLocationCoordinate2D)a5
{
  CLLocationDegrees longitude = a5.longitude;
  CLLocationDegrees latitude = a5.latitude;
  id v8 = a4;
  uint64_t v9 = sub_1000A930C();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    int v17 = 138412290;
    id v18 = v8;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "URLHandlingTask search %@ searchCoordinate", (uint8_t *)&v17, 0xCu);
  }

  id v10 = objc_alloc_init(SearchFieldItem);
  [(SearchFieldItem *)v10 setSearchString:v8];
  id v11 = [(MapsActivity *)self->_mapsActivity displayOptions];
  id v12 = [v11 camera];

  if (!v12)
  {
    CLLocationCoordinate2D v13 = CLLocationCoordinate2DMake(latitude, longitude);
    -[SearchFieldItem setCoordinateHint:](v10, "setCoordinateHint:", v13.latitude, v13.longitude);
  }
  self->_userLocationDesiredAccuracy = kCLLocationAccuracyBest;
  id v14 = [[SearchAction alloc] initWithSearchItem:v10 alongRoute:self->_searchAlongRoute];
  currentAction = self->_currentAction;
  self->_currentAction = &v14->super;

  return 1;
}

- (BOOL)URLHandler:(id)a3 showLineWithID:(unint64_t)a4 name:(id)a5
{
  id v7 = a5;
  id v8 = sub_1000A930C();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    int v13 = 134218242;
    unint64_t v14 = a4;
    __int16 v15 = 2112;
    id v16 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "URLHandlingTask showLineWithID %llu lineName %@", (uint8_t *)&v13, 0x16u);
  }

  uint64_t v9 = [(_MKHandlerURLHandlingTask *)self mapsActivity];
  [v9 setSelectedTransitFeatureID:a4];

  id v10 = [(_MKHandlerURLHandlingTask *)self mapsActivity];
  [v10 setSelectedTransitLineName:v7];

  id v11 = [(_MKHandlerURLHandlingTask *)self displayOptions];
  [v11 setMapType:3];

  return 1;
}

- (BOOL)URLHandler:(id)a3 showFavoritesType:(int64_t)a4
{
  double v6 = sub_1000A930C();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    int v10 = 134217984;
    int64_t v11 = a4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "URLHandlingTask showFavoritesType %ld", (uint8_t *)&v10, 0xCu);
  }

  id v7 = [[OpenFavoritesAction alloc] initWithFavoriteType:a4];
  currentAction = self->_currentAction;
  self->_currentAction = &v7->super;

  return 1;
}

- (BOOL)URLHandler:(id)a3 enterLookAroundWithViewState:(id)a4
{
  id v5 = a4;
  double v6 = sub_1000A930C();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    int v10 = 138412290;
    id v11 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "URLHandlingTask enterLookAroundWithViewState %@", (uint8_t *)&v10, 0xCu);
  }

  id v7 = [[OpenLookAroundAction alloc] initWithMuninViewState:v5];
  currentAction = self->_currentAction;
  self->_currentAction = &v7->super;

  return 1;
}

- (BOOL)URLHandler:(id)a3 enterLookAroundWithLocationQueryItem:(id)a4
{
  id v5 = a4;
  double v6 = sub_1000A930C();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    int v10 = 138412290;
    id v11 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "URLHandlingTask enterLookAroundWithLocationQueryItem %@", (uint8_t *)&v10, 0xCu);
  }

  id v7 = [[OpenLookAroundAction alloc] initWithLocationQueryItem:v5];
  currentAction = self->_currentAction;
  self->_currentAction = &v7->super;

  return 1;
}

- (BOOL)URLHandler:(id)a3 launchIntoTesterWithParam:(id)a4
{
  id v4 = a4;
  id v5 = sub_1000A930C();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    int v8 = 138412290;
    id v9 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "URLHandlingTask launchIntoTesterWithParam %@", (uint8_t *)&v8, 0xCu);
  }

  double v6 = objc_alloc_init(MapsTester);
  [(MapsTester *)v6 runTestCode];

  return 1;
}

- (BOOL)URLHandler:(id)a3 showMapItem:(id)a4 label:(id)a5 at:(CLLocationCoordinate2D)a6
{
  return 1;
}

- (BOOL)URLHandler:(id)a3 showCollection:(id)a4
{
  id v5 = a4;
  double v6 = [[ShowCollectionAction alloc] initWithCollectionStorage:v5];

  currentAction = self->_currentAction;
  self->_currentAction = &v6->super;

  return 1;
}

- (BOOL)URLHandlerShowCarDestinations:(id)a3
{
  id v4 = objc_alloc_init(ShowCarDestinationsAction);
  currentAction = self->_currentAction;
  self->_currentAction = &v4->super;

  return 1;
}

- (BOOL)URLHandlerShowParkedCar:(id)a3
{
  id v4 = [[PresentParkedCarAction alloc] initWithParkedCarAction:0];
  currentAction = self->_currentAction;
  self->_currentAction = &v4->super;

  return 1;
}

- (BOOL)URLHandlerShowMyLocationCard:(id)a3
{
  id v4 = objc_alloc_init(ShowMyLocationCardAction);
  currentAction = self->_currentAction;
  self->_currentAction = &v4->super;

  return 1;
}

- (BOOL)URLHandler:(id)a3 showCuratedCollectionWithID:(unint64_t)a4 resultProviderID:(int)a5
{
  double v6 = [[ShowCuratedCollectionAction alloc] initWithCuratedCollectionID:a4 resultProviderID:*(void *)&a5];
  currentAction = self->_currentAction;
  self->_currentAction = &v6->super;

  return 1;
}

- (BOOL)URLHandler:(id)a3 showPublisherWithID:(unint64_t)a4 resultProviderID:(int)a5
{
  double v6 = [[ShowPublisherAction alloc] initWithPublisherID:a4 resultProviderID:*(void *)&a5];
  currentAction = self->_currentAction;
  self->_currentAction = &v6->super;

  return 1;
}

- (BOOL)URLHandlerShowAllCuratedCollections:(id)a3
{
  id v4 = objc_alloc_init(ShowAllCuratedCollectionsAction);
  currentAction = self->_currentAction;
  self->_currentAction = &v4->super;

  return 1;
}

- (BOOL)URLHandlerShowReports:(id)a3
{
  id v4 = [[PresentRAPAction alloc] initWithShowReports:1];
  currentAction = self->_currentAction;
  self->_currentAction = &v4->super;

  return 1;
}

- (BOOL)URLHandler:(id)a3 showReportAProblemWithLocationQuery:(id)a4
{
  id v5 = a4;
  double v6 = [[PresentRAPAction alloc] initWithLocationQueryItem:v5];

  currentAction = self->_currentAction;
  self->_currentAction = &v6->super;

  return 1;
}

- (BOOL)URLHandler:(id)a3 initiateOfflineDownloadForRegion:(id)a4 displayName:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = [(URLHandlingTask *)self sourceApplication];
  unsigned int v10 = [v9 isEqualToString:@"com.apple.Spotlight"];

  if (v10) {
    +[GEOAPPortal captureUserAction:381 target:702 value:0];
  }
  id v11 = objc_alloc_init(OpenOfflineMapsManagementAction);
  [(OpenOfflineMapsManagementAction *)v11 setDownloadRegion:v8];

  [(OpenOfflineMapsManagementAction *)v11 setDownloadRegionName:v7];
  id v12 = [[RichMapsActivity alloc] initWithMapsAction:v11];
  [(_MKHandlerURLHandlingTask *)self taskFinished:v12];

  return 1;
}

- ($04D47FADD0355EF96E203C25856C2375)regionForLaunchOptions:(SEL)a3 andMapItems:(id)a4
{
  id v7 = a4;
  id v8 = a5;
  uint64_t v9 = [v7 objectForKey:MKLaunchOptionsMapSpanKey];
  unsigned int v10 = [v7 objectForKey:MKLaunchOptionsMapCenterKey];
  uint64_t v11 = [v7 objectForKey:MKLaunchOptionsMapRadiusInMetersKey];
  if (v10)
  {
    [v10 MKCoordinateValue];
    if (!(v9 | v11))
    {
      [(URLHandlingTask *)self windowSize];
      MKCoordinateRegionMakeWithZoomLevel();
      goto LABEL_43;
    }
    if (v11) {
      goto LABEL_4;
    }
LABEL_42:
    [(id)v9 MKCoordinateSpanValue];
    goto LABEL_43;
  }
  if (![v8 count]) {
    goto LABEL_43;
  }
  if (!(v9 | v11))
  {
    if ([v8 count] == (id)1)
    {
      id v24 = [v8 objectAtIndex:0];
      [v24 _coordinate];
      [(URLHandlingTask *)self windowSize];
      MKCoordinateRegionMakeWithZoomLevel();

      goto LABEL_43;
    }
    double y = MKMapRectNull.origin.y;
    double width = MKMapRectNull.size.width;
    double height = MKMapRectNull.size.height;
    long long v50 = 0u;
    long long v51 = 0u;
    long long v48 = 0u;
    long long v49 = 0u;
    id v28 = v8;
    id v29 = [v28 countByEnumeratingWithState:&v48 objects:v56 count:16];
    if (v29)
    {
      id v30 = v29;
      uint64_t v31 = *(void *)v49;
      double x = MKMapRectNull.origin.x;
      double v33 = y;
      double v34 = width;
      double v35 = height;
      do
      {
        for (i = 0; i != v30; i = (char *)i + 1)
        {
          if (*(void *)v49 != v31) {
            objc_enumerationMutation(v28);
          }
          id v37 = *(void **)(*((void *)&v48 + 1) + 8 * i);
          if (x == MKMapRectNull.origin.x && v33 == y && v34 == width && v35 == height)
          {
            uint64_t v41 = [v37 _displayMapRegion];
            GEOMapRectForMapRegion();
          }
          else
          {
            uint64_t v41 = [v37 _displayMapRegion];
            GEOMapRectForMapRegion();
            v62.origin.double x = v42;
            v62.origin.double y = v43;
            v62.size.double width = v44;
            v62.size.double height = v45;
            v60.origin.double x = x;
            v60.origin.double y = v33;
            v60.size.double width = v34;
            v60.size.double height = v35;
            MKMapRect v61 = MKMapRectUnion(v60, v62);
          }
          double x = v61.origin.x;
          double v33 = v61.origin.y;
          double v34 = v61.size.width;
          double v35 = v61.size.height;
        }
        id v30 = [v28 countByEnumeratingWithState:&v48 objects:v56 count:16];
      }
      while (v30);
    }
    else
    {
      double x = MKMapRectNull.origin.x;
      double v33 = y;
      double v34 = width;
      double v35 = height;
    }

    double v12 = x;
    double v13 = v33;
    double v14 = v34;
    double v15 = v35;
    goto LABEL_5;
  }
  long long v54 = 0u;
  long long v55 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  id v16 = v8;
  id v17 = [v16 countByEnumeratingWithState:&v52 objects:v57 count:16];
  if (v17)
  {
    id v18 = v17;
    uint64_t v19 = *(void *)v53;
    double v20 = 0.0;
    double v21 = 0.0;
    do
    {
      for (j = 0; j != v18; j = (char *)j + 1)
      {
        if (*(void *)v53 != v19) {
          objc_enumerationMutation(v16);
        }
        [*(id *)(*((void *)&v52 + 1) + 8 * (void)j) _coordinate];
        MKMapPoint v23 = MKMapPointForCoordinate(v58);
        double v21 = v21 + v23.x;
        double v20 = v20 + v23.y;
      }
      id v18 = [v16 countByEnumeratingWithState:&v52 objects:v57 count:16];
    }
    while (v18);
  }
  else
  {
    double v20 = 0.0;
    double v21 = 0.0;
  }

  double v46 = v21 / (double)(unint64_t)[v16 count];
  v59.double y = v20 / (double)(unint64_t)[v16 count];
  v59.double x = v46;
  MKCoordinateForMapPoint(v59);
  if (!v11) {
    goto LABEL_42;
  }
LABEL_4:
  [(id)v11 doubleValue];
  MKMapRectMakeWithRadialDistance();
LABEL_5:
  MKCoordinateRegionForMapRect(*(MKMapRect *)&v12);
LABEL_43:

  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_urlContext, 0);
  objc_storeStrong((id *)&self->_currentError, 0);
  objc_storeStrong((id *)&self->_contentProvider, 0);
  objc_storeStrong((id *)&self->_mapsActivity, 0);
  objc_storeStrong((id *)&self->_urlHandler, 0);
  objc_storeStrong((id *)&self->_analyticsValue, 0);
  objc_storeStrong((id *)&self->_radiusInMeter, 0);
  objc_storeStrong((id *)&self->_timePoint, 0);
  objc_storeStrong((id *)&self->_searchTerm, 0);
  objc_storeStrong((id *)&self->_routeAvoidTolls, 0);
  objc_storeStrong((id *)&self->_routeAvoidHighways, 0);

  objc_storeStrong((id *)&self->_currentAction, 0);
}

@end