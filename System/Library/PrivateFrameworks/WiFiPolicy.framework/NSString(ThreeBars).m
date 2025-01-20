@interface NSString(ThreeBars)
- (id)reformatBSSID;
@end

@implementation NSString(ThreeBars)

- (id)reformatBSSID
{
  id v1 = a1;
  if (v1
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    && (id v2 = v1, [v2 UTF8String])
    && (v3 = ether_aton((const char *)[v2 UTF8String])) != 0)
  {
    v4 = objc_msgSend(NSString, "stringWithFormat:", @"%02x:%02x:%02x:%02x:%02x:%02x", v3->octet[0], v3->octet[1], v3->octet[2], v3->octet[3], v3->octet[4], v3->octet[5]);
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

@end