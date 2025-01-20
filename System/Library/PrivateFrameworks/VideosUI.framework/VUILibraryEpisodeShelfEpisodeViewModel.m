@interface VUILibraryEpisodeShelfEpisodeViewModel
- (VUIMediaEntityAssetController)assetController;
- (VUIMediaItem)episode;
- (void)setAssetController:(id)a3;
- (void)setEpisode:(id)a3;
@end

@implementation VUILibraryEpisodeShelfEpisodeViewModel

- (VUIMediaItem)episode
{
  return self->_episode;
}

- (void)setEpisode:(id)a3
{
}

- (VUIMediaEntityAssetController)assetController
{
  return self->_assetController;
}

- (void)setAssetController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetController, 0);
  objc_storeStrong((id *)&self->_episode, 0);
}

@end