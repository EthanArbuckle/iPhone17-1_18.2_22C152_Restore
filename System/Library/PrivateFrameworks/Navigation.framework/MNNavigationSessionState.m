@interface MNNavigationSessionState
- (BOOL)hasBeenOnRouteOnce;
- (BOOL)isDisplayingNavigationTray;
- (BOOL)isOnLastLeg;
- (GEOApplicationAuditToken)auditToken;
- (GEOComposedRouteLeg)nextLeg;
- (GEOComposedRouteLeg)targetLeg;
- (GEOComposedWaypoint)currentWaypoint;
- (GEOComposedWaypoint)destination;
- (GEOMapServiceTraits)traits;
- (MNActiveRouteInfo)currentRouteInfo;
- (MNLocation)location;
- (MNNavigationSessionState)initWithLocation:(id)a3 currentRouteInfo:(id)a4 alternateRouteInfos:(id)a5 targetLegIndex:(unint64_t)a6;
- (NSArray)alternateRouteInfos;
- (NSString)requestingAppIdentifier;
- (id)_locationStateAsString:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int)navigationState;
- (int64_t)arrivalState;
- (int64_t)upcomingAnchorPointIndex;
- (unint64_t)initialRouteSource;
- (unint64_t)lastRerouteReason;
- (unint64_t)targetLegIndex;
- (void)setAlternateRouteInfos:(id)a3;
- (void)setArrivalState:(int64_t)a3;
- (void)setAuditToken:(id)a3;
- (void)setHasBeenOnRouteOnce:(BOOL)a3;
- (void)setInitialRouteSource:(unint64_t)a3;
- (void)setIsDisplayingNavigationTray:(BOOL)a3;
- (void)setLocation:(id)a3;
- (void)setNavigationState:(int)a3;
- (void)setRequestingAppIdentifier:(id)a3;
- (void)setTargetLegIndex:(unint64_t)a3;
- (void)setTraits:(id)a3;
- (void)setUpcomingAnchorPointIndex:(int64_t)a3;
- (void)updateCurrentRouteInfo:(id)a3 rerouteReason:(unint64_t)a4;
@end

@implementation MNNavigationSessionState

- (MNNavigationSessionState)initWithLocation:(id)a3 currentRouteInfo:(id)a4 alternateRouteInfos:(id)a5 targetLegIndex:(unint64_t)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  v18.receiver = self;
  v18.super_class = (Class)MNNavigationSessionState;
  v14 = [(MNNavigationSessionState *)&v18 init];
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_location, a3);
    objc_storeStrong((id *)&v15->_currentRouteInfo, a4);
    v15->_targetLegIndex = a6;
    v15->_upcomingAnchorPointIndex = 0x7FFFFFFFFFFFFFFFLL;
    objc_storeStrong((id *)&v15->_alternateRouteInfos, a5);
    v16 = v15;
  }

  return v15;
}

- (void)updateCurrentRouteInfo:(id)a3 rerouteReason:(unint64_t)a4
{
  self->_lastRerouteReason = a4;
}

- (GEOComposedWaypoint)currentWaypoint
{
  currentRouteInfo = self->_currentRouteInfo;
  if (currentRouteInfo)
  {
    if (self->_targetLegIndex == 0x7FFFFFFFFFFFFFFFLL) {
      unint64_t targetLegIndex = 0;
    }
    else {
      unint64_t targetLegIndex = self->_targetLegIndex;
    }
    v5 = [(MNActiveRouteInfo *)currentRouteInfo route];
    v6 = [v5 legs];
    unint64_t v7 = [v6 count];

    v8 = [(MNActiveRouteInfo *)self->_currentRouteInfo route];
    v9 = v8;
    if (targetLegIndex >= v7)
    {
      id v12 = [v8 destination];
    }
    else
    {
      v10 = [v8 legs];
      id v11 = [v10 objectAtIndexedSubscript:targetLegIndex];
      id v12 = [v11 destination];
    }
  }
  else
  {
    id v12 = 0;
  }
  return (GEOComposedWaypoint *)v12;
}

- (GEOComposedWaypoint)destination
{
  v2 = [(MNActiveRouteInfo *)self->_currentRouteInfo route];
  v3 = [v2 destination];

  return (GEOComposedWaypoint *)v3;
}

- (GEOComposedRouteLeg)targetLeg
{
  currentRouteInfo = self->_currentRouteInfo;
  if (!currentRouteInfo) {
    goto LABEL_7;
  }
  unint64_t targetLegIndex = self->_targetLegIndex;
  v5 = [(MNActiveRouteInfo *)currentRouteInfo route];
  v6 = [v5 legs];
  unint64_t v7 = [v6 count];

  if (targetLegIndex < v7)
  {
    v8 = [(MNActiveRouteInfo *)self->_currentRouteInfo route];
    v9 = [v8 legs];
    v10 = [v9 objectAtIndexedSubscript:self->_targetLegIndex];
  }
  else
  {
LABEL_7:
    v10 = 0;
  }
  return (GEOComposedRouteLeg *)v10;
}

- (GEOComposedRouteLeg)nextLeg
{
  if ([(MNNavigationSessionState *)self isOnLastLeg])
  {
    v5 = 0;
  }
  else
  {
    v3 = [(MNActiveRouteInfo *)self->_currentRouteInfo route];
    v4 = [v3 legs];
    v5 = [v4 objectAtIndexedSubscript:self->_targetLegIndex + 1];
  }
  return (GEOComposedRouteLeg *)v5;
}

- (BOOL)isOnLastLeg
{
  unint64_t targetLegIndex = self->_targetLegIndex;
  if (targetLegIndex == 0x7FFFFFFFFFFFFFFFLL) {
    return 0;
  }
  v4 = [(MNActiveRouteInfo *)self->_currentRouteInfo route];
  v5 = [v4 legs];
  BOOL v3 = targetLegIndex >= [v5 count] - 1;

  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = +[MNNavigationSessionState allocWithZone:a3];
  objc_storeStrong((id *)&v4->_auditToken, self->_auditToken);
  objc_storeStrong((id *)&v4->_requestingAppIdentifier, self->_requestingAppIdentifier);
  objc_storeStrong((id *)&v4->_traits, self->_traits);
  v4->_initialRouteSource = self->_initialRouteSource;
  v4->_navigationState = self->_navigationState;
  objc_storeStrong((id *)&v4->_location, self->_location);
  objc_storeStrong((id *)&v4->_currentRouteInfo, self->_currentRouteInfo);
  v4->_lastRerouteReason = self->_lastRerouteReason;
  uint64_t v5 = [(NSArray *)self->_alternateRouteInfos copy];
  alternateRouteInfos = v4->_alternateRouteInfos;
  v4->_alternateRouteInfos = (NSArray *)v5;

  v4->_unint64_t targetLegIndex = self->_targetLegIndex;
  v4->_upcomingAnchorPointIndex = self->_upcomingAnchorPointIndex;
  v4->_hasBeenOnRouteOnce = self->_hasBeenOnRouteOnce;
  v4->_arrivalState = self->_arrivalState;
  v4->_isDisplayingNavigationTray = self->_isDisplayingNavigationTray;
  return v4;
}

- (id)description
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  BOOL v3 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:4];
  uint64_t navigationState = self->_navigationState;
  unint64_t v5 = 0x1E4F29000uLL;
  if (navigationState >= 9)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_navigationState);
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = off_1E60FAE20[navigationState];
  }
  [v3 addObject:v6];

  unint64_t v7 = NSString;
  [(MNLocation *)self->_location coordinate];
  uint64_t v9 = v8;
  [(MNLocation *)self->_location coordinate];
  uint64_t v11 = v10;
  id v12 = [(MNNavigationSessionState *)self _locationStateAsString:[(MNLocation *)self->_location state]];
  id v13 = [v7 stringWithFormat:@"Location: %f, %f | (%@)", v9, v11, v12];
  [v3 addObject:v13];

  v14 = NSString;
  v15 = [(MNActiveRouteInfo *)self->_currentRouteInfo route];
  v16 = [v15 name];
  v17 = [(MNActiveRouteInfo *)self->_currentRouteInfo routeID];
  objc_super v18 = [v14 stringWithFormat:@"Current route: %@ (%@)", v16, v17];
  v42 = v3;
  [v3 addObject:v18];

  v43 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", -[NSArray count](self->_alternateRouteInfos, "count"));
  long long v44 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  v41 = self;
  v19 = self->_alternateRouteInfos;
  uint64_t v20 = [(NSArray *)v19 countByEnumeratingWithState:&v44 objects:v48 count:16];
  if (v20)
  {
    uint64_t v21 = v20;
    uint64_t v22 = *(void *)v45;
    do
    {
      for (uint64_t i = 0; i != v21; ++i)
      {
        if (*(void *)v45 != v22) {
          objc_enumerationMutation(v19);
        }
        v24 = *(void **)(*((void *)&v44 + 1) + 8 * i);
        unint64_t v25 = v5;
        v26 = *(void **)(v5 + 24);
        v27 = [v24 route];
        v28 = [v27 name];
        v29 = [v24 routeID];
        v30 = [v26 stringWithFormat:@"%@ (%@)", v28, v29];
        [v43 addObject:v30];

        unint64_t v5 = v25;
      }
      uint64_t v21 = [(NSArray *)v19 countByEnumeratingWithState:&v44 objects:v48 count:16];
    }
    while (v21);
  }

  v31 = *(void **)(v5 + 24);
  v32 = [v43 componentsJoinedByString:@" | "];
  v33 = [v31 stringWithFormat:@"Alternate routes: %@", v32];
  [v42 addObject:v33];

  v34 = objc_msgSend(*(id *)(v5 + 24), "stringWithFormat:", @"Target leg index: %d", v41->_targetLegIndex);
  [v42 addObject:v34];

  unint64_t arrivalState = v41->_arrivalState;
  if (arrivalState > 6) {
    v36 = @"MNArrivalState_Unknown";
  }
  else {
    v36 = off_1E60FAE68[arrivalState];
  }
  v37 = [*(id *)(v5 + 24) stringWithFormat:@"Arrival state: %@", v36];
  [v42 addObject:v37];

  v38 = objc_msgSend(*(id *)(v5 + 24), "stringWithFormat:", @"Displaying nav tray: %d", v41->_isDisplayingNavigationTray);
  [v42 addObject:v38];

  v39 = [v42 componentsJoinedByString:@"\n"];

  return v39;
}

- (id)_locationStateAsString:(unint64_t)a3
{
  BOOL v3 = @"On route";
  if (a3 == 2) {
    BOOL v3 = @"Off route, on road";
  }
  if (a3) {
    return v3;
  }
  else {
    return @"Off route, off road";
  }
}

- (GEOApplicationAuditToken)auditToken
{
  return self->_auditToken;
}

- (void)setAuditToken:(id)a3
{
}

- (NSString)requestingAppIdentifier
{
  return self->_requestingAppIdentifier;
}

- (void)setRequestingAppIdentifier:(id)a3
{
}

- (unint64_t)initialRouteSource
{
  return self->_initialRouteSource;
}

- (void)setInitialRouteSource:(unint64_t)a3
{
  self->_initialRouteSource = a3;
}

- (int)navigationState
{
  return self->_navigationState;
}

- (void)setNavigationState:(int)a3
{
  self->_uint64_t navigationState = a3;
}

- (MNLocation)location
{
  return self->_location;
}

- (void)setLocation:(id)a3
{
}

- (MNActiveRouteInfo)currentRouteInfo
{
  return self->_currentRouteInfo;
}

- (unint64_t)lastRerouteReason
{
  return self->_lastRerouteReason;
}

- (NSArray)alternateRouteInfos
{
  return self->_alternateRouteInfos;
}

- (void)setAlternateRouteInfos:(id)a3
{
}

- (unint64_t)targetLegIndex
{
  return self->_targetLegIndex;
}

- (void)setTargetLegIndex:(unint64_t)a3
{
  self->_unint64_t targetLegIndex = a3;
}

- (int64_t)arrivalState
{
  return self->_arrivalState;
}

- (void)setArrivalState:(int64_t)a3
{
  self->_unint64_t arrivalState = a3;
}

- (BOOL)isDisplayingNavigationTray
{
  return self->_isDisplayingNavigationTray;
}

- (void)setIsDisplayingNavigationTray:(BOOL)a3
{
  self->_isDisplayingNavigationTray = a3;
}

- (GEOMapServiceTraits)traits
{
  return self->_traits;
}

- (void)setTraits:(id)a3
{
}

- (int64_t)upcomingAnchorPointIndex
{
  return self->_upcomingAnchorPointIndex;
}

- (void)setUpcomingAnchorPointIndex:(int64_t)a3
{
  self->_upcomingAnchorPointIndex = a3;
}

- (BOOL)hasBeenOnRouteOnce
{
  return self->_hasBeenOnRouteOnce;
}

- (void)setHasBeenOnRouteOnce:(BOOL)a3
{
  self->_hasBeenOnRouteOnce = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_traits, 0);
  objc_storeStrong((id *)&self->_alternateRouteInfos, 0);
  objc_storeStrong((id *)&self->_currentRouteInfo, 0);
  objc_storeStrong((id *)&self->_location, 0);
  objc_storeStrong((id *)&self->_requestingAppIdentifier, 0);
  objc_storeStrong((id *)&self->_auditToken, 0);
}

@end