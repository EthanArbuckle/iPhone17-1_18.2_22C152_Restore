@interface SKUIMediaPlayer
- (BOOL)playing;
- (MPAVController)player;
- (MPAVItem)currentItem;
- (SKUIMediaPlayerItemStatus)playerItem;
- (float)rate;
- (id)periodicTimeObserver;
- (void)setCurrentItem:(id)a3;
- (void)setPeriodicTimeObserver:(id)a3;
- (void)setPlayer:(id)a3;
- (void)setPlayerItem:(id)a3;
- (void)setPlaying:(BOOL)a3;
- (void)setRate:(float)a3;
@end

@implementation SKUIMediaPlayer

- (SKUIMediaPlayerItemStatus)playerItem
{
  return self->_playerItem;
}

- (void)setPlayerItem:(id)a3
{
}

- (MPAVController)player
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_player);

  return (MPAVController *)WeakRetained;
}

- (void)setPlayer:(id)a3
{
}

- (MPAVItem)currentItem
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_currentItem);

  return (MPAVItem *)WeakRetained;
}

- (void)setCurrentItem:(id)a3
{
}

- (float)rate
{
  return self->_rate;
}

- (void)setRate:(float)a3
{
  self->_rate = a3;
}

- (id)periodicTimeObserver
{
  return self->_periodicTimeObserver;
}

- (void)setPeriodicTimeObserver:(id)a3
{
}

- (BOOL)playing
{
  return self->_playing;
}

- (void)setPlaying:(BOOL)a3
{
  self->_playing = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_periodicTimeObserver, 0);
  objc_destroyWeak((id *)&self->_currentItem);
  objc_destroyWeak((id *)&self->_player);

  objc_storeStrong((id *)&self->_playerItem, 0);
}

@end