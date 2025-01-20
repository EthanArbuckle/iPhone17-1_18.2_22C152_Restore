@interface CLDaemonStatusInternal
- (void)airplaneModeChanged;
@end

@implementation CLDaemonStatusInternal

- (void)airplaneModeChanged
{
  id v2 = [+[CLServiceVendor sharedInstance] proxyForService:@"CLDaemonStatus"];

  [v2 syncgetDoSync:&stru_1022BE548];
}

@end