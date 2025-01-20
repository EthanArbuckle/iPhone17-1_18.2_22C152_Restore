@interface SASAudioAnalytics
+ (id)audioAnalytics;
- (NSDictionary)acousticFeatures;
- (NSDictionary)speechRecognitionFeatures;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setAcousticFeatures:(id)a3;
- (void)setSpeechRecognitionFeatures:(id)a3;
@end

@implementation SASAudioAnalytics

- (id)groupIdentifier
{
  return @"com.apple.ace.speech";
}

- (id)encodedClassName
{
  return @"AudioAnalytics";
}

+ (id)audioAnalytics
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSDictionary)acousticFeatures
{
  uint64_t v3 = objc_opt_class();
  return (NSDictionary *)AceObjectClassDictionaryForProperty(self, @"acousticFeatures", v3);
}

- (void)setAcousticFeatures:(id)a3
{
}

- (NSDictionary)speechRecognitionFeatures
{
  return (NSDictionary *)[(AceObject *)self propertyForKey:@"speechRecognitionFeatures"];
}

- (void)setSpeechRecognitionFeatures:(id)a3
{
}

@end