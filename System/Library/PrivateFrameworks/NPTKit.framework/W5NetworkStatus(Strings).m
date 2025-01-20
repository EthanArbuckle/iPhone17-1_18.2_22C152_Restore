@interface W5NetworkStatus(Strings)
- (BOOL)isAppleReachableBool;
- (id)dictionary;
@end

@implementation W5NetworkStatus(Strings)

- (BOOL)isAppleReachableBool
{
  return ([a1 isAppleReachable] & 2) != 0 && (objc_msgSend(a1, "isAppleReachable") & 4) == 0;
}

- (id)dictionary
{
  v2 = objc_opt_new();
  v3 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(a1, "isAppleReachableBool"));
  [v2 setObject:v3 forKeyedSubscript:@"network_is_apple_reachable"];

  v4 = [a1 primaryIPv4InterfaceName];
  [v2 setObject:v4 forKeyedSubscript:@"network_primary_ipv4_interface_name"];

  v5 = [a1 primaryIPv4ServiceName];
  [v2 setObject:v5 forKeyedSubscript:@"network_primary_ipv4_service_name"];

  v6 = [a1 primaryIPv6InterfaceName];
  [v2 setObject:v6 forKeyedSubscript:@"network_primary_ipv6_interface_name"];

  v7 = [a1 primaryIPv6ServiceName];
  [v2 setObject:v7 forKeyedSubscript:@"network_primary_ipv6_service_name"];

  v8 = [NSDictionary dictionaryWithDictionary:v2];

  return v8;
}

@end