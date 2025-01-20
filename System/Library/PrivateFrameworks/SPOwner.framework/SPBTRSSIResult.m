@interface SPBTRSSIResult
+ (BOOL)supportsSecureCoding;
- (NSDate)timestamp;
- (NSUUID)beaconIdentifier;
- (SPBTRSSIResult)initWithBeaconIdentifier:(id)a3 timestamp:(id)a4 bucket:(int64_t)a5 rssi:(int64_t)a6;
- (SPBTRSSIResult)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)bucket;
- (int64_t)rssi;
- (void)encodeWithCoder:(id)a3;
@end

@implementation SPBTRSSIResult

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [SPBTRSSIResult alloc];
  v5 = [(SPBTRSSIResult *)self beaconIdentifier];
  v6 = [(SPBTRSSIResult *)self timestamp];
  v7 = [(SPBTRSSIResult *)v4 initWithBeaconIdentifier:v5 timestamp:v6 bucket:[(SPBTRSSIResult *)self bucket] rssi:[(SPBTRSSIResult *)self rssi]];

  return v7;
}

- (SPBTRSSIResult)initWithBeaconIdentifier:(id)a3 timestamp:(id)a4 bucket:(int64_t)a5 rssi:(int64_t)a6
{
  id v11 = a3;
  id v12 = a4;
  v16.receiver = self;
  v16.super_class = (Class)SPBTRSSIResult;
  v13 = [(SPBTRSSIResult *)&v16 init];
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_beaconIdentifier, a3);
    objc_storeStrong((id *)&v14->_timestamp, a4);
    v14->_bucket = a5;
    v14->_rssi = a6;
  }

  return v14;
}

- (void)encodeWithCoder:(id)a3
{
  beaconIdentifier = self->_beaconIdentifier;
  id v5 = a3;
  [v5 encodeObject:beaconIdentifier forKey:@"beaconIdentifier"];
  [v5 encodeObject:self->_timestamp forKey:@"timestamp"];
  [v5 encodeInteger:self->_bucket forKey:@"bucket"];
  [v5 encodeInteger:self->_rssi forKey:@"rssi"];
}

- (SPBTRSSIResult)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"beaconIdentifier"];
  beaconIdentifier = self->_beaconIdentifier;
  self->_beaconIdentifier = v5;

  v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"timestamp"];
  timestamp = self->_timestamp;
  self->_timestamp = v7;

  self->_bucket = [v4 decodeIntegerForKey:@"bucket"];
  int64_t v9 = [v4 decodeIntegerForKey:@"rssi"];

  self->_rssi = v9;
  return self;
}

- (id)description
{
  unint64_t bucket = self->_bucket;
  if (bucket > 3) {
    id v4 = 0;
  }
  else {
    id v4 = off_1E601BC98[bucket];
  }
  id v5 = NSString;
  uint64_t v6 = objc_opt_class();
  v7 = [(SPBTRSSIResult *)self beaconIdentifier];
  v8 = [v5 stringWithFormat:@"<%@ %p: %@ %@ %ld>", v6, self, v7, v4, -[SPBTRSSIResult rssi](self, "rssi")];

  return v8;
}

- (NSUUID)beaconIdentifier
{
  return self->_beaconIdentifier;
}

- (NSDate)timestamp
{
  return self->_timestamp;
}

- (int64_t)bucket
{
  return self->_bucket;
}

- (int64_t)rssi
{
  return self->_rssi;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timestamp, 0);

  objc_storeStrong((id *)&self->_beaconIdentifier, 0);
}

@end