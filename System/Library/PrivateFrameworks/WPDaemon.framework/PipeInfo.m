@interface PipeInfo
- (BOOL)connectionInitiator;
- (BOOL)newProtocol;
- (BOOL)pipeDidConnectSent;
- (BOOL)useConnectStatusPDU;
- (BOOL)versionInfoReceived;
- (BOOL)versionInfoSent;
- (CBScalablePipe)pipe;
- (OS_dispatch_source)pipeReadSource;
- (OS_voucher)voucher;
- (PipeDataTransfer)ackData;
- (PipeDataTransfer)pipeDataTransfer;
- (id)description;
- (unsigned)localSupportedFeatures;
- (unsigned)localVersion;
- (unsigned)supportedFeatures;
- (unsigned)version;
- (void)dealloc;
- (void)setAckData:(id)a3;
- (void)setConnectionInitiator:(BOOL)a3;
- (void)setLocalSupportedFeatures:(unsigned int)a3;
- (void)setLocalVersion:(unsigned __int8)a3;
- (void)setNewProtocol:(BOOL)a3;
- (void)setPipe:(id)a3;
- (void)setPipeDataTransfer:(id)a3;
- (void)setPipeDidConnectSent:(BOOL)a3;
- (void)setPipeReadSource:(id)a3;
- (void)setSupportedFeatures:(unsigned int)a3;
- (void)setUseConnectStatusPDU:(BOOL)a3;
- (void)setVersion:(unsigned __int8)a3;
- (void)setVersionInfoReceived:(BOOL)a3;
- (void)setVersionInfoSent:(BOOL)a3;
- (void)setVoucher:(id)a3;
@end

@implementation PipeInfo

- (void)dealloc
{
  if (WPLogInitOnce != -1) {
    dispatch_once(&WPLogInitOnce, &__block_literal_global_272_2);
  }
  v3 = WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_22316D000, v3, OS_LOG_TYPE_DEFAULT, "WPPM: PipeInfo dealloc", buf, 2u);
  }
  pipe = self->_pipe;
  if (pipe)
  {
    uint64_t v5 = [(CBScalablePipe *)pipe input];
    if (v5)
    {
      v6 = (void *)v5;
      v7 = [(CBScalablePipe *)self->_pipe output];

      if (v7)
      {
        v8 = [(CBScalablePipe *)self->_pipe input];
        v9 = [MEMORY[0x263EFF9F0] currentRunLoop];
        uint64_t v10 = *MEMORY[0x263EFF478];
        [v8 removeFromRunLoop:v9 forMode:*MEMORY[0x263EFF478]];

        v11 = [(CBScalablePipe *)self->_pipe output];
        v12 = [MEMORY[0x263EFF9F0] currentRunLoop];
        [v11 removeFromRunLoop:v12 forMode:v10];

        v13 = [(CBScalablePipe *)self->_pipe input];
        [v13 setDelegate:0];

        v14 = [(CBScalablePipe *)self->_pipe output];
        [v14 setDelegate:0];

        v15 = [(CBScalablePipe *)self->_pipe input];
        [v15 close];

        v16 = [(CBScalablePipe *)self->_pipe output];
        [v16 close];
      }
    }
  }
  voucher = self->_voucher;
  if (voucher)
  {
    self->_voucher = 0;
  }
  v18 = self->_pipe;
  self->_pipe = 0;

  [(PipeInfo *)self releaseQOSOverride];
  pipeReadSource = self->_pipeReadSource;
  if (pipeReadSource) {
    dispatch_source_cancel(pipeReadSource);
  }
  pipeDataTransfer = self->_pipeDataTransfer;
  if (pipeDataTransfer)
  {
    self->_pipeDataTransfer = 0;
  }
  v21.receiver = self;
  v21.super_class = (Class)PipeInfo;
  [(PipeInfo *)&v21 dealloc];
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = [(CBScalablePipe *)self->_pipe name];
  uint64_t v5 = (void *)v4;
  v6 = @"YES";
  if (self->_qosOverride) {
    v7 = @"YES";
  }
  else {
    v7 = @"NO";
  }
  if (!self->_socketThreadQOSOverride) {
    v6 = @"NO";
  }
  v8 = [v3 stringWithFormat:@"PipeInfo: pipe %@, voucher %@, newProtocol %d, vSent %d, vReceived %d, connSent %d, connPDU %d, QOS override %@, socket QOS override %@", v4, self->_voucher, self->_newProtocol, self->_versionInfoSent, self->_versionInfoReceived, self->_pipeDidConnectSent, self->_useConnectStatusPDU, v7, v6];

  return v8;
}

- (OS_dispatch_source)pipeReadSource
{
  return (OS_dispatch_source *)objc_getProperty(self, a2, 40, 1);
}

- (void)setPipeReadSource:(id)a3
{
}

- (CBScalablePipe)pipe
{
  return (CBScalablePipe *)objc_getProperty(self, a2, 48, 1);
}

- (void)setPipe:(id)a3
{
}

- (OS_voucher)voucher
{
  return (OS_voucher *)objc_getProperty(self, a2, 56, 1);
}

- (void)setVoucher:(id)a3
{
}

- (BOOL)newProtocol
{
  return self->_newProtocol;
}

- (void)setNewProtocol:(BOOL)a3
{
  self->_newProtocol = a3;
}

- (BOOL)versionInfoSent
{
  return self->_versionInfoSent;
}

- (void)setVersionInfoSent:(BOOL)a3
{
  self->_versionInfoSent = a3;
}

- (BOOL)versionInfoReceived
{
  return self->_versionInfoReceived;
}

- (void)setVersionInfoReceived:(BOOL)a3
{
  self->_versionInfoReceived = a3;
}

- (BOOL)pipeDidConnectSent
{
  return self->_pipeDidConnectSent;
}

- (void)setPipeDidConnectSent:(BOOL)a3
{
  self->_pipeDidConnectSent = a3;
}

- (unsigned)version
{
  return self->_version;
}

- (void)setVersion:(unsigned __int8)a3
{
  self->_version = a3;
}

- (unsigned)supportedFeatures
{
  return self->_supportedFeatures;
}

- (void)setSupportedFeatures:(unsigned int)a3
{
  self->_supportedFeatures = a3;
}

- (PipeDataTransfer)pipeDataTransfer
{
  return (PipeDataTransfer *)objc_getProperty(self, a2, 64, 1);
}

- (void)setPipeDataTransfer:(id)a3
{
}

- (PipeDataTransfer)ackData
{
  return (PipeDataTransfer *)objc_getProperty(self, a2, 72, 1);
}

- (void)setAckData:(id)a3
{
}

- (unsigned)localVersion
{
  return self->_localVersion;
}

- (void)setLocalVersion:(unsigned __int8)a3
{
  self->_localVersion = a3;
}

- (unsigned)localSupportedFeatures
{
  return self->_localSupportedFeatures;
}

- (void)setLocalSupportedFeatures:(unsigned int)a3
{
  self->_localSupportedFeatures = a3;
}

- (BOOL)useConnectStatusPDU
{
  return self->_useConnectStatusPDU;
}

- (void)setUseConnectStatusPDU:(BOOL)a3
{
  self->_useConnectStatusPDU = a3;
}

- (BOOL)connectionInitiator
{
  return self->_connectionInitiator;
}

- (void)setConnectionInitiator:(BOOL)a3
{
  self->_connectionInitiator = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ackData, 0);
  objc_storeStrong((id *)&self->_pipeDataTransfer, 0);
  objc_storeStrong((id *)&self->_voucher, 0);
  objc_storeStrong((id *)&self->_pipe, 0);
  objc_storeStrong((id *)&self->_pipeReadSource, 0);
}

@end