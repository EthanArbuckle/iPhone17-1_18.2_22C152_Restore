@interface RedoSearchController
- (BOOL)shouldShowManualRedoSearchButton:(id)a3 searchResults:(id)a4;
- (BOOL)shouldTriggerAutoRedoWithThreshold:(id)a3 searchResults:(id)a4;
- (BOOL)shouldTriggerSearchHereWithMinimumNumberOfVisiblePOIs:(unint64_t)a3 panDeltaThresholdInMeters:(double)a4 zoomInPercentageThreshold:(double)a5 zoomOutPercentageThreshold:(double)a6 searchResults:(id)a7;
- (RedoSearchController)initWithMapState:(id)a3 zoomLevel:(double)a4;
- (RedoSearchMapState)currentState;
- (RedoSearchMapState)originalState;
- (unint64_t)numberOfVisibleSearchResults:(id)a3;
- (void)setCurrentState:(id)a3;
- (void)setOriginalState:(id)a3;
@end

@implementation RedoSearchController

- (RedoSearchController)initWithMapState:(id)a3 zoomLevel:(double)a4
{
  id v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)RedoSearchController;
  v7 = [(RedoSearchController *)&v11 init];
  if (v7)
  {
    v8 = [[RedoSearchMapState alloc] initWithMapRegion:v6 zoomLevel:a4];
    originalState = v7->_originalState;
    v7->_originalState = v8;
  }
  return v7;
}

- (BOOL)shouldShowManualRedoSearchButton:(id)a3 searchResults:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [v7 numberOfVisiblePoisThreshold];
  [v7 panDeltaThresholdInMeters];
  double v10 = v9;
  [v7 zoomInPercentThreshold];
  double v12 = v11;
  [v7 zoomOutPercentThreshold];
  double v14 = v13;

  LOBYTE(v7) = [(RedoSearchController *)self shouldTriggerSearchHereWithMinimumNumberOfVisiblePOIs:v8 panDeltaThresholdInMeters:v6 zoomInPercentageThreshold:v10 zoomOutPercentageThreshold:v12 searchResults:v14];
  return (char)v7;
}

- (BOOL)shouldTriggerAutoRedoWithThreshold:(id)a3 searchResults:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [v7 numberOfVisiblePoisThreshold];
  [v7 panDeltaThresholdInMeters];
  double v10 = v9;
  [v7 zoomInPercentThreshold];
  double v12 = v11;
  [v7 zoomOutPercentThreshold];
  double v14 = v13;

  LOBYTE(v7) = [(RedoSearchController *)self shouldTriggerSearchHereWithMinimumNumberOfVisiblePOIs:v8 panDeltaThresholdInMeters:v6 zoomInPercentageThreshold:v10 zoomOutPercentageThreshold:v12 searchResults:v14];
  return (char)v7;
}

- (BOOL)shouldTriggerSearchHereWithMinimumNumberOfVisiblePOIs:(unint64_t)a3 panDeltaThresholdInMeters:(double)a4 zoomInPercentageThreshold:(double)a5 zoomOutPercentageThreshold:(double)a6 searchResults:(id)a7
{
  id v12 = a7;
  uint64_t v13 = [(RedoSearchController *)self currentState];
  if (v13)
  {
    double v14 = (void *)v13;
    v15 = [(RedoSearchController *)self originalState];

    if (v15)
    {
      v16 = [(RedoSearchController *)self currentState];
      v17 = [(RedoSearchController *)self originalState];
      unsigned int v18 = [v16 isEqual:v17];

      if (v18)
      {
        v19 = sub_1005771BC();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "Current and Original states are equal, ignoring.", buf, 2u);
        }
        LOBYTE(v15) = 0;
LABEL_30:

        goto LABEL_31;
      }
      unint64_t v48 = a3;
      v20 = [(RedoSearchController *)self originalState];
      v21 = [v20 mapRegion];
      [v21 centerLat];
      v22 = [(RedoSearchController *)self originalState];
      v23 = [v22 mapRegion];
      [v23 centerLng];
      v24 = [(RedoSearchController *)self currentState];
      v25 = [v24 mapRegion];
      [v25 centerLat];
      v26 = [(RedoSearchController *)self currentState];
      v27 = [v26 mapRegion];
      [v27 centerLng];
      GEOCalculateDistance();
      double v29 = v28;

      *(double *)&unint64_t v30 = COERCE_DOUBLE((id)[(RedoSearchController *)self numberOfVisibleSearchResults:v12]);
      v31 = [(RedoSearchController *)self currentState];
      [v31 zoomLevel];
      double v33 = v32;
      v34 = [(RedoSearchController *)self originalState];
      [v34 zoomLevel];
      double v36 = v33 / v35 * 100.0;

      if (v36 <= 100.0)
      {
        unint64_t v37 = v48;
        if (v36 >= 100.0)
        {
          if (v29 > a4 && v30 < v48)
          {
            CFStringRef v40 = @"Triggered with reason: distance && visible results number";
            LOBYTE(v15) = 1;
            goto LABEL_26;
          }
LABEL_22:
          LOBYTE(v15) = 0;
          CFStringRef v40 = @"Not triggered";
LABEL_26:
          v41 = sub_1005771BC();
          if (os_log_type_enabled(v41, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 134218752;
            double v50 = *(double *)&v37;
            __int16 v51 = 2048;
            double v52 = a4;
            __int16 v53 = 2048;
            double v54 = a5;
            __int16 v55 = 2048;
            double v56 = a6;
            _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_INFO, "Thresholds - Number of results: %lu. Distance: %f Zoom in: %f. Zoom out: %f.", buf, 0x2Au);
          }

          v19 = sub_1005771BC();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
          {
            v42 = [(RedoSearchController *)self currentState];
            [v42 zoomLevel];
            double v44 = v43;
            v45 = [(RedoSearchController *)self originalState];
            [v45 zoomLevel];
            *(_DWORD *)buf = 134219266;
            double v50 = v29;
            __int16 v51 = 2048;
            double v52 = *(double *)&v30;
            __int16 v53 = 2048;
            double v54 = v44;
            __int16 v55 = 2048;
            double v56 = v46;
            __int16 v57 = 2048;
            double v58 = v36;
            __int16 v59 = 2112;
            CFStringRef v60 = v40;
            _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "Distance: %f. Number of Visible results: %lu. Current zoom: %f. Original zoom: %f. Percentage: %f. %@", buf, 0x3Eu);
          }
          goto LABEL_30;
        }
        BOOL v39 = 100.0 - v36 > a6;
      }
      else
      {
        unint64_t v37 = v48;
        BOOL v39 = v36 + -100.0 > a5 && v30 < v48;
      }
      if (v29 > a4 && v30 < v37) {
        CFStringRef v40 = @"Triggered with reason: distance && visible results number";
      }
      else {
        CFStringRef v40 = @"Triggered with reason: zoom level";
      }
      LOBYTE(v15) = 1;
      if (v29 > a4 && v30 < v37 || v39) {
        goto LABEL_26;
      }
      goto LABEL_22;
    }
  }
  else
  {
    LOBYTE(v15) = 0;
  }
LABEL_31:

  return (char)v15;
}

- (unint64_t)numberOfVisibleSearchResults:(id)a3
{
  id v4 = a3;
  uint64_t v8 = 0;
  double v9 = &v8;
  uint64_t v10 = 0x2020000000;
  uint64_t v11 = 0;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100771974;
  v7[3] = &unk_1012F7E68;
  v7[4] = self;
  v7[5] = &v8;
  [v4 enumerateObjectsUsingBlock:v7];
  unint64_t v5 = v9[3];
  _Block_object_dispose(&v8, 8);

  return v5;
}

- (RedoSearchMapState)originalState
{
  return self->_originalState;
}

- (void)setOriginalState:(id)a3
{
}

- (RedoSearchMapState)currentState
{
  return self->_currentState;
}

- (void)setCurrentState:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentState, 0);

  objc_storeStrong((id *)&self->_originalState, 0);
}

@end