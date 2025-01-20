@interface SPBTFindingSessionConfig
+ (BOOL)supportsSecureCoding;
- (BOOL)optInRawRSSIMeasurement;
- (SPBTFindingSessionConfig)initWithCoder:(id)a3;
- (SPBTFindingSessionConfig)initWithOptInRawRSSIMeasurement:(BOOL)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
@end

@implementation SPBTFindingSessionConfig

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [SPBTFindingSessionConfig alloc];
  BOOL v5 = [(SPBTFindingSessionConfig *)self optInRawRSSIMeasurement];

  return [(SPBTFindingSessionConfig *)v4 initWithOptInRawRSSIMeasurement:v5];
}

- (SPBTFindingSessionConfig)initWithOptInRawRSSIMeasurement:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SPBTFindingSessionConfig;
  result = [(SPBTFindingSessionConfig *)&v5 init];
  if (result) {
    result->_optInRawRSSIMeasurement = a3;
  }
  return result;
}

- (void)encodeWithCoder:(id)a3
{
}

- (SPBTFindingSessionConfig)initWithCoder:(id)a3
{
  self->_optInRawRSSIMeasurement = [a3 decodeBoolForKey:@"optInRawRSSIMeasurement"];
  return self;
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"<%@ %p: optInRawRSSIMeasurement: %d>", objc_opt_class(), self, -[SPBTFindingSessionConfig optInRawRSSIMeasurement](self, "optInRawRSSIMeasurement")];
}

- (BOOL)optInRawRSSIMeasurement
{
  return self->_optInRawRSSIMeasurement;
}

@end