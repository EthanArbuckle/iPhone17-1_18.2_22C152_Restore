@interface MKMapService
+ (unsigned)searchMaxResults;
+ (unsigned)venuesCategorySearchMaxResults;
- (GEOMapServiceTraits)mapsDefaultTraitsWithCarPlayInfo;
- (id)_mapsDefaultTraits;
- (id)_mapsDefaultTraitsForAnalytics;
- (id)_maps_ticketForSearchHistoryEntry:(id)a3 source:(int)a4 traits:(id)a5 isRedoOrAutoRedoSearch:(BOOL)a6;
- (id)_ticketForSearchQuery:(id)a3 completionItem:(id)a4 retainedSearch:(id)a5 traits:(id)a6 searchSessionData:(id)a7;
- (id)mapsDefaultTraitsForMapRegion:(id)a3 source:(int)a4;
- (id)mapsDefaultTraitsForMapView:(id)a3 mapViewEnteredForegroundDate:(id)a4 mapViewportChangedDate:(id)a5;
- (id)mapsDefaultTraitsForMapView:(id)a3 mapViewEnteredForegroundDate:(id)a4 mapViewportChangedDate:(id)a5 directionsType:(unint64_t)a6;
- (id)mapsDefaultTraitsForMapView:(id)a3 mapViewEnteredForegroundDate:(id)a4 mapViewportChangedDate:(id)a5 directionsType:(unint64_t)a6 includeCarPlayInfo:(BOOL)a7;
- (id)ticketForMapItemToRefine:(id)a3;
- (id)ticketForQuerySearch:(id)a3 source:(int)a4;
- (id)ticketForReverseGeocodeCoordinate:(CLLocationCoordinate2D)a3;
- (id)ticketForReverseGeocodeLocation:(id)a3;
- (id)ticketForSearchQuery:(id)a3 completionItem:(id)a4 traits:(id)a5 searchSessionData:(id)a6;
- (id)ticketForURLQuery:(id)a3 identifier:(id)a4 resultProviderId:(int)a5 contentProvider:(id)a6 traits:(id)a7 source:(int)a8;
- (void)_addCarPlayConnectionToTraits:(id)a3;
- (void)_addCarPlayInfoToTraits:(id)a3;
- (void)_addInVehicleInfoToTraits:(id)a3;
- (void)captureUserAction:(int)a3 onTarget:(int)a4 eventValue:(id)a5 mapItem:(id)a6 resultIndex:(int)a7;
- (void)captureUserAction:(int)a3 onTarget:(int)a4 eventValue:(id)a5 mapItem:(id)a6 timestamp:(double)a7 resultIndex:(int)a8;
- (void)captureUserAction:(int)a3 onTarget:(int)a4 eventValue:(id)a5 routeIndex:(unint64_t)a6;
@end

@implementation MKMapService

- (id)mapsDefaultTraitsForMapView:(id)a3 mapViewEnteredForegroundDate:(id)a4 mapViewportChangedDate:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = [(MKMapService *)self _mapsDefaultTraits];
  if (v8)
  {
    [v8 visibleMapRect];
    id v16 = [objc_alloc((Class)GEOMapRegion) initWithMapRect:v12, v13, v14, v15];
    [v11 setMapRegion:v16];

    v17 = [v8 venueWithFocus];
    if (v17 && sub_1000BBB44(v8) != 5)
    {
      id v18 = [objc_alloc((Class)GEOVenueIdentifier) initWithVenueID:[v17 venueID] featureID:[v17 featureID] businessID:[v17 businessID]];
      v19 = [v18 placeDataVenueIdentifierForVenue];
      [v11 setVenueIdentifier:v19];
    }
  }
  v20 = +[NSDate date];
  v21 = v20;
  if (v9)
  {
    [v20 timeIntervalSinceDate:v9];
    LODWORD(v23) = vcvtad_u64_f64(v22);
    [v11 setTimeSinceMapEnteredForeground:v23];
  }
  if (v10)
  {
    [v21 timeIntervalSinceDate:v10];
    LODWORD(v25) = vcvtad_u64_f64(v24);
    [v11 setTimeSinceMapViewportChanged:v25];
  }
  id v26 = [v8 mapType];
  uint64_t v27 = 1;
  switch((unint64_t)v26)
  {
    case 0uLL:
      goto LABEL_16;
    case 1uLL:
    case 3uLL:
      uint64_t v27 = 2;
      goto LABEL_16;
    case 2uLL:
    case 4uLL:
      uint64_t v27 = 3;
      goto LABEL_16;
    default:
      if (v26 == (id)102) {
        goto LABEL_16;
      }
      if (v26 == (id)104)
      {
        uint64_t v27 = 4;
LABEL_16:
        [v11 setMode:v27];
      }
      [v8 _zoomLevel];
      if (v28 > 0.0) {
        [v11 setMapZoomLevel:];
      }
      [v11 setPhotosCount:GEOConfigGetUInteger()];
      [v11 setPhotoAlbumCount:GEOConfigGetUInteger()];
      [v11 setWantsRouteCreationTip:1];

      return v11;
  }
}

- (id)_mapsDefaultTraits
{
  v3 = [(MKMapService *)self mapsDefaultTraits];
  unint64_t v4 = (unint64_t)+[GEOIdealTransportTypeFinder idealTransportType];
  if (v4 > 4)
  {
    uint64_t v5 = 0;
    uint64_t v6 = 0;
  }
  else
  {
    uint64_t v5 = qword_100F73BC0[v4];
    uint64_t v6 = dword_100F73BE8[v4];
  }
  [v3 addTransportType:v6];
  id v7 = +[_MKQuickRouteManager counterpartForTransportType:v5];
  uint64_t v8 = 2;
  switch((unint64_t)v7)
  {
    case 0uLL:
      goto LABEL_9;
    case 2uLL:
      goto LABEL_8;
    case 4uLL:
      uint64_t v8 = 1;
      goto LABEL_8;
    case 8uLL:
      uint64_t v8 = 3;
      goto LABEL_8;
    default:
      uint64_t v8 = 0;
LABEL_8:
      [v3 addTransportType:v8];
LABEL_9:
      id v9 = +[CarDisplayController sharedInstance];
      unsigned __int8 v10 = [v9 isCurrentlyConnectedToAnyCarScene];

      if ((v10 & 1) == 0) {
        [v3 addTransportType:2];
      }
      [(MKMapService *)self _addCarPlayConnectionToTraits:v3];
      v11 = +[SearchVirtualGarageManager sharedSearchVirtualGarageManager];
      double v12 = [v11 updatedTraitsForCurrentGarageState:v3];

      double v13 = +[MNNavigationService sharedService];
      double v14 = [v13 currentVoiceLanguage];

      if ([v14 length]) {
        [v12 setDeviceSpokenLocale:v14];
      }
      double v15 = [DrivePreferences alloc];
      id v16 = +[NSUserDefaults standardUserDefaults];
      v17 = [(DrivePreferences *)v15 initWithDefaults:v16];
      id v18 = [(DrivePreferences *)v17 automobileOptions];
      [v12 setAutomobileOptions:v18];

      v19 = [WalkPreferences alloc];
      v20 = +[NSUserDefaults standardUserDefaults];
      v21 = [(WalkPreferences *)v19 initWithDefaults:v20];
      double v22 = [(WalkPreferences *)v21 walkingOptions];
      [v12 setWalkingOptions:v22];

      uint64_t v23 = [TransitPreferences alloc];
      double v24 = +[NSUserDefaults standardUserDefaults];
      uint64_t v25 = [(WatchSyncedPreferences *)v23 initWithDefaults:v24];
      id v26 = [(TransitPreferences *)v25 transitOptions];
      [v12 setTransitOptions:v26];

      uint64_t v27 = [CyclePreferences alloc];
      double v28 = +[NSUserDefaults standardUserDefaults];
      v29 = [(CyclePreferences *)v27 initWithDefaults:v28];
      v30 = [(CyclePreferences *)v29 cyclingOptions];
      [v12 setCyclingOptions:v30];

      [v12 setSupportDymSuggestion:1];
      return v12;
  }
}

- (void)_addCarPlayConnectionToTraits:(id)a3
{
  id v8 = a3;
  v3 = +[CarDisplayController sharedInstance];
  unsigned int v4 = [v3 isCurrentlyConnectedToAnyCarScene];

  if (v4)
  {
    uint64_t v5 = +[MapsExternalDevice sharedInstance];
    id v6 = [v5 connectionType];
    if (v6 == (id)1) {
      uint64_t v7 = 1;
    }
    else {
      uint64_t v7 = 2 * (v6 == (id)2);
    }
    [v8 setCarHeadunitConnectionType:v7];
  }
}

+ (unsigned)searchMaxResults
{
  if (qword_101610CA8 != -1) {
    dispatch_once(&qword_101610CA8, &stru_10131CB38);
  }
  return dword_101610CA0;
}

+ (unsigned)venuesCategorySearchMaxResults
{
  return 5000;
}

- (id)_mapsDefaultTraitsForAnalytics
{
  v3 = [(MKMapService *)self _mapsDefaultTraits];
  [(MKMapService *)self _addCarPlayInfoToTraits:v3];
  [(MKMapService *)self _addInVehicleInfoToTraits:v3];
  id v4 = [(MKMapService *)self defaultTraitsForAnalyticsWithTraits:v3];

  return v3;
}

- (id)mapsDefaultTraitsForMapRegion:(id)a3 source:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v6 = a3;
  uint64_t v7 = [(MKMapService *)self _mapsDefaultTraits];
  id v8 = v7;
  if (v6) {
    [v7 setMapRegion:v6];
  }
  if (v4) {
    [v8 setSource:v4];
  }

  return v8;
}

- (id)mapsDefaultTraitsForMapView:(id)a3 mapViewEnteredForegroundDate:(id)a4 mapViewportChangedDate:(id)a5 directionsType:(unint64_t)a6
{
  return [(MKMapService *)self mapsDefaultTraitsForMapView:a3 mapViewEnteredForegroundDate:a4 mapViewportChangedDate:a5 directionsType:a6 includeCarPlayInfo:0];
}

- (id)mapsDefaultTraitsForMapView:(id)a3 mapViewEnteredForegroundDate:(id)a4 mapViewportChangedDate:(id)a5 directionsType:(unint64_t)a6 includeCarPlayInfo:(BOOL)a7
{
  BOOL v7 = a7;
  unsigned __int8 v10 = [(MKMapService *)self mapsDefaultTraitsForMapView:a3 mapViewEnteredForegroundDate:a4 mapViewportChangedDate:a5];
  v11 = v10;
  uint64_t v12 = 2;
  switch(a6)
  {
    case 2uLL:
      break;
    case 4uLL:
      uint64_t v12 = 1;
      break;
    case 8uLL:
      uint64_t v12 = 3;
      break;
    default:
      uint64_t v12 = 0;
      break;
  }
  [v10 addTransportType:v12];
  id v13 = +[_MKQuickRouteManager counterpartForTransportType:a6];
  uint64_t v14 = 2;
  switch((unint64_t)v13)
  {
    case 2uLL:
      break;
    case 4uLL:
      uint64_t v14 = 1;
      break;
    case 8uLL:
      uint64_t v14 = 3;
      break;
    default:
      uint64_t v14 = 0;
      break;
  }
  [v11 addTransportType:v14];
  if (v7) {
    [(MKMapService *)self _addCarPlayInfoToTraits:v11];
  }

  return v11;
}

- (GEOMapServiceTraits)mapsDefaultTraitsWithCarPlayInfo
{
  v3 = [(MKMapService *)self _mapsDefaultTraits];
  [(MKMapService *)self _addCarPlayInfoToTraits:v3];

  return (GEOMapServiceTraits *)v3;
}

- (void)_addCarPlayInfoToTraits:(id)a3
{
  id v23 = a3;
  v3 = +[CarDisplayController sharedInstance];
  unsigned int v4 = [v3 isCurrentlyConnectedToAnyCarScene];

  if (v4)
  {
    uint64_t v5 = +[CarDisplayController sharedInstance];
    id v6 = [v5 screen];

    BOOL v7 = [v6 _capabilityForKey:_UIScreenCapabilityTouchLevelsKey];
    id v8 = [v7 integerValue];

    uint64_t v9 = 3;
    if ((unint64_t)v8 < 3) {
      uint64_t v10 = (v8 + 1);
    }
    else {
      uint64_t v10 = 3;
    }
    [v23 setCarHeadunitInteractionModel:v10];
    [v6 bounds];
    CGFloat x = v25.origin.x;
    CGFloat y = v25.origin.y;
    CGFloat width = v25.size.width;
    CGFloat height = v25.size.height;
    [v23 setCarHeadunitPixelHeight:CGRectGetHeight(v25)];
    v26.origin.CGFloat x = x;
    v26.origin.CGFloat y = y;
    v26.size.CGFloat width = width;
    v26.size.CGFloat height = height;
    [v23 setCarHeadunitPixelWidth:CGRectGetWidth(v26)];
    double v15 = +[MapsExternalDevice sharedInstance];
    id v16 = [v15 manufacturer];
    [v23 setCarHeadunitManufacturer:v16];

    v17 = [v15 model];
    [v23 setCarHeadunitModel:v17];

    id v18 = +[NSUserDefaults standardUserDefaults];
    unsigned __int8 v19 = [v18 BOOLForKey:@"CarEVSearchTestingDebug"];

    if ((v19 & 1) == 0)
    {
      unsigned int v20 = [v15 hasEngineType];
      v21 = v23;
      if (!v20) {
        goto LABEL_16;
      }
      [v23 clearEngineTypes];
      unsigned __int8 v22 = [v15 engineType];
      if (v22) {
        [v23 addEngineType:1];
      }
      if ((v22 & 4) != 0) {
        [v23 addEngineType:3];
      }
      v21 = v23;
      if ((v22 & 2) != 0)
      {
        [v23 addEngineType:2];
        v21 = v23;
      }
      if ((v22 & 8) == 0) {
        goto LABEL_16;
      }
      uint64_t v9 = 4;
    }
    [v23 addEngineType:v9];
    v21 = v23;
LABEL_16:
    [v21 setSupportDirectionIntentAutocomplete:0];
    [v23 setSupportDirectionIntentSearch:0];
    [v23 setSupportUnresolvedDirectionIntent:0];
    [v23 setSupportClientRankingFeatureMetadata:0];
    [v23 setSupportClientRankingCompositeFeatures:0];
    [v23 setSupportStructuredRapAffordance:0];
  }
}

- (void)_addInVehicleInfoToTraits:(id)a3
{
}

- (id)ticketForReverseGeocodeCoordinate:(CLLocationCoordinate2D)a3
{
  double longitude = a3.longitude;
  double latitude = a3.latitude;
  id v6 = [(MKMapService *)self _mapsDefaultTraits];
  BOOL v7 = -[MKMapService ticketForReverseGeocodeCoordinate:traits:](self, "ticketForReverseGeocodeCoordinate:traits:", v6, latitude, longitude);

  return v7;
}

- (id)ticketForReverseGeocodeLocation:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(MKMapService *)self _mapsDefaultTraits];
  id v6 = [(MKMapService *)self ticketForReverseGeocodeLocation:v4 traits:v5];

  return v6;
}

- (id)ticketForMapItemToRefine:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(MKMapService *)self _mapsDefaultTraits];
  id v6 = [(MKMapService *)self ticketForMapItemToRefine:v4 traits:v5];

  return v6;
}

- (id)_ticketForSearchQuery:(id)a3 completionItem:(id)a4 retainedSearch:(id)a5 traits:(id)a6 searchSessionData:(id)a7
{
  id v12 = a7;
  id v13 = a6;
  id v14 = a5;
  id v15 = a4;
  id v16 = a3;
  v17 = [(MKMapService *)self ticketForSearchQuery:v16 completionItem:v15 retainedSearch:v14 maxResults:+[MKMapService searchMaxResults] traits:v13 searchSessionData:v12];

  return v17;
}

- (id)ticketForSearchQuery:(id)a3 completionItem:(id)a4 traits:(id)a5 searchSessionData:(id)a6
{
  return [(MKMapService *)self _ticketForSearchQuery:a3 completionItem:a4 retainedSearch:0 traits:a5 searchSessionData:a6];
}

- (id)ticketForQuerySearch:(id)a3 source:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v6 = a3;
  BOOL v7 = [v6 mapRegion];
  id v8 = [(MKMapService *)self mapsDefaultTraitsForMapRegion:v7 source:v4];

  if ([v6 hasLanguage])
  {
    if ([v8 deviceDisplayLanguagesCount])
    {
      uint64_t v9 = [v8 deviceDisplayLanguages];
      uint64_t v10 = [v9 firstObject];
      v11 = [v6 language];
      unsigned __int8 v12 = [v10 isEqualToString:v11];

      if ((v12 & 1) == 0)
      {
        id v13 = [v8 deviceDisplayLanguages];
        id v14 = [v6 language];
        [v13 removeObject:v14];

        id v15 = [v8 deviceDisplayLanguages];
        id v16 = [v6 language];
        [v15 insertObject:v16 atIndex:0];
      }
    }
  }
  v17 = [v6 query];
  id v18 = [(MKMapService *)self _ticketForSearchQuery:v17 completionItem:0 retainedSearch:0 traits:v8 searchSessionData:0];

  return v18;
}

- (id)ticketForURLQuery:(id)a3 identifier:(id)a4 resultProviderId:(int)a5 contentProvider:(id)a6 traits:(id)a7 source:(int)a8
{
  uint64_t v8 = *(void *)&a8;
  uint64_t v10 = *(void *)&a5;
  id v14 = a7;
  id v15 = a6;
  id v16 = a4;
  id v17 = a3;
  if (!v14)
  {
    id v14 = [(MKMapService *)self _mapsDefaultTraits];
  }
  [v14 setSource:v8];
  id v18 = [(MKMapService *)self ticketForURLQuery:v17 identifier:v16 resultProviderId:v10 contentProvider:v15 maxResults:+[MKMapService searchMaxResults] traits:v14];

  return v18;
}

- (void)captureUserAction:(int)a3 onTarget:(int)a4 eventValue:(id)a5 routeIndex:(unint64_t)a6
{
  uint64_t v7 = *(void *)&a4;
  uint64_t v8 = *(void *)&a3;
  id v11 = a5;
  if (a6 == 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v10 = 0;
  }
  else
  {
    uint64_t v10 = +[GEORouteDetails routeDetailsWithResultIndex:a6];
  }
  [(MKMapService *)self captureUserAction:v8 onTarget:v7 eventValue:v11 routeDetails:v10];
}

- (void)captureUserAction:(int)a3 onTarget:(int)a4 eventValue:(id)a5 mapItem:(id)a6 resultIndex:(int)a7
{
}

- (void)captureUserAction:(int)a3 onTarget:(int)a4 eventValue:(id)a5 mapItem:(id)a6 timestamp:(double)a7 resultIndex:(int)a8
{
  LODWORD(v8) = 0;
  [(MKMapService *)self capturePlaceCardUserAction:*(void *)&a3 onTarget:*(void *)&a4 eventValue:a5 mapItem:a6 timestamp:*(void *)&a8 resultIndex:0 targetID:a7 providerID:0 animationID:0 actionURL:0 photoID:0 placeCardType:v8 localizedMapItemCategory:0 availableActions:0 unactionableUIElements:0];
}

- (id)_maps_ticketForSearchHistoryEntry:(id)a3 source:(int)a4 traits:(id)a5 isRedoOrAutoRedoSearch:(BOOL)a6
{
  uint64_t v8 = *(void *)&a4;
  id v10 = a3;
  id v11 = a5;
  if (!a6)
  {
    unsigned __int8 v12 = [v10 mapRegion];
    [v11 setMapRegion:v12];
  }
  if (v8) {
    [v11 setSource:v8];
  }
  id v13 = [v10 languageCode];
  if (v13)
  {
    if ([v11 deviceDisplayLanguagesCount])
    {
      id v14 = [v11 deviceDisplayLanguages];
      id v15 = [v14 firstObject];
      unsigned __int8 v16 = [v15 isEqualToString:v13];

      if ((v16 & 1) == 0)
      {
        id v17 = [v11 deviceDisplayLanguages];
        [v17 removeObject:v13];

        id v18 = [v11 deviceDisplayLanguages];
        [v18 insertObject:v13 atIndex:0];
      }
    }
  }
  unsigned __int8 v19 = [v10 query];
  unsigned int v20 = [(MKMapService *)self ticketForSearchQuery:v19 completionItem:0 traits:v11 searchSessionData:0];

  return v20;
}

@end