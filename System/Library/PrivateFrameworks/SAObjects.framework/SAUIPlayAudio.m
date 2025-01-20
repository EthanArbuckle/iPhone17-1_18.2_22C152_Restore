@interface SAUIPlayAudio
- (BOOL)requiresResponse;
- (NSNumber)fadeInDuration;
- (NSNumber)fadeOutDuration;
- (NSNumber)numberOfLoops;
- (NSNumber)toneLibraryAlertType;
- (NSNumber)volume;
- (NSString)hapticLibraryKey;
- (NSString)itemURL;
- (SAUIAudioData)itemData;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setFadeInDuration:(id)a3;
- (void)setFadeOutDuration:(id)a3;
- (void)setHapticLibraryKey:(id)a3;
- (void)setItemData:(id)a3;
- (void)setItemURL:(id)a3;
- (void)setNumberOfLoops:(id)a3;
- (void)setToneLibraryAlertType:(id)a3;
- (void)setVolume:(id)a3;
@end

@implementation SAUIPlayAudio

- (id)groupIdentifier
{
  return @"com.apple.ace.assistant";
}

- (id)encodedClassName
{
  return @"PlayAudio";
}

- (NSNumber)fadeInDuration
{
  return (NSNumber *)[(AceObject *)self propertyForKey:@"fadeInDuration"];
}

- (void)setFadeInDuration:(id)a3
{
}

- (NSNumber)fadeOutDuration
{
  return (NSNumber *)[(AceObject *)self propertyForKey:@"fadeOutDuration"];
}

- (void)setFadeOutDuration:(id)a3
{
}

- (NSString)hapticLibraryKey
{
  return (NSString *)[(AceObject *)self propertyForKey:@"hapticLibraryKey"];
}

- (void)setHapticLibraryKey:(id)a3
{
}

- (SAUIAudioData)itemData
{
  return (SAUIAudioData *)AceObjectAceObjectForProperty(self, @"itemData");
}

- (void)setItemData:(id)a3
{
}

- (NSString)itemURL
{
  return (NSString *)[(AceObject *)self propertyForKey:@"itemURL"];
}

- (void)setItemURL:(id)a3
{
}

- (NSNumber)numberOfLoops
{
  return (NSNumber *)[(AceObject *)self propertyForKey:@"numberOfLoops"];
}

- (void)setNumberOfLoops:(id)a3
{
}

- (NSNumber)toneLibraryAlertType
{
  return (NSNumber *)[(AceObject *)self propertyForKey:@"toneLibraryAlertType"];
}

- (void)setToneLibraryAlertType:(id)a3
{
}

- (NSNumber)volume
{
  return (NSNumber *)[(AceObject *)self propertyForKey:@"volume"];
}

- (void)setVolume:(id)a3
{
}

- (BOOL)requiresResponse
{
  return 0;
}

@end