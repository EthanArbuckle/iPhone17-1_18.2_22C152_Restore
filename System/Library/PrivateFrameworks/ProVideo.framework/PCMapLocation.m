@interface PCMapLocation
+ (BOOL)supportsSecureCoding;
+ (id)dictionaryFromArrayOfLocations:(id)a3;
+ (void)removeLocationsFromArray:(id)a3 withinDistance:(float)a4 ofSameLocationsInDictionary:(id)a5;
- (BOOL)hasSamePositionAsLocation:(id)a3 tolerance:(float)a4;
- (BOOL)isEqualToLocation:(id)a3;
- (NSString)airportCode;
- (NSString)airportName;
- (NSString)countryName;
- (NSString)locationName;
- (NSString)name;
- (PCMapLocation)init;
- (PCMapLocation)initWithCoder:(id)a3;
- (float)latitude;
- (float)longitude;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)stringRepresentation;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)setAirportCode:(id)a3;
- (void)setAirportName:(id)a3;
- (void)setCountryName:(id)a3;
- (void)setLatitude:(float)a3;
- (void)setLocationName:(id)a3;
- (void)setLongitude:(float)a3;
- (void)setName:(id)a3;
@end

@implementation PCMapLocation

- (PCMapLocation)init
{
  v3.receiver = self;
  v3.super_class = (Class)PCMapLocation;
  result = [(PCMapLocation *)&v3 init];
  if (result)
  {
    *(_OWORD *)&result->_airportCode = 0u;
    *(_OWORD *)&result->_countryName = 0u;
    *(_OWORD *)&result->_latitude = 0u;
  }
  return result;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)PCMapLocation;
  [(PCMapLocation *)&v3 dealloc];
}

- (id)description
{
  objc_super v3 = (void *)[(id)objc_msgSend(@"MapLocation:\n" stringByAppendingFormat:@"     name = %@\n", -[PCMapLocation name](self, "name")), "stringByAppendingFormat:", @"     countryName = %@\n", -[PCMapLocation countryName](self, "countryName")];
  [(PCMapLocation *)self latitude];
  v5 = objc_msgSend(v3, "stringByAppendingFormat:", @"     latitude = %f\n", v4);
  [(PCMapLocation *)self longitude];
  return (id)[(id)objc_msgSend((id)objc_msgSend(v5 stringByAppendingFormat:@"     longitude = %f\n", v6), "stringByAppendingFormat:", @"     airportCode = %@\n", -[PCMapLocation airportCode](self, "airportCode")), "stringByAppendingFormat:", @"     airportName = %@\n", -[PCMapLocation airportName](self, "airportName")];
}

- (id)stringRepresentation
{
  objc_super v3 = NSString;
  float v4 = [(PCMapLocation *)self name];
  v5 = [(PCMapLocation *)self countryName];
  [(PCMapLocation *)self latitude];
  double v7 = v6;
  [(PCMapLocation *)self longitude];
  return (id)[v3 stringWithFormat:@"[name = %@, countryName = %@, latitude = %f, longitude = %f, airportCode = %@, airportName = %@]", v4, v5, *(void *)&v7, v8, -[PCMapLocation airportCode](self, "airportCode"), -[PCMapLocation airportName](self, "airportName")];
}

- (NSString)locationName
{
  if (self->_locationName) {
    return self->_locationName;
  }
  else {
    return [(PCMapLocation *)self countryName];
  }
}

- (BOOL)isEqualToLocation:(id)a3
{
  [(PCMapLocation *)self latitude];
  float v6 = v5;
  [a3 latitude];
  if (v6 != v7) {
    return 0;
  }
  [(PCMapLocation *)self longitude];
  float v9 = v8;
  [a3 longitude];
  if (v9 != v10) {
    return 0;
  }
  v11 = [(PCMapLocation *)self name];
  uint64_t v12 = [a3 name];

  return [(NSString *)v11 isEqualToString:v12];
}

- (BOOL)hasSamePositionAsLocation:(id)a3 tolerance:(float)a4
{
  [(PCMapLocation *)self latitude];
  float v8 = v7;
  [a3 latitude];
  float v10 = v8 - v9;
  [(PCMapLocation *)self longitude];
  float v12 = v11;
  [a3 longitude];
  return sqrtf((float)(v10 * v10) + (float)((float)(v12 - v13) * (float)(v12 - v13))) <= a4;
}

+ (id)dictionaryFromArrayOfLocations:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  float v4 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v5 = [a3 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(a3);
        }
        float v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        float v10 = objc_msgSend(v4, "objectForKey:", objc_msgSend(v9, "name"));
        if (v10)
        {
          [v10 addObject:v9];
        }
        else
        {
          float v11 = (void *)[MEMORY[0x1E4F1CA48] array];
          [v11 addObject:v9];
          objc_msgSend(v4, "setObject:forKey:", v11, objc_msgSend(v9, "name"));
        }
      }
      uint64_t v6 = [a3 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v6);
  }
  return v4;
}

+ (void)removeLocationsFromArray:(id)a3 withinDistance:(float)a4 ofSameLocationsInDictionary:(id)a5
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  v26 = (void *)[MEMORY[0x1E4F1CA48] array];
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  uint64_t v7 = [a3 countByEnumeratingWithState:&v31 objects:v36 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v32;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v32 != v9) {
          objc_enumerationMutation(a3);
        }
        float v11 = *(void **)(*((void *)&v31 + 1) + 8 * i);
        float v12 = objc_msgSend(a5, "objectForKey:", objc_msgSend(v11, "name"));
        long long v27 = 0u;
        long long v28 = 0u;
        long long v29 = 0u;
        long long v30 = 0u;
        uint64_t v13 = [v12 countByEnumeratingWithState:&v27 objects:v35 count:16];
        if (v13)
        {
          uint64_t v14 = v13;
          uint64_t v15 = *(void *)v28;
          while (2)
          {
            for (uint64_t j = 0; j != v14; ++j)
            {
              if (*(void *)v28 != v15) {
                objc_enumerationMutation(v12);
              }
              v17 = *(void **)(*((void *)&v27 + 1) + 8 * j);
              if (![v17 airportCode])
              {
                [v17 latitude];
                float v19 = v18;
                [v11 latitude];
                float v21 = v19 - v20;
                [v17 longitude];
                float v23 = v22;
                [v11 longitude];
                if (sqrtf((float)(v21 * v21) + (float)((float)(v23 - v24) * (float)(v23 - v24))) < a4)
                {
                  [v26 addObject:v11];
                  goto LABEL_17;
                }
              }
            }
            uint64_t v14 = [v12 countByEnumeratingWithState:&v27 objects:v35 count:16];
            if (v14) {
              continue;
            }
            break;
          }
        }
LABEL_17:
        ;
      }
      uint64_t v8 = [a3 countByEnumeratingWithState:&v31 objects:v36 count:16];
    }
    while (v8);
  }
  [a3 removeObjectsInArray:v26];
}

- (id)copyWithZone:(_NSZone *)a3
{
  float v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  if (v4)
  {
    objc_msgSend(v4, "setName:", -[PCMapLocation name](self, "name"));
    objc_msgSend(v4, "setCountryName:", -[PCMapLocation countryName](self, "countryName"));
    if ([(PCMapLocation *)self locationName]) {
      objc_msgSend(v4, "setLocationName:", -[PCMapLocation locationName](self, "locationName"));
    }
    [(PCMapLocation *)self latitude];
    objc_msgSend(v4, "setLatitude:");
    [(PCMapLocation *)self longitude];
    objc_msgSend(v4, "setLongitude:");
    objc_msgSend(v4, "setAirportCode:", -[PCMapLocation airportCode](self, "airportCode"));
    objc_msgSend(v4, "setAirportName:", -[PCMapLocation airportName](self, "airportName"));
  }
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  [a3 encodeObject:self->_name forKey:@"Name"];
  [a3 encodeObject:self->_countryName forKey:@"CountryName"];
  locationName = self->_locationName;
  if (locationName) {
    [a3 encodeObject:locationName forKey:@"LocationName"];
  }
  *(float *)&double v5 = self->_latitude;
  [a3 encodeFloat:@"Latitude" forKey:v5];
  *(float *)&double v7 = self->_longitude;
  [a3 encodeFloat:@"Longitude" forKey:v7];
  [a3 encodeObject:self->_airportCode forKey:@"AirportCode"];
  airportName = self->_airportName;

  [a3 encodeObject:airportName forKey:@"AirportNameKey"];
}

- (PCMapLocation)initWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)PCMapLocation;
  float v4 = [(PCMapLocation *)&v6 init];
  if (v4)
  {
    -[PCMapLocation setName:](v4, "setName:", [a3 decodeObjectOfClass:objc_opt_class() forKey:@"Name"]);
    -[PCMapLocation setCountryName:](v4, "setCountryName:", [a3 decodeObjectOfClass:objc_opt_class() forKey:@"CountryName"]);
    -[PCMapLocation setLocationName:](v4, "setLocationName:", [a3 decodeObjectOfClass:objc_opt_class() forKey:@"LocationName"]);
    [a3 decodeFloatForKey:@"Latitude"];
    -[PCMapLocation setLatitude:](v4, "setLatitude:");
    [a3 decodeFloatForKey:@"Longitude"];
    -[PCMapLocation setLongitude:](v4, "setLongitude:");
    -[PCMapLocation setAirportCode:](v4, "setAirportCode:", [a3 decodeObjectOfClass:objc_opt_class() forKey:@"AirportCode"]);
    -[PCMapLocation setAirportName:](v4, "setAirportName:", [a3 decodeObjectOfClass:objc_opt_class() forKey:@"AirportNameKey"]);
  }
  return v4;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (NSString)countryName
{
  return self->_countryName;
}

- (void)setCountryName:(id)a3
{
}

- (void)setLocationName:(id)a3
{
}

- (float)latitude
{
  return self->_latitude;
}

- (void)setLatitude:(float)a3
{
  self->_latitude = a3;
}

- (float)longitude
{
  return self->_longitude;
}

- (void)setLongitude:(float)a3
{
  self->_longitude = a3;
}

- (NSString)airportCode
{
  return self->_airportCode;
}

- (void)setAirportCode:(id)a3
{
}

- (NSString)airportName
{
  return self->_airportName;
}

- (void)setAirportName:(id)a3
{
}

@end