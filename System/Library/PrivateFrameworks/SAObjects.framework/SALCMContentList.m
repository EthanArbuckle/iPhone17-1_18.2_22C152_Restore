@interface SALCMContentList
+ (id)contentList;
- (id)encodedClassName;
- (id)groupIdentifier;
@end

@implementation SALCMContentList

- (id)groupIdentifier
{
  return @"com.apple.ace.livecontent";
}

- (id)encodedClassName
{
  return @"ContentList";
}

+ (id)contentList
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

@end