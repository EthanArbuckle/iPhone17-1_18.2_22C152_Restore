@interface NSURL
- (BOOL)th_shouldSharedAppDelegateHandleURL;
@end

@implementation NSURL

- (BOOL)th_shouldSharedAppDelegateHandleURL
{
  v3 = [(NSString *)[(NSURL *)self scheme] lowercaseString];
  unsigned __int8 v4 = [(NSString *)v3 isEqualToString:@"ibooks"];
  if (objc_msgSend(+[NSURL assetIDFromURL:](NSURL, "assetIDFromURL:", self), "length") && (v4 & 1) != 0) {
    return 1;
  }
  if ([(NSURL *)self host]) {
    unsigned __int8 v6 = 0;
  }
  else {
    unsigned __int8 v6 = v4;
  }
  if (v6) {
    return 0;
  }
  id v7 = [[TSKApplicationDelegate sharedDelegate] validURLSchemes];

  return [v7 containsObject:v3];
}

@end