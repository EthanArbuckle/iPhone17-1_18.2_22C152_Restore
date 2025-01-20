@interface PGConsolidatedAddress
- (BOOL)isEqual:(id)a3;
- (CLLocationCoordinate2D)centerCoordinates;
- (CLLocationCoordinate2D)coordinates;
- (NSArray)addressEdgesSortedByTime;
- (NSDate)endDate;
- (NSDate)expandedEndDate;
- (NSDate)expandedStartDate;
- (NSDate)startDate;
- (NSString)description;
- (NSString)timeLocationIdentifier;
- (PGConsolidatedAddress)initWithAddressNode:(id)a3 addressEdgesSortedByTime:(id)a4 centerCoordinates:(CLLocationCoordinate2D)a5;
- (PGGraphAddressNode)addressNode;
- (double)duration;
- (unint64_t)hash;
@end

@implementation PGConsolidatedAddress

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timeLocationIdentifier, 0);
  objc_storeStrong((id *)&self->_expandedEndDate, 0);
  objc_storeStrong((id *)&self->_expandedStartDate, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
  objc_storeStrong((id *)&self->_addressEdgesSortedByTime, 0);
  objc_storeStrong((id *)&self->_addressNode, 0);
}

- (NSString)timeLocationIdentifier
{
  return self->_timeLocationIdentifier;
}

- (double)duration
{
  return self->_duration;
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (CLLocationCoordinate2D)centerCoordinates
{
  double latitude = self->_centerCoordinates.latitude;
  double longitude = self->_centerCoordinates.longitude;
  result.double longitude = longitude;
  result.double latitude = latitude;
  return result;
}

- (NSArray)addressEdgesSortedByTime
{
  return self->_addressEdgesSortedByTime;
}

- (PGGraphAddressNode)addressNode
{
  return self->_addressNode;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (PGConsolidatedAddress *)a3;
  if (self == v4)
  {
    BOOL v12 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      timeLocationIdentifier = self->_timeLocationIdentifier;
      v7 = [(PGConsolidatedAddress *)v5 timeLocationIdentifier];
      if ([(NSString *)timeLocationIdentifier isEqual:v7])
      {
        startDate = self->_startDate;
        v9 = [(PGConsolidatedAddress *)v5 startDate];
        if ([(NSDate *)startDate isEqual:v9])
        {
          double duration = self->_duration;
          [(PGConsolidatedAddress *)v5 duration];
          BOOL v12 = duration == v11;
        }
        else
        {
          BOOL v12 = 0;
        }
      }
      else
      {
        BOOL v12 = 0;
      }
    }
    else
    {
      BOOL v12 = 0;
    }
  }

  return v12;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_timeLocationIdentifier hash];
  return [(NSDate *)self->_startDate hash] ^ v3 ^ (unint64_t)self->_duration;
}

- (NSString)description
{
  NSUInteger v3 = NSString;
  v11.receiver = self;
  v11.super_class = (Class)PGConsolidatedAddress;
  v4 = [(PGConsolidatedAddress *)&v11 description];
  timeLocationIdentifier = self->_timeLocationIdentifier;
  startDate = self->_startDate;
  v7 = [(PGConsolidatedAddress *)self endDate];
  v8 = [NSString stringWithFormat:@"{%.8f, %.8f}", *(void *)&self->_centerCoordinates.latitude, *(void *)&self->_centerCoordinates.longitude];
  v9 = [v3 stringWithFormat:@"%@ identifier %@, startDate %@, endDate %@, coordinates %@", v4, timeLocationIdentifier, startDate, v7, v8];

  return (NSString *)v9;
}

- (NSDate)expandedEndDate
{
  return [(NSDate *)self->_startDate dateByAddingTimeInterval:self->_duration + 1800.0];
}

- (NSDate)expandedStartDate
{
  return [(NSDate *)self->_startDate dateByAddingTimeInterval:-1800.0];
}

- (NSDate)endDate
{
  return [(NSDate *)self->_startDate dateByAddingTimeInterval:self->_duration];
}

- (CLLocationCoordinate2D)coordinates
{
  double latitude = self->_centerCoordinates.latitude;
  double longitude = self->_centerCoordinates.longitude;
  result.double longitude = longitude;
  result.double latitude = latitude;
  return result;
}

- (PGConsolidatedAddress)initWithAddressNode:(id)a3 addressEdgesSortedByTime:(id)a4 centerCoordinates:(CLLocationCoordinate2D)a5
{
  CLLocationDegrees longitude = a5.longitude;
  CLLocationDegrees latitude = a5.latitude;
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  v38.receiver = self;
  v38.super_class = (Class)PGConsolidatedAddress;
  BOOL v12 = [(PGConsolidatedAddress *)&v38 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_addressNode, a3);
    objc_storeStrong((id *)&v13->_addressEdgesSortedByTime, a4);
    v13->_centerCoordinates.CLLocationDegrees latitude = latitude;
    v13->_centerCoordinates.CLLocationDegrees longitude = longitude;
    long long v34 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    id v14 = v11;
    uint64_t v15 = [v14 countByEnumeratingWithState:&v34 objects:v39 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v35;
      double v18 = 1.79769313e308;
      double v19 = -1.79769313e308;
      do
      {
        for (uint64_t i = 0; i != v16; ++i)
        {
          if (*(void *)v35 != v17) {
            objc_enumerationMutation(v14);
          }
          v21 = *(void **)(*((void *)&v34 + 1) + 8 * i);
          [v21 timestampUTCStart];
          double v23 = v22;
          [v21 timestampUTCEnd];
          if (v18 > v23) {
            double v18 = v23;
          }
          if (v19 < v24) {
            double v19 = v24;
          }
        }
        uint64_t v16 = [v14 countByEnumeratingWithState:&v34 objects:v39 count:16];
      }
      while (v16);
    }
    else
    {
      double v18 = 1.79769313e308;
      double v19 = -1.79769313e308;
    }

    uint64_t v25 = [objc_alloc(MEMORY[0x1E4F1C9C8]) initWithTimeIntervalSince1970:v18];
    startDate = v13->_startDate;
    v13->_startDate = (NSDate *)v25;

    v13->_double duration = v19 - v18;
    v27 = [v14 firstObject];
    v28 = [v27 sourceNode];
    v29 = NSString;
    v30 = [v28 localIdentifier];
    uint64_t v31 = [v29 stringWithFormat:@"%@-%f-%f", v30, *(void *)&latitude, *(void *)&longitude];
    timeLocationIdentifier = v13->_timeLocationIdentifier;
    v13->_timeLocationIdentifier = (NSString *)v31;
  }
  return v13;
}

@end