@interface SAUIURLData
+ (id)uRLData;
- (NSData)data;
- (NSURL)uri;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setData:(id)a3;
- (void)setUri:(id)a3;
@end

@implementation SAUIURLData

- (id)groupIdentifier
{
  return @"com.apple.ace.assistant";
}

- (id)encodedClassName
{
  return @"URLData";
}

+ (id)uRLData
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSData)data
{
  return (NSData *)[(AceObject *)self propertyForKey:@"data"];
}

- (void)setData:(id)a3
{
}

- (NSURL)uri
{
  return (NSURL *)AceObjectURLForProperty(self, @"uri");
}

- (void)setUri:(id)a3
{
}

@end