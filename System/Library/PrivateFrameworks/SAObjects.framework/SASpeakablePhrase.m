@interface SASpeakablePhrase
+ (id)speakablePhrase;
- (NSString)phrase;
- (NSString)pronunciation;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setPhrase:(id)a3;
- (void)setPronunciation:(id)a3;
@end

@implementation SASpeakablePhrase

- (id)groupIdentifier
{
  return @"com.apple.ace.system";
}

- (id)encodedClassName
{
  return @"SpeakablePhrase";
}

+ (id)speakablePhrase
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSString)phrase
{
  return (NSString *)[(AceObject *)self propertyForKey:@"phrase"];
}

- (void)setPhrase:(id)a3
{
}

- (NSString)pronunciation
{
  return (NSString *)[(AceObject *)self propertyForKey:@"pronunciation"];
}

- (void)setPronunciation:(id)a3
{
}

@end