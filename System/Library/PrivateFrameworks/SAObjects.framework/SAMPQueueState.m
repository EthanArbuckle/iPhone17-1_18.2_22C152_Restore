@interface SAMPQueueState
+ (id)queueState;
- (BOOL)currentItemSteerable;
- (NSDictionary)currentListeningToContainer;
- (NSNumber)playbackRate;
- (NSNumber)shuffleEnabled;
- (NSString)applicationIdentifier;
- (NSString)source;
- (SAMPMediaItem)listeningToItem;
- (SAMPMediaItem)nextListeningToItem;
- (SAMPMediaItem)previousListenedToItem;
- (SAMPNowPlayingQueuePosition)playbackQueuePosition;
- (SANPCommandInfo)nowPlayingCommandInfo;
- (SANPVideoAudioAndSubtitleLanguageOptions)audioAndSubtitleLanguageOptions;
- (id)encodedClassName;
- (id)groupIdentifier;
- (int)state;
- (void)setApplicationIdentifier:(id)a3;
- (void)setAudioAndSubtitleLanguageOptions:(id)a3;
- (void)setCurrentItemSteerable:(BOOL)a3;
- (void)setCurrentListeningToContainer:(id)a3;
- (void)setListeningToItem:(id)a3;
- (void)setNextListeningToItem:(id)a3;
- (void)setNowPlayingCommandInfo:(id)a3;
- (void)setPlaybackQueuePosition:(id)a3;
- (void)setPlaybackRate:(id)a3;
- (void)setPreviousListenedToItem:(id)a3;
- (void)setShuffleEnabled:(id)a3;
- (void)setSource:(id)a3;
- (void)setState:(int)a3;
@end

@implementation SAMPQueueState

- (id)groupIdentifier
{
  return @"com.apple.ace.media";
}

- (id)encodedClassName
{
  return @"QueueState";
}

+ (id)queueState
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSString)applicationIdentifier
{
  return (NSString *)[(AceObject *)self propertyForKey:@"applicationIdentifier"];
}

- (void)setApplicationIdentifier:(id)a3
{
}

- (SANPVideoAudioAndSubtitleLanguageOptions)audioAndSubtitleLanguageOptions
{
  return (SANPVideoAudioAndSubtitleLanguageOptions *)AceObjectAceObjectForProperty(self, @"audioAndSubtitleLanguageOptions");
}

- (void)setAudioAndSubtitleLanguageOptions:(id)a3
{
}

- (BOOL)currentItemSteerable
{
  return AceObjectBoolForProperty(self, @"currentItemSteerable");
}

- (void)setCurrentItemSteerable:(BOOL)a3
{
}

- (NSDictionary)currentListeningToContainer
{
  return (NSDictionary *)[(AceObject *)self propertyForKey:@"currentListeningToContainer"];
}

- (void)setCurrentListeningToContainer:(id)a3
{
}

- (SAMPMediaItem)listeningToItem
{
  return (SAMPMediaItem *)AceObjectAceObjectForProperty(self, @"listeningToItem");
}

- (void)setListeningToItem:(id)a3
{
}

- (SAMPMediaItem)nextListeningToItem
{
  return (SAMPMediaItem *)AceObjectAceObjectForProperty(self, @"nextListeningToItem");
}

- (void)setNextListeningToItem:(id)a3
{
}

- (SANPCommandInfo)nowPlayingCommandInfo
{
  return (SANPCommandInfo *)AceObjectAceObjectForProperty(self, @"nowPlayingCommandInfo");
}

- (void)setNowPlayingCommandInfo:(id)a3
{
}

- (SAMPNowPlayingQueuePosition)playbackQueuePosition
{
  return (SAMPNowPlayingQueuePosition *)AceObjectAceObjectForProperty(self, @"playbackQueuePosition");
}

- (void)setPlaybackQueuePosition:(id)a3
{
}

- (NSNumber)playbackRate
{
  return (NSNumber *)[(AceObject *)self propertyForKey:@"playbackRate"];
}

- (void)setPlaybackRate:(id)a3
{
}

- (SAMPMediaItem)previousListenedToItem
{
  return (SAMPMediaItem *)AceObjectAceObjectForProperty(self, @"previousListenedToItem");
}

- (void)setPreviousListenedToItem:(id)a3
{
}

- (NSNumber)shuffleEnabled
{
  return (NSNumber *)[(AceObject *)self propertyForKey:@"shuffleEnabled"];
}

- (void)setShuffleEnabled:(id)a3
{
}

- (NSString)source
{
  return (NSString *)[(AceObject *)self propertyForKey:@"source"];
}

- (void)setSource:(id)a3
{
}

- (int)state
{
  id v2 = [(AceObject *)self propertyForKey:@"state"];
  int v3 = SAMPPlayStateForString(v2);

  return v3;
}

- (void)setState:(int)a3
{
  stringForSAMPPlayState(a3);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  AceObjectSetCopyingObjectForProperty(self, @"state", v4);
}

@end