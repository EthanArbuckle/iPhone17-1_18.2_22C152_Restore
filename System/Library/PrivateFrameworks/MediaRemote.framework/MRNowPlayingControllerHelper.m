@interface MRNowPlayingControllerHelper
- (id)clientPropertiesDidChange;
- (id)contentItemsDidLoadArtwork;
- (id)contentItemsDidUpdate;
- (id)didFailWithError;
- (id)didInvalidate;
- (id)didLoadResponse;
- (id)playbackQueueDidChange;
- (id)playbackRateDidChange;
- (id)playbackStateDidChange;
- (id)playerLastPlayingDateDidChange;
- (id)playerPathDidChange;
- (id)supportedCommandsDidChange;
- (void)controller:(id)a3 clientPropertiesDidChangeFrom:(id)a4 to:(id)a5;
- (void)controller:(id)a3 contentItemsDidUpdateWithContentItemChanges:(id)a4;
- (void)controller:(id)a3 didFailWithError:(id)a4;
- (void)controller:(id)a3 didLoadArtworkForContentItems:(id)a4;
- (void)controller:(id)a3 didLoadResponse:(id)a4;
- (void)controller:(id)a3 playbackQueueDidChangeFrom:(id)a4 to:(id)a5;
- (void)controller:(id)a3 playbackRateDidChangeFrom:(float)a4 to:(float)a5;
- (void)controller:(id)a3 playbackStateDidChangeFrom:(unsigned int)a4 to:(unsigned int)a5;
- (void)controller:(id)a3 playerLastPlayingDateDidChange:(id)a4;
- (void)controller:(id)a3 playerPathDidChange:(id)a4;
- (void)controller:(id)a3 supportedCommandsDidChangeFrom:(id)a4 to:(id)a5;
- (void)controllerWillReloadForInvalidation:(id)a3;
- (void)setClientPropertiesDidChange:(id)a3;
- (void)setContentItemsDidLoadArtwork:(id)a3;
- (void)setContentItemsDidUpdate:(id)a3;
- (void)setDidFailWithError:(id)a3;
- (void)setDidInvalidate:(id)a3;
- (void)setDidLoadResponse:(id)a3;
- (void)setPlaybackQueueDidChange:(id)a3;
- (void)setPlaybackRateDidChange:(id)a3;
- (void)setPlaybackStateDidChange:(id)a3;
- (void)setPlayerLastPlayingDateDidChange:(id)a3;
- (void)setPlayerPathDidChange:(id)a3;
- (void)setSupportedCommandsDidChange:(id)a3;
@end

@implementation MRNowPlayingControllerHelper

- (void)controller:(id)a3 didLoadResponse:(id)a4
{
  didLoadResponse = (void (**)(id, id))self->_didLoadResponse;
  if (didLoadResponse) {
    didLoadResponse[2](didLoadResponse, a4);
  }
}

- (void)controller:(id)a3 playbackStateDidChangeFrom:(unsigned int)a4 to:(unsigned int)a5
{
  playbackStateDidChange = (void (**)(id, void))self->_playbackStateDidChange;
  if (playbackStateDidChange) {
    playbackStateDidChange[2](playbackStateDidChange, *(void *)&a5);
  }
}

- (void)controller:(id)a3 playbackRateDidChangeFrom:(float)a4 to:(float)a5
{
  playbackRateDidChange = (void (**)(float))self->_playbackRateDidChange;
  if (playbackRateDidChange) {
    playbackRateDidChange[2](a5);
  }
}

- (void)controller:(id)a3 playbackQueueDidChangeFrom:(id)a4 to:(id)a5
{
  playbackQueueDidChange = (void (**)(id, id))self->_playbackQueueDidChange;
  if (playbackQueueDidChange) {
    playbackQueueDidChange[2](playbackQueueDidChange, a5);
  }
}

- (void)controller:(id)a3 contentItemsDidUpdateWithContentItemChanges:(id)a4
{
  contentItemsDidUpdate = (void (**)(id, id))self->_contentItemsDidUpdate;
  if (contentItemsDidUpdate) {
    contentItemsDidUpdate[2](contentItemsDidUpdate, a4);
  }
}

- (void)controller:(id)a3 didLoadArtworkForContentItems:(id)a4
{
  contentItemsDidLoadArtwork = (void (**)(id, id))self->_contentItemsDidLoadArtwork;
  if (contentItemsDidLoadArtwork) {
    contentItemsDidLoadArtwork[2](contentItemsDidLoadArtwork, a4);
  }
}

- (void)controller:(id)a3 supportedCommandsDidChangeFrom:(id)a4 to:(id)a5
{
  supportedCommandsDidChange = (void (**)(id, id))self->_supportedCommandsDidChange;
  if (supportedCommandsDidChange) {
    supportedCommandsDidChange[2](supportedCommandsDidChange, a5);
  }
}

- (void)controller:(id)a3 playerLastPlayingDateDidChange:(id)a4
{
  playerLastPlayingDateDidChange = (void (**)(id, id))self->_playerLastPlayingDateDidChange;
  if (playerLastPlayingDateDidChange) {
    playerLastPlayingDateDidChange[2](playerLastPlayingDateDidChange, a4);
  }
}

- (void)controller:(id)a3 clientPropertiesDidChangeFrom:(id)a4 to:(id)a5
{
  clientPropertiesDidChange = (void (**)(id, id))self->_clientPropertiesDidChange;
  if (clientPropertiesDidChange) {
    clientPropertiesDidChange[2](clientPropertiesDidChange, a5);
  }
}

- (void)controller:(id)a3 playerPathDidChange:(id)a4
{
  playerPathDidChange = (void (**)(id, id))self->_playerPathDidChange;
  if (playerPathDidChange) {
    playerPathDidChange[2](playerPathDidChange, a4);
  }
}

- (void)controllerWillReloadForInvalidation:(id)a3
{
  didInvalidate = (void (**)(void))self->_didInvalidate;
  if (didInvalidate) {
    didInvalidate[2]();
  }
}

- (void)controller:(id)a3 didFailWithError:(id)a4
{
  didFailWithError = (void (**)(id, id))self->_didFailWithError;
  if (didFailWithError) {
    didFailWithError[2](didFailWithError, a4);
  }
}

- (id)didLoadResponse
{
  return self->_didLoadResponse;
}

- (void)setDidLoadResponse:(id)a3
{
}

- (id)playbackStateDidChange
{
  return self->_playbackStateDidChange;
}

- (void)setPlaybackStateDidChange:(id)a3
{
}

- (id)playbackRateDidChange
{
  return self->_playbackRateDidChange;
}

- (void)setPlaybackRateDidChange:(id)a3
{
}

- (id)playbackQueueDidChange
{
  return self->_playbackQueueDidChange;
}

- (void)setPlaybackQueueDidChange:(id)a3
{
}

- (id)contentItemsDidUpdate
{
  return self->_contentItemsDidUpdate;
}

- (void)setContentItemsDidUpdate:(id)a3
{
}

- (id)contentItemsDidLoadArtwork
{
  return self->_contentItemsDidLoadArtwork;
}

- (void)setContentItemsDidLoadArtwork:(id)a3
{
}

- (id)supportedCommandsDidChange
{
  return self->_supportedCommandsDidChange;
}

- (void)setSupportedCommandsDidChange:(id)a3
{
}

- (id)playerLastPlayingDateDidChange
{
  return self->_playerLastPlayingDateDidChange;
}

- (void)setPlayerLastPlayingDateDidChange:(id)a3
{
}

- (id)clientPropertiesDidChange
{
  return self->_clientPropertiesDidChange;
}

- (void)setClientPropertiesDidChange:(id)a3
{
}

- (id)playerPathDidChange
{
  return self->_playerPathDidChange;
}

- (void)setPlayerPathDidChange:(id)a3
{
}

- (id)didInvalidate
{
  return self->_didInvalidate;
}

- (void)setDidInvalidate:(id)a3
{
}

- (id)didFailWithError
{
  return self->_didFailWithError;
}

- (void)setDidFailWithError:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_didFailWithError, 0);
  objc_storeStrong(&self->_didInvalidate, 0);
  objc_storeStrong(&self->_playerPathDidChange, 0);
  objc_storeStrong(&self->_clientPropertiesDidChange, 0);
  objc_storeStrong(&self->_playerLastPlayingDateDidChange, 0);
  objc_storeStrong(&self->_supportedCommandsDidChange, 0);
  objc_storeStrong(&self->_contentItemsDidLoadArtwork, 0);
  objc_storeStrong(&self->_contentItemsDidUpdate, 0);
  objc_storeStrong(&self->_playbackQueueDidChange, 0);
  objc_storeStrong(&self->_playbackRateDidChange, 0);
  objc_storeStrong(&self->_playbackStateDidChange, 0);

  objc_storeStrong(&self->_didLoadResponse, 0);
}

@end