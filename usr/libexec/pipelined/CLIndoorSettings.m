@interface CLIndoorSettings
+ (id)settingToSet:(id)a3;
- (BOOL)pipelinedEnabled;
- (CLGpsPosition)fakeLastFix;
- (CLIndoorSettings)init;
- (CLIndoorSettings)initWithSettings:(id)a3;
- (NSSet)disabledVenues;
- (NSSet)forcedVenues;
- (NSString)indoorAvailabilityTilesServerUrl;
- (const)prefetchClusterMergeRadius;
- (const)tilePrefetchMaxCount;
- (const)tilePrefetchRadius;
- (double)debounceInterval;
- (double)venueGroupDistance;
- (duration<long)errorBackoffDuration;
- (duration<long)tilePrefetchActivityInterval;
- (duration<long)tilePrefetchRelevancyWindow;
- (id).cxx_construct;
- (optional<double>)indoorPrefetchClusterMergeRadius;
- (optional<double>)indoorTilePrefetchRadius;
- (optional<double>)regionalPrefetchClusterMergeRadius;
- (optional<double>)regionalTilePrefetchRadius;
- (optional<unsigned)indoorTilePrefetchMaxCount;
- (optional<unsigned)regionalTilePrefetchMaxCount;
- (optional<unsigned)tilePrefetchPredictionActivityCycleAllowance;
- (uint64_t)setDebounceInterval:(uint64_t)result;
- (void)setDisabledVenues:(id)a3;
- (void)setErrorBackoffDuration:(duration<long)long;
- (void)setFakeLastFix:(id)a3;
- (void)setForcedVenues:(id)a3;
- (void)setIndoorAvailabilityTilesServerUrl:(id)a3;
- (void)setIndoorPrefetchClusterMergeRadius:(optional<double>)a3;
- (void)setIndoorTilePrefetchMaxCount:(optional<unsigned long>)a3;
- (void)setIndoorTilePrefetchRadius:(optional<double>)a3;
- (void)setPipelinedEnabled:(BOOL)a3;
- (void)setPrefetchClusterMergeRadius:(optional<double>)a3;
- (void)setRegionalPrefetchClusterMergeRadius:(optional<double>)a3;
- (void)setRegionalTilePrefetchMaxCount:(optional<unsigned long>)a3;
- (void)setRegionalTilePrefetchRadius:(optional<double>)a3;
- (void)setTilePrefetchActivityInterval:(duration<long)long;
- (void)setTilePrefetchMaxCount:(optional<unsigned long>)a3;
- (void)setTilePrefetchPredictionActivityCycleAllowance:(optional<unsigned int>)a3;
- (void)setTilePrefetchRadius:(optional<double>)a3;
- (void)setTilePrefetchRelevancyWindow:(duration<long)long;
- (void)setVenueGroupDistance:(double)a3;
@end

@implementation CLIndoorSettings

- (CLIndoorSettings)init
{
  return [(CLIndoorSettings *)self initWithSettings:&__NSDictionary0__struct];
}

+ (id)settingToSet:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v4 = +[NSSet setWithArray:v3];
LABEL_9:
      id v5 = (id)v4;
      goto LABEL_16;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = v3;
      goto LABEL_16;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
    {
      uint64_t v4 = +[NSSet setWithObject:v3];
      goto LABEL_9;
    }
    if (qword_10047BEE8 != -1) {
      dispatch_once(&qword_10047BEE8, &stru_100452808);
    }
    v6 = (id)qword_10047BEF0;
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v7 = [v3 description];
      int v9 = 138543362;
      v10 = v7;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "Cannot cast %{public}@ to a set", (uint8_t *)&v9, 0xCu);
    }
  }
  id v5 = 0;
LABEL_16:

  return v5;
}

- (CLIndoorSettings)initWithSettings:(id)a3
{
  id v4 = a3;
  v77.receiver = self;
  v77.super_class = (Class)CLIndoorSettings;
  id v5 = [(CLIndoorSettings *)&v77 init];
  if (!v5) {
    goto LABEL_53;
  }
  v6 = [v4 objectForKeyedSubscript:off_10047C1C8];
  v65 = v6;
  if (v6) {
    unsigned __int8 v7 = [v6 BOOLValue];
  }
  else {
    unsigned __int8 v7 = 1;
  }
  v5->_pipelinedEnabled = v7;
  v8 = [v4 objectForKeyedSubscript:off_10047C1D0];
  int v9 = +[CLIndoorSettings settingToSet:v8];
  [(CLIndoorSettings *)v5 setDisabledVenues:v9];

  v10 = [v4 objectForKeyedSubscript:off_10047C1D8];
  v64 = v10;
  if (v10) {
    [v10 doubleValue];
  }
  else {
    double v11 = 10.0;
  }
  [(CLIndoorSettings *)v5 setDebounceInterval:v11];
  v12 = [v4 objectForKeyedSubscript:off_10047C1E0];
  v63 = v12;
  if (v12) {
    [v12 doubleValue];
  }
  else {
    double v13 = 5.0;
  }
  [(CLIndoorSettings *)v5 setErrorBackoffDuration:(uint64_t)(v13 * 1000000000.0)];
  v14 = [v4 objectForKeyedSubscript:off_10047C240];
  v62 = v14;
  if (v14) {
    uint64_t v15 = (int)[v14 intValue];
  }
  else {
    uint64_t v15 = 86400;
  }
  v5->_tilePrefetchActivityInterval.__rep_ = v15;
  v71 = [v4 objectForKeyedSubscript:off_10047C248];
  if (v71)
  {
    v5->_tilePrefetchPredictionActivityCycleAllowance.m_storage = [v71 unsignedIntValue];
    v5->_tilePrefetchPredictionActivityCycleAllowance.m_initialized = 1;
  }
  v70 = [v4 objectForKeyedSubscript:off_10047C1E8];
  if (v70)
  {
    [v70 doubleValue];
    -[CLIndoorSettings setTilePrefetchRadius:](v5, "setTilePrefetchRadius:", 1, v16);
  }
  v69 = [v4 objectForKeyedSubscript:off_10047C1F0];
  if (v69)
  {
    [v69 doubleValue];
    -[CLIndoorSettings setTilePrefetchMaxCount:](v5, "setTilePrefetchMaxCount:", 1, (unint64_t)v17);
  }
  v68 = [v4 objectForKeyedSubscript:off_10047C1F8];
  if (v68)
  {
    [v68 doubleValue];
    -[CLIndoorSettings setPrefetchClusterMergeRadius:](v5, "setPrefetchClusterMergeRadius:", 1, v18);
  }
  v67 = [v4 objectForKeyedSubscript:off_10047C200];
  if (v67)
  {
    [v67 doubleValue];
    -[CLIndoorSettings setTilePrefetchRadius:](v5, "setTilePrefetchRadius:", 1, v19);
  }
  v20 = [v4 objectForKeyedSubscript:off_10047C208];
  v21 = v20;
  if (v20)
  {
    [v20 doubleValue];
    -[CLIndoorSettings setTilePrefetchMaxCount:](v5, "setTilePrefetchMaxCount:", 1, (unint64_t)v22);
  }
  v23 = [v4 objectForKeyedSubscript:off_10047C210];
  v24 = v23;
  if (v23)
  {
    [v23 doubleValue];
    -[CLIndoorSettings setPrefetchClusterMergeRadius:](v5, "setPrefetchClusterMergeRadius:", 1, v25);
  }
  v26 = [v4 objectForKeyedSubscript:off_10047C218];
  v27 = v26;
  if (v26)
  {
    [v26 doubleValue];
    -[CLIndoorSettings setRegionalTilePrefetchRadius:](v5, "setRegionalTilePrefetchRadius:", 1, v28);
  }
  v66 = [v4 objectForKeyedSubscript:off_10047C220];
  if (v21)
  {
    [v66 doubleValue];
    -[CLIndoorSettings setRegionalTilePrefetchMaxCount:](v5, "setRegionalTilePrefetchMaxCount:", 1, (unint64_t)v29);
  }
  v30 = [v4 objectForKeyedSubscript:off_10047C228];
  v31 = v30;
  if (v30)
  {
    [v30 doubleValue];
    -[CLIndoorSettings setRegionalPrefetchClusterMergeRadius:](v5, "setRegionalPrefetchClusterMergeRadius:", 1, v32);
  }
  v5->_tilePrefetchRelevancyWindow.__rep_ = 604800;
  v33 = [v4 objectForKeyedSubscript:off_10047C1C0];
  v34 = +[GEOCountryConfiguration sharedConfiguration];
  v35 = [v34 defaultForKey:@"CLPipelineAvailabilityServer" defaultValue:@"https://cl4.apple.com/2/m2/a.1/"];

  if (v33) {
    v36 = v33;
  }
  else {
    v36 = v35;
  }
  [(CLIndoorSettings *)v5 setIndoorAvailabilityTilesServerUrl:v36];
  if (qword_10047BEE8 != -1)
  {
    dispatch_once(&qword_10047BEE8, &stru_100452808);
    v37 = qword_10047BEF0;
    if (!os_log_type_enabled((os_log_t)qword_10047BEF0, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_40;
    }
    goto LABEL_39;
  }
  v37 = qword_10047BEF0;
  if (os_log_type_enabled((os_log_t)qword_10047BEF0, OS_LOG_TYPE_DEBUG))
  {
LABEL_39:
    indoorAvailabilityTilesServerUrl = v5->_indoorAvailabilityTilesServerUrl;
    *(_DWORD *)buf = 138477827;
    v79 = indoorAvailabilityTilesServerUrl;
    _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_DEBUG, "indoorAvailabilityTilesServerUrl = %{private}@", buf, 0xCu);
  }
LABEL_40:
  v39 = [v4 objectForKeyedSubscript:off_10047C230];
  v40 = +[CLIndoorSettings settingToSet:v39];
  [(CLIndoorSettings *)v5 setForcedVenues:v40];

  v41 = [v4 objectForKeyedSubscript:off_10047C238];
  v42 = v41;
  if (v41)
  {
    v43 = [v41 objectForKeyedSubscript:@"lat"];
    [v43 doubleValue];
    uint64_t v75 = v44;

    uint64_t v45 = [v42 objectForKeyedSubscript:@"lon"];
    [(id)v45 doubleValue];
    uint64_t v76 = v46;

    v47 = [v42 objectForKeyedSubscript:@"horizontalAccuracy"];
    LOBYTE(v45) = v47 == 0;

    if (v45)
    {
      uint64_t v73 = 0x4049000000000000;
    }
    else
    {
      v48 = [v42 objectForKeyedSubscript:@"horizontalAccuracy"];
      [v48 doubleValue];
      uint64_t v73 = v49;
    }
    v51 = [v42 objectForKeyedSubscript:@"lifespan"];
    BOOL v52 = v51 == 0;

    if (v52)
    {
      unint64_t v74 = 0xBFF0000000000000;
    }
    else
    {
      v53 = [v42 objectForKeyedSubscript:@"lifespan"];
      [v53 doubleValue];
      unint64_t v74 = v54;
    }
    v55 = [[CLGpsPosition alloc] initWithLocation:v72 andPrivateLocation:buf];
    fakeLastFix = v5->_fakeLastFix;
    v5->_fakeLastFix = v55;
  }
  else
  {
    v50 = v5->_fakeLastFix;
    v5->_fakeLastFix = 0;
  }
  v57 = [v4 objectForKeyedSubscript:off_10047C250];
  v58 = v57;
  if (v57) {
    [v57 doubleValue];
  }
  else {
    double v59 = 250.0;
  }
  [(CLIndoorSettings *)v5 setVenueGroupDistance:v59];
  v60 = v5;

LABEL_53:
  return v5;
}

- (const)tilePrefetchRadius
{
  return &self->_tilePrefetchRadius;
}

- (const)tilePrefetchMaxCount
{
  return &self->_tilePrefetchMaxCount;
}

- (const)prefetchClusterMergeRadius
{
  return &self->_prefetchClusterMergeRadius;
}

- (BOOL)pipelinedEnabled
{
  return self->_pipelinedEnabled;
}

- (void)setPipelinedEnabled:(BOOL)a3
{
  self->_pipelinedEnabled = a3;
}

- (NSSet)disabledVenues
{
  return self->_disabledVenues;
}

- (void)setDisabledVenues:(id)a3
{
}

- (double)debounceInterval
{
  return *(double *)(a1 + 24);
}

- (uint64_t)setDebounceInterval:(uint64_t)result
{
  *(double *)(result + 24) = a2;
  return result;
}

- (duration<long)errorBackoffDuration
{
  return self->_errorBackoffDuration;
}

- (void)setErrorBackoffDuration:(duration<long)long
{
  self->_errorBackoffDuration = a3;
}

- (duration<long)tilePrefetchActivityInterval
{
  return self->_tilePrefetchActivityInterval;
}

- (void)setTilePrefetchActivityInterval:(duration<long)long
{
  self->_tilePrefetchActivityInterval = a3;
}

- (optional<unsigned)tilePrefetchPredictionActivityCycleAllowance
{
  return self->_tilePrefetchPredictionActivityCycleAllowance;
}

- (void)setTilePrefetchPredictionActivityCycleAllowance:(optional<unsigned int>)a3
{
  self->_tilePrefetchPredictionActivityCycleAllowance = a3;
}

- (void)setTilePrefetchRadius:(optional<double>)a3
{
  self->_tilePrefetchRadius = a3;
}

- (void)setTilePrefetchMaxCount:(optional<unsigned long>)a3
{
  self->_tilePrefetchMaxCount = a3;
}

- (void)setPrefetchClusterMergeRadius:(optional<double>)a3
{
  self->_prefetchClusterMergeRadius = a3;
}

- (optional<double>)indoorTilePrefetchRadius
{
  double m_storage = self->_indoorTilePrefetchRadius.m_storage;
  uint64_t v3 = *(void *)&self->_indoorTilePrefetchRadius.m_initialized;
  result.double m_storage = m_storage;
  result.m_initialized = v3;
  return result;
}

- (void)setIndoorTilePrefetchRadius:(optional<double>)a3
{
  self->_indoorTilePrefetchRadius = a3;
}

- (optional<unsigned)indoorTilePrefetchMaxCount
{
  unint64_t m_storage = self->_indoorTilePrefetchMaxCount.m_storage;
  uint64_t v3 = *(void *)&self->_indoorTilePrefetchMaxCount.m_initialized;
  result.unint64_t m_storage = m_storage;
  result.m_initialized = v3;
  return result;
}

- (void)setIndoorTilePrefetchMaxCount:(optional<unsigned long>)a3
{
  self->_indoorTilePrefetchMaxCount = a3;
}

- (optional<double>)indoorPrefetchClusterMergeRadius
{
  double m_storage = self->_indoorPrefetchClusterMergeRadius.m_storage;
  uint64_t v3 = *(void *)&self->_indoorPrefetchClusterMergeRadius.m_initialized;
  result.double m_storage = m_storage;
  result.m_initialized = v3;
  return result;
}

- (void)setIndoorPrefetchClusterMergeRadius:(optional<double>)a3
{
  self->_indoorPrefetchClusterMergeRadius = a3;
}

- (optional<double>)regionalTilePrefetchRadius
{
  double m_storage = self->_regionalTilePrefetchRadius.m_storage;
  uint64_t v3 = *(void *)&self->_regionalTilePrefetchRadius.m_initialized;
  result.double m_storage = m_storage;
  result.m_initialized = v3;
  return result;
}

- (void)setRegionalTilePrefetchRadius:(optional<double>)a3
{
  self->_regionalTilePrefetchRadius = a3;
}

- (optional<unsigned)regionalTilePrefetchMaxCount
{
  unint64_t m_storage = self->_regionalTilePrefetchMaxCount.m_storage;
  uint64_t v3 = *(void *)&self->_regionalTilePrefetchMaxCount.m_initialized;
  result.unint64_t m_storage = m_storage;
  result.m_initialized = v3;
  return result;
}

- (void)setRegionalTilePrefetchMaxCount:(optional<unsigned long>)a3
{
  self->_regionalTilePrefetchMaxCount = a3;
}

- (optional<double>)regionalPrefetchClusterMergeRadius
{
  double m_storage = self->_regionalPrefetchClusterMergeRadius.m_storage;
  uint64_t v3 = *(void *)&self->_regionalPrefetchClusterMergeRadius.m_initialized;
  result.double m_storage = m_storage;
  result.m_initialized = v3;
  return result;
}

- (void)setRegionalPrefetchClusterMergeRadius:(optional<double>)a3
{
  self->_regionalPrefetchClusterMergeRadius = a3;
}

- (duration<long)tilePrefetchRelevancyWindow
{
  return self->_tilePrefetchRelevancyWindow;
}

- (void)setTilePrefetchRelevancyWindow:(duration<long)long
{
  self->_tilePrefetchRelevancyWindow = a3;
}

- (NSString)indoorAvailabilityTilesServerUrl
{
  return self->_indoorAvailabilityTilesServerUrl;
}

- (void)setIndoorAvailabilityTilesServerUrl:(id)a3
{
}

- (NSSet)forcedVenues
{
  return self->_forcedVenues;
}

- (void)setForcedVenues:(id)a3
{
}

- (CLGpsPosition)fakeLastFix
{
  return self->_fakeLastFix;
}

- (void)setFakeLastFix:(id)a3
{
}

- (double)venueGroupDistance
{
  return self->_venueGroupDistance;
}

- (void)setVenueGroupDistance:(double)a3
{
  self->_venueGroupDistance = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fakeLastFix, 0);
  objc_storeStrong((id *)&self->_forcedVenues, 0);
  objc_storeStrong((id *)&self->_indoorAvailabilityTilesServerUrl, 0);

  objc_storeStrong((id *)&self->_disabledVenues, 0);
}

- (id).cxx_construct
{
  *((unsigned char *)self + 48) = 0;
  *((unsigned char *)self + 96) = 0;
  *((unsigned char *)self + 112) = 0;
  *((unsigned char *)self + 128) = 0;
  *((unsigned char *)self + 144) = 0;
  *((unsigned char *)self + 160) = 0;
  *((unsigned char *)self + 176) = 0;
  *((unsigned char *)self + 192) = 0;
  *((unsigned char *)self + 208) = 0;
  *((unsigned char *)self + 224) = 0;
  return self;
}

@end