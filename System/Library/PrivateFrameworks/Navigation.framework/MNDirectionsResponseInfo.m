@interface MNDirectionsResponseInfo
+ (BOOL)supportsSecureCoding;
- (GEODirectionsError)directionsError;
- (GEODirectionsRequest)request;
- (GEODirectionsResponse)response;
- (MNDirectionsResponseInfo)initWithCoder:(id)a3;
- (MNTraceRecordingData)traceRecordingData;
- (NSArray)routeInfos;
- (NSError)error;
- (void)encodeWithCoder:(id)a3;
- (void)setDirectionsError:(id)a3;
- (void)setError:(id)a3;
- (void)setRequest:(id)a3;
- (void)setResponse:(id)a3;
- (void)setRouteInfos:(id)a3;
- (void)setTraceRecordingData:(id)a3;
@end

@implementation MNDirectionsResponseInfo

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MNDirectionsResponseInfo)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(MNDirectionsResponseInfo *)self init];
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v7 = objc_opt_class();
    v8 = objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"_routeInfos"];
    routeInfos = v5->_routeInfos;
    v5->_routeInfos = (NSArray *)v9;

    uint64_t v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_request"];
    request = v5->_request;
    v5->_request = (GEODirectionsRequest *)v11;

    uint64_t v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_response"];
    response = v5->_response;
    v5->_response = (GEODirectionsResponse *)v13;

    uint64_t v15 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_error"];
    error = v5->_error;
    v5->_error = (NSError *)v15;

    uint64_t v17 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_directionsError"];
    directionsError = v5->_directionsError;
    v5->_directionsError = (GEODirectionsError *)v17;

    uint64_t v19 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_traceRecordingData"];
    traceRecordingData = v5->_traceRecordingData;
    v5->_traceRecordingData = (MNTraceRecordingData *)v19;

    v21 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  routeInfos = self->_routeInfos;
  id v5 = a3;
  [v5 encodeObject:routeInfos forKey:@"_routeInfos"];
  [v5 encodeObject:self->_request forKey:@"_request"];
  [v5 encodeObject:self->_response forKey:@"_response"];
  [v5 encodeObject:self->_error forKey:@"_error"];
  [v5 encodeObject:self->_directionsError forKey:@"_directionsError"];
  [v5 encodeObject:self->_traceRecordingData forKey:@"_traceRecordingData"];
}

- (NSArray)routeInfos
{
  return self->_routeInfos;
}

- (void)setRouteInfos:(id)a3
{
}

- (GEODirectionsRequest)request
{
  return self->_request;
}

- (void)setRequest:(id)a3
{
}

- (GEODirectionsResponse)response
{
  return self->_response;
}

- (void)setResponse:(id)a3
{
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
}

- (GEODirectionsError)directionsError
{
  return self->_directionsError;
}

- (void)setDirectionsError:(id)a3
{
}

- (MNTraceRecordingData)traceRecordingData
{
  return self->_traceRecordingData;
}

- (void)setTraceRecordingData:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_traceRecordingData, 0);
  objc_storeStrong((id *)&self->_directionsError, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_response, 0);
  objc_storeStrong((id *)&self->_request, 0);
  objc_storeStrong((id *)&self->_routeInfos, 0);
}

@end