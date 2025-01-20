@interface _TUIVideoPlaybackChecks
- (BOOL)assetKeysLoaded;
- (BOOL)complete;
- (BOOL)itemIsReadyToPlay;
- (BOOL)playbackLikelyToKeepUp;
- (BOOL)playerHasNoWaitingReason;
- (id)description;
- (void)reset;
- (void)setAssetKeysLoaded:(BOOL)a3;
- (void)setItemIsReadyToPlay:(BOOL)a3;
- (void)setPlaybackLikelyToKeepUp:(BOOL)a3;
- (void)setPlayerHasNoWaitingReason:(BOOL)a3;
@end

@implementation _TUIVideoPlaybackChecks

- (BOOL)complete
{
  return self->_assetKeysLoaded
      && self->_playbackLikelyToKeepUp
      && self->_itemIsReadyToPlay
      && self->_playerHasNoWaitingReason;
}

- (void)reset
{
  *(_DWORD *)&self->_assetKeysLoaded = 0x1000000;
}

- (id)description
{
  return +[NSString stringWithFormat:@"<_TUIVideoPlaybackChecks assetKeysLoaded: %d, playbackLikelyToKeepUp: %d, itemIsReadyToPlay: %d, playerHasNoWaitingReason: %d>", self->_assetKeysLoaded, self->_playbackLikelyToKeepUp, self->_itemIsReadyToPlay, self->_playerHasNoWaitingReason];
}

- (void)setAssetKeysLoaded:(BOOL)a3
{
  if (self->_assetKeysLoaded != a3) {
    self->_assetKeysLoaded = a3;
  }
}

- (void)setPlaybackLikelyToKeepUp:(BOOL)a3
{
  if (self->_playbackLikelyToKeepUp != a3) {
    self->_playbackLikelyToKeepUp = a3;
  }
}

- (void)setItemIsReadyToPlay:(BOOL)a3
{
  if (self->_itemIsReadyToPlay != a3) {
    self->_itemIsReadyToPlay = a3;
  }
}

- (void)setPlayerHasNoWaitingReason:(BOOL)a3
{
  if (self->_playerHasNoWaitingReason != a3) {
    self->_playerHasNoWaitingReason = a3;
  }
}

- (BOOL)assetKeysLoaded
{
  return self->_assetKeysLoaded;
}

- (BOOL)playbackLikelyToKeepUp
{
  return self->_playbackLikelyToKeepUp;
}

- (BOOL)itemIsReadyToPlay
{
  return self->_itemIsReadyToPlay;
}

- (BOOL)playerHasNoWaitingReason
{
  return self->_playerHasNoWaitingReason;
}

@end