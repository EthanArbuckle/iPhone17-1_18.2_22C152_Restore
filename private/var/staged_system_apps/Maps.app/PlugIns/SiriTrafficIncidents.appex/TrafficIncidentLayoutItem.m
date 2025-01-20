@interface TrafficIncidentLayoutItem
+ (BOOL)supportsSecureCoding;
- (BOOL)displayIncidentOnMap;
- (TrafficIncidentLayoutItem)initWithCoder:(id)a3;
- (TrafficIncidentLayoutItem)initWithTrafficIncidentType:(int)a3 displayOnMap:(BOOL)a4;
- (id)description;
- (id)incidentTypeAsString;
- (int)incidentType;
- (void)encodeWithCoder:(id)a3;
- (void)setDisplayIncidentOnMap:(BOOL)a3;
- (void)setIncidentType:(int)a3;
@end

@implementation TrafficIncidentLayoutItem

- (TrafficIncidentLayoutItem)initWithTrafficIncidentType:(int)a3 displayOnMap:(BOOL)a4
{
  v7.receiver = self;
  v7.super_class = (Class)TrafficIncidentLayoutItem;
  result = [(TrafficIncidentLayoutItem *)&v7 init];
  if (result)
  {
    result->_incidentType = a3;
    result->_displayIncidentOnMap = a4;
  }
  return result;
}

- (TrafficIncidentLayoutItem)initWithCoder:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)TrafficIncidentLayoutItem;
  v5 = [(TrafficIncidentLayoutItem *)&v7 init];
  if (v5)
  {
    -[TrafficIncidentLayoutItem setIncidentType:](v5, "setIncidentType:", [v4 decodeInt32ForKey:@"incidentType"]);
    -[TrafficIncidentLayoutItem setDisplayIncidentOnMap:](v5, "setDisplayIncidentOnMap:", [v4 decodeBoolForKey:@"displayIncidentOnMap"]);
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  [v4 encodeInt32:[self incidentType] forKey:@"incidentType"];
  [v4 encodeBool:[self displayIncidentOnMap] forKey:@"displayIncidentOnMap"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)description
{
  return +[NSString stringWithFormat:@"incidentType:%d displayIncidentOnMap: %d", [(TrafficIncidentLayoutItem *)self incidentType], [(TrafficIncidentLayoutItem *)self displayIncidentOnMap]];
}

- (id)incidentTypeAsString
{
  uint64_t v2 = [(TrafficIncidentLayoutItem *)self incidentType];
  if (v2 >= 0x12)
  {
    v3 = +[NSString stringWithFormat:@"(unknown: %i)", v2];
  }
  else
  {
    v3 = *(&off_1000082F0 + (int)v2);
  }

  return v3;
}

- (int)incidentType
{
  return self->_incidentType;
}

- (void)setIncidentType:(int)a3
{
  self->_incidentType = a3;
}

- (BOOL)displayIncidentOnMap
{
  return self->_displayIncidentOnMap;
}

- (void)setDisplayIncidentOnMap:(BOOL)a3
{
  self->_displayIncidentOnMap = a3;
}

@end