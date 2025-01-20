@interface BTPBrowser
- (BOOL)start;
- (BTPBrowser)initWithSrcIfIndex:(unsigned int)a3 dstIfIndex:(unsigned int)a4 bonjourType:(id)a5;
- (NSMutableDictionary)resolvers;
- (NSString)bonjourType;
- (_DNSServiceRef_t)sdRefBrowse;
- (unsigned)dstIfIndex;
- (unsigned)srcIfIndex;
- (void)dealloc;
- (void)handleReplyName:(id)a3 type:(id)a4 domain:(id)a5 ifIndex:(unsigned int)a6 add:(BOOL)a7;
- (void)setBonjourType:(id)a3;
- (void)setDstIfIndex:(unsigned int)a3;
- (void)setResolvers:(id)a3;
- (void)setSdRefBrowse:(_DNSServiceRef_t *)a3;
- (void)setSrcIfIndex:(unsigned int)a3;
- (void)stop;
@end

@implementation BTPBrowser

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resolvers, 0);

  objc_storeStrong((id *)&self->_bonjourType, 0);
}

- (void)setResolvers:(id)a3
{
}

- (NSMutableDictionary)resolvers
{
  return self->_resolvers;
}

- (void)setBonjourType:(id)a3
{
}

- (NSString)bonjourType
{
  return self->_bonjourType;
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

- (void)setSdRefBrowse:(_DNSServiceRef_t *)a3
{
  self->_sdRefBrowse = a3;
}

- (_DNSServiceRef_t)sdRefBrowse
{
  return self->_sdRefBrowse;
}

- (void)handleReplyName:(id)a3 type:(id)a4 domain:(id)a5 ifIndex:(unsigned int)a6 add:(BOOL)a7
{
  BOOL v7 = a7;
  uint64_t v8 = *(void *)&a6;
  id v25 = a3;
  id v12 = a4;
  id v13 = a5;
  if (self->_srcIfIndex == v8)
  {
    if (qword_1001F4890 != -1) {
      dispatch_once(&qword_1001F4890, &stru_1001C6480);
    }
    if (_NRLogIsLevelEnabled())
    {
      if (qword_1001F4890 != -1) {
        dispatch_once(&qword_1001F4890, &stru_1001C6480);
      }
      v14 = "Rmv";
      if (v7) {
        v14 = "Add";
      }
      uint64_t v21 = v8;
      id v22 = v13;
      v20 = v14;
      id v23 = v12;
      id v24 = v25;
      _NRLogWithArgs();
    }
    v15 = +[NSString stringWithFormat:@"%@.%@.%@", v25, v12, v13, v20, v21, v22, v23, v24];
    v16 = [(NSMutableDictionary *)self->_resolvers objectForKeyedSubscript:v15];
    v17 = v16;
    if (v7)
    {

      if (v17)
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
      else
      {
        v18 = [[BTPResolver alloc] initWithSrcIfIndex:self->_srcIfIndex dstIfIndex:self->_dstIfIndex name:v25 type:v12 domain:v13];
        v19 = v18;
        if (v18 && [(BTPResolver *)v18 start]) {
          [(NSMutableDictionary *)self->_resolvers setObject:v19 forKeyedSubscript:v15];
        }
      }
    }
    else
    {
      if (v16)
      {
        [v16 stop];
        [(NSMutableDictionary *)self->_resolvers removeObjectForKey:v15];
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
  if (self->_sdRefBrowse)
  {
    if (qword_1001F4890 != -1) {
      dispatch_once(&qword_1001F4890, &stru_1001C6480);
    }
    if (_NRLogIsLevelEnabled())
    {
      if (qword_1001F4890 != -1) {
        dispatch_once(&qword_1001F4890, &stru_1001C6480);
      }
      uint64_t v5 = 218;
      v3 = "";
      v4 = "-[BTPBrowser dealloc]";
      _NRLogWithArgs();
    }
    [(BTPBrowser *)self stop];
  }
  v6.receiver = self;
  v6.super_class = (Class)BTPBrowser;
  [(BTPBrowser *)&v6 dealloc];
}

- (void)stop
{
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v3 = self->_resolvers;
  id v4 = [(NSMutableDictionary *)v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v11;
    do
    {
      BOOL v7 = 0;
      do
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = -[NSMutableDictionary objectForKeyedSubscript:](self->_resolvers, "objectForKeyedSubscript:", *(void *)(*((void *)&v10 + 1) + 8 * (void)v7), (void)v10);
        [v8 stop];

        BOOL v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      id v5 = [(NSMutableDictionary *)v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v5);
  }

  sdRefBrowse = self->_sdRefBrowse;
  if (sdRefBrowse)
  {
    DNSServiceRefDeallocate(sdRefBrowse);
    self->_sdRefBrowse = 0;
  }
}

- (BOOL)start
{
  p_sdRefBrowse = &self->_sdRefBrowse;
  if (self->_sdRefBrowse) {
    return 1;
  }
  DNSServiceErrorType v5 = DNSServiceBrowse(p_sdRefBrowse, 0, self->_srcIfIndex, [(NSString *)self->_bonjourType UTF8String], "local", (DNSServiceBrowseReply)sub_1000236D4, self);
  sdRefBrowse = self->_sdRefBrowse;
  if (sdRefBrowse) {
    BOOL v7 = v5 == 0;
  }
  else {
    BOOL v7 = 0;
  }
  if (v7)
  {
    if (qword_1001F48A0 != -1)
    {
      long long v10 = self->_sdRefBrowse;
      dispatch_once(&qword_1001F48A0, &stru_1001C64A0);
      sdRefBrowse = v10;
    }
    uint64_t v8 = DNSServiceSetDispatchQueue(sdRefBrowse, (dispatch_queue_t)qword_1001F4898);
    if (!v8)
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
    uint64_t v9 = v8;
    if (qword_1001F4890 != -1) {
      dispatch_once(&qword_1001F4890, &stru_1001C6480);
    }
    if (_NRLogIsLevelEnabled())
    {
      if (qword_1001F4890 != -1) {
        dispatch_once(&qword_1001F4890, &stru_1001C6480);
      }
      uint64_t v13 = 196;
      uint64_t v14 = v9;
      long long v11 = "";
      long long v12 = "-[BTPBrowser start]";
      _NRLogWithArgs();
    }
    [(BTPBrowser *)self stop];
    return 0;
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
    BOOL result = 0;
    *p_sdRefBrowse = 0;
  }
  return result;
}

- (BTPBrowser)initWithSrcIfIndex:(unsigned int)a3 dstIfIndex:(unsigned int)a4 bonjourType:(id)a5
{
  id v9 = a5;
  v16.receiver = self;
  v16.super_class = (Class)BTPBrowser;
  long long v10 = [(BTPBrowser *)&v16 init];
  long long v11 = v10;
  if (v10)
  {
    v10->_sdRefBrowse = 0;
    v10->_srcIfIndex = a3;
    v10->_dstIfIndex = a4;
    objc_storeStrong((id *)&v10->_bonjourType, a5);
    uint64_t v12 = +[NSMutableDictionary dictionary];
    resolvers = v11->_resolvers;
    v11->_resolvers = (NSMutableDictionary *)v12;

    uint64_t v14 = v11;
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

  return v11;
}

@end