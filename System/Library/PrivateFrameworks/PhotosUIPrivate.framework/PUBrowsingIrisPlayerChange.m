@interface PUBrowsingIrisPlayerChange
- (BOOL)activatedDidChange;
- (BOOL)currentlyDisplayedTimesDidChange;
- (BOOL)hasChanges;
- (BOOL)imageLoadingEnabledDidChange;
- (BOOL)isLivePhotoLoadingAllowedDidChange;
- (BOOL)isLivePhotoPlaybackAllowedDidChange;
- (BOOL)livePhotoDidChange;
- (BOOL)playbackStateDidChange;
- (BOOL)playerDidChange;
- (BOOL)playingDidChange;
- (BOOL)scrubbingPhotoTimeDidChange;
- (BOOL)vitalityTransformDidChange;
- (void)setActivatedDidChange:(BOOL)a3;
- (void)setCurrentlyDisplayedTimesDidChange:(BOOL)a3;
- (void)setImageLoadingEnabledDidChange:(BOOL)a3;
- (void)setIsLivePhotoLoadingAllowedDidChange:(BOOL)a3;
- (void)setIsLivePhotoPlaybackAllowedDidChange:(BOOL)a3;
- (void)setLivePhotoDidChange:(BOOL)a3;
- (void)setPlaybackStateDidChange:(BOOL)a3;
- (void)setPlayerDidChange:(BOOL)a3;
- (void)setPlayingDidChange:(BOOL)a3;
- (void)setScrubbingPhotoTimeDidChange:(BOOL)a3;
- (void)setVitalityTransformDidChange:(BOOL)a3;
@end

@implementation PUBrowsingIrisPlayerChange

- (void)setImageLoadingEnabledDidChange:(BOOL)a3
{
  self->_playerDidChange = a3;
}

- (BOOL)imageLoadingEnabledDidChange
{
  return self->_playerDidChange;
}

- (void)setVitalityTransformDidChange:(BOOL)a3
{
  self->_livePhotoDidChange = a3;
}

- (BOOL)vitalityTransformDidChange
{
  return self->_livePhotoDidChange;
}

- (void)setPlayingDidChange:(BOOL)a3
{
  self->_isLivePhotoLoadingAllowedDidChange = a3;
}

- (BOOL)playingDidChange
{
  return self->_isLivePhotoLoadingAllowedDidChange;
}

- (void)setCurrentlyDisplayedTimesDidChange:(BOOL)a3
{
  self->_isLivePhotoPlaybackAllowedDidChange = a3;
}

- (BOOL)currentlyDisplayedTimesDidChange
{
  return self->_isLivePhotoPlaybackAllowedDidChange;
}

- (void)setScrubbingPhotoTimeDidChange:(BOOL)a3
{
  *(&self->super._hasChanges + 7) = a3;
}

- (BOOL)scrubbingPhotoTimeDidChange
{
  return *(&self->super._hasChanges + 7);
}

- (void)setActivatedDidChange:(BOOL)a3
{
  *(&self->super._hasChanges + 6) = a3;
}

- (BOOL)activatedDidChange
{
  return *(&self->super._hasChanges + 6);
}

- (void)setPlaybackStateDidChange:(BOOL)a3
{
  *(&self->super._hasChanges + 5) = a3;
}

- (BOOL)playbackStateDidChange
{
  return *(&self->super._hasChanges + 5);
}

- (void)setPlayerDidChange:(BOOL)a3
{
  *(&self->super._hasChanges + 4) = a3;
}

- (BOOL)playerDidChange
{
  return *(&self->super._hasChanges + 4);
}

- (void)setLivePhotoDidChange:(BOOL)a3
{
  *(&self->super._hasChanges + 3) = a3;
}

- (BOOL)livePhotoDidChange
{
  return *(&self->super._hasChanges + 3);
}

- (void)setIsLivePhotoLoadingAllowedDidChange:(BOOL)a3
{
  *(&self->super._hasChanges + 2) = a3;
}

- (BOOL)isLivePhotoLoadingAllowedDidChange
{
  return *(&self->super._hasChanges + 2);
}

- (void)setIsLivePhotoPlaybackAllowedDidChange:(BOOL)a3
{
  *(&self->super._hasChanges + 1) = a3;
}

- (BOOL)isLivePhotoPlaybackAllowedDidChange
{
  return *(&self->super._hasChanges + 1);
}

- (BOOL)hasChanges
{
  v4.receiver = self;
  v4.super_class = (Class)PUBrowsingIrisPlayerChange;
  return [(PUViewModelChange *)&v4 hasChanges]
      || [(PUBrowsingIrisPlayerChange *)self isLivePhotoLoadingAllowedDidChange]
      || [(PUBrowsingIrisPlayerChange *)self isLivePhotoPlaybackAllowedDidChange]
      || [(PUBrowsingIrisPlayerChange *)self playerDidChange]
      || [(PUBrowsingIrisPlayerChange *)self playbackStateDidChange]
      || [(PUBrowsingIrisPlayerChange *)self livePhotoDidChange]
      || [(PUBrowsingIrisPlayerChange *)self activatedDidChange]
      || [(PUBrowsingIrisPlayerChange *)self scrubbingPhotoTimeDidChange]
      || [(PUBrowsingIrisPlayerChange *)self currentlyDisplayedTimesDidChange]
      || [(PUBrowsingIrisPlayerChange *)self playingDidChange]
      || [(PUBrowsingIrisPlayerChange *)self vitalityTransformDidChange]
      || [(PUBrowsingIrisPlayerChange *)self imageLoadingEnabledDidChange];
}

@end