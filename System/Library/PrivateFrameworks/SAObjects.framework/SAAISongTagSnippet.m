@interface SAAISongTagSnippet
+ (id)songTagSnippet;
- (SAAISongTag)songTag;
- (SAMPPlaybackButton)playbackButton;
- (SAUIAppPunchOut)attributionPunchOut;
- (SAUIAppPunchOut)purchaseSongPunchOut;
- (SAUIAppPunchOut)songDetailsPunchOut;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setAttributionPunchOut:(id)a3;
- (void)setPlaybackButton:(id)a3;
- (void)setPurchaseSongPunchOut:(id)a3;
- (void)setSongDetailsPunchOut:(id)a3;
- (void)setSongTag:(id)a3;
@end

@implementation SAAISongTagSnippet

- (id)groupIdentifier
{
  return @"com.apple.ace.acousticid";
}

- (id)encodedClassName
{
  return @"SongTagSnippet";
}

+ (id)songTagSnippet
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (SAUIAppPunchOut)attributionPunchOut
{
  return (SAUIAppPunchOut *)AceObjectAceObjectForProperty(self, @"attributionPunchOut");
}

- (void)setAttributionPunchOut:(id)a3
{
}

- (SAMPPlaybackButton)playbackButton
{
  return (SAMPPlaybackButton *)AceObjectAceObjectForProperty(self, @"playbackButton");
}

- (void)setPlaybackButton:(id)a3
{
}

- (SAUIAppPunchOut)purchaseSongPunchOut
{
  return (SAUIAppPunchOut *)AceObjectAceObjectForProperty(self, @"purchaseSongPunchOut");
}

- (void)setPurchaseSongPunchOut:(id)a3
{
}

- (SAUIAppPunchOut)songDetailsPunchOut
{
  return (SAUIAppPunchOut *)AceObjectAceObjectForProperty(self, @"songDetailsPunchOut");
}

- (void)setSongDetailsPunchOut:(id)a3
{
}

- (SAAISongTag)songTag
{
  return (SAAISongTag *)AceObjectAceObjectForProperty(self, @"songTag");
}

- (void)setSongTag:(id)a3
{
}

@end