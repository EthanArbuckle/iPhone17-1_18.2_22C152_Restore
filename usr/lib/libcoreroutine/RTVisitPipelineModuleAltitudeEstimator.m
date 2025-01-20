@interface RTVisitPipelineModuleAltitudeEstimator
- (BOOL)isValidForAltitudeUpdate:(id)a3;
- (RTLocationManager)locationManager;
- (RTVisitPipelineModuleAltitudeEstimator)init;
- (RTVisitPipelineModuleAltitudeEstimator)initWithMaxHorizontalAccuracy:(double)a3 locationManager:(id)a4;
- (double)estimatedAltitude;
- (double)estimatedVerticalUncertainty;
- (double)maxHorizontalAccuracy;
- (id)dateIntervalForAltitudeEstimation:(id)a3;
- (id)process:(id)a3;
- (id)updateAltitudeforVisit:(id)a3;
- (void)initializeZAxisParameters;
- (void)setEstimatedAltitude:(double)a3;
- (void)setEstimatedVerticalUncertainty:(double)a3;
- (void)updateAltitudeForCentroid:(id)a3 locations:(id)a4;
@end

@implementation RTVisitPipelineModuleAltitudeEstimator

- (RTVisitPipelineModuleAltitudeEstimator)init
{
  uint64_t v2 = objc_opt_class();
  _RTRequireInitializer(v2, sel_initWithMaxHorizontalAccuracy_locationManager_);
}

- (RTVisitPipelineModuleAltitudeEstimator)initWithMaxHorizontalAccuracy:(double)a3 locationManager:(id)a4
{
  id v7 = a4;
  v8 = v7;
  if (a3 < 0.0)
  {
    v9 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v10 = "Invalid parameter not satisfying: maxHorizontalAccuracy >= 0";
LABEL_12:
      _os_log_error_impl(&dword_1D9BFA000, v9, OS_LOG_TYPE_ERROR, v10, buf, 2u);
      goto LABEL_9;
    }
    goto LABEL_9;
  }
  if (!v7)
  {
    v9 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v10 = "Invalid parameter not satisfying: locationManager";
      goto LABEL_12;
    }
LABEL_9:

    v13 = 0;
    goto LABEL_10;
  }
  v15.receiver = self;
  v15.super_class = (Class)RTVisitPipelineModuleAltitudeEstimator;
  v11 = [(RTVisitPipelineModuleAltitudeEstimator *)&v15 init];
  v12 = v11;
  if (v11)
  {
    v11->_maxHorizontalAccuracy = a3;
    objc_storeStrong((id *)&v11->_locationManager, a4);
    [(RTVisitPipelineModuleAltitudeEstimator *)v12 initializeZAxisParameters];
  }
  self = v12;
  v13 = self;
LABEL_10:

  return v13;
}

- (void)initializeZAxisParameters
{
  *(_OWORD *)&self->_estimatedAltitude = xmmword_1DA100270;
}

- (BOOL)isValidForAltitudeUpdate:(id)a3
{
  id v3 = a3;
  v4 = v3;
  if (!v3)
  {
    v8 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v10 = 0;
      _os_log_error_impl(&dword_1D9BFA000, v8, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: location", v10, 2u);
    }

    goto LABEL_8;
  }
  if ([v3 type] == 1 || (objc_msgSend(v4, "verticalAccuracy"), v5 < 0.0))
  {
LABEL_8:
    BOOL v7 = 0;
    goto LABEL_9;
  }
  [v4 verticalAccuracy];
  BOOL v7 = v6 < 30.0;
LABEL_9:

  return v7;
}

- (void)updateAltitudeForCentroid:(id)a3 locations:(id)a4
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = v7;
  double estimatedVerticalUncertainty = self->_estimatedVerticalUncertainty;
  if (estimatedVerticalUncertainty == -1.0 || estimatedVerticalUncertainty > 0.0)
  {
    if ([v7 count])
    {
      *(void *)&long long buf = 0;
      *((void *)&buf + 1) = &buf;
      uint64_t v30 = 0x2020000000;
      double v11 = self->_estimatedVerticalUncertainty;
      double v12 = 0.0;
      if (v11 != -1.0) {
        double v12 = 1.0 / (v11 * v11);
      }
      double v31 = v12;
      uint64_t v25 = 0;
      v26 = (double *)&v25;
      double v13 = v12 * self->_estimatedAltitude;
      uint64_t v27 = 0x2020000000;
      double v28 = v13;
      uint64_t v21 = 0;
      v22 = &v21;
      uint64_t v23 = 0x2020000000;
      char v24 = 0;
      v20[0] = MEMORY[0x1E4F143A8];
      v20[1] = 3221225472;
      v20[2] = __78__RTVisitPipelineModuleAltitudeEstimator_updateAltitudeForCentroid_locations___block_invoke;
      v20[3] = &unk_1E6B9AD78;
      v20[4] = self;
      v20[5] = &v21;
      v20[6] = &buf;
      v20[7] = &v25;
      [v8 enumerateObjectsUsingBlock:v20];
      if (!*((unsigned char *)v22 + 24))
      {
        uint64_t v14 = *((void *)&buf + 1);
        double v15 = *(double *)(*((void *)&buf + 1) + 24);
        if (v15 <= 0.0)
        {
          v17 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
          if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)v19 = 0;
            _os_log_error_impl(&dword_1D9BFA000, v17, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: inverseVerticalUncertaintySquaredSum > 0.0", v19, 2u);
          }
        }
        else
        {
          self->_double estimatedVerticalUncertainty = sqrt(1.0 / v15);
          self->_estimatedAltitude = v26[3] / *(double *)(v14 + 24);
        }
      }
      _Block_object_dispose(&v21, 8);
      _Block_object_dispose(&v25, 8);
      _Block_object_dispose(&buf, 8);
    }
    else
    {
      v16 = _rt_log_facility_get_os_log(RTLogFacilityVisit);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
      {
        LOWORD(buf) = 0;
        _os_log_debug_impl(&dword_1D9BFA000, v16, OS_LOG_TYPE_DEBUG, "no locations after filtering to update the estimated altitude and vertical uncertainty.", (uint8_t *)&buf, 2u);
      }
    }
  }
  else
  {
    v10 = _rt_log_facility_get_os_log(RTLogFacilityVisit);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      v18 = [NSNumber numberWithDouble:self->_estimatedVerticalUncertainty];
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v18;
      _os_log_debug_impl(&dword_1D9BFA000, v10, OS_LOG_TYPE_DEBUG, "invalid estimated verticalUncertainty, %@, setting it to the default value.", (uint8_t *)&buf, 0xCu);
    }
    self->_double estimatedVerticalUncertainty = -1.0;
  }
}

void __78__RTVisitPipelineModuleAltitudeEstimator_updateAltitudeForCentroid_locations___block_invoke(void *a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v6 = a2;
  [v6 verticalUncertainty];
  if (v7 == 0.0)
  {
    v8 = _rt_log_facility_get_os_log(RTLogFacilityVisit);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      int v16 = 138412290;
      id v17 = v6;
      _os_log_debug_impl(&dword_1D9BFA000, v8, OS_LOG_TYPE_DEBUG, "this location, %@, has zero uncertainty, so it is chosen as the final estimate.", (uint8_t *)&v16, 0xCu);
    }

    [v6 altitude];
    *(void *)(a1[4] + 24) = v9;
    [v6 verticalUncertainty];
    *(void *)(a1[4] + 32) = v10;
    *(unsigned char *)(*(void *)(a1[5] + 8) + 24) = 1;
    *a4 = 1;
  }
  else
  {
    [v6 verticalUncertainty];
    double v12 = v11;
    [v6 verticalUncertainty];
    double v14 = 1.0 / (v12 * v13);
    *(double *)(*(void *)(a1[6] + 8) + 24) = v14 + *(double *)(*(void *)(a1[6] + 8) + 24);
    [v6 altitude];
    *(double *)(*(void *)(a1[7] + 8) + 24) = *(double *)(*(void *)(a1[7] + 8) + 24) + v15 * v14;
  }
}

- (id)dateIntervalForAltitudeEstimation:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = [v3 exit];
  double v5 = v4;
  if (v4)
  {
    id v6 = v4;
  }
  else
  {
    double v7 = [v3 date];
    v8 = (void *)MEMORY[0x1E4F1C9C8];
    uint64_t v9 = [v3 entry];
    uint64_t v10 = [v8 dateWithTimeInterval:v9 sinceDate:900.0];
    id v6 = [v7 earlierDate:v10];
  }
  double v11 = [v3 entry];
  int v12 = [v6 isBeforeDate:v11];

  if (v12)
  {
    double v13 = _rt_log_facility_get_os_log(RTLogFacilityVisit);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
    {
      int v21 = 138412290;
      id v22 = v3;
      _os_log_fault_impl(&dword_1D9BFA000, v13, OS_LOG_TYPE_FAULT, "Invalid visit for altitude update, %@", (uint8_t *)&v21, 0xCu);
    }

    double v14 = (void *)MEMORY[0x1E4F1C9C8];
    double v15 = [v3 entry];
    uint64_t v16 = [v14 dateWithTimeInterval:v15 sinceDate:900.0];

    id v6 = (id)v16;
  }
  id v17 = objc_alloc(MEMORY[0x1E4F28C18]);
  uint64_t v18 = [v3 entry];
  v19 = (void *)[v17 initWithStartDate:v18 endDate:v6];

  return v19;
}

- (id)updateAltitudeforVisit:(id)a3
{
  v109[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [(RTVisitPipelineModuleAltitudeEstimator *)self initializeZAxisParameters];
  v90 = v4;
  v91 = self;
  v89 = [(RTVisitPipelineModuleAltitudeEstimator *)self dateIntervalForAltitudeEstimation:v4];
  id v5 = objc_alloc(MEMORY[0x1E4F1E5F0]);
  id v6 = [v4 location];
  [v6 latitude];
  CLLocationDegrees v8 = v7;
  uint64_t v9 = [v4 location];
  [v9 longitude];
  CLLocationCoordinate2D v11 = CLLocationCoordinate2DMake(v8, v10);
  int v12 = [v4 location];
  [v12 horizontalUncertainty];
  double v14 = v13;

  if (v14 < 5.0) {
    double v14 = 5.0;
  }
  double v15 = [v90 location];
  uint64_t v16 = [v15 date];
  v88 = [v5 initWithCoordinate:v16 altitude:v11.latitude horizontalAccuracy:v11.longitude verticalAccuracy:0.0 timestamp:v14];

  uint64_t v86 = *MEMORY[0x1E4F5CFE8];
  uint64_t v87 = *MEMORY[0x1E4F28568];
  do
  {
    id v17 = (void *)MEMORY[0x1E016D870]();
    uint64_t v18 = (void *)[objc_alloc(MEMORY[0x1E4F5CF40]) initWithDateInterval:v89 horizontalAccuracy:200 batchSize:v88 boundingBoxLocation:v91->_maxHorizontalAccuracy];
    uint64_t v102 = 0;
    v103 = (id *)&v102;
    uint64_t v104 = 0x3032000000;
    v105 = __Block_byref_object_copy__131;
    v106 = __Block_byref_object_dispose__131;
    id v107 = 0;
    uint64_t v96 = 0;
    v97 = &v96;
    uint64_t v98 = 0x3032000000;
    v99 = __Block_byref_object_copy__131;
    v100 = __Block_byref_object_dispose__131;
    id v101 = 0;
    dispatch_semaphore_t v19 = dispatch_semaphore_create(0);
    v20 = [(RTVisitPipelineModuleAltitudeEstimator *)v91 locationManager];
    v92[0] = MEMORY[0x1E4F143A8];
    v92[1] = 3221225472;
    v92[2] = __65__RTVisitPipelineModuleAltitudeEstimator_updateAltitudeforVisit___block_invoke;
    v92[3] = &unk_1E6B9ADC8;
    v95 = &v96;
    v94 = &v102;
    v92[4] = v91;
    int v21 = v19;
    v93 = v21;
    [v20 fetchStoredLocationsWithOptions:v18 handler:v92];

    id v22 = v21;
    uint64_t v23 = [MEMORY[0x1E4F1C9C8] now];
    dispatch_time_t v24 = dispatch_time(0, 3600000000000);
    if (!dispatch_semaphore_wait(v22, v24)) {
      goto LABEL_9;
    }
    uint64_t v25 = [MEMORY[0x1E4F1C9C8] now];
    [v25 timeIntervalSinceDate:v23];
    double v27 = v26;
    double v28 = objc_opt_new();
    v29 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_101];
    uint64_t v30 = [MEMORY[0x1E4F29060] callStackSymbols];
    double v31 = [v30 filteredArrayUsingPredicate:v29];
    uint64_t v32 = [v31 firstObject];

    [v28 submitToCoreAnalytics:v32 type:1 duration:v27];
    v33 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v33, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_fault_impl(&dword_1D9BFA000, v33, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", buf, 2u);
    }

    v34 = (void *)MEMORY[0x1E4F28C58];
    v109[0] = v87;
    *(void *)long long buf = @"semaphore wait timeout";
    v35 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:buf forKeys:v109 count:1];
    v36 = [v34 errorWithDomain:v86 code:15 userInfo:v35];

    if (v36)
    {
      id v37 = v36;

      char v38 = 0;
    }
    else
    {
LABEL_9:
      id v37 = 0;
      char v38 = 1;
    }

    id v39 = v37;
    if ((v38 & 1) == 0) {
      objc_storeStrong(v103 + 5, v37);
    }
    if (v103[5])
    {
      v40 = _rt_log_facility_get_os_log(RTLogFacilityVisit);
      if (os_log_type_enabled(v40, OS_LOG_TYPE_DEBUG))
      {
        id v53 = v103[5];
        *(_DWORD *)long long buf = 138412290;
        *(void *)&buf[4] = v53;
        _os_log_debug_impl(&dword_1D9BFA000, v40, OS_LOG_TYPE_DEBUG, "not updating the current visit's altitude and verticalUncertainty due to error, %@", buf, 0xCu);
      }

      v41 = [v90 location];
      [v41 altitude];
      v91->_double estimatedAltitude = v42;

      v43 = [v90 location];
      [v43 verticalUncertainty];
      v91->_double estimatedVerticalUncertainty = v44;
      int v45 = 2;
    }
    else
    {
      v46 = [v90 location];
      [(RTVisitPipelineModuleAltitudeEstimator *)v91 updateAltitudeForCentroid:v46 locations:v97[5]];

      v47 = [(id)v97[5] lastObject];
      v48 = [v47 date];
      v43 = [v48 dateByAddingTimeInterval:1.0];

      v49 = [v89 endDate];
      if ([(id)v97[5] count] && objc_msgSend(v43, "compare:", v49) == -1)
      {
        id v51 = objc_alloc(MEMORY[0x1E4F28C18]);
        v50 = [v43 earlierDate:v49];
        uint64_t v52 = [v51 initWithStartDate:v50 endDate:v49];

        int v45 = 0;
        v89 = (void *)v52;
      }
      else
      {
        v50 = _rt_log_facility_get_os_log(RTLogFacilityVisit);
        int v45 = 2;
        if (os_log_type_enabled(v50, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)long long buf = 0;
          _os_log_debug_impl(&dword_1D9BFA000, v50, OS_LOG_TYPE_DEBUG, "no more locations to fetch.", buf, 2u);
        }
      }
    }
    _Block_object_dispose(&v96, 8);

    _Block_object_dispose(&v102, 8);
  }
  while (!v45);
  id v54 = objc_alloc(MEMORY[0x1E4F5CE00]);
  v55 = [v90 location];
  [v55 latitude];
  double v57 = v56;
  v58 = [v90 location];
  [v58 longitude];
  double v60 = v59;
  v61 = [v90 location];
  [v61 horizontalUncertainty];
  double v63 = v62;
  double estimatedAltitude = v91->_estimatedAltitude;
  double estimatedVerticalUncertainty = v91->_estimatedVerticalUncertainty;
  v66 = [v90 location];
  v67 = [v66 date];
  v68 = [v90 location];
  uint64_t v69 = [v68 referenceFrame];
  v70 = [v90 location];
  [v70 speed];
  double v72 = v71;
  v73 = [v90 location];
  v74 = [v54 initWithLatitude:v67 longitude:v69 horizontalUncertainty:objc_msgSend(v73, "sourceAccuracy") altitude:v57 verticalUncertainty:v60 date:v63 referenceFrame:v72 speed:v63];

  id v75 = objc_alloc(MEMORY[0x1E4F5CFC8]);
  v76 = [v90 date];
  uint64_t v77 = [v90 type];
  v78 = [v90 entry];
  v79 = [v90 exit];
  uint64_t v80 = [v90 dataPointCount];
  [v90 confidence];
  double v82 = v81;
  v83 = [v90 placeInference];
  v84 = (void *)[v75 initWithDate:v76 type:v77 location:v74 entry:v78 exit:v79 dataPointCount:v80 confidence:v82 placeInference:v83];

  return v84;
}

void __65__RTVisitPipelineModuleAltitudeEstimator_updateAltitudeforVisit___block_invoke(uint64_t a1, void *a2, id obj)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), obj);
  id v6 = obj;
  id v7 = a2;
  CLLocationDegrees v8 = [[_RTMap alloc] initWithInput:v7];

  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __65__RTVisitPipelineModuleAltitudeEstimator_updateAltitudeforVisit___block_invoke_2;
  v12[3] = &unk_1E6B9ADA0;
  v12[4] = *(void *)(a1 + 32);
  uint64_t v9 = [(_RTMap *)v8 withBlock:v12];
  uint64_t v10 = *(void *)(*(void *)(a1 + 56) + 8);
  CLLocationCoordinate2D v11 = *(void **)(v10 + 40);
  *(void *)(v10 + 40) = v9;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

id __65__RTVisitPipelineModuleAltitudeEstimator_updateAltitudeforVisit___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([*(id *)(a1 + 32) isValidForAltitudeUpdate:v3]) {
    id v4 = (void *)[objc_alloc(MEMORY[0x1E4F5CE00]) initWithCLLocation:v3];
  }
  else {
    id v4 = 0;
  }

  return v4;
}

- (id)process:(id)a3
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([v4 count])
  {
    id v5 = objc_opt_new();
    long long v31 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    obj = v4;
    uint64_t v6 = [obj countByEnumeratingWithState:&v31 objects:v39 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      id v29 = v4;
      uint64_t v8 = *(void *)v32;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v32 != v8) {
            objc_enumerationMutation(obj);
          }
          uint64_t v10 = *(void **)(*((void *)&v31 + 1) + 8 * i);
          CLLocationCoordinate2D v11 = [v10 visit];
          int v12 = [v11 entry];

          double v13 = _rt_log_facility_get_os_log(RTLogFacilityVisit);
          BOOL v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG);
          if (v12)
          {
            if (v14)
            {
              dispatch_time_t v24 = (objc_class *)objc_opt_class();
              uint64_t v25 = NSStringFromClass(v24);
              *(_DWORD *)long long buf = 138412546;
              v36 = v25;
              __int16 v37 = 2112;
              char v38 = v10;
              _os_log_debug_impl(&dword_1D9BFA000, v13, OS_LOG_TYPE_DEBUG, "%@ working on cluster, %@", buf, 0x16u);
            }
            double v15 = [v10 visit];
            uint64_t v16 = [(RTVisitPipelineModuleAltitudeEstimator *)self updateAltitudeforVisit:v15];

            id v17 = [RTVisitCluster alloc];
            uint64_t v18 = [v10 points];
            dispatch_semaphore_t v19 = v17;
            v20 = v18;
            int v21 = v16;
          }
          else
          {
            if (v14)
            {
              double v26 = (objc_class *)objc_opt_class();
              double v27 = NSStringFromClass(v26);
              *(_DWORD *)long long buf = 138412546;
              v36 = v27;
              __int16 v37 = 2112;
              char v38 = v10;
              _os_log_debug_impl(&dword_1D9BFA000, v13, OS_LOG_TYPE_DEBUG, "%@ skiping cluster with null visit entry, %@ ", buf, 0x16u);
            }
            id v22 = [RTVisitCluster alloc];
            uint64_t v16 = [v10 points];
            uint64_t v18 = [v10 visit];
            dispatch_semaphore_t v19 = v22;
            v20 = v16;
            int v21 = v18;
          }
          uint64_t v23 = [(RTVisitCluster *)v19 initWithPoints:v20 visit:v21];

          [v5 addObject:v23];
        }
        uint64_t v7 = [obj countByEnumeratingWithState:&v31 objects:v39 count:16];
      }
      while (v7);
      id v4 = v29;
    }
  }
  else
  {
    obj = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(obj, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)long long buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, obj, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: inClusters.count", buf, 2u);
    }
    id v5 = 0;
  }

  return v5;
}

- (double)maxHorizontalAccuracy
{
  return self->_maxHorizontalAccuracy;
}

- (RTLocationManager)locationManager
{
  return self->_locationManager;
}

- (double)estimatedAltitude
{
  return self->_estimatedAltitude;
}

- (void)setEstimatedAltitude:(double)a3
{
  self->_double estimatedAltitude = a3;
}

- (double)estimatedVerticalUncertainty
{
  return self->_estimatedVerticalUncertainty;
}

- (void)setEstimatedVerticalUncertainty:(double)a3
{
  self->_double estimatedVerticalUncertainty = a3;
}

- (void).cxx_destruct
{
}

@end