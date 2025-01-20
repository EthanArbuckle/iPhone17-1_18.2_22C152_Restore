@interface CWFScanResult(Dictionary)
- (id)dictionary;
@end

@implementation CWFScanResult(Dictionary)

- (id)dictionary
{
  id v2 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  v3 = [a1 networkName];
  [v2 setObject:v3 forKeyedSubscript:@"wifi_ssid"];

  v4 = [a1 BSSID];
  [v2 setObject:v4 forKeyedSubscript:@"wifi_bssid"];

  v5 = NSNumber;
  v6 = [a1 channel];
  v7 = objc_msgSend(v5, "numberWithUnsignedInteger:", objc_msgSend(v6, "channel"));
  [v2 setObject:v7 forKeyedSubscript:@"wifi_channel"];

  v8 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(a1, "RSSI"));
  [v2 setObject:v8 forKeyedSubscript:@"wifi_rssi"];

  v9 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(a1, "noise"));
  [v2 setObject:v9 forKeyedSubscript:@"wifi_noise"];

  v10 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(a1, "isInternetAccessible"));
  [v2 setObject:v10 forKeyedSubscript:@"wifi_is_internet_accessible"];

  v11 = [a1 primaryMAC];
  [v2 setObject:v11 forKeyedSubscript:@"wifi_primary_mac"];

  v12 = [a1 scanRecord];
  v13 = [v12 objectForKeyedSubscript:@"SCAN_BSSID_LIST"];
  [v2 setObject:v13 forKeyedSubscript:@"wifi_scan_bssid_list"];

  v14 = [a1 scanRecord];
  v15 = [v14 objectForKeyedSubscript:@"ScaledRSSI"];
  [v2 setObject:v15 forKeyedSubscript:@"wifi_scaled_rssi"];

  v16 = [a1 scanRecord];
  v17 = [v16 objectForKeyedSubscript:@"SNR"];
  [v2 setObject:v17 forKeyedSubscript:@"wifi_snr"];

  v18 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(a1, "strongestSupportedSecurityType"));
  [v2 setObject:v18 forKeyedSubscript:@"wifi_strongest_supported_security_type"];

  v19 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(a1, "isAppleSWAP"));
  [v2 setObject:v19 forKeyedSubscript:@"wifi_is_apple_swap"];

  v20 = [NSDictionary dictionaryWithDictionary:v2];

  return v20;
}

@end