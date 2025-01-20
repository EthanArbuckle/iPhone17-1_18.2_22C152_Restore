@interface WRM_SCService
+ (id)WRM_SCServiceControllerSingleton;
- (BOOL)isAirPlaneModeEnabled;
- (BOOL)isCellDataActive;
- (BOOL)isDataLQMValid;
- (BOOL)isTelephonyEnabled;
- (BOOL)isWiFiConnectedToCarPlay;
- (BOOL)isWiFiEnabled;
- (BOOL)isWiFiPrimary;
- (BOOL)isWiFiUsingCarPlay;
- (WRM_SCService)init;
- (__SCPreferences)getAPMHandle;
- (__SCPreferences)getTelephonyHandle;
- (__SCPreferences)getWiFiHandle;
- (int)getCellularDataLQM;
- (void)configureAirplaneNotification;
- (void)configureTelephonyNotification;
- (void)configureWiFiNotification;
- (void)dealloc;
- (void)getAirPlaneMode;
- (void)getTelephonyMode;
- (void)getWiFiMode;
- (void)registerForCellularDataLQM;
- (void)resetCellularDataLQM;
- (void)setCellularDataLQM:(int)a3;
- (void)updateAirPlaneModeStatus:(BOOL)a3;
- (void)updateTelephonyStatus:(BOOL)a3;
@end

@implementation WRM_SCService

- (BOOL)isWiFiUsingCarPlay
{
  id v2 = objc_alloc_init((Class)CWFInterface);
  [v2 setInvalidationHandler:&stru_10020F430];
  [v2 activate];
  id v3 = [v2 currentKnownNetworkProfile];
  if (v3) {
    unsigned __int8 v4 = [v3 isCarPlay];
  }
  else {
    unsigned __int8 v4 = 0;
  }
  [v2 invalidate];

  return v4;
}

- (BOOL)isWiFiPrimary
{
  id v2 = [(NWPathEvaluator *)self->mWiFiPathEvaluator path];

  return [v2 usesInterfaceType:1];
}

- (int)getCellularDataLQM
{
  return self->mDataLQM;
}

+ (id)WRM_SCServiceControllerSingleton
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100085A74;
  block[3] = &unk_10020D980;
  block[4] = a1;
  if (qword_10027D0B8 != -1) {
    dispatch_once(&qword_10027D0B8, block);
  }
  return (id)qword_10027D0B0;
}

- (WRM_SCService)init
{
  v5.receiver = self;
  v5.super_class = (Class)WRM_SCService;
  id v2 = [(WRM_SCService *)&v5 init];
  if (v2)
  {
    v2->mQueue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.WirelessRadioManager.SCDClient", 0);
    v2->mStore = 0;
    v2->mValidDataLqm = 0;
    v2->mWiFiEnabled = 0;
    v2->mTelephonyRef = 0;
    v2->mWiFiRef = 0;
    v2->mAirplaneRef = 0;
    *(_WORD *)&v2->mAirPlaneModeEnabled = 256;
    v2->mBackHaulBroken = 0;
    id v3 = (NWParameters *)objc_alloc_init((Class)NWParameters);
    v2->mParams = v3;
    [(NWParameters *)v3 setRequiredInterfaceType:2];
    v2->mCellPathEvaluator = (NWPathEvaluator *)[objc_alloc((Class)NWPathEvaluator) initWithEndpoint:0 parameters:v2->mParams];
    v2->mWiFiPathEvaluator = (NWPathEvaluator *)[objc_alloc((Class)NWPathEvaluator) initWithEndpoint:0 parameters:0];
    v2->mWiFiConnectedToCarPlay = 0;
    [(WRM_SCService *)v2 configureAirplaneNotification];
    [(WRM_SCService *)v2 configureTelephonyNotification];
    [(WRM_SCService *)v2 configureWiFiNotification];
  }
  return v2;
}

- (void)dealloc
{
  +[WCM_Logging logLevel:22 message:@"WRM_SCService dealloc"];
  mStore = self->mStore;
  if (mStore) {
    CFRelease(mStore);
  }
  self->mStore = 0;
  self->mValidDataLqm = 0;
  mAirplaneRef = self->mAirplaneRef;
  if (mAirplaneRef)
  {
    SCPreferencesSetDispatchQueue(mAirplaneRef, 0);
    CFRelease(self->mAirplaneRef);
  }
  self->mAirplaneRef = 0;
  mTelephonyRef = self->mTelephonyRef;
  if (mTelephonyRef)
  {
    SCPreferencesSetDispatchQueue(mTelephonyRef, 0);
    CFRelease(self->mTelephonyRef);
  }
  mifnameCf = self->mifnameCf;
  if (mifnameCf) {
    CFRelease(mifnameCf);
  }
  mParams = self->mParams;
  if (mParams) {
    CFRelease(mParams);
  }
  mCellPathEvaluator = self->mCellPathEvaluator;
  if (mCellPathEvaluator) {
    CFRelease(mCellPathEvaluator);
  }
  mWiFiPathEvaluator = self->mWiFiPathEvaluator;
  if (mWiFiPathEvaluator) {
    CFRelease(mWiFiPathEvaluator);
  }
  mQueue = self->mQueue;
  if (mQueue)
  {
    dispatch_release(mQueue);
    self->mQueue = 0;
  }
  self->mTelephonyRef = 0;
  v11.receiver = self;
  v11.super_class = (Class)WRM_SCService;
  [(WRM_SCService *)&v11 dealloc];
}

- (void)registerForCellularDataLQM
{
  unsigned int valuePtr = [(WRM_SCService *)self getCellularDataLQM];
  id v3 = SCDynamicStoreCreate(0, @"com.apple.WirelessRadioManagerd", (SCDynamicStoreCallBack)sub_100085EB4, 0);
  self->mStore = v3;
  if (v3)
  {
    unsigned __int8 v4 = (const void *)kSCEntNetLinkQuality;
    CFStringRef NetworkInterfaceEntity = SCDynamicStoreKeyCreateNetworkInterfaceEntity(kCFAllocatorDefault, kSCDynamicStoreDomainState, @"pdp_ip0", kSCEntNetLinkQuality);
    CFDictionaryRef v6 = (const __CFDictionary *)SCDynamicStoreCopyValue(self->mStore, NetworkInterfaceEntity);
    CFDictionaryRef v7 = v6;
    if (v6)
    {
      CFTypeID v8 = CFGetTypeID(v6);
      if (v8 == CFDictionaryGetTypeID())
      {
        CFNumberRef Value = (const __CFNumber *)CFDictionaryGetValue(v7, v4);
        if (Value)
        {
          CFNumberRef v10 = Value;
          CFTypeID v11 = CFGetTypeID(Value);
          if (v11 == CFNumberGetTypeID()) {
            CFNumberGetValue(v10, kCFNumberIntType, &valuePtr);
          }
        }
      }
    }
    Mutable = CFArrayCreateMutable(kCFAllocatorDefault, 1, &kCFTypeArrayCallBacks);
    if (Mutable)
    {
      CFArrayRef v13 = Mutable;
      CFArrayAppendValue(Mutable, NetworkInterfaceEntity);
      if (!SCDynamicStoreSetNotificationKeys(self->mStore, v13, 0)) {
        +[WCM_Logging logLevel:22 message:@"SCDynamicStoreSetNotificationKeys failed"];
      }
      if (!SCDynamicStoreSetDispatchQueue(self->mStore, (dispatch_queue_t)[+[WRM_HandoverManager WRM_HandoverManagerSingleton](WRM_HandoverManager, "WRM_HandoverManagerSingleton") getQueue]))+[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 22, @"SCDynamicStoreSetDispatchQueue failed"); {
      +[WCM_Logging logLevel:22 message:@"registerForCellularDataLQM passed"];
      }
      CFRelease(v13);
      if (NetworkInterfaceEntity) {
        CFRelease(NetworkInterfaceEntity);
      }
      if (v7) {
        CFRelease(v7);
      }
      [(WRM_SCService *)self setCellularDataLQM:valuePtr];
      +[WCM_Logging logLevel:22, @"SCDynamicStoreCreate succesful, data LQM: %d", valuePtr message];
    }
    else
    {
      +[WCM_Logging logLevel:22, @"CFArrayCreateMutable failed", v14 message];
    }
  }
  else
  {
    +[WCM_Logging logLevel:22 message:@"SCDynamicStoreCreate failed"];
  }
}

- (void)setCellularDataLQM:(int)a3
{
  self->mDataLQM = a3;
  self->mValidDataLqm = 1;
}

- (void)resetCellularDataLQM
{
  self->mValidDataLqm = 0;
}

- (BOOL)isDataLQMValid
{
  return self->mValidDataLqm;
}

- (__SCPreferences)getAPMHandle
{
  return self->mAirplaneRef;
}

- (__SCPreferences)getTelephonyHandle
{
  return self->mTelephonyRef;
}

- (__SCPreferences)getWiFiHandle
{
  return self->mWiFiRef;
}

- (BOOL)isAirPlaneModeEnabled
{
  return self->mAirPlaneModeEnabled;
}

- (BOOL)isWiFiConnectedToCarPlay
{
  return self->mWiFiConnectedToCarPlay;
}

- (BOOL)isWiFiEnabled
{
  return self->mWiFiEnabled;
}

- (void)updateAirPlaneModeStatus:(BOOL)a3
{
  self->mAirPlaneModeEnabled = a3;
}

- (BOOL)isTelephonyEnabled
{
  return self->mTelephonyEnabled;
}

- (void)updateTelephonyStatus:(BOOL)a3
{
  self->mTelephonyEnabled = a3;
}

- (void)getAirPlaneMode
{
  objc_sync_enter(self);
  CFPropertyListRef Value = SCPreferencesGetValue([(WRM_SCService *)self getAPMHandle], @"AirplaneMode");
  +[WCM_Logging logLevel:22 message:@"Inside getAirPlaneMode"];
  if (Value)
  {
    CFTypeID v4 = CFGetTypeID(Value);
    if (v4 == CFBooleanGetTypeID()) {
      self->mAirPlaneModeEnabled = CFBooleanGetValue((CFBooleanRef)Value) != 0;
    }
    else {
      +[WCM_Logging logLevel:16 message:@"AirplaneMode is not BOOLean"];
    }
    objc_sync_exit(self);
    +[WCM_Logging logLevel:18, @"getAirPlaneMode: %d", self->mAirPlaneModeEnabled message];
  }
  else
  {
    +[WCM_Logging logLevel:16 message:@"getAirPlaneMode: plistRef is NULL"];
    objc_sync_exit(self);
  }
}

- (void)getWiFiMode
{
  objc_sync_enter(self);
  self->mWiFiEnabled = [[SCPreferencesGetValue(self->mWiFiRef, @"AllowEnable") intValue] != 0];

  objc_sync_exit(self);
}

- (void)getTelephonyMode
{
  objc_sync_enter(self);
  CFPropertyListRef Value = SCPreferencesGetValue([(WRM_SCService *)self getTelephonyHandle], @"TelephonyState");
  +[WCM_Logging logLevel:22 message:@"Inside getTelephonyMode"];
  if (!Value)
  {
    self->mTelephonyEnabled = 1;
    +[WCM_Logging logLevel:16 message:@"getTelephonyMode: plistRef is NULL"];
    goto LABEL_11;
  }
  +[WCM_Logging logLevel:22, @"getTelephonyMode: current telephony state %d", self->mTelephonyEnabled message];
  CFTypeID v4 = CFGetTypeID(Value);
  if (v4 != CFDictionaryGetTypeID())
  {
    CFStringRef v7 = @"Error: TelephonyState plist is not dictionary";
LABEL_10:
    +[WCM_Logging logLevel:22 message:v7];
    +[WCM_Logging logLevel:16, @"getTelephonyMode: Updated state: %d", self->mTelephonyEnabled message];
    goto LABEL_11;
  }
  +[WCM_Logging logLevel:22 message:@"getTelephonyMode processing: TelephonyState key"];
  CFBooleanRef v5 = (const __CFBoolean *)CFDictionaryGetValue((CFDictionaryRef)Value, @"TelephonyEnabled");
  if (v5)
  {
    int v6 = CFBooleanGetValue(v5);
    if (v6) {
      CFStringRef v7 = @"getTelephonyMode: mTelephonyEnabled: TRUE";
    }
    else {
      CFStringRef v7 = @"getTelephonyMode: mTelephonyEnabled: FALSE";
    }
    self->mTelephonyEnabled = v6 != 0;
    goto LABEL_10;
  }
  +[WCM_Logging logLevel:16 message:@"getTelephonyMode: telephonyState is NULL"];
LABEL_11:

  objc_sync_exit(self);
}

- (void)configureAirplaneNotification
{
  *(_OWORD *)&context.version = unk_10020F3B8;
  memset(&context.retain, 0, 24);
  +[WCM_Logging logLevel:22 message:@"Inside configureAirplaneNotification"];
  id v3 = SCPreferencesCreateWithAuthorization(0, @"com.apple.WirelessRadioManager:registerForAirplaneModeNotifications", @"com.apple.radios.plist", 0);
  self->mAirplaneRef = v3;
  if (v3)
  {
    SCPreferencesSetCallback(v3, (SCPreferencesCallBack)sub_100086460, &context);
    SCPreferencesSetDispatchQueue(self->mAirplaneRef, (dispatch_queue_t)self->mQueue);
  }
  else
  {
    int v4 = SCError();
    +[WCM_Logging logLevel:22, @"Failed to create airplane mode preference handle: %d", SCErrorString(v4) message];
  }
  +[WCM_Logging logLevel:22 message:@"configureAirplaneNotification, calling getAirPlaneMode modification"];
  [(WRM_SCService *)self getAirPlaneMode];
}

- (void)configureTelephonyNotification
{
  *(_OWORD *)&context.version = unk_10020F3E0;
  memset(&context.retain, 0, 24);
  +[WCM_Logging logLevel:22 message:@"Inside configureTelephonyNotification"];
  id v3 = SCPreferencesCreateWithAuthorization(0, @"com.apple.WirelessRadioManager:registerForAirplaneModeNotifications", @"com.apple.radios.plist", 0);
  self->mTelephonyRef = v3;
  if (v3)
  {
    SCPreferencesSetCallback(v3, (SCPreferencesCallBack)sub_100086460, &context);
    SCPreferencesSetDispatchQueue(self->mTelephonyRef, (dispatch_queue_t)self->mQueue);
  }
  else
  {
    int v4 = SCError();
    +[WCM_Logging logLevel:22, @"Failed to create telephony preference handle: %d", SCErrorString(v4) message];
  }
  +[WCM_Logging logLevel:22 message:@"configureTelephonyNotification, calling getTelephonyMode notification"];
  [(WRM_SCService *)self getTelephonyMode];
}

- (void)configureWiFiNotification
{
  *(_OWORD *)&context.version = unk_10020F408;
  memset(&context.retain, 0, 24);
  +[WCM_Logging logLevel:22 message:@"Inside configureWiFiNotification"];
  id v3 = SCPreferencesCreateWithAuthorization(0, @"com.apple.WirelessRadioManager:registerForWiFiNotifications", @"com.apple.wifi.plist", 0);
  self->mWiFiRef = v3;
  if (v3)
  {
    SCPreferencesSetCallback(v3, (SCPreferencesCallBack)sub_100086460, &context);
    SCPreferencesSetDispatchQueue(self->mWiFiRef, (dispatch_queue_t)self->mQueue);
  }
  else
  {
    int v4 = SCError();
    +[WCM_Logging logLevel:22, @"Failed to create WiFi preference handle: %d", SCErrorString(v4) message];
  }
  [(WRM_SCService *)self getWiFiMode];
  dispatch_time_t v5 = dispatch_time(0, 3000000000);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000868DC;
  block[3] = &unk_10020D980;
  block[4] = self;
  dispatch_after(v5, (dispatch_queue_t)[+[WRM_HandoverManager WRM_HandoverManagerSingleton](WRM_HandoverManager, "WRM_HandoverManagerSingleton") getQueue], block);
  +[WCM_Logging logLevel:22 message:@"configureWiFiNotification, calling getWiFiMode notification"];
}

- (BOOL)isCellDataActive
{
  return [[-[NWPathEvaluator path](self->mCellPathEvaluator, "path") status] == (id)1;
}

@end