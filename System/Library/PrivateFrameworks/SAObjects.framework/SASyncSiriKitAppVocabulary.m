@interface SASyncSiriKitAppVocabulary
- (NSDictionary)customVocabularyMap;
- (NSString)bundleId;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setBundleId:(id)a3;
- (void)setCustomVocabularyMap:(id)a3;
@end

@implementation SASyncSiriKitAppVocabulary

- (id)groupIdentifier
{
  return @"com.apple.ace.sync";
}

- (id)encodedClassName
{
  return @"SiriKitAppVocabulary";
}

- (NSString)bundleId
{
  return (NSString *)[(AceObject *)self propertyForKey:@"bundleId"];
}

- (void)setBundleId:(id)a3
{
}

- (NSDictionary)customVocabularyMap
{
  uint64_t v3 = objc_opt_class();
  return (NSDictionary *)AceObjectClassArrayDictionaryForProperty(self, @"customVocabularyMap", v3);
}

- (void)setCustomVocabularyMap:(id)a3
{
}

@end