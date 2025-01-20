@interface RTVisitPipelineModuleTrajectorySequenceCluster
+ (double)normalizeFeature:(double)a3 min:(double)a4 max:(double)a5;
- (BOOL)computeFeatureVector:(float *)a3 cumSumNumLocations:(unint64_t)a4 cumSumNorthings:(double *)a5 cumSumEastings:(double *)a6 cumSumSquaredNorthings:(double *)a7 cumSumSquaredEastings:(double *)a8 sequenceLength:(unint64_t)a9;
- (NSArray)residualLocations;
- (RTVisitCluster)workingVisitCluster;
- (RTVisitDecoder)decoder;
- (RTVisitHyperParameter)hyperParameter;
- (RTVisitModelController)trajectorySequenceClassifier;
- (RTVisitPipelineModuleTrajectorySequenceCluster)init;
- (RTVisitPipelineModuleTrajectorySequenceCluster)initWithVisitTrajectorySequenceClassifier:(id)a3 hyperParameter:(id)a4;
- (double)computeRadiusFromCumSumNorthings:(const double *)a3 cumSumEastings:(const double *)a4 cumSumSquaredNorthings:(const double *)a5 cumSumSuaredEastings:(const double *)a6 firstLocationIndex:(unint64_t)a7 lastLocationIndex:(unint64_t)a8;
- (float)computeFeatureVectorFromLocalFramesNumOfLocations:(unint64_t)a3 northings:(const double *)a4 eastings:(const double *)a5 sequenceLength:(unint64_t)a6;
- (float)computeFeatureVectorFromLocations:(id)a3 start:(unint64_t)a4 end:(unint64_t)a5;
- (id)createVisitWithLocations:(id)a3 entryDate:(id)a4 exitDate:(id)a5;
- (id)performBatchInferenceWithFeatureVector:(const float *)a3 featureVectorLength:(unint64_t)a4 start:(unint64_t)a5 firstTimeStepDate:(id)a6;
- (id)process:(id)a3;
- (unint64_t)numLocationsFrom:(unint64_t)a3;
- (unint64_t)numOfLocations;
- (unint64_t)sequenceIndexFromDate:(id)a3 firstTimeStepDate:(id)a4;
- (unint64_t)sequenceLengthFrom:(unint64_t)a3;
- (unint64_t)startLocationIndex:(unint64_t)a3;
- (void)clearWorkingVisitCluster;
@end

@implementation RTVisitPipelineModuleTrajectorySequenceCluster

+ (double)normalizeFeature:(double)a3 min:(double)a4 max:(double)a5
{
  if (a3 < a4) {
    a3 = a4;
  }
  if (a3 >= a5) {
    a3 = a5;
  }
  return -(a4 + a5 - a3 * 2.0) / (a5 - a4);
}

- (RTVisitPipelineModuleTrajectorySequenceCluster)init
{
  uint64_t v2 = objc_opt_class();
  _RTRequireInitializer(v2, sel_initWithVisitTrajectorySequenceClassifier_hyperParameter_);
}

- (RTVisitPipelineModuleTrajectorySequenceCluster)initWithVisitTrajectorySequenceClassifier:(id)a3 hyperParameter:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v9 = v8;
  if (!v7)
  {
    v15 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
LABEL_9:

      v14 = 0;
      goto LABEL_10;
    }
    *(_WORD *)buf = 0;
    v16 = "Invalid parameter not satisfying: trajectorySequenceClassifier";
LABEL_12:
    _os_log_error_impl(&dword_1D9BFA000, v15, OS_LOG_TYPE_ERROR, v16, buf, 2u);
    goto LABEL_9;
  }
  if (!v8)
  {
    v15 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      goto LABEL_9;
    }
    *(_WORD *)buf = 0;
    v16 = "Invalid parameter not satisfying: hyperParameter";
    goto LABEL_12;
  }
  v18.receiver = self;
  v18.super_class = (Class)RTVisitPipelineModuleTrajectorySequenceCluster;
  v10 = [(RTVisitPipelineModuleTrajectorySequenceCluster *)&v18 init];
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_trajectorySequenceClassifier, a3);
    objc_storeStrong((id *)&v11->_hyperParameter, a4);
    v12 = [[RTVisitDecoder alloc] initWithHyperParameter:v9];
    decoder = v11->_decoder;
    v11->_decoder = v12;
  }
  self = v11;
  v14 = self;
LABEL_10:

  return v14;
}

- (unint64_t)numLocationsFrom:(unint64_t)a3
{
  if (!a3) {
    return 0;
  }
  unint64_t v4 = a3 - 1;
  unint64_t v5 = [(RTVisitHyperParameter *)self->_hyperParameter stride];
  unint64_t v6 = [(RTVisitHyperParameter *)self->_hyperParameter referenceSize] + v5 * v4;
  return v6 + [(RTVisitHyperParameter *)self->_hyperParameter windowSize];
}

- (unint64_t)sequenceLengthFrom:(unint64_t)a3
{
  unint64_t v5 = [(RTVisitHyperParameter *)self->_hyperParameter windowSize];
  unint64_t v6 = [(RTVisitHyperParameter *)self->_hyperParameter referenceSize] + v5;
  BOOL v7 = a3 >= v6;
  unint64_t v8 = a3 - v6;
  if (v7) {
    return v8 / [(RTVisitHyperParameter *)self->_hyperParameter stride] + 1;
  }
  else {
    return 0;
  }
}

- (unint64_t)startLocationIndex:(unint64_t)a3
{
  unint64_t v5 = [(RTVisitHyperParameter *)self->_hyperParameter referenceSize];
  return v5 + [(RTVisitHyperParameter *)self->_hyperParameter stride] * a3;
}

- (unint64_t)sequenceIndexFromDate:(id)a3 firstTimeStepDate:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  unint64_t v8 = v7;
  if (!v7)
  {
    v11 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
LABEL_7:

      unint64_t v10 = 0;
      goto LABEL_8;
    }
    __int16 v16 = 0;
    v12 = "Invalid parameter not satisfying: firstTimeStepDate";
    v13 = (uint8_t *)&v16;
LABEL_10:
    _os_log_error_impl(&dword_1D9BFA000, v11, OS_LOG_TYPE_ERROR, v12, v13, 2u);
    goto LABEL_7;
  }
  if (([v7 isOnOrBefore:v6] & 1) == 0)
  {
    v11 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      goto LABEL_7;
    }
    __int16 v15 = 0;
    v12 = "Invalid parameter not satisfying: [firstTimeStepDate isOnOrBefore:date]";
    v13 = (uint8_t *)&v15;
    goto LABEL_10;
  }
  [v6 timeIntervalSinceDate:v8];
  unint64_t v10 = (unint64_t)(v9 / (double)[(RTVisitHyperParameter *)self->_hyperParameter windowInterval]);
LABEL_8:

  return v10;
}

- (double)computeRadiusFromCumSumNorthings:(const double *)a3 cumSumEastings:(const double *)a4 cumSumSquaredNorthings:(const double *)a5 cumSumSuaredEastings:(const double *)a6 firstLocationIndex:(unint64_t)a7 lastLocationIndex:(unint64_t)a8
{
  if (a8 <= a7)
  {
    v11 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v12 = 0;
      _os_log_error_impl(&dword_1D9BFA000, v11, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: firstLocationIndex < lastLocationIndex", v12, 2u);
    }

    return 0.0;
  }
  else
  {
    double v9 = a3[a8] - a3[a7];
    unint64_t v8 = a8 - a7;
    return sqrt(vabdd_f64((a5[a8] - a5[a7] + a6[a8] - a6[a7]) / (double)v8, (v9 * v9 + (a4[a8] - a4[a7]) * (a4[a8] - a4[a7])) / ((double)v8 * (double)v8)));
  }
}

- (float)computeFeatureVectorFromLocalFramesNumOfLocations:(unint64_t)a3 northings:(const double *)a4 eastings:(const double *)a5 sequenceLength:(unint64_t)a6
{
  if (a6)
  {
    unint64_t v9 = a3;
    unint64_t v11 = a3 + 1;
    size_t v12 = 8 * (a3 + 1);
    v13 = (double *)malloc_type_malloc(v12, 0x100004000313F17uLL);
    v14 = (double *)malloc_type_malloc(v12, 0x100004000313F17uLL);
    __int16 v15 = (double *)malloc_type_malloc(v12, 0x100004000313F17uLL);
    __int16 v16 = (double *)malloc_type_malloc(v12, 0x100004000313F17uLL);
    v17 = v16;
    if (v13 && v14 && v15 && v16)
    {
      unint64_t v35 = v11;
      objc_super v18 = malloc_type_malloc(4 * a6 * [(RTVisitHyperParameter *)self->_hyperParameter featureDimension], 0x100004052888210uLL);
      if (!v18)
      {
        v34 = _rt_log_facility_get_os_log(RTLogFacilityVisit);
        if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)v36 = 0;
          _os_log_error_impl(&dword_1D9BFA000, v34, OS_LOG_TYPE_ERROR, "fail to allocate feature vector", v36, 2u);
        }

        goto LABEL_28;
      }
      v19 = v18;
      double *v13 = 0.0;
      double *v14 = 0.0;
      double *v15 = 0.0;
      double *v17 = 0.0;
      if (v9)
      {
        v20 = v17 + 1;
        v21 = v15 + 1;
        v22 = v14 + 1;
        v23 = v13 + 1;
        double v24 = 0.0;
        double v25 = 0.0;
        double v26 = 0.0;
        double v27 = 0.0;
        do
        {
          double v28 = *a4++;
          double v29 = v28;
          double v27 = v27 + v28;
          double v30 = *a5++;
          double v26 = v26 + v30;
          double v25 = v25 + v29 * v29;
          *v23++ = v27;
          *v22++ = v26;
          double v24 = v24 + v30 * v30;
          *v21++ = v25;
          *v20++ = v24;
          --v9;
        }
        while (v9);
      }
      if (![(RTVisitPipelineModuleTrajectorySequenceCluster *)self computeFeatureVector:v18 cumSumNumLocations:v35 cumSumNorthings:v13 cumSumEastings:v14 cumSumSquaredNorthings:v15 cumSumSquaredEastings:v17 sequenceLength:a6])
      {
        free(v19);
LABEL_28:
        v19 = 0;
      }
    }
    else
    {
      v32 = _rt_log_facility_get_os_log(RTLogFacilityVisit);
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v37 = 0;
        _os_log_error_impl(&dword_1D9BFA000, v32, OS_LOG_TYPE_ERROR, "fail to allocate cumsum arrays", v37, 2u);
      }

      v19 = 0;
      if (!v13)
      {
        if (!v14)
        {
LABEL_20:
          if (v15) {
            free(v15);
          }
          if (v17) {
            free(v17);
          }
          return (float *)v19;
        }
LABEL_19:
        free(v14);
        goto LABEL_20;
      }
    }
    free(v13);
    if (!v14) {
      goto LABEL_20;
    }
    goto LABEL_19;
  }
  v31 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_1D9BFA000, v31, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: 0<sequenceLength", buf, 2u);
  }

  return 0;
}

- (BOOL)computeFeatureVector:(float *)a3 cumSumNumLocations:(unint64_t)a4 cumSumNorthings:(double *)a5 cumSumEastings:(double *)a6 cumSumSquaredNorthings:(double *)a7 cumSumSquaredEastings:(double *)a8 sequenceLength:(unint64_t)a9
{
  if (!a3)
  {
    v13 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v14 = "Invalid parameter not satisfying: featureVector";
      goto LABEL_19;
    }
LABEL_20:
    BOOL v15 = 0;
    goto LABEL_21;
  }
  if (!a5)
  {
    v13 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v14 = "Invalid parameter not satisfying: cumSumNorthings";
      goto LABEL_19;
    }
    goto LABEL_20;
  }
  unint64_t v10 = a6;
  if (!a6)
  {
    v13 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v14 = "Invalid parameter not satisfying: cumSumEastings";
      goto LABEL_19;
    }
    goto LABEL_20;
  }
  unint64_t v11 = a7;
  if (!a7)
  {
    v13 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v14 = "Invalid parameter not satisfying: cumSumSquaredNorthings";
      goto LABEL_19;
    }
    goto LABEL_20;
  }
  if (!a8)
  {
    v13 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v14 = "Invalid parameter not satisfying: cumSumSquaredEastings";
      goto LABEL_19;
    }
    goto LABEL_20;
  }
  if (a4 <= 1)
  {
    v13 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v14 = "Invalid parameter not satisfying: 1<cumSumNumLocations";
LABEL_19:
      _os_log_error_impl(&dword_1D9BFA000, v13, OS_LOG_TYPE_ERROR, v14, buf, 2u);
      goto LABEL_20;
    }
    goto LABEL_20;
  }
  objc_super v18 = a3;
  [(RTVisitHyperParameter *)self->_hyperParameter featureDwellnessLogMin];
  double v82 = exp(v20);
  [(RTVisitHyperParameter *)self->_hyperParameter featureDwellnessLogMax];
  double v22 = exp(-v21);
  unint64_t v23 = [(RTVisitHyperParameter *)self->_hyperParameter referenceSize];
  unint64_t v24 = [(RTVisitHyperParameter *)self->_hyperParameter stride];
  if (!a9) {
    return 1;
  }
  BOOL v15 = 0;
  unint64_t v25 = 0;
  unint64_t v83 = v23 / v24;
  v91 = v10;
  v92 = v11;
  v80 = v18;
  while (1)
  {
    if ([(RTVisitHyperParameter *)self->_hyperParameter numOfTimeStepForDistance] <= v25) {
      unint64_t v26 = [(RTVisitPipelineModuleTrajectorySequenceCluster *)self startLocationIndex:v25 - [(RTVisitHyperParameter *)self->_hyperParameter numOfTimeStepForDistance]];
    }
    else {
      unint64_t v26 = 0;
    }
    unint64_t v27 = [(RTVisitHyperParameter *)self->_hyperParameter windowSize] + v26;
    double v28 = a5[v27];
    double v29 = a5[v26];
    unint64_t v89 = [(RTVisitHyperParameter *)self->_hyperParameter windowSize];
    double v90 = v10[v27];
    double v88 = v10[v26];
    unint64_t v87 = [(RTVisitHyperParameter *)self->_hyperParameter windowSize];
    unint64_t v30 = [(RTVisitPipelineModuleTrajectorySequenceCluster *)self startLocationIndex:v25];
    unint64_t v31 = [(RTVisitHyperParameter *)self->_hyperParameter windowSize] + v30;
    double v32 = a5[v31];
    double v33 = a5[v30];
    unint64_t v86 = [(RTVisitHyperParameter *)self->_hyperParameter windowSize];
    double v34 = v10[v31];
    double v85 = v10[v30];
    unint64_t v84 = [(RTVisitHyperParameter *)self->_hyperParameter windowSize];
    double v35 = 0.0;
    v36 = a8;
    if (v25 + v83 < [(RTVisitHyperParameter *)self->_hyperParameter numOfTimeStepForDwellness])goto LABEL_40; {
    unint64_t v37 = [(RTVisitPipelineModuleTrajectorySequenceCluster *)self startLocationIndex:v25];
    }
    unint64_t v38 = [(RTVisitHyperParameter *)self->_hyperParameter numOfTimeStepForDwellness];
    if (v37 < [(RTVisitHyperParameter *)self->_hyperParameter stride] * v38) {
      break;
    }
    unint64_t v39 = [(RTVisitHyperParameter *)self->_hyperParameter numOfTimeStepForDwellness];
    unint64_t v40 = [(RTVisitHyperParameter *)self->_hyperParameter stride];
    if ([(RTVisitHyperParameter *)self->_hyperParameter windowSize])
    {
      uint64_t v41 = 0;
      unint64_t v42 = v37 - v40 * v39;
      unint64_t v43 = v37 + 1;
      unint64_t v44 = v37 + 1;
      unint64_t v79 = v25;
      double v77 = v29;
      double v78 = v28;
      unint64_t v75 = v37 + 1;
      unint64_t v76 = v42;
LABEL_32:
      uint64_t v45 = 0;
      unint64_t v46 = 0;
      unint64_t v47 = v42 + v41;
      uint64_t v81 = v41;
      unint64_t v48 = v43 + v41;
      float v49 = 0.0;
      while (1)
      {
        if (v44 == v46)
        {
          v13 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
          if (!os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
            goto LABEL_21;
          }
          *(_WORD *)buf = 0;
          v74 = "Invalid parameter not satisfying: 0<locationInterval";
          goto LABEL_50;
        }
        if (v48 >= a4) {
          break;
        }
        [(RTVisitPipelineModuleTrajectorySequenceCluster *)self computeRadiusFromCumSumNorthings:a5 cumSumEastings:v91 cumSumSquaredNorthings:v92 cumSumSuaredEastings:a8 firstLocationIndex:v46 lastLocationIndex:v48];
        float v51 = v50;
        double v52 = (double)(v44 + v45)
            / (v22 / (double)(v44 + v45)
             + (float)(v51 * (float)[(RTVisitHyperParameter *)self->_hyperParameter stride]));
        if (v52 > v49) {
          float v49 = v52;
        }
        ++v46;
        --v45;
        if (v46 > v47)
        {
          double v35 = v35 + v49;
          ++v41;
          unint64_t v53 = [(RTVisitHyperParameter *)self->_hyperParameter windowSize];
          ++v44;
          v36 = a8;
          unint64_t v25 = v79;
          double v29 = v77;
          double v28 = v78;
          unint64_t v43 = v75;
          unint64_t v42 = v76;
          if (v81 + 1 < v53) {
            goto LABEL_32;
          }
          goto LABEL_39;
        }
      }
      v13 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      if (!os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        goto LABEL_21;
      }
      *(_WORD *)buf = 0;
      v74 = "Invalid parameter not satisfying: lastLocationIndex<cumSumNumLocations";
      goto LABEL_50;
    }
LABEL_39:
    double v35 = v35 / (double)[(RTVisitHyperParameter *)self->_hyperParameter windowSize];
    unint64_t v10 = v91;
    unint64_t v11 = v92;
    objc_super v18 = v80;
LABEL_40:
    if ([(RTVisitHyperParameter *)self->_hyperParameter numOfTimeStepForRadius] <= v25) {
      unint64_t v54 = [(RTVisitPipelineModuleTrajectorySequenceCluster *)self startLocationIndex:v25 - [(RTVisitHyperParameter *)self->_hyperParameter numOfTimeStepForRadius]];
    }
    else {
      unint64_t v54 = 0;
    }
    double v55 = sqrt(((v32 - v33) / (double)v86 - (v28 - v29) / (double)v89)* ((v32 - v33) / (double)v86 - (v28 - v29) / (double)v89)+ ((v34 - v85) / (double)v84 - (v90 - v88) / (double)v87)* ((v34 - v85) / (double)v84 - (v90 - v88) / (double)v87));
    [(RTVisitPipelineModuleTrajectorySequenceCluster *)self computeRadiusFromCumSumNorthings:a5 cumSumEastings:v10 cumSumSquaredNorthings:v11 cumSumSuaredEastings:v36 firstLocationIndex:v54 lastLocationIndex:[(RTVisitPipelineModuleTrajectorySequenceCluster *)self startLocationIndex:v25]];
    double v57 = v56;
    v58 = objc_opt_class();
    [(RTVisitHyperParameter *)self->_hyperParameter featureDistanceMin];
    double v60 = v59;
    [(RTVisitHyperParameter *)self->_hyperParameter featureDistanceMax];
    [v58 normalizeFeature:v55 min:v60 max:v61];
    *(float *)&double v62 = v62;
    v18[v25] = *(float *)&v62;
    v63 = objc_opt_class();
    double v64 = log(v82 + v35);
    [(RTVisitHyperParameter *)self->_hyperParameter featureDwellnessLogMin];
    double v66 = v65;
    [(RTVisitHyperParameter *)self->_hyperParameter featureDwellnessLogMax];
    [v63 normalizeFeature:v64 min:v66 max:v67];
    *(float *)&double v68 = v68;
    v18[v25 + a9] = *(float *)&v68;
    v69 = objc_opt_class();
    [(RTVisitHyperParameter *)self->_hyperParameter featureRadiusMin];
    double v71 = v70;
    [(RTVisitHyperParameter *)self->_hyperParameter featureRadiusMax];
    [v69 normalizeFeature:v57 min:v71 max:v72];
    *(float *)&double v73 = v73;
    v18[2 * a9 + v25++] = *(float *)&v73;
    BOOL v16 = 1;
    BOOL v15 = v25 >= a9;
    if (v25 == a9) {
      return v16;
    }
  }
  v13 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    v74 = "Invalid parameter not satisfying: startLocation >= _hyperParameter.numOfTimeStepForDwellness * _hyperParameter.stride";
LABEL_50:
    _os_log_error_impl(&dword_1D9BFA000, v13, OS_LOG_TYPE_ERROR, v74, buf, 2u);
  }
LABEL_21:

  return v15;
}

- (float)computeFeatureVectorFromLocations:(id)a3 start:(unint64_t)a4 end:(unint64_t)a5
{
  id v8 = a3;
  if (!v8)
  {
    unint64_t v10 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      unint64_t v11 = "Invalid parameter not satisfying: locations";
      goto LABEL_10;
    }
LABEL_16:

    BOOL v15 = 0;
    goto LABEL_17;
  }
  unint64_t v9 = a5 - a4;
  if (a5 <= a4)
  {
    unint64_t v10 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      unint64_t v11 = "Invalid parameter not satisfying: start < end";
      goto LABEL_10;
    }
    goto LABEL_16;
  }
  if ([(RTVisitHyperParameter *)self->_hyperParameter minSequenceLength] + a4 > a5)
  {
    unint64_t v10 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      unint64_t v11 = "Invalid parameter not satisfying: start + _hyperParameter.minSequenceLength <= end";
LABEL_10:
      _os_log_error_impl(&dword_1D9BFA000, v10, OS_LOG_TYPE_ERROR, v11, buf, 2u);
      goto LABEL_16;
    }
    goto LABEL_16;
  }
  unint64_t v12 = [(RTVisitHyperParameter *)self->_hyperParameter stride] * a4;
  unint64_t v13 = [(RTVisitPipelineModuleTrajectorySequenceCluster *)self numLocationsFrom:a5];
  unint64_t v14 = v13 - v12;
  if (v13 <= v12)
  {
    unint64_t v10 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      goto LABEL_16;
    }
    *(_WORD *)buf = 0;
    unint64_t v11 = "Invalid parameter not satisfying: startLocationIndex < endLocationIndex";
    goto LABEL_10;
  }
  if (v13 > [v8 count])
  {
    unint64_t v10 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      goto LABEL_16;
    }
    *(_WORD *)buf = 0;
    unint64_t v11 = "Invalid parameter not satisfying: endLocationIndex <= locations.count";
    goto LABEL_10;
  }
  v17 = malloc_type_malloc(8 * v14, 0x100004000313F17uLL);
  objc_super v18 = malloc_type_malloc(8 * v14, 0x100004000313F17uLL);
  v19 = v18;
  if (v17) {
    BOOL v20 = v18 == 0;
  }
  else {
    BOOL v20 = 1;
  }
  if (v20)
  {
    double v21 = _rt_log_facility_get_os_log(RTLogFacilityVisit);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v21, OS_LOG_TYPE_ERROR, "fail to allocate memory for northings and eastings", buf, 2u);
    }

    BOOL v15 = 0;
  }
  else
  {
    double v22 = [v8 objectAtIndexedSubscript:v12];
    [v22 latitude];

    unint64_t v23 = [v8 objectAtIndexedSubscript:v12];
    [v23 longitude];

    uint64_t v24 = 0;
    unint64_t v27 = v14;
    if (v14 <= 1) {
      unint64_t v14 = 1;
    }
    do
    {
      *(void *)buf = 0;
      unint64_t v25 = [v8 objectAtIndexedSubscript:v12];
      [v25 latitude];
      unint64_t v26 = [v8 objectAtIndexedSubscript:v12];
      [v26 longitude];
      RTCommonConvertGeodeticToLocalFrame();

      v24 += 8;
      ++v12;
      --v14;
    }
    while (v14);
    BOOL v15 = [(RTVisitPipelineModuleTrajectorySequenceCluster *)self computeFeatureVectorFromLocalFramesNumOfLocations:v27 northings:v17 eastings:v19 sequenceLength:v9];
  }
  if (v17) {
    free(v17);
  }
  if (v19) {
    free(v19);
  }
LABEL_17:

  return v15;
}

- (id)createVisitWithLocations:(id)a3 entryDate:(id)a4 exitDate:(id)a5
{
  uint64_t v80 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v9)
  {
    unint64_t v11 = [(RTVisitCluster *)self->_workingVisitCluster visit];
    unint64_t v12 = [v11 location];

    if ([v8 count])
    {
      id v13 = objc_alloc(MEMORY[0x1E4F5CE00]);
      unint64_t v14 = [v8 objectAtIndexedSubscript:0];
      [v14 latitude];
      double v16 = v15;
      v17 = [v8 objectAtIndexedSubscript:0];
      [v17 longitude];
      v19 = [v13 initWithLatitude:v9 longitude:v16 horizontalUncertainty:v18 date:0.0];

      unint64_t v20 = [v8 indexOfObject:v19 inSortedRange:0 options:1280 usingComparator:&__block_literal_global_53];
      if (v20 >= [v8 count])
      {
        unint64_t v40 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
        if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          uint64_t v41 = "Invalid parameter not satisfying: firstInsideVisitIndex < locations.count";
LABEL_24:
          unint64_t v42 = buf;
LABEL_25:
          _os_log_error_impl(&dword_1D9BFA000, v40, OS_LOG_TYPE_ERROR, v41, v42, 2u);
        }
LABEL_48:

        double v33 = 0;
LABEL_49:

        goto LABEL_50;
      }
      uint64_t v21 = [v8 count];
      id v73 = v10;
      if (v10)
      {
        double v71 = v12;
        id v22 = objc_alloc(MEMORY[0x1E4F5CE00]);
        unint64_t v23 = [v8 objectAtIndexedSubscript:0];
        [v23 latitude];
        double v25 = v24;
        unint64_t v26 = [v8 objectAtIndexedSubscript:0];
        [v26 longitude];
        uint64_t v28 = [v22 initWithLatitude:v10 longitude:v25 horizontalUncertainty:v27 date:0.0];

        unint64_t v29 = [v8 indexOfObject:v28 inSortedRange:v20 options:objc_msgSend(v8, "count") - v20 usingComparator:&__block_literal_global_53];
        if (v29 < [v8 count])
        {
          unint64_t v30 = [v8 objectAtIndexedSubscript:v29];
          unint64_t v31 = [v30 date];
          unsigned int v32 = [v10 isEqualToDate:v31];

          v29 += v32;
        }
        v19 = v28;
        unint64_t v12 = v71;
      }
      else
      {
        unint64_t v29 = v21;
      }
      if (v29 < v20)
      {
        unint64_t v40 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
        if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          uint64_t v41 = "Invalid parameter not satisfying: firstOutsideVisitIndex >= firstInsideVisitIndex";
          goto LABEL_24;
        }
        goto LABEL_48;
      }
      self->_numOfLocations += v29 - v20;
      if (!self->_referenceLocation)
      {
        unint64_t v43 = [v8 objectAtIndexedSubscript:v20];
        referenceLocation = self->_referenceLocation;
        self->_referenceLocation = v43;
      }
      unint64_t v70 = v29 - v20;
      double v72 = v19;
      if (v29 > v20)
      {
        unint64_t v45 = v20;
        while (1)
        {
          double v76 = 0.0;
          *(void *)buf = 0;
          double v75 = 0.0;
          [(RTLocation *)self->_referenceLocation latitude];
          [(RTLocation *)self->_referenceLocation longitude];
          unint64_t v46 = [v8 objectAtIndexedSubscript:v45];
          [v46 latitude];
          unint64_t v47 = [v8 objectAtIndexedSubscript:v45];
          [v47 longitude];
          char v48 = RTCommonConvertGeodeticToLocalFrame();

          if ((v48 & 1) == 0) {
            break;
          }
          double sumOfNorthing = v76 + self->_sumOfNorthing;
          double sumOfSquaredEasting = self->_sumOfSquaredEasting;
          double sumOfSquaredNorthing = v76 * v76 + self->_sumOfSquaredNorthing;
          double v52 = v75;
          double sumOfEasting = v75 + self->_sumOfEasting;
          self->_double sumOfNorthing = sumOfNorthing;
          self->_double sumOfEasting = sumOfEasting;
          double v54 = v52 * v52 + sumOfSquaredEasting;
          self->_double sumOfSquaredNorthing = sumOfSquaredNorthing;
          self->_double sumOfSquaredEasting = v54;
          if (v29 == ++v45) {
            goto LABEL_34;
          }
        }
        double v66 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
        if (os_log_type_enabled(v66, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)v74 = 0;
          _os_log_error_impl(&dword_1D9BFA000, v66, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: result", v74, 2u);
        }

        double v33 = 0;
        v19 = v72;
        id v10 = v73;
        goto LABEL_49;
      }
      double sumOfNorthing = self->_sumOfNorthing;
      double sumOfEasting = self->_sumOfEasting;
      double sumOfSquaredNorthing = self->_sumOfSquaredNorthing;
      double v54 = self->_sumOfSquaredEasting;
LABEL_34:
      double numOfLocations = (double)self->_numOfLocations;
      double v56 = sumOfNorthing / numOfLocations;
      double v76 = 0.0;
      *(void *)buf = 0;
      double v57 = sumOfEasting / numOfLocations;
      [(RTLocation *)self->_referenceLocation latitude];
      [(RTLocation *)self->_referenceLocation longitude];
      v19 = v72;
      if (RTCommonConvertLocalFrameToGeodetic())
      {
        RTCommonIsCoordinateValid();
        id v10 = v73;
        if (v58 != 0.0)
        {
          double v59 = sqrt(vabdd_f64(sumOfSquaredNorthing / numOfLocations, v56 * v56));
          double v60 = sqrt(vabdd_f64(v54 / numOfLocations, v57 * v57));
          uint64_t v61 = [objc_alloc(MEMORY[0x1E4F5CE00]) initWithLatitude:0 longitude:*(double *)buf horizontalUncertainty:v76 date:sqrt(v59 * v59 + v60 * v60)];

          uint64_t v34 = 0;
          if (v29 != v20)
          {
            uint64_t v62 = v61;
            v63 = [RTVisitLocationPoints alloc];
            double v64 = [v8 subarrayWithRange:v20, v70];
            double v65 = v63;
            uint64_t v61 = v62;
            uint64_t v34 = [(RTVisitLocationPoints *)v65 initWithLocations:v64];
          }
          unint64_t v12 = v61;
          if (!v61) {
            goto LABEL_39;
          }
          goto LABEL_11;
        }
        unint64_t v40 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
        if (!os_log_type_enabled(v40, OS_LOG_TYPE_ERROR)) {
          goto LABEL_48;
        }
        LOWORD(v75) = 0;
        uint64_t v41 = "Invalid parameter not satisfying: RTCommonIsCoordinateValid(meanLat, meanLon)";
      }
      else
      {
        unint64_t v40 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
        id v10 = v73;
        if (!os_log_type_enabled(v40, OS_LOG_TYPE_ERROR)) {
          goto LABEL_48;
        }
        LOWORD(v75) = 0;
        uint64_t v41 = "Invalid parameter not satisfying: result";
      }
      unint64_t v42 = (uint8_t *)&v75;
      goto LABEL_25;
    }
    uint64_t v34 = 0;
    if (!v12)
    {
LABEL_39:
      v19 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1D9BFA000, v19, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: centroid", buf, 2u);
      }
      double v33 = 0;
      unint64_t v12 = v34;
      goto LABEL_49;
    }
LABEL_11:
    id v35 = objc_alloc(MEMORY[0x1E4F5CFC8]);
    v36 = [MEMORY[0x1E4F1C9C8] date];
    if (v10) {
      uint64_t v37 = 3;
    }
    else {
      uint64_t v37 = 1;
    }
    unint64_t v38 = (void *)[v35 initWithDate:v36 type:v37 location:v12 entry:v9 exit:v10 dataPointCount:self->_numOfLocations confidence:*MEMORY[0x1E4F5D010] placeInference:0];

    double v33 = [[RTVisitCluster alloc] initWithPoints:v34 visit:v38];
    unint64_t v39 = _rt_log_facility_get_os_log(RTLogFacilityVisit);
    if (os_log_type_enabled(v39, OS_LOG_TYPE_DEBUG))
    {
      double v68 = (objc_class *)objc_opt_class();
      v69 = NSStringFromClass(v68);
      *(_DWORD *)buf = 138412546;
      *(void *)&buf[4] = v69;
      __int16 v78 = 2112;
      unint64_t v79 = v33;
      _os_log_debug_impl(&dword_1D9BFA000, v39, OS_LOG_TYPE_DEBUG, "%@ add out cluster, %@", buf, 0x16u);
    }
    v19 = v34;
    goto LABEL_49;
  }
  unint64_t v12 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_1D9BFA000, v12, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: entryDate", buf, 2u);
  }
  double v33 = 0;
LABEL_50:

  return v33;
}

uint64_t __94__RTVisitPipelineModuleTrajectorySequenceCluster_createVisitWithLocations_entryDate_exitDate___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  unint64_t v5 = [a2 date];
  id v6 = [v4 date];

  uint64_t v7 = [v5 compare:v6];
  return v7;
}

- (void)clearWorkingVisitCluster
{
  [(RTVisitDecoder *)self->_decoder reset];
  workingVisitCluster = self->_workingVisitCluster;
  self->_workingVisitCluster = 0;

  self->_double numOfLocations = 0;
  *(_OWORD *)&self->_double sumOfNorthing = 0u;
  *(_OWORD *)&self->_double sumOfSquaredNorthing = 0u;
  referenceLocation = self->_referenceLocation;
  self->_referenceLocation = 0;

  residualLocations = self->_residualLocations;
  self->_residualLocations = 0;
}

- (id)performBatchInferenceWithFeatureVector:(const float *)a3 featureVectorLength:(unint64_t)a4 start:(unint64_t)a5 firstTimeStepDate:(id)a6
{
  id v10 = a6;
  unsigned int v32 = v10;
  if (!a3)
  {
    double v15 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      goto LABEL_24;
    }
    __int16 v39 = 0;
    unint64_t v23 = "Invalid parameter not satisfying: featureVector";
    double v24 = (uint8_t *)&v39;
LABEL_23:
    _os_log_error_impl(&dword_1D9BFA000, v15, OS_LOG_TYPE_ERROR, v23, v24, 2u);
    goto LABEL_24;
  }
  unint64_t v11 = a4 - a5;
  if (a4 <= a5)
  {
    double v15 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      goto LABEL_24;
    }
    __int16 v38 = 0;
    unint64_t v23 = "Invalid parameter not satisfying: start < featureVectorLength";
    double v24 = (uint8_t *)&v38;
    goto LABEL_23;
  }
  unint64_t v12 = v10;
  if (!v10)
  {
    double v15 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      unint64_t v23 = "Invalid parameter not satisfying: firstTimeStepDate";
      double v24 = buf;
      goto LABEL_23;
    }
LABEL_24:
    id v22 = 0;
    goto LABEL_25;
  }
  unint64_t v13 = [(RTVisitHyperParameter *)self->_hyperParameter minSequenceLength];
  unint64_t v14 = [(RTVisitHyperParameter *)self->_hyperParameter maxSequenceLength];
  if (v11 >= v14) {
    unint64_t v11 = v14;
  }
  double v15 = [v12 dateByAddingTimeInterval:-[RTVisitHyperParameter windowInterval](self->_hyperParameter, "windowInterval") * (a5 + v13 - 1)];
  unint64_t v16 = [(RTVisitHyperParameter *)self->_hyperParameter onDeviceInferenceBatchSize];
  if (v13 > v11) {
    goto LABEL_24;
  }
  unint64_t v17 = v16;
  unint64_t v18 = v11;
  unint64_t v30 = 0;
  v19 = v15;
  while (1)
  {
    if (v18 < v13
             + [(RTVisitHyperParameter *)self->_hyperParameter visitInferenceResolution]* (v17 - 1))
    {
      unint64_t v20 = v18
          + ~v13
          + [(RTVisitHyperParameter *)self->_hyperParameter visitInferenceResolution];
      unint64_t v17 = v20 / [(RTVisitHyperParameter *)self->_hyperParameter visitInferenceResolution]
          + 1;
    }
    if (!v17)
    {
      unint64_t v26 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      {
        __int16 v36 = 0;
        double v27 = "Invalid parameter not satisfying: 0 < batchSize";
        uint64_t v28 = (uint8_t *)&v36;
        goto LABEL_39;
      }
LABEL_33:

      unint64_t v29 = v31;
      goto LABEL_36;
    }
    if (v17 > [(RTVisitHyperParameter *)self->_hyperParameter onDeviceInferenceBatchSize])
    {
      unint64_t v26 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      {
        __int16 v35 = 0;
        double v27 = "Invalid parameter not satisfying: batchSize <= _hyperParameter.onDeviceInferenceBatchSize";
        uint64_t v28 = (uint8_t *)&v35;
        goto LABEL_39;
      }
      goto LABEL_33;
    }
    uint64_t v21 = [(RTVisitModelController *)self->_trajectorySequenceClassifier predictFromInput:a3 featureVectorStride:a4 firstSequenceIndex:a5 firstSequenceLength:v13 batchSize:v17];
    if (!v21)
    {
      unint64_t v26 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      if (!os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
        goto LABEL_33;
      }
      *(_WORD *)uint64_t v34 = 0;
      double v27 = "Invalid parameter not satisfying: output";
      uint64_t v28 = v34;
LABEL_39:
      _os_log_error_impl(&dword_1D9BFA000, v26, OS_LOG_TYPE_ERROR, v27, v28, 2u);
      goto LABEL_33;
    }
    id v22 = [(RTVisitDecoder *)self->_decoder decodeWithProbabilities:v21 batchSize:v17 firstTimeStepDate:v19];

    if (!v22) {
      break;
    }
    if ([v22 completeVisit]) {
      goto LABEL_37;
    }
    v13 += [(RTVisitHyperParameter *)self->_hyperParameter visitInferenceResolution] * v17;
    double v15 = [v19 dateByAddingTimeInterval:(double)([(RTVisitHyperParameter *)self->_hyperParameter visitInferenceResolution]* v17* [(RTVisitHyperParameter *)self->_hyperParameter windowInterval])];

    unint64_t v30 = v22;
    v19 = v15;
    if (v13 > v18) {
      goto LABEL_25;
    }
  }
  unint64_t v29 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)double v33 = 0;
    _os_log_error_impl(&dword_1D9BFA000, v29, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: decoded", v33, 2u);
  }
LABEL_36:

  id v22 = 0;
LABEL_37:
  double v15 = v19;
LABEL_25:

  return v22;
}

- (id)process:(id)a3
{
  uint64_t v138 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  unint64_t v5 = [MEMORY[0x1E4F1CA48] array];
  long long v119 = 0u;
  long long v120 = 0u;
  long long v121 = 0u;
  long long v122 = 0u;
  id obj = v4;
  uint64_t v116 = [obj countByEnumeratingWithState:&v119 objects:v137 count:16];
  if (!v116)
  {
LABEL_96:
    v95 = obj;

    id v96 = v5;
    goto LABEL_109;
  }
  uint64_t v115 = *(void *)v120;
  v109 = v5;
LABEL_3:
  uint64_t v6 = 0;
  while (1)
  {
    if (*(void *)v120 != v115) {
      objc_enumerationMutation(obj);
    }
    uint64_t v7 = *(char **)(*((void *)&v119 + 1) + 8 * v6);
    id v8 = _rt_log_facility_get_os_log(RTLogFacilityVisit);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      double v67 = (objc_class *)objc_opt_class();
      double v68 = NSStringFromClass(v67);
      *(_DWORD *)buf = 138412546;
      unint64_t v124 = (unint64_t)v68;
      __int16 v125 = 2112;
      v126 = v7;
      _os_log_debug_impl(&dword_1D9BFA000, v8, OS_LOG_TYPE_DEBUG, "%@ working on cluster, %@", buf, 0x16u);
    }
    id v9 = [v7 points];
    id v10 = [v9 locations];

    if ([(NSArray *)self->_residualLocations count])
    {
      unint64_t v11 = [v7 points];
      unint64_t v12 = [v11 locations];
      if ([v12 count])
      {
        unint64_t v13 = [(NSArray *)self->_residualLocations lastObject];
        unint64_t v14 = [v13 date];
        double v15 = [v10 firstObject];
        [v15 date];
        v17 = unint64_t v16 = v10;
        [v14 timeIntervalSinceDate:v17];
        double v19 = v18;
        double v20 = (double)[(RTVisitHyperParameter *)self->_hyperParameter timeIntervalBetweenSmoothedPoints]+ 1.0;

        if (v19 > v20)
        {
          id v10 = v16;
          goto LABEL_15;
        }
        id v10 = [(NSArray *)self->_residualLocations arrayByAddingObjectsFromArray:v16];
        unint64_t v11 = v16;
      }
      else
      {
      }
    }
LABEL_15:
    residualLocations = self->_residualLocations;
    self->_residualLocations = 0;

    id v22 = [v7 points];
    unint64_t v23 = [v22 locations];
    uint64_t v24 = [v23 count];

    v118 = v7;
    if (!v24)
    {
      p_super = _rt_log_facility_get_os_log(RTLogFacilityVisit);
      if (os_log_type_enabled(p_super, OS_LOG_TYPE_DEBUG))
      {
        unint64_t v31 = (objc_class *)objc_opt_class();
        unsigned int v32 = NSStringFromClass(v31);
        *(_DWORD *)buf = 138412290;
        unint64_t v124 = (unint64_t)v32;
        _os_log_debug_impl(&dword_1D9BFA000, p_super, OS_LOG_TYPE_DEBUG, "%@ early bail: receiving forced exit signal", buf, 0xCu);
      }
      goto LABEL_86;
    }
    unint64_t v25 = [v10 count];
    unint64_t v26 = [(RTVisitHyperParameter *)self->_hyperParameter minSequenceLength];
    unint64_t v27 = [(RTVisitHyperParameter *)self->_hyperParameter windowSize];
    if (v25 >= [(RTVisitHyperParameter *)self->_hyperParameter referenceSize] + v27 * v26) {
      break;
    }
    uint64_t v28 = _rt_log_facility_get_os_log(RTLogFacilityVisit);
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
    {
      v69 = (objc_class *)objc_opt_class();
      unint64_t v70 = NSStringFromClass(v69);
      uint64_t v71 = [v10 count];
      *(_DWORD *)buf = 138412546;
      unint64_t v124 = (unint64_t)v70;
      __int16 v125 = 2048;
      v126 = (const char *)v71;
      _os_log_debug_impl(&dword_1D9BFA000, v28, OS_LOG_TYPE_DEBUG, "%@ early bail: insufficient number of locations, %lu", buf, 0x16u);
    }
    unint64_t v29 = v10;
    p_super = &self->_residualLocations->super;
    self->_residualLocations = v29;
LABEL_86:

    unint64_t v83 = [v118 visit];
    unint64_t v84 = [v83 exit];

    if (v84)
    {
      double v85 = [(RTVisitPipelineModuleTrajectorySequenceCluster *)self workingVisitCluster];

      if (v85)
      {
        unint64_t v86 = v10;
        unint64_t v87 = [v118 points];
        double v88 = [v87 locations];
        unint64_t v89 = [(RTVisitCluster *)self->_workingVisitCluster visit];
        double v90 = [v89 entry];
        v91 = [v118 visit];
        v92 = [v91 exit];
        v93 = [(RTVisitPipelineModuleTrajectorySequenceCluster *)self createVisitWithLocations:v88 entryDate:v90 exitDate:v92];

        v94 = _rt_log_facility_get_os_log(RTLogFacilityVisit);
        if (os_log_type_enabled(v94, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)buf = 0;
          _os_log_debug_impl(&dword_1D9BFA000, v94, OS_LOG_TYPE_DEBUG, "partial visit: use incoming visit to complete working visit", buf, 2u);
        }

        if (v93) {
          [v109 addObject:v93];
        }

        id v10 = v86;
      }
      [(RTVisitPipelineModuleTrajectorySequenceCluster *)self clearWorkingVisitCluster];
    }

    if (++v6 == v116)
    {
      unint64_t v5 = v109;
      uint64_t v116 = [obj countByEnumeratingWithState:&v119 objects:v137 count:16];
      if (!v116) {
        goto LABEL_96;
      }
      goto LABEL_3;
    }
  }
  unint64_t v33 = -[RTVisitPipelineModuleTrajectorySequenceCluster sequenceLengthFrom:](self, "sequenceLengthFrom:", [v10 count]);
  uint64_t v34 = [(RTVisitPipelineModuleTrajectorySequenceCluster *)self computeFeatureVectorFromLocations:v10 start:0 end:v33];
  if (!v34)
  {
    v99 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v99, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v99, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: featureVector", buf, 2u);
    }

    unint64_t v5 = v109;
    id v100 = v109;
LABEL_107:
    v95 = obj;
    goto LABEL_108;
  }
  __int16 v35 = v34;
  uint64_t v36 = [v10 count];
  v117 = v10;
  [v10 objectAtIndexedSubscript:-[RTVisitPipelineModuleTrajectorySequenceCluster startLocationIndex:](self, "startLocationIndex:", 0)];
  uint64_t v37 = log = (os_log_t)v33;
  p_super = [v37 date];

  unint64_t v38 = (unint64_t)log;
  if ([(RTVisitHyperParameter *)self->_hyperParameter minSequenceLength] > (unint64_t)log)
  {
    unint64_t v39 = 0;
    unint64_t v40 = 0;
LABEL_80:
    unint64_t v77 = [(RTVisitPipelineModuleTrajectorySequenceCluster *)self startLocationIndex:&v40[v36]];
    if (v77 < [v117 count])
    {
      __int16 v78 = _rt_log_facility_get_os_log(RTLogFacilityVisit);
      if (os_log_type_enabled(v78, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 134218240;
        unint64_t v124 = v39;
        __int16 v125 = 2048;
        v126 = (const char *)v38;
        _os_log_debug_impl(&dword_1D9BFA000, v78, OS_LOG_TYPE_DEBUG, "keeping residual locations for start, %lu, featureVectorSequenceLength, %lu", buf, 0x16u);
      }

      id v10 = v117;
      unint64_t v79 = [v117 count] - v77;
      unint64_t v80 = [(RTVisitHyperParameter *)self->_hyperParameter maxSequenceLength];
      if (v79 > [(RTVisitHyperParameter *)self->_hyperParameter windowSize] * v80)
      {
        v97 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
        if (os_log_type_enabled(v97, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_error_impl(&dword_1D9BFA000, v97, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: locations.count - residualLocationIndex <= _hyperParameter.maxSequenceLength * _hyperParameter.windowSize", buf, 2u);
        }
        unint64_t v5 = v109;
        v95 = obj;
        goto LABEL_100;
      }
      [v117 subarrayWithRange:v77, [v117 count] - v77];
      uint64_t v81 = (NSArray *)objc_claimAutoreleasedReturnValue();
      double v82 = self->_residualLocations;
      self->_residualLocations = v81;
    }
    free(v35);
    id v10 = v117;
    goto LABEL_86;
  }
  uint64_t v105 = v36;
  uint64_t v108 = v6;
  v110 = 0;
  unint64_t v39 = 0;
  while (2)
  {
    unint64_t v41 = [(RTVisitHyperParameter *)self->_hyperParameter maxSequenceLength];
    unint64_t v42 = v41 + v39;
    if (v38 >= v41 + v39) {
      unint64_t v43 = v41 + v39;
    }
    else {
      unint64_t v43 = v38;
    }
    unint64_t v44 = _rt_log_facility_get_os_log(RTLogFacilityVisit);
    if (os_log_type_enabled(v44, OS_LOG_TYPE_DEBUG))
    {
      double v64 = NSStringFromSelector(a2);
      unint64_t numOfLocations = self->_numOfLocations;
      *(_DWORD *)buf = 138413826;
      unint64_t v124 = (unint64_t)v64;
      __int16 v125 = 2048;
      v126 = v110;
      __int16 v127 = 2048;
      unint64_t v128 = v39;
      __int16 v129 = 2048;
      unint64_t v130 = v43;
      __int16 v131 = 2048;
      unint64_t v132 = v38;
      __int16 v133 = 2112;
      v134 = p_super;
      __int16 v135 = 2048;
      unint64_t v136 = numOfLocations;
      _os_log_debug_impl(&dword_1D9BFA000, v44, OS_LOG_TYPE_DEBUG, "%@: featureVectorStart=%lu, predictionStart=%lu, maxPredictionStop=%lu, featureVectorLength=%lu, firstTimeStepDate=%@, _numOfLocations=%lu", buf, 0x48u);
    }
    unint64_t v45 = [(RTVisitPipelineModuleTrajectorySequenceCluster *)self performBatchInferenceWithFeatureVector:v35 featureVectorLength:v38 start:v39 firstTimeStepDate:p_super];
    unint64_t v46 = _rt_log_facility_get_os_log(RTLogFacilityVisit);
    if (os_log_type_enabled(v46, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      unint64_t v124 = (unint64_t)v45;
      _os_log_debug_impl(&dword_1D9BFA000, v46, OS_LOG_TYPE_DEBUG, "decoded=%@", buf, 0xCu);
    }

    if (v45)
    {
      if ([v45 noVisit])
      {
        unint64_t v47 = _rt_log_facility_get_os_log(RTLogFacilityVisit);
        if (os_log_type_enabled(v47, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)buf = 0;
          _os_log_debug_impl(&dword_1D9BFA000, v47, OS_LOG_TYPE_DEBUG, "no visit detected", buf, 2u);
        }

        if (v38 <= v42) {
          goto LABEL_78;
        }
        unint64_t v48 = [(RTVisitHyperParameter *)self->_hyperParameter noVisitMargin];
        goto LABEL_44;
      }
      if ([v45 partialVisit])
      {
        if (v38 <= v42)
        {
          v106 = [v45 entryDate];
          os_log_t logb = [v118 visit];
          double v72 = [logb exit];
          double v55 = [(RTVisitPipelineModuleTrajectorySequenceCluster *)self createVisitWithLocations:v117 entryDate:v106 exitDate:v72];

          if (v55) {
            [v109 addObject:v55];
          }
          id v73 = [v118 visit];
          v107 = [v73 exit];

          loga = _rt_log_facility_get_os_log(RTLogFacilityVisit);
          BOOL v74 = os_log_type_enabled(loga, OS_LOG_TYPE_DEBUG);
          if (v107)
          {
            if (v74)
            {
              *(_WORD *)buf = 0;
              _os_log_debug_impl(&dword_1D9BFA000, loga, OS_LOG_TYPE_DEBUG, "partial visit: use incoming visit to complete", buf, 2u);
            }

            [(RTVisitPipelineModuleTrajectorySequenceCluster *)self clearWorkingVisitCluster];
          }
          else
          {
            if (v74)
            {
              *(_DWORD *)buf = 138412290;
              unint64_t v124 = (unint64_t)v55;
              _os_log_debug_impl(&dword_1D9BFA000, loga, OS_LOG_TYPE_DEBUG, "partial visit: working visit: %@", buf, 0xCu);
            }

            objc_storeStrong((id *)&self->_workingVisitCluster, v55);
          }
          uint64_t v105 = v43 - [(RTVisitHyperParameter *)self->_hyperParameter partialVisitMargin];
LABEL_77:

LABEL_78:
LABEL_79:
          unint64_t v40 = v110;
          uint64_t v36 = v105;
          goto LABEL_80;
        }
        float v49 = _rt_log_facility_get_os_log(RTLogFacilityVisit);
        if (os_log_type_enabled(v49, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)buf = 0;
          _os_log_debug_impl(&dword_1D9BFA000, v49, OS_LOG_TYPE_DEBUG, "partial visit: continuing without yielding", buf, 2u);
        }

        unint64_t v48 = [(RTVisitHyperParameter *)self->_hyperParameter partialVisitMargin];
LABEL_44:
        unint64_t v39 = v43 - v48;
      }
      else if ([v45 completeVisit])
      {
        double v50 = _rt_log_facility_get_os_log(RTLogFacilityVisit);
        if (os_log_type_enabled(v50, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)buf = 0;
          _os_log_debug_impl(&dword_1D9BFA000, v50, OS_LOG_TYPE_DEBUG, "complete visit", buf, 2u);
        }

        float v51 = [v45 exitDate];
        int v52 = [v51 isBeforeDate:p_super];

        if (v52) {
          [v45 setExitDate:p_super];
        }
        unint64_t v53 = [v45 entryDate];
        double v54 = [v45 exitDate];
        double v55 = [(RTVisitPipelineModuleTrajectorySequenceCluster *)self createVisitWithLocations:v117 entryDate:v53 exitDate:v54];

        if (v55) {
          [v109 addObject:v55];
        }
        [(RTVisitPipelineModuleTrajectorySequenceCluster *)self clearWorkingVisitCluster];
        double v56 = [v45 exitDate];
        unint64_t v57 = [(RTVisitPipelineModuleTrajectorySequenceCluster *)self sequenceIndexFromDate:v56 firstTimeStepDate:p_super];
        unint64_t v39 = v57 + [(RTVisitHyperParameter *)self->_hyperParameter completeVisitMargin] + 1;

        if ([(RTVisitHyperParameter *)self->_hyperParameter minSequenceLength] + v39 > v38)
        {
          BOOL v75 = v38 >= [(RTVisitHyperParameter *)self->_hyperParameter minSequenceLength] + v39
             || v39 >= v38;
          unint64_t v76 = v105;
          uint64_t v6 = v108;
          if (!v75) {
            unint64_t v76 = v39;
          }
          uint64_t v105 = v76;
          goto LABEL_77;
        }
        double v58 = v55;
        double v59 = &v110[v39];
        free(v35);
        id v10 = v117;
        double v60 = [(RTVisitPipelineModuleTrajectorySequenceCluster *)self computeFeatureVectorFromLocations:v117 start:v59 end:log];
        if (!v60)
        {
          v101 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
          if (os_log_type_enabled(v101, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)buf = 0;
            _os_log_error_impl(&dword_1D9BFA000, v101, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: featureVector", buf, 2u);
          }

          unint64_t v5 = v109;
          id v102 = v109;

          goto LABEL_107;
        }
        __int16 v35 = v60;
        uint64_t v61 = [v117 objectAtIndexedSubscript:-[RTVisitPipelineModuleTrajectorySequenceCluster startLocationIndex:](self, "startLocationIndex:", v59)];
        uint64_t v62 = [v61 date];

        v110 = v59;
        unint64_t v38 = (char *)log - v59;

        unint64_t v39 = 0;
        p_super = v62;
        uint64_t v6 = v108;
      }
      else
      {
        v63 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
        if (os_log_type_enabled(v63, OS_LOG_TYPE_ERROR))
        {
          decoder = self->_decoder;
          *(_DWORD *)buf = 138412802;
          unint64_t v124 = (unint64_t)decoder;
          __int16 v125 = 2080;
          v126 = "-[RTVisitPipelineModuleTrajectorySequenceCluster process:]";
          __int16 v127 = 1024;
          LODWORD(v128) = 590;
          _os_log_error_impl(&dword_1D9BFA000, v63, OS_LOG_TYPE_ERROR, "decoded visit is not valid, decoder=%@ (in %s:%d)", buf, 0x1Cu);
        }
      }
      if ([(RTVisitHyperParameter *)self->_hyperParameter minSequenceLength] + v39 > v38) {
        goto LABEL_79;
      }
      continue;
    }
    break;
  }
  v97 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  if (os_log_type_enabled(v97, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_1D9BFA000, v97, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: decoded", buf, 2u);
  }
  unint64_t v5 = v109;
  v95 = obj;
  id v10 = v117;
LABEL_100:

  id v98 = v5;
LABEL_108:

LABEL_109:

  return v5;
}

- (RTVisitModelController)trajectorySequenceClassifier
{
  return self->_trajectorySequenceClassifier;
}

- (RTVisitHyperParameter)hyperParameter
{
  return self->_hyperParameter;
}

- (RTVisitDecoder)decoder
{
  return self->_decoder;
}

- (RTVisitCluster)workingVisitCluster
{
  return self->_workingVisitCluster;
}

- (unint64_t)numOfLocations
{
  return self->_numOfLocations;
}

- (NSArray)residualLocations
{
  return self->_residualLocations;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_residualLocations, 0);
  objc_storeStrong((id *)&self->_workingVisitCluster, 0);
  objc_storeStrong((id *)&self->_decoder, 0);
  objc_storeStrong((id *)&self->_hyperParameter, 0);
  objc_storeStrong((id *)&self->_trajectorySequenceClassifier, 0);

  objc_storeStrong((id *)&self->_referenceLocation, 0);
}

@end