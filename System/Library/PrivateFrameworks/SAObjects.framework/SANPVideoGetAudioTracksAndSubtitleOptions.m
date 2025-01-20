@interface SANPVideoGetAudioTracksAndSubtitleOptions
+ (id)getAudioTracksAndSubtitleOptions;
- (BOOL)mutatingCommand;
- (BOOL)requiresResponse;
- (NSString)desiredLanguage;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setDesiredLanguage:(id)a3;
@end

@implementation SANPVideoGetAudioTracksAndSubtitleOptions

- (id)groupIdentifier
{
  return @"com.apple.ace.nowplaying.video";
}

- (id)encodedClassName
{
  return @"GetAudioTracksAndSubtitleOptions";
}

+ (id)getAudioTracksAndSubtitleOptions
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSString)desiredLanguage
{
  return (NSString *)[(AceObject *)self propertyForKey:@"desiredLanguage"];
}

- (void)setDesiredLanguage:(id)a3
{
}

- (BOOL)requiresResponse
{
  return 1;
}

- (BOOL)mutatingCommand
{
  return 0;
}

@end