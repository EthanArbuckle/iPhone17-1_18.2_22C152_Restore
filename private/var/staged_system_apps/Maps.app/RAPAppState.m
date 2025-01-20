@interface RAPAppState
- (BOOL)isShowingDirections;
- (GEOComposedRoute)activeComposedRoute;
- (NSArray)directionsHistory;
- (NSArray)homeShortcuts;
- (NSArray)schoolShortcuts;
- (NSArray)searchesHistory;
- (NSArray)workShortcuts;
- (NSString)currentSearchString;
- (NSString)currentUserTypedSearchString;
- (NSString)debugDescription;
- (RAPAppState)initWithMapView:(id)a3 lookAroundContext:(id)a4 traits:(id)a5;
- (RAPAppState)initWithMapView:(id)a3 traits:(id)a4 searchHistory:(id)a5 directionHistory:(id)a6 place:(id)a7 searchDataSource:(id)a8 directionsDataSource:(id)a9 currentlyConnectedAuxiliaryControls:(id)a10;
- (RAPAppState)initWithMapView:(id)a3 traits:(id)a4 searchHistory:(id)a5 directionHistory:(id)a6 place:(id)a7 searchDataSource:(id)a8 directionsDataSource:(id)a9 currentlyConnectedAuxiliaryControls:(id)a10 homeShortuts:(id)a11 workShorcuts:(id)a12 schoolShorcuts:(id)a13;
- (RAPAppState)initWithTraits:(id)a3 curatedCollectionContext:(id)a4;
- (RAPAppState)initWithTraits:(id)a3 placecardImageryContext:(id)a4;
- (RAPAuxiliaryControlsRecording)currentlyConnectedAuxiliaryControls;
- (RAPCuratedCollectionContext)curatedCollectionContext;
- (RAPDirectionsRecording)directionsRecording;
- (RAPDisplayedDirectionsPlan)displayedDirectionsPlan;
- (RAPDisplayedRouteState)currentDirections;
- (RAPLookAroundContext)reportedLookAroundContext;
- (RAPPlacecardImageryContext)placecardImageryContext;
@end

@implementation RAPAppState

- (RAPAppState)initWithTraits:(id)a3 placecardImageryContext:(id)a4
{
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)RAPAppState;
  v8 = [(RAPMapState *)&v11 initWithTraits:a3];
  v9 = v8;
  if (v8) {
    objc_storeStrong((id *)&v8->_placecardImageryContext, a4);
  }

  return v9;
}

- (RAPAppState)initWithMapView:(id)a3 traits:(id)a4 searchHistory:(id)a5 directionHistory:(id)a6 place:(id)a7 searchDataSource:(id)a8 directionsDataSource:(id)a9 currentlyConnectedAuxiliaryControls:(id)a10
{
  id v33 = a5;
  id v32 = a6;
  id v17 = a8;
  id v18 = a9;
  id v19 = a10;
  v34.receiver = self;
  v34.super_class = (Class)RAPAppState;
  v20 = [(RAPMapState *)&v34 initWithMapView:a3 traits:a4 place:a7];
  if (v20)
  {
    uint64_t v21 = [v18 activeComposedRoute:v32, v33];
    activeComposedRoute = v20->_activeComposedRoute;
    v20->_activeComposedRoute = (GEOComposedRoute *)v21;

    uint64_t v23 = [v18 currentDirections];
    currentDirections = v20->_currentDirections;
    v20->_currentDirections = (RAPDisplayedRouteState *)v23;

    uint64_t v25 = [v17 currentSearchString];
    currentSearchString = v20->_currentSearchString;
    v20->_currentSearchString = (NSString *)v25;

    uint64_t v27 = [v17 currentUserTypedSearchString];
    currentUserTypedSearchString = v20->_currentUserTypedSearchString;
    v20->_currentUserTypedSearchString = (NSString *)v27;

    uint64_t v29 = [v18 displayedDirectionsPlan];
    displayedDirectionsPlan = v20->_displayedDirectionsPlan;
    v20->_displayedDirectionsPlan = (RAPDisplayedDirectionsPlan *)v29;

    v20->_isShowingDirections = [v18 isShowingDirections];
    objc_storeStrong((id *)&v20->_currentlyConnectedAuxiliaryControls, a10);
    objc_storeStrong((id *)&v20->_searchesHistory, a5);
    objc_storeStrong((id *)&v20->_directionsHistory, a6);
  }

  return v20;
}

- (RAPAppState)initWithMapView:(id)a3 traits:(id)a4 searchHistory:(id)a5 directionHistory:(id)a6 place:(id)a7 searchDataSource:(id)a8 directionsDataSource:(id)a9 currentlyConnectedAuxiliaryControls:(id)a10 homeShortuts:(id)a11 workShorcuts:(id)a12 schoolShorcuts:(id)a13
{
  id v18 = a11;
  id v19 = a12;
  id v20 = a13;
  uint64_t v21 = v19;
  v22 = [(RAPAppState *)self initWithMapView:a3 traits:a4 searchHistory:a5 directionHistory:a6 place:a7 searchDataSource:a8 directionsDataSource:a9 currentlyConnectedAuxiliaryControls:a10];
  if (v22)
  {
    uint64_t v23 = (NSArray *)[v18 copy];
    homeShortcuts = v22->_homeShortcuts;
    v22->_homeShortcuts = v23;

    uint64_t v25 = (NSArray *)[v21 copy];
    workShortcuts = v22->_workShortcuts;
    v22->_workShortcuts = v25;

    uint64_t v27 = (NSArray *)[v20 copy];
    schoolShortcuts = v22->_schoolShortcuts;
    v22->_schoolShortcuts = v27;
  }
  return v22;
}

- (RAPAppState)initWithMapView:(id)a3 lookAroundContext:(id)a4 traits:(id)a5
{
  id v9 = a4;
  v10 = [(RAPAppState *)self initWithMapView:a3 traits:a5 searchHistory:&__NSArray0__struct directionHistory:&__NSArray0__struct place:0 searchDataSource:0 directionsDataSource:0 currentlyConnectedAuxiliaryControls:0];
  objc_super v11 = v10;
  if (v10) {
    objc_storeStrong((id *)&v10->_reportedLookAroundContext, a4);
  }

  return v11;
}

- (RAPAppState)initWithTraits:(id)a3 curatedCollectionContext:(id)a4
{
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)RAPAppState;
  v8 = [(RAPMapState *)&v11 initWithTraits:a3];
  id v9 = v8;
  if (v8) {
    objc_storeStrong((id *)&v8->_curatedCollectionContext, a4);
  }

  return v9;
}

- (NSString)debugDescription
{
  id v3 = objc_alloc_init((Class)NSMutableString);
  v4 = v3;
  if (self->_isShowingDirections) {
    CFStringRef v5 = @"\nis showing directions";
  }
  else {
    CFStringRef v5 = @"\nis not showing directions";
  }
  [v3 appendString:v5];
  CFStringRef currentSearchString = (const __CFString *)self->_currentSearchString;
  if (!currentSearchString) {
    CFStringRef currentSearchString = @"<none>";
  }
  [v4 appendFormat:@"\ncurrent search string: %@", currentSearchString];
  CFStringRef currentUserTypedSearchString = (const __CFString *)self->_currentUserTypedSearchString;
  if (!currentUserTypedSearchString) {
    CFStringRef currentUserTypedSearchString = @"<none>";
  }
  [v4 appendFormat:@"\ncurrent user typed search string: %@", currentUserTypedSearchString];
  v11.receiver = self;
  v11.super_class = (Class)RAPAppState;
  v8 = [(RAPMapState *)&v11 debugDescription];
  [v4 appendString:v8];

  if (self->_currentDirections) {
    [v4 appendFormat:@"\ncurrent directions: %@", self->_currentDirections];
  }
  if (self->_displayedDirectionsPlan) {
    [v4 appendFormat:@"\ndisplayed directions plan: %@", self->_displayedDirectionsPlan];
  }
  if (self->_activeComposedRoute) {
    [v4 appendFormat:@"\nactive composed route: %@", self->_activeComposedRoute];
  }
  if (self->_searchesHistory) {
    [v4 appendFormat:@"\nsearch history: %@", self->_searchesHistory];
  }
  if (self->_directionsHistory) {
    [v4 appendFormat:@"\ndirections history: %@", self->_directionsHistory];
  }
  if (self->_currentlyConnectedAuxiliaryControls) {
    [v4 appendFormat:@"\ncurrently connected auxiliary controls: %@", self->_currentlyConnectedAuxiliaryControls];
  }
  id v9 = [v4 copy];

  return (NSString *)v9;
}

- (BOOL)isShowingDirections
{
  return self->_isShowingDirections;
}

- (RAPDisplayedRouteState)currentDirections
{
  return self->_currentDirections;
}

- (RAPDisplayedDirectionsPlan)displayedDirectionsPlan
{
  return self->_displayedDirectionsPlan;
}

- (RAPDirectionsRecording)directionsRecording
{
  return self->_directionsRecording;
}

- (NSString)currentSearchString
{
  return self->_currentSearchString;
}

- (NSString)currentUserTypedSearchString
{
  return self->_currentUserTypedSearchString;
}

- (NSArray)searchesHistory
{
  return self->_searchesHistory;
}

- (NSArray)directionsHistory
{
  return self->_directionsHistory;
}

- (RAPAuxiliaryControlsRecording)currentlyConnectedAuxiliaryControls
{
  return self->_currentlyConnectedAuxiliaryControls;
}

- (GEOComposedRoute)activeComposedRoute
{
  return self->_activeComposedRoute;
}

- (NSArray)workShortcuts
{
  return self->_workShortcuts;
}

- (NSArray)homeShortcuts
{
  return self->_homeShortcuts;
}

- (NSArray)schoolShortcuts
{
  return self->_schoolShortcuts;
}

- (RAPLookAroundContext)reportedLookAroundContext
{
  return self->_reportedLookAroundContext;
}

- (RAPPlacecardImageryContext)placecardImageryContext
{
  return self->_placecardImageryContext;
}

- (RAPCuratedCollectionContext)curatedCollectionContext
{
  return self->_curatedCollectionContext;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_curatedCollectionContext, 0);
  objc_storeStrong((id *)&self->_placecardImageryContext, 0);
  objc_storeStrong((id *)&self->_reportedLookAroundContext, 0);
  objc_storeStrong((id *)&self->_schoolShortcuts, 0);
  objc_storeStrong((id *)&self->_homeShortcuts, 0);
  objc_storeStrong((id *)&self->_workShortcuts, 0);
  objc_storeStrong((id *)&self->_activeComposedRoute, 0);
  objc_storeStrong((id *)&self->_currentlyConnectedAuxiliaryControls, 0);
  objc_storeStrong((id *)&self->_directionsHistory, 0);
  objc_storeStrong((id *)&self->_searchesHistory, 0);
  objc_storeStrong((id *)&self->_currentUserTypedSearchString, 0);
  objc_storeStrong((id *)&self->_currentSearchString, 0);
  objc_storeStrong((id *)&self->_directionsRecording, 0);
  objc_storeStrong((id *)&self->_displayedDirectionsPlan, 0);

  objc_storeStrong((id *)&self->_currentDirections, 0);
}

@end