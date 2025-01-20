@interface CLWifiAssociatedApCentroidDO
- (BOOL)isEqual:(id)a3;
- (CLWifiAssociatedApCentroidDO)initWithMac:(id)a3 latitude:(double)a4 longitude:(double)a5 altitude:(double)a6 horizontalAccuracy:(double)a7 verticalAccuracy:(double)a8 reach:(int)a9 stationaryTimeInSeconds:(double)a10 loiType:(id)a11 lastUpdated:(double)a12;
- (CLWifiAssociatedApCentroidDO)initWithNSDictionary:(id)a3;
- (NSString)loiType;
- (NSString)mac;
- (double)altitude;
- (double)horizontalAccuracy;
- (double)lastUpdated;
- (double)latitude;
- (double)longitude;
- (double)stationaryTimeInSeconds;
- (double)verticalAccuracy;
- (id)description;
- (id)toNSDictionary;
- (int)reach;
- (void)dealloc;
- (void)setAltitude:(double)a3;
- (void)setHorizontalAccuracy:(double)a3;
- (void)setLastUpdated:(double)a3;
- (void)setLatitude:(double)a3;
- (void)setLoiType:(id)a3;
- (void)setLongitude:(double)a3;
- (void)setMac:(id)a3;
- (void)setReach:(int)a3;
- (void)setStationaryTimeInSeconds:(double)a3;
- (void)setVerticalAccuracy:(double)a3;
@end

@implementation CLWifiAssociatedApCentroidDO

- (CLWifiAssociatedApCentroidDO)initWithMac:(id)a3 latitude:(double)a4 longitude:(double)a5 altitude:(double)a6 horizontalAccuracy:(double)a7 verticalAccuracy:(double)a8 reach:(int)a9 stationaryTimeInSeconds:(double)a10 loiType:(id)a11 lastUpdated:(double)a12
{
  v24.receiver = self;
  v24.super_class = (Class)CLWifiAssociatedApCentroidDO;
  v22 = [(CLWifiAssociatedApCentroidDO *)&v24 init];
  if (v22)
  {
    v22->_mac = (NSString *)[objc_alloc((Class)NSString) initWithString:a3];
    v22->_horizontalAccuracy = a7;
    v22->_latitude = a4;
    v22->_longitude = a5;
    v22->_altitude = a6;
    v22->_reach = a9;
    v22->_stationaryTimeInSeconds = a10;
    v22->_verticalAccuracy = a8;
    v22->_loiType = (NSString *)[objc_alloc((Class)NSString) initWithString:a11];
    v22->_lastUpdated = a12;
  }
  return v22;
}

- (CLWifiAssociatedApCentroidDO)initWithNSDictionary:(id)a3
{
  id v5 = [a3 objectForKey:@"mac"];
  [objc_msgSend(a3, "objectForKey:", @"latitude") doubleValue];
  double v7 = v6;
  [objc_msgSend(a3, "objectForKey:", @"longitude") doubleValue];
  double v9 = v8;
  [objc_msgSend(a3, "objectForKey:", @"altitude") doubleValue];
  double v11 = v10;
  [objc_msgSend(a3, "objectForKey:", @"horizontalAccuracy") doubleValue];
  double v13 = v12;
  [objc_msgSend(a3, "objectForKey:", @"verticalAccuracy") doubleValue];
  double v15 = v14;
  id v16 = [[a3 objectForKey:@"reach"] intValue];
  [objc_msgSend(a3, "objectForKey:", @"stationaryTimeInSeconds") doubleValue];
  double v18 = v17;
  id v19 = [a3 objectForKey:@"loiType"];
  [objc_msgSend(a3, "objectForKey:", @"lastUpdated") doubleValue];

  return [(CLWifiAssociatedApCentroidDO *)self initWithMac:v5 latitude:v16 longitude:v19 altitude:v7 horizontalAccuracy:v9 verticalAccuracy:v11 reach:v13 stationaryTimeInSeconds:v15 loiType:v18 lastUpdated:v20];
}

- (id)toNSDictionary
{
  id v3 = +[NSMutableDictionary dictionary];
  [v3 setObject:self->_mac forKey:@"mac"];
  [v3 setObject:[+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", self->_latitude)] forKey:@"latitude"];
  [v3 setObject:[NSNumber numberWithDouble:self->_longitude] forKey:@"longitude"];
  [v3 setObject:[NSNumber numberWithDouble:self->_altitude] forKey:@"altitude"];
  [v3 setObject:[NSNumber numberWithDouble:self->_horizontalAccuracy] forKey:@"horizontalAccuracy"];
  [v3 setObject:[+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", self->_verticalAccuracy)] forKey:@"verticalAccuracy"];
  [v3 setObject:[+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_reach)] forKey:@"reach"];
  [v3 setObject:[NSNumber numberWithDouble:self->_stationaryTimeInSeconds] forKey:@"stationaryTimeInSeconds"];
  [v3 setObject:self->_loiType forKey:@"loiType"];
  [v3 setObject:[+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", self->_lastUpdated)] forKey:@"lastUpdated"];
  return v3;
}

- (BOOL)isEqual:(id)a3
{
  unsigned int v5 = [a3 isMemberOfClass:objc_opt_class()];
  if (v5)
  {
    unsigned int v5 = -[NSString isEqualToString:](self->_mac, "isEqualToString:", [a3 mac]);
    if (v5)
    {
      double latitude = self->_latitude;
      [a3 latitude];
      if (latitude != v7) {
        goto LABEL_12;
      }
      double longitude = self->_longitude;
      [a3 longitude];
      if (longitude != v9) {
        goto LABEL_12;
      }
      double altitude = self->_altitude;
      [a3 altitude];
      if (altitude != v11) {
        goto LABEL_12;
      }
      double horizontalAccuracy = self->_horizontalAccuracy;
      [a3 horizontalAccuracy];
      if (horizontalAccuracy == v13
        && (double verticalAccuracy = self->_verticalAccuracy, [a3 verticalAccuracy], verticalAccuracy == v15)
        && (int reach = self->_reach, reach == [a3 reach])
        && (double stationaryTimeInSeconds = self->_stationaryTimeInSeconds,
            [a3 stationaryTimeInSeconds],
            stationaryTimeInSeconds == v18))
      {
        unsigned int v5 = -[NSString isEqualToString:](self->_loiType, "isEqualToString:", [a3 loiType]);
        if (v5)
        {
          double lastUpdated = self->_lastUpdated;
          [a3 lastUpdated];
          LOBYTE(v5) = lastUpdated == v20;
        }
      }
      else
      {
LABEL_12:
        LOBYTE(v5) = 0;
      }
    }
  }
  return v5;
}

- (id)description
{
  id v3 = (objc_class *)objc_opt_class();
  return +[NSString stringWithFormat:@"%@,<mac, %@, lat, %f, lng, %f, alt, %f, hacc, %f, vacc, %f, reach, %d, stationaryTimeInSeconds, %f, loiType, %@, lastUpdated, %f>", NSStringFromClass(v3), self->_mac, *(void *)&self->_latitude, *(void *)&self->_longitude, *(void *)&self->_altitude, *(void *)&self->_horizontalAccuracy, *(void *)&self->_verticalAccuracy, self->_reach, *(void *)&self->_stationaryTimeInSeconds, self->_loiType, *(void *)&self->_lastUpdated];
}

- (void)dealloc
{
  self->_mac = 0;
  self->_loiType = 0;
  v3.receiver = self;
  v3.super_class = (Class)CLWifiAssociatedApCentroidDO;
  [(CLWifiAssociatedApCentroidDO *)&v3 dealloc];
}

- (double)altitude
{
  return self->_altitude;
}

- (void)setAltitude:(double)a3
{
  self->_double altitude = a3;
}

- (double)horizontalAccuracy
{
  return self->_horizontalAccuracy;
}

- (void)setHorizontalAccuracy:(double)a3
{
  self->_double horizontalAccuracy = a3;
}

- (double)latitude
{
  return self->_latitude;
}

- (void)setLatitude:(double)a3
{
  self->_double latitude = a3;
}

- (NSString)loiType
{
  return self->_loiType;
}

- (void)setLoiType:(id)a3
{
}

- (double)longitude
{
  return self->_longitude;
}

- (void)setLongitude:(double)a3
{
  self->_double longitude = a3;
}

- (NSString)mac
{
  return self->_mac;
}

- (void)setMac:(id)a3
{
}

- (int)reach
{
  return self->_reach;
}

- (void)setReach:(int)a3
{
  self->_int reach = a3;
}

- (double)stationaryTimeInSeconds
{
  return self->_stationaryTimeInSeconds;
}

- (void)setStationaryTimeInSeconds:(double)a3
{
  self->_double stationaryTimeInSeconds = a3;
}

- (double)verticalAccuracy
{
  return self->_verticalAccuracy;
}

- (void)setVerticalAccuracy:(double)a3
{
  self->_double verticalAccuracy = a3;
}

- (double)lastUpdated
{
  return self->_lastUpdated;
}

- (void)setLastUpdated:(double)a3
{
  self->_double lastUpdated = a3;
}

@end