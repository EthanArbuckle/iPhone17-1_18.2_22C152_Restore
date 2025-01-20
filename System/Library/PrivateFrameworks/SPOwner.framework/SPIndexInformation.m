@interface SPIndexInformation
+ (BOOL)supportsSecureCoding;
- (NSDateInterval)dateInterval;
- (NSUUID)beaconIdentifier;
- (SPIndexInformation)initWithBeaconIdentifier:(id)a3 sequence:(unsigned __int8)a4 index:(unint64_t)a5;
- (SPIndexInformation)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)index;
- (unsigned)sequence;
- (void)encodeWithCoder:(id)a3;
- (void)setBeaconIdentifier:(id)a3;
- (void)setIndex:(unint64_t)a3;
- (void)setSequence:(unsigned __int8)a3;
@end

@implementation SPIndexInformation

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SPIndexInformation)initWithBeaconIdentifier:(id)a3 sequence:(unsigned __int8)a4 index:(unint64_t)a5
{
  id v9 = a3;
  v13.receiver = self;
  v13.super_class = (Class)SPIndexInformation;
  v10 = [(SPIndexInformation *)&v13 init];
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_beaconIdentifier, a3);
    v11->_sequence = a4;
    v11->_index = a5;
  }

  return v11;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [SPIndexInformation alloc];
  uint64_t sequence = self->_sequence;
  beaconIdentifier = self->_beaconIdentifier;
  unint64_t index = self->_index;

  return [(SPIndexInformation *)v4 initWithBeaconIdentifier:beaconIdentifier sequence:sequence index:index];
}

- (void)encodeWithCoder:(id)a3
{
  beaconIdentifier = self->_beaconIdentifier;
  id v5 = a3;
  [v5 encodeObject:beaconIdentifier forKey:@"beaconIdentifer"];
  [v5 encodeInteger:self->_sequence forKey:@"sequence"];
  [v5 encodeInt64:self->_index forKey:@"index"];
}

- (SPIndexInformation)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"beaconIdentifer"];
  beaconIdentifier = self->_beaconIdentifier;
  self->_beaconIdentifier = v5;

  self->_uint64_t sequence = [v4 decodeIntegerForKey:@"sequence"];
  unint64_t v7 = [v4 decodeInt64ForKey:@"index"];

  self->_unint64_t index = v7;
  return self;
}

- (id)description
{
  int v3 = [(SPIndexInformation *)self sequence];
  id v4 = @"secondary";
  if (v3 != 2) {
    id v4 = 0;
  }
  if (v3 == 1) {
    id v5 = @"primary";
  }
  else {
    id v5 = v4;
  }
  v6 = NSString;
  unint64_t v7 = [(SPIndexInformation *)self beaconIdentifier];
  v8 = [v6 stringWithFormat:@"%@:%@/%llu", v7, v5, -[SPIndexInformation index](self, "index")];

  return v8;
}

- (NSDateInterval)dateInterval
{
  id v2 = objc_alloc(MEMORY[0x1E4F28C18]);
  int v3 = [MEMORY[0x1E4F1C9C8] distantPast];
  id v4 = (void *)[v2 initWithStartDate:v3 duration:0.0];

  return (NSDateInterval *)v4;
}

- (NSUUID)beaconIdentifier
{
  return self->_beaconIdentifier;
}

- (void)setBeaconIdentifier:(id)a3
{
}

- (unsigned)sequence
{
  return self->_sequence;
}

- (void)setSequence:(unsigned __int8)a3
{
  self->_uint64_t sequence = a3;
}

- (unint64_t)index
{
  return self->_index;
}

- (void)setIndex:(unint64_t)a3
{
  self->_unint64_t index = a3;
}

- (void).cxx_destruct
{
}

@end