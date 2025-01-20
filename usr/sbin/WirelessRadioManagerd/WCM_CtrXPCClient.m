@interface WCM_CtrXPCClient
- (BOOL)getRCU2Status;
- (BOOL)sendFullWirelessLoad:(unsigned int)a3 wifiBandInfo:(unsigned __int8)a4 AWDLRealTimeModeInfo:(BOOL)a5;
- (BOOL)setChannel:(int)a3;
- (BOOL)storeRCU2Status:(BOOL)a3;
- (BOOL)threadCOEXStatus;
- (WCM_CtrXPCClient)init;
- (int64_t)getChannel;
- (int64_t)getChannelActivity;
- (void)HandleThreadStart;
- (void)HandleThreadStop;
- (void)RCU2Init;
- (void)setWirelessLoad:(unsigned int)a3;
- (void)updateAWDLRealTimeMode:(BOOL)a3;
- (void)updateWiFiBand:(unsigned __int8)a3;
@end

@implementation WCM_CtrXPCClient

- (BOOL)getRCU2Status
{
  v2 = +[WCM_PolicyManager singleton];
  v3 = [v2 activeCoexFeatures];
  unsigned __int8 v4 = [v3 containsObject:@"RCU2SupportIntegrated"];

  if (v4)
  {
    +[WCM_Logging logLevel:4 message:@" RCU2: In getRCU2Status - Reading value"];
    CFDictionaryRef v5 = (const __CFDictionary *)CFPreferencesCopyAppValue(@"previousRCU2State", @"com.apple.WirelessRadioManager.debug");
    if (v5)
    {
      CFDictionaryRef v6 = v5;
      CFTypeID TypeID = CFDictionaryGetTypeID();
      if (TypeID == CFGetTypeID(v6))
      {
        value = 0;
        +[WCM_Logging logLevel:4, @" RCU2: In getRCU2Status - for RCU2 state info %@", v6 message];
        if (CFDictionaryGetValueIfPresent(v6, @"state", (const void **)&value))
        {
          CFComparisonResult v8 = CFStringCompare(@"TRUE", (CFStringRef)value, 0);
          BOOL v9 = v8 == kCFCompareEqualTo;
          v10 = "FALSE";
          if (v8 == kCFCompareEqualTo) {
            v10 = "TRUE";
          }
          +[WCM_Logging logLevel:4, @" RCU2: In getRCU2Status - Reading value %s", v10 message];
          goto LABEL_14;
        }
        CFStringRef v13 = @" RCU2: In getRCU2Status - Reading value FAILED";
      }
      else
      {
        CFStringRef v13 = @" RCU2: In getRCU2Status - previousRCU2State not found";
      }
      +[WCM_Logging logLevel:4 message:v13];
      BOOL v9 = 0;
LABEL_14:
      CFRelease(v6);
      return v9;
    }
    CFStringRef v11 = @" RCU2: In getRCU2Status - previousRCU2State not found";
    uint64_t v12 = 4;
  }
  else
  {
    CFStringRef v11 = @"RCU2 Controller - RCU2_SUPPORT_INTEGRATED - Feature not enabled - return from getRCU2Status";
    uint64_t v12 = 2;
  }
  +[WCM_Logging logLevel:v12 message:v11];
  return 0;
}

- (void)updateWiFiBand:(unsigned __int8)a3
{
  uint64_t wifiBandLoad = self->wifiBandLoad;
  if (wifiBandLoad == a3)
  {
    +[WCM_Logging logLevel:2 message:@"RCU2 Controller No Change in WiFi Band - Not Updataing"];
  }
  else
  {
    uint64_t v4 = a3;
    +[WCM_Logging logLevel:2, @"RCU2 Controller WiFi band changed from %d to %d", wifiBandLoad, a3 message];
    self->uint64_t wifiBandLoad = v4;
    uint64_t btWirelessLoad = self->btWirelessLoad;
    BOOL AWDLRealTimeModeEnabled = self->AWDLRealTimeModeEnabled;
    [(WCM_CtrXPCClient *)self sendFullWirelessLoad:btWirelessLoad wifiBandInfo:v4 AWDLRealTimeModeInfo:AWDLRealTimeModeEnabled];
  }
}

- (BOOL)threadCOEXStatus
{
  return 1;
}

- (BOOL)setChannel:(int)a3
{
  return 0;
}

- (BOOL)storeRCU2Status:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v4 = +[WCM_PolicyManager singleton];
  CFDictionaryRef v5 = [v4 activeCoexFeatures];
  unsigned __int8 v6 = [v5 containsObject:@"RCU2SupportIntegrated"];

  if (v6)
  {
    +[WCM_Logging logLevel:4 message:@" RCU2: In storeRCU2Status.."];
    if (v3) {
      v7 = off_10027CB50;
    }
    else {
      v7 = &off_10027CB58;
    }
    if (v3) {
      CFStringRef v8 = @" RCU2: In storeRCU2Status.. - Writing value TRUE";
    }
    else {
      CFStringRef v8 = @" RCU2: In storeRCU2Status.. - Writing value FALSE";
    }
    CFDictionaryRef v9 = CFDictionaryCreate(kCFAllocatorDefault, (const void **)off_10027CB48, (const void **)v7, 1, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
    +[WCM_Logging logLevel:4 message:v8];
    CFPreferencesSetAppValue(@"previousRCU2State", v9, @"com.apple.WirelessRadioManager.debug");
    if (CFPreferencesAppSynchronize(@"com.apple.WirelessRadioManager.debug")) {
      CFStringRef v10 = @" RCU2: In storeRCU2Status.. - Actual write:- passed";
    }
    else {
      CFStringRef v10 = @" RCU2: In storeRCU2Status.. - Actual write:- failed";
    }
    +[WCM_Logging logLevel:1 message:v10];
    CFRelease(v9);
  }
  else
  {
    +[WCM_Logging logLevel:2 message:@"RCU2 Controller - RCU2_SUPPORT_INTEGRATED - Feature not enabled - return from storeRCU2Status"];
  }
  return v6;
}

- (void)setWirelessLoad:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  CFDictionaryRef v5 = +[WCM_PolicyManager singleton];
  unsigned __int8 v6 = [v5 activeCoexFeatures];
  unsigned int v7 = [v6 containsObject:@"RCU2SupportIntegrated"];

  if (v7)
  {
    CFStringRef v8 = +[WCM_PolicyManager singleton];
    [v8 sendWirelessBtLoad:v3];

    +[WCM_Logging logLevel:2, @"RCU2 Controller updating btWirelessLoad from %d to %d", self->btWirelessLoad, v3 message];
    self->uint64_t btWirelessLoad = v3;
    uint64_t wifiBandLoad = self->wifiBandLoad;
    BOOL AWDLRealTimeModeEnabled = self->AWDLRealTimeModeEnabled;
    [(WCM_CtrXPCClient *)self sendFullWirelessLoad:v3 wifiBandInfo:wifiBandLoad AWDLRealTimeModeInfo:AWDLRealTimeModeEnabled];
  }
}

- (void)updateAWDLRealTimeMode:(BOOL)a3
{
  BOOL AWDLRealTimeModeEnabled = self->AWDLRealTimeModeEnabled;
  if (a3 == AWDLRealTimeModeEnabled)
  {
    +[WCM_Logging logLevel:2 message:@"RCU2 Controller No Change in AWDLRealTime state - not updating"];
  }
  else
  {
    BOOL v4 = a3;
    +[WCM_Logging logLevel:2, @"RCU2 Controller AWDLRealTime status changed from %d to %d", AWDLRealTimeModeEnabled, a3 message];
    self->BOOL AWDLRealTimeModeEnabled = v4;
    uint64_t btWirelessLoad = self->btWirelessLoad;
    uint64_t wifiBandLoad = self->wifiBandLoad;
    [(WCM_CtrXPCClient *)self sendFullWirelessLoad:btWirelessLoad wifiBandInfo:wifiBandLoad AWDLRealTimeModeInfo:v4];
  }
}

- (BOOL)sendFullWirelessLoad:(unsigned int)a3 wifiBandInfo:(unsigned __int8)a4 AWDLRealTimeModeInfo:(BOOL)a5
{
  uint64_t v6 = 0x800000000;
  if (!a5) {
    uint64_t v6 = 0;
  }
  self->wifi_bt_cellular_load = (a3 | ((unint64_t)a4 << 32)) + v6;
  +[WCM_Logging logLevel:2, @"RCU2 Controller - sendFullWirelessLoad with BT load %d WiFiBand %d AWDLRealTime:%d FullValue: %llu", *(void *)&a3, a4, a5, (a3 | ((unint64_t)a4 << 32)) + v6 message];
  unsigned int v7 = +[NSNumber numberWithUnsignedLongLong:self->wifi_bt_cellular_load];
  CFStringRef v8 = [v7 stringValue];

  id v9 = v8;
  id v10 = [v9 UTF8String];
  CtrClientPtr = self->CtrClientPtr;
  if (CtrClientPtr)
  {
    if (self->threadRadioUp)
    {
      [CtrClientPtr setProperty:"vendor:coex:radioload" prperty_val:v10];
      if (v15) {
        CFStringRef v12 = @"RCU2 Controller - setWirelessLoad Failure - Load set to %llu ";
      }
      else {
        CFStringRef v12 = @"RCU2 Controller - setWirelessLoad Success - Load set to %llu";
      }
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 2, v12, self->wifi_bt_cellular_load);
      if (v17 < 0)
      {
        operator delete(__p);
        if (!v15)
        {
LABEL_16:
          BOOL v13 = 1;
          goto LABEL_15;
        }
      }
      else if (!v15)
      {
        goto LABEL_16;
      }
    }
    else
    {
      +[WCM_Logging logLevel:2 message:@"RCU2 Controller - Thread radio not enabled"];
    }
  }
  else
  {
    +[WCM_Logging logLevel:2 message:@"RCU2 Controller - CtrClientPtr is nil"];
  }
  BOOL v13 = 0;
LABEL_15:

  return v13;
}

- (int64_t)getChannel
{
  return 25;
}

- (int64_t)getChannelActivity
{
  return self->threadChannelActivity;
}

- (void)HandleThreadStart
{
  +[WCM_Logging logLevel:2, @"RCU2 Controller - Threadradio started - enabling sending messages - Current value = %d", self->threadRadioUp message];
  self->threadRadioUp = 1;
  [(WCM_CtrXPCClient *)self RCU2Init];
  [(WCM_CtrXPCClient *)self setWirelessLoad:LODWORD(self->wifi_bt_cellular_load)];
  [(WCM_CtrXPCClient *)self storeRCU2Status:self->threadRadioUp];
  id v3 = +[WCM_PolicyManager singleton];
  [v3 handleWiFiBTCoexChange];
}

- (void)RCU2Init
{
  self->CtrClientPtr = (CtrClient *)[objc_alloc((Class)CtrClient) init:"client.xpc.WirelessRadioManager"];

  _objc_release_x1();
}

- (void)HandleThreadStop
{
  self->threadRadioUp = 0;
  [(WCM_CtrXPCClient *)self storeRCU2Status:0];
  +[WCM_Logging logLevel:2, @"RCU2 Controller - Threadradio Stopped - Disabling sending messages- Current value = %d", self->threadRadioUp message];
  id v3 = +[WCM_PolicyManager singleton];
  [v3 handleWiFiBTCoexChange];

  CtrClientPtr = self->CtrClientPtr;
  self->CtrClientPtr = 0;
}

- (WCM_CtrXPCClient)init
{
  v5.receiver = self;
  v5.super_class = (Class)WCM_CtrXPCClient;
  v2 = [(WCM_CtrXPCClient *)&v5 init];
  +[WCM_Logging logLevel:2 message:@"RCU2 Controller - Initilization"];
  *((void *)v2 + 2) = 0;
  v2[24] = 0;
  *((void *)v2 + 4) = 0;
  *((void *)v2 + 5) = 0;
  *(void *)(v2 + 46) = 0;
  unsigned int v3 = [v2 getRCU2Status];
  v2[25] = v3;
  if (v3) {
    [v2 RCU2Init];
  }
  return (WCM_CtrXPCClient *)v2;
}

- (void).cxx_destruct
{
}

@end