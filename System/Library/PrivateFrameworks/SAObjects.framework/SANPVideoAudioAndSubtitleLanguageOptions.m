@interface SANPVideoAudioAndSubtitleLanguageOptions
+ (id)audioAndSubtitleLanguageOptions;
- (NSArray)availableSubtitles;
- (NSArray)availableTracks;
- (SANPVideoLanguageOption)currentAudioTrack;
- (SANPVideoLanguageOption)currentSubtitles;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setAvailableSubtitles:(id)a3;
- (void)setAvailableTracks:(id)a3;
- (void)setCurrentAudioTrack:(id)a3;
- (void)setCurrentSubtitles:(id)a3;
@end

@implementation SANPVideoAudioAndSubtitleLanguageOptions

- (id)groupIdentifier
{
  return @"com.apple.ace.nowplaying.video";
}

- (id)encodedClassName
{
  return @"AudioAndSubtitleLanguageOptions";
}

+ (id)audioAndSubtitleLanguageOptions
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSArray)availableSubtitles
{
  uint64_t v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, @"availableSubtitles", v3);
}

- (void)setAvailableSubtitles:(id)a3
{
}

- (NSArray)availableTracks
{
  uint64_t v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, @"availableTracks", v3);
}

- (void)setAvailableTracks:(id)a3
{
}

- (SANPVideoLanguageOption)currentAudioTrack
{
  return (SANPVideoLanguageOption *)AceObjectAceObjectForProperty(self, @"currentAudioTrack");
}

- (void)setCurrentAudioTrack:(id)a3
{
}

- (SANPVideoLanguageOption)currentSubtitles
{
  return (SANPVideoLanguageOption *)AceObjectAceObjectForProperty(self, @"currentSubtitles");
}

- (void)setCurrentSubtitles:(id)a3
{
}

@end