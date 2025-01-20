@interface RTVisitPipelineModuleVisitCentroidUpdater
- (RTDistanceCalculator)distanceCalculator;
- (RTLocationManager)locationManager;
- (RTVisitHyperParameter)hyperParameter;
- (RTVisitPipelineModuleVisitCentroidUpdater)init;
- (RTVisitPipelineModuleVisitCentroidUpdater)initWithHyperParameter:(id)a3 locationManager:(id)a4 distanceCalculator:(id)a5;
- (id)_updateHorizontalUncertainty:(id)a3;
- (id)_updateVisitCentroidBasedOnFilteredLocations:(id)a3 maxHorizontalAccuracy:(double)a4;
- (id)_updateVisitCentroidBasedOnMode:(id)a3;
- (id)modeWithReferenceLocation:(id)a3;
- (id)process:(id)a3;
- (unint64_t)binCountsSize;
- (unint64_t)modeBinIndex;
- (unsigned)binCounts;
- (unsigned)invalidBinIndex;
- (void)dealloc;
- (void)setDistanceCalculator:(id)a3;
- (void)updateCountFromNorthing:(double)a3 easting:(double)a4;
@end

@implementation RTVisitPipelineModuleVisitCentroidUpdater

- (RTVisitPipelineModuleVisitCentroidUpdater)init
{
  uint64_t v2 = objc_opt_class();
  _RTRequireInitializer(v2, sel_initWithHyperParameter_locationManager_distanceCalculator_);
}

- (RTVisitPipelineModuleVisitCentroidUpdater)initWithHyperParameter:(id)a3 locationManager:(id)a4 distanceCalculator:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v12 = v11;
  if (!v9)
  {
    v18 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      goto LABEL_17;
    }
    *(_WORD *)buf = 0;
    v19 = "Invalid parameter not satisfying: hyperParameter";
LABEL_16:
    _os_log_error_impl(&dword_1D9BFA000, v18, OS_LOG_TYPE_ERROR, v19, buf, 2u);
    goto LABEL_17;
  }
  if (!v10)
  {
    v18 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      goto LABEL_17;
    }
    *(_WORD *)buf = 0;
    v19 = "Invalid parameter not satisfying: locationManager";
    goto LABEL_16;
  }
  if (!v11)
  {
    v18 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      goto LABEL_17;
    }
    *(_WORD *)buf = 0;
    v19 = "Invalid parameter not satisfying: distanceCalculator";
    goto LABEL_16;
  }
  v21.receiver = self;
  v21.super_class = (Class)RTVisitPipelineModuleVisitCentroidUpdater;
  v13 = [(RTVisitPipelineModuleVisitCentroidUpdater *)&v21 init];
  self = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_hyperParameter, a3);
    uint64_t v14 = [v9 maxNumOfBins];
    self->_binCountsSize = 4 * v14 * [v9 maxNumOfBins];
    objc_storeStrong((id *)&self->_distanceCalculator, a5);
    v15 = (unsigned int *)malloc_type_calloc(4 * self->_binCountsSize, 1uLL, 0x6C8926EuLL);
    self->_binCounts = v15;
    if (v15)
    {
      int v16 = [(RTVisitHyperParameter *)self->_hyperParameter maxNumOfBins];
      self->_invalidBinIndex = 4 * [(RTVisitHyperParameter *)self->_hyperParameter maxNumOfBins] * v16;
      objc_storeStrong((id *)&self->_locationManager, a4);
      goto LABEL_7;
    }
    v18 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v19 = "Invalid parameter not satisfying: _binCounts";
      goto LABEL_16;
    }
LABEL_17:

    v17 = 0;
    goto LABEL_18;
  }
LABEL_7:
  self = self;
  v17 = self;
LABEL_18:

  return v17;
}

- (void)dealloc
{
  binCounts = self->_binCounts;
  if (binCounts) {
    free(binCounts);
  }
  v4.receiver = self;
  v4.super_class = (Class)RTVisitPipelineModuleVisitCentroidUpdater;
  [(RTVisitPipelineModuleVisitCentroidUpdater *)&v4 dealloc];
}

- (void)updateCountFromNorthing:(double)a3 easting:(double)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if (self->_binCounts)
  {
    int v7 = [(RTVisitHyperParameter *)self->_hyperParameter maxNumOfBins];
    int v8 = (int)(a3 / (double)[(RTVisitHyperParameter *)self->_hyperParameter binSize] + 0.5) + v7;
    unint64_t v9 = [(RTVisitHyperParameter *)self->_hyperParameter binSize];
    if ((v8 & 0x80000000) == 0)
    {
      int v10 = 2 * v7;
      if (2 * v7 > v8)
      {
        int v11 = (int)(a4 / (double)v9 + 0.5) + v7;
        if ((v11 & 0x80000000) == 0 && v10 > v11)
        {
          int v12 = [(RTVisitHyperParameter *)self->_hyperParameter maxNumOfBins];
          ++self->_binCounts[v11 + 2 * v8 * v12];
          return;
        }
      }
    }
    v13 = _rt_log_facility_get_os_log(RTLogFacilityVisit);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      int v14 = 134218240;
      double v15 = a3;
      __int16 v16 = 2048;
      double v17 = a4;
      _os_log_debug_impl(&dword_1D9BFA000, v13, OS_LOG_TYPE_DEBUG, "out of range location detected, northing=%f, easting=%f", (uint8_t *)&v14, 0x16u);
    }
  }
  else
  {
    v13 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v14) = 0;
      _os_log_error_impl(&dword_1D9BFA000, v13, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: _binCounts", (uint8_t *)&v14, 2u);
    }
  }
}

- (unint64_t)modeBinIndex
{
  binCounts = self->_binCounts;
  if (binCounts)
  {
    unint64_t result = self->_invalidBinIndex;
    unint64_t binCountsSize = self->_binCountsSize;
    if (binCountsSize)
    {
      unint64_t v6 = 0;
      unint64_t v7 = 0;
      do
      {
        unint64_t v8 = binCounts[v6];
        if (v7 < v8) {
          unint64_t result = v6;
        }
        if (v7 <= v8) {
          unint64_t v7 = binCounts[v6];
        }
        ++v6;
      }
      while (binCountsSize != v6);
    }
  }
  else
  {
    unint64_t v9 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)int v10 = 0;
      _os_log_error_impl(&dword_1D9BFA000, v9, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: _binCounts", v10, 2u);
    }

    return self->_invalidBinIndex;
  }
  return result;
}

- (id)modeWithReferenceLocation:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (!v5)
  {
    unint64_t v7 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
LABEL_12:

      v22 = 0;
      goto LABEL_13;
    }
    *(_WORD *)buf = 0;
    unint64_t v9 = "Invalid parameter not satisfying: referenceLocation";
LABEL_22:
    _os_log_error_impl(&dword_1D9BFA000, v7, OS_LOG_TYPE_ERROR, v9, buf, 2u);
    goto LABEL_12;
  }
  unint64_t v6 = [(RTVisitPipelineModuleVisitCentroidUpdater *)self modeBinIndex];
  if (v6 == self->_invalidBinIndex)
  {
    unint64_t v7 = _rt_log_facility_get_os_log(RTLogFacilityVisit);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      unint64_t v8 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412290;
      *(void *)&buf[4] = v8;
      _os_log_impl(&dword_1D9BFA000, v7, OS_LOG_TYPE_INFO, "%@, invalid bin index for the mode", buf, 0xCu);
    }
    goto LABEL_12;
  }
  unint64_t v10 = v6;
  [(RTVisitHyperParameter *)self->_hyperParameter maxNumOfBins];
  if (v10 >= self->_invalidBinIndex)
  {
    unint64_t v7 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      goto LABEL_12;
    }
    *(_WORD *)buf = 0;
    unint64_t v9 = "Invalid parameter not satisfying: modeBinIndex < _invalidBinIndex";
    goto LABEL_22;
  }
  [(RTVisitHyperParameter *)self->_hyperParameter maxNumOfBins];
  [(RTVisitHyperParameter *)self->_hyperParameter maxNumOfBins];
  [(RTVisitHyperParameter *)self->_hyperParameter binSize];
  [(RTVisitHyperParameter *)self->_hyperParameter binSize];
  double v26 = 0.0;
  *(void *)buf = 0;
  [v5 latitude];
  [v5 longitude];
  if ((RTCommonConvertLocalFrameToGeodetic() & 1) == 0)
  {
    v19 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
LABEL_19:
      v22 = 0;
      goto LABEL_20;
    }
    *(_WORD *)v25 = 0;
    v24 = "Invalid parameter not satisfying: result";
LABEL_24:
    _os_log_error_impl(&dword_1D9BFA000, v19, OS_LOG_TYPE_ERROR, v24, v25, 2u);
    goto LABEL_19;
  }
  RTCommonIsCoordinateValid();
  if (v11 == 0.0)
  {
    v19 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      goto LABEL_19;
    }
    *(_WORD *)v25 = 0;
    v24 = "Invalid parameter not satisfying: RTCommonIsCoordinateValid(latitude, longitude)";
    goto LABEL_24;
  }
  id v12 = objc_alloc(MEMORY[0x1E4F5CE00]);
  [v5 horizontalUncertainty];
  double v14 = v13;
  [v5 altitude];
  double v16 = v15;
  [v5 verticalUncertainty];
  double v18 = v17;
  v19 = [v5 date];
  uint64_t v20 = [v5 referenceFrame];
  [v5 speed];
  v22 = [v12 initWithLatitude:v19 longitude:v20 horizontalUncertainty:objc_msgSend(v5, "sourceAccuracy") altitude:*(double *)buf verticalUncertainty:v26 date:v14 referenceFrame:v16 speed:v21];
LABEL_20:

LABEL_13:

  return v22;
}

- (id)_updateVisitCentroidBasedOnMode:(id)a3
{
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  unint64_t v6 = [v5 visit];

  if (v6)
  {
    aSelector = a2;
    unint64_t v7 = [v5 visit];
    unint64_t v8 = [v7 location];

    long long v50 = 0u;
    long long v51 = 0u;
    long long v48 = 0u;
    long long v49 = 0u;
    unint64_t v9 = [v5 points];
    unint64_t v10 = [v9 locations];

    uint64_t v11 = [v10 countByEnumeratingWithState:&v48 objects:v57 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v49;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v49 != v13) {
            objc_enumerationMutation(v10);
          }
          double v15 = *(void **)(*((void *)&v48 + 1) + 8 * i);
          *(void *)buf = 0;
          [v8 latitude];
          [v8 longitude];
          [v15 latitude];
          [v15 longitude];
          if (RTCommonConvertGeodeticToLocalFrame()) {
            [(RTVisitPipelineModuleVisitCentroidUpdater *)self updateCountFromNorthing:*(double *)buf easting:0.0];
          }
        }
        uint64_t v12 = [v10 countByEnumeratingWithState:&v48 objects:v57 count:16];
      }
      while (v12);
    }

    double v16 = [(RTVisitPipelineModuleVisitCentroidUpdater *)self modeWithReferenceLocation:v8];
    if (v16)
    {
      id v17 = objc_alloc(MEMORY[0x1E4F5CFC8]);
      v46 = [v5 visit];
      v42 = [v46 date];
      v45 = [v5 visit];
      uint64_t v40 = [v45 type];
      v44 = [v5 visit];
      double v18 = [v44 entry];
      v43 = [v5 visit];
      v19 = [v43 exit];
      uint64_t v20 = [v5 visit];
      uint64_t v39 = [v20 dataPointCount];
      double v21 = [v5 visit];
      [v21 confidence];
      double v23 = v22;
      v24 = [v5 visit];
      v25 = [v24 placeInference];
      uint64_t v41 = [v17 initWithDate:v42 type:v40 location:v16 entry:v18 exit:v19 dataPointCount:v39 confidence:v23 placeInference:v25];

      double v26 = _rt_log_facility_get_os_log(RTLogFacilityVisit);
      if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
      {
        v27 = NSStringFromSelector(aSelector);
        uint64_t v28 = [v5 visit];
        v29 = [v28 location];
        *(_DWORD *)buf = 138412802;
        *(void *)&buf[4] = v27;
        __int16 v53 = 2112;
        v54 = v29;
        __int16 v55 = 2112;
        v56 = v16;
        _os_log_impl(&dword_1D9BFA000, v26, OS_LOG_TYPE_INFO, "%@, visit centroid, %@, updated visit centroid, %@", buf, 0x20u);
      }
      v30 = [RTVisitCluster alloc];
      v31 = [RTVisitLocationPoints alloc];
      v32 = [v5 points];
      v33 = [v32 locations];
      v34 = [(RTVisitLocationPoints *)v31 initWithLocations:v33];
      v35 = v41;
      v36 = [(RTVisitCluster *)v30 initWithPoints:v34 visit:v41];
    }
    else
    {
      v35 = _rt_log_facility_get_os_log(RTLogFacilityVisit);
      if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
      {
        v37 = NSStringFromSelector(aSelector);
        *(_DWORD *)buf = 138412290;
        *(void *)&buf[4] = v37;
        _os_log_impl(&dword_1D9BFA000, v35, OS_LOG_TYPE_INFO, "%@， fail to update centroid", buf, 0xCu);
      }
      v36 = 0;
    }
  }
  else
  {
    v36 = 0;
  }

  return v36;
}

- (id)_updateHorizontalUncertainty:(id)a3
{
  uint64_t v128 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [v4 visit];

  if (!v5)
  {
    double v14 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v14, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: cluster.visit", buf, 2u);
    }
    goto LABEL_13;
  }
  unint64_t v6 = [v4 visit];
  uint64_t v7 = [v6 entry];
  if (!v7)
  {

LABEL_11:
    double v14 = _rt_log_facility_get_os_log(RTLogFacilityVisit);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      double v23 = NSStringFromSelector(a2);
      v24 = [v4 visit];
      *(_DWORD *)buf = 138412546;
      v118 = v23;
      __int16 v119 = 2112;
      unint64_t v120 = (unint64_t)v24;
      _os_log_impl(&dword_1D9BFA000, v14, OS_LOG_TYPE_INFO, "%@, incomplete visit, %@", buf, 0x16u);
    }
LABEL_13:
    double v22 = 0;
    goto LABEL_46;
  }
  unint64_t v8 = (void *)v7;
  unint64_t v9 = [v4 visit];
  unint64_t v10 = [v9 exit];

  if (!v10) {
    goto LABEL_11;
  }
  uint64_t v11 = (void *)MEMORY[0x1E4F1C9C8];
  uint64_t v12 = [v4 visit];
  uint64_t v13 = [v12 entry];
  double v14 = [v11 dateWithTimeInterval:v13 sinceDate:900.0];

  double v15 = (void *)MEMORY[0x1E4F1C9C8];
  double v16 = [v4 visit];
  id v17 = [v16 exit];
  double v18 = [v15 dateWithTimeInterval:v17 sinceDate:-900.0];

  v111 = v18;
  if ([v18 isBeforeDate:v14])
  {
    v19 = _rt_log_facility_get_os_log(RTLogFacilityVisit);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      uint64_t v20 = NSStringFromSelector(a2);
      double v21 = [v4 visit];
      *(_DWORD *)buf = 138412546;
      v118 = v20;
      __int16 v119 = 2112;
      unint64_t v120 = (unint64_t)v21;
      _os_log_impl(&dword_1D9BFA000, v19, OS_LOG_TYPE_INFO, "%@, skip horizontal uncertainty update for visit, %@, due to short duration", buf, 0x16u);
    }
    double v22 = 0;
    goto LABEL_45;
  }
  v25 = [v4 visit];
  v19 = [v25 location];

  long long v115 = 0u;
  long long v116 = 0u;
  long long v113 = 0u;
  long long v114 = 0u;
  v100 = v4;
  double v26 = [v4 points];
  v27 = [v26 locations];

  uint64_t v28 = [v27 countByEnumeratingWithState:&v113 objects:v127 count:16];
  if (!v28)
  {

    unint64_t v47 = 0;
LABEL_38:
    long long v48 = _rt_log_facility_get_os_log(RTLogFacilityVisit);
    if (os_log_type_enabled(v48, OS_LOG_TYPE_INFO))
    {
      long long v49 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412546;
      v118 = v49;
      __int16 v119 = 2048;
      unint64_t v120 = v47;
      _os_log_impl(&dword_1D9BFA000, v48, OS_LOG_TYPE_INFO, "%@, skip horizontal uncertainty update due to small number of locations, %lu", buf, 0x16u);
    }
    double v22 = 0;
    goto LABEL_44;
  }
  uint64_t v29 = v28;
  aSelector = a2;
  unint64_t v104 = 0;
  uint64_t v30 = *(void *)v114;
  double v31 = 0.0;
  double v32 = 0.0;
  double v33 = 0.0;
  double v34 = 0.0;
  do
  {
    for (uint64_t i = 0; i != v29; ++i)
    {
      if (*(void *)v114 != v30) {
        objc_enumerationMutation(v27);
      }
      v36 = *(void **)(*((void *)&v113 + 1) + 8 * i);
      id v37 = [v36 date];
      if (([v37 isBeforeDate:v14] & 1) == 0)
      {
        v38 = [v36 date];
        char v39 = [v38 isAfterDate:v111];

        if (v39) {
          continue;
        }
        uint64_t v40 = [(RTVisitPipelineModuleVisitCentroidUpdater *)self distanceCalculator];
        id v112 = 0;
        [v40 distanceFromLocation:v19 toLocation:v36 error:&v112];
        double v42 = v41;
        id v37 = v112;

        if (v37 || v42 > 250.0)
        {
          v43 = _rt_log_facility_get_os_log(RTLogFacilityVisit);
          if (os_log_type_enabled(v43, OS_LOG_TYPE_DEBUG))
          {
            v45 = NSStringFromSelector(aSelector);
            *(_DWORD *)buf = 138413314;
            v118 = v45;
            __int16 v119 = 2112;
            unint64_t v120 = (unint64_t)v36;
            __int16 v121 = 2112;
            uint64_t v122 = (uint64_t)v19;
            __int16 v123 = 2048;
            double v124 = v42;
            __int16 v125 = 2112;
            id v126 = v37;
            _os_log_debug_impl(&dword_1D9BFA000, v43, OS_LOG_TYPE_DEBUG, "%@, outlier location, %@, reference location, %@, distance, %.2f meters, error, %@", buf, 0x34u);
          }
        }
        else
        {
          [v19 latitude];
          [v19 longitude];
          [v36 latitude];
          [v36 longitude];
          if (RTCommonConvertGeodeticToLocalFrame())
          {
            double v34 = v34 + 0.0;
            double v33 = v33 + 0.0;
            double v32 = v32 + 0.0 * 0.0;
            double v31 = v31 + 0.0 * 0.0;
            ++v104;
          }
          else
          {
            v44 = _rt_log_facility_get_os_log(RTLogFacilityVisit);
            if (os_log_type_enabled(v44, OS_LOG_TYPE_DEBUG))
            {
              v46 = NSStringFromSelector(aSelector);
              *(_DWORD *)buf = 138412802;
              v118 = v46;
              __int16 v119 = 2112;
              unint64_t v120 = (unint64_t)v36;
              __int16 v121 = 2112;
              uint64_t v122 = (uint64_t)v19;
              _os_log_debug_impl(&dword_1D9BFA000, v44, OS_LOG_TYPE_DEBUG, "%@, cannot convert to local frame for location, %@, with reference location, %@", buf, 0x20u);
            }
          }
          id v37 = 0;
        }
      }
    }
    uint64_t v29 = [v27 countByEnumeratingWithState:&v113 objects:v127 count:16];
  }
  while (v29);

  unint64_t v47 = v104;
  if (v104 <= 0x3B)
  {
    id v4 = v100;
    a2 = aSelector;
    goto LABEL_38;
  }
  double v50 = sqrt(vabdd_f64(v32 / (double)v104, v34 / (double)v104 * (v34 / (double)v104)));
  double v51 = sqrt(vabdd_f64(v31 / (double)v104, v33 / (double)v104 * (v33 / (double)v104)));
  double v52 = sqrt(v51 * v51 + v50 * v50);
  id v96 = objc_alloc(MEMORY[0x1E4F5CE00]);
  v108 = [v100 visit];
  v105 = [v108 location];
  [v105 latitude];
  double v54 = v53;
  v101 = [v100 visit];
  v98 = [v101 location];
  [v98 longitude];
  double v56 = v55;
  v94 = [v100 visit];
  v92 = [v94 location];
  [v92 altitude];
  double v58 = v57;
  v90 = [v100 visit];
  v88 = [v90 location];
  [v88 verticalUncertainty];
  double v60 = v59;
  v87 = [v100 visit];
  v86 = [v87 location];
  v61 = [v86 date];
  v85 = [v100 visit];
  v62 = [v85 location];
  uint64_t v63 = [v62 referenceFrame];
  v64 = [v100 visit];
  v65 = [v64 location];
  [v65 speed];
  double v67 = v66;
  v68 = [v100 visit];
  v69 = [v68 location];
  uint64_t v97 = [v96 initWithLatitude:v61 longitude:v63 horizontalUncertainty:objc_msgSend(v69, "sourceAccuracy") altitude:v54 verticalUncertainty:v56 date:v52 referenceFrame:v58 speed:v60 sourceAccuracy:v67];

  id v109 = objc_alloc(MEMORY[0x1E4F5CFC8]);
  v106 = [v100 visit];
  v91 = [v106 date];
  v102 = [v100 visit];
  uint64_t v93 = [v102 type];
  v99 = [v100 visit];
  v70 = [v99 entry];
  v95 = [v100 visit];
  v71 = [v95 exit];
  v72 = [v100 visit];
  uint64_t v89 = [v72 dataPointCount];
  v73 = [v100 visit];
  [v73 confidence];
  double v75 = v74;
  v76 = [v100 visit];
  v77 = [v76 placeInference];
  long long v48 = v97;
  v110 = (void *)[v109 initWithDate:v91 type:v93 location:v97 entry:v70 exit:v71 dataPointCount:v89 confidence:v75 placeInference:v77];

  id v4 = v100;
  v78 = _rt_log_facility_get_os_log(RTLogFacilityVisit);
  if (os_log_type_enabled(v78, OS_LOG_TYPE_INFO))
  {
    v79 = NSStringFromSelector(aSelector);
    v80 = [v100 visit];
    v81 = [v80 location];
    *(_DWORD *)buf = 138412802;
    v118 = v79;
    __int16 v119 = 2112;
    unint64_t v120 = (unint64_t)v81;
    __int16 v121 = 2112;
    uint64_t v122 = v97;
    _os_log_impl(&dword_1D9BFA000, v78, OS_LOG_TYPE_INFO, "%@, visit centroid, %@, updated visit centroid, %@", buf, 0x20u);
  }
  v82 = [RTVisitCluster alloc];
  v83 = [v100 points];
  double v22 = [(RTVisitCluster *)v82 initWithPoints:v83 visit:v110];

LABEL_44:
LABEL_45:

LABEL_46:

  return v22;
}

- (id)_updateVisitCentroidBasedOnFilteredLocations:(id)a3 maxHorizontalAccuracy:(double)a4
{
  v178[1] = *MEMORY[0x1E4F143B8];
  id v134 = a3;
  id v5 = [v134 visit];

  if (!v5)
  {
    v19 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v19, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: cluster.visit", buf, 2u);
    }
LABEL_13:
    double v18 = 0;
    goto LABEL_78;
  }
  unint64_t v6 = [v134 visit];
  uint64_t v7 = [v6 entry];
  if (!v7)
  {

LABEL_11:
    uint64_t v20 = _rt_log_facility_get_os_log(RTLogFacilityVisit);
    v19 = v20;
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      double v21 = NSStringFromSelector(a2);
      double v22 = [v134 visit];
      *(_DWORD *)buf = 138412546;
      *(void *)&uint8_t buf[4] = v21;
      __int16 v169 = 2112;
      v170 = v22;
      _os_log_impl(&dword_1D9BFA000, v20, OS_LOG_TYPE_INFO, "%@, incomplete visit, %@", buf, 0x16u);

      double v18 = 0;
      v19 = v20;
      goto LABEL_78;
    }
    goto LABEL_13;
  }
  unint64_t v8 = [v134 visit];
  unint64_t v9 = [v8 exit];

  if (!v9) {
    goto LABEL_11;
  }
  unint64_t v10 = (void *)MEMORY[0x1E4F1C9C8];
  uint64_t v11 = [v134 visit];
  uint64_t v12 = [v11 entry];
  unint64_t v120 = [v10 dateWithTimeInterval:v12 sinceDate:900.0];

  uint64_t v13 = (void *)MEMORY[0x1E4F1C9C8];
  double v14 = [v134 visit];
  double v15 = [v14 exit];
  __int16 v119 = [v13 dateWithTimeInterval:v15 sinceDate:-900.0];

  if ([v119 isBeforeDate:v120])
  {
    oslog = _rt_log_facility_get_os_log(RTLogFacilityVisit);
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_INFO))
    {
      double v16 = NSStringFromSelector(a2);
      id v17 = [v134 visit];
      *(_DWORD *)buf = 138412546;
      *(void *)&uint8_t buf[4] = v16;
      __int16 v169 = 2112;
      v170 = v17;
      _os_log_impl(&dword_1D9BFA000, oslog, OS_LOG_TYPE_INFO, "%@, skip centroid update for visit, %@, due to short duration", buf, 0x16u);
    }
    double v18 = 0;
    goto LABEL_77;
  }
  oslog = [objc_alloc(MEMORY[0x1E4F28C18]) initWithStartDate:v120 endDate:v119];
  double v23 = [v134 visit];
  v24 = [v23 location];

  v138 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:200];
  unsigned int v25 = 0;
  uint64_t v121 = *MEMORY[0x1E4F5CFE8];
  uint64_t v122 = *MEMORY[0x1E4F28568];
  char v26 = 1;
  double v27 = 0.0;
  double v28 = 0.0;
  do
  {
    context = (void *)MEMORY[0x1E016D870]();
    v135 = (void *)[objc_alloc(MEMORY[0x1E4F5CF40]) initWithDateInterval:oslog horizontalAccuracy:200 batchSize:0 boundingBoxLocation:1 type:a4];
    double v162 = 0.0;
    v163 = (id *)&v162;
    uint64_t v164 = 0x3032000000;
    v165 = __Block_byref_object_copy_;
    v166 = __Block_byref_object_dispose_;
    id v167 = 0;
    double v156 = 0.0;
    v157 = &v156;
    uint64_t v158 = 0x3032000000;
    v159 = __Block_byref_object_copy_;
    v160 = __Block_byref_object_dispose_;
    id v161 = 0;
    dispatch_semaphore_t v29 = dispatch_semaphore_create(0);
    uint64_t v30 = [(RTVisitPipelineModuleVisitCentroidUpdater *)self locationManager];
    v152[0] = MEMORY[0x1E4F143A8];
    v152[1] = 3221225472;
    v152[2] = __112__RTVisitPipelineModuleVisitCentroidUpdater__updateVisitCentroidBasedOnFilteredLocations_maxHorizontalAccuracy___block_invoke;
    v152[3] = &unk_1E6B905F0;
    v154 = &v162;
    v155 = &v156;
    double v31 = v29;
    v153 = v31;
    [v30 fetchStoredLocationsWithOptions:v135 handler:v152];

    dsema = v31;
    double v32 = [MEMORY[0x1E4F1C9C8] now];
    dispatch_time_t v33 = dispatch_time(0, 3600000000000);
    if (!dispatch_semaphore_wait(dsema, v33)) {
      goto LABEL_20;
    }
    double v34 = [MEMORY[0x1E4F1C9C8] now];
    [v34 timeIntervalSinceDate:v32];
    double v36 = v35;
    id v37 = objc_opt_new();
    v38 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_130];
    char v39 = [MEMORY[0x1E4F29060] callStackSymbols];
    uint64_t v40 = [v39 filteredArrayUsingPredicate:v38];
    double v41 = [v40 firstObject];

    [v37 submitToCoreAnalytics:v41 type:1 duration:v36];
    double v42 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v42, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_1D9BFA000, v42, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", buf, 2u);
    }

    v43 = (void *)MEMORY[0x1E4F28C58];
    v178[0] = v122;
    *(void *)buf = @"semaphore wait timeout";
    v44 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:buf forKeys:v178 count:1];
    v45 = [v43 errorWithDomain:v121 code:15 userInfo:v44];

    if (v45)
    {
      id v46 = v45;

      char v47 = 0;
    }
    else
    {
LABEL_20:
      id v46 = 0;
      char v47 = 1;
    }

    id v127 = v46;
    if ((v47 & 1) == 0) {
      objc_storeStrong(v163 + 5, v46);
    }
    if (v163[5])
    {
      long long v48 = _rt_log_facility_get_os_log(RTLogFacilityVisit);
      if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(a2);
        id v49 = (id)objc_claimAutoreleasedReturnValue();
        double v50 = [v134 visit];
        id v51 = v163[5];
        *(_DWORD *)buf = 138412802;
        *(void *)&uint8_t buf[4] = v49;
        __int16 v169 = 2112;
        v170 = v50;
        __int16 v171 = 2112;
        uint64_t v172 = (uint64_t)v51;
        _os_log_error_impl(&dword_1D9BFA000, v48, OS_LOG_TYPE_ERROR, "%@, skip centroid update for visit, %@, due to error, %@", buf, 0x20u);
      }
LABEL_56:
      int v72 = 1;
      goto LABEL_57;
    }
    if ((v26 & 1) != 0 && (unint64_t)[*((id *)v157 + 5) count] <= 0x3B)
    {
      long long v48 = _rt_log_facility_get_os_log(RTLogFacilityVisit);
      char v26 = 1;
      if (os_log_type_enabled(v48, OS_LOG_TYPE_INFO))
      {
        NSStringFromSelector(a2);
        id v52 = (id)objc_claimAutoreleasedReturnValue();
        double v53 = [v134 visit];
        uint64_t v54 = [*((id *)v157 + 5) count];
        *(_DWORD *)buf = 138412802;
        *(void *)&uint8_t buf[4] = v52;
        __int16 v169 = 2112;
        v170 = v53;
        __int16 v171 = 2048;
        uint64_t v172 = v54;
        _os_log_impl(&dword_1D9BFA000, v48, OS_LOG_TYPE_INFO, "%@, skip centroid update for visit, %@, due to small number of GPS locations, %lu", buf, 0x20u);

        char v26 = 1;
      }
      goto LABEL_56;
    }
    long long v150 = 0u;
    long long v151 = 0u;
    long long v148 = 0u;
    long long v149 = 0u;
    long long v48 = *((id *)v157 + 5);
    uint64_t v55 = [v48 countByEnumeratingWithState:&v148 objects:v177 count:16];
    if (v55)
    {
      uint64_t v56 = *(void *)v149;
      while (2)
      {
        uint64_t v57 = 0;
        do
        {
          if (*(void *)v149 != v56) {
            objc_enumerationMutation(v48);
          }
          double v58 = *(void **)(*((void *)&v148 + 1) + 8 * v57);
          double v59 = [(RTVisitPipelineModuleVisitCentroidUpdater *)self distanceCalculator];
          id v147 = 0;
          [v59 distanceFromLocation:v24 toLocation:v58 error:&v147];
          double v61 = v60;
          id v62 = v147;

          if (v62 || v61 > 250.0)
          {
            v65 = _rt_log_facility_get_os_log(RTLogFacilityVisit);
            if (os_log_type_enabled(v65, OS_LOG_TYPE_DEBUG))
            {
              double v67 = NSStringFromSelector(a2);
              *(_DWORD *)buf = 138413314;
              *(void *)&uint8_t buf[4] = v67;
              __int16 v169 = 2112;
              v170 = v58;
              __int16 v171 = 2112;
              uint64_t v172 = (uint64_t)v24;
              __int16 v173 = 2048;
              double v174 = v61;
              __int16 v175 = 2112;
              id v176 = v62;
              _os_log_debug_impl(&dword_1D9BFA000, v65, OS_LOG_TYPE_DEBUG, "%@, outlier location, %@, reference location, %@, distance, %.2f meters, error, %@", buf, 0x34u);
            }
          }
          else
          {
            *(void *)buf = 0;
            v178[0] = 0;
            double v146 = 0.0;
            [v24 latitude];
            [v24 longitude];
            [v58 latitude];
            [v58 longitude];
            ++v25;
            if ((RTCommonConvertGeodeticToLocalFrame() & 1) == 0)
            {
              v73 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
              if (os_log_type_enabled(v73, OS_LOG_TYPE_ERROR))
              {
                *(_WORD *)v145 = 0;
                _os_log_error_impl(&dword_1D9BFA000, v73, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: result", v145, 2u);
              }

              char v26 = 0;
              goto LABEL_56;
            }
            double v63 = *(double *)v178;
            double v64 = v146;
            if (v25 > 0xC8)
            {
              unsigned int v66 = RTCommonRandomInt();
              if (v66 <= 0xC7) {
                [v138 replaceObjectAtIndex:v66 withObject:v58];
              }
            }
            else
            {
              [v138 addObject:v58];
            }
            double v28 = v28 + v63;
            double v27 = v27 + v64;
          }
          ++v57;
        }
        while (v55 != v57);
        uint64_t v55 = [v48 countByEnumeratingWithState:&v148 objects:v177 count:16];
        if (v55) {
          continue;
        }
        break;
      }
    }

    v68 = [*((id *)v157 + 5) lastObject];
    v69 = [v68 date];
    v70 = [v69 dateByAddingTimeInterval:1.0];

    v71 = [oslog endDate];

    if ([*((id *)v157 + 5) count] && !objc_msgSend(v71, "isBeforeDate:", v70))
    {
      id v74 = objc_alloc(MEMORY[0x1E4F28C18]);
      long long v48 = [v70 earlierDate:v71];
      uint64_t v75 = [v74 initWithStartDate:v48 endDate:v71];

      char v26 = 0;
      int v72 = 0;
      oslog = v75;
    }
    else
    {
      long long v48 = _rt_log_facility_get_os_log(RTLogFacilityVisit);
      if (os_log_type_enabled(v48, OS_LOG_TYPE_DEBUG))
      {
        v76 = NSStringFromSelector(a2);
        *(_DWORD *)buf = 138412290;
        *(void *)&uint8_t buf[4] = v76;
        _os_log_debug_impl(&dword_1D9BFA000, v48, OS_LOG_TYPE_DEBUG, "%@, no more locations to fetch.", buf, 0xCu);
      }
      char v26 = 0;
      int v72 = 6;
    }
    __int16 v119 = v71;
    unint64_t v120 = v70;
LABEL_57:

    _Block_object_dispose(&v156, 8);
    _Block_object_dispose(&v162, 8);
  }
  while (!v72);
  if (v72 != 6)
  {
LABEL_75:
    double v18 = 0;
    goto LABEL_76;
  }
  if (!v25)
  {
    long long v113 = _rt_log_facility_get_os_log(RTLogFacilityVisit);
    if (os_log_type_enabled(v113, OS_LOG_TYPE_INFO))
    {
      long long v114 = NSStringFromSelector(a2);
      long long v115 = [v134 visit];
      *(_DWORD *)buf = 138412546;
      *(void *)&uint8_t buf[4] = v114;
      __int16 v169 = 2112;
      v170 = v115;
      _os_log_impl(&dword_1D9BFA000, v113, OS_LOG_TYPE_INFO, "%@, skip centroid update for visit, %@, due to no GPS location", buf, 0x16u);
    }
    goto LABEL_75;
  }
  double v162 = 0.0;
  double v156 = 0.0;
  [v24 latitude];
  [v24 longitude];
  if (!RTCommonConvertLocalFrameToGeodetic() || (RTCommonIsCoordinateValid(), v77 == 0.0))
  {
    id v96 = _rt_log_facility_get_os_log(RTLogFacilityVisit);
    if (os_log_type_enabled(v96, OS_LOG_TYPE_ERROR))
    {
      v117 = NSStringFromSelector(a2);
      v118 = [v134 visit];
      *(_DWORD *)buf = 138412546;
      *(void *)&uint8_t buf[4] = v117;
      __int16 v169 = 2112;
      v170 = v118;
      _os_log_error_impl(&dword_1D9BFA000, v96, OS_LOG_TYPE_ERROR, "%@, skip centroid update for visit, %@, due to invalid coordinates", buf, 0x16u);
    }
    double v18 = 0;
  }
  else
  {
    id v124 = objc_alloc(MEMORY[0x1E4F5CE00]);
    double v78 = v162;
    double v79 = v156;
    v143 = [v134 visit];
    dispatch_semaphore_t dsemaa = [v143 location];
    [dsemaa horizontalUncertainty];
    double v81 = v80;
    v136 = [v134 visit];
    contexta = [v136 location];
    [contexta altitude];
    double v83 = v82;
    uint64_t v128 = [v134 visit];
    v84 = [v128 location];
    [v84 verticalUncertainty];
    double v86 = v85;
    v87 = [v134 visit];
    v88 = [v87 location];
    uint64_t v89 = [v88 date];
    v90 = [v134 visit];
    v91 = [v90 location];
    uint64_t v92 = [v91 referenceFrame];
    uint64_t v93 = [v134 visit];
    v94 = [v93 location];
    [v94 speed];
    id v96 = [v124 initWithLatitude:v89 longitude:v92 horizontalUncertainty:2 altitude:v78 verticalUncertainty:v79 date:v81 referenceFrame:v83 speed:v86 sourceAccuracy:v95];

    id v129 = objc_alloc(MEMORY[0x1E4F5CFC8]);
    v144 = [v134 visit];
    contextb = [v144 date];
    dispatch_semaphore_t dsemab = [v134 visit];
    uint64_t v125 = [dsemab type];
    v137 = [v134 visit];
    uint64_t v97 = [v137 entry];
    v98 = [v134 visit];
    v99 = [v98 exit];
    v100 = [v134 visit];
    uint64_t v101 = [v100 dataPointCount];
    v102 = [v134 visit];
    [v102 confidence];
    double v104 = v103;
    v105 = [v134 visit];
    v106 = [v105 placeInference];
    v130 = (void *)[v129 initWithDate:contextb type:v125 location:v96 entry:v97 exit:v99 dataPointCount:v101 confidence:v104 placeInference:v106];

    v107 = _rt_log_facility_get_os_log(RTLogFacilityVisit);
    if (os_log_type_enabled(v107, OS_LOG_TYPE_INFO))
    {
      v108 = NSStringFromSelector(a2);
      id v109 = [v134 visit];
      v110 = [v109 location];
      *(_DWORD *)buf = 138412802;
      *(void *)&uint8_t buf[4] = v108;
      __int16 v169 = 2112;
      v170 = v110;
      __int16 v171 = 2112;
      uint64_t v172 = (uint64_t)v96;
      _os_log_impl(&dword_1D9BFA000, v107, OS_LOG_TYPE_INFO, "%@, visit centroid, %@, updated visit centroid, %@", buf, 0x20u);
    }
    v111 = [RTVisitCluster alloc];
    id v112 = [[RTVisitLocationPoints alloc] initWithLocations:v138];
    double v18 = [(RTVisitCluster *)v111 initWithPoints:v112 visit:v130];
  }
LABEL_76:

LABEL_77:
  v19 = v120;
LABEL_78:

  return v18;
}

void __112__RTVisitPipelineModuleVisitCentroidUpdater__updateVisitCentroidBasedOnFilteredLocations_maxHorizontalAccuracy___block_invoke(uint64_t a1, void *a2, id obj)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), obj);
  id v11 = obj;
  id v6 = a2;
  uint64_t v7 = [[_RTMap alloc] initWithInput:v6];

  uint64_t v8 = [(_RTMap *)v7 withBlock:&__block_literal_global];
  uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
  unint64_t v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v8;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

id __112__RTVisitPipelineModuleVisitCentroidUpdater__updateVisitCentroidBasedOnFilteredLocations_maxHorizontalAccuracy___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v2 = (objc_class *)MEMORY[0x1E4F5CE00];
  id v3 = a2;
  id v4 = (void *)[[v2 alloc] initWithCLLocation:v3];

  return v4;
}

- (id)process:(id)a3
{
  uint64_t v68 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = v4;
  if (!self->_binCounts)
  {
    obj = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(obj, OS_LOG_TYPE_ERROR)) {
      goto LABEL_37;
    }
    *(_WORD *)buf = 0;
    v38 = "Invalid parameter not satisfying: _binCounts";
LABEL_42:
    _os_log_error_impl(&dword_1D9BFA000, obj, OS_LOG_TYPE_ERROR, v38, buf, 2u);
    goto LABEL_37;
  }
  if ([v4 count])
  {
    id v6 = objc_opt_new();
    long long v49 = 0u;
    long long v50 = 0u;
    long long v51 = 0u;
    long long v52 = 0u;
    obj = v5;
    uint64_t v46 = [obj countByEnumeratingWithState:&v49 objects:v67 count:16];
    if (!v46) {
      goto LABEL_38;
    }
    uint64_t v40 = v5;
    uint64_t v45 = *(void *)v50;
    v43 = self;
    double v41 = v6;
    while (1)
    {
      for (uint64_t i = 0; i != v46; ++i)
      {
        if (*(void *)v50 != v45) {
          objc_enumerationMutation(obj);
        }
        uint64_t v8 = *(void **)(*((void *)&v49 + 1) + 8 * i);
        uint64_t v9 = _rt_log_facility_get_os_log(RTLogFacilityVisit);
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
        {
          id v37 = NSStringFromSelector(a2);
          *(_DWORD *)buf = 138412546;
          uint64_t v54 = v37;
          __int16 v55 = 2112;
          uint64_t v56 = v8;
          _os_log_debug_impl(&dword_1D9BFA000, v9, OS_LOG_TYPE_DEBUG, "%@, working on cluster, %@", buf, 0x16u);
        }
        uint64_t v10 = [(RTVisitPipelineModuleVisitCentroidUpdater *)self _updateHorizontalUncertainty:v8];
        id v11 = (void *)v10;
        if (v10) {
          uint64_t v12 = (void *)v10;
        }
        else {
          uint64_t v12 = v8;
        }
        uint64_t v13 = -[RTVisitPipelineModuleVisitCentroidUpdater _updateVisitCentroidBasedOnFilteredLocations:maxHorizontalAccuracy:](self, "_updateVisitCentroidBasedOnFilteredLocations:maxHorizontalAccuracy:", v12, 25.0, v40);

        if (v13) {
          double v14 = v13;
        }
        else {
          double v14 = v8;
        }
        double v15 = [(RTVisitPipelineModuleVisitCentroidUpdater *)self _updateVisitCentroidBasedOnMode:v14];

        if (v15)
        {
          double v16 = [(RTVisitPipelineModuleVisitCentroidUpdater *)self distanceCalculator];
          id v17 = [v8 visit];
          double v18 = [v17 location];
          v19 = [v15 visit];
          uint64_t v20 = [v19 location];
          id v48 = 0;
          [v16 distanceFromLocation:v18 toLocation:v20 error:&v48];
          double v22 = v21;
          id v47 = v48;

          double v23 = _rt_log_facility_get_os_log(RTLogFacilityVisit);
          if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
          {
            v24 = NSStringFromSelector(a2);
            unsigned int v25 = [v8 visit];
            char v26 = [v25 location];
            double v27 = [v15 visit];
            uint64_t v28 = [v27 location];
            dispatch_semaphore_t v29 = (void *)v28;
            *(_DWORD *)buf = 138413826;
            uint64_t v30 = @"NO";
            if (v13) {
              uint64_t v30 = @"YES";
            }
            uint64_t v54 = v24;
            __int16 v55 = 2112;
            uint64_t v56 = v26;
            __int16 v57 = 2112;
            uint64_t v58 = v28;
            __int16 v59 = 2048;
            double v60 = v22;
            __int16 v61 = 2112;
            id v62 = v30;
            __int16 v63 = 2112;
            double v64 = @"YES";
            __int16 v65 = 2112;
            id v66 = v47;
            _os_log_impl(&dword_1D9BFA000, v23, OS_LOG_TYPE_INFO, "%@, visit centroid, %@, updated visit centroid, %@, distance, %f, updateBasedOnHighAccurateLocations, %@, updateBasedOnMode, %@, error, %@", buf, 0x48u);

            id v6 = v41;
          }

          self = v43;
          if (!v47 && v22 <= 1000.0)
          {
            double v31 = v15;
            goto LABEL_28;
          }
        }
        double v32 = _rt_log_facility_get_os_log(RTLogFacilityVisit);
        if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
        {
          dispatch_time_t v33 = NSStringFromSelector(a2);
          *(_DWORD *)buf = 138412546;
          uint64_t v54 = v33;
          __int16 v55 = 2112;
          uint64_t v56 = v8;
          _os_log_impl(&dword_1D9BFA000, v32, OS_LOG_TYPE_INFO, "%@, did not update cluster, %@", buf, 0x16u);
        }
        double v15 = 0;
        double v31 = v8;
LABEL_28:
        [v6 addObject:v31];
        double v34 = [v8 visit];
        double v35 = [v34 exit];

        if (v35)
        {
          binCounts = self->_binCounts;
          if (binCounts) {
            bzero(binCounts, 4 * self->_binCountsSize);
          }
        }
      }
      uint64_t v46 = [obj countByEnumeratingWithState:&v49 objects:v67 count:16];
      if (!v46)
      {
        id v5 = v40;
        goto LABEL_38;
      }
    }
  }
  obj = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  if (os_log_type_enabled(obj, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    v38 = "Invalid parameter not satisfying: inClusters.count";
    goto LABEL_42;
  }
LABEL_37:
  id v6 = 0;
LABEL_38:

  return v6;
}

- (RTVisitHyperParameter)hyperParameter
{
  return self->_hyperParameter;
}

- (RTLocationManager)locationManager
{
  return self->_locationManager;
}

- (unsigned)invalidBinIndex
{
  return self->_invalidBinIndex;
}

- (unsigned)binCounts
{
  return self->_binCounts;
}

- (unint64_t)binCountsSize
{
  return self->_binCountsSize;
}

- (RTDistanceCalculator)distanceCalculator
{
  return self->_distanceCalculator;
}

- (void)setDistanceCalculator:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_distanceCalculator, 0);
  objc_storeStrong((id *)&self->_locationManager, 0);

  objc_storeStrong((id *)&self->_hyperParameter, 0);
}

@end