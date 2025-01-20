@interface SAMicroblogMicroblogSearchResultPost
+ (id)microblogSearchResultPost;
- (NSArray)embeddedHashtags;
- (NSArray)embeddedImages;
- (NSArray)embeddedLinks;
- (NSArray)embeddedMentions;
- (NSDate)creationTime;
- (NSString)location;
- (NSURL)webAddress;
- (SADecoratedString)decoratedContent;
- (SAMicroblogTwitterPostAuthor)retweetAuthor;
- (SAUIAppPunchOut)punchOut;
- (id)encodedClassName;
- (id)groupIdentifier;
- (int64_t)favoritesCount;
- (int64_t)retweetCount;
- (void)setCreationTime:(id)a3;
- (void)setDecoratedContent:(id)a3;
- (void)setEmbeddedHashtags:(id)a3;
- (void)setEmbeddedImages:(id)a3;
- (void)setEmbeddedLinks:(id)a3;
- (void)setEmbeddedMentions:(id)a3;
- (void)setFavoritesCount:(int64_t)a3;
- (void)setLocation:(id)a3;
- (void)setPunchOut:(id)a3;
- (void)setRetweetAuthor:(id)a3;
- (void)setRetweetCount:(int64_t)a3;
- (void)setWebAddress:(id)a3;
@end

@implementation SAMicroblogMicroblogSearchResultPost

- (id)groupIdentifier
{
  return @"com.apple.ace.microblog";
}

- (id)encodedClassName
{
  return @"MicroblogSearchResultPost";
}

+ (id)microblogSearchResultPost
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSDate)creationTime
{
  return (NSDate *)[(AceObject *)self propertyForKey:@"creationTime"];
}

- (void)setCreationTime:(id)a3
{
}

- (SADecoratedString)decoratedContent
{
  return (SADecoratedString *)AceObjectAceObjectForProperty(self, @"decoratedContent");
}

- (void)setDecoratedContent:(id)a3
{
}

- (NSArray)embeddedHashtags
{
  return (NSArray *)[(AceObject *)self propertyForKey:@"embeddedHashtags"];
}

- (void)setEmbeddedHashtags:(id)a3
{
}

- (NSArray)embeddedImages
{
  uint64_t v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, @"embeddedImages", v3);
}

- (void)setEmbeddedImages:(id)a3
{
}

- (NSArray)embeddedLinks
{
  return (NSArray *)AceObjectURLArrayForProperty(self, @"embeddedLinks");
}

- (void)setEmbeddedLinks:(id)a3
{
}

- (NSArray)embeddedMentions
{
  return (NSArray *)[(AceObject *)self propertyForKey:@"embeddedMentions"];
}

- (void)setEmbeddedMentions:(id)a3
{
}

- (int64_t)favoritesCount
{
  return AceObjectIntegerForProperty(self, @"favoritesCount");
}

- (void)setFavoritesCount:(int64_t)a3
{
}

- (NSString)location
{
  return (NSString *)[(AceObject *)self propertyForKey:@"location"];
}

- (void)setLocation:(id)a3
{
}

- (SAUIAppPunchOut)punchOut
{
  return (SAUIAppPunchOut *)AceObjectAceObjectForProperty(self, @"punchOut");
}

- (void)setPunchOut:(id)a3
{
}

- (SAMicroblogTwitterPostAuthor)retweetAuthor
{
  return (SAMicroblogTwitterPostAuthor *)AceObjectAceObjectForProperty(self, @"retweetAuthor");
}

- (void)setRetweetAuthor:(id)a3
{
}

- (int64_t)retweetCount
{
  return AceObjectIntegerForProperty(self, @"retweetCount");
}

- (void)setRetweetCount:(int64_t)a3
{
}

- (NSURL)webAddress
{
  return (NSURL *)AceObjectURLForProperty(self, @"webAddress");
}

- (void)setWebAddress:(id)a3
{
}

@end