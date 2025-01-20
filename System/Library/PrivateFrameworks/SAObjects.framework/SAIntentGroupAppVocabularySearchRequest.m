@interface SAIntentGroupAppVocabularySearchRequest
+ (id)appVocabularySearchRequest;
- (BOOL)requiresResponse;
- (NSString)appBundleId;
- (NSString)appVocabularyType;
- (NSString)query;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setAppBundleId:(id)a3;
- (void)setAppVocabularyType:(id)a3;
- (void)setQuery:(id)a3;
@end

@implementation SAIntentGroupAppVocabularySearchRequest

- (id)groupIdentifier
{
  return @"com.apple.ace.command.assistant.intent";
}

- (id)encodedClassName
{
  return @"AppVocabularySearchRequest";
}

+ (id)appVocabularySearchRequest
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSString)appBundleId
{
  return (NSString *)[(AceObject *)self propertyForKey:@"appBundleId"];
}

- (void)setAppBundleId:(id)a3
{
}

- (NSString)appVocabularyType
{
  return (NSString *)[(AceObject *)self propertyForKey:@"appVocabularyType"];
}

- (void)setAppVocabularyType:(id)a3
{
}

- (NSString)query
{
  return (NSString *)[(AceObject *)self propertyForKey:@"query"];
}

- (void)setQuery:(id)a3
{
}

- (BOOL)requiresResponse
{
  return 1;
}

@end