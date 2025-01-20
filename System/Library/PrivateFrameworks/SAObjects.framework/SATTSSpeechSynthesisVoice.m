@interface SATTSSpeechSynthesisVoice
+ (id)speechSynthesisVoice;
- (BOOL)useServer;
- (NSString)contentVersion;
- (NSString)gender;
- (NSString)keyString;
- (NSString)languageCode;
- (NSString)name;
- (NSString)quality;
- (NSString)type;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setContentVersion:(id)a3;
- (void)setGender:(id)a3;
- (void)setKeyString:(id)a3;
- (void)setLanguageCode:(id)a3;
- (void)setName:(id)a3;
- (void)setQuality:(id)a3;
- (void)setType:(id)a3;
- (void)setUseServer:(BOOL)a3;
@end

@implementation SATTSSpeechSynthesisVoice

- (id)groupIdentifier
{
  return @"com.apple.ace.tts";
}

- (id)encodedClassName
{
  return @"SpeechSynthesisVoice";
}

+ (id)speechSynthesisVoice
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSString)contentVersion
{
  return (NSString *)[(AceObject *)self propertyForKey:@"contentVersion"];
}

- (void)setContentVersion:(id)a3
{
}

- (NSString)gender
{
  return (NSString *)[(AceObject *)self propertyForKey:@"gender"];
}

- (void)setGender:(id)a3
{
}

- (NSString)keyString
{
  return (NSString *)[(AceObject *)self propertyForKey:@"keyString"];
}

- (void)setKeyString:(id)a3
{
}

- (NSString)languageCode
{
  return (NSString *)[(AceObject *)self propertyForKey:@"languageCode"];
}

- (void)setLanguageCode:(id)a3
{
}

- (NSString)name
{
  return (NSString *)[(AceObject *)self propertyForKey:@"name"];
}

- (void)setName:(id)a3
{
}

- (NSString)quality
{
  return (NSString *)[(AceObject *)self propertyForKey:@"quality"];
}

- (void)setQuality:(id)a3
{
}

- (NSString)type
{
  return (NSString *)[(AceObject *)self propertyForKey:@"type"];
}

- (void)setType:(id)a3
{
}

- (BOOL)useServer
{
  return AceObjectBoolForProperty(self, @"useServer");
}

- (void)setUseServer:(BOOL)a3
{
}

@end