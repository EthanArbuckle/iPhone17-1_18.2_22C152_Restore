@interface NanoRoutePlanningResponse
+ (BOOL)_canRunNavigationForRoute:(id)a3;
+ (BOOL)supportsSecureCoding;
+ (void)clearDiskRouteStorage;
- (BOOL)canNavigateRouteWithID:(id)a3;
- (BOOL)hasReceivedAllExpectedRoutes;
- (GEOComposedRoute)selectedRoute;
- (GEODirectionsRequest)directionsRequest;
- (GEODirectionsResponse)directionsResponse;
- (MNTraceRecordingData)traceRecordingData;
- (NSArray)companionRoutes;
- (NSArray)routeIDs;
- (NSArray)routes;
- (NSError)lastError;
- (NSUUID)selectedRouteID;
- (NanoRoutePlanningResponse)init;
- (NanoRoutePlanningResponse)initWithCoder:(id)a3;
- (id)_generateCompanionRouteFromComposedRoute:(id)a3;
- (id)companionRouteWithID:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (id)routeWithID:(id)a3;
- (id)selectedCompanionRoute;
- (id)snapshot;
- (id)userInfoForRouteWithID:(id)a3;
- (unint64_t)expectedNumberOfRoutes;
- (unint64_t)numberOfRoutes;
- (unint64_t)routeOrigin;
- (unint64_t)selectedRouteIndex;
- (void)_generateCompanionRoutesFromComposedRoutes;
- (void)_populateCopy:(id)a3;
- (void)_setRoutes:(id)a3 withRouteIDs:(id)a4;
- (void)encodeWithCoder:(id)a3;
- (void)setCompanionRoutes:(id)a3;
- (void)setDirectionsRequest:(id)a3;
- (void)setDirectionsResponse:(id)a3;
- (void)setExpectedNumberOfRoutes:(unint64_t)a3;
- (void)setLastError:(id)a3;
- (void)setObject:(id)a3 forUserInfoKey:(id)a4 forRouteID:(id)a5;
- (void)setRouteOrigin:(unint64_t)a3;
- (void)setRoutes:(id)a3;
- (void)setSelectedRouteID:(id)a3;
- (void)setTraceRecordingData:(id)a3;
@end

@implementation NanoRoutePlanningResponse

- (NanoRoutePlanningResponse)init
{
  v3.receiver = self;
  v3.super_class = (Class)NanoRoutePlanningResponse;
  result = [(NanoRoutePlanningResponse *)&v3 init];
  if (result) {
    result->_routeOrigin = 1;
  }
  return result;
}

- (id)description
{
  uint64_t v3 = objc_opt_class();
  v4 = [(NanoRoutePlanningResponse *)self routeIDs];
  v5 = [(NanoRoutePlanningResponse *)self lastError];
  v6 = +[NSString stringWithFormat:@"<%@: %p, routeIDs: %@, error: %@, (%lu/%lu)>", v3, self, v4, v5, [(NanoRoutePlanningResponse *)self numberOfRoutes], [(NanoRoutePlanningResponse *)self expectedNumberOfRoutes]];

  return v6;
}

+ (BOOL)_canRunNavigationForRoute:(id)a3
{
  return _[a3 isNavigableForWatch];
}

- (void)setRoutes:(id)a3
{
  v4 = (NSArray *)a3;
  routes = self->_routes;
  if (routes != v4)
  {
    v7 = v4;
    unsigned __int8 v6 = [(NSArray *)routes isEqualToArray:v4];
    v4 = v7;
    if ((v6 & 1) == 0)
    {
      [(NanoRoutePlanningResponse *)self _setRoutes:v7 withRouteIDs:0];
      v4 = v7;
    }
  }
}

- (void)_setRoutes:(id)a3 withRouteIDs:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  objc_storeStrong((id *)&self->_routes, a3);
  id v9 = objc_msgSend(objc_alloc((Class)NSMutableDictionary), "initWithCapacity:", objc_msgSend(v7, "count"));
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_100487F18;
  v16[3] = &unk_1012EB938;
  id v10 = v8;
  id v17 = v10;
  v18 = self;
  id v11 = v9;
  id v19 = v11;
  [v7 enumerateObjectsWithOptions:0 usingBlock:v16];
  v12 = (NSDictionary *)[v11 copy];
  userInfoByRouteID = self->_userInfoByRouteID;
  self->_userInfoByRouteID = v12;

  if (v10)
  {
    v14 = (NSArray *)v10;
LABEL_5:
    routeIDs = self->_routeIDs;
    self->_routeIDs = v14;

    goto LABEL_6;
  }
  if (v7)
  {
    sub_100099700(v7, &stru_1012EB978);
    v14 = (NSArray *)objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }
LABEL_6:
}

- (void)setObject:(id)a3 forUserInfoKey:(id)a4 forRouteID:(id)a5
{
  if (a5)
  {
    id v8 = a5;
    id v9 = a4;
    id v10 = a3;
    id v11 = [(NanoRoutePlanningResponse *)self userInfoForRouteWithID:v8];
    id v12 = [v11 mutableCopy];
    v13 = v12;
    if (v12) {
      id v14 = v12;
    }
    else {
      id v14 = objc_alloc_init((Class)NSMutableDictionary);
    }
    id v22 = v14;

    [v22 setObject:v10 forKeyedSubscript:v9];
    id v15 = [(NSDictionary *)self->_userInfoByRouteID mutableCopy];
    v16 = v15;
    if (v15) {
      id v17 = v15;
    }
    else {
      id v17 = objc_alloc_init((Class)NSMutableDictionary);
    }
    v18 = v17;

    id v19 = [v22 copy];
    [v18 setObject:v19 forKeyedSubscript:v8];

    v20 = (NSDictionary *)[v18 copy];
    userInfoByRouteID = self->_userInfoByRouteID;
    self->_userInfoByRouteID = v20;
  }
}

- (NSArray)companionRoutes
{
  uint64_t v3 = [(NSArray *)self->_routes count];
  if (v3)
  {
    if ([(NSArray *)self->_companionRoutes count])
    {
      v4 = sub_1005768D4();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
      {
        NSUInteger v5 = [(NSArray *)self->_routes count];
        NSUInteger v6 = [(NSArray *)self->_companionRoutes count];
        *(_DWORD *)buf = 134217984;
        NSUInteger v20 = v5 - v6;
        _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Will construct %lu remaining companion routes from composed routes", buf, 0xCu);
      }

      long long v16 = 0u;
      long long v17 = 0u;
      long long v14 = 0u;
      long long v15 = 0u;
      id v7 = [(NanoRoutePlanningResponse *)self routes];
      id v8 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v8)
      {
        id v9 = v8;
        uint64_t v10 = *(void *)v15;
        do
        {
          id v11 = 0;
          do
          {
            if (*(void *)v15 != v10) {
              objc_enumerationMutation(v7);
            }
            id v12 = [(NanoRoutePlanningResponse *)self _generateCompanionRouteFromComposedRoute:*(void *)(*((void *)&v14 + 1) + 8 * (void)v11)];
            id v11 = (char *)v11 + 1;
          }
          while (v9 != v11);
          id v9 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
        }
        while (v9);
      }
    }
    else
    {
      [(NanoRoutePlanningResponse *)self _generateCompanionRoutesFromComposedRoutes];
    }
    uint64_t v3 = self->_companionRoutes;
  }

  return v3;
}

- (id)selectedCompanionRoute
{
  uint64_t v3 = [(NanoRoutePlanningResponse *)self selectedRouteID];
  if (v3)
  {
    v4 = [(NanoRoutePlanningResponse *)self companionRouteWithID:v3];
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)companionRouteWithID:(id)a3
{
  id v4 = a3;
  if ([(NanoRoutePlanningResponse *)self numberOfRoutes])
  {
    NSUInteger v5 = [v4 _maps_data];
    uint64_t v30 = 0;
    v31 = &v30;
    uint64_t v32 = 0x3032000000;
    v33 = sub_100103C3C;
    v34 = sub_1001046A8;
    id v35 = 0;
    companionRoutes = self->_companionRoutes;
    v24 = _NSConcreteStackBlock;
    uint64_t v25 = 3221225472;
    v26 = sub_100488624;
    v27 = &unk_1012EB9A0;
    id v7 = v5;
    id v28 = v7;
    v29 = &v30;
    [(NSArray *)companionRoutes enumerateObjectsWithOptions:1 usingBlock:&v24];
    id v8 = (void *)v31[5];
    if (!v8)
    {
      id v9 = -[NanoRoutePlanningResponse routeWithID:](self, "routeWithID:", v4, v24, v25, v26, v27);
      uint64_t v10 = [(NanoRoutePlanningResponse *)self routes];
      id v11 = [v10 indexOfObject:v9];

      if (v11 != (id)0x7FFFFFFFFFFFFFFFLL)
      {
        uint64_t v12 = [(NanoRoutePlanningResponse *)self _generateCompanionRouteFromComposedRoute:v9];
        v13 = (void *)v31[5];
        v31[5] = v12;

        id v14 = [(NSArray *)self->_companionRoutes mutableCopy];
        long long v15 = v14;
        if (v14)
        {
          id v16 = v14;
        }
        else
        {
          id v18 = objc_alloc((Class)NSMutableArray);
          id v19 = [(NanoRoutePlanningResponse *)self routes];
          id v16 = [v18 initWithCapacity:[v19 count]];
        }
        uint64_t v20 = v31[5];
        if ([v16 count] < v11) {
          id v11 = [v16 count];
        }
        [v16 insertObject:v20 atIndex:v11];
        v21 = (NSArray *)[v16 copy];
        id v22 = self->_companionRoutes;
        self->_companionRoutes = v21;
      }
      id v8 = (void *)v31[5];
    }
    id v17 = v8;

    _Block_object_dispose(&v30, 8);
  }
  else
  {
    id v17 = 0;
  }

  return v17;
}

- (void)_generateCompanionRoutesFromComposedRoutes
{
  if ([(NSArray *)self->_routes count])
  {
    uint64_t v3 = sub_1005768D4();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      NSUInteger v4 = [(NSArray *)self->_routes count];
      *(_DWORD *)buf = 134217984;
      NSUInteger v11 = v4;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "Will construct %lu companion routes from composed routes", buf, 0xCu);
    }

    routes = self->_routes;
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_100488818;
    v9[3] = &unk_1012EB9C8;
    v9[4] = self;
    sub_100099700(routes, v9);
    NSUInteger v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    companionRoutes = self->_companionRoutes;
    self->_companionRoutes = v6;
  }
  else
  {
    id v8 = self->_companionRoutes;
    self->_companionRoutes = 0;
  }
}

- (id)_generateCompanionRouteFromComposedRoute:(id)a3
{
  id v4 = a3;
  NSUInteger v5 = +[MNNanoFormattedStringFormatter sharedFormatter];
  NSUInteger v6 = [v4 destination];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  id v8 = [v4 destination];
  id v9 = v8;
  if (isKindOfClass)
  {
    uint64_t v10 = [v8 name];
  }
  else
  {
    NSUInteger v11 = [v8 geoMapItem];
    uint64_t v10 = [v11 name];
  }
  id v12 = [objc_alloc((Class)GEOCompanionRouteDetails) initWithRoute:v4 destinationName:v10 stringFormatter:v5 traffic:0];
  v13 = [v4 uniqueRouteID];
  id v14 = [(NanoRoutePlanningResponse *)self userInfoForRouteWithID:v13];
  long long v15 = [v14 objectForKeyedSubscript:@"canNavigate"];

  if (v15) {
    id v16 = [v15 BOOLValue];
  }
  else {
    id v16 = [(id)objc_opt_class() _canRunNavigationForRoute:v4];
  }
  [v12 setCanNavigate:v16];
  id v17 = [(NanoRoutePlanningResponse *)self directionsRequest];
  [v12 setRequest:v17];

  id v18 = [(NanoRoutePlanningResponse *)self directionsResponse];
  id v19 = [v18 preJupiterCompatibleDirectionsResponseWithRoute:v4];
  [v12 setResponse:v19];

  return v12;
}

- (unint64_t)numberOfRoutes
{
  routes = self->_routes;
  if (!routes) {
    routes = self->_companionRoutes;
  }
  return [(NSArray *)routes count];
}

- (BOOL)hasReceivedAllExpectedRoutes
{
  unint64_t v3 = [(NanoRoutePlanningResponse *)self numberOfRoutes];
  if (v3)
  {
    unint64_t expectedNumberOfRoutes = self->_expectedNumberOfRoutes;
    if (expectedNumberOfRoutes) {
      BOOL v5 = v3 == expectedNumberOfRoutes;
    }
    else {
      BOOL v5 = 1;
    }
    LOBYTE(v3) = v5;
  }
  return v3;
}

- (NSUUID)selectedRouteID
{
  selectedRouteID = self->_selectedRouteID;
  if (selectedRouteID)
  {
    unint64_t v3 = selectedRouteID;
  }
  else
  {
    unint64_t v3 = [(NSArray *)self->_routeIDs firstObject];
  }

  return v3;
}

- (GEOComposedRoute)selectedRoute
{
  unint64_t v3 = [(NanoRoutePlanningResponse *)self selectedRouteID];
  if (v3)
  {
    id v4 = [(NanoRoutePlanningResponse *)self routeWithID:v3];
  }
  else
  {
    id v4 = 0;
  }

  return (GEOComposedRoute *)v4;
}

- (unint64_t)selectedRouteIndex
{
  unint64_t v3 = [(NanoRoutePlanningResponse *)self selectedRouteID];
  if (v3)
  {
    id v4 = [(NanoRoutePlanningResponse *)self routeIDs];
    unint64_t v5 = (unint64_t)[v4 indexOfObject:v3];
  }
  else
  {
    unint64_t v5 = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v5;
}

- (id)routeWithID:(id)a3
{
  id v4 = a3;
  if ([(NanoRoutePlanningResponse *)self numberOfRoutes])
  {
    uint64_t v11 = 0;
    id v12 = &v11;
    uint64_t v13 = 0x3032000000;
    id v14 = sub_100103C3C;
    long long v15 = sub_1001046A8;
    id v16 = 0;
    unint64_t v5 = [(NanoRoutePlanningResponse *)self routes];
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_100488CA4;
    v8[3] = &unk_1012EAD78;
    id v9 = v4;
    uint64_t v10 = &v11;
    [v5 enumerateObjectsWithOptions:1 usingBlock:v8];

    id v6 = (id)v12[5];
    _Block_object_dispose(&v11, 8);
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (id)userInfoForRouteWithID:(id)a3
{
  unint64_t v5 = 0;
  if (a3)
  {
    userInfoByRouteID = self->_userInfoByRouteID;
    if (userInfoByRouteID)
    {
      unint64_t v5 = -[NSDictionary objectForKeyedSubscript:](userInfoByRouteID, "objectForKeyedSubscript:");
    }
    uint64_t v3 = vars8;
  }
  return v5;
}

- (BOOL)canNavigateRouteWithID:(id)a3
{
  uint64_t v3 = [(NanoRoutePlanningResponse *)self userInfoForRouteWithID:a3];
  id v4 = [v3 objectForKeyedSubscript:@"canNavigate"];
  unsigned __int8 v5 = [v4 BOOLValue];

  return v5;
}

- (id)snapshot
{
  uint64_t v3 = objc_alloc_init(NanoRoutePlanningResponseSnapshot);
  id v4 = [(NanoRoutePlanningResponse *)self routeIDs];
  [(NanoRoutePlanningResponseSnapshot *)v3 setRouteIdentifiers:v4];

  unsigned __int8 v5 = [(NanoRoutePlanningResponse *)self selectedRouteID];
  [(NanoRoutePlanningResponseSnapshot *)v3 setSelectedRouteIdentifier:v5];

  if ([(NSArray *)self->_routes count])
  {
    id v6 = sub_100099700(self->_routes, &stru_1012EB9E8);
    [(NanoRoutePlanningResponseSnapshot *)v3 setRevisionIdentifiers:v6];

    id v7 = sub_100099700(self->_routes, &stru_1012EBA28);
    [(NanoRoutePlanningResponseSnapshot *)v3 setSelectedRideIndexes:v7];
  }
  else
  {
    if (![(NSArray *)self->_companionRoutes count]) {
      goto LABEL_6;
    }
    id v7 = sub_100099700(self->_companionRoutes, &stru_1012EBA68);
    [(NanoRoutePlanningResponseSnapshot *)v3 setRevisionIdentifiers:v7];
  }

LABEL_6:

  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init(NanoRoutePlanningResponse);
  [(NanoRoutePlanningResponse *)self _populateCopy:v4];
  return v4;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init(NanoRoutePlanningMutableResponse);
  [(NanoRoutePlanningResponse *)self _populateCopy:v4];
  return v4;
}

- (void)_populateCopy:(id)a3
{
  objc_storeStrong((id *)a3 + 2, self->_routeIDs);
  unsigned __int8 v5 = (id *)a3;
  objc_storeStrong(v5 + 3, self->_routes);
  objc_storeStrong(v5 + 4, self->_companionRoutes);
  v5[10] = self->_routeOrigin;
  objc_storeStrong(v5 + 5, self->_selectedRouteID);
  v5[11] = self->_expectedNumberOfRoutes;
  objc_storeStrong(v5 + 7, self->_traceRecordingData);
  objc_storeStrong(v5 + 8, self->_directionsRequest);
  objc_storeStrong(v5 + 9, self->_directionsResponse);
  objc_storeStrong(v5 + 1, self->_userInfoByRouteID);
  objc_storeStrong(v5 + 6, self->_lastError);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NanoRoutePlanningResponse)initWithCoder:(id)a3
{
  id v4 = a3;
  v38.receiver = self;
  v38.super_class = (Class)NanoRoutePlanningResponse;
  unsigned __int8 v5 = [(NanoRoutePlanningResponse *)&v38 init];
  if (v5)
  {
    uint64_t v6 = objc_opt_class();
    id v7 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v6, objc_opt_class(), 0);
    id v8 = [v4 decodeObjectOfClasses:v7 forKey:@"_routeIDs"];

    if ([v4 decodeBoolForKey:@"DiskRouteStorage"] && v8)
    {
      id v9 = sub_100099700(v8, &stru_1012EBAA8);
    }
    else
    {
      uint64_t v10 = objc_opt_class();
      uint64_t v11 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v10, objc_opt_class(), 0);
      id v9 = [v4 decodeObjectOfClasses:v11 forKey:@"_routes"];
    }
    [(NanoRoutePlanningResponse *)v5 _setRoutes:v9 withRouteIDs:v8];
    id v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_routeOrigin"];
    v5->_routeOrigin = (unint64_t)[v12 unsignedIntegerValue];

    uint64_t v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_selectedRouteID"];
    selectedRouteID = v5->_selectedRouteID;
    v5->_selectedRouteID = (NSUUID *)v13;

    long long v15 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_expectedNumberOfRoutes"];
    v5->_unint64_t expectedNumberOfRoutes = (unint64_t)[v15 unsignedIntegerValue];

    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_traceRecordingData"];
    traceRecordingData = v5->_traceRecordingData;
    v5->_traceRecordingData = (MNTraceRecordingData *)v16;

    uint64_t v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_directionsRequest"];
    directionsRequest = v5->_directionsRequest;
    v5->_directionsRequest = (GEODirectionsRequest *)v18;

    uint64_t v20 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_directionsResponse"];
    directionsResponse = v5->_directionsResponse;
    v5->_directionsResponse = (GEODirectionsResponse *)v20;

    uint64_t v22 = objc_opt_class();
    v23 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v22, objc_opt_class(), 0);
    uint64_t v24 = [v4 decodeObjectOfClasses:v23 forKey:@"_lastError"];
    lastError = v5->_lastError;
    v5->_lastError = (NSError *)v24;

    uint64_t v26 = objc_opt_class();
    uint64_t v27 = objc_opt_class();
    uint64_t v28 = objc_opt_class();
    uint64_t v29 = objc_opt_class();
    uint64_t v30 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v26, v27, v28, v29, objc_opt_class(), 0);
    v31 = [v4 decodeObjectOfClasses:v30 forKey:@"_userInfoByRouteID"];
    uint64_t v32 = (NSDictionary *)[v31 mutableCopy];
    userInfoByRouteID = v5->_userInfoByRouteID;
    v5->_userInfoByRouteID = v32;

    v34 = v5->_userInfoByRouteID;
    v36[0] = _NSConcreteStackBlock;
    v36[1] = 3221225472;
    v36[2] = sub_10048950C;
    v36[3] = &unk_1012EBAD0;
    v37 = v5;
    [(NSDictionary *)v34 enumerateKeysAndObjectsUsingBlock:v36];
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  [v4 encodeObject:self->_routeIDs forKey:@"_routeIDs"];
  int BOOL = GEOConfigGetBOOL();
  int v6 = BOOL;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100489A48;
  block[3] = &unk_1012EBAF0;
  char v32 = BOOL;
  if (qword_10160EDA0 != -1)
  {
    dispatch_once(&qword_10160EDA0, block);
    if (v6) {
      goto LABEL_3;
    }
LABEL_23:
    [v4 encodeObject:self->_routes forKey:@"_routes"];
    goto LABEL_24;
  }
  if (!BOOL) {
    goto LABEL_23;
  }
LABEL_3:
  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v7 = self->_routes;
  id v8 = [(NSArray *)v7 countByEnumeratingWithState:&v27 objects:v39 count:16];
  if (!v8) {
    goto LABEL_11;
  }
  id v9 = v8;
  uint64_t v10 = *(void *)v28;
  while (2)
  {
    for (i = 0; i != v9; i = (char *)i + 1)
    {
      if (*(void *)v28 != v10) {
        objc_enumerationMutation(v7);
      }
      id v12 = *(void **)(*((void *)&v27 + 1) + 8 * i);
      char v13 = MNSaveRouteWithSubpath();
      id v14 = 0;
      long long v15 = v14;
      if ((v13 & 1) == 0)
      {
        uint64_t v16 = sub_1005768D4();
        if (!os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        {
LABEL_22:

          [v4 encodeBool:1 forKey:@"DiskRouteStorage"];
          goto LABEL_23;
        }
        id v17 = self;
        if (!v17)
        {
          uint64_t v22 = @"<nil>";
          goto LABEL_21;
        }
        uint64_t v18 = (objc_class *)objc_opt_class();
        id v19 = NSStringFromClass(v18);
        if (objc_opt_respondsToSelector())
        {
          uint64_t v20 = [(NanoRoutePlanningResponse *)v17 performSelector:"accessibilityIdentifier"];
          v21 = v20;
          if (v20 && ![v20 isEqualToString:v19])
          {
            uint64_t v22 = +[NSString stringWithFormat:@"%@<%p, %@>", v19, v17, v21];

            goto LABEL_19;
          }
        }
        uint64_t v22 = +[NSString stringWithFormat:@"%@<%p>", v19, v17];
LABEL_19:

LABEL_21:
        v23 = v22;
        uint64_t v24 = [v12 uniqueRouteID];

        *(_DWORD *)buf = 138543874;
        v34 = v22;
        __int16 v35 = 2114;
        v36 = v24;
        __int16 v37 = 2112;
        objc_super v38 = v15;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "[%{public}@] Failed to write route %{public}@ to disk: %@", buf, 0x20u);

        goto LABEL_22;
      }
    }
    id v9 = [(NSArray *)v7 countByEnumeratingWithState:&v27 objects:v39 count:16];
    if (v9) {
      continue;
    }
    break;
  }
LABEL_11:

  [v4 encodeBool:1 forKey:@"DiskRouteStorage"];
LABEL_24:
  [v4 encodeObject:self->_selectedRouteID forKey:@"_selectedRouteID"];
  uint64_t v25 = +[NSNumber numberWithUnsignedInteger:self->_routeOrigin];
  [v4 encodeObject:v25 forKey:@"_routeOrigin"];

  uint64_t v26 = +[NSNumber numberWithUnsignedInteger:self->_expectedNumberOfRoutes];
  [v4 encodeObject:v26 forKey:@"_expectedNumberOfRoutes"];

  [v4 encodeObject:self->_traceRecordingData forKey:@"_traceRecordingData"];
  [v4 encodeObject:self->_directionsRequest forKey:@"_directionsRequest"];
  [v4 encodeObject:self->_directionsResponse forKey:@"_directionsResponse"];
  [v4 encodeObject:self->_lastError forKey:@"_lastError"];
  [v4 encodeObject:self->_userInfoByRouteID forKey:@"_userInfoByRouteID"];
}

+ (void)clearDiskRouteStorage
{
  v2 = sub_1005768D4();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    int v4 = 138543362;
    CFStringRef v5 = @"planning";
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "Clearing disk route storage at subpath %{public}@", (uint8_t *)&v4, 0xCu);
  }

  uint64_t v3 = MNRecommendedDateForClearingRoutes();
  MNClearStoredRoutesWithSubpathUsedBefore();
}

- (NSArray)routes
{
  return self->_routes;
}

- (void)setCompanionRoutes:(id)a3
{
}

- (NSArray)routeIDs
{
  return self->_routeIDs;
}

- (void)setSelectedRouteID:(id)a3
{
}

- (NSError)lastError
{
  return self->_lastError;
}

- (void)setLastError:(id)a3
{
}

- (MNTraceRecordingData)traceRecordingData
{
  return self->_traceRecordingData;
}

- (void)setTraceRecordingData:(id)a3
{
}

- (GEODirectionsRequest)directionsRequest
{
  return self->_directionsRequest;
}

- (void)setDirectionsRequest:(id)a3
{
}

- (GEODirectionsResponse)directionsResponse
{
  return self->_directionsResponse;
}

- (void)setDirectionsResponse:(id)a3
{
}

- (unint64_t)routeOrigin
{
  return self->_routeOrigin;
}

- (void)setRouteOrigin:(unint64_t)a3
{
  self->_routeOrigin = a3;
}

- (unint64_t)expectedNumberOfRoutes
{
  return self->_expectedNumberOfRoutes;
}

- (void)setExpectedNumberOfRoutes:(unint64_t)a3
{
  self->_unint64_t expectedNumberOfRoutes = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_directionsResponse, 0);
  objc_storeStrong((id *)&self->_directionsRequest, 0);
  objc_storeStrong((id *)&self->_traceRecordingData, 0);
  objc_storeStrong((id *)&self->_lastError, 0);
  objc_storeStrong((id *)&self->_selectedRouteID, 0);
  objc_storeStrong((id *)&self->_companionRoutes, 0);
  objc_storeStrong((id *)&self->_routes, 0);
  objc_storeStrong((id *)&self->_routeIDs, 0);

  objc_storeStrong((id *)&self->_userInfoByRouteID, 0);
}

@end