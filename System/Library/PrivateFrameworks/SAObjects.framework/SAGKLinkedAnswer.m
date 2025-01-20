@interface SAGKLinkedAnswer
+ (id)linkedAnswer;
- (NSArray)thumbnails;
- (NSString)descriptionText;
- (NSString)displayLink;
- (NSString)name;
- (NSString)query;
- (NSURL)link;
- (NSURL)searchUri;
- (SAUIAppPunchOut)punchOut;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setDescriptionText:(id)a3;
- (void)setDisplayLink:(id)a3;
- (void)setLink:(id)a3;
- (void)setName:(id)a3;
- (void)setPunchOut:(id)a3;
- (void)setQuery:(id)a3;
- (void)setSearchUri:(id)a3;
- (void)setThumbnails:(id)a3;
@end

@implementation SAGKLinkedAnswer

- (id)groupIdentifier
{
  return @"com.apple.ace.generalknowledge";
}

- (id)encodedClassName
{
  return @"LinkedAnswer";
}

+ (id)linkedAnswer
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSString)descriptionText
{
  return (NSString *)[(AceObject *)self propertyForKey:@"descriptionText"];
}

- (void)setDescriptionText:(id)a3
{
}

- (NSString)displayLink
{
  return (NSString *)[(AceObject *)self propertyForKey:@"displayLink"];
}

- (void)setDisplayLink:(id)a3
{
}

- (NSURL)link
{
  return (NSURL *)AceObjectURLForProperty(self, @"link");
}

- (void)setLink:(id)a3
{
}

- (NSString)name
{
  return (NSString *)[(AceObject *)self propertyForKey:@"name"];
}

- (void)setName:(id)a3
{
}

- (SAUIAppPunchOut)punchOut
{
  return (SAUIAppPunchOut *)AceObjectAceObjectForProperty(self, @"punchOut");
}

- (void)setPunchOut:(id)a3
{
}

- (NSString)query
{
  return (NSString *)[(AceObject *)self propertyForKey:@"query"];
}

- (void)setQuery:(id)a3
{
}

- (NSURL)searchUri
{
  return (NSURL *)AceObjectURLForProperty(self, @"searchUri");
}

- (void)setSearchUri:(id)a3
{
}

- (NSArray)thumbnails
{
  uint64_t v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, @"thumbnails", v3);
}

- (void)setThumbnails:(id)a3
{
}

@end