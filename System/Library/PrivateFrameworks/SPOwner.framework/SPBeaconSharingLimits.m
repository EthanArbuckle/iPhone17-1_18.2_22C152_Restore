@interface SPBeaconSharingLimits
+ (BOOL)supportsSecureCoding;
- (SPBeaconSharingLimits)initWithCoder:(id)a3;
- (SPBeaconSharingLimits)initWithMaxCircleMembers:(int64_t)a3 maxDelegatedShares:(int64_t)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)maxCircleMembers;
- (int64_t)maxDelegatedShares;
- (void)encodeWithCoder:(id)a3;
- (void)setMaxCircleMembers:(int64_t)a3;
- (void)setMaxDelegatedShares:(int64_t)a3;
@end

@implementation SPBeaconSharingLimits

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SPBeaconSharingLimits)initWithMaxCircleMembers:(int64_t)a3 maxDelegatedShares:(int64_t)a4
{
  v7.receiver = self;
  v7.super_class = (Class)SPBeaconSharingLimits;
  result = [(SPBeaconSharingLimits *)&v7 init];
  if (result)
  {
    result->_maxCircleMembers = a3;
    result->_maxDelegatedShares = a4;
  }
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [SPBeaconSharingLimits alloc];
  int64_t v5 = [(SPBeaconSharingLimits *)self maxCircleMembers];
  int64_t v6 = [(SPBeaconSharingLimits *)self maxDelegatedShares];

  return [(SPBeaconSharingLimits *)v4 initWithMaxCircleMembers:v5 maxDelegatedShares:v6];
}

- (void)encodeWithCoder:(id)a3
{
  int64_t maxCircleMembers = self->_maxCircleMembers;
  id v5 = a3;
  [v5 encodeInteger:maxCircleMembers forKey:@"maxCircleMembers"];
  [v5 encodeInteger:self->_maxDelegatedShares forKey:@"maxDelegatedShares"];
}

- (SPBeaconSharingLimits)initWithCoder:(id)a3
{
  id v4 = a3;
  self->_int64_t maxCircleMembers = [v4 decodeIntegerForKey:@"maxCircleMembers"];
  int64_t v5 = [v4 decodeIntegerForKey:@"maxDelegatedShares"];

  self->_maxDelegatedShares = v5;
  return self;
}

- (int64_t)maxCircleMembers
{
  return self->_maxCircleMembers;
}

- (void)setMaxCircleMembers:(int64_t)a3
{
  self->_int64_t maxCircleMembers = a3;
}

- (int64_t)maxDelegatedShares
{
  return self->_maxDelegatedShares;
}

- (void)setMaxDelegatedShares:(int64_t)a3
{
  self->_maxDelegatedShares = a3;
}

@end