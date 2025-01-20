@interface SAUIURLImageData
+ (id)uRLImageData;
- (id)encodedClassName;
- (id)groupIdentifier;
@end

@implementation SAUIURLImageData

- (id)groupIdentifier
{
  return @"com.apple.ace.assistant";
}

- (id)encodedClassName
{
  return @"URLImageData";
}

+ (id)uRLImageData
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

@end