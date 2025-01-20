@interface STStatusBarDataSatelliteEntry(Converter)
- (uint64_t)initFromData:()Converter type:;
@end

@implementation STStatusBarDataSatelliteEntry(Converter)

- (uint64_t)initFromData:()Converter type:
{
  int v5 = *(unsigned __int8 *)(a3 + a4);
  v6 = objc_opt_class();
  if (v5) {
    [v6 entryWithConnectionStatus:1];
  }
  else {
  uint64_t v7 = [v6 disabledEntry];
  }

  return v7;
}

@end