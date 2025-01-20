@interface MNTraceRecordingData
+ (BOOL)supportsSecureCoding;
- (GEODirectionsRequest)initialDirectionsRequest;
- (GEODirectionsResponse)initialDirectionsResponse;
- (MNLocation)initialUserLocation;
- (MNTraceRecordingData)initWithCoder:(id)a3;
- (NSArray)waypoints;
- (NSError)initialDirectionsRequestError;
- (double)initialDirectionsRequestTimestamp;
- (double)initialDirectionsResponseTimestamp;
- (void)encodeWithCoder:(id)a3;
- (void)setInitialDirectionsRequest:(id)a3;
- (void)setInitialDirectionsRequestError:(id)a3;
- (void)setInitialDirectionsRequestTimestamp:(double)a3;
- (void)setInitialDirectionsResponse:(id)a3;
- (void)setInitialDirectionsResponseTimestamp:(double)a3;
- (void)setInitialUserLocation:(id)a3;
- (void)setWaypoints:(id)a3;
@end

@implementation MNTraceRecordingData

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MNTraceRecordingData)initWithCoder:(id)a3
{
  id v4 = a3;
  v26.receiver = self;
  v26.super_class = (Class)MNTraceRecordingData;
  v5 = [(MNTraceRecordingData *)&v26 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_initialUserLocation"];
    initialUserLocation = v5->_initialUserLocation;
    v5->_initialUserLocation = (MNLocation *)v6;

    v8 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v9 = objc_opt_class();
    v10 = objc_msgSend(v8, "setWithObjects:", v9, objc_opt_class(), 0);
    uint64_t v11 = [v4 decodeObjectOfClasses:v10 forKey:@"_waypoints"];
    waypoints = v5->_waypoints;
    v5->_waypoints = (NSArray *)v11;

    uint64_t v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_initialDirectionsRequest"];
    initialDirectionsRequest = v5->_initialDirectionsRequest;
    v5->_initialDirectionsRequest = (GEODirectionsRequest *)v13;

    uint64_t v15 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_initialDirectionsResponse"];
    initialDirectionsResponse = v5->_initialDirectionsResponse;
    v5->_initialDirectionsResponse = (GEODirectionsResponse *)v15;

    v17 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v18 = objc_opt_class();
    v19 = objc_msgSend(v17, "setWithObjects:", v18, objc_opt_class(), 0);
    uint64_t v20 = [v4 decodeObjectOfClasses:v19 forKey:@"_initialDirectionsRequestError"];
    initialDirectionsRequestError = v5->_initialDirectionsRequestError;
    v5->_initialDirectionsRequestError = (NSError *)v20;

    [v4 decodeDoubleForKey:@"_initialDirectionsRequestTimestamp"];
    v5->_initialDirectionsRequestTimestamp = v22;
    [v4 decodeDoubleForKey:@"_initialDirectionsResponseTimestamp"];
    v5->_initialDirectionsResponseTimestamp = v23;
    v24 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  initialUserLocation = self->_initialUserLocation;
  id v5 = a3;
  [v5 encodeObject:initialUserLocation forKey:@"_initialUserLocation"];
  [v5 encodeObject:self->_waypoints forKey:@"_waypoints"];
  [v5 encodeObject:self->_initialDirectionsRequest forKey:@"_initialDirectionsRequest"];
  [v5 encodeObject:self->_initialDirectionsResponse forKey:@"_initialDirectionsResponse"];
  [v5 encodeObject:self->_initialDirectionsRequestError forKey:@"_initialDirectionsRequestError"];
  [v5 encodeDouble:@"_initialDirectionsRequestTimestamp" forKey:self->_initialDirectionsRequestTimestamp];
  [v5 encodeDouble:@"_initialDirectionsResponseTimestamp" forKey:self->_initialDirectionsResponseTimestamp];
}

- (MNLocation)initialUserLocation
{
  return self->_initialUserLocation;
}

- (void)setInitialUserLocation:(id)a3
{
}

- (NSArray)waypoints
{
  return self->_waypoints;
}

- (void)setWaypoints:(id)a3
{
}

- (GEODirectionsRequest)initialDirectionsRequest
{
  return self->_initialDirectionsRequest;
}

- (void)setInitialDirectionsRequest:(id)a3
{
}

- (GEODirectionsResponse)initialDirectionsResponse
{
  return self->_initialDirectionsResponse;
}

- (void)setInitialDirectionsResponse:(id)a3
{
}

- (NSError)initialDirectionsRequestError
{
  return self->_initialDirectionsRequestError;
}

- (void)setInitialDirectionsRequestError:(id)a3
{
}

- (double)initialDirectionsRequestTimestamp
{
  return self->_initialDirectionsRequestTimestamp;
}

- (void)setInitialDirectionsRequestTimestamp:(double)a3
{
  self->_initialDirectionsRequestTimestamp = a3;
}

- (double)initialDirectionsResponseTimestamp
{
  return self->_initialDirectionsResponseTimestamp;
}

- (void)setInitialDirectionsResponseTimestamp:(double)a3
{
  self->_initialDirectionsResponseTimestamp = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_initialDirectionsRequestError, 0);
  objc_storeStrong((id *)&self->_initialDirectionsResponse, 0);
  objc_storeStrong((id *)&self->_initialDirectionsRequest, 0);
  objc_storeStrong((id *)&self->_waypoints, 0);
  objc_storeStrong((id *)&self->_initialUserLocation, 0);
}

@end