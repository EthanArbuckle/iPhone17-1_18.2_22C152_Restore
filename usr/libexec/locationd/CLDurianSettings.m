@interface CLDurianSettings
+ (BOOL)allowBeaconsChangedPopup;
+ (BOOL)crashAlertEnabled;
+ (BOOL)driftModelConnectionEnabled;
+ (BOOL)forceEnableLeash;
+ (BOOL)forceEnablePosh;
+ (BOOL)forceMaintenanceConnectionsOverride;
+ (BOOL)forceNonAppleConnections;
+ (BOOL)forcePoshAirPods;
+ (BOOL)lastKnownLocationEnabled;
+ (BOOL)maintenanceOnWildObservationEnabled;
+ (BOOL)reconciledConnectionEnabled;
+ (BOOL)reconnectAfterLeashFailure;
+ (BOOL)runningFindMyCertificationAssistant;
+ (BOOL)uarpPacketCaptureEnabled;
+ (NSDictionary)settingsDictionary;
+ (NSNumber)alignmentIntervalOverride;
+ (NSNumber)nearOwnerTimeoutOverride;
+ (NSString)testMode;
+ (float)lastFirmwareVersionForAllTagsSubmission;
+ (int)beaconsChangedPopupBackoff;
+ (int)firmwareVersionForAllTagsMetricsBackOff;
+ (int)hawkeyeTestMode;
+ (int)maintenanceIntervalOverride;
+ (int64_t)uarpAssetLocationType;
+ (void)setLastFirmwareVersionForAllTagsSubmission:(float)a3;
@end

@implementation CLDurianSettings

+ (NSDictionary)settingsDictionary
{
  v10[0] = @"DurianCrashAlertEnabled";
  v11[0] = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [a1 crashAlertEnabled]);
  v10[1] = @"DurianLKLEnabled";
  v11[1] = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [a1 lastKnownLocationEnabled]);
  v10[2] = @"DurianForceLeash";
  v11[2] = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [a1 forceEnableLeash]);
  v10[3] = @"DurianConnectionMaintenanceInterval";
  v11[3] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [a1 maintenanceIntervalOverride]);
  v10[4] = @"DurianAlignmentInterval";
  CFStringRef v3 = (const __CFString *)[a1 alignmentIntervalOverride];
  if (v3) {
    CFStringRef v4 = v3;
  }
  else {
    CFStringRef v4 = @"none";
  }
  v11[4] = v4;
  v10[5] = @"DurianNearOwnerTimeout";
  CFStringRef v5 = (const __CFString *)[a1 nearOwnerTimeoutOverride];
  if (v5) {
    CFStringRef v6 = v5;
  }
  else {
    CFStringRef v6 = @"none";
  }
  v11[5] = v6;
  v10[6] = @"DurianDisableProactiveMaintenance";
  v11[6] = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [a1 maintenanceOnWildObservationEnabled]);
  v10[7] = @"DurianForceMaintenanceConnections";
  v11[7] = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [a1 forceMaintenanceConnectionsOverride]);
  v10[8] = @"DurianTestMode";
  CFStringRef v7 = (const __CFString *)[a1 testMode];
  if (v7) {
    CFStringRef v8 = v7;
  }
  else {
    CFStringRef v8 = @"none";
  }
  v11[8] = v8;
  v10[9] = @"HawkeyeTestMode";
  v11[9] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [a1 hawkeyeTestMode]);
  v10[10] = @"DurianForcePosh";
  v11[10] = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [a1 forceEnablePosh]);
  v10[11] = @"DurianForceNonAppleConnections";
  v11[11] = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [a1 forceNonAppleConnections]);
  v10[12] = @"DurianForcePoshAirPods";
  v11[12] = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [a1 forcePoshAirPods]);
  v10[13] = @"DurianBeaconsChangedPopup";
  v11[13] = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [a1 allowBeaconsChangedPopup]);
  v10[14] = @"DurianBeaconsChangedPopupBackoff";
  v11[14] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [a1 beaconsChangedPopupBackoff]);
  return +[NSDictionary dictionaryWithObjects:v11 forKeys:v10 count:15];
}

+ (int)beaconsChangedPopupBackoff
{
  sub_1000C7F88(&v5);
  int v7 = 0;
  int v2 = sub_10006EF84(v5, "DurianBeaconsChangedPopupBackoff", &v7);
  int v3 = v7;
  if (v6) {
    sub_1000DB0A0(v6);
  }
  if (v2) {
    return v3;
  }
  else {
    return 900;
  }
}

+ (BOOL)allowBeaconsChangedPopup
{
  sub_1000C7F88(&v5);
  BOOL v7 = 0;
  char v2 = sub_1000D2988(v5, "DurianBeaconsChangedPopup", &v7);
  BOOL v3 = v7;
  if (v6) {
    sub_1000DB0A0(v6);
  }
  if (v3) {
    return v2;
  }
  else {
    return 0;
  }
}

+ (BOOL)forceEnablePosh
{
  sub_1000C7F88(&v5);
  BOOL v7 = 0;
  char v2 = sub_1000D2988(v5, "DurianForcePosh", &v7);
  BOOL v3 = v7;
  if (v6) {
    sub_1000DB0A0(v6);
  }
  if (v3) {
    return v2;
  }
  else {
    return 0;
  }
}

+ (BOOL)forcePoshAirPods
{
  sub_1000C7F88(&v5);
  BOOL v7 = 0;
  char v2 = sub_1000D2988(v5, "DurianForcePoshAirPods", &v7);
  BOOL v3 = v7;
  if (v6) {
    sub_1000DB0A0(v6);
  }
  if (v3) {
    return v2;
  }
  else {
    return 0;
  }
}

+ (BOOL)forceNonAppleConnections
{
  sub_1000C7F88(&v5);
  BOOL v7 = 0;
  char v2 = sub_1000D2988(v5, "DurianForceNonAppleConnections", &v7);
  BOOL v3 = v7;
  if (v6) {
    sub_1000DB0A0(v6);
  }
  if (v3) {
    return v2;
  }
  else {
    return 0;
  }
}

+ (BOOL)crashAlertEnabled
{
  sub_1000C7F88(&v5);
  BOOL v7 = 0;
  char v2 = sub_1000D2988(v5, "DurianCrashAlertEnabled", &v7);
  BOOL v3 = v7;
  if (v6) {
    sub_1000DB0A0(v6);
  }
  if (v3) {
    return v2;
  }
  else {
    return 0;
  }
}

+ (BOOL)lastKnownLocationEnabled
{
  sub_1000C7F88(&v5);
  BOOL v7 = 0;
  char v2 = sub_1000D2988(v5, "DurianLKLEnabled", &v7);
  BOOL v3 = v7;
  if (v6) {
    sub_1000DB0A0(v6);
  }
  if (v3) {
    return 1;
  }
  else {
    return v2 ^ 1;
  }
}

+ (BOOL)reconnectAfterLeashFailure
{
  sub_1000C7F88(&v5);
  BOOL v7 = 0;
  char v2 = sub_1000D2988(v5, "DurianLeashReconnect", &v7);
  BOOL v3 = v7;
  if (v6) {
    sub_1000DB0A0(v6);
  }
  if (v3) {
    return v2;
  }
  else {
    return 0;
  }
}

+ (BOOL)driftModelConnectionEnabled
{
  sub_1000C7F88(&v5);
  BOOL v7 = 0;
  char v2 = sub_1000D2988(v5, "DurianDriftModelConnectionEnabled", &v7);
  BOOL v3 = v7;
  if (v6) {
    sub_1000DB0A0(v6);
  }
  if (v3) {
    return 1;
  }
  else {
    return v2 ^ 1;
  }
}

+ (BOOL)reconciledConnectionEnabled
{
  sub_1000C7F88(&v5);
  BOOL v7 = 0;
  char v2 = sub_1000D2988(v5, "DurianReconciledConnectionEnabled", &v7);
  BOOL v3 = v7;
  if (v6) {
    sub_1000DB0A0(v6);
  }
  if (v3) {
    return 1;
  }
  else {
    return v2 ^ 1;
  }
}

+ (BOOL)forceEnableLeash
{
  sub_1000C7F88(&v5);
  BOOL v7 = 0;
  char v2 = sub_1000D2988(v5, "DurianForceLeash", &v7);
  BOOL v3 = v7;
  if (v6) {
    sub_1000DB0A0(v6);
  }
  if (v3) {
    return v2;
  }
  else {
    return 0;
  }
}

+ (int)maintenanceIntervalOverride
{
  int v5 = 0;
  sub_1000C7F88(&v3);
  sub_10006EF84(v3, "DurianConnectionMaintenanceInterval", &v5);
  if (v4) {
    sub_1000DB0A0(v4);
  }
  return v5;
}

+ (NSNumber)alignmentIntervalOverride
{
  unsigned int v6 = 0;
  sub_1000C7F88(&v4);
  int v2 = sub_1004D0870(v4, "DurianAlignmentInterval", &v6);
  if (v5) {
    sub_1000DB0A0(v5);
  }
  if (v2) {
    return +[NSNumber numberWithUnsignedInt:v6];
  }
  else {
    return 0;
  }
}

+ (NSNumber)nearOwnerTimeoutOverride
{
  unsigned int v6 = 0;
  sub_1000C7F88(&v4);
  int v2 = sub_10006EF84(v4, "DurianNearOwnerTimeout", &v6);
  if (v5) {
    sub_1000DB0A0(v5);
  }
  if (v2) {
    return +[NSNumber numberWithInt:v6];
  }
  else {
    return 0;
  }
}

+ (BOOL)maintenanceOnWildObservationEnabled
{
  sub_1000C7F88(&v5);
  BOOL v7 = 0;
  char v2 = sub_1000D2988(v5, "DurianDisableProactiveMaintenance", &v7);
  BOOL v3 = v7;
  if (v6) {
    sub_1000DB0A0(v6);
  }
  if (v3) {
    return v2 ^ 1;
  }
  else {
    return 1;
  }
}

+ (BOOL)forceMaintenanceConnectionsOverride
{
  sub_1000C7F88(&v5);
  BOOL v7 = 0;
  char v2 = sub_1000D2988(v5, "DurianForceMaintenanceConnections", &v7);
  BOOL v3 = v7;
  if (v6) {
    sub_1000DB0A0(v6);
  }
  if (v3) {
    return v2;
  }
  else {
    return 0;
  }
}

+ (int)hawkeyeTestMode
{
  int v6 = 0;
  unsigned int v2 = +[CLDurianPlatform isInternalInstall];
  int result = 0;
  if (v2)
  {
    sub_1000C7F88(&v4);
    sub_10006EF84(v4, "HawkeyeTestMode", &v6);
    if (v5) {
      sub_1000DB0A0(v5);
    }
    return v6;
  }
  return result;
}

+ (NSString)testMode
{
  memset(&__p, 0, sizeof(__p));
  if (!+[CLDurianPlatform isInternalInstall]) {
    return 0;
  }
  sub_1000C7F88(&v5);
  sub_1004D1284(v5, "DurianTestMode", &__p);
  if (v6) {
    sub_1000DB0A0(v6);
  }
  if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    p_p = &__p;
  }
  else {
    p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
  }
  BOOL v3 = +[NSString stringWithUTF8String:p_p];
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__p.__r_.__value_.__l.__data_);
  }
  return v3;
}

+ (int64_t)uarpAssetLocationType
{
  int v5 = 1;
  sub_1000C7F88(&v3);
  sub_10006EF84(v3, "HawkeyeUARPAssetLocationType", &v5);
  if (v4) {
    sub_1000DB0A0(v4);
  }
  return v5;
}

+ (BOOL)uarpPacketCaptureEnabled
{
  sub_1000C7F88(&v5);
  BOOL v7 = 0;
  char v2 = sub_1000D2988(v5, "HawkeyeEnableUARPPacketCapture", &v7);
  BOOL v3 = v7;
  if (v6) {
    sub_1000DB0A0(v6);
  }
  if (v3) {
    return v2;
  }
  else {
    return 0;
  }
}

+ (BOOL)runningFindMyCertificationAssistant
{
  sub_1000C7F88(&v5);
  BOOL v7 = 0;
  char v2 = sub_1000D2988(v5, "HawkeyeRunningFindMyCertificationAssistant", &v7);
  BOOL v3 = v7;
  if (v6) {
    sub_1000DB0A0(v6);
  }
  if (v3) {
    return v2;
  }
  else {
    return 0;
  }
}

+ (int)firmwareVersionForAllTagsMetricsBackOff
{
  sub_1000C7F88(&v5);
  int v7 = 0;
  int v2 = sub_10006EF84(v5, "firmwareVersionForAllTagsMetricsBackOff", &v7);
  int v3 = v7;
  if (v6) {
    sub_1000DB0A0(v6);
  }
  if (v2) {
    return v3;
  }
  else {
    return 86400;
  }
}

+ (float)lastFirmwareVersionForAllTagsSubmission
{
  sub_1000C7F88(&v5);
  int v7 = 0;
  int v2 = sub_10006EF84(v5, "lastFirmwareVersionForAllTagsSubmission", &v7);
  int v3 = v7;
  if (v6) {
    sub_1000DB0A0(v6);
  }
  float result = (float)v3;
  if (!v2) {
    return 0.0;
  }
  return result;
}

+ (void)setLastFirmwareVersionForAllTagsSubmission:(float)a3
{
  sub_1000C7F88(&v5);
  double v4 = a3;
  sub_10016332C(v5, "lastFirmwareVersionForAllTagsSubmission", &v4);
  if (v6) {
    sub_1000DB0A0(v6);
  }
}

@end