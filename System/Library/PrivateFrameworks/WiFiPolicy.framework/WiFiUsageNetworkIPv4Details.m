@interface WiFiUsageNetworkIPv4Details
- (BOOL)isEqual:(id)a3;
- (BOOL)isValid;
- (NSString)ipv4Address;
- (NSString)ipv4DefGwAddress;
- (NSString)ipv4RouterAddress;
- (NSString)ipv4RouterMacAddress;
- (NSString)ipv4Subnet;
- (WiFiUsageNetworkIPv4Details)initWithDictionary:(id)a3;
- (id)description;
- (void)setIpv4Address:(id)a3;
- (void)setIpv4DefGwAddress:(id)a3;
- (void)setIpv4RouterAddress:(id)a3;
- (void)setIpv4RouterMacAddress:(id)a3;
- (void)setIpv4Subnet:(id)a3;
- (void)setIsValid:(BOOL)a3;
@end

@implementation WiFiUsageNetworkIPv4Details

- (WiFiUsageNetworkIPv4Details)initWithDictionary:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)WiFiUsageNetworkIPv4Details;
  v5 = [(WiFiUsageNetworkIPv4Details *)&v16 init];
  if (v5)
  {
    v6 = [v4 objectForKey:*MEMORY[0x1E4F41C60]];
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && [v6 count])
    {
      v7 = [v6 objectAtIndex:0];
      [(WiFiUsageNetworkIPv4Details *)v5 setIpv4Address:v7];

      uint64_t v8 = 1;
    }
    else
    {
      uint64_t v8 = 0;
    }
    [(WiFiUsageNetworkIPv4Details *)v5 setIsValid:v8];
    v9 = [v4 objectForKey:*MEMORY[0x1E4F41CB0]];

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && [v9 count])
    {
      v10 = [v9 objectAtIndex:0];
      [(WiFiUsageNetworkIPv4Details *)v5 setIpv4Subnet:v10];
    }
    v11 = [v4 objectForKey:*MEMORY[0x1E4F41C50]];

    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [(WiFiUsageNetworkIPv4Details *)v5 setIpv4RouterAddress:v11];
    }
    v12 = [v4 objectForKey:*MEMORY[0x1E4F41CA8]];

    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [(WiFiUsageNetworkIPv4Details *)v5 setIpv4DefGwAddress:v12];
    }
    v13 = [v4 objectForKey:*MEMORY[0x1E4F41C48]];

    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [(WiFiUsageNetworkIPv4Details *)v5 setIpv4RouterMacAddress:v13];
    }
    v14 = v5;
  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_8;
  }
  int v5 = [(WiFiUsageNetworkIPv4Details *)self isValid];
  if (v5 != [v4 isValid]) {
    goto LABEL_8;
  }
  v6 = [(WiFiUsageNetworkIPv4Details *)self ipv4Address];
  v7 = [v4 ipv4Address];
  int v8 = [v6 isEqualToString:v7];

  if (!v8) {
    goto LABEL_8;
  }
  v9 = [(WiFiUsageNetworkIPv4Details *)self ipv4RouterAddress];
  v10 = [v4 ipv4RouterAddress];
  int v11 = [v9 isEqualToString:v10];

  if (!v11) {
    goto LABEL_8;
  }
  v12 = [(WiFiUsageNetworkIPv4Details *)self ipv4RouterMacAddress];
  v13 = [v4 ipv4RouterMacAddress];
  int v14 = [v12 isEqualToString:v13];

  if (!v14) {
    goto LABEL_8;
  }
  v15 = [(WiFiUsageNetworkIPv4Details *)self ipv4DefGwAddress];
  objc_super v16 = [v4 ipv4DefGwAddress];
  int v17 = [v15 isEqualToString:v16];

  if (v17)
  {
    v18 = [(WiFiUsageNetworkIPv4Details *)self ipv4Subnet];
    v19 = [v4 ipv4Subnet];
    char v20 = [v18 isEqualToString:v19];
  }
  else
  {
LABEL_8:
    char v20 = 0;
  }

  return v20;
}

- (id)description
{
  if (self->_isValid)
  {
    v2 = [NSString stringWithFormat:@"address:%@, router:%@(%@) defaultGW:%@, subnet:%@", self->_ipv4Address, self->_ipv4RouterAddress, self->_ipv4RouterMacAddress, self->_ipv4DefGwAddress, self->_ipv4Subnet];
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

- (NSString)ipv4Address
{
  return self->_ipv4Address;
}

- (void)setIpv4Address:(id)a3
{
}

- (NSString)ipv4RouterAddress
{
  return self->_ipv4RouterAddress;
}

- (void)setIpv4RouterAddress:(id)a3
{
}

- (NSString)ipv4RouterMacAddress
{
  return self->_ipv4RouterMacAddress;
}

- (void)setIpv4RouterMacAddress:(id)a3
{
}

- (NSString)ipv4DefGwAddress
{
  return self->_ipv4DefGwAddress;
}

- (void)setIpv4DefGwAddress:(id)a3
{
}

- (NSString)ipv4Subnet
{
  return self->_ipv4Subnet;
}

- (void)setIpv4Subnet:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ipv4Subnet, 0);
  objc_storeStrong((id *)&self->_ipv4DefGwAddress, 0);
  objc_storeStrong((id *)&self->_ipv4RouterMacAddress, 0);
  objc_storeStrong((id *)&self->_ipv4RouterAddress, 0);

  objc_storeStrong((id *)&self->_ipv4Address, 0);
}

@end