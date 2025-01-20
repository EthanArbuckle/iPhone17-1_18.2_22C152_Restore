@interface _PUBrowsingVideoOutputPlayerReference
- (PUBrowsingVideoPlayer)player;
- (void)setPlayer:(id)a3;
@end

@implementation _PUBrowsingVideoOutputPlayerReference

- (void).cxx_destruct
{
}

- (void)setPlayer:(id)a3
{
}

- (PUBrowsingVideoPlayer)player
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_player);
  return (PUBrowsingVideoPlayer *)WeakRetained;
}

@end