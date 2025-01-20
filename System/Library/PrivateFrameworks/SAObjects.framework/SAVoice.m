@interface SAVoice
+ (id)voice;
- (NSString)gender;
- (NSString)languageString;
- (NSString)masteredVersion;
- (NSString)name;
- (NSString)quality;
- (NSString)resourceMasteredVersion;
- (NSString)voiceType;
- (id)encodedClassName;
- (id)groupIdentifier;
- (int64_t)resourceContentVersion;
- (int64_t)voiceContentVersion;
- (void)setGender:(id)a3;
- (void)setLanguageString:(id)a3;
- (void)setMasteredVersion:(id)a3;
- (void)setName:(id)a3;
- (void)setQuality:(id)a3;
- (void)setResourceContentVersion:(int64_t)a3;
- (void)setResourceMasteredVersion:(id)a3;
- (void)setVoiceContentVersion:(int64_t)a3;
- (void)setVoiceType:(id)a3;
@end

@implementation SAVoice

- (id)groupIdentifier
{
  return @"com.apple.ace.system";
}

- (id)encodedClassName
{
  return @"Voice";
}

+ (id)voice
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSString)gender
{
  return (NSString *)[(AceObject *)self propertyForKey:@"gender"];
}

- (void)setGender:(id)a3
{
}

- (NSString)languageString
{
  return (NSString *)[(AceObject *)self propertyForKey:@"languageString"];
}

- (void)setLanguageString:(id)a3
{
}

- (NSString)masteredVersion
{
  return (NSString *)[(AceObject *)self propertyForKey:@"masteredVersion"];
}

- (void)setMasteredVersion:(id)a3
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

- (int64_t)resourceContentVersion
{
  return AceObjectIntegerForProperty(self, @"resourceContentVersion");
}

- (void)setResourceContentVersion:(int64_t)a3
{
}

- (NSString)resourceMasteredVersion
{
  return (NSString *)[(AceObject *)self propertyForKey:@"resourceMasteredVersion"];
}

- (void)setResourceMasteredVersion:(id)a3
{
}

- (int64_t)voiceContentVersion
{
  return AceObjectIntegerForProperty(self, @"voiceContentVersion");
}

- (void)setVoiceContentVersion:(int64_t)a3
{
}

- (NSString)voiceType
{
  return (NSString *)[(AceObject *)self propertyForKey:@"voiceType"];
}

- (void)setVoiceType:(id)a3
{
}

@end