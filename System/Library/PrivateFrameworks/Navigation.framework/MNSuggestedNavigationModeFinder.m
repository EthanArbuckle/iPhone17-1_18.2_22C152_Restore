@interface MNSuggestedNavigationModeFinder
- (BOOL)ignoreDeviceNavigability;
- (GEOComposedRoute)route;
- (GEOCountryConfiguration)countryConfiguration;
- (MNSuggestedNavigationModeFinder)initWithRoute:(id)a3 context:(unint64_t)a4;
- (MNSuggestedNavigationModeFinder)initWithRoute:(id)a3 context:(unint64_t)a4 ignoreDeviceNavigability:(BOOL)a5;
- (unint64_t)context;
- (unint64_t)suggestedNavigationModeForLocation:(id)a3;
- (void)setContext:(unint64_t)a3;
- (void)setCountryConfiguration:(id)a3;
- (void)setIgnoreDeviceNavigability:(BOOL)a3;
- (void)setRoute:(id)a3;
@end

@implementation MNSuggestedNavigationModeFinder

- (MNSuggestedNavigationModeFinder)initWithRoute:(id)a3 context:(unint64_t)a4
{
  return [(MNSuggestedNavigationModeFinder *)self initWithRoute:a3 context:a4 ignoreDeviceNavigability:0];
}

- (MNSuggestedNavigationModeFinder)initWithRoute:(id)a3 context:(unint64_t)a4 ignoreDeviceNavigability:(BOOL)a5
{
  id v9 = a3;
  v15.receiver = self;
  v15.super_class = (Class)MNSuggestedNavigationModeFinder;
  v10 = [(MNSuggestedNavigationModeFinder *)&v15 init];
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_route, a3);
    v11->_context = a4;
    uint64_t v12 = [MEMORY[0x1E4F64500] sharedConfiguration];
    countryConfiguration = v11->_countryConfiguration;
    v11->_countryConfiguration = (GEOCountryConfiguration *)v12;

    v11->_ignoreDeviceNavigability = a5;
  }

  return v11;
}

- (unint64_t)suggestedNavigationModeForLocation:(id)a3
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  route = self->_route;
  if (route)
  {
    v6 = [(GEOComposedRoute *)route origin];
    if (!v6)
    {
      v7 = MNGetMNSuggestedNavigationModeLog();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        id v9 = "Returning \"None\" because route has no origin.";
        v10 = v7;
        uint32_t v11 = 2;
LABEL_8:
        _os_log_impl(&dword_1B542B000, v10, OS_LOG_TYPE_ERROR, v9, buf, v11);
      }
LABEL_9:
      unint64_t v12 = 0;
LABEL_73:

      goto LABEL_74;
    }
    if ([(GEOComposedRoute *)self->_route transportType] == 1)
    {
      v7 = MNGetMNSuggestedNavigationModeLog();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        v8 = "Returning \"Stepping\" because route's transport type is transit.";
LABEL_13:
        unint64_t v12 = 2;
        _os_log_impl(&dword_1B542B000, v7, OS_LOG_TYPE_DEFAULT, v8, buf, 2u);
        goto LABEL_73;
      }
      goto LABEL_72;
    }
    if ([(GEOComposedRoute *)self->_route isWalkingOnlyTransitRoute])
    {
      v7 = MNGetMNSuggestedNavigationModeLog();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        v8 = "Returning \"Stepping\" because route is a walking-only transit route.";
        goto LABEL_13;
      }
LABEL_72:
      unint64_t v12 = 2;
      goto LABEL_73;
    }
    unint64_t context = self->_context;
    if (context != 1)
    {
      if (!context)
      {
        if (([v6 isCurrentLocation] & 1) == 0)
        {
          v7 = MNGetMNSuggestedNavigationModeLog();
          if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1B542B000, v7, OS_LOG_TYPE_DEFAULT, "Returning \"SteppingNoTracking\" because route's origin is not the current location for \"FastestRoute\" context.", buf, 2u);
          }
          unint64_t v12 = 3;
          goto LABEL_73;
        }
        unsigned int v14 = [(GEOComposedRoute *)self->_route transportType];
        if (v14 <= 3 && v14 != 1)
        {
          if (([(GEOComposedRoute *)self->_route isNavigable] & 1) == 0)
          {
            v7 = MNGetMNSuggestedNavigationModeLog();
            if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              v8 = "Returning \"Stepping\" because route is not navigable for \"FastestRoute\" context.";
              goto LABEL_13;
            }
            goto LABEL_72;
          }
          char v15 = [(GEOCountryConfiguration *)self->_countryConfiguration currentCountrySupportsNavigation];
          v7 = MNGetMNSuggestedNavigationModeLog();
          BOOL v16 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
          if ((v15 & 1) == 0)
          {
            if (v16)
            {
              *(_WORD *)buf = 0;
              v8 = "Returning \"Stepping\" because the current device or country does not support navigation for \"Fastes"
                   "tRoute\" context.";
              goto LABEL_13;
            }
            goto LABEL_72;
          }
          if (v16)
          {
            *(_WORD *)buf = 0;
            v17 = "Returning \"TurnByTurn\" because route's origin is the current location for \"FastestRoute\" context.";
            v18 = v7;
            uint32_t v19 = 2;
LABEL_55:
            _os_log_impl(&dword_1B542B000, v18, OS_LOG_TYPE_DEFAULT, v17, buf, v19);
            goto LABEL_56;
          }
          goto LABEL_56;
        }
        v7 = MNGetMNSuggestedNavigationModeLog();
        if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_72;
        }
        uint64_t v35 = [(GEOComposedRoute *)self->_route transportType];
        if (v35 >= 7)
        {
          objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v35);
          v36 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v36 = off_1E60FBFA0[(int)v35];
        }
        *(_DWORD *)buf = 138412290;
        *(void *)v44 = v36;
        v41 = "Returning \"Stepping\" because transport type \"%@\" does not support turn by turn for \"FastestRoute\" context.";
        goto LABEL_71;
      }
      v7 = MNGetMNSuggestedNavigationModeLog();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        unint64_t v34 = self->_context;
        *(_DWORD *)buf = 67109120;
        *(_DWORD *)v44 = v34;
        id v9 = "Returning \"None\" because unknown context (%d) was specified.";
        v10 = v7;
        uint32_t v11 = 8;
        goto LABEL_8;
      }
      goto LABEL_9;
    }
    if (!v4)
    {
      v7 = MNGetMNSuggestedNavigationModeLog();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        v8 = "Returning \"Stepping\" because location is nil for \"CuratedOrCustomRoute\" context.";
        goto LABEL_13;
      }
      goto LABEL_72;
    }
    [v4 coordinate];
    double v21 = v20;
    double v23 = v22;
    [v6 coordinate];
    GEOCalculateDistance();
    double v25 = v24;
    GEOConfigGetDouble();
    double v27 = v26;
    if (v25 > v26)
    {
      if (!GEOConfigGetBOOL())
      {
LABEL_29:
        v7 = MNGetMNSuggestedNavigationModeLog();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 67109376;
          *(_DWORD *)v44 = (int)v25;
          *(_WORD *)&v44[4] = 1024;
          *(_DWORD *)&v44[6] = (int)v27;
          _os_log_impl(&dword_1B542B000, v7, OS_LOG_TYPE_DEFAULT, "Returning \"NavigateToRoute\" because location exceeds distance threshold (%dm / %dm) to route origin for \"CuratedOrCustomRoute\" context.", buf, 0xEu);
        }
        unint64_t v12 = 4;
        goto LABEL_73;
      }
      v28 = (void *)[objc_alloc(MEMORY[0x1E4F649E0]) initWithRoute:self->_route auditToken:0];
      v29 = objc_msgSend(objc_alloc(MEMORY[0x1E4F64660]), "initWithGEOCoordinate:", v21, v23);
      v30 = [v28 matchToRouteWithLocation:v29];
      GEOConfigGetDouble();
      if (!v30 || (double v32 = v31, [v30 distanceFromRoute], v33 > v32))
      {

        goto LABEL_29;
      }
      v37 = MNGetMNSuggestedNavigationModeLog();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
      {
        [v30 distanceFromRoute];
        *(_DWORD *)buf = 67109888;
        *(_DWORD *)v44 = (int)v25;
        *(_WORD *)&v44[4] = 1024;
        *(_DWORD *)&v44[6] = (int)v27;
        __int16 v45 = 1024;
        int v46 = (int)v38;
        __int16 v47 = 1024;
        int v48 = (int)v32;
        _os_log_impl(&dword_1B542B000, v37, OS_LOG_TYPE_DEFAULT, "Location exceeds distance threshold (%dm / %dm) from route origin, but still within threshold of custom route (%dm / %dm) to allow mid-route start.", buf, 0x1Au);
      }
    }
    unsigned int v39 = [(GEOComposedRoute *)self->_route transportType];
    if (v39 <= 3 && v39 != 1)
    {
      if (self->_ignoreDeviceNavigability) {
        goto LABEL_52;
      }
      if (([(GEOCountryConfiguration *)self->_countryConfiguration currentCountrySupportsNavigation] & 1) == 0)
      {
        v7 = MNGetMNSuggestedNavigationModeLog();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          v8 = "Returning \"Stepping\" because the current device or country does not support navigation for \"CuratedOrC"
               "ustomRoute\" context.";
          goto LABEL_13;
        }
        goto LABEL_72;
      }
      if (self->_ignoreDeviceNavigability)
      {
LABEL_52:
        if (([(GEOCountryConfiguration *)self->_countryConfiguration currentCountrySupportsNavigationIgnoringDevice] & 1) == 0)
        {
          v7 = MNGetMNSuggestedNavigationModeLog();
          if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            v8 = "Returning \"Stepping\" because the current country does not support navigation for \"CuratedOrCustomRoute\" context.";
            goto LABEL_13;
          }
          goto LABEL_72;
        }
      }
      v7 = MNGetMNSuggestedNavigationModeLog();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109376;
        *(_DWORD *)v44 = (int)v25;
        *(_WORD *)&v44[4] = 1024;
        *(_DWORD *)&v44[6] = (int)v27;
        v17 = "Returning \"TurnByTurn\" because location is within distance threshold (%dm / %dm) to route origin for \"C"
              "uratedOrCustomRoute\" context.";
        v18 = v7;
        uint32_t v19 = 14;
        goto LABEL_55;
      }
LABEL_56:
      unint64_t v12 = 1;
      goto LABEL_73;
    }
    v7 = MNGetMNSuggestedNavigationModeLog();
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_72;
    }
    uint64_t v40 = [(GEOComposedRoute *)self->_route transportType];
    if (v40 >= 7)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v40);
      v36 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v36 = off_1E60FBFA0[(int)v40];
    }
    *(_DWORD *)buf = 138412290;
    *(void *)v44 = v36;
    v41 = "Returning \"Stepping\" because transport type \"%@\" does not support turn by turn for \"CuratedOrCustomRoute\" context";
LABEL_71:
    _os_log_impl(&dword_1B542B000, v7, OS_LOG_TYPE_DEFAULT, v41, buf, 0xCu);

    goto LABEL_72;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_fault_impl(&dword_1B542B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "Assertion failed: _route != ((void *)0)", buf, 2u);
  }
  unint64_t v12 = 0;
LABEL_74:

  return v12;
}

- (unint64_t)context
{
  return self->_context;
}

- (void)setContext:(unint64_t)a3
{
  self->_unint64_t context = a3;
}

- (GEOComposedRoute)route
{
  return self->_route;
}

- (void)setRoute:(id)a3
{
}

- (BOOL)ignoreDeviceNavigability
{
  return self->_ignoreDeviceNavigability;
}

- (void)setIgnoreDeviceNavigability:(BOOL)a3
{
  self->_ignoreDeviceNavigability = a3;
}

- (GEOCountryConfiguration)countryConfiguration
{
  return self->_countryConfiguration;
}

- (void)setCountryConfiguration:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_countryConfiguration, 0);
  objc_storeStrong((id *)&self->_route, 0);
}

@end