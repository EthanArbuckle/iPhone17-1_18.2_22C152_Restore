@interface MNAlternateRoutesUpdater
- (BOOL)setAlternateRoutes:(id)a3 forMainRoute:(id)a4;
- (BOOL)updateForLocation:(id)a3;
- (BOOL)updateForReroute:(id)a3 rerouteReason:(unint64_t)a4;
- (NSArray)alternateRoutes;
@end

@implementation MNAlternateRoutesUpdater

- (NSArray)alternateRoutes
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  alternateRoutes = self->_alternateRoutes;
  if (alternateRoutes)
  {
    v3 = alternateRoutes;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", -[NSMutableArray count](self->_trackedAlternateRoutes, "count"));
    v5 = (NSArray *)objc_claimAutoreleasedReturnValue();
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    v6 = self->_trackedAlternateRoutes;
    uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v16;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v16 != v9) {
            objc_enumerationMutation(v6);
          }
          v11 = objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * i), "alternateRoute", (void)v15);
          [(NSArray *)v5 addObject:v11];
        }
        uint64_t v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v8);
    }

    v12 = self->_alternateRoutes;
    self->_alternateRoutes = v5;
    v13 = v5;

    v3 = self->_alternateRoutes;
  }
  return v3;
}

- (BOOL)setAlternateRoutes:(id)a3 forMainRoute:(id)a4
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  alternateRoutes = self->_alternateRoutes;
  self->_alternateRoutes = 0;

  v27 = self;
  objc_storeStrong((id *)&self->_mainRoute, a4);
  uint64_t v9 = objc_alloc_init(MNRouteDivergenceFinder);
  objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v6, "count"));
  v29 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id obj = v6;
  uint64_t v10 = [obj countByEnumeratingWithState:&v31 objects:v35 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    char v28 = 0;
    uint64_t v12 = *(void *)v32;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v32 != v12) {
          objc_enumerationMutation(obj);
        }
        v14 = *(void **)(*((void *)&v31 + 1) + 8 * i);
        long long v15 = objc_msgSend(v7, "route", v27);
        long long v16 = [v14 route];
        long long v17 = [(MNRouteDivergenceFinder *)v9 findFirstDivergenceBetweenRoute:v15 andRoute:v16];
        long long v18 = [v17 firstObject];

        uint64_t v19 = [v18 routeCoordinate];
        if (v18)
        {
          uint64_t v20 = v19;
          if ((GEOPolylineCoordinateIsInvalid() & 1) == 0)
          {
            v21 = [v7 route];
            uint64_t v22 = [v21 routeCoordinateForDistance:v20 afterRouteCoordinate:40.0];

            v23 = objc_alloc_init(_MNTrackedAlternateRoute);
            [(_MNTrackedAlternateRoute *)v23 setMainRoute:v7];
            [(_MNTrackedAlternateRoute *)v23 setAlternateRoute:v14];
            [(_MNTrackedAlternateRoute *)v23 setDivergenceCoordinate:v22];
            [(NSMutableArray *)v29 addObject:v23];

            char v28 = 1;
          }
        }
      }
      uint64_t v11 = [obj countByEnumeratingWithState:&v31 objects:v35 count:16];
    }
    while (v11);
  }
  else
  {
    char v28 = 0;
  }

  uint64_t v24 = [(NSMutableArray *)v27->_trackedAlternateRoutes count];
  LOBYTE(v24) = v24 != [(NSMutableArray *)v29 count];
  trackedAlternateRoutes = v27->_trackedAlternateRoutes;
  v27->_trackedAlternateRoutes = v29;

  return (v24 | v28) & 1;
}

- (BOOL)updateForLocation:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([(NSMutableArray *)self->_trackedAlternateRoutes count]
    && ([v4 routeMatch], v5 = objc_claimAutoreleasedReturnValue(), v5, v5))
  {
    if (!self->_mainRoute)
    {
      uint64_t v19 = [NSString stringWithFormat:@"Tracking alternate routes requires the main route."];
      uint64_t v20 = GEOFindOrCreateLog();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        int v21 = 136316162;
        uint64_t v22 = "-[MNAlternateRoutesUpdater updateForLocation:]";
        __int16 v23 = 2080;
        uint64_t v24 = "/Library/Caches/com.apple.xbs/Sources/Navigation/Location/LocationTracking/MNAlternateRoutesUpdater.m";
        __int16 v25 = 1024;
        int v26 = 104;
        __int16 v27 = 2080;
        char v28 = "_mainRoute != nil";
        __int16 v29 = 2112;
        v30 = v19;
        _os_log_impl(&dword_1B542B000, v20, OS_LOG_TYPE_ERROR, "*** Assertion failure in %s, %s:%d: (%s) %@", (uint8_t *)&v21, 0x30u);
      }
    }
    id v6 = [MEMORY[0x1E4F28E60] indexSet];
    if ([(NSMutableArray *)self->_trackedAlternateRoutes count])
    {
      unint64_t v7 = 0;
      do
      {
        uint64_t v8 = [(NSMutableArray *)self->_trackedAlternateRoutes objectAtIndex:v7];
        uint64_t v9 = [v8 mainRoute];
        uint64_t v10 = [v9 route];
        uint64_t v11 = [v4 routeMatch];
        uint64_t v12 = [v11 route];

        if (v10 != v12
          || ([v4 routeMatch],
              v13 = objc_claimAutoreleasedReturnValue(),
              [v13 routeCoordinate],
              [v8 divergenceCoordinate],
              uint64_t v14 = GEOPolylineCoordinateCompare(),
              v13,
              v14 == 1))
        {
          [v6 addIndex:v7];
        }

        ++v7;
      }
      while (v7 < [(NSMutableArray *)self->_trackedAlternateRoutes count]);
    }
    uint64_t v15 = [v6 count];
    BOOL v16 = v15 != 0;
    if (v15)
    {
      [(NSMutableArray *)self->_trackedAlternateRoutes removeObjectsAtIndexes:v6];
      alternateRoutes = self->_alternateRoutes;
      self->_alternateRoutes = 0;
    }
  }
  else
  {
    BOOL v16 = 0;
  }

  return v16;
}

- (BOOL)updateForReroute:(id)a3 rerouteReason:(unint64_t)a4
{
  id v6 = (MNActiveRouteInfo *)a3;
  mainRoute = self->_mainRoute;
  if (mainRoute != v6)
  {
    NSUInteger v8 = [(NSArray *)self->_alternateRoutes indexOfObject:v6];
    if (v8 == 0x7FFFFFFFFFFFFFFFLL)
    {
      uint64_t v9 = 0;
    }
    else
    {
      NSUInteger v10 = v8;
      uint64_t v9 = (void *)[(NSArray *)self->_alternateRoutes mutableCopy];
      [v9 removeObjectAtIndex:v10];
      if (a4 == 10 && self->_mainRoute) {
        objc_msgSend(v9, "addObject:");
      }
    }
    [(MNAlternateRoutesUpdater *)self setAlternateRoutes:v9 forMainRoute:v6];
  }
  return mainRoute != v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trackedAlternateRoutes, 0);
  objc_storeStrong((id *)&self->_alternateRoutes, 0);
  objc_storeStrong((id *)&self->_mainRoute, 0);
}

@end