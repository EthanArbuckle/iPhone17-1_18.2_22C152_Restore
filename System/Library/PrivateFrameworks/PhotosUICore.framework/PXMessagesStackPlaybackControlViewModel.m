@interface PXMessagesStackPlaybackControlViewModel
- (BOOL)isSettled;
- (PXGDisplayAssetVideoPresentationController)videoController;
- (int64_t)currentItem;
- (void)setCurrentItem:(int64_t)a3;
- (void)setSettled:(BOOL)a3;
- (void)setVideoController:(id)a3;
@end

@implementation PXMessagesStackPlaybackControlViewModel

- (void).cxx_destruct
{
}

- (PXGDisplayAssetVideoPresentationController)videoController
{
  return self->_videoController;
}

- (int64_t)currentItem
{
  return self->_currentItem;
}

- (BOOL)isSettled
{
  return self->_settled;
}

- (void)setVideoController:(id)a3
{
  v5 = (PXGDisplayAssetVideoPresentationController *)a3;
  if (self->_videoController != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_videoController, a3);
    [(PXMessagesStackPlaybackControlViewModel *)self signalChange:4];
    v5 = v6;
  }
}

- (void)setCurrentItem:(int64_t)a3
{
  if (self->_currentItem != a3)
  {
    self->_currentItem = a3;
    [(PXMessagesStackPlaybackControlViewModel *)self signalChange:2];
  }
}

- (void)setSettled:(BOOL)a3
{
  if (self->_settled != a3)
  {
    self->_settled = a3;
    [(PXMessagesStackPlaybackControlViewModel *)self signalChange:1];
  }
}

@end