@interface WRM_WiFiCallingMetrics
- (WRM_WiFiCallingMetrics)init;
- (void)dealloc;
@end

@implementation WRM_WiFiCallingMetrics

- (WRM_WiFiCallingMetrics)init
{
  v3.receiver = self;
  v3.super_class = (Class)WRM_WiFiCallingMetrics;
  result = [(WRM_WiFiCallingMetrics *)&v3 init];
  if (result)
  {
    *(_OWORD *)&result->mWifiCallingEnd.ATM_Registration_State = 0u;
    *(_OWORD *)&result->mWifiCallingEnd.session_id = 0u;
    *(_OWORD *)&result->mWifiCallingEnd.iWLAN_Status = 0u;
    *(_OWORD *)&result->mWifiCallingEnd.HO_Bool = 0u;
    *(_OWORD *)&result->mWifiCallingEnd.Latte_Dejitter_Buffer_Underflow = 0u;
    *(_OWORD *)&result->mWifiCallingEnd.LTE_Data_LQM = 0u;
    *(_OWORD *)&result->mWifiCallingEnd.LTE_Tx_Power = 0u;
    *(_OWORD *)&result->mWifiCallingEnd.WiFi_BSSID_Change = 0u;
    *(_OWORD *)&result->mWifiCallingEnd.WiFi_RSSI = 0u;
  }
  return result;
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)WRM_WiFiCallingMetrics;
  [(WRM_WiFiCallingMetrics *)&v2 dealloc];
}

@end