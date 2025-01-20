@interface MOTimeTagInterval
- (MOTimeTagInterval)initWithTimeTag:(unint64_t)a3 dateInterval:(id)a4;
- (NSDateInterval)dateInterval;
- (double)overlapsScoreForStartDate:(id)a3 endDate:(id)a4;
- (id)description;
- (unint64_t)timetag;
- (void)setDateInterval:(id)a3;
- (void)setTimetag:(unint64_t)a3;
@end

@implementation MOTimeTagInterval

- (MOTimeTagInterval)initWithTimeTag:(unint64_t)a3 dateInterval:(id)a4
{
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)MOTimeTagInterval;
  v8 = [(MOTimeTagInterval *)&v11 init];
  v9 = v8;
  if (v8)
  {
    v8->_timetag = a3;
    objc_storeStrong((id *)&v8->_dateInterval, a4);
  }

  return v9;
}

- (double)overlapsScoreForStartDate:(id)a3 endDate:(id)a4
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = _mo_log_facility_get_os_log(MOLogFacilityEventBundleManager);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    v27 = [(MOTimeTagInterval *)self dateInterval];
    v28 = [v27 startDate];
    v29 = [(MOTimeTagInterval *)self dateInterval];
    v30 = [v29 endDate];
    int v35 = 138413058;
    id v36 = v6;
    __int16 v37 = 2112;
    id v38 = v7;
    __int16 v39 = 2112;
    v40 = v28;
    __int16 v41 = 2112;
    v42 = v30;
    _os_log_debug_impl(&dword_1D24AE000, v8, OS_LOG_TYPE_DEBUG, "overlapsScoreForStartDate, startDate, %@, endDate, %@, self.startDate, %@, self.endDate, %@", (uint8_t *)&v35, 0x2Au);
  }
  if (!v7 || [v6 isEqualToDate:v7]) {
    goto LABEL_9;
  }
  if ([v6 isAfterDate:v7])
  {
    v9 = _mo_log_facility_get_os_log(MOLogFacilityEventBundleManager);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v31 = [(MOTimeTagInterval *)self dateInterval];
      v32 = [v31 startDate];
      v33 = [(MOTimeTagInterval *)self dateInterval];
      v34 = [v33 endDate];
      int v35 = 138413058;
      id v36 = v6;
      __int16 v37 = 2112;
      id v38 = v7;
      __int16 v39 = 2112;
      v40 = v32;
      __int16 v41 = 2112;
      v42 = v34;
      _os_log_error_impl(&dword_1D24AE000, v9, OS_LOG_TYPE_ERROR, "overlapsScoreForStartDate, invalid time range, startDate, %@, endDate, %@, self.startDate, %@, self.endDate, %@", (uint8_t *)&v35, 0x2Au);
    }
LABEL_9:
    v10 = [(MOTimeTagInterval *)self dateInterval];
    int v11 = [v10 containsDate:v6];

    if (v11) {
      double v12 = 1.0;
    }
    else {
      double v12 = 0.0;
    }
    goto LABEL_12;
  }
  v14 = (void *)[objc_alloc(MEMORY[0x1E4F28C18]) initWithStartDate:v6 endDate:v7];
  [v14 duration];
  double v12 = 0.0;
  if (v15 > 0.0)
  {
    v16 = [(MOTimeTagInterval *)self dateInterval];
    int v17 = [v16 intersectsDateInterval:v14];

    if (v17)
    {
      v18 = [(MOTimeTagInterval *)self dateInterval];
      v19 = [v18 intersectionWithDateInterval:v14];
      [v19 duration];
      double v21 = v20;

      [v14 duration];
      double v23 = v22 - v21;
      [v14 duration];
      double v25 = v21 / v24;
      if (v25 > 0.5 && v23 < 1800.0) {
        double v12 = 1.0;
      }
      else {
        double v12 = v25;
      }
    }
  }

LABEL_12:
  return v12;
}

- (id)description
{
  v3 = NSString;
  v4 = +[MOTime timeStringFromTimeTag:[(MOTimeTagInterval *)self timetag]];
  v5 = [(MOTimeTagInterval *)self dateInterval];
  id v6 = [v3 stringWithFormat:@"Interval: timetag, %@, interval, %@", v4, v5];

  return v6;
}

- (unint64_t)timetag
{
  return self->_timetag;
}

- (void)setTimetag:(unint64_t)a3
{
  self->_timetag = a3;
}

- (NSDateInterval)dateInterval
{
  return self->_dateInterval;
}

- (void)setDateInterval:(id)a3
{
}

- (void).cxx_destruct
{
}

@end