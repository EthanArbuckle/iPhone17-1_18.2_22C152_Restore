@interface MTPAFPlaylistKitBinding
- (MTPAFKit)pafKit;
- (MTPAFPlaylist)playlist;
- (void)setPafKit:(id)a3;
- (void)setPlaylist:(id)a3;
@end

@implementation MTPAFPlaylistKitBinding

- (MTPAFPlaylist)playlist
{
  return self->_playlist;
}

- (void)setPlaylist:(id)a3
{
}

- (MTPAFKit)pafKit
{
  return self->_pafKit;
}

- (void)setPafKit:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pafKit, 0);

  objc_storeStrong((id *)&self->_playlist, 0);
}

@end