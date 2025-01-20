@interface TSBonjourIPv4Address
+ (BOOL)getLinkLayerAddress:(char *)a3 forIPv4Address:(unsigned int)a4 error:(id *)a5;
- (BOOL)getLinkLayerAddressError:(id *)a3;
- (BOOL)hasLinkLayerAddress;
- (TSBonjourIPv4Address)init;
- (TSBonjourIPv4Address)initWithIPv4Address:(unsigned int)a3;
- (const)linkLayerAddress;
- (id)copyWithZone:(_NSZone *)a3;
- (unsigned)ipv4Address;
- (void)setHasLinkLayerAddress:(BOOL)a3;
@end

@implementation TSBonjourIPv4Address

+ (BOOL)getLinkLayerAddress:(char *)a3 forIPv4Address:(unsigned int)a4 error:(id *)a5
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  int v7 = 101;
  v8 = MEMORY[0x1E4F14500];
  while (1)
  {
    size_t size = 0;
    *(_OWORD *)v27 = xmmword_1BA8E2820;
    uint64_t v28 = 0x40000000002;
    if (sysctl(v27, 6u, 0, &size, 0, 0))
    {
      v13 = __error();
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
      {
        int v14 = *v13;
        *(_DWORD *)buf = 67109120;
        int v26 = v14;
        _os_log_impl(&dword_1BA88B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Error %d getting IPv4 routing table size", buf, 8u);
      }
LABEL_12:
      v10 = 0;
      goto LABEL_13;
    }
    v9 = (unsigned __int16 *)malloc_type_malloc(size, 0xDAA463A4uLL);
    if (v9) {
      break;
    }
LABEL_8:
    if (--v7 <= 1) {
      goto LABEL_12;
    }
  }
  v10 = v9;
  if (sysctl(v27, 6u, v9, &size, 0, 0))
  {
    v11 = __error();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = *v11;
      *(_DWORD *)buf = 67109120;
      int v26 = v12;
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
    if (*((unsigned char *)v18 + 93) == 2)
    {
      v20 = (char *)v18 + v19 + 92;
      if (v20[1] == 18 && v20[6] == 6 && *((_WORD *)v20 + 1) && bswap32(*((_DWORD *)v18 + 24)) == a4) {
        break;
      }
    }
    uint64_t v21 = *v18;
    v17 += v21;
    v18 = (unsigned __int16 *)((char *)v18 + v21);
    if (v17 >= size) {
      goto LABEL_13;
    }
  }
  v22 = &v20[v20[5]];
  int v23 = *((_DWORD *)v22 + 2);
  *((_WORD *)a3 + 2) = *((_WORD *)v22 + 6);
  *(_DWORD *)a3 = v23;
  BOOL v15 = 1;
LABEL_14:
  free(v10);
  return v15;
}

- (TSBonjourIPv4Address)init
{
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3C8];
  v5 = [NSString stringWithUTF8String:"-[TSBonjourIPv4Address init]"];
  [v3 raise:v4, @"Do not call %@", v5 format];

  return 0;
}

- (TSBonjourIPv4Address)initWithIPv4Address:(unsigned int)a3
{
  v5.receiver = self;
  v5.super_class = (Class)TSBonjourIPv4Address;
  result = [(TSBonjourIPv4Address *)&v5 init];
  if (result)
  {
    result->_ipv4Address = a3;
    result->_hasLinkLayerAddress = 0;
    *(_DWORD *)result->_linkLayerAddress = -1;
    *(_WORD *)&result->_linkLayerAddress[4] = -1;
  }
  return result;
}

- (const)linkLayerAddress
{
  return (const char *)self->_linkLayerAddress;
}

- (BOOL)getLinkLayerAddressError:(id *)a3
{
  int v4 = [(id)objc_opt_class() getLinkLayerAddress:self->_linkLayerAddress forIPv4Address:self->_ipv4Address error:a3];
  if (v4) {
    self->_hasLinkLayerAddress = 1;
  }
  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  int v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "initWithIPv4Address:", -[TSBonjourIPv4Address ipv4Address](self, "ipv4Address"));
  if ([(TSBonjourIPv4Address *)self hasLinkLayerAddress])
  {
    [v4 setHasLinkLayerAddress:1];
    uint64_t v5 = [v4 linkLayerAddress];
    v6 = [(TSBonjourIPv4Address *)self linkLayerAddress];
    __int16 v7 = *((_WORD *)v6 + 2);
    *(_DWORD *)uint64_t v5 = *(_DWORD *)v6;
    *(_WORD *)(v5 + 4) = v7;
  }
  return v4;
}

- (unsigned)ipv4Address
{
  return self->_ipv4Address;
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