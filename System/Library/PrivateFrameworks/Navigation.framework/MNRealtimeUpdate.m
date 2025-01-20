@interface MNRealtimeUpdate
+ (BOOL)supportsSecureCoding;
- (MNRealtimeUpdate)initWithCoder:(id)a3;
- (NSDate)lastUpdated;
- (NSError)error;
- (NSUUID)routeID;
- (void)encodeWithCoder:(id)a3;
@end

@implementation MNRealtimeUpdate

- (void)encodeWithCoder:(id)a3
{
  id v5 = a3;
  [v5 encodeObject:self->_routeID forKey:@"routeID"];
  [v5 encodeObject:self->_lastUpdated forKey:@"lastUpdated"];
  error = self->_error;
  if (error) {
    [v5 encodeObject:error forKey:@"error"];
  }
}

- (MNRealtimeUpdate)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)MNRealtimeUpdate;
  id v5 = [(MNRealtimeUpdate *)&v13 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"routeID"];
    routeID = v5->_routeID;
    v5->_routeID = (NSUUID *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"lastUpdated"];
    lastUpdated = v5->_lastUpdated;
    v5->_lastUpdated = (NSDate *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"error"];
    error = v5->_error;
    v5->_error = (NSError *)v10;
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSUUID)routeID
{
  return self->_routeID;
}

- (NSDate)lastUpdated
{
  return self->_lastUpdated;
}

- (NSError)error
{
  return self->_error;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_lastUpdated, 0);
  objc_storeStrong((id *)&self->_routeID, 0);
}

@end