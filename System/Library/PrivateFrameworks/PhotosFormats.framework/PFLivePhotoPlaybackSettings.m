@interface PFLivePhotoPlaybackSettings
- (AVVideoComposition)videoComposition;
- (PFLivePhotoPlaybackSettings)init;
- (float)audioVolume;
- (void)setAudioVolume:(float)a3;
- (void)setVideoComposition:(id)a3;
@end

@implementation PFLivePhotoPlaybackSettings

- (void).cxx_destruct
{
}

- (void)setAudioVolume:(float)a3
{
  self->_audioVolume = a3;
}

- (float)audioVolume
{
  return self->_audioVolume;
}

- (void)setVideoComposition:(id)a3
{
}

- (AVVideoComposition)videoComposition
{
  return self->_videoComposition;
}

- (PFLivePhotoPlaybackSettings)init
{
  v3.receiver = self;
  v3.super_class = (Class)PFLivePhotoPlaybackSettings;
  result = [(PFLivePhotoPlaybackSettings *)&v3 init];
  result->_audioVolume = 1.0;
  return result;
}

@end