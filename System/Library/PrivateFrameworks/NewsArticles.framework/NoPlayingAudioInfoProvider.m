@interface NoPlayingAudioInfoProvider
- (id)currentlyPlaying;
@end

@implementation NoPlayingAudioInfoProvider

- (id)currentlyPlaying
{
  return *(id *)self->currentlyPlaying;
}

@end