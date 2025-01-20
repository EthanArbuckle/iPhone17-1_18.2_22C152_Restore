@interface RTVisitPipelineModuleSmoother
+ (BOOL)hasRawLocationsNeededToComputeSmoothedLocationAtDate:(id)a3 workingVisitExit:(id)a4 rawLocations:(id)a5 kernelWidth:(double)a6 smallestSignificantWeightExponent:(double)a7;
+ (double)getMaxDeltaForSmoothedLocationDate:(id)a3 rawLocations:(id)a4 kernelWidth:(double)a5;
+ (double)getTimeDeltaSignificanceThresholdForSmoothedLocationDate:(id)a3 rawLocations:(id)a4 kernelWidth:(double)a5 smallestSignificantaWeightExponent:(double)a6;
+ (double)getWeightExponentForSmoothedLocationDate:(id)a3 rawLocationDate:(id)a4 kernelWidth:(double)a5 maxDelta:(double)a6;
+ (id)computeSmoothedPointForDate:(id)a3 rawLocations:(id)a4 kernelWidth:(double)a5 smallestSignificantWeightExponent:(double)a6;
+ (id)createNewOutputClusterForSmoothedPoints:(id)a3 workingVisit:(id)a4 exit:(id)a5;
+ (id)getEndOfGapAtDate:(id)a3 rawLocations:(id)a4 maxGapWithinVisit:(double)a5;
+ (id)getNextDateToProcessForDate:(id)a3 firstDateToProcessForVisit:(id)a4 timeIntervalBetweenSmoothedPoints:(double)a5;
+ (unint64_t)findIndexOfLocationInArray:(id)a3 inRange:(_NSRange)a4 afterDate:(id)a5;
+ (void)disposeObsoleteRawLocations:(id)a3 currentDateToProcess:(id)a4 halfTimeProcessWindow:(double)a5;
- (NSDate)entryBeforeAnyGaps;
- (NSDate)firstDateToProcessForVisit;
- (NSDate)nextDateToProcess;
- (NSDate)previousProcessedDate;
- (NSMutableArray)rawLocations;
- (RTVisit)workingVisit;
- (RTVisitPipelineModuleSmoother)initWithTimeIntervalBetweenSmoothedPoints:(double)a3 kernelWidth:(double)a4 smallestSignificantWeightExponent:(double)a5 maxGapWithinVisit:(double)a6;
- (double)kernelWidth;
- (double)maxGapInVisit;
- (double)smallestSignificantWeightExponent;
- (double)timeIntervalBetweenSmoothedPoints;
- (id)computeSmoothedPointForDate:(id)a3;
- (id)createNewOutputClusterForSmoothedPoints:(id)a3 exit:(id)a4;
- (id)getEndOfGapAtDate:(id)a3;
- (id)getNextDateToProcessForDate:(id)a3;
- (id)process:(id)a3;
- (id)processCachedPoints;
- (unint64_t)leftWindowIncludedIndex;
- (unint64_t)outputLocationsCount;
- (unint64_t)rightWindowExcludedIndex;
- (void)disposeObsoleteRawLocationsForCurrentDateToProcess:(id)a3 halfTimeProcessWindow:(double)a4;
- (void)resetState;
- (void)updateStateWithNewCluster:(id)a3;
@end

@implementation RTVisitPipelineModuleSmoother

- (RTVisitPipelineModuleSmoother)initWithTimeIntervalBetweenSmoothedPoints:(double)a3 kernelWidth:(double)a4 smallestSignificantWeightExponent:(double)a5 maxGapWithinVisit:(double)a6
{
  v6 = self;
  if (a3 <= 0.0)
  {
    v18 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
LABEL_9:

      v17 = 0;
      goto LABEL_10;
    }
    *(_WORD *)buf = 0;
    v19 = "Invalid parameter not satisfying: timeIntervalBetweenSmoothedPoints > 0";
LABEL_12:
    _os_log_error_impl(&dword_1D9BFA000, v18, OS_LOG_TYPE_ERROR, v19, buf, 2u);
    goto LABEL_9;
  }
  if (a4 <= 0.0)
  {
    v18 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      goto LABEL_9;
    }
    *(_WORD *)buf = 0;
    v19 = "Invalid parameter not satisfying: kernelWidth > 0";
    goto LABEL_12;
  }
  v21.receiver = self;
  v21.super_class = (Class)RTVisitPipelineModuleSmoother;
  v11 = [(RTVisitPipelineModuleSmoother *)&v21 init];
  v12 = v11;
  if (v11)
  {
    workingVisit = v11->_workingVisit;
    v11->_workingVisit = 0;

    previousProcessedDate = v12->_previousProcessedDate;
    v12->_previousProcessedDate = 0;

    nextDateToProcess = v12->_nextDateToProcess;
    v12->_nextDateToProcess = 0;

    firstDateToProcessForVisit = v12->_firstDateToProcessForVisit;
    v12->_firstDateToProcessForVisit = 0;

    v12->_timeIntervalBetweenSmoothedPoints = a3;
    v12->_kernelWidth = a4;
    v12->_smallestSignificantWeightExponent = a5;
    v12->_maxGapInVisit = a6;
  }
  v6 = v12;
  v17 = v6;
LABEL_10:

  return v17;
}

+ (unint64_t)findIndexOfLocationInArray:(id)a3 inRange:(_NSRange)a4 afterDate:(id)a5
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  v8 = (objc_class *)MEMORY[0x1E4F5CE00];
  id v9 = a5;
  id v10 = a3;
  v11 = (void *)[[v8 alloc] initWithLatitude:v9 longitude:0.0 horizontalUncertainty:0.0 date:0.0];

  unint64_t v12 = [v10 indexOfObject:v11 inSortedRange:location length:length options:1024 usingComparator:&__block_literal_global_44];
  return v12;
}

uint64_t __78__RTVisitPipelineModuleSmoother_findIndexOfLocationInArray_inRange_afterDate___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  v5 = [a2 date];
  v6 = [v4 date];

  uint64_t v7 = [v5 compare:v6];
  return v7;
}

+ (double)getMaxDeltaForSmoothedLocationDate:(id)a3 rawLocations:(id)a4 kernelWidth:(double)a5
{
  id v7 = a3;
  id v8 = a4;
  unint64_t v9 = [objc_opt_class() findIndexOfLocationInArray:v8 inRange:0 afterDate:v7];
  if (v9 >= [v8 count])
  {
    --v9;
  }
  else if (v9)
  {
    id v10 = [v8 objectAtIndexedSubscript:v9];
    v11 = [v10 date];
    [v7 timeIntervalSinceDate:v11];
    double v13 = fabs(v12);
    v14 = [v8 objectAtIndexedSubscript:v9 - 1];
    v15 = [v14 date];
    [v7 timeIntervalSinceDate:v15];
    double v17 = fabs(v16);

    if (v13 >= v17) {
      --v9;
    }
  }
  v18 = objc_opt_class();
  v19 = [v8 objectAtIndexedSubscript:v9];
  v20 = [v19 date];
  [v18 getWeightExponentForSmoothedLocationDate:v7 rawLocationDate:v20 kernelWidth:a5 maxDelta:0.0];
  double v22 = v21;

  return v22;
}

+ (double)getWeightExponentForSmoothedLocationDate:(id)a3 rawLocationDate:(id)a4 kernelWidth:(double)a5 maxDelta:(double)a6
{
  [a3 timeIntervalSinceDate:a4];
  return v8 / a5 * (v8 / a5) * -0.5 - a6;
}

+ (double)getTimeDeltaSignificanceThresholdForSmoothedLocationDate:(id)a3 rawLocations:(id)a4 kernelWidth:(double)a5 smallestSignificantaWeightExponent:(double)a6
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  if (a6 > 0.0)
  {
    v11 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      int v15 = 136315394;
      double v16 = "+[RTVisitPipelineModuleSmoother getTimeDeltaSignificanceThresholdForSmoothedLocationDate:rawLocations:kernel"
            "Width:smallestSignificantaWeightExponent:]";
      __int16 v17 = 1024;
      int v18 = 98;
      _os_log_error_impl(&dword_1D9BFA000, v11, OS_LOG_TYPE_ERROR, "smallestSignificantWeightExponent must be non-positive (in %s:%d)", (uint8_t *)&v15, 0x12u);
    }
  }
  [(id)objc_opt_class() getMaxDeltaForSmoothedLocationDate:v9 rawLocations:v10 kernelWidth:a5];
  double v13 = v12;

  return sqrt((v13 + a6) * -2.0) * a5;
}

- (id)computeSmoothedPointForDate:(id)a3
{
  id v4 = a3;
  v5 = [(id)objc_opt_class() computeSmoothedPointForDate:v4 rawLocations:self->_rawLocations kernelWidth:self->_kernelWidth smallestSignificantWeightExponent:self->_smallestSignificantWeightExponent];

  return v5;
}

+ (id)computeSmoothedPointForDate:(id)a3 rawLocations:(id)a4 kernelWidth:(double)a5 smallestSignificantWeightExponent:(double)a6
{
  id v9 = a3;
  id v10 = a4;
  if (![v10 count])
  {
    v42 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v42, OS_LOG_TYPE_ERROR)) {
      goto LABEL_24;
    }
    __int16 v61 = 0;
    v40 = "Invalid parameter not satisfying: rawLocations.count > 0";
    v41 = (uint8_t *)&v61;
LABEL_33:
    _os_log_error_impl(&dword_1D9BFA000, v42, OS_LOG_TYPE_ERROR, v40, v41, 2u);
    goto LABEL_24;
  }
  [(id)objc_opt_class() getMaxDeltaForSmoothedLocationDate:v9 rawLocations:v10 kernelWidth:a5];
  double v12 = v11;
  [(id)objc_opt_class() getTimeDeltaSignificanceThresholdForSmoothedLocationDate:v9 rawLocations:v10 kernelWidth:a5 smallestSignificantaWeightExponent:a6];
  double v14 = v13;
  int v15 = objc_opt_class();
  uint64_t v16 = [v10 count];
  __int16 v17 = [v9 dateByAddingTimeInterval:v14];
  unint64_t v18 = [v15 findIndexOfLocationInArray:v10 inRange:0 afterDate:v16];

  uint64_t v19 = objc_opt_class();
  uint64_t v20 = [v10 count];
  double v21 = [v9 dateByAddingTimeInterval:-v14];
  unint64_t v22 = [v19 findIndexOfLocationInArray:v10 inRange:0 afterDate:v20];

  if (v22 == v18)
  {
    if (v18 + 1 >= [v10 count]) {
      unint64_t v23 = v18;
    }
    else {
      unint64_t v23 = v18 + 1;
    }
    if (v18) {
      unint64_t v22 = v18 - 1;
    }
    else {
      unint64_t v22 = 0;
    }
    unint64_t v18 = v23;
  }
  if (v22 >= v18)
  {
    v42 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v42, OS_LOG_TYPE_ERROR)) {
      goto LABEL_24;
    }
    __int16 v60 = 0;
    v40 = "Invalid parameter not satisfying: significantRawLocationsLowerBoundIncludedIndex < significantRawLocationsUppe"
          "rBoundExcludedIndex";
    v41 = (uint8_t *)&v60;
    goto LABEL_33;
  }
  double v53 = 3.14159265;
  double v52 = 180.0;
  double v54 = 0.0;
  double v55 = 0.0;
  double v24 = 0.0;
  double v25 = 0.0;
  do
  {
    v26 = objc_opt_class();
    v27 = [v10 objectAtIndexedSubscript:v22];
    v28 = [v27 date];
    [v26 getWeightExponentForSmoothedLocationDate:v9 rawLocationDate:v28 kernelWidth:a5 maxDelta:v12];
    long double v30 = v29;

    if (v30 > a6)
    {
      double v31 = pow(2.71828183, v30);
      double v32 = fabs(v31);
      if (v32 >= INFINITY && v32 <= INFINITY)
      {
        v42 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
        if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          v40 = "Invalid parameter not satisfying: !isinf(weight) && !isnan(weight)";
          v41 = buf;
          goto LABEL_33;
        }
        goto LABEL_24;
      }
      v33 = [v10 objectAtIndexedSubscript:v22];
      [v33 latitude];
      double v35 = v34;

      v36 = [v10 objectAtIndexedSubscript:v22];
      [v36 longitude];
      double v38 = v37 * v53 / v52;
      v63.c[0] = v38 * 0.0;
      v63.c[1] = v38 + 0.0;
      double v54 = v54 + v31;
      double v25 = v25 + v31 * v35;
      __complex_double v39 = cexp(v63);
      double v24 = v24 + v31 * v39.c[0];
      double v55 = v55 + v31 * v39.c[1];
    }
    ++v22;
  }
  while (v18 != v22);
  v64.c[1] = v55;
  double v46 = v25 / v54;
  v64.c[0] = v24;
  double v47 = carg(v64);
  double v48 = fabs(v46);
  if (v48 >= INFINITY && v48 <= INFINITY)
  {
    v42 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v42, OS_LOG_TYPE_ERROR)) {
      goto LABEL_24;
    }
    __int16 v58 = 0;
    v40 = "Invalid parameter not satisfying: !isinf(meanLat) && !isnan(meanLat)";
    v41 = (uint8_t *)&v58;
    goto LABEL_33;
  }
  double v49 = v47 * v52 / v53;
  double v50 = fabs(v49);
  if (v50 >= INFINITY && v50 <= INFINITY)
  {
    v42 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v42, OS_LOG_TYPE_ERROR)) {
      goto LABEL_24;
    }
    __int16 v57 = 0;
    v40 = "Invalid parameter not satisfying: !isinf(meanLong) && !isnan(meanLong)";
    v41 = (uint8_t *)&v57;
    goto LABEL_33;
  }
  RTCommonIsCoordinateValid();
  if (v51 != 0.0)
  {
    v44 = (void *)[objc_alloc(MEMORY[0x1E4F5CE00]) initWithLatitude:v9 longitude:v46 horizontalUncertainty:v49 date:0.0];
    goto LABEL_25;
  }
  v42 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
  {
    __int16 v56 = 0;
    v40 = "Invalid parameter not satisfying: RTCommonIsCoordinateValid(meanLat, meanLong)";
    v41 = (uint8_t *)&v56;
    goto LABEL_33;
  }
LABEL_24:

  v44 = 0;
LABEL_25:

  return v44;
}

+ (id)getNextDateToProcessForDate:(id)a3 firstDateToProcessForVisit:(id)a4 timeIntervalBetweenSmoothedPoints:(double)a5
{
  id v7 = a4;
  double v8 = v7;
  if (a3)
  {
    id v9 = [a3 dateByAddingTimeInterval:a5];
  }
  else
  {
    id v9 = v7;
  }
  id v10 = v9;

  return v10;
}

- (id)getNextDateToProcessForDate:(id)a3
{
  id v4 = a3;
  v5 = [(id)objc_opt_class() getNextDateToProcessForDate:v4 firstDateToProcessForVisit:self->_firstDateToProcessForVisit timeIntervalBetweenSmoothedPoints:self->_timeIntervalBetweenSmoothedPoints];

  return v5;
}

+ (void)disposeObsoleteRawLocations:(id)a3 currentDateToProcess:(id)a4 halfTimeProcessWindow:(double)a5
{
  id v12 = a3;
  id v7 = a4;
  double v8 = objc_opt_class();
  uint64_t v9 = [v12 count];
  id v10 = [v7 dateByAddingTimeInterval:-a5];

  uint64_t v11 = [v8 findIndexOfLocationInArray:v12 inRange:0 afterDate:v9];
  if (v11) {
    [v12 removeObjectsInRange:0, v11];
  }
}

- (void)disposeObsoleteRawLocationsForCurrentDateToProcess:(id)a3 halfTimeProcessWindow:(double)a4
{
  id v6 = a3;
  [(id)objc_opt_class() disposeObsoleteRawLocations:self->_rawLocations currentDateToProcess:v6 halfTimeProcessWindow:a4];
}

- (id)createNewOutputClusterForSmoothedPoints:(id)a3 exit:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  double v8 = [(id)objc_opt_class() createNewOutputClusterForSmoothedPoints:v7 workingVisit:self->_workingVisit exit:v6];

  [v7 removeAllObjects];

  return v8;
}

+ (id)createNewOutputClusterForSmoothedPoints:(id)a3 workingVisit:(id)a4 exit:(id)a5
{
  id v7 = (objc_class *)MEMORY[0x1E4F5CFC8];
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [v7 alloc];
  id v12 = [MEMORY[0x1E4F1C9C8] now];
  if (v8) {
    uint64_t v13 = 3;
  }
  else {
    uint64_t v13 = 1;
  }
  double v14 = [v9 location];
  int v15 = [v9 entry];

  uint64_t v16 = [v11 initWithDate:v12 type:v13 location:v14 entry:v15 exit:v8 dataPointCount:[v10 count] confidence:1.0 placeInference:0];
  __int16 v17 = [RTVisitCluster alloc];
  unint64_t v18 = [[RTVisitLocationPoints alloc] initWithLocations:v10];

  uint64_t v19 = [(RTVisitCluster *)v17 initWithPoints:v18 visit:v16];

  return v19;
}

+ (id)getEndOfGapAtDate:(id)a3 rawLocations:(id)a4 maxGapWithinVisit:(double)a5
{
  id v7 = a3;
  id v8 = a4;
  unint64_t v9 = [objc_opt_class() findIndexOfLocationInArray:v8 inRange:0 afterDate:v7];
  if (!v9)
  {
    if ([v8 count])
    {
      double v14 = [v8 objectAtIndexedSubscript:0];
      int v15 = [v14 date];
      [v15 timeIntervalSinceDate:v7];
      double v17 = v16;

      if (v17 > a5)
      {
        unint64_t v18 = v8;
        unint64_t v19 = 0;
LABEL_11:
        id v12 = [v18 objectAtIndexedSubscript:v19];
        id v11 = [v12 date];
        goto LABEL_12;
      }
    }
  }
  unint64_t v10 = [v8 count];
  id v11 = 0;
  if (v9 && v9 < v10)
  {
    id v12 = [v8 objectAtIndexedSubscript:v9];
    uint64_t v13 = [v12 date];
    if ([v13 isEqualToDate:v7])
    {

      id v11 = 0;
LABEL_12:

      goto LABEL_13;
    }
    uint64_t v20 = [v8 objectAtIndexedSubscript:v9];
    double v21 = [v20 date];
    unint64_t v22 = [v8 objectAtIndexedSubscript:v9 - 1];
    unint64_t v23 = [v22 date];
    [v21 timeIntervalSinceDate:v23];
    double v25 = v24;

    if (v25 > a5)
    {
      unint64_t v18 = v8;
      unint64_t v19 = v9;
      goto LABEL_11;
    }
    id v11 = 0;
  }
LABEL_13:

  return v11;
}

- (id)getEndOfGapAtDate:(id)a3
{
  id v4 = a3;
  v5 = [(id)objc_opt_class() getEndOfGapAtDate:v4 rawLocations:self->_rawLocations maxGapWithinVisit:self->_maxGapInVisit];

  return v5;
}

+ (BOOL)hasRawLocationsNeededToComputeSmoothedLocationAtDate:(id)a3 workingVisitExit:(id)a4 rawLocations:(id)a5 kernelWidth:(double)a6 smallestSignificantWeightExponent:(double)a7
{
  id v11 = a5;
  id v12 = a3;
  uint64_t v13 = v12;
  if (a4)
  {
    double v14 = [v12 earlierDate:a4];
    char v15 = [v14 isEqualToDate:v13];
  }
  else
  {
    [(id)objc_opt_class() getTimeDeltaSignificanceThresholdForSmoothedLocationDate:v12 rawLocations:v11 kernelWidth:a6 smallestSignificantaWeightExponent:a7];
    double v14 = [v13 dateByAddingTimeInterval:];

    uint64_t v13 = [v11 lastObject];
    double v16 = [v13 date];
    double v17 = [v14 earlierDate:v16];
    char v15 = [v17 isEqualToDate:v14];
  }
  return v15;
}

- (id)processCachedPoints
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  v3 = _rt_log_facility_get_os_log(RTLogFacilityVisit);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_debug_impl(&dword_1D9BFA000, v3, OS_LOG_TYPE_DEBUG, "Begin processCachedPoints", buf, 2u);
  }

  id v35 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v5 = [(RTVisitPipelineModuleSmoother *)self getNextDateToProcessForDate:self->_previousProcessedDate];
  while (1)
  {
    id v6 = objc_opt_class();
    id v7 = [(RTVisit *)self->_workingVisit exit];
    LODWORD(v6) = [v6 hasRawLocationsNeededToComputeSmoothedLocationAtDate:v5 workingVisitExit:v7 rawLocations:self->_rawLocations kernelWidth:self->_kernelWidth smallestSignificantWeightExponent:self->_smallestSignificantWeightExponent];

    if (!v6) {
      break;
    }
    id v8 = [(RTVisitPipelineModuleSmoother *)self getEndOfGapAtDate:v5];
    if (v8)
    {
      unint64_t v9 = _rt_log_facility_get_os_log(RTLogFacilityVisit);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v37 = (uint64_t)v8;
        _os_log_debug_impl(&dword_1D9BFA000, v9, OS_LOG_TYPE_DEBUG, "gap detected, endOfGap=%@", buf, 0xCu);
      }

      objc_storeStrong((id *)&self->_nextDateToProcess, v8);
      if ([v4 count])
      {
        unint64_t v10 = [(RTVisitPipelineModuleSmoother *)self createNewOutputClusterForSmoothedPoints:v4 exit:self->_previousProcessedDate];
        [v35 addObject:v10];

        id v11 = _rt_log_facility_get_os_log(RTLogFacilityVisit);
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
        {
          double v25 = [v35 lastObject];
          *(_DWORD *)buf = 138412290;
          uint64_t v37 = (uint64_t)v25;
          _os_log_debug_impl(&dword_1D9BFA000, v11, OS_LOG_TYPE_DEBUG, "adding visit=%@", buf, 0xCu);
        }
      }
      entryBeforeAnyGaps = [(RTVisit *)self->_workingVisit exit];
      if (entryBeforeAnyGaps)
      {
LABEL_13:
      }
      else if (!self->_entryBeforeAnyGaps)
      {
        double v24 = [(RTVisit *)self->_workingVisit entry];
        entryBeforeAnyGaps = self->_entryBeforeAnyGaps;
        self->_entryBeforeAnyGaps = v24;
        goto LABEL_13;
      }
      id v16 = objc_alloc(MEMORY[0x1E4F5CFC8]);
      uint64_t v13 = [MEMORY[0x1E4F1C9C8] now];
      uint64_t v17 = [(RTVisit *)self->_workingVisit type];
      char v15 = [(RTVisit *)self->_workingVisit location];
      nextDateToProcess = self->_nextDateToProcess;
      unint64_t v19 = [(RTVisit *)self->_workingVisit exit];
      uint64_t v20 = (RTVisit *)[v16 initWithDate:v13 type:v17 location:v15 entry:nextDateToProcess exit:v19 dataPointCount:0 confidence:1.0 placeInference:0];
      workingVisit = self->_workingVisit;
      self->_workingVisit = v20;

      goto LABEL_19;
    }
    uint64_t v13 = [(RTVisitPipelineModuleSmoother *)self computeSmoothedPointForDate:v5];
    if (v13) {
      [v4 addObject:v13];
    }
    double v14 = [(RTVisitPipelineModuleSmoother *)self getNextDateToProcessForDate:v5];
    char v15 = self->_nextDateToProcess;
    self->_nextDateToProcess = v14;
LABEL_19:

    previousProcessedDate = self->_previousProcessedDate;
    self->_previousProcessedDate = v5;
    unint64_t v23 = v5;

    v5 = self->_nextDateToProcess;
  }
  v26 = _rt_log_facility_get_os_log(RTLogFacilityVisit);
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v33 = [v4 count];
    *(_DWORD *)buf = 134217984;
    uint64_t v37 = v33;
    _os_log_debug_impl(&dword_1D9BFA000, v26, OS_LOG_TYPE_DEBUG, "Finished generating %lu smoothed points.", buf, 0xCu);
  }

  if ([v4 count])
  {
    v27 = [(RTVisit *)self->_workingVisit exit];
    v28 = [(RTVisitPipelineModuleSmoother *)self createNewOutputClusterForSmoothedPoints:v4 exit:v27];
    [v35 addObject:v28];

    double v29 = _rt_log_facility_get_os_log(RTLogFacilityVisit);
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
    {
      double v34 = [v35 lastObject];
      *(_DWORD *)buf = 138412290;
      uint64_t v37 = (uint64_t)v34;
      _os_log_debug_impl(&dword_1D9BFA000, v29, OS_LOG_TYPE_DEBUG, "adding visit=%@", buf, 0xCu);
    }
  }
  long double v30 = [(RTVisit *)self->_workingVisit exit];

  if (v30)
  {
    [(RTVisitPipelineModuleSmoother *)self resetState];
  }
  else
  {
    [(id)objc_opt_class() getTimeDeltaSignificanceThresholdForSmoothedLocationDate:v5 rawLocations:self->_rawLocations kernelWidth:self->_kernelWidth smallestSignificantaWeightExponent:self->_smallestSignificantWeightExponent];
    -[RTVisitPipelineModuleSmoother disposeObsoleteRawLocationsForCurrentDateToProcess:halfTimeProcessWindow:](self, "disposeObsoleteRawLocationsForCurrentDateToProcess:halfTimeProcessWindow:", v5);
  }
  double v31 = _rt_log_facility_get_os_log(RTLogFacilityVisit);
  if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_debug_impl(&dword_1D9BFA000, v31, OS_LOG_TYPE_DEBUG, "End processCachedPoints", buf, 2u);
  }

  return v35;
}

- (void)resetState
{
  workingVisit = self->_workingVisit;
  self->_workingVisit = 0;

  entryBeforeAnyGaps = self->_entryBeforeAnyGaps;
  self->_entryBeforeAnyGaps = 0;

  rawLocations = self->_rawLocations;
  self->_rawLocations = 0;

  id v6 = self->_workingVisit;
  self->_workingVisit = 0;

  firstDateToProcessForVisit = self->_firstDateToProcessForVisit;
  self->_firstDateToProcessForVisit = 0;

  previousProcessedDate = self->_previousProcessedDate;
  self->_previousProcessedDate = 0;
}

- (void)updateStateWithNewCluster:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  workingVisit = self->_workingVisit;
  if (workingVisit)
  {
    id v6 = [(RTVisit *)workingVisit entry];
    id v7 = [v4 visit];
    id v8 = [v7 entry];
    if ([v6 isEqualToDate:v8])
    {
    }
    else
    {
      entryBeforeAnyGaps = self->_entryBeforeAnyGaps;
      uint64_t v20 = [v4 visit];
      double v21 = [v20 entry];
      LOBYTE(entryBeforeAnyGaps) = [(NSDate *)entryBeforeAnyGaps isEqualToDate:v21];

      if (entryBeforeAnyGaps)
      {
LABEL_9:
        rawLocations = self->_rawLocations;
        char v15 = [v4 points];
        id v16 = [v15 locations];
        [(NSMutableArray *)rawLocations addObjectsFromArray:v16];
        goto LABEL_10;
      }
      id v6 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        int v25 = 136315394;
        v26 = "-[RTVisitPipelineModuleSmoother updateStateWithNewCluster:]";
        __int16 v27 = 1024;
        int v28 = 405;
        _os_log_error_impl(&dword_1D9BFA000, v6, OS_LOG_TYPE_ERROR, "Partial visit not closed before starting new visit. (in %s:%d)", (uint8_t *)&v25, 0x12u);
      }
    }

    goto LABEL_9;
  }
  unint64_t v9 = [v4 points];
  unint64_t v10 = [v9 locations];
  id v11 = [v10 objectAtIndexedSubscript:0];
  id v12 = [v11 date];
  firstDateToProcessForVisit = self->_firstDateToProcessForVisit;
  self->_firstDateToProcessForVisit = v12;

  id v14 = objc_alloc(MEMORY[0x1E4F1CA48]);
  char v15 = [v4 points];
  id v16 = [v15 locations];
  uint64_t v17 = (NSMutableArray *)[v14 initWithArray:v16 copyItems:0];
  unint64_t v18 = self->_rawLocations;
  self->_rawLocations = v17;

LABEL_10:
  unint64_t v23 = [v4 visit];
  double v24 = self->_workingVisit;
  self->_workingVisit = v23;
}

- (id)process:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = _rt_log_facility_get_os_log(RTLogFacilityVisit);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_debug_impl(&dword_1D9BFA000, v5, OS_LOG_TYPE_DEBUG, "Begin smoothing", buf, 2u);
  }

  id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v7 = v4;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v17 objects:v23 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v18;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v18 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void *)(*((void *)&v17 + 1) + 8 * v11);
        uint64_t v13 = _rt_log_facility_get_os_log(RTLogFacilityVisit);
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v22 = v12;
          _os_log_debug_impl(&dword_1D9BFA000, v13, OS_LOG_TYPE_DEBUG, "working on cluster=%@", buf, 0xCu);
        }

        [(RTVisitPipelineModuleSmoother *)self updateStateWithNewCluster:v12];
        id v14 = [(RTVisitPipelineModuleSmoother *)self processCachedPoints];
        [v6 addObjectsFromArray:v14];

        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v17 objects:v23 count:16];
    }
    while (v9);
  }

  char v15 = _rt_log_facility_get_os_log(RTLogFacilityVisit);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_debug_impl(&dword_1D9BFA000, v15, OS_LOG_TYPE_DEBUG, "End smoothing", buf, 2u);
  }

  return v6;
}

- (NSDate)previousProcessedDate
{
  return self->_previousProcessedDate;
}

- (NSDate)nextDateToProcess
{
  return self->_nextDateToProcess;
}

- (NSDate)firstDateToProcessForVisit
{
  return self->_firstDateToProcessForVisit;
}

- (double)timeIntervalBetweenSmoothedPoints
{
  return self->_timeIntervalBetweenSmoothedPoints;
}

- (double)kernelWidth
{
  return self->_kernelWidth;
}

- (double)smallestSignificantWeightExponent
{
  return self->_smallestSignificantWeightExponent;
}

- (double)maxGapInVisit
{
  return self->_maxGapInVisit;
}

- (unint64_t)leftWindowIncludedIndex
{
  return self->_leftWindowIncludedIndex;
}

- (unint64_t)rightWindowExcludedIndex
{
  return self->_rightWindowExcludedIndex;
}

- (unint64_t)outputLocationsCount
{
  return self->_outputLocationsCount;
}

- (NSMutableArray)rawLocations
{
  return self->_rawLocations;
}

- (RTVisit)workingVisit
{
  return self->_workingVisit;
}

- (NSDate)entryBeforeAnyGaps
{
  return self->_entryBeforeAnyGaps;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_entryBeforeAnyGaps, 0);
  objc_storeStrong((id *)&self->_workingVisit, 0);
  objc_storeStrong((id *)&self->_rawLocations, 0);
  objc_storeStrong((id *)&self->_firstDateToProcessForVisit, 0);
  objc_storeStrong((id *)&self->_nextDateToProcess, 0);

  objc_storeStrong((id *)&self->_previousProcessedDate, 0);
}

@end