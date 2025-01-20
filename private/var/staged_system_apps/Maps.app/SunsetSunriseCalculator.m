@interface SunsetSunriseCalculator
+ (SunsetSunriseCalculator)sharedCalculator;
- (GEOAlmanac)almanac;
- (SunsetSunriseCalculator)init;
- (id)_sunriseForLocation:(id)a3;
- (id)_sunsetForLocation:(id)a3;
- (int64_t)currentStateForLocation:(id)a3 offsetThreshold:(double)a4;
@end

@implementation SunsetSunriseCalculator

- (SunsetSunriseCalculator)init
{
  v6.receiver = self;
  v6.super_class = (Class)SunsetSunriseCalculator;
  v2 = [(SunsetSunriseCalculator *)&v6 init];
  if (v2)
  {
    v3 = (GEOAlmanac *)objc_alloc_init((Class)GEOAlmanac);
    almanac = v2->_almanac;
    v2->_almanac = v3;
  }
  return v2;
}

+ (SunsetSunriseCalculator)sharedCalculator
{
  if (qword_101610990 != -1) {
    dispatch_once(&qword_101610990, &stru_10131A580);
  }
  v2 = (void *)qword_101610988;

  return (SunsetSunriseCalculator *)v2;
}

- (int64_t)currentStateForLocation:(id)a3 offsetThreshold:(double)a4
{
  id v6 = a3;
  if (v6)
  {
    v7 = [(SunsetSunriseCalculator *)self almanac];
    [v6 coordinate];
    double v9 = v8;
    double v11 = v10;
    +[NSDate timeIntervalSinceReferenceDate];
    int64_t v12 = 2;
    [v7 calculateAstronomicalTimeForLocation:2 time:v9 altitudeInDegrees:v11 options:GEOAlmanacAltitudeMiddleOfCivilTwilight];

    v14 = [(SunsetSunriseCalculator *)self almanac];
    v15 = [v14 sunset];
    v16 = +[NSDate date];
    [v15 timeIntervalSinceDate:v16];
    double v18 = v17;

    v19 = [(SunsetSunriseCalculator *)self almanac];
    unsigned int v20 = [v19 isDayLight];

    v21 = +[NSDate date];
    v22 = [(SunsetSunriseCalculator *)self almanac];
    v23 = [v22 sunrise];
    [v21 timeIntervalSinceDate:v23];
    double v25 = v24;

    if (v18 <= 0.0 || v18 > a4)
    {
      BOOL v26 = v25 > a4 || v25 <= 0.0;
      uint64_t v27 = 4;
      if (v26) {
        uint64_t v27 = 1;
      }
      if (v20) {
        int64_t v12 = v27;
      }
      else {
        int64_t v12 = 3;
      }
    }
  }
  else
  {
    int64_t v12 = 0;
  }

  return v12;
}

- (GEOAlmanac)almanac
{
  return self->_almanac;
}

- (id)_sunsetForLocation:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    v5 = [(SunsetSunriseCalculator *)self almanac];
    [v4 coordinate];
    double v7 = v6;
    double v9 = v8;

    +[NSDate timeIntervalSinceReferenceDate];
    [v5 calculateAstronomicalTimeForLocation:2 time:v7 altitudeInDegrees:v9 options:GEOAlmanacAltitudeMiddleOfCivilTwilight];

    double v11 = [(SunsetSunriseCalculator *)self almanac];
    int64_t v12 = [v11 sunset];
  }
  else
  {
    int64_t v12 = 0;
  }

  return v12;
}

- (id)_sunriseForLocation:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    v5 = [(SunsetSunriseCalculator *)self almanac];
    [v4 coordinate];
    double v7 = v6;
    double v9 = v8;

    +[NSDate timeIntervalSinceReferenceDate];
    [v5 calculateAstronomicalTimeForLocation:2 time:v7 altitudeInDegrees:v9 options:GEOAlmanacAltitudeMiddleOfCivilTwilight];

    double v11 = [(SunsetSunriseCalculator *)self almanac];
    int64_t v12 = [v11 sunrise];
  }
  else
  {
    int64_t v12 = 0;
  }

  return v12;
}

- (void).cxx_destruct
{
}

@end