@interface SiriCoreWiFiManagerClient
- (BOOL)hasAssociatedNetworkWithRSSI:(int64_t *)a3 andSNR:(int64_t *)a4 andCCA:(int64_t *)a5 andPhyMode:(id *)a6 andChannelInfo:(id *)a7 isCaptive:(BOOL *)a8;
- (BOOL)hasAssociatedNetworkWithRSSI:(int64_t *)a3 andSNR:(int64_t *)a4 andPhyMode:(id *)a5 andChannelInfo:(id *)a6 isCaptive:(BOOL *)a7;
- (BOOL)isWifiEnabled;
- (SiriCoreWiFiManagerClient)init;
- (__WiFiManagerClient)_primitiveWiFiManagerClient;
- (void)_setWiFiManagerClientType:(int)a3;
- (void)acquireWiFiAssertion:(int64_t)a3;
- (void)dealloc;
- (void)releaseWiFiAssertion;
@end

@implementation SiriCoreWiFiManagerClient

- (void)acquireWiFiAssertion:(int64_t)a3
{
}

- (void)releaseWiFiAssertion
{
}

- (BOOL)isWifiEnabled
{
  return WiFiManagerClientGetPower() != 0;
}

- (BOOL)hasAssociatedNetworkWithRSSI:(int64_t *)a3 andSNR:(int64_t *)a4 andCCA:(int64_t *)a5 andPhyMode:(id *)a6 andChannelInfo:(id *)a7 isCaptive:(BOOL *)a8
{
  uint64_t v48 = *MEMORY[0x263EF8340];
  v15 = (os_log_t *)MEMORY[0x263F28350];
  v16 = *MEMORY[0x263F28350];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28350], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v41 = "-[SiriCoreWiFiManagerClient hasAssociatedNetworkWithRSSI:andSNR:andCCA:andPhyMode:andChannelInfo:isCaptive:]";
    _os_log_impl(&dword_21CBF7000, v16, OS_LOG_TYPE_DEFAULT, "%s ", buf, 0xCu);
  }
  if (a3) {
    *a3 = self->_rssi;
  }
  if (a4) {
    *a4 = self->_snr;
  }
  if (a5) {
    *a5 = self->_cca;
  }
  if (a6) {
    *a6 = 0;
  }
  if (a7) {
    *a7 = 0;
  }
  if (a8) {
    *a8 = 0;
  }
  [(SiriCoreWiFiManagerClient *)self _primitiveWiFiManagerClient];
  v17 = (void *)WiFiManagerClientCopyDevices();
  if (![v17 count]
    || ([v17 firstObject], (uint64_t v18 = WiFiDeviceClientCopyCurrentNetwork()) == 0))
  {
    BOOL v27 = 0;
    goto LABEL_57;
  }
  v19 = (const void *)v18;
  int64_t IntProperty = WiFiNetworkGetIntProperty();
  self->_int64_t rssi = IntProperty;
  if (a3) {
    *a3 = IntProperty;
  }
  int64_t v21 = WiFiNetworkGetIntProperty();
  self->_int64_t snr = v21;
  if (a4) {
    *a4 = v21;
  }
  int64_t v22 = WiFiNetworkGetIntProperty();
  self->_int64_t cca = v22;
  if (a5) {
    *a5 = v22;
  }
  if (a7)
  {
    id v23 = (id) [objc_alloc(MEMORY[0x263F089D8]) initWithString:@"Channel "];
    *a7 = v23;
    uint64_t Channel = WiFiNetworkGetChannel();
    if (Channel)
    {
      objc_msgSend(v23, "appendFormat:", @"%@ ("), Channel;
      uint64_t OperatingBand = WiFiNetworkGetOperatingBand();
      if (OperatingBand == 2)
      {
        v26 = @"5GHz";
      }
      else if (OperatingBand == 1)
      {
        v26 = @"2.4GHz";
      }
      else if (OperatingBand)
      {
        uint64_t v39 = OperatingBand;
        v26 = @"[Unknown enum=%u]GHz";
      }
      else
      {
        v26 = @"?GHz";
      }
      objc_msgSend(v23, "appendFormat:", v26, v39);
      [v23 appendFormat:@", %uMHz", WiFiNetworkGetChannelWidthInMHz()];
      [v23 appendString:@""]);
    }
    else
    {
      [v23 appendFormat:@"unknown"];
    }
    v28 = *v15;
    if (os_log_type_enabled(*v15, OS_LOG_TYPE_DEFAULT))
    {
      id v29 = *a7;
      *(_DWORD *)buf = 136315394;
      v41 = "-[SiriCoreWiFiManagerClient hasAssociatedNetworkWithRSSI:andSNR:andCCA:andPhyMode:andChannelInfo:isCaptive:]";
      __int16 v42 = 2112;
      *(void *)v43 = v29;
      _os_log_impl(&dword_21CBF7000, v28, OS_LOG_TYPE_DEFAULT, "%s Channel Info: %@", buf, 0x16u);
    }
  }
  if (a6)
  {
    uint64_t PhyMode = WiFiNetworkGetPhyMode();
    if ((PhyMode & 0x7E) != 0)
    {
      v31 = @"802.11b";
      if ((PhyMode & 4) == 0) {
        v31 = @"802.11a";
      }
      if ((PhyMode & 0x48) != 0) {
        v31 = @"802.11g";
      }
      if ((PhyMode & 0x10) != 0) {
        v31 = @"802.11n";
      }
      *a6 = v31;
    }
    if ((PhyMode & 0x80) != 0)
    {
      v32 = @"802.11ac";
    }
    else
    {
      v32 = (__CFString *)*a6;
      if (*a6) {
        goto LABEL_52;
      }
      v32 = (__CFString *)(id)objc_msgSend([NSString alloc], "initWithFormat:", @"Unknown=0x%04x", PhyMode);
    }
    *a6 = v32;
LABEL_52:
    v33 = *v15;
    if (os_log_type_enabled(*v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v41 = "-[SiriCoreWiFiManagerClient hasAssociatedNetworkWithRSSI:andSNR:andCCA:andPhyMode:andChannelInfo:isCaptive:]";
      __int16 v42 = 2112;
      *(void *)v43 = v32;
      _os_log_impl(&dword_21CBF7000, v33, OS_LOG_TYPE_DEFAULT, "%s PhyMode: %@", buf, 0x16u);
    }
  }
  if (a8) {
    *a8 = WiFiNetworkIsCaptive() != 0;
  }
  CFRelease(v19);
  BOOL v27 = 1;
LABEL_57:
  v34 = *v15;
  if (os_log_type_enabled(*v15, OS_LOG_TYPE_DEFAULT))
  {
    int64_t rssi = self->_rssi;
    int64_t snr = self->_snr;
    int64_t cca = self->_cca;
    *(_DWORD *)buf = 136316162;
    v41 = "-[SiriCoreWiFiManagerClient hasAssociatedNetworkWithRSSI:andSNR:andCCA:andPhyMode:andChannelInfo:isCaptive:]";
    __int16 v42 = 1024;
    *(_DWORD *)v43 = v27;
    *(_WORD *)&v43[4] = 2048;
    *(void *)&v43[6] = rssi;
    __int16 v44 = 2048;
    int64_t v45 = snr;
    __int16 v46 = 2048;
    int64_t v47 = cca;
    _os_log_impl(&dword_21CBF7000, v34, OS_LOG_TYPE_DEFAULT, "%s Associated: %d RSSI is %ld SNR is %ld CCA is %ld", buf, 0x30u);
  }

  return v27;
}

- (BOOL)hasAssociatedNetworkWithRSSI:(int64_t *)a3 andSNR:(int64_t *)a4 andPhyMode:(id *)a5 andChannelInfo:(id *)a6 isCaptive:(BOOL *)a7
{
  return [(SiriCoreWiFiManagerClient *)self hasAssociatedNetworkWithRSSI:a3 andSNR:a4 andCCA:0 andPhyMode:a5 andChannelInfo:a6 isCaptive:a7];
}

- (void)_setWiFiManagerClientType:(int)a3
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  [(SiriCoreWiFiManagerClient *)self _primitiveWiFiManagerClient];
  if (self->_type != a3)
  {
    v5 = *MEMORY[0x263F28350];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28350], OS_LOG_TYPE_DEFAULT))
    {
      int v6 = 136315394;
      v7 = "-[SiriCoreWiFiManagerClient _setWiFiManagerClientType:]";
      __int16 v8 = 1024;
      int v9 = a3;
      _os_log_impl(&dword_21CBF7000, v5, OS_LOG_TYPE_DEFAULT, "%s %d", (uint8_t *)&v6, 0x12u);
    }
    self->_type = a3;
    [(SiriCoreWiFiManagerClient *)self _primitiveWiFiManagerClient];
    WiFiManagerClientSetType();
  }
}

- (__WiFiManagerClient)_primitiveWiFiManagerClient
{
  result = self->_primitiveWiFiManagerClient;
  if (!result)
  {
    result = (__WiFiManagerClient *)WiFiManagerClientCreate();
    self->_primitiveWiFiManagerClient = result;
  }
  return result;
}

- (void)dealloc
{
  primitiveWiFiManagerClient = self->_primitiveWiFiManagerClient;
  if (primitiveWiFiManagerClient) {
    CFRelease(primitiveWiFiManagerClient);
  }
  v4.receiver = self;
  v4.super_class = (Class)SiriCoreWiFiManagerClient;
  [(SiriCoreWiFiManagerClient *)&v4 dealloc];
}

- (SiriCoreWiFiManagerClient)init
{
  v3.receiver = self;
  v3.super_class = (Class)SiriCoreWiFiManagerClient;
  result = [(SiriCoreWiFiManagerClient *)&v3 init];
  if (result) {
    result->_type = 0;
  }
  return result;
}

@end