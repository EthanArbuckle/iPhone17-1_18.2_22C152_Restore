@interface SPBeaconObservation
+ (BOOL)supportsSecureCoding;
- (NSDate)date;
- (NSUUID)beaconIdentifier;
- (SPBeaconObservation)init;
- (SPBeaconObservation)initWithBeaconIdentifier:(id)a3 type:(int64_t)a4 date:(id)a5 location:(id)a6;
- (SPBeaconObservation)initWithCoder:(id)a3;
- (SPObservationLocation)location;
- (id)description;
- (int64_t)type;
- (void)encodeWithCoder:(id)a3;
@end

@implementation SPBeaconObservation

- (SPBeaconObservation)init
{
  v2 = NSString;
  uint64_t v3 = objc_opt_class();
  v4 = NSStringFromSelector(sel_initWithBeaconIdentifier_type_date_location_);
  uint64_t v5 = [v2 stringWithFormat:@"%@ requires the use of the initializer: %@", v3, v4];

  id v6 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8] reason:v5 userInfo:0];
  objc_exception_throw(v6);
}

- (SPBeaconObservation)initWithBeaconIdentifier:(id)a3 type:(int64_t)a4 date:(id)a5 location:(id)a6
{
  id v11 = a3;
  id v12 = a5;
  id v13 = a6;
  if (!v11)
  {
    v23 = [MEMORY[0x1E4F28B00] currentHandler];
    [v23 handleFailureInMethod:a2, self, @"SPBeaconObservation.m", 26, @"Invalid parameter not satisfying: %@", @"beaconIdentifier" object file lineNumber description];

    if (v12)
    {
LABEL_9:
      v21 = 0;
      goto LABEL_6;
    }
LABEL_8:
    v24 = [MEMORY[0x1E4F28B00] currentHandler];
    [v24 handleFailureInMethod:a2, self, @"SPBeaconObservation.m", 27, @"Invalid parameter not satisfying: %@", @"date" object file lineNumber description];

    goto LABEL_9;
  }
  if (!v12) {
    goto LABEL_8;
  }
  v25.receiver = self;
  v25.super_class = (Class)SPBeaconObservation;
  v14 = [(SPBeaconObservation *)&v25 init];
  if (v14)
  {
    uint64_t v15 = [v11 copy];
    beaconIdentifier = v14->_beaconIdentifier;
    v14->_beaconIdentifier = (NSUUID *)v15;

    v14->_type = a4;
    uint64_t v17 = [v12 copy];
    date = v14->_date;
    v14->_date = (NSDate *)v17;

    uint64_t v19 = [v13 copy];
    location = v14->_location;
    v14->_location = (SPObservationLocation *)v19;
  }
  self = v14;
  v21 = self;
LABEL_6:

  return v21;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  beaconIdentifier = self->_beaconIdentifier;
  id v5 = a3;
  [v5 encodeObject:beaconIdentifier forKey:@"kSPBeaconObservationSecureCodingBeaconIdentifierKey"];
  [v5 encodeInteger:self->_type forKey:@"kSPBeaconObservationSecureCodingTypeKey"];
  [v5 encodeObject:self->_date forKey:@"kSPBeaconObservationSecureCodingDateKey"];
  [v5 encodeObject:self->_location forKey:@"kSPBeaconObservationSecureCodingLocationKey"];
}

- (SPBeaconObservation)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kSPBeaconObservationSecureCodingBeaconIdentifierKey"];
  uint64_t v6 = [v4 decodeIntegerForKey:@"kSPBeaconObservationSecureCodingTypeKey"];
  v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kSPBeaconObservationSecureCodingDateKey"];
  v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kSPBeaconObservationSecureCodingLocationKey"];

  v9 = [(SPBeaconObservation *)self initWithBeaconIdentifier:v5 type:v6 date:v7 location:v8];
  return v9;
}

- (id)description
{
  uint64_t v3 = NSString;
  id v4 = [(NSUUID *)self->_beaconIdentifier UUIDString];
  id v5 = [v3 stringWithFormat:@"SPBeaconObservation, identifier, %@, type, %lld, date, %@, location, %@", v4, self->_type, self->_date, self->_location];

  return v5;
}

- (NSUUID)beaconIdentifier
{
  return self->_beaconIdentifier;
}

- (int64_t)type
{
  return self->_type;
}

- (NSDate)date
{
  return self->_date;
}

- (SPObservationLocation)location
{
  return self->_location;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_location, 0);
  objc_storeStrong((id *)&self->_date, 0);

  objc_storeStrong((id *)&self->_beaconIdentifier, 0);
}

@end