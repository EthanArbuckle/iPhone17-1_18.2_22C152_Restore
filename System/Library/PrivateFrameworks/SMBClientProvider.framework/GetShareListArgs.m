@interface GetShareListArgs
- (GetShareListArgs)initWithPiston:(id)a3 ServerName:(id)a4 ServerMaxRead:(unsigned int)a5 ServerMaxWrite:(unsigned int)a6 ServerMaxTransact:(unsigned int)a7 ShareID:(unsigned int)a8;
- (NSString)serverName;
- (SMBPiston)pd;
- (int)status;
- (unsigned)serverMaxRead;
- (unsigned)serverMaxTransact;
- (unsigned)serverMaxWrite;
- (unsigned)shareID;
- (void)dealloc;
- (void)setPd:(id)a3;
- (void)setServerMaxRead:(unsigned int)a3;
- (void)setServerMaxTransact:(unsigned int)a3;
- (void)setServerMaxWrite:(unsigned int)a3;
- (void)setServerName:(id)a3;
- (void)setShareID:(unsigned int)a3;
- (void)setStatus:(int)a3;
@end

@implementation GetShareListArgs

- (GetShareListArgs)initWithPiston:(id)a3 ServerName:(id)a4 ServerMaxRead:(unsigned int)a5 ServerMaxWrite:(unsigned int)a6 ServerMaxTransact:(unsigned int)a7 ShareID:(unsigned int)a8
{
  id v15 = a3;
  id v16 = a4;
  v20.receiver = self;
  v20.super_class = (Class)GetShareListArgs;
  v17 = [(GetShareListArgs *)&v20 init];
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_pd, a3);
    objc_storeStrong((id *)&v18->_serverName, a4);
    v18->_serverMaxRead = a5;
    v18->_serverMaxWrite = a6;
    v18->_serverMaxTransact = a7;
    v18->_shareID = a8;
    v18->_status = 0;
  }

  return v18;
}

- (void)dealloc
{
  serverName = self->_serverName;
  self->_serverName = 0;

  v4.receiver = self;
  v4.super_class = (Class)GetShareListArgs;
  [(GetShareListArgs *)&v4 dealloc];
}

- (SMBPiston)pd
{
  return (SMBPiston *)objc_getProperty(self, a2, 32, 1);
}

- (void)setPd:(id)a3
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

- (NSString)serverName
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (void)setServerName:(id)a3
{
}

- (unsigned)shareID
{
  return self->_shareID;
}

- (void)setShareID:(unsigned int)a3
{
  self->_shareID = a3;
}

- (int)status
{
  return self->_status;
}

- (void)setStatus:(int)a3
{
  self->_status = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serverName, 0);
  objc_storeStrong((id *)&self->_pd, 0);
}

@end