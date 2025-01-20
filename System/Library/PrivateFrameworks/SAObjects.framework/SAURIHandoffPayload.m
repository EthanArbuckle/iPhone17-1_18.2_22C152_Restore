@interface SAURIHandoffPayload
+ (id)uRIHandoffPayload;
- (NSURL)link;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setLink:(id)a3;
@end

@implementation SAURIHandoffPayload

- (id)groupIdentifier
{
  return @"com.apple.ace.system";
}

- (id)encodedClassName
{
  return @"URIHandoffPayload";
}

+ (id)uRIHandoffPayload
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSURL)link
{
  return (NSURL *)AceObjectURLForProperty(self, @"link");
}

- (void)setLink:(id)a3
{
}

@end