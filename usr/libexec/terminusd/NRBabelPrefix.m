@interface NRBabelPrefix
- (BOOL)isContainedInPrefix:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)matchesPrefix:(const in6_addr *)a3 plen:(unsigned __int8)a4;
- (NRBabelPrefix)initWithPrefix:(const in6_addr *)a3 plen:(unsigned __int8)a4;
- (id)description;
- (id)descriptionWithoutPlen;
- (in6_addr)prefixInner;
- (unsigned)plen;
- (unsigned)writeToAE:(char *)a3 plen:(char *)a4 prefix:(char *)a5;
- (void)setPlen:(unsigned __int8)a3;
- (void)setPrefixInner:(in6_addr)a3;
- (void)writePrefix:(in6_addr *)a3;
@end

@implementation NRBabelPrefix

- (void)setPlen:(unsigned __int8)a3
{
  self->_plen = a3;
}

- (unsigned)plen
{
  return self->_plen;
}

- (void)setPrefixInner:(in6_addr)a3
{
  self->_prefixInner = a3;
}

- (in6_addr)prefixInner
{
  uint64_t v2 = *(void *)&self->_prefixInner.__u6_addr32[2];
  uint64_t v3 = *(void *)self->_prefixInner.__u6_addr8;
  *(void *)&result.__u6_addr32[2] = v2;
  *(void *)result.__u6_addr8 = v3;
  return result;
}

- (unsigned)writeToAE:(char *)a3 plen:(char *)a4 prefix:(char *)a5
{
  *(void *)a5 = 0;
  *((void *)a5 + 1) = 0;
  unsigned int plen = self->_plen;
  if (plen < 0x81)
  {
    if (!self->_plen)
    {
      LOBYTE(v12) = 0;
      *a3 = 0;
      goto LABEL_14;
    }
  }
  else
  {
    if (qword_1001F4A58 != -1) {
      dispatch_once(&qword_1001F4A58, &stru_1001C71C0);
    }
    if (_NRLogIsLevelEnabled())
    {
      if (qword_1001F4A58 != -1) {
        dispatch_once(&qword_1001F4A58, &stru_1001C71C0);
      }
      _NRLogWithArgs();
    }
    unsigned int plen = 128;
  }
  unsigned int v10 = plen + 7;
  p_prefixInner = &self->_prefixInner;
  if (!self->_prefixInner.__u6_addr32[0] && !self->_prefixInner.__u6_addr32[1])
  {
    __uint32_t v14 = self->_prefixInner.__u6_addr32[2];
    if (v14)
    {
      if (v14 == -65536)
      {
        LOBYTE(plen) = plen - 96;
        int v12 = (v10 >> 3) - 12;
        *a3 = 1;
        p_prefixInner = (in6_addr *)&self->_prefixInner.__u6_addr32[3];
        goto LABEL_13;
      }
    }
    else if (self->_prefixInner.__u6_addr32[3] == 0x1000000)
    {
      *a3 = 3;
      int v12 = (v10 >> 3) - 8;
      p_prefixInner = (in6_addr *)&self->_prefixInner.__u6_addr32[2];
      goto LABEL_13;
    }
  }
  int v12 = v10 >> 3;
  *a3 = 2;
LABEL_13:
  memcpy(a5, p_prefixInner, v12);
LABEL_14:
  *a4 = plen;
  return v12;
}

- (void)writePrefix:(in6_addr *)a3
{
  *a3 = self->_prefixInner;
}

- (BOOL)isContainedInPrefix:(id)a3
{
  id v4 = a3;
  unsigned int plen = self->_plen;
  if (plen >= [v4 plen]) {
    unsigned __int8 v6 = [v4 matchesPrefix:&self->_prefixInner plen:objc_msgSend(v4, "plen")];
  }
  else {
    unsigned __int8 v6 = 0;
  }

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    unsigned __int8 v5 = [v4 matchesPrefix:&self->_prefixInner plen:self->_plen];
  }
  else {
    unsigned __int8 v5 = 0;
  }

  return v5;
}

- (id)descriptionWithoutPlen
{
  if (self->_prefixInner.__u6_addr32[0]
    || self->_prefixInner.__u6_addr32[1]
    || self->_prefixInner.__u6_addr32[2] != -65536)
  {
    IPv6AddrString = (void *)createIPv6AddrString();
  }
  else
  {
    IPv6AddrString = 0;
  }

  return IPv6AddrString;
}

- (id)description
{
  unsigned __int8 plen = self->_plen;
  if (!self->_prefixInner.__u6_addr32[0]
    && !self->_prefixInner.__u6_addr32[1]
    && self->_prefixInner.__u6_addr32[2] == -65536)
  {
    plen -= 96;
  }
  id v3 = objc_alloc((Class)NSString);
  IPv6AddrString = (void *)createIPv6AddrString();
  id v5 = [v3 initWithFormat:@"%@/%u", IPv6AddrString, plen];

  return v5;
}

- (BOOL)matchesPrefix:(const in6_addr *)a3 plen:(unsigned __int8)a4
{
  if (self->_plen != a4) {
    return 0;
  }
  unsigned int v4 = a4;
  p_prefixInner = &self->_prefixInner;
  if (a4 >= 0x81u)
  {
    if (qword_1001F4A58 != -1) {
      dispatch_once(&qword_1001F4A58, &stru_1001C71C0);
    }
    if (_NRLogIsLevelEnabled())
    {
      if (qword_1001F4A58 != -1) {
        dispatch_once(&qword_1001F4A58, &stru_1001C71C0);
      }
      _NRLogWithArgs();
    }
    unsigned int v4 = 128;
  }
  char v7 = v4;
  size_t v8 = (unint64_t)v4 >> 3;
  if (memcmp(p_prefixInner, a3, v8)) {
    return 0;
  }
  if ((v7 & 7) != 0)
  {
    if ((v7 & 0x80) == 0) {
      return (a3->__u6_addr8[v8] ^ p_prefixInner->__u6_addr8[v8]) >> (8 - (v7 & 7)) == 0;
    }
    if (qword_1001F4A58 != -1) {
      dispatch_once(&qword_1001F4A58, &stru_1001C71C0);
    }
    if (_NRLogIsLevelEnabled())
    {
      if (qword_1001F4A58 != -1) {
        dispatch_once(&qword_1001F4A58, &stru_1001C71C0);
      }
      _NRLogWithArgs();
    }
  }
  return 1;
}

- (NRBabelPrefix)initWithPrefix:(const in6_addr *)a3 plen:(unsigned __int8)a4
{
  uint64_t v6 = a4;
  if (a4 < 0x81u) {
    goto LABEL_8;
  }
  uint64_t v6 = (uint64_t)&unk_1001F4000;
  if (qword_1001F4A58 != -1) {
    goto LABEL_26;
  }
  while (1)
  {
    if (_NRLogIsLevelEnabled())
    {
      if (*(void *)(v6 + 2648) != -1) {
        dispatch_once(&qword_1001F4A58, &stru_1001C71C0);
      }
      _NRLogWithArgs();
    }
    uint64_t v6 = 128;
LABEL_8:
    if (!a3->__u6_addr32[0] && !a3->__u6_addr32[1] && v6 <= 0x5F && a3->__u6_addr32[2] == -65536)
    {
      if (qword_1001F4A58 != -1) {
        dispatch_once(&qword_1001F4A58, &stru_1001C71C0);
      }
      if (_NRLogIsLevelEnabled())
      {
        if (qword_1001F4A58 != -1) {
          dispatch_once(&qword_1001F4A58, &stru_1001C71C0);
        }
        _NRLogWithArgs();
      }
      if (v6 >= 0x21) {
        uint64_t v6 = 128;
      }
      else {
        uint64_t v6 = (v6 + 96);
      }
    }
    v13.receiver = self;
    v13.super_class = (Class)NRBabelPrefix;
    in6_addr result = [(NRBabelPrefix *)&v13 init];
    if (result) {
      break;
    }
    id v8 = sub_1000B9E04();
    int IsLevelEnabled = _NRLogIsLevelEnabled();

    if (IsLevelEnabled)
    {
      id v10 = sub_1000B9E04();
      _NRLogWithArgs();
    }
    a3 = (const in6_addr *)_os_log_pack_size();
    self = (NRBabelPrefix *)((char *)&v12 - ((__chkstk_darwin(a3) + 15) & 0xFFFFFFFFFFFFFFF0));
    __error();
    uint64_t v11 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v11 = 136446210;
    *(void *)(v11 + 4) = "-[NRBabelPrefix initWithPrefix:plen:]";
    sub_1000B9E04();
    _NRLogAbortWithPack();
LABEL_26:
    dispatch_once(&qword_1001F4A58, &stru_1001C71C0);
  }
  result->_prefixInner = *a3;
  result->_unsigned __int8 plen = v6;
  return result;
}

@end