@interface TSBonjourIPv6Address
+ (BOOL)getLinkLayerAddress:(char *)a3 forIPv6Address:(const char *)a4 error:(id *)a5;
- (BOOL)getLinkLayerAddressError:(id *)a3;
- (BOOL)hasLinkLayerAddress;
- (TSBonjourIPv6Address)init;
- (TSBonjourIPv6Address)initWithIPv6Address:(const char *)a3;
- (const)ipv6Address;
- (const)linkLayerAddress;
- (id)copyWithZone:(_NSZone *)a3;
- (void)pokeDestinationAtPort:(unsigned __int16)a3 onInterfaceIndex:(unsigned int)a4;
- (void)setHasLinkLayerAddress:(BOOL)a3;
@end

@implementation TSBonjourIPv6Address

+ (BOOL)getLinkLayerAddress:(char *)a3 forIPv6Address:(const char *)a4 error:(id *)a5
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  int v7 = 101;
  v8 = MEMORY[0x1E4F14500];
  while (1)
  {
    size_t size = 0;
    *(_OWORD *)v28 = xmmword_1BA8E2830;
    uint64_t v29 = 0x40000000002;
    if (sysctl(v28, 6u, 0, &size, 0, 0))
    {
      v13 = __error();
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
      {
        int v14 = *v13;
        *(_DWORD *)buf = 67109120;
        int v27 = v14;
        _os_log_impl(&dword_1BA88B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Error %d getting IPv4 routing table size", buf, 8u);
      }
LABEL_12:
      v10 = 0;
      goto LABEL_13;
    }
    v9 = (unsigned __int16 *)malloc_type_malloc(size, 0x888A0B7BuLL);
    if (v9) {
      break;
    }
LABEL_8:
    if (--v7 <= 1) {
      goto LABEL_12;
    }
  }
  v10 = v9;
  if (sysctl(v28, 6u, v9, &size, 0, 0))
  {
    v11 = __error();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = *v11;
      *(_DWORD *)buf = 67109120;
      int v27 = v12;
      _os_log_impl(&dword_1BA88B000, v8, OS_LOG_TYPE_DEFAULT, "Error %d getting IPv4 routing table", buf, 8u);
    }
    free(v10);
    goto LABEL_8;
  }
  if (!size)
  {
LABEL_13:
    BOOL v15 = 0;
    goto LABEL_14;
  }
  size_t v17 = 0;
  v18 = v10;
  while (1)
  {
    uint64_t v19 = *((unsigned __int8 *)v18 + 92);
    if ((v19 & 3) != 0) {
      uint64_t v19 = (v19 | 3) + 1;
    }
    if (*((unsigned char *)v18 + 93) == 30)
    {
      v20 = (char *)v18 + v19 + 92;
      if (v20[1] == 18
        && v20[6] == 6
        && *((_WORD *)v20 + 1)
        && *(void *)(v18 + 50) == *(void *)a4
        && *(void *)(v18 + 54) == *((void *)a4 + 1))
      {
        break;
      }
    }
    uint64_t v22 = *v18;
    v17 += v22;
    v18 = (unsigned __int16 *)((char *)v18 + v22);
    if (v17 >= size) {
      goto LABEL_13;
    }
  }
  v23 = &v20[v20[5]];
  int v24 = *((_DWORD *)v23 + 2);
  *((_WORD *)a3 + 2) = *((_WORD *)v23 + 6);
  *(_DWORD *)a3 = v24;
  BOOL v15 = 1;
LABEL_14:
  free(v10);
  return v15;
}

- (TSBonjourIPv6Address)init
{
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3C8];
  v5 = [NSString stringWithUTF8String:"-[TSBonjourIPv6Address init]"];
  [v3 raise:v4, @"Do not call %@", v5 format];

  return 0;
}

- (TSBonjourIPv6Address)initWithIPv6Address:(const char *)a3
{
  v5.receiver = self;
  v5.super_class = (Class)TSBonjourIPv6Address;
  result = [(TSBonjourIPv6Address *)&v5 init];
  if (result)
  {
    *(_OWORD *)result->_ipv6Address = *(_OWORD *)a3;
    result->_hasLinkLayerAddress = 0;
    *(_DWORD *)result->_linkLayerAddress = -1;
    *(_WORD *)&result->_linkLayerAddress[4] = -1;
  }
  return result;
}

- (const)ipv6Address
{
  return (const char *)self->_ipv6Address;
}

- (const)linkLayerAddress
{
  return (const char *)self->_linkLayerAddress;
}

- (BOOL)getLinkLayerAddressError:(id *)a3
{
  int v4 = [(id)objc_opt_class() getLinkLayerAddress:self->_linkLayerAddress forIPv6Address:self->_ipv6Address error:a3];
  if (v4) {
    self->_hasLinkLayerAddress = 1;
  }
  return v4;
}

- (void)pokeDestinationAtPort:(unsigned __int16)a3 onInterfaceIndex:(unsigned int)a4
{
  memset(&v6[1], 0, 24);
  HIWORD(v6[0]) = __rev16(a3);
  LOWORD(v6[0]) = 7708;
  *(_OWORD *)&v6[2] = *(_OWORD *)[(TSBonjourIPv6Address *)self ipv6Address];
  if (LOBYTE(v6[2]) == 254 && (BYTE1(v6[2]) & 0xC0) == 0x80) {
    v6[6] = a4;
  }
  int v5 = socket(30, 1, 0);
  fcntl(v5, 4, 4);
  connect(v5, (const sockaddr *)v6, 0x1Cu);
  close(v5);
}

- (id)copyWithZone:(_NSZone *)a3
{
  int v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  int v5 = self;
  v6 = objc_msgSend(v4, "initWithIPv6Address:", -[TSBonjourIPv6Address ipv6Address](v5, "ipv6Address"));
  if ([(TSBonjourIPv6Address *)v5 hasLinkLayerAddress])
  {
    [v6 setHasLinkLayerAddress:1];
    uint64_t v7 = [v6 linkLayerAddress];
    uint64_t v8 = [(TSBonjourIPv6Address *)v5 linkLayerAddress];
    __int16 v9 = *(_WORD *)(v8 + 4);
    *(_DWORD *)uint64_t v7 = *(_DWORD *)v8;
    *(_WORD *)(v7 + 4) = v9;
  }
  return v6;
}

- (BOOL)hasLinkLayerAddress
{
  return self->_hasLinkLayerAddress;
}

- (void)setHasLinkLayerAddress:(BOOL)a3
{
  self->_hasLinkLayerAddress = a3;
}

@end