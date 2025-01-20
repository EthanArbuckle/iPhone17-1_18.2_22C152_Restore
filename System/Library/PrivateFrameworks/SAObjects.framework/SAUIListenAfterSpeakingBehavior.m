@interface SAUIListenAfterSpeakingBehavior
- (NSString)startAlertSoundID;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setStartAlertSoundID:(id)a3;
@end

@implementation SAUIListenAfterSpeakingBehavior

- (id)groupIdentifier
{
  return @"com.apple.ace.assistant";
}

- (id)encodedClassName
{
  return @"ListenAfterSpeakingBehavior";
}

- (NSString)startAlertSoundID
{
  return (NSString *)[(AceObject *)self propertyForKey:@"startAlertSoundID"];
}

- (void)setStartAlertSoundID:(id)a3
{
}

@end