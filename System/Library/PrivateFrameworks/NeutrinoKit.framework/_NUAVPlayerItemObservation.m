@interface _NUAVPlayerItemObservation
- (AVPlayerItem)playerItem;
- (BOOL)registeredKVO;
- (void)setPlayerItem:(id)a3;
- (void)setRegisteredKVO:(BOOL)a3;
@end

@implementation _NUAVPlayerItemObservation

- (void).cxx_destruct
{
}

- (void)setRegisteredKVO:(BOOL)a3
{
  self->_registeredKVO = a3;
}

- (BOOL)registeredKVO
{
  return self->_registeredKVO;
}

- (void)setPlayerItem:(id)a3
{
}

- (AVPlayerItem)playerItem
{
  return self->_playerItem;
}

@end