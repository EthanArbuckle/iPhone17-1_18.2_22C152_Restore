@interface MusicKit_RemoteRadioStationPlaybackQueue
- (MusicKit_RemoteRadioStationPlaybackQueue)initWithItem:(id)a3 replaceQueueIntent:(int64_t)a4;
- (void)setQueueWithPath:(id)a3 sessionID:(id)a4 completionHandler:(id)a5;
@end

@implementation MusicKit_RemoteRadioStationPlaybackQueue

- (MusicKit_RemoteRadioStationPlaybackQueue)initWithItem:(id)a3 replaceQueueIntent:(int64_t)a4
{
  id v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MusicKit_RemoteRadioStationPlaybackQueue;
  v7 = [(MusicKit_RemotePlaybackQueue *)&v11 initWithReplaceQueueIntent:a4];
  if (v7)
  {
    uint64_t v8 = [v6 _underlyingModelObject];
    underlyingStation = v7->_underlyingStation;
    v7->_underlyingStation = (MPModelRadioStation *)v8;
  }
  return v7;
}

- (void)setQueueWithPath:(id)a3 sessionID:(id)a4 completionHandler:(id)a5
{
  v34[3] = *MEMORY[0x1E4F143B8];
  id v25 = a3;
  id v8 = a4;
  v9 = (void (**)(id, void, id))a5;
  v10 = [(MPModelRadioStation *)self->_underlyingStation identifiers];
  objc_super v11 = [v10 radio];
  v12 = [v11 stationStringID];

  uint64_t v13 = MRSystemAppPlaybackQueueCreate();
  MRSystemAppPlaybackQueueSetRadioStationIDType();
  MRSystemAppPlaybackQueueSetRadioStationStringIdentifier();
  MRSystemAppPlaybackQueueSetIsRequestingImmediatePlayback();
  uint64_t v29 = 0;
  v30 = &v29;
  uint64_t v31 = 0x2050000000;
  v14 = (void *)getMPRemotePlaybackQueueClass_softClass;
  uint64_t v32 = getMPRemotePlaybackQueueClass_softClass;
  if (!getMPRemotePlaybackQueueClass_softClass)
  {
    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    v28[2] = __getMPRemotePlaybackQueueClass_block_invoke;
    v28[3] = &unk_1E6D453B0;
    v28[4] = &v29;
    __getMPRemotePlaybackQueueClass_block_invoke((uint64_t)v28);
    v14 = (void *)v30[3];
  }
  id v15 = v14;
  _Block_object_dispose(&v29, 8);
  id v16 = [v15 queueWithMediaRemotePlaybackQueue:v13];
  [v16 _mediaRemotePlaybackQueue];
  [(MusicKit_RemotePlaybackQueue *)self mrReplaceIntentFromMusicKitReplaceQueueIntent:[(MusicKit_RemotePlaybackQueue *)self replaceQueueIntent]];
  MRSystemAppPlaybackQueueSetReplaceIntent();
  MRSystemAppPlaybackQueueSetIsRequestingImmediatePlayback();
  id v17 = v8;
  v18 = v17;
  if (!v17)
  {
    v19 = +[MusicKit_PlayerPathSessionManager sharedSessionManager];
    v18 = [v19 sessionIDForPlayerPath:v25];
  }
  ExternalRepresentation = (void *)MRSystemAppPlaybackQueueCreateExternalRepresentation();
  uint64_t v21 = *MEMORY[0x1E4F77688];
  v33[0] = *MEMORY[0x1E4F777D0];
  v33[1] = v21;
  v34[0] = ExternalRepresentation;
  v34[1] = v18;
  v33[2] = *MEMORY[0x1E4F77648];
  v34[2] = MEMORY[0x1E4F1CC38];
  v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v34 forKeys:v33 count:3];
  id v27 = 0;
  v23 = [(MusicKit_RemotePlaybackQueue *)self mrPlayerPathFromPlaybackPath:v25 error:&v27];
  id v24 = v27;
  if (v24)
  {
    if (v9) {
      v9[2](v9, 0, v24);
    }
  }
  else
  {
    v26 = v9;
    MRMediaRemoteSendCommandToPlayerWithResult();
  }
}

- (void).cxx_destruct
{
}

@end