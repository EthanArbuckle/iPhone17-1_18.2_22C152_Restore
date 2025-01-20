@interface WFDetailContextPrivateAddressConfig
- (BOOL)isAlwaysDisplayRandomAddress;
- (BOOL)isConnectedWithHardwareAddress;
- (BOOL)isPrivateAddressSupported;
- (NSString)hardwareMACAddress;
- (NSString)randomMACAddress;
- (WFDetailContextPrivateAddressConfig)initWithRandomMACAddress:(id)a3 hardwareMACAddress:(id)a4 privateAddressMode:(unint64_t)a5 connectedWithHardwareAddress:(BOOL)a6 privateAddressSupported:(BOOL)a7;
- (unint64_t)privateAddressMode;
- (void)setConnectedWithHardwareAddress:(BOOL)a3;
- (void)setHardwareMACAddress:(id)a3;
- (void)setPrivateAddressMode:(unint64_t)a3;
- (void)setPrivateAddressSupported:(BOOL)a3;
- (void)setRandomMACAddress:(id)a3;
@end

@implementation WFDetailContextPrivateAddressConfig

- (WFDetailContextPrivateAddressConfig)initWithRandomMACAddress:(id)a3 hardwareMACAddress:(id)a4 privateAddressMode:(unint64_t)a5 connectedWithHardwareAddress:(BOOL)a6 privateAddressSupported:(BOOL)a7
{
  BOOL v7 = a7;
  BOOL v8 = a6;
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v12 = a3;
  id v13 = a4;
  v19.receiver = self;
  v19.super_class = (Class)WFDetailContextPrivateAddressConfig;
  v14 = [(WFDetailContextPrivateAddressConfig *)&v19 init];
  v15 = v14;
  if (v14)
  {
    [(WFDetailContextPrivateAddressConfig *)v14 setRandomMACAddress:v12];
    [(WFDetailContextPrivateAddressConfig *)v15 setHardwareMACAddress:v13];
    [(WFDetailContextPrivateAddressConfig *)v15 setPrivateAddressMode:a5];
    [(WFDetailContextPrivateAddressConfig *)v15 setConnectedWithHardwareAddress:v8];
    [(WFDetailContextPrivateAddressConfig *)v15 setPrivateAddressSupported:v7];
  }
  v16 = WFLogForCategory(8uLL);
  os_log_type_t v17 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel() && v16 && os_log_type_enabled(v16, v17))
  {
    *(_DWORD *)buf = 138413314;
    id v21 = v12;
    __int16 v22 = 2112;
    id v23 = v13;
    __int16 v24 = 2048;
    unint64_t v25 = a5;
    __int16 v26 = 1024;
    BOOL v27 = v8;
    __int16 v28 = 1024;
    BOOL v29 = v7;
    _os_log_impl(&dword_226071000, v16, v17, "WFDetailContextPrivateAddressConfig: randomMACAddress='%@', hardwareMACAddress='%@', privateAddressMode=%ld, connectedWithHardwareAddress=%d, privateAddressSupported=%d", buf, 0x2Cu);
  }

  return v15;
}

- (BOOL)isConnectedWithHardwareAddress
{
  return self->_connectedWithHardwareAddress;
}

- (void)setConnectedWithHardwareAddress:(BOOL)a3
{
  self->_connectedWithHardwareAddress = a3;
}

- (BOOL)isAlwaysDisplayRandomAddress
{
  return self->_alwaysDisplayRandomAddress;
}

- (unint64_t)privateAddressMode
{
  return self->_privateAddressMode;
}

- (void)setPrivateAddressMode:(unint64_t)a3
{
  self->_privateAddressMode = a3;
}

- (NSString)randomMACAddress
{
  return self->_randomMACAddress;
}

- (void)setRandomMACAddress:(id)a3
{
}

- (NSString)hardwareMACAddress
{
  return self->_hardwareMACAddress;
}

- (void)setHardwareMACAddress:(id)a3
{
}

- (BOOL)isPrivateAddressSupported
{
  return self->_privateAddressSupported;
}

- (void)setPrivateAddressSupported:(BOOL)a3
{
  self->_privateAddressSupported = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hardwareMACAddress, 0);
  objc_storeStrong((id *)&self->_randomMACAddress, 0);
}

@end