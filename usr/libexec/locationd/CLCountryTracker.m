@interface CLCountryTracker
+ (BOOL)isSupported;
+ (id)getSilo;
+ (void)becameFatallyBlocked:(id)a3 index:(unint64_t)a4;
+ (void)performSyncOnSilo:(id)a3 invoker:(id)a4;
- (BOOL)allowSimulatedLocations;
- (BOOL)countriesAreUnchanged:(id)a3;
- (BOOL)locationIsUsable:(id)a3;
- (BOOL)previousDisputedState;
- (BOOL)skipUpdatingRegulatoryDomain;
- (CLCountryTracker)init;
- (CLLocation)previousLocation;
- (CLLocationManager)locManager;
- (CLSettingsMirror)settings;
- (NSArray)previousCountries;
- (double)calculateDistance:(id)a3 b:(id)a4;
- (double)debounceTime;
- (double)maximumCountryLocationChangeAccuracy;
- (double)maximumCountryLocationChangeSpeed;
- (double)minimumMoveDistance;
- (double)previousCountryCodeTimeStamp;
- (double)stalenessTime;
- (double)timeToActiveGiveup;
- (double)timeToRequestCheapActiveLocation;
- (double)timeToUnknown;
- (id).cxx_construct;
- (int)authStatus;
- (int)countryCodeDebounceInterval;
- (int)minimumConfidence;
- (void)beginService;
- (void)checkLocationServicesStatus;
- (void)endService;
- (void)handleNewLocation:(id)a3;
- (void)locationManager:(id)a3 didFailWithError:(id)a4;
- (void)locationManager:(id)a3 didUpdateLocations:(id)a4;
- (void)locationManagerDidChangeAuthorization:(id)a3;
- (void)onLocationUnknownTimer;
- (void)onManagerNotification:(const int *)a3 data:(const void *)a4;
- (void)refreshSettings;
- (void)requestLocationWithDesiredAccuracy:(double)a3;
- (void)sendUpdateToRDIfAllowed:(id)a3;
- (void)setAllowSimulatedLocations:(BOOL)a3;
- (void)setAuthStatus:(int)a3;
- (void)setCountryCodeDebounceInterval:(int)a3;
- (void)setDebounceTime:(double)a3;
- (void)setLocManager:(id)a3;
- (void)setMaximumCountryLocationChangeAccuracy:(double)a3;
- (void)setMaximumCountryLocationChangeSpeed:(double)a3;
- (void)setMinimumConfidence:(int)a3;
- (void)setMinimumMoveDistance:(double)a3;
- (void)setPreviousCountries:(id)a3;
- (void)setPreviousCountryCodeTimeStamp:(double)a3;
- (void)setPreviousDisputedState:(BOOL)a3;
- (void)setPreviousLocation:(id)a3;
- (void)setSettings:(id)a3;
- (void)setSkipUpdatingRegulatoryDomain:(BOOL)a3;
- (void)setStalenessTime:(double)a3;
- (void)setTimeToActiveGiveup:(double)a3;
- (void)setTimeToRequestCheapActiveLocation:(double)a3;
- (void)setTimeToUnknown:(double)a3;
- (void)updateLocationUnknown;
@end

@implementation CLCountryTracker

- (BOOL)countriesAreUnchanged:(id)a3
{
  if (!((unint64_t)a3 | (unint64_t)[(CLCountryTracker *)self previousCountries])) {
    return 1;
  }
  v6 = [(CLCountryTracker *)self previousCountries];
  BOOL result = 0;
  if (a3)
  {
    if (v6)
    {
      id v7 = [objc_alloc((Class)NSSet) initWithArray:-[CLCountryTracker previousCountries](self, "previousCountries")];
      id v8 = [objc_alloc((Class)NSSet) initWithArray:a3];
      unsigned __int8 v9 = [v7 isEqualToSet:v8];

      return v9;
    }
  }
  return result;
}

- (NSArray)previousCountries
{
  return self->_previousCountries;
}

- (void)handleNewLocation:(id)a3
{
  [a3 coordinate];
  double v6 = v5;
  [a3 coordinate];
  id v8 = [objc_alloc((Class)GEOLocation) initWithGEOCoordinate:v6, v7];
  if (v8)
  {
    unsigned __int8 v9 = v8;
    [a3 altitude];
    [v9 setAltitude:(int)v10];
    [a3 horizontalAccuracy];
    [v9 setHorizontalAccuracy:];
    [a3 verticalAccuracy];
    [v9 setVerticalAccuracy:];
    unsigned int v11 = [a3 referenceFrame];
    if (v11 == 1) {
      uint64_t v12 = 1;
    }
    else {
      uint64_t v12 = 2 * (v11 == 2);
    }
    [v9 setReferenceFrame:v12];
    *(void *)buf = 0;
    *(void *)&long long v17 = buf;
    *((void *)&v17 + 1) = 0x3052000000;
    v18 = sub_1001779C4;
    v19 = sub_100177364;
    v20 = 0;
    v20 = [[CLOSTransaction alloc] initWithDescription:"com.apple.locationd.CountryTracker.fetchCountries"];
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_1000400E4;
    v15[3] = &unk_1022C8608;
    v15[4] = self;
    v15[5] = buf;
    +[GEOGeographicMetadataRequester fetchPossibleTerritoriesForLocation:responseQueue:responseBlock:](GEOGeographicMetadataRequester, "fetchPossibleTerritoriesForLocation:responseQueue:responseBlock:", v9, [objc_msgSend(-[CLCountryTracker universe](self, "universe"), "silo") queue], v15);
    _Block_object_dispose(buf, 8);
  }
  else
  {
    if (qword_1024194E0 != -1) {
      dispatch_once(&qword_1024194E0, &stru_1022C8628);
    }
    v13 = qword_1024194E8;
    if (os_log_type_enabled((os_log_t)qword_1024194E8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 68289026;
      *(_DWORD *)&buf[4] = 0;
      LOWORD(v17) = 2082;
      *(void *)((char *)&v17 + 2) = "";
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"failed to allocate a GEOLocation object?\"}", buf, 0x12u);
      if (qword_1024194E0 != -1) {
        dispatch_once(&qword_1024194E0, &stru_1022C8628);
      }
    }
    v14 = qword_1024194E8;
    if (os_signpost_enabled((os_log_t)qword_1024194E8))
    {
      *(_DWORD *)buf = 68289026;
      *(_DWORD *)&buf[4] = 0;
      LOWORD(v17) = 2082;
      *(void *)((char *)&v17 + 2) = "";
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v14, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "failed to allocate a GEOLocation object?", "{\"msg%{public}.0s\":\"failed to allocate a GEOLocation object?\"}", buf, 0x12u);
    }
  }
}

- (double)previousCountryCodeTimeStamp
{
  return self->_previousCountryCodeTimeStamp;
}

- (int)countryCodeDebounceInterval
{
  return self->_countryCodeDebounceInterval;
}

- (BOOL)locationIsUsable:(id)a3
{
  [a3 horizontalAccuracy];
  if (v5 >= 0.0)
  {
    [a3 coordinate];
    double v10 = v9;
    [a3 coordinate];
    if (sub_1000EF68C(v10, v11))
    {
      [a3 speed];
      double v13 = v12;
      [(CLCountryTracker *)self maximumCountryLocationChangeSpeed];
      if (v13 <= v14)
      {
        [a3 horizontalAccuracy];
        double v23 = v22;
        [(CLCountryTracker *)self maximumCountryLocationChangeAccuracy];
        if (v23 <= v24)
        {
          if (a3)
          {
            [a3 clientLocation];
            int v28 = DWORD1(v40);
          }
          else
          {
            int v28 = 0;
            long long v42 = 0u;
            memset(v43, 0, sizeof(v43));
            long long v40 = 0u;
            long long v41 = 0u;
            long long v38 = 0u;
            long long v39 = 0u;
            memset(buf, 0, sizeof(buf));
          }
          if (v28 >= [(CLCountryTracker *)self minimumConfidence])
          {
            if (objc_msgSend(objc_msgSend(a3, "sourceInformation"), "isSimulatedBySoftware")
              && ![(CLCountryTracker *)self allowSimulatedLocations])
            {
              if (qword_1024194E0 != -1) {
                dispatch_once(&qword_1024194E0, &stru_1022C8628);
              }
              uint64_t v6 = qword_1024194E8;
              BOOL v7 = os_log_type_enabled((os_log_t)qword_1024194E8, OS_LOG_TYPE_INFO);
              if (v7)
              {
                *(_DWORD *)buf = 68289026;
                *(_DWORD *)&buf[4] = 0;
                *(_WORD *)&uint8_t buf[8] = 2082;
                *(void *)&buf[10] = "";
                id v8 = "{\"msg%{public}.0s\":\"location is simulated, rejecting\"}";
                goto LABEL_16;
              }
            }
            else
            {
              LOBYTE(v7) = 1;
            }
          }
          else
          {
            if (qword_1024194E0 != -1) {
              dispatch_once(&qword_1024194E0, &stru_1022C8628);
            }
            uint64_t v29 = qword_1024194E8;
            BOOL v7 = os_log_type_enabled((os_log_t)qword_1024194E8, OS_LOG_TYPE_INFO);
            if (v7)
            {
              if (a3)
              {
                [a3 clientLocation];
                int v30 = DWORD1(v40);
              }
              else
              {
                int v30 = 0;
                long long v42 = 0u;
                memset(v43, 0, sizeof(v43));
                long long v40 = 0u;
                long long v41 = 0u;
                long long v38 = 0u;
                long long v39 = 0u;
                memset(buf, 0, sizeof(buf));
              }
              v32[0] = 68289282;
              v32[1] = 0;
              __int16 v33 = 2082;
              v34 = "";
              __int16 v35 = 1026;
              int v36 = v30;
              id v8 = "{\"msg%{public}.0s\":\"location confidence too low, discarding\", \"confidence\":%{public}d}";
              v19 = (uint8_t *)v32;
              v20 = v29;
              uint32_t v21 = 24;
              goto LABEL_23;
            }
          }
          return v7;
        }
        if (qword_1024194E0 != -1) {
          dispatch_once(&qword_1024194E0, &stru_1022C8628);
        }
        uint64_t v15 = qword_1024194E8;
        BOOL v7 = os_log_type_enabled((os_log_t)qword_1024194E8, OS_LOG_TYPE_INFO);
        if (!v7) {
          return v7;
        }
        [a3 horizontalAccuracy];
        uint64_t v26 = v25;
        [(CLCountryTracker *)self maximumCountryLocationChangeAccuracy];
        *(_DWORD *)buf = 68289538;
        *(_DWORD *)&buf[4] = 0;
        *(_WORD *)&uint8_t buf[8] = 2082;
        *(void *)&buf[10] = "";
        *(_WORD *)&buf[18] = 2050;
        *(void *)&buf[20] = v26;
        *(_WORD *)&buf[28] = 2050;
        *(void *)&buf[30] = v27;
        id v8 = "{\"msg%{public}.0s\":\"location accuracy too low, discarding\", \"accuracy\":\"%{public}f\", \"limit\":\"%{public}f\"}";
      }
      else
      {
        if (qword_1024194E0 != -1) {
          dispatch_once(&qword_1024194E0, &stru_1022C8628);
        }
        uint64_t v15 = qword_1024194E8;
        BOOL v7 = os_log_type_enabled((os_log_t)qword_1024194E8, OS_LOG_TYPE_INFO);
        if (!v7) {
          return v7;
        }
        [a3 speed];
        uint64_t v17 = v16;
        [(CLCountryTracker *)self maximumCountryLocationChangeSpeed];
        *(_DWORD *)buf = 68289538;
        *(_DWORD *)&buf[4] = 0;
        *(_WORD *)&uint8_t buf[8] = 2082;
        *(void *)&buf[10] = "";
        *(_WORD *)&buf[18] = 2050;
        *(void *)&buf[20] = v17;
        *(_WORD *)&buf[28] = 2050;
        *(void *)&buf[30] = v18;
        id v8 = "{\"msg%{public}.0s\":\"location speed too high, discarding\", \"speed\":\"%{public}f\", \"limit\":\"%{public}f\"}";
      }
      v19 = buf;
      v20 = v15;
      uint32_t v21 = 38;
      goto LABEL_23;
    }
    if (qword_1024194E0 != -1) {
      dispatch_once(&qword_1024194E0, &stru_1022C8628);
    }
    uint64_t v6 = qword_1024194E8;
    BOOL v7 = os_log_type_enabled((os_log_t)qword_1024194E8, OS_LOG_TYPE_INFO);
    if (v7)
    {
      *(_DWORD *)buf = 68289026;
      *(_DWORD *)&buf[4] = 0;
      *(_WORD *)&uint8_t buf[8] = 2082;
      *(void *)&buf[10] = "";
      id v8 = "{\"msg%{public}.0s\":\"location not valid: bad coordinate\"}";
      goto LABEL_16;
    }
  }
  else
  {
    if (qword_1024194E0 != -1) {
      dispatch_once(&qword_1024194E0, &stru_1022C8628);
    }
    uint64_t v6 = qword_1024194E8;
    BOOL v7 = os_log_type_enabled((os_log_t)qword_1024194E8, OS_LOG_TYPE_INFO);
    if (v7)
    {
      *(_DWORD *)buf = 68289026;
      *(_DWORD *)&buf[4] = 0;
      *(_WORD *)&uint8_t buf[8] = 2082;
      *(void *)&buf[10] = "";
      id v8 = "{\"msg%{public}.0s\":\"location not valid: horizontalAccuracy less than zero\"}";
LABEL_16:
      v19 = buf;
      v20 = v6;
      uint32_t v21 = 18;
LABEL_23:
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, v8, v19, v21);
      LOBYTE(v7) = 0;
    }
  }
  return v7;
}

- (int)minimumConfidence
{
  return self->_minimumConfidence;
}

- (double)maximumCountryLocationChangeSpeed
{
  return self->_maximumCountryLocationChangeSpeed;
}

- (double)maximumCountryLocationChangeAccuracy
{
  return self->_maximumCountryLocationChangeAccuracy;
}

- (void)locationManager:(id)a3 didUpdateLocations:(id)a4
{
  id v5 = [a4 firstObject:a3];
  if ([(CLCountryTracker *)self locationIsUsable:v5])
  {
    if (qword_1024194E0 != -1) {
      dispatch_once(&qword_1024194E0, &stru_1022C8628);
    }
    uint64_t v6 = qword_1024194E8;
    if (os_log_type_enabled((os_log_t)qword_1024194E8, OS_LOG_TYPE_INFO))
    {
      [v5 coordinate];
      uint64_t v8 = v7;
      [v5 coordinate];
      uint64_t v10 = v9;
      [v5 horizontalAccuracy];
      uint64_t v12 = v11;
      [objc_msgSend(v5, "timestamp") timeIntervalSince1970];
      uint64_t v14 = v13;
      if (v5)
      {
        [v5 clientLocation];
        uint64_t v15 = *((void *)&v70 + 1);
        [v5 clientLocation];
        int v16 = DWORD1(v50);
      }
      else
      {
        int v16 = 0;
        uint64_t v15 = 0;
        long long v72 = 0u;
        memset(v73, 0, sizeof(v73));
        long long v70 = 0u;
        long long v71 = 0u;
        memset(v69, 0, sizeof(v69));
        long long v50 = 0u;
      }
      *(_DWORD *)buf = 134284801;
      *(void *)&buf[4] = v8;
      *(_WORD *)&buf[12] = 2049;
      *(void *)&buf[14] = v10;
      *(_WORD *)&buf[22] = 2048;
      *(void *)&buf[24] = v12;
      *(_WORD *)&buf[32] = 2048;
      *(void *)&buf[34] = v14;
      *(_WORD *)&buf[42] = 2048;
      *(void *)&buf[44] = v15;
      *(_WORD *)&buf[52] = 1024;
      *(_DWORD *)&buf[54] = v16;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Got a usable location <%{private}+.8lf,%{private}+.8lf>, acc %.2f, timestamp %.2f, lifespan %.2f, confidence %d", buf, 0x3Au);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(v69, 0x65CuLL);
      if (qword_1024194E0 != -1) {
        dispatch_once(&qword_1024194E0, &stru_1022C8628);
      }
      [v5 coordinate];
      uint64_t v40 = v39;
      [v5 coordinate];
      uint64_t v42 = v41;
      [v5 horizontalAccuracy];
      uint64_t v44 = v43;
      [objc_msgSend(v5, "timestamp") timeIntervalSince1970];
      uint64_t v46 = v45;
      if (v5)
      {
        [v5 clientLocation];
        uint64_t v47 = *((void *)&v50 + 1);
        [v5 clientLocation];
        int v48 = DWORD1(v53);
      }
      else
      {
        int v48 = 0;
        uint64_t v47 = 0;
        long long v55 = 0u;
        memset(v56, 0, sizeof(v56));
        long long v53 = 0u;
        long long v54 = 0u;
        long long v52 = 0u;
        memset(buf, 0, sizeof(buf));
      }
      int v57 = 134284801;
      uint64_t v58 = v40;
      __int16 v59 = 2049;
      uint64_t v60 = v42;
      __int16 v61 = 2048;
      uint64_t v62 = v44;
      __int16 v63 = 2048;
      uint64_t v64 = v46;
      __int16 v65 = 2048;
      uint64_t v66 = v47;
      __int16 v67 = 1024;
      int v68 = v48;
      v49 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLCountryTracker locationManager:didUpdateLocations:]", "%s\n", v49);
      if (v49 != (char *)v69) {
        free(v49);
      }
    }
    fLocationRequestTimer = self->fLocationRequestTimer;
    [(CLCountryTracker *)self timeToRequestCheapActiveLocation];
    -[CLTimer setNextFireDelay:](fLocationRequestTimer, "setNextFireDelay:");
    if (!self->fAtLeastOneValidLocation) {
      goto LABEL_23;
    }
    [(CLCountryTracker *)self calculateDistance:v5 b:[(CLCountryTracker *)self previousLocation]];
    double v19 = v18;
    [objc_msgSend(v5, "timestamp") timeIntervalSince1970];
    double v21 = v20;
    [(NSDate *)[(CLLocation *)[(CLCountryTracker *)self previousLocation] timestamp] timeIntervalSince1970];
    double v23 = v22;
    if (qword_1024194E0 != -1) {
      dispatch_once(&qword_1024194E0, &stru_1022C8628);
    }
    double v24 = vabdd_f64(v21, v23);
    uint64_t v25 = qword_1024194E8;
    if (os_log_type_enabled((os_log_t)qword_1024194E8, OS_LOG_TYPE_INFO))
    {
      [(CLCountryTracker *)self debounceTime];
      uint64_t v27 = v26;
      [(CLCountryTracker *)self stalenessTime];
      uint64_t v29 = v28;
      [(CLLocation *)[(CLCountryTracker *)self previousLocation] coordinate];
      uint64_t v31 = v30;
      [(CLLocation *)[(CLCountryTracker *)self previousLocation] coordinate];
      *(_DWORD *)v69 = 68290563;
      *(_DWORD *)&v69[4] = 0;
      *(_WORD *)&v69[8] = 2082;
      *(void *)&v69[10] = "";
      *(_WORD *)&v69[18] = 2050;
      *(double *)&v69[20] = v19;
      *(_WORD *)&v69[28] = 2050;
      *(double *)&v69[30] = v24;
      *(_WORD *)&v69[38] = 2050;
      *(void *)&v69[40] = v27;
      *(_WORD *)&v69[48] = 2050;
      *(void *)&v69[50] = v29;
      *(_WORD *)&v69[58] = 2049;
      *(void *)&v69[60] = v31;
      *(_WORD *)&v69[68] = 2049;
      *(void *)&v69[70] = v32;
      _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"computed deltas\", \"deltaR\":\"%{public}f\", \"deltaT\":\"%{public}f\", \"debounceTime\":\"%{public}f\", \"staleTime\":\"%{public}f\", \"prevLat\":\"%{private}f\", \"prevLon\":\"%{private}f\"}", v69, 0x4Eu);
    }
    if (!self->fAtLeastOneValidLocation)
    {
LABEL_23:
      if (qword_1024194E0 != -1) {
        dispatch_once(&qword_1024194E0, &stru_1022C8628);
      }
      long long v38 = qword_1024194E8;
      if (os_log_type_enabled((os_log_t)qword_1024194E8, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)v69 = 68289026;
        *(_DWORD *)&v69[4] = 0;
        *(_WORD *)&v69[8] = 2082;
        *(void *)&v69[10] = "";
        _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"first valid location since start!\"}", v69, 0x12u);
      }
      [(CLCountryTracker *)self requestLocationWithDesiredAccuracy:kCLLocationAccuracyBystander];
      [(CLTimer *)self->fActiveLocationDeregisterTimer setNextFireDelay:1.79769313e308];
      goto LABEL_28;
    }
    [(CLCountryTracker *)self minimumMoveDistance];
    if (v19 > v33 && ([(CLCountryTracker *)self debounceTime], v24 >= v34))
    {
      if (qword_1024194E0 != -1) {
        dispatch_once(&qword_1024194E0, &stru_1022C8628);
      }
      int v36 = qword_1024194E8;
      if (!os_log_type_enabled((os_log_t)qword_1024194E8, OS_LOG_TYPE_INFO)) {
        goto LABEL_28;
      }
      *(_DWORD *)v69 = 68289026;
      *(_DWORD *)&v69[4] = 0;
      *(_WORD *)&v69[8] = 2082;
      *(void *)&v69[10] = "";
      v37 = "{\"msg%{public}.0s\":\"accepting location because we've moved enough and we're past the debounce time\"}";
    }
    else
    {
      [(CLCountryTracker *)self stalenessTime];
      if (v24 < v35) {
        return;
      }
      if (qword_1024194E0 != -1) {
        dispatch_once(&qword_1024194E0, &stru_1022C8628);
      }
      int v36 = qword_1024194E8;
      if (!os_log_type_enabled((os_log_t)qword_1024194E8, OS_LOG_TYPE_INFO)) {
        goto LABEL_28;
      }
      *(_DWORD *)v69 = 68289026;
      *(_DWORD *)&v69[4] = 0;
      *(_WORD *)&v69[8] = 2082;
      *(void *)&v69[10] = "";
      v37 = "{\"msg%{public}.0s\":\"accepting location because it's been long enough without an update\"}";
    }
    _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_INFO, v37, v69, 0x12u);
LABEL_28:
    [(CLCountryTracker *)self handleNewLocation:v5];

    self->_previousLocation = 0;
    self->_previousLocation = (CLLocation *)v5;
    self->fAtLeastOneValidLocation = 1;
    [(CLTimer *)self->fLocationUnknownTimeoutTimer setNextFireDelay:1.79769313e308];
  }
}

- (CLLocation)previousLocation
{
  return self->_previousLocation;
}

- (double)stalenessTime
{
  return self->_stalenessTime;
}

- (double)timeToRequestCheapActiveLocation
{
  return self->_timeToRequestCheapActiveLocation;
}

- (double)minimumMoveDistance
{
  return self->_minimumMoveDistance;
}

- (double)debounceTime
{
  return self->_debounceTime;
}

- (double)calculateDistance:(id)a3 b:(id)a4
{
  if (qword_1024194E0 != -1) {
    dispatch_once(&qword_1024194E0, &stru_1022C8628);
  }
  uint64_t v7 = qword_1024194E8;
  if (os_log_type_enabled((os_log_t)qword_1024194E8, OS_LOG_TYPE_DEBUG))
  {
    [a3 coordinate];
    uint64_t v9 = v8;
    [a3 coordinate];
    uint64_t v11 = v10;
    [a4 coordinate];
    uint64_t v13 = v12;
    [a4 coordinate];
    *(_DWORD *)buf = 134284289;
    *(void *)&buf[4] = v9;
    *(_WORD *)&buf[12] = 2049;
    *(void *)&buf[14] = v11;
    *(_WORD *)&buf[22] = 2049;
    *(void *)&buf[24] = v13;
    LOWORD(v43) = 2049;
    *(void *)((char *)&v43 + 2) = v14;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "computing distance between points at <%{private}+.8lf,%{private}+.8lf> and <%{private}+.8lf,%{private}+.8lf>", buf, 0x2Au);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1024194E0 != -1) {
      dispatch_once(&qword_1024194E0, &stru_1022C8628);
    }
    [a3 coordinate];
    uint64_t v17 = v16;
    [a3 coordinate];
    uint64_t v19 = v18;
    [a4 coordinate];
    uint64_t v21 = v20;
    [a4 coordinate];
    LODWORD(v34[2]) = 134284289;
    *(void *)((char *)&v34[2] + 4) = v17;
    WORD6(v34[2]) = 2049;
    *(void *)((char *)&v34[2] + 14) = v19;
    WORD3(v34[3]) = 2049;
    *((void *)&v34[3] + 1) = v21;
    LOWORD(v35) = 2049;
    *(void *)((char *)&v35 + 2) = v22;
    double v23 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLCountryTracker calculateDistance:b:]", "%s\n", v23);
    if (v23 != buf) {
      free(v23);
    }
  }
  if (a3)
  {
    [a3 clientLocation];
  }
  else
  {
    long long v40 = 0u;
    memset(v41, 0, 28);
    long long v38 = 0u;
    long long v39 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    long long v35 = 0u;
    memset(&v34[2], 0, 32);
  }
  long long v47 = v39;
  long long v48 = v40;
  v49[0] = v41[0];
  *(_OWORD *)((char *)v49 + 12) = *(_OWORD *)((char *)v41 + 12);
  long long v43 = v35;
  long long v44 = v36;
  long long v45 = v37;
  long long v46 = v38;
  *(_OWORD *)buf = v34[2];
  *(_OWORD *)&buf[16] = v34[3];
  if (a4)
  {
    [a4 clientLocation];
  }
  else
  {
    long long v31 = 0u;
    memset(v32, 0, 28);
    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    long long v24 = 0u;
  }
  v33[6] = v30;
  v33[7] = v31;
  v34[0] = v32[0];
  *(_OWORD *)((char *)v34 + 12) = *(_OWORD *)((char *)v32 + 12);
  v33[2] = v26;
  v33[3] = v27;
  v33[4] = v28;
  v33[5] = v29;
  v33[0] = v24;
  v33[1] = v25;
  sub_1000F1268(&self->fDistanceCalc.fM, (uint64_t)buf, (uint64_t)v33);
  return result;
}

+ (void)becameFatallyBlocked:(id)a3 index:(unint64_t)a4
{
  unint64_t v5 = a4 + 1;
  if (a4 + 1 < (unint64_t)[a3 count]) {
    [objc_msgSend(a3, "objectAtIndexedSubscript:", v5) becameFatallyBlocked:a3 index:v5];
  }
}

+ (void)performSyncOnSilo:(id)a3 invoker:(id)a4
{
}

+ (id)getSilo
{
  if (qword_10247DFD8 != -1) {
    dispatch_once(&qword_10247DFD8, &stru_1022C8578);
  }
  return (id)qword_10247DFD0;
}

- (CLCountryTracker)init
{
  v3.receiver = self;
  v3.super_class = (Class)CLCountryTracker;
  return [(CLCountryTracker *)&v3 initWithInboundProtocol:&OBJC_PROTOCOL___CLCountryTrackerProtocol outboundProtocol:&OBJC_PROTOCOL___CLCountryTrackerClientProtocol];
}

- (void)beginService
{
  self->fAtLeastOneValidLocation = 0;
  self->fAtLeastOneAuthDetermination = 0;
  self->_previousLocation = 0;
  self->fLocationUnknownTimeoutTimer = 0;
  self->_previousCountryCodeTimeStamp = -1.0;
  self->_previousDisputedState = 0;
  -[CLCountryTracker setSettings:](self, "setSettings:", [objc_alloc((Class)CLSettingsMirror) initWithInUniverse:[self universe]]);
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_100795814;
  v20[3] = &unk_1022C85A0;
  v20[4] = self;
  [(CLSettingsMirror *)[(CLCountryTracker *)self settings] setSettingsChangeHandler:v20];
  [(CLCountryTracker *)self refreshSettings];
  if (qword_1024194E0 != -1) {
    dispatch_once(&qword_1024194E0, &stru_1022C8628);
  }
  objc_super v3 = qword_1024194E8;
  if (os_log_type_enabled((os_log_t)qword_1024194E8, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v4 = [(CLCountryTracker *)self skipUpdatingRegulatoryDomain];
    unsigned int v5 = [(CLCountryTracker *)self allowSimulatedLocations];
    unsigned int v6 = [(CLCountryTracker *)self minimumConfidence];
    [(CLCountryTracker *)self maximumCountryLocationChangeSpeed];
    uint64_t v8 = v7;
    [(CLCountryTracker *)self maximumCountryLocationChangeAccuracy];
    uint64_t v10 = v9;
    [(CLCountryTracker *)self minimumMoveDistance];
    uint64_t v12 = v11;
    [(CLCountryTracker *)self debounceTime];
    uint64_t v14 = v13;
    [(CLCountryTracker *)self stalenessTime];
    uint64_t v16 = v15;
    [(CLCountryTracker *)self timeToUnknown];
    uint64_t v18 = v17;
    [(CLCountryTracker *)self timeToActiveGiveup];
    *(_DWORD *)buf = 68291586;
    v22[0] = 2082;
    *(_DWORD *)&buf[4] = 0;
    *(void *)&v22[1] = "";
    v22[5] = 1026;
    unsigned int v23 = v4;
    __int16 v24 = 1026;
    unsigned int v25 = v5;
    __int16 v26 = 1026;
    unsigned int v27 = v6;
    __int16 v28 = 2050;
    uint64_t v29 = v8;
    __int16 v30 = 2050;
    uint64_t v31 = v10;
    __int16 v32 = 2050;
    uint64_t v33 = v12;
    __int16 v34 = 2050;
    uint64_t v35 = v14;
    __int16 v36 = 2050;
    uint64_t v37 = v16;
    __int16 v38 = 2050;
    uint64_t v39 = v18;
    __int16 v40 = 2050;
    uint64_t v41 = v19;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"settings initialized\", \"SkipUpdatingRegulatoryDomain\":%{public}hhd, \"AllowSimulatedLocations\":%{public}hhd, \"CountryLocationMinimumConfidence\":%{public}d, \"MaximumCountryLocationChangeSpeed\":\"%{public}f\", \"MaximumCountryLocationChangeAccuracy\":\"%{public}f\", \"MinimumMoveDistance\":\"%{public}f\", \"CountryLocationDebounceTime\":\"%{public}f\", \"CountryLocationStalenessTime\":\"%{public}f\", \"TimeToCountryUnknown\":\"%{public}f\", \"TimeToCountryCheapLocation\":\"%{public}f\"}", buf, 0x6Au);
  }
  self->_locManager = (CLLocationManager *)[objc_alloc((Class)CLLocationManager) initWithEffectiveBundlePath:@"/System/Library/LocationBundles/CountryTracker.bundle" delegate:self onQueue:[objc_msgSend(-[CLCountryTracker universe](self, "universe"), "silo") queue]];
  self->_authStatus = 0;
  [(CLCountryTracker *)self universe];
  sub_1007E0344();
}

- (void)endService
{
  if (qword_1024194E0 != -1) {
    dispatch_once(&qword_1024194E0, &stru_1022C8628);
  }
  objc_super v3 = qword_1024194E8;
  if (os_log_type_enabled((os_log_t)qword_1024194E8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 68289026;
    int v7 = 0;
    __int16 v8 = 2082;
    uint64_t v9 = "";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"shutting down...\"}", buf, 0x12u);
  }
  [(CLCountryTracker *)self requestLocationWithDesiredAccuracy:kCLLocationAccuracyBystander];
  value = self->fClientManagerClient.__ptr_.__value_;
  self->fClientManagerClient.__ptr_.__value_ = 0;
  if (value) {
    (*(void (**)(Client *))(*(void *)value + 8))(value);
  }
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100795F64;
  v5[3] = &unk_10229FED8;
  v5[4] = [(CLCountryTracker *)self locManager];
  [objc_msgSend(-[CLCountryTracker universe](self, "universe"), "silo") async:v5];
  [(CLCountryTracker *)self setLocManager:0];
  if (objc_opt_class())
  {

    self->fShareListener = 0;
  }
  [(CLTimer *)self->fLocationRequestTimer invalidate];

  self->fLocationRequestTimer = 0;
  [(CLTimer *)self->fLocationUnknownTimeoutTimer invalidate];

  self->fLocationUnknownTimeoutTimer = 0;
  [(CLTimer *)self->fActiveLocationDeregisterTimer invalidate];

  self->fActiveLocationDeregisterTimer = 0;
}

- (void)refreshSettings
{
  [(CLSettingsMirror *)[(CLCountryTracker *)self settings] doubleForKey:@"MaximumCountryLocationChangeSpeed" defaultValue:125.0];
  self->_maximumCountryLocationChangeSpeed = v3;
  [(CLSettingsMirror *)[(CLCountryTracker *)self settings] doubleForKey:@"MaximumCountryLocationChangeAccuracy" defaultValue:1000.0];
  self->_maximumCountryLocationChangeAccuracy = v4;
  [(CLSettingsMirror *)[(CLCountryTracker *)self settings] doubleForKey:@"MinimumMoveDistance" defaultValue:5000.0];
  self->_minimumMoveDistance = v5;
  [(CLSettingsMirror *)[(CLCountryTracker *)self settings] doubleForKey:@"CountryLocationDebounceTime" defaultValue:180.0];
  self->_debounceTime = v6;
  [(CLSettingsMirror *)[(CLCountryTracker *)self settings] doubleForKey:@"CountryLocationStalenessTime" defaultValue:600.0];
  self->_stalenessTime = v7;
  [(CLSettingsMirror *)[(CLCountryTracker *)self settings] doubleForKey:@"TimeToCountryUnknown" defaultValue:3600.0];
  self->_timeToUnknown = v8;
  [(CLSettingsMirror *)[(CLCountryTracker *)self settings] doubleForKey:@"TimeToCountryCheapLocation" defaultValue:10.0];
  self->_timeToActiveGiveup = v9;
  self->_minimumConfidence = [(CLSettingsMirror *)[(CLCountryTracker *)self settings] intForKey:@"CountryLocationMinimumConfidence" defaultValue:33];
  self->_skipUpdatingRegulatoryDomain = [(CLSettingsMirror *)[(CLCountryTracker *)self settings] BOOLForKey:@"SkipUpdatingRegulatoryDomain" defaultValue:0];
  self->_allowSimulatedLocations = [(CLSettingsMirror *)[(CLCountryTracker *)self settings] BOOLForKey:@"AllowSimulatedLocations" defaultValue:0];
  self->_countryCodeDebounceInterval = [(CLSettingsMirror *)[(CLCountryTracker *)self settings] intForKey:@"CountryDebounceInterval" defaultValue:10800];
  [(CLSettingsMirror *)[(CLCountryTracker *)self settings] doubleForKey:@"TimeToRequestCheapActiveLocation" defaultValue:1800.0];
  self->_timeToRequestCheapActiveLocation = v10;
  if (qword_1024194E0 != -1) {
    dispatch_once(&qword_1024194E0, &stru_1022C8628);
  }
  uint64_t v11 = qword_1024194E8;
  if (os_log_type_enabled((os_log_t)qword_1024194E8, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v12 = [(CLCountryTracker *)self skipUpdatingRegulatoryDomain];
    unsigned int v13 = [(CLCountryTracker *)self allowSimulatedLocations];
    unsigned int v14 = [(CLCountryTracker *)self minimumConfidence];
    [(CLCountryTracker *)self maximumCountryLocationChangeSpeed];
    uint64_t v16 = v15;
    [(CLCountryTracker *)self maximumCountryLocationChangeAccuracy];
    uint64_t v18 = v17;
    [(CLCountryTracker *)self minimumMoveDistance];
    uint64_t v20 = v19;
    [(CLCountryTracker *)self debounceTime];
    uint64_t v22 = v21;
    [(CLCountryTracker *)self stalenessTime];
    uint64_t v24 = v23;
    [(CLCountryTracker *)self timeToUnknown];
    uint64_t v26 = v25;
    [(CLCountryTracker *)self timeToActiveGiveup];
    uint64_t v28 = v27;
    [(CLCountryTracker *)self timeToRequestCheapActiveLocation];
    v30[0] = 68292098;
    v30[1] = 0;
    __int16 v31 = 2082;
    __int16 v32 = "";
    __int16 v33 = 1026;
    unsigned int v34 = v12;
    __int16 v35 = 1026;
    unsigned int v36 = v13;
    __int16 v37 = 1026;
    unsigned int v38 = v14;
    __int16 v39 = 2050;
    uint64_t v40 = v16;
    __int16 v41 = 2050;
    uint64_t v42 = v18;
    __int16 v43 = 2050;
    uint64_t v44 = v20;
    __int16 v45 = 2050;
    uint64_t v46 = v22;
    __int16 v47 = 2050;
    uint64_t v48 = v24;
    __int16 v49 = 2050;
    uint64_t v50 = v26;
    __int16 v51 = 2050;
    uint64_t v52 = v28;
    __int16 v53 = 2050;
    uint64_t v54 = v29;
    __int16 v55 = 1026;
    unsigned int v56 = [(CLCountryTracker *)self countryCodeDebounceInterval];
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"settings updated\", \"SkipUpdatingRegulatoryDomain\":%{public}hhd, \"AllowSimulatedLocations\":%{public}hhd, \"CountryLocationMinimumConfidence\":%{public}d, \"MaximumCountryLocationChangeSpeed\":\"%{public}f\", \"MaximumCountryLocationChangeAccuracy\":\"%{public}f\", \"MinimumMoveDistance\":\"%{public}f\", \"CountryLocationDebounceTime\":\"%{public}f\", \"CountryLocationStalenessTime\":\"%{public}f\", \"TimeToCountryUnknown\":\"%{public}f\", \"TimeToCountryCheapLocation\":\"%{public}f\", \"TimeToRequestCheapActiveLocation\":\"%{public}f\", \"CountryDebounceInterval\":%{public}d}", (uint8_t *)v30, 0x7Au);
  }
}

- (void)locationManagerDidChangeAuthorization:(id)a3
{
  self->fAtLeastOneAuthDetermination = 1;
  -[CLCountryTracker setAuthStatus:](self, "setAuthStatus:", [a3 authorizationStatus]);
  if (qword_1024194E0 != -1) {
    dispatch_once(&qword_1024194E0, &stru_1022C8628);
  }
  double v4 = qword_1024194E8;
  if (os_log_type_enabled((os_log_t)qword_1024194E8, OS_LOG_TYPE_DEFAULT))
  {
    [(CLCountryTracker *)self authStatus];
    v5[0] = 68289282;
    v5[1] = 0;
    __int16 v6 = 2082;
    double v7 = "";
    __int16 v8 = 2050;
    uint64_t v9 = [(CLCountryTracker *)self authStatus];
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"authorization status changed\", \"status\":%{public, location:CLAuthorizationStatus}lld}", (uint8_t *)v5, 0x1Cu);
  }
  [(CLCountryTracker *)self checkLocationServicesStatus];
}

- (void)locationManager:(id)a3 didFailWithError:(id)a4
{
  if (qword_1024194E0 != -1) {
    dispatch_once(&qword_1024194E0, &stru_1022C8628);
  }
  __int16 v6 = qword_1024194E8;
  if (os_log_type_enabled((os_log_t)qword_1024194E8, OS_LOG_TYPE_INFO))
  {
    v8[0] = 68289282;
    v8[1] = 0;
    __int16 v9 = 2082;
    double v10 = "";
    __int16 v11 = 2082;
    id v12 = [[objc_msgSend(a4, "description") UTF8String];
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"Got location unavailable\", \"error\":%{public, location:escape_only}s}", (uint8_t *)v8, 0x1Cu);
  }
  if (self->fAtLeastOneValidLocation)
  {
    fLocationUnknownTimeoutTimer = self->fLocationUnknownTimeoutTimer;
    [(CLCountryTracker *)self timeToUnknown];
    -[CLTimer setNextFireDelay:](fLocationUnknownTimeoutTimer, "setNextFireDelay:");
  }
}

+ (BOOL)isSupported
{
  return 1;
}

- (void)sendUpdateToRDIfAllowed:(id)a3
{
  if (&_RDUpdateCountryCodeInfoFromLocation)
  {
    if ([(CLCountryTracker *)self skipUpdatingRegulatoryDomain])
    {
      if (qword_1024194E0 != -1) {
        dispatch_once(&qword_1024194E0, &stru_1022C8628);
      }
      double v3 = qword_1024194E8;
      if (os_log_type_enabled((os_log_t)qword_1024194E8, OS_LOG_TYPE_INFO))
      {
        v4[0] = 68289026;
        v4[1] = 0;
        __int16 v5 = 2082;
        __int16 v6 = "";
        _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"skipping country code update because of setting\"}", (uint8_t *)v4, 0x12u);
      }
    }
    else
    {
      RDUpdateCountryCodeInfoFromLocation();
    }
  }
}

- (void)updateLocationUnknown
{
  if (qword_1024194E0 != -1) {
    dispatch_once(&qword_1024194E0, &stru_1022C8628);
  }
  double v3 = qword_1024194E8;
  if (os_log_type_enabled((os_log_t)qword_1024194E8, OS_LOG_TYPE_DEFAULT))
  {
    v4[0] = 68289026;
    v4[1] = 0;
    __int16 v5 = 2082;
    __int16 v6 = "";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"setting country code from location to be unknown\"}", (uint8_t *)v4, 0x12u);
  }
  [(CLCountryTracker *)self sendUpdateToRDIfAllowed:0];
}

- (void)onLocationUnknownTimer
{
  if (qword_1024194E0 != -1) {
    dispatch_once(&qword_1024194E0, &stru_1022C8628);
  }
  double v3 = qword_1024194E8;
  if (os_log_type_enabled((os_log_t)qword_1024194E8, OS_LOG_TYPE_DEFAULT))
  {
    v4[0] = 68289026;
    v4[1] = 0;
    __int16 v5 = 2082;
    __int16 v6 = "";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"no known location received beyond the time limit\"}", (uint8_t *)v4, 0x12u);
  }
  self->fAtLeastOneValidLocation = 0;

  self->_previousLocation = 0;
  self->_previousCountries = 0;
  [(CLCountryTracker *)self updateLocationUnknown];
  [(CLTimer *)self->fLocationUnknownTimeoutTimer setNextFireDelay:1.79769313e308];
}

- (void)requestLocationWithDesiredAccuracy:(double)a3
{
  if (kCLLocationAccuracyBystander == a3)
  {
    if (qword_1024194E0 != -1) {
      dispatch_once(&qword_1024194E0, &stru_1022C8628);
    }
    uint64_t v9 = qword_1024194E8;
    if (os_log_type_enabled((os_log_t)qword_1024194E8, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v10 = 68289026;
      *(_WORD *)__int16 v11 = 2082;
      *(void *)&v11[2] = "";
      __int16 v6 = "{\"msg%{public}.0s\":\"registering for bystander location updates\"}";
      double v7 = v9;
      uint32_t v8 = 18;
      goto LABEL_10;
    }
  }
  else
  {
    if (qword_1024194E0 != -1) {
      dispatch_once(&qword_1024194E0, &stru_1022C8628);
    }
    uint64_t v5 = qword_1024194E8;
    if (os_log_type_enabled((os_log_t)qword_1024194E8, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v10 = 68289282;
      *(_WORD *)__int16 v11 = 2082;
      *(void *)&v11[2] = "";
      *(_WORD *)&v11[10] = 2050;
      *(double *)&v11[12] = a3;
      __int16 v6 = "{\"msg%{public}.0s\":\"registering for active location updates\", \"accuracy\":\"%{public}f\"}";
      double v7 = v5;
      uint32_t v8 = 28;
LABEL_10:
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, v6, (uint8_t *)&v10, v8);
    }
  }
  -[CLLocationManager setDesiredAccuracy:](self->_locManager, "setDesiredAccuracy:", a3, v10, *(_OWORD *)v11, *(void *)&v11[16]);
}

- (void)checkLocationServicesStatus
{
  if (sub_1001198CC() != 1)
  {
    if (qword_1024194E0 != -1) {
      dispatch_once(&qword_1024194E0, &stru_1022C8628);
    }
    double v3 = qword_1024194E8;
    if (os_log_type_enabled((os_log_t)qword_1024194E8, OS_LOG_TYPE_DEFAULT))
    {
      v4[0] = 68289026;
      v4[1] = 0;
      __int16 v5 = 2082;
      __int16 v6 = "";
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"location services are disabled, stopping updates\"}", (uint8_t *)v4, 0x12u);
    }
    goto LABEL_9;
  }
  if (self->fAtLeastOneAuthDetermination && [(CLCountryTracker *)self authStatus] != 3)
  {
LABEL_9:
    [(CLCountryTracker *)self updateLocationUnknown];
    [(CLCountryTracker *)self requestLocationWithDesiredAccuracy:kCLLocationAccuracyBystander];
    self->fAtLeastOneValidLocation = 0;

    self->_previousLocation = 0;
    self->_previousCountries = 0;
  }
}

- (void)onManagerNotification:(const int *)a3 data:(const void *)a4
{
  if (*a3 == 4)
  {
    [(CLCountryTracker *)self checkLocationServicesStatus];
  }
  else if (!*a3)
  {
    if (qword_1024194E0 != -1) {
      dispatch_once(&qword_1024194E0, &stru_1022C8628);
    }
    __int16 v5 = qword_1024194E8;
    if (os_log_type_enabled((os_log_t)qword_1024194E8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "#Warning location status reset; removing all clients",
        buf,
        2u);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1024194E0 != -1) {
        dispatch_once(&qword_1024194E0, &stru_1022C8628);
      }
      uint32_t v8 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLCountryTracker onManagerNotification:data:]", "%s\n", v8);
      if (v8 != (char *)buf) {
        free(v8);
      }
    }

    self->_previousLocation = 0;
    [(CLCountryTracker *)self updateLocationUnknown];
    id v6 = [[objc_msgSend(-[CLCountryTracker universe](self, "universe"), "vendor") proxyForService:@"CLClientManager"];
    if (byte_10247DFCF >= 0) {
      double v7 = &qword_10247DFB8;
    }
    else {
      double v7 = (uint64_t *)qword_10247DFB8;
    }
    [v6 resetNotificationConsumedForIdentifier:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v7)];
  }
}

- (CLSettingsMirror)settings
{
  return self->_settings;
}

- (void)setSettings:(id)a3
{
}

- (void)setMinimumConfidence:(int)a3
{
  self->_minimumConfidence = a3;
}

- (void)setMaximumCountryLocationChangeSpeed:(double)a3
{
  self->_maximumCountryLocationChangeSpeed = a3;
}

- (void)setMaximumCountryLocationChangeAccuracy:(double)a3
{
  self->_maximumCountryLocationChangeAccuracy = a3;
}

- (void)setMinimumMoveDistance:(double)a3
{
  self->_minimumMoveDistance = a3;
}

- (void)setDebounceTime:(double)a3
{
  self->_debounceTime = a3;
}

- (void)setStalenessTime:(double)a3
{
  self->_stalenessTime = a3;
}

- (double)timeToUnknown
{
  return self->_timeToUnknown;
}

- (void)setTimeToUnknown:(double)a3
{
  self->_timeToUnknown = a3;
}

- (double)timeToActiveGiveup
{
  return self->_timeToActiveGiveup;
}

- (void)setTimeToActiveGiveup:(double)a3
{
  self->_timeToActiveGiveup = a3;
}

- (BOOL)skipUpdatingRegulatoryDomain
{
  return self->_skipUpdatingRegulatoryDomain;
}

- (void)setSkipUpdatingRegulatoryDomain:(BOOL)a3
{
  self->_skipUpdatingRegulatoryDomain = a3;
}

- (BOOL)allowSimulatedLocations
{
  return self->_allowSimulatedLocations;
}

- (void)setAllowSimulatedLocations:(BOOL)a3
{
  self->_allowSimulatedLocations = a3;
}

- (void)setCountryCodeDebounceInterval:(int)a3
{
  self->_countryCodeDebounceInterval = a3;
}

- (void)setTimeToRequestCheapActiveLocation:(double)a3
{
  self->_timeToRequestCheapActiveLocation = a3;
}

- (CLLocationManager)locManager
{
  return self->_locManager;
}

- (void)setLocManager:(id)a3
{
}

- (void)setPreviousLocation:(id)a3
{
}

- (void)setPreviousCountries:(id)a3
{
}

- (BOOL)previousDisputedState
{
  return self->_previousDisputedState;
}

- (void)setPreviousDisputedState:(BOOL)a3
{
  self->_previousDisputedState = a3;
}

- (void)setPreviousCountryCodeTimeStamp:(double)a3
{
  self->_previousCountryCodeTimeStamp = a3;
}

- (int)authStatus
{
  return self->_authStatus;
}

- (void)setAuthStatus:(int)a3
{
  self->_authStatus = a3;
}

- (void).cxx_destruct
{
  value = self->fClientManagerClient.__ptr_.__value_;
  self->fClientManagerClient.__ptr_.__value_ = 0;
  if (value) {
    (*(void (**)(void))(*(void *)value + 8))();
  }
}

- (id).cxx_construct
{
  self->fClientManagerClient.__ptr_.__value_ = 0;
  return self;
}

@end