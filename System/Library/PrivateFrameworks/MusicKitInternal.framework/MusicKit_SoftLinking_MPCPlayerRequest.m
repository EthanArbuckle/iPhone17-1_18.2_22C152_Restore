@interface MusicKit_SoftLinking_MPCPlayerRequest
- (MPCPlayerRequest)_underlyingPlayerRequest;
- (MusicKit_SoftLinking_MPCPlayerPath)playerPath;
- (MusicKit_SoftLinking_MPCPlayerRequest)initWithPath:(id)a3;
- (MusicKit_SoftLinking_MPCPlayerRequest)initWithUnderlyingPlayerRequest:(id)a3;
- (id)_errorFromUnderlyingError:(id)a3;
- (int64_t)forwardCount;
- (int64_t)historyCount;
- (void)performWithCompletion:(id)a3;
- (void)setForwardCount:(int64_t)a3;
- (void)setHistoryCount:(int64_t)a3;
- (void)setPlayerPath:(id)a3;
@end

@implementation MusicKit_SoftLinking_MPCPlayerRequest

- (id)_errorFromUnderlyingError:(id)a3
{
  id v3 = a3;
  v4 = [v3 domain];
  uint64_t v12 = 0;
  v13 = &v12;
  uint64_t v14 = 0x2020000000;
  v5 = (void *)getMPCPlayerEnqueueErrorDomainSymbolLoc_ptr;
  uint64_t v15 = getMPCPlayerEnqueueErrorDomainSymbolLoc_ptr;
  if (!getMPCPlayerEnqueueErrorDomainSymbolLoc_ptr)
  {
    v6 = (void *)MediaPlaybackCoreLibrary_0();
    v13[3] = (uint64_t)dlsym(v6, "MPCPlayerEnqueueErrorDomain");
    getMPCPlayerEnqueueErrorDomainSymbolLoc_ptr = v13[3];
    v5 = (void *)v13[3];
  }
  _Block_object_dispose(&v12, 8);
  if (!v5) {
    getMPRestrictionsMonitorAllowsExplicitContentDidChangeNotification_cold_1();
  }
  int v7 = [v4 isEqual:*v5];

  v8 = v3;
  if (v7)
  {
    uint64_t v9 = [v3 code];
    if ((unint64_t)(v9 - 1) > 4) {
      uint64_t v10 = 0;
    }
    else {
      uint64_t v10 = qword_1E099D5B0[v9 - 1];
    }
    v8 = [MEMORY[0x1E4F28C58] errorWithDomain:@"MusicKit_SoftLinking_MPCPlayerEnqueueErrorDomain" code:v10 userInfo:0];
  }
  return v8;
}

- (MusicKit_SoftLinking_MPCPlayerRequest)initWithPath:(id)a3
{
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)MusicKit_SoftLinking_MPCPlayerRequest;
  v5 = [(MusicKit_SoftLinking_MPCPlayerRequest *)&v19 init];
  if (v5)
  {
    uint64_t v21 = 0;
    v22 = &v21;
    uint64_t v23 = 0x2050000000;
    v6 = (void *)getMPCPlayerRequestClass_softClass;
    uint64_t v24 = getMPCPlayerRequestClass_softClass;
    if (!getMPCPlayerRequestClass_softClass)
    {
      v20[0] = MEMORY[0x1E4F143A8];
      v20[1] = 3221225472;
      v20[2] = __getMPCPlayerRequestClass_block_invoke;
      v20[3] = &unk_1E6D453B0;
      v20[4] = &v21;
      __getMPCPlayerRequestClass_block_invoke((uint64_t)v20);
      v6 = (void *)v22[3];
    }
    int v7 = v6;
    _Block_object_dispose(&v21, 8);
    v8 = (MPCPlayerRequest *)objc_alloc_init(v7);
    underlyingPlayerRequest = v5->_underlyingPlayerRequest;
    v5->_underlyingPlayerRequest = v8;

    uint64_t v10 = v5->_underlyingPlayerRequest;
    v11 = objc_msgSend(v4, "_musicKit_self_playerPath");
    [(MPCPlayerRequest *)v10 setPlayerPath:v11];

    uint64_t v12 = v5->_underlyingPlayerRequest;
    v13 = [MEMORY[0x1E4F38658] _playbackItemSupportedProperties];
    [(MPCPlayerRequest *)v12 setPlayingItemProperties:v13];

    uint64_t v14 = v5->_underlyingPlayerRequest;
    uint64_t v15 = [MEMORY[0x1E4F38658] _playbackItemSupportedProperties];
    [(MPCPlayerRequest *)v14 setQueueItemProperties:v15];

    v16 = v5->_underlyingPlayerRequest;
    v17 = [MEMORY[0x1E4F38658] _playbackSectionSupportedProperties];
    [(MPCPlayerRequest *)v16 setQueueSectionProperties:v17];

    [(MPCPlayerRequest *)v5->_underlyingPlayerRequest setQualityOfService:25];
  }

  return v5;
}

- (MPCPlayerRequest)_underlyingPlayerRequest
{
  return self->_underlyingPlayerRequest;
}

- (void)performWithCompletion:(id)a3
{
  id v4 = a3;
  underlyingPlayerRequest = self->_underlyingPlayerRequest;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __63__MusicKit_SoftLinking_MPCPlayerRequest_performWithCompletion___block_invoke;
  v8[3] = &unk_1E6D455D8;
  v8[4] = self;
  id v9 = v4;
  id v6 = v4;
  id v7 = (id)[(MPCPlayerRequest *)underlyingPlayerRequest performWithCompletion:v8];
}

- (MusicKit_SoftLinking_MPCPlayerRequest)initWithUnderlyingPlayerRequest:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MusicKit_SoftLinking_MPCPlayerRequest;
  id v6 = [(MusicKit_SoftLinking_MPCPlayerRequest *)&v9 init];
  id v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_underlyingPlayerRequest, a3);
  }

  return v7;
}

- (MusicKit_SoftLinking_MPCPlayerPath)playerPath
{
  return (MusicKit_SoftLinking_MPCPlayerPath *)[(MPCPlayerRequest *)self->_underlyingPlayerRequest playerPath];
}

- (int64_t)forwardCount
{
  [(MPCPlayerRequest *)self->_underlyingPlayerRequest tracklistRange];
  return v2;
}

- (void)setForwardCount:(int64_t)a3
{
  int64_t v5 = [(MusicKit_SoftLinking_MPCPlayerRequest *)self historyCount];
  underlyingPlayerRequest = self->_underlyingPlayerRequest;
  -[MPCPlayerRequest setTracklistRange:](underlyingPlayerRequest, "setTracklistRange:", v5, a3);
}

- (int64_t)historyCount
{
  return [(MPCPlayerRequest *)self->_underlyingPlayerRequest tracklistRange];
}

- (void)setHistoryCount:(int64_t)a3
{
  int64_t v5 = [(MusicKit_SoftLinking_MPCPlayerRequest *)self forwardCount];
  underlyingPlayerRequest = self->_underlyingPlayerRequest;
  -[MPCPlayerRequest setTracklistRange:](underlyingPlayerRequest, "setTracklistRange:", a3, v5);
}

- (void)setPlayerPath:(id)a3
{
}

- (void).cxx_destruct
{
}

@end