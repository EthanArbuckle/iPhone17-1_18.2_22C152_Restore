@interface SATTSSetSpeechSynthesisVolume
+ (id)setSpeechSynthesisVolume;
- (BOOL)mutatingCommand;
- (BOOL)requiresResponse;
- (NSNumber)volumeValue;
- (NSString)actionType;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setActionType:(id)a3;
- (void)setVolumeValue:(id)a3;
@end

@implementation SATTSSetSpeechSynthesisVolume

- (id)groupIdentifier
{
  return @"com.apple.ace.tts";
}

- (id)encodedClassName
{
  return @"SetSpeechSynthesisVolume";
}

+ (id)setSpeechSynthesisVolume
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSString)actionType
{
  return (NSString *)[(AceObject *)self propertyForKey:@"actionType"];
}

- (void)setActionType:(id)a3
{
}

- (NSNumber)volumeValue
{
  return (NSNumber *)[(AceObject *)self propertyForKey:@"volumeValue"];
}

- (void)setVolumeValue:(id)a3
{
}

- (BOOL)requiresResponse
{
  return 1;
}

- (BOOL)mutatingCommand
{
  return 1;
}

@end