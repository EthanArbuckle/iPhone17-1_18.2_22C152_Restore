@interface PUBrowsingVideoPlayerChange
- (BOOL)audioSessionVolumeIncreaseDidOccur;
- (BOOL)audioStatusDidChange;
- (BOOL)avPlayerDidChange;
- (BOOL)desiredPlayStateDidChange;
- (BOOL)durationDidChange;
- (BOOL)errorDidChange;
- (BOOL)hasChanges;
- (BOOL)isActivatedDidChange;
- (BOOL)isAtBeginningDidChange;
- (BOOL)isAtEndDidChange;
- (BOOL)isPlayableDidChange;
- (BOOL)isPlayerLoadingAllowedDidChange;
- (BOOL)isStalledDidChange;
- (BOOL)playStateDidChange;
- (BOOL)playerItemDidChange;
- (void)_setAVPlayerDidChange:(BOOL)a3;
- (void)_setActivatedDidChange:(BOOL)a3;
- (void)_setAtBeginningDidChange:(BOOL)a3;
- (void)_setAtEndDidChange:(BOOL)a3;
- (void)_setAudioSessionVolumeIncreaseDidOccur:(BOOL)a3;
- (void)_setAudioStatusDidChange:(BOOL)a3;
- (void)_setDesiredPlayStateDidChange:(BOOL)a3;
- (void)_setErrorDidChange:(BOOL)a3;
- (void)_setPlayStateDidChange:(BOOL)a3;
- (void)_setPlayableDidChange:(BOOL)a3;
- (void)_setPlayerItemDidChange:(BOOL)a3;
- (void)_setPlayerLoadingAllowedDidChange:(BOOL)a3;
- (void)_setStalledDidChange:(BOOL)a3;
- (void)setDurationDidChange:(BOOL)a3;
@end

@implementation PUBrowsingVideoPlayerChange

- (void)_setAudioSessionVolumeIncreaseDidOccur:(BOOL)a3
{
  self->_playerItemDidChange = a3;
}

- (BOOL)audioSessionVolumeIncreaseDidOccur
{
  return self->_playerItemDidChange;
}

- (void)_setAudioStatusDidChange:(BOOL)a3
{
  self->_avPlayerDidChange = a3;
}

- (BOOL)audioStatusDidChange
{
  return self->_avPlayerDidChange;
}

- (void)_setPlayableDidChange:(BOOL)a3
{
  self->_isPlayerLoadingAllowedDidChange = a3;
}

- (BOOL)isPlayableDidChange
{
  return self->_isPlayerLoadingAllowedDidChange;
}

- (void)_setStalledDidChange:(BOOL)a3
{
  self->_isActivatedDidChange = a3;
}

- (BOOL)isStalledDidChange
{
  return self->_isActivatedDidChange;
}

- (void)_setAtEndDidChange:(BOOL)a3
{
  self->_desiredPlayStateDidChange = a3;
}

- (BOOL)isAtEndDidChange
{
  return self->_desiredPlayStateDidChange;
}

- (void)_setAtBeginningDidChange:(BOOL)a3
{
  self->_playStateDidChange = a3;
}

- (BOOL)isAtBeginningDidChange
{
  return self->_playStateDidChange;
}

- (void)_setErrorDidChange:(BOOL)a3
{
  self->_durationDidChange = a3;
}

- (BOOL)errorDidChange
{
  return self->_durationDidChange;
}

- (void)_setPlayerItemDidChange:(BOOL)a3
{
  *(&self->super._hasChanges + 7) = a3;
}

- (BOOL)playerItemDidChange
{
  return *(&self->super._hasChanges + 7);
}

- (void)_setAVPlayerDidChange:(BOOL)a3
{
  *(&self->super._hasChanges + 6) = a3;
}

- (BOOL)avPlayerDidChange
{
  return *(&self->super._hasChanges + 6);
}

- (void)_setPlayerLoadingAllowedDidChange:(BOOL)a3
{
  *(&self->super._hasChanges + 5) = a3;
}

- (BOOL)isPlayerLoadingAllowedDidChange
{
  return *(&self->super._hasChanges + 5);
}

- (void)_setActivatedDidChange:(BOOL)a3
{
  *(&self->super._hasChanges + 4) = a3;
}

- (BOOL)isActivatedDidChange
{
  return *(&self->super._hasChanges + 4);
}

- (void)_setDesiredPlayStateDidChange:(BOOL)a3
{
  *(&self->super._hasChanges + 3) = a3;
}

- (BOOL)desiredPlayStateDidChange
{
  return *(&self->super._hasChanges + 3);
}

- (void)_setPlayStateDidChange:(BOOL)a3
{
  *(&self->super._hasChanges + 2) = a3;
}

- (BOOL)playStateDidChange
{
  return *(&self->super._hasChanges + 2);
}

- (void)setDurationDidChange:(BOOL)a3
{
  *(&self->super._hasChanges + 1) = a3;
}

- (BOOL)durationDidChange
{
  return *(&self->super._hasChanges + 1);
}

- (BOOL)hasChanges
{
  v4.receiver = self;
  v4.super_class = (Class)PUBrowsingVideoPlayerChange;
  return [(PUViewModelChange *)&v4 hasChanges]
      || [(PUBrowsingVideoPlayerChange *)self playStateDidChange]
      || [(PUBrowsingVideoPlayerChange *)self desiredPlayStateDidChange]
      || [(PUBrowsingVideoPlayerChange *)self isActivatedDidChange]
      || [(PUBrowsingVideoPlayerChange *)self isPlayerLoadingAllowedDidChange]
      || [(PUBrowsingVideoPlayerChange *)self avPlayerDidChange]
      || [(PUBrowsingVideoPlayerChange *)self playerItemDidChange]
      || [(PUBrowsingVideoPlayerChange *)self errorDidChange]
      || [(PUBrowsingVideoPlayerChange *)self isAtBeginningDidChange]
      || [(PUBrowsingVideoPlayerChange *)self isAtEndDidChange]
      || [(PUBrowsingVideoPlayerChange *)self isStalledDidChange]
      || [(PUBrowsingVideoPlayerChange *)self isPlayableDidChange]
      || [(PUBrowsingVideoPlayerChange *)self audioStatusDidChange]
      || [(PUBrowsingVideoPlayerChange *)self audioSessionVolumeIncreaseDidOccur];
}

@end