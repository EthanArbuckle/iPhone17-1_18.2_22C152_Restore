@interface SANPVideoSetAutoSubtitles
+ (id)setAutoSubtitles;
- (BOOL)requiresResponse;
- (NSString)languageOptionChangeUserSetting;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setLanguageOptionChangeUserSetting:(id)a3;
@end

@implementation SANPVideoSetAutoSubtitles

- (id)groupIdentifier
{
  return @"com.apple.ace.nowplaying.video";
}

- (id)encodedClassName
{
  return @"SetAutoSubtitles";
}

+ (id)setAutoSubtitles
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
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