@interface SPLocationManager
- (SPLocationManager)initWithQueue:(id)a3;
- (id)locationCategoryChangedHandler;
- (unsigned)_getLocationCategoryFromGEOPOI:(id)a3;
- (unsigned)_getLocationCategoryFromRTLocationOfInterestType:(int64_t)a3;
- (void)_requestPlaceInference;
- (void)_startMonitoringVisits;
- (void)_startPollingForLocationCategory;
- (void)_stopMonitoringVisits;
- (void)_stopPollingForLocationCategory;
- (void)_updateLocationCategory:(unsigned __int8)a3;
- (void)_updateLocationCategoryWithBestPlaceInferenceIdentifier:(id)a3;
- (void)locationManager:(id)a3 didFailWithError:(id)a4;
- (void)locationManager:(id)a3 didVisit:(id)a4;
- (void)locationManagerDidChangeAuthorization:(id)a3;
- (void)setLocationCategoryChangedHandler:(id)a3;
- (void)start;
- (void)stop;
@end

@implementation SPLocationManager

- (SPLocationManager)initWithQueue:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SPLocationManager;
  v6 = [(SPLocationManager *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_dispatchQueue, a3);
  }

  return v7;
}

- (void)start
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100006664;
  block[3] = &unk_100014688;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)stop
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000067BC;
  block[3] = &unk_100014688;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (unsigned)_getLocationCategoryFromRTLocationOfInterestType:(int64_t)a3
{
  if ((unint64_t)a3 < 4) {
    unsigned __int8 v3 = a3 + 1;
  }
  else {
    unsigned __int8 v3 = 0;
  }
  if (dword_10001A0E8 <= 30 && (dword_10001A0E8 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  return v3;
}

- (unsigned)_getLocationCategoryFromGEOPOI:(id)a3
{
  id v3 = a3;
  v4 = (void *)GEOPOICategorySchool;
  id v5 = v3;
  id v6 = v4;
  if (v6 == v5)
  {

    goto LABEL_6;
  }
  v7 = v6;
  if ((v5 == 0) == (v6 != 0))
  {

    goto LABEL_8;
  }
  unsigned __int8 v8 = [v5 isEqual:v6];

  if (v8)
  {
LABEL_6:
    unsigned __int8 v9 = 3;
    goto LABEL_51;
  }
LABEL_8:
  v10 = (void *)GEOPOICategoryFitnessCenter;
  id v11 = v5;
  id v12 = v10;
  if (v12 == v11)
  {

    goto LABEL_13;
  }
  v13 = v12;
  if ((v5 == 0) == (v12 != 0))
  {

    goto LABEL_15;
  }
  unsigned __int8 v14 = [v11 isEqual:v12];

  if (v14)
  {
LABEL_13:
    unsigned __int8 v9 = 4;
    goto LABEL_51;
  }
LABEL_15:
  v15 = (void *)GEOPOICategoryAirport;
  id v16 = v11;
  id v17 = v15;
  if (v17 == v16)
  {

    goto LABEL_20;
  }
  v18 = v17;
  if ((v5 == 0) == (v17 != 0))
  {

    goto LABEL_22;
  }
  unsigned __int8 v19 = [v16 isEqual:v17];

  if (v19)
  {
LABEL_20:
    unsigned __int8 v9 = 5;
    goto LABEL_51;
  }
LABEL_22:
  v20 = (void *)GEOPOICategoryStadium;
  id v21 = v16;
  id v22 = v20;
  if (v22 == v21)
  {

    goto LABEL_27;
  }
  v23 = v22;
  if ((v5 == 0) == (v22 != 0))
  {

    goto LABEL_29;
  }
  unsigned __int8 v24 = [v21 isEqual:v22];

  if (v24)
  {
LABEL_27:
    unsigned __int8 v9 = 6;
    goto LABEL_51;
  }
LABEL_29:
  v25 = (void *)GEOPOICategoryTheater;
  id v26 = v21;
  id v27 = v25;
  if (v27 == v26)
  {

    goto LABEL_34;
  }
  v28 = v27;
  if ((v5 == 0) == (v27 != 0))
  {

    goto LABEL_36;
  }
  unsigned __int8 v29 = [v26 isEqual:v27];

  if (v29)
  {
LABEL_34:
    unsigned __int8 v9 = 8;
    goto LABEL_51;
  }
LABEL_36:
  v30 = (void *)GEOPOICategoryMovieTheater;
  id v31 = v26;
  id v32 = v30;
  if (v32 == v31)
  {

    goto LABEL_41;
  }
  v33 = v32;
  if ((v5 == 0) != (v32 != 0))
  {
    unsigned __int8 v34 = [v31 isEqual:v32];

    if ((v34 & 1) == 0) {
      goto LABEL_43;
    }
LABEL_41:
    unsigned __int8 v9 = 7;
    goto LABEL_51;
  }

LABEL_43:
  v35 = (void *)GEOPOICategoryMusicVenue;
  id v36 = v31;
  id v37 = v35;
  if (v37 == v36)
  {
  }
  else
  {
    v38 = v37;
    if ((v5 == 0) == (v37 != 0))
    {

LABEL_50:
      unsigned __int8 v9 = 0;
      goto LABEL_51;
    }
    unsigned int v39 = [v36 isEqual:v37];

    if (!v39) {
      goto LABEL_50;
    }
  }
  unsigned __int8 v9 = 9;
LABEL_51:
  if (dword_10001A0E8 <= 30 && (dword_10001A0E8 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }

  return v9;
}

- (void)_requestPlaceInference
{
  if (objc_opt_respondsToSelector())
  {
    if (dword_10001A0E8 <= 30 && (dword_10001A0E8 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    locationManager = self->_locationManager;
    v4[0] = _NSConcreteStackBlock;
    v4[1] = 3221225472;
    v4[2] = sub_100006E18;
    v4[3] = &unk_1000146F0;
    v4[4] = self;
    [(CLLocationManager *)locationManager _fetchPlaceInferencesWithFidelityPolicy:0 handler:v4];
  }
  else if (dword_10001A0E8 <= 90 && (dword_10001A0E8 != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
}

- (void)_startMonitoringVisits
{
  if (!self->_monitoringVisits)
  {
    if (dword_10001A0E8 <= 30 && (dword_10001A0E8 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    self->_monitoringVisits = 1;
    locationManager = self->_locationManager;
    [(CLLocationManager *)locationManager startMonitoringVisits];
  }
}

- (void)_startPollingForLocationCategory
{
  if (!self->_pollingLocation)
  {
    if (dword_10001A0E8 <= 30 && (dword_10001A0E8 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    self->_pollingLocation = 1;
    if (!self->_locationQueryExitTimer)
    {
      id v3 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)self->_dispatchQueue);
      dispatch_time_t v4 = dispatch_time(0, 1200000000000);
      dispatch_source_set_timer(v3, v4, 0xFFFFFFFFFFFFFFFFLL, 0);
      handler[0] = _NSConcreteStackBlock;
      handler[1] = 3221225472;
      handler[2] = sub_1000071D0;
      handler[3] = &unk_100014688;
      handler[4] = self;
      dispatch_source_set_event_handler(v3, handler);
      locationQueryExitTimer = self->_locationQueryExitTimer;
      self->_locationQueryExitTimer = (OS_dispatch_source *)v3;
      id v6 = v3;

      dispatch_resume(v6);
    }
    if (!self->_locationQueryTimer)
    {
      v7 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)self->_dispatchQueue);
      dispatch_time_t v8 = dispatch_time(0, 0);
      dispatch_source_set_timer(v7, v8, 0x1BF08EB000uLL, 0);
      v11[0] = _NSConcreteStackBlock;
      v11[1] = 3221225472;
      v11[2] = sub_100007278;
      v11[3] = &unk_100014688;
      v11[4] = self;
      dispatch_source_set_event_handler(v7, v11);
      locationQueryTimer = self->_locationQueryTimer;
      self->_locationQueryTimer = (OS_dispatch_source *)v7;
      v10 = v7;

      dispatch_resume((dispatch_object_t)self->_locationQueryTimer);
    }
  }
}

- (void)_stopMonitoringVisits
{
  if (self->_monitoringVisits)
  {
    if (dword_10001A0E8 <= 30 && (dword_10001A0E8 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    [(CLLocationManager *)self->_locationManager stopMonitoringVisits];
    self->_monitoringVisits = 0;
  }
}

- (void)_stopPollingForLocationCategory
{
  if (self->_pollingLocation)
  {
    if (dword_10001A0E8 <= 30 && (dword_10001A0E8 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    locationQueryExitTimer = self->_locationQueryExitTimer;
    if (locationQueryExitTimer)
    {
      dispatch_time_t v4 = locationQueryExitTimer;
      dispatch_source_cancel(v4);
      id v5 = self->_locationQueryExitTimer;
      self->_locationQueryExitTimer = 0;
    }
    locationQueryTimer = self->_locationQueryTimer;
    if (locationQueryTimer)
    {
      v7 = locationQueryTimer;
      dispatch_source_cancel(v7);
      dispatch_time_t v8 = self->_locationQueryTimer;
      self->_locationQueryTimer = 0;
    }
    self->_pollingLocation = 0;
  }
}

- (void)_updateLocationCategory:(unsigned __int8)a3
{
  if (self->_currentLocationCategory != a3)
  {
    self->_currentLocationCategory = a3;
    locationCategoryChangedHandler = (void (**)(id, void))self->_locationCategoryChangedHandler;
    if (locationCategoryChangedHandler) {
      locationCategoryChangedHandler[2](locationCategoryChangedHandler, a3);
    }
  }
}

- (void)_updateLocationCategoryWithBestPlaceInferenceIdentifier:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    if (dword_10001A0E8 <= 30 && (dword_10001A0E8 != -1 || _LogCategory_Initialize()))
    {
      id v6 = v4;
      LogPrintF();
    }
    id v5 = +[RTRoutineManager defaultManager];
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_1000077EC;
    v7[3] = &unk_100014768;
    v7[4] = self;
    [v5 fetchLocationOfInterestWithIdentifier:v4 withHandler:v7];
  }
}

- (void)locationManagerDidChangeAuthorization:(id)a3
{
  unsigned int v4 = [a3 authorizationStatus];
  if (dword_10001A0E8 <= 30 && (dword_10001A0E8 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  if (v4 >= 3)
  {
    if (v4 - 3 <= 1) {
      [(SPLocationManager *)self _startMonitoringVisits];
    }
  }
  else
  {
    [(SPLocationManager *)self _stopMonitoringVisits];
  }
  self->_authorizationStatus = v4;
}

- (void)locationManager:(id)a3 didFailWithError:(id)a4
{
  id v7 = a4;
  id v5 = [v7 domain];
  if ([v5 isEqualToString:kCLErrorDomain])
  {
    id v6 = [v7 code];

    if (!v6)
    {
      [(SPLocationManager *)self _stopPollingForLocationCategory];
      goto LABEL_9;
    }
  }
  else
  {
  }
  if (dword_10001A0E8 <= 90 && (dword_10001A0E8 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
LABEL_9:
}

- (void)locationManager:(id)a3 didVisit:(id)a4
{
  id v10 = a4;
  id v5 = [v10 _placeInference];
  id v6 = [v5 _loiIdentifier];

  if (v6)
  {
    if (dword_10001A0E8 <= 30 && (dword_10001A0E8 != -1 || _LogCategory_Initialize()))
    {
      unsigned __int8 v9 = [v10 arrivalDate];
      LogPrintF();
    }
    id v7 = objc_msgSend(v10, "_placeInference", v9);
    dispatch_time_t v8 = [v7 _loiIdentifier];
    [(SPLocationManager *)self _updateLocationCategoryWithBestPlaceInferenceIdentifier:v8];
  }
  else
  {
    if (dword_10001A0E8 <= 30 && (dword_10001A0E8 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    [(SPLocationManager *)self _startPollingForLocationCategory];
  }
}

- (id)locationCategoryChangedHandler
{
  return self->_locationCategoryChangedHandler;
}

- (void)setLocationCategoryChangedHandler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_locationCategoryChangedHandler, 0);
  objc_storeStrong((id *)&self->_locationQueryExitTimer, 0);
  objc_storeStrong((id *)&self->_locationQueryTimer, 0);
  objc_storeStrong((id *)&self->_locationManager, 0);
  objc_storeStrong((id *)&self->_geoMapService, 0);

  objc_storeStrong((id *)&self->_dispatchQueue, 0);
}

@end