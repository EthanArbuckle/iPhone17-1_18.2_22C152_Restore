@interface SPBeaconPayload
+ (BOOL)supportsSecureCoding;
- (BOOL)refreshGeotag;
- (SPAdvertisement)advertisement;
- (SPBeaconPayload)initWithAdvertisement:(id)a3 location:(id)a4;
- (SPBeaconPayload)initWithCoder:(id)a3;
- (SPEstimatedLocation)location;
- (id)description;
- (int64_t)observationValue;
- (void)encodeWithCoder:(id)a3;
- (void)setAdvertisement:(id)a3;
- (void)setLocation:(id)a3;
- (void)setObservationValue:(int64_t)a3;
- (void)setRefreshGeotag:(BOOL)a3;
@end

@implementation SPBeaconPayload

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SPBeaconPayload)initWithAdvertisement:(id)a3 location:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)SPBeaconPayload;
  v8 = [(SPBeaconPayload *)&v11 init];
  v9 = v8;
  if (v8)
  {
    [(SPBeaconPayload *)v8 setAdvertisement:v6];
    [(SPBeaconPayload *)v9 setLocation:v7];
  }

  return v9;
}

- (void)encodeWithCoder:(id)a3
{
  id v6 = a3;
  v4 = [(SPBeaconPayload *)self advertisement];
  [v6 encodeObject:v4 forKey:@"advertisement"];

  v5 = [(SPBeaconPayload *)self location];
  [v6 encodeObject:v5 forKey:@"location"];

  objc_msgSend(v6, "encodeInteger:forKey:", -[SPBeaconPayload observationValue](self, "observationValue"), @"observationValue");
  objc_msgSend(v6, "encodeBool:forKey:", -[SPBeaconPayload refreshGeotag](self, "refreshGeotag"), @"refreshGeotag");
}

- (SPBeaconPayload)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"advertisement"];
  [(SPBeaconPayload *)self setAdvertisement:v5];

  id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"location"];
  [(SPBeaconPayload *)self setLocation:v6];

  -[SPBeaconPayload setObservationValue:](self, "setObservationValue:", [v4 decodeIntegerForKey:@"observationValue"]);
  uint64_t v7 = [v4 decodeBoolForKey:@"refreshGeotag"];

  [(SPBeaconPayload *)self setRefreshGeotag:v7];
  return self;
}

- (id)description
{
  v3 = NSString;
  id v4 = [(SPBeaconPayload *)self advertisement];
  v5 = [(SPBeaconPayload *)self location];
  id v6 = [v3 stringWithFormat:@"SPBeaconPayload [%@] [%@] value: %ld refreshGeotag: %d", v4, v5, -[SPBeaconPayload observationValue](self, "observationValue"), -[SPBeaconPayload refreshGeotag](self, "refreshGeotag")];

  return v6;
}

- (SPAdvertisement)advertisement
{
  return self->_advertisement;
}

- (void)setAdvertisement:(id)a3
{
}

- (SPEstimatedLocation)location
{
  return self->_location;
}

- (void)setLocation:(id)a3
{
}

- (int64_t)observationValue
{
  return self->_observationValue;
}

- (void)setObservationValue:(int64_t)a3
{
  self->_observationValue = a3;
}

- (BOOL)refreshGeotag
{
  return self->_refreshGeotag;
}

- (void)setRefreshGeotag:(BOOL)a3
{
  self->_refreshGeotag = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_location, 0);
  objc_storeStrong((id *)&self->_advertisement, 0);
}

@end