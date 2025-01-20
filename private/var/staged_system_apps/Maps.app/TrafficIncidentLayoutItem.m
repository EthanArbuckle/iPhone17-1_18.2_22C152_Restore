@interface TrafficIncidentLayoutItem
+ (BOOL)supportsSecureCoding;
+ (id)defaultDescriptionTextForType:(int)a3;
+ (id)defaultDisplayTextForType:(int)a3;
+ (id)styleAttributesForType:(int)a3;
+ (int)geoTrafficIncidentTypeForRouteIncidentType:(int)a3;
+ (int)geoTrafficIncidentTypeForVKType:(int64_t)a3;
+ (int64_t)vkTrafficIncidentTypeForGEOType:(int)a3;
- (BOOL)displayIncidentOnMap;
- (NSString)acceptString;
- (NSString)cancelString;
- (NSString)description;
- (NSString)secondaryString;
- (TrafficIncidentLayoutItem)initWithCoder:(id)a3;
- (TrafficIncidentLayoutItem)initWithTrafficIncidentType:(int)a3 displayOnMap:(BOOL)a4;
- (id)descriptionText;
- (id)displayImage;
- (id)displayText;
- (id)incidentTypeAsString;
- (id)preferredButtonTitle;
- (id)preferredConfirmationTitle;
- (int)incidentType;
- (void)encodeWithCoder:(id)a3;
- (void)setDisplayIncidentOnMap:(BOOL)a3;
- (void)setIncidentType:(int)a3;
@end

@implementation TrafficIncidentLayoutItem

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

- (void)setIncidentType:(int)a3
{
  self->_incidentType = a3;
}

- (void)setDisplayIncidentOnMap:(BOOL)a3
{
  self->_displayIncidentOnMap = a3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)secondaryString
{
  v2 = +[NSBundle mainBundle];
  v3 = [v2 localizedStringForKey:@"Report [Nav Tray, Incident Report now]", @"localized string not found", 0 value table];

  return (NSString *)v3;
}

- (NSString)acceptString
{
  v2 = +[NSBundle mainBundle];
  v3 = [v2 localizedStringForKey:@"Ok [Nav Tray, Incident Report]", @"localized string not found", 0 value table];

  return (NSString *)v3;
}

- (NSString)cancelString
{
  return 0;
}

+ (int)geoTrafficIncidentTypeForRouteIncidentType:(int)a3
{
  if (a3 > 0xD) {
    return 0;
  }
  else {
    return dword_100F71E00[a3];
  }
}

+ (int)geoTrafficIncidentTypeForVKType:(int64_t)a3
{
  if (a3 > 4)
  {
    if (a3 != 13)
    {
      if (a3 == 5) {
        return 6;
      }
      return 0;
    }
    return 16;
  }
  else
  {
    if (a3 != 1)
    {
      if (a3 == 2) {
        return 7;
      }
      return 0;
    }
    return 5;
  }
}

+ (int64_t)vkTrafficIncidentTypeForGEOType:(int)a3
{
  if (a3 > 6)
  {
    if (a3 != 7)
    {
      if (a3 == 16) {
        return 13;
      }
      return 0;
    }
    return 2;
  }
  else
  {
    if (a3 != 5)
    {
      if (a3 == 6) {
        return 5;
      }
      return 0;
    }
    return 1;
  }
}

+ (id)styleAttributesForType:(int)a3
{
  id v3 = [a1 vkTrafficIncidentTypeForGEOType:*(void *)&a3];

  return +[GEOFeatureStyleAttributes styleAttributesForTrafficIncidentType:v3];
}

- (id)displayImage
{
  unint64_t v2 = +[TrafficIncidentLayoutItem vkTrafficIncidentTypeForGEOType:[(TrafficIncidentLayoutItem *)self incidentType]];

  return sub_1007240D8(v2, 4);
}

- (id)displayText
{
  uint64_t v2 = [(TrafficIncidentLayoutItem *)self incidentType];

  return +[TrafficIncidentLayoutItem defaultDisplayTextForType:v2];
}

+ (id)defaultDisplayTextForType:(int)a3
{
  id v4 = +[MKTrafficSupport sharedTrafficSupport];
  v5 = v4;
  if (a3 > 6)
  {
    if (a3 == 7)
    {
      uint64_t v6 = 1;
      goto LABEL_11;
    }
    if (a3 == 16)
    {
      uint64_t v6 = 13;
      goto LABEL_11;
    }
LABEL_8:
    objc_super v7 = +[NSBundle mainBundle];
    v8 = [v7 localizedStringForKey:@"Incident [Nav Tray, Report Incident]", @"localized string not found", 0 value table];

    goto LABEL_12;
  }
  if (a3 == 5)
  {
    uint64_t v6 = 0;
    goto LABEL_11;
  }
  if (a3 != 6) {
    goto LABEL_8;
  }
  uint64_t v6 = 4;
LABEL_11:
  v8 = [v4 localizedTitleForGEOIncidentType:v6 laneType:0 laneCount:0];
LABEL_12:

  return v8;
}

+ (id)defaultDescriptionTextForType:(int)a3
{
  id v4 = +[MKTrafficSupport sharedTrafficSupport];
  v5 = v4;
  if (a3 > 6)
  {
    if (a3 == 7)
    {
      uint64_t v6 = 1;
      goto LABEL_11;
    }
    if (a3 == 16)
    {
      uint64_t v6 = 13;
      goto LABEL_11;
    }
LABEL_8:
    objc_super v7 = +[NSBundle mainBundle];
    v8 = [v7 localizedStringForKey:@"Incident [Nav Tray, Report Incident]", @"localized string not found", 0 value table];

    goto LABEL_12;
  }
  if (a3 == 5)
  {
    uint64_t v6 = 0;
    goto LABEL_11;
  }
  if (a3 != 6) {
    goto LABEL_8;
  }
  uint64_t v6 = 4;
LABEL_11:
  v8 = [v4 localizedRAPDescriptionForGEOIncidentType:v6];
LABEL_12:

  return v8;
}

- (id)descriptionText
{
  uint64_t v2 = [(TrafficIncidentLayoutItem *)self incidentType];

  return +[TrafficIncidentLayoutItem defaultDescriptionTextForType:v2];
}

- (id)preferredButtonTitle
{
  id v3 = +[NSBundle mainBundle];
  id v4 = [v3 localizedStringForKey:@"Report [Nav Tray, Incident Report]", @"localized string not found", 0 value table];

  v5 = [(TrafficIncidentLayoutItem *)self displayText];
  uint64_t v6 = [v4 stringByAppendingFormat:@" %@", v5];

  return v6;
}

- (id)preferredConfirmationTitle
{
  id v3 = +[MKTrafficSupport sharedTrafficSupport];
  int v4 = [(TrafficIncidentLayoutItem *)self incidentType];
  if (v4 > 6)
  {
    if (v4 == 7)
    {
      v5 = v3;
      uint64_t v6 = 1;
      goto LABEL_11;
    }
    if (v4 == 16)
    {
      v5 = v3;
      uint64_t v6 = 13;
      goto LABEL_11;
    }
LABEL_8:
    objc_super v7 = +[NSBundle mainBundle];
    v8 = [v7 localizedStringForKey:@"Incident Reported [Nav Tray, Report Incident]", @"localized string not found", 0 value table];

    goto LABEL_12;
  }
  if (v4 == 5)
  {
    v5 = v3;
    uint64_t v6 = 0;
    goto LABEL_11;
  }
  if (v4 != 6) {
    goto LABEL_8;
  }
  v5 = v3;
  uint64_t v6 = 4;
LABEL_11:
  v8 = [v5 localizedReportConfirmationForIncidentType:v6];
LABEL_12:

  return v8;
}

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

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  [v4 encodeInt32:-[TrafficIncidentLayoutItem incidentType](self, "incidentType") forKey:@"incidentType"];
  [v4 encodeBool:[self displayIncidentOnMap] forKey:@"displayIncidentOnMap"];
}

- (NSString)description
{
  return +[NSString stringWithFormat:@"incidentType:%d displayIncidentOnMap: %d", [(TrafficIncidentLayoutItem *)self incidentType], [(TrafficIncidentLayoutItem *)self displayIncidentOnMap]];
}

- (id)incidentTypeAsString
{
  uint64_t v2 = [(TrafficIncidentLayoutItem *)self incidentType];
  if (v2 >= 0x12)
  {
    id v3 = +[NSString stringWithFormat:@"(unknown: %i)", v2];
  }
  else
  {
    id v3 = off_10131CC98[(int)v2];
  }

  return v3;
}

- (int)incidentType
{
  return self->_incidentType;
}

- (BOOL)displayIncidentOnMap
{
  return self->_displayIncidentOnMap;
}

@end