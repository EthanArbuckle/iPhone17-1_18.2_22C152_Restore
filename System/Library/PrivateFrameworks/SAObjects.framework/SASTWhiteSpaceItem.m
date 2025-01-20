@interface SASTWhiteSpaceItem
+ (id)whiteSpaceItem;
- (id)encodedClassName;
- (id)groupIdentifier;
@end

@implementation SASTWhiteSpaceItem

- (id)groupIdentifier
{
  return @"com.apple.ace.templates";
}

- (id)encodedClassName
{
  return @"WhiteSpaceItem";
}

+ (id)whiteSpaceItem
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

@end