@interface NTKSolarWaypoint
- (NSDate)waypointDate;
- (NSString)description;
- (NSString)localizedName;
- (NTKSolarTimeModel)solarTimeModel;
- (NTKSolarWaypoint)initWithType:(int64_t)a3 solarTimeModel:(id)a4;
- (double)percentageThroughPeriodForWaypointDate;
- (id)ntkCacheableKey;
- (int64_t)type;
- (void)updateDependentValues;
- (void)updateDependentValuesWithPlaceholderData;
@end

@implementation NTKSolarWaypoint

- (NTKSolarWaypoint)initWithType:(int64_t)a3 solarTimeModel:(id)a4
{
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)NTKSolarWaypoint;
  v8 = [(NTKSolarWaypoint *)&v12 init];
  v9 = v8;
  if (v8)
  {
    v8->_type = a3;
    objc_storeStrong((id *)&v8->_solarTimeModel, a4);
    v10 = v9;
  }

  return v9;
}

- (void)updateDependentValues
{
  switch(self->_type)
  {
    case 1:
      uint64_t v3 = [(NTKSolarTimeModel *)self->_solarTimeModel localDawnDate];
      break;
    case 2:
      uint64_t v3 = [(NTKSolarTimeModel *)self->_solarTimeModel localSunriseDate];
      break;
    case 3:
      uint64_t v3 = [(NTKSolarTimeModel *)self->_solarTimeModel localSolarNoonDate];
      break;
    case 4:
      uint64_t v3 = [(NTKSolarTimeModel *)self->_solarTimeModel localSunsetDate];
      break;
    case 5:
      uint64_t v3 = [(NTKSolarTimeModel *)self->_solarTimeModel localDuskDate];
      break;
    default:
      uint64_t v3 = [(NTKSolarTimeModel *)self->_solarTimeModel startDateForReferenceDate];
      break;
  }
  id obj = (id)v3;
  v4 = [MEMORY[0x1E4F1C9C8] distantPast];
  if ([obj isEqualToDate:v4])
  {

LABEL_11:
    waypointDate = self->_waypointDate;
    self->_waypointDate = 0;

    self->_percentageThroughPeriodForWaypointDate = -1.0;
    goto LABEL_12;
  }
  v5 = [MEMORY[0x1E4F1C9C8] distantFuture];
  int v6 = [obj isEqualToDate:v5];

  if (v6) {
    goto LABEL_11;
  }
  objc_storeStrong((id *)&self->_waypointDate, obj);
  [(NTKSolarTimeModel *)self->_solarTimeModel percentageThroughPeriodForDate:obj];
  v8 = obj;
  self->_percentageThroughPeriodForWaypointDate = v9;
  if (v9 >= 0.0 && v9 <= 1.0) {
    goto LABEL_13;
  }
  if (v9 >= 0.0 || v9 < -1.0)
  {
    if (v9 >= -1.0)
    {
      float v13 = v9;
      double v11 = fmodf(v13, 1.0);
    }
    else
    {
      float v12 = v9;
      double v11 = 1.0 - fmodf(-v12, 1.0);
    }
  }
  else
  {
    double v11 = v9 + 1.0;
  }
  self->_percentageThroughPeriodForWaypointDate = v11;
  -[NTKSolarTimeModel dateForPercentageThroughPeriod:](self->_solarTimeModel, "dateForPercentageThroughPeriod:");
  v14 = (NSDate *)objc_claimAutoreleasedReturnValue();
  v15 = self->_waypointDate;
  self->_waypointDate = v14;

LABEL_12:
  v8 = obj;
LABEL_13:
}

- (void)updateDependentValuesWithPlaceholderData
{
  unint64_t v3 = self->_type - 1;
  if (v3 > 4)
  {
    v4 = 0;
  }
  else
  {
    v4 = [(NTKSolarTimeModel *)self->_solarTimeModel dateForPercentageThroughPeriod:dbl_1BC8A0FE0[v3]];
  }
  waypointDate = self->_waypointDate;
  self->_waypointDate = v4;
  int v6 = v4;

  [(NTKSolarTimeModel *)self->_solarTimeModel percentageThroughPeriodForDate:v6];
  double v8 = v7;

  self->_percentageThroughPeriodForWaypointDate = v8;
}

- (NSString)localizedName
{
  localizedName = self->_localizedName;
  if (!localizedName)
  {
    unint64_t v4 = self->_type - 1;
    if (v4 > 4) {
      v5 = @"SOLAR_CUSTOM";
    }
    else {
      v5 = off_1E62C3BA8[v4];
    }
    unint64_t v6 = self->_type - 1;
    if (v6 > 4) {
      double v7 = @"SOLAR_CUSTOM";
    }
    else {
      double v7 = off_1E62C3BA8[v6];
    }
    NTKClockFaceLocalizedString(v5, v7);
    double v8 = (NSString *)objc_claimAutoreleasedReturnValue();
    double v9 = self->_localizedName;
    self->_localizedName = v8;

    localizedName = self->_localizedName;
  }
  return localizedName;
}

- (NSString)description
{
  unint64_t v3 = NSString;
  v10.receiver = self;
  v10.super_class = (Class)NTKSolarWaypoint;
  unint64_t v4 = [(NTKSolarWaypoint *)&v10 description];
  waypointDate = self->_waypointDate;
  double percentageThroughPeriodForWaypointDate = self->_percentageThroughPeriodForWaypointDate;
  double v7 = [(NTKSolarWaypoint *)self localizedName];
  double v8 = [v3 stringWithFormat:@"%@ date = (%@) percent = %.2f localizedName =\"%@\"", v4, waypointDate, *(void *)&percentageThroughPeriodForWaypointDate, v7];

  return (NSString *)v8;
}

- (id)ntkCacheableKey
{
  unint64_t v3 = NSString;
  unint64_t v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  unint64_t v6 = [v3 stringWithFormat:@"[%@:percent:%f-date:%@]", v5, *(void *)&self->_percentageThroughPeriodForWaypointDate, self->_waypointDate];

  return v6;
}

- (int64_t)type
{
  return self->_type;
}

- (NTKSolarTimeModel)solarTimeModel
{
  return self->_solarTimeModel;
}

- (NSDate)waypointDate
{
  return self->_waypointDate;
}

- (double)percentageThroughPeriodForWaypointDate
{
  return self->_percentageThroughPeriodForWaypointDate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_solarTimeModel, 0);
  objc_storeStrong((id *)&self->_localizedName, 0);
  objc_storeStrong((id *)&self->_waypointDate, 0);
}

@end