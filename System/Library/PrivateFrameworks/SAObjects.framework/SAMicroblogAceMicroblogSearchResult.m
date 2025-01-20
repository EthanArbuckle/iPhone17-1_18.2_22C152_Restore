@interface SAMicroblogAceMicroblogSearchResult
+ (id)aceMicroblogSearchResult;
- (NSArray)resultNews;
- (NSArray)resultPosts;
- (NSArray)resultUsers;
- (NSString)query;
- (NSURL)webAddress;
- (SADecoratedString)summary;
- (SAMicroblogTwitterPostAuthor)globalAuthor;
- (SAUIAppPunchOut)punchOut;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setGlobalAuthor:(id)a3;
- (void)setPunchOut:(id)a3;
- (void)setQuery:(id)a3;
- (void)setResultNews:(id)a3;
- (void)setResultPosts:(id)a3;
- (void)setResultUsers:(id)a3;
- (void)setSummary:(id)a3;
- (void)setWebAddress:(id)a3;
@end

@implementation SAMicroblogAceMicroblogSearchResult

- (id)groupIdentifier
{
  return @"com.apple.ace.microblog";
}

- (id)encodedClassName
{
  return @"AceMicroblogSearchResult";
}

+ (id)aceMicroblogSearchResult
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (SAMicroblogTwitterPostAuthor)globalAuthor
{
  return (SAMicroblogTwitterPostAuthor *)AceObjectAceObjectForProperty(self, @"globalAuthor");
}

- (void)setGlobalAuthor:(id)a3
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

- (NSArray)resultNews
{
  uint64_t v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, @"resultNews", v3);
}

- (void)setResultNews:(id)a3
{
}

- (NSArray)resultPosts
{
  uint64_t v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, @"resultPosts", v3);
}

- (void)setResultPosts:(id)a3
{
}

- (NSArray)resultUsers
{
  uint64_t v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, @"resultUsers", v3);
}

- (void)setResultUsers:(id)a3
{
}

- (SADecoratedString)summary
{
  return (SADecoratedString *)AceObjectAceObjectForProperty(self, @"summary");
}

- (void)setSummary:(id)a3
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