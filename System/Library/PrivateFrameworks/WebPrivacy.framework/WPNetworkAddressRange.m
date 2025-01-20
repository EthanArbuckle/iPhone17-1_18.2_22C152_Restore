@interface WPNetworkAddressRange
- (BOOL)isEqual:(id)a3;
- (NSString)host;
- (NSString)owner;
- (WPNetworkAddressRange)init;
- (WPNetworkAddressRange)initWithAddress:(const sockaddr_in6 *)a3 netMaskLength:(unint64_t)a4 owner:(id)a5 host:(id)a6;
- (const)address;
- (id)description;
- (int64_t)compare:(id)a3;
- (int64_t)version;
- (unint64_t)_addressLength;
- (unint64_t)netMaskLength;
- (void)_addressPointer;
- (void)version;
@end

@implementation WPNetworkAddressRange

- (WPNetworkAddressRange)init
{
  *(void *)&self->_address.sin6_len = 0;
  *(void *)self->_address.sin6_addr.__u6_addr8 = 0;
  self->_address.sin6_scope_id = 0;
  *(void *)&self->_address.sin6_addr.__u6_addr32[2] = 0;
  return self;
}

- (WPNetworkAddressRange)initWithAddress:(const sockaddr_in6 *)a3 netMaskLength:(unint64_t)a4 owner:(id)a5 host:(id)a6
{
  id v11 = a5;
  id v12 = a6;
  v18.receiver = self;
  v18.super_class = (Class)WPNetworkAddressRange;
  v13 = [(WPNetworkAddressRange *)&v18 init];
  v14 = (WPNetworkAddressRange *)v13;
  if (v13)
  {
    long long v15 = *(_OWORD *)&a3->sin6_len;
    *(in6_addr *)(v13 + 20) = *(in6_addr *)((char *)&a3->sin6_addr + 4);
    *(_OWORD *)(v13 + 8) = v15;
    *((void *)v13 + 5) = a4;
    objc_storeStrong((id *)v13 + 6, a5);
    objc_storeStrong((id *)&v14->_host, a6);
    v16 = v14;
  }

  return v14;
}

- (int64_t)version
{
  int sin6_family = self->_address.sin6_family;
  if (sin6_family == 2) {
    return 4;
  }
  if (sin6_family != 30) {
    -[WPNetworkAddressRange version]();
  }
  return 6;
}

- (const)address
{
  return (const sockaddr *)&self->_address;
}

- (unint64_t)netMaskLength
{
  return self->_netMaskLength;
}

- (NSString)owner
{
  return self->_owner;
}

- (NSString)host
{
  return self->_host;
}

- (id)description
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  if (self->_address.sin6_family == 2) {
    int v3 = 2;
  }
  else {
    int v3 = 30;
  }
  inet_ntop(v3, &self->_address.sin6_addr, v6, 0x2Eu);
  v4 = [NSString stringWithFormat:@"%s/%zu %@ %@", v6, self->_netMaskLength, self->_owner, self->_host];

  return v4;
}

- (unint64_t)_addressLength
{
  unint64_t result = [(WPNetworkAddressRange *)self version];
  if (result != 4) {
    return 16;
  }
  return result;
}

- (void)_addressPointer
{
  return &self->_address.sin6_addr;
}

- (int64_t)compare:(id)a3
{
  id v4 = a3;
  int64_t v5 = [(WPNetworkAddressRange *)self version];
  if (v5 == [v4 version])
  {
    int v6 = memcmp(-[WPNetworkAddressRange _addressPointer](self, "_addressPointer"), (const void *)[v4 _addressPointer], -[WPNetworkAddressRange _addressLength](self, "_addressLength"));
    if ((v6 & 0x80000000) == 0)
    {
      if (v6)
      {
        int64_t v7 = 1;
        goto LABEL_11;
      }
      unint64_t v8 = [(WPNetworkAddressRange *)self netMaskLength];
      if (v8 >= [v4 netMaskLength])
      {
        unint64_t v9 = [(WPNetworkAddressRange *)self netMaskLength];
        int64_t v7 = v9 > [v4 netMaskLength];
        goto LABEL_11;
      }
    }
    int64_t v7 = -1;
  }
  else if (v5 == 4)
  {
    int64_t v7 = -1;
  }
  else
  {
    int64_t v7 = 1;
  }
LABEL_11:

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    unint64_t v8 = 0;
    char v7 = 0;
    unint64_t v9 = v4;
LABEL_8:

    goto LABEL_10;
  }
  if (!v4)
  {
    unint64_t v8 = 0;
    char v7 = 0;
    goto LABEL_10;
  }
  int64_t v5 = [(WPNetworkAddressRange *)self version];
  if (v5 == [v4 version])
  {
    unint64_t v6 = [(WPNetworkAddressRange *)self netMaskLength];
    if (v6 == [v4 netMaskLength]
      && !memcmp(-[WPNetworkAddressRange _addressPointer](self, "_addressPointer"), (const void *)[v4 _addressPointer], -[WPNetworkAddressRange _addressLength](self, "_addressLength")))
    {
      unint64_t v9 = [(WPNetworkAddressRange *)self owner];
      id v11 = [v4 owner];
      if ([v9 isEqualToString:v11])
      {
        id v12 = [(WPNetworkAddressRange *)self host];
        v13 = [v4 host];
        char v7 = [v12 isEqualToString:v13];
      }
      else
      {
        char v7 = 0;
      }

      unint64_t v8 = v4;
      goto LABEL_8;
    }
  }
  char v7 = 0;
  unint64_t v8 = v4;
LABEL_10:

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_host, 0);

  objc_storeStrong((id *)&self->_owner, 0);
}

- (void)version
{
}

@end