@interface VLFSessionAnalyticsCapturer
- (VLFSessionAnalyticsCapturer)init;
- (void)_submitAnalytics;
- (void)recordAttempt:(id)a3;
- (void)recordGeoTrackingStatusIfNecessary:(id)a3;
- (void)recordPocketState:(int64_t)a3;
- (void)sessionEndedWithResult:(int64_t)a3 initializationFailureDetails:(id)a4 arFailureTypes:(id)a5;
- (void)sessionStartedWithEntryPoint:(int64_t)a3;
@end

@implementation VLFSessionAnalyticsCapturer

- (VLFSessionAnalyticsCapturer)init
{
  v7.receiver = self;
  v7.super_class = (Class)VLFSessionAnalyticsCapturer;
  v2 = [(VLFSessionAnalyticsCapturer *)&v7 init];
  if (v2)
  {
    uint64_t v3 = geo_dispatch_queue_create_with_qos();
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;

    v5 = v2;
  }

  return v2;
}

- (void)sessionStartedWithEntryPoint:(int64_t)a3
{
  GEOMachAbsoluteTimeGetCurrent();
  uint64_t v6 = v5;
  double v7 = (double)((unint64_t)(CFAbsoluteTimeGetCurrent() * 3600.0) / 0xE10);
  GEOGetMonotonicTime();
  uint64_t v9 = v8;
  v10 = +[MKLocationManager sharedLocationManager];
  v11 = [v10 lastLocation];

  queue = self->_queue;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_100549E80;
  v14[3] = &unk_1012EE7E0;
  uint64_t v16 = v6;
  uint64_t v17 = v9;
  double v18 = v7;
  v14[4] = self;
  id v15 = v11;
  int64_t v19 = a3;
  id v13 = v11;
  dispatch_async(queue, v14);
}

- (void)sessionEndedWithResult:(int64_t)a3 initializationFailureDetails:(id)a4 arFailureTypes:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  GEOMachAbsoluteTimeGetCurrent();
  uint64_t v11 = v10;
  v12 = +[MKLocationManager sharedLocationManager];
  id v13 = [v12 lastLocation];

  queue = self->_queue;
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_10054A00C;
  v18[3] = &unk_1012EE808;
  uint64_t v22 = v11;
  v18[4] = self;
  id v19 = v13;
  int64_t v23 = a3;
  id v20 = v8;
  id v21 = v9;
  id v15 = v9;
  id v16 = v8;
  id v17 = v13;
  dispatch_async(queue, v18);
}

- (void)recordAttempt:(id)a3
{
  id v4 = a3;
  uint64_t v5 = +[MKLocationManager sharedLocationManager];
  uint64_t v6 = [v5 lastLocation];

  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10054A164;
  block[3] = &unk_1012E66E0;
  id v11 = v4;
  v12 = self;
  id v13 = v6;
  id v8 = v6;
  id v9 = v4;
  dispatch_async(queue, block);
}

- (void)recordGeoTrackingStatusIfNecessary:(id)a3
{
  uint64_t v5 = (ARGeoTrackingStatus *)a3;
  uint64_t v6 = v5;
  p_lastGeoTrackingStatus = &self->_lastGeoTrackingStatus;
  if (self->_lastGeoTrackingStatus != v5)
  {
    id v8 = [(ARGeoTrackingStatus *)v5 state];
    if (v8 == (id)[(ARGeoTrackingStatus *)*p_lastGeoTrackingStatus state]
      && (id v9 = [(ARGeoTrackingStatus *)v6 stateReason],
          v9 == (id)[(ARGeoTrackingStatus *)*p_lastGeoTrackingStatus stateReason]))
    {
      objc_storeStrong((id *)&self->_lastGeoTrackingStatus, a3);
    }
    else
    {
      objc_storeStrong((id *)&self->_lastGeoTrackingStatus, a3);
      GEOGetMonotonicTime();
      queue = self->_queue;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_10054A3D4;
      block[3] = &unk_1012EA9E0;
      void block[4] = self;
      uint64_t v14 = v11;
      id v13 = v6;
      dispatch_async(queue, block);
    }
  }
}

- (void)recordPocketState:(int64_t)a3
{
  if (self->_lastPocketState != a3)
  {
    self->_lastPocketState = a3;
    GEOGetMonotonicTime();
    queue = self->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10054A54C;
    block[3] = &unk_1012E8160;
    void block[4] = self;
    void block[5] = v6;
    block[6] = a3;
    dispatch_async(queue, block);
  }
}

- (void)_submitAnalytics
{
  label = dispatch_queue_get_label((dispatch_queue_t)self->_queue);
  id v4 = dispatch_queue_get_label(0);
  if (label != v4)
  {
    BOOL v5 = !label || v4 == 0;
    if (v5 || strcmp(label, v4))
    {
      v39 = sub_1005762E4();
      if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
      {
        v40 = dispatch_queue_get_label((dispatch_queue_t)self->_queue);
        *(_DWORD *)buf = 136316418;
        *(void *)&buf[4] = "-[VLFSessionAnalyticsCapturer _submitAnalytics]";
        *(_WORD *)&buf[12] = 2080;
        *(void *)&buf[14] = "VLFSessionAnalyticsCapturer.m";
        *(_WORD *)&buf[22] = 1024;
        int v44 = 274;
        __int16 v45 = 2080;
        v46 = "_queue";
        __int16 v47 = 2080;
        v48 = v40;
        __int16 v49 = 2080;
        v50 = dispatch_queue_get_label(0);
        _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion on queue failed: %s/%s; actual queue: %s",
          buf,
          0x3Au);
      }

      if (sub_100BB36BC())
      {
        v41 = sub_1005762E4();
        if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
        {
          v42 = +[NSThread callStackSymbols];
          *(_DWORD *)buf = 138412290;
          *(void *)&buf[4] = v42;
          _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
        }
      }
    }
  }
  double startTime = self->_startTime;
  double endTime = self->_endTime;
  id v8 = objc_alloc_init((Class)GEOVLFEntryPoint);
  id v9 = v8;
  if ((unint64_t)(self->_entryPoint - 1) < 4) {
    uint64_t entryPoint_low = LODWORD(self->_entryPoint);
  }
  else {
    uint64_t entryPoint_low = 0;
  }
  [v8 setAccessPoint:entryPoint_low];
  uint64_t v11 = self->_originalLocation;
  unsigned int v12 = [(CLLocation *)v11 positionContextState];
  if (v12 > 2)
  {
    int v13 = 0;
    char v14 = 3;
  }
  else
  {
    int v13 = dword_100F6FC48[v12];
    char v14 = 7;
  }
  [(CLLocation *)v11 probabilityPositionContextStateIndoor];
  uint64_t v16 = v15;
  [(CLLocation *)v11 probabilityPositionContextStateOutdoor];
  uint64_t v18 = v17;

  if (self->_result == 4)
  {
    id v19 = objc_alloc_init((Class)GEOVLFCorrection);
    [(CLLocation *)self->_finalLocation distanceFromLocation:self->_originalLocation];
    [v19 setLocationCorrectionMagnitude:v20];
  }
  else
  {
    id v19 = 0;
  }
  if (self->_originalLocation)
  {
    id v21 = objc_alloc_init((Class)GEOVLFLocation);
    id v22 = objc_alloc((Class)GEOLatLng);
    [(CLLocation *)self->_originalLocation coordinate];
    double v24 = v23;
    [(CLLocation *)self->_originalLocation coordinate];
    id v25 = [v22 initWithLatitude:v24];
    [v21 setLocation:v25];
  }
  else
  {
    id v21 = 0;
  }
  if ((GEOVisualLocalizationCrowdsourcingIsSupported() & 1) == 0)
  {
    v27 = sub_10054AB18();
    if (!os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_35;
    }
    *(_WORD *)buf = 0;
    v30 = "Not capturing VL Crowdsourcing details because the feature is disabled";
LABEL_34:
    _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, v30, buf, 2u);
    goto LABEL_35;
  }
  if ((GEOVisualLocalizationCrowdsourcingIsAllowed() & 1) == 0)
  {
    v27 = sub_10054AB18();
    if (!os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_35;
    }
    *(_WORD *)buf = 0;
    v30 = "Not capturing VL Crowdsourcing details because the feature is not supported for the current device posture";
    goto LABEL_34;
  }
  if ((GEOVisualLocalizationCrowdsourcingIsEnabled() & 1) == 0)
  {
    v27 = sub_10054AB18();
    if (!os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_35;
    }
    *(_WORD *)buf = 0;
    v30 = "Not capturing VL Crowdsourcing details because the user has not given permission";
    goto LABEL_34;
  }
  lastCrowdsourcingDetails = self->_lastCrowdsourcingDetails;
  v27 = sub_10054AB18();
  BOOL v28 = os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT);
  if (!lastCrowdsourcingDetails)
  {
    if (v28)
    {
      *(_WORD *)buf = 0;
      v30 = "Not capturing VL Crowdsourcing details because we did not receive any";
      goto LABEL_34;
    }
LABEL_35:

    v29 = 0;
    goto LABEL_36;
  }
  if (v28)
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "Capturing VL Crowdsourcing details", buf, 2u);
  }

  v29 = +[GEOVLFCrowdsourcingDetails _vl_createWithVLCrowdsourcingDetails:self->_lastCrowdsourcingDetails];
LABEL_36:
  v31 = +[NSNumber numberWithUnsignedInt:((endTime - startTime) * 1000.0)];
  v32 = +[NSNumber numberWithDouble:self->_startTimeRoundedToHour];
  localizationDetails = self->_localizationDetails;
  if ((unint64_t)(self->_result - 1) < 4) {
    uint64_t result_low = LODWORD(self->_result);
  }
  else {
    uint64_t result_low = 0;
  }
  arStates = self->_arStates;
  deviceOrientations = self->_deviceOrientations;
  initializationFailureDetails = self->_initializationFailureDetails;
  arFailureTypes = self->_arFailureTypes;
  *(void *)buf = v16;
  *(void *)&buf[8] = v18;
  *(_DWORD *)&buf[16] = v13;
  buf[20] = v14;
  *(_WORD *)&buf[21] = 0;
  buf[23] = 0;
  +[GEOAPPortal captureVlfUsageWithEntryPoint:v9 sessionTimeMs:v31 timeRoundedToHour:v32 localizationDetails:localizationDetails finalState:result_low postFusionCorrection:v19 initialPositionContextClassification:buf initialLocation:v21 initializationFailureDetails:initializationFailureDetails arStates:arStates deviceOrientations:deviceOrientations crowdsourcingDetails:v29 arFailureTypes:arFailureTypes];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastCrowdsourcingDetails, 0);
  objc_storeStrong((id *)&self->_deviceOrientations, 0);
  objc_storeStrong((id *)&self->_arStates, 0);
  objc_storeStrong((id *)&self->_lastGeoTrackingStatus, 0);
  objc_storeStrong((id *)&self->_arFailureTypes, 0);
  objc_storeStrong((id *)&self->_initializationFailureDetails, 0);
  objc_storeStrong((id *)&self->_finalLocation, 0);
  objc_storeStrong((id *)&self->_originalLocation, 0);
  objc_storeStrong((id *)&self->_localizationDetails, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

@end