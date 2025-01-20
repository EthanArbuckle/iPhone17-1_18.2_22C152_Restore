@interface ICQNetworkReachability
+ (BOOL)isNetworkReachable;
+ (BOOL)isWifiEnabled;
@end

@implementation ICQNetworkReachability

+ (BOOL)isNetworkReachable
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F4BE78]);
  if ([v3 airplaneMode] && !objc_msgSend(a1, "isWifiEnabled"))
  {
    char v5 = 0;
  }
  else
  {
    v4 = [MEMORY[0x1E4F4BE68] sharedNetworkObserver];
    char v5 = [v4 isNetworkReachable];
  }
  return v5;
}

+ (BOOL)isWifiEnabled
{
  v2 = [MEMORY[0x1E4F4BE68] sharedNetworkObserver];
  char v3 = [v2 isWiFiEnabled];

  return v3;
}

@end