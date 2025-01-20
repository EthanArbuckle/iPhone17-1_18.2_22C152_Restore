@interface NTKSiderealDataSource
+ ($F24F406B2B787EFB06265DBA3D28CBD5)_geoLocationForLocation:(id)a3;
+ (BOOL)_date:(id)a3 isBetweenDate:(id)a4 andDate:(id)a5;
+ (double)_solarPercentageToDegree:(double)a3;
+ (double)reverseInterpolateBetweenCalendricalMidnights:(id)a3;
+ (id)_dayEventsFromEvents:(id)a3;
+ (id)_eventWithType:(int64_t)a3 time:(id)a4;
+ (id)_solarEventsForLocation:(id)a3 atDate:(id)a4;
+ (id)_solarSectorsForEvents:(id)a3;
+ (id)_waypointsForTransitInfo:(id)a3 andEvents:(id)a4;
+ (id)siderealDataForLocation:(id)a3 atDate:(id)a4 useXR:(BOOL)a5;
+ (int64_t)_endOfDayEventFollowingSolarEvent:(int64_t)a3;
+ (int64_t)_startOfDayEventPreceedingFirstSolarEvent:(int64_t)a3;
- (BOOL)_didLocationChangeSignificantlyFromOldLocation:(id)a3 toNewLocation:(id)a4;
- (NTKSiderealDataSource)initWithXR:(BOOL)a3;
- (void)_locationManagerUpdatedLocation:(id)a3 error:(id)a4;
- (void)_notifySiderealDataDidUpdate:(id)a3;
- (void)_updateData;
- (void)_updateDataIfNeededToDate:(id)a3 atLocation:(id)a4;
- (void)_updateForSignificantTimeChange:(id)a3;
- (void)addObserver:(id)a3;
- (void)dealloc;
- (void)ensureLocation:(id)a3;
- (void)removeObserver:(id)a3;
- (void)startLocationUpdates;
- (void)stopLocationUpdates;
- (void)updateModelWithDate:(id)a3;
@end

@implementation NTKSiderealDataSource

- (NTKSiderealDataSource)initWithXR:(BOOL)a3
{
  v27.receiver = self;
  v27.super_class = (Class)NTKSiderealDataSource;
  v4 = [(NTKSiderealDataSource *)&v27 init];
  if (v4)
  {
    uint64_t v5 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    observers = v4->_observers;
    v4->_observers = (NSHashTable *)v5;

    v4->_useXR = a3;
    v4->_locationManagerRefCount = 0;
    v7 = +[NTKSiderealData loadCached];
    v8 = v7;
    if (v7 && v4->_useXR == [v7 useXR])
    {
      v9 = _NTKLoggingObjectForDomain(36, (uint64_t)"NTKLoggingDomainSidereal");
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1BC5A9000, v9, OS_LOG_TYPE_DEFAULT, "NTKSiderealDataSource: found cached data.", buf, 2u);
      }

      uint64_t v10 = [v8 referenceLocation];
      currentReferenceLocation = v4->_currentReferenceLocation;
      v4->_currentReferenceLocation = (CLLocation *)v10;

      uint64_t v12 = [v8 referenceDate];
      currentReferenceDate = v4->_currentReferenceDate;
      v4->_currentReferenceDate = (NSDate *)v12;

      v24[0] = MEMORY[0x1E4F143A8];
      v24[1] = 3221225472;
      v24[2] = __36__NTKSiderealDataSource_initWithXR___block_invoke;
      v24[3] = &unk_1E62C2978;
      id v25 = v8;
      uint64_t v14 = +[NTKPromise promiseNamed:@"Cached Sidereal Data" withBlock:v24];
      currentData = v4->_currentData;
      v4->_currentData = (NTKPromise *)v14;
    }
    else
    {
      v16 = _NTKLoggingObjectForDomain(36, (uint64_t)"NTKLoggingDomainSidereal");
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1BC5A9000, v16, OS_LOG_TYPE_DEFAULT, "NTKSiderealDataSource: could not find cached data.", buf, 2u);
      }

      v17 = +[NTKLocationManager sharedLocationManager];
      uint64_t v18 = [v17 anyLocation];
      v19 = v4->_currentReferenceLocation;
      v4->_currentReferenceLocation = (CLLocation *)v18;

      uint64_t v20 = +[NTKDate faceDate];
      v21 = v4->_currentReferenceDate;
      v4->_currentReferenceDate = (NSDate *)v20;

      [(NTKSiderealDataSource *)v4 _updateData];
    }
    v22 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v22 addObserver:v4 selector:sel__updateForSignificantTimeChange_ name:*MEMORY[0x1E4F1C4F8] object:0];
    [v22 addObserver:v4 selector:sel__updateForSignificantTimeChange_ name:*MEMORY[0x1E4FB2708] object:0];
  }
  return v4;
}

id __36__NTKSiderealDataSource_initWithXR___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

- (void)dealloc
{
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self name:*MEMORY[0x1E4F1C4F8] object:0];
  [v3 removeObserver:self name:*MEMORY[0x1E4FB2708] object:0];

  v4.receiver = self;
  v4.super_class = (Class)NTKSiderealDataSource;
  [(NTKSiderealDataSource *)&v4 dealloc];
}

- (void)addObserver:(id)a3
{
  observers = self->_observers;
  id v5 = a3;
  [(NSHashTable *)observers addObject:v5];
  id v6 = [(NTKPromise *)self->_currentData object];
  [v5 dataSourceDidUpdateSolarData:v6];
}

- (void)removeObserver:(id)a3
{
}

- (void)_updateData
{
  v3 = _NTKLoggingObjectForDomain(36, (uint64_t)"NTKLoggingDomainSidereal");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl(&dword_1BC5A9000, v3, OS_LOG_TYPE_DEFAULT, "NTKSiderealDataSource: Updating data", (uint8_t *)buf, 2u);
  }

  objc_super v4 = self->_currentReferenceLocation;
  id v5 = self->_currentReferenceDate;
  BOOL useXR = self->_useXR;
  objc_initWeak(buf, self);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __36__NTKSiderealDataSource__updateData__block_invoke;
  v11[3] = &unk_1E62C29A0;
  objc_copyWeak(&v14, buf);
  v7 = v4;
  uint64_t v12 = v7;
  v8 = v5;
  v13 = v8;
  BOOL v15 = useXR;
  v9 = +[NTKPromise promiseNamed:@"Sidereal Data Source Load" withBlock:v11];
  currentData = self->_currentData;
  self->_currentData = v9;

  objc_destroyWeak(&v14);
  objc_destroyWeak(buf);
}

id __36__NTKSiderealDataSource__updateData__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    v3 = +[NTKSiderealDataSource siderealDataForLocation:*(void *)(a1 + 32) atDate:*(void *)(a1 + 40) useXR:*(unsigned __int8 *)(a1 + 56)];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __36__NTKSiderealDataSource__updateData__block_invoke_2;
    v7[3] = &unk_1E62C09C0;
    id v4 = v3;
    id v8 = v4;
    id v9 = WeakRetained;
    dispatch_async(MEMORY[0x1E4F14428], v7);
    id v5 = v4;
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

uint64_t __36__NTKSiderealDataSource__updateData__block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) save];
  uint64_t v3 = *(void *)(a1 + 32);
  v2 = *(void **)(a1 + 40);
  return [v2 _notifySiderealDataDidUpdate:v3];
}

- (void)_updateDataIfNeededToDate:(id)a3 atLocation:(id)a4
{
  id v10 = a3;
  id v7 = a4;
  id v8 = [MEMORY[0x1E4F1C9A8] currentCalendar];
  char v9 = [v8 isDate:v10 inSameDayAsDate:self->_currentReferenceDate];

  if ((v9 & 1) == 0) {
    objc_storeStrong((id *)&self->_currentReferenceDate, a3);
  }
  if (!v7
    || !self->_currentReferenceDate
    || [(NTKSiderealDataSource *)self _didLocationChangeSignificantlyFromOldLocation:self->_currentReferenceLocation toNewLocation:v7])
  {
    objc_storeStrong((id *)&self->_currentReferenceLocation, a4);
LABEL_7:
    [(NTKSiderealDataSource *)self _updateData];
    goto LABEL_8;
  }
  if ((v9 & 1) == 0) {
    goto LABEL_7;
  }
LABEL_8:
}

- (void)_notifySiderealDataDidUpdate:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = _NTKLoggingObjectForDomain(36, (uint64_t)"NTKLoggingDomainSidereal");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    id v6 = [v4 solarEvents];
    id v7 = [v4 daytimeEvents];
    id v8 = [v4 waypoints];
    *(_DWORD *)buf = 138412802;
    uint64_t v20 = v6;
    __int16 v21 = 2112;
    v22 = v7;
    __int16 v23 = 2112;
    v24 = v8;
    _os_log_impl(&dword_1BC5A9000, v5, OS_LOG_TYPE_INFO, "[NTKSiderealDataSource] _notifyDidUpdate: solarEvents: %@ dayAngles: %@ waypoints: %@", buf, 0x20u);
  }
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  char v9 = self->_observers;
  uint64_t v10 = [(NSHashTable *)v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v15;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v15 != v12) {
          objc_enumerationMutation(v9);
        }
        objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * v13++), "dataSourceDidUpdateSolarData:", v4, (void)v14);
      }
      while (v11 != v13);
      uint64_t v11 = [(NSHashTable *)v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v11);
  }
}

- (void)updateModelWithDate:(id)a3
{
}

- (void)_updateForSignificantTimeChange:(id)a3
{
  id v5 = +[NTKTimeOffsetManager sharedManager];
  id v4 = [v5 faceDisplayTime];
  [(NTKSiderealDataSource *)self updateModelWithDate:v4];
}

- (void)_locationManagerUpdatedLocation:(id)a3 error:(id)a4
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = _NTKLoggingObjectForDomain(36, (uint64_t)"NTKLoggingDomainSidereal");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138478083;
    id v10 = v6;
    __int16 v11 = 2112;
    id v12 = v7;
    _os_log_impl(&dword_1BC5A9000, v8, OS_LOG_TYPE_DEFAULT, "[NTKSiderealDataSource] _locationManagerUpdatedLocation with location:%{private}@ and error:%@", (uint8_t *)&v9, 0x16u);
  }

  [(NTKSiderealDataSource *)self _updateDataIfNeededToDate:self->_currentReferenceDate atLocation:v6];
}

- (void)startLocationUpdates
{
  int64_t locationManagerRefCount = self->_locationManagerRefCount;
  if (!locationManagerRefCount)
  {
    id v4 = _NTKLoggingObjectForDomain(36, (uint64_t)"NTKLoggingDomainSidereal");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl(&dword_1BC5A9000, v4, OS_LOG_TYPE_INFO, "[NTKSiderealDataSource] startLocationUpdates", (uint8_t *)buf, 2u);
    }

    objc_initWeak(buf, self);
    id v5 = +[NTKLocationManager sharedLocationManager];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __45__NTKSiderealDataSource_startLocationUpdates__block_invoke;
    v8[3] = &unk_1E62C29C8;
    objc_copyWeak(&v9, buf);
    id v6 = [v5 startLocationUpdatesWithIdentifier:@"ntk.sidereal.controller" handler:v8];
    locationManagerToken = self->_locationManagerToken;
    self->_locationManagerToken = v6;

    objc_destroyWeak(&v9);
    objc_destroyWeak(buf);
    int64_t locationManagerRefCount = self->_locationManagerRefCount;
  }
  self->_int64_t locationManagerRefCount = locationManagerRefCount + 1;
}

void __45__NTKSiderealDataSource_startLocationUpdates__block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v5 = (id *)(a1 + 32);
  id v6 = a4;
  id v7 = a3;
  id WeakRetained = objc_loadWeakRetained(v5);
  [WeakRetained _locationManagerUpdatedLocation:v7 error:v6];
}

- (void)stopLocationUpdates
{
  int64_t v2 = self->_locationManagerRefCount - 1;
  self->_int64_t locationManagerRefCount = v2;
  if (!v2)
  {
    id v4 = _NTKLoggingObjectForDomain(36, (uint64_t)"NTKLoggingDomainSidereal");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)id v7 = 0;
      _os_log_impl(&dword_1BC5A9000, v4, OS_LOG_TYPE_INFO, "[NTKSiderealDataSource] stopLocationUpdates", v7, 2u);
    }

    if (self->_locationManagerToken)
    {
      id v5 = +[NTKLocationManager sharedLocationManager];
      [v5 stopLocationUpdatesForToken:self->_locationManagerToken];

      locationManagerToken = self->_locationManagerToken;
      self->_locationManagerToken = 0;
    }
  }
}

- (void)ensureLocation:(id)a3
{
}

- (BOOL)_didLocationChangeSignificantlyFromOldLocation:(id)a3 toNewLocation:(id)a4
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  [a3 distanceFromLocation:a4];
  double v5 = v4;
  id v6 = _NTKLoggingObjectForDomain(36, (uint64_t)"NTKLoggingDomainSidereal");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    int v8 = 134217984;
    double v9 = v5;
    _os_log_impl(&dword_1BC5A9000, v6, OS_LOG_TYPE_INFO, "[NTKSiderealDataSource] _didLocationChangeSignificantlyFromOldLocation:newLocation: %f", (uint8_t *)&v8, 0xCu);
  }

  return v5 >= 250000.0;
}

+ (id)siderealDataForLocation:(id)a3 atDate:(id)a4 useXR:(BOOL)a5
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  int v8 = _NTKLoggingObjectForDomain(36, (uint64_t)"NTKLoggingDomainSidereal");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v40 = "+[NTKSiderealDataSource siderealDataForLocation:atDate:useXR:]";
    _os_log_impl(&dword_1BC5A9000, v8, OS_LOG_TYPE_INFO, "[NTKSiderealDataSource] %s", buf, 0xCu);
  }

  v36 = v6;
  +[NTKSiderealDataSource _geoLocationForLocation:v6];
  double v10 = v9;
  double v12 = v11;
  objc_msgSend(off_1E62BDB30, "transitInfoForDate:location:sunAltitude:", v7);
  uint64_t v13 = (char *)objc_claimAutoreleasedReturnValue();
  long long v14 = _NTKLoggingObjectForDomain(36, (uint64_t)"NTKLoggingDomainSidereal");
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v40 = v13;
    _os_log_impl(&dword_1BC5A9000, v14, OS_LOG_TYPE_INFO, "[NTKSiderealDataSource] Updated sunrise/sunset transit info: %@", buf, 0xCu);
  }

  long long v15 = v13;
  uint64_t v16 = [v13 solarNoon];
  long long v17 = objc_msgSend(objc_alloc(MEMORY[0x1E4F645D8]), "initWithLocation:date:body:", v16, 0, v10, v12);
  uint64_t v18 = _NTKLoggingObjectForDomain(36, (uint64_t)"NTKLoggingDomainSidereal");
  if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
  {
    [v17 altitude];
    *(_DWORD *)buf = 134217984;
    v40 = v19;
    _os_log_impl(&dword_1BC5A9000, v18, OS_LOG_TYPE_INFO, "[NTKSiderealDataSource] solar noon altitude: %f", buf, 0xCu);
  }
  v34 = v17;

  uint64_t v20 = NTKStartOfDayForDate(v7);
  __int16 v21 = v7;
  v22 = NTKEndOfDayForDate(v7);
  v35 = (void *)v16;
  +[NTKSiderealDataSource reverseInterpolateBetweenCalendricalMidnights:v16];
  __int16 v23 = malloc_type_malloc(0x5A4uLL, 0x100004052888210uLL);
  for (unint64_t i = 0; i != 361; ++i)
  {
    uint64_t v25 = NTKInterpolateBetweenDates(v20, v22, (float)((float)i / 360.0));
    v26 = objc_msgSend(objc_alloc(MEMORY[0x1E4F645D8]), "initWithLocation:date:body:", v25, 0, v10, v12);
    [v26 altitude];
    CLKMapFractionIntoRange();
    *(float *)&double v27 = v27;
    v23[i] = LODWORD(v27);
  }
  v28 = +[NTKSiderealDataSource _solarEventsForLocation:atDate:](NTKSiderealDataSource, "_solarEventsForLocation:atDate:", v7, v10, v12);
  v29 = +[NTKSiderealDataSource _solarSectorsForEvents:v28];
  v30 = +[NTKSiderealDataSource _dayEventsFromEvents:v28];
  v31 = +[NTKSiderealDataSource _waypointsForTransitInfo:v15 andEvents:v28];
  LOBYTE(v33) = a5;
  v38 = [[NTKSiderealData alloc] initWithReferenceDate:v21 referenceLocation:v36 sunriseSunsetInfo:v15 solarEvents:v28 daytimeEvents:v30 sectors:v29 waypoints:v31 altitudes:v23 useXR:v33];
  free(v23);

  return v38;
}

+ (id)_solarEventsForLocation:(id)a3 atDate:(id)a4
{
  double var1 = a3.var1;
  double var0 = a3.var0;
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = NTKStartOfDayForDate(v6);
  int v8 = NTKEndOfDayForDate(v6);
  [v7 timeIntervalSinceReferenceDate];
  double v10 = v9;
  [v8 timeIntervalSinceReferenceDate];
  double v12 = v11;
  id v13 = objc_alloc(MEMORY[0x1E4F64A50]);
  long long v14 = objc_msgSend(v13, "initWithLocation:time:altitudeInDegrees:accuracy:", var0, var1, v10, *MEMORY[0x1E4F63E78], 60.0);
  long long v15 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v16 = 0;
  do
  {
    uint64_t v17 = v16 + 1;
    if (unint64_t)(v16 + 1) <= 9 && ((0x1EFu >> v16))
    {
      [v14 nextEventOfType:dword_1BC8A0C00[v16]];
      if (v18 != 0.0 && v18 < v12)
      {
        uint64_t v20 = objc_msgSend(MEMORY[0x1E4F1C9C8], "dateWithTimeIntervalSinceReferenceDate:");
        __int16 v21 = +[NTKSiderealDataSource _eventWithType:v17 time:v20];
        [v15 addObject:v21];
      }
    }
    uint64_t v16 = v17;
  }
  while (v17 != 9);
  [v15 sortUsingComparator:&__block_literal_global_39];
  v22 = [MEMORY[0x1E4F1CA70] orderedSetWithArray:v15];
  if ([v22 count])
  {
    __int16 v23 = [v22 firstObject];
    int64_t v24 = +[NTKSiderealDataSource _startOfDayEventPreceedingFirstSolarEvent:](NTKSiderealDataSource, "_startOfDayEventPreceedingFirstSolarEvent:", [v23 type]);

    uint64_t v25 = [v22 lastObject];
    int64_t v26 = +[NTKSiderealDataSource _endOfDayEventFollowingSolarEvent:](NTKSiderealDataSource, "_endOfDayEventFollowingSolarEvent:", [v25 type]);
  }
  else
  {
    if (geo_isDayLightForLocation()) {
      int64_t v24 = 5;
    }
    else {
      int64_t v24 = 0;
    }
    int64_t v26 = v24;
  }
  double v27 = +[NTKSiderealSolarEvent eventWithType:v24 degree:0.0];
  [v22 insertObject:v27 atIndex:0];
  v28 = +[NTKSiderealSolarEvent eventWithType:v26 degree:360.0];
  [v22 addObject:v28];
  v29 = _NTKLoggingObjectForDomain(36, (uint64_t)"NTKLoggingDomainSidereal");
  if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    uint64_t v33 = "+[NTKSiderealDataSource _solarEventsForLocation:atDate:]";
    __int16 v34 = 2112;
    v35 = v22;
    _os_log_impl(&dword_1BC5A9000, v29, OS_LOG_TYPE_INFO, "[NTKSiderealDataSource] %s: updated solar events: %@", buf, 0x16u);
  }

  v30 = (void *)[v22 copy];
  return v30;
}

uint64_t __56__NTKSiderealDataSource__solarEventsForLocation_atDate___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  double v5 = [a2 time];
  id v6 = [v4 time];

  uint64_t v7 = [v5 compare:v6];
  return v7;
}

+ (id)_dayEventsFromEvents:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = (void *)MEMORY[0x1E4F28F60];
  id v4 = a3;
  double v5 = [v3 predicateWithBlock:&__block_literal_global_193];
  id v6 = [v4 filteredOrderedSetUsingPredicate:v5];

  if ((unint64_t)[v6 count] < 2)
  {
    double v11 = _NTKLoggingObjectForDomain(36, (uint64_t)"NTKLoggingDomainSidereal");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      +[NTKSiderealDataSource _dayEventsFromEvents:](v11);
    }

    double v10 = [MEMORY[0x1E4F1CAA0] orderedSet];
  }
  else
  {
    uint64_t v7 = (void *)MEMORY[0x1E4F1CAA0];
    int v8 = [v6 firstObject];
    double v9 = [v6 lastObject];
    double v10 = objc_msgSend(v7, "orderedSetWithObjects:", v8, v9, 0);
  }
  double v12 = _NTKLoggingObjectForDomain(36, (uint64_t)"NTKLoggingDomainSidereal");
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    uint64_t v16 = "+[NTKSiderealDataSource _dayEventsFromEvents:]";
    __int16 v17 = 2112;
    double v18 = v10;
    _os_log_impl(&dword_1BC5A9000, v12, OS_LOG_TYPE_INFO, "[NTKSiderealDataSource] %s: updated day events: %@", buf, 0x16u);
  }

  id v13 = (void *)[v10 copy];
  return v13;
}

BOOL __46__NTKSiderealDataSource__dayEventsFromEvents___block_invoke(uint64_t a1, void *a2)
{
  return (unint64_t)([a2 type] - 4) < 3;
}

+ (id)_solarSectorsForEvents:(id)a3
{
  id v3 = a3;
  id v4 = [MEMORY[0x1E4F1CA70] orderedSet];
  if ([v3 count] != 1)
  {
    unint64_t v5 = 0;
    do
    {
      id v6 = [v3 objectAtIndexedSubscript:v5];
      uint64_t v7 = objc_msgSend(v3, "objectAtIndexedSubscript:", ++v5 % objc_msgSend(v3, "count"));
      int v8 = [[NTKSiderealSector alloc] initWithStartingEvent:v6 endingEvent:v7];
      if (![(NTKSiderealSector *)v8 type])
      {
        double v9 = [(NTKSiderealSector *)v8 startingEvent];
        [v9 angle];
        float v11 = 4.71238898 - v10;

        double v12 = [(NTKSiderealSector *)v8 endingEvent];
        [v12 angle];
        float v14 = 4.71238898 - v13;

        double v15 = 0.0;
        if (vabds_f32(v14, v11) > 3.14159265)
        {
          __float2 v17 = __sincosf_stret(v11);
          *(void *)&long long v16 = __PAIR64__(LODWORD(v17.__sinval), LODWORD(v17.__cosval));
          long long v22 = v16;
          __float2 v18 = __sincosf_stret(v14);
          double v15 = COERCE_DOUBLE(vmul_f32(vadd_f32(*(float32x2_t *)&v22, (float32x2_t)__PAIR64__(LODWORD(v18.__sinval), LODWORD(v18.__cosval))), (float32x2_t)0x3F0000003F000000));
        }
        -[NTKSiderealSector setGradientStartPoint:](v8, "setGradientStartPoint:", v15, v22);
        __float2 v19 = __sincosf_stret((float)(v11 + v14) * 0.5);
        [(NTKSiderealSector *)v8 setGradientEndPoint:COERCE_DOUBLE(__PAIR64__(LODWORD(v19.__sinval), LODWORD(v19.__cosval)))];
      }
      [v4 addObject:v8];
    }
    while ([v3 count] - 1 > v5);
  }
  uint64_t v20 = (void *)[v4 copy];

  return v20;
}

+ (id)_waypointsForTransitInfo:(id)a3 andEvents:(id)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = [MEMORY[0x1E4F1CA48] array];
  int v8 = [v5 solarNoon];

  if (v8)
  {
    double v9 = [v5 solarNoon];
    +[NTKSiderealDataSource reverseInterpolateBetweenCalendricalMidnights:v9];
    +[NTKSiderealDataSource _solarPercentageToDegree:](NTKSiderealDataSource, "_solarPercentageToDegree:");
    double v10 = +[NTKSiderealWaypoint waypointWithType:degree:](NTKSiderealWaypoint, "waypointWithType:degree:", 0);
    [v7 addObject:v10];
  }
  float v11 = [v5 solarMidnight];

  if (v11)
  {
    double v12 = [v5 solarMidnight];
    +[NTKSiderealDataSource reverseInterpolateBetweenCalendricalMidnights:v12];
    +[NTKSiderealDataSource _solarPercentageToDegree:](NTKSiderealDataSource, "_solarPercentageToDegree:");
    double v13 = +[NTKSiderealWaypoint waypointWithType:degree:](NTKSiderealWaypoint, "waypointWithType:degree:", 1);
    [v7 addObject:v13];
  }
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __60__NTKSiderealDataSource__waypointsForTransitInfo_andEvents___block_invoke;
  v18[3] = &unk_1E62C2A30;
  id v14 = v7;
  id v19 = v14;
  [v6 enumerateObjectsUsingBlock:v18];
  double v15 = _NTKLoggingObjectForDomain(36, (uint64_t)"NTKLoggingDomainSidereal");
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    __int16 v21 = "+[NTKSiderealDataSource _waypointsForTransitInfo:andEvents:]";
    __int16 v22 = 2112;
    id v23 = v14;
    _os_log_impl(&dword_1BC5A9000, v15, OS_LOG_TYPE_INFO, "[NTKSiderealDataSource] %s: updated waypoints: %@", buf, 0x16u);
  }

  long long v16 = (void *)[v14 copy];
  return v16;
}

void __60__NTKSiderealDataSource__waypointsForTransitInfo_andEvents___block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  if ([v5 type] != 5 && objc_msgSend(v5, "type"))
  {
    id v3 = *(void **)(a1 + 32);
    id v4 = +[NTKSiderealWaypoint waypointFromSolarEvent:v5];
    [v3 addObject:v4];
  }
}

+ (id)_eventWithType:(int64_t)a3 time:(id)a4
{
  id v5 = a4;
  +[NTKSiderealDataSource reverseInterpolateBetweenCalendricalMidnights:v5];
  uint64_t v7 = +[NTKSiderealSolarEvent eventWithType:a3 time:v5 degree:v6 * 360.0];

  return v7;
}

+ (int64_t)_startOfDayEventPreceedingFirstSolarEvent:(int64_t)a3
{
  if (a3 >= 1) {
    return a3 - 1;
  }
  else {
    return 9;
  }
}

+ (int64_t)_endOfDayEventFollowingSolarEvent:(int64_t)a3
{
  if (a3 <= 8) {
    return a3 + 1;
  }
  else {
    return 0;
  }
}

+ (BOOL)_date:(id)a3 isBetweenDate:(id)a4 andDate:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  BOOL v9 = [v7 compare:a4] != -1 && objc_msgSend(v7, "compare:", v8) != 1;

  return v9;
}

+ (double)_solarPercentageToDegree:(double)a3
{
  return a3 * 360.0;
}

+ (double)reverseInterpolateBetweenCalendricalMidnights:(id)a3
{
  id v4 = a3;
  id v5 = objc_opt_class();
  objc_sync_enter(v5);
  if (!reverseInterpolateBetweenCalendricalMidnights___currentCalendar)
  {
    uint64_t v6 = [MEMORY[0x1E4F1C9A8] autoupdatingCurrentCalendar];
    id v7 = (void *)reverseInterpolateBetweenCalendricalMidnights___currentCalendar;
    reverseInterpolateBetweenCalendricalMidnights___currentCalendar = v6;
  }
  if (!reverseInterpolateBetweenCalendricalMidnights___cachedDate
    || (objc_msgSend((id)reverseInterpolateBetweenCalendricalMidnights___currentCalendar, "isDate:inSameDayAsDate:", v4) & 1) == 0)
  {
    objc_storeStrong((id *)&reverseInterpolateBetweenCalendricalMidnights___cachedDate, a3);
    uint64_t v8 = NTKStartOfDayForDate(v4);
    BOOL v9 = (void *)reverseInterpolateBetweenCalendricalMidnights___cachedStartOfDay;
    reverseInterpolateBetweenCalendricalMidnights___cachedStartOfDay = v8;

    uint64_t v10 = NTKStartOfNextDayForDate(v4);
    float v11 = (void *)reverseInterpolateBetweenCalendricalMidnights___cachedStartOfNextDay;
    reverseInterpolateBetweenCalendricalMidnights___cachedStartOfNextDay = v10;
  }
  double v12 = NTKPercentageOfDayDoneForDateWithStartAndEnd(v4, (void *)reverseInterpolateBetweenCalendricalMidnights___cachedStartOfDay, (void *)reverseInterpolateBetweenCalendricalMidnights___cachedStartOfNextDay);
  objc_sync_exit(v5);

  return v12;
}

+ ($F24F406B2B787EFB06265DBA3D28CBD5)_geoLocationForLocation:(id)a3
{
  id v3 = a3;
  [v3 coordinate];
  double v5 = v4;
  [v3 coordinate];
  double v7 = v6;

  double v8 = v5;
  double v9 = v7;
  result.double var1 = v9;
  result.double var0 = v8;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentData, 0);
  objc_storeStrong((id *)&self->_currentReferenceLocation, 0);
  objc_storeStrong((id *)&self->_currentReferenceDate, 0);
  objc_storeStrong((id *)&self->_locationManagerToken, 0);
  objc_storeStrong((id *)&self->_observers, 0);
}

+ (void)_dayEventsFromEvents:(os_log_t)log .cold.1(os_log_t log)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  int v1 = 136315394;
  int64_t v2 = "+[NTKSiderealDataSource _dayEventsFromEvents:]";
  __int16 v3 = 2112;
  uint64_t v4 = 0;
  _os_log_error_impl(&dword_1BC5A9000, log, OS_LOG_TYPE_ERROR, "[NTKSiderealDataSource] %s: Something has gone wrong calculating day events. We found none or 1, which isn't good. daytimeEvents: %@", (uint8_t *)&v1, 0x16u);
}

@end