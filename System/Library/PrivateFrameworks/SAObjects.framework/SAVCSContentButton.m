@interface SAVCSContentButton
+ (id)contentButton;
- (NSArray)togglePlayPauseCommands;
- (NSString)canonicalId;
- (NSString)contentType;
- (NSURL)url;
- (SASTTemplateContentRating)contentRating;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setCanonicalId:(id)a3;
- (void)setContentRating:(id)a3;
- (void)setContentType:(id)a3;
- (void)setTogglePlayPauseCommands:(id)a3;
- (void)setUrl:(id)a3;
@end

@implementation SAVCSContentButton

- (id)groupIdentifier
{
  return @"com.apple.ace.videocontent";
}

- (id)encodedClassName
{
  return @"ContentButton";
}

+ (id)contentButton
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSString)canonicalId
{
  return (NSString *)[(AceObject *)self propertyForKey:@"canonicalId"];
}

- (void)setCanonicalId:(id)a3
{
}

- (SASTTemplateContentRating)contentRating
{
  return (SASTTemplateContentRating *)AceObjectAceObjectForProperty(self, @"contentRating");
}

- (void)setContentRating:(id)a3
{
}

- (NSString)contentType
{
  return (NSString *)[(AceObject *)self propertyForKey:@"contentType"];
}

- (void)setContentType:(id)a3
{
}

- (NSArray)togglePlayPauseCommands
{
  return (NSArray *)AceObjectProtocolArrayForProperty(self, @"togglePlayPauseCommands", &unk_1EFD73568);
}

- (void)setTogglePlayPauseCommands:(id)a3
{
}

- (NSURL)url
{
  return (NSURL *)AceObjectURLForProperty(self, @"url");
}

- (void)setUrl:(id)a3
{
}

@end