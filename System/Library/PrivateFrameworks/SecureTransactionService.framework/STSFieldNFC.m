@interface STSFieldNFC
- (NSArray)tcis;
- (NSData)openLoopSchemeBitfield;
- (unint64_t)ecpVersion;
- (unsigned)nfcTechnology;
- (unsigned)systemCode;
- (unsigned)terminalMode;
- (void)setEcpVersion:(unint64_t)a3;
- (void)setNFCTechnology:(unsigned int)a3;
- (void)setOpenLoopSchemeBitfield:(id)a3;
- (void)setSystemCode:(unsigned __int16)a3;
- (void)setTCIS:(id)a3;
- (void)setTerminalMode:(unsigned int)a3;
@end

@implementation STSFieldNFC

- (unsigned)terminalMode
{
  return *((_DWORD *)&self->super._odaRequired + 1);
}

- (unsigned)nfcTechnology
{
  return self->_terminalMode;
}

- (unsigned)systemCode
{
  return self->_systemCode;
}

- (NSArray)tcis
{
  return (NSArray *)objc_getProperty(self, a2, 56, 1);
}

- (NSData)openLoopSchemeBitfield
{
  return (NSData *)objc_getProperty(self, a2, 64, 1);
}

- (unint64_t)ecpVersion
{
  return self->_ecpVersion;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_openLoopSchemeBitfield, 0);
  objc_storeStrong((id *)&self->_tcis, 0);
}

- (void)setTerminalMode:(unsigned int)a3
{
  *((_DWORD *)&self->super._odaRequired + 1) = a3;
}

- (void)setNFCTechnology:(unsigned int)a3
{
  self->_terminalMode = a3;
}

- (void)setSystemCode:(unsigned __int16)a3
{
  self->_systemCode = a3;
}

- (void)setTCIS:(id)a3
{
}

- (void)setOpenLoopSchemeBitfield:(id)a3
{
}

- (void)setEcpVersion:(unint64_t)a3
{
  self->_ecpVersion = a3;
}

@end