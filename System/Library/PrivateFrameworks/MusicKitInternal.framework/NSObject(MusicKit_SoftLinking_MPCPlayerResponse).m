@interface NSObject(MusicKit_SoftLinking_MPCPlayerResponse)
- (id)_musicKit_self_playerResponse;
- (id)musicKit_playerPath;
- (id)musicKit_playerResponse_pauseCommandRequest;
- (id)musicKit_playerResponse_playCommandRequest;
- (id)musicKit_playerResponse_stopCommandRequest;
- (id)musicKit_playerResponse_tracklist;
- (uint64_t)musicKit_playerResponse_state;
@end

@implementation NSObject(MusicKit_SoftLinking_MPCPlayerResponse)

- (id)musicKit_playerPath
{
  v1 = objc_msgSend(a1, "_musicKit_self_playerResponse");
  v2 = [v1 playerPath];

  return v2;
}

- (id)musicKit_playerResponse_pauseCommandRequest
{
  v1 = objc_msgSend(a1, "_musicKit_self_playerResponse");
  v2 = [v1 pause];

  return v2;
}

- (id)musicKit_playerResponse_playCommandRequest
{
  v1 = objc_msgSend(a1, "_musicKit_self_playerResponse");
  v2 = [v1 play];

  return v2;
}

- (uint64_t)musicKit_playerResponse_state
{
  v1 = objc_msgSend(a1, "_musicKit_self_playerResponse");
  uint64_t v2 = [v1 state];

  if ((unint64_t)(v2 - 1) > 5) {
    return 0;
  }
  else {
    return qword_1E099D648[v2 - 1];
  }
}

- (id)musicKit_playerResponse_stopCommandRequest
{
  v1 = objc_msgSend(a1, "_musicKit_self_playerResponse");
  uint64_t v2 = [v1 stop];

  return v2;
}

- (id)musicKit_playerResponse_tracklist
{
  v1 = objc_msgSend(a1, "_musicKit_self_playerResponse");
  uint64_t v2 = [v1 tracklist];

  return v2;
}

- (id)_musicKit_self_playerResponse
{
  uint64_t v7 = 0;
  v8 = &v7;
  uint64_t v9 = 0x2050000000;
  uint64_t v2 = (void *)getMPCPlayerResponseClass_softClass;
  uint64_t v10 = getMPCPlayerResponseClass_softClass;
  if (!getMPCPlayerResponseClass_softClass)
  {
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __getMPCPlayerResponseClass_block_invoke;
    v6[3] = &unk_1E6D453B0;
    v6[4] = &v7;
    __getMPCPlayerResponseClass_block_invoke((uint64_t)v6);
    uint64_t v2 = (void *)v8[3];
  }
  id v3 = v2;
  _Block_object_dispose(&v7, 8);
  if (objc_opt_isKindOfClass()) {
    id v4 = a1;
  }
  else {
    id v4 = 0;
  }
  return v4;
}

@end