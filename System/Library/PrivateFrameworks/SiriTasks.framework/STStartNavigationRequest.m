@interface STStartNavigationRequest
+ (BOOL)supportsSecureCoding;
- (STStartNavigationRequest)initWithCoder:(id)a3;
- (id)_initWithStartLocation:(id)a3 destinationLocation:(id)a4 directionsType:(int64_t)a5 arrivalDate:(id)a6 departureDate:(id)a7 extSessionGuid:(id)a8 extSessionGuidCreatedTimestamp:(id)a9;
- (id)arrivalDate;
- (id)createResponse;
- (id)departureDate;
- (id)destinationLocation;
- (id)extSessionGuid;
- (id)extSessionGuidCreatedTimestamp;
- (id)startLocation;
- (int64_t)directionsType;
- (void)encodeWithCoder:(id)a3;
@end

@implementation STStartNavigationRequest

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_extSessionGuidCreatedTimestamp, 0);
  objc_storeStrong((id *)&self->_extSessionGuid, 0);
  objc_storeStrong((id *)&self->_departureDate, 0);
  objc_storeStrong((id *)&self->_arrivalDate, 0);
  objc_storeStrong((id *)&self->_destinationLocation, 0);
  objc_storeStrong((id *)&self->_startLocation, 0);
}

- (STStartNavigationRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)STStartNavigationRequest;
  v5 = [(AFSiriRequest *)&v19 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kAFStartNavigationRequestStartLocationKey"];
    startLocation = v5->_startLocation;
    v5->_startLocation = (STSiriLocation *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kAFStartNavigationRequestDestinationLocationKey"];
    destinationLocation = v5->_destinationLocation;
    v5->_destinationLocation = (STSiriLocation *)v8;

    v5->_directionsType = [v4 decodeIntegerForKey:@"kAFStartNavigationRequestDirectionsTypeKey"];
    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kAFStartNavigationRequestArrivalDateKey"];
    arrivalDate = v5->_arrivalDate;
    v5->_arrivalDate = (NSDate *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kAFStartNavigationRequestDepartureDateKey"];
    departureDate = v5->_departureDate;
    v5->_departureDate = (NSDate *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kAFStartNavigationRequestExtSessionGuidKey"];
    extSessionGuid = v5->_extSessionGuid;
    v5->_extSessionGuid = (NSString *)v14;

    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kAFStartNavigationRequestExtSessionGuidCreatedTimestampKey"];
    extSessionGuidCreatedTimestamp = v5->_extSessionGuidCreatedTimestamp;
    v5->_extSessionGuidCreatedTimestamp = (NSDate *)v16;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)STStartNavigationRequest;
  id v4 = a3;
  [(AFSiriRequest *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_startLocation, @"kAFStartNavigationRequestStartLocationKey", v5.receiver, v5.super_class);
  [v4 encodeObject:self->_destinationLocation forKey:@"kAFStartNavigationRequestDestinationLocationKey"];
  [v4 encodeInteger:self->_directionsType forKey:@"kAFStartNavigationRequestDirectionsTypeKey"];
  [v4 encodeObject:self->_arrivalDate forKey:@"kAFStartNavigationRequestArrivalDateKey"];
  [v4 encodeObject:self->_departureDate forKey:@"kAFStartNavigationRequestDepartureDateKey"];
  [v4 encodeObject:self->_extSessionGuid forKey:@"kAFStartNavigationRequestExtSessionGuidKey"];
  [v4 encodeObject:self->_extSessionGuidCreatedTimestamp forKey:@"kAFStartNavigationRequestExtSessionGuidCreatedTimestampKey"];
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

- (id)departureDate
{
  return self->_departureDate;
}

- (id)arrivalDate
{
  return self->_arrivalDate;
}

- (int64_t)directionsType
{
  return self->_directionsType;
}

- (id)destinationLocation
{
  return self->_destinationLocation;
}

- (id)startLocation
{
  return self->_startLocation;
}

- (id)_initWithStartLocation:(id)a3 destinationLocation:(id)a4 directionsType:(int64_t)a5 arrivalDate:(id)a6 departureDate:(id)a7 extSessionGuid:(id)a8 extSessionGuidCreatedTimestamp:(id)a9
{
  id v24 = a3;
  id v23 = a4;
  id v22 = a6;
  id v15 = a7;
  id v16 = a8;
  id v17 = a9;
  v25.receiver = self;
  v25.super_class = (Class)STStartNavigationRequest;
  v18 = [(AFSiriRequest *)&v25 init];
  objc_super v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_startLocation, a3);
    objc_storeStrong((id *)&v19->_destinationLocation, a4);
    v19->_directionsType = a5;
    objc_storeStrong((id *)&v19->_arrivalDate, a6);
    objc_storeStrong((id *)&v19->_departureDate, a7);
    objc_storeStrong((id *)&v19->_extSessionGuid, a8);
    objc_storeStrong((id *)&v19->_extSessionGuidCreatedTimestamp, a9);
  }

  return v19;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end