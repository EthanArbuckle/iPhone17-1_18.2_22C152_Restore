@interface NSHTTPCookie(SafariSharedExtras)
- (uint64_t)safari_belongsToDomain:()SafariSharedExtras;
@end

@implementation NSHTTPCookie(SafariSharedExtras)

- (uint64_t)safari_belongsToDomain:()SafariSharedExtras
{
  id v4 = a3;
  v5 = [a1 domain];
  if ([v5 length] && objc_msgSend(v4, "length"))
  {
    if ([v5 hasPrefix:@"."])
    {
      id v6 = [v5 substringFromIndex:1];
    }
    else
    {
      id v6 = v5;
    }
    v8 = v6;
    v9 = objc_msgSend(v6, "safari_highLevelDomainFromHost");
    v10 = v9;
    if (v9)
    {
      id v11 = v9;

      v8 = v11;
    }
    uint64_t v7 = objc_msgSend(v4, "safari_isHostOrSubdomainOfHost:", v8);
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

@end