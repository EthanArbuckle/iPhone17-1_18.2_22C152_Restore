@interface WKSecurityOrigin(SafariSharedUIExtras)
- (id)safari_userVisibleName;
@end

@implementation WKSecurityOrigin(SafariSharedUIExtras)

- (id)safari_userVisibleName
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F29088]);
  v3 = [a1 protocol];
  [v2 setScheme:v3];

  v4 = [a1 host];
  v5 = objc_msgSend(v4, "_webkit_decodeHostName");
  [v2 setHost:v5];

  if ([a1 port])
  {
    v6 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(a1, "port"));
    [v2 setPort:v6];
  }
  else
  {
    [v2 setPort:0];
  }
  v7 = [v2 string];

  return v7;
}

@end