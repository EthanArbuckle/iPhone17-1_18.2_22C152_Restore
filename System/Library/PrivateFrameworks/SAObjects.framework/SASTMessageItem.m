@interface SASTMessageItem
+ (id)messageItem;
- (NSString)bundleId;
- (NSString)serviceType;
- (NSURL)audioMessageURL;
- (SAUIDecoratedText)content;
- (SAUIDecoratedText)recipient;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setAudioMessageURL:(id)a3;
- (void)setBundleId:(id)a3;
- (void)setContent:(id)a3;
- (void)setRecipient:(id)a3;
- (void)setServiceType:(id)a3;
@end

@implementation SASTMessageItem

- (id)groupIdentifier
{
  return @"com.apple.ace.templates";
}

- (id)encodedClassName
{
  return @"MessageItem";
}

+ (id)messageItem
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSURL)audioMessageURL
{
  return (NSURL *)AceObjectURLForProperty(self, @"audioMessageURL");
}

- (void)setAudioMessageURL:(id)a3
{
}

- (NSString)bundleId
{
  return (NSString *)[(AceObject *)self propertyForKey:@"bundleId"];
}

- (void)setBundleId:(id)a3
{
}

- (SAUIDecoratedText)content
{
  return (SAUIDecoratedText *)AceObjectAceObjectForProperty(self, @"content");
}

- (void)setContent:(id)a3
{
}

- (SAUIDecoratedText)recipient
{
  return (SAUIDecoratedText *)AceObjectAceObjectForProperty(self, @"recipient");
}

- (void)setRecipient:(id)a3
{
}

- (NSString)serviceType
{
  return (NSString *)[(AceObject *)self propertyForKey:@"serviceType"];
}

- (void)setServiceType:(id)a3
{
}

@end