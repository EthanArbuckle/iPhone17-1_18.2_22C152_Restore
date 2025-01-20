@interface STShowMapPointRequest
+ (BOOL)supportsSecureCoding;
- (BOOL)isCurrentLocation;
- (STShowMapPointRequest)initWithCoder:(id)a3;
- (id)_initWithPlaceData:(id)a3 extSessionGuid:(id)a4 extSessionGuidCreatedTimestamp:(id)a5;
- (id)createResponse;
- (id)extSessionGuid;
- (id)extSessionGuidCreatedTimestamp;
- (id)mapPointData;
- (void)encodeWithCoder:(id)a3;
- (void)setIsCurrentLocation:(BOOL)a3;
@end

@implementation STShowMapPointRequest

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_extSessionGuidCreatedTimestamp, 0);
  objc_storeStrong((id *)&self->_extSessionGuid, 0);
  objc_storeStrong((id *)&self->_placeData, 0);
}

- (void)setIsCurrentLocation:(BOOL)a3
{
  self->_isCurrentLocation = a3;
}

- (BOOL)isCurrentLocation
{
  return self->_isCurrentLocation;
}

- (STShowMapPointRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)STShowMapPointRequest;
  v5 = [(AFSiriRequest *)&v13 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kSTShowMapPointRequestPlaceDataKey"];
    placeData = v5->_placeData;
    v5->_placeData = (NSData *)v6;

    v5->_isCurrentLocation = [v4 decodeBoolForKey:@"kSTShowMapPointRequestIsCurrentLocationKey"];
    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kSTShowMapPointRequestExtSessionGuidKey"];
    extSessionGuid = v5->_extSessionGuid;
    v5->_extSessionGuid = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kSTShowMapPointRequestExtSessionGuidCreatedTimestampKey"];
    extSessionGuidCreatedTimestamp = v5->_extSessionGuidCreatedTimestamp;
    v5->_extSessionGuidCreatedTimestamp = (NSDate *)v10;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)STShowMapPointRequest;
  id v4 = a3;
  [(AFSiriRequest *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_placeData, @"kSTShowMapPointRequestPlaceDataKey", v5.receiver, v5.super_class);
  [v4 encodeBool:self->_isCurrentLocation forKey:@"kSTShowMapPointRequestIsCurrentLocationKey"];
  [v4 encodeObject:self->_extSessionGuid forKey:@"kSTShowMapPointRequestExtSessionGuidKey"];
  [v4 encodeObject:self->_extSessionGuidCreatedTimestamp forKey:@"kSTShowMapPointRequestExtSessionGuidCreatedTimestampKey"];
}

- (id)createResponse
{
  v2 = (void *)[objc_alloc(MEMORY[0x263F28620]) _initWithRequest:self];
  return v2;
}

- (id)extSessionGuidCreatedTimestamp
{
  return self->_extSessionGuidCreatedTimestamp;
}

- (id)extSessionGuid
{
  return self->_extSessionGuid;
}

- (id)mapPointData
{
  return self->_placeData;
}

- (id)_initWithPlaceData:(id)a3 extSessionGuid:(id)a4 extSessionGuidCreatedTimestamp:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)STShowMapPointRequest;
  v12 = [(AFSiriRequest *)&v15 init];
  p_isa = (id *)&v12->super.super.isa;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_placeData, a3);
    objc_storeStrong(p_isa + 6, a4);
    objc_storeStrong(p_isa + 7, a5);
  }

  return p_isa;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end