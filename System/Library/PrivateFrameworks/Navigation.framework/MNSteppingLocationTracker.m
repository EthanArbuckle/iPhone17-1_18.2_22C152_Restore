@interface MNSteppingLocationTracker
- (MNSteppingLocationTracker)initWithNavigationSession:(id)a3;
- (id)_matchedLocationForLocation:(id)a3;
- (id)matchedLocationForLocation:(id)a3;
- (int)transportType;
- (void)arrivalUpdater:(id)a3 didUpdateArrivalInfo:(id)a4;
- (void)arrivalUpdaterDidArrive:(id)a3 atEndOfLegAtIndex:(unint64_t)a4;
- (void)startTrackingWithInitialLocation:(id)a3 targetLegIndex:(unint64_t)a4;
- (void)stopTracking;
- (void)updateLocation:(id)a3;
@end

@implementation MNSteppingLocationTracker

- (MNSteppingLocationTracker)initWithNavigationSession:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)MNSteppingLocationTracker;
  v5 = [(MNLocationTracker *)&v14 initWithNavigationSession:v4];
  if (v5)
  {
    v6 = [v4 routeManager];
    v7 = [v6 currentRoute];

    id v8 = objc_alloc(MEMORY[0x1E4F649E0]);
    v9 = [v4 auditToken];
    uint64_t v10 = [v8 initWithRoute:v7 auditToken:v9];
    routeMatcher = v5->_routeMatcher;
    v5->_routeMatcher = (GEORouteMatcher *)v10;

    v12 = v5;
  }

  return v5;
}

- (int)transportType
{
  v2 = [(MNLocationTracker *)self navigationSession];
  v3 = [v2 routeManager];
  id v4 = [v3 currentRoute];
  int v5 = [v4 transportType];

  return v5;
}

- (id)matchedLocationForLocation:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)MNSteppingLocationTracker;
  id v4 = [(MNLocationTracker *)&v9 matchedLocationForLocation:a3];
  int v5 = [v4 routeMatch];
  v6 = [v5 step];
  int v7 = [v6 isArrivalStep];

  if (v7) {
    [(MNArrivalUpdater *)self->_arrivalUpdater updateForLocation:v4];
  }
  return v4;
}

- (void)startTrackingWithInitialLocation:(id)a3 targetLegIndex:(unint64_t)a4
{
  id v6 = a3;
  [(MNLocationTracker *)self _setState:1];
  int v7 = objc_alloc_init(MNArrivalUpdater);
  arrivalUpdater = self->_arrivalUpdater;
  self->_arrivalUpdater = v7;

  [(MNArrivalUpdater *)self->_arrivalUpdater setDelegate:self];
  objc_super v9 = [(MNLocationTracker *)self navigationSessionState];
  [(MNArrivalUpdater *)self->_arrivalUpdater setNavigationSessionState:v9];

  [(MNArrivalUpdater *)self->_arrivalUpdater start];
  v10.receiver = self;
  v10.super_class = (Class)MNSteppingLocationTracker;
  [(MNLocationTracker *)&v10 startTrackingWithInitialLocation:v6 targetLegIndex:a4];
}

- (void)stopTracking
{
  [(MNLocationTracker *)self _setState:0];
  [(MNArrivalUpdater *)self->_arrivalUpdater setDelegate:0];
  arrivalUpdater = self->_arrivalUpdater;
  self->_arrivalUpdater = 0;

  v4.receiver = self;
  v4.super_class = (Class)MNSteppingLocationTracker;
  [(MNLocationTracker *)&v4 stopTracking];
}

- (id)_matchedLocationForLocation:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int v5 = MNGetPuckTrackingLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    id v6 = [v4 uuid];
    int v14 = 138412290;
    v15 = v6;
    _os_log_impl(&dword_1B542B000, v5, OS_LOG_TYPE_INFO, "[MN] [%@] - Processing - in MNSteppingLocationTracker::_matchedLocationForLocation:", (uint8_t *)&v14, 0xCu);
  }
  int v7 = (void *)[objc_alloc(MEMORY[0x1E4F64660]) initWithCLLocation:v4];
  id v8 = [(GEORouteMatcher *)self->_routeMatcher matchToRouteWithLocation:v7];
  int v9 = [v8 isGoodMatch];
  objc_super v10 = [MNLocation alloc];
  if (v9)
  {
    v11 = [(MNLocation *)v10 initWithRouteMatch:v8 rawLocation:v4 locationMatchType:0];
  }
  else
  {
    v11 = [(MNLocation *)v10 initWithRawLocation:v4];
    [(MNLocation *)v11 setRouteMatch:v8];
  }
  if (GEOConfigGetBOOL())
  {
    v12 = [v4 uuid];
    [(MNLocation *)v11 setUuid:v12];
  }
  return v11;
}

- (void)updateLocation:(id)a3
{
  id v4 = a3;
  if (-[MNLocationTracker state](self, "state") == 1 && [v4 stepIndex] != 0x7FFFFFFFFFFFFFFFLL) {
    [(MNLocationTracker *)self _setState:2];
  }
}

- (void)arrivalUpdater:(id)a3 didUpdateArrivalInfo:(id)a4
{
  id v5 = a4;
  if ([v5 arrivalState] == 4) {
    [(MNLocationTracker *)self _updateArrivalInfo:v5];
  }
}

- (void)arrivalUpdaterDidArrive:(id)a3 atEndOfLegAtIndex:(unint64_t)a4
{
  id v5 = [(MNLocationTracker *)self safeDelegate];
  [v5 locationTrackerDidArrive:self];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_arrivalUpdater, 0);
  objc_storeStrong((id *)&self->_routeMatcher, 0);
}

@end