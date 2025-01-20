@interface MusicKit_SoftLinking_MPCPlaybackEngine
- (BOOL)isAudioAnalyzerEnabled;
- (BOOL)isPictureInPictureSupported;
- (BOOL)isStarted;
- (BOOL)isStateRestorationSupported;
- (BOOL)isSystemMusicApplication;
- (BOOL)isVideoSupported;
- (MusicKit_SoftLinking_MPCPlaybackEngine)initWithPlayerID:(id)a3 options:(unint64_t)a4 fallbackPlaybackIntent:(id)a5;
- (NSString)playerID;
- (void)becomeActive;
- (void)musicKit_setAudioAnalyzerEnabled:(BOOL)a3;
- (void)musicKit_setPictureInPictureSupported:(BOOL)a3;
- (void)musicKit_setStateRestorationSupported:(BOOL)a3;
- (void)musicKit_setSystemMusicApplication:(BOOL)a3;
- (void)musicKit_setVideoSupported:(BOOL)a3;
- (void)restoreStateWithCompletion:(id)a3;
- (void)setAudioAnalyzerEnabled:(BOOL)a3;
- (void)setPictureInPictureSupported:(BOOL)a3;
- (void)setStateRestorationSupported:(BOOL)a3;
- (void)setSystemMusicApplication:(BOOL)a3;
- (void)setVideoSupported:(BOOL)a3;
- (void)start;
@end

@implementation MusicKit_SoftLinking_MPCPlaybackEngine

- (MusicKit_SoftLinking_MPCPlaybackEngine)initWithPlayerID:(id)a3 options:(unint64_t)a4 fallbackPlaybackIntent:(id)a5
{
  char v6 = a4;
  id v8 = a3;
  id v9 = a5;
  v18.receiver = self;
  v18.super_class = (Class)MusicKit_SoftLinking_MPCPlaybackEngine;
  v10 = [(MusicKit_SoftLinking_MPCPlaybackEngine *)&v18 init];
  if (v10)
  {
    uint64_t v20 = 0;
    v21 = &v20;
    uint64_t v22 = 0x2050000000;
    v11 = (void *)getMPCPlaybackEngineClass_softClass;
    uint64_t v23 = getMPCPlaybackEngineClass_softClass;
    if (!getMPCPlaybackEngineClass_softClass)
    {
      v19[0] = MEMORY[0x1E4F143A8];
      v19[1] = 3221225472;
      v19[2] = __getMPCPlaybackEngineClass_block_invoke;
      v19[3] = &unk_1E6D453B0;
      v19[4] = &v20;
      __getMPCPlaybackEngineClass_block_invoke((uint64_t)v19);
      v11 = (void *)v21[3];
    }
    v12 = v11;
    _Block_object_dispose(&v20, 8);
    uint64_t v13 = [[v12 alloc] initWithPlayerID:v8];
    underlyingPlaybackEngine = v10->_underlyingPlaybackEngine;
    v10->_underlyingPlaybackEngine = (MPCPlaybackEngine *)v13;

    if (v6)
    {
      [(MPCPlaybackEngine *)v10->_underlyingPlaybackEngine setSystemMusicApplication:1];
      if ((v6 & 2) == 0)
      {
LABEL_6:
        if ((v6 & 4) == 0) {
          goto LABEL_7;
        }
        goto LABEL_14;
      }
    }
    else if ((v6 & 2) == 0)
    {
      goto LABEL_6;
    }
    [(MPCPlaybackEngine *)v10->_underlyingPlaybackEngine setAudioAnalyzerEnabled:1];
    if ((v6 & 4) == 0)
    {
LABEL_7:
      if ((v6 & 8) == 0) {
        goto LABEL_8;
      }
      goto LABEL_15;
    }
LABEL_14:
    [(MPCPlaybackEngine *)v10->_underlyingPlaybackEngine setPictureInPictureSupported:1];
    if ((v6 & 8) == 0)
    {
LABEL_8:
      if ((v6 & 0x10) == 0)
      {
LABEL_10:
        v15 = v10->_underlyingPlaybackEngine;
        v16 = [v9 _underlyingPlaybackIntent];
        [(MPCPlaybackEngine *)v15 setFallbackPlaybackIntent:v16];

        goto LABEL_11;
      }
LABEL_9:
      [(MPCPlaybackEngine *)v10->_underlyingPlaybackEngine setStateRestorationSupported:1];
      goto LABEL_10;
    }
LABEL_15:
    [(MPCPlaybackEngine *)v10->_underlyingPlaybackEngine setVideoSupported:1];
    if ((v6 & 0x10) == 0) {
      goto LABEL_10;
    }
    goto LABEL_9;
  }
LABEL_11:

  return v10;
}

- (NSString)playerID
{
  return (NSString *)[(MPCPlaybackEngine *)self->_underlyingPlaybackEngine playerID];
}

- (BOOL)isStarted
{
  return [(MPCPlaybackEngine *)self->_underlyingPlaybackEngine isStarted];
}

- (BOOL)isSystemMusicApplication
{
  return [(MPCPlaybackEngine *)self->_underlyingPlaybackEngine isSystemMusicApplication];
}

- (void)setSystemMusicApplication:(BOOL)a3
{
}

- (BOOL)isAudioAnalyzerEnabled
{
  return [(MPCPlaybackEngine *)self->_underlyingPlaybackEngine isAudioAnalyzerEnabled];
}

- (void)setAudioAnalyzerEnabled:(BOOL)a3
{
}

- (BOOL)isPictureInPictureSupported
{
  return [(MPCPlaybackEngine *)self->_underlyingPlaybackEngine isPictureInPictureSupported];
}

- (void)setPictureInPictureSupported:(BOOL)a3
{
}

- (BOOL)isVideoSupported
{
  return [(MPCPlaybackEngine *)self->_underlyingPlaybackEngine isVideoSupported];
}

- (void)setVideoSupported:(BOOL)a3
{
}

- (BOOL)isStateRestorationSupported
{
  return [(MPCPlaybackEngine *)self->_underlyingPlaybackEngine isStateRestorationSupported];
}

- (void)setStateRestorationSupported:(BOOL)a3
{
}

- (void)start
{
}

- (void)becomeActive
{
}

- (void)restoreStateWithCompletion:(id)a3
{
}

- (void)musicKit_setSystemMusicApplication:(BOOL)a3
{
  self->_systemMusicApplication = a3;
}

- (void)musicKit_setAudioAnalyzerEnabled:(BOOL)a3
{
  self->_audioAnalyzerEnabled = a3;
}

- (void)musicKit_setPictureInPictureSupported:(BOOL)a3
{
  self->_pictureInPictureSupported = a3;
}

- (void)musicKit_setVideoSupported:(BOOL)a3
{
  self->_videoSupported = a3;
}

- (void)musicKit_setStateRestorationSupported:(BOOL)a3
{
  self->_stateRestorationSupported = a3;
}

- (void).cxx_destruct
{
}

@end