@interface SAMacOpenAboutThisMac
+ (id)openAboutThisMac;
- (BOOL)requiresResponse;
- (id)encodedClassName;
- (id)groupIdentifier;
@end

@implementation SAMacOpenAboutThisMac

- (id)groupIdentifier
{
  return @"com.apple.ace.mac";
}

- (id)encodedClassName
{
  return @"OpenAboutThisMac";
}

+ (id)openAboutThisMac
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (BOOL)requiresResponse
{
  return 1;
}

@end