@interface MapsAppTestTapPOI
- ($1AB5FA073B851C12C2339EC22442E995)vkJumpPointCoordinate;
- (BOOL)runTest;
- (BOOL)shouldScrollPlacecard;
- (BOOL)shouldSkipPanningMap;
- (BOOL)shouldTestPlaceEnrichment;
- (BOOL)waitForWebModule;
- (GEOMapRegion)region;
- (MapsAppTestTapPOI)initWithApplication:(id)a3 testName:(id)a4 options:(id)a5;
- (NSString)poiLabel;
- (NSString)testName;
- (double)pitch;
- (double)yaw;
- (void)didFinishJumping;
- (void)didShowPlaceCard;
- (void)didShowWebModule;
- (void)scrollPlacecardTest;
- (void)setPitch:(double)a3;
- (void)setPoiLabel:(id)a3;
- (void)setRegion:(id)a3;
- (void)setShouldScrollPlacecard:(BOOL)a3;
- (void)setShouldSkipPanningMap:(BOOL)a3;
- (void)setShouldTestPlaceEnrichment:(BOOL)a3;
- (void)setTestName:(id)a3;
- (void)setVkJumpPointCoordinate:(id)a3;
- (void)setWaitForWebModule:(BOOL)a3;
- (void)setYaw:(double)a3;
- (void)tapPOI;
@end

@implementation MapsAppTestTapPOI

- (MapsAppTestTapPOI)initWithApplication:(id)a3 testName:(id)a4 options:(id)a5
{
  id v9 = a4;
  id v10 = a5;
  v27.receiver = self;
  v27.super_class = (Class)MapsAppTestTapPOI;
  v11 = [(MapsAppTest *)&v27 initWithApplication:a3 testName:v9 options:v10];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_testName, a4);
    uint64_t v13 = [v10 objectForKeyedSubscript:@"poi_label"];
    poiLabel = v12->_poiLabel;
    v12->_poiLabel = (NSString *)v13;

    v15 = [v10 objectForKeyedSubscript:@"waitForWebModule"];
    v12->_waitForWebModule = [v15 BOOLValue];

    v16 = [v10 objectForKeyedSubscript:@"shouldTestPlaceEnrichment"];
    v12->_shouldTestPlaceEnrichment = [v16 BOOLValue];

    v17 = [v10 objectForKeyedSubscript:@"shouldScrollPlacecard"];
    v12->_shouldScrollPlacecard = [v17 BOOLValue];

    v18 = [v10 objectForKeyedSubscript:@"shouldSkipPanningMap"];
    v12->_shouldSkipPanningMap = [v18 BOOLValue];

    [v10 _mapstest_pitch];
    v12->_pitch = v19;
    [v10 _mapstest_yaw];
    v12->_yaw = v20;
    if (objc_msgSend(v10, "_mapstest_hasMapRegion"))
    {
      uint64_t v21 = [v10 _mapstest_mapRegion];
      region = v12->_region;
      v12->_region = (GEOMapRegion *)v21;
    }
    else
    {
      [v10 _mapstest_jumpPoint];
      v12->_vkJumpPointCoordinate.latitude = v23;
      v12->_vkJumpPointCoordinate.longitude = v24;
      v12->_vkJumpPointCoordinate.altitude = v25;
    }
  }

  return v12;
}

- (BOOL)runTest
{
  [(MapsAppTest *)self startedTest];
  [(MapsAppTest *)self startedSubTest:@"loadingScene"];
  v3 = [(MapsAppTest *)self options];
  id v4 = [v3 _mapstest_mapType];

  [(MapsAppTest *)self switchToMapType:v4];
  region = self->_region;
  v6 = [(MapsAppTest *)self mainVKMapView];
  v7 = v6;
  if (region) {
    [v6 setMapRegion:self->_region pitch:0.0 yaw:0.0];
  }
  else {
    [v6 _mapstest_jumpToCoords:1 pitch:self->_vkJumpPointCoordinate.latitude yaw:self->_vkJumpPointCoordinate.longitude altitudeIsRegionSize:self->_vkJumpPointCoordinate.altitude pitch:self->_pitch yaw:self->_yaw];
  }

  objc_initWeak(&location, self);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100A1DE48;
  v9[3] = &unk_1012E6708;
  objc_copyWeak(&v10, &location);
  [(MapsAppTest *)self addFullyDrawnCallback:v9];
  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
  return 1;
}

- (void)didFinishJumping
{
  [(MapsAppTest *)self finishedSubTest:@"loadingScene"];
  v3 = [(MapsAppTest *)self mainMKMapView];
  objc_initWeak(&location, self);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100A1DF68;
  v4[3] = &unk_1012E6708;
  objc_copyWeak(&v5, &location);
  [v3 _setLabelsDidLayoutCallback:v4];
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)tapPOI
{
  v3 = [(MapsAppTest *)self mainMKMapView];
  [v3 _setLabelsDidLayoutCallback:0];

  v15 = [(MapsAppTest *)self mainVKMapView];
  [v15 labelMarkers];
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  id v5 = [v4 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v24;
LABEL_3:
    uint64_t v7 = 0;
    while (1)
    {
      if (*(void *)v24 != v6) {
        objc_enumerationMutation(v4);
      }
      v8 = *(void **)(*((void *)&v23 + 1) + 8 * v7);
      id v9 = [v8 text];
      unsigned __int8 v10 = [v9 isEqual:self->_poiLabel];

      if (v10) {
        break;
      }
      if (v5 == (id)++v7)
      {
        id v5 = [v4 countByEnumeratingWithState:&v23 objects:v27 count:16];
        if (v5) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
    id v11 = v8;

    if (!v11) {
      goto LABEL_13;
    }
    [(MapsAppTest *)self startedSubTest:@"tapPOI"];
    objc_initWeak(&location, self);
    if (self->_shouldTestPlaceEnrichment)
    {
      [(MapsAppTest *)self startedSubTest:@"fetchPlaceEnrichment"];
      v20[0] = _NSConcreteStackBlock;
      v20[1] = 3221225472;
      v20[2] = sub_100A1E3E8;
      v20[3] = &unk_1012F2AB8;
      v20[4] = self;
      objc_copyWeak(&v21, &location);
      +[PPTNotificationCenter addOnceObserverForName:MKPlaceViewControllerDidShowNotification object:0 usingBlock:v20];
      v19[0] = _NSConcreteStackBlock;
      v19[1] = 3221225472;
      v19[2] = sub_100A1E460;
      v19[3] = &unk_1012E6668;
      v19[4] = self;
      +[PPTNotificationCenter addOnceObserverForName:MUPlaceEnrichmentSectionControllerDidFetchEnrichmentNotification object:0 usingBlock:v19];
      v18[0] = _NSConcreteStackBlock;
      v18[1] = 3221225472;
      v18[2] = sub_100A1E4AC;
      v18[3] = &unk_1012E6668;
      v18[4] = self;
      +[PPTNotificationCenter addOnceObserverForName:MUPlaceEnrichmentSectionControllerDidFinishLoadingNotification object:0 usingBlock:v18];
      objc_destroyWeak(&v21);
    }
    else
    {
      v16[0] = _NSConcreteStackBlock;
      v16[1] = 3221225472;
      v16[2] = sub_100A1E4BC;
      v16[3] = &unk_1012E6730;
      objc_copyWeak(&v17, &location);
      +[PPTNotificationCenter addOnceObserverForName:MKPlaceViewControllerDidShowNotification object:0 usingBlock:v16];
      objc_destroyWeak(&v17);
    }
    v14 = [(MapsAppTest *)self mainMKMapView];
    [v14 _selectLabelMarker:v11 animated:1];

    objc_destroyWeak(&location);
  }
  else
  {
LABEL_9:

LABEL_13:
    poiLabel = self->_poiLabel;
    id v11 = [v15 mapRegion];
    uint64_t v13 = +[NSString stringWithFormat:@"Could not find POI named \"%@\" in map region: %@", poiLabel, v11];
    [(MapsAppTest *)self failedTestWithReason:v13];
  }
}

- (void)didShowPlaceCard
{
  [(MapsAppTest *)self finishedSubTest:@"tapPOI"];
  if ([(MapsAppTestTapPOI *)self waitForWebModule])
  {
    [(MapsAppTest *)self startedSubTest:@"loadWebModule"];
    objc_initWeak(&location, self);
    uint64_t v3 = MUWebContentViewControllerDidFinishLoadingNotification;
    v4[0] = _NSConcreteStackBlock;
    v4[1] = 3221225472;
    v4[2] = sub_100A1E630;
    v4[3] = &unk_1012E6730;
    objc_copyWeak(&v5, &location);
    +[PPTNotificationCenter addOnceObserverForName:v3 object:0 usingBlock:v4];
    objc_destroyWeak(&v5);
    objc_destroyWeak(&location);
  }
  else
  {
    [(MapsAppTest *)self finishedTest];
  }
}

- (void)didShowWebModule
{
  [(MapsAppTest *)self finishedSubTest:@"loadWebModule"];
  if ([(MapsAppTestTapPOI *)self shouldTestPlaceEnrichment]
    && (id WeakRetained = objc_loadWeakRetained((id *)&self->_placeViewController), WeakRetained,
                                                                                 WeakRetained))
  {
    dispatch_time_t v4 = dispatch_time(0, 2000000000);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100A1E758;
    block[3] = &unk_1012E5D08;
    block[4] = self;
    dispatch_after(v4, (dispatch_queue_t)&_dispatch_main_q, block);
  }
  else
  {
    [(MapsAppTest *)self finishedTest];
  }
}

- (void)scrollPlacecardTest
{
  [(MapsAppTest *)self startedSubTest:@"scrollingPlacecard"];
  objc_initWeak(&location, self);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_placeViewController);
  dispatch_time_t v4 = [WeakRetained view];
  objc_opt_class();
  id v5 = [v4 subviews];
  id v6 = [v5 mutableCopy];

  if ([v6 count])
  {
    uint64_t v7 = 0;
    while (1)
    {
      v8 = [v6 objectAtIndexedSubscript:v7];
      if (objc_opt_isKindOfClass()) {
        break;
      }
      id v9 = [v8 subviews];
      BOOL v10 = [v9 count] == 0;

      if (!v10)
      {
        id v11 = [v8 subviews];
        [v6 addObjectsFromArray:v11];
      }
      if (++v7 >= (unint64_t)[v6 count]) {
        goto LABEL_7;
      }
    }
  }
  else
  {
LABEL_7:
    v8 = 0;
  }

  RPTContentSizeInDirection();
  double v13 = v12;
  RPTGetBoundsForView();
  id v18 = [objc_alloc((Class)RPTScrollViewTestParameters) initWithTestName:@"scrollingPlacecard" scrollBounds:1 scrollContentLength:&stru_1013149C0 scrollDirection:v14 completionHandler:v13];
  id v25 = v18;
  double v19 = +[NSArray arrayWithObjects:&v25 count:1];
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_100A1EB54;
  v21[3] = &unk_1012E6690;
  objc_copyWeak(&v23, &location);
  v22 = @"scrollingPlacecard";
  id v20 = +[RPTGroupScrollTestParameters newWithTestName:@"scrollingPlacecard" parameters:v19 completionHandler:v21];

  +[RPTTestRunner runTestWithParameters:v20];
  objc_destroyWeak(&v23);

  objc_destroyWeak(&location);
}

- (NSString)testName
{
  return self->_testName;
}

- (void)setTestName:(id)a3
{
}

- (NSString)poiLabel
{
  return self->_poiLabel;
}

- (void)setPoiLabel:(id)a3
{
}

- (BOOL)waitForWebModule
{
  return self->_waitForWebModule;
}

- (void)setWaitForWebModule:(BOOL)a3
{
  self->_waitForWebModule = a3;
}

- (GEOMapRegion)region
{
  return self->_region;
}

- (void)setRegion:(id)a3
{
}

- ($1AB5FA073B851C12C2339EC22442E995)vkJumpPointCoordinate
{
  double latitude = self->_vkJumpPointCoordinate.latitude;
  double longitude = self->_vkJumpPointCoordinate.longitude;
  double altitude = self->_vkJumpPointCoordinate.altitude;
  result.var2 = altitude;
  result.var1 = longitude;
  result.var0 = latitude;
  return result;
}

- (void)setVkJumpPointCoordinate:(id)a3
{
  self->_vkJumpPointCoordinate = ($5B2A0FEE2A1717E36A90D599307F83D1)a3;
}

- (double)pitch
{
  return self->_pitch;
}

- (void)setPitch:(double)a3
{
  self->_pitch = a3;
}

- (double)yaw
{
  return self->_yaw;
}

- (void)setYaw:(double)a3
{
  self->_yaw = a3;
}

- (BOOL)shouldTestPlaceEnrichment
{
  return self->_shouldTestPlaceEnrichment;
}

- (void)setShouldTestPlaceEnrichment:(BOOL)a3
{
  self->_shouldTestPlaceEnrichment = a3;
}

- (BOOL)shouldScrollPlacecard
{
  return self->_shouldScrollPlacecard;
}

- (void)setShouldScrollPlacecard:(BOOL)a3
{
  self->_shouldScrollPlacecard = a3;
}

- (BOOL)shouldSkipPanningMap
{
  return self->_shouldSkipPanningMap;
}

- (void)setShouldSkipPanningMap:(BOOL)a3
{
  self->_shouldSkipPanningMap = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_region, 0);
  objc_storeStrong((id *)&self->_poiLabel, 0);
  objc_storeStrong((id *)&self->_testName, 0);

  objc_destroyWeak((id *)&self->_placeViewController);
}

@end