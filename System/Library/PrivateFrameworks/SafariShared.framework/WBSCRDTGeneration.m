@interface WBSCRDTGeneration
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isValid;
- (NSString)deviceIdentifier;
- (WBSCRDTGeneration)init;
- (WBSCRDTGeneration)initWithCoder:(id)a3;
- (WBSCRDTGeneration)initWithDeviceIdentifier:(id)a3 generation:(unint64_t)a4;
- (id)description;
- (id)incrementedGenerationWithDeviceIdentifier:(id)a3;
- (int64_t)compare:(id)a3;
- (unint64_t)generation;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation WBSCRDTGeneration

- (void).cxx_destruct
{
}

- (id)incrementedGenerationWithDeviceIdentifier:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)objc_opt_class()) initWithDeviceIdentifier:v4 generation:self->_generation + 1];

  return v5;
}

- (WBSCRDTGeneration)initWithDeviceIdentifier:(id)a3 generation:(unint64_t)a4
{
  id v6 = a3;
  v12.receiver = self;
  v12.super_class = (Class)WBSCRDTGeneration;
  v7 = [(WBSCRDTGeneration *)&v12 init];
  if (v7)
  {
    uint64_t v8 = [v6 copy];
    deviceIdentifier = v7->_deviceIdentifier;
    v7->_deviceIdentifier = (NSString *)v8;

    v7->_generation = a4;
    v10 = v7;
  }

  return v7;
}

- (WBSCRDTGeneration)init
{
  return [(WBSCRDTGeneration *)self initWithDeviceIdentifier:&stru_1EFBE3CF8 generation:0];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (WBSCRDTGeneration)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"deviceIdentifier"];
  uint64_t v6 = [v4 decodeIntegerForKey:@"generation"];

  v7 = [(WBSCRDTGeneration *)self initWithDeviceIdentifier:v5 generation:v6];
  return v7;
}

- (BOOL)isValid
{
  return self->_generation && [(NSString *)self->_deviceIdentifier length] != 0;
}

- (int64_t)compare:(id)a3
{
  id v4 = a3;
  unint64_t generation = self->_generation;
  unint64_t v6 = v4[2];
  if (generation >= v6)
  {
    if (generation > v6) {
      NSComparisonResult v7 = NSOrderedDescending;
    }
    else {
      NSComparisonResult v7 = [(NSString *)self->_deviceIdentifier compare:v4[1]];
    }
  }
  else
  {
    NSComparisonResult v7 = NSOrderedAscending;
  }

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (WBSCRDTGeneration *)a3;
  v5 = v4;
  if (self == v4)
  {
    char v7 = 1;
  }
  else
  {
    unint64_t v6 = v4;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && self->_generation == v6->_generation) {
      char v7 = [(NSString *)self->_deviceIdentifier isEqual:v6->_deviceIdentifier];
    }
    else {
      char v7 = 0;
    }
  }
  return v7;
}

- (unint64_t)hash
{
  return self->_generation ^ [(NSString *)self->_deviceIdentifier hash];
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"< %ld, %@ >", self->_generation, self->_deviceIdentifier];
}

- (void)encodeWithCoder:(id)a3
{
  deviceIdentifier = self->_deviceIdentifier;
  id v5 = a3;
  [v5 encodeObject:deviceIdentifier forKey:@"deviceIdentifier"];
  [v5 encodeInteger:self->_generation forKey:@"generation"];
}

- (NSString)deviceIdentifier
{
  return self->_deviceIdentifier;
}

- (unint64_t)generation
{
  return self->_generation;
}

@end