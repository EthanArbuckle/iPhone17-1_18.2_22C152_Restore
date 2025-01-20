@interface SATTSGetSpeechSynthesisVolumeResponse
+ (id)getSpeechSynthesisVolumeResponse;
- (BOOL)requiresResponse;
- (NSNumber)volumeLevel;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setVolumeLevel:(id)a3;
@end

@implementation SATTSGetSpeechSynthesisVolumeResponse

- (id)groupIdentifier
{
  return @"com.apple.ace.tts";
}

- (id)encodedClassName
{
  return @"GetSpeechSynthesisVolumeResponse";
}

+ (id)getSpeechSynthesisVolumeResponse
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSNumber)volumeLevel
{
  return (NSNumber *)[(AceObject *)self propertyForKey:@"volumeLevel"];
}

- (void)setVolumeLevel:(id)a3
{
}

- (BOOL)requiresResponse
{
  return 0;
}

@end