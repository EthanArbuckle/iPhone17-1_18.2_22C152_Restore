@interface NTKSiderealWaypoint
+ (BOOL)supportsSecureCoding;
+ (id)waypointFromSolarEvent:(id)a3;
+ (id)waypointWithType:(int64_t)a3 degree:(double)a4;
+ (int64_t)_waypointTypeFromSolarEventType:(int64_t)a3;
- (NTKSiderealWaypoint)initWithCoder:(id)a3;
- (NTKSiderealWaypoint)initWithType:(int64_t)a3 degree:(double)a4;
- (double)degree;
- (id)debugDescription;
- (id)description;
- (id)localizedName;
- (int64_t)type;
- (void)encodeWithCoder:(id)a3;
- (void)setDegree:(double)a3;
- (void)setType:(int64_t)a3;
@end

@implementation NTKSiderealWaypoint

+ (id)waypointFromSolarEvent:(id)a3
{
  id v3 = a3;
  int64_t v4 = +[NTKSiderealWaypoint _waypointTypeFromSolarEventType:](NTKSiderealWaypoint, "_waypointTypeFromSolarEventType:", [v3 type]);
  [v3 degree];
  double v6 = v5;

  return +[NTKSiderealWaypoint waypointWithType:v4 degree:v6];
}

+ (id)waypointWithType:(int64_t)a3 degree:(double)a4
{
  int64_t v4 = [[NTKSiderealWaypoint alloc] initWithType:a3 degree:a4];
  return v4;
}

- (NTKSiderealWaypoint)initWithType:(int64_t)a3 degree:(double)a4
{
  v7.receiver = self;
  v7.super_class = (Class)NTKSiderealWaypoint;
  result = [(NTKSiderealWaypoint *)&v7 init];
  if (result)
  {
    result->_type = a3;
    result->_degree = a4;
  }
  return result;
}

- (NTKSiderealWaypoint)initWithCoder:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)NTKSiderealWaypoint;
  double v5 = [(NTKSiderealWaypoint *)&v10 init];
  if (v5)
  {
    double v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"type"];
    v5->_type = [v6 integerValue];

    objc_super v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"degree"];
    [v7 doubleValue];
    v5->_degree = v8;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = NSNumber;
  int64_t type = self->_type;
  id v6 = a3;
  objc_super v7 = [v4 numberWithInteger:type];
  [v6 encodeObject:v7 forKey:@"type"];

  id v8 = [NSNumber numberWithDouble:self->_degree];
  [v6 encodeObject:v8 forKey:@"degree"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)description
{
  return (id)objc_msgSend(NSString, "stringWithFormat:", @"type: %ld degree: %f°", self->_type, *(void *)&self->_degree);
}

- (id)debugDescription
{
  return (id)objc_msgSend(NSString, "stringWithFormat:", @"type: %ld degree: %f°", self->_type, *(void *)&self->_degree);
}

- (id)localizedName
{
  switch(self->_type)
  {
    case 0:
      v2 = NTKBundle();
      id v3 = v2;
      id v4 = @"SOLAR_NOON";
      goto LABEL_13;
    case 1:
      v2 = NTKBundle();
      id v3 = v2;
      id v4 = @"SOLAR_SOLAR_MIDNIGHT";
      goto LABEL_13;
    case 2:
      v2 = NTKBundle();
      id v3 = v2;
      id v4 = @"SOLAR_SUNRISE";
      goto LABEL_13;
    case 3:
      v2 = NTKBundle();
      id v3 = v2;
      id v4 = @"SOLAR_SUNSET";
      goto LABEL_13;
    case 4:
      v2 = NTKBundle();
      id v3 = v2;
      id v4 = @"SOLAR_CIVIL_DAWN";
      goto LABEL_13;
    case 5:
      v2 = NTKBundle();
      id v3 = v2;
      id v4 = @"SOLAR_CIVIL_DUSK";
      goto LABEL_13;
    case 6:
      v2 = NTKBundle();
      id v3 = v2;
      id v4 = @"SOLAR_NAUTICAL_DAWN";
      goto LABEL_13;
    case 7:
      v2 = NTKBundle();
      id v3 = v2;
      id v4 = @"SOLAR_NAUTICAL_DUSK";
      goto LABEL_13;
    case 8:
      v2 = NTKBundle();
      id v3 = v2;
      id v4 = @"SOLAR_ASTRONOMICAL_DAWN";
      goto LABEL_13;
    case 9:
      v2 = NTKBundle();
      id v3 = v2;
      id v4 = @"SOLAR_ASTRONOMICAL_DUSK";
LABEL_13:
      double v5 = [v2 localizedStringForKey:v4 value:&stru_1F1635E90 table:@"Sidereal"];

      break;
    default:
      double v5 = 0;
      break;
  }
  return v5;
}

+ (int64_t)_waypointTypeFromSolarEventType:(int64_t)a3
{
  if ((unint64_t)a3 > 9) {
    return 0;
  }
  else {
    return qword_1BC8A13F8[a3];
  }
}

- (double)degree
{
  return self->_degree;
}

- (void)setDegree:(double)a3
{
  self->_degree = a3;
}

- (int64_t)type
{
  return self->_type;
}

- (void)setType:(int64_t)a3
{
  self->_int64_t type = a3;
}

@end