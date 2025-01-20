@interface CWFRoamStatus(Dictionary)
- (id)dictionary;
@end

@implementation CWFRoamStatus(Dictionary)

- (id)dictionary
{
  id v2 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  id v3 = objc_alloc_init(MEMORY[0x263F08790]);
  [v3 setDateFormat:@"yyyy-MM-dd'T'HH:mm:ss.SSSxxx"];
  v4 = [a1 UUID];
  v5 = [v4 UUIDString];
  [v2 setObject:v5 forKeyedSubscript:@"wifi_uuid"];

  v6 = [a1 interfaceName];
  [v2 setObject:v6 forKeyedSubscript:@"wifi_interface_name"];

  v7 = [a1 startedAt];
  v8 = [v3 stringFromDate:v7];
  [v2 setObject:v8 forKeyedSubscript:@"wifi_roam_started_at"];

  v9 = [a1 endedAt];
  v10 = [v3 stringFromDate:v9];
  [v2 setObject:v10 forKeyedSubscript:@"wifi_roam_ended_at"];

  v11 = [a1 networkName];
  [v2 setObject:v11 forKeyedSubscript:@"wifi_ssid"];

  v12 = [a1 fromBSSID];
  [v2 setObject:v12 forKeyedSubscript:@"wifi_roam_from_bssid"];

  v13 = [a1 toBSSID];
  [v2 setObject:v13 forKeyedSubscript:@"wifi_roam_to_bssid"];

  v14 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(a1, "reason"));
  [v2 setObject:v14 forKeyedSubscript:@"wifi_roam_reason"];

  v15 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(a1, "fromChannel"));
  [v2 setObject:v15 forKeyedSubscript:@"wifi_roam_from_channel"];

  v16 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(a1, "toChannel"));
  [v2 setObject:v16 forKeyedSubscript:@"wifi_roam_to_channel"];

  v17 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(a1, "fromRSSI"));
  [v2 setObject:v17 forKeyedSubscript:@"wifi_roam_from_rssi"];

  v18 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(a1, "toRSSI"));
  [v2 setObject:v18 forKeyedSubscript:@"wifi_roam_to_rssi"];

  v19 = [NSDictionary dictionaryWithDictionary:v2];

  return v19;
}

@end