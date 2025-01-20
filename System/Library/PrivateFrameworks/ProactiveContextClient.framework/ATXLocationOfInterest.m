@interface ATXLocationOfInterest
+ (BOOL)supportsSecureCoding;
- (ATXLocationOfInterest)initWithCoder:(id)a3;
- (ATXLocationOfInterest)initWithUUID:(id)a3 visits:(id)a4 coordinate:(CLLocationCoordinate2D)a5;
- (ATXLocationOfInterest)initWithUUID:(id)a3 visits:(id)a4 coordinate:(CLLocationCoordinate2D)a5 type:(int64_t)a6;
- (ATXLocationOfInterest)initWithUUID:(id)a3 visits:(id)a4 coordinate:(CLLocationCoordinate2D)a5 type:(int64_t)a6 city:(id)a7;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToLocation:(id)a3;
- (CLLocationCoordinate2D)coordinate;
- (NSArray)visits;
- (NSString)city;
- (NSUUID)uuid;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)type;
- (unint64_t)hash;
- (void)addVisitFrom:(unint64_t)a3 to:(unint64_t)a4;
- (void)encodeWithCoder:(id)a3;
- (void)setCoordinate:(CLLocationCoordinate2D)a3;
@end

@implementation ATXLocationOfInterest

- (ATXLocationOfInterest)initWithUUID:(id)a3 visits:(id)a4 coordinate:(CLLocationCoordinate2D)a5 type:(int64_t)a6 city:(id)a7
{
  CLLocationDegrees longitude = a5.longitude;
  CLLocationDegrees latitude = a5.latitude;
  id v15 = a3;
  id v16 = a4;
  id v17 = a7;
  if (!v15)
  {
    v23 = [MEMORY[0x1E4F28B00] currentHandler];
    [v23 handleFailureInMethod:a2, self, @"ATXLocationOfInterest.m", 22, @"Invalid parameter not satisfying: %@", @"uuid" object file lineNumber description];
  }
  v24.receiver = self;
  v24.super_class = (Class)ATXLocationOfInterest;
  v18 = [(ATXLocationOfInterest *)&v24 init];
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_uuid, a3);
    if (v16) {
      v20 = (NSArray *)v16;
    }
    else {
      v20 = (NSArray *)objc_opt_new();
    }
    visits = v19->_visits;
    v19->_visits = v20;

    v19->_type = a6;
    v19->_coordinate.CLLocationDegrees latitude = latitude;
    v19->_coordinate.CLLocationDegrees longitude = longitude;
    objc_storeStrong((id *)&v19->_city, a7);
  }

  return v19;
}

- (ATXLocationOfInterest)initWithUUID:(id)a3 visits:(id)a4 coordinate:(CLLocationCoordinate2D)a5 type:(int64_t)a6
{
  return -[ATXLocationOfInterest initWithUUID:visits:coordinate:type:city:](self, "initWithUUID:visits:coordinate:type:city:", a3, a4, a6, 0, a5.latitude, a5.longitude);
}

- (ATXLocationOfInterest)initWithUUID:(id)a3 visits:(id)a4 coordinate:(CLLocationCoordinate2D)a5
{
  return -[ATXLocationOfInterest initWithUUID:visits:coordinate:type:](self, "initWithUUID:visits:coordinate:type:", a3, a4, -1, a5.latitude, a5.longitude);
}

- (void)addVisitFrom:(unint64_t)a3 to:(unint64_t)a4
{
  visits = self->_visits;
  objc_msgSend(MEMORY[0x1E4F29238], "valueWithRange:", a3, a4 - a3);
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  v6 = [(NSArray *)visits arrayByAddingObject:v8];
  v7 = self->_visits;
  self->_visits = v6;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (ATXLocationOfInterest *)a3;
  v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(ATXLocationOfInterest *)self isEqualToLocation:v5];

  return v6;
}

- (BOOL)isEqualToLocation:(id)a3
{
  v4 = self->_uuid;
  v5 = v4;
  if (v4 == *((NSUUID **)a3 + 1)) {
    char v6 = 1;
  }
  else {
    char v6 = -[NSUUID isEqual:](v4, "isEqual:");
  }

  return v6;
}

- (unint64_t)hash
{
  return [(NSUUID *)self->_uuid hash];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ATXLocationOfInterest)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"uuid"];
  if ([v4 containsValueForKey:@"type"]) {
    uint64_t v6 = [v4 decodeIntegerForKey:@"type"];
  }
  else {
    uint64_t v6 = -1;
  }
  [v4 decodeDoubleForKey:@"latitude"];
  CLLocationDegrees v8 = v7;
  [v4 decodeDoubleForKey:@"longitude"];
  CLLocationCoordinate2D v10 = CLLocationCoordinate2DMake(v8, v9);
  v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"city"];
  v12 = -[ATXLocationOfInterest initWithUUID:visits:coordinate:type:city:](self, "initWithUUID:visits:coordinate:type:city:", v5, 0, v6, v11, v10.latitude, v10.longitude);

  return v12;
}

- (void)encodeWithCoder:(id)a3
{
  id v5 = a3;
  [v5 encodeObject:self->_uuid forKey:@"uuid"];
  [v5 encodeInteger:self->_type forKey:@"type"];
  [v5 encodeDouble:@"latitude" forKey:self->_coordinate.latitude];
  [v5 encodeDouble:@"longitude" forKey:self->_coordinate.longitude];
  city = self->_city;
  if (city) {
    [v5 encodeObject:city forKey:@"city"];
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  uint64_t v6 = (void *)[(NSUUID *)self->_uuid copyWithZone:a3];
  double v7 = (void *)[(NSArray *)self->_visits copyWithZone:a3];
  CLLocationDegrees v8 = objc_msgSend(v5, "initWithUUID:visits:coordinate:type:city:", v6, v7, self->_type, self->_city, self->_coordinate.latitude, self->_coordinate.longitude);

  return v8;
}

- (id)description
{
  v3 = NSString;
  id v4 = [(NSUUID *)self->_uuid UUIDString];
  id v5 = [v3 stringWithFormat:@"ATXLocationOfInterest uuid:%@ visits:%@ type:%ld lat:%f long:%f city:%@", v4, self->_visits, self->_type, *(void *)&self->_coordinate.latitude, *(void *)&self->_coordinate.longitude, self->_city];

  return v5;
}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (NSArray)visits
{
  return self->_visits;
}

- (int64_t)type
{
  return self->_type;
}

- (CLLocationCoordinate2D)coordinate
{
  double latitude = self->_coordinate.latitude;
  double longitude = self->_coordinate.longitude;
  result.double longitude = longitude;
  result.double latitude = latitude;
  return result;
}

- (void)setCoordinate:(CLLocationCoordinate2D)a3
{
  self->_coordinate = a3;
}

- (NSString)city
{
  return self->_city;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_city, 0);
  objc_storeStrong((id *)&self->_visits, 0);

  objc_storeStrong((id *)&self->_uuid, 0);
}

@end