@interface SASPhrase
+ (id)phrase;
- (BOOL)lowConfidence;
- (BOOL)speechRepairApplied;
- (NSArray)interpretations;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setInterpretations:(id)a3;
- (void)setLowConfidence:(BOOL)a3;
- (void)setSpeechRepairApplied:(BOOL)a3;
@end

@implementation SASPhrase

- (id)groupIdentifier
{
  return @"com.apple.ace.speech";
}

- (id)encodedClassName
{
  return @"Phrase";
}

+ (id)phrase
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSArray)interpretations
{
  uint64_t v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, @"interpretations", v3);
}

- (void)setInterpretations:(id)a3
{
}

- (BOOL)lowConfidence
{
  return AceObjectBoolForProperty(self, @"lowConfidence");
}

- (void)setLowConfidence:(BOOL)a3
{
}

- (BOOL)speechRepairApplied
{
  return AceObjectBoolForProperty(self, @"speechRepairApplied");
}

- (void)setSpeechRepairApplied:(BOOL)a3
{
}

@end