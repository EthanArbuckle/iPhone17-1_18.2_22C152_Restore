@interface SANPVideoGetAudioTracksAndSubtitleOptionsCompleted
+ (id)getAudioTracksAndSubtitleOptionsCompleted;
- (BOOL)requiresResponse;
- (SANPVideoAudioAndSubtitleLanguageOptions)languageOptions;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setLanguageOptions:(id)a3;
@end

@implementation SANPVideoGetAudioTracksAndSubtitleOptionsCompleted

- (id)groupIdentifier
{
  return @"com.apple.ace.nowplaying.video";
}

- (id)encodedClassName
{
  return @"GetAudioTracksAndSubtitleOptionsCompleted";
}

+ (id)getAudioTracksAndSubtitleOptionsCompleted
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (SANPVideoAudioAndSubtitleLanguageOptions)languageOptions
{
  return (SANPVideoAudioAndSubtitleLanguageOptions *)AceObjectAceObjectForProperty(self, @"languageOptions");
}

- (void)setLanguageOptions:(id)a3
{
}

- (BOOL)requiresResponse
{
  return 0;
}

@end