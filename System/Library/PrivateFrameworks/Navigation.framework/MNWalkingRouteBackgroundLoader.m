@interface MNWalkingRouteBackgroundLoader
- (MNActiveRouteInfo)walkingRouteInfo;
- (MNNavigationSessionState)navigationSessionState;
- (MNWalkingRouteBackgroundLoaderDelegate)delegate;
- (id)_requestWalkingRouteWithHandler:(id)a3;
- (unint64_t)_requestTypeForArrivalState:(int64_t)a3;
- (void)_handleWalkingRouteResponse:(id)a3;
- (void)_updateForLocation:(id)a3;
- (void)_updateWalkingRoute;
- (void)dealloc;
- (void)setDelegate:(id)a3;
- (void)setNavigationSessionState:(id)a3;
- (void)start;
- (void)stop;
@end

@implementation MNWalkingRouteBackgroundLoader

- (void)dealloc
{
  [(MNWalkingRouteBackgroundLoader *)self stop];
  v3.receiver = self;
  v3.super_class = (Class)MNWalkingRouteBackgroundLoader;
  [(MNWalkingRouteBackgroundLoader *)&v3 dealloc];
}

- (void)setNavigationSessionState:(id)a3
{
  id v10 = a3;
  v4 = [(MNNavigationSessionState *)self->_navigationSessionState location];
  v5 = [v10 location];

  unint64_t v6 = [(MNWalkingRouteBackgroundLoader *)self _requestTypeForArrivalState:[(MNNavigationSessionState *)self->_navigationSessionState arrivalState]];
  v7 = (MNNavigationSessionState *)[v10 copy];
  navigationSessionState = self->_navigationSessionState;
  self->_navigationSessionState = v7;

  if (v4 != v5 && self->_isFetchingWalkingRoutes)
  {
    v9 = [(MNNavigationSessionState *)self->_navigationSessionState location];
    [(MNWalkingRouteBackgroundLoader *)self _updateForLocation:v9];
  }
  if (v6 != -[MNWalkingRouteBackgroundLoader _requestTypeForArrivalState:](self, "_requestTypeForArrivalState:", [v10 arrivalState]))-[MNWalkingRouteBackgroundLoader _updateWalkingRoute](self, "_updateWalkingRoute"); {
}
  }

- (void)start
{
  if (self->_isFetchingWalkingRoutes)
  {
    v2 = MNGetMNWalkingRouteBackgroundLoaderLog();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B542B000, v2, OS_LOG_TYPE_INFO, "-[MNWalkingRouteBackground start]: Already fetching walking routes.", buf, 2u);
    }
  }
  else
  {
    self->_isFetchingWalkingRoutes = 1;
    dateSinceLastRouteRequest = self->_dateSinceLastRouteRequest;
    self->_dateSinceLastRouteRequest = 0;

    *(_OWORD *)&self->_lastFailedRequestCoordinate.latitude = kGEOLocationCoordinate3DInvalid;
    self->_lastFailedRequestCoordinate.altitude = 1.79769313e308;
    v5 = MNGetMNWalkingRouteBackgroundLoaderLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)unint64_t v6 = 0;
      _os_log_impl(&dword_1B542B000, v5, OS_LOG_TYPE_DEFAULT, "Started background loading of walking route.", v6, 2u);
    }

    [(MNWalkingRouteBackgroundLoader *)self _updateWalkingRoute];
  }
}

- (void)stop
{
  if (self->_isFetchingWalkingRoutes)
  {
    objc_super v3 = MNGetMNWalkingRouteBackgroundLoaderLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl(&dword_1B542B000, v3, OS_LOG_TYPE_DEFAULT, "Stopped background loading of walking route.", v9, 2u);
    }

    [(GEODirectionsServiceRequest *)self->_pendingRequest cancel];
    self->_isFetchingWalkingRoutes = 0;
    dateSinceLastRouteRequest = self->_dateSinceLastRouteRequest;
    self->_dateSinceLastRouteRequest = 0;

    walkingRouteInfo = self->_walkingRouteInfo;
    if (walkingRouteInfo)
    {
      self->_walkingRouteInfo = 0;

      id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      char v7 = objc_opt_respondsToSelector();

      if (v7)
      {
        id v8 = objc_loadWeakRetained((id *)&self->_delegate);
        [v8 walkingRouteBackgroundLoader:self didUpdateWalkingRoute:0];
      }
    }
  }
}

- (unint64_t)_requestTypeForArrivalState:(int64_t)a3
{
  if (a3 == 5) {
    return 10;
  }
  else {
    return 9;
  }
}

- (id)_requestWalkingRouteWithHandler:(id)a3
{
  v30[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    v5 = [(MNNavigationSessionState *)self->_navigationSessionState location];
    unint64_t v6 = v5;
    if (v5 && ([v5 coordinate], CLLocationCoordinate2DIsValid(v32)))
    {
      char v7 = [(MNNavigationSessionState *)self->_navigationSessionState currentWaypoint];
      if (v7)
      {
        id v8 = [(MNNavigationSessionState *)self->_navigationSessionState currentRouteInfo];
        v9 = [v8 route];

        if (v9)
        {
          id v10 = (void *)[objc_alloc(MEMORY[0x1E4F64660]) initWithCLLocation:v6];
          v26 = (void *)[objc_alloc(MEMORY[0x1E4F644F0]) initWithLocation:v10 isCurrentLocation:1];
          v25 = [v9 routeAttributes];
          v11 = [v9 routeInitializerData];
          v12 = [v11 directionsRequest];
          v13 = [v12 commonOptions];

          int64_t v14 = [(MNNavigationSessionState *)self->_navigationSessionState arrivalState];
          id v15 = objc_alloc_init(MEMORY[0x1E4F64548]);
          objc_msgSend(v15, "setRequestType:", -[MNWalkingRouteBackgroundLoader _requestTypeForArrivalState:](self, "_requestTypeForArrivalState:", v14));
          [v15 setCurrentLocation:v10];
          v30[0] = v26;
          v30[1] = v7;
          v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v30 count:2];
          [v15 setWaypoints:v16];

          [v15 setCurrentRoute:v9];
          [v15 setTransportType:2];
          [v15 setRouteAttributes:v25];
          [v15 setCommonOptions:v13];
          [v15 setMaxRouteCount:1];
          [v15 setHasArrived:(v14 & 0xFFFFFFFFFFFFFFFDLL) == 4];
          v17 = [(MNNavigationSessionState *)self->_navigationSessionState auditToken];
          [v15 setAuditToken:v17];

          v18 = [(MNNavigationSessionState *)self->_navigationSessionState requestingAppIdentifier];
          [v15 setRequestingAppIdentifier:v18];

          v19 = [MEMORY[0x1E4F64540] sharedService];
          v27[0] = MEMORY[0x1E4F143A8];
          v27[1] = 3221225472;
          v27[2] = __66__MNWalkingRouteBackgroundLoader__requestWalkingRouteWithHandler___block_invoke;
          v27[3] = &unk_1E60F63F0;
          id v28 = v4;
          v20 = [v19 requestRoutes:v15 handler:v27];
        }
        else
        {
          v23 = MNGetMNWalkingRouteBackgroundLoaderLog();
          if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1B542B000, v23, OS_LOG_TYPE_ERROR, "Error requesting walking background route because the navigation session state's current route is invalid.", buf, 2u);
          }

          (*((void (**)(id, void, void))v4 + 2))(v4, 0, 0);
          v20 = 0;
        }
      }
      else
      {
        v22 = MNGetMNWalkingRouteBackgroundLoaderLog();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1B542B000, v22, OS_LOG_TYPE_ERROR, "Error requesting walking background route because the navigation session state's destination waypoint is invalid.", buf, 2u);
        }

        (*((void (**)(id, void, void))v4 + 2))(v4, 0, 0);
        v20 = 0;
      }
    }
    else
    {
      v21 = MNGetMNWalkingRouteBackgroundLoaderLog();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1B542B000, v21, OS_LOG_TYPE_ERROR, "Error requesting walking background route because the navigation session state's location is invalid.", buf, 2u);
      }

      (*((void (**)(id, void, void))v4 + 2))(v4, 0, 0);
      v20 = 0;
    }
  }
  else
  {
    v20 = 0;
  }

  return v20;
}

void __66__MNWalkingRouteBackgroundLoader__requestWalkingRouteWithHandler___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (v8)
  {
    id v10 = MNGetMNWalkingRouteBackgroundLoaderLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      int v13 = 138412290;
      id v14 = v8;
      _os_log_impl(&dword_1B542B000, v10, OS_LOG_TYPE_ERROR, "Error requesting walking background route from server: %@", (uint8_t *)&v13, 0xCu);
    }
  }
  v11 = [v7 firstObject];
  if (v11) {
    v12 = [[MNActiveRouteInfo alloc] initWithRoute:v11];
  }
  else {
    v12 = 0;
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_updateWalkingRoute
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  if (self->_isFetchingWalkingRoutes && !self->_pendingRequest)
  {
    if (self->_dateSinceLastRouteRequest
      && (GEOConfigGetDouble(),
          double v4 = v3,
          +[MNTimeManager currentDate],
          v5 = objc_claimAutoreleasedReturnValue(),
          [v5 timeIntervalSinceDate:self->_dateSinceLastRouteRequest],
          double v7 = v6,
          v5,
          v7 < v4))
    {
      id v8 = MNGetMNWalkingRouteBackgroundLoaderLog();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 134218240;
        double v22 = v7;
        __int16 v23 = 2048;
        double v24 = v4;
        _os_log_impl(&dword_1B542B000, v8, OS_LOG_TYPE_INFO, "Not requesting new background walking route because only %0.1fs has elapsed since the previous request, and at least %0.1fs is required.", buf, 0x16u);
      }
    }
    else
    {
      id v9 = [(MNNavigationSessionState *)self->_navigationSessionState location];
      objc_msgSend(v9, "_navigation_geoCoordinate3D");
      v11 = v10;
      int v13 = v12;
      uint64_t v15 = v14;

      v16 = MNGetMNWalkingRouteBackgroundLoaderLog();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 134283777;
        double v22 = *(double *)&v11;
        __int16 v23 = 2049;
        double v24 = *(double *)&v13;
        _os_log_impl(&dword_1B542B000, v16, OS_LOG_TYPE_INFO, "Requesting walking background route from server from %{private}f, %{private}f.", buf, 0x16u);
      }

      objc_initWeak((id *)buf, self);
      v19[0] = MEMORY[0x1E4F143A8];
      v19[1] = 3221225472;
      v19[2] = __53__MNWalkingRouteBackgroundLoader__updateWalkingRoute__block_invoke;
      v19[3] = &unk_1E60FAD68;
      v19[4] = self;
      v20[1] = v11;
      v20[2] = v13;
      v20[3] = v15;
      objc_copyWeak(v20, (id *)buf);
      v17 = [(MNWalkingRouteBackgroundLoader *)self _requestWalkingRouteWithHandler:v19];
      pendingRequest = self->_pendingRequest;
      self->_pendingRequest = v17;

      objc_destroyWeak(v20);
      objc_destroyWeak((id *)buf);
    }
  }
}

void __53__MNWalkingRouteBackgroundLoader__updateWalkingRoute__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  double v6 = v5;
  if (!a2 || v5)
  {
    uint64_t v13 = *(void *)(a1 + 32);
    long long v14 = *(_OWORD *)(a1 + 48);
    *(void *)(v13 + 64) = *(void *)(a1 + 64);
    *(_OWORD *)(v13 + 48) = v14;
    id v15 = a2;
    id v8 = MNGetMNWalkingRouteBackgroundLoaderLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      int v17 = 138412290;
      v18 = v6;
      id v9 = "Error requesting walking background route from server: %@";
      id v10 = v8;
      os_log_type_t v11 = OS_LOG_TYPE_ERROR;
      uint32_t v12 = 12;
      goto LABEL_7;
    }
  }
  else
  {
    id v7 = a2;
    id v8 = MNGetMNWalkingRouteBackgroundLoaderLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      LOWORD(v17) = 0;
      id v9 = "Received walking background route.";
      id v10 = v8;
      os_log_type_t v11 = OS_LOG_TYPE_INFO;
      uint32_t v12 = 2;
LABEL_7:
      _os_log_impl(&dword_1B542B000, v10, v11, v9, (uint8_t *)&v17, v12);
    }
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _handleWalkingRouteResponse:a2];
}

- (void)_updateForLocation:(id)a3
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = v4;
  if (self->_isFetchingWalkingRoutes)
  {
    if (self->_walkingRouteInfo)
    {
      double v6 = (void *)[objc_alloc(MEMORY[0x1E4F64660]) initWithCLLocation:v4 course:-1.0];
      id v7 = objc_alloc(MEMORY[0x1E4F649E0]);
      id v8 = [(MNActiveRouteInfo *)self->_walkingRouteInfo route];
      id v9 = [(MNNavigationSessionState *)self->_navigationSessionState auditToken];
      id v10 = (void *)[v7 initWithRoute:v8 auditToken:v9];

      os_log_type_t v11 = [v10 matchToRouteWithLocation:v6];
      GEOConfigGetDouble();
      double v13 = v12;
      [v11 distanceFromRoute];
      if (v14 <= v13)
      {
        v27 = +[MNDisplayETAInfo displayETAInfoForRouteInfo:routeCoordinate:](MNDisplayETAInfo, "displayETAInfoForRouteInfo:routeCoordinate:", self->_walkingRouteInfo, [v11 routeCoordinate]);
        if (v27)
        {
          id v28 = [(MNActiveRouteInfo *)self->_walkingRouteInfo displayETAInfo];
          if (!v28
            || (uint64_t v29 = [v27 displayRemainingMinutesToEndOfRoute],
                v29 != [v28 displayRemainingMinutesToEndOfRoute]))
          {
            [(MNActiveRouteInfo *)self->_walkingRouteInfo setDisplayETAInfo:v27];
            id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
            char v31 = objc_opt_respondsToSelector();

            if (v31)
            {
              id v32 = objc_loadWeakRetained((id *)&self->_delegate);
              [v32 walkingRouteBackgroundLoader:self didUpdateWalkingRoute:self->_walkingRouteInfo];
            }
          }
        }
      }
      else
      {
        id v15 = MNGetMNWalkingRouteBackgroundLoaderLog();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          [v11 distanceFromRoute];
          int v33 = 134217984;
          uint64_t v34 = v16;
          _os_log_impl(&dword_1B542B000, v15, OS_LOG_TYPE_DEFAULT, "Location too far from route: %0.1f", (uint8_t *)&v33, 0xCu);
        }

        [(MNWalkingRouteBackgroundLoader *)self _updateWalkingRoute];
      }
    }
    else
    {
      double longitude = self->_lastFailedRequestCoordinate.longitude;
      if (longitude >= -180.0 && longitude <= 180.0)
      {
        double latitude = self->_lastFailedRequestCoordinate.latitude;
        if (latitude >= -90.0 && latitude <= 90.0 && !self->_pendingRequest)
        {
          objc_msgSend(v4, "_navigation_geoCoordinate3D");
          uint64_t v20 = v19;
          uint64_t v22 = v21;
          GEOCalculateDistance();
          double v24 = v23;
          GEOConfigGetDouble();
          if (v24 > v25)
          {
            v26 = MNGetMNWalkingRouteBackgroundLoaderLog();
            if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
            {
              int v33 = 134284033;
              uint64_t v34 = v20;
              __int16 v35 = 2049;
              uint64_t v36 = v22;
              __int16 v37 = 2049;
              double v38 = v24;
              _os_log_impl(&dword_1B542B000, v26, OS_LOG_TYPE_INFO, "Retrying request for background loading route from %{private}f, %{private}f. Distance from last failed request is %{private}0.1f meters.", (uint8_t *)&v33, 0x20u);
            }

            [(MNWalkingRouteBackgroundLoader *)self _updateWalkingRoute];
          }
        }
      }
    }
  }
}

- (void)_handleWalkingRouteResponse:(id)a3
{
  id v9 = a3;
  objc_storeStrong((id *)&self->_walkingRouteInfo, a3);
  if (v9)
  {
    id v5 = [(MNNavigationSessionState *)self->_navigationSessionState location];
    [(MNWalkingRouteBackgroundLoader *)self _updateForLocation:v5];
  }
  pendingRequest = self->_pendingRequest;
  self->_pendingRequest = 0;

  id v7 = +[MNTimeManager currentDate];
  dateSinceLastRouteRequest = self->_dateSinceLastRouteRequest;
  self->_dateSinceLastRouteRequest = v7;
}

- (MNWalkingRouteBackgroundLoaderDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (MNWalkingRouteBackgroundLoaderDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (MNNavigationSessionState)navigationSessionState
{
  return self->_navigationSessionState;
}

- (MNActiveRouteInfo)walkingRouteInfo
{
  return self->_walkingRouteInfo;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_walkingRouteInfo, 0);
  objc_storeStrong((id *)&self->_navigationSessionState, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_dateSinceLastRouteRequest, 0);
  objc_storeStrong((id *)&self->_pendingRequest, 0);
  objc_storeStrong((id *)&self->_requestingAppIdentifier, 0);
  objc_storeStrong((id *)&self->_auditToken, 0);
}

@end