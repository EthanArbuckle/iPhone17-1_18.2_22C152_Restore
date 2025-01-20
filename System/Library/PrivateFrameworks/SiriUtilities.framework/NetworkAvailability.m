@interface NetworkAvailability
- (SUNetworkReachability)networkReachability;
@end

@implementation NetworkAvailability

- (SUNetworkReachability)networkReachability
{
  id v2 = NetworkAvailability.networkReachability.getter();

  return (SUNetworkReachability *)v2;
}

@end