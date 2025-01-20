@interface NSDictionary(VUIStoreAcquisition)
- (uint64_t)vui_appleTimingAppHeaderValue;
@end

@implementation NSDictionary(VUIStoreAcquisition)

- (uint64_t)vui_appleTimingAppHeaderValue
{
  v1 = [a1 objectForKey:@"apple-timing-app"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v2 = [v1 componentsSeparatedByString:@" "];
    v3 = [v2 firstObject];
    uint64_t v4 = [v3 integerValue];
  }
  else
  {
    uint64_t v4 = 0;
  }

  return v4;
}

@end