@interface SAAceWatchFace
+ (id)aceWatchFace;
- (id)encodedClassName;
- (id)groupIdentifier;
@end

@implementation SAAceWatchFace

- (id)groupIdentifier
{
  return @"com.apple.ace.system";
}

- (id)encodedClassName
{
  return @"AceWatchFace";
}

+ (id)aceWatchFace
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

@end