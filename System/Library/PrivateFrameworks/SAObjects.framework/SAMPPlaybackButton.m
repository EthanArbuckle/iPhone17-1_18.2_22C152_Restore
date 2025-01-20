@interface SAMPPlaybackButton
+ (id)playbackButton;
- (NSArray)pauseCommands;
- (NSArray)playCommands;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setPauseCommands:(id)a3;
- (void)setPlayCommands:(id)a3;
@end

@implementation SAMPPlaybackButton

- (id)groupIdentifier
{
  return @"com.apple.ace.media";
}

- (id)encodedClassName
{
  return @"PlaybackButton";
}

+ (id)playbackButton
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSArray)pauseCommands
{
  return (NSArray *)AceObjectProtocolArrayForProperty(self, @"pauseCommands", &unk_1EFD73568);
}

- (void)setPauseCommands:(id)a3
{
}

- (NSArray)playCommands
{
  return (NSArray *)AceObjectProtocolArrayForProperty(self, @"playCommands", &unk_1EFD73568);
}

- (void)setPlayCommands:(id)a3
{
}

@end