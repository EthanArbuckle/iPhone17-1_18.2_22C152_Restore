@interface BTPAdvertiser
- (BOOL)start;
- (BTPAdvertiser)initWithSrcIfIndex:(unsigned int)a3 dstIfIndex:(unsigned int)a4 name:(id)a5 type:(id)a6 domain:(id)a7 hostTarget:(id)a8 port:(unsigned __int16)a9 txtRecord:(id)a10;
- (NSData)txtRecord;
- (NSString)bonjourDomain;
- (NSString)bonjourName;
- (NSString)bonjourType;
- (NSString)hostTarget;
- (_DNSServiceRef_t)sdRefRegister;
- (unsigned)dstIfIndex;
- (unsigned)port;
- (unsigned)srcIfIndex;
- (void)dealloc;
- (void)setBonjourDomain:(id)a3;
- (void)setBonjourName:(id)a3;
- (void)setBonjourType:(id)a3;
- (void)setDstIfIndex:(unsigned int)a3;
- (void)setHostTarget:(id)a3;
- (void)setPort:(unsigned __int16)a3;
- (void)setSdRefRegister:(_DNSServiceRef_t *)a3;
- (void)setSrcIfIndex:(unsigned int)a3;
- (void)setTxtRecord:(id)a3;
- (void)stop;
@end

@implementation BTPAdvertiser

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_txtRecord, 0);
  objc_storeStrong((id *)&self->_hostTarget, 0);
  objc_storeStrong((id *)&self->_bonjourDomain, 0);
  objc_storeStrong((id *)&self->_bonjourType, 0);

  objc_storeStrong((id *)&self->_bonjourName, 0);
}

- (void)setTxtRecord:(id)a3
{
}

- (NSData)txtRecord
{
  return self->_txtRecord;
}

- (void)setPort:(unsigned __int16)a3
{
  self->_port = a3;
}

- (unsigned)port
{
  return self->_port;
}

- (void)setHostTarget:(id)a3
{
}

- (NSString)hostTarget
{
  return self->_hostTarget;
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

- (void)setSdRefRegister:(_DNSServiceRef_t *)a3
{
  self->_sdRefRegister = a3;
}

- (_DNSServiceRef_t)sdRefRegister
{
  return self->_sdRefRegister;
}

- (void)dealloc
{
  if (self->_sdRefRegister)
  {
    if (qword_1001F4890 != -1) {
      dispatch_once(&qword_1001F4890, &stru_1001C6480);
    }
    if (_NRLogIsLevelEnabled())
    {
      if (qword_1001F4890 != -1) {
        dispatch_once(&qword_1001F4890, &stru_1001C6480);
      }
      uint64_t v5 = 433;
      v3 = "";
      v4 = "-[BTPAdvertiser dealloc]";
      _NRLogWithArgs();
    }
    [(BTPAdvertiser *)self stop];
  }
  v6.receiver = self;
  v6.super_class = (Class)BTPAdvertiser;
  [(BTPAdvertiser *)&v6 dealloc];
}

- (void)stop
{
  sdRefRegister = self->_sdRefRegister;
  if (sdRefRegister)
  {
    DNSServiceRefDeallocate(sdRefRegister);
    self->_sdRefRegister = 0;
  }
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

- (BOOL)start
{
  p_sdRefRegister = &self->_sdRefRegister;
  if (self->_sdRefRegister) {
    return 1;
  }
  DNSServiceErrorType v5 = DNSServiceRegister(p_sdRefRegister, 0, self->_dstIfIndex, [(NSString *)self->_bonjourName UTF8String], [(NSString *)self->_bonjourType UTF8String], [(NSString *)self->_bonjourDomain UTF8String], [(NSString *)self->_hostTarget UTF8String], self->_port, (uint16_t)[(NSData *)self->_txtRecord length], [(NSData *)self->_txtRecord bytes], (DNSServiceRegisterReply)nullsub_5, self);
  sdRefRegister = self->_sdRefRegister;
  if (!sdRefRegister || v5)
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
    *p_sdRefRegister = 0;
  }
  else
  {
    if (qword_1001F48A0 != -1)
    {
      v9 = self->_sdRefRegister;
      dispatch_once(&qword_1001F48A0, &stru_1001C64A0);
      sdRefRegister = v9;
    }
    uint64_t v7 = DNSServiceSetDispatchQueue(sdRefRegister, (dispatch_queue_t)qword_1001F4898);
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
      uint64_t callBack = 411;
      uint64_t v13 = v8;
      txtLen = "";
      txtRecord = "-[BTPAdvertiser start]";
      _NRLogWithArgs();
    }
    [(BTPAdvertiser *)self stop];
    return 0;
  }
  return result;
}

- (BTPAdvertiser)initWithSrcIfIndex:(unsigned int)a3 dstIfIndex:(unsigned int)a4 name:(id)a5 type:(id)a6 domain:(id)a7 hostTarget:(id)a8 port:(unsigned __int16)a9 txtRecord:(id)a10
{
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v27 = a8;
  id v26 = a10;
  v28.receiver = self;
  v28.super_class = (Class)BTPAdvertiser;
  v19 = [(BTPAdvertiser *)&v28 init];
  v20 = v19;
  if (v19)
  {
    v19->_sdRefRegister = 0;
    v19->_srcIfIndex = a3;
    v19->_dstIfIndex = a4;
    objc_storeStrong((id *)&v19->_bonjourName, a5);
    objc_storeStrong((id *)&v20->_bonjourType, a6);
    objc_storeStrong((id *)&v20->_bonjourDomain, a7);
    objc_storeStrong((id *)&v20->_hostTarget, a8);
    v20->_port = a9;
    objc_storeStrong((id *)&v20->_txtRecord, a10);
    v21 = v20;
    v23 = v26;
    v22 = v27;
  }
  else
  {
    if (qword_1001F4890 != -1) {
      dispatch_once(&qword_1001F4890, &stru_1001C6480);
    }
    v23 = v26;
    v22 = v27;
    if (_NRLogIsLevelEnabled())
    {
      if (qword_1001F4890 != -1) {
        dispatch_once(&qword_1001F4890, &stru_1001C6480);
      }
      _NRLogWithArgs();
    }
  }

  return v20;
}

@end