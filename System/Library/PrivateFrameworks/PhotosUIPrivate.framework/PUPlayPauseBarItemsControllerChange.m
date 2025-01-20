@interface PUPlayPauseBarItemsControllerChange
- (BOOL)currentPlaybackTimeDidChange;
- (BOOL)hasChanges;
- (BOOL)playPauseStateDidChange;
- (BOOL)playbackDurationDidChange;
- (void)_setCurrentPlaybackTimeDidChange:(BOOL)a3;
- (void)_setPlayPauseStateDidChange:(BOOL)a3;
- (void)_setPlaybackDurationDidChange:(BOOL)a3;
@end

@implementation PUPlayPauseBarItemsControllerChange

- (void)_setPlaybackDurationDidChange:(BOOL)a3
{
  self->_playbackDurationDidChange = a3;
}

- (BOOL)playbackDurationDidChange
{
  return self->_playbackDurationDidChange;
}

- (void)_setCurrentPlaybackTimeDidChange:(BOOL)a3
{
  self->_currentPlaybackTimeDidChange = a3;
}

- (BOOL)currentPlaybackTimeDidChange
{
  return self->_currentPlaybackTimeDidChange;
}

- (void)_setPlayPauseStateDidChange:(BOOL)a3
{
  self->_playPauseStateDidChange = a3;
}

- (BOOL)playPauseStateDidChange
{
  return self->_playPauseStateDidChange;
}

- (BOOL)hasChanges
{
  if ([(PUPlayPauseBarItemsControllerChange *)self playPauseStateDidChange]
    || [(PUPlayPauseBarItemsControllerChange *)self currentPlaybackTimeDidChange])
  {
    return 1;
  }
  return [(PUPlayPauseBarItemsControllerChange *)self playbackDurationDidChange];
}

@end