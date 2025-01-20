@interface RTVisitSCIStayCluster
+ (double)evalMaxUncFromMotionDevMotionInducedDev:(double)a3 andMeasInducedDev:(double)a4;
+ (double)evaluateClustThresFromClustThresSlv:(double)result motionInducedDev:(double)a4 adaptionBasis:(double)a5 adaptionSampleCnt:(int64_t)a6 adaptionRate:(double)a7;
+ (double)evaluateMotionInducedDeviationFromMeanLat:(double)a3 meanOfSquaredLat_deg:(double)a4 meanLon_deg:(double)a5 meanOfSquaredLon_deg:(double)a6;
- (NSDate)lastProcessedSample;
- (NSDate)potentialEntry;
- (NSDate)potentialExit;
- (NSMutableArray)outliers;
- (RTLocation)centroid;
- (RTLocation)lastTrustedLocation;
- (RTLocationShifter)locationShifter;
- (RTVisitSCIStayCluster)init;
- (double)dwellTimeIntervalWithDate:(id)a3;
- (double)getRadiusForDate:(id)a3;
- (id)centroidForVisitType:(int64_t)a3 confidence:(double)a4;
- (id)createVisit:(int64_t)a3 confidence:(double)a4;
- (id)description;
- (unint64_t)numOfAdaptionSample;
- (unint64_t)numOfDataPoints;
- (unint64_t)numOfOutliers;
- (unint64_t)numOfResiduePoints;
- (void)addNewPoint:(id)a3 event:(unint64_t)a4 lcFSMState:(unint64_t)a5 fsmState:(unint64_t)a6;
- (void)addOutlier:(id)a3;
- (void)updateLastTrustedLocation:(id)a3;
@end

@implementation RTVisitSCIStayCluster

+ (double)evaluateClustThresFromClustThresSlv:(double)result motionInducedDev:(double)a4 adaptionBasis:(double)a5 adaptionSampleCnt:(int64_t)a6 adaptionRate:(double)a7
{
  double v7 = result;
  if (a7 > 0.0)
  {
    double v8 = fmin(a4, 100.0);
    long double v9 = pow(a5, -(double)a6 / a7);
    return v8 * 1.65 * (1.0 - v9) + v7 * 0.5 * (v9 + 1.0);
  }
  return result;
}

+ (double)evaluateMotionInducedDeviationFromMeanLat:(double)a3 meanOfSquaredLat_deg:(double)a4 meanLon_deg:(double)a5 meanOfSquaredLon_deg:(double)a6
{
  RTCommonCalculateDistance();
  return result;
}

+ (double)evalMaxUncFromMotionDevMotionInducedDev:(double)a3 andMeasInducedDev:(double)a4
{
  double result = a3 + a4;
  if (result > 200.0 || result < 0.0) {
    return 200.0;
  }
  return result;
}

- (RTVisitSCIStayCluster)init
{
  v10.receiver = self;
  v10.super_class = (Class)RTVisitSCIStayCluster;
  v2 = [(RTVisitSCIStayCluster *)&v10 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    locationShifter = v2->_locationShifter;
    v2->_locationShifter = (RTLocationShifter *)v3;

    uint64_t v5 = objc_opt_new();
    outliers = v2->_outliers;
    v2->_outliers = (NSMutableArray *)v5;

    uint64_t v7 = objc_opt_new();
    residuePoints = v2->_residuePoints;
    v2->_residuePoints = (NSMutableArray *)v7;

    v2->_numOfAdaptionSample = 1;
  }
  return v2;
}

- (id)description
{
  uint64_t v3 = (void *)MEMORY[0x1E4F28E78];
  unint64_t v4 = [(RTVisitSCIStayCluster *)self numOfDataPoints];
  unint64_t v5 = [(RTVisitSCIStayCluster *)self numOfResiduePoints];
  unint64_t v6 = [(RTVisitSCIStayCluster *)self numOfOutliers];
  uint64_t v7 = [(RTVisitSCIStayCluster *)self lastTrustedLocation];
  double v8 = [v3 stringWithFormat:@"n_point, %lu, n_residue, %lu, n_outlier, %lu, last_trusted_location, %@", v4, v5, v6, v7];

  if (self->_numOfDataPoints)
  {
    long double v9 = NSString;
    objc_super v10 = [(NSDate *)self->_potentialEntry stringFromDate];
    v11 = [(NSDate *)self->_potentialExit stringFromDate];
    v12 = [v9 stringWithFormat:@", entry, %@, exit, %@, mean, %@, ", v10, v11, self->_centroid];
    [v8 appendString:v12];
  }

  return v8;
}

- (unint64_t)numOfResiduePoints
{
  return [(NSMutableArray *)self->_residuePoints count];
}

- (unint64_t)numOfOutliers
{
  return [(NSMutableArray *)self->_outliers count];
}

- (double)dwellTimeIntervalWithDate:(id)a3
{
  id v4 = a3;
  unint64_t v5 = v4;
  if (!v4)
  {
    double v8 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)objc_super v10 = 0;
      _os_log_error_impl(&dword_1D9BFA000, v8, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: date", v10, 2u);
    }

    goto LABEL_7;
  }
  if (!self->_potentialEntry)
  {
LABEL_7:
    double v7 = 0.0;
    goto LABEL_8;
  }
  [v4 timeIntervalSinceDate:];
  double v7 = v6;
LABEL_8:

  return v7;
}

- (id)centroidForVisitType:(int64_t)a3 confidence:(double)a4
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  double v8 = [(RTLocation *)self->_lastTrustedLocation date];
  [(RTVisitSCIStayCluster *)self dwellTimeIntervalWithDate:v8];
  double v10 = v9;

  if (self->_lastTrustedLocation) {
    BOOL v11 = v10 > 480.0;
  }
  else {
    BOOL v11 = 1;
  }
  if (v11)
  {
    v18 = self->_centroid;
    v19 = @"Weighted Average";
  }
  else
  {
    id v12 = objc_alloc(MEMORY[0x1E4F5CE00]);
    [(RTLocation *)self->_lastTrustedLocation latitude];
    double v14 = v13;
    [(RTLocation *)self->_lastTrustedLocation longitude];
    double v16 = v15;
    [(RTLocation *)self->_lastTrustedLocation horizontalUncertainty];
    v18 = (RTLocation *)[v12 initWithLatitude:0 longitude:-[RTLocation referenceFrame](self->_lastTrustedLocation, "referenceFrame") horizontalUncertainty:v14 date:v16 referenceFrame:v17];
    v19 = @"Last Trusted Location";
  }
  v20 = _rt_log_facility_get_os_log(RTLogFacilityVisit);
  if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
  {
    v21 = NSStringFromSelector(a2);
    v22 = [MEMORY[0x1E4F5CFC8] stringFromVisitIncidentType:a3];
    unint64_t numOfDataPoints = self->_numOfDataPoints;
    centroid = self->_centroid;
    lastTrustedLocation = self->_lastTrustedLocation;
    [(RTLocation *)lastTrustedLocation distanceFromLocation:centroid locationShifter:self->_locationShifter error:0];
    int v28 = 138414338;
    v29 = v21;
    __int16 v30 = 2112;
    v31 = v22;
    __int16 v32 = 2048;
    double v33 = a4;
    __int16 v34 = 2048;
    unint64_t v35 = numOfDataPoints;
    __int16 v36 = 2048;
    double v37 = v10;
    __int16 v38 = 2112;
    v39 = centroid;
    __int16 v40 = 2112;
    v41 = lastTrustedLocation;
    __int16 v42 = 2112;
    v43 = v19;
    __int16 v44 = 2048;
    uint64_t v45 = v26;
    _os_log_impl(&dword_1D9BFA000, v20, OS_LOG_TYPE_INFO, "%@, visitType, %@, confidence, %.2f, dataPointCount, %lu, dwellSinceEntry, %.2f, meanCentroid, %@, lastTrustedLocation, %@, algorithmUsedForCentroid, %@, distance between lastTrustedLocation to meanCentroid, %.2f", (uint8_t *)&v28, 0x5Cu);
  }

  return v18;
}

- (id)createVisit:(int64_t)a3 confidence:(double)a4
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  if (self->_numOfDataPoints) {
    goto LABEL_5;
  }
  double v7 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    v39 = (RTVisitSCIStayCluster *)"-[RTVisitSCIStayCluster createVisit:confidence:]";
    __int16 v40 = 1024;
    LODWORD(v41) = 179;
    _os_log_error_impl(&dword_1D9BFA000, v7, OS_LOG_TYPE_ERROR, "zero points (in %s:%d)", buf, 0x12u);
  }

  if (self->_numOfDataPoints)
  {
LABEL_5:
    double v8 = _rt_log_facility_get_os_log(RTLogFacilityVisit);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      v39 = self;
      _os_log_debug_impl(&dword_1D9BFA000, v8, OS_LOG_TYPE_DEBUG, "working hypothesis, %@", buf, 0xCu);
    }

    if (a3 == 3) {
      potentialExit = self->_potentialExit;
    }
    else {
      potentialExit = 0;
    }
    double v10 = potentialExit;
    id v11 = objc_alloc(MEMORY[0x1E4F5CFC8]);
    id v12 = [MEMORY[0x1E4F1C9C8] date];
    double v13 = [(RTVisitSCIStayCluster *)self centroidForVisitType:a3 confidence:a4];
    double v14 = (void *)[v11 initWithDate:v12 type:a3 location:v13 entry:self->_potentialEntry exit:v10 dataPointCount:self->_numOfDataPoints confidence:a4 placeInference:0];

    if ([(NSMutableArray *)self->_residuePoints count])
    {
      double v15 = [[RTVisitLocationPoints alloc] initWithLocations:self->_residuePoints];
      double v16 = (NSMutableArray *)objc_opt_new();
      residuePoints = self->_residuePoints;
      self->_residuePoints = v16;
    }
    else
    {
      double v15 = 0;
    }
    uint64_t v18 = [v14 exit];
    unint64_t v19 = v18 | (unint64_t)v15;

    if (!v19)
    {
      v20 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v39 = (RTVisitSCIStayCluster *)"-[RTVisitSCIStayCluster createVisit:confidence:]";
        __int16 v40 = 1024;
        LODWORD(v41) = 198;
        _os_log_error_impl(&dword_1D9BFA000, v20, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: visit.exit || points (in %s:%d)", buf, 0x12u);
      }
    }
    uint64_t v21 = [v14 exit];
    v22 = (RTVisitCluster *)(v21 | (unint64_t)v15);

    if (!v22) {
      goto LABEL_30;
    }
    v22 = [[RTVisitCluster alloc] initWithPoints:v15 visit:v14];
    v23 = [(RTVisitCluster *)v22 visit];
    v24 = [v23 entry];
    char v25 = [v24 isEqualToDate:self->_potentialEntry];

    if ((v25 & 1) == 0)
    {
      uint64_t v26 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      {
        unint64_t v35 = [v14 entry];
        __int16 v36 = self->_potentialExit;
        *(_DWORD *)buf = 138413058;
        v39 = v35;
        __int16 v40 = 2112;
        v41 = (const char *)v36;
        __int16 v42 = 2080;
        v43 = "-[RTVisitSCIStayCluster createVisit:confidence:]";
        __int16 v44 = 1024;
        int v45 = 204;
        _os_log_error_impl(&dword_1D9BFA000, v26, OS_LOG_TYPE_ERROR, "visit.entry, %@, not equal to _potentialEntry, %@ (in %s:%d)", buf, 0x26u);
      }
    }
    v27 = [(RTVisitCluster *)v22 visit];
    int v28 = [v27 exit];
    v29 = v28;
    if (a3 == 3)
    {
      char v30 = [v28 isEqualToDate:self->_potentialExit];

      if ((v30 & 1) == 0)
      {
        v31 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
        if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
        {
          __int16 v32 = [v14 exit];
          double v33 = self->_potentialExit;
          *(_DWORD *)buf = 138413058;
          v39 = v32;
          __int16 v40 = 2112;
          v41 = (const char *)v33;
          __int16 v42 = 2080;
          v43 = "-[RTVisitSCIStayCluster createVisit:confidence:]";
          __int16 v44 = 1024;
          int v45 = 207;
          _os_log_error_impl(&dword_1D9BFA000, v31, OS_LOG_TYPE_ERROR, "exit visit with visit.exit, %@, not equal to _potentialExit, %@ (in %s:%d)", buf, 0x26u);
        }
LABEL_29:
      }
    }
    else
    {

      if (v29)
      {
        v31 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
        if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
        {
          double v37 = [(RTVisitCluster *)v22 visit];
          *(_DWORD *)buf = 138412802;
          v39 = v37;
          __int16 v40 = 2080;
          v41 = "-[RTVisitSCIStayCluster createVisit:confidence:]";
          __int16 v42 = 1024;
          LODWORD(v43) = 209;
          _os_log_error_impl(&dword_1D9BFA000, v31, OS_LOG_TYPE_ERROR, "entry visit has valid exit, %@ (in %s:%d)", buf, 0x1Cu);
        }
        goto LABEL_29;
      }
    }
LABEL_30:

    goto LABEL_31;
  }
  v22 = 0;
LABEL_31:

  return v22;
}

- (void)addNewPoint:(id)a3 event:(unint64_t)a4 lcFSMState:(unint64_t)a5 fsmState:(unint64_t)a6
{
  uint64_t v62 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  if (self->_numOfDataPoints != -1) {
    goto LABEL_5;
  }
  id v11 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    int v52 = 136315394;
    v53 = "-[RTVisitSCIStayCluster addNewPoint:event:lcFSMState:fsmState:]";
    __int16 v54 = 1024;
    LODWORD(v55) = 219;
    _os_log_error_impl(&dword_1D9BFA000, v11, OS_LOG_TYPE_ERROR, "_numOfDataPoints hit max value? (in %s:%d)", (uint8_t *)&v52, 0x12u);
  }

  if (self->_numOfDataPoints != -1)
  {
LABEL_5:
    if (v10)
    {
      if ([(NSMutableArray *)self->_outliers count])
      {
        [(NSMutableArray *)self->_residuePoints addObjectsFromArray:self->_outliers];
        id v12 = (NSMutableArray *)objc_opt_new();
        outliers = self->_outliers;
        self->_outliers = v12;
      }
      double v14 = [v10 date];
      lastProcessedSample = self->_lastProcessedSample;
      self->_lastProcessedSample = v14;

      if (self->_numOfDataPoints)
      {
        [(RTLocation *)self->_centroid latitude];
        double v17 = v16;
      }
      else
      {
        if (self->_potentialEntry)
        {
          unint64_t v19 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
          if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
          {
            potentialEntry = self->_potentialEntry;
            int v52 = 138412802;
            v53 = (const char *)potentialEntry;
            __int16 v54 = 2080;
            v55 = "-[RTVisitSCIStayCluster addNewPoint:event:lcFSMState:fsmState:]";
            __int16 v56 = 1024;
            LODWORD(v57) = 235;
            _os_log_error_impl(&dword_1D9BFA000, v19, OS_LOG_TYPE_ERROR, "when n_point = 0, _potentialEntry, %@ (in %s:%d)", (uint8_t *)&v52, 0x1Cu);
          }
        }
        if (self->_potentialExit)
        {
          v20 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
          if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
          {
            potentialExit = self->_potentialExit;
            int v52 = 138412802;
            v53 = (const char *)potentialExit;
            __int16 v54 = 2080;
            v55 = "-[RTVisitSCIStayCluster addNewPoint:event:lcFSMState:fsmState:]";
            __int16 v56 = 1024;
            LODWORD(v57) = 236;
            _os_log_error_impl(&dword_1D9BFA000, v20, OS_LOG_TYPE_ERROR, "when n_point = 0, _potentialExit, %@ (in %s:%d)", (uint8_t *)&v52, 0x1Cu);
          }
        }
        objc_storeStrong((id *)&self->_potentialEntry, self->_lastProcessedSample);
        double v17 = 0.0;
      }
      objc_storeStrong((id *)&self->_potentialExit, self->_lastProcessedSample);
      residuePoints = self->_residuePoints;
      ++self->_numOfDataPoints;
      [(NSMutableArray *)residuePoints addObject:v10];
      uint64_t v22 = [(NSMutableArray *)self->_residuePoints count] - 5000;
      if (v22 >= 0 && !(v22 % 0x64uLL))
      {
        v23 = _rt_log_facility_get_os_log(RTLogFacilityVisit);
        if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT))
        {
          int v52 = 134218752;
          v53 = (const char *)v22;
          __int16 v54 = 2048;
          v55 = (const char *)a4;
          __int16 v56 = 2048;
          unint64_t v57 = a6;
          __int16 v58 = 2048;
          v59 = (const char *)a5;
          _os_log_fault_impl(&dword_1D9BFA000, v23, OS_LOG_TYPE_FAULT, "Exceeded allowable cached locations count by %ld in SCI, event: %lu, fsmState: %lu, lcFSMState: %lu", (uint8_t *)&v52, 0x2Au);
        }
      }
      [v10 latitude];
      double v25 = v24 - v17;
      double numOfDataPoints = (double)self->_numOfDataPoints;
      double meanOfSquaredLat_deg = self->_meanOfSquaredLat_deg;
      [v10 latitude];
      double meanOfSquaredLon_deg = self->_meanOfSquaredLon_deg;
      self->_double meanOfSquaredLat_deg = meanOfSquaredLat_deg
                                  + (v28 * v28 - self->_meanOfSquaredLat_deg) / (double)self->_numOfDataPoints;
      [v10 longitude];
      self->_double meanOfSquaredLon_deg = meanOfSquaredLon_deg
                                  + (v30 * v30 - self->_meanOfSquaredLon_deg) / (double)self->_numOfDataPoints;
      [v10 longitude];
      double v32 = v31 * 3.14159265 / 180.0;
      v63.c[0] = v32 * 0.0;
      v63.c[1] = v32 + 0.0;
      double v33 = v25 / numOfDataPoints;
      __complex_double v34 = cexp(v63);
      v64.c[0] = *(double *)self->_sumOfVectorLon + v34.c[0];
      v64.c[1] = v34.c[1] + *(double *)&self->_sumOfVectorLon[8];
      *(__complex_double *)self->_sumOfVectorLon = v64;
      double v35 = carg(v64) * 180.0 / 3.14159265;
      if (v35 < -180.0)
      {
        __int16 v36 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
        if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
        {
          int v52 = 134218498;
          v53 = *(const char **)&v35;
          __int16 v54 = 2080;
          v55 = "-[RTVisitSCIStayCluster addNewPoint:event:lcFSMState:fsmState:]";
          __int16 v56 = 1024;
          LODWORD(v57) = 260;
          _os_log_error_impl(&dword_1D9BFA000, v36, OS_LOG_TYPE_ERROR, "mean longitude is out of range, >=max, lon_deg, %.7f (in %s:%d)", (uint8_t *)&v52, 0x1Cu);
        }
      }
      double v37 = v17 + v33;
      if (v35 > 180.0)
      {
        __int16 v38 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
        if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
        {
          int v52 = 134218498;
          v53 = *(const char **)&v35;
          __int16 v54 = 2080;
          v55 = "-[RTVisitSCIStayCluster addNewPoint:event:lcFSMState:fsmState:]";
          __int16 v56 = 1024;
          LODWORD(v57) = 261;
          _os_log_error_impl(&dword_1D9BFA000, v38, OS_LOG_TYPE_ERROR, "mean longitude is out of range, <=min, lon_deg, %.7f (in %s:%d)", (uint8_t *)&v52, 0x1Cu);
        }
      }
      +[RTVisitSCIStayCluster evaluateMotionInducedDeviationFromMeanLat:v37 meanOfSquaredLat_deg:self->_meanOfSquaredLat_deg meanLon_deg:v35 meanOfSquaredLon_deg:self->_meanOfSquaredLon_deg];
      self->_motionInducedDev_m = fmin(v39, 100.0);
      +[RTVisitSCIStayCluster evalMaxUncFromMotionDevMotionInducedDev:andMeasInducedDev:](RTVisitSCIStayCluster, "evalMaxUncFromMotionDevMotionInducedDev:andMeasInducedDev:", 200.0 / sqrt((double)self->_numOfDataPoints));
      v41 = (RTLocation *)[objc_alloc(MEMORY[0x1E4F5CE00]) initWithLatitude:0 longitude:objc_msgSend(v10, "referenceFrame") horizontalUncertainty:v37 date:v35 referenceFrame:v40];
      centroid = self->_centroid;
      self->_centroid = v41;

      if (self->_numOfDataPoints == 1) {
        objc_storeStrong((id *)&self->_lastProcessedSampleDateForAdaption, self->_lastProcessedSample);
      }
      [v10 latitude];
      [v10 longitude];
      [(RTLocation *)self->_centroid latitude];
      [(RTLocation *)self->_centroid longitude];
      RTCommonCalculateDistance();
      double v44 = v43;
      +[RTVisitSCIStayCluster evaluateClustThresFromClustThresSlv:self->_numOfAdaptionSample motionInducedDev:200.0 adaptionBasis:self->_motionInducedDev_m adaptionSampleCnt:1.4 adaptionRate:10.0];
      if (v44 >= v45)
      {
        uint64_t v46 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
        if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
        {
          v47 = *(const char **)self->_sumOfVectorLon;
          v48 = *(const char **)&self->_sumOfVectorLon[8];
          v49 = self->_centroid;
          int v52 = 134219010;
          v53 = v47;
          __int16 v54 = 2048;
          v55 = v48;
          __int16 v56 = 2112;
          unint64_t v57 = (unint64_t)v49;
          __int16 v58 = 2080;
          v59 = "-[RTVisitSCIStayCluster addNewPoint:event:lcFSMState:fsmState:]";
          __int16 v60 = 1024;
          int v61 = 281;
          _os_log_error_impl(&dword_1D9BFA000, v46, OS_LOG_TYPE_ERROR, "centroid computation is incorrect sum vector is, %f + %fi, centroid, %@ (in %s:%d)", (uint8_t *)&v52, 0x30u);
        }
      }
      [(RTVisitSCIStayCluster *)self updateLastTrustedLocation:v10];
    }
    else
    {
      uint64_t v18 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        int v52 = 136315394;
        v53 = "-[RTVisitSCIStayCluster addNewPoint:event:lcFSMState:fsmState:]";
        __int16 v54 = 1024;
        LODWORD(v55) = 223;
        _os_log_error_impl(&dword_1D9BFA000, v18, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: point (in %s:%d)", (uint8_t *)&v52, 0x12u);
      }
    }
  }
}

- (void)updateLastTrustedLocation:(id)a3
{
  id v5 = a3;
  if (v5)
  {
    id v7 = v5;
    [v5 horizontalUncertainty];
    id v5 = v7;
    if (v6 <= 250.0)
    {
      objc_storeStrong((id *)&self->_lastTrustedLocation, a3);
      id v5 = v7;
    }
  }
}

- (void)addOutlier:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    double v6 = [v4 date];
    lastProcessedSample = self->_lastProcessedSample;
    self->_lastProcessedSample = v6;

    [(NSMutableArray *)self->_outliers addObject:v5];
  }
  else
  {
    double v8 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      int v9 = 136315394;
      id v10 = "-[RTVisitSCIStayCluster addOutlier:]";
      __int16 v11 = 1024;
      int v12 = 294;
      _os_log_error_impl(&dword_1D9BFA000, v8, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: point (in %s:%d)", (uint8_t *)&v9, 0x12u);
    }
  }
}

- (double)getRadiusForDate:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  double v6 = v5;
  if (v5)
  {
    [v5 timeIntervalSinceDate:self->_lastProcessedSampleDateForAdaption];
    if (v7 > 600.0)
    {
      ++self->_numOfAdaptionSample;
      objc_storeStrong((id *)&self->_lastProcessedSampleDateForAdaption, a3);
    }
    +[RTVisitSCIStayCluster evaluateClustThresFromClustThresSlv:self->_numOfAdaptionSample motionInducedDev:200.0 adaptionBasis:self->_motionInducedDev_m adaptionSampleCnt:1.4 adaptionRate:10.0];
    double v9 = v8;
  }
  else
  {
    id v10 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      int v12 = 136315394;
      uint64_t v13 = "-[RTVisitSCIStayCluster getRadiusForDate:]";
      __int16 v14 = 1024;
      int v15 = 304;
      _os_log_error_impl(&dword_1D9BFA000, v10, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: date (in %s:%d)", (uint8_t *)&v12, 0x12u);
    }

    double v9 = 200.0;
  }

  return v9;
}

- (unint64_t)numOfDataPoints
{
  return self->_numOfDataPoints;
}

- (unint64_t)numOfAdaptionSample
{
  return self->_numOfAdaptionSample;
}

- (NSDate)potentialEntry
{
  return self->_potentialEntry;
}

- (NSDate)potentialExit
{
  return self->_potentialExit;
}

- (NSDate)lastProcessedSample
{
  return self->_lastProcessedSample;
}

- (NSMutableArray)outliers
{
  return self->_outliers;
}

- (RTLocation)centroid
{
  return self->_centroid;
}

- (RTLocation)lastTrustedLocation
{
  return self->_lastTrustedLocation;
}

- (RTLocationShifter)locationShifter
{
  return self->_locationShifter;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_locationShifter, 0);
  objc_storeStrong((id *)&self->_lastTrustedLocation, 0);
  objc_storeStrong((id *)&self->_centroid, 0);
  objc_storeStrong((id *)&self->_outliers, 0);
  objc_storeStrong((id *)&self->_lastProcessedSample, 0);
  objc_storeStrong((id *)&self->_potentialExit, 0);
  objc_storeStrong((id *)&self->_potentialEntry, 0);
  objc_storeStrong((id *)&self->_residuePoints, 0);

  objc_storeStrong((id *)&self->_lastProcessedSampleDateForAdaption, 0);
}

@end