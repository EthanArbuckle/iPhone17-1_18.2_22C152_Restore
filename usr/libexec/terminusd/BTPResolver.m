@interface BTPResolver
- (BOOL)start;
- (BTPResolver)initWithSrcIfIndex:(unsigned int)a3 dstIfIndex:(unsigned int)a4 name:(id)a5 type:(id)a6 domain:(id)a7;
- (NSMutableArray)advertisers;
- (NSString)bonjourDomain;
- (NSString)bonjourName;
- (NSString)bonjourType;
- (_DNSServiceRef_t)sdRefResolve;
- (unsigned)dstIfIndex;
- (unsigned)srcIfIndex;
- (void)dealloc;
- (void)handleReplyFullName:(id)a3 hostTarget:(id)a4 port:(unsigned __int16)a5 txtRecord:(id)a6 ifIndex:(unsigned int)a7;
- (void)setAdvertisers:(id)a3;
- (void)setBonjourDomain:(id)a3;
- (void)setBonjourName:(id)a3;
- (void)setBonjourType:(id)a3;
- (void)setDstIfIndex:(unsigned int)a3;
- (void)setSdRefResolve:(_DNSServiceRef_t *)a3;
- (void)setSrcIfIndex:(unsigned int)a3;
- (void)stop;
@end

@implementation BTPResolver

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_advertisers, 0);
  objc_storeStrong((id *)&self->_bonjourDomain, 0);
  objc_storeStrong((id *)&self->_bonjourType, 0);

  objc_storeStrong((id *)&self->_bonjourName, 0);
}

- (void)setAdvertisers:(id)a3
{
}

- (NSMutableArray)advertisers
{
  return self->_advertisers;
}

- (void)setBonjourDomain:(id)a3
{
}

- (NSString)bonjourDomain
{
  return self->_bonjourDomain;
}

- (void)setBonjourType:(id)a3
{
}

- (NSString)bonjourType
{
  return self->_bonjourType;
}

- (void)setBonjourName:(id)a3
{
}

- (NSString)bonjourName
{
  return self->_bonjourName;
}

- (void)setDstIfIndex:(unsigned int)a3
{
  self->_dstIfIndex = a3;
}

- (unsigned)dstIfIndex
{
  return self->_dstIfIndex;
}

- (void)setSrcIfIndex:(unsigned int)a3
{
  self->_srcIfIndex = a3;
}

- (unsigned)srcIfIndex
{
  return self->_srcIfIndex;
}

- (void)setSdRefResolve:(_DNSServiceRef_t *)a3
{
  self->_sdRefResolve = a3;
}

- (_DNSServiceRef_t)sdRefResolve
{
  return self->_sdRefResolve;
}

- (void)handleReplyFullName:(id)a3 hostTarget:(id)a4 port:(unsigned __int16)a5 txtRecord:(id)a6 ifIndex:(unsigned int)a7
{
  id v17 = a3;
  id v12 = a4;
  id v13 = a6;
  if (self->_srcIfIndex == a7)
  {
    if (qword_1001F4890 != -1) {
      dispatch_once(&qword_1001F4890, &stru_1001C6480);
    }
    if (_NRLogIsLevelEnabled())
    {
      if (qword_1001F4890 != -1) {
        dispatch_once(&qword_1001F4890, &stru_1001C6480);
      }
      v16 = "";
      _NRLogWithArgs();
    }
    LOWORD(v16) = a5;
    v14 = [[BTPAdvertiser alloc] initWithSrcIfIndex:self->_srcIfIndex dstIfIndex:self->_dstIfIndex name:self->_bonjourName type:self->_bonjourType domain:self->_bonjourDomain hostTarget:v12 port:v16 txtRecord:v13];
    v15 = v14;
    if (v14)
    {
      [(BTPAdvertiser *)v14 start];
      [(NSMutableArray *)self->_advertisers addObject:v15];
    }
  }
  else
  {
    if (qword_1001F4890 != -1) {
      dispatch_once(&qword_1001F4890, &stru_1001C6480);
    }
    if (_NRLogIsLevelEnabled())
    {
      if (qword_1001F4890 != -1) {
        dispatch_once(&qword_1001F4890, &stru_1001C6480);
      }
      _NRLogWithArgs();
    }
  }
}

- (void)dealloc
{
  if (self->_sdRefResolve)
  {
    if (qword_1001F4890 != -1) {
      dispatch_once(&qword_1001F4890, &stru_1001C6480);
    }
    if (_NRLogIsLevelEnabled())
    {
      if (qword_1001F4890 != -1) {
        dispatch_once(&qword_1001F4890, &stru_1001C6480);
      }
      uint64_t v5 = 329;
      v3 = "";
      v4 = "-[BTPResolver dealloc]";
      _NRLogWithArgs();
    }
    [(BTPResolver *)self stop];
  }
  v6.receiver = self;
  v6.super_class = (Class)BTPResolver;
  [(BTPResolver *)&v6 dealloc];
}

- (void)stop
{
  sdRefResolve = self->_sdRefResolve;
  if (sdRefResolve)
  {
    DNSServiceRefDeallocate(sdRefResolve);
    self->_sdRefResolve = 0;
  }
  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  v4 = self->_advertisers;
  id v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        [*(id *)(*((void *)&v9 + 1) + 8 * (void)v8) stop:v9];
        v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id v6 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (BOOL)start
{
  p_sdRefResolve = &self->_sdRefResolve;
  if (self->_sdRefResolve) {
    return 1;
  }
  DNSServiceErrorType v5 = DNSServiceResolve(p_sdRefResolve, 0, self->_srcIfIndex, [(NSString *)self->_bonjourName UTF8String], [(NSString *)self->_bonjourType UTF8String], [(NSString *)self->_bonjourDomain UTF8String], (DNSServiceResolveReply)sub_100022C30, self);
  sdRefResolve = self->_sdRefResolve;
  if (!sdRefResolve || v5)
  {
    if (qword_1001F4890 != -1) {
      dispatch_once(&qword_1001F4890, &stru_1001C6480);
    }
    if (_NRLogIsLevelEnabled())
    {
      if (qword_1001F4890 != -1) {
        dispatch_once(&qword_1001F4890, &stru_1001C6480);
      }
      _NRLogWithArgs();
    }
    BOOL result = 0;
    *p_sdRefResolve = 0;
  }
  else
  {
    if (qword_1001F48A0 != -1)
    {
      long long v9 = self->_sdRefResolve;
      dispatch_once(&qword_1001F48A0, &stru_1001C64A0);
      sdRefResolve = v9;
    }
    uint64_t v7 = DNSServiceSetDispatchQueue(sdRefResolve, (dispatch_queue_t)qword_1001F4898);
    if (!v7)
    {
      if (qword_1001F4890 != -1) {
        dispatch_once(&qword_1001F4890, &stru_1001C6480);
      }
      if (_NRLogIsLevelEnabled())
      {
        if (qword_1001F4890 != -1) {
          dispatch_once(&qword_1001F4890, &stru_1001C6480);
        }
        _NRLogWithArgs();
      }
      return 1;
    }
    uint64_t v8 = v7;
    if (qword_1001F4890 != -1) {
      dispatch_once(&qword_1001F4890, &stru_1001C6480);
    }
    if (_NRLogIsLevelEnabled())
    {
      if (qword_1001F4890 != -1) {
        dispatch_once(&qword_1001F4890, &stru_1001C6480);
      }
      uint64_t v12 = 306;
      uint64_t v13 = v8;
      long long v10 = "";
      long long v11 = "-[BTPResolver start]";
      _NRLogWithArgs();
    }
    [(BTPResolver *)self stop];
    return 0;
  }
  return result;
}

- (BTPResolver)initWithSrcIfIndex:(unsigned int)a3 dstIfIndex:(unsigned int)a4 name:(id)a5 type:(id)a6 domain:(id)a7
{
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  v22.receiver = self;
  v22.super_class = (Class)BTPResolver;
  v16 = [(BTPResolver *)&v22 init];
  id v17 = v16;
  if (v16)
  {
    v16->_sdRefResolve = 0;
    v16->_srcIfIndex = a3;
    v16->_dstIfIndex = a4;
    objc_storeStrong((id *)&v16->_bonjourName, a5);
    objc_storeStrong((id *)&v17->_bonjourType, a6);
    objc_storeStrong((id *)&v17->_bonjourDomain, a7);
    uint64_t v18 = +[NSMutableArray array];
    advertisers = v17->_advertisers;
    v17->_advertisers = (NSMutableArray *)v18;

    v20 = v17;
  }
  else
  {
    if (qword_1001F4890 != -1) {
      dispatch_once(&qword_1001F4890, &stru_1001C6480);
    }
    if (_NRLogIsLevelEnabled())
    {
      if (qword_1001F4890 != -1) {
        dispatch_once(&qword_1001F4890, &stru_1001C6480);
      }
      _NRLogWithArgs();
    }
  }

  return v17;
}

@end