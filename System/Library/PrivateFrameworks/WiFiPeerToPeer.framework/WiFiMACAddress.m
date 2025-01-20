@interface WiFiMACAddress
+ (BOOL)supportsSecureCoding;
+ (id)zeroAddress;
- (BOOL)isEqual:(id)a3;
- (NSData)data;
- (NSData)ipv6LinkLocalAddress;
- (WiFiMACAddress)initWithAddress:(ether_addr)a3;
- (WiFiMACAddress)initWithAddress:(ether_addr)a3 ipv6Address:(in6_addr)a4;
- (WiFiMACAddress)initWithCoder:(id)a3;
- (WiFiMACAddress)initWithLinkLocalIPv6Address:(in6_addr)a3;
- (WiFiMACAddress)initWithMulticastIPv6Address:(in6_addr)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation WiFiMACAddress

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)zeroAddress
{
  if (_MergedGlobals != -1) {
    dispatch_once(&_MergedGlobals, &__block_literal_global_2);
  }
  v2 = (void *)qword_1EB6F1610;

  return v2;
}

uint64_t __29__WiFiMACAddress_zeroAddress__block_invoke()
{
  qword_1EB6F1610 = [[WiFiMACAddress alloc] initWithAddress:0];

  return MEMORY[0x1F41817F8]();
}

- (WiFiMACAddress)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"WiFiMACAddress.data"];
  v6 = v5;
  if (v5 && [v5 length] == 6)
  {
    v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"WiFiMACAddress.ipv6"];
    v8 = v7;
    if (v7 && [v7 length] == 16)
    {
      v9 = (unsigned int *)[v6 bytes];
      v10 = (void *)[v8 bytes];
      v11 = -[WiFiMACAddress initWithAddress:ipv6Address:](self, "initWithAddress:ipv6Address:", *v9 | ((unint64_t)*((unsigned __int16 *)v9 + 2) << 32), *v10, v10[1]);
    }
    else
    {
      v13 = (unsigned int *)[v6 bytes];
      v11 = [(WiFiMACAddress *)self initWithAddress:*v13 | ((unint64_t)*((unsigned __int16 *)v13 + 2) << 32)];
    }
    self = v11;

    v12 = self;
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (void)encodeWithCoder:(id)a3
{
  id v5 = a3;
  id v4 = [(WiFiMACAddress *)self data];
  [v5 encodeObject:v4 forKey:@"WiFiMACAddress.data"];

  [v5 encodeObject:self->_ipv6LinkLocalAddress forKey:@"WiFiMACAddress.ipv6"];
}

- (WiFiMACAddress)initWithAddress:(ether_addr)a3 ipv6Address:(in6_addr)a4
{
  ether_addr v12 = a3;
  in6_addr v11 = a4;
  v10.receiver = self;
  v10.super_class = (Class)WiFiMACAddress;
  id v4 = [(WiFiMACAddress *)&v10 init];
  if (v4)
  {
    uint64_t v5 = [MEMORY[0x1E4F1C9B8] dataWithBytes:&v12 length:6];
    data = v4->_data;
    v4->_data = (NSData *)v5;

    uint64_t v7 = [MEMORY[0x1E4F1C9B8] dataWithBytes:&v11 length:16];
    ipv6LinkLocalAddress = v4->_ipv6LinkLocalAddress;
    v4->_ipv6LinkLocalAddress = (NSData *)v7;
  }
  return v4;
}

- (WiFiMACAddress)initWithAddress:(ether_addr)a3
{
  return -[WiFiMACAddress initWithAddress:ipv6Address:](self, "initWithAddress:ipv6Address:", *(void *)a3.octet & 0xFFFFFFFFFFFFLL, 33022, (*(void *)a3.octet & 0xFFFFFFLL | ((unint64_t)(*(void *)a3.octet >> 24) << 40)) ^ 0xFEFF000002);
}

- (WiFiMACAddress)initWithLinkLocalIPv6Address:(in6_addr)a3
{
  if ((a3.__u6_addr16[0] & 0xC0FF) == 0x80FELL)
  {
    self = [(WiFiMACAddress *)self initWithAddress:(*(void *)&a3.__u6_addr32[2] & 0xFFFFFFLL | (*(void *)&a3.__u6_addr32[2] >> 40 << 24)) ^ 2 ipv6Address:*(void *)a3.__u6_addr8];
    v3 = self;
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (WiFiMACAddress)initWithMulticastIPv6Address:(in6_addr)a3
{
  if (a3.__u6_addr8[0] == 0xFF)
  {
    self = -[WiFiMACAddress initWithAddress:ipv6Address:](self, "initWithAddress:ipv6Address:", ((unint64_t)a3.__u6_addr32[3] << 16) | 0x3333);
    v3 = self;
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (WiFiMACAddress *)a3;
  if (self == v4)
  {
    uint64_t v5 = 0;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      BOOL v11 = 0;
      uint64_t v5 = 0;
      goto LABEL_11;
    }
    uint64_t v5 = v4;
    v6 = [(WiFiMACAddress *)self data];
    uint64_t v7 = [(WiFiMACAddress *)v5 data];
    if (([v6 isEqualToData:v7] & 1) == 0)
    {

LABEL_10:
      BOOL v11 = 0;
      goto LABEL_11;
    }
    v8 = [(WiFiMACAddress *)self ipv6LinkLocalAddress];
    v9 = [(WiFiMACAddress *)v5 ipv6LinkLocalAddress];
    int v10 = [v8 isEqualToData:v9];

    if (!v10) {
      goto LABEL_10;
    }
  }
  BOOL v11 = 1;
LABEL_11:

  return v11;
}

- (unint64_t)hash
{
  v2 = [(WiFiMACAddress *)self data];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (id)description
{
  id v2 = [(WiFiMACAddress *)self data];
  unint64_t v3 = (unsigned __int8 *)[v2 bytes];

  return (id)objc_msgSend(NSString, "stringWithFormat:", @"%02x:%02x:%02x:%02x:%02x:%02x", *v3, v3[1], v3[2], v3[3], v3[4], v3[5]);
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [WiFiMACAddress alloc];
  id v5 = [(WiFiMACAddress *)self data];
  v6 = (unsigned int *)[v5 bytes];
  id v7 = [(WiFiMACAddress *)self ipv6LinkLocalAddress];
  v8 = (void *)[v7 bytes];
  v9 = -[WiFiMACAddress initWithAddress:ipv6Address:](v4, "initWithAddress:ipv6Address:", *v6 | ((unint64_t)*((unsigned __int16 *)v6 + 2) << 32), *v8, v8[1]);

  return v9;
}

- (NSData)data
{
  return (NSData *)objc_getProperty(self, a2, 8, 1);
}

- (NSData)ipv6LinkLocalAddress
{
  return (NSData *)objc_getProperty(self, a2, 16, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ipv6LinkLocalAddress, 0);

  objc_storeStrong((id *)&self->_data, 0);
}

@end