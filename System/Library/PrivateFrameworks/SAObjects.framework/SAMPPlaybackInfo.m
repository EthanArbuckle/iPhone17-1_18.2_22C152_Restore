@interface SAMPPlaybackInfo
+ (id)playbackInfo;
- (BOOL)rememberPlaybackPosition;
- (SACalendar)lastPlayedDate;
- (id)encodedClassName;
- (id)groupIdentifier;
- (int64_t)durationMillis;
- (int64_t)playbackPositionMillis;
- (int64_t)plays;
- (void)setDurationMillis:(int64_t)a3;
- (void)setLastPlayedDate:(id)a3;
- (void)setPlaybackPositionMillis:(int64_t)a3;
- (void)setPlays:(int64_t)a3;
- (void)setRememberPlaybackPosition:(BOOL)a3;
@end

@implementation SAMPPlaybackInfo

- (id)groupIdentifier
{
  return @"com.apple.ace.media";
}

- (id)encodedClassName
{
  return @"PlaybackInfo";
}

+ (id)playbackInfo
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (int64_t)durationMillis
{
  return AceObjectIntegerForProperty(self, @"durationMillis");
}

- (void)setDurationMillis:(int64_t)a3
{
}

- (SACalendar)lastPlayedDate
{
  return (SACalendar *)AceObjectAceObjectForProperty(self, @"lastPlayedDate");
}

- (void)setLastPlayedDate:(id)a3
{
}

- (int64_t)playbackPositionMillis
{
  return AceObjectIntegerForProperty(self, @"playbackPositionMillis");
}

- (void)setPlaybackPositionMillis:(int64_t)a3
{
}

- (int64_t)plays
{
  return AceObjectIntegerForProperty(self, @"plays");
}

- (void)setPlays:(int64_t)a3
{
}

- (BOOL)rememberPlaybackPosition
{
  return AceObjectBoolForProperty(self, @"rememberPlaybackPosition");
}

- (void)setRememberPlaybackPosition:(BOOL)a3
{
}

@end