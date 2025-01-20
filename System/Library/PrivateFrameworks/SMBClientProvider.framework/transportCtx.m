@interface transportCtx
- (NSString)serverName;
- (SMBNode)fidCtx;
- (SMBPiston)pd;
- (transportCtx)initWithPiston:(id)a3 ServerName:(id)a4 ServerMaxRead:(unsigned int)a5 ServerMaxWrite:(unsigned int)a6 ServerMaxTransact:(unsigned int)a7 ShareID:(unsigned int)a8;
- (unsigned)serverMaxRead;
- (unsigned)serverMaxTransact;
- (unsigned)serverMaxWrite;
- (unsigned)shareID;
- (void)setFidCtx:(id)a3;
- (void)setPd:(id)a3;
- (void)setServerMaxRead:(unsigned int)a3;
- (void)setServerMaxTransact:(unsigned int)a3;
- (void)setServerMaxWrite:(unsigned int)a3;
- (void)setServerName:(id)a3;
- (void)setShareID:(unsigned int)a3;
@end

@implementation transportCtx

- (transportCtx)initWithPiston:(id)a3 ServerName:(id)a4 ServerMaxRead:(unsigned int)a5 ServerMaxWrite:(unsigned int)a6 ServerMaxTransact:(unsigned int)a7 ShareID:(unsigned int)a8
{
  id v15 = a3;
  id v16 = a4;
  v21.receiver = self;
  v21.super_class = (Class)transportCtx;
  v17 = [(transportCtx *)&v21 init];
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_pd, a3);
    objc_storeStrong((id *)&v18->_serverName, a4);
    fidCtx = v18->_fidCtx;
    v18->_fidCtx = 0;

    v18->_serverMaxRead = a5;
    v18->_serverMaxWrite = a6;
    v18->_serverMaxTransact = a7;
    v18->_shareID = a8;
  }

  return v18;
}

- (SMBPiston)pd
{
  return (SMBPiston *)objc_getProperty(self, a2, 24, 1);
}

- (void)setPd:(id)a3
{
}

- (SMBNode)fidCtx
{
  return (SMBNode *)objc_getProperty(self, a2, 32, 1);
}

- (void)setFidCtx:(id)a3
{
}

- (NSString)serverName
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (void)setServerName:(id)a3
{
}

- (unsigned)serverMaxRead
{
  return self->_serverMaxRead;
}

- (void)setServerMaxRead:(unsigned int)a3
{
  self->_serverMaxRead = a3;
}

- (unsigned)serverMaxWrite
{
  return self->_serverMaxWrite;
}

- (void)setServerMaxWrite:(unsigned int)a3
{
  self->_serverMaxWrite = a3;
}

- (unsigned)serverMaxTransact
{
  return self->_serverMaxTransact;
}

- (void)setServerMaxTransact:(unsigned int)a3
{
  self->_serverMaxTransact = a3;
}

- (unsigned)shareID
{
  return self->_shareID;
}

- (void)setShareID:(unsigned int)a3
{
  self->_shareID = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serverName, 0);
  objc_storeStrong((id *)&self->_fidCtx, 0);
  objc_storeStrong((id *)&self->_pd, 0);
}

@end