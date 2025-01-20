@interface TrafficIncidentLayout
+ (BOOL)supportsSecureCoding;
- (BOOL)isIncidentReportingEnabled;
- (BOOL)isIncidentTypeDisplayedOnMap:(int)a3;
- (BOOL)isIncidentTypeSupported:(int)a3;
- (BOOL)shouldInvalidateLayout;
- (BOOL)shouldInvalidateLayoutForLocation:(id)a3;
- (NSArray)layoutItems;
- (TrafficIncidentLayout)initWithCoder:(id)a3;
- (TrafficIncidentLayout)initWithLayoutFormConfig:(id)a3 location:(id)a4;
- (id)description;
- (void)_populateLayoutFields:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation TrafficIncidentLayout

- (TrafficIncidentLayout)initWithLayoutFormConfig:(id)a3 location:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)TrafficIncidentLayout;
  v8 = [(TrafficIncidentLayout *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_layoutRequestLocation, a4);
    [(TrafficIncidentLayout *)v9 _populateLayoutFields:v6];
  }

  return v9;
}

- (TrafficIncidentLayout)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)TrafficIncidentLayout;
  v5 = [(TrafficIncidentLayout *)&v13 init];
  if (v5)
  {
    v5->_incidentReportingEnabled = [v4 decodeBoolForKey:@"incidentReportingEnabled"];
    uint64_t v6 = [v4 decodeArrayOfObjectsOfClass:objc_opt_class() forKey:@"layoutItems"];
    layoutItems = v5->_layoutItems;
    v5->_layoutItems = (NSArray *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"layoutRequestLocation"];
    layoutRequestLocation = v5->_layoutRequestLocation;
    v5->_layoutRequestLocation = (GEOLocation *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"layoutRequestTime"];
    layoutRequestTime = v5->_layoutRequestTime;
    v5->_layoutRequestTime = (NSDate *)v10;

    v5->_layoutTimeToLive = (int64_t)[v4 decodeIntegerForKey:@"layoutTimeToLive"];
    v5->_layoutFreshnessRadius = (int64_t)[v4 decodeIntegerForKey:@"layoutFreshnessRadius"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  BOOL incidentReportingEnabled = self->_incidentReportingEnabled;
  id v5 = a3;
  [v5 encodeBool:incidentReportingEnabled forKey:@"incidentReportingEnabled"];
  [v5 encodeObject:self->_layoutItems forKey:@"layoutItems"];
  [v5 encodeObject:self->_layoutRequestLocation forKey:@"layoutRequestLocation"];
  [v5 encodeObject:self->_layoutRequestTime forKey:@"layoutRequestTime"];
  [v5 encodeInteger:self->_layoutTimeToLive forKey:@"layoutTimeToLive"];
  [v5 encodeInteger:self->_layoutFreshnessRadius forKey:@"layoutFreshnessRadius"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)description
{
  return +[NSString stringWithFormat:@"incidentReportingEnabled=%d layoutItems:%@ layoutRequestLocation:%@ layoutRequestTime:%@ layoutTimeToLive:%ld", self->_incidentReportingEnabled, self->_layoutItems, self->_layoutRequestLocation, self->_layoutRequestTime, self->_layoutTimeToLive];
}

- (void)_populateLayoutFields:(id)a3
{
  id v4 = a3;
  id v5 = (NSArray *)objc_alloc_init((Class)NSMutableArray);
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  v19 = v4;
  uint64_t v6 = [v4 layoutFields];
  id v7 = [v6 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v21;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v21 != v9) {
          objc_enumerationMutation(v6);
        }
        objc_super v11 = [*(id *)(*((void *)&v20 + 1) + 8 * (void)v10) name];
        v12 = [v11 incidentField];

        if ([v12 hasDisplayIncidentOnMap]) {
          uint64_t v13 = (uint64_t)[v12 displayIncidentOnMap];
        }
        else {
          uint64_t v13 = 1;
        }
        v14 = -[TrafficIncidentLayoutItem initWithTrafficIncidentType:displayOnMap:]([TrafficIncidentLayoutItem alloc], "initWithTrafficIncidentType:displayOnMap:", [v12 trafficType], v13);
        [(NSArray *)v5 addObject:v14];

        uint64_t v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      id v8 = [v6 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v8);
  }

  layoutItems = self->_layoutItems;
  self->_layoutItems = v5;
  v16 = v5;

  self->_BOOL incidentReportingEnabled = [v19 enabled];
  self->_layoutTimeToLive = [v19 ttl];
  v17 = +[NSDate date];
  layoutRequestTime = self->_layoutRequestTime;
  self->_layoutRequestTime = v17;

  self->_layoutFreshnessRadius = [v19 radius];
}

- (BOOL)isIncidentReportingEnabled
{
  return self->_incidentReportingEnabled;
}

- (BOOL)isIncidentTypeDisplayedOnMap:(int)a3
{
  if (![(NSArray *)self->_layoutItems count]) {
    return 1;
  }
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v5 = self->_layoutItems;
  id v6 = [(NSArray *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v14;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        if (objc_msgSend(v10, "incidentType", (void)v13) == a3)
        {
          unsigned __int8 v11 = [v10 displayIncidentOnMap];
          goto LABEL_12;
        }
      }
      id v7 = [(NSArray *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
  unsigned __int8 v11 = 1;
LABEL_12:

  return v11;
}

- (BOOL)isIncidentTypeSupported:(int)a3
{
  if (![(NSArray *)self->_layoutItems count]) {
    return 0;
  }
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v5 = self->_layoutItems;
  id v6 = [(NSArray *)v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v13;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        if (objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * i), "incidentType", (void)v12) == a3)
        {
          BOOL v10 = 1;
          goto LABEL_12;
        }
      }
      id v7 = [(NSArray *)v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
  BOOL v10 = 0;
LABEL_12:

  return v10;
}

- (BOOL)shouldInvalidateLayout
{
  v3 = +[MKLocationManager sharedLocationManager];
  id v4 = [v3 currentLocation];
  LOBYTE(self) = [(TrafficIncidentLayout *)self shouldInvalidateLayoutForLocation:v4];

  return (char)self;
}

- (BOOL)shouldInvalidateLayoutForLocation:(id)a3
{
  id v4 = a3;
  if (self->_layoutRequestLocation)
  {
    [(NSDate *)self->_layoutRequestTime timeIntervalSinceNow];
    double v6 = v5;
    id v7 = [v4 latLng];
    [v7 coordinate];
    uint64_t v8 = [(GEOLocation *)self->_layoutRequestLocation latLng];
    [v8 coordinate];
    GEOCalculateDistance();
    double v10 = v9;

    if (v10 >= (double)self->_layoutFreshnessRadius)
    {
      BOOL v12 = 1;
    }
    else
    {
      double v11 = -v6;
      if (v6 >= 0.0) {
        double v11 = v6;
      }
      BOOL v12 = v11 > (double)self->_layoutTimeToLive;
    }
    long long v13 = MAPSGetIncidentsReportingLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      v18[0] = 67109378;
      v18[1] = v12;
      __int16 v19 = 2112;
      long long v20 = self;
      long long v14 = "TrafficIncidentLayout: shouldInvalidateLayout %d for %@";
      long long v15 = v13;
      uint32_t v16 = 18;
      goto LABEL_11;
    }
  }
  else
  {
    long long v13 = MAPSGetIncidentsReportingLog();
    LOBYTE(v12) = 1;
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      LOWORD(v18[0]) = 0;
      long long v14 = "TrafficIncidentLayout: Initial fetching";
      long long v15 = v13;
      uint32_t v16 = 2;
LABEL_11:
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, v14, (uint8_t *)v18, v16);
    }
  }

  return v12;
}

- (NSArray)layoutItems
{
  return self->_layoutItems;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_layoutRequestTime, 0);
  objc_storeStrong((id *)&self->_layoutRequestLocation, 0);

  objc_storeStrong((id *)&self->_layoutItems, 0);
}

@end