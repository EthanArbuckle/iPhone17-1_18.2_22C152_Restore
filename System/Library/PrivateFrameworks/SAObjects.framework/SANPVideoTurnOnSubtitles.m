@interface SANPVideoTurnOnSubtitles
+ (id)turnOnSubtitles;
- (BOOL)requiresResponse;
- (NSString)desiredOptionId;
- (NSString)languageOptionChangeUserSetting;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setDesiredOptionId:(id)a3;
- (void)setLanguageOptionChangeUserSetting:(id)a3;
@end

@implementation SANPVideoTurnOnSubtitles

- (id)groupIdentifier
{
  return @"com.apple.ace.nowplaying.video";
}

- (id)encodedClassName
{
  return @"TurnOnSubtitles";
}

+ (id)turnOnSubtitles
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSString)desiredOptionId
{
  return (NSString *)[(AceObject *)self propertyForKey:@"desiredOptionId"];
}

- (void)setDesiredOptionId:(id)a3
{
}

- (NSString)languageOptionChangeUserSetting
{
  return (NSString *)[(AceObject *)self propertyForKey:@"languageOptionChangeUserSetting"];
}

- (void)setLanguageOptionChangeUserSetting:(id)a3
{
}

- (BOOL)requiresResponse
{
  return 0;
}

@end