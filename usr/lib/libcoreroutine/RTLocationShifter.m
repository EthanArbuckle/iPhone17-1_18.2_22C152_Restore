@interface RTLocationShifter
+ (BOOL)isLocationShiftRequiredForCoordinate:(CLLocationCoordinate2D)a3;
- (RTLocationShifter)init;
- (id)shiftedLocation:(id)a3 allowNetwork:(BOOL)a4 error:(id *)a5;
- (void)shiftCoordinate:(CLLocationCoordinate2D)a3 accuracy:(double)a4 handler:(id)a5;
- (void)shiftLocation:(id)a3 handler:(id)a4;
@end

@implementation RTLocationShifter

- (RTLocationShifter)init
{
  v6.receiver = self;
  v6.super_class = (Class)RTLocationShifter;
  v2 = [(RTLocationShifter *)&v6 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    geoLocationShifter = v2->_geoLocationShifter;
    v2->_geoLocationShifter = (GEOLocationShifter *)v3;
  }
  return v2;
}

- (void)shiftLocation:(id)a3 handler:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = (void (**)(id, id, void))a4;
  if (v7)
  {
    if ([v6 referenceFrame] == 2)
    {
      v7[2](v7, v6, 0);
    }
    else
    {
      [v6 latitude];
      CLLocationDegrees v10 = v9;
      [v6 longitude];
      CLLocationCoordinate2D v12 = CLLocationCoordinate2DMake(v10, v11);
      [v6 horizontalUncertainty];
      double v14 = v13;
      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3221225472;
      v15[2] = __43__RTLocationShifter_shiftLocation_handler___block_invoke;
      v15[3] = &unk_1E6B93C60;
      id v16 = v6;
      v17 = v7;
      -[RTLocationShifter shiftCoordinate:accuracy:handler:](self, "shiftCoordinate:accuracy:handler:", v15, v12.latitude, v12.longitude, v14);
    }
  }
  else
  {
    v8 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v19 = "-[RTLocationShifter shiftLocation:handler:]";
      __int16 v20 = 1024;
      int v21 = 38;
      _os_log_error_impl(&dword_1D9BFA000, v8, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler (in %s:%d)", buf, 0x12u);
    }
  }
}

void __43__RTLocationShifter_shiftLocation_handler___block_invoke(uint64_t a1, void *a2, double a3, double a4, double a5)
{
  id v12 = a2;
  if (v12)
  {
    double v9 = 0;
  }
  else
  {
    id v10 = objc_alloc(MEMORY[0x1E4F5CE00]);
    CLLocationDegrees v11 = [*(id *)(a1 + 32) date];
    double v9 = (void *)[v10 initWithLatitude:v11 longitude:2 horizontalUncertainty:a3 date:a4 referenceFrame:a5];
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (id)shiftedLocation:(id)a3 allowNetwork:(BOOL)a4 error:(id *)a5
{
  v73[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  if ([v8 referenceFrame] == 2)
  {
    id v9 = v8;
  }
  else if (a4)
  {
    [v8 latitude];
    CLLocationDegrees v11 = v10;
    [v8 longitude];
    CLLocationCoordinate2D v13 = CLLocationCoordinate2DMake(v11, v12);
    double v57 = 0.0;
    *(double *)&v58 = COERCE_DOUBLE(&v57);
    uint64_t v59 = 0x3010000000;
    uint64_t v61 = 0;
    uint64_t v62 = 0;
    v60 = &unk_1DA1C36CB;
    double v53 = 0.0;
    v54 = &v53;
    uint64_t v55 = 0x2020000000;
    uint64_t v56 = 0;
    *(void *)&long long v67 = 0;
    *((void *)&v67 + 1) = &v67;
    uint64_t v68 = 0x3032000000;
    v69 = __Block_byref_object_copy__34;
    v70 = __Block_byref_object_dispose__34;
    id v71 = 0;
    dispatch_semaphore_t v14 = dispatch_semaphore_create(0);
    [v8 horizontalUncertainty];
    double v16 = v15;
    uint64_t v45 = MEMORY[0x1E4F143A8];
    uint64_t v46 = 3221225472;
    v47 = __56__RTLocationShifter_shiftedLocation_allowNetwork_error___block_invoke;
    v48 = &unk_1E6B93C88;
    v50 = &v57;
    v51 = &v53;
    v52 = &v67;
    v17 = v14;
    v49 = v17;
    -[RTLocationShifter shiftCoordinate:accuracy:handler:](self, "shiftCoordinate:accuracy:handler:", &v45, v13.latitude, v13.longitude, v16);
    dispatch_time_t v18 = dispatch_time(0, 300000000000);
    if (dispatch_semaphore_wait(v17, v18))
    {
      v19 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v65 = *MEMORY[0x1E4F28568];
      v66 = @"Timed-out attempting to shift coordinate";
      __int16 v20 = [[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v66, &v65, 1, v45, v46, v47, v48];
      int v21 = [v19 errorWithDomain:*MEMORY[0x1E4F5CFE8] code:0 userInfo:v20];

      uint64_t v22 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        v44 = [v21 localizedDescription];
        *(_DWORD *)buf = 138412290;
        v64 = v44;
        _os_log_error_impl(&dword_1D9BFA000, v22, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
      }
      if (a5) {
        *a5 = v21;
      }
      id v9 = v8;
    }
    else
    {
      if (a5) {
        *a5 = *(id *)(*((void *)&v67 + 1) + 40);
      }
      if (*(void *)(*((void *)&v67 + 1) + 40))
      {
        id v9 = v8;
      }
      else
      {
        id v38 = objc_alloc(MEMORY[0x1E4F5CE00]);
        double v39 = v58[4];
        double v40 = v58[5];
        double v41 = v54[3];
        v42 = [v8 date:v45:v46:v47:v48];
        id v9 = (id)[v38 initWithLatitude:v42 longitude:2 horizontalUncertainty:v39 date:v40 referenceFrame:v41];
      }
    }

    _Block_object_dispose(&v67, 8);
    _Block_object_dispose(&v53, 8);
    _Block_object_dispose(&v57, 8);
  }
  else
  {
    double v57 = 0.0;
    *(double *)&v58 = 0.0;
    double v53 = 0.0;
    [v8 latitude];
    double v24 = v23;
    [v8 longitude];
    double v26 = v25;
    geoLocationShifter = self->_geoLocationShifter;
    [v8 horizontalUncertainty];
    if (-[GEOLocationShifter shiftCoordinate:accuracy:shiftedCoordinate:shiftedAccuracy:](geoLocationShifter, "shiftCoordinate:accuracy:shiftedCoordinate:shiftedAccuracy:", &v57, &v53, v24, v26, v28))
    {
      id v29 = objc_alloc(MEMORY[0x1E4F5CE00]);
      double v30 = v57;
      double v31 = *(double *)&v58;
      double v32 = v53;
      v33 = [v8 date];
      id v34 = (id)[v29 initWithLatitude:v33 longitude:2 horizontalUncertainty:v30 date:v31 referenceFrame:v32];
    }
    else
    {
      v35 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v72 = *MEMORY[0x1E4F28568];
      v73[0] = @"Unable to shift without network allowed";
      v36 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v73 forKeys:&v72 count:1];
      v33 = [v35 errorWithDomain:*MEMORY[0x1E4F5CFE8] code:0 userInfo:v36];

      v37 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
      {
        LODWORD(v67) = 138412290;
        *(void *)((char *)&v67 + 4) = v33;
        _os_log_error_impl(&dword_1D9BFA000, v37, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v67, 0xCu);
      }

      if (a5) {
        *a5 = v33;
      }
      id v34 = v8;
    }
    id v9 = v34;
  }

  return v9;
}

void __56__RTLocationShifter_shiftedLocation_allowNetwork_error___block_invoke(uint64_t a1, void *a2, double a3, double a4, double a5)
{
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  *(double *)(v7 + 32) = a3;
  *(double *)(v7 + 40) = a4;
  *(double *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = a5;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), a2);
  id v8 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (void)shiftCoordinate:(CLLocationCoordinate2D)a3 accuracy:(double)a4 handler:(id)a5
{
  double longitude = a3.longitude;
  double latitude = a3.latitude;
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v9 = (void (**)(id, void, double, double, double))a5;
  if (v9)
  {
    if ((objc_msgSend(MEMORY[0x1E4F64670], "isLocationShiftRequiredForCoordinate:", latitude, longitude) & 1) == 0) {
      v9[2](v9, 0, latitude, longitude, a4);
    }
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __54__RTLocationShifter_shiftCoordinate_accuracy_handler___block_invoke;
    v21[3] = &unk_1E6B93CB0;
    double v10 = v9;
    uint64_t v22 = v10;
    CLLocationDegrees v11 = (void *)MEMORY[0x1E016DB00](v21);
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __54__RTLocationShifter_shiftCoordinate_accuracy_handler___block_invoke_2;
    v16[3] = &unk_1E6B93CD8;
    v17 = v10;
    double v18 = latitude;
    double v19 = longitude;
    double v20 = a4;
    CLLocationDegrees v12 = (void *)MEMORY[0x1E016DB00](v16);
    geoLocationShifter = self->_geoLocationShifter;
    dispatch_semaphore_t v14 = dispatch_get_global_queue(0, 0);
    -[GEOLocationShifter shiftCoordinate:accuracy:withCompletionHandler:mustGoToNetworkCallback:errorHandler:callbackQueue:](geoLocationShifter, "shiftCoordinate:accuracy:withCompletionHandler:mustGoToNetworkCallback:errorHandler:callbackQueue:", v11, 0, v12, v14, latitude, longitude, a4);

    double v15 = v22;
  }
  else
  {
    double v15 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      double v24 = "-[RTLocationShifter shiftCoordinate:accuracy:handler:]";
      __int16 v25 = 1024;
      int v26 = 144;
      _os_log_error_impl(&dword_1D9BFA000, v15, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler (in %s:%d)", buf, 0x12u);
    }
  }
}

uint64_t __54__RTLocationShifter_shiftCoordinate_accuracy_handler___block_invoke(uint64_t a1, CLLocationDegrees a2, CLLocationDegrees a3, double a4)
{
  uint64_t v5 = *(void *)(a1 + 32);
  CLLocationCoordinate2D v8 = CLLocationCoordinate2DMake(a2, a3);
  v7.n128_f64[0] = v8.longitude;
  v6.n128_f64[0] = v8.latitude;
  id v9 = *(uint64_t (**)(uint64_t, void, __n128, __n128, __n128))(v5 + 16);
  v10.n128_f64[0] = a4;

  return v9(v5, 0, v6, v7, v10);
}

uint64_t __54__RTLocationShifter_shiftCoordinate_accuracy_handler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, double, double, double))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56));
}

+ (BOOL)isLocationShiftRequiredForCoordinate:(CLLocationCoordinate2D)a3
{
  return [MEMORY[0x1E4F64670] isLocationShiftRequiredForCoordinate:a3.latitude, a3.longitude];
}

- (void).cxx_destruct
{
}

@end