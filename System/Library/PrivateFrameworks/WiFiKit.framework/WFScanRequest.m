@interface WFScanRequest
+ (id)scanRequestForChannels:(id)a3;
+ (id)scanRequestForSSID:(id)a3 channels:(id)a4;
- (BOOL)_channelListIncludesTwoFour:(id)a3;
- (BOOL)applyRssiThresholdFilter;
- (BOOL)channelListIncludesTwoFour;
- (BOOL)includeBSSList;
- (BOOL)lowPriorityScan;
- (NSArray)channels;
- (NSString)ssid;
- (NSUUID)UUID;
- (WFScanRequest)init;
- (WFScanRequest)initWithSSID:(id)a3 channels:(id)a4;
- (id)_channelListFromArrayOfChannels:(id)a3;
- (id)_defaultScanDictionary;
- (id)cScanParameters;
- (id)description;
- (id)scanParameters;
- (int64_t)rssiThreshold;
- (unint64_t)dwellTime;
- (void)setApplyRssiThresholdFilter:(BOOL)a3;
- (void)setChannelListIncludesTwoFour:(BOOL)a3;
- (void)setChannels:(id)a3;
- (void)setDwellTime:(unint64_t)a3;
- (void)setIncludeBSSList:(BOOL)a3;
- (void)setLowPriorityScan:(BOOL)a3;
- (void)setRssiThreshold:(int64_t)a3;
- (void)setSsid:(id)a3;
- (void)setUUID:(id)a3;
@end

@implementation WFScanRequest

+ (id)scanRequestForSSID:(id)a3 channels:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (v5)
  {
    v7 = [[WFScanRequest alloc] initWithSSID:v5 channels:v6];
  }
  else
  {
    v9 = WFLogForCategory(0);
    os_log_type_t v10 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v9 && os_log_type_enabled(v9, v10))
    {
      *(_WORD *)v11 = 0;
      _os_log_impl(&dword_226071000, v9, v10, "Missing SSID for directed scan", v11, 2u);
    }

    v7 = 0;
  }

  return v7;
}

+ (id)scanRequestForChannels:(id)a3
{
  id v3 = a3;
  v4 = [[WFScanRequest alloc] initWithSSID:0 channels:v3];

  return v4;
}

- (WFScanRequest)initWithSSID:(id)a3 channels:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v17.receiver = self;
  v17.super_class = (Class)WFScanRequest;
  v9 = [(WFScanRequest *)&v17 init];
  os_log_type_t v10 = v9;
  if (!v9)
  {
LABEL_10:

    os_log_type_t v10 = 0;
    goto LABEL_4;
  }
  if (!v8)
  {
    v14 = WFLogForCategory(0);
    os_log_type_t v15 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v14 && os_log_type_enabled(v14, v15))
    {
      v16[0] = 0;
      _os_log_impl(&dword_226071000, v14, v15, "Missing channel array for scan request", (uint8_t *)v16, 2u);
    }

    goto LABEL_10;
  }
  objc_storeStrong((id *)&v9->_ssid, a3);
  objc_storeStrong((id *)&v10->_channels, a4);
  v10->_channelListIncludesTwoFour = [(WFScanRequest *)v10 _channelListIncludesTwoFour:v8];
  v10->_rssiThreshold = -80;
  v10->_dwellTime = 0;
  uint64_t v11 = [MEMORY[0x263F08C38] UUID];
  UUID = v10->_UUID;
  v10->_UUID = (NSUUID *)v11;

  *(_WORD *)&v10->_applyRssiThresholdFilter = 1;
  v10->_lowPriorityScan = 0;
LABEL_4:

  return v10;
}

- (WFScanRequest)init
{
  id v2 = [MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF498] reason:@"-[WFScanRequest init] unavailable" userInfo:0];
  objc_exception_throw(v2);
}

- (id)scanParameters
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  v16 = [(WFScanRequest *)self _defaultScanDictionary];
  v18 = [MEMORY[0x263EFF980] array];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id obj = [(WFScanRequest *)self channels];
  uint64_t v3 = [obj countByEnumeratingWithState:&v19 objects:v25 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v20 != v5) {
          objc_enumerationMutation(obj);
        }
        id v7 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        v23[0] = @"CHANNEL";
        id v8 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v7, "channel"));
        v23[1] = @"CHANNEL_FLAGS";
        v24[0] = v8;
        v9 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v7, "flags"));
        v24[1] = v9;
        os_log_type_t v10 = [NSDictionary dictionaryWithObjects:v24 forKeys:v23 count:2];
        [v18 addObject:v10];
      }
      uint64_t v4 = [obj countByEnumeratingWithState:&v19 objects:v25 count:16];
    }
    while (v4);
  }

  [v16 setObject:v18 forKey:@"SCAN_CHANNELS"];
  uint64_t v11 = [(WFScanRequest *)self ssid];

  if (v11)
  {
    v12 = [(WFScanRequest *)self ssid];
    [v16 setObject:v12 forKey:@"SSID_STR"];
  }
  if (![(WFScanRequest *)self applyRssiThresholdFilter])
  {
    [v16 removeObjectForKey:@"SCAN_RSSI_THRESHOLD"];
    v13 = [NSNumber numberWithInteger:0];
    [v16 setObject:v13 forKey:@"SCAN_RSSI_THRESHOLD"];
  }
  if ([(WFScanRequest *)self dwellTime])
  {
    v14 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[WFScanRequest dwellTime](self, "dwellTime"));
    [v16 setObject:v14 forKey:@"SCAN_DWELL_TIME"];
  }
  if ([(WFScanRequest *)self includeBSSList]) {
    [v16 setObject:MEMORY[0x263EFFA88] forKey:@"SCAN_INC_BSS_LIST"];
  }
  if ([(WFScanRequest *)self lowPriorityScan]) {
    [v16 setObject:MEMORY[0x263EFFA88] forKey:@"SCAN_LOW_PRIORITY"];
  }

  return v16;
}

- (id)_defaultScanDictionary
{
  id v3 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  uint64_t v4 = [NSNumber numberWithInt:1];
  [v3 setObject:v4 forKey:@"SCAN_MERGE"];

  uint64_t v5 = [NSNumber numberWithInt:1];
  [v3 setObject:v5 forKey:@"MONITOR_QBSS_LOAD"];

  id v6 = [NSNumber numberWithUnsignedInt:1];
  [v3 setObject:v6 forKey:@"SCAN_TYPE"];

  id v7 = [NSNumber numberWithInt:1];
  [v3 setObject:v7 forKey:@"SCAN_NUM_SCANS"];

  id v8 = objc_msgSend(NSNumber, "numberWithInteger:", -[WFScanRequest rssiThreshold](self, "rssiThreshold"));
  [v3 setObject:v8 forKey:@"SCAN_RSSI_THRESHOLD"];

  return v3;
}

- (id)description
{
  id v3 = (void *)MEMORY[0x263F089D8];
  uint64_t v4 = (objc_class *)objc_opt_class();
  uint64_t v5 = NSStringFromClass(v4);
  id v6 = [(WFScanRequest *)self ssid];
  if (v6) {
    id v7 = @"directed";
  }
  else {
    id v7 = @"broadcast";
  }
  id v8 = [(WFScanRequest *)self UUID];
  v9 = [v8 UUIDString];
  os_log_type_t v10 = [v9 substringToIndex:5];
  uint64_t v11 = [(WFScanRequest *)self channels];
  v12 = [(WFScanRequest *)self _channelListFromArrayOfChannels:v11];
  v13 = [v3 stringWithFormat:@"<%@ : %p type='%@' uuid='%@' channels=[%@]", v5, self, v7, v10, v12];

  if (![(WFScanRequest *)self applyRssiThresholdFilter]) {
    [v13 appendString:@" rssiFilter=0"];
  }
  if ([(WFScanRequest *)self dwellTime]) {
    objc_msgSend(v13, "appendFormat:", @" dwellTime=%lu", -[WFScanRequest dwellTime](self, "dwellTime"));
  }
  if ([(WFScanRequest *)self lowPriorityScan]) {
    [v13 appendString:@" lowPriority=1"];
  }
  [v13 appendString:@">"];
  return v13;
}

- (id)_channelListFromArrayOfChannels:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v3 = a3;
  uint64_t v4 = [MEMORY[0x263F089D8] string];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = 0;
    uint64_t v9 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v5);
        }
        objc_msgSend(v4, "appendFormat:", @"%d", objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * i), "channel"));
        if (v8 + 1 + i < (unint64_t)[v5 count]) {
          [v4 appendString:@","];
        }
      }
      v8 += v7;
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }

  return v4;
}

- (id)cScanParameters
{
  id v3 = objc_alloc_init(MEMORY[0x263F386F0]);
  uint64_t v9 = 0;
  os_log_type_t v10 = &v9;
  uint64_t v11 = 0x3032000000;
  long long v12 = __Block_byref_object_copy__11;
  long long v13 = __Block_byref_object_dispose__11;
  id v14 = objc_alloc_init(MEMORY[0x263EFF980]);
  uint64_t v4 = [(WFScanRequest *)self channels];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __32__WFScanRequest_cScanParameters__block_invoke;
  v8[3] = &unk_26478FB20;
  v8[4] = &v9;
  [v4 enumerateObjectsUsingBlock:v8];

  [v3 setChannels:v10[5]];
  [v3 setMergeScanResults:1];
  [v3 setScanType:1];
  [v3 setNumberOfScans:1];
  objc_msgSend(v3, "setMinimumRSSI:", -[WFScanRequest rssiThreshold](self, "rssiThreshold"));
  id v5 = [(WFScanRequest *)self ssid];

  if (v5)
  {
    uint64_t v6 = [(WFScanRequest *)self ssid];
    [v3 setSSID:v6];
  }
  if (![(WFScanRequest *)self applyRssiThresholdFilter]) {
    [v3 setMinimumRSSI:0];
  }
  if ([(WFScanRequest *)self dwellTime]) {
    objc_msgSend(v3, "setDwellTime:", -[WFScanRequest dwellTime](self, "dwellTime"));
  }
  [v3 setANQPElementIDListForPasspointScanResults:&unk_26D9E22F0];
  [v3 setIncludeMatchingKnownNetworkProfiles:1];
  _Block_object_dispose(&v9, 8);

  return v3;
}

void __32__WFScanRequest_cScanParameters__block_invoke(uint64_t a1, void *a2)
{
  id v3 = (objc_class *)MEMORY[0x263F386D8];
  id v4 = a2;
  id v6 = objc_alloc_init(v3);
  objc_msgSend(v6, "setChannel:", objc_msgSend(v4, "channel"));
  uint64_t v5 = [v4 flags];

  [v6 setFlags:v5];
  [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) addObject:v6];
}

- (BOOL)_channelListIncludesTwoFour:(id)a3
{
  id v3 = a3;
  id v4 = v3;
  uint64_t v8 = 0;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x2020000000;
  char v11 = 0;
  if (v3)
  {
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __45__WFScanRequest__channelListIncludesTwoFour___block_invoke;
    v7[3] = &unk_26478FB20;
    v7[4] = &v8;
    [v3 enumerateObjectsUsingBlock:v7];
    BOOL v5 = *((unsigned char *)v9 + 24) != 0;
  }
  else
  {
    BOOL v5 = 0;
  }
  _Block_object_dispose(&v8, 8);

  return v5;
}

unint64_t __45__WFScanRequest__channelListIncludesTwoFour___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  unint64_t result = [a2 channel];
  if (result <= 0xC)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
    *a4 = 1;
  }
  return result;
}

- (NSString)ssid
{
  return self->_ssid;
}

- (void)setSsid:(id)a3
{
}

- (BOOL)applyRssiThresholdFilter
{
  return self->_applyRssiThresholdFilter;
}

- (void)setApplyRssiThresholdFilter:(BOOL)a3
{
  self->_applyRssiThresholdFilter = a3;
}

- (unint64_t)dwellTime
{
  return self->_dwellTime;
}

- (void)setDwellTime:(unint64_t)a3
{
  self->_dwellTime = a3;
}

- (BOOL)includeBSSList
{
  return self->_includeBSSList;
}

- (void)setIncludeBSSList:(BOOL)a3
{
  self->_includeBSSList = a3;
}

- (BOOL)lowPriorityScan
{
  return self->_lowPriorityScan;
}

- (void)setLowPriorityScan:(BOOL)a3
{
  self->_lowPriorityScan = a3;
}

- (NSArray)channels
{
  return self->_channels;
}

- (void)setChannels:(id)a3
{
}

- (int64_t)rssiThreshold
{
  return self->_rssiThreshold;
}

- (void)setRssiThreshold:(int64_t)a3
{
  self->_rssiThreshold = a3;
}

- (BOOL)channelListIncludesTwoFour
{
  return self->_channelListIncludesTwoFour;
}

- (void)setChannelListIncludesTwoFour:(BOOL)a3
{
  self->_channelListIncludesTwoFour = a3;
}

- (NSUUID)UUID
{
  return self->_UUID;
}

- (void)setUUID:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_UUID, 0);
  objc_storeStrong((id *)&self->_channels, 0);
  objc_storeStrong((id *)&self->_ssid, 0);
}

@end