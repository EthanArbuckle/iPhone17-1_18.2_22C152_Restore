@interface W5NetworkStatus
+ (BOOL)supportsSecureCoding;
- (BOOL)conformsToProtocol:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToNetworkStatus:(id)a3;
- (NSArray)primaryDNSAddresses;
- (NSArray)primaryIPv4Addresses;
- (NSArray)primaryIPv6Addresses;
- (NSString)primaryIPv4InterfaceName;
- (NSString)primaryIPv4Router;
- (NSString)primaryIPv4ServiceID;
- (NSString)primaryIPv4ServiceName;
- (NSString)primaryIPv6InterfaceName;
- (NSString)primaryIPv6Router;
- (NSString)primaryIPv6ServiceID;
- (NSString)primaryIPv6ServiceName;
- (W5NetworkStatus)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)hash;
- (unsigned)isAppleReachable;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)setIsAppleReachable:(unsigned int)a3;
- (void)setPrimaryDNSAddresses:(id)a3;
- (void)setPrimaryIPv4Addresses:(id)a3;
- (void)setPrimaryIPv4InterfaceName:(id)a3;
- (void)setPrimaryIPv4Router:(id)a3;
- (void)setPrimaryIPv4ServiceID:(id)a3;
- (void)setPrimaryIPv4ServiceName:(id)a3;
- (void)setPrimaryIPv6Addresses:(id)a3;
- (void)setPrimaryIPv6InterfaceName:(id)a3;
- (void)setPrimaryIPv6Router:(id)a3;
- (void)setPrimaryIPv6ServiceID:(id)a3;
- (void)setPrimaryIPv6ServiceName:(id)a3;
@end

@implementation W5NetworkStatus

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)W5NetworkStatus;
  [(W5NetworkStatus *)&v3 dealloc];
}

- (void)setPrimaryDNSAddresses:(id)a3
{
  primaryDNSAddresses = self->_primaryDNSAddresses;
  if (primaryDNSAddresses != a3)
  {

    self->_primaryDNSAddresses = 0;
    if (a3)
    {
      uint64_t v6 = [MEMORY[0x263F08910] archivedDataWithRootObject:a3 requiringSecureCoding:1 error:0];
      if (v6)
      {
        uint64_t v7 = v6;
        v8 = (void *)MEMORY[0x263F08928];
        v9 = (void *)MEMORY[0x263EFFA08];
        uint64_t v10 = objc_opt_class();
        self->_primaryDNSAddresses = (NSArray *)(id)objc_msgSend(v8, "unarchivedObjectOfClasses:fromData:error:", objc_msgSend(v9, "setWithObjects:", v10, objc_opt_class(), 0), v7, 0);
      }
    }
  }
}

- (void)setPrimaryIPv4Addresses:(id)a3
{
  primaryIPv4Addresses = self->_primaryIPv4Addresses;
  if (primaryIPv4Addresses != a3)
  {

    self->_primaryIPv4Addresses = 0;
    if (a3)
    {
      uint64_t v6 = [MEMORY[0x263F08910] archivedDataWithRootObject:a3 requiringSecureCoding:1 error:0];
      if (v6)
      {
        uint64_t v7 = v6;
        v8 = (void *)MEMORY[0x263F08928];
        v9 = (void *)MEMORY[0x263EFFA08];
        uint64_t v10 = objc_opt_class();
        self->_primaryIPv4Addresses = (NSArray *)(id)objc_msgSend(v8, "unarchivedObjectOfClasses:fromData:error:", objc_msgSend(v9, "setWithObjects:", v10, objc_opt_class(), 0), v7, 0);
      }
    }
  }
}

- (void)setPrimaryIPv6Addresses:(id)a3
{
  primaryIPv6Addresses = self->_primaryIPv6Addresses;
  if (primaryIPv6Addresses != a3)
  {

    self->_primaryIPv6Addresses = 0;
    if (a3)
    {
      uint64_t v6 = [MEMORY[0x263F08910] archivedDataWithRootObject:a3 requiringSecureCoding:1 error:0];
      if (v6)
      {
        uint64_t v7 = v6;
        v8 = (void *)MEMORY[0x263F08928];
        v9 = (void *)MEMORY[0x263EFFA08];
        uint64_t v10 = objc_opt_class();
        self->_primaryIPv6Addresses = (NSArray *)(id)objc_msgSend(v8, "unarchivedObjectOfClasses:fromData:error:", objc_msgSend(v9, "setWithObjects:", v10, objc_opt_class(), 0), v7, 0);
      }
    }
  }
}

- (id)description
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  objc_super v3 = (void *)[MEMORY[0x263F089D8] stringWithCapacity:0];
  [v3 appendFormat:@"Primary IPv4: %@ (%@)\n", self->_primaryIPv4InterfaceName, self->_primaryIPv4ServiceName];
  [v3 appendFormat:@"Primary IPv6: %@ (%@)\n", self->_primaryIPv6InterfaceName, self->_primaryIPv6ServiceName];
  objc_msgSend(v3, "appendFormat:", @"IPv4 Addresses: %lu\n", -[NSArray count](self->_primaryIPv4Addresses, "count"));
  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  primaryIPv4Addresses = self->_primaryIPv4Addresses;
  uint64_t v5 = [(NSArray *)primaryIPv4Addresses countByEnumeratingWithState:&v28 objects:v34 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v29;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v29 != v7) {
          objc_enumerationMutation(primaryIPv4Addresses);
        }
        [v3 appendFormat:@"\t%@\n", *(void *)(*((void *)&v28 + 1) + 8 * i)];
      }
      uint64_t v6 = [(NSArray *)primaryIPv4Addresses countByEnumeratingWithState:&v28 objects:v34 count:16];
    }
    while (v6);
  }
  [v3 appendFormat:@"IPv4 Router: %@\n", self->_primaryIPv4Router];
  objc_msgSend(v3, "appendFormat:", @"IPv6 Addresses: %lu\n", -[NSArray count](self->_primaryIPv6Addresses, "count"));
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  primaryIPv6Addresses = self->_primaryIPv6Addresses;
  uint64_t v10 = [(NSArray *)primaryIPv6Addresses countByEnumeratingWithState:&v24 objects:v33 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v25;
    do
    {
      for (uint64_t j = 0; j != v11; ++j)
      {
        if (*(void *)v25 != v12) {
          objc_enumerationMutation(primaryIPv6Addresses);
        }
        [v3 appendFormat:@"\t%@\n", *(void *)(*((void *)&v24 + 1) + 8 * j)];
      }
      uint64_t v11 = [(NSArray *)primaryIPv6Addresses countByEnumeratingWithState:&v24 objects:v33 count:16];
    }
    while (v11);
  }
  [v3 appendFormat:@"IPv6 Router: %@\n", self->_primaryIPv6Router];
  objc_msgSend(v3, "appendFormat:", @"DNS Addresses: %lu\n", -[NSArray count](self->_primaryDNSAddresses, "count"));
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  primaryDNSAddresses = self->_primaryDNSAddresses;
  uint64_t v15 = [(NSArray *)primaryDNSAddresses countByEnumeratingWithState:&v20 objects:v32 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v21;
    do
    {
      for (uint64_t k = 0; k != v16; ++k)
      {
        if (*(void *)v21 != v17) {
          objc_enumerationMutation(primaryDNSAddresses);
        }
        [v3 appendFormat:@"\t%@\n", *(void *)(*((void *)&v20 + 1) + 8 * k)];
      }
      uint64_t v16 = [(NSArray *)primaryDNSAddresses countByEnumeratingWithState:&v20 objects:v32 count:16];
    }
    while (v16);
  }
  [v3 appendFormat:@"Apple Reachable: 0x%X\n%@\n", self->_isAppleReachable, W5DescriptionForReachabilityFlags(self->_isAppleReachable, @"\t")];
  return (id)[v3 copy];
}

- (BOOL)conformsToProtocol:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)W5NetworkStatus;
  if (-[W5NetworkStatus conformsToProtocol:](&v5, sel_conformsToProtocol_)
    || ([a3 isEqual:&unk_26C50B870] & 1) != 0)
  {
    return 1;
  }
  else
  {
    return [a3 isEqual:&unk_26C50B6D8];
  }
}

- (BOOL)isEqualToNetworkStatus:(id)a3
{
  primaryIPv4InterfaceName = self->_primaryIPv4InterfaceName;
  if (!primaryIPv4InterfaceName)
  {
    if (![a3 primaryIPv4InterfaceName]) {
      goto LABEL_5;
    }
    primaryIPv4InterfaceName = self->_primaryIPv4InterfaceName;
  }
  int v6 = -[NSString isEqual:](primaryIPv4InterfaceName, "isEqual:", [a3 primaryIPv4InterfaceName]);
  if (!v6) {
    return v6;
  }
LABEL_5:
  primaryIPv4ServiceName = self->_primaryIPv4ServiceName;
  if (!primaryIPv4ServiceName)
  {
    if (![a3 primaryIPv4ServiceName]) {
      goto LABEL_9;
    }
    primaryIPv4ServiceName = self->_primaryIPv4ServiceName;
  }
  int v6 = -[NSString isEqual:](primaryIPv4ServiceName, "isEqual:", [a3 primaryIPv4ServiceName]);
  if (!v6) {
    return v6;
  }
LABEL_9:
  primaryIPv6InterfaceName = self->_primaryIPv6InterfaceName;
  if (!primaryIPv6InterfaceName)
  {
    if (![a3 primaryIPv6InterfaceName]) {
      goto LABEL_13;
    }
    primaryIPv6InterfaceName = self->_primaryIPv6InterfaceName;
  }
  int v6 = -[NSString isEqual:](primaryIPv6InterfaceName, "isEqual:", [a3 primaryIPv6InterfaceName]);
  if (!v6) {
    return v6;
  }
LABEL_13:
  primaryIPv6ServiceName = self->_primaryIPv6ServiceName;
  if (!primaryIPv6ServiceName)
  {
    if (![a3 primaryIPv6ServiceName]) {
      goto LABEL_17;
    }
    primaryIPv6ServiceName = self->_primaryIPv6ServiceName;
  }
  int v6 = -[NSString isEqual:](primaryIPv6ServiceName, "isEqual:", [a3 primaryIPv6ServiceName]);
  if (!v6) {
    return v6;
  }
LABEL_17:
  primaryIPv4ServiceID = self->_primaryIPv4ServiceID;
  if (!primaryIPv4ServiceID)
  {
    if (![a3 primaryIPv4ServiceID]) {
      goto LABEL_21;
    }
    primaryIPv4ServiceID = self->_primaryIPv4ServiceID;
  }
  int v6 = -[NSString isEqual:](primaryIPv4ServiceID, "isEqual:", [a3 primaryIPv4ServiceID]);
  if (!v6) {
    return v6;
  }
LABEL_21:
  primaryIPv6ServiceID = self->_primaryIPv6ServiceID;
  if (!primaryIPv6ServiceID)
  {
    if (![a3 primaryIPv6ServiceID]) {
      goto LABEL_25;
    }
    primaryIPv6ServiceID = self->_primaryIPv6ServiceID;
  }
  int v6 = -[NSString isEqual:](primaryIPv6ServiceID, "isEqual:", [a3 primaryIPv6ServiceID]);
  if (!v6) {
    return v6;
  }
LABEL_25:
  primaryIPv4Addresses = self->_primaryIPv4Addresses;
  if (!primaryIPv4Addresses)
  {
    if (![a3 primaryIPv4Addresses]) {
      goto LABEL_29;
    }
    primaryIPv4Addresses = self->_primaryIPv4Addresses;
  }
  int v6 = -[NSArray isEqual:](primaryIPv4Addresses, "isEqual:", [a3 primaryIPv4Addresses]);
  if (!v6) {
    return v6;
  }
LABEL_29:
  primaryIPv6Addresses = self->_primaryIPv6Addresses;
  if (!primaryIPv6Addresses)
  {
    if (![a3 primaryIPv6Addresses]) {
      goto LABEL_33;
    }
    primaryIPv6Addresses = self->_primaryIPv6Addresses;
  }
  int v6 = -[NSArray isEqual:](primaryIPv6Addresses, "isEqual:", [a3 primaryIPv6Addresses]);
  if (!v6) {
    return v6;
  }
LABEL_33:
  primaryIPv4Router = self->_primaryIPv4Router;
  if (!primaryIPv4Router)
  {
    if (![a3 primaryIPv4Router]) {
      goto LABEL_37;
    }
    primaryIPv4Router = self->_primaryIPv4Router;
  }
  int v6 = -[NSString isEqual:](primaryIPv4Router, "isEqual:", [a3 primaryIPv4Router]);
  if (!v6) {
    return v6;
  }
LABEL_37:
  primaryIPv6Router = self->_primaryIPv6Router;
  if (primaryIPv6Router) {
    goto LABEL_40;
  }
  if ([a3 primaryIPv6Router])
  {
    primaryIPv6Router = self->_primaryIPv6Router;
LABEL_40:
    int v6 = -[NSString isEqual:](primaryIPv6Router, "isEqual:", [a3 primaryIPv6Router]);
    if (!v6) {
      return v6;
    }
  }
  primaryDNSAddresses = self->_primaryDNSAddresses;
  if (!primaryDNSAddresses)
  {
    if (![a3 primaryDNSAddresses])
    {
LABEL_45:
      unsigned int isAppleReachable = self->_isAppleReachable;
      LOBYTE(v6) = isAppleReachable == [a3 isAppleReachable];
      return v6;
    }
    primaryDNSAddresses = self->_primaryDNSAddresses;
  }
  int v6 = -[NSArray isEqual:](primaryDNSAddresses, "isEqual:", [a3 primaryDNSAddresses]);
  if (v6) {
    goto LABEL_45;
  }
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  if (a3 == self) {
    return 1;
  }
  if (!a3) {
    return 0;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  return [(W5NetworkStatus *)self isEqualToNetworkStatus:a3];
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_primaryIPv4InterfaceName hash];
  NSUInteger v4 = [(NSString *)self->_primaryIPv4ServiceName hash] ^ v3;
  NSUInteger v5 = [(NSString *)self->_primaryIPv6InterfaceName hash];
  NSUInteger v6 = v4 ^ v5 ^ [(NSString *)self->_primaryIPv6ServiceName hash];
  NSUInteger v7 = [(NSString *)self->_primaryIPv4ServiceID hash];
  NSUInteger v8 = v7 ^ [(NSString *)self->_primaryIPv6ServiceID hash];
  uint64_t v9 = v6 ^ v8 ^ [(NSArray *)self->_primaryIPv4Addresses hash];
  uint64_t v10 = [(NSArray *)self->_primaryIPv6Addresses hash];
  NSUInteger v11 = v10 ^ [(NSString *)self->_primaryIPv4Router hash];
  NSUInteger v12 = v11 ^ [(NSString *)self->_primaryIPv6Router hash];
  return v9 ^ v12 ^ [(NSArray *)self->_primaryDNSAddresses hash] ^ self->_isAppleReachable;
}

- (id)copyWithZone:(_NSZone *)a3
{
  NSUInteger v4 = [+[W5NetworkStatus allocWithZone:a3] init];
  [(W5NetworkStatus *)v4 setPrimaryIPv4InterfaceName:self->_primaryIPv4InterfaceName];
  [(W5NetworkStatus *)v4 setPrimaryIPv4ServiceName:self->_primaryIPv4ServiceName];
  [(W5NetworkStatus *)v4 setPrimaryIPv6InterfaceName:self->_primaryIPv6InterfaceName];
  [(W5NetworkStatus *)v4 setPrimaryIPv6ServiceName:self->_primaryIPv6ServiceName];
  [(W5NetworkStatus *)v4 setPrimaryIPv4ServiceID:self->_primaryIPv4ServiceID];
  [(W5NetworkStatus *)v4 setPrimaryIPv6ServiceID:self->_primaryIPv6ServiceID];
  [(W5NetworkStatus *)v4 setPrimaryIPv4Addresses:self->_primaryIPv4Addresses];
  [(W5NetworkStatus *)v4 setPrimaryIPv6Addresses:self->_primaryIPv6Addresses];
  [(W5NetworkStatus *)v4 setPrimaryIPv4Router:self->_primaryIPv4Router];
  [(W5NetworkStatus *)v4 setPrimaryIPv6Router:self->_primaryIPv6Router];
  [(W5NetworkStatus *)v4 setPrimaryDNSAddresses:self->_primaryDNSAddresses];
  [(W5NetworkStatus *)v4 setIsAppleReachable:self->_isAppleReachable];
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  [a3 encodeObject:self->_primaryIPv4InterfaceName forKey:@"_primaryIPv4InterfaceName"];
  [a3 encodeObject:self->_primaryIPv4ServiceName forKey:@"_primaryIPv4ServiceName"];
  [a3 encodeObject:self->_primaryIPv6InterfaceName forKey:@"_primaryIPv6InterfaceName"];
  [a3 encodeObject:self->_primaryIPv6ServiceName forKey:@"_primaryIPv6ServiceName"];
  [a3 encodeObject:self->_primaryIPv4ServiceID forKey:@"_primaryIPv4ServiceID"];
  [a3 encodeObject:self->_primaryIPv6ServiceID forKey:@"_primaryIPv6ServiceID"];
  [a3 encodeObject:self->_primaryIPv4Addresses forKey:@"_primaryIPv4Addresses"];
  [a3 encodeObject:self->_primaryIPv6Addresses forKey:@"_primaryIPv6Addresses"];
  [a3 encodeObject:self->_primaryIPv4Router forKey:@"_primaryIPv4Router"];
  [a3 encodeObject:self->_primaryIPv6Router forKey:@"_primaryIPv6Router"];
  [a3 encodeObject:self->_primaryDNSAddresses forKey:@"_primaryDNSAddresses"];
  uint64_t isAppleReachable = self->_isAppleReachable;
  [a3 encodeInt:isAppleReachable forKey:@"_isAppleReachable"];
}

- (W5NetworkStatus)initWithCoder:(id)a3
{
  v12.receiver = self;
  v12.super_class = (Class)W5NetworkStatus;
  NSUInteger v4 = [(W5NetworkStatus *)&v12 init];
  if (v4)
  {
    v4->_primaryIPv4InterfaceName = (NSString *)objc_msgSend((id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), @"_primaryIPv4InterfaceName"), "copy");
    v4->_primaryIPv4ServiceName = (NSString *)objc_msgSend((id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), @"_primaryIPv4ServiceName"), "copy");
    v4->_primaryIPv6InterfaceName = (NSString *)objc_msgSend((id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), @"_primaryIPv6InterfaceName"), "copy");
    v4->_primaryIPv6ServiceName = (NSString *)objc_msgSend((id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), @"_primaryIPv6ServiceName"), "copy");
    v4->_primaryIPv4ServiceID = (NSString *)objc_msgSend((id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), @"_primaryIPv4ServiceID"), "copy");
    v4->_primaryIPv6ServiceID = (NSString *)objc_msgSend((id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), @"_primaryIPv6ServiceID"), "copy");
    NSUInteger v5 = (void *)MEMORY[0x263EFFA08];
    uint64_t v6 = objc_opt_class();
    v4->_primaryIPv4Addresses = (NSArray *)objc_msgSend((id)objc_msgSend(a3, "decodeObjectOfClasses:forKey:", objc_msgSend(v5, "setWithObjects:", v6, objc_opt_class(), 0), @"_primaryIPv4Addresses"), "copy");
    NSUInteger v7 = (void *)MEMORY[0x263EFFA08];
    uint64_t v8 = objc_opt_class();
    v4->_primaryIPv6Addresses = (NSArray *)objc_msgSend((id)objc_msgSend(a3, "decodeObjectOfClasses:forKey:", objc_msgSend(v7, "setWithObjects:", v8, objc_opt_class(), 0), @"_primaryIPv6Addresses"), "copy");
    v4->_primaryIPv4Router = (NSString *)objc_msgSend((id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), @"_primaryIPv4Router"), "copy");
    v4->_primaryIPv6Router = (NSString *)objc_msgSend((id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), @"_primaryIPv6Router"), "copy");
    uint64_t v9 = (void *)MEMORY[0x263EFFA08];
    uint64_t v10 = objc_opt_class();
    v4->_primaryDNSAddresses = (NSArray *)objc_msgSend((id)objc_msgSend(a3, "decodeObjectOfClasses:forKey:", objc_msgSend(v9, "setWithObjects:", v10, objc_opt_class(), 0), @"_primaryDNSAddresses"), "copy");
    v4->_uint64_t isAppleReachable = [a3 decodeIntForKey:@"_isAppleReachable"];
  }
  return v4;
}

- (NSString)primaryIPv4InterfaceName
{
  return self->_primaryIPv4InterfaceName;
}

- (void)setPrimaryIPv4InterfaceName:(id)a3
{
}

- (NSString)primaryIPv4ServiceName
{
  return self->_primaryIPv4ServiceName;
}

- (void)setPrimaryIPv4ServiceName:(id)a3
{
}

- (NSString)primaryIPv6InterfaceName
{
  return self->_primaryIPv6InterfaceName;
}

- (void)setPrimaryIPv6InterfaceName:(id)a3
{
}

- (NSString)primaryIPv6ServiceName
{
  return self->_primaryIPv6ServiceName;
}

- (void)setPrimaryIPv6ServiceName:(id)a3
{
}

- (NSString)primaryIPv4ServiceID
{
  return self->_primaryIPv4ServiceID;
}

- (void)setPrimaryIPv4ServiceID:(id)a3
{
}

- (NSString)primaryIPv6ServiceID
{
  return self->_primaryIPv6ServiceID;
}

- (void)setPrimaryIPv6ServiceID:(id)a3
{
}

- (NSArray)primaryIPv4Addresses
{
  return self->_primaryIPv4Addresses;
}

- (NSArray)primaryIPv6Addresses
{
  return self->_primaryIPv6Addresses;
}

- (NSString)primaryIPv4Router
{
  return self->_primaryIPv4Router;
}

- (void)setPrimaryIPv4Router:(id)a3
{
}

- (NSString)primaryIPv6Router
{
  return self->_primaryIPv6Router;
}

- (void)setPrimaryIPv6Router:(id)a3
{
}

- (NSArray)primaryDNSAddresses
{
  return self->_primaryDNSAddresses;
}

- (unsigned)isAppleReachable
{
  return self->_isAppleReachable;
}

- (void)setIsAppleReachable:(unsigned int)a3
{
  self->_uint64_t isAppleReachable = a3;
}

@end