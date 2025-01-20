@interface SAMacStartScreenSaver
+ (id)startScreenSaver;
- (BOOL)requiresResponse;
- (id)encodedClassName;
- (id)groupIdentifier;
@end

@implementation SAMacStartScreenSaver

- (id)groupIdentifier
{
  return @"com.apple.ace.mac";
}

- (id)encodedClassName
{
  return @"StartScreenSaver";
}

+ (id)startScreenSaver
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (BOOL)requiresResponse
{
  return 1;
}

@end