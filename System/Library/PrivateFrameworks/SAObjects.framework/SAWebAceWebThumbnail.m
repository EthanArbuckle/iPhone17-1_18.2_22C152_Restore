@interface SAWebAceWebThumbnail
+ (id)aceWebThumbnail;
- (NSURL)url;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setUrl:(id)a3;
@end

@implementation SAWebAceWebThumbnail

- (id)groupIdentifier
{
  return @"com.apple.ace.websearch";
}

- (id)encodedClassName
{
  return @"AceWebThumbnail";
}

+ (id)aceWebThumbnail
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSURL)url
{
  return (NSURL *)AceObjectURLForProperty(self, @"url");
}

- (void)setUrl:(id)a3
{
}

@end