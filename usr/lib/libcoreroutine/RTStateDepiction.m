@interface RTStateDepiction
+ (BOOL)supportsSecureCoding;
+ (double)quantizeTimeIntervalSinceReferenceDate:(double)a3;
+ (int64_t)maximumNumberOfDataPoints;
- (BOOL)cleanState:(double)a3;
- (BOOL)exemptFromPurge;
- (GEOMapItem)geoMapItem;
- (NSDate)geocodeDate;
- (NSString)customLabel;
- (RTMapItem)mapItem;
- (RTStateDepiction)init;
- (RTStateDepiction)initWithCoder:(id)a3;
- (RTStateDepiction)initWithLocation:(id)a3 type:(int64_t)a4 typeSource:(unint64_t)a5 customLabel:(id)a6 mapItem:(id)a7;
- (RTStateDepictionOneState)clusterState;
- (RTStateModelLocation)location;
- (double)_calculateStandardDeviationForDates:(id)a3 options:(id)a4 error:(id *)a5;
- (double)calculateStandardDeviationWithOptions:(id)a3 error:(id *)a4;
- (double)getAggTimeScaleFactor:(double)a3 predictionWindow:(double)a4;
- (double)getLastVisit;
- (id)_excludeEntryExitOutlierDates:(id)a3 options:(id)a4;
- (id)_filterEntryExitData:(id)a3 options:(id)a4;
- (id)_referenceAdjustEntryExitDates:(id)a3 options:(id)a4;
- (id)description;
- (id)getAggStateStat;
- (id)getAllOneVisits;
- (id)getEarliestLatestEntry;
- (id)getGetWeeklyStats:(double)a3 numOfWeeks:(int)a4 uniqueID:(id)a5;
- (id)getPredState:(double)a3 predictionWindow:(double)a4 numOfWeeks:(int)a5 uniqueID:(id)a6;
- (id)getRecentVisits:(double)a3;
- (id)lastEntyExit;
- (int64_t)numOfDataPts;
- (int64_t)type;
- (unint64_t)getNumOfVisitsOverall;
- (unint64_t)mapItemSource;
- (unint64_t)typeSource;
- (void)_performErrorCorrection;
- (void)_performIntegrityCheck;
- (void)addOneVisitsFromStateDepiction:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)incrementNumOfDataPtsByInteger:(int64_t)a3;
- (void)removeAllVisitsExceptMostRecent;
- (void)removeEntry:(double)a3 exit:(double)a4;
- (void)setClusterState:(id)a3;
- (void)setCustomLabel:(id)a3;
- (void)setGeoMapItem:(id)a3;
- (void)setGeocodeDate:(id)a3;
- (void)setLocation:(id)a3;
- (void)setMapItem:(id)a3;
- (void)setMapItemSource:(unint64_t)a3;
- (void)setNumOfDataPts:(int64_t)a3;
- (void)setType:(int64_t)a3;
- (void)setTypeSource:(unint64_t)a3;
- (void)showState;
- (void)submitEntry:(double)a3 exit:(double)a4;
@end

@implementation RTStateDepiction

- (RTStateDepiction)init
{
  return [(RTStateDepiction *)self initWithLocation:0 type:-1 typeSource:0 customLabel:0 mapItem:0];
}

- (RTStateDepiction)initWithLocation:(id)a3 type:(int64_t)a4 typeSource:(unint64_t)a5 customLabel:(id)a6 mapItem:(id)a7
{
  id v12 = a3;
  id v13 = a6;
  id v14 = a7;
  v19.receiver = self;
  v19.super_class = (Class)RTStateDepiction;
  v15 = [(RTStateDepiction *)&v19 init];
  if (v15)
  {
    v16 = [[RTStateDepictionOneState alloc] initWithLocation:v12 type:a4 typeSource:a5 customLabel:v13 mapItem:v14];
    clusterState = v15->_clusterState;
    v15->_clusterState = v16;

    v15->_numOfDataPts = 0;
  }

  return v15;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  [(RTStateDepiction *)self _performIntegrityCheck];
  [v4 encodeObject:self->_clusterState forKey:@"clusterState"];
  [v4 encodeInteger:self->_numOfDataPts forKey:@"numOfDataPts"];
}

- (RTStateDepiction)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)RTStateDepiction;
  v5 = [(RTStateDepiction *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"clusterState"];
    clusterState = v5->_clusterState;
    v5->_clusterState = (RTStateDepictionOneState *)v6;

    v5->_numOfDataPts = [v4 decodeIntegerForKey:@"numOfDataPts"];
    [(RTStateDepiction *)v5 _performErrorCorrection];
  }

  return v5;
}

+ (int64_t)maximumNumberOfDataPoints
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  double v2 = (CFAbsoluteTimeGetCurrent() + -380675623.0) / 300.0;
  if (v2 >= 2147483650.0) {
    int64_t v3 = 2147483646;
  }
  else {
    int64_t v3 = (int)v2;
  }
  id v4 = _rt_log_facility_get_os_log(RTLogFacilityStateModel);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    int v6 = 134217984;
    int64_t v7 = v3;
    _os_log_debug_impl(&dword_1D9BFA000, v4, OS_LOG_TYPE_DEBUG, "maximum data point count, %ld", (uint8_t *)&v6, 0xCu);
  }

  return v3;
}

- (void)_performIntegrityCheck
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  int64_t v3 = +[RTStateDepiction maximumNumberOfDataPoints];
  if ([(RTStateDepiction *)self numOfDataPts] > v3)
  {
    id v4 = _rt_log_facility_get_os_log(RTLogFacilityStateModel);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      int v5 = 134218240;
      int64_t v6 = [(RTStateDepiction *)self numOfDataPts];
      __int16 v7 = 2048;
      int64_t v8 = v3;
      _os_log_error_impl(&dword_1D9BFA000, v4, OS_LOG_TYPE_ERROR, "data point count, %ld, exceeded maximum, %ld", (uint8_t *)&v5, 0x16u);
    }

    [(RTStateDepiction *)self _performErrorCorrection];
  }
}

- (void)_performErrorCorrection
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  int64_t v3 = +[RTStateDepiction maximumNumberOfDataPoints];
  if ([(RTStateDepiction *)self numOfDataPts] > v3)
  {
    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id v4 = [(RTStateDepiction *)self clusterState];
    int v5 = [v4 histEntryExit_s];

    uint64_t v6 = [v5 countByEnumeratingWithState:&v22 objects:v30 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      unint64_t v8 = 0;
      uint64_t v9 = *(void *)v23;
      while (2)
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v23 != v9) {
            objc_enumerationMutation(v5);
          }
          v11 = *(void **)(*((void *)&v22 + 1) + 8 * i);
          [v11 entry_s];
          if (v12 != -1.0)
          {
            [v11 exit_s];
            if (v13 != -1.0)
            {
              [v11 exit_s];
              double v15 = v14;
              [v11 entry_s];
              double v17 = (v15 - v16) / 600.0;
              if (v17 > (double)~v8)
              {
                v21 = _rt_log_facility_get_os_log(RTLogFacilityStateModel);
                if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
                {
                  *(_WORD *)buf = 0;
                  _os_log_error_impl(&dword_1D9BFA000, v21, OS_LOG_TYPE_ERROR, "estimating data point count caused an overflow", buf, 2u);
                }

                [(RTStateDepiction *)self setNumOfDataPts:0];
                return;
              }
              unint64_t v8 = (unint64_t)(v17 + (double)v8);
            }
          }
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v22 objects:v30 count:16];
        if (v7) {
          continue;
        }
        break;
      }

      if (v8 > v3)
      {
        v18 = _rt_log_facility_get_os_log(RTLogFacilityStateModel);
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 134218240;
          unint64_t v27 = v8;
          __int16 v28 = 2048;
          int64_t v29 = v3;
          _os_log_error_impl(&dword_1D9BFA000, v18, OS_LOG_TYPE_ERROR, "estimated data point count, %llu, exceeded maximum, %ld", buf, 0x16u);
        }

        objc_super v19 = self;
        uint64_t v20 = 0;
        goto LABEL_22;
      }
    }
    else
    {

      LODWORD(v8) = 0;
    }
    uint64_t v20 = (int)v8;
    objc_super v19 = self;
LABEL_22:
    [(RTStateDepiction *)v19 setNumOfDataPts:v20];
  }
}

+ (double)quantizeTimeIntervalSinceReferenceDate:(double)a3
{
  return floor(a3 / 60.0) * 60.0;
}

- (void)submitEntry:(double)a3 exit:(double)a4
{
  +[RTStateDepiction quantizeTimeIntervalSinceReferenceDate:a3];
  double v7 = v6;
  +[RTStateDepiction quantizeTimeIntervalSinceReferenceDate:a4];
  v11 = [[RTStateModelEntryExit alloc] initWithEntry:v7 exit:v8];
  uint64_t v9 = [(RTStateDepiction *)self clusterState];
  v10 = [v9 histEntryExit_s];
  [v10 addObject:v11];
}

- (void)removeEntry:(double)a3 exit:(double)a4
{
  uint64_t v10 = 0;
  v11 = &v10;
  uint64_t v12 = 0x3032000000;
  double v13 = __Block_byref_object_copy__121;
  double v14 = __Block_byref_object_dispose__121;
  double v15 = [[RTStateModelEntryExit alloc] initWithEntry:a3 exit:a4];
  int v5 = [(RTStateDepiction *)self clusterState];
  double v6 = [v5 histEntryExit_s];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __37__RTStateDepiction_removeEntry_exit___block_invoke;
  v9[3] = &unk_1E6B958B0;
  v9[4] = &v10;
  [v6 enumerateObjectsUsingBlock:v9];

  double v7 = [(RTStateDepiction *)self clusterState];
  double v8 = [v7 histEntryExit_s];
  [v8 removeObject:v11[5]];

  _Block_object_dispose(&v10, 8);
}

void __37__RTStateDepiction_removeEntry_exit___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v7 = a2;
  if ([v7 isEqual:*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40)])
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
    *a4 = 1;
  }
}

- (void)setLocation:(id)a3
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int v5 = [(RTStateDepiction *)self clusterState];
  [v5 setLocation:v4];

  double v6 = [(RTStateDepiction *)self clusterState];
  id v7 = [v6 mapItem];
  char v8 = [v7 source];

  if (v8)
  {
    v34 = [(RTStateDepiction *)self clusterState];
    uint64_t v9 = [v34 mapItem];
    uint64_t v10 = [v9 location];
    [v10 latitude];
    v11 = [(RTStateDepiction *)self clusterState];
    uint64_t v12 = [v11 mapItem];
    double v13 = [v12 location];
    [v13 longitude];
    double v14 = [(RTStateDepiction *)self clusterState];
    double v15 = [v14 location];
    [v15 Latitude_deg];
    double v16 = [(RTStateDepiction *)self clusterState];
    double v17 = [v16 location];
    [v17 Longitude_deg];
    RTCommonCalculateDistanceHighPrecision();
    double v19 = v18;

    if (v19 > 100.0)
    {
      uint64_t v20 = _rt_log_facility_get_os_log(RTLogFacilityStateModel);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
      {
        long long v22 = [(RTStateDepiction *)self clusterState];
        long long v23 = [v22 mapItem];
        long long v24 = [v23 location];
        [v24 latitude];
        uint64_t v26 = v25;
        unint64_t v27 = [(RTStateDepiction *)self clusterState];
        __int16 v28 = [v27 mapItem];
        int64_t v29 = [v28 location];
        [v29 longitude];
        uint64_t v31 = v30;
        v32 = [(RTStateDepiction *)self clusterState];
        v33 = [v32 location];
        *(_DWORD *)buf = 134284291;
        uint64_t v36 = v26;
        __int16 v37 = 2049;
        uint64_t v38 = v31;
        __int16 v39 = 2112;
        v40 = v33;
        __int16 v41 = 2049;
        double v42 = v19;
        _os_log_debug_impl(&dword_1D9BFA000, v20, OS_LOG_TYPE_DEBUG, "underlying location moved from, <%{private}f, %{private}f>, to, %@. The new distance from the location to the mapItem center, %{private}f, resulted in marking the geocoded mapItem dirty", buf, 0x2Au);
      }
      v21 = [(RTStateDepiction *)self clusterState];
      [v21 setGeocodeDate:0];
    }
  }
}

- (RTStateModelLocation)location
{
  double v2 = [(RTStateDepiction *)self clusterState];
  int64_t v3 = [v2 location];

  return (RTStateModelLocation *)v3;
}

- (void)incrementNumOfDataPtsByInteger:(int64_t)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (a3 >= 1)
  {
    int64_t v5 = +[RTStateDepiction maximumNumberOfDataPoints];
    if (v5 - [(RTStateDepiction *)self numOfDataPts] >= a3)
    {
      int64_t v7 = [(RTStateDepiction *)self numOfDataPts] + a3;
      [(RTStateDepiction *)self setNumOfDataPts:v7];
    }
    else
    {
      double v6 = _rt_log_facility_get_os_log(RTLogFacilityStateModel);
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        int v8 = 134218496;
        int64_t v9 = [(RTStateDepiction *)self numOfDataPts];
        __int16 v10 = 2048;
        int64_t v11 = v5;
        __int16 v12 = 2048;
        int64_t v13 = a3;
        _os_log_error_impl(&dword_1D9BFA000, v6, OS_LOG_TYPE_ERROR, "data point count, %ld, exceeded maximum, %ld, after increment, %ld", (uint8_t *)&v8, 0x20u);
      }

      [(RTStateDepiction *)self setNumOfDataPts:0x7FFFFFFFLL];
      [(RTStateDepiction *)self _performErrorCorrection];
    }
  }
}

- (GEOMapItem)geoMapItem
{
  double v2 = [(RTStateDepiction *)self clusterState];
  int64_t v3 = [v2 geoMapItem];

  return (GEOMapItem *)v3;
}

- (void)setGeoMapItem:(id)a3
{
  id v4 = a3;
  id v5 = [(RTStateDepiction *)self clusterState];
  [v5 setGeoMapItem:v4];
}

- (RTMapItem)mapItem
{
  double v2 = [(RTStateDepiction *)self clusterState];
  int64_t v3 = [v2 mapItem];

  return (RTMapItem *)v3;
}

- (void)setMapItem:(id)a3
{
  id v4 = a3;
  id v5 = [(RTStateDepiction *)self clusterState];
  [v5 setMapItem:v4];
}

- (unint64_t)mapItemSource
{
  double v2 = [(RTStateDepiction *)self clusterState];
  unint64_t v3 = [v2 mapItemSource];

  return v3;
}

- (void)setMapItemSource:(unint64_t)a3
{
  id v4 = [(RTStateDepiction *)self clusterState];
  [v4 setMapItemSource:a3];
}

- (int64_t)type
{
  double v2 = [(RTStateDepiction *)self clusterState];
  int64_t v3 = [v2 type];

  return v3;
}

- (void)setType:(int64_t)a3
{
  id v4 = [(RTStateDepiction *)self clusterState];
  [v4 setType:a3];
}

- (unint64_t)typeSource
{
  double v2 = [(RTStateDepiction *)self clusterState];
  unint64_t v3 = [v2 typeSource];

  return v3;
}

- (void)setTypeSource:(unint64_t)a3
{
  id v4 = [(RTStateDepiction *)self clusterState];
  [v4 setTypeSource:a3];
}

- (NSDate)geocodeDate
{
  double v2 = [(RTStateDepiction *)self clusterState];
  unint64_t v3 = [v2 geocodeDate];

  return (NSDate *)v3;
}

- (void)setGeocodeDate:(id)a3
{
  id v4 = a3;
  id v5 = [(RTStateDepiction *)self clusterState];
  [v5 setGeocodeDate:v4];
}

- (NSString)customLabel
{
  double v2 = [(RTStateDepiction *)self clusterState];
  unint64_t v3 = [v2 customLabel];

  return (NSString *)v3;
}

- (void)setCustomLabel:(id)a3
{
  id v4 = a3;
  id v5 = [(RTStateDepiction *)self clusterState];
  [v5 setCustomLabel:v4];
}

- (double)getAggTimeScaleFactor:(double)a3 predictionWindow:(double)a4
{
  double result = 1.0;
  if (a3 > 0.0 && a4 > 0.0 && a4 + 0.000001 >= a3) {
    return a3 / (a4 * 0.5) + 0.2;
  }
  return result;
}

- (double)getLastVisit
{
  double v2 = [(RTStateDepiction *)self lastEntyExit];
  unint64_t v3 = v2;
  if (v2)
  {
    [v2 exit_s];
    double v5 = v4;
  }
  else
  {
    double v5 = -1.0;
  }

  return v5;
}

- (id)lastEntyExit
{
  uint64_t v7 = 0;
  int v8 = &v7;
  uint64_t v9 = 0x3032000000;
  __int16 v10 = __Block_byref_object_copy__121;
  int64_t v11 = __Block_byref_object_dispose__121;
  id v12 = 0;
  double v2 = [(RTStateDepiction *)self clusterState];
  unint64_t v3 = [v2 histEntryExit_s];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __32__RTStateDepiction_lastEntyExit__block_invoke;
  v6[3] = &unk_1E6B9A440;
  v6[4] = &v7;
  [v3 enumerateObjectsUsingBlock:v6];

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __32__RTStateDepiction_lastEntyExit__block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  double v6 = *(void **)(v5 + 40);
  id v10 = v4;
  if (v6)
  {
    [v6 exit_s];
    double v8 = v7;
    [v10 exit_s];
    if (v8 >= v9) {
      goto LABEL_5;
    }
    uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  }
  objc_storeStrong((id *)(v5 + 40), a2);
LABEL_5:
}

- (BOOL)cleanState:(double)a3
{
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  double v6 = [(RTStateDepiction *)self clusterState];
  double v7 = [v6 histEntryExit_s];
  uint64_t v14 = MEMORY[0x1E4F143A8];
  uint64_t v15 = 3221225472;
  double v16 = __31__RTStateDepiction_cleanState___block_invoke;
  double v17 = &unk_1E6B9A0D0;
  double v19 = a3;
  id v8 = v5;
  id v18 = v8;
  [v7 enumerateObjectsUsingBlock:&v14];

  double v9 = [(RTStateDepiction *)self clusterState];
  [v9 setHistEntryExit_s:v8];

  if ([(RTStateDepiction *)self exemptFromPurge])
  {
    BOOL v10 = 0;
  }
  else
  {
    int64_t v11 = [(RTStateDepiction *)self clusterState];
    id v12 = [v11 histEntryExit_s];
    BOOL v10 = [v12 count] == 0;
  }
  return v10;
}

void __31__RTStateDepiction_cleanState___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  [v4 exit_s];
  if (v3 >= *(double *)(a1 + 40)) {
    [*(id *)(a1 + 32) addObject:v4];
  }
}

- (id)getRecentVisits:(double)a3
{
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  double v6 = [(RTStateDepiction *)self clusterState];
  double v7 = [v6 histEntryExit_s];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __36__RTStateDepiction_getRecentVisits___block_invoke;
  v12[3] = &unk_1E6B9A468;
  double v14 = a3;
  v12[4] = self;
  id v8 = v5;
  id v13 = v8;
  [v7 enumerateObjectsUsingBlock:v12];

  double v9 = v13;
  id v10 = v8;

  return v10;
}

void __36__RTStateDepiction_getRecentVisits___block_invoke(uint64_t a1, void *a2)
{
  id v8 = a2;
  [v8 entry_s];
  if (v3 > *(double *)(a1 + 48))
  {
    id v4 = [RTStateModelOneVisit alloc];
    id v5 = [*(id *)(a1 + 32) clusterState];
    double v6 = [v5 location];
    double v7 = [(RTStateModelOneVisit *)v4 initWithLocation:v6 entryExit:v8 andNumOfDataPts:0];

    [*(id *)(a1 + 40) addObject:v7];
  }
}

- (id)getAllOneVisits
{
  double v2 = [(RTStateDepiction *)self clusterState];
  double v3 = [v2 histEntryExit_s];

  return v3;
}

- (void)addOneVisitsFromStateDepiction:(id)a3
{
  id v4 = [a3 getAllOneVisits];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __51__RTStateDepiction_addOneVisitsFromStateDepiction___block_invoke;
  v7[3] = &unk_1E6B90B78;
  v7[4] = self;
  [v4 enumerateObjectsUsingBlock:v7];
  id v5 = [(RTStateDepiction *)self clusterState];
  double v6 = [v5 histEntryExit_s];
  [v6 sortUsingComparator:&__block_literal_global_93];
}

void __51__RTStateDepiction_addOneVisitsFromStateDepiction___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  [v3 entry_s];
  double v6 = v5;
  [v3 exit_s];
  [v4 submitEntry:v6 exit:v7];
  id v8 = _rt_log_facility_get_os_log(RTLogFacilityStateModel);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    int v9 = 138412290;
    id v10 = v3;
    _os_log_debug_impl(&dword_1D9BFA000, v8, OS_LOG_TYPE_DEBUG, "adding visit, %@, to newly consolidated cluster", (uint8_t *)&v9, 0xCu);
  }
}

uint64_t __51__RTStateDepiction_addOneVisitsFromStateDepiction___block_invoke_258(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  [a2 entry_s];
  double v6 = v5;
  [v4 entry_s];
  double v8 = v7;

  if (v6 >= v8) {
    return 1;
  }
  else {
    return -1;
  }
}

- (unint64_t)getNumOfVisitsOverall
{
  double v2 = [(RTStateDepiction *)self clusterState];
  id v3 = [v2 histEntryExit_s];
  unint64_t v4 = [v3 count];

  return v4;
}

- (id)getAggStateStat
{
  id v3 = objc_alloc_init(RTStateDepictionAggStateStats);
  uint64_t v16 = 0;
  double v17 = (double *)&v16;
  uint64_t v18 = 0x2020000000;
  unint64_t v19 = 0xBFF0000000000000;
  uint64_t v12 = 0;
  id v13 = (double *)&v12;
  uint64_t v14 = 0x2020000000;
  unint64_t v15 = 0xBFF0000000000000;
  unint64_t v4 = [(RTStateDepiction *)self clusterState];
  double v5 = [v4 histEntryExit_s];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __35__RTStateDepiction_getAggStateStat__block_invoke;
  v11[3] = &unk_1E6B9A120;
  v11[4] = &v12;
  v11[5] = &v16;
  [v5 enumerateObjectsUsingBlock:v11];

  [(RTStateDepictionAggStateStats *)v3 setAggregateTime_s:v13[3]];
  [(RTStateDepictionAggStateStats *)v3 setLastExit_s:v17[3]];
  double v6 = [(RTStateDepiction *)self clusterState];
  double v7 = [v6 location];
  [(RTStateDepictionAggStateStats *)v3 setLocation:v7];

  double v8 = [(RTStateDepiction *)self clusterState];
  int v9 = [v8 histEntryExit_s];
  -[RTStateDepictionAggStateStats setNumOfEntries:](v3, "setNumOfEntries:", [v9 count]);

  _Block_object_dispose(&v12, 8);
  _Block_object_dispose(&v16, 8);

  return v3;
}

void __35__RTStateDepiction_getAggStateStat__block_invoke(uint64_t a1, void *a2)
{
  id v8 = a2;
  [v8 exit_s];
  double v4 = v3;
  [v8 entry_s];
  *(double *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = v4
                                                              - v5
                                                              + *(double *)(*(void *)(*(void *)(a1 + 32) + 8)
                                                                          + 24);
  [v8 exit_s];
  if (v6 > *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 24))
  {
    [v8 exit_s];
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v7;
  }
}

- (void)showState
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  uint64_t v7 = 0;
  id v8 = (double *)&v7;
  uint64_t v9 = 0x2020000000;
  uint64_t v10 = 0;
  double v2 = [(RTStateDepiction *)self clusterState];
  double v3 = [v2 histEntryExit_s];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __29__RTStateDepiction_showState__block_invoke;
  v6[3] = &unk_1E6B9A440;
  v6[4] = &v7;
  [v3 enumerateObjectsUsingBlock:v6];

  double v4 = _rt_log_facility_get_os_log(RTLogFacilityStateModel);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    double v5 = v8[3] / 60.0;
    *(_DWORD *)buf = 134217984;
    double v12 = v5;
    _os_log_debug_impl(&dword_1D9BFA000, v4, OS_LOG_TYPE_DEBUG, "total duration in state, %.2f [min]", buf, 0xCu);
  }

  _Block_object_dispose(&v7, 8);
}

void __29__RTStateDepiction_showState__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  double v6 = _rt_log_facility_get_os_log(RTLogFacilityStateModel);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    int v10 = 134218242;
    uint64_t v11 = a3 + 1;
    __int16 v12 = 2112;
    id v13 = v5;
    _os_log_debug_impl(&dword_1D9BFA000, v6, OS_LOG_TYPE_DEBUG, "visit %lu, %@", (uint8_t *)&v10, 0x16u);
  }

  [v5 exit_s];
  double v8 = v7;
  [v5 entry_s];
  *(double *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = v8
                                                              - v9
                                                              + *(double *)(*(void *)(*(void *)(a1 + 32) + 8)
                                                                          + 24);
}

- (id)getEarliestLatestEntry
{
  uint64_t v12 = 0;
  id v13 = (double *)&v12;
  uint64_t v14 = 0x2020000000;
  uint64_t v15 = 0x426D1A94A2000000;
  uint64_t v8 = 0;
  double v9 = (double *)&v8;
  uint64_t v10 = 0x2020000000;
  unint64_t v11 = 0xC26D1A94A2000000;
  double v2 = [(RTStateDepiction *)self clusterState];
  double v3 = [v2 histEntryExit_s];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __42__RTStateDepiction_getEarliestLatestEntry__block_invoke;
  v7[3] = &unk_1E6B9A120;
  v7[4] = &v12;
  void v7[5] = &v8;
  [v3 enumerateObjectsUsingBlock:v7];

  double v4 = [RTStateModelEarliestLatestEl alloc];
  id v5 = [(RTStateModelEarliestLatestEl *)v4 initWithEarliest:v13[3] andLatest:v9[3]];
  _Block_object_dispose(&v8, 8);
  _Block_object_dispose(&v12, 8);

  return v5;
}

void __42__RTStateDepiction_getEarliestLatestEntry__block_invoke(uint64_t a1, void *a2)
{
  id v7 = a2;
  [v7 entry_s];
  if (v3 < *(double *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    [v7 entry_s];
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = v4;
  }
  [v7 exit_s];
  if (v5 > *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 24))
  {
    [v7 entry_s];
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v6;
  }
}

- (id)getGetWeeklyStats:(double)a3 numOfWeeks:(int)a4 uniqueID:(id)a5
{
  uint64_t v93 = *MEMORY[0x1E4F143B8];
  id v65 = a5;
  uint64_t v8 = [(RTStateDepiction *)self clusterState];
  double v9 = [v8 histEntryExit_s];
  [v9 sortUsingComparator:&__block_literal_global_263];

  double Current = CFAbsoluteTimeGetCurrent();
  unint64_t v11 = [(RTStateDepiction *)self clusterState];
  uint64_t v12 = [v11 histEntryExit_s];
  id v13 = [v12 objectEnumerator];

  uint64_t v14 = [v13 nextObject];
  double v63 = (double)a4;
  double v15 = Current + (double)a4 * -604800.0 + -86400.0;
  double v64 = 1.0e12;
  if (v14)
  {
    while (1)
    {
      [v14 exit_s];
      if (v16 >= v15) {
        break;
      }
      uint64_t v17 = [v13 nextObject];

      uint64_t v14 = (void *)v17;
      if (!v17) {
        goto LABEL_4;
      }
    }
    [v14 entry_s];
    double v64 = v19;
    char v18 = 0;
  }
  else
  {
LABEL_4:
    char v18 = 1;
  }
  uint64_t v20 = [(RTStateDepiction *)self clusterState];
  v21 = [v20 histEntryExit_s];
  v66 = [v21 lastObject];

  if (v66) {
    [v66 exit_s];
  }
  else {
    *(double *)&unint64_t v22 = -1.0e12;
  }
  double v62 = *(double *)&v22;
  id v68 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v67 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v23 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if (v18)
  {
LABEL_35:
    uint64_t v14 = 0;
  }
  else
  {
    int v24 = 0;
    while (1)
    {
      [v14 exit_s];
      if (v25 >= a3) {
        break;
      }
      double v26 = v15 + 86400.0;
      if (v14)
      {
        BOOL v27 = 0;
        double v28 = 0.0;
        do
        {
          [v14 entry_s];
          BOOL v30 = v27 || v29 >= v26;
          if (v27 || v29 >= v26) {
            break;
          }
          [v14 exit_s];
          if (v15 >= v31)
          {
            uint64_t v41 = [v13 nextObject];

            __int16 v37 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
            if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 136315394;
              *(void *)&uint8_t buf[4] = "-[RTStateDepiction getGetWeeklyStats:numOfWeeks:uniqueID:]";
              *(_WORD *)&buf[12] = 1024;
              *(_DWORD *)&buf[14] = 813;
              _os_log_error_impl(&dword_1D9BFA000, v37, OS_LOG_TYPE_ERROR, "HomeWork detection entry is inconsistent - should not happen (in %s:%d)", buf, 0x12u);
            }
            BOOL v27 = 0;
            uint64_t v14 = (void *)v41;
          }
          else
          {
            v32 = NSNumber;
            [v14 exit_s];
            double v34 = v33;
            [v14 entry_s];
            double v36 = v34 - v35;
            *(float *)&double v36 = v36;
            __int16 v37 = [v32 numberWithFloat:v36];
            [v23 addObject:v37];
            [v14 entry_s];
            if (v15 >= v38)
            {
              double v40 = v15;
            }
            else
            {
              [v14 entry_s];
              double v40 = v39;
              ++v24;
            }
            [v14 exit_s];
            BOOL v27 = v26 < v42;
            if (v26 < v42)
            {
              double v44 = v15 + 86400.0;
            }
            else
            {
              [v14 exit_s];
              double v44 = v43;
              uint64_t v45 = [v13 nextObject];

              uint64_t v14 = (void *)v45;
            }
            double v28 = v28 + v44 - v40;
          }
        }
        while (v14);
        char v46 = !v30;
      }
      else
      {
        char v46 = 1;
        double v28 = 0.0;
      }
      v47 = [NSNumber numberWithDouble:v28];
      [v68 addObject:v47];

      if ([v68 count] == 7)
      {
        *(void *)buf = 0;
        *(void *)&buf[8] = buf;
        *(void *)&buf[16] = 0x2020000000;
        uint64_t v92 = 0;
        uint64_t v87 = 0;
        v88 = &v87;
        uint64_t v89 = 0x2020000000;
        uint64_t v90 = 0;
        uint64_t v83 = 0;
        v84 = (int *)&v83;
        uint64_t v85 = 0x2020000000;
        LODWORD(v86) = 0;
        v82[0] = MEMORY[0x1E4F143A8];
        v82[1] = 3221225472;
        v82[2] = __58__RTStateDepiction_getGetWeeklyStats_numOfWeeks_uniqueID___block_invoke_265;
        v82[3] = &unk_1E6B9A0A8;
        v82[4] = &v83;
        v82[5] = buf;
        v82[6] = &v87;
        [v68 enumerateObjectsUsingBlock:v82];
        if (v84[6] < 1)
        {
          double v49 = -1.0;
          double v48 = 0.0;
        }
        else
        {
          double v48 = *(double *)(*(void *)&buf[8] + 24) / 7.0;
          double v49 = sqrt(fabs(*((double *)v88 + 3) / 7.0 - v48 * v48));
        }
        v50 = objc_alloc_init(RTStateWeeklyStatisticsEl);
        [(RTStateWeeklyStatisticsEl *)v50 setAvgAggTime_s:v48];
        [(RTStateWeeklyStatisticsEl *)v50 setStdAggTime_s:v49];
        [(RTStateWeeklyStatisticsEl *)v50 setDaysPerWeek:(double)v84[6]];
        [(RTStateWeeklyStatisticsEl *)v50 setNumOfClustEntPerWeek:(double)v24];
        [v67 addObject:v50];
        [v68 removeAllObjects];

        _Block_object_dispose(&v83, 8);
        _Block_object_dispose(&v87, 8);
        _Block_object_dispose(buf, 8);
        int v24 = 0;
      }
      double v15 = v15 + 86400.0;
      if (v46) {
        goto LABEL_35;
      }
    }
  }
  v51 = objc_alloc_init(RTStateWeeklyStatisticsEl);
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x2020000000;
  LODWORD(v92) = 0;
  uint64_t v87 = 0;
  v88 = &v87;
  uint64_t v89 = 0x2020000000;
  LODWORD(v90) = 0;
  uint64_t v83 = 0;
  v84 = (int *)&v83;
  uint64_t v85 = 0x2020000000;
  uint64_t v86 = 0;
  uint64_t v78 = 0;
  v79 = (double *)&v78;
  uint64_t v80 = 0x2020000000;
  uint64_t v81 = 0;
  uint64_t v74 = 0;
  v75 = (int *)&v74;
  uint64_t v76 = 0x2020000000;
  int v77 = 0;
  uint64_t v70 = 0;
  v71 = (double *)&v70;
  uint64_t v72 = 0x2020000000;
  uint64_t v73 = 0;
  v69[0] = MEMORY[0x1E4F143A8];
  v69[1] = 3221225472;
  v69[2] = __58__RTStateDepiction_getGetWeeklyStats_numOfWeeks_uniqueID___block_invoke_2;
  v69[3] = &unk_1E6B9A490;
  v69[4] = &v87;
  v69[5] = &v83;
  v69[6] = &v78;
  v69[7] = &v74;
  v69[8] = &v70;
  v69[9] = buf;
  [v67 enumerateObjectsUsingBlock:v69];
  int v52 = *((_DWORD *)v88 + 6);
  if (v52 < 1 || ((double v53 = (v62 - v64) / 604800.0, (double)v52 / v63 > 0.6) ? (v54 = v53 <= 2.0) : (v54 = 1), v54))
  {
    [(RTStateWeeklyStatisticsEl *)v51 setAvgAggTime_s:0.0];
    [(RTStateWeeklyStatisticsEl *)v51 setStdAggTime_s:-1.0];
    [(RTStateWeeklyStatisticsEl *)v51 setDaysPerWeek:0.0];
    [(RTStateWeeklyStatisticsEl *)v51 setNumOfClustEntPerWeek:0.0];
    goto LABEL_45;
  }
  [(RTStateWeeklyStatisticsEl *)v51 setAvgAggTime_s:*((double *)v84 + 3) / (double)v52];
  [(RTStateWeeklyStatisticsEl *)v51 setStdAggTime_s:v79[3] / (double)*((int *)v88 + 6)];
  [(RTStateWeeklyStatisticsEl *)v51 setDaysPerWeek:(double)v75[6] / (double)*((int *)v88 + 6)];
  [(RTStateWeeklyStatisticsEl *)v51 setNumOfClustEntPerWeek:v71[3] / (double)*((int *)v88 + 6)];
  [v23 sortUsingComparator:&__block_literal_global_268];
  unint64_t v55 = [v23 count];
  double v56 = floor(v53 * 0.5);
  if (v56 > (double)v55) {
    goto LABEL_51;
  }
  if (v56 <= 1.0)
  {
    if ((unint64_t)[v23 count] >= 3)
    {
      v57 = [v23 objectAtIndex:2];
      [v57 floatValue];
      [(RTStateWeeklyStatisticsEl *)v51 setTopMedian:v59];
      goto LABEL_50;
    }
    if ([v23 count])
    {
      v57 = [v23 objectAtIndex:[v23 count] - 1];
      [v57 floatValue];
      [(RTStateWeeklyStatisticsEl *)v51 setTopMedian:v60];
      goto LABEL_50;
    }
LABEL_45:
    [(RTStateWeeklyStatisticsEl *)v51 setTopMedian:0.0];
    goto LABEL_51;
  }
  v57 = [v23 objectAtIndex:(unint64_t)v56];
  [v57 floatValue];
  [(RTStateWeeklyStatisticsEl *)v51 setTopMedian:v58];
LABEL_50:

LABEL_51:
  [(RTStateWeeklyStatisticsEl *)v51 setStateUUID:v65];
  _Block_object_dispose(&v70, 8);
  _Block_object_dispose(&v74, 8);
  _Block_object_dispose(&v78, 8);
  _Block_object_dispose(&v83, 8);
  _Block_object_dispose(&v87, 8);
  _Block_object_dispose(buf, 8);

  return v51;
}

uint64_t __58__RTStateDepiction_getGetWeeklyStats_numOfWeeks_uniqueID___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  [a2 entry_s];
  double v6 = v5;
  [v4 entry_s];
  double v8 = v7;

  if (v6 >= v8) {
    return 1;
  }
  else {
    return -1;
  }
}

void __58__RTStateDepiction_getGetWeeklyStats_numOfWeeks_uniqueID___block_invoke_265(void *a1, void *a2)
{
  id v8 = a2;
  [v8 doubleValue];
  if (v3 > 0.0)
  {
    ++*(_DWORD *)(*(void *)(a1[4] + 8) + 24);
    [v8 doubleValue];
    *(double *)(*(void *)(a1[5] + 8) + 24) = v4 + *(double *)(*(void *)(a1[5] + 8) + 24);
    [v8 doubleValue];
    double v6 = v5;
    [v8 doubleValue];
    *(double *)(*(void *)(a1[6] + 8) + 24) = *(double *)(*(void *)(a1[6] + 8) + 24) + v6 * v7;
  }
}

void __58__RTStateDepiction_getGetWeeklyStats_numOfWeeks_uniqueID___block_invoke_2(void *a1, void *a2)
{
  id v8 = a2;
  [v8 stdAggTime_s];
  if (v3 <= 0.0)
  {
    ++*(_DWORD *)(*(void *)(a1[9] + 8) + 24);
  }
  else
  {
    ++*(_DWORD *)(*(void *)(a1[4] + 8) + 24);
    [v8 avgAggTime_s];
    *(double *)(*(void *)(a1[5] + 8) + 24) = v4 + *(double *)(*(void *)(a1[5] + 8) + 24);
    [v8 stdAggTime_s];
    *(double *)(*(void *)(a1[6] + 8) + 24) = v5 + *(double *)(*(void *)(a1[6] + 8) + 24);
    [v8 daysPerWeek];
    *(_DWORD *)(*(void *)(a1[7] + 8) + 24) = (int)(v6 + (double)*(int *)(*(void *)(a1[7] + 8) + 24));
    [v8 numOfClustEntPerWeek];
    *(double *)(*(void *)(a1[8] + 8) + 24) = v7 + *(double *)(*(void *)(a1[8] + 8) + 24);
  }
}

uint64_t __58__RTStateDepiction_getGetWeeklyStats_numOfWeeks_uniqueID___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  [a2 floatValue];
  float v6 = v5;
  [v4 floatValue];
  float v8 = v7;

  if (v6 <= v8) {
    return 1;
  }
  else {
    return -1;
  }
}

- (id)getPredState:(double)a3 predictionWindow:(double)a4 numOfWeeks:(int)a5 uniqueID:(id)a6
{
  id v103 = a6;
  v110 = objc_alloc_init(RTStateDepcitionOneStatePred);
  int v104 = a5;
  uint64_t v10 = -a5;
  uint64_t v11 = 7 * (int)v10;
  double v111 = a3;
  +[RTStateModelAlgorithms timeByAddingUnit:16 value:v11 toTime:a3];
  double v13 = v12;
  uint64_t v14 = [(RTStateDepiction *)self clusterState];
  double v15 = [v14 histEntryExit_s];
  [v15 sortUsingComparator:&__block_literal_global_272];

  v105 = self;
  double v16 = [(RTStateDepiction *)self clusterState];
  uint64_t v17 = [v16 histEntryExit_s];
  char v18 = [v17 objectEnumerator];

  double v19 = [v18 nextObject];
  if (v19)
  {
    do
    {
      [v19 exit_s];
      BOOL v21 = v20 < v13;
      if (v20 >= v13) {
        break;
      }
      uint64_t v22 = [v18 nextObject];

      double v19 = (void *)v22;
    }
    while (v22);
  }
  else
  {
    BOOL v21 = 1;
  }
  double v102 = a4;
  double v23 = v13 + a4;
  id v109 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v108 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if (v21)
  {
    double v19 = 0;
    double v24 = 0.0;
    double v25 = 1.0e12;
    double v26 = -1.0e12;
    int v27 = v104;
  }
  else
  {
    double v24 = 0.0;
    double v25 = 1.0e12;
    double v26 = -1.0e12;
    double v28 = v23;
    double v29 = v13;
    while (1)
    {
      [v19 exit_s];
      if (v30 >= v111) {
        break;
      }
      if (v19)
      {
        BOOL v31 = 0;
        int v32 = 0;
        do
        {
          [v19 entry_s];
          BOOL v34 = v31 || v33 >= v28;
          if (v31 || v33 >= v28) {
            break;
          }
          [v19 exit_s];
          if (v29 >= v35)
          {
            uint64_t v40 = [v18 nextObject];

            BOOL v31 = 0;
            double v19 = (void *)v40;
          }
          else
          {
            [v19 entry_s];
            double v36 = v29;
            if (v29 < v37)
            {
              [v19 entry_s];
              double v36 = v38;
            }
            [v19 exit_s];
            BOOL v31 = v28 < v39;
            if (v28 < v39)
            {
              double v26 = v28;
            }
            else
            {
              [v19 exit_s];
              double v26 = v41;
              uint64_t v42 = [v18 nextObject];

              double v19 = (void *)v42;
            }
            double v24 = v24 + v26 - v36;
            ++v32;
            if (v36 < v25) {
              double v25 = v36;
            }
          }
        }
        while (v19);
        char v43 = !v34;
        if (v32 >= 1)
        {
          double v44 = [NSNumber numberWithInt:1];
          [v109 addObject:v44];

          uint64_t v45 = [NSNumber numberWithInt:v10];
          [v108 addObject:v45];
        }
      }
      else
      {
        char v43 = 1;
      }
      +[RTStateModelAlgorithms timeByAddingUnit:16 value:7 toTime:v29];
      double v29 = v46;
      +[RTStateModelAlgorithms timeByAddingUnit:16 value:7 toTime:v28];
      double v28 = v47;
      uint64_t v10 = (v10 + 1);
      if (v43)
      {
        double v19 = 0;
        break;
      }
    }
    int v27 = v104;
  }
  uint64_t v122 = 0;
  v123 = &v122;
  uint64_t v124 = 0x2020000000;
  int v125 = 0;
  v120[0] = 0;
  v120[1] = v120;
  v120[2] = 0x2020000000;
  int v121 = 0;
  v119[0] = MEMORY[0x1E4F143A8];
  v119[1] = 3221225472;
  v119[2] = __70__RTStateDepiction_getPredState_predictionWindow_numOfWeeks_uniqueID___block_invoke_2;
  v119[3] = &unk_1E6B9A120;
  v119[4] = &v122;
  v119[5] = v120;
  [v109 enumerateObjectsUsingBlock:v119];
  if (v27 < 1)
  {
    double v52 = 0.0;
    double v49 = 0.0;
  }
  else
  {
    double v48 = (double)v27;
    double v49 = v24 / (double)v27;
    int v50 = *((_DWORD *)v123 + 6);
    [(RTStateDepiction *)v105 getAggTimeScaleFactor:v49 predictionWindow:v102];
    double v52 = v51 * ((double)v50 / v48);
  }
  double v53 = [(RTStateDepcitionOneStatePred *)v110 weekly];
  [v53 setNumOfClustEntries:*((unsigned int *)v123 + 6)];

  BOOL v54 = [(RTStateDepcitionOneStatePred *)v110 weekly];
  [v54 setLatestVisitTime_s:v26];

  unint64_t v55 = [(RTStateDepcitionOneStatePred *)v110 weekly];
  [v55 setAggregateTime_s:v49];

  double v56 = [(RTStateDepcitionOneStatePred *)v110 weekly];
  [v56 setEarliestVisitTime_s:v25];

  v57 = [(RTStateDepcitionOneStatePred *)v110 weekly];
  [v57 setVisitHist:v108];

  float v58 = [(RTStateDepcitionOneStatePred *)v110 weekly];
  [v58 setDensity:v52];

  float v59 = [(RTStateDepiction *)v105 clusterState];
  float v60 = [v59 histEntryExit_s];
  v61 = [v60 objectEnumerator];

  double v62 = [v61 nextObject];

  if (v62)
  {
    do
    {
      [v62 exit_s];
      BOOL v64 = v63 < v13;
      if (v63 >= v13) {
        break;
      }
      uint64_t v65 = [v61 nextObject];

      double v62 = (void *)v65;
    }
    while (v65);
  }
  else
  {
    BOOL v64 = 1;
  }
  id v107 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v106 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if (v64)
  {
    double v62 = 0;
    double v66 = 0.0;
    double v67 = 1.0e12;
    double v68 = -1.0e12;
    v69 = v110;
  }
  else
  {
    double v66 = 0.0;
    double v67 = 1.0e12;
    double v68 = -1.0e12;
    v69 = v110;
    while (1)
    {
      [v62 exit_s];
      if (v70 >= v111) {
        break;
      }
      if (v62)
      {
        BOOL v71 = 0;
        int v72 = 0;
        do
        {
          [v62 entry_s];
          BOOL v74 = v71 || v73 >= v23;
          if (v71 || v73 >= v23) {
            break;
          }
          [v62 exit_s];
          if (v13 >= v75)
          {
            uint64_t v80 = [v61 nextObject];

            BOOL v71 = 0;
            double v62 = (void *)v80;
          }
          else
          {
            [v62 entry_s];
            double v76 = v13;
            if (v13 < v77)
            {
              [v62 entry_s];
              double v76 = v78;
            }
            [v62 exit_s];
            BOOL v71 = v23 < v79;
            if (v23 < v79)
            {
              double v68 = v23;
            }
            else
            {
              [v62 exit_s];
              double v68 = v81;
              uint64_t v82 = [v61 nextObject];

              double v62 = (void *)v82;
            }
            double v66 = v66 + v68 - v76;
            ++v72;
            if (v76 < v67) {
              double v67 = v76;
            }
          }
        }
        while (v62);
        char v83 = !v74;
        if (v72 >= 1)
        {
          v84 = [NSNumber numberWithInt:1];
          [v107 addObject:v84];

          uint64_t v85 = [NSNumber numberWithLong:v11];
          [v106 addObject:v85];
        }
      }
      else
      {
        char v83 = 1;
      }
      +[RTStateModelAlgorithms timeByAddingUnit:16 value:1 toTime:v13];
      double v87 = v86;
      +[RTStateModelAlgorithms timeByAddingUnit:16 value:1 toTime:v23];
      double v13 = v13 + v87;
      double v23 = v23 + v88;
      ++v11;
      if (v83)
      {
        double v62 = 0;
        break;
      }
    }
  }
  uint64_t v115 = 0;
  v116 = &v115;
  uint64_t v117 = 0x2020000000;
  int v118 = 0;
  v113[0] = 0;
  v113[1] = v113;
  v113[2] = 0x2020000000;
  int v114 = 0;
  v112[0] = MEMORY[0x1E4F143A8];
  v112[1] = 3221225472;
  v112[2] = __70__RTStateDepiction_getPredState_predictionWindow_numOfWeeks_uniqueID___block_invoke_3;
  v112[3] = &unk_1E6B9A120;
  v112[4] = &v115;
  v112[5] = v113;
  [v107 enumerateObjectsUsingBlock:v112];
  if (v104 < 1)
  {
    double v93 = 0.0;
    double v90 = 0.0;
  }
  else
  {
    double v89 = (double)(7 * v104);
    double v90 = v66 / v89;
    int v91 = *((_DWORD *)v116 + 6);
    [(RTStateDepiction *)v105 getAggTimeScaleFactor:v66 / v89 predictionWindow:v102];
    double v93 = v92 * ((double)v91 / v89);
  }
  v94 = [(RTStateDepcitionOneStatePred *)v69 daily];
  [v94 setNumOfClustEntries:*((unsigned int *)v116 + 6)];

  v95 = [(RTStateDepcitionOneStatePred *)v69 daily];
  [v95 setLatestVisitTime_s:v68];

  v96 = [(RTStateDepcitionOneStatePred *)v69 daily];
  [v96 setAggregateTime_s:v90];

  v97 = [(RTStateDepcitionOneStatePred *)v69 daily];
  [v97 setEarliestVisitTime_s:v67];

  v98 = [(RTStateDepcitionOneStatePred *)v69 daily];
  [v98 setVisitHist:v106];

  v99 = [(RTStateDepcitionOneStatePred *)v69 daily];
  [v99 setDensity:v93];

  [(RTStateDepcitionOneStatePred *)v69 setStateUUID:v103];
  v100 = v69;
  _Block_object_dispose(v113, 8);
  _Block_object_dispose(&v115, 8);

  _Block_object_dispose(v120, 8);
  _Block_object_dispose(&v122, 8);

  return v100;
}

uint64_t __70__RTStateDepiction_getPredState_predictionWindow_numOfWeeks_uniqueID___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  [a2 entry_s];
  double v6 = v5;
  [v4 entry_s];
  double v8 = v7;

  if (v6 >= v8) {
    return 1;
  }
  else {
    return -1;
  }
}

uint64_t __70__RTStateDepiction_getPredState_predictionWindow_numOfWeeks_uniqueID___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t result = [a2 intValue];
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) += result;
  ++*(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  return result;
}

uint64_t __70__RTStateDepiction_getPredState_predictionWindow_numOfWeeks_uniqueID___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t result = [a2 intValue];
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) += result;
  ++*(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  return result;
}

- (void)removeAllVisitsExceptMostRecent
{
  uint64_t v10 = 0;
  uint64_t v11 = &v10;
  uint64_t v12 = 0x3032000000;
  double v13 = __Block_byref_object_copy__121;
  uint64_t v14 = __Block_byref_object_dispose__121;
  id v15 = 0;
  double v3 = [(RTStateDepiction *)self clusterState];
  id v4 = [v3 histEntryExit_s];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __51__RTStateDepiction_removeAllVisitsExceptMostRecent__block_invoke;
  v9[3] = &unk_1E6B958B0;
  v9[4] = &v10;
  [v4 enumerateObjectsUsingBlock:v9];

  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  double v6 = [(RTStateDepiction *)self clusterState];
  [v6 setHistEntryExit_s:v5];

  if (v11[5])
  {
    double v7 = [(RTStateDepiction *)self clusterState];
    double v8 = [v7 histEntryExit_s];
    [v8 addObject:v11[5]];
  }
  _Block_object_dispose(&v10, 8);
}

void __51__RTStateDepiction_removeAllVisitsExceptMostRecent__block_invoke(uint64_t a1, void *a2)
{
  id v7 = a2;
  [v7 exit_s];
  double v5 = v4;
  [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) exit_s];
  if (v5 > v6) {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
  }
}

- (BOOL)exemptFromPurge
{
  double v2 = [(RTStateDepiction *)self clusterState];
  double v3 = [v2 mapItem];
  BOOL v4 = ([v3 source] & 0xC) != 0;

  return v4;
}

- (id)description
{
  double v2 = NSString;
  double v3 = [(RTStateDepiction *)self clusterState];
  BOOL v4 = [v2 stringWithFormat:@"%@", v3];

  return v4;
}

- (int64_t)numOfDataPts
{
  return self->_numOfDataPts;
}

- (void)setNumOfDataPts:(int64_t)a3
{
  self->_numOfDataPts = a3;
}

- (RTStateDepictionOneState)clusterState
{
  return self->_clusterState;
}

- (void)setClusterState:(id)a3
{
}

- (void).cxx_destruct
{
}

- (double)calculateStandardDeviationWithOptions:(id)a3 error:(id *)a4
{
  id v7 = (void *)[a3 mutableCopy];
  if (!a3)
  {
    uint64_t v8 = objc_opt_new();

    id v7 = (void *)v8;
  }
  double v9 = [v7 objectForKey:@"RTMetricStandardDeviationOptionsTransitionTypeKey"];

  if (!v9) {
    [v7 setObject:&unk_1F3451C98 forKey:@"RTMetricStandardDeviationOptionsTransitionTypeKey"];
  }
  uint64_t v10 = [v7 objectForKey:@"RTMetricStandardDeviationOptionsMinimumVisitsKey"];

  if (!v10) {
    [v7 setObject:&unk_1F3451CB0 forKey:@"RTMetricStandardDeviationOptionsMinimumVisitsKey"];
  }
  uint64_t v11 = [v7 objectForKey:@"RTMetricStandardDeviationOptionsIncludeOutliersKey"];

  if (!v11) {
    [v7 setObject:MEMORY[0x1E4F1CC28] forKey:@"RTMetricStandardDeviationOptionsIncludeOutliersKey"];
  }
  uint64_t v12 = [MEMORY[0x1E4F1C9A8] currentCalendar];
  double v13 = [MEMORY[0x1E4F1C9C8] date];
  uint64_t v14 = [v12 components:2097404 fromDate:v13];

  [v14 setHour:0];
  [v14 setMinute:0];
  [v14 setSecond:0];
  id v15 = [MEMORY[0x1E4F1C9A8] currentCalendar];
  double v16 = [v15 timeZone];
  [v14 setTimeZone:v16];

  uint64_t v17 = [MEMORY[0x1E4F1C9A8] currentCalendar];
  char v18 = [v17 dateFromComponents:v14];
  [v7 setObject:v18 forKey:@"RTMetricStandardDeviationOptionsReferenceDateKey"];

  double v19 = [(RTStateDepictionOneState *)self->_clusterState histEntryExit_s];
  double v20 = [(RTStateDepiction *)self _filterEntryExitData:v19 options:v7];

  BOOL v21 = [(RTStateDepiction *)self _referenceAdjustEntryExitDates:v20 options:v7];
  uint64_t v22 = [v7 objectForKey:@"RTMetricStandardDeviationOptionsIncludeOutliersKey"];
  char v23 = [v22 BOOLValue];

  if ((v23 & 1) == 0)
  {
    uint64_t v24 = [(RTStateDepiction *)self _excludeEntryExitOutlierDates:v21 options:v7];

    BOOL v21 = (void *)v24;
  }
  [(RTStateDepiction *)self _calculateStandardDeviationForDates:v21 options:v7 error:a4];
  double v26 = v25;

  return v26;
}

- (id)_referenceAdjustEntryExitDates:(id)a3 options:(id)a4
{
  double v5 = (void *)MEMORY[0x1E4F1C9A8];
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = [v5 currentCalendar];
  double v9 = [v6 objectForKey:@"RTMetricStandardDeviationOptionsReferenceDateKey"];

  uint64_t v10 = [v8 components:2097404 fromDate:v9];

  uint64_t v11 = [objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:[v7 count]];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __76__RTStateDepiction_RTMetricManager___referenceAdjustEntryExitDates_options___block_invoke;
  v17[3] = &unk_1E6B90A68;
  id v18 = v10;
  id v12 = v11;
  id v19 = v12;
  id v13 = v10;
  [v7 enumerateObjectsUsingBlock:v17];

  uint64_t v14 = v19;
  id v15 = v12;

  return v15;
}

void __76__RTStateDepiction_RTMetricManager___referenceAdjustEntryExitDates_options___block_invoke(uint64_t a1, void *a2)
{
  double v3 = (void *)MEMORY[0x1E4F1C9A8];
  id v4 = a2;
  double v5 = [v3 currentCalendar];
  id v8 = [v5 components:2097404 fromDate:v4];

  [v8 setMonth:[*(id *)(a1 + 32) month]];
  [v8 setDay:[*(id *)(a1 + 32) day]];
  [v8 setYear:[*(id *)(a1 + 32) year]];
  id v6 = [MEMORY[0x1E4F1C9A8] currentCalendar];
  id v7 = [v6 dateFromComponents:v8];

  [*(id *)(a1 + 40) addObject:v7];
}

- (double)_calculateStandardDeviationForDates:(id)a3 options:(id)a4 error:(id *)a5
{
  v44[1] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if ([v7 count])
  {
    double v9 = [v8 objectForKey:@"RTMetricStandardDeviationOptionsMinimumVisitsKey"];
    unint64_t v10 = [v9 unsignedIntegerValue];

    if ([v7 count] >= v10)
    {
      uint64_t v37 = 0;
      double v38 = (double *)&v37;
      uint64_t v39 = 0x2020000000;
      uint64_t v40 = 0;
      id v18 = [v8 objectForKey:@"RTMetricStandardDeviationOptionsReferenceDateKey"];
      v34[0] = MEMORY[0x1E4F143A8];
      v34[1] = 3221225472;
      v34[2] = __87__RTStateDepiction_RTMetricManager___calculateStandardDeviationForDates_options_error___block_invoke;
      v34[3] = &unk_1E6B9A4E0;
      double v36 = &v37;
      id v19 = v18;
      id v35 = v19;
      [v7 enumerateObjectsUsingBlock:v34];
      double v20 = v38[3];
      double v21 = v20 / (double)(unint64_t)[v7 count];
      uint64_t v30 = 0;
      BOOL v31 = (double *)&v30;
      uint64_t v32 = 0x2020000000;
      uint64_t v33 = 0;
      v26[0] = MEMORY[0x1E4F143A8];
      v26[1] = 3221225472;
      v26[2] = __87__RTStateDepiction_RTMetricManager___calculateStandardDeviationForDates_options_error___block_invoke_2;
      v26[3] = &unk_1E6B9A508;
      id v22 = v19;
      id v27 = v22;
      double v28 = &v30;
      double v29 = v21;
      [v7 enumerateObjectsUsingBlock:v26];
      double v23 = v31[3];
      unint64_t v24 = [v7 count];

      _Block_object_dispose(&v30, 8);
      double v11 = round(sqrt(v23 / (double)v24));
      _Block_object_dispose(&v37, 8);
    }
    else
    {
      double v11 = -1.0;
      if (a5)
      {
        id v12 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v41 = *MEMORY[0x1E4F28568];
        id v13 = @"dates";
        if (v10 == 1) {
          id v13 = @"date";
        }
        uint64_t v14 = [NSString stringWithFormat:@"Calculating the standard deviation requires at least %lu %@.", v10, v13];
        uint64_t v42 = v14;
        id v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v42 forKeys:&v41 count:1];
        *a5 = [v12 errorWithDomain:@"RTMetricManagerErrorDomain" code:7 userInfo:v15];
      }
    }
  }
  else
  {
    double v11 = -1.0;
    if (a5)
    {
      double v16 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v43 = *MEMORY[0x1E4F28568];
      v44[0] = @"Calculating the standard deviation requires at least one date.";
      uint64_t v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v44 forKeys:&v43 count:1];
      *a5 = [v16 errorWithDomain:@"RTMetricManagerErrorDomain" code:7 userInfo:v17];
    }
  }

  return v11;
}

double __87__RTStateDepiction_RTMetricManager___calculateStandardDeviationForDates_options_error___block_invoke(uint64_t a1, void *a2)
{
  [a2 timeIntervalSinceDate:*(void *)(a1 + 32)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  double result = v4 + *(double *)(v3 + 24);
  *(double *)(v3 + 24) = result;
  return result;
}

double __87__RTStateDepiction_RTMetricManager___calculateStandardDeviationForDates_options_error___block_invoke_2(uint64_t a1, void *a2)
{
  [a2 timeIntervalSinceDate:*(void *)(a1 + 32)];
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  double result = (v3 - *(double *)(a1 + 48)) * (v3 - *(double *)(a1 + 48)) + *(double *)(v4 + 24);
  *(double *)(v4 + 24) = result;
  return result;
}

- (id)_filterEntryExitData:(id)a3 options:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = objc_opt_new();
  if ([v5 count])
  {
    id v8 = [v6 objectForKey:@"RTMetricStandardDeviationOptionsTransitionTypeKey"];
    uint64_t v9 = [v8 unsignedIntegerValue];

    unint64_t v10 = [v6 objectForKey:@"RTMetricStandardDeviationOptionsMinimumVisitsKey"];
    unint64_t v11 = [v10 unsignedIntegerValue];

    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    v28[2] = __66__RTStateDepiction_RTMetricManager___filterEntryExitData_options___block_invoke;
    v28[3] = &unk_1E6B9A530;
    uint64_t v30 = v9;
    id v12 = v7;
    id v29 = v12;
    [v5 enumerateObjectsUsingBlock:v28];
    id v13 = [v6 objectForKey:@"RTMetricStandardDeviationOptionsWeekdayKey"];

    if (!v13)
    {
      uint64_t v14 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1D9BFA000, v14, OS_LOG_TYPE_ERROR, "Options specified calculation of weekly pattern type but didn't specify the weekday.", buf, 2u);
      }

      [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"Options specified calculation of weekly pattern type but didn't specify the weekday."];
    }
    id v15 = [v6 objectForKey:@"RTMetricStandardDeviationOptionsWeekdayKey"];
    uint64_t v16 = [v15 unsignedIntegerValue];

    uint64_t v17 = objc_opt_new();
    uint64_t v21 = MEMORY[0x1E4F143A8];
    uint64_t v22 = 3221225472;
    double v23 = __66__RTStateDepiction_RTMetricManager___filterEntryExitData_options___block_invoke_369;
    unint64_t v24 = &unk_1E6B9A0D0;
    id v25 = v17;
    uint64_t v26 = v16;
    id v18 = v17;
    [v12 enumerateObjectsUsingBlock:&v21];
    [v12 removeObjectsInArray:v18, v21, v22, v23, v24];
    if ([v12 count] >= v11) {
      id v19 = v12;
    }
    else {
      id v19 = 0;
    }
  }
  else
  {
    id v19 = v7;
  }

  return v19;
}

void __66__RTStateDepiction_RTMetricManager___filterEntryExitData_options___block_invoke(uint64_t a1, void *a2)
{
  double v3 = (void *)MEMORY[0x1E4F1C9C8];
  if (*(void *)(a1 + 40)) {
    [a2 exit_s];
  }
  else {
    [a2 entry_s];
  }
  [v3 dateWithTimeIntervalSinceReferenceDate:];
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [*(id *)(a1 + 32) addObject:v4];
}

void __66__RTStateDepiction_RTMetricManager___filterEntryExitData_options___block_invoke_369(uint64_t a1, void *a2)
{
  id v5 = a2;
  double v3 = [MEMORY[0x1E4F1C9A8] currentCalendar];
  id v4 = [v3 components:512 fromDate:v5];

  if ([v4 weekday] != *(void *)(a1 + 40)) {
    [*(id *)(a1 + 32) addObject:v5];
  }
}

- (id)_excludeEntryExitOutlierDates:(id)a3 options:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = (void *)[v5 mutableCopy];
  if (![v7 count]) {
    goto LABEL_11;
  }
  id v8 = [v6 objectForKey:@"RTMetricStandardDeviationOptionsMinimumVisitsKey"];
  unint64_t v9 = [v8 unsignedIntegerValue];

  unint64_t v10 = [v6 objectForKey:@"RTMetricStandardDeviationOptionsOutlierTimeIntervalKey"];
  uint64_t v11 = [v10 integerValue];

  id v12 = malloc_type_calloc(0x18uLL, 4uLL, 0x100004052888210uLL);
  if (v12)
  {
    id v13 = v12;
    uint64_t v39 = v7;
    double v14 = (double)v11;
    unint64_t v15 = 0x1E4F1C000uLL;
    uint64_t v16 = [MEMORY[0x1E4F1C9A8] currentCalendar];
    id v40 = v6;
    uint64_t v17 = [v6 objectForKey:@"RTMetricStandardDeviationOptionsReferenceDateKey"];
    id v18 = [v16 components:2097404 fromDate:v17];

    [v18 setHour:0];
    [v18 setMinute:0];
    [v18 setSecond:0];
    id v19 = [MEMORY[0x1E4F1C9A8] currentCalendar];
    double v20 = [v19 timeZone];
    [v18 setTimeZone:v20];

    uint64_t v21 = 0;
    uint64_t v22 = 0;
    int v23 = 0;
    do
    {
      [v18 setHour:v22];
      [*(id *)(v15 + 2472) currentCalendar];
      v25 = unint64_t v24 = v15;
      uint64_t v26 = [v25 dateFromComponents:v18];

      id v27 = [v26 dateByAddingTimeInterval:v14];
      v45[0] = MEMORY[0x1E4F143A8];
      v45[1] = 3221225472;
      v45[2] = __75__RTStateDepiction_RTMetricManager___excludeEntryExitOutlierDates_options___block_invoke;
      v45[3] = &unk_1E6B9A558;
      id v46 = v26;
      id v47 = v27;
      double v48 = v13;
      uint64_t v49 = v22;
      id v28 = v27;
      id v29 = v26;
      [v5 enumerateObjectsUsingBlock:v45];
      if (v13[v22] > v23)
      {
        int v23 = v13[v22];
        uint64_t v21 = v22;
      }

      unint64_t v15 = v24;
      ++v22;
    }
    while (v22 != 24);
    id v7 = v39;
    if (v23)
    {
      [v18 setHour:v21];
      uint64_t v30 = [*(id *)(v15 + 2472) currentCalendar];
      BOOL v31 = [v30 dateFromComponents:v18];

      uint64_t v32 = [v31 dateByAddingTimeInterval:v14];
      uint64_t v33 = [MEMORY[0x1E4F1CA48] array];
      v41[0] = MEMORY[0x1E4F143A8];
      v41[1] = 3221225472;
      v41[2] = __75__RTStateDepiction_RTMetricManager___excludeEntryExitOutlierDates_options___block_invoke_2;
      v41[3] = &unk_1E6B98E70;
      id v42 = v31;
      id v43 = v32;
      id v44 = v33;
      id v34 = v33;
      id v35 = v32;
      id v36 = v31;
      [v39 enumerateObjectsUsingBlock:v41];
      [v39 removeObjectsInArray:v34];
    }
    free(v13);

    id v6 = v40;
  }
  if ([v7 count] >= v9) {
    id v37 = v7;
  }
  else {
LABEL_11:
  }
    id v37 = 0;

  return v37;
}

uint64_t __75__RTStateDepiction_RTMetricManager___excludeEntryExitOutlierDates_options___block_invoke(void *a1, void *a2)
{
  uint64_t result = [a2 betweenDate:a1[4] andDate:a1[5]];
  if (result) {
    ++*(_DWORD *)(a1[6] + 4 * a1[7]);
  }
  return result;
}

void __75__RTStateDepiction_RTMetricManager___excludeEntryExitOutlierDates_options___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (([v3 betweenDate:*(void *)(a1 + 32) andDate:*(void *)(a1 + 40)] & 1) == 0) {
    [*(id *)(a1 + 48) addObject:v3];
  }
}

@end