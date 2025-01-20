@interface SATTSSpeechSynthesisResource
+ (id)speechSynthesisResource;
- (NSString)languageCode;
- (NSString)resourceVersion;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setLanguageCode:(id)a3;
- (void)setResourceVersion:(id)a3;
@end

@implementation SATTSSpeechSynthesisResource

- (id)groupIdentifier
{
  return @"com.apple.ace.tts";
}

- (id)encodedClassName
{
  return @"SpeechSynthesisResource";
}

+ (id)speechSynthesisResource
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSString)languageCode
{
  return (NSString *)[(AceObject *)self propertyForKey:@"languageCode"];
}

- (void)setLanguageCode:(id)a3
{
}

- (NSString)resourceVersion
{
  return (NSString *)[(AceObject *)self propertyForKey:@"resourceVersion"];
}

- (void)setResourceVersion:(id)a3
{
}

@end