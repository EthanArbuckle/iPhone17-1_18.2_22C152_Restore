@interface NEVPNProtocol(Dictionary)
- (id)dictionary;
@end

@implementation NEVPNProtocol(Dictionary)

- (id)dictionary
{
  id v2 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  v3 = [a1 serverAddress];
  [v2 setObject:v3 forKeyedSubscript:@"vpn_server_address"];

  v4 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(a1, "disconnectOnSleep"));
  [v2 setObject:v4 forKeyedSubscript:@"vpn_disconnect_on_sleep"];

  v5 = NSNumber;
  v6 = [a1 proxySettings];
  v7 = objc_msgSend(v5, "numberWithBool:", objc_msgSend(v6, "autoProxyConfigurationEnabled"));
  [v2 setObject:v7 forKeyedSubscript:@"vpn_protocol_proxy_auto_config_enabled"];

  v8 = NSNumber;
  v9 = [a1 proxySettings];
  v10 = objc_msgSend(v8, "numberWithBool:", objc_msgSend(v9, "HTTPEnabled"));
  [v2 setObject:v10 forKeyedSubscript:@"vpn_protocol_proxy_static_http_enabled"];

  v11 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(a1, "includeAllNetworks"));
  [v2 setObject:v11 forKeyedSubscript:@"vpn_include_all_networks"];

  v12 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(a1, "excludeLocalNetworks"));
  [v2 setObject:v12 forKeyedSubscript:@"vpn_exclude_all_networks"];

  v13 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(a1, "enforceRoutes"));
  [v2 setObject:v13 forKeyedSubscript:@"vpn_enforce_routes"];

  v14 = [NSDictionary dictionaryWithDictionary:v2];

  return v14;
}

@end