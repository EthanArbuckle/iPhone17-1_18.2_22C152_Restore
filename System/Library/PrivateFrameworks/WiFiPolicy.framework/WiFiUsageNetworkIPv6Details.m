@interface WiFiUsageNetworkIPv6Details
- (BOOL)isValid;
- (NSArray)ipv6Addresses;
- (WiFiUsageNetworkIPv6Details)initWithDictionary:(id)a3;
- (id)description;
- (void)setIpv6Addresses:(id)a3;
- (void)setIsValid:(BOOL)a3;
@end

@implementation WiFiUsageNetworkIPv6Details

- (WiFiUsageNetworkIPv6Details)initWithDictionary:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)WiFiUsageNetworkIPv6Details;
  v5 = [(WiFiUsageNetworkIPv6Details *)&v10 init];
  if (v5)
  {
    v6 = [v4 objectForKey:*MEMORY[0x1E4F41CC0]];
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && [v6 count])
    {
      [(WiFiUsageNetworkIPv6Details *)v5 setIpv6Addresses:v6];
      uint64_t v7 = 1;
    }
    else
    {
      uint64_t v7 = 0;
    }
    [(WiFiUsageNetworkIPv6Details *)v5 setIsValid:v7];
    v8 = v5;
  }
  return v5;
}

- (id)description
{
  if (self->_isValid)
  {
    v2 = [NSString stringWithFormat:@"addresses:%@", self->_ipv6Addresses];
  }
  else
  {
    v2 = @"N/A";
  }

  return v2;
}

- (BOOL)isValid
{
  return self->_isValid;
}

- (void)setIsValid:(BOOL)a3
{
  self->_isValid = a3;
}

- (NSArray)ipv6Addresses
{
  return self->_ipv6Addresses;
}

- (void)setIpv6Addresses:(id)a3
{
}

- (void).cxx_destruct
{
}

@end