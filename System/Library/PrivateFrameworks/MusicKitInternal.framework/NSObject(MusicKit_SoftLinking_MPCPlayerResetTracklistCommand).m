@interface NSObject(MusicKit_SoftLinking_MPCPlayerResetTracklistCommand)
- (id)_musicKit_self_resetTracklistCommand;
- (id)musicKit_resetTracklistCommand_clearCommandRequest;
- (id)musicKit_resetTracklistCommand_clearUpNextItemsCommandRequest;
- (id)musicKit_resetTracklistCommand_replaceCommandRequestWithPlaybackIntent:()MusicKit_SoftLinking_MPCPlayerResetTracklistCommand replaceIntent:;
@end

@implementation NSObject(MusicKit_SoftLinking_MPCPlayerResetTracklistCommand)

- (id)musicKit_resetTracklistCommand_clearUpNextItemsCommandRequest
{
  v1 = objc_msgSend(a1, "_musicKit_self_resetTracklistCommand");
  v2 = [v1 clearUpNextItems];

  return v2;
}

- (id)_musicKit_self_resetTracklistCommand
{
  if ([a1 conformsToProtocol:&unk_1F3B8EF48]) {
    id v2 = a1;
  }
  else {
    id v2 = 0;
  }
  return v2;
}

- (id)musicKit_resetTracklistCommand_replaceCommandRequestWithPlaybackIntent:()MusicKit_SoftLinking_MPCPlayerResetTracklistCommand replaceIntent:
{
  if ((unint64_t)(a4 - 1) >= 3) {
    uint64_t v5 = 0;
  }
  else {
    uint64_t v5 = a4;
  }
  id v6 = a3;
  v7 = objc_msgSend(a1, "_musicKit_self_resetTracklistCommand");
  v8 = [v6 _underlyingPlaybackIntent];

  v9 = [v7 replaceWithPlaybackIntent:v8 replaceIntent:v5];

  return v9;
}

- (id)musicKit_resetTracklistCommand_clearCommandRequest
{
  v1 = objc_msgSend(a1, "_musicKit_self_resetTracklistCommand");
  id v2 = [v1 clear];

  return v2;
}

@end