@interface SASSetBootstrapSpeechIds
+ (id)setBootstrapSpeechIds;
- (BOOL)requiresResponse;
- (NSArray)bootstrapSpeechIdMetadata;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setBootstrapSpeechIdMetadata:(id)a3;
@end

@implementation SASSetBootstrapSpeechIds

- (id)groupIdentifier
{
  return @"com.apple.ace.speech";
}

- (id)encodedClassName
{
  return @"SetBootstrapSpeechIds";
}

+ (id)setBootstrapSpeechIds
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSArray)bootstrapSpeechIdMetadata
{
  uint64_t v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, @"bootstrapSpeechIdMetadata", v3);
}

- (void)setBootstrapSpeechIdMetadata:(id)a3
{
}

- (BOOL)requiresResponse
{
  return 1;
}

@end